unit Common.TLGlobal;

interface

uses
  { Native }
  System.Classes, System.SysUtils, Vcl.Controls, Vcl.StdCtrls, WinApi.Windows, System.IniFiles,
  Vcl.Graphics, Vcl.ExtCtrls, Vcl.Forms, System.Win.Registry, System.JSON,
  System.Generics.Collections,
  { Plugin System }
  uPluginManager, uPluginModule, uPluginMessages,
  { TMS }
  GDIPicture, GDIPFill, AdvGDIP, AdvSmoothPanel, AdvShapeButton,
  { DevExpress }
  dxGDIPlusClasses, cxGraphics, cxLabel, cxButtons, cxEdit, cxLookAndFeels, cxLookAndFeelPainters,
  { WinSoft }
  ComPort,
  { Chilkat DLL API }
  Chilkat.Global, Chilkat.JsonObject, Chilkat.JsonArray, Chilkat.CkDateTime,
  { VAN Module }
  uVanDaemonModule,
  //uVanKcpModul,
  uPaycoNewModule,
  { Project }
  Common.TLReceiptPrintManager, Common.TLTicketPrintManager, Common.TLCipher, Common.SevenZip;

{$I common.TLGlobal.inc}

type
  { 표시 언어 설정 정보 }
  TKioskLocale = (klKorean, klEnglish, klJapanese, klChinese);

  { 예매 정보 }
  TReserveItem = class(TObject)
  private
    FOwnerHandle: HWND;
    FItemIndex: Integer;
    FProductId: Integer;
    FScheduleId: Integer;
    FProductName: string;
    FProductNameEN: string;
    FPlaceName: string;
    FPlaceNameEN: string;
    FProductDateTime: string;
    FReserveNo: Int64;
    FReserveCount: Integer;
    FExternalReserveNo: string;
    FExternalServiceType: string;
    FExternalServiceTypeName: string;
    FIsDenominationDescriptionExposure: Boolean;
    //FDenominationDescriptionList: TStringList;
    FProductDenominationId: Integer;
    FDenominationDescription: string;
    FDenominationDescriptionEng: string;
    FProductClassType: string;
    FReserveUserName: string;
    FSeatAttributeInfo: string;
    FIsQualificationNeeded: Boolean;
    FWorking: Boolean;

    procedure OnPrintButtonClick(Sender: TObject);

    procedure SetProductDateTime(const AProductDateTime: string);
    procedure SetReserveNo(const AReserveNo: Int64);
    procedure SetExternalReserveNo(const AExternalReserveNo: string);
    procedure SetReserveCount(const AReserveCount: Integer);
    procedure SetExternalServiceTypeName(const AExternalServiceTypeName: string);
  public
    BasePanel: TAdvSmoothPanel;
    ProductNameContainer: TPanel;
    ProductNameLabel: TLabel;
    ReserveTimeLabel: TLabel;
    ProductImageContainer: TPanel;
    ProductImage: TImage;
    ReserveNoCaptionLabel: TLabel;
    ReserveNoLabel: TLabel;
    ReserveQtyCaptionLabel: TLabel;
    ReserveQtyLabel: TLabel;
    ReserveSiteCaptionLabel: TLabel;
    ReserveSiteLabel: TLabel;
    PrintButton: TcxButton;
    TicketNoList: TStringList;

    constructor Create(const AOwnerHandle: HWND);
    destructor Destroy; override;

    procedure UpdateLocale;

    property ItemIndex: Integer read FItemIndex write FItemIndex;
    property ProductId: Integer read FProductId write FProductId;
    property ScheduleId: Integer read FScheduleId write FScheduleId;
    property ProductName: string read FProductName write FProductName;
    property ProductNameEN: string read FProductNameEN write FProductNameEN;
    property PlaceName: string read FPlaceName write FPlaceName;
    property PlaceNameEN: string read FPlaceNameEN write FPlaceNameEN;
    property ProductDateTime: string read FProductDateTime write SetProductDateTime;
    property ReserveNo: Int64 read FReserveNo write SetReserveNo;
    property ExternalReserveNo: string read FExternalReserveNo write SetExternalReserveNo;
    property ReserveCount: Integer read FReserveCount write SetReserveCount;
    property SeatAttributeInfo: string read FSeatAttributeInfo write FSeatAttributeInfo;
    property ReserveUserName: string read FReserveUserName write FReserveUserName;
    property IsQualificationNeeded: Boolean read FIsQualificationNeeded write FIsQualificationNeeded;
    property ProductClassType: string read FProductClassType write FProductClassType;
    property ExternalServiceType: string read FExternalServiceType write FExternalServiceType;
    property ExternalServiceTypeName: string read FExternalServiceTypeName write SetExternalServiceTypeName;
    property IsDenominationDescriptionExposure: Boolean read FIsDenominationDescriptionExposure write FIsDenominationDescriptionExposure;
    //property DenominationDescriptionList: TStringList read FDenominationDescriptionList write FDenominationDescriptionList;
    property ProductDenominationId: Integer read FProductDenominationId write FProductDenominationId;
    property DenominationDescription: string read FDenominationDescription write FDenominationDescription;
    property DenominationDescriptionEng: string read FDenominationDescriptionEng write FDenominationDescriptionEng;
  end;

  { 상품 정보 }
  TProductItem = class(TObject)
  private
    FOwnerHandle: HWND;
    FItemIndex: Integer;
    FProductId: Integer;
    FProductName: string;
    FProductNameEN: string;
    FSoldOut: Boolean;
    FStartDate: string;
    FEndDate: string;
    FDispProdDate: string;
    FWorking: Boolean;

  public
    BasePanel: TAdvSmoothPanel; // 컨테이너
    ProductNameLabel: TLabel; // 상품명 라벨
    ProductImageContainer: TPanel; // 상품이미지 컨테이너
    ProductImage: TImage; // 상품이미지

    constructor Create(const AOwnerHandle: HWND);
    destructor Destroy; override;

    procedure UpdateLocale;
    procedure OnProductItemClick(Sender: TObject);

    property ItemIndex: Integer read FItemIndex write FItemIndex;
    property ProductId: Integer read FProductId write FProductId;
    property ProductName: string read FProductName write FProductName;
    property ProductNameEN: string read FProductNameEN write FProductNameEN;
    property SoldOut: Boolean read FSoldOut write FSoldOut;
    property StartDate: string read FStartDate write FStartDate;
    property EndDate: string read FEndDate write FEndDate;
    property DispProdDate: string read FDispProdDate write FDispProdDate;
  end;

  { 회차 정보 }
  TRoundItem = class(TObject)
  private
    FOwnerHandle: HWND;
    FItemIndex: Integer;
    FProductId: Integer;
    FScheduleId: Integer;
    FScheduleTime: string;
    FProductRound: Integer;
    FCategoryIndex: ShortInt;
    FSoldOut: Boolean;
    FRemainCount: Integer;
    FShowRemainCount: Boolean;
    FWorking: Boolean;

    procedure OnRoundItemClick(Sender: TObject);
    procedure OnRoundItemMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure OnRoundItemMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    procedure SetScheduleTime(const AScheduleTime: string);
    procedure SetRemainCount(const ARemainCount: Integer);
    procedure SetSoldOut(const ASoldOut: Boolean);
    procedure SetShowRemainCount(const AShowRemainCount: Boolean);
  public
    BasePanel: TAdvSmoothPanel; // 컨테이너
    ScheduleTimeLabel: TLabel; // 회차명 라벨
    RemainCountLabel: TLabel; // 잔여석

    constructor Create(const AOwnerHandle: HWND);
    destructor Destroy; override;

    procedure UpdateLocale;
    procedure SelectRound(const AItemIndex, AScheduleId: Integer);

    property ItemIndex: Integer read FItemIndex write FItemIndex;
    property ProductId: Integer read FProductId write FProductId;
    property ScheduleId: Integer read FScheduleId write FScheduleId;
    property ScheduleTime: string read FScheduleTime write SetScheduleTime;
    property ProductRound: Integer read FProductRound write FProductRound;
    property CategoryIndex: ShortInt read FCategoryIndex write FCategoryIndex default 0;
    property SoldOut: Boolean read FSoldOut write SetSoldOut;
    property RemainCount: Integer read FRemainCount write SetRemainCount;
    property ShowRemainCount: Boolean read FShowRemainCount write SetShowRemainCount;
  end;

  { 권종 카테고리 정보 }
  TDenominCategoryItem = class(TObject)
  private
    FOwnerHandle: HWND;
    FActive: Boolean;
    FItemIndex: Integer;
    FRoundIndex: Integer;
    FCategoryId: Integer;
    FCategoryName: string;
    FCategoryNameEN: string;
    FWorking: Boolean;

    procedure OnDenominCategoryItemClick(Sender: TObject);

    procedure SetCategoryId(const AValue: Integer);
  public
    BasePanel: TPanel; // 컨테이너
    Indicator: TLabel; // 인디케이터

    constructor Create(const AOwnerHandle: HWND);
    destructor Destroy; override;

    procedure UpdateLocale;

    property ItemIndex: Integer read FItemIndex write FItemIndex;
    property RoundIndex: Integer read FRoundIndex write FRoundIndex;
    property CategoryId: Integer read FCategoryId write SetCategoryId;
    property CategoryName: string read FCategoryName write FCategoryName;
    property CategoryNameEN: string read FCategoryNameEN write FCategoryNameEN;
  end;

  { 권종 정보 }
  TDenominItem = class(TObject)
  private
    FOwnerHandle: HWND;
    FRoundIndex: Integer;
    FItemIndex: Integer;
    FDenominId: Integer;
    FDenominCategoryId: Integer;
    FDenominCategoryName: string;
    FDenominName: string;
    FDenominNameEN: string;
    FProductGradeId: Integer;
    FProductGradeName: string;
    FSalePrice: Integer;
    FPerMaxCount: Integer;
    FPerMinCount: Integer;
    FProductSaleCount: Integer;
    FScheduleSaleCount: Integer;
    FPerPersonMaxCount: Integer;
    FRoundMaxCount: Integer;
    FBuyDoubleCount: Integer;
    FDenominLimitCount: Integer;
    FScheduleRemainCount: Integer;
    FDenominDescription: string;
    FDenominDescriptionEN: string;
    FSoldOut: Boolean;
    FWorking: Boolean;
    FAvailable: Boolean;
    FLimitCardKcpPaymentYN: Boolean;
    FLimitCardBinCodeList: TStringList;

    procedure OnDenominItemClick(Sender: TObject);
    procedure OnDenominItemMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure OnDenominItemMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    procedure SetSalePrice(const ASalePrice: Integer);
    procedure SetScheduleRemainCount(const AScheduleRemainCount: Integer);
    procedure SetAvailable(const AAvailable: Boolean);
    procedure SetSoldOut(const ASoldOut: Boolean);
  public
    BasePanel: TAdvSmoothPanel; // 컨테이너
    DenominNameContainer: TPanel; // 컨테이너
    DenominNameLabel: TLabel; // 권종명 표시 라벨
    DenominNameSeparator: TLabel; // 권종명 구분선
    SalePriceLabel: TLabel; // 판매금액 표시 라벨
    SoldOutLabel: TLabel; // 매진 표시 라벨

    constructor Create(const AOwnerHandle: HWND);
    destructor Destroy; override;

    procedure UpdateLocale;

    property RoundIndex: Integer read FRoundIndex write FRoundIndex;
    property ItemIndex: Integer read FItemIndex write FItemIndex;
    property DenominId: Integer read FDenominId write FDenominId;
    property DenominName: string read FDenominName write FDenominName;
    property DenominNameEN: string read FDenominNameEN write FDenominNameEN;
    property DenominCategoryId: Integer read FDenominCategoryId write FDenominCategoryId;
    property DenominCategoryName: string read FDenominCategoryName write FDenominCategoryName;
    property ProductGradeId: Integer read FProductGradeId write FProductGradeId; // 상품등급ID
    property ProductGradeName: string read FProductGradeName write FProductGradeName; // 상품등급명
    property SalePrice: Integer read FSalePrice write SetSalePrice; // 판매금액
    property PerMaxCount: Integer read FPerMaxCount write FPerMaxCount; // 예매건당 최대매수
    property PerMinCount: Integer read FPerMinCount write FPerMinCount; // 예매건당 최소매수
    property ProductSaleCount: Integer read FProductSaleCount write FProductSaleCount; // 판매가능 매수
    property ScheduleSaleCount: Integer read FScheduleSaleCount write FScheduleSaleCount; // 회차당 판매가능 매수
    property PerPersonMaxCount: Integer read FPerPersonMaxCount write FPerPersonMaxCount; // 인당 구매제약수
    property RoundMaxCount: Integer read FRoundMaxCount write FRoundMaxCount; // 회당 구매제약수
    property BuyDoubleCount: Integer read FBuyDoubleCount write FBuyDoubleCount; // 매수배수
    property DenominLimitCount: Integer read FDenominLimitCount write FDenominLimitCount; // 권종별 판매제한 매수
    property ScheduleRemainCount: Integer read FScheduleRemainCount write SetScheduleRemainCount; // 해당회차 판매가능 매수
    property DenominDescription: string read FDenominDescription write FDenominDescription; // 권종별 공지사항
    property DenominDescriptionEN: string read FDenominDescriptionEN write FDenominDescriptionEN; // 권종별 공지사항
    property Available: Boolean read FAvailable write SetAvailable; // 권종사용가능여부
    property SoldOut: Boolean read FSoldOut write SetSoldOut; // 매진여부
    property LimitCardKcpPaymentYN: Boolean read FLimitCardKcpPaymentYN write FLimitCardKcpPaymentYN default False; //카드 제약 사용 여부
    property LimitCardBinCodeList: TStringList read FLimitCardBinCodeList write FLimitCardBinCodeList; //카드 제약 BIN코드 목록(값이 없으면 모든 카드 허용)
  end;

  { 주문 정보 }
  TOrderItem = class(TObject)
  private
    FOwnerHandle: HWND;
    FProductIndex: Integer;
    FRoundIndex: Integer;
    FDenominIndex: Integer;
    FDenominId: Integer;
    FItemTitle: string;
    FItemPrice: Integer;
    FItemQty: Integer;
    FBuyDoubleCount: Integer;

    procedure OnDecItemQtyButtonClick(Sender: TObject);
    procedure OnIncItemQtyButtonClick(Sender: TObject);
    procedure OnRemoveOrderItemButtonClick(Sender: TObject);

    procedure SetItemTitle(const AItemTitle: string);
    procedure SetItemQty(const AItemQty: Integer);
  public
    OrderItemBasePanel: TPanel; // 컨테이너
    OrderItemTitleLabel: TLabel; // 티켓명
    OrderItemDecQtyButton: TAdvShapeButton; // 수량 감소 버튼
    OrderItemIncQtyButton: TAdvShapeButton; // 수량 증가 버튼
    OrderItemQtyValueLabel: TcxLabel; // 수량 표시 라벨
    OrderItemAmtValueLabel: TLabel; // 주문금액 표시 라벨
    OrderItemAmtUnitLabel: TLabel; // 주문금액 단위 표시 라벨
    OrderItemRemoveButton: TAdvShapeButton; // 주문내역 삭제 버튼
    OrderItemLineSeparator: TLabel; // 구분선 라벨

    PaymentItemBasePanel: TPanel; // 컨테이너
    PaymentItemTitleLabel: TLabel; // 티켓명
    PaymentItemQtyValueLabel: TLabel; // 수량 표시 라벨
    PaymentItemAmtValueLabel: TLabel; // 주문금액 표시 라벨
    PaymentItemAmtUnitLabel: TLabel; // 주문금액 단위 표시 라벨
    PaymentItemLineSeparator: TLabel; // 구분선 라벨

    constructor Create(const AOwnerHandle: HWND);
    destructor Destroy; override;

    procedure UpdateLocale;

    property ProductIndex: Integer read FProductIndex write FProductIndex;
    property RoundIndex: Integer read FRoundIndex write FRoundIndex;
    property DenominIndex: Integer read FDenominIndex write FDenominIndex;
    property DenominId: Integer read FDenominId write FDenominId;
    property ItemTitle: string read FItemTitle write SetItemTitle;
    property ItemPrice: Integer read FItemPrice write FItemPrice;
    property ItemQty: Integer read FItemQty write SetItemQty;
    property BuyDoubleCount: Integer read FBuyDoubleCount write FBuyDoubleCount;
  end;

  { 기본 쓰레드 타이머 }
  TThreadTimer = class(TThread)
  private
    FInterval: Integer;
    FLastWorked: TDateTime;
    FLastIdleRun: TDateTime;
    FStartTime: TDateTime;
    FCheckidle: Boolean;
    FCheckAliveCount: Integer;

    function GetDuration: Int64;
  protected
    procedure Execute; override;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Reset;

    property Interval: Integer read FInterval write FInterval default 500;
    property LastWorked: TDateTime read FLastWorked write FLastWorked;
    property LastIdleRun: TDateTime read FLastIdleRun write FLastIdleRun;
    property StartTime: TDateTime read FStartTime write FStartTime;
    property CheckIdle: Boolean read FCheckidle write FCheckidle;
    property Duration: Int64 read GetDuration;
  end;

  { 영수증 정보 }
  TReceiptInfo = class
  private
    FReceiptNo: string; // 영수증번호
    FSellTotal: Integer; // 판매금액(부가세포함) 합계
    FVatTotal: Integer; // 부가세 합계
    FCashAmt: Integer; // 현금결제금액
    FCreditCardAmt: Integer; // 신용카드결제금액
    FPaycoCardAmt: Integer; // PAYCO신용카드결제금액
    FPaycoPointAmt: Integer; // PAYCO포인트결제금액
    FTmoneyAmt: Integer; // T머니 결제금액
    FDiscountAmt: Integer; // 할인금액
    FPaycoReady: Boolean; // PAYCO결제대기상태
    FSignImage: TMemoryStream; // 서명이미지

    FProductId: Integer; // 상품 ID
    FScheduleId: Integer; // 스케쥴 ID
    FProductRound: Integer; // 상품회차
    FTicketCount: Integer; // 총 티켓매수
    FReserveNo: Int64; // 예매번호

    function GetChargeTotal: Integer; // 청구금액 = (상품금액 - 할인금액)
    function GetPaidTotal: Integer; // 결제금액 = (현금결제금액 + 신용카드결제금액 + PAYCO결제금액 + T머니결제금액)
    function GetUnpaidTotal: Integer; // 미결제금액 = (청구금액 - 결제금액)
    function GetChangeTotal: Integer; // 거스름돈 = (받은금액 - 청구금액)
    function GetVatTotal: Integer; // 부가가치세
  public
    constructor Create;
    destructor Destroy; override;

    procedure ClearData;
    function NewReceiptNo: string;

    property ReceiptNo: string read FReceiptNo write FReceiptNo;
    property SellTotal: Integer read FSellTotal write FSellTotal;
    property ChargeTotal: Integer read GetChargeTotal;
    property PaidTotal: Integer read GetPaidTotal;
    property UnPaidTotal: Integer read GetUnpaidTotal;
    property ChangeTotal: Integer read GetChangeTotal;
    property DiscountAmt: Integer read FDiscountAmt write FDiscountAmt;
    property VatTotal: Integer read GetVatTotal write FVatTotal;
    property CashAmt: Integer read FCashAmt write FCashAmt;
    property CreditCardAmt: Integer read FCreditCardAmt write FCreditCardAmt;
    property PaycoCardAmt: Integer read FPaycoCardAmt write FPaycoCardAmt;
    property PaycoPointAmt: Integer read FPaycoPointAmt write FPaycoPointAmt;
    property TmoneyAmt: Integer read FTmoneyAmt write FTmoneyAmt;
    property PaycoReady: Boolean read FPaycoReady write FPaycoReady default False;
    property SignImage: TMemoryStream read FSignImage write FSignImage;

    property ProductId: Integer read FProductId write FProductId;
    property ScheduleId: Integer read FScheduleId write FScheduleId;
    property ProductRound: Integer read FProductRound write FProductRound;
    property TicketCount: Integer read FTicketCount write FTicketCount;
    property ReserveNo: Int64 read FReserveNo write FReserveNo;
  end;

  { 테마 }
  TThemeColors = record
    { 기본 색상 }
    primary: TColor;
    black: TColor;
    white: TColor;
    background1: TColor;
    background2: TColor;
    background3: TColor;
    type1: TColor;
    type2: TColor;
    type3: TColor;
    type4: TColor;
    type5: TColor;
    line1: TColor;
    line2: TColor;
    line3: TColor;
    line4: TColor;
    { 버튼 색상 }
    btn_face_default: TColor;
    btn_face_pressed: TColor;
    btn_face_disabled: TColor;
    btn_font_default: TColor;
    btn_font_pressed: TColor;
    btn_font_disabled: TColor;
    { 그룹버튼 색상 }
    grpbtn_face_default: TColor;
    grpbtn_face_pressed: TColor;
    grpbtn_face_disabled: TColor;
    grpbtn_font_default: TColor;
    grpbtn_font_pressed: TColor;
    grpbtn_font_disabled: TColor;
    grpbtn_face_active_default: TColor;
    grpbtn_face_active_pressed: TColor;
    grpbtn_face_active_disabled: TColor;
    grpbtn_font_active_default: TColor;
    grpbtn_font_active_pressed: TColor;
    grpbtn_font_active_disabled: TColor;
    { 입력항목 색상 }
    input_border_default: TColor;
    input_border_entered: TColor;
    input_border_disabled: TColor;
    input_face_default: TColor;
    input_face_entered: TColor;
    input_face_disabled: TColor;
    input_font_default: TColor;
    input_font_entered: TColor;
    input_font_disabled: TColor;
    { 키패드 색상 }
    keypad_face_default: TColor;
    keypad_face_pressed: TColor;
    keypad_font_default: TColor;
    keypad_font_pressed: TColor;
    { 패널 색상 }
    panel_border_default: TColor;
    panel_border_pressed: TColor;
    panel_border_disabled: TColor;
    panel_border_soldout: TColor;
    panel_face_default: TColor;
    panel_face_pressed: TColor;
    panel_face_disabled: TColor;
    panel_face_soldout: TColor;
    panel_font_default: TColor;
    panel_font_pressed: TColor;
    panel_font_disabled: TColor;
    panel_font_soldout: TColor;
  end;

  TThemeImageInfo = record
    FileName: string;
    Stream: TMemoryStream;
  end;

  TThemeImageList = record
    FolderName: string;
    ImageList: TcxImageList;
  end;

  TThemeImages = record
{$IFDEF USE_ANIGIF}
    ani_barcode: TThemeImageInfo;
    ani_barcode_payco: TThemeImageInfo;
    ani_creditcard_input: TThemeImageInfo;
    ani_creditcard_output: TThemeImageInfo;
    ani_creditcard_swipe: TThemeImageInfo;
    ani_loading: TThemeImageInfo;
    ani_payco_pin_input: TThemeImageInfo;
    ani_payment_completed: TThemeImageInfo;
    ani_ticket_printing: TThemeImageInfo;
    ani_tmoney_tagging: TThemeImageInfo;
{$ELSE}
    ani_barcode: TThemeImageList;
    ani_barcode_payco: TThemeImageList;
    ani_creditcard_input: TThemeImageList;
    ani_creditcard_output: TThemeImageList;
    ani_creditcard_swipe: TThemeImageList;
    ani_loading: TThemeImageList;
    ani_payco_pin_input: TThemeImageList;
    ani_payment_completed: TThemeImageList;
    ani_ticket_printing: TThemeImageList;
    ani_tmoney_tagging: TThemeImageList;
{$ENDIF}
    btn_arrow_left_default: TThemeImageInfo;
    btn_arrow_left_pressed: TThemeImageInfo;
    btn_arrow_left_disabled: TThemeImageInfo;
    btn_arrow_right_default: TThemeImageInfo;
    btn_arrow_right_pressed: TThemeImageInfo;
    btn_arrow_right_disabled: TThemeImageInfo;
    btn_delete_default: TThemeImageInfo;
    btn_delete_pressed: TThemeImageInfo;
    btn_delete_disabled: TThemeImageInfo;
    btn_minus_default: TThemeImageInfo;
    btn_minus_pressed: TThemeImageInfo;
    btn_minus_disabled: TThemeImageInfo;
    btn_plus_default: TThemeImageInfo;
    btn_plus_pressed: TThemeImageInfo;
    btn_plus_disabled: TThemeImageInfo;
    btn_ticket_background: TThemeImageInfo;
    btn_ticket_printing_default: TThemeImageInfo;
    btn_ticket_printing_default_kor: TThemeImageInfo;
    btn_ticket_printing_default_eng: TThemeImageInfo;
    btn_ticket_printing_default_jpn: TThemeImageInfo;
    btn_ticket_printing_default_chn: TThemeImageInfo;
    //btn_ticket_printing_pressed: TThemeImageInfo;
    btn_ticket_purchase_default: TThemeImageInfo;
    btn_ticket_purchase_default_kor: TThemeImageInfo;
    btn_ticket_purchase_default_eng: TThemeImageInfo;
    btn_ticket_purchase_default_jpn: TThemeImageInfo;
    btn_ticket_purchase_default_chn: TThemeImageInfo;
    //btn_ticket_purchase_pressed: TThemeImageInfo;

    ico_alert: TThemeImageInfo;
    ico_back: TThemeImageInfo;
    ico_calendar: TThemeImageInfo;
    ico_complete: TThemeImageInfo;
    ico_home: TThemeImageInfo;
    ico_keypad_delete: TThemeImageInfo;
    ico_locale_chn: TThemeImageInfo;
    ico_locale_eng: TThemeImageInfo;
    ico_locale_jpn: TThemeImageInfo;
    ico_locale_kor: TThemeImageInfo;
    ico_refresh: TThemeImageInfo;
    ico_partner: TThemeImageInfo;
    ico_ticketlink: TThemeImageInfo;
    ico_ticketlink_en: TThemeImageInfo;
    ico_ticket: TThemeImageInfo;
    ico_ticket_printing: TThemeImageInfo;
    ico_ticket_purchase: TThemeImageInfo;

    img_player_back: TThemeImageInfo;
    img_player_back_full: TThemeImageInfo;
  end;

  TThemeInfo = class
    FLoaded: Boolean;
    FLastError: string;
  public
    Title: string;
    Version: Integer;
    Updated: TDateTime;
    Colors: TThemeColors;
    Images: TThemeImages;
    CurrentThemeCode: string;
    ItemList: TStringList;

    constructor Create;
    destructor Destroy; override;

    procedure LoadTheme(const AThemeCode: string);
    procedure GetImage(ZA: I7zInArchive; AThemeImageInfo: TThemeImageInfo);
    procedure GetImageList(ZA: I7zInArchive; JO: HCkJsonObject; AThemeImageList: TThemeImageList);
    procedure ClearImageStreams;

    property Loaded: Boolean read FLoaded write FLoaded;
    property LastError: string read FLastError write FLastError;
  end;

  { KIOSK 판매점 정보 }
  TStoreInfo = record
    PartnerNo: Integer; // 파트너번호
    CounterId: Integer; // 창구ID
    CounterNo: Integer; // 창구번호
    PartnerType: string; // 파트너타입 (AGENCY: 기획사, THEATER: 공연장, RESERVER: 예매처, ONLINE_PARTNER: 온라인파트너, CLUB: 구단)
    TicketSizeCode: String; // 티켓사이즈코드 (기본티켓 : ticketSize_150,  큰티켓 : ticketSize_187 , 영수증티켓: ticketSize_receipt)
    UsePG: Boolean; // PG결제서비스 사용 여부
    UseDetectCardInsert: Boolean; // 신용카드 삽입 감지 사용 여부
    VanCode: string; // VAN사 코드
    SiteCode: string; // Site 코드
    VanTID: string; // VAN TID
    PaycoVanTID: string; // PAYCO VAN TID
    PaycoHost: string; // PAYCO 서버
    PaycoUriReg: string; // PAYCO POS등록 URI
    PaycoUriApproval: string; // PAYCO 승인 URI
    PaycoUriCancel: string; // PAYCO 취소 URI
    PaycoUriNetCancel: string; // PAYCO 망취소 URI
    PaycoPosTID: string; // PAYCO가 발급하는 POS단말 고유번호 (POS 등록 시 취득)
    PaycoAPIKey: string; // PAYCO API키 (POS 등록 시 취득)
    PaycoMerchantKey: string; // PAYCO 가맹점키 (POS 등록 시 취득)
    PaycoMerchantName: string; // PAYCO 가맹점명 (POS 등록 시 취득)
    OpenTime: string; // 영업시작시각
    CloseTime: string; // 영업종료시각
    BizNo: string; // 사업자번호
    StoreName: string; // 사업자명
    Owner: string; // 대표자명
    TelNo: string; // 전화번호
    Address: string; // 사업장주소
    KioskNotice: string; // 공지사항
    ExposureKioskNotice: Boolean; // 공지사항 노출 여부
    ExposureBarcodeSearch: Boolean; // 바코드 조회 팝업 노출 여부
    ExposureTypeCode: string; // 광고 노출 방식
    ThemeCode: string; // 테마 코드(DARK, WHITE)
    KioskIssueTypeCode: string; // 예매처 기준(TICKETLINK, INTERGRATION)
    ReceiptPrintTypeCode: string; // 영수증 출력 방식
    SearchPhoneNo: Boolean; // 전화번호 검색 허용 여부
    SearchReserveNo: Boolean; // 예매번호 검색 허용 여부
    ShowTicketingMenu: Boolean; // 예매티켓출력 기능 사용 여부
    ShowTicketBuyMenu: Boolean; // 티켓구매 기능 사용 여부
    AllowCreditCard: Boolean; // 신용카드 결제수단 사용 여부
    AllowPAYCO: Boolean; // PAYCO 결제수단 사용 여부
    AllowAliPay: Boolean; // Alipay 결제수단 사용 여부
    AllowWechatPay: Boolean; // WechatPay 결제수단 사용 여부
    AllowCouponPrint: Boolean; // 쿠폰 출력 여부(단, 쿠폰 템플릿 정보가 존재할 경우)
  end;

  { API서버 설정 정보 }
  TAPIServerInfo = record
    Host: string;
    SecretKey: string;
    Token: string;
  end;

  { 플러그인 설정 정보 }
  TPluginInfo = record
    MainFormHandle: HWND; // 메인 폼 핸들
    MsgBoxHandle: HWND; // 메시지박스 폼 핸들
    StartPluginName: string; // 시작 플러그인 파일명
    DashboardPluginId: Integer; // 시작 플러그인 ID
    AdminPluginId: Integer; // 관리자 플러그인 ID
    MediaPlayerPluginId: Integer; // 미디어플레이어 플러그인 ID
    TicketHomePluginId: Integer; // 티켓 시작화면 플러그인 ID
    TicketingPluginId: Integer; // 예매티켓 발권 플러그인 ID
    TicketBuyPluginId: Integer; // 티켓 구매 플러그인 ID
    WaitMsgPluginId: Integer; // 대기 메시지 플러그인 ID
    BarcodeReadyPluginId: Integer; // 바코드 스캔 대기 플러그인 ID
    PrintingMsgPluginId: Integer; // 프린터 출력 메시지 플러그인 핸들
  end;

  { 부가이용권 설정 정보 }
  TAddonTicket = record
    BenefitCoupon: Boolean;
    Copies: Integer;
  end;

  { 장치 설정 정보 }
  TDeviceConfig = class
  private
    FActive: Boolean;
    FComDevice: TComPort;
    FPort: Integer;
    FBaudrate: Integer;
    FDeviceId: Integer;
    FOwnerId: Integer;
    FSendData: AnsiString;
    FReadData: AnsiString;
    FEnabled: Boolean;
    FCopies: Integer;
    FCheckDevicePerEach: Boolean;
    FCheckStatusAll: Boolean;
    FCheckStatusPrinter: Boolean;
    FCheckStatusCover: Boolean;
    FCheckStatusTransmit: Boolean;
    FCheckStatusPaper: Boolean;
    FLastError: string;
    FErrorCode: Integer;
    FErrorOccured: Boolean;
    FPaycoMode: Boolean;
    FWorking: Boolean;

    procedure SetOwnerId(const AValue: Integer);
  public
    constructor Create;
    destructor Destroy; override;

    property Active: Boolean read FActive write FActive default False;
    property ComDevice: TComPort read FComDevice write FComDevice;
    property Port: Integer read FPort write FPort default 0;
    property Baudrate: Integer read FBaudrate write FBaudrate default 9600;
    property DeviceId: Integer read FDeviceId write FDeviceId;
    property OwnerId: Integer read FOwnerId write SetOwnerId default 0;
    property SendData: AnsiString read FSendData write FSendData;
    property ReadData: AnsiString read FReadData write FReadData;
    property Enabled: Boolean read FEnabled write FEnabled default False;
    property Copies: Integer read FCopies write FCopies default 1;
    property CheckDevicePerEach: Boolean read FCheckDevicePerEach write FCheckDevicePerEach;
    property CheckStatusAll: Boolean read FCheckStatusAll write FCheckStatusAll;
    property CheckStatusPrinter: Boolean read FCheckStatusPrinter write FCheckStatusPrinter;
    property CheckStatusCover: Boolean read FCheckStatusCover write FCheckStatusCover;
    property CheckStatusTransmit: Boolean read FCheckStatusTransmit write FCheckStatusTransmit;
    property CheckStatusPaper: Boolean read FCheckStatusPaper write FCheckStatusPaper;
    property LastError: string read FLastError write FLastError;
    property ErrorCode: Integer read FErrorCode write FErrorCode default 0;
    property ErrorOccured: Boolean read FErrorOccured write FErrorOccured default False;
    property PaycoMode: Boolean read FPaycoMode write FPaycoMode default False;
    property Working: Boolean read FWorking write FWorking default False;
  end;

  { 런처 환경설정 정보 }
  TLauncherInfo = record
    UpdateUrl: string; // 업데이트 서버 주소
    RunApp: string; // 실행 프로그램
    Params: string; // 실행 인자
    Delay: Integer; // 실행 지연(초)
    Reboot: Boolean; // 업데이트 후 리부팅 여부
    ExtAppList: string; // 외부 프로그램 실행 목록
  end;

  { 전역 공통 정보 }
  TTLGlobal = class
  private
    { Private declarations }
    FKioskMode: Integer;
    FPrevKioskMode: Integer;
    FKioskLocale: TKioskLocale;
    FPaymentProgress: Boolean; // 결제 진행 여부
    FPrintingProgress: Boolean; // 인쇄 진행 여부

    procedure ResetLogFile;
    procedure SetKioskLocale(const AValue: TKioskLocale);
    procedure SetKioskMode(const AKioskMode: Integer);
    procedure SetPaymentProgress(const AValue: Boolean);
    procedure SetPrintingProgress(const AValue: Boolean);
  public
    { Public declarations }
    LbCipher: TLbCipher; // 암,복호화 클래스
    ThreadTimer: TThreadTimer; // 기본 쓰레드 타이머
    FormatSettingsKR: TFormatSettings; // 시스템 날짜,시각 설정
    FormatSettingsEN: TFormatSettings; // 시스템 날짜,시각 설정(영국식)

    AppFullName: string; // 파일명을 포함한 프로그램 전체 경로
    AppName: string; // 프로그램명(확장자 제외)
    AutoStart: Boolean; // 프로그램 자동 실행 설정
    ProductVersion: string; // 프로그램 버전 정보
    FileVersion: string; // 프로그램 파일 버전 정보

    HomeDir: string;
    PluginDir: string;
    ConfigDir: string;
    ContentsDir: string;
    DataDir: string;
    DownloadDir: string;
    ThemeDir: string;
    LogDir: string;

    DayOfWeekName: string; // 요일명(일..토)
    DayOfWeekNameEN: string; // 요일명(Sun..Sat)
    DayOfWeekNameCN: string; // 요일명(日..土)
    CurrentDate: string; // 현재일자(yyyymmdd)
    CurrentTime: string; // 현재시각(hhnnss)
    CurrentDateTime: string; // 현재일시(yyyymmddhhnnss)
    FormattedCurrentDate: string; // 현재일자(yyyy-mm-dd)
    FormattedCurrentTime: string; // 현재시각(hh:nn:ss)
    FormattedCurrentDateTime: string; // 현재일시(yyyy-mm-dd hh:nn:ss)
    FormattedCurrentDateTimeEN: string; // 현재일시 영문표기(ddd, mmm d h:nn am/pm)
    LastDate: string; // 어제(yyyymmdd)
    FormattedLastDate: string; // 어제(yyyy-mm-dd)
    NextDate: string; // 내일(yyyymmdd)
    FormattedNextDate: string; // 내일(yyyy-mm-dd)
    FormattedCurrentServerDate: string; // 현재일자(yyyy.mm.dd)
    FormattedLastServerDate: string; // 어제(yyyy.mm.dd)
    FormattedNextServerDate: string; // 내일(yyyy.mm.dd)
    TimeBlinked: Boolean; // 시계 깜박임 플래그
    Preparing: Boolean; // 프로그램 준비 중 여부

    WaitingIdleSeconds: DWord; // 유휴 상태 대기시간(초)
    Downloading: Boolean; // 다운로드 진행 여부

    ConfigRegistry: TRegistryIniFile; // 시스템 설정 레지스트리
    ConfigIni: TIniFile; // 환경설정 INI
    LauncherIni: TIniFile; // 런처 환경설정 INI
    ConfigFileName: string; // 환경설정 파일명
    LauncherConfigFileName: string; // 런처 환경설정 파일명

    StoreInfo: TStoreInfo; // 창구 설정 정보
    PluginInfo: TPluginInfo; // 플러그인 설정 정보
    APIServerInfo: TAPIServerInfo; // API서버 접속 정보
    ICCardReader: TDeviceConfig; // 보안IC 단말기 설정 정보
    BarcodeScanner: TDeviceConfig; // 바코드 스캐너 설정 정보
    NFCReader: TDeviceConfig; // NFC 리더(T-money) 설정 정보
    ReceiptInfo: TReceiptInfo; // 영수증 정보
    ReceiptPrinter: TDeviceConfig; // 영수증 프린터 설정 정보
    TicketPrinter: TDeviceConfig; // 티켓 프린터 설정 정보
    AddonTicket: TAddonTicket; // 부가이용권 설정 정보

    ThemeInfo: TThemeInfo; // 테마 설정 정보
    ReceiptPrintManager: TReceiptPrintManager; // 영수증 프린트 모듈
    VanModule: TVanDaemonModule;
    //VanModule: TVanKcpDaemon;
{$IFDEF PAYCO_VCAT_PERSIST}
    PaycoModule: TPaycoNewModule;
{$ENDIF}
    ReserveList: TObjectList<TReserveItem>;
    ProductList: TObjectList<TProductItem>;
    RoundList: TObjectList<TRoundItem>;
    DenominCategoryList: TObjectList<TDenominCategoryItem>;
    DenominList: TObjectList<TDenominItem>;
    OrderList: TObjectList<TOrderItem>;
    //TicketTemplateList: TArray<TTicketLabelRec>;
    TicketTemplateCount: Integer;

    ConfigUpdated: string; // 환경설정 최종 업데이트 일시(yyyymmddhhnnss)
    BaseScreenTop: Integer; // 기본 화면 표시 세로 위치
    BaseScreenLeft: Integer; // 기본 화면 표시 가로 위치
    BaseScreenHeight: Integer; // 기본 화면 세로 크기
    BaseScreenWidth: Integer; // 기본 화면 가로 크기
    ShowDesktopIcons: Boolean; // 바탕화면 아이콘 표시 여부
    ShowTaskBar: Boolean; // 작업표시줄 표시 여부
    ShowCursor: Boolean; // 마우스 커서 표시 여부
    AutoRebootTime: string; // 자동 리부팅 시작
    CheckAutoReboot: Boolean; // 리부팅 확인 여부
    KioskAvailable: Boolean; // KIOSK 사용 가능 여부
    TransitionEffectStyle: Integer; // 이미지 슬라이드쇼 트랜지션 효과 (0: Random, 1..176)

    LogList: TStringList; // 로그 리스트
    LogLimit: Integer; // 메모리 상의 로그 보관 최대치
    AutoDeleteLog: Boolean; // 로그 자동 삭제 여부
    AutoDeleteLogDays: Integer; // 로그 자동 삭제 기준일
    LogDeleting: Boolean; // 로그 삭제 진행 여부
    LogDeleted: Boolean; // 로그 삭제 완료 여부
    LogFileName: string; // 로그 파일명
    PaymentLogFileName: string; // 결제로그 파일명

    MainContentList: TList;
    IdleContentList: TList;

    constructor Create;
    destructor Destroy; override;

    procedure CheckRegistry(ARegistryIniFile: TRegistryIniFile);
    procedure ReadRegistry(ARegistryIniFile: TRegistryIniFile);
    procedure CheckConfig;
    procedure ReadConfig;

    procedure OnCxButtonCustomDraw(Sender: TObject; ACanvas: TcxCanvas; AViewInfo: TcxButtonViewInfo; var AHandled: Boolean);

    property KioskLocale: TKioskLocale read FKioskLocale write SetKioskLocale default TKioskLocale.klKorean;
    property KioskMode: Integer read FKioskMode write SetKioskMode;
    property PrevKioskMode: Integer read FPrevKioskMode write FPrevKioskMode;
    property PaymentProgress: Boolean read FPaymentProgress write SetPaymentProgress;
    property PrintingProgress: Boolean read FPrintingProgress write SetPrintingProgress;
  end;

