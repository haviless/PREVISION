unit PRE210;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ToolEdit, CurrEdit, ExtCtrls;

type
  TFingdattabcapdeu = class(TForm)
    gbmeses: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    pnlenero: TPanel;
    ceenero: TCurrencyEdit;
    pnlfebrero: TPanel;
    cefebrero: TCurrencyEdit;
    pnlmarzo: TPanel;
    cemarzo: TCurrencyEdit;
    pnlabril: TPanel;
    ceabril: TCurrencyEdit;
    pnlmayo: TPanel;
    cemayo: TCurrencyEdit;
    pnljunio: TPanel;
    cejunio: TCurrencyEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    pnljulio: TPanel;
    cejulio: TCurrencyEdit;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    pnlagosto: TPanel;
    ceagosto: TCurrencyEdit;
    pnlsetiembre: TPanel;
    cesetiembre: TCurrencyEdit;
    pnloctubre: TPanel;
    ceoctubre: TCurrencyEdit;
    pnlnoviembre: TPanel;
    cenoviembre: TCurrencyEdit;
    pnldiciembre: TPanel;
    cediciembre: TCurrencyEdit;
    gbprincipal: TGroupBox;
    Label1: TLabel;
    ceanoces: TCurrencyEdit;
    Label2: TLabel;
    cetieser: TCurrencyEdit;
    Label27: TLabel;
    Label28: TLabel;
    btneditar: TBitBtn;
    btncerrar: TBitBtn;
    btngrabar: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure btngrabarClick(Sender: TObject);
    procedure btneditarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fingdattabcapdeu: TFingdattabcapdeu;

implementation

uses PREDM;

{$R *.dfm}


procedure TFingdattabcapdeu.FormActivate(Sender: TObject);
begin
  If DM1.xSgr = 'M' Then
  Begin
    Fingdattabcapdeu.Caption := 'Modificación de valores';
    gbprincipal.Enabled := False;
    gbmeses.Enabled     := False;
    ceanoces.Value    := DM1.cdsQry18.FieldByName('PVSCANO').AsFloat;
    cetieser.Value    := DM1.cdsQry18.FieldByName('PVSCSERV').AsFloat;
    ceenero.Value     := DM1.cdsQry18.FieldByName('PVSCMM01').AsFloat;
    cefebrero.Value   := DM1.cdsQry18.FieldByName('PVSCMM02').AsFloat;
    cemarzo.Value     := DM1.cdsQry18.FieldByName('PVSCMM03').AsFloat;
    ceabril.Value     := DM1.cdsQry18.FieldByName('PVSCMM04').AsFloat;
    cemayo.Value      := DM1.cdsQry18.FieldByName('PVSCMM05').AsFloat;
    cejunio.Value     := DM1.cdsQry18.FieldByName('PVSCMM06').AsFloat;
    cejulio.Value     := DM1.cdsQry18.FieldByName('PVSCMM07').AsFloat;
    ceagosto.Value    := DM1.cdsQry18.FieldByName('PVSCMM08').AsFloat;
    cesetiembre.Value := DM1.cdsQry18.FieldByName('PVSCMM09').AsFloat;
    ceoctubre.Value   := DM1.cdsQry18.FieldByName('PVSCMM10').AsFloat;
    cenoviembre.Value := DM1.cdsQry18.FieldByName('PVSCMM11').AsFloat;
    cediciembre.Value := DM1.cdsQry18.FieldByName('PVSCMM12').AsFloat;
  End;
end;

procedure TFingdattabcapdeu.btncerrarClick(Sender: TObject);
begin
  Fingdattabcapdeu.Close;
end;

procedure TFingdattabcapdeu.btngrabarClick(Sender: TObject);
Var xanomes, xtieser, xSql:String;
    xenero, xfebrero, xmarzo, xabril, xmayo, xjunio:Double;
    xjulio, xagosto, xsetiembre, xoctubre, xnoviembre, xdiciembre:Double;
