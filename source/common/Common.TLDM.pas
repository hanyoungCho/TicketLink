unit Common.TLDM;

(*
[Testbed] ABSDB.DatabaseFileName = D:\Works\ticketlink\build\data\TicketLink.adb
*)

interface

uses
  { Native }
  System.Classes, System.SysUtils, Data.DB, System.ImageList, Vcl.ImgList, Vcl.Controls,
  Vcl.Graphics, Vcl.Menus,
  { DevExpress }
  cxStyles, cxClasses,
  { ABSDB }
  ABSMain,
  { TMS }
  AdvMenus,
  { VAN }
  uVanDaemonModule, uPaycoNewModule;

{$I common.TLGlobal.inc}

type
  { Data Field 정보 }
  TFieldInfoRec = record
    FieldName: string;
    FieldType: TFieldType;
    FieldValue: Variant;
  end;

  THTTPDownloadCallback = reference to function(const AFileUrl: string): Boolean;

  TTLDataModule = class(TDataModule)
    ABSDB: TABSDatabase;
    TBReceipt: TABSTable;
    TBOrder: TABSTable;
    TBPayment: TABSTable;
    TBReceiptpartner_no: TIntegerField;
    TBReceiptcounter_no: TIntegerField;
    TBReceiptreceipt_no: TStringField;
    TBReceiptsale_date: TStringField;
    TBReceiptsale_time: TStringField;
    TBReceiptupdate_dttm: TDateTimeField;
    TBOrderreceipt_no: TStringField;
    TBOrderproduct_id: TIntegerField;
    TBOrderschedule_id: TIntegerField;
    TBOrderdenomin_id: TIntegerField;
    TBOrderunit_price: TIntegerField;
    TBOrdersale_qty: TIntegerField;
    TBOrdersale_amt: TIntegerField;
    TBOrderupdate_dttm: TDateTimeField;
    TBPaymentreceipt_no: TStringField;
    TBPaymentpay_method: TSmallintField;
    TBPaymentapproval_yn: TBooleanField;
    TBPaymentvan_cd: TStringField;
    TBPaymenttid: TStringField;
    TBPaymentmanual_yn: TBooleanField;
    TBPaymentcredit_card_no: TStringField;
    TBPaymentinst_mon: TIntegerField;
    TBPaymentapprove_amt: TIntegerField;
    TBPaymentvat: TIntegerField;
    TBPaymentservice_amt: TIntegerField;
    TBPaymentapprove_no: TStringField;
    TBPaymentorg_approve_no: TStringField;
    TBPaymenttrade_no: TStringField;
    TBPaymenttrade_dttm: TStringField;
    TBPaymentissuer_cd: TStringField;
    TBPaymentissuer_nm: TStringField;
    TBPaymentbuyer_div: TStringField;
    TBPaymentbuyer_cd: TStringField;
    TBPaymentbuyer_nm: TStringField;
    TBPaymentupdate_dttm: TDateTimeField;
    TBPaymentpayco_pay_method: TStringField;
    csrGridStyle: TcxStyleRepository;
    StandStyleHeader: TcxStyle;
    StandStyleBandHeader: TcxStyle;
    StandStyleSelectionWhite: TcxStyle;
    StandStyleSelection: TcxStyle;
    TBPaymentmerchant_key: TStringField;
    TBOrderproduct_nm: TStringField;
    TBOrderdenomin_nm: TStringField;
    TBOrderdenomin_category_nm: TStringField;
    TBOrderdenomin_category_id: TIntegerField;
    TBReceiptsale_amt: TIntegerField;
    TBReceiptdc_amt: TIntegerField;
    TBReceiptpayment_amt: TIntegerField;
    TBReceiptvat: TIntegerField;
    TBReceiptproduct_id: TIntegerField;
    TBReceiptschedule_id: TIntegerField;
    TBReceiptproduct_round: TIntegerField;
    TBReceiptsale_qty: TIntegerField;
    TBReceiptreceipt_status: TSmallintField;
    TBOrderproduct_round: TSmallintField;
    TBOrderproduct_grade_id: TIntegerField;
    TBPaymenttrade_request_no: TStringField;
    TBPaymentpin_code: TStringField;
    TBReceiptreserve_no: TLargeintField;
    MTProduct: TABSTable;
    MTRound: TABSTable;
    MTDenomin: TABSTable;
    MTReserveList: TABSTable;
    MTTicketList: TABSTable;
    MTTicketTemplate: TABSTable;

    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function InitDB(const ADBFileName: string; const ARepair: Boolean; var AResMsg: string): Boolean;
    function CreateABSMemTable(var AResMsg: string): Boolean;
    function ExecuteABSQuery(const ASQL: string; var AResMsg: string; const AInMemory: Boolean=False): Boolean;
    function TruncateABSTable(const ATableName: TABSTable; const AInMemory: Boolean=False): Boolean; overload;
    function TruncateABSTable(const ATableName: string; const AInMemory: Boolean=False): Boolean; overload;

    function GetStreamFromUrl(const AFileUrl: string; var AMemoryStream: TMemoryStream): Boolean;
    function GetFileFromUrl(const AFileUrl: string; const AFileName: string): Boolean;
    function RequestToTicketLink(const AUrl, AJobName, AReqJSON: string; var ARespJSON, AResMsg: string): Boolean;
    function GetSettingInfo(var AResMsg: string): Boolean;
    function GetProductList(var AResMsg: string): Boolean;
    function GetRoundList(const AProductId: Integer; const AProductDate: string; var AResMsg: string): Boolean;
    function GetDenominList(const AScheduleId: Integer; var AResMsg: string): Boolean;
    function GetContentList(var AResMsg: string): Boolean;
    function GetReserveListByReserveNo(const AReserveNo: Int64; var ADataCount: Integer; var AReserveUserName, AResMsg: string): Boolean;
    function GetReserveList(const ASearchType: Integer; const ASearchValue, ABirthday: string; var ADataCount: Integer; var AReserveUserName, AResMsg: string): Boolean;
    function GetTicketList(const AReserveNo: Int64; var ADataCount: Integer; var AResMsg: string): Boolean;
    function PostReservation(const AReceiptNo, ATicketLinkPaymentType: string; var AReserveNo: Int64; var AResMsg: string): Boolean;
    procedure PostCheckAlive;
    procedure DoCacheNoticeImages;

    function DoICReaderVerify(const AVanCode, AVanTID: string; var AErrMsg: string): Boolean;
    function GetICCardInsertionStatus(var ARespCode, ARespMsg: AnsiString): Boolean;

    function DoApproveCARD(const AReceiptNo: string; const APaymentAmt: Integer; var AStoredData: Boolean; var AResMsg: string): Boolean;
    function DoApprovePAYCO(const AReceiptNo: string; const APaymentAmt: Integer; const APinCode: string; var AStoredData: Boolean; var AResMsg: string): Boolean;
{$IFDEF PAYCO_VCAT_PERSIST}
    function DoApprovePAYCO_VCAT(const AReceiptNo: string; const APaymentAmt: Integer; var AStoredData: Boolean; var AResMsg: string): Boolean;
{$ENDIF}

    function RequestToPAYCO(const AUrl, AJobName: string; const AReqJSON: string; var ARespJSON: string; AResMsg: string): Boolean;
    function DoCertifyPAYCO(var AResMsg: string): Boolean;
    function GetSignaturePAYCO(const APinCode: string): string;

    function UpdateReceipt(const AReceiptNo: string; const ASaleAmt, ADiscountAmt, AVAT: Integer; const ATradeDate, ATradeTime: string; var AResMsg: string): Boolean;
    function UpdatePaymentCARD(const AIsApproval: Boolean; const AReceiptNo: string; const APayMethod: Integer; RI: TCardRecvInfoDM; var AResMsg: string): Boolean;
    function UpdatePaymentPAYCO(const AIsApproval: Boolean; const AReceiptNo, APInCode, ATradeRequestNo: string; const APayMethod: Integer; RI: TPaycoNewRecvInfo; var AResMsg: string): Boolean;

    function GetPrintingScript(const AReceiptNo: string; const AReserveNo: Int64; const AReceiptPrint: Boolean; var AResMsg: string): Boolean;
  end;

var
  DM: TTLDataModule;

procedure AddFieldInfo(var AFields: TArray<TFieldInfoRec>; const AFieldName: string; const AFieldType: TFieldType; const AFieldValue: Variant);
function MakeInsertSQL(const ATableName: string; const AFields: TArray<TFieldInfoRec>; var ASQL: string): Boolean; overload;
function MakeInsertSQL(const AInMemory: Boolean; const ATableName: string; const AFields: TArray<TFieldInfoRec>; var ASQL: string): Boolean; overload;

implementation

uses
  { Native }
  System.DateUtils, System.StrUtils, Vcl.Forms, Vcl.Imaging.Jpeg, WinApi.UrlMon, System.Hash,
  System.NetEncoding,
  { Indy }
  IdGlobal, IdHTTP, IdSSLOpenSSL, IdURI,
  { Chilkat DLL API }
  Chilkat.JsonObject, Chilkat.JsonArray,
  { Absolute Database }
  ABSTypes, ABSConverts, ABSDecUtil,
  { Plugin System }
  uPluginMessages,
  { Project }
  Common.TLGlobal, Common.TLCommonLib, Common.MediaPlayThread, Common.TLMsgBox;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure AddFieldInfo(var AFields: TArray<TFieldInfoRec>; const AFieldName: string; const AFieldType: TFieldType; const AFieldValue: Variant);
var
  LCount: ShortInt;
begin
  LCount := Length(AFields);
  SetLength(AFields, Succ(LCount));
  AFields[LCount].FieldName := AFieldName;
  AFields[LCount].FieldType := AFieldType;
  AFields[LCount].FieldValue := AFieldValue;
end;

function MakeInsertSQL(const ATableName: string; const AFields: TArray<TFieldInfoRec>; var ASQL: string): Boolean;
begin
  Result := MakeInsertSQL(False, ATableName, AFields, ASQL);
end;
function MakeInsertSQL(const AInMemory: Boolean; const ATableName: string; const AFields: TArray<TFieldInfoRec>; var ASQL: string): Boolean;
var
  LCount: ShortInt;
  LLength: Integer;
  LValue: string;
  LMimeCoder: TStringFormat_MIME64; //in ABSDecUtil
  MS: TMemoryStream;
begin
  ASQL := '';
  Result := False;
  try
    LCount := Length(AFields);
    if (LCount = 0) then
      raise Exception.Create('DM.MakeInsertSQL.Exception = SQL 구문을 생성할 데이터 필드 정보가 없습니다.');
    ASQL := Format('INSERT INTO %s %s (', [IfThen(AInMemory, 'MEMORY', ''), ATableName]);
    for var I := 0 to High(AFields) do
    begin
      if (I = 0) then
        ASQL := ASQL + _CRLF + '  '
      else
        ASQL := ASQL + _CRLF + '  , ';
      ASQL := ASQL + AFields[I].FieldName
    end;
    ASQL := ASQL + _CRLF + ') VALUES (';
    for var I := 0 to High(AFields) do
    begin
      if (I = 0) then
        ASQL := ASQL + _CRLF + '  '
      else
        ASQL := ASQL + _CRLF + '  , ';
      case AFields[I].FieldType of
        ftString:
          ASQL := ASQL + Format('%s', [QuotedStr(AFields[I].FieldValue)]);
        ftSmallInt,
        ftInteger,
        ftLargeInt,
        ftShortInt,
        ftWord:
          ASQL := ASQL + Format('%d', [Integer(AFields[I].FieldValue)]);
        ftFloat:
          ASQL := ASQL + Format('%s', [FloatToStr(AFields[I].FieldValue)]);
        ftBoolean:
          ASQL := ASQL + Format('%s', [BoolToStr(AFields[I].FieldValue, True)]);
        ftBlob,
        ftMemo:
          begin
            LValue := AFields[I].FieldValue;
            LLength := Length(LValue);
            if (LLength > 0) then
            begin
              LMimeCoder := TStringFormat_MIME64.Create;
              MS := TMemoryStream.Create;
              try
                MS.WriteBuffer(Pointer(LValue)^, LLength);
                MS.Position := 0;
                ASQL := ASQL + Format('MimeToBin(%s)', [QuotedStr(LMimeCoder.StrTo(MS.Memory, MS.Size))]);
              finally
                LMimeCoder.Free;
                MS.Free;
              end;
            end;
          end
        else
          raise Exception.Create(Format('DM.MakeInsertSQL.Exception = %s 필드는 알 수 없는 데이터 형식입니다.', [AFields[I].FieldName]));
      end;
    end;
    ASQL := ASQL + _CRLF + ');';
{$IFDEF DEBUG}
    WriteToFile(Global.LogDir + Format('MakeInsertSQL(%s).sql', [ATableName]), ASQL, True);
{$ENDIF}
    Result := True;
  except
    on E: Exception do
      AddLog(Format('DM.MakeInsertSQL(%s).Exception = %s', [ATableName, E.Message]));
  end;
end;

{ TdxMemDataHelper }

{ TDM }

procedure TTLDataModule.DataModuleCreate(Sender: TObject);
begin
//
end;

procedure TTLDataModule.DataModuleDestroy(Sender: TObject);
begin
//
end;

function TTLDataModule.InitDB(const ADBFileName: string; const ARepair: Boolean; var AResMsg: string): Boolean;
var
  LResMsg: string;
begin
  Result := False;
  try
    if ABSDB.Connected then
      ABSDB.Connected := False;

    ABSDB.DatabaseFileName := ADBFileName;
    ABSDB.CompactDatabase;
    if ARepair then
      ABSDB.RepairDatabase;

    { Physical Table }
    TBReceipt.Active := True;
    TBOrder.Active := True;
    TBPayment.Active := True;

    { Memory Table }
    if not CreateABSMemTable(LResMsg) then
      raise Exception.Create(LResMsg);
    MTProduct.Active := True;
    MTRound.Active := True;
    MTDenomin.Active := True;
    MTReserveList.Active := True;
    MTTicketList.Active := True;
    MTTicketTemplate.Active := True;

    Result := True;
  except
    on E: Exception do
    begin
      ABSDB.Connected := False;
      AResMsg := E.Message;
    end;
  end;
end;

function TTLDataModule.CreateABSMemTable(var AResMsg: string): Boolean;
var
  LTableName: string;