var
  Global: TTLGlobal;
  LogCS: TRTLCriticalSection;

function ActivateCkDLL(var AErrMsg: string): Boolean;
procedure FreeAndNilJSONObject(AObject: TJSONAncestor);
function UnixTimeToString(const AUnixTime: string; const AFormatStr: string = 'yyyymmddhhnnss'): string;
procedure AddLog(const ALogStr: string; const AWriteFile: Boolean = True);
procedure PaymentLog(const AIsApproval: Boolean; const AReceiptNo: string; const APayMethod: Integer; const ACreditCardNo, AApprovalNo: string; const APayAmt: Integer);
procedure SendPluginCommand(const ACommand: string; const AOwnerID, ATargetID: Integer);
procedure BroadcastPluginCommand(const ACommand: string; const AOwnerID: Integer);
function GetBaudrate(const ABaudrate: Integer): TBaudRate;
function CheckEnumComPorts(const AComNumber: Integer; var AErrMsg: string): Boolean;
procedure StreamToPicture(APicture: TPicture; AStream: TMemoryStream); overload;
procedure StreamToPicture(AGDIPPicture: TGDIPPicture; AStream: TMemoryStream); overload;
procedure ShowWaitMsg(const AMsgText: string);
procedure PopWaitMsg;
procedure PushWaitMsg;
procedure FreeWaitMsg;
procedure ShowPrintingDialog(const AReceiptNo: string; const AReserveNo: Int64; const AIsReceiptPrint: Boolean = False);
procedure ClosePrintingDialog;
function ShowAdminPanel(const AOwnerPluginID: Integer; const AShowModal: Boolean = False): Boolean;
procedure ShowNotice(const ATimeout: Integer = 30);
function CheckKioskAvailable: Boolean;
function CheckOrderLimit(const ADenonimIndex, AOrderCount: Integer): Boolean;
function GetTextLocale(JO: HCkJsonObject): string; overload;
function GetTextLocale(const ATextList: array of string): string; overload;
function GetTicketLabelDirection(const AValue: string): ShortInt;
function GetTicketLabelType(const AValue: string): ShortInt;
function GetTicketLabelAlign(const AValue: string): ShortInt;

implementation

uses
  {Native}
  System.DateUtils, System.StrUtils, System.Math,
  {Project}
  Common.TLDM, Common.TLCommonLib, Common.TLMsgBox, Common.HTMLColorConversions, Common.TLAdminCheck,
  Common.TLSelectPopup;

function ActivateCkDLL(var AErrMsg: string): Boolean;
var
  CkGlobal: HCkGlobal;
  nStatus: Integer;
begin
  Result := False;
  AErrMsg := '';
  CkGlobal := CkGlobal_Create;
  try
    try
      if not CkGlobal_UnlockBundle(CkGlobal, CCC_LIC_CKDLL_KEY) then
        raise Exception.Create(CkGlobal__lastErrorText(CkGlobal));

      nStatus := CkGlobal_getUnlockStatus(CkGlobal);
      if (nStatus <> 2) then
        raise Exception.Create(Format('Status=%d', [nStatus]));

      Result := True;
    finally
      CkGlobal_Dispose(CkGlobal);
    end;
  except
    on E: Exception do
      AErrMsg := E.Message;
  end;
end;

procedure FreeAndNilJSONObject(AObject: TJSONAncestor);
begin
  try
    if Assigned(AObject) then
    begin
      AObject.Owned := False;
      AObject.Free;
    end;
  except
  end;
end;

function UnixTimeToString(const AUnixTime: string; const AFormatStr: string): string;
var
  nUnixTime: Int64;
  dDateTime: TDateTime;
begin
  Result := '';
  nUnixTime := StrToInt64Def(AUnixTime, 0) div 1000; // 밀리초 제외
  try
    if (nUnixTime > 0) then
    begin
      dDateTime := UnixToDateTime(nUnixTime, False); // not UTC(협정세계시: Coordinated Universal Time)
      Result := FormatDateTime(AFormatStr, dDateTime, Global.FormatSettingsKR);
    end;
  except
  end;
end;

procedure AddLog(const ALogStr: string; const AWriteFile: Boolean);
var
  sLogTime: string;
begin
  EnterCriticalSection(LogCS);
  try
    if (Global.LogList.Count > Global.LogLimit) then
      Global.LogList.Delete(0);

    sLogTime := '[' + FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz', Now, Global.FormatSettingsKR) + '] ';
    Global.LogList.Add(sLogTime + ALogStr);
    if AWriteFile and (not Global.LogFileName.IsEmpty) then
      WriteToFile(Global.LogFileName, sLogTime + ALogStr);
  finally
    LeaveCriticalSection(LogCS);
  end;
end;

procedure PaymentLog(const AIsApproval: Boolean; const AReceiptNo: string; const APayMethod: Integer; const ACreditCardNo, AApprovalNo: string; const APayAmt: Integer);
begin
  EnterCriticalSection(LogCS);
  try
    WriteToFile(Global.PaymentLogFileName, '----------------------------------------');
    WriteToFile(Global.PaymentLogFileName, Format('[%s 번호] %s', [IfThen(AIsApproval, '영수증', '원거래'), AReceiptNo]));
    WriteToFile(Global.PaymentLogFileName, Format('[처 리 일 시] %s', [Global.FormattedCurrentDateTime]));
    WriteToFile(Global.PaymentLogFileName, Format('[승 인 여 부] %s', [IfThen(AIsApproval, '승인', '취소')]));
    WriteToFile(Global.PaymentLogFileName, Format('[결 제 수 단] %s', [CPM_NAMES[APayMethod]]));
    WriteToFile(Global.PaymentLogFileName, Format('[카 드 번 호] %s', [ACreditCardNo]));
    WriteToFile(Global.PaymentLogFileName, Format('[승 인 번 호] %s', [AApprovalNo]));
    WriteToFile(Global.PaymentLogFileName, Format('[결 제 금 액] %d', [APayAmt]));
  finally
    LeaveCriticalSection(LogCS);
  end;
end;

procedure SendPluginCommand(const ACommand: string; const AOwnerID, ATargetID: Integer);
begin
  with TPluginMessage.Create(nil) do
    try
      Command := ACommand;
      AddParams(CPP_OWNER_ID, AOwnerID);
      PluginMessageToID(ATargetID);
    finally
      Free;
    end;
end;

procedure BroadcastPluginCommand(const ACommand: string; const AOwnerID: Integer);
begin
  SendPluginCommand(ACommand, AOwnerID, Global.PluginInfo.TicketHomePluginId);
  SendPluginCommand(ACommand, AOwnerID, Global.PluginInfo.TicketingPluginId);
  SendPluginCommand(ACommand, AOwnerID, Global.PluginInfo.TicketBuyPluginId);
end;

function GetBaudrate(const ABaudrate: Integer): TBaudRate;
begin
  case ABaudrate of
    9600:
      Result := br9600;
    14400:
      Result := br14400;
    19200:
      Result := br19200;
    38400:
      Result := br38400;
    57600:
      Result := br57600;
    115200:
      Result := br115200;
    128000:
      Result := br128000;
    256000:
      Result := br256000;
  else
    Result := br9600;
  end;
end;

function CheckEnumComPorts(const AComNumber: Integer; var AErrMsg: string): Boolean;
var
  LKeyHandle: HKEY;
  LErrCode, LIndex: Integer;
  LValueName, LData: string;
  LValueLen, LDataLen, LValueType: DWord;
  SL: TStringList;
begin
  Result := False;
  AErrMsg := '';
  LErrCode := RegOpenKeyEx(HKEY_LOCAL_MACHINE, 'HARDWARE\DEVICEMAP\SERIALCOMM', 0, KEY_READ, LKeyHandle);

  try
    if (LErrCode <> ERROR_SUCCESS) then
      raise Exception.Create(Format('COM%d은 등록되지 않은 통신포트입니다.', [AComNumber]));

    SL := TStringList.Create;
    try
      LIndex := 0;
      repeat
        LValueLen := 256;
        LDataLen := 256;
        SetLength(LValueName, LValueLen);
        SetLength(LData, LDataLen);
        LErrCode := RegEnumValue(
          LKeyHandle,
          LIndex,
          PChar(LValueName),
          Cardinal(LValueLen),
          nil,
          @LValueType,
          PByte(PChar(LData)),
          @LDataLen);

        if (LErrCode = ERROR_SUCCESS) then
        begin
          SetLength(LData, LDataLen - 1);
          SL.Add(LData);
          Inc(LIndex);
        end
        else if (LErrCode <> ERROR_NO_MORE_ITEMS) then
          Break;
      until (LErrCode <> ERROR_SUCCESS);

      SL.Sort;
      for LIndex := 0 to Pred(SL.Count) do
      begin
        Result := (StrToInt(StringReplace(UpperCase(SL[LIndex]), 'COM', '', [rfReplaceAll])) = AComNumber);
        if Result then
          Break;
      end;
    finally
      RegCloseKey(LKeyHandle);
      FreeAndNil(SL);
    end;
  except
    on E: Exception do
      AErrMsg := E.Message;
  end;
end;

procedure StreamToPicture(APicture: TPicture; AStream: TMemoryStream);
begin
  AStream.Position := 0;
  APicture.LoadFromStream(AStream);
end;
procedure StreamToPicture(AGDIPPicture: TGDIPPicture; AStream: TMemoryStream);
begin
  AStream.Position := 0;
  AGDIPPicture.LoadFromStream(AStream);
end;

procedure ShowWaitMsg(const AMsgText: string);
var
  PM: TPluginMessage;
begin
  PM := TPluginMessage.Create(nil);
  try
    if (Global.PluginInfo.WaitMsgPluginId = 0) then
    begin
      PM.Command := CPC_INIT;
      PM.AddParams(CPP_VALUE, AMsgText);
      Global.PluginInfo.WaitMsgPluginId := PluginManager.Open('TLWaitMsg.bpl', PM).PluginID;
    end
    else
    begin
      PM.Command := CPC_SHOW;
      PM.AddParams(CPP_VALUE, AMsgText);
      PM.PluginMessageToID(Global.PluginInfo.WaitMsgPluginId);
    end;
  finally
    FreeAndNil(PM);
  end;
end;

procedure PopWaitMsg;
begin
  SendPluginCommand(CPC_SHOW, 0, Global.PluginInfo.WaitMsgPluginId);
end;

procedure PushWaitMsg;
begin
  SendPluginCommand(CPC_HIDE, 0, Global.PluginInfo.WaitMsgPluginId);
end;

procedure FreeWaitMsg;
begin
  SendPluginCommand(CPC_CLOSE, 0, Global.PluginInfo.WaitMsgPluginId);
end;

procedure ShowPrintingDialog(const AReceiptNo: string; const AReserveNo: Int64; const AIsReceiptPrint: Boolean);
var
  PM: TPluginMessage;
begin
  PM := TPluginMessage.Create(nil);
  try
    PM.Command := CPC_INIT;
    PM.AddParams(CPP_RECEIPT_NO, AReceiptNo);
    PM.AddParams(CPP_RESERVE_NO, AReserveNo);
    PM.AddParams(CPP_RECEIPT_PRINT, AIsReceiptPrint);
    PluginManager.OpenModal('TLPrintingMsg.bpl', PM);
  finally
    FreeAndNil(PM);
  end;
end;

procedure ClosePrintingDialog;
begin
  SendPluginCommand(CPC_CLOSE, 0, Global.PluginInfo.PrintingMsgPluginId);
end;

function ShowAdminPanel(const AOwnerPluginID: Integer; const AShowModal: Boolean): Boolean;
var
  PM: TPluginMessage;
begin
  Result := False;
  with TTLAdminCheckForm.Create(nil) do
    if (ShowModal = mrOK) then
      if (InputValue = Global.CurrentDate.Substring(4, 4)) then // 20220512 -> 0512
      begin
        PM := TPluginMessage.Create(nil);
        try
          if (Global.PluginInfo.AdminPluginId = 0) then
          begin
            PM.Command := CPC_INIT;
            PM.AddParams(CPP_OWNER_ID, AOwnerPluginID);
            if AShowModal then
              PluginManager.OpenModal('TLAdmin.bpl', PM)
            else
              Global.PluginInfo.AdminPluginId := PluginManager.Open('TLAdmin.bpl', PM).PluginID;
          end
          else
          begin
            PM.Command := CPC_SET_FOREGROUND;
            PM.PluginMessageToID(Global.PluginInfo.AdminPluginId);
          end;
          Result := True;
        finally
          FreeAndNil(PM);
        end;
      end
      else
        ShowMsgBoxError('비밀번호가 일치하지 않습니다!.', '인가된 비밀번호를 입력하여 주십시오.', ['확인'], 5);
end;

procedure ShowNotice(const ATimeout: Integer);
var
  PM: TPluginMessage;
