unit TLReceiptView.Plugin;

interface

uses
  { Native }
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Forms,
  Vcl.Controls, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB, Vcl.ComCtrls, Vcl.Menus,
  { ABSDB }
  ABSMain,
  { Plugin System }
  uPluginManager, uPluginModule, uPluginMessages,
  { DevExpress }
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxButtons, cxImageList, cxControls, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges, cxCurrencyEdit,
  dxScrollbarAnnotations, cxDBData, cxLabel, cxCheckBox, cxGridLevel, cxGridCustomTableView, cxGrid,
  cxGridTableView, cxGridBandedTableView, cxGridDBBandedTableView, cxClasses, cxGridCustomView,
  { TMS }
  AdvShapeButton, cxImageComboBox;

{$I ..\..\common\Common.TLGlobal.inc}

type
  TPluginForm = class(TPluginModule)
    panTitle: TPanel;
    btnClose: TAdvShapeButton;
    panButtonContainer: TPanel;
    btnRefresh: TcxButton;
    btnReIssueReceipt: TcxButton;
    DSReceipt: TDataSource;
    DSOrder: TDataSource;
    DSPayment: TDataSource;
    QRReceipt: TABSQuery;
    QROrder: TABSQuery;
    QRPayment: TABSQuery;
    dtpSaleDate: TDateTimePicker;
    Label1: TLabel;
    panBody: TPanel;
    G1: TcxGrid;
    V1: TcxGridDBBandedTableView;
    V1partner_no: TcxGridDBBandedColumn;
    V1counter_no: TcxGridDBBandedColumn;
    V1receipt_no: TcxGridDBBandedColumn;
    V1sale_date: TcxGridDBBandedColumn;
    V1sale_time: TcxGridDBBandedColumn;
    V1update_dttm: TcxGridDBBandedColumn;
    L1: TcxGridLevel;
    G2: TcxGrid;
    V2: TcxGridDBBandedTableView;
    V2product_id: TcxGridDBBandedColumn;
    V2schedule_id: TcxGridDBBandedColumn;
    V2denomin_id: TcxGridDBBandedColumn;
    V2unit_price: TcxGridDBBandedColumn;
    V2sale_qty: TcxGridDBBandedColumn;
    V2sale_amt: TcxGridDBBandedColumn;
    L2: TcxGridLevel;
    G3: TcxGrid;
    V3: TcxGridDBBandedTableView;
    V3pay_method: TcxGridDBBandedColumn;
    V3approval_yn: TcxGridDBBandedColumn;
    V3credit_card_no: TcxGridDBBandedColumn;
    V3approve_amt: TcxGridDBBandedColumn;
    V3vat: TcxGridDBBandedColumn;
    V3approve_no: TcxGridDBBandedColumn;
    V3buyer_nm: TcxGridDBBandedColumn;
    V3payco_pay_method: TcxGridDBBandedColumn;
    L3: TcxGridLevel;
    V1reserve_no: TcxGridDBBandedColumn;
    procedure PluginModuleClose(Sender: TObject; var Action: TCloseAction);
    procedure PluginModuleMessage(Sender: TObject; AMsg: TPluginMessage);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnReIssueReceiptClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure V1FocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure PluginModuleActivate(Sender: TObject);
    procedure PluginModuleDeactivate(Sender: TObject);
  private
    { Private declarations }
    FOwnerID: Integer;
    FSaleDate: TDate;

    procedure ProcessMessages(AMsg: TPluginMessage);
    procedure DoReceiptQuery(const ASaleDate: TDate);
    procedure DoDetailQuery(const AReceiptNo: string);
    procedure SetSaleDate(const ASaleDate: TDate);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; AMsg: TPluginMessage=nil); override;
    destructor Destroy; override;

    property SaleDate: TDate read FSaleDate write SetSaleDate;
  end;

implementation

uses
  { Project }
  Common.TLGlobal, Common.TLCommonLib, Common.TLDM, Common.TLLayerForm, Common.TLMsgBox;
var
  LF: TTLLayerForm;

{$R *.dfm}

{ TTLPluginForm }