begin
  Result := False;
  with TABSQuery.Create(nil) do
  try
    DatabaseName := ABSDB.DatabaseName;
    InMemory := True;
    try
      LTableName := 'MTProduct';
      SQL.Clear;
      SQL.Add(Format('DROP TABLE %s;', [LTableName]));
      SQL.Add(Format('CREATE TABLE %s (seq AUTOINC', [LTableName]));
      SQL.Add(', product_id INTEGER DEFAULT 0'); //
      SQL.Add(', product_name VARCHAR(100)'); //
      SQL.Add(', product_name_eng VARCHAR(100)'); //
      SQL.Add(', product_class_type VARCHAR(10)'); //
      SQL.Add(', product_type_code VARCHAR(10)'); //
      SQL.Add(', soldout LOGICAL DEFAULT False'); //
      SQL.Add(', start_date VARCHAR(10)'); //
      SQL.Add(', end_date VARCHAR(10)'); //
      SQL.Add(', display_product_date VARCHAR(50)'); //
      SQL.Add(', product_image BLOB');
      SQL.Add(Format(', PRIMARY KEY %s_PK (seq)', [LTableName]));
      SQL.Add(');');
      ExecSQL;

      LTableName := 'MTRound';
      SQL.Clear;
      SQL.Add(Format('DROP TABLE %s;', [LTableName]));
      SQL.Add(Format('CREATE TABLE %s (seq AUTOINC', [LTableName]));
      SQL.Add(', schedule_id INTEGER DEFAULT 0'); //
      SQL.Add(', schedule_datetime VARCHAR(19)'); //
      SQL.Add(', product_round INTEGER DEFAULT 0'); //
      SQL.Add(', soldout LOGICAL DEFAULT False'); //
      SQL.Add(', remain_count INTEGER DEFAULT 0'); //
      SQL.Add(', show_remain_count LOGICAL DEFAULT False'); //
      SQL.Add(Format(', PRIMARY KEY %s_PK (seq)', [LTableName]));
      SQL.Add(');');
      ExecSQL;

      LTableName := 'MTDenomin';
      SQL.Clear;
      SQL.Add(Format('DROP TABLE %s;', [LTableName]));
      SQL.Add(Format('CREATE TABLE %s (seq AUTOINC', [LTableName]));
      SQL.Add(', schedule_id INTEGER DEFAULT 0'); //
      SQL.Add(', product_grade_id INTEGER DEFAULT 0'); //
      SQL.Add(', product_grade_name VARCHAR(50)'); //
      SQL.Add(', sale_price INTEGER DEFAULT 0'); //
      SQL.Add(', grade_order_of_priority INTEGER DEFAULT 0'); //
      SQL.Add(', product_denomination_id INTEGER DEFAULT 0'); //
      SQL.Add(', product_denomination_name VARCHAR(50)'); //
      SQL.Add(', product_denomination_name_eng VARCHAR(50)'); //
      SQL.Add(', denomination_class_code VARCHAR(10)'); //
      SQL.Add(', denomination_order_of_priority INTEGER DEFAULT 0'); //
      SQL.Add(', per_max_count INTEGER DEFAULT 0'); //
      SQL.Add(', per_min_count INTEGER DEFAULT 0'); //
      SQL.Add(', product_sale_count INTEGER DEFAULT 0'); //
      SQL.Add(', schedule_sale_count INTEGER DEFAULT 0'); //
      SQL.Add(', per_person_max_count INTEGER DEFAULT 0'); //
      SQL.Add(', round_max_count INTEGER DEFAULT 0'); //
      SQL.Add(', buy_double_count INTEGER DEFAULT 0'); //
      SQL.Add(', site_denomination_category_id INTEGER DEFAULT 0'); //
      SQL.Add(', site_denomination_category_name VARCHAR(50)'); //
      SQL.Add(', site_denomination_code_order INTEGER DEFAULT 0'); //
      SQL.Add(', denomination_limit_count INTEGER DEFAULT 0'); //
      SQL.Add(', schedule_remain_count INTEGER DEFAULT 0'); //
      SQL.Add(', denomination_description VARCHAR(300)'); //
      SQL.Add(', limit_card_kcp_payment_yn LOGICAL DEFAULT False'); //
      SQL.Add(', limit_card_bin_code_list MEMO'); //
      SQL.Add(Format(', PRIMARY KEY %s_PK (seq)', [LTableName]));
      SQL.Add(');');
      ExecSQL;

      LTableName := 'MTReserveList';
      SQL.Clear;
      SQL.Add(Format('DROP TABLE %s;', [LTableName]));
      SQL.Add(Format('CREATE TABLE %s (seq AUTOINC', [LTableName]));
      SQL.Add(', reserve_no LARGEINT DEFAULT 0'); //
      SQL.Add(', product_id INTEGER DEFAULT 0'); //
      SQL.Add(', product_name VARCHAR(100)'); //
      SQL.Add(', product_name_eng VARCHAR(100)'); //
      SQL.Add(', external_reserve_no VARCHAR(20)'); //
      SQL.Add(', reserve_count INTEGER DEFAULT 0'); //
      SQL.Add(', product_datetime VARCHAR(20)'); //
      SQL.Add(', place_name VARCHAR(100)'); //
      SQL.Add(', place_name_eng VARCHAR(100)'); //
      SQL.Add(', seat_attribute_info VARCHAR(100)'); //
      SQL.Add(', reserve_user_name VARCHAR(50)'); //
      SQL.Add(', is_qualification_needed LOGICAL DEFAULT False'); //
      SQL.Add(', product_class_type VARCHAR(10)'); //
      SQL.Add(', schedule_id INTEGER DEFAULT 0'); //
      SQL.Add(', external_service_type VARCHAR(10)'); //
      SQL.Add(', external_service_type_name VARCHAR(100)'); //
      SQL.Add(', ticketable_ticket_no_list VARCHAR(200)'); //
      SQL.Add(', product_image BLOB');
      SQL.Add(', is_denomination_description_exposure LOGICAL DEFAULT False'); //
      SQL.Add(', denomination_description_list MEMO'); //
      SQL.Add(Format(', PRIMARY KEY %s_PK (seq)', [LTableName]));
      SQL.Add(');');
      ExecSQL;

      LTableName := 'MTTicketList';
      SQL.Clear;
      SQL.Add(Format('DROP TABLE %s;', [LTableName]));
      SQL.Add(Format('CREATE TABLE %s (seq AUTOINC', [LTableName]));
      SQL.Add(', reserve_no LARGEINT DEFAULT 0'); //
      SQL.Add(', external_reserve_no VARCHAR(20)'); //
      SQL.Add(', reserve_datetime VARCHAR(20)'); //
      SQL.Add(', product_name VARCHAR(100)'); //
      SQL.Add(', product_sub_name VARCHAR(100)'); //
      SQL.Add(', product_schedule VARCHAR(100)'); //
      SQL.Add(', place_hall_name VARCHAR(100)'); //
      SQL.Add(', site_denomination_category VARCHAR(30)'); //
      SQL.Add(', product_denomination_name VARCHAR(50)'); //
      SQL.Add(', product_denomination_name_eng VARCHAR(50)'); //
      SQL.Add(', mark_price VARCHAR(30)'); //
      SQL.Add(', reserve_member_name VARCHAR(30)'); //
      SQL.Add(', reserve_member_contact VARCHAR(20)'); //
      SQL.Add(', reserve_contact VARCHAR(20)'); //
      SQL.Add(', reserve_channel VARCHAR(50)'); //
      SQL.Add(', payment_method VARCHAR(30)'); //
      SQL.Add(', publish_no VARCHAR(50)'); //
      SQL.Add(', barcode VARCHAR(30)'); //
      SQL.Add(Format(', PRIMARY KEY %s_PK (seq)', [LTableName]));
      SQL.Add(');');
      ExecSQL;

      LTableName := 'MTTicketTemplate';
      SQL.Clear;
      SQL.Add(Format('DROP TABLE %s;', [LTableName]));
      SQL.Add(Format('CREATE TABLE %s (seq AUTOINC', [LTableName]));
      SQL.Add(', reserve_no LARGEINT DEFAULT 0'); // 예매번호
      SQL.Add(', ticketlink_reserve_no VARCHAR(30)'); // 티켓링크 예매번호
      SQL.Add(', ticket_no VARCHAR(20)'); // 티켓번호
      SQL.Add(', barcode_info VARCHAR(20)'); // 바코드
      SQL.Add(', object_id INTEGER DEFAULT 0'); // Object ID
      SQL.Add(', template_id INTEGER DEFAULT 0'); // 템플릿 ID
      SQL.Add(', ticket_direction SHORTINT DEFAULT 0'); // 출력 구분 TLabelDirection(0: horizontal, 1: vertical)
      SQL.Add(', pxx SMALLINT DEFAULT 0'); // 위치 X 픽셀값
      SQL.Add(', pxy SMALLINT DEFAULT 0'); // 위치 Y 픽셀값
      SQL.Add(', mmx FLOAT DEFAULT 0'); // 위치 X mm값
      SQL.Add(', mmy FLOAT DEFAULT 0'); // 위치 Y mm값
      SQL.Add(', pxwidth SMALLINT DEFAULT 0'); // 크기 Width (Pixel)
      SQL.Add(', pxheight SMALLINT DEFAULT 0'); // 크기 Height (Pixel)
      SQL.Add(', mmwidth FLOAT DEFAULT 0'); // 크기 Width (mm)
      SQL.Add(', mmheight FLOAT DEFAULT 0'); // 크기 Height (mm)
      SQL.Add(', bold LOGICAL DEFAULT False'); // 굵은 글씨체 여부
      SQL.Add(', font_size SHORTINT DEFAULT 1'); // 글꼴 크기 (1..9)
      SQL.Add(', rotate_code SHORTINT DEFAULT 0'); // 회전 코드 (0, 1, 2, 3)
      SQL.Add(', degree_rotation SMALLINT DEFAULT 0'); // 회전 각도 (0, 90, 180, 270)
      SQL.Add(', editable_component_type SHORTINT DEFAULT 0'); // 데이터 형식 TLabelType(0: text, 1: background, 2: barcode, 3: qrcode)
      SQL.Add(', text_content VARCHAR(100)'); // 출력할 값
      SQL.Add(', text_align SHORTINT DEFAULT 0'); // 정렬 방식 TLabelAlign(0: left, 1: right) - right 정렬은 사용 안함
      SQL.Add(', ticket_size_type SMALLINT DEFAULT 150'); // 티켓 사이즈 (ticketSize_150, ticketSize_187, ticketSize_270)
      SQL.Add(Format(', PRIMARY KEY %s_PK (seq)', [LTableName]));
      SQL.Add(');');
      ExecSQL;

      Result := True;
    except
      on E: Exception do
      begin
        AResMsg := E.Message;
        AddLog(Format('DM.CreateABSMemTable(%s).Exception = %s', [LTableName, E.Message]));
      end;
    end;
  finally
//    LTable.Close;
//    LTable.Free;
    Close;
    Free;
  end;
end;

function TTLDataModule.ExecuteABSQuery(const ASQL: string; var AResMsg: string; const AInMemory: Boolean): Boolean;
begin
  Result := False;
  AResMsg := '';
  with TABSQuery.Create(nil) do
  try
    try
      if AInMemory then
        InMemory := True
      else
        DatabaseName := ABSDB.DatabaseName;
      SQL.Text := ASQL;
{$IFDEF DEBUG}
      SQL.SaveToFile(Global.LogDir + 'ExecuteABSQuery.sql');
{$ENDIF}
      ExecSQL;
      Result := True;
    except
      on E: Exception do
      begin
        AResMsg := E.Message;
        AddLog(Format('DM.ExecuteABSQuery.Exception = %s', [E.Message]));
      end;
    end;
  finally
    Close;
    Free;
  end;
end;

function TTLDataModule.TruncateABSTable(const ATableName: TABSTable; const AInMemory: Boolean): Boolean;
begin
  try
    Result := TruncateABSTable(ATableName.TableName, AInMemory);
  finally
    ATableName.Refresh;
  end;
end;
function TTLDataModule.TruncateABSTable(const ATableName: string; const AInMemory: Boolean): Boolean;
var
  LResMsg: string;
begin
  Result := False;
  try
    if not ExecuteABSQuery(Format('TRUNCATE TABLE %s;', [IfThen(AInMemory, 'MEMORY ', '') + ATableName]), LResMsg, AInMemory) then
      raise Exception.Create(LResMsg);
    Result := True;
  except
    on E: Exception do
      AddLog(Format('DM.TruncateABSTable.Exception = %s', [E.Message]));
  end;
end;

function TTLDataModule.GetStreamFromUrl(const AFileUrl: string; var AMemoryStream: TMemoryStream): Boolean;
var
  HC: TIdHTTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL;
  LUseSSL: Boolean;
begin
  Result := False;
  LUseSSL := (LowerCase(Copy(AFileUrl, 1, 8)) = 'https://');
  HC := TIdHTTP.Create(nil);
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    AMemoryStream.Clear;
    try
      if LUseSSL then
      begin
        SSL.SSLOptions.Method := sslvSSLv23;
        SSL.SSLOptions.Mode := sslmClient;
        HC.IOHandler := SSL;
      end;

      HC.Get(TIdURI.URLEncode(AFileUrl), AMemoryStream);
{$IFDEF DEBUG}
      var LPos: Integer := LastDelimiter('/', AFileUrl);
      AMemoryStream.SaveToFile(Global.LogDir + Copy(AFileUrl, LPos + 1, Length(AFileUrl) - (LPos)));
{$ENDIF}
      AMemoryStream.Position := 0;
      Result := True;
    except
      on E: Exception do
        AddLog(Format('DM.GetStreamFromUrl.Exception = Url: %s, Error: %s', [AFileUrl, E.Message]));
    end;
  finally
    FreeAndNil(SSL);
    HC.Disconnect;
    FreeAndNil(HC);
  end;
end;

function TTLDataModule.GetFileFromUrl(const AFileUrl: string; const AFileName: string): Boolean;
var
  MS: TMemoryStream;
begin
  Result := False;
  MS := TMemoryStream.Create;
  try
    try
      if GetStreamFromUrl(AFileUrl, MS) then
        MS.SaveToFile(AFileName);
      Result := True;
    except
      on E: Exception do
        AddLog(Format('DM.GetFileFromUrl.Exception = Url: %s, Error: %s', [AFileUrl, E.Message]));
    end;
  finally
    FreeAndNil(MS);
  end;
end;

function TTLDataModule.RequestToTicketLink(const AUrl, AJobName, AReqJSON: string; var ARespJSON, AResMsg: string): Boolean;
var
  HC: TIdHTTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL;
  RS, SS: TStringStream;
begin
  Result := False;
  AResMsg := '';
  SS := TStringStream.Create(AReqJson, TEncoding.UTF8);
  RS := TStringStream.Create;
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  HC := TIdHTTP.Create(nil);
  try
    try
      AddLog(Format('DM.RequestToTicketLink.%s = url: %s', [AJobName, AUrl]));
      SS.SaveToFile(Global.LogDir + Format('%s.Request.json', [AJobName]));

      SSL.SSLOptions.Method := sslvSSLv23;
      SSL.SSLOptions.Mode := sslmClient;
      HC.Request.Method := Id_HTTPMethodPost;
      HC.Request.CustomHeaders.Values['Authorization'] := 'Bearer ' + Global.APIServerInfo.Token;
      HC.URL.URI := Global.APIServerInfo.Host;
      HC.IOHandler := SSL;
      HC.HandleRedirects := False;
      HC.ConnectTimeout := IdTimeoutDefault;
      HC.ReadTimeout := IdTimeoutDefault;
      HC.Request.ContentType := 'application/json';
      HC.Post(AUrl, SS, RS);
      ARespJson := TEncoding.UTF8.GetString(RS.Bytes, 0, RS.Size);
      RS.SaveToFile(Global.LogDir + Format('%s.Response.json', [AJobName]));
      Result := True;
    except
      on E: EIdHTTPProtocolException do
        AResMsg := E.Message;
      on E: Exception do
        AResMsg := E.Message;
    end;
  finally
    FreeAndNil(SS);
    FreeAndNil(RS);
    FreeAndNil(SSL);
    HC.Disconnect;
    HC.Free;
  end;
end;

function TTLDataModule.GetSettingInfo(var AResMsg: string): Boolean;
const
  CS_API = 'setting';
var
  JO: HCkJsonObject;
  JA: HCkJsonArray;
  LUrl, LLogoUrl, LReqJSON, LRespJSON, LValue: string;
  I, LResCode, LCount: Integer;
begin
  Result := False;
  AResMsg := '';
  JO := CkJsonObject_Create;
  JA := nil;
  try
    try
      CkJsonObject_UpdateInt(JO, 'partnerNo', Global.StoreInfo.PartnerNo);
      CkJsonObject_UpdateInt(JO, 'counterNo', Global.StoreInfo.CounterNo);
      LReqJSON := CkJsonObject__emit(JO);
      LUrl := Format('%s/v2/api/%s', [Global.APIServerInfo.Host, CS_API]);
      if not RequestToTicketLink(LUrl, 'GetSettingInfo', LReqJSON, LRespJSON, AResMsg) then
        raise Exception.Create(AResMsg);
      if not CkJsonObject_Load(JO, PWideChar(LRespJSON)) then
        raise Exception.Create(CkJsonObject__lastErrorText(JO));

      LResCode := CkJsonObject_IntOf(JO, 'result.code');
      if (LResCode <> 0) then
      begin
        AResMsg := GetTextLocale(CkJsonObject_ObjectOf(JO, 'result.errorLang'));
        raise Exception.Create(AResMsg);
      end;

      AResMsg := CkJsonObject__stringOf(JO, 'result.message');
      Global.StoreInfo.CounterId := CkJsonObject_IntOf(JO, 'data.kioskCounterSetting.counterId');
      Global.StoreInfo.OpenTime := UnixTimeToString(CkJsonObject__stringOf(JO, 'data.usageStartTime'), CFS_TIME_FORMAT); //Time Only
      if Global.StoreInfo.OpenTime.IsEmpty then
        Global.StoreInfo.OpenTime := '00:00:00';
      Global.StoreInfo.CloseTime := UnixTimeToString(CkJsonObject__stringOf(JO, 'data.usageEndTime'), CFS_TIME_FORMAT); //Time Only
      if Global.StoreInfo.CloseTime.IsEmpty then
        Global.StoreInfo.CloseTime := '23:59:59';

      Global.StoreInfo.PartnerType := CkJsonObject__stringOf(JO, 'data.partnerType');
      Global.StoreInfo.KioskIssueTypeCode := CkJsonObject__stringOf(JO, 'data.kioskIssueTypeCode'); //ITC_GENERAL or ITC_INTERGRATION
      Global.StoreInfo.ReceiptPrintTypeCode := CkJsonObject__stringOf(JO, 'data.receiptPrintTypeCode');

      //파트너사 로고 이미지
      LLogoUrl := CkJsonObject__stringOf(JO, 'data.logoImage');
      if (not LLogoUrl.IsEmpty) then
        GetStreamFromUrl(LLogoUrl, Global.ThemeInfo.Images.ico_partner.Stream);

      //공지사항
      Global.StoreInfo.KioskNotice := CkJsonObject__stringOf(JO, 'data.kioskNotice');
      Global.StoreInfo.ExposureKioskNotice := CkJsonObject_BoolOf(JO, 'data.kioskNoticeExposureYn');
      DoCacheNoticeImages;

      //테마 정보
      Global.StoreInfo.ThemeCode := CkJsonObject__stringOf(JO, 'data.themeCode');
      Global.ThemeInfo.LoadTheme(Global.StoreInfo.ThemeCode);
      if not Global.ThemeInfo.Loaded then
        raise Exception.Create(Global.ThemeInfo.LastError);

      //사용 가능 결제수단
      JA := CkJsonObject_ArrayOf(JO, 'data.payMethodCodes');
      LCount := CkJsonArray_getSize(JA);
      if (LCount > 0) then
        for I := 0 to Pred(LCount) do
        begin
          LValue := CkJsonArray__stringAt(JA, I);
          if (LValue = PMC_CARD) then
            Global.StoreInfo.AllowCreditCard := True
          else if (LValue = PMC_PAYCO) then
            Global.StoreInfo.AllowPAYCO := True;
        end
      else
      begin
        Global.StoreInfo.AllowCreditCard := True;
        Global.StoreInfo.AllowPAYCO := True;
      end;

      //바코드 조회 사용 여부
      Global.StoreInfo.ExposureBarcodeSearch := CkJsonObject_BoolOf(JO, 'data.kioskCounterSetting.barcodeSearchYn');
      //대기화면 광고 노출 방식
      Global.StoreInfo.ExposureTypeCode := CkJsonObject__stringOf(JO, 'data.kioskCounterSetting.exposureTypeCode'); //ATC_FULL, ATC_NORMAL
      if Global.StoreInfo.ExposureTypeCode.IsEmpty then
        Global.StoreInfo.ExposureTypeCode := ATC_FULL;

      //메뉴 표시
      JA := CkJsonObject_ArrayOf(JO, 'data.kioskCounterSetting.menuTypeCodes');
      LCount := CkJsonArray_getSize(JA);
      if (LCount > 0) then
        for I := 0 to Pred(LCount) do
        begin
          LValue := CkJsonArray__stringAt(JA, I);
          if (LValue = MTC_ISSUE) then
            Global.StoreInfo.ShowTicketingMenu := True
          else if (LValue = MTC_RESERVE) then
            Global.StoreInfo.ShowTicketBuyMenu := True;
        end
      else
      begin
        Global.StoreInfo.ShowTicketingMenu := True;
        Global.StoreInfo.ShowTicketBuyMenu := True;
      end;

      //조회 방식
      JA := CkJsonObject_ArrayOf(JO, 'data.searchTypeCodes');
      LCount := CkJsonArray_getSize(JA);
      if (LCount > 0) then
        for I := 0 to Pred(LCount) do
        begin
          LValue := CkJsonArray__stringAt(JA, I);
          if (LValue = STC_PHONE_NO) then
            Global.StoreInfo.SearchPhoneNo := True
          else if (LValue = STC_RESERVE_NO) then
            Global.StoreInfo.SearchReserveNo := True;
        end
      else
      begin
        Global.StoreInfo.SearchPhoneNo := True;
        Global.StoreInfo.SearchReserveNo := True;
      end;

      //쿠폰 출력 여부
      Global.StoreInfo.AllowCouponPrint := (CkJsonObject__stringOf(JO, 'data.couponPrintYn') = CRC_YES);

      Result := True;
      AddLog(Format('DM.GetSettingInfo(%d, %d).Result = Message: %s, CounterId: %d, OpenTime: %s, CloseTime: %s, Theme: %s',
        [Global.StoreInfo.PartnerNo, Global.StoreInfo.CounterNo, AResMsg, Global.StoreInfo.CounterId, Global.StoreInfo.OpenTime, Global.StoreInfo.CloseTime, Global.StoreInfo.ThemeCode]));
    except
      on E: Exception do
      begin
        AResMsg := E.Message;
        AddLog(Format('DM.GetSettingInfo.Exception = %s', [E.Message]));
      end;
    end;
  finally
    if Assigned(JA) then
      CkJsonArray_Dispose(JA);
    CkJsonObject_Dispose(JO);
  end;
