unit Common.TLAdminCheck;

interface

uses
  { Native }
  WinApi.Windows, WinApi.Messages, System.Classes, System.SysUtils, Vcl.Controls, Vcl.Forms,
  Vcl.StdCtrls, Vcl.Menus, Vcl.ExtCtrls,
  { DevExpress }
  dxGDIPlusClasses, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxButtons,
  { TMS UI Pack }
  AdvShapeButton, AdvSmoothPanel;

{$I Common.TLGlobal.inc}

type
  TTLAdminCheckForm = class(TForm)
    tmrTimeout: TTimer;
    lblCaption: TLabel;
    panButtonContainer: TPanel;
    btnOK: TcxButton;
    btnCancel: TcxButton;
    panNumPad: TPanel;
    panInputValue: TAdvSmoothPanel;
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
    lblTimeout: TLabel;
    lblInputValue: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tmrTimeoutTimer(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    FTimeOutCount: Integer;
    FInputValue: string;

    procedure OnClickNumButton(Sender: TObject);
//    procedure ApplyTheme;
  public
    { Public declarations }
    property InputValue: string read FInputValue write FInputValue;
  end;

var
  TLAdminCheckForm: TTLAdminCheckForm;

implementation

uses
  { Native }
  System.StrUtils,
  { Project }
  Common.TLGlobal, Common.TLDM, Common.TLCommonLib, Common.TLLayerForm;

const
  LCN_NUMPAD_BTN_COUNT = 12;
  LCN_TIMEOUT = 60;
var
  LF: TTLLayerForm;
  NumButtons: TArray<TcxButton>;

{$R *.dfm}

{ TLAdminCheckForm }

procedure TTLAdminCheckForm.FormCreate(Sender: TObject);
begin
  LF := TTLLayerForm.Create(nil);
  LF.Show;

  FInputValue := '';
  FTimeOutCount := 0;
  SetDoubleBuffered(Self, True);
  MakeRoundedControl(Self);

  btnOK.CanBeFocused := False;
  btnOK.SpeedButtonOptions.CanBeFocused := False;
  btnOK.SpeedButtonOptions.Flat := True;
  btnOK.OnCustomDraw := Global.OnCxButtonCustomDraw;
  btnCancel.CanBeFocused := False;
  btnCancel.SpeedButtonOptions.CanBeFocused := False;
  btnCancel.SpeedButtonOptions.Flat := True;
  btnCancel.OnCustomDraw := Global.OnCxButtonCustomDraw;

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

//  ApplyTheme;
  lblTimeout.Caption := IntToStr(LCN_TIMEOUT);
  tmrTimeout.Enabled := True;
end;

procedure TTLAdminCheckForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  LF.Close;
  LF.Free;
  LF := nil;
  Action := caFree;
end;

procedure TTLAdminCheckForm.tmrTimeoutTimer(Sender: TObject);
begin
  with TTimer(Sender) do
  try
    Enabled := False;
    Inc(FTimeOutCount);
    lblTimeout.Caption := IntToStr(LCN_TIMEOUT - FTimeOutCount);
    if (FTimeOutCount > LCN_TIMEOUT) then
      ModalResult := mrCancel;
  finally
    Enabled := True;
  end;
end;

procedure TTLAdminCheckForm.btnOKClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TTLAdminCheckForm.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TTLAdminCheckForm.OnClickNumButton(Sender: TObject);
var
  LKey: Integer;
begin
  LKey := TcxButton(Sender).Tag;
  case LKey of
    48..57: //0..9
      FInputValue := FInputValue + Chr(LKey);
    8: //Backspace
      FInputValue := FInputValue.Substring(0, Pred(FInputValue.Length));
    239: //Clear;
      FInputValue := '';
  end;

  if FInputValue.IsEmpty then
  begin
    lblInputValue.Font.Color := Global.ThemeInfo.Colors.input_font_disabled;
    lblInputValue.Caption := '<비밀번호 입력>';
  end
  else
  begin
    lblInputValue.Font.Color := Global.ThemeInfo.Colors.input_font_default;
    lblInputValue.Caption := DupeString('●', FInputValue.Length);
  end;
end;

(*
procedure TTLAdminCheckForm.ApplyTheme;
begin
  with Global.ThemeInfo do
  begin
    Self.Color := Colors.background1;
    lblCaption.Font.Color := Colors.type2;
    panNumPad.Color := Colors.background1;

    { 입력 패널 }
    panInputValue.Fill.Color := Colors.input_face_default;
    panInputValue.Fill.BorderColor := Colors.input_border_default;
    lblInputValue.Color := Colors.input_face_default;
    lblInputValue.Font.Color := Colors.input_font_disabled;

    { 숫자 패드 }
    for var I := 0 to Pred(LCN_NUMPAD_BTN_COUNT) do
    begin
      NumButtons[I].Colors.Normal := Colors.keypad_face_default;
      NumButtons[I].Colors.NormalText := Colors.keypad_font_default;
      NumButtons[I].Colors.Pressed := Colors.keypad_face_pressed;
      NumButtons[I].Colors.PressedText := Colors.keypad_font_pressed;
    end;
  end;
end;
*)

end.
