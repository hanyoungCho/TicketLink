unit TicketPrint.TLTicketPrintForm;

interface

uses
  { Native }
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.NumberBox, System.IniFiles,
  System.Win.Registry,
  { Chilkat DLL API }
  Chilkat.Global, Chilkat.JsonObject, Chilkat.JsonArray, Chilkat.CkDateTime,
  { WinSoft }
  ComPort,
  { Project }
  Common.TLCipher, JSON;

{$I ..\common\Common.TLGlobal.inc}

const
  SLCS_DLL_NAME = 'BXLLAPI.dll';

  // SLCS_HRI
  SLCS_HRI_NOT_PRINT   = 0;
  SLCS_HRI_BELOW_SIZE1 = 1;
  SLCS_HRI_ABOVE_SIZE1 = 2;
  SLCS_HRI_BELOW_SIZE2 = 3;
  SLCS_HRI_ABOVE_SIZE2 = 4;
  SLCS_HRI_BELOW_SIZE3 = 5;
  SLCS_HRI_ABOVE_SIZE3 = 6;
  SLCS_HRI_BELOW_SIZE4 = 7;
  SLCS_HRI_ABOVE_SIZE4 = 8;

  // SLCS_PDF417_ECC_LEVEL
  SLCS_PDF417_ECC_LEVEL0 = 0;
  SLCS_PDF417_ECC_LEVEL1 = 1;
  SLCS_PDF417_ECC_LEVEL2 = 2;
  SLCS_PDF417_ECC_LEVEL3 = 3;
  SLCS_PDF417_ECC_LEVEL4 = 4;
  SLCS_PDF417_ECC_LEVEL5 = 5;
  SLCS_PDF417_ECC_LEVEL6 = 6;
  SLCS_PDF417_ECC_LEVEL7 = 7;
  SLCS_PDF417_ECC_LEVEL8 = 8;

  // SLCS_CIRCLE_SIZE
  SLCS_CIRCLE_SIZE_1 = 1;	// 40 x 40 in dot unit
  SLCS_CIRCLE_SIZE_2 = 2;	// 56 x 56 in dot unit
  SLCS_CIRCLE_SIZE_3 = 3;	// 72 x 72 in dot unit
  SLCS_CIRCLE_SIZE_4 = 4;	// 88 x 88 in dot unit
  SLCS_CIRCLE_SIZE_5 = 5;	// 104 x 104 in dot unit
  SLCS_CIRCLE_SIZE_6 = 6;	// 168 x 168 in dot unit

  // SLCS_PDF417_DATA_TYPE
  SLCS_PDF417_TEXT_TYPE    = 0;
  SLCS_PDF417_NUMERIC_TYPE = 1;
  SLCS_PDF417_BINARY_TYPE  = 2;

  // SLCS_INTERNATIONAL_CHARSET
  SLCS_ICS_USA              = 0;
  SLCS_ICS_FRANCE           = 1;
  SLCS_ICS_GERMANY          = 2;
  SLCS_ICS_UK               = 3;
  SLCS_ICS_DENMARK_I        = 4;
  SLCS_ICS_SWEDEN           = 5;
  SLCS_ICS_ITALY            = 6;
  SLCS_ICS_SPAIN_I          = 7;
  SLCS_ICS_JAPAN            = 8;
  SLCS_ICS_NORWAY           = 9;
  SLCS_ICS_DENMARK_II       = 10;
  SLCS_ICS_SPAIN_II         = 11;
  SLCS_ICS_LATIN_AMERICA    = 12;
  SLCS_ICS_KOREA            = 13;
  SLCS_ICS_SLOVENIA_CROATIA = 14;
  SLCS_ICS_CHINA            = 15;

  // SLCS_CODEPAGE
  SLCS_FCP_CP437  = 0;
  SLCS_FCP_CP850  = 1;  // OEM Multilingual Latin 1; Western European (DOS)
  SLCS_FCP_CP852  = 2;  // OEM Latin 2; Central European (DOS)
  SLCS_FCP_CP860  = 3;  // OEM Portuguese; Portuguese (DOS)
  SLCS_FCP_CP863  = 4;  // OEM French Canadian; French Canadian (DOS)
  SLCS_FCP_CP865  = 5;  // OEM Nordic; Nordic (DOS)
  SLCS_FCP_CP1252 = 6; // ANSI Latin 1; Western European (Windows)
  SLCS_FCP_CP857  = 8;  // OEM Turkish; Turkish (DOS)
  SLCS_FCP_CP737  = 9;  // OEM Greek (formerly 437G); Greek (DOS)
  SLCS_FCP_CP1250 = 10; // ANSI Central European; Central European (Windows)// MPOS_CODEPAGE_CP1250 ??
  SLCS_FCP_CP1253 = 11; // ANSI Greek; Greek (Windows)
  SLCS_FCP_CP1254 = 12; // ANSI Turkish; Turkish (Windows)
  SLCS_FCP_CP855  = 13; // OEM Cyrillic (primarily Russian)
  SLCS_FCP_CP862  = 14; // OEM Hebrew; Hebrew (DOS)
  SLCS_FCP_CP866  = 15; // OEM Russian; Cyrillic (DOS)
  SLCS_FCP_CP1251 = 16; // ANSI Cyrillic; Cyrillic (Windows)
  SLCS_FCP_CP1255 = 17; // ANSI Hebrew; Hebrew (Windows)
  SLCS_FCP_CP928  = 18; // Greek
  SLCS_FCP_CP775  = 20; // OEM Baltic; Baltic (DOS)
  SLCS_FCP_CP1257 = 21; // ANSI Baltic; Baltic (Windows)
  SLCS_FCP_CP858  = 22; //  OEM Multilingual Latin 1 + Euro symbol

  // SLCS_DITHER_OPTION
  SLCS_DITHER_NONE = -1;
  SLCS_DITHER_1    = 0;
  SLCS_DITHER_2    = 1;
  SLCS_DITHER_3    = 6;
  SLCS_DITHER_4    = 7;

  // SLCS_DATAMATRIX_SIZE
  SLCS_DATAMATRIX_SIZE_1 = 1;
  SLCS_DATAMATRIX_SIZE_2 = 2;
  SLCS_DATAMATRIX_SIZE_3 = 3;
  SLCS_DATAMATRIX_SIZE_4 = 4;

  // SLCS_QRCODE_MODEL
  SLCS_QRMODEL_1 = 1;
  SLCS_QRMODEL_2 = 2;

  // SLCS_QRCODE_SIZE
  SLCS_QRSIZE_1 = 1;
  SLCS_QRSIZE_2 = 2;
  SLCS_QRSIZE_3 = 3;
  SLCS_QRSIZE_4 = 4;
  SLCS_QRSIZE_5 = 5;
  SLCS_QRSIZE_6 = 6;
  SLCS_QRSIZE_7 = 7;
  SLCS_QRSIZE_8 = 8;
  SLCS_QRSIZE_9 = 9;

  // SLCS_QRCODE_ECC_LEVEL
  SLCS_QRECCLEVEL_L = 1;	// 7%
  SLCS_QRECCLEVEL_M = 2;	// 15%
  SLCS_QRECCLEVEL_Q = 3;	// 25%
  SLCS_QRECCLEVEL_H = 4;	// 30%

  // SLCS_SLCS_DEVICE_FONT
  SLCS_ENG_9X15     = 0;
  SLCS_ENG_12X20    = 1;
  SLCS_ENG_16X25    = 2;
  SLCS_ENG_19X30    = 3;
  SLCS_ENG_24X38    = 4;
  SLCS_ENG_32X50    = 5;
  SLCS_ENG_48X76    = 6;
  SLCS_ENG_22X34    = 7;
  SLCS_ENG_28X44    = 8;
  SLCS_ENG_37X58    = 9;
  SLCS_KOR_16X16    = $61;
  SLCS_KOR_24X24    = $62;
  SLCS_KOR_20X20    = $63;
  SLCS_KOR_20X26    = $65;
  SLCS_KOR_38X38    = $66;
  SLCS_JPN_ShiftJIS = $6A;
  SLCS_CHN_GB2312   = $6D;
  SLCS_CHN_BIG5     = $6E;

  // SLCS_BARCODE
  SLCS_CODE39     = 0;
  SLCS_CODE128    = 1;
  SLCS_I2OF5      = 2;
  SLCS_CODABAR    = 3;
  SLCS_CODE93     = 4;
  SLCS_UPC_A      = 5;
  SLCS_UPC_E      = 6;
  SLCS_EAN13      = 7;
  SLCS_EAN8       = 8;
  SLCS_UCC_EAN128 = 9;


  // SLCS_ORIENTATION
  SLCS_TOP2BOTTOM = 0;
  SLCS_BOTTOM2TOP = 1;

  // SLCS_MEDIA_TYPE
  SLCS_GAP        = 0;
  SLCS_CONTINUOUS = 1;
  SLCS_BLACKMARK  = 2;

  // SLCS_PRINT_SPEED
  SLCS_PRINTER_SETTING_SPEED = -1;
  SLCS_PRINTER_SPEED_0       = 0;
  SLCS_PRINTER_SPEED_1       = 1;
  SLCS_PRINTER_SPEED_2       = 2;
  SLCS_PRINTER_SPEED_3       = 3;
  SLCS_PRINTER_SPEED_4       = 4;
  SLCS_PRINTER_SPEED_5       = 5;
  SLCS_PRINTER_SPEED_6       = 6;
  SLCS_PRINTER_SPEED_7       = 7;
  SLCS_PRINTER_SPEED_8       = 8;
  SLCS_PRINTER_SPEED_9       = 9;
  SLCS_PRINTER_SPEED_10      = 10;
  SLCS_PRINTER_SPEED_11      = 11;
  SLCS_PRINTER_SPEED_12      = 12;

  // SLCS_ROTATION
  SLCS_ROTATE_0   = 0;
  SLCS_ROTATE_90  = 1;
  SLCS_ROTATE_180 = 2;
  SLCS_ROTATE_270 = 3;

  // SLCS_BLOCK_OPTION
  SLCS_LINE_OVER_WRITING = 0;
  SLCS_LINE_EXCLUSIVE_OR = 1;
  SLCS_LINE_DELETE       = 2;
  SLCS_SLOPE             = 3;
  SLCS_BOX               = 4;

  // SLCS_ALIGNMENT
  SLCS_ALIGN_LEFT      = 0;
  SLCS_ALIGN_CENTER    = 1;
  SLCS_ALIGN_RIGHT     = 2;
  SLCS_ALIGN_BOTH_SIDE = 3;

  // SLCS_FONT_ALIGNMENT
  SLCS_LEFTALIGN   = 'L';
  SLCS_RIGHTALIGN  = 'R';
  SLCS_CENTERALIGN = 'C';

  // SLCS_FONT_DIRECTION
  SLCS_LEFTTORIGHT = 0;
  SLCS_RIGHTTOLEFT = 1;

  // SLCS_VECTOR_FONT
  SLCS_ASCII    = 'U';
  SLCS_KS5601   = 'K';
  SLCS_BIG5     = 'B';
  SLCS_GB2312   = 'G';
  SLCS_ShiftJIS = 'J';

  // SLCS_RFID_TRANSPONDER_TYPE
  SLCS_RFID_NONE                   = 0;
  SLCS_RFID_ISO18000_6TYPEA        = 1;
  SLCS_RFID_ISO18000_6TYPEB        = 2;
  SLCS_RFID_EPC_CLASS0             = 3;
  SLCS_RFID_EPC_CLASS1             = 4;
  SLCS_RFID_EPC_CLASS1_GENERATION2 = 5;

  // SLCS_RFID_DATA_TYPE
  SLCS_RFID_ASCII       = 1;
  SLCS_RFID_HEXADECIMAL = 2;
  SLCS_RFID_USER        = 3;
  SLCS_RFID_EPC         = 4;

  // SLCS_ERROR_CODE
  SLCS_ERR_CODE_NO_ERROR         = 0;	// Success
  SLCS_ERR_CODE_NO_PAPER         = 1;	// Paper Empty
  SLCS_ERR_CODE_COVER_OPEN       = 2;	// Cover Open
  SLCS_ERR_CODE_CUTTER_JAM       = 3;	// Cutter jammed
  SLCS_ERR_CODE_TPH_OVER_HEAT    = 4;	// Thermal Head(TPH) overheat
  SLCS_ERR_CODE_AUTO_SENSING     = 5;	// Gap detection Error (Auto-sensing failure)
  SLCS_ERR_CODE_NO_RIBBON        = 6;	// Ribbon End
  SLCS_ERR_CODE_POWER_OFF        = 7;
  SLCS_ERR_CODE_CUTTER_UNCABLED  = 8;
  SLCS_ERR_CODE_NOW_PRINTING     = 9;
  SLCS_ERR_CODE_LABEL_PAUSED     = 10;	// Label paused in peeler unit
  SLCS_ERR_CODE_BOARD_OVER_HEAT  = 11;
  SLCS_ERR_CODE_MOTOR_OVER_HEAT  = 12;
  SLCS_ERR_CODE_WAIT_LABEL_TAKEN = 13;
  SLCS_ERR_CODE_MAKE_LABEL       = 14;
  SLCS_ERR_CODE_WAIT_PEELER      = 15;
  SLCS_ERR_CODE_STANDBY_OR_RFID  = 16;
  SLCS_ERR_CODE_INVALID_PARAM    = 60;
  SLCS_ERR_CODE_CONNECT          = 71;   // Port open error
  SLCS_ERR_CODE_GETNAME          = 72;   // Unknown (or Not supported) printer name
  SLCS_ERR_CODE_OFFLINE          = 73;
  SLCS_ERR_CODE_WRITE            = 74;
  SLCS_ERR_CODE_READ             = 75;
  SLCS_ERR_CODE_UNKNOWN          = 99;	// Unknown error


