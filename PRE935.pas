Unit PRE935;
// Inicio Uso Estándares: 01/08/2011
// Unidad               : PRE935
// Formulario           : FrmGeneraCtaIndividualPDF
// Fecha de Creación    : 16/07/2014
// Autor                : Area de desarrollo de sistemas.
// Objetivo             : Cuenta Individual
//
// Actualizaciones      :

// Inicio: HPP_200909_PRE por JDCRUZ
// Memorándum 308-2009-DM-EPS - SAR-2009-0726 - DAD-JD-2009-0140
// COLOCAR FECHA DE ULTIMO APORTE
// SE AGREGO EL SIGUIENTE CONTROL EN EL REPORTE pprresest
// pplblMsj1

// Memorándum 322-2009-DM-EPS - SAR-2009-0763 - DAD-JD-2009-0142
// COLOCAR NIVEL DEL CENTRO EDUCATIVO
// pplcpoNIVEDU
// Fin: HPP_200909_PRE
// HPC_201301_PRE : Modificaciones del formato de impresion
// SPP_201302_PRE : Se realiza el pase a producción a partir del HPC_201301_PRE
// HPC_201402_PRE : Se modifica la impresión del reporte de cta. ind. en papel pre-impreso.
// SPP_201403_PRE : Se realiza el pase a producción a partir del pase HPC_201402_PRE.
// HPC_201505_PRE     : Agregar en Consultas aplicaciones de CCI
// HPC_201704_PRE : Se modifica reporte estadistico de cuenta individual
// HPC_201706_PRE : Se añade reporte para impresión de la cuenta individual sin formato pre-impreso.

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, DB, DBClient,
   ppBands, ppClass, ppCtrls, ppVar, ppPrnabl, ppCache, ppProd, ppReport,
   ppComm, ppRelatv, ppDB, ppDBPipe, ExtCtrls, ppParameter, ppStrtch,
   ppSubRpt, ppDBBDE, ppChrtDP, DbChart, ppChrt, Series, TeEngine,
   jpeg,
   ppMemo,
   TeeProcs, Chart, StrUtils,
   Printers,
   // Inicio: HPC_201706_PRE 
   // Se añade variables para nuevo reporte de cuenta individual y se retira reporte
   // antiguo.
   Dateutils, ppEndUsr, ppRichTx, DBGrids, ppRegion;
Type
   TFrmGeneraCtaIndividualPDF = Class(TForm)
      ppdbRepLiqxFallec: TppDBPipeline;
      Image1: TImage;
      Chart1: TChart;
      Series1: TPieSeries;
      ppBDEdetapo: TppBDEPipeline;
     // Se retiran variables no usadas del reporte que se elimino.
     // pprresest: TppReport;
     // ppHeaderBand7: TppHeaderBand;
    // ppShape8: TppShape;
    // ppShape7: TppShape;
    // ppShape6: TppShape;
    // ppShape5: TppShape;
    // // Inicio: HPC_201704_PRE
    // // Se retiran variables ya no usadas en el reporte
    // // ppLabel236: TppLabel;
    // // ppLabel237: TppLabel;
    // // ppLabel238: TppLabel;
    // // ppLabel239: TppLabel;
    // // ppLabel240: TppLabel;
    // // ppLabel241: TppLabel;
    // // ppLabel242: TppLabel;
    // // ppLabel243: TppLabel;
    // // ppLabel244: TppLabel;
    // // ppLabel245: TppLabel;
    // // ppLabel246: TppLabel;
    // // ppLabel247: TppLabel;
    // // pplasoapenomdni_nc: TppLabel;
    // // pplasodir_nc: TppLabel;
    // // pplasodni_nc: TppLabel;
    // // ppldst_nc: TppLabel;
    // // pplprv_nc: TppLabel;
    // // ppldep_nc: TppLabel;
    // // ppLabel234: TppLabel;
    // // ppLabel235: TppLabel;
    // // pplasotelf1_nc: TppLabel;
    // // ppLabel249: TppLabel;
    // // ppLabel250: TppLabel;
    // // ppLabel251: TppLabel;
    // // ppLabel252: TppLabel;
    // // ppLabel253: TppLabel;
    // // ppLabel254: TppLabel;
    // // ppLabel264: TppLabel;
    // // ppLabel266: TppLabel;
    // // pplasocodmod_nc: TppLabel;
    // // pplunipro_nc: TppLabel;
    // // ppLabel255: TppLabel;
    // // ppLabel256: TppLabel;
    // // ppLabel257: TppLabel;
    // // ppldstdeslab_nc: TppLabel;
    // // ppLabel259: TppLabel;
    // // ppLabel260: TppLabel;
    // // pplprvdeslab_nc: TppLabel;
    // // ppLabel262: TppLabel;
    // // ppLabel263: TppLabel;
    // // ppldepdeslab_nc: TppLabel;
    // // ppLabel270: TppLabel;
    // // ppLabel271: TppLabel;
    // // ppluniges_nc: TppLabel;
    // // pplunipag_nc: TppLabel;
    // // ppLabel274: TppLabel;
    // // ppLabel275: TppLabel;
    // // ppLabel276: TppLabel;
    // // pplasodeslab_nc: TppLabel;
    // // pplasodirleb_nc: TppLabel;
    // // pplasofresnom_nc: TppLabel;
    // // ppLabel280: TppLabel;
    // // pplasoresnom_nc: TppLabel;
    // // ppLabel231: TppLabel;
    // // pplanoapo_nc: TppLabel;
    // // Fin: HPC_201704_PRE
    // ppShape4: TppShape;
    // ppLabel232: TppLabel;
    // ppLabel233: TppLabel;
    // ppLabel248: TppLabel;
    // ppLabel258: TppLabel;
    // ppLabel261: TppLabel;
    // ppShape9: TppShape;
    // ppShape11: TppShape;
    // ppShape10: TppShape;
    // ppShape12: TppShape;
    // ppShape13: TppShape;
    // ppldesini: TppLabel;
    // pplapoini: TppLabel;
    // pplintini: TppLabel;
    // pplbonini: TppLabel;
    // pplsalini: TppLabel;
    // // Inicio: HPC_201704_PRE
    // // Se retira variable ya no usada.
    // // ppLabel50: TppLabel;
    // // Fin: HPC_201704_PRE
    // ppDetailBand12: TppDetailBand;
    // ppDBText28: TppDBText;
    // ppDBText29: TppDBText;
    // ppDBText30: TppDBText;
    // ppDBText40: TppDBText;
    // ppShape2: TppShape;
    // ppShape3: TppShape;
    // ppShape14: TppShape;
    // ppShape15: TppShape;
    // ppShape16: TppShape;
    // ppShape21: TppShape;
    // pplanomes: TppLabel;
    // ppSummaryBand7: TppSummaryBand;
    // ppShape17: TppShape;
    // ppShape20: TppShape;
    // Inicio: HPC_201704_PRE
    // Se retira variable ya no usada.
    // ppLabel163: TppLabel;
    // Fin: HPC_201704_PRE

    ppShape18: TppShape;
    ppShape19: TppShape;
    ppShape22: TppShape;
    pplapofin: TppLabel;
    pplintfin: TppLabel;
    pplbonfin: TppLabel;
    pplsalfin: TppLabel;
    ppImage3: TppImage;
    pplsaldoal: TppLabel;
    ppParameterList2: TppParameterList;
    ppShape23: TppShape;

    // Inicio: HPC_201704_PRE
    // Retirar variables no usadas
    // pplultaporte: TppLabel;
    // // Inicio: SPP_201302_PRE
    // pplblAsoSinFirma: TppLabel;
    // Fin: HPC_201704_PRE



