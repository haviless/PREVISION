// Inicio Uso Estándares: 01/08/2011
// Unidad               : PRE296
// Formulario           : Fdespagypenpag
// Fecha de Creación    : 26/06/2017
// Autor                : Area de desarrollo de sistemas.
// Objetivo             : Reportes de Desembolsos pagados, pendientes de pago y extornados no reprogramados
// Actualizaciones
// HPC_201705_PRE : Creación
unit PRE296;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, db,
  Dialogs, StdCtrls, wwdbdatetimepicker, ExtCtrls, Buttons, Grids,
  Wwdbigrd, Wwdbgrid, ppBands, ppCache, ppClass, ppProd, ppReport, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppPrnabl, ppVar, jpeg;

type
  TFdespagypenpag = class(TForm)
    gbfiltro: TGroupBox;
    btnimprimir: TBitBtn;
    btnaexcel: TBitBtn;
    btncerrar: TBitBtn;
    btnprocesar: TBitBtn;
    rgtiprep: TRadioGroup;
    gbfechas: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtpfecinicio: TwwDBDateTimePicker;
    dtpfecfinal: TwwDBDateTimePicker;
    dbgreporte: TwwDBGrid;
    ppBDEReporte: TppBDEPipeline;
    pprOficio: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppShape2: TppShape;
    ppLabel2: TppLabel;
    ppShape3: TppShape;
    ppLabel3: TppLabel;
    ppShape4: TppShape;
    ppLabel4: TppLabel;
    ppShape5: TppShape;
    ppLabel5: TppLabel;
    ppShape6: TppShape;
    ppLabel6: TppLabel;
    ppShape7: TppShape;
    ppLabel7: TppLabel;
    ppImage3: TppImage;
    ppLabel114: TppLabel;
    ppltittod01: TppLabel;
    ppltittod02: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppLabel115: TppLabel;
    ppLabel116: TppLabel;
    ppLabel117: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLabel8: TppLabel;
    ppShape8: TppShape;
    ppLine1: TppLine;
    ppLine2: TppLine;
    pplimpresopordesembolsado: TppLabel;
    pprExtorno: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppShape9: TppShape;
    ppLabel9: TppLabel;
    ppShape10: TppShape;
    ppLabel10: TppLabel;
    ppShape11: TppShape;
    ppLabel11: TppLabel;
    ppShape12: TppShape;
    ppLabel12: TppLabel;
    ppShape13: TppShape;
    ppLabel13: TppLabel;
    ppImage1: TppImage;
    ppLabel16: TppLabel;
    ppltituloExtorno: TppLabel;
    pplfechaextorno: TppLabel;
    ppLabel19: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppShape16: TppShape;
    ppDBCalc2: TppDBCalc;
    ppLabel28: TppLabel;
    ppLine3: TppLine;
    ppLine4: TppLine;
    pplimpresoporextorno: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppSummaryBand2: TppSummaryBand;
    pnlapenom: TPanel;
    Label3: TLabel;
    pnlasoapenomdni: TPanel;
    edtBuscarDet: TEdit;
    pnlcanregpro: TPanel;
    ppShape14: TppShape;
    ppLabel14: TppLabel;
    ppShape15: TppShape;
    ppLabel31: TppLabel;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    pplcanregext: TppLabel;
    ppShape17: TppShape;
    ppShape18: TppShape;
    ppLabel17: TppLabel;
    ppDBText15: TppDBText;
    ppLine5: TppLine;
    pplcandesconoficio: TppLabel;
    ppShape19: TppShape;
    procedure rgtiprepClick(Sender: TObject);
    procedure btnprocesarClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure btnaexcelClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure edtBuscarDetKeyPress(Sender: TObject; var Key: Char);
    procedure edtBuscarDetChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fdespagypenpag: TFdespagypenpag;

implementation

uses PREDM;

{$R *.dfm}

procedure TFdespagypenpag.rgtiprepClick(Sender: TObject);
begin
   DM1.cdsReporte.Close;
   If rgtiprep.ItemIndex = 0 Then gbfechas.Caption := 'Fechas de oficio';
   If rgtiprep.ItemIndex = 1 Then gbfechas.Caption := 'Fechas de extorno';
   dtpfecinicio.Text := '';
   dtpfecfinal.Text := '';
   dtpfecinicio.SetFocus;
end;

procedure TFdespagypenpag.btnprocesarClick(Sender: TObject);
Var xSql:String;
    xmonto:Double;
