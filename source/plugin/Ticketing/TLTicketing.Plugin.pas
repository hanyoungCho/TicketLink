unit TLTicketing.Plugin;

interface

uses
  { Native }
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Forms, Vcl.Controls,
  Vcl.StdCtrls, Vcl.Menus, Vcl.ExtCtrls, System.Generics.Collections, Vcl.Imaging.GIFImg,
  Vcl.Imaging.pngimage,
  { Plugin System }
  uPluginManager, uPluginModule, uPluginMessages,
  { DevExpress }
  cxScrollBox, cxButtons, cxPC, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxBarBuiltInMenu,
  { TMS }
  AdvSmoothPanel, AdvSmoothButton, AdvShapeButton, AdvGlassButton;

{$I ..\..\common\Common.TLGlobal.inc}

type
  TPluginForm = class(TPluginModule)
    panTop: TPanel;
    panTopLeft: TPanel;
    panTopRight: TPanel;
    panTopCenter: TPanel;
    lblCurrentDateTime: TLabel;
    lblBodyMainStartNotice: TLabel;
    panBodyHeadTitle: TPanel;
    imgLogo: TImage;
    lblBodyHeadTicketPrint: TLabel;
    panSearchMenu: TPanel;
    panSearchReserveNo: TPanel;
    lblReserveNoIndicator: TLabel;
    panSearchPhoneNo: TPanel;
    lblPhoneNoIndicator: TLabel;
    pgcTicketPrint: TcxPageControl;
    tabSearchPhoneNo: TcxTabSheet;
    panBodyTicketPrintPhoneNoInput: TPanel;
    lblInputBirthday1: TLabel;
    lblInputPhoneNo: TLabel;
    panInputBirthday1: TAdvSmoothPanel;
    btnClearBirthday1: TAdvShapeButton;
    edtInputBirthday1: TEdit;
    panInputPhoneNo: TAdvSmoothPanel;
    btnClearPhoneNo: TAdvShapeButton;
    edtInputPhoneNo: TEdit;
    panNumPad: TPanel;
    btnNum1: TcxButton;
    btnNum2: TcxButton;
    btnNum3: TcxButton;
    btnNum4: TcxButton;
    btnNum5: TcxButton;
    btnNum6: TcxButton;
    btnNum7: TcxButton;
    btnNum8: TcxButton;
    btnNum9: TcxButton;
    btnNum10: TcxButton;
    btnNum0: TcxButton;
    btnNum11: TcxButton;
    btnInputPhoneNoConfirm: TcxButton;
    tabSearchReservedNo: TcxTabSheet;
    panBodyTicketPrintReserveNoInput: TPanel;
    lblInputReserveNo: TLabel;
    panInputReserveNo: TAdvSmoothPanel;
    btnClearReserveNo: TAdvShapeButton;
    edtInputReserveNo: TEdit;
    btnInputReservedNoConfirm: TcxButton;
    btnGuideReserveNo: TAdvSmoothButton;
    tabReserveList: TcxTabSheet;
    panReserveInfo: TPanel;
    lblMemberNotice: TLabel;
    sbxReserveList: TcxScrollBox;
    lblInputBirthday2: TLabel;
    panInputBirthday2: TAdvSmoothPanel;
    btnClearBirthday2: TAdvShapeButton;
    edtInputBirthday2: TEdit;
    lblHeadSeparator: TLabel;
    tabTemplate: TcxTabSheet;
    TemplateReservePanel1: TAdvSmoothPanel;
    TemplateReserveNoCaptionLabel1: TLabel;
    TemplateReserveQtyCaptionLabel1: TLabel;
    TemplateReserveNoValueLabel1: TLabel;
    TemplateReserveQtyValueLabel1: TLabel;
    TemplateReserveSiteCaptionLabel1: TLabel;
    TemplateReserveSiteValueLabel1: TLabel;
    TemplatePrintButton1: TcxButton;
    TemplateProductNameContainer1: TPanel;
    TemplateProductNameLabel1: TLabel;
    TemplateProductDateTimeLabel1: TLabel;
    TemplateProductImageContainer1: TPanel;
    TemplateProductImage1: TImage;
    btnTicketingHome: TAdvGlassButton;
    panUserInfo: TPanel;
    lblReserveUserNameTrail: TLabel;
    lblReserveUserName: TLabel;
    btnTicketHome: TAdvShapeButton;
    btnChangeLocale: TAdvSmoothButton;
    tmrPopupCloser: TTimer;
    panLocalePopup: TPanel;
    panLocale1: TPanel;
    panLocale2: TPanel;
    panLocale3: TPanel;

    procedure PluginModuleMessage(Sender: TObject; AMsg: TPluginMessage);
    procedure PluginModuleClose(Sender: TObject; var Action: TCloseAction);
    procedure PluginModuleActivate(Sender: TObject);
    procedure panSearchPhoneNoClick(Sender: TObject);
    procedure panSearchReserveNoClick(Sender: TObject);
    procedure edtInputBirthday1Change(Sender: TObject);
    procedure edtInputPhoneNoChange(Sender: TObject);
    procedure edtInputReserveNoChange(Sender: TObject);
    procedure edtInputBirthday1Enter(Sender: TObject);
    procedure edtInputBirthday1Exit(Sender: TObject);
    procedure edtInputPhoneNoEnter(Sender: TObject);
    procedure edtInputPhoneNoExit(Sender: TObject);
    procedure edtInputReserveNoEnter(Sender: TObject);
    procedure edtInputReserveNoExit(Sender: TObject);
    procedure btnClearBirthday1Click(Sender: TObject);
    procedure btnClearPhoneNoClick(Sender: TObject);
    procedure btnClearReserveNoClick(Sender: TObject);
    procedure btnGuideReserveNoClick(Sender: TObject);
    procedure btnInputPhoneNoConfirmClick(Sender: TObject);
    procedure btnInputReservedNoConfirmClick(Sender: TObject);
    procedure pgcTicketPrintChange(Sender: TObject);
    procedure btnClearBirthday2Click(Sender: TObject);
    procedure edtInputBirthday2Change(Sender: TObject);
    procedure edtInputBirthday2Enter(Sender: TObject);
    procedure edtInputBirthday2Exit(Sender: TObject);
    procedure btnTicketingHomeClick(Sender: TObject);
    procedure btnTicketHomeMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    procedure OnNumButtonClick(Sender: TObject);
    procedure OnLocaleItemMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure OnLocaleItemMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,Y: Integer);
    procedure PluginModuleMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure tmrPopupCloserTimer(Sender: TObject);
    procedure btnChangeLocaleMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
    FOwnerID: Integer;
    FThemeUpdated: Boolean;
    FReserveUserName: string;
    FTimeoutCount: Integer;
    FLastSearchValue: string;
    FLastSearchType: Integer;
    FInputControl: TEdit;

    procedure ProcessMessages(AMsg: TPluginMessage);
    procedure ClearReserveList;
    procedure MakeReserveList(const ASearchType: Integer; const ASearchValue, ABirthDay: string);
    procedure DispCurrentTime;
    procedure SelectPhoneNoPage;
    procedure SelectReserveNoPage;
    procedure ShowNumPad(AContainer: TWinControl; const X, Y: Integer);
    procedure ApplyTheme;
    procedure ApplyLocale;
    procedure UpdateLocalePopup;
    procedure DoBarcodeReady;
    procedure InputClear;
    function DoPrintTicket(const AItemIndex: Integer): Boolean;
    function GetBirthday1: string;
    procedure SetBirthday1(const AValue: string);
    function GetBirthday2: string;
    procedure SetBirthday2(const AValue: string);
    function GetPhoneNo: string;
    procedure SetPhoneNo(const AValue: string);
    function GetReservedNo: string;
    procedure SetReservedNo(const AReserveNo: string);
    procedure SetReserveUserName(const AReserveUserName: string);
  protected
    procedure WndProc(var AMsg: TMessage); override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; AMsg: TPluginMessage=nil); override;
    destructor Destroy; override;

    property BirthDay1: string read GetBirthday1 write SetBirthday1;
    property BirthDay2: string read GetBirthday2 write SetBirthday2;
    property PhoneNo: string read GetPhoneNo write SetPhoneNo;
    property ReservedNo: string read GetReservedNo write SetReservedNo;
    property ReserveUserName: string read FReserveUserName write SetReserveUserName;
    property LastSearchType: Integer read FLastSearchType write FLastSearchType;
    property LastSearchValue: string read FLastSearchValue write FLastSearchValue;
  end;

