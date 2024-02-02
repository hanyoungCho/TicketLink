unit Common.TLInputBox;

interface

uses
  { Native }
  WinApi.Windows, WinApi.Messages, System.Classes, System.SysUtils, Vcl.Controls, Vcl.Forms,
  Vcl.StdCtrls, Vcl.Menus, Vcl.ExtCtrls, Vcl.Dialogs,
  { DevExpress }
  dxGDIPlusClasses, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxButtons,
  { TMS UI Pack }
  AdvShapeButton, AdvSmoothPanel;

{$I Common.TLGlobal.inc}

type
  TTLInputBoxForm = class(TForm)
    tmrAutoCloser: TTimer;
    lblCaption: TLabel;
    panButtonContainer: TPanel;
    btnSelect1: TcxButton;
    btnSelect2: TcxButton;
    panInputBox: TAdvSmoothPanel;
    btnInputClear: TAdvShapeButton;
    edtInputValue: TEdit;
    lblTimeout: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tmrAutoCloserTimer(Sender: TObject);
    procedure btnSelect2Click(Sender: TObject);
    procedure btnSelect1Click(Sender: TObject);
    procedure edtInputValueEnter(Sender: TObject);
    procedure edtInputValueExit(Sender: TObject);
    procedure edtInputValueChange(Sender: TObject);
    procedure btnInputClearClick(Sender: TObject);
  private
    { Private declarations }
    FTimeOutSecs: Integer;
    FTimeOutCount: Integer;

    procedure ApplyTheme;
  public
    { Public declarations }
    property TimeOutSecs: Integer read FTimeOutSecs write FTimeOutSecs;
    property TimeOutCount: Integer read FTimeOutCount write FTimeOutCount;
  end;

var
  TLInputBoxForm: TTLInputBoxForm;

function ShowInputBox(var AInputText: string; const APasswordMode: Boolean; const AParentHandle: HWND; const AMsgDlgType: TMsgDlgType; const ACaption, AMessage: string): TModalResult; overload;
function ShowInputBox(var AInputText: string; const APasswordMode: Boolean; const AParentHandle: HWND; const AMsgDlgType: TMsgDlgType; const ACaption, AMessage: string; const AButtonCaptions: array of string; const ATimeOutSecs: Integer=0): TModalResult; overload;
procedure CloseInputBox;

implementation

uses
  { Project }
  Common.TLGlobal, Common.TLDM, Common.TLCommonLib, Common.TLLayerForm,
  {$WARN UNIT_PLATFORM OFF}Common.TabTipHelper{$WARN UNIT_PLATFORM ON};

var
  SelectButtons: TArray<TcxButton>;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function ShowInputBox(var AInputText: string; const APasswordMode: Boolean;
  const AParentHandle: HWND; const AMsgDlgType: TMsgDlgType; const ACaption, AMessage: string): TModalResult;
begin
  Result := ShowInputBox(AInputText, APasswordMode, AParentHandle, AMsgDlgType, ACaption, AMessage, [], 0);
end;
function ShowInputBox(var AInputText: string; const APasswordMode: Boolean;
  const AParentHandle: HWND; const AMsgDlgType: TMsgDlgType; const ACaption, AMessage: string; const AButtonCaptions: array of string; const ATimeOutSecs: Integer): TModalResult;
const
  LCN_BUTTON_COUNT = 2;
var
  TabTip: TTabTip;
  LF: TTLLayerForm;
  nButtons, nSize: Integer;
begin
  LF := TTLLayerForm.Create(nil);
  LF.Show;
  with TTLInputBoxForm.Create(nil) do
  try
    TabTip.Launch(Handle);
    DoubleBuffered := True;
    SetLength(SelectButtons, LCN_BUTTON_COUNT);
    nButtons := Length(AButtonCaptions);
    nSize := panButtonContainer.Width div nButtons;

    lblTimeout.Visible := False;
    lblCaption.Caption := ACaption;
    if APasswordMode then
      edtInputValue.PasswordChar := #42
    else
      edtInputValue.PasswordChar := #0;

    for var I := 0 to Pred(Length(SelectButtons)) do
    begin
      SelectButtons[I] := TcxButton(FindComponent('btnSelect' + IntToStr(I + 1)));
      SelectButtons[I].CanBeFocused := False;
      SelectButtons[I].SpeedButtonOptions.CanBeFocused := False;
      SelectButtons[I].SpeedButtonOptions.Flat := True;
      SelectButtons[I].OnCustomDraw := Global.OnCxButtonCustomDraw;
      SelectButtons[I].Visible := False;
    end;
    for var I := 0 to Pred(nButtons) do
    begin
      SelectButtons[I].Align := TAlign.alLeft;
      SelectButtons[I].Width := nSize;
      SelectButtons[I].Caption := AButtonCaptions[I];
      SelectButtons[I].Visible := True;
      if (I = Pred(nButtons)) then
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

    FTimeOutSecs := ATimeOutSecs;
    FTimeOutCount := 0;
    if (FTimeOutSecs > 0) then
    begin
      lblTimeout.Visible := True;
      tmrAutoCloser.Interval := 1000;
      tmrAutoCloserTimer(tmrAutoCloser);
    end;

    Result := ShowModal;
    AInputText := edtInputValue.Text;
  finally
    Free;
    LF.Close;
    LF.Free;
    TabTip.Close;
    TabTip.Termiante;
  end;
