unit PRE863;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, wwdbdatetimepicker,
  ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, DB,
  ppBands, ppCache, ppCtrls, ppVar, ppPrnabl, DBGrids;

type
  TFRepResAnoSer = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dbdtpinicial: TwwDBDateTimePicker;
    dbdtpfinal: TwwDBDateTimePicker;
    btnImprimePrevio: TBitBtn;
    dbgresumen: TwwDBGrid;
    btnimprimir: TBitBtn;
    btnaexcel: TBitBtn;
    btncerrar: TBitBtn;
    ppdbResExpAtxSexo: TppDBPipeline;
    ppRepResExpAtxSexo: TppReport;
    ppHeaderBand2: TppHeaderBand;
    pplblTitulo: TppLabel;
    ppShape1: TppShape;
    ppLabel3: TppLabel;
    ppShape2: TppShape;
    ppLabel4: TppLabel;
    ppShape3: TppShape;
    ppLabel5: TppLabel;
    ppShape4: TppShape;
    ppLabel6: TppLabel;
    ppShape5: TppShape;
    ppLabel7: TppLabel;
    ppShape6: TppShape;
    ppLabel8: TppLabel;
    ppShape7: TppShape;
    ppLabel9: TppLabel;
    ppShape8: TppShape;
    ppLabel10: TppLabel;
    ppShape9: TppShape;
    ppLabel11: TppLabel;
    ppShape10: TppShape;
    ppLabel12: TppLabel;
    ppShape11: TppShape;
    ppLabel14: TppLabel;
    ppShape12: TppShape;
    ppLabel15: TppLabel;
    ppShape13: TppShape;
    ppLabel17: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLabel18: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppltitulofechas: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel77: TppLabel;
    ppImage2: TppImage;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppLine1: TppLine;
    ppDBCalc1: TppDBCalc;
    ppLine2: TppLine;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    pplimpresopor: TppLabel;
    dtgData: TDBGrid;
    procedure btnImprimePrevioClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbdtpfinalChange(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure btnaexcelClick(Sender: TObject);
    procedure limpiagrid;
    procedure dbdtpinicialChange(Sender: TObject);
  private
  public
   canret, caninv, canfal, monret, moninv, monfal, cantot, montot  :Double;
  end;

var
  FRepResAnoSer: TFRepResAnoSer;

implementation

uses PREDM, PRE862;

{$R *.dfm}

procedure TFRepResAnoSer.btnImprimePrevioClick(Sender: TObject);
Var xSql:String;
begin
  xSql := 'SELECT A.ANOS, CONCAT(CONCAT(''POR '', A.ANOS), '' AÑOS'') TEXTO,'
  +' SUM(A.CANRET) CANRET, SUM(NVL(A.MONRET, 0)) MONRET,'
  +' SUM(A.CANINV) CANINV, SUM(NVL(A.MONINV, 0)) MONINV,'
  +' SUM(A.CANFAL) CANFAL, SUM(NVL(A.MONFAL, 0)) MONFAL,'
  +' (SUM(A.CANRET) + SUM(A.CANINV) + SUM(A.CANFAL)) CANTOT,'
  +' NVL((SUM(A.MONRET) + SUM(A.MONINV) + SUM(A.MONFAL)), 0) MONTOT'
  +' FROM ( SELECT PVSLTIPBE, PVSLTBEN,'
  +' CASE WHEN PVSLTIPBE = ''01'' THEN 1 ELSE 0 END CANRET,'
  +' CASE WHEN PVSLTIPBE = ''02'' THEN 1 ELSE 0 END CANFAL,'
  +' CASE WHEN PVSLTIPBE = ''03'' THEN 1 ELSE 0 END CANINV,'
  +' CASE WHEN PVSLTIPBE = ''01'' THEN MONLIQBEN ELSE 0 END MONRET,'
  +' CASE WHEN PVSLTIPBE = ''02'' THEN MONLIQBEN ELSE 0 END MONFAL,'
  +' CASE WHEN PVSLTIPBE = ''03'' THEN MONLIQBEN ELSE 0 END MONINV,'
  +' ROUND((ASOFRESCESE - ASOFRESNOM )/365) ANOS FROM PVS306'
  +' WHERE TO_DATE(A.PVSLFECBE) >= '+QuotedStr(dbdtpinicial.Text)+' AND TO_DATE(A.PVSLFECBE) <= '+QuotedStr(dbdtpfinal.Text)+ ' AND PVSESTLIQ IN(''02'', ''05'', ''06'') ) A GROUP BY A.ANOS ORDER BY ANOS';
  DM1.cdsReporte.Close;
  DM1.cdsReporte.DataRequest(xSql);
  DM1.cdsReporte.Open;
  DM1.cdsReporte.First;
  canret := 0;
  caninv := 0;
  canfal := 0;
  cantot := 0;
  monret := 0;
  moninv := 0;
  monfal := 0;
  montot := 0;
  While Not DM1.cdsReporte.Eof Do
  Begin
   canret := canret + DM1.cdsReporte.FieldByName('MASCR').AsInteger;
   caninv := caninv + DM1.cdsReporte.FieldByName('MASCI').AsInteger;
   canfal := canfal + DM1.cdsReporte.FieldByName('MASCF').AsInteger;
   cantot := cantot + DM1.cdsReporte.FieldByName('MASCT').AsInteger;
   monret := monret + DM1.cdsReporte.FieldByName('FEMER').AsInteger;
   moninv := moninv + DM1.cdsReporte.FieldByName('FEMEI').AsInteger;
   monfal := monfal + DM1.cdsReporte.FieldByName('FEMEF').AsInteger;
   montot := montot + DM1.cdsReporte.FieldByName('FEMET').AsInteger;
   DM1.cdsReporte.Next;
 End;
  TNumericField(DM1.cdsReporte.FieldByName('MASCR')).DisplayFormat := '##,###';
  TNumericField(DM1.cdsReporte.FieldByName('MASCI')).DisplayFormat := '##,###';
  TNumericField(DM1.cdsReporte.FieldByName('MASCF')).DisplayFormat := '##,###';
  TNumericField(DM1.cdsReporte.FieldByName('MASCT')).DisplayFormat := '##,###';
  TNumericField(DM1.cdsReporte.FieldByName('FEMER')).DisplayFormat := '##,###';
  TNumericField(DM1.cdsReporte.FieldByName('FEMEI')).DisplayFormat := '##,###';
  TNumericField(DM1.cdsReporte.FieldByName('FEMEF')).DisplayFormat := '##,###';
  TNumericField(DM1.cdsReporte.FieldByName('FEMET')).DisplayFormat := '##,###';
{
  dbgresumen.ColumnByName('CIUGIR').FooterValue := 'TOTALES : ';
  dbgresumen.ColumnByName('MASCR').FooterValue := FormatFloat('##,###',mascr);
  dbgresumen.ColumnByName('MASCI').FooterValue := FormatFloat('##,###',masci);
  dbgresumen.ColumnByName('MASCF').FooterValue := FormatFloat('##,###',mascf);
  dbgresumen.ColumnByName('MASCT').FooterValue := FormatFloat('##,###',masct);
  dbgresumen.ColumnByName('FEMER').FooterValue := FormatFloat('##,###',femer);
  dbgresumen.ColumnByName('FEMEI').FooterValue := FormatFloat('##,###',femei);
  dbgresumen.ColumnByName('FEMEF').FooterValue := FormatFloat('##,###',femef);
  dbgresumen.ColumnByName('FEMET').FooterValue := FormatFloat('##,###',femet);
}
End;

procedure TFRepResAnoSer.btncerrarClick(Sender: TObject);
begin
  FRepResSex.Close;
end;

procedure TFRepResAnoSer.FormActivate(Sender: TObject);
begin
  dbgresumen.Selected.Clear;
  dbgresumen.Selected.Add('DPTODES'#9'20'#9'Descripción~del Departamento'#9#9);
  dbgresumen.Selected.Add('MASCR'#9'6'#9'Masculino~Por Retiro'#9#9);
  dbgresumen.Selected.Add('FEMER'#9'6'#9'Femenino~Por Retiro'#9#9);
  dbgresumen.Selected.Add('MASCI'#9'6'#9'Masculino~Por Invalidez'#9#9);
  dbgresumen.Selected.Add('FEMEI'#9'6'#9'Femenino~Por Invalidez'#9#9);
  dbgresumen.Selected.Add('MASCF'#9'6'#9'Masculino Por~Fallecimiento'#9#9);
  dbgresumen.Selected.Add('FEMEF'#9'6'#9'Femenino Por~Fallecimiento'#9#9);
  dbgresumen.Selected.Add('MASCT'#9'6'#9'Total~Masculino'#9#9);
  dbgresumen.Selected.Add('FEMET'#9'6'#9'Total~Femenino'#9#9);
  dbgresumen.ApplySelected;

end;

procedure TFRepResAnoSer.FormKeyPress(Sender: TObject; var Key: Char);
begin
 If Key = #13 Then
  begin
    Key := #0;
    Perform(CM_DIALOGKEY, VK_TAB, 0);
  end;
end;

procedure TFRepResAnoSer.dbdtpfinalChange(Sender: TObject);
begin
  limpiagrid;
end;

procedure TFRepResAnoSer.btnimprimirClick(Sender: TObject);
begin
  ppltitulofechas.Caption := 'DEL '+dbdtpinicial.Text+' AL '+dbdtpfinal.Text;
  pplimpresopor.Caption := 'Impreso por : '+DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
  ppRepResExpAtxSexo.Print;
  ppRepResExpAtxSexo.Stop;
end;

procedure TFRepResAnoSer.btnaexcelClick(Sender: TObject);
begin
 dtgData.DataSource := DM1.dsReporte;
 DM1.HojaExcel('REPORTE', DM1.dsReporte, dtgData)
end;

procedure TFRepResAnoSer.limpiagrid;
begin
  If DM1.cdsReporte.Active Then DM1.cdsReporte.EmptyDataSet;
  dbgresumen.ColumnByName('MASCR').FooterValue := FormatFloat('##,###',0);
  dbgresumen.ColumnByName('MASCI').FooterValue := FormatFloat('##,###',0);
  dbgresumen.ColumnByName('MASCF').FooterValue := FormatFloat('##,###',0);
  dbgresumen.ColumnByName('MASCT').FooterValue := FormatFloat('##,###',0);
  dbgresumen.ColumnByName('FEMER').FooterValue := FormatFloat('##,###',0);
  dbgresumen.ColumnByName('FEMEI').FooterValue := FormatFloat('##,###',0);
  dbgresumen.ColumnByName('FEMEF').FooterValue := FormatFloat('##,###',0);
  dbgresumen.ColumnByName('FEMET').FooterValue := FormatFloat('##,###',0);
end;

procedure TFRepResAnoSer.dbdtpinicialChange(Sender: TObject);
begin
  limpiagrid;
end;

end.
