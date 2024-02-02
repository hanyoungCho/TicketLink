unit Common.TLReceiptPrintManager;

interface

uses
  System.SysUtils, System.Math, System.StrUtils, fx.Json;

const
  { 프린터 특수명령 }
  rptCharNormal       = '{N}';  //일반 글자
  rptCharBold         = '{B}';  //굵은 글자
  rptCharInverse      = '{I}';  //역상 글자
  rptCharUnderline1   = '{.}';  //밑줄 1 dot thick
  rptCharUnderline2   = '{|}';  //밑줄 2 dot thick
  rptAlignLeft        = '{L}';  //왼쪽 정렬
  rptAlignCenter      = '{C}';  //가운데 정렬
  rptAlignRight       = '{R}';  //오른쪽 정렬
  rptSizeNormal       = '{S}';  //보통 크기
  rptSizeWidth2X      = '{V}';  //배폭
  rptSizeHeight2X     = '{H}';  //배고
  rptSize2Times       = '{2}';  //배폭 & 배고
//  rptSize3Times       = '{3}';  //가로세로3배확대 크기
//  rptSize4Times       = '{4}';  //가로세로4배확대 크기
  rptInit             = '{!}';  //프린터 초기화
  rptCutFull          = '{F}';  //용지 전체 커팅
  rptCutPartial       = '{P}';  //용지 부분 커팅
  rptImage1           = '{*}';  //그림 인쇄 1
  rptImage2           = '{@}';  //그림 인쇄 2
  rptDrawerOpen       = '{O}';  //금전함 열기
  rptSpacingNormal    = '{=}';  //줄간격 보통
  rptSpacingNarrow    = '{&}';  //줄간격 좁음
  rptSpacingWide      = '{\}';  //줄간격 넓음
  rptLF               = '{-}';  //줄바꿈
  rptBarcodeBegin128  = '{<}';  //바코드 출력 시작 CODE128
  rptBarcodeBegin39   = '{[}';  //바코드 출력 시작 CODE39
  rptBarcodeEnd       = '{>}';  //바코드 출력 끝
  rptQRCodeBegin      = '{^}';  //QR코드 출력 시작
  rptQRCodeEnd        = '{~}';  //QR코드 출력 끝
  rptLineSingle1      = '------------------------------------------------'; //48
  rptLineSingle2      = '------------------------------------------'; //42
  rptLineDouble1      = '================================================'; //48
  rptLineDouble2      = '=========================================='; //42

type
  { 프린터 종류 }
  //pdtStandard: SAM4OS GIANT-100S
  //pdtMasung: MASUNG MS-T500II
  TPrintingDeviceType = (pdtStandard, pdtMasung);
  { 결제 유형 }
  TPaymentType = (ptNone, ptCash, ptCreditCard, ptPaycoCard, ptPaycoPoint, ptPaycoCoupon, ptVoid);
  { 프린터 상태 검사 유형 }
  TReceiptPrinterStatus = (rpsStatusAll, rpsStatusPrinter, rpsStatusCover, rpsStatusTransmit, rpsStatusPaper);

  TReceiptStoreInfo = class(TJson)
    StoreName: string; //사업자명
    BizNo: string; //사업자번호
    OwnerName: string; //업주명
    TelNo: string; //전화번호
    Address: string; //주소
    CashierName: string; //판매자명
  end;

  { 발권 정보 }
  TTicketInfo = class(TJson)
    PurchaseDateTime: string; //구매일시(yyyy-mm-dd hh:nn:ss)
    TicketingDateTime: string; //발권일시(yyyy-mm-dd hh:nn:ss)
    ProductName: string; //상품명
    ProductSubTitle: string; //부제목
    ScheduleDateTime: string; //회차정보
    PlaceName: string; //장소명
    DenominCategoryName: string; //권종구분
    DenominName: string; //권종명
    MarkPrice: string; //표시가격(00,000원)
    ReserveNo: string; //예매번호
    ExternalReserveNo: string; //외부예매번호
    ReserveUserName: string; //예매자명
    ReserveUserTelNo: string; //예매자연락처
    ReserveDateTime: string; //예매일(yyyy-mm-dd)
    ReserveChannel: string; //예매채널
    PaymentMethod: string; //결제수단
    IssueNo: string; //발행번호
    TicketNo: string; //티켓번호
  end;

  { 주문 정보 }
  TReceiptOrderInfo = class(TJson)
    ProductName: string; //상품명
    DenominCategoryName: string; //권종구분
    DenominName: string; //권종명
    UnitPrice: Integer; //단가
    SaleQty: Integer; //판매수량
    SaleAmt: Integer; //판매금액
    VAT: Integer; //부가가치세
  end;

  { 결제 정보 }
  TReceiptPaymentInfo = class(TJson)
    &PaymentType: TPaymentType; //결제수단
    Approval: Boolean; //승인-취소 여부
    Internet: Boolean; //인터넷승인여부(수기등록)
    ApprovalAmt: Integer; //승인금액
    ApprovalNo: string; //승인번호
    OrgApproveNo: string; //원승인번호
    CreditCardNo: string; //카드번호
    CashReceiptPerson: Integer; //소득공제(1: 개인, 2: 사업자)
    InstMonth: Integer; //할부개월
    AppCompanyName: string; //승인기관(PAYCO)
    MerchantKey: string; //가맹번호
    TransDateTime: string; //승인일시(yyyy-mm-dd hh:nn:ss)
    BuyCompanyName: string; //매입사
    BuyTypeName: string; //매입처
  end;

  TReceiptEtcInfo = class(TJson)
    SaleDate: string; //판매일자
    SaleTime: string; //판매일시
    TotalAmt: Integer; //상품판매시 총 판매금액
    DiscountAmt: Integer; //할인금액
    ReceiptNo: string; //영수증번호(바코드)
    ReserveNo: string; //예매번호(바코드)
    DayOfWeek: string; //요일
    HomeUrl: string; //홈페이지URL
    TaxFree: Boolean; //비과세여부
    Top1: string; // 상단문구1
    Top2: string; // 상단문구2
    Top3: string; // 상단문구3
    Top4: string; // 상단문구4
    Bottom1: string; //하단문구1
    Bottom2: string; //하단문구2
    Bottom3: string; //하단문구3
    Bottom4: string; //하단문구4
  end;

  TReceipt = class(TJson)
  public
    StoreInfo: TReceiptStoreInfo;
    OrderList: TArray<TReceiptOrderInfo>;
    PaymentList: TArray<TReceiptPaymentInfo>;
    ReceiptEtcInfo: TReceiptEtcInfo;
    TicketList: TArray<TTicketInfo>;

    constructor Create;
    destructor Destroy; override;

    procedure Load(const AJsonText: string);
  end;

  TReceiptPrintManager = class
  private
    FDeviceType: TPrintingDeviceType;
    FReceipt: TReceipt;
    FPrintjson: string;
    FIsReturn: Boolean;
    FInt_37: Integer;
    FInt_11: Integer;
    FInt_48: Integer;
    FInt_33: Integer;
    FInt_15: Integer;

    function ByteLen(const AText: string): Integer;
    function LPadB(const AStr: string; const ALength: Integer; const APadChar: Char): string;
    function RPadB(const AStr: string; const ALength: Integer; const APadChar: Char): string;
    function SCopy(const S: AnsiString; const F, L: Integer): string;
    function PadChar(const ALength: Integer; const APadChar: Char=' '): string;