type
  TLabelAlign = (laLeft, laRight);
  TLabelDirection = (ldHorizontal, ldVertical);
  TLabelType = (ltText, ltBackground, ltBarcode, ltQRCode);
  TLabelOrientation = (loTopToBottom, loBottomToTop);

  TTicketLabelRec = record
    mmwidth: Single;
    mmheight: Single;
    mmx: Single;
    mmy: Single;
    font_size: Integer;
    rotate_code: Integer;
    bold: Boolean;
    editable_component_type: String; //표시될 값의 데이터형식
    text_content: String;
    ticket_size_type: String; //티켓 사이즈
    //ticketNo": false,
    editable_component_type_barcode: Boolean;
    editable_component_type_qrcode: Boolean;
  end;

  { 메인 폼 }
  TTLSettingForm = class(TForm)
    panHeader: TPanel;
    panBody: TPanel;
    mmoLog: TMemo;
    gbxLauncher: TGroupBox;
    Label1: TLabel;
    edPort: TEdit;
    Label2: TLabel;
    edBaudRate: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
    FComPort: TComPort;
    rTicketLabelRec: Array of TTicketLabelRec;
    function DoPrintTicketLabel: Boolean;
  public
    { Public declarations }
  end;

var
  TLSettingForm: TTLSettingForm;

