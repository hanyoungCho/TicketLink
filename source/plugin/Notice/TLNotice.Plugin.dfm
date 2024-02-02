object PluginForm: TPluginForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 826
  ClientWidth = 700
  Color = 3155225
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Noto Sans CJK KR Regular'
  Font.Style = []
  Position = poOwnerFormCenter
  OnClose = PluginModuleClose
  PluginGroup = 0
  InitHeight = 0
  InitWidth = 0
  EscCanClose = False
  OnMessage = PluginModuleMessage
  TextHeight = 28
  object lblNotice: THTMLabel
    Left = 60
    Top = 40
    Width = 580
    Height = 640
    Font.Charset = HANGEUL_CHARSET
    Font.Color = 15198183
    Font.Height = -24
    Font.Name = 'Noto Sans CJK KR Regular'
    Font.Style = []
    HTMLText.Strings = (
      
        '<P align="center">'#47700#49884#51648' '#53581#49828#53944' 2 (<FONT color="#FF2828">HTML</FONT> '#51648 +
        #50896')</P>')
    ParentFont = False
    Transparent = True
    Version = '2.3.0.1'
  end
  object lblRemainTime: TLabel
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
  object panButtonContainer: TPanel
    Left = 0
    Top = 706
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
      Caption = #54869#51064
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
  object tmrRemainTime: TTimer
    Enabled = False
    OnTimer = tmrRemainTimeTimer
    Left = 72
    Top = 24
  end
end