//    function GetCurrencyString(const AData: Currency): string;
//    function DateTimeStrToString(const ADateTime: string): string;
  public
    constructor Create(ADeviceType: TPrintingDeviceType);
    destructor Destroy; override;

    function CheckReceiptPrinter(const ACheckMode: TReceiptPrinterStatus=rpsStatusAll): Boolean;
    function DoPrint(AJsonText: string; var AErrMsg: string): Boolean;
    function SetTicketPrint: Boolean;
    function SetReceiptPrint: Boolean;
    function SetBenefitCouponPrint: Boolean;
    function PrintOut(const APrintData: string): Boolean;

    function ReceiptHeader: string;
    function ReceiptReserveInfo: string;
    function ReceiptItemList: string;
    function ReceiptTotalAmt: string;
    function ReceiptPaymentList: string;
    function ReceiptPaymentListInfo: string;
    function ReceiptPaycoData(const APayInfo: TReceiptPaymentInfo): string;
    function ReceiptBottom(const APrintBarcode: Boolean): string;
    function ConvertPrintData(const AData: string): string;
    function ConvertBarcodeCommand(AData: string): string;
    function MakeQRCodeCommand(const AQRCode: string): string;

    property PrintJson: string read FPrintJson write FPrintjson;
    property IsReturn: Boolean read FIsReturn write FIsReturn default False;
    property Int_11: Integer read FInt_11 write FInt_11;
    property Int_15: Integer read FInt_15 write FInt_15;
    property Int_33: Integer read FInt_33 write FInt_33;
    property Int_37: Integer read FInt_37 write FInt_37;
    property Int_48: Integer read FInt_48 write FInt_48;
  end;

implementation

uses
  { Native }
  WinApi.Windows, Vcl.Forms,
  { Project }
  Common.TLGlobal;

{ TReceipt }

constructor TReceipt.Create;
begin
  inherited Create;

  StoreInfo := TReceiptStoreInfo.Create;
  TicketList := [];
  OrderList := [];
  PaymentList := [];
  ReceiptEtcInfo := TReceiptEtcInfo.Create;
end;

destructor TReceipt.Destroy;
begin
  StoreInfo.Free;
  TicketList := [];
  OrderList := [];
  PaymentList := [];
  ReceiptEtcInfo.Free;

  inherited;
end;

procedure TReceipt.Load(const AJsonText: string);
begin
  TJsonReadWriter.JsonToObject<TReceipt>(AJsonText, Self);
end;

{ TReceiptPrintManager }

constructor TReceiptPrintManager.Create(ADeviceType: TPrintingDeviceType);
begin
  inherited Create;

  FDeviceType := ADeviceType;
  if (FDeviceType = pdtMasung) then
  begin
    Int_11 := 11;
    Int_15 := 15;
    Int_33 := 33;
    Int_37 := 37;
    Int_48 := 48;
  end
  else
  begin
    Int_11 := 9;
    Int_15 := 13;
    Int_33 := 29;
    Int_37 := 33;
    Int_48 := 42;
  end;
end;

destructor TReceiptPrintManager.Destroy;
begin

  inherited;
end;

function TReceiptPrintManager.CheckReceiptPrinter(const ACheckMode: TReceiptPrinterStatus): Boolean;
var
  LGetTime: Cardinal;
