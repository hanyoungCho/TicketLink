unit Common.TLMsgBox;

interface

uses
  { Native }
  WinApi.Windows, WinApi.Messages, System.Classes, System.SysUtils, Vcl.Controls, Vcl.Forms,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus, Vcl.Dialogs,
  { DevExpress }
  dxGDIPlusClasses, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxButtons,
  { TMS }
  HTMLabel;

{$I Common.TLGlobal.inc}

type
  TTLMsgBoxForm = class(TForm)
    tmrAutoCloser: TTimer;
    panButtonContainer: TPanel;
    lblTimeout: TLabel;
    btnSelect1: TcxButton;
    btnSelect2: TcxButton;
    btnSelect3: TcxButton;
    btnSelect4: TcxButton;
    btnSelect5: TcxButton;
    imgIcon: TImage;
    panMessage: TPanel;
    lblCaption: TLabel;
    lblHtmlMsg: THTMLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnSelect2Click(Sender: TObject);
    procedure btnSelect1Click(Sender: TObject);
    procedure tmrAutoCloserTimer(Sender: TObject);
    procedure btnSelect3Click(Sender: TObject);
    procedure btnSelect4Click(Sender: TObject);
    procedure btnSelect5Click(Sender: TObject);
  private
    { Private declarations }
    FTimeOutSecs: Integer;
    FTimeOutCount: Integer;
  public
    { Public declarations }
    property TimeOutSecs: Integer read FTimeOutSecs write FTimeOutSecs;
    property TimeOutCount: Integer read FTimeOutCount write FTimeOutCount;
  end;

var
  TLMsgBoxForm: TTLMsgBoxForm;

function ShowMsgBoxInfo(const ACaption: string): TModalResult; overload;
function ShowMsgBoxWarning(const ACaption: string): TModalResult; overload;
function ShowMsgBoxError(const ACaption: string): TModalResult; overload;
function ShowMsgBoxConfirm(const ACaption: string): TModalResult; overload;

function ShowMsgBoxInfo(const ACaption, AMessage: string; const ATimeOutSecs: Integer=0): TModalResult; overload;
function ShowMsgBoxWarning(const ACaption, AMessage: string; const ATimeOutSecs: Integer=0): TModalResult; overload;
function ShowMsgBoxError(const ACaption, AMessage: string; const ATimeOutSecs: Integer=0): TModalResult; overload;
function ShowMsgBoxConfirm(const ACaption, AMessage: string; const ATimeOutSecs: Integer=0): TModalResult; overload;

function ShowMsgBoxInfo(const ACaption: string; const AButtonCaptions: array of string): TModalResult; overload;
function ShowMsgBoxWarning(const ACaption: string; const AButtonCaptions: array of string): TModalResult; overload;
function ShowMsgBoxError(const ACaption: string; const AButtonCaptions: array of string): TModalResult; overload;
function ShowMsgBoxConfirm(const ACaption: string; const AButtonCaptions: array of string): TModalResult; overload;

function ShowMsgBoxInfo(const ACaption, AMessage: string; const AButtonCaptions: array of string; const ATimeOutSecs: Integer=0): TModalResult; overload;
function ShowMsgBoxWarning(const ACaption, AMessage: string; const AButtonCaptions: array of string; const ATimeOutSecs: Integer=0): TModalResult; overload;
function ShowMsgBoxError(const ACaption, AMessage: string; const AButtonCaptions: array of string; const ATimeOutSecs: Integer=0): TModalResult; overload;
function ShowMsgBoxConfirm(const ACaption, AMessage: string; const AButtonCaptions: array of string; const ATimeOutSecs: Integer=0): TModalResult; overload;

function ShowMsgBox(const AMsgDlgType: TMsgDlgType; const ACaption, AMessage: string; const AButtonCaptions: array of string; const ATimeOutSecs: Integer=0): TModalResult; overload;

procedure CloseMsgBox;

implementation

uses
  { Project }
  Common.TLGlobal, Common.TLDM, Common.TLLayerForm, Common.TLCommonLib;

var
  LF: TTLLayerForm;

{$R *.dfm}

function ShowMsgBoxInfo(const ACaption: string): TModalResult;
begin
  Result := ShowMsgBox(mtInformation, ACaption, '', []);
end;
function ShowMsgBoxWarning(const ACaption: string): TModalResult;
begin
  Result := ShowMsgBox(mtWarning, ACaption, '', []);
