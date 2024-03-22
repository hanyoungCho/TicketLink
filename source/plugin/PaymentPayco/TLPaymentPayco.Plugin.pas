unit TLPaymentPayco.Plugin;

interface

uses
  { Native }
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Forms, Vcl.Controls,
  Vcl.StdCtrls, Vcl.Menus, Vcl.ExtCtrls, Vcl.Imaging.GIFImg,
  { Plugin System }
  uPluginManager, uPluginModule, uPluginMessages,
  { DevExpress }
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxButtons, dxGDIPlusClasses;

{$I ..\..\common\Common.TLGlobal.inc}

type
  TPluginForm = class(TPluginModule)
    panButtonContainer: TPanel;
    panMessage1: TPanel;
    lblMessage2: TLabel;
    lblRemainTime: TLabel;
    tmrRemainTime: TTimer;
    btnPaycoPinInput: TcxButton;
    imgPaymentPayco: TImage;
    panMessage2: TPanel;
    lblMessage4: TLabel;
    lblMessage3: TLabel;
    btnCancel: TcxButton;
    Panel1: TPanel;
    imgWechat: TImage;
    imgAlipay: TImage;
    imgPayco: TImage;
    Image1: TImage;

    procedure PluginModuleClose(Sender: TObject; var Action: TCloseAction);
    procedure PluginModuleActivate(Sender: TObject);
    procedure PluginModuleMessage(Sender: TObject; AMsg: TPluginMessage);
    procedure tmrRemainTimeTimer(Sender: TObject);
    procedure PluginModuleKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnPaycoPinInputClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    FOwnerID: Integer;
    FWaitTime: Integer;
    FPaymentAmt: Integer;
    FPaymentType: string;
    FInputBuffer: string;
    FWorking: Boolean;

    procedure ProcessMessages(AMsg: TPluginMessage);
    procedure DoPaycoPinInput;
    procedure ApplyTheme;
    procedure ApplyLocale;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; AMsg: TPluginMessage=nil); override;
    destructor Destroy; override;
  end;

implementation

uses
  { Project }
  Common.TLGlobal, Common.TLDM, Common.TLCommonLib, Common.TLLayerForm, Common.TLMsgBox;

const
  LCN_WAITING_TIME = 30;
var
  LF: TTLLayerForm;

{$R *.dfm}

{ TPluginForm }

constructor TPluginForm.Create(AOwner: TComponent; AMsg: TPluginMessage);
var
  nTemp: Integer;
begin
  inherited Create(AOwner, AMsg);

  LF := TTLLayerForm.Create(nil);
  LF.Show;

  FOwnerID := 0;
  FWaitTime := 0;
  FPaymentAmt := 0;
  FInputBuffer := '';
  FWorking := False;
  Global.BarcodeScanner.OwnerId := Self.PluginID;
  Global.BarcodeScanner.PaycoMode := True;

  SetDoubleBuffered(Self, True);
  MakeRoundedControl(Self);
  btnCancel.OnCustomDraw := Global.OnCxButtonCustomDraw;
  btnPaycoPinInput.OnCustomDraw := Global.OnCxButtonCustomDraw;

  ApplyTheme;
  ApplyLocale;
  if Assigned(AMsg) then
    ProcessMessages(AMsg);

  (imgPaymentPayco.Picture.Graphic as TGIFImage).AnimationSpeed := 100;
  (imgPaymentPayco.Picture.Graphic as TGIFImage).Animate := True;
  //lblRemainTime.Caption := IntToStr(LCN_WAITING_TIME);
  lblRemainTime.Caption := FormatFloat('#,##0', FPaymentAmt);

  nTemp := trunc((580 - (lblRemainTime.Width + 4 + 66)) / 2);
  Image1.Left := nTemp;
  lblRemainTime.left := nTemp + 66 + 4;

  if FPaymentType = PMC_PAYCO then
    imgPayco.Visible := True
  else if FPaymentType = PMC_ALIPAY then
    imgAlipay.Visible := True
  else if FPaymentType = PMC_WECHAT then
    imgWechat.Visible := True;

  tmrRemainTime.Interval := 100;
  tmrRemainTime.Enabled := True;
end;

destructor TPluginForm.Destroy;
begin
  inherited Destroy;
end;

