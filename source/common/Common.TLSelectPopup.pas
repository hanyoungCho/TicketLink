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

  FPerMinCount := (Global.DenominList[FDenominIndex].PerMinCount * FBuyDoubleCount);
  FPerMaxCount := Global.DenominList[FDenominIndex].PerMaxCount;
  FRoundMaxCount := Global.DenominList[FDenominIndex].RoundMaxCount;
  FPerPersonMaxCount := Global.DenominList[FDenominIndex].PerPersonMaxCount;
  FDenominLimitCount := Global.DenominList[FDenominIndex].DenominLimitCount;

  lblSelectName.Caption := Global.DenominList[FDenominIndex].DenominName;
  lblSelectPrice.Caption := FormatFloat('#,##0 ', Global.DenominList[FDenominIndex].SalePrice) + FCurrencySymbol;
  with lblSelectDescription do
  begin
    AutoSize := False;
    WordWrap := False;
    Caption := Global.DenominList[FDenominIndex].DenominDescription;
    WordWrap := True;
    AutoSize := True;
    Visible := (not Global.DenominList[FDenominIndex].DenominDescription.IsEmpty);
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
begin
  LAlert := '';
  case Global.KioskLocale of
    TKioskLocale.klKorean:
      begin
        if (FBuyDoubleCount > 1) then
        begin
          if (FSelectedCount > FPerMaxCount) then
            LAlert := Format('<FONT color="%s">%d매 단위로 최대 %d매까지</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FBuyDoubleCount, FPerMaxCount]);
          if (FSelectedCount < FPerMinCount) and (FSelectedCount > FPerMaxCount) then
            LAlert := Format('<FONT color="%s">%d매부터 %d매 단위로 최대 %d매까지</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), FBuyDoubleCount, FPerMinCount, FPerMaxCount]);
        end;

        if LAlert.IsEmpty then
        begin
          if (FSelectedCount > FPerMaxCount) then
            LAlert := Format('<FONT color="%s">최대 %d매까지</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerMaxCount]);
          if (FSelectedCount < FPerMinCount) then
            LAlert := Format('<FONT color="%s">최소 %d매부터</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerMinCount]);
          if (FPerPersonMaxCount < 10) then
            LAlert := Format('<FONT color="%s">최대 %d매까지</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerPersonMaxCount])
          else
          begin
            if (FDenominLimitCount < 10) then
              LAlert := Format('<FONT color="%s">최대 %d매까지</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FDenominLimitCount])
            else
            begin
              if (FRoundMaxCount < 10) then
                LAlert := Format('<FONT color="%s">최대 %d매까지</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FRoundMaxCount])
              else if (FPerMaxCount < 10) then
                LAlert := Format('<FONT color="%s">최대 %d매까지</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerMaxCount])
            end;
          end;
        end;

        if LAlert.IsEmpty then
          LAlert := Format('<FONT color="%s">최대 10매까지</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary)]);
        LimitAlert := LAlert + ' 선택 가능합니다.';
      end;
    TKioskLocale.klEnglish:
      begin
        if (FBuyDoubleCount > 1) then
        begin
          if (FSelectedCount > FPerMaxCount) then
            LAlert := Format('<FONT color="%s">up to %d tickets with increments of %d tickets.</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerMaxCount, FBuyDoubleCount]);
          if (FSelectedCount < FPerMinCount) and (FSelectedCount > FPerMaxCount) then
            LAlert := Format('<FONT color="%s">up to %d tickets (min %d) with increments of %d tickets.</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerMaxCount, FBuyDoubleCount, FPerMinCount]);
        end;

        if LAlert.IsEmpty then
        begin
          if (FSelectedCount > FPerMaxCount) then
            LAlert := Format('<FONT color="%s">Up to %d tickets.</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerMaxCount]);
          if (FSelectedCount < FPerMinCount) then
            LAlert := Format('<FONT color="%s">최소 %d매부터</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerMinCount]);
          if (FPerPersonMaxCount < 10) then
            LAlert := Format('<FONT color="%s">Up to %d tickets.</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerPersonMaxCount])
          else
          begin
            if (FDenominLimitCount < 10) then
              LAlert := Format('<FONT color="%s">Up to %d tickets.</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FDenominLimitCount])
            else
            begin
              if (FRoundMaxCount < 10) then
                LAlert := Format('<FONT color="%s">Up to %d tickets.</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FRoundMaxCount])
              else if (FPerMaxCount < 10) then
                LAlert := Format('<FONT color="%s">Up to %d tickets.</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerMaxCount])
            end;
          end;
        end;

        if LAlert.IsEmpty then
          LAlert := Format('<FONT color="%s">Up to 10 tickets.</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary)]);
        LimitAlert := 'You may select ' + LAlert;
      end;
    TKioskLocale.klJapanese:
      begin
        if (FBuyDoubleCount > 1) then
        begin
          if (FSelectedCount > FPerMaxCount) then
            LAlert := Format('<FONT color="%s">%d 枚単位で最大 %d 枚ま</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FBuyDoubleCount, FPerMaxCount]);
          if (FSelectedCount < FPerMinCount) and (FSelectedCount > FPerMaxCount) then
            LAlert := Format('<FONT color="%s">%d 枚から %d 枚単位で最大 %d 枚ま</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), FBuyDoubleCount, FPerMinCount, FPerMaxCount]);
        end;

        if LAlert.IsEmpty then
        begin
          if (FSelectedCount > FPerMaxCount) then
            LAlert := Format('<FONT color="%s">最大 %d 枚ま</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerMaxCount]);
          if (FSelectedCount < FPerMinCount) then
            LAlert := Format('<FONT color="%s">최소 %d매부터</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerMinCount]);
          if (FPerPersonMaxCount < 10) then
            LAlert := Format('<FONT color="%s">最大 %d 枚ま</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerPersonMaxCount])
          else
          begin
            if (FDenominLimitCount < 10) then
              LAlert := Format('<FONT color="%s">最大 %d 枚ま</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FDenominLimitCount])
            else
            begin
              if (FRoundMaxCount < 10) then
                LAlert := Format('<FONT color="%s">最大 %d 枚ま</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FRoundMaxCount])
              else if (FPerMaxCount < 10) then
                LAlert := Format('<FONT color="%s">最大 %d 枚ま</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerMaxCount])
            end;
          end;
        end;

        if LAlert.IsEmpty then
          LAlert := Format('<FONT color="%s">最大 10 枚ま</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary)]);
        LimitAlert := LAlert + ' で選択できます。';
      end;
    TKioskLocale.klChinese:
      begin
        if (FBuyDoubleCount > 1) then
        begin
          if (FSelectedCount > FPerMaxCount) then
            LAlert := Format('<FONT color="%s">以 %d 张为增量，最多可选择 %d 张。</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FBuyDoubleCount, FPerMaxCount]);
          if (FSelectedCount < FPerMinCount) and (FSelectedCount > FPerMaxCount) then
            LAlert := Format('<FONT color="%s">从 %d 张到以 %d 张为增量，最多可选择 %d 张。</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), FBuyDoubleCount, FPerMinCount, FPerMaxCount]);
        end;

        if LAlert.IsEmpty then
        begin
          if (FSelectedCount > FPerMaxCount) then
            LAlert := Format('<FONT color="%s">最多可选择 %d 张。</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerMaxCount]);
          if (FSelectedCount < FPerMinCount) then
            LAlert := Format('<FONT color="%s">최소 %d매부터</FONT> ', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerMinCount]);
          if (FPerPersonMaxCount < 10) then
            LAlert := Format('<FONT color="%s">最多可选择 %d 张。</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerPersonMaxCount])
          else
          begin
            if (FDenominLimitCount < 10) then
              LAlert := Format('<FONT color="%s">最多可选择 %d 张。</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FDenominLimitCount])
            else
            begin
              if (FRoundMaxCount < 10) then
                LAlert := Format('<FONT color="%s">最多可选择 %d 张。</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FRoundMaxCount])
              else if (FPerMaxCount < 10) then
                LAlert := Format('<FONT color="%s">最多可选择 %d 张。</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary), FPerMaxCount])
            end;
          end;
        end;

        if LAlert.IsEmpty then
          LAlert := Format('<FONT color="%s">最多可选择 10 张。</FONT>', [Color2HTML(Global.ThemeInfo.Colors.primary)]);
        LimitAlert := LAlert;
      end;
  end;

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
