unit Common.TLCommonLib;

interface

uses
  { Native }
  System.Classes, System.SysUtils, Vcl.Controls, Vcl.ExtCtrls, WinApi.Windows;

//애플리케이션 버전 정보 추출
function GetAppVersion(const AIndex: Integer): string;
//DLL등의 모듈 파일 버전 정보 추출
function GetModuleVersion(const AFileName: string): string;
//사용 가능한 모든 컨트롤에 DoubleBuffered 적용
procedure SetDoubleBuffered(AControl: TWinControl; const ADoubleBuffered: Boolean);
//요일명 반환
function DayOfWeekName(const ADateTime: TDateTime; const ALocale: Integer): string;
//yyyymmdd 형식의 날짜를 yyyy-mm-dd 형식으로 반환
function FormattedDateString(const ADateString: string; const ASeparator: string='-'): string;
//hhnnss 형식의 시각을 hh:nn:ss 형식으로 반환
function FormattedTimeString(const ATimeString: string; const ASeparator: string=':'): string;
//텍스트 파일 생성 및 기록
procedure WriteToFile(const AFileName, AStr: string; const ANewFile: Boolean=False);
//Jpeg 이미지 사이즈 구하기
procedure GetJpgSize(const AFileName: string; var AWidth, AHeight: Integer);
//Png 이미지 사이즈 구하기
procedure GetPngSize(const AFileName: string; var AWidth, AHeight: Integer);
//시스템 디렉터리 구하기
function GetSystemDirectory(const AFloder: Integer): String;
//라운디드 컨트롤
function MakeRoundedControl(AControl: TWinControl; const AEllipseWidth: Integer=20; const AEllipseHeight: Integer=20): Boolean;
//유휴상태 지속시간(초) 구하기
function GetIdleSeconds: DWord;
//모든 폼에 메시지 전송
procedure BroadcastMessage(const AMsgId: Cardinal);
//윈도우 시스템 종료
procedure SystemShutdown(const ATimeOut: DWORD; const AForceClose, AReboot: Boolean);
//가상 키보드 입력 처리
procedure SimulateKeyDown(AVirtualKey: Byte);
procedure SimulateKeyUp(AVirtualKey: Byte);
procedure SimulateKeyWithShift(AVirtualKey: Byte); overload;
procedure SimulateKeyWithShift(AVirtualKey, AShiftKey: Byte); overload;
procedure SimulateKey(AVirtualKey: Byte);
{$IFNDEF DEBUG}
//레지스트리에 시작 프로그램으로 등록하기
procedure RunOnWindownStart(const AppTitle, AppFile: string; const ARunOnce: Boolean=False);
//레지스트리의 시작 프로그램 목록에서 제거하기
function RemoveFromRunOnWindowStart(const AppTitle: string): Boolean;
{$ENDIF}
//바탕화면 아이콘 감추기
procedure ShowDesktopIcons(const AShow: Boolean);
function CharToByte(const AChar: string): Byte;
function StrToHex(const AValue: AnsiString): string;
function HexToStr(const AHexaDecimal: string): AnsiString;
function HexToByte(const AHexaDecimal: string): Byte;
function HexToBinStr(const AHexaDecimal: string): string;
//Url에서 파일명만 추출
function ExtractUrlFileName(const AFileUrl: string): string;
function MemoryStreamToString(const MS: TMemoryStream): string;
//투명 컨트롤
procedure MakeTransparentControl(var AControl: TWinControl);

implementation

uses
  Vcl.Forms, System.Variants, WinApi.ShFolder, WinApi.Messages, System.Win.Registry;

function GetAppVersion(const AIndex: Integer): string;
const
  VERSION_INFO: array[0..9] of string = (
    'CompanyName',
    'FileDescription',
    'FileVersion',
    'InternalName',
    'LegalCopyright',
    'LegalTradeMarks',
    'OriginalFileName',
    'ProductName',
    'ProductVersion',
    'Comments');
var
  s, Locale: string;
  n, Len: DWORD;
  P: Pointer;
  Buf: PChar;
  Value: PChar;