constructor TPluginForm.Create(AOwner: TComponent; AMsg: TPluginMessage);
begin
  inherited Create(AOwner, AMsg);

  LF := TTLLayerForm.Create(nil);
  LF.Show;

  FOwnerID := 0;
  MakeRoundedControl(Self);
  MakeRoundedControl(dtpSaleDate, 10, 10);
  SetDoubleBuffered(Self, True);

  dtpSaleDate.Date := Now;
  SaleDate := dtpSaleDate.Date;
  btnRefresh.OnCustomDraw := Global.OnCxButtonCustomDraw;
  btnReIssueReceipt.OnCustomDraw := Global.OnCxButtonCustomDraw;

  if Assigned(AMsg) then
    ProcessMessages(AMsg);
end;

destructor TPluginForm.Destroy;
begin
  inherited Destroy;
end;

procedure TPluginForm.PluginModuleClose(Sender: TObject; var Action: TCloseAction);
begin
  LF.Close;
  LF.Free;
  LF := nil;
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
    FOwnerID := AMsg.ParamByInteger(CPP_OWNER_ID);
end;

procedure TPluginForm.SetSaleDate(const ASaleDate: TDate);
begin
  FSaleDate := ASaleDate;
  DoReceiptQuery(FSaleDate);
end;

procedure TPluginForm.V1FocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  DoDetailQuery(V1.DataController.DataSet.FieldByName('receipt_no').AsString);
end;

procedure TPluginForm.DoReceiptQuery(const ASaleDate: TDate);
var
  LSaleDate, LReceiptNo: string;
begin
  LSaleDate := FormatDateTime('yyyy-mm-dd', ASaleDate, Global.FormatSettingsKR);
  LReceiptNo := '?';
  with QRReceipt do
  try
    DisableControls;
    Close;
    SQL.Text := Format('SELECT * FROM TBReceipt WHERE sale_date = %s', [QuotedStr(LSaleDate)]);
    Prepare;
    Open;
    if (RecordCount > 0) then
      LReceiptNo := FieldByName('receipt_no').AsString;
    DoDetailQuery(LReceiptNo);
  finally
    EnableControls;
  end;
end;

procedure TPluginForm.DoDetailQuery(const AReceiptNo: string);
begin
  with QROrder do
  try
    DisableControls;
    Close;
    if (QRReceipt.RecordCount > 0) then
    begin
      SQL.Text := Format('SELECT * FROM TBOrder WHERE receipt_no = %s', [QuotedStr(AReceiptNo)]);
      Prepare;
      Open;
    end;
  finally
    EnableControls;
  end;

  with QRPayment do
  try
    DisableControls;
    Close;
    if (QRReceipt.RecordCount > 0) then
    begin
      SQL.Text := Format('SELECT * FROM TBPayment WHERE receipt_no = %s', [QuotedStr(AReceiptNo)]);
      Prepare;
      Open;
    end;
  finally
    EnableControls;
  end;
end;

procedure TPluginForm.btnCloseClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TPluginForm.btnRefreshClick(Sender: TObject);
begin
  DoReceiptQuery(dtpSaleDate.Date);
end;

procedure TPluginForm.btnReIssueReceiptClick(Sender: TObject);
var
  LReceiptNo: string;
  LReserveNo: Int64;
begin
  with V1.DataController.DataSet do
  try
    if (RecordCount = 0) then
      Exit;
    if not Global.ReceiptPrinter.Active then
      raise Exception.Create('영수증 프린터를 사용할 수 없습니다.');

    DM.TruncateABSTable(DM.MTTicketList, True); //티켓은 인쇄 안함
    LReceiptNo := FieldByName('receipt_no').AsString;
    LReserveNo := FieldByName('reserve_no').AsLargeInt;
    try
      ShowPrintingDialog(LReceiptNo, LReserveNo);
    finally
      ClosePrintingDialog;
    end;
  except
    on E: Exception do
      ShowMsgBoxError(GetTextLocale(['영수증을 출력할 수 없습니다.' + _CRLF + '매표소에 문의하여 주십시오.',
                                     '영수증을 출력할 수 없습니다.' + _CRLF + 'Please visit the ticket office.',
                                     '영수증을 출력할 수 없습니다.' + _CRLF + 'チケット売り場にお問い合わせください。',
                                     '영수증을 출력할 수 없습니다.' + _CRLF + '请与售票处咨询。']),
                                      E.Message, ['확인'], 5);
  end;
end;

////////////////////////////////////////////////////////////////////////////////////////////////////

function OpenPlugin(AMsg: TPluginMessage=nil): TPluginModule;
begin
  Result := TPluginForm.Create(Application, AMsg);
end;

exports
  OpenPlugin;
end.