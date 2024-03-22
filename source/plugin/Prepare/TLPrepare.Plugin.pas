unit TLPrepare.Plugin;

interface

uses
  { Native }
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Forms, Vcl.Controls,
  Vcl.StdCtrls, Vcl.ExtCtrls,
  { Plugin System }
  uPluginManager, uPluginModule, uPluginMessages,
  { Indy }
  IdComponent,
  { SolbiLib }
  ProgressWheel;

{$I ..\..\common\Common.TLGlobal.inc}

const
  LCN_PROGRESS_MAX = 11;

type
  TPrepareStatus = record
    IsInit: Boolean;
    IsLocalDB: Boolean;
    IsGetSetting: Boolean;
    IsGetProductList: Boolean;
    IsGetContentsList: Boolean;
    IsContentsDownload: Boolean;
    IsOpenBarcodeScanner: Boolean;
    IsOpenReceiptPrinter: Boolean;
    //IsOpenTicketPrinter: Boolean;
    IsICReaderVerify: Boolean;
    IsPAYCOCertify: Boolean;
  end;

  TPluginForm = class(TPluginModule)
    tmrRunOnce: TTimer;
    panPrepareProgress: TPanel;
    pgwPrepareTotal: TProgressWheel;
    pgwPrepareCurrent: TProgressWheel;
    lblPrepareMsg: TLabel;

    procedure PluginModuleClose(Sender: TObject; var Action: TCloseAction);
    procedure PluginModuleResize(Sender: TObject);
    procedure PluginModuleMessage(Sender: TObject; AMsg: TPluginMessage);
    function DoPrepare: Boolean;
    function DoDownloadContents(AContentList: TList; const AExposureKind: string; var AErrMsg: string): Boolean;
    procedure tmrRunOnceTimer(Sender: TObject);
    procedure PluginModuleActivate(Sender: TObject);
    procedure PluginModuleDeactivate(Sender: TObject);
  private
    { Private declarations }
    FOwnerID: Integer;
    FIdleSeconds: DWord;
    FPrepareStatus: TPrepareStatus;
    FPrepareSuccess: Boolean;
    FPrepareRetry: Integer;
    FPrepareType: Integer;

    procedure ProcessMessages(AMsg: TPluginMessage);
    function OpenBarcodeScanner(var AErrMsg: string): Boolean;
    function OpenReceiptPrinter(var AErrMsg: string): Boolean;
    function OpenTicketPrinter(var AErrMsg: string): Boolean;
//    function OpenNFCReader(var AErrMsg: string): Boolean;
    procedure ApplyTheme;
    procedure HTTPDownloaderWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);
    procedure HTTPDownloaderWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
    procedure HTTPDownloaderWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; AMsg: TPluginMessage=nil); override;
    destructor Destroy; override;

    property IdleSeconds: DWord Read FIdleSeconds write FIdleSeconds;
  end;

implementation

uses
  { Indy }
  IdGlobal, IdHTTP, IdSSLOpenSSL, IdURI,
  { WinSoft }
  ComPort,
  { Project }
  Common.TLGlobal, Common.TLDM, Common.TLCommonLib, Common.MediaPlayThread;

{$R *.dfm}

{ TTLPrepareForm }

constructor TPluginForm.Create(AOwner: TComponent; AMsg: TPluginMessage);
begin
  inherited Create(AOwner, AMsg);

  FOwnerID := 0;

  SetDoubleBuffered(Self, True);
  Self.Top := Global.BaseScreenTop;
  Self.Left := Global.BaseScreenLeft;
  Self.Width := Global.BaseScreenWidth;
  Self.Height := Global.BaseScreenHeight;

  if Assigned(AMsg) then
    ProcessMessages(AMsg);

  tmrRunOnce.Interval := 100;
  tmrRunOnce.Enabled := True;
end;

destructor TPluginForm.Destroy;
begin
  inherited Destroy;
end;

