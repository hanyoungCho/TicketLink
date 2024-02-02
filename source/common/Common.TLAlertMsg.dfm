object TLAlertBoxForm: TTLAlertBoxForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'TLAlertBoxForm'
  ClientHeight = 650
  ClientWidth = 580
  Color = 3155225
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clBlack
  Font.Height = -19
  Font.Name = 'Noto Sans CJK KR Bold'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 28
  object lblCaption: TLabel
    Left = 60
    Top = 261
    Width = 460
    Height = 47
    Alignment = taCenter
    AutoSize = False
    Caption = #47700#49884#51648' '#53440#51060#53952
    Font.Charset = HANGEUL_CHARSET
    Font.Color = 15198183
    Font.Height = -32
    Font.Name = 'Noto Sans CJK KR Bold'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
    WordWrap = True
  end
  object lblMessage: TLabel
    Left = 60
    Top = 338
    Width = 460
    Height = 120
    Alignment = taCenter
    AutoSize = False
    Caption = #47700#49884#51648' '#48376#47928
    Font.Charset = HANGEUL_CHARSET
    Font.Color = 12499640
    Font.Height = -24
    Font.Name = 'Noto Sans CJK KR Regular'
    Font.Style = []
    ParentFont = False
  end
  object imgStatus: TImage
    Left = 230
    Top = 101
    Width = 120
    Height = 120
    Transparent = True
  end
  object lblTimeout: TLabel
    Left = 532
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
    Top = 530
    Width = 580
    Height = 120
    Align = alBottom
    BevelOuter = bvNone
    ShowCaption = False
    TabOrder = 0
    object btnOK: TcxButton
      Tag = 1
      AlignWithMargins = True
      Left = 0
      Top = 0
      Width = 580
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
    end
  end
  object tmrAutoCloser: TTimer
    Enabled = False
    OnTimer = tmrAutoCloserTimer
    Left = 40
    Top = 16
  end
end
