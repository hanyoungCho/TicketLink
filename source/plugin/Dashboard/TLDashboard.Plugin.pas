unit TLDashboard.Plugin;

interface

uses
  { Native }
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Forms, Vcl.Controls,
  Vcl.ExtCtrls,
  { WinSoft }
  ComPort,
  { Plugin System }
  uPluginManager, uPluginModule, uPluginMessages;

{$I ..\..\common\Common.TLGlobal.inc}

type
  TPluginForm = class(TPluginModule)
    tmrRunOnce: TTimer;

    procedure PluginModuleClose(Sender: TObject; var Action: TCloseAction);
    procedure PluginModuleMessage(Sender: TObject; AMsg: TPluginMessage);
    procedure tmrRunOnceTimer(Sender: TObject);
  private
    { Private declarations }
    FOwnerID: Integer;
    FWaitingTimer: TTimer;

    procedure ProcessMessages(AMsg: TPluginMessage);
    procedure OnWaitingTimer(Sender: TObject);
    procedure OnBarcodeScannerRxChar(Sender: TObject);
    procedure OnNFCReaderRxChar(Sender: TObject);
    procedure OnReceiptPrinterRxChar(Sender: TObject);
    procedure OnTicketPrinterRxChar(Sender: TObject);
    procedure ApplyTheme;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; AMsg: TPluginMessage=nil); override;
    destructor Destroy; override;
  end;

implementation

uses
  { Project }
  Common.TLGlobal, Common.TLCommonLib, Common.TLMsgBox;

{$R *.dfm}

{ TTLDashboardForm }

constructor TPluginForm.Create(AOwner: TComponent; AMsg: TPluginMessage);
begin
  inherited Create(AOwner, AMsg);

  FOwnerID := 0;
  SetDoubleBuffered(Self, True);
  Self.Top := Global.BaseScreenTop;
  Self.Left := Global.BaseScreenLeft;
  Self.Width := Global.BaseScreenWidth;
  Self.Height := Global.BaseScreenHeight;

  if Assigned(AMsg) then
    ProcessMessages(AMsg);

  tmrRunOnce.Interval := 100;
  tmrRunOnce.Enabled := True;
end;

destructor TPluginForm.Destroy;
begin

  inherited Destroy;
end;

procedure TPluginForm.PluginModuleClose(Sender: TObject; var Action: TCloseAction);
begin
  SendMessage(Application.MainForm.Handle, WM_CLOSE, 0, 0);
  Action := caFree;
end;

procedure TPluginForm.PluginModuleMessage(Sender: TObject; AMsg: TPluginMessage);
begin
  ProcessMessages(AMsg);
end;

procedure TPluginForm.ProcessMessages(AMsg: TPluginMessage);
begin
  if (AMsg.Command = CPC_INIT) then
  begin
    FOwnerID := AMsg.ParamByInteger(CPP_OWNER_ID);
    ApplyTheme;
  end;
end;

procedure TPluginForm.tmrRunOnceTimer(Sender: TObject);
var
  PM: TPluginMessage;