// Fin: SPP_201302_PRE
// Inicio HPC_201505_PRE     : Agregar en Consultas aplicaciones de CCI
    ppdbCCI: TppBDEPipeline;
    ppdbCCIDet: TppBDEPipeline;
    ppdbCCIDetppField1: TppField;
    ppdbCCIDetppField2: TppField;
    ppdbCCIDetppField3: TppField;
    ppdbCCIDetppField4: TppField;
    ppdbCCIDetppField5: TppField;
    ppdbCCIDetppField6: TppField;

    ppFooterBand1: TppFooterBand;
    // Inicio: HPC_201704_PRE
    // Se retiran variables no usadas
    // ppSubReport2: TppSubReport;
    // ppChildReport4: TppChildReport;
    // ppTitleBand4: TppTitleBand;
    // ppDetailBand7: TppDetailBand;
    // ppShape28: TppShape;
    // ppDBText42: TppDBText;
    // ppSummaryBand11: TppSummaryBand;
    // Fin: HPC_201704_PRE
    // ppShape27: TppShape;
    // ppLabel13: TppLabel;
    // // Inicio: HPC_201704_PRE
    // // Se modifican variables del reporte
    // pplfechaimpresion: TppLabel;
    // ppLabel202: TppLabel;
    // ppLabel204: TppLabel;
    // pplnofirmores: TppLabel;
    // ppLabel25: TppLabel;
    // ppLabel196: TppLabel;
    // ppLabel205: TppLabel;
    // ppLabel203: TppLabel;
    // ppLabel206: TppLabel;
    // ppltotsalpenpagest: TppLabel;
    // ppLabel5: TppLabel;
    // ppLabel6: TppLabel;
    // ppLabel7: TppLabel;
    // ppLabel8: TppLabel;
    // ppLabel9: TppLabel;
    // ppLabel10: TppLabel;
    // ppLabel11: TppLabel;
    // ppLabel12: TppLabel;
    // Se añade variables del nuevo reporte creado
    pprestsinforlot: TppReport;
    ppDetailBand7: TppDetailBand;
    ppShape39: TppShape;
    ppShape2: TppShape;
    ppShape40: TppShape;
    ppShape38: TppShape;
    ppShape37: TppShape;
    ppSubReport2: TppSubReport;
    ppChildReport4: TppChildReport;
    ppDetailBand14: TppDetailBand;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppDBText57: TppDBText;
    pplanomes_sf: TppLabel;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLine58: TppLine;
    ppLine59: TppLine;
    ppLine60: TppLine;
    ppLine61: TppLine;
    ppLine62: TppLine;
    ppLine63: TppLine;
    ppImage6: TppImage;
    pplFechaImp_sf: TppLabel;
    ppLabel308: TppLabel;
    ppLabel309: TppLabel;
    ppLabel310: TppLabel;
    ppLabel311: TppLabel;
    ppLabel312: TppLabel;
    ppLabel313: TppLabel;
    ppLabel314: TppLabel;
    ppLabel315: TppLabel;
    ppLabel316: TppLabel;
    ppltotsalpenpagest_sf: TppLabel;
    pplsaldoal_sf: TppLabel;
    ppShape43: TppShape;
    ppShape44: TppShape;
    ppLabel318: TppLabel;
    ppShape45: TppShape;
    ppShape46: TppShape;
    ppShape47: TppShape;
    pplapofin_sf: TppLabel;
    pplintfin_sf: TppLabel;
    pplbonfin_sf: TppLabel;
    pplsalfin_sf: TppLabel;
    ppShape30: TppShape;
    ppShape31: TppShape;
    ppShape32: TppShape;
    ppShape33: TppShape;
    ppLabel166: TppLabel;
    ppLabel223: TppLabel;
    ppLabel225: TppLabel;
    ppLabel227: TppLabel;
    ppLabel228: TppLabel;
    ppLabel229: TppLabel;
    ppLabel230: TppLabel;
    ppLabel231: TppLabel;
    pplasoapenomdni_sf: TppLabel;
    pplasodni_sf: TppLabel;
    pplasodir_sf: TppLabel;
    ppldst_sf: TppLabel;
    ppLabel250: TppLabel;
    ppLabel251: TppLabel;
    pplasotelf1_sf: TppLabel;
    ppLabel254: TppLabel;
    ppLabel259: TppLabel;
    ppLabel260: TppLabel;
    pplasocodmod_sf: TppLabel;
    ppLabel263: TppLabel;
    ppLabel265: TppLabel;
    ppLabel266: TppLabel;
    ppldstdeslab_sf: TppLabel;
    ppLabel268: TppLabel;
    pplasodeslab_sf: TppLabel;
    pplasofresnom_sf: TppLabel;
    ppLabel272: TppLabel;
    ppShape34: TppShape;
    ppLabel273: TppLabel;
    ppLabel274: TppLabel;
    ppLabel275: TppLabel;
    ppLabel276: TppLabel;
    ppLabel277: TppLabel;
    pplcpocenedu_sf: TppLabel;
    ppLabel285: TppLabel;
    ppLabel286: TppLabel;
    ppLabel287: TppLabel;
    ppLabel288: TppLabel;
    pplcpoNIVEDU_sf: TppLabel;
    pplasotelf2_sf: TppLabel;
    ppLabel291: TppLabel;
    ppLabel292: TppLabel;
    pplanonomest_sf: TppLabel;
    ppLabel294: TppLabel;
    ppLabel295: TppLabel;
    ppLabel296: TppLabel;
    ppLabel297: TppLabel;
    ppLabel298: TppLabel;
    pplasoresnomest_sf: TppLabel;
    ppLabel300: TppLabel;
    ppLabel301: TppLabel;
    ppLabel302: TppLabel;
    ppluniges_sf: TppLabel;
    pplultapoest_sf: TppLabel;
    pplfecautdesest_sf: TppLabel;
    ppImage8: TppImage;
    ppLabel306: TppLabel;
    ppLabel326: TppLabel;
    ppLabel327: TppLabel;
    ppLabel328: TppLabel;
    ppLabel329: TppLabel;
    ppLine5: TppLine;
    ppLine7: TppLine;
    ppLine23: TppLine;
    ppLine27: TppLine;
    ppLine30: TppLine;
    ppLine31: TppLine;
    ppLabel330: TppLabel;
    ppLabel331: TppLabel;
    ppShape41: TppShape;
    ppLabel244: TppLabel;
    ppLabel245: TppLabel;
    pplrenacu_sf: TppLabel;
    ppImage9: TppImage;
    ppParameterList4: TppParameterList;
    pprresestconfor: TppReport;
    ppHeaderBand7: TppHeaderBand;
    ppShape8: TppShape;
    ppShape7: TppShape;
    ppShape6: TppShape;
    ppShape5: TppShape;
    ppLabel236: TppLabel;
    ppLabel237: TppLabel;
    ppLabel238: TppLabel;
    ppLabel239: TppLabel;
    ppLabel240: TppLabel;
    ppLabel241: TppLabel;
    ppLabel242: TppLabel;
    ppLabel243: TppLabel;
    pplasoapenomdni_nc: TppLabel;
    pplasodni_nc: TppLabel;
    pplasodir_nc: TppLabel;
    ppldst_nc: TppLabel;
    // Se retiran variable del reporte
    // ppLabel18: TppLabel;
    // ppLabel19: TppLabel;
    ppLabel234: TppLabel;
    ppLabel235: TppLabel;
    pplasotelf1_nc: TppLabel;
    ppLabel249: TppLabel;
    ppLabel253: TppLabel;
    ppLabel264: TppLabel;
    pplasocodmod_nc: TppLabel;
    ppLabel255: TppLabel;
    ppLabel256: TppLabel;
    ppLabel257: TppLabel;
    ppldstdeslab_nc: TppLabel;
    ppLabel271: TppLabel;
    pplasodeslab_nc: TppLabel;
    pplasofresnom_nc: TppLabel;
    ppLabel280: TppLabel;
    ppShape4: TppShape;
    ppLabel232: TppLabel;
    ppLabel233: TppLabel;
    ppLabel248: TppLabel;
    ppLabel258: TppLabel;
    ppLabel261: TppLabel;
    pplcpocenedu: TppLabel;
    ppLabel87: TppLabel;
    ppLabel163: TppLabel;
    ppLabel167: TppLabel;
    ppLabel169: TppLabel;
    pplcpoNIVEDU: TppLabel;
    pplasotelf2_nc: TppLabel;
    ppLabel20: TppLabel;
    ppLabel22: TppLabel;
    pplanonomest: TppLabel;
    ppLabel26: TppLabel;
    ppLabel50: TppLabel;
    ppLabel176: TppLabel;
    ppLabel177: TppLabel;
    ppLabel178: TppLabel;
    pplasoresnom_nc: TppLabel;
    ppLabel199: TppLabel;
    ppLabel200: TppLabel;
    ppLabel201: TppLabel;
    ppluniges_nc: TppLabel;
    pplultaporte: TppLabel;
    pplfecautdesest: TppLabel;
    ppDetailBand12: TppDetailBand;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText40: TppDBText;
    ppShape3: TppShape;
    ppShape9: TppShape;
    ppShape14: TppShape;
    ppShape15: TppShape;
    ppShape16: TppShape;
    ppShape21: TppShape;
    pplanomes_cf: TppLabel;
    // ppFooterBand1: TppFooterBand;
    // ppImage3: TppImage;
    pplfechaimpresion: TppLabel;
    ppLabel202: TppLabel;
    ppLabel204: TppLabel;
    pplnofirmores: TppLabel;
    ppLabel13: TppLabel;
    ppLabel25: TppLabel;
    ppLabel196: TppLabel;
    ppLabel205: TppLabel;
    ppLabel203: TppLabel;
    ppLabel206: TppLabel;
    ppSummaryBand7: TppSummaryBand;
    ppShape17: TppShape;
    ppShape20: TppShape;
    ppLabel170: TppLabel;
    // ppShape18: TppShape;
    // ppShape19: TppShape;
    // ppShape22: TppShape;
    // pplapofin: TppLabel;
    // pplintfin: TppLabel;
    // pplbonfin: TppLabel;
    // pplsalfin: TppLabel;
    ppRegion1: TppRegion;
    // ppShape23: TppShape;
    ppltotsalpenpagest: TppLabel;
    pplrenacu_cn: TppLabel;
    // pplsaldoal: TppLabel;
    // ppParameterList2: TppParameterList;
    // Fin: HPC_201704_PRE
// fin HPC_201505_PRE     : Agregar en Consultas aplicaciones de CCI
//
    // Fin: HPC_201706_PRE
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    // Inicio: HPC_201706_PRE
    // Procedure pplanomesPrint(Sender: TObject);
    Procedure pplanomes_cfPrint(Sender: TObject);
    // Fin: HPC_201706_PRE
   Private
      xSaldoInicio : string;
      xSaldoFin : string;

   Public
      xanomesnom, xanomesces, xSql, anoultapo, mesultapo: String;
      // Inicio: HPC_201706_PRE 
      // Se añade la variable xmonpen (para almacenar el monto pendiente de pago)
      // xaportes, xbonus, xinteres, xmonini: Double;
      xmonpen, xaportes, xbonus, xinteres, xmonini: Double;
      // Fin: HPC_201706_PRE

      Function generarData(): String;
      Procedure generarReporte(INro: integer);
      // Inicio: HPC_201706_PRE
      // Se crea procedimiento para generar reporte sin formato
      Procedure generarReportesinfor(INro: integer);
      // Fin: HPC_201706_PRE

   End;

Var
   fmstapo: TFrmGeneraCtaIndividualPDF;

Implementation

Uses PREDM, VCLCom;
{$R *.dfm}
(*****************************************************************************)
(*****************************************************************************)

Function TFrmGeneraCtaIndividualPDF.generarData(): String;
Var
   fechaNombramiento: String;
   xContinua: boolean;
   xContador, xcontador2: integer;
Begin

   (********************
   // PARA IGUALARLO A LOS 24 MESES
   xSql := 'SELECT TO_CHAR(SYSDATE, ''YYYYMM'') ANOMESACT FROM DUAL';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   DM1.xanomesact := DM1.cdsQry.FieldByName('ANOMESACT').AsString;

   xSql := 'SELECT MAX(APOSEC) APOSEC FROM APO301 WHERE ASOID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString);
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   DM1.anoultapo := Copy(DM1.cdsQry.FieldByName('APOSEC').AsString, 1, 4);
   DM1.mesultapo := Copy(DM1.cdsQry.FieldByName('APOSEC').AsString, 5, 2);
   DM1.xanomesultapo := DM1.cdsQry.FieldByName('APOSEC').AsString;
   DM1.xanomestop := inttostr(StrToInt(DM1.anoultapo) + 2) + DM1.mesultapo;
   //DM1.asofrescese   := DateToStr(DM1.FECHASYS); PARA REVISAR

   IF DM1.xanomestop > DM1.xanomesact THEN
      DM1.asofrescese := '28/' + Copy(DM1.xanomesact, 5, 2) + '/' + Copy(DM1.xanomesact, 1, 4)
   ELSE
      DM1.asofrescese := '28/' + Copy(DM1.xanomestop, 5, 2) + '/' + Copy(DM1.xanomestop, 1, 4);
                   *****************)

   DM1.cdsCueInd.EmptyDataSet;
   xSql := 'select asofresnom from APO201 where asoid=' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString);
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   fechaNombramiento := DM1.cdsQry.FieldByName('asofresnom').AsString;
   // Inicio: HPC_201706_PRE
   // Se borra todos los registros de una tabla global tempory
   // xSql := 'DELETE T_CTAIND1';
   xSql := 'DELETE T_CTAIND1 WHERE 1 = 1';
   // Fin: HPC_201706_PRE

   DM1.DCOM1.AppServer.EjecutaSQL(xSql);
// Se añade el parametro de reliquidación
   xSql := 'BEGIN P_CUENTA_INDIVIDUAL(' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString) + ',''' + fechaNombramiento + ''',to_char(sysdate,''DD/MM/YYYY''),'''',''N''); END;';
   DM1.DCOM1.AppServer.EjecutaSQL(xSql);

   xContinua := False;
   xContador := 0;
   While Not xContinua Do
   Begin
      xSql := 'SELECT * FROM T_CTAIND1 '
         + 'WHERE ASOID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)
         + ' AND ANO||MES < to_char(sysdate,''YYYYMM'') '
         + ' ORDER BY ANO,MES';
      DM1.cdsCuentas.Close;
      DM1.cdsCuentas.DataRequest(xSql);
      DM1.cdsCuentas.Open;
      If DM1.cdsCuentas.RecordCount > 0 Then
         xContinua := True
      Else
      Begin
         xContador := xContador + 1;
         If xContador >= 5 Then
            xContinua := True
         Else
            For xcontador2 := 0 To 10000 Do
               ;
      End;
   End;

   If Not (DM1.cdsCuentas.RecordCount > 0) Then
   Begin
      Result := 'No existe información de cuenta individual';
      exit;
   End;

   DM1.cdsCuentas.First;
   xmonini := DM1.cdsCuentas.FieldByName('ACUMESANT').AsFloat;
   DM1.cdsCueInd.EmptyDataSet;

   TNumericField(DM1.cdsCueInd.FieldByName('CAPACU')).DisplayFormat := '###,###,##0.00';
   TNumericField(DM1.cdsCueInd.FieldByName('INTERES')).DisplayFormat := '###,###,##0.00';
   TNumericField(DM1.cdsCueInd.FieldByName('BONUS')).DisplayFormat := '###,###,##0.00';
   TNumericField(DM1.cdsCueInd.FieldByName('APORTE')).DisplayFormat := '###,###,##0.00';
   TNumericField(DM1.cdsCueInd.FieldByName('DEVOLUC')).DisplayFormat := '###,###,##0.00';
   TNumericField(DM1.cdsCueInd.FieldByName('TOTACU')).DisplayFormat := '###,###,##0.00';
   If DM1.cdsCuentas.Active = True Then
   Begin
      DM1.cdsCuentas.First;
      While Not DM1.cdsCuentas.Eof Do
      Begin
         DM1.cdsCueInd.Append;
         DM1.cdsCueInd.FieldByName('MES').AsString := DM1.NombreMes(DM1.cdsCuentas.FieldByName('MES').AsString);
         DM1.cdsCueInd.FieldByName('ANO').AsString := DM1.cdsCuentas.FieldByName('ANO').AsString;
         xSql := 'SELECT MAX(USEABR) USEABR FROM APO301 WHERE ASOID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)
            + ' AND TRANSANO = ' + QuotedStr(DM1.cdsCuentas.FieldByName('ANO').AsString) + ' AND TRANSMES = ' + QuotedStr(DM1.cdsCuentas.FieldByName('MES').AsString);
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         DM1.cdsCueInd.FieldByName('USENOM').AsString := DM1.cdsQry.FieldByName('USEABR').AsString;
         DM1.cdsCueInd.FieldByName('CAPACU').AsFloat := DM1.cdsCuentas.FieldByName('ACUMESANT').AsFloat;
         DM1.cdsCueInd.FieldByName('INTERES').AsFloat := DM1.cdsCuentas.FieldByName('INTCAPACU').AsFloat;
         DM1.cdsCueInd.FieldByName('BONUS').AsFloat := DM1.cdsCuentas.FieldByName('BONOS').AsFloat;
         DM1.cdsCueInd.FieldByName('APORTE').AsFloat := DM1.cdsCuentas.FieldByName('CAPITAL').AsFloat;
         DM1.cdsCueInd.FieldByName('DEVOLUC').AsFloat := DM1.cdsCuentas.FieldByName('TRANSMTODEV').AsFloat;
         DM1.cdsCueInd.FieldByName('TOTACU').AsFloat := DM1.cdsCuentas.FieldByName('ACUMULADO').AsFloat;
         DM1.cdsCuentas.Next;
      End;
   End;
   DM1.cdsCueInd.First;
   xaportes := 0;
   xbonus := 0;
   xinteres := 0;
   While Not DM1.cdsCueInd.Eof Do
   Begin
      xaportes := xaportes + DM1.cdsCueInd.FieldByName('APORTE').AsFloat;
      xbonus := xbonus + DM1.cdsCueInd.FieldByName('BONUS').AsFloat;
      xinteres := xinteres + DM1.cdsCueInd.FieldByName('INTERES').AsFloat;
      DM1.cdsCueInd.Next;
   End;
   DM1.cdsCueInd.First;

