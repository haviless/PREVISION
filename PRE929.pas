// Inicio Uso Estándares : 01/08/2011
// Unidad                : Previsión Social
// Formulario            : Fcuocrexben
// Fecha de Creación     : 01/08/2011
// Autor                 : Equipo de desarrollo
// Objetivo              : Cuotas de créditos descuentos por Beneficios
// Actualizaciones
// HPC_201307_PRE   : Añade imagen del nuevo logo institucional
// SPP_201401_PRE   : Se realiza el pase a producción a partir del pase HPC_201307_PRE
// HPC_201503_PRE   : Se añade a la consulta lo recuperado por el FSC

unit PRE929;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, wwdbdatetimepicker, ppDB, ppDBPipe, ppDBBDE,
  ppComm, ppRelatv, ppProd, ppClass, ppReport, ppVar, ppPrnabl, ppCtrls,
  ppBands, ppCache, Grids, Wwdbigrd, Wwdbgrid, DBGrids, DB, jpeg;  // SPP_201401_PRE

type
  TFcuocrexben = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dbdtpInicial: TwwDBDateTimePicker;
    dbdtpFinal: TwwDBDateTimePicker;
    dbgcuocre: TwwDBGrid;
    btnImprime: TBitBtn;
    btnPrevio: TBitBtn;
    btnaexcel: TBitBtn;
    btncerrar: TBitBtn;
    pprcuocrepagxben: TppReport;
    ppHeaderBand1: TppHeaderBand;
    pplblTitulo: TppLabel;
    ppltitulo02: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel22: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppShape2: TppShape;
    ppLabel2: TppLabel;
    ppShape3: TppShape;
    ppLabel3: TppLabel;
    ppShape4: TppShape;
    ppLabel4: TppLabel;
    ppShape6: TppShape;
    ppLabel5: TppLabel;
    ppShape7: TppShape;
    ppLabel6: TppLabel;
    ppShape8: TppShape;
    ppLabel9: TppLabel;
    ppShape10: TppShape;
    ppLabel10: TppLabel;
    ppShape11: TppShape;
    ppLabel11: TppLabel;
    ppShape12: TppShape;
    ppLabel12: TppLabel;
    ppShape14: TppShape;
    ppLabel16: TppLabel;
    ppShape15: TppShape;
    ppLabel17: TppLabel;
    ppShape16: TppShape;
    ppLabel20: TppLabel;
    ppDetailBand1: TppDetailBand;
// HPC_201503_PRE   : Se añade a la consulta lo recuperado por el FSC
    //ppDBText1: TppDBText;
// HPC_201503_PRE   : Se añade a la consulta lo recuperado por el FSC
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc1: TppDBCalc;
    ppLine1: TppLine;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppLine2: TppLine;
    pplimppor: TppLabel;
    bdecuocrepagxben: TppBDEPipeline;
    dbgcuo: TDBGrid;
//Inicio: SPP_201401_PRE
    // ppImage4: TppImage;  
    // ppLabel13: TppLabel;  
    // ppLabel14: TppLabel;  
    // ppLabel114: TppLabel;  
//Fin: SPP_201401_PRE
    ppLabel119: TppLabel;
    ppImage1: TppImage;  // SPP_201401_PRE
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btncerrarClick(Sender: TObject);
    procedure btnImprimeClick(Sender: TObject);
    procedure btnPrevioClick(Sender: TObject);
    procedure btnaexcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fcuocrexben: TFcuocrexben;

implementation

uses PREDM;

{$R *.dfm}

procedure TFcuocrexben.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  begin
    Key := #0;
    Perform(CM_DIALOGKEY, VK_TAB, 0);
  end;
end;

procedure TFcuocrexben.btncerrarClick(Sender: TObject);
begin
  Fcuocrexben.Close;
end;