begin
  with Global.ReceiptPrinter do
  begin
    ErrorCode := 0;
    LastError := '';
    ErrorOccured := False;
    try
      try
        if not ComDevice.Active then
          ComDevice.Open;

        //Continuous paper sensor status
        if ACheckMode in [rpsStatusAll, rpsStatusPaper] then
        begin
          SendData := #16#4#4;
          ReadData := '';
          ComDevice.WriteString(SendData);
          LGetTime := GetTickCount;
          while (LGetTime + 1000 > GetTickCount) do
          begin
            if (Length(ReadData) > 0) and ((Ord(ReadData[1]) and $60) = $60) then
            begin
              ErrorCode := 10;
              LastError := '용지가 부족하거나 잘못 끼워져 있습니다.';
              ErrorOccured := True;
              Exit;
            end;
            Application.ProcessMessages;
          end;
        end;

        //Offline Status
        if ACheckMode in [rpsStatusAll, rpsStatusCover] then
        begin
          SendData := #16#4#2;
          ReadData := '';
          ComDevice.WriteString(SendData);
          LGetTime := GetTickCount;
          while (LGetTime + 1000 > GetTickCount) do
          begin
            if (Length(ReadData) > 0) and ((Ord(ReadData[1]) and $04) = $04) then
            begin
              ErrorCode := 20;
              LastError := '덮개가 열려 있습니다.';
              ErrorOccured := True;
              Exit;
            end;
            Application.ProcessMessages;
          end;
        end;

        //Error Status
        if ACheckMode in [rpsStatusAll, rpsStatusTransmit] then
        begin
          SendData := #16#4#3;
          ReadData := '';
          ComDevice.WriteString(SendData);
          LGetTime := GetTickCount;
          while (LGetTime + 1000 > GetTickCount) do
          begin
            if Length(ReadData) > 0 then
            begin
              if (Ord(ReadData[1]) and $08) = $08 then
              begin
                ErrorCode := 30;
                LastError := '용지 커터가 정상 동작하지 않습니다.';
                ErrorOccured := True;
                Exit;
              end
              else if ((Ord(ReadData[1]) and $20) = $20) or
                ((Ord(ReadData[1]) and $40) = $40) then
              begin
                ErrorCode := 31;
                LastError := '심각한 장애가 발생하였습니다.';
                ErrorOccured := True;
                Exit;
              end;
            end;
            Application.ProcessMessages;
          end;
        end;

        //Printer Status
        if ACheckMode in [rpsStatusAll, rpsStatusPrinter] then
        begin
          SendData := #16#4#1;
          for var I := 1 to 3 do
          begin
            ReadData := '';
            ComDevice.WriteString(SendData);
            LGetTime := GetTickCount;
            while (LGetTime + 1000 > GetTickCount) do
            begin
              if (Length(ReadData) > 0) and ((Ord(ReadData[1]) and $08) <> $08) then
              begin
                ErrorCode := 0;
                LastError := '';
                Exit;
              end;
              Application.ProcessMessages;
            end;
          end;

          ErrorCode := 40;
          LastError := '전원이 꺼져 있거나 응답하지 않습니다.';
          ErrorOccured := True;
        end;
      except
        on E: Exception do
        begin
          ErrorCode := 90;
          LastError := E.Message;
          ErrorOccured := True;
        end;
      end;
    finally
      Result := (not ErrorOccured);
      if ErrorOccured then
        AddLog(Format('Global.CheckReceiptPrinter.Exception = ErrorCode: %d, LastError: %s', [ErrorCode, LastError]));
    end;
  end;
end;

function TReceiptPrintManager.DoPrint(AJsonText: string; var AErrMsg: string): Boolean;
begin
  AErrMsg := '';
  Result := False;
  FReceipt := TReceipt.Create;
  try
    try
      //출력 전 1번만 검사하는 것으로 설정 되었다면 (CheckDevicePerEach=False)
      if not Global.ReceiptPrinter.CheckDevicePerEach then
      begin
        if Global.ReceiptPrinter.CheckStatusAll then
          Result := CheckReceiptPrinter(rpsStatusPaper) and
                    CheckReceiptPrinter(rpsStatusCover) and
                    CheckReceiptPrinter(rpsStatusTransmit) and
                    CheckReceiptPrinter(rpsStatusPrinter)
        else
          Result := ((not Global.ReceiptPrinter.CheckStatusPaper) or CheckReceiptPrinter(rpsStatusPaper)) and
                    ((not Global.ReceiptPrinter.CheckStatusCover) or CheckReceiptPrinter(rpsStatusCover)) and
                    ((not Global.ReceiptPrinter.CheckStatusTransmit) or CheckReceiptPrinter(rpsStatusTransmit)) and
                    ((not Global.ReceiptPrinter.CheckStatusPrinter) or CheckReceiptPrinter(rpsStatusPrinter));

        if not Result then
          raise Exception.Create(Global.ReceiptPrinter.LastError);
      end;

      FReceipt.Load(AJsonText);
      if (Length(FReceipt.TicketList) > 0) then
        SetTicketPrint;
      if (Length(FReceipt.OrderList) > 0) or
         (Length(FReceipt.PaymentList) > 0) then
        SetReceiptPrint;
      if Global.AddonTicket.BenefitCoupon then
        SetBenefitCouponPrint;

      Result := True;
    except
      on E: Exception do
        AErrMsg := E.Message;
    end;
  finally
    FReceipt.Free;
  end;
end;

function TReceiptPrintManager.SetTicketPrint: Boolean;
var
  TI: TTicketInfo;
  PrintData: string;
  LCount, LCopies: Integer;
