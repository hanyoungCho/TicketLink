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
          Height = 80
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
          ExplicitHeight = 55
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
    Properties.ActivePage = tabDenominList
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
            Height = 59
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
            ExplicitHeight = 54
          end
          object lblOrderTotalPriceUnit: TLabel
            AlignWithMargins = True
            Left = 962
            Top = 3
            Width = 27
            Height = 59
            Align = alRight
            Caption = #50896
            Font.Charset = HANGEUL_CHARSET
            Font.Color = 15198183
            Font.Height = -29
            Font.Name = 'Noto Sans CJK KR Regular'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
            ExplicitHeight = 43
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
            Height = 59
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
            ExplicitHeight = 54
          end
          object lblOrderTotalQtyUnit: TLabel
            AlignWithMargins = True
            Left = 155
            Top = 3
            Width = 27
            Height = 59
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
            ExplicitHeight = 43
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
        object lblPayMethod: TLabel
          AlignWithMargins = True
          Left = 49
          Top = 132
          Width = 112
          Height = 100
          Margins.Right = 5
          Alignment = taRightJustify
          AutoSize = False
          Caption = #44208#51228#48169#48277#13#10#49440#53469
          Font.Charset = HANGEUL_CHARSET
          Font.Color = 15198183
          Font.Height = -27
          Font.Name = 'Noto Sans CJK KR Regular'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          WordWrap = True
        end
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
        object btnDoCreditCard: TcxButton
          Tag = 1
          Left = 169
          Top = 132
          Width = 420
          Height = 100
          Caption = #49888#50857#52852#46300' '#44208#51228
          Colors.Normal = 5848878
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
          TabOrder = 1
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -32
          Font.Name = 'Noto Sans CJK KR Bold'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          OnClick = btnDoCreditCardClick
        end
        object btnDoPAYCO: TcxButton
          Tag = 1
          Left = 609
          Top = 132
          Width = 420
          Height = 100
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
          TabOrder = 2
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
          Left = 656
          Top = 57
          Width = 250
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