// Inicio HPC_201505_PRE     : Agregar en Consultas aplicaciones de CCI
   DM1.DetalleCCI(DM1.cdsAsociado.FieldByName('ASOID').AsString);
   DM1.ResumenCCI( DM1.cdsAsociado.FieldByName('ASOID').AsString );
   ppdbCCI.DataSource:=DM1.dsRepCCI;
// fin HPC_201505_PRE     : Agregar en Consultas aplicaciones de CCI
End;

(******************************************************************************)
Procedure TFrmGeneraCtaIndividualPDF.generarReporte(INro: integer);
Var
   xfecini, xultano, xAnoMesIni: String;
   xtmp: Double;
   xAno, xMes, xMesIni, xAnoIni, i: Integer;
   xtotal_pie: Double;
   Chart: TDBChart;
   Series: TPieSeries;
   Image: TImage;
   Jpeg: TJpegImage;
   apo, int, bon: Double;
   // COLOCAR FECHA DE ULTIMO APORTE
   XULT_ANHOMES_APORT:string;

   ultimoAnhoSaldo:integer;
   ultimoMesSaldo:integer;
   ultimoDiaSaldo :Integer;
   cadAnho:string;
   cadMes:string;
   valAnho:string;
   valMes:string;
   // Inicio: HPC_201706_PRE
   // Se añaden variables para usar en el nuevo reporte
   xSqlctaind, xfectmp:String;
   // Fin: HPC_201706_PRE
   // Inicio: HPC_201704_PRE
   // Nuevas variables para el calculos de los meses de proceso
   xanomesact:string;
   // Inicio: HPC_201706_PRE
   // variable pasa a ser publica.
   // xmonpen:double;
   // Fin: HPC_201706_PRE

   // Fin: HPC_201704_PRE
   // Inicio: SPP_201302_PRE
   autdesapo: boolean;
   // Fin: SPP_201302_PRE