begin
  Result := False;
  LCount := Length(FReceipt.TicketList);
  if Global.TicketPrinter.Active then
    LCopies := Global.TicketPrinter.Copies
  else
    LCopies := Global.ReceiptPrinter.Copies;

  for var I: Integer := 0 to Pred(LCount) do
  begin
    TI := FReceipt.TicketList[I];
    PrintData := EmptyStr;
    PrintData := PrintData + rptInit;
    PrintData := PrintData + rptAlignCenter + rptSize2Times + rptCharBold;
    PrintData := PrintData + 'TICKET' + rptLF + rptLF;
    PrintData := PrintData + rptCharNormal + rptSizeNormal + rptAlignLeft;
    PrintData := PrintData + '[구매] ' + TI.PurchaseDateTime + rptLF;
    PrintData := PrintData + '[발권] ' + TI.TicketingDateTime + rptLF;
    //겹선
    PrintData := PrintData + IfThen(FDeviceType = pdtMasung, rptLineDouble1, rptLineDouble2) + rptLF;
    //부제목명
    if not TI.ProductSubTitle.IsEmpty then
      PrintData := PrintData + TI.ProductSubTitle + rptLF;
    //상품명
    PrintData := PrintData + rptSize2Times + TI.ProductName + rptSizeNormal + rptLF;
    //회차정보
    PrintData := PrintData + rptSizeHeight2X + TI.ScheduleDateTime + rptLF;
    //장소
    PrintData := PrintData + TI.PlaceName + rptSizeNormal + rptLF;
    //홀선
    PrintData := PrintData + IfThen(FDeviceType = pdtMasung, rptLineSingle1, rptLineSingle2) + rptLF;
    //권종구분,권종명,표시가격
    PrintData := PrintData + rptSizeHeight2X + Format('[%s] %s %s', [TI.DenominCategoryName, TI.DenominName, TI.MarkPrice]) + rptSizeNormal + rptLF;
    //겹선
    PrintData := PrintData + IfThen(FDeviceType = pdtMasung, rptLineDouble1, rptLineDouble2) + rptLF;
    //예매번호
    PrintData := PrintData + TI.ReserveNo + IfThen(TI.ExternalReserveNo.IsEmpty or (TI.ReserveNo = TI.ExternalReserveNo), '', ' (' + TI.ExternalReserveNo + ')') + rptLF;
    //예매자정보
    if not TI.ReserveUserTelNo.IsEmpty then
      TI.ReserveUserTelNo := Format('(%s)', [TI.ReserveUserTelNo]);
    if (not TI.ReserveUserName.IsEmpty) or (not TI.ReserveUserTelNo.IsEmpty) then
      PrintData := PrintData + Format('%s %s', [TI.ReserveUserName, TI.ReserveUserTelNo]) + rptLF;
    //예매일,예매채널,결제수단
    PrintData := PrintData + Format('%s  %s  %s', [TI.ReserveDateTime, TI.ReserveChannel, TI.PaymentMethod]) + rptLF;
    //겹선
    PrintData := PrintData + IfThen(FDeviceType = pdtMasung, rptLineDouble1, rptLineDouble2) + rptLF;
    //발행번호
    PrintData := PrintData + rptSizeNormal + rptAlignCenter + TI.IssueNo + rptLF;
    //바코드(티켓번호)
    PrintData := PrintData + rptBarCodeBegin128 + TI.TicketNo + rptBarCodeEnd + rptAlignLeft + rptLF + rptLF;
    //하단공통
    if not FReceipt.ReceiptEtcInfo.Bottom1.IsEmpty then
      PrintData := PrintData + FReceipt.ReceiptEtcInfo.Bottom1 + rptLF;
    if not FReceipt.ReceiptEtcInfo.Bottom2.IsEmpty then
      PrintData := PrintData + FReceipt.ReceiptEtcInfo.Bottom2 + rptLF;
    if not FReceipt.ReceiptEtcInfo.Bottom3.IsEmpty then
      PrintData := PrintData + FReceipt.ReceiptEtcInfo.Bottom3 + rptLF;
    if not FReceipt.ReceiptEtcInfo.Bottom4.IsEmpty then
      PrintData := PrintData + FReceipt.ReceiptEtcInfo.Bottom4 + rptLF;
    PrintData := PrintData + rptCharNormal + rptAlignCenter + FReceipt.ReceiptEtcInfo.HomeUrl + rptAlignLeft + rptLF;
    PrintData := PrintData + rptLF + rptLF + rptLF + rptLF + rptCutPartial;

    for var J: Integer := 1 to LCopies do
    begin
      Result := PrintOut(PrintData);
      if not Result then
        Exit;
    end;
  end;
end;

function TReceiptPrintManager.SetReceiptPrint: Boolean;
var
  PrintData: string;
begin
  Result := False;
  PrintData := rptInit;
  PrintData := PrintData + ReceiptHeader;
  PrintData := PrintData + ReceiptReserveInfo;
  PrintData := PrintData + ReceiptItemList;
  PrintData := PrintData + ReceiptTotalAmt;
  PrintData := PrintData + ReceiptPaymentList;
  PrintData := PrintData + ReceiptPaymentListInfo;
  PrintData := PrintData + ReceiptBottom(False); //False=영수증번호 바코드 출력 안함
  PrintData := PrintData + rptLF + rptLF + rptLF + rptLF + rptCutPartial;
  for var I: Integer := 1 to Global.ReceiptPrinter.Copies do
  begin
    Result := PrintOut(PrintData);
    if not Result then
      Exit;
  end;
end;

function TReceiptPrintManager.ReceiptHeader: string;
begin
  Result := EmptyStr;
  Result := Result + rptInit;
  Result := Result + rptAlignCenter + rptSize2Times + rptCharBold;
  Result := Result + GetTextLocale(['영 수 증', 'RECEIPT', '領収書', '收据']) + rptLF + rptLF;
  Result := Result + rptCharNormal + rptSizeNormal + rptAlignLeft;
  Result := Result + FReceipt.StoreInfo.StoreName + rptLF;
  Result := Result + Copy(FReceipt.StoreInfo.BizNo, 1, 3) + '-' + Copy(FReceipt.StoreInfo.BizNo, 4, 2) + '-' + Copy(FReceipt.StoreInfo.BizNo, 6, 5) +
    ' TEL: ' + FReceipt.StoreInfo.TelNo + ' ' + FReceipt.StoreInfo.OwnerName + rptLF;
  Result := Result + FReceipt.StoreInfo.Address + rptLF;
  Result := Result + Format('[구매] %s(%s) %s [P:%d / C:%d]',
    [Global.FormattedCurrentDate, Global.DayOfWeekName, Global.FormattedCurrentTime.Substring(0, 5), Global.StoreInfo.PartnerNo, Global.StoreInfo.CounterNo]) + rptLF;
  if not FReceipt.ReceiptEtcInfo.Top1.IsEmpty then
    Result := Result + FReceipt.ReceiptEtcInfo.Top1 + rptLF;
  if not FReceipt.ReceiptEtcInfo.Top2.IsEmpty then
    Result := Result + FReceipt.ReceiptEtcInfo.Top2 + rptLF;
  if not FReceipt.ReceiptEtcInfo.Top3.IsEmpty then
    Result := Result + FReceipt.ReceiptEtcInfo.Top3 + rptLF;
  if not FReceipt.ReceiptEtcInfo.Top4.IsEmpty then
    Result := Result + FReceipt.ReceiptEtcInfo.Top4 + rptLF;
  Result := Result + IfThen(FDeviceType = pdtMasung, rptLineDouble1, rptLineDouble2) + rptLF;
end;

function TReceiptPrintManager.ReceiptReserveInfo: string;
var
  TI: TTicketInfo;
