object TLInputBoxForm: TTLInputBoxForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'TLInputBoxForm'
  ClientHeight = 500
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
  PixelsPerInch = 96
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
    Left = 300
    Top = 106
    Width = 100
    Height = 95
    Alignment = taCenter
    AutoSize = False
    Caption = '30'
    Font.Charset = HANGEUL_CHARSET
    Font.Color = 2631930
    Font.Height = -64
    Font.Name = 'Noto Sans CJK KR Bold'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object panButtonContainer: TPanel
    Left = 0
    Top = 380
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
      Width = 350
      Height = 120
      Margins.Left = 0
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
      OnClick = btnSelect1Click
    end
    object btnSelect2: TcxButton
      Tag = 5
      AlignWithMargins = True
      Left = 351
      Top = 0
      Width = 349
      Height = 120
      Margins.Left = 1
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
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
      OnClick = btnSelect2Click
    end
  end
  object panInputBox: TAdvSmoothPanel
    Left = 60
    Top = 205
    Width = 580
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
    Caption.ColorStart = 4474440
    Caption.ColorEnd = 4474440
    Caption.LineColor = 12895944
    Fill.Color = 3155225
    Fill.ColorTo = clWhite
    Fill.ColorMirror = clNone
    Fill.ColorMirrorTo = clNone
    Fill.GradientType = gtNone
    Fill.GradientMirrorType = gtNone
    Fill.BorderColor = 7759709
    Fill.BorderWidth = 2
    Fill.Rounding = 10
    Fill.ShadowOffset = 0
    Fill.Glow = gmNone
    Version = '1.7.1.4'
    TabOrder = 1
    TMSStyle = 0
    object btnInputClear: TAdvShapeButton
      Left = 525
      Top = 27
      Width = 36
      Height = 36
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabStop = True
      TabOrder = 0
      Version = '6.2.1.8'
      OnClick = btnInputClearClick
    end
    object edtInputValue: TEdit
      AlignWithMargins = True
      Left = 20
      Top = 20
      Width = 480
      Height = 50
      Margins.Left = 20
      Margins.Top = 20
      Margins.Right = 10
      Margins.Bottom = 20
      Align = alLeft
      BorderStyle = bsNone
      Color = 3155225
      Font.Charset = HANGEUL_CHARSET
      Font.Color = 8550255
      Font.Height = -32
      Font.Name = 'Noto Sans CJK KR Regular'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TextHint = '<'#48708#48128#48264#54840' '#51077#47141'>'
      OnChange = edtInputValueChange
      OnEnter = edtInputValueEnter
      OnExit = edtInputValueExit
    end
  end
  object tmrAutoCloser: TTimer
    Enabled = False
    OnTimer = tmrAutoCloserTimer
    Left = 40
    Top = 16
  end
end