Begin
   // Inicio: HPC_201704_PRE
   // Se calcular aportes pendientes de pago
   // Se calcula el mes actual
   xSql := 'SELECT TO_CHAR(ADD_MONTHS(SYSDATE,-1),''YYYYMM'') ANOMESACT FROM DUAL';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   xanomesact := DM1.cdsQry.FieldByName('ANOMESACT').AsString;
   xanomesnom := Copy(DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString,7,4)+Copy(DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString,4,2);
   // Calculando aportes no pagados
   xSql := 'SELECT TO_CHAR(ASOFRESNOM,''YYYYMM'') ASOFRESNOM, TO_CHAR(FECAUTDESAPO,''YYYYMM'') FECAUTDESAPO, APOANO, APOMES, APOVALOR-MONTO_APORTADO APO_NOPAGADO FROM'
   +' (SELECT TO_DATE(C.ASOFRESNOM) ASOFRESNOM, TO_DATE(C.FECAUTDESAPO) FECAUTDESAPO, A.APOANO, A.APOMES, A.APOVALOR, NVL(B.MONTO_APORTADO,0) MONTO_APORTADO FROM APO117 A,'
   +' (SELECT ASOID, TRANSANO, TRANSMES, SUM(NVL(TRANSMTO,0)-NVL(TRANSMTODEV,0)) MONTO_APORTADO FROM APO301 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)
   +' GROUP BY ASOID, TRANSANO, TRANSMES ORDER BY ASOID, TRANSANO, TRANSMES) B, APO201 C WHERE'
   +' (A.APOANO||A.APOMES >= '+QuotedStr(xanomesnom)+' AND A.APOANO||A.APOMES < '+QuotedStr(xanomesact)+') AND A.APOANO = B.TRANSANO(+) AND A.APOMES = B.TRANSMES(+)'
   +' AND NVL(A.APOVALOR,0)-NVL(B.MONTO_APORTADO,0) > 0 AND C.ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' ORDER BY A.APOANO, A.APOMES)'
   +' WHERE APOVALOR-MONTO_APORTADO > 0';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   xmonpen := 0;
   While Not DM1.cdsQry.Eof Do
   Begin
      If DM1.cdsQry.FieldByName('ASOFRESNOM').AsString < '200701' Then
      Begin
         If DM1.cdsQry.FieldByName('APOANO').AsString+DM1.cdsQry.FieldByName('APOMES').AsString > DM1.cdsQry.FieldByName('ASOFRESNOM').AsString Then
         Begin
            xmonpen := xmonpen + DM1.cdsQry.FieldByName('APO_NOPAGADO').AsFloat;
         End;
      End
      Else
      Begin
         If DM1.cdsQry.FieldByName('APOANO').AsString+DM1.cdsQry.FieldByName('APOMES').AsString > DM1.cdsQry.FieldByName('FECAUTDESAPO').AsString Then
         Begin
            xmonpen := xmonpen + DM1.cdsQry.FieldByName('APO_NOPAGADO').AsFloat;
         End;
      End;
      DM1.cdsQry.Next;
   End;
   // Inicio: HPC_201706_PRE
   // Se retira el punto del signo de soles.
   // ppltotsalpenpagest.Caption := 'Total aportes pendientes de pago S/. '+FloatToStrF(xmonpen,ffNumber,10,2);
   ppltotsalpenpagest.Caption := 'Total aportes pendientes de pago S/ '+FloatToStrF(xmonpen,ffNumber,10,2);
   // Fin: HPC_201706_PRE
   DM1.tTiempoTranscurrido := DM1.tiempoTranscurrido(DM1.FechaSys, StrToDate(DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString) , '0');
   pplanonomest.Caption :=  FloatToStr(DM1.anosTranscurridos)+' AÑOS';
   // Fin: HPC_201704_PRE

   // Inicio: SPP_201302_PRE
   if (DM1.cdsAsociado.FieldByName('AUTDESAPO').AsString = '')
     or (DM1.cdsAsociado.FieldByName('AUTDESAPO').AsString = 'N') then
     autdesapo := false
   else
     autdesapo := true;
   // Fin: SPP_201302_PRE
   //Printer.PrinterIndex := -1;
   pplasoapenomdni_nc.Caption := DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString;
   // Inicio: HPC_201704_PRE
   // se muestra nueva información en el reporte estadistico de cuenta individual
   pplasodni_nc.Caption := DM1.cdsAsociado.FieldByName('ASODNI').AsString;
   pplasodir_nc.Caption := DM1.cdsAsociado.FieldByName('ASODIR').AsString;
   ppldst_nc.Caption := Trim(DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', DM1.cdsAsociado.FieldByName('ZIPID').AsString))+'/'+
        Trim(DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', Copy(DM1.cdsAsociado.FieldByName('ZIPID').AsString, 1, 4)))+'/'+
        Trim(DM1.DevuelveValor('APO158', 'DPTODES', 'DPTOID', Copy(DM1.cdsAsociado.FieldByName('ZIPID').AsString, 1, 2)));
   // Fin: HPC_201704_PRE

   pplasotelf1_nc.Caption := DM1.cdsAsociado.FieldByName('ASOTELF1').AsString;
   // Inicio: HPC_201704_PRE   
   // Se añade variable para el segundo numero de telefono
   pplasotelf2_nc.Caption := DM1.cdsAsociado.FieldByName('ASOTELF2').AsString;
   // Fin: HPC_201704_PRE
   pplasocodmod_nc.Caption := DM1.cdsAsociado.FieldByName('ASOCODMOD').AsString;

// COLOCAR NIVEL DEL CENTRO EDUCATIVO
   xSql := 'SELECT UPPER(NIVEDU_DES) NIVEDU_DES, B.CENEDUID FROM ASO_CEN_EDU B, NIV_CEN_EDU C WHERE B.NIVEDU_ID = C.NIVEDU_ID(+) AND B.CENEDUID = '+ QuotedStr(DM1.cdsAsociado.FieldByName('CENEDUID').AsString);
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   pplcpoNIVEDU.Caption := DM1.cdsQry.FieldByName('NIVEDU_DES').AsString;

   // Inicio: HPC_201704_PRE
   // Se retiran variables que ya no se muestran
   // xSql := 'SELECT UPRONOM FROM APO102 WHERE UPROID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
   // DM1.cdsQry.Close;
   // DM1.cdsQry.DataRequest(xSql);
   // DM1.cdsQry.Open;
   // pplunipro_nc.Caption := DM1.cdsQry.FieldByName('UPRONOM').AsString;
   // xSql := 'SELECT UPAGONOM FROM APO103 WHERE UPROID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString) + ' AND UPAGOID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString);
   // DM1.cdsQry.Close;
   // DM1.cdsQry.DataRequest(xSql);
   // DM1.cdsQry.Open;
   // pplunipag_nc.Caption := DM1.cdsQry.FieldByName('UPAGONOM').AsString;
   // xSql := 'SELECT USENOM FROM APO101 WHERE UPROID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString) + ' AND UPAGOID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString) + ' AND USEID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('USEID').AsString);
   // DM1.cdsQry.Close;
   // DM1.cdsQry.DataRequest(xSql);
   // DM1.cdsQry.Open;
   // ppluniges_nc.Caption := DM1.cdsQry.FieldByName('USENOM').AsString;
   // Fin: HPC_201704_PRE

   pplasofresnom_nc.Caption := DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString;
   pplasoresnom_nc.Caption := DM1.cdsAsociado.FieldByName('ASORESNOM').AsString;

//                                     se cambia la forma de tomar el dato del colegio del asociado
//                                     primero busca en la tabla de Centros Educativos si tiene asignado
//                                     el CENEDUID en el Maestro APO201
//                                     sino, toma los datos del propio Maestro de Asociados
   xSQL := 'SELECT NOMCENEDU, DIREC, CENPO, DPTO.DPTODES DPTO, PROV.CIUDDES PROV, DIST.ZIPDES DIST '
      + '  FROM ASO_CEN_EDU CE, APO158 DPTO, APO123 PROV, APO122 DIST '
      + ' WHERE CENEDUID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('CENEDUID').AsString)
      + '   AND SUBSTR(CE.UBIGEO_DIR, 1, 2) = DPTO.DPTOID(+) '
      + '   AND SUBSTR(CE.UBIGEO_DIR, 1, 2) = PROV.DPTOID(+) '
      + '   AND SUBSTR(CE.UBIGEO_DIR, 1, 4) = PROV.CIUDID(+) '
      + '   AND SUBSTR(CE.UBIGEO_DIR, 1, 2) = DIST.DPTOID(+) '
      + '   AND SUBSTR(CE.UBIGEO_DIR, 1, 4) = DIST.CIUDID(+) '
      + '   AND CE.UBIGEO_DIR = DIST.ZIPID(+) ';

   DM1.cdsQry24.Close;
   DM1.cdsQry24.DataRequest(xSql);
   DM1.cdsQry24.Open;
   pplcpocenedu.Caption := DM1.cdsQry24.FieldByName('CENPO').AsString;
   If trim(DM1.cdsQry24.FieldByName('NOMCENEDU').AsString) <> '' Then
      pplasodeslab_nc.Caption := DM1.cdsQry24.FieldByName('NOMCENEDU').AsString
   Else
      pplasodeslab_nc.Caption := DM1.cdsAsociado.FieldByName('ASODESLAB').AsString;

   // Inicio: HPC_201706_PRE
   // Se calcula montos para rentabilidad acumulada
   xSql := 'SELECT MIN(NVL(ACUMESANT,0))+SUM(CAPITAL) APORTE, MAX(NVL(ACUMULADO,0)) SALDO FROM T_CTAIND1 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)
   +' AND ANO||MES < TO_CHAR(sysdate,''YYYYMM'')';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   pplrenacu_cn.Caption := 'Rentabilidad Acumulada = (('+FloatToStrF(DM1.cdsQry.FieldByName('SALDO').AsFloat,ffNumber,10,2)+'/'
   +FloatToStrF(DM1.cdsQry.FieldByName('APORTE').AsFloat,ffNumber,10,2)+')-1)*100 = '+FloatToStrF(((DM1.cdsQry.FieldByName('SALDO').AsFloat/DM1.cdsQry.FieldByName('APORTE').AsFloat)-1)*100,ffNumber,12,0)+'%';
   // Fin: HPC_201706_PRE


   // Inicio: HPC_201704_PRE
   // Se muestra el campo fecha de autorización de descuento de aportes
   pplfecautdesest.Caption := Copy(DM1.cdsAsociado.FieldByName('FECAUTDESAPO').AsString,1,10);
   pplfechaimpresion.caption := 'Fecha de Impresión : '+ DateToStr(DM1.FechaSys);
   // Fin: HPC_201704_PRE

   // Inicio: HPC_201704_PRE   
   // If trim(DM1.cdsQry24.FieldByName('DIREC').AsString) <> '' Then
   //    pplasodirleb_nc.Caption := DM1.cdsQry24.FieldByName('DIREC').AsString
   // Else
   //    pplasodirleb_nc.Caption := DM1.cdsAsociado.FieldByName('ASODIRLAB').AsString;
   // If trim(DM1.cdsQry24.FieldByName('DIST').AsString) <> '' Then
   //    ppldstdeslab_nc.Caption := DM1.cdsQry24.FieldByName('DIST').AsString
   // Else
   //    ppldstdeslab_nc.Caption := DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', DM1.cdsAsociado.FieldByName('ASODSTLABID').AsString);
   // If DM1.cdsQry24.RecordCount>0 Then
   // If trim(DM1.cdsQry24.FieldByName('PROV').AsString) <> '' Then
   //    pplprvdeslab_nc.Caption := DM1.cdsQry24.FieldByName('PROV').AsString
   // Else
   // pplprvdeslab_nc.Caption := DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', Copy(DM1.cdsAsociado.FieldByName('ASODSTLABID').AsString, 1, 4));
   // If trim(DM1.cdsQry24.FieldByName('DPTO').AsString) <> '' Then
   // ppldepdeslab_nc.Caption := DM1.cdsQry24.FieldByName('DPTO').AsString
   // Else
   //   ppldepdeslab_nc.Caption := DM1.DevuelveValor('APO158', 'DPTODES', 'DPTOID', Copy(DM1.cdsAsociado.FieldByName('ASODSTLABID').AsString, 1, 2));
   // Fin: HPC_201704_PRE   
   // Inicio: HPC_201704_PRE
   // Se muestra departamento, provincia y distrito del colegio.
   ppldstdeslab_nc.Caption := Trim(DM1.cdsQry24.FieldByName('DPTO').AsString)+'/'+Trim(DM1.cdsQry24.FieldByName('PROV').AsString)+'/'+Trim(DM1.cdsQry24.FieldByName('DIST').AsString);
   // Fin: HPC_201704_PRE

   xSql := 'SELECT MAX(ANO||MES) vFechaFinal,MAX(ANOSERF) vANOSERF FROM T_CTAIND1'
      + ' WHERE ANO||MES < to_char(sysdate,''YYYYMM'') ';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;

   ultimoAnhoSaldo :=   StrToInt(Copy(DM1.cdsQry.FieldByName('vFechaFinal').AsString, 1, 4));
   ultimoMesSaldo :=   StrToInt(Copy(DM1.cdsQry.FieldByName('vFechaFinal').AsString, 5, 2));

   xAno := StrToInt(Copy(DM1.cdsQry.FieldByName('vFechaFinal').AsString, 1, 4));
   xMes := StrToInt(Copy(DM1.cdsQry.FieldByName('vFechaFinal').AsString, 5, 2));

   // Inicio: SPP_201302_PRE
   //Calcula el periodo inicial del cambio de secciones: sección acumulada inicial y sección detalle
   if autdesapo then
   begin //si firmó cadaps, se muestran los 6 últimos meses
     xMesIni := xMes - 6;
     xAnoIni := xAno;
     If xMesIni < 1 Then
     Begin
        xMesIni := xMesIni + 12;
        xAnoIni := xAno - 1;
     End;
     xAnoMesIni := DM1.StrZero(IntToStr(xAnoIni), 4) + DM1.StrZero(IntToStr(xMesIni), 2);
   end
   else
   begin //no firmó cadaps, se muestran los 6 últimos años
     xMesIni := 12;
     xAnoIni := xAno - 6;
     xAnoMesIni := DM1.StrZero(IntToStr(xAnoIni), 4) + DM1.StrZero(IntToStr(xMesIni), 2);
   end;

   //Calcula el saldo acumulado al 31/12/2006
   xSql := 'SELECT MIN(NVL(ACUMESANT,0)) INICIAL, SUM(NVL(CAPITAL,0)) APORTE, '
      + '          SUM(NVL(INTCAPACU,0)) INTERES, SUM(NVL(BONOS,0)) BONUS, MAX(NVL(ACUMULADO,0)) SALDO, '
      + '          max(anoserf) anoserf  FROM T_CTAIND1'
      + ' WHERE ANO||MES <= ' + QuotedStr(xAnoMesIni)
      + ' AND ANO||MES < ''200612'' '
      + ' ORDER BY ANO, MES';
   DM1.cdsQry20.Close;
   DM1.cdsQry20.DataRequest(xSql);
   DM1.cdsQry20.Open;
   // Inicio: HPC_201706_PRE
   // Se retiran variables retiradas del reporte
   // ppldesini20061231.Caption := 'SALDO ACUMULADO AL: 31/12/2006';
   // pplapoini20061231.Caption := FloatToStrF(DM1.cdsQry20.FieldByName('INICIAL').AsFloat + DM1.cdsQry20.FieldByName('APORTE').AsFloat, ffNumber, 10, 2);
   // pplintini20061231.Caption := FloatToStrF(DM1.cdsQry20.FieldByName('INTERES').AsFloat, ffNumber, 10, 2);
   // pplbonini20061231.Caption := FloatToStrF(DM1.cdsQry20.FieldByName('BONUS').AsFloat, ffNumber, 10, 2);
   // pplsalini20061231.Caption := FloatToStrF(DM1.cdsQry20.FieldByName('SALDO').AsFloat, ffNumber, 10, 2);
   // Fin: HPC_201706_PRE

   // Inicio: HPC_201704_PRE
   // Se retira etiqueta si firmo CADAPS
   // //si firmó cadaps se oculta la etiqueta "NO AUTORIZO DESCUENTO"
   // if autdesapo then
   // begin
   //   pplblAsoSinFirma.Visible := false;
   // end
   // else
   // begin
   //   pplblAsoSinFirma.Visible := true;
   // end;
   // Fin: HPC_201704_PRE
   // Fin: SPP_201302_PRE

   //Calcula el saldo acumulado hasta antes de los 6 periodos que se mostrarán en la cuenta individual
   xSql := 'SELECT MIN(NVL(ACUMESANT,0)) INICIAL, SUM(NVL(CAPITAL,0)) APORTE, '
      + '          SUM(NVL(INTCAPACU,0)) INTERES, SUM(NVL(BONOS,0)) BONUS, MAX(NVL(ACUMULADO,0)) SALDO, '
      + '          max(anoserf) anoserf  FROM T_CTAIND1'
      + ' WHERE ANO||MES <= ' + QuotedStr(xAnoMesIni)
      + ' AND ANO||MES < to_char(sysdate,''YYYYMM'') '
      + ' ORDER BY ANO, MES';
   DM1.cdsQry20.Close;
   DM1.cdsQry20.DataRequest(xSql);
   DM1.cdsQry20.Open;

   // Inicio: SPP_201302_PRE
   //Calcula los 6 periodos que se mostrarán en el detalle de la cuenta individual
   // Inicio: HPC_201706_PRE
   // Se realiza nuevo calculo del detalle de la liquidación
   // if autdesapo then
   // begin
   //   xSql := 'SELECT ANO, MES, NVL(CAPITAL,0) APORTE, NVL(INTCAPACU,0) INTERES, NVL(BONOS,0) BONUS, NVL(ACUMULADO,0) SALDO FROM T_CTAIND1'
   //      + ' WHERE ANO||MES > ' + QuotedStr(xAnoMesIni)
   //      + ' AND ANO||MES < to_char(sysdate,''YYYYMM'') '
   //      + ' ORDER BY ANO, MES';
   // end
   // else
   // begin
   //   xSql := 'SELECT ANO, MAX(MES) MES, SUM(NVL(CAPITAL,0)) APORTE, SUM(NVL(INTCAPACU,0)) INTERES, SUM(NVL(BONOS,0)) BONUS, MAX(NVL(ACUMULADO,0)) SALDO FROM T_CTAIND1'
   //      + ' WHERE ANO||MES > ' + QuotedStr(xAnoMesIni)
   //      + ' AND ANO||MES < to_char(sysdate,''YYYYMM'') '
   //      + ' GROUP BY ANO'
   //      + ' ORDER BY ANO, MES';
   // end;
   // DM1.cdsQry21.Close;
   // DM1.cdsQry21.DataRequest(xSql);
   // DM1.cdsQry21.Open;

   // Se calcula montos para rentabilidad acumulada
   xSql := 'SELECT MIN(NVL(ACUMESANT,0))+SUM(CAPITAL) APORTE, MAX(NVL(ACUMULADO,0)) SALDO FROM T_CTAIND1 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)
   +' AND ANO||MES < TO_CHAR(SYSDATE,''YYYYMM'')';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   pplrenacu_cn.Caption := 'Rentabilidad Acumulada = (('+FloatToStrF(DM1.cdsQry.FieldByName('SALDO').AsFloat,ffNumber,10,2)+'/'
   +FloatToStrF(DM1.cdsQry.FieldByName('APORTE').AsFloat,ffNumber,10,2)+')-1)*100 = '+FloatToStrF(((DM1.cdsQry.FieldByName('SALDO').AsFloat/DM1.cdsQry.FieldByName('APORTE').AsFloat)-1)*100,ffNumber,12,0)+'%';
   xAnoMesIni := DM1.StrZero(IntToStr(xAnoIni), 4) + DM1.StrZero(IntToStr(xMesIni), 2);
   // Calculando ultimos seis meses de aportes
   xSql := 'SELECT MAX(ANO||MES) vFechaFinal,MAX(ANOSERF) vANOSERF FROM T_CTAIND1 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)
   + ' AND ANO||MES < to_char(sysdate,''YYYYMM'')';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   ultimoAnhoSaldo := StrToInt(Copy(DM1.cdsQry.FieldByName('vFechaFinal').AsString, 1, 4));
   ultimoMesSaldo  := StrToInt(Copy(DM1.cdsQry.FieldByName('vFechaFinal').AsString, 5, 2));
   xAno := StrToInt(Copy(DM1.cdsQry.FieldByName('vFechaFinal').AsString, 1, 4));
   xMes := StrToInt(Copy(DM1.cdsQry.FieldByName('vFechaFinal').AsString, 5, 2));
   xMesIni := xMes - 6;
   xAnoIni := xAno;
   If xMesIni < 1 Then
   Begin
      xMesIni := xMesIni + 12;
      xAnoIni := xAno - 1;
   End;
   xAnoMesIni := DM1.StrZero(IntToStr(xAnoIni), 4) + DM1.StrZero(IntToStr(xMesIni), 2);
   xSqlctaind := '';
   xSql := 'SELECT ACUMESANT FROM T_CTAIND1 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND ANO = ''1997'' AND MES = ''01''';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   If DM1.cdsQry.FieldByName('ACUMESANT').AsFloat > 0 Then
      xSqlctaind := 'SELECT 1 ORDEN, ''MONTO APORTADO DE '+Copy(DM1.NombreMes(Copy(DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString,4,2)),1,3)+' '+Copy(DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString,7,4)
      +'-DIC 1996'' DESCRIPCION, 0 INTERES, 0 BONUS, ACUMESANT APORTE, ACUMESANT SALDO  FROM T_CTAIND1 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND ANO = ''1997'' AND MES = ''01'' AND NVL(ACUMESANT,0) > 0 UNION ALL';
   If Copy(DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString,7,4)+Copy(DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString,4,2) <= '199701' Then
      xfectmp := '199701'
   Else
      xfectmp := Copy(DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString,7,4)+Copy(DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString,4,2);
   xSqlctaind := xSqlctaind +
         ' SELECT 2 ORDEN, ''SALDO DE CTA. IND.: '+Copy(DM1.NombreMes(Copy(xfectmp,5,2)),1,3)+' '+Copy(xfectmp,1,4)+'-'+Copy(DM1.NombreMes(Copy(xAnoMesIni,5,2)),1,3)+' '+Copy(xAnoMesIni,1,4)+' '' DESCRIPCION,'
         +' SUM(INTCAPACU) INTERES, SUM(BONOS) BONUS, SUM(CAPITAL) APORTE, MIN(ACUMESANT)+SUM(INTCAPACU+BONOS+CAPITAL) SALDO FROM T_CTAIND1'
         +' WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND ANO||MES >= '+QuotedStr(xfectmp)+' AND ANO||MES <= '+QuotedStr(xAnoMesIni)+'  UNION ALL ';
         xSqlctaind := xSqlctaind +
         'SELECT ROWNUM ORDEN, ANO||MES DESCRPCION, NVL(INTCAPACU,0) INTERES, NVL(BONOS,0) BONUS, NVL(CAPITAL,0) APORTE, NVL(ACUMULADO,0) SALDO FROM T_CTAIND1'
         + ' WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND ANO||MES > ' + QuotedStr(xAnoMesIni)+' AND ANO||MES < TO_CHAR(SYSDATE,''YYYYMM'')';
   DM1.cdsQry21.Close;
   // DM1.cdsQry21.DataRequest(xSql);
   DM1.cdsQry21.DataRequest(xSqlctaind);
   DM1.cdsQry21.Open;
   // Fin: HPC_201706_PRE

   //si tiene saldo acumulado hasta el 2006 y
   //si tiene saldo acumulado positivo hasta antes de los 6 periodos a mostrar en el detalle
   //no se muestra el acumulado hasta el 2006
   if (DM1.cdsQry20.FieldByName('SALDO').AsFloat > 0)
     and (DM1.cdsQry21.FieldByName('SALDO').AsFloat > 0) then
   begin
   // Inicio: HPC_201706_PRE
   // Se retiran variable no usadas en el nuevo reporte
   //  ppldesini20061231.Visible := false;
   //  pplapoini20061231.Visible := false;
   //  pplintini20061231.Visible := false;
   //  pplbonini20061231.Visible := false;
   //  pplsalini20061231.Visible := false;

     // ppShape1.Visible := false;
     // ppShape25.Visible := false;
     // ppShape26.Visible := false;
     // ppShape23.Visible := false;
     // ppShape24.Visible := false;
     // Inicio: SPP_201403_PRE
     // ppLabel232.Top := 5.1875;
     // ppLabel233.Top := 5.1875;
     // ppLabel248.Top := 5.1875;
     // ppLabel258.Top := 5.1875;
     // ppLabel261.Top := 5.1875;
     // ppLabel232.Top := 5.0208;
     // ppLabel233.Top := 5.0208;
     // ppLabel248.Top := 5.0208;
     // ppLabel258.Top := 5.0208;
     // ppLabel261.Top := 5.0208;
     // ppShape4.Top := 5.1667;
     // ppShape5.Top := 5.1667;
     // ppShape6.Top := 5.1667;
     // ppShape7.Top := 5.1667;
     // ppShape8.Top := 5.1667;
     // ppShape4.Top := 5;
     // ppShape5.Top := 5;
     // ppShape6.Top := 5;
     // ppShape7.Top := 5;
     // ppShape8.Top := 5;
     // Fin: SPP_201403_PRE
   end
   else
   begin
     // ppldesini20061231.Visible := true;
     // pplapoini20061231.Visible := true;
     // pplintini20061231.Visible := true;
     // pplbonini20061231.Visible := true;
     // pplsalini20061231.Visible := true;

     // ppShape1.Visible := true;
     // ppShape25.Visible := true;
     // ppShape26.Visible := true;
     // ppShape23.Visible := true;
     // ppShape24.Visible := true;
     // Inicio: SPP_201403_PRE
     // ppLabel232.Top := 5.0208;
     // ppLabel233.Top := 5.0208;
     // ppLabel248.Top := 5.0208;
     // ppLabel258.Top := 5.0208;
     // ppLabel261.Top := 5.0208;
     // ppLabel232.Top := 4.8125;
     // ppLabel233.Top := 4.8125;
     // ppLabel248.Top := 4.8125;
     // ppLabel258.Top := 4.8125;
     // ppLabel261.Top := 4.8125;
     // ppShape4.Top := 5;
     // ppShape5.Top := 5;
     // ppShape6.Top := 5;
     // ppShape7.Top := 5;
     // ppShape8.Top := 5;
     // ppShape4.Top := 4.7917;
     // ppShape5.Top := 4.7917;
     // ppShape6.Top := 4.7917;
     // ppShape7.Top := 4.7917;
     // ppShape8.Top := 4.7917;
     // Fin: SPP_201403_PRE
     // Fin: HPC_201706_PRE
   end;
   // Fin: SPP_201302_PRE

// COLOCAR FECHA DE ULTIMO APORTE
   xSql := 'SELECT MAX(ANHOMES) XULT_ANHOMES_APORT'
        +  '  FROM (SELECT (ANO || MES) ANHOMES '
        +  '          FROM T_CTAIND1 '
        +  '         WHERE ANO || MES <= TO_CHAR(SYSDATE, ''YYYYMM'') '
        +  '           AND NVL(CAPITAL, 0) > 0)';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   IF DM1.cdsQry.RecordCount>0 THEN
      XULT_ANHOMES_APORT:= DM1.cdsQry.fieldbyname('XULT_ANHOMES_APORT').AsString;

   if trim(DM1.cdsQry.fieldbyname('XULT_ANHOMES_APORT').AsString)='' then
      XULT_ANHOMES_APORT:= xAnoMesIni;

   //Calculo de años de aportacion del ANOSERF - RMZ
   // años de asociado

   xSql := '  SELECT ANHOS, '
         + '         CASE WHEN MESES > 12 THEN MESES - (ANHOS * 12) ELSE MESES END MESES '
         + '    FROM (SELECT TRUNC((FECHACESE - ASOFRESNOM) / 365) ANHOS, '
         + '                 TRUNC(MONTHS_BETWEEN(FECHACESE, LAST_DAY(ASOFRESNOM))) MESES '
         + '             FROM (SELECT ASOFRESNOM, '
         + '                          CASE WHEN ASOFRESCESE IS NULL THEN TRUNC(SYSDATE) ELSE ASOFRESCESE END FECHACESE '
         + '                      FROM APO201 '
         + '                     WHERE ASOID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString) + '))';

   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;


   valAnho := DM1.cdsQry.fieldbyname('ANHOS').asstring;
   if (DM1.cdsQry.fieldbyname('ANHOS').Value=1) then
      cadAnho:= 'AÑO'
   else
      cadAnho:= 'AÑOS';

   valMes := DM1.cdsQry.fieldbyname('MESES').asstring;
   if (DM1.cdsQry.fieldbyname('MESES').Value=1) then
      cadMes:= 'MES'
   else
      cadMes:= 'MESES';

    // Inicio: HPC_201704_PRE
    // Se modifica la variable de años transcurridos
    // pplanoapo_nc.Caption := valAnho+' '+cadAnho+' '+valMes+' '+cadMes;
    // //pplanoapo_nc.Caption := DM1.cdsQry20.fieldbyname('anoserf').AsString+' '+cadAnho+' '+DM1.cdsQry20.fieldbyname('anoser').AsString+' '+cadMes; // (ULTIMO APORTE: '+copy(DM1.NombreMes(COPY(XULT_ANHOMES_APORT,5,2)),1,3)+'/'+COPY(XULT_ANHOMES_APORT,1,4)+')';
    pplanonomest.Caption :=  FloatToStr(DM1.anosTranscurridos)+' AÑOS';
    // Fin: HPC_201704_PRE

   // ultimo aporte
   xfecini := '01/' + COPY(XULT_ANHOMES_APORT,5,2) + '/' + COPY(XULT_ANHOMES_APORT,1,4);
   xSql := 'SELECT LAST_DAY(' + QuotedStr(xfecini) + ') FEC_FIN FROM DUAL';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;

    // Inicio: HPC_201704_PRE
    // Se muestra la descripción de la UGEL
    xSql := 'UPROID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString)+' AND UPAGOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString)+' AND USEID = '+QuotedStr(DM1.cdsAsociado.FieldByName('USEID').AsString);
    ppluniges_nc.Caption := DM1.DisplayDescrip('PRV', 'APO101', 'USENOM', xSql, 'USENOM');
    // Fin: HPC_201704_PRE



   pplultaporte.Caption := copy(DM1.NombreMes(COPY(XULT_ANHOMES_APORT,5,2)),1,3)+'-'+COPY(XULT_ANHOMES_APORT,1,4);
      (*ppldesini.Caption := 'SALDO A : '+DateToStr(Date);*)
   xfecini := '01/' + IntToStr(xMesIni) + '/' + IntToStr(xAnoIni);
   xSql := 'SELECT LAST_DAY(' + QuotedStr(xfecini) + ') FEC_INI FROM DUAL';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
