// Inicio          : HPP_201105_PRE por DFERNANDEZ
// HPC_201307_PRE  : Se añade imagen del nuevo logo institucional
// SPP_201401_PRE  : Se realiza el pase a producción a partir del pase HPC_201307_PRE
// HPC_201709_PRE  : Se modifica la opción de exportar a excel
// HPC_201805_PRE  : Se modifica reporte de tal forma que que se pueda controlar los casos de 
//                   re-liquidaciones 

unit PRE417;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid,
  DB, StrUtils, DBGrids, ppEndUsr, ppParameter, ppBands, ppClass, ppCtrls,
  ppVar, ppPrnabl, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB,
  // Inicio: HPC_201709_PRE 
  // Se añade la unidad para manejo de fechas
  // ppDBPipe, jpeg; // SPP_201401_PRE
  ppDBPipe, jpeg, wwdbdatetimepicker; // SPP_201401_PRE
  // Fin: HPC_201709_PRE

type
  TFRptPagBenDet = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    btnProcesar: TBitBtn;
    // Inicio: HPC_201709_PRE 
    // Se retiran variables de las fechas
    // dtpInicio: TDateTimePicker;
    // dtpFin: TDateTimePicker;
    // Fin: HPC_201709_PRE
    dbgBeneficios: TwwDBGrid;
    pInferior: TPanel;
    lblNroRegEncontrados: TLabel;
    btnAExcel: TBitBtn;
    btnCerrar: TBitBtn;
    btnPrint: TBitBtn;
    // Inicio: HPC_201709_PRE
    // Se retira grid no usado
    // dtgData: TDBGrid;
    // Fin: HPC_201709_PRE 
    ppDBConexion: TppDBPipeline;
    ppPrevio: TppReport;
    ppParameterList1: TppParameterList;
    ppDesignerRun: TppDesigner;
    ppHeaderBand1: TppHeaderBand;
//Inicio: SPP_201401_PRE
    // ppLabel11: TppLabel; 
    // ppLabel12: TppLabel; 
