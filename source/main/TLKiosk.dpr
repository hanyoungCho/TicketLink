program TLKiosk;

uses
  System.ShareMem,
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  Vcl.Forms,
  Common.TLMsgBox,
  TLKiosk.MainForm in 'TLKiosk.MainForm.pas' {TLMainForm};

{$R *.res}

const
  LCS_MUTEX = 'Global/TicketLink Kiosk';
var
  hMutex: THandle;
begin
{$IFDEF RELEASE}
  if (ParamCount = 0) or (LowerCase(ParamStr(1)) <> '/run') then
  begin
    ShowMsgBoxInfo('�� ���α׷��� �ܵ����� ������ �Ұ��մϴ�!', '', ['�ݱ�'], 5);
    Halt(0);
    Exit;
  end;
{$ENDIF}
  hMutex := CreateMutex(nil, True, LCS_MUTEX);
  try
    if (hMutex > 0) then
    begin
      if (GetLastError = ERROR_ALREADY_EXISTS) then
      begin
        ShowMsgBoxInfo('���α׷��� �̹� ���� ���Դϴ�!', '', ['�ݱ�'], 5);
        Exit;
      end;

      Application.Initialize;
      Application.CreateForm(TTLMainForm, TLMainForm);
      Application.Run;
    end;
  finally
    CloseHandle(hMutex);
  end;
end.
