unit TLWaitMsg.Plugin;

interface

uses
  { Native }
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Forms, Vcl.Controls,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.GIFImg,
  { Plugin System }
  uPluginManager, uPluginModule, uPluginMessages,
  { SolbiLib }
  AniImg;

{$I ..\..\common\Common.TLGlobal.inc}

type
  TPluginForm = class(TPluginModule)
    aniLoading: TAnimateImage;
    lblMessage: TLabel;
    imgLoading: TImage;
    procedure PluginModuleClose(Sender: TObject; var Action: TCloseAction);
    procedure PluginModuleMessage(Sender: TObject; AMsg: TPluginMessage);
    procedure PluginModuleCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    procedure ProcessMessages(AMsg: TPluginMessage);
    procedure ApplyTheme;
    procedure ApplyLocale;
  protected
{$IFNDEF DEBUG}
    procedure CreateParams(var AParams: TCreateParams); override;
{$ENDIF}
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; AMsg: TPluginMessage=nil); override;
    destructor Destroy; override;
  end;

implementation

uses
  { Project }
  Common.TLGlobal, Common.TLCommonLib, Common.TLLayerForm;

var
  LF: TTLLayerForm;
  FCanClose: Boolean=False;

{$R *.dfm}

{ TTLWaitMsgForm }

constructor TPluginForm.Create(AOwner: TComponent; AMsg: TPluginMessage);
begin
  inherited Create(AOwner, AMsg);

  LF := TTLLayerForm.Create(nil, False);
  LF.Show;
  SetDoubleBuffered(Self, True);
  MakeRoundedControl(Self);
  ApplyTheme;
  ApplyLocale;

  try
    (imgLoading.Picture.Graphic as TGIFImage).Animate := False;
{$IFDEF USE_ANIGIF}
    imgLoading.Left := (Self.Width div 2) - (imgLoading.Width div 2);
    aniLoading.Visible := False;
{$ELSE}
    aniLoading.Left := (Self.Width div 2) - (aniLoading.Width div 2);
    imgLoading.Visible := False;
{$ENDIF}
  except
  end;

  if Assigned(AMsg) then
    ProcessMessages(AMsg);
end;

destructor TPluginForm.Destroy;
begin
  inherited Destroy;
end;

{$IFNDEF DEBUG}
procedure TPluginForm.CreateParams(var AParams: TCreateParams);
begin
  inherited;

  AParams.WndParent := 0;
end;
{$ENDIF}

procedure TPluginForm.PluginModuleClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(LF) then
  begin
    LF.Close;
    LF.Free;
    LF := nil;
  end;

  Global.PluginInfo.WaitMsgPluginId := 0;
  Action := caFree;
end;

procedure TPluginForm.PluginModuleCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := FCanClose;
end;

procedure TPluginForm.PluginModuleMessage(Sender: TObject; AMsg: TPluginMessage);
begin
  ProcessMessages(AMsg);
end;

procedure TPluginForm.ProcessMessages(AMsg: TPluginMessage);
var
  LValue: string;
begin
  if (AMsg.Command = CPC_INIT) then
  begin
    LValue := AMsg.ParamByString(CPP_VALUE);
    if not LValue.IsEmpty then
      lblMessage.Caption := LValue;

    try
{$IFDEF USE_ANIGIF}
      (imgLoading.Picture.Graphic as TGIFImage).Animate := True;
      (imgLoading.Picture.Graphic as TGIFImage).AnimationSpeed := 100;
{$ELSE}
      aniLoading.Active := True;
{$ENDIF}
    except
    end;
  end;

  if (AMsg.Command = CPC_APPLY_THEME) then
    ApplyTheme;

  if (AMsg.Command = CPC_SET_LOCALE) then
    ApplyLocale;

  if (AMsg.Command = CPC_CLOSE) then
  begin
    FCanClose := True;
    Close;
  end;

  if (AMsg.Command = CPC_SHOW) then
  begin
    if Assigned(LF) then
      LF.Show;
    LValue := AMsg.ParamByString(CPP_VALUE);
    if not LValue.IsEmpty then
      lblMessage.Caption := LValue;

    Self.Visible := True;
{$IFDEF USE_ANIGIF}
    (imgLoading.Picture.Graphic as TGIFImage).Animate := True;
{$ELSE}
    aniLoading.Active := True;
{$ENDIF}
    Application.ProcessMessages;
  end;

  if (AMsg.Command = CPC_HIDE) then
  begin
    if Assigned(LF) then
      LF.Hide;

{$IFDEF USE_ANIGIF}
    (imgLoading.Picture.Graphic as TGIFImage).Animate := False;
{$ELSE}
    aniLoading.Active := False;
{$ENDIF}
    Self.Visible := False;
    Application.ProcessMessages;
  end;
end;

procedure TPluginForm.ApplyTheme;
begin
  with Global.ThemeInfo do
  begin
    Self.Color := Colors.Background1;
    lblMessage.Font.Color := Colors.Black;
{$IFDEF USE_ANIGIF}
    StreamToPicture(imgLoading.Picture, Images.ani_loading.Stream);
{$ELSE}
    aniLoading.Images := Images.ani_loading.ImageList;
    FAllowedTheme := True;
{$ENDIF}
  end;
end;

procedure TPluginForm.ApplyLocale;
begin
  case Global.KioskLocale of
    TKioskLocale.klKorean:
      lblMessage.Caption := '잠시만 기다려 주십시오.';
    TKioskLocale.klEnglish:
      lblMessage.Caption := 'Please hold.';
    TKioskLocale.klJapanese:
      lblMessage.Caption := 'しばらくお待ちください。';
    TKioskLocale.klChinese:
      lblMessage.Caption := '请稍后。';
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