unit Common.TLLayerForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms;

type
  TTLLayerForm = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FUseTransparent: Boolean;
  protected
    procedure CreateParams(var AParams: TCreateParams); override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; const AUseTransparent: Boolean=True); virtual;
    destructor Destroy; override;
  end;

var
  TLLayerForm: TTLLayerForm;

implementation

uses
  Common.TLGlobal;

{$R *.dfm}

{ TTLLayerForm }

constructor TTLLayerForm.Create(AOwner: TComponent; const AUseTransparent: Boolean);
begin
  FUseTransparent := AUseTransparent;
  inherited Create(AOwner);

  Self.DoubleBuffered := True;
  Self.Top := Global.BaseScreenTop;
  Self.Left := Global.BaseScreenLeft;
  Self.Height := Global.BaseScreenHeight;
  Self.Width := Global.BaseScreenWidth;
end;

destructor TTLLayerForm.Destroy;
begin
  inherited Destroy;
end;

procedure TTLLayerForm.CreateParams(var AParams: TCreateParams);
begin
  inherited;

  AParams.ExStyle := AParams.ExStyle or WS_EX_LAYERED;
  if FUseTransparent then
    AParams.ExStyle := AParams.ExStyle or WS_EX_TRANSPARENT;
end;

procedure TTLLayerForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