begin
  Result := EmptyStr;
  if (Length(FReceipt.TicketList) > 0) then
  begin
    TI := FReceipt.TicketList[0];
    //부제목명
    if not TI.ProductSubTitle.IsEmpty then
      Result := Result + TI.ProductSubTitle + rptLF;
    //상품명
    Result := Result + TI.ProductName + rptLF;
    //회차정보
    Result := Result + TI.ScheduleDateTime + rptLF;
    //예매번호
    Result := Result + rptCharNormal + TI.ReserveNo + IfThen(TI.ExternalReserveNo.IsEmpty or (TI.ReserveNo = TI.ExternalReserveNo), '', ' (' + TI.ExternalReserveNo + ')') + rptLF;
    Result := Result + IfThen(FDeviceType = pdtMasung, rptLineSingle1, rptLineSingle2) + rptLF;
  end;
end;

function TReceiptPrintManager.ReceiptItemList: string;
begin
  Result := EmptyStr;
  for var I: Integer := 0 to Pred(Length(FReceipt.OrderList)) do
    Result := Result + Format('%s%12s', [
      RPadB(Format('%s(%d매)', [FReceipt.OrderList[I].DenominName, FReceipt.OrderList[I].SaleQty]), IfThen(FDeviceType = pdtMasung, 36, 30), ' '),
      FormatFloat('#,##0.##', (FReceipt.OrderList[I].UnitPrice * FReceipt.OrderList[I].SaleQty))]) + rptLF;

  if not Result.IsEmpty then
    Result := Result + IfThen(FDeviceType = pdtMasung, rptLineSingle1, rptLineSingle2) + rptLF;
end;

function TReceiptPrintManager.ReceiptTotalAmt: string;
begin
  Result := EmptyStr;
  if IsReturn then
    Result := Result + Format(IfThen(FDeviceType = pdtMasung, '취소금액%40s', '취소금액%13s'), [FormatFloat('#,##0.##', -1 * FReceipt.ReceiptEtcInfo.TotalAmt)]) + rptLF
  else
    Result := Result + Format(IfThen(FDeviceType = pdtMasung, '합계금액%40s', '합계금액%13s'), [FormatFloat('#,##0.##', FReceipt.ReceiptEtcInfo.TotalAmt)]) + rptLF;
end;

function TReceiptPrintManager.ReceiptPaymentList: string;
var
  PI: TReceiptPaymentInfo;
  LPaycoType: string;
begin
  Result := EmptyStr;
  for var I: Integer := 0 to Pred(Length(FReceipt.PaymentList)) do
  begin
    PI := FReceipt.PaymentList[I];
    if (PI.ApprovalAmt = 0) then
      Continue;

    if (PI.PaymentType = ptCash) then
    begin
      if PI.Internet and
         (not PI.ApprovalNo.IsEmpty) then
      begin
        if Trim(PI.OrgApproveNo).IsEmpty then
          Result := Result + LPadB('현금영수증(승인)', Int_33, ' ') + LPadB(FormatFloat('#,##0.##', PI.ApprovalAmt), Int_15, ' ') + rptLF
        else
          Result := Result + LPadB('현금영수증(취소)', Int_33, ' ') + LPadB(FormatFloat('#,##0.##', (-1 * PI.ApprovalAmt)), Int_15, ' ') + rptLF;
      end
      else
      begin
        Result := Result + LPadB('현금(' + IfThen(PI.Approval, '승인', '취소') + ')', Int_33, ' ') +
          LPadB(FormatFloat('#,##0.##', IfThen(PI.Approval, 1, -1) * PI.ApprovalAmt), Int_15, ' ') + rptLF;
      end;
    end;

    if (PI.PaymentType = ptCreditCard) then
    begin
      if PI.Internet then
      begin
        if PI.Approval then
          Result := Result + LPadB('신용카드(승인)', Int_33, ' ') + LPadB(FormatFloat('#,##0.##', PI.ApprovalAmt), Int_15, ' ') + rptLF
        else
          Result := Result + LPadB('신용카드(취소)', Int_33, ' ') + LPadB(FormatFloat('#,##0.##', -1 * PI.ApprovalAmt), Int_15, ' ') + rptLF;
      end
      else
      begin
        Result := Result + LPadB('카드(수기등록)', Int_33, ' ') +
          LPadB(FormatFloat('#,##0.##', IfThen(PI.Approval, 1, -1) * PI.ApprovalAmt), Int_15, ' ') + rptLF;
      end;
    end;

    if (PI.PaymentType in [ptPaycoCard, ptPaycoPoint, ptPaycoCoupon]) then
    begin
      LPaycoType := GetTextLocale(['신용카드', 'CREDIT CARD', 'クレジットカード', '信用卡']);
      if (PI.PaymentType = ptPaycoPoint) then
        LPaycoType := GetTextLocale(['포인트', 'POINT']);
      if (PI.PaymentType = ptPaycoCoupon) then
        LPaycoType := GetTextLocale(['쿠폰', 'COUPON']);

      if PI.Approval then
        Result := Result + LPadB('PAYCO' + LPaycoType + '(승인)', Int_33, ' ') + LPadB(FormatFloat('#,##0.##', PI.ApprovalAmt), Int_15, ' ') + rptLF
      else
        Result := Result + LPadB('PAYCO' + LPaycoType + '(취소)', Int_33, ' ') + LPadB(FormatFloat('#,##0.##', PI.ApprovalAmt), Int_15, ' ') + rptLF;
    end;

    if (PI.PaymentType = ptVoid) then
    begin
      if PI.Approval then
        Result := Result + LPadB('기타결제(승인)', Int_33, ' ') + LPadB(FormatFloat('#,##0.##', PI.ApprovalAmt), Int_15, ' ') + rptLF
      else
        Result := Result + LPadB('기타결제(취소)', Int_33, ' ') + LPadB(FormatFloat('#,##0.##', PI.ApprovalAmt), Int_15, ' ') + rptLF;
    end;
  end;

  if not Result.IsEmpty then
  begin
    Result := Result + rptSizeNormal;
    Result := Result + IfThen(FDeviceType = pdtMasung, rptLineSingle1, rptLineSingle2) + rptLF;
  end;
end;

function TReceiptPrintManager.ReceiptPaymentListInfo: string;
var
  PI: TReceiptPaymentInfo;
