unit TLPrintingMsg.Plugin;

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
  { 프린터 출력 스레드 }
  TPrintOutThread = class(TThread)
  private
    FActive: Boolean;
  protected
    procedure Execute; override;
  public
    constructor Create;
    destructor Destroy; override;

    property Active: Boolean read FActive write FActive default False;
  end;

  TPluginForm = class(TPluginModule)
    panButtonContainer: TPanel;
    panMessage: TPanel;
    lblMessage2: TLabel;
    lblMessage1: TLabel;
    tmrTimeout: TTimer;
    lblTimeout: TLabel;
    btnHome: TcxButton;
    imgTicketPrinting: TImage;
    imgTicketPrintComplete: TImage;
    lblNotice: TLabel;

    procedure PluginModuleClose(Sender: TObject; var Action: TCloseAction);
    procedure PluginModuleMessage(Sender: TObject; AMsg: TPluginMessage);
    procedure tmrTimeoutTimer(Sender: TObject);
    procedure btnHomeClick(Sender: TObject);
  private
    { Private declarations }
    FOwnerID: Integer;
    FWaitTime: Integer;
    FIsFirst: Boolean;
    FCheckTimeout: Boolean;
    FReceiptNo: string;
    FReserveNo: Int64;
    FReceiptPrint: Boolean;

    procedure ProcessMessages(AMsg: TPluginMessage);
    procedure DoPrintComplete;
    procedure DoPrintError;
    procedure ApplyTheme;
    procedure ApplyLocale;

    procedure SetCheckTimeout(const ACheckTimeout: Boolean);
    procedure DoPrintOut;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; AMsg: TPluginMessage=nil); override;
    destructor Destroy; override;

    property CheckTimeout: Boolean read FCheckTimeout write SetCheckTimeout;
  end;

implementation

uses
  { Native }
  System.Threading,
  { Project }
  Common.TLGlobal, Common.TLDM, Common.TLCommonLib, Common.TLReceiptPrintManager,
  Common.TLTicketPrintManager, Common.TLLayerForm;

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

  Global.PluginInfo.PrintingMsgPluginId := Self.PluginID;
  FOwnerID := 0;
  FWaitTime := 0;
  FIsFirst := True;
  FCheckTimeout := False;
  FReceiptNo := '';
  FReserveNo := 0;
  FReceiptPrint := False;

  SetDoubleBuffered(Self, True);
  MakeRoundedControl(Self);
  btnHome.OnCustomDraw := Global.OnCxButtonCustomDraw;
  panButtonContainer.Visible := False;

  ApplyTheme;
  ApplyLocale;
  if Assigned(AMsg) then
    ProcessMessages(AMsg);

  imgTicketPrintComplete.Visible := False;
  (imgTicketPrinting.Picture.Graphic as TGIFImage).AnimationSpeed := 100;
  (imgTicketPrinting.Picture.Graphic as TGIFImage).Animate := True;
  lblTimeout.Visible := False;
  tmrTimeout.Interval := 100;
  tmrTimeout.Enabled := True;
end;

destructor TPluginForm.Destroy;
begin
  inherited Destroy;
end;

procedure TPluginForm.PluginModuleClose(Sender: TObject; var Action: TCloseAction);
begin
  Global.ReceiptPrintManager.PrintJson := '';
  Global.PluginInfo.PrintingMsgPluginId := 0;
  (imgTicketPrinting.Picture.Graphic as TGIFImage).Animate := False;
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
    FReceiptNo := AMsg.ParamByString(CPP_RECEIPT_NO);
    FReserveNo := AMsg.ParamByInt64(CPP_RESERVE_NO);
    FReceiptPrint := AMsg.ParamByBoolean(CPP_RECEIPT_PRINT);
  end;

  if (AMsg.Command = CPC_PRINT_COMPLETE) then
    DoPrintComplete;

  if (AMsg.Command = CPC_PRINT_ERROR) then
    DoPrintError;

  if (AMsg.Command = CPC_CLOSE) then
    Self.ModalResult := mrOK;

  if (AMsg.Command = CPC_APPLY_THEME) then
    ApplyTheme;
end;

