unit TLTicketBuy.Plugin;

interface

uses
  { Native }
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Forms, Vcl.Controls,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus, Vcl.Imaging.pngimage, System.Generics.Collections,
  { Plugin System }
  uPluginManager, uPluginModule, uPluginMessages,
  { DevExpress }
  dxGDIPlusClasses, dxBarBuiltInMenu, cxGraphics, cxControls, cxLookAndFeels, cxContainer, cxEdit,
  cxLookAndFeelPainters, cxButtons, cxLabel, cxScrollBox, cxPC,
  { TMS }
  AdvSmoothPanel, AdvSmoothButton, AdvShapeButton;

{$I ..\..\common\Common.TLGlobal.inc}

type
  TMyScrollBox = class(TcxScrollBox)
  protected
    procedure DoUpdateScrollBars; override;
  end;

  TcxScrollBox = class(TMyScrollBox);

  TPluginForm = class(TPluginModule)
    panTop: TPanel;
    panTopLeft: TPanel;
    panTopRight: TPanel;
    panTopCenter: TPanel;
    lblCurrentDateTime: TLabel;
    panBodyHeadTitle: TPanel;
    lblBodyHeadTicketOrder: TLabel;
    imgLogo: TImage;
    lblHeadSeparator: TLabel;
    panProductInfo: TPanel;
    pgcTicketBuy: TcxPageControl;
    tabDenominList: TcxTabSheet;
    tabProductList: TcxTabSheet;
    tabRoundList: TcxTabSheet;
    sbxProductList: TcxScrollBox;
    panProductListNavigator: TPanel;
    sbxScheduleList: TcxScrollBox;
    panDenominList: TPanel;
    pgcOrderList: TcxPageControl;
    tabOrderNone: TcxTabSheet;
    tabOrderList: TcxTabSheet;
    panOrderSummary: TPanel;
    imgBuyingNone: TImage;
    lblBuyingNone: TLabel;
    panOrderListTotal: TPanel;
    lblOrderTotalQtyTitle: TLabel;
    lblOrderTotalQtyValue: TLabel;
    lblOrderTotalQtyUnit: TLabel;
    lblOrderTotalPriceTitle: TLabel;
    lblOrderTotalPriceValue: TLabel;
    lblOrderTotalPriceUnit: TLabel;
    sbxOrderList: TcxScrollBox;
    panProductThumbnail: TPanel;
    imgProductThumbnail: TImage;
    lblProductSeparator: TLabel;
    sbxDenominList: TcxScrollBox;
    TemplateOrderItemPanel: TPanel;
    TemplateOrderItemTitleLabel: TLabel;
    TemplateOrderSeparator: TLabel;
    TemplateOrderItemQtyLabel: TcxLabel;
    TemplateOrderItemAmtValueLabel: TLabel;
    TemplateOrderItemAmtUnitLabel: TLabel;
    TemplateOrderItemRemoveButton: TAdvShapeButton;
    TemplateOrderItemQtyDecButton: TAdvShapeButton;
    TemplateOrderItemQtyIncButton: TAdvShapeButton;
    tabPaymentList: TcxTabSheet;
    sbxPaymentList: TcxScrollBox;
    panPaymentSummary: TPanel;
    panPaymentListTotal: TPanel;
    lblPaymentTotalQtyTitle: TLabel;
    lblPaymentTotalQtyValue: TLabel;
    lblPaymentTotalPriceUnit: TLabel;
    lblPaymentTotalPriceTitle: TLabel;
    lblPaymentTotalPriceValue: TLabel;
    lblPaymentTotalQtyUnit: TLabel;
    btnDoCreditCard: TcxButton;
    btnDoPAYCO: TcxButton;
    btnDoPayment: TcxButton;
    btnOrderClear: TcxButton;
    Panel2: TPanel;
    lblPaymentDenominQty: TLabel;
    PaymentListSeparator2: TLabel;
    lblPaymentDenominTitle: TLabel;
    lblPaymentDenominAmt: TLabel;
    Panel3: TPanel;
    PaymentListSeparator1: TLabel;
    lblPaymentTitle: TLabel;
    panDenominListNavigator: TPanel;
    cxTabSheet1: TcxTabSheet;
    TemplateDenominPanel1: TAdvSmoothPanel;
    TemplateDenominPriceLabel1: TLabel;
    TemplateDenominNameContainer1: TPanel;
    TemplateDenominSeparator1: TLabel;
    TemplateDenominTitle1: TLabel;
    TemplateDenominPanel2: TAdvSmoothPanel;
    TemplateDenominPriceLabel2: TLabel;
    TemplateDenominNameContainer2: TPanel;
    TemplateDenominSeparator2: TLabel;
    TemplateDenominTitle2: TLabel;
    TemplateDenominPanel3: TAdvSmoothPanel;
    TemplateDenominPriceLabel3: TLabel;
    TemplateDenominNameContainer3: TPanel;
    TemplateDenominSeparator3: TLabel;
    TemplateDenominTitle3: TLabel;
    TemplateDenominSoldout3: TLabel;
    TemplateDenominPanel4: TAdvSmoothPanel;
    TemplateDenominPriceLabel4: TLabel;
    TemplateDenominNameContainer4: TPanel;
    TemplateDenominSeparator4: TLabel;
    TemplateDenominTitle4: TLabel;
    TemplateProdPanel1: TAdvSmoothPanel;
    TemplateProdImage1: TImage;
    TemplateProdTitle1: TLabel;
    TemplateSchedulePanel: TAdvSmoothPanel;
    TemplateScheduleDateTimeLabel: TLabel;
    TemplateScheduleRemainCountLabel: TLabel;
    TemplatePaymentItemPanel: TPanel;
    TemplatePaymentItemQtyValueLabel: TLabel;
    TemplatePaymentSeparatorLabel: TLabel;
    TemplatePaymentItemTitleLabel: TLabel;
    TemplatePaymentItemAmtUnitLabel: TLabel;
    TemplatePaymentItemAmtValueLabel: TLabel;
    btnDenominListLeftArrow: TAdvShapeButton;
    btnDenominListRightArrow: TAdvShapeButton;
    btnProductListRightArrow: TAdvShapeButton;
    btnProductListLeftArrow: TAdvShapeButton;
    tabNoProducts: TcxTabSheet;
    imgNoProducts: TImage;
    lblNoProducts: TLabel;
    panProductTitle: TPanel;
    lblProductTitle: TLabel;
    lblProductDate: TLabel;
    btnChangeProductDate: TAdvSmoothButton;
    btnTicketHome: TAdvShapeButton;
    btnBack: TAdvShapeButton;
    btnChangeLocale: TAdvSmoothButton;
    lblCategorySeparator: TLabel;
    panCategoryList: TPanel;
    btnCategoryListLeftArrow: TAdvShapeButton;
    btnCategoryListRightArrow: TAdvShapeButton;
    sbxCategoryList: TcxScrollBox;
    TemplateCategoryItemPanel1: TPanel;
    TemplateCategoryItemIndicator1: TLabel;
    TemplateCategoryItemPanel2: TPanel;
    TemplateCategoryItemIndicator2: TLabel;
    panLocalePopup: TPanel;
    panLocale1: TPanel;
    panLocale2: TPanel;
    panLocale3: TPanel;
    tmrPopupCloser: TTimer;
    Panel1: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Image2: TImage;
    panPayment: TPanel;
    panCard: TPanel;
    panPayco: TPanel;
    imgPayco313: TImage;
    imgPayco231: TImage;
    imgPayco477: TImage;
    imgPayco477b: TImage;
    panAlipay: TPanel;
    imgAlipay231: TImage;
    imgAlipay313: TImage;
    panWechat: TPanel;
    imgWechat231: TImage;
    imgWechat313: TImage;

    procedure PluginModuleActivate(Sender: TObject);
    procedure PluginModuleClose(Sender: TObject; var Action: TCloseAction);
    procedure PluginModuleMessage(Sender: TObject; AMsg: TPluginMessage);
    procedure pgcTicketBuyChange(Sender: TObject);
    procedure btnOrderClearClick(Sender: TObject);
    procedure btnDoPaymentClick(Sender: TObject);
    procedure btnDoPAYCOClick(Sender: TObject);
    procedure btnDoCreditCardClick(Sender: TObject);
    procedure btnProductListLeftArrowClick(Sender: TObject);
    procedure btnProductListRightArrowClick(Sender: TObject);
    procedure btnDenominListLeftArrowClick(Sender: TObject);
    procedure btnDenominListRightArrowClick(Sender: TObject);
    procedure btnBackMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnTicketHomeMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnCategoryListLeftArrowClick(Sender: TObject);
    procedure btnCategoryListRightArrowClick(Sender: TObject);

    procedure OnLocaleItemMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure OnLocaleItemMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,Y: Integer);
    procedure tmrPopupCloserTimer(Sender: TObject);
    procedure btnChangeLocaleMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure imgPayco231Click(Sender: TObject);
    procedure imgPayco313Click(Sender: TObject);
    procedure imgPayco477Click(Sender: TObject);
    procedure imgAlipay231Click(Sender: TObject);
    procedure imgAlipay313Click(Sender: TObject);
    procedure imgWechat231Click(Sender: TObject);
    procedure imgWechat313Click(Sender: TObject);
  private
    { Private declarations }
    FOwnerId: Integer;
    FThemeUpdated: Boolean;
    FProductPages: Integer;
    FCurrentProductPage: Integer;
    FCategoryPages: Integer;
    FCurrentCategoryPage: Integer;
    FDenominPages: Integer;
    FCurrentDenominPage: Integer;

    FBaseHeight: Integer;
    FOrderTotalPrice: Integer;
    FOrderTotalQty: Integer;
    FTimeoutCount: Integer;
    FWorking: Boolean;
    FNormalMode: Boolean;
    FProductName: string;
    FProductNameEN: string;
    FProductDate: string;
    FProductDateEN: string;
    FSelectedProductDate: string;
    FSelectedProductId: Integer;
    FSelectedScheduleId: Integer;

    procedure ProcessMessages(AMsg: TPluginMessage);
    procedure SelectProduct(const AProductId: Integer);
    procedure MakeProductList;
    procedure MakeRoundList(const AProductId: Integer);
    function MakeDenominCategoryList(var AResMsg: string): Boolean;
    procedure MakeDenominList(const ARoundIndex, ACategoryId: Integer);
    procedure AddOrderItem(const ADenominIndex, AItemQty: Integer);
    procedure RemoveOrderItem(const ADenominId: Integer);
    procedure ClearProductList;
    procedure ClearRoundList;
    procedure ClearDenominCategoryList(const ADeleteAll: Boolean);
    procedure ClearDenominList;
    procedure ClearOrderList;
    function CheckRoundRemainCount(const ASearchDate: string; const AProductId, AScheduleId: Integer): Boolean;
    procedure DoPaymentCard;
    procedure DoPaymentPayco(AType: string);
    function DoPrintReceiptAndTicket: Boolean;
    procedure DispCurrentTime;
    procedure SetNavigator(const AScrollBoxHandle: Integer);
    procedure ApplyTheme;
    procedure ApplyLocale;
    procedure UpdateLocalePopup;

    procedure SetProductPage(const APage: Integer);
    procedure SetProductPages(const APages: Integer);
    procedure SetCategoryPage(const APage: Integer);
    procedure SetCategoryPages(const APages: Integer);
    procedure SetDenominPage(const APage: Integer);
    procedure SetDenominPages(const APages: Integer);
    procedure SetOrderTotalPrice(const AOrderTotalPrice: Integer);
    procedure SetOrderTotalQty(const AOrderTotalQty: Integer);
    procedure SetNoProductTitle(const ATitle: string);
  protected
    procedure WndProc(var AMsg: TMessage); override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; AMsg: TPluginMessage=nil); override;
    destructor Destroy; override;

    procedure RefreshOrderTotal;

    property ProductPages: Integer read FProductPages write SetProductPages;
    property CurrentProductPage: Integer read FCurrentProductPage write SetProductPage;
    property CategoryPages: Integer read FCategoryPages write SetCategoryPages;
    property CurrentCategoryPage: Integer read FCurrentCategoryPage write SetCategoryPage;
    property DenominPages: Integer read FDenominPages write SetDenominPages;
    property CurrentDenominPage: Integer read FCurrentDenominPage write SetDenominPage;
    property OrderTotalPrice: Integer read FOrderTotalPrice write SetOrderTotalPrice;
    property OrderTotalQty: Integer read FOrderTotalQty write SetOrderTotalQty;
    property NoProductTitle: string write SetNoProductTitle;
  end;