begin
  Result := EmptyStr;
  for var I: Integer := 0 to Pred(Length(FReceipt.PaymentList)) do
  begin
    PI := FReceipt.PaymentList[I];
    if (PI.PaymentType = ptCash) and
       (not Trim(PI.ApprovalNo).IsEmpty) then
    begin
      Result := Result + rptAlignLeft + rptCharNormal;
      Result := Result + RPadB('승인금액', Int_33, ' ') + LPadB(FormatFloat('#,##0.##', PI.ApprovalAmt), Int_15, ' ') + rptLF;
      Result := Result + RPadB('승인번호', Int_33, ' ') + LPadB(PI.ApprovalNo, Int_15, ' ') + rptLF;
      Result := Result + RPadB('카드번호', Int_33, ' ') + LPadB(PI.CreditCardNo, Int_15, ' ') + rptLF;
    end;

    if (PI.PaymentType = ptCreditCard) then
    begin
      Result := Result + rptCharNormal + rptAlignLeft;
      Result := Result + RPadB('승인금액', Int_33, ' ') + LPadB(FormatFloat('#,##0.##', PI.ApprovalAmt), Int_15, ' ') + rptLF;

      if (PI.InstMonth > 1) then
        Result := Result + RPadB('할부개월', Int_33, ' ') + LPadB(IntToStr(PI.InstMonth)  + '개월', Int_15, ' ') + rptLF
      else
        Result := Result + RPadB('할부개월', Int_33, ' ') + LPadB('일시불', Int_15, ' ') + rptLF;
      Result := Result + RPadB('발 급 사', Int_33, ' ') + LPadB(PI.BuyCompanyName, Int_15, ' ') + rptLF;
      Result := Result + RPadB('승인번호', Int_33, ' ') + LPadB(PI.ApprovalNo, Int_15, ' ') + rptLF;
      Result := Result + RPadB('카드번호', Int_33, ' ') + LPadB(PI.CreditCardNo, Int_15, ' ') + rptLF;
    end;

    //PAYCO는 신용카드 승인정보만 출력
    if (PI.PaymentType = ptPaycoCard) then
      Result := Result + ReceiptPaycoData(PI);
  end;

  if not Result.IsEmpty then
    Result := Result + IfThen(FDeviceType = pdtMasung, rptLineDouble1, rptLineDouble2) + rptLF;
end;

function TReceiptPrintManager.ReceiptPaycoData(const APayInfo: TReceiptPaymentInfo): string;
resourcestring
  STR1 = '***승인정보(고객용)***';
  STR2 = '승인기관     :';
  STR3 = '신용카드번호 :';
  STR4 = '할부개월     :';
  STR5 = '승인번호     :';
  STR6 = '승인일시     :';
  STR7 = '가맹점번호   :';
  STR8 = '매입사       :';
  STR9 = '매입처       :';
  STR10 = '***OK캐쉬백 포인트 내역***';
  STR11 = '적립포인트          :';
  STR12 = '사용가능 적립포인트 :';
  STR13 = '누적 적립포인트     :';
  STR14 = '일시불';
  STR15 = ' 개월';
  STR16 = '티머니카드번호 :';
  STR17 = '결제전잔액   :';
  STR18 = '결제금액     :';
  STR19 = '결제후잔액   :';
  STR22 = '***취소정보(고객용)***';
  STR23 = '쿠폰명       :';
begin
  Result := EmptyStr;
  Result := Result + rptAlignCenter + IfThen(APayInfo.Approval, STR1, STR22) + rptLF;
  Result := Result + rptAlignLeft + RPadB(STR2, Int_15, ' ') + LPadB(APayInfo.AppCompanyName, Int_33, ' ') + rptLF;
  if (APayInfo.CreditCardNo <> '') and (APayInfo.CreditCardNo <> 'null') then
    Result := Result + RPadB(STR3, Int_15, ' ') + LPadB(APayInfo.CreditCardNo, Int_33, ' ') + rptLF;
  if (APayInfo.InstMonth > 1) then
    Result := Result + RPadB(STR4, Int_15, ' ') + LPadB(IntToStr(APayInfo.InstMonth) + STR15, Int_33, ' ') + rptLF;
  Result := Result + RPadB(STR5, Int_15, ' ') + LPadB(APayInfo.ApprovalNo, Int_33, ' ') + rptLF;
  Result := Result + RPadB(STR6, Int_15, ' ') + LPadB(APayInfo.TransDateTime, Int_33, ' ') + rptLF;
  Result := Result + RPadB(STR7, Int_15, ' ') + LPadB(APayInfo.MerchantKey, Int_33, ' ') + rptLF;
  if (APayInfo.BuyCompanyName <> '') then
    Result := Result + RPadB(STR8, Int_15, ' ') + LPadB(APayInfo.BuyCompanyName, Int_33, ' ') + rptLF;
  if (APayInfo.BuyTypeName <> '') then
    Result := Result + RPadB(STR9, Int_15, ' ') + LPadB(APayInfo.BuyTypeName, Int_33, ' ') + rptLF;
end;

function TReceiptPrintManager.ReceiptBottom(const APrintBarcode: Boolean): string;
begin
  Result := EmptyStr;
  if APrintBarcode then
    Result := rptSizeNormal + rptBarCodeBegin128 + FReceipt.ReceiptEtcInfo.ReceiptNo + rptBarCodeEnd + rptLF;
  if not FReceipt.ReceiptEtcInfo.Bottom1.IsEmpty then
    Result := Result + FReceipt.ReceiptEtcInfo.Bottom1 + rptLF;
  if not FReceipt.ReceiptEtcInfo.Bottom2.IsEmpty then
    Result := Result + FReceipt.ReceiptEtcInfo.Bottom2 + rptLF;
  if not FReceipt.ReceiptEtcInfo.Bottom3.IsEmpty then
    Result := Result + FReceipt.ReceiptEtcInfo.Bottom3 + rptLF;
  if not FReceipt.ReceiptEtcInfo.Bottom4.IsEmpty then
    Result := Result + FReceipt.ReceiptEtcInfo.Bottom4 + rptLF;
  Result := Result + rptCharNormal + rptAlignCenter + FReceipt.ReceiptEtcInfo.HomeUrl + rptAlignLeft + rptLF;
end;