procedure TPluginForm.PluginModuleClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TPluginForm.PluginModuleActivate(Sender: TObject);
begin
  Global.ThreadTimer.CheckIdle := False;
end;

procedure TPluginForm.PluginModuleDeactivate(Sender: TObject);
begin
  Global.ThreadTimer.CheckIdle := True;
end;

procedure TPluginForm.PluginModuleResize(Sender: TObject);
begin
  panPrepareProgress.Top := (panPrepareProgress.Parent.Height div 2) - (panPrepareProgress.Height div 2);
  panPrepareProgress.Left := (panPrepareProgress.Parent.Width div 2) - (panPrepareProgress.Width div 2);
  lblPrepareMsg.Top := panPrepareProgress.Top + 440;
end;

procedure TPluginForm.PluginModuleMessage(Sender: TObject; AMsg: TPluginMessage);
begin
  ProcessMessages(AMsg);
end;

procedure TPluginForm.ProcessMessages(AMsg: TPluginMessage);
begin
  if (AMsg.Command = CPC_INIT) then
  begin
    FOwnerID := AMsg.ParamByInteger(CPP_OWNER_ID);
    FPrepareType := AMsg.ParamByInteger(CPP_VALUE);
    ApplyTheme;
  end;

  if (AMsg.Command = CPC_SET_KIOSK_MODE) then
  begin
    var nMode := AMsg.ParamByInteger(CPP_VALUE);
    case nMode of
      KSM_CLOSE: //종료
        Self.Close;
    end;
  end;

  if (AMsg.Command = CPC_APPLY_THEME) then
    ApplyTheme;
end;

procedure TPluginForm.tmrRunOnceTimer(Sender: TObject);
begin
  with TTimer(Sender) do
  try
    Enabled := False;
    Interval := 5000;
    if not FPrepareSuccess then
    begin
      FPrepareSuccess := DoPrepare;
      if FPrepareSuccess then
        ModalResult := mrOK
      else
      begin
        Inc(FPrepareRetry);
        if (FPrepareRetry > 5) then
        begin
          FPrepareRetry := 0;
          ModalResult := mrCancel;
        end;
      end;
    end;
  finally
    if (not FPrepareSuccess) then
      Enabled := True
    else
      Free;
  end;
end;

