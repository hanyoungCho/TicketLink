unit TLAdmin.Config;

interface

uses
  { Native }
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Forms,
  Vcl.Controls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.NumberBox, Vcl.Mask, Vcl.Menus,
  { DevExpress }
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxControls, cxContainer,
  cxEdit, cxGroupBox, cxPC, cxButtons,
  { TMS UI Pakc }
  AdvShapeButton;

type
  TConfigForm = class(TForm)
    panTitle: TPanel;
    panButtonContainer: TPanel;
    btnApply: TcxButton;
    btnCancel: TcxButton;
    pgcConfig: TcxPageControl;
    tabSystem: TcxTabSheet;
    tabConfig: TcxTabSheet;
    edtServerHost: TLabeledEdit;
    ckbAutoStart: TCheckBox;
    edtServerToken: TLabeledEdit;
    Label1: TLabel;
    edtPartnerNo: TNumberBox;
    Label2: TLabel;
    edtCounterNo: TNumberBox;
    ckbUsePG: TCheckBox;
    edtVanCode: TLabeledEdit;
    edtVanTID: TLabeledEdit;
    mmoConfig: TMemo;
    gbxPAYCO: TcxGroupBox;
    edtPaycoVanTID: TLabeledEdit;
    edtPaycoHost: TLabeledEdit;
    edtPaycoRegUri: TLabeledEdit;
    edtPaycoApprovalUri: TLabeledEdit;
    edtPaycoCancelUri: TLabeledEdit;
    edtPaycoNetCancelUri: TLabeledEdit;
    edtStoreBizNo: TLabeledEdit;
    btnICReaderVerify: TButton;
    btnPaycoPosReg: TButton;
    edtStoreOwner: TLabeledEdit;
    edtStoreTelNo: TLabeledEdit;
    edtStoreAddress: TLabeledEdit;
    edtStoreName: TLabeledEdit;
    edtPaycoPosTID: TLabeledEdit;
    mmoLauncher: TMemo;
    ckbUseDetectCardInsert: TCheckBox;

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnApplyClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnICReaderVerifyClick(Sender: TObject);
    procedure btnPaycoPosRegClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
  private
    { Private declarations }
    function DoCertifyPAYCO: Boolean;
    procedure DoApplyUpdate;
    procedure LoadConfig;
    procedure UpdateConfig;
  public
    { Public declarations }
  end;

var
  ConfigForm: TConfigForm;

implementation

uses
  { Project }
  Common.TLGlobal, Common.TLDM, Common.TLCommonLib, Common.TLLayerForm, Common.TLMsgBox,
  {$WARN UNIT_PLATFORM OFF}Common.TabTipHelper{$WARN UNIT_PLATFORM ON};

var
  TabTip: TTabTip;
  LF: TTLLayerForm;

{$R *.dfm}

procedure TConfigForm.FormCreate(Sender: TObject);
begin
  LF := TTLLayerForm.Create(nil);
  LF.Show;
  TabTip.Launch(Self.Handle);

  MakeRoundedControl(Self);
  SetDoubleBuffered(Self, True);
  pgcConfig.ActivePageIndex := 0;
  btnApply.OnCustomDraw := Global.OnCxButtonCustomDraw;
  btnCancel.OnCustomDraw := Global.OnCxButtonCustomDraw;
  LoadConfig;
end;

procedure TConfigForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  LF.Close;
  LF.Free;
  LF := nil;
  try
    TabTip.Close;
    TabTip.Termiante;
  except
  end;
  Action := caFree;
end;

procedure TConfigForm.FormActivate(Sender: TObject);
begin
  Global.ThreadTimer.CheckIdle := False;
end;

procedure TConfigForm.FormDeactivate(Sender: TObject);
begin
  Global.ThreadTimer.CheckIdle := True;
end;

procedure TConfigForm.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TConfigForm.btnICReaderVerifyClick(Sender: TObject);
var
  sErrMsg: string;
begin
  if (Trim(edtVanCode.Text) = '') or
     (Trim(edtVanTID.Text) = '') then
  begin
    ShowMsgBoxWarning('필수 입력 값이 누락되었습니다.', '필수입력 항목 ☞ VAN사코드, VAN-TID', ['확인'], 5);
    Exit;
  end;

  try
    UpdateConfig;
    if not DM.DoICReaderVerify(Global.StoreInfo.VanCode, Global.StoreInfo.VanTID, sErrMsg) then
      raise Exception.Create(sErrMsg);

    ShowMsgBoxInfo('단말기 무결성 검사에 성공하였습니다!', '', ['확인'], 5);
  except
    on E: Exception do
      ShowMsgBoxError('단말기 무결성 검사에 실패하였습니다!', E.Message, ['확인'], 5);
  end;
