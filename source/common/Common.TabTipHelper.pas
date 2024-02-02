unit Common.TabTipHelper platform;

interface

uses
  Winapi.Windows;

type
  TTabTip = record
  private
  var
    FExePath: string;

    procedure DetermineExePath;
    function DetermineHWND: HWND;
  public
    procedure Launch(const AParentHWND: HWND=0);
    procedure Show;
    procedure Close;
    procedure Termiante;
    function IsVisible: Boolean;
  end;

implementation

uses
  System.IOUtils, System.SysUtils, System.Win.Registry, Winapi.ShellApi, Winapi.Messages, Winapi.TlHelp32;

function ExpandEnvironmentVariables(const AVariable: string): string;
var
  LLen: DWORD;
begin
  LLen := MAX_PATH;
  SetLength(Result, LLen);
  LLen := Winapi.Windows.ExpandEnvironmentStrings(PChar(AVariable), PChar(Result), LLen);
  Win32Check(LLen > 0);
  SetLength(Result, LLen - 1);
end;

function DetermineProcessHandleForExeName(const AExeName: string; out AProcessHandle: THandle): Boolean;
var
  LSnapshot: THandle;
  PE: TProcessEntry32;
  PID: DWORD;
begin
  Result := False;
  LSnapshot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  try
    PE.dwSize := SizeOf(TProcessEntry32);
    if Process32First(LSnapshot, PE) then
      while Process32Next(LSnapshot, PE) do
        if (String(PE.szExeFile).ToLowerInvariant = AExeName) then
        begin
          PID := PE.th32ProcessID;
          AProcessHandle := OpenProcess(PROCESS_TERMINATE, False, PID);
          Exit(True);
        end;
  finally
    CloseHandle(LSnapshot);
  end;
end;

function FindTrayButtonWindow: THandle;
var
  LShellTrayWnd: THandle;
  LTrayNotifyWnd: THandle;
begin
  Result := 0;
  LShellTrayWnd := FindWindow('Shell_TrayWnd', nil);
  if (LShellTrayWnd > 0) then
  begin
    LTrayNotifyWnd := FindWindowEx(LShellTrayWnd, 0, 'TrayNotifyWnd', nil);
    if (LTrayNotifyWnd > 0) then
      Result := FindWindowEx(LTrayNotifyWnd, 0, 'TIPBand', nil);
  end;
end;

{ TTabTip }

procedure TTabTip.Close;
var
  LWindowHandle: HWND;
begin
  LWindowHandle := DetermineHWND;
  PostMessage(LWindowHandle, WM_SYSCOMMAND, SC_CLOSE, 0);
end;

procedure TTabTip.DetermineExePath;
const
  LCS_Path = 'SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\TabTip.exe';
  LCS_HardcodedPath = 'C:\Program Files\Common Files\microsoft shared\ink\TabTip.exe';
  LCS_ErrorMsg = '화상키보드 프로그램이 설치되어 있지 않습니다.';
var
  R: TRegistry;
  LValue: string;
begin
  R := TRegistry.Create(KEY_READ or KEY_WOW64_64KEY);
  try
    R.RootKey := HKEY_LOCAL_MACHINE;
    R.OpenKeyReadOnly(LCS_Path);
    LValue := R.ReadString(EmptyStr);
    FExePath := ExpandEnvironmentVariables(LValue);
  finally
    R.Destroy;
  end;

  if not TFile.Exists(FExePath) then
    FExePath := LCS_HardcodedPath;
  if not TFile.Exists(FExePath) then
    raise EFileNotFoundException.Create(LCS_ErrorMsg);
end;

function TTabTip.DetermineHWND: HWND;
const
  LWindowName: PChar = 'IPTip_Main_Window';
begin
  Result := FindWindow(LWindowName, nil);
end;

function TTabTip.IsVisible: Boolean;
begin
  Result := (DetermineHWND <> 0);
end;

procedure TTabTip.Launch(const AParentHWND: HWND);
var
  LTrayButtonWindow: THandle;
begin
  if FExePath.IsEmpty then
    DetermineExePath;

  if (ShellExecute(AParentHWND, 'open', PChar(FExePath), nil, nil, SW_SHOWNA) < 32) then
    RaiseLastOSError
  else
  begin
    LTrayButtonWindow := FindTrayButtonWindow;
    if (LTrayButtonWindow > 0) then
    begin
      PostMessage(LTrayButtonWindow, WM_LBUTTONDOWN, MK_LBUTTON, $00010001);
      PostMessage(LTrayButtonWindow, WM_LBUTTONUP, 0, $00010001);
    end;
  end;
end;

procedure TTabTip.Show;
var
  LTrayButtonWindow: THandle;
begin
  if IsVisible then
  begin
    LTrayButtonWindow := FindTrayButtonWindow;
    if (LTrayButtonWindow > 0) then
    begin
      PostMessage(LTrayButtonWindow, WM_LBUTTONDOWN, MK_LBUTTON, $00010001);
      PostMessage(LTrayButtonWindow, WM_LBUTTONUP, 0, $00010001);
    end;
  end
  else
    RaiseLastOSError;
end;

procedure TTabTip.Termiante;
var
  LProcessHandle: THandle;
begin
  if DetermineProcessHandleForExeName('tabtip.exe', LProcessHandle) then
    Win32Check(TerminateProcess(LProcessHandle, ERROR_SUCCESS));
end;

end.
