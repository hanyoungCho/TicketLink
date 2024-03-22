unit Setting.TLSettingForm;

interface

uses
  { Native }
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.NumberBox, System.IniFiles,
  System.Win.Registry,
  { Chilkat DLL API }
  Chilkat.Global, Chilkat.JsonObject, Chilkat.JsonArray, Chilkat.CkDateTime,
  { Indy }
  IdGlobal, IdHTTP, IdSSLOpenSSL, IdURI,
  { VAN Module }
  uVanDaemonModule,
  //uVanKcpModul,
  { Project }
  Common.TLCipher;

{$I ..\common\Common.TLGlobal.inc}

type
  { 메인 폼 }
  TTLSettingForm = class(TForm)
    panHeader: TPanel;
    panFooter: TPanel;
    panBody: TPanel;
    btnApply: TButton;
    btnClose: TButton;
    gbxGeneral: TGroupBox;
    edtServerHost: TEdit;
    lblServerHost: TLabel;
    edtServerToken: TEdit;
    lblServerToken: TLabel;
    lblPartnerNo: TLabel;
    lblCounterNo: TLabel;
    edtStoreBizNo: TEdit;
    lblStoreBizNo: TLabel;
    edtPartnerNo: TNumberBox;
    edtCounterNo: TNumberBox;
    edtVanCode: TEdit;
    lblVanCode: TLabel;
    ckbAutoStart: TCheckBox;
    ckbUsePG: TCheckBox;
    gbxPayco: TGroupBox;
    lblPaycoVanTID: TLabel;
    edtPaycoVanTID: TEdit;
    lblVanTID: TLabel;
    edtVanTID: TEdit;
    lblPaycoHost: TLabel;
    edtPaycoHost: TEdit;
    edtPaycoRegUri: TEdit;
    lblPaycoRegUri: TLabel;
    edtPaycoApprovalUri: TEdit;
    lblPaycoApprovalUri: TLabel;
    edtPaycoCancelUri: TEdit;
    lblPaycoCancelUri: TLabel;
    lblPaycoNetCancelUri: TLabel;
    edtPaycoNetCancelUri: TEdit;
    btnICReaderVerify: TButton;
    btnPaycoPosReg: TButton;
    mmoLog: TMemo;
    gbxLauncher: TGroupBox;
    Label1: TLabel;
    edtDeployHost: TEdit;
    lblSiteCd: TLabel;
    edtSiteCode: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnApplyClick(Sender: TObject);
    procedure btnICReaderVerifyClick(Sender: TObject);
    procedure btnPaycoPosRegClick(Sender: TObject);
    procedure panHeaderMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure edtServerTokenDblClick(Sender: TObject);
  private
    { Private declarations }
    FConfigLauncher: TIniFile; //런처 설정 INI 파일
    FConfigRegistry: TRegistryIniFile; //시스템 설정 레지스트리
    FLbCipher: TLbCipher; //암,복호화 클래스
    FVanModule: TVanDaemonModule; //VAN모듈
    //FVanModule: TVanKcpDaemon; //VAN모듈
    FPaycoPosTID: string;
    FPaycoAPIKey: string;
    FPaycoMerchantKey: string;
    FPaycoMerchantName: string;
    FHomeDir: string;
    FConfigDir: string;
    FLogDir: string;

    procedure CheckSetting;
    procedure LoadSetting;
    procedure SaveSetting;

    function DoICReaderVerify(var AErrMsg: string): Boolean;
    function RequestToPAYCO(const AUrl, AJobName: string; const AReqJSON: string; var ARespJSON: string; AResMsg: string): Boolean;
    function DoCertifyPAYCO(var AResMsg: string): Boolean;

    procedure AddLog(const ALogMsg: string);
  public
    { Public declarations }
  end;

var
  TLSettingForm: TTLSettingForm;

implementation

uses
  { Native }
  System.StrUtils,
  { Project }
  Common.TLCommonLib;

{$R *.dfm}

