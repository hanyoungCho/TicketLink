{$DEFINE USE_ANIGIF}
{$DEFINE JCL_EXCEPTION_HANDLER}

const
  _SOH = Chr($01);
  _STX = Chr($02); //Start String
  _ETX = Chr($03); //End String
  _BS  = Chr($08); //Back Space
  _TAB = Chr($09); //Tab
  _LF  = Chr($0A); //Line Feed
  _CR  = Chr($0d); //Carrige Return
  _FS  = Chr($1C); //File Separator
  _GS  = Chr($1D); //Group Separator
  _RS  = Chr($1E); //Record Separator
  _US  = Chr($1F); //Unit Separator
  _CRLF = _CR + _LF;
  _LFCR = _LF + _CR;

  CWM_USER                    = $0400;
  CWM_SYSTEM_REBOOT           = CWM_USER + 1;
  CWM_REFRESH_TOTAL           = CWM_USER + 100;
  CWM_SELECT_PRODUCT          = CWM_USER + 101;
  CWM_SELECT_ROUND            = CWM_USER + 102;
  CWM_SELECT_DENOMIN_CATEGORY = CWM_USER + 103;
  CWM_SELECT_DENOMIN          = CWM_USER + 104;
  CWM_REMOVE_ORDER            = CWM_USER + 105;
  CWM_SCROLLBOX_NAVIGATOR     = CWM_USER + 106;
  CWM_PROCEED_APPROVAL        = CWM_USER + 107;
  CWM_REFRESH_REMAIN_TIME     = CWM_USER + 108;

  CFS_DATE_FORMAT   = 'yyyy-mm-dd';
  CFS_TIME_FORMAT   = 'hh:nn:ss';
  CFS_DATETIME_FORMAT = CFS_DATE_FORMAT + ' ' + CFS_TIME_FORMAT;
  CFS_SERVER_DATE_SEPARATOR = '.';
  CFS_SERVER_DATE_FORMAT = 'yyyy' + CFS_SERVER_DATE_SEPARATOR + 'mm' + CFS_SERVER_DATE_SEPARATOR + 'dd';
  CFS_SERVER_DATETIME_FORMAT = CFS_SERVER_DATE_FORMAT + ' ' + CFS_TIME_FORMAT;

  { 기본값 }
  CCC_LAUNCHER_TITLE  = 'TicketLink AppLauncher';
  CCC_LAUNCHER_NAME   = 'TLLauncher';