implementation

uses
  { Native }
  Data.DB, System.StrUtils,
  { DevExpress }
  dxmdaset,
  { Project }
  Common.TLGlobal, Common.TLDM, Common.TLCommonLib, Common.TLMsgBox, TLTicketing.GuidePopup;

const
  LCN_TIMEOUT = 10;
  LCN_NUMPAD_BTN_COUNT = 12;
  LCN_LOCALE_BTN_COUNT = 3;
var
  FNumButtons: TArray<TcxButton>;
  FLocaleButtons: TArray<TPanel>;

{$R *.dfm}

procedure SetPageControl(APageControl: TcxPageControl);
begin
  with APageControl do
  begin
    for var I := 0 to Pred(PageCount) do
      Pages[I].TabVisible := False;
    ActivePageIndex := 0;
  end;
end;

{ TPluginForm }

procedure TPluginForm.WndProc(var AMsg: TMessage);
begin
  case AMsg.Msg of
    WM_LBUTTONDOWN:
      if (Global.KioskMode = KSM_IDLE) and
         CheckKioskAvailable then
        Global.KioskMode := KSM_HOME;
  end;

  inherited WndProc(AMsg);
end;

constructor TPluginForm.Create(AOwner: TComponent; AMsg: TPluginMessage);
var
  I: ShortInt;
begin
  inherited Create(AOwner, AMsg);

  FOwnerID := 0;
  FThemeUpdated := False;
  FTimeoutCount := 0;
  FInputControl := nil;

  Self.Top := (Global.BaseScreenHeight - Self.Height);
  Self.Left := Global.BaseScreenLeft;
  Self.Height := (Global.BaseScreenHeight - Self.Top);
  Self.Width := Global.BaseScreenWidth;
  btnClearBirthday1.Visible := False;
  btnClearPhoneNo.Visible := False;
  btnClearBirthday2.Visible := False;
  btnClearReserveNo.Visible := False;
  btnTicketHome.Visible := Global.StoreInfo.ShowTicketBuyMenu;

  SetDoubleBuffered(Self, True);
  SetPageControl(pgcTicketPrint);

  MakeRoundedControl(panLocalePopup, 30, 30);
  SetLength(FLocaleButtons, LCN_LOCALE_BTN_COUNT);
  for I := 0 to Pred(LCN_LOCALE_BTN_COUNT) do
  begin
    FLocaleButtons[I] := TPanel(FindComponent('panLocale' + IntToStr(I + 1)));
    FLocaleButtons[I].Tag := 0;
    FLocaleButtons[I].OnMouseDown := OnLocaleItemMouseDown;
    FLocaleButtons[I].OnMouseUp := OnLocaleItemMouseUp;
  end;
  panLocalePopup.Visible := False;

  SetLength(FNumButtons, LCN_NUMPAD_BTN_COUNT);
  for I := 0 to Pred(LCN_NUMPAD_BTN_COUNT) do
  begin
    FNumButtons[I] := TcxButton(FindComponent('btnNum' + IntToStr(I)));
    FNumButtons[I].CanBeFocused := False;
    FNumButtons[I].SpeedButtonOptions.CanBeFocused := False;
    FNumButtons[I].SpeedButtonOptions.Flat := True;
    FNumButtons[I].OnClick := OnNumButtonClick;
    FNumButtons[I].OnCustomDraw := Global.OnCxButtonCustomDraw;
  end;

  MakeRoundedControl(btnInputPhoneNoConfirm, 10, 10);
  btnInputPhoneNoConfirm.OnCustomDraw := Global.OnCxButtonCustomDraw;
  MakeRoundedControl(btnInputReservedNoConfirm, 10, 10);
  btnInputReservedNoConfirm.OnCustomDraw := Global.OnCxButtonCustomDraw;
  btnGuideReserveNo.Visible := False;
  //조회 방식
  if (Global.StoreInfo.KioskIssueTypeCode = ITC_INTERGRATION) then
  begin
    //전화번호로 조회
    lblInputBirthday1.Visible := False;
    panInputBirthday1.Visible := False;
    lblInputPhoneNo.Left := 0;
    panInputPhoneNo.Left := 0;
    edtInputPhoneNo.Width := 730;
    btnClearPhoneNo.Left := 773;
    panInputPhoneNo.Width := 832;
    //예매번호로 조회
    lblInputBirthday2.Visible := False;
    panInputBirthday2.Visible := False;
    btnGuideReserveNo.Visible := True;
    btnGuideReserveNo.Left := 106;
    lblInputReserveNo.Left := 0;
    panInputReserveNo.Left := 0;
    edtInputReserveNo.Width := 730;
    edtInputReserveNo.MaxLength := 0; //통합 조회는 자릿수 제한 없음
    btnClearReserveNo.Left := 773;
    panInputReserveNo.Width := 832;
  end;

  //예매내역 조회 방법 노출 여부
  if Global.StoreInfo.SearchPhoneNo and
     Global.StoreInfo.SearchReserveNo then
    lblHeadSeparator.Visible := False
  else
  begin
    panSearchPhoneNo.Visible := False;
    panSearchMenu.Visible := False;
  end;

  DispCurrentTime;
  if Assigned(AMsg) then
    ProcessMessages(AMsg);
end;

destructor TPluginForm.Destroy;
begin
  ClearReserveList;

  inherited Destroy;
end;

procedure TPluginForm.PluginModuleActivate(Sender: TObject);
begin
  Global.BarcodeScanner.OwnerId := Self.PluginID;
  ApplyTheme;
  ApplyLocale;
end;

procedure TPluginForm.PluginModuleClose(Sender: TObject; var Action: TCloseAction);
begin
  SendMessage(Application.MainForm.Handle, WM_CLOSE, 0, 0);
  Action := caFree;
end;

procedure TPluginForm.PluginModuleMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  with panLocalePopup do
    if Visible and
       (not PtInRect(ClientRect, TPoint.Create(X, Y))) then
      Visible := False;
end;

procedure TPluginForm.PluginModuleMessage(Sender: TObject; AMsg: TPluginMessage);
begin
  ProcessMessages(AMsg);
end;

procedure TPluginForm.ProcessMessages(AMsg: TPluginMessage);
var
  LValue: Integer;
  LData: string;
