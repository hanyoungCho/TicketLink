object PluginForm: TPluginForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 530
  ClientWidth = 580
  Color = 3155225
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Noto Sans CJK KR Regular'
  Font.Style = []
  FormStyle = fsStayOnTop
  Position = poOwnerFormCenter
  OnClose = PluginModuleClose
  OnCloseQuery = PluginModuleCloseQuery
  PluginGroup = 0
  InitHeight = 0
  InitWidth = 0
  EscCanClose = False
  OnMessage = PluginModuleMessage
  TextHeight = 22
  object aniLoading: TAnimateImage
    Left = 302
    Top = 101
    Width = 120
    Height = 120
    AutoSize = True
    Interval = 100
  end
  object lblMessage: TLabel
    Left = 60
    Top = 281
    Width = 460
    Height = 160
    Alignment = taCenter
    AutoSize = False
    Caption = #51104#49884#47564' '#44592#45796#47140' '#51452#49901#49884#50724'.'
    Font.Charset = HANGEUL_CHARSET
    Font.Color = 15198183
    Font.Height = -32
    Font.Name = 'Noto Sans CJK KR Bold'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object imgLoading: TImage
    Left = 158
    Top = 101
    Width = 120
    Height = 120
    AutoSize = True
  end
end
