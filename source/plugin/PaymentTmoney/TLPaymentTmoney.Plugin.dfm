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
  OnActivate = PluginModuleActivate
  OnClose = PluginModuleClose
  PluginGroup = 0
  InitHeight = 0
  InitWidth = 0
  EscCanClose = False
  OnMessage = PluginModuleMessage
  PixelsPerInch = 96
  TextHeight = 22
  object imgPaymentTmoney: TImage
    Left = 60
    Top = 328
    Width = 580
    Height = 300
    AutoSize = True
    Transparent = True
  end
  object PanMessage: TPanel
    Left = 60
    Top = 121
    Width = 580
    Height = 202
    Margins.Left = 5
    BevelOuter = bvNone
    TabOrder = 0
    object lblMessage1: TLabel
      Left = 0
      Top = 130
      Width = 580
      Height = 36
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = #54000#47672#45768' '#52852#46300#47484' NFC '#45800#47568#44592#50640' '#53552#52824#54644' '#51452#49464#50836'.'
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
      ExplicitWidth = 437
    end
    object lblMessage2: TLabel
      Left = 0
      Top = 166
      Width = 580
      Height = 36
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = #54000#53011#51060' '#52636#47141#46112' '#46412#44620#51648' '#52852#46300#47484' '#46524#51648' '#47560#49464#50836'!'
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
      ExplicitWidth = 417
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
      Caption = 'T-money '#44208#51228
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
  object tmrRemainTime: TTimer
    Enabled = False
    OnTimer = tmrRemainTimeTimer
    Left = 72
    Top = 24
  end
end