end;

procedure TConfigForm.btnPaycoPosRegClick(Sender: TObject);
begin
  DoCertifyPAYCO;
end;

procedure TConfigForm.btnApplyClick(Sender: TObject);
begin
  DoApplyUpdate;
end;

procedure TConfigForm.DoApplyUpdate;
begin
  if Global.StoreInfo.PaycoPosTID.IsEmpty or
     Global.StoreInfo.PaycoAPIKey.IsEmpty then
  begin
    if (ShowMsgBoxConfirm('PAYCO POS 등록이 되지 않았습니다!' + _CRLF + '미등록 상태에서는 PAYCO 결제를 사용할 수 없습니다.',
          '무시하고 진행하시겠습니까?', ['예', '아니오'], 10) <> mrOK) then
      Exit;
  end;

  UpdateConfig;
  Self.ModalResult := mrOK;
end;

function TConfigForm.DoCertifyPAYCO: Boolean;
var
  LErrMsg: string;
begin
  Result := False;
  edtPaycoPosTID.Text := '';
  if (Trim(edtVanCode.Text) = '') or
     (Trim(edtPaycoVanTID.Text) = '') or
     (Trim(edtStoreBizNo.Text) = '') then
  begin
    ShowMsgBoxWarning('필수 입력 값이 누락되었습니다.', '필수입력 항목 ☞ VAN사코드, VAN-TID, 사업자번호', [GetTextLocale(['확인', 'Confirm', '確認', '确认'])], 5);
    Exit;
  end;

  try
    UpdateConfig;
    if not DM.DoCertifyPAYCO(LErrMsg) then
      raise Exception.Create(LErrMsg);

    edtPaycoPosTID.Text := Global.StoreInfo.PaycoPosTID;
    Result := True;
    ShowMsgBoxInfo('PAYCO POS 등록 작업이 성공하였습니다!' + _CRLF + Global.StoreInfo.PaycoMerchantName + _CRLF + Global.StoreInfo.PaycoMerchantKey,
      Global.StoreInfo.PaycoAPIKey, [GetTextLocale(['확인', 'Confirm', '確認', '确认'])], 5);
  except
    on E: Exception do
      ShowMsgBoxError('PAYCO POS 등록 작업이 실패하였습니다!', E.Message, [GetTextLocale(['확인', 'Confirm', '確認', '确认'])], 5);
  end;
end;

procedure TConfigForm.LoadConfig;
begin
  edtServerHost.Text := Global.APIServerInfo.Host;
  edtServerToken.Text := Global.APIServerInfo.Token;

  ckbAutoStart.Checked := Global.AutoStart;
  edtPartnerNo.Value := Global.StoreInfo.PartnerNo;
  edtCounterNo.Value := Global.StoreInfo.CounterNo;
  edtStoreBizNo.Text := Global.StoreInfo.BizNo;
  edtStoreName.Text := Global.StoreInfo.StoreName;
  edtStoreOwner.Text := Global.StoreInfo.Owner;
  edtStoreTelNo.Text := Global.StoreInfo.TelNo;
  edtStoreAddress.Text := Global.StoreInfo.Address;
  ckbUsePG.Checked := Global.StoreInfo.UsePG;
  ckbUseDetectCardInsert.Checked := Global.StoreInfo.UseDetectCardInsert;
  edtVanCode.Text := Global.StoreInfo.VanCode;
  edtVanTID.Text := Global.StoreInfo.VanTID;
  edtPaycoVanTID.Text := Global.StoreInfo.PaycoVanTID;
  edtPaycoPosTID.Text := Global.StoreInfo.PaycoPosTID;
  edtPaycoHost.Text := Global.StoreInfo.PaycoHost;
  edtPaycoRegUri.Text := Global.StoreInfo.PaycoUriReg;
  edtPaycoApprovalUri.Text := Global.StoreInfo.PaycoUriApproval;
  edtPaycoCancelUri.Text := Global.StoreInfo.PaycoUriCancel;
  edtPaycoNetCancelUri.Text := Global.StoreInfo.PaycoUriNetCancel;

  mmoLauncher.Lines.LoadFromFile(Global.LauncherConfigFileName);
  mmoConfig.Lines.LoadFromFile(Global.ConfigFileName);
end;