procedure TPluginForm.PluginModuleClose(Sender: TObject; var Action: TCloseAction);
begin
  Global.BarcodeScanner.OwnerId := 0;
  Global.BarcodeScanner.PaycoMode := False;
  (imgPaymentPayco.Picture.Graphic as TGIFImage).Animate := False;
  LF.Close;
  LF.Free;
  LF := nil;
  Action := caFree;
end;

procedure TPluginForm.PluginModuleMessage(Sender: TObject; AMsg: TPluginMessage);
begin
  ProcessMessages(AMsg);
end;

procedure TPluginForm.ProcessMessages(AMsg: TPluginMessage);
var
  LValue, LErrMsg: string;
  LStoredData: Boolean;
begin
  if (AMsg.Command = CPC_INIT) then
  begin
    FOwnerID := AMsg.ParamByInteger(CPP_OWNER_ID);
    FPaymentAmt := AMsg.ParamByInteger(CPP_VALUE); //결제예정금액
    FPaymentType := AMsg.ParamByString(CPP_TYPE); //결제타입
  end;

  if (AMsg.Command = CPC_SEND_BARCODE) then
  begin
    LValue := AMsg.ParamByString(CPP_VALUE); //바코드
    tmrRemainTime.Enabled := False;

    if FPaymentType = PMC_PAYCO then
    begin
      if DM.DoApprovePAYCO(Global.ReceiptInfo.ReceiptNo, FPaymentAmt, LValue, LStoredData, LErrMsg) then
      begin
        if not LStoredData then
          ShowMsgBoxInfo(GetTextLocale(['PAYCO 결제내역을 저장하지 못했습니다.',
                                       'Failed to save your PAYCO payment history.',
                                       'PAYCO決済履歴を保存できませんでした。',
                                       'PAYCO结算明细保存失败。']),
                         LErrMsg, [GetTextLocale(['확인', 'Confirm', '確認', '确认'])], 5);
        Self.ModalResult := mrOK;
      end
      else
      begin
        ShowMsgBoxError(GetTextLocale(['PAYCO 결제가 완료되지 않았습니다.' + _CRLF + '매표소에 문의하여 주십시오.',
                                       'PAYCO payment failed.' + _CRLF + 'Please visit the ticket office.',
                                       'PAYCO決済が完了していません。' + _CRLF + 'チケット売り場にお問い合わせください。',
                                       'PAYCO支付未成功。' + _CRLF + '请与售票处咨询。']),
                        LErrMsg, [GetTextLocale(['확인', 'Confirm', '確認', '确认'])], 5);
        Self.ModalResult := mrCancel;
      end;
    end
    else if (FPaymentType = PMC_ALIPAY) or (FPaymentType = PMC_WECHAT) then
    begin
      if DM.DoApproveMobile(Global.ReceiptInfo.ReceiptNo, FPaymentAmt, FPaymentType, LValue, LStoredData, LErrMsg) then
      begin
        if not LStoredData then
          ShowMsgBoxInfo(GetTextLocale(['결제내역을 저장하지 못했습니다.',
                                       'Failed to save your payment history.',
                                       '決済履歴を保存できませんでした。',
                                       '结算明细保存失败。']),
                         LErrMsg, [GetTextLocale(['확인', 'Confirm', '確認', '确认'])], 5);
        Self.ModalResult := mrOK;
      end
      else
      begin
        ShowMsgBoxError(GetTextLocale([' 결제가 완료되지 않았습니다.' + _CRLF + '매표소에 문의하여 주십시오.',
                                       'payment failed.' + _CRLF + 'Please visit the ticket office.',
                                       '決済が完了していません。' + _CRLF + 'チケット売り場にお問い合わせください。',
                                       '支付未成功。' + _CRLF + '请与售票处咨询。']),
                        LErrMsg, [GetTextLocale(['확인', 'Confirm', '確認', '确认'])], 5);
        Self.ModalResult := mrCancel;
      end;
    end;
  end;

  if (AMsg.Command = CPC_APPLY_THEME) then
    ApplyTheme;

  if (AMsg.Command = CPC_SET_LOCALE) then
    ApplyLocale;
end;

procedure TPluginForm.PluginModuleActivate(Sender: TObject);
begin
  Global.BarcodeScanner.OwnerId := Self.PluginID;
end;

procedure TPluginForm.PluginModuleKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  PM: TPluginMessage;
  LLength: Integer;
  LBarcode, LFlag1, LFlag2: string;
