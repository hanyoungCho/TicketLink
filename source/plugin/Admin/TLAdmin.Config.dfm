object ConfigForm: TConfigForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'ConfigForm'
  ClientHeight = 920
  ClientWidth = 800
  Color = 3155225
  Font.Charset = HANGEUL_CHARSET
  Font.Color = 11117471
  Font.Height = -19
  Font.Name = 'Noto Sans CJK KR Regular'
  Font.Style = []
  FormStyle = fsStayOnTop
  Position = poOwnerFormCenter
  TipMode = tipOpen
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  TextHeight = 28
  object panTitle: TPanel
    AlignWithMargins = True
    Left = 20
    Top = 20
    Width = 760
    Height = 48
    Margins.Left = 20
    Margins.Top = 20
    Margins.Right = 20
    Margins.Bottom = 0
    Align = alTop
    BevelOuter = bvNone
    Caption = #54872#44221' '#49444#51221
    Color = 5848878
    Font.Charset = HANGEUL_CHARSET
    Font.Color = 15854568
    Font.Height = -32
    Font.Name = 'Noto Sans CJK KR Bold'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object panButtonContainer: TPanel
    Left = 0
    Top = 800
    Width = 800
    Height = 120
    Align = alBottom
    BevelOuter = bvNone
    ShowCaption = False
    TabOrder = 1
    ExplicitTop = 780
    object btnApply: TcxButton
      Tag = 1
      AlignWithMargins = True
      Left = 0
      Top = 0
      Width = 400
      Height = 120
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Caption = #51201' '#50857
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
      OnClick = btnApplyClick
    end
    object btnCancel: TcxButton
      Tag = 5
      AlignWithMargins = True
      Left = 401
      Top = 0
      Width = 399
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
  object pgcConfig: TcxPageControl
    Left = 20
    Top = 74
    Width = 760
    Height = 707
    ParentBackground = False
    TabOrder = 2
    Properties.ActivePage = tabSystem
    Properties.CustomButtons.Buttons = <>
    Properties.Style = 9
    Properties.TabSlants.Positions = [spRight]
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    ClientRectBottom = 707
    ClientRectRight = 760
    ClientRectTop = 35
    object tabSystem: TcxTabSheet
      Caption = '  '#54596#49688' '#49444#51221'  '
      Color = clWhite
      Font.Charset = HANGEUL_CHARSET
      Font.Color = 11117471
      Font.Height = -19
      Font.Name = 'Noto Sans CJK KR Regular'
      Font.Style = []
      ImageIndex = 0
      ParentColor = False
      ParentFont = False
      ExplicitHeight = 652
      object Label1: TLabel
        Left = 14
        Top = 238
        Width = 90
        Height = 28
        Alignment = taRightJustify
        Caption = #54028#53944#45320' '#48264#54840
      end
      object Label2: TLabel
        Left = 283
        Top = 238
        Width = 90
        Height = 28
        Alignment = taRightJustify
        Caption = #52852#50868#53552' '#48264#54840
      end
      object edtServerHost: TLabeledEdit
        Left = 112
        Top = 24
        Width = 429
        Height = 36
        Color = clWhite
        EditLabel.Width = 84
        EditLabel.Height = 36
        EditLabel.Caption = #49436#48260'  URL '
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Noto Sans CJK KR Regular'
        Font.Style = []
        LabelPosition = lpLeft
        ParentFont = False
        TabOrder = 0
        Text = ''
      end
      object ckbAutoStart: TCheckBox
        Left = 643
        Top = 30
        Width = 94
        Height = 24
        Caption = #51088#46041' '#49884#51089
        Font.Charset = HANGEUL_CHARSET
        Font.Color = 11117471
        Font.Height = -19
        Font.Name = 'Noto Sans CJK KR Regular'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object edtServerToken: TLabeledEdit
        Left = 112
        Top = 66
        Width = 429
        Height = 36
        Color = clWhite
        EditLabel.Width = 39
        EditLabel.Height = 36
        EditLabel.Caption = #53664#53360' '
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Noto Sans CJK KR Regular'
        Font.Style = []
        LabelPosition = lpLeft
        ParentFont = False
        PasswordChar = '*'
        TabOrder = 2
        Text = ''
      end
      object edtPartnerNo: TNumberBox
        Left = 112
        Top = 234
        Width = 160
        Height = 36
        Color = clWhite
        DisplayFormat = '0'
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Noto Sans CJK KR Regular'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
      end
      object edtCounterNo: TNumberBox
        Left = 381
        Top = 234
        Width = 160
        Height = 36
        Color = clWhite
        DisplayFormat = '0'
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Noto Sans CJK KR Regular'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
      end
      object ckbUsePG: TCheckBox
        Left = 597
        Top = 198
        Width = 140
        Height = 24
        Caption = 'PG '#49436#48708#49828' '#49324#50857
        Checked = True
        State = cbChecked
        TabOrder = 8
      end
      object edtVanCode: TLabeledEdit
        Left = 112
        Top = 276
        Width = 160
        Height = 36
        CharCase = ecUpperCase
        Color = clWhite
        EditLabel.Width = 98
        EditLabel.Height = 36
        EditLabel.Caption = 'VAN'#49324' '#53076#46300' '
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Noto Sans CJK KR Regular'
        Font.Style = []
        LabelPosition = lpLeft
        ParentFont = False
        TabOrder = 12
        Text = 'KCP'
      end
      object edtVanTID: TLabeledEdit
        Left = 381
        Top = 276
        Width = 160
        Height = 36
        CharCase = ecUpperCase
        Color = clWhite
        EditLabel.Width = 77
        EditLabel.Height = 36
        EditLabel.Caption = 'VAN-TID '
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Noto Sans CJK KR Regular'
        Font.Style = []
        LabelPosition = lpLeft
        ParentFont = False
        TabOrder = 13
        Text = ''
      end
      object gbxPAYCO: TcxGroupBox
        AlignWithMargins = True
        Left = 10
        Top = 359
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alBottom
        Caption = '[ PAYCO '#44036#54200#44208#51228' '#49444#51221' ]'
        ParentBackground = False
        TabOrder = 15
        ExplicitTop = 339
        Height = 303
        Width = 740
        object edtPaycoVanTID: TLabeledEdit
          Left = 102
          Top = 40
          Width = 160
          Height = 36
          CharCase = ecUpperCase
          Color = clWhite
          EditLabel.Width = 77
          EditLabel.Height = 36
          EditLabel.Caption = 'VAN-TID '
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Noto Sans CJK KR Regular'
          Font.Style = []
          LabelPosition = lpLeft
          ParentFont = False
          TabOrder = 0
          Text = ''
        end
        object edtPaycoHost: TLabeledEdit
          Left = 102
          Top = 82
          Width = 625
          Height = 36
          Color = clWhite
          EditLabel.Width = 79
          EditLabel.Height = 36
          EditLabel.Caption = #49436#48260' URL '
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Noto Sans CJK KR Regular'
          Font.Style = []
          LabelPosition = lpLeft
          ParentFont = False
          TabOrder = 3
          Text = ''
        end
        object edtPaycoRegUri: TLabeledEdit
          Left = 198
          Top = 124
          Width = 529
          Height = 36
          Color = clWhite
          EditLabel.Width = 116
          EditLabel.Height = 36
          EditLabel.Caption = 'POS '#51064#51613' URI '
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Noto Sans CJK KR Regular'
          Font.Style = []
          LabelPosition = lpLeft
          ParentFont = False
          TabOrder = 4
          Text = ''
        end
        object edtPaycoApprovalUri: TLabeledEdit
          Left = 198
          Top = 166
          Width = 529
          Height = 36
          Color = clWhite
          EditLabel.Width = 114
          EditLabel.Height = 36
          EditLabel.Caption = #49849#51064' '#50836#52397' URI '
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Noto Sans CJK KR Regular'
          Font.Style = []
          LabelPosition = lpLeft
          ParentFont = False
          TabOrder = 5
          Text = ''
        end
        object edtPaycoCancelUri: TLabeledEdit
          Left = 198
          Top = 208
          Width = 529
          Height = 36
          Color = clWhite
          EditLabel.Width = 114
          EditLabel.Height = 36
          EditLabel.Caption = #52712#49548' '#50836#52397' URI '
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Noto Sans CJK KR Regular'
          Font.Style = []
          LabelPosition = lpLeft
          ParentFont = False
          TabOrder = 6
          Text = ''
        end
        object edtPaycoNetCancelUri: TLabeledEdit
          Left = 198
          Top = 250
          Width = 529
          Height = 36
          Color = clWhite
          EditLabel.Width = 131
          EditLabel.Height = 36
          EditLabel.Caption = #47581#52712#49548' '#50836#52397' URI '
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Noto Sans CJK KR Regular'
          Font.Style = []
          LabelPosition = lpLeft
          ParentFont = False
          TabOrder = 7
          Text = ''
        end
        object btnPaycoPosReg: TButton
          Left = 550
          Top = 40
          Width = 177
          Height = 36
          Caption = 'PAYCO POS '#46321#47197
          TabOrder = 2
          OnClick = btnPaycoPosRegClick
        end
        object edtPaycoPosTID: TLabeledEdit
          Left = 371
          Top = 40
          Width = 160
          Height = 36
          CharCase = ecUpperCase
          Color = clWhite
          EditLabel.Width = 77
          EditLabel.Height = 36
          EditLabel.Caption = 'POS-TID '
          Enabled = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Noto Sans CJK KR Regular'
          Font.Style = []
          LabelPosition = lpLeft
          ParentFont = False
          TabOrder = 1
          Text = ''
        end
      end
      object edtStoreBizNo: TLabeledEdit
        Left = 112
        Top = 150
        Width = 160
        Height = 36
        Color = clWhite
        EditLabel.Width = 90
        EditLabel.Height = 36
        EditLabel.Caption = #49324#50629#51088#48264#54840' '
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Noto Sans CJK KR Regular'
        Font.Style = []
        LabelPosition = lpLeft
        ParentFont = False
        TabOrder = 5
        Text = ''
      end
      object btnICReaderVerify: TButton
        Left = 560
        Top = 276
        Width = 177
        Height = 36
        Caption = #45800#47568#44592' '#47924#44208#49457' '#44160#49324
        TabOrder = 14
        OnClick = btnICReaderVerifyClick
      end
      object edtStoreOwner: TLabeledEdit
        Left = 381
        Top = 108
        Width = 160
        Height = 36
        Color = clWhite
        EditLabel.Width = 73
        EditLabel.Height = 36
        EditLabel.Caption = #45824#54364#51088#47749' '
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Noto Sans CJK KR Regular'
        Font.Style = []
        LabelPosition = lpLeft
        ParentFont = False
        TabOrder = 4
        Text = ''
      end
      object edtStoreTelNo: TLabeledEdit
        Left = 381
        Top = 150
        Width = 160
        Height = 36
        Color = clWhite
        EditLabel.Width = 73
        EditLabel.Height = 36
        EditLabel.Caption = #51204#54868#48264#54840' '
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Noto Sans CJK KR Regular'
        Font.Style = []
        LabelPosition = lpLeft
        ParentFont = False
        TabOrder = 6
        Text = ''
      end
      object edtStoreAddress: TLabeledEdit
        Left = 112
        Top = 192
        Width = 429
        Height = 36
        Color = clWhite
        EditLabel.Width = 95
        EditLabel.Height = 36
        EditLabel.Caption = #49324#50629#51109' '#51452#49548' '
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Noto Sans CJK KR Regular'
        Font.Style = []
        LabelPosition = lpLeft
        ParentFont = False
        TabOrder = 7
        Text = ''
      end
      object edtStoreName: TLabeledEdit
        Left = 112
        Top = 108
        Width = 160
        Height = 36
        Color = clWhite
        EditLabel.Width = 73
        EditLabel.Height = 36
        EditLabel.Caption = #49324#50629#51109#47749' '
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Noto Sans CJK KR Regular'
        Font.Style = []
        LabelPosition = lpLeft
        ParentFont = False
        TabOrder = 3
        Text = ''
      end
      object ckbUseDetectCardInsert: TCheckBox
        Left = 570
        Top = 240
        Width = 167
        Height = 24
        Caption = #52852#46300' '#49341#51077#44048#51648' '#49324#50857
        Checked = True
        State = cbChecked
        TabOrder = 11
      end
      object edtSiteCode: TLabeledEdit
        Left = 112
        Top = 318
        Width = 160
        Height = 36
        CharCase = ecUpperCase
        Color = clWhite
        EditLabel.Width = 82
        EditLabel.Height = 36
        EditLabel.Caption = 'SITE '#53076#46300' '
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Noto Sans CJK KR Regular'
        Font.Style = []
        LabelPosition = lpLeft
        ParentFont = False
        TabOrder = 16
        Text = ''
      end
    end
    object tabConfig: TcxTabSheet
      Caption = '  '#54872#44221' '#49444#51221'  '
      Color = clWhite
      ImageIndex = 1
      ParentColor = False
      ExplicitHeight = 652
      object mmoConfig: TMemo
        AlignWithMargins = True
        Left = 10
        Top = 203
        Width = 740
        Height = 459
        Margins.Left = 10
        Margins.Top = 0
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        Color = clWhite
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Noto Sans CJK KR Regular'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
        ExplicitHeight = 439
      end
      object mmoLauncher: TMemo
        AlignWithMargins = True
        Left = 10
        Top = 10
        Width = 740
        Height = 183
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alTop
        Color = clWhite
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Noto Sans CJK KR Regular'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 1
        WordWrap = False
      end
    end
  end
end
