unit TLBarcodeReady.Plugin;

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
    imgBarcodeReady: TImage;
    lblBarcodeNotice1: TLabel;
    lblBarcodeNotice2: TLabel;
    lblBarcodeNotice3: TLabel;
    lblFormTitle: TLabel;
    panButtonContainer: TPanel;
    btnClose: TcxButton;

    procedure PluginModuleClose(Sender: TObject; var Action: TCloseAction);
    procedure PluginModuleActivate(Sender: TObject);
    procedure PluginModuleDeactivate(Sender: TObject);
    procedure PluginModuleMessage(Sender: TObject; AMsg: TPluginMessage);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
    FOwnerID: Integer;

    procedure ProcessMessages(AMsg: TPluginMessage);
    procedure CallbackBarcode(const ABarcode: string);
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
  Global.PluginInfo.BarcodeReadyPluginId := Self.PluginID;
  Global.BarcodeScanner.OwnerId := Self.PluginID;
  Global.BarcodeScanner.PaycoMode := False;
  SetDoubleBuffered(Self, True);
  MakeRoundedControl(Self);
  btnClose.OnCustomDraw := Global.OnCxButtonCustomDraw;

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
  Global.PluginInfo.BarcodeReadyPluginId := 0;
  Global.BarcodeScanner.OwnerId := 0;
  (imgBarcodeReady.Picture.Graphic as TGIFImage).Animate := False;
  LF.Close;
  LF.Free;
  LF := nil;
  Action := caFree;
end;

procedure TPluginForm.PluginModuleActivate(Sender: TObject);
begin
  Global.BarcodeScanner.OwnerId := Self.PluginID;
end;

procedure TPluginForm.PluginModuleDeactivate(Sender: TObject);
begin
  Global.BarcodeScanner.OwnerId := 0;
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
    (imgBarcodeReady.Picture.Graphic as TGIFImage).Animate := True;
    (imgBarcodeReady.Picture.Graphic as TGIFImage).AnimationSpeed := 100;
    SetForegroundWindow(Self.Handle);
  end;

  if (AMsg.Command = CPC_CLOSE) or
     ((AMsg.Command = CPC_SET_KIOSK_MODE) and (AMsg.ParamByInteger(CPP_VALUE) = KSM_IDLE)) then
    Self.Close;

  if (AMsg.Command = CPC_SET_FOREGROUND) then
    SetForegroundWindow(Self.Handle);

  if (AMsg.Command = CPC_SEND_BARCODE) then
    CallbackBarcode(AMsg.ParamByString(CPP_VALUE));
end;

procedure TPluginForm.CallbackBarcode(const ABarcode: string);
var
  PM: TPluginMessage;
begin
  PM := TPluginMessage.Create(nil);
  try
    PM.Command := CPC_SEND_BARCODE;
    PM.AddParams(CPP_VALUE, ABarcode);
    PM.PluginMessageToID(Global.PluginInfo.TicketingPluginId);
  finally
    FreeAndNil(PM);
    Self.ModalResult := mrOK;
  end;
end;

procedure TPluginForm.btnCloseClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TPluginForm.ApplyTheme;
begin
  with Global.ThemeInfo do
  begin
    Self.Color := Colors.background1;
    lblFormTitle.Color := Colors.background1;
    lblFormTitle.Font.Color := Colors.black;
    lblBarcodeNotice1.Color := Colors.background1;
    lblBarcodeNotice1.Font.Color := Colors.type4;
    lblBarcodeNotice2.Color := Colors.background1;
    lblBarcodeNotice2.Font.Color := Colors.black;
    lblBarcodeNotice3.Color := Colors.background1;
    lblBarcodeNotice3.Font.Color := Colors.type4;
    panButtonContainer.Color := Colors.background1;
    StreamToPicture(imgBarcodeReady.Picture, Images.ani_barcode.Stream);
  end;
end;

