unit TLTicketHome.Plugin;

interface

uses
  { Native }
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Forms, Vcl.Controls,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  { Plugin System }
  uPluginManager, uPluginModule, uPluginMessages,
  { TMS }
  AdvSmoothButton, AdvShapeButton;

{$I ..\..\common\Common.TLGlobal.inc}

type
  TPluginForm = class(TPluginModule)
    panHead: TPanel;
    lblHeadSeparator: TLabel;
    panHeadLeft: TPanel;
    panHeadRight: TPanel;
    panHeadCenter: TPanel;
    panBody: TPanel;
    imgLogo: TImage;
    lblCurrentDate: TLabel;
    lblCurrentTime: TLabel;
    btnOpenTicketing: TAdvShapeButton;
    imgMainButtonBack: TImage;
    btnOpenTicketBuy: TAdvShapeButton;
    lblBodyMainStartNotice: TLabel;
    btnLocaleKR: TAdvShapeButton;
    btnLocaleEN: TAdvShapeButton;
    btnLocaleJP: TAdvShapeButton;
    btnLocaleCN: TAdvShapeButton;

    procedure PluginModuleActivate(Sender: TObject);
    procedure PluginModuleClose(Sender: TObject; var Action: TCloseAction);
    procedure PluginModuleMessage(Sender: TObject; AMsg: TPluginMessage);
    procedure btnOpenTicketingMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnOpenTicketBuyMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure OnLocaleButtonMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure OnLocaleButtonMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    FOwnerID: Integer;
    FWorking: Boolean;
    FThemeUpdated: Boolean;

    procedure ProcessMessages(AMsg: TPluginMessage);
    procedure DoTicketing;
    procedure DoTicketBuy;
    procedure DispCurrentTime;
    procedure ApplyTheme;
    procedure ApplyLocale;
  protected
    procedure WndProc(var AMsg: TMessage); override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; AMsg: TPluginMessage=nil); override;
    destructor Destroy; override;
  end;

implementation

uses
  { Project }
  Common.TLGlobal, Common.TLCommonLib, Common.TLDM, Common.TLMsgBox;

{$R *.dfm}

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
begin
  inherited Create(AOwner, AMsg);

  FOwnerID := 0;
  FThemeUpdated := False;
  Self.Top := (Global.BaseScreenHeight - Self.Height);
  Self.Left := Global.BaseScreenLeft;
  Self.Height := (Global.BaseScreenHeight - Self.Top);
  Self.Width := Global.BaseScreenWidth;

  SetDoubleBuffered(Self, True);
  DispCurrentTime;

  if Assigned(AMsg) then
    ProcessMessages(AMsg);
end;

destructor TPluginForm.Destroy;
begin
  inherited Destroy;
end;

procedure TPluginForm.PluginModuleActivate(Sender: TObject);
begin
  ApplyTheme;
  ApplyLocale;
end;

procedure TPluginForm.PluginModuleClose(Sender: TObject; var Action: TCloseAction);
begin
  SendMessage(Application.MainForm.Handle, WM_CLOSE, 0, 0);
  Action := caFree;
end;

procedure TPluginForm.PluginModuleMessage(Sender: TObject; AMsg: TPluginMessage);
begin
  ProcessMessages(AMsg);
end;

procedure TPluginForm.ProcessMessages(AMsg: TPluginMessage);
var
  LValue: Integer;
begin
  if (AMsg.Command = CPC_INIT) then
    FOwnerID := AMsg.ParamByInteger(CPP_OWNER_ID);

  if (AMsg.Command = CPC_SET_KIOSK_MODE) then
  begin
    LValue := AMsg.ParamByInteger(CPP_VALUE);
    if Global.StoreInfo.ShowTicketingMenu and
       Global.StoreInfo.ShowTicketBuyMenu then
    begin
      case LValue of
        KSM_IDLE:
          if (Global.StoreInfo.ExposureTypeCode = ATC_NORMAL) then
            SetForegroundWindow(Self.Handle);
        KSM_HOME:
          begin
            SetForegroundWindow(Self.Handle);
            ShowNotice(10);
          end;
      end;
    end;
  end;

  if (AMsg.Command = CPC_SET_FOREGROUND) then
  begin
    SetForegroundWindow(Self.Handle);
    ShowNotice(10);
  end;

  if (AMsg.Command = CPC_SET_DATETIME) then
    DispCurrentTime;

  if (AMsg.Command = CPC_APPLY_THEME) then
    ApplyTheme;

  if (AMsg.Command = CPC_SET_LOCALE) then
    ApplyLocale;
end;

procedure TPluginForm.OnLocaleButtonMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  with TAdvShapeButton(Sender) do
  begin
    Top := (Top + 2);
    Left := (Left + 2);
  end;
end;

procedure TPluginForm.OnLocaleButtonMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  with TAdvShapeButton(Sender) do
  begin
    Top := (Top - 2);
    Left := (Left - 2);
    Global.KioskLocale := TKioskLocale(Tag);
  end;
end;

procedure TPluginForm.btnOpenTicketingMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DoTicketing;
end;

procedure TPluginForm.btnOpenTicketBuyMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DoTicketBuy;
end;