end;

function TTLDataModule.GetProductList(var AResMsg: string): Boolean;
const
  CS_API = 'product/list';
var
  JO, RO: HCkJsonObject;
  JA: HCkJsonArray;
  MS: TMemoryStream;
  LResCode, LCount, LProductId: Integer;
  LUrl, LReqJSON, LRespJSON, LStartDate, LEndDate: string;
begin
  Result := False;
  AResMsg := '';
  JO := CkJsonObject_Create;
  RO := nil;
  JA := nil;
  MS := TMemoryStream.Create;
  try
    try
      if not TruncateABSTable(MTProduct, True) then
        raise Exception.Create(Format('%s 테이블을 초기화 할 수 없습니다.', [MTProduct.TableName]));
      CkJsonObject_UpdateInt(JO, 'partnerNo', Global.StoreInfo.PartnerNo);
      LReqJSON := CkJsonObject__emit(JO);
      LUrl := Format('%s/v2/api/%s', [Global.APIServerInfo.Host, CS_API]);
      if not RequestToTicketLink(LUrl, 'GetProductList', LReqJSON, LRespJSON, AResMsg) then
        raise Exception.Create(AResMsg);
      if not CkJsonObject_Load(JO, PWideChar(LRespJSON)) then
        raise Exception.Create(CkJsonObject__lastErrorText(JO));

      LResCode := CkJsonObject_IntOf(JO, 'result.code');
      if (LResCode <> 0) then
      begin
        AResMsg := GetTextLocale(CkJsonObject_ObjectOf(JO, 'result.errorLang'));
        raise Exception.Create(AResMsg);
      end;

      JA := CkJsonObject_ArrayOf(JO, 'data');
      LCount := CkJsonArray_getSize(JA);
      for var I := 0 to Pred(LCount) do
      begin
        RO := CkJsonArray_ObjectAt(JA, I);
        //당일 사용 가능 상품만 추출
        LStartDate := UnixTimeToString(CkJsonObject__stringOf(RO, 'startDate'), CFS_DATE_FORMAT); //Date Only
        LEndDate := UnixTimeToString(CkJsonObject__stringOf(RO, 'endDate'), CFS_DATE_FORMAT); //Date Only
        if (LStartDate <= Global.FormattedCurrentDate) and
           (LEndDate >= Global.FormattedCurrentDate) then
        begin
          LProductId := CkJsonObject_IntOf(RO, 'productId');
          if not MTProduct.Locate('product_id', LProductId, []) then
          begin
            MTProduct.Append;
            MTProduct.FieldValues['product_id'] := LProductId;
            MTProduct.FieldValues['product_name'] := StrPas(CkJsonObject__stringOf(RO, 'productName'));
            MTProduct.FieldValues['product_name_eng'] := StrPas(CkJsonObject__stringOf(RO, 'productNameEng'));
            MTProduct.FieldValues['product_class_type'] := StrPas(CkJsonObject__stringOf(RO, 'productClassType'));
            MTProduct.FieldValues['product_type_code'] := StrPas(CkJsonObject__stringOf(RO, 'productTypeCode'));
            MTProduct.FieldValues['start_date'] := LStartDate;
            MTProduct.FieldValues['end_date'] := LEndDate;
            MTProduct.FieldValues['display_product_date'] := StrPas(CkJsonObject__stringOf(RO, 'displayProductDate'));
            if GetStreamFromUrl(StrPas(CkJsonObject__stringOf(RO, 'productImagePath')), MS) then
              try
                TBlobField(MTProduct.FieldByName('product_image')).LoadFromStream(MS);
              except
              end;
          end
          else
            MTProduct.Edit;

          MTProduct.FieldValues['soldout'] := CkJsonObject_BoolOf(RO, 'soldout');
          MTProduct.Post;
        end;
        //AddLog(Format('DM.GetProductList(%d) = %s -> %s', [LProductId, CkJsonObject__stringOf(RO, 'startDate'), LStartDate]));
        //AddLog(Format('DM.GetProductList(%d) = %s -> %s', [L, CkJsonObject__stringOf(RO, 'endDate'), LEndDate]));
      end;

      AResMsg := CkJsonObject__stringOf(JO, 'result.message');
      Result := True;
    except
      on E: Exception do
      begin
        AResMsg := E.Message;
        AddLog(Format('DM.GetProductList.Exception = %s', [E.Message]));
      end;
    end;
  finally
    FreeAndNil(MS);
    if Assigned(JA) then
      CkJsonArray_Dispose(JA);
    if Assigned(RO) then
      CkJsonObject_Dispose(RO);
    CkJsonObject_Dispose(JO);
  end;
end;

//주의) AProductDate --> yyyy.mm.dd 형식임
function TTLDataModule.GetRoundList(const AProductId: Integer; const AProductDate: string; var AResMsg: string): Boolean;
const
  CS_API = 'schedule/round';
var
  JO, RO: HCkJsonObject;
  JA: HCkJsonArray;
  LResCode, LCount: Integer;
  LScheduleId, LProductRound, LRemainCount: Integer;
  LSoldOut, LShowRemainCount: Boolean;
  LUrl, LReqJSON, LRespJSON: string;
  LScheduleDateTime: string;
begin
  Result := False;
  AResMsg := '';
  JO := CkJsonObject_Create;
  RO := nil;
  JA := nil;
  try
    try
      if not TruncateABSTable(MTRound, True) then
        raise Exception.Create(Format('%s 테이블을 초기화 할 수 없습니다.', [MTRound.TableName]));

      CkJsonObject_UpdateInt(JO, 'productId', AProductId);
      CkJsonObject_UpdateString(JO, 'productDate', PWideChar(AProductDate));
      LReqJSON := CkJsonObject__emit(JO);
      LUrl := Format('%s/v2/api/%s', [Global.APIServerInfo.Host, CS_API]);
      if not RequestToTicketLink(LUrl, 'GetRoundList', LReqJSON, LRespJSON, AResMsg) then
        raise Exception.Create(AResMsg);
      if not CkJsonObject_Load(JO, PWideChar(LRespJSON)) then
        raise Exception.Create(CkJsonObject__lastErrorText(JO));

      LResCode := CkJsonObject_IntOf(JO, 'result.code');
      if (LResCode <> 0) then
      begin
        AResMsg := GetTextLocale(CkJsonObject_ObjectOf(JO, 'result.errorLang'));
        raise Exception.Create(AResMsg);
      end;

      JA := CkJsonObject_ArrayOf(JO, 'data');
      LCount := CkJsonArray_getSize(JA);
      if (LCount = 0) then
        raise Exception.Create('조회할 회차 정보가 없습니다.');

      for var I := 0 to Pred(LCount) do
      begin
        RO := CkJsonArray_ObjectAt(JA, I);
        LScheduleId := CkJsonObject_IntOf(RO, 'scheduleId');
        LScheduleDateTime := UnixTimeToString(CkJsonObject__stringOf(RO, 'time'), CFS_DATETIME_FORMAT); //Date+Time
        LProductRound := CkJsonObject_IntOf(RO, 'productRound');
        LSoldOut := CkJsonObject_BoolOf(RO, 'soldout');
        LRemainCount := CkJsonObject_IntOf(RO, 'remainCount');
        LShowRemainCount := CkJsonObject_BoolOf(RO, 'restSeatExposure');

        MTRound.Append;
        MTRound.FieldValues['schedule_id'] := LScheduleId;
        MTRound.FieldValues['schedule_datetime'] := LScheduleDateTime;
        MTRound.FieldValues['product_round'] := LProductRound;
        MTRound.FieldValues['soldout'] := LSoldOut;
        MTRound.FieldValues['remain_count'] := LRemainCount;
        MTRound.FieldValues['show_remain_count'] := LShowRemainCount;
        MTRound.Post;
{$IFDEF DEBUG}
        AddLog(Format('DM.GetRoundList(%d, %s, %d) = %s -> %s', [AProductId, AProductDate, LScheduleId, CkJsonObject__stringOf(RO, 'time'), LScheduleDateTime]));
{$ENDIF}
      end;

      AResMsg := CkJsonObject__stringOf(JO, 'result.message');
      Result := True;
    except
      on E: Exception do
      begin
        AResMsg := E.Message;
        AddLog(Format('DM.GetRoundList(%d, %s).Exception = %s', [AProductId, AProductDate, E.Message]));
      end;
    end;
  finally
    if Assigned(JA) then
      CkJsonArray_Dispose(JA);
    if Assigned(RO) then
      CkJsonObject_Dispose(RO);
    CkJsonObject_Dispose(JO);
  end;
end;

function TTLDataModule.GetDenominList(const AScheduleId: Integer; var AResMsg: string): Boolean;
const
  CS_API = 'denomination/list';
var
  JO, RO: HCkJsonObject;
  JA, RA: HCkJsonArray;
  LResCode, LCount1, LCount2: Integer;
  LUrl, LReqJSON, LRespJSON: string;
  SL: TStringList;
begin
  Result := False;
  AResMsg := '';
  JO := CkJsonObject_Create;
  RO := nil;
  JA := nil;
  RA := nil;
  SL := TStringList.Create;
  try
    try
      if not TruncateABSTable(MTDenomin, True) then
        raise Exception.Create(Format('%s 테이블을 초기화 할 수 없습니다.', [MTDenomin.TableName]));

      CkJsonObject_UpdateInt(JO, 'scheduleId', AScheduleId);
      LReqJSON := CkJsonObject__emit(JO);
      LUrl := Format('%s/v2/api/%s', [Global.APIServerInfo.Host, CS_API]);
      if not RequestToTicketLink(LUrl, 'GetDenominList', LReqJSON, LRespJSON, AResMsg) then
        raise Exception.Create(AResMsg);
      if not CkJsonObject_Load(JO, PWideChar(LRespJSON)) then
        raise Exception.Create(CkJsonObject__lastErrorText(JO));

      AResMsg := CkJsonObject__stringOf(JO, 'result.message');
      LResCode := CkJsonObject_IntOf(JO, 'result.code');
      if (LResCode <> 0) then
      begin
        AResMsg := GetTextLocale(CkJsonObject_ObjectOf(JO, 'result.errorLang'));
        raise Exception.Create(AResMsg);
      end;

      JA := CkJsonObject_ArrayOf(JO, 'data');
      LCount1 := CkJsonArray_getSize(JA);
      if (LCount1 = 0) then
        raise Exception.Create(GetTextLocale(['구매 가능한 권종이 없습니다.', 'No ticket products available for purchase.', '購入可能な券種がありません。', '无可购买的门票种类。']));

      for var I: Integer := 0 to Pred(LCount1) do
      begin
        SL.Clear;
        RO := CkJsonArray_ObjectAt(JA, I);
        with MTDenomin do
        begin
          Append;
          FieldValues['schedule_id'] := AScheduleId;
          FieldValues['product_grade_id'] := CkJsonObject_IntOf(RO, 'productGradeId');
          FieldValues['product_grade_name'] := StrPas(CkJsonObject__stringOf(RO, 'productGradeName'));
          FieldValues['sale_price'] := CkJsonObject_IntOf(RO, 'salePrice');
          FieldValues['grade_order_of_priority'] := CkJsonObject_IntOf(RO, 'gradeOrderOfPriority');
          FieldValues['product_denomination_id'] := CkJsonObject_IntOf(RO, 'productDenominationId');
          FieldValues['product_denomination_name'] := StrPas(CkJsonObject__stringOf(RO, 'productDenominationName'));
          FieldValues['product_denomination_name_eng'] := StrPas(CkJsonObject__stringOf(RO, 'productDenominationNameEng'));
          FieldValues['per_max_count'] := CkJsonObject_IntOf(RO, 'perMaxCount');
          FieldValues['per_min_count'] := CkJsonObject_IntOf(RO, 'perMinCount');
          FieldValues['product_sale_count'] := CkJsonObject_IntOf(RO, 'productSaleCount');
          FieldValues['schedule_sale_count'] := CkJsonObject_IntOf(RO, 'scheduleSaleCount');
          FieldValues['per_person_max_count'] := CkJsonObject_IntOf(RO, 'perPersonMaxCount');
          FieldValues['round_max_count'] := CkJsonObject_IntOf(RO, 'roundMaxCount');
          FieldValues['buy_double_count'] := CkJsonObject_IntOf(RO, 'buyDoubleCount');
          FieldValues['site_denomination_category_id'] := CkJsonObject_IntOf(RO, 'siteDenominationCategoryId');
          FieldValues['site_denomination_category_name'] := StrPas(CkJsonObject__stringOf(RO, 'siteDenominationCategoryName'));
          FieldValues['site_denomination_code_order'] := CkJsonObject_IntOf(RO, 'siteDenominationCodeOrder');
          FieldValues['denomination_limit_count'] := CkJsonObject_IntOf(RO, 'denominationLimitCount');
          FieldValues['schedule_remain_count'] := CkJsonObject_IntOf(RO, 'scheduleRemainCount');
          FieldValues['denomination_description'] := StrPas(CkJsonObject__stringOf(RO, 'denominationDescription'));
          FieldValues['limit_card_kcp_payment_yn'] := CkJsonObject_BoolOf(RO, 'limitCardKcpPaymentYn');
          RA := CkJsonObject_ArrayOf(RO, PWideChar('limitCardBinCodeList'));
          LCount2 := CkJsonArray_getSize(RA);
          if (LCount2 > 0) then
          try
            for var J: Integer := 0 to Pred(LCount2) do
              SL.Add(CkJsonArray__stringAt(RA, J));
          finally
            FieldValues['limit_card_bin_code_list'] := SL.Text;
          end;
          Post;
        end;
      end;
      Result := True;
    except
      on E: Exception do
      begin
        AResMsg := E.Message;
        AddLog(Format('DM.GetDenominList(%d).Exception = %s', [AScheduleId, E.Message]));
      end;
    end;
  finally
    FreeAndNil(SL);
    if Assigned(RA) then
      CkJsonArray_Dispose(RA);
    if Assigned(JA) then
      CkJsonArray_Dispose(JA);
    if Assigned(RO) then
      CkJsonObject_Dispose(RO);
    CkJsonObject_Dispose(JO);
  end;
end;

//예매번호로 예매 조회
function TTLDataModule.GetReserveListByReserveNo(const AReserveNo: Int64; var ADataCount: Integer; var AReserveUserName, AResMsg: string): Boolean;
begin
  Result := GetReserveList(SCH_RESERVED_NO, IntToStr(AReserveNo), '', ADataCount, AReserveUserName, AResMsg);
end;
//검색조건으로 예매 조회
function TTLDataModule.GetReserveList(const ASearchType: Integer; const ASearchValue, ABirthday: string; var ADataCount: Integer; var AReserveUserName, AResMsg: string): Boolean;
const
  CS_API_1 = 'reserve/listByBarcode';
  CS_API_2 = 'reserve/list';
var
  JO, RO: HCkJsonObject;
  JA, DA: HCkJsonArray;
  SL: TStringList;
  MS: TMemoryStream;
  LUrl, LReqJSON, LRespJSON, LSearchKey, LReserveNo, LTicketNo: string;
  LResCode: Integer;
  LIsExposure: Boolean;
