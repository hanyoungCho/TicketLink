{$M+}
unit Common.MediaPlayThread;

interface

uses
  { Native }
  System.SysUtils, System.Classes,
  { SolbiLib }
  PicShow, VidGrab;

type
  { 미디어 콘텐츠 정보 }
  PContentInfo = ^TContentInfo;
  TContentInfo = record
    SortOrd: Integer; //재생순서
    FileUrl: string; //미디어 파일 다운로드 URL
    FileName: string; //미디어 파일명
    PlayTime: Integer; //재생시간(초)
    Stretch: Boolean; //이미지 스트레칭 처리 여부
    StartDate: string; //시작일자(yyyymmdd)
    EndDate: string; //종료일자(yyyymmdd)
    StartTime: string; //시작시작(hhnnss)
    EndTime: string; //종료시각(hhnnss)
  end;

  { 미디어 콘텐츠 재생 쓰레드 }
  TMediaPlayThread = class(TThread)
  private
    FActive: Boolean;
    FContents: TList;
    FPicShow: TPicShow;
    FVideoPlayer: TVideoGrabber;
    //FAudioVolume: Integer; //오디오 출력 크기
    FTransitionEffectStyle: Integer;
    FOnChangeActive: TNotifyEvent;
    FOnChangeContent: TNotifyEvent;
    FItemIndex: Integer;
    FInterval: Integer; //밀리초
    FLastWorked: TDateTime;
    FVideoPlaying: Boolean;
    FIsFirst: Boolean;

    procedure DoPlay;
    procedure SetActive(const AValue: Boolean);
    procedure SetContents(const AList: TList);
    //procedure SetAudioVolume(const AAudioVolume: Integer);
  protected
    procedure Execute; override;
  published
    constructor Create(const ACreateSuspended: Boolean; APicShow: TPicShow; AVideoGrabber: TVideoGrabber);
    destructor Destroy; override;
  public
    property Active: Boolean read FActive write SetActive default False;
    property Contents: TList read FContents write SetContents;
    property ItemIndex: Integer read FItemIndex write FItemIndex default -1;
//    property AudioVolume: Integer read FAudioVolume write SetAudioVolume;
    property VideoPlaying: Boolean read FVideoPlaying write FVideoPlaying default False;
    property TransitionEffectStyle: Integer read FTransitionEffectStyle write FTransitionEffectStyle default 0;
    property OnChangeActive: TNotifyEvent read FOnChangeActive write FOnChangeActive;
    property OnChangeContent: TNotifyEvent read FOnChangeContent write FOnChangeContent;
  end;

procedure ClearContents(AList: TList);
procedure AddContent(AList: TList; const ASortOrd: Integer; const AFileUrl, AFileName: string;
  const APlayTime: Integer; const AStretch: Boolean; const AStartDate, AStartTime, AEndDate, AEndTime: string);

implementation

uses
  { Native }
  Winapi.Windows, System.Math, System.DateUtils,
  { Project }
  Common.TLGlobal;

{ TMediaPlayThread }

constructor TMediaPlayThread.Create(const ACreateSuspended: Boolean; APicShow: TPicShow; AVideoGrabber: TVideoGrabber);
begin
  inherited Create(ACreateSuspended);

  FreeOnTerminate := True;
  if Assigned(AVideoGrabber) then
    FVideoPlayer := AVideoGrabber;
  if Assigned(APicShow) then
    FPicShow := APicShow;

  Active := True;
  ItemIndex := -1;
  FInterval := 1000;
  FLastWorked := Now;
  FIsFirst := True;
end;

destructor TMediaPlayThread.Destroy;
begin

  inherited;
end;

procedure TMediaPlayThread.SetActive(const AValue: Boolean);
begin
  FActive := AValue;
  if not FActive then
  begin
    FVideoPlayer.StopPlayer;
    FVideoPlayer.ClosePlayer;
    FVideoPlayer.PlayerFileName := '';
    VideoPlaying := False;
    FInterval := 0;
    FPicShow.Stop;
    FPicShow.Clear;
    FPicShow.BringToFront;
  end;

  if Assigned(FOnChangeActive) then
    FOnChangeActive(Self);
end;

//procedure TMediaPlayThread.SetAudioVolume(const AAudioVolume: Integer);
//begin
//  if (FAudioVolume <> AAudioVolume) then
//  begin
//    FAudioVolume := AAudioVolume;
//    FVideoPlayer.AudioVolume := Trunc(FAudioVolume * (MaxWord / 100));
//  end;
//end;

procedure TMediaPlayThread.SetContents(const AList: TList);
begin
  try
    SuspendThread(Self.Handle);
    FContents := AList;
    ItemIndex := -1;
  finally
    ResumeThread(Self.Handle);
  end;
end;

procedure TMediaPlayThread.Execute;
var
  LLastMSecs: Integer;
begin
  inherited;

  repeat
    if Active and
       Assigned(Contents) and
       (Contents.Count > 0) and
       (not VideoPlaying) then
    begin
      if (MilliSecondsBetween(FLastWorked, Now) >= FInterval) then
      begin
        FLastWorked := Now;
        Synchronize(DoPlay);
      end;
    end;

    WaitForSingleObject(Handle, 100);
  until Terminated;