procedure TFcuocrexben.btnImprimeClick(Sender: TObject);
begin
  ppltitulo02.Caption := 'DEL '+dbdtpInicial.Text+' AL '+dbdtpFinal.Text;
  pplimppor.Caption := 'IMPRESO POR : '+ UpperCase(DM1.DevuelveValor('USERTABLE', 'USERNOM', 'USERID', DM1.wUsuario ));
  pprcuocrepagxben.Print;
  pprcuocrepagxben.Stop;
end;

procedure TFcuocrexben.btnPrevioClick(Sender: TObject);
Var xSql:String;
cueret, cueinv, cuefal, monret, moninv, monfal:Double;
Begin
  dbgcuocre.ColumnByName('CUERET').FooterValue := FormatFloat('###,###',0);
  dbgcuocre.ColumnByName('CUEINV').FooterValue := FormatFloat('###,###',0);
  dbgcuocre.ColumnByName('CUEFAL').FooterValue := FormatFloat('###,###',0);
  dbgcuocre.ColumnByName('CUETOT').FooterValue := FormatFloat('###,###',0);
  dbgcuocre.ColumnByName('MONRET').FooterValue := FormatFloat('###,###.#0',0);
  dbgcuocre.ColumnByName('MONINV').FooterValue := FormatFloat('###,###.#0',0);
  dbgcuocre.ColumnByName('MONFAL').FooterValue := FormatFloat('###,###.#0',0);
  dbgcuocre.ColumnByName('MONTOT').FooterValue := FormatFloat('###,###.#0',0);
  If dbdtpInicial.Text = '' Then
  Begin
    MessageDlg('Ingrese la fecha inicial', mtInformation, [mbOk], 0);
    dbdtpInicial.SetFocus;
    Exit;
  End;
  If dbdtpFinal.Text = '' Then
  Begin
    MessageDlg('Ingrese la fecha final', mtInformation, [mbOk], 0);
    dbdtpFinal.SetFocus;
    Exit;
  End;
  If dbdtpInicial.Date > dbdtpFinal.Date Then
  Begin
    MessageDlg('Ingrese una fecha inicial menor o igual a la fecha final', mtInformation, [mbOk], 0);
    dbdtpInicial.SetFocus;
    Exit;
  End;
  xSql := 'SELECT A.TIPCREID, B.TIPCREDES,'
  +' SUM(NVL(A.CUERET,0)) CUERET, SUM(NVL(A.MONRET,0)) MONRET,'
  +' SUM(NVL(A.CUEFAL,0)) CUEFAL, SUM(NVL(A.MONFAL,0)) MONFAL,'
  +' SUM(NVL(A.CUEINV,0)) CUEINV, SUM(NVL(A.MONINV,0)) MONINV,'
  +' SUM(NVL(A.CUERET,0)+NVL(A.CUEFAL,0)+NVL(A.CUEINV,0)) CUETOT, SUM(NVL(A.MONRET,0)+NVL(A.MONFAL,0)+NVL(A.MONINV,0)) MONTOT'
  +' FROM (SELECT TIPCREID, CASE WHEN PVSLTIPBE= ''01'' THEN CUENTA END CUERET, CASE WHEN PVSLTIPBE= ''01'' THEN CREMTOCOB END MONRET,'
  +'                        CASE WHEN PVSLTIPBE= ''02'' THEN CUENTA END CUEFAL, CASE WHEN PVSLTIPBE= ''02'' THEN CREMTOCOB END MONFAL,'
  +'                        CASE WHEN PVSLTIPBE= ''03'' THEN CUENTA END CUEINV, CASE WHEN PVSLTIPBE= ''03'' THEN CREMTOCOB END MONINV'
  +' FROM( SELECT PVSLTIPBE, TIPCREID, COUNT(*) CUENTA, SUM(NVL(CREMTOCOB,0)) CREMTOCOB FROM (SELECT A.PVSLTIPBE, SUBSTR(B.CREDID,7,2) TIPCREID,'
  +' B.CREDID, SUM(C.CREMTOCOB) CREMTOCOB FROM PVS306 A, CRE301 B, CRE310 C WHERE TO_DATE(PVSLFECBE) >= '+QuotedStr(dbdtpInicial.Text)+' AND TO_DATE(PVSLFECBE) <= '+QuotedStr(dbdtpFinal.Text)
  +' AND PVSESTLIQ IN (''02'', ''05'', ''06'')'
  +' AND A.ASOID = B.ASOID AND B.CREDID = C.CREDID AND C.CREESTID NOT IN (''04'',''13'')'
  +' AND A.ASOID = B.ASOID(+) AND A.PVSLBENNR = C.CREDOCPAG(+) AND TO_DATE(A.PVSLFECBE) = C.CREFPAG(+)'
  +' GROUP BY B.TIPCREID, A.PVSLTIPBE, B.CREDID)'
  +' GROUP BY PVSLTIPBE, TIPCREID)) A, CRE110 B'
  +' WHERE A.TIPCREID = B.TIPCREID GROUP BY A.TIPCREID, B.TIPCREDES';