end;
function ShowMsgBoxError(const ACaption: string): TModalResult;
begin
  Result := ShowMsgBox(mtError, ACaption, '', []);
end;
function ShowMsgBoxConfirm(const ACaption: string): TModalResult;
begin
  Result := ShowMsgBox(mtConfirmation, ACaption, '', []);
end;

function ShowMsgBoxInfo(const ACaption, AMessage: string; const ATimeOutSecs: Integer): TModalResult;
begin
  Result := ShowMsgBox(mtInformation, ACaption, AMessage, [], ATimeOutSecs);
end;
function ShowMsgBoxWarning(const ACaption, AMessage: string; const ATimeOutSecs: Integer): TModalResult;
begin
  Result := ShowMsgBox(mtWarning, ACaption, AMessage, [], ATimeOutSecs);
end;
function ShowMsgBoxError(const ACaption, AMessage: string; const ATimeOutSecs: Integer): TModalResult;
begin
  Result := ShowMsgBox(mtError, ACaption, AMessage, [], ATimeOutSecs);
end;
function ShowMsgBoxConfirm(const ACaption, AMessage: string; const ATimeOutSecs: Integer): TModalResult;
begin
  Result := ShowMsgBox(mtConfirmation, ACaption, AMessage, [], ATimeOutSecs);
end;

function ShowMsgBoxInfo(const ACaption: string; const AButtonCaptions: array of string): TModalResult;
begin
  Result := ShowMsgBox(mtInformation, ACaption, '', AButtonCaptions);
end;
function ShowMsgBoxWarning(const ACaption: string; const AButtonCaptions: array of string): TModalResult;
begin
  Result := ShowMsgBox(mtWarning, ACaption, '', AButtonCaptions);
end;
function ShowMsgBoxError(const ACaption: string; const AButtonCaptions: array of string): TModalResult;
begin
  Result := ShowMsgBox(mtError, ACaption, '', AButtonCaptions);
end;
function ShowMsgBoxConfirm(const ACaption: string; const AButtonCaptions: array of string): TModalResult;
begin
  Result := ShowMsgBox(mtConfirmation, ACaption, '', AButtonCaptions);
end;

function ShowMsgBoxInfo(const ACaption, AMessage: string; const AButtonCaptions: array of string; const ATimeOutSecs: Integer): TModalResult;
begin
  Result := ShowMsgBox(mtInformation, ACaption, AMessage, AButtonCaptions, ATimeOutSecs);
end;
function ShowMsgBoxWarning(const ACaption, AMessage: string; const AButtonCaptions: array of string; const ATimeOutSecs: Integer): TModalResult;
begin
  Result := ShowMsgBox(mtWarning, ACaption, AMessage, AButtonCaptions, ATimeOutSecs);
end;
function ShowMsgBoxError(const ACaption, AMessage: string; const AButtonCaptions: array of string; const ATimeOutSecs: Integer): TModalResult;
begin
  Result := ShowMsgBox(mtError, ACaption, AMessage, AButtonCaptions, ATimeOutSecs);
end;
function ShowMsgBoxConfirm(const ACaption, AMessage: string; const AButtonCaptions: array of string; const ATimeOutSecs: Integer): TModalResult;
begin
  Result := ShowMsgBox(mtConfirmation, ACaption, AMessage, AButtonCaptions, ATimeOutSecs);
end;
function ShowMsgBox(const AMsgDlgType: TMsgDlgType; const ACaption, AMessage: string; const AButtonCaptions: array of string; const ATimeOutSecs: Integer): TModalResult;
const
  LCN_BUTTON_COUNT = 5;
var
  SelectButtons: TArray<TcxButton>;
  LButtons, LSize: Integer;
