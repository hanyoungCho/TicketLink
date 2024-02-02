unit TLNumPad.Plugin;

interface

uses
  { Native }
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Forms, Vcl.Controls,
  Vcl.StdCtrls, Vcl.Menus,
  { Plugin System }
  uPluginManager, uPluginModule, uPluginMessages,
  { DevExpress }
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxButtons;

{$I ..\..\common\Common.TLGlobal.inc}

type
  TPluginForm = class(TPluginModule)
    btnNum0: TcxButton;
    btnNum1: TcxButton;
    btnNum2: TcxButton;
    btnNum3: TcxButton;
    btnNum4: TcxButton;
    btnNum5: TcxButton;
    btnNum6: TcxButton;
    btnNum7: TcxButton;
    btnNum8: TcxButton;
    btnNum9: TcxButton;
    btnNum10: TcxButton; //Clear
    btnNum11: TcxButton; //BS

    procedure PluginModuleClose(Sender: TObject; var Action: TCloseAction);
    procedure PluginModuleMessage(Sender: TObject; AMsg: TPluginMessage);
  private
    { Private declarations }
    FOwnerID: Integer;
    FRepainted: Boolean;

    procedure ProcessMessages(AMsg: TPluginMessage);
    procedure ApplyTheme;
    procedure OnClickNumButton(Sender: TObject);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; AMsg: TPluginMessage=nil); override;
    destructor Destroy; override;
  end;

implementation

uses
  { Project }
  Common.TLGlobal, Common.TLDM, Common.TLCommonLib;

const
  LCN_BUTTON_COUNT = 12;
var
  NumButtons: TArray<TcxButton>;

{$R *.dfm}

{ TTLNumPadForm }

constructor TPluginForm.Create(AOwner: TComponent; AMsg: TPluginMessage);
begin
  inherited Create(AOwner, AMsg);

  SetDoubleBuffered(Self, True);
  FOwnerID := 0;
  FRepainted := False;

  SetLength(NumButtons, LCN_BUTTON_COUNT);
  for var I := 0 to Pred(LCN_BUTTON_COUNT) do
  begin
    NumButtons[I] := TcxButton(FindComponent('btnNum' + IntToStr(I)));
    NumButtons[I].CanBeFocused := False;
    NumButtons[I].SpeedButtonOptions.CanBeFocused := False;
    NumButtons[I].SpeedButtonOptions.Flat := True;
    NumButtons[I].OnClick := OnClickNumButton;
    NumButtons[I].OnCustomDraw := Global.OnCxButtonCustomDraw;
  end;

  if Assigned(AMsg) then
    ProcessMessages(AMsg);
end;

destructor TPluginForm.Destroy;
begin

  inherited Destroy;
end;

procedure TPluginForm.PluginModuleClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
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
    for var I := 0 to Pred(LCN_BUTTON_COUNT) do
      MakeRoundedControl(NumButtons[I]);
    ApplyTheme;
  end;

  if (AMsg.Command = CPC_REFRESH) and
     (not FRepainted) then
  begin
    FRepainted := True;
    for var I := 0 to Pred(LCN_BUTTON_COUNT) do
      MakeRoundedControl(NumButtons[I]);
  end;
end;

procedure TPluginForm.OnClickNumButton(Sender: TObject);
var
  nKey: Integer;
begin
  nKey := TcxButton(Sender).Tag;
  SimulateKeyDown(nKey);
  SimulateKeyUp(nKey);
end;

procedure TPluginForm.ApplyTheme;
begin
  with ThemeInfo do
  begin
    Self.Color := Colors.background1;
    for var I := 0 to Pred(LCN_BUTTON_COUNT) do
    begin
      NumButtons[I].Colors.Normal := Colors.keypad_face_default;
      NumButtons[I].Colors.NormalText := Colors.keypad_font_default;
      NumButtons[I].Colors.Pressed := Colors.keypad_face_pressed;
      NumButtons[I].Colors.PressedText := Colors.keypad_font_pressed;
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