function TReceiptPrintManager.SetBenefitCouponPrint: Boolean;
var
  PrintData: string;
begin
  Result := True;
  PrintData := rptInit;
  PrintData := PrintData + rptCharNormal + rptCharBold + rptSize2Times + rptAlignCenter + '[관람객혜택안내]' + rptAlignLeft + rptCharNormal + rptSizeNormal + rptLF + rptLF + rptLF;
  PrintData := PrintData + rptSize2Times + '혜택1.' + rptSizeNormal + rptLF;
  if (Global.CurrentDate <= '20220531') then
    PrintData := PrintData + rptSizeHeight2X + '빛의 시어터 관람 시' + rptLF + '빛의 라운지에서 아메리카노 1잔' + rptLF + '무료 제공 (5월 31일까지)' +rptCharNormal + rptSizeNormal + rptLF + rptLF
  else
    PrintData := PrintData + rptSizeHeight2X + '빛의 시어터 또는 아트샵 이용 후' + rptLF + '빛의 라운지 방문 시 식음료 10% 할인 혜택' + rptLF + '(중복할인 불가)' +rptCharNormal + rptSizeNormal + rptLF + rptLF;
  PrintData := PrintData + rptSize2Times + '혜택2.' + rptCharNormal + rptSizeNormal + rptLF;
  PrintData := PrintData + rptSizeHeight2X + '빛의 시어터에서' + rptLF + 'PAYCO 포인트 결제 시 10% 적립 혜택' + rptCharNormal + rptSizeNormal + rptLF;
  PrintData := PrintData + '혜택 1과 중복 적용이 가능합니다.' + rptLF + rptLF;
  PrintData := PrintData + rptCharNormal + rptAlignCenter + FReceipt.ReceiptEtcInfo.HomeUrl + rptAlignLeft + rptLF;
  PrintData := PrintData + rptLF + rptLF + rptLF + rptLF + rptCutPartial;
  for var I: Integer := 1 to Global.AddonTicket.Copies do
  begin
    Result := PrintOut(PrintData);
    if not Result then
      Exit;
  end;
end;

function TReceiptPrintManager.PrintOut(const APrintData: string): Boolean;
var
  SendData: AnsiString;
begin
  Result := False;
  try
    //1장당 상태 검사로 설정 되었다면 (CheckDevicePerEach=True)
    if Global.ReceiptPrinter.CheckDevicePerEach then
    begin
      if Global.ReceiptPrinter.CheckStatusAll then
        Result := CheckReceiptPrinter(rpsStatusPaper) and
                  CheckReceiptPrinter(rpsStatusCover) and
                  CheckReceiptPrinter(rpsStatusTransmit) and
                  CheckReceiptPrinter(rpsStatusPrinter)
      else
        Result := ((not Global.ReceiptPrinter.CheckStatusPaper) or CheckReceiptPrinter(rpsStatusPaper)) and
                  ((not Global.ReceiptPrinter.CheckStatusCover) or CheckReceiptPrinter(rpsStatusCover)) and
                  ((not Global.ReceiptPrinter.CheckStatusTransmit) or CheckReceiptPrinter(rpsStatusTransmit)) and
                  ((not Global.ReceiptPrinter.CheckStatusPrinter) or CheckReceiptPrinter(rpsStatusPrinter));
      if not Result then
        raise Exception.Create(Global.ReceiptPrinter.LastError);
    end;

    SendData := ConvertPrintData(APrintData);
    Global.ReceiptPrinter.ComDevice.Write(PAnsiChar(SendData), Length(SendData), False);
    Result := True;
  except
    on E: Exception do
      SendPluginCommand(CPC_PRINT_ERROR, 0, Global.PluginInfo.PrintingMsgPluginId);
  end;
end;