//Fin: SPP_201401_PRE
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppLblTitulo: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel8: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    // Inicio: HPC_201805_PRE
    // Se retiran etiquetas no usadas del reporte
    // ppLabel3: TppLabel;
    // ppDBText12: TppDBText;
    // ppDBCalc9: TppDBCalc;
    // ppDBCalc2: TppDBCalc;
    // Fin: HPC_201805_PRE
    ppLabel7: TppLabel;
    ppLabel9: TppLabel;
    ppLine1: TppLine;
    ppDBText13: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppLine3: TppLine;
    ppLabel16: TppLabel;
    ppDBCalc8: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText1: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBCalc1: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppLabel10: TppLabel;
    ppImage1: TppImage; // SPP_201401_PRE
    // Inicio: HPC_201709_PRE
    // Se crean variables para el control de las fechas de inicio
    // y fecha final
    dtpInicio: TwwDBDateTimePicker;
    dtpFin: TwwDBDateTimePicker;
    dbgAExcel: TDBGrid;
    // Fin: HPC_201709_PRE
    procedure FormActivate(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
    procedure dbgBeneficiosTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure btnAExcelClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    // Inicio: HPC_201709_PRE
    // Se crea nuevo procedimiento para controlar el manejo del teclado
    // en la forma
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    // Fin: HPC_201709_PRE

  private
    // Inicio: HPC_201709_PRE
    // Se crean variables para controlar los procesos de los filtros
    xSql, xSqlAExcel:String;
    // Fin: HPC_201709_PRE
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRptPagBenDet: TFRptPagBenDet;

implementation

uses PREDM;

{$R *.dfm}

procedure TFRptPagBenDet.FormActivate(Sender: TObject);
var cadFecha:Double;//DateTime;
begin
  cadFecha:=DM1.FechaSys;
  dtpInicio.date:=cadFecha;
  dtpFin.date:=cadFecha;
  DM1.cdsQry5.Close;
  DM1.cdsQry6.Close;
end;

procedure TFRptPagBenDet.btnProcesarClick(Sender: TObject);
// Inicio: HPC_201709
// Se retiran variables no usadas
// Var xSql: String;
// MONLIQBEN, MONTOINI, APORTES, INTERES, BONOS, MON_DIF, MON_TAB: Double;
// Inicio: HPC_201805_PRE
// Se retira variable de monto inicial de aporte
// Var MONLIQBEN, MONTOINI, APORTES, INTERES, BONOS, MON_DIF, MON_TAB: Double;
Var MONLIQBEN, APORTES, INTERES, BONOS, MON_DIF, MON_TAB: Double;
// Fin: HPC_201805_PRE
// Fin: HPC_201709


begin
  // Inicio: HPC_201805_PRE
  // Se modifica reporte de beneficio por UGEL
  // xSql := 'SELECT ''' + DateToStr(dtpInicio.Date) + ' AL ' + DateToStr(dtpFin.Date) + ''' TITULO,'
  //   + '    DPTODES, USENOM,'
  //   + '    ASODNI, ASOAPENOMDNI, BENEFDES, MAX(MONLIQBEN) MONLIQBEN,'
  //   + '    SUM(NVL(MONTOINI,0)) MONTOINI,'
  //   + '    SUM(NVL(APORTES,0)) APORTES,'
  //   + '    SUM(NVL(INTERES,0)) INTERES,'
  //   + '    SUM(NVL(BONOS,0)) BONOS,'
  //   + '    SUM(NVL(MON_DIF,0)) MON_DIF,'
  //    + '    SUM(NVL(MON_TAB,0)) MON_TAB '
  //   + 'FROM'
  //   + '    (SELECT D.DPTODES, U.USENOM, A.PVSLBENNR, A.ASODNI, A.ASOAPENOMDNI, A.MONLIQBEN, C.BENEFDES,'
  //   // Inicio: HPC_201709_PRE
  //   // Se modifica la opción del case para leer los aportes iniciales
  //   // + '    CASE WHEN SUBSTR(B.PVSLCONCE,1,10) = ''APORTES AL'' THEN PVSLMONTO END MONTOINI,'
  //   + '    CASE WHEN SUBSTR(B.PVSLCONCE,1,9) = ''APORTES A'' THEN PVSLMONTO END MONTOINI,'
  //   // Fin: HPC_201709_PRE
  //   + '    CASE WHEN SUBSTR(B.PVSLCONCE,1,11) = ''APORTES DEL'' THEN PVSLMONTO END APORTES,'
  //   + '    CASE WHEN SUBSTR(B.PVSLCONCE,1,9) = ''INTERESES'' THEN PVSLMONTO END INTERES,'
  //   + '    CASE WHEN SUBSTR(B.PVSLCONCE,1,5) = ''BONOS'' THEN PVSLMONTO END BONOS,'
  //   + '    CASE WHEN SUBSTR(B.PVSLCONCE,1,17) = ''MONTO DIFERENCIAL'' THEN PVSLMONTO END MON_DIF,'
  //   + '    CASE WHEN SUBSTR(B.PVSLCONCE,1,18) = ''BENEFICIO ASIGNADO'' THEN PVSLMONTO END MON_TAB'
  //   + '    FROM'
  //   + '        PVS306 A'
  //   + '            INNER JOIN'
  //   + '        PVS307 B ON'
  //   + '        A.PVSLBENNR = B.PVSLBENNR'
  //   + '            INNER JOIN'
  //   + '        TGE186 C ON'
  //   + '        A.PVSLTIPBE = C.TIPBENEF'
  //   + '            INNER JOIN'
  //   + '        TGE158 D ON'
  //   + '        SUBSTR(A.ZIPID,1,2) = D.DPTOID'
  //   + '            INNER JOIN'
  //   + '        APO101 U ON'
  //   + '        A.UPROID = U.UPROID'
  //   + '        AND A.UPAGOID = U.UPAGOID'
  //   + '        AND A.USEID = U.USEID'
  //   + '    WHERE'
  //   + '        A.PVSLFECBE BETWEEN ' + QuotedStr(DateToStr(dtpInicio.Date)) + ' AND ' + QuotedStr(DateToStr(dtpFin.Date))
  //   + '        AND A.PVSESTLIQ NOT IN (''04'', ''13'')'
  //   + '        AND B.PVSLAGRID = ''DET'') '
  //   + 'GROUP BY DPTODES, USENOM, ASODNI, ASOAPENOMDNI, BENEFDES, PVSLBENNR '
  //   + 'ORDER BY DPTODES, USENOM';
   xSql :=' SELECT PVSLBENNR, TITULO, DPTODES, USENOM, ASODNI, ASOAPENOMDNI, BENEFDES, MAX(MONLIQBEN) MONLIQBEN, MAX(MONPAG) MONPAG,'
   +' SUM(MON_TAB) MON_TAB,  SUM(APORTES) APORTES,  SUM(INTERES) INTERES, SUM(BONOS) BONOS, SUM(MON_DIF) MON_DIF FROM'
   +' (SELECT A.PVSLBENNR, ''' + DateToStr(dtpInicio.Date) + ' AL ' + DateToStr(dtpFin.Date) + ''' TITULO, D.DPTODES, F.USENOM, C.ASODNI,'
   +' C.ASOAPENOMDNI, E.BENEFABR||CASE WHEN A.PVSESTLIQ = ''05'' THEN '' (RE)''  ELSE NULL END BENEFDES,'
   +' A.MONLIQBEN, A.MONPAG,'
   +' CASE WHEN B.TIPDES IN (''BF'',''BI'',''BR'') THEN B.PVSLMONTO ELSE 0 END MON_TAB,'
   +' CASE WHEN B.TIPDES = ''FA'' AND A.PVSESTLIQ <> ''05'' THEN B.PVSLMONTO ELSE 0 END APORTES,'
   +' CASE WHEN B.TIPDES = ''FI'' AND A.PVSESTLIQ <> ''05'' THEN B.PVSLMONTO ELSE 0 END INTERES,'
   +' CASE WHEN B.TIPDES = ''FB'' AND A.PVSESTLIQ <> ''05'' THEN B.PVSLMONTO ELSE 0 END BONOS,'
   +' CASE WHEN B.TIPDES = ''MD'' AND A.PVSESTLIQ <> ''05'' THEN B.PVSLMONTO ELSE 0 END MON_DIF'
   +' FROM PVS306 A, PVS307 B, APO201 C, APO158 D, TGE186 E, APO101 F'
   +' WHERE A.PVSLFECBE BETWEEN '+QuotedStr(dtpInicio.Text)+' AND '+QuotedStr(dtpFin.Text)
   +' AND A.PVSESTLIQ NOT IN (''04'', ''13'') AND A.PVSLBENNR = B.PVSLBENNR'
   +' AND A.ASOID = C.ASOID AND C.UPROID = F.UPROID AND C.UPAGOID = F.UPAGOID AND C.USEID = F.USEID'
   +' AND A.PVSLTIPBE = E.TIPBENEF AND F.DPTOID = D.DPTOID'
   +' ) GROUP BY PVSLBENNR, TITULO, DPTODES, USENOM, ASODNI, ASOAPENOMDNI, BENEFDES'
   +' ORDER BY PVSLBENNR';
   // Fin: HPC_201805_PRE
  // Inicio: HPC_201709_PRE
  // Se actualiza variables para el grid y exportar a excel
  xSqlAExcel := xSql;
  // Fin: HPC_201709_PRE
  DM1.cdsQry6.Close;
  DM1.cdsQry6.DataRequest(xSql);
  DM1.cdsQry6.Open;

  MONLIQBEN := 0;
  // Inicio: HPC_201805_PRE
  // Se retira variable que totaliza monto inicial de aportes
  // MONTOINI := 0;
  // Fin: HPC_201805_PRE
  APORTES := 0;
  INTERES := 0;
  BONOS := 0;
  MON_DIF := 0;
  MON_TAB := 0;

  if DM1.cdsQry6.RecordCount > 0 then
  begin
    DM1.cdsQry6.First;
    While not DM1.cdsQry6.Eof Do
    Begin
      MONLIQBEN := MONLIQBEN + DM1.cdsQry6.FieldByName('MONLIQBEN').AsFloat;
      // Inicio: HPC_201805_PRE
      // Se retira variable que totaliza monto inicial de aportes
      // MONTOINI := MONTOINI + DM1.cdsQry6.FieldByName('MONTOINI').AsFloat;
      // Fin: HPC_201805_PRE
      APORTES := APORTES + DM1.cdsQry6.FieldByName('APORTES').AsFloat;
      INTERES := INTERES + DM1.cdsQry6.FieldByName('INTERES').AsFloat;
      BONOS := BONOS + DM1.cdsQry6.FieldByName('BONOS').AsFloat;
      MON_DIF := MON_DIF + DM1.cdsQry6.FieldByName('MON_DIF').AsFloat;
      MON_TAB := MON_TAB + DM1.cdsQry6.FieldByName('MON_TAB').AsFloat;
      
      DM1.cdsQry6.Next;
    End;
    // Inicio: HPC_201709_PRE
    // Se modifica la descripción de las columnas del grid
    dbgBeneficios.Selected.Clear;
    // dbgliqben.Selected.Add('PVSLBENNR'#9'11'#9'Número de~la liquidación'#9#9);
    dbgBeneficios.Selected.Add('DPTODES'#9'18'#9'DEPARTAMENTO'#9);
    dbgBeneficios.Selected.Add ('USENOM'#9'32'#9'UGEL'#9);
    dbgBeneficios.Selected.Add('ASODNI'#9'10'#9'DNI'#9);
    dbgBeneficios.Selected.Add('ASOAPENOMDNI'#9'40'#9'APELLIDOS Y NOMBRES DNI'#9);
    dbgBeneficios.Selected.Add('BENEFDES'#9'10'#9'TIPO BENEFICIO'#9);
    // dbgBeneficios.Selected.Add('MONLIQBEN'#9'12'#9'LIQUIDACION'#9'F'#9'MONTO DE'#9);
    dbgBeneficios.Selected.Add('MONLIQBEN'#9'11'#9'MONTO DE LA~LIQUIDACIÓN'#9#9);
    // dbgBeneficios.Selected.Add('MONTOINI'#9'12'#9'31/12/1996'#9'F'#9'MONTO AL'#9);
    // Inicio: HPC_201805_PRE
    // Se retira variable que totaliza monto inicial de aportes
    // dbgBeneficios.Selected.Add('MONTOINI'#9'11'#9'MONTO AL~31/12/1996'#9#9);
    // Fin: HPC_201805_PRE
    dbgBeneficios.Selected.Add('APORTES'#9'12'#9'APORTES'#9);
    dbgBeneficios.Selected.Add('INTERES'#9'12'#9'INTERES'#9);
    dbgBeneficios.Selected.Add('BONOS'#9'12'#9'BONOS'#9);
    // dbgBeneficios.Selected.Add('MON_DIF'#9'12'#9'DIFERENCIAL'#9'F'#9'MONTO'#9);
    dbgBeneficios.Selected.Add('MON_DIF'#9'11'#9'MONTO~DIFERENCIAL'#9#9);
    // dbgBeneficios.Selected.Add('MON_TAB'#9'12'#9'SEGUN TABLA'#9'F'#9'MONTO'#9);
     dbgBeneficios.Selected.Add('MON_TAB'#9'11'#9'MONTO SEGUN~TABLA'#9#9);
    dbgBeneficios.ApplySelected;
    // Fin: HPC_201709_PRE
    TNumericField(DM1.cdsQry6.FieldByName('MONLIQBEN')).DisplayFormat := '###,###,##0.00';
    // Inicio: HPC_201805_PRE
    // Se retira variable que totaliza monto inicial de aportes
    // TNumericField(DM1.cdsQry6.FieldByName('MONTOINI')).DisplayFormat := '###,###,##0.00';
    // Fin: HPC_201805_PRE
    TNumericField(DM1.cdsQry6.FieldByName('APORTES')).DisplayFormat := '###,###,##0.00';
    TNumericField(DM1.cdsQry6.FieldByName('INTERES')).DisplayFormat := '###,###,##0.00';
    TNumericField(DM1.cdsQry6.FieldByName('BONOS')).DisplayFormat := '###,###,##0.00';
    TNumericField(DM1.cdsQry6.FieldByName('MON_DIF')).DisplayFormat := '###,###,##0.00';
    TNumericField(DM1.cdsQry6.FieldByName('MON_TAB')).DisplayFormat := '###,###,##0.00';

    dbgBeneficios.ColumnByName('DPTODES').FooterValue := 'TOTAL';
    dbgBeneficios.ColumnByName('MONLIQBEN').FooterValue := FloatTostrf(MONLIQBEN,ffnumber,15,2);
    // Inicio: HPC_201805_PRE
    // Se retira variable que totaliza monto inicial de aportes
    // dbgBeneficios.ColumnByName('MONTOINI').FooterValue := FloatTostrf(MONTOINI,ffnumber,15,2);
    // Fin: HPC_201805_PRE
    dbgBeneficios.ColumnByName('APORTES').FooterValue := FloatTostrf(APORTES,ffnumber,15,2);
    dbgBeneficios.ColumnByName('INTERES').FooterValue := FloatTostrf(INTERES,ffnumber,15,2);
    dbgBeneficios.ColumnByName('BONOS').FooterValue := FloatTostrf(BONOS,ffnumber,15,2);
    dbgBeneficios.ColumnByName('MON_DIF').FooterValue := FloatTostrf(MON_DIF,ffnumber,15,2);
    dbgBeneficios.ColumnByName('MON_TAB').FooterValue := FloatTostrf(MON_TAB,ffnumber,15,2);
    dbgBeneficios.RefreshDisplay;

    lblNroRegEncontrados.Caption := FloatToStr(DM1.cdsQry6.RecordCount) + ' registros encontrados';

    btnPrint.Enabled := true;
    btnAExcel.Enabled := true;
  end
  else
  begin
    dbgBeneficios.Selected.Clear;
    dbgBeneficios.Selected.Add('DPTODES'#9'18'#9'DEPARTAMENTO'#9);
    dbgBeneficios.Selected.Add('USENOM'#9'32'#9'UGEL'#9);
    dbgBeneficios.Selected.Add('ASODNI'#9'10'#9'DNI'#9);
    dbgBeneficios.Selected.Add('ASOAPENOMDNI'#9'40'#9'APELLIDOS Y NOMBRES DNI'#9);
    dbgBeneficios.Selected.Add('BENEFDES'#9'10'#9'TIPO BENEFICIO'#9);
    dbgBeneficios.Selected.Add('MONLIQBEN'#9'12'#9'LIQUIDACION'#9'F'#9'MONTO DE'#9);
    // Inicio: HPC_201805_PRE
    // Se retira variable que totaliza monto inicial de aportes
    // dbgBeneficios.Selected.Add('MONTOINI'#9'12'#9'31/12/1996'#9'F'#9'MONTO AL'#9);
    // Fin: HPC_201805_PRE
    dbgBeneficios.Selected.Add('APORTES'#9'12'#9'APORTES'#9);
    dbgBeneficios.Selected.Add('INTERES'#9'12'#9'INTERES'#9);
    dbgBeneficios.Selected.Add('BONOS'#9'12'#9'BONOS'#9);
    dbgBeneficios.Selected.Add('MON_DIF'#9'12'#9'DIFERENCIAL'#9'F'#9'MONTO'#9);
    dbgBeneficios.Selected.Add('MON_TAB'#9'12'#9'SEGUN TABLA'#9'F'#9'MONTO'#9);
    dbgBeneficios.ApplySelected;

    dbgBeneficios.ColumnByName('DPTODES').FooterValue := '';
    dbgBeneficios.ColumnByName('MONLIQBEN').FooterValue := FloatTostrf(MONLIQBEN,ffnumber,15,2);
    // Inicio: HPC_201805_PRE
    // Se retira variable que totaliza monto inicial de aportes
    // dbgBeneficios.ColumnByName('MONTOINI').FooterValue := FloatTostrf(MONTOINI,ffnumber,15,2);
    // Fin: HPC_201805_PRE
    dbgBeneficios.ColumnByName('APORTES').FooterValue := FloatTostrf(APORTES,ffnumber,15,2);
    dbgBeneficios.ColumnByName('INTERES').FooterValue := FloatTostrf(INTERES,ffnumber,15,2);
    dbgBeneficios.ColumnByName('BONOS').FooterValue := FloatTostrf(BONOS,ffnumber,15,2);
    dbgBeneficios.ColumnByName('MON_DIF').FooterValue := FloatTostrf(MON_DIF,ffnumber,15,2);
    dbgBeneficios.ColumnByName('MON_TAB').FooterValue := FloatTostrf(MON_TAB,ffnumber,15,2);
    dbgBeneficios.RefreshDisplay;

    lblNroRegEncontrados.Caption := '0 registros encontrados';

    btnPrint.Enabled := false;
    btnAExcel.Enabled := false;
  end;
end;

procedure TFRptPagBenDet.dbgBeneficiosTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  DM1.cdsQry6.IndexFieldNames := AFieldName;
end;

procedure TFRptPagBenDet.btnAExcelClick(Sender: TObject);
  function fechaCadena(cad:string):string;
  begin
    result:= MidStr(cad,7,4)+MidStr(cad,4,2)+MidStr(cad,1,2)
  end;
begin
   // Inicio: HPC_201709_PRE
   // Nueva exportación a excel
   DM1.cdsReporte1.Close;
   DM1.cdsReporte1.DataRequest(xSqlAExcel);
   DM1.cdsReporte1.Open;
   DM1.HojaExcel('PRE_DET_BENXDPTOUGEL',DM1.dsReporte1, dbgAExcel)
   // DM1.HojaExcel(fechaCadena(DateToStr(dtpInicio.Date))+'-'+fechaCadena(DateToStr(dtpFin.Date)), dbgBeneficios.DataSource, dtgData);
   // Fin: HPC_201709_PRE
end;

procedure TFRptPagBenDet.btnPrintClick(Sender: TObject);
begin
  ppPrevio.Print;
  ppPrevio.Stop;

end;
// Fin: HPP_201105_PRE por DFERNANDEZ

// Inicio: HPC_201709_PRE
// Control para el uso del teclado en la forma
procedure TFRptPagBenDet.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  begin
    Key := #0;
    Perform(CM_DIALOGKEY, VK_TAB, 0);
  end;
end;
// Fin: HPC_201709_PRE

end.
