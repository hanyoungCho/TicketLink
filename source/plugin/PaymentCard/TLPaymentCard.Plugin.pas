unit TLPaymentCard.Plugin;

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
    lblMessage1: TLabel;
    lblMessage2: TLabel;
    lblRemainTime: TLabel;
    lblFormTitle: TLabel;
    btnClose: TcxButton;
    imgPaymentCard: TImage;
    tmrTimeout: TTimer;

    procedure PluginModuleClose(Sender: TObject; var Action: TCloseAction);
    procedure PluginModuleMessage(Sender: TObject; AMsg: TPluginMessage);
    procedure btnCloseClick(Sender: TObject);
    procedure tmrTimeoutTimer(Sender: TObject);
  private
    { Private declarations }
    FOwnerID: Integer;
    FDispMode: Integer;
    FPaymentAmt: Integer;
    FIsFirst: Boolean;
    FCardInserted: Boolean;
    FApproved: Boolean;
    FPaymentWorking: Boolean;
    FLastError: string;
    FWaitTime: Integer;

    procedure ProcessMessages(AMsg: TPluginMessage);
    procedure DoApproval;
    procedure ApplyTheme;
    procedure ApplyLocale;

    procedure SetDispMode(const ADispMode: Integer);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; AMsg: TPluginMessage=nil); override;
    destructor Destroy; override;

    property DispMode: Integer read FDispMode write SetDispMode;
  end;

implementation

uses
  { Native }
  System.DateUtils,
  { VAN Module }
  uVanDaemonModule,
  //uVanKcpModul,
  { Project }
  Common.TLGlobal, Common.TLDM, Common.TLCommonLib, Common.TLLayerForm, Common.TLMsgBox;

const
  LCN_TIMEOUT     = 30;
  LDM_CARD_INPUT  = 0; //카드 삽입
  LDM_CARD_FAIL   = 1; //결제 실패
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
  FPaymentAmt := 0;
  FWaitTime := 0;
  FDispMode := -1;
  FIsFirst := True;
  FCardInserted := False;
  FApproved := False;
  FPaymentWorking := False;
  FLastError := '';
  SetDoubleBuffered(Self, True);
  MakeRoundedControl(Self);
  btnClose.OnCustomDraw := Global.OnCxButtonCustomDraw;

  ApplyTheme;
  ApplyLocale;
  if Assigned(AMsg) then
    ProcessMessages(AMsg);

  tmrTimeout.Interval := 100;
  tmrTimeout.Enabled := True;
end;

destructor TPluginForm.Destroy;
begin
  inherited Destroy;
end;

procedure TPluginForm.PluginModuleClose(Sender: TObject; var Action: TCloseAction);
begin
  (imgPaymentCard.Picture.Graphic as TGIFImage).Animate := False;
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
    FPaymentAmt := AMsg.ParamByInteger(CPP_VALUE);
  end;

  if (AMsg.Command = CPC_APPLY_THEME) then
    ApplyTheme;

  if (AMsg.Command = CPC_SET_LOCALE) then
    ApplyLocale;
end;

procedure TPluginForm.btnCloseClick(Sender: TObject);
begin
  if (FDispMode = LDM_CARD_INPUT) and
     (Global.StoreInfo.VanCode = CCC_KCP_VAN_CD) then
    Global.VanModule.CallTransCancel;

  ModalResult := mrCancel;
end;

procedure TPluginForm.tmrTimeoutTimer(Sender: TObject);
var
  LRespCode, LRespMsg: AnsiString;
begin
  with TTimer(Sender) do
  try
    Enabled := False;
    if FIsFirst then
    begin
      FIsFirst := False;
      Interval := 1000;
      DispMode := LDM_CARD_INPUT;
    end;

    Inc(FWaitTime);
    lblRemainTime.Caption := IntToStr(LCN_TIMEOUT - FWaitTime);
    if (FWaitTime >= LCN_TIMEOUT) then
    begin
      case DispMode of
        LDM_CARD_FAIL:
          ModalResult := mrCancel;
        LDM_CARD_INPUT:
          DispMode := LDM_CARD_FAIL;
      end;
    end;

    if (DispMode = LDM_CARD_FAIL) then
      Exit;

    if (Global.StoreInfo.UseDetectCardInsert and (not FCardInserted)) then
      FCardInserted := DM.GetICCardInsertionStatus(LRespCode, LRespMsg);

    {$IFDEF RELEASE}
    if ((not Global.StoreInfo.UseDetectCardInsert) or FCardInserted) and
       (not FApproved) and
       (not FPaymentWorking) then
      DoApproval;
    {$ENDIF}
    {$IFDEF DEBUG}
      DoApproval;
    {$ENDIF}

  finally
    Enabled := (not FApproved);
  end;
end;

procedure TPluginForm.DoApproval;
var
  LStoredData: Boolean;
  LErrMsg: string;
begin
  FPaymentWorking := True;
  try
    if Global.StoreInfo.UseDetectCardInsert then
      btnClose.Visible := False;

    FWaitTIme := 0;
    LStoredData := False;
    FApproved := DM.DoApproveCARD(Global.ReceiptInfo.ReceiptNo, FPaymentAmt, LStoredData, LErrMsg);
    if not FApproved then
      DispMode := LDM_CARD_FAIL
    else
    begin
      if LStoredData then
        ModalResult := mrOK
      else
      begin
        ShowMsgBoxError(GetTextLocale(['티켓을 발행할 수 없습니다.' + _CRLF + '매표소에 문의하여 주십시오.',
                                       'Unable to issue tickets.' + _CRLF + 'Please visit the ticket office.',
                                       'チケットを発行できません。' + _CRLF + 'チケット売り場にお問い合わせください。',
                                       '无法出票。' + _CRLF + '请与售票处咨询。']),
                        LErrMsg, [GetTextLocale(['확인', 'Confirm', '確認', '确认'])], 30);
        ModalResult := mrCancel;
      end;
    end;
  finally
    btnClose.Visible := True;
    FPaymentWorking := False;
  end;