begin
  case Key of
    48..57: //0..9
      begin
        FInputBuffer := FInputBuffer + Char(Key);
        LLength := Length(FInputBuffer);
        LFlag1 := Copy(FInputBuffer, 1, 2);
        LFlag2 := Copy(FInputBuffer, 17, 2);
        if (LLength = 21) or
           ((LLength = 20) and (LFlag2 = '95') and ((LFlag1 = '10') or (LFlag1 = '20'))) then
        begin
          LBarcode := FInputBuffer;
          FInputBuffer := '';
          PM := TPluginMessage.Create(nil);
          try
            PM.Command := CPC_SEND_BARCODE;
            PM.AddParams(CPP_VALUE, LBarcode);
            PM.PluginMessageToID(Self.PluginID);
          finally
            FreeAndNil(PM);
            FInputBuffer := '';
          end;
        end;
      end;
  end;
end;

procedure TPluginForm.tmrRemainTimeTimer(Sender: TObject);
var
  ModalResult: TModalResult;
begin
  with TTimer(Sender) do
  try
    Enabled := False;
    Interval := 1000;

    if not Global.BarcodeScanner.Active then
    begin
      if FPaymentType = PMC_PAYCO then
        ModalResult := ShowMsgBoxConfirm(GetTextLocale(['PAYCO 바코드 결제를 이용할 수 없습니다.' + _CRLF + '바코드 숫자를 직접 입력하시겠습니까?',
                                                       'PAYCO barcode payments are unavailable.' + _CRLF + 'Do you want to enter the barcode digits manually?']),
                                        GetTextLocale(['바코드 스캐너를 사용할 수 없습니다.', 'Unable to use PAYCO barcode scanner.', 'バーコードスキャナーを使用できません。', '无法使用条形码扫描仪。']),
                                        [GetTextLocale(['예', 'Yes', 'はい', '是']), GetTextLocale(['아니오', 'No', 'いいえ', '否'])], 10)
      else
        ModalResult := ShowMsgBoxConfirm(GetTextLocale(['바코드 결제를 이용할 수 없습니다.' + _CRLF + '바코드 숫자를 직접 입력하시겠습니까?',
                                                       'barcode payments are unavailable.' + _CRLF + 'Do you want to enter the barcode digits manually?']),
                                        GetTextLocale(['바코드 스캐너를 사용할 수 없습니다.', 'Unable to use barcode scanner.', 'バーコードスキャナーを使用できません。', '无法使用条形码扫描仪。']),
                                        [GetTextLocale(['예', 'Yes', 'はい', '是']), GetTextLocale(['아니오', 'No', 'いいえ', '否'])], 10);

      if ModalResult = mrOK then
        DoPaycoPinInput
      else
        Self.ModalResult := mrCancel;

      Exit;
    end;

    Inc(FWaitTime);
    if (FWaitTime >= LCN_WAITING_TIME) then
      Self.ModalResult := mrCancel;
    //lblRemainTime.Caption := IntToStr(LCN_WAITING_TIME - FWaitTime);
  finally
    Enabled := True;
  end;
end;

procedure TPluginForm.btnCancelClick(Sender: TObject);
begin
  Self.ModalResult := mrCancel;
end;

procedure TPluginForm.btnPaycoPinInputClick(Sender: TObject);
begin
  if FWorking then
    Exit;

  FWorking := True;
  try
    DoPaycoPinInput;
  finally
    FWorking := False;
  end;
end;

procedure TPluginForm.DoPaycoPinInput;
var
  PM: TPluginMessage;
begin
  PM := TPluginMessage.Create(nil);
  try
    tmrRemainTime.Enabled := False;
    (imgPaymentPayco.Picture.Graphic as TGIFImage).Animate := False;
    PM.Command := CPC_INIT;
    PM.AddParams(CPP_OWNER_ID, Self.PluginID);
    PM.AddParams(CPP_VALUE, FPaymentAmt);
    PM.AddParams(CPP_TYPE, FPaymentType);
    if (PluginManager.OpenModal('TLPaymentPaycoPin.bpl', PM) <> mrOK) then
      Self.ModalResult := mrCancel;
  finally
    FreeAndNil(PM);
  end;
end;

