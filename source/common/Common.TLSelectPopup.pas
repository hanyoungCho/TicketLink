unit Common.TLSelectPopup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus,
  { DevExpress }
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxButtons,
  { TMS }
  AdvSmoothPanel, HTMLabel;

const
  LCN_MAX_BUTTONS = 10;

type
  TSelectPopupForm = class(TForm)
    panButtonContainer: TPanel;
    panSelectInfo: TPanel;
    lblSelectPrice: TLabel;
    lblSelectDescription: TLabel;
    btnComplete: TcxButton;
    panSelect1: TAdvSmoothPanel;
    panSelect2: TAdvSmoothPanel;
    panSelect3: TAdvSmoothPanel;
    panSelect4: TAdvSmoothPanel;
    panSelect5: TAdvSmoothPanel;
    panSelect6: TAdvSmoothPanel;
    panSelect7: TAdvSmoothPanel;
    panSelect8: TAdvSmoothPanel;
    panSelect9: TAdvSmoothPanel;
    panSelect10: TAdvSmoothPanel;
    lblTimeout: TLabel;
    tmrAutoCloser: TTimer;
    lblLimitAlertMsg: THTMLabel;
    lblSelectName: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCompleteClick(Sender: TObject);
    procedure tmrAutoCloserTimer(Sender: TObject);
  private
    { Private declarations }
    FSelectButtons: array[1..LCN_MAX_BUTTONS] of TAdvSmoothPanel;
    FDenominIndex: Integer;
    FOrderCount: Integer;
    FSelectedCount: Integer;
    FPerMinCount: Integer;
    FPerMaxCount: Integer;
    FBuyDoubleCount: Integer;
    FRoundMaxCount: Integer;
    FPerPersonMaxCount: Integer;
    FDenominLimitCount: Integer;
    FTimeOutSecs: Integer;
    FTimeOutCount: Integer;
    FTicketUnit: string;
    FCurrencySymbol: string;

    procedure OnSelectButtonClick(Sender: TObject);
    procedure ApplyTheme;
    procedure ApplyLocale;

    procedure SetDenominIndex(const ADenominIndex: Integer);
//    procedure SetDenominDescription(const ADenominDescription: string);
    procedure SetLimitAlert(const ALimitAlert: string);
    procedure SetMinMaxCount;

//    property DenominDescription: string write SetDenominDescription;
    property LimitAlert: string write SetLimitAlert;
  public
    { Public declarations }
    property DenominIndex: Integer read FDenominIndex write SetDenominIndex default 0;
    property OrderCount: Integer read FOrderCount write FOrderCount default 0;
  end;

var
  SelectPopupForm: TSelectPopupForm;

implementation

uses
  { Native }
  System.StrUtils,
  { Project }
  Common.TLGlobal, Common.TLDM, Common.TLCommonLib, Common.TLLayerForm, Common.HTMLColorConversions;

var
  LF: TTLLayerForm;

{$R *.dfm}

procedure TSelectPopupForm.FormCreate(Sender: TObject);
begin
  LF := TTLLayerForm.Create(nil);
  LF.Show;

  SetDoubleBuffered(Self, True);
  MakeRoundedControl(Self);
  btnComplete.OnCustomDraw := Global.OnCxButtonCustomDraw;
  for var I := 1 to LCN_MAX_BUTTONS do
  begin
    FSelectButtons[I] := TAdvSmoothPanel(FindComponent('panSelect' + IntToStr(I)));
    FSelectButtons[I].Tag := I;
    FSelectButtons[I].OnClick := OnSelectButtonClick;
  end;

  FOrderCount := 0;
  FSelectedCount := 0;
  FPerMinCount := 0;
  FPerMaxCount := 0;
  FBuyDoubleCount := 1;
  FRoundMaxCount := 0;
  FPerPersonMaxCount := 0;
  FDenominLimitCount := 0;
  FTimeOutSecs := 30;
  FTicketUnit := '매';

  ApplyTheme;
  ApplyLocale;
  tmrAutoCloser.Enabled := True;
end;

