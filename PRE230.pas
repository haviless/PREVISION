// Inicio Uso Estándares: 01/08/2011
// Unidad : Previsión Social
// Formulario : FPrevioLiquidacion
// Fecha de Creación : 08/08/2011
// Autor : Sistemas
// Objetivo : Previo de liquidación
// Actualizaciones
// HPC_201202_PRE 10/02/20002 Desactiva lectura de Foto y Firma de FTP, lee de archivo RENIEC
// DPP_201201_PRE : Se realiza el pase a producción de acuerdo al HPC_201202_PRE
// HPC_201206_PRE : 12/06/2012 Se controla que el monto diferencial no sea menor a 0.
// HPC_201207_PRE : Se verifica si cuenta con registro para aprobración de cancelación por desgravamen.
// DPP_201207_PRE : Se realiza el pase a producción a partir del HPC_201207.
// HPC_201302_PRE : Modificación en el detalle del calculo de beneficios.
// SPP_201303_PRE : Se realiza el pase a producción a partir del HPC_201302_PRE
// HPC_201303_PRE : Se añade etiqueta de regimen de pensión a la hoja de reporte del previo de liquidación.
// SPP_201304_PRE : Se realiza el pase a produccion a partir del HPC_201303_PRE
// HPC_201305_PRE : Se añade etiqueta en el reporte previo de liquidación. La etiqueta muestra cual fue el origen
//                  del expediente que genero la liquidación.
// SPP_201306_PRE : Se realiza el pase a producción a partir del HPC_201305_PRE
// HPC_201306_PRE : Se actualiza el campo de Invalidez en el maestro de asociados si la Liq. es por Invalidez
// SPP_201307_PRE : Se realiza el pase a producción a partir del HPC_201306_PRE.
// HPC_201307_PRE : Se añade nuevo logo institucional
// SPP_201401_PRE : Se realiza el pase a producción a partir del pase HPC_201307_PRE
// SPP_201404_PRE : Se realiza el pase a producción a partir del pase HPC_201402_PRE
// HPC_201504_PRE : Descuentos por aplicaciones de CCI
// HPC_201506_PRE : Se realiza modificaciones para controlar los cambios realizados en las glosas detalle de beneficios y observaciones de la hoja previa de liquidación
// HPC_201507_PRE : Se añade a la sumatoria del detalle de liquidación el registro monto diferencial y se modifica diseño de la hoja de liquidación.
// HPC_201601_PRE		: CAMBIAR DE DO A CE AL GRABAR LA LIQUIDACION DE BENEFICIO
// HPC_201702_PRE : Se corrige inconsistencias de códigos en las actualizaciones de 
//                  Seguimiento de expedientes, liquidaciones y desembolsos
// HPC_201703_PRE : Se añade campo ASOEMAIL En el Qry que lee la maestra de asociados
// HPC_201706_PRE : Se añade a la suma el monto de la liquidación por tabla
// HPC_201802_PRE : Se modifica la presentación del previo de la liquidación de beneficios
// HPC_201805_PRE : Se adiciona registro para controlar la reliquidaciones de beneficio
// HPC_201809_PRE : Se retira procedimiento para borrar fotos del disco duro


Unit PRE230;
Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, StdCtrls, Grids, Wwdbigrd, Wwdbgrid, DBGrids, DB,
   DBClient, fcpanel, fcButton, fcImgBtn, fcShapeBtn, Mask, fcLabel,
   ppPrnabl, ppClass, ppCtrls, ppBands, ppCache, ppDB, ppDBPipe, ppDBBDE,
   ppComm, ppRelatv, ppProd, ppReport, Buttons, ppStrtch, ppSubRpt, IniFiles,
   IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdFTP, ppVar, jpeg; // SPP_201401_PRE