function TPluginForm.DoPrepare: Boolean;
var
  LProgress: Integer;
  LJobName, LLocalDB, LTemplateDB, LErrMsg: string;

  procedure WorkStart(const AJobName: string; const AProgress: Integer);
  var
    LStatus: string;
  begin
    LStatus := Format('[%d/%d] %s 중...', [AProgress, LCN_PROGRESS_MAX, AJobName]);
    if (FPrepareRetry > 0) then
      LStatus := LStatus + _CRLF + Format('재시도(%d)', [FPrepareRetry]);

    lblPrepareMsg.Caption := LStatus;
    AddLog(Format('Prepare.DoPrepare.%s 시작', [AJobName]));
    Application.ProcessMessages;
  end;

  procedure WorkSuccess(const AJobName: string; const AProgress: Integer);
  begin
    pgwPrepareTotal.Position := Trunc((AProgress / LCN_PROGRESS_MAX) * 100);
    lblPrepareMsg.Caption  := Format('[%d/%d] %s 종료', [AProgress, LCN_PROGRESS_MAX, AJobName]);
    AddLog(Format('Prepare.DoPrepare.%s 종료', [AJobName]));
    Application.ProcessMessages;
  end;

  procedure WorkError(const AJobName, AErrMsg: string);
  var
    LStatus: string;
  begin
    LStatus := Format('[%d/%d] %s 실패' + #13#10 + '%s', [LProgress, LCN_PROGRESS_MAX, AJobName, AErrMsg]);
    if (FPrepareRetry > 0) then
      LStatus := LStatus + _CRLF + Format('재시도(%d)', [FPrepareRetry]);

    lblPrepareMsg.Caption := LStatus;
    AddLog(Format('Prepare.DoPrepare.%s 실패 = %s', [AJobName, AErrMsg]));
    Application.ProcessMessages;
  end;
begin
  Result := False;
  try
    LProgress := 1;
    LJobName := '시스템 구성요소 확인';
    WorkStart(LJobName, LProgress);
    if not FPrepareStatus.IsInit then
    begin
      FPrepareStatus.IsInit := True;
      WorkSuccess(LJobName, LProgress);
    end;

    Inc(LProgress);
    LJobName := '로컬 데이터베이스 접속';
    WorkStart(LJobName, LProgress);

    if (not FPrepareStatus.IsLocalDB) and (FPrepareType = 0) then
    begin
      LLocalDB := Global.DataDir + 'TicketLink.adb';
      if not DM.InitDB(LLocalDB, True, LErrMsg) then
      begin
        //템플리트 파일로 DB 복원 시작
        LTemplateDB := Global.DataDir + 'TicketLink_Template.adb';
        if not FileExists(LTemplateDB) then
          raise Exception.Create(LTemplateDB + ' 파일을 찾을 수 없습니다.');

        //이전 파일 백업
        CopyFile(PChar(LLocalDB), PChar(Format(Global.DataDir + 'TicketLink_%s.adb', [Global.CurrentDate])), False);
        //템플리트 파일로부터 새 DB 생성
        CopyFile(PChar(LTemplateDB), PChar(LLocalDB), False);
        //재접속 시도
        if not DM.InitDB(LLocalDB, False, LErrMsg) then
          raise Exception.Create(LErrMsg);
      end;

      FPrepareStatus.IsLocalDB := True;
      WorkSuccess(LJobName, LProgress);
    end;

    Inc(LProgress);
    LJobName := '기초 정보 수신';
    WorkStart(LJobName, LProgress);
    if not FPrepareStatus.IsGetSetting then
    begin
      if not DM.GetSettingInfo(LErrMsg) then
        raise Exception.Create(LErrMsg);

      FPrepareStatus.IsGetSetting := True;
      WorkSuccess(LJobName, LProgress);
    end;

    Inc(LProgress);
    LJobName := '상품 정보 수신';
    WorkStart(LJobName, LProgress);
    if not FPrepareStatus.IsGetProductList then
    begin
      if not DM.GetProductList(LErrMsg) then
        raise Exception.Create(LErrMsg);

      FPrepareStatus.IsGetProductList := True;
      WorkSuccess(LJobName, LProgress);
    end;

    Inc(LProgress);
    LJobName := '콘텐츠 정보 수신';
    WorkStart(LJobName, LProgress);
    if not FPrepareStatus.IsGetContentsList then
    begin
      if not DM.GetContentList(LErrMsg) then
        raise Exception.Create(LErrMsg);

      FPrepareStatus.IsGetContentsList := True;
      WorkSuccess(LJobName, LProgress);
    end;

    Inc(LProgress);
    LJobName := '콘텐츠 파일 다운로드';
    WorkStart(LJobName, LProgress);
    if not FPrepareStatus.IsContentsDownload then
    begin
      if not DoDownloadContents(Global.MainContentList, ATC_NORMAL, LErrMsg) then
        raise Exception.Create(LErrMsg);
      if not DoDownloadContents(Global.IdleContentList, ATC_FULL, LErrMsg) then
        raise Exception.Create(LErrMsg);

      FPrepareStatus.IsContentsDownload := True;
      WorkSuccess(LJobName, LProgress);
    end;

    Inc(LProgress);
    LJobName := '바코드 스캐너 검사';
    WorkStart(LJobName, LProgress);
    if not FPrepareStatus.IsOpenBarcodeScanner then
    begin
      if Global.BarcodeScanner.Enabled and
         (not OpenBarcodeScanner(LErrMsg)) then
      begin
        Global.BarcodeScanner.LastError := LErrMsg;
        raise Exception.Create(LErrMsg);
      end;

      FPrepareStatus.IsOpenBarcodeScanner := True;
      WorkSuccess(LJobName, LProgress);
    end;

    Inc(LProgress);
    LJobName := '영수증 프린터 검사';
    WorkStart(LJobName, LProgress);
    if not FPrepareStatus.IsOpenReceiptPrinter then
    begin
      if Global.ReceiptPrinter.Enabled and
         (not OpenReceiptPrinter(LErrMsg)) then
      begin
        Global.ReceiptPrinter.LastError := LErrMsg;
        raise Exception.Create(LErrMsg);
      end;

      FPrepareStatus.IsOpenReceiptPrinter := True;
      WorkSuccess(LJobName, LProgress);
    end;
    { chy test
    Inc(LProgress);
    LJobName := '티켓 프린터 검사';
    WorkStart(LJobName, LProgress);
    if not FPrepareStatus.IsOpenTicketPrinter then
    begin
      if Global.TicketPrinter.Enabled and
         (not OpenTicketPrinter(LErrMsg)) then
      begin
        Global.TicketPrinter.LastError := LErrMsg;
        raise Exception.Create(LErrMsg);
      end;

      FPrepareStatus.IsOpenTicketPrinter := True;
      WorkSuccess(LJobName, LProgress);
    end;
    }
    Inc(LProgress);
    LJobName := '신용카드 단말기 무결성 검사';
    WorkStart(LJobName, LProgress);
    if not FPrepareStatus.IsICReaderVerify then
    begin
      if Global.StoreInfo.AllowCreditCard and
         (not DM.DoICReaderVerify(Global.StoreInfo.VanCode, Global.StoreInfo.VanTID, LErrMsg)) then
      begin
        Global.StoreInfo.AllowCreditCard := False;
        Global.ICCardReader.LastError := LErrMsg;
      end;

      FPrepareStatus.IsICReaderVerify := True;
      WorkSuccess(LJobName, LProgress);
    end;

    Inc(LProgress);
    LJobName := 'PAYCO 단말기 인증';
    WorkStart(LJobName, LProgress);
    if not FPrepareStatus.IsPAYCOCertify then
    begin
      if Global.StoreInfo.AllowPAYCO and
         (Global.StoreInfo.PaycoPosTID.IsEmpty or Global.StoreInfo.PaycoAPIKey.IsEmpty) and
         (not DM.DoCertifyPAYCO(LErrMsg)) then
        Global.StoreInfo.AllowPAYCO := False;

      FPrepareStatus.IsPAYCOCertify := True;
      WorkSuccess(LJobName, LProgress);
    end;

    Result := True;
  except
    on E: Exception do
      WorkError(LJobName, E.Message);
  end;
end;

function TPluginForm.DoDownloadContents(AContentList: TList; const AExposureKind: string; var AErrMsg: string): Boolean;
const
  LCS_FMT_FILE_DATE = 'yyyy-mm-dd hh:nn';
var
  HC: TIdHTTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL;
  MS: TMemoryStream;
  LTotal, LCount, LFileHandle, LServerFileSize: Integer;
  LFileUrl, LFileName, LFileExt, LServerFileDate, LLocalFileDate: string;
  LDServerFileDate, LDLocalFileDate: TDateTime;
  LFileExists: Boolean;
begin
  Result := False;
  if Global.Downloading then
    Exit;

  AErrMsg := '';
  AddLog(Format('Prepare.DoDownloadContente(%s).Start', [AExposureKind]));
  Global.Downloading := True;

  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  MS := TMemoryStream.Create;
  HC := TIdHTTP.Create(nil);
  try
    try
      HC.OnWorkBegin := HTTPDownloaderWorkBegin;
      HC.OnWork := HTTPDownloaderWork;
      HC.OnWorkEnd := HTTPDownloaderWorkEnd;
      LCount := 0;
      LTotal := AContentList.Count;
      pgwPrepareTotal.Max := LTotal;
      pgwPrepareTotal.Position := 0;
      pgwPrepareCurrent.Position := 0;

      for var I: ShortInt := 0 to Pred(AContentList.Count) do
      begin
        LFileUrl := PContentInfo(AContentList.Items[I])^.FileUrl;
        LFileName := ExtractFileName(PContentInfo(AContentList.Items[I])^.FileName);
        LFileExt := LowerCase(LFileName);
        if (LowerCase(Copy(LFileUrl, 1, 8)) = 'https://') then
        begin
          SSL.SSLOptions.Method := sslvSSLv23;
          SSL.SSLOptions.Mode := sslmClient;
          HC.IOHandler := SSL;
        end;

        HC.Head(TIdURI.URLEncode(LFileUrl));
        LServerFileSize := HC.Response.ContentLength;
        LDServerFileDate := HC.Response.LastModified;
        LServerFileDate := FormatDateTime(LCS_FMT_FILE_DATE, LDServerFileDate, Global.FormatSettingsKR);
        LLocalFileDate  := FormatDateTime(LCS_FMT_FILE_DATE, LDServerFileDate - 1, Global.FormatSettingsKR);
        //로컬 파일의 날짜 정보 추출
        if FileExists(Global.ContentsDir + LFileName) then
        begin
          if not FileAge(Global.ContentsDir + LFileName, LDLocalFileDate) then
            raise Exception.Create('로컬 파일의 타임스탬프를 인식할 수 없습니다.');
          LLocalFileDate := FormatDateTime(LCS_FMT_FILE_DATE, LDLocalFileDate, Global.FormatSettingsKR);
        end;

        //로컬에 해당 파일이 존재하지 않거나,
        //존재하지만 서버의 파일과 날짜를 비교하여 서버 파일이 최신이면 업데이트
        LFileExists := FileExists(Global.ContentsDir + LFileName);
        if (not LFileExists) or
           (LFileExists and (LServerFileDate > LLocalFileDate)) then
        begin
          MS.Clear;
          HC.Disconnect;
          HC.HandleRedirects := False;
          HC.Get(TIdURI.URLEncode(LFileUrl), MS);
          ForceDirectories(ExtractFilePath(Global.DownloadDir + LFileName));
          MS.SaveToFile(Global.DownloadDir + LFileName);
          AddLog(Format('Prepare.DoDownloadContents(%s).Downloaded = (%d of %d) %s, %d KBytes', [AExposureKind, LCount, LTotal, LFileName, LServerFileSize div 1024]));

          //다운로드한 파일의 날짜를 서버 파일의 날짜로 변경
          GetFormatSettings;
          LFileHandle := FileOpen(Global.DownloadDir + LFileName, fmOpenReadWrite);
          try
            {$WARN SYMBOL_PLATFORM OFF}
            FileSetDate(LFileHandle, DateTimeToFileDate(LDServerFileDate));
            {$WARN SYMBOL_PLATFORM ON}
          finally
            FileClose(LFileHandle);
          end;

          //다운로드 파일 이동
          if FileExists(Global.DownloadDir + LFileName) then
          begin
            DeleteFile(Global.ContentsDir + LFileName);
            ForceDirectories(ExtractFilePath(Global.ContentsDir + LFileName));
            RenameFile(Global.DownloadDir + LFileName, Global.ContentsDir + LFileName);
          end;
        end;

        Inc(LCount);
        pgwPrepareTotal.Position := LCount;
      end;
      Result := True;
      AddLog(Format('Prepare.DoDownloadContents(%s).Completed', [AExposureKind]));
    except
      on E: Exception do
      begin
        AErrMsg := E.Message;
        AddLog(Format('Prepare.DoDownloadContents(%s).Exception = Url: %s, Error: %s', [AExposureKind, LFileUrl, E.Message]));
      end;
    end;
  finally
    Global.Downloading := False;
    FreeAndNil(MS);
    FreeAndNil(SSL);
    HC.Disconnect;
    FreeAndNil(HC);
  end;
end;

procedure TPluginForm.HTTPDownloaderWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);
begin
  pgwPrepareCurrent.Max := AWorkCountMax;
  pgwPrepareCurrent.Position := 0;