var
  PluginForm: TPluginForm;

implementation

uses
  { Native }
  Data.DB, System.Math,
  { Absolute Database }
  ABSMain,
  { TMS }
  GDIPFill, AdvGDIP,
  { Project }
  Common.TLGlobal, Common.TLDM, Common.TLCommonLib, Common.TLMsgBox, Common.HTMLColorConversions;

const
  LCN_TIMEOUT = 10;
  LCN_LOCALE_BTN_COUNT = 3;
var
  FOwnerHandle: HWND;
  FProductListHandle: NativeInt;
  FCategoryListHandle: NativeInt;
  FDenominListHandle: NativeInt;
  FLocaleButtons: TArray<TPanel>;

{$R *.dfm}

procedure SetPageControl(APageControl: TcxPageControl);
begin
  with APageControl do
  begin
    for var I: ShortInt := 0 to Pred(PageCount) do
      Pages[I].TabVisible := False;
    ActivePageIndex := 0;
  end;
end;

{ TPluginForm }

procedure TPluginForm.WndProc(var AMsg: TMessage);
begin
  case AMsg.Msg of
    WM_LBUTTONDOWN:
      if (Global.KioskMode = KSM_IDLE) and
         CheckKioskAvailable then
        Global.KioskMode := KSM_HOME;
    CWM_REFRESH_TOTAL:
      RefreshOrderTotal;
    CWM_SELECT_PRODUCT:
      SelectProduct(AMsg.WParam);
    CWM_SELECT_ROUND:
      begin
        ClearOrderList;
        MakeDenominList(AMsg.WParam, 0);
      end;
    CWM_SELECT_DENOMIN_CATEGORY:
      MakeDenominList(AMsg.WParam, AMsg.LParam);
    CWM_SELECT_DENOMIN:
      AddOrderItem(AMsg.WParam, AMsg.LParam);
    CWM_REMOVE_ORDER:
      RemoveOrderItem(AMsg.WParam);
    CWM_SCROLLBOX_NAVIGATOR:
      SetNavigator(AMsg.WParam);
  end;

  inherited WndProc(AMsg);
end;

constructor TPluginForm.Create(AOwner: TComponent; AMsg: TPluginMessage);
begin
  inherited Create(AOwner, AMsg);

  SetDoubleBuffered(Self, True);
  SetPageControl(pgcTicketBuy);
  SetPageControl(pgcOrderList);

  FOwnerHandle := Self.Handle;
  FOwnerId := 0;
  FThemeUpdated := False;
  FNormalMode := False;
  FTimeoutCount := 0;
  FOrderTotalQty := 0;
  FOrderTotalPrice := 0;
  FProductPages := 0;
  FCurrentProductPage := 0;
  FCategoryPages := 0;
  FCurrentCategoryPage := 0;
  FDenominPages := 0;
  FCurrentDenominPage := 0;
  FSelectedProductDate := '';
  FSelectedProductId := 0;
  FSelectedScheduleId := 0;
  FProductName := '';
  FProductNameEN := '';

  FBaseHeight := 1313;
  Self.Height := FBaseHeight;
  Self.Width := Global.BaseScreenWidth;
  Self.Top := (Global.BaseScreenHeight - Self.Height);
  Self.Left := Global.BaseScreenLeft;

  FProductListHandle := Integer(sbxProductList);
  sbxProductList.Tag := FProductListHandle;
  FCategoryListHandle := Integer(sbxCategoryList);
  sbxCategoryList.Tag := FCategoryListHandle;
  FDenominListHandle := Integer(sbxDenominList);
  sbxDenominList.Tag := FDenominListHandle;

  MakeRoundedControl(panLocalePopup, 30, 30);
  SetLength(FLocaleButtons, LCN_LOCALE_BTN_COUNT);
  for var I: ShortInt := 0 to Pred(LCN_LOCALE_BTN_COUNT) do
  begin
    FLocaleButtons[I] := TPanel(FindComponent('panLocale' + IntToStr(I + 1)));
    FLocaleButtons[I].Tag := 0;
    FLocaleButtons[I].OnMouseDown := OnLocaleItemMouseDown;
    FLocaleButtons[I].OnMouseUp := OnLocaleItemMouseUp;
  end;
  panLocalePopup.Visible := False;

  MakeRoundedControl(panProductThumbnail, 10, 10);
  MakeRoundedControl(btnOrderClear);
  btnOrderClear.OnCustomDraw := Global.OnCxButtonCustomDraw;
  MakeRoundedControl(btnDoPayment);
  btnOrderClear.OnCustomDraw := Global.OnCxButtonCustomDraw;


  if (Global.StoreInfo.AllowAliPay = True) and (Global.StoreInfo.AllowWechatPay = True) then
  begin
    panAlipay.Visible := True;
    panAlipay.Width := 231; //313
    imgAlipay231.Visible := True;
    imgAlipay313.Visible := False;

    panWechat.Visible := True;
    panWechat.Width := 231; //313
    panWechat.Left := 245;
    imgWechat231.Visible := True;
    imgWechat313.Visible := False;

    panPayco.Width := 231; //313 477
    panPayco.Left := 490;
    imgPayco231.Visible := True;
    imgPayco313.Visible := False;
    imgPayco477.Visible := False;
    imgPayco477b.Visible := False;

    panCard.Width := 231; //313 477
  end
  else if (Global.StoreInfo.AllowAliPay = True) or (Global.StoreInfo.AllowWechatPay = True) then
  begin
    panAlipay.Visible := Global.StoreInfo.AllowAliPay;
    panAlipay.Width := 313;
    imgAlipay231.Visible := False;
    imgAlipay313.Visible := True;

    panWechat.Visible := Global.StoreInfo.AllowWechatPay;
    panWechat.Width := 313;
    panWechat.Left := 0;
    imgWechat231.Visible := False;
    imgWechat313.Visible := True;

    panPayco.Width := 313; //313 477
    panPayco.Left := 327;
    imgPayco231.Visible := False;
    imgPayco313.Visible := True;
    imgPayco477.Visible := False;
    imgPayco477b.Visible := False;

    panCard.Width := 313; //313 477
  end
  else
  begin
    panAlipay.Visible := False;
    panAlipay.Width := 231; //313
    imgAlipay231.Visible := True;
    imgAlipay313.Visible := False;

    panWechat.Visible := False;
    panWechat.Width := 231; //313
    panWechat.Left := 245;
    imgWechat231.Visible := True;
    imgWechat313.Visible := False;

    panPayco.Width := 477;
    panPayco.Left := 0;
    imgPayco231.Visible := False;
    imgPayco313.Visible := False;
    //if Global.StoreInfo.AllowPAYCO then
    begin
      imgPayco477.Visible := True;
      imgPayco477b.Visible := False;
    end;
    {else
    begin
      imgPayco477.Visible := False;
      imgPayco477b.Visible := True;
    end;
    }
    panCard.Width := 477; //313 477
  end;

  MakeRoundedControl(btnDoCreditCard);
  btnDoCreditCard.OnCustomDraw := Global.OnCxButtonCustomDraw;

  //MakeRoundedControl(btnDoPAYCO);
  //btnDoPAYCO.OnCustomDraw := Global.OnCxButtonCustomDraw;

  //결제 가능한 수단만 활성화
  btnDoCreditCard.Enabled := Global.StoreInfo.AllowCreditCard;
  //btnDoPAYCO.Enabled := Global.StoreInfo.AllowPAYCO;

  btnTicketHome.Enabled := Global.StoreInfo.ShowTicketingMenu;
  btnTicketHome.Left := 92;
  btnBack.Visible := False;

  //별도 기획 필요
  btnCategoryListLeftArrow.Visible := False;
  btnCategoryListRightArrow.Visible := False;

  DispCurrentTime;
  MakeProductList;
  if Assigned(AMsg) then
    ProcessMessages(AMsg);
end;

destructor TPluginForm.Destroy;
begin
  ClearOrderList;
  ClearDenominCategoryList(True);
  ClearDenominList;
  ClearRoundList;
  ClearProductList;

  inherited Destroy;
end;

procedure TPluginForm.PluginModuleActivate(Sender: TObject);
begin
  ApplyTheme;
  ApplyLocale;
end;

procedure TPluginForm.PluginModuleClose(Sender: TObject; var Action: TCloseAction);
begin
  SendMessage(Application.MainForm.Handle, WM_CLOSE, 0, 0);
  Action := caFree;
end;

procedure TPluginForm.PluginModuleMessage(Sender: TObject; AMsg: TPluginMessage);
begin
  ProcessMessages(AMsg);
end;

procedure TPluginForm.ProcessMessages(AMsg: TPluginMessage);
var
  LValue: Integer;
begin
  if (AMsg.Command = CPC_INIT) then
    FOwnerId := AMsg.ParamByInteger(CPP_OWNER_ID);

  if (AMsg.Command = CPC_SET_KIOSK_MODE) then
  begin
    LValue := AMsg.ParamByInteger(CPP_VALUE);
    case LValue of
      KSM_IDLE: //유휴 상태
        if (Global.StoreInfo.ExposureTypeCode = ATC_NORMAL) and
           Global.StoreInfo.ShowTicketBuyMenu and
           (not Global.StoreInfo.ShowTicketingMenu) then
        begin
          Self.Top := (Global.BaseScreenHeight - FBaseHeight);
          Self.Height := FBaseHeight;
          SetForegroundWindow(Self.Handle);
        end;
      KSM_HOME: //메인 홈
        if (Global.StoreInfo.ExposureTypeCode = ATC_NORMAL) and
           Global.StoreInfo.ShowTicketBuyMenu and
           (not Global.StoreInfo.ShowTicketingMenu) then
          Global.KioskMode := KSM_BUY_HOME;
      KSM_BUY_HOME: //티켓 구매(상품 선택 페이지)
        begin
          Self.Top := (Global.BaseScreenHeight - FBaseHeight);
          Self.Height := FBaseHeight;
          if (DM.MTProduct.RecordCount = 0) then
            NoProductTitle := GetTextLocale(['구매 가능한 상품이 없습니다.', 'Sorry, There are no event available for purchase at the moment.', '購入可能な商品がありません。', '无可购买门票。'])
          else
          begin
            ClearRoundList;
            sbxProductList.HorzScrollBar.Position := 0;
            btnTicketHome.Enabled := Global.StoreInfo.ShowTicketingMenu;
            pgcTicketBuy.ActivePage := tabProductList;
          end;

          SetForegroundWindow(Self.Handle);
          if (Global.StoreInfo.ExposureTypeCode = ATC_NORMAL) and
             Global.StoreInfo.ShowTicketBuyMenu then
            ShowNotice(10);
        end;
      KSM_BUY_ROUND: //티켓 구매(상품 회차 선택 페이지)
        begin
          Self.Top := 0;
          Self.Height := Global.BaseScreenHeight;
          ClearDenominCategoryList(False);
          ClearDenominList;
          pgcTicketBuy.ActivePage := tabRoundList;
          SetForegroundWindow(Self.Handle);
          btnTicketHome.Enabled := True;
        end;
      KSM_BUY_DENOMIN: //티켓 구매(권종 선택 페이지)
        begin
          Self.Top := 0;
          Self.Height := Global.BaseScreenHeight;
          pgcTicketBuy.ActivePage := tabDenominList;
          sbxCategoryList.HorzScrollBar.Position := 0;
          sbxDenominList.HorzScrollBar.Position := 0;
          SetForegroundWindow(Self.Handle);
          btnTicketHome.Enabled := True;
        end;
    end;
  end;

  if (AMsg.Command = CPC_SET_FOREGROUND) then
  begin
    pgcTicketBuy.ActivePage := tabProductList;
    sbxProductList.HorzScrollBar.Position := 0;
    SetForegroundWindow(Self.Handle);
  end;

  if (AMsg.Command = CPC_SET_DATETIME) then
    DispCurrentTime;

  if (AMsg.Command = CPC_APPLY_THEME) then
    ApplyTheme;

  if (AMsg.Command = CPC_SET_LOCALE) then
    ApplyLocale;