end;

procedure TPluginForm.SetDispMode(const ADispMode: Integer);
begin
  if (FDispMode <> ADispMode) then
  begin
    FDispMode := ADispMode;
    try
      btnClose.Visible := False;
      (imgPaymentCard.Picture.Graphic as TGIFImage).Animate := False;

      case FDispMode of
        LDM_CARD_INPUT:
          begin
            FWaitTime := 0;
            lblRemainTime.Caption := IntToStr(LCN_TIMEOUT - FWaitTime);
            lblRemainTime.Visible := Global.StoreInfo.UseDetectCardInsert;
            lblFormTitle.Caption := GetTextLocale(['신용카드 결제', 'Credit card', 'クレジットカード決済', '信用卡支付']);
            lblMessage1.Caption := GetTextLocale(['그림과 같이 카드를 넣은 후', 'Please insert the card as shown in the image', '図のようにクレジットカードを差し込み、', '如图所示，插入银行卡后，']);
            lblMessage2.Caption := GetTextLocale(['티켓이 출력될 때까지 카드를 빼지 마세요.', 'and do NOT remove the card until the ticket is issued.', 'チケットが出力されるまでカードを抜かないでください。', '在出票前请勿取出']);
            btnClose.Caption := GetTextLocale(['취소', 'Back', 'キャンセル', '取消']);
            btnClose.Visible := True;
          end;
        LDM_CARD_FAIL:
          begin
            lblFormTitle.Caption := GetTextLocale(['신용카드 결제 실패', 'Failed to process credit card payment.', 'クレジットカード決済に失敗しました。', '信用卡支付失败。']);
            lblMessage1.Caption := GetTextLocale(['IC카드 인식에 실패했습니다.', 'Failed to read ID card.', 'ICカード認識に失敗しました。', 'IC卡识别失败。']);
            lblMessage2.Caption := GetTextLocale(['카드를 제거해 주세요.', 'Please remove the card.', 'カードを取り外してください。', '请取出银行卡。']);
            btnClose.Caption := GetTextLocale(['카드를 제거하고 눌러 주세요.', 'Please remove the card before tapping.', 'カードを取り外してから押してください。', '在取出银行卡后点击页面。']);
            btnClose.Visible := True;
            FWaitTime := 0;
            StreamToPicture(imgPaymentCard.Picture, Global.ThemeInfo.Images.ani_creditcard_output.Stream);
            lblRemainTime.Caption := IntToStr(LCN_TIMEOUT);
            lblRemainTime.Visible := True;
          end;
      end;
    finally
      (imgPaymentCard.Picture.Graphic as TGIFImage).AnimationSpeed := 100;
      (imgPaymentCard.Picture.Graphic as TGIFImage).Animate := True;
    end;
  end;
end;

procedure TPluginForm.ApplyTheme;
begin
  with Global.ThemeInfo do
  begin
    Self.Color := Colors.background1;
    panMessage.Color := Colors.background1;
    lblFormTitle.Color := Colors.background1;
    lblFormTitle.Font.Color := Colors.black;
    lblRemainTime.Color := Colors.background1;
    lblMessage1.Color := Colors.background1;
    //lblMessage1.Font.Color := Colors.type4;
    lblMessage1.Font.Color := Colors.black;
    lblMessage2.Color := Colors.background1;
    lblMessage2.Font.Color := Colors.black;
    StreamToPicture(imgPaymentCard.Picture, Images.ani_creditcard_input.Stream);
    panButtonContainer.Color := Colors.background1;
  end;
end;

procedure TPluginForm.ApplyLocale;
begin
  case Global.KioskLocale of
    TKioskLocale.klKorean:
      begin
        lblFormTitle.Caption := '신용카드 결제';
        lblMessage1.Font.Size := 18;
        lblMessage1.Caption := '그림과 같이 카드를 넣은 후';
        lblMessage2.Font.Size := 18;
        lblMessage2.Caption := '티켓이 출력될 때까지 카드를 빼지 마세요.';
        btnClose.Caption := '취소';
      end;
    TKioskLocale.klEnglish:
      begin
        lblFormTitle.Caption := 'Credit Card';
        lblMessage1.Font.Size := 16;
        lblMessage1.Caption := 'Please insert the card as shown in the image';
        lblMessage2.Font.Size := 16;
        lblMessage2.Caption := 'and do NOT remove the card until the ticket is issued.';
        btnClose.Caption := 'Back';
      end;
    TKioskLocale.klJapanese:
      begin
        lblFormTitle.Caption := 'クレジットカード決済';
        lblMessage1.Font.Size := 16;
        lblMessage1.Caption := '図のようにクレジットカードを差し込み、';
        lblMessage2.Font.Size := 16;
        lblMessage2.Caption := 'チケットが出力されるまでカードを抜かないでください。';
        btnClose.Caption := 'キャンセル';
      end;
    TKioskLocale.klChinese:
      begin
        lblFormTitle.Caption := '信用卡支付';
        lblMessage1.Font.Size := 16;
        lblMessage1.Caption := '如图所示，插入银行卡后，';
        lblMessage2.Font.Size := 16;
        lblMessage2.Caption := '在出票前请勿取出';
        btnClose.Caption := '取消';
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
