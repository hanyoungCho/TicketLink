unit Launcher.TLMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Classes, System.SysUtils, Vcl.Forms, Vcl.Controls,
  Vcl.StdCtrls, Vcl.ExtCtrls, System.IniFiles,
  { DevExpress }
  dxGDIPlusClasses,
  { Indy }
  IdBaseComponent, IdComponent, IdHTTP, IdTCPConnection, IdTCPClient, IdAntiFreezeBase, IdAntiFreeze,
  { TMS }
  AdvShapeButton,
  { SolbiVCL }
  ProgressWheel;

const
  CO_FMT_FILE_COUNT   = '(File Checking : %d of %d)';
  CO_FMT_FILE_DATE    = 'yyyy-mm-dd hh:nn';
  CO_UPDATE_LIST_FILE = '_TLUpdate.lst';
  CO_UPDATE_SELF_FILE = '_TLSelf.bat';
  CO_LOGO_EXT         = '.jpg';
  CO_INI_EXT          = '.config';
  CO_INI_CONFIG       = 'Config';

type
  TAppLaunchInfo = record
    FileName: string;
    Params: string;
    Delay: Integer;
    Completed: Boolean;
  end;

  TAppWatchThread = class(TThread)
  private
    FWorking: Boolean;
    FCompleted: Boolean;
    FStarted: TDateTime;
    FLastWorked: TDateTime;
    FWatchChecked: TDateTime;
    FFileCount: Integer;
  protected
    procedure Execute; override;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TMainForm = class(TForm)
    imgBack: TImage;
    imgLogo: TImage;
    pgwTotal: TProgressWheel;
    pgwCurrent: TProgressWheel;
    lblCurrentCount: TLabel;
    imgProvider: TImage;
    panWait: TPanel;
    lblCurrentFile: TLabel;
    lblVersion: TLabel;
    lblFormTitle: TLabel;
    lbxLog: TListBox;
    tmrStartUp: TTimer;
    btnClose: TAdvShapeButton;
    HTTP: TIdHTTP;
    IdAntiFreeze: TIdAntiFreeze;
    TrayIcon: TTrayIcon;
    btnHide: TAdvShapeButton;

    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure tmrStartUpTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OnMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormHide(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TrayIconDblClick(Sender: TObject);
    procedure btnHideClick(Sender: TObject);
  private
    { Private declarations }
    FAppWatchThread: TAppWatchThread;
    FConfig: TIniFile;
    FConfigDir: string;
    FHomeDir: string;
    FLogDir: string;
    FUpdateDir: string;
    FBackupDir: string;
    FUpdateUrl: string;
    FLogFile: string;
    FExecName: string;
    FRunApp: string;
    FRunParams: string;
    FRunDelay: Integer;
    FSelfUpdated: Boolean;
    FWatchInterval: Integer;
    FUseReboot: Boolean;
    FUseSSL: Boolean;
    FClosing: Boolean;
    FUserCancel: Boolean;
    FDownloading: Boolean;
    FAppLaunchError: Boolean;
    FUpdateCount: Integer;
    FFormHide: Boolean;
    FNoExtAppLaunch: Boolean;

    procedure CloseAction;
    function SelfRename(const ASource, ADest: string): Boolean;
    procedure MakeLaunchAppList(const AExtAppList: string);
    function DoDownloadFiles: Boolean;
    procedure OnDownloadBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);
    procedure OnDownload(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
    procedure OnDownloadEnd(ASender: TObject; AWorkMode: TWorkMode);
  public
    { Public declarations }
    property HomeDir: string read FHomeDir;
    property LogFile: string read FLogFile;
    property UserCancel: Boolean read FUserCancel;
    property RunApp: string read FRunApp;
    property RunParams: string read FRunParams;
    property RunDelay: Integer read FRunDelay;
    property Closing: Boolean read FClosing;
    property AppLaunchError: Boolean read FAppLaunchError write FAppLaunchError;
    property WatchInterval: Integer read FWatchInterval;
    property NoExtAppLaunch: Boolean read FNoExtAppLaunch;
  end;

var
  MainForm: TMainForm;
  LogCS: TRTLCriticalSection;
  AppLaunchList: array of TAppLaunchInfo;
  MainHandle: HWND;

procedure AddLog(const ALogText: string);
function GetVersion: string;
function GetProcessHandle(const AFilePath: string): HWND;
procedure SystemShutDown(const ATimeOut: DWORD; const AForceClose, AReboot: Boolean);
function ChangeDateEng(const ADateTime: string): string;
function ChangeDateRus(const ADateTime: string): string;
function ChangeDateViet(const ADateTime: string): string;
procedure WriteToFile(const AFileName, AStr: string; const ANewFile: Boolean=False);

implementation

uses
  System.StrUtils, System.DateUtils, Winapi.TlHelp32, Winapi.ShellAPI, IdGlobal, IdURI, IdSSLOpenSSL;

{$R *.dfm}

{ TMainForm }

procedure TMainForm.FormCreate(Sender: TObject);
var
  sFileName, sExtAppList: string;
begin
  MainHandle := Self.Handle;
  lblVersion.Caption := 'v' + GetVersion;

  FHomeDir    := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
  FConfigDir  := FHomeDir + 'config\';
  FLogDir     := FHomeDir + 'log\';
  FUpdateDir  := FHomeDir + 'update\';
  FBackupDir  := FHomeDir + 'update\backup\';
  FExecName   := ExtractFileName(ParamStr(0));
  FLogFile    := FLogDir + ChangeFileExt(FExecName, '.log');
  FUseReboot  := False;
  FClosing    := False;
  FUserCancel := False;

  ForceDirectories(FConfigDir);
  ForceDirectories(FLogDir);
  ForceDirectories(FUpdateDir);
  ForceDirectories(FBackupDir);
  if FileExists(FLogFile) then
    DeleteFile(FLogFile);

  sFileName := FHomeDir + ChangeFileExt(FExecName, CO_LOGO_EXT);
  if FileExists(sFileName) then
  begin
    imgProvider.Picture.LoadFromFile(sFileName);
    imgProvider.Refresh;
  end;

  sFileName := FConfigDir + ChangeFileExt(FExecName, CO_INI_EXT);
  FConfig := TIniFile.Create(sFileName);
  if not FileExists(sFileName) then
    with FConfig do
    begin
      WriteString( CO_INI_CONFIG, 'UpdateURL', '');
      WriteString( CO_INI_CONFIG, 'RunApp', '');
      WriteString( CO_INI_CONFIG, 'Params', '/run');
      WriteInteger(CO_INI_CONFIG, 'Delay', 0);
      WriteInteger(CO_INI_CONFIG, 'WatchInterval', 0);
      WriteBool(   CO_INI_CONFIG, 'RebootWhenUpdated', False);
      WriteString( CO_INI_CONFIG, 'ExtAppList', '');
    end;

  with FConfig do
  begin
    FUpdateUrl := ReadString(CO_INI_CONFIG, 'UpdateURL', '');
    if FUpdateUrl.IsEmpty then
      ExitProcess(0);

    FRunApp := ReadString(CO_INI_CONFIG, 'RunApp', '');
    FRunParams := ReadString(CO_INI_CONFIG, 'Params', '');
    if FRunParams.IsEmpty then
      FRunParams := '/run';
    FRunDelay := ReadInteger(CO_INI_CONFIG, 'Delay', 0);
    FWatchInterval := ReadInteger(CO_INI_CONFIG, 'WatchInterval', 0); //���� 0�̸� ���α׷� ���� ���ø� ������� ����
    FUseReboot := ReadBool(CO_INI_CONFIG, 'RebootWhenUpdated', False);
    (*
      [�ܺ� �������� ���� ����]
        = ���ϸ�1(�������), �Ķ����1, ��������1(�и���)[;���ϸ�2(�������), �Ķ����2, ��������2(�и���)]
    *)
    sExtAppList := ReadString(CO_INI_CONFIG, 'ExtAppList', '');
    MakeLaunchAppList(sExtAppList);

    if not ((Pos('http://', LowerCase(FUpdateUrl)) > 0) or
            (Pos('https://', LowerCase(FUpdateUrl)) > 0)) then
      FUpdateUrl := 'http://' + FUpdateUrl;
    if (FUpdateUrl[Length(FUpdateUrl)] <> '/') then
      FUpdateUrl := FUpdateUrl + '/';

    FUseSSL := (LowerCase(Copy(FUpdateUrl, 1, 5)) = 'https');
  end;

  FNoExtAppLaunch := (ParamCount > 0) and (LowerCase(ParamStr(1)) = '/noextapp');
  tmrStartUp.Enabled := True;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(FAppWatchThread) then
    FAppWatchThread.Terminate;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if FDownloading and
     (MessageBox(0, PChar('������Ʈ �۾��� ���� ���Դϴ�!'#13#10 +
        '���α׷��� ���������� �������� ���� �� �ֽ��ϴ�.'#13#10 +
        '�۾��� ����ϰ� ����ðڽ��ϱ�?'),
        PChar('����'), MB_ICONQUESTION or MB_YESNO or MB_TOPMOST or MB_APPLMODAL) <> idYes) then
    Exit;

  CanClose := True;
end;

procedure TMainForm.FormHide(Sender: TObject);
begin
  FFormHide := True;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  FFormHide := False;
end;

procedure TMainForm.OnMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  PostMessage(Self.Handle, WM_SYSCOMMAND, $F012, 0);
end;

procedure TMainForm.btnCloseClick(Sender: TObject);
begin
  AddLog('����ڿ� ���� ���α׷� ����');
  FUserCancel := True;
  CloseAction;
end;

procedure TMainForm.btnHideClick(Sender: TObject);
begin
  Self.Hide;
end;

procedure TMainForm.tmrStartUpTimer(Sender: TObject);
var
  nFileCount: Integer;
begin
  with TTimer(Sender) do
  try
    Enabled := False;
    if DoDownloadFiles then
    begin
      //���� ������Ʈ
      if FSelfUpdated then
      begin
        SelfRename(FUpdateDir + FExecName, FHomeDir + FExecName);
        Application.Terminate;
        Exit;
      end;

      if FUseReboot and
         (FUpdateCount > 0) then
      begin
        MessageBeep(MB_ICONQUESTION);
        if (MessageBox(0, PChar('���α׷��� ������Ʈ �Ǿ� �ý����� �ٽ� �����Ͽ��� �մϴ�!'),
              PChar('Ȯ��'), MB_ICONQUESTION or MB_OKCANCEL) = idOk) then
        begin
          SystemShutDown(0, True, True);
          Exit;
        end;
      end;
    end;

    if not AppLaunchError then
    begin
      nFileCount := Length(AppLaunchList);
      if (not FNoExtAppLaunch) and
         ((nFileCount > 0) or (WatchInterval > 0)) then
      begin
        for var I := 0 to Pred(nFileCount) do
        begin
          if FileExists(AppLaunchList[I].FileName) then
            AddLog(Format('���� ��� = %s (%d�� �� ����)', [ExtractFileName(AppLaunchList[I].FileName), AppLaunchList[I].Delay]))
          else
            AddLog(Format('���� �Ұ� = %s (������ �������� ����)', [ExtractFileName(AppLaunchList[I].FileName)]));
        end;

        if not Assigned(FAppWatchThread) then
          FAppWatchThread := TAppWatchThread.Create;
        if not FAppWatchThread.Started then
          FAppWatchThread.Start;

        Self.Hide;
      end
      else
        CloseAction;
    end;
  finally
    Free;
  end;
end;

procedure TMainForm.TrayIconDblClick(Sender: TObject);
begin
  if FFormHide then
    Self.Show;
end;

procedure TMainForm.MakeLaunchAppList(const AExtAppList: string);
var
  A1, A2: TArray<string>;
  nIndex: Integer;
begin
  nIndex := 0;
  if (not FRunApp.IsEmpty) then
  begin
    SetLength(AppLaunchList, nIndex + 1);
    AppLaunchList[nIndex].FileName := FHomeDir + FRunApp;
    AppLaunchList[nIndex].Params := FRunParams;
    AppLaunchList[nIndex].Delay := FRunDelay;
    Inc(nIndex);
  end;

  A1 := SplitString(AExtAppList, ';');
  for var I := 0 to Length(A1) - 1 do
  begin
    A2 := SplitString(A1[I], ',');
    if (Length(A2) = 3) then
    begin
      SetLength(AppLaunchList, nIndex + 1);
      AppLaunchList[nIndex].FileName := A2[0];
      AppLaunchList[nIndex].Params := A2[1];
      AppLaunchList[nIndex].Delay := StrToIntDef(A2[2], 0);
      Inc(nIndex);
    end;
  end;
end;

procedure TMainForm.CloseAction;
begin
  if not FClosing then
  begin
    FClosing := True;
    SendMessage(Self.Handle, WM_CLOSE, 0, 0);
  end;
end;

function TMainForm.SelfRename(const ASource, ADest: string): Boolean;
var
  sBatchName: string;
  PI: TProcessInformation;
  SI: TStartupInfo;
begin
  Result := False;
  //������Ʈ ���α׷� �����θ� ������Ʈ�� ��ġ���� ����
  with TStringList.Create do
  try
    sBatchName := FHomeDir + CO_UPDATE_SELF_FILE;
    Add(':TRY');
    Add('DEL "' + ADest + '"');
    Add('IF EXIST "' + ADest + '" GOTO TRY');
    Add('COPY "' + ASource + '" "' + ADest + '"');
    Add('DEL "' + ASource + '"');
    Add('TIMEOUT 3');
    Add(Format('START /d "%s" /b %s', [FHomeDir, FExecName]));
    Add('DEL "' + sBatchName + '"');
    SaveToFile(sBatchName);
  finally
    Free;
  end;

  //��ġ���� ����
  AddLog('��� ������Ʈ ����');
  FillChar(SI, SizeOf(SI), $00);
  SI.dwFlags := STARTF_USESHOWWINDOW;
  SI.wShowWindow := SW_HIDE;
  if CreateProcess(nil, PChar(sBatchName), nil, nil, False, IDLE_PRIORITY_CLASS, nil, nil, SI, PI) then
  begin
    CloseHandle(PI.hThread);
    CloseHandle(PI.hProcess);
    AddLog('��� ������Ʈ �Ϸ�');
    Result := True;
  end;
end;

function TMainForm.DoDownloadFiles: Boolean;
var
  SSL: TIdSSLIOHandlerSocketOpenSSL;
  FL: TStrings;
  SS: TStringStream;
  MS: TMemoryStream;
  nIndex, nTotal, nServerFileSize, nFileHandle: Integer;
  sUrl, sServerFileName, sLocalFileName: string;
  dServerFileDate, dLocalFileDate: TDateTime;
  sServerFileDate, sLocalFileDate: string;
  bFileExists, bSucceed: Boolean;
begin
  Result := False;
  FDownloading := True;
  AddLog('�������Ʈ ����');

  FL := TStringList.Create;
  SS := TStringStream.Create('', TEncoding.Unicode);
  MS := TMemoryStream.Create;
  SSL := nil;
  try
    try
      sUrl := TIdURI.URLEncode(FUpdateUrl + StringReplace(CO_UPDATE_LIST_FILE, '\', '/', [rfReplaceAll]));
      AddLog('�������� ���� = ' + FUpdateUrl);

      if FUseSSL then
      begin
        SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
        SSL.SSLOptions.Method := sslvSSLv23;
        SSL.SSLOptions.Mode := sslmClient;
        HTTP.HandleRedirects := True;
        HTTP.IOHandler := SSL;
      end;

      HTTP.ConnectTimeout := IdTimeoutDefault; //5000
      HTTP.ReadTimeout := IdTimeoutDefault; //5000
      HTTP.Get(sUrl, SS);
      SS.SaveToFile(FUpdateDir + CO_UPDATE_LIST_FILE);
      SS.Position := 0;
      FL.LoadFromStream(SS);

      //�ٿ�ε� ��Ͽ� ��ó(�ڽ�)�� ������ �߰�
      if (Pos(LowerCase(FExecName), LowerCase(FL.Text)) = 0) then
        FL.Add(FExecName);

      FUpdateCount := 0;
      nTotal := FL.Count;
      if (nTotal = 0) then
        Exit;

      pgwTotal.Max := nTotal;
      HTTP.OnWorkBegin := OnDownloadBegin;
      HTTP.OnWork := OnDownload;
      HTTP.OnWorkEnd := OnDownloadEnd;
      for nIndex := 0 to Pred(nTotal) do
      begin
        if FClosing then
          Exit;

        sServerFileName := StringReplace(FL[nIndex], '\', '/', [rfReplaceAll]);
        sLocalFileName  := StringReplace(FL[nIndex], '/', '\', [rfReplaceAll]);
        lblCurrentCount.Caption := Format(CO_FMT_FILE_COUNT, [nIndex + 1, nTotal]);
        lblCurrentFile.Caption  := sLocalFileName;
        Application.ProcessMessages;

        try
          //������ �ִ� ������ ��¥, ũ�� ���� ����
          sUrl := TIdURI.URLEncode(FUpdateUrl + sServerFileName);
          if HTTP.Connected then
            HTTP.Disconnect;
          HTTP.Head(sUrl);

          nServerFileSize := HTTP.Response.ContentLength;
          dServerFileDate := HTTP.Response.LastModified;
          sServerFileDate := FormatDateTime(CO_FMT_FILE_DATE, dServerFileDate);
          sLocalFileDate  := FormatDateTime(CO_FMT_FILE_DATE, dServerFileDate - 1);
          if FileExists(FHomeDir + sLocalFileName) then
          begin
            //���� ������ ��¥ ���� ����
            if not FileAge(FHomeDir + sLocalFileName, dLocalFileDate) then
              Continue;
            sLocalFileDate := FormatDateTime(CO_FMT_FILE_DATE, dLocalFileDate);
          end;

          //���ÿ� �ش� ������ ���� ��� ������ ���ϰ� ��¥�� ���Ͽ� ���� ������ �ֽ��̸� ������Ʈ
          bFileExists := FileExists(FHomeDir + sLocalFileName);
          if (not bFileExists) or
             (bFileExists and (sServerFileDate > sLocalFileDate)) then
          begin
            if (LowerCase(sLocalFileName) = LowerCase(FExecName)) then
              FSelfUpdated := True;

            AddLog(Format('�ٿ�ε� = %s (%d KBytes)', [sLocalFileName, nServerFileSize div 1024]));
            Application.ProcessMessages;

            MS.Clear;
            sUrl := TIdURI.URLEncode(FUpdateUrl + sServerFileName);
            if HTTP.Connected then
              HTTP.Disconnect;
            HTTP.HandleRedirects := False;
            HTTP.Get(sUrl, MS);
            if FClosing then
              Continue;

            //�ٿ�ε��� ������ ��¥�� ���� ������ ��¥�� ����
            ForceDirectories(ExtractFilePath(FUpdateDir + sLocalFileName));
            MS.SaveToFile(FUpdateDir + sLocalFileName);
            GetFormatSettings;
            nFileHandle := FileOpen(FUpdateDir + sLocalFileName, fmOpenReadWrite);
            try
              {$WARN SYMBOL_PLATFORM OFF}
              FileSetDate(nFileHandle, DateTimeToFileDate(dServerFileDate));
              {$WARN SYMBOL_PLATFORM ON}
            finally
              FileClose(nFileHandle);
            end;

            //��ó ���α׷��� �ƴ� ��쿡��
            if (LowerCase(sLocalFileName) <> LowerCase(FExecName)) then
            begin
              bSucceed := True;
              //���� ���� ���
              if FileExists(FHomeDir + sLocalFileName) then
              begin
                if FileExists(FBackupDir + sLocalFileName) then
                  bSucceed := DeleteFile(FBackupDir + sLocalFileName);

                if bSucceed then
                begin
                  ForceDirectories(ExtractFilePath(FBackupDir + sLocalFileName));
                  bSucceed := RenameFile(FHomeDir + sLocalFileName, FBackupDir + sLocalFileName);
                end;
              end;

              //������Ʈ ���� ����
              if bSucceed and
                 FileExists(FUpdateDir + sLocalFileName) then
              begin
                if FileExists(FHomeDir + sLocalFileName) then
                  bSucceed := DeleteFile(FHomeDir + sLocalFileName);

                if bSucceed then
                begin
                  ForceDirectories(ExtractFilePath(FHomeDir + sLocalFileName));
                  RenameFile(FUpdateDir + sLocalFileName, FHomeDir + sLocalFileName);
                end;
              end;

              Inc(FUpdateCount);
            end;
          end;
        except
          on E: Exception do
            AddLog(Format('�ٿ�ε� ���� = %s', [E.Message]));
        end;

        pgwTotal.Position := (nIndex + 1);
        Application.ProcessMessages;
      end;

      Result := True;
      AddLog(Format('%d�� ���� ������Ʈ', [FUpdateCount]));
      AddLog('�������Ʈ �Ϸ�');
    except
      on E: Exception do
      begin
        AddLog('������Ʈ ���� = ' + E.Message);
//        MessageBeep(MB_ICONERROR);
//        MessageBox(0, PChar('������Ʈ �۾� �� ������ �߻��Ͽ����ϴ�!'#13#10 + E.Message),
//          PChar('�˸�'), MB_ICONERROR or MB_OK or MB_TOPMOST or MB_APPLMODAL);
      end;
    end;
  finally
    FDownloading := False;
    HTTP.Disconnect;
    if Assigned(SSL) then
      FreeAndNil(SSL);
    FreeAndNil(MS);
    FreeAndNil(SS);
    FreeAndNil(FL);
  end;
end;

procedure TMainForm.OnDownloadBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);
begin
  pgwCurrent.Position := 0;
  pgwCurrent.Max := AWorkCountMax;
end;

procedure TMainForm.OnDownload(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
begin
  pgwCurrent.Position := AWorkCount;
  if FClosing then
    TIdHTTP(ASender).Disconnect;
end;

procedure TMainForm.OnDownloadEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  pgwCurrent.Max := 100;
  pgwCurrent.Position := 100;
end;

{ TAppWatchThread }

constructor TAppWatchThread.Create;
begin
  inherited Create(True);

  FWorking := False;
  FCompleted := False;
  FStarted := Now;
  FLastWorked := Now;
  FWatchChecked := Now;
  FFileCount := Length(AppLaunchList);
end;

destructor TAppWatchThread.Destroy;
begin

  inherited;
end;

procedure TAppWatchThread.Execute;
begin
  inherited;

  AddLog('����� ���� ����');
  repeat
    if MainForm.Closing or
       MainForm.UserCancel then
      Break;

    if (not FWorking) and
       (SecondsBetween(FLastWorked, Now) >= 1) then
      Synchronize(
        procedure
        begin
          try
            FWorking := True;
            try
              for var I := 0 to Pred(FFileCount) do
              begin
                if MainForm.Closing or
                   MainForm.UserCancel then
                  Break;

                if not FileExists(AppLaunchList[I].FileName) then
                begin
                  AppLaunchList[I].Completed := True;
                  Continue;
                end;

                if (not AppLaunchList[I].Completed) and
                   (SecondsBetween(FStarted, Now) >= AppLaunchList[I].Delay) then
                begin
                  //�߰� �ܺ� ���α׷� ���� ����
                  if MainForm.NoExtAppLaunch and
                     (AppLaunchList[I].FileName <> (MainForm.HomeDir + MainForm.RunApp)) then
                  begin
                    AppLaunchList[I].Completed := True;
                    Continue;
                  end;

                  ShellExecute(MainHandle, PChar('open'), PChar(AppLaunchList[I].FileName), PChar(AppLaunchList[I].Params), PChar(ExtractFilePath(AppLaunchList[I].FileName)), SW_SHOWNORMAL);
                  AppLaunchList[I].Completed := True;
                end;
              end;

              //���� ���α׷� ���� ���� Ȯ��
              if (not MainForm.RunApp.IsEmpty) and
                 (SecondsBetween(FStarted, Now) >= MainForm.RunDelay) and
                 (SecondsBetween(FWatchChecked, Now) >= MainForm.WatchInterval) then
              begin
                try
                  if (GetProcessHandle(MainForm.HomeDir + MainForm.RunApp) = 0) then
                  begin
                    ShellExecute(MainHandle, PChar('open'), PChar(MainForm.RunApp), PChar(MainForm.RunParams), PChar(ExtractFilePath(MainForm.RunApp)), SW_SHOWNORMAL);
                    AppLaunchList[0].Completed := True;
                  end;
                finally
                  FWatchChecked := Now;
                end;
              end;
            except
              on E: Exception do
              begin
                MainForm.AppLaunchError := True;
                AddLog('���� ���� = ' + E.Message);
              end;
            end;

            if (MainForm.WatchInterval = 0) then
            begin
              for var I := 0 to Pred(FFileCount) do
                if not AppLaunchList[I].Completed then
                  Exit;

              //���ø�尡 �ƴϰ�(WatchInterval = 0) ��� �ܺ� ���α׷��� ������ �Ϸ� �Ǿ��ٸ� ��ó ����
              MainForm.CloseAction;
            end;
          finally
            FLastWorked := Now;
            FWorking := False;
          end;
        end);

    WaitForSingleObject(Self.Handle, 500);
  until Terminated;
  AddLog('����� ���� ����');
end;

////////////////////////////////////////////////////////////////////////////////////////////////////

procedure AddLog(const ALogText: string);
begin
  EnterCriticalSection(LogCS);
  try
    MainForm.lbxLog.Items.Add(ALogText);
    MainForm.lbxLog.ItemIndex := Pred(MainForm.lbxLog.Items.Count);
    WriteToFile(MainForm.LogFile, '[' + FormatDateTime('yyyy-mm-dd hh:nn:ss', Now) + '] ' + ALogText);
  finally
    LeaveCriticalSection(LogCS);
  end;
end;

function GetVersion: string;
var
  VerInfoSize, Temp: DWORD;
  VerInfo: PChar;
  FileInfo: PVSFixedFileInfo;
  FileInfoLen: UINT;
begin
  Result := '';
  VerInfoSize := GetFileVersionInfoSize(PChar(Application.ExeName), Temp);
  if VerInfoSize > 0 then
  begin
    GetMem(VerInfo, VerInfoSize);
    try
      if Assigned(VerInfo) then
        if GetFileVersionInfo(PChar(Application.ExeName), Temp, VerInfoSize, VerInfo) then
          if VerQueryValue(VerInfo, '\', Pointer(FileInfo), FileInfoLen) then
            Result := Format('%d.%d.%d.%d',
                            [Word(FileInfo.dwFileVersionMS shr $0010),
                             Word(FileInfo.dwFileVersionMS and $FFFF),
                             Word(FileInfo.dwFileVersionLS shr $0010),
                             Word(FileInfo.dwFileVersionLS and $FFFF)]);
    finally
      FreeMem(VerInfo);
    end;
  end;
end;

function GetProcessHandle(const AFilePath: string): HWND;
var
  pEntry: TProcessEntry32;
  hHandle: THandle;
  sFileName: string;
begin
  Result := 0;
  sFileName := ExtractFileName(AFilePath);
  pEntry.dwSize := SizeOf(TProcessEntry32);
  hHandle := CreateToolHelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  if Process32First(hHandle, pEntry) then
  try
    repeat
      if CompareText(pEntry.szExeFile, sFileName) = 0 then
      begin
        Result := hHandle;
        Break;
      end;
    until not Process32Next(hHandle, pEntry);
  finally
    CloseHandle(hHandle);
  end;
end;

procedure SystemShutDown(const ATimeOut: DWORD; const AForceClose, AReboot: Boolean);
var
  PreviosPrivileges: ^TTokenPrivileges;
  TokenPrivileges: TTokenPrivileges;
  hToken: THandle;
  tmpReturnLength: DWORD;
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

function ChangeDateEng(const ADateTime: string): string;
var
  sTmp: string;
begin
  //yyyy-mm-dd hh:nn:ss   =>   mm/dd/yyyy hh:nn:ss
  Result := '';
  sTmp := Copy(ADateTime, 6, 2) + '/' + Copy(ADateTime, 9, 2) + '/' + Copy(ADateTime, 1, 4) + ' ' +
          Copy(ADateTime, 12, 8);
  Result := sTmp;
end;

function ChangeDateRus(const ADateTime: string): string;
var
  sTmp: string;
begin
  //yyyy-mm-dd hh:nn:ss   =>   dd.mm.yyyy hh:nn:ss
  Result := '';
  sTmp := Copy(ADateTime, 9, 2) + '.' + Copy(ADateTime, 6, 2) + '.' + Copy(ADateTime, 1, 4) + ' ' +
          Copy(ADateTime, 12, 8);
  Result := sTmp;
end;

function ChangeDateViet(const ADateTime: string): string;
var
  sTmp: string;
begin
  //yyyy-mm-dd hh:nn:ss   =>   dd/mm/yyyy hh:nn:ss
  Result := '';
  sTmp := Copy(ADateTime, 9, 2) + '/' + Copy(ADateTime, 6, 2) + '/' + Copy(ADateTime, 1, 4) + ' ' +
          Copy(ADateTime, 12, 8);
  Result := sTmp;
end;

procedure WriteToFile(const AFileName, AStr: string; const ANewFile: Boolean);
var
  hFile: TextFile;
begin
  if ANewFile then
    DeleteFile(AFileName);

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

////////////////////////////////////////////////////////////////////////////////////////////////////

initialization
  InitializeCriticalSection(LogCS);
finalization
  DeleteCriticalSection(LogCS);
end.