//   ppldesini.Caption := 'SALDO AL : ' + DM1.cdsQry.FieldByName('FEC_INI').AsString;
   // Inicio: HPC_201706_PRE
   // Se retiran variable no usadas en el nuevo reporte
   // ppldesini.Caption := 'SALDO ACUMULADO AL: ' + DM1.cdsQry.FieldByName('FEC_INI').AsString;
   // pplapoini.Caption := FloatToStrF(DM1.cdsQry20.FieldByName('INICIAL').AsFloat + DM1.cdsQry20.FieldByName('APORTE').AsFloat, ffNumber, 10, 2);
   // pplintini.Caption := FloatToStrF(DM1.cdsQry20.FieldByName('INTERES').AsFloat, ffNumber, 10, 2);
   // pplbonini.Caption := FloatToStrF(DM1.cdsQry20.FieldByName('BONUS').AsFloat, ffNumber, 10, 2);
   // pplsalini.Caption := FloatToStrF(DM1.cdsQry20.FieldByName('SALDO').AsFloat, ffNumber, 10, 2);
   // Fin: HPC_201706_PRE
   xSaldoInicio:=FloatToStrF(DM1.cdsQry20.FieldByName('SALDO').AsFloat, ffNumber, 10, 2);
   xSql := 'SELECT MIN(NVL(ACUMESANT,0)) ACUMESANT,  SUM(NVL(CAPITAL,0)) CAPITAL,  SUM(NVL(INTCAPACU,0)) INTCAPACU, SUM(NVL(BONOS,0)) BONOS, MAX(NVL(ACUMULADO,0)) ACUMULADO  FROM T_CTAIND1'
      + ' WHERE ANO||MES < to_char(sysdate,''YYYYMM'') ';
   DM1.cdsQry22.Close;
   DM1.cdsQry22.DataRequest(xSql);
   DM1.cdsQry22.Open;

   // COLOCAR FECHA DE ULTIMO APORTE
   // Inicio: HPC_201706_PRE
   // Se retira los caracteres "(*)"
   // pplapofin.Caption := FloatToStrF(DM1.cdsQry22.FieldByName('ACUMESANT').AsFloat + DM1.cdsQry22.FieldByName('CAPITAL').AsFloat, ffNumber, 10, 2)+'(*)';
   pplapofin.Caption := FloatToStrF(DM1.cdsQry22.FieldByName('ACUMESANT').AsFloat + DM1.cdsQry22.FieldByName('CAPITAL').AsFloat, ffNumber, 10, 2);
   // Fin: HPC_201706_PRE
   // Inicio: HPC_201704_PRE
   // Se retira mensaje ya no incluido en el nuevo reporte 
   // pplblMsj1.caption := '(*) MONTO QUE CORRESPONDE A LO REALMENTE RECIBIDO POR LA INSTITUCIÓN.';
   // Fin: HPC_201704_PRE

   pplintfin.Caption := FloatToStrF(DM1.cdsQry22.FieldByName('INTCAPACU').AsFloat, ffNumber, 10, 2);
   pplbonfin.Caption := FloatToStrF(DM1.cdsQry22.FieldByName('BONOS').AsFloat, ffNumber, 10, 2);
   pplsalfin.Caption := FloatToStrF(DM1.cdsQry22.FieldByName('ACUMULADO').AsFloat, ffNumber, 10, 2);
   xSaldoFin:=FloatToStrF(DM1.cdsQry22.FieldByName('ACUMULADO').AsFloat, ffNumber, 10, 2);