begin
  with TTimer(Sender) do
  try
    Enabled := False;
    try
      AddLog(Format('Dashboard.GetStoreInfo = Host: %s, PartnerNo: %d, CounterNo: %d, TID: %s, PaycoTID: %s',
        [Global.APIServerInfo.Host, Global.StoreInfo.PartnerNo, Global.StoreInfo.CounterNo, Global.StoreInfo.VanTID, Global.StoreInfo.PaycoVanTID]));

      Global.Preparing := True;
      if (not FileExists(Global.ThemeDir + TME_THEME_ARCHIVE_BASE)) then
        raise Exception.Create(Global.ThemeDir + TME_THEME_ARCHIVE_BASE + ' 파일을 찾을 수 없습니다.');
      Global.StoreInfo.ThemeCode := TME_THEME_BASE;
      Global.ThemeInfo.LoadTheme(Global.StoreInfo.ThemeCode);

      PM := TPluginMessage.Create(nil);
      try
        PM.Command := CPC_INIT;
        PM.AddParams(CPP_OWNER_ID, Self.PluginID);
        //chy test
        PM.AddParams(CPP_VALUE, 0);
        if Global.APIServerInfo.Host.IsEmpty or
           Global.APIServerInfo.Token.IsEmpty or
           (PluginManager.OpenModal('TLPrepare.bpl', PM) <> mrOK) then
        begin
          ShowAdminPanel(Self.PluginID, True);
          Application.Terminate;
        end;

        FWaitingTimer := TTimer.Create(nil);
        FWaitingTimer.Enabled := False;
        FWaitingTimer.OnTimer := OnWaitingTimer;
        FWaitingTimer.Interval := 5000;
        FWaitingTimer.Enabled := True;
        ShowWaitMsg('시스템 준비 중입니다...' + _CRLF + '잠시만 기다려 주십시오.');
        Self.FormStyle := fsStayOnTop;

        AddLog(Format('Dashboard.LoadPlugin = %s', ['TLMediaPlayer.bpl']));
        if Global.BarcodeScanner.Active then
          Global.BarcodeScanner.ComDevice.OnRxChar := OnBarcodeScannerRxChar;
        if Global.NFCReader.Active then
          Global.NFCReader.ComDevice.OnRxChar := OnNFCReaderRxChar;
        if Global.ReceiptPrinter.Active then
          Global.ReceiptPrinter.ComDevice.OnRxChar := OnReceiptPrinterRxChar;
        if Global.TicketPrinter.Active then
          Global.TicketPrinter.ComDevice.OnRxChar := OnTicketPrinterRxChar;

        Global.PluginInfo.MediaPlayerPluginId := PluginManager.Open('TLMediaPlayer.bpl', PM).PluginId;
        if Global.StoreInfo.ShowTicketingMenu and
           Global.StoreInfo.ShowTicketBuyMenu then
        begin
          Global.PluginInfo.TicketHomePluginId := PluginManager.Open('TLTicketHome.bpl', PM).PluginId;
          AddLog(Format('Dashboard.LoadPlugin = %s', ['TLTicketHome.bpl']));
        end;

        if Global.StoreInfo.ShowTicketingMenu then
        begin
          Global.PluginInfo.TicketingPluginId := PluginManager.Open('TLTicketing.bpl', PM).PluginId;
          AddLog(Format('Dashboard.LoadPlugin = %s', ['TLTicketing.bpl']));
        end;

        if Global.StoreInfo.ShowTicketBuyMenu then
        begin
          Global.PluginInfo.TicketBuyPluginId := PluginManager.Open('TLTicketBuy.bpl', PM).PluginId;
          AddLog(Format('Dashboard.LoadPlugin = %s', ['TLTicketBuy.bpl']));
        end;
      finally
        Self.FormStyle := fsNormal;
        FreeAndNil(PM);
        Global.Preparing := False;
        Global.KioskMode := KSM_IDLE;
      end;
    except
      on E: Exception do
      begin
        FWaitingTimer.Enabled := False;
        PushWaitMsg;
        ShowMsgBoxError('장애가 발생하여 프로그램을 시작할 수 없습니다.', E.Message, ['시스템 종료']);
        Application.Terminate;
      end;
    end;
  finally
    Free;
  end;
end;

procedure TPluginForm.OnWaitingTimer(Sender: TObject);
begin
  try
    TTimer(Sender).Enabled := False;
    PushWaitMsg;
    if (Global.StoreInfo.ExposureTypeCode = ATC_NORMAL) then
    begin
      if Global.StoreInfo.ShowTicketingMenu and
         Global.StoreInfo.ShowTicketBuyMenu then
        SendPluginCommand(CPC_SET_FOREGROUND, Self.PluginID, Global.PluginInfo.TicketHomePluginId)
      else
      begin
        if Global.StoreInfo.ShowTicketingMenu then
          SendPluginCommand(CPC_SET_FOREGROUND, Self.PluginID, Global.PluginInfo.TicketingPluginId);
        if Global.StoreInfo.ShowTicketBuyMenu then
          SendPluginCommand(CPC_SET_FOREGROUND, Self.PluginID, Global.PluginInfo.TicketBuyPluginId);
      end;
    end
    else
      SendPluginCommand(CPC_SET_FOREGROUND, Self.PluginID, Global.PluginInfo.MediaPlayerPluginId);
  finally
    TTimer(Sender).Free;
  end;
end;

procedure TPluginForm.OnBarcodeScannerRxChar(Sender: TObject);
var
  PM: TPluginMessage;
  LBuffer, LReadData: string;
  LLen, LPos: Integer;
begin
  if Global.BarcodeScanner.Working then
    Exit;

  Global.BarcodeScanner.Working := True;
  PM := TPluginMessage.Create(nil);
  with TComPort(Sender) do
  try
    LBuffer := ReadAnsiString;
    LLen := Length(LBuffer);
    if (LLen = 0) then
      Exit;

    Global.BarcodeScanner.ReadData := Global.BarcodeScanner.ReadData + LBuffer;
    if (LBuffer[LLen] = _CR) then
    begin
      LReadData := StringReplace(Global.BarcodeScanner.ReadData, _CR, '', [rfReplaceAll]);
      Global.BarcodeScanner.ReadData := '';