end;

procedure TPluginForm.btnOrderClearClick(Sender: TObject);
begin
  ClearOrderList;
end;

procedure TPluginForm.btnProductListLeftArrowClick(Sender: TObject);
begin
  with sbxProductList do
  begin
    HorzScrollBar.Position := HorzScrollBar.Position - (504 * 2);
    if (HorzScrollBar.Position < 0) then
      HorzScrollBar.Position := 0;
    SetNavigator(Tag);
  end;
end;

procedure TPluginForm.btnProductListRightArrowClick(Sender: TObject);
begin
  with sbxProductList do
  begin
    HorzScrollBar.Position := HorzScrollBar.Position + (504 * 2);
    SetNavigator(Tag);
  end;
end;

procedure TPluginForm.btnTicketHomeMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Global.KioskMode = KSM_BUY_HOME) then
    Global.KioskMode := KSM_HOME
  else
    Global.KioskMode := KSM_BUY_HOME;
end;

procedure TPluginForm.btnCategoryListLeftArrowClick(Sender: TObject);
begin
  with sbxCategoryList do
  begin
    HorzScrollBar.Position := HorzScrollBar.Position - (270 * 4);
    if (HorzScrollBar.Position < 0) then
      HorzScrollBar.Position := 0;
    SetNavigator(Tag);
  end;
end;

procedure TPluginForm.btnCategoryListRightArrowClick(Sender: TObject);
begin
  with sbxCategoryList do
  begin
    HorzScrollBar.Position := HorzScrollBar.Position + (270 * 4);
    SetNavigator(Tag);
  end;
end;

procedure TPluginForm.btnDenominListLeftArrowClick(Sender: TObject);
begin
  with sbxDenominList do
  begin
    HorzScrollBar.Position := HorzScrollBar.Position - (329 * 3) + 19;
    if (HorzScrollBar.Position < 0) then
      HorzScrollBar.Position := 0;
    SetNavigator(Tag);
  end;
end;

procedure TPluginForm.btnDenominListRightArrowClick(Sender: TObject);
begin
  with sbxDenominList do
  begin
    HorzScrollBar.Position := HorzScrollBar.Position + (329 * 3) - 19;
    SetNavigator(Tag);
  end;
end;

procedure TPluginForm.btnDoCreditCardClick(Sender: TObject);
begin
  DoPaymentCard;
end;

procedure TPluginForm.btnDoPAYCOClick(Sender: TObject);
begin
  DoPaymentPAYCO(PMC_PAYCO);
end;

procedure TPluginForm.imgAlipay231Click(Sender: TObject);
begin
  DoPaymentPAYCO(PMC_ALIPAY);
end;

procedure TPluginForm.imgAlipay313Click(Sender: TObject);
begin
  DoPaymentPAYCO(PMC_ALIPAY);
end;

procedure TPluginForm.imgPayco231Click(Sender: TObject);
begin
  DoPaymentPAYCO(PMC_PAYCO);
end;

procedure TPluginForm.imgPayco313Click(Sender: TObject);
begin
  DoPaymentPAYCO(PMC_PAYCO);
end;

procedure TPluginForm.imgPayco477Click(Sender: TObject);
begin
  DoPaymentPAYCO(PMC_PAYCO);
end;

procedure TPluginForm.imgWechat231Click(Sender: TObject);
begin
  DoPaymentPAYCO(PMC_WECHAT);
end;

procedure TPluginForm.imgWechat313Click(Sender: TObject);
begin
  DoPaymentPAYCO(PMC_WECHAT);
end;

procedure TPluginForm.btnDoPaymentClick(Sender: TObject);
begin
  if FWorking then
    Exit;
  FWorking := True;
  try
    if (OrderTotalQty > 0) and (OrderTotalPrice > 0) then
    begin
      Global.ReceiptInfo.TicketCount := OrderTotalQty;
      Global.ReceiptInfo.SellTotal := OrderTotalPrice;
      pgcTicketBuy.ActivePage := tabPaymentList;
    end;
  finally
    FWorking := False;
  end;
end;

procedure TPluginForm.btnBackMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (pgcTicketBuy.ActivePage = tabPaymentList) then
  begin
    pgcTicketBuy.ActivePage := tabDenominList;
    sbxDenominList.HorzScrollBar.Position := 0;
  end
  else if (pgcTicketBuy.ActivePage = tabDenominList) then
  begin
    lblProductDate.Caption := GetTextLocale([FProductDate, FProductDateEN]);
    Global.KioskMode := KSM_BUY_ROUND;
  end
  else
    Global.KioskMode := KSM_BUY_HOME;
end;

procedure TPluginForm.btnChangeLocaleMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
//var
//  P: TPoint;
begin
  with panLocalePopup do
  begin
    Visible := not Visible;
    if Visible then
    begin
      if not tmrPopupCloser.Enabled then
        tmrPopupCloser.Enabled := True;
//      P := ClientToScreen(Point(0, 0));
//      SetCursorPos(P.X + (Width div 2), P.Y + (Height div 2));
    end;
  end;
end;

procedure TPluginForm.OnLocaleItemMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  with TPanel(Sender) do
  begin
    Top := (Top + 2);
    Left := (Left + 2);
  end;
end;

procedure TPluginForm.OnLocaleItemMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  with TPanel(Sender) do
  begin
    Top := (Top - 2);
    Left := (Left - 2);
    Global.KioskLocale := TKioskLocale(Tag);
    panLocalePopup.Visible := False;
  end;
end;

procedure TPluginForm.SelectProduct(const AProductId: Integer);
var
  MS: TMemoryStream;
  LStartDate, LProdClassType, LProdTypeCode, LDispProdDate, LErrMsg: string;
begin
  ShowWaitMsg(GetTextLocale(['회차 정보를 조회 중입니다...' + _CRLF + '잠시만 기다려 주십시오.',
                            'Retrieving showtime information...' + _CRLF + 'Please hold.',
                            '商品情報を照会しています...' + _CRLF + 'しばらくお待ちください。',
                            '正在搜索场次信息...' + _CRLF + '请稍后。']));
  try
    try
      //주의) FSelectedProductDate --> yyyy.mm.dd 형식임
      FSelectedProductDate := Global.FormattedCurrentServerDate;
      if not DM.GetRoundList(AProductId, FSelectedProductDate, LErrMsg) then
        raise Exception.Create(LErrMsg);

      LErrMsg := GetTextLocale(['매표소를 이용해 주시기 바랍니다.',
                                'Please visit the ticket office.',
                                'チケット売り場をご利用ください。',
                                '请前往购票处。']);
      if (DM.MTRound.RecordCount = 0) then
      begin
        NoProductTitle := GetTextLocale(['구매 가능한 회차가 없습니다.',
                                         'There are no showtimes available for purchase.',
                                         '購入可能な商品がありません。',
                                         '无可购买的场次。']);
        Exit;
      end;

      FSelectedProductId := AProductId;
      Global.ReceiptInfo.ClearData;
      Global.ReceiptInfo.ProductId := AProductId;
      MS := TMemoryStream.Create;
      with DM.MTProduct do
      try
        if Locate('product_id', AProductId, []) then
        begin
          FProductName := FieldByName('product_name').AsString;
          FProductNameEN := FieldByName('product_name_eng').AsString;
          LStartDate := FieldByName('start_date').AsString;
          LProdClassType := FieldByName('product_class_type').AsString;
          LProdTypeCode := FieldByName('product_type_code').AsString;
          LDispProdDate := FieldByName('display_product_date').AsString;
          TBlobField(FieldByName('product_image')).SaveToStream(MS);
          MS.Position := 0;

          lblProductTitle.AutoSize := False;
          lblProductTitle.WordWrap := False;
          lblProductTitle.Caption := GetTextLocale([FProductName, FProductNameEN]);
          lblProductTitle.WordWrap := True;
          lblProductTitle.AutoSize := True;

          if (LProdClassType = PCT_EXHIBITION) and
             (LProdTypeCode = PTC_SEASON) then //전시-기간권인 경우
          begin
            FProductDate := LDispProdDate;
            FProductDateEN := LDispProdDate;
          end
          else
          begin
            FProductDate := Global.FormattedCurrentDate + ' (' +
              DayOfWeekName(StrToDateTime(Global.FormattedCurrentDate + ' 00:00:00', Global.FormatSettingsKR), Ord(Global.KioskLocale)) + ')';
            FProductDateEN := FormatDateTime('ddd, mmm d, yyyy', Now, Global.FormatSettingsEN);
          end;

          lblProductDate.Caption := GetTextLocale([FProductDate, FProductDateEN]);
          imgProductThumbnail.Picture.LoadFromStream(MS);
        end;
      finally
        FreeAndNil(MS);
      end;

      MakeRoundList(AProductId);
      if (Global.RoundList.Count = 1) then
      begin
        if Global.RoundList[0].SoldOut then
        begin
          NoProductTitle := GetTextLocale(['선택하신 상품은 매진 되었습니다.', 'Sorry, The selected event has been sold out.']);
          Exit;
        end;
        Global.RoundList[0].SelectRound(0, Global.RoundList[0].ScheduleId);
      end
      else
        Global.KioskMode := KSM_BUY_ROUND;
    finally
      PushWaitMsg;
    end;
  except
    on E: Exception do
    begin
      {
      ShowMsgBoxError(GetTextLocale(['무인발권기 이용이 불가합니다.', 'Ticket Kiosk is currently unavailable.', '無人発券機を利用できません。', '无法使用无人售票机。']),
        E.Message, [GetTextLocale(['확인', 'Confirm', '確認', '确认'])], 5);
      }
      ShowMsgBoxError(GetTextLocale(['구매가능한 회차가 없습니다.', 'There are no showtimes available for purchase.', '購入可能な商品がありません。', '无可购买的场次。']),
        E.Message, [GetTextLocale(['확인', 'Confirm', '確認', '确认'])], 5);
    end;
  end;
end;

procedure TPluginForm.MakeProductList;
var
  PI: TProductItem;
  MS: TMemoryStream;
  LIndex, LProductId: Integer;
  LProductName, LProductNameEN, LStartDate, LEndDate, LDispProdDate: string;
  LSoldOut: Boolean;