begin
  if (AMsg.Command = CPC_INIT) then
    FOwnerID := AMsg.ParamByInteger(CPP_OWNER_ID);

  if (AMsg.Command = CPC_SET_KIOSK_MODE) then
  begin
    LValue := AMsg.ParamByInteger(CPP_VALUE);
    case LValue of
      KSM_IDLE: //유휴 상태
        if (Global.StoreInfo.ExposureTypeCode = ATC_NORMAL) and
           Global.StoreInfo.ShowTicketingMenu and
           (not Global.StoreInfo.ShowTicketBuyMenu) then
        begin
          SendPluginCommand(CPC_CLOSE, Self.PluginID, Global.PluginInfo.BarcodeReadyPluginId);
          SetForegroundWindow(Self.Handle);
        end;
      KSM_HOME: //메인 홈
        if (Global.StoreInfo.ExposureTypeCode = ATC_NORMAL) and
           Global.StoreInfo.ShowTicketingMenu and
           (not Global.StoreInfo.ShowTicketBuyMenu) then
          Global.KioskMode := KSM_TICKETING_HOME;
      KSM_TICKETING_HOME: //티켓 출력(예매 조회)
        begin
          ShowWaitMsg(GetTextLocale(['잠시만 기다려 주십시오.', 'Please hold.', 'しばらくお待ちください。', '请稍后。']));
          try
            if Global.StoreInfo.SearchPhoneNo then
              SelectPhoneNoPage
            else
              SelectReserveNoPage;
            ClearReserveList;
          finally
            PushWaitMsg;
          end;

          SetForegroundWindow(Self.Handle);
          if (Global.StoreInfo.ExposureTypeCode = ATC_NORMAL) and
             Global.StoreInfo.ShowTicketingMenu and
             (not Global.StoreInfo.ShowTicketBuyMenu) then
            ShowNotice(10);

          DoBarcodeReady;
        end;
    end;
  end;

  if (AMsg.Command = CPC_PRINT_TICKET) then
  begin
    LValue := AMsg.ParamByInteger(CPP_VALUE); //ReserveList.ItemIndex
    DoPrintTicket(LValue);
  end;

  if (AMsg.Command = CPC_SET_FOREGROUND) then
  begin
    if Global.StoreInfo.SearchPhoneNo then
      SelectPhoneNoPage
    else
      SelectReserveNoPage;

    SetForegroundWindow(Self.Handle);
    if (Global.StoreInfo.ExposureTypeCode = ATC_NORMAL) and
       Global.StoreInfo.ShowTicketingMenu and
       (not Global.StoreInfo.ShowTicketBuyMenu) then
      ShowNotice(10);
  end;

  if (AMsg.Command = CPC_SEND_BARCODE) then
  begin
    LData := AMsg.ParamByString(CPP_VALUE);
    if (LData.Substring(0, 1) <> 'R') or
       (LData.Length <> 14) then
    begin
      ShowMsgBoxError(
        GetTextLocale(['유효하지 않은 바코드 입니다.', 'Invalid barcode.', '無効なバーコードです。', '条形码失效。']),
        GetTextLocale(['예매상세내역 또는 문자로 전송된 바코드만 사용 가능합니다.' + _CRLF + '스마트티켓은 출력없이 바로 입장하세요.',
                       'Only barcodes sent by mobile SMS or those on the reservation page can be used.' + _CRLF + 'Show smart-ticket to enter without printing.',
                       '予約詳細または携帯電話にSMS送信されたバーコードのみ使用できます。' + _CRLF + 'スマートチケットは出力せずにそのまま入場してください。',
                       '只能使用预订详细明细或发送至手机短信的的条形码。' + _CRLF + '电子票无需打印，即可入场。']),
        [GetTextLocale(['확인', 'Confirm', '確認', '确认'])], 5);
    end
    else
      MakeReserveList(SCH_BARCODE, LData, '');
  end;

  if (AMsg.Command = CPC_SET_DATETIME) then
    DispCurrentTime;

  if (AMsg.Command = CPC_APPLY_THEME) then
    ApplyTheme;

  if (AMsg.Command = CPC_SET_LOCALE) then
    ApplyLocale;
end;

procedure TPluginForm.btnChangeLocaleMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
//var
//  P: TPoint;
begin
  with panLocalePopup do
  begin
    Visible := not Visible;
    if Visible then
    begin
      if not tmrPopupCloser.Enabled then
        tmrPopupCloser.Enabled := True;
//      P := ClientToScreen(Point(0, 0));
//      SetCursorPos(P.X + (Width div 2), P.Y + (Height div 2));
    end;
  end;
end;

procedure TPluginForm.OnLocaleItemMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  with TPanel(Sender) do
  begin
    Top := (Top + 2);
    Left := (Left + 2);
  end;
end;

procedure TPluginForm.OnLocaleItemMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  with TPanel(Sender) do
  begin
    Top := (Top - 2);
    Left := (Left - 2);
    Global.KioskLocale := TKioskLocale(Tag);
    panLocalePopup.Visible := False;
  end;
end;

procedure TPluginForm.panSearchPhoneNoClick(Sender: TObject);
begin
  SelectPhoneNoPage;
end;

procedure TPluginForm.panSearchReserveNoClick(Sender: TObject);
begin
  SelectReserveNoPage;
end;

procedure TPluginForm.pgcTicketPrintChange(Sender: TObject);
begin
  with TcxPageControl(Sender) do
  begin
    btnChangeLocale.Visible := (ActivePageIndex < 2);
    panSearchMenu.Visible := Global.StoreInfo.SearchPhoneNo and
                             Global.StoreInfo.SearchReserveNo and
                             (ActivePageIndex < 2);
  end;
end;

procedure TPluginForm.btnClearBirthday1Click(Sender: TObject);
begin
  edtInputBirthday1.Text := '';
end;

procedure TPluginForm.btnClearBirthday2Click(Sender: TObject);
begin
  edtInputBirthday2.Text := '';
end;

procedure TPluginForm.btnClearPhoneNoClick(Sender: TObject);
begin
  edtInputPhoneNo.Text := '';
end;

procedure TPluginForm.btnClearReserveNoClick(Sender: TObject);
begin
  edtInputReserveNo.Text := '';
end;

procedure TPluginForm.btnGuideReserveNoClick(Sender: TObject);
begin
  with TGuidePopupForm.Create(nil) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TPluginForm.btnInputPhoneNoConfirmClick(Sender: TObject);
var
  LPhoneNo, LBirthday, LErrMsg: string;
begin
  LBirthday := Trim(edtInputBirthday1.Text);
  LPhoneNo := Trim(edtInputPhoneNo.Text);
  LErrMsg := '';
  if LPhoneNo.IsEmpty then
    LErrMsg := GetTextLocale(['휴대폰번호를 입력해 주세요.', 'Please enter your mobile phone number.', '携帯電話番号を入力してください。', '请输入手机号码。']);
  if (Global.StoreInfo.KioskIssueTypeCode = ITC_GENERAL) and
     (LBirthday.IsEmpty or (LBirthday.Length < 6)) then
    LErrMsg := GetTextLocale(['생년월일 6자리를 입력해 주세요.', 'Please enter your date of birth (YYMMDD).', '生年月日を6桁で入力してください。', '请输入6位数的出生年月日。']);
  if LErrMsg.IsEmpty then
    MakeReserveList(SCH_PHONE_NO, LPhoneNo, LBirthDay)
  else
    ShowMsgBoxError(LErrMsg,
      GetTextLocale(['확인 후 다시 시도하여 주십시오.', 'Please check before trying again.', '確認してからもう一度お試しください。', '请在确认后，重新试一次。']),
      [GetTextLocale(['확인', 'Confirm', '確認', '确认'])], 5);
end;

procedure TPluginForm.btnInputReservedNoConfirmClick(Sender: TObject);
var
  LReservedNo, LBirthday, LErrMsg: string;
begin
  LBirthday := Trim(edtInputBirthday2.Text);
  LReservedNo := Trim(edtInputReserveNo.Text);
  LErrMsg := '';
  if LReservedNo.IsEmpty then
    LErrMsg := GetTextLocale(['예매번호를 입력해 주세요.', 'Please enter reservation no.', '予約番号を入力してください。', '请输入预购号码。']);
  if (Global.StoreInfo.KioskIssueTypeCode = ITC_GENERAL) and
     (LBirthday.IsEmpty or (LBirthday.Length < 6))  then
    LErrMsg := GetTextLocale(['생년월일 6자리를 입력해 주세요.', 'Please enter your date of birth (YYMMDD).', '生年月日を6桁で入力してください。', '请输入6位数的出生年月日。']);
  if LErrMsg.IsEmpty then
    MakeReserveList(SCH_RESERVED_NO, LReservedNo, LBirthDay)
  else
    ShowMsgBoxError(LErrMsg,
      GetTextLocale(['확인 후 다시 시도하여 주십시오.', 'Please check before trying again.', '確認してからもう一度お試しください。', '请在确认后，重新试一次。']),
      [GetTextLocale(['확인', 'Confirm', '確認', '确认'])], 5);
end;

procedure TPluginForm.btnTicketHomeMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Global.KioskMode := KSM_HOME;
end;

procedure TPluginForm.btnTicketingHomeClick(Sender: TObject);
begin
  Global.KioskMode := KSM_NONE;
  Global.KioskMode := KSM_TICKETING_HOME;
end;

procedure TPluginForm.edtInputBirthday1Change(Sender: TObject);
begin
  with TEdit(Sender) do
  begin
    btnClearBirthday1.Visible := (Text <> '');
    if (Length(Text) >= 6) then
    begin
      edtInputPhoneNo.SetFocus;
      edtInputPhoneNo.SelStart := Length(edtInputPhoneNo.Text) + 1;
    end;
  end;
end;

procedure TPluginForm.edtInputBirthday1Enter(Sender: TObject);
begin
  FInputControl := TEdit(Sender);
  panInputBirthday1.Fill.Color := Global.ThemeInfo.Colors.input_face_entered;
  panInputBirthday1.Fill.BorderColor := Global.ThemeInfo.Colors.input_border_entered;
  with TEdit(Sender) do
  begin
    SelStart := Length(Text) + 1;
    Color := Global.ThemeInfo.Colors.input_face_entered;
    Font.Color := Global.ThemeInfo.Colors.input_font_entered;
    btnClearBirthday1.Visible := (Text <> '');
  end;
