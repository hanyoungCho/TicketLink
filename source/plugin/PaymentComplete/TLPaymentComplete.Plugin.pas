unit TLPaymentComplete.Plugin;

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
    panButtonContainer: TPanel;
    panMessage: TPanel;
    lblMessage: TLabel;
    lblFormTitle: TLabel;
    tmrTimeout: TTimer;
    lblTimeout: TLabel;
    imgPaymentComplete: TImage;
    btnOK: TcxButton;
    btnCancel: TcxButton;

    procedure PluginModuleClose(Sender: TObject; var Action: TCloseAction);
    procedure PluginModuleMessage(Sender: TObject; AMsg: TPluginMessage);
    procedure tmrTimeoutTimer(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    FOwnerID: Integer;
    FWaitTime: Integer;

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
  LCN_TIMEOUT = 30;
var
  LF: TTLLayerForm;

{$R *.dfm}

{ TPluginForm }

constructor TPluginForm.Create(AOwner: TComponent; AMsg: TPluginMessage);
begin
  inherited Create(AOwner, AMsg);

  LF := TTLLayerForm.Create(nil);
  LF.Show;

  FOwnerID := 0;
  SetDoubleBuffered(Self, True);
  MakeRoundedControl(Self);
  btnCancel.OnCustomDraw := Global.OnCxButtonCustomDraw;
  btnOK.OnCustomDraw := Global.OnCxButtonCustomDraw;

  ApplyTheme;
  ApplyLocale;
  if Assigned(AMsg) then
    ProcessMessages(AMsg);

  (imgPaymentComplete.Picture.Graphic as TGIFImage).AnimationSpeed := 100;
  (imgPaymentComplete.Picture.Graphic as TGIFImage).Animate := True;
  lblTimeout.Caption := IntToStr(LCN_TIMEOUT);
  tmrTimeout.Enabled := True;
end;

destructor TPluginForm.Destroy;
begin
  inherited Destroy;
end;

procedure TPluginForm.PluginModuleClose(Sender: TObject; var Action: TCloseAction);
begin
  (imgPaymentComplete.Picture.Graphic as TGIFImage).Animate := False;
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
    FOwnerID := AMsg.ParamByInteger(CPP_OWNER_ID);

  if (AMsg.Command = CPC_APPLY_THEME) then
    ApplyTheme;

  if (AMsg.Command = CPC_SET_LOCALE) then
    ApplyLocale;
end;

procedure TPluginForm.tmrTimeoutTimer(Sender: TObject);
begin
  with TTimer(Sender) do
  try
    Inc(FWaitTime);
    if (FWaitTime >= LCN_TIMEOUT) then
      ModalResult := mrCancel;
    lblTimeout.Caption := IntToStr(LCN_TIMEOUT - FWaitTime);
  finally
    Enabled := True;
  end;
end;

procedure TPluginForm.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TPluginForm.btnOKClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TPluginForm.ApplyTheme;
begin
  with Global.ThemeInfo do
  begin
    Self.Color := Colors.background1;
    panMessage.Color := Colors.background1;
    lblFormTitle.Color := Colors.background1;
    lblFormTitle.Font.Color := Colors.black;
    lblMessage.Color := Colors.background1;
    lblMessage.Font.Color := Colors.type4;
    StreamToPicture(imgPaymentComplete.Picture, Images.ani_payment_completed.Stream);
    panButtonContainer.Color := Colors.background1;
  end;
end;

procedure TPluginForm.ApplyLocale;
begin
  case Global.KioskLocale of
    TKioskLocale.klKorean:
      begin
        lblFormTitle.Caption := '결제가 완료 되었습니다.';
        lblMessage.Caption := '영수증을 출력하시겠습니까?';
        btnCancel.Caption := '아니오';
        btnOK.Caption := '예';
      end;
    TKioskLocale.klEnglish:
      begin
        lblFormTitle.Caption := 'Payment is complete.';
        lblMessage.Caption := 'Do you want to print your receipt?';
        btnCancel.Caption := 'No';
        btnOK.Caption := 'Yes';
      end;
    TKioskLocale.klJapanese:
      begin
        lblFormTitle.Caption := '決済が完了しました。';
        lblMessage.Caption := '領収書を出力しますか？';
        btnCancel.Caption := 'いいえ';
        btnOK.Caption := 'はい';
      end;
    TKioskLocale.klChinese:
      begin
        lblFormTitle.Caption := '支付成功。';
        lblMessage.Caption := '是否需要打印收据?';
        btnCancel.Caption := '否';
        btnOK.Caption := '是';
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