procedure TSelectPopupForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  LF.Close;
  LF.Free;
  LF := nil;
  Action := caFree;
end;

procedure TSelectPopupForm.btnCompleteClick(Sender: TObject);
begin
  if (FSelectedCount > 0) and
     CheckOrderLimit(DenominIndex, OrderCount + FSelectedCount) then
  begin
    OrderCount := OrderCount + FSelectedCount;
    ModalResult := mrOK;
  end
  else
    ModalResult := mrCancel;
end;

procedure TSelectPopupForm.OnSelectButtonClick(Sender: TObject);
var
  I, LTag: Integer;
begin
  FTimeOutCount := 0;
  LTag := TAdvSmoothPanel(Sender).Tag;
  for I := 1 to LCN_MAX_BUTTONS do
  begin
    if not FSelectButtons[I].Enabled then
      Continue;

    if (I = LTag) then
    begin
      FSelectButtons[I].Caption.ColorStart := Global.ThemeInfo.Colors.panel_font_pressed;
      FSelectButtons[I].Fill.BorderColor := Global.ThemeInfo.Colors.panel_border_pressed;
      FSelectedCount := (LTag * FBuyDoubleCount);
      if (FSelectedCount > 0) then
        btnComplete.Caption := GetTextLocale(['선택 완료', 'Add to order', '選択', '选择'])
      else
        btnComplete.Caption := GetTextLocale(['닫기', 'Close', '閉じる', '关闭']);
    end
    else
    begin
      FSelectButtons[I].Caption.ColorStart := Global.ThemeInfo.Colors.panel_font_default;
      FSelectButtons[I].Fill.BorderColor := Global.ThemeInfo.Colors.panel_border_default;
    end;
  end;
end;

procedure TSelectPopupForm.SetDenominIndex(const ADenominIndex: Integer);
begin
  FDenominIndex := ADenominIndex;

  FBuyDoubleCount := Global.DenominList[FDenominIndex].BuyDoubleCount;
  for var I := 1 to LCN_MAX_BUTTONS do
    FSelectButtons[I].Caption.Text := Format('%d', [I * FBuyDoubleCount, FTicketUnit]); //매

  //FPerMinCount := (Global.DenominList[FDenominIndex].PerMinCount * FBuyDoubleCount);
  FPerMinCount := Global.DenominList[FDenominIndex].PerMinCount;
  FPerMaxCount := Global.DenominList[FDenominIndex].PerMaxCount;
  FRoundMaxCount := Global.DenominList[FDenominIndex].RoundMaxCount;
  FPerPersonMaxCount := Global.DenominList[FDenominIndex].PerPersonMaxCount;
  FDenominLimitCount := Global.DenominList[FDenominIndex].DenominLimitCount;

  lblSelectName.Caption := GetTextLocale([Global.DenominList[FDenominIndex].DenominName, Global.DenominList[FDenominIndex].DenominNameEN]);
  lblSelectPrice.Caption := FormatFloat('#,##0 ', Global.DenominList[FDenominIndex].SalePrice) + FCurrencySymbol;
  with lblSelectDescription do
  begin
    AutoSize := False;
    WordWrap := False;
    Caption := GetTextLocale([Global.DenominList[FDenominIndex].DenominDescription, Global.DenominList[FDenominIndex].DenominDescriptionEN]);
    WordWrap := True;
    AutoSize := True;
    if (Global.KioskLocale = TKioskLocale.klKorean) then
      Visible := (not Global.DenominList[FDenominIndex].DenominDescription.IsEmpty)
    else
      Visible := (not Global.DenominList[FDenominIndex].DenominDescriptionEN.IsEmpty);
  end;
  SetMinMaxCount;
end;

procedure TSelectPopupForm.SetLimitAlert(const ALimitAlert: string);
begin
  lblLimitAlertMsg.HTMLText.Text := '<P align="center">' + ALimitAlert + '</P>';
end;

procedure TSelectPopupForm.SetMinMaxCount;
var
  LCount: Integer;
  LAlert: string;
  LMax, LMin: Integer;