begin
   If (rgtiprep.ItemIndex = 0) Or ((rgtiprep.ItemIndex = 1) And ((dtpfecinicio.Text <> '') Or (dtpfecfinal.Text <> ''))) Then
   Begin
      If Trim(dtpfecinicio.Text) = '' Then
      Begin
         MessageDlg('Debe ingresar fecha inicial del proceso', mtCustom, [mbOk], 0);
         dtpfecinicio.SetFocus;
         Exit;
      End;
      If Trim(dtpfecfinal.Text) = '' Then
      Begin
         MessageDlg('Debe ingresar fecha final del proceso', mtCustom, [mbOk], 0);
         dtpfecfinal.SetFocus;
         Exit;
      End;
      If dtpfecinicio.Date > dtpfecfinal.Date Then
      Begin
         MessageDlg('Ingrese una fecha inicial menor o igual a la fecha final', mtInformation, [mbOk], 0);
         dtpfecinicio.SetFocus;
         Exit;
      End;
      If dtpfecfinal.Date > DM1.FechaSys Then
      Begin
         MessageDlg('La fecha final no puede ser mayor al día de hoy.', mtInformation, [mbOk], 0);
         dtpfecfinal.Text := '';
         dtpfecfinal.SetFocus;
         Exit;
      End;
   End;

   Screen.Cursor := crHourGlass;
   If rgtiprep.ItemIndex = 0 Then
      xSql := 'SELECT B.PVSLBENNR, E.PVSLFECBE, B.PVSLNOFC NUMOFI, A.OFIESTADO ESTOFI, B.FREG FECOFI, C.BANCONOM, D.TIPDESEDES,'
      +' TRIM(B.APEPATCOB)||'' ''||TRIM(B.APEMATCOB)||'' ''||TRIM(B.APECASCOB)||'' ''||TRIM(B.NOMCOB) APENOMCOB,'
      +' B.PVSLMONTO, B.FECEXT, B.FECREP'
      +' FROM PVS203 A, PVS307 B, TGE105 C, CRE104 D, PVS306 E'
      +' WHERE TO_DATE(A.FREG) >= '+QuotedStr(dtpfecinicio.Text)+' AND TO_DATE(A.FREG) <= '+QuotedStr(dtpfecfinal.Text)
      +' AND A.OFIESTADO NOT IN (''EXTORNADO'', ''ANULADO'')'
      +' AND A.NOFID = B.PVSLNOFC AND B.BANCOID = C.BANCOID AND B.FORPAGOID = D.TIPDESEID AND B.PVSLBENNR = E.PVSLBENNR ORDER BY B.PVSLNOFC'
   Else
   Begin
      xSql := 'SELECT B.PVSLBENNR, TO_DATE(B.PVSLFECBE) PVSLFECBE, A.PVSLSALDO PVSLMONTO, TO_DATE(A.FECEXT) FECEXT,'
      +' TRIM(A.APEPATCOB)||'' ''||TRIM(A.APEMATCOB)||'' ''||TRIM(A.APECASCOB)||'' ''||TRIM(A.NOMCOB) APENOMCOB, C.USERNOM, D.OFDESNOM'
      +' FROM PVS307 A, PVS306 B, TGE006 C, APO110 D, PVS301 E'
      +' WHERE A.FECEXT IS NOT NULL AND A.FECREP IS  NULL';
      If (Trim(dtpfecinicio.Text) <> '') And (Trim(dtpfecfinal.Text) <> '') Then
         xSql := xSql + ' AND TO_DATE(A.FECEXT) >= '+QuotedStr(dtpfecinicio.Text)+' AND TO_DATE(A.FECEXT) <= '+QuotedStr(dtpfecfinal.Text);
      xSql := xSql   +' AND A.PVSLBENNR = B.PVSLBENNR AND B.PVSESTLIQ NOT IN (''04'',''13'') AND A.USUEXT = C.USERID'
      +' AND B.ASOID = E.ASOID AND B.PVSLBENNR = E.PVSLBENNR AND E.OFIORIEXP =  D.OFDESID';
   End;
   DM1.cdsReporte.Close;
   DM1.cdsReporte.DataRequest(xSql);
   DM1.cdsReporte.Open;
   Screen.Cursor := crDefault;
   If DM1.cdsReporte.RecordCount = 0 Then
   Begin
      MessageDlg('No existe información para mostrar.', mtInformation, [mbOk], 0);
      rgtiprep.SetFocus;
      Exit;
   End;

   btnimprimir.Enabled := True;
   btnaexcel.Enabled := True;

   DM1.cdsReporte.First;
   xmonto := 0;
   WHile Not DM1.cdsReporte.Eof Do
   Begin
      xmonto := xmonto + DM1.cdsReporte.FieldByName('PVSLMONTO').AsFloat;
      DM1.cdsReporte.Next;
   End;

   If rgtiprep.ItemIndex = 0 Then
   Begin
      dbgreporte.Selected.Clear;
      dbgreporte.Selected.Add('PVSLBENNR'#9'11'#9'Número de~liquidación'#9#9);
      dbgreporte.Selected.Add('PVSLFECBE'#9'11'#9'Fecha de~liquidación'#9#9);
      dbgreporte.Selected.Add('NUMOFI'#9'11'#9'Número de~oficio'#9#9);
      dbgreporte.Selected.Add('APENOMCOB'#9'52'#9'Apellido y nombre~del beneficiario'#9#9);
      dbgreporte.Selected.Add('FECOFI'#9'10'#9'Fecha del~oficio'#9#9);
      dbgreporte.Selected.Add('BANCONOM'#9'23'#9'Banco de~desembolso'#9#9);
      dbgreporte.Selected.Add('TIPDESEDES'#9'40'#9'Forma de~desembolso'#9#9);
      dbgreporte.Selected.Add('PVSLMONTO'#9'13'#9'Monto~desembolsado'#9#9);
      dbgreporte.ApplySelected;
   End;
   If rgtiprep.ItemIndex = 1 Then
   Begin
      dbgreporte.Selected.Clear;
      dbgreporte.Selected.Add('FECEXT'#9'10'#9'Fecha de~extorno'#9#9);
      dbgreporte.Selected.Add('APENOMCOB'#9'52'#9'Apellido y nombre~del beneficiario'#9#9);
      dbgreporte.Selected.Add('PVSLBENNR'#9'11'#9'Número de~liquidación'#9#9);
      dbgreporte.Selected.Add('PVSLFECBE'#9'10'#9'Fecha de~liquidación'#9#9);
      dbgreporte.Selected.Add('PVSLMONTO'#9'13'#9'Monto~extornado'#9#9);
      dbgreporte.Selected.Add('USERNOM'#9'30'#9'Usuario que~extorna'#9#9);
      dbgreporte.Selected.Add('OFDESNOM'#9'23'#9'Oficina de~extorno'#9#9);
      dbgreporte.ApplySelected;
   End;

   pnlcanregpro.Caption := 'Cantidad de registros procesados : '+  FloatToStrF(DM1.cdsReporte.RecordCount,ffNumber,8,0);

   TNumericField(DM1.cdsReporte.FieldByName('PVSLMONTO')).DisplayFormat := '###,###,##0.00';
   dbgreporte.ColumnByName('PVSLMONTO').FooterValue := FormatFloat('###,###,##0.00', xmonto) ;

end;

procedure TFdespagypenpag.btncerrarClick(Sender: TObject);
begin
  Fdespagypenpag.Close;
end;

procedure TFdespagypenpag.btnaexcelClick(Sender: TObject);
begin
   If DM1.cdsReporte.RecordCount = 0 Then
   Begin
      MessageDlg('No existe información para mostrar', mtInformation, [mbOk], 0);
      Exit;
   End;
   DM1.ExportaGridExcel(dbgreporte, 'PRE_DESPAGYPENPAG');
end;

procedure TFdespagypenpag.FormKeyPress(Sender: TObject; var Key: Char);
begin
 If Key = #13 Then
  begin
    Key := #0;
    Perform(CM_DIALOGKEY, VK_TAB, 0);
  end;
end;

procedure TFdespagypenpag.FormActivate(Sender: TObject);
begin
   rgtiprep.ItemIndex := 0;
   dtpfecinicio.SetFocus;
   btnimprimir.Enabled := False;
   btnaexcel.Enabled := False;
   If DM1.cdsReporte.Active = True Then DM1.cdsReporte.Close;
end;

procedure TFdespagypenpag.btnimprimirClick(Sender: TObject);
begin
   If DM1.cdsReporte.RecordCount = 0 Then
   Begin
      MessageDlg('No existe información para mostrar', mtInformation, [mbOk], 0);
      Exit;
   End;
   If rgtiprep.ItemIndex = 0 Then
   Begin
      ppltittod01.Caption := 'DESEMBOLSOS EFECTUADOS';
      ppltittod02.Caption := 'DEL '+dtpfecinicio.Text+' AL '+dtpfecfinal.Text;
      pplcandesconoficio.Caption := 'Cantidad de registros : '+IntToStr(DM1.cdsReporte.RecordCount);
      pplimpresopordesembolsado.Caption := 'Impreso por : '+DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
      pprOficio.print;
   End;

   If rgtiprep.ItemIndex = 1 Then
   Begin
      ppltituloExtorno.Caption := 'EXTORNOS NO REPROGRAMADOS';
      If Trim(dtpfecinicio.Text) <> '' Then
         pplfechaextorno.Caption := 'DEL '+dtpfecinicio.Text+' AL '+dtpfecfinal.Text
      Else
         pplfechaextorno.Caption := 'TOTALES';
      pplimpresoporextorno.Caption := 'Impreso por : '+DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
      pplcanregext.Caption := 'Cantidad de registros : '+IntToStr(DM1.cdsReporte.RecordCount);
      pprExtorno.Print;
   End;
end;

procedure TFdespagypenpag.edtBuscarDetKeyPress(Sender: TObject;
  var Key: Char);
begin
 If Key=#13 Then
  Begin
    If Length(Trim(edtBuscarDet.Text))>0 Then
    Begin
      edtBuscarDet.Text := '';
      dbgreporte.SetFocus;
    End
    Else
    Begin
      MessageDlg('Debe Digitar El Nombre Del Asociado, Para Iniciar La Busqueda', mtError,[mbOk], 0 );
      edtBuscarDet.SetFocus;
    End;
  End;
end;

procedure TFdespagypenpag.edtBuscarDetChange(Sender: TObject);
begin
   If Length(Trim(edtBuscarDet.Text))>0 Then
      DM1.cdsReporte.Locate('APENOMCOB', VarArrayOf([TRIM(edtBuscarDet.Text)]), [loPartialKey]);
end;

end.

