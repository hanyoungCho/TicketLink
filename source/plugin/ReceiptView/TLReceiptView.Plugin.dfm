object PluginForm: TPluginForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 800
  ClientWidth = 900
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
  object Label1: TLabel
    Left = 640
    Top = 80
    Width = 90
    Height = 28
    Alignment = taRightJustify
    AutoSize = False
    Caption = #44144#47000#51068#51088
    Font.Charset = HANGEUL_CHARSET
    Font.Color = 15854568
    Font.Height = -19
    Font.Name = 'Noto Sans CJK KR Bold'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
  end
  object panTitle: TPanel
    AlignWithMargins = True
    Left = 20
    Top = 20
    Width = 860
    Height = 48
    Margins.Left = 20
    Margins.Top = 20
    Margins.Right = 20
    Margins.Bottom = 0
    Align = alTop
    BevelOuter = bvNone
    Caption = #44144#47000#45236#50669' '#51312#54924
    Color = 5848878
    Font.Charset = HANGEUL_CHARSET
    Font.Color = 15854568
    Font.Height = -32
    Font.Name = 'Noto Sans CJK KR Bold'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object btnClose: TAdvShapeButton
      Left = 812
      Top = 2
      Width = 48
      Height = 48
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      Picture.Data = {
        89504E470D0A1A0A0000000D4948445200000024000000240803000000D6DE68
        AA0000000467414D410000B18F0BFC6105000000017352474200AECE1CE90000
        0036504C544547704C424D5D404C60444D5D444D5D424D5D444D5D434D5D4050
        5F434D5D444E5D444D5DF4F4F5676F7BA2A6AEFFFFFF565D6CB4B8BD934EF9E8
        0000000B74524E53007010EFCF60B7DF2095403DB7B207000000F14944415438
        CB95945B1683200C4401918023A2FBDF6CA1DA1A225A3A5F3CEE814908518AC9
        EB40033058A7BD6A6B7460B26303990842243113D0503095198BA68859F304FC
        A2CC2D93FD7F6E0C78503842C7A3A63744CF10751C049474D95F90CBE1B3E9B2
        5C47595EE973B2CEE9D85BD2BC9EEB5AF1578D0795995865A1B2B45382C9F10D
        9094643028114AA6240348085B4A9B5C13D7153FDF18CFEB4832314ACAD625B0
        7B9694E3C9FCC62E28CD9F659D3F71C599673C57274B798CD751B1D4592A5D45
        A7A68E83FA3E82320FC549E69FCF794F59FF6FC328E9BAB69EA9D5C42AFF6EBC
        E9755E3B5BDA2185BA1DBE0002492C97B42D28A20000000049454E44AE426082}
      PictureDown.Data = {
        89504E470D0A1A0A0000000D4948445200000024000000240803000000D6DE68
        AA0000000467414D410000B18F0BFC6105000000017352474200AECE1CE90000
        0036504C544547704C5763775060805763775762785762775763785763785760
        78566377576378576378F5F5F7768092ABB1BBFFFFFF667185BBC0C88BA0C7F4
        0000000B74524E53009010EF6070A8DF20CB407EE86EE3000000EA4944415438
        CB9D94590283200C44118510475CEE7FD9A2C51AE3869D2F884FC804883142C1
        79AA819ABD0BE65C0D43889B13A4252891C66C85135576970CE35424520B043C
        51F69249F9AF3B56B85195ADE356ED02D13D44050B0173B9F809E2645F4CFBFE
        384A0AC66D93B11BF2B77EE8C62DEE8C17BFC44C25268AB0DFA7F4A51493FCD5
        D09466501B6525519A0134846918261D53DBCDF9FC3C6EDB916662D414EF4A90
        7D69CACB62FEBC2BCAC96319BBD557EC64C5C3EE80633C8E96032EBB2A4597CE
        B4050B953D04636F2E27D9378FF39AE2F0B661CCE53AB69EF6BF2696DB21CFED
        90543BFC002BE92CA7804DBB820000000049454E44AE426082}
      ParentBackground = False
      ParentFont = False
      TabStop = True
      TabOrder = 0
      Version = '6.2.1.8'
      OnClick = btnCloseClick
    end
  end
  object panButtonContainer: TPanel
    Left = 0
    Top = 680
    Width = 900
    Height = 120
    Align = alBottom
    BevelOuter = bvNone
    ShowCaption = False
    TabOrder = 1
    object btnRefresh: TcxButton
      Tag = 1
      AlignWithMargins = True
      Left = 0
      Top = 0
      Width = 450
      Height = 120
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Caption = #49352#47196' '#44256#52840
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
      OnClick = btnRefreshClick
    end
    object btnReIssueReceipt: TcxButton
      Tag = 5
      AlignWithMargins = True
      Left = 451
      Top = 0
      Width = 449
      Height = 120
      Margins.Left = 1
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      Caption = #50689#49688#51613' '#51116#48156#54665
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
      OnClick = btnReIssueReceiptClick
    end
  end
  object dtpSaleDate: TDateTimePicker
    Left = 736
    Top = 76
    Width = 144
    Height = 36
    Date = 44655.000000000000000000
    Time = 0.871821817127056400
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Noto Sans CJK KR Regular'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object panBody: TPanel
    Left = 20
    Top = 118
    Width = 860
    Height = 545
    BevelOuter = bvNone
    TabOrder = 3
    object G1: TcxGrid
      Left = 0
      Top = 0
      Width = 860
      Height = 160
      Align = alTop
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Noto Sans CJK KR Regular'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      LookAndFeel.NativeStyle = False
      object V1: TcxGridDBBandedTableView
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        OnFocusedRecordChanged = V1FocusedRecordChanged
        DataController.DataSource = DSReceipt
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsSelection.CellSelect = False
        OptionsView.NoDataToDisplayInfoText = '<'#51312#54924#54624' '#51088#47308#44032' '#50630#49845#45768#45796'>'
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.Header = TLDataModule.StandStyleHeader
        Styles.Inactive = TLDataModule.StandStyleSelection
        Styles.Selection = TLDataModule.StandStyleSelection
        Styles.BandHeader = TLDataModule.StandStyleBandHeader
        Bands = <
          item
            Caption = #50689#49688#51613' '#45236#50669
          end>
        object V1partner_no: TcxGridDBBandedColumn
          Caption = #54028#53944#45320#48264#54840
          DataBinding.FieldName = 'partner_no'
          DataBinding.IsNullValueType = True
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          Width = 143
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object V1counter_no: TcxGridDBBandedColumn
          Caption = #52852#50868#53552#48264#54840
          DataBinding.FieldName = 'counter_no'
          DataBinding.IsNullValueType = True
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          Width = 143
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object V1receipt_no: TcxGridDBBandedColumn
          Caption = #50689#49688#51613#48264#54840
          DataBinding.FieldName = 'receipt_no'
          DataBinding.IsNullValueType = True
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          Width = 143
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object V1reserve_no: TcxGridDBBandedColumn
          Caption = #50696#47588#48264#54840
          DataBinding.FieldName = 'reserve_no'
          DataBinding.IsNullValueType = True
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          Width = 130
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 0
        end
        object V1sale_date: TcxGridDBBandedColumn
          Caption = #54032#47588#51068#51088
          DataBinding.FieldName = 'sale_date'
          DataBinding.IsNullValueType = True
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          Width = 120
          Position.BandIndex = 0
          Position.ColIndex = 4
          Position.RowIndex = 0
        end
        object V1sale_time: TcxGridDBBandedColumn
          Caption = #54032#47588#51068#49884
          DataBinding.FieldName = 'sale_time'
          DataBinding.IsNullValueType = True
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          Width = 120
          Position.BandIndex = 0
          Position.ColIndex = 5
          Position.RowIndex = 0
        end
        object V1update_dttm: TcxGridDBBandedColumn
          Caption = #46321#47197#51068#49884
          DataBinding.FieldName = 'update_dttm'
          DataBinding.IsNullValueType = True
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          Width = 200
          Position.BandIndex = 0
          Position.ColIndex = 6
          Position.RowIndex = 0
        end
      end
      object L1: TcxGridLevel
        GridView = V1
      end
    end
    object G2: TcxGrid
      Left = 0
      Top = 160
      Width = 860
      Height = 225
      Align = alClient
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Noto Sans CJK KR Regular'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      LookAndFeel.NativeStyle = False
      object V2: TcxGridDBBandedTableView
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.DataSource = DSOrder
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsSelection.CellSelect = False
        OptionsView.NoDataToDisplayInfoText = '<'#51312#54924#54624' '#51088#47308#44032' '#50630#49845#45768#45796'>'
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.Header = TLDataModule.StandStyleHeader
        Styles.Inactive = TLDataModule.StandStyleSelection
        Styles.Selection = TLDataModule.StandStyleSelection
        Styles.BandHeader = TLDataModule.StandStyleBandHeader
        Bands = <
          item
            Caption = #49345#54408' '#44396#47588' '#49345#49464' '#45236#50669
          end>
        object V2product_id: TcxGridDBBandedColumn
          Caption = #49345#54408' ID'
          DataBinding.FieldName = 'product_id'
          DataBinding.IsNullValueType = True
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object V2schedule_id: TcxGridDBBandedColumn
          Caption = #54924#52264' ID'
          DataBinding.FieldName = 'schedule_id'
          DataBinding.IsNullValueType = True
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object V2denomin_id: TcxGridDBBandedColumn
          Caption = #44428#51333' ID'
          DataBinding.FieldName = 'denomin_id'
          DataBinding.IsNullValueType = True
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object V2unit_price: TcxGridDBBandedColumn
          Caption = #45800#44032
          DataBinding.FieldName = 'unit_price'
          DataBinding.IsNullValueType = True
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = #8361',0.;-'#8361',0.'
          HeaderAlignmentHorz = taCenter
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 0
        end
        object V2sale_qty: TcxGridDBBandedColumn
          Caption = #54032#47588#49688#47049
          DataBinding.FieldName = 'sale_qty'
          DataBinding.IsNullValueType = True
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = #8361',0.;-'#8361',0.'
          HeaderAlignmentHorz = taCenter
          Position.BandIndex = 0
          Position.ColIndex = 4
          Position.RowIndex = 0
        end
        object V2sale_amt: TcxGridDBBandedColumn
          Caption = #54032#47588#44552#50529
          DataBinding.FieldName = 'sale_amt'
          DataBinding.IsNullValueType = True
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = #8361',0.;-'#8361',0.'
          HeaderAlignmentHorz = taCenter
          Position.BandIndex = 0
          Position.ColIndex = 5
          Position.RowIndex = 0
        end
      end
      object L2: TcxGridLevel
        GridView = V2
      end
    end
    object G3: TcxGrid
      Left = 0
      Top = 385
      Width = 860
      Height = 160
      Align = alBottom
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Noto Sans CJK KR Regular'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      LookAndFeel.NativeStyle = False
      object V3: TcxGridDBBandedTableView
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.DataSource = DSPayment
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsSelection.CellSelect = False
        OptionsView.NoDataToDisplayInfoText = '<'#51312#54924#54624' '#51088#47308#44032' '#50630#49845#45768#45796'>'
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.Header = TLDataModule.StandStyleHeader
        Styles.Inactive = TLDataModule.StandStyleSelection
        Styles.Selection = TLDataModule.StandStyleSelection
        Styles.BandHeader = TLDataModule.StandStyleBandHeader
        Bands = <
          item
            Caption = #44208#51228' '#45236#50669
          end>
        object V3pay_method: TcxGridDBBandedColumn
          Caption = #44208#51228#49688#45800
          DataBinding.FieldName = 'pay_method'
          DataBinding.IsNullValueType = True
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Items = <
            item
              Description = #54788#44552
              ImageIndex = 0
              Value = 0
            end
            item
              Description = #54788#44552#50689#49688#51613
              Value = 1
            end
            item
              Description = #49888#50857#52852#46300
              Value = 2
            end
            item
              Description = 'PAYCO/'#52852#46300
              Value = 3
            end
            item
              Description = 'PAYCO/'#54252#51064#53944
              Value = 4
            end
            item
              Description = 'PAYCO/'#53216#54256
              Value = 5
            end
            item
              Description = #44592#53440
              Value = 6
            end>
          HeaderAlignmentHorz = taCenter
          Width = 120
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object V3approval_yn: TcxGridDBBandedColumn
          Caption = #49849#51064
          DataBinding.FieldName = 'approval_yn'
          DataBinding.IsNullValueType = True
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.Alignment = taCenter
          Properties.NullStyle = nssUnchecked
          HeaderAlignmentHorz = taCenter
          Width = 46
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object V3credit_card_no: TcxGridDBBandedColumn
          Caption = #52852#46300#48264#54840
          DataBinding.FieldName = 'credit_card_no'
          DataBinding.IsNullValueType = True
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          Width = 153
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object V3approve_amt: TcxGridDBBandedColumn
          Caption = #49849#51064#44552#50529
          DataBinding.FieldName = 'approve_amt'
          DataBinding.IsNullValueType = True
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = #8361',0.;-'#8361',0.'
          HeaderAlignmentHorz = taCenter
          Width = 117
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 0
        end
        object V3vat: TcxGridDBBandedColumn
          Caption = #48512#44032#49464
          DataBinding.FieldName = 'vat'
          DataBinding.IsNullValueType = True
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = #8361',0.;-'#8361',0.'
          HeaderAlignmentHorz = taCenter
          Width = 86
          Position.BandIndex = 0
          Position.ColIndex = 4
          Position.RowIndex = 0
        end
        object V3approve_no: TcxGridDBBandedColumn
          Caption = #49849#51064#48264#54840
          DataBinding.FieldName = 'approve_no'
          DataBinding.IsNullValueType = True
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          Width = 135
          Position.BandIndex = 0
          Position.ColIndex = 5
          Position.RowIndex = 0
        end
        object V3buyer_nm: TcxGridDBBandedColumn
          Caption = #47588#51077#49324#47749
          DataBinding.FieldName = 'buyer_nm'
          DataBinding.IsNullValueType = True
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          Width = 135
          Position.BandIndex = 0
          Position.ColIndex = 6
          Position.RowIndex = 0
        end
        object V3payco_pay_method: TcxGridDBBandedColumn
          Caption = 'PAYCO'
          DataBinding.FieldName = 'payco_pay_method'
          DataBinding.IsNullValueType = True
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          Width = 98
          Position.BandIndex = 0
          Position.ColIndex = 7
          Position.RowIndex = 0
        end
      end
      object L3: TcxGridLevel
        GridView = V3
      end
    end
  end
  object DSReceipt: TDataSource
    AutoEdit = False
    DataSet = QRReceipt
    Left = 664
    Top = 216
  end
  object DSOrder: TDataSource
    AutoEdit = False
    DataSet = QROrder
    Left = 664
    Top = 408
  end
  object DSPayment: TDataSource
    AutoEdit = False
    DataSet = QRPayment
    Left = 664
    Top = 600
  end
  object QRReceipt: TABSQuery
    CurrentVersion = '7.94 '
    DatabaseName = 'DBTicketLink'
    InMemory = False
    ReadOnly = False
    Left = 592
    Top = 216
  end
  object QROrder: TABSQuery
    CurrentVersion = '7.94 '
    DatabaseName = 'DBTicketLink'
    InMemory = False
    ReadOnly = False
    Left = 592
    Top = 408
  end
  object QRPayment: TABSQuery
    CurrentVersion = '7.94 '
    DatabaseName = 'DBTicketLink'
    InMemory = False
    ReadOnly = False
    Left = 592
    Top = 600
  end
end