procedure TPluginForm.ApplyLocale;
begin
(*
예매상세내역 또는 휴대폰으로 전송된
바코드를 우측 하단의 바코드 스캐너에
읽혀 주세요.
휴대폰, 예매번호로 조회하려면
[닫기] 버튼을 선택해 주세요.

바코드가 읽히지 않을 경우 화면 밝기를 최대로
변경 후 다시 시도해 주세요.

Please scan the reservation details or the barcode
sent to the mobile phone on the barcode scanner
located at the bottom right.
To check using your mobile phone number and
reservation number, please select the [Close]
button.

If the barcode scan is not working,
please adjust the screen brightness to the maximum and
try again.
*)
  case Global.KioskLocale of
    TKioskLocale.klKorean:
      begin
        lblFormTitle.Caption := '바코드로 조회';
        lblBarcodeNotice1.Font.Size := 18;
        lblBarcodeNotice1.Caption := '예매상세내역 또는 휴대폰으로 전송된' + _CRLF +
          '바코드를 우측 하단의 바코드 스캐너에' + _CRLF +
          '읽혀 주세요.' + _CRLF +
          '휴대폰, 예매번호로 조회하려면';
        lblBarcodeNotice2.Caption := '[닫기] 버튼을 선택해 주세요.';
        lblBarcodeNotice3.Font.Size := 18;
        lblBarcodeNotice3.Caption := '바코드가 읽히지 않을 경우 화면 밝기를 최대로' + _CRLF +
          '변경 후 다시 시도해 주세요.';
        btnClose.Caption := '닫기';
      end;
    TKioskLocale.klEnglish:
      begin
        lblFormTitle.Caption := 'Scan your Barcode';
        lblBarcodeNotice1.Font.Size := 13;
        lblBarcodeNotice1.Caption := 'Please scan the barcode in your reservation details or the one' + _CRLF +
          'sent to your phone on the barcode scanner at the bottom right.' + _CRLF +
          'Select [Close] to check using your mobile phone number and' + _CRLF +
          'reservation details.';
        lblBarcodeNotice2.Caption := '';
        lblBarcodeNotice3.Font.Size := 13;
        lblBarcodeNotice3.Caption := 'If you are unable to scan the barcode scan,' + _CRLF +
          'make sure to adjust your screen brightness' + _CRLF +
          'to the maximum and try again.';
        btnClose.Caption := 'Close';
      end;
    TKioskLocale.klJapanese:
      begin
        //lblFormTitle.Caption := 'ポップアップタイトル：バーコードで照会する';
        lblFormTitle.Caption := 'バーコードで照会する';
        lblBarcodeNotice1.Font.Size := 13;
        lblBarcodeNotice1.Caption := '予約詳細画面又は携帯電話に送られたバーコードを' + _CRLF +
          '右下のバーコードスキャナーでお読み取りください。' + _CRLF +
          '携帯電話番号、予約番号で照会するには「閉じる」ボタンを選択してください。';
        lblBarcodeNotice2.Caption := '';
        lblBarcodeNotice3.Font.Size := 13;
        lblBarcodeNotice3.Caption := 'バーコードを読み取ることができない場合は、' + _CRLF +
          '画面の明るさをMAXにしてからもう一度お試しください。';
        btnClose.Caption := '閉じる';
      end;
    TKioskLocale.klChinese:
      begin
        //lblFormTitle.Caption := '弹出标题：条形码查询';
        lblFormTitle.Caption := '条形码查询';
        lblBarcodeNotice1.Font.Size := 13;
        lblBarcodeNotice1.Caption := '请利用右下方条形码扫描机扫描预购详细明细或发送到手机上的条形码。' + _CRLF +
          '若使用手机号码或预购号码查询，请点击[关闭]按键。';
        lblBarcodeNotice2.Caption := '';
        lblBarcodeNotice3.Font.Size := 13;
        lblBarcodeNotice3.Caption := '若无法读取条形码，' + _CRLF +
          '请将屏幕调至最亮后，再试一次。';
        btnClose.Caption := '关闭';
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