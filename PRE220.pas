// Inicio Uso Estándares: 01/08/2011
// Unidad               : PRE220
// Formulario           : Fextornodesembolso
// Fecha de Creación    : 26/06/2017
// Autor                : Area de desarrollo de sistemas
// Objetivo             : Extornar desembolsos no pagados
// Actualizaciones
// HPC_201705_PRE : Creación
// HPC_201709     : Se actualiza monto pagado cuando se extorna un monto a pagar
unit PRE220;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, wwdbdatetimepicker, wwdblook, Wwdbdlg, StdCtrls, Buttons,
  ExtCtrls;

type
  TFextornodesembolso = class(TForm)
    pnlExtorno: TPanel;
    gbextdesben: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Panel6: TPanel;
    edtApeNomBen: TEdit;
    Panel7: TPanel;
    edtMonDes: TEdit;
    Panel8: TPanel;
    edtbanDes: TEdit;
    Panel9: TPanel;
    edtTipDes: TEdit;
    Panel10: TPanel;
    edtNumOfi: TEdit;
    Panel11: TPanel;
    edtFecOfi: TEdit;
    btnextornar: TBitBtn;
    btncancelar: TBitBtn;
    gbingdatext: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    dblcdmotextdes: TwwDBLookupComboDlg;
    pnldesmotextdes: TPanel;
    edtdesmotextdes: TEdit;
    edtdesotrmotdes: TEdit;
    edtnumopeextdes: TEdit;
    dtpfecoprextdes: TwwDBDateTimePicker;
    procedure btnextornarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblcdmotextdesExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btncancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fextornodesembolso: TFextornodesembolso;

implementation

uses PREDM;

{$R *.dfm}


procedure TFextornodesembolso.btnextornarClick(Sender: TObject);
Var xSql:String;
begin
   If Trim(dblcdmotextdes.Text) = '' Then
   Begin
      MessageDlg('Debe ingresar el código de motivo de extorno de desembolso.', mtError, [mbOk], 0);
      dblcdmotextdes.SetFocus;
      Exit;
   End;
   If ((dblcdmotextdes.Text = '99')  And (Trim(edtdesotrmotdes.Text) = '')) Then
   Begin
      MessageDlg('Debe ingresar el motivo de extorno de desembolso.', mtError, [mbOk], 0);
      edtdesotrmotdes.SetFocus;
      Exit;
   End;
   If Trim(DateToStr(dtpfecoprextdes.Date)) = '' Then
   Begin
      MessageDlg('Debe ingresar la fecha de operación del de extorno de desembolso.', mtError, [mbOk], 0);
      dtpfecoprextdes.SetFocus;
      Exit;
   End;
   If dtpfecoprextdes.Date > DM1.FechaSys Then
   Begin
      MessageDlg('Fecha de operación no puede ser mayor al día de hoy.', mtInformation, [mbOk], 0);
      dtpfecoprextdes.Text := '';
      dtpfecoprextdes.SetFocus;
      Exit;
   End;
   If Trim(edtnumopeextdes.Text) = '' Then
   Begin
      MessageDlg('Debe ingresar el número de operación del extorno de desembolso.', mtError, [mbOk], 0);
      edtnumopeextdes.SetFocus;
      Exit;
   End;
   If MessageDlg('¿ Seguro de extornar el desembolso ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
      xSql := 'UPDATE PVS307 SET PVSLMONTO = 0, PVSLCONCE = PVSLCONCE||''[PAGO EXTORNADO S/. ''||TO_CHAR(PVSLSALDO,''99,999.99'')||'']'''
      +', PVSLNOFC = NULL, FLAEXT = ''S'', USUEXT = '+QuotedStr(DM1.wUsuario)+', FECEXT = SYSDATE, OFIEXT = '+QuotedStr(DM1.cdsEstCarta.FieldByName('PVSLNOFC').AsString)
      +', CODMOTEXTDES = '+QuotedStr(dblcdmotextdes.Text)+', DESOTRMOTEXTDES = '+QuotedStr(edtdesotrmotdes.Text)
      +', FECOPEEXTDES = '+QuotedStr(DateToStr(dtpfecoprextdes.Date))+', NUMOPEEXTDES = '+QuotedStr(edtnumopeextdes.Text)
      +' WHERE PVSLBENNR = '+QuotedStr(DM1.cdsEstCarta.FieldByName('PVSLBENNR').AsString)+' AND PVSLNVOU = '+QuotedStr(DM1.cdsEstCarta.FieldByName('PVSLNVOU').AsString)
      +' AND PVSNOMBRE = '+QuotedStr(DM1.cdsEstCarta.FieldByName('PVSNOMBRE').AsString)+' AND PVSLAGRID = ''FPG'' AND FLGVOUCHER = ''N''';
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);

      // Inicio: HPC_201709_PRE
      // Se actualiza monto pagado cuando se extorna un monto a pagar
      xSql := 'UPDATE PVS306 A SET A.MONPAG = (SELECT SUM(NVL(B.PVSLMONTO,0)) FROM PVS307 B WHERE A.PVSLBENNR = B.PVSLBENNR  AND PVSLAGRID IN (''FPG'',''RET'') AND NVL(FLGVOUCHER,0) = ''N'')'
      +' WHERE A.PVSLBENNR = '+QuotedStr(DM1.cdsEstCarta.FieldByName('PVSLBENNR').AsString);
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      // Fin: HPC_201709_PRE

      MessageDlg('Desembolso extornado satisfactoriamente.', mtInformation, [mbOk], 0);
      Close;
   End;