procedure TPluginForm.tmrTimeoutTimer(Sender: TObject);
begin
  with TTimer(Sender) do
  try
    if FIsFirst then
    begin
      FIsFirst := False;
      Interval := 1000;
      DoPrintOut;
    end;

    if (GetForegroundWindow <> Self.Handle) then
      SetForegroundWindow(Self.Handle);

    if CheckTimeout then
    begin
      Inc(FWaitTime);
      if (FWaitTime >= LCN_TIMEOUT) then
        Self.ModalResult := mrOK
      else
        lblTimeout.Caption := IntToStr(LCN_TIMEOUT - FWaitTime);
    end;
  finally
    Enabled := True;
  end;
end;

procedure TPluginForm.btnHomeClick(Sender: TObject);
begin
  Self.ModalResult := mrOK;
end;

procedure TPluginForm.DoPrintComplete;
begin
  (imgTicketPrinting.Picture.Graphic as TGIFImage).Animate := False;
  imgTicketPrinting.Visible := False;
  lblMessage1.Caption := GetTextLocale(['티켓 출력이 완료 되었습니다.', 'Ticket printing complete.', 'チケットを出力しました。', '门票打印结束。']);
  lblMessage2.Caption := GetTextLocale(['사용하신 신용카드를 회수하셨는지 확인해 주세요.' + _CRLF + '이용해 주셔서 고맙습니다.',
                                        'Please make sure you have retrieved your credit card.' + _CRLF + 'Thank you.',
                                        'ご使用のクレジットカードを回収したか、もう一度ご確認ください。' + _CRLF + 'ご利用いただきましてありがとうございました。',
                                        '请确认是否取出所使用银行卡。' + _CRLF + '感谢您的使用。']);
  StreamToPicture(imgTicketPrintComplete.Picture, Global.ThemeInfo.Images.ico_complete.Stream);
  imgTicketPrintComplete.Visible := True;
  CheckTimeout := True;
  panButtonContainer.Visible := True;
end;

procedure TPluginForm.DoPrintError;
begin
  (imgTicketPrinting.Picture.Graphic as TGIFImage).Animate := False;
  imgTicketPrinting.Visible := False;
  lblMessage1.AutoSize := False;
  lblMessage1.Caption := GetTextLocale(['프린터에 장애가 발생하여' + _CRLF + '무인발권기 이용이 불가합니다.',
                                        'Ticketing service is unavailable as there seems ' + _CRLF + 'to be an error occurred to the printer.',
                                        'プリンターにエラーが発生したため、' + _CRLF + '無人発券機を利用できません。',
                                        '打印机出现故障，' + _CRLF + '无法使用无人售票机。']);
  //lblMessage2.Caption := GetTextLocale(['매표소에 문의하여 주십시오.', 'Please contact the ticket office.']);
  lblMessage2.Caption := GetTextLocale(['매표소로 문의하여 주시기 바랍니다.', 'Please visit the ticket office.', '予約詳細の場所情報をご確認ください。', '请前往售票处咨询。']);
  lblMessage1.AutoSize := True;
  StreamToPicture(imgTicketPrintComplete.Picture, Global.ThemeInfo.Images.ico_alert.Stream);
  imgTicketPrintComplete.Visible := True;
  CheckTimeout := True;
  panButtonContainer.Visible := True;
end;

procedure TPluginForm.DoPrintOut;
var
  LResMsg: string;