begin
  Result := False;
  ADataCount := 0;
  AReserveUserName := '';
  AResMsg := '';
  JO := nil;
  RO := nil;
  JA := nil;
  DA := nil;
  SL := nil;
  MS := nil;
  try
    try
      if not TruncateABSTable(MTReserveList, True) then
        raise Exception.Create(Format('%s 테이블을 초기화 할 수 없습니다.', [MTReserveList.TableName]));

      LSearchKey := '';
      LReserveNo := '';
      LTicketNo := '';
      case ASearchType of
        SCH_PHONE_NO:
          LSearchKey := ASearchValue;
        SCH_RESERVED_NO:
          LReserveNo := ASearchValue;
        SCH_TICKET_NO:
          LTicketNo := ASearchValue;
        SCH_BARCODE:
          LSearchKey := ASearchValue;
      end;

      JO := CkJsonObject_Create;
      CkJsonObject_UpdateInt(JO, 'partnerNo', Global.StoreInfo.PartnerNo);
      CkJsonObject_UpdateString(JO, 'searchKey', PWideChar(LSearchKey));
      if (ASearchType = SCH_BARCODE) then
        LUrl := Format('%s/v2/api/%s', [Global.APIServerInfo.Host, CS_API_1])
      else
      begin
        CkJsonObject_UpdateString(JO, 'externalProductServiceType', PWideChar(CPS_CODES[CPS_TICKETLINK]));
        CkJsonObject_UpdateString(JO, 'searchType', PWideChar(SCH_CODES[ASearchType]));
        CkJsonObject_UpdateString(JO, 'reserveNo', PWideChar(LReserveNo)); //1410065571
        CkJsonObject_UpdateString(JO, 'birthday', PWideChar(ABirthday));
        CkJsonObject_UpdateString(JO, 'ticketNo', PWideChar(LTicketNo));
        LUrl := Format('%s/v2/api/%s', [Global.APIServerInfo.Host, CS_API_2]);
      end;

      LReqJSON := CkJsonObject__emit(JO);
      if not RequestToTicketLink(LUrl, 'GetReserveList', LReqJSON, LRespJSON, AResMsg) then
        raise Exception.Create(AResMsg);
      if not CkJsonObject_Load(JO, PWideChar(LRespJSON)) then
        raise Exception.Create(CkJsonObject__lastErrorText(JO));

      LResCode := CkJsonObject_IntOf(JO, 'result.code');
      if (LResCode <> 0) then
      begin
        AResMsg := GetTextLocale(CkJsonObject_ObjectOf(JO, 'result.errorLang'));
        raise Exception.Create(AResMsg);
      end;

      JA := CkJsonObject_ArrayOf(JO, 'data');
      ADataCount := CkJsonArray_getSize(JA);
      MS := TMemoryStream.Create;
      for var I: ShortInt := 0 to Pred(ADataCount) do
      begin
        RO := CkJsonArray_ObjectAt(JA, I);
        if (I = 0) then
          AReserveUserName := CkJsonObject__stringOf(RO, 'reserveUserName');

        with MTReserveList do
        begin
          Append;
          FieldValues['product_id'] := CkJsonObject_IntOf(RO, 'productId');
          FieldValues['product_name'] := StrPas(CkJsonObject__stringOf(RO, 'productName'));
          FieldValues['product_name_eng'] := StrPas(CkJsonObject__stringOf(RO, 'productNameEng'));
          FieldValues['reserve_no'] := StrToInt64Def(CkJsonObject__stringOf(RO, 'reserveNo'), 0);
          FieldValues['external_reserve_no'] := StrPas(CkJsonObject__stringOf(RO, 'externalReserveNo'));
          FieldValues['reserve_count'] := CkJsonObject_IntOf(RO, 'reserveCount');
          FieldValues['product_datetime'] := StrPas(CkJsonObject__stringOf(RO, 'productDatetime'));
          FieldValues['place_name'] := StrPas(CkJsonObject__stringOf(RO, 'placeName'));
          FieldValues['place_name_eng'] := StrPas(CkJsonObject__stringOf(RO, 'placeNameEng'));
          FieldValues['seat_attribute_info'] := StrPas(CkJsonObject__stringOf(RO, 'seatAttributeInfo'));
          FieldValues['reserve_user_name'] := StrPas(CkJsonObject__stringOf(RO, 'reserveUserName'));
          FieldValues['is_qualification_needed'] := (StrPas(CkJsonObject__stringOf(RO, 'isQualificationNeeded')) = CRC_YES);
          FieldValues['product_class_type'] := StrPas(CkJsonObject__stringOf(RO, 'productClassType'));
          FieldValues['schedule_id'] := CkJsonObject_IntOf(RO, 'scheduleId');
          FieldValues['external_service_type'] := StrPas(CkJsonObject__stringOf(RO, 'externalServiceType'));
          FieldValues['external_service_type_name'] := StrPas(CkJsonObject__stringOf(RO, 'externalServiceTypeName'));
          LIsExposure := (StrPas(CkJsonObject__stringOf(RO, 'denominationDescriptionExposureYn')) = CRC_YES);
          FieldValues['is_denomination_description_exposure'] := LIsExposure;
          if LIsExposure then
          begin
            SL := TStringList.Create;
            DA := CkJsonObject_ArrayOf(RO, 'denominationDescriptionList');
            for var J: ShortInt := 0 to Pred(CkJsonArray_getSize(DA)) do
              SL.Add(StringReplace(CkJsonArray__stringAt(DA, J), _LF, '\n', [rfReplaceAll]));
            FieldValues['denomination_description_list'] := SL.Text;
          end;
          if GetStreamFromUrl(StrPas(CkJsonObject__stringOf(RO, 'productImageUrl')), MS) then
            try
              TBlobField(FieldByName('product_image')).LoadFromStream(MS);
            except
            end;

          Post;
        end;
      end;

      AResMsg := CkJsonObject__stringOf(JO, 'result.message');
      Result := True;
    except
      on E: Exception do
      begin
        AResMsg := E.Message;
        AddLog(Format('DM.GetReserveList(%d, %s, %s).Exception = %s', [ASearchType, ASearchValue, ABirthDay, E.Message]));
      end;
    end;
  finally
    if Assigned(MS) then
      FreeAndNil(MS);
    if Assigned(SL) then
      FreeAndNil(SL);
    if Assigned(DA) then
      CkJsonArray_Dispose(DA);
    if Assigned(JA) then
      CkJsonArray_Dispose(JA);
    if Assigned(RO) then
      CkJsonObject_Dispose(RO);
    if Assigned(JO) then
      CkJsonObject_Dispose(JO);
  end;
end;

//예매번호로 티켓 출력 정보 조회
function TTLDataModule.GetTicketList(const AReserveNo: Int64; var ADataCount: Integer; var AResMsg: string): Boolean;
const
  CS_API_1 = 'issue/getPrintTicketInfo';
  CS_API_2 = 'issue/template/list';
var
  JO, JOData, JOItem: HCkJsonObject;
  JAList: HCkJsonArray;
  LUrl, LReqJSON, LRespJSON, LExternalReserveNo, LReserveDateTime, LPaymentMethod, LTicketLinkReserveNo, LTicketNo, LBarcodeNo: string;
  LReserveNo: Int64;
  I, LResCode, LTempCount, LPrintCount: Integer;
begin
  Result := False;
  ADataCount := 0;
  AResMsg := '';
  JO := CkJsonObject_Create;
  JOData := nil;
  JAList := nil;
  JOItem := nil;
  try
    try
      if (not TruncateABSTable(MTTicketList, True)) or
         (not TruncateABSTable(MTTicketTemplate, True)) then
        raise Exception.Create(Format('%s 또는 %s 테이블을 초기화 할 수 없습니다.', [MTTicketList.TableName, MTTicketTemplate.TableName]));

      LUrl := Format('%s/v2/api/%s', [Global.APIServerInfo.Host, CS_API_1]);
      CkJsonObject_UpdateString(JO, 'reserveNo', PWideChar(IntToStr(AReserveNo))); //1410065571
      CkJsonObject_UpdateInt(JO, 'partnerNo', Global.StoreInfo.PartnerNo); //20059
      CkJsonObject_UpdateInt(JO, 'counterNo', Global.StoreInfo.CounterNo); //100
      LReqJSON := CkJsonObject__emit(JO);
      if not RequestToTicketLink(LUrl, 'GetTicketInfo', LReqJSON, LRespJSON, AResMsg) then
        raise Exception.Create(AResMsg);
      if not CkJsonObject_Load(JO, PWideChar(LRespJSON)) then
        raise Exception.Create(CkJsonObject__lastErrorText(JO));

      LResCode := CkJsonObject_IntOf(JO, 'result.code');
      if (LResCode <> 0) then
      begin
        AResMsg := GetTextLocale(CkJsonObject_ObjectOf(JO, 'result.errorLang'));
        raise Exception.Create(AResMsg);
      end;

      JOData := CkJsonObject_ObjectOf(JO, 'data');
      LReserveNo := StrToInt64Def(CkJsonObject__stringOf(JOData, 'reserveNo'), 0);
      LExternalReserveNo := CkJsonObject__stringOf(JOData, 'externalReserveNo');
      LReserveDateTime := CkJsonObject__stringOf(JOData, 'reserveDatetime');
      JAList := CkJsonObject_ArrayOf(JOData, 'ticketInfo');
      ADataCount := CkJsonArray_getSize(JAList);
      if (ADataCount = 0) then
        raise Exception.Create(GetTextLocale(['조회할 티켓 출력 정보가 없습니다.', 'There is no ticket printing history to retrieve.', '照会するチケット出力情報がありません。', '不存在欲查询门票的出票信息。']));

      AResMsg := CkJsonObject__stringOf(JO, 'result.message');
      for I := 0 to Pred(ADataCount) do
      begin
        JOItem := CkJsonArray_ObjectAt(JAList, I);
        LPaymentMethod := CkJsonObject__stringOf(JOItem, 'paymentMethod');
        if (LPaymentMethod = 'null') then
          LPaymentMethod := '';

        with MTTicketList do
        begin
          Append;
          FieldValues['reserve_no'] := LReserveNo;
          FieldValues['external_reserve_no'] := LExternalReserveNo;
          FieldValues['reserve_datetime'] := LReserveDateTime;
          FieldValues['product_name'] := StrPas(CkJsonObject__stringOf(JOItem, 'productName'));
          FieldValues['product_sub_name'] := StrPas(CkJsonObject__stringOf(JOItem, 'productSubName'));
          FieldValues['product_schedule'] := StrPas(CkJsonObject__stringOf(JOItem, 'productSchedule'));
          FieldValues['place_hall_name'] := StrPas(CkJsonObject__stringOf(JOItem, 'placeHallName'));
          FieldValues['site_denomination_category'] := StrPas(CkJsonObject__stringOf(JOItem, 'siteDenominationCategory'));
          FieldValues['product_denomination_name'] := StrPas(CkJsonObject__stringOf(JOItem, 'productDenominationName'));
          FieldValues['product_denomination_name_eng'] := StrPas(CkJsonObject__stringOf(JOItem, 'productDenominationNameEng'));
          FieldValues['mark_price'] := StrPas(CkJsonObject__stringOf(JOItem, 'markPrice'));
          FieldValues['reserve_member_name'] := StrPas(CkJsonObject__stringOf(JOItem, 'reserveMemberName'));
          FieldValues['reserve_member_contact'] := StrPas(CkJsonObject__stringOf(JOItem, 'reserveMemberContact'));
          FieldValues['reserve_contact'] := StringReplace(StrPas(CkJsonObject__stringOf(JOItem, 'reserveContact')), '/', '-', [rfReplaceAll]);
          FieldValues['reserve_channel'] := StrPas(CkJsonObject__stringOf(JOItem, 'reserveChannel'));
          FieldValues['payment_method'] := LPaymentMethod;
          FieldValues['publish_no'] := StrPas(CkJsonObject__stringOf(JOItem, 'publishNo'));
          FieldValues['barcode'] := StrPas(CkJsonObject__stringOf(JOItem, 'barcode'));
          Post;
        end;
      end;

      if Global.TicketPrinter.Enabled then
      begin
        //티켓 템플릿 정보 수신
        LUrl := Format('%s/v2/api/%s', [Global.APIServerInfo.Host, CS_API_2]);
        CkJsonObject_Clear(JO);
        CkJsonObject_UpdateString(JO, 'reserveNo', PWideChar(IntToStr(AReserveNo))); //1410065571
        //CkJsonObject_UpdateBool(JO, 'printReceipt', WordBool(True));
        //CkJsonObject_UpdateBool(JO, 'testPrint', WordBool(False));
        CkJsonObject_UpdateInt(JO, 'partnerNo', Global.StoreInfo.PartnerNo); //20059
        LReqJSON := CkJsonObject__emit(JO);
        LRespJson := '';
        if not RequestToTicketLink(LUrl, 'GetTicketTemplateList', LReqJSON, LRespJSON, AResMsg) then
          raise Exception.Create(AResMsg);
        if not CkJsonObject_Load(JO, PWideChar(LRespJSON)) then
          raise Exception.Create(CkJsonObject__lastErrorText(JO));

        LResCode := CkJsonObject_IntOf(JO, 'result.code');
        if (LResCode <> 0) then
        begin
          AResMsg := GetTextLocale(CkJsonObject_ObjectOf(JO, 'result.errorLang'));
          raise Exception.Create(AResMsg);
        end;

        JOData := CkJsonObject_ObjectOf(JO, 'data');
        LReserveNo := StrToInt64Def(CkJsonObject__stringOf(JOData, 'reserveNo'), 0);
        LPrintCount := CkJsonObject_IntOf(JOData, 'printCount');
        LTicketLinkReserveNo := CkJsonObject__stringOf(JOData, 'ticketlinkReserveNo');
        LTicketNo := CkJsonObject__stringOf(JOData, 'ticketNo');
        LBarcodeNo := CkJsonObject__stringOf(JOData, 'barcodeInfo');
        JAList := CkJsonObject_ArrayOf(JOData, 'ticketTemplateObjectList');
        LTempCount := CkJsonArray_getSize(JAList);
        for I := 0 to Pred(LTempCount) do
        begin
          JOItem := CkJsonArray_ObjectAt(JAList, I);
          with MTTicketTemplate do
          begin
            (*
            *************** request ***************
            {
              "reserveNo": 1410077644,
              "partnerNo" : 20059
            }
            *************** response ***************
            {
              "objectId": 502309, //Object ID
              "templateId": 19253, //티켓 템플릿 ID
              "ticketDirection": "horizontal", //출력 구분(horizontal, vertical)
              "pxx": 137, //위치정보(x값, 픽셀)
              "pxy": 29, //위치정보(y값, 픽셀)
              "mmx": 48.33, //위치정보(x값, mm)
              "mmy": 10.23, //위치정보(y값, mm)
              "pxwidth": 40, //크기정보(width값, 픽셀)
              "pxheight": 15, //크기정보(height값, 픽셀)
              "mmwidth": 14.11, //크기정보(width값, mm)
              "mmheight": 5.29, //크기정보(height값, mm)
              "bold": "true", //폰트 bold(true, false)
              "fontSize": 6, //폰트 사이즈
              "rotateCode": 0,
              "degreeRotation": 0,
              "textDataFieldType": "productName", //표시 항목
              "encodedBackgroundImage": "",
              "editableComponentType": "text", //표시될 값의 데이터형식
              "textContent": "개발_스포츠_지정", //표시될 값
              "textAlign": "left", //값 정렬 방식
              "ticketSizeType": "ticketSize_150", //티켓 사이즈
              "ticketNo": false,
              "editableComponentTypeBarcode": false,
              "editableComponentTypeQrcode": false
            },
            *)
            Append;
            FieldValues['reserve_no'] := LReserveNo;
            FieldValues['object_id'] := CkJsonObject_IntOf(JOItem, 'objectId');
            FieldValues['template_id'] := CkJsonObject_IntOf(JOItem, 'templateId');
            FieldValues['ticket_direction'] := GetTicketLabelDirection(StrPas(CkJsonObject__stringOf(JOItem, 'ticketDirection')));
            FieldValues['pxx'] := CkJsonObject_IntOf(JOItem, 'pxx');
            FieldValues['pxy'] := CkJsonObject_IntOf(JOItem, 'pxy');
            FieldValues['mmx'] := StrToFloatDef(StrPas(CkJsonObject__stringOf(JOItem, 'mmx')), 0);
            FieldValues['mmy'] := StrToFloatDef(StrPas(CkJsonObject__stringOf(JOItem, 'mmy')), 0);
            FieldValues['pxwidth'] := CkJsonObject_IntOf(JOItem, 'pxwidth');
            FieldValues['pxheight'] := CkJsonObject_IntOf(JOItem, 'pxheight');
            FieldValues['mmwidth'] := StrToFloatDef(StrPas(CkJsonObject__stringOf(JOItem, 'mmwidth')), 0);
            FieldValues['mmheight'] := StrToFloatDef(StrPas(CkJsonObject__stringOf(JOItem, 'mmheight')), 0);
            FieldValues['bold'] := CkJsonObject_BoolOf(JOItem, 'bold');
            FieldValues['font_size'] := CkJsonObject_IntOf(JOItem, 'fontSize');
            FieldValues['rotate_code'] := CkJsonObject_IntOf(JOItem, 'rotateCode');
            FieldValues['degree_rotation'] := CkJsonObject_IntOf(JOItem, 'degreeRotation');
            FieldValues['editable_component_type'] := GetTicketLabelType(CkJsonObject__stringOf(JOItem, 'editableComponentType'));
            FieldValues['text_content'] := StrPas(CkJsonObject__stringOf(JOItem, 'textContent'));
            FieldValues['text_align'] := GetTicketLabelAlign(CkJsonObject__stringOf(JOItem, 'textAlign'));
            FieldValues['ticket_size_type'] := StrToIntDef(StringReplace(StrPas(CkJsonObject__stringOf(JOItem, 'ticketSizeType')), 'ticketSize_', '', []), 150);
            Post;
          end;
        end;
      end;

      AResMsg := CkJsonObject__stringOf(JO, 'result.message');
      Result := True;
    except
      on E: Exception do
      begin
        AResMsg := E.Message;
        AddLog(Format('DM.GetTicketList(%d).Exception = %s', [AReserveNo, E.Message]));
      end;
    end;
  finally
    if Assigned(JAList) then
      CkJsonArray_Dispose(JAList);
    if Assigned(JOItem) then
      CkJsonObject_Dispose(JOItem);
    if Assigned(JOData) then
      CkJsonObject_Dispose(JOData);
    CkJsonObject_Dispose(JO);
  end;
end;

function TTLDataModule.GetContentList(var AResMsg: string): Boolean;
const
  CS_API = 'video';
var
  JO, RO: HCkJsonObject;
  JA: HCkJsonArray;
  MS: TMemoryStream;
  sUrl, sReqJSON, sRespJSON, sFileUrl, sFileName, sFileExt, sStartDate, sEndDate, sTypeCode: string;
  nCount, nResCode, nVideoId, nSortOrd, nPlayTime: Integer;
