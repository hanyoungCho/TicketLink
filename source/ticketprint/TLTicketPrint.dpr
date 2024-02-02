program TLTicketPrint;

uses
  Vcl.Forms,
  Winapi.Windows,
  System.SysUtils,
  TicketPrint.TLTicketPrintForm in 'TicketPrint.TLTicketPrintForm.pas' {TLSettingForm};

{$R *.res}

begin
{$IFDEF RELEASE}
  if (ParamCount = 0) or (LowerCase(ParamStr(1)) <> '/run') then
  begin
    MessageBox(0, PChar('이 프로그램은 단독으로 실행이 불가합니다!'), PChar('TicketLink KIOSK Setting'), MB_ICONWARNING or MB_OK or MB_TOPMOST or MB_APPLMODAL);
    Halt(0);
    Exit;
  end;
{$ENDIF}
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'TicketLink KIOSK Setting';
  Application.CreateForm(TTLSettingForm, TLSettingForm);
  Application.Run;
end.