procedure TPluginForm.ApplyTheme;
begin
  with Global.ThemeInfo do
  begin
    Self.Color := Colors.background1;
    panMessage1.Color := Colors.background1;
    //lblFormTitle.Color := Colors.background1;
    //lblFormTitle.Font.Color := Colors.black;
    lblRemainTime.Color := Colors.background1;
    //lblRemainTime.Font.Color := Colors.primary;
    lblRemainTime.Font.Color := Colors.black;
    //lblMessage1.Color := Colors.background1;
    //lblMessage1.Font.Color := Colors.type4;
    panMessage2.Color := Colors.background1;
    lblMessage2.Color := Colors.background1;
    lblMessage2.Font.Color := Colors.black;
    lblMessage3.Color := Colors.background1;
    lblMessage3.Font.Color := Colors.black;
    lblMessage4.Color := Colors.background1;
    lblMessage4.Font.Color := Colors.black;
    StreamToPicture(imgPaymentPayco.Picture, Images.ani_barcode_payco.Stream);
    panButtonContainer.Color := Colors.background1;
  end;
end;

procedure TPluginForm.ApplyLocale;
begin
  case Global.KioskLocale of
    TKioskLocale.klKorean:
      begin
        //lblFormTitle.Caption := 'PAYCO 결제';
        //lblMessage1.Caption := 'PAYCO 앱의 결제 바코드를';
        lblMessage2.Caption := '결제코드를 바코드 리더기에 스캔해주세요.';
        lblMessage3.Caption := '바코드 확인 방법';
        //lblMessage4.Font.Size := 18;
        //lblMessage4.Caption := 'PAYCO 앱 실행 > 결제 > 결제수단 선택 후' + _CRLF + '결제하기 선택 > 비밀번호 입력 > 결제 바코드 확인';
        lblMessage4.Caption := '바코드가 인식되지 않을 경우' + _CRLF + '바코드 번호를 직접 입력하세요.';
        btnCancel.Caption := '취소';
        btnPaycoPinInput.Caption := '바코드 직접입력';
      end;
    TKioskLocale.klEnglish:
      begin
        //lblFormTitle.Caption := 'PAYCO';
        //lblMessage1.Caption := 'Please enter the payment barcode';
        lblMessage2.Caption := 'Please scan the payment code with the barcode reader.';
        lblMessage3.Caption := 'How to check your barcode';
        //lblMessage4.Font.Size := 16;
        //lblMessage4.Caption := 'Open PAYCO app > Payment > Select payment method >' + _CRLF + 'Enter password > Check barcode';
        lblMessage4.Caption := 'If the barcode is not recognized,' + _CRLF + 'please manually enter the barcode number.';
        btnCancel.Caption := 'Back';
        btnPaycoPinInput.Caption := 'Input barcode numbers';
      end;
    TKioskLocale.klJapanese:
      begin
        //lblFormTitle.Caption := 'PAYCO';
        //lblMessage1.Caption := 'PAYCOアプリの決済バーコードを';
        lblMessage2.Caption := '支払いコードをバーコード リーダーにスキャンしてください。';
        lblMessage3.Caption := 'バーコードの確認方法';
        //lblMessage4.Font.Size := 16;
        //lblMessage4.Caption := 'PAYCOアプリを起動 > 決済 > 決済手段を選択して決済するを選択 > パスワードを入力 > ' + _CRLF + '決済バーコードを確認';
        lblMessage4.Caption := 'バーコードが認識されない場合は、' + _CRLF + 'バーコード番号を手動で入力してください。';
        btnCancel.Caption := 'キャンセル';
        btnPaycoPinInput.Caption := 'バーコード直接入力';
      end;
    TKioskLocale.klChinese:
      begin
        //lblFormTitle.Caption := 'PAYCO';
        //lblMessage1.Caption := '请利用条形码扫描仪读取。';
        lblMessage2.Caption := '请将付款码扫描到条形码阅读器中。';
        lblMessage3.Caption := '条形码确认方法';
        //lblMessage4.Font.Size := 16;
        //lblMessage4.Caption := '打开PAYCO APP > 支付 > 选择支付方法后支付 >' + _CRLF + '输入密码> 确认支付条形码';
        lblMessage4.Caption := '如果无法识别条形码，' + _CRLF + '请手动输入条形码编号。';
        btnCancel.Caption := '取消';
        btnPaycoPinInput.Caption := '直接输入条码';
      end;
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