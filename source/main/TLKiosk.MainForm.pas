unit TLKiosk.MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Forms, Vcl.Controls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.AppEvnts,
  { Plugin System }
  uPluginManager, uPluginMessages,
  { DevExpress }
  dxGDIPlusClasses;

{$I ..\common\common.TLGlobal.inc}

type
  TTLMainForm = class(TForm)
    imgLogo: TImage;
    ApplicationEvents: TApplicationEvents;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure imgLogoClick(Sender: TObject);
    procedure ApplicationEventsMessage(var Msg: tagMSG; var Handled: Boolean);
    procedure ApplicationEventsException(Sender: TObject; E: Exception);
  private
    { Private declarations }
    procedure StartUp;
{$IFDEF JCL_EXCEPTION_HANDLER}
    procedure MyExceptDlgCallbackProc(Sender: TObject);
{$ENDIF}
  public
    { Public declarations }
  end;

var
  TLMainForm: TTLMainForm;

implementation

uses
  { Native }
{$IFDEF RELEASE}
  WinApi.ShlObj, System.Win.ComObj, WinApi.ActiveX,
{$ENDIF}
  { Project }
{$IFDEF JCL_EXCEPTION_HANDLER}
  Common.TLExceptDlg,
{$ENDIF}
  Common.TLGlobal, Common.TLDM, Common.TLCommonLib, Common.TLMsgBox;

{$R *.dfm}

{ TTLMainForm }

procedure TTLMainForm.ApplicationEventsMessage(var Msg: tagMSG; var Handled: Boolean);
var
  P: TPoint;
  C: TWinControl;
begin
  if (Global.KioskMode = KSM_IDLE) and
     (Msg.message = WM_LBUTTONUP) then
  begin
    P.X := SmallInt(Msg.lParam);
    P.Y := SmallInt(Msg.lParam shr 16);
    C := FindVCLWindow(P);
    if (C = nil) then
      Handled := True
    else if (C.Handle <> Msg.hwnd) then
    begin
      SendMessage(C.Handle, Msg.message, Msg.wParam, Msg.lParam);
      Handled := False;
    end;
  end;
end;

procedure TTLMainForm.ApplicationEventsException(Sender: TObject; E: Exception);
begin
  if Assigned(Global) then
    AddLog(Format('Application.Exception = %s', [E.Message]));
end;

{$IFDEF JCL_EXCEPTION_HANDLER}
procedure TTLMainForm.MyExceptDlgCallbackProc(Sender: TObject);
begin
  if Assigned(Global) then
    AddLog(TExceptionDialog(Sender).ReportAsText);
end;
{$ENDIF}

procedure TTLMainForm.FormCreate(Sender: TObject);
{$IFDEF RELEASE}
var
  LLinkFile: string;
  LIObject: IUnknown;
  LISLink: IShellLink;
  LIPFile: IPersistFile;
{$ENDIF}
begin
{$IFDEF RELEASE}
  LLinkFile := Common.TLCommonLib.GetSystemDirectory(WinApi.ShlObj.CSIDL_DESKTOP) + '\티켓링크 KIOSK.lnk';
  if not FileExists(LLinkFile) then
  begin
    LIObject := CreateComObject(CLSID_ShellLink);
    LISLink := LIObject as IShellLink;
    LIPFile := LIObject as IPersistFile;
    with LISLink do
    begin
      SetArguments('/run'); // 실행 파라메터
      //SetPath(PChar(GetSystemDirectory(36) + 'notepad.exe')); // 실행파일이름
      //SetWorkingDirectory(PChar(GetSystemDirectory(36))); // 실행디렉토리
      SetPath(PChar(Global.HomeDir + CCC_LAUNCHER_NAME + '.exe')); // 실행파일이름
      SetWorkingDirectory(PChar(Global.HomeDir)); // 실행디렉토리
    end;
    LIPFile.Save(PChar(LLinkFile), False);
  end;

  SystemParametersInfo(SPI_SETSCREENSAVEACTIVE, 0, nil, 0); //화면보호기 중지
  ShowDesktopIcons(Global.ShowDesktopIcons); //바탕화면 아이콘 보이기
  ShowCursor(Global.ShowCursor); //화면 커서 표시
  if not Global.ShowTaskBar then
    ShowWindow(FindWindow('Shell_TrayWnd', nil), SW_HIDE); //작업표시줄 감출
{$ENDIF}

  Global.ProductVersion := GetAppVersion(2); //8
  Global.FileVersion := GetAppVersion(2);
  Global.PluginInfo.MainFormHandle := Self.Handle;

  Self.Top := (Global.BaseScreenHeight div 2) - (Self.Height div 2);
  Self.Left := (Global.BaseScreenWidth div 2) - (Self.Width div 2);
//  Self.Top := Global.BaseScreenTop;
//  Self.Left := Global.BaseScreenLeft;
//  Self.Height := Global.BaseScreenHeight;
//  Self.Width := Global.BaseScreenWidth;
//  imgLogo.Top := (Global.BaseScreenHeight div 2) - (imgLogo.Height div 2);
//  imgLogo.Left := (Global.BaseScreenWidth div 2) - (imgLogo.Width div 2);

  SetDoubleBuffered(Self, True);
  AddLog('***** Application.Start *****');
end;

procedure TTLMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SystemParametersInfo(SPI_SETSCREENSAVEACTIVE, 1, nil, 0);
  ShowWindow(FindWindow('Shell_TrayWnd', nil), SW_SHOW);
  ShowCursor(True);
  AddLog('***** Application.Close *****');
end;

procedure TTLMainForm.FormShow(Sender: TObject);
begin
  StartUp;
end;

procedure TTLMainForm.StartUp;
var
  PM: TPluginMessage;
begin
  PM := TPluginMessage.Create(nil);
  try
    PM.Command := CPC_INIT;
    PM.AddParams(CPP_OWNER_ID, Self.Handle);
    try
      Global.PluginInfo.DashboardPluginId := PluginManager.Open(Global.PluginInfo.StartPluginName, PM).PluginId;
    except
      on E: Exception do
      begin
        ShowMsgBoxError('시작 플러그인을 실행할 수 없습니다!', E.Message);
        SendMessage(Self.Handle, WM_CLOSE, 0, 0);
      end;
    end;
  finally
    FreeAndNil(PM);
  end;
end;

procedure TTLMainForm.imgLogoClick(Sender: TObject);
begin
  Application.Terminate;
end;

////////////////////////////////////////////////////////////////////////////////////////////////////

initialization
  ReportMemoryLeaksOnShutdown := True;
  Global := TTLGlobal.Create;
  DM := TTLDataModule.Create(nil);
finalization
  DM.Free;
  Global.Free;
  CheckSynchronize;
end.