// Inicio HPC_201503_PRE   : Se añade a la consulta lo recuperado por el FSC
  xSql:=xSql+' UNION ALL '
       +'SELECT ''00'' TIPCREID, ''RECUPERO POR F.S.C'' TIPCREDES, '
       +  'sum(CASE WHEN PVSLTIPBE= ''01'' THEN CUENTA END) CUERET, sum(CASE WHEN PVSLTIPBE= ''01'' THEN CREMTOCOB END) MONRET, '
       +  'sum(CASE WHEN PVSLTIPBE= ''02'' THEN CUENTA END) CUEFAL, sum(CASE WHEN PVSLTIPBE= ''02'' THEN CREMTOCOB END) MONFAL, '
       +  'sum(CASE WHEN PVSLTIPBE= ''03'' THEN CUENTA END) CUEINV, sum(CASE WHEN PVSLTIPBE= ''03'' THEN CREMTOCOB END) MONINV,  '
       +  'sum( nvl(CUENTA,0) ) CUETOT, '
       +  'sum( nvl(CREMTOCOB,0) ) MONTOT '
       +'FROM( '
       +       'SELECT PVSLTIPBE, count(*) cuenta, '
       +             ' sum(b.imp_cob_deu) CREMTOCOB '
       +         'FROM PVS306 A, cob_fsc_pagos_al_fsc B '
       +        'WHERE TO_DATE(PVSLFECBE) >= '+QuotedStr(dbdtpInicial.Text)+' AND TO_DATE(PVSLFECBE) <= '+QuotedStr(dbdtpFinal.Text)
       +         ' and PVSESTLIQ IN (''02'', ''05'', ''06'') '
       +         ' and A.ASOID=B.ASOID and PVSLBENNR=NROOPE and PVSLFECBE=FOPERAC '
       +        'group by PVSLTIPBE '
       +    ' ) ';
// Fin HPC_201503_PRE   : Se añade a la consulta lo recuperado por el FSC

  DM1.cdsReporte.Close;
  DM1.cdsReporte.DataRequest(xSql);
  DM1.cdsReporte.Open;
  If DM1.cdsReporte.RecordCount = 0 Then
  Begin
    btnImprime.Enabled := False;
    btnaexcel.Enabled  := False;
    Exit;
  End
  Else
  Begin
    btnImprime.Enabled := True;
    btnaexcel.Enabled  := True;
  End;
  dbgcuocre.DataSource := DM1.dsReporte;
  dbgcuocre.Selected.Clear;