end;

procedure CloseInputBox;
begin
  if (Global.PluginInfo.MsgBoxHandle > 0) then
    SendMessage(Global.PluginInfo.MsgBoxHandle, WM_CLOSE, 0, 0);
end;

{ TTLInputBoxForm }

procedure TTLInputBoxForm.FormCreate(Sender: TObject);
begin
  MakeRoundedControl(Self);
  btnInputClear.Visible := False;
  ApplyTheme;
end;

procedure TTLInputBoxForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TTLInputBoxForm.tmrAutoCloserTimer(Sender: TObject);
begin
  with TTimer(Sender) do
  try
    Enabled := False;
    Inc(FTimeOutCount);
    lblTimeout.Caption := IntToStr(FTimeOutSecs - FTimeOutCount);
    if (FTimeOutCount > FTimeOutSecs) then
      ModalResult := mrCancel;
  finally
    Enabled := True;
  end;
end;

procedure TTLInputBoxForm.btnInputClearClick(Sender: TObject);
begin
  edtInputValue.Text := '';
end;

procedure TTLInputBoxForm.btnSelect1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TTLInputBoxForm.btnSelect2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TTLInputBoxForm.edtInputValueChange(Sender: TObject);
begin
  btnInputClear.Visible := (TEdit(Sender).Text <> '');
end;

procedure TTLInputBoxForm.edtInputValueEnter(Sender: TObject);
begin
//  panInputBox.Fill.Color := Global.ThemeColors.InputBackEnter;
//  panInputBox.Fill.BorderColor := Global.ThemeColors.InputBorderEnter;
  with TEdit(Sender) do
  begin
    SelStart := Length(Text) + 1;
//    Color := Global.ThemeColors.InputBackEnter;
//    Font.Color := Global.ThemeColors.InputFontEnter;
    btnInputClear.Visible := (Text <> '');
  end;
end;

procedure TTLInputBoxForm.edtInputValueExit(Sender: TObject);
begin
//  panInputBox.Fill.Color := Global.ThemeColors.InputBackDefault;
//  panInputBox.Fill.BorderColor := Global.ThemeColors.InputBorderDefault;
  btnInputClear.Visible := False;
  with TEdit(Sender) do
  begin
//    Color := Global.ThemeColors.InputBackDefault;
//    Font.Color := Global.ThemeColors.InputFontDefault;
  end;
end;

procedure TTLInputBoxForm.ApplyTheme;
begin
//  with Global.ThemeColors do
//  begin
//    Self.Color := Background1;
//    lblCaption.Font.Color := Type2;
//
//    panInputBox.Fill.Color := InputBackDefault;
//    panInputBox.Fill.BorderColor := InputBorderDefault;
//    edtInputValue.Color := InputBackDefault;
//    edtInputValue.Font.Color := InputFontDefault;
//
//    btnInputClear.Picture.LoadFromFile(Global.ResourceDir + 'DeleteButton_Default_BK.png');
//    btnInputClear.PictureDown.LoadFromFile(Global.ResourceDir + 'DeleteButton_Pressed_BK.png');
//    btnInputClear.PictureDisabled.LoadFromFile(Global.ResourceDir + 'DeleteButton_Disabled_BK.png');
//
//    panButtonContainer.Color := Background1;
//    for var I := 0 to Length(SelectButtons) - 1 do
//    begin
//      SelectButtons[I].Colors.Normal := ButtonFaceDefault;
//      SelectButtons[I].Colors.NormalText := ButtonFontDefault;
//      SelectButtons[I].Colors.Pressed := ButtonFacePressed;
//      SelectButtons[I].Colors.PressedText := ButtonFontPressed;
//      SelectButtons[I].Colors.Disabled := ButtonFaceDisabled;
//      SelectButtons[I].Colors.DisabledText := ButtonFontDisabled
//    end;
//  end;
end;

end.