function GetBaudrate(const ABaudrate: Integer): TBaudRate;


function ConnectPrinterEx(const AInterface: Integer; APortName: PAnsiChar; const ABaudRate, ADataBits, AParity, AStopBits: Integer): Integer; stdcall; external SLCS_DLL_NAME;
function ConnectPrinterExW(const AInterface: Integer; APortName: PChar; const ABaudRate, ADataBits, AParity, AStopBits: Integer): Boolean; stdcall; external SLCS_DLL_NAME;
function ConnectPrinter(const AInterface: Integer; APortName: PAnsiChar; const ABaudRate, ADataBits, AParity, AStopBits: Integer): Boolean; stdcall; external SLCS_DLL_NAME;
function ConnectPrinterW(const AInterface: Integer; APortName: PChar; const ABaudRate, ADataBits, AParity, AStopBits: Integer): Boolean; stdcall; external SLCS_DLL_NAME;
function ConnectSerial(APortName: PAnsiChar; const ABaudRate, ADataBits, AParity, AStopBits: Integer): Boolean; stdcall; external SLCS_DLL_NAME;
function ConnectSerialW(APortName: PChar; const ABaudRate, ADataBits, AParity, AStopBits: Integer): Boolean; stdcall; external SLCS_DLL_NAME;
function ConnectUsb: Boolean; stdcall; external SLCS_DLL_NAME;
function ConnectParallel(APortName: PAnsiChar): Boolean; stdcall; external SLCS_DLL_NAME;
function ConnectParallelW(APortName: PChar): Boolean; stdcall; external SLCS_DLL_NAME;
function ConnectNet(AIpAddr: PAnsiChar; const APortNum: Integer): Boolean; stdcall; external SLCS_DLL_NAME;
function ConnectNetW(AIpAddr: PChar; const APortNum: Integer): Boolean; stdcall; external SLCS_DLL_NAME;
function DisconnectPrinter: Boolean; stdcall; external SLCS_DLL_NAME;
function GetPrinterDPI: Integer; stdcall; external SLCS_DLL_NAME;
function GetDllVersion(ADllVersion: TStringBuilder): Boolean; stdcall; external SLCS_DLL_NAME;
function SetConfigOfPrinter(const ASpeed, ADensity, AOrientation: Integer; AAutoCut: Boolean; const ACuttingPeriod: Integer; const ABackFeeding: Boolean): Boolean; stdcall; external SLCS_DLL_NAME;
function Prints(const ALabelSet, ACopiesOfEachLabel: Integer): Boolean; stdcall; external SLCS_DLL_NAME;
function SetCharacterset(const AInternationalCharacterSet, ACodepage: Integer): Boolean; stdcall; external SLCS_DLL_NAME;
function SetPaper(const AHorizontalMagin, AVerticalMargin, APaperWidth, APaperLength, AMediaType, AOffSet, AnGapLengthORThicknessOfBlackLine: Integer): Boolean; stdcall; external SLCS_DLL_NAME;
function SetShowMsgBox(const AShow: Boolean): Boolean; stdcall; external SLCS_DLL_NAME;
function CheckStatus: Integer; stdcall; external SLCS_DLL_NAME;