// Inicio HPC_201503_PRE   : Se añade a la consulta lo recuperado por el FSC
  //dbgcuocre.Selected.Add('TIPCREID'#9'2'#9'Código de~Crédito'#9#9);
  //dbgcuocre.Selected.Add('TIPCREDES'#9'30'#9'Tipo de~Crédito'#9#9);
  dbgcuocre.Selected.Add('TIPCREDES'#9'38'#9'Concepto de Descuento por Beneficio'#9#9);
  dbgcuocre.Selected.Add('CUERET'#9'4'#9'Cantidad~en Retiro'#9#9);
  dbgcuocre.Selected.Add('MONRET'#9'11'#9'Monto en~Retiro'#9#9);
  dbgcuocre.Selected.Add('CUEFAL'#9'4'#9'Cantidad en~Fallecimiento'#9#9);
  dbgcuocre.Selected.Add('MONFAL'#9'11'#9'Monto en~Fallecimiento'#9#9);
  dbgcuocre.Selected.Add('CUEINV'#9'4'#9'Cantidad en~Invalidez'#9#9);
  dbgcuocre.Selected.Add('MONINV'#9'11'#9'Monto en~Invalidez'#9#9);
  dbgcuocre.Selected.Add('CUETOT'#9'4'#9'Cantidad~Total'#9#9);
  dbgcuocre.Selected.Add('MONTOT'#9'12'#9'Monto~Total'#9#9);
  dbgcuocre.ApplySelected;
// Fin   HPC_201503_PRE   : Se añade a la consulta lo recuperado por el FSC
  TNumericField(DM1.cdsReporte.FieldByName('MONRET')).DisplayFormat := '###,###,##0.00';
  TNumericField(DM1.cdsReporte.FieldByName('MONINV')).DisplayFormat := '###,###,##0.00';
  TNumericField(DM1.cdsReporte.FieldByName('MONFAL')).DisplayFormat := '###,###,##0.00';
  TNumericField(DM1.cdsReporte.FieldByName('MONTOT')).DisplayFormat := '###,###,##0.00';
  TNumericField(DM1.cdsReporte.FieldByName('CUERET')).DisplayFormat := '###,###,##0';
  TNumericField(DM1.cdsReporte.FieldByName('CUEINV')).DisplayFormat := '###,###,##0';
  TNumericField(DM1.cdsReporte.FieldByName('CUEFAL')).DisplayFormat := '###,###,##0';
  TNumericField(DM1.cdsReporte.FieldByName('CUETOT')).DisplayFormat := '###,###,##0';
  cueret := 0; cueinv := 0; cuefal := 0; monret := 0; moninv := 0; monfal := 0;
  DM1.cdsReporte.First;
  While Not DM1.cdsReporte.Eof Do
  Begin
    cueret := cueret + DM1.cdsReporte.FieldByName('CUERET').AsFloat;
    cueinv := cueinv + DM1.cdsReporte.FieldByName('CUEINV').AsFloat;
    cuefal := cuefal + DM1.cdsReporte.FieldByName('CUEFAL').AsFloat;
    monret := monret + DM1.cdsReporte.FieldByName('MONRET').AsFloat;
    moninv := moninv + DM1.cdsReporte.FieldByName('MONINV').AsFloat;
    monfal := monfal + DM1.cdsReporte.FieldByName('MONFAL').AsFloat;
    DM1.cdsReporte.Next;
  End;
  dbgcuocre.ColumnByName('TIPCREDES').FooterValue := 'TOTALES : ';
  dbgcuocre.ColumnByName('CUERET').FooterValue := FormatFloat('###,###',cueret);
  dbgcuocre.ColumnByName('CUEINV').FooterValue := FormatFloat('###,###',cueinv);
  dbgcuocre.ColumnByName('CUEFAL').FooterValue := FormatFloat('###,###',cuefal);
  dbgcuocre.ColumnByName('CUETOT').FooterValue := FormatFloat('###,###',cueret+cueinv+cuefal);
  dbgcuocre.ColumnByName('MONRET').FooterValue := FormatFloat('###,###.#0',monret);
  dbgcuocre.ColumnByName('MONINV').FooterValue := FormatFloat('###,###.#0',moninv);
  dbgcuocre.ColumnByName('MONFAL').FooterValue := FormatFloat('###,###.#0',monfal);
  dbgcuocre.ColumnByName('MONTOT').FooterValue := FormatFloat('###,###.#0',monret+moninv+monfal);
End;




procedure TFcuocrexben.btnaexcelClick(Sender: TObject);
begin
   DM1.HojaExcel('REPORTE', DM1.dsReporte, dbgcuo)
end;

end.
