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
  end
  object imgPaymentComplete: TImage
    Left = 60
    Top = 94
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
    object btnOK: TcxButton
      Tag = 1
      AlignWithMargins = True
      Left = 350
      Top = 0
      Width = 350
      Height = 120
      Margins.Left = 1
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Caption = #50696
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
      OnClick = btnOKClick
    end
    object btnCancel: TcxButton
      Tag = 5
      AlignWithMargins = True
      Left = 0
      Top = 0
      Width = 349
      Height = 120
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Caption = #50500#45768#50724
      Colors.Normal = 5848878
      Colors.NormalText = 15854568
      Colors.Pressed = 7165510
      Colors.PressedText = 15854568
      Colors.Disabled = 3945259
      Colors.DisabledText = 5062970
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      SpeedButtonOptions.CanBeFocused = False
      TabOrder = 1
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -32
      Font.Name = 'Noto Sans CJK KR Bold'
      Font.Style = []
      ParentFont = False
      WordWrap = True
      OnClick = btnCancelClick
    end
  end
  object panMessage: TPanel
    Left = 60
    Top = 450
    Width = 580
    Height = 86
    Margins.Left = 5
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 1
    object lblMessage: TLabel
      Left = 0
      Top = 50
      Width = 282
      Height = 36
      Align = alTop
      Alignment = taCenter
      Caption = #50689#49688#51613#51012' '#52636#47141#54616#49884#44192#49845#45768#44620'?'
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
    end
    object lblFormTitle: TLabel
      Left = 0
      Top = 0
      Width = 580
      Height = 50
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = #44208#51228#44032' '#50756#47308' '#46104#50632#49845#45768#45796'.'
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
      ExplicitWidth = 583
    end
  end
  object tmrTimeout: TTimer
    Enabled = False
    OnTimer = tmrTimeoutTimer
    Left = 72
    Top = 24
  end
end
