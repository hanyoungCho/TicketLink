unit TLTemplate.Plugin;

interface

uses
  { Native }
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Forms, Vcl.Controls,
  Vcl.StdCtrls,
  { Plugin System }
  uPluginManager, uPluginModule, uPluginMessages;

{$I ..\..\common\Common.TLGlobal.inc}

type
  TPluginForm = class(TPluginModule)
    procedure PluginModuleClose(Sender: TObject; var Action: TCloseAction);
    procedure PluginModuleMessage(Sender: TObject; AMsg: TPluginMessage);
  private
    { Private declarations }
    FOwnerID: Integer;

    procedure ProcessMessages(AMsg: TPluginMessage);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; AMsg: TPluginMessage=nil); override;
    destructor Destroy; override;
  end;

implementation

uses
  { Project }
  Common.TLGlobal, Common.TLCommonLib;

{$R *.dfm}

{ TTLPluginForm }

constructor TPluginForm.Create(AOwner: TComponent; AMsg: TPluginMessage);
begin
  inherited Create(AOwner, AMsg);

  SetDoubleBuffered(Self, True);
  FOwnerID := 0;

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