procedure TTLSettingForm.FormCreate(Sender: TObject);
begin
  FHomeDir := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
  FConfigDir := FHomeDir + 'config\';
  FLogDir := FHomeDir + 'log\';
  ForceDirectories(fLogDir);

  MakeRoundedControl(Self, 20, 20);
  SetDoubleBuffered(Self, True);

  FVanModule := TVanDaemonModule.Create;
  //FVanModule := TVanKcpDaemon.Create;
  FLbCipher := TLbCipher.Create;
  FConfigLauncher := TIniFile.Create(FConfigDir + 'TLLauncher.config');
  FConfigRegistry := TRegistryIniFile.Create(CCC_TICKETLINK_REGISTRY_KEY);
  CheckSetting;
  LoadSetting;
end;

procedure TTLSettingForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FVanModule.Free;
  FreeAndNil(FLbCipher);
end;

procedure TTLSettingForm.btnApplyClick(Sender: TObject);
begin
  SaveSetting;
  MessageBox(0, PChar('설정값을 저장하였습니다!'), PChar('알림'), MB_ICONINFORMATION or MB_OK or MB_TOPMOST or MB_APPLMODAL);
end;

procedure TTLSettingForm.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TTLSettingForm.btnICReaderVerifyClick(Sender: TObject);
var
  LErrMsg: string;