end;

procedure TMediaPlayThread.DoPlay;
var
  LFileName, LFileExt, LCurrDate, LCurrTime, LStartDate, LEndDate, LStartTime, LEndTime: string;
  LStretch, LChanged: Boolean;
  LPlayTime, LStyle: Integer;
begin
  try
    if (Contents.Count = 0) then
      Exit;
    ItemIndex := ItemIndex + 1;
    if (ItemIndex >= Contents.Count) then
      ItemIndex := 0;
    LFileName := PContentInfo(Contents[ItemIndex])^.FileName;
    if (not FileExists(LFileName)) then
      Exit;
    LCurrDate := FormatDateTime('yyyymmdd', Now);
    LCurrTime := FormatDateTime('hhnnss', Now);
    LStartDate := PContentInfo(Contents[ItemIndex])^.StartDate;
    LEndDate := PContentInfo(Contents[ItemIndex])^.EndDate;
    LStartTime := PContentInfo(Contents[ItemIndex])^.StartTime;
    LEndTime := PContentInfo(Contents[ItemIndex])^.EndTime;
    if ((not LStartDate.IsEmpty) and (LStartDate > LCurrDate)) or
       ((not LEndDate.IsEmpty) and (LEndDate < LCurrDate)) or
       ((not LStartTime.IsEmpty) and (LStartTime > LCurrTime)) or
       ((not LEndTime.IsEmpty) and (LEndTime < LCurrTime)) then
    begin
      FPicShow.Stop;
      FPicShow.BringToFront;
      Exit;
    end;

    LChanged := False;
    LStretch := PContentInfo(Contents[FItemIndex])^.Stretch;
    LPlayTime := PContentInfo(Contents[FItemIndex])^.PlayTime;
    if (LPlayTime < 3) then //이미지 노출 시간은 최소 3초
      LPlayTime := 3;
    FInterval := (LPlayTime * 1000);
    LFileExt := LowerCase(ExtractFileExt(LFileName));
    if (LFileExt = '.jpg') or
       (LFileExt = '.png') then
    begin
      if FIsFirst then
      begin
        FIsFirst := False;
        LStyle := 0;
      end
      else
      begin
        LStyle := TransitionEffectStyle;
        if (LStyle = 0) then
        begin
          Randomize;
          LStyle := RandomRange(1, 176);
        end;
      end;

      try
        FPicShow.Stop;
        FPicShow.Stretch := LStretch;
        FPicShow.Picture.LoadFromFile(LFileName);
        FPicShow.Style := TShowStyle(LStyle);
        LChanged := True;
      finally
        FPicShow.Execute;
        FPicShow.BringToFront;
        FVideoPlayer.ClosePlayer;
        FVideoPlayer.PlayerFileName := '';
      end;
    end
    else if (LFileExt = '.avi') or
            (LFileExt = '.mkv') or
            (LFileExt = '.mp4') or
            (LFileExt = '.mpg') or
            (LFileExt = '.wmv') then
    begin
      try
        if (FVideoPlayer.PlayerFileName <> LFileName) then
        begin
          FVideoPlayer.StopPlayer;
          FVideoPlayer.ClosePlayer;
//          FVideoPlayer.AudioDeviceRendering := False;
//          FVideoPlayer.AudioVolume := Trunc(AudioVolume * (MaxWord / 100));
//          FVideoPlayer.AudioDeviceRendering := (FVideoPlayer.AudioVolume > 0);
          FVideoPlayer.PlayerFileName := LFileName;
          FVideoPlayer.OpenPlayer;
          LChanged := True;
        end;
      finally
        FVideoPlayer.RunPlayer;
        FVideoPlayer.BringToFront;
        VideoPlaying := True;
        FPicShow.Stop;
      end;
    end;

    if LChanged and
       Assigned(FOnChangeContent) then
      FOnChangeContent(Self);
  except
    on E: Exception do;
  end;
end;

procedure ClearContents(AList: TList);
var
  CI: PContentInfo;
  I: Integer;
begin
  with AList do
  try
    for I := Pred(Count) downto 0 do
    begin
      CI := Items[I];
      if (CI <> nil) then
        Dispose(CI);
    end;
  finally
    Clear;
  end;
end;

procedure AddContent(AList: TList; const ASortOrd: Integer; const AFileUrl, AFileName: string;
  const APlayTime: Integer; const AStretch: Boolean; const AStartDate, AStartTime, AEndDate, AEndTime: string);
var
  CI: PContentInfo;
begin
  New(CI);
  with CI^ do
  try
    SortOrd := ASortOrd;
    FileUrl := AFileUrl;
    FileName := AFileName;
    PlayTime := APlayTime;
    Stretch := AStretch;
    StartDate := AStartDate;
    StartTime := AStartTime;
    EndDate := AEndDate;
    EndTime := AEndTime;
    AList.Add(CI);
  except
    Dispose(CI);
  end;
end;

end.
