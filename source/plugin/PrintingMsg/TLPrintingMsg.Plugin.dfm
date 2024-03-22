object PluginForm: TPluginForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 750
  ClientWidth = 700
  Color = 3155225
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Noto Sans CJK KR Regular'
  Font.Style = []
  FormStyle = fsStayOnTop
  Position = poOwnerFormCenter
  OnClose = PluginModuleClose
  PluginGroup = 0
  InitHeight = 0
  InitWidth = 0
  EscCanClose = False
  OnMessage = PluginModuleMessage
  TextHeight = 22
  object lblTimeout: TLabel
    Left = 652
    Top = 8
    Width = 40
    Height = 40
    Alignment = taCenter
    AutoSize = False
    Caption = '30'
    Font.Charset = HANGEUL_CHARSET
    Font.Color = 12499640
    Font.Height = -24
    Font.Name = 'Noto Sans CJK KR Regular'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
    Visible = False
  end
  object imgTicketPrinting: TImage
    Left = 60
    Top = 110
    Width = 580
    Height = 300
    Transparent = True
  end
  object imgTicketPrintComplete: TImage
    Left = 270
    Top = 140
    Width = 160
    Height = 160
    Stretch = True
  end
  object lblNotice: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 596
    Width = 700
    Height = 24
    Margins.Bottom = 10
    Alignment = taCenter
    AutoSize = False
    Caption = #54000#53011#51060' '#52636#47141#46104#51648' '#50506#51012' '#44221#50864' '#47588#54364#49548#50640' '#47928#51032#54616#50668' '#51452#49464#50836'.'
    Color = 3155225
    Font.Charset = HANGEUL_CHARSET
    Font.Color = 11117471
    Font.Height = -16
    Font.Name = 'Noto Sans CJK KR Regular'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = False
    Layout = tlCenter
  end
  object panButtonContainer: TPanel
    Left = 0
    Top = 630
    Width = 700
    Height = 120
    Align = alBottom
    BevelOuter = bvNone
    Color = 3155225
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    object btnHome: TcxButton
      Tag = 5
      AlignWithMargins = True
      Left = 0
      Top = 0
      Width = 700
      Height = 120
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      Caption = #52376#51020#51004#47196
      Colors.Normal = 5848878
      Colors.NormalText = 15854568
      Colors.Pressed = 7165510
      Colors.PressedText = 15854568
      Colors.Disabled = 3945259
      Colors.DisabledText = 5062970
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      SpeedButtonOptions.CanBeFocused = False
      TabOrder = 0
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -32
      Font.Name = 'Noto Sans CJK KR Bold'
      Font.Style = []
      ParentFont = False
      WordWrap = True
      OnClick = btnHomeClick
    end
  end
  object panMessage: TPanel
    Left = 60
    Top = 416
    Width = 580
    Height = 174
    Margins.Left = 5
    BevelOuter = bvNone
    TabOrder = 1
    object lblMessage2: TLabel
      Left = 0
      Top = 47
      Width = 580
      Height = 126
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = #51104#49884#47564' '#44592#45796#47140' '#51452#49464#50836'.'
      Color = 3155225
      Font.Charset = HANGEUL_CHARSET
      Font.Color = 11117471
      Font.Height = -24
      Font.Name = 'Noto Sans CJK KR Regular'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
    end
    object lblMessage1: TLabel
      Left = 0
      Top = 0
      Width = 580
      Height = 47
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = #54000#53011#51012' '#52636#47141' '#51473#51077#45768#45796'.'
      Color = 3155225
      Font.Charset = HANGEUL_CHARSET
      Font.Color = 15198183
      Font.Height = -32
      Font.Name = 'Noto Sans CJK KR Bold'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
    end
  end
  object tmrTimeout: TTimer
    Enabled = False
    OnTimer = tmrTimeoutTimer
    Left = 72
    Top = 24
  end
end