end;

procedure TPluginForm.edtInputBirthday1Exit(Sender: TObject);
begin
  panInputBirthday1.Fill.Color := Global.ThemeInfo.Colors.input_face_default;
  panInputBirthday1.Fill.BorderColor := Global.ThemeInfo.Colors.input_border_default;
  btnClearBirthday1.Visible := False;
  with TEdit(Sender) do
  begin
    Color := Global.ThemeInfo.Colors.input_face_default;
    Font.Color := Global.ThemeInfo.Colors.input_font_default;
  end;
end;

procedure TPluginForm.edtInputBirthday2Change(Sender: TObject);
begin
  with TEdit(Sender) do
  begin
    btnClearBirthday2.Visible := (Text <> '');
    if (Length(Text) >= 6) then
    begin
      edtInputReserveNo.SetFocus;
      edtInputReserveNo.SelStart := Length(edtInputReserveNo.Text) + 1;
    end;
  end;
end;

procedure TPluginForm.edtInputBirthday2Enter(Sender: TObject);
begin
  FInputControl := TEdit(Sender);
  panInputBirthday2.Fill.Color := Global.ThemeInfo.Colors.input_face_entered;
  panInputBirthday2.Fill.BorderColor := Global.ThemeInfo.Colors.input_border_entered;
  with TEdit(Sender) do
  begin
    SelStart := Length(Text) + 1;
    Color := Global.ThemeInfo.Colors.input_face_entered;
    Font.Color := Global.ThemeInfo.Colors.input_font_entered;
    btnClearBirthday2.Visible := (Text <> '');
  end;
end;

procedure TPluginForm.edtInputBirthday2Exit(Sender: TObject);
begin
  panInputBirthday2.Fill.Color := Global.ThemeInfo.Colors.input_face_default;
  panInputBirthday2.Fill.BorderColor := Global.ThemeInfo.Colors.input_border_default;
  btnClearBirthday2.Visible := False;
  with TEdit(Sender) do
  begin
    Color := Global.ThemeInfo.Colors.input_face_default;
    Font.Color := Global.ThemeInfo.Colors.input_font_default;
  end;
end;

procedure TPluginForm.edtInputPhoneNoChange(Sender: TObject);
begin
  btnClearPhoneNo.Visible := (TEdit(Sender).Text <> '');
end;

procedure TPluginForm.edtInputPhoneNoEnter(Sender: TObject);
begin
  FInputControl := TEdit(Sender);
  panInputPhoneNo.Fill.Color := Global.ThemeInfo.Colors.input_face_entered;
  panInputPhoneNo.Fill.BorderColor := Global.ThemeInfo.Colors.input_border_entered;
  with TEdit(Sender) do
  begin
    SelStart := Length(Text) + 1;
    Color := Global.ThemeInfo.Colors.input_face_entered;
    Font.Color := Global.ThemeInfo.Colors.input_font_entered;
    btnClearPhoneNo.Visible := (Text <> '');
  end;
end;

procedure TPluginForm.edtInputPhoneNoExit(Sender: TObject);
begin
  panInputPhoneNo.Fill.Color := Global.ThemeInfo.Colors.input_face_default;
  panInputPhoneNo.Fill.BorderColor := Global.ThemeInfo.Colors.input_border_default;
  btnClearPhoneNo.Visible := False;
  with TEdit(Sender) do
  begin
    Color := Global.ThemeInfo.Colors.input_face_default;
    Font.Color := Global.ThemeInfo.Colors.input_font_default;
  end;
end;

procedure TPluginForm.edtInputReserveNoChange(Sender: TObject);
begin
  btnClearReserveNo.Visible := (TEdit(Sender).Text <> '');
end;

procedure TPluginForm.edtInputReserveNoEnter(Sender: TObject);
begin
  FInputControl := TEdit(Sender);
  panInputReserveNo.Fill.Color := Global.ThemeInfo.Colors.input_face_entered;
  panInputReserveNo.Fill.BorderColor := Global.ThemeInfo.Colors.input_border_entered;
  with TEdit(Sender) do
  begin
    SelStart := Length(Text) + 1;
    Color := Global.ThemeInfo.Colors.input_face_entered;
    Font.Color := Global.ThemeInfo.Colors.input_font_entered;
    btnClearReserveNo.Visible := (Text <> '');
  end;
end;

procedure TPluginForm.edtInputReserveNoExit(Sender: TObject);
begin
  panInputReserveNo.Fill.Color := Global.ThemeInfo.Colors.input_face_default;
  panInputReserveNo.Fill.BorderColor := Global.ThemeInfo.Colors.input_border_default;
  btnClearReserveNo.Visible := False;
  with TEdit(Sender) do
  begin
    Color := Global.ThemeInfo.Colors.input_face_default;
    Font.Color := Global.ThemeInfo.Colors.input_font_default;
  end;
end;

procedure TPluginForm.OnNumButtonClick(Sender: TObject);
var
  LKey: Integer;
begin
  LKey := TcxButton(Sender).Tag;
  if (LKey = 239) then //모두 지우기
    FInputControl.Text := ''
  else
  begin
    SimulateKeyDown(LKey);
    SimulateKeyUp(LKey);
  end;
end;

procedure TPluginForm.SelectPhoneNoPage;
begin
  InputClear;
  ShowNumPad(panBodyTicketPrintPhoneNoInput, 0, 170);
  panSearchPhoneNo.Font.Color := Global.ThemeInfo.Colors.black;
  lblPhoneNoIndicator.Visible := True;
  panSearchReserveNo.Font.Color := Global.ThemeInfo.Colors.type4;
  lblReserveNoIndicator.Visible := False;
  pgcTicketPrint.ActivePage := tabSearchPhoneNo;
  if (Global.StoreInfo.KioskIssueTypeCode = ITC_INTERGRATION) then
    edtInputPhoneNo.SetFocus
  else
    edtInputBirthday1.SetFocus;
end;

procedure TPluginForm.SelectReserveNoPage;
begin
  InputClear;
  ShowNumPad(panBodyTicketPrintReserveNoInput, 0, 170);
  panSearchReserveNo.Font.Color := Global.ThemeInfo.Colors.black;
  lblReserveNoIndicator.Visible := True;
  panSearchPhoneNo.Font.Color := Global.ThemeInfo.Colors.type4;
  lblPhoneNoIndicator.Visible := False;
  pgcTicketPrint.ActivePage := tabSearchReservedNo;
  if (Global.StoreInfo.KioskIssueTypeCode = ITC_INTERGRATION) then
    edtInputReserveNo.SetFocus
  else
    edtInputBirthday2.SetFocus;
end;

function TPluginForm.GetBirthday1: string;
begin
  Result := edtInputBirthday1.Text;
end;

procedure TPluginForm.SetBirthday1(const AValue: string);
begin
  edtInputBirthday1.Text := AValue;
end;

function TPluginForm.GetBirthday2: string;
begin
  Result := edtInputBirthday2.Text;
end;

procedure TPluginForm.SetBirthday2(const AValue: string);
begin
  edtInputBirthday2.Text := AValue;
end;

function TPluginForm.GetPhoneNo: string;
begin
  Result := edtInputPhoneNo.Text;
end;

procedure TPluginForm.SetPhoneNo(const AValue: string);
begin
  edtInputPhoneNo.Text := AValue;
end;

function TPluginForm.GetReservedNo: string;
begin
  Result := edtInputReserveNo.Text;
end;

procedure TPluginForm.SetReservedNo(const AReserveNo: string);
begin
  edtInputReserveNo.Text := AReserveNo;
end;

procedure TPluginForm.SetReserveUserName(const AReserveUserName: string);
begin
  FReserveUserName := AReserveUserName;
  lblReserveUserNameTrail.Align := alRight;

  if Global.KioskLocale = TKioskLocale.klKorean then
    lblReserveUserName.Caption := FReserveUserName + '님'
  else
    lblReserveUserName.Caption := FReserveUserName;

  lblReserveUserNameTrail.Align := alLeft;
end;

procedure TPluginForm.ShowNumPad(AContainer: TWinControl; const X, Y: Integer);
begin
  panNumPad.Parent := AContainer;
  panNumPad.Top := Y;
  panNumPad.Left := X;
  for var I := 0 to Pred(LCN_NUMPAD_BTN_COUNT) do
    MakeRoundedControl(FNumButtons[I]);
