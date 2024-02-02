object PluginForm: TPluginForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 1920
  ClientWidth = 1080
  Color = 3155225
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Noto Sans CJK KR Regular'
  Font.Style = []
  OnClose = PluginModuleClose
  PluginGroup = 0
  InitHeight = 0
  InitWidth = 0
  EscCanClose = False
  OnMessage = PluginModuleMessage
  TextHeight = 28
  object tmrRunOnce: TTimer
    Enabled = False
    Interval = 100
    OnTimer = tmrRunOnceTimer
    Left = 56
    Top = 40
  end
end