function ClearBuffer: Boolean; stdcall; external SLCS_DLL_NAME;
function WriteBuff(ABuffer: TBytes; const AdwNumberOfBytesToWrite: Integer; var AdwWritten: Integer): Boolean; stdcall; external SLCS_DLL_NAME;
function ReadBuff(ABuffer: TBytes; const AdwNumberOfBytesToRead: Integer; var AdwReaded: Integer): Boolean; stdcall; external SLCS_DLL_NAME;

function Print1DBarcode(const AHorizontalPos, AVerticalPos, ABarcodeType, ANarrowBarWidth, AWideBarWidth, ABarcodeHeight, ARotation, AHRI: Integer; AData: PAnsiChar): Boolean; overload; stdcall; external SLCS_DLL_NAME;
function Print1DBarcode(const AHorizontalPos, AVerticalPos, ABarcodeType, ANarrowBarWidth, AWideBarWidth, ABarcodeHeight, ARotation, AHRI: Integer; AData: TBytes): Boolean; overload; stdcall; external SLCS_DLL_NAME;
function PrintDeviceFont(const AHorizontalPos, AVerticalPos, AFontName, AHorizontalMulti, AVerticalMulti, ARotation: Integer; const ABold: Boolean; AText: PAnsiChar): Boolean; stdcall; external SLCS_DLL_NAME;
function PrintDeviceFontW(const AHorizontalPos, AVerticalPos, AFontName, AHorizontalMulti, AVerticalMulti, ARotation: Integer; const ABold: Boolean; AText: PChar): Boolean; stdcall; external SLCS_DLL_NAME;

function PrintBlock(const AHorizontalStartPos, AVerticalStartPos, AHorizontalEndPos, AVerticalEndPos, AOption, AThickness: Integer): Boolean; stdcall; external SLCS_DLL_NAME;
function PrintCircle(const AHorizontalStartPos, AVerticalStartPos, ADiameter, AMulti: Integer): Boolean; stdcall; external SLCS_DLL_NAME;
function PrintDirect(ADirectData: PAnsiChar; const AAddCrLf: Boolean): Boolean; stdcall; external SLCS_DLL_NAME;
function PrintTrueFont(const AXPos, AYPos: Integer; AStrFontName: PAnsiChar; const AFontSize, ARotaion: Integer; const AItalic, ABold, AUnderline: Boolean; AStrText: PAnsiChar; const ADataCompression: Boolean): Boolean; stdcall; external SLCS_DLL_NAME;
function PrintTrueFontW(const AXPos, AYPos: Integer; AStrFontName: PChar; const AFontSize, ARotaion: Integer; const AItalic, ABold, AUnderline: Boolean; AStrText: PChar; const ADataCompression: Boolean): Boolean; stdcall; external SLCS_DLL_NAME;
function PrintTrueFontLib(const AXPos, AYPos: Integer; AStrFontName: PAnsiChar; const AFontSize, ARotaion: Integer; const AItalic, ABold, AUnderline: Boolean; AStrText: PAnsiChar; const ADataCompression: Boolean): Boolean; stdcall; external SLCS_DLL_NAME;
function PrintTrueFontLibW(const AXPos, AYPos: Integer; AStrFontName: PChar; const AFontSize, ARotaion: Integer; const AItalic, ABold, AUnderline: Boolean; AStrText: PChar; const ADataCompression: Boolean): Boolean; stdcall; external SLCS_DLL_NAME;
function PrintTrueFontLibWithAlign(const AXPos, AYPos: Integer; AStrFontName: PAnsiChar; const AFontSize, ARotaion: Integer; const AItalic, ABold, AUnderline: Boolean; AStrText: PAnsiChar; const AReserved{not used}, AAlignment: Integer; const ADataCompression: Boolean): Boolean; stdcall; external SLCS_DLL_NAME;
function PrintTrueFontLibWithAlignW(const AXPos, AYPos: Integer; AStrFontName: PChar; const AFontSize, ARotaion: Integer; const AItalic, ABold, AUnderline: Boolean; AStrText: PChar; const AReserved{not used}, AAlignment: Integer; const ADataCompression: Boolean): Boolean; stdcall; external SLCS_DLL_NAME;
function PrintVectorFont(const AXPos,AYPos: Integer; AFontSelection: PAnsiChar; const AFontWidth, AFontHeight: Integer; ARightSideCharSpacing: PAnsiChar; const ABold, AReversePrinting, ATextStyle: Boolean; const ARotation: Integer; ATextAlignment: PAnsiChar; const ATextDirection: Integer; AData: PAnsiChar): Boolean; stdcall; external SLCS_DLL_NAME;
function PrintVectorFontW(const AXPos,AYPos: Integer; AFontSelection: PChar; const AFontWidth, AFontHeight: Integer; ARightSideCharSpacing: PChar; const ABold, AReversePrinting, ATextStyle: Boolean; const ARotation: Integer; ATextAlignment: PChar; const ATextDirection: Integer; AData: PChar): Boolean; stdcall; external SLCS_DLL_NAME;