end;

procedure TPluginForm.tmrPopupCloserTimer(Sender: TObject);
begin
  try
    with panLocalePopup do
      if Visible then
        Visible := False;
  finally
    TTimer(Sender).Enabled := False;
  end;
end;

procedure TPluginForm.ClearReserveList;
begin
  sbxReserveList.Visible := False;
  try
    for var I := Pred(Global.ReserveList.Count) downto 0 do
      Global.ReserveList.Delete(I);
  finally
    sbxReserveList.Visible := True;
  end;
end;

procedure TPluginForm.MakeReserveList(const ASearchType: Integer; const ASearchValue, ABirthDay: string);
var
  RI: TReserveItem;
  MS: TMemoryStream;
  SL: TStringList;
  LTicketNoList: TArray<string>;
  LDataCount, LIndex: Integer;
  LReserveUserName, LNoDataMsg, LMsgText, LErrMsg: string;
  LNoDataMode: Boolean;
begin
  LDataCount := 0;
  LNoDataMode := False;
  try
    ShowWaitMsg(GetTextLocale([
      '예매정보를 조회 중입니다...' + _CRLF + '잠시만 기다려 주십시오.',
      'Retrieving reservation history…' + _CRLF + 'Please hold.',
      '予約情報を照会中です。' + _CRLF + 'しばらくお待ちください。',
      '正在查询预购信息，' + _CRLF + '请稍后。']));

    LastSearchType := ASearchType;
    LastSearchValue := ASearchValue;
    MS := TMemoryStream.Create;
    SL := TStringList.Create;
    try
      ClearReserveList;
      if not DM.GetReserveList(ASearchType, ASearchValue, ABirthDay, LDataCount, LReserveUserName, LErrMsg) then
        raise Exception.Create(LErrMsg);

      if (LDataCount = 0) then
      begin
        LNoDataMode := True;
        LNoDataMsg := GetTextLocale(['조회할 예매내역이 없습니다.', 'Unable to retrieve reservation details.', '照会する予約履歴がありません。', '无所查询预购明细。']);
        case ASearchType of
          SCH_PHONE_NO:
            begin
              //LNoDataMsg := GetTextLocale(['예매내역이 없거나 ' + IfThen(Global.StoreInfo.KioskIssueTypeCode = ITC_GENERAL, '생년월일, 혹은 ', '') + _CRLF + '휴대폰번호를 잘못 입력하셨습니다.',
                //'The reservation doesn''t exist,' + _CRLF + 'or you entered an incorrect ' + IfThen(Global.StoreInfo.KioskIssueTypeCode = ITC_GENERAL, 'date of birth or ', '') +'cell phone number.']);
              If (Global.StoreInfo.KioskIssueTypeCode = ITC_GENERAL) then
              begin
                LNoDataMsg := GetTextLocale(['예매내역이 없거나 생년월일, ' + _CRLF + '혹은 휴대폰번호를 잘못 입력하셨습니다.',
                                             'The reservation doesn''t exist ' + _CRLF + 'or you may have entered wrong information (date of birth or phone number).',
                                             '予約履歴がないか、' + _CRLF + '生年月日または携帯電話番号が正しくありません。',
                                             '不存在预购明细或出生年月日、' + _CRLF + '手机号码输入错误。']);
              end
              else
              begin
                LNoDataMsg := GetTextLocale(['예매내역이 없거나 ' + _CRLF + '휴대폰번호를 잘못 입력하셨습니다.',
                                             'The reservation doesn''t exist ' + _CRLF + 'or you may have entered wrong phone number.',
                                             '予約履歴がないか、' + _CRLF + '携帯電話番号が正しくありません。',
                                             '不存在预购明细或手机号码输入错误。']);
              end;
            end;
          SCH_RESERVED_NO:
            begin
              //LNoDataMsg := GetTextLocale(['예매내역이 없거나 ' + IfThen(Global.StoreInfo.KioskIssueTypeCode = ITC_GENERAL, '생년월일, 혹은 ', '') + _CRLF + '예매번호를 잘못 입력하셨습니다.',
                //'The reservation doesn''t exist,' + _CRLF + 'or you entered an incorrect ' + IfThen(Global.StoreInfo.KioskIssueTypeCode = ITC_GENERAL, 'date of birth or ', '') +'reservation number.']);
              If (Global.StoreInfo.KioskIssueTypeCode = ITC_GENERAL) then
              begin
                LNoDataMsg := GetTextLocale(['예매내역이 없거나 생년월일, 혹은 ' + _CRLF + '예매번호를 잘못 입력하셨습니다.',
                                             'The reservation doesn''t exist ' + _CRLF + 'or you may have entered wrong date of birth or reservation number.',
                                             '予約履歴がないか、' + _CRLF + '生年月日またはは予約番号が正しくありません。',
                                             '不存在预购明细或出生年月日、' + _CRLF + '预购号码输入错误。']);
              end
              else
              begin
                LNoDataMsg := GetTextLocale(['예매내역이 없거나 ' + _CRLF + '예매번호를 잘못 입력하셨습니다.',
                                             'The reservation doesn''t exist ' + _CRLF + 'or you may have entered wrong reservation number.',
                                             '予約履歴がないか、' + _CRLF + '予約番号が正しくありません。',
                                             '不存在预购明细或预购号码输入错误。']);
              end;
            end;
          SCH_BARCODE:
            LNoDataMsg := GetTextLocale(['유효하지 않은 바코드 입니다.', 'Invalid barcode.', '無効なバーコードです。', '条形码失效。']);
        end;

        raise Exception.Create(LNoDataMsg);
      end;

      with DM.MTReserveList do
      begin
        LIndex := 0;
        First;
        while not Eof do
        begin
          LTicketNoList := SplitString(FieldByName('ticketable_ticket_no_list').AsString, ',');
          MS.Clear;
          TBlobField(FieldByName('product_image')).SaveToStream(MS);
          MS.Position := 0;

          RI := TReserveItem.Create(Self.Handle);
          RI.ItemIndex := LIndex;
          RI.ProductId := FieldByName('product_id').AsInteger;
          RI.ScheduleId := FieldByName('schedule_id').AsInteger;
          RI.ProductName := FieldByName('product_name').AsString;
          RI.ProductNameEN := FieldByName('product_name_eng').AsString;
          RI.PlaceName := FieldByName('place_name').AsString;
          RI.PlaceNameEN := FieldByName('place_name_eng').AsString;
          RI.ProductDateTime := FieldByName('product_datetime').AsString; //반드시 RI.UpdateLocale 보다 먼저 선언
          RI.ReserveNo := FieldByName('reserve_no').AsLargeInt;
          RI.ExternalReserveNo := FieldByName('external_reserve_no').AsString;
          RI.ReserveCount := FieldByName('reserve_count').AsInteger;
          RI.SeatAttributeInfo := FieldByName('seat_attribute_info').AsString;
          RI.ReserveUserName := FieldByName('reserve_user_name').AsString;
          RI.IsQualificationNeeded := FieldByName('is_qualification_needed').AsBoolean;
          RI.ProductClassType := FieldByName('product_class_type').AsString;
          RI.ExternalServiceType := FieldByName('external_service_type').AsString;
          RI.ExternalServiceTypeName := FieldByName('external_service_type_name').AsString;
          RI.IsDenominationDescriptionExposure := FieldByName('is_denomination_description_exposure').AsBoolean;
          SL.Text := FieldByName('denomination_description_list').AsString;
          for var I: ShortInt := 0 to Pred(SL.Count) do
          begin
            LMsgText := StringReplace(SL[I], _CRLF, '', [rfReplaceAll]);
            if not LMsgText.IsEmpty then
              RI.DenominationDescriptionList.Add(LMsgText);
          end;
          for var I: ShortInt := 0 to Pred(Length(LTicketNoList)) do
            RI.TicketNoList.Add(LTicketNoList[I]);
          RI.ProductImage.Picture.LoadFromStream(MS);
          RI.BasePanel.Parent := sbxReserveList;
          RI.UpdateLocale;
          Global.ReserveList.Add(RI);

          MakeRoundedControl(RI.ProductImageContainer, 15, 15);
          MakeRoundedControl(RI.PrintButton, 15, 15);
          RI.PrintButton.Colors.Default := Global.ThemeInfo.Colors.btn_face_default;
          RI.PrintButton.Colors.DefaultText := Global.ThemeInfo.Colors.btn_font_default;
          RI.PrintButton.Colors.Normal := Global.ThemeInfo.Colors.btn_face_default;
          RI.PrintButton.Colors.NormalText := Global.ThemeInfo.Colors.btn_font_default;
          RI.PrintButton.Colors.Pressed := Global.ThemeInfo.Colors.btn_face_pressed;
          RI.PrintButton.Colors.PressedText := Global.ThemeInfo.Colors.btn_font_pressed;
          RI.PrintButton.OnCustomDraw := Global.OnCxButtonCustomDraw;

          Inc(LIndex);
          Next;
        end;
      end;

      pgcTicketPrint.ActivePage := tabReserveList;
      ReserveUserName := LReserveUserName;
    finally
      FreeAndNil(SL);
      FreeAndNil(MS);
      PushWaitMsg;
    end;
  except
    on E: Exception do
      if LNoDataMode then
      begin
        ShowMsgBoxError(LNoDataMsg, GetTextLocale(['매표소에 문의하여 주시기 바랍니다.', 'Please visit the ticket office. ', 'チケット売り場にお問い合わせください。', '请与售票处咨询。']),
          [GetTextLocale(['확인', 'Confirm', '確認', '确认'])], 5);
        Global.KioskMode := KSM_TICKETING_HOME;
      end
      else
        ShowMsgBoxError(GetTextLocale(['오류가 발생했습니다.' + _CRLF + '문제가 지속되면 매표소에 문의하여 주시기 바랍니다.',
                                       'Error has occurred.' + _CRLF + 'Please contact the ticket office, if the error maintains.',
                                       'エラーが発生しました。' + _CRLF + '問題が解決しない場合は、チケット売り場にお問い合わせください。',
                                       '发生错误。' + _CRLF + '若问题一直无法解决，请与售票处咨询。']),
          E.Message, [GetTextLocale(['확인', 'Confirm', '確認', '确认'])], 5);
  end;
