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

  { �⺻�� }
  CCC_LAUNCHER_TITLE  = 'TicketLink AppLauncher';
  CCC_LAUNCHER_NAME   = 'TLLauncher';
//  CCC_CDN_SERVER_HOST = 'https://rlb3ndqxm.toastcdn.net/kiosk_system/';
  CCC_CDN_SERVER_HOST = 'https://api-storage.cloud.toast.com/v1/AUTH_db76304ad7a14f7f9323cec62c2fb963/ticketlink-video-cdn/kiosk_system/R1/';
  CCC_TICKETLINK_HOME = 'www.ticketlink.co.kr';
  CCC_API_SERVER_HOST = 'https://api.ticketlink.co.kr';
  CCC_TICKETLINK_REGISTRY_KEY = 'SOFTWARE\TicketLink\Kiosk'; //HKEY_CURRENT_USER\SOFTWARE\TicketLink\Kiosk
  CCC_TICKETLINK_HOTLINE = '1588-7890';
  CCC_START_PLUGIN    = 'TLDashboard.bpl';
  CCC_MAGIC_KEY       = '{61F270E9-1252-40B3-B2C0-F1B494DCB1FC}'; //Ƽ�ϸ�ũ ���� AES256 Magic Key
  CCC_STORE_BIZNO     = '1448125090';
  CCC_STORE_NAME      = 'NHN Ƽ�ϸ�ũ';
  CCC_STORE_OWNER     = '�չ���';
  CCC_STORE_ADDRESS   = '��� ������ �д籸 ����Ǳ���645���� 16';
  CCC_STORE_TELNO     = '1588-7890';
  CCC_KCP_VAN_CD      = 'KCP';
  CCC_FLAG_USE_PG     = 'PG';

  { PAYCO ���� }
  CCC_PAYCO_POS_DEV_CORP = 'SOLBIPOS';
  CCC_PAYCO_POS_SOLUTION = 'TicketLink-KIOSK';
  CCC_PAYCO_HOST    = 'https://dongle.payco.com';
  CCC_PAYCO_REG_URI = '/pos/v1/registration';
  CCC_PAYCO_APPROVAL_URI = '/payment/v1/approval/simple';
  CCC_PAYCO_CANCEL_URI = '/payment/v1/cancel/simple';
  CCC_PAYCO_NET_CANCEL_URI= '/payment/v1/networkcancel/simple';

  { ���߿� �ܸ��� ���� }
  CCC_DEV_VAN_BIZNO = '1138521083'; //�׽�Ʈ�����ϳ��θ�Ʈ
  CCC_DEV_VAN_TID   = '1002189855';
  CCC_DEV_PAYCO_BIZNO = '1448115549'; //��ۼ�
  CCC_DEV_PAYCO_TID = 'P1601103319';

  { SDK ���̼��� ���� }
  CCC_LIC_CKDLL_KEY = 'SLBPSK.CB1112022_ncysW5kq8RmQ'; //CkDLL API Library
  CCC_LIC_VIDEOGRABBER_KEY = '1791553139800639204523-73SOLBIPOS'; //DataStead VideoGrabber SDK

  { ��� ���� �ڵ� }
  CRC_SUCCESS       = '0000';
  CRC_NO_DATA       = '9999';
  CRC_YES           = 'Y';
  CRC_NO            = 'N';
  CRC_OFF           = 0;
  CRC_ON            = 1;

  { Ű����ũ ȭ�� ��� }
  KSM_NONE          = 0;
  KSM_CLOSE         = 1; //����
  KSM_PREPARE       = 2; //�غ�
  KSM_DOWNLOAD      = 3; //�ٿ�ε�
  KSM_ADMIN         = 4; //������ �޴�
  KSM_IDLE          = 5; //���� ����
  KSM_HOME          = 6; //Ƽ�� Ȩ
  KSM_TICKETING_HOME= 7; //����Ƽ�� �߱�
  KSM_BUY_HOME      = 8; //Ƽ�� ����(��ǰ ���� ������)
  KSM_BUY_ROUND     = 9; //Ƽ�� ����(��ǰ ȸ�� ���� ������)
  KSM_BUY_DENOMIN   = 10; //Ƽ�� ����(���� ���� ������)
  KSM_BUY_PAYMENT   = 11; //Ƽ�� ����(���� ������)
  KSM_NAMES: array[KSM_NONE..KSM_BUY_PAYMENT] of string =
    ('����', '����', '�غ�', '�ٿ�ε�', '������', '����', 'Ƽ��Ȩ', '����Ƽ�Ϲ߱�', 'Ƽ�ϱ���(��ǰ)', 'Ƽ�ϱ���(ȸ��)', 'Ƽ�ϱ���(����)', 'Ƽ�ϱ���(����)');

  { �޴� ǥ�� ���� }
  MTC_ISSUE         = 'ISSUE';
  MTC_RESERVE       = 'RESERVE';

  { ����ó ���� }
  ITC_GENERAL       = 'TICKETLINK'; //�Ϲ�
  ITC_INTERGRATION  = 'INTEGRATION'; //����

  { ��ȸ ��� ���� }
  STC_PHONE_NO      = 'PHONE_NO'; //��ȭ��ȣ
  STC_RESERVE_NO    = 'RESERVE_NO'; //���Ź�ȣ

  { �������� ��� ���� ���� }
  PMC_CARD          = 'CARD'; //�ſ�ī��
  PMC_PAYCO         = 'PAYCO'; //PAYCO

  { ������ ��� ��� ���� }
  RPT_OPTION        = 'OPTION'; //���� ���
  RPT_PRINT         = 'PRINT'; //�ڵ� ���
  RPT_NO_PRINT      = 'NO_PRINT'; //��� ����

  { �׸� �ڵ� ���� }
  TME_THEME_BASE    = 'BASE';
  TME_THEME_DARK    = 'DARK';
  TME_THEME_WHITE   = 'WHITE';
  TME_THEME_ARCHIVE_BASE = 'ticketlink_base_theme.zip';
  TME_THEME_ARCHIVE_DARK = 'ticketlink_dark_theme.zip';
  TME_THEME_ARCHIVE_WHITE = 'ticketlink_white_theme.zip';

  { �������� ���� }
  CPM_CASH          = 0; //����
  CPM_CASH_RECEIPT  = 1; //���ݿ������߱�
  CPM_CARD          = 2; //�ſ�ī��
  CPM_PAYCO_CARD    = 3; //PAYCO�ſ�ī��
  CPM_PAYCO_POINT   = 4; //PAYCO����Ʈ
  CPM_PAYCO_COUPON  = 5; //PAYCO����
  CPM_ETC           = 6; //��Ÿ
  CPM_NAMES: array[CPM_CASH..CPM_ETC] of string = ('����', '���ݿ�����', '�ſ�ī��', 'PAYCO�ſ�ī��', 'PAYCO����Ʈ', 'PAYCO����', '��Ÿ');

  { PAYCO �������� �ڵ� }
  PPC_PAYCO_CARD    = '00'; //�ſ�ī��
  PPC_PAYCO_TMONEY  = '01'; //T-money(?)
  PPC_PAYCO_POINT   = '10'; //����Ʈ
  PPC_PAYCO_COUPON  = '20'; //����,����Ʈ��,�ı�

  { Ƽ�ϸ�ũ �������� �ڵ� }
  TPT_OFF_CARD      = 'OFF_ICCARD'; //�ſ�ī��
  TPT_OFF_DONGLE    = 'OFF_DONGLE'; //PAYCO

  { �ŷ� ���� ���� �ڵ� }
  TRS_INCOMPLETE    = 0; //�̽��� �ŷ�
  TRS_APPROVAL      = 1; //���� ���� �Ϸ�
  TRS_PART_CANCEL   = 2; //�κ� ���
  TRS_CANCEL        = 3; //���� ��� �Ϸ�

  { ���� ���� �ڵ� }
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

  { �˻� ���� �ڵ� }
  SCH_PHONE_NO      = 0;
  SCH_RESERVED_NO   = 1;
  SCH_TICKET_NO     = 2;
  SCH_BARCODE       = 3;
  SCH_CODES: array[SCH_PHONE_NO..SCH_BARCODE] of string = ('CELLPHONE', 'RESERVENO', 'TICKETNO', 'BARCODE');

  { �̵�� ��� �� ȭ�� ũ�� }
  ATC_FULL          = 'FULL';
  ATC_NORMAL        = 'NORMAL';

  { ��ǰ �з� �ڵ� }
  PCT_EXHIBITION    = 'EXHIBITION';

  { ��ǰ ���� �ڵ� }
  PTC_DAY           = 'DAY';
  PTC_SEASON        = 'SEASON';

  { �÷����� Ŀ�ǵ� }
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

  { �÷����� �Ķ���� }
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