begin
  if (Trim(edtVANCode.Text) = '') or
     (Trim(edtVANTID.Text) = '') then
  begin
    MessageBox(0, PChar('VAN사 코드, VAN-TID는 필수 입력값입니다!'), PChar('알림'), MB_ICONWARNING or MB_OK or MB_TOPMOST or MB_APPLMODAL);
    Exit;
  end;

  try
    if not DoICReaderVerify(LErrMsg) then
      raise Exception.Create(LErrMsg);

    MessageBox(0, PChar('단말기 무결성 테스트에 성공하였습니다!'), PChar('알림'), MB_ICONINFORMATION or MB_OK or MB_TOPMOST or MB_APPLMODAL);
  except
    on E: Exception do
      MessageBox(0, PChar('단말기 무결성 테스트 실패!'#13#10 + E.Message), PChar('알림'), MB_ICONERROR or MB_OK or MB_TOPMOST or MB_APPLMODAL);
  end;
end;

procedure TTLSettingForm.btnPaycoPosRegClick(Sender: TObject);
var
  LErrMsg: string;
begin
  if (Trim(edtVanCode.Text) = '') or
     (Trim(edtPaycoVanTID.Text) = '') or
     (Trim(edtStoreBizNo.Text) = '') then
  begin
    MessageBox(0, PChar('VAN사 코드, VAN-TID 및 사업자등록번호는 필수 입력값입니다!'), PChar('알림'), MB_ICONWARNING or MB_OK or MB_TOPMOST or MB_APPLMODAL);
    Exit;
  end;

  try
    if not DoCertifyPAYCO(LErrMsg) then
      raise Exception.Create(LErrMsg);

    MessageBox(0, PChar('PAYCO POS 등록 테스트에 성공하였습니다!'), PChar('알림'), MB_ICONINFORMATION or MB_OK or MB_TOPMOST or MB_APPLMODAL);
  except
    on E: Exception do
      MessageBox(0, PChar('PAYCO POS 등록 테스트 실패!'#13#10 + E.Message), PChar('알림'), MB_ICONERROR or MB_OK or MB_TOPMOST or MB_APPLMODAL);
  end;
end;

procedure TTLSettingForm.panHeaderMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  PostMessage(Self.Handle, WM_SYSCOMMAND, $F012, 0);
end;

procedure TTLSettingForm.edtServerTokenDblClick(Sender: TObject);
begin
  with TEdit(Sender) do
    if (PasswordChar = #0) then
      PasswordChar := #42
    else
      PasswordChar := #0;
end;

procedure TTLSettingForm.CheckSetting;
begin
  try
    with FConfigLauncher do
    begin
      if not SectionExists('Config') then
      begin
        WriteString('Config', 'UpdateURL', CCC_CDN_SERVER_HOST);
        WriteString('Config', 'RunApp', 'TLKiosk.exe');
        WriteString('Config', 'Params', '/run');
        WriteInteger('Config', 'Delay', 0);
        WriteInteger('Config', 'WatchInterval', 0);
        WriteInteger('Config', 'RebootWhenUpdated', 0);
        WriteString('Config', 'ExtAppList', '');
      end;
    end;

    with FConfigRegistry do
    begin
      if not SectionExists('Server') then
      begin
        WriteString('Server', 'Host', CCC_API_SERVER_HOST);
        WriteString('Server', 'Token', '');
      end;

      if not SectionExists('StoreInfo') then
      begin
        WriteBool('Setting', 'AutoStart', False);
        WriteInteger('StoreInfo', 'PartnerNo', 0);
        WriteInteger('StoreInfo', 'CounterNo', 0);
        WriteString('StoreInfo', 'StoreBizNo', '');
        WriteBool('StoreInfo', 'UsePG', True);
        WriteString('StoreInfo', 'VanCode', CCC_KCP_VAN_CD);
        WriteString('StoreInfo', 'VanTID', '');
      end;

      if not SectionExists('PAYCO') then
      begin
        WriteString('PAYCO', 'VanTID', '');
        WriteString('PAYCO', 'Host', CCC_PAYCO_HOST);
        WriteString('PAYCO', 'RegUri', CCC_PAYCO_REG_URI);
        WriteString('PAYCO', 'ApprovalUri', CCC_PAYCO_APPROVAL_URI);
        WriteString('PAYCO', 'CancelUri', CCC_PAYCO_CANCEL_URI);
        WriteString('PAYCO', 'NetCancelUri', CCC_PAYCO_NET_CANCEL_URI);
        WriteString('PAYCO', 'PosTID', '');
        WriteString('PAYCO', 'APIKey', '');
      end;
    end;
  except
    on E: Exception do
      AddLog(Format('CheckSetting.Exception = %s', [E.Message]));
  end;
end;

procedure TTLSettingForm.LoadSetting;
begin
  try
    with FConfigLauncher do
    begin
      edtDeployHost.Text := ReadString('Config', 'UpdateURL', CCC_CDN_SERVER_HOST);
    end;

    with FConfigRegistry do
    begin
      edtServerHost.Text := ReadString('Server', 'Host', CCC_API_SERVER_HOST);
      edtServerToken.Text := FLbCipher.GetDecryptedString(ReadString('Server', 'Token', ''));

      ckbAutoStart.Checked := ReadBool('StoreInfo', 'AutoStart', False);
      edtPartnerNo.Value := ReadInteger('StoreInfo', 'PartnerNo', 0);
      edtCounterNo.Value := ReadInteger('StoreInfo', 'CounterNo', 0);
      edtStoreBizNo.Text := ReadString('StoreInfo', 'StoreBizNo', '');
      ckbUsePG.Checked := ReadBool('StoreInfo', 'UsePG', True);
      edtVANCode.Text := ReadString('StoreInfo', 'VanCode', CCC_KCP_VAN_CD);
      edtSiteCode.Text := ReadString('StoreInfo', 'SiteCode', '');
      edtVANTID.Text := ReadString('StoreInfo', 'VanTID', '');

      edtPaycoVanTID.Text := ReadString('PAYCO', 'VanTID', '');
      edtPaycoHost.Text := ReadString('PAYCO', 'Host', '');
      edtPaycoRegUri.Text := ReadString('PAYCO', 'RegUri', '');
      edtPaycoApprovalUri.Text := ReadString('PAYCO', 'ApprovalUri', '');
      edtPaycoCancelUri.Text := ReadString('PAYCO', 'CancelUri', '');
      edtPaycoNetCancelUri.Text := ReadString('PAYCO', 'NetCancelUri', '');
      FPaycoPosTID := ReadString('PAYCO', 'PosTID', '');
      FPaycoAPIKey := FLbCipher.GetDecryptedString(ReadString('PAYCO', 'APIKey', ''));
    end;
  except
    on E: Exception do
      AddLog(Format('LoadSetting.Exception = %s', [E.Message]));
  end;
end;

procedure TTLSettingForm.SaveSetting;
begin
  try
    with FConfigLauncher do
    begin
      WriteString('Config', 'UpdateURL', Trim(edtDeployHost.Text));
    end;

    with FConfigRegistry do
    begin
      WriteString('Server', 'Host', Trim(edtServerHost.Text));
      WriteString('Server', 'Token', FLbCipher.GetEncryptedString(Trim(edtServerToken.Text)));

      WriteBool('StoreInfo', 'AutoStart', ckbAutoStart.Checked);
      WriteInteger('StoreInfo', 'PartnerNo', Trunc(edtPartnerNo.Value));
      WriteInteger('StoreInfo', 'CounterNo', Trunc(edtCounterNo.Value));
      WriteString('StoreInfo', 'StoreBizNo', Trim(edtStoreBizNo.Text));
      WriteBool('StoreInfo', 'UsePG', ckbUsePG.Checked);
      WriteString('StoreInfo', 'VanCode', Trim(edtVanCode.Text));
      WriteString('StoreInfo', 'SiteCode', Trim(edtSiteCode.Text));
      WriteString('StoreInfo', 'VanTID', Trim(edtVanTID.Text));

      WriteString('PAYCO', 'VanTID', Trim(edtPaycoVanTID.Text));
      WriteString('PAYCO', 'Host', Trim(edtPaycoHost.Text));
      WriteString('PAYCO', 'RegUri', Trim(edtPaycoRegUri.Text));
      WriteString('PAYCO', 'ApprovalUri', Trim(edtPaycoApprovalUri.Text));
      WriteString('PAYCO', 'CancelUri', Trim(edtPaycoCancelUri.Text));
      WriteString('PAYCO', 'NetCancelUri', Trim(edtPaycoNetCancelUri.Text));
      WriteString('PAYCO', 'PosTID', FPaycoPosTID);
      WriteString('PAYCO', 'APIKey', FLbCipher.GetEncryptedString(FPaycoAPIKey));
      WriteString('PAYCO', 'MerchantKey', FPaycoMerchantKey);
    end;
{$IFNDEF DEBUG}
    if ckbAutoStart.Checked then
    begin
      RunOnWindownStart(CCC_LAUNCHER_TITLE, FHomeDir + CCC_LAUNCHER_NAME + '.exe', False)
    end
    else
      RemoveFromRunOnWindowStart(CCC_LAUNCHER_TITLE);
{$ENDIF}
  except
    on E: Exception do
      AddLog(Format('SaveSetting.Exception = %s', [E.Message]));
  end;
end;

function TTLSettingForm.DoICReaderVerify(var AErrMsg: string): Boolean;
var
  LMsg: Ansistring;
begin
  Result := False;
  AErrMsg := '';
  AddLog('[ 단말기 무결성 검사 테스트 시작 ]');
  try
    try
      FVanModule.VanCode := Trim(edtVanCode.Text);
      FVanModule.ApplyConfigAll;
      //if (not FVanModule.CallICReaderVerify(Trim(edtVanTID.Text), LMsg)) then
      if (not FVanModule.CallICReaderVerify) then
        raise Exception.Create(LMsg);

      AddLog('Result.Success');
      Result := True;
    except
      on E: Exception do
      begin
        AErrMsg := E.Message;
        AddLog(Format('Exception = %s', [E.Message]));
      end;
    end;
  finally
    AddLog('[ 단말기 무결성 검사 테스트 종료 ]');
  end;
end;

function TTLSettingForm.RequestToPAYCO(const AUrl, AJobName: string; const AReqJSON: string; var ARespJSON: string; AResMsg: string): Boolean;
var
  HC: TIdHTTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL;
  RS, SS: TStringStream;
begin
  Result := False;
  AResMsg := '';
  SS := TStringStream.Create(AReqJson, TEncoding.UTF8);
  RS := TStringStream.Create;
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  HC := TIdHTTP.Create(nil);
  try
    try
      AddLog(Format('RequestToPAYCO.%s = %s', [AJobName, AUrl]));
      SS.SaveToFile(FLogDir + Format('%s.Request.json', [AJobName]));
      SSL.SSLOptions.Method := sslvSSLv23;
      SSL.SSLOptions.Mode := sslmClient;
      HC.Request.Method := Id_HTTPMethodPost;
      HC.Request.ContentType := 'application/json';
      HC.URL.URI := Trim(edtPaycoHost.Text);
      HC.IOHandler := SSL;
      HC.HandleRedirects := False;
      HC.ConnectTimeout := IdTimeoutDefault;
      HC.ReadTimeout := IdTimeoutDefault;
      HC.Post(AUrl, SS, RS);

      ARespJson := TEncoding.UTF8.GetString(RS.Bytes, 0, RS.Size);
      RS.SaveToFile(FLogDir + Format('%s.Response.json', [AJobName]));
      Result := True;
    except
      on E: EIdHTTPProtocolException do
        AResMsg := E.Message;
      on E: Exception do
        AResMsg := E.Message;
    end;
  finally
    HC.Disconnect;
    HC.Free;
    FreeAndNil(SS);
    FreeAndNil(RS);
    FreeAndNil(SSL);
  end;
end;

function TTLSettingForm.DoCertifyPAYCO(var AResMsg: string): Boolean;
var
  JO: HCkJsonObject;
  LPaycoVanTID, LBizNo, LUrl, LReqJSON, LRespJSON: string;
  LResCode: Integer;
begin
  Result := False;
  AResMsg := '';
  LPaycoVanTID := Trim(edtPaycoVanTID.Text);
  LBizNo := Trim(edtStoreBizNo.Text);
  LBizNo := IfThen(LPaycoVanTID = CCC_DEV_PAYCO_TID, CCC_DEV_PAYCO_BIZNO, LBizNo);
  AddLog('[ PAYCO POS 등록 테스트 시작 ]');
  JO := CkJsonObject_Create;
  try
    try
      LUrl := Trim(edtPaycoHost.Text) + Trim(edtPaycoRegUri.Text);
      CkJsonObject_AddStringAt(JO, -1, 'posType', PWideChar('POS'));
      CkJsonObject_AddStringAt(JO, -1, 'registrationNumber', PWideChar(LBizNo));
      CkJsonObject_AddStringAt(JO, -1, 'vanCorpCode', PWideChar(Trim(edtVanCode.Text)));
      CkJsonObject_AddStringAt(JO, -1, 'vanPosTid', PWideChar(LPaycoVanTID));
      CkJsonObject_AddStringAt(JO, -1, 'posDevCorpName', PWideChar(CCC_PAYCO_POS_DEV_CORP));
      CkJsonObject_AddStringAt(JO, -1, 'posSolutionName', PWideChar(CCC_PAYCO_POS_SOLUTION));
      CkJsonObject_AddStringAt(JO, -1, 'posSolutionVersion', PWideChar('1.0.0.0'));
      LReqJSON := CkJsonObject__emit(JO);
      if not RequestToPAYCO(LUrl, 'DoCertifyPAYCO', LReqJSON, LRespJSON, AResMsg) then
        raise Exception.Create(AResMsg);
      if not CkJsonObject_Load(JO, PWideChar(LRespJSON)) then
        raise Exception.Create(CkJsonObject__lastErrorText(JO));

      LResCode := CkJsonObject_IntOf(JO, 'resultCode');
      AResMsg := CkJsonObject__stringOf(JO, 'message');
      if (LResCode <> 0) then
        raise Exception.Create(AResMsg);

      Result := True;
      FPaycoPosTID := CkJsonObject__stringOf(JO, 'result.posTid');
      FPaycoAPIKey := CkJsonObject__stringOf(JO, 'result.apiKey');
      FPaycoMerchantKey := CkJsonObject__stringOf(JO, 'result.merchantKey');
      FPaycoMerchantName := CkJsonObject__stringOf(JO, 'result.merchantName');
      AddLog(Format('resultCode = %d', [CkJsonObject_IntOf(JO, 'resultCode')]));
      AddLog(Format('message = %s', [CkJsonObject__stringOf(JO, 'message')]));
      AddLog(Format('result.posTid = %s', [FPaycoPosTID]));
      AddLog(Format('result.apiKey = %s', [FPaycoAPIKey]));
      AddLog(Format('result.merchantKey = %s', [FPaycoMerchantKey]));
      AddLog(Format('result.merchantName = %s', [FPaycoMerchantName]));
    except
      on E: Exception do
      begin
        AResMsg := E.Message;
        AddLog(Format('Exception = %s', [AResMsg]));
      end;
    end;
  finally
    CkJsonObject_Dispose(JO);
    AddLog('[ PAYCO POS 등록 테스트 종료 ]');
  end;
end;

procedure TTLSettingForm.AddLog(const ALogMsg: string);
begin
  with mmoLog do
  begin
    Lines.Add(ALogMsg);
    SelLength := 0;
    SelStart := GetTextLen - 1;
  end;
end;

end.
