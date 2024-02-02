object LogViewForm: TLogViewForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'LogViewForm'
  ClientHeight = 900
  ClientWidth = 800
  Color = 3155225
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Noto Sans CJK KR Regular'
  Font.Style = []
  FormStyle = fsStayOnTop
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 28
  object pgcLogView: TcxPageControl
    Left = 20
    Top = 88
    Width = 760
    Height = 790
    ParentBackground = False
    TabOrder = 1
    Properties.ActivePage = tabSystem
    Properties.CustomButtons.Buttons = <>
    Properties.Style = 9
    Properties.TabSlants.Positions = [spRight]
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    ClientRectBottom = 790
    ClientRectRight = 760
    ClientRectTop = 35
    object tabSystem: TcxTabSheet
      Caption = '  '#54532#47196#44536#47016' '#47196#44536'  '
      Color = clWhite
      Font.Charset = HANGEUL_CHARSET
      Font.Color = 11117471
      Font.Height = -19
      Font.Name = 'Noto Sans CJK KR Regular'
      Font.Style = []
      ImageIndex = 0
      ParentColor = False
      ParentFont = False
      object mmoAppLog: TMemo
        AlignWithMargins = True
        Left = 10
        Top = 10
        Width = 740
        Height = 735
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Noto Sans CJK KR Regular'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
      end
    end
    object tabConfig: TcxTabSheet
      Caption = '  '#44208#51228#45236#50669' '#47196#44536'  '
      Color = clWhite
      ImageIndex = 1
      ParentColor = False
      object mmoPayLog: TMemo
        AlignWithMargins = True
        Left = 10
        Top = 10
        Width = 740
        Height = 735
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Noto Sans CJK KR Regular'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
      end
    end
  end
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
    Caption = #47196#44536' '#48372#44592
    Color = 5848878
    Font.Charset = HANGEUL_CHARSET
    Font.Color = 15854568
    Font.Height = -32
    Font.Name = 'Noto Sans CJK KR Bold'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object btnClose: TAdvShapeButton
      Left = 712
      Top = 0
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
end
