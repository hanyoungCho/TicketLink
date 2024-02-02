unit Common.TLAlertMsg;

interface

uses
  { Native }
  WinApi.Windows, WinApi.Messages, System.Classes, System.SysUtils, Vcl.Controls, Vcl.Forms,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus,
  { DevExpress }
  dxGDIPlusClasses, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxButtons;

{$I Common.TLGlobal.inc}

type
  TTLAlertBoxForm = class(TForm)
    tmrAutoCloser: TTimer;
    lblCaption: TLabel;
    lblMessage: TLabel;
    panButtonContainer: TPanel;
    btnOK: TcxButton;
    imgStatus: TImage;
    lblTimeout: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tmrAutoCloserTimer(Sender: TObject);
  private
    { Private declarations }
    FTimeOutSecs: Integer;
    FTimeOutCount: Integer;

    procedure ApplyTheme;
    procedure ApplyLocale;
  public
    { Public declarations }
    property TimeOutSecs: Integer read FTimeOutSecs write FTimeOutSecs;
    property TimeOutCount: Integer read FTimeOutCount write FTimeOutCount;
  end;

var
  TLAlertBoxForm: TTLAlertBoxForm;

function AlertMsg(const ACaption, AMessage: string; const ATimeOutSecs: Integer=0): TModalResult;

implementation

uses
  { Project }
  Common.TLGlobal, Common.TLDM, Common.TLLayerForm, Common.TLCommonLib;

var
  LF: TTLLayerForm;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function AlertMsg(const ACaption, AMessage: string; const ATimeOutSecs: Integer): TModalResult;
begin
  with TTLAlertBoxForm.Create(nil) do
  try
    lblCaption.Caption := ACaption;
    lblMessage.Caption := AMessage;

    if (ATimeOutSecs > 0) then
    begin
      FTimeOutSecs := ATimeOutSecs;
      FTimeOutCount := 0;
      lblTimeout.Visible := True;
      tmrAutoCloser.Interval := 1000;
      tmrAutoCloserTimer(tmrAutoCloser);
    end;
    Result := ShowModal;
  finally
    Free;
  end;
end;

{ TTLAlertBoxForm }

procedure TTLAlertBoxForm.FormCreate(Sender: TObject);
begin
  LF := TTLLayerForm.Create(nil);
  LF.Show;
  SetDoubleBuffered(Self, True);
  MakeRoundedControl(Self);
  ApplyTheme;
  ApplyLocale;
end;

procedure TTLAlertBoxForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  LF.Close;
  LF.Free;
  LF := nil;
  Action := caFree;
end;

procedure TTLAlertBoxForm.tmrAutoCloserTimer(Sender: TObject);
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

procedure TTLAlertBoxForm.ApplyTheme;
begin
  with Global.ThemeInfo do
  begin
    Self.Color := Colors.background1;
    lblCaption.Font.Color := Colors.black;
    lblMessage.Font.Color := Colors.type4;
    StreamToPicture(imgStatus.Picture, Images.ico_alert.Stream);
    panButtonContainer.Color := Colors.background1;
    btnOK.Colors.Normal := Colors.btn_face_default;
    btnOK.Colors.NormalText := Colors.btn_font_default;
    btnOK.Colors.Pressed := Colors.btn_face_pressed;
    btnOK.Colors.PressedText := Colors.btn_font_pressed;
    btnOK.Colors.Disabled := Colors.btn_face_disabled;
    btnOK.Colors.DisabledText := Colors.btn_font_disabled;
  end;
end;

procedure TTLAlertBoxForm.ApplyLocale;
begin
  case Global.KioskLocale of
    TKioskLocale.klKorean:
      btnOK.Caption := '확인';
    TKioskLocale.klEnglish:
      btnOK.Caption := 'Confirm';
    TKioskLocale.klJapanese:
      btnOK.Caption := '確認';
    TKioskLocale.klChinese:
      btnOK.Caption := '确认';
  end;
end;

end.
