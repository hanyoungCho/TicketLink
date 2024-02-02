unit TLMediaPlayer.Plugin;

interface

uses
  { Native }
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Forms, Vcl.Controls,
  Vcl.StdCtrls, Vcl.ExtCtrls,
  { Plugin System }
  uPluginManager, uPluginModule, uPluginMessages,
  { VideoGrabber }
  VidGrab,
  { SolbiLib }
  PicShow, dxGDIPlusClasses, Vcl.Imaging.jpeg, Vcl.Imaging.pngimage;

{$I ..\..\common\Common.TLGlobal.inc}

type
  TPluginForm = class(TPluginModule)
    SlideShow: TPicShow;
    imgLogo: TImage;
    imgLogoFull: TImage;
    VideoPlayer: TVideoGrabber;

    procedure PluginModuleClose(Sender: TObject; var Action: TCloseAction);
    procedure PluginModuleMessage(Sender: TObject; AMsg: TPluginMessage);
    procedure OnChangeActiveMediaThread(Sender: TObject);
    procedure OnChangeContentMediaThread(Sender: TObject);
    procedure OnVideoPlayerLog(Sender: TObject; LogType: TLogType; Severity, InfoMsg: string);
    procedure OnVideoPlayerPlayerStateChanged(Sender: TObject; OldPlayerState, NewPlayerState: TPlayerState);
    procedure OnVideoPlayerMouseUp(Sender: TObject; VideoWindow: Integer; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure OnVideoPlayerNoVideoDevices(Sender: TObject);
    procedure OnSlideShowMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    FOwnerID: Integer;
    FMinHeight: Integer;
    FHitCount: Integer;
    FWorking: Boolean;
    FLastTouched: TDateTime;

    procedure ProcessMessages(AMsg: TPluginMessage);
    procedure CheckHitCount;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; AMsg: TPluginMessage=nil); override;
    destructor Destroy; override;
  end;

implementation

uses
  { Native }
  System.StrUtils, System.DateUtils,
  { Project }
  Common.TLGlobal, Common.TLCommonLib, Common.MediaPlayThread, Common.TLAdminCheck, Common.TLMsgBox;

var
  MediaPlayThread: TMediaPlayThread;

{$R *.dfm}

{ TPluginForm }

constructor TPluginForm.Create(AOwner: TComponent; AMsg: TPluginMessage);
begin
  inherited Create(AOwner, AMsg);

  FOwnerID := 0;
  FHitCount := 0;
  FMinHeight := Self.Height;
  FLastTouched := Now;

  SetDoubleBuffered(Self, True);
  Self.Top := Global.BaseScreenTop;
  Self.Left := Global.BaseScreenLeft;
  Self.Width := Global.BaseScreenWidth;
  Self.Height := Global.BaseScreenHeight;

  StreamToPicture(imgLogo.Picture, Global.ThemeInfo.Images.img_player_back.Stream);
  StreamToPicture(imgLogoFull.Picture, Global.ThemeInfo.Images.img_player_back_full.Stream);
  SlideShow.BgPicture.Assign(imgLogo.Picture);
  with VideoPlayer do
  begin
    LicenseString := CCC_LIC_VIDEOGRABBER_KEY;
    DoubleBuffered := True;
    Display_Embedded := True;
    Display_AspectRatio := TAspectRatio.ar_Stretch; //ar_PanScan; //ar_Box;
    PlayerAudioRendering := False; //오디오 출력 안함
    TextOverlay_String := '';
    TextOverlay_Enabled := True;
    AutoStartPlayer := True;
    SetLogoFromTImage(imgLogo);
    LogoDisplayed := True;
  end;

  if (Global.MainContentList.Count = 0) then
    AddContent(Global.MainContentList, 0, '', Global.ContentsDir + 'dummyimage_Top_DK.mp4', 0, False, Global.LastDate, '000000', Global.NextDate, '235959');
  if (Global.IdleContentList.Count = 0) then
    AddContent(Global.IdleContentList, 0, '', Global.ContentsDir + 'dummyimage_Full_DK.mp4', 0, False, Global.LastDate, '000000', Global.NextDate, '235959');

  MediaPlayThread := TMediaPlayThread.Create(True, SlideShow, VideoPlayer);
  MediaPlayThread.TransitionEffectStyle := Global.TransitionEffectStyle;
  MediaPlayThread.Contents := Global.IdleContentList;
  MediaPlayThread.OnChangeActive := OnChangeActiveMediaThread;
  MediaPlayThread.OnChangeContent := OnChangeContentMediaThread;
  MediaPlayThread.Start;

  if Assigned(AMsg) then
    ProcessMessages(AMsg);
end;

destructor TPluginForm.Destroy;
begin
  MediaPlayThread.Terminate;
  VideoPlayer.ClosePlayer;
  SlideShow.Stop;

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
var
  LValue: Integer;
