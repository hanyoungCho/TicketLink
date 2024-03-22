unit TLAdmin.Plugin;

interface

uses
  { Native }
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Forms, Vcl.Controls,
  Vcl.StdCtrls, Vcl.Menus, System.ImageList, Vcl.ImgList,
  { Plugin System }
  uPluginManager, uPluginModule, uPluginMessages,
  { DevExpress }
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxButtons, cxImageList, dxGDIPlusClasses,
  Vcl.ExtCtrls;

{$I ..\..\common\Common.TLGlobal.inc}

type
  TPluginForm = class(TPluginModule)
    btnMenu1: TcxButton;
    btnMenu8: TcxButton;
    btnMenu3: TcxButton;
    btnMenu7: TcxButton;
    btnMenu4: TcxButton;
    btnMenu5: TcxButton;
    btnMenu6: TcxButton;
    btnMenu2: TcxButton;
    imgButtonRes: TcxImageList;
    panVersionInfo: TPanel;
    imgSolbiPOS: TImage;
    lblPoweredBy: TLabel;
    lblPluginVersion: TLabel;
    lblProductVersion: TLabel;

    procedure PluginModuleClose(Sender: TObject; var Action: TCloseAction);
    procedure PluginModuleMessage(Sender: TObject; AMsg: TPluginMessage);
    procedure btnMenu1Click(Sender: TObject);
    procedure btnMenu8Click(Sender: TObject);
    procedure btnMenu3Click(Sender: TObject);
    procedure btnMenu4Click(Sender: TObject);
    procedure btnMenu5Click(Sender: TObject);
    procedure btnMenu6Click(Sender: TObject);
    procedure btnMenu7Click(Sender: TObject);
    procedure btnMenu2Click(Sender: TObject);
    procedure PluginModuleDeactivate(Sender: TObject);
    procedure PluginModuleActivate(Sender: TObject);
  private
    { Private declarations }
    FOwnerID: Integer;
    FMenuButtons: TArray<TcxButton>;

    procedure ProcessMessages(AMsg: TPluginMessage);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; AMsg: TPluginMessage=nil); override;
    destructor Destroy; override;
  end;

implementation

uses
  { Project }
  Common.TLGlobal, Common.TLCommonLib, Common.TLMsgBox, TLAdmin.Config, TLAdmin.LogView;

{$R *.dfm}

{ TTLAdminForm }

constructor TPluginForm.Create(AOwner: TComponent; AMsg: TPluginMessage);
const
  LCN_BUTTON_COUNT = 8;
begin
  inherited Create(AOwner, AMsg);

  FOwnerID := 0;
  Global.PluginInfo.AdminPluginId := Self.PluginID;
  SetDoubleBuffered(Self, True);
  Self.Top := Global.BaseScreenTop;
  Self.Left := Global.BaseScreenLeft;
  Self.Width := Global.BaseScreenWidth;
  Self.Height := Global.BaseScreenHeight;

  MakeRoundedControl(panVersionInfo, 10, 10);
  lblProductVersion.Caption := Format('PRODUCT Ver.%s', [Global.ProductVersion]);
  lblPluginVersion.Caption := Format('PLUGIN Ver.%s', [GetModuleVersion(GetModuleName(HInstance))]);
  SetLength(FMenuButtons, LCN_BUTTON_COUNT);
  for var I := 0 to Pred(LCN_BUTTON_COUNT) do
  begin
    FMenuButtons[I] := TcxButton(FindComponent('btnMenu' + IntToStr(I + 1)));
    FMenuButtons[I].CanBeFocused := False;
    FMenuButtons[I].SpeedButtonOptions.CanBeFocused := False;
    FMenuButtons[I].SpeedButtonOptions.Flat := True;
//    FMenuButtons[I].OnCustomDraw := Global.OnCxButtonCustomDraw;
    FMenuButtons[I].OptionsImage.Images := imgButtonRes;
    FMenuButtons[I].OptionsImage.ImageIndex := I;
    MakeRoundedControl(FMenuButtons[I], 50, 50);
  end;

  if Assigned(AMsg) then
    ProcessMessages(AMsg);
end;

destructor TPluginForm.Destroy;
begin
  inherited Destroy;
end;

procedure TPluginForm.PluginModuleClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TPluginForm.PluginModuleActivate(Sender: TObject);
begin
  Global.ThreadTimer.CheckIdle := False;
end;

procedure TPluginForm.PluginModuleDeactivate(Sender: TObject);
begin
  Global.ThreadTimer.CheckIdle := True;
end;

procedure TPluginForm.PluginModuleMessage(Sender: TObject; AMsg: TPluginMessage);
begin
  ProcessMessages(AMsg);
end;

procedure TPluginForm.ProcessMessages(AMsg: TPluginMessage);
begin
  if (AMsg.Command = CPC_INIT) then
  begin
    Global.KioskMode := KSM_ADMIN;
    FOwnerID := AMsg.ParamByInteger(CPP_OWNER_ID);
  end;

  if (AMsg.Command = CPC_SET_FOREGROUND) then
    SetForegroundWindow(Self.Handle);
end;

procedure TPluginForm.btnMenu1Click(Sender: TObject);
begin
  Global.KioskMode := KSM_HOME;
end;

procedure TPluginForm.btnMenu2Click(Sender: TObject);
var
  PM: TPluginMessage;
begin
  PM := TPluginMessage.Create(nil);
  try
    PluginManager.OpenModal('TLReceiptView.bpl', PM);
  finally
    FreeAndNil(PM);
  end;
end;

procedure TPluginForm.btnMenu3Click(Sender: TObject);
begin
  with TConfigForm.Create(nil) do
    if (ShowModal = mrOK) then
      ShowMsgBoxInfo('프로그램 재시작 필요', '변경된 설정값은 재시작 후 적용이 됩니다.', ['확인'], 5);
end;

procedure TPluginForm.btnMenu4Click(Sender: TObject);
var
  PM: TPluginMessage;
begin
  PM := TPluginMessage.Create(nil);
  try
    PM.Command := CPC_INIT;
    PM.AddParams(CPP_OWNER_ID, Self.PluginID);
    //chy test
    PM.AddParams(CPP_VALUE, 1);
    PluginManager.OpenModal('TLPrepare.bpl', PM);
  finally
    FreeAndNil(PM);
  end;
end;

procedure TPluginForm.btnMenu5Click(Sender: TObject);
begin
  if (ShowMsgBoxConfirm('키오스크 장치를 재시작하시겠습니까?', '', ['확인', '취소']) = mrOK) then
  begin
    SystemShutdown(0, True, True);
    Application.Terminate;
  end;
end;

procedure TPluginForm.btnMenu6Click(Sender: TObject);
begin
  if (ShowMsgBoxConfirm('키오스크 장치를 종료하시겠습니까?', '', ['확인', '취소']) = mrOK) then
  begin
    SystemShutdown(0, True, False);
    Application.Terminate;
  end;
end;

procedure TPluginForm.btnMenu7Click(Sender: TObject);
begin
  with TLogViewForm.Create(nil) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TPluginForm.btnMenu8Click(Sender: TObject);
begin
  if (ShowMsgBoxConfirm('프로그램을 종료하시겠습니까?', '', ['확인', '취소']) = mrOK) then
    SendMessage(Application.MainForm.Handle, WM_CLOSE, 0, 0);
end;

////////////////////////////////////////////////////////////////////////////////////////////////////

function OpenPlugin(AMsg: TPluginMessage=nil): TPluginModule;
begin
  Result := TPluginForm.Create(Application, AMsg);
end;

exports
  OpenPlugin;
end.