// Inicio HPC_201505_PRE     : Agregar en Consultas aplicaciones de CCI
   // Inicio: HPC_201704_PRE
   // Se modifica el total de monto acumulado cuenta individual.
   // Se retira monto CCI
   // xtotal_pie :=
   //    DM1.cdsQry22.FieldByName('ACUMESANT').AsFloat + DM1.cdsQry22.FieldByName('CAPITAL').AsFloat
   //    + DM1.cdsQry22.FieldByName('INTCAPACU').AsFloat + DM1.cdsQry22.FieldByName('BONOS').AsFloat
   //    - DM1.cdsRepCCI.FieldByName('TOTCCI').AsFloat;
   xtotal_pie :=
      DM1.cdsQry22.FieldByName('ACUMESANT').AsFloat + DM1.cdsQry22.FieldByName('CAPITAL').AsFloat
      + DM1.cdsQry22.FieldByName('INTCAPACU').AsFloat + DM1.cdsQry22.FieldByName('BONOS').AsFloat;
   // Fin: HPC_201704_PRE



// fin  HPC_201505_PRE     : Agregar en Consultas aplicaciones de CCI

      //pplsaldoal.Caption := DateToStr(Date) + ' : S/. ' + FloatToStrF(xtotal_pie, ffNumber, 10, 2);
      ultimoDiaSaldo:= DaysInAMonth(ultimoAnhoSaldo,ultimoMesSaldo);
      //pplsaldoal.Caption := DM1.StrZero(IntToStr(ultimoDiaSaldo),2)+'/'+DM1.StrZero(IntToStr(ultimoMesSaldo),2)+'/'+IntToStr(ultimoAnhoSaldo)+ ' : S/. ' + FloatToStrF(xtotal_pie, ffNumber, 10, 2);
// Inicio  HPC_201505_PRE     : Agregar en Consultas aplicaciones de CCI
      // Inicio: HPC_201706_PRE 
      // Se retira el punto del simbolo de sol.
      // pplsaldoal.Caption := 'SALDO A '+copy(DM1.NombreMes(DM1.StrZero(IntToStr(ultimoMesSaldo),2)),1,3)+'.'+IntToStr(ultimoAnhoSaldo)+ ' : S/. ' + FloatToStrF(xtotal_pie, ffNumber, 10, 2);
      pplsaldoal.Caption := 'SALDO A '+copy(DM1.NombreMes(DM1.StrZero(IntToStr(ultimoMesSaldo),2)),1,3)+'.'+IntToStr(ultimoAnhoSaldo)+ ' : S/ ' + FloatToStrF(xtotal_pie, ffNumber, 10, 2);
      // Fin: HPC_201706_PRE
// fin  HPC_201505_PRE     : Agregar en Consultas aplicaciones de CCI
      if (xSaldoInicio=xSaldoFin) then
      begin
         // cambia el mensaje
         //ppldesini.Caption := 'SALDO ACUMULADO AL: ' + DM1.StrZero(IntToStr(ultimoDiaSaldo),2)+'/'+DM1.StrZero(IntToStr(ultimoMesSaldo),2)+'/'+IntToStr(ultimoAnhoSaldo);

         // INICIO: HPC_201704_PRE
         // Se modifican los nombres de las etiquetas
         // pplMsgTotal.Caption :='SALDO ACUMULADO AL: ' + DM1.StrZero(IntToStr(ultimoDiaSaldo),2)+'/'+DM1.StrZero(IntToStr(ultimoMesSaldo),2)+'/'+IntToStr(ultimoAnhoSaldo);
         // pplMsgTotal.Font.Name := 'Arial';
         // pplMsgTotal.Font.size := 6;
         pplsaldoal.Caption :='SALDO ACUMULADO AL: ' + DM1.StrZero(IntToStr(ultimoDiaSaldo),2)+'/'+DM1.StrZero(IntToStr(ultimoMesSaldo),2)+'/'+IntToStr(ultimoAnhoSaldo);
         pplsaldoal.Font.Name := 'Arial';
         pplsaldoal.Font.size := 6;
         // FIN: HPC_201704_PRE
         // Inicio: HPC_201706_PRE
         // Se retiran variables ya no usadas en el nuevo reporte
         // ppldesini.visible :=false;
         // pplapoini.visible :=false;
         // pplintini.visible :=false;
         // pplbonini.visible :=false;
         // pplsalini.visible :=false;
         // Fin: HPC_201706_PRE
         // Inicio: SPP_201302_PRE
         {ppShape2.visible :=false;
         ppShape11.visible :=false;
         ppShape10.visible :=false;
         ppShape12.visible :=false;
         ppShape13.visible :=false;}
         // Fin: SPP_201302_PRE
      end;
      // Inicio: HPC_201704_PRE 
      // Se retira etiqueta de fecha de impresión
      // pplFechaImp.Caption := 'FECHA DE IMPRESIÓN : '+DateToStr(Date);
      // Fin: HPC_201704_PRE

      //pplsaldoal.Caption := ' S/. '+FloatToStrF(xtotal_pie,ffNumber,10,2);

   // Inicio: HPC_201706_PRE
   // Se retira los puntos decimales de las variables
   // apo := StrToFloat(FloatToStrF(((DM1.cdsQry22.FieldByName('ACUMESANT').AsFloat + DM1.cdsQry22.FieldByName('CAPITAL').AsFloat) / xtotal_pie) * 100, ffNumber, 5, 2));
   // int := StrToFloat(FloatToStrF((DM1.cdsQry22.FieldByName('INTCAPACU').AsFloat / xtotal_pie) * 100, ffNumber, 5, 2));
   // bon := StrToFloat(FloatToStrF((DM1.cdsQry22.FieldByName('BONOS').AsFloat / xtotal_pie) * 100, ffNumber, 5, 2));
      apo := StrToFloat(FloatToStrF(((DM1.cdsQry22.FieldByName('ACUMESANT').AsFloat + DM1.cdsQry22.FieldByName('CAPITAL').AsFloat) / xtotal_pie) * 100, ffNumber, 3,0));
      bon := StrToFloat(FloatToStrF((DM1.cdsQry22.FieldByName('BONOS').AsFloat / xtotal_pie) * 100, ffNumber, 3, 0));
      int := 100-(apo+bon);
   // Fin: HPC_201706_PRE
   Chart1.Series[0].Clear;
   Chart1.Series[0].Add(apo, 'Aportes');
   Chart1.Series[0].Add(int, 'Intereses');
   Chart1.Series[0].Add(bon, 'Bonus');

   // crea o bitmap de memória
   Image := TImage.Create(Nil);
   Image.Width := Chart1.Width;
   Image.Height := Chart1.Height;

   Chart1.Draw(Image1.Canvas, Image.BoundsRect);
   Jpeg := TJpegImage.Create;
   Jpeg.Assign(Image1.Picture.Bitmap);
   ppImage3.Picture.Bitmap := image1.Picture.Bitmap;
      (***********************)
   // Inicio: HPC_201706_PRE
   // Se modifica nombre del reporte
   // pprresest.PrinterSetup.PrinterName := 'Default';
   // pprresest.PrinterSetup.DocumentName := RightStr('0000000000' + inttostr(INro), 8) + '-' + DM1.cdsAsociado.FieldByName('ASODNI').AsString;
   pprresestconfor.PrinterSetup.PrinterName := 'Default';
   pprresestconfor.PrinterSetup.DocumentName := RightStr('0000000000' + inttostr(INro), 8) + '-' + DM1.cdsAsociado.FieldByName('ASODNI').AsString;
   pprresestconfor.ModalPreview := false;
   pprresestconfor.ShowPrintDialog := false;
   (* pprresest.Device:=dvPrinter; *)
   (***********************)
   pprresestconfor.Print;

   // Fin: HPC_201706_PRE

   Jpeg.Free;
   Jpeg := Nil;
   Image.Free;
   Image := Nil;

   self.Close;
End;

// Inicio: HPC_201706_PRE
// Se modifica procedimiento que imprime año y mes en el detalle de la
// cuenta individual
Procedure TFrmGeneraCtaIndividualPDF.pplanomes_cfPrint(Sender: TObject);
Var
   xMes: String;
Begin
   // If Copy(DM1.cdsQry21.FieldByName('DESCRIPCION').AsString,5,2) = '01' Then xMes := 'ENE - ';
   // If Copy(DM1.cdsQry21.FieldByName('DESCRIPCION').AsString,5,2) = '02' Then xMes := 'FEB - ';
   // If Copy(DM1.cdsQry21.FieldByName('DESCRIPCION').AsString,5,2) = '03' Then xMes := 'MAR - ';
   // If Copy(DM1.cdsQry21.FieldByName('DESCRIPCION').AsString,5,2) = '04' Then xMes := 'ABR - ';
   // If Copy(DM1.cdsQry21.FieldByName('DESCRIPCION').AsString,5,2) = '05' Then xMes := 'MAY - ';
   // If Copy(DM1.cdsQry21.FieldByName('DESCRIPCION').AsString,5,2) = '06' Then xMes := 'JUN - ';
   // If Copy(DM1.cdsQry21.FieldByName('DESCRIPCION').AsString,5,2) = '07' Then xMes := 'JUL - ';
   // If Copy(DM1.cdsQry21.FieldByName('DESCRIPCION').AsString,5,2) = '08' Then xMes := 'AGO - ';
   // If Copy(DM1.cdsQry21.FieldByName('DESCRIPCION').AsString,5,2) = '09' Then xMes := 'SET - ';
   // If Copy(DM1.cdsQry21.FieldByName('DESCRIPCION').AsString,5,2) = '10' Then xMes := 'OCT - ';
   // If Copy(DM1.cdsQry21.FieldByName('DESCRIPCION').AsString,5,2) = '11' Then xMes := 'NOV - ';
   // If Copy(DM1.cdsQry21.FieldByName('DESCRIPCION').AsString,5,2) = '12' Then xMes := 'DIC - ';
   // If xMes = '' Then
   // Begin
   //    pplanomes_sf.Caption := DM1.cdsQry21.FieldByName('DESCRIPCION').AsString;
   //    pplanomes_cf.Caption := DM1.cdsQry21.FieldByName('DESCRIPCION').AsString;
   // End
   // Else
   // Begin
   //    pplanomes_sf.Caption := xMes + Copy(DM1.cdsQry21.FieldByName('DESCRIPCION').AsString,1,4);
   //    pplanomes_cf.Caption := xMes + Copy(DM1.cdsQry21.FieldByName('DESCRIPCION').AsString,1,4);
   // End;
   xMes := '';
   If Copy(DM1.cdsQry21.FieldByName('DESCRIPCION').AsString,5,2) = '01' Then xMes := 'ENE - ';
   If Copy(DM1.cdsQry21.FieldByName('DESCRIPCION').AsString,5,2) = '02' Then xMes := 'FEB - ';
   If Copy(DM1.cdsQry21.FieldByName('DESCRIPCION').AsString,5,2) = '03' Then xMes := 'MAR - ';
   If Copy(DM1.cdsQry21.FieldByName('DESCRIPCION').AsString,5,2) = '04' Then xMes := 'ABR - ';
   If Copy(DM1.cdsQry21.FieldByName('DESCRIPCION').AsString,5,2) = '05' Then xMes := 'MAY - ';
   If Copy(DM1.cdsQry21.FieldByName('DESCRIPCION').AsString,5,2) = '06' Then xMes := 'JUN - ';
   If Copy(DM1.cdsQry21.FieldByName('DESCRIPCION').AsString,5,2) = '07' Then xMes := 'JUL - ';
   If Copy(DM1.cdsQry21.FieldByName('DESCRIPCION').AsString,5,2) = '08' Then xMes := 'AGO - ';
   If Copy(DM1.cdsQry21.FieldByName('DESCRIPCION').AsString,5,2) = '09' Then xMes := 'SET - ';
   If Copy(DM1.cdsQry21.FieldByName('DESCRIPCION').AsString,5,2) = '10' Then xMes := 'OCT - ';
   If Copy(DM1.cdsQry21.FieldByName('DESCRIPCION').AsString,5,2) = '11' Then xMes := 'NOV - ';
   If Copy(DM1.cdsQry21.FieldByName('DESCRIPCION').AsString,5,2) = '12' Then xMes := 'DIC - ';
   If xMes = '' Then
   Begin
      pplanomes_sf.Caption := DM1.cdsQry21.FieldByName('DESCRIPCION').AsString;
      pplanomes_cf.Caption := DM1.cdsQry21.FieldByName('DESCRIPCION').AsString;
   End
   Else
   Begin
      pplanomes_sf.Caption := xMes + Copy(DM1.cdsQry21.FieldByName('DESCRIPCION').AsString,1,4);
      pplanomes_cf.Caption := xMes + Copy(DM1.cdsQry21.FieldByName('DESCRIPCION').AsString,1,4);
   End;
   // pplanomes.Caption := xMes + DM1.cdsQry21.FieldByName('ANO').AsString;
   // pplanomes_sf.Caption := xMes + DM1.cdsQry21.FieldByName('ANO').AsString;
   // Inicio: SPP_201302_PRE
   {
   if (xSaldoInicio=xSaldoFin) then
   begin
     ppShape3.Visible := false;
     pplanomes.Visible := false;
     ppShape9.Visible := false;
     ppDBText28.Visible := false;
     ppShape14.Visible := false;
     ppDBText29.Visible := false;
     ppShape15.Visible := false;
     ppDBText30.Visible := false;
     ppShape16.Visible := false;
     ppDBText40.Visible := false;
     ppShape21.Visible := false;
   end;
   }
   // Fin: SPP_201302_PRE