begin
  Result := False;
  AResMsg := '';
  JO := CkJsonObject_Create;
  RO := nil;
  JA := nil;
  MS := TMemoryStream.Create;
  try
    try
      CkJsonObject_UpdateInt(JO, 'partnerNo', Global.StoreInfo.PartnerNo);
      sReqJSON := CkJsonObject__emit(JO);
      sUrl := Format('%s/v2/api/%s', [Global.APIServerInfo.Host, CS_API]);
      if not RequestToTicketLink(sUrl, 'GetContentList', sReqJSON, sRespJSON, AResMsg) then
        raise Exception.Create(AResMsg);
      if not CkJsonObject_Load(JO, PWideChar(sRespJSON)) then
        raise Exception.Create(CkJsonObject__lastErrorText(JO));

      nResCode := CkJsonObject_IntOf(JO, 'result.code');
      if (nResCode <> 0) then
      begin
        AResMsg := GetTextLocale(CkJsonObject_ObjectOf(JO, 'result.errorLang'));
        raise Exception.Create(AResMsg);
      end;

      AResMsg := CkJsonObject__stringOf(JO, 'result.message');
      ClearContents(Global.MainContentList);
      ClearContents(Global.IdleContentList);
      JA := CkJsonObject_ArrayOf(JO, 'data');
      nCount := CkJsonArray_getSize(JA);
      for var I := 0 to Pred(nCount) do
      begin
        MS.Clear;
        RO := CkJsonArray_ObjectAt(JA, I);
        try
          nVideoId := CkJsonObject_IntOf(RO, 'videoId');
          if (nVideoId > 0) then
          begin
            sFileUrl := CkJsonObject__stringOf(RO, 'videoUrl');
            sFileName := sFileUrl.SubString(LastDelimiter('/', sFileUrl));
            sFileExt := LowerCase(ExtractFileExt(sFileName));
            if not ((sFileExt = '.avi') or
                    (sFileExt = '.mkv') or
                    (sFileExt = '.mp4') or
                    (sFileExt = '.mpg') or
                    (sFileExt = '.wmv')) then
              Continue;
          end
          else
          begin
            sFileUrl := CkJsonObject__stringOf(RO, 'imagePath');
            sFileName := sFileUrl.SubString(LastDelimiter('/', sFileUrl));
            sFileExt := LowerCase(ExtractFileExt(sFileName));
            if not ((sFileExt = '.jpg') or
                    (sFileExt = '.png')) then
              Continue;
          end;

          nSortOrd := CkJsonObject_IntOf(RO, 'videoSortOrderNo');
          sStartDate := UnixTimeToString(CkJsonObject__stringOf(RO, 'exposureStartDatetime')).Substring(0, 8); //Date Only(yyyymmdd)
          sEndDate := UnixTimeToString(CkJsonObject__stringOf(RO, 'exposureEndDatetime')).Substring(0, 8); //Date Only(yyyymmdd)
          sTypeCode := CkJsonObject__stringOf(RO, 'adTypeCode');
          nPlayTime := CkJsonObject_IntOf(RO, 'exposureTime');
          //AddLog(Format('DM.GetContentList(%s) = %s -> %s', [sFileName, CkJsonObject__stringOf(RO, 'exposureStartDatetime'), sStartDate]));
          //AddLog(Format('DM.GetContentList(%s) = %s -> %s', [sFileName, CkJsonObject__stringOf(RO, 'exposureEndDatetime'), sEndDate]));

          if (sTypeCode = ATC_FULL) then
            AddContent(
                Global.IdleContentList,
                nSortOrd, //SortOrd
                sFileUrl,
                Global.ContentsDir + sFileName,
                nPlayTime,
                False, //Default Stretch
                sStartDate, //yyyymmdd
                '000000', //hhnnss
                sEndDate, //yyyymmdd
                '235959' //hhnnss
              )
          else
            AddContent(
                Global.MainContentList,
                nSortOrd, //SortOrd
                sFileUrl,
                Global.ContentsDir + sFileName,
                nPlayTime,
                True, //Default Stretch
                sStartDate, //yyyymmdd
                '000000', //hhnnss
                sEndDate, //yyyymmdd
                '235959' //hhnnss
              );
        except
          CkJsonObject_Dispose(RO);
        end;
      end;
      Result := True;
    except
      on E: Exception do
      begin
        AResMsg := E.Message;
        AddLog(Format('DM.GetContentList.Exception = %s', [E.Message]));
      end;
    end;
  finally
    FreeAndNil(MS);
    if Assigned(JA) then
      CkJsonArray_Dispose(JA);
    if Assigned(RO) then
      CkJsonObject_Dispose(RO);
    CkJsonObject_Dispose(JO);
  end;
end;

function TTLDataModule.PostReservation(const AReceiptNo, ATicketLinkPaymentType: string; var AReserveNo: Int64; var AResMsg: string): Boolean;
const
  CS_API = 'reserve/reservation';
var
  JOReq, JOResp, JOReserve, JOItem: HCkJsonObject;
  sUrl, sReqJSON, sRespJSON: string;
  nIndex, nResCode: Integer;
begin
  Result := False;
  AResMsg := '';
  AReserveNo := 0;
  Global.ReceiptInfo.ReserveNo := 0;
  JOReq := CkJsonObject_Create;
  JOResp := CkJsonObject_Create;
  JOReserve := CkJsonObject_Create;
  JOItem := nil;
  try
    try
      CkJsonObject_UpdateInt(JOReq, 'partnerNo', Global.StoreInfo.PartnerNo);
      CkJsonObject_UpdateInt(JOReq, 'counterNo', Global.StoreInfo.CounterNo);
      CkJsonObject_UpdateString(JOReq, 'partnerType', PWideChar(Global.StoreInfo.PartnerType));
      CkJsonObject_UpdateString(JOReq, 'paymentOfflineTypeCode', PWideChar(ATicketLinkPaymentType));

      { reserve Object }
      CkJsonObject_UpdateInt(JOReserve, 'productId', Global.ReceiptInfo.ProductId);
      CkJsonObject_UpdateInt(JOReserve, 'scheduleId', Global.ReceiptInfo.ScheduleId);
      CkJsonObject_UpdateInt(JOReserve, 'productRound', Global.ReceiptInfo.ProductRound);
      CkJsonObject_UpdateInt(JOReserve, 'reserveCount', Global.ReceiptInfo.TicketCount);
      CkJsonObject_UpdateInt(JOReserve, 'reserveAmount', Global.ReceiptInfo.ChargeTotal);
      CkJsonObject_AppendObject(JOReq, 'reserve');
      JOItem := CkJsonObject_ObjectOf(JOReq, 'reserve');
      CkJsonObject_Load(JOItem, CkJsonObject__emit(JOReserve));

      { reserveDetails List }
      with TABSQuery.Create(nil) do
      try
        DatabaseName := ABSDB.DatabaseName;
        SQL.Text := Format('SELECT * FROM TBOrder WHERE receipt_no = %s', [QuotedStr(AReceiptNo)]);
        Prepare;
        Open;
        First;
        nIndex := 0;
        while not Eof do
        begin
          for var I := 1 to FieldByName('sale_qty').AsInteger do
          begin
            CkJsonObject_UpdateInt(JOReq, PWideChar(Format('reserveDetails[%d].productId', [nIndex])), FieldByName('product_id').AsInteger);
            CkJsonObject_UpdateInt(JOReq, PWideChar(Format('reserveDetails[%d].scheduleId', [nIndex])), FieldByName('schedule_id').AsInteger);
            CkJsonObject_UpdateInt(JOReq, PWideChar(Format('reserveDetails[%d].productRound', [nIndex])), FieldByName('product_round').AsInteger);
            CkJsonObject_UpdateInt(JOReq, PWideChar(Format('reserveDetails[%d].productDenominationId', [nIndex])), FieldByName('denomin_id').AsInteger);
            CkJsonObject_UpdateString(JOReq, PWideChar(Format('reserveDetails[%d].productDenominationName', [nIndex])), PWideChar(FieldByName('denomin_nm').AsString));
            CkJsonObject_UpdateInt(JOReq, PWideChar(Format('reserveDetails[%d].productGradeId', [nIndex])), FieldByName('product_grade_id').AsInteger);
            CkJsonObject_UpdateInt(JOReq, PWideChar(Format('reserveDetails[%d].salePrice', [nIndex])), FieldByName('unit_price').AsInteger);
            Inc(nIndex);
          end;

          Next;
        end;
      finally
        EnableControls;
      end;

      { paymentList List }
      with TABSQuery.Create(nil) do
      try
        DatabaseName := ABSDB.DatabaseName;
        SQL.Text := Format('SELECT * FROM TBPayment WHERE receipt_no = %s', [QuotedStr(AReceiptNo)]);
        Prepare;
        Open;
        First;
        nIndex := 0;
        while not Eof do
        begin
          CkJsonObject_UpdateString(JOReq, PWideChar(Format('paymentList[%d].receiptNo', [nIndex])), PWideChar(FieldByName('receipt_no').AsString));
          CkJsonObject_UpdateInt(JOReq, PWideChar(Format('paymentList[%d].payMethod', [nIndex])), FieldByName('pay_method').AsInteger);
          CkJsonObject_UpdateBool(JOReq, PWideChar(Format('paymentList[%d].approvalYn', [nIndex])), FieldByName('approval_yn').AsBoolean);
          CkJsonObject_UpdateString(JOReq, PWideChar(Format('paymentList[%d].vanCd', [nIndex])), PWideChar(FieldByName('van_cd').AsString));
          CkJsonObject_UpdateString(JOReq, PWideChar(Format('paymentList[%d].tid', [nIndex])), PWideChar(FieldByName('tid').AsString));
          CkJsonObject_UpdateBool(JOReq, PWideChar(Format('paymentList[%d].manualYn', [nIndex])), FieldByName('manual_yn').AsBoolean);
          CkJsonObject_UpdateString(JOReq, PWideChar(Format('paymentList[%d].creditCardNo', [nIndex])), PWideChar(FieldByName('credit_card_no').AsString));
          CkJsonObject_UpdateInt(JOReq, PWideChar(Format('paymentList[%d].instMon', [nIndex])), FieldByName('inst_mon').AsInteger);
          CkJsonObject_UpdateInt(JOReq, PWideChar(Format('paymentList[%d].approveAmt', [nIndex])), FieldByName('approve_amt').AsInteger);
          CkJsonObject_UpdateInt(JOReq, PWideChar(Format('paymentList[%d].vat', [nIndex])), FieldByName('vat').AsInteger);
          CkJsonObject_UpdateInt(JOReq, PWideChar(Format('paymentList[%d].serviceAmt', [nIndex])), FieldByName('service_amt').AsInteger);
          CkJsonObject_UpdateString(JOReq, PWideChar(Format('paymentList[%d].approveNo', [nIndex])), PWideChar(FieldByName('approve_no').AsString));
          CkJsonObject_UpdateString(JOReq, PWideChar(Format('paymentList[%d].orgApproveNo', [nIndex])), PWideChar(FieldByName('org_approve_no').AsString));
          CkJsonObject_UpdateString(JOReq, PWideChar(Format('paymentList[%d].tradeRequestNo', [nIndex])), PWideChar(FieldByName('trade_request_no').AsString));
          CkJsonObject_UpdateString(JOReq, PWideChar(Format('paymentList[%d].pinCode', [nIndex])), PWideChar(FieldByName('pin_code').AsString));
          CkJsonObject_UpdateString(JOReq, PWideChar(Format('paymentList[%d].tradeNo', [nIndex])), PWideChar(FieldByName('trade_no').AsString));
          CkJsonObject_UpdateString(JOReq, PWideChar(Format('paymentList[%d].tradeDttm', [nIndex])), PWideChar(FieldByName('trade_dttm').AsString));
          CkJsonObject_UpdateString(JOReq, PWideChar(Format('paymentList[%d].issuerCd', [nIndex])), PWideChar(FieldByName('issuer_cd').AsString));
          CkJsonObject_UpdateString(JOReq, PWideChar(Format('paymentList[%d].issuerNm', [nIndex])), PWideChar(FieldByName('issuer_nm').AsString));
          CkJsonObject_UpdateString(JOReq, PWideChar(Format('paymentList[%d].buyerDiv', [nIndex])), PWideChar(FieldByName('buyer_div').AsString));
          CkJsonObject_UpdateString(JOReq, PWideChar(Format('paymentList[%d].buyerCd', [nIndex])), PWideChar(FieldByName('buyer_cd').AsString));
          CkJsonObject_UpdateString(JOReq, PWideChar(Format('paymentList[%d].buyerNm', [nIndex])), PWideChar(FieldByName('buyer_nm').AsString));
          CkJsonObject_UpdateString(JOReq, PWideChar(Format('paymentList[%d].merchantKey', [nIndex])), PWideChar(FieldByName('merchant_key').AsString));
          CkJsonObject_UpdateString(JOReq, PWideChar(Format('paymentList[%d].paycoPayMethod', [nIndex])), PWideChar(FieldByName('payco_pay_method').AsString));

          Inc(nIndex);
          Next;
        end;
      finally
        EnableControls;
      end;

      sReqJSON := CkJsonObject__emit(JOReq);
      sUrl := Format('%s/v2/api/%s', [Global.APIServerInfo.Host, CS_API]);
      if not RequestToTicketLink(sUrl, 'PostReservation', sReqJSON, sRespJSON, AResMsg) then
        raise Exception.Create(AResMsg);
      if not CkJsonObject_Load(JOResp, PWideChar(sRespJSON)) then
        raise Exception.Create(CkJsonObject__lastErrorText(JOResp));

      nResCode := CkJsonObject_IntOf(JOResp, 'result.code');
      if (nResCode <> 0) then
      begin
        AResMsg := GetTextLocale(CkJsonObject_ObjectOf(JOResp, 'result.errorLang'));
        raise Exception.Create(AResMsg);
      end;

      AResMsg := CkJsonObject__stringOf(JOResp, 'result.message');
      AReserveNo := StrToInt64Def(CkJsonObject__stringOf(JOResp, 'data.reserveNo'), 0);
      if (AReserveNo = 0) then
      begin
        AResMsg := GetTextLocale(['예매번호가 없습니다.', 'No reservation number.']);
        raise Exception.Create(AResMsg);
      end;

      //영수증 테이블에 예매번호 저장
      with TBReceipt do
      if Locate('receipt_no', AReceiptNo, []) then
      begin
        Edit;
        FieldValues['reserve_no'] := AReserveNo;
        Post;
      end;

      Result := True;
    except
      on E: Exception do
      begin
        AResMsg := E.Message;
        AddLog(Format('DM.PostReservation.Exception = %s', [AResMsg]));
      end;
    end;
  finally
    if Assigned(JOItem) then
      CkJsonObject_Dispose(JOItem);
    CkJsonObject_Dispose(JOReserve);
    CkJsonObject_Dispose(JOReq);
    CkJsonObject_Dispose(JOResp);
  end;
end;

procedure TTLDataModule.PostCheckAlive;
const
  CS_API = 'checkAlive';
var
  JOReq, JOResp: HCkJsonObject;
  LUrl, LReqJSON, LRespJSON, LResMsg: string;
  LResCode: Integer;
begin
  JOReq := CkJsonObject_Create;
  JOResp := CkJsonObject_Create;
  try
    try
      CkJsonObject_UpdateInt(JOReq, 'partnerNo', Global.StoreInfo.PartnerNo);
      CkJsonObject_UpdateInt(JOReq, 'counterNo', Global.StoreInfo.CounterNo);
      CkJsonObject_UpdateInt(JOReq, 'counterId', Global.StoreInfo.CounterId);
      CkJsonObject_UpdateString(JOReq, 'scannerUseYn', PWideChar(IfThen(Global.BarcodeScanner.Active, CRC_YES, CRC_NO)));
      CkJsonObject_UpdateString(JOReq, 'printerUseYn', PWideChar(IfThen(Global.ReceiptPrinter.Active and
        ((not Global.TicketPrinter.Enabled) or (Global.TicketPrinter.Enabled and Global.TicketPrinter.Active)), CRC_YES, CRC_NO)));
      CkJsonObject_UpdateString(JOReq, 'kioskUseYn', PWideChar(IfThen(Global.KioskAvailable, CRC_YES, CRC_NO)));

      LReqJSON := CkJsonObject__emit(JOReq);
      LUrl := Format('%s/v2/api/%s', [Global.APIServerInfo.Host, CS_API]);
      if not RequestToTicketLink(LUrl, 'PostCheckAlive', LReqJSON, LRespJSON, LResMsg) then
        raise Exception.Create(LResMsg);
      if not CkJsonObject_Load(JOResp, PWideChar(LRespJSON)) then
        raise Exception.Create(CkJsonObject__lastErrorText(JOResp));

      LResCode := CkJsonObject_IntOf(JOResp, 'result.code');
      if (LResCode <> 0) then
      begin
        LResMsg := GetTextLocale(CkJsonObject_ObjectOf(JOResp, 'result.errorLang'));
        raise Exception.Create(LResMsg);
      end;
    except
      on E: Exception do
        AddLog(Format('DM.PostCheckAlive.Exception = %s', [E.Message]));
    end;
  finally
    CkJsonObject_Dispose(JOResp);
    CkJsonObject_Dispose(JOReq);
  end;
end;

function TTLDataModule.DoICReaderVerify(const AVanCode, AVanTID: string; var AErrMsg: string): Boolean;
{$IFDEF RELEASE}
var
  LRecvMsg: AnsiString;
{$ENDIF}
begin
  Result := False;
  AErrMsg := '';
  AddLog('DM.DoICReaderVerify.Start');
  try
    try
      Global.VanModule.VanCode := AVanCode;
      Global.VanModule.ApplyConfigAll;
{$IFDEF RELEASE}
      if not Global.VanModule.CallICReaderVerify(AVanTID, LRecvMsg) then
        raise Exception.Create(LRecvMsg);
{$ENDIF}
      Global.ICCardReader.Active := True;
      Result := True;
      AddLog('DM.DoICReaderVerify.Result = Success');
    except
      on E: Exception do
      begin
        AErrMsg := E.Message;
        AddLog(Format('DM.DoICReaderVerify.Exception = %s', [E.Message]));
      end;
    end;
  finally
    AddLog('DM.DoICReaderVerify.Complete');
  end;
end;

procedure TTLDataModule.DoCacheNoticeImages;
var
  SL: TStringList;
  LPos1, LPos2, LPos3: Integer;
  LWorking, LUrl, LFileName: string;
begin
  Global.StoreInfo.KioskNotice := StringReplace(Global.StoreInfo.KioskNotice, '\"', '"', [rfReplaceAll]);
//  Global.StoreInfo.KioskNotice :=
//    '<p>키오스크에&nbsp;노출되는&nbsp;공지사항&nbsp;내용을&nbsp;등록합니다.</p>' +
//    '<p>이미지&nbsp;노출도&nbsp;함께&nbsp;되는지&nbsp;체크합니다.</p>' +
//    '<p>&nbsp;</p>' +
//    '<p>000</p>' +
//    '<p>&nbsp;</p>' +
//    '<p>&nbsp;</p>' +
//    '<p><img src="http://image.toast.com/aaaaaas/alpha-ticketlink/TKL_2/3de3aec643ffa3.jpg" title="3de3aec643ffa3.jpg"><br style="clear:both;">&nbsp;</p>';
  LWorking := Global.StoreInfo.KioskNotice;
  SL := TStringList.Create;
  try
    try
      while True do
      begin
        LPos1 := Pos('<img ', LWorking); //5
        if (LPos1 = 0) then
          Break;
//        AddLog(Format('DM.DoCacheNoticeImages.Pos1 = %d', [LPos1]));
        LPos1 := LPos1 + 5;
        LWorking := LWorking.Substring(LPos1);
//        AddLog(Format('DM.DoCacheNoticeImages.Working1 = %s', [LWorking]));

        LPos2 := Pos(' src="', LWorking); //5
        LPos2 := LPos2 + 5;
        LWorking := LWorking.Substring(LPos2);
        if (LPos2 = 0) then
          Break;