procedure TPluginForm.DoTicketing;
begin
  if FWorking then
    Exit;
  FWorking := True;
  try
    if CheckKioskAvailable then
      Global.KioskMode := KSM_TICKETING_HOME;
  finally
    FWorking := False;
  end;
end;

procedure TPluginForm.DoTicketBuy;
begin
  if FWorking then
    Exit;
  FWorking := True;
  try
    if CheckKioskAvailable then
      Global.KioskMode := KSM_BUY_HOME;
  finally
    FWorking := False;
  end;
end;

procedure TPluginForm.DispCurrentTime;
begin
  case Global.KioskLocale of
    TKioskLocale.klKorean:
      begin
        lblCurrentDate.Caption := Format('%d월 %d일 (%s)', [StrToInt(Global.CurrentDate.Substring(4, 2)), StrToInt(Global.CurrentDate.Substring(6, 2)), Global.DayOfWeekName]);
        lblCurrentTime.Caption := Format('%d:%s', [StrToInt(Global.CurrentTime.Substring(0, 2)), Global.CurrentTime.Substring(2, 2)]);
      end;
    TKioskLocale.klEnglish:
      begin
        lblCurrentDate.Caption := Global.FormattedCurrentDateTimeEN;
      end;
    TKioskLocale.klJapanese,
    TKioskLocale.klChinese:
      begin
        lblCurrentDate.Caption := Format('%d月 %d日 (%s)', [StrToInt(Global.CurrentDate.Substring(4, 2)), StrToInt(Global.CurrentDate.Substring(6, 2)), Global.DayOfWeekNameCN]);
        lblCurrentTime.Caption := Format('%d:%s', [StrToInt(Global.CurrentTime.Substring(0, 2)), Global.CurrentTime.Substring(2, 2)]);
      end;
  end;
end;

procedure TPluginForm.ApplyTheme;
begin
  if FThemeUpdated then
    Exit;
  with Global.ThemeInfo do
  try
    Self.Color := Colors.background3;
    panBody.Color := Colors.background3;

    lblCurrentDate.Font.Color := Colors.black;
    lblCurrentTime.Font.Color := Colors.black;
    lblBodyMainStartNotice.Font.Color := Colors.type4;
    lblHeadSeparator.Color := Colors.line2;

    panHead.Color := Colors.background3;
    panHeadLeft.Color := Colors.background3;
    panHeadCenter.Color := Colors.background3;
    panHeadRight.Color := Colors.background3;

    StreamToPicture(btnLocaleKR.Picture, Images.ico_locale_kor.Stream);
    StreamToPicture(btnLocaleEN.Picture, Images.ico_locale_eng.Stream);
    StreamToPicture(btnLocaleJP.Picture, Images.ico_locale_jpn.Stream);
    StreamToPicture(btnLocaleCN.Picture, Images.ico_locale_chn.Stream);
    StreamToPicture(imgMainButtonBack.Picture, Images.btn_ticket_background.Stream);
    StreamToPicture(btnOpenTicketing.Picture, Images.btn_ticket_printing_default.Stream);
    StreamToPicture(btnOpenTicketing.PictureDown, Images.btn_ticket_printing_pressed.Stream);
    StreamToPicture(btnOpenTicketBuy.Picture, Images.btn_ticket_purchase_default.Stream);
    StreamToPicture(btnOpenTicketBuy.PictureDown, Images.btn_ticket_purchase_pressed.Stream);
  finally
    FThemeUpdated := False;
  end;
end;

procedure TPluginForm.ApplyLocale;
begin
  try
    case Global.KioskLocale of
      TKioskLocale.klKorean:
        begin
          lblBodyMainStartNotice.Caption := '외국인 전용 티켓링크 사이트를 통해 예매한 티켓은 키오스크 발권이 불가합니다.' + _CRLF +
          '티켓정보 확인을 위해 매표소를 이용해주시기 바랍니다.';
        end;
      TKioskLocale.klEnglish:
        begin
          lblBodyMainStartNotice.Caption := 'All the tickets reserved through ''foreigner-only Ticketlink website'' CANNOT be printed through the Kiosk.' + _CRLF +
          ' Please use offline ticket box to access your ticket information.';
        end;
      TKioskLocale.klJapanese:
        begin
          lblBodyMainStartNotice.Caption := '外国人専用のチケットリンクサイトにて予約したチケットは、キオスク発券ができません。' + _CRLF +
          'チケット情報を確認するため、チケット売り場をご利用ください。';
        end;
      TKioskLocale.klChinese:
        begin
          lblBodyMainStartNotice.Caption := 'KIOSK暂不支持打印通过外国人专用购票链接网站购买的票。' + _CRLF +
          '请您前往售票处确认购票信息。';
        end;
      else
        lblBodyMainStartNotice.Caption := 'Here are your reservation details.' + _CRLF +
          'Please review the details and proceed to print your ticket.';
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
  finally
    imgLogo.Top := (panHeadCenter.Height  div 2) - (imgLogo.Height div 2);
    imgLogo.Left := (panHeadCenter.Width div 2) - (imgLogo.Width div 2);
    lblCurrentTime.Visible := (Global.KioskLocale <> TKioskLocale.klEnglish);
    DispCurrentTime;
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
