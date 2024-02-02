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
  Position = poOwnerFormCenter
  OnClose = PluginModuleClose
  PluginGroup = 0
  InitHeight = 0
  InitWidth = 0
  EscCanClose = False
  OnMessage = PluginModuleMessage
  TextHeight = 22
  object imgPaymentCard: TImage
    Left = 60
    Top = 288
    Width = 580
    Height = 300
    AutoSize = True
    Transparent = True
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
    object btnClose: TcxButton
      Tag = 1
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
      Caption = #52712#49548
      Colors.Normal = 5848878
      Colors.NormalText = 15854568
      Colors.Pressed = 7165510
      Colors.PressedText = 15854568
      Colors.Disabled = 3945259
      Colors.DisabledText = 5062970
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      ModalResult = 1
      SpeedButtonOptions.CanBeFocused = False
      TabOrder = 0
      Visible = False
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -32
      Font.Name = 'Noto Sans CJK KR Bold'
      Font.Style = []
      ParentFont = False
      WordWrap = True
      OnClick = btnCloseClick
    end
  end
  object panMessage: TPanel
    Left = 60
    Top = 80
    Width = 580
    Height = 202
    Margins.Left = 5
    BevelOuter = bvNone
    TabOrder = 1
    object lblMessage1: TLabel
      Left = 0
      Top = 125
      Width = 580
      Height = 36
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Color = 3155225
      Font.Charset = HANGEUL_CHARSET
      Font.Color = 11117471
      Font.Height = -24
      Font.Name = 'Noto Sans CJK KR Regular'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      WordWrap = True
      ExplicitTop = 130
      ExplicitWidth = 5
    end
    object lblMessage2: TLabel
      Left = 0
      Top = 161
      Width = 580
      Height = 36
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Color = 3155225
      Font.Charset = HANGEUL_CHARSET
      Font.Color = 15198183
      Font.Height = -24
      Font.Name = 'Noto Sans CJK KR Regular'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      WordWrap = True
      ExplicitTop = 166
      ExplicitWidth = 5
    end
    object lblRemainTime: TLabel
      Left = 0
      Top = 47
      Width = 580
      Height = 78
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Color = 3155225
      Font.Charset = HANGEUL_CHARSET
      Font.Color = 2631930
      Font.Height = -53
      Font.Name = 'Noto Sans CJK KR Bold'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      WordWrap = True
      ExplicitTop = 53
    end
    object lblFormTitle: TLabel
      Left = 0
      Top = 0
      Width = 580
      Height = 47
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = #49888#50857#52852#46300' '#44208#51228
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
      ExplicitWidth = 183
    end
  end
  object tmrTimeout: TTimer
    Enabled = False
    Interval = 100
    OnTimer = tmrTimeoutTimer
    Left = 24
    Top = 16
  end
end