begin
  xanomes := DM1.StrZero(ceanoces.Text,4);
  xtieser := DM1.StrZero(cetieser.Text,2);
  If DM1.xSgr = 'M' Then
  Begin
    If MessageDlg('¿ Seguro de actualizar ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
    Begin
      If Trim(ceenero.Text)     <> '' Then xenero     := ceenero.Value     Else xenero     := 0.00;
      If Trim(cefebrero.Text)   <> '' Then xfebrero   := cefebrero.Value   Else xfebrero   := 0.00;
      If Trim(cemarzo.Text)     <> '' Then xmarzo     := cemarzo.Value     Else xmarzo     := 0.00;
      If Trim(ceabril.Text)     <> '' Then xabril     := ceabril.Value     Else xabril     := 0.00;
      If Trim(cemayo.Text)      <> '' Then xmayo      := cemayo.Value      Else xmayo      := 0.00;
      If Trim(cejunio.Text)     <> '' Then xjunio     := cejunio.Value     Else xjunio     := 0.00;
      If Trim(cejulio.Text)     <> '' Then xjulio     := cejulio.Value     Else xjulio     := 0.00;
      If Trim(ceagosto.Text)    <> '' Then xagosto    := ceagosto.Value    Else xagosto    := 0.00;
      If Trim(cesetiembre.Text) <> '' Then xsetiembre := cesetiembre.Value Else xsetiembre := 0.00;
      If Trim(ceoctubre.Text)   <> '' Then xoctubre   := ceoctubre.Value   Else xoctubre   := 0.00;
      If Trim(cenoviembre.Text) <> '' Then xnoviembre := cenoviembre.Value Else xnoviembre := 0.00;
      If Trim(cediciembre.Text) <> '' Then xdiciembre := cediciembre.Value Else xdiciembre := 0.00;
      xSql := 'INSERT INTO PVS107_LOG(PVSCANO, PVSCSERV, PVSCMM01, PVSCMM02, PVSCMM03, PVSCMM04, PVSCMM05, PVSCMM06, PVSCMM07, PVSCMM08, PVSCMM09, PVSCMM10, PVSCMM11, PVSCMM12, USUARIO, FECHAHORA, MOMENTO)'
      +' SELECT PVSCANO, PVSCSERV, PVSCMM01, PVSCMM02, PVSCMM03, PVSCMM04, PVSCMM05, PVSCMM06, PVSCMM07, PVSCMM08, PVSCMM09, PVSCMM10, PVSCMM11, PVSCMM12 , '+QuotedStr(DM1.wUsuario)+', SYSDATE, ''0'''
      +' FROM PVS107 WHERE PVSCANO = '+QuotedStr(xanomes)+' AND PVSCSERV = '+QuotedStr(xtieser);
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);

      xSql := 'UPDATE PVS107 SET '
      +' PVSCMM01 = '+FloatToStr(xenero)+',  PVSCMM02 = '+FloatToStr(xfebrero)+',  PVSCMM03 = '+FloatToStr(xmarzo)
      +',PVSCMM04 = '+FloatToStr(xabril)+',  PVSCMM05 = '+FloatToStr(xmayo)+',  PVSCMM06 = '+FloatToStr(xjunio)
      +',PVSCMM07 = '+FloatToStr(xjulio)+',  PVSCMM08 = '+FloatToStr(xagosto)+',  PVSCMM09 = '+FloatToStr(xsetiembre)
      +',PVSCMM10 = '+FloatToStr(xoctubre)+',PVSCMM11 = '+FloatToStr(xnoviembre)+',PVSCMM12 = '+FloatToStr(xdiciembre)
      +' WHERE PVSCANO = '+QuotedStr(xanomes)+' AND PVSCSERV = '+QuotedStr(xtieser);
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);

      xSql := 'INSERT INTO PVS107_LOG(PVSCANO, PVSCSERV, PVSCMM01, PVSCMM02, PVSCMM03, PVSCMM04, PVSCMM05, PVSCMM06, PVSCMM07, PVSCMM08, PVSCMM09, PVSCMM10, PVSCMM11, PVSCMM12, USUARIO, FECHAHORA, MOMENTO)'
      +' SELECT PVSCANO, PVSCSERV, PVSCMM01, PVSCMM02, PVSCMM03, PVSCMM04, PVSCMM05, PVSCMM06, PVSCMM07, PVSCMM08, PVSCMM09, PVSCMM10, PVSCMM11, PVSCMM12, '+QuotedStr(DM1.wUsuario)+', SYSDATE, ''1'''
      +' FROM PVS107 WHERE PVSCANO = '+QuotedStr(xanomes)+' AND PVSCSERV = '+QuotedStr(xtieser);
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);

      MessageDlg('Actualización Ok', mtCustom, [mbOk], 0);
    End;
  End;
  Fingdattabcapdeu.Close;
end;

procedure TFingdattabcapdeu.btneditarClick(Sender: TObject);
begin
  If DM1.xSgr = 'M' Then
  Begin
    gbmeses.Enabled := True;
    ceenero.SetFocus;
  End;
end;

procedure TFingdattabcapdeu.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  begin
    Key := #0;
    Perform(CM_DIALOGKEY, VK_TAB, 0);
  End;
end;

end.