//        AddLog(Format('DM.DoCacheNoticeImages.Pos2 = %d', [LPos2]));
//        AddLog(Format('DM.DoCacheNoticeImages.Working2 = %s', [LWorking]));

        LPos3 := Pos('"', LWorking);
        if (LPos3 = 0) then
          Break;
//        AddLog(Format('DM.DoCacheNoticeImages.Pos3 = %d', [LPos3]));
        LUrl := LWorking.Substring(0, Pred(LPos3));
        if (SL.IndexOf(LUrl) < 0) then
          SL.Add(LUrl);
//        AddLog(Format('DM.DoCacheNoticeImages.Working3 = %s', [LUrl]));
      end;

      for var I := 0 to Pred(SL.Count) do
      begin
        LFileName := Global.LogDir + SL[I].SubString(LastDelimiter('/', SL[I]));
        if GetFileFromUrl(LUrl, LFileName) then
          Global.StoreInfo.KioskNotice := StringReplace(Global.StoreInfo.KioskNotice, SL[I], 'file://' + LFileName, [rfReplaceAll]);
      end;
      AddLog(Format('DM.DoCacheNoticeImages.Result = %s', [Global.StoreInfo.KioskNotice]));
    except
      on E: Exception do
        AddLog(Format('DM.DoCacheNoticeImages.Exception = %s, Notice: %s', [E.Message, Global.StoreInfo.KioskNotice]));
    end;
  finally
    FreeAndNil(SL);
  end;
end;

function TTLDataModule.GetICCardInsertionStatus(var ARespCode, ARespMsg: AnsiString): Boolean;
begin
  ARespCode := '';
  ARespMsg := '';
  Result := Global.VanModule.CallICCardInsertionCheck(Global.StoreInfo.VANTID, False, ARespCode, ARespMsg);
  if not Result then
    AddLog(Format('DM.GetICCardInsertionStatus.Exception = Code: %s, Error: %s', [ARespCode, ARespMsg]));
end;

//신용카드 결제
function TTLDataModule.DoApproveCARD(const AReceiptNo: string; const APaymentAmt: Integer; var AStoredData: Boolean; var AResMsg: string): Boolean;
var
  SI: TCardSendInfoDM;
  RI: TCardRecvInfoDM;
  LReserveNo: Int64;
  LDataCount: Integer;
  LCardBinNo, LErrMsg: string;
begin
  Result := False;
  AStoredData := True;
  AResMsg := '';

  try
    if Global.StoreInfo.UseDetectCardInsert then
      ShowWaitMsg(GetTextLocale(['결제내역을 처리 중입니다...' + _CRLF + '잠시만 기다려 주십시오.',
                                 'Processing your payment...' + _CRLF + 'Please hold.',
                                 '決済履歴を処理しています...' + _CRLF + 'しばらくお待ちください。',
                                 '支付明细正在处理中...' + _CRLF + '请稍后。']));

    try
      SI.Approval     := True;
      SI.SaleAmt      := APaymentAmt;
      SI.FreeAmt      := 0;
      SI.SvcAmt       := 0;
      SI.VatAmt       := 0; //비과세
      SI.EyCard       := False;
      SI.KeyInput     := False;
      SI.TrsType      := ''; //A:바코드 사전등록 시
      SI.HalbuMonth   := 0;
      SI.TerminalID   := Global.StoreInfo.VANTID;
      SI.BizNo        := Global.StoreInfo.BizNo;
      SI.SignOption   := CRC_NO;
      SI.CardBinNo    := '';
      SI.OrgAgreeNo   := '';
      SI.OrgAgreeDate := '';
      //결제 서비스 방식이 PG인 경우
      if Global.StoreInfo.UsePG then
        SI.Reserved1 := CCC_FLAG_USE_PG;

      //카드사별 제약 처리
      LCardBinNo := '';
      for var I: ShortInt := 0 to Pred(Global.DenominList.Count) do
      begin
        if (Global.DenominList[I].LimitCardKcpPaymentYN = False) or
           (Global.DenominList[I].LimitCardBinCodeList.Count = 0) then
          Continue;

        if LCardBinNo.IsEmpty then
        begin
          RI := Global.VanModule.CallCardInfo(SI);
          if not RI.Result then
            raise Exception.Create(RI.Msg);

          LCardBinNo := Trim(RI.CardBinNo); //6자리(국내), 8자리(국제)
          SI.CardBinNo := LCardBinNo;
        end;

        if (Global.DenominList[I].LimitCardBinCodeList.IndexOf(LCardBinNo) < 0) then
          if (Global.DenominList[I].LimitCardBinCodeList.IndexOf(LCardBinNo.SubString(0, 6)) < 0) then
            raise Exception.Create(GetTextLocale(['주문할 상품에 사용할 수 없는 카드입니다.',
                                                  'This card can''t be used to complete your order.',
                                                  '注文する商品に使用できないカードです。',
                                                  '所购买商品无法利用银行卡支付。']));
      end;

      //chy test
      {$IFDEF RELEASE}
      RI := Global.VanModule.CallCard(SI);
      if not RI.Result then
        raise Exception.Create(RI.Msg);
      {$ENDIF}
      {$IFDEF DEBUG}
      {$ENDIF}

      Result := True;
      if Result then
      begin
        PaymentLog(True, AReceiptNo, CPM_CARD, RI.CardNo, RI.AgreeNo, APaymentAmt);
        //매출 저장 시에 에러가 발생하더라도 저장 실패 메시지만 표시하도록 예외 처리
        try
          if not UpdatePaymentCARD(True, AReceiptNo, CPM_CARD, RI, LErrMsg) then
            raise Exception.Create(LErrMsg);
          if not UpdateReceipt(AReceiptNo, APaymentAmt, 0, 0, Copy(RI.AgreeDateTime, 1, 8), Copy(RI.AgreeDateTime, 9, 6), LErrMsg) then
            raise Exception.Create(LErrMsg);
          if not PostReservation(AReceiptNo, TPT_OFF_CARD, LReserveNo, LErrMsg) then
            raise Exception.Create(LErrMsg);

          //발권내역 저장
          Global.ReceiptInfo.ReserveNo := LReserveNo;
          if not GetTicketList(LReserveNo, LDataCount, LErrMsg) then
            raise Exception.Create(LErrMsg);
          if (LDataCount = 0) then
            raise Exception.Create(Format(GetTextLocale(['예매번호 %d로 등록된 예매 내역이 없습니다.',
                                                         'No tickets found with reservation number %d.',
                                                         '予約番号「%d」で登録されている前売履歴がありません。',
                                                         '无与预购号码%d相匹配的预购明细。']), [LReserveNo]));
        except
          on E: Exception do
          begin
            AStoredData := False;
            AResMsg := E.Message;
            AddLog(Format('DM.DoApproveCARD.StoredData.Exception = %s', [AResMsg]));
          end;
        end;
      end;
    except
      on E: Exception do
      begin
        AResMsg := E.Message;
        AddLog(Format('DM.DoApproveCARD.Exception = %s', [AResMsg]));
      end;
    end;
  finally
    if Global.StoreInfo.UseDetectCardInsert then
      PushWaitMsg;
  end;
end;

//PAYCO API 연동 결제
function TTLDataModule.DoApprovePAYCO(const AReceiptNo: string; const APaymentAmt: Integer; const APinCode: string; var AStoredData: Boolean; var AResMsg: string): Boolean;
var
  JOReq, JOResp, JOSign, JOExtras, JOItem: HCkJsonObject;
  JA: HCkJsonArray;
  RI: TPaycoNewRecvInfo;
  LCardBinNo, LUrl, LBizNo, LReqJSON, LRespJSON, LSignature, LProdName, LTradeRequestNo, LErrMsg: string;
  LResCode, LCount, LApprovalAmt, LPayMethod, LDataCount: Integer;
  LReserveNo: Int64;
begin
  Result := False;
  AStoredData := True;
  AResMsg := '';
  JOReq := CkJsonObject_Create;
  JOResp := CkJsonObject_Create;
  JOExtras := CkJsonObject_Create;
  JOSign := CkJsonObject_Create;
  JOItem := nil;
  JA := CkJsonArray_Create;
  ShowWaitMsg(GetTextLocale(['결제내역을 처리 중입니다...' + _CRLF + '잠시만 기다려 주십시오.',
                             'Processing your payment...' + _CRLF + 'Please hold. ',
                             '決済履歴を処理しています...' + _CRLF + 'しばらくお待ちください。',
                             '支付明细正在处理中...' + _CRLF + '请稍后。']));

  try
    try
      //카드사별 제약 처리
      LCardBinNo := '';
      for var I: ShortInt := 0 to Pred(Global.DenominList.Count) do
      begin
        if (Global.DenominList[I].LimitCardKcpPaymentYN = False) or
           (Global.DenominList[I].LimitCardBinCodeList.Count = 0) then
          Continue;

        if LCardBinNo.IsEmpty then
          LCardBinNo := APinCode.SubString(0, 8); //6자리(국내), 8자리(국제)
        if (Global.DenominList[I].LimitCardBinCodeList.IndexOf(LCardBinNo) < 0) then
          if (Global.DenominList[I].LimitCardBinCodeList.IndexOf(LCardBinNo.SubString(0, 6)) < 0) then
            raise Exception.Create(GetTextLocale(['주문할 상품에 사용할 수 없는 카드입니다.',
                                                  'This card can''t be used to complete your order.',
                                                  '注文する商品に使用できないカードです。',
                                                  '所购买商品无法利用银行卡支付。']));
      end;

      LUrl := Global.StoreInfo.PaycoHost + Global.StoreInfo.PaycoUriApproval;
      LBizNo := IfThen(Global.StoreInfo.PaycoVanTID = CCC_DEV_PAYCO_TID, CCC_DEV_PAYCO_BIZNO, Global.StoreInfo.BizNo);
      LSignature := GetSignaturePAYCO(APinCode);
      LProdName := '티켓';

      CkJsonObject_UpdateString(JOReq, 'registrationNumber', PWideChar(LBizNo));
      CkJsonObject_UpdateString(JOReq, 'vanPosTid', PWideChar(Global.StoreInfo.PaycoVanTID));
      CkJsonObject_UpdateString(JOReq, 'posTid', PWideChar(Global.StoreInfo.PaycoPosTID));
      CkJsonObject_UpdateString(JOReq, 'serviceType', 'PAYCO');
      CkJsonObject_UpdateString(JOReq, 'vanCorpCode', PWideChar(Global.StoreInfo.VanCode));
      CkJsonObject_UpdateInt(JOReq, 'totalAmount', APaymentAmt);
      CkJsonObject_UpdateString(JOReq, 'pinCode', PWideChar(APinCode));
      CkJsonObject_UpdateString(JOReq, 'posReferenceKey', PWideChar(AReceiptNo));

      for var I := 0 to Pred(Global.OrderList.Count) do
      begin
        if (I = 0) then
        begin
          LProdName := Global.OrderList[0].ItemTitle;
          if (Global.OrderList.Count > 1) then
            LProdName := Format('%s 외 %d건', [LProdName, Pred(Global.OrderList.Count)]);
        end;

        CkJsonObject_UpdateString(JOReq, PWideChar(Format('productInfoList[%d].productCode', [I])), PWideChar(IntToStr(Global.OrderList[I].DenominId)));
        CkJsonObject_UpdateString(JOReq, PWideChar(Format('productInfoList[%d].productName', [I])), PWideChar(Global.OrderList[I].ItemTitle));
        CkJsonObject_UpdateInt(JOReq, PWideChar(Format('productInfoList[%d].productQuantity', [I])), Global.OrderList[I].ItemQty);
        CkJsonObject_UpdateInt(JOReq, PWideChar(Format('productInfoList[%d].productUnitAmount', [I])), Global.OrderList[I].ItemPrice);
        CkJsonObject_UpdateString(JOReq, PWideChar(Format('productInfoList[%d].promotionYn', [I])), CRC_YES);
      end;

      CkJsonObject_UpdateString(JOReq, 'signature', PWideChar(LSignature));
      CkJsonObject_UpdateString(JOReq, 'productName', PWideChar(LProdName));
      CkJsonObject_UpdateString(JOReq, 'currency', 'KRW');
      CkJsonObject_UpdateString(JOReq, 'deviceAuthType', 'BAR');
      CkJsonObject_UpdateString(JOReq, 'deviceType', 'POS');

      CkJsonObject_UpdateString(JOExtras, 'posDevCorpName', PWideChar(CCC_PAYCO_POS_DEV_CORP));
      CkJsonObject_UpdateString(JOExtras, 'posSolutionName', PWideChar(CCC_PAYCO_POS_SOLUTION));
      CkJsonObject_UpdateString(JOExtras, 'posSolutionVersion', PWideChar(Global.ProductVersion));
      CkJsonObject_putEmitCompact(JOExtras, False);
      CkJsonObject_AppendObject(JOReq, 'extras');
      JOItem := CkJsonObject_ObjectOf(JOReq, 'extras');
      CkJsonObject_Load(JOItem, CkJsonObject__emit(JOExtras));

      //PAYCO-PG는 서명데이터 처리 불필요
      if not Global.StoreInfo.UsePG then
      begin
        CkJsonObject_UpdateString(JOSign, 'signData', '');
        CkJsonObject_UpdateInt(JOSign, 'signLength', 0);
        CkJsonObject_UpdateString(JOSign, 'signpadVanCorpCode', PWideChar(Global.StoreInfo.VanCode));
        CkJsonObject_UpdateString(JOSign, 'signpadYN', CRC_NO);
        CkJsonObject_putEmitCompact(JOSign, False);
        CkJsonObject_AppendObject(JOReq, 'sign');
        JOItem := CkJsonObject_ObjectOf(JOReq, 'sign');
        CkJsonObject_Load(JOItem, CkJsonObject__emit(JOSign));
      end;

      LReqJSON := CkJsonObject__emit(JOReq);
      if not RequestToPAYCO(LUrl, 'DoApprovePAYCO', LReqJSON, LRespJSON, AResMsg) then
        raise Exception.Create(AResMsg);
      if not CkJsonObject_Load(JOResp, PWideChar(LRespJSON)) then
        raise Exception.Create(CkJsonObject__lastErrorText(JOResp));

      LResCode := CkJsonObject_IntOf(JOResp, 'resultCode');
      AResMsg := CkJsonObject__stringOf(JOResp, 'message');
      if (LResCode <> 0) then
        raise Exception.Create(AResMsg);

      Result := True;
      RI.Code := CkJsonObject__stringOf(JOResp, 'sourceResultCode'); //0000
      RI.Msg := CkJsonObject__stringOf(JOResp, 'sourceMessage'); //정상승인
      RI.TradeNo := CkJsonObject__stringOf(JOResp, 'result.tradeNo'); //30022741
      LTradeRequestNo := CkJsonObject__stringOf(JOResp, 'result.tradeRequestNo'); //2022041810447574
      RI.TransDateTime := CkJsonObject__stringOf(JOResp, 'result.tradeDatetime'); //20220217161113

      JA := CkJsonObject_ArrayOf(JOResp, 'result.approvalResultList');
      LCount := CkJsonArray_getSize(JA);
      //nVAT := 0;
      for var I := 0 to Pred(LCount) do
      begin
        JOItem := CkJsonArray_ObjectAt(JA, I);

        RI.PaymentMethodCode := CkJsonObject__stringOf(JOItem, 'paymentMethodCode'); //00
        RI.PaymentMethodName := CkJsonObject__stringOf(JOItem, 'paymentMethodName'); //신용카드
        RI.AgreeNo := CkJsonObject__stringOf(JOItem, 'approvalNo'); //30022741

        LApprovalAmt := Trunc(CkJsonObject_IntOf(JOItem, 'approvalAmount')); //61000.0
        RI.AgreeAmt := LApprovalAmt;
        RI.TransDateTime := CkJsonObject__stringOf(JOItem, 'approvalDatetime'); //20220217161113
        RI.ApprovalCompanyCode := CkJsonObject__stringOf(JOItem, 'approvalCompanyCode'); //CCKM
        RI.ApprovalCompanyName := CkJsonObject__stringOf(JOItem, 'approvalCompanyName'); //KB국민카드
        RI.RevCardNo := CkJsonObject__stringOf(JOItem, 'approvalCardNo'); //457973******2091
//				CkJsonObject__stringOf(JOItem, 'sourcePaymentMethdCode'); //37
        RI.HalbuMonth := CkJsonObject__stringOf(JOItem, 'installmentPeriod'); //00
//				CkJsonObject_IntOf(JOItem, 'taxfreeAmount'); //0.0
//				CkJsonObject_IntOf(JOItem, 'taxableAmount'); //55455.0
//				LVAT := LVAT + CkJsonObject_IntOf(JOItem, 'vatAmount'); //5545.0
//				CkJsonObject_IntOf(JOItem, 'serviceAmount'); //0.0
        RI.BuyCompanyCode := CkJsonObject__stringOf(JOItem, 'vanApprovalCompanyCode'); //CCKM
        RI.BuyCompanyName := CkJsonObject__stringOf(JOItem, 'vanApprovalCompanyName'); //KB국민카드

        LPayMethod := CPM_PAYCO_CARD;
        if (RI.PaymentMethodCode = PPC_PAYCO_POINT) then
          LPayMethod := CPM_PAYCO_POINT
        else if (RI.PaymentMethodCode = PPC_PAYCO_COUPON) then
          LPayMethod := CPM_PAYCO_COUPON;

        PaymentLog(True, AReceiptNo, LPayMethod, RI.RevCardNo, RI.AgreeNo, LApprovalAmt);
        AStoredData := UpdatePaymentPAYCO(True, AReceiptNo, APinCode, LTradeRequestNo, LPayMethod, RI, LErrMsg);
        if not AStoredData then
          Break;
      end;

      //매출 저장 시에 에러가 발생하더라도 저장 실패 메시지만 표시하도록 예외 처리
      try
        if not AStoredData then
          raise Exception.Create(LErrMsg);
        if not UpdateReceipt(AReceiptNo, APaymentAmt, 0, 0, Copy(RI.TransDateTime, 1, 8), Copy(RI.TransDateTime, 9, 6), LErrMsg) then
          raise Exception.Create(LErrMsg);
        if not PostReservation(AReceiptNo, TPT_OFF_DONGLE, LReserveNo, LErrMsg) then
          raise Exception.Create(LErrMsg);

        //예매내역 저장
        Global.ReceiptInfo.ReserveNo := LReserveNo;
        if not GetTicketList(LReserveNo, LDataCount, LErrMsg) then
          raise Exception.Create(LErrMsg);
        if (LDataCount = 0) then
          raise Exception.Create(Format(GetTextLocale(['예매번호 %d로 등록된 예매 내역이 없습니다.',
                                                       'No tickets found with reservation number %d.',
                                                       '予約番号「%d」で登録されている前売履歴がありません。',
                                                       '无与预购号码%d相匹配的预购明细。']), [LReserveNo]));
      except
        on E: Exception do
        begin
          AStoredData := False;
          AResMsg := E.Message;
        end;
      end;
    except
      on E: Exception do
      begin
        AResMsg := E.Message;
        AddLog(Format('DM.DoApprovePAYCO.Exception = %s', [AResMsg]));
      end;
    end;
  finally
    PushWaitMsg;
    if Assigned(JA) then
      CkJsonArray_Dispose(JA);
    if Assigned(JOItem) then
      CkJsonObject_Dispose(JOItem);
    if Assigned(JOSign) then
      CkJsonObject_Dispose(JOSign);
    if Assigned(JOExtras) then
      CkJsonObject_Dispose(JOExtras);
    CkJsonObject_Dispose(JOResp);
    CkJsonObject_Dispose(JOReq);
  end;