begin
  if (not Global.StoreInfo.ExposureKioskNotice) or
     Global.StoreInfo.KioskNotice.IsEmpty then
    Exit;

  PM := TPluginMessage.Create(nil);
  try
    PM.Command := CPC_INIT;
    PM.AddParams(CPP_OWNER_ID, 0);
    PM.AddParams(CPP_TIMEOUT, ATimeout);
    PluginManager.OpenModal('TLNotice.bpl', PM);
  finally
    FreeAndNil(PM);
  end;
end;

function CheckKioskAvailable: Boolean;
begin
  Result := False;
  try
    ShowWaitMsg(GetTextLocale(['잠시만 기다려 주십시오.', 'Please hold.', 'しばらくお待ちください。', '请稍后。']));
    try
      // 이용가능 시간 체크
      if not((Global.StoreInfo.OpenTime <= Global.FormattedCurrentTime) and
        (Global.StoreInfo.CloseTime >= Global.FormattedCurrentTime)) then
        raise Exception.Create(GetTextLocale(['무인발권기 이용시간', 'Kiosk Available Hours', '無人発券機の利用時間', '无人售票机使用时间']) + _CRLF +
          Global.StoreInfo.OpenTime.Substring(0, 5) + ' ~ ' + Global.StoreInfo.CloseTime.Substring(0, 5));
      { chy test
      // 티켓 프린터 사용 가능 체크
      if Global.TicketPrinter.Enabled then
      begin
        if not Global.TicketPrinter.Active then
          raise Exception.Create(GetTextLocale(['티켓 프린터를 사용할 수 없습니다.',
                                                'Ticket printer is not available.',
                                                'チケットプリンターを使用できません。',
                                                '无法使用门票打印机。']));

        if not(Global.TicketPrinter.Active and
          (Global.TicketPrinter.ErrorCode = 0)) then
          raise Exception.Create(Global.TicketPrinter.LastError);
      end;
      }
      // 영수증 프린터 사용 가능 체크
      if Global.ReceiptPrinter.Enabled then
      begin
        if not Global.ReceiptPrinter.Active then
          raise Exception.Create(GetTextLocale(['영수증 프린터를 사용할 수 없습니다.',
                                                'Receipt printer is not available.',
                                                '領収書プリンターを使用できません。',
                                                '无法使用收据打印机。']));
        // 용지 부족 체크
        if (not Global.ReceiptPrintManager.CheckReceiptPrinter(rpsStatusPaper)) or
          (not Global.ReceiptPrintManager.CheckReceiptPrinter(rpsStatusCover)) then
          raise Exception.Create(Global.ReceiptPrinter.LastError);
      end;

      Result := True;
    finally
      PushWaitMsg;
      Global.KioskAvailable := Result;
    end;
  except
    on E: Exception do
    begin
      // qa_v0.3_20240216 - 7 page
      {
      ShowMsgBoxError(GetTextLocale(['무인발권기 이용이 불가합니다.' + _CRLF + '매표소를 이용해 주시기 바랍니다.',
                                     'Ticket Kiosk is currently unavailable.' + _CRLF + 'Please visit the ticket office.',
                                     '無人発券機を利用できません。' + _CRLF + 'チケット売り場をご利用ください。',
                                     '无法使用无人售票机。' + _CRLF + '请前往购票处。']),
        E.Message, [GetTextLocale(['확인', 'Confirm', '確認', '确认'])], 5);
      }

      case Global.KioskLocale of
        TKioskLocale.klKorean:
            ShowMsgBoxError(E.Message, '매표소를 이용해 주시기 바랍니다.', ['확인'], 5);
        TKioskLocale.klEnglish:
            ShowMsgBoxError(E.Message, 'Please visit the ticket office.', ['Confirm'], 5);
        TKioskLocale.klJapanese:
            ShowMsgBoxError(E.Message, 'チケット売り場をご利用ください。', ['確認'], 5);
        TKioskLocale.klChinese:
            ShowMsgBoxError(E.Message, '请前往购票处。', ['确认'], 5);
      end;

    end;
  end;
end;

function CheckOrderLimit(const ADenonimIndex, AOrderCount: Integer): Boolean;
var
  LPrimaryColor, LBlackColor, LCondition: string;
  LRoundIndex: Integer;
  LAlert: string;
  LMax, LMin, LDouble: Integer;
  bChk: Boolean;