End;
// Fin: HPC_201706_PRE

// COLOCAR FECHA DE ULTIMO APORTE
procedure TFrmGeneraCtaIndividualPDF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  DM1.cdsCuentas.Close;
  DM1.cdsCuentas.Filter:='';
  DM1.cdsCuentas.IndexFieldNames:='';

  DM1.cdsQry.Close;
  DM1.cdsQry.Filter:='';
  DM1.cdsQry.IndexFieldNames:='';

  DM1.cdsQry20.Close;
  DM1.cdsQry20.Filter:='';
  DM1.cdsQry20.IndexFieldNames:='';

  DM1.cdsQry21.Close;
  DM1.cdsQry21.Filter:='';
  DM1.cdsQry21.IndexFieldNames:='';

  DM1.cdsQry22.Close;
  DM1.cdsQry22.Filter:='';
  DM1.cdsQry22.IndexFieldNames:='';

  DM1.cdsQry24.Close;
  DM1.cdsQry24.Filter:='';
  DM1.cdsQry24.IndexFieldNames:='';

  Action := caFree;

end;

// Inicio: HPC_201706_PRE
// Nuevo procedimiento que genera la nueva cuenta individual
procedure TFrmGeneraCtaIndividualPDF.generarReportesinfor(INro: integer);
Var xSql, xSqlctaind, xfectmp:String;
    xanomesact, xanomesultapo, xAnoMesIni, XULT_ANHOMES_APORT, xfecini:String;
    ultimoAnhoSaldo, ultimoMesSaldo:Integer;
    xAno, xMes, xMesIni, xAnoIni, ultimoDiaSaldo :Integer;
    xtotal_pie, xmonpen, apo , int, bon : Double;
    Image: TImage;
    Jpeg: TJpegImage;