{$IFDEF PAYCO_VCAT_PERSIST}
      { PAYCO 결제 상태 }
      if ReceiptInfo.PaycoReady then
      begin
        AddLog(Format('Dashboard.OnBarcodeScannerRxChar.PaycoPin = %s', [LReadData]));
        PaycoModule.SetBarcode(LReadData);
        Exit;
      end;
{$ENDIF}
      { 티켓링크 예매번호: ex) R1410068325NNN ('R': Fixed, NNN: Random Numbers) }
      if not Global.BarcodeScanner.PaycoMode then
      begin
        LReadData := Copy(LReadData, LPos, 14);
        LPos := Pos('R', LReadData);
        if (LPos < 1) then
          Exit;
      end;

      AddLog(Format('Dashboard.OnBarcodeScannerRxChar.Barecode = %s', [LReadData]));
      PM.Command := CPC_SEND_BARCODE;
      PM.AddParams(CPP_VALUE, LReadData);
      PM.PluginMessageToID(Global.BarcodeScanner.OwnerId);
    end;
  finally
    Global.BarcodeScanner.Working := False;
    FreeAndNil(PM);
  end;
end;

procedure TPluginForm.OnNFCReaderRxChar(Sender: TObject);
var
  PM: TPluginMessage;
  LBuffer, LReadData: string;
  LLen: Integer;
begin
  with TComPort(Sender) do
  begin
    LBuffer := ReadAnsiString;
    LLen := Length(LBuffer);
    if (LLen = 0) then
      Exit;

    Global.NFCReader.ReadData := Global.NFCReader.ReadData + LBuffer;
    if (LBuffer[LLen] = _CR) then
    begin
      LReadData := StringReplace(Global.NFCReader.ReadData, _CR, '', [rfReplaceAll]);
      Global.NFCReader.ReadData := '';

      PM := TPluginMessage.Create(nil);
      try
        PM.Command := CPC_SEND_NFC_DATA;
        PM.AddParams(CPP_VALUE, LReadData);
        PM.PluginMessageToID(Global.NFCReader.OwnerId);
      finally
        FreeAndNil(PM);
      end;
    end;
  end;
end;

procedure TPluginForm.OnReceiptPrinterRxChar(Sender: TObject);
var
  LHexData, LBinData: AnsiString;
begin
  with TComPort(Sender) do
  begin
    Global.ReceiptPrinter.ReadData := ReadAnsiString;
    if (Length(Global.ReceiptPrinter.ReadData) = 0) then
      Exit;

    LHexData := StrToHex(Global.ReceiptPrinter.ReadData);
    LBinData := HexToBinStr(LHexData);
    if (Copy(LBinData, 3, 1) = '1') then
    begin
      Global.ReceiptPrinter.ErrorCode := 20;
      Global.ReceiptPrinter.LastError := '용지가 부족하거나 잘못 끼워져 있습니다.';
      Global.ReceiptPrinter.ErrorOccured := True;
    end
    else
    begin
      Global.ReceiptPrinter.ErrorCode := 0;
      Global.ReceiptPrinter.LastError := '';
      Global.ReceiptPrinter.ErrorOccured := False;
    end;
    AddLog('Dashboard.OnReceiptPrinterRxChar.Status = ' + LBinData);
  end;
end;

procedure TPluginForm.OnTicketPrinterRxChar(Sender: TObject);
var
  LHexData, LBinData: AnsiString;
begin
  with TComPort(Sender) do
  begin
    Global.TicketPrinter.ReadData := ReadAnsiString;
    if (Length(Global.TicketPrinter.ReadData) = 0) then
      Exit;

    LHexData := StrToHex(Global.TicketPrinter.ReadData);
    LBinData := HexToBinStr(LHexData);
    if (Copy(LBinData, 3, 1) = '1') then
    begin
      Global.TicketPrinter.ErrorCode := 20;
      Global.TicketPrinter.LastError := '용지가 부족하거나 잘못 끼워져 있습니다.';
    end
    else
    begin
      Global.TicketPrinter.ErrorCode := 0;
      Global.TicketPrinter.LastError := '';
    end;
    AddLog('Dashboard.OnTicketPrinterRxChar.Status = ' + LBinData);
  end;
end;

procedure TPluginForm.ApplyTheme;
begin
  Self.Color := Global.ThemeInfo.Colors.background1;
end;

////////////////////////////////////////////////////////////////////////////////////////////////////

function OpenPlugin(AMsg: TPluginMessage=nil): TPluginModule;
begin
  Result := TPluginForm.Create(Application, AMsg);
end;

exports
  OpenPlugin;
end.