function TReceiptPrintManager.ConvertPrintData(const AData: string): string;
begin
  Result := AData;
  Result := ReplaceStr(Result, rptInit,           #27#64);                   // ESC @
  Result := ReplaceStr(Result, rptLF,             #13#10);                   // CR LF

  Result := ReplaceStr(Result, rptCutFull,        #27#105);                  // ESC i
  Result := ReplaceStr(Result, rptCutPartial,     #27#109);                  // ESC m

  Result := ReplaceStr(Result, rptImage1,         #13#28#112#1#0);           // CR FS p SOH NUL
  Result := ReplaceStr(Result, rptImage2,         #13#28#112#2#0);           // CR FS p STX NUL

  Result := ReplaceStr(Result, rptDrawerOpen,     #27#112#0#25#250#13#10);   // ESC p NUL EM $FA CR LF

  Result := ReplaceStr(Result, rptCharNormal,     #27#71#0#29#66#0#27#45#0); // ESC G NUL GS B NUL ESC - NUL
  Result := ReplaceStr(Result, rptCharInverse,    #29#66#1);                 // GS B SOH
  Result := ReplaceStr(Result, rptCharUnderline1, #27#45#1);                 // ESS - SOH
  Result := ReplaceStr(Result, rptCharUnderline2, #27#45#2);                 // ESC - STX

  Result := ReplaceStr(Result, rptAlignLeft,      #27#97#0);                 // ESC a NUL
  Result := ReplaceStr(Result, rptAlignCenter,    #27#97#1);                 // ESC a SOH
  Result := ReplaceStr(Result, rptAlignRight,     #27#97#2);                 // ESC a STX

  Result := ReplaceStr(Result, rptSpacingNormal,  #27#51#60);                // ESC 3 <
  Result := ReplaceStr(Result, rptSpacingNarrow,  #27#51#50);                // ESC 3 2
  Result := ReplaceStr(Result, rptSpacingWide,    #27#51#120);               // ESC 3 x

  if (FDeviceType = pdtMasung) then
  begin
    Result := ReplaceStr(Result, rptSizeNormal,   #29#33#0);                 // GS ! NUL
    Result := ReplaceStr(Result, rptSizeHeight2X, #29#33#1);                 // GS ! SOH
    Result := ReplaceStr(Result, rptSizeWidth2X,  #29#33#16);                // GS ! (space)
    Result := ReplaceStr(Result, rptSize2Times,   #29#33#17);                // ESC ! 0

    Result := ReplaceStr(Result, rptCharBold,     #27#69#1);                 // ESC E SOH
  end
  else
  begin
    Result := ReplaceStr(Result, rptSizeNormal,   #27#33#0);                 // ESC ! NUL
    Result := ReplaceStr(Result, rptSizeHeight2X, #27#33#16);                // ESC ! DLE
    Result := ReplaceStr(Result, rptSizeWidth2X,  #27#33#32);                // ESC ! (space)
    Result := ReplaceStr(Result, rptSize2Times,   #27#33#48);                // ESC ! 0

    Result := ReplaceStr(Result, rptCharBold,     #27#71#1);                 // ESC E SOH
  end;
  Result := ConvertBarcodeCommand(Result);
end;

function TReceiptPrintManager.ConvertBarcodeCommand(AData: string): string;
const
  BAR_HEIGHT = #$50; //바코드높이
  BAR_CODE39 = #69;
  BAR_ITF = #70;
  BAR_CODABAR = #71;
  BAR_CODE93 = #72;
  BAR_CODE128 = #$49; //#73;
var
  BeginPos128, BeginPos39, BeginPos, EndPos: Integer;
  ChkBarCode39: Boolean;
  ALen: Char;
  BarCodeOrg, BarCodeToStr: string;
begin
  while (Pos(rptBarCodeEnd, AData) > 0) do
  begin
    BeginPos128 := Pos(rptBarCodeBegin128, AData);
    BeginPos39 := Pos(rptBarCodeBegin39, AData);
    BeginPos := Min(BeginPos128, BeginPos39);

    if (BeginPos128 = 0) then
      BeginPos := BeginPos39;
    if (BeginPos39 = 0) then
      BeginPos := BeginPos128;

    ChkBarCode39 := (BeginPos = BeginPos39);
    EndPos := Pos(rptBarCodeEnd, AData);

    if (BeginPos < 1) then
      Break;
    if (EndPos < 1) then
      Break;
    if (BeginPos >= EndPos) then
      Break;

    BarCodeOrg := Copy(AData, BeginPos + 3, EndPos - BeginPos - 3);
    if ChkBarCode39 then //CODE39
    begin
      ALen := Char(Length(BarCodeOrg));
      BarCodeToStr := #$1D#$68 + BAR_HEIGHT + #$1D#$77#$02#$1B#$61#$01#$1D#$48#$02#$1D#$6B + BAR_CODE39 + ALen + BarCodeOrg;
      AData := ReplaceStr(AData, rptBarCodeBegin39 + BarCodeOrg + rptBarCodeEnd, BarCodeToStr);
    end
    else
    begin //CODE128
      ALen := Char(Length(BarCodeOrg) + 2); //2를 더해야 함
      BarCodeToStr := #$1D#$68 + BAR_HEIGHT + #$1D#$77#$02#$1B#$61#$01#$1D#$48#$02#$1D#$6B + BAR_CODE128 + ALen + #$7B#$42 + BarCodeOrg;
      AData := ReplaceStr(AData, rptBarCodeBegin128 + BarCodeOrg + rptBarCodeEnd, BarCodeToStr);
    end;
  end;
  Result := AData;
end;

function TReceiptPrintManager.MakeQRCodeCommand(const AQRCode: string): string;
begin
//  Result := Result + #27#64; //초기화
  Result := Result + #29#40#107#3#0#49#65#50#0; //QR코드 포맷
  Result := Result + #29#40#107#3#0#49#67#8; //사이즈
  Result := Result + #29#40#107 + Chr(Length(AQRCode) + 3) + #0 + #49#80#48 + AQRCode; //QR데이터
  Result := Result + #29#40#107#3#0#49#81#48; //인코딩
//  Result := Result + #27#105;
end;

function TReceiptPrintManager.ByteLen(const AText: string): Integer;
begin
  Result := 0;
  for var I: Integer := 1 to Length(AText) do
    Result := Result + IfThen(AText[I] <= #$00FF, 1, 2);
end;

function TReceiptPrintManager.LPadB(const AStr: string; const ALength: Integer; const APadChar: Char): string;
begin
  Result := SCopy(AStr, 1, ALength);
  Result := PadChar(ALength - ByteLen(Result), APadChar) + Result;
end;

function TReceiptPrintManager.RPadB(const AStr: string; const ALength: Integer; const APadChar: Char): string;
begin
  Result := SCopy(AStr, 1, ALength);
  Result := Result + PadChar(ALength - ByteLen(Result), APadChar);
end;

function TReceiptPrintManager.SCopy(const S: AnsiString; const F, L: Integer): string;
var
  ST, ED: Integer;
begin
  ST := 0;
  ED := 0;
  if (F = 1) then
    ST := 1
  else
  begin
    case ByteType(S, F) of
      mbSingleByte: ST := F;
      mbLeadByte: ST := F;
      mbTrailByte: ST := (F - 1);
    end;
  end;

  case ByteType(S, ST + L - 1) of
    mbSingleByte: ED := L;
    mbLeadByte: ED := (L - 1);
    mbTrailByte: ED := L;
  end;
  Result := Copy(S, ST, ED);
end;

function TReceiptPrintManager.PadChar(const ALength: Integer; const APadChar: Char): string;
begin
  Result := '';
  for var I: Integer := 1 to ALength do
    Result := Result + APadChar;
end;

(*
function TReceiptPrintManager.GetCurrencyString(const AData: Currency): string;
begin
  Result := FormatFloat('#,##0.###', AData);
end;

function TReceiptPrintManager.DateTimeStrToString(const ADateTime: string): string;
begin
  if (Length(ADateTime) = 14) then
    Result := Copy(ADateTime, 1, 4) + Global.FormatSettings.DateSeparator + Copy(ADateTime, 5, 2) + Global.FormatSettings.DateSeparator + Copy(ADateTime, 7, 2) + ' ' +
              Copy(ADateTime, 9, 2) + Global.FormatSettings.TimeSeparator + Copy(ADateTime, 11, 2) + Global.FormatSettings.TimeSeparator + Copy(ADateTime, 13, 2);
end;
*)

end.
