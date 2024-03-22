object PluginForm: TPluginForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'TLDM.dsrProduct'
  ClientHeight = 1920
  ClientWidth = 1080
  Color = 3155225
  DoubleBuffered = True
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Noto Sans CJK KR Regular'
  Font.Style = []
  OnActivate = PluginModuleActivate
  OnClose = PluginModuleClose
  PluginGroup = 0
  InitHeight = 0
  InitWidth = 0
  EscCanClose = False
  OnMessage = PluginModuleMessage
  TextHeight = 28
  object panTop: TPanel
    Left = 0
    Top = 0
    Width = 1080
    Height = 140
    Align = alTop
    BevelOuter = bvNone
    Color = 3155225
    ParentBackground = False
    TabOrder = 1
    object lblHeadSeparator: TLabel
      Left = 0
      Top = 139
      Width = 1080
      Height = 1
      Align = alBottom
      AutoSize = False
      Color = 5062970
      ParentColor = False
      Transparent = False
      ExplicitTop = 136
    end
    object panTopLeft: TPanel
      Left = 0
      Top = 0
      Width = 200
      Height = 139
      Align = alLeft
      BevelOuter = bvNone
      Color = 3155225
      ParentBackground = False
      TabOrder = 0
      object btnChangeLocale: TAdvSmoothButton
        Left = 40
        Top = 46
        Width = 120
        Height = 48
        Appearance.GlowPercentage = 0
        Appearance.Font.Charset = HANGEUL_CHARSET
        Appearance.Font.Color = 15198183
        Appearance.Font.Height = -19
        Appearance.Font.Name = 'Noto Sans CJK KR Regular'
        Appearance.Font.Style = []
        Appearance.Layout = blNone
        Appearance.SimpleLayout = False
        Appearance.SimpleLayoutBorder = True
        Appearance.Rounding = 22
        Status.Caption = '0'
        Status.Appearance.Fill.Color = clRed
        Status.Appearance.Fill.ColorMirror = clNone
        Status.Appearance.Fill.ColorMirrorTo = clNone
        Status.Appearance.Fill.GradientType = gtSolid
        Status.Appearance.Fill.GradientMirrorType = gtTexture
        Status.Appearance.Fill.HatchStyle = HatchStyleDottedGrid
        Status.Appearance.Fill.BorderColor = clGray
        Status.Appearance.Fill.Rounding = 10
        Status.Appearance.Fill.ShadowOffset = 0
        Status.Appearance.Fill.Glow = gmNone
        Status.Appearance.Fill.GlowGradientColor = 3155225
        Status.Appearance.Fill.GlowRadialColor = 3155225
        Status.Appearance.Font.Charset = DEFAULT_CHARSET
        Status.Appearance.Font.Color = clWhite
        Status.Appearance.Font.Height = -12
        Status.Appearance.Font.Name = 'Segoe UI'
        Status.Appearance.Font.Style = []
        BevelColor = 15198183
        Caption = 'KOR  '#9660
        Color = 3155225
        ParentFont = False
        TabOrder = 0
        TabStop = False
        ShowFocus = False
        Version = '2.2.3.1'
        OnMouseUp = btnChangeLocaleMouseUp
        TMSStyle = 8
      end
    end
    object panTopRight: TPanel
      Left = 880
      Top = 0
      Width = 200
      Height = 139
      Align = alRight
      BevelOuter = bvNone
      Color = 3155225
      ParentBackground = False
      TabOrder = 1
      object btnTicketHome: TAdvShapeButton
        Left = 47
        Top = 46
        Width = 48
        Height = 48
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Noto Sans CJK KR'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        Version = '6.2.1.8'
        OnMouseUp = btnTicketHomeMouseUp
      end
      object btnBack: TAdvShapeButton
        Left = 105
        Top = 46
        Width = 48
        Height = 48
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Noto Sans CJK KR Black'
        Font.Style = []
        Picture.Data = {
          89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
          87000000097048597300000B1300000B1301009A9C18000000017352474200AE
          CE1CE90000000467414D410000B18F0BFC610500000099494441547801EDD841
          0A80201085E1A95B78BB6E929DD66394820BD35A293A03FF0712B87AAF5C4C8A
          0000304008E14C4B2CCAE1EFBCA696D8A5530EEC8BAD4DACA8DE7C5A5EAC20FC
          2A845F85F0AB107E15C24FD2CC2D1FB38D1ACEB926EF6B988BE10F511AFE4FF7
          34AA4E3AEFD5F9B7F79342092D28A10525B4A0841694D0821203744FA37146F7
          F171155B76EE464BF94B78010060A207DE68CBCAD72DB23C0000000049454E44
          AE426082}
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        Version = '6.2.1.8'
        OnMouseUp = btnBackMouseUp
      end
    end
    object panTopCenter: TPanel
      Left = 200
      Top = 0
      Width = 680
      Height = 139
      Align = alClient
      BevelOuter = bvNone
      Color = 3155225
      ParentBackground = False
      TabOrder = 2
      object lblCurrentDateTime: TLabel
        Left = 0
        Top = 90
        Width = 680
        Height = 49
        Align = alBottom
        Alignment = taCenter
        AutoSize = False
        Caption = '00'#50900' 00'#51068' ('#53664') 00:00'
        Font.Charset = ANSI_CHARSET
        Font.Color = 15198183
        Font.Height = -24
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExplicitTop = 89
        ExplicitWidth = 572
      end
      object panBodyHeadTitle: TPanel
        Left = 192
        Top = 0
        Width = 295
        Height = 90
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 0
        object lblBodyHeadTicketOrder: TLabel
          AlignWithMargins = True
          Left = 144
          Top = 5
          Width = 146
          Height = 55
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alLeft
          Caption = #54000#53011' '#44396#47588
          Color = 3155225
          Font.Charset = HANGEUL_CHARSET
          Font.Color = 15198183
          Font.Height = -37
          Font.Name = 'Noto Sans CJK KR Bold'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = False
          Layout = tlCenter
        end
        object imgLogo: TImage
          Left = 0
          Top = 0
          Width = 139
          Height = 90
          Align = alLeft
          AutoSize = True
          Center = True
          Transparent = True
          ExplicitLeft = -3
          ExplicitTop = -6
        end
      end
    end
  end
  object panProductInfo: TPanel
    Left = 0
    Top = 140
    Width = 1080
    Height = 278
    Align = alTop
    BevelOuter = bvNone
    Color = 3155225
    ParentBackground = False
    TabOrder = 2
    Visible = False
    object lblProductSeparator: TLabel
      Left = 0
      Top = 277
      Width = 1080
      Height = 1
      Align = alBottom
      AutoSize = False
      Color = 5062970
      ParentColor = False
      Transparent = False
      ExplicitTop = 143
    end
    object panProductThumbnail: TPanel
      Left = 40
      Top = 48
      Width = 148
      Height = 182
      BevelOuter = bvNone
      TabOrder = 0
      object imgProductThumbnail: TImage
        Left = 0
        Top = 0
        Width = 148
        Height = 182
        Align = alClient
        Center = True
        Stretch = True
        Transparent = True
      end
    end
    object panProductTitle: TPanel
      Left = 208
      Top = 48
      Width = 816
      Height = 182
      BevelOuter = bvNone
      Color = 3155225
      ParentBackground = False
      TabOrder = 1
      object lblProductTitle: TLabel
        Left = 0
        Top = 0
        Width = 816
        Height = 47
        Align = alTop
        AutoSize = False
        Caption = #49345#54408#47749
        Font.Charset = HANGEUL_CHARSET
        Font.Color = 15198183
        Font.Height = -32
        Font.Name = 'Noto Sans CJK KR Medium'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExplicitWidth = 87
      end
      object lblProductDate: TLabel
        Left = 0
        Top = 47
        Width = 816
        Height = 36
        Align = alTop
        AutoSize = False
        Caption = '0000.00.00('#50836#51068')'
        EllipsisPosition = epWordEllipsis
        Font.Charset = HANGEUL_CHARSET
        Font.Color = 15198183
        Font.Height = -24
        Font.Name = 'Noto Sans CJK KR Regular'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExplicitLeft = 208
        ExplicitTop = 146
        ExplicitWidth = 200
      end
      object btnChangeProductDate: TAdvSmoothButton
        Left = 674
        Top = 134
        Width = 142
        Height = 48
        Appearance.GlowPercentage = 0
        Appearance.Font.Charset = HANGEUL_CHARSET
        Appearance.Font.Color = 15198183
        Appearance.Font.Height = -19
        Appearance.Font.Name = 'Noto Sans CJK KR Regular'
        Appearance.Font.Style = []
        Appearance.Layout = blNone
        Appearance.SimpleLayout = False
        Appearance.SimpleLayoutBorder = True
        Appearance.Rounding = 22
        Status.Caption = '0'
        Status.Appearance.Fill.Color = clRed
        Status.Appearance.Fill.ColorMirror = clNone
        Status.Appearance.Fill.ColorMirrorTo = clNone
        Status.Appearance.Fill.GradientType = gtSolid
        Status.Appearance.Fill.GradientMirrorType = gtTexture
        Status.Appearance.Fill.HatchStyle = HatchStyleDottedGrid
        Status.Appearance.Fill.BorderColor = clGray
        Status.Appearance.Fill.Rounding = 10
        Status.Appearance.Fill.ShadowOffset = 0
        Status.Appearance.Fill.Glow = gmNone
        Status.Appearance.Fill.GlowGradientColor = 3155225
        Status.Appearance.Fill.GlowRadialColor = 3155225
        Status.Appearance.Font.Charset = DEFAULT_CHARSET
        Status.Appearance.Font.Color = clWhite
        Status.Appearance.Font.Height = -12
        Status.Appearance.Font.Name = 'Segoe UI'
        Status.Appearance.Font.Style = []
        BevelColor = 15198183
        Caption = #45216#51676' '#48320#44221
        Color = 3155225
        ParentFont = False
        TabOrder = 0
        Visible = False
        Enabled = False
        ShowFocus = False
        Version = '2.2.3.1'
        TMSStyle = 8
      end
    end
  end
  object pgcTicketBuy: TcxPageControl
    Left = 0
    Top = 418
    Width = 1080
    Height = 1502
    Align = alClient
    ParentBackground = False
    TabOrder = 3
    Properties.ActivePage = tabPaymentList
    Properties.CustomButtons.Buttons = <>
    LookAndFeel.NativeStyle = False
    OnChange = pgcTicketBuyChange
    ClientRectBottom = 1502
    ClientRectRight = 1080
    ClientRectTop = 39
    object tabNoProducts: TcxTabSheet
      Caption = #49345#54408' '#50630#51020
      Color = 3155225
      ImageIndex = 5
      ParentColor = False
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object imgNoProducts: TImage
        Left = 460
        Top = 420
        Width = 160
        Height = 160
        AutoSize = True
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000A00000
          00A0040300000079E17A1E0000000467414D410000B18F0BFC61050000000173
          52474200AECE1CE900000021504C544547704C737C86707F87737D8774808073
          7C86727C86737C87737C87737C87737C8724211FCC0000000A74524E53008725
          DF104667C8EFA50FFB7504000005F44944415478DAED9A5D4C1C5514C7CF0CB3
          C3878D5A6BAC6E4DAC215A3E34411F9A6513AD4210DBA4984AD22D4B0BA52452
          B0A53C35ED4614D1B09662D914B54AFC003ACB328D317D32BEB989891820AD49
          8D3515537C31063F6A7DB0D2487586F9BA333B73EFCCDC59D328E78184D9D9DF
          CE39E7DE3BF79EF3672060635681ABC0FF29B0E6BEC8A5E91E587AA3E6DD2D1F
          5203B9671F5B8FFC3B3C5F99A502EE28AFB25C59EEFEC93FB0AEF10EE9EF7725
          5FFD726E01D8D2473E6B93F197A7CFFA04EEA8DE08307DF57DE4D203BF8F002C
          5DE9F603E4DA6B012E5EB0A6A1AE418AE9DCA0772077E749B871D02E5EF7DFD3
          03C92B0B1E8132EFE279FB6085DEBCDD99C860789F661D7E8D6DAB87E4794FC0
          C618CC1E07676BAF87A1190FC04DAFC0F159C09944FCB1DB35907F75E37C02F0
          26119FFBCD25903D5275ED832C01C8DE9D5AEA5D7007DC5FB37C740148C6467A
          ECDCB0013ED9091F8F1179D25745E8FAD9055072F8B5732E7800A5491BA7199B
          DBC801548CBB2B95FBD3394029C3AE1C5EB957C80D4E0E309C72E9B0EA4D2B01
          C888B683C1C1A44C5B07A315184ECD0CB9E6C953CAFA881620232EBF93F500E4
          0E57591ED1020CA7160F78E0016C6DB33CA219C80BDE1E70E511CD8936032BFA
          3C4550B6FAF66F5E7404B2914E0F29561F71B3F93B26606D878731A85969D2E4
          9509184E1DF6FA80925B53A6B4A0405EF82BEE9907D0F5049A161458D66FBB06
          938C11D1B4A0C068E77B591F406EF3C1265B2023FED9E283270F36C46706BDEE
          CB6339F688CF0870B4788F2F1E40E261C36703C80B3E3D967D9BD4372D06B020
          E3D36339FA8373B9C0F031CFD34E336E60BD3EB675201B39E067542BD6F5F8DB
          592B901107BEF40D44C2A5034B93B8975DC918FCB1D7F9E350FAD20B5660F818
          6ED0108090D8D46A0546B1212401E30D5A1035202F60434802164D6801D38085
          A7B1FB051290113F4F9981157DD8B59504E40636349B81A3B7C5800208E164AB
          19187DBE990AA867450586D2F8614D04164DA8EB830A2C1EC7AF0C442023FED0
          83028B26F0EF3B223094FEBA0F05C6B7E21757221006D534ABC0F0708C12A8A5
          5905262A9B2981F1ED4D08909BBCBE9B12B86DEF5B5903184A6B33C737B0F0B4
          326E14202312DE276420232A8B81022C1E9F3C4B09E40565202AC0820C61DB45
          06B253CA5C63D488EE044A200C86771B402DE734C044590B027C26460D1C5D13
          3780FA6A460154190C4AA702766D891940D2CC730354C316205049AC028CEE6F
          A106561CDD9347E019D2DD2E8025633B57813735F0E61F87814FBDD15B820606
          BD7C05BEC0AA742AA01A360558D11BC04BAA12016E6BD9450D3C731D798D06FE
          A22F1E275435C9C0501ADD8AF082EFC3B766DA7ECBE5768E6CE6ED1C71C34936
          F386933C998966DE1293A70AD1460B4D9BF678C32E0A986CDAD94E3FF810B6B0
          2463A7CC071FD2D18C68D6A3997EB2F26B0519F3E1D13840FB34FD6CA79D9769
          D3AC1FE035A051D6B035D25C66A7B44A9C51C4C0668504E4056B118317B05921
          010B32D6320B212B246057B576DE364A55AF375100A31D39A5AAA7F7E1E60A01
          C80B7A893E7FE53E6EE05E8A8264B55E1D454AA627B02311676CA423B7640AB5
          1D14455D235C063094A6283B1B2F4DA4308E96B7BD59F490B193418065FDAE5B
          8E568F11DF10A0EF52BBA98980B63F12E53EDB1F9D489D2BAF0D9AC05B488137
          B9A0BEDD571BCE685558816CC47B57CADA5C34B732CBFA7DB432CD832DCFCDD6
          C0DBC1C137ACA547FCE28407607D3BA1A51E7CD33F705982AD18C2C978E1C627
          D67BF32FED90E3E25A7C6223A3B197C7B85AC6A4E0B892C7C8021E3799668F54
          B914F0C84E5F7B8944940268AB1BB2154131A293080B752337C38E40287F9944
          6C8C81FD94721092390BC5148B353A09C39CB473EB4EC1D0E282C38738219C13
          905D7B0AFECE3888F1D66184758E724199B874E8579B4F649DA3B3500FA390EC
          A80518DE902368BC7012606EC68987955C96AF958E6FD3DF7F845C7AF0EA0838
          E81C5D002134228B429717755168EBA3D2FF9767716AD87F57B62A19B7BDC624
          AC7DE8DB2CFE0B2EA4BF756B9E9A5F91FEEEEBBD759E78F77F42EDBC0A5C05E6
          1DF80F9BAD79BF6CB39E5B0000000049454E44AE426082}
        Transparent = True
      end
      object lblNoProducts: TLabel
        AlignWithMargins = True
        Left = 40
        Top = 620
        Width = 1000
        Height = 47
        Alignment = taCenter
        AutoSize = False
        Caption = #44396#47588' '#44032#45733#54620' '#49345#54408#51060' '#50630#49845#45768#45796'.'
        Font.Charset = HANGEUL_CHARSET
        Font.Color = 15198183
        Font.Height = -32
        Font.Name = 'Noto Sans CJK KR Medium'
        Font.Style = []
        ParentFont = False
        Transparent = False
        Layout = tlCenter
        WordWrap = True
      end
    end
    object tabProductList: TcxTabSheet
      Caption = #49345#54408' '#47785#47197
      Color = 3155225
      ImageIndex = 1
      ParentColor = False
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object sbxProductList: TcxScrollBox
        Left = 56
        Top = 108
        Width = 968
        Height = 730
        Touch.ParentTabletOptions = False
        Touch.TabletOptions = [toPressAndHold]
        BorderStyle = cxcbsNone
        Color = 7759709
        HorzScrollBar.Tracking = True
        LookAndFeel.NativeStyle = False
        LookAndFeel.ScrollbarMode = sbmHybrid
        ParentColor = False
        TabOrder = 0
        VertScrollBar.Visible = False
      end
      object panProductListNavigator: TPanel
        Left = 120
        Top = 857
        Width = 840
        Height = 30
        BevelOuter = bvNone
        Color = 7759709
        ParentBackground = False
        TabOrder = 1
      end
      object btnProductListRightArrow: TAdvShapeButton
        Left = 968
        Top = 844
        Width = 56
        Height = 56
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabStop = True
        TabOrder = 2
        Version = '6.2.1.8'
        OnClick = btnProductListRightArrowClick
      end
      object btnProductListLeftArrow: TAdvShapeButton
        Left = 58
        Top = 844
        Width = 56
        Height = 56
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabStop = True
        TabOrder = 3
        Version = '6.2.1.8'
        OnClick = btnProductListLeftArrowClick
      end
    end
    object tabRoundList: TcxTabSheet
      Caption = #54924#52264' '#47785#47197
      Color = 3155225
      ImageIndex = 2
      ParentColor = False
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object sbxScheduleList: TcxScrollBox
        AlignWithMargins = True
        Left = 56
        Top = 48
        Width = 968
        Height = 1367
        Margins.Left = 56
        Margins.Top = 48
        Margins.Right = 56
        Margins.Bottom = 48
        Align = alClient
        BorderStyle = cxcbsNone
        Color = 7759709
        HorzScrollBar.Visible = False
        LookAndFeel.NativeStyle = False
        LookAndFeel.ScrollbarMode = sbmHybrid
        ParentColor = False
        TabOrder = 0
        VertScrollBar.Tracking = True
      end
    end
    object tabDenominList: TcxTabSheet
      Caption = #54000#53011' '#49440#53469
      Color = 2497812
      ImageIndex = 4
      ParentColor = False
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object lblCategorySeparator: TLabel
        Left = 0
        Top = 100
        Width = 1080
        Height = 1
        Align = alTop
        AutoSize = False
        Color = 5062970
        ParentColor = False
        Transparent = False
      end
      object panDenominList: TPanel
        Left = 0
        Top = 101
        Width = 1080
        Height = 686
        Align = alTop
        BevelOuter = bvNone
        Color = 2497812
        ParentBackground = False
        TabOrder = 0
        object sbxDenominList: TcxScrollBox
          AlignWithMargins = True
          Left = 56
          Top = 48
          Width = 968
          Height = 530
          Margins.Left = 56
          Margins.Top = 48
          Margins.Right = 56
          Margins.Bottom = 48
          Touch.ParentTabletOptions = False
          Touch.TabletOptions = [toPressAndHold]
          Align = alTop
          BorderStyle = cxcbsNone
          Color = 7759709
          HorzScrollBar.Tracking = True
          LookAndFeel.NativeStyle = False
          LookAndFeel.ScrollbarMode = sbmTouch
          ParentColor = False
          TabOrder = 0
          VertScrollBar.Visible = False
        end
        object panDenominListNavigator: TPanel
          Left = 120
          Top = 599
          Width = 840
          Height = 30
          BevelOuter = bvNone
          Color = 7759709
          ParentBackground = False
          TabOrder = 1
        end
        object btnDenominListLeftArrow: TAdvShapeButton
          Left = 58
          Top = 586
          Width = 56
          Height = 56
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabStop = True
          TabOrder = 2
          Version = '6.2.1.8'
          OnClick = btnDenominListLeftArrowClick
        end
        object btnDenominListRightArrow: TAdvShapeButton
          Left = 968
          Top = 586
          Width = 56
          Height = 56
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabStop = True
          TabOrder = 3
          Version = '6.2.1.8'
          OnClick = btnDenominListRightArrowClick
        end
      end
      object pgcOrderList: TcxPageControl
        Left = 0
        Top = 787
        Width = 1080
        Height = 400
        Align = alClient
        Color = 2497812
        ParentBackground = False
        ParentColor = False
        TabOrder = 1
        Properties.ActivePage = tabOrderList
        Properties.CustomButtons.Buttons = <>
        LookAndFeel.NativeStyle = False
        ClientRectBottom = 400
        ClientRectRight = 1080
        ClientRectTop = 39
        object tabOrderNone: TcxTabSheet
          Caption = #54000#53011' '#49440#53469' '#50630#51020
          Color = 3155225
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Noto Sans CJK KR Regular'
          Font.Style = []
          ImageIndex = 0
          ParentColor = False
          ParentFont = False
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object imgBuyingNone: TImage
            Left = 480
            Top = 82
            Width = 120
            Height = 120
            AutoSize = True
            Picture.Data = {
              0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000078
              000000780403000000CB4A2BE10000000467414D410000B18F0BFC6105000000
              017352474200AECE1CE90000002D504C544547704C3A414D39414D3B40503941
              4C40404C37404E3A404D3A414D3A414D1925303A414D29333E343C471E2A351E
              D37B740000000A74524E530085DF20CA103662EFA179556E7A00000316494441
              5458C3ED594F6B134114AF9434786B0441E845089E7291A0A0B75E44642F550A
              E2AD78F2D8A3D08B52F0924BEFF906D3CDA2216AEBDBDD0FB0A97E80ACE40364
              1B3F83339BDDCD9B7FDB99A982E0BE5337DD5FE6CD6F7EEFBDDF908D8D2654D1
              BA75F6D419DC07806D47ECD680823F39827780C5A113F6064018A4F0C105BBE9
              01242483F17D07F06B8098101F60D71EDB1E40B420844C5D28A36CCD28968C1C
              287B45D92279A4F0C589AD3CEC29A36CCD575812003CB1630B566CE53185735B
              B69212CB4ECB46E0FB155B79DE297CB560AB871766949D9953F666CD5649D95D
              27B68ABC3F5BB015632C599AEB9BB2051107A667B567CE16CF1715A8E951BDA5
              6C4DF14951BEC6E6ED2362958418F34D15D61AB2948314AFEC9B56F48395B6B2
              84034FD8BF1E5ED96C7BAB840341235460FBE30303B688142974D9D7760DD892
              230378469BC364EF6AB6CA58E09ACCE3C480AD02116389D1486B49A7DB420531
              457FD3CA80797D1B3DC26C0545E72D9E7E2DD827C7B5A389AB06FCC418A06D54
              4759CBE3CBC117AAA376F2F4F985D93E63E1C8B493676B20B40FDA028495F593
              E748D256108A62D10D6B812D41256BA9A926CFA627D1A30A35657D90D851868A
              B2B6C49626754AD9816E90CB79C65275EE6A07B994A6985006EF4CD90AA48C4E
              E163857BDE03DB38C62DCB36AA56D60787B85780872EE0F2A43D135911004E64
              E5ECE13E3603D3A706FC37C1E25735E07F16DC681B817F68265A9468C017080C
              3F95E00CBEA9C1CC54ADC1CA21C54F0A045EC21AEC81DA2F2EB9F983C0D48F55
              E6BBDD19AAC614B50FA16EB8BFEF1CE2218776E727E51456F7F391605E1F614B
              90462AFF8679EC0A4E26C4BB9BAD929BE95CC589707D0BF1DC8FF25722353698
              0A3EAC8DDF1CB1357DA5DB2F56E6C137B9FDB1A5339DB961E06DC144C5BCDB99
              D7B8AA8C37CDD4EBCE78B703D239AD45728A1DE0CBCE1DE155A6BF505B55948E
              F34A2443499EEC4290E84B92253641853117651DD6D4F308B8AA0A255D2775CD
              E03B065FD87692CB66B837E0C61934E03F08EED95F8D2EABEEB9739D4BD90B17
              70F73A17D16AE03CF6ACB1B79B5FA5FE9FF80D3A89D249ACED38C80000000049
              454E44AE426082}
            Transparent = True
          end
          object lblBuyingNone: TLabel
            Left = 90
            Top = 208
            Width = 900
            Height = 40
            Alignment = taCenter
            AutoSize = False
            Caption = #54000#53011#51012' '#49440#53469#54644' '#51452#49464#50836'.'
            Font.Charset = HANGEUL_CHARSET
            Font.Color = 5787719
            Font.Height = -27
            Font.Name = 'Noto Sans CJK KR Regular'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
            WordWrap = True
          end
        end
        object tabOrderList: TcxTabSheet
          Caption = #54000#53011' '#49440#53469' '#45236#50669
          Color = 3155225
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Noto Sans CJK KR Bold'
          Font.Style = []
          ImageIndex = 1
          ParentColor = False
          ParentFont = False
          object sbxOrderList: TcxScrollBox
            AlignWithMargins = True
            Left = 56
            Top = 48
            Width = 968
            Height = 265
            Margins.Left = 56
            Margins.Top = 48
            Margins.Right = 56
            Margins.Bottom = 48
            Align = alClient
            BorderStyle = cxcbsNone
            Color = 3155225
            HorzScrollBar.Visible = False
            LookAndFeel.NativeStyle = False
            LookAndFeel.ScrollbarMode = sbmHybrid
            ParentColor = False
            TabOrder = 0
            VertScrollBar.Tracking = True
            object TemplateOrderItemPanel: TPanel
              Left = 0
              Top = 0
              Width = 968
              Height = 90
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              Visible = False
              object TemplateOrderItemTitleLabel: TLabel
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 450
                Height = 83
                Align = alLeft
                AutoSize = False
                Caption = #49457#51064
                Font.Charset = HANGEUL_CHARSET
                Font.Color = 15198183
                Font.Height = -29
                Font.Name = 'Noto Sans CJK KR Medium'
                Font.Style = []
                ParentFont = False
                Layout = tlCenter
                WordWrap = True
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitHeight = 86
              end
              object TemplateOrderSeparator: TLabel
                Left = 0
                Top = 89
                Width = 968
                Height = 1
                Align = alBottom
                AutoSize = False
                Color = 5062970
                ParentColor = False
                Transparent = False
                ExplicitTop = 143
                ExplicitWidth = 1080
              end
              object TemplateOrderItemAmtValueLabel: TLabel
                Left = 700
                Top = 13
                Width = 170
                Height = 64
                Alignment = taRightJustify
                AutoSize = False
                Caption = '345,000'
                Font.Charset = ANSI_CHARSET
                Font.Color = 15198183
                Font.Height = -27
                Font.Name = 'Roboto'
                Font.Style = [fsBold]
                ParentFont = False
                Layout = tlCenter
                WordWrap = True
              end
              object TemplateOrderItemAmtUnitLabel: TLabel
                Left = 876
                Top = 13
                Width = 50
                Height = 64
                AutoSize = False
                Caption = #50896
                Font.Charset = HANGEUL_CHARSET
                Font.Color = 8550255
                Font.Height = -21
                Font.Name = 'Noto Sans CJK KR Regular'
                Font.Style = []
                ParentFont = False
                Layout = tlCenter
                WordWrap = True
              end
              object TemplateOrderItemQtyLabel: TcxLabel
                Left = 533
                Top = 13
                Margins.Left = 1
                Margins.Top = 0
                Margins.Right = 2
                Margins.Bottom = 0
                AutoSize = False
                Caption = '10'
                ParentColor = False
                ParentFont = False
                Style.BorderColor = 7759709
                Style.BorderStyle = ebsSingle
                Style.Color = 3155225
                Style.Edges = [bTop, bBottom]
                Style.Font.Charset = ANSI_CHARSET
                Style.Font.Color = 15198183
                Style.Font.Height = -27
                Style.Font.Name = 'Roboto'
                Style.Font.Style = []
                Style.LookAndFeel.Kind = lfStandard
                Style.LookAndFeel.NativeStyle = False
                Style.TransparentBorder = False
                Style.IsFontAssigned = True
                StyleDisabled.LookAndFeel.Kind = lfStandard
                StyleDisabled.LookAndFeel.NativeStyle = False
                StyleFocused.LookAndFeel.Kind = lfStandard
                StyleFocused.LookAndFeel.NativeStyle = False
                StyleHot.LookAndFeel.Kind = lfStandard
                StyleHot.LookAndFeel.NativeStyle = False
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                Height = 64
                Width = 90
                AnchorX = 578
                AnchorY = 45
              end
              object TemplateOrderItemRemoveButton: TAdvShapeButton
                Left = 926
                Top = 27
                Width = 36
                Height = 36
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
                ParentBackground = False
                ParentFont = False
                TabStop = True
                TabOrder = 0
                Version = '6.2.1.8'
              end
              object TemplateOrderItemQtyDecButton: TAdvShapeButton
                Left = 470
                Top = 13
                Width = 64
                Height = 64
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                Picture.Data = {
                  89504E470D0A1A0A0000000D494844520000004000000040040300000058476C
                  ED0000000467414D410000B18F0BFC6105000000017352474200AECE1CE90000
                  0021504C544547704C5D66755D67755E67765D66721925305D6776E7E7E72D38
                  44535E6C4A546278DBCC540000000574524E530066A5DA253346C8370000006A
                  4944415448C76360606010324BC30D80F2622B427183300606A619A1F8154886
                  E257C038958002E650020AA40829D020A4C0829082D45105A30A86B182F07238
                  28254FC168488E2A182E0A4C29AE500856496CAD94568B0C9A8414E03702A880
                  4178452B7E05F89B07008B30AA788D243DAC0000000049454E44AE426082}
                ParentBackground = False
                ParentFont = False
                TabStop = True
                TabOrder = 1
                Version = '6.2.1.8'
              end
              object TemplateOrderItemQtyIncButton: TAdvShapeButton
                Left = 622
                Top = 13
                Width = 64
                Height = 64
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                Picture.Data = {
                  89504E470D0A1A0A0000000D494844520000004000000040040300000058476C
                  ED0000000467414D410000B18F0BFC6105000000017352474200AECE1CE90000
                  0021504C544547704C5D66755D67765D66765D67755D69781925305D6776E7E7
                  E74F5A682D384463C1E5680000000674524E530060E188B030B46D82AD000000
                  6D4944415448C76328C70D8A1C1980A02C0D27C85AA9885F415A5AA601010569
                  930929481720A0204B818082B48984142C21A460112105E9A30A064C4146DBA8
                  028A156474C0411B790A464392AA0A4673F7E055B088E20A85609544A852CB14
                  A0B0625D49A06A0657EE849A07007C3537EE7842E29B0000000049454E44AE42
                  6082}
                ParentBackground = False
                ParentFont = False
                TabStop = True
                TabOrder = 3
                Version = '6.2.1.8'
              end
            end
          end
        end
      end
      object panOrderSummary: TPanel
        Left = 0
        Top = 1187
        Width = 1080
        Height = 276
        Align = alBottom
        BevelOuter = bvNone
        Color = 4667175
        ParentBackground = False
        TabOrder = 2
        object panOrderListTotal: TPanel
          Left = 40
          Top = 40
          Width = 992
          Height = 65
          Margins.Left = 5
          BevelOuter = bvNone
          Color = 4667175
          ParentBackground = False
          TabOrder = 0
          object lblOrderTotalQtyTitle: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 110
            Height = 59
            Margins.Right = 5
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = #54000#53011#47588#49688
            Font.Charset = HANGEUL_CHARSET
            Font.Color = 15198183
            Font.Height = -29
            Font.Name = 'Noto Sans CJK KR Regular'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
          end
          object lblOrderTotalQtyValue: TLabel
            AlignWithMargins = True
            Left = 121
            Top = 3
            Width = 26
            Height = 54
            Align = alLeft
            Alignment = taCenter
            Caption = '0'
            Font.Charset = ANSI_CHARSET
            Font.Color = 2631930
            Font.Height = -45
            Font.Name = 'Roboto'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object lblOrderTotalPriceUnit: TLabel
            AlignWithMargins = True
            Left = 962
            Top = 3
            Width = 27
            Height = 43
            Align = alRight
            Caption = #50896
            Font.Charset = HANGEUL_CHARSET
            Font.Color = 15198183
            Font.Height = -29
            Font.Name = 'Noto Sans CJK KR Regular'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
          end
          object lblOrderTotalPriceTitle: TLabel
            AlignWithMargins = True
            Left = 622
            Top = 3
            Width = 300
            Height = 59
            Margins.Right = 5
            Align = alRight
            Alignment = taRightJustify
            AutoSize = False
            Caption = #44208#51228#44552#50529
            Font.Charset = HANGEUL_CHARSET
            Font.Color = 15198183
            Font.Height = -29
            Font.Name = 'Noto Sans CJK KR Regular'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
            ExplicitLeft = 311
          end
          object lblOrderTotalPriceValue: TLabel
            AlignWithMargins = True
            Left = 930
            Top = 3
            Width = 26
            Height = 54
            Align = alRight
            Alignment = taCenter
            Caption = '0'
            Font.Charset = ANSI_CHARSET
            Font.Color = 2631930
            Font.Height = -45
            Font.Name = 'Roboto'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object lblOrderTotalQtyUnit: TLabel
            AlignWithMargins = True
            Left = 155
            Top = 3
            Width = 27
            Height = 43
            Margins.Left = 5
            Align = alLeft
            Caption = #47588
            Font.Charset = HANGEUL_CHARSET
            Font.Color = 15198183
            Font.Height = -29
            Font.Name = 'Noto Sans CJK KR Regular'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
          end
        end
        object btnDoPayment: TcxButton
          Tag = 1
          Left = 556
          Top = 132
          Width = 478
          Height = 100
          Caption = #44208#51228#54616#44592
          Colors.Normal = 2631930
          Colors.NormalText = 15854568
          Colors.Pressed = 7165510
          Colors.PressedText = 15854568
          Colors.Disabled = 3945259
          Colors.DisabledText = 5062970
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
          OptionsImage.ImageIndex = 0
          OptionsImage.Layout = blGlyphTop
          SpeedButtonOptions.CanBeFocused = False
          TabOrder = 1
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -32
          Font.Name = 'Noto Sans CJK KR Bold'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          OnClick = btnDoPaymentClick
        end
        object btnOrderClear: TcxButton
          Tag = 1
          Left = 46
          Top = 132
          Width = 478
          Height = 100
          Caption = #51204#52404' '#49440#53469' '#52712#49548
          Colors.Normal = 5848878
          Colors.NormalText = 15854568
          Colors.Pressed = 7165510
          Colors.PressedText = 15854568
          Colors.Disabled = 3945259
          Colors.DisabledText = 5062970
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
          OptionsImage.ImageIndex = 0
          OptionsImage.Layout = blGlyphTop
          SpeedButtonOptions.CanBeFocused = False
          TabOrder = 2
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -32
          Font.Name = 'Noto Sans CJK KR Bold'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          OnClick = btnOrderClearClick
        end
      end
      object panCategoryList: TPanel
        Left = 0
        Top = 0
        Width = 1080
        Height = 100
        Align = alTop
        BevelOuter = bvNone
        Color = 2497812
        ParentBackground = False
        TabOrder = 3
        DesignSize = (
          1080
          100)
        object sbxCategoryList: TcxScrollBox
          Left = 0
          Top = 0
          Width = 1080
          Height = 100
          Touch.ParentTabletOptions = False
          Touch.TabletOptions = [toPressAndHold]
          Align = alClient
          BorderStyle = cxcbsNone
          Color = 2497812
          HorzScrollBar.Tracking = True
          LookAndFeel.NativeStyle = False
          LookAndFeel.ScrollbarMode = sbmTouch
          ParentColor = False
          TabOrder = 2
          VertScrollBar.Visible = False
          object TemplateCategoryItemPanel1: TPanel
            Left = 0
            Top = 0
            Width = 255
            Height = 100
            Align = alLeft
            BevelOuter = bvNone
            Caption = #51204#52404
            Color = 2497812
            Font.Charset = HANGEUL_CHARSET
            Font.Color = 15198183
            Font.Height = -37
            Font.Name = 'Noto Sans CJK KR Bold'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 0
            Visible = False
            object TemplateCategoryItemIndicator1: TLabel
              Left = 0
              Top = 94
              Width = 255
              Height = 6
              Align = alBottom
              AutoSize = False
              Color = 15198183
              ParentColor = False
              Transparent = False
              ExplicitLeft = -6
              ExplicitTop = 97
              ExplicitWidth = 270
            end
          end
          object TemplateCategoryItemPanel2: TPanel
            Left = 255
            Top = 0
            Width = 255
            Height = 100
            Align = alLeft
            BevelOuter = bvNone
            Caption = #48708#54876#49457' '#53596#54540#47551
            Color = 2497812
            Font.Charset = HANGEUL_CHARSET
            Font.Color = 8550255
            Font.Height = -37
            Font.Name = 'Noto Sans CJK KR Bold'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 1
            Visible = False
            object TemplateCategoryItemIndicator2: TLabel
              Left = 0
              Top = 94
              Width = 255
              Height = 6
              Align = alBottom
              AutoSize = False
              Color = 15198183
              ParentColor = False
              Transparent = False
              ExplicitLeft = -6
              ExplicitTop = 97
              ExplicitWidth = 270
            end
          end
        end
        object btnCategoryListLeftArrow: TAdvShapeButton
          Left = 0
          Top = 0
          Width = 30
          Height = 100
          Anchors = [akLeft, akTop, akBottom]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          Version = '6.2.1.8'
          OnClick = btnCategoryListLeftArrowClick
        end
        object btnCategoryListRightArrow: TAdvShapeButton
          Left = 1050
          Top = 0
          Width = 30
          Height = 100
          Anchors = [akTop, akRight, akBottom]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
          Version = '6.2.1.8'
          OnClick = btnCategoryListRightArrowClick
        end
      end
    end
    object tabPaymentList: TcxTabSheet
      Caption = #54000#53011' '#51452#47928
      Color = 3155225
      ImageIndex = 3
      ParentColor = False
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object sbxPaymentList: TcxScrollBox
        AlignWithMargins = True
        Left = 56
        Top = 213
        Width = 968
        Height = 926
        Margins.Left = 56
        Margins.Top = 0
        Margins.Right = 56
        Margins.Bottom = 48
        Align = alClient
        BorderStyle = cxcbsNone
        Color = 7759709
        HorzScrollBar.Visible = False
        LookAndFeel.NativeStyle = False
        LookAndFeel.ScrollbarMode = sbmHybrid
        ParentColor = False
        TabOrder = 0
        VertScrollBar.Tracking = True
      end
      object panPaymentSummary: TPanel
        Left = 0
        Top = 1187
        Width = 1080
        Height = 276
        Align = alBottom
        BevelOuter = bvNone
        Color = 4667175
        ParentBackground = False
        TabOrder = 1
        object panPaymentListTotal: TPanel
          Left = 40
          Top = 40
          Width = 992
          Height = 65
          Margins.Left = 5
          BevelOuter = bvNone
          Color = 4667175
          ParentBackground = False
          TabOrder = 0
          object lblPaymentTotalQtyTitle: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 110
            Height = 59
            Margins.Right = 10
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = #54000#53011#47588#49688
            Font.Charset = HANGEUL_CHARSET
            Font.Color = 15198183
            Font.Height = -29
            Font.Name = 'Noto Sans CJK KR Regular'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
          end
          object lblPaymentTotalQtyValue: TLabel
            AlignWithMargins = True
            Left = 126
            Top = 3
            Width = 26
            Height = 54
            Align = alLeft
            Alignment = taCenter
            Caption = '0'
            Font.Charset = ANSI_CHARSET
            Font.Color = 2631930
            Font.Height = -45
            Font.Name = 'Roboto'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object lblPaymentTotalPriceUnit: TLabel
            AlignWithMargins = True
            Left = 962
            Top = 3
            Width = 27
            Height = 43
            Align = alRight
            Caption = #50896
            Font.Charset = HANGEUL_CHARSET
            Font.Color = 15198183
            Font.Height = -29
            Font.Name = 'Noto Sans CJK KR Regular'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
          end
          object lblPaymentTotalPriceTitle: TLabel
            AlignWithMargins = True
            Left = 622
            Top = 3
            Width = 300
            Height = 59
            Margins.Right = 5
            Align = alRight
            Alignment = taRightJustify
            AutoSize = False
            Caption = #44208#51228#44552#50529
            Font.Charset = HANGEUL_CHARSET
            Font.Color = 15198183
            Font.Height = -29
            Font.Name = 'Noto Sans CJK KR Regular'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
            ExplicitLeft = 346
          end
          object lblPaymentTotalPriceValue: TLabel
            AlignWithMargins = True
            Left = 930
            Top = 3
            Width = 26
            Height = 54
            Align = alRight
            Alignment = taCenter
            Caption = '0'
            Font.Charset = ANSI_CHARSET
            Font.Color = 2631930
            Font.Height = -45
            Font.Name = 'Roboto'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object lblPaymentTotalQtyUnit: TLabel
            AlignWithMargins = True
            Left = 160
            Top = 3
            Width = 27
            Height = 43
            Margins.Left = 5
            Align = alLeft
            Caption = #47588
            Font.Charset = HANGEUL_CHARSET
            Font.Color = 15198183
            Font.Height = -29
            Font.Name = 'Noto Sans CJK KR Regular'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
          end
        end
        object Panel1: TPanel
          Left = 48
          Top = 132
          Width = 968
          Height = 100
          Margins.Left = 5
          BevelOuter = bvNone
          Color = 4667175
          ParentBackground = False
          TabOrder = 1
          Visible = False
          object Panel4: TPanel
            Left = 0
            Top = 0
            Width = 477
            Height = 100
            Margins.Left = 5
            Align = alLeft
            BevelOuter = bvNone
            Color = 4667175
            ParentBackground = False
            TabOrder = 0
            object btnDoPAYCO: TcxButton
              Tag = 1
              Left = 0
              Top = 0
              Width = 477
              Height = 100
              Align = alClient
              Caption = 'PAYCO '#44208#51228
              Colors.Normal = 2631930
              Colors.NormalText = 15854568
              Colors.Pressed = 7165510
              Colors.PressedText = 15854568
              Colors.Disabled = 5523260
              Colors.DisabledText = 8550255
              LookAndFeel.Kind = lfUltraFlat
              LookAndFeel.NativeStyle = False
              OptionsImage.ImageIndex = 0
              OptionsImage.Layout = blGlyphTop
              SpeedButtonOptions.CanBeFocused = False
              TabOrder = 0
              Font.Charset = HANGEUL_CHARSET
              Font.Color = clBlack
              Font.Height = -32
              Font.Name = 'Noto Sans CJK KR Bold'
              Font.Style = []
              ParentFont = False
              WordWrap = True
              OnClick = btnDoPAYCOClick
            end
          end
          object Panel5: TPanel
            Left = 491
            Top = 0
            Width = 477
            Height = 100
            Margins.Left = 5
            Align = alRight
            BevelOuter = bvNone
            Color = 4667175
            ParentBackground = False
            TabOrder = 1
            object Image2: TImage
              Left = 0
              Top = 0
              Width = 477
              Height = 100
              Align = alClient
              Picture.Data = {
                0D546478536D617274496D61676589504E470D0A1A0A0000000D494844520000
                00AA00000026080600000054040021000000097048597300000B1300000B1301
                009A9C18000000017352474200AECE1CE90000000467414D410000B18F0BFC61
                0500000AA9494441547801ED5D6F72DBB6125F90922CCD74A6EE091EFDA18DD4
                2F714F60E504B54F50E504B14F10F904754E10F5044D4F10F60476BF544EFB21
                CC095EDE4CDF48FE23E2ED92901F2D11D82505B2FED0DF8CE25804411058ECFE
                B0BB8015182C86C34908700435A0B4FEBC0A824FA1D657DDEBEB181A808EA2FD
                FB7EFF95D6FA188220CABFD457F8EF4FBDEBEB195400D57533184C02AD9F9BAF
                7EAD5A8714CBD1E854A5E991526A1FFBE9EA5EA93783EBEB046A80DA7DD7EF1F
                038D93D6878075E2FFA387024A7D86344DE8273D0B3FBFDE05C155DDE749DB83
                CF79AE01C6B6F6E0356AD36F01405C573E54F6B0BDBDF758D121F841829F7805
                70EEAB83046D9CA1A0BD04017042463821DF43B1437324D8E6172DB4B9F2738C
                12F9014818EA21861A13BAA1F62450433ED4DD68F4236AA9536806331F027B3B
                1CBEC51F1357199CB5E77BD7D753D8A52ED442BD0F1FBE030F60DA1CA3D0BC00
                0646205EC3F6A4AA8B043FE77505B681F688E54361877EF4F8E03224B7ABD5C9
                177FFE7905356034E047B6209A99EE6271A092E4B3AB18BEAF7657A32EBAF3F9
                19EC80DBD1E8150AFD85AB0C0A8BB25D33EF4C823E866630EB2E97675C5FB5D5
                1EEC88295282735719A40D8D0A2921EA753AEFFFFAFAEB5AD4C2CC601E5AEFDF
                F6FB4ECB401D0E6C35FA14CB8DA126CC33A650137F7DFBEDA1A12663680E13E4
                963F4B0ADE615F844A5D36D91ED41C53B24044976C65026803284424AC124129
                C2949F48CBA3367CE5BA9E991822F80C487BB83A8DB9F73DBDAFB39052A5D685
                84B4A775197F6E02E39BD1E8D855E07E38FC414BDEC70F26C4E96DFDDE8EA012
                F0658DF910A39313F64ACFC099397117D16F8047743F18C8347901A87D64FCAD
                A40D342933216D472832A037626CBB76F3CD37C72952046813B8F0CC16A06597
                38CE8603FB4E59B49026974B9A46553C0666C51B4BCAD6E4CFEC4205EB159956
                9DA6277B7FFCF10E042013A97393CD61CB43E1F044D84163826383CFFC54F8EE
                79A5F1C009838BC72DBA94B587CC7DB54993E0272EB647E5F71F55F52895AD13
                3ADC4DBD203855F3F92757197A3154CD1325E09321F94173770930754EA09E09
                1C13C7744D069C2C2F2503A1C2F02DD6C5FA21E9FDB5CC5A24B488D9FCB2E24A
                3A77EDCCE73138DA83EF778AEFF7BDABDE9552A59330AC66EED7AEA618B8F690
                8514D46BD609BF14EBF462FA6920C935741B04BC6B270844E6DCB988627826B7
                00A3F6EAD58AF7BB0AE98A54D0C89A6CAEB4EFF285DB84BB97DE3955EA8CAC05
                6791E8FD7AF3F9293D0F27D04FA585509B96D523A62FC61F5CA93D5A937CC482
                BAB7D6095E39EA17BFFF7E45FE4C67211C7C3D1AFDCB55C40C5EE4A8E31D23AC
                63CECB9099748C12018F3145976C178DE69F000312B232CDAC255E0D7CD75BA5
                5EF4E7F30BA800A340266441201790C4FC7C6933F95AB6784DAA50B8627B48B0
                AD93E731A2A21787E5A85DA522CEF41721F17B722FC97148BCFF80A51A16FEB5
                F5AC67CF2E590E858242DA6053D02A70CBD2C89994D756E1CABBC038F4390BE2
                2582275A2760BFA326FE8AFEEB7DD52F7101858E81352EA931D811673373B9BC
                703E072986C4C5843CED8475591105D07ACBEF68BE8BC08D525E9A552BF36ACC
                DA105282D067ED25348E7D22EAF7B54FBB19F794D6CE06684703B9CED2C65C13
                D743D2FD8BBD201F002088F92AB94E30DCBCFE35E37282D56C192F2D600CFCFD
                E7D0026E73AA1431C5625FF90266FC58EA65720AFC0BAAD16291AB4C6A116481
                833FD99BCF1FB40BE7E7A3008044AB4AF9EA3A6A65B8DC942B6FE3A504A160CC
                9ACA7CDA44DAE98C05C524DC520CD62AE618D33FDE057599A7A139B15AAD4A1B
                D761224BB0A15D0CCF8DADA551ABDE09DA43E82E16539336E80471B850E82F75
                2D7E566128D1C65E05C385304D8F9C05882F7A4E8564AD628E8816DF5E05D52C
                2EDC3C075FD896A0A2731FAB15AB12A1140CA6C81D469D26E2ABB9168C983209
                67B203810BA8BF5CD64AE4A903CDB5473089EB2015B8AB965A1F7813D44C4825
                8B0B722D95DF3F61EE2D35833898ACAB4A9A6442F5E3EA7EA7CC298270551C31
                D71369769317AC93D1ED48A00184AB95C48A456C64EA1EA519075A591EB20F68
                C2B20C6FA526F815BFCAB668404E13DB34140DE6CD70F8C6E5AA3275C720000A
                D8EC76343AC409C5D1905268E1AA38D0FA4BEC3378326022468F42B51E8114E8
                732828C70A2AF9F9AC1585F995ACC3B5D31DBB465CE63F1568D3D835F844CA91
                8BBA049D0DAB16417C15EB73861F2D984992B7FF4175B4973D454EF33C42B285
                90E7914E1E6A4C64EC2A1332FC77B33E32DF9294C002922AAE24F408FC079E12
                98774555E48C26D64547A00CC89DD99AA092AFB24C2B0A1CFC8964B5C90A8930
                00B006B5354D53B1E0558DD628C1A2AD6E4E6C2D30BE6F8F7BEA1E01FB987D47
                7267B2A67F67E4E96867B6E88A201A1271615E11FE1F00984A6FE97FF870817C
                35E2F8AAAE11ADC145DB15C7CDD0D547C211430BA05DABA8B92247916CE2F85E
                E0A920F89E2B43DE8FA6356A4C31729B46AC9AC1BF2BA401802256CCDE27421D
                5E2A5AED56A02BBB02A9C86FCE0238D1698B39F8C7D87955A92B9A1C4D096A5C
                48014B6C85C4FBA17CA1B9CEAE8C1EF99239F35F91AEEC02893F33C8F35BBD41
                94736CFCB7BB0B6A6EDAA9B219850CBBCBE557921C45330063681941D5ED2D0D
                828DCAE0C4AAB325A60EB2F11284335D298F5540E32F51546B7726CB51ABA6F9
                4941A1D6B09D4D6C8FA1F56115575593A05C05CEE35196ED5E17945FA0C270BF
                839CAF8C6B529208B74B0327FA6B6CCFBB5D7310B209A875C4144BD6EFDD9E7B
                6A03AD9BFD27F2EC22D85C058350A99FEB6E372750DE6BB6FF2C0C2FC92F8E3E
                E27F9B4CFE47102589E4BB1E2AEF28DE68CF6BE1A1270F5E97BF455077D80FE5
                0BE2B06AD310F95ECD76736E87EDD66D74AC109D845392DC6DF6D24F8ADF4953
                EFA82E12D63AEDC9F6EFCB3C2F8FDC927F8BA072E68E76215216FF2E1F6062D3
                E113E1AA52AD6A429C6F2933FE8E99642410C42551735E329A6BAB0F32AD2A8B
                EB4755DA435AF46E30F808422F0F9DAE53FCDDFB56140E92ED172468BB72A09B
                E170CAF12D5AF8717E41C9D61AD7F13C12D4DA2E8DC2A469115B702B99FC81C3
                CC392FDB454A5AEB60F3CBEC208C34BD846AB0B7A7E2A259979C23D6BCC37FBB
                119C26F3922C9CC5FF078357AE01AB1A00680AF4BE281C2715852352B983FEC1
                D7FA90E422CBBB2024655FD226CDE5B3676781523F821CF6F654006DFC2BF34B
                B76AFA250E7E5FC9C212BE552700D01448386CB9100DC2DAD71495D32D6D8359
                C308E9A4EC5ADB1C75ECBC8A51089F6E23F6481AD4B6FFED76237822A014C32C
                19A6A1DCCF22CC1901335719D26CA987FC5C1150A9D8849440829A800B8B457B
                593EB215A7188642C4B00330CECC256B788D7DD3446D5858133A28447A460069
                56C9E2B436F2FE7BC96D6D0F52B770CC7C262130D9F849AF81E3C919F74FC29D
                DB9A5108CBD13719D2D40B5529C21CD47060A840023E80FD4EA61C1790DF11CD
                A8726B23ED21A0ECD199B692710F68C6587660C6B6FDE87541835E9A3A472781
                04C1093400D250A55CABC2337B8B45F900D1DF2CB8B9994243202AF0202075F7
                2CAD051405824CF92E8AC76B7B28D48E5A54DA9E87651939C003C321534B26BE
                2F98FD55A7D8E82F698B03ADD09BDE1F946D4F0E82C92ECFDCF8831C8DFD810A
                C7F369657D8C8376949DDA47FB9C1E7B35922CAF14B93E654391BBA8E971C41F
                99DC98C4EA08CAFFF8C5CEEDF91FAF51317D7486B6A30000000049454E44AE42
                6082}
              ExplicitLeft = 372
              ExplicitTop = -5
              ExplicitWidth = 105
              ExplicitHeight = 105
            end
          end
        end
        object panPayment: TPanel
          Left = 48
          Top = 132
          Width = 968
          Height = 100
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          BevelOuter = bvNone
          Color = 4667175
          ParentBackground = False
          TabOrder = 2
          object panCard: TPanel
            Left = 737
            Top = 0
            Width = 231
            Height = 100
            Margins.Left = 5
            Align = alRight
            BevelOuter = bvNone
            Color = 4667175
            ParentBackground = False
            TabOrder = 0
            object btnDoCreditCard: TcxButton
              Tag = 1
              Left = 0
              Top = 0
              Width = 231
              Height = 100
              Align = alClient
              Caption = #52852#46300#44208#51228
              Colors.Normal = 2631930
              Colors.NormalText = 15854568
              Colors.Pressed = 7165510
              Colors.PressedText = 15854568
              Colors.Disabled = 5523260
              Colors.DisabledText = 8550255
              LookAndFeel.Kind = lfUltraFlat
              LookAndFeel.NativeStyle = False
              OptionsImage.ImageIndex = 0
              OptionsImage.Layout = blGlyphTop
              SpeedButtonOptions.CanBeFocused = False
              TabOrder = 0
              Font.Charset = HANGEUL_CHARSET
              Font.Color = clBlack
              Font.Height = -32
              Font.Name = 'Noto Sans CJK KR Bold'
              Font.Style = []
              ParentFont = False
              WordWrap = True
              OnClick = btnDoCreditCardClick
            end
          end
          object panPayco: TPanel
            Left = 462
            Top = 0
            Width = 231
            Height = 100
            Margins.Left = 5
            BevelOuter = bvNone
            Color = 4667175
            ParentBackground = False
            TabOrder = 1
            object imgPayco313: TImage
              Left = 0
              Top = 0
              Width = 231
              Height = 100
              Align = alClient
              Center = True
              Picture.Data = {
                0954506E67496D61676589504E470D0A1A0A0000000D49484452000001390000
                00640806000000FD86476C000000097048597300000B1300000B1301009A9C18
                000000017352474200AECE1CE90000000467414D410000B18F0BFC610500000B
                5C4944415478DAED9DBF93DC441680A59925C4E5D82426838CC4A417407EEB7F
                004C0CD49910127002215C01F119FE81B573135C0AC191998C4D207699D03B33
                F75ECF68198F25BDD752B7E4EDF9BEAAA9995DAFA59646FDE9F5EB1FAAAB1636
                9BCD7579BB23AF7FC8EB2D79DDAC00005E3E7E95D7B9BC1ED6757DBFED0FEAC3
                5F88E04EE5ED3FF2BA3E77E90100223897D7BD43D93D273911DCD7F27677EE92
                02008CE00B11DDBDE6874BC989E03ED77F9CBB74000009F84644F7897E089213
                C1DDA9B64D54008052B82DA27BD048EEF78ACE0500288B27F27ABD268A038082
                F9442577261F4EE72E090040061EAAE4FE576DC7C2010094C6B94A6E33772900
                007281E400A068901C00140D920380A24172005034480E008A06C90140D12039
                00281A2407004583E400A068901C00140D920380A24172005034480E008A06C9
                0140D1203900281A2407004583E400A068901C00140D920380A2417200503448
                0E008A06C939599F9D55EB5F7E19F47FEB575FADEAD75EABEA37DEA8EAB7DFCE
                53C0BFFEAA563FFE586D1E3DAAAA3FFED8FEEECD37ABC5E969B5B87D3B7A5BE1
                787FFB2DFCB8B8752B7E1B4ED652E6F5CF3F877DEAF959BEF75E55C9B91A7A0E
                D672FCE17B7AFC38FCBC69CE45B5FD1EC2B6AF5DBBFC2E16F23E787FCEF26CE4
                3C6E76C7D85A9EDDB5B190F264BB3E8E1824672117E68554BCCDAEC28F25C84E
                2EE4E5871FA6AB5C46195550CB2FBFF46D4B2AE1C5FBEF3F57199B729FFCF043
                F6320FD94F10F283075B910C20C86EC8CD204379B25C1F470E9233587DF55588
                367210E493E0625E7DF659A858BDFB92FD2C3FFA68D4B634DA3831F693A2CC5A
                C983E80C824CBEFFFE05210F4505A3E769A8EC529727D5F571EC2039838B77DF
                4D76D1B6A1156BF9DD7741208390B23D93329A48D3E8959F7E0AEF7D3C93266E
                1F0B89BE969F7E3AEA98F5A6A1378F3E5ED1E666CF315F882487466E16412E7A
                8CC6B99AAC3C72730AB28341203903ABD227412AD38954FC21A2F344710D5634
                A732BF700853A3ACC1B923DD87486423CDD53E3A2527CDDB0B39869C371EC51B
                4DAAD8565A1EE378C6122D5EB804C9194C223945232D95554CD3C41BC5EDEFC3
                88369EA9BC8C0A1BF2665AD60115CE131977368B55709AC7CB2C9486936FBFAD
                EA9EF3AB79B7D5C8A83686705E347582E8A24072069349AEF2470F0D9AFF5949
                533706ED80E8CB39AD657B2BD9AEC59066ABB7BCAD6574468029E93BC6B534FD
                578E1C676A52E6458F0524676049AE7EE79DEE3BAB5648A99C313DB3314DC121
                F9428F4843EFAA23BFA4B9C4851EBF03DD9E6ED7427B399787F9BA8E1EDFDEE3
                D4EF44CA56EF45C6E17B88F83E3A253740B8F58D1B55A54344F623751D5222E7
                25B6E73E455EF49840720696E44E1E3D7AFEC26D412BE746EEBE292324CDC369
                3E6E08964837BB4A6C355BDD4D6CA7A442278C6CAF3EB869C4E41DEB5BB742DE
                D13ABE8D8ECF9368ACAF4C5DE729E6E612539E951EA3539CA3F2A24706923348
                21B906BD635F58C3131C7933A5AFA2A924FAA20C4F34B711015C389A639E6D79
                25D5762EBD11A01EB3F642EA4DC28B9E3F6D9E6B6EED90AE9B8DB7C91D842DCD
                EE1811697956CE5EDA3179D16303C919A4949CE2C97959DBB42ABE36F9344AE9
                8B0AB48258BDB96B6936AE1C630417228365875CBC11A70AA54D509EA6B30A6E
                39B077BA296390B0DE3474AC9CDC885AF3963111A9465A03C7B7796F0ADEB18F
                C70E9233482D39CF300DAB2962557C2D93D53CF6368B43EEC9CA1975355B9D52
                68CDC355FE282E263738068FB0C70AAEC195177546FDC70E9233482DB9B04D63
                98466F0FA8316C4473406198816CFF9956FCAEFD3807077BF3736DBD7E1E4176
                E5E114D74C8E0E41E6C0938BB37AAFDD58DFDF0E72733648CE2087E4ACCAD237
                3ECBAAF8FBFF57C770B5E59B1ABCCD1D6F7E6E3F3AF4E6AEFACE9F472A43CEFF
                103CF9D4CB1B4C223CA98D5A247F3291E4AF2A48CE20B9E4F40E6DDC793BEFCE
                5614A7C9685D856487D9DC7346738A373F77B26BAA79062977E5E142D91D5299
                328AF34C454B16C53538A2B9C3EF1C5E04C91924EF7870E475BA3A052CD1B455
                322BB7E3AE98CED5589A7331340F17759E266CAAAD3EFE382C9BD449A6FC9815
                8D87F33051347B554172064925E749C4F75416B399DB52164B1631B32CDCE3E7
                0C3CC9796DEAAE8DA65A384F130DA1B0F28BA99BAA0D2F9BECAF2248CE2099E4
                54103A91DB8884BA221CEB62EF8C8C1C4D9E984A32661072CC39B32298A99B69
                566751AEDC98A7D99EBC995C1848CEC0945CDF028F3A6DE7F1E3EDCAB02207CF
                34A0A1A3ECFBC46125B0A3E7CC3AF3736DB8D7B5339A87934BCE5A822AD39835
                CF902324D70F92339874827E4793C76C725A4DA5319D1D1DDB0BCDB7C879B331
                1D05486E0B921B0F9233984A7261D4BE7638B44463293A0FAC6DC44EFA8ECDCF
                C50E92A5B9BAC53320DA5A12EAD84172065349AE73D47EE4B0912E520E2769F0
                0CAB6888ED01F42C3B3F69C783912EC8B50492678C221D0FFD203983DC920B13
                CB75BC58472416B302C7588634B93CF9B941DB7DC97A155D4348226F12AEFD3A
                BEFF29657F1541720639251796E11149744638B12BFF8E654045F5E48C7A9FD7
                D0B55DCF60E009D755F3CC3EE85BA860287345902581E40C7248CEB3C6983265
                14D7105B5173494E319762CF143DB51EA7233716DB4B6DE18966A79CF5715541
                7206632577F900617D78B06CAB96E8A4F654CA813D9863898D0C724ACE33DA7F
                CA68CEF3FC8B64D19CF3FB271F6783E40C724CD0F79062D0ED50622A4E4EC979
                975A4A55D1C340EDA74FAB5ABFF3961B91EBF917431E48D482A7E38579AB3E90
                9CC15C92CBFDBCD73EA2A77A65925C380FCE75D5863ED2311C833E565057E4DD
                3BDFADCF3A752E7F14E4D33748DC60D4037FE005909CC11C929B338ABB3C2E67
                74945B72DE684E45B7ECE9A56E456415E6C876444C6D12F13ECD4CAF09ED558E
                2E8F46708E7401519C1F24673087E43C0377639E65D0C6CA5828203CCC582AB9
                456EC979CEC73E2A668DC07A052D32094B9E8BDC7A7B2EDB22DAC85CA9B73C3A
                0C6723FBF23E01CCB37C3D6C417206534BCE35C23DC13E3D118967FCD514920B
                0F78897D24E1AEB3E73911E85C62CDBBE97C62874CBAA225D7038922CAE31578
                03CF768803C9194C2D396BD848B221038EFC92A7324D21B9B09F0162194BDF9C
                E098D91E2961C8483C48CE6052C93906FFA61C326046738E716853492E9477E2
                5CA595D8F7E6E75281E08681E40CA6949CB9DA48E2D1EDAE278719B99F292517
                F6D7D2139A83BEA5D9F7992AA29B723C60692039036B2847CA798396E4720C19
                301F6F6825B8AD659C322C0B3E2447E725AC9622115A4C523F6B798CB9CD6083
                E40CFAEED4C99B0F3D79B25C4306FA3A3ABCFB0C2B1E6BB3B6ED1C658C40420F
                A9341753C825C844CA5ACBB970CD48C95C1E25F4A2EBF43F26DF8F02C939685B
                6923CC3F950B3AF505D826D5B14F8837F7D9925B8ADA67C7B00AFDBF611B992B
                E9E57010EB21D82DA490DBCB5E9E6307C939D18867BD6B762DA4799673BEA0CA
                225492A74FAB854453535CF05A21B5728ED967A8DC7BE768EA26969E378D2843
                1954B8FAF35E545CDFB85155D7AEFD3D8F58877464FE1EF5BA09AFA63C7FFEF9
                77790EE735672ECFB182E400A068901C00140D920380A24172005034480E008A
                06C90140D1203900281A2407004583E400A068901C00140D920380A241720050
                34480E008A06C90140D1203900281A2407004583E400A068901C00140D920380
                A24172005034480E008A06C90140D1A8E47E97F79B731704002003E72AB933F9
                703A7749000032F0502577573E7C3D7749000032F0814AEEBA7CD026EBF5B94B
                03009090F3BAAE5FAFF593884E9BAB677397080020211F88E4EED7CD4F22BA6F
                E4ED5F73970A002001F744705FE8877AFFB7223AFDE5E773970E006004FF16C1
                DD6D7EA80FFF554477A7DA8AEEE6DC25050088E049B56DA23ED8FF65DDF5D73B
                D9FDB3DACAEEADB94B0F00D0C2B9BC7E95D77FE5755F04F7E4F00FFE0FC94762
                7E9A6F81CC0000000049454E44AE426082}
              Visible = False
              OnClick = imgPayco313Click
              ExplicitLeft = 372
              ExplicitTop = -5
              ExplicitWidth = 105
              ExplicitHeight = 105
            end
            object imgPayco231: TImage
              Left = 0
              Top = 0
              Width = 231
              Height = 100
              Align = alClient
              Center = True
              Picture.Data = {
                0954506E67496D61676589504E470D0A1A0A0000000D49484452000000E70000
                006408060000007DD02756000000097048597300000B1300000B1301009A9C18
                000000017352474200AECE1CE90000000467414D410000B18F0BFC610500000A
                B74944415478DAED9D3D731439108667764D88CB312490414662D20B203FF307
                F888813A0821011208E10A880FF80398DC049742706490E10462CA84DE8FEBD6
                EE98DDB546DDD2483362E77DAAA6766DCC4C4BA357DD2D69346561613A9D6ED1
                C7753AFEA0E3021D670A00404C3ED1B14FC7BBB22C5FD9FEA05CFD050973873E
                FEA163AB6BEB01E809FB743C5A15E9923849984FE9E34ED79602D0531E92401F
                553F1C899384F980FFB16BEB00E839CF48A077F98B112709F37A310B650100DD
                738504BA5B89F36B81411F0072E1071D674B784D00B2E42E8BF32D7DD9E9DA12
                00C012EF589CFF15B3B94C00403EECB338A75D5B0100380EC40940A6409C0064
                0AC40940A6409C00640AC40940A6409C00640AC40940A6409C00640AC40940A6
                409C00640AC40940A6409C00640AC40940A6409C00640AC40940A6409C00640A
                C40940A6409C00640AC40940A6409C00640AC40940A66421CEC9DBB7C5E4E3C7
                B0029C3C5994A74F17E5B9734579F1621A037FFE2CC66FDE14D3BDBDA2F8F66D
                F6BBF3E78BC1CE4E31B872C5FB5CA6BC5FBE981F07DBDBFEE75032219B271F3E
                986B72FD0CAF5E2D0AAAABD03A9850F9CD7DFAFCD9FC3CADEAA298DD0773EECD
                CDA37B31A0CFE0EB29ED99523D4EE765B4DA336F1B03B22759FB4844B7E2A40A
                1D518399CE1B6AE3C2F08DA01B30BC79335EA3106C64610D1F3FD69D8B1ACFE8
                DAB5A54654D9BDF1FA75729B43AE633A92DDDD99000230220DE9C412D893A47D
                24A453718E9F3C31BD7B0A8C6822DC84F1FDFBA64138AF45D719DEBAD5E85CDC
                BB6F08D7896133374E2350012382972F8F7524A1B030B89E42451ADB9E58ED23
                259D8A7374F972B4CAB6168E2A7EF8E28569F841906D8764A308855027DEBF37
                9F2E0E29147631206F37BC77AF5199B9B3E34ECFC5090E4B1D651E91B8433DA5
                8411059751A8ABD6ECA14ED58834433A15A7D458A3408D60831A6C8840355EB3
                42F29EDC098D144267AF169C1BF135A8F14F29AC75512B4E0A83475486941D26
                A3F5DE2CC831DB2394A729DE1D464BACBF3819F66C2C329F1046EB3517AF21F4
                EE872C3AA1A199BC906D0D68289A48A4367C6661729E9A5808151BCF9F17A5A3
                7E39AF1C378C227C30F5C229564602ED87380B7D6F5DC1F9CD9842621F7860C8
                95534DE87C633AAF444878ABB5D76AA3D2E3C6C455C609A50863450E1F9B9879
                7F147B72166779E9527D4FC60D891A95CF48AF4FC818920F6B3A00335AABC89F
                38571E70F915F0F9F8BC123C6A3A5CCD476B46909DE5E47B42B6950B9188B90F
                1EF7A3569C011D4579EA5451F054C96264C4532B542FBE330131F2FE58642DCE
                8DBDBDE50AB7C08D6A4ABD5D4C8FC47926E79B21481DC074DEF8A4F0561D8A2B
                C56506C7E87CE54A67E7935797DBDB26AF96CA37E5F955F27E2E9BEAEAC9A753
                F4B167CC65540ABE51DE1F91DF5E9C15DC438EA4617A455EC8B81A08376E57AF
                AEF19E536AB82345D8A63997565CB6BAD47A5C2E338F6A72E7A685EB8FC378CE
                1D57A9EB24B5A1B9E968283CF71110DB33568EFA36C9FB63B236E26434399D74
                4EA9C17268C85EC1D50BF38D95468727145E8E1573BC036AC4C31A51683D3C0B
                C1262C4D88CDC21C068E7657369ACE833B3B9EEBA40ED49A97FB4400ECD902E7
                27B59D9976EE3A256B254ECD748514B2480D966D92C2686DF86C722B2927AA0B
                6F958DD99A67167AAFE993FB3641D3D1341566852AEF57465929592B719A730A
                D315CE115561FA84731C33DC4EE73FE4065B771DE5A2046DFE691B45D408BB2E
                CF64542B9F6A849D024DAE298D86AB91EEDF9CAE73CFB513A774935DF36B5283
                5DFCBF3C0767CBA72AB4619136FF5CF4C6DADCCC557F1A3184D47F089AF182A3
                8E31129A14A8A4CE69A3A5CEC97AFDB51227F788424F57DB1B4A5E930709F8A9
                94396258A8F49E8C36FFDC9887749AC5117579A6B15D218636BDA666C96134AF
                59A1F09EABF7BC6DD64A9C9ABCA56EB0461288AD7148B98BBA41299FCEA9EA22
                34CFF4AAA71643BAF1EDDBE6F1AF5A12E57F52F463EAA1A5E8C1C6FA88533340
                E2B8C962386CB1456AE43EAB92D4F39F029A41130E8927424867EAA9A5A90429
                7F8E1DD256E4D6491D2BF75A88931B362F90163C4F9D47916E52AD275284463E
                37B7C9E2079F3A933C46DBE19C3488972AF7D384F7D1C3690FF216A7EBC1605E
                9EF5F9F3EC49786AD49AE55EA1AB525C0D5E1A58F05ED3ABCC3F6DA89F2B15C2
                C8D6C5293D4A9768CE5133F50671B651D09AD0480C4DA590AAC92054CDF94C98
                E7B9AED7670007E29C01713A684B9C66950B0F0459BC5F8C411DE91CBE8BA97D
                F34FDFC97984B533340B31A447DB52D20B71D6AE72F19C3EA923E6B44A85667A
                A1C2774451B33D4CAB0342425A91EA512ECD1C33068452158E176CF37C5F8DE7
                F37922A32921A19926FF0C3A6F66A394AAA914CFCE4D755DC5FD6FB3935A656D
                C5691E27A2C65DEB517C773A684A4003D3E444CEFD80EACEAB5984D0E2738D9A
                D53AAE070042E9CA636B593B716A9EF163DAF49A15BE0D2C95381971CB9444DE
                CA5A4E45EEE73BEA2DA1891EDA5C25652DF3EF2CCEA38D8379D3603A5749DEA0
                D434A6C011D1A6F8F6C429C5A9591DD3A6F7D4ECAF14CD7B2AEF3F16BE3B48B5
                742AC6647F283E373CA538B58F8CC56AA06681C8C14151F23DB774A0AAFD9542
                366AB3A01910EB7A5DADB1A18FE24CBD5FAE0BEF257D89C469EA41F95C63E8D6
                A2A60CBCBD25EF40B050DFD6BD62958F7135DD1DBFD146682DD33B7176E9358F
                CAA5F446A9C5A9F59E2CD0A163D4DB0ABF5F86D7F0D678285BE3D7EE4E18B47B
                3CDBC31E539156E4E0358D1D7D13A766C180CF5E3936C6C2027CEDFB55528B53
                531F8B54EF1971762CD58B9AF8C54FAE91505B04E13916A0B5C7BC848AAEA5DD
                D14FB3CD4C1BF44A9CAA152111AEA9F1009AF9B336C46936BEF2DD1A733E08B7
                D48079AD33E795BCDE5921823AEFA4DAA8CDC31EDFD738E4B077D051B9FA244E
                69FA24DAD0B9227FD2348236C469AE132088A6B8D62CFBAC8E8A49D75327ABF4
                479C8A45073187CE45EFA998476C4B9CC6DE9673F158BBE3C722376132BD11A7
                F8F449E4D520AA9D0085DCA64D719AEB59465653E0DA426591B63C684EBBBC2F
                92F52B0063AE6B94C49962E85CDC66531A78901E474BB07D47480EAA25E4958C
                49ED11D65E774DA7E274F58CD1C30C471E986AE8DC3500A5BDA6D9E181C35F5B
                1D25ECF163BEACD688806C2DA92E542BB812DBC39851795EE699D15BC556E9F6
                B5F385FDC90BB33E966E44EC8AB375064D773417AF69C99DBCAE5933BDC0FFD7
                9C2371E33A9A16F17C215055CEA6A2CCDD9E94742E4E863DCC641E9E0DF86D51
                09D7339A7778F0CD3D382806E4BDDAB851DC90B85135B9A669940B75D4762866
                5E08441EDCD8C01D05FFBC108598377D6D6EFE5AE7CC531B89EFA3798B181F95
                3DDFBFFFB26775DD75627B529085380100C7813801C8148813804C813801C814
                8813804C813801C8148813804C813801C8148813804C813801C8148813804C81
                3801C8148813804C813801C8148813804C813801C8148813804C813801C81488
                13804C813801C8148813804C813801C81416E757FA3CD3B5210080253EB138F9
                05213B5D5B020058E21D8BF30E7D79DAB5250080256EB038B7E80B87B65B5D5B
                030030EC976579B6E46F24500E6BE3BDFF0E00D0841B24CE5765F51309F4197D
                FCD5B55500F49C4724CC87FCA55CFC2D09947FF9A06BEB00E8297F9330EF543F
                94ABFF4A02BD5ECC047AA66B4B01E8093F8A5928BBBBF8CBB2EEAFE722FDB398
                89F442D7D603B066ECD3F1898E7FE97845C2FCB1FA07FF03B283626E3BA29527
                0000000049454E44AE426082}
              OnClick = imgPayco231Click
              ExplicitLeft = 372
              ExplicitTop = -5
              ExplicitWidth = 105
              ExplicitHeight = 105
            end
            object imgPayco477: TImage
              Left = 0
              Top = 0
              Width = 231
              Height = 100
              Align = alClient
              Center = True
              Picture.Data = {
                0954506E67496D61676589504E470D0A1A0A0000000D49484452000001DD0000
                00640806000000C38FEA67000000097048597300000B1300000B1301009A9C18
                000000017352474200AECE1CE90000000467414D410000B18F0BFC610500000B
                EB4944415478DAEDDD3F77DCC41AC77169D72993933A34A1231D4DD2DE02FAEB
                BC010875C22194D0409AA4040E497D036FC0499F14B785E2D2391D6EA0CE49CA
                7877EFF3CC5A66BD489A67A4994766FDFD9CB3C776FE48B35A1FFDF4CC8C4675
                D562B55A5D952F77E4F52F797D28AFEB150000E87324AFDFE4F5BCAEEBA76DFF
                A0DEFE0309DC7DF9F21F795D9DBAF50000FC431DC9EBC176F89E095D09DCEFE4
                CBFDA95B0A00C08EF85682F741F3C369E84AE07EA37F3975EB0000D831DF4BF0
                7EA9DF84D095C0BD53ADBB940100407EB725789F35A1FB7BC5642900004A792D
                AFF76BAA5C00005C7CA9A17B20DFEC4FDD12000076DC730DDDFF55EB7B710100
                4039471ABAABA95B0100C04540E80200E084D00500C009A10B00801342170000
                27842E00004E085D00009C10BA000038217401007042E80200E084D00500C009
                A10B0080134217000027842E00004E085D00009C10BA000038217401007042E8
                0200E084D00500C009A10B0080134217000027842E00004E085DB85A1E1C54CB
                5F7F1DF47FEBCB97ABFABDF7AAFA830FAAFAD6AD320D7CFBB65AFCFC73B57AF1
                A2AAFEF863FD67376E54B3FDFD6A76FB76F2B6C2FB7DF52AFC38BB79337D1B46
                4B69F3F2975FC23EF5F8CC3FF9A4AAE4580D3D064B79FFE1733A3C0C3FAF9A63
                51AD3F87B0ED2B574E3F8B997C1DBC3F637B56721C5727EFB1B53D27BF1B3369
                4FB1DF0F602442173EE444792C41B03A09A0B142F8CA89757EF76EBE937DA48D
                1A98F3870F6DDB925038FEF4D333E1D0B47BEFA79F8AB779C87EC205C2B367EB
                601B2084EF908B9302ED29F2FB016440E8C2C5E2D1A3508D9510C230C3C975F1
                F5D7E144DFBB2FD9CFFCDEBD51DBD26A6C2FB29F1C6DD6D009C11B11C2EDC993
                BF5D200CA581A7C76968F8E66E4FAEDF0F200742172E8E3FFE38DB49B48D9EE8
                E78F1F87401B44DAF64EDA1875F97275E9E5CBF0B5CFBB1B377AFF7E26D5E9FC
                ABAF46BD67BD88D18B993E97B47BB8E73D1F4B680FAD6C6342D8E97B8C1C2BB7
                F6C8C552085F6042842E5CC442280B39B9EF49100D095E4B95DB8855BB7A7171
                6C0870AD42078F3DEA3E24D4566FDFF6FEB3CED07DF5AA3A96F750F2424859AB
                6D0DDA85B627F27EC64ABE1000322374E1C225749556A21A9E295D89D62A7773
                1F916AEC9D86692440C2B8ABB6754000587A0E3ABBB13570751CB870C035F67E
                FCB1AA7B8EAF8EDB2E4656FD29C271D1A10E8217132074E1C22D742B7B75D5D0
                F1C3C5E3C749FBD009557D63964BD9DE42B61B33A49BD9DADED6361A2BE49CFA
                DEE3F2E5CB50E17ACB39AE0EA42074E12216BAF5471F75571E1A10121629339F
                53BA6E878C375B823DCC5E368C4FEA58F44CDFBF816E4FB71BA3B388E7DBE3BD
                1D33AA7BDFA77E26D2B67AA3E7207C0E099F4767E80EB800A8AF5DAB2ABD2568
                B327436F2192E3923A333EC7B83A908AD0858B58E8EEBD7871F644DA42C36225
                D549CE0A52C771753C778858B0AF4E4225D6CD6CEE12378666985426DBABB72E
                6252C6ADEB9B37C3B875ECFDADF4FE60A956FBDAD4759C522E7652DAB3D0F768
                0CF251E3EAC000842E5CE408DD865634C7B1DB510CE3AEAAEFC4AFA1D5578559
                AADD9504D2B1A1FBD4B22D6B68B61D4B6B85ACEF5967F9EA458B951E3FED4ED7
                B1D96D5D173FD62EF27001F1F06152306A7B16C659D063C6D58121085DB8C819
                BACA32661ADB662C88B48B56ABB8BEAA494FD8B1D9D2CB478FC22A57313309A7
                7947D8592B720DB8B6C0B474756BE0CE07CEFE6EDA182E0AF42246EFD5950BA3
                D671EF948A5D2BD181F7D75A2F52ACF75E033910BA70913B742DB7E5C4BA0E63
                41A46D8A75675BBBB1C3D8656CCCB1AB9BD91852ADE3B895BDCA4D195B1EC372
                013136701BA6717563AF089003A10B17B943376C33725B4EEF0CE3C86D423A86
                186E2B91EDBFD320EADA8F71B10CEBF86EDBAC5A4B60778DE32AD34A5B1D815D
                82652C37363BDC2CF6F99D606C175E085DB82811BAB19377DFFDA1B120DAFCBF
                7A0F69DB7865C3DA3D691DDFDDAC9EAD639F7DC7CF1272438EFF1096F1F8D30B
                9E4C2C4311B55C74EC395D74E0622374E1227BE86A0513A94C3AAB975895AB93
                6BF4294327A2DDB3C66A5759C777F74EBA562D8B76748DE386B61B42CEB3CAB5
                2C5D99ADCA6D18AADDEDCF1C2885D0858BEC13A90CE3825D939C62C1D776D28F
                8D0D9A83C2F8B4A5E6580C1DC74D3A4E8E5DAB8BCF3F0F8FE9EB54687C35D65B
                118E8353B58F8B8DD0858BACA16B9958D473F28E764BB7B425165E29AB6099EF
                DF8DB04C36D2AEE965A46B351C27A75B6662E3D3B9BB961BE7EDE2031717A10B
                17D94257034B17C68F548A5D1560ECE4DB59391ABA28534EDA6316E5483966B1
                0ACFBB5B3536F9ADD4D8AAA59B3D7BB736D082D0858B68E8F63D705D97F93B3C
                0C274EBD85C7B26CE0D05590FA822C36212779CD67E3F86E1BF3737D23DDB9EE
                A11B7BE461A17B662DB79811BAF040E8C285EB030F3ABA28A35DC4B1AECD3193
                B73AB617BA5B13D77D4E99F844E8AE11BA382F085DB8F00ADDB0AA924EA06AA9
                56734C868A6D237511FDD4F1DDD44523E85E5EB32C10127B04219003A10B175E
                A1DBB9AA52E26D425D72DE3ED4B0DC46D3489D61ABDB5D46BAB05D275245BAF7
                4B3D72CF728F3413A9E081D0858BD2A11B16EAD7FB553B2AD59427EC8C35A48B
                D432BE3B68BBE76CD6AEE996A1C48B16D37E0D9FBFE7C5072E2E42172E4A866E
                78EC9B8456670518A972B31B101C9631C74B8787C94D312D8EE1F85C59CBEA50
                7D0F7E186AAA0A1BD846E8C24589D0B53C63557956B98DD4E02815BA2A368E5A
                AABA6C7D9F86B1D5D459E031966ADF73552E5C6C842E5C8C0DDDB090BF56B252
                91CC645BB5546FB5252406CE101E2BB5722A19BA96D5983CABDDE8454095B1DA
                357EFE8CE7C20BA10B17251E78609163118AA1524EE42543D7FA68BF5CC11316
                2E79F3A6AAF5336FB930B27431773EE63091652219EB2EC313A10B175385AEE5
                093BA5242F0D592874C371303E57766FC443EC75FB7A81B379BC67F7EE55F3BB
                77CFFE43E3E3F64218F62D9A12617D4213F7E7C213A10B175384EE9455EEE9FB
                32568FA543D75AED6AF0CE7B6681B792F00C6B3C7754946DA166AA76AB75F0EA
                ACEDE4F668856BE8DEA7CA853742172EA6085DCB4216B391E3868BC88317342C
                3474624A87AEE5786CD20B05AD507B2F1824DC34D8346C7B6706B755FC8963ED
                D6F6E86D572BD99765A950D5F5242AA01442172EBC43D7B40251867D5A2A36CB
                FD9F1EA1ABFB885D246CAB4F26AF9D09265D0B5BC76D753D6C43B875559396DB
                9952DA63BDA068945A7212E843E8C28577E8C66E13CA768B88617CD27272F708
                DDB09F01413756DF9AD629AB71E5C42D42980AA10B17AEA16B580C23E72D22D1
                6AD7701FAC57E886F63A8F75C7262A59C777732170312542172E3C4337FA34A1
                CCAB0F5902333676E819BA617F2D338D4B0893B20CE3E65E15AFE7FDC8401B42
                172E62B7EEE45CF73616BA256E11894D528A4ED8893D3650ABE5C431CB982163
                BC56E1694852C1A64C522ADA9EC8DADC801742172EFA2A99ECDD7D3DE3ACA56E
                11E99BB865DDA73E05479F86D37A8C0A56686106F2932759C22E849BB4B59663
                615A31AC707B5498A5AECB85F230039C03842EDCB43D4927AC9F2C27D8DC27C4
                B6900FCFDA1DB1F843749F2D639349FBECB88D46FF6FD846E1D038BDFD476726
                27CA11B6E7BD3D400E842E5C6945B83CE9269DDDBA5574BD5B0DAF70D27EF3A6
                9A49B5E97102D680D0B018B3CF10361BC7C8BB4B548F9B56DCA10D7A01A03F6F
                F41AD4D7AE55D5952B7FAD83ADB7F014FE1CF5F726BC9AF6FCF9E75FEDD95E97
                BB707B8031085D00009C10BA000038217401007042E80200E084D00500C009A1
                0B0080134217000027842E00004E085D00009C10BA000038217401007042E802
                00E084D00500C009A10B0080134217000027842E00004E085D00009C10BA0000
                38217401007042E80200E084D00500C009A10B0080130DDDDFE5EBF5A91B0200
                C08E3BD2D03D906FF6A76E0900003BEEB986EE7DF9E6BBA95B0200C08EFB4C43
                F7AA7CA35DCC57A76E0D00003BEAA8AEEBF76BFD4E8257BB970FA66E1100003B
                EA3309DDA775F39304EFF7F2E58BA95B0500C08E792081FBAD7E536FFEA904AF
                FEE13753B70E00801DF18304EEFDE6877AFB6F2578EF54EBE0BD3E754B0100F8
                877A5DADBB949F6DFE61DDF5AF4FC2F7DFD53A7C3F9CBAF500009C7347F2FA4D
                5EFF95D75309DCD7DBFFE0FF59C2627E84B0DABF0000000049454E44AE426082}
              Visible = False
              OnClick = imgPayco477Click
              ExplicitLeft = 372
              ExplicitTop = -5
              ExplicitWidth = 105
              ExplicitHeight = 105
            end
            object imgPayco477b: TImage
              Left = 0
              Top = 0
              Width = 231
              Height = 100
              Align = alClient
              Center = True
              Picture.Data = {
                0954506E67496D61676589504E470D0A1A0A0000000D49484452000001DD0000
                00640806000000C38FEA67000000097048597300000B1300000B1301009A9C18
                000000017352474200AECE1CE90000000467414D410000B18F0BFC610500000C
                F04944415478DAEDDD8F6E15651AC7F1774AB58556DB4800FB87B6A0546089B0
                DD68B226662F61D93BD02B58BD02F10A74AF40EF00B984CD26BBC91A51118105
                A1057ADA52D26EAB145A3CEDD9794E9D4DA933F33E33E79DE7D4C3F793100A94
                39EF99D3CC6F9EF7DF442EC5F4F4F4E00B3DFBDF8BBADC9F1A0D77CE35DC8403
                0000D922371345EE9BCD7AE3D2D8E8D0E7E9DFB2CBBD7BB5F35DDDDD9F39D718
                6C77FB0100F82D8AC3756673ABF1F1EEF07D267467E7163F716EEB8376371600
                804E1045D18591A1231FFFFFCFC917B5F9071F351A8D0BED6E2000009DA5EBD3
                D1E1C31FCA57CDD09D9D9D7FCF75459FB5BB59000074A2ADFAE65FC6C646BED8
                0EDDB985E9F8B78976370A0080CE14ADFCBCF1F85844950B0080890FA3DADCC2
                C58673E7DBDD1200003A59C36D5D8A66E716BE8EBF3ED7EEC60000D0C9641991
                846EA3DD0D0100E07940E802006084D00500C008A10B0080114217000023842E
                000046085D00008C10BA000018217401003042E802006084D00500C008A10B00
                80114217000023842E000046085D00008C10BA000018217401003042E8020060
                84D00500C008A10B0080114217000023842E000046085D987AB0B8E4567FFCA9
                D4FFDDB76F9FDBDFDBE3FA0EEC7703032F55D2BE7ABDEE6AF30FDDD2F28ADBD8
                78DAFCBBBEBEFDEEC8A183EEC8E183858FB5F870D93D5A7BDCFCF3C0CB2F153E
                86D6DCFCA25B59FDC9D537379BE76774F8B0EBE9E9297D0E9696579B9FD3A3B5
                276EB3BEE9D67F3917A2BB7B5F7CEC179BBFCB6B0DC6EFABBF7F7FE9D7D3B647
                CEE3EA8F8F32DBD31BFFEAEB3B10B7A7BFB29F0FA055842E4CC885F3CAD55B6E
                EDF19320C7930BEC407C711D1F1B0A76B1F7B5F1C8A157DCE48909D5B1D63736
                DC77F1B1768643D2EE37CF9CA8BCCD655E476E881E3C8C6F8A561F956ACBC040
                7FA99B932ADA53C5CF071002A10B13B7A7679BD55815240C435C5C6FFE30135F
                E89773BF67ECE8901B8F7FB5722CA90EA7CE9D0AF2DEF35E4742E7CD3393DE63
                48B8DDBB3FFFAB1B84B224F0E43C950DDFD0ED09F5F3018440E8C2C4975F5D0D
                76114D2317FAD3278F37BB17CB90CAF4CBAFBEF77E9F7465BE3575A6F97B9E7F
                FCF372EEBF0F0F1D72AF1D3BDAD27BAEC5373177E29B993CEFBE3395FB9E6FFE
                70B77465EB2361773C7E8FBE7365D51EED0D1350254217267C2114825CDCDFFC
                DD8952C1ABA97213BE8BB7DC5CC84D868FB4B5ECD8A304D4D7DFDE70F5FA66EE
                F76585EEDADA6377EDC69D4A6F8484B6DA5E5DFDC95DFBCF1DEFFB6955D11B01
                20344217262C4257C8C574EAECC9425D89DA2A77E76BFCF1EDB3B9DFF3AF7F7F
                EB0D10A9CE7F7FF654A900D0F41CC804B0A9B3BFEEC696C0BDF2FDADCA032E21
                3D10075F19CCFC77E94E960AD78A74EFCB8D00C18B76207461C22A7485B6BA4A
                DCBD3FDF1C432C62F2F5F1DC314BED31CB74336B8F9DD6466D851CD2F0D0E1F8
                3D8EA6FE9BCC12978ADB5AC87175A0084217267CA12B955056E521CB60D6D79F
                362B34AD225DB765C69B35C17EE5EACDE612179FD36FC495E0C141EFF709E986
                952AD54766114F9E187FE6EFB26654E791CF443E1B5992939099D2453E8FACD0
                2D7303D0DBD3D39C25BDB33DF2FFE53C17F9F9D86E57EBE3EA4051842E4CF842
                F7ED3F9C79E6429A46C2627171A959E9F9E455573BB5D2B5E90B7669EFD7DF5E
                F7868AB64B5C1B9A59DDD645C6ADE57D8D8FBEEA7D7F73738BCD6A35AF4D59E7
                A9C8CD4E91F6C832236D90B732AE0E9441E8C24488D04D48457339AE90F268C6
                5D45DE855F8E9177F1D654BB4B4B2BCD09423E9A63694333ED5C6A2B6479CF32
                494C6E5AB4E4FC4977B7DCC0EC36121FE778CACD8FB68B5C6E20A49BBC48304A
                7B6EDE9A51F532B432AE0E9441E8C244C8D0159A8BB6EF98BE20922EDAA5FFAE
                E406EFD4B993AEEF40FE6C6959D65353AC5196701AC9083B6D452ED57D5A605E
                F9FEA67729CEF6ECEFC9E604AC32B637B358761BEB4F5D4FEF8BCD99C269E3DE
                452A76B91129F273B1939CAFB41B81DD584A044B842E4C840E5DCDB21C5FD7A1
                2F88A44D0BBF6CD49045DB8D7DF99BEBDEDDB8B2BA99B52195368E2BB455AE6F
                9671289A1B88560337A11957D7F68A002110BA30113A74856F594EDE0C63DF32
                21096B096D39FE9797AF66BE8E76B30CEDF86EDAAC5A4D60E775936ABAA5B302
                BB0A9AB15CDFEC702DDFE797606C1756085D98A822747D17EFBCCACD17443BFF
                AFAF9B52DB3DA91DDFDD39AB563BF69977FE342157E6FC97A1198F4F6E7842D1
                9C43CB9B0E3CDF085D98081DBA52B948A59B27AB7AF155B95235BE15B727E1EB
                9ED556BB423BBE2B6D977151CDA61D59E3B84213729681A3D9BA3254959BD054
                BBBB3F73A02A842E4C840E5DCDB8A074D34A77ED6EBEE04BBBE8FBC606B54121
                177E3996A6BB58941DC72D729E2CBB56AFDDB8DD7C4C5F96AAC6573593AAACAA
                7D3CDF085D980819BA9A894579176F5F776B5A5B7CE15564172CEDF8AE8F66B2
                91A66B55CE93D59219DFF874E8AEE5C45EBBF9C0F38BD0858950A12B817BEDFA
                1D6FA5985501FA2EBE59FF4FD34559E4A21D62BF61CD39F35578D6DDAABEC96F
                5575756BBAD943776B0369085D98F085AE04566F6F7A80C845FAD1DA93F8D763
                B7F87059552196DD05292FC87C5563D13D9FB5E3BB6964E2D69862F296AF3BD7
                3A747D3F0755AD99D52C3123746181D08509D3071E6474517ABB883D5D9BAD4C
                DECA3A9E743317DDF7B9483548E86E2374B15710BA3061FB68BF53A9D5AA6F33
                0CCD45D737A14ABB5946A2E8F86ED14D23E85EDEA6D920C46A73103CDF085D98
                B00ADDAC0B67D1654259422E1F4ACCCD2FBADB9E653489A2336CE5B8739E2E6C
                CB8954BEEEFDAC6700B74AB3469A8954B040E8C244D5A12BA1717C6234B3522D
                F2849D5695E922D58CEF6AC77177DA6BB376354B868ADEB468683E7FCB9B0F3C
                BF085D98A832742530DE787D3CB302F455B9A195090ECD98E3BBEF4C156E8B66
                D66ED12EF156689630E53DF8A1AC7655D8C06E842E4C5411BA9A67AC0ACB2A37
                513438AA0A5DE11B47ADAABA4CA3195B2D3A0BDC4753EDB30D24AC10BA30D16A
                E84A20C8D377FAE38A447E1D8E2F929A90283B43B855452BA72A4357B31BD3CE
                FD9EABE6BB0910A1AADD7ABD1E7FFE37BC9F3FE3B9B042E8C244150F3CD008B1
                094559452EE45586AEF6D17EA18247BAB42554E5C6A3BBBBFB57FFAEE962CE7A
                CC61519A8964ECBB0C4B842E4CB42B74354FD8A94AD1AD21AB0A5DA17DAEAC04
                6F5FDF8152AF21E12E37383BCF77DAA432EDE3F6B697479D281DBCDA2734B13E
                1796085D986847E8B6B3CA4D68ABC7AA43575BEDFA6681A7912EDCBBF717322B
                CAB450D306A204AF0477D1F6DC99A979BBD493E353E5C212A10B13ED085DDF66
                18326B7774F8506BAFE179F0C29143AFB8C91313DEE3541DBADB6DF557BB8981
                817E373E3A947BC320E126DB72D6E61673CF415AC55F74AC5DDB9EDAFCC366F8
                6B371B912EECB2953D5006A10B13D6A1ABA9EC42BC66A8A7F85884AEBCC67771
                F016E96E974A50C666770693849B3C70626DED892ADCB2AA49CD72A622EDC9BB
                C14A5366DD33D02A421726AC43D7B74C28D41211CDF8A466B30C8BD0156582AE
                55797B5A17D98D2B24E9AE966E6FC01AA10B1396A1ABD90C23E412115FB5AB59
                076B15BAC27AACDB375149CEDD5DC5F86E28042EDA89D08509CBD0F5854AE8DD
                8734813975EE94EB3BB0BFA563840A5D9136D3B80AB2D3D5B062BDAD55C52B6B
                7F8F1BEDBE05A4217461C2B77427E4BEB7BED0AD6289886F92922F747D8F0D94
                7323E728A43263BC5A32F67AFAE46BCD1B9CBDD09E32B3B2812A10BA309157C9
                84DE822F6F9CB5AA25227913B7B4AF99F730802A2B34B949912EDE106127E126
                6D95EAB6EC4D54C8F608698F8CABF33003EC05842ECCA43D4947C6554FBF713C
                F805312DE4B7377F982C547D1591363659E435B396D148852C4B6EAA0E0D093B
                59722393AD8A0A11B67BBD3D4008842E4C4945B8F24B37ECE0CBFD95EE772BE1
                256B483737379BD5A6C5055896D12CC461D1CA6B4AD8245DD5B2C6D5BA4B54CE
                DBF2F24AF3735A5F7FEA3636369EE935E8EDE971FBE2F794EC832D3705557F8E
                F27323E744BEDE88DB2493E512BBF7E5AEBA3D402B085D00008C10BA00001821
                7401003042E802006084D00500C008A10B0080114217000023842E000046085D
                00008C10BA000018217401003042E802006084D00500C008A10B008011421700
                0023842E000046085D00008C10BA000018217401003042E802006084D00500C0
                08A10B00809168767E61DA35DC44BB1B020040278B9C9B896A730B17E352F77C
                BB1B030040276BB8AD4BD2BDFC41FCF527ED6E0C00009D6C6BABF17E343D3D3D
                F842CF81E9388307DBDD2000003A91742D8F0CBF7A2C923FDCABD5CE7745FB2E
                B6BB5100007422A972C746873E8F92BFB83FBBF069D4E5FEDAEE860100D0491A
                8DC6C74747862EC8D7D1CE7FB85F9BBF1045D147ED6E2000009DA0B1B5F5B7A3
                A3C31F247F8E767FC3ECECFC7BAEAB19BC13ED6E2C0000BF4DD1CA56BDFEFED8
                D8C817CFFC6DD6B74BF8465D5D7F6EB8C644FCC773ED6E3E00007BDC4CE4A26F
                E2DCFCFBCF1B4F3E3F76ECD8CAEE6FF81F6FC4CF4D6862004F0000000049454E
                44AE426082}
              Visible = False
              ExplicitLeft = 372
              ExplicitTop = -5
              ExplicitWidth = 105
              ExplicitHeight = 105
            end
          end
          object panAlipay: TPanel
            Left = 0
            Top = 0
            Width = 231
            Height = 100
            Margins.Left = 5
            Align = alLeft
            BevelOuter = bvNone
            Color = 4667175
            ParentBackground = False
            TabOrder = 2
            object imgAlipay231: TImage
              Left = 0
              Top = 0
              Width = 231
              Height = 100
              Align = alClient
              Center = True
              Picture.Data = {
                0954506E67496D61676589504E470D0A1A0A0000000D49484452000000E70000
                006408060000007DD02756000000097048597300000B1300000B1301009A9C18
                000000017352474200AECE1CE90000000467414D410000B18F0BFC6105000009
                364944415478DAED9D3F4F654518C6E77456866DADC0DA828D566AE2AED9D204
                284CACDC4BE1960289D6406C349A009F60C12F0054369A5D0A6BD8446D4CE426
                265A8256DBE13C176773383BF3CE9C732F3BFF9E5F7202DC7BEE9C3F9CDFCC3B
                EFCC3DA75116AEAEAEE6F48F915E3ED0CBA25EE6152164969CE965AC97E3A669
                F66D2B34DD17B498CBFAC763BDCCC5DE7B422A61AC97EDAEA437E4D462EEE81F
                EBB1F794904AD9D2826E9B3F5EC8A9C5DCC49BB1F78E90CAD9D5826EE097899C
                5ACC91BA0E650921F159D1821E1939CF15933E84A4C2A55E161AB69A8424C906
                E43CD4BF2CC7DE1342C80D8E21E7A9BA1ECB2484A4C318725EC5DE0B42C8CB50
                4E4212857212922894939044A19C84240AE5242451282721894239094914CA49
                48A2504E4212857212922894939044A19C84240AE52424512827218942390949
                14CA4948A2504E421285721292289433017EFE43A9EF7E54EA97BF94FAF7B952
                6FBDA1D467EF29F5C9DBB1F78CC48472CE90FDFD7DB5BABAEA7CFFFCFC5CCDCF
                CFDF78ED87DF941A7D6F5FFF8B074A7DF920F65191585427E7C6C6863A3B3BF3
                AEB7BCBCACD6D6D67A953D44CE77BE51EACF0B7799BF6F29F5FA6B31CF188945
                55728EC763B5B0B010B4EEBD7BF7D493274F7A95DF57CE5FFF56EAC33DB9CCBD
                8F19DED64A5572FAE4E9727171A1E6E6C29F84781B727EF591528FDE8F76CA48
                44AA92F3FEFDFBEAE9D3A7C1EBEFEEEEF60A6DFBCAF9CF731DD67E7D9D047271
                F848A977DF8C79D6482CAA91B34F486BE81BDA0EE973224BFBED8FF6F591B5FD
                E9F368A78C44A61A39FB86B400212D840A0D6D87C8096C82A2B53CF894C9A09A
                A946CEBB77EFBE94A58528104FCADEA2E5440B1AC2503901425B8C7302B49894
                925421A72BA41D8D461339D1B77481751E3F0E7B42E23472DEF6F163C1B12E2E
                CEEE995597979793056503946F2A3C323D55C8B9B7B7A7D6D7D75F7AFDF0F070
                72212151E402EF236B1BC21039B16F474747CE6D631F0D68E1314EEB626767E7
                857C487C6D6F6F4F3E0381DA201240A5F3F0E1C3E0738832B09FCF9E3D9B940D
                21BBE51A708CD8C6E6E6A6B532928ED97C3EA442441928CBC69071EAD4A8424E
                5B480B8C7468555D171A080D6D87C889F5F1391B58179F31400AA922C17EE233
                2833242B8D638204AED61C651C1F1F4F2430AD635FB6B6B6269276CB958EC375
                AEBA48D9F73EDD9154295E4E5748DBCEC4FA86586C17988DD872A23584485245
                63DB8691BACB9D3B777A9525ED57B72574559806DF3016F60BFB1772DE72A578
                395D212D2E165C34D23A06848AA7A7A7DE6DC5967328D80E8EAFDB57EC3B2E2C
                D1950D21372A3D17BE612CB4E8085D6DB4FFB73953BC9CAE1ABA2D0ADEC77A12
                216156AE72025B7480FEAD942C03103AA475ED0E4BE133BEEE8434434B3A6FB1
                126FB3A668395D21AD2DECF1857021B385529213AD3D169C035B52A88B6D4CD7
                B63DBC8F566969696952BE591FC70099A5ED609D76126A6565454C0C49E71CFF
                575B3F18AD693B89963345CBE90A576D7D20491210325B28B69C100517338EB9
                DBE2A065442829D16D3DDBFD3A1C3FCAC64F576B0699A46C72F7BCFB8EC775CE
                A548A7949016142DA72BA4B565F2426610F926C2C796D397A1F485A9361970A1
                6309CD7C4A1188AD7C5FC4623BE7AE4AB7944490A158395D21AD6BDC52CAFE19
                BA6199EDFD94E59CB69F17829485B5C9E94B0CD9425B57A2AACF84911C28564E
                57ED2AF5497CD949DF3F3F753981AFF51C3A3E08E1CD24893E72FA2AC5EE67A4
                F591719EE50CA8D8142BA7AB0697FA24BE0BD7375B2807397DFBE88B0E0C38B7
                272727939F66C6900F571FD25729B65B73D7104AE870574E1429A7F4F53029CD
                1E920D9504C8414EDFB0912B438A16EBE0E060925D0DC9FEDA70C9E93BAEF63E
                B9CE57498920439172BAFA31BEDA35A44F86501973586DE420A7EF7BADDD8C2D
                D60F9D0EE843CA788726925C4328A58C6DB629524E690CCC3756890B510AD1A4
                8C600E72F669397D33A7DA986FBC48ADAA24A72F3184D016FF17DBBE97960832
                142767C86C9F6971D5D239C8E92B03C9325462085F314940C2362141EA3F4A72
                FA1243261760AB2C4A98E46EA3383943A69C4D8BAB5F96839CBED6D094E18A3E
                002444E86BBE0FDB66A89C219F35E7403A4725519C9CD245352B5C17590E72FA
                A6CCE172F0451FD290C534720E993B2CE50072A728395F45486BB00DD6A72EA7
                2F1964C680A5E3F0B554D3C809FA7E4DADC44490A128395F45486BB08D07A62E
                A76FFEB0198E909233B72DA72F31D4B7BC9C294A4E57481B7ADB8B36BEF0CA96
                214C594EDF45DFDE96AF5FEA9AE287160FFBE79A2114325120641AA5A1C4B1CD
                36C5C82985B443FA25BE6FEADB660BA528272E7688E98B28DA17BAEF38BAB737
                C1362034B62185A4A1F7630AF992779F7B3BE54A31724A21ED90547B4888DC2D
                37B69C581FFD46F30568542E21B37990796E1F6B68EB85633777F60B25A48F18
                92182A756CB34D3172BA42DAA1356CC805D26D9163CB3904F49B6DDBF7F54F87
                123A39DD97182A756CB34D11724A21EDD06FC6874CE5EBCA939B9CDD16B30D2A
                3A6CAB4FAB682625481147E8C4FA699252A550849C52083A4DD220A4EFD36E09
                7291D324C842E6E1860A6AFAA1A0CFDC5D69DBAE724A4F04198A9053BA805CB7
                7D0C01D2F86EED616E0B0230B82FDDA6C3B62FF82CBE0665C3DCB6D2E093D3DC
                33C8D6DAA35543148156AB4F3888F2700E5C1588B97974BB4C4431AE880353FD
                4287BB5C9563C9639B6D8A90B31642B3B5E61109F80929CD6312A6C12498DA8F
                5E90EE27340B6C7984926EE0E5837266C42CA6EFE582AB8B6026E6D700E5CC88
                9AE4B4B59AB524820C9433236A91B3CF2D4D4B867266440D724A19E25A124106
                CA991135C8E91A162BF1065E3E286746942E27C7366F423933A274396B783851
                1F282721894239094914CA4948A2504E4212857212922894939044A19C84240A
                E5242451282721894239094914CA4948A2504E4212857212922894939044A19C
                84240AE5242451282721894239094914CA4948A2404EDCA5773EF68E10426E70
                0639F1E0893AEE6F4F483E1C434EDC5ABBDF33D90921B7CD2AE4C463A210DADE
                DEE3A208217D18374DB3D0E0372D28C2DA3A9EAB4648FAAC6A39F71BF3971614
                F7C05F8BBD578454CEB616730BBF34ED57B5A078D1FF4C7042C86DB0A7C57CF1
                78B5A6FBAE1674A4AE059D8FBDA78454C2A5BA0E658FDA2F36AEB5FF9774495D
                4BBA187BEF09298CB15ECEF472A2977D2DE6657785FF00B0516C6E3948C83F00
                00000049454E44AE426082}
              OnClick = imgAlipay231Click
            end
            object imgAlipay313: TImage
              Left = 0
              Top = 0
              Width = 231
              Height = 100
              Align = alClient
              Center = True
              Picture.Data = {
                0954506E67496D61676589504E470D0A1A0A0000000D49484452000001390000
                00640806000000FD86476C000000097048597300000B1300000B1301009A9C18
                000000017352474200AECE1CE90000000467414D410000B18F0BFC6105000009
                944944415478DAEDDDBD6F1CC71DC6F1B92E5540B5A9C8D42E2838951DC052E0
                D280A82280AB882CECD22281B8268934366C80E45F202AFF00C92A8D0349856B
                5180EDC640748001BB14EDCA9D3CCF3163ACD7F3B67B7B377BC3EF0758F06D6F
                6F77A57B6E667EB37B13E3F1FAF5EB35FB65DB2EEFD865D32EEB0600C6E7D22E
                53BB5C4C269353DF0A93F62F6CC06DD92F8FECB2567AEF01A083A95D0EDB61F7
                9B90B3017764BFEC96DE530098C3810DBA43F7C3AF2167036E5F7F2CBD770030
                80631B747BFA66167236E0B6CD751715006A71DF06DDB90BB99786E20280BA5C
                D96563422B0E40C5F6147267F69BADD27B02000B70A1907B6EAEE7C201406DA6
                0AB9D7A5F70200168590035035420E40D50839005523E400548D90035035420E
                40D50839005523E400548D90035035420E40D50839005523E400548D90035035
                420E40D50839005523E400548D90035035420E40D5083964F9F27FC67CFE8531
                5F7D6FCC4F3F1BF3C69F8CF9E06D63DE7FB3F49E017184DC0D737A7A6A767676
                827F7FF9F2A5595F5FFFCDEFFEF38D31DBFFF6AFFFCF778DF9F8DDD247058411
                7223B4B7B7672E2F2F93EB6D6D6D99870F1F76DA769F90FBCBA7C67CF72ABCCD
                6F0F8CF9E31F4A9E31208C901B99E9746A363636B2D6BD73E78E79F2E449A7ED
                770DB9AF7F30E66F27F16D9EFC9D6E2BC68B901B995408B5BD7AF5CAACADAD0D
                B6FD3E21F7AFF78CF9F0AFC54E191045C88DCCDDBB77CDD3A74FB3D73F3E3EEE
                D465ED1A723FFE6CBBAB9F5C171B42CE3E34E6AD3F973C6B40182137225DBAAA
                4ED72E6B9F313955553FFBC2BFBEAAACFFFDA8D829039208B911E9DA55157555
                154CB95DD63E2127BEA053EBEDF13F283A60DC08B911B97DFBF6EFAAAA0A1C05
                58ACDAAA969C5A7439FA869CA8CBAA7972A2161CE1865540C88D44A8ABBABDBD
                3D0B398DBD85689D478F1E653DCF3C21B7E8E3D7A263DDDCDC1C6CBB575757B3
                45DB166DDFBD71E06620E446E2E4E4C4ECEEEEFEEEF7676767B317A40A1221FA
                BBAAAC39FA849CF6EDFCFC3CF8DCDA47472D4ECDF30B393A3AFA35C45460393C
                3C9C3D4641D4A496A9C2FBC18307D9E750DBD07EBE78F162B66D055B7BBB8E8E
                51CFB1BFBFEF0DF5D831BBC7E7BCB1681BDA964F9F798EE88E901B095F57555C
                78A995177AC14A6E97B54FC8697D3DCE47EBEA318EC22516C8DA4F3D46DBCCA9
                22EB981426A1D6A5B6717171310B13D75AEBEAE0E0601676EDEDC68E2374AEDA
                62D5F22EC30CE88F901B815057B559394D4D2DF1BD507D4A879C5A670AA45860
                FB9EC38563DBAD5BB73A6D2BB65FED9659E88DC7494DDFD17E69FF72CE1B1687
                901B815057552F3ABDF862EB38EA023E7FFE3CF95CA543AE2F3D8F8EAF3D96D6
                755E614C3BB4D495D69B47486AFA8E5A98EA92FA34FF6DB15884DC08845A0CCD
                C0D1DFB55E4C4EF76955434E7CAD558DFFC58A32A260CC69EDB5A7E3E831A961
                82D81527B1F356AAC0731311728585BAAABEEE4CAA6B9673F5C398424EAD4F2D
                3A07BEE2439B6F4EA0EFF9F477B592EEDDBB37DBBE5B5FC7A0508C3D8FD66916
                3BEEDFBF1F2D40C4CEB9FE5D7DE3846ADD358B35582C42AEB05037D43746140B
                1BC9B9FAA174C82970140A3AE6760B482D35751163DAADB9E6B8978E5FDBD6D7
                50EB4AA114ABFEB6CF7BEA7842E73CD6F2A6ABBA5C845C61A1AEAAAFF2967345
                44EA82FDD22197AA28A6BA9FBE50516068C9AD54C65AC4BEEDA75AD0BE731E7A
                F3A2E0B07C845C41A1AE6A68DE5BAC5AE7B4BB5BBEBF8F39E4E61D07CB11AB9A
                FA422E5580F075594305912E13B7310C42AEA0D0BB7D6CCC26554D4CBD88C61E
                72926ACDF59D5FA6E0749395BB845CEACDA5FD98D8FAAA100F794507D208B982
                422D8AD8984D2A0052573FAC42C8A5F631D55A75746E9F3D7B36FBEAAE804809
                8DB1A5DE5C9AADCBD0D491DC693E1816215748ECB64AB1E90539D5CB5890AC42
                C8A5A6CB842A9A6A413D7EFC78560DCDA9D6FA84422E755CCD7D0A9D2F0A0E65
                10728584C67952EFF6396356EA02EB1A519F5508B9D47DF5DA1556AD9F7B9958
                4AAC429D5BB0084D1D616E5C19845C21B13954A9B96E7A41C7BA5EB10ADE2A84
                5C97965CEA4A9026778793582B2F1672A90284BAACFA77F1ED3B05877208B902
                72AE5E9857A8D5B00A2197DA868A327A3350B7549375637C138363E36BB1904B
                1520DC58A92F74B918BF1C42AE809C4B91E6151AB75A85904BB5CEDC3642AD61
                5198A94BEBEEC7D7D437E4721EEBCE41EC1C61B908B902622FCEA1845EACAB10
                72A94BA9F45F36D51A8E4DD59827E4FA5C9B1B1B23C5E211724BB68CAEAAE39B
                343BF6904B151DDC1CC2D871A45A4EF3849C74BDBD130587B208B9255B4657D5
                F1CD271B7BC8A5AECF75D33062458045875CAA00D1757B582C426EC9425DD5DC
                DB6937A5BA4DBE8ADE98432E151ECDE74A8DDB852EFD520B4CFB17BAE22167C2
                6ECEE5750E73E3CA23E49628D655ED336E93BA73ADEFEA8731869C424301976A
                E1360323751CEDDBA6EB39148C7A8E585733F7F332726ED6D9E5B337B03884DC
                12C5BAAA7DA618E4747DDBDB2D1D725A5FE36AEE46960AE99CAB1354296E1E6B
                6E6B4AC7EE3E092C57CE185A4E0182B971E340C82D51A8ABDAF71D3FE785D66E
                21960EB93E34AEE87BFED4F85D5FB917D1A70A10CC8D1B07426E49625DD5BE77
                8ACDB9C4AB1D42AB1672ED165C93DE30F45C5D5A696E7270AC059C7B0380798A
                1F581E426E49625DCB7906A773C6869A2D935509395788C9B9CE3537E8DC389D
                74B93636F6DCA1ED5070180F426E49622FC4D0C7EDE550F8A46E19EE6E372E9A
                641BBBFDB76F5FF458DD3EC8C77D5CA0930A39F7990EBED6A75A596AD5AA15D5
                A59BA7EDE91C8482D87D8874739B6A55875AC0BA042C779A4FE84D86B971E341
                C86150B9D555058C0B3B859B967943C11532DC9B89B619FBBC8721F8C659F9A0
                9A7121E430A8212EEB5A15A1AEBFBB8100C68190C3A06E52C8F95A71141CC687
                90C3A06E4AC875F928499445C861503721E462155D0A0EE343C861503721E442
                D381F8A09A7122E430A8DA438EB971AB8790C3A06A0FB9D8C468BAAAE344C801
                A81A2107A06A841C80AA117200AA46C801A81A2107A06A841C80AA117200AA46
                C801A81A2107A06A841C80AA117200AA46C801A81A2107A06A841C80AA117200
                AA46C801A81A2107A06A841C80AA29E4F449B8EBA57704001660AA903BB3DF6C
                95DE130058800B859C3E06FCA8F49E00C002EC28E4D6EC37EAB2AE95DE1B0018
                D07432996C4CF49D0D3A7557CF4AEF11000C68C786DCE9C4FD6483EED87E7958
                7AAF0060008736E00EF4CDA4F95B1B74FAE57EE9BD0380399CD880DB753F4CDA
                7FB541B76DAE836EBDF49E02400757E6BA8B7ADEFCE524B4F6FFC3EE9EB90EBB
                CDD27B0F001E53BB5CDAE5995D4E6DC05DB557F8052F376C7EDA96D92E000000
                0049454E44AE426082}
              Visible = False
              OnClick = imgAlipay313Click
              ExplicitLeft = 372
              ExplicitTop = -5
              ExplicitWidth = 105
              ExplicitHeight = 105
            end
          end
          object panWechat: TPanel
            Left = 231
            Top = 0
            Width = 231
            Height = 100
            Margins.Left = 5
            BevelOuter = bvNone
            Color = 4667175
            ParentBackground = False
            TabOrder = 3
            object imgWechat231: TImage
              Left = 0
              Top = 0
              Width = 231
              Height = 100
              Align = alClient
              Center = True
              Picture.Data = {
                0954506E67496D61676589504E470D0A1A0A0000000D49484452000000E70000
                006408060000007DD02756000000097048597300000B1300000B1301009A9C18
                000000017352474200AECE1CE90000000467414D410000B18F0BFC6105000048
                324944415478DAED7D05601457D7F633B3BBF18404770916085E1CDAE2147777
                77698BBB7B29B4B8BB6B717797E0EEAE8100D195F9CFBD333B2BD9000969C9FF
                BD7BDA25C9EEECCCB5E71E3F5780039224C9977EB4A4D7CFF4CA47AF8C709293
                9C149F74815E0FE8B5591084458E2E10ECDF2060D6A41F0BE9E5FBBD5BEF2427
                FD8FD0037A0DB707A90D3809987FD28F9EDFBBA54E72D2FF280D23800E37FFA1
                82938039947DF8BD5BE72427FD8FD31402E8AFEC170E4E02664BC8A2AC939CE4
                A4EF4FB508A09BCCE0BC0FA7D1C7494E4A28F49E5E990427D77492931224FDCA
                C0B9917EA9F9BD5BE2242739C9863633700641F6653AC9494E4A38F4808153FA
                DEAD7092939C149D9CE0749293122839C1E9242725507282D3494E4AA0E404A7
                939C9440C9094E2739298192139C4E7252022527389DE4A4044A4E703AC94909
                949CE07492931228FD77E0942C3F4C722E0C349291BFA7178CD04303F6975632
                E045E84B3C0C7F82BB510F7123E421DE7E0A865EAFE72FD6DCCFB558A7754532
                9FA448E7930A193C5223A35B5AA4F34A0577AD0774F49F969EA38500C96884C8
                5A23B0F6D0DF82681914A5B182D57304AB7FADDFB14B578783E212D10721FA17
                9DE4A468F49F734E13E4252AC90FE7EF7C92C2712FE2092EBEBB851B8F6FE2D6
                F35B7818F2089162043EEA22218902447A090C449F692EFF84AE8181801FA981
                97E00E5F571F644E92110129B2234FAA5CC8E6ED8F342E89E0C221CA2022C8E0
                8435384DCA4F7BEC457BC7EE4FF63D113193C9EAF7CF5DE72427FDA7E09464F0
                482602981121A670DC097B85AB6F6FE3F0AD63B8167C13AFA35E036E0C84124C
                0C08F45322AE6ACDC2BEB6B926FE1C1307B42868A1D36BE16E744196A4199037
                5976FC94B938F278E74422F84010191C099EA2867F9771D498F99AF01906F835
                E07400F0B80F69B4A67DF67347D73829C1D27F064E064D230CF868F8842B2137
                B1F7EE111CBA7F1A2F0C1F10251A60525E0C2822AD61919AC59820038D245856
                D4E739A7CC01E517DD8B8465C69D99202BD1CBC47FD23DA90D7E466FE44B921B
                95729445E994C590C4D50F1A412383391A38055856FAE756F7D780331E39A613
                9CFFA729DEC069C34C245902643AA4C960828B56443801E566F803ACB8B806FB
                6F1EC73B6D080457700E29481C82308812D7FDD8F2D5984C1C6AEC5F58E9835F
                126B4D04450E66BAA7480015F9F58C238AF4998EEBBB822692DEA777F4F40A03
                8A7AE5469322F550247D412412BC08C2222C5C4E63D743215A7F2D644274ED54
                B06B61ECD021F14D4A507F3A7C30D3C3055944B7D947AC5B6692A508B6F9C5E6
                D9BC07CAE6A8B6E16BDBFA2F517CDF5FB663C82F8D46F3D5DF6363CABE238AA2
                FA333E297EC1C9064D597F0C2026F92D3C35BCC48ACB6BB1EAEA667CF28C80D1
                688CC5E0DA2EE8F868AE244AB6F7A21FDEE1AE28E0178886856BE3A71405E005
                4FFA400741E57416704AF81C3865121DFC16A7B62A0BF1CD9B37F0F323EE2E5A
                168FC964843E4A0F2D2D0A8DAB8BA551767BC0AB172F70F3D62D04E4C88164C9
                92C56A7F30180CB87FFF3EB264C9F2D90568329AF0F0E10368B45AA44D9BD6F6
                BAAF113A1C76DEF67B0C0C07F6EFC79D3B7751BF7E3DF8FAFAC9EBE81B70CA8C
                8C77EEDC41404040AC0176EDEA557CFAF40979F3E583ABAB6BDC1B1103C52338
                25CEAD2C261F016188C4DEA7A7F0E7D1397882A730BA92E8AA673BB118E79D2F
                DEC1496D31B1F69824B89844D24D816A992BA0DD0F6D90419B0AAEC492D8F592
                D22741B5E5DA0D24FFD764F737A3B882D3D2C63B77EFA276ED5AA857B73E060D
                1828B7817641A3D180C1FD07E2E0C1033872E238743A179A02E29066004B727B
                FEFAF34F4C9DFA17162E598C9F7E2E15ABC5FCE2C57354AC58110DEAD5C78041
                836C01235BF5F80ECCDA58AB464D9429571613264C5016AB72913A608E2CDCD1
                BA1CD3E0F2BE0D1A3810EBD6ADC3F61D3BE0EFEF2F7F640D504988F1FB8E1E16
                19198942850AA16CD97218356A143C3C3CBE6A6DB28DA25EDDBAB870FE3C8E9F
                3C8914295320BE75866F07A79953421663354C4415C2F05A0AC6DFC71763D3AD
                8388F0621AA041BE820342405CA592F804A73204EC0DE57751E6FC0609D975FE
                685FB0092AA7FF096EA20BD77D65703A069BFCAE29C64FE236B0F2337B74EF86
                8D9B3763EAE4A9A852A9B22C6CBBEA603419D0AB7B4FECDAB50B17AF5D2540B8
                11278DE25C4C479C9459B80DC419DAB66C8567CF9F61F1B2E54895264DAC1C3A
                DBB76F43DBB66D3061DC38346EDC04A24667F9226FA26C788BA2E776EED40927
                4E9EC0ACD973F0E38F3FD21C6B6CFA61F334470F9662F85BBD96C039600036AC
                5F8F6D04CE4C19335A80C945FECF18DBA2BD2DCFD5C58B1751A66C190C1C3018
                DDBB7757C5DA2F0194ADC3C60D1AE0D285201C387C18C953A6FC8AD18C1DC50F
                38218F8BC43749132E7FBA8EE96797E0C8D3D3D06B8C90B46C28641D527E9C60
                EB44FC8F49B271602A136A62BA2E03926C4C120D46249712A143B1D6A89DA932
                09B96EFC737583B69B887F0B9C178282D0A07E7D142A5C18E3C78DC7940993E0
                425C69D088E124428AE8D5AD2776EEDE85CBD7AFC2C5C51523060DC6F51B3730
                73CE6CF8254E8C278F1EA36183FA2848DC611271500DE3AEE6AEE3F3CB29223C
                0C23478DC4DA356BB069C346E408CC49C3A5B57CD90C4EC8DC73FF8103B411B4
                4493264D3172CC182E2139346D8B8A5E6AEEA7D9A6101338157F34FB39A87F7F
                6CDAB4095BB66DB302A799730A0E39A7445291A0B17A263749906A4522ECB8B1
                63F1D75F7FD106B7073972E624B541B4621E9F191D06CE860D7189E667FFE143
                09109C563A0E1B13032270E4D5658C3B3117B7236E1328A32019E581FD17ED03
                B1EFB4556354FBA964B56198944ED1A4EA442D9A67AD83B6F99A2389E0CBB550
                B9E3FF969FD2A2D1BE245DB16DEBD6B875F31636D082CC962D1BDA366D86087D
                14E62F5B0657375702670FEC21CE1974FD1AB4B4EB7769DB1E172F9CC7F65D3B
                E0973439F6EEDE832E9D3B63F4D831A84B8BC9968BC5A43DCBA2E8E5CB97D08E
                EEC7C4C72953A6A07FBF7E087E17CCAFD03858886C25DDB87E1D496953484ABA
                ADB50AAC8E378D710ED27D870C1B0677770F1C3E781053A64EB5CC0D2C4BDC2C
                E0989728E36A4F9E3CC1A3C78F902B30173CBD3CF9D5B2E013D30213913E7D7A
                8C1A3D0A9E9E5ECA434C5CE2371822499C2D437B8580BD7BF7D3FDB596B5A11A
                CECC32B5F53364D36393868D7039E802F6263C70B215CC44552D775A44908679
                ECD9698C3E310F8FF08C6EFC918B804693E65FB5DCC5A9D35F6A8FC93224EC4A
                5D940615D396C29052BD9108DE7C61FE7B210412D7AD2223C20918ED7060DF3E
                0C1B3102AD49B43491B8DDA1790B4418A23097F447AD8B0EBDBBCBE03C7FED1A
                5CB45A746DD71E41E7CF61DBEE9DF04D9C14C3870CC1DAD56BD06FD04064204E
                C30C1E46A324EBFDD48922C58A443366488A1572D6AC595C9C1D43DCA54AD56A
                E8DEAD0B5EBD7CCDC74454F99EA48E131B57D582298856A0B458A8D8F5B9F2E4
                25CE3A1A3A6AEFD933673072E408F5326B709AF74A660FE06A1321EAE1A3875C
                84665C93E9D87C2E19277630A55C83A2D94A992A25264C9C085F3F3FF30D3937
                3D76F4306AD7AA49C01D8376346E8260F57433E754592D2C9F3164D3AFCD1B35
                42D099B3D877E42892D333782B05D92E111FF40DE0645FD3D30F1D421085E3AF
                4F63DCA1E9B817F504A2AB91A4C4488826E626897F2BD63777FA0BE08C26714B
                1AB8195DD134A006DAE76B8144823777B07C562C8CB385D2C42DA4F3E6CCC1A8
                11235198C4D165AB56C0DDC31D2CDAB113E98FA1911198B5683EB45A0D7A13E7
                643A67D08D6B70A5C5DEBD7D27AE476DDDB30B7A12CD5BD002BA4EDCCCDDC383
                16ABC0B9AB516FE2808C229D75FF11DAF59327575D2C32C08C0879FF1ECD9A34
                C1D3C74FB177FF7E24F2F5C3BBE0D7B46F89963164EE07BA87595CE4AA0D1759
                4D8ABE29703F3353670449905501FA5F47CFF6F34BCC834D22C323F0E1E347CB
                D85B8F1DFF5D525E26AEF74F9C30017B488C5FB06831D2A54D2703419467221A
                40F97D44BE893160AAF3CEC2452323D1A7F76FD8B471338E1C3B8E54A95391BE
                6E909D6192FC5C13DF64CCF71765431CFFCCC8C7AB4DB366C4392F62FBBEBD48
                9C3C190F7C619B9F9BAB47ACDD568ED7611CC169168858074EBEBF868147C7E2
                5EC443EE571469673208B2FEA5913EBB84BF0BD98053F60171D78F605E78FC5F
                139F0E363C7AA386FAA545F2280F8CAF30043FA52A240FBE12F62053FCF1D27D
                7B76A315E96E39037260FEC20548992205DEBE7B8B4489FCD0A1650BBCA7C53C
                76D2445A04AE183D68288E1F3F8EADB4604502EB28E294D76FDEC416E29C3B37
                6FC188A1C3D0AC550B640BC8CE753B63941E13478E4500E957751AD5C72FD5AB
                C1CDCD4D714908AA1EB963FB3674EDD819D56BD6C49FA4AB0A046A065AC61155
                7F19BBDC28731149E17A92869EC116AF024E1E4CC2012A58059398B9ADB2F063
                F0DD2ACAA16A1166ED1BD86F00B66EDE84CD5BB72163A64C6A3B540E673BD396
                9F362E1723D715EBD4AE8122458A61D98A95F8F0E103FAF6E983A74F5F28CF93
                DBC021A9724351F18752FFA89FF76EDF4244681872E6CE033DBD27D226902851
                224C9830092968CEBED5EFF94D3A27DBC91E843F46BFC31371FCFD65304EAA15
                E3AEC2FE57640D4E360F264106A768B20418307148340870975C9048EB8362FE
                8551C9BF2CF227CA095FC11DF2B89B6DD48CB4F1D338BAE5FDFBF7D0B94307CC
                9E3D1BE93366C0A50B17F07BAFDFD18644DB2D9B37E3E8D123F0F34DCC37BE4F
                211F88131AE197D80F466A7E687818BC93FA62CBD6AD68DFB4392DB6A7D8B8F5
                1FA4CF9481455FE0E593E72857A2249AB66D8DDE8306C8600354AE26D23DC342
                43D1BE556BD2070FA1758776183A6C3804AD6CC5BC4B0BF2CC99535C2CB6041D
                58381E33B2301073639060F10AB3E01283C184D2A54A2175EAD40A5844870320
                71B3A2892B0FF28C1895FD408321030662D3FA0DF867C70E64E406219B8985CD
                1B8E82318C466AAF013D7B74C3C60DEB51A3462D4C9B3E031F3F7E408FEEDD11
                1CFC5E5D23EC9922FF690EC280A28E9BB831EEEAD52B88F814CAC1A9F37083A8
                D3C28D249409E3272225E9A0B1096870B84EE3024E49894809318561DE958558
                74713D3EEA88D3684C568B35E192BD586B10640EC8879273030D3C246F781B12
                A142D692A89EA534B2F966849BE00217492BEFA2CA4E1EEF4281321B0F09A04C
                47640B75282DC8454B1763E4E8517071D1E242D005D22F759068B19BDD885A8D
                560975043C7D3C11983310FD7AFE06777777ACDFB209E9FD337280DCBD721595
                CB57C4E05123D1B4752B7977972C5C8D71B9E3A44375241DECC3BBF768D9A615
                8692CE2BD2F3D86A5DB57C292DEC1E707391FD9872EC32B8D4C11733139B0DB2
                D827731BD9EF6D90985FD6844DDBB6227F81020EC12977DD9C746065F95697A8
                0683070EC4E60D04CE6DDB65CE691370616FCC893EAE4C9FBE79FD2A6AD4AC46
                2275182A57AE86BF674EE7C11DE1E1E15C1FB78FEF924D67B681305A02678BC6
                8D394077ECD987C4499270B1963DDBCDCD833ED77EB3AD25CE9CD3400D59727F
                136604CDC37B21981B7EA468DDB01B9FEF993A6A35E6B6622D0D345B38CC4560
                D2C11B1EC8E29D1165339540D90CC590C9238D129B6BE18D26498F0863144909
                1AB8C0555E64F10552F322321AF8027E40206D58AF1E3266CE843FA74E457226
                2E093287B29CDFA8703FC5001B11168A36CD9BE3ECC9535CED58B5711D0A142D
                C8D7FDA1BD07D0AA4953CC5EB000E52A57E2164A28023A5B5C21EFDEA15FEF5E
                3848D7E969B1B669DF1183460C5306CE8417CF9FE1D6AD9B3C0ED99A38775138
                A7A4840A5AFB2719301937CD9D370F7C12FB21268DFDF59B57387EE808D7476D
                9820579734D8BCF91F1C3E7C18BD4992489522B539CE42A564C992E2876245B8
                9F37FAB84A5C9FFFFDB75FB199C684491E55AB56C31402A7202A6E1F4950B39B
                1CA509B2CD5230C92CB429E9F317493CDEC7FC9C342FAA28AEE8BFFF2D38B9FC
                2F2F849B9FEEA3DBFE41B811CE42B6F4CA00CA13FDD98CC6FF02A0F6AE35C530
                60FE88BBB2202BFCAC3F1E511A78BA274360E23CA898BE247E4E9307C95C7C69
                033242479F2BA60D2E6845916470EBE36D6CB9BC07B992674335E2AA024154C0
                B78930F6ED67461536D9A3860FC3A2450B318FC054AA6C69848785F31D9E2F12
                D557212A79A9B2987EFFCE6D34AA571FB5495FDCB17D3B468E1B8B9AF5EB7271
                6CF9828518356C24D6FDB3058179722B8B5250ED2E7367CFC414D2317F2A5E1C
                FB8923B46CDD0603A90D32A73371FFA0C53729590DB7059C24D75AB8A2208BA9
                669150A3EA61D1C1C9C23A4F1E3B8A8635EBC0D54D07376F4F591A50F43F26E6
                9A14FD5594B3226C00C4C4E98888484CF8F30FD46950DF0A1C0AE8684C4F9E3A
                85C60DEBA34CA99F718A74F5B265CA12386728515532B84CE6352A58076F0A2A
                F3E17FD135CD1A34E42AC75E159C9645F7DF83933A2F51278CF495F157E760D1
                E5E5D06B0CCA3C38880289CBBAFC56F04AD6461A738CAF86EFEC0C4072781BF3
                5F12D0C2A3E0A9F341A1A485D1384F4DFC903C90F8A61BE999826A7D841C7A4F
                9094100603B6DCDD8359A716E289F81679BCB2617A859104E4C4044FDDB7B51B
                E631345B27814B172FA279A38648963C39D66FDE049F44BE3872E810860C1CAC
                5A132DCE7C70FD318AE68885B82D21F1B37BB7AEE8D1A52B1A356A8C5FFBF7E1
                DC6BDC8891F867FD266CDFBB17495224E30B5006A684D7CF5EA0768D1A306A24
                0C1F3A1C9DDBB4452BD273070D1F4EA8929F12C922904C7A7AA6F6B3F315CD34
                A36C383C7249AB55AE890ECEC70F1EA05ED51A489B2E2DC64DFE83A199BF2F49
                164ECABF6734C26C3062C0621FAD5ABD0A73E7CCC59E7D7B9193361E7B7AF3E6
                35BA76EA826BD7AF61DA5F7F935EDF1E654A97C554064E8D25C1816D0846BD01
                376FDC40D6ACD9E0A2D3299FDBA62E366B20FB39F71C51C00921FE2428C49A73
                32F18F19819EA3C5965FF1547AC67753356BC1D1ACC492E2179C020CB453EB45
                66352640D24EAB3148D093AE96C225056A6629833A392B20895B4A780AA42798
                5852B78EFB3105851330A92904A1381F7215D34FCEC7E5A75720B8BB20526B84
                26C2843E453BA159D67AF0105CE2615E2CE0646178D52B57E63A4DEEDC79B076
                E34678B8BBE102EDD40BE72F92DD18ACAF2693FA4DC6B51838DBB56B87CCD9B2
                F245CD82169293A83763FE5C444446A255D31610690C5692DE069D85DBB37B8D
                1E320C8B172EC4E849E3902D7356D4AD5E132D48E71CAC80933D63FDCAD51832
                680061E60BE0B47B5BC32CC52452AEDAB81E39F2E755B6F1E82366D4EBB17CE1
                621EF0B076C37A142B5102824E6B191E795AD5081F28953198B5B56489E22850
                E0072C5EBAC4D1B2C09CB9B3319CFAD8B76F1FD4AA551B552B9447B9B2153099
                C45ADB3900A64E99C2E391972D598262458BF1FE0BD6D951F45F93FA0D7025E8
                22F61E3DF2FDC16922593B4AD0E3EF2B8B303368294C6E46D5F9AC762B418193
                7463165F4A7A95D6A8812E4244805F46D4CD520A5532FF84646232882677AEC4
                9B4416B4A7E7599F2C954CA2EF840A91B8F7F109269F9D8B232F8F8185951A4D
                A46392F86E128C3091D410A0CD8409658621B7B7BF55705F9C1B2FFF6B3260DC
                E8519839632637F4E4CA1588556BD6C0C3D38BFB2A1D668529916BB2042F9B53
                589C739F6E3DB801693581228AB841958A95D0B46113FC36A09F22E35B16D4D5
                0B97B0ED9F7FD0ADD7AFB875ED3AEAD5AC85E62D5A6020E99C3C219DAE3B7DF4
                04D6AC58A1867C49A69839A7F56830FF2A73BB74EFFD1BD2F867B203A69D818E
                36915FCA97E73F77ECDB0F77DA94B8181F836B2282C4FCB163C760DEBCF9D84B
                12418E9C391C86A4DDBB770F93264DE281F96F5FBF46D5721551BE5C394C9E35
                23DAF52C6CB26E9DDA2856A428661337F6F0F4B48CBA20A8E0BCAA8033D9F70E
                7C379024F1CCF81CEDB6FE861B86C7D446C5B2F615B2B564B66E026A8CADE56B
                5F97AF19ED9EB044DD09D6EF2AA29E6C0217E166F4209135371AE7A2C14E991F
                5E7095CDF4F4B96864C024718D679E4492506B20BD52C4AD88C7D874750736DE
                D886779AF7B258430027942B53A4E120D5846AD0BD6853740A68019D55505BDC
                D2AAE5B6EFDEB513EDDAB446E9D2A579D604D3315792C8E6E6E6AEFA62CD1BA1
                AA762AE0640012155BA7603460DDD2E5183D7C0471AC0D78CBACAFC449172E5A
                8C9F4A9552C54B655214C3AA89EE61C2E5F341A85FA3369AB764E01C2EDF5B54
                FC9AACF74C47133E3F5F8255B74CD41616346F613E3183937DE162D07954AF58
                99C4FA2618387A04DC08A088019CAB696C7AFDFE3B3A75EA8CFE030670F1598C
                C18DC1447BF6F9D3C74F508DC0598EC0F9C7ECE9D1B8B85E1F851EDDBA61C7B6
                EDF8E38F3F50AB761D39A84009B267FD4E50E034D22EB9E2F1368C39311D619A
                506A8A6C1CF89A087E3390781485603166989DBBD609BD5F4B3C08429041C8C4
                56EEAF14E5D0349644EDAB4D8432E94AA04EC6CAF04F9A11BE2EDE044B39D223
                82A58AD1F7DDE82646410E77679A6570D4476C784AA0BCB91DCF425E90401B4E
                DCD7A8E086BEAB51444FC5FF25D0970BFBE6C59C0A7F2091400B88C02D29FA67
                5CA7AA26E97DF7EFDDC5FAF5EB316CE86004070763EDFA0D24D67AE0C5B3E718
                D2AF3F42433EF2B134A78F31EB7984418FD1132770430F2391DEBB76E1226A55
                AB89414387E2C5AB9758B962253611774C9F3E830D3825C5512928E37FE9EC39
                D4AB510BCD5AB6E49C53962E643F28E7DCDCE863317C38CA7451A37D24580C58
                1AD1C195D1C944D2C398E123317FEE5C1E7AD8B2552BB8BAB945BBEEFCB973E8
                40BA230BE5DBBA752BCF798562CD8E712DD2EBC9A3472AE7FC83714E0774E8E0
                41DACC9AE287FC05B08224179D8B0B0F3E80C25C121438434D61E8B277040EBF
                3E45FA8A8116B5D12603DFCEFA1D6D403C244F644C91192FDEBFC4FBF077727D
                2016B410E70C15B3E54CF1B3317E482B289D674A944BF733CA652A8DCC5EE9E0
                4BBC52B4F6BB892656C0841B88986B56CFFF36E1E0B3D358439CF2ECABD38810
                43B9E99E01C0A81809CC0BD15C0ECCA4E87BA9A594985EE90FE4F5F1A73B1A78
                C585B84658B27162E178CC1A59BE7C19346BDA04C1EFDE61ED3A022771CE270F
                1F932E5883DA2DF1281FF3420CF9F801478F1FC3C6AD5B5094742FF96626847E
                FC881A95ABC9FA28E97C59B365C39C79F364178A95ECA9840AC06CDBBB7CE61C
                EA9258DBAC95024E410E300FFBF0097F4C98C853D1CC1BAA287CA6AF6AD69200
                FFCCFE6840FDB180EC7323449BCDA730346FD614972E5DC6D0614351AF6143EE
                3F34D3D5CB57783A1D8BB59D3E6B1672F1AC1921460E6B1E5F468F1F3CB48073
                7674701A49A78D22A9A571BDFA3877E62C162D5B8A9FCB96E646371EE248F769
                9A90C0F9427A8DEA4B3BE08DCB4BD2C90C3CC08D87BDA90EEC98C1C91672C36C
                B5D12D5F1BBC0D7B8DC947E6E278F045D207C3499763D12372F0426CADCF5A9E
                DFCD38A7077227CB8ECAFE3FA26CBA9248E692442E85A980D6D263EE75E37033
                F03C1A236E863CC6F28B1B70F8D949841A4361D4EAF9A7E67E99048B082DDF42
                5EC4E64D4717A543EFA2DDD12A4B1D5812B2CCD1B7B123F33DCD6EC2A68D1AF3
                4C109973BAE1F9E3A7A859B90A7204E4C09CA58BCD93888B972EA262850AD8BA
                731B8A142DC22D987C891288A74E9EC245331702C5DFD367E0974A952C9C4561
                6FE674727B70362570323FA7A40497BF7BFD0605F2E443625F5FF8F8F8C06430
                A8FD74B8C7B27E10B779FEF4197EFCF9274C9B331B1E4A36C997C04908C1CB57
                AFD1A7D7EF3873FA34060E1888FA0CA0C4C176EED88189E3C7213C22027FFF3D
                0D050B1654454EF5A70DD956B47840FA27176BCB97C39F36E094357AD9126EC2
                F67FB6A15B97AE285EB238161340B55A9D5CDB2AA181F3EC872B68BCA1278C9E
                1FF9E2651C42B2AA6AF0397032E76FCBC086E893BB0389961A3C8C7C8B0517D7
                61C7A31D083184C87E7441B2B388C1E6BED60061E2157BB99BDC1098381B7E09
                288592690A21B92629BDE7C15D25820D502C636FE4B08CC2D3C837F8E7D601EC
                B8BC1D8F69E3897021402A7E3CA395F28FCF8093B7D320A176E66A1853B80FDC
                6136B9C70D9C36E3461B5A73E2346F83DF72CEE9C9C0498BBC5695AA9C032E5D
                BB5ABD8E19304A972A8D6D04CEFC05F2E331896DD9B266E31BD3F9734168D4A0
                0192244D86DDFBF6C1D3DBDB2A085C1EE9CF8153156BE9DAF76FDEE0873CF9D1
                A85123B4EBD08138B0889816901C7227D708AE5FAB3602720562D6FC796AAAD7
                97C129AB0F572F5FE2D65BA627B669D70EA953A6C2B8716379C0FC341249CB94
                296BF7607C069C32DDBF7747D539FF9C35C32A485D5E696655ECCDCBD7DC7555
                BA5C69D465BE53762716A2489F36ABDF88C029BB52BE3B3857DC5E8D6127A7C3
                E81A21A74E0B1AD984AF88355FBA55765D264C2E3F02D93C32B0C855BC932270
                FAC54902E91A9C0DB90C41473CCDA0F84B596A13D31F592000EDFE5AA6F6B1F8
                4C5107A35E443221092AF817C78F190B235FF29CF0153D08F43AAE172A3C4399
                1F25D994F9F4497C350A267C3286E39F8747B0FAEA463C7A7B1B7A5723F45A79
                C00525B2D3263102B6E99EDC1D6D350F4C172FE6971FF3CB8D8597E0232FACB8
                80538962B1EC440612EB9A21F86D3056AE590B2F4F4FDCBB7317D5099CC54B94
                C0DCC50BE5E793D41174FE2CCA962E8DC54B1663F79EDD7844E05CB2781901DA
                0393274DC25C126513274D8299B366A3509122764D93D44406159CA473D6A969
                A77332CE49E02C4CE06CD3A60DFA0E1964E5B3841A66671BEE2AC7E016216E9B
                354700E62C98AF724E8BADC2513A899C4F6B76955CBD720543070FA27E064147
                EB2E67EE400C1A3E0CF989638A8255E4BD4DF497D50660F788FB9C73968F0E4E
                25A04352036905848785C95941824995C2D8A7CCCF798581F3308133558A784B
                1553C72E36E01C1A340E2BAF6D25B1CFA054495738E6571A73B4E11AF42ADC11
                2DB393F827E87834ABD114815B618FB1ECC6466CBBBD17219A4F1C40CC68C4E0
                A231BAC8C0A0DD97D5F3C9E69B1325D31643A5CC3F23BD673AE8240DBDEFB8B4
                84C5C5C3C4142342895BEE7F75019B2F6FC6F1E74188728B24B1984458B6C958
                5B3ED53A48564BC546A7B60527AB419455931E8B2B8E471AB7B4B2341197D990
                D4A7816F01D4B6962D9A1338DF62D53AE6E774C7912347D0AA594BB46ADB1A83
                860CE19732A9E4D0A1036850B7363265CA84D704A08183061180DA63D7F6EDF8
                AD674FE4CB4FDCF4C91364F2F7C7D4697F237192C4D11EED109C8C73B208216B
                70E6CE8F766DDBA2F79001BCB202E0C0326D9D3247202B9A373F3213386733CE
                C9DC12361134A2832F5B8231A222A37082F4E9A14387E2FEDD7BD091BECCDC25
                ED3A7644B98A156CDD1C36B7F94A709258ABB645B20BC534EBCC0ED644F3868D
                7185368BDD870F1138537E5F70B639D917471E9CA0F6EBA117ADD3AB94067FE1
                5612CD6E41B79C985C7128D2B8A696956BC8D137CF8CAF70E0E1414C3BB79274
                DBF7345F11706511492617B80BDE48AF4B8132190AE1A780D2C8ECE90F6677D5
                48A2B298A49899147D162145E1B121184B6FFC832D17B7E39DE625D77305B5D2
                BB959F16E0AE04C9C164C7044E907E97222A29E6579A8480449939FF8D93506B
                0F4EA301AD5AB4C0DBB76FB09A744E17D2B5264E9888450B1661CA5F7FA15295
                4A72A41089B5CCCF379340E7E3E38DDF7FFF1D4D9A34C1D5EB373198F4B48888
                70BAFE6F1E933A69E244F4F8B527BA76EDCAF31CAD7DD49F0327D33999553B84
                C05984C0D9A6756BF4193A98EB7FEAF8580FA2F59BC4D98B1038B3E5CA8999F3
                E7CAE0846370B2BEC809E1069E707EE3FA0DAC5BB3865B6299CFB756EDDA4899
                22394F6363D7D5AB570F4D9B3747BA8C19F8F858CF3B144F80CD4255DEB606E7
                6402A718E346613F41969045A6735E269561EFB123DFBF1242D5A35D70FD3989
                9F50C029D976E54BB732980C708DD0E1D7225DD03E7B23B84882B251B1F0AC28
                BAAB01673EDEC2EC936B70F7FD2DB8182391D52F3B7EC95909B9530522AD2E25
                5CA0E1CA38DBC57935DA98F45C16E44CDCF679E473EC7A7E002B2FEEC07DE92D
                3D298AA72331A469253972885F2F5886DE1130E5C1720C4E161890589F18D32B
                4EC40F4902F80EAA8DCB54A962AD120BCAC1D992C0F9162BD7AEC5954B97D0BD
                477704E608C4B41933487794CB6E309D73CFEE9DE8DBA72F66CC98C6EB055DBD
                7C19BFFEFA3BDE050763C890A1A855B70E3E8586A147D72EC4650FA157DFBE68
                DFBE1D2F65697EB43538992B4535085981F30303672EE29CF4DD9EFDFAF03429
                7390B83A3E56736296388A15F8015989DBCD5A300F5E5E5E761DB7AC221619F5
                E6F56B1C3D71141BD7ADC7A953A7E14DD757FAE517B469DB0EFE9933F3F97BF8
                E03E66CF9C853D5B77701F74899F7F447392320203737197933901DB12E36BFB
                C4D88353B2F9191111814AE52BE0D3BB106CDFBF0FC992278BCB8C7F966205CE
                F27BDBE236814634D202371742B26EFE9738A77CE80172B9056051E53F9054F0
                E52E0EB92A9F5116730523AFACC08E661048E74AE1920C1E82272D76AD55690C
                F310717B31E45AF2E0DF67D718E97BAFF46F71F6C555AC38BF0117438310A963
                3E502DD749CD7B9F1672A969C96ECB57A4A9E88365D5131BCE493B855F842FA6
                FC320EC593E5E6E3F2EDE62036247AB468D602AF5FBFC2DFD3A7A3478F1E080E
                7EC74B6E142F568CEB7BAA459980FCECE953A4499B965742F88DB8E3ABE72FD0
                A56B37B42520E9743A3E3FB76FDD46E74E1D71E7DE5D8C18318216744BFBCE71
                BA70EE3C6A55AF819604CE21C387ABBECC776FDEE287DC79902B301079F2E7B3
                0A0697374A73F0BDBCB8C0C3DE5835C04D1B36F04D63E6C2F9EAA62207DC93D4
                F4F829AF9774F6CC59CEDD832E05E15DC87BF867CC88AAD5AAA37AB56AC81E10
                20E74732839E521981EDB117CE9CC3D2654BF8F7DEBD7E8BDCD4A61A35591275
                1164CA92051E1E0A97166D0D8DF7EFDC41350257F9F215099CD3D5BC56FB156B
                29AF60E2D5214E9F3AC56B056FD9BA85E7D6FE52A122FE9A360DEE3EDE36C6CC
                F8A05881B3D2EEB6B8FEE1160453948D9556EDCA57DC8AC1C95BEF81713FF646
                F9343FF3B293D6DF8D5524BF24DF91F94B8D7C3F15B9BFF25AD83D2C3AB10A27
                1E9DC327D74F88D4442896608D65D1F06769645D4290149DC2CAE9671922870F
                B66EA6402B3271841F81730C81338F9CB88D6F07A789C0C938270B4258BE7215
                17E5B264CE82C64D1AF3504A51633F0772C3FF9E3A1513268C47FF7EFDD19A74
                435717A5D60EAF841085D367CFA03589A52C5BFFC0C183D1CA69B0B960CEFDBA
                2432B66CDE82EB7AE6DBB394B212858B70F1D310257B8BAD2DBF26EB715102EA
                355A0D17490B152E24BB527CBCD4D1615C7FE8C02158B870218FABD51027CE1A
                900DB5497C6DD0A03ECF9394D3DA6065ECB1C8363C5B8824A487F7EE63C98285
                F867FB566EA9F6F2F646891F4B622A89FF8913278966BD6505B0AB13304B952A
                CB754E51703CCFAACE49CCE3C8E123B45154E57D6111524CBF9F4E12CC0F850A
                2ABED5EFC839AB1FE8844B6FAED097588A98182DA9F54BB73267940B920E3F25
                2D8CF1A57B21B9989487D2C5099CFCA106CEEAA258EEA3F105365DDB8EF5D777
                E095F13D812492C77647094625A8C75C6CD93CD71A1EB8CF0B779A4B6FB07F4D
                96A9FF2A7012374E1AEE87BF2A8D47E16439E31C8010ED29A4730FE83F006F49
                949C4CC07423718D710F35F451101C82F3F5EB373873FA142A922828AA463BA5
                3FCC816E30E0D2E54B3C58BC44F1E20488E81935D76F5C47D72E5D519740D2B1
                632719C0921C4BCB6259CDC5BCD4618AB1130A57A5C5CC40CAEA07D91B5C6E92
                6ECCCA5316C85F003F97FA1919FD33707FA204BB23286200A7FA1CFA551F1185
                0B178270F2E4494411D83B77EE4CE3E61E6D0362D6ECAE6DDBA364899FD06BE8
                C018E2A22D321AA3E724896CDFB605AE3A57A44C950A254A96E4C9EC308FADF4
                1D03DF9B9EEB8BC30F8E93F812452F8DCD0143F2F87C099C4A7557927F7C22BD
                F047C5C1289DB4283F35D33218310D92E35E479A4211264660DDADDD987D6A25
                82B5EF692148BC760DE3A5068D2C4E2BB12CB6ED813538ADDE8F253859F3D218
                526056A5C9C8E19B09623C81932D7E935139294D14ED7C939FFF9E7CEE87FD51
                12962F7360998F1FB0BB9F7A062A2F58A56C06712C5665FF64076636D96B6232
                29491D82AA2EC2D1B5CA5DA38113726D647593377B56CC9FDBB59FB99F4456CF
                56E7A216E68ADE765B0390759FA2F1C9CF5886E34AB10267FFA03FB0F8F62AB0
                72321A166829D8D6CDF9E2AD24732CA6095AA30E55D296C68812BDE0092F254D
                CB71B8B8647FCC8124EB95EFE93E875E9CC0C2338B712DE416A258E50C1A7057
                A5FE8B891FB560528A483B02B8A07EC6776987912E8E47DAC69542FDF617D263
                7195BF90D63D85E3C98B25A9010EE6207EC500F7B537B51CF6E3784E98582C08
                314B2A66808A4A06863944D384D8D3979A2CC072F89109D257250C586F9F6A9F
                004B5B95E25CEAA0C5B4E72B9E6D47E320C5004C464ACC8C9D14F01D39E792DB
                EB30E0CC18685DD8D9221AEE42B031937CF5ADE45EA5450A8C2F33008592E423
                DEA983180338E50933EF6324C2C24060BC8DC557B7E0E0931378677A4BFB84A8
                9CA465493EFE9A71B2704CDA3DA5AF57E8AD2793897A857CF26256F9F148ACF1
                51AAF9C60F38ED9FF535238BB8AA085FBA711CC0F9A538A0F824F3FA88BFCAB1
                D6F775D09F586C9671A15881F3CC878B68F84F0748FC40ABD8EB9CF6A489D4A2
                A67F458C2EDE8D16B39762E1B43B9D4A2924CA6DB2F4D1F5D0DBD87A731FB63F
                388447C62724229BE4B4126517E4B567C4984309CDB7557FB71A6951FABA9196
                550CCBB59A28A0AE7F350C2BFA3BDC98C5998F8EE69BE72D2E47DD99D74BBC1F
                C3F72F2F442745A75881F32D8251796D53BCD5871250986CAB57743699629D28
                4D62A75F942F96551B8FECDED91547881D388D120FE37BAC7F8103778E60F3ED
                CD3CD7324C27E7E609EAD994AA7B3046705AE73E3AA2AFADEA6906A7F972CF08
                2DFA16EF8E46FEB5689361D034B02C523857B393BE856297322685A1DBA10138
                FAF4322275A4508BB277D14CB105270B0174D1BBA25DAE46F835774BC53064D1
                FFD8FD42A5509C7E7B156B2E6DC389E76710A1FB048360E03E4D73A53493A237
                AAA031EBE576CDF952EBBE56A8E59C499019366B411A6312CCA83001813E01D0
                8A46453C77415CC1693F8EB61CD0CAE5F3190BA37A60148438735009D6951405
                9BF7AD2DA809750B922473994D4B5B2D94505B6DD5C258255BD36BFDA37F30E4
                E42C7C12827965BAB8E99C3231BFA451D421AB4B46CCAF301A69357ED06959FC
                91442F231E853EC6C2738BB1F7F119BC6321838C592B7E499533DA07102066CE
                68095CFF16B21C3D60D4110C23F528E55718B3CA4C8487E8CEE7FF5B5DD1CF9F
                3DE76E87C489132BF98BB62609E602F9F4E123CF3251CFC1142CA065B1B6AF5F
                BFE695137C7D7DE3064E96C74AF761B992AF5EBDE2BED6C8F07078FB78F3E7B2
                8818E67F6416FB678F1FE331BD72E5C96317FDF33D0020A93A3773F97CFAF811
                A19F3EF1683156F9CFD38BDA9F2C29444D3C1501FF1729763584E8CA17A6B768
                BFAB1F2EBFBF024167BB2BC7169C465E304C80BBC11BAD02EBA0798ECAF0D5B9
                E349F85B6CB8BA133BAEEFC52BE91D4CAE72D03537B78BD641E8E6446D6B93B7
                E54C8E98E85B8BD2737F2DB5C348FAAE47A80BFA15EF8A26FE7578112BF51971
                BC37EB63F3E6CD79691276F49EE5CC0D8523D2E7A3478DC1B66DDB3071D22414
                2B568C40A2B302A70917832EA273E74EE8D8B90B4FEDD2F2CFBFEEF992127DF3
                9A00C9625AF7EFD98B3BB76FD3428FE0252FD93183BE7EBEDC87DAFDB75FE191
                C81BA3860DC7CAE5CBB166F366E4CA9D0B96A8EB7806E757E9BD721E264B53EB
                FBDB6F3871FC386F3BDB68188F4F962C390A142A84A62D5B2290369384CC4063
                591A138822B16DD6F565987A611E8C5A23AC333FD401FC4A1295333B0D820712
                491EC8EB9703D97D3320E865106EBCBD8D28AD84702D94F336C00D42AA533D06
                709A17C5E738E8B78353C3CF8361CFCEE39613A37EEA8B1C3E59E2A1C0974CFD
                FAF5C39A552B71EECC19F82555A25B9470B5F7EF83D1A2794B04050561E0C041
                E8D0B9B312E3ADA433D175B3A7CFC484C993B06ACD6AFC50A0A0129A26588B1A
                0E17A51998376FDEC0C489E371E4D061A4499516E5CA96E5D130CCFFFB293414
                470F1F469E7CF9D0B5670F68DC5D3062C060AC5ABE021BB66F4560AE5C307B02
                052166B1DB7E253822B651B11A4A9F3E7E40623F3F6513FA92BB42E2C11BACD6
                51E50AE511465CB34AD5AA9CA37F2069E3DAD5EB387DE634B205E4C4C43F2723
                8015034BA0143B70925C6BD2487818F90CCD77F6C013FD33EEE660D92146E568
                76D1F4F50B9485DDB1800449D2C1951DF3667221E018E4D2209C33495C2FD519
                E57B4668651785C6640D417942ECBAE5700998E99B2320D9695DACAFE1408FE2
                DDD02A6B2DB8C32D7EA282A8EFFBF6EE45C37AF5B16CF932FC52A50A54518DC6
                E8E2C50B68DCB011E7AC3F972A8579F3E7F3B42D9666C72A98B318DB564D9BE3
                F1B3A758B769233FCDCBAC22DA9C112308D12CBAECEFBB77EF60C0807EB877EF
                2EBA74E98A3A75EAF2732D45A5E8326B1F0B8C6073C4EAF618E879C3070CC4EA
                E52B6570E6CDA3D42112D56748E6600765AEE453C8CCCFB470588B15DCB2D1AF
                5AB58A2485919833670E8A152D61C9D98C71B02DE0AC5AB1027C48AC9F396716
                12F153CD44027B14366DDC80417D07A240C11FB07ADD3AA5CA83B90D96678BD1
                A2AF84CF5AC1E31CE51603C54EAC85BCB0F508C7B4CBAB30F3CA0284B9EA79BD
                579953B11A3EB15C8C7CE568D44A7EB69F991B695D71CEF4DD2511F67C1DF539
                974B4E8CAD3C1AFEAEC9E3A5A434EF232DDC572F5FA040DE7C68DFBE3D060E1E
                048D8B96039371AE450B17E0CF3F26236B96ACB8F7E02176EEDE8DE4A953CAFE
                478311776FDC449D5A3551BD5E6D0C1B314A3D4CC7A037D0C726CE4958B89E37
                039C5663E511243D5F1F89EEDDBAE1C081FDFCCCCADA044C517597D96F69F27C
                E9497C1CD96F20562C5B8E8D3BB62267EEDC048008448445F28258BCEA814952
                C5739EFC60946BCE1A8C7AD207C3B8C8C93618964CCE402C2A1C9E59E317CE9B
                C7637B972E5B8AD265CBF14D8A9D526D29E317DD26CFABD233CE59AE1C1225F6
                C3AC05F309A47E6A4842445818BAB7EB88DD7BF7E0DCA5CB48923C195F879111
                11BCED2CA824914F22E5305DF3BC48BCA610EB878BAB83632D2556B14F0E25D5
                B9E8A2C5F2C6699DC5AEA8B43C1692148147C43D5BEF1C8CEBA647D04A7AE5FC
                45918BA0B15F91A28D4BC6E1E76A8BE312A312BFC42648FB49C4E0923DD0304B
                4DEED3D4C6E396C1165719E28A9E1E1E58BE72257CFC7C78440F035FD74E9D78
                BA5313D225070C1E82B59B36A168B1A23254480C5CBD7029FAF6E985697367A1
                5AAD5AACB51C98FBF6ECC1F6CD5BF1F0E123F8FAF8A068F1E268D9B60D3FB753
                0905C2ADDB37508D44C0FC05F261C182C5F0609FA9DDFA0C38FB0FC44A02E7EA
                CD1BF0FAF94B6CFF672B1E3C7CC813BB6B501B4A9378690E9BE2FA20B5F3DEBD
                3BD8B76F1F0E1F398CE0B7EF9032652A1EEC5EB16245E2C85A7CFA148A756BD7
                E2E48913D8B973279A376B8ECC743F061C568B286BF6EC30C70ADB8D9E0ACE2A
                04E64449FC78260C3B3E5125A38431838660F6BCB93874F224AF2E7FFCC811EC
                DEB683F4EB5B88A4EFE708CCC94BA264CE9A95CF77C8FB77F86BEA54AEB3B6EF
                D8315AB81F03F6EA556B101212C23379BCBD7D94C5F20DEB2CD6E0E4FFB0DC0F
                3D963FDE8749C766E1BDE60D245E718E8932713865EC4BE04C60A4D58B28E357
                0463CA0E44629DB71CBC6017CAF82D93C216D7B02143B070EE3C6CDBB903B9F2
                E7E11CEEC5A3A7A851B532CA57A88056ADDBA07CF90AE8D5BB373AF7EC2E4385
                80D2B1694B9C3C75025BF7EF46DAF41949FC0D43DFDEBDB06ECD5A64CF9A9DE7
                823E7BFC0C67CF9FE37AE3EA8DEBE0E5EEC9B9DAAC59D33162C4304CFB7B1A6A
                D6AECBB35E2C8BDF31385961363338F3142E8873A7CF2047B6EC48952A352E5C
                BC8817AF5EE1377AFEAFF41215CE1915114E6D2F8767CF9EA168D1A2F070F3E4
                059F6FDEBC896EC4B959AEE9BDBB77D1BC693384867EC2FBB7C1FC805F1664CE
                B4A6A14386A2FC2FBFC80EB768F1C6927C04216D0055CAD883533EACC948A2ED
                6F1DBB60CBF66D387FF532423E84A058A1C208C8920D010101F840D2C5A5AB57
                4862D1610D8D5B404076AE46346BD68C6F16A708D069D2A7576C01B2CE70ECD8
                31B46AD98A27838F1B37CEAA5D710FE98BE529636CF7969814CA8F6508A7FF66
                5D9C8F7997569078AB93E30D59B94C6B1DE2FF1229FA51802639C6551C8ADC5E
                79783C90BC61C59B60CBFFDDBB6B171A366880C97F4E46D396CD994C8213FB0F
                F054AF69B366A2488992A85BB326BC68875EB779130F7D88F8F009850273A348
                D14298B57431AF0C30EDEFBF78E5BD11A346A161C3C6DC4563883262C78E1DE8
                445CB84B974E1834483E7BA567B7AE3874E0009611B7CE99278F6C4350C5C7CF
                8373F18285F048E28BE9D4B652A54A730EF7F2C54B74222EC3B2448E1D3FCE39
                1423A3418F5B376F2071D264489A240997BAD899A0EC68419608BE71CB3FC895
                3B2F241277179148CA327356509BD8D99EBCBA1389EA6AD16829067012E7AC46
                9CD3DB8E733297CA5512651BD7AAC30B8EADA7673111FBF2954BC8469B8A8B72
                94FDD933677859CE5F88934F9A34994B161B376E44B72E9D3198FADBA97B374B
                094E7A565FDA5056AF59433AF26ABEE1A8F40DA75BC7ED7C4E28D1383454AF4D
                4FD1F7D8141C78150476069760D273F708E23DC2F13B92A4C4104BECDC4E2FFC
                5571307EF6CD2F074DA8910EA24DDCE9B71A9DDE10C72954A0002A56AE84A97F
                4F814EA3C3F86123B171F3466CDCB61529522627500DC1B64DFF602B71D774FE
                99706CFF41D4AA560D63FE9888D6EDDBF01AB74D1A36E4EE8DE9D367F21295CC
                BFC7FCA00C742C2999551D3876EC38377EB46AD204B76FDDC2D2952BE04F62A3
                5CA43FA69ED8829371F961E3C7A065BBB656E3060EF606F5EA61C69CD9A85EBB
                2674A256313ECB87E3F2B224F40C760CFC2EEA47C7CE9DF971098D9A36E5C6AD
                A58B1663C8804158B87409CA90A4A0063DD88BB30EC059BD5C7968DC5C3178F4
                28F8244A84F7EFDFE3E4C95398397306D76F97D0BD03487C950D3D907DBB045E
                E65B66B9AAAD5AB6E03EDE254B972245AA94BC7E70C3BAF5101AF201878F1EE3
                F76662FADB57AFB93493394B567E2DABF5F42DA054BB14A7F339554B8D91870B
                5C0FBD876E3B47E2B6FE29ABFBC12B8DF3E3E280FF230065855434700DD3A15B
                D1D66895BD2EBC4D2E5667482AE75B227AEC4E5C7BCF26BD42D9B20823B174CB
                D66D70A105DC86F42EAF44DE983E6F3637B6AC5FBF09BF77ED86BF674C47F5BA
                75307EC428CC983E035BF7EC402001921DE1D783B8215B5095AB56E1DE18064E
                666D6573B360FE5CECDDBF17E72F5C44221F6FB46CD20C776EDEC292550A3861
                17EB6C43B6E05C4562EDF20D6B90BF4861AB1C4BD006F1903699FCE83B6800BA
                FED6135A51AE682191DE17457ADADDFBF771F3FA753C7BFA0CF74994658717F5
                EFDF1F1D8943B18482A50B1761C840023F2DFA9FCB9553C1196D5D39006755E2
                9C37EFDC86E0E10AAD8B2BD7BD99F85E8036BDDF7EFB1D857E28644985A34DE2
                0381F7DAD56BB87BE70E07F2D62D5BB888BB6AED6ACEF55995C5597F4FC7A861
                C3B075C74E14245D9FC167376D2A6D48CD183C741837E209566978DF12921CF7
                63E7D57A37EC0082489C0BB98E11FB67E066F813440A61B408A2143F64FC966E
                F81EA42560EA8C3A34CB51075D73B78137779BA819DB9FCDD6886BEF19671933
                6A34E6CE9D83CD9B36238AC4BEEE1D3AA14D970E6843A22233FFDFBF771FBF94
                2983EAD56B60FC5F7FA2FC8FA578E58045CB96F04A0033674CC3F8D163E0AAD5
                F1CC7D41A9A9635ED811FA08E88D7A9C391F84142992E3D72EDD70ECC0112C58
                BE94F4DCFC5F3863D2169C2B962CC3C65DDBF8D17B964A76C02BD22B0BD1BDBA
                F4EC86DE0307C87609FAEAD95367B86E7B3EE83C712A818BA9CC8AFBFAED1BF4
                EEDD17DD7AF6E4150E3838070C943967858AFC48082E93392A24A63CD40CCE1A
                249246D13D9AB4694113A1E516D80C1932F013B1BD7D7C603E5327322212B368
                535BBF6E1D5EBD78016F1A3B660C7BF3E60DFC1227C6B215CB9131B33FBF3B2B
                FDF2639162F8E5974AF86BF62C6E1FE8DCA1032E5EBC84854B96227BCE0058A7
                A8C5EDCC1CA54B7106A732F872612C13C2499CBD15FE1083764EC4D5C8FB2401
                86F1503BC92AD6D56E14FFBF2066EC61A75DD7CEF20B7AE66B0F4FFA8F89806A
                20C3BF044E460749C76CD5BC05060D1E8CE0E7CFB066C54A2C58BD929F0ECDC6
                349400CB8A358704BFC38A0DEB50247F010C1F3912ED3A76E0BBF7CCE97F63D2
                F889183F6E1C72927E65226E25B2AA078AAFCE48C064472364215D4B20B63A77
                E66C8C1F3506A3C68E43A3162DE45C57FB72A3EA6F8EC0B91D8179ADCEC5B402
                67D75F7BA0CF80015C17BD76F10A9A356E82A4A473B6EFD401850BFDC00B5D9F
                3E79021D490FEED3A71FBA92FEC9C4DA250B1763E8C04158B464314A97AFA814
                1FFF4A709218EC95D80FD3E6CF819F6F122E429B2B4998CC21A03490A3860FC7
                FCF9F350A57215B46ED912193267E6A17EBF511B6EDCB881956B56133833CB7E
                4C027BE7761DB8A5F9E8B16388A436962709A70301B46B8F9EBC1AA1F5A9DEDF
                059CD64E7E7E6E88C4CEE80AC7B9571730E5F47C5CFA789D76B948BE63199512
                983C9DFA2B0E3DFADE2467B7B00916E169F044DB7C8DD124474DF8C14775C6DB
                1784B2A95EF74D6409AC087E13CCCFE864C5BC6EDFBC890F1F3F61DDA60DF023
                EEC8C0C9CE2B19D4B72F817635C612005965BE7D870E2177BE3C7CB4D7AC5C89
                BEBD7B63E4889168D2A299DC3E5E24CBC2D9D474621AF7B3A74EA3758B96C893
                372FE62C58000F6F2FB55AAB6865E4536A29F07F6306A70CA097CF9E73707623
                70F61AD09FCFEF7002DBB2C54B31E5EFA9A453FF429C53C3CFA5397AE4300F37
                ECDB9FC0D9BD270F24609C73D8A0C1C49516E3E7F2E5ACEC3F96344158FDB0D5
                39CBC19BC03963E17CF81238CD9FCB2A889CD4FDF17D088A162C841F48D49D36
                732612916E6AAE52DF9100C72CCE2CD22A5396CCEA98ED2435A325A918ACB40A
                73A9FCDEFB776CDDBE8336CD7C96B18D071EF46D9CD36E3D4934515162046E7E
                B889B997D663D7ABD324F28643AE4C2BF10AF15F6A734200273FEA81F48B24A6
                44E856AC33AA672CCFEBE45A47873812F7BE6597B41D4C0532B4C0BA76ECC42B
                E1BD7CFD12751B36C4D8B163B961875F2519B179ED3A746DD719813972E24354
                388E9D39A39627B91414840EEDDAC13F933F3FBC88192A04176DB4EC0CEE7B94
                E4D39C7B76EFCE75AD5E7DFA700EECE2E6CE9F157DE61C8073F776F584330E1F
                9340E07CC675CEEEBFF6E4E064C069DAA0219EDE7B80452B971197CA24FB0C69
                BC57AF5A855EBD7AA177BFBEE8DEBD07D78D9771CE39180B18E764FE529B5AAC
                8E4A83D81A84BC13FB4603A765C36155F8EEA2188173D0A041E8D2AD9B5AC19E
                BB4E9A34C6D3A74FB19CDAC54A72423164B128A352C54B205DDA7488888AE4D5
                E057AC5A032D2BB0FDADC606EB99890D381D9586B05E4F92A287328EF9D6F401
                CB6EEEC2EC334B61F0FC04032D2483E002AD647BE06EB45B7D4770F23033E288
                6E915AFC98AA185A1668823C7E01709334721995F84C5E8EB915B08AF6C0F245
                B43849E76266FB990BE6A27CF9F25C6F34C732DFB97E13B5AB54435478046A36
                AE8FF17F4C56C1A78F88C094C993317BC64C2E2E366CDA042953A5E4AA063B7F
                F209AB004FC055335FE8794C8F1DD0AF1FCE9E3DCB8FAB672740B37359784002
                11CB5279FEF2258F26CAC2B809DD6B44FF4158BE742936EDDC41E0CCA5F44306
                E71BD2E1B858DBA31B7EE3E034A177CF5FB167DB768C9D380E15AA56E6E37EEF
                EE3DEE267A4EE23B2B8ADDA55B0FCE1D771097EAD9A90BFAD3779BB56DCDC123
                9A6B23C5084E493608B108A1A489318344565F5F3F9B513629A6AEE0376F5128
                5F7E142E5C10E3C78F473A7F7F8493BAC0FA336EFC387E62F5B2152B90394B66
                65C4658D7DD2B8F1F8EBCF29FC50E0497F4C42ED7AF500EB0483FF1A9C66BD2A
                A6D2FBFC9C4BAE64B3E31A0CF88828F4D93F1EFB820F22523210385DE16203CE
                E88FFEF7B019431EA4551A19731B2472F541851425D03A6F53A4774DC7ADA402
                E283237E2D59290CB4C82E5FB888BA55AB234DFA74FC54B12C6C07172D319E21
                C1EFD1BA69339C3B790A33162D40A5AA55F80963FC4E069A838F1FD189B8E7E1
                234750B050417E6C20E3BC211F3EE0F88913FC78F51F7FFC096A0E2881E7D9B3
                17E84B003978F020D2A44E877C24E6A64E939A7B7499EB8539E8FDFD3362E6AC
                59BCB21D135379E0FBB62DDC4A2C985D69049EB72F5ED2E2CF87CEDDBBE1F781
                FDB9BBE2D0DEFDE8D0AA353C7DBD51A97A35CE7D0E9338CE80FB91DAD5829DCF
                42DC92490E8F1F3E42A37AF5B99E5FA66205A44C9B1AEDF9014AE61239D12384
                783415E39C152A1238FD307DCE1CF8FA3906275B70ED5BB5C14E12C94B962849
                227D1EDC243DF3CAD5ABFC043316AAB778C912E4CA95CB26B0E0C6D56BA848E0
                4F953215366CF907A953A7918D9F090B9C1663B17556A5A48451AD7EBC1B7D8E
                8D83C092B3EDC44259D4B54B2C8E45E0FC1749D54924EEF6619B86C48B48B138
                322D3FF856C7CF92D7C353F4426EBF9CA899AB227E4A5598F4CB44DC4A6B4959
                FE8F499239597868188692C8952E6346B4EDD81EEEEE1E96CE4902D73BD7AD5A
                CD0F2FFA63EA14BE08D5456492A3B5C2C3C2B16EED1AEC20CEF6E4E933180920
                ECF8BEA2A4CBB2631B32D1BDCDE168B2F4409C35528F63478E62D7AEDDB87CE9
                12DEBD7BCFDD0EC95224476060202A55AE881F7E284862AF2BD6ADA4E7EFDC85
                3E04BE6C01D9CD33C95FEC6C95DF49A465617CD56BD5548C2A261E4EB868D142
                EE4AF14EE4CDF5EA7AF5EB63FAB4E9C84B9B415BDA50D849D8AC2D278E9FC084
                B16348B47FC38F3D606542FDFDFD631C3AEE3BA5678F1A3A9457A4EF42BA38D7
                25D576D9D2FBE0771847EAC2B9736779060C1361AB54A982A4C99262F59AB5E8
                DDBB0F8F12528D3C24CA3F78F00025A8CDCC10C4CEAC61A53C63AA2E1F578A77
                705A1B8A5885BCA9410B30FDCE6A7E12A68EA5512B616EBCD29A604E5DB6045F
                43C95EFFD6B42E9BF6F0DBB30A0506256342C76BE7122B27507A238F4716D4CD
                5B013FA62B0A1FC10B2EEC58FAFF4484FD5CE3656B8D4939419A0D917CF49CDD
                F84BB21EC40D1CA268C9751504A51280E5147136D5E19191FC77171739A2891B
                88944DD3A6CF4A79509EA92681077DB336B0E46EAEAF996FCA406D940F4CE400
                B7394A4FDE80D9311CEC195AD1FA28789EA04BDC299C1B8418271479457E763C
                BD0B6CCEBF619B1071D7C82803DF0C78F57ABBE1B2A9156192CB89CA11A1927C
                86ACC3E3EE2DC44A654691A8CF180A375031F199556F341A14E059C69B05EAB3
                68269652B77ACD6A64CF9143BEEFFF4FE00CA3FFBA6FEF87FD1F836014A9D3AC
                00B4153865AB99B99A8249D9F194F422E9DB636DAD13CA042B16C8C43DEF482F
                64F3CA8C0685EAA264DAA2482178402789DCEA0C9E19F19DFDB3B2C547D12D05
                25C63B86E2A1AA8A2A9F2123DA8353BD50BE0F8B8231D7C2B55975E66B2029E0
                540026595C2A3CB24754F24BCD67972AF9B642B423E505B996AC92246E9D8C6E
                167DF9414CA4EA305154ABD15A3A63490731E7BBD918B262AC88674D26C99262
                F615E10032A8C10F51326F56E6329B82E212642066B1B58D1A36E471C0BF92F8
                CFC00C6BE5272182D3FC97D91AF6CCF41C8D97B6C0638FF79C6FB1AB2C67670A
                3C6959306879ACA57A7CABCE042D892226531C02E81D907971EBF41AB8E875C8
                E89716B99207A25A6005047A67E249DE2289B82645ACD37CDBE3E28F62600D5F
                B208DB7EEE7883FB7CDEA119148A8EAEFA2EACC062BEB7DD81B3D1EF6301A77D
                C1B598CFE674D4E0E8EE89AF02A7A4F4F5B3C1148E065E52C7C95EEAD8B97D1B
                FAF5EB8F9C397360D5EA355CE7561DFE9F49648F0BC583B536FA8E6486D5FEE7
                C7D175676F847B447168328BA75160F5E9745CD7F4FAA4C54F890BA154C11F91
                2C911F3EBEFF88CB2F48197F721DF73F3C4488E923F4A4AB1A594820893DCC71
                2C2A253BE4AA1CE60ADFA222BAC8F097C20568A34CF0127448ECE28B6C497320
                307556E44F138800DFCCF061FA24B118AD68E99549A9D39EA042241C0CF897F6
                FFE85BE5373E5B257B0E1B3D40213A09EAA62B587D35F6476E3806A7A3D645EF
                C3D7B4D371C7CD05BD19B1DCD20103FA63DEDC79F8E9A71FB170D1626E01E689
                E3EAC1BB71CF4071387AF1E2E7B4EE1435502FC807208C3D3F1DF36E2F277126
                0A1AEA8486F90AE10113A92F7992664587C24D513249417890FEC7451EBA4524
                0D6498108957A6D778F9F1051E053FC5E3F78FF12AE42DDE857EC0EBF037A4B9
                46F2B84B2EB6194578B878C1D3CD135E6E1E48E29504E912A5457AEFE4489338
                19D278A4842F92F08D4163329F89650672828262C2A218FD66FF9BC444DE870F
                1FE2E2850BA85EBDBAAD4AF02F8D513C835306252BDC1521E8D1666B0F9C89BA
                C0157F9E21AE7745B2A8A4A891BF32AA662D830C1EA9E126B972604A8A6E6150
                2429063C8D121AA8275D35D264401489BA11846C9693C7CF03815CBC592BBA40
                2B68F889C76E1A1DDC052D4FB1E2BA02D717D8EF467E78AF0A4ACE35FFFF8FFB
                FDD7E85B22B6FF8F12CBE661A435A7AB217E39A53DC5233879F3D941F15CCF78
                647A8C16CB3BE1A9F60324D1157EA4DB55485F1CCDF336407AF7D47017E59A3B
                A2A213C8C70999E12DEB3B3C5247B0E8B12645349645248B118AC1D4A4181818
                DC34B0DEF8E5F21EDC10A25CA791C3AFFFBD51759293E281E21D9CACD8B38138
                DCADF09B68B5B427223D5C50224349D40D2C8F1F92E48487E0AEA4255B5B38F8
                59D330C26C8D9438C445356055B48E9BB1A4314972E0831116A380D9800FE5A7
                EA461544DE3AF6A736A1E9964E7292038A67703AC9494E8A2F7282D3494E4AA0
                E404A7939C9440C9094E2739298192139C4E7252022527389DE4A4044A4E703A
                C94909949CE0749293122839C1E92427255062E0BC4F3F337EEF8638C9494EB2
                A10B0C9C1BE9979ADFBB254E7292936C683303674FFAE5CFEFDD122739C94936
                D48A81D3977E61A2ADEFF76E8D939CE4244E0F0441C824675F4912136B377EEF
                1639C9494EE2D48AC0B9C8528A5792A6D08F1EDFBB554E72D2FF380D27600E63
                BFD8A4351240D99B43BF77EB9CE4A4FF519A4AC0EC69FE23FAC90A92D4123240
                337EEF963AC949FF23F41EB228BBC9FACD180B022820AD0119A4F9BE77EB9DE4
                A4FF63F4805E17E875885E8B0898EFED2FF87F20D196E51044EE400000000049
                454E44AE426082}
              OnClick = imgWechat231Click
            end
            object imgWechat313: TImage
              Left = 0
              Top = 0
              Width = 231
              Height = 100
              Align = alClient
              Center = True
              Picture.Data = {
                0954506E67496D61676589504E470D0A1A0A0000000D49484452000001390000
                00640806000000FD86476C000000097048597300000B1300000B1301009A9C18
                000000017352474200AECE1CE90000000467414D410000B18F0BFC6105000049
                804944415478DAED5D0580D446DB7E92DD3D57DC0B871D1C5E9C0A4E71773BDC
                A52DEEEEA5D0E2EEAE458BBBC3E1EEEE7EBABBC9FFCE246B777BC8417F3E8E3C
                EDB27B9B6C3233993C797D0438812CCB7EF4164CAF9FE9958B5E69A14183060D
                FF7B3849AF9BF45A2B08C21C673B08D1BF2082AB426FB3E9E5F7A55BAF418306
                0D1F819BF41A189DEC1C488E08EE4F7AEBFCA55BAA4183060D9F80014474032D
                7F58498E08AE3FDBF8A55BA74183060D9F01E388E87E651F38C911C105435151
                3568D0A021BEA02A11DD1A0BC9DD80E65CD0A04143FCC24B7AA51334294E8306
                0DF118BF32925B4D1FAA7CE99668D0A041C37F80B58CE442A0C4C269D0A04143
                7CC34D4672F2976E85060D1A34FC57D0484E83060DF11A1AC969D0A0215E4323
                390D1A34C46B6824A7418386780D8DE43468D010AFA1919C060D1AE2353492D3
                A04143BC8646721A346888D7D0484E83060DF11A1AC945876C7B93941A2DD0C9
                66FE9D5130C3081DD85F7AD98487A18F702BFC2EAE45DDC2C557B7F0ECED7318
                8D46FE62C3FAAE9135E85D91D8271152FB24C7771E2990D62D15527B2587BBDE
                0306FA4F4FE7D143806C364364AD11587BE86F41B41E43501B2BD89D47B0FBD7
                FE9B68E551E1A42874CC4188F9430D1ABE3A6824170B2428B73AA7033E4412DE
                CAE1B81E7117A75E5CC6C53B9770F9C165DC7A751B916204DE1822218B02447A
                098C8CDE31AC7C0BED03131168A40E5E823BFC5C7D903E615A0426CD8C1CC9B3
                2193770052BAF8C285531DA31A412139D8939CA4BE47E7B018DF44FB93FD4E44
                EC90EC3EBF6B3F0D1AFEF7A1915C0CC80A09C912119519AFA4705C0D7B8C73CF
                AE60CFE5FD38FFFC129E443D01DC1899C99018A1D0BB4C529EBD48F5A1C32AF1
                F3489C1845410F83510F77B30B3224FA0E391367C64FE90B23877756F8C20782
                C8688D684ED4F1DF32092F76394B788740F62124E78428E33EA4319AF6CEEDCE
                F6D1A0218ED0482E1A18C59961C21BD35B9C7D7509DBAEEDC5EE1B47F0D0F41A
                51A20992FA628423121788347C4C2863E4230BB63BF3DD929C2291292F3A1629
                C14C5A640AAA4C2F89BFD331A90DFE666FE44A981D65B39440B1648590D0D51F
                3A41A790620C921360638C77B1C48790DC6794E03492D3F005F1CD919C837023
                2B9A1DB3B14926092E7A11E1443897C26F62D1A965D871E9005EE85F41700597
                D8049953194CA2CC6D638C067492C4298BFD0B3B7BD9FBD45589288D93221D53
                24A213F9FE4C4213699B81DB03055D247D4FDF18E9150614F4CA8EFA056AA240
                9ABCF015BC880A45D8A42E5DB41E0A31FA6B838498D63B215A0B3F8E65644EF6
                82F5DDE989999D5250546F073EB66F99A448B5EC21F231E7E63D501F32D6367C
                685BFF237CEEE32B765EE5A5D3E93EF8776C4CD96F4451B4BE7F4BF836498E4D
                3EF53E664423295FE19EE911169D598E25E7D6E2AD6704CC66F3474C524762F8
                1CC32A8BB2E3B1E8CD3BDC1579FC8350277F35FC94340FBCE0491B0C10AC9297
                8DE464BC8BE414884E3EC5A9ADEA0DFDF4E953F8FB93B429DA6E424932C31865
                849E6E2E9DAB8BAD51D1B8F4F1C387B874F93202B36441E2C4893F8A674D2613
                6EDCB8810C1932BCF34696CC126EDDBA099D5E8F54A95239EEF72142B0D3CE3B
                FE8E91CACE1D3B70F5EA35D4AA55137E7EFECA3CFA04BE63CEACAB57AF223030
                F0A389EAFCB97378FBF62D72E6CA055757D7B837E22BC537487232979E6CAE05
                016188C4B67B87F1E7BE69B88B7B30BB924A6A64928118E727F16727396A8BC4
                DA23C970914418A87D15D397468BEF9BE13B7D72B89288C4F697D53E0956DFAB
                2394DE48D1FE66882BC9D9DA78F5DA3554AB5615356BD4429F5EBD9536D0D3C4
                6C36A16FCFDED8B56B27F61E3C0083C1852E01496C16229495F6FCF5E79F183F
                FE2FCC9E37173FFD5CF4A348E1E1C3072853A60C6AD7AC855E7DFA38128FE23D
                E24F32D6C6AA95ABA078C91218356A947AD3AB3B5907CC99473A4697631B5CDE
                B73EBD7B63C58A15D8B86913020202944DF644270BB1FEDED9C9222323912F5F
                3E9428511243860C818787C707CD4D46B8356BD4C0C9132770E0D021244D9614
                DF9A2DE0DB21398BE406453DD531D55308C313F939FE3E30176B2EEF428417B3
                9099943D38B10888ABB6F139494E016BBC858844451235C9C86C0840CBBCF551
                2ECD4F70135DB86D502139E7A4A57C2BC5BA256E03AB9CB353C70E58BD762DC6
                8F1D8FF265CB294AB4AB0166C9842E1D3BE3DF7FFFC5A9F3E78858DC48B28BE2
                529581243BE6913691A4D23CB809EE3FB88FB90B162279CA941F15C8B271E306
                346FDE0CA3468C40BD7AF521EA0CB61FF2262A0E9E283A6FDB366D70F0D0414C
                993A0D3FFEF8235D639D433F1CCEE6ECC4722C7F5BF72592EBD50BAB56AEC406
                22B97469D3DA088EABF2EF70EAC4F85AB956A74E9D42F112C5D1BB575F74ECD8
                D1AAAEBE8FE8D83CAC57BB364E9F0CC1CE3D7B902459B20F18CDF8856F8BE4A0
                CC2F993FB4259C797B01138FCDC3DE7B4760D49921EBD994526C6CCAB0088E41
                68FFDF4D760880536F0C89D9021921294E0BD1644612D917AD0A3545B574E548
                7975E3DBAD0243B409FD5F91DCC99010D4AE550BF9F2E7C7C81123316ED418B8
                9094D467D040520D4574E9D0199BB7FC8B3317CEC1C5C51583FAF4C5858B1731
                79DA54F8274880BBB7EFA04EED5AC84BD2CA1892E8744CDAB3741DEFBE2D23C2
                C33078C8602C5FB60C6B56AD4696A0AC345C7ADB8F2D2407459ADBB17327116A
                30EAD76F80C1C3867189DDA92B5A54ED76967E5A6CAEB1919C1ACFC8DEFBF4EC
                89356BD660DD860D76246791E404A7929C4C52BAA0B33B2737D99AE9B422460C
                1F8EBFFEFA8B1E145B91256B56E898BA6A7D08BF637418C9D5A983D3747D76EC
                D9AD915CBC859D0D88CD2D1322B0F7F1198C38381D5722AE10B94541362B13F4
                3FB4437F34EC9FD2567FA76C47BC92DA29BA390CA21E8D325647F35C8D9050F0
                E3563AA5E3FF9591D966F17BF4F0219A376D8ACB972E6315DDD899326542F306
                0D11618CC2CC050BE0EAE64A24D7095B49920BB9701E7A9242DA356F8953274F
                60E3BF9BE09F2809B66DD98A766DDB62E8F061A84137A5A354159B75515131CF
                9C398D16743CA6168E1B370E3D7BF4C0F317CFF91E3A2737349BF1172F5C4022
                22D74489133B9808ADE34D639C254B16F41B3000EEEE1ED8B36B17C68D1F6FBB
                36B0518545E0B6DC4A4CCABA7BF72E6EDFB98D6C41D9E0E9E5C9F75604F1D826
                98883469D260C8D021F0F4F4524F22714DDE648A2435B53871AE806DDB76D0F1
                F5B6B96175D0587465FB73282EAEFA75EAE24CC8496CD3482EBE8231015341F5
                3C58230261D87FFF08861E9C81DBB84F03F086AB766649F79F7ADAE282F7B647
                B25D3AB6A7214A8732A98AA25FD1AEF08537BFC1FF3B3F9ACC6D4F9111E14430
                2DB073FB760C1834084D496594488D6ED5A831224C51983E6F2EF42E0674EDA8
                90DC89F3E7E1A2D7A37D8B960839711C1BB66C865F824418D8AF1F962F5D861E
                7D7AE33B927C9861DD6C9615BB2875A240A102318CE6B2EA359C32650A575387
                91B453BE424574ECD00E8F1F3DE163225AE530D93A4E6C5CAD1E4741B423379B
                2784ED9F2D474E92F486C240ED3D76F428060F1E64DDCD9EE42CCF1C662FE5E6
                1062A65BB76F71D5984971CC06C9AF25930C9D5C526E19A1AB952C79328C1A3D
                1A7EFEFE960372E96EFFBE3DA856B50A11E030B4A0711304BBB35B2439ABE807
                DB36C690F4B151DDBA08397A0CDBF7EE43123A076FA5A0D86DBF057C0324C7BA
                67A437035E210A079E1CC188DD13713DEA2E445733697F911025161EF2BFE775
                7A1FC9C5D0A4651DDCCCAE681058192D733586AFE0CD034BDEA9EEC5D9A32871
                8FE68C69D33064D060E4273573C1924570F77007CB826B13DC04A19111983267
                26F47A1DBA9224C76C722117CFC39548A363CB36DCCEB47EEBBF3092CADD986E
                C40B245DB97B78D04D2F7069CF6C9438B1454926ECD84B52489224D6D01285A8
                CC78F5F2251AD6AF8F7B77EE61DB8E1DF0F5F3C78BE74F88FF45DB18B2B00B3A
                86450DE4260BAE8A4AAA3D4EE0718ACC4C21C882A2E2D3FF063AB7BF7F021EF4
                1D191E81D76FDED8C6DE7EECF867597D49DC2E3A7AD4286C25F57CD69CB9489D
                2AB54228A2722562101D3F8EC81F068CE0ACD79DA5114646A25BD7DFB066F55A
                ECDD7F00C953248731CAA40401C9CA79254ED696E38B8AC3876F33F3F16AD6B0
                214972A7B071FB362448929807A0B387889BABC74787EB7C8D88F724675174D8
                4438F4F23C7AEF1B8EEB11B7785C9A484F4A93A0D8A774F23BA9E08BC081E494
                D8171EF222586E60FEAFC4A735BB8C46B38EFAA54792280F8C2CDD0F3F25CFA7
                4C6235FC58C1E793EDB66FDD8226C1C1C81A98053367CF42B2A449F1ECC533F8
                FAFAA3557063BC2452183E6634DD4CAE18DAA73F0E1C3880F574E38B447A4348
                72BB70E912D69124B779ED3A0CEA3F000D9B3446A6C0CCDCF6658E3262F4E0E1
                08CC9A15D5EBD6C22F952AC2CDCD4D0DC510AC76B64D1B37A07DEBB6A854A50A
                FEFCF34F08448E8CFC9884668D1362BB9B15A94656A5305947E76024A0921C0F
                EAE64427D805755BA43F95406289FD538D67560F2E6B5FEF1EBDB07EED1AAC5D
                BF0169D3A5B3B6C32A71395E69DBBB43A88999DBD2AA57AB8C02050A61C1A2C5
                78FDFA35BA77EB867BF71EAAE753DAC0A9CD2A9D896A3C1DF58FFA79FDCA6544
                8486216BF61C30D2772291A9AFAF2F468D1A83A474CDE27BDC5CBC273906F664
                BD197E073DF68CC6819767C0243BBDF8BFDF6D7B9263F35912149213255BA02F
                537344930077D905BE7A1F140AC88FB2012590DB372BFC047728F3D7E25366D0
                7F9EC6D1216FDCB88EB6AD5A61EAD4A94893F63B9C3E7912BF77F91DCD48655D
                B7762DF6EDDB0B7FBF04FC01F2F6D56B92CCCCF04FE00F33353F343C0CDE89FC
                B06EFD7AB46CD0886EDA7B58BDFE1FA449F71D8B82C6A3BB0F50B2C80F68D0BC
                29BAF6E9A590166095B2443A665868285A36698A3DBB76A369AB16E83F602004
                BDE275BC4637F6D1A387B9BA6B0BFEB54960CC98CFC8903B1D045B54210BF236
                9924142B5A142952A4504947743A0032775F49DC28A05C11B3CAAB3AF4EBD51B
                6B56AEC23F9B36212D773C385C58387CE12C28DA6CA6F69AD0B95307AC5EB512
                952B57C5848993F0E6CD6B74EAD811CF9FBFB4CE11764E91BF5B82A1A19A2B25
                EEF43977EE2C22DE8672923378B84134E8E14612F3A891A3912C59B28F0A2CFE
                1A11AF494E5623EC5F496198717636E69C5A893706927C744C7A337FF2F1FF6B
                4457574D822291F129C9A5131D3C646F789B7C513AE30FA894A11832F9A5859B
                E0021759AF3CD555C9E2B30BA9EAACB94544C76C68EC86EF4F37F69CF9733178
                E810B8B8E87132E4245CF406C8441A963034BD4EAFA6C0019E3E9E08CA1A841E
                9D7F83BBBB3B56AE5B8334016939D15C3B7B0EE54A9541DF2183D1A0691345DA
                906D521693BA0EECDD87D62D5AE2F58B97086ED604FD070D2229D1C09F084B16
                CE2782E8043717250E4EC90D06978239293075D8A4A8738AF4A3C44D9A6416D7
                2761CD86F5C89D278F539253BA6E298E60E7A9B6DE4A3AF4EDDD1B6B5711C96D
                D8A848720E81CFD19D0631C795D91B2F5D3887CA552A92AA1C8672E52AE2EFC9
                13799075787838B75746CF57515C348E01E97A22B9C6F5EA71A2DBB4753B1224
                4CC8D555766E37370FDAAEFF9FB3457F6EC46B926330D1059D77630D2685CCC0
                4BE1397730C831A68323BEE890D8CD5D477595262CBB015968846480373C90C1
                3B2D4AA42B8212DF15423A8F946AEEAB4D5693642322CC5124B5EAE00257E566
                FD5CF3D972339A4D9C086E12D9D5A9591369D3A7C39FE3C723095383044562B2
                9E5255B365D5611A11168A668D1AE1D8A1C3DC9CB064F50AE4299897F3C7EE6D
                3BD1A47E034C9D350B25CB95E51E45A88A37BB495FBD78811E5DBB6017ED67A4
                9BBE59CBD6E83368803A70121E3EB88FCB972FF13C5F7B70694795E4643585CC
                3EBE8D111C93EEB2E7CC019F04FE88CDA2F9E4E9631CD8BD97DBEB1C84326E06
                D161EDDA7FB067CF1E7425C93679D2149678672B12274E84EF0B15E0718231C7
                55E6F6CEDF7FFB156B694C98245CA142458C2392134435DC4516ACD56C9C95D7
                620F1D415244BA0675EBE214A9BDDB599C1C5D17AB8AADDA073592FB1AC1ED23
                CA0D75E9ED0D74D8D10717C3592A8F51D92C2B37CC3B2BAAFD7F0C4BF4D02CD5
                006DD9C443A1A01896597F3CA274F0744F8CA004395026CD0FF839650E2476F1
                232237C340DB55133A57A0A24852BDFCE60AD69DD98A6C4932A122497902519D
                80CFA89A701394C46F9A21030760CE9CD99841A454B44431848785738983DF6C
                D6180D51AD8BA7A8DF37AE5E41DD9AB550AD4A156CDAB81183470C47955A35B8
                9AB570D66C0C1930182BFE5987A01CD9D59B5BB0DAF7A74F9D8C717FFE899F0A
                17C60E9250829B36436F6A832279493CBECC16DB26DB0DB78DE4485FB5496982
                A27E5A543D9DD54E1593E458BADFA1FDFB50A74A75B8BA19E0E6EDA948A7AA7D
                8CA9AF926ADF1395EA0D0E44C4D4E48888488CFAF30F54AF5DCB8E6454F2A231
                3D74F830EAD5A985E2457FC6E1030750A2780922B9496A9688425292658E0AF6
                497D82F521CEFFA27D1AD6AEC34D09DBAC24679B741AC97DADA04924D3643053
                D7469E9B86396716C2A833A9F3D949547B1CF0C9C326DB3B032C39B43A2E6930
                2252D29E58FC1B115678143C0D3EC897283FEAE5A882EF9304911CE7067759B0
                7A0BA19408206A93110613D65DDB8A298767E3AEF80C39BC326162E9C1448809
                88E60C9F61802D461F45073D7DEA141AD5AD83C4499260E5DA35F0F1F5C3DEDD
                BBD1AF775FABF7CF16540B6E5F8BA26BC4529FE6915AD9B1437B746AD71E75EB
                D6C3AF3DBB71696AC4A0C1F867E51A6CDCB60D099326E637B24270329EDC7F88
                6A952BC3AC9331B0FF40B46DD61C4D9A37439F8103899D94B344B28C0AC948E7
                D4BFF37AC57001A8C4CD3331F47A759F982477E7E64DD4AC5019A952A7C288B1
                7F3056E4DFCBB24DB2E3BF339B61714C3082629B962C5D82E9D3A663EBF66DC8
                4A041E1D4F9F3E41FB36ED70FEC2794CF8EB6FB46DD512C58B95C07846723A5B
                210646AC66A309972E5E44C68C99E06230A8DB1D4B7E35ACADC4C96DDDAB921C
                84CF27D17F05889F24C7D53AE66C7880C6EB7EC53DF93E7FBA5BAB54F09E7FEA
                293E27C9093091E46014999797888D9EFC3A930CA349425297A4A892A138AA67
                2D8D846EC9E02978402FB1E29C061E0727A89209D3865E2114275E9DC3C44333
                71E6DE5908EE2E88D49BA18B90D0AD601B34CC58131E82CB6798DF369263E959
                95CA95E3369FECD97360F9EAD5F07077C349921C66CF9CA3846FB0BE4A92F597
                4C8A6224D7A2450BA4CF949193030B1E4E422ADCA499D311111989260D1A43A4
                3158BC6A1560B0499FEC5843FB0DC0DCD9B33174CC08644A9F11352A5541E366
                4DD0572539768E958B97A25F9F5EC43DEF21B9685FEB98679754C525AB57224B
                EE9CEAE330E688998D462C9C3D97071E2F5FB512858A148160D0DB8647B9ACD6
                8C05A895A29977F48722859127CFF7983B7F9EB3698169D3A76220F5B17BF76E
                A85AB51A2A942E8592254A632CA9AB8ED700183F6E1CCFF75D306F1E0A152CC4
                FB2FD857C3A1FFEAD7AA8DB321A7B06DDF5E8DE4E20B2449469460C4DF67E760
                72C87C486E666B1028C3FF1EC981488E884EA787DEAC83214244A07F5AD4C850
                14E5D3FF84C4626288923B37164B224BE632F2AA73AC04934CBF09152271FDCD
                5D8C3D361D7B1FED074BDB344BAE60796A92608644526CA03E1D46151F80ECDE
                0176495F716EBCF2AF64C288A1433079D264EE50C8962D084B962D8387A7178F
                75735A4D49CD68523473C56CCFF288BB75E8C41D154B895CA2483A295FA62C1A
                D4A98FDF7AF5507577DB8D79EEE4696CF8E71F74E8F22B2E9FBF809A55AAA251
                E3C6E83D6880525894F63BB2EF20962D5A644D6191A5D82539FBD160F1792CDC
                A463D7DF9032205D34828BE6082232FEA55429FEBE69FB0EB813B973F53C9690
                8C0852DF870F1F86193366621B49A859B266719A6273FDFA758C193386171078
                F6E4092A942C8352254B62EC944931F667E97435AA5743A102053195A4430F4F
                4FDBA80B8295E4CEA92497584BD08F1F30918670DFFC002DD6FF868BA63B74AD
                554FD807D81E648B3712B0E6B0DA7EF661F5E2621C13B66C2CC1FE5B5585535C
                FF22DCCC1EA48A6647BD6C346993E586175C95F004DA2E9A19C1911AC62B8D44
                92B26A42146DBB1C71076BCE6DC2EA8B1BF042F75251578828892DD5A9AEE364
                A70BD5A163C1066813D81806BB64A7B895C754DABEE5DFCD68D1AC298A152BC6
                AB64301BDC6252C5DCDCDCADB17C96078AD52CA7921C232251F54D0A661356CC
                5F88A103079104B50ACF98B79424BBD973E6E2A7A245AD6AA37A515447A844C7
                9070E644086A55AE8646C18CE4062AC716D5B838D67B66C312DE7DBD04BB6E49
                D41696DC6F1386622739F68353212750A94C3952D7EBA3F7D0417023A2432C24
                B794C6A6CBEFBFA34D9BB6E8D9AB17578BC558C23798CACEB6DFBB73171589E4
                4A12C9FD3175620CA9D2688C42A70E1DB069C346FCF1C71FA85AADBA12DCAB16
                0360FDD6482E1E929C999EDA8BEE6CC0B0831311A60BA54BAA18A13FA4628385
                907854B860339A5B822CED0B337E287830B2A09019534779BC9BA8A42CB16298
                7E7A5F144F5D04D5D3964340A2B4F073F1267A5322D723588925FABD1B1DC42C
                2869F9CCF2F63CEA0D56DD2372BBB411F75F3D2445359CA441B3CA3FF45B9DAA
                52AAF15302FD38BF5F4E4C2BFD077C05BA11892465D53E17D7295FA57265DCB8
                7E0D2B57AEC480FE7DF1FCF9732C5FB98AD4550F3CBCFF00FD7AF444E8AB377C
                2C2D659798B73BC264C4D0D1A3B8438141A4EFCE9F3C85AA15ABA04FFFFE78F8
                F811162F5A8C3524ADA549F39D03C9C96AA09BA08EFFE963C751B37255340C0E
                E6929C22ED2A71745C92E4CE059B81DD5965136BF6820C9BA344273AD9332624
                9266870D1C8C99D3A7F394B4E0264DE0EAE61663BF13C78FA355AB963CC56BFD
                FAF5BCE61E54EF73AC73915E776FDFB64A727F3049CE0976EFDA450F8506F83E
                771E2C2249DAE0E2C28380A13EA435928B8724172A85A1DDB641D8F3E4306030
                1139981D2AD246F3FA5B6199581EB227D2264D8F872F1FE165F80B65FD06163C
                1CE78A24164F971AA7C5E433BA13537B2643C9D43FA364BA6248EF951A7E24BB
                89F6715BA2C40AA37347040BED33F2BF25ECBA7F04CB48723BF6F80822C4501E
                B2C088C4AC1AA32D37B465D91B49B587A590936162D93F90D327808E68E21588
                E39AC1C8C689A56931EF61A952C5D1B0417D3C7FF102CB5710C9912477F7D61D
                D4A85499DA2DF3AC05CB0DFDEACD6BEC3BB01FABD7AF43C12285D58349087DF3
                0695CB5554EC7526133266CA8469336628A123763AA51AB20B8B0FE9CCD1E3A8
                41EA6AC3262AC9094A227CD8EBB7F863D4685EC2C9F260128577F4D55AA54640
                40FA00D4A6FED8C8EA5D2344A4FD360C8D1A36C0E9D367D07F407FD4AC5387C7
                9F5970EECC595E868AE5B24E9C3205D9789514215689CF32BE0C776EDEB291DC
                D498246796CC882229BA5ECD5A387EF418E62C988F9F4B14E3CE1D9EFA46C769
                A0915CFC23B987F213549ADF0A4F5D1E41D69978E2134F87B20692C64E728C10
                EA64AA860EB99AE159D8138CDD3B1D079E9F8249170E9D8145C32B41C41FEB75
                D7F33A9D4C92F340F6C499512EE0479448FD0312BB2454962054C9CF0A1E79A0
                D09689D74D31E3D2AB3B58786A15F6DC3F84507328CC7A23DF6AE99724D85463
                E5100A1958C8DB106540D7821DD1244375D80A1959B25B3F0E96635AC2CC1AD4
                ADC72B7F28929C1B1EDCB9872AE5CA234B60164C9B3F571D7752EF4E9F4299D2
                A5B17EF306142858807B1CF9AD4E64387EEC38AE72B910B9FC3D71127E295BD6
                26E9A8E296A52C6874926B4024C7E2E4643509FEC593A7C893231712F8F9C1C7
                C70792C964EDA7D36715EB07493F0FEEDDC78F3FFF8409D3A6C243AD1EF23E92
                23A6C1A3C74FD0ADCBEF387AE4087AF7EA8D5A8CE848A2DABC6913468F1C81F0
                8808FCFDF704E4CD9BD7AA4A5ADF1DE058E1F9E6F5EB8ABA5AAA24FE742039C5
                E2A978AE256CFC67033AB46B8FC23F14C65C223ABDDEA0AC3DA2915CFC24B963
                AFCFA2DEAACE307BBEE124C02416D9AECAEFBB488E05610607D541B7ECAD4865
                D4E156E433CC3AB5029B6E6FC22BD32B259E5590A379B0E0705C7BA2616A137B
                B94B6E084A9009BF0416C50F29F321892E117DE7C143440407C2B11C0C7C411D
                6679BB17F914FF5CDE894D6736E20E1178840B119B1A0766B63332E31D24C7DB
                6992512D7D450CCBDF0DEEB0841AC48DE41CC68D1E0C8D48F279F6FC1997E43C
                19C91159542D5F814B64F3972FB5EEC70CE5C58A16C30622B9DC7972E30EA963
                993266E2047FE27808EAD6AE8D84891263CBF6EDF0F4F6B64B565746FA5D2467
                555769DF974F9FE2FB1CB951B76E5DB468D58A244211B14D7425154B59E3B656
                D56A08CC1684293367584B24BD9FE414B3C0B933A7B9B795D9D19AB5688114C9
                9263C488E13CB17F02A99AC58B97887662BC83E414DCB87ED56A93FB73CA24BB
                647A65A6594C2C4F1F3DE1213BC54A16430D167BC78EC452D7686BC35A7589E4
                9410128DE4E209165D598A018726C2EC1AA194C014744AE882AAAEBCAFCB990D
                E930B6D42064F2F88E6586E2851C81230F0F11D92DC3B15767201848C632A9F1
                76AC2410B3AFB1805C9246F4CC2CC6F21F4503CC4611898584281D50183FA6CD
                8F5C49B2C24FF420F23470BB992AC3A8F35C2D76C7626B492D350B12DE9AC3F1
                CFADBD587A6E356E3FBB02A3AB1946BD3271053573D2A110061CCBCDF1B050BB
                F9CC6C9585FC736366C9E1F0127CA058F0E340726A54BE8DD14DA4AE35C4F367
                CFB178D97278797AE2FAD56BA8442457B848114C9F3B5B393F49C121278EA144
                B162983B6F2EB66CDD82DB4472F3E62E2062F4C0D83163309D54D404891262F2
                94A9C857A040B4A6C9D6820B56923B761CD5AB44B3C931498E482E3F915CB366
                CDD0BD5F1FBB983758D3AF1CD349951CD70224FD65CC128869B3665A25399B2D
                D759F910A59E9F2544E4DCD9B3E8DFB70FF53304069A7759B307A1CFC001C84D
                129C28D8550870C866B123D268A7B8C125B95231494E0DAC96AD89AA02C2C3C2
                942A308264D50AD8561627779691DC1E22B9E449BF99124B16C44B92EB1F3202
                8BCFAF2775CEA4AE3AAF4A701FE834D087EBD0257F6B046726B54E30F06C51B3
                1481CB6177B0E0E26A6CB8B20DAF746F391131E704A31D9DD94521189206D87A
                0B99FCB2E28754855036FDCF48E3991A065947DF3B2F596D0B6D61EA8719A124
                BDED787C126BCFACC581072188728B247597545346D6F69E4AEB3A1596BFA37B
                711D498EAD119151970673CB8C444AB7548A741B970196AD6703A7526A5B70E3
                464472CFB064058B9373C7DEBD7BD1A461309A346F8A3EFDFAF15D9994BC7BF7
                4ED4AE510DE9D2A5C31322A2DE7DFA1011B5C4BF1B37E2B7CE9D912B37497777
                EF225D4000C64FF81B09122688716AA724C7243996F1604F72D973A345F3E6E8
                DAAF17AF340C38F124DB979A22B22A983337D213C94D65921C0BC770C808109D
                FCD816141D1519858307F6A37FFFFEB871ED3A0C3A3D0F1369D1BA354A9629ED
                18DEE170980F24395257AD6D91A3A5E8596C8A4EE644A33AF570964877CB9EDD
                4472C934928B0F6876A83BF6DE3C48F3C008A3685F9648C1FBBA2CD35D92D72D
                2BC696E98F94AE2914232E946C82FBE6C7D8796B17261C5F8C87F24B9AF71170
                651916920BDC056FA4312445F1EFF2E1A7C06248EF1900E627D5C9A27A53CAB1
                0B4DB42D428EC21DD373CCBFF80FD69DDA8817BA47DC0EA8780545C0EEE9CCC0
                42286427374D6C24075187A4518930B3EC1804FAA6E7F2609C94D5E8246736A1
                49E3C678F6EC2996AE5C051717178C1E351A7366CDC1B8BFFE42D9F26595CC07
                5257599CD864222F1F1F6FFCFEFBEFA85FBF3ECE5DB884BEBD7A2322229CF6FF
                9BE77C8E193D1A9D7EED8CF6EDDBF33A6BF6318EEF22396693635EE857447205
                88E49A356D8A6EFDFB72FB98757CEC07D1FE4B92340B10C965CA961593674E57
                480ECE498EF54529EC69E285432F5EB88815CB9671CF298B19AC5AAD1A92254D
                C2CB3FB1FD6AD6AC89068D1A2175DAEFF8F8D85F77A89E7B8789AA7E6D4F7263
                89E4C4580937FA05B2A5B2319BDC99E321D8B67FAF561938BEA0C2BE76B8F080
                D44AA824273B4E89F775D92499E01A61C0AF05DAA165E6BA709105F5C1C9D276
                A2E8A8261C7D7319530F2DC3B59797E1628E4446FFCCF8256B59644F1E845486
                6470818E1B7D9954C157538DCD0EC892B149FA7B10F900FF3ED889C5A736E186
                FC8CCE14C5CBF830C6D2CB4A2604DF5FB04D616704C7101BC9B100DD04C60498
                586634BE4F18C89FE84A16EF47C2AAAEAAB9969CE48289E49E61F1F2E5387BFA
                343A76EA88A02C41983069123CBD9572DECC26B775CB6674EFD61D93264DE0EB
                399C3B7306BFFEFA3B5E3C7F8E7EFDFAA36A8DEA781B1A864EEDDB91D4B71B5D
                BA7747CB962DF812829653DB931C0B21B13A1EEC48EE3523B96C24C9D16F3BF7
                E8C6CB0B5992D9ADE363774D2C1270A13CDF2323495F5366CD80979757B48EDB
                6611CBF478FAE409F61DDC87D52B56E2F0E123F0A6FDCBFEF20B9A356F8180F4
                E9F9F5BB75F306A64E9E82ADEB37F118C6223FFF884624F5060565E3A1369642
                9AB61C5AC7337E3CC9C90EEF111111285BAA34DEBE78858D3BB6237192C471B9
                E25F35E225C995DAD61C57887C4433118565C10FBBEDEF95E4B8AD4B4436B740
                CC29F70712097E3CB44359C5CBACA8AF8299571A7E12F58406D184A42E89E121
                781269E8ED4A6E5BA61AF7EF723781897FA7E3FB98E9778F8DCF70ECE1392C3A
                B10AA7424310696031747A6EB3B33C8BD9EDCD2D71D14410554B8A01FB806307
                498E18D73FC20FE37E1981C289B3F371F974B7031B12231A376C8C274F1EE3EF
                8913D1A953273C7FFE8297F22E5CA810B787593DC04488F7EFDD43CA54A97865
                E0DF485A7BFCE021DAB5EF80E644480683815F9F2B97AFA06D9BD6B87AFD1A06
                0D1A44C4101CBD731C278F9F40D54A95114C24D76FE0406B2CDC8BA7CFF07DF6
                1CC81614841CB973D925AD2B0F1C4B91007E48EE7F11F8EA616B56ADE2E43B79
                F64C2B392B8501488ABF738FAF6771ECE8312E6D869C0EC18B572F1190362D2A
                54AC844A152B227360A0529F8D398ED44AC1EC5975F2E871CC5F308FFFEEC593
                67C84E6DAA5C8515C32C80741932C0C343951A454787D68DAB57519148AA54A9
                32447213AD75F5A2CF585BB96189574B3E72F8305FEB76DDFA75BCB6DF2FA5CB
                E0AF0913E0EEE3EDE034FB16102F49AEEC96E6B8F0FA320429CAC1AB6AC18774
                99D192B7D103237EEC8A52297FE6CBFDD9FFF6A32A37C8CA1159BC9D993FDF45
                1EEF763EEC3AE61C5C8283B78FE3ADEB5B44EA2254CFAD6ABBB33A4E758AAD45
                90559B8B5DD09815CEE544FB660A74672788F027921B4624974329C0894F2739
                89488E49722C1878E1E2255C45CB903E03EAD5AFC753EC445DF46BA034FCEFF1
                E3316AD448F4ECD1134D9B3787AB8BBA1602AF0C1C8523C78EA229A99BAC7AED
                CE5DBB6294E966D78205D9D6205530B851636E0BB31C9E95622A92BF00572B4D
                514AB4A1BDA756B21F1735F15FA7D77155335FFE7C4A08898F9775749814DABF
                773FCC9E3D9BE7ADEA4832CC189809D5482DAD5DBB16AFD3A69483829D53C126
                6BF3EA3024B1DFBA7E03F366CDC63F1BD773CFB297B7378AFCF803C6935A9F20
                41C218DE56B610762522B8A2454B709B9C2838BFCE569B1C3D84F7EED94B845B
                81F785657C30FBE74492A8BFCF97578DCDD324B9AF1E9576B6C1E9A767A973AC
                B49218A338E1FBBA6CA9B02AC806FC94283F4616EB822462229E62152792E327
                3571D12B8AD55E333FC49AF31BB1F2C2263C36BF24B289E439E85182594D52B0
                2CBAACB687FD2D280B624B9692DEEC5FC9760B7D10C991749828DC1F7F951D89
                FC89B3C6391038C65924337AF5EC8567A4228E25827323358C4933D694384170
                4A724F9E3CC5D123875186543CD1EA1C52FBC302594D269C3E739A27B517295C
                9888256605950B172FA07DBBF6A84164D3BA751B850865255795E58A5A16ADB1
                0E53AC9D50A53C220546766C7D87E886FD4B172EF16501F3E4CE839F8BFE8CB4
                01DFF17834D9924D63BD1CCE49CE7A1EFA688C88C2C993213874E810A28834DB
                B66D4BE3E61E83C899F7B97DF396F8A1C84FE8D2BF772C79C7369D81E10149C6
                1B37AC83ABC115C9922747911F7EE0454961195B594BD0FFEAD1E07877ECB979
                80D492287AE9EC6AF62B783FC9A9AB93925EE313E9853FCAF445B1440559C8AE
                E50840AC93CDF9EC89944211264660C5E52D987A78319EEB5FD20D25F3B50598
                6C67D2296AB21A9BEFD81ED8939CDDF71F4972AC79294D4931A5EC5864F14B07
                F133911C2311C9AC5479614676C7D8B677FF8E4B503AC70058FB1F7382628528
                C598053F65D952C34DE2E4C449358E8BB2443FB313778E122D22496A110FC16A
                4E83B37DD5A3C62039286BFB5A1F96968812CBF668ED676137225B8FD5E0625D
                802666DB1D1D0DF67D8A21B7BDC3931B5F112F49AE67C81F987B650958B97F1D
                4B64141CD735786F97654BAEA304BDD980F2A98A6150912EF084975ADEC8795A
                BB6C570A5B508FC3EC6E2FE938BB1F1EC4ECA37371FED56544B18ADC34715DD5
                FAFC2CB4837B4A059BC7D21182751B971A9C46EE3B9FB10E2124D4EF00210DE6
                96FF0BA9DC933ABF093E12D640634BB101D5D1F3A107B5ACBFE0DCBAA8549411
                84D825670BD1896AC50D4BEA9E848FC7FB9A2CA8B6392E1D5A52CBDED73F27C7
                56823CD4B6AA8BD058072DB667A71A19E96C1CE458088E418D5D8F26956A92DC
                578F795756A0D7D161D0BBD0F491743C74C2C11CFFC15D5666472A24C5C8E2BD
                902F612E92E50C1063213965E25B9EABA49AC244A4760573CFADC3AEBB07F142
                7A467C2B726940106C45243F64BED924387A9ACB1F6E38B6BF29980A97CF2727
                A6941A89043A1F7535DACF4372D1CFF521238BB8AAFEEF3B701C48EE7D790D9F
                1396F9F1B9573EB5575A1DFAF3110F9DF888784972475F9F429D7F5A417681F2
                BCFD489B5C74E822F5A8125006430B772052F0523D927644C3CB8C009612DA66
                DA7421F40AD65FDA8E8D3777E3B6F92EA9BE925246447D2AF3B501C4D853CC2C
                87B57EB69BB1A2FC61335631C1D8F6D5450135022A6240C1DFE1C63CC47C7474
                9F3CFF6DD2D847FC466D5F5C7EFB4107D6A04145BC24B967788E72CB1BE09931
                940887E9AC46D5A6A5E0A3BB4CEAA47F941F16541C89CCDE99D5009068246796
                797AD71DE343ECBCBA176BAFACE5B5DEC20C4A6D30415D39CC12A7A59690734A
                72F6B5D79CE1435753B4909C6577CF083DBA17EE88BA015589AC19C59958153B
                68ACA0213E235E925CA81C860EBB7B61DFBD33883498218A4A749A051FDB6596
                1AE66274458B6C75F16BF660D50161B38FB1E385CAA138F2EC1C969DDE80830F
                8E22C2F01626C1C463E22C2B2B49AA5DCD4A3E16FB6FB4E6BCAF751FAAAC7249
                49500448D68294E68498547A14827C02A117CDAADAED82B8925CF4717494C8EC
                425DDEE11194ED568E8AAB4427C37EE535C1E17B7B8FE7FF2A95CBB26579435B
                5B6DF85F6DF5D783784972AC3EC7CADBFFA0DFA129782B3CE72B59C5CD26A780
                C5B599450332BAA4C5CCD243914AE70F839EE553C8F432E376E81DCC3E3E17DB
                EE1CC50B964AC6844735AECD2AA9450FE445EC929A2DC1FE5320DB48CE407416
                694451FFFC98527C343C44777E1F7D6A48E883FB0F78B845820409D4FA698EA6
                6F16FAF1F6F51B5E55C4D55559FF5491A8959EB15CD6274F9EF04AC27E7E7E71
                233956478F8EC36AB53D7EFC98C7EA458687C3DBC79B9F9745F8B3F835E661BF
                7FE70EEED02B5B8E1CD1B219BE0491C8569B240B7579FBE60D42DFBEE5D92F6C
                A5304F2F6A7FE24410759F6931F06F18F192E45864C543E9195AFEDB03675E9E
                85607094123EB6CB66BE308E007793379A045547A32CE5E06770C7DDF0675875
                6E33365DD886C7F20B48AE4A72380F3310ED93E52D0537ED5DFDEAD271EFB8BF
                3E542D8D0D3CDE8FDA6116257884BAA047E1F6A81F509D2FD6623D475CC79895
                576AD488973C5FBE6C9952E145B49625E1C1B343870CC3860D1B307ACC18142A
                5488C8C6604772124E859C42DBB66DD0BA6D3B5E1249CFB77FD8F965359BE009
                111BCB19DDB1751BAE5EB9428411C1971A747171859FBF1F8FC1EBF8DBAFF0F0
                F5C6900103B178E1422C5BBB16D9B267832DABF93393DC07D905953A70ACBC53
                F7DF7EC3C1030778DB196133993371E224C8932F1F1A04072388485913E8E28E
                7849724C888A22756CCA8505187F7206CC7AB343A50FF5C30743540A3691FAE9
                015FD90339FDB320B3DF77087914828BCFAE204A2F235C0F1EF3C6B8CC2CC216
                DC1A0BC9596EAE7749749F4E723A6A872251E670CB8A213F7547169F0C9F6121
                1B053D7AF4C0B2258B71FCE851F82752A3F5D534A6972F9FA371A360848484A0
                77EF3E68D5B6AD9A8BAE9601A2FDA64E9C8C5163C760C9B2A5F83E4F5E356549
                B0177D9DDEDC1682BB74E922468F1E89BDBBF72065F2542859A2048FEE67F183
                6F4343B16FCF1EE4C8950BED3B7782CEDD05837AF5C592858BB06AE37A0465CB
                064B249920C4AE4E479F09CEC0089FAD71F1F6CD6B24F0F757C9FC7D611A320F
                A2666B51942B5D0A6124C595AF50814B98AF49FA3D7FEE028E1C3D824C815931
                FACFB108648BDE688813E227C991BE2AE964DC8ABC8F469B3BE1AEF13E0FEF60
                D540CCA2624B13A50FBFD1593A160B0C9665035C2599571C11659352729C4B4A
                32B7DB19CCCA3123F44A68864EB2A7327EA46847169CDE4A167C7286A1CC12F0
                A9AFE140A7C21DD0246355B8C3EDF3643950DFB76FDB863A356B61C1C205F8A5
                7C795855301AA353A74EA25E9DBA5CD2FBB96851CC983993973B62E5A9D88AF0
                2C87B5498346B873FF1E56AC590D7FFF04D6EC247BD2110421860796FD7DEDDA
                55F4EAD503D7AF5F43BB76ED51BD7A0D787A7AF1A0608B94C40294D93562EB2A
                98E87C037BF5C6D2858B1592CB99435D2742B49E43B6041DABD78A1DC35AD9C8
                2E88D6E6B5B63D30972C594292EB604C9B360D850A16B1D58C8B75B06D2457A1
                4C69F890BA3E79DA14F8D238B0DCD2C8C828AC59BD0A7DBAF7469EBCDF63E98A
                156AD5634B1B6CE71663649308EFF45AC7396BE72B45BC24394B149B11E19870
                6609269F9D853057235FAF54919CD81A0B1F774CC588ADB3AEFCE5B84D81E30A
                55D217D730D8F90DD4E76C2E5931BCDC5004B826F92C4B4BF33E12013C7EF410
                7972E642CB962DD1BB6F1FE85CF49CE098243567F62CFCF9C75864CC9011D76F
                DEC2E62D5B90244532257ECD64C6B58B9750BD6A1554AA590D03060D5192DAD9
                26A389364B5CB261695CDE8CB8F43ABB8832194663243A76E8809D3B7760C8D0
                61A84604275AC384A23F1A94EB6524B570708FDE58B46021566F5A8FACD9B313
                914420222C922FFCC2AB004BB255EDE6451ACCCA9AA926B311A16FC3B82AC988
                9A1505656428AA1227F39ECF9E3183E7CECE5F301FC54A94E4642FE8ECAA8B38
                F1A1339263A5D3CB952C09DF04FE98326B26919DBF353438222C0C1D5BB4C696
                6D5B71FCF419244C9298CFC3C88808DE7616DCEDEBE3CB6D8E363296F99A0FAC
                1F2EDC0E1AE3B4347E4A8AA1C1C5102357363E225E929CC52622CB11B84DD25C
                D3CD7D7141BA0DBD6CE4762A161D26C6A5DBBCDE92F4EEED16087189B9FFBC60
                135DFF5644DF1F3AA14E862A3C264EFF19A997DDA4C5494AF3F4F0C0C2C58BE1
                E3EFC333141889B56FD3869709AA5FB72E7AF5ED87E56BD6A060A1820AE5907A
                B774F67C74EFD60513A64F41C5AA55596B39C16DDFBA151BD7AEC7AD5BB7E1E7
                E38382850B23B87933B8D339D4D4065CBE72111549B5CB9D271766CD9A0B0FB6
                CDDAAD77905CCFDE584C24B774ED2A3C79F0081BFF598F9BB76EF1029D95A90D
                C5486DB4A481707B19B5F3FAF5ABD8BE7D3BF6ECDD83E7CF5E2059B2E43C29BF
                4C99322421EAF1F66D28562C5F8E43070F62F3E6CD68D4B011D2D3F11801B1B5
                223266CE0C4B2E6EB4D1B3925C792245DF84FEBCF289AFAFBF6D17B38C617DFA
                61EA8CE9D87DE81052A54E85037BF762CB864DB87AE53222E9F75982B2F252EB
                E93366E4D7FBD5CB17F86BFC786ED36BD9BA758C343046904B972CC3AB57AF78
                E5166F6F1F75B27CC999FADF22FE921CFF87D5FA3062E19DED18B37F0A5EEA9E
                42E62B543115C51C87E38AFF13E4F5A1D01B4514F72F8061257A2381C15B0922
                8E96E2F629939BDDA403FAF5C3ECE933B061F32664CB9D834B5C0F6FDF43E50A
                E550AA74693469DA0CA54A954697AE5DD1B67347857288705A3708C6A1C307B1
                7EC716A44A9396D4DA3074EFDA052B962D47E68C99792DBAFB77EEE3D889E3DC
                AEB674F50A78B97B72296BCA94891834680026FC3D0155AAD5E0554E6C24E29C
                E4D802441692CB913F2F8E1F398A2C99322379F2143879EA141E3E7E8CDFE8FC
                BFD24B5425B9A888706A7B49DCBF7F1F050B1684879B275FF8F9D2A54BE84092
                24AB7577FDDA35346AD010A1A16FF1F2D9732449928427C3336B48FF7EFD51EA
                975F9440A318F9BCAC8828498A44A4E58B47273941318590CAFA5BEB7658B771
                034E9C3B8357AF5FA150BEFC08CC9009818181784DD2EEE9736749823660198D
                5B6060666E1E68D8B02127DDC3448C29D3A4516DA58A2D60FFFEFD6812DC8417
                F51C3162845DBBE26FAA57FC24395E6B5B66DA25CC824C4A6B38A69C9A8919A7
                1791DA6A50F2F9D83285F63696F804D57E14A84B821165FA23BB570E9EDFA010
                FF675358F9BFDBFEFD17756AD7C6D83FC7A24170232623E3E08E9DBC44D28429
                9351A0C80FA851A50ABC486258B1760D0F418E78FD16F982B2A340C17C98327F
                2EAF943BE1EFBFF84A5D83860C419D3AF578688A29CA8C4D9B36A10D4985EDDA
                B5419F3E7DF9CDDAB9437BECDEB9130B487ACC9A23876263B5AA85EF26B9B9B3
                66C323A11F2652DB8A162DC625AE470F1FA10D493DAC2AC8FE0307B8C4C46036
                1971F9D24524489418891226E45A405868283A77EAC40B7AAE5EF70FB265CF09
                99D4D839A46AB24A2C8BA84DC548BAE5AB6F900A6E5D3C5A8E85E44892AB4892
                9C7734498E85929C2315B55ED5EA7C619D95742EA63A9F397B1A99889C5D0C4A
                59AA63478FF2E5107F21C972CC98B15CD25DBD7A353AB46B8BBED4DF361D3BD8
                963EA4737527625EBA6C19962C59CA89DB8A381636F81A104F494E01D75A6525
                71FE89740FDDF78FC3CEC72134CFA2E8096AE46121F8EC19845FB2C36A8E2EBD
                7BC85EF8AB4C5FFCEC975B095EB6461C8B0E799D9FEADC784A1250BE3C7950A6
                5C598CFF7B1C0C3A03460E188CD56B5763F586F5489A2C0991533F6C58F30FD6
                93B4973A201DF6EFD885AA152B62D81FA3D1B46533BE466BFD3A757858C7C489
                93F9D2802C3E8CC5D131F262C5255915DEFDFB0F70237B93FAF571E5F265CC5F
                BC0801A40EF2EA45B1168274243926750E18390CC12D9ADB8D1B3869D6AE5913
                93A64D45A56A556010F5AAB358E2923F2F774EE7304646E25FEA47EBB66D316A
                D428D46DD0803B51E6CF998B7EBDFA60F6FC79284E92AB35F838BA9AEA84E42A
                952C059D9B2BFA0E1D021F5F5FBC7CF912870E1DC6E4C993B8FD6F1E1D3B90D4
                52C5A1002536904890C526B25A794D821BF318C179F3E72369F2647CFDDB3A35
                6A22F4D56BECD9B79F1F9BA9DFCF1E3FE1D275FA0C19F9BE6C2D8EF84C6ED621
                8FCF2467F3089879D8EE85D0EBE8B07930AE18EFB17AE27CE57608926AC28B0F
                179B1568D7C135CC800E059BA249E61AF0965C943C59D5482EAB3554A2E722C4
                B5F7ECE6295DA204C248DD5CB77E035C88089A356C042F5F6F4C9C31951BF557
                AE5C83DFDB77C0DF9326A2528DEA18396808264D9C84F55B372188886DC7D6ED
                E844D219BB31CB5528CFA35018C931EF28BB36B3664EC7B61DDB70E2E429F8FA
                7823B87E435CBD7419F396A8248768B9C40E7024B925A4AE2E5CB50CB90BE4B7
                ABF10622DA5B44D6B9D1BD4F2FB4FFAD33F4A252E15936CBA4B646E0DA8D1BB8
                74E102EEDFBB8F1BA4A22E5FB5123D7BF6446B929858E183F9B3E7A05F6F2251
                228F9F4B96B4925C8C79E584E42A902477E9EA15081EAED0BBB872DB2453CBF3
                D0C3E3B7DF7E47BEEFF3D94A4811D9BE26123C7FEE3CAE5DBDCA0971FDBA755C
                755DB27C299742D9AA6C53FE9E8821030660FDA6CDC85BA82077486C21726ED6
                B419FAF61FC09D45825DF9AAF89CF21BBF498EC1BA1E014D7444E2F8AB0B18B4
                63122E85DF45A410463753941AC7F6F59784D613C119CC0634CC521DEDB33783
                370F17B156DE7C67758EB8F69E493AC3860CC5F4E9D3B076CD5A44913AD7B155
                1B346BD70ACD480564610F37AEDFC02FC58BA352A5CA18F9D79F28F563515E49
                77CE8279BC32EEE449133072E830B8EA0DBC92ADA0AE796021880863048C6623
                8E9E0841D2A449F06BBB0ED8BF732F662D9C8F6CB973AB65B162BB451D496ED1
                BC0558FDEF065273B3DBAD7C053CBE7F1FF9E858ED3A7740D7DEBD14BB2DFDF4
                D8E1A3DCF67722E404494E02573F99D7F5C9B3A7E8DAB53B3A74EECC2BFE7292
                EBD55B91E44A9701AFF00521E642D64E48AE32A99A51748CFACD1AD385D0738F
                E977DF7D87B4E9D2C1DBC747F1D482390D2231851E0E2B57ACC0E3870FE14D63
                C79C2E4F9F3E857F820458B06821D2A60FE0476725E57F2C5008BFFC52167F4D
                9DC2EDA76D5BB5C2A953A7317BDE7C64CE1A08FBD24ECEEBEAC40FC47F926350
                13E299DA1A4E6AEAE5F05BE8B37934CE45DE20CD2E8CA760C976B9A4EAD07CE9
                567F14985381A63CAA65F8059D73B58427FDC7543B6B40F17F44720CBB76EC44
                93468DD1A76F5F3C7F701FCB162DC6ACA58B913D670E3EA6A1447C6CD1E657CF
                5F60D1AA1528903B0F060E1E8C16AD5B716962F2C4BF3166E4688C1C310259B3
                0511699094CDAA00ABB15E66223857373764C8949926AC84E993A762E4906118
                327C04EA366EACD4DA8BBECCA3F5933392DB88A09CD96D3BDB915CFB5F3BA15B
                AF5EDC5677FED45934AC571F89122546CB36AD903FDFF77CC1EB23870EA2759B
                36E8D6AD07DA77EAC4D5D579B3E7A27FEF3E98336F2E8A952AA32E42FE812447
                EAAD57027F4C98390DFE7E09B96A6CA9AC2C5952036920870C1C88993367A07C
                B9F2681A1C8CEFD2A7E72960BF511B2E5EBC88C5CB9612C9A557E2E08834DBB6
                68C53DC3FBF6EF4724B5B11449DCAD88E8DA77EACC572F13048DE4E205EC836D
                D94564933712E138FEF824C61D9989D36F2ED05337923F41CDEAD283BC2CE67B
                E287FE17864DA966C26E14119E264F34CF550FF5B354813F7CAC41B1D1173E71
                58EDEA934756797FFEF4392A952BC717ADB972E9125EBF798B156B56C19FA435
                467226A3117DBA7727F25B8AE144646C25AFEDBB77237BAE1C7CB4972D5E8CEE
                5DBB62F0A0C1A8DFB8A1D23EBE188C4DD2B29685A4713F76F8089A360E468E9C
                39316DD62C78787B59571B15ED9C496A6D61FE6FEC24A710D1A3FB0F38C97520
                92EBD2AB27BFBE0389B416CC9D8F717F8F479972BF9024C7324874D8B7770F4F
                43EBDE9348AE63671ED0CB24B9017DFA929434173F972A69E767B095D782DD9B
                A34DAE24BC89E426CD9E093F2239CB76C5B4A014E77CF3F2150AE6CD87EF4985
                9D3079327C7D7D95220FCC534DC4C53CC42C73245D86F4D631DBBC7E03821B36
                E225DB5928C9EF5D7FC7FA8D9BE8E193CB36B65FD7B33C4E88F724E7004B9038
                4DF8283102975E5FC2F4D32BF1EFE323A4CA864359599595447A7F8DB5FF8561
                63D21B2B8D9D50F24587426D51296D29BECEAB7DB4BB3335EEF33CB5EDF270E9
                466DDFBA0D5F39EBD19347A851A70E860F1FCE1D087C2FD98CB5CB57A07D8BB6
                08CA9215AFA3C2B1FFE8516BD9F3D3212168D5A20502D20560DA8C19DC202EB8
                E86354E3E0B16B2C8FD86842E78E1DB92DAA4BB76E5C22747173E7E78A79E59C
                90DC1622B91C762427094472F7B94DAEE3AF9D39C931026A50BB0EEE5DBF8939
                8B1790D4944E8939A3F15EBA6409BA74E982AE3DBAA363C74EDC76B8804B727D
                318B49722CDECE610D4C6725C71D1D0FDE09FC62909C8DB8D9AA5DD7508848AE
                4F9F3E68D7A1035F018D81878CD4AF877BF7EE6121B58B2D8508D561C2B2268A
                162E82D4A95223222A12EE1EEE58B46419F46CA1ED4F35C67E45889724E7ACE4
                B47583B5F883CC25B867D26B2CB8F42FA61E9D0F93E75B98E88634092ED0D3BB
                9299F3EED4982FD23F5991D0DC22F5F831792104E7A98F1CFE817093754A79F6
                FF972876BB52EDD49E8573E826EFD59B872B4C9E351DA54A95E276354BAEF0D5
                0B9750AD7C45448547A04ABD5A18F9C7582B89192322306EEC584C9D3499AB81
                751AD447B2E4C9B809C1688CC2DDBB77918E08D05AE984CEC7EC7CBD7AF4C0B1
                63C748AAAA87AAA40E67CC9449090C26B0AA240F1E3DE2D91119987443C71AD4
                B30F16CE9F8F359B3711C96553FBA190DCD3870F1575B55307FCC6494E42D7CE
                BF62EB868D183E7A044A5728C7C7FDFAB5EB3C3CE601A9E56C71EC761D3A7169
                6D13494D9DDBB4434FFA6DC3E64D39098996B52B62253959713CB08C87440930
                8954513F3F7F8751965497CAF3A7CF902F576EE4CF9F1723478E44EA80008487
                86F2FE8C183902499226C582458B903E437A75C4158BE6981123F1D79FE3A027
                C978CC1F6350AD664D7A12183492FBDA61B13BC59056D49EB214539E4C4FF29B
                2498F00651E8B66324B63FDF8548D94424E70A1707928B3944FFDDA8C55287CD
                AEFC120B97F075F541E9A445D0346703A4714DCDBD9A02FE3FED2A768600BA59
                CF9C3C851A152A21659AD498367F2E32308942B4E550BE7AFE124D1B34C4F143
                873169CE2C94AD509E385089216371666FDEBC411B92E6F6ECDD8BBCF9F22230
                6B562E09BE7AFD1A070E1EC4F871E3F0E38F3FC15A838E48E8FEFD87E84E44B3
                6BD72EA44C911AB9487D4D9132058F086421272C503620202D264F99C257C262
                EA274FD0DFB08E7B75054B081191D0B3878F884472A16DC70EF8BD774F1EA6B1
                7BDB0EB46AD2149E7EDE285BA9229786F6909ACD08F00DB5AB7170307A93F4C6
                24D93BB76EA36ECD5ADC0E5ABC4C69244B95022D498D54D2D59C553A51488EC5
                AE552A5D8648CE1F13A74D839FBF73926313AE659366D84CAAF60F457E20553D
                072E5DBC88B3E7CE219C1E122C856BEEBC79C8962D9B4380EFC573E751864834
                79B2E458B5EE1FA448915271B26924F775C339C9D99CE4F655DD6435BD66E99D
                2DE8B67F04045664339ABAA7A8B0D10A447E4482FF7B61B5D9C83CDC8591AFCC
                174B61F9457AFA4AE0F167A4A7C153F44276FFACA892AD0C7E4A9E1FFEF0E55E
                555BE9C9FF67C88A64151E1A86FEA44AA54E9B16CD5BB784BBBB87AD73B2C0ED
                722B962CC596AD5BF0C7F871FC66B6DE8C92927D121E168E15CB976113495A77
                EFDD879988C687A576152A84FAF5EB231D1DDB92A6A448B324E9451AB17FEF3E
                FCFBEF169C397D1A2F5EBCE4E11689932641505010CA962B83EFBFCF4BEAAC2B
                562CA6F36FFE17DD88C4320566B65C49FE7AF1F4297E275595A57755AA5A4535
                DE4B3CCD6CCE9CD93C84C4DBD79BDB1D6BD6AA858913262227916A73226691AE
                0D6BCBC10307316AF83052D99F2249B2647C79C680808058878EC7DED1B987F4
                EF0FD1A047BB4E1D155B9BB55D8E78F9FC05460C1F8EE3C78FF18A274C352D5F
                BE3C12254E84A5CB96A36BD76E3CEBC1EA4C2015FDE6CD9B28426D660E873EFD
                FAF12514AD9104DF00C1F16E7EAB2467EF90602B6A8D0F998589579712BD44C0
                C0CA61AAE94F7C6526C15282D296240EB59AEBA7964372680F3F3CABD86B522B
                6418F8DAAF245A12B97923874706D4C8591A3FA62E081FC10B2E70FDF29524D4
                742165A93EC55BC7882886DD4F56EC44DC904EDBADB5F60441AD8C2B5B3D916C
                4A864746F2CF2E2E4A86067744A80F1F873EABCB32F20A4FF49125A7B336B022
                9DDC9E6539282347B359F94EB45FF7C352274686495212D7F5AA8469DD4EED0E
                8F08E78E07269989A29E7633519B5C6059475569049139497B9151264EAA0683
                C149DD19BBA64BCA328E4AA6A0CC1F6C363F91F3EBCA96288C22159E3D98B923
                84A9C56CB537B3492530DB78B382022C3B8395A25ABA6C293267C9A21C5723B9
                AF1F1F4B7261F45FC78D3DB0E34D08CC224D1EB610B41DC9295E2E4B7561497D
                02AB6579E44FCF65B52FC424D889644C8DF38EF44226AFF4A89DAF067E485510
                49050F1864917B89C12B617C61C7BFE259506D6F829A8B1ECBA28D56139ECC1F
                1C627492B3EEA81C8745F55BD67275B87B2DFB4056494E252AD9164AC2331544
                B5BE9D4ABEB25AEF4FD0D9B74CF9AD42BF4AB14FFBA2A2169596F55192CD5CC5
                D4EBF4B6CED8CA7F58EA4439384C625D41CB1E926C2BCDF40161B90A39B2F131
                5949DFB2BCA1A08642313264B9AB75EBD4E179B6BF925ACF4811F6460D8DE4BE
                5EBC8FE42C7F59BC57F7A507A837BF31EE78BCE47214DB4B67A91BCB639D7410
                4C7A9ECBA82AB8AC8611F4A46248521C12FD9DC0421206A30E2E4603D2FAA742
                B62441A818541A41DEE978B14E9154574955D7749F76BACF87584495F779701D
                B73B7F50BCBBEE99855C541BA63566C38E742CC77690DA9C35D84672D11716B2
                9DFB031821467EEA07929CACF6F59D41CDCE065EB68E53742978F3C60DE8D1A3
                27B266CD82254B97719BA43560F41D0549E323E225C939F7AEC67C425AE869C7
                830368BFB92BC23DA238C5310FA55960EB5919B82DCEEBAD1E3F25C887A2797F
                44625F7FBC79F906671E5EC4D9BB1770E3F52DBC92DEC06830C3CC52C5489D61
                019CA25A0A5CA9F66D59315D5455128546E57001FA28095E8201095CFC902951
                1604A5C888DC298310E8971E3ECCDE46228F5EB4F54A52D7BDFF9F9A9F4E06FC
                7DF248CC47CE279EDB8AE8125FCC40E19810AC0F2FC1EEA71F6D0A8885E49CB5
                2E661F3EA49DCE3B6E59D89B81D5B6EBD5AB27664C9F819F7EFA11B3E7CCE51E
                5B5E00D442F6DAE2D2F11D96479E00A32073EFD5F0131331E3CA425253A2A0A3
                C9A063B166F0801409E4489411ADF237C00F09F3C2433628AA0C1D2292266498
                1089C7D2133C7AF310B79FDFC39D9777F0F8D533BC087D8D27E14F614424CF6B
                E4EA985984878B173CDD3CE1E5E681845E0991DA3715D2782741CA048991D223
                19FC909013AC4E5217A1818510BFA119F9B188355EE8DB0453656FDDBA855327
                4FA252A54A8EAAFE373A46DF28C929E4C616A889108C68B6BE138E469DE40666
                5E31D5E88AC451895039773954C8581CDF79A4809BECCA094E566D2F26554362
                04A65353C68CB20991920951A4C2461043B29A606CD2F15240AC60A5E802BDA0
                8341A7879BCE007741CF4B13715B0AB7A7B0CF6622463B72E3525C7C4DB8F90C
                88CF99E57104ABDEC2A0B79479C2B725B945C73748720C26483C6355C26DE90E
                1A2F6C837BFAD7904557F8CB1E289DA6301AE5AC8D34EE29E02E2A6B2288AACD
                84699F8A2D4FB2D6F3E0990782CDCE27A92AAFA2FAD89C1D8CEE24D590CD684B
                077B4144291BCE0DEEEA7E3A254DFC4B0F96060D5F35BE5992638B3E9B48E2BA
                1C7E094DE67746A4870B8A7CF7036A0495C2F709B3C2437057CB4BDA5BD225FE
                6686C57B2873AA14AD09A1A27D1E80ADFC8FAC04209B61333E5B0217A0BE5BC3
                F00491B78EFDA9FF5FB3BD69D0F015E21B25390D1A347C2BD0484E83060DF11A
                1AC969D0A0215E4323390D1A34C46B6824A7418386780D8DE43468D010AFA191
                9C060D1AE2353492D3A04143BC8646721A346888D760247783DED37EE98668D0
                A041C37F809B8CE456D3872A5FBA251A3468D0F01F602D23B9CEF4E1CF2FDD12
                0D1A3468F80FD084919C1F7D602AABDF976E8D060D1A347C46DC1404219D520D
                489699BABAFA4BB74883060D1A3E239A10C9CDB12D752BCBE3E8ADD3976E9506
                0D1A347C060C24821BC03E38942B23A2635FF6FFD2ADD3A04183864FC07822B8
                CE963F62D46424A20B86427469BF744B3568D0A0E123F0128A8ABAC6FECB580B
                CFAA6457190AD9E5FAD2ADD7A041830627B849AF93F4DA4DAF3944702FA3EFF0
                7F2F8496F510342CE20000000049454E44AE426082}
              Visible = False
              OnClick = imgWechat313Click
              ExplicitLeft = 372
              ExplicitTop = -5
              ExplicitWidth = 105
              ExplicitHeight = 105
            end
          end
        end
      end
      object Panel2: TPanel
        AlignWithMargins = True
        Left = 56
        Top = 143
        Width = 968
        Height = 70
        Margins.Left = 56
        Margins.Top = 0
        Margins.Right = 56
        Margins.Bottom = 0
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object lblPaymentDenominQty: TLabel
          Left = 595
          Top = 0
          Width = 100
          Height = 68
          Align = alLeft
          Alignment = taCenter
          AutoSize = False
          Caption = #47588#49688
          Font.Charset = HANGEUL_CHARSET
          Font.Color = 8550255
          Font.Height = -24
          Font.Name = 'Noto Sans CJK KR Regular'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          WordWrap = True
          ExplicitLeft = 586
          ExplicitTop = 3
        end
        object PaymentListSeparator2: TLabel
          Left = 0
          Top = 68
          Width = 968
          Height = 2
          Align = alBottom
          AutoSize = False
          Color = 5062970
          ParentColor = False
          Transparent = False
          ExplicitTop = 118
        end
        object lblPaymentDenominTitle: TLabel
          Left = 0
          Top = 0
          Width = 595
          Height = 68
          Align = alLeft
          Alignment = taCenter
          AutoSize = False
          Caption = ' '#44428#51333
          Font.Charset = HANGEUL_CHARSET
          Font.Color = 8550255
          Font.Height = -24
          Font.Name = 'Noto Sans CJK KR Regular'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          WordWrap = True
        end
        object lblPaymentDenominAmt: TLabel
          AlignWithMargins = True
          Left = 775
          Top = 0
          Width = 193
          Height = 68
          Margins.Left = 80
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alClient
          Alignment = taCenter
          AutoSize = False
          Caption = #44552#50529
          Font.Charset = HANGEUL_CHARSET
          Font.Color = 8550255
          Font.Height = -24
          Font.Name = 'Noto Sans CJK KR Regular'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          WordWrap = True
          ExplicitLeft = 680
          ExplicitWidth = 200
        end
      end
      object Panel3: TPanel
        AlignWithMargins = True
        Left = 56
        Top = 48
        Width = 968
        Height = 92
        Margins.Left = 56
        Margins.Top = 48
        Margins.Right = 56
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 3
        object PaymentListSeparator1: TLabel
          Left = 0
          Top = 90
          Width = 968
          Height = 2
          Align = alBottom
          AutoSize = False
          Color = 15198183
          ParentColor = False
          Transparent = False
          ExplicitTop = 89
        end
        object lblPaymentTitle: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 782
          Height = 84
          Align = alLeft
          AutoSize = False
          Caption = #54000#53011' '#51221#48372
          Font.Charset = HANGEUL_CHARSET
          Font.Color = 15198183
          Font.Height = -32
          Font.Name = 'Noto Sans CJK KR Medium'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          WordWrap = True
        end
      end
    end
    object cxTabSheet1: TcxTabSheet
      Caption = #53596#54540#47532#53944
      ImageIndex = 4
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object TemplateDenominPanel1: TAdvSmoothPanel
        AlignWithMargins = True
        Left = 56
        Top = 136
        Width = 310
        Height = 240
        Cursor = crDefault
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 24
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
        Caption.GradientType = gtNone
        Caption.LineColor = 12895944
        Fill.Color = 4404005
        Fill.ColorTo = clNone
        Fill.ColorMirror = clNone
        Fill.ColorMirrorTo = clNone
        Fill.GradientType = gtSolid
        Fill.GradientMirrorType = gtNone
        Fill.BorderColor = 7759709
        Fill.Rounding = 15
        Fill.ShadowOffset = 0
        Fill.Glow = gmNone
        Version = '1.7.1.5'
        Visible = False
        TabOrder = 0
        TMSStyle = 0
        object TemplateDenominPriceLabel1: TLabel
          Left = 25
          Top = 165
          Width = 260
          Height = 50
          Alignment = taCenter
          AutoSize = False
          Caption = '954,000 '#50896
          Color = 4404005
          Font.Charset = HANGEUL_CHARSET
          Font.Color = 2631930
          Font.Height = -32
          Font.Name = 'Noto Sans CJK KR Bold'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = False
          Layout = tlCenter
        end
        object TemplateDenominNameContainer1: TPanel
          Left = 25
          Top = 25
          Width = 260
          Height = 130
          Margins.Bottom = 0
          BevelOuter = bvNone
          Color = 4404005
          Font.Charset = HANGEUL_CHARSET
          Font.Color = 2631930
          Font.Height = -27
          Font.Name = 'Noto Sans CJK KR Regular'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          object TemplateDenominSeparator1: TLabel
            Left = 0
            Top = 129
            Width = 260
            Height = 1
            Align = alBottom
            AutoSize = False
            Color = 7759709
            ParentColor = False
            Transparent = False
            ExplicitTop = 124
          end
          object TemplateDenominTitle1: TLabel
            Left = 0
            Top = 0
            Width = 254
            Height = 120
            Align = alClient
            Alignment = taCenter
            Caption = #49457#51064'1+'#54617#49373'1+'#47784#48148#51068' '#50724#46356#50724' '#53216#54256' 1'#51109' 3'#51460#44620#51648
            Font.Charset = HANGEUL_CHARSET
            Font.Color = 2631930
            Font.Height = -27
            Font.Name = 'Noto Sans CJK KR Medium'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
            WordWrap = True
          end
        end
      end
      object TemplateDenominPanel2: TAdvSmoothPanel
        AlignWithMargins = True
        Left = 377
        Top = 136
        Width = 310
        Height = 240
        Cursor = crDefault
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 24
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
        Caption.GradientType = gtNone
        Caption.LineColor = 12895944
        Caption.TextAlignment = taCenter
        Fill.Color = 2694933
        Fill.ColorTo = clNone
        Fill.ColorMirror = clNone
        Fill.ColorMirrorTo = clNone
        Fill.GradientType = gtSolid
        Fill.GradientMirrorType = gtNone
        Fill.BorderColor = 7759709
        Fill.Rounding = 15
        Fill.ShadowOffset = 0
        Fill.Glow = gmNone
        Version = '1.7.1.5'
        Visible = False
        TabOrder = 1
        TMSStyle = 0
        object TemplateDenominPriceLabel2: TLabel
          Left = 25
          Top = 165
          Width = 260
          Height = 50
          Alignment = taCenter
          AutoSize = False
          Caption = '954,000 '#50896
          Color = 2694933
          Font.Charset = HANGEUL_CHARSET
          Font.Color = 5787719
          Font.Height = -32
          Font.Name = 'Noto Sans CJK KR Bold'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = False
          Layout = tlCenter
        end
        object TemplateDenominNameContainer2: TPanel
          Left = 25
          Top = 25
          Width = 260
          Height = 130
          Margins.Bottom = 0
          BevelOuter = bvNone
          Color = 2694933
          Font.Charset = HANGEUL_CHARSET
          Font.Color = 5787719
          Font.Height = -27
          Font.Name = 'Noto Sans CJK KR Regular'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          object TemplateDenominSeparator2: TLabel
            Left = 0
            Top = 129
            Width = 260
            Height = 1
            Align = alBottom
            AutoSize = False
            Color = 7759709
            ParentColor = False
            Transparent = False
            ExplicitTop = 124
          end
          object TemplateDenominTitle2: TLabel
            Left = 0
            Top = 0
            Width = 238
            Height = 80
            Align = alClient
            Alignment = taCenter
            Caption = #50620#47532#48260#46300'_'#49457#51064'1'#51064' '#51077#51109#44428
            Font.Charset = HANGEUL_CHARSET
            Font.Color = 5787719
            Font.Height = -27
            Font.Name = 'Noto Sans CJK KR Medium'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
            WordWrap = True
          end
        end
      end
      object TemplateDenominPanel3: TAdvSmoothPanel
        AlignWithMargins = True
        Left = 706
        Top = 136
        Width = 310
        Height = 240
        Cursor = crDefault
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 24
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
        Caption.GradientType = gtNone
        Caption.LineColor = 12895944
        Fill.Color = 1971985
        Fill.ColorTo = clNone
        Fill.ColorMirror = clNone
        Fill.ColorMirrorTo = clNone
        Fill.GradientType = gtSolid
        Fill.GradientMirrorType = gtNone
        Fill.BorderColor = 2695453
        Fill.Rounding = 15
        Fill.ShadowOffset = 0
        Fill.Glow = gmNone
        Version = '1.7.1.5'
        Visible = False
        TabOrder = 2
        TMSStyle = 0
        object TemplateDenominPriceLabel3: TLabel
          Left = 25
          Top = 165
          Width = 260
          Height = 50
          Alignment = taCenter
          AutoSize = False
          Caption = '954,000 '#50896
          Color = 1971985
          Font.Charset = HANGEUL_CHARSET
          Font.Color = 2958880
          Font.Height = -32
          Font.Name = 'Noto Sans CJK KR Bold'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = False
          Layout = tlCenter
        end
        object TemplateDenominNameContainer3: TPanel
          Left = 25
          Top = 25
          Width = 260
          Height = 130
          Margins.Bottom = 0
          BevelOuter = bvNone
          Color = 1971985
          Font.Charset = HANGEUL_CHARSET
          Font.Color = 2958880
          Font.Height = -27
          Font.Name = 'Noto Sans CJK KR Regular'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          object TemplateDenominSeparator3: TLabel
            Left = 0
            Top = 129
            Width = 260
            Height = 1
            Align = alBottom
            AutoSize = False
            Color = 2695453
            Font.Charset = HANGEUL_CHARSET
            Font.Color = 2695453
            Font.Height = -27
            Font.Name = 'Noto Sans CJK KR Regular'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = False
            ExplicitTop = 124
          end
          object TemplateDenominTitle3: TLabel
            Left = 0
            Top = 0
            Width = 50
            Height = 40
            Align = alClient
            Alignment = taCenter
            Caption = #49457#51064
            Font.Charset = HANGEUL_CHARSET
            Font.Color = 2958880
            Font.Height = -27
            Font.Name = 'Noto Sans CJK KR Medium'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
            WordWrap = True
          end
          object TemplateDenominSoldout3: TLabel
            Left = 0
            Top = 79
            Width = 260
            Height = 50
            Align = alBottom
            Alignment = taCenter
            AutoSize = False
            Caption = #47588#51652
            Font.Charset = HANGEUL_CHARSET
            Font.Color = 15198183
            Font.Height = -32
            Font.Name = 'Noto Sans CJK KR Bold'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
            ExplicitTop = 80
          end
        end
      end
      object TemplateDenominPanel4: TAdvSmoothPanel
        AlignWithMargins = True
        Left = 56
        Top = 392
        Width = 310
        Height = 240
        Cursor = crDefault
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 24
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
        Caption.GradientType = gtNone
        Caption.LineColor = 12895944
        Fill.Color = 4404005
        Fill.ColorTo = clNone
        Fill.ColorMirror = clNone
        Fill.ColorMirrorTo = clNone
        Fill.GradientType = gtSolid
        Fill.GradientMirrorType = gtNone
        Fill.BorderColor = 7759709
        Fill.Rounding = 15
        Fill.ShadowOffset = 0
        Fill.Glow = gmNone
        Version = '1.7.1.5'
        Visible = False
        TabOrder = 3
        TMSStyle = 0
        object TemplateDenominPriceLabel4: TLabel
          Left = 25
          Top = 165
          Width = 260
          Height = 50
          Alignment = taCenter
          AutoSize = False
          Caption = '954,000 '#50896
          Color = 4404005
          Font.Charset = ANSI_CHARSET
          Font.Color = 15198183
          Font.Height = -32
          Font.Name = 'Roboto'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = False
          Layout = tlCenter
        end
        object TemplateDenominNameContainer4: TPanel
          Left = 25
          Top = 29
          Width = 260
          Height = 130
          Margins.Bottom = 0
          BevelOuter = bvNone
          Color = 4404005
          Font.Charset = HANGEUL_CHARSET
          Font.Color = 15198183
          Font.Height = -27
          Font.Name = 'Noto Sans CJK KR Regular'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          object TemplateDenominSeparator4: TLabel
            Left = 0
            Top = 129
            Width = 260
            Height = 1
            Align = alBottom
            AutoSize = False
            Color = 7759709
            ParentColor = False
            Transparent = False
            ExplicitTop = 124
          end
          object TemplateDenominTitle4: TLabel
            Left = 0
            Top = 0
            Width = 243
            Height = 80
            Align = alClient
            Alignment = taCenter
            Caption = #49457#51064'1+'#54617#49373'1+'#47784#48148#51068' '#50724#46356#50724' '#53216#54256' 1'#51109
            Font.Charset = HANGEUL_CHARSET
            Font.Color = 15198183
            Font.Height = -27
            Font.Name = 'Noto Sans CJK KR Medium'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
            WordWrap = True
          end
        end
      end
      object TemplateProdPanel1: TAdvSmoothPanel
        AlignWithMargins = True
        Left = 377
        Top = 392
        Width = 464
        Height = 704
        Cursor = crDefault
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 40
        Margins.Bottom = 26
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
        Caption.GradientType = gtNone
        Caption.LineColor = 16637593
        Fill.Color = 4667175
        Fill.ColorTo = clWhite
        Fill.ColorMirror = clNone
        Fill.ColorMirrorTo = clNone
        Fill.GradientType = gtSolid
        Fill.GradientMirrorType = gtNone
        Fill.BorderColor = 7759709
        Fill.Rounding = 10
        Fill.ShadowOffset = 0
        Fill.Glow = gmNone
        Version = '1.7.1.5'
        Visible = False
        TabOrder = 4
        TMSStyle = 0
        object TemplateProdImage1: TImage
          Left = 24
          Top = 24
          Width = 416
          Height = 512
        end
        object TemplateProdTitle1: TLabel
          Left = 24
          Top = 568
          Width = 416
          Height = 100
          Alignment = taCenter
          AutoSize = False
          Caption = '<'#48036#51648#52972'> '#53468#50577#51032' '#45432#47000
          Color = 4667175
          Font.Charset = HANGEUL_CHARSET
          Font.Color = 15198183
          Font.Height = -32
          Font.Name = 'Noto Sans CJK KR Regular'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = False
          WordWrap = True
        end
      end
      object TemplateSchedulePanel: TAdvSmoothPanel
        AlignWithMargins = True
        Left = 56
        Top = 1122
        Width = 968
        Height = 170
        Cursor = crDefault
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 24
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
        Caption.GradientType = gtNone
        Caption.LineColor = 12895944
        Fill.Color = 4667175
        Fill.ColorTo = clWhite
        Fill.ColorMirror = clNone
        Fill.ColorMirrorTo = clNone
        Fill.GradientType = gtSolid
        Fill.GradientMirrorType = gtNone
        Fill.BorderColor = 7759709
        Fill.Rounding = 15
        Fill.ShadowOffset = 0
        Fill.Glow = gmNone
        Version = '1.7.1.5'
        Visible = False
        TabOrder = 5
        TMSStyle = 0
        object TemplateScheduleDateTimeLabel: TLabel
          Left = 68
          Top = 53
          Width = 350
          Height = 64
          AutoSize = False
          Caption = '14:30'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = 15198183
          Font.Height = -43
          Font.Name = 'Noto Sans CJK KR Bold'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
        object TemplateScheduleRemainCountLabel: TLabel
          Left = 556
          Top = 57
          Width = 350
          Height = 55
          Alignment = taRightJustify
          AutoSize = False
          Caption = #51092#50668' 105'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = 15198183
          Font.Height = -37
          Font.Name = 'Noto Sans CJK KR Bold'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
      end
      object TemplatePaymentItemPanel: TPanel
        Left = 56
        Top = 8
        Width = 968
        Height = 110
        BevelOuter = bvNone
        TabOrder = 6
        Visible = False
        object TemplatePaymentItemQtyValueLabel: TLabel
          AlignWithMargins = True
          Left = 595
          Top = 5
          Width = 100
          Height = 99
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alLeft
          Alignment = taCenter
          AutoSize = False
          Caption = '1234'
          Font.Charset = ANSI_CHARSET
          Font.Color = 15198183
          Font.Height = -32
          Font.Name = 'Roboto'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          WordWrap = True
          ExplicitLeft = 615
          ExplicitHeight = 119
        end
        object TemplatePaymentSeparatorLabel: TLabel
          Left = 0
          Top = 109
          Width = 968
          Height = 1
          Align = alBottom
          AutoSize = False
          Color = 5062970
          ParentColor = False
          Transparent = False
          ExplicitTop = 143
          ExplicitWidth = 1080
        end
        object TemplatePaymentItemTitleLabel: TLabel
          AlignWithMargins = True
          Left = 5
          Top = 5
          Width = 580
          Height = 99
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alLeft
          AutoSize = False
          Caption = #44428#51333#47749
          EllipsisPosition = epEndEllipsis
          Font.Charset = HANGEUL_CHARSET
          Font.Color = 15198183
          Font.Height = -29
          Font.Name = 'Noto Sans CJK KR Medium'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          WordWrap = True
          ExplicitTop = 2
        end
        object TemplatePaymentItemAmtUnitLabel: TLabel
          AlignWithMargins = True
          Left = 910
          Top = 5
          Width = 50
          Height = 99
          Margins.Left = 0
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alLeft
          AutoSize = False
          Caption = #50896
          Font.Charset = HANGEUL_CHARSET
          Font.Color = 15198183
          Font.Height = -21
          Font.Name = 'Noto Sans CJK KR Regular'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          WordWrap = True
        end
        object TemplatePaymentItemAmtValueLabel: TLabel
          AlignWithMargins = True
          Left = 705
          Top = 5
          Width = 200
          Height = 99
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alLeft
          Alignment = taRightJustify
          AutoSize = False
          Caption = '1,234,567,890'
          Font.Charset = ANSI_CHARSET
          Font.Color = 15198183
          Font.Height = -32
          Font.Name = 'Roboto'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          WordWrap = True
          ExplicitLeft = 724
          ExplicitHeight = 123
        end
      end
    end
  end
  object panLocalePopup: TPanel
    Left = 40
    Top = 98
    Width = 120
    Height = 148
    BevelOuter = bvNone
    Color = 3155225
    TabOrder = 0
    object panLocale1: TPanel
      Tag = 1
      Left = 0
      Top = 0
      Width = 120
      Height = 48
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = '       ENG'
      Color = 4732715
      Font.Charset = HANGEUL_CHARSET
      Font.Color = 15198183
      Font.Height = -19
      Font.Name = 'Noto Sans CJK KR Regular'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      TabStop = True
    end
    object panLocale2: TPanel
      Tag = 1
      AlignWithMargins = True
      Left = 0
      Top = 50
      Width = 120
      Height = 48
      Margins.Left = 0
      Margins.Top = 2
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = '       JPN'
      Color = 4732715
      Font.Charset = HANGEUL_CHARSET
      Font.Color = 15198183
      Font.Height = -19
      Font.Name = 'Noto Sans CJK KR Regular'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      TabStop = True
    end
    object panLocale3: TPanel
      Tag = 1
      AlignWithMargins = True
      Left = 0
      Top = 100
      Width = 120
      Height = 48
      Margins.Left = 0
      Margins.Top = 2
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = '       CHN'
      Color = 4732715
      Font.Charset = HANGEUL_CHARSET
      Font.Color = 15198183
      Font.Height = -19
      Font.Name = 'Noto Sans CJK KR Regular'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      TabStop = True
    end
  end
  object tmrPopupCloser: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = tmrPopupCloserTimer
    Left = 192
    Top = 104
  end
end
