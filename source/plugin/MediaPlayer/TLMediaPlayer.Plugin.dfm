object PluginForm: TPluginForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 607
  ClientWidth = 1080
  Color = 3355443
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Noto Sans CJK KR Regular'
  Font.Style = []
  Position = poDefault
  OnClose = PluginModuleClose
  PluginGroup = 0
  InitHeight = 0
  InitWidth = 0
  EscCanClose = False
  OnMessage = PluginModuleMessage
  TextHeight = 22
  object imgLogo: TImage
    Left = 0
    Top = 0
    Width = 1080
    Height = 607
    AutoSize = True
    Enabled = False
    Visible = False
  end
  object imgLogoFull: TImage
    Left = 0
    Top = 0
    Width = 1080
    Height = 1920
    AutoSize = True
    Enabled = False
    Visible = False
  end
  object VideoPlayer: TVideoGrabber
    Left = 0
    Top = 0
    Width = 1080
    Height = 607
    Align = alClient
    Color = 3355443
    AnalogVideoStandard = 0
    AspectRatioToUse = -1.000000000000000000
    AudioCompressor = 0
    AudioInput = 0
    AutoFileNameDateTimeFormat = 'yymmdd_hhmmss_zzz'
    AutoFilePrefix = 'vg'
    BackgroundColor = 3355443
    BorderStyle = bsNone
    Cropping_Zoom = 1.000000000000000000
    ImageOverlayEnabled = False
    ImageOverlay_AlphaBlend = False
    ImageOverlay_AlphaBlendValue = 180
    ImageOverlay_ChromaKey = False
    ImageOverlay_ChromaKeyLeewayPercent = 25
    ImageOverlay_ChromaKeyRGBColor = 0
    ImageOverlay_Height = -1
    ImageOverlay_LeftLocation = 10
    ImageOverlay_VideoAlignment = oa_LeftTop
    ImageOverlay_StretchToVideoSize = False
    ImageOverlay_TopLocation = 10
    ImageOverlay_Transparent = False
    ImageOverlay_TransparentColorValue = 0
    ImageOverlay_UseTransparentColor = False
    ImageOverlay_Width = -1
    ImageOverlay_TargetDisplay = -1
    LicenseString = 'N/A'
    LogoLayout = lg_Centered
    MotionDetector_Grid = 
      '5555555555 5555555555 5555555555 5555555555 5555555555 555555555' +
      '5 5555555555 5555555555 5555555555 5555555555'
    NDIName = 'DATASTEAD_UNNAMED_SOURCE'
    PlayerSpeedRatio = 1.000000000000000000
    TextOverlay_Enabled = False
    TextOverlay_Font.Charset = HANGEUL_CHARSET
    TextOverlay_Font.Color = clAqua
    TextOverlay_Font.Height = -16
    TextOverlay_Font.Name = 'Noto Sans CJK KR Regular'
    TextOverlay_Font.Style = []
    TextOverlay_FontColor = clAqua
    TextOverlay_FontSize = 12
    TextOverlay_HighResFont = True
    TextOverlay_Left = 0
    TextOverlay_Top = 0
    TextOverlay_Right = -1
    TextOverlay_Orientation = to_Horizontal
    TextOverlay_Scrolling = False
    TextOverlay_ScrollingSpeed = 1
    TextOverlay_Shadow = True
    TextOverlay_ShadowColor = clBlack
    TextOverlay_ShadowDirection = cd_SouthEast
    TextOverlay_BkColor = clWhite
    TextOverlay_Align = tf_Left
    TextOverlay_AlphaBlend = False
    TextOverlay_AlphaBlendValue = 180
    TextOverlay_GradientMode = gm_Disabled
    TextOverlay_GradientColor = clNavy
    TextOverlay_VideoAlignment = oa_LeftTop
    TextOverlay_String = 
      'Note: the date/time formats '#13#10'can be easily modified.'#13#10#13#10'system ' +
      'date/time: %sys_time[dd/mm/yy hh:nn:ss]%'#13#10'DV time code: %time_co' +
      'de%'#13#10'DV date/time: %dv_time[dd/mm/yy hh:nn:ss]%'#13#10'frame number: %' +
      'frame_count%'#13#10'time (full): %time_full%'#13#10'time (sec): %time_sec%'#13#10 +
      'time (ns): %time_100ns%'
    TextOverlay_TargetDisplay = -1
    TextOverlay_Transparent = True
    v360_AspectRatio = -1.000000000000000000
    VideoCompression_Quality = 1.000000000000000000
    VideoCompressor = 0
    VideoDelay = 0
    VideoFormat = 0
    VideoFromImages_TemporaryFile = 'SetOfBitmaps01.dat'
    VideoInput = 0
    VideoProcessing_RotationCustomAngle = 45.500000000000000000
    VideoSize = 0
    StreamInterface_Format = 'mpegts'
    StreamInterface_IsRealTime = True
    VideoSubtype = 0
    OnLog = OnVideoPlayerLog
    OnMouseUp = OnVideoPlayerMouseUp
    OnNoVideoDevices = OnVideoPlayerNoVideoDevices
    OnPlayerStateChanged = OnVideoPlayerPlayerStateChanged
  end
  object SlideShow: TPicShow
    Left = 0
    Top = 0
    Width = 1080
    Height = 607
    Align = alClient
    AutoSize = True
    BevelInner = bvNone
    BevelOuter = bvNone
    BgMode = bmCentered
    Center = True
    Color = 3355443
    ParentColor = False
    Proportional = True
    TabOrder = 0
    OnMouseUp = OnSlideShowMouseUp
  end
end