function PrintQRCode(const AXPos, AYPos, AModel, AECCLevel, ASize, ARotation: Integer; AData: PAnsiChar): Boolean; overload; stdcall; external SLCS_DLL_NAME;
function PrintQRCode(const AXPos, AYPos, AModel, AECCLevel, ASize, ARotation: Integer; AData: TBytes): Boolean; overload; stdcall; external SLCS_DLL_NAME;
function PrintPDF417(const AXPos, AYPos, AMaxRow, AMaxCol, AECLevel, ADataType: Integer; const AHRI: Boolean; const AOriginPoint,AModuleWidth, ABarHeight, ARotation: Integer; AData: PAnsiChar): Boolean; stdcall; external SLCS_DLL_NAME;
function PrintMaxiCode(const AXPos, AYPos, AMode: Integer; AData: PAnsiChar): Boolean; stdcall; external SLCS_DLL_NAME;
function PrintDataMatrix(const AXPos, AYPos, ASize: Integer; const AReverse: Boolean; const ARotation: Integer; AData: PAnsiChar): Boolean; stdcall; external SLCS_DLL_NAME;
function PrintAztec(const AHorizontalPos, AVerticalPos, ABarcodeSize, AExtendedChannel, AEccSymbol, AMenuSymbol, ANumberOfSymbols, AOptionalID, ARotation: Integer; AData: PAnsiChar): Boolean; stdcall; external SLCS_DLL_NAME;
function PrintCode49(const AHorizontalPos, AVerticalPos, ANarrowBarWidth, AWideBarWidth, ABarHeight, AHRI, AStarting, ARotation: Integer; AData: PAnsiChar): Boolean; stdcall; external SLCS_DLL_NAME;
function PrintCODABLOCK(const AHorizontalPos, AVerticalPos, ANarrowBarWidth, AWideBarWidth, ABarHeight, ASecurity, ADataColumns: Integer; AMode: PAnsiChar; const ARowsEncode, ARotation: Integer; AData: PAnsiChar): Boolean; stdcall; external SLCS_DLL_NAME;
function PrintMicroPDF(const AHorizontalPos, AVerticalPos, AModuleWidth, ABarHeight, AMode, ARotation: Integer; AData: PAnsiChar): Boolean; stdcall; external SLCS_DLL_NAME;
function PrintIMB(const AHorizontalPos, AVerticalPos, ARotation, AHRI: Integer; AData: PAnsiChar): Boolean; stdcall; external SLCS_DLL_NAME;
function PrintMSIBarcode(const AHorizontalPos, AVerticalPos, ANarrowBarWidth, AWideBarWidth, ABarHeight, ACheckdigit, ACheckdigitHRI, ARotation, AHRI: Integer; AData: PAnsiChar): Boolean; stdcall; external SLCS_DLL_NAME;
function PrintPlesseyBarcode(const AHorizontalPos, AVerticalPos, ANarrowBarWidth, AWideBarWidth, ABarHeight, ACheckdigitHRI, ARotation, AHRI: Integer; AData: PAnsiChar): Boolean; stdcall; external SLCS_DLL_NAME;
function PrintTLC39Barcode(const AHorizontalPos, AVerticalPos, ANarrowBarWidth, AWideBarWidth, ABarHeight, APDF417Height, APDF417narrowbarWidth, ARotation: Integer; AData: PAnsiChar): Boolean; stdcall; external SLCS_DLL_NAME;
function PrintRSSBarcode(const AHorizontalPos, AVerticalPos, ARssType, AMagnification, ASeparatorHeight, ABarcodeHeight, ASegmentWidth, ARotation: Integer; AData: PAnsiChar): Boolean; stdcall; external SLCS_DLL_NAME;

function PrintImageLib(const AHorizontalStartPos, AVerticalStartPos: Integer; ABitmapFilename: PAnsiChar; const ADither: Integer; const ADataCompression: Boolean): Boolean; stdcall; external SLCS_DLL_NAME;
function PrintImageLibW(const AHorizontalStartPos, AVerticalStartPos: Integer; ABitmapFilename: PChar; const ADither: Integer; const ADataCompression: Boolean): Boolean; stdcall; external SLCS_DLL_NAME;
function PrintImageLZMA(const AHorizontalStartPos, AVerticalStartPos: Integer; ABitmapFilename: PAnsiChar; const ADither: Integer): Boolean; stdcall; external SLCS_DLL_NAME;
function PrintImageLZMAW(const AHorizontalStartPos, AVerticalStartPos: Integer; ABitmapFilename: PChar; const ADither: Integer): Boolean; stdcall; external SLCS_DLL_NAME;


implementation

uses
  { Native }
  System.StrUtils,
  { Project }
  Common.TLCommonLib;

{$R *.dfm}

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


procedure TTLSettingForm.FormCreate(Sender: TObject);
begin
  FComPort := TComPort.Create(nil);
end;

procedure TTLSettingForm.FormDestroy(Sender: TObject);
begin
  FComPort.Free;
end;

procedure TTLSettingForm.Button1Click(Sender: TObject);
var
  nPort, nBaudRate: Integer;
begin
  nPort := StrToInt(edPort.Text);
  nBaudRate := StrToInt(edBaudRate.Text);
  //FComPort.OnRxChar := ComPortRxChar;

  if (nPort >= 10) then
    FComPort.DeviceName := '\\.\COM' + IntToStr(nPort)
  else
    FComPort.DeviceName := 'COM' + IntToStr(nPort);

  FComPort.BaudRate := GetBaudRate(nBaudRate);
  FComPort.Parity := TParity.paNone;
  FComPort.DataBits := TDataBits.db8;
  FComPort.StopBits := TStopBits.sb1;
  FComPort.Open;
end;

procedure TTLSettingForm.Button2Click(Sender: TObject);
begin
  FComPort.Close;
end;

procedure TTLSettingForm.Button4Click(Sender: TObject);
var
  sList: Tstringlist;
  FHomeDir: String;
begin
  sList := Tstringlist.Create;

  FHomeDir := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
  sList.LoadFromFile(FHomeDir +'\GetTicketTemplateList.Response.json', TEncoding.UTF8);
  //sList.LoadFromFile('D:\Works\TicketLink\build\test.txt', TEncoding.UTF8);
  //sList.LoadFromFile('D:\Works\TicketLink\build\test_세로.txt', TEncoding.UTF8);
  //sList.LoadFromFile('D:\Works\TicketLink\build\가로_180.txt', TEncoding.UTF8);
  //sList.LoadFromFile('D:\Works\TicketLink\build\세로_180.txt', TEncoding.UTF8);
  mmoLog.Text := sList.Text;
  slist.Free;