begin
  MS := TMemoryStream.Create;
  try
    with DM.MTProduct do
    begin
      LIndex := 0;
      First;
      while not Eof do
      begin
        LProductId := FieldByName('product_id').AsInteger;
        LProductName := FieldByName('product_name').AsString;
        LProductNameEN := FieldByName('product_name_eng').AsString;
        LStartDate := FieldByName('start_date').AsString;
        LEndDate := FieldByName('end_date').AsString;
        LSoldOut := FieldByName('soldout').AsBoolean;
        LDispProdDate := FieldByName('display_product_date').AsString;
        MS.Clear;
        TBlobField(FieldByName('product_image')).SaveToStream(MS);
        MS.Position := 0;

        PI := TProductItem.Create(Self.Handle);
        PI.ItemIndex := LIndex;
        PI.ProductId := LProductId;
        PI.ProductName := LProductName;
        PI.ProductNameEN := LProductNameEN;
        PI.SoldOut := LSoldOut;
        PI.StartDate := LStartDate;
        PI.EndDate := LEndDate;
        PI.DispProdDate := LDispProdDate;
        PI.BasePanel.Parent := sbxProductList;
        PI.ProductImage.Picture.LoadFromStream(MS);
        PI.UpdateLocale;
        MakeRoundedControl(PI.ProductImageContainer);
        Global.ProductList.Add(PI);

        Inc(LIndex);
        Next;
      end;

      if (RecordCount = 0) then
        NoProductTitle := GetTextLocale(['구매 가능한 상품이 없습니다.', 'Sorry, There are no event available for purchase at the moment.', '購入可能な商品がありません。', '无可购买门票。'])
      else
      begin
        if (RecordCount = 1) then
        begin
          Global.ProductList[0].BasePanel.Align := alNone;
          Global.ProductList[0].BasePanel.Top := 0;
          Global.ProductList[0].BasePanel.Left := (sbxProductList.Width div 2) - (Global.ProductList[0].BasePanel.Width div 2);
        end;

        Self.sbxProductList.HorzScrollBar.Range := (RecordCount * 504) - 40; //BasePanel.Width(464) + BasePanel.Right.Space(40)
        ProductPages := (sbxProductList.ControlCount div 2);
        if (sbxProductList.ControlCount mod 2 > 0) then
          ProductPages := ProductPages + 1;
        if (ProductPages > 0) then
          CurrentProductPage := 0;
        pgcTicketBuy.ActivePage := tabProductList;
      end;
    end;
  except
    on E: Exception do
      ShowMsgBoxError(GetTextLocale(['무인발권기 이용이 불가합니다.', 'Ticket Kiosk is currently unavailable.', '無人発券機を利用できません。', '无法使用无人售票机。']),
        E.Message, [GetTextLocale(['확인', 'Confirm', '確認', '确认'])], 5);
  end;
end;

procedure TPluginForm.MakeRoundList(const AProductId: Integer);
var
  RI: TRoundItem;
  LIndex, LScheduleId, LProductRound, LRemainCount: Integer;
  LScheduleDateTime: string;
  LSoldOut, LShowRemainCount: Boolean;
begin
  ClearRoundList;
  with DM.MTRound do
  begin
    LIndex := 0;
    First;
    while not Eof do
    begin
      LScheduleId := FieldByName('schedule_id').AsInteger;
      LScheduleDateTime := FormatDateTime('hh:nn', StrToDateTime(FieldByName('schedule_datetime').AsString, Global.FormatSettingsKR));
      LProductRound := FieldByName('product_round').AsInteger;
      LSoldOut := FieldByName('soldout').AsBoolean;
      LRemainCount := FieldByName('remain_count').AsInteger;
      LShowRemainCount := FieldByName('show_remain_count').AsBoolean;

      RI := TRoundItem.Create(Self.Handle);
      RI.ItemIndex := LIndex;
      RI.ProductId := AProductId;
      RI.ScheduleId := LScheduleId;
      RI.ScheduleTime := LScheduleDateTime;
      RI.ProductRound := LProductRound;
      RI.CategoryIndex := 0;
      RI.SoldOut := LSoldOut;
      RI.RemainCount := LRemainCount;
      RI.ShowRemainCount := LShowRemainCount;
      RI.BasePanel.Parent := Self.sbxScheduleList;
      RI.BasePanel.Top := (LIndex * 200);
      Global.RoundList.Add(RI);

      Inc(LIndex);
      Next;
    end;

    (* TList Sorting
    FScheduleItemList.Sort(TComparer<TScheduleItem>.Construct(
        function(const AItem1, AItem2: TScheduleItem): Integer
        begin
           Result := CompareText(AItem1.ScheduleTime, AItem2.ScheduleTime);
        end)
      );
    *)
  end;
end;

function TPluginForm.MakeDenominCategoryList(var AResMsg: string): Boolean;
var
  CI: TDenominCategoryItem;
  LIndex, LCategoryId: Integer;
  LTableName, LCategoryName, LCategoryNameEN: string;
begin
  Result := False;
  try
    Self.sbxCategoryList.HorzScrollBar.Range := 0;
    CategoryPages := 0;
    CurrentCategoryPage := 0;
    if (Global.DenominCategoryList.Count = 0) then
    begin
      CI := TDenominCategoryItem.Create(Self.Handle);
      CI.ItemIndex := 0;
      CI.CategoryName := '전체';
      CI.CategoryNameEN := 'All';
      CI.CategoryId := 0;
      CI.BasePanel.Parent := Self.sbxCategoryList;
      CI.BasePanel.Left := 0;
      CI.BasePanel.Align := alLeft;
      CI.UpdateLocale;
      Global.DenominCategoryList.Add(CI);
    end;

    LTableName := 'MTDenomin';
    LIndex := 0;
    with TABSQuery.Create(nil) do
    try
      DatabaseName := DM.ABSDB.DatabaseName;
      InMemory := True;
      SQL.Add('SELECT site_denomination_category_id, site_denomination_category_name, site_denomination_code_order');
      SQL.Add(Format('FROM MEMORY %s', [LTableName]));
      SQL.Add('GROUP BY site_denomination_category_id, site_denomination_category_name, site_denomination_code_order');
      SQL.Add('ORDER BY site_denomination_code_order');
      Open;
      while not Eof do
      begin
        Inc(LIndex);
        LCategoryId := FieldByName('site_denomination_category_id').AsInteger;
        LCategoryName := FieldByName('site_denomination_category_name').AsString;
        LCategoryNameEN := FieldByName('site_denomination_category_name').AsString; //영문명 필드 추가 필요
        CI := TDenominCategoryItem.Create(Self.Handle);
        CI.ItemIndex := LIndex;
        CI.CategoryName := LCategoryName;
        CI.CategoryNameEN := LCategoryNameEN;
        CI.CategoryId := LCategoryId;
        CI.BasePanel.Parent := Self.sbxCategoryList;
        CI.BasePanel.Left := (LIndex * 270) + 1;
        CI.BasePanel.Align := alLeft;
        CI.UpdateLocale;
        Global.DenominCategoryList.Add(CI);
        Next;
      end;

      Self.sbxCategoryList.HorzScrollBar.Range := (270 * Global.DenominCategoryList.Count); //BasePanel.Width(270)
      Self.sbxCategoryList.HorzScrollBar.Increment := 270;
      CategoryPages := (Global.DenominCategoryList.Count div 4);
      if (Global.DenominCategoryList.Count mod 4 > 0) then
        CategoryPages := CategoryPages + 1;
      if (CategoryPages > 0) then
        CurrentCategoryPage := 0;

//      btnCategoryListLeftArrow.Enabled := False;
//      btnCategoryListRightArrow.Enabled := (CategoryPages > 1);
      Result := True;
    finally
      Close;
      Free;
    end;
  except
    on E: Exception do
      AResMsg := E.Message;
  end;
end;

procedure TPluginForm.MakeDenominList(const ARoundIndex, ACategoryId: Integer);
var
  DI: TDenominItem;
  LIndex, LColumn, LColumns, LTop, LLeft, LPages, LCategoryId: Integer;
  LResMsg: string;
begin
  try
    ShowWaitMsg(GetTextLocale(['권종 정보를 조회 중입니다...' + _CRLF + '잠시만 기다려 주십시오.',
                               'Retrieving ticket information...' + _CRLF + 'Please hold.',
                               '券種情報を照会しています...' + _CRLF + 'しばらくお待ちください。',
                               '正在搜索门票种类信息...' + _CRLF + '请稍后。']));
    try
      ClearDenominList;
      if (ACategoryId = 0) then
      begin
        if not DM.GetDenominList(Global.RoundList[ARoundIndex].ScheduleId, LResMsg) then
          raise Exception.Create(LResMsg);
        ClearDenominCategoryList(False);
        if not MakeDenominCategoryList(LResMsg) then
          raise Exception.Create(LResMsg);
      end;
      FSelectedScheduleId := Global.RoundList[ARoundIndex].ScheduleId;
      Self.sbxDenominList.HorzScrollBar.Range := 0;
      DenominPages := 0;
      CurrentDenominPage := 0;
      lblProductDate.Caption := FProductDate + ' ' + Global.RoundList[ARoundIndex].ScheduleTime;
      Global.ReceiptInfo.ScheduleId := Global.RoundList[ARoundIndex].ScheduleId;
      Global.ReceiptInfo.ProductRound := Global.RoundList[ARoundIndex].ProductRound;

      with DM.MTDenomin do
      begin
        LIndex := 0;
        LColumn := 0;
        LColumns := 0;
        LPages := 0;
        LTop := 0;
        First;
        while not Eof do
        begin
          LCategoryId := FieldByName('site_denomination_category_id').AsInteger;
          if (ACategoryId > 0) and
             (ACategoryId <> LCategoryId) then
          begin
            Next;
            Continue;
          end;

          if (LColumn = 3) then
          begin
            LColumn := 0;
            LTop := IfThen(LTop = 0, 260, 0);
            if (LTop = 0) then
              Inc(LPages);
          end;
          LLeft := (329 * LColumn) + (968 * LPages); //((BasePanel.Width(310) + BasePanel.Right.Space(19)) * LColumn) + (sbxPaymentList.Width(968) * LPage)

          DI := TDenominItem.Create(Self.Handle);
          DI.ItemIndex := LIndex;
          DI.RoundIndex := ARoundIndex;
          DI.DenominId := FieldByName('product_denomination_id').AsInteger;
          DI.DenominName := FieldByName('product_denomination_name').AsString;
          DI.DenominNameEN := FieldByName('product_denomination_name_eng').AsString;
          if DI.DenominNameEN.IsEmpty then
            DI.DenominNameEN := DI.DenominName;
          DI.ProductGradeId := FieldByName('product_grade_id').AsInteger;
          DI.ProductGradeName := FieldByName('product_grade_name').AsString;
          DI.SalePrice := FieldByName('sale_price').AsInteger;
          //DI.GradeOrderOfPriority := FieldByName('grade_order_of_priority').AsInteger;
          DI.PerMaxCount := FieldByName('per_max_count').AsInteger;
          DI.PerMinCount := FieldByName('per_min_count').AsInteger;
          DI.ProductSaleCount := FieldByName('product_sale_count').AsInteger;
          DI.ScheduleSaleCount := FieldByName('schedule_sale_count').AsInteger;
          DI.PerPersonMaxCount := FieldByName('per_person_max_count').AsInteger;
          DI.RoundMaxCount := FieldByName('round_max_count').AsInteger;
          DI.DenominCategoryId := LCategoryId;
          DI.DenominCategoryName := FieldByName('site_denomination_category_name').AsString;
          DI.BuyDoubleCount := FieldByName('buy_double_count').AsInteger;
          DI.DenominLimitCount := FieldByName('denomination_limit_count').AsInteger;
          DI.ScheduleRemainCount := FieldByName('schedule_remain_count').AsInteger;
          DI.DenominDescription := FieldByName('denomination_description').AsString;
          DI.DenominDescriptionEN := FieldByName('denomination_description_eng').AsString;
          DI.LimitCardKcpPaymentYN := FieldByName('limit_card_kcp_payment_yn').AsBoolean;
          DI.LimitCardBinCodeList.Text := FieldByName('limit_card_bin_code_list').AsString;
          DI.BasePanel.Parent := Self.sbxDenominList;
          DI.BasePanel.Top := LTop;
          DI.BasePanel.Left := LLeft;
          DI.UpdateLocale;
          Global.DenominList.Add(DI);

          Inc(LIndex);
          Inc(LColumn);
          if (LTop = 0) then
            Inc(LColumns);
          Next;
        end;

        for var I: ShortInt := 0 to Pred(Global.DenominList.Count) do
          with Global.DenominList[I] do
          begin
            SoldOut := (DenominLimitCount = 0) or (ScheduleRemainCount = 0);
            if not SoldOut then
              Available := (PerMinCount <= 10) and (PerMinCount <= ScheduleRemainCount) and (BuyDoubleCount <= 10);
          end;

        if (RecordCount > 0) then
        begin
          Self.sbxDenominList.HorzScrollBar.Range := (329 * LColumns) - 19; //BasePanel.Width(310) + BasePanel.Right.Space(19)
          DenominPages := (sbxDenominList.ControlCount div 6);
          if (sbxDenominList.ControlCount mod 6 > 0) then
            DenominPages := DenominPages + 1;
          if (DenominPages > 0) then
            CurrentDenominPage := 0;
        end;
        btnDenominListLeftArrow.Enabled := False;
        btnDenominListRightArrow.Enabled := (DenominPages > 1);
      end;

      Global.KioskMode := KSM_BUY_DENOMIN; //티켓 구매(권종 선택)
    finally
      PushWaitMsg;
    end;
  except
    on E: Exception do
      ShowMsgBoxError(E.Message, GetTextLocale(['매표소를 이용해 주시기 바랍니다.',
                                                'Please visit the ticket office.',
                                                'チケット売り場をご利用ください。',
                                                '请前往购票处。']),
        [GetTextLocale(['확인', 'Confirm', '確認', '确认'])], 5);
  end;