//  CCC_CDN_SERVER_HOST = 'https://rlb3ndqxm.toastcdn.net/kiosk_system/';
  CCC_CDN_SERVER_HOST = 'https://api-storage.cloud.toast.com/v1/AUTH_db76304ad7a14f7f9323cec62c2fb963/ticketlink-video-cdn/kiosk_system/R1/';
  CCC_TICKETLINK_HOME = 'www.ticketlink.co.kr';
  CCC_API_SERVER_HOST = 'https://api.ticketlink.co.kr';
  CCC_TICKETLINK_REGISTRY_KEY = 'SOFTWARE\TicketLink\Kiosk'; //HKEY_CURRENT_USER\SOFTWARE\TicketLink\Kiosk
  CCC_TICKETLINK_HOTLINE = '1588-7890';
  CCC_START_PLUGIN    = 'TLDashboard.bpl';
  CCC_MAGIC_KEY       = '{61F270E9-1252-40B3-B2C0-F1B494DCB1FC}'; //티켓링크 전용 AES256 Magic Key
  CCC_STORE_BIZNO     = '1448125090';
  CCC_STORE_NAME      = 'NHN 티켓링크';
  CCC_STORE_OWNER     = '왕문주';
  CCC_STORE_ADDRESS   = '경기 성남시 분당구 대왕판교로645번길 16';
  CCC_STORE_TELNO     = '1588-7890';
  CCC_KCP_VAN_CD      = 'KCP';
  CCC_FLAG_USE_PG     = 'PG';

  { PAYCO 서버 }
  CCC_PAYCO_POS_DEV_CORP = 'SOLBIPOS';
  CCC_PAYCO_POS_SOLUTION = 'TicketLink-KIOSK';
  CCC_PAYCO_HOST    = 'https://dongle.payco.com';
  CCC_PAYCO_REG_URI = '/pos/v1/registration';
  CCC_PAYCO_APPROVAL_URI = '/payment/v1/approval/simple';
  CCC_PAYCO_CANCEL_URI = '/payment/v1/cancel/simple';
  CCC_PAYCO_NET_CANCEL_URI= '/payment/v1/networkcancel/simple';

  { 개발용 단말기 정보 }
  CCC_DEV_VAN_BIZNO = '1138521083'; //테스트농협하나로마트
  CCC_DEV_VAN_TID   = '1002189855';
  CCC_DEV_PAYCO_BIZNO = '1448115549'; //비글샵
  CCC_DEV_PAYCO_TID = 'P1601103319';

  { SDK 라이선스 정보 }
  CCC_LIC_CKDLL_KEY = 'SLBPSK.CB1112022_ncysW5kq8RmQ'; //CkDLL API Library
  CCC_LIC_VIDEOGRABBER_KEY = '1791553139800639204523-73SOLBIPOS'; //DataStead VideoGrabber SDK

  { 결과 구분 코드 }
  CRC_SUCCESS       = '0000';
  CRC_NO_DATA       = '9999';
  CRC_YES           = 'Y';
  CRC_NO            = 'N';
  CRC_OFF           = 0;
  CRC_ON            = 1;

  { 키오스크 화면 모드 }
  KSM_NONE          = 0;
  KSM_CLOSE         = 1; //종료
  KSM_PREPARE       = 2; //준비
  KSM_DOWNLOAD      = 3; //다운로드
  KSM_ADMIN         = 4; //관리자 메뉴
  KSM_IDLE          = 5; //유휴 상태
  KSM_HOME          = 6; //티켓 홈
  KSM_TICKETING_HOME= 7; //예매티켓 발권
  KSM_BUY_HOME      = 8; //티켓 구매(상품 선택 페이지)
  KSM_BUY_ROUND     = 9; //티켓 구매(상품 회차 선택 페이지)
  KSM_BUY_DENOMIN   = 10; //티켓 구매(권종 선택 페이지)
  KSM_BUY_PAYMENT   = 11; //티켓 구매(결제 페이지)
  KSM_NAMES: array[KSM_NONE..KSM_BUY_PAYMENT] of string =
    ('시작', '종료', '준비', '다운로드', '관리자', '유휴', '티켓홈', '예매티켓발권', '티켓구매(상품)', '티켓구매(회차)', '티켓구매(권종)', '티켓구매(결제)');

  { 메뉴 표시 설정 }
  MTC_ISSUE         = 'ISSUE';
  MTC_RESERVE       = 'RESERVE';

  { 예매처 구분 }
  ITC_GENERAL       = 'TICKETLINK'; //일반
  ITC_INTERGRATION  = 'INTEGRATION'; //통합

  { 조회 방식 구분 }
  STC_PHONE_NO      = 'PHONE_NO'; //전화번호
  STC_RESERVE_NO    = 'RESERVE_NO'; //예매번호

  { 결제수단 사용 설정 구분 }
  PMC_CARD          = 'CARD'; //신용카드
  PMC_PAYCO         = 'PAYCO'; //PAYCO

  { 영수증 출력 방식 구분 }
  RPT_OPTION        = 'OPTION'; //선택 출력
  RPT_PRINT         = 'PRINT'; //자동 출력
  RPT_NO_PRINT      = 'NO_PRINT'; //출력 안함

  { 테마 코드 정보 }
  TME_THEME_BASE    = 'BASE';
  TME_THEME_DARK    = 'DARK';
  TME_THEME_WHITE   = 'WHITE';
  TME_THEME_ARCHIVE_BASE = 'ticketlink_base_theme.zip';
  TME_THEME_ARCHIVE_DARK = 'ticketlink_dark_theme.zip';
  TME_THEME_ARCHIVE_WHITE = 'ticketlink_white_theme.zip';

  { 결제수단 구분 }
  CPM_CASH          = 0; //현금
  CPM_CASH_RECEIPT  = 1; //현금영수증발급
  CPM_CARD          = 2; //신용카드
  CPM_PAYCO_CARD    = 3; //PAYCO신용카드
  CPM_PAYCO_POINT   = 4; //PAYCO포인트
  CPM_PAYCO_COUPON  = 5; //PAYCO쿠폰
  CPM_ETC           = 6; //기타
  CPM_NAMES: array[CPM_CASH..CPM_ETC] of string = ('현금', '현금영수증', '신용카드', 'PAYCO신용카드', 'PAYCO포인트', 'PAYCO쿠폰', '기타');

  { PAYCO 결제수단 코드 }
  PPC_PAYCO_CARD    = '00'; //신용카드
  PPC_PAYCO_TMONEY  = '01'; //T-money(?)
  PPC_PAYCO_POINT   = '10'; //포인트
  PPC_PAYCO_COUPON  = '20'; //쿠폰,기프트샵,식권

  { 티켓링크 결제수단 코드 }
  TPT_OFF_CARD      = 'OFF_ICCARD'; //신용카드
  TPT_OFF_DONGLE    = 'OFF_DONGLE'; //PAYCO

  { 거래 상태 구분 코드 }
  TRS_INCOMPLETE    = 0; //미승인 거래
  TRS_APPROVAL      = 1; //정상 승인 완료
  TRS_PART_CANCEL   = 2; //부분 취소
  TRS_CANCEL        = 3; //승인 취소 완료

  { 서비스 구분 코드 }
  CPS_TICKETLINK    = 0;
  CPS_CLIP_SVC_OLD  = 1;
  CPS_CLIP_SVC      = 2;
  CPS_SEJONG        = 3;
  CPS_LOTTE         = 4;
  CPS_NAVER         = 5;
  CPS_WE_MAKE_PRICE = 6;
  CPS_TMON          = 7;
  CPS_SMART_INFINY  = 8;
  CPS_CODES: array[CPS_TICKETLINK..CPS_SMART_INFINY] of string = ('TKL', 'CLP', 'CLI', 'SEJ', 'LOT', 'NAV', 'WEM', 'TMO', 'SMA');

  { 검색 구분 코드 }
  SCH_PHONE_NO      = 0;
  SCH_RESERVED_NO   = 1;
  SCH_TICKET_NO     = 2;
  SCH_BARCODE       = 3;
  SCH_CODES: array[SCH_PHONE_NO..SCH_BARCODE] of string = ('CELLPHONE', 'RESERVENO', 'TICKETNO', 'BARCODE');

  { 미디어 재생 시 화면 크기 }
  ATC_FULL          = 'FULL';
  ATC_NORMAL        = 'NORMAL';

  { 상품 분류 코드 }
  PCT_EXHIBITION    = 'EXHIBITION';

  { 상품 유형 코드 }
  PTC_DAY           = 'DAY';
  PTC_SEASON        = 'SEASON';

  { 플러그인 커맨드 }
  CPC_INIT          = 'CPC_INIT';
  CPC_CLOSE         = 'CPC_CLOSE';
  CPC_SHOW          = 'CPC_SHOW';
  CPC_HIDE          = 'CPC_HIDE';
  CPC_REFRESH       = 'CPC_REFRESH';
  CPC_PLAYER_START  = 'CPC_PLAYER_START';
  CPC_PLAYER_STOP   = 'CPC_PLAYER_STOP';
  CPC_PLAYER_PAUSE  = 'CPC_PLAYER_PAUSE';
  CPC_PLAYER_RESUME = 'CPC_PLAYER_RESUME';
  CPC_APPLY_THEME   = 'CPC_APPLY_THEME';
  CPC_SET_KIOSK_MODE= 'CPC_SET_KIOSK_MODE';
  CPC_SEND_BARCODE  = 'CPC_SEND_BARCODE';
  CPC_SEND_NFC_DATA = 'CPC_SEND_NFC_DATA';
  CPC_PRINT_TICKET  = 'CPC_PRINT_TICKET';
  CPC_PRINT_COMPLETE= 'CPC_PRINT_COMPLETE';
  CPC_PRINT_ERROR   = 'CPC_PRINT_ERROR';

  CPC_SET_LOCALE    = 'CPC_SET_LOCALE';
  CPC_SET_FOREGROUND= 'CPC_SET_FOREGROUND';
  CPC_SET_FORM_SIZE = 'CPC_SET_FORM_SIZE';
  CPC_SET_DATETIME  = 'CPC_SET_DATETIME';

  { 플러그인 파라메터 }
  CPP_OWNER_ID      = 'CPP_OWNER_ID';
  CPP_VALUE         = 'CPP_VALUE';
  CPP_TOP           = 'CPP_TOP';
  CPP_LEFT          = 'CPP_LEFT';
  CPP_HEIGHT        = 'CPP_HEIGHT';
  CPP_WIDTH         = 'CPP_WIDTH';
  CPP_TIMEOUT       = 'CPP_TIMEOUT';

  CPP_RECEIPT_NO    = 'CPP_RECEIPT_NO';
  CPP_RESERVE_NO    = 'CPP_RESERVE_NO';
  CPP_RECEIPT_PRINT = 'CPP_RECEIPT_PRINT';

{ EOF }
