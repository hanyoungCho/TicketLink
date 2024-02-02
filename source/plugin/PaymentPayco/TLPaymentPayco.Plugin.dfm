object PluginForm: TPluginForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 995
  ClientWidth = 700
  Color = 3155225
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Noto Sans CJK KR Regular'
  Font.Style = []
  KeyPreview = True
  Position = poOwnerFormCenter
  OnActivate = PluginModuleActivate
  OnClose = PluginModuleClose
  OnKeyDown = PluginModuleKeyDown
  PluginGroup = 0
  InitHeight = 0
  InitWidth = 0
  EscCanClose = False
  OnMessage = PluginModuleMessage
  TextHeight = 22
  object imgPaymentPayco: TImage
    Left = 60
    Top = 348
    Width = 580
    Height = 300
    AutoSize = True
    Transparent = True
  end
  object panButtonContainer: TPanel
    Left = 0
    Top = 875
    Width = 700
    Height = 120
    Align = alBottom
    BevelOuter = bvNone
    Color = 3155225
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    object btnPaycoPinInput: TcxButton
      Tag = 1
      AlignWithMargins = True
      Left = 301
      Top = 0
      Width = 399
      Height = 120
      Margins.Left = 1
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      Caption = #48148#53076#46300' '#49707#51088#47196' '#51077#47141#54616#44592
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
      OnClick = btnPaycoPinInputClick
    end
    object btnCancel: TcxButton
      Tag = 1
      AlignWithMargins = True
      Left = 0
      Top = 0
      Width = 300
      Height = 120
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Caption = #52712#49548
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
  object panMessage1: TPanel
    Left = 60
    Top = 80
    Width = 580
    Height = 202
    Margins.Left = 5
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 1
    object lblMessage1: TLabel
      Left = 0
      Top = 130
      Width = 269
      Height = 36
      Align = alTop
      Alignment = taCenter
      Caption = 'PAYCO '#50545#51032' '#44208#51228' '#48148#53076#46300#47484
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
    object lblMessage2: TLabel
      Left = 0
      Top = 166
      Width = 292
      Height = 36
      Align = alTop
      Alignment = taCenter
      Caption = #48148#53076#46300' '#49828#52880#45320#50640' '#51069#54784' '#51452#49464#50836'.'
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
    end
    object lblRemainTime: TLabel
      Left = 0
      Top = 50
      Width = 580
      Height = 80
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = '10'
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
    end
    object lblFormTitle: TLabel
      Left = 0
      Top = 0
      Width = 580
      Height = 50
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = 'PAYCO '#44208#51228
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
  object panMessage2: TPanel
    Left = 60
    Top = 674
    Width = 580
    Height = 160
    Margins.Left = 5
    BevelOuter = bvNone
    TabOrder = 2
    object lblMessage4: TLabel
      Left = 0
      Top = 47
      Width = 496
      Height = 72
      Align = alClient
      Alignment = taCenter
      Caption = 'PAYCO '#50545' '#49892#54665' > '#44208#51228' > '#44208#51228#49688#45800' '#49440#53469' '#54980#13#10#44208#51228#54616#44592' '#49440#53469' > '#48708#48128#48264#54840' '#51077#47141' > '#44208#51228' '#48148#53076#46300' '#54869#51064
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
    object lblMessage3: TLabel
      Left = 0
      Top = 0
      Width = 221
      Height = 47
      Align = alTop
      Alignment = taCenter
      Caption = #48148#53076#46300' '#54869#51064' '#48169#48277
      Color = 3155225
      Font.Charset = HANGEUL_CHARSET
      Font.Color = 15198183
      Font.Height = -32
      Font.Name = 'Noto Sans CJK KR Medium'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
    end
  end
  object tmrRemainTime: TTimer
    Enabled = False
    OnTimer = tmrRemainTimeTimer
    Left = 72
    Top = 24
  end
end