end;

procedure TPluginForm.AddOrderItem(const ADenominIndex, AItemQty: Integer);
var
  OI: TOrderItem;
begin
  if (ADenominIndex < 0) or
     (AItemQty < 1) then
    Exit;

  for var I: ShortInt := 0 to Pred(Global.OrderList.Count) do
    if (Global.OrderList[I].DenominId = Global.DenominList[ADenominIndex].DenominId) then
    begin
      Global.OrderList[I].ItemQty := Global.OrderList[I].ItemQty + AItemQty;
      Exit;
    end;

  OI := TOrderItem.Create(Self.Handle);
  OI.RoundIndex := Global.DenominList[ADenominIndex].RoundIndex;
  OI.DenominIndex := ADenominIndex;
  OI.DenominId := Global.DenominList[ADenominIndex].DenominId;
  OI.ItemTitle := GetTextLocale([Global.DenominList[ADenominIndex].DenominName, Global.DenominList[ADenominIndex].DenominNameEN]);
  OI.ItemPrice := Global.DenominList[ADenominIndex].SalePrice;
  OI.ItemQty := AItemQty;
  OI.BuyDoubleCount := Global.DenominList[ADenominIndex].BuyDoubleCount;
  OI.OrderItemBasePanel.Parent := sbxOrderList;
  OI.PaymentItemBasePanel.Parent := sbxPaymentList;
  Global.OrderList.Add(OI);

  SendMessage(Self.Handle, CWM_REFRESH_TOTAL, 0, 0);
end;

procedure TPluginForm.RemoveOrderItem(const ADenominId: Integer);
begin
  for var I: ShortInt := Pred(Global.OrderList.Count) downto 0 do
    if (Global.OrderList[I].DenominId = ADenominId) then
    begin
      Global.OrderList.Delete(I);
      Break;
    end;

  SendMessage(Self.Handle, CWM_REFRESH_TOTAL, 0, 0);
end;

procedure TPluginForm.ClearProductList;
begin
  for var I: ShortInt := Pred(Global.ProductList.Count) downto 0 do
    Global.ProductList.Delete(I);
end;

procedure TPluginForm.ClearRoundList;
begin
  for var I: ShortInt := Pred(Global.RoundList.Count) downto 0 do
    Global.RoundList.Delete(I);
end;

procedure TPluginForm.ClearDenominCategoryList(const ADeleteAll: Boolean);
var
  LDownTo: ShortInt;
begin
  LDownTo := IfThen(ADeleteAll, 0, 1);
  for var I: ShortInt := Pred(Global.DenominCategoryList.Count) downto LDownTo do
    Global.DenominCategoryList.Delete(I);
end;

procedure TPluginForm.ClearDenominList;
begin
  for var I: ShortInt := Pred(Global.DenominList.Count) downto 0 do
    Global.DenominList.Delete(I);
end;

procedure TPluginForm.ClearOrderList;
begin
  for var I: ShortInt := Pred(Global.OrderList.Count) downto 0 do
    Global.OrderList.Delete(I);

  SendMessage(Self.Handle, CWM_REFRESH_TOTAL, 0, 0);
end;

procedure TPluginForm.RefreshOrderTotal;
var
  LSumQty, LSumPrice: Integer;
begin
  LSumQty := 0;
  LSumPrice := 0;

  for var I: ShortInt := 0 to Pred(Global.OrderList.Count) do
  begin
    LSumPrice := LSumPrice + (Global.OrderList[I].ItemPrice * Global.OrderList[I].ItemQty);
    LSumQty := LSumQty + Global.OrderList[I].ItemQty;
  end;

  OrderTotalQty := LSumQty;
  OrderTotalPrice := LSumPrice;

  if (Global.OrderList.Count > 0) then
    pgcOrderList.ActivePage := tabOrderList
  else
    pgcOrderList.ActivePage := tabOrderNone;
end;

procedure TPluginForm.SetProductPages(const APages: Integer);
var
  LCount: Integer;
begin
  FProductPages := APages;
  LCount := panProductListNavigator.ControlCount;
  for var I: ShortInt := Pred(LCount) downto 0 do
    if (panProductListNavigator.Components[I] is TLabel) then
      panProductListNavigator.Components[I].Free;

  for var I: ShortInt := 0 to Pred(FProductPages) do
    with TLabel.Create(panProductListNavigator) do
    begin
      AutoSize := False;
      Align := alLeft;
      Alignment := taCenter;
      Layout := tlCenter;
      Width := 30;
      Left := (I * 30) + 1;
      Caption := '●';
      Color := Global.ThemeInfo.Colors.background3;
      Font.Name := 'Noto Sans CJK KR Regular';
      Font.Size := 14;
      Font.Color := Global.ThemeInfo.Colors.type4;
      Transparent := False;
      Parent := panProductListNavigator;
    end;

  panProductListNavigator.Width := (FProductPages * 30);
  panProductListNavigator.Left := (pgcTicketBuy.Width div 2) - (panProductListNavigator.Width div 2);
end;

procedure TPluginForm.tmrPopupCloserTimer(Sender: TObject);
begin
  try
    with panLocalePopup do
      if Visible then
        Visible := False;
  finally
    TTimer(Sender).Enabled := False;
  end;
end;

procedure TPluginForm.SetProductPage(const APage: Integer);
var
  LCount: Integer;
begin
  FCurrentProductPage := APage;
  LCount := panProductListNavigator.ControlCount;
  for var I: ShortInt := 0 to Pred(LCount) do
    if (panProductListNavigator.Components[I] is TLabel) then
      if (I = FCurrentProductPage) then
        TLabel(panProductListNavigator.Components[I]).Font.Color := Global.ThemeInfo.Colors.black
      else
        TLabel(panProductListNavigator.Components[I]).Font.Color := Global.ThemeInfo.Colors.type4;
end;

procedure TPluginForm.SetCategoryPages(const APages: Integer);
begin
  FCategoryPages := APages;
end;

procedure TPluginForm.SetCategoryPage(const APage: Integer);
begin
  FCurrentCategoryPage := APage;
end;

procedure TPluginForm.SetDenominPages(const APages: Integer);
var
  LCount: Integer;
begin
  FDenominPages := APages;
  LCount := panDenominListNavigator.ControlCount;
  for var I: ShortInt := Pred(LCount) downto 0 do
    if (panDenominListNavigator.Components[I] is TLabel) then
      panDenominListNavigator.Components[I].Free;

  for var I: ShortInt := 0 to Pred(FDenominPages) do
    with TLabel.Create(panDenominListNavigator) do
    begin
      AutoSize := False;
      Align := alLeft;
      Alignment := taCenter;
      Layout := tlCenter;
      Width := 30;
      Left := (I * 30) + 1;
      Caption := '●';
      Color := Global.ThemeInfo.Colors.background3;
      Font.Name := 'Noto Sans CJK KR Regular';
      Font.Size := 14;
      Font.Color := Global.ThemeInfo.Colors.type4;
      Transparent := False;
      Parent := panDenominListNavigator;
    end;

  panDenominListNavigator.Width := (FDenominPages * 30);
  panDenominListNavigator.Left := (pgcTicketBuy.Width div 2) - (panDenominListNavigator.Width div 2);
end;

procedure TPluginForm.SetDenominPage(const APage: Integer);
var
  LCount: Integer;
begin
  FCurrentDenominPage := APage;
  LCount := panDenominListNavigator.ControlCount;
  for var I: ShortInt := 0 to Pred(LCount) do
    if (panDenominListNavigator.Components[I] is TLabel) then
      if (I = FCurrentDenominPage) then
        TLabel(panDenominListNavigator.Components[I]).Font.Color := Global.ThemeInfo.Colors.black
      else
        TLabel(panDenominListNavigator.Components[I]).Font.Color := Global.ThemeInfo.Colors.type4;
end;

procedure TPluginForm.SetOrderTotalPrice(const AOrderTotalPrice: Integer);
begin
  FOrderTotalPrice := AOrderTotalPrice;
  lblOrderTotalPriceValue.Caption := FormatFloat('#,##0', FOrderTotalPrice);
  lblOrderTotalPriceUnit.Left := panOrderListTotal.Width;
  lblPaymentTotalPriceValue.Caption := FormatFloat('#,##0', FOrderTotalPrice);
  lblPaymentTotalPriceUnit.Left := panPaymentListTotal.Width;
end;

procedure TPluginForm.SetOrderTotalQty(const AOrderTotalQty: Integer);
begin
  FOrderTotalQty := AOrderTotalQty;
  lblOrderTotalQtyValue.Caption := IntToStr(FOrderTotalQty);
  lblPaymentTotalQtyValue.Caption := IntToStr(FOrderTotalQty);
end;

function TPluginForm.CheckRoundRemainCount(const ASearchDate: string; const AProductId, AScheduleId: Integer): Boolean;
var
  LRemainCount: Integer;
  LPrimaryColor, LBlackColor, LErrMsg: string;