end;

{$IFDEF PAYCO_VCAT_PERSIST}
//PAYCO VCAT 연동 결제
function TTLDataModule.DoApprovePAYCO_VCAT(const AReceiptNo: string; const APaymentAmt: Integer; var AStoredData: Boolean; var AResMsg: string): Boolean;
var
  SI: TPaycoNewSendInfo;
  RI: TPaycoNewRecvInfo;
  sGoodsName, sGoodsList: string;
  nPayMethod, nDataCount: Integer;
  nReserveNo: Int64;
begin
  Result := False;
  AStoredData := True;
  AResMsg := '';
  try
    //nVAT := (APaymentAmt - Trunc(APaymentAmt / 1.1));
    SI.TerminalID := Global.StoreInfo.PaycoVanTID;
    SI.BizNo := IfThen(Global.StoreInfo.PaycoVanTID = CCC_PAYCO_POS_DEV_TID, CCC_PAYCO_POS_DEV_BIZNO, Global.StoreInfo.BizNo);
    SI.SerialNo := Global.StoreInfo.PaycoVanTID;
    SI.VanName := Global.StoreInfo.VanCode;
    SI.Approval := True;
    SI.PayAmt := APaymentAmt;
    SI.TaxAmt := 0; //비과세
    SI.DutyAmt := SI.PayAmt; //(SI.PayAmt - nVAT);
    SI.FreeAmt := 0;
    SI.TipAmt := 0;
    SI.PointAmt := 0;
    SI.CouponAmt := 0;
    SI.ServiceType := '';
    SI.ApprovalAmount := (SI.PayAmt - SI.PointAmt - SI.CouponAmt);

    sGoodsName := '';
    sGoodsList := '';
    for var I := 0 to Pred(OrderList.Count) do
    begin
      if (I = 0) then
        sGoodsName := '상품' + IntToStr(Succ(I))
      else
        sGoodsList := sGoodsList + _SOH;
      sGoodsList := sGoodsList + '001' + _SOH + '상품' + IntToStr(Succ(I)) + _SOH +
        IntToStr(OrderList[I].ItemPrice) + _SOH + IntToStr(OrderList[I].ItemQty);
      sGoodsList := sGoodsList + _SOH + CRC_YES;
    end;

    PaycoModule.GoodsName := sGoodsName;
    PaycoModule.GoodsList := sGoodsList;
    RI := PaycoModule.ExecPayProc(SI);
    Result := RI.Result;
    if Result then
    begin
      nPayMethod := CPM_PAYCO_CARD;
      if (RI.PaymentMethodCode = PPC_PAYCO_POINT) then
        nPayMethod := CPM_PAYCO_POINT
      else if (RI.PaymentMethodCode = PPC_PAYCO_COUPON) then
        nPayMethod := CPM_PAYCO_COUPON;

      ShowWaitMsg('결제내역을 처리 중입니다...' + _CRLF + '잠시만 기다려 주십시오.');
      try
        PaymentLog(True, AReceiptNo, nPayMethod, RI.CardNo, RI.AgreeNo, APaymentAmt);
        //매출 저장 시에 에러가 발생하더라도 저장 실패 메시지만 표시하도록 예외 처리
        try
          if not UpdatePaymentPAYCO(True, AReceiptNo, '', CPM_PAYCO_CARD, RI, sErrMsg) then
            raise Exception.Create(sErrMsg);
          if not UpdateReceipt(AReceiptNo, APaymentAmt, 0, 0, Copy(RI.TransDateTime, 1, 8), Copy(RI.TransDateTime, 9, 6), sErrMsg) then
            raise Exception.Create(sErrMsg);
          if not PostReserveList(AReceiptNo, TPT_OFF_DONGLE, nReserveNo, sErrMsg) then
            raise Exception.Create(sErrMsg)

          //예매내역 저장
          Global.ReceiptInfo.ReserveNo := nReserveNo;
          if not GetTicketList(nReserveNo, nDataCount, sErrMsg) then
            raise Exception.Create(sErrMsg);
          if (nDataCount = 0) then
            raise Exception.Create(Format('예매번호 %d로 등록된 예매 내역이 없습니다.', [nReserveNo]));
        except
          on E: Exception do
          begin
            AStoredData := False;
            AResMsg := E.Message;
          end;
        end;
      finally
        PushWaitMsg;
      end;
    end;
  except
    on E: Exception do
    begin
      AResMsg := E.Message;
      AddLog(Format('DM.DoApprovePAYCO_VCAT.Exception = %s', [AResMsg]));
    end;
  end;
end;
{$ENDIF}

//PAYCO API 전문 요청
function TTLDataModule.RequestToPAYCO(const AUrl, AJobName: string; const AReqJSON: string; var ARespJSON: string; AResMsg: string): Boolean;
var
  HC: TIdHTTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL;
  RS, SS: TStringStream;
begin
  Result := False;
  AResMsg := '';
  SS := TStringStream.Create(AReqJson, TEncoding.UTF8);
  RS := TStringStream.Create;
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  HC := TIdHTTP.Create(nil);
  try
    try
      AddLog(Format('DM.RequestToPAYCO.%s = %s', [AJobName, AUrl]));
      SS.SaveToFile(Global.LogDir + Format('%s.Request.json', [AJobName]));

      SSL.SSLOptions.Method := sslvSSLv23;
      SSL.SSLOptions.Mode := sslmClient;
      HC.Request.Method := Id_HTTPMethodPost;
      HC.Request.ContentType := 'application/json';
      HC.URL.URI := Global.StoreInfo.PaycoHost;
      HC.IOHandler := SSL;
      HC.HandleRedirects := False;
      HC.ConnectTimeout := IdTimeoutDefault;
      HC.ReadTimeout := IdTimeoutDefault;
      HC.Post(AUrl, SS, RS);

      ARespJson := TEncoding.UTF8.GetString(RS.Bytes, 0, RS.Size);
      RS.SaveToFile(Global.LogDir + Format('%s.Response.json', [AJobName]));
      Result := True;
    except
      on E: EIdHTTPProtocolException do
        AResMsg := E.Message;
      on E: Exception do
        AResMsg := E.Message;
    end;
  finally
    HC.Disconnect;
    HC.Free;
    FreeAndNil(SS);
    FreeAndNil(RS);
    FreeAndNil(SSL);
  end;
end;

//영수증 및 상품 주문내역 등록
function TTLDataModule.UpdateReceipt(const AReceiptNo: string; const ASaleAmt, ADiscountAmt, AVAT: Integer; const ATradeDate, ATradeTime: string; var AResMsg: string): Boolean;
begin
  Result := False;
  AResMsg := '';
  try
    with TBReceipt do
    try
      DisableControls;
      Append;
      FieldValues['receipt_no']     := AReceiptNo;
      FieldValues['receipt_status'] := TRS_APPROVAL;
      FieldValues['partner_no']     := Global.StoreInfo.PartnerNo;
      FieldValues['counter_no']     := Global.StoreInfo.CounterNo;
      FieldValues['product_id']     := Global.ReceiptInfo.ProductId;
      FieldValues['schedule_id']    := Global.ReceiptInfo.ScheduleId;
      FieldValues['product_round']  := Global.ReceiptInfo.ProductRound;
      FieldValues['reserve_no']     := 0; //매출 등록 후 서버로부터 수신하는 값
      FieldValues['sale_date']      := FormattedDateString(ATradeDate);
      FieldValues['sale_time']      := FormattedTimeString(ATradeTime);
      FieldValues['sale_qty']       := Global.ReceiptInfo.TicketCount;
      FieldValues['sale_amt']       := ASaleAmt;
      FieldValues['dc_amt']         := ADiscountAmt;
      FieldValues['payment_amt']    := (ASaleAmt - ADiscountAmt);
      FieldValues['vat']            := AVAT;
      FieldValues['update_dttm']    := Now;
      Post;
    finally
      EnableControls;
    end;

    with TBOrder do
    try
      DisableControls;
      for var I := 0 to Pred(Global.OrderList.Count) do
      begin
        Append;
        FieldValues['receipt_no'] := AReceiptNo;
        FieldValues['product_id'] := Global.ProductList[Global.OrderList[I].ProductIndex].ProductId;
        FieldValues['schedule_id'] := Global.RoundList[Global.OrderList[I].RoundIndex].ScheduleId;
        FieldValues['product_round'] := Global.RoundList[Global.OrderList[I].RoundIndex].ProductRound;
        FieldValues['product_grade_id'] := Global.DenominList[Global.OrderList[I].DenominIndex].ProductGradeId;
        FieldValues['denomin_id'] := Global.OrderList[I].DenominId;
        FieldValues['denomin_category_id'] := Global.DenominList[Global.OrderList[I].DenominIndex].DenominCategoryId;
        FieldValues['unit_price'] := Global.OrderList[I].ItemPrice;
        FieldValues['sale_qty'] := Global.OrderList[I].ItemQty;
        FieldValues['sale_amt'] := (Global.OrderList[I].ItemPrice * Global.OrderList[I].ItemQty);
        FieldValues['product_nm'] := Global.ProductList[Global.OrderList[I].ProductIndex].ProductName;
        FieldValues['denomin_category_nm'] := Global.DenominList[Global.OrderList[I].DenominIndex].DenominCategoryName;
        FieldValues['denomin_nm'] := Global.DenominList[Global.OrderList[I].DenominIndex].DenominName;
        FieldValues['update_dttm'] := Now;
        Post;
      end;
    finally
      EnableControls;
    end;

    Result := True;
  except
    on E: Exception do
    begin
      AResMsg := E.Message;
      AddLog(Format('DM.UpdateReceipt(%s).Exception = %s', [AReceiptNo, AResMsg]));
    end;
  end;
end;

//결제내역 등록 - 신용카드
function TTLDataModule.UpdatePaymentCARD(const AIsApproval: Boolean; const AReceiptNo: string; const APayMethod: Integer; RI: TCardRecvInfoDM; var AResMsg: string): Boolean;
begin
  Result := False;
  AResMsg := '';
  with TBPayment do
  try
    DisableControls;
    try
      Append;
      FieldValues['receipt_no']       := AReceiptNo;
      FieldValues['pay_method']       := APayMethod;
      FieldValues['approval_yn']      := AIsApproval;
      FieldValues['van_cd']           := Global.StoreInfo.VanCode;
      FieldValues['tid']              := Global.StoreInfo.VanTID;
      FieldValues['manual_yn']        := False; //수기등록 여부
      FieldValues['credit_card_no']   := RI.CardNo;
      FieldValues['approve_no']       := RI.AgreeNo;
      FieldValues['org_approve_no']   := '';
      FieldValues['trade_request_no'] := '';
      FieldValues['pin_code']         := '';
      FieldValues['trade_no']         := RI.TransNo;
      FieldValues['trade_dttm']       := RI.AgreeDateTime;
      FieldValues['issuer_cd']        := RI.BalgupsaCode;
      FieldValues['issuer_nm']        := RI.BalgupsaName;
      FieldValues['buyer_div']        := '';
      FieldValues['buyer_cd']         := RI.CompCode;
      FieldValues['buyer_nm']         := RI.CompName;
      FieldValues['inst_mon']         := 0;
      FieldValues['approve_amt']      := RI.AgreeAmt;
      FieldValues['vat']              := 0; //비과세 //(RI.AgreeAmt - Trunc(RI.AgreeAmt / 1.1));
      FieldValues['service_amt']      := 0;
      FieldValues['merchant_key']     := RI.KamaengNo;
      FieldValues['payco_pay_method'] := '';
      FieldValues['update_dttm']      := Now;
      Post;
      Result := True;
    except
      on E: Exception do
      begin
        AResMsg := E.Message;
        AddLog(Format('DM.UpdatePaymentCARD(%s, %s).Exception = %s', [AReceiptNo, BoolToStr(AIsApproval), AResMsg]));
      end;
    end;
  finally
    EnableControls;
  end;
end;

//결제내역 등록 - PAYCO
function TTLDataModule.UpdatePaymentPAYCO(const AIsApproval: Boolean; const AReceiptNo, APInCode, ATradeRequestNo: string;
  const APayMethod: Integer; RI: TPaycoNewRecvInfo; var AResMsg: string): Boolean;
begin
  Result := False;
  AResMsg := '';
  with TBPayment do
  try
    DisableControls;
    try
      Append;
      FieldValues['receipt_no']       := AReceiptNo;
      FieldValues['pay_method']       := APayMethod;
      FieldValues['approval_yn']      := AIsApproval;
      FieldValues['van_cd']           := Global.StoreInfo.VanCode;
      FieldValues['tid']              := Global.StoreInfo.PaycoVanTID;
      FieldValues['manual_yn']        := False; //수기등록 여부
      FieldValues['credit_card_no']   := RI.RevCardNo;
      FieldValues['approve_no']       := RI.AgreeNo;
      FieldValues['org_approve_no']   := '';
      FieldValues['trade_request_no'] := ATradeRequestNo;
      FieldValues['pin_code']         := APinCode;
      FieldValues['trade_no']         := RI.TradeNo;
      FieldValues['trade_dttm']       := RI.TransDateTime;
      FieldValues['issuer_cd']        := RI.ApprovalCompanyCode;
      FieldValues['issuer_nm']        := RI.ApprovalCompanyName;
      FieldValues['buyer_div']        := '';
      FieldValues['buyer_cd']         := RI.BuyCompanyCode;
      FieldValues['buyer_nm']         := RI.BuyCompanyName;
      FieldValues['inst_mon']         := StrToIntDef(RI.HalbuMonth, 0);
      FieldValues['approve_amt']      := Trunc(RI.AgreeAmt);
      FieldValues['vat']              := 0; //비과세 //Trunc(RI.AgreeAmt - Trunc(RI.AgreeAmt / 1.1));
      FieldValues['service_amt']      := 0;
      FieldValues['merchant_key']     := Global.StoreInfo.PaycoMerchantKey;
      FieldValues['payco_pay_method'] := RI.PaymentMethodCode;
      FieldValues['update_dttm']      := Now;
      Post;
      Result := True;
    except
      on E: Exception do
      begin
        AResMsg := E.Message;
        AddLog(Format('DM.UpdatePaymentPAYCO(%s, %s).Exception = %s', [AReceiptNo, BoolToStr(AIsApproval), AResMsg]));
      end;
    end;
  finally
    EnableControls;
  end;
end;

//영수증 출력을 위한 JSON 전문 생성
function TTLDataModule.GetPrintingScript(const AReceiptNo: string; const AReserveNo: Int64; const AReceiptPrint: Boolean; var AResMsg: string): Boolean;
var
  JOReceipt, JOStore, JOReceiptEtc, JOItem: HCkJsonObject;
  SS: TStringStream;
  LIndex, LPayMethod, LTotalAmt, LSaleAmt: Integer;
  LSaleDate, LSaleTime, LDayOfWeek, LTicketingDateTime: string;