end;

procedure TPluginForm.HTTPDownloaderWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
begin
  pgwPrepareCurrent.Position := AWorkCount;
end;

procedure TPluginForm.HTTPDownloaderWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  pgwPrepareCurrent.Max := 100;
  pgwPrepareCurrent.Position := 0;
end;

function TPluginForm.OpenBarcodeScanner(var AErrMsg: string): Boolean;
var
  LDeviceName, LErrMsg: string;
  LRetry, LComPort, LBaudrate: Integer;
  LIsError: Boolean;
label
  GO_RETRY;
begin
  Result := False;
  LErrMsg := '';
  LRetry := 0;
  //=======
  GO_RETRY:
  //=======
  LIsError := False;
  LDeviceName := '바코드 스캐너';
  with Global.BarcodeScanner do
  try
    if not Assigned(ComDevice) then
      ComDevice := TComPort.Create(nil);

    if Enabled then
    begin
      LComPort := Port;
      LBaudrate := Baudrate;
      if not ComDevice.Active then
      begin
        ComDevice.DeviceName := 'COM' + IntToStr(LComPort);
        ComDevice.BaudRate := GetBaudRate(LBaudrate);
        ComDevice.Parity := TParity.paNone;
        ComDevice.DataBits := TDataBits.db8;
        ComDevice.StopBits := TStopBits.sb1;
        if not CheckEnumComPorts(LComPort, LErrMsg) then
          raise Exception.Create(LErrMsg);

        ComDevice.Open;
        Active := True;
      end;
      Result := True;
    end;
  except
    on E: Exception do
    begin
      Inc(LRetry);
      LIsError := True;
      LErrMsg := E.Message;
    end;
  end;

  if LIsError then
  begin
    if (LRetry < 5) then
    begin
      Sleep(100);
      goto GO_RETRY;
    end;

    AErrMsg := Format('%s 장치를 사용할 수 없습니다!', [LDeviceName]);
  end;