begin
  Result := False;
  LRemainCount := 0;
  try
    //주의) FSelectedProductDate --> yyyy.mm.dd 형식임
    if not DM.GetRoundList(AProductId, FSelectedProductDate, LErrMsg) then
      raise Exception.Create(LErrMsg);

    with DM.MTRound do
    begin
      First;
      if Locate('schedule_id', AScheduleId, []) then
      begin
        LRemainCount := FieldByName('remain_count').AsInteger;
        Result := (LRemainCount >= OrderTotalQty);
      end;

      if not Result then
      begin
        LPrimaryColor := Color2HTML(Global.ThemeInfo.Colors.primary);
        LBlackColor := Color2HTML(Global.ThemeInfo.Colors.black);
        LErrMsg := GetTextLocale([
                      Format('<FONT color="%s">선택된 총 매수를 기준으로 최대</FONT> <FONT color="%s">%d매까지</FONT> <FONT color="%s">선택 가능합니다.</FONT>', [LBlackColor, LPrimaryColor, LRemainCount, LBlackColor]),
                      Format('<FONT color="%s">Up to %d tickets</FONT> can be selected, excluding the ones you''ve already chosen.', [LPrimaryColor, LRemainCount]),
                      Format('<FONT color="%s">選択された合計枚数を基準に最大 %d 枚まで選択できます。</FONT>', [LPrimaryColor, LRemainCount]),
                      Format('<FONT color="%s">最多可选择的票总和为 %d 张</FONT>', [LPrimaryColor, LRemainCount])]);
        ShowMsgBoxInfo(GetTextLocale(['구매 가능한 최대매수를 초과하여 선택할 수 없습니다.',
                                      'Sorry. You cannot purchase more than the maximum number of tickets',
                                      '購入可能な最大枚数を超えたため、選択できません。',
                                      '票数超出可购买的上限。']),
          LErrMsg, [GetTextLocale(['확인', 'Confirm', '確認', '确认'])], 5);
      end;
    end;
  except
    on E: Exception do
      ShowMsgBoxError(GetTextLocale(['잔여석을 확인할 수 없습니다.',
                                     'Unable to check remaining seats.',
                                     '残余席を確認できません。',
                                     '无法查询剩余座位。']),
        E.Message, [GetTextLocale(['확인', 'Confirm', '確認', '确认'])], 5);
  end;
end;

procedure TPluginForm.DoPaymentCard;
var
  PM: TPluginMessage;
begin
  if not Global.StoreInfo.AllowCreditCard then
  begin
    ShowMsgBoxError(
      GetTextLocale(['신용카드 결제는 이용할 수 없습니다.',
                     'Unable to pay with credit card.',
                     'クレジットカード決済は利用できません。',
                     '不支持信用卡支付。']),
      GetTextLocale(['다른 결제수단을 선택하여 주세요.',
                     'Please select another payment method.',
                     '他の決済手段を選択してください。',
                     '请选择其他支付方式。']),
      [GetTextLocale(['확인', 'Confirm', '確認', '确认'])], 5);
    Exit;
  end;

  if FWorking then
    Exit;
  FWorking := True;
  try
    Global.PaymentProgress := True;
    if not CheckRoundRemainCount(FSelectedProductDate, FSelectedProductId, FSelectedScheduleId) then
      Exit;

    Global.ReceiptInfo.NewReceiptNo; //새 영수증번호 생성

    PM := TPluginMessage.Create(nil);
    PM.Command := CPC_INIT;
    PM.AddParams(CPP_VALUE, OrderTotalPrice);
    if (PluginManager.OpenModal('TLPaymentCard.bpl', PM) = mrOK) then
    begin
      DoPrintReceiptAndTicket;
      ClearOrderList;
      Global.KioskMode := KSM_HOME;
    end;

  finally
    if Assigned(PM) then
      FreeAndNil(PM);
    Global.PaymentProgress := False;
    FWorking := False;
  end;
end;

procedure TPluginForm.DoPaymentPAYCO(AType: string);
var
  PM: TPluginMessage;
  sMsg: String;
  nIdx: Integer;
begin

  for var I: ShortInt := 0 to Pred(Global.OrderList.Count) do
  begin
    nIdx := Global.OrderList[I].DenominIndex;

    if (Global.DenominList[nIdx].LimitCardKcpPaymentYN = False) or
       (Global.DenominList[nIdx].LimitCardBinCodeList.Count = 0) then
      Continue;

    sMsg := '';

    if AType = PMC_PAYCO then
    begin
      sMsg := GetTextLocale(['할인카드 권종은' + _CRLF + 'PAYCO로 결제할 수 없습니다.',
                             'If you are getting credit card discount,' + _CRLF + 'you are NOT able to proceed with PAYCO.',
                             '割引カードの券種は、PAYCOで決済できません。' + _CRLF + 'クレジットカードで決済してください。',
                             '使用优惠卡的门票种类不支持 PAYCO支付，' + _CRLF + '请使用银行卡支付。']);
    end
    else if AType = PMC_ALIPAY then
    begin
      sMsg := GetTextLocale(['할인카드 권종은' + _CRLF + 'Alipay로 결제할 수 없습니다.',
                             'If you are getting credit card discount,' + _CRLF + 'you are NOT able to proceed with Alipay.',
                             '割引カードの券種は、Alipayで決済できません。' + _CRLF + 'クレジットカードで決済してください。',
                             '使用优惠卡的门票种类不支持 Alipay支付，' + _CRLF + '请使用银行卡支付。']);
    end
    else if AType = PMC_WECHAT then
    begin
      sMsg := GetTextLocale(['할인카드 권종은' + _CRLF + 'Wechat Pay로 결제할 수 없습니다.',
                             'If you are getting credit card discount,' + _CRLF + 'you are NOT able to proceed with Wechat Pay.',
                             '割引カードの券種は、Wechat Pay で決済できません。' + _CRLF + 'クレジットカードで決済してください。',
                             '使用优惠卡的门票种类不支持 Wechat Pay支付，' + _CRLF + '请使用银行卡支付。']);
    end;

    ShowMsgBoxError(
      sMsg,
      GetTextLocale(['카드결제로 진행해 주세요.',
                     'Please try again with Credit Card payment.',
                     'クレジットカードで決済してください。',
                     '请使用银行卡支付。']),
      [GetTextLocale(['확인', 'Confirm', '確認', '确认'])], 5);
    Exit;
  end;

  {
  if not Global.StoreInfo.AllowPAYCO then
  begin
    ShowMsgBoxError(
      GetTextLocale(['PAYCO 결제는 이용할 수 없습니다.',
                     'PAYCO is not available.',
                     'PAYCO決済は利用できません。',
                     '不支持PAYCO支付。']),
      GetTextLocale(['다른 결제수단을 선택하여 주세요.',
                     'Please select another payment method.',
                     '他の決済手段を選択してください。',
                     '请选择其他支付方式。']),
      [GetTextLocale(['확인', 'Confirm', '確認', '确认'])], 5);
    Exit;
  end;
  }
  if FWorking then
    Exit;
  FWorking := True;
  try
    Global.PaymentProgress := True;
    if not CheckRoundRemainCount(FSelectedProductDate, FSelectedProductId, FSelectedScheduleId) then
      Exit;

    Global.ReceiptInfo.NewReceiptNo; //새 영수증번호 생성
    PM := TPluginMessage.Create(nil);
    PM.Command := CPC_INIT;
    PM.AddParams(CPP_VALUE, OrderTotalPrice);
    PM.AddParams(CPP_TYPE, AType);
    if (PluginManager.OpenModal('TLPaymentPayco.bpl', PM) = mrOK) then
    begin
      DoPrintReceiptAndTicket;
      ClearOrderList;
      Global.KioskMode := KSM_HOME;
    end;
  finally
    if Assigned(PM) then
      FreeAndNil(PM);
    Global.PaymentProgress := False;
    FWorking := False;
  end;
end;

function TPluginForm.DoPrintReceiptAndTicket: Boolean;
var
  PM: TPluginMessage;
  LReceiptPrint: Boolean;
begin
  Result := False;
  try
    { chy test - 프린터
    if (Global.TicketPrinter.Enabled and (not Global.TicketPrinter.Active)) or
       ((not Global.ReceiptPrinter.Enabled) or (not Global.ReceiptPrinter.Active)) then
       }
    if (not Global.ReceiptPrinter.Enabled) or (not Global.ReceiptPrinter.Active) then
      raise Exception.Create(GetTextLocale(['티켓/영수증 프린터 사용 불가.',
                                            'Unable to use ticket/receipt printer.',
                                            'チケット/領収書プリンターを利用できません。',
                                            '无法使用门票/收据打印机。']));

    Global.PrintingProgress := True;
    LReceiptPrint := False;
    try
      if (Global.StoreInfo.ReceiptPrintTypeCode = RPT_PRINT) then // 자동 출력
        LReceiptPrint := True
      else if (Global.StoreInfo.ReceiptPrintTypeCode = RPT_OPTION) then // 선택 출력
      begin
        PM := TPluginMessage.Create(nil);
        try
          PM.Command := CPC_INIT;
          PM.AddParams(CPP_OWNER_ID, Self.PluginID);
          LReceiptPrint := (PluginManager.OpenModal('TLPaymentComplete.bpl', PM) = mrOK);
        finally
          FreeAndNil(PM);
        end;
      end;

      ShowPrintingDialog(Global.ReceiptInfo.ReceiptNo, Global.ReceiptInfo.ReserveNo, LReceiptPrint);
      Result := True;
    finally
      ClosePrintingDialog;
      Global.PrintingProgress := False;
    end;
  except
    on E: Exception do
    begin
      ShowMsgBoxInfo(GetTextLocale(['티켓/영수증을 출력할 수 없습니다.' + _CRLF + '매표소에 문의하여 주십시오.',
                                    'Unable to print ticket/receipt.' + _CRLF + 'Please visit the ticket office.',
                                    'チケット/領収書を出力できません。' + _CRLF + 'チケット売り場にお問い合わせください。',
                                    '无法打印门票/收据。' + _CRLF + '请与售票处咨询。']),
          E.Message, [GetTextLocale(['확인', 'Confirm', '確認', '确认'])], 5);
      AddLog(Format('TicketBuy.DoPrintReceipt.Exception = %s', [E.Message]));
    end;
  end;
end;

procedure TPluginForm.DispCurrentTime;
begin
  case Global.KioskLocale of
    TKioskLocale.klKorean:
      begin
        lblCurrentDateTime.Caption := Format('%d월 %d일 (%s) %d:%s', [
            StrToInt(Global.CurrentDate.Substring(4, 2)), StrToInt(Global.CurrentDate.Substring(6, 2)),
            Global.DayOfWeekName, StrToInt(Global.CurrentTime.Substring(0, 2)), Global.CurrentTime.Substring(2, 2)]);
      end;
    TKioskLocale.klJapanese,
    TKioskLocale.klChinese:
      begin
        lblCurrentDateTime.Caption := Format('%d月 %d日 (%s) %d:%s', [
            StrToInt(Global.CurrentDate.Substring(4, 2)), StrToInt(Global.CurrentDate.Substring(6, 2)),
            Global.DayOfWeekNameCN, StrToInt(Global.CurrentTime.Substring(0, 2)), Global.CurrentTime.Substring(2, 2)]);
      end;
    else
      lblCurrentDateTime.Caption := Global.FormattedCurrentDateTimeEN;
  end;
end;

procedure TPluginForm.SetNavigator(const AScrollBoxHandle: Integer);
var
  LPage, LHandle: Integer;
begin
  try
    LHandle := AScrollBoxHandle;
    if (LHandle = FProductListHandle) then //상품 목록
      with sbxProductList do
        if (ControlCount > 0) and
           (HorzScrollBar.Range > 0) then
        begin
          LPage := Trunc((HorzScrollBar.Position / HorzScrollBar.Range) * 10) div 2;
          if (LPage < 0) then
            LPage := 0;
          //Label1.Caption := Format('Position: %d, Range: %d, Page: %d', [HorzScrollBar.Position, HorzScrollBar.Range, nPage]);
          CurrentProductPage := LPage;
          btnProductListLeftArrow.Enabled := (CurrentProductPage > 0);
          btnProductListRightArrow.Enabled := (CurrentProductPage < Pred(ProductPages));
        end;

    if (LHandle = FCategoryListHandle) then //권종 카테고리
      with sbxCategoryList do
        if (ControlCount > 0) and
           (HorzScrollBar.Range > 0) then
        begin
          LPage := Trunc((HorzScrollBar.Position / HorzScrollBar.Range) * 10) div 4;
          if (LPage < 0) then
            LPage := 0;
          CurrentCategoryPage := LPage;