Type
   TFPrevioLiquidacion = Class(TForm)
      Panel1: TPanel;
      Panel2: TPanel;
      Panel3: TPanel;
      Panel5: TPanel;
      lblAsoApeNomDNI: TLabel;
      lblAsoDNI: TLabel;
      lblAsoDir: TLabel;
      lblUbigeoDir: TLabel;
      lblAsoCodMod: TLabel;
      lblCe: TLabel;
      lblUse: TLabel;
      lblUbigeoCe: TLabel;
      lblFecNom: TLabel;
      lblFecCes: TLabel;
      lblUltApo: TLabel;
      lblTotAnoApo: TLabel;
      lblNumResNom: TLabel;
      lblNumResCes: TLabel;
      dbgDetCalBen: TwwDBGrid;
      Panel4: TPanel;
      dbgDetDev: TwwDBGrid;
      Panel6: TPanel;
      dbgDetDes: TwwDBGrid;
      Panel7: TPanel;
      Panel8: TPanel;
      dbgForPag: TwwDBGrid;
      fcSalBen: TfcLabel;
      pprImprimePrevio: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppDetailBand1: TppDetailBand;
      //Inicio: SPP_201401_PRE
      // ppLabel1: TppLabel;
      // ppLabel2: TppLabel;
      // ppLabel3: TppLabel;
      //Fin: SPP_201401_PRE
      pplblLiqBen: TppLabel;
      pplfecbe: TppLabel;
      ppLine1: TppLine;
      pplAsoApeNomDni: TppLabel;
      pplAsoDni: TppLabel;
      pplZipDes: TppLabel;
      pplAsoDir: TppLabel;
      btnImprimePrevio: TBitBtn;
       ppLabel9: TppLabel;
      pplAsoCodMod: TppLabel;
      pplCentroEducativo: TppLabel;
      pplUse: TppLabel;
      pplasodstlabid: TppLabel;
      ppShape3: TppShape;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppLabel13: TppLabel;
      ppLabel14: TppLabel;
      ppLabel15: TppLabel;
      ppLabel16: TppLabel;
      pplFecNom: TppLabel;
      pplFecCes: TppLabel;
      pplAnoApo: TppLabel;
      pplNumResNoM: TppLabel;
      pplNumResCes: TppLabel;
      pplUltApo: TppLabel;
      ppLabel17: TppLabel;
      BDEPDetCalLiq: TppBDEPipeline;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppLine2: TppLine;
      ppShape4: TppShape;
      ppShape6: TppShape;
      ppLine3: TppLine;
      ppShape9: TppShape;
      ppSummaryBand1: TppSummaryBand;
      ppShape5: TppShape;
      ppShape7: TppShape;
      ppShape8: TppShape;
      ppSRDevoluciones: TppSubReport;
      ppChildRDevolucion: TppChildReport;
      ppDetailBand2: TppDetailBand;
      BDEPDetDev: TppBDEPipeline;
      ppTitleBand1: TppTitleBand;
      ppLine4: TppLine;
      ppLabel19: TppLabel;
      ppShape10: TppShape;
      ppShape11: TppShape;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppSummaryBand2: TppSummaryBand;
      ppLine5: TppLine;
      ppLabel20: TppLabel;
      ppDBCalc2: TppDBCalc;
      ppShape12: TppShape;
      ppShape13: TppShape;
      ppShape14: TppShape;
      ppShape15: TppShape;
      BDEPDetDes: TppBDEPipeline;
      BDEPForPag: TppBDEPipeline;
      BDEPRetJud: TppBDEPipeline;
      BDEPObs: TppBDEPipeline;
      btnGeneraLiquidacion: TBitBtn;
      btncerrar: TBitBtn;
      pplAsodirLab: TppLabel;
      ppldesben: TppLabel;
      pnlvalida: TPanel;
      pnlasoapenomdni: TPanel;
      measoapenomdni: TMaskEdit;
      StaticText1: TStaticText;
      Label1: TLabel;
      pnlasodni: TPanel;
      measodni: TMaskEdit;
      Label2: TLabel;
      btnvalida: TBitBtn;
      btncerrarvalida: TBitBtn;
      pnldetalles: TPanel;
      btncerrargrid: TBitBtn;
      stmensaje: TStaticText;
      dbgDetalles: TwwDBGrid;
      ppLabel4: TppLabel;
      ImagAso: TppImage;
      ppLabel5: TppLabel;
      ppLabel34: TppLabel;
      pplasotelef: TppLabel;
      ppLabel6: TppLabel;
      SRObs: TppSubReport;
      ppChildReport4: TppChildReport;
      ppTitleBand5: TppTitleBand;
      ppLine10: TppLine;
      ppLabel27: TppLabel;
      ppShape35: TppShape;
      ppShape36: TppShape;
      ppDetailBand6: TppDetailBand;
      ppShape37: TppShape;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppShape38: TppShape;
      ppSummaryBand6: TppSummaryBand;
      ppLine12: TppLine;
      ppShape39: TppShape;
      ppShape40: TppShape;
      ppLabel29: TppLabel;
      // Inicio: HPC_201506_PRE
      // Componentes retirados por modificación de reporte
      // ppShape41: TppShape;
      // ppLine13: TppLine;
      // ppLabel30: TppLabel;
      // ppLine14: TppLine;
      // pplblUsuario: TppLabel;
      // Fin: HPC_201506_PRE
      ppSRRetJud: TppSubReport;
      ppChildReport3: TppChildReport;
      ppTitleBand4: TppTitleBand;
      ppShape29: TppShape;
      ppShape30: TppShape;
      ppDetailBand5: TppDetailBand;
      ppShape31: TppShape;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppShape32: TppShape;
      ppSummaryBand5: TppSummaryBand;
      ppLine11: TppLine;
      ppLabel28: TppLabel;
      ppDBCalc5: TppDBCalc;
      ppShape33: TppShape;
      ppShape34: TppShape;
      SRForPago: TppSubReport;
      ppChildReport2: TppChildReport;
      ppTitleBand3: TppTitleBand;
      ppLine8: TppLine;
      ppLabel23: TppLabel;
      ppShape22: TppShape;
      ppShape23: TppShape;
      ppDetailBand4: TppDetailBand;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppShape24: TppShape;
      ppShape25: TppShape;
      ppSummaryBand4: TppSummaryBand;
      ppLine9: TppLine;
      ppLabel24: TppLabel;
      ppDBCalc4: TppDBCalc;
      ppShape26: TppShape;
      ppShape27: TppShape;
      ppSRDescuentos: TppSubReport;
      ppChildReport1: TppChildReport;
      ppTitleBand2: TppTitleBand;
      ppLine6: TppLine;
      ppLabel21: TppLabel;
      ppShape16: TppShape;
      ppShape17: TppShape;
      ppDetailBand3: TppDetailBand;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppShape18: TppShape;
      ppShape19: TppShape;
      ppSummaryBand3: TppSummaryBand;
      ppLine7: TppLine;
      ppLabel22: TppLabel;
      ppDBCalc3: TppDBCalc;
      ppShape20: TppShape;
      ppShape21: TppShape;
      ppShape28: TppShape;
      ppLabel25: TppLabel;
      ppLabel26: TppLabel;
      pplSalDis: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      // Inicio: HPC_201506_PRE
      // Componentes añadidos por modificación de reporte
      // ppDBCalc6: TppDBCalc;
      // Fin: HPC_201506_PRE
      ppLabel18: TppLabel;
      ppLabel31: TppLabel;
      ppLabel32: TppLabel;
      ppLabel33: TppLabel;
      ppLabel35: TppLabel;
      IdFTP1: TIdFTP;
      pplimppor: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppLabel37: TppLabel;
      // Inicio: SPP_201304_PRE - etiquetas del reporte de previo de liquidación (muestra el regimen de pensión)
      ppLabel36: TppLabel;
      pplregpen: TppLabel;
      pploriexp: TppLabel; // SPP_201306_PRE Veriable que muestra forma de origen del expediente
      ppImage1: TppImage; //  SPP_201401_PRE
      // Inicio HPC_201504_PRE : Descuentos por aplicaciones de CCI
      lblMsgCCI: TLabel; //  SPP_201401_PRE
      // fin HPC_201504_PRE : Descuentos por aplicaciones de CCI
      // Inicio: HPC_201506_PRE
      // Componentes añadidos por modificación de reporte
      ppTotbenAsi: TppLabel;
      ppLine15: TppLine;
      ppImage3: TppImage;
      // Inicio: HPC_201507_PRE
      // Se retira linea del diseño de reporte de hoja de liquidación
      // ppShape1: TppShape;
      // Fin: HPC_201507_PRE
      pplblUsuario: TppLabel;
      ppLabel104: TppLabel;
      ppLabel105: TppLabel;
      ppLine37: TppLine;
      ppLine16: TppLine;
      ppLabel3: TppLabel;
      ppLine17: TppLine;
      // Inicio: HPC_201507_PRE
      // Se añade linea del diseño de reporte de hoja de liquidación
      ppShape41: TppShape;
      // Fin: HPC_201507_PRE
      // Fin: HPC_201506_PRE
      Procedure FormActivate(Sender: TObject);
      Procedure fcShapeBtn1Click(Sender: TObject);
      Procedure dbgDetDevDblClick(Sender: TObject);
      Procedure dbgDetDesDblClick(Sender: TObject);
      Procedure btnImprimePrevioClick(Sender: TObject);
      Procedure btnGeneraLiquidacionClick(Sender: TObject);
      Procedure btncerrarClick(Sender: TObject);
      Procedure btnvalidaClick(Sender: TObject);
      Procedure btncerrarvalidaClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure btncerrargridClick(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      procedure ppDBText12Print(Sender: TObject);  // SPP_201307_PRE
      // Inicio: HPC_201506_PRE
      // Procidimiento añadido para la impresión del reporte
      procedure ppLine15Print(Sender: TObject);
      // Fin: HPC_201506_PRE
   Private
   // Inicio: HPC_201809_PRE
   // Se retira procedimiento de borrar fotos
   // Procedure BorraFotos;
   // Fin: HPC_201809_PRE
    { Private declarations }
   Public
    { Public declarations }
   End;
Var
   FPrevioLiquidacion: TFPrevioLiquidacion;

Implementation

Uses PREDM, PRE241, PRE244, PRE229;

{$R *.dfm}

Procedure TFPrevioLiquidacion.FormActivate(Sender: TObject);
Var
   xSql, xFectmp: String;
Begin
   pnldetalles.Visible := False;
   // Llenando registros para la presentación
   // Inicio: SPP_201304_PRE - Se añade los campos REGPENID, CODAFP (regimen de pension y AFP)
   // xSql := 'SELECT ASODESLAB, ASODIRLAB, ASODSTLABID, ASOID, ASOAPENOMDNI, ASOAPEPATDNI, ASOAPEMATDNI, ASONOMDNI, ASODNI, ZIPID, ASOCODMOD, ASOCODAUX, ASODESLAB, ASODSTLABID, USEID'
   xSql := 'SELECT REGPENID, CODAFP, ASODESLAB, ASODIRLAB, ASODSTLABID, ASOID, ASOAPENOMDNI, ASOAPEPATDNI, ASOAPEMATDNI, ASONOMDNI, ASODNI, ZIPID, ASOCODMOD, ASOCODAUX, ASODESLAB, ASODSTLABID, USEID'
   // Fin: SPP_201304_PRE
   // Inicio: SPP_201307_PRE
   //   + ',UPAGOID, UPROID, ASODIR, TIPDOCCOD, ASODOCNUM, ASOTELF1, IDIMAGE, ASOFRESNOM, ASORESNOM, ASOFRESCESE, ASORESCESE FROM APO201 WHERE ASOID = ' + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString);

   // Inicio: SPP_201404_PRE - CAMBIO INCLUIDO POR LY POR ERROR INDICADO POR VARAMBURU EN AMBIENTE DE PRODUCCION - 11-09-2014
   //+ ',UPAGOID, UPROID, ASODIR, TIPDOCCOD, ASODOCNUM, ASOTELF1, IDIMAGE, ASOFRESNOM, ASORESNOM, ASOFRESCESE, ASORESCESE, AUTDESAPO FROM APO201 WHERE ASOID = ' + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString);
   // Inicio: HPC_201506_PRE
   // Se añade campos AUTDESAPO, FECAUTDESAPO para que sean incluidos en el reporte 
   // + ',UPAGOID, UPROID, ASODIR, TIPDOCCOD, ASODOCNUM, ASOTELF1, IDIMAGE, ASOFRESNOM, ASORESNOM, ASOFRESCESE, ASORESCESE, AUTDESAPO, ASOAPECASDNI FROM APO201 WHERE ASOID = ' + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString);
   // Inicio: HPC_201703_PRE
   // Se añade el campo EMAIL del asociado
   //+ ',UPAGOID, UPROID, ASODIR, TIPDOCCOD, ASODOCNUM, ASOTELF1, IDIMAGE, ASOFRESNOM, ASORESNOM, ASOFRESCESE, ASORESCESE, AUTDESAPO, ASOAPECASDNI, AUTDESAPO, FECAUTDESAPO FROM APO201 WHERE ASOID = ' + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString);
     + ',UPAGOID, UPROID, ASODIR, TIPDOCCOD, ASODOCNUM, ASOTELF1, IDIMAGE, ASOFRESNOM, ASORESNOM, ASOFRESCESE, ASORESCESE, AUTDESAPO, ASOAPECASDNI, AUTDESAPO, FECAUTDESAPO, ASOEMAIL FROM APO201 WHERE ASOID = ' + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString);
   // Fin: HPC_201703_PRE

   // Fin: HPC_201506_PRE
   // Fin: SPP_201404_PRE
   // Fin: SPP_201307_PRE
   DM1.cdsAsociado.Close;
   DM1.cdsAsociado.DataRequest(xSql);
   DM1.cdsAsociado.Open;
   lblAsoApeNomDNI.Caption := DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString;
   lblAsoDNI.Caption := DM1.cdsAsociado.FieldByName('ASODNI').AsString;
   lblAsoDir.Caption := DM1.cdsAsociado.FieldByName('ASODIR').AsString;
   If Length(Trim(DM1.cdsAsociado.FieldByName('ZIPID').AsString)) = 6 Then lblUbigeoDir.Caption := DM1.desubigeo(DM1.cdsAsociado.FieldByName('ZIPID').AsString);
   lblAsoCodMod.Caption := DM1.cdsAsociado.FieldByName('ASOCODMOD').AsString;
   lblCe.Caption := DM1.cdsAsociado.FieldByName('ASODESLAB').AsString;
   If Length(Trim(DM1.cdsAsociado.FieldByName('ASODSTLABID').AsString)) = 6 Then lblUbigeoCe.Caption := DM1.desubigeo(DM1.cdsAsociado.FieldByName('ASODSTLABID').AsString);
   lblUse.Caption := DM1.desuse(DM1.cdsAsociado.FieldByName('USEID').AsString, DM1.cdsAsociado.FieldByName('UPAGOID').AsString, DM1.cdsAsociado.FieldByName('UPROID').AsString);
   lblFecNom.Caption := DM1.cdsExpLiq.FieldByName('ASOFRESNOM').AsString;
   lblNumResNom.Caption := DM1.cdsExpLiq.FieldByName('ASORESNOM').AsString;
   lblFecCes.Caption := DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsString;
   lblNumResCes.Caption := DM1.cdsExpLiq.FieldByName('ASORESCESE').AsString;
   lblUltApo.Caption := DM1.cdsExpLiq.FieldByName('PVSULTAPO').AsString;

   xFectmp := '01/' + COPY(DM1.cdsExpLiq.FieldByName('PVSULTAPO').AsString,6,2) + '/' + COPY(DM1.cdsExpLiq.FieldByName('PVSULTAPO').AsString,1,4);
   xSql := 'SELECT LAST_DAY(' + QuotedStr(xFectmp) + ') FEC_FIN FROM DUAL';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   lblTotAnoApo.Caption := DM1.tiempoTranscurrido(DM1.cdsQry.FieldByName('FEC_FIN').AsDateTime, DM1.cdsExpLiq.FieldByName('ASOFRESNOM').AsDateTime, '0');

   // Inicio: SPP_201306_PRE
   If DM1.cdsExpLiq.FieldByName('FORSOLBEN').AsString = 'O' Then pploriexp.Caption := 'ORIGEN : OFICIO INTERNO';
   If DM1.cdsExpLiq.FieldByName('FORSOLBEN').AsString = 'S' Then pploriexp.Caption := 'ORIGEN : SOLICITUD DEL BENEFICIARIO';
   // Fin: SPP_201306_PRE

   If Copy(DM1.cdsCalLiq.FieldByName('DESC').AsString, 1, 9) = 'NO EXISTE' Then
      dbgDetCalBen.Font.Color := clRed;

   // Inicio: HPC_201805_PRE
   // Se adiciona registros de monto de liquidación anterior para el caso
   // de las reliquidaciones
   If DM1.xFlg = 'R' Then
   Begin
     DM1.cdsDetCalLiq.Append;
     DM1.cdsDetCalLiq.FieldByName('DESC').AsString := 'PAGO REALIZADO POR LIQUIDACION ANTERIOR (LIQUIDACION ' + DM1.cdsExpLiq.FieldByName('BENEFDES').AsString + ' Nº ' + DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString;
     DM1.cdsDetCalLiq.FieldByName('MONTO').AsFloat := DM1.montoliquidacionanterior -(DM1.montoliquidacionanterior*2);
     DM1.cdsDetCalLiq.Post;
     DM1.cdsCalLiq.Append;
     DM1.cdsCalLiq.FieldByName('DESC').AsString := 'LIQUIDACION ANTERIOR X ' + DM1.cdsExpLiq.FieldByName('BENEFDES').AsString + ' Nº ' + DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString;
     DM1.cdsCalLiq.FieldByName('MONTO').AsCurrency := DM1.montoliquidacionanterior -(DM1.montoliquidacionanterior*2);
     DM1.cdsCalLiq.FieldByName('TIPDES').AsString := 'LA';
     DM1.cdsCalLiq.Post;
     DM1.liquidacionbeneficio := DM1.liquidacionbeneficio +  DM1.montoliquidacionanterior -(DM1.montoliquidacionanterior*2)
   End;
   // Fin: HPC_201805_PRE


   // Detalle de la liquidación
   dbgDetCalBen.ColumnByName('DESC').FooterValue := 'TOTAL BENEFICIO ASIGNADO ' + DM1.cdsExpLiq.FieldByName('BENEFDES').AsString;
   dbgDetCalBen.ColumnByName('MONTO').FooterValue := FormatFloat('###,###.#0', DM1.liquidacionbeneficio);
   // Detalle de Devoluciones
   DM1.devoluciones(DM1.cdsExpLiq.FieldByName('ASOID').AsString);
   TNumericField(DM1.cdsDetDev.FieldByName('MONTO')).DisplayFormat := '###,###,##0.00';
   dbgDetDev.ColumnByName('DESC').FooterValue := 'TOTAL DEVOLUCIONES';
   dbgDetDev.ColumnByName('MONTO').FooterValue := FormatFloat('###,###.#0', DM1.montoDevolucion);
   // Detalle de Descuentos
   DM1.descuentos(DM1.cdsExpLiq.FieldByName('ASOID').AsString);
   // Añadiendo registro si es por reliquidación

   // Inicio: HPC_201805_PRE
   // Se retira el registro de monto por liquidacion anterior para el caso de las
   // re-liquidaciones. Pasa al grupo de detalle de la liquidación.
   // If DM1.xFlg = 'R' Then
   // Begin
   //    DM1.cdsDetDes.Append;
   //    DM1.cdsDetDes.FieldByName('DESC').AsString := 'PAGO REALIZADO POR LIQUIDACION ANTERIOR (LIQUIDACION ' + DM1.cdsExpLiq.FieldByName('BENEFDES').AsString + ' Nº ' + DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString;
   //    DM1.cdsDetDes.FieldByName('MONTO').AsFloat := DM1.montoliquidacionanterior;
   //    DM1.montoDescuento := DM1.montoDescuento + DM1.cdsDetDes.FieldByName('MONTO').AsFloat;
   //    DM1.cdsDetDes.Post;
   // End;
   // Fin: HPC_201805_PRE



   DM1.totalMontoDescuento := 0;
   DM1.cdsDetDes.First;
   While Not DM1.cdsDetDes.Eof Do
   Begin
      DM1.totalMontoDescuento := DM1.totalMontoDescuento + DM1.cdsDetDes.FieldByName('MONTO').AsFloat;
      DM1.cdsDetDes.Next;
   End;
   TNumericField(DM1.cdsDetDes.FieldByName('MONTO')).DisplayFormat := '###,###,##0.00';
   dbgDetDes.ColumnByName('DESC').FooterValue := 'TOTAL DESCUENTOS';
   dbgDetDes.ColumnByName('MONTO').FooterValue := FormatFloat('###,###.#0', DM1.totalMontoDescuento);
   If (DM1.liquidacionbeneficio + DM1.montoDevolucion - DM1.totalMontoDescuento)>0 then
      fcSalBen.Caption := FloatToStrF((DM1.liquidacionbeneficio + DM1.montoDevolucion - DM1.totalMontoDescuento - DM1.montoTransferencia), ffNumber, 10, 2)
   Else
      fcSalBen.Caption := '0.00';
   // Inicio: HPC_201802_PRE
   // Nueva presentación del grupo de formas de pago
   If DM1.cdsExpLiq.FieldByName('FORSOLBEN').AsString = 'S' Then
   Begin
      // Formas de Pago
      DM1.formadepago(DM1.cdsExpLiq.FieldByname('ASOID').AsString);
      DM1.totalMontoFormadePago := 0;
      DM1.cdsForPag.First;
      While Not DM1.cdsForPag.Eof Do
      Begin
         DM1.totalMontoFormadePago := DM1.totalMontoFormadePago + DM1.cdsForPag.FieldByName('MONTO').AsFloat;
         DM1.cdsForPag.Next;
      End;
      TNumericField(DM1.cdsForPag.FieldByName('MONTO')).DisplayFormat := '###,###,##0.00';
      dbgForPag.ColumnByName('DESC').FooterValue := 'TOTAL PAGOS';
      dbgForPag.ColumnByName('MONTO').FooterValue := FormatFloat('###,###.#0', DM1.totalMontoFormadePago);
   End
   Else
   Begin
      If DM1.cdsForPag.RecordCount = 0 Then
      Begin
         DM1.cdsForPag.Append;
         DM1.cdsForPag.FieldByName('DESC').AsString := 'Sin información de desembolso';
         DM1.cdsForPag.Post;
      End;
   End;
   // Fin: HPC_201802_PRE

  // Observaciones
   DM1.observaciones(DM1.cdsExpLiq.FieldByname('ASOID').AsString);
