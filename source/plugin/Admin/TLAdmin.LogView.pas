unit TLAdmin.LogView;

interface

uses
  { Native }
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Forms,
  Vcl.Controls, Vcl.StdCtrls, Vcl.ExtCtrls,
  { TMS UI Pakc }
  AdvShapeButton, dxBarBuiltInMenu, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxPC;

type
  TLogViewForm = class(TForm)
    panTitle: TPanel;
    btnClose: TAdvShapeButton;
    pgcLogView: TcxPageControl;
    tabSystem: TcxTabSheet;
    tabConfig: TcxTabSheet;
    mmoAppLog: TMemo;
    mmoPayLog: TMemo;

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
  private
    { Private declarations }
    procedure ApplyTheme;
  public
    { Public declarations }
  end;

var
  LogViewForm: TLogViewForm;

implementation

uses
  { Project }
  Common.TLGlobal, Common.TLCommonLib, Common.TLLayerForm;
var
  LF: TTLLayerForm;

{$R *.dfm}

procedure TLogViewForm.FormCreate(Sender: TObject);
begin
  LF := TTLLayerForm.Create(nil);
  LF.Show;

  SetDoubleBuffered(Self, True);
  MakeRoundedControl(Self);
  pgcLogView.ActivePageIndex := 0;
  ApplyTheme;

  if FileExists(Global.LogFileName) then
    mmoAppLog.Lines.LoadFromFile(Global.LogFileName);
  if FileExists(Global.PaymentLogFileName) then
    mmoPayLog.Lines.LoadFromFile(Global.PaymentLogFileName);
end;

procedure TLogViewForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  LF.Close;
  LF.Free;
  LF := nil;
  Action := caFree;
end;

procedure TLogViewForm.FormActivate(Sender: TObject);
begin
  Global.ThreadTimer.CheckIdle := False;
end;

procedure TLogViewForm.FormDeactivate(Sender: TObject);
begin
  Global.ThreadTimer.CheckIdle := True;
end;

procedure TLogViewForm.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TLogViewForm.ApplyTheme;
begin
//
end;

end.
