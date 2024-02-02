object TLMsgBoxForm: TTLMsgBoxForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'TLMsgBoxForm'
  ClientHeight = 750
  ClientWidth = 700
  Color = 3155225
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clBlack
  Font.Height = -19
  Font.Name = 'Noto Sans CJK KR Bold'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  Position = poMainFormCenter
  OnCreate = FormCreate
  TextHeight = 28
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
  object imgIcon: TImage
    Left = 270
    Top = 72
    Width = 160
    Height = 160
    Transparent = True
  end
  object panMessage: TPanel
    Left = 40
    Top = 254
    Width = 620
    Height = 332
    BevelOuter = bvNone
    Color = 3155225
    ParentBackground = False
    TabOrder = 1
    object lblCaption: TLabel
      Left = 0
      Top = 0
      Width = 620
      Height = 180
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = #47700#49884#51648' '#53581#49828#53944' 1'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = 15198183
      Font.Height = -32
      Font.Name = 'Noto Sans CJK KR Bold'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      WordWrap = True
    end
    object lblHtmlMsg: THTMLabel
      Left = 0
      Top = 180
      Width = 620
      Height = 152
      Align = alClient
      Font.Charset = HANGEUL_CHARSET
      Font.Color = 12499640
      Font.Height = -24
      Font.Name = 'Noto Sans CJK KR Regular'
      Font.Style = []
      HTMLText.Strings = (
        
          '<P align="center">'#47700#49884#51648' '#53581#49828#53944' 2 (<FONT color="#FF2828">HTML</FONT> '#51648 +
          #50896')</P>')
      ParentFont = False
      Transparent = True
      Version = '2.3.0.1'
      ExplicitTop = 166
    end
  end
  object panButtonContainer: TPanel
    Left = 0
    Top = 630
    Width = 700
    Height = 120
    Align = alBottom
    BevelOuter = bvNone
    ShowCaption = False
    TabOrder = 0
    object btnSelect1: TcxButton
      Tag = 1
      AlignWithMargins = True
      Left = 0
      Top = 0
      Width = 139
      Height = 120
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Caption = 'Ok'
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
      OnClick = btnSelect1Click
    end
    object btnSelect2: TcxButton
      Tag = 5
      AlignWithMargins = True
      Left = 140
      Top = 0
      Width = 140
      Height = 120
      Margins.Left = 1
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Caption = 'Cancel'
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
      OnClick = btnSelect2Click
    end
    object btnSelect3: TcxButton
      Tag = 5
      AlignWithMargins = True
      Left = 281
      Top = 0
      Width = 139
      Height = 120
      Margins.Left = 1
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Caption = 'YesToAll'
      Colors.Normal = 5848878
      Colors.NormalText = 15854568
      Colors.Pressed = 7165510
      Colors.PressedText = 15854568
      Colors.Disabled = 3945259
      Colors.DisabledText = 5062970
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      SpeedButtonOptions.CanBeFocused = False
      TabOrder = 2
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -32
      Font.Name = 'Noto Sans CJK KR Bold'
      Font.Style = []
      ParentFont = False
      WordWrap = True
      OnClick = btnSelect3Click
    end
    object btnSelect4: TcxButton
      Tag = 5
      AlignWithMargins = True
      Left = 421
      Top = 0
      Width = 139
      Height = 120
      Margins.Left = 1
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Caption = 'NoToAll'
      Colors.Normal = 5848878
      Colors.NormalText = 15854568
      Colors.Pressed = 7165510
      Colors.PressedText = 15854568
      Colors.Disabled = 3945259
      Colors.DisabledText = 5062970
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      SpeedButtonOptions.CanBeFocused = False
      TabOrder = 3
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -32
      Font.Name = 'Noto Sans CJK KR Bold'
      Font.Style = []
      ParentFont = False
      WordWrap = True
      OnClick = btnSelect4Click
    end
    object btnSelect5: TcxButton
      Tag = 5
      AlignWithMargins = True
      Left = 561
      Top = 0
      Width = 139
      Height = 120
      Margins.Left = 1
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Caption = 'All'
      Colors.Normal = 5848878
      Colors.NormalText = 15854568
      Colors.Pressed = 7165510
      Colors.PressedText = 15854568
      Colors.Disabled = 3945259
      Colors.DisabledText = 5062970
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      SpeedButtonOptions.CanBeFocused = False
      TabOrder = 4
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -32
      Font.Name = 'Noto Sans CJK KR Bold'
      Font.Style = []
      ParentFont = False
      WordWrap = True
      OnClick = btnSelect5Click
    end
  end
  object tmrAutoCloser: TTimer
    Enabled = False
    OnTimer = tmrAutoCloserTimer
    Left = 40
    Top = 16
  end
end