Begin
   // Se calcular aportes pendientes de pago
   // Se calcula el mes actual
   xSql := 'SELECT TO_CHAR(ADD_MONTHS(SYSDATE,-1),''YYYYMM'') ANOMESACT FROM DUAL';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   xanomesact := DM1.cdsQry.FieldByName('ANOMESACT').AsString;
   xanomesnom := Copy(DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString,7,4)+Copy(DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString,4,2);
   // Calculando aportes no pagados
   xSql := 'SELECT TO_CHAR(ASOFRESNOM,''YYYYMM'') ASOFRESNOM, TO_CHAR(FECAUTDESAPO,''YYYYMM'') FECAUTDESAPO, APOANO, APOMES, APOVALOR-MONTO_APORTADO APO_NOPAGADO FROM'
   +' (SELECT TO_DATE(C.ASOFRESNOM) ASOFRESNOM, TO_DATE(C.FECAUTDESAPO) FECAUTDESAPO, A.APOANO, A.APOMES, A.APOVALOR, NVL(B.MONTO_APORTADO,0) MONTO_APORTADO FROM APO117 A,'
   +' (SELECT ASOID, TRANSANO, TRANSMES, SUM(NVL(TRANSMTO,0)-NVL(TRANSMTODEV,0)) MONTO_APORTADO FROM APO301 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)
   +' GROUP BY ASOID, TRANSANO, TRANSMES ORDER BY ASOID, TRANSANO, TRANSMES) B, APO201 C WHERE'
   +' (A.APOANO||A.APOMES >= '+QuotedStr(xanomesnom)+' AND A.APOANO||A.APOMES < '+QuotedStr(xanomesact)+') AND A.APOANO = B.TRANSANO(+) AND A.APOMES = B.TRANSMES(+)'
   +' AND NVL(A.APOVALOR,0)-NVL(B.MONTO_APORTADO,0) > 0 AND C.ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' ORDER BY A.APOANO, A.APOMES)'
   +' WHERE APOVALOR-MONTO_APORTADO > 0';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   xmonpen := 0;
   While Not DM1.cdsQry.Eof Do
   Begin
      If DM1.cdsQry.FieldByName('ASOFRESNOM').AsString < '200701' Then
      Begin
         If DM1.cdsQry.FieldByName('APOANO').AsString+DM1.cdsQry.FieldByName('APOMES').AsString > DM1.cdsQry.FieldByName('ASOFRESNOM').AsString Then
         Begin
            xmonpen := xmonpen + DM1.cdsQry.FieldByName('APO_NOPAGADO').AsFloat;
         End;
      End
      Else
      Begin
         If DM1.cdsQry.FieldByName('APOANO').AsString+DM1.cdsQry.FieldByName('APOMES').AsString > DM1.cdsQry.FieldByName('FECAUTDESAPO').AsString Then
         Begin
            xmonpen := xmonpen + DM1.cdsQry.FieldByName('APO_NOPAGADO').AsFloat;
         End;
      End;
      DM1.cdsQry.Next;
   End;
   
   DM1.tTiempoTranscurrido := DM1.tiempoTranscurrido(DM1.FechaSys, StrToDate(DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString) , '0');
   pplanonomest_sf.Caption := FloatToStr(DM1.anosTranscurridos)+' AÑOS';

   ppltotsalpenpagest_sf.Caption := 'Total aportes pendientes de pago S/ '+FloatToStrF(xmonpen,ffNumber,10,2);

   xSql := 'SELECT MAX(APOSEC) APOSEC FROM APO301 WHERE ASOID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString);
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   xanomesultapo := DM1.cdsQry.FieldByName('APOSEC').AsString;


   // COLOCAR NIVEL DEL CENTRO EDUCATIVO
   xSql := 'SELECT UPPER(NIVEDU_DES) NIVEDU_DES, B.CENEDUID FROM ASO_CEN_EDU B, NIV_CEN_EDU C WHERE B.NIVEDU_ID = C.NIVEDU_ID(+) AND B.CENEDUID = '+ QuotedStr(DM1.cdsAsociado.FieldByName('CENEDUID').AsString);
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   pplcpoNIVEDU_sf.Caption := DM1.cdsQry.FieldByName('NIVEDU_DES').AsString;
   pplasoapenomdni_sf.Caption := DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString;
   pplasodir_sf.Caption := DM1.cdsAsociado.FieldByName('ASODIR').AsString;
   pplasodni_sf.Caption := DM1.cdsAsociado.FieldByName('ASODNI').AsString;
   ppldst_sf.Caption := Trim(DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', DM1.cdsAsociado.FieldByName('ZIPID').AsString))+'/'+
   Trim(DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', Copy(DM1.cdsAsociado.FieldByName('ZIPID').AsString, 1, 4)))+'/'+
   Trim(DM1.DevuelveValor('APO158', 'DPTODES', 'DPTOID', Copy(DM1.cdsAsociado.FieldByName('ZIPID').AsString, 1, 2)));
   pplasotelf1_sf.Caption := DM1.cdsAsociado.FieldByName('ASOTELF1').AsString;
   pplasotelf2_sf.Caption := DM1.cdsAsociado.FieldByName('ASOTELF2').AsString;
   pplasocodmod_sf.Caption := DM1.cdsAsociado.FieldByName('ASOCODMOD').AsString;
   xSql := 'UPROID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString)+' AND UPAGOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString)+' AND USEID = '+QuotedStr(DM1.cdsAsociado.FieldByName('USEID').AsString);
   ppluniges_sf.Caption := DM1.DisplayDescrip('PRV', 'APO101', 'USENOM', xSql, 'USENOM');
   pplasofresnom_sf.Caption := DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString;
   pplasoresnomest_sf.Caption := DM1.cdsAsociado.FieldByName('ASORESNOM').AsString;
   pplultapoest_sf.Caption := Copy(DM1.NombreMes(Copy(xanomesultapo, 5, 2)),1,3)+'-'+Copy(xanomesultapo, 1, 4);
   pplfecautdesest_sf.Caption := Copy(DM1.cdsAsociado.FieldByName('FECAUTDESAPO').AsString,1,10);
   pplanonomest_sf.Caption :=  FloatToStr(DM1.anosTranscurridos)+' AÑOS';
   xSQL := 'SELECT NOMCENEDU, DIREC, CENPO, DPTO.DPTODES DPTO, PROV.CIUDDES PROV, DIST.ZIPDES DIST '
   + '  FROM ASO_CEN_EDU CE, APO158 DPTO, APO123 PROV, APO122 DIST '
   + ' WHERE CENEDUID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('CENEDUID').AsString)
   + '   AND SUBSTR(CE.UBIGEO_DIR, 1, 2) = DPTO.DPTOID(+)'
   + '   AND SUBSTR(CE.UBIGEO_DIR, 1, 2) = PROV.DPTOID(+)'
   + '   AND SUBSTR(CE.UBIGEO_DIR, 1, 4) = PROV.CIUDID(+)'
   + '   AND SUBSTR(CE.UBIGEO_DIR, 1, 2) = DIST.DPTOID(+)'
   + '   AND SUBSTR(CE.UBIGEO_DIR, 1, 4) = DIST.CIUDID(+)'
   + '   AND CE.UBIGEO_DIR = DIST.ZIPID(+)';
   DM1.cdsQry24.Close;
   DM1.cdsQry24.DataRequest(xSql);
   DM1.cdsQry24.Open;
   pplcpocenedu_sf.Caption := DM1.cdsQry24.FieldByName('CENPO').AsString;
   pplasodeslab_sf.Caption := DM1.cdsQry24.FieldByName('NOMCENEDU').AsString;
   ppldstdeslab_sf.Caption := Trim(DM1.cdsQry24.FieldByName('DPTO').AsString)+'/'+Trim(DM1.cdsQry24.FieldByName('PROV').AsString)+'/'+Trim(DM1.cdsQry24.FieldByName('DIST').AsString);

   xSql := 'SELECT MIN(NVL(ACUMESANT,0))+SUM(CAPITAL) APORTE, MAX(NVL(ACUMULADO,0)) SALDO FROM T_CTAIND1 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)
   +' AND ANO||MES < TO_CHAR(SYSDATE,''YYYYMM'')';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   pplrenacu_sf.Caption := 'Rentabilidad Acumulada = (('+FloatToStrF(DM1.cdsQry.FieldByName('SALDO').AsFloat,ffNumber,10,2)+'/'
   +FloatToStrF(DM1.cdsQry.FieldByName('APORTE').AsFloat,ffNumber,10,2)+')-1)*100 = '+FloatToStrF(((DM1.cdsQry.FieldByName('SALDO').AsFloat/DM1.cdsQry.FieldByName('APORTE').AsFloat)-1)*100,ffNumber,12,0)+'%';

   xSql := 'SELECT MAX(ANO||MES) vFechaFinal,MAX(ANOSERF) vANOSERF FROM T_CTAIND1 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)
   + ' AND ANO||MES < to_char(sysdate,''YYYYMM'') ';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   ultimoAnhoSaldo :=   StrToInt(Copy(DM1.cdsQry.FieldByName('vFechaFinal').AsString, 1, 4));
   ultimoMesSaldo :=   StrToInt(Copy(DM1.cdsQry.FieldByName('vFechaFinal').AsString, 5, 2));
   xAno := StrToInt(Copy(DM1.cdsQry.FieldByName('vFechaFinal').AsString, 1, 4));
   xMes := StrToInt(Copy(DM1.cdsQry.FieldByName('vFechaFinal').AsString, 5, 2));
   xMesIni := xMes - 6;
   xAnoIni := xAno;
   If xMesIni < 1 Then
   Begin
      xMesIni := xMesIni + 12;
      xAnoIni := xAno - 1;
   End;
   xAnoMesIni := DM1.StrZero(IntToStr(xAnoIni), 4) + DM1.StrZero(IntToStr(xMesIni), 2);
   xSql := 'SELECT MIN(NVL(ACUMESANT,0)) INICIAL, SUM(NVL(CAPITAL,0)) APORTE, SUM(NVL(INTCAPACU,0)) INTERES, SUM(NVL(BONOS,0)) BONUS, MAX(NVL(ACUMULADO,0)) SALDO, max(anoserf) anoserf FROM T_CTAIND1'
   + ' WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND ANO||MES <= ' + QuotedStr(xAnoMesIni)
   + ' AND ANO||MES < to_char(sysdate,''YYYYMM'') '
   + ' ORDER BY ANO, MES';
   DM1.cdsQry20.Close;
   DM1.cdsQry20.DataRequest(xSql);
   DM1.cdsQry20.Open;


   {
   xSql := 'SELECT ANO, MES, NVL(CAPITAL,0) APORTE, NVL(INTCAPACU,0) INTERES, NVL(BONOS,0) BONUS, NVL(ACUMULADO,0) SALDO FROM T_CTAIND1'
   + ' WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND ANO||MES > ' + QuotedStr(xAnoMesIni)
   + ' AND ANO||MES < to_char(sysdate,''YYYYMM'') '
   + ' ORDER BY ANO, MES';
   DM1.cdsQry21.Close;
   DM1.cdsQry21.DataRequest(xSql);
   DM1.cdsQry21.Open;
   }

   xAnoMesIni := DM1.StrZero(IntToStr(xAnoIni), 4) + DM1.StrZero(IntToStr(xMesIni), 2);
   // Calculando ultimos seis meses de aportes
   xSql := 'SELECT MAX(ANO||MES) vFechaFinal,MAX(ANOSERF) vANOSERF FROM T_CTAIND1 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)
   + ' AND ANO||MES < to_char(sysdate,''YYYYMM'')';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   ultimoAnhoSaldo := StrToInt(Copy(DM1.cdsQry.FieldByName('vFechaFinal').AsString, 1, 4));
   ultimoMesSaldo  := StrToInt(Copy(DM1.cdsQry.FieldByName('vFechaFinal').AsString, 5, 2));
   xAno := StrToInt(Copy(DM1.cdsQry.FieldByName('vFechaFinal').AsString, 1, 4));
   xMes := StrToInt(Copy(DM1.cdsQry.FieldByName('vFechaFinal').AsString, 5, 2));
   xMesIni := xMes - 6;
   xAnoIni := xAno;
   If xMesIni < 1 Then
   Begin
      xMesIni := xMesIni + 12;
      xAnoIni := xAno - 1;
   End;
   xAnoMesIni := DM1.StrZero(IntToStr(xAnoIni), 4) + DM1.StrZero(IntToStr(xMesIni), 2);
   xSqlctaind := '';
   xSql := 'SELECT ACUMESANT FROM T_CTAIND1 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND ANO = ''1997'' AND MES = ''01''';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   If DM1.cdsQry.FieldByName('ACUMESANT').AsFloat > 0 Then
      xSqlctaind := 'SELECT 1 ORDEN, ''MONTO APORTADO DE '+Copy(DM1.NombreMes(Copy(DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString,4,2)),1,3)+' '+Copy(DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString,7,4)
      +'-DIC 1996'' DESCRIPCION, 0 INTERES, 0 BONUS, ACUMESANT APORTE, ACUMESANT SALDO  FROM T_CTAIND1 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND ANO = ''1997'' AND MES = ''01'' AND NVL(ACUMESANT,0) > 0 UNION ALL';

   If Copy(DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString,7,4)+Copy(DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString,4,2) <= '199701' Then
      xfectmp := '199701'
   Else
      xfectmp := Copy(DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString,7,4)+Copy(DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString,4,2);
   xSqlctaind := xSqlctaind +
         ' SELECT 2 ORDEN, ''SALDO DE CTA. IND.: '+Copy(DM1.NombreMes(Copy(xfectmp,5,2)),1,3)+' '+Copy(xfectmp,1,4)+'-'+Copy(DM1.NombreMes(Copy(xAnoMesIni,5,2)),1,3)+' '+Copy(xAnoMesIni,1,4)+' '' DESCRIPCION,'
         +' SUM(INTCAPACU) INTERES, SUM(BONOS) BONUS, SUM(CAPITAL) APORTE, MIN(ACUMESANT)+SUM(INTCAPACU+BONOS+CAPITAL) SALDO FROM T_CTAIND1'
         +' WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND ANO||MES >= '+QuotedStr(xfectmp)+' AND ANO||MES <= '+QuotedStr(xAnoMesIni)+'  UNION ALL ';
         xSqlctaind := xSqlctaind +
         'SELECT ROWNUM ORDEN, ANO||MES DESCRPCION, NVL(INTCAPACU,0) INTERES, NVL(BONOS,0) BONUS, NVL(CAPITAL,0) APORTE, NVL(ACUMULADO,0) SALDO FROM T_CTAIND1'
         + ' WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND ANO||MES > ' + QuotedStr(xAnoMesIni)+' AND ANO||MES < TO_CHAR(SYSDATE,''YYYYMM'')';
   DM1.cdsQry21.Close;
   DM1.cdsQry21.DataRequest(xSqlctaind);
   DM1.cdsQry21.Open;


   // COLOCAR FECHA DE ULTIMO APORTE
   xSql := 'SELECT MAX(ANHOMES) XULT_ANHOMES_APORT FROM (SELECT (ANO||MES) ANHOMES FROM T_CTAIND1 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)
   +' AND ANO||MES <= TO_CHAR(SYSDATE, ''YYYYMM'') AND NVL(CAPITAL, 0) > 0)';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   IF DM1.cdsQry.RecordCount>0 THEN
      XULT_ANHOMES_APORT:= DM1.cdsQry.fieldbyname('XULT_ANHOMES_APORT').AsString;
   if trim(DM1.cdsQry.fieldbyname('XULT_ANHOMES_APORT').AsString)='' then
      XULT_ANHOMES_APORT:= xAnoMesIni;
   xfecini := '01/' + COPY(XULT_ANHOMES_APORT,5,2) + '/' + COPY(XULT_ANHOMES_APORT,1,4);
   xSql := 'SELECT LAST_DAY(' + QuotedStr(xfecini) + ') FEC_FIN FROM DUAL';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   //Calculo de años de aportacion del ANOSERF
   xfecini := '01/' + IntToStr(xMesIni) + '/' + IntToStr(xAnoIni);
   xSql := 'SELECT LAST_DAY(' + QuotedStr(xfecini) + ') FEC_INI FROM DUAL';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   // ppldesini_sf.Caption := 'SALDO ACUMULADO AL: ' + DM1.cdsQry.FieldByName('FEC_INI').AsString;
   // pplapoini_sf.Caption := FloatToStrF(DM1.cdsQry20.FieldByName('INICIAL').AsFloat + DM1.cdsQry20.FieldByName('APORTE').AsFloat, ffNumber, 10, 2);
   // pplintini_sf.Caption := FloatToStrF(DM1.cdsQry20.FieldByName('INTERES').AsFloat, ffNumber, 10, 2);
   // pplbonini_sf.Caption := FloatToStrF(DM1.cdsQry20.FieldByName('BONUS').AsFloat, ffNumber, 10, 2);
   // pplsalini_sf.Caption := FloatToStrF(DM1.cdsQry20.FieldByName('SALDO').AsFloat, ffNumber, 10, 2);
   xSql := 'SELECT MIN(NVL(ACUMESANT,0)) ACUMESANT,  SUM(NVL(CAPITAL,0)) CAPITAL,  SUM(NVL(INTCAPACU,0)) INTCAPACU, SUM(NVL(BONOS,0)) BONOS, MAX(NVL(ACUMULADO,0)) ACUMULADO  FROM T_CTAIND1'
   + ' WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND ANO||MES < to_char(sysdate,''YYYYMM'')';
   DM1.cdsQry22.Close;
   DM1.cdsQry22.DataRequest(xSql);
   DM1.cdsQry22.Open;
   // COLOCAR FECHA DE ULTIMO APORTE
   pplapofin_sf.Caption := FloatToStrF(DM1.cdsQry22.FieldByName('ACUMESANT').AsFloat + DM1.cdsQry22.FieldByName('CAPITAL').AsFloat, ffNumber, 10, 2);
   pplintfin_sf.Caption := FloatToStrF(DM1.cdsQry22.FieldByName('INTCAPACU').AsFloat, ffNumber, 10, 2);
   pplbonfin_sf.Caption := FloatToStrF(DM1.cdsQry22.FieldByName('BONOS').AsFloat, ffNumber, 10, 2);
   pplsalfin_sf.Caption := FloatToStrF(DM1.cdsQry22.FieldByName('ACUMULADO').AsFloat, ffNumber, 10, 2);
   xtotal_pie := DM1.cdsQry22.FieldByName('ACUMESANT').AsFloat + DM1.cdsQry22.FieldByName('CAPITAL').AsFloat + DM1.cdsQry22.FieldByName('INTCAPACU').AsFloat + DM1.cdsQry22.FieldByName('BONOS').AsFloat;
   ultimoDiaSaldo:= DaysInAMonth(ultimoAnhoSaldo,ultimoMesSaldo);
   pplsaldoal_sf.Caption := 'SALDO A '+Copy(DM1.NombreMes(DM1.StrZero(IntToStr(ultimoMesSaldo),2)),1,3)+'-'+IntToStr(ultimoAnhoSaldo)+' S/ '+FloatToStrF(xtotal_pie, ffNumber, 10, 2);
   ppltotsalpenpagest_sf.Caption := 'Total aportes pendientes de pago S/ '+FloatToStrF(xmonpen,ffNumber,10,2);
   pplFechaImp_sf.Caption := 'Fecha de Impresión : '+DateToStr(Date);
   // apo := StrToFloat(FloatToStrF(((DM1.cdsQry22.FieldByName('ACUMESANT').AsFloat + DM1.cdsQry22.FieldByName('CAPITAL').AsFloat) / xtotal_pie) * 100, ffNumber, 5, 2));
   // int := StrToFloat(FloatToStrF((DM1.cdsQry22.FieldByName('INTCAPACU').AsFloat / xtotal_pie) * 100, ffNumber, 5, 2));
   // bon := StrToFloat(FloatToStrF((DM1.cdsQry22.FieldByName('BONOS').AsFloat / xtotal_pie) * 100, ffNumber, 5, 2));
   apo := StrToFloat(FloatToStrF(((DM1.cdsQry22.FieldByName('ACUMESANT').AsFloat + DM1.cdsQry22.FieldByName('CAPITAL').AsFloat) / xtotal_pie) * 100, ffNumber, 3,0));
   bon := StrToFloat(FloatToStrF((DM1.cdsQry22.FieldByName('BONOS').AsFloat / xtotal_pie) * 100, ffNumber, 3, 0));
   int := 100-(apo+bon);



   Chart1.Series[0].Clear;
   Chart1.Series[0].Add(apo, 'Aportes');
   Chart1.Series[0].Add(int, 'Intereses');
   Chart1.Series[0].Add(bon, 'Bonus');
   // crea o bitmap de memória
   Image1 := TImage.Create(Nil);
   Image1.Width := Chart1.Width;
   Image1.Height := Chart1.Height;
   // configura os valores específicos
   Chart1.Draw(Image1.Canvas, Image1.BoundsRect);
   Jpeg := TJpegImage.Create;
   Jpeg.Assign(Image1.Picture.Bitmap);
   ppImage6.Picture.Bitmap := image1.Picture.Bitmap;
   pprestsinforlot.PrinterSetup.PrinterName := 'Default';
   pprestsinforlot.PrinterSetup.DocumentName := RightStr('0000000000' + inttostr(INro), 8) + '-' + DM1.cdsAsociado.FieldByName('ASODNI').AsString;
   pprestsinforlot.ModalPreview := false;
   pprestsinforlot.ShowPrintDialog := false;
   pprestsinforlot.Print;

   Jpeg.Free;
   Jpeg := Nil;
   Image.Free;
   Image := Nil;
   self.Close;
end;
// Fin: HPC_201706_PRE

End.