end;

function TPluginForm.OpenReceiptPrinter(var AErrMsg: string): Boolean;
var
  LDeviceName, LErrMsg: string;
  LRetry, LComPort, LBaudrate: Integer;
  LIsError: Boolean;
label
  GO_RETRY;
begin
  Result := False;
  LErrMsg := '';
  LRetry := 0;
  //=======
  GO_RETRY:
  //=======
  LIsError := False;
  LDeviceName := '영수증 프린터';
  with Global.ReceiptPrinter do
  try
    if not Assigned(ComDevice) then
      ComDevice := TComPort.Create(nil);

    if Enabled then
    begin
      LComPort := Port;
      LBaudRate := Baudrate;
      if not ComDevice.Active then
      begin
        ComDevice.DeviceName := 'COM' + IntToStr(LComPort);
        ComDevice.BaudRate := GetBaudRate(LBaudRate);
        ComDevice.Parity := TParity.paNone;
        ComDevice.DataBits := TDataBits.db8;
        ComDevice.StopBits := TStopBits.sb1;
        if not CheckEnumComPorts(LComPort, LErrMsg) then
          raise Exception.Create(LErrMsg);

        ComDevice.Open;
        Active := True;
      end;
      Result := True;
    end;
  except
    on E: Exception do
    begin
      Inc(LRetry);
      LIsError := True;
      LErrMsg := E.Message;
    end;
  end;

  if LIsError then
  begin
    if (LRetry < 3) then
    begin
      Sleep(100);
      goto GO_RETRY;
    end;

    AErrMsg := Format('%s 장치를 사용할 수 없습니다!', [LDeviceName]);
  end;
