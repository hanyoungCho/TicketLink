unit TLNotice.Plugin;

interface

uses
  { Native }
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Forms, Vcl.Controls,
  Vcl.StdCtrls, Vcl.Menus, Vcl.ExtCtrls,
  { Plugin System }
  uPluginManager, uPluginModule, uPluginMessages,
  { DevExpress }
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxButtons,
  { TMS }
  HTMLabel;

{$I ..\..\common\Common.TLGlobal.inc}

type
  TPluginForm = class(TPluginModule)
    panButtonContainer: TPanel;
    btnClose: TcxButton;
    lblNotice: THTMLabel;
    lblRemainTime: TLabel;
    tmrRemainTime: TTimer;
    procedure PluginModuleClose(Sender: TObject; var Action: TCloseAction);
    procedure PluginModuleMessage(Sender: TObject; AMsg: TPluginMessage);
    procedure tmrRemainTimeTimer(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
    FOwnerID: Integer;
    FWaitTime: Integer;
    FTimeout: Integer;

    procedure ProcessMessages(AMsg: TPluginMessage);
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
  Common.TLGlobal, Common.TLCommonLib, Common.TLLayerForm;

const
  LCN_TIMEOUT = 10;
var
  LF: TTLLayerForm;

{$R *.dfm}

{ TTLPluginForm }

constructor TPluginForm.Create(AOwner: TComponent; AMsg: TPluginMessage);
begin
  inherited Create(AOwner, AMsg);

  LF := TTLLayerForm.Create(nil);
  LF.Show;

  FOwnerID := 0;
  FWaitTime := 0;
  FTimeout := 0;
  SetDoubleBuffered(Self, True);
  MakeRoundedControl(Self);
  btnClose.OnCustomDraw := Global.OnCxButtonCustomDraw;
  lblNotice.Caption := '';

  ApplyTheme;
  ApplyLocale;
  if Assigned(AMsg) then
    ProcessMessages(AMsg);
end;

destructor TPluginForm.Destroy;
begin
  inherited Destroy;
end;

procedure TPluginForm.PluginModuleClose(Sender: TObject; var Action: TCloseAction);
begin
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
begin
  if (AMsg.Command = CPC_INIT) then
  begin
    FOwnerID := AMsg.ParamByInteger(CPP_OWNER_ID);
    FTimeout := AMsg.ParamByInteger(CPP_TIMEOUT);
    lblNotice.HTMLText.Text := AMsg.ParamByString(CPP_VALUE);
    if (FTimeout = 0) then
      FTimeout := LCN_TIMEOUT;
    lblRemainTime.Caption := IntToStr(FTimeout);
    tmrRemainTime.Enabled := True;
  end;
end;

procedure TPluginForm.btnCloseClick(Sender: TObject);
begin
  Self.ModalResult := mrOk;
end;

procedure TPluginForm.tmrRemainTimeTimer(Sender: TObject);
begin
  with TTimer(Sender) do
  try
    Inc(FWaitTime);
    if (FWaitTime >= FTimeout) then
      Self.ModalResult := mrCancel;
    lblRemainTime.Caption := IntToStr(FTimeout - FWaitTime);
  finally
    Enabled := True;
  end;
end;

procedure TPluginForm.ApplyTheme;
begin
  with Global.ThemeInfo do
  begin
    Self.Color := Colors.background1;
    lblNotice.Color := Colors.background1;
    lblNotice.Font.Color := Colors.black;
    panButtonContainer.Color := Colors.background1;
  end;
end;

procedure TPluginForm.ApplyLocale;
begin
  case Global.KioskLocale of
    TKioskLocale.klKorean:
      btnClose.Caption := '확인';
    TKioskLocale.klEnglish:
      btnClose.Caption := 'Confirm';
    TKioskLocale.klJapanese:
      btnClose.Caption := '確認';
    TKioskLocale.klChinese:
      btnClose.Caption := '确认';
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