procedure TConfigForm.UpdateConfig;
begin
  mmoLauncher.Lines.SaveToFile(Global.LauncherConfigFileName);
  mmoConfig.Lines.SaveToFile(Global.ConfigFileName);

  Global.AutoStart := ckbAutoStart.Checked;
{$IFNDEF DEBUG}
  if Global.AutoStart then
    RunOnWindownStart(CCC_LAUNCHER_TITLE, Global.HomeDir + CCC_LAUNCHER_NAME + '.exe', False)
  else
    RemoveFromRunOnWindowStart(CCC_LAUNCHER_TITLE);
{$ENDIF}

  Global.APIServerInfo.Host := Trim(edtServerHost.Text);
  Global.APIServerInfo.Token := Trim(edtServerToken.Text);

  Global.StoreInfo.PartnerNo := Trunc(edtPartnerNo.Value);
  Global.StoreInfo.CounterNo := Trunc(edtCounterNo.Value);
  Global.StoreInfo.BizNo := Trim(edtStoreBizNo.Text);
  Global.StoreInfo.StoreName := Trim(edtStoreName.Text);
  Global.StoreInfo.Owner := Trim(edtStoreOwner.Text);
  Global.StoreInfo.TelNo := Trim(edtStoreTelNo.Text);
  Global.StoreInfo.Address := Trim(edtStoreAddress.Text);
  Global.StoreInfo.UsePG := ckbUsePG.Checked;
  Global.StoreInfo.UseDetectCardInsert := ckbUseDetectCardInsert.Checked;
  Global.StoreInfo.VanCode := Trim(edtVanCode.Text);
  Global.StoreInfo.VanTID := Trim(edtVanTID.Text);

  Global.StoreInfo.PaycoVanTID := Trim(edtPaycoVanTID.Text);
  Global.StoreInfo.PaycoHost := Trim(edtPaycoHost.Text);
  Global.StoreInfo.PaycoUriReg := Trim(edtPaycoRegUri.Text);
  Global.StoreInfo.PaycoUriApproval := Trim(edtPaycoApprovalUri.Text);
  Global.StoreInfo.PaycoUriCancel := Trim(edtPaycoCancelUri.Text);
  Global.StoreInfo.PaycoUriNetCancel := Trim(edtPaycoNetCancelUri.Text);

  with Global.ConfigRegistry do
  begin
    WriteString('Server', 'Host', Global.APIServerInfo.Host);
    WriteString('Server', 'Token', Global.LbCipher.GetEncryptedString(Global.APIServerInfo.Token));

    WriteBool('StoreInfo', 'AutoStart', Global.AutoStart);
    WriteInteger('StoreInfo', 'PartnerNo', Global.StoreInfo.PartnerNo);
    WriteInteger('StoreInfo', 'CounterNo', Global.StoreInfo.CounterNo);
    WriteString('StoreInfo', 'BizNo', Global.StoreInfo.BizNo);
    WriteString('StoreInfo', 'StoreName', Global.StoreInfo.StoreName);
    WriteString('StoreInfo', 'Owner', Global.StoreInfo.Owner);
    WriteString('StoreInfo', 'TelNo', Global.StoreInfo.TelNo);
    WriteString('StoreInfo', 'Address', Global.StoreInfo.Address);
    WriteBool('StoreInfo', 'UsePG', Global.StoreInfo.UsePG);
    WriteBool('StoreInfo', 'UseDetectCardInsert', Global.StoreInfo.UseDetectCardInsert);
    WriteString('StoreInfo', 'VanCode', Global.StoreInfo.VanCode);
    WriteString('StoreInfo', 'VanTID', Global.StoreInfo.VanTID);

    WriteString('PAYCO', 'VanTID', Global.StoreInfo.PaycoVanTID);
    WriteString('PAYCO', 'Host', Global.StoreInfo.PaycoHost);
    WriteString('PAYCO', 'RegUri', Global.StoreInfo.PaycoUriReg);
    WriteString('PAYCO', 'ApprovalUri', Global.StoreInfo.PaycoUriApproval);
    WriteString('PAYCO', 'CancelUri', Global.StoreInfo.PaycoUriCancel);
    WriteString('PAYCO', 'NetCancelUri', Global.StoreInfo.PaycoUriNetCancel);
    WriteString('PAYCO', 'PosTID', Global.StoreInfo.PaycoPosTID);
    WriteString('PAYCO', 'APIKey', Global.LbCipher.GetEncryptedString(Global.StoreInfo.PaycoAPIKey));
    WriteString('PAYCO', 'MerchantKey', Global.StoreInfo.PaycoMerchantKey);
  end;
end;

end.
