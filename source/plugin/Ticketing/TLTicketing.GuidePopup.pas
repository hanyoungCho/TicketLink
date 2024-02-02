unit TLTicketing.GuidePopup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Forms, Vcl.Graphics,
  Vcl.Controls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus,
  { DevExpress }
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxButtons;

type
  TGuidePopupForm = class(TForm)
    panButtonContainer: TPanel;
    btnClose: TcxButton;
    lblTicketLinkTitle: TLabel;
    lblTicketLinkMsg: TLabel;
    lblNaverTitle: TLabel;
    lblNaverMsg: TLabel;
    lblTiMonTitle: TLabel;
    lblTiMonMsg: TLabel;
    lblCoupangMsg: TLabel;
    lblCoupangTitle: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure ApplyTheme;
  public
    { Public declarations }
  end;

var
  GuidePopupForm: TGuidePopupForm;

implementation

uses
  { Project }
  Common.TLGlobal, Common.TLDM, Common.TLCommonLib, Common.TLLayerForm;

var
  LF: TTLLayerForm;

{$R *.dfm}

procedure TGuidePopupForm.FormCreate(Sender: TObject);
begin
  LF := TTLLayerForm.Create(nil);
  LF.Show;
  MakeRoundedControl(Self);
  btnClose.OnCustomDraw := Global.OnCxButtonCustomDraw;
  ApplyTheme;
end;

procedure TGuidePopupForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  LF.Close;
  LF.Free;
  LF := nil;
  Action := caFree;
end;

procedure TGuidePopupForm.ApplyTheme;
begin
  with Global.ThemeInfo do
  begin
    Self.Color := Colors.background1;
    lblTicketLinkTitle.Font.Color := Colors.black;
    lblTicketLinkMsg.Font.Color := Colors.type4;
    lblNaverTitle.Font.Color := Colors.black;
    lblNaverMsg.Font.Color := Colors.type4;
    lblTiMonTitle.Font.Color := Colors.black;
    lblTiMonMsg.Font.Color := Colors.type4;
    lblCoupangTitle.Font.Color := Colors.black;
    lblCoupangMsg.Font.Color := Colors.type4;
    panButtonContainer.Color := Colors.background1;
  end;
end;

end.
