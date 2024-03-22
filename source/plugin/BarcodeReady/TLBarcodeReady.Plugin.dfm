object PluginForm: TPluginForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 927
  ClientWidth = 700
  Color = 3155225
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Noto Sans CJK KR Regular'
  Font.Style = []
  Position = poOwnerFormCenter
  OnActivate = PluginModuleActivate
  OnClose = PluginModuleClose
  OnDeactivate = PluginModuleDeactivate
  PluginGroup = 0
  InitHeight = 0
  InitWidth = 0
  EscCanClose = False
  OnMessage = PluginModuleMessage
  TextHeight = 22
  object imgBarcodeReady: TImage
    Left = 60
    Top = 360
    Width = 580
    Height = 300
    AutoSize = True
    Transparent = True
  end
  object lblBarcodeNotice1: TLabel
    Left = 98
    Top = 149
    Width = 505
    Height = 149
    Alignment = taCenter
    AutoSize = False
    Caption = 
      #50696#47588#49345#49464#45236#50669' '#46608#45716' '#55092#45824#54256#51004#47196' '#51204#49569#46108#13#10#48148#53076#46300#47484' '#50864#52769' '#54616#45800#51032' '#48148#53076#46300' '#49828#52880#45320#50640#13#10#51069#54784' '#51452#49464#50836'.'#13#10#55092#45824#54256', '#50696#47588#48264#54840#47196' '#51312 +
      #54924#54616#47140#47732
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
  object lblBarcodeNotice2: TLabel
    Left = 118
    Top = 301
    Width = 465
    Height = 36
    Alignment = taCenter
    AutoSize = False
    Caption = '['#45803#44592'] '#48260#53948#51012' '#49440#53469#54644' '#51452#49464#50836'.'
    Color = 3155225
    Font.Charset = HANGEUL_CHARSET
    Font.Color = 15198183
    Font.Height = -24
    Font.Name = 'Noto Sans CJK KR Regular'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = False
    Layout = tlCenter
    WordWrap = True
  end
  object lblBarcodeNotice3: TLabel
    Left = 98
    Top = 666
    Width = 505
    Height = 127
    Alignment = taCenter
    AutoSize = False
    Caption = #48148#53076#46300#44032' '#51069#55176#51648' '#50506#51012' '#44221#50864' '#54868#47732' '#48157#44592#47484' '#52572#45824#47196#13#10#48320#44221' '#54980' '#45796#49884' '#49884#46020#54644' '#51452#49464#50836'.'
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
    WordWrap = True
  end
  object lblFormTitle: TLabel
    Left = 118
    Top = 80
    Width = 465
    Height = 50
    Alignment = taCenter
    AutoSize = False
    Caption = #48148#53076#46300#47196' '#51312#54924
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
  object panButtonContainer: TPanel
    Left = 0
    Top = 807
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
      Caption = #45803#44592
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
end