//          btnCategoryListLeftArrow.Enabled := (CurrentCategoryPage > 0);
//          btnCategoryListRightArrow.Enabled := (CurrentCategoryPage < Pred(CategoryPages));
        end;

    if (LHandle = FDenominListHandle) then //권종 목록
      with sbxDenominList do
        if (ControlCount > 0) and
           (HorzScrollBar.Range > 0) then
        begin
          LPage := Trunc((HorzScrollBar.Position / HorzScrollBar.Range) * 10) div 3;
          if (LPage < 0) then
            LPage := 0;
          CurrentDenominPage := LPage;
          btnDenominListLeftArrow.Enabled := (CurrentDenominPage > 0);
          btnDenominListRightArrow.Enabled := (CurrentDenominPage < Pred(DenominPages));
        end;
  except
  end;
end;

procedure TPluginForm.SetNoProductTitle(const ATitle: string);
begin
  lblNoProducts.Caption := ATitle;
  pgcTicketBuy.ActivePage := tabNoProducts;
end;

procedure TPluginForm.pgcTicketBuyChange(Sender: TObject);
begin
  with TcxPageCOntrol(Sender) do
  begin
    btnBack.Visible := (ActivePageIndex > 1) and (Global.RoundList.Count > 1);
    btnTicketHome.Left := IfThen(btnBack.Visible, 47, 92);
    panProductInfo.Visible := (ActivePageIndex > 1);
  end;
end;

procedure TPluginForm.ApplyTheme;
begin
  if FThemeUpdated then
    Exit;
  with Global.ThemeInfo do
  try
    Self.Color := Colors.background1;

    { 상단 패널 }
    panTop.Color := Colors.background1;
    panTopLeft.Color := Colors.background1;
    panTopCenter.Color := Colors.background1;
    panTopRight.Color := Colors.background1;
    lblBodyHeadTicketOrder.Color := Colors.background1;
    lblBodyHeadTicketOrder.Font.Color := Colors.black;
    lblCurrentDateTime.Color := Colors.background1;
    lblCurrentDateTime.Font.Color := Colors.black;
    lblHeadSeparator.Color := Colors.line2;
    StreamToPicture(btnBack.Picture, Images.ico_back.Stream);
    StreamToPicture(btnTicketHome.Picture, Images.ico_home.Stream);
    panBodyHeadTitle.AutoSize := False;
    panBodyHeadTitle.AutoSize := True;
    panBodyHeadTitle.Top := ((panTopCenter.Height - lblCurrentDateTime.Height) div 2) - (panBodyHeadTitle.Height div 2);
    panBodyHeadTitle.Left := (panTopCenter.Width div 2) - (panBodyHeadTitle.Width div 2);

    { 언어 선택 }
    btnChangeLocale.Appearance.Font.Color := Colors.black;
    btnChangeLocale.BevelColor := Colors.black;
    btnChangeLocale.Color := Colors.background1;
    panLocalePopup.Color := Colors.background1;
    for var I: ShortInt := 0 to Pred(LCN_LOCALE_BTN_COUNT) do
    begin
      FLocaleButtons[I].Color := Colors.keypad_face_default;
      FLocaleButtons[I].Font.Color := Colors.keypad_font_default;
    end;

    //상품정보
    panProductInfo.Color := Colors.background1;
    panProductThumbnail.Color := Colors.background1;
    panProductTitle.Color := Colors.background1;
    lblProductTitle.Color := Colors.background1;
    lblProductTitle.Font.Color := Colors.black;
    lblProductDate.Color := Colors.background1;
    lblProductDate.Font.Color := Colors.type4;
    lblProductSeparator.Color := Colors.line2;
    //날짜 변경 버튼
    btnChangeProductDate.Appearance.Font.Color := Colors.black;
    btnChangeProductDate.BevelColor := Colors.black;
    btnChangeProductDate.Color := Colors.background1;

    pgcTicketBuy.Color := Colors.background1;
    { 상품 없음 페이지 }
    tabNoProducts.Color := Colors.background3;
    StreamToPicture(imgNoProducts.Picture, Images.ico_alert.Stream);
    lblNoProducts.Color := Colors.background3;
    lblNoProducts.Font.Color := Colors.black;

    { 상품 목록 페이지 }
    tabProductList.Color := Colors.background3;
    sbxProductList.Color := Colors.background3;
    //상품 목록 내비게이터
    panProductListNavigator.Color := Colors.background1;
    StreamToPicture(btnProductListLeftArrow.Picture, Images.btn_arrow_left_default.Stream);
    StreamToPicture(btnProductListLeftArrow.PictureDown, Images.btn_arrow_left_pressed.Stream);
    StreamToPicture(btnProductListLeftArrow.PictureDisabled, Images.btn_arrow_left_disabled.Stream);
    StreamToPicture(btnProductListRightArrow.Picture, Images.btn_arrow_right_default.Stream);
    StreamToPicture(btnProductListRightArrow.PictureDown, Images.btn_arrow_right_pressed.Stream);
    StreamToPicture(btnProductListRightArrow.PictureDisabled, Images.btn_arrow_right_disabled.Stream);

    { 회차 목록 페이지 }
    tabRoundList.Color := Colors.background3;
    sbxScheduleList.Color := Colors.background3;

    { 권종 선택 페이지 }
    //카테고리
    sbxCategoryList.Color := Colors.background1;
    panCategoryList.Color := Colors.background1;
//    StreamToPicture(btnCategoryListLeftArrow.Picture, Images.btn_arrow_left_default.Stream);
//    StreamToPicture(btnCategoryListLeftArrow.PictureDown, Images.btn_arrow_left_pressed.Stream);
//    StreamToPicture(btnCategoryListLeftArrow.PictureDisabled, Images.btn_arrow_left_disabled.Stream);
//    StreamToPicture(btnCategoryListRightArrow.Picture, Images.btn_arrow_right_default.Stream);
//    StreamToPicture(btnCategoryListRightArrow.PictureDown, Images.btn_arrow_right_pressed.Stream);
//    StreamToPicture(btnCategoryListRightArrow.PictureDisabled, Images.btn_arrow_right_disabled.Stream);
    lblCategorySeparator.Color := Colors.line2;

    //권종PLU
    tabDenominList.Color := Colors.background3;
    panDenominList.Color := Colors.background3;
    sbxDenominList.Color := Colors.background3;
    //권종 목록 내비게이터
    panDenominListNavigator.Color := Colors.background3;
    StreamToPicture(btnDenominListLeftArrow.Picture, Images.btn_arrow_left_default.Stream);
    StreamToPicture(btnDenominListLeftArrow.PictureDown, Images.btn_arrow_left_pressed.Stream);
    StreamToPicture(btnDenominListLeftArrow.PictureDisabled, Images.btn_arrow_left_disabled.Stream);
    StreamToPicture(btnDenominListRightArrow.Picture, Images.btn_arrow_right_default.Stream);
    StreamToPicture(btnDenominListRightArrow.PictureDown, Images.btn_arrow_right_pressed.Stream);
    StreamToPicture(btnDenominListRightArrow.PictureDisabled, Images.btn_arrow_right_disabled.Stream);

    //티켓 주문 목록
    pgcOrderList.Color := Colors.background1;
    tabOrderNone.Color := Colors.background1;
    tabOrderList.Color := Colors.background1;
    sbxOrderList.Color := Colors.background1;
    StreamToPicture(imgBuyingNone.Picture, Images.ico_ticket.Stream);

    (* 테마 적용 불필요
    //티켓매수
    panOrderSummary.Color := Colors.background2;
    panOrderTotal.Color := Colors.background2;
    lblOrderTotalQtyTitle.Font.Color := Colors.black;
    lblOrderTotalQtyValue.Font.Color := Colors.primary;
    lblOrderTotalQtyUnit.Font.Color := Colors.black;
    //결제금액
    lblOrderTotalPriceTitle.Font.Color := Colors.black;
    lblOrderTotalPriceValue.Font.Color := Colors.primary;
    lblOrderTotalPriceUnit.Font.Color := Colors.black;
    *)

    { 티켓 선택 }
    //전체선택취소
    btnOrderClear.Colors.Normal := Colors.grpbtn_face_default;
    btnOrderClear.Colors.NormalText := Colors.grpbtn_font_default;
    btnOrderClear.Colors.Pressed := Colors.grpbtn_face_pressed;
    btnOrderClear.Colors.PressedText := Colors.grpbtn_font_pressed;
    btnOrderClear.Colors.Disabled := Colors.grpbtn_face_disabled;
    btnOrderClear.Colors.DisabledText := Colors.grpbtn_font_disabled;
    //결제하기
    btnDoPayment.Colors.Normal := Colors.grpbtn_face_active_default;
    btnDoPayment.Colors.NormalText := Colors.grpbtn_font_active_default;
    btnDoPayment.Colors.Pressed := Colors.grpbtn_face_active_pressed;
    btnDoPayment.Colors.PressedText := Colors.grpbtn_font_active_pressed;
    btnDoPayment.Colors.Disabled := Colors.grpbtn_face_active_disabled;
    btnDoPayment.Colors.DisabledText := Colors.grpbtn_font_active_disabled;

    { 티켓 주문 }
    //상단 헤더
    lblPaymentTitle.Font.Color := Colors.black; //티켓정보
    PaymentListSeparator1.Color := Colors.black;
    lblPaymentDenominTitle.Font.Color := Colors.type4; //권종
    lblPaymentDenominQty.Font.Color := Colors.type4; //매수
    lblPaymentDenominAmt.Font.Color := Colors.type4; //금액
    PaymentListSeparator2.Color := Colors.line2;
    //신용카드 결제
    {
    btnDoCreditCard.Colors.Normal := Colors.grpbtn_face_default;
    btnDoCreditCard.Colors.NormalText := Colors.grpbtn_font_default;
    btnDoCreditCard.Colors.Pressed := Colors.grpbtn_face_pressed;
    btnDoCreditCard.Colors.PressedText := Colors.grpbtn_font_pressed;
    btnDoCreditCard.Colors.Disabled := Colors.grpbtn_face_disabled;
    btnDoCreditCard.Colors.DisabledText := Colors.grpbtn_font_disabled;
    }
    btnDoCreditCard.Colors.Normal := Colors.grpbtn_face_active_default;
    btnDoCreditCard.Colors.NormalText := Colors.grpbtn_font_active_default;
    btnDoCreditCard.Colors.Pressed := Colors.grpbtn_face_active_pressed;
    btnDoCreditCard.Colors.PressedText := Colors.grpbtn_font_active_pressed;
    btnDoCreditCard.Colors.Disabled := Colors.grpbtn_face_active_disabled;
    btnDoCreditCard.Colors.DisabledText := Colors.grpbtn_font_active_disabled;

    //PAYCO 간편결제
    btnDoPAYCO.Colors.Normal := Colors.grpbtn_face_active_default;
    btnDoPAYCO.Colors.NormalText := Colors.grpbtn_font_active_default;
    btnDoPAYCO.Colors.Pressed := Colors.grpbtn_face_active_pressed;
    btnDoPAYCO.Colors.PressedText := Colors.grpbtn_font_active_pressed;
    btnDoPAYCO.Colors.Disabled := Colors.grpbtn_face_active_disabled;
    btnDoPAYCO.Colors.DisabledText := Colors.grpbtn_font_active_disabled;

    { 티켓 주문 목록 }
    tabPaymentList.Color := Colors.background1;
    sbxPaymentList.Color := Colors.background1;
  finally
    FThemeUpdated := True;
  end;