begin
  Result := '?';
  s := Application.ExeName;
  n := GetFileVersionInfoSize(PChar(s), n);
  if (n > 0) then
  begin
    Buf := AllocMem(n);
    try
      GetFileVersionInfo(PChar(s), 0, n, Buf);
      VerQueryValue(Buf, 'VarFileInfo\Translation', P, Len);
      Locale := IntToHex(MakeLong(HiWord(Longint(P^)), LoWord(Longint(P^))), 8);
      if VerQueryValue(Buf, PChar('StringFileInfo\' + Locale + '\' + VERSION_INFO[AIndex]), Pointer(Value), Len) then
        Result := Trim(Value);
    finally
      FreeMem(Buf, n);
    end;
  end;
end;

function GetModuleVersion(const AFileName: string): string;
var
  wInfoSize: DWORD;
  PVerBuff: pointer;
  nVerSize, nWnd: UINT;
  PFFI: PVSFixedFileInfo;
begin
  Result := '';
  wInfoSize := GetFileVersioninfoSize(PChar(AFileName), nWnd);
  if (wInfoSize <> 0) then
  begin
    GetMem(PVerBuff, wInfoSize);
    try
      if GetFileVersionInfo(PChar(AFileName), nWnd, wInfoSize, PVerBuff) then
      begin
        VerQueryValue(PVerBuff, '\', Pointer(PFFI), nVerSize);
        Result := IntToStr(PFFI.dwFileVersionMS div $10000) + '.' +
                  IntToStr(PFFI.dwFileVersionMS and $0FFFF) + '.' +
                  IntToStr(PFFI.dwFileVersionLS div $10000) + '.' +
                  IntToStr(PFFI.dwFileVersionLS and $0FFFF);
      end;
    finally
      FreeMem(PVerBuff);
    end;
  end;
end;

procedure SetDoubleBuffered(AControl: TWinControl; const ADoubleBuffered: Boolean);
var
  I: Integer;
begin
  AControl.DoubleBuffered := ADoubleBuffered;
  if AControl is TPanel then
    TPanel(AControl).FullRepaint := (not ADoubleBuffered);

  for I := 0 to Pred(AControl.ControlCount) do
    if (AControl.Controls[I] is TWinControl) then
      SetDoubleBuffered(TWinControl(AControl.Controls[I]), ADoubleBuffered);
end;

function DayOfWeekName(const ADateTime: TDateTime; const ALocale: Integer): string;
var
  Days: array[0..7] of string;
begin
  case ALocale of
    0: //한국어
      begin
        Days[0] := '  ';
        Days[1] := '일';
        Days[2] := '월';
        Days[3] := '화';
        Days[4] := '수';
        Days[5] := '목';
        Days[6] := '금';
        Days[7] := '토';
      end;
    1: //English:
      begin
        Days[0] := '   ';
        Days[1] := 'Sun';
        Days[2] := 'Mon';
        Days[3] := 'Tue';
        Days[4] := 'Wed';
        Days[5] := 'Thu';
        Days[6] := 'Fri';
        Days[7] := 'Sat';
      end;
    2, //일본어
    3: //중국어
      begin
        Days[0] := '  ';
        Days[1] := '日';
        Days[2] := '月';
        Days[3] := '火';
        Days[4] := '水';
        Days[5] := '木';
        Days[6] := '金';
        Days[7] := '土';
      end
  end;
  Result := Days[DayOfWeek(ADateTime)];
end;

function FormattedDateString(const ADateString: string; const ASeparator: string): string;
begin
  Result := ADateString;
  if (Pos(ASeparator, ADateString) > 0) then
    Exit;
  if (ADateString <> EmptyStr) and (Length(ADateString) = 8) then
    Result := Copy(ADateString, 1, 4) + ASeparator + Copy(ADateString, 5, 2) + ASeparator + Copy(ADateString, 7, 2);
end;

function FormattedTimeString(const ATimeString: string; const ASeparator: string): string;
begin
  Result := ATimeString;
  if (Pos(':', ATimeString) > 0) then
    Exit;
  if (ATimeString <> EmptyStr) then
    if (Length(ATimeString) = 4) then
      Result := Copy(ATimeString, 1, 2) + ':' + Copy(ATimeString, 3, 2)
    else if (Length(ATimeString) = 6) then
      Result := Copy(ATimeString, 1, 2) + ':' + Copy(ATimeString, 3, 2) + ':' + Copy(ATimeString, 5, 2);
end;

procedure WriteToFile(const AFileName, AStr: string; const ANewFile: Boolean);
var
  hFile: TextFile;
begin
  if ANewFile then
    DeleteFile(PChar(AFileName));

  AssignFile(hFile, AFileName);
  try
    try
      if FileExists(AFileName) then
        Append(hFile)
      else
        Rewrite(hFile);

      WriteLn(hFile, AStr);
    except
    end;
  finally
    CloseFile(hFile);
  end;
end;

function ReadMWord(FS: TFileStream): Word;
type
  TMotorolaWord = record
  case byte of
    0: (Value: Word);
    1: (Byte1, Byte2: Byte);
end;
var
  MW: TMotorolaWord;
begin
  FS.Read(MW.Byte2, SizeOf(Byte));
  FS.Read(MW.Byte1, SizeOf(Byte));
  Result := MW.Value;
end;

procedure GetJpgSize(const AFileName: string; var AWidth, AHeight: Integer);
const
  ValidSig : array[0..1] of Byte = ($FF, $D8);
  Parameterless = [$01, $D0, $D1, $D2, $D3, $D4, $D5, $D6, $D7];
var
  Sig: array[0..1] of byte;
  FS: TFileStream;
  X: Integer;
  Seg: Byte;
  Dummy: array[0..15] of Byte;
  Len: Word;
  ReadLen: LongInt;
begin
  AWidth := 0;
  AHeight := 0;
  FillChar(Sig, SizeOf(Sig), #0);
  FS := TFileStream.Create(AFileName, fmOpenRead);
  try
    ReadLen := FS.Read(Sig[0], SizeOf(Sig));
    for x := Low(Sig) to High(Sig) do
      if (Sig[X] <> ValidSig[X]) then
        ReadLen := 0;

    if (ReadLen > 0) then
    begin
      ReadLen := FS.Read(Seg, 1);
      while (Seg = $FF) and (ReadLen > 0) do
      begin
        ReadLen := FS.Read(Seg, 1);
        if (Seg <> $FF) then
        begin
          if (Seg = $C0) or (Seg = $C1) then
          begin
            ReadLen := FS.Read(Dummy[0], 3);
            AHeight := ReadMWord(FS);
            AWidth := ReadMWord(FS);
          end
          else
          begin
            if not (Seg in Parameterless) then
            begin
              Len := ReadMWord(FS);
              FS.Seek(Len - 2, 1);
              FS.Read(Seg, 1);
            end
            else
              Seg := $FF;
          end;
        end;
      end;
    end;
  finally
    FS.Free;
  end;
end;

procedure GetPngSize(const AFileName: string; var AWidth, AHeight: Integer);
type
  TPNGSig = array[0..7] of Byte;
const
  ValidSig: TPNGSig = (137, 80, 78, 71, 13, 10, 26, 10);
var
  Sig: TPNGSig;
  FS: TFileStream;
  X: integer;
begin
  AWidth := 0;
  AHeight := 0;
  FillChar(Sig, SizeOf(Sig), #0);
  FS := TFileStream.Create(AFileName, fmOpenRead);
  try
    FS.Read(Sig[0], SizeOf(Sig));
    for X := Low(Sig) to High(Sig) do
      if (Sig[X] <> ValidSig[X]) then
        Exit;

      FS.Seek(18, 0);
      AWidth := ReadMWord(FS);
      FS.Seek(22, 0);
      AHeight := ReadMWord(FS);
  finally
    FS.Free;
  end;
end;

function GetSystemDirectory(const AFloder: Integer): String;
var
  PPath: PChar;
begin
  Result := '';
  GetMem(PPath, MAX_PATH);
  try
    SHGetFolderPath(0, AFloder, 0, 0, PPath);
    Result := Copy(PPath, 0, Length(PPath));
  finally
    FreeMem(PPath);
  end;
end;

function MakeRoundedControl(AControl: TWinControl; const AEllipseWidth: Integer; const AEllipseHeight: Integer): Boolean;
var
  R: TRect;
  Rgn: HRGN;
begin
  (*
  //TForm
  Form1.BorderStyle := bsNone;
  MakeRoundedControl(Form1);
  //TMemo:
  Memo1.BorderStyle := bsNone;
  MakeRoundedControl(Memo1);
  //TEdit:
  Edit2.BorderStyle := bsNone;
  MakeRoundedControl(Edit2);
  //TPanel:
  MakeRoundedControl(Panel1);
  //TStaticText:
  MakeRoundedControl(StaticText1);
  *)
  Result := False;
  with AControl do
  begin
    R := ClientRect;
    Rgn := CreateRoundRectRgn(R.Left, R.Top, R.Right, R.Bottom, AEllipseWidth, AEllipseHeight);
    if not VarIsNull(Rgn) then
    begin
      Perform(EM_GETRECT, 0, lParam(@r));
      InflateRect(r, -5, -5);
      Perform(EM_SETRECTNP, 0, lParam(@r));
      SetWindowRgn(Handle, rgn, True);
      Invalidate;
      Result := True;
    end;
  end;
end;

function GetIdleSeconds: DWord;
var
  LI: TLastInputInfo;
begin
  LI.cbSize := SizeOf(TLastInputInfo);
  GetLastInputInfo(LI);
  Result := (GetTickCount - LI.dwTime) div 1000;
end;

procedure BroadcastMessage(const AMsgId: Cardinal);
begin
  for var I := 0 to Pred(Screen.FormCount) do
    Screen.Forms[I].Perform(AMsgId, 0, 0)
end;

procedure SystemShutdown(const ATimeOut: DWORD; const AForceClose, AReboot: Boolean);
var
  PreviosPrivileges: ^TTokenPrivileges;
  TokenPrivileges: TTokenPrivileges;
  hToken: THandle;
  tmpReturnLength: dword;
begin
  if (Win32Platform = VER_PLATFORM_WIN32_NT) then
  begin
    if OpenProcessToken(GetCurrentProcess(), TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY, hToken) then
    begin
      LookupPrivilegeValue(nil, 'SeShutdownPrivilege', TokenPrivileges.Privileges[0].Luid);
      TokenPrivileges.PrivilegeCount := 1;
      TokenPrivileges.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED;
      tmpReturnLength := 0;
      PreviosPrivileges := nil;
      AdjustTokenPrivileges(hToken, False, TokenPrivileges, 0, PreviosPrivileges^, tmpReturnLength);
      if InitiateSystemShutdown(nil, nil, ATimeOut, AForceClose, AReboot) then
      begin
        TokenPrivileges.Privileges[0].Attributes := 0;
        AdjustTokenPrivileges(hToken, False, TokenPrivileges, 0, PreviosPrivileges^, tmpReturnLength);
      end;
    end ;
  end
  else
    ExitWindowsEx(EWX_FORCE or EWX_SHUTDOWN or EWX_POWEROFF, 0);
end;

procedure SimulateKeyDown(AVirtualKey: Byte);
begin
  keybd_event(AVirtualKey, MapVirtualkey(AVirtualKey, 0), 0, 0);
end;

procedure SimulateKeyUp(AVirtualKey: Byte);
begin
  keybd_event(AVirtualKey, MapVirtualkey(AVirtualKey, 0), KEYEVENTF_KEYUP, 0);
end;

procedure SimulateKeyWithShift(AVirtualKey: Byte);
begin
  SimulateKeyWithShift(AVirtualKey, VK_SHIFT);
end;

procedure SimulateKeyWithShift(AVirtualKey, AShiftKey: Byte);
begin
  SimulateKeyDown(AShiftKey);
  SimulateKey(AVirtualKey);
  SimulateKeyUp(AShiftKey);
end;

procedure SimulateKey(AVirtualKey: Byte);
begin
  SimulateKeyDown(AVirtualKey);
  SimulateKeyUp(AVirtualKey);
end;

{$IFNDEF DEBUG}
procedure RunOnWindownStart(const AppTitle, AppFile: string; const ARunOnce: Boolean=False);
var
  Reg: TRegistry;
  TheKey: string;
begin
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  TheKey := 'Software\Microsoft\Windows\CurrentVersion\Run';
  if ARunOnce then
    TheKey := TheKey + 'Once';
  Reg.OpenKey(TheKey, True);
  Reg.WriteString(AppTitle, AppFile);
  Reg.CloseKey;
  Reg.Free;
end;

function RemoveFromRunOnWindowStart(const AppTitle: string): Boolean;
var
  Reg: TRegistry;
  TheKey: string;
begin
  Result := False;
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  TheKey := 'Software\Microsoft\Windows\CurrentVersion\Run';
  if Reg.OpenKey(TheKey, False) then
    Result := Reg.DeleteValue(AppTitle);
  Reg.CloseKey;
  Reg.Free;
end;
{$ENDIF}

procedure ShowDesktopIcons(const AShow: Boolean);
var
  H: HWND;
begin
  H := GetWindow(FindWindow('Progman', 'Program Manager'), GW_CHILD);
  if AShow then
    ShowWindow(H, SW_SHOW)
  else
    ShowWindow(H, SW_HIDE);
end;

function CharToByte(const AChar: string): Byte;
begin
  if (UpperCase(AChar) = 'A') then
    Result := $0A
  else if (UpperCase(AChar) = 'B') then
    Result := $0B
  else if (UpperCase(AChar) = 'C') then
    Result := $0C
  else if (UpperCase(AChar) = 'D') then
    Result := $0D
  else if (UpperCase(AChar) = 'E') then
    Result := $0E
  else if (UpperCase(AChar) = 'F') then
    Result := $0F
  else
    Result := Byte(TEncoding.UTF8.GetBytes(AChar)[0] - 48);
end;

function StrToHex(const AValue: AnsiString): string;
begin
  SetLength(Result, Length(AValue) * 2);
  BinToHex(PAnsiChar(AValue), PChar(Result), Length(AValue));
end;

function HexToStr(const AHexaDecimal: string): AnsiString;
begin
  SetLength(Result, Length(AHexaDecimal) div 2);
  HexToBin(PChar(AHexaDecimal), PAnsiChar(Result), Length(Result));
end;

function HexToByte(const AHexaDecimal: string): Byte;
var
  B1, B2: Byte;
begin
  B1 := CharToByte(AHexaDecimal.Substring(0, 1));
  B2 := CharToByte(AHexaDecimal.Substring(1, 1));
  Result := (B1 shl 4) or B2;
end;

function HexToBinStr(const AHexaDecimal: string): string;
const
  BCD: array[0..15] of string = ('0000', '0001', '0010', '0011', '0100', '0101', '0110', '0111', '1000', '1001', '1010', '1011', '1100', '1101', '1110', '1111');
begin
  Result := '';
  for var I := Length(AHexaDecimal) downto 1 do
    Result := BCD[StrToInt('$' + AHexaDecimal[I])] + Result;
end;

function ExtractUrlFileName(const AFileUrl: string): string;
var
  LPos: Integer;
begin
  LPos := LastDelimiter('/', AFileUrl);
  Result := Copy(AFileUrl, LPos + 1, Length(AFileUrl) - (LPos));
end;

function MemoryStreamToString(const MS: TMemoryStream): string;
var
  SS: TStringStream;
begin
  Result:='';
  SS := TStringStream.Create('', TEncoding.UTF8);
  try
    MS.Position := 0;
    SS.CopyFrom(MS, MS.Size);

    Result:= SS.DataString;
    Result := Result;
  finally
    FreeAndNil(SS);
  end;
end;

procedure MakeTransparentControl(var AControl: TWinControl);
var
  I, X, Y: Integer;
  FullRgn, ClientRgn, ControlRgn: THandle;
  Margin, MarginX, MarginY: Integer;
begin
  Margin := (AControl.Width - AControl.ClientWidth) div 2;
  MarginX := Margin;
  MarginY := AControl.Height - AControl.ClientHeight - Margin;
  FullRgn := CreateRectRgn(0, 0, AControl.Width, AControl.Height);
  ClientRgn := CreateRectRgn(MarginX, MarginY, MarginX + AControl.ClientWidth, MarginY + AControl.ClientHeight);
  CombineRgn(FullRgn, FullRgn, ClientRgn, RGN_DIFF);
  for I := 0 to AControl.ControlCount - 1 do
  begin
    X := MarginX + AControl.Controls[I].Left;
    Y := MarginY + AControl.Controls[I].Top;
    ControlRgn := CreateRectRgn(X, Y, X + AControl.Controls[I].Width, Y + AControl.Controls[I].Height);
    CombineRgn(FullRgn, FullRgn, ControlRgn, RGN_OR);
  end;
  SetWindowRgn(AControl.Handle, FullRgn, True);
end;

end.