End;

Procedure TFPrevioLiquidacion.fcShapeBtn1Click(Sender: TObject);
Begin
   pnldetalles.Visible := False;
End;

Procedure TFPrevioLiquidacion.dbgDetDevDblClick(Sender: TObject);
Begin
   If Copy(DM1.cdsDetDev.FieldByName('DESC').AsString, 1, 3) = 'DEV' Then
   Begin
      DM1.montoDevolucion := 0;
      DM1.cdsDevApo.First;
      While Not DM1.cdsDevApo.Eof Do
      Begin
         DM1.montoDevolucion := DM1.montoDevolucion + DM1.cdsDevApo.FieldByname('MONTO').AsFloat;
         DM1.cdsDevApo.Next;
      End;
      stmensaje.Caption := 'MONTO DE DEVOLUCION DE APORTES';
      pnldetalles.Visible := True;
      pnldetalles.Top := 232;
      pnldetalles.Left := 112;
      dbgDetalles.DataSource := DM1.dsDevApo;
      dbgDetalles.Selected.Clear;
      dbgDetalles.Selected.Add('TRANSANO'#9'11'#9'Año del~Aporte'#9#9);
      dbgDetalles.Selected.Add('TRANSMES'#9'11'#9'Mes del~Aporte'#9#9);
      dbgDetalles.Selected.Add('MONTO'#9'11'#9'Monto del~Aporte'#9#9);
      dbgDetalles.ApplySelected;
      TNumericField(DM1.cdsDevApo.FieldByName('MONTO')).DisplayFormat := '###,###,##0.00';
      dbgDetalles.DataSource := DM1.dsDevApo;
      dbgDetalles.ColumnByName('TRANSMES').FooterValue := 'TOTAL';
      dbgDetalles.ColumnByName('MONTO').FooterValue := FormatFloat('###,###.#0', DM1.montoDevolucion);
   End;
End;

Procedure TFPrevioLiquidacion.dbgDetDesDblClick(Sender: TObject);
Var
   xSql: String;
   creamort, creinteres, creflat, cremtocob: Double;
   credesgra, cuodes : Double;
Begin
   If Copy(DM1.cdsDetDes.FieldByName('DESC').AsString, 1, 3) = 'NIV' Then
   Begin
      DM1.montoNivApo := 0;
      DM1.cdsNivApo.First;
      While Not DM1.cdsNivApo.Eof Do
      Begin
         DM1.montoNivApo := DM1.montoNivApo + DM1.cdsNivApo.FieldByName('MONTO').AsFloat;
         DM1.cdsNivApo.Next;
      End;
      stmensaje.Caption := 'MONTO DE NIVELACION DE APORTES';
      pnldetalles.Visible := True;
      pnldetalles.Top := 232;
      pnldetalles.Left := 112;
      dbgDetalles.DataSource := DM1.dsNivApo;
      dbgDetalles.Selected.Clear;
      dbgDetalles.Selected.Add('TRANSANO'#9'11'#9'Año del~Aporte'#9#9);
      dbgDetalles.Selected.Add('TRANSMES'#9'11'#9'Mes del~Aporte'#9#9);
      dbgDetalles.Selected.Add('MONTO'#9'11'#9'Monto del~Aporte'#9#9);
      dbgDetalles.ApplySelected;
      TNumericField(DM1.cdsNivApo.FieldByName('MONTO')).DisplayFormat := '###,###,##0.00';
      dbgDetalles.ColumnByName('TRANSMES').FooterValue := 'TOTAL';
      dbgDetalles.ColumnByName('MONTO').FooterValue := FormatFloat('###,###.#0', DM1.montoNivApo);
   End;
   // Para Datagrid pago de cuotas. Se añade la columna MONCOBDESGRAV
   If Copy(DM1.cdsDetDes.FieldByName('CREDID').AsString, 1, 3) <> '' Then
   Begin
      xSql := 'SELECT 0 CRECUOTA, 0 CREAMORT, 0 CREFLAT, 0 CREINTERES, 0 CREMTOCOB, 0 MONCOBDESGRAV FROM DUAL';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      DM1.cdsQry.EmptyDataSet;
      dbgDetalles.Selected.Clear;
      dbgDetalles.Selected.Add('CRECUOTA'#9'11'#9'Cuota~Cobrada'#9#9);
      dbgDetalles.Selected.Add('CREAMORT'#9'11'#9'Amortización~Cobrada'#9#9);
      dbgDetalles.Selected.Add('CREINTERES'#9'11'#9'Interes~Cobrado'#9#9);
      dbgDetalles.Selected.Add('MONCOBDESGRAV'#9'11'#9'Desgravamen~Cobrado'#9#9);
      dbgDetalles.Selected.Add('CREFLAT'#9'11'#9'Flat~Cobrado'#9#9);
      dbgDetalles.Selected.Add('CREMTOCOB'#9'11'#9'Monto~Cobrado'#9#9);
      dbgDetalles.ApplySelected;
      TNumericField(DM1.cdsQry.FieldByName('CRECUOTA')).DisplayFormat := '###';
      TNumericField(DM1.cdsQry.FieldByName('CREAMORT')).DisplayFormat := '###,###,##0.00';
      TNumericField(DM1.cdsQry.FieldByName('CREINTERES')).DisplayFormat := '###,###,##0.00';
      TNumericField(DM1.cdsQry.FieldByName('MONCOBDESGRAV')).DisplayFormat := '###,###,##0.00';
      TNumericField(DM1.cdsQry.FieldByName('CREFLAT')).DisplayFormat := '###,###,##0.00';
      TNumericField(DM1.cdsQry.FieldByName('CREMTOCOB')).DisplayFormat := '###,###,##0.00';
      dbgDetalles.DataSource := DM1.dsQry;
      creamort := 0;
      creinteres := 0;
      creflat := 0;
      cremtocob := 0;
      credesgra := 0;
      DM1.cdsCalCuo.First;
      While Not DM1.cdsCalCuo.Eof Do
      Begin
         If DM1.cdsCalCuo.FieldByName('CREDID').AsString = DM1.cdsDetDes.FieldByName('CREDID').AsString Then
         Begin
            DM1.cdsQry.Append;
            DM1.cdsQry.FieldByName('CRECUOTA').AsString     := DM1.cdsCalCuo.FieldByName('CRECUOTA').AsString;
            DM1.cdsQry.FieldByName('CREFLAT').AsFloat       := DM1.cdsCalCuo.FieldByName('CREFLAT').AsFloat;
            DM1.cdsQry.FieldByName('MONCOBDESGRAV').AsFloat := DM1.cdsCalCuo.FieldByName('MONCOBDESGRAV').AsFloat;
            DM1.cdsQry.FieldByName('CREINTERES').AsFloat    := DM1.cdsCalCuo.FieldByName('CREINTERES').AsFloat;
            DM1.cdsQry.FieldByName('CREAMORT').AsFloat      := DM1.cdsCalCuo.FieldByName('CREAMORT').AsFloat;
            DM1.cdsQry.FieldByName('CREMTOCOB').AsFloat     := DM1.cdsCalCuo.FieldByName('CREMTO').AsFloat;
            DM1.cdsQry.Post;
            creamort := creamort     + DM1.cdsQry.FieldByName('CREAMORT').AsFloat;
            creinteres := creinteres + DM1.cdsQry.FieldByName('CREINTERES').AsFloat;
            creflat := creflat       + DM1.cdsQry.FieldByName('CREFLAT').AsFloat;
            credesgra := credesgra   + DM1.cdsQry.FieldByName('MONCOBDESGRAV').AsFloat;
            cremtocob := cremtocob   + DM1.cdsQry.FieldByName('CREMTOCOB').AsFloat;
         End;
         DM1.cdsCalCuo.Next;
      End;
      dbgDetalles.ColumnByName('CRECUOTA').FooterValue := 'TOTAL';
      dbgDetalles.ColumnByName('CREAMORT').FooterValue := FormatFloat('###,###.#0', creamort);
      dbgDetalles.ColumnByName('CREINTERES').FooterValue := FormatFloat('###,###.#0', creinteres);
      dbgDetalles.ColumnByName('CREFLAT').FooterValue := FormatFloat('###,###.#0', creflat);
      dbgDetalles.ColumnByName('MONCOBDESGRAV').FooterValue := FormatFloat('###,###.#0', credesgra);
      dbgDetalles.ColumnByName('CREMTOCOB').FooterValue := FormatFloat('###,###.#0', cremtocob);
      stmensaje.Caption := 'CUOTAS DE CREDITOS PAGADAS POR BENEFICIOS';
      pnldetalles.Visible := True;
   End;
End;

Procedure TFPrevioLiquidacion.btnImprimePrevioClick(Sender: TObject);
Var
   xSql: String;
   // Inicio: HPC_201506_PRE
   // Variable para contabilizar el total de la cuenta individual
   xnTotCtaInd: Double;
   // Fin: HPC_201506_PRE
Begin
   dm1.CargaImagenes(DM1.cdsAsociado.FieldByName('ASODNI').AsString);
   ImagAso.Picture.Assign(DM1.Jpg);
   pplblLiqBen.Caption := 'EXPEDIENTE DE BENEFICIO Nº ' + Copy(DM1.cdsExpLiq.FieldByName('PVSEXPNRO').AsString, 5, 7);
   pplfecbe.Caption := 'FECHA : ' + DateToStr(DM1.cdsExpLiq.FieldByName('FREG').AsDateTime);
   ppldesben.Caption := DM1.DevuelveValor('TGE186', 'BENEFDES', 'TIPBENEF', DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString);
   // Inicio: HPC_201506_PRE
   // Realiza sumatoria para encontrar el total de la cuenta individual
   DM1.cdsCalLiq.First;
   xnTotCtaInd := 0;
   While Not DM1.cdsCalLiq.Eof Do
   Begin
      If DM1.cdsCalLiq.FieldByName('TIPDES').AsString <> 'TC' Then
         xnTotCtaInd := xnTotCtaInd + DM1.cdsCalLiq.FieldByName('MONTO').AsCurrency;
      DM1.cdsCalLiq.Next;
   End;
   ppTotbenAsi.Caption := FloatToStrF(xnTotCtaInd,ffNumber,7,2);
   DM1.cdsCalLiq.First;
   // Fin: HPC_201506_PRE

   // Inicio: SPP_201307_PRE
   If (DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString = '01') And (DM1.cdsExpLiq.FieldByName('PVSTIPRET').AsString = '1')  Then
      ppldesben.Caption := ppldesben.Caption + ' (INVALIDEZ TEMPORAL-PARCIAL)';
   // Fin: SPP_201307_PRE
   pplAsoApeNomDni.Caption := DM1.cdsAsociado.FieldByname('ASOAPENOMDNI').AsString;
   pplAsoDni.Caption := DM1.cdsAsociado.FieldByname('ASODNI').AsString;
   pplAsoDir.Caption := DM1.cdsAsociado.FieldByname('ASODIR').AsString;
   pplZipDes.Caption := DM1.DevuelveValor('APO158', 'DPTODES', 'DPTOID', Copy(DM1.cdsAsociado.FieldByName('ZIPID').AsString, 1, 2)) + '/'
      + DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', Copy(DM1.cdsAsociado.FieldByName('ZIPID').AsString, 1, 4)) + '/'
      + DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', DM1.cdsAsociado.FieldByName('ZIPID').AsString);
   pplAsoCodMod.Caption := DM1.cdsAsociado.FieldByName('ASOCODMOD').AsString;
   // Inicio: SPP_201304_PRE - Se actualiza etiqueta de regimen de pensión en la hoja de reporte "previo de liquidación"
   pplregpen.Caption := DM1.DevuelveValor('APO105', 'REGPENABR', 'REGPENID', Copy(DM1.cdsAsociado.FieldByName('REGPENID').AsString,1,2));
   If DM1.cdsAsociado.FieldByName('REGPENID').AsString = '03' Then
   Begin
      // Inicio: SPP_201306_PRE
      // xSql := 'SELECT SUBSTR(PROV,4,2) CODAFP, PROVDES DESAFP  FROM TGE201 WHERE SUBSTR(PROV,1,1) = ''A'' AND CLAUXID = ''A''';
      xSql := 'SELECT SUBSTR(PROV,4,2) CODAFP, PROVDES DESAFP  FROM TGE201 WHERE SUBSTR(PROV,1,1) = ''A'' AND CLAUXID = ''A'''
      +' AND SUBSTR(PROV,4,2) = '+QuotedStr(DM1.cdsAsociado.FieldByName('CODAFP').AsString);
      // Fin: SPP_201306_PRE
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      pplregpen.Caption := pplregpen.Caption + ' - ' + DM1.cdsQry.FieldByName('DESAFP').AsString;
   End;
   // Fin: SPP_201304_PRE
   pplasotelef.Caption := DM1.cdsAsociado.FieldByName('ASOTELF1').AsString;
   pplCentroEducativo.Caption := DM1.cdsAsociado.FieldByName('ASODESLAB').AsString;
   pplAsodirLab.Caption := DM1.cdsAsociado.FieldByName('ASODIRLAB').AsString;
   pplasodstlabid.Caption := DM1.DevuelveValor('APO158', 'DPTODES', 'DPTOID', Copy(DM1.cdsAsociado.FieldByName('ASODSTLABID').AsString, 1, 2)) + '/'
      + DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', Copy(DM1.cdsAsociado.FieldByName('ASODSTLABID').AsString, 1, 4)) + '/'
      + DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', DM1.cdsAsociado.FieldByName('ASODSTLABID').AsString);
   xSql := 'SELECT USENOM FROM APO101 WHERE USEID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('USEID').AsString)
      + ' AND UPAGOID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString) + ' AND UPROID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   // Inicio: HPC_201506_PRE
   // Se modifica la etiqueta que decia U.S.E. por UGEL
   // pplUse.Caption := 'U.S.E. : ' + DM1.cdsQry.FieldByName('USENOM').AsString;
   pplUse.Caption := 'UGEL. : ' + DM1.cdsQry.FieldByName('USENOM').AsString;
   // Fin: HPC_201506_PRE
   If DM1.xFlg = 'R' Then
   Begin
      pplFecNom.Caption := DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString;
      pplFecCes.Caption := DM1.cdsAsociado.FieldByName('ASOFRESCESE').AsString;
      pplNumResNoM.Caption := DM1.cdsExpLiq.FieldByName('ASORESNOM').AsString;
      pplNumResCes.Caption := DM1.cdsExpLiq.FieldByName('ASORESCESE').AsString;
      pplAnoApo.Caption := lblTotAnoApo.Caption;
   End
   Else
   Begin
      pplFecNom.Caption := DM1.cdsExpLiq.FieldByName('ASOFRESNOM').AsString;
      pplFecCes.Caption := DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsString;
      pplNumResNoM.Caption := DM1.cdsExpLiq.FieldByName('ASORESNOM').AsString;
      pplNumResCes.Caption := DM1.cdsExpLiq.FieldByName('ASORESCESE').AsString;
      pplAnoApo.Caption := lblTotAnoApo.Caption;
   End;
   pplUltApo.Caption := DM1.cdsExpLiq.FieldByName('PVSULTAPO').AsString;
   pplSalDis.Caption := fcSalBen.Caption;
   pplblUsuario.Caption := UpperCase(DM1.DevuelveValor('USERTABLE', 'USERNOM', 'USERID', DM1.wUsuario));
   pplimppor.Caption := 'IMPRESO POR : ' + UpperCase(DM1.DevuelveValor('USERTABLE', 'USERNOM', 'USERID', DM1.wUsuario));
   pprImprimePrevio.Print;
   pprImprimePrevio.Stop;
End;

Procedure TFPrevioLiquidacion.btnGeneraLiquidacionClick(Sender: TObject);
Var
   xSql:String;
Begin
   // Inicio: HPC_201506_PRE
   // Se valida que cobranza haya APROBADO o RECHAZADO la cobranza por DESGRAVAMEN
   If (DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString = '02') Or (DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString = '03') Then
   Begin
      xSql := 'SELECT B.ESTAPRDES FROM ASO_FAC_GES_CAB A, ASO_FAC_GES_DET B  WHERE A.NUMMEM = '+QuotedStr('EXP'+DM1.cdsExpLiq.FieldByName('PVSEXPNRO').AsString)+' AND A.IDEGESFAL = B.IDEGESFAL AND B.ASOID = '+QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      If DM1.cdsQry.FieldByName('ESTAPRDES').AsString = 'POR APLICAR' Then
      Begin
         MessageDlg('Se necesita que el Equipo de Cobranzas, realice la Evaluación para la Aplicación del Fondo de Desgravamen sobre el asociado, sin ello, no se prodrá realizar la liquidación.', mtCustom, [mbOk], 0);
         Exit;
      End
      Else
      Begin
         If DM1.cdsQry.FieldByName('ESTAPRDES').AsString = 'NO APLICA' Then
         Begin
           DM1.cdsObs.Append;
           DM1.cdsObs.FieldByName('DESC').AsString := 'DEUDA NO APLICA AL FONDO DE PROTECCION DESGRAVAMEN';
           DM1.cdsObs.FieldByName('GRABAR').AsString := 'S';
           DM1.cdsObs.Post;
         End;
         If DM1.cdsQry.FieldByName('ESTAPRDES').AsString = 'APLICADO' Then
         Begin
           DM1.cdsObs.Append;
           DM1.cdsObs.FieldByName('DESC').AsString := 'DEUDA SI APLICA AL FONDO DE PROTECCION DESGRAVAMEN';
           DM1.cdsObs.FieldByName('GRABAR').AsString := 'S';
           DM1.cdsObs.Post;
         End;
      End;
   // Fin: HPC_201506_PRE
   End;

   If DM1.montoDiferencial < 0 Then
   Begin
     MessageDlg('Forma de cálculo no definida para monto diferencial negativo'+chr(13)
               +'                   << Bloqueo Temporal >>                   ', mtCustom, [mbOk], 0);
     Exit;
   End;

   If DM1.liquidacionbeneficio = 0 Then
   Begin
      Beep;
      MessageDlg('No existe monto asignado a esta liquidación', mtInformation, [mbOk], 0);
      Exit;
   End;
   pnlvalida.Visible := true;
   pnlvalida.Left := 152;
   pnlvalida.Top := 192;
   measoapenomdni.SetFocus;
End;

Procedure TFPrevioLiquidacion.btncerrarClick(Sender: TObject);
Begin
   FPrevioLiquidacion.Close;
End;

Procedure TFPrevioLiquidacion.btnvalidaClick(Sender: TObject);
Var
   xSql, xinicio, xfinal: String;
   xReg:String;
   montofondo:Double;
Begin
  //Primero validar el DNI y el apellido y nombre
   xSql := 'SELECT ASODNI, ASOAPENOMDNI FROM PVS301 WHERE ASOID = ' + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString) + ' AND PVSEXPNRO = ' + QuotedStr(DM1.cdsExpLiq.FieldByName('PVSEXPNRO').AsString);
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   If Trim(DM1.cdsQry.FieldByName('ASODNI').AsString) <> Trim(measodni.Text) Then
   Begin
      Beep;
      MessageDlg('DNI del asociado mal ingresada', mtInformation, [mbOk], 0);
      Exit;
   End;

   If Trim(DM1.cdsQry.FieldByName('ASOAPENOMDNI').AsString) <> Trim(measoapenomdni.Text) Then
   Begin
      Beep;
      MessageDlg('Apellidos y nombres mal ingresado', mtInformation, [mbOk], 0);
      Exit;
   End;
  //Valida si tiene cuotas bloqueadas
   If DM1.Bloqueados(DM1.cdsExpLiq.FieldByName('ASOID').AsString) Then
   Begin
      Beep;
      MessageDlg('Asociado posee crédito con al menos una cuota Bloqueada', mtInformation, [mbOk], 0);
      Exit;
   End;
  //Genera la liquidación
   If MessageDlg('¿ Seguro de crear la Liquidación ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
      DM1.DCOM1.AppServer.SOLStartTransaction;
      Try
         pnlvalida.Visible := False;
         DM1.cntanomm := Copy(DateToStr(DM1.FechaSys), 7, 4) + Copy(DateToStr(DM1.FechaSys), 4, 2);
         // Hallando numero de liquidación
         DM1.numeroLiquidacion := DM1.Gennumliq;
         DM1.Grabanivelaciones(DM1.cdsAsociado.FieldByName('ASOID').AsString);
         DM1.Grabadevoluciones(DM1.cdsAsociado.FieldByName('ASOID').AsString);
         DM1.Grabacreditos(DM1.cdsAsociado.FieldByName('ASOID').AsString);
         // Se actualiza registros de fondo solidario
         montofondo := 0;
         DM1.cdsFonSol.First;
         While Not DM1.cdsFonSol.Eof Do
         Begin
            montofondo := montofondo  + DM1.cdsFonSol.FieldByName('IMP_COB_FSC').AsFloat;
            DM1.cdsFonSol.Next;
         End;
         DM1.GrabaFondoSolidario(DM1.cdsAsociado.FieldByName('ASOID').AsString,montofondo);
         DM1.Grabaretencion(DM1.cdsAsociado.FieldByName('ASOID').AsString);
         DM1.Grabafamiliares(DM1.cdsAsociado.FieldByName('ASOID').AsString);
         DM1.Grabacartasdesignacion(DM1.cdsAsociado.FieldByName('ASOID').AsString);
         DM1.Grabadetalleliquidacion(DM1.cdsAsociado.FieldByName('ASOID').AsString);
         DM1.Grabacabeceraliquidacion(DM1.cdsAsociado.FieldByName('ASOID').AsString);
         DM1.Grabasolicitudliquidacion(DM1.cdsAsociado.FieldByName('ASOID').AsString);
         xinicio := Copy(DateToStr(DM1.cdsExpLiq.FieldByName('ASOFRESNOM').AsDateTime), 7, 4) + Copy(DateToStr(DM1.cdsExpLiq.FieldByName('ASOFRESNOM').AsDateTime), 4, 2);
         xfinal := Copy(DateToStr(DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsDateTime), 7, 4) + Copy(DateToStr(DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsDateTime), 4, 2);
         DM1.actualizaaportes(DM1.cdsAsociado.FieldByName('ASOID').AsString, DM1.numeroLiquidacion, DateToStr(DM1.FechaSys), xinicio, xfinal, 'G');
         DM1.actualizalibretasdeahorro(DM1.cdsAsociado.FieldByName('ASOID').AsString);
         DM1.actualiza_aso_resolucion;
         xSql := 'UPDATE PVS306 A SET A.MONLIQBEN = (SELECT SUM(NVL(B.PVSLMONTO,0)) FROM PVS307 B WHERE A.PVSLBENNR = ' + QuotedStr(DM1.numeroLiquidacion) + '  AND A.PVSLBENNR = B.PVSLBENNR'
         // Inicio: HPC_201506_PRE
         // Se graba el total de la cuenta individual
         // + ' AND B.PVSLAGRID = ''DET'')) WHERE A.PVSLBENNR = ' + QuotedStr(DM1.numeroLiquidacion);
         // Inicio: HPC_201507_PRE
         // Se añade registro monto diferencial al total de la cuenta individual
         // + ' AND B.PVSLAGRID = ''DET'' AND B.TIPDES IN (''FA'',''FI'',''FB'')) WHERE A.PVSLBENNR = ' + QuotedStr(DM1.numeroLiquidacion);
         // Inicio: HPC_201706_PRE
         // Se añade a la suma el monto de la liquidación por tabla
         // + ' AND B.PVSLAGRID = ''DET'' AND B.TIPDES IN (''FA'',''FI'',''FB'', ''MD'')) WHERE A.PVSLBENNR = ' + QuotedStr(DM1.numeroLiquidacion);
         // Inicio: HPC_201805_PRE
         // Se añade el monto de la liquidación anterior al grupo de detalle de la liquidación
         // + ' AND B.PVSLAGRID = ''DET'' AND B.TIPDES IN (''FA'',''FI'',''FB'', ''MD'',''BR'',''BF'',''BI'')) WHERE A.PVSLBENNR = ' + QuotedStr(DM1.numeroLiquidacion);
         + ' AND B.PVSLAGRID = ''DET'' AND B.TIPDES IN (''FA'',''FI'',''FB'', ''MD'',''BR'',''BF'',''BI'', ''LA'')) WHERE A.PVSLBENNR = ' + QuotedStr(DM1.numeroLiquidacion);         
         // Fin: HPC_201805_PRE
         // Fin: HPC_201706_PRE
         // Fin: HPC_201507_PRE
         // Fin: HPC_201506_PRE
         DM1.DCOM1.AppServer.EjecutaSQL(xSql);
         xSql := 'UPDATE PVS306 A SET A.MONDES = (SELECT SUM(NVL(B.PVSLMONTO,0)) FROM PVS307 B WHERE A.PVSLBENNR = ' + QuotedStr(DM1.numeroLiquidacion) + '  AND A.PVSLBENNR = B.PVSLBENNR'
            + ' AND B.PVSLAGRID = ''DSC'') WHERE A.PVSLBENNR = ' + QuotedStr(DM1.numeroLiquidacion);
         DM1.DCOM1.AppServer.EjecutaSQL(xSql);
         xSql := 'UPDATE PVS306 A SET A.MONDEV = (SELECT SUM(NVL(B.PVSLMONTO,0)) FROM PVS307 B WHERE A.PVSLBENNR = ' + QuotedStr(DM1.numeroLiquidacion) + '  AND A.PVSLBENNR = B.PVSLBENNR'
            + ' AND B.PVSLAGRID = ''DEV'') WHERE A.PVSLBENNR = ' + QuotedStr(DM1.numeroLiquidacion);
         DM1.DCOM1.AppServer.EjecutaSQL(xSql);
         xSql := 'UPDATE PVS306 A SET A.MONPAG = (SELECT SUM(NVL(B.PVSLMONTO,0)) FROM PVS307 B WHERE A.PVSLBENNR = ' + QuotedStr(DM1.numeroLiquidacion) + '  AND A.PVSLBENNR = B.PVSLBENNR'
            + ' AND B.PVSLAGRID IN  (''FPG'', ''RET'')) WHERE A.PVSLBENNR = ' + QuotedStr(DM1.numeroLiquidacion);
         DM1.DCOM1.AppServer.EjecutaSQL(xSql);
         // INICIO HPC_201601_PRE - CAMBIAR DE DO A CE AL GRABAR LA LIQUIDACION DE BENEFICIO
         xSql := 'UPDATE APO201 SET ASOTIPID = ''CE'', ASOSITID = ''CE'' WHERE ASOID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString);
         DM1.DCOM1.AppServer.EjecutaSQL(xSql);
         // FIN HPC_201601_PRE
         // SE ACTUALIZA EL CAMPO DE FALLECIDO EN MAESTRO SI LIQ ES POR FALLECIMIENTO
         If DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString='02' then
         Begin
            xReg :=  DM1.CodReg;
            DM1.Registro_Aud(DM1.cdsAsociado.FieldByName('ASOID').AsString,'0', xReg);
            xSQL := 'update APO201 '
                   +'set FALLECIDO=''S'', TIPO_FALL_ID=''X LIQ.FALL'' '
                   +'where ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString);
            DM1.DCOM1.AppServer.EjecutaSQL(xSql);
            DM1.Registro_Aud(DM1.cdsAsociado.FieldByName('ASOID').AsString,'1',xReg);
         End;
         // Inicio: SPP_201307_PRE
         // Se actualiza el campo de Invalidez en el maestro de asociados si la Liq. es por Invalidez
         If DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString='03' then
         Begin
            xReg :=  DM1.CodReg;
            DM1.Registro_Aud(DM1.cdsAsociado.FieldByName('ASOID').AsString,'0', xReg);
            xSQL := 'Update APO201 Set INVALIDEZ = ''S'', TIPO_INVA_ID = ''X LIQ.INVA'' Where ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString);
            DM1.DCOM1.AppServer.EjecutaSQL(xSql);
            DM1.Registro_Aud(DM1.cdsAsociado.FieldByName('ASOID').AsString,'1',xReg);
         End;
         // Fin: SPP_201307_PRE
         // Inicio HPC_201504_PRE : Descuentos por aplicaciones de CCI
         xSQL:='Update COB_APLI_CCI_DET '
              +   'SET NUMLIQBEN = '+QuotedStr( DM1.numeroLiquidacion )
              + 'where ASOID='+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' and NUMLIQBEN is null';
         DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
         // Fin    HPC_201504_PRE : Descuentos por aplicaciones de CCI
      Except
         MessageDlg('Error al intentar actualizar la Base de datos', mtInformation, [mbOk], 0);
         DM1.DCOM1.AppServer.SOLRollBack;
         btnGeneraLiquidacion.Enabled := False;
         DM1.xSgr := 'G';
         btncerrar.OnClick(btncerrar);
         Exit;
      End;
      DM1.DCOM1.AppServer.SOLCommit;
      //Inicio: SPP_201401_PRE
      // Si es reliquidación. Se verifica que item sigue
      If DM1.xFlg = 'R' Then
      Begin
         // RELIQUIDADO
         xSql := 'Begin SP_PVS_SEG_EXP('+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+', '+QuotedStr(DM1.cdsExpLiq.FieldByName('PVSEXPNRO').AsString)
         +', ''03'', ''11'', TO_DATE(SYSDATE,''DD/MM/YYYY''), '+QuotedStr(DM1.wUsuario)+', NULL); End;';
         DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      End
      Else
      Begin
         // LIQUIDADO
         xSql := 'Begin SP_PVS_SEG_EXP('+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+', '+QuotedStr(DM1.cdsExpLiq.FieldByName('PVSEXPNRO').AsString)
         // Inicio: HPC_201702_PRE
         // Se modifica el código de liquidado. Debe ser 20.
         // 03 EN TRAMITE - 20 LIQUIDADO
         // +', ''03'', ''07'', TO_DATE(SYSDATE,''DD/MM/YYYY''), '+QuotedStr(DM1.wUsuario)+', NULL); End;';
         +', ''03'', ''20'', TO_DATE(SYSDATE,''DD/MM/YYYY''), '+QuotedStr(DM1.wUsuario)+', NULL); End;';
         // Fin: HPC_201702_PRE
         DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      End;
      //Fin: SPP_201401_PRE
      MessageDlg('Liquidación Generada de manera satisfactoria', mtInformation, [mbOk], 0);
      btnGeneraLiquidacion.Enabled := False;
      DM1.xSgr := 'G';
      btncerrar.OnClick(btncerrar);
   End;
End;

Procedure TFPrevioLiquidacion.btncerrarvalidaClick(Sender: TObject);
Begin
   pnlvalida.Visible := False;
End;

Procedure TFPrevioLiquidacion.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   Action := caFree;
End;

Procedure TFPrevioLiquidacion.btncerrargridClick(Sender: TObject);
Begin
   pnldetalles.Visible := False;
End;

Procedure TFPrevioLiquidacion.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If Key = #13 Then
   Begin
      Key := #0;
      Perform(CM_DIALOGKEY, VK_TAB, 0);
   End;
End;

// Inicio: HPC_201809_PRE
// Se retira procedimiento de borrar fotos
// Procedure TFPrevioLiquidacion.BorraFotos;
// Var
//    search: TSearchRec;
//    nFiles: integer;
// Begin
//    nFiles := FindFirst('C:\SOLEXES\*.JPG', faAnyFile, search);
//    While nFiles = 0 Do
//    Begin
//       SysUtils.DeleteFile('C:\SOLEXES\' + Search.Name);
//       nFiles := FindNext(Search);
//    End;
//    FindClose(Search);
// End;
// Fin: HPC_201809_PRE



// Inicio: SPP_201307_PRE
procedure TFPrevioLiquidacion.ppDBText12Print(Sender: TObject);
begin
  If Copy(DM1.cdsObs.FieldByName('DESC').AsString,1,5) = 'SALDO' Then
     ppDBText12.BlankWhenZero := False
  Else
     ppDBText12.BlankWhenZero := True;
End;
// Fin: SPP_201307_PRE

// Inicio: HPC_201506_PRE
// Se controla la linea de total de cuenta individual en el reporte hoja previa de liquidación. 
procedure TFPrevioLiquidacion.ppLine15Print(Sender: TObject);
begin
  If DM1.cdsCalLiq.FieldByName('TIPDES').AsString = 'TC' Then
     ppLine15.Visible := True
  Else
     ppLine15.Visible := False;
end;
// Fin: HPC_201506_PRE

End.