end;

procedure TTLSettingForm.Button3Click(Sender: TObject);
var
  JO, JODataItem, JOItem: HCkJsonObject;
  JOData, JAList: HCkJsonArray;
  LUrl, LReqJSON, LRespJSON, LExternalReserveNo, LReserveDateTime, LPaymentMethod, LTicketLinkReserveNo, LTicketNo, LBarcodeNo: string;
  LReserveNo: Int64;
  I, LResCode, LTempCount, LPrintCount: Integer;
  //rTicketLabelRec: TTicketLabelRec;
  AResMsg: String;

  jObj, jItemObj: TJSONObject;
  sList: Tstringlist;
begin

  JO := CkJsonObject_Create;
  JOData := nil;
  JAList := nil;
  JOItem := nil;
  try
    try

      begin
        LRespJson := '';
        LRespJson := StringReplace(mmoLog.Text, ''#$D#$A'', '', [rfReplaceAll]);
        //LRespJson := mmoLog.Text;

        if not CkJsonObject_Load(JO, PWideChar(LRespJSON)) then
          raise Exception.Create(CkJsonObject__lastErrorText(JO));

        LResCode := CkJsonObject_IntOf(JO, 'result.code');
        if (LResCode <> 0) then
          raise Exception.Create('LResCode : ' + IntToStr(LResCode));

        JOData := CkJsonObject_ArrayOf(JO, 'data');
        JODataItem := CkJsonArray_ObjectAt(JOData, 0);

        LReserveNo := StrToInt64Def(CkJsonObject__stringOf(JODataItem, 'reserveNo'), 0);
        LPrintCount := CkJsonObject_IntOf(JODataItem, 'printCount');
        LTicketLinkReserveNo := CkJsonObject__stringOf(JODataItem, 'ticketlinkReserveNo');
        LTicketNo := CkJsonObject__stringOf(JODataItem, 'ticketNo');
        LBarcodeNo := CkJsonObject__stringOf(JODataItem, 'barcodeInfo');
        JAList := CkJsonObject_ArrayOf(JODataItem, 'ticketTemplateObjectList');
        LTempCount := CkJsonArray_getSize(JAList);

        setlength(rTicketLabelRec, ltempcount);

        for I := 0 to Pred(LTempCount) do
        begin
          JOItem := CkJsonArray_ObjectAt(JAList, I);
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

          rTicketLabelRec[I].mmwidth := StrToFloatDef(StrPas(CkJsonObject__stringOf(JOItem, 'mmwidth')), 0);
          rTicketLabelRec[I].mmheight := StrToFloatDef(StrPas(CkJsonObject__stringOf(JOItem, 'mmheight')), 0);
          rTicketLabelRec[I].mmx := StrToFloatDef(StrPas(CkJsonObject__stringOf(JOItem, 'mmx')), 0);
          rTicketLabelRec[I].mmy := StrToFloatDef(StrPas(CkJsonObject__stringOf(JOItem, 'mmy')), 0);
          rTicketLabelRec[I].font_size := CkJsonObject_IntOf(JOItem, 'fontSize');
          rTicketLabelRec[I].rotate_code := CkJsonObject_IntOf(JOItem, 'rotateCode');
          rTicketLabelRec[I].bold := CkJsonObject_BoolOf(JOItem, 'bold');
          rTicketLabelRec[I].editable_component_type := StrPas(CkJsonObject__stringOf(JOItem, 'editableComponentType'));
          rTicketLabelRec[I].text_content := StrPas(CkJsonObject__stringOf(JOItem, 'textContent'));
          rTicketLabelRec[I].ticket_size_type := StrPas(CkJsonObject__stringOf(JOItem, 'ticketSizeType'));
          rTicketLabelRec[I].editable_component_type_barcode := CkJsonObject_BoolOf(JOItem, 'editableComponentTypeBarcode');
          rTicketLabelRec[I].editable_component_type_qrcode := CkJsonObject_BoolOf(JOItem, 'editableComponentTypeQrcode');

          //DoPrintTicketLabel(rTicketLabelRec, AResMsg);
        end;
      end;

      AResMsg := CkJsonObject__stringOf(JO, 'result.message');

    except
      on E: Exception do
      begin
        AResMsg := E.Message;
        //AddLog(Format('DM.GetTicketList(%d).Exception = %s', [AReserveNo, E.Message]));
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


procedure TTLSettingForm.Button5Click(Sender: TObject);
var
  nStatus: Integer;
begin
  nStatus := ConnectPrinterEx(2, '', 1024, 1025, 0, 0);
  //nStatus := ConnectPrinterEx(0, 'COM7', 115200, 8, 0, 1);

  memo1.Lines.Add('ConnectPrinterEx: ' + inttostr(nStatus));
  if nStatus <> SLCS_ERR_CODE_NO_ERROR then
    Exit;
  nStatus := CheckStatus;

  memo1.Lines.Add('CheckStatus: ' + inttostr(nStatus));
  if nStatus <> SLCS_ERR_CODE_NO_ERROR then
    Exit;

  DoPrintTicketLabel;
end;

function TTLSettingForm.DoPrintTicketLabel: Boolean;
var
  LSpeed, LDensity, LOrientation, LResolution, LDotsPer1mm: Integer;
  LPosX, LPosY, LFontSize, LRotation, LCuttingPeriod, LBarcodeSize, LQRCodeSize: Integer;
  LTextValue: string;
  LAutoCut, LBackFeeding, LIsBold: Boolean;
  nStatus, i: Integer;
  bConnect: Boolean;

  nWidth, nHeight, nPrinterY, nStartY: Integer;
  nPaperWidth, nPaperHeight: Integer;
  nFlipX, nFlipY, nTempX, nTempY: Integer;

  sas, sAnsiStr: AnsiString;
  qrSize: integer;
begin
  Result := False;

  if Length(rTicketLabelRec) < 1 then
    Exit;
  (*
  /**
   * 프린터 통신 인터페이스
   * @readonly
   * @enum {number}
   */
  export const N_INTERFACE_TYPE = {
    /** 직렬(COM) 프린터 */
    INF_SERIAL: 0,
    /** 병렬(LPT) 프린터 */
    INF_PARALLEL: 1,
    /** USB 프린터 */
    INF_USB: 2,
    /** 이더넷(Ethernet) 프린터 */
    INF_ETHERNET: 3,
    /** 직렬(COM) 프린터 */
    INF_WIFI: 4,
    /** 직렬(COM) 프린터 */
    INF_BLUETOOTH: 5,
  } as const
  *)

  // SERIAL (COM)
  //nStatus := ConnectPrinterEx(0, 'COM4', 115200, 8, 0, 1);
  nStatus := ConnectPrinterEx(2, '', 1024, 1025, 0, 0);
  if nStatus <> SLCS_ERR_CODE_NO_ERROR then
    Exit;

  //1.프린터 설정
  //LResolution := GetPrinterDPI; //pc와 연결된 프린터의 해상도 값을 가져옴.
  //LDotsPer1mm := Round(LResolution / 25.4); //_MM2D = 8;
  LDotsPer1mm := 8;
  nPrinterY := 800;

  if rTicketLabelRec[0].ticket_size_type = 'ticketSize_150' then
  begin
		nWidth := 149 * LDotsPer1mm;
		nHeight := 60 * LDotsPer1mm;

    nPaperWidth := Trunc(101.6 * LDotsPer1mm);
    nPaperHeight := Trunc(149 * LDotsPer1mm);
  end
  else
  begin
    nWidth := 187 * LDotsPer1mm;
    nHeight := 75 * LDotsPer1mm;

    nPaperWidth := Trunc(101.6 * LDotsPer1mm);
    nPaperHeight := Trunc(187.5 * LDotsPer1mm);
  end;

  nStartY := Trunc((nPrinterY - nHeight) / 2);
  { 참고
  Math.floor 는 소수값이 존재할 때 소수값을 버리는 역활을 하는 함수이며,  -> trunc
  Math.round 는 소수값에 따라 올리거나 버리는 역활을 하는 반올림 함수입니다.  -> round
  }

  try
    ClearBuffer;

    for I := 1 to Length(rTicketLabelRec) -1 do
    begin
      memo1.Lines.Add(
                      'mmx: ' + floattostr(rTicketLabelRec[I].mmx) + ' / ' +
                      'mmy: ' + floattostr(rTicketLabelRec[I].mmy) + ' / ' +
                      'font_size: ' + inttostr(rTicketLabelRec[I].font_size) + ' / ' +
                      'rotate_code: ' + inttostr(rTicketLabelRec[I].rotate_code) + ' / ' +
                      'text_content: ' + rTicketLabelRec[I].text_content
                      );

      if rTicketLabelRec[I].text_content = 'null' then
        Continue;

      LFontSize := 0;
      case rTicketLabelRec[I].font_size of
        1: LFontSize := 8;
  			2: LFontSize := 12;
  			3: LFontSize := 16;
  			4: LFontSize := 18;
  			5: LFontSize := 22;
  			6: LFontSize := 28;
  			7: LFontSize := 36;
  			8: LFontSize := 40;
  			9: LFontSize := 48;
        else
          LFontSize := 16;
      end;

      LRotation := rTicketLabelRec[I].rotate_code;
      case LRotation of
        0: LOrientation := 1; // [0도] 정방향
        1: LOrientation := 0; // [90도] 세로 우
        2: LOrientation := 0; // [180도]
        3: LOrientation := 1; // [270도] 세로 왼
        else
          LOrientation := 1;
      end;

      if LOrientation = 1 then
      begin
        LRotation := (LRotation + 1) mod 4;
      end
      else
      begin
        if 0 < LRotation then
          LRotation := LRotation - 1
        else
          LRotation := 3;
      end;

      LPosX := Trunc(nWidth - rTicketLabelRec[I].mmx * LDotsPer1mm);
      LPosY := Trunc(nStartY + rTicketLabelRec[I].mmy * LDotsPer1mm);

      if LOrientation = 1 then
      begin
        // 반전
        nFlipX := Trunc(nPaperHeight - LPosX);
        nFlipY := Trunc(nPaperWidth - LPosY);

        LPosX := nFlipX;
        LPosY := nFlipY;
      end;

      nTempX := LPosX;
      nTempY := LPosY;

      LPosX := nTempY + 16;
      LPosY := nTempX + 16;

      LIsBold := rTicketLabelRec[I].bold;
      LTextValue := rTicketLabelRec[I].text_content;


      // 마지막 보정 - 추가해야 함.
      (*
      TOP_DOWN: {
          vertical: 0 * MM_TO_DOT,
        },
        BOTTOM_TOP: {
          horizontal: 2 * MM_TO_DOT,
          vertical: 2 * MM_TO_DOT,
        },
      150

                TOP_DOWN: {
          vertical: 0 * MM_TO_DOT,
        },
        BOTTOM_TOP: {
          horizontal: 3 * MM_TO_DOT,
          vertical: 2 * MM_TO_DOT,
        },

      [180]
      *)

      if rTicketLabelRec[I].editable_component_type_barcode then
      begin
        LBarcodeSize := 0;
        if rTicketLabelRec[I].editable_component_type = 'barcode' then
          LBarcodeSize := 3
        else if rTicketLabelRec[I].editable_component_type = 'parkingBarcode' then
          LBarcodeSize := 3
        else if rTicketLabelRec[I].editable_component_type = 'lgartBarcode' then
          LBarcodeSize := 3
        else if rTicketLabelRec[I].editable_component_type = 'tlPrdLgartBarcode' then
          LBarcodeSize := 2
        else if rTicketLabelRec[I].editable_component_type = 'smallBarcode' then
          LBarcodeSize := 2
        else
          LBarcodeSize := 2;

        sAnsiStr := LTextValue;
        Print1DBarcode(
            LPosX,
            LPosY,
            1, // CODE128
            LBarcodeSize, //좁은 바 너비
            10, //넗은 바 너비
            50, // 바코드 높이
            LRotation,
            0,
            PAnsiChar(sAnsiStr)
        );

        memo1.Lines.Add(
                      'barcode -> mmx: ' + inttostr(LPosX) + ' / ' +
                      'mmy: ' + inttostr(LPosY) + ' / ' +
                      'LBarcodeSize: ' + inttostr(LBarcodeSize) + ' / ' +
                      'LRotation: ' + inttostr(LRotation) + ' / ' +
                      'text_content: ' + LTextValue
                      );

      end
      else if rTicketLabelRec[I].editable_component_type_qrcode then
      begin
        //x,y좌표를 QR코드 정 가운데로 잡습니다 회전기준.
        LQRCodeSize := 0;
        if rTicketLabelRec[I].editable_component_type = 'qrCode1' then
          LQRCodeSize := 1
        else if rTicketLabelRec[I].editable_component_type = 'qrCode2' then
          LQRCodeSize := 2
        else if rTicketLabelRec[I].editable_component_type = 'qrCode3' then
          LQRCodeSize := 3
        else if rTicketLabelRec[I].editable_component_type = 'qrCode4' then
          LQRCodeSize := 4
        else if rTicketLabelRec[I].editable_component_type = 'qrCode5' then
          LQRCodeSize := 5
        else if rTicketLabelRec[I].editable_component_type = 'qrCode6' then
          LQRCodeSize := 6
        else if rTicketLabelRec[I].editable_component_type = 'qrCode7' then
          LQRCodeSize := 7
        else if rTicketLabelRec[I].editable_component_type = 'qrCode8' then
          LQRCodeSize := 8
        else if rTicketLabelRec[I].editable_component_type = 'parkingQrcode' then
          LQRCodeSize := 5
        else if rTicketLabelRec[I].editable_component_type = 'questionnaireQrcode' then
          LQRCodeSize := 3
        else if rTicketLabelRec[I].editable_component_type = 'seoulArtCenterQrcode' then
          LQRCodeSize := 5
        else
          LQRCodeSize := 5;

        nTempX := 0;
        nTempY := 0;
        qrSize := Trunc(2.7 * 8 * LQRCodeSize);

        if LRotation = 1 then
            nTempX := nTempX - qrSize
        else if LRotation = 2 then
        begin
          nTempX := nTempX - qrSize;
          nTempY := nTempY - qrSize;
        end
        else if lrotation = 3 then
          nTempY := nTempY - qrSize;

        LPosX :=LPosX + nTempX;
        LPosY :=LPosY + nTempY;

        // 전체적으로 QR이 약간 밀려 보이는 증상 보정
        if LOrientation = 1 then
        begin
          LPosX := LPosX - 4;
          LPosY := LPosY - 8;
        end
        else
        begin
          LPosX := LPosX - 5;
          LPosY := LPosY - 10;
        end;

        sAnsiStr := LTextValue;
        PrintQRCode(
                    LPosX,
                    LPosY,
                    2,  // QRMODE_2
                    30, // 에러보정레벨?
                    LQRCodeSize,
                    LRotation,
                    PAnsiChar(sAnsiStr)
        );

        memo1.Lines.Add(
                      'qrcode -> mmx: ' + inttostr(LPosX) + ' / ' +
                      'mmy: ' + inttostr(LPosY) + ' / ' +
                      'LQRCodeSize: ' + inttostr(LQRCodeSize) + ' / ' +
                      'LRotation: ' + inttostr(LRotation) + ' / ' +
                      'text_content: ' + LTextValue
                      );






      end
      else
      begin
        if LIsBold = True then
          PrintTrueFontW(LPosX, LPosY, PChar('굴림'), LFontSize, LRotation, False, True, False, PChar(LTextValue), True)
        else
          PrintTrueFontW(LPosX, LPosY, PChar('굴림'), LFontSize, LRotation, False, False, False, PChar(LTextValue), True);
        //printTrueFontLib(LPosX, LPosY, PAnsiChar(sas), LFontSize, LRotation, False, LIsBold, False, PAnsiChar(sAnsiStr), True);

        memo1.Lines.Add(
                      '-> mmx: ' + inttostr(LPosX) + ' / ' +
                      'mmy: ' + inttostr(LPosY) + ' / ' +
                      'font_size: ' + inttostr(LFontSize) + ' / ' +
                      'rotate_code: ' + inttostr(LRotation) + ' / ' +
                      'LIsBold: '+ BoolToStr(LIsBold) + ' / ' +
                      'text_content: ' + LTextValue
                      );

      end;



    end;




    LSpeed := 5;
    LDensity := 14 + 1;
    LAutoCut := True; //연속 출력 필요시 false 로. 마지막 출력시 true
    LCuttingPeriod := 1;
    LBackFeeding := True;

    memo1.Lines.Add(
                      'SetConfigOfPrinter - ' +
                      'LOrientation: ' + inttostr(LOrientation)
                      );

    //SetConfigOfPrinter(SLCS_PRINTER_SETTING_SPEED, LDensity, LOrientation, LAutoCut, LCuttingPeriod, LBackFeeding);   // 프린터의 인쇄 속도, 농도, 인쇄 방향, 절단 옵션을 설정
    //                                   인쇄속도, 인쇄농도,     인쇄방향, 절단동작,       절단간격,    TRUE(고정)
    SetConfigOfPrinter(LSpeed, LDensity, LOrientation, LAutoCut, LCuttingPeriod, LBackFeeding);

    Prints(1, 1);
    //ReadBuff_N; // 티켓링크 전용 SDK 일 경우 -> 라벨프린터 메모리 정리
    //ReadBuff;
    DisconnectPrinter;

    Result := True;
  except
    on E: Exception do
      //AResMsg := E.Message;
  end;
end;

end.
