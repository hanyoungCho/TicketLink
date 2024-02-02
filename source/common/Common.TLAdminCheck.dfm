object TLAdminCheckForm: TTLAdminCheckForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'TLAdminCheckForm'
  ClientHeight = 885
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
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 28
  object lblCaption: TLabel
    Left = 60
    Top = 57
    Width = 580
    Height = 47
    Alignment = taCenter
    AutoSize = False
    Caption = #44288#47532#51088' '#51064#51613
    Font.Charset = HANGEUL_CHARSET
    Font.Color = 15198183
    Font.Height = -32
    Font.Name = 'Noto Sans CJK KR Bold'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
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
  object panButtonContainer: TPanel
    Left = 0
    Top = 765
    Width = 700
    Height = 120
    Align = alBottom
    BevelOuter = bvNone
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
      Caption = #54869' '#51064
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
      Caption = #52712' '#49548
      Colors.Normal = 5848878
      Colors.NormalText = 15854568
      Colors.Pressed = 7165510
      Colors.PressedText = 15854568
      Colors.Disabled = 3945259
      Colors.DisabledText = 5062970
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      ModalResult = 2
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
  object panNumPad: TPanel
    Left = 158
    Top = 153
    Width = 384
    Height = 554
    BevelOuter = bvNone
    Color = 3155225
    ParentBackground = False
    TabOrder = 1
    object panInputValue: TAdvSmoothPanel
      Left = 0
      Top = 0
      Width = 384
      Height = 90
      Cursor = crDefault
      Caption.HTMLFont.Charset = DEFAULT_CHARSET
      Caption.HTMLFont.Color = clWindowText
      Caption.HTMLFont.Height = -12
      Caption.HTMLFont.Name = 'Tahoma'
      Caption.HTMLFont.Style = []
      Caption.Font.Charset = DEFAULT_CHARSET
      Caption.Font.Color = clWindowText
      Caption.Font.Height = -16
      Caption.Font.Name = 'Tahoma'
      Caption.Font.Style = []
      Caption.ColorStart = clBlack
      Caption.ColorEnd = clBlack
      Caption.LineColor = clBlack
      Fill.Color = 3155225
      Fill.ColorTo = clNone
      Fill.ColorMirror = clNone
      Fill.ColorMirrorTo = clNone
      Fill.GradientType = gtSolid
      Fill.GradientMirrorType = gtNone
      Fill.BorderColor = 7759709
      Fill.BorderWidth = 2
      Fill.Rounding = 10
      Fill.ShadowOffset = 0
      Fill.Glow = gmNone
      Version = '1.7.1.5'
      TabOrder = 0
      TMSStyle = 0
      object lblInputValue: TLabel
        AlignWithMargins = True
        Left = 20
        Top = 20
        Width = 344
        Height = 50
        Margins.Left = 20
        Margins.Top = 20
        Margins.Right = 20
        Margins.Bottom = 20
        Align = alClient
        Caption = '<'#48708#48128#48264#54840' '#51077#47141'>'
        Color = 3155225
        Font.Charset = HANGEUL_CHARSET
        Font.Color = 8550255
        Font.Height = -32
        Font.Name = 'Noto Sans CJK KR Regular'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
        ExplicitWidth = 219
        ExplicitHeight = 47
      end
    end
    object btnNum1: TcxButton
      Tag = 49
      Left = 0
      Top = 96
      Width = 124
      Height = 110
      Caption = '1'
      Colors.Normal = 4732715
      Colors.NormalText = 15854568
      Colors.Pressed = 7165510
      Colors.PressedText = 15854568
      Colors.Disabled = 3945259
      Colors.DisabledText = 5062970
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      OptionsImage.ImageIndex = 0
      SpeedButtonOptions.CanBeFocused = False
      TabOrder = 1
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -32
      Font.Name = 'Noto Sans CJK KR Bold'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object btnNum2: TcxButton
      Tag = 50
      Left = 130
      Top = 96
      Width = 124
      Height = 110
      Caption = '2'
      Colors.Normal = 4732715
      Colors.NormalText = 15854568
      Colors.Pressed = 7165510
      Colors.PressedText = 15854568
      Colors.Disabled = 3945259
      Colors.DisabledText = 5062970
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      OptionsImage.ImageIndex = 0
      SpeedButtonOptions.CanBeFocused = False
      TabOrder = 2
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -32
      Font.Name = 'Noto Sans CJK KR Bold'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object btnNum3: TcxButton
      Tag = 51
      Left = 260
      Top = 96
      Width = 124
      Height = 110
      Caption = '3'
      Colors.Normal = 4732715
      Colors.NormalText = 15854568
      Colors.Pressed = 7165510
      Colors.PressedText = 15854568
      Colors.Disabled = 3945259
      Colors.DisabledText = 5062970
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      OptionsImage.ImageIndex = 0
      SpeedButtonOptions.CanBeFocused = False
      TabOrder = 3
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -32
      Font.Name = 'Noto Sans CJK KR Bold'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object btnNum4: TcxButton
      Tag = 52
      Left = 0
      Top = 212
      Width = 124
      Height = 110
      Caption = '4'
      Colors.Normal = 4732715
      Colors.NormalText = 15854568
      Colors.Pressed = 7165510
      Colors.PressedText = 15854568
      Colors.Disabled = 3945259
      Colors.DisabledText = 5062970
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      OptionsImage.ImageIndex = 0
      SpeedButtonOptions.CanBeFocused = False
      TabOrder = 4
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -32
      Font.Name = 'Noto Sans CJK KR Bold'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object btnNum5: TcxButton
      Tag = 53
      Left = 130
      Top = 212
      Width = 124
      Height = 110
      Caption = '5'
      Colors.Normal = 4732715
      Colors.NormalText = 15854568
      Colors.Pressed = 7165510
      Colors.PressedText = 15854568
      Colors.Disabled = 3945259
      Colors.DisabledText = 5062970
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      OptionsImage.ImageIndex = 0
      SpeedButtonOptions.CanBeFocused = False
      TabOrder = 5
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -32
      Font.Name = 'Noto Sans CJK KR Bold'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object btnNum6: TcxButton
      Tag = 54
      Left = 260
      Top = 212
      Width = 124
      Height = 110
      Caption = '6'
      Colors.Normal = 4732715
      Colors.NormalText = 15854568
      Colors.Pressed = 7165510
      Colors.PressedText = 15854568
      Colors.Disabled = 3945259
      Colors.DisabledText = 5062970
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      OptionsImage.ImageIndex = 0
      SpeedButtonOptions.CanBeFocused = False
      TabOrder = 6
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -32
      Font.Name = 'Noto Sans CJK KR Bold'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object btnNum7: TcxButton
      Tag = 55
      Left = 0
      Top = 328
      Width = 124
      Height = 110
      Caption = '7'
      Colors.Normal = 4732715
      Colors.NormalText = 15854568
      Colors.Pressed = 7165510
      Colors.PressedText = 15854568
      Colors.Disabled = 3945259
      Colors.DisabledText = 5062970
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      OptionsImage.ImageIndex = 0
      SpeedButtonOptions.CanBeFocused = False
      TabOrder = 7
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -32
      Font.Name = 'Noto Sans CJK KR Bold'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object btnNum8: TcxButton
      Tag = 56
      Left = 130
      Top = 328
      Width = 124
      Height = 110
      Caption = '8'
      Colors.Normal = 4732715
      Colors.NormalText = 15854568
      Colors.Pressed = 7165510
      Colors.PressedText = 15854568
      Colors.Disabled = 3945259
      Colors.DisabledText = 5062970
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      OptionsImage.ImageIndex = 0
      SpeedButtonOptions.CanBeFocused = False
      TabOrder = 8
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -32
      Font.Name = 'Noto Sans CJK KR Bold'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object btnNum9: TcxButton
      Tag = 57
      Left = 260
      Top = 328
      Width = 124
      Height = 110
      Caption = '9'
      Colors.Normal = 4732715
      Colors.NormalText = 15854568
      Colors.Pressed = 7165510
      Colors.PressedText = 15854568
      Colors.Disabled = 3945259
      Colors.DisabledText = 5062970
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      OptionsImage.ImageIndex = 0
      SpeedButtonOptions.CanBeFocused = False
      TabOrder = 9
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -32
      Font.Name = 'Noto Sans CJK KR Bold'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object btnNum0: TcxButton
      Tag = 48
      Left = 130
      Top = 444
      Width = 124
      Height = 110
      Caption = '0'
      Colors.Normal = 4732715
      Colors.NormalText = 15854568
      Colors.Pressed = 7165510
      Colors.PressedText = 15854568
      Colors.Disabled = 3945259
      Colors.DisabledText = 5062970
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      OptionsImage.ImageIndex = 0
      SpeedButtonOptions.CanBeFocused = False
      TabOrder = 10
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -32
      Font.Name = 'Noto Sans CJK KR Bold'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object btnNum11: TcxButton
      Tag = 8
      Left = 260
      Top = 444
      Width = 124
      Height = 110
      Caption = #8592
      Colors.Normal = 4732715
      Colors.NormalText = 15854568
      Colors.Pressed = 7165510
      Colors.PressedText = 15854568
      Colors.Disabled = 3945259
      Colors.DisabledText = 5062970
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      OptionsImage.ImageIndex = 0
      SpeedButtonOptions.CanBeFocused = False
      TabOrder = 11
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -32
      Font.Name = 'Noto Sans CJK KR Bold'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object btnNum10: TcxButton
      Tag = 239
      Left = 0
      Top = 444
      Width = 124
      Height = 110
      Caption = #47784#46160#13#10#51648#50864#44592
      Colors.Normal = 4732715
      Colors.NormalText = 15854568
      Colors.Pressed = 7165510
      Colors.PressedText = 15854568
      Colors.Disabled = 3945259
      Colors.DisabledText = 5062970
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      OptionsImage.ImageIndex = 0
      SpeedButtonOptions.CanBeFocused = False
      TabOrder = 12
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -24
      Font.Name = 'Noto Sans CJK KR Bold'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
  end
  object tmrTimeout: TTimer
    Enabled = False
    OnTimer = tmrTimeoutTimer
    Left = 40
    Top = 16
  end
end