end;

procedure TPluginForm.DispCurrentTime;
begin
  case Global.KioskLocale of
    TKioskLocale.klKorean:
      begin
        lblCurrentDateTime.Caption := Format('%d월 %d일 (%s) %d:%s', [
            StrToInt(Global.CurrentDate.Substring(4, 2)), StrToInt(Global.CurrentDate.Substring(6, 2)),
            Global.DayOfWeekName, StrToInt(Global.CurrentTime.Substring(0, 2)), Global.CurrentTime.Substring(2, 2)]);
      end;
    TKioskLocale.klJapanese,
    TKioskLocale.klChinese:
      begin
        lblCurrentDateTime.Caption := Format('%d月 %d日 (%s) %d:%s', [
            StrToInt(Global.CurrentDate.Substring(4, 2)), StrToInt(Global.CurrentDate.Substring(6, 2)),
            Global.DayOfWeekNameCN, StrToInt(Global.CurrentTime.Substring(0, 2)), Global.CurrentTime.Substring(2, 2)]);
      end;
    else
      lblCurrentDateTime.Caption := Global.FormattedCurrentDateTimeEN;
  end;
end;

procedure TPluginForm.InputClear;
begin
  BirthDay1 := '';
  BirthDay2 := '';
  PhoneNo := '';
  ReservedNo := '';
  ReserveUserName := '';
end;

procedure TPluginForm.DoBarcodeReady;
var
  PM: TPluginMessage;
begin
  if (not Global.StoreInfo.ExposureBarcodeSearch) then
    Exit;

  PM := TPluginMessage.Create(nil);
  try
    if (Global.PluginInfo.BarcodeReadyPluginId <> 0) then
    begin
      PM.Command := CPC_SET_FOREGROUND;
      PM.PluginMessageToID(Global.PluginInfo.BarcodeReadyPluginId);
    end
    else
    begin
      PM.Command := CPC_INIT;
      PM.AddParams(CPP_OWNER_ID, Self.PluginID);
      if (PluginManager.OpenModal('TLBarcodeReady.bpl', PM) = mrCancel) then
        Global.KioskMode := KSM_HOME;
    end;
  finally
    FreeAndNil(PM);
  end;
end;

function TPluginForm.DoPrintTicket(const AItemIndex: Integer): Boolean;
var
  LTicketCount: Integer;
  LMsgText, LErrMsg: string;
begin
  Result := False;
  try
    Global.PrintingProgress := True;
    try
{$IFDEF RELEASE}
      if (Global.TicketPrinter.Enabled and (not Global.TicketPrinter.Active)) or
         ((not Global.ReceiptPrinter.Enabled) or (not Global.ReceiptPrinter.Active)) then
        raise Exception.Create('티켓/영수증 프린터 사용 불가.');
{$ENDIF}
      //예매동의 문구 표시 설정이 되어 있을 경우 예매동의 문구 노출
      //15초간 대기 중 확인 버튼을 누르지 않으면 발권 취소
      //2023.04.03 김철우 과장 요청
      if Global.ReserveList[AItemIndex].IsDenominationDescriptionExposure then
        for var I: ShortInt := 0 to Pred(Global.ReserveList[AItemIndex].DenominationDescriptionList.Count) do
        begin
          LMsgText := StringReplace(Global.ReserveList[AItemIndex].DenominationDescriptionList[I], '\n', _CRLF, [rfReplaceAll, rfIgnoreCase]);
          if (not LMsgText.IsEmpty) and
             (ShowMsgBoxConfirm(LMsgText, '', [GetTextLocale(['확인', 'Confirm', '確認', '确认']), GetTextLocale(['취소', 'Back', 'キャンセル', '取消'])], 15) <> mrOK) then
            Exit;
        end;

      if not DM.GetTicketList(Global.ReserveList[AItemIndex].ReserveNo, LTicketCount, LErrMsg) then
        raise Exception.Create(LErrMsg);
      if (LTicketCount = 0) then
        raise Exception.Create(Format(GetTextLocale(['예매번호[%d] 티켓 조회 불가',
                                                     'Unable to retrieve reservation number[%d]',
                                                     '予約番号「%d」チケット照会不可',
                                                     '无法查询预购号码[%d]相应的门票']), [Global.ReserveList[AItemIndex].ReserveNo]));

      ShowPrintingDialog(Global.ReceiptInfo.ReceiptNo, Global.ReceiptInfo.ReserveNo);
      Result := True;
    finally
      ClosePrintingDialog;
      Global.PrintingProgress := False;
      Global.KioskMode := KSM_HOME;
    end;
  except
    on E: Exception do
    begin
      ShowMsgBoxError(
        GetTextLocale(['티켓을 출력할 수 없습니다.' + _CRLF + '매표소로 문의하여 주시기 바랍니다.',
                       'Unable to print tickets.' + _CRLF + 'Please visit the ticket office.',
                       'チケットを出力できません。' + _CRLF + 'チケット売り場にお問い合わせください。',
                       '无法出票。' + _CRLF + '请与售票处咨询。']),
        E.Message, [GetTextLocale(['확인', 'Confirm', '確認', '确认'])], 5);
      AddLog(Format('Ticketing.DoPrintTicket.Exception = %s', [E.Message]));
    end;
  end;
end;

procedure TPluginForm.ApplyTheme;
var
  I: ShortInt;