end;

procedure TFextornodesembolso.FormCreate(Sender: TObject);
Var xSql:String;
begin
   xSql := 'SELECT CODMOTEXTDES, DESMOTEXTDES FROM PRE_MOT_EXT_REF WHERE CODMOTEXTDES IS NOT NULL';
   DM1.cdsTipoResol.Close;
   DM1.cdsTipoResol.DataRequest(xSql);
   DM1.cdsTipoResol.Open;
   dblcdmotextdes.Selected.Clear;
   dblcdmotextdes.Selected.Add('CODMOTEXTDES'#9'2'#9'Código'#9#9);
   dblcdmotextdes.Selected.Add('DESMOTEXTDES'#9'32'#9'Departamento'#9#9);
   dblcdmotextdes.LookupTable := DM1.cdsTipoResol;
   dblcdmotextdes.LookupField := 'CODMOTEXTDES';
end;

procedure TFextornodesembolso.dblcdmotextdesExit(Sender: TObject);
begin
   If dblcdmotextdes.Text = '' Then
      Exit;
   If DM1.cdsTipoResol.Locate('CODMOTEXTDES', dblcdmotextdes.Text, []) Then
      edtdesmotextdes.Text := DM1.cdsTipoResol.FieldByName('DESMOTEXTDES').AsString
   Else
   Begin
      MessageDlg('Motivo ingresado no valido.', mtInformation, [mbOk], 0);
      edtdesmotextdes.Text := '';
      dblcdmotextdes.Text := '';
      dblcdmotextdes.SetFocus;
      Exit;
   End;

   If dblcdmotextdes.Text = '99' Then
   Begin
      edtdesotrmotdes.Enabled := True;
      edtdesotrmotdes.SetFocus
   End
   Else
   Begin
      edtdesotrmotdes.Enabled := False;
      dtpfecoprextdes.SetFocus;
   End;
end;

procedure TFextornodesembolso.FormActivate(Sender: TObject);
begin
   gbextdesben.Caption := 'Extorno de desembolso Liquidación Nº '+DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString+', Beneficiario : '+DM1.cdsEstCarta.FieldByName('PVSNOMBRE').AsString;
   edtApeNomBen.Text := DM1.cdsEstCarta.FieldByName('PVSNOMBRE').AsString;
   edtMonDes.Text := DM1.cdsEstCarta.FieldByName('PVSLMONTO').AsString;
   edtbanDes.Text := DM1.cdsEstCarta.FieldByName('BANCONOM').AsString;
   edtTipDes.Text := DM1.cdsEstCarta.FieldByName('TIPDESEDES').AsString;
   edtNumOfi.Text := DM1.cdsEstCarta.FieldByName('PVSLNOFC').AsString;
   edtFecOfi.Text := DM1.RecuperaDatos('PVS203','NOFID',DM1.cdsEstCarta.FieldByName('PVSLNOFC').AsString,'FREG');
   edtdesotrmotdes.Enabled := False;
   dblcdmotextdes.SetFocus;
end;

procedure TFextornodesembolso.FormKeyPress(Sender: TObject; var Key: Char);
begin
   If Key = #13 Then
   Begin
      Key := #0;
      Perform(CM_DIALOGKEY, VK_TAB, 0);
   End;
end;

procedure TFextornodesembolso.btncancelarClick(Sender: TObject);
begin
   Close;
end;

end.
