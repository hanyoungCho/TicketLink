unit TLPaymentPaycoPin.Plugin;

interface

uses
  { Native }
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Forms, Vcl.Controls,
  Vcl.StdCtrls, Vcl.Menus, Vcl.ExtCtrls, Vcl.Imaging.GIFImg,
  { Plugin System }
  uPluginManager, uPluginModule, uPluginMessages,
  { DevExpress }
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxButtons, AdvSmoothPanel;

{$I ..\..\common\Common.TLGlobal.inc}

type
  TPluginForm = class(TPluginModule)
    panButtonContainer: TPanel;
    panMessage: TPanel;
    lblMessage1: TLabel;
    lblMessage2: TLabel;
    lblRemainTime: TLabel;
    lblFormTitle: TLabel;
    tmrRemainTime: TTimer;
    imgPaymentPaycoPin: TImage;
    panNumPad: TPanel;
    panPaycoPin: TAdvSmoothPanel;
    btnNum1: TcxButton;
    btnNum2: TcxButton;
    btnNum3: TcxButton;
    btnNum4: TcxButton;
    btnNum5: TcxButton;
    btnNum6: TcxButton;
    btnNum7: TcxButton;
    btnNum8: TcxButton;
    btnNum9: TcxButton;
    btnNum0: TcxButton;
    btnNum11: TcxButton;
    btnNum10: TcxButton;
    lblPaycoPin: TLabel;
    btnCancel: TcxButton;
    btnOK: TcxButton;

    procedure PluginModuleClose(Sender: TObject; var Action: TCloseAction);
    procedure PluginModuleActivate(Sender: TObject);
    procedure PluginModuleMessage(Sender: TObject; AMsg: TPluginMessage);
    procedure tmrRemainTimeTimer(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    FOwnerID: Integer;
    FWaitTime: Integer;
    FInputBuffer: string;
    FWorking: Boolean;

    procedure ProcessMessages(AMsg: TPluginMessage);
    procedure OnClickNumButton(Sender: TObject);
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
  Common.TLGlobal, Common.TLCommonLib, Common.TLLayerForm, Common.TLMsgBox;

const
  LCN_NUMPAD_BTN_COUNT = 12;
  LCN_WAITING_TIME = 90;
var
  LF: TTLLayerForm;
  NumButtons: TArray<TcxButton>;

{$R *.dfm}

{ TPluginForm }

constructor TPluginForm.Create(AOwner: TComponent; AMsg: TPluginMessage);
begin
  inherited Create(AOwner, AMsg);

  LF := TTLLayerForm.Create(nil);
  LF.Show;

  FOwnerID := 0;
  FInputBuffer := '';
  FWaitTime := 0;
  FWorking := False;
  Global.BarcodeScanner.OwnerId := 0;

  SetDoubleBuffered(Self, True);
  MakeRoundedControl(Self);
  SetLength(NumButtons, LCN_NUMPAD_BTN_COUNT);
  for var I := 0 to Pred(LCN_NUMPAD_BTN_COUNT) do
  begin
    NumButtons[I] := TcxButton(FindComponent('btnNum' + IntToStr(I)));
    NumButtons[I].CanBeFocused := False;
    NumButtons[I].SpeedButtonOptions.CanBeFocused := False;
    NumButtons[I].SpeedButtonOptions.Flat := True;
    NumButtons[I].OnClick := OnClickNumButton;
    NumButtons[I].OnCustomDraw := Global.OnCxButtonCustomDraw;
    MakeRoundedControl(NumButtons[I]);
  end;
  btnOK.OnCustomDraw := Global.OnCxButtonCustomDraw;
  btnCancel.OnCustomDraw := Global.OnCxButtonCustomDraw;

  ApplyTheme;
  ApplyLocale;
  if Assigned(AMsg) then
    ProcessMessages(AMsg);

  (imgPaymentPaycoPin.Picture.Graphic as TGIFImage).AnimationSpeed := 100;
  (imgPaymentPaycoPin.Picture.Graphic as TGIFImage).Animate := True;
  lblRemainTime.Caption := IntToStr(LCN_WAITING_TIME);
  tmrRemainTime.Enabled := True;
end;

destructor TPluginForm.Destroy;
begin
  inherited Destroy;
end;

procedure TPluginForm.PluginModuleClose(Sender: TObject; var Action: TCloseAction);
begin
  (imgPaymentPaycoPin.Picture.Graphic as TGIFImage).Animate := False;
  LF.Close;
  LF.Free;
  LF := nil;
  Action := caFree;
end;

procedure TPluginForm.PluginModuleActivate(Sender: TObject);
begin
  Global.BarcodeScanner.OwnerId := Self.PluginID;
end;

procedure TPluginForm.PluginModuleMessage(Sender: TObject; AMsg: TPluginMessage);
begin
  ProcessMessages(AMsg);
end;

procedure TPluginForm.ProcessMessages(AMsg: TPluginMessage);
begin
  if (AMsg.Command = CPC_INIT) then
    FOwnerID := AMsg.ParamByInteger(CPP_OWNER_ID);

  if (AMsg.Command = CPC_APPLY_THEME) then
    ApplyTheme;

  if (AMsg.Command = CPC_SET_LOCALE) then
    ApplyLocale;
end;

procedure TPluginForm.tmrRemainTimeTimer(Sender: TObject);
begin
  with TTimer(Sender) do
  try
    Enabled := False;
    Inc(FWaitTime);
    lblRemainTime.Caption := IntToStr(LCN_WAITING_TIME - FWaitTime);
    if (FWaitTime > LCN_WAITING_TIME) then
      ModalResult := mrCancel;
  finally
    Enabled := True;
  end;
end;

procedure TPluginForm.OnClickNumButton(Sender: TObject);
var
  LKey: Integer;
begin
  LKey := TcxButton(Sender).Tag;
  case LKey of
    48..57: //0..9
      FInputBuffer := FInputBuffer + Chr(LKey);
    8: //Backspace
      FInputBuffer := FInputBuffer.Substring(0, Pred(Length(FInputBuffer)));
    239: //Clear;
      FInputBuffer := '';
  else
    Exit;
  end;

  FWaitTime := 0;
  lblRemainTime.Caption := IntToStr(LCN_WAITING_TIME);
  if FInputBuffer.IsEmpty then
  begin
    lblPaycoPin.Font.Color := Global.ThemeInfo.Colors.input_font_disabled;
    lblPaycoPin.Caption := GetTextLocale(['바코드 번호 입력', 'Input barcode numbers', 'バーコードを数字で入力する', '输入条形码数字']);
  end
  else
  begin
    lblPaycoPin.Font.Color := Global.ThemeInfo.Colors.input_font_default;
    lblPaycoPin.Caption := FInputBuffer;
  end;
end;

procedure TPluginForm.btnCancelClick(Sender: TObject);
begin
  if FWorking then
    Exit;

  FWorking := True;
  try
    Self.ModalResult := mrCancel;
  finally
    FWorking := False;
  end;
end;

procedure TPluginForm.btnOKClick(Sender: TObject);
var
  PM: TPluginMessage;
  LLen: Integer;
begin
  if FWorking then
    Exit;

  FWorking := True;
  PM := TPluginMessage.Create(nil);
  try
    LLen := Length(FInputBuffer);
    if (LLen in [20, 21]) and
       (FInputBuffer.Substring(16, 2) = '95') then
    begin
      PM.Command := CPC_SEND_BARCODE;
      PM.AddParams(CPP_VALUE, FInputBuffer);
      PM.PluginMessageToID(FOwnerID);
      ModalResult := mrOK;
    end
    else
      ShowMsgBoxWarning(GetTextLocale(['잘못된 PAYCO 바코드 번호입니다.',
                                       'Invalid PAYCO barcode number.',
                                       'PAYCOのバーコード番号が正しくありません。',
                                       '所输入条形码号码有误。']),
        GetTextLocale(['입력한 바코드 번호를 확인하여 주세요.',
                       'Please check the barcode number entered.',
                       '入力したバーコード番号を確認してください。',
                       '请确认所输入条形码号码。']),
        [GetTextLocale(['확인', 'Confirm', '確認', '确认'])], 5);
  finally
    FreeAndNil(PM);
    FWorking := False;
  end;
end;

procedure TPluginForm.ApplyTheme;
begin
  with Global.ThemeInfo do
  begin
    Self.Color := Colors.background1;
    panMessage.Color := Colors.background1;
    lblFormTitle.Color := Colors.background1;
    lblFormTitle.Font.Color := Colors.black;
    lblRemainTime.Color := Colors.background1;
    lblRemainTime.Font.Color := Colors.primary;
    lblMessage1.Color := Colors.background1;
    lblMessage1.Font.Color := Colors.type4;
    lblMessage2.Color := Colors.background1;
    lblMessage2.Font.Color := Colors.black;
    StreamToPicture(imgPaymentPaycoPin.Picture, Images.ani_payco_pin_input.Stream);
    panButtonContainer.Color := Colors.background1;
    panNumPad.Color := Colors.background1;

    { PAYCO PIN 번호 }
    panPaycoPin.Fill.Color := Colors.input_face_default;
    panPaycoPin.Fill.BorderColor := Colors.input_border_default;
    lblPaycoPin.Color := Colors.input_face_default;
    lblPaycoPin.Font.Color := Colors.input_font_disabled;

    { 숫자 패드 }
    for var I: ShortInt := 0 to Pred(LCN_NUMPAD_BTN_COUNT) do
    begin
      NumButtons[I].Colors.Normal := Colors.keypad_face_default;
      NumButtons[I].Colors.NormalText := Colors.keypad_font_default;
      NumButtons[I].Colors.Pressed := Colors.keypad_face_pressed;
      NumButtons[I].Colors.PressedText := Colors.keypad_font_pressed;
    end;
  end;
end;

procedure TPluginForm.ApplyLocale;
begin
  case Global.KioskLocale of
    TKioskLocale.klKorean:
      begin
        lblFormTitle.Caption := 'PAYCO 결제';
        lblMessage1.Width := 400;
        lblMessage1.Caption := 'PAYCO 앱의 결제 바코드를';
        lblMessage2.Caption := ' 숫자로 직접 입력해 주세요.';
        lblPaycoPin.Caption := '바코드 번호 입력';
        btnNum10.Caption := '모두' + _CRLF + '지우기';
        btnCancel.Caption := '취소';
        btnOK.Caption := '입력 완료';
      end;
    TKioskLocale.klEnglish:
      begin
        lblFormTitle.Caption := 'PAYCO';
        lblMessage1.Width := 440;
        lblMessage1.Caption := 'Please enter the payment barcode';
        lblMessage2.Caption := ' shown in your PAYCO app.';
        lblPaycoPin.Caption := 'Input barcode numbers';
        btnNum10.Caption := 'Clear';
        btnCancel.Caption := 'Back';
        btnOK.Caption := 'Submit';
      end;
    TKioskLocale.klJapanese:
      begin
        lblFormTitle.Caption := 'PAYCO';
        lblMessage1.Width := 440;
        lblMessage1.Caption := 'PAYCOアプリの決済バーコードを数';
        lblMessage2.Caption := ' 字で直接入力してください。';
        lblPaycoPin.Caption := 'バーコードを数字で入力する';
        btnNum10.Caption := 'すべて消去';
        btnCancel.Caption := 'キャンセル';
        btnOK.Caption := '入力完了';
      end;
    TKioskLocale.klChinese:
      begin
        lblFormTitle.Caption := 'PAYCO';
        lblMessage1.Width := 440;
        lblMessage1.Caption := '请亲自输入';
        lblMessage2.Caption := ' PAYCO APP上支付条形码数字。';
        lblPaycoPin.Caption := '输入条形码数字';
        btnNum10.Caption := '全部删除';
        btnCancel.Caption := '取消';
        btnOK.Caption := '已输入';
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