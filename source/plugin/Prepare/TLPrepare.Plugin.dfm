object PluginForm: TPluginForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 800
  ClientWidth = 1080
  Color = 3155225
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Noto Sans CJK KR Regular'
  Font.Style = []
  Position = poDefault
  OnActivate = PluginModuleActivate
  OnClose = PluginModuleClose
  OnDeactivate = PluginModuleDeactivate
  OnResize = PluginModuleResize
  PluginGroup = 0
  InitHeight = 0
  InitWidth = 0
  EscCanClose = False
  OnMessage = PluginModuleMessage
  TextHeight = 22
  object lblPrepareMsg: TLabel
    Left = 140
    Top = 520
    Width = 800
    Height = 200
    Alignment = taCenter
    AutoSize = False
    Caption = #54532#47196#44536#47016' '#49884#51089
    Font.Charset = HANGEUL_CHARSET
    Font.Color = 8550255
    Font.Height = -27
    Font.Name = 'Noto Sans CJK KR Bold'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object panPrepareProgress: TPanel
    Left = 340
    Top = 80
    Width = 400
    Height = 400
    BevelOuter = bvNone
    TabOrder = 0
    object pgwPrepareTotal: TProgressWheel
      Left = 0
      Top = 0
      Width = 400
      Height = 400
      ColorDoneMin = 2130677
      ColorDoneMax = 15198183
      ColorInner = 3155225
      InnerSize = 80
      ShowText = False
      Color = 3155225
      ParentColor = False
    end
    object pgwPrepareCurrent: TProgressWheel
      Left = 90
      Top = 90
      Width = 220
      Height = 220
      ColorDoneMin = 2130677
      ColorDoneMax = 8550255
      ColorInner = 3155225
      InnerSize = 60
      ShowText = False
      Color = 3155225
      ParentColor = False
    end
  end
  object tmrRunOnce: TTimer
    Enabled = False
    Interval = 100
    OnTimer = tmrRunOnceTimer
    Left = 64
    Top = 72
  end
end