end;

function TPluginForm.OpenTicketPrinter(var AErrMsg: string): Boolean;
var
  LDeviceName, LErrMsg: string;
  LRetry, LComPort, LBaudrate: Integer;
  LIsError: Boolean;
label
  GO_RETRY;
begin
  Result := False;
  LErrMsg := '';
  LRetry := 0;
  //=======
  GO_RETRY:
  //=======
  LIsError := False;
  LDeviceName := '티켓 프린터';
  with Global.TicketPrinter do
  try
    if not Assigned(ComDevice) then
      ComDevice := TComPort.Create(nil);

    if Enabled then
    begin
      LComPort := Port;
      LBaudRate := Baudrate;
      if not ComDevice.Active then
      begin
        ComDevice.DeviceName := 'COM' + IntToStr(LComPort);
        ComDevice.BaudRate := GetBaudRate(LBaudRate);
        ComDevice.Parity := TParity.paNone;
        ComDevice.DataBits := TDataBits.db8;
        ComDevice.StopBits := TStopBits.sb1;
        if not CheckEnumComPorts(LComPort, LErrMsg) then
          raise Exception.Create(LErrMsg);

        //ComDevice.Open;
        Active := True;
      end;
      Result := True;
    end;
  except
    on E: Exception do
    begin
      Inc(LRetry);
      LIsError := True;
      LErrMsg := E.Message;
    end;
  end;

  if LIsError then
  begin
    if (LRetry < 3) then
    begin
      Sleep(100);
      goto GO_RETRY;
    end;

    AErrMsg := Format('%s 장치를 사용할 수 없습니다!', [LDeviceName]);
  end;
