object GuidePopupForm: TGuidePopupForm
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 774
  ClientWidth = 580
  Color = 3155225
  Font.Charset = HANGEUL_CHARSET
  Font.Color = 15198183
  Font.Height = -19
  Font.Name = 'Noto Sans CJK KR Regular'
  Font.Style = []
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 28
  object lblTicketLinkTitle: TLabel
    Left = 40
    Top = 70
    Width = 500
    Height = 50
    Alignment = taCenter
    AutoSize = False
    Caption = #54000#53011#47553#53356', '#50948#47700#54532
    Font.Charset = HANGEUL_CHARSET
    Font.Color = 15198183
    Font.Height = -32
    Font.Name = 'Noto Sans CJK KR Bold'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
    WordWrap = True
  end
  object lblTicketLinkMsg: TLabel
    Left = 40
    Top = 120
    Width = 500
    Height = 50
    Alignment = taCenter
    AutoSize = False
    Caption = #50696#47588#48264#54840#47484' '#51312#54924#54616#49464#50836'.'
    Font.Charset = HANGEUL_CHARSET
    Font.Color = 12499640
    Font.Height = -24
    Font.Name = 'Noto Sans CJK KR Regular'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object lblNaverTitle: TLabel
    Left = 40
    Top = 198
    Width = 500
    Height = 50
    Alignment = taCenter
    AutoSize = False
    Caption = #45348#51060#48260' '#50696#50557
    Font.Charset = HANGEUL_CHARSET
    Font.Color = 15198183
    Font.Height = -32
    Font.Name = 'Noto Sans CJK KR Bold'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
    WordWrap = True
  end
  object lblNaverMsg: TLabel
    Left = 40
    Top = 248
    Width = 500
    Height = 50
    Alignment = taCenter
    AutoSize = False
    Caption = #50696#50557#48264#54840#47484' '#51312#54924#54616#49464#50836'.'
    Font.Charset = HANGEUL_CHARSET
    Font.Color = 12499640
    Font.Height = -24
    Font.Name = 'Noto Sans CJK KR Regular'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object lblTiMonTitle: TLabel
    Left = 40
    Top = 326
    Width = 500
    Height = 50
    Alignment = taCenter
    AutoSize = False
    Caption = #54000#53011#47788#49828#53552
    Font.Charset = HANGEUL_CHARSET
    Font.Color = 15198183
    Font.Height = -32
    Font.Name = 'Noto Sans CJK KR Bold'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
    WordWrap = True
  end
  object lblTiMonMsg: TLabel
    Left = 40
    Top = 376
    Width = 500
    Height = 50
    Alignment = taCenter
    AutoSize = False
    Caption = #50696#50557#48264#54840#47484' '#51312#54924#54616#49464#50836'.'
    Font.Charset = HANGEUL_CHARSET
    Font.Color = 12499640
    Font.Height = -24
    Font.Name = 'Noto Sans CJK KR Regular'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object lblCoupangMsg: TLabel
    Left = 40
    Top = 504
    Width = 500
    Height = 80
    Alignment = taCenter
    AutoSize = False
    Caption = #47924#51064#48156#44428#44592' '#51060#50857#51060' '#48520#44032#54633#45768#45796'.'#13#10#47588#54364#49548#47484' '#51060#50857#54644' '#51452#49464#50836'.'
    Font.Charset = HANGEUL_CHARSET
    Font.Color = 12499640
    Font.Height = -24
    Font.Name = 'Noto Sans CJK KR Regular'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object lblCoupangTitle: TLabel
    Left = 40
    Top = 454
    Width = 500
    Height = 50
    Alignment = taCenter
    AutoSize = False
    Caption = #53216#54049
    Font.Charset = HANGEUL_CHARSET
    Font.Color = 15198183
    Font.Height = -32
    Font.Name = 'Noto Sans CJK KR Bold'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
    WordWrap = True
  end
  object panButtonContainer: TPanel
    Left = 0
    Top = 654
    Width = 580
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
      Width = 580
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
    end
  end
end