begin
  TTask.Run(
    procedure
    var
      LErrMsg: string;
    begin
      try
        //출력할 영수증 및 티켓 데이터 생성
        if not DM.GetPrintingScript(FReceiptNo, FReserveNo, FReceiptPrint, LErrMsg) then
          raise Exception.Create(LErrMsg);

        //티켓 프린터로 티켓 출력
        if Global.TicketPrinter.Enabled and
           Global.TicketPrinter.Active and
           (Length(Global.TicketTemplateList) > 0) then
        begin
          if not Global.TicketPrinter.Active then
            //raise Exception.Create(GetTextLocale(['매표소에 문의하여 주십시오.', 'Please contact the ticket office.']));
            raise Exception.Create(GetTextLocale(['매표소로 문의하여 주시기 바랍니다.', 'Please visit the ticket office.', '予約詳細の場所情報をご確認ください。', '请前往售票处咨询。']));
          if not DoPrintTicketLabel(DM.MTTicketTemplate, LResMsg) then
            raise Exception.Create(GetTextLocale(['장애가 발생하여 무인발권기 이용이 불가합니다.' + _CRLF + LResMsg,
                                                  'Ticketing service is unavailable as there seems ' + _CRLF + 'to be an error occurred to the printer.',
                                                  'エラーが発生したため、' + _CRLF + '無人発券機を利用できません。',
                                                  '发生错误，' + _CRLF + '无法使用无人售票机。']));
        end;

        //영수증 또는 영수증 프린터로 티켓 출력
        if not Global.ReceiptPrintManager.DoPrint(Global.ReceiptPrintManager.PrintJson, LErrMsg) then
          raise Exception.Create(LErrMsg);

        SendPluginCommand(CPC_PRINT_COMPLETE, 0, Self.PluginID);
      except
        on E: Exception do
        begin
          Global.ReceiptPrinter.ErrorCode := 90;
          Global.ReceiptPrinter.LastError := E.Message;
          SendPluginCommand(CPC_PRINT_ERROR, 0, Self.PluginID);
        end;
      end;
    end);
end;

procedure TPluginForm.SetCheckTimeout(const ACheckTimeout: Boolean);
begin
  FCheckTimeout := ACheckTimeout;
  lblTimeout.Visible := FCheckTimeout;
  if FCheckTimeout then
  begin
    FWaitTime := 0;
    lblTimeout.Caption := IntToStr(LCN_TIMEOUT);
  end;
end;

procedure TPluginForm.ApplyTheme;
begin
  with Global.ThemeInfo do
  begin
    Self.Color := Colors.background1;
    panMessage.Color := Colors.background1;
    lblMessage1.Color := Colors.background1;
    lblMessage1.Font.Color := Colors.black;
    lblMessage2.Color := Colors.background1;
    lblMessage2.Font.Color := Colors.type4;
    lblNotice.Color := Colors.background1;
    lblNotice.Font.Color := Colors.type4;
    StreamToPicture(imgTicketPrinting.Picture, Images.ani_ticket_printing.Stream);
    StreamToPicture(imgTicketPrintComplete.Picture, Images.ico_complete.Stream);
    panButtonContainer.Color := Colors.background1;
  end;
end;

procedure TPluginForm.ApplyLocale;
begin
  case Global.KioskLocale of
    TKioskLocale.klKorean:
      begin
        lblMessage1.Caption := '티켓을 출력 중입니다.';
        lblMessage2.Caption := '잠시만 기다려 주세요.';
        lblNotice.Caption := '티켓이 출력되지 않을 경우 매표소에 문의하여 주세요.';
        btnHome.Caption := '처음으로';
      end;
    TKioskLocale.klEnglish:
      begin
        lblMessage1.Caption := 'Printing ticket(s)…';
        lblMessage2.Caption := 'Please hold.';
        lblNotice.Caption := 'Please visit the ticket office if your ticket is not being printed.';
        btnHome.Caption := 'Home';
      end;
    TKioskLocale.klJapanese:
      begin
        lblMessage1.Caption := 'チケットを出力中です。';
        lblMessage2.Caption := 'しばらくお待ちください。';
        lblNotice.Caption := 'チケットを出力できない場合は、チケット売り場にお問い合わせください。';
        btnHome.Caption := 'ホーム';
      end;
    TKioskLocale.klChinese:
      begin
        lblMessage1.Caption := '正在打印门票，';
        lblMessage2.Caption := '请稍后。';
        lblNotice.Caption := '若门票打印失败，请咨询售票处。';
        btnHome.Caption := '回到首页';
      end;
  end;
end;

{ TPrintOutThread }

constructor TPrintOutThread.Create;
begin

end;

destructor TPrintOutThread.Destroy;
begin

  inherited;
end;

procedure TPrintOutThread.Execute;
begin
  inherited;

end;

////////////////////////////////////////////////////////////////////////////////////////////////////

function OpenPlugin(AMsg: TPluginMessage=nil): TPluginModule;
begin
  Result := TPluginForm.Create(Application, AMsg);
end;

exports
  OpenPlugin;

end.