end;

procedure TPluginForm.ApplyLocale;
begin
  try
    panBodyHeadTitle.AutoSize := False;
    UpdateLocalePopup;
    case Global.KioskLocale of
      TKioskLocale.klKorean:
        begin
          lblBodyHeadTicketOrder.Caption := '티켓 구매';
          lblProductTitle.Caption := FProductName;
          lblNoProducts.Caption := '구매 가능한 상품이 없습니다.';
          btnChangeProductDate.Caption := '날짜 변경';

          lblBuyingNone.Caption := '티켓을 선택해 주세요.';
          lblOrderTotalQtyTitle.Width := 110;
          lblOrderTotalQtyTitle.Caption := '티켓매수';
          lblOrderTotalQtyUnit.Caption := '매';
          lblOrderTotalPriceTitle.Caption := '결제금액';
          lblOrderTotalPriceUnit.Caption := '원';
          btnOrderClear.Caption := '전체 선택 취소';
          btnDoPayment.Caption := '결제하기';

          if (Global.DenominCategoryList.Count > 0) then
            Global.DenominCategoryList[0].BasePanel.Caption := '전체';

          lblPaymentTitle.Caption := '티켓 정보';
          lblPaymentDenominTitle.Caption := '권종';
          lblPaymentDenominQty.Caption := '매수';
          lblPaymentDenominAmt.Caption := '금액';

          lblPaymentTotalQtyTitle.Width := 110;
          lblPaymentTotalQtyTitle.Caption := '티켓매수';
          lblPaymentTotalQtyUnit.Caption := '매';
          lblPaymentTotalPriceTitle.Caption := '결제금액';
          lblPaymentTotalPriceUnit.Caption := '원';
          //lblPayMethod.Caption := '결제방법' + _CRLF + '선택';
          //btnDoCreditCard.Caption := '신용카드 결제';
          btnDoCreditCard.Caption := '카드결제';
          btnDoPAYCO.Caption := 'PAYCO 결제';
        end;
      TKioskLocale.klEnglish:
        begin
          lblBodyHeadTicketOrder.Caption := 'PURCHASE';
          lblProductTitle.Caption := FProductNameEN;
          lblNoProducts.Caption := 'Sorry, There are no event available for purchase at the moment.';
          btnChangeProductDate.Caption := 'Change date';

          lblBuyingNone.Caption := 'Please choose a ticket.';
          lblOrderTotalQtyTitle.Width := 60;          //qa_v0.3_20240216 - 9 page
          lblOrderTotalQtyTitle.Caption := 'QTY';
          lblOrderTotalQtyUnit.Caption := '';
          lblOrderTotalPriceTitle.Caption := 'Total amount';
          lblOrderTotalPriceUnit.Caption := 'KRW';
          btnOrderClear.Caption := 'Delete';          // qa_v0.3_20240216 - 9 page
          btnDoPayment.Caption := 'Check-out';

          if (Global.DenominCategoryList.Count > 0) then
            Global.DenominCategoryList[0].BasePanel.Caption := 'All';

          lblPaymentTitle.Caption := 'Order';
          lblPaymentDenominTitle.Caption := 'Ticket';
          lblPaymentDenominQty.Caption := 'QTY';
          lblPaymentDenominAmt.Caption := 'Price';

          lblPaymentTotalQtyTitle.Width := 60;
          lblPaymentTotalQtyTitle.Caption := 'QTY';
          lblPaymentTotalQtyUnit.Caption := '';
          lblPaymentTotalPriceTitle.Caption := 'Total amount';
          lblPaymentTotalPriceUnit.Caption := 'KRW';
          //lblPayMethod.Caption := 'Payment';
          btnDoCreditCard.Caption := 'Credit card';
          btnDoPAYCO.Caption := 'PAYCO';
        end;
      TKioskLocale.klJapanese:
        begin
          lblBodyHeadTicketOrder.Caption := 'チケット購入';
          lblProductTitle.Caption := FProductNameEN;
          lblNoProducts.Caption := '購入可能な商品がありません。';
          btnChangeProductDate.Caption := '日付変更';

          lblBuyingNone.Caption := '券種を選択してください。';
          lblOrderTotalQtyTitle.Width := 180;
          lblOrderTotalQtyTitle.Caption := 'チケット枚数';
          lblOrderTotalQtyUnit.Caption := '';
          lblOrderTotalPriceTitle.Caption := '決済金額';
          lblOrderTotalPriceUnit.Caption := 'KRW';
          btnOrderClear.Caption := '全体選択解除';
          btnDoPayment.Caption := '決済';

          if (Global.DenominCategoryList.Count > 0) then
            Global.DenominCategoryList[0].BasePanel.Caption := 'All';

          lblPaymentTitle.Caption := '選択情報';
          lblPaymentDenominTitle.Caption := '券種名';
          lblPaymentDenominQty.Caption := '枚数';
          lblPaymentDenominAmt.Caption := '価格';

          lblPaymentTotalQtyTitle.Width := 180;
          lblPaymentTotalQtyTitle.Caption := 'チケット枚数';
          lblPaymentTotalQtyUnit.Caption := '';
          lblPaymentTotalPriceTitle.Caption := '決済金額';
          lblPaymentTotalPriceUnit.Caption := 'KRW';
          //lblPayMethod.Caption := '決済手段';
          btnDoCreditCard.Caption := 'クレジットカード';
          btnDoPAYCO.Caption := 'PAYCO';
        end;
      TKioskLocale.klChinese:
        begin
          lblBodyHeadTicketOrder.Caption := '购票';
          lblProductTitle.Caption := FProductNameEN;
          lblNoProducts.Caption := '无可购买门票。';
          btnChangeProductDate.Caption := '更改日期';

          lblBuyingNone.Caption := '请选门票种类。';
          lblOrderTotalQtyTitle.Width := 65;
          lblOrderTotalQtyTitle.Caption := '票数';
          lblOrderTotalQtyUnit.Caption := '';
          lblOrderTotalPriceTitle.Caption := '支付金额';
          lblOrderTotalPriceUnit.Caption := 'KRW';
          btnOrderClear.Caption := '全部取消';
          btnDoPayment.Caption := '支付';

          if (Global.DenominCategoryList.Count > 0) then
            Global.DenominCategoryList[0].BasePanel.Caption := 'All';

          lblPaymentTitle.Caption := '选择信息';
          lblPaymentDenominTitle.Caption := '门票种类名';
          lblPaymentDenominQty.Caption := '张';
          lblPaymentDenominAmt.Caption := '价格';

          lblPaymentTotalQtyTitle.Width := 65;
          lblPaymentTotalQtyTitle.Caption := '票数';
          lblPaymentTotalQtyUnit.Caption := '';
          lblPaymentTotalPriceTitle.Caption := '支付金额';
          lblPaymentTotalPriceUnit.Caption := 'KRW';
          //lblPayMethod.Caption := '支付方式';
          btnDoCreditCard.Caption := '信用卡';
          btnDoPAYCO.Caption := 'PAYCO';
        end;
    end;

    //파트너사 로고 이미지는 Setting API를 통해 별도 다운로드
    with Global.ThemeInfo do
    if (Global.ThemeInfo.Images.ico_partner.Stream.Size > 0) then
      StreamToPicture(imgLogo.Picture, Images.ico_partner.Stream)
    else
    begin
      if (Global.KioskLocale = TKioskLocale.klKorean) then
        StreamToPicture(imgLogo.Picture, Images.ico_ticketlink.Stream)
      else
        StreamToPicture(imgLogo.Picture, Images.ico_ticketlink_en.Stream);
    end;

    imgLogo.Left := 0;
    for var I: ShortInt := 0 to Pred(Global.ProductList.Count) do
      Global.ProductList[I].UpdateLocale;
    for var I: ShortInt := 0 to Pred(Global.RoundList.Count) do
      Global.RoundList[I].UpdateLocale;
    for var I: ShortInt := 1 to Pred(Global.DenominCategoryList.Count) do
      Global.DenominCategoryList[I].UpdateLocale;
    for var I: ShortInt := 0 to Pred(Global.DenominList.Count) do
      Global.DenominList[I].UpdateLocale;
    for var I: ShortInt := 0 to Pred(Global.OrderList.Count) do
      Global.OrderList[I].UpdateLocale;
    lblProductDate.Caption := GetTextLocale([FProductDate, FProductDateEN]);
  finally
    panBodyHeadTitle.AutoSize := True;
    panBodyHeadTitle.Left := (panTopCenter.Width div 2) - (panBodyHeadTitle.Width div 2);
    DispCurrentTime;
  end;
end;

procedure TPluginForm.UpdateLocalePopup;
var
  LArrow, LSpace: string;
begin
  LArrow := '  ▼';
  LSpace := StringOfChar(' ', 6);
  case Global.KioskLocale of
    TKioskLocale.klEnglish:
      begin
        btnChangeLocale.Caption := 'ENG' + LArrow;
        FLocaleButtons[0].Caption := LSpace + 'KOR';
        FLocaleButtons[0].Tag := 0;
        FLocaleButtons[1].Caption := LSpace + 'JPN';
        FLocaleButtons[1].Tag := 2;
        FLocaleButtons[2].Caption := LSpace + 'CHN';
        FLocaleButtons[2].Tag := 3;
      end;
    TKioskLocale.klJapanese:
      begin
        btnChangeLocale.Caption := 'JPN' + LArrow;
        FLocaleButtons[0].Caption := LSpace + 'KOR';
        FLocaleButtons[0].Tag := 0;
        FLocaleButtons[1].Caption := LSpace + 'ENG';
        FLocaleButtons[1].Tag := 1;
        FLocaleButtons[2].Caption := LSpace + 'CHN';
        FLocaleButtons[2].Tag := 3;
      end;
    TKioskLocale.klChinese:
      begin
        btnChangeLocale.Caption := 'CHN' + LArrow;
        FLocaleButtons[0].Caption := LSpace + 'KOR';
        FLocaleButtons[0].Tag := 0;
        FLocaleButtons[1].Caption := LSpace + 'ENG';
        FLocaleButtons[1].Tag := 1;
        FLocaleButtons[2].Caption := LSpace + 'JPN';
        FLocaleButtons[2].Tag := 2;
      end
    else
      btnChangeLocale.Caption := 'KOR' + LArrow;
      FLocaleButtons[0].Caption := LSpace + 'ENG';
      FLocaleButtons[0].Tag := 1;
      FLocaleButtons[1].Caption := LSpace + 'JPN';
      FLocaleButtons[1].Tag := 2;
      FLocaleButtons[2].Caption := LSpace + 'CHN';
      FLocaleButtons[2].Tag := 3;
  end;
end;

{ TMyScrollBox }

procedure TMyScrollBox.DoUpdateScrollBars;
var
  AScrollBox: TcxScrollBox;
begin
  inherited;

  AScrollBox := TcxScrollBox(Self.Tag);
  if (AScrollBox <> nil) then
  try
    AScrollBox.AutoScroll := Self.AutoScroll;
    AScrollBox.HorzScrollBar.Position := Self.HorzScrollBar.Position;
    AScrollBox.HorzScrollBar.Range := Self.HorzScrollBar.Range;
    AScrollBox.VertScrollBar.Position := Self.VertScrollBar.Position;
    AScrollBox.VertScrollBar.Range := Self.VertScrollBar.Range;
    SendMessage(FOwnerHandle, CWM_SCROLLBOX_NAVIGATOR, Self.Tag, 0);
  except
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