begin
  LAlert := '';

  {
  PerMaxCount: Integer         // 예매건당 최대매수
  PerMinCount: Integer         // 예매건당 최저매수
  ProductSaleCount: Integer    // 판매가능 매수
  ScheduleSaleCount: Integer   // 회차당 판매가능 매수
  PerPersonMaxCount: Integer   // 인당최대매수
  RoundMaxCount: Integer       // 회차당 최대매수
  BuyDoubleCount: Integer      // 매수배수
  DenominLimitCount: Integer   // 권종 판매가능매수
  ScheduleRemainCount: Integer // 해당스케줄 판매가능매수
  }

  LMax := 10;   //최대
  LMin := 1;    //최소

  // 예매건당 최저매수
  if LMin < FPerMinCount then
    LMin := FPerMinCount;

  // 예매건당 최대매
  if (LMax > FPerMaxCount) then
    LMax := FPerMaxCount;
  // 판매가능 매수
  //if (LMax > Global.DenominList[ADenonimIndex].ProductSaleCount) then
    //LMax := Global.DenominList[ADenonimIndex].ProductSaleCount;
  // 회차당 판매가능 매수
  //if (LMax > Global.DenominList[ADenonimIndex].ScheduleSaleCount) then
    //LMax := Global.DenominList[ADenonimIndex].ScheduleSaleCount;
  // 인당 최대 매수
  if (LMax > FPerPersonMaxCount) then
    LMax := FPerPersonMaxCount;
  // 회차당 최대매수
  if (LMax > FRoundMaxCount) then
    LMax := FRoundMaxCount;
  // 권종 판매가능매수
  if (LMax > FDenominLimitCount) then
    LMax := FDenominLimitCount;

  case Global.KioskLocale of
    TKioskLocale.klKorean:
      begin
        if (FBuyDoubleCount > 1) then
        begin
          if (LMin > 1) then  //A매부터 C매 단위로 최대 B매까지 선택 가능합니다.
          begin
            LAlert := Format('<FONT color="%s">%d매</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), LMin]) + ' 부터 ' +  // A
                      Format('<FONT color="%s">%d매</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), FBuyDoubleCount]) + ' 단위로 최대 ' + // C
                      Format('<FONT color="%s">%d매</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), LMax]) + '까지 선택 가능합니다.'; // B
          end
          else
          begin
            LAlert := Format('<FONT color="%s">%d매</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FBuyDoubleCount]) + ' 단위로 최대 ' +
                      Format('<FONT color="%s">%d매</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), LMax]) + '까지 선택 가능합니다.';
          end;
        end
        else
        begin
          if (LMin > 1) then
          begin
            if (LMax < 10) then
              LAlert := Format('<FONT color="%s">%d매부터 %d매까지 </FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), LMin, LMax]) + '선택 가능합니다.'
            else
              LAlert := Format('<FONT color="%s">%d매부터 </FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), LMin]) + '선택 가능합니다.';
          end
          else
          begin
            LAlert := Format('<FONT color="%s">최대 %d매</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), LMax]) + '까지 선택 가능합니다.';
          end;
        end;

        LimitAlert := LAlert;
      end;
    TKioskLocale.klEnglish:
      begin
        if (FBuyDoubleCount > 1) then
        begin
          if (LMin > 1) then //You may select up to B tickets (min A) with increments of C tickets.
          begin
            LAlert := 'You may select up to '+ Format('<FONT color="%s">%d</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), LMax]) +
                      ' tickets (min ' + Format('<FONT color="%s">%d</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), LMin]) +
                      ') with increments of ' + Format('<FONT color="%s">%d</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), FBuyDoubleCount]) + ' tickets.';
          end
          else
          begin
            LAlert := 'You may select up to ' + Format('<FONT color="%s">%d</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), LMax]) +
                      ' tickets with increments of ' + Format('<FONT color="%s">%d</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FBuyDoubleCount]) + ' tickets.';
          end;
        end
        else
        begin
          if (LMin > 1) then
          begin
            if (LMax < 10) then
              LAlert := 'You may select ' + Format('<FONT color="%s">%d</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), LMin]) + ' or more tickets.'
            else
              LAlert := 'You may select ' + Format('<FONT color="%s">%d</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), LMin]) + ' or more tickets.';
          end
          else
          begin
            LAlert := Format('<FONT color="%s">Up to %d</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), LMax]) + ' tickets can be selected.';
          end;
        end;

        LimitAlert := LAlert;
      end;
    TKioskLocale.klJapanese:
      begin
        if (FBuyDoubleCount > 1) then
        begin
          if (LMin > 1) then  // A枚からC枚単位で最大B枚まで選択できます。
          begin
            LAlert := Format('<FONT color="%s">%d</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), LMin]) + '枚から' +
                      Format('<FONT color="%s">%d</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), FBuyDoubleCount]) + '枚単位で最大' +
                      Format('<FONT color="%s">%d</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), LMax]) + '枚まで選択できます。';
          end
          else
          begin
            LAlert := Format('<FONT color="%s">%d</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FBuyDoubleCount]) + '枚単位で最大' +
                      Format('<FONT color="%s">%d</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), LMax]) +'枚まで選択できます。';
          end;
        end
        else
        begin
          if (LMin > 1) then
          begin
            if (LMax < 10) then
              LAlert := '該当券種は、' + Format('<FONT color="%s">%d</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), LMin]) + '枚から選択できます。'
            else
              LAlert := '該当券種は、' + Format('<FONT color="%s">%d</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), LMin]) + '枚から選択できます。';
          end
          else
          begin
            LAlert := '該当する券種は、' + Format('<FONT color="%s">最大%d</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), LMax]) + '枚まで選択できます。';
          end;
        end;

        LimitAlert := LAlert;
      end;
    TKioskLocale.klChinese:
      begin
        if (FBuyDoubleCount > 1) then
        begin
          if (LMin > 1) then // 从A张到以C张为增量，最多可选择B张。
          begin
            LAlert := '从' + Format('<FONT color="%s">%d</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), LMin]) + '张到以' +
                      Format('<FONT color="%s">%d</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), FBuyDoubleCount]) + '张为增量，最多可选择' +
                      Format('<FONT color="%s">%d</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), LMax]) + '张。';
          end
          else
          begin
            LAlert := '以' + Format('<FONT color="%s">%d</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FBuyDoubleCount]) + '张为增量，最多可选择' +
                             Format('<FONT color="%s">%d</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), LMax]) + '张。';
          end;
        end
        else
        begin
          if (LMin > 1) then
          begin
            if (LMax < 10) then
              LAlert := '相应门票种类，可从' + Format('<FONT color="%s">%d</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), LMin]) + '张开始选择。'
            else
              LAlert := '相应门票种类，可从' + Format('<FONT color="%s">%d</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), LMin]) + '张开始选择。';
          end
          else
          begin
            LAlert := '该门票种类最多可选择' + Format('<FONT color="%s">%d</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), LMax]) + '张。';
          end;
        end;

        LimitAlert := LAlert;
      end;
  end;

  {
  case Global.KioskLocale of
    TKioskLocale.klKorean:
      begin
        if (FBuyDoubleCount > 1) then
        begin
          if (FSelectedCount > FPerMaxCount) then
            LAlert := Format('<FONT color="%s">%d매</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FBuyDoubleCount]) + ' 단위로 최대 ' +
                      Format('<FONT color="%s">%d매</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerMaxCount]) + '까지 선택 가능합니다.';
          if (FSelectedCount < FPerMinCount) and (FSelectedCount > FPerMaxCount) then  //A매부터 C매 단위로 최대 B매까지 선택 가능합니다.
            LAlert := Format('<FONT color="%s">%d매</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerMinCount]) + ' 부터 ' +  // A
                      Format('<FONT color="%s">%d매</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), FBuyDoubleCount]) + ' 단위로 최대 ' + // C
                      Format('<FONT color="%s">%d매</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerMaxCount]) + '까지 선택 가능합니다.'; // B
        end;

        if LAlert.IsEmpty then
        begin
          if (FSelectedCount > FPerMaxCount) then
            LAlert := Format('<FONT color="%s">최대 %d매</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerMaxCount]) + '까지 선택 가능합니다.';
          if (FSelectedCount < FPerMinCount) and (FPerMinCount > 1) then
            LAlert := Format('<FONT color="%s">%d매부터 </FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerMinCount]) + '선택 가능합니다.';
          if (FPerPersonMaxCount < 10) then
            LAlert := Format('<FONT color="%s">최대 %d매</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerPersonMaxCount]) + '까지 선택 가능합니다.'
          else
          begin
            if (FDenominLimitCount < 10) then
              LAlert := Format('<FONT color="%s">최대 %d매</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FDenominLimitCount]) + '까지 선택 가능합니다.'
            else
            begin
              if (FRoundMaxCount < 10) then
                LAlert := Format('<FONT color="%s">최대 %d매</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FRoundMaxCount]) + '까지 선택 가능합니다.'
              else if (FPerMaxCount < 10) then
                LAlert := Format('<FONT color="%s">최대 %d매</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerMaxCount]) + '까지 선택 가능합니다.';
            end;
          end;
        end;

        if LAlert.IsEmpty then
          LAlert := Format('<FONT color="%s">최대 10매</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary)]) + '까지 선택 가능합니다.';

        LimitAlert := LAlert;
      end;
    TKioskLocale.klEnglish:
      begin
        if (FBuyDoubleCount > 1) then
        begin
          if (FSelectedCount > FPerMaxCount) then
            LAlert := 'You may select up to ' + Format('<FONT color="%s">%d</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerMaxCount]) +
                      ' tickets with increments of ' + Format('<FONT color="%s">%d</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FBuyDoubleCount]) + ' tickets.';

          if (FSelectedCount < FPerMinCount) and (FSelectedCount > FPerMaxCount) then //You may select up to B tickets (min A) with increments of C tickets.
            LAlert := 'You may select up to '+ Format('<FONT color="%s">%d</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerMaxCount]) +
                      ' tickets (min ' + Format('<FONT color="%s">%d</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerMinCount]) +
                      ') with increments of ' + Format('<FONT color="%s">%d</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), FBuyDoubleCount]) + ' tickets.';
        end;

        if LAlert.IsEmpty then
        begin
          if (FSelectedCount > FPerMaxCount) then
            LAlert := Format('<FONT color="%s">Up to %d</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerMaxCount]) + ' tickets can be selected.';
          if (FSelectedCount < FPerMinCount) then
            LAlert := 'You may select ' + Format('<FONT color="%s">%d</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerMinCount]) + ' or more tickets.';
          if (FPerPersonMaxCount < 10) then
            LAlert := Format('<FONT color="%s">Up to %d</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerPersonMaxCount]) + ' tickets can be selected.'
          else
          begin
            if (FDenominLimitCount < 10) then
              LAlert := Format('<FONT color="%s">Up to %d</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FDenominLimitCount]) + ' tickets can be selected.'
            else
            begin
              if (FRoundMaxCount < 10) then
                LAlert := Format('<FONT color="%s">Up to %d</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FRoundMaxCount]) + ' tickets can be selected.'
              else if (FPerMaxCount < 10) then
                LAlert := Format('<FONT color="%s">Up to %d</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerMaxCount]) + ' tickets can be selected.';
            end;
          end;
        end;

        if LAlert.IsEmpty then
          LAlert := Format('<FONT color="%s">Up to 10</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary)]) + ' tickets can be selected.';

        LimitAlert := LAlert;
      end;
    TKioskLocale.klJapanese:
      begin
        if (FBuyDoubleCount > 1) then
        begin
          if (FSelectedCount > FPerMaxCount) then
            LAlert := Format('<FONT color="%s">%d</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FBuyDoubleCount]) + '枚単位で最大' +
                      Format('<FONT color="%s">%d</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerMaxCount]) +'枚まで選択できます。';
          if (FSelectedCount < FPerMinCount) and (FSelectedCount > FPerMaxCount) then  // A枚からC枚単位で最大B枚まで選択できます。
            LAlert := Format('<FONT color="%s">%d</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerMinCount]) + '枚から' +
                      Format('<FONT color="%s">%d</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), FBuyDoubleCount]) + '枚単位で最大' +
                      Format('<FONT color="%s">%d</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerMaxCount]) + '枚まで選択できます。';
        end;

        if LAlert.IsEmpty then
        begin
          if (FSelectedCount > FPerMaxCount) then
            LAlert := '該当する券種は、' + Format('<FONT color="%s">最大%d</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerMaxCount]) + '枚まで選択できます。';
          if (FSelectedCount < FPerMinCount) then
            LAlert := '該当券種は、' + Format('<FONT color="%s">%d</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerMinCount]) + '枚から選択できます。';
          if (FPerPersonMaxCount < 10) then
            LAlert := '該当する券種は、' + Format('<FONT color="%s">最大%d</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerPersonMaxCount]) + '枚まで選択できます。'
          else
          begin
            if (FDenominLimitCount < 10) then
              LAlert := '該当する券種は、' + Format('<FONT color="%s">最大%d</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FDenominLimitCount]) + '枚まで選択できます。'
            else
            begin
              if (FRoundMaxCount < 10) then
                LAlert := '該当する券種は、' + Format('<FONT color="%s">最大%d</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FRoundMaxCount]) + '枚まで選択できます。'
              else if (FPerMaxCount < 10) then
                LAlert := '該当する券種は、' + Format('<FONT color="%s">最大%d</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerMaxCount]) + '枚まで選択できます。';
            end;
          end;
        end;

        if LAlert.IsEmpty then
          LAlert := '該当する券種は、' + Format('<FONT color="%s">最大10</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary)]) + '枚まで選択できます。';

        LimitAlert := LAlert;
      end;
    TKioskLocale.klChinese:
      begin
        if (FBuyDoubleCount > 1) then
        begin
          if (FSelectedCount > FPerMaxCount) then
            LAlert := '以' + Format('<FONT color="%s">%d</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FBuyDoubleCount]) + '张为增量，最多可选择' +
                             Format('<FONT color="%s">%d</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerMaxCount]) + '张。';
          if (FSelectedCount < FPerMinCount) and (FSelectedCount > FPerMaxCount) then // 从A张到以C张为增量，最多可选择B张。
            LAlert := '从' + Format('<FONT color="%s">%d</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerMinCount]) + '张到以' +
                      Format('<FONT color="%s">%d</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), FBuyDoubleCount]) + '张为增量，最多可选择' +
                      Format('<FONT color="%s">%d</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerMaxCount]) + '张。';
        end;

        if LAlert.IsEmpty then
        begin
          if (FSelectedCount > FPerMaxCount) then
            LAlert := '该门票种类最多可选择' + Format('<FONT color="%s">%d</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerMaxCount]) + '张。';
          if (FSelectedCount < FPerMinCount) then
            LAlert := '相应门票种类，可从' + Format('<FONT color="%s">%d</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerMinCount]) + '张开始选择。';
          if (FPerPersonMaxCount < 10) then
            LAlert := '该门票种类最多可选择' + Format('<FONT color="%s">%d</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerPersonMaxCount]) + '张。'
          else
          begin
            if (FDenominLimitCount < 10) then
              LAlert := '该门票种类最多可选择' + Format('<FONT color="%s">%d</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FDenominLimitCount]) + '张。'
            else
            begin
              if (FRoundMaxCount < 10) then
                LAlert := '该门票种类最多可选择' + Format('<FONT color="%s">%d</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FRoundMaxCount]) + '张。'
              else if (FPerMaxCount < 10) then
                LAlert := '该门票种类最多可选择' + Format('<FONT color="%s">%d</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerMaxCount]) + '张。';
            end;
          end;
        end;

        if LAlert.IsEmpty then
          LAlert := '该门票种类最多可选择' + Format('<FONT color="%s">10</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary)]) + '张。';
        LimitAlert := LAlert;
      end;
  end;
  }

  for var I: ShortInt := 1 to LCN_MAX_BUTTONS do
  begin
    LCount := (I * FBuyDoubleCount);
    FSelectButtons[I].Enabled := (LCount <= FDenominLimitCount) and //권종별 구매제한 매수
                                 (LCount <= FPerPersonMaxCount) and //1인당 최대 구매가능 매수
                                 (LCount <= FRoundMaxCount) and //회차당 최대 구매가능 매수
                                 (LCount >= FPerMinCount) and //최소 구매가능 매수
                                 (LCount <= FPerMaxCount) and //최대 구매가능 매수
                                 (LCount <= 10); //어떤 설정이든 최대 10매를 넘을 수 없음
    if not FSelectButtons[I].Enabled then
    begin
      FSelectButtons[I].Caption.ColorStart := Global.ThemeInfo.Colors.panel_font_disabled;
      FSelectButtons[I].Fill.BorderColor := Global.ThemeInfo.Colors.panel_border_disabled;
      FSelectButtons[I].Fill.Color := Global.ThemeInfo.Colors.panel_face_disabled;
    end;
  end;
end;

procedure TSelectPopupForm.tmrAutoCloserTimer(Sender: TObject);
begin
  with TTimer(Sender) do
  try
    Enabled := False;
    Inc(FTimeOutCount);
    lblTimeout.Caption := IntToStr(FTimeOutSecs - FTimeOutCount);
    if (FTimeOutCount > FTimeOutSecs) then
      Self.ModalResult := mrCancel;
  finally
    Enabled := True;
  end;
end;

(*
procedure TSelectPopupForm.SetDenominDescription(const ADenominDescription: string);
begin
  lblSelectDescription.AutoSize := False;
  lblSelectDescription.WordWrap := False;
  lblSelectDescription.Caption := ADenominDescription;
  lblSelectDescription.WordWrap := True;
  lblSelectDescription.AutoSize := True;
  lblSelectDescription.Visible := (not ADenominDescription.IsEmpty);
end;
*)

procedure TSelectPopupForm.ApplyTheme;
begin
  with Global.ThemeInfo do
  try
    Self.Color := Colors.background1;
    panSelectInfo.Color := Colors.background1;
    lblSelectName.Color := Colors.background1;
    lblSelectName.Font.Color := Colors.black;
    lblSelectPrice.Color := Colors.background1;
    lblSelectPrice.Font.Color := Colors.black;
    lblSelectDescription.Color := Colors.background1;
    lblSelectDescription.Font.Color := Colors.type4;
    lblLimitAlertMsg.Color := Colors.background1;
    lblLimitAlertMsg.Font.Color := Colors.black;

    for var I: ShortInt := 1 to LCN_MAX_BUTTONS do
    begin
      FSelectButtons[I].Caption.ColorStart := Colors.panel_font_default;
      FSelectButtons[I].Fill.BorderColor := Colors.panel_border_default;
      FSelectButtons[I].Fill.Color := Colors.panel_face_default;
    end;
    panButtonContainer.Color := Colors.background1;
  finally
    Application.ProcessMessages;
  end;
end;

procedure TSelectPopupForm.ApplyLocale;
begin
  case Global.KioskLocale of
    TKioskLocale.klKorean:
      begin
        FTicketUnit := '매';
        FCurrencySymbol := '원';
        btnComplete.Caption := '닫기';
      end;
    TKioskLocale.klEnglish:
      begin
        FTicketUnit := '';
        FCurrencySymbol := 'KRW';
        btnComplete.Caption := 'Close';
      end;
    TKioskLocale.klJapanese:
      begin
        FTicketUnit := '';
        FCurrencySymbol := 'KRW';
        btnComplete.Caption := '閉じる';
      end;
    TKioskLocale.klChinese:
      begin
        FTicketUnit := '';
        FCurrencySymbol := 'KRW';
        btnComplete.Caption := '关闭';
      end;
  end;
end;

end.
