unit TLPaymentTmoney.Plugin;

interface

uses
  { Native }
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Forms, Vcl.Controls,
  Vcl.StdCtrls, Vcl.Menus, Vcl.ExtCtrls, Vcl.Imaging.GIFImg,
  { Plugin System }
  uPluginManager, uPluginModule, uPluginMessages,
  { DevExpress }
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxButtons;

{$I ..\..\common\Common.TLGlobal.inc}

type
  TPluginForm = class(TPluginModule)
    PanMessage: TPanel;
    lblMessage1: TLabel;
    lblMessage2: TLabel;
    lblRemainTime: TLabel;
    lblFormTitle: TLabel;
    tmrRemainTime: TTimer;
    imgPaymentTmoney: TImage;

    procedure PluginModuleClose(Sender: TObject; var Action: TCloseAction);
    procedure PluginModuleActivate(Sender: TObject);
    procedure PluginModuleMessage(Sender: TObject; AMsg: TPluginMessage);
    procedure btnCloseClick(Sender: TObject);
    procedure tmrRemainTimeTimer(Sender: TObject);
  private
    { Private declarations }
    FOwnerID: Integer;
    FWaitTime: Integer;

    procedure ProcessMessages(AMsg: TPluginMessage);
    procedure ApplyTheme;
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
  LCN_WAITING_TIME = 50;
var
  LF: TTLLayerForm;

{$R *.dfm}

{ TTLPaymentTmoneyForm }

procedure TPluginForm.btnCloseClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

constructor TPluginForm.Create(AOwner: TComponent; AMsg: TPluginMessage);
begin
  inherited Create(AOwner, AMsg);

  LF := TTLLayerForm.Create(nil);
  LF.Show;

  FOwnerID := 0;
  SetDoubleBuffered(Self, True);
  MakeRoundedControl(Self);

  ApplyTheme;
  if Assigned(AMsg) then
    ProcessMessages(AMsg);

  (imgPaymentTmoney.Picture.Graphic as TGIFImage).AnimationSpeed := 100;
  (imgPaymentTmoney.Picture.Graphic as TGIFImage).Animate := True;
  lblRemainTime.Caption := IntToStr(LCN_WAITING_TIME);
  tmrRemainTime.Enabled := True;
end;

destructor TPluginForm.Destroy;
begin
  inherited Destroy;
end;

procedure TPluginForm.PluginModuleClose(Sender: TObject; var Action: TCloseAction);
begin
  (imgPaymentTmoney.Picture.Graphic as TGIFImage).Animate := False;
  LF.Close;
  LF.Free;
  LF := nil;
  Action := caFree;
end;

procedure TPluginForm.PluginModuleActivate(Sender: TObject);
begin
  Global.NFCReader.OwnerId := Self.PluginID;
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

procedure TPluginForm.ApplyTheme;
begin
  with ThemeInfo do
  begin
    Self.Color := Colors.background1;
    panMessage.Color := Colors.background1;
    lblFormTitle.Color := Colors.background1;
    lblFormTitle.Font.Color := Colors.black;
    lblMessage1.Color := Colors.background1;
    lblMessage1.Font.Color := Colors.type4;
    lblMessage2.Color := Colors.background1;
    lblMessage2.Font.Color := Colors.black;
    StreamToPicture(imgPaymentTmoney.Picture, ThemeInfo.Images.ani_tmoney_tagging.Stream);
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