begin
  if FThemeUpdated then
    Exit;
  with Global.ThemeInfo do
  try
    Self.Color := Colors.background1;
    lblBodyMainStartNotice.Color := Colors.background1;
    lblBodyMainStartNotice.Font.Color := Colors.type4;

    { 상단 패널 }
    panTop.Color := Colors.background1;
    panTopLeft.Color := Colors.background1;
    panTopCenter.Color := Colors.background1;
    panTopRight.Color := Colors.background1;
    lblHeadSeparator.Color := Colors.line2;
    StreamToPicture(btnTicketHome.Picture, Images.ico_home.Stream);

    { 언어 선택 }
    btnChangeLocale.Appearance.Font.Color := Colors.black;
    btnChangeLocale.BevelColor := Colors.black;
    btnChangeLocale.Color := Colors.background1;
    panLocalePopup.Color := Colors.background1;
    for I := 0 to Pred(LCN_LOCALE_BTN_COUNT) do
    begin
      FLocaleButtons[I].Color := Colors.keypad_face_default;
      FLocaleButtons[I].Font.Color := Colors.keypad_font_default;
    end;

    panBodyHeadTitle.AutoSize := False;
    panBodyHeadTitle.Color := Colors.background1;
    panBodyHeadTitle.Top := ((panTopCenter.Height - lblCurrentDateTime.Height) div 2) - (panBodyHeadTitle.Height div 2);
    panBodyHeadTitle.Left := (panTopCenter.Width div 2) - (panBodyHeadTitle.Width div 2);
    panBodyHeadTitle.AutoSize := True;

    panSearchPhoneNo.Color := Colors.background1;
    panSearchReserveNo.Color := Colors.background1;

    pgcTicketPrint.Color := Colors.background1;
    tabSearchPhoneNo.Color := Colors.background1;
    tabSearchReservedNo.Color := Colors.background1;
    tabReserveList.Color := Colors.background1;

    lblBodyHeadTicketPrint.Color := Colors.background1;
    lblBodyHeadTicketPrint.Font.Color := Colors.black;
    lblCurrentDateTime.Color := Colors.background1;
    lblCurrentDateTime.Font.Color := Colors.black;
    lblPhoneNoIndicator.Color := Colors.black;
    lblReserveNoIndicator.Color := Colors.black;
    lblHeadSeparator.Color := Colors.line2;

    { 숫자 패드 }
    panNumPad.Color := Colors.background1;
    for I := 0 to Pred(LCN_NUMPAD_BTN_COUNT) do
    begin
      FNumButtons[I].Colors.Normal := Colors.keypad_face_default;
      FNumButtons[I].Colors.NormalText := Colors.keypad_font_default;
      FNumButtons[I].Colors.Pressed := Colors.keypad_face_pressed;
      FNumButtons[I].Colors.PressedText := Colors.keypad_font_pressed;
    end;

    { 휴대폰 번호로 조회 페이지 }
    panBodyTicketPrintPhoneNoInput.Color := Colors.background1;
    //생년월일 입력
    lblInputBirthday1.Color := Colors.background1;
    lblInputBirthday1.Font.Color := Colors.black;
    panInputBirthday1.Fill.Color := Colors.input_face_default;
    panInputBirthday1.Fill.BorderColor := Colors.input_border_default;
    edtInputBirthday1.Color := Colors.input_face_default;
    edtInputBirthday1.Font.Color := Colors.input_font_default;
    StreamToPicture(btnClearBirthday1.Picture, Images.btn_delete_default.Stream);
    StreamToPicture(btnClearBirthday1.PictureDown, Images.btn_delete_pressed.Stream);
    StreamToPicture(btnClearBirthday1.PictureDisabled, Images.btn_delete_disabled.Stream);
    //휴대폰번호 입력
    lblInputPhoneNo.Color := Colors.background1;
    lblInputPhoneNo.Font.Color := Colors.black;
    panInputPhoneNo.Fill.Color := Colors.input_face_default;
    panInputPhoneNo.Fill.BorderColor := Colors.input_border_default;
    edtInputPhoneNo.Color := Colors.input_face_default;
    edtInputPhoneNo.Font.Color := Colors.input_font_default;
    StreamToPicture(btnClearPhoneNo.Picture, Images.btn_delete_default.Stream);
    StreamToPicture(btnClearPhoneNo.PictureDown, Images.btn_delete_pressed.Stream);
    StreamToPicture(btnClearPhoneNo.PictureDisabled, Images.btn_delete_disabled.Stream);
    //확인 버튼
    btnInputPhoneNoConfirm.Colors.Normal := Colors.btn_face_default;
    btnInputPhoneNoConfirm.Colors.NormalText := Colors.btn_font_default;
    btnInputPhoneNoConfirm.Colors.Pressed := Colors.btn_face_pressed;
    btnInputPhoneNoConfirm.Colors.PressedText := Colors.btn_font_pressed;
    btnInputPhoneNoConfirm.Colors.Disabled := Colors.btn_face_disabled;
    btnInputPhoneNoConfirm.Colors.DisabledText := Colors.btn_font_disabled;

    { 예매번호로 조회 }
    panBodyTicketPrintReserveNoInput.Color := Colors.background1;
    //생년월일 입력
    lblInputBirthday2.Font.Color := Colors.black;
    panInputBirthday2.Fill.Color := Colors.input_face_default;
    panInputBirthday2.Fill.BorderColor := Colors.input_border_default;
    edtInputBirthday2.Color := Colors.input_face_default;
    edtInputBirthday2.Font.Color := Colors.input_font_default;
    StreamToPicture(btnClearBirthday2.Picture, Images.btn_delete_default.Stream);
    StreamToPicture(btnClearBirthday2.PictureDown, Images.btn_delete_pressed.Stream);
    StreamToPicture(btnClearBirthday2.PictureDisabled, Images.btn_delete_disabled.Stream);
    //안내 버튼
    btnGuideReserveNo.Color := Colors.black;
    btnGuideReserveNo.Appearance.Font.Color := Colors.white;
    //예매번호 입력
    lblInputReserveNo.Font.Color := Colors.black;
    panInputReserveNo.Fill.Color := Colors.input_face_default;
    panInputReserveNo.Fill.BorderColor := Colors.input_border_default;
    edtInputReserveNo.Color := Colors.input_face_default;
    edtInputReserveNo.Font.Color := Colors.input_font_default;
    StreamToPicture(btnClearReserveNo.Picture, Images.btn_delete_default.Stream);
    StreamToPicture(btnClearReserveNo.PictureDown, Images.btn_delete_pressed.Stream);
    StreamToPicture(btnClearReserveNo.PictureDisabled, Images.btn_delete_disabled.Stream);
    //확인 버튼
    btnInputReservedNoConfirm.Colors.Normal := Colors.btn_face_default;
    btnInputReservedNoConfirm.Colors.NormalText := Colors.btn_font_default;
    btnInputReservedNoConfirm.Colors.Pressed := Colors.btn_face_pressed;
    btnInputReservedNoConfirm.Colors.PressedText := Colors.btn_font_pressed;
    btnInputReservedNoConfirm.Colors.Disabled := Colors.btn_face_disabled;
    btnInputReservedNoConfirm.Colors.DisabledText := Colors.btn_font_disabled;

    { 예매 내역 페이지 }
    panReserveInfo.Color := Colors.background1;
    panUserInfo.Color := Colors.background1;
    lblReserveUserName.Color := Colors.background1;
    lblReserveUserName.Font.Color := Colors.black;
    lblReserveUserNameTrail.Color := Colors.background1;
    lblReserveUserNameTrail.Font.Color := Colors.black;
    lblMemberNotice.Font.Color := Colors.type4;
    sbxReserveList.Color := Colors.background1;
    //다시 조회하기 버튼
    btnTicketingHome.Font.Color := Colors.black;
    btnTicketingHome.InnerBorderColor := Colors.black;
    btnTicketingHome.OuterBorderColor := Colors.black;
    btnTicketingHome.BackColor := Colors.background1;
    btnTicketingHome.ForeColor := Colors.background1;
    btnTicketingHome.GlowColor := Colors.background1;
    btnTicketingHome.ShineColor := Colors.background1;
    StreamToPicture(btnTicketingHome.Picture, Images.ico_refresh.Stream);
  finally
    FThemeUpdated := True;
  end;
end;