begin
  LF := TTLLayerForm.Create(nil);
  LF.Show;
  with TTLMsgBoxForm.Create(nil) do
  try
    DoubleBuffered := True;
    SetLength(SelectButtons, LCN_BUTTON_COUNT);
    LButtons := Length(AButtonCaptions);
    if (LButtons = 0) then
      LSize := panButtonContainer.Width
    else
      LSize := panButtonContainer.Width div LButtons;

    for var I: ShortInt := 0 to Pred(Length(SelectButtons)) do
    begin
      SelectButtons[I] := TcxButton(FindComponent('btnSelect' + IntToStr(I + 1)));
      SelectButtons[I].CanBeFocused := False;
      SelectButtons[I].SpeedButtonOptions.CanBeFocused := False;
      SelectButtons[I].SpeedButtonOptions.Flat := True;
      SelectButtons[I].OnCustomDraw := Global.OnCxButtonCustomDraw;
      SelectButtons[I].Visible := False;
    end;
    for var I: ShortInt := 0 to Pred(LButtons) do
    begin
      SelectButtons[I].Align := TAlign.alLeft;
      SelectButtons[I].Width := LSize;
      SelectButtons[I].Caption := AButtonCaptions[I];
      SelectButtons[I].Visible := True;
      if (I = Pred(LButtons)) then
        SelectButtons[I].Align := TAlign.alClient;
    end;

    case AMsgDlgType of
      mtWarning:
        MessageBeep(MB_ICONWARNING);
      mtError:
        MessageBeep(MB_ICONERROR);
      mtConfirmation:
        MessageBeep(MB_ICONQUESTION);
      else
        MessageBeep(MB_ICONINFORMATION);
    end;

    with Global.ThemeInfo do
    begin
      Color := Colors.background1;
      panMessage.Color := Colors.background1;
      lblCaption.Font.Color := Colors.black;
      lblHtmlMsg.Color := Colors.background1;
      lblHtmlMsg.Font.Color := Colors.Type4;
      panButtonContainer.Color := Colors.background1;
      StreamToPicture(imgIcon.Picture, Images.ico_alert.Stream);

      for var I := 0 to Length(SelectButtons) - 1 do
      begin
        SelectButtons[I].Colors.Normal := Colors.btn_face_default;
        SelectButtons[I].Colors.NormalText := Colors.btn_font_default;
        SelectButtons[I].Colors.Pressed := Colors.btn_face_pressed;
        SelectButtons[I].Colors.PressedText := Colors.btn_font_pressed;
        SelectButtons[I].Colors.Disabled := Colors.btn_face_disabled;
        SelectButtons[I].Colors.DisabledText := Colors.btn_font_disabled;
      end;
    end;

    lblHtmlMsg.Visible := (not AMessage.IsEmpty);
    if lblHtmlMsg.Visible then
      lblHtmlMsg.HTMLText.Text := '<P align="center">' + StringReplace(AMessage, _CRLF, '<BR>', [rfReplaceAll]) + '</P>';
    lblCaption.Caption := ACaption;
    lblCaption.Visible := (not ACaption.IsEmpty);
    if not lblHtmlMsg.Visible then
      lblCaption.Align := alClient;
    lblTimeout.Visible := False;
    FTimeOutSecs := ATimeOutSecs;
    FTimeOutCount := 0;
    if (FTimeOutSecs > 0) then
    begin
      lblTimeout.Visible := True;
      tmrAutoCloser.Interval := 1000;
      tmrAutoCloserTimer(tmrAutoCloser);
    end;

    Result := ShowModal;
  finally
    LF.Close;
    LF.Free;
    LF := nil;
    Free;
  end;
end;

procedure CloseMsgBox;
begin
  if (Global.PluginInfo.MsgBoxHandle > 0) then
    SendMessage(Global.PluginInfo.MsgBoxHandle, WM_CLOSE, 0, 0);
end;

{ TTLMsgBoxForm }

procedure TTLMsgBoxForm.FormCreate(Sender: TObject);
begin
  Global.PluginInfo.MsgBoxHandle := Self.Handle;
  SetDoubleBuffered(Self, True);
  MakeRoundedControl(Self);
end;

procedure TTLMsgBoxForm.tmrAutoCloserTimer(Sender: TObject);
begin
  with TTimer(Sender) do
  try
    Enabled := False;
    Inc(FTimeOutCount);
    if (FTimeOutCount >= FTimeOutSecs) then
      Self.ModalResult := mrCancel;
    lblTimeout.Caption := IntToStr(FTimeOutSecs - FTimeOutCount);
  finally
    Enabled := True;
  end;
end;

procedure TTLMsgBoxForm.btnSelect1Click(Sender: TObject);
begin
  Self.ModalResult := mrOk;
end;

procedure TTLMsgBoxForm.btnSelect2Click(Sender: TObject);
begin
  Self.ModalResult := mrCancel;
end;

procedure TTLMsgBoxForm.btnSelect3Click(Sender: TObject);
begin
  Self.ModalResult := mrYesToAll;
end;

procedure TTLMsgBoxForm.btnSelect4Click(Sender: TObject);
begin
  Self.ModalResult := mrNoToAll;
end;

procedure TTLMsgBoxForm.btnSelect5Click(Sender: TObject);
begin
  Self.ModalResult := mrAll;
end;

end.