begin
  Result := False;
  Global.ReceiptPrintManager.PrintJson := '';
  AResMsg := '';
  LTotalAmt := 0;
  JOReceipt := CkJsonObject_Create;
  JOStore := CkJsonObject_Create;
  JOReceiptEtc := CkJsonObject_Create;
  JOItem := nil;
  SS := TStringStream.Create;
  SetLength(Global.TicketTemplateList, 0);

  try
    LSaleDate := Global.FormattedCurrentDate;
    LSaleTime := Global.FormattedCurrentTime;
    LDayOfWeek := Global.DayOfWeekName;

    //사업장 정보
    CkJsonObject_UpdateString(JOStore, 'StoreName', PWideChar(Global.StoreInfo.StoreName));
    CkJsonObject_UpdateString(JOStore, 'BizNo', PWideChar(Global.StoreInfo.BizNo));
    CkJsonObject_UpdateString(JOStore, 'OwnerName', PWideChar(Global.StoreInfo.Owner));
    CkJsonObject_UpdateString(JOStore, 'TelNo', PWideChar(Global.StoreInfo.TelNo));
    CkJsonObject_UpdateString(JOStore, 'Address', PWideChar(Global.StoreInfo.Address));
    CkJsonObject_UpdateString(JOStore, 'CashierName', PWideChar(Format('P%d / C%d', [Global.StoreInfo.PartnerNo, Global.StoreInfo.CounterNo])));
    CkJsonObject_AppendObject(JOReceipt, 'StoreInfo');
    CkJsonObject_AppendArray(JOReceipt, 'TicketList');
    JOItem := CkJsonObject_ObjectOf(JOReceipt, 'StoreInfo');
    CkJsonObject_Load(JOItem, CkJsonObject__emit(JOStore));

    try
      if AReceiptPrint then
      begin
        //결제 내역
        with TABSQuery.Create(nil) do
        try
          DatabaseName := ABSDB.DatabaseName;
          SQL.Text := Format('SELECT * FROM TBPayment WHERE receipt_no = %s', [QuotedStr(AReceiptNo)]);
          Prepare;
          Open;
          First;
          LIndex := 0;
          while not Eof do
          begin
            LPayMethod := FieldByName('pay_method').AsInteger;
            case LPayMethod of
              CPM_CASH, //현금
              CPM_CASH_RECEIPT: //현금영수증발급
                CkJsonObject_UpdateString(JOReceipt, PWideChar(Format('PaymentList[%d].PaymentType', [LIndex])), 'ptCash');
              CPM_CARD: //신용카드
                CkJsonObject_UpdateString(JOReceipt, PWideChar(Format('PaymentList[%d].PaymentType', [LIndex])), 'ptCreditCard');
              CPM_PAYCO_CARD: //PAYCO신용카드
                CkJsonObject_UpdateString(JOReceipt, PWideChar(Format('PaymentList[%d].PaymentType', [LIndex])), 'ptPaycoCard');
              CPM_PAYCO_POINT: //PAYCO포인트
                CkJsonObject_UpdateString(JOReceipt, PWideChar(Format('PaymentList[%d].PaymentType', [LIndex])), 'ptPaycoPoint');
              CPM_PAYCO_COUPON: //PAYCO쿠폰
                CkJsonObject_UpdateString(JOReceipt, PWideChar(Format('PaymentList[%d].PaymentType', [LIndex])), 'ptPaycoCoupon');
            else
              CkJsonObject_UpdateString(JOReceipt, PWideChar(Format('PaymentList[%d].PaymentType', [LIndex])), 'ptVoid');
            end;

            CkJsonObject_UpdateString(JOReceipt, PWideChar(Format('PaymentList[%d].Approval', [LIndex])), PWideChar(IfThen(FieldByName('approval_yn').AsBoolean, 'true', 'false')));
            CkJsonObject_UpdateString(JOReceipt, PWideChar(Format('PaymentList[%d].Internet', [LIndex])), PWideChar(IfThen(FieldByName('manual_yn').AsBoolean, 'false', 'true')));
            CkJsonObject_UpdateInt(JOReceipt, PWideChar(Format('PaymentList[%d].ApprovalAmt', [LIndex])), FieldByName('approve_amt').AsInteger);
            CkJsonObject_UpdateString(JOReceipt, PWideChar(Format('PaymentList[%d].ApprovalNo', [LIndex])), PWideChar(FieldByName('approve_no').AsString));
            CkJsonObject_UpdateString(JOReceipt, PWideChar(Format('PaymentList[%d].OrgApproveNo', [LIndex])), PWideChar(FieldByName('org_approve_no').AsString));
            CkJsonObject_UpdateString(JOReceipt, PWideChar(Format('PaymentList[%d].CreditCardNo', [LIndex])), PWideChar(FieldByName('credit_card_no').AsString));
            CkJsonObject_UpdateInt(JOReceipt, PWideChar(Format('PaymentList[%d].CashReceiptPerson', [LIndex])), 1);
            CkJsonObject_UpdateInt(JOReceipt, PWideChar(Format('PaymentList[%d].InstMonth', [LIndex])), FieldByName('inst_mon').AsInteger);
            CkJsonObject_UpdateString(JOReceipt, PWideChar(Format('PaymentList[%d].AppCompanyName', [LIndex])), PWideChar(FieldByName('issuer_nm').AsString));
            CkJsonObject_UpdateString(JOReceipt, PWideChar(Format('PaymentList[%d].MerchantKey', [LIndex])), PWideChar(FieldByName('merchant_key').AsString));
            CkJsonObject_UpdateString(JOReceipt, PWideChar(Format('PaymentList[%d].TransDateTime', [LIndex])), PWideChar(FormattedDateString(Copy(FieldByName('trade_dttm').AsString, 1, 8)) + ' ' + FormattedTimeString(Copy(FieldByName('trade_dttm').AsString, 9, 6))));
            CkJsonObject_UpdateString(JOReceipt, PWideChar(Format('PaymentList[%d].BuyCompanyName', [LIndex])), PWideChar(FieldByName('buyer_nm').AsString));
            CkJsonObject_UpdateString(JOReceipt, PWideChar(Format('PaymentList[%d].BuyTypeName', [LIndex])), PWideChar(FieldByName('buyer_cd').AsString));

            Inc(LIndex);
            Next;
          end;

          //주문 상품 내역
          Close;
          SQL.Text := Format('SELECT * FROM TBOrder WHERE receipt_no = %s', [QuotedStr(AReceiptNo)]);
          Prepare;
          Open;
          First;
          LIndex := 0;
          while not Eof do
          begin
            LSaleAmt := FieldByName('sale_amt').AsInteger;
            LTotalAmt := (LTotalAmt + LSaleAmt);
            //nVAT := (nSaleAmt - Trunc((nSaleAmt / 1.1)));
            CkJsonObject_UpdateString(JOReceipt, PWideChar(Format('OrderList[%d].ProductName', [LIndex])), PWideChar(FieldByName('product_nm').AsString));
            CkJsonObject_UpdateString(JOReceipt, PWideChar(Format('OrderList[%d].DenominName', [LIndex])), PWideChar(FieldByName('denomin_nm').AsString));
            CkJsonObject_UpdateString(JOReceipt, PWideChar(Format('OrderList[%d].DenominCategoryName', [LIndex])), PWideChar(FieldByName('denomin_category_nm').AsString));
            CkJsonObject_UpdateInt(JOReceipt, PWideChar(Format('OrderList[%d].UnitPrice', [LIndex])), FieldByName('unit_price').AsInteger);
            CkJsonObject_UpdateInt(JOReceipt, PWideChar(Format('OrderList[%d].SaleQty', [LIndex])), FieldByName('sale_qty').AsInteger);
            CkJsonObject_UpdateInt(JOReceipt, PWideChar(Format('OrderList[%d].SaleAmt', [LIndex])), LSaleAmt);
            CkJsonObject_UpdateInt(JOReceipt, PWideChar(Format('OrderList[%d].VAT', [LIndex])), 0); //비과세

            Inc(LIndex);
            Next;
          end;
        finally
          Close;
          Free;
        end;
      end;

      //티켓 발행 내역 (영수증 프린터로 티켓 출력 시에만 사용)
      if (not Global.TicketPrinter.Active) and
         Global.ReceiptPrinter.Enabled and
         Global.ReceiptPrinter.Active then
      begin
        LTicketingDateTime := (LSaleDate + ' ' + LSaleTime); //발권일시(yyyy-mm-dd hh:nn:ss)
        with MTTicketList do
        try
          DisableControls;
          First;
          LIndex := 0;
          while not Eof do
          begin
            CkJsonObject_UpdateString(JOReceipt, PWideChar(Format('TicketList[%d].PurchaseDateTime', [LIndex])), PWideChar(FieldByName('reserve_datetime').AsString)); //예매일시(yyyy-mm-dd hh:nn:ss)
            CkJsonObject_UpdateString(JOReceipt, PWideChar(Format('TicketList[%d].TicketingDateTime', [LIndex])), PWideChar(LTicketingDateTime)); //발권일시(yyyy-mm-dd hh:nn:ss)
            CkJsonObject_UpdateString(JOReceipt, PWideChar(Format('TicketList[%d].ProductName', [LIndex])), PWideChar(FieldByName('product_name').AsString)); //상품명
            CkJsonObject_UpdateString(JOReceipt, PWideChar(Format('TicketList[%d].ProductSubTitle', [LIndex])), PWideChar(FieldByName('product_sub_name').AsString)); //부제목
            CkJsonObject_UpdateString(JOReceipt, PWideChar(Format('TicketList[%d].ScheduleDateTime', [LIndex])), PWideChar(FieldByName('product_schedule').AsString)); //회차정보
            CkJsonObject_UpdateString(JOReceipt, PWideChar(Format('TicketList[%d].PlaceName', [LIndex])), PWideChar(FieldByName('place_hall_name').AsString)); //장소명
            CkJsonObject_UpdateString(JOReceipt, PWideChar(Format('TicketList[%d].DenominCategoryName', [LIndex])), PWideChar(FieldByName('site_denomination_category').AsString)); //권종구분(일반 등)
            CkJsonObject_UpdateString(JOReceipt, PWideChar(Format('TicketList[%d].DenominName', [LIndex])), PWideChar(FieldByName('product_denomination_name').AsString)); //권종명(성인, 커플, 청소년 등)
            CkJsonObject_UpdateString(JOReceipt, PWideChar(Format('TicketList[%d].MarkPrice', [LIndex])), PWideChar(FieldByName('mark_price').AsString)); //표시가격
            CkJsonObject_UpdateString(JOReceipt, PWideChar(Format('TicketList[%d].ReserveNo', [LIndex])), PWideChar(FieldByName('reserve_no').AsString)); //예매번호(Int64 --> String)
            CkJsonObject_UpdateString(JOReceipt, PWideChar(Format('TicketList[%d].ExternalReserveNo', [LIndex])), PWideChar(FieldByName('external_reserve_no').AsString)); //외부예매번호
            CkJsonObject_UpdateString(JOReceipt, PWideChar(Format('TicketList[%d].ReserveUserName', [LIndex])), PWideChar(FieldByName('reserve_member_name').AsString)); //예매자명
            CkJsonObject_UpdateString(JOReceipt, PWideChar(Format('TicketList[%d].ReserveUserTelNo', [LIndex])), PWideChar(FieldByName('reserve_member_contact').AsString)); //예매자연락처
            CkJsonObject_UpdateString(JOReceipt, PWideChar(Format('TicketList[%d].ReserveDateTime', [LIndex])), PWideChar(FieldByName('reserve_contact').AsString)); //예매일(yyyy-mm-dd)
            CkJsonObject_UpdateString(JOReceipt, PWideChar(Format('TicketList[%d].ReserveChannel', [LIndex])), PWideChar(FieldByName('reserve_channel').AsString)); //예매채널
            CkJsonObject_UpdateString(JOReceipt, PWideChar(Format('TicketList[%d].PaymentMethod', [LIndex])), PWideChar(FieldByName('payment_method').AsString)); //결제수단
            CkJsonObject_UpdateString(JOReceipt, PWideChar(Format('TicketList[%d].IssueNo', [LIndex])), PWideChar(FieldByName('publish_no').AsString)); //발행번호
            CkJsonObject_UpdateString(JOReceipt, PWideChar(Format('TicketList[%d].TicketNo', [LIndex])), PWideChar(FieldByName('barcode').AsString)); //티켓번호
            Inc(LIndex);
            Next;
          end;
        finally
          EnableControls;
        end;
      end;

      (*
      if Global.TicketPrinter.Enabled and
         Global.TicketPrinter.Active then
      begin
        //티켓 프린터로 티켓 출력 시
        with MTTicketTemplate do
        try
          DisableControls;
          First;
          LIndex := 0;
          while not Eof do
          begin
            SetLength(Global.TicketTemplateList, LIndex + 1);
            with TTicketLabelRec(Global.TicketTemplateList[LIndex]) do
            begin
              Command := '';
              LabelType := TLabelType(FieldByName('editable_component_type').AsInteger);
              Value := FieldByName('text_content').AsString;
              FontSize := FieldByName('font_size').AsInteger;
              Bold := FieldByName('bold').AsBoolean;
              PosX := FieldByName('mmx').AsInteger;
              PosY := FieldByName('mmy').AsInteger;
              Align := TLabelAlign(FieldByName('text_align').AsInteger);
              Direction := TLabelDirection(FieldByName('ticket_direction').AsInteger);
              Degree := FieldByName('degree_rotation').AsInteger;
            end;
            Inc(LIndex);
            Next;
          end;
        finally
          EnableControls;
        end;
      end;
      *)

      //영수증 출력 정보
      CkJsonObject_UpdateString(JOReceiptEtc, 'SaleDate', PWideChar(LSaleDate));
      CkJsonObject_UpdateString(JOReceiptEtc, 'SaleTime', PWideChar(LSaleTime));
      CkJsonObject_UpdateString(JOReceiptEtc, 'DayOfWeek', PWideChar(LDayOfWeek));
      CkJsonObject_UpdateInt(JOReceiptEtc, 'TotalAmt', LTotalAmt);
      CkJsonObject_UpdateInt(JOReceiptEtc, 'DiscountAmt', 0);
      CkJsonObject_UpdateString(JOReceiptEtc, 'ReceiptNo', PWideChar(AReceiptNo));
      CkJsonObject_UpdateString(JOReceiptEtc, 'ReserveNo', PWideChar(IntToStr(AReserveNo)));
      CkJsonObject_UpdateString(JOReceiptEtc, 'HomeUrl', PWideChar(CCC_TICKETLINK_HOME));
      CkJsonObject_UpdateBool(JOReceiptEtc, 'TaxFree', False); //비과세
      CkJsonObject_UpdateString(JOReceiptEtc, 'Top1', '');
      CkJsonObject_UpdateString(JOReceiptEtc, 'Top2', '');
      CkJsonObject_UpdateString(JOReceiptEtc, 'Top3', '');
      CkJsonObject_UpdateString(JOReceiptEtc, 'Top4', '');
      CkJsonObject_UpdateString(JOReceiptEtc, 'Bottom1', '');
      CkJsonObject_UpdateString(JOReceiptEtc, 'Bottom2', '');
      CkJsonObject_UpdateString(JOReceiptEtc, 'Bottom3', '');
      CkJsonObject_UpdateString(JOReceiptEtc, 'Bottom4', '');
      CkJsonObject_AppendObject(JOReceipt, 'ReceiptEtcInfo');
      JOItem := CkJsonObject_ObjectOf(JOReceipt, 'ReceiptEtcInfo');
      CkJsonObject_Load(JOItem, CkJsonObject__emit(JOReceiptEtc));

      Result := True;
      Global.ReceiptPrintManager.PrintJson := CkJsonObject__emit(JOReceipt);
      SS.WriteString(Global.ReceiptPrintManager.PrintJson);
      SS.SaveToFile(Global.LogDir + 'GetPrintingScript.json');
    except
      on E: Exception do
      begin
        AResMsg := E.Message;
        AddLog(Format('DM.GetPrintingScript(%s, %d).Exception = %s', [AReceiptNo, AReserveNo, AResMsg]));
      end;
    end;
  finally
    FreeAndNil(SS);
    if Assigned(JOItem) then
      CkJsonObject_Dispose(JOItem);
    CkJsonObject_Dispose(JOReceiptEtc);
    CkJsonObject_Dispose(JOStore);
    CkJsonObject_Dispose(JOReceipt);
  end;
end;

function TTLDataModule.DoCertifyPAYCO(var AResMsg: string): Boolean;
var
  JO: HCkJsonObject;
  LBizNo, LUrl, LReqJSON, LRespJSON: string;
  LResCode: Integer;
begin
  Result := False;
  AResMsg := '';
  JO := CkJsonObject_Create;
  try
    try
      LBizNo := IfThen(Global.StoreInfo.PaycoVanTID = CCC_DEV_PAYCO_TID, CCC_DEV_PAYCO_BIZNO, Global.StoreInfo.BizNo);
      LUrl := Global.StoreInfo.PaycoHost + Global.StoreInfo.PaycoUriReg;
      CkJsonObject_UpdateString(JO, 'posType', PWideChar('POS'));
      CkJsonObject_UpdateString(JO, 'registrationNumber', PWideChar(LBizNo));
      CkJsonObject_UpdateString(JO, 'vanCorpCode', PWideChar(Global.StoreInfo.VanCode));
      CkJsonObject_UpdateString(JO, 'vanPosTid', PWideChar(Global.StoreInfo.PaycoVanTID));
      CkJsonObject_UpdateString(JO, 'posDevCorpName', PWideChar(CCC_PAYCO_POS_DEV_CORP));
      CkJsonObject_UpdateString(JO, 'posSolutionName', PWideChar(CCC_PAYCO_POS_SOLUTION));
      CkJsonObject_UpdateString(JO, 'posSolutionVersion', PWideChar(Global.ProductVersion));
      LReqJSON := CkJsonObject__emit(JO);
      if not RequestToPAYCO(LUrl, 'DoCertifyPAYCO', LReqJSON, LRespJSON, AResMsg) then
        raise Exception.Create(AResMsg);
      if not CkJsonObject_Load(JO, PWideChar(LRespJSON)) then
        raise Exception.Create(CkJsonObject__lastErrorText(JO));

      LResCode := CkJsonObject_IntOf(JO, 'resultCode');
      AResMsg := CkJsonObject__stringOf(JO, 'message');
      if (LResCode <> 0) then
        raise Exception.Create(AResMsg);

      Global.StoreInfo.PaycoPosTID := CkJsonObject__stringOf(JO, 'result.posTid');
      Global.StoreInfo.PaycoAPIKey := CkJsonObject__stringOf(JO, 'result.apiKey');
      Global.StoreInfo.PaycoMerchantKey := CkJsonObject__stringOf(JO, 'result.merchantKey');
      Global.StoreInfo.PaycoMerchantName := CkJsonObject__stringOf(JO, 'result.merchantName');
      AddLog(Format('DoCertifyPAYCO.Result = 응답코드: %d, 메시지: %s, PosTID: %s, VanTID: %s, 사업자번호: %s, 가맹점Key: %s, 가맹점명: %s',
        [LResCode, AResMsg, Global.StoreInfo.PaycoPosTID, Global.StoreInfo.PaycoVanTID, LBizNo, Global.StoreInfo.PaycoMerchantKey, Global.StoreInfo.PaycoMerchantName]));
      Result := True;
    except
      on E: Exception do
      begin
        AResMsg := E.Message;
        AddLog(Format('DoCertifyPAYCO.Exception = %s', [AResMsg]));
      end;
    end;
  finally
    CkJsonObject_Dispose(JO);
  end;
end;

function TTLDataModule.GetSignaturePAYCO(const APinCode: string): string;
var
  LCount: Integer;
  LValue, LHash: string;
  ABytes: TBytes;
begin
  Result := EmptyStr;
  LValue := APinCode.Trim + Global.StoreInfo.PaycoPosTID;
  LHash := THashSHA2.GetHMAC(LValue, Global.StoreInfo.PaycoAPIKey.Trim, THashSHA2.TSHA2Version.SHA256);
  LCount := (LHash.Length div 2);
  SetLength(ABytes, LCount);

  for var I: Integer := 0 to Pred(LCount) do
    ABytes[I] := HexToByte(LHash.Substring(I * 2, 2));

  Result := TBase64Encoding.Base64.EncodeBytesToString(ABytes);
end;

end.