procedure TPluginForm.ApplyLocale;
begin
  try
    panBodyHeadTitle.AutoSize := False;
    UpdateLocalePopup;
    case Global.KioskLocale of
      TKioskLocale.klKorean:
        begin
          lblBodyHeadTicketPrint.Caption := '예매티켓 출력';
          panSearchPhoneNo.Caption := '휴대폰번호로 조회';
          panSearchReserveNo.Caption := '예매번호로 조회';
          lblInputBirthday1.Caption := '생년월일 6자리';
          edtInputBirthday1.TextHint := '<생년월일 6자리>';
          lblInputBirthday2.Caption := '생년월일 6자리';
          edtInputBirthday2.TextHint := '<생년월일 6자리>';
          lblInputPhoneNo.Caption := '휴대폰번호';
          edtInputPhoneNo.TextHint := '<휴대폰번호>';
          lblInputReserveNo.Caption := '예매번호';
          edtInputReserveNo.TextHint := '<예매번호>';
          btnNum10.Caption := '모두' + _CRLF + '지우기';
          btnInputPhoneNoConfirm.Caption := '확인';
          btnInputReservedNoConfirm.Caption := '확인';

          lblReserveUserNameTrail.Caption := ' 의 예매내역 입니다.';
          btnTicketingHome.Caption := '다시 조회하기';
          lblMemberNotice.Top := 100;
          lblMemberNotice.Height := 32;
          lblMemberNotice.Caption := '예매내역을 확인하신 후 티켓을 출력해 주시기 바랍니다.';
          lblBodyMainStartNotice.Caption := '외국인 전용 티켓링크 사이트를 통해 예매한 티켓은 키오스크 발권이 불가합니다.' + _CRLF +
          '티켓정보 확인을 위해 매표소를 이용해주시기 바랍니다.';
        end;
      TKioskLocale.klEnglish:
        begin
          lblBodyHeadTicketPrint.Caption := 'PRINT TICKET';
          panSearchPhoneNo.Caption := 'Search by phone number';
          panSearchReserveNo.Caption := 'Search by reservation ';
          lblInputBirthday1.Caption := 'Date of birth (YYMMDD)';
          edtInputBirthday1.TextHint := 'ex. 880519';
          lblInputBirthday2.Caption := 'Date of birth (YYMMDD)';
          edtInputBirthday2.TextHint := 'ex. 880519';
          lblInputPhoneNo.Caption := 'Mobile Phone No.';
          edtInputPhoneNo.TextHint := 'ex. 01012345678';
          lblInputReserveNo.Caption := 'Reservation No. ';
          edtInputReserveNo.TextHint := 'ex. 1200012345';
          btnNum10.Caption := 'Clear';
          btnInputPhoneNoConfirm.Caption := 'Continue';
          btnInputReservedNoConfirm.Caption := 'Continue';

          lblReserveUserNameTrail.Caption := ' Here are your reservation details.';
          btnTicketingHome.Caption := 'Check again';
          lblMemberNotice.Top := 42;
          lblMemberNotice.Height := 96;
          lblMemberNotice.Caption := 'Please review the details and print your ticket.';
          lblBodyMainStartNotice.Caption := 'All the tickets reserved through ''foreigner-only Ticketlink website'' CANNOT be printed through the Kiosk.' + _CRLF +
          ' Please use offline ticket box to access your ticket information.';
        end;
      TKioskLocale.klJapanese:
        begin
          lblBodyHeadTicketPrint.Caption := '予約チケットを 出力する';
          panSearchPhoneNo.Caption := '携帯電話番号で照会';
          panSearchReserveNo.Caption := '予約番号で照会';
          lblInputBirthday1.Caption := '生年月日（6桁）';
          edtInputBirthday1.TextHint := 'ex. 880519';
          lblInputBirthday2.Caption := '生年月日（6桁）';
          edtInputBirthday2.TextHint := 'ex. 880519';
          lblInputPhoneNo.Caption := '携帯電話番号';
          edtInputPhoneNo.TextHint := 'ex. 01012345678';
          lblInputReserveNo.Caption := '予約番号';
          edtInputReserveNo.TextHint := 'ex. 1200012345';
          btnNum10.Caption := 'すべて消去';
          btnInputPhoneNoConfirm.Caption := '確認';
          btnInputReservedNoConfirm.Caption := '確認';

          lblReserveUserNameTrail.Caption := ' 様の予約詳細です。';
          btnTicketingHome.Caption := 'Check again';
          lblMemberNotice.Top := 42;
          lblMemberNotice.Height := 96;
          lblMemberNotice.Caption := '予約詳細をご確認の上、チケットを出力してください。';
          lblBodyMainStartNotice.Caption := '外国人専用のチケットリンクサイトにて予約したチケットは、キオスク発券ができません。' + _CRLF +
          'チケット情報を確認するため、チケット売り場をご利用ください。';
        end;
      TKioskLocale.klChinese:
        begin
          lblBodyHeadTicketPrint.Caption := '打印预购票';
          panSearchPhoneNo.Caption := '手机号码查询';
          panSearchReserveNo.Caption := '预购号码查询';
          lblInputBirthday1.Caption := '出生年月日（6位数字）';
          edtInputBirthday1.TextHint := 'ex. 880519';
          lblInputBirthday2.Caption := '出生年月日（6位数字）';
          edtInputBirthday2.TextHint := 'ex. 880519';
          lblInputPhoneNo.Caption := '手机号码';
          edtInputPhoneNo.TextHint := 'ex. 01012345678';
          lblInputReserveNo.Caption := '预购号码';
          edtInputReserveNo.TextHint := 'ex. 1200012345';
          btnNum10.Caption := '全部删除';
          btnInputPhoneNoConfirm.Caption := '确认';
          btnInputReservedNoConfirm.Caption := '确认';

          lblReserveUserNameTrail.Caption := ' 的预购明细。';
          btnTicketingHome.Caption := 'Check again';
          lblMemberNotice.Top := 42;
          lblMemberNotice.Height := 96;
          lblMemberNotice.Caption := '请确认预购明细无误后打印。';
          lblBodyMainStartNotice.Caption := 'KIOSK暂不支持打印通过外国人专用购票链接网站购买的票。' + _CRLF +
          '请您前往售票处确认购票信息。';
        end;
    end;

    //파트너사 로고 이미지는 Setting API를 통해 별도 다운로드
    with Global.ThemeInfo do
    if (Images.ico_partner.Stream.Size > 0) then
      StreamToPicture(imgLogo.Picture, Images.ico_partner.Stream)
    else
    begin
      if (Global.KioskLocale = TKioskLocale.klKorean) then
        StreamToPicture(imgLogo.Picture, Images.ico_ticketlink.Stream)
      else
        StreamToPicture(imgLogo.Picture, Images.ico_ticketlink_en.Stream);
    end;

    imgLogo.Left := 0;
    for var I: ShortInt := 0 to Pred(Global.ReserveList.Count) do
      Global.ReserveList[I].UpdateLocale;
  finally
    panBodyHeadTitle.AutoSize := True;
    panBodyHeadTitle.Left := (panTopCenter.Width div 2) - (panBodyHeadTitle.Width div 2);
    btnGuideReserveNo.Visible := (Global.KioskLocale = TKioskLocale.klKorean);
    panUserInfo.Visible := (Global.KioskLocale = TKioskLocale.klKorean);
    DispCurrentTime;
  end;
end;

procedure TPluginForm.UpdateLocalePopup;
var
  LArrow, LSpace: string;
begin
  LArrow := '  ▼';
  LSpace := StringOfChar(' ', 6);
  case Global.KioskLocale of
    TKioskLocale.klEnglish:
      begin
        btnChangeLocale.Caption := 'ENG' + LArrow;
        FLocaleButtons[0].Caption := LSpace + 'KOR';
        FLocaleButtons[0].Tag := 0;
        FLocaleButtons[1].Caption := LSpace + 'JPN';
        FLocaleButtons[1].Tag := 2;
        FLocaleButtons[2].Caption := LSpace + 'CHN';
        FLocaleButtons[2].Tag := 3;
      end;
    TKioskLocale.klJapanese:
      begin
        btnChangeLocale.Caption := 'JPN' + LArrow;
        FLocaleButtons[0].Caption := LSpace + 'KOR';
        FLocaleButtons[0].Tag := 0;
        FLocaleButtons[1].Caption := LSpace + 'ENG';
        FLocaleButtons[1].Tag := 1;
        FLocaleButtons[2].Caption := LSpace + 'CHN';
        FLocaleButtons[2].Tag := 3;
      end;
    TKioskLocale.klChinese:
      begin
        btnChangeLocale.Caption := 'CHN' + LArrow;
        FLocaleButtons[0].Caption := LSpace + 'KOR';
        FLocaleButtons[0].Tag := 0;
        FLocaleButtons[1].Caption := LSpace + 'ENG';
        FLocaleButtons[1].Tag := 1;
        FLocaleButtons[2].Caption := LSpace + 'JPN';
        FLocaleButtons[2].Tag := 2;
      end
    else
      btnChangeLocale.Caption := 'KOR' + LArrow;
      FLocaleButtons[0].Caption := LSpace + 'ENG';
      FLocaleButtons[0].Tag := 1;
      FLocaleButtons[1].Caption := LSpace + 'JPN';
      FLocaleButtons[1].Tag := 2;
      FLocaleButtons[2].Caption := LSpace + 'CHN';
      FLocaleButtons[2].Tag := 3;
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