begin
  Result := False;
  LPrimaryColor := Color2HTML(Global.ThemeInfo.Colors.primary);
  LBlackColor := Color2HTML(Global.ThemeInfo.Colors.black);
  LRoundIndex := Global.DenominList[ADenonimIndex].RoundIndex;

  {
  PerMaxCount: Integer         // 예매건당 최대매수
  PerMinCount: Integer         // 예매건당 최저매수
  ProductSaleCount: Integer    // 판매가능 매수
  ScheduleSaleCount: Integer   // 회차당 판매가능 매수
  PerPersonMaxCount: Integer   // 인당최대매수
  RoundMaxCount: Integer       // 회차당 최대매수
  BuyDoubleCount: Integer      // 매수배수
  DenominLimitCount: Integer   // 권종 판매가능매수
  ScheduleRemainCount: Integer // 해당스케줄 판매가능매수
  }

  LDouble := 1; //배수
  LMax := 10;   //최대
  LMin := 1;    //최소

  LDouble := Global.DenominList[ADenonimIndex].BuyDoubleCount;

  // 예매건당 최저매수
  if LMin < Global.DenominList[ADenonimIndex].PerMinCount then
    LMin := Global.DenominList[ADenonimIndex].PerMinCount;

  // 예매건당 최대매
  if (LMax > Global.DenominList[ADenonimIndex].PerMaxCount) then
    LMax := Global.DenominList[ADenonimIndex].PerMaxCount;
  // 판매가능 매수
  if (LMax > Global.DenominList[ADenonimIndex].ProductSaleCount) then
    LMax := Global.DenominList[ADenonimIndex].ProductSaleCount;
  // 회차당 판매가능 매수
  if (LMax > Global.DenominList[ADenonimIndex].ScheduleSaleCount) then
    LMax := Global.DenominList[ADenonimIndex].ScheduleSaleCount;
  // 인당 최대 매수
  if (LMax > Global.DenominList[ADenonimIndex].PerPersonMaxCount) then
    LMax := Global.DenominList[ADenonimIndex].PerPersonMaxCount;
  // 회차당 최대매수
  if (LMax > Global.DenominList[ADenonimIndex].RoundMaxCount) then
    LMax := Global.DenominList[ADenonimIndex].RoundMaxCount;
  // 권종 판매가능매수
  if (LMax > Global.DenominList[ADenonimIndex].DenominLimitCount) then
    LMax := Global.DenominList[ADenonimIndex].DenominLimitCount;

  LCondition := '';
  if (AOrderCount > Global.RoundList[LRoundIndex].RemainCount) then
    LCondition := 'remain'
  else if AOrderCount > LMax then
    LCondition := 'max'
  else if AOrderCount < LMin then
    LCondition := 'min'
  else
  begin
    Result := True;
    Exit;
  end;

  try
    case Global.KioskLocale of
      TKioskLocale.klKorean:
        begin

          { 스케쥴조회(POST, /v2/api/schedule/round) }
          // 회차별 판매 할당 잔여매수
          if LCondition = 'remain' then
          begin
            raise Exception.Create(
              Format('<FONT color="%s">선택된 총 매수를 기준으로 </FONT> <FONT color="%s">최대 %d매</FONT> <FONT color="%s">까지 선택 가능합니다.</FONT>',
                [LBlackColor, LPrimaryColor, Global.RoundList[LRoundIndex].RemainCount, LBlackColor]));
          end;

          { 권종조회(POST, /v2/api/denomination/list) }

          // 매수배수
          if (LDouble > 1) then
          begin
            if (LMin > 1) then  //A매부터 C매 단위로 최대 B매까지 선택 가능합니다.
            begin
              raise Exception.Create(
                Format('<FONT color="%s">%d매</FONT> <FONT color="%s"> 부터 </FONT>' +  // A
                       '<FONT color="%s">%d매</FONT> <FONT color="%s"> 단위로 최대 </FONT>' + // C
                       '<FONT color="%s">%d매</FONT> <FONT color="%s">까지 선택 가능합니다.</FONT>', // B
                       [LPrimaryColor, LMin, LBlackColor,
                        LPrimaryColor, LDouble, LBlackColor,
                        LPrimaryColor, LMax, LBlackColor]));
            end
            else
            begin
              raise Exception.Create(
                Format('<FONT color="%s">%d매</FONT> <FONT color="%s"> 단위로 최대 </FONT>' + // C
                       '<FONT color="%s">%d매</FONT> <FONT color="%s">까지 선택 가능합니다.</FONT>', // B
                       [LPrimaryColor, LDouble, LBlackColor,
                        LPrimaryColor, LMax, LBlackColor]));
            end;
          end
          else
          begin
            // 회차당 최소매수
            if LCondition = 'min' then
              raise Exception.Create(Format('<FONT color="%s">%d매</FONT> <FONT color="%s">부터 선택 가능합니다.</FONT>', [LPrimaryColor, LMin, LBlackColor]))
            else
              raise Exception.Create(Format('<FONT color="%s">%d매</FONT> <FONT color="%s">까지 선택 가능합니다.</FONT>', [LPrimaryColor, LMax, LBlackColor]));
          end;
        end;
      TKioskLocale.klEnglish:
        begin

          // 회차별 판매 할당 잔여매수
          if LCondition = 'remain' then
            raise Exception.Create(
              Format('<FONT color="%s">Up to %d</FONT> <FONT color="%s">tickets can be selected, excluding the ones you''ve already chosen.</FONT>',
                [LPrimaryColor, Global.RoundList[LRoundIndex].RemainCount, LBlackColor]));

          // 매수배수
          if (LDouble > 1) then
          begin
            if (LMin > 1) then //You may select up to B tickets (min A) with increments of C tickets.
            begin
              raise Exception.Create(
                Format('<FONT color="%s">You may select up to </FONT> <FONT color="%s">%d</FONT>' +
                       '<FONT color="%s"> tickets (min </FONT> <FONT color="%s">%d</FONT>' +
                       '<FONT color="%s">) with increments of </FONT> <FONT color="%s">%d</FONT> <FONT color="%s"> tickets.</FONT>',
                       [LBlackColor, LPrimaryColor, LMax,
                        LBlackColor, LPrimaryColor, LMin,
                        LBlackColor, LPrimaryColor, LDouble, LBlackColor]));

            end
            else
            begin
              raise Exception.Create(
                Format('<FONT color="%s">You may select up to </FONT> <FONT color="%s">%d</FONT>' +
                       '<FONT color="%s"> tickets with increments of </FONT> <FONT color="%s">%d</FONT> <FONT color="%s"> tickets.</FONT>',
                       [LBlackColor,LPrimaryColor, LMax,
                        LBlackColor,LPrimaryColor, LDouble, LBlackColor]));
            end;
          end
          else
          begin
            // 회차당 최소매수
            if LCondition = 'min' then
              raise Exception.Create(Format('<FONT color="%s">You may select </FONT> <FONT color="%s">%d </FONT> <FONT color="%s">or more tickets.</FONT>', [LBlackColor, LPrimaryColor, LMin, LBlackColor]))
            else
              raise Exception.Create(Format('<FONT color="%s">Up to %d </FONT> <FONT color="%s">tickets can be selected.</FONT>', [LPrimaryColor, LMax, LBlackColor]));
          end;
        end;
      TKioskLocale.klJapanese:
        begin
          // 회차별 판매 할당 잔여매수
          if LCondition = 'remain' then
            raise Exception.Create(
              Format('<FONT color="%s">選択された合計枚数を基準に最大</FONT> <FONT color="%s">%d</FONT> <FONT color="%s">枚まで選択できます。</FONT>',
                [LBlackColor, LPrimaryColor, Global.RoundList[LRoundIndex].RemainCount, LBlackColor]));

          if (LDouble > 1) then
          begin
            if (LMin > 1) then  // A枚からC枚単位で最大B枚まで選択できます。
            begin
              raise Exception.Create(
                Format('<FONT color="%s">%d</FONT> <FONT color="%s">枚から</FONT>' +
                       '<FONT color="%s">%d</FONT> <FONT color="%s">枚単位で最大</FONT>' +
                       '<FONT color="%s">%d</FONT> <FONT color="%s">枚まで選択できます。</FONT>',
                       [LPrimaryColor, LMin, LBlackColor,
                        LPrimaryColor, LDouble, LBlackColor,
                        LPrimaryColor, LMax, LBlackColor]));
            end
            else
            begin
              raise Exception.Create(
                Format('<FONT color="%s">%d</FONT> <FONT color="%s">枚単位で最大</FONT>' +
                       '<FONT color="%s">%d</FONT> <FONT color="%s">枚まで選択できます。</FONT>',
                       [LPrimaryColor, LDouble, LBlackColor,
                        LPrimaryColor, LMax, LBlackColor]));
            end;
          end
          else
          begin
            // 회차당 최소매수
            if LCondition = 'min' then
              raise Exception.Create(Format('<FONT color="%s">該当券種は、</FONT> <FONT color="%s">%d </FONT> <FONT color="%s">枚から選択できます。</FONT>', [LBlackColor, LPrimaryColor, LMin, LBlackColor]))
            else
              raise Exception.Create(Format('<FONT color="%s">該当する券種は、</FONT> <FONT color="%s">最大%d</FONT> <FONT color="%s">枚まで選択できます。</FONT>', [LBlackColor, LPrimaryColor, LMax, LBlackColor]));
          end;
        end;
      TKioskLocale.klChinese:
        begin
          // 회차별 판매 할당 잔여매수
          if LCondition = 'remain' then
            raise Exception.Create(
              Format('<FONT color="%s">最多可选择的票总和为</FONT> <FONT color="%s">%d</FONT> <FONT color="%s">张。</FONT>',
                [LBlackColor, LPrimaryColor, Global.RoundList[LRoundIndex].RemainCount, LBlackColor]));

          if (LDouble > 1) then
          begin
            if (LMin > 1) then // 从A张到以C张为增量，最多可选择B张。
            begin
              raise Exception.Create(
                Format('<FONT color="%s">从</FONT> <FONT color="%s">%d</FONT> <FONT color="%s">张到以</FONT>' +
                       '<FONT color="%s">%d</FONT> <FONT color="%s">张为增量，最多可选择</FONT>' +
                       '<FONT color="%s">%d</FONT> <FONT color="%s">张。</FONT>',
                       [LBlackColor, LPrimaryColor, LMin, LBlackColor,
                        LPrimaryColor, LDouble, LBlackColor,
                        LPrimaryColor, LMax, LBlackColor]));
            end
            else
            begin
              raise Exception.Create(
                Format('<FONT color="%s">以</FONT> <FONT color="%s">%d</FONT> <FONT color="%s">张为增量，最多可选择</FONT>' +
                       '<FONT color="%s">%d</FONT> <FONT color="%s">张。</FONT>',
                       [LBlackColor, LPrimaryColor, LDouble, LBlackColor,
                        LPrimaryColor, LMax, LBlackColor]));
            end;
          end
          else
          begin
            // 회차당 최소매수
            if LCondition = 'min' then
              raise Exception.Create(Format('<FONT color="%s">相应门票种类，可从 </FONT> <FONT color="%s">%d</FONT> <FONT color="%s">张开始选择。</FONT>', [LBlackColor, LPrimaryColor, LMin, LBlackColor]))
            else
              raise Exception.Create(Format('<FONT color="%s">该门票种类最多可选择</FONT> <FONT color="%s">%d</FONT> <FONT color="%s">张。</FONT>', [LBlackColor, LPrimaryColor, LMax, LBlackColor]));
            end;
        end;

    end;

    Result := True;
  except
    on E: Exception do
      case Global.KioskLocale of
        TKioskLocale.klKorean:
          begin
            if LCondition = 'min' then
              ShowMsgBoxInfo('구매 가능한 최저 매수 미만으로' + _CRLF + ' 선택할 수 없습니다.', E.Message, ['확인'], 5)
            else
              ShowMsgBoxInfo('구매 가능한 최대 매수를' + _CRLF + ' 초과하여 선택할 수 없습니다.', E.Message, ['확인'], 5);
          end;
        TKioskLocale.klEnglish:
          begin
            if LCondition = 'min' then
              ShowMsgBoxInfo('Sorry. You cannot purchase lower than' + _CRLF + ' the minimum number of tickets.', E.Message, ['Confirm'], 5)
            else
              ShowMsgBoxInfo('Sorry. You cannot purchase more than' + _CRLF + ' the maximum number of tickets', E.Message, ['Confirm'], 5);
          end;
        TKioskLocale.klJapanese:
          begin
            if LCondition = 'min' then
              ShowMsgBoxInfo('購入可能な最低枚数未満には選択できません。', E.Message, ['確認'], 5)
            else
              ShowMsgBoxInfo('購入可能な最大枚数を超えたため、選択できません。', E.Message, ['確認'], 5);
          end;
        TKioskLocale.klChinese:
          begin
            if LCondition = 'min' then
              ShowMsgBoxInfo('低于最低可购买票数，无法选择。', E.Message, ['确认'], 5)
            else
              ShowMsgBoxInfo('票数超出可购买的上限。', E.Message, ['确认'], 5);
          end;
      end;
  end;

  (*

  try
    case Global.KioskLocale of
      TKioskLocale.klKorean:
        begin
          //LCondition := '최대 매수를 초과하여';
          LCondition := 'max';

          { 스케쥴조회(POST, /v2/api/schedule/round) }
          // 회차별 판매 할당 잔여매수
          if (AOrderCount > Global.RoundList[LRoundIndex].RemainCount) then
            raise Exception.Create(
              Format('<FONT color="%s">선택된 총 매수를 기준으로 </FONT> <FONT color="%s">최대 %d매</FONT> <FONT color="%s">까지 선택 가능합니다.</FONT>',
                [LBlackColor, LPrimaryColor, Global.RoundList[LRoundIndex].RemainCount, LBlackColor]));

          { 권종조회(POST, /v2/api/denomination/list) }
          // 최대 10매

          // 매수배수
          if (Global.DenominList[ADenonimIndex].BuyDoubleCount > 1) then
          begin
            if (AOrderCount > FPerMaxCount) then
              LAlert := Format('<FONT color="%s">%d매</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FBuyDoubleCount]) + ' 단위로 최대 ' +
                        Format('<FONT color="%s">%d매</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerMaxCount]) + '까지 선택 가능합니다.';
            if (FSelectedCount < FPerMinCount) and (FSelectedCount > FPerMaxCount) then  //A매부터 C매 단위로 최대 B매까지 선택 가능합니다.
              LAlert := Format('<FONT color="%s">%d매</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerMinCount]) + ' 부터 ' +  // A
                        Format('<FONT color="%s">%d매</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), FBuyDoubleCount]) + ' 단위로 최대 ' + // C
                        Format('<FONT color="%s">%d매</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerMaxCount]) + '까지 선택 가능합니다.'; // B
          end;

          // 회차당 최소매수
          if (AOrderCount < Global.DenominList[ADenonimIndex].PerMinCount) then
          begin
            //LCondition := '최저 매수 미만으로';
            LCondition := 'min';
            raise Exception.Create(
              Format('<FONT color="%s">해당 권종은</FONT> <FONT color="%s">%d매</FONT> <FONT color="%s">부터 선택 가능합니다.</FONT>',
                [LBlackColor, LPrimaryColor, Global.DenominList[ADenonimIndex].PerMinCount, LBlackColor]));
          end;


          if (AOrderCount > 10) then
            raise Exception.Create(
              Format('<FONT color="%s">해당 권종은</FONT> <FONT color="%s">%d매</FONT> <FONT color="%s">까지 선택 가능합니다.</FONT>',
                [LBlackColor, LPrimaryColor, 10, LBlackColor]));
          // 상품당 판매가능 매수
          if (AOrderCount > Global.DenominList[ADenonimIndex].ProductSaleCount) then
            raise Exception.Create(
              Format('<FONT color="%s">해당 권종은</FONT> <FONT color="%s">%d매</FONT> <FONT color="%s">까지 선택 가능합니다.</FONT>',
                [LBlackColor, LPrimaryColor, Global.DenominList[ADenonimIndex].ProductSaleCount, LBlackColor]));
          // 회차당 판매가능 매수
          if (AOrderCount > Global.DenominList[ADenonimIndex].ScheduleSaleCount) then
            raise Exception.Create(
              Format('<FONT color="%s">해당 권종은</FONT> <FONT color="%s">%d매</FONT> <FONT color="%s">까지 선택 가능합니다.</FONT>',
                [LBlackColor, LPrimaryColor, Global.DenominList[ADenonimIndex].ScheduleSaleCount, LBlackColor]));
          // 인당 최대 매수
          if (AOrderCount > Global.DenominList[ADenonimIndex].PerPersonMaxCount) then
            raise Exception.Create(
              Format('<FONT color="%s">해당 권종은</FONT> <FONT color="%s">%d매</FONT> <FONT color="%s">까지 선택 가능합니다.</FONT>',
                [LBlackColor, LPrimaryColor, Global.DenominList[ADenonimIndex].PerPersonMaxCount, LBlackColor]));
          // 회차당 최대매수
          if (AOrderCount > Global.DenominList[ADenonimIndex].PerMaxCount) then
            raise Exception.Create(
              Format('<FONT color="%s">해당 권종은</FONT> <FONT color="%s">%d매</FONT> <FONT color="%s">까지 선택 가능합니다.</FONT>',
                [LBlackColor, LPrimaryColor, Global.DenominList[ADenonimIndex].PerMaxCount, LBlackColor]));

          // 회당 구매제약수
          if (AOrderCount > Global.DenominList[ADenonimIndex].RoundMaxCount) then
            raise Exception.Create(
              Format('<FONT color="%s">해당 권종은</FONT> <FONT color="%s">%d매</FONT> <FONT color="%s">까지 선택 가능합니다.</FONT>',
                [LBlackColor, LPrimaryColor, Global.DenominList[ADenonimIndex].RoundMaxCount, LBlackColor]));

          // 권종별 판매제한 매수
          if (AOrderCount > Global.DenominList[ADenonimIndex].DenominLimitCount) then
            raise Exception.Create(
              Format('<FONT color="%s">해당 권종은</FONT> <FONT color="%s">%d매</FONT> <FONT color="%s">까지 선택 가능합니다.</FONT>',
                [LBlackColor, LPrimaryColor, Global.DenominList[ADenonimIndex].DenominLimitCount, LBlackColor]));
        end;
      TKioskLocale.klEnglish:
        begin
          LCondition := 'max';

          // 회차별 판매 할당 잔여매수
          if (AOrderCount > Global.RoundList[LRoundIndex].RemainCount) then
            raise Exception.Create(
              Format('<FONT color="%s">Up to %d</FONT> <FONT color="%s">tickets can be selected, excluding the ones you''ve already chosen.</FONT>',
                [LPrimaryColor, Global.RoundList[LRoundIndex].RemainCount, LBlackColor]));

          // 최대 10매
          if (AOrderCount > 10) then
            raise Exception.Create(
              Format('<FONT color="%s">Up to %d </FONT> <FONT color="%s">tickets can be selected.</FONT>',
                [LPrimaryColor, 10, LBlackColor]));
          // 상품당 판매가능 매수
          if (AOrderCount > Global.DenominList[ADenonimIndex].ProductSaleCount) then
            raise Exception.Create(
              Format('<FONT color="%s">Up to %d </FONT> <FONT color="%s">tickets can be selected.</FONT>',
                [LPrimaryColor, Global.DenominList[ADenonimIndex].ProductSaleCount, LBlackColor]));
          // 회차당 판매가능 매수
          if (AOrderCount > Global.DenominList[ADenonimIndex].ScheduleSaleCount) then
            raise Exception.Create(
              Format('<FONT color="%s">Up to %d </FONT> <FONT color="%s">tickets can be selected.</FONT>',
                [LPrimaryColor, Global.DenominList[ADenonimIndex].ScheduleSaleCount, LBlackColor]));
          // 인당 최대 매수
          if (AOrderCount > Global.DenominList[ADenonimIndex].PerPersonMaxCount) then
            raise Exception.Create(
              Format('<FONT color="%s">Up to %d </FONT> <FONT color="%s">tickets can be selected.</FONT>',
                [LPrimaryColor, Global.DenominList[ADenonimIndex].PerPersonMaxCount, LBlackColor]));
          // 회차당 최대매수
          if (AOrderCount > Global.DenominList[ADenonimIndex].PerMaxCount) then
            raise Exception.Create(
              Format('<FONT color="%s">Up to %d </FONT> <FONT color="%s">tickets can be selected.</FONT>',
                [LPrimaryColor, Global.DenominList[ADenonimIndex].PerMaxCount, LBlackColor]));
          // 회차당 최소매수
          if (AOrderCount < Global.DenominList[ADenonimIndex].PerMinCount) then
          begin
            LCondition := 'min';
            raise Exception.Create(
              Format('<FONT color="%s">You may select </FONT> <FONT color="%s">%d </FONT> <FONT color="%s">or more tickets.</FONT>',
                [LBlackColor, LPrimaryColor, Global.DenominList[ADenonimIndex].PerMinCount, LBlackColor]));
          end;
          // 회당 구매제약수
          if (AOrderCount > Global.DenominList[ADenonimIndex].RoundMaxCount) then
            raise Exception.Create(
              Format('<FONT color="%s">Up to %d </FONT> <FONT color="%s">tickets can be selected.</FONT>',
                [LPrimaryColor, Global.DenominList[ADenonimIndex].RoundMaxCount, LBlackColor]));

          // 권종별 판매제한 매수
          if (AOrderCount > Global.DenominList[ADenonimIndex].DenominLimitCount) then
            raise Exception.Create(
              Format('<FONT color="%s">Up to %d </FONT> <FONT color="%s">tickets can be selected.</FONT>',
                [LPrimaryColor, Global.DenominList[ADenonimIndex].DenominLimitCount, LBlackColor]));
        end;
      TKioskLocale.klJapanese:
        begin
          LCondition := 'max';

          // 회차별 판매 할당 잔여매수
          if (AOrderCount > Global.RoundList[LRoundIndex].RemainCount) then
            raise Exception.Create(
              Format('<FONT color="%s">選択された合計枚数を基準に最大</FONT> <FONT color="%s">%d</FONT> <FONT color="%s">枚まで選択できます。</FONT>',
                [LBlackColor, LPrimaryColor, Global.RoundList[LRoundIndex].RemainCount, LBlackColor]));


          // 최대 10매
          if (AOrderCount > 10) then
            raise Exception.Create(
              Format('<FONT color="%s">該当する券種は、</FONT> <FONT color="%s">最大%d</FONT> <FONT color="%s">枚まで選択できます。</FONT>',
                [LBlackColor, LPrimaryColor, 10, LBlackColor]));
          // 상품당 판매가능 매수
          if (AOrderCount > Global.DenominList[ADenonimIndex].ProductSaleCount) then
            raise Exception.Create(
              Format('<FONT color="%s">該当する券種は、</FONT> <FONT color="%s">最大%d</FONT> <FONT color="%s">枚まで選択できます。</FONT>',
                [LBlackColor, LPrimaryColor, Global.DenominList[ADenonimIndex].ProductSaleCount, LBlackColor]));
          // 회차당 판매가능 매수
          if (AOrderCount > Global.DenominList[ADenonimIndex].ScheduleSaleCount) then
            raise Exception.Create(
              Format('<FONT color="%s">該当する券種は、</FONT> <FONT color="%s">最大%d</FONT> <FONT color="%s">枚まで選択できます。</FONT>',
                [LBlackColor, LPrimaryColor, Global.DenominList[ADenonimIndex].ScheduleSaleCount, LBlackColor]));
          // 인당 최대 매수
          if (AOrderCount > Global.DenominList[ADenonimIndex].PerPersonMaxCount) then
            raise Exception.Create(
              Format('<FONT color="%s">該当する券種は、</FONT> <FONT color="%s">最大%d</FONT> <FONT color="%s">枚まで選択できます。</FONT>',
                [LBlackColor, LPrimaryColor, Global.DenominList[ADenonimIndex].PerPersonMaxCount, LBlackColor]));
          // 회차당 최대매수
          if (AOrderCount > Global.DenominList[ADenonimIndex].PerMaxCount) then
            raise Exception.Create(
              Format('<FONT color="%s">該当する券種は、</FONT> <FONT color="%s">最大%d</FONT> <FONT color="%s">枚まで選択できます。</FONT>',
                [LBlackColor, LPrimaryColor, Global.DenominList[ADenonimIndex].PerMaxCount, LBlackColor]));
          // 회차당 최소매수
          if (AOrderCount < Global.DenominList[ADenonimIndex].PerMinCount) then
          begin
            LCondition := 'min';
            raise Exception.Create(
              Format('<FONT color="%s">該当券種は、</FONT> <FONT color="%s">%d </FONT> <FONT color="%s">枚から選択できます。</FONT>',
                [LBlackColor, LPrimaryColor, Global.DenominList[ADenonimIndex].PerMinCount, LBlackColor]));
          end;
          // 회당 구매제약수
          if (AOrderCount > Global.DenominList[ADenonimIndex].RoundMaxCount) then
            raise Exception.Create(
              Format('<FONT color="%s">該当する券種は、</FONT> <FONT color="%s">最大%d</FONT> <FONT color="%s">枚まで選択できます。</FONT>',
                [LBlackColor, LPrimaryColor, Global.DenominList[ADenonimIndex].RoundMaxCount, LBlackColor]));

          // 권종별 판매제한 매수
          if (AOrderCount > Global.DenominList[ADenonimIndex].DenominLimitCount) then
            raise Exception.Create(
              Format('<FONT color="%s">該当する券種は、最大</FONT> <FONT color="%s">%d</FONT> <FONT color="%s">枚まで選択できます。</FONT>',
                [LBlackColor, LPrimaryColor, Global.DenominList[ADenonimIndex].DenominLimitCount, LBlackColor]));
        end;
      TKioskLocale.klChinese:
        begin
          LCondition := 'max';

          // 회차별 판매 할당 잔여매수
          if (AOrderCount > Global.RoundList[LRoundIndex].RemainCount) then
            raise Exception.Create(
              Format('<FONT color="%s">最多可选择的票总和为</FONT> <FONT color="%s">%d</FONT> <FONT color="%s">张。</FONT>',
                [LBlackColor, LPrimaryColor, Global.RoundList[LRoundIndex].RemainCount, LBlackColor]));

          // 최대 10매
          if (AOrderCount > 10) then
            raise Exception.Create(
              Format('<FONT color="%s">该门票种类最多可选择</FONT> <FONT color="%s">%d</FONT> <FONT color="%s">张。</FONT>',
                [LBlackColor, LPrimaryColor, 10, LBlackColor]));
          // 상품당 판매가능 매수
          if (AOrderCount > Global.DenominList[ADenonimIndex].ProductSaleCount) then
            raise Exception.Create(
              Format('<FONT color="%s">该门票种类最多可选择</FONT> <FONT color="%s">%d</FONT> <FONT color="%s">张。</FONT>',
                [LBlackColor, LPrimaryColor, Global.DenominList[ADenonimIndex].ProductSaleCount, LBlackColor]));
          // 회차당 판매가능 매수
          if (AOrderCount > Global.DenominList[ADenonimIndex].ScheduleSaleCount) then
            raise Exception.Create(
              Format('<FONT color="%s">该门票种类最多可选择</FONT> <FONT color="%s">%d</FONT> <FONT color="%s">张。</FONT>',
                [LBlackColor, LPrimaryColor, Global.DenominList[ADenonimIndex].ScheduleSaleCount, LBlackColor]));
          // 인당 최대 매수
          if (AOrderCount > Global.DenominList[ADenonimIndex].PerPersonMaxCount) then
            raise Exception.Create(
              Format('<FONT color="%s">该门票种类最多可选择</FONT> <FONT color="%s">%d</FONT> <FONT color="%s">张。</FONT>',
                [LBlackColor, LPrimaryColor, Global.DenominList[ADenonimIndex].PerPersonMaxCount, LBlackColor]));
          // 회차당 최대매수
          if (AOrderCount > Global.DenominList[ADenonimIndex].PerMaxCount) then
            raise Exception.Create(
              Format('<FONT color="%s">该门票种类最多可选择</FONT> <FONT color="%s">%d</FONT> <FONT color="%s">张。</FONT>',
                [LBlackColor, LPrimaryColor, Global.DenominList[ADenonimIndex].PerMaxCount, LBlackColor]));
          // 회차당 최소매수
          if (AOrderCount < Global.DenominList[ADenonimIndex].PerMinCount) then
          begin
            LCondition := 'min';
            raise Exception.Create(
              Format('<FONT color="%s">相应门票种类，可从 </FONT> <FONT color="%s">%d</FONT> <FONT color="%s">张开始选择。</FONT>',
                [LBlackColor, LPrimaryColor, Global.DenominList[ADenonimIndex].PerMinCount, LBlackColor]));
          end;
          // 회당 구매제약수
          if (AOrderCount > Global.DenominList[ADenonimIndex].RoundMaxCount) then
            raise Exception.Create(
              Format('<FONT color="%s">该门票种类最多可选择</FONT> <FONT color="%s">%d</FONT> <FONT color="%s">张。</FONT>',
                [LBlackColor, LPrimaryColor, Global.DenominList[ADenonimIndex].RoundMaxCount, LBlackColor]));

          // 권종별 판매제한 매수
          if (AOrderCount > Global.DenominList[ADenonimIndex].DenominLimitCount) then
            raise Exception.Create(
              Format('<FONT color="%s">该门票种类最多可选择</FONT> <FONT color="%s">%d</FONT> <FONT color="%s">张。</FONT>',
                [LBlackColor, LPrimaryColor, Global.DenominList[ADenonimIndex].DenominLimitCount, LBlackColor]));
        end;

    end;

    Result := True;
  except
    on E: Exception do
      case Global.KioskLocale of
        TKioskLocale.klKorean:
          begin
            if LCondition = 'min' then
              ShowMsgBoxInfo('구매 가능한 최저 매수 미만으로' + _CRLF + ' 선택할 수 없습니다.', E.Message, ['확인'], 5)
            else
              ShowMsgBoxInfo('구매 가능한 최대 매수를' + _CRLF + ' 초과하여 선택할 수 없습니다.', E.Message, ['확인'], 5);
          end;
        TKioskLocale.klEnglish:
          begin
            if LCondition = 'min' then
              ShowMsgBoxInfo('Sorry. You cannot purchase lower than' + _CRLF + ' the minimum number of tickets.', E.Message, ['Confirm'], 5)
            else
              ShowMsgBoxInfo('Sorry. You cannot purchase more than' + _CRLF + ' the maximum number of tickets', E.Message, ['Confirm'], 5);
          end;
        TKioskLocale.klJapanese:
          begin
            if LCondition = 'min' then
              ShowMsgBoxInfo('購入可能な最低枚数未満には選択できません。', E.Message, ['確認'], 5)
            else
              ShowMsgBoxInfo('購入可能な最大枚数を超えたため、選択できません。', E.Message, ['確認'], 5);
          end;
        TKioskLocale.klChinese:
          begin
            if LCondition = 'min' then
              ShowMsgBoxInfo('低于最低可购买票数，无法选择。', E.Message, ['确认'], 5)
            else
              ShowMsgBoxInfo('票数超出可购买的上限。', E.Message, ['确认'], 5);
          end;
      end;
  end;
  *)
end;

function GetTextLocale(JO: HCkJsonObject): string;
begin
  Result := '';
  try
    case Global.KioskLocale of
      TKioskLocale.klKorean:
        Result := CkJsonObject__stringOf(JO, 'KO');
      TKioskLocale.klJapanese:
        Result := CkJsonObject__stringOf(JO, 'JP');
      TKioskLocale.klChinese:
        Result := CkJsonObject__stringOf(JO, 'CN');
      else
        Result := CkJsonObject__stringOf(JO, 'EN');
    end;
  except
    Result := 'Unknown error';
  end;
end;

function GetTextLocale(const ATextList: array of string): string;
begin
  Result := '';
  if (Length(ATextList) > Ord(TKioskLocale(Global.KioskLocale))) then
    Result := ATextList[Ord(TKioskLocale(Global.KioskLocale))]
  else
  begin
    if (Length(ATextList) > Ord(TKioskLocale.klEnglish)) then
      Result := ATextList[Ord(TKioskLocale.klEnglish)]
    else
      Result := ATextList[Ord(TKioskLocale.klKorean)];
  end;
end;

function GetTicketLabelDirection(const AValue: string): ShortInt;
begin
  if (AValue = 'vertical') then
    Result := Ord(TLabelDirection.ldVertical)
  else
    Result := Ord(TLabelDirection.ldHorizontal);
end;

function GetTicketLabelAlign(const AValue: string): ShortInt;
begin
  if (AValue = 'right') then
    Result := Ord(TLabelAlign.laRight)
  else
    Result := Ord(TLabelAlign.laLeft);
end;

function GetTicketLabelType(const AValue: string): ShortInt;
begin
  if (AValue = 'background') then
    Result := Ord(TLabelType.ltBackground)
  else if (AValue = 'barcode') then
    Result := Ord(TLabelType.ltBarcode)
  else if (AValue = 'qrcode') then
    Result := Ord(TLabelType.ltQRCode)
  else
    Result := Ord(TLabelType.ltText);
end;

{ TTLGlobal }

constructor TTLGlobal.Create;
begin
  inherited;

  VanModule := TVanDaemonModule.Create;
  //VanModule := TVanKcpDaemon.Create;

{$IFDEF PAYCO_VCAT_PERSIST}
  PaycoModule := TPaycoNewModule.Create;
  PaycoModule.SetOpen;
{$ENDIF}
  FormatSettingsKR := TFormatSettings.Create('ko-KR');
  with FormatSettingsKR do
  begin
    DateSeparator := '-';
    TimeSeparator := ':';
    ShortDateFormat := 'yyyy-mm-dd';
    ShortTimeFormat := 'hh:nn:ss';
    LongDateFormat := 'yyyy-mm-dd';
    LongTimeFormat := 'hh:nn:ss';
  end;

  FormatSettingsEN := TFormatSettings.Create('en-US');
  with FormatSettingsEN do
  begin
    DateSeparator := '/';
    TimeSeparator := ':';
    ShortDateFormat := 'mm/dd/yyyy';
    ShortTimeFormat := 'hh:nn:ss';
    LongDateFormat := 'mm/dd/yyyy';
    LongTimeFormat := 'hh:nn:ss';
  end;

  with StoreInfo do
  begin
    PartnerNo := 0;
    CounterId := 0;
    CounterNo := 0;
  end;

  with PluginInfo do
  begin
    DashboardPluginId := 0;
    AdminPluginId := 0;
    MediaPlayerPluginId := 0;
    TicketHomePluginId := 0;
    TicketingPluginId := 0;
    TicketBuyPluginId := 0;
    WaitMsgPluginId := 0;
    BarcodeReadyPluginId := 0;
  end;

  AppFullName := ParamStr(0);
  AppName := ChangeFileExt(ExtractFileName(AppFullName), '');
  HomeDir := IncludeTrailingPathDelimiter(ExtractFilePath(AppFullName));
  PluginDir := HomeDir + 'plugin\';
  ConfigDir := HomeDir + 'config\';
  ContentsDir := HomeDir + 'contents\';
  DataDir := HomeDir + 'data\';
  DownloadDir := HomeDir + 'download\';
  ThemeDir := HomeDir + 'themes\';
  LogDir := HomeDir + 'log\';
  LogFileName := Format('%s%s_%s.log', [LogDir, AppName, FormatDateTime('yyyymmdd', Now, Global.FormatSettingsKR)]);
  ConfigFileName := ConfigDir + AppName + '.config';
  ConfigIni := TIniFile.Create(ConfigFileName);
  LauncherConfigFileName := ConfigDir + CCC_LAUNCHER_NAME + '.config';
  LauncherIni := TIniFile.Create(LauncherConfigFileName);

  ForceDirectories(PluginDir);
  ForceDirectories(ConfigDir);
  ForceDirectories(ContentsDir);
  ForceDirectories(DataDir);
  ForceDirectories(DownloadDir);
  ForceDirectories(ThemeDir);
  ForceDirectories(LogDir);

  LbCipher := TLbCipher.Create;
  ConfigRegistry := TRegistryIniFile.Create(CCC_TICKETLINK_REGISTRY_KEY);
  MainContentList := TList.Create;
  IdleContentList := TList.Create;
  LogList := TStringList.Create;
  LogLimit := 1024;

  ReceiptPrinter := TDeviceConfig.Create;
  BarcodeScanner := TDeviceConfig.Create;
  NFCReader := TDeviceConfig.Create;
  TicketPrinter := TDeviceConfig.Create;
  ICCardReader := TDeviceConfig.Create;

  ReserveList := TObjectList<TReserveItem>.Create(True);
  ProductList := TObjectList<TProductItem>.Create(True);
  RoundList := TObjectList<TRoundItem>.Create(True);
  DenominCategoryList := TObjectList<TDenominCategoryItem>.Create(True);
  DenominList := TObjectList<TDenominItem>.Create(True);
  OrderList := TObjectList<TOrderItem>.Create(True);
  ReceiptInfo := TReceiptInfo.Create;

  CheckRegistry(ConfigRegistry);
  ReadRegistry(ConfigRegistry);
  CheckConfig;
  ReadConfig;

  StoreInfo.KioskIssueTypeCode := ITC_GENERAL;
  StoreInfo.SearchPhoneNo := False;
  StoreInfo.SearchReserveNo := False;
  StoreInfo.ShowTicketingMenu := False;
  StoreInfo.ShowTicketBuyMenu := False;

  ThemeInfo := TThemeInfo.Create;
  ReceiptPrintManager := TReceiptPrintManager.Create(TPrintingDeviceType(ReceiptPrinter.DeviceId));
  ThreadTimer := TThreadTimer.Create;
  ThreadTimer.FreeOnTerminate := True;
  if not ThreadTimer.Started then
    ThreadTimer.Start;

  KioskMode := KSM_NONE;
  PrevKioskMode := KSM_NONE;
end;

destructor TTLGlobal.Destroy;
begin
  VanModule.Free;
{$IFDEF PAYCO_VCAT_PERSIST}
  PaycoModule.Free;
{$ENDIF}
  ReserveList.Free;
  OrderList.Free;
  DenominCategoryList.Free;
  DenominList.Free;
  RoundList.Free;
  ProductList.Free;
  ReceiptInfo.Free;
  ReceiptPrintManager.Free;
  ThreadTimer.Terminate;
  FreeAndNil(LbCipher);
  FreeAndNil(LogList);
  ThemeInfo.Destroy;

  inherited;
end;

procedure TTLGlobal.CheckRegistry(ARegistryIniFile: TRegistryIniFile);
begin
  with ARegistryIniFile do
    try
      if not SectionExists('Server') then
      begin
        WriteString('Server', 'Host', CCC_API_SERVER_HOST);
        WriteString('Server', 'Token', '');
      end;

      if not SectionExists('StoreInfo') then
      begin
        WriteBool('Setting', 'AutoStart', False);
        WriteInteger('StoreInfo', 'PartnerNo', 0);
        WriteInteger('StoreInfo', 'CounterNo', 0);
        WriteString('StoreInfo', 'BizNo', CCC_STORE_BIZNO);
        WriteString('StoreInfo', 'StoreName', CCC_STORE_NAME);
        WriteString('StoreInfo', 'Owner', CCC_STORE_OWNER);
        WriteString('StoreInfo', 'TelNo', CCC_STORE_TELNO);
        WriteString('StoreInfo', 'Address', CCC_STORE_ADDRESS);
        WriteBool('StoreInfo', 'UsePG', True);
        WriteBool('StoreInfo', 'UseDetectCardInsert', True);
        WriteString('StoreInfo', 'VanCode', CCC_KCP_VAN_CD);
        WriteString('StoreInfo', 'VanTID', '');
      end;

      if not SectionExists('PAYCO') then
      begin
        WriteString('PAYCO', 'VanTID', '');
        WriteString('PAYCO', 'Host', CCC_PAYCO_HOST);
        WriteString('PAYCO', 'RegUri', CCC_PAYCO_REG_URI);
        WriteString('PAYCO', 'ApprovalUri', CCC_PAYCO_APPROVAL_URI);
        WriteString('PAYCO', 'CancelUri', CCC_PAYCO_CANCEL_URI);
        WriteString('PAYCO', 'NetCancelUri', CCC_PAYCO_NET_CANCEL_URI);
        WriteString('PAYCO', 'PosTID', '');
        WriteString('PAYCO', 'APIKey', '');
        WriteString('PAYCO', 'MerchantKey', '');
      end;
    except
      on E: Exception do
        AddLog(Format('Global.CheckRegistry.Exception = %s', [E.Message]));
    end;
end;

procedure TTLGlobal.ReadRegistry(ARegistryIniFile: TRegistryIniFile);
begin
  with ARegistryIniFile do
    try
      APIServerInfo.Host := ReadString('Server', 'Host', CCC_API_SERVER_HOST);
      APIServerInfo.Token := LbCipher.GetDecryptedString(ReadString('Server', 'Token', ''));

      AutoStart := ReadBool('StoreInfo', 'AutoStart', False);
      StoreInfo.PartnerNo := ReadInteger('StoreInfo', 'PartnerNo', 0);
      StoreInfo.CounterNo := ReadInteger('StoreInfo', 'CounterNo', 0);
      StoreInfo.BizNo := ReadString('StoreInfo', 'BizNo', '');
      StoreInfo.StoreName := ReadString('StoreInfo', 'StoreName', '');
      StoreInfo.Owner := ReadString('StoreInfo', 'Owner', '');
      StoreInfo.TelNo := ReadString('StoreInfo', 'TelNo', '');
      StoreInfo.Address := ReadString('StoreInfo', 'Address', '');
      StoreInfo.UsePG := ReadBool('StoreInfo', 'UsePG', True);
      StoreInfo.UseDetectCardInsert := ReadBool('StoreInfo', 'UseDetectCardInsert', True);
      StoreInfo.VanCode := ReadString('StoreInfo', 'VanCode', CCC_KCP_VAN_CD);
      StoreInfo.VanTID := ReadString('StoreInfo', 'VanTID', '');
      StoreInfo.SiteCode := ReadString('StoreInfo', 'SiteCode', '');

      StoreInfo.PaycoVanTID := ReadString('PAYCO', 'VanTID', '');
      StoreInfo.PaycoHost := ReadString('PAYCO', 'Host', '');
      StoreInfo.PaycoUriReg := ReadString('PAYCO', 'RegUri', '');
      StoreInfo.PaycoUriApproval := ReadString('PAYCO', 'ApprovalUri', '');
      StoreInfo.PaycoUriCancel := ReadString('PAYCO', 'CancelUri', '');
      StoreInfo.PaycoUriNetCancel := ReadString('PAYCO', 'NetCancelUri', '');
      StoreInfo.PaycoPosTID := ReadString('PAYCO', 'PosTID', '');
      StoreInfo.PaycoAPIKey := LbCipher.GetDecryptedString(ReadString('PAYCO', 'APIKey', ''));
      StoreInfo.PaycoMerchantKey := ReadString('PAYCO', 'MerchantKey', '');
    except
      on E: Exception do
        AddLog(Format('Global.ReadRegistry.Exception = %s', [E.Message]));
    end;
end;

procedure TTLGlobal.CheckConfig;
begin
  // ================================================================================================
  // 런처
  // ================================================================================================
  with LauncherIni do
  begin
    { 업데이트 설정 }
    if not SectionExists('Config') then
    begin
      WriteString('Config', 'UpdateURL', CCC_CDN_SERVER_HOST);
      WriteString('Config', 'RunApp', AppName + '.exe');
      WriteString('Config', 'Params', '');
      WriteInteger('Config', 'Delay', 0);
      WriteInteger('Config', 'WatchInterval', 30);
      WriteBool('Config', 'RebootWhenUpdated', False);
      WriteString('Config', 'ExtAppList', '');
    end;
  end;

  if not FileExists(ConfigFileName) then
  begin
    WriteToFile(ConfigFileName, ';*****[ 범례 ]*****');
    WriteToFile(ConfigFileName, '; 항목사용 = 0:아니오, 1:예');
    WriteToFile(ConfigFileName, '; 표시언어(Locale) = 0:한국어(기본값), 1:English, 2:日本語(지원 불가), 3:中文(지원 불가)');
    WriteToFile(ConfigFileName, ';******************');
    WriteToFile(ConfigFileName, '');
  end;

  // ================================================================================================
  // 시스템 환경 설정
  // ================================================================================================
  with ConfigIni do
  begin
    { 일반 설정 }
    if not SectionExists('Config') then
    begin
      WriteString('Config', 'LastUpdated', '');
      WriteInteger('Config', 'Locale', Ord(TKioskLocale.klKorean));
      WriteInteger('Config', 'BaseTop', 0);
      WriteInteger('Config', 'BaseLeft', 0);
      WriteInteger('Config', 'BaseHeight', 1920);
      WriteInteger('Config', 'BaseWidth', 1080);
      WriteInteger('Config', 'BaseHeight', 1920);
      WriteInteger('Config', 'WaitingIdleSeconds', 60);
      WriteBool('Config', 'ShowDesktopIcons', True);
      WriteBool('Config', 'ShowTaskBar', False);
      WriteBool('Config', 'ShowCursor', False);
      WriteString('Config', 'AutoRebootTime', '04:00');
      WriteToFile(ConfigFileName, '');
    end;

    { 플러그인 설정 }
    if not SectionExists('Plugin') then
    begin
      WriteString('Plugin', 'StartPlugin', CCC_START_PLUGIN);
      WriteToFile(ConfigFileName, '');
    end;

    { 슬라이드쇼 }
    if not SectionExists('SlideShow') then
    begin
      WriteInteger('SlideShow', 'Transition', 0);
      WriteToFile(ConfigFileName, '');
    end;

    { 부가이용권 }
    if not SectionExists('AddonTicket') then
    begin
      WriteBool('AddonTicket', 'BenefitCoupon', False);
      WriteInteger('AddonTicket', 'Copies', 1);
      WriteToFile(ConfigFileName, '');
    end;

    { 보안IC 카드 리더 }
    if not SectionExists('ICCardReader') then
    begin
      WriteBool('ICCardReader', 'Enabled', False);
      WriteInteger('ICCardReader', 'DeviceId', 0);
      WriteInteger('ICCardReader', 'Port', 0);
      WriteInteger('ICCardReader', 'Baudrate', 9600);
      WriteToFile(ConfigFileName, '');
    end;

    { 바코드 스캐너 }
    if not SectionExists('BarcodeScanner') then
    begin
      WriteBool('BarcodeScanner', 'Enabled', False);
      WriteInteger('BarcodeScanner', 'Port', 0);
      WriteInteger('BarcodeScanner', 'Baudrate', 9600);
      WriteToFile(ConfigFileName, '');
    end;

    { NFC 리더 }
    if not SectionExists('NFCReader') then
    begin
      WriteBool('NFCReader', 'Enabled', False);
      WriteInteger('NFCReader', 'Port', 0);
      WriteInteger('NFCReader', 'Baudrate', 9600);
      WriteToFile(ConfigFileName, '');
    end;

    { 영수증 프린터 }
    if not SectionExists('ReceiptPrinter') then
    begin
      WriteBool('ReceiptPrinter', 'Enabled', False);
      WriteInteger('ReceiptPrinter', 'DeviceId', 0);
      WriteInteger('ReceiptPrinter', 'Copies', 1);
      WriteInteger('ReceiptPrinter', 'Port', 0);
      WriteInteger('ReceiptPrinter', 'Baudrate', 9600);
      WriteBool('ReceiptPrinter', 'CheckDevicePerEach', False);
      WriteBool('ReceiptPrinter', 'CheckStatusAll', False);
      WriteBool('ReceiptPrinter', 'CheckStatusPrinter', False);
      WriteBool('ReceiptPrinter', 'CheckStatusCover', True);
      WriteBool('ReceiptPrinter', 'CheckStatusTransmit', False);
      WriteBool('ReceiptPrinter', 'CheckStatusPaper', True);
      WriteToFile(ConfigFileName, '');
    end;
    if not ValueExists('ReceiptPrinter', 'CheckDevicePerEach') then
    begin
      WriteBool('ReceiptPrinter', 'CheckDevicePerEach', False);
      WriteBool('ReceiptPrinter', 'CheckStatusAll', False);
      WriteBool('ReceiptPrinter', 'CheckStatusPrinter', False);
      WriteBool('ReceiptPrinter', 'CheckStatusCover', True);
      WriteBool('ReceiptPrinter', 'CheckStatusTransmit', False);
      WriteBool('ReceiptPrinter', 'CheckStatusPaper', True);
    end;

    { 티켓 프린터 }
    if not SectionExists('TicketPrinter') then
    begin
      WriteBool('TicketPrinter', 'Enabled', False);
      WriteInteger('TicketPrinter', 'DeviceId', 0);
      WriteInteger('TicketPrinter', 'Copies', 1);
      WriteInteger('TicketPrinter', 'Port', 0);
      WriteInteger('TicketPrinter', 'Baudrate', 9600);
      WriteBool('TicketPrinter', 'CheckDevicePerEach', False);
      WriteBool('TicketPrinter', 'CheckStatusAll', False);
      WriteBool('TicketPrinter', 'CheckStatusPrinter', False);
      WriteBool('TicketPrinter', 'CheckStatusCover', True);
      WriteBool('TicketPrinter', 'CheckStatusTransmit', False);
      WriteBool('TicketPrinter', 'CheckStatusPaper', True);
      WriteToFile(ConfigFileName, '');
    end;
    if not ValueExists('TicketPrinter', 'CheckDevicePerEach') then
    begin
      WriteBool('TicketPrinter', 'CheckDevicePerEach', False);
      WriteBool('TicketPrinter', 'CheckStatusAll', False);
      WriteBool('TicketPrinter', 'CheckStatusPrinter', False);
      WriteBool('TicketPrinter', 'CheckStatusCover', True);
      WriteBool('TicketPrinter', 'CheckStatusTransmit', False);
      WriteBool('TicketPrinter', 'CheckStatusPaper', True);
    end;
  end;
end;

procedure TTLGlobal.ReadConfig;
begin
  with ConfigIni do
  begin
    { 일반 설정 }
    ConfigUpdated := ReadString('Config', 'LastUpdated', '');
    KioskLocale := TKioskLocale(ReadInteger('Config', 'Locale', Ord(TKioskLocale.klKorean)));
    BaseScreenTop := ReadInteger('Config', 'BaseTop', 0);
    BaseScreenLeft := ReadInteger('Config', 'BaseLeft', 0);
    BaseScreenHeight := ReadInteger('Config', 'BaseHeight', 1920);
    BaseScreenWidth := ReadInteger('Config', 'BaseWidth', 1080);
    WaitingIdleSeconds := ReadInteger('Config', 'WaitingIdleSeconds', 60);
    ShowDesktopIcons := ReadBool('Config', 'ShowDesktopIcons', True);
    ShowTaskBar := ReadBool('Config', 'ShowTaskBar', True);
    ShowCursor := ReadBool('Config', 'ShowCursor', True);
    AutoRebootTime := ReadString('Config', 'AutoRebootTime', '');

    { 플러그인 설정 }
    PluginInfo.StartPluginName := ReadString('Plugin', 'StartPlugin', CCC_START_PLUGIN);

    { 슬라이드쇼 }
    ReadInteger('SlideShow', 'Transition', 0);

    { 부가 이용권 }
    AddonTicket.BenefitCoupon := ReadBool('AddonTicket', 'BenefitCoupon', False);
    AddonTicket.Copies := ReadInteger('AddonTicket', 'Copies', 1);

    { 보안IC 카드 리더 }
    ICCardReader.Enabled := ReadBool('ICCardReader', 'Enabled', False);
    ICCardReader.DeviceId := ReadInteger('ICCardReader', 'DeviceId', 0);
    ICCardReader.Port := ReadInteger('ICCardReader', 'Port', 0);
    ICCardReader.Baudrate := ReadInteger('ICCardReader', 'Baudrate', 9600);

    { 바코드 스캐너 }
    BarcodeScanner.Enabled := ReadBool('BarcodeScanner', 'Enabled', False);
    BarcodeScanner.Port := ReadInteger('BarcodeScanner', 'Port', 0);
    BarcodeScanner.Baudrate := ReadInteger('BarcodeScanner', 'Baudrate', 9600);

    { NFC 카드 리더 }
    NFCReader.Enabled := ReadBool('NFCReader', 'Enabled', False);
    NFCReader.DeviceId := ReadInteger('NFCReader', 'DeviceId', 0);
    NFCReader.Port := ReadInteger('NFCReader', 'Port', 0);
    NFCReader.Baudrate := ReadInteger('NFCReader', 'Baudrate', 9600);

    { 영수증 프린터 }
    ReceiptPrinter.Enabled := ReadBool('ReceiptPrinter', 'Enabled', False);
    ReceiptPrinter.DeviceId := ReadInteger('ReceiptPrinter', 'DeviceId', 0);
    ReceiptPrinter.Copies := ReadInteger('ReceiptPrinter', 'Copies', 1);
    ReceiptPrinter.Port := ReadInteger('ReceiptPrinter', 'Port', 0);
    ReceiptPrinter.Baudrate := ReadInteger('ReceiptPrinter', 'Baudrate', 9600);
    ReceiptPrinter.CheckDevicePerEach := ReadBool('ReceiptPrinter', 'CheckDevicePerEach', False);
    ReceiptPrinter.CheckStatusAll := ReadBool('ReceiptPrinter', 'CheckStatusAll', False);
    ReceiptPrinter.CheckStatusPrinter := ReadBool('ReceiptPrinter', 'CheckStatusPrinter', False);
    ReceiptPrinter.CheckStatusCover := ReadBool('ReceiptPrinter', 'CheckStatusCover', True);
    ReceiptPrinter.CheckStatusTransmit := ReadBool('ReceiptPrinter', 'CheckStatusTransmit', False);
    ReceiptPrinter.CheckStatusPaper := ReadBool('ReceiptPrinter', 'CheckStatusPaper', True);

    { 티켓 프린터 }
    TicketPrinter.Enabled := ReadBool('TicketPrinter', 'Enabled', False);
    TicketPrinter.DeviceId := ReadInteger('TicketPrinter', 'DeviceId', 0);
    TicketPrinter.Copies := ReadInteger('TicketPrinter', 'Copies', 1);
    TicketPrinter.Port := ReadInteger('TicketPrinter', 'Port', 0);
    TicketPrinter.Baudrate := ReadInteger('TicketPrinter', 'Baudrate', 9600);
    TicketPrinter.CheckDevicePerEach := ReadBool('TicketPrinter', 'CheckDevicePerEach', False);
    TicketPrinter.CheckStatusAll := ReadBool('TicketPrinter', 'CheckStatusAll', False);
    TicketPrinter.CheckStatusPrinter := ReadBool('TicketPrinter', 'CheckStatusPrinter', False);
    TicketPrinter.CheckStatusCover := ReadBool('TicketPrinter', 'CheckStatusCover', True);
    TicketPrinter.CheckStatusTransmit := ReadBool('TicketPrinter', 'CheckStatusTransmit', False);
    TicketPrinter.CheckStatusPaper := ReadBool('TicketPrinter', 'CheckStatusPaper', True);
  end;
end;

procedure TTLGlobal.SetKioskLocale(const AValue: TKioskLocale);
var
  PM: TPluginMessage;
begin
  if (FKioskLocale <> AValue) then
  begin
    FKioskLocale := AValue;
    PM := TPluginMessage.Create(nil);
    with PM do
    try
      Command := CPC_SET_LOCALE;
      AddParams(CPP_OWNER_ID, 0);
      AddParams(CPP_VALUE, Ord(AValue));
      PluginMessageToID(PluginInfo.TicketHomePluginId);
      PluginMessageToID(PluginInfo.TicketingPluginId);
      PluginMessageToID(PluginInfo.TicketBuyPluginId);
    finally
      FreeAndNil(PM);
    end;
  end;
end;

procedure TTLGlobal.SetKioskMode(const AKioskMode: Integer);
var
  PM: TPluginMessage;
begin
  PrevKioskMode := FKioskMode;
  FKioskMode := AKioskMode;
  try
    if (FKioskMode = KSM_NONE) then
      Exit;
    AddLog(Format('Global.SetKioskMode.Change = %s -> %s', [KSM_NAMES[FPrevKioskMode], KSM_NAMES[AKioskMode]]));
    PM := TPluginMessage.Create(nil);
    with PM do
    try
      Command := CPC_SET_KIOSK_MODE;
      AddParams(CPP_OWNER_ID, 0);
      AddParams(CPP_VALUE, FKioskMode);
      PluginMessageToID(PluginInfo.DashboardPluginId);
      PluginMessageToID(PluginInfo.TicketingPluginId);
      PluginMessageToID(PluginInfo.TicketBuyPluginId);
      PluginMessageToID(PluginInfo.BarcodeReadyPluginId);
      PluginMessageToID(PluginInfo.MediaPlayerPluginId);
      PluginMessageToID(PluginInfo.TicketHomePluginId);
    finally
      FreeAndNil(PM);
    end;
  except
    on E: Exception do
      AddLog(Format('Global.SetKioskMode.Exception = %s', [E.Message]));
  end;
end;

procedure TTLGlobal.SetPaymentProgress(const AValue: Boolean);
begin
  ThreadTimer.LastIdleRun := Now;
  FPaymentProgress := AValue;
end;

procedure TTLGlobal.SetPrintingProgress(const AValue: Boolean);
begin
  ThreadTimer.LastIdleRun := Now;
  FPaymentProgress := AValue;
end;

procedure TTLGlobal.ResetLogFile;
begin
  LogFileName := Format(LogDir + AppName + '_%s.log', [CurrentDate]);
  PaymentLogFileName := Format(LogDir + AppName + '_Payment_%s.log', [CurrentDate]);
end;

procedure TTLGlobal.OnCxButtonCustomDraw(Sender: TObject; ACanvas: TcxCanvas; AViewInfo: TcxButtonViewInfo; var AHandled: Boolean);
begin
  if (AViewInfo.State in [cxbsNormal, cxbsHot]) then
  begin
    ACanvas.Font := (Sender as TcxButton).Font;
    AViewInfo.Painter.LookAndFeelPainter.DrawButton(ACanvas, AViewInfo.ButtonRect, (Sender as TcxButton).Caption,
      cxbsHot, False, (Sender as TcxButton).Colors.Normal, (Sender as TcxButton).Colors.NormalText, (Sender as TcxButton).WordWrap, False);
  end
  else if (AViewInfo.State in [cxbsPressed]) then
  begin
    ACanvas.Font := (Sender as TcxButton).Font;
    AViewInfo.Painter.LookAndFeelPainter.DrawButton(ACanvas, AViewInfo.ButtonRect, (Sender as TcxButton).Caption,
      cxbsPressed, False, (Sender as TcxButton).Colors.Pressed, (Sender as TcxButton).Colors.PressedText, (Sender as TcxButton).WordWrap, False);
  end
  else if (AViewInfo.State in [cxbsDisabled]) then
  begin
    ACanvas.Font := (Sender as TcxButton).Font;
    AViewInfo.Painter.LookAndFeelPainter.DrawButton(ACanvas, AViewInfo.ButtonRect, (Sender as TcxButton).Caption,
      cxbsDisabled, False, (Sender as TcxButton).Colors.Disabled, (Sender as TcxButton).Colors.NormalText, (Sender as TcxButton).WordWrap, False);
  end;
  AHandled := True;
end;

{ TDeviceConfig }

constructor TDeviceConfig.Create;
begin
  inherited;

  ComDevice := TComPort.Create(nil);
  FReadData := '';
end;

destructor TDeviceConfig.Destroy;
begin
  ComDevice.Close;
  ComDevice.Free;

  inherited;
end;

procedure TDeviceConfig.SetOwnerId(const AValue: Integer);
begin
  if (FOwnerId <> AValue) then
  begin
    FReadData := '';
    FOwnerId := AValue;
  end;
end;

{ TThemeInfo }

constructor TThemeInfo.Create;
begin
  Loaded := False;
  ItemList := TStringList.Create;

  // 기본값 (Dark Theme)
  with Self.Colors do
  begin
    primary := $002828FA;
    black := $00E7E7E7;
    white := $00302519;
    background1 := $00302519;
    background2 := $00473727;
    background3 := $00261D14;
    type1 := $002828FA;
    type2 := $00E7E7E7;
    type3 := $00C1BDBB;
    type4 := $0082776F;
    type5 := $00C1BDBB;
    line1 := $002828FA;
    line2 := $004D413A;
    line3 := $0076675D;
    line4 := $00453B30;

    btn_face_default := $00593F2E;
    btn_face_pressed := $006D5646;
    btn_face_disabled := $003C332B;
    btn_font_default := $00F1EBE8;
    btn_font_pressed := $00F1EBE8;
    btn_font_disabled := $004D413A;

    grpbtn_face_default := $00685041;
    grpbtn_face_pressed := $00866754;
    grpbtn_face_disabled := $0054473C;
    grpbtn_face_active_default := $003128FA;
    grpbtn_face_active_pressed := $002020C8;
    grpbtn_face_active_disabled := $003C332B;
    grpbtn_font_default := $00E7E7E7;
    grpbtn_font_pressed := $00E7E7E7;
    grpbtn_font_disabled := $0082776F;
    grpbtn_font_active_default := $00EFEFF8;
    grpbtn_font_active_pressed := $00EFEFF8;
    grpbtn_font_active_disabled := $004D413A;

    input_border_default := $0076675D;
    input_border_entered := $002828FA;
    input_border_disabled := $004D413A;
    input_face_default := $00302519;
    input_face_entered := $00302519;
    input_face_disabled := $00291F15;
    input_font_default := $0082776F;
    input_font_entered := $00E7E7E7;
    input_font_disabled := $004D413A;

    keypad_face_default := $0048372B;
    keypad_face_pressed := $006D5646;
    keypad_font_default := $00E7E7E7;
    keypad_font_pressed := $00E7E7E7;

    panel_border_default := $004D413A;
    panel_border_pressed := $002828FA;
    panel_border_disabled := $004D413A;
    panel_border_soldout := $001E1711;
    panel_face_default := $00433325;
    panel_face_pressed := $00433325;
    panel_face_disabled := $00291F15;
    panel_face_soldout := $001E1711;
    panel_font_default := $00E7E7E7;
    panel_font_pressed := $002828FA;
    panel_font_disabled := $00585047;
    panel_font_soldout := $00585047;
  end;

  with Self.Images do
  begin
{$IFDEF USE_ANIGIF}
    ani_barcode.Stream := TMemoryStream.Create;
    ani_barcode_payco.Stream := TMemoryStream.Create;
    ani_creditcard_input.Stream := TMemoryStream.Create;
    ani_creditcard_output.Stream := TMemoryStream.Create;
    ani_creditcard_swipe.Stream := TMemoryStream.Create;
    ani_loading.Stream := TMemoryStream.Create;
    ani_payco_pin_input.Stream := TMemoryStream.Create;
    ani_payment_completed.Stream := TMemoryStream.Create;
    ani_ticket_printing.Stream := TMemoryStream.Create;
    ani_tmoney_tagging.Stream := TMemoryStream.Create;
{$ELSE}
    ani_barcode.ImageList := TcxImageList.Create(nil);
    ani_barcode.ImageList.Width := 580;
    ani_barcode.ImageList.Height := 300;
    ani_barcode_payco.ImageList := TcxImageList.Create(nil);
    ani_barcode_payco.ImageList.Width := 580;
    ani_barcode_payco.ImageList.Height := 300;
    ani_creditcard_input.ImageList := TcxImageList.Create(nil);
    ani_creditcard_input.ImageList.Width := 580;
    ani_creditcard_input.ImageList.Height := 300;
    ani_creditcard_output.ImageList := TcxImageList.Create(nil);
    ani_creditcard_output.ImageList.Width := 580;
    ani_creditcard_output.ImageList.Height := 300;
    ani_creditcard_swipe.ImageList := TcxImageList.Create(nil);
    ani_creditcard_swipe.ImageList.Width := 580;
    ani_creditcard_swipe.ImageList.Height := 300;
    ani_loading.ImageList := TcxImageList.Create(nil);
    ani_loading.ImageList.Width := 120;
    ani_loading.ImageList.Height := 120;
    ani_payco_pin_input.ImageList := TcxImageList.Create(nil);
    ani_payco_pin_input.ImageList.Width := 384;
    ani_payco_pin_input.ImageList.Height := 564;
    ani_payment_completed.ImageList := TcxImageList.Create(nil);
    ani_payment_completed.ImageList.Width := 580;
    ani_payment_completed.ImageList.Height := 300;
    ani_ticket_printing.ImageList := TcxImageList.Create(nil);
    ani_ticket_printing.ImageList.Width := 580;
    ani_ticket_printing.ImageList.Height := 300;
    ani_tmoney_tagging.ImageList := TcxImageList.Create(nil);
    ani_tmoney_tagging.ImageList.Width := 580;
    ani_tmoney_tagging.ImageList.Height := 300;
{$ENDIF}
    btn_arrow_left_default.Stream := TMemoryStream.Create;
    btn_arrow_left_pressed.Stream := TMemoryStream.Create;
    btn_arrow_left_disabled.Stream := TMemoryStream.Create;
    btn_arrow_right_default.Stream := TMemoryStream.Create;
    btn_arrow_right_pressed.Stream := TMemoryStream.Create;
    btn_arrow_right_disabled.Stream := TMemoryStream.Create;
    btn_delete_default.Stream := TMemoryStream.Create;
    btn_delete_pressed.Stream := TMemoryStream.Create;
    btn_delete_disabled.Stream := TMemoryStream.Create;
    btn_minus_default.Stream := TMemoryStream.Create;
    btn_minus_pressed.Stream := TMemoryStream.Create;
    btn_minus_disabled.Stream := TMemoryStream.Create;
    btn_plus_default.Stream := TMemoryStream.Create;
    btn_plus_pressed.Stream := TMemoryStream.Create;
    btn_plus_disabled.Stream := TMemoryStream.Create;
    btn_ticket_background.Stream := TMemoryStream.Create;
    btn_ticket_printing_default.Stream := TMemoryStream.Create;
    btn_ticket_printing_default_kor.Stream := TMemoryStream.Create;
    btn_ticket_printing_default_eng.Stream := TMemoryStream.Create;
    btn_ticket_printing_default_jpn.Stream := TMemoryStream.Create;
    btn_ticket_printing_default_chn.Stream := TMemoryStream.Create;
    //btn_ticket_printing_pressed.Stream := TMemoryStream.Create;
    btn_ticket_purchase_default.Stream := TMemoryStream.Create;
    btn_ticket_purchase_default_kor.Stream := TMemoryStream.Create;
    btn_ticket_purchase_default_eng.Stream := TMemoryStream.Create;
    btn_ticket_purchase_default_jpn.Stream := TMemoryStream.Create;
    btn_ticket_purchase_default_chn.Stream := TMemoryStream.Create;
    //btn_ticket_purchase_pressed.Stream := TMemoryStream.Create;

    ico_alert.Stream := TMemoryStream.Create;
    ico_back.Stream := TMemoryStream.Create;
    ico_calendar.Stream := TMemoryStream.Create;
    ico_complete.Stream := TMemoryStream.Create;
    ico_home.Stream := TMemoryStream.Create;
    ico_keypad_delete.Stream := TMemoryStream.Create;
    ico_locale_chn.Stream := TMemoryStream.Create;
    ico_locale_eng.Stream := TMemoryStream.Create;
    ico_locale_jpn.Stream := TMemoryStream.Create;
    ico_locale_kor.Stream := TMemoryStream.Create;
    ico_refresh.Stream := TMemoryStream.Create;
    ico_partner.Stream := TMemoryStream.Create;
    ico_ticketlink.Stream := TMemoryStream.Create;
    ico_ticketlink_en.Stream := TMemoryStream.Create;
    ico_ticket.Stream := TMemoryStream.Create;
    ico_ticket_printing.Stream := TMemoryStream.Create;
    ico_ticket_purchase.Stream := TMemoryStream.Create;

    img_player_back.Stream :=  TMemoryStream.Create;
    img_player_back_full.Stream :=  TMemoryStream.Create;
  end;
end;

destructor TThemeInfo.Destroy;
begin
  FreeAndNil(ItemList);
  ClearImageStreams;
  with Self.Images do
  begin
{$IFDEF USE_ANIGIF}
    FreeAndNil(ani_barcode.Stream);
    FreeAndNil(ani_barcode_payco.Stream);
    FreeAndNil(ani_creditcard_input.Stream);
    FreeAndNil(ani_creditcard_output.Stream);
    FreeAndNil(ani_creditcard_swipe.Stream);
    FreeAndNil(ani_loading.Stream);
    FreeAndNil(ani_payco_pin_input.Stream);
    FreeAndNil(ani_payment_completed.Stream);
    FreeAndNil(ani_ticket_printing.Stream);
    FreeAndNil(ani_tmoney_tagging.Stream);
{$ELSE}
    FreeAndNil(ani_barcode.ImageList);
    FreeAndNil(ani_barcode_payco.ImageList);
    FreeAndNil(ani_creditcard_input.ImageList);
    FreeAndNil(ani_creditcard_output.ImageList);
    FreeAndNil(ani_creditcard_swipe.ImageList);
    FreeAndNil(ani_loading.ImageList);
    FreeAndNil(ani_payco_pin_input.ImageList);
    FreeAndNil(ani_payment_completed.ImageList);
    FreeAndNil(ani_ticket_printing.ImageList);
    FreeAndNil(ani_tmoney_tagging.ImageList);
{$ENDIF}
    FreeAndNil(btn_arrow_left_default.Stream);
    FreeAndNil(btn_arrow_left_pressed.Stream);
    FreeAndNil(btn_arrow_left_disabled.Stream);
    FreeAndNil(btn_arrow_right_default.Stream);
    FreeAndNil(btn_arrow_right_pressed.Stream);
    FreeAndNil(btn_arrow_right_disabled.Stream);
    FreeAndNil(btn_delete_default.Stream);
    FreeAndNil(btn_delete_pressed.Stream);
    FreeAndNil(btn_delete_disabled.Stream);
    FreeAndNil(btn_minus_default.Stream);
    FreeAndNil(btn_minus_pressed.Stream);
    FreeAndNil(btn_minus_disabled.Stream);
    FreeAndNil(btn_plus_default.Stream);
    FreeAndNil(btn_plus_pressed.Stream);
    FreeAndNil(btn_plus_disabled.Stream);
    FreeAndNil(btn_ticket_background.Stream);
    FreeAndNil(btn_ticket_printing_default.Stream);
    FreeAndNil(btn_ticket_printing_default_kor.Stream);
    FreeAndNil(btn_ticket_printing_default_eng.Stream);
    FreeAndNil(btn_ticket_printing_default_jpn.Stream);
    FreeAndNil(btn_ticket_printing_default_chn.Stream);
    //FreeAndNil(btn_ticket_printing_pressed.Stream);
    FreeAndNil(btn_ticket_purchase_default.Stream);
    FreeAndNil(btn_ticket_purchase_default_kor.Stream);
    FreeAndNil(btn_ticket_purchase_default_eng.Stream);
    FreeAndNil(btn_ticket_purchase_default_jpn.Stream);
    FreeAndNil(btn_ticket_purchase_default_chn.Stream);
    //FreeAndNil(btn_ticket_purchase_pressed.Stream);
    FreeAndNil(ico_alert.Stream);
    FreeAndNil(ico_back.Stream);
    FreeAndNil(ico_locale_chn.Stream);
    FreeAndNil(ico_locale_eng.Stream);
    FreeAndNil(ico_locale_jpn.Stream);
    FreeAndNil(ico_locale_kor.Stream);
    FreeAndNil(ico_calendar.Stream);
    FreeAndNil(ico_complete.Stream);
    FreeAndNil(ico_home.Stream);
    FreeAndNil(ico_keypad_delete.Stream);
    FreeAndNil(ico_refresh.Stream);
    FreeAndNil(ico_ticketlink.Stream);
    FreeAndNil(ico_ticketlink_en.Stream);
    FreeAndNil(ico_ticket.Stream);
    FreeAndNil(ico_ticket_printing.Stream);
    FreeAndNil(ico_ticket_purchase.Stream);
    FreeAndNil(img_player_back.Stream);
    FreeAndNil(img_player_back_full.Stream);
  end;

  inherited;
end;

procedure TThemeInfo.LoadTheme(const AThemeCode: string);
const
  LC_THEME_JSON_FILE = 'theme.json';
var
  ZA: I7zInArchive;
  SS: TStringStream;
  JO: HCkJsonObject;
  LJsonLoaded: Boolean;
  LThemeCode, LThemeFile, LFolder: string;
begin
  if (CurrentThemeCode = AThemeCode) then
  begin
    Loaded := True;
    Exit;
  end;

  // 테마 코드가 'DARK' 또는 'WHITE'가 아니면 'BASE'
  LThemeCode := AThemeCode;
  if (AThemeCode = TME_THEME_DARK) then
    LThemeFile := TME_THEME_ARCHIVE_DARK
  else if (AThemeCode = TME_THEME_WHITE) then
    LThemeFile := TME_THEME_ARCHIVE_WHITE
  else
  begin
    LThemeCode := TME_THEME_BASE;
    LThemeFile := TME_THEME_ARCHIVE_BASE;
  end;

  Global.ThreadTimer.CheckIdle := False;
  Loaded := False;
  LastError := '';
  ZA := CreateInArchive(CLSID_CFormatZip);
  JO := CkJsonObject_Create;
  try
    try
      if not FileExists(Global.ThemeDir + LThemeFile) then
        raise Exception.Create('테마 파일을 찾을 수 없습니다.' + _CRLF + LThemeFile);

      ZA.SetPassword(CCC_TICKETLINK_HOTLINE);
      ZA.OpenFile(Global.ThemeDir + LThemeFile);
      LJsonLoaded := False;
      for var I := 0 to Pred(ZA.NumberOfItems) do
      begin
        ItemList.Add(ZA.ItemPath[I]);
        if (ZA.ItemPath[I] = LC_THEME_JSON_FILE) then
        begin
          SS := TStringStream.Create;
          try
            ZA.ExtractItem(I, SS, False);
            if not CkJsonObject_Load(JO, PWideChar(SS.DataString)) then
              raise Exception.Create(CkJsonObject__lastErrorText(JO));

            CkJsonObject_WriteFile(JO, PWideChar(Global.LogDir + 'Theme.json'));
            LJsonLoaded := True;
          finally
            FreeAndNil(SS);
          end;
        end;
      end;
      ItemList.SaveToFile(Global.LogDir + 'ThemeFiles.log');

      if not LJsonLoaded then
        raise Exception.Create('Error Message');

      ClearImageStreams;
      Title := CkJsonObject__stringOf(JO, 'title');
      Version := CkJsonObject_IntOf(JO, 'version');
      //LDate: string := CkJsonObject__stringOf(JO, 'updated');
      Updated := StrToDateTime(CkJsonObject__stringOf(JO, 'updated'), Global.FormatSettingsKR);

      with Self.Colors do
      begin
        primary := HTML2Color(CkJsonObject__stringOf(JO, 'colors.primary'));
        black := HTML2Color(CkJsonObject__stringOf(JO, 'colors.black'));
        white := HTML2Color(CkJsonObject__stringOf(JO, 'colors.white'));
        background1 := HTML2Color(CkJsonObject__stringOf(JO, 'colors.background1'));
        background2 := HTML2Color(CkJsonObject__stringOf(JO, 'colors.background2'));
        background3 := HTML2Color(CkJsonObject__stringOf(JO, 'colors.background3'));
        type1 := HTML2Color(CkJsonObject__stringOf(JO, 'colors.type1'));
        type2 := HTML2Color(CkJsonObject__stringOf(JO, 'colors.type2'));
        type3 := HTML2Color(CkJsonObject__stringOf(JO, 'colors.type3'));
        type4 := HTML2Color(CkJsonObject__stringOf(JO, 'colors.type4'));
        type5 := HTML2Color(CkJsonObject__stringOf(JO, 'colors.type5'));
        line1 := HTML2Color(CkJsonObject__stringOf(JO, 'colors.line1'));
        line2 := HTML2Color(CkJsonObject__stringOf(JO, 'colors.line2'));
        line3 := HTML2Color(CkJsonObject__stringOf(JO, 'colors.line3'));
        line4 := HTML2Color(CkJsonObject__stringOf(JO, 'colors.line4'));
        btn_face_default := HTML2Color(CkJsonObject__stringOf(JO, 'colors.btn_face_default'));
        btn_face_pressed := HTML2Color(CkJsonObject__stringOf(JO, 'colors.btn_face_pressed'));
        btn_face_disabled := HTML2Color(CkJsonObject__stringOf(JO, 'colors.btn_face_disabled'));
        btn_font_default := HTML2Color(CkJsonObject__stringOf(JO, 'colors.btn_font_default'));
        btn_font_pressed := HTML2Color(CkJsonObject__stringOf(JO, 'colors.btn_font_pressed'));
        btn_font_disabled := HTML2Color(CkJsonObject__stringOf(JO, 'colors.btn_font_disabled'));
        grpbtn_face_default := HTML2Color(CkJsonObject__stringOf(JO, 'colors.grpbtn_face_default'));
        grpbtn_face_pressed := HTML2Color(CkJsonObject__stringOf(JO, 'colors.grpbtn_face_pressed'));
        grpbtn_face_disabled := HTML2Color(CkJsonObject__stringOf(JO, 'colors.grpbtn_face_disabled'));
        grpbtn_face_active_default := HTML2Color(CkJsonObject__stringOf(JO, 'colors.grpbtn_face_active_default'));
        grpbtn_face_active_pressed := HTML2Color(CkJsonObject__stringOf(JO, 'colors.grpbtn_face_active_pressed'));
        grpbtn_face_active_disabled := HTML2Color(CkJsonObject__stringOf(JO, 'colors.grpbtn_face_active_disabled'));
        grpbtn_font_default := HTML2Color(CkJsonObject__stringOf(JO, 'colors.grpbtn_font_default'));
        grpbtn_font_pressed := HTML2Color(CkJsonObject__stringOf(JO, 'colors.grpbtn_font_pressed'));
        grpbtn_font_disabled := HTML2Color(CkJsonObject__stringOf(JO, 'colors.grpbtn_font_disabled'));
        grpbtn_font_active_default := HTML2Color(CkJsonObject__stringOf(JO, 'colors.grpbtn_font_active_default'));
        grpbtn_font_active_pressed := HTML2Color(CkJsonObject__stringOf(JO, 'colors.grpbtn_font_active_pressed'));
        grpbtn_font_active_disabled := HTML2Color(CkJsonObject__stringOf(JO, 'colors.grpbtn_font_active_disabled'));
        input_border_default := HTML2Color(CkJsonObject__stringOf(JO, 'colors.input_border_default'));
        input_border_entered := HTML2Color(CkJsonObject__stringOf(JO, 'colors.input_border_entered'));
        input_border_disabled := HTML2Color(CkJsonObject__stringOf(JO, 'colors.input_border_disabled'));
        input_face_default := HTML2Color(CkJsonObject__stringOf(JO, 'colors.input_face_default'));
        input_face_entered := HTML2Color(CkJsonObject__stringOf(JO, 'colors.input_face_entered'));
        input_face_disabled := HTML2Color(CkJsonObject__stringOf(JO, 'colors.input_face_disabled'));
        input_font_default := HTML2Color(CkJsonObject__stringOf(JO, 'colors.input_font_default'));
        input_font_entered := HTML2Color(CkJsonObject__stringOf(JO, 'colors.input_font_entered'));
        input_font_disabled := HTML2Color(CkJsonObject__stringOf(JO, 'colors.input_font_disabled'));
        keypad_face_default := HTML2Color(CkJsonObject__stringOf(JO, 'colors.keypad_face_default'));
        keypad_face_pressed := HTML2Color(CkJsonObject__stringOf(JO, 'colors.keypad_face_pressed'));
        keypad_font_default := HTML2Color(CkJsonObject__stringOf(JO, 'colors.keypad_font_default'));
        keypad_font_pressed := HTML2Color(CkJsonObject__stringOf(JO, 'colors.keypad_font_pressed'));
        panel_border_default := HTML2Color(CkJsonObject__stringOf(JO, 'colors.panel_border_default'));
        panel_border_pressed := HTML2Color(CkJsonObject__stringOf(JO, 'colors.panel_border_pressed'));
        panel_border_disabled := HTML2Color(CkJsonObject__stringOf(JO, 'colors.panel_border_disabled'));
        panel_border_soldout := HTML2Color(CkJsonObject__stringOf(JO, 'colors.panel_border_soldout'));
        panel_face_default := HTML2Color(CkJsonObject__stringOf(JO, 'colors.panel_face_default'));
        panel_face_pressed := HTML2Color(CkJsonObject__stringOf(JO, 'colors.panel_face_pressed'));
        panel_face_disabled := HTML2Color(CkJsonObject__stringOf(JO, 'colors.panel_face_disabled'));
        panel_face_soldout := HTML2Color(CkJsonObject__stringOf(JO, 'colors.panel_face_soldout'));
        panel_font_default := HTML2Color(CkJsonObject__stringOf(JO, 'colors.panel_font_default'));
        panel_font_pressed := HTML2Color(CkJsonObject__stringOf(JO, 'colors.panel_font_pressed'));
        panel_font_disabled := HTML2Color(CkJsonObject__stringOf(JO, 'colors.panel_font_disabled'));
        panel_font_soldout := HTML2Color(CkJsonObject__stringOf(JO, 'colors.panel_font_soldout'));
      end;

      with Self.Images do
      begin
        // ImageList for Animation
{$IFDEF USE_ANIGIF}
        LFolder := CkJsonObject__stringOf(JO, 'images.ani_barcode.folder');
        ani_barcode.FileName := LFolder + '\' + CkJsonObject__stringOf(JO, 'images.ani_barcode.gif');
        LFolder := CkJsonObject__stringOf(JO, 'images.ani_barcode_payco.folder');
        ani_barcode_payco.FileName := LFolder + '\' + CkJsonObject__stringOf(JO, 'images.ani_barcode_payco.gif');
        LFolder := CkJsonObject__stringOf(JO, 'images.ani_creditcard_input.folder');
        ani_creditcard_input.FileName := LFolder + '\' + CkJsonObject__stringOf(JO, 'images.ani_creditcard_input.gif');
        LFolder := CkJsonObject__stringOf(JO, 'images.ani_creditcard_output.folder');
        ani_creditcard_output.FileName := LFolder + '\' + CkJsonObject__stringOf(JO, 'images.ani_creditcard_output.gif');
        LFolder := CkJsonObject__stringOf(JO, 'images.ani_creditcard_swipe.folder');
        ani_creditcard_swipe.FileName := LFolder + '\' + CkJsonObject__stringOf(JO, 'images.ani_creditcard_swipe.gif');
        LFolder := CkJsonObject__stringOf(JO, 'images.ani_loading.folder');
        ani_loading.FileName := LFolder + '\' + CkJsonObject__stringOf(JO, 'images.ani_loading.gif');
        LFolder := CkJsonObject__stringOf(JO, 'images.ani_payco_pin_input.folder');
        ani_payco_pin_input.FileName := LFolder + '\' + CkJsonObject__stringOf(JO, 'images.ani_payco_pin_input.gif');
        LFolder := CkJsonObject__stringOf(JO, 'images.ani_payment_completed.folder');
        ani_payment_completed.FileName := LFolder + '\' + CkJsonObject__stringOf(JO, 'images.ani_payment_completed.gif');
        LFolder := CkJsonObject__stringOf(JO, 'images.ani_ticket_printing.folder');
        ani_ticket_printing.FileName := LFolder + '\' + CkJsonObject__stringOf(JO, 'images.ani_ticket_printing.gif');
        LFolder := CkJsonObject__stringOf(JO, 'images.ani_tmoney_tagging.folder');
        ani_tmoney_tagging.FileName := LFolder + '\' + CkJsonObject__stringOf(JO, 'images.ani_tmoney_tagging.gif');

        GetImage(ZA, ani_barcode);
        GetImage(ZA, ani_barcode_payco);
        GetImage(ZA, ani_creditcard_input);
        GetImage(ZA, ani_creditcard_output);
        GetImage(ZA, ani_creditcard_swipe);
        GetImage(ZA, ani_loading);
        GetImage(ZA, ani_payco_pin_input);
        GetImage(ZA, ani_payment_completed);
        GetImage(ZA, ani_ticket_printing);
        GetImage(ZA, ani_tmoney_tagging);
{$ELSE}
        ani_barcode.FolderName := CkJsonObject__stringOf(JO, 'images.ani_barcode.folder');
        ani_barcode_payco.FolderName := CkJsonObject__stringOf(JO, 'images.ani_barcode_payco.folder');
        ani_creditcard_input.FolderName := CkJsonObject__stringOf(JO, 'images.ani_creditcard_input.folder');
        ani_creditcard_output.FolderName := CkJsonObject__stringOf(JO, 'images.ani_creditcard_output.folder');
        ani_creditcard_swipe.FolderName := CkJsonObject__stringOf(JO, 'images.ani_creditcard_swipe.folder');
        ani_loading.FolderName := CkJsonObject__stringOf(JO, 'images.ani_loading.folder');
        ani_payco_pin_input.FolderName := CkJsonObject__stringOf(JO, 'images.ani_payco_pin_input.folder');
        ani_payment_completed.FolderName := CkJsonObject__stringOf(JO, 'images.ani_payment_completed.folder');
        ani_ticket_printing.FolderName := CkJsonObject__stringOf(JO, 'images.ani_ticket_printing.folder');
        ani_tmoney_tagging.FolderName := CkJsonObject__stringOf(JO, 'images.ani_tmoney_tagging.folder');

        GetImageList(ZA, JO, ani_barcode);
        GetImageList(ZA, JO, ani_barcode_payco);
        GetImageList(ZA, JO, ani_creditcard_input);
        GetImageList(ZA, JO, ani_creditcard_output);
        GetImageList(ZA, JO, ani_creditcard_swipe);
        GetImageList(ZA, JO, ani_loading);
        GetImageList(ZA, JO, ani_payco_pin_input);
        GetImageList(ZA, JO, ani_payment_completed);
        GetImageList(ZA, JO, ani_ticket_printing);
        GetImageList(ZA, JO, ani_tmoney_tagging);
{$ENDIF}
        // Image for Glyph
        btn_arrow_left_default.FileName := CkJsonObject__stringOf(JO, 'images.btn_arrow_left_default');
        btn_arrow_left_pressed.FileName := CkJsonObject__stringOf(JO, 'images.btn_arrow_left_pressed');
        btn_arrow_left_disabled.FileName := CkJsonObject__stringOf(JO, 'images.btn_arrow_left_disabled');
        btn_arrow_right_default.FileName := CkJsonObject__stringOf(JO, 'images.btn_arrow_right_default');
        btn_arrow_right_pressed.FileName := CkJsonObject__stringOf(JO, 'images.btn_arrow_right_pressed');
        btn_arrow_right_disabled.FileName := CkJsonObject__stringOf(JO, 'images.btn_arrow_right_disabled');
        btn_delete_default.FileName := CkJsonObject__stringOf(JO, 'images.btn_delete_default');
        btn_delete_pressed.FileName := CkJsonObject__stringOf(JO, 'images.btn_delete_pressed');
        btn_delete_disabled.FileName := CkJsonObject__stringOf(JO, 'images.btn_delete_disabled');
        btn_minus_default.FileName := CkJsonObject__stringOf(JO, 'images.btn_minus_default');
        btn_minus_pressed.FileName := CkJsonObject__stringOf(JO, 'images.btn_minus_pressed');
        btn_minus_disabled.FileName := CkJsonObject__stringOf(JO, 'images.btn_minus_disabled');
        btn_plus_default.FileName := CkJsonObject__stringOf(JO, 'images.btn_plus_default');
        btn_plus_pressed.FileName := CkJsonObject__stringOf(JO, 'images.btn_plus_pressed');
        btn_plus_disabled.FileName := CkJsonObject__stringOf(JO, 'images.btn_plus_disabled');
        btn_ticket_background.FileName := CkJsonObject__stringOf(JO, 'images.btn_ticket_background');
        btn_ticket_printing_default.FileName := CkJsonObject__stringOf(JO, 'images.btn_ticket_printing_default');
        btn_ticket_printing_default_kor.FileName := CkJsonObject__stringOf(JO, 'images.btn_ticket_printing_default_kor');
        btn_ticket_printing_default_eng.FileName := CkJsonObject__stringOf(JO, 'images.btn_ticket_printing_default_eng');
        btn_ticket_printing_default_jpn.FileName := CkJsonObject__stringOf(JO, 'images.btn_ticket_printing_default_jpn');
        btn_ticket_printing_default_chn.FileName := CkJsonObject__stringOf(JO, 'images.btn_ticket_printing_default_chn');
        //btn_ticket_printing_pressed.FileName := CkJsonObject__stringOf(JO, 'images.btn_ticket_printing_pressed');
        btn_ticket_purchase_default.FileName := CkJsonObject__stringOf(JO, 'images.btn_ticket_purchase_default');
        btn_ticket_purchase_default_kor.FileName := CkJsonObject__stringOf(JO, 'images.btn_ticket_purchase_default_kor');
        btn_ticket_purchase_default_eng.FileName := CkJsonObject__stringOf(JO, 'images.btn_ticket_purchase_default_eng');
        btn_ticket_purchase_default_jpn.FileName := CkJsonObject__stringOf(JO, 'images.btn_ticket_purchase_default_jpn');
        btn_ticket_purchase_default_chn.FileName := CkJsonObject__stringOf(JO, 'images.btn_ticket_purchase_default_chn');
        //btn_ticket_purchase_pressed.FileName := CkJsonObject__stringOf(JO, 'images.btn_ticket_purchase_pressed');
        ico_alert.FileName := CkJsonObject__stringOf(JO, 'images.ico_alert');
        ico_back.FileName := CkJsonObject__stringOf(JO, 'images.ico_back');
        ico_calendar.FileName := CkJsonObject__stringOf(JO, 'images.ico_calendar');
        ico_complete.FileName := CkJsonObject__stringOf(JO, 'images.ico_complete');
        ico_home.FileName := CkJsonObject__stringOf(JO, 'images.ico_home');
        ico_keypad_delete.FileName := CkJsonObject__stringOf(JO, 'images.ico_keypad_delete');
        ico_locale_chn.FileName := CkJsonObject__stringOf(JO, 'images.ico_locale_chn');
        ico_locale_eng.FileName := CkJsonObject__stringOf(JO, 'images.ico_locale_eng');
        ico_locale_jpn.FileName := CkJsonObject__stringOf(JO, 'images.ico_locale_jpn');
        ico_locale_kor.FileName := CkJsonObject__stringOf(JO, 'images.ico_locale_kor');
        ico_refresh.FileName := CkJsonObject__stringOf(JO, 'images.ico_refresh');
        ico_ticketlink.FileName := CkJsonObject__stringOf(JO, 'images.ico_ticketlink');
        ico_ticketlink_en.FileName := CkJsonObject__stringOf(JO, 'images.ico_ticketlink_en');
        ico_ticket.FileName := CkJsonObject__stringOf(JO, 'images.ico_ticket');
        ico_ticket_printing.FileName := CkJsonObject__stringOf(JO, 'images.ico_ticket_printing');
        ico_ticket_purchase.FileName := CkJsonObject__stringOf(JO, 'images.ico_ticket_purchase');
        img_player_back.FileName :=  CkJsonObject__stringOf(JO, 'images.img_player_back');
        img_player_back_full.FileName :=  CkJsonObject__stringOf(JO, 'images.img_player_back_full');

        GetImage(ZA, btn_arrow_left_default);
        GetImage(ZA, btn_arrow_left_pressed);
        GetImage(ZA, btn_arrow_left_disabled);
        GetImage(ZA, btn_arrow_right_default);
        GetImage(ZA, btn_arrow_right_pressed);
        GetImage(ZA, btn_arrow_right_disabled);
        GetImage(ZA, btn_delete_default);
        GetImage(ZA, btn_delete_pressed);
        GetImage(ZA, btn_delete_disabled);
        GetImage(ZA, btn_minus_default);
        GetImage(ZA, btn_minus_pressed);
        GetImage(ZA, btn_minus_disabled);
        GetImage(ZA, btn_plus_default);
        GetImage(ZA, btn_plus_pressed);
        GetImage(ZA, btn_plus_disabled);
        GetImage(ZA, btn_ticket_background);
        GetImage(ZA, btn_ticket_printing_default);
        GetImage(ZA, btn_ticket_printing_default_kor);
        GetImage(ZA, btn_ticket_printing_default_eng);
        GetImage(ZA, btn_ticket_printing_default_jpn);
        GetImage(ZA, btn_ticket_printing_default_chn);
        //GetImage(ZA, btn_ticket_printing_pressed);
        GetImage(ZA, btn_ticket_purchase_default);
        GetImage(ZA, btn_ticket_purchase_default_kor);
        GetImage(ZA, btn_ticket_purchase_default_eng);
        GetImage(ZA, btn_ticket_purchase_default_jpn);
        GetImage(ZA, btn_ticket_purchase_default_chn);
        //GetImage(ZA, btn_ticket_purchase_pressed);

        GetImage(ZA, ico_alert);
        GetImage(ZA, ico_back);
        GetImage(ZA, ico_calendar);
        GetImage(ZA, ico_complete);
        GetImage(ZA, ico_home);
        GetImage(ZA, ico_keypad_delete);
        GetImage(ZA, ico_locale_chn);
        GetImage(ZA, ico_locale_eng);
        GetImage(ZA, ico_locale_jpn);
        GetImage(ZA, ico_locale_kor);
        GetImage(ZA, ico_refresh);
        GetImage(ZA, ico_ticketlink);
        GetImage(ZA, ico_ticketlink_en);
        GetImage(ZA, ico_ticket);
        GetImage(ZA, ico_ticket_printing);
        GetImage(ZA, ico_ticket_purchase);

        GetImage(ZA, img_player_back);
        GetImage(ZA, img_player_back_full);

        BroadcastPluginCommand(CPC_APPLY_THEME, 0);
        CurrentThemeCode := LThemeCode;
        Loaded := True;
      end;
    except
      on E: Exception do
        LastError := E.Message;
    end;
  finally
    ZA.Close;
    ItemList.Clear;
    if Assigned(JO) then
      CkJsonObject_Dispose(JO);
    Global.ThreadTimer.CheckIdle := True;
  end;
end;

procedure TThemeInfo.GetImage(ZA: I7zInArchive; AThemeImageInfo: TThemeImageInfo);
var
  LIndex: Integer;
begin
  LIndex := ItemList.IndexOf(AThemeImageInfo.FileName);
  if (LIndex <> -1) then
  begin
    ZA.ExtractItem(LIndex, AThemeImageInfo.Stream, False);
    // AddLog(Format('Global.GetImage = %s', [AThemeImageInfo.FileName]));
  end;
end;

procedure TThemeInfo.GetImageList(ZA: I7zInArchive; JO: HCkJsonObject; AThemeImageList: TThemeImageList);
var
  JA: HCkJsonArray;
  MS: TMemoryStream;
  PNG: TdxPNGImage;
  LIndex, LCount: Integer;
begin
  JA := CkJsonObject_ArrayOf(JO, PWideChar('images.' + AThemeImageList.FolderName + '.list'));
  MS := TMemoryStream.Create;
  PNG := TdxPNGImage.Create;
  try
    LCount := CkJsonArray_getSize(JA);
    for var I: Integer := 0 to Pred(LCount) do
    begin
      LIndex := ItemList.IndexOf(AThemeImageList.FolderName + '\' + CkJsonArray__stringAt(JA, I));
      if (LIndex <> -1) then
      begin
        MS.Clear;
        ZA.ExtractItem(LIndex, MS, False);
        MS.Position := 0;
        PNG.LoadFromStream(MS);
        AThemeImageList.ImageList.Add(PNG.GetAsBitmap, nil);
        PNG.Clear;
      end;
    end;
    // AddLog(Format('Global.GetImageList = %s', [AThemeImageList.FolderName]));
  finally
    FreeAndNil(PNG);
    FreeAndNil(MS);
    if Assigned(JA) then
      CkJsonArray_Dispose(JA);
  end;
end;

procedure TThemeInfo.ClearImageStreams;
begin
  with Self.Images do
  begin
{$IFDEF USE_ANIGIF}
    ani_barcode.Stream.Clear;
    ani_barcode_payco.Stream.Clear;
    ani_creditcard_input.Stream.Clear;
    ani_creditcard_output.Stream.Clear;
    ani_creditcard_swipe.Stream.Clear;
    ani_loading.Stream.Clear;
    ani_payco_pin_input.Stream.Clear;
    ani_payment_completed.Stream.Clear;
    ani_ticket_printing.Stream.Clear;
    ani_tmoney_tagging.Stream.Clear;
{$ELSE}
    ani_barcode.ImageList.Clear;
    ani_barcode_payco.ImageList.Clear;
    ani_creditcard_input.ImageList.Clear;
    ani_creditcard_output.ImageList.Clear;
    ani_creditcard_swipe.ImageList.Clear;
    ani_loading.ImageList.Clear;
    ani_payco_pin_input.ImageList.Clear;
    ani_payment_completed.ImageList.Clear;
    ani_ticket_printing.ImageList.Clear;
    ani_tmoney_tagging.ImageList.Clear;
{$ENDIF}
    btn_arrow_left_default.Stream.Clear;
    btn_arrow_left_disabled.Stream.Clear;
    btn_arrow_left_pressed.Stream.Clear;
    btn_arrow_right_default.Stream.Clear;
    btn_arrow_right_disabled.Stream.Clear;
    btn_arrow_right_pressed.Stream.Clear;
    btn_delete_default.Stream.Clear;
    btn_delete_disabled.Stream.Clear;
    btn_delete_pressed.Stream.Clear;
    btn_minus_default.Stream.Clear;
    btn_minus_disabled.Stream.Clear;
    btn_minus_pressed.Stream.Clear;
    btn_plus_default.Stream.Clear;
    btn_plus_disabled.Stream.Clear;
    btn_plus_pressed.Stream.Clear;
    btn_ticket_background.Stream.Clear;
    btn_ticket_printing_default.Stream.Clear;
    btn_ticket_printing_default_kor.Stream.Clear;
    btn_ticket_printing_default_eng.Stream.Clear;
    btn_ticket_printing_default_jpn.Stream.Clear;
    btn_ticket_printing_default_chn.Stream.Clear;
    //btn_ticket_printing_pressed.Stream.Clear;
    btn_ticket_purchase_default.Stream.Clear;
    btn_ticket_purchase_default_kor.Stream.Clear;
    btn_ticket_purchase_default_eng.Stream.Clear;
    btn_ticket_purchase_default_jpn.Stream.Clear;
    btn_ticket_purchase_default_chn.Stream.Clear;
    //btn_ticket_purchase_pressed.Stream.Clear;
    ico_alert.Stream.Clear;
    ico_back.Stream.Clear;
    ico_calendar.Stream.Clear;
    ico_complete.Stream.Clear;
    ico_home.Stream.Clear;
    ico_keypad_delete.Stream.Clear;
    ico_locale_chn.Stream.Clear;
    ico_locale_eng.Stream.Clear;
    ico_locale_jpn.Stream.Clear;
    ico_locale_kor.Stream.Clear;
    ico_ticketlink.Stream.Clear;
    ico_ticketlink_en.Stream.Clear;
    ico_refresh.Stream.Clear;
    ico_ticket.Stream.Clear;
    ico_ticket_printing.Stream.Clear;
    ico_ticket_purchase.Stream.Clear;
    img_player_back.Stream.Clear;
    img_player_back_full.Stream.Clear;
  end;
end;

{ TThreadTimer }

constructor TThreadTimer.Create;
begin
  inherited Create(True);

  FreeOnTerminate := True;
  Interval := 500;
  LastWorked := Now;
  LastIdleRun := Now;
  StartTime := Now;
  CheckIdle := True;
  FCheckAliveCount := 0;
end;

destructor TThreadTimer.Destroy;
begin

  inherited;
end;

procedure TThreadTimer.Execute;
begin
  inherited;

  repeat
    if (MilliSecondsBetween(LastWorked, Now) >= Interval) then
    begin
      LastWorked := Now;

      Synchronize(
        procedure
        var
          LDateTime, LCurrDate, LCurrTime: string;
          LRefreshClock: Boolean;
        begin
          LDateTime := FormatDateTime('yyyymmddhhnnss', Now, Global.FormatSettingsKR);
          LCurrDate := LDateTime.Substring(0, 8);
          LCurrTime := LDateTime.Substring(8);

          if (Global.CurrentDate <> LCurrDate) then
          begin
            Global.CurrentDate := LCurrDate;
            Global.FormattedCurrentDate := FormattedDateString(LCurrDate, Global.FormatSettingsKR.DateSeparator);
            Global.FormattedCurrentServerDate := FormattedDateString(LCurrDate, CFS_SERVER_DATE_SEPARATOR);

            Global.CurrentDateTime := Global.CurrentDate + Global.CurrentTime;
            Global.FormattedCurrentDateTime := Global.FormattedCurrentDate + ' ' + Global.FormattedCurrentTime;
            Global.LastDate := FormatDateTime('yyyymmdd', Yesterday, Global.FormatSettingsKR);

            Global.FormattedLastDate := FormattedDateString(Global.LastDate, Global.FormatSettingsKR.DateSeparator);
            Global.FormattedLastServerDate := FormattedDateString(Global.LastDate, CFS_SERVER_DATE_SEPARATOR);

            Global.NextDate := FormatDateTime('yyyymmdd', Tomorrow, Global.FormatSettingsKR);

            Global.FormattedNextDate := FormattedDateString(Global.NextDate, Global.FormatSettingsKR.DateSeparator);
            Global.FormattedNextServerDate := FormattedDateString(Global.NextDate, CFS_SERVER_DATE_SEPARATOR);
            Global.DayOfWeekName := DayOfWeekName(Now, Ord(Global.KioskLocale));
            Global.DayOfWeekNameEN := DayOfWeekName(Now, Ord(TKioskLocale.klEnglish));
            Global.DayOfWeekNameCN := DayOfWeekName(Now, Ord(TKioskLocale.klChinese));
            Global.ResetLogFile;
          end;

          if (Global.CurrentTime <> LCurrTime) then
          begin
            // 분 단위의 변동일 때만 시각 표시 갱신 명령 전송
            Global.CurrentTime := LCurrTime;
            Global.FormattedCurrentTime := FormattedTimeString(LCurrTime);
            Global.CurrentDateTime := Global.CurrentDate + Global.CurrentTime;
            Global.FormattedCurrentDateTime := Global.FormattedCurrentDate + ' ' + Global.FormattedCurrentTime;
            //Global.FormattedCurrentDateTimeEN := FormatDateTime('ddd, mmm d h:nn am/pm', Now, Global.FormatSettingsEN);
            Global.FormattedCurrentDateTimeEN := FormatDateTime('h:nn am/pm, ddd, d mmm', Now, Global.FormatSettingsEN);
            LRefreshClock := (Global.CurrentTime.Substring(2, 2) <> LCurrTime.Substring(2, 2));
            if LRefreshClock then
            begin
              BroadcastPluginCommand(CPC_SET_DATETIME, 0);
              if (Global.KioskMode = KSM_IDLE) then
              begin
                Inc(FCheckAliveCount);
                if (FCheckAliveCount > 5) then
                begin
                  FCheckAliveCount := 0;
                  DM.PostCheckAlive; // IDLE 상태일 때 5분 단위로 상태 전송
                end;
              end;
            end;
          end;

          if (not Global.CheckAutoReboot) and
            (not Global.AutoRebootTime.IsEmpty) and
            (Copy(Global.FormattedCurrentTime, 1, 5) = Global.AutoRebootTime) then
          begin
            Global.CheckAutoReboot := True;
            SystemShutdown(0, True, True);
          end;

          if CheckIdle and
            (not Global.PrintingProgress) and
            (not Global.PaymentProgress) and
            (SecondsBetween(LastIdleRun, Now) > Global.WaitingIdleSeconds) then
          begin
            if (GetIdleSeconds > Global.WaitingIdleSeconds) then
            begin
              LastIdleRun := Now;
              Global.KioskMode := KSM_IDLE;
            end;
          end;
        end);
    end;

    WaitForSingleObject(Handle, 100);
  until Terminated;
end;

procedure TThreadTimer.Reset;
begin
  StartTime := Now;
end;

function TThreadTimer.GetDuration: Int64;
begin
  Result := SecondsBetween(StartTime, Now);
end;

{ TReserveItem }

constructor TReserveItem.Create(const AOwnerHandle: HWND);
begin
  inherited Create;

  FOwnerHandle := AOwnerHandle;
  FWorking := False;
  TicketNoList := TStringList.Create;
  BasePanel := TAdvSmoothPanel.Create(nil);
  //DenominationDescriptionList := TStringList.Create;
  with BasePanel do
  begin
    DoubleBuffered := True;
    Align := alTop;
    AlignWithMargins := True;
    Margins.Top := 0;
    Margins.Left := 0;
    Margins.Right := 0;
    Margins.Bottom := 24;
    Height := 344;
    Width := 968;
    Fill.Color := Global.ThemeInfo.Colors.background1;
    Fill.BorderColor := Global.ThemeInfo.Colors.input_border_default;
    Fill.Rounding := 15;
    Fill.ColorMirror := clNone;
    Fill.ColorMirrorTo := clNone;
    Fill.Glow := TGlowMode.gmNone;
    Fill.GradientType := TAdvGradientType.gtSolid;
    Fill.GradientMirrorType := TAdvGradientType.gtNone;
    Fill.ShadowOffset := 0;
  end;

  // 상품 이미지 컨테이너
  ProductImageContainer := TPanel.Create(nil);
  with ProductImageContainer do
  begin
    Parent := BasePanel;
    Align := alNone;
    Alignment := taCenter;
    AutoSize := False;
    BevelOuter := bvNone;
    BorderStyle := bsNone;
    Caption := '';
    Color := Global.ThemeInfo.Colors.background1;
    Top := 32;
    Left := 24;
    Height := 280;
    Width := 228;
  end;

  // 상품 이미지
  ProductImage := TImage.Create(nil);
  with ProductImage do
  begin
    Parent := ProductImageContainer;
    AutoSize := False;
    Top := 0;
    Left := 0;
    Height := 280;
    Width := 228;
    Stretch := True;
  end;

  // 상품 정보 컨테이너
  ProductNameContainer := TPanel.Create(nil);
  with ProductNameContainer do
  begin
    Parent := BasePanel;
    Align := alNone;
    Alignment := taCenter;
    AutoSize := False;
    BevelOuter := bvNone;
    BorderStyle := bsNone;
    Caption := '';
    Color := Global.ThemeInfo.Colors.background1;
    Top := 32;
    Left := 296;
    Height := 150;
    Width := 640;
  end;

  // 상품명
  ProductNameLabel := TLabel.Create(nil);
  with ProductNameLabel do
  begin
    Parent := ProductNameContainer;
    Align := alTop;
    Alignment := taLeftJustify;
    AutoSize := True;
    Height := 90;
    Width := 640;
    Caption := '';
    Color := Global.ThemeInfo.Colors.background1;
    EllipsisPosition := epEndEllipsis;
    Font.Charset := HANGEUL_CHARSET;
    Font.Name := 'Noto Sans CJK KR Medium';
    Font.Color := Global.ThemeInfo.Colors.black;
    Font.Size := 22;
    Font.Style := [];
    Transparent := False;
    WordWrap := True;
  end;

  // 행사일시 & 장소
  ReserveTimeLabel := TLabel.Create(nil);
  with ReserveTimeLabel do
  begin
    Parent := ProductNameContainer;
    Align := alTop;
    Alignment := taLeftJustify;
    AutoSize := False;
    Height := 40;
    Width := 640;
    Caption := '';
    Color := Global.ThemeInfo.Colors.background1;
    EllipsisPosition := epEndEllipsis;
    Font.Charset := HANGEUL_CHARSET;
    Font.Name := 'Noto Sans CJK KR DemiLight';
    Font.Color := Global.ThemeInfo.Colors.black;
    Font.Size := 16;
    Font.Style := [];
    Layout := tlBottom;
    Transparent := False;
    WordWrap := False;
  end;

  // 예매번호 타이틀
  ReserveNoCaptionLabel := TLabel.Create(nil);
  with ReserveNoCaptionLabel do
  begin
    Parent := BasePanel;
    Alignment := taLeftJustify;
    AutoSize := False;
    Top := 200;
    Left := 296;
    Height := 36;

    //Width := 128;
    if (Global.KioskLocale = TKioskLocale.klEnglish) then
      Width := 158
    else
      Width := 128;

    Color := Global.ThemeInfo.Colors.background1;
    Font.Charset := HANGEUL_CHARSET;
    Font.Name := 'Noto Sans CJK KR DemiLight';
    Font.Color := Global.ThemeInfo.Colors.black;
    Font.Size := 16;
    Font.Style := [];
    Layout := tlCenter;
    Transparent := False;
    WordWrap := False;
  end;

  // 예매번호
  ReserveNoLabel := TLabel.Create(nil);
  with ReserveNoLabel do
  begin
    Parent := BasePanel;
    Alignment := taLeftJustify;
    AutoSize := False;
    Top := 200;

    //Left := 417;
    if (Global.KioskLocale = TKioskLocale.klEnglish) then
      Left := 467
    else
      Left := 417;

    Height := 36;
    Width := 290;
    Caption := '';
    Color := Global.ThemeInfo.Colors.background1;
    EllipsisPosition := epEndEllipsis;
    Font.Charset := HANGEUL_CHARSET;
    Font.Name := 'Noto Sans CJK KR DemiLight';
    Font.Color := Global.ThemeInfo.Colors.black;
    Font.Size := 16;
    Font.Style := [];
    Layout := tlCenter;
    Transparent := False;
    WordWrap := False;
  end;

  // 티켓매수 타이틀
  ReserveQtyCaptionLabel := TLabel.Create(nil);
  with ReserveQtyCaptionLabel do
  begin
    Parent := BasePanel;
    Alignment := taLeftJustify;
    AutoSize := False;
    Top := 239;
    Left := 296;
    Height := 36;
    Width := 128;
//    Caption := '티켓매수';
    Color := Global.ThemeInfo.Colors.background1;
    Font.Charset := HANGEUL_CHARSET;
    Font.Name := 'Noto Sans CJK KR DemiLight';
    Font.Color := Global.ThemeInfo.Colors.black;
    Font.Size := 16;
    Font.Style := [];
    Layout := tlCenter;
    Transparent := False;
    WordWrap := False;
  end;

  // 티켓매수
  ReserveQtyLabel := TLabel.Create(nil);
  with ReserveQtyLabel do
  begin
    Parent := BasePanel;
    Alignment := taLeftJustify;
    AutoSize := False;
    Top := 239;
    Left := 425;
    Height := 36;
    Width := 290;
    Caption := '';
    Color := Global.ThemeInfo.Colors.background1;
    EllipsisPosition := epEndEllipsis;
    Font.Charset := HANGEUL_CHARSET;
    Font.Name := 'Noto Sans CJK KR DemiLight';
    Font.Color := Global.ThemeInfo.Colors.primary;
    Font.Size := 16;
    Font.Style := [];
    Layout := tlCenter;
    Transparent := False;
    WordWrap := False;
  end;

  // 예매처 타이틀
  ReserveSiteCaptionLabel := TLabel.Create(nil);
  with ReserveSiteCaptionLabel do
  begin
    Parent := BasePanel;
    Alignment := taLeftJustify;
    AutoSize := False;
    Top := 278;
    Left := 296;
    Height := 36;
    Width := 128;
//    Caption := '예매처';
    Color := Global.ThemeInfo.Colors.background1;
    Font.Charset := HANGEUL_CHARSET;
    Font.Name := 'Noto Sans CJK KR DemiLight';
    Font.Color := Global.ThemeInfo.Colors.black;
    Font.Size := 16;
    Font.Style := [];
    Layout := tlCenter;
    Transparent := False;
    WordWrap := False;
  end;

  // 예매처
  ReserveSiteLabel := TLabel.Create(nil);
  with ReserveSiteLabel do
  begin
    Parent := BasePanel;
    Alignment := taLeftJustify;
    AutoSize := False;
    Top := 278;
    Left := 425;
    Height := 36;
    Width := 3290;
    Caption := ' ';
    Color := Global.ThemeInfo.Colors.background1;
    EllipsisPosition := epEndEllipsis;
    Font.Charset := HANGEUL_CHARSET;
    Font.Name := 'Noto Sans CJK KR DemiLight';
    Font.Color := Global.ThemeInfo.Colors.black;
    Font.Size := 16;
    Font.Style := [];
    Layout := tlCenter;
    Transparent := False;
    WordWrap := False;
  end;

  // 티켓 출력 버튼
  PrintButton := TcxButton.Create(nil);
  with PrintButton do
  begin
    Parent := BasePanel;
    Top := 248;
    Left := 728;
    Height := 64;
    Width := 210;
//    Caption := '티켓 출력';
    Font.Charset := HANGEUL_CHARSET;
    Font.Name := 'Noto Sans CJK KR Bold';
    Font.Size := 20;
    Font.Style := [];
    LookAndFeel.Kind := TcxLookAndFeelKind.lfUltraFlat;
    LookAndFeel.NativeStyle := False;
    OnCustomDraw := Global.OnCxButtonCustomDraw;
    OnClick := OnPrintButtonClick;
  end;

  case Global.KioskLocale of
    TKioskLocale.klKorean:
      begin
        ReserveNoCaptionLabel.Caption := '예매번호';
        ReserveQtyCaptionLabel.Caption := '티켓매수';
        ReserveSiteCaptionLabel.Caption := '예매처';
        PrintButton.Caption := '티켓 출력';
      end;
    TKioskLocale.klEnglish:
      begin
        ReserveNoCaptionLabel.Caption := 'Reservation No:';
        ReserveQtyCaptionLabel.Caption := 'QTY:';
        ReserveSiteCaptionLabel.Caption := 'Channel:';
        PrintButton.Caption := 'Print Ticket';
      end;
    TKioskLocale.klJapanese:
      begin
        ReserveNoCaptionLabel.Caption := '予約番号:';
        ReserveQtyCaptionLabel.Caption := '枚数:';
        ReserveSiteCaptionLabel.Caption := '予約チャネル:';
        PrintButton.Caption := '出力する';
      end;
    TKioskLocale.klChinese:
      begin
        ReserveNoCaptionLabel.Caption := '预购号码:';
        ReserveQtyCaptionLabel.Caption := '张:';
        ReserveSiteCaptionLabel.Caption := '预购渠道:';
        PrintButton.Caption := '打印';
      end;
  end;
end;

destructor TReserveItem.Destroy;
begin
  FreeAndNil(TicketNoList);
  ProductImage.Free;
  ProductImageContainer.Free;
  ProductNameLabel.Free;
  ReserveTimeLabel.Free;
  ProductNameContainer.Free;
  ReserveNoCaptionLabel.Free;
  ReserveNoLabel.Free;
  ReserveQtyCaptionLabel.Free;
  ReserveQtyLabel.Free;
  ReserveSiteCaptionLabel.Free;
  ReserveSiteLabel.Free;
  PrintButton.Free;
  BasePanel.Free;
  //DenominationDescriptionList.Free;

  inherited;
end;

procedure TReserveItem.OnPrintButtonClick(Sender: TObject);
var
  PM: TPluginMessage;
begin
  if FWorking then
    Exit;
  FWorking := True;
  PM := TPluginMessage.Create(nil);
  try
    PM.Command := CPC_PRINT_TICKET;
    PM.AddParams(CPP_VALUE, ItemIndex);
    PM.PluginMessageToID(Global.PluginInfo.TicketingPluginId);
  finally
    FreeAndNil(PM);
    FWorking := False;
  end;
end;

procedure TReserveItem.UpdateLocale;
var
  LProdName: string;
begin
  LProdName := GetTextLocale([ProductName, ProductNameEN]);
  ProductNameLabel.AutoSize := False;
  ProductNameLabel.Caption := LProdName;
  ProductNameLabel.AutoSize := True;
  //ReserveTimeLabel.Caption := Format('%s | %s', [ProductDateTime, LProdName]);
end;

procedure TReserveItem.SetProductDateTime(const AProductDateTime: string);
begin
  FProductDateTime := AProductDateTime;
  ReserveTimeLabel.Caption := Format('%s | %s', [FProductDateTime, GetTextLocale([PlaceName, PlaceNameEN])]);
end;

procedure TReserveItem.SetReserveNo(const AReserveNo: Int64);
var
  LReserveNo: string;
begin
  FReserveNo := AReserveNo;
  LReserveNo := IntToStr(FReserveNo);
  ReserveNoLabel.Caption := LReserveNo + IfThen(ExternalReserveNo.IsEmpty or (LReserveNo = ExternalReserveNo), '', ' (' + ExternalReserveNo + ')');;
end;

procedure TReserveItem.SetExternalReserveNo(const AExternalReserveNo: string);
var
  LReserveNo: string;
begin
  FExternalReserveNo := AExternalReserveNo;
  LReserveNo := IntToStr(ReserveNo);
  ReserveNoLabel.Caption := LReserveNo + IfThen(FExternalReserveNo.IsEmpty or (LReserveNo = ExternalReserveNo), '', ' (' + FExternalReserveNo + ')');
end;

procedure TReserveItem.SetReserveCount(const AReserveCount: Integer);
begin
  FReserveCount := AReserveCount;
  if (Global.KioskLocale = TKioskLocale.klKorean) then
    ReserveQtyLabel.Caption := Format('%d 매', [FReserveCount])
  else
    ReserveQtyLabel.Caption := Format('%d', [FReserveCount]);
end;

procedure TReserveItem.SetExternalServiceTypeName(const AExternalServiceTypeName: string);
var
  LIsVisible: Boolean;
begin
  FExternalServiceTypeName := AExternalServiceTypeName;
  ReserveSiteLabel.Caption := FExternalServiceTypeName;
  LIsVisible := (not FExternalServiceTypeName.IsEmpty);
  ReserveSiteCaptionLabel.Visible := LIsVisible;
  ReserveSiteLabel.Visible := LIsVisible;
  if not LIsVisible then
  begin
    ReserveNoCaptionLabel.Top := ReserveQtyCaptionLabel.Top;
    ReserveNoLabel.Top := ReserveQtyLabel.Top;
    ReserveQtyCaptionLabel.Top := ReserveSiteCaptionLabel.Top;
    ReserveQtyLabel.Top := ReserveSiteLabel.Top;
  end;
end;

{ TProductItem }

constructor TProductItem.Create(const AOwnerHandle: HWND);
begin
  inherited Create;

  FOwnerHandle := AOwnerHandle;
  FWorking := False;
  BasePanel := TAdvSmoothPanel.Create(nil);
  with BasePanel do
  begin
    DoubleBuffered := True;
    Align := alLeft;
    AlignWithMargins := True;
    Margins.Top := 0;
    Margins.Bottom := 26;
    Margins.Left := 0;
    Margins.Right := 40;
    Top := 0;
    Left := 1000;
    Height := 704;
    Width := 464;
    Fill.Color := Global.ThemeInfo.Colors.panel_face_default;
    Fill.BorderColor := Global.ThemeInfo.Colors.panel_border_default;
    Fill.Rounding := 10;
    Fill.ColorMirror := clNone;
    Fill.ColorMirrorTo := clNone;
    Fill.Glow := TGlowMode.gmNone;
    Fill.GradientType := TAdvGradientType.gtSolid;
    Fill.GradientMirrorType := TAdvGradientType.gtNone;
    Fill.ShadowOffset := 0;
    Transparent := True;
    OnClick := OnProductItemClick;
  end;

  ProductImageContainer := TPanel.Create(nil);
  with ProductImageContainer do
  begin
    Parent := BasePanel;
    Align := alNone;
    Alignment := taCenter;
    AutoSize := False;
    BevelOuter := bvNone;
    BorderStyle := bsNone;
    Caption := '';
    Color := Global.ThemeInfo.Colors.panel_face_default;
    Top := 24;
    Left := 24;
    Height := 512;
    Width := 416;
  end;

  ProductImage := TImage.Create(nil);
  with ProductImage do
  begin
    Parent := ProductImageContainer;
    Align := alClient;
    AutoSize := False;
    Stretch := True;
    OnClick := OnProductItemClick;
  end;

  ProductNameLabel := TLabel.Create(nil);
  with ProductNameLabel do
  begin
    Parent := BasePanel;
    Alignment := taCenter;
    AutoSize := False;
    Caption := '';
    Color := Global.ThemeInfo.Colors.panel_face_default;
    Top := 568;
    Left := 24;
    Height := 100;
    Width := 416;
    Font.Charset := HANGEUL_CHARSET;
    Font.Name := 'Noto Sans CJK KR Regular';
    Font.Color := Global.ThemeInfo.Colors.black;
    Font.Size := 24;
    Transparent := False;
    WordWrap := True;
    OnClick := OnProductItemClick;
  end;
end;

destructor TProductItem.Destroy;
begin
  ProductNameLabel.Free;
  ProductImage.Free;
  ProductImageContainer.Free;
  BasePanel.Free;

  inherited;
end;

procedure TProductItem.UpdateLocale;
begin
  ProductNameLabel.Caption := GetTextLocale([ProductName, ProductNameEN]);
end;

procedure TProductItem.OnProductItemClick(Sender: TObject);
begin
  if FWorking then
    Exit;
  FWorking := True;
  try
    SendMessage(FOwnerHandle, CWM_SELECT_PRODUCT, ProductId, 0);
  finally
    FWorking := False;
  end;
end;

{ TRoundItem }

constructor TRoundItem.Create(const AOwnerHandle: HWND);
begin
  inherited Create;

  FOwnerHandle := AOwnerHandle;
  FWorking := False;
  FCategoryIndex := 0;
  BasePanel := TAdvSmoothPanel.Create(nil);
  with BasePanel do
  begin
    DoubleBuffered := True;
    Align := alTop;
    Height := 170;
    Width := 968;
    AlignWithMargins := True;
    Fill.Color := Global.ThemeInfo.Colors.panel_face_default;
    Fill.BorderColor := Global.ThemeInfo.Colors.panel_border_default;
    Fill.Rounding := 15;
    Fill.ColorMirror := clNone;
    Fill.ColorMirrorTo := clNone;
    Fill.Glow := TGlowMode.gmNone;
    Fill.GradientType := TAdvGradientType.gtSolid;
    Fill.GradientMirrorType := TAdvGradientType.gtNone;
    Fill.ShadowOffset := 0;
    Margins.Top := 0;
    Margins.Bottom := 24;
    Margins.Left := 0;
    Margins.Right := 0;
    OnClick := OnRoundItemClick;
    OnMouseDown := OnRoundItemMouseDown;
    OnMouseUp := OnRoundItemMouseUp;
  end;

  ScheduleTimeLabel := TLabel.Create(nil);
  with ScheduleTimeLabel do
  begin
    Parent := BasePanel;
    Alignment := taLeftJustify;
    AutoSize := False;
    Color := Global.ThemeInfo.Colors.panel_face_default;
    Top := 53;
    Left := 68;
    Height := 70;
    Width := 350;
    Font.Charset := HANGEUL_CHARSET;
    Font.Name := 'Noto Sans CJK KR Bold';
    Font.Color := Global.ThemeInfo.Colors.black;
    Font.Size := 32;
    Layout := tlCenter;
    Transparent := False;
    WordWrap := False;
    OnClick := OnRoundItemClick;
    OnMouseDown := OnRoundItemMouseDown;
    OnMouseUp := OnRoundItemMouseUp;
  end;

  RemainCountLabel := TLabel.Create(nil);
  with RemainCountLabel do
  begin
    Parent := BasePanel;
    Alignment := taRightJustify;
    AutoSize := False;
    Color := Global.ThemeInfo.Colors.panel_face_default;
    Top := 53;
    Left := 556;    // qa_v0.3_20240216 - 8 page
    Height := 70;
    Width := 350;
    Font.Charset := HANGEUL_CHARSET;
    Font.Name := 'Noto Sans CJK KR Bold';
    Font.Color := Global.ThemeInfo.Colors.black;
    Font.Size := 28;
    Layout := tlCenter;
    Transparent := False;
    WordWrap := False;
    OnClick := OnRoundItemClick;
    OnMouseDown := OnRoundItemMouseDown;
    OnMouseUp := OnRoundItemMouseUp;
  end;
end;

destructor TRoundItem.Destroy;
begin
  ScheduleTimeLabel.Free;
  RemainCountLabel.Free;
  BasePanel.Free;

  inherited;
end;

procedure TRoundItem.UpdateLocale;
begin
  RemainCountLabel.Caption := GetTextLocale(['매진', 'Sold out', '完売', '售罄']);
  if (RemainCount > 0) then
    RemainCountLabel.Caption := Format(GetTextLocale(['잔여', 'Remaining', '残余席', '剩余座位']) + ' %d', [RemainCount]);
end;

procedure TRoundItem.SelectRound(const AItemIndex, AScheduleId: Integer);
begin
  CategoryIndex := 0;
  SendMessage(FOwnerHandle, CWM_SELECT_ROUND, AItemIndex, AScheduleId);
end;

procedure TRoundItem.SetScheduleTime(const AScheduleTime: string);
var
  LDoW: Word;
begin
  FScheduleTime := AScheduleTime;
  if (ProductId = 38410) then // 임시 처리 : 빛의 시어터 - 구스타프 클림트 (2022.05.27)
  begin
    LDoW := DayOfWeek(Now);
    if (LDoW in [1 .. 5]) then // 일..목
      ScheduleTimeLabel.Caption := FScheduleTime + ' ~ 20:00'
    else
      ScheduleTimeLabel.Caption := FScheduleTime + ' ~ 21:00';
  end
  else
    ScheduleTimeLabel.Caption := FScheduleTime;
end;

procedure TRoundItem.SetSoldOut(const ASoldOut: Boolean);
begin
  FSoldOut := ASoldOut;
  if FSoldOut then
  begin
    BasePanel.Fill.Color := Global.ThemeInfo.Colors.panel_face_disabled;
    BasePanel.Fill.BorderColor := Global.ThemeInfo.Colors.panel_border_disabled;
    ScheduleTimeLabel.Color := Global.ThemeInfo.Colors.panel_face_disabled;
    ScheduleTimeLabel.Font.Color := Global.ThemeInfo.Colors.panel_font_disabled;
    RemainCountLabel.Color := Global.ThemeInfo.Colors.panel_face_disabled;
    RemainCountLabel.Font.Color := Global.ThemeInfo.Colors.panel_font_disabled;
    RemainCountLabel.Caption := GetTextLocale(['매진', 'Sold out', '完売', '售罄']);
  end;
end;

procedure TRoundItem.SetRemainCount(const ARemainCount: Integer);
begin
  FRemainCount := ARemainCount;
  if (FRemainCount > 0) then
    RemainCountLabel.Caption := Format(GetTextLocale(['잔여', 'Remaining', '残余席', '剩余座位']) + ' %d', [FRemainCount]);
end;

procedure TRoundItem.SetShowRemainCount(const AShowRemainCount: Boolean);
begin
  FShowRemainCount := AShowRemainCount;
  RemainCountLabel.Visible := FShowRemainCount;
end;

procedure TRoundItem.OnRoundItemClick(Sender: TObject);
begin
  if FWorking or SoldOut then
    Exit;
  FWorking := True;
  try
    SendMessage(FOwnerHandle, CWM_SELECT_ROUND, ItemIndex, ScheduleId);
  finally
    FWorking := False;
  end;
end;

procedure TRoundItem.OnRoundItemMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if not SoldOut then
  begin
    BasePanel.Fill.BorderColor := Global.ThemeInfo.Colors.panel_border_pressed;
    ScheduleTimeLabel.Font.Color := Global.ThemeInfo.Colors.panel_font_pressed;
    RemainCountLabel.Font.Color := Global.ThemeInfo.Colors.panel_font_pressed;
  end;
end;

procedure TRoundItem.OnRoundItemMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if not SoldOut then
  begin
    BasePanel.Fill.BorderColor := Global.ThemeInfo.Colors.panel_border_default;
    ScheduleTimeLabel.Font.Color := Global.ThemeInfo.Colors.panel_font_default;
    RemainCountLabel.Font.Color := Global.ThemeInfo.Colors.panel_font_default;
  end;
end;

{ TDenominCategoryItem }

constructor TDenominCategoryItem.Create(const AOwnerHandle: HWND);
begin
  inherited Create;

  FOwnerHandle := AOwnerHandle;
  FActive := False;
  FWorking := False;
  FRoundIndex := 0;
  FCategoryName := '';
  FCategoryNameEN := '';
  FCategoryId := 0;
  BasePanel := TPanel.Create(nil);
  with BasePanel do
  begin
    DoubleBuffered := True;
    Align := alLeft;
    AlignWithMargins := False;
    AutoSize := False;
    BevelOuter := bvNone;
    BorderStyle := bsNone;
    Color := Global.ThemeInfo.Colors.background1;
    Font.Charset := HANGEUL_CHARSET;
    Font.Name := 'Noto Sans CJK KR Bold';
    Font.Color := IfThen(Global.DenominCategoryList.Count = 0, Global.ThemeInfo.Colors.black, Global.ThemeInfo.Colors.type4);
    Font.Size := 28;
    ParentBackground := False;
    Height := 100;
    Width := 270;
    OnClick := OnDenominCategoryItemClick;
  end;

  Indicator := TLabel.Create(nil);
  with Indicator do
  begin
    Parent := BasePanel;
    Align := alBottom;
    AlignWithMargins := False;
    AutoSize := False;
    Caption := '';
    Color := Global.ThemeInfo.Colors.black;
    Height := 6;
    Transparent := False;
    Visible := (Global.DenominCategoryList.Count = 0);
    OnClick := OnDenominCategoryItemClick;
  end;
end;

destructor TDenominCategoryItem.Destroy;
begin
  Indicator.Free;
  BasePanel.Free;

  inherited;
end;

procedure TDenominCategoryItem.UpdateLocale;
begin
  case Global.KioskLocale of
    TKioskLocale.klKorean:
      BasePanel.Caption := CategoryName;
    else
      BasePanel.Caption := CategoryNameEN;
  end;
end;

procedure TDenominCategoryItem.SetCategoryId(const AValue: Integer);
begin
  FCategoryId := AValue;
  BasePanel.Tag := FCategoryId;
  Indicator.Tag := FCategoryId;
end;

procedure TDenominCategoryItem.OnDenominCategoryItemClick(Sender: TObject);
var
  LActive: Boolean;
begin
  if FWorking then
    Exit;
  FWorking := True;
  try
    if (Global.RoundList[RoundIndex].CategoryIndex = ItemIndex) then
      Exit;
    for var I: ShortInt := 0 to Pred(Global.DenominCategoryList.Count) do
    begin
      LActive := (I = ItemIndex);
      Global.DenominCategoryList[I].BasePanel.Font.Color := IfThen(LActive, Global.ThemeInfo.Colors.black, Global.ThemeInfo.Colors.type4);
      Global.DenominCategoryList[I].Indicator.Visible := LActive;
      if LActive then
      begin
        Global.RoundList[RoundIndex].CategoryIndex := ItemIndex;
        SendMessage(FOwnerHandle, CWM_SELECT_DENOMIN_CATEGORY, RoundIndex, CategoryId);
      end;
    end;
  finally
    FWorking := False;
  end;
end;

{ TDenominItem }

constructor TDenominItem.Create(const AOwnerHandle: HWND);
begin
  inherited Create;

  FOwnerHandle := AOwnerHandle;
  FWorking := False;
  FSoldOut := False;
  FAvailable := True;
  FLimitCardKcpPaymentYN := False;
  FLimitCardBinCodeList := TStringList.Create;
  BasePanel := TAdvSmoothPanel.Create(nil);
  with BasePanel do
  begin
    DoubleBuffered := True;
    Align := alNone;
    AlignWithMargins := False;
    Height := 240;
    Width := 300;
    Fill.Color := Global.ThemeInfo.Colors.panel_face_default;
    Fill.BorderColor := Global.ThemeInfo.Colors.panel_border_default;
    Fill.Rounding := 15;
    Fill.ColorMirror := clNone;
    Fill.ColorMirrorTo := clNone;
    Fill.Glow := TGlowMode.gmNone;
    Fill.GradientType := TAdvGradientType.gtSolid;
    Fill.GradientMirrorType := TAdvGradientType.gtNone;
    Fill.ShadowOffset := 0;
    Transparent := True;
    OnClick := OnDenominItemClick;
    OnMouseDown := OnDenominItemMouseDown;
    OnMouseUp := OnDenominItemMouseUp;
  end;

  DenominNameContainer := TPanel.Create(nil);
  with DenominNameContainer do
  begin
    Parent := BasePanel;
    DoubleBuffered := True;
    Align := alNone;
    Alignment := taCenter;
    AutoSize := False;
    BevelOuter := bvNone;
    BorderStyle := bsNone;
    Caption := '';
    Color := Global.ThemeInfo.Colors.panel_face_default;
    Top := 25;
    Left := 25;
    Height := 130;
    Width := 260;
    OnClick := OnDenominItemClick;
    OnMouseDown := OnDenominItemMouseDown;
    OnMouseUp := OnDenominItemMouseUp;
  end;

  DenominNameLabel := TLabel.Create(nil);
  with DenominNameLabel do
  begin
    Parent := DenominNameContainer;
    Align := alClient;
    Alignment := taCenter;
    AutoSize := False;
    Caption := '';
    Color := Global.ThemeInfo.Colors.panel_face_default;
    EllipsisPosition := epEndEllipsis;
    Font.Charset := HANGEUL_CHARSET;
    Font.Name := 'Noto Sans CJK KR Medium';
    Font.Color := Global.ThemeInfo.Colors.black;
    Font.Size := 20;
    Font.Style := [];
    Layout := tlCenter;
    Transparent := False;
    WordWrap := True;
    OnClick := OnDenominItemClick;
    OnMouseDown := OnDenominItemMouseDown;
    OnMouseUp := OnDenominItemMouseUp;
  end;

  SoldOutLabel := TLabel.Create(nil);
  with SoldOutLabel do
  begin
    Parent := DenominNameContainer;
    Align := alNone;
    Alignment := taCenter;
    AutoSize := False;
//    Caption := '매진';
    Color := Global.ThemeInfo.Colors.panel_face_default;
    Top := 79;
    Left := 0;
    Height := 50;
    Width := 260;
    Font.Charset := HANGEUL_CHARSET;
    Font.Name := 'Noto Sans CJK KR Bold';
    Font.Color := Global.ThemeInfo.Colors.white;
    Font.Size := 24;
    Font.Style := [];
    Layout := tlCenter;
    Transparent := True;
    WordWrap := False;
    Visible := False;
    BringToFront;
  end;

  DenominNameSeparator := TLabel.Create(nil);
  with DenominNameSeparator do
  begin
    Parent := DenominNameContainer;
    Align := alBottom;
    AutoSize := False;
    Caption := '';
    Color := Global.ThemeInfo.Colors.panel_border_default;
    Height := 1;
    Transparent := False;
    OnClick := OnDenominItemClick;
    OnMouseDown := OnDenominItemMouseDown;
    OnMouseUp := OnDenominItemMouseUp;
  end;

  SalePriceLabel := TLabel.Create(nil);
  with SalePriceLabel do
  begin
    Parent := BasePanel;
    Align := alNone;
    Alignment := taCenter;
    AutoSize := False;
    Color := Global.ThemeInfo.Colors.panel_face_default;
    Top := 165;
    Left := 25;
    Height := 50;
    Width := 260;
    Font.Charset := HANGEUL_CHARSET;
    Font.Name := 'Noto Sans CJK KR Bold';
    Font.Color := Global.ThemeInfo.Colors.black;
    Font.Size := 24;
    Font.Style := [];
    Layout := tlCenter;
    Transparent := False;
    WordWrap := False;
    OnClick := OnDenominItemClick;
    OnMouseDown := OnDenominItemMouseDown;
    OnMouseUp := OnDenominItemMouseUp;
  end;

  UpdateLocale;
end;

destructor TDenominItem.Destroy;
begin
  FreeAndNil(FLimitCardBinCodeList);

  DenominNameLabel.Free;
  DenominNameSeparator.Free;
  SalePriceLabel.Free;
  SoldOutLabel.Free;
  DenominNameContainer.Free;
  BasePanel.Free;

  inherited;
end;

procedure TDenominItem.UpdateLocale;
begin
  case Global.KioskLocale of
    TKioskLocale.klKorean:
      begin
        DenominNameLabel.Caption := DenominName;
        SoldOutLabel.Caption := '매진';
        SalePriceLabel.Caption := FormatFloat('#,##0 원', SalePrice);
      end
    else
      DenominNameLabel.Caption := DenominNameEN;
      SoldOutLabel.Caption := 'Sold out';
      SalePriceLabel.Caption := FormatFloat('#,##0 KRW', SalePrice);
  end;
end;

procedure TDenominItem.OnDenominItemClick(Sender: TObject);
var
  LOrderCount: Integer;
begin
  if FWorking or SoldOut or (not Available) then
    Exit;

  FWorking := True;
  try
    LOrderCount := 0;
    for var I := 0 to Pred(Global.OrderList.Count) do
      if (Global.OrderList[I].DenominId = Self.DenominId) then
      begin
        LOrderCount := Global.OrderList[I].ItemQty;
        Break;
      end;

    with TSelectPopupForm.Create(nil) do
    begin
      DenominIndex := Self.ItemIndex;
      OrderCount := LOrderCount;
      if (ShowModal = mrOK) then
        SendMessage(FOwnerHandle, CWM_SELECT_DENOMIN, Self.ItemIndex, OrderCount);
    end;
  finally
    FWorking := False;
  end;
end;

procedure TDenominItem.OnDenominItemMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if SoldOut or (not Available) then
    Exit;

  if (ScheduleRemainCount > 0) then
  begin
    BasePanel.Fill.BorderColor := Global.ThemeInfo.Colors.panel_border_pressed;
    DenominNameLabel.Color := Global.ThemeInfo.Colors.panel_face_pressed;
    DenominNameLabel.Font.Color := Global.ThemeInfo.Colors.panel_font_pressed;
    SalePriceLabel.Font.Color := Global.ThemeInfo.Colors.panel_font_pressed;
  end;
end;

procedure TDenominItem.OnDenominItemMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if SoldOut or (not Available) then
    Exit;

  if (ScheduleRemainCount > 0) then
  begin
    BasePanel.Fill.BorderColor := Global.ThemeInfo.Colors.panel_border_default;
    DenominNameLabel.Color := Global.ThemeInfo.Colors.panel_face_default;
    DenominNameLabel.Font.Color := Global.ThemeInfo.Colors.panel_font_default;
    SalePriceLabel.Font.Color := Global.ThemeInfo.Colors.panel_font_default;
  end;
end;

procedure TDenominItem.SetSalePrice(const ASalePrice: Integer);
begin
  FSalePrice := ASalePrice;
  SalePriceLabel.Caption := FormatFloat('#,##0 ' + GetTextLocale(['원', 'KRW']), FSalePrice);
end;

procedure TDenominItem.SetScheduleRemainCount(const AScheduleRemainCount: Integer);
begin
  FScheduleRemainCount := AScheduleRemainCount;
  // SoldOut := (FScheduleRemainCount = 0);
end;

procedure TDenominItem.SetAvailable(const AAvailable: Boolean);
begin
  FAvailable := AAvailable;
  if FAvailable then
  begin
    BasePanel.Fill.Color := Global.ThemeInfo.Colors.panel_face_default;
    BasePanel.Fill.BorderColor := Global.ThemeInfo.Colors.panel_border_default;
    DenominNameLabel.Color := Global.ThemeInfo.Colors.panel_face_default;
    DenominNameLabel.Font.Color := Global.ThemeInfo.Colors.panel_font_default;
    DenominNameSeparator.Color := Global.ThemeInfo.Colors.panel_border_default;
    SalePriceLabel.Color := Global.ThemeInfo.Colors.panel_face_default;
    SalePriceLabel.Font.Color := Global.ThemeInfo.Colors.panel_font_default;
  end
  else
  begin
    BasePanel.Fill.Color := Global.ThemeInfo.Colors.panel_face_disabled;
    BasePanel.Fill.BorderColor := Global.ThemeInfo.Colors.panel_border_disabled;
    DenominNameLabel.Color := Global.ThemeInfo.Colors.panel_face_disabled;
    DenominNameLabel.Font.Color := Global.ThemeInfo.Colors.panel_font_disabled;
    DenominNameSeparator.Color := Global.ThemeInfo.Colors.panel_border_disabled;
    SalePriceLabel.Color := Global.ThemeInfo.Colors.panel_face_disabled;
    SalePriceLabel.Font.Color := Global.ThemeInfo.Colors.panel_font_disabled;
  end;
end;

procedure TDenominItem.SetSoldOut(const ASoldOut: Boolean);
begin
  FSoldOut := ASoldOut;
  if FSoldOut then
  begin
    BasePanel.Fill.Color := Global.ThemeInfo.Colors.panel_face_soldout;
    BasePanel.Fill.BorderColor := Global.ThemeInfo.Colors.panel_border_soldout;
    DenominNameLabel.Color := Global.ThemeInfo.Colors.panel_face_soldout;
    DenominNameLabel.Font.Color := Global.ThemeInfo.Colors.panel_font_soldout;
    DenominNameSeparator.Color := Global.ThemeInfo.Colors.panel_border_soldout;
    SalePriceLabel.Color := Global.ThemeInfo.Colors.panel_face_soldout;
    SalePriceLabel.Font.Color := Global.ThemeInfo.Colors.panel_font_soldout;
    SoldOutLabel.Visible := True;
    SoldOutLabel.BringToFront;
  end
  else
  begin
    BasePanel.Fill.Color := Global.ThemeInfo.Colors.panel_face_default;
    BasePanel.Fill.BorderColor := Global.ThemeInfo.Colors.panel_border_default;
    DenominNameLabel.Color := Global.ThemeInfo.Colors.panel_face_default;
    DenominNameLabel.Font.Color := Global.ThemeInfo.Colors.panel_font_default;
    DenominNameSeparator.Color := Global.ThemeInfo.Colors.panel_border_default;
    SalePriceLabel.Color := Global.ThemeInfo.Colors.panel_face_default;
    SalePriceLabel.Font.Color := Global.ThemeInfo.Colors.panel_font_default;
    SoldOutLabel.Visible := False;
  end;
end;

{ TOrderItem }

constructor TOrderItem.Create(const AOwnerHandle: HWND);
begin
  inherited Create;

  FOwnerHandle := AOwnerHandle;
  OrderItemBasePanel := TPanel.Create(nil);
  with OrderItemBasePanel do
  begin
    DoubleBuffered := True;
    Align := alTop;
    BevelOuter := bvNone;
    Height := 90;
    Width := 968;
    Caption := '';
    Color := Global.ThemeInfo.Colors.background1;
    ParentBackground := False;
    ParentColor := False;
  end;

  OrderItemTitleLabel := TLabel.Create(nil);
  with OrderItemTitleLabel do
  begin
    Parent := OrderItemBasePanel;
    Height := 90;
    Width := 450;
    AutoSize := False;
    Caption := '';
    Align := alLeft;
    Alignment := taLeftJustify;
    Color := Global.ThemeInfo.Colors.background1;
    EllipsisPosition := epEndEllipsis;
    Font.Name := 'Noto Sans CJK KR Medium';
    Font.Color := Global.ThemeInfo.Colors.black;
    Font.Size := 22;
    Font.Style := [];
    Layout := tlCenter;
    Transparent := False;
  end;

  OrderItemDecQtyButton := TAdvShapeButton.Create(nil);
  with OrderItemDecQtyButton do
  begin
    DoubleBuffered := True;
    Parent := OrderItemBasePanel;
    Top := 13;
    Left := 470;
    Height := 64;
    Width := 64;
    StreamToPicture(Picture, Global.ThemeInfo.Images.btn_minus_default.Stream);
    StreamToPicture(PictureDown, Global.ThemeInfo.Images.btn_minus_pressed.Stream);
    StreamToPicture(PictureDisabled, Global.ThemeInfo.Images.btn_minus_disabled.Stream);
    Transparent := True;
    OnClick := OnDecItemQtyButtonClick;
  end;

  OrderItemQtyValueLabel := TcxLabel.Create(nil);
  with OrderItemQtyValueLabel do
  begin
    DoubleBuffered := True;
    Parent := OrderItemBasePanel;
    Top := 13;
    Left := 533;
    Height := 64;
    Width := 90;
    AutoSize := False;
    Caption := '';
    Properties.Alignment.Horz := taCenter;
    Properties.Alignment.Vert := taVCenter;
    Style.Font.Charset := ANSI_CHARSET;
    Style.Font.Name := 'Roboto';
    Style.Font.Color := Global.ThemeInfo.Colors.black;
    Style.Font.Size := 20;
    Style.Font.Style := [];
    Style.BorderColor := Global.ThemeInfo.Colors.panel_border_default;
    Style.BorderStyle := TcxEditBorderStyle.ebsThick;
    Style.Color := Global.ThemeInfo.Colors.background1;
    Style.Edges := [bTop, bBottom];
    Style.Font.Color := Global.ThemeInfo.Colors.black;
    Style.LookAndFeel.Kind := lfStandard;
    Style.LookAndFeel.NativeStyle := False;
  end;

  OrderItemIncQtyButton := TAdvShapeButton.Create(nil);
  with OrderItemIncQtyButton do
  begin
    DoubleBuffered := True;
    Parent := OrderItemBasePanel;
    Top := 13;
    Left := 622;
    Height := 64;
    Width := 64;
    StreamToPicture(Picture, Global.ThemeInfo.Images.btn_plus_default.Stream);
    StreamToPicture(PictureDown, Global.ThemeInfo.Images.btn_plus_pressed.Stream);
    StreamToPicture(PictureDisabled, Global.ThemeInfo.Images.btn_plus_disabled.Stream);
    Transparent := True;
    OnClick := OnIncItemQtyButtonClick;
  end;

  OrderItemAmtValueLabel := TLabel.Create(nil);
  with OrderItemAmtValueLabel do
  begin
    Parent := OrderItemBasePanel;
    Top := 13;
    Left := 700;
    Height := 64;
    Width := 170;
    Alignment := taRightJustify;
    AutoSize := False;
    Caption := '';
    Color := Global.ThemeInfo.Colors.background1;
    Font.Charset := ANSI_CHARSET;
    Font.Name := 'Roboto';
    Font.Color := Global.ThemeInfo.Colors.black;
    Font.Size := 20;
    Font.Style := [fsBold];
    Layout := tlCenter;
    Transparent := False;
  end;

  OrderItemAmtUnitLabel := TLabel.Create(nil);
  with OrderItemAmtUnitLabel do
  begin
    Parent := OrderItemBasePanel;
    Top := 13;
    Left := 876;
    Height := 64;
    Width := 50;
    Alignment := taLeftJustify;
    AutoSize := False;
//    Caption := '원';
    Color := Global.ThemeInfo.Colors.background1;
    Font.Name := 'Noto Sans CJK KR Regular';
    Font.Color := Global.ThemeInfo.Colors.type4;
    Font.Size := 16;
    Layout := tlCenter;
    Transparent := False;
  end;

  OrderItemRemoveButton := TAdvShapeButton.Create(nil);
  with OrderItemRemoveButton do
  begin
    DoubleBuffered := True;
    Parent := OrderItemBasePanel;
    Height := 36;
    Width := 36;
    Top := 27;
    Left := 926;
    StreamToPicture(Picture, Global.ThemeInfo.Images.btn_delete_default.Stream);
    StreamToPicture(PictureDown, Global.ThemeInfo.Images.btn_delete_pressed.Stream);
    StreamToPicture(PictureDisabled, Global.ThemeInfo.Images.btn_delete_disabled.Stream);
    Transparent := True;
    OnClick := OnRemoveOrderItemButtonClick;
  end;

  OrderItemLineSeparator := TLabel.Create(nil);
  with OrderItemLineSeparator do
  begin
    Parent := OrderItemBasePanel;
    Height := 1;
    Align := alBottom;
    AutoSize := False;
    Caption := '';
    Color := Global.ThemeInfo.Colors.line2;
    Transparent := False;
  end;

  { 결제 목록 }
  PaymentItemBasePanel := TPanel.Create(nil);
  with PaymentItemBasePanel do
  begin
    DoubleBuffered := True;
    Align := alTop;
    BevelOuter := bvNone;
    Height := 100;
    Width := 968;
    Caption := '';
    Color := Global.ThemeInfo.Colors.background1;
    ParentBackground := False;
    ParentColor := False;
  end;

  PaymentItemTitleLabel := TLabel.Create(nil);
  with PaymentItemTitleLabel do
  begin
    Parent := PaymentItemBasePanel;
    AutoSize := False;
    Align := alLeft;
    Alignment := taLeftJustify;
    AlignWithMargins := True;
    EllipsisPosition := epEndEllipsis;
    Margins.Top := 5;
    Margins.Left := 5;
    Margins.Right := 5;
    Margins.Bottom := 5;
    Height := 100;
    Width := 580;
    Caption := '';
    Color := Global.ThemeInfo.Colors.background1;
    Font.Name := 'Noto Sans CJK KR Medium';
    Font.Color := Global.ThemeInfo.Colors.black;
    Font.Size := 22;
    Font.Style := [];
    Layout := tlCenter;
    Transparent := False;
  end;

  PaymentItemQtyValueLabel := TLabel.Create(nil);
  with PaymentItemQtyValueLabel do
  begin
    Parent := PaymentItemBasePanel;
    AutoSize := False;
    Align := alLeft;
    AlignWithMargins := True;
    Margins.Top := 5;
    Margins.Left := 5;
    Margins.Right := 5;
    Margins.Bottom := 5;
    Height := 100;
    Width := 100;
    Caption := '';
    Alignment := taCenter;
    Color := Global.ThemeInfo.Colors.background1;
    Font.Charset := ANSI_CHARSET;
    Font.Name := 'Roboto';
    Font.Color := Global.ThemeInfo.Colors.black;
    Font.Size := 24;
    Font.Style := [];
    Layout := tlCenter;
    Transparent := False;
  end;

  PaymentItemAmtValueLabel := TLabel.Create(nil);
  with PaymentItemAmtValueLabel do
  begin
    Parent := PaymentItemBasePanel;
    AutoSize := False;
    Align := alLeft;
    Alignment := taRightJustify;
    AlignWithMargins := True;
    Margins.Top := 5;
    Margins.Left := 5;
    Margins.Right := 5;
    Margins.Bottom := 5;
    Height := 100;
    Width := 200;
    Caption := '';
    Color := Global.ThemeInfo.Colors.background1;
    Font.Charset := ANSI_CHARSET;
    Font.Name := 'Roboto';
    Font.Color := Global.ThemeInfo.Colors.black;
    Font.Size := 24;
    Font.Style := [fsBold];
    Layout := tlCenter;
    Transparent := False;
  end;

  PaymentItemAmtUnitLabel := TLabel.Create(nil);
  with OrderItemAmtUnitLabel do
  begin
    Parent := PaymentItemBasePanel;
    AutoSize := False;
    Align := alLeft;
    Alignment := taLeftJustify;
    AlignWithMargins := True;
    Margins.Top := 5;
    Margins.Left := 0;
    Margins.Right := 5;
    Margins.Bottom := 5;
    Height := 100;
    Width := 50;
//    Caption := '원';
    Color := Global.ThemeInfo.Colors.background1;
    Font.Name := 'Noto Sans CJK KR Regular';
    Font.Color := Global.ThemeInfo.Colors.type4;
    Font.Size := 16;
    Layout := tlCenter;
    Transparent := False;
  end;

  PaymentItemLineSeparator := TLabel.Create(nil);
  with PaymentItemLineSeparator do
  begin
    Parent := PaymentItemBasePanel;
    Height := 1;
    Align := alBottom;
    AutoSize := False;
    Caption := '';
    Color := Global.ThemeInfo.Colors.line2;
    Transparent := False;
  end;

  UpdateLocale;
end;

destructor TOrderItem.Destroy;
begin
  OrderItemTitleLabel.Free;
  OrderItemQtyValueLabel.Free;
  OrderItemAmtValueLabel.Free;
  OrderItemAmtUnitLabel.Free;
  OrderItemDecQtyButton.Free;
  OrderItemIncQtyButton.Free;
  OrderItemRemoveButton.Free;
  OrderItemLineSeparator.Free;
  OrderItemBasePanel.Free;

  PaymentItemTitleLabel.Free;
  PaymentItemQtyValueLabel.Free;
  PaymentItemAmtValueLabel.Free;
  PaymentItemAmtUnitLabel.Free;
  PaymentItemLineSeparator.Free;
  PaymentItemBasePanel.Free;

  inherited;
end;

procedure TOrderItem.UpdateLocale;
begin
  case Global.KioskLocale of
    TKioskLocale.klKorean:
      begin
        OrderItemAmtUnitLabel.Caption := '원';
        PaymentItemAmtUnitLabel.Caption := '원';
      end;
    else
      OrderItemAmtUnitLabel.Caption := 'KRW';
      PaymentItemAmtUnitLabel.Caption := 'KRW';
  end;
end;

procedure TOrderItem.OnDecItemQtyButtonClick(Sender: TObject);
begin
  with TAdvShapeButton(Sender) do
  begin
    if (ItemQty > BuyDoubleCount) and
      CheckOrderLimit(DenominIndex, ItemQty - BuyDoubleCount) then
      ItemQty := (ItemQty - BuyDoubleCount);
    Enabled := (ItemQty > BuyDoubleCount);
  end;
end;

procedure TOrderItem.OnIncItemQtyButtonClick(Sender: TObject);
begin
  with TAdvShapeButton(Sender) do
  begin
    if (ItemQty < 10) then
    begin
      if CheckOrderLimit(DenominIndex, ItemQty + BuyDoubleCount) then
        ItemQty := (ItemQty + BuyDoubleCount);
      Enabled := (ItemQty < 10);
    end;
  end;
end;

procedure TOrderItem.OnRemoveOrderItemButtonClick(Sender: TObject);
begin
  SendMessage(FOwnerHandle, CWM_REMOVE_ORDER, Self.DenominId, 0);
end;

procedure TOrderItem.SetItemTitle(const AItemTitle: string);
begin
  if (FItemTitle <> AItemTitle) then
  begin
    FItemTitle := AItemTitle;
    OrderItemTitleLabel.Caption := ' ' + AItemTitle;
    PaymentItemTitleLabel.Caption := AItemTitle;
  end;
end;

procedure TOrderItem.SetItemQty(const AItemQty: Integer);
begin
  FItemQty := AItemQty;
  OrderItemQtyValueLabel.Caption := IntToStr(FItemQty);
  OrderItemAmtValueLabel.Caption := FormatFloat('#,##0', ItemPrice * FItemQty);
  OrderItemDecQtyButton.Enabled := (FItemQty > BuyDoubleCount);
  OrderItemIncQtyButton.Enabled := (FItemQty < 10);
  PaymentItemQtyValueLabel.Caption := IntToStr(FItemQty);
  PaymentItemAmtValueLabel.Caption := FormatFloat('#,##0', ItemPrice * FItemQty);
  SendMessage(FOwnerHandle, CWM_REFRESH_TOTAL, 0, 0);
end;

{ TReceiptInfo }

constructor TReceiptInfo.Create;
begin
  inherited Create;

  FSignImage := TMemoryStream.Create;
  ClearData;
end;

destructor TReceiptInfo.Destroy;
begin
  FSignImage.Free;

  inherited;
end;

procedure TReceiptInfo.ClearData;
begin
  ReceiptNo := '';
  SellTotal := 0;
  VatTotal := 0;
  CashAmt := 0;
  CreditCardAmt := 0;
  PaycoCardAmt := 0;
  PaycoPointAmt := 0;
  TmoneyAmt := 0;
  DiscountAmt := 0;
  PaycoReady := False;
  SignImage.Clear;

  ProductId := 0;
  ScheduleId := 0;
  ProductRound := 0;
  TicketCount := 0;
  ReserveNo := 0;
end;

// 영수증번호 생성
function TReceiptInfo.NewReceiptNo: string;
begin
  // 999000YYMMDDHHNNSS
  ReceiptNo := FormatFloat('00000', Global.StoreInfo.PartnerNo) + FormatFloat('000', Global.StoreInfo.CounterNo) + Copy(Global.CurrentDate, 3, 6) + Global.CurrentTime;
  Result := ReceiptNo;
end;

// 청구금액 = (상품금액 - 할인금액)
function TReceiptInfo.GetChargeTotal: Integer;
begin
  Result := (SellTotal - DiscountAmt);
end;

// 결제금액 = (현금결제금액 + 신용카드결제금액 + PAYCO결제금액 + T머니결제금액)
function TReceiptInfo.GetPaidTotal: Integer;
begin
  Result := (CashAmt + CreditCardAmt + PaycoCardAmt + PaycoPointAmt + TmoneyAmt);
end;

// 미결제금액 = (청구금액 - 결제금액)
function TReceiptInfo.GetUnpaidTotal: Integer;
begin
  Result := (SellTotal - (PaidTotal + DiscountAmt));
  if (Result < 0) then
    Result := 0;
end;

// 거스름돈 = (받은금액 - 청구금액)
function TReceiptInfo.GetChangeTotal: Integer;
begin
  Result := (PaidTotal - ChargeTotal);
  if (Result < 0) then
    Result := 0;
end;

// 부가가치세
function TReceiptInfo.GetVatTotal: Integer;
begin
  Result := (ChargeTotal - Trunc(ChargeTotal / 1.1));
  if (Result < 0) then
    Result := 0;
end;

/// /////////////////////////////////////////////////////////////////////////////////////////////////

initialization

InitializeCriticalSection(LogCS);

finalization

DeleteCriticalSection(LogCS);

end.