begin
  if (AMsg.Command = CPC_INIT) then
    FOwnerID := AMsg.ParamByInteger(CPP_OWNER_ID);

  if (AMsg.Command = CPC_SET_KIOSK_MODE) then
  begin
    LValue := AMsg.ParamByInteger(CPP_VALUE);
    case LValue of
      KSM_IDLE: //유휴 상태
        begin
          if MediaPlayThread.Active then
            MediaPlayThread.Active := False;

          if (Global.StoreInfo.ExposureTypeCode = ATC_NORMAL) then
            MediaPlayThread.Contents := Global.MainContentList
          else if (Global.StoreInfo.ExposureTypeCode = ATC_FULL) then
            MediaPlayThread.Contents := Global.IdleContentList;

          if (Global.StoreInfo.ExposureTypeCode = ATC_NORMAL) then
          begin
            Self.Height := FMinHeight;
            SlideShow.BgPicture.Assign(imgLogo.Picture);
            VideoPlayer.SetLogoFromTImage(imgLogo);
          end
          else if (Global.StoreInfo.ExposureTypeCode = ATC_FULL) then
          begin
            Self.Height := Global.BaseScreenHeight;
            SlideShow.BgPicture.Assign(imgLogoFull.Picture);
            VideoPlayer.SetLogoFromTImage(imgLogoFull);
          end;

          if not MediaPlayThread.Active then
            MediaPlayThread.Active := True;

          SetForegroundWindow(Self.Handle);
        end;
      KSM_HOME, //티켓 홈
      KSM_TICKETING_HOME, //예매티켓 발권
      KSM_BUY_HOME: //티켓 구매(상품 선택)
        begin
          SlideShow.Clear;
          if MediaPlayThread.Active then
            MediaPlayThread.Active := False;
          MediaPlayThread.Contents := Global.MainContentList;

          Self.Height := FMinHeight;
          if not MediaPlayThread.Active then
            MediaPlayThread.Active := True;
          SetForegroundWindow(Self.Handle);
        end;
      KSM_BUY_ROUND, //티켓 구매(회차 선택)
      KSM_BUY_DENOMIN, //티켓 구매(권종 선택)
      KSM_BUY_PAYMENT: //티켓 구매(결제)
        if MediaPlayThread.Active then
          MediaPlayThread.Active := False;
    end;
  end;

  if (AMsg.Command = CPC_SET_FOREGROUND) then
    SetForegroundWindow(Self.Handle);
end;

procedure TPluginForm.OnChangeActiveMediaThread(Sender: TObject);
begin
  with TMediaPlayThread(Sender) do
    AddLog(Format('MediaPlayer.MediaThread.Playback = %s', [IfThen(Active, '시작', '중지')]));
end;

procedure TPluginForm.OnChangeContentMediaThread(Sender: TObject);
var
  LIndex: Integer;
begin
  with TMediaPlayThread(Sender) do
  begin
    LIndex := ItemIndex;
    if (LIndex >= 0) then
      AddLog(Format('MediaPlayer.MediaThread.ChangeContents = %s (%d Secs.)', [PContentInfo(Contents[LIndex])^.FileName, PContentInfo(Contents[LIndex])^.PlayTime]));
  end;
end;

procedure TPluginForm.OnVideoPlayerLog(Sender: TObject; LogType: TLogType; Severity, InfoMsg: string);
begin
  if (LogType in [TLogType.e_failed, TLogType.e_failed_to_open_player]) then
  begin
    try
      MediaPlayThread.Active := False;
      AddLog(Format('MediaPlayer.VideoPlayer.Exception = %s', [InfoMsg]));
    finally
      MediaPlayThread.Active := True;
    end;
  end;
end;

procedure TPluginForm.OnVideoPlayerNoVideoDevices(Sender: TObject);
begin
  try
    MediaPlayThread.Active := False;
    AddLog('MediaPlayer.VideoPlayer.Exception = No Video Device Detected');
  finally
    MediaPlayThread.Active := True;
  end;
end;

procedure TPluginForm.OnVideoPlayerPlayerStateChanged(Sender: TObject; OldPlayerState, NewPlayerState: TPlayerState);
begin
  if (OldPlayerState = ps_Playing) and
     (NewPlayerState in [ps_Closed, ps_Paused, ps_Stopped]) then
    if (MediaPlayThread.Contents.Count = 1) then
      VideoPlayer.RunPlayer
    else
      MediaPlayThread.VideoPlaying := False;
end;

procedure TPluginForm.OnVideoPlayerMouseUp(Sender: TObject; VideoWindow: Integer; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  CheckHitCount;
end;

procedure TPluginForm.OnSlideShowMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  CheckHitCount;
end;

procedure TPluginForm.CheckHitCount;
begin
  if FWorking then
    Exit;

  FWorking := True;
  try
    if (Global.KioskMode = KSM_IDLE) then
    begin
      FHitCount := 0;
      MediaPlayThread.Active := False;
      Global.KioskMode := KSM_HOME;
    end
    else
    begin
      if (SecondsBetween(FLastTouched, Now) > 10) then
        FHitCount := 0;

      FLastTouched := Now;
      Inc(FHitCount);
      if (FHitCount > 4) then
      begin
        FHitCount := 0;
        MediaPlayThread.Active := False;
        if not ShowAdminPanel(Self.PluginID, False) then
          MediaPlayThread.Active := True;
      end;
    end;
  finally
    FWorking := False;
  end;
end;

////////////////////////////////////////////////////////////////////////////////////////////////////

function OpenPlugin(AMsg: TPluginMessage=nil): TPluginModule;
begin
  Result := TPluginForm.Create(Application, AMsg);
end;

exports
  OpenPlugin;
end.