end;

(*
function TPluginForm.OpenNFCReader(var AErrMsg: string): Boolean;
var
  LDeviceName, LErrMsg: string;
  LRetry, LComPort, LBaudrate: Integer;
  LIsError: Boolean;
label
  GO_RETRY;
begin
  Result := False;
  LErrMsg := '';
  LRetry := 0;
  //=======
  GO_RETRY:
  //=======
  LIsError := False;
  LDeviceName := 'NFC 리더';
  with Global.BarcodeScanner do
  try
    if not Assigned(ComDevice) then
      ComDevice := TComPort.Create(nil);

    if Enabled then
    begin
      LComPort := Port;
      LBaudrate := Baudrate;
      if not ComDevice.Active then
      begin
        ComDevice.DeviceName := 'COM' + IntToStr(LComPort);
        ComDevice.BaudRate := GetBaudRate(LBaudrate);
        ComDevice.Parity := TParity.paNone;
        ComDevice.DataBits := TDataBits.db8;
        ComDevice.StopBits := TStopBits.sb1;
        if not CheckEnumComPorts(LComPort, LErrMsg) then
          raise Exception.Create(LErrMsg);

        ComDevice.Open;
        Active := True;
      end;
      Result := True;
    end;
  except
    on E: Exception do
    begin
      Inc(LRetry);
      LIsError := True;
      LErrMsg := E.Message;
    end;
  end;

  if LIsError then
  begin
    if (LRetry < 5) then
    begin
      Sleep(100);
      goto GO_RETRY;
    end;

    AErrMsg := Format('%s 장치를 사용할 수 없습니다!', [LDeviceName]);
  end;
end;
*)

procedure TPluginForm.ApplyTheme;
begin
  with Global.ThemeInfo do
  begin
    Self.Color := Colors.background1;
    pgwPrepareCurrent.Color := Colors.background1;
    pgwPrepareCurrent.ColorInner := Colors.background1;
    pgwPrepareTotal.Color := Colors.background1;
    pgwPrepareTotal.ColorInner := Colors.background1;
  end;
end;

////////////////////////////////////////////////////////////////////////////////////////////////////

function OpenPlugin(AMsg: TPluginMessage=nil): TPluginModule;
begin
  Result := TPluginForm.Create(Application, AMsg);
end;

exports
  OpenPlugin;
end.