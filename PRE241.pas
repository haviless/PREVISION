// Inicio Uso Estándares   :	01/08/2011
// Unidad		            :	PRE241.pas
// Formulario		         :	FDepProsegur
// Fecha de Creación	      :	15/12/1993
// Autor			            :	Área de Desarrollo de Sistemas
// Objetivo		            :  Liquidación de Beneficios
// Actualizaciones:
// HPC_200906_PRE                  : Marca Beneficio por Fallecimiento en Maestro Asociados
// HPC_201003_PRE (HPP_201004_PRE) : Devoluciones al FSC
// HPC_201110_PRE	   02/08/2011    : Cambia Título de Re-Liquidaciones ("RE-LIQUIDACION..")
// HPC_201110_PRE	- HPP_201106_PRE : Pase a Producción el 12/08/2011
// HPC_201202_PRE 10/02/20002 Desactiva lectura de Foto y Firma de FTP, lee de archivo RENIEC
// DPP_201201_PRE  : Se realiza el pase a producción de acuerdo al HPC_201202_PRE
// HPC_201207_PRE  : Inserta cambio por implementación de Fondo de Desgravamen
// DPP_201207_PRE  : Se realiza el pase a producción a partir del HPC_201207
// HPC_201303_PRE  : Se añade etiqueta de regimen de pensión a la hoja de reporte del previo de liquidación.
// SPP_201304_PRE  : Se realiza el pase a produccion a partir del HPC_201303_PRE
// HPC_201305_PRE  : Se añade etiqueta que muestra cual es el origen del expediente que origino la liquidación
// SPP_201306_PRE  : Se realiza el pase a producción a partir del HPC_201305_PRE
// HPC_201306_PRE  : Se añade mensaje en la glosa observación de la hoja de liquidación de beneficio
//                   Se añade mensaje "RETIRO (INVALIDEZ TEMPORAL-PARCIAL)"  
// SPP_201307_PRE  : Se realiza el pase a producción a partir del HPC_201306_PRE.
// HPC_201307_PRE  : Se añade nuevo logo institucional
//                   Se coloca hito para el seguimiento de expediente     
// SPP_201401_PRE  : Se realiza el pase a producción a partir del pase HPC_201307_PRE
// HPC_201504_PRE  : Descuentos por aplicaciones de CCI
// HPC_201506_PRE : Se realiza modificaciones para controlar los cambios realizados en las glosas detalle de beneficios y observaciones de la hoja de liquidación
// HPC_201507_PRE : Se modifica el diseño de la hoja de liquidación de beneficio
// HPC_201601_PRE		: CAMBIAR DE DO A CE AL GRABAR LA LIQUIDACION DE BENEFICIO
// HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
// HPC_201704_PRE : Se modifica el script de insert en las tablas cabecera y detalle de liquidación
// HPC_201705_PRE : Se deshabilita botones de la forma de liquidaciòn de beneficios.
// HPC_201802_PRE : Se modifica la el mensaje de la forma de desembolso
// HPC_201809_PRE : Se añade boton para impresión cheque de gerencia.
//                  Se modifica reporte hoja de liquidación.

Unit PRE241;

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, StdCtrls, Grids, Wwdbigrd, Wwdbgrid, DBGrids, DB,
   DBClient, fcpanel, fcButton, fcImgBtn, fcShapeBtn, Mask, fcLabel,
   ppPrnabl, ppClass, ppCtrls, ppBands, ppCache, ppDB, ppDBPipe, ppDBBDE,
   ppComm, ppRelatv, ppProd, ppReport, Buttons, ppStrtch, ppSubRpt,
   ppParameter, DBCtrls, ppVar, jpeg, IniFiles, IdBaseComponent,
   // Inicio: HPC_201809_PRE
   // Se añade componente ppBarCod
   // IdComponent, IdTCPConnection, IdTCPClient, IdFTP, wwdbdatetimepicker;
   IdComponent, IdTCPConnection, IdTCPClient, IdFTP, wwdbdatetimepicker, ppBarCod,
  ppRegion;
   // Fin: HPC_201809_PRE

Type
   TFLiquidacionBeneficio = Class(TForm)
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
      BDEPDetCalLiq: TppBDEPipeline;
      BDEPDetDev: TppBDEPipeline;
      BDEPDetDes: TppBDEPipeline;
      BDEPForPag: TppBDEPipeline;
      BDEPRetJud: TppBDEPipeline;
      BDEPObs: TppBDEPipeline;
      ppParameterList1: TppParameterList;
      pnlanula: TPanel;
      gbanula: TGroupBox;
      btnconfirmaanula: TBitBtn;
      btncerraranulacion: TBitBtn;
      Label1: TLabel;
      Label2: TLabel;
      Panel9: TPanel;
      meusuanu: TEdit;
      Panel10: TPanel;
      mefecanu: TEdit;
      Panel11: TPanel;
      meobs: TEdit;
      Label3: TLabel;
      pprdesdev: TppReport;
      ppbdepcreditos: TppBDEPipeline;
      ppDetailBand7: TppDetailBand;
      ppbdepnivapo: TppBDEPipeline;
      ppbdepdevapo: TppBDEPipeline;
      srcreditos: TppSubReport;
      ppChildReport9: TppChildReport;
      ppDetailBand8: TppDetailBand;
      ppSummaryBand7: TppSummaryBand;
      ppDBText13: TppDBText;
      ppDBText16: TppDBText;
      ppDBText17: TppDBText;
      ppDBText18: TppDBText;
      ppDBText19: TppDBText;
      ppDBText36: TppDBText;
      ppLabel67: TppLabel;
      ppShape54: TppShape;
      ppLabel68: TppLabel;
      ppLabel69: TppLabel;
      ppLabel70: TppLabel;
      ppLabel71: TppLabel;
      ppLabel72: TppLabel;
      ppShape55: TppShape;
      ppShape56: TppShape;
      ppShape57: TppShape;
      ppLabel73: TppLabel;
      ppShape58: TppShape;
      ppShape59: TppShape;
      ppLabel76: TppLabel;
      ppLabel75: TppLabel;
      ppDBCalc12: TppDBCalc;
      ppDBCalc13: TppDBCalc;
      ppDBCalc14: TppDBCalc;
      ppLine22: TppLine;
      ppDBCalc15: TppDBCalc;
      ppLabel99: TppLabel;
      ppHeaderBand4: TppHeaderBand;
      ppLine27: TppLine;
      ppTitleBand6: TppTitleBand;
      pnlmenanu: TPanel;
      ppsrdevapo: TppSubReport;
      ppChildReport6: TppChildReport;
      ppLabel86: TppLabel;
      ppShape63: TppShape;
      ppLabel87: TppLabel;
      ppLabel89: TppLabel;
      ppLabel91: TppLabel;
      ppDetailBand13: TppDetailBand;
      ppDBText21: TppDBText;
      ppDBTmes: TppDBText;
      ppDBText23: TppDBText;
      ppSummaryBand13: TppSummaryBand;
      ppLine25: TppLine;
      ppLabel93: TppLabel;
      ppDBCalc17: TppDBCalc;
      ppsrnivapo: TppSubReport;
      ppChildReport5: TppChildReport;
      ppLabel78: TppLabel;
      ppShape60: TppShape;
      ppShape61: TppShape;
      ppLabel79: TppLabel;
      ppShape62: TppShape;
      ppLabel81: TppLabel;
      ppLabel83: TppLabel;
      ppDetailBand9: TppDetailBand;
      ppDBText14: TppDBText;
      ppDBText15: TppDBText;
      ppDBText20: TppDBText;
      ppSummaryBand9: TppSummaryBand;
      ppLine23: TppLine;
      ppLine24: TppLine;
      ppLabel85: TppLabel;
      ppDBCalc16: TppDBCalc;
      btnImprimePrevio: TBitBtn;
      btndesdev: TBitBtn;
      btnanula: TBitBtn;
      btncerrar: TBitBtn;
      btnmodresnom: TBitBtn;
      btnmodforpag: TBitBtn;
      pnldetalles: TPanel;
      btncerrargrid: TBitBtn;
      stmensaje: TStaticText;
      dbgDetalles: TwwDBGrid;
      ppHeaderBand1: TppHeaderBand;
//Inicio: SPP_201401_PRE
      // ppLabel1: TppLabel; 
      // ppLabel2: TppLabel; 
      // ppLabel3: TppLabel; 
//Fin: SPP_201401_PRE
      pplblLiqBen: TppLabel;
      ppldesben: TppLabel;
      pplfecliq: TppLabel;
      ppLine1: TppLine;
      ppLabel7: TppLabel;
      pplAsoApeNomDni: TppLabel;
      pplAsoDni: TppLabel;
      pplZipDes: TppLabel;
      pplAsoDir: TppLabel;
      pplAsoCodMod: TppLabel;
      pplCentroEducativo: TppLabel;
      pplUse: TppLabel;
      pplUseZip: TppLabel;
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
      ppLine2: TppLine;
      ppLabel17: TppLabel;
      ppShape4: TppShape;
      ppShape7: TppShape;
      ppDetailBand1: TppDetailBand;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppShape6: TppShape;
      ppShape5: TppShape;
      ppSummaryBand1: TppSummaryBand;
      ppLine3: TppLine;
      ppLabel18: TppLabel;
      // Inicio: HPC_201506_PRE
      // Se retira componente que realizaba sumatoria del monto de la liquidación.
      // ppDBCalc1: TppDBCalc;
      // Fin: HPC_201506_PRE
      ppShape9: TppShape;
      ppShape8: TppShape;
      ppSRDevoluciones: TppSubReport;
      ppChildRDevolucion: TppChildReport;
      ppTitleBand1: TppTitleBand;
      ppLine4: TppLine;
      ppLabel19: TppLabel;
      ppShape10: TppShape;
      ppShape11: TppShape;
      ppDetailBand2: TppDetailBand;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppShape14: TppShape;
      ppShape15: TppShape;
      ppSummaryBand2: TppSummaryBand;
      ppLine5: TppLine;
      ppLabel20: TppLabel;
      ppDBCalc2: TppDBCalc;
      ppShape12: TppShape;
      ppShape13: TppShape;
      ppLabel5: TppLabel;
      ppLabel4: TppLabel;
      pplasotelef: TppLabel;
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
      // Se retira linea en el reporte de hoja de liquidación,
      // ppShape41: TppShape;
      // Fin: HPC_201506_PRE
      // Inicio: HPC_201809_PRE
      // Se retiran variable no usadas
      // ppLine13: TppLine;
      // ppLabel30: TppLabel;
      // ppLine14: TppLine;
      // pplblUsuario: TppLabel;
      // Fin: HPC_201809_PRE
      ppanula: TppLabel;
      pplimppor: TppLabel;
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
      ppLabel33: TppLabel;
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
      ppLabel32: TppLabel;
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
      ppLabel6: TppLabel;
      ppLabel31: TppLabel;
      ImagAso: TppImage;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel34: TppLabel;
      ppLabel35: TppLabel;
      ppLabel36: TppLabel;
      IdFTP1: TIdFTP;
      ppSystemVariable1: TppSystemVariable;
      ppLabel37: TppLabel;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppLabel38: TppLabel;
      ppLine15: TppLine;
      ppDBCalc6: TppDBCalc;
      ppDBCalc7: TppDBCalc;
      ppDBCalc8: TppDBCalc;
      ppLine16: TppLine;
      ppDBCalc9: TppDBCalc;
      ppLabel39: TppLabel;
      ppLabel40: TppLabel;
      ppDBText22: TppDBText;
      ppLabel41: TppLabel;
      ppLabel42: TppLabel;
      ppShape1: TppShape;
    ppbdepfonsol: TppBDEPipeline;
    ppLine20: TppLine;
    ppSystemVariable3: TppSystemVariable;
//Inicio: SPP_201401_PRE
    // ppLabel61: TppLabel; 
    // ppLabel62: TppLabel; 
//Fin: SPP_201401_PRE
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    pppvslbennr: TppLabel;
    ppasoapenomdni: TppLabel;
    ppLabel94: TppLabel;
    ppLabel95: TppLabel;
    pppvslfecbe: TppLabel;
    ppLabel96: TppLabel;
    pptipobenabr: TppLabel;
    ppLabel97: TppLabel;
    ppLabel98: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppFooterBand1: TppFooterBand;
    ppTitleBand7: TppTitleBand;
    ppTitleBand9: TppTitleBand;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel50: TppLabel;
    ppLine19: TppLine;
    ppLine21: TppLine;
    ppLine28: TppLine;
    ppLine29: TppLine;
    ppLine30: TppLine;
    ppLine26: TppLine;
    ppLine31: TppLine;
    srFonSol: TppSubReport;
    ppChildReport8: TppChildReport;
    ppTitleBand10: TppTitleBand;
    ppDetailBand11: TppDetailBand;
    ppSummaryBand8: TppSummaryBand;
    ppDBText29: TppDBText;
    ppShape45: TppShape;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppShape46: TppShape;
    ppLabel54: TppLabel;
    ppShape47: TppShape;
    ppLabel55: TppLabel;
    ppShape48: TppShape;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLine33: TppLine;
    ppLine34: TppLine;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppLine35: TppLine;
    ppDBCalc11: TppDBCalc;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel49: TppLabel;
    ppLabel51: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLabel74: TppLabel;
    ppLabel77: TppLabel;
    ppLabel80: TppLabel;
    ppLabel82: TppLabel;
    ppLabel84: TppLabel;
    ppDBText24: TppDBText;
    ppDBCalc10: TppDBCalc;
    ppDBCalc18: TppDBCalc;
    ppLabel88: TppLabel;
    ppShape2: TppShape;
    // Inicio: SPP_201304_PRE etiquetas del reporte de previo de liquidación (muestra el regimen de pensión)
    ppLabel90: TppLabel;
    pplregpen: TppLabel;
//Inicio: SPP_201401_PRE
    pploriexp: TppLabel; 
    ppImage1: TppImage;  
    ppImage2: TppImage;  
// Inicio HPC_201504_PRE  : Descuentos por aplicaciones de CCI
    srCCI: TppSubReport;
    ppChildReport7: TppChildReport;
    dbeCCI: TppBDEPipeline;
    ppTitleBand8: TppTitleBand;
    ppDetailBand10: TppDetailBand;
    ppSummaryBand10: TppSummaryBand;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppShape42: TppShape;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppShape43: TppShape;
    ppShape44: TppShape;
    ppLabel61: TppLabel;
    ppLabel92: TppLabel;
    ppLabel100: TppLabel;
    ppLabel102: TppLabel;
    ppDBText27: TppDBText;
    ppShape49: TppShape;
    ppLabel3: TppLabel;
    ppLabel62: TppLabel;
    ppDBText28: TppDBText;
    ppDBCalc19: TppDBCalc;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine32: TppLine;
    ppLabel101: TppLabel;
    ppLabel103: TppLabel;
    // Inicio: HPC_201506_PRE
    // Se añaden componentes para la nueva hoja de liquidación de beneficios.
    ppTotbenAsi: TppLabel;
    ppLine36: TppLine;
    // Inicio: HPC_201809_PRE
    // Se retiran variables no usadas
    // ppLabel104: TppLabel;
    // ppLabel105: TppLabel;
    // ppLine37: TppLine;
    // ppImage3: TppImage;
    // ppShape41: TppShape;
    // Fin: HPC_201809_PRE
    // Fin: HPC_201506_PRE
// Fin HPC_201504_PRE  : Descuentos por aplicaciones de CCI

//Fin: SPP_201401_PRE
    // Fin: SPP_201304_PRE
// Inicio   HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
    lblFec: TLabel;
    Panel12: TPanel;
    lblOpe: TLabel;
    Panel13: TPanel;
    meNumOpe: TEdit;
    meFecOpe: TwwDBDateTimePicker;
    bbtnCopiar: TBitBtn;
    bbtnNueva: TBitBtn;
    bbtnActFP: TBitBtn;
    bbtnFecDif: TBitBtn;
    pnlDiferido: TPanel;
    GroupBox1: TGroupBox;
    bbtnCerrarDif: TBitBtn;
    bbtnConfirmaDif: TBitBtn;
    Label6: TLabel;
    Panel15: TPanel;
    dbdtpFecDif: TwwDBDateTimePicker;
    Bevel1: TBevel;
    lblNumLiq: TLabel;
    lblFecLiq: TLabel;
    lblFecDif: TLabel;
    lblDif: TLabel;
    Label7: TLabel;
    // Inicio: HPC_201809_PRE
    // Se añaden etiquetas para el nuevo reporte de cheque de gerencia.
    btncheger: TBitBtn;
    pprcarrec: TppReport;
    ppDetailBand12: TppDetailBand;
    ppLabel106: TppLabel;
    ppLabel107: TppLabel;
    ppLabel108: TppLabel;
    ppLabel109: TppLabel;
    ppLabel110: TppLabel;
    pplpvsnombre: TppLabel;
    ppldni: TppLabel;
    pplfecha: TppLabel;
    ppLabel111: TppLabel;
    ppLabel112: TppLabel;
    ppLabel113: TppLabel;
    ppldes01: TppLabel;
    ppLabel114: TppLabel;
    ppLabel115: TppLabel;
    ppLabel116: TppLabel;
    ppLabel117: TppLabel;
    ppLabel118: TppLabel;
    ppLabel119: TppLabel;
    ppLabel120: TppLabel;
    ppLabel121: TppLabel;
    ppLabel122: TppLabel;
    ppLabel123: TppLabel;
    ppLabel124: TppLabel;
    ppLabel125: TppLabel;
    ppLabel126: TppLabel;
    ppbcDNI: TppBarCode;
    ppImage4: TppImage;
    ppLabel127: TppLabel;
    ppLabel128: TppLabel;
    ppLabel130: TppLabel;
    ppLabel131: TppLabel;
    ppLabel133: TppLabel;
    pplfechahora: TppLabel;
    pprregcheger: TppRegion;
    pplchegen01: TppImage;
    pplchegen02: TppLine;
    pplchegen03: TppLabel;
    pplchegen05: TppLabel;
    pplchegen04: TppLine;
    pplchegen06: TppLabel;
    pplchegen07: TppLabel;
    pplchegen08: TppLabel;
    pplchegen09: TppLabel;
    ppImage3: TppImage;
    ppLine13: TppLine;
    ppLabel30: TppLabel;
    pplbendepctacajnac: TppLabel;
    ppLine14: TppLine;
    ppldnidepctacajnac: TppLabel;
    ppLabel132: TppLabel;
    ppLabel134: TppLabel;
    ppLabel135: TppLabel;
    pprregdepctacajmon: TppRegion;
    pprregotros: TppRegion;
    pplotraforpag02: TppLabel;
    pplliquidadopor: TppLabel;
    pplotraforpag01: TppLine;
    pplotraforpag05: TppLabel;
    pplotraforpag04: TppLine;
    pplotraforpag08: TppLabel;
    pplotraforpag07: TppLine;
    pplotraforpag06: TppImage;
    ppLine37: TppLine;
    ppImage5: TppImage;
    // Fin: HPC_201809_PRE
// Fin    HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios

      Procedure FormActivate(Sender: TObject);
      Procedure fcShapeBtn1Click(Sender: TObject);
      Procedure dbgDetDevDblClick(Sender: TObject);
      Procedure dbgDetDesDblClick(Sender: TObject);
      Procedure btnImprimePrevioClick(Sender: TObject);
      Procedure btnconfirmaanulaClick(Sender: TObject);
      Procedure btncerrarClick(Sender: TObject);
      Procedure btnanulaClick(Sender: TObject);
      Procedure btncerraranulacionClick(Sender: TObject);
      Procedure btncerrargridClick(Sender: TObject);
      Procedure btnmodforpagClick(Sender: TObject);
      Procedure btnmodresnomClick(Sender: TObject);
      Procedure btndesdevClick(Sender: TObject);
      Procedure srcreditosPrint(Sender: TObject);
      Procedure ppsrnivapoPrint(Sender: TObject);
      Procedure ppsrdevapoPrint(Sender: TObject);
      Procedure ppDBText8Print(Sender: TObject);
      Procedure ppDBText10Print(Sender: TObject);
      Procedure ppLabel39Print(Sender: TObject);
      procedure ppDBText12Print(Sender: TObject); // SPP_201307_PRE
      // Inicio: HPC_201506_PRE
      // Se controla impresión de linea en el total de cuenta individual
      procedure ppLine36Print(Sender: TObject);
      // Fin: HPC_201506_PRE
      // Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
      procedure bbtnCopiarClick(Sender: TObject);
      procedure bbtnNuevaClick(Sender: TObject);
      procedure bbtnActFPClick(Sender: TObject);
      procedure bbtnFecDifClick(Sender: TObject);
      procedure bbtnCerrarDifClick(Sender: TObject);
      procedure bbtnConfirmaDifClick(Sender: TObject);
      // Inicio: HPC_201809_PRE
      // Se añade boton para imprimir cheque de gerencia
      procedure btnchegerClick(Sender: TObject);
      // Fin: HPC_201809_PRE

      // Fin    HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
   Private
      // Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
      sNuevaLiq : String;
      // Fin    HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
      Procedure AnulaPagos(xAsoId, xCreDid, xDocPag, xFrmPag, xFecPag: String);
      Procedure AplicaSaldoPre(xAsoId, xCreDid: String);
      Procedure AnulCuota(tAsoid, tCreDid, tCreCuota, tEstado: String; tCremtoCob: Currency);
      Procedure DistCrono(xAsoId, xCredId, xCreCuota, xCreEstid, xCreEstado, xCrefPag: String; xCremtoCob, xCremToInt, xCremtoExc: Currency);
      Function SumaExceso(xAsoId, xCredId, xCreCuota: String): Currency;
      Procedure repcarabo;
      Procedure BorraFotos;
      // Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
      Procedure BotonesEstado( bEstado : Boolean );
      Procedure CopiaBeneficio;
      Procedure GrabaDetFamilia;
      Procedure CopiarLiquidacion;
      Procedure ActualizarDetalleLiquidacion;
      // Fin    HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios

    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FLiquidacionBeneficio: TFLiquidacionBeneficio;

Implementation

// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
Uses PREDM, PRE242, PRE244, PRE246, PRE254, Math;
// Fin  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios

{$R *.dfm}

Procedure TFLiquidacionBeneficio.FormActivate(Sender: TObject);
Var
   xSql: String;
Begin
// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
   sNuevaLiq := 'N';
   pnlanula.Visible := False;
   pnldetalles.Visible := False;
   // Verificando si la liquidación ya esta anulada  o extornada
   If (DM1.cdsCabLiq.FieldByName('PVSESTLIQ').AsString = '13') Or (DM1.cdsCabLiq.FieldByName('PVSESTLIQ').AsString = '04') Then
   Begin
      pnlmenanu.Visible := True;
      btnanula.Enabled := False;
      btnmodforpag.Enabled := False;
      btnmodresnom.Enabled := False;
      bbtnCopiar.Visible := False;
      bbtnActFP.Visible := False;
      bbtnFecDif.Visible := False;
   End
   Else
   begin
      bbtnCopiar.Visible:= True;
      pnlmenanu.Visible := False;
   end;
// Fin  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios

   // Verificando si se va ha Anular o ha Extornar
   If DM1.cdsCabLiq.FieldByName('CNTFLAG').AsString = 'S' Then
      btnanula.Caption := 'Extornar'
   Else
      btnanula.Caption := 'Anular';

   // Inicio: HPC_201705_PRE
   // Se desactivan botones que no son usados al momento de mostrar
   // la liquidación desde la opción de extornos de desembolso. 
   If DM1.xFlg = 'R' Then
   Begin
      btnmodforpag.Visible := False;
      btnanula.Visible := False;
      bbtnCopiar.Visible := False;
      bbtnActFP.Visible := False;
      bbtnFecDif.Visible := False;
   End;
   // Fin: HPC_201705_PRE

   // Inicio: HPC_201809_PRE
   // Se valida que la impresión solo sea para origen de expediente sede central y usuario de sede central
   If (DM1.wofides = '01') And  (DM1.cdsCabLiq.FieldByName('OFIORIEXP').AsString = '01') Then
      btncheger.Enabled := True
   Else
      btncheger.Enabled := False;
   // Fin: HPC_201809_PRE

   // Llenando registros para la presentación
   lblAsoApeNomDNI.Caption := DM1.cdsCabLiq.FieldByName('ASOAPENOMDNI').AsString;
   lblAsoDNI.Caption := DM1.cdsCabLiq.FieldByName('ASODNI').AsString;
   lblAsoDir.Caption := DM1.cdsCabLiq.FieldByName('ASODIR').AsString;
   If Length(Trim(DM1.cdsCabLiq.FieldByName('ZIPID').AsString)) = 6 Then lblUbigeoDir.Caption := DM1.desubigeo(DM1.cdsCabLiq.FieldByName('ZIPID').AsString);
   lblAsoCodMod.Caption := DM1.cdsCabLiq.FieldByName('ASOCODMOD').AsString;
   lblCe.Caption := DM1.cdsCabLiq.FieldByName('ASODESLAB').AsString;
   If Length(Trim(DM1.cdsCabLiq.FieldByName('ASODSTLABID').AsString)) = 6 Then lblUbigeoCe.Caption := DM1.desubigeo(DM1.cdsCabLiq.FieldByName('ASODSTLABID').AsString);
   lblUse.Caption := DM1.desuse(DM1.cdsCabLiq.FieldByName('USEID').AsString, DM1.cdsCabLiq.FieldByName('UPAGOID').AsString, DM1.cdsCabLiq.FieldByName('UPROID').AsString);
   lblFecNom.Caption := DM1.cdsCabLiq.FieldByName('ASOFRESNOM').AsString;
   lblFecCes.Caption := DM1.cdsCabLiq.FieldByName('ASOFRESCESE').AsString;
   lblNumResNom.Caption := DM1.cdsCabLiq.FieldByName('ASORESNOM').AsString;
   lblNumResCes.Caption := DM1.cdsCabLiq.FieldByName('ASORESCESE').AsString;
   lblUltApo.Caption := DM1.cdsCabLiq.FieldByName('PVSLULAP').AsString;
   lblTotAnoApo.Caption := DM1.cdsCabLiq.FieldByName('PVSLTAAP').AsString;
// Inicio  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
   lblNumLiq.Caption := Copy(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString,5,10);
   lblFecLiq.Caption := DM1.cdsCabLiq.FieldByName('PVSLFECBE').AsString;

   lblDif.Visible:=False;
   lblFecDif.Visible:=False;
   if DM1.cdsCabLiq.FieldByName('FECDIFLIQ').AsString<>'' then
   begin
      lblDif.Visible:=True;
      lblFecDif.Visible:=True;
      lblFecDif.Caption := DM1.cdsCabLiq.FieldByName('FECDIFLIQ').AsString;
   end;
// Fin  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios

   // Inicio: SPP_201306_PRE
   If DM1.cdsCabLiq.FieldByName('FORSOLBEN').AsString = 'O' Then pploriexp.Caption := 'ORIGEN : OFICIO INTERNO';
   If DM1.cdsCabLiq.FieldByName('FORSOLBEN').AsString = 'S' Then pploriexp.Caption := 'ORIGEN : SOLICITUD DEL BENEFICIARIO';
   // Fin: SPP_201306_PRE
   // Detalle de la liquidación
   DM1.liquidacionbeneficio := 0;
   // Inicio: HPC_201506_PRE
   // Se añade campo TIPDES que controla los tipos de conceptos en el detalle del beneficio.
   // xSql := 'SELECT PVSLCONCE, PVSLMONTO FROM PVS307 WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString) + ' AND PVSLAGRID = ''DET'' ORDER BY PVSLSEC';
   xSql := 'SELECT PVSLCONCE, PVSLMONTO, TIPDES FROM PVS307 WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString) + ' AND PVSLAGRID = ''DET'' ORDER BY PVSLSEC';
   // Fin: HPC_201506_PRE
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   DM1.cdsQry.First;
   DM1.cdsDetCalLiq.Close;
   DM1.cdsDetCalLiq.Open;
   DM1.cdsDetCalLiq.EmptyDataSet;
   While Not DM1.cdsQry.Eof Do
   Begin
      DM1.cdsDetCalLiq.Append;
      DM1.cdsDetCalLiq.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString;
      DM1.cdsDetCalLiq.FieldByName('MONTO').AsFloat := DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat;
      // Inicio: HPC_201506_PRE
      // Se actualiza campo de tipo de conceptos en el detalle de beneficios 
      DM1.cdsDetCalLiq.FieldByName('TIPDES').AsString := DM1.cdsQry.FieldByName('TIPDES').AsString;
      // Fin: HPC_201506_PRE
      DM1.cdsDetCalLiq.Post;
      // Inicio: HPC_201506_PRE
      // Inserta valoe a la variable "liquidaciónbeneficio"
      If DM1.cdsQry.FieldByName('TIPDES').AsString <> 'TC' Then
         DM1.liquidacionbeneficio := DM1.liquidacionbeneficio + DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat;
      // Fin: HPC_201506_PRE
      DM1.cdsQry.Next;
   End;
   If DM1.cdsDetCalLiq.RecordCount = 0 Then
   Begin
      DM1.cdsDetCalLiq.Append;
      DM1.cdsDetCalLiq.FieldByName('DESC').AsString := 'Error no existe información de calculo de beneficio';
      DM1.cdsDetCalLiq.Post;
   End;
   dbgDetCalBen.ColumnByName('DESC').FooterValue := 'TOTAL BENEFICIO ASIGNADO '
      + DM1.DevuelveValor('TGE186', 'BENEFDES', 'TIPBENEF', DM1.cdsCabLiq.FieldByName('PVSLTIPBE').AsString);
   dbgDetCalBen.ColumnByName('MONTO').FooterValue := FormatFloat('###,###.#0', DM1.liquidacionbeneficio);
   // Detalle de Devoluciones
   DM1.montoDevolucion := 0;
   xSql := 'SELECT PVSLCONCE, PVSLMONTO  FROM PVS307 WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
      + ' AND PVSLAGRID = ''DEV'' ORDER BY PVSLSEC';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   DM1.cdsQry.First;
   DM1.cdsDetDev.Close;
   DM1.cdsDetDev.Open;
   DM1.cdsDetDev.EmptyDataSet;
   While Not DM1.cdsQry.Eof Do
   Begin
      DM1.cdsDetDev.Append;
      DM1.cdsDetDev.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString;
      DM1.cdsDetDev.FieldByName('MONTO').AsFloat := DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat;
      DM1.cdsDetDev.Post;
      DM1.montoDevolucion := DM1.montoDevolucion + DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat;
      DM1.cdsQry.Next;
   End;
   If DM1.cdsDetDev.RecordCount = 0 Then
   Begin
      DM1.cdsDetDev.Append;
      DM1.cdsDetDev.FieldByName('DESC').AsString := 'No existen conceptos por devolución';
      DM1.cdsDetDev.Post;
   End;
   TNumericField(DM1.cdsDetDev.FieldByName('MONTO')).DisplayFormat := '###,###,##0.00';
   dbgDetDev.ColumnByName('DESC').FooterValue := 'TOTAL DEVOLUCIONES';
   dbgDetDev.ColumnByName('MONTO').FooterValue := FormatFloat('###,###.#0', DM1.montoDevolucion);

  // Detalle de Descuentos
   DM1.montoDescuento := 0;
   xSql := 'SELECT PVSLCONCE, PVSLMONTO, CREDID FROM PVS307 WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
      + ' AND PVSLAGRID = ''DSC'' ORDER BY PVSLSEC';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   DM1.cdsQry.First;
   DM1.cdsDetDes.Close;
   DM1.cdsDetDes.Open;
   DM1.cdsDetDes.EmptyDataSet;
   While Not DM1.cdsQry.Eof Do
   Begin
      DM1.cdsDetDes.Append;
      DM1.cdsDetDes.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString;
      DM1.cdsDetDes.FieldByName('MONTO').AsFloat := DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat;
      DM1.cdsDetDes.FieldByName('CREDID').AsString := DM1.cdsQry.FieldByName('CREDID').AsString;
      DM1.montoDescuento := DM1.montoDescuento + DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat;
      DM1.cdsDetDes.Post;
      DM1.cdsQry.Next;
   End;
   If DM1.cdsDetDes.RecordCount = 0 Then
   Begin
      DM1.cdsDetDes.Append;
      DM1.cdsDetDes.FieldByName('DESC').AsString := 'No existen conceptos por descuentos';
      DM1.cdsDetDes.Post;
   End;
   TNumericField(DM1.cdsDetDes.FieldByName('MONTO')).DisplayFormat := '###,###,##0.00';
   dbgDetDes.ColumnByName('DESC').FooterValue := 'TOTAL DESCUENTOS';
   dbgDetDes.ColumnByName('MONTO').FooterValue := FormatFloat('###,###.#0', DM1.montoDescuento);
   fcSalBen.Caption := FloatToStrF((DM1.liquidacionbeneficio + DM1.montoDevolucion - DM1.montoDescuento), ffNumber, 10, 2);

  // Formas de Pago
   DM1.totalMontoFormadePago := 0;
   // Inicio: HPC_201809_PRE
   // Se añaden campos para el reporte de cheque de gerencia
   // xSql := 'SELECT PVSLCONCE, PVSLMONTO, PVSLNOFC, NROCHEQUE, PVSLNVOU FROM PVS307 WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
   xSql := 'SELECT PVSLCONCE, PVSLMONTO, PVSLNOFC, NROCHEQUE, PVSLNVOU, PVSLDNIBEN, PVSNOMBRE, FORPAGOID FROM PVS307 WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
   // Fin: HPC_201809_PRE
      + ' AND PVSLAGRID = ''FPG'' ORDER BY PVSLSEC';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   DM1.cdsQry.First;
   DM1.cdsForPag.Close;
   DM1.cdsForPag.Open;
   DM1.cdsForPag.EmptyDataSet;
   While Not DM1.cdsQry.Eof Do
   Begin
      DM1.cdsForPag.Append;
      If Copy(DM1.cdsQry.FieldByName('PVSLCONCE').AsString, 1, 1) <> '*' Then
      Begin
         If DM1.cdsQry.FieldByName('PVSLNOFC').AsString <> '' Then
            DM1.cdsForPag.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString + '  [OFC:' + DM1.cdsQry.FieldByName('PVSLNOFC').AsString + ']'
         Else
            If DM1.cdsQry.FieldByName('NROCHEQUE').AsString <> '' Then
               DM1.cdsForPag.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString + '  [CHQ:' + DM1.cdsQry.FieldByName('NROCHEQUE').AsString + ']'
            Else
               DM1.cdsForPag.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString;
      End
      Else
         DM1.cdsForPag.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString + '  [VOUCHER N° ' + DM1.cdsQry.FieldByName('PVSLNVOU').AsString + ']';
      DM1.cdsForPag.FieldByName('MONTO').AsFloat := DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat;
      // Inicio: HPC_201809_PRE
      // Se añaden campos al cliente dataset para controla la forma de pago
      DM1.cdsForPag.FieldByName('PVSLDNIBEN').AsString := DM1.cdsQry.FieldByName('PVSLDNIBEN').AsString;
      DM1.cdsForPag.FieldByName('PVSNOMBRE').AsString := DM1.cdsQry.FieldByName('PVSNOMBRE').AsString;
      DM1.cdsForPag.FieldByName('FORPAGID').AsString := DM1.cdsQry.FieldByName('FORPAGOID').AsString;
      // Fin: HPC_201809_PRE
      DM1.cdsForPag.Post;
      DM1.totalMontoFormadePago := DM1.totalMontoFormadePago + DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat;
      DM1.cdsQry.Next;
   End;
   If DM1.cdsForPag.RecordCount = 0 Then
   Begin
      DM1.cdsForPag.Append;
      // Inicio: HPC_201802_PRE 
      // Se modifica el titulo de la forma de pago en caso que no existe designatarios
      // DM1.cdsForPag.FieldByName('DESC').AsString := 'Error no existen designatarios';
      DM1.cdsForPag.FieldByName('DESC').AsString := 'Sin información de desembolso';
      // Fin: HPC_201802_PRE 
      DM1.cdsForPag.Post;
   End;
   TNumericField(DM1.cdsForPag.FieldByName('MONTO')).DisplayFormat := '###,###,##0.00';
   dbgForPag.ColumnByName('DESC').FooterValue := 'TOTAL PAGOS';
   dbgForPag.ColumnByName('MONTO').FooterValue := FormatFloat('###,###.#0', DM1.totalMontoFormadePago);
  //Retenciones judiciales
   xSql := 'SELECT PVSLCONCE, PVSLMONTO  FROM PVS307 WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
      + ' AND PVSLAGRID = ''RET'' ORDER BY PVSLSEC';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   DM1.cdsRetJud.Close;
   DM1.cdsRetJud.Open;
   DM1.cdsRetJud.EmptyDataSet;
   If DM1.cdsQry.RecordCount > 0 Then
   Begin
      While Not DM1.cdsQry.Eof Do
      Begin
         DM1.cdsRetJud.Append;
         DM1.cdsRetJud.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString;
         DM1.cdsRetJud.FieldByName('MONTO').AsFloat := DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat;
         DM1.cdsRetJud.Post;
         DM1.totalMontoFormadePago := DM1.totalMontoFormadePago + DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat;
         DM1.cdsQry.Next;
      End;
   End;
  // Observaciones
   xSql := 'SELECT PVSLCONCE, PVSLMONTO  FROM PVS307 WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
      + ' AND PVSLAGRID = ''OBS'' ORDER BY PVSLSEC';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   DM1.cdsQry.First;
   DM1.cdsObs.Close;
   DM1.cdsObs.Open;
   DM1.cdsObs.EmptyDataSet;
   While Not DM1.cdsQry.Eof Do
   Begin
      DM1.cdsObs.Append;
      DM1.cdsObs.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString;
      DM1.cdsObs.FieldByName('MONTO').AsFloat := DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat;
      DM1.cdsObs.Post;
      DM1.cdsQry.Next;
   End;
   If DM1.cdsObs.RecordCount = 0 Then
   Begin
      DM1.cdsObs.Append;
      DM1.cdsObs.FieldByName('DESC').AsString := 'No existen observaciones registradas';
      DM1.cdsObs.Post;
   End;

// Inicio  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
  xSql:='SELECT a.pvslbennr, '
       +   'nvl((select max(case when pvslnofc is not null then ''S'' else ''N'' end) '
       +         ' from PVS307 b '
       +        ' where a.pvslbennr = b.pvslbennr and pvslnofc is not null ),''N'') tiene_num_ofi '
       + ' FROM PVS306 a '
       + 'WHERE ASOID = '''+DM1.cdsCabLiq.FieldByName('ASOID').AsString+''' '
       +  ' and PVSESTLIQ not in (''13'', ''04'') '
       +  ' and a.pvslbennr='''+DM1.cdsCabLiq.FieldByname('pvslbennr').AsString+''' and numbenori is not null ';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  bbtnActFP.Visible:=False;
  if (DM1.cdsQry.RecordCount=1) and (DM1.cdsQry.FieldByname('tiene_num_ofi').AsString='N') then
  begin
    bbtnActFP.Visible:=True
  end;
  bbtnFecDif.Visible:=False;
  if (DM1.cdsCabLiq.FieldByName('DIFERIDO').AsString='S') and (DM1.cdsQry.FieldByname('tiene_num_ofi').AsString='N') then
     bbtnFecDif.Visible:=True;
// Fin  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios

End;

Procedure TFLiquidacionBeneficio.fcShapeBtn1Click(Sender: TObject);
Begin
   pnldetalles.Visible := False;
End;

Procedure TFLiquidacionBeneficio.dbgDetDevDblClick(Sender: TObject);
Var
   xSql: String;
   apomonto, devmto: Double;
Begin
   If Copy(DM1.cdsDetDev.FieldByName('DESC').AsString, 1, 3) = 'DEV' Then
   Begin
      xSql := 'SELECT APOANO, APOMES, APOMONTO, DEVMTO FROM APO305 WHERE ASOID = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)
         + ' AND TRANSNOPE = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
         + ' AND USUANU IS NULL';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      DM1.cdsQry.First;
      apomonto := 0;
      devmto := 0;
      While Not DM1.cdsQry.Eof Do
      Begin
         apomonto := apomonto + DM1.cdsQry.FieldByName('APOMONTO').AsFloat;
         devmto := devmto + DM1.cdsQry.FieldByName('DEVMTO').AsFloat;
         DM1.cdsQry.Next;
      End;
      dbgDetalles.DataSource := DM1.dsQry;
      dbgDetalles.Selected.Clear;
      dbgDetalles.Selected.Add('APOANO'#9'11'#9'Año de la~Devolución'#9#9);
      dbgDetalles.Selected.Add('APOMES'#9'11'#9'Mes de la~Devolución'#9#9);
      dbgDetalles.Selected.Add('APOMONTO'#9'11'#9'Monto del~Aporte'#9#9);
      dbgDetalles.Selected.Add('DEVMTO'#9'11'#9'Monto~Devuelto'#9#9);
      dbgDetalles.ApplySelected;
      TNumericField(DM1.cdsQry.FieldByName('APOMONTO')).DisplayFormat := '###,###,##0.00';
      TNumericField(DM1.cdsQry.FieldByName('DEVMTO')).DisplayFormat := '###,###,##0.00';
      pnldetalles.Visible := True;
      pnldetalles.Top := 240;
      pnldetalles.Left := 32;
      stmensaje.Caption := 'DEVOLUCIONES DE APORTES PAGADAS POR BENEFICIOS';
      dbgDetalles.ColumnByName('APOMES').FooterValue := 'TOTAL';
      dbgDetalles.ColumnByName('APOMONTO').FooterValue := FormatFloat('###,###.#0', apomonto);
      dbgDetalles.ColumnByName('DEVMTO').FooterValue := FormatFloat('###,###.#0', devmto);
   End;
End;

Procedure TFLiquidacionBeneficio.dbgDetDesDblClick(Sender: TObject);
Var
   xSql: String;
   transmto, apovalor, creamort, creinteres, creflat, credesgrav, cremtocob: Double;
Begin
  // Para pago de cuotas
   If Copy(DM1.cdsDetDes.FieldByName('CREDID').AsString, 1, 3) <> '' Then
   Begin
    xSql := 'SELECT CRECUOTA, CREAMORT, CREINTERES, MONCOBDESGRAV, CREFLAT, CREMTOCOB FROM CRE310'
         + ' WHERE ASOID = ' + QuotedStr(DM1.cdsCabLiq.FieldByname('ASOID').AsString)
         + ' AND CREDID = ' + QuotedStr(DM1.cdsDetDes.FieldByName('CREDID').AsString)
         + ' AND CREDOCPAG = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
         + ' AND CREESTID NOT IN (''04'',''13'')';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      DM1.cdsQry.First;
      creamort := 0;
      creinteres := 0;
      creflat := 0;
      cremtocob := 0;
      credesgrav := 0;
      While Not DM1.cdsQry.Eof Do
      Begin
         creamort := creamort + DM1.cdsQry.FieldByName('CREAMORT').AsFloat;
         creinteres := creinteres + DM1.cdsQry.FieldByName('CREINTERES').AsFloat;
         creflat := creflat + DM1.cdsQry.FieldByName('CREFLAT').AsFloat;
         cremtocob := cremtocob + DM1.cdsQry.FieldByName('CREMTOCOB').AsFloat;
         credesgrav := credesgrav + DM1.cdsQry.FieldByName('MONCOBDESGRAV').AsFloat; // HPC_201207
         DM1.cdsQry.Next;
      End;
      DM1.cdsQry.First;
      dbgDetalles.DataSource := DM1.dsQry;
      dbgDetalles.Selected.Clear;
      dbgDetalles.Selected.Add('CRECUOTA'#9'11'#9'Cuota~Cobrada'#9#9);
      dbgDetalles.Selected.Add('CREAMORT'#9'11'#9'Amortización~Cobrada'#9#9);
      dbgDetalles.Selected.Add('CREINTERES'#9'11'#9'Interes~Cobrado'#9#9);
      dbgDetalles.Selected.Add('CREFLAT'#9'11'#9'Flat~Cobrado'#9#9);
      dbgDetalles.Selected.Add('MONCOBDESGRAV'#9'11'#9'Desgravamen~Cobrado'#9#9); // HPC_201207
      dbgDetalles.Selected.Add('CREMTOCOB'#9'11'#9'Monto~Cobrado'#9#9);
      dbgDetalles.ApplySelected;
      TNumericField(DM1.cdsQry.FieldByName('CRECUOTA')).DisplayFormat := '###';
      TNumericField(DM1.cdsQry.FieldByName('CREAMORT')).DisplayFormat := '###,###,##0.00';
      TNumericField(DM1.cdsQry.FieldByName('CREINTERES')).DisplayFormat := '###,###,##0.00';
      TNumericField(DM1.cdsQry.FieldByName('CREFLAT')).DisplayFormat := '###,###,##0.00';
      TNumericField(DM1.cdsQry.FieldByName('MONCOBDESGRAV')).DisplayFormat := '###,###,##0.00';  // HPC_201207
      TNumericField(DM1.cdsQry.FieldByName('CREMTOCOB')).DisplayFormat := '###,###,##0.00';
      pnldetalles.Visible := True;
      pnldetalles.Top := 240;
      pnldetalles.Left := 32;
      dbgDetalles.ColumnByName('CRECUOTA').FooterValue := 'TOTAL';
      dbgDetalles.ColumnByName('CREAMORT').FooterValue := FormatFloat('###,###.#0', creamort);
      dbgDetalles.ColumnByName('CREINTERES').FooterValue := FormatFloat('###,###.#0', creinteres);
      dbgDetalles.ColumnByName('CREFLAT').FooterValue := FormatFloat('###,###.#0', creflat);
      dbgDetalles.ColumnByName('MONCOBDESGRAV').FooterValue := FormatFloat('###,###.#0', credesgrav); // HPC_201207
      dbgDetalles.ColumnByName('CREMTOCOB').FooterValue := FormatFloat('###,###.#0', cremtocob);
      stmensaje.Caption := 'CUOTAS DE CREDITOS PAGADAS POR BENEFICIOS';
   End;
  // Nivelaciones de beneficios
   If Copy(DM1.cdsDetDes.FieldByName('DESC').AsString, 1, 3) = 'NIV' Then
   Begin
      xSql := 'SELECT A.TRANSANO, A.TRANSMES, A.TRANSMTO, B.APOVALOR FROM APO301 A, APO117 B'
         + ' WHERE ASOID = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)
         + ' AND TRANSNOPE = ' + QuotedStr(DM1.cdsCabLiq.FieldByname('PVSLBENNR').AsString)
         + ' AND A.TRANSANO = B.APOANO AND A.TRANSMES = B.APOMES';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      DM1.cdsQry.First;
      transmto := 0;
      apovalor := 0;
      While Not DM1.cdsQry.Eof Do
      Begin
         transmto := transmto + DM1.cdsQry.FieldByName('TRANSMTO').AsFloat;
         apovalor := apovalor + DM1.cdsQry.FieldByName('APOVALOR').AsFloat;
         DM1.cdsQry.Next;
      End;
      DM1.cdsQry.First;
      dbgDetalles.DataSource := DM1.dsQry;
      dbgDetalles.Selected.Clear;
      dbgDetalles.Selected.Add('TRANSANO'#9'11'#9'Año de la~Nivelación'#9#9);
      dbgDetalles.Selected.Add('TRANSMES'#9'11'#9'Mes de la~Nivelación'#9#9);
      dbgDetalles.Selected.Add('TRANSMTO'#9'11'#9'Monto de la~Nivelación'#9#9);
      dbgDetalles.Selected.Add('APOVALOR'#9'11'#9'Monto del~Aporte'#9#9);
      dbgDetalles.ApplySelected;
      TNumericField(DM1.cdsQry.FieldByName('TRANSMTO')).DisplayFormat := '###,###,##0.00';
      TNumericField(DM1.cdsQry.FieldByName('APOVALOR')).DisplayFormat := '###,###,##0.00';
      pnldetalles.Visible := true;
      pnldetalles.Top := 240;
      pnldetalles.Left := 32;
      stmensaje.Caption := 'NIVELACIONES DE APORTES PAGADAS POR BENEFICIOS';
      dbgDetalles.ColumnByName('TRANSMES').FooterValue := 'TOTAL';
      dbgDetalles.ColumnByName('TRANSMTO').FooterValue := FormatFloat('###,###.#0', transmto);
      dbgDetalles.ColumnByName('APOVALOR').FooterValue := FormatFloat('###,###.#0', apovalor);
   End;
End;

Procedure TFLiquidacionBeneficio.btnImprimePrevioClick(Sender: TObject);
Var
   xSql: String;
Begin
   // Inicio: HPC_201809_PRE
   // Se controla los subreportes para que salga la liquidación original
   pprregotros.Visible        := True;
   pprregdepctacajmon.Visible := False;
   pprregcheger.Visible       := False;
   // Fin: HPC_201809_PRE
   xSql := 'SELECT * FROM APO201 WHERE ASOID = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString);
   DM1.cdsAsociado.Close;
   DM1.cdsAsociado.DataRequest(xSql);
   DM1.cdsAsociado.Open;
   dm1.CargaImagenes(DM1.cdsAsociado.FieldByName('ASODNI').AsString);
   ImagAso.Picture.Assign(DM1.Jpg);
   // Inicio: HPC_201506_PRE
   // Se asigna al componente el monto total de la liquidación de beneficio
   ppTotbenAsi.Caption := FloatToStrF(DM1.liquidacionbeneficio,ffNumber,10,2);
   // Fin: HPC_201506_PRE
   // Inicio: SPP_201304_PRE - Asigna datos del regimen de pensiòn a la etiqueta de hoja de liquidaciòn de beneficio
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

   If (DM1.cdsCabLiq.FieldByName('PVSESTLIQ').AsString = '04') Or (DM1.cdsCabLiq.FieldByName('PVSESTLIQ').AsString = '13') Then
   Begin
      ppanula.Visible := True;
      ppanula.Caption := 'LIQUIDACION ANULADA POR : ' + UpperCase(DM1.DevuelveValor('USERTABLE', 'USERNOM', 'USERID', DM1.cdsCabLiq.FieldByName('PVSUSUANUL').AsString))
         + ' EL : ' + DM1.cdsCabLiq.FieldByName('PVSFANUL').AsString;
   End
   Else
      ppanula.Visible := False;
   ppldesben.Caption := DM1.DevuelveValor('TGE186', 'BENEFDES', 'TIPBENEF', DM1.cdsCabLiq.FieldByName('PVSLTIPBE').AsString);
   // Inicio: SPP_201307_PRE
   If (DM1.cdsCabLiq.FieldByName('PVSLTIPBE').AsString = '01') And (DM1.cdsCabLiq.FieldByName('PVSTIPRET').AsString = '1')  Then
      ppldesben.Caption := ppldesben.Caption + ' (INVALIDEZ TEMPORAL-PARCIAL)';
   // Fin: SPP_201307_PRE
   pplblLiqBen.Caption := '';
   If DM1.cdsCabLiq.FieldByName('PVSESTLIQ').AsString = '05' Then
      pplblLiqBen.Caption := 'RE-';
   pplblLiqBen.Caption := pplblLiqBen.Caption+'LIQUIDACION DE BENEFICIO Nº ' + Copy(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString, 5, 7);
   pplfecliq.Caption := 'FECHA : ' + DM1.cdsCabLiq.FieldByname('HREG').AsString;
   pplAsoApeNomDni.Caption := DM1.cdsCabLiq.FieldByname('ASOAPENOMDNI').AsString;
   pplAsoDni.Caption := DM1.cdsCabLiq.FieldByname('ASODNI').AsString;
   pplasotelef.Caption := DM1.cdsCabLiq.FieldByname('ASOTELF1').AsString;
   pplAsoDir.Caption := DM1.cdsCabLiq.FieldByname('ASODIR').AsString;
   pplZipDes.Caption := DM1.DevuelveValor('APO158', 'DPTODES', 'DPTOID', Copy(DM1.cdsCabLiq.FieldByName('ZIPID').AsString, 1, 2)) + '/'
      + DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', Copy(DM1.cdsCabLiq.FieldByName('ZIPID').AsString, 1, 4)) + '/'
      + DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', DM1.cdsCabLiq.FieldByName('ZIPID').AsString);
   pplAsoCodMod.Caption := DM1.cdsCabLiq.FieldByName('ASOCODMOD').AsString;
   pplCentroEducativo.Caption := DM1.cdsCabLiq.FieldByName('ASODESLAB').AsString;
   xSql := 'SELECT USENOM FROM APO101 WHERE USEID = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('USEID').AsString)
      + ' AND UPAGOID = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('UPAGOID').AsString) + ' AND UPROID = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('UPROID').AsString);
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   pplUse.Caption := 'U.S.E. : ' + DM1.cdsQry.FieldByName('USENOM').AsString;
   pplUseZip.Caption := DM1.DevuelveValor('APO158', 'DPTODES', 'DPTOID', Copy(DM1.cdsCabLiq.FieldByName('ASODSTLABID').AsString, 1, 2)) + '/'
      + DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', Copy(DM1.cdsCabLiq.FieldByName('ASODSTLABID').AsString, 1, 4)) + '/'
      + DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', DM1.cdsCabLiq.FieldByName('ASODSTLABID').AsString);
   pplFecNom.Caption := DM1.cdsCabLiq.FieldByName('ASOFRESNOM').AsString;
   pplFecCes.Caption := DM1.cdsCabLiq.FieldByName('ASOFRESCESE').AsString;
   pplNumResNoM.Caption := DM1.cdsCabLiq.FieldByName('ASORESNOM').AsString;
   pplNumResCes.Caption := DM1.cdsCabLiq.FieldByName('ASORESCESE').AsString;
   pplUltApo.Caption := DM1.cdsCabLiq.FieldByName('PVSLULAP').AsString;
   pplAnoApo.Caption := DM1.cdsCabLiq.FieldByName('PVSLTAAP').AsString;
   pplSalDis.Caption := fcSalBen.Caption;
   // Inicio: HPC_201809_PRE
   // Se modifica la etiqueta que pinta los datos del usuario que imprime
   // pplblUsuario.Caption := UpperCase(DM1.DevuelveValor('USERTABLE', 'USERNOM', 'USERID', DM1.cdsCabLiq.FieldByName('USUARIO').AsString));
   pplliquidadopor.Caption := UpperCase(DM1.DevuelveValor('USERTABLE', 'USERNOM', 'USERID', DM1.cdsCabLiq.FieldByName('USUARIO').AsString));
   // Fin: HPC_201809_PRE
   pplimppor.Caption := 'IMPRESO POR : ' + UpperCase(DM1.DevuelveValor('USERTABLE', 'USERNOM', 'USERID', DM1.wUsuario));
   pprImprimePrevio.Print;
   pprImprimePrevio.Stop;
   repcarabo;
End;

Procedure TFLiquidacionBeneficio.btnconfirmaanulaClick(Sender: TObject);
Var
   xReg, xAsoId, xCredId,  xDocPag, xSql, xCrefPag, xFrmPag, xEstid, xcntflg, xinicio, xfinal, xestsol: String;
   xestfon:String;
Begin
   If Length(Trim(meobs.Text)) = 0 Then
   Begin
      MessageDlg('Ingrese motivo de la anulación ', mtInformation, [mbOk], 0);
      meobs.SetFocus;
      Exit;
   End;
// Inicio  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
   if lblOpe.Visible then
   begin
      If Length(Trim(meNumOpe.Text)) = 0 Then
      Begin
          MessageDlg('Ingrese el Número de Operación ', mtInformation, [mbOk], 0);
          meNumOpe.SetFocus;
          Exit;
      End;
      If Length(Trim(meFecOpe.Text)) = 0 Then
      Begin
          MessageDlg('Ingrese la Fecha de Operación ', mtInformation, [mbOk], 0);
          meFecOpe.SetFocus;
          Exit;
      End;
   end;
// Fin   HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios

   If MessageDlg('¿ Seguro de eliminar esta liquidación ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
      // INICIO HPC_201601_PRE - CAMBIAR DE DO A CE AL GRABAR LA LIQUIDACION DE BENEFICIO
      xSql := 'UPDATE APO201 SET ASOTIPID = ''DO'',ASOSITID = ''DO'' WHERE ASOID = '+QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString);
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      // FIN HPC_201601_PRE
      xcntflg := Copy(DateToStr(Date), 7, 4) + Copy(DateToStr(Date), 4, 2);
      If (DM1.cdsCabLiq.FieldByName('PVSESTLIQ').AsString = '02') Or (DM1.cdsCabLiq.FieldByName('PVSESTLIQ').AsString = '06') Then
      Begin
      // Solicitud de la liquidación
         If DM1.cdsCabLiq.FieldByName('PVSESTLIQ').AsString = '02' Then xestsol := '01';
         If DM1.cdsCabLiq.FieldByName('PVSESTLIQ').AsString = '06' Then xestsol := '05';
         xSql := 'UPDATE PVS301 SET PVSLBENNR=NULL, PVSLFECBE=NULL, PVSESTADO=' + QuotedStr(xestsol)
            + ' WHERE ASOID = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString) + ' AND PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString);
         DM1.DCOM1.AppServer.EjecutaSql(xSql);
      End;
      If (DM1.cdsCabLiq.FieldByName('PVSESTLIQ').AsString = '05') Then
      Begin
      // Solicitud de la liquidación
         xSql := 'UPDATE PVS301 SET '
            + 'ASOFRESNOM = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('ASOFRESNOM').AsString) + ', ASORESNOM = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('ASORESNOM').AsString)
            + ', ASOFRESCESE = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('ASOFRESCESE').AsString) + ', ASORESCESE = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('ASORESCESE').AsString)
            + ' WHERE ASOID = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString) + ' AND PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString);
         DM1.DCOM1.AppServer.EjecutaSql(xSql);
      End;
      //  SE LIMPIA EL CAMPO DE FALLECIDO AL MOMENTO DE ANULAR LA LIQUIDACION
      if DM1.cdsCabLiq.FieldByName('PVSLTIPBE').AsString='02' then
      begin
         xReg :=  DM1.CodReg;
         DM1.Registro_Aud(DM1.cdsCabLiq.FieldByName('ASOID').AsString,'0', xReg);
         xSQL := 'update APO201 '
                +'set FALLECIDO = ''N'', TIPO_FALL_ID = null '
                +'where ASOID = '+QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)
                +' and TIPO_FALL_ID=''X LIQ.FALL'' ';
         DM1.DCOM1.AppServer.EjecutaSQL(xSql);
         DM1.Registro_Aud(DM1.cdsCabLiq.FieldByName('ASOID').AsString,'1',xReg);
      end;
      If DM1.cdsCabLiq.FieldByName('CNTFLAG').AsString = 'S' Then
         xEstid := '04'
      Else
         xEstid := '13';
    // Cabecera de liquidación
// Inicio  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
      xSql := 'UPDATE PVS306 SET PVSESTLIQ = ' + QuotedStr(xEstid) + ', PVSFANUL = ' + QuotedStr(mefecanu.Text)
         + ', PVSUSUANUL = ' + QuotedStr(meusuanu.Text) + ', PVSMOTANUL = ' + QuotedStr(meobs.Text)
         + ', NUMOPEBAN = ' + QuotedStr(meNumOpe.Text) + ', FECOPEBAN = ' + QuotedStr(meFecOpe.Text)

         + ' WHERE ASOID = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)
         + ' AND PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString);
// Fin  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
      DM1.DCOM1.AppServer.EjecutaSql(xSql);
    // Anulando los creditos pendiente
      xSql := 'SELECT ASOID, CREDID, CREDOCPAG, CREFPAG, FORPAGID FROM CRE310 WHERE ASOID = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)
         + ' AND CREESTID NOT IN (''04'',''13'', ''99'') AND CREDOCPAG = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
         + ' GROUP BY ASOID, CREDID, CREDOCPAG, CREFPAG, FORPAGID';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      DM1.cdsQry.First;
      While Not DM1.cdsQry.Eof Do
      Begin
         xAsoId := DM1.cdsQry.FieldByName('ASOID').AsString;
         xCredId := DM1.cdsQry.FieldByName('CREDID').AsString;
         xDocPag := DM1.cdsQry.FieldByName('CREDOCPAG').AsString;
         xCrefPag := DM1.cdsQry.FieldByName('CREFPAG').AsString;
         xFrmPag := DM1.cdsQry.FieldByName('FORPAGID').AsString;
         AnulaPagos(xAsoId, xCreDid, xDocPag, xFrmPag, xCrefPag);
         AplicaSaldoPre(xAsoId, xCredId);
         DM1.cdsQry.Next;
      End;
  // Anulando devolución de fondo solidario
    xsql := 'SELECT NUM_DEU, SUM(NVL(IMP_COB_DEU,0)) IMP_COB_DEU  FROM COB_FSC_PAGOS_AL_FSC WHERE ASOID = '+QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)
    +' AND NROOPE = '+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)+' AND EST_COB_COD NOT IN (''04'',''13'') GROUP BY NUM_DEU';
    DM1.cdsQry.Close;
    DM1.cdsQry.DataRequest(xSql);
    DM1.cdsQry.Open;
    While Not DM1.cdsQry.Eof Do
    Begin
      // Actualizando la tabla de pagos al estado de anulado
      xSql := 'UPDATE COB_FSC_PAGOS_AL_FSC SET EST_COB_COD = ''13'', EST_COB_DES = ''ANULADO'', USU_ANU = '+QuotedStr(DM1.wUsuario)
      +', FEC_HOR_ANU = SYSDATE WHERE ASOID = '+QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)+' AND NROOPE = '+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
      +' AND EST_COB_COD NOT IN (''04'',''13'')';
      DM1.DCOM1.AppServer.EjecutaSql(xSql);
      // Se verifica si existen pagos todavia para ese numero de deuda y se captura la ultima fecha de cobranza
      xSql := 'SELECT MAX(FEC_COB_DEU) FEC_COB_DEU FROM COB_FSC_PAGOS_AL_FSC WHERE ASOID = '+QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)
      +' AND NUM_DEU = '+QuotedStr(DM1.cdsQry.FieldByName('NUM_DEU').AsString)+' AND EST_COB_COD NOT IN (''04'',''13'')';
      DM1.cdsQry1.Close;
      DM1.cdsQry1.DataRequest(xSql);
      DM1.cdsQry1.Open;
      // Actualizando la cabecera
      If DM1.cdsQry1.FieldByName('FEC_COB_DEU').AsString = '' Then xestfon := '02' Else xestfon := '27';
        xSql := 'UPDATE COB_FSC_DEUDA_FSC_CAB SET'
        +' IMP_COB_FSC = IMP_COB_FSC - '+FloatToStr(DM1.cdsQry.FieldByName('IMP_COB_DEU').AsFloat)
        +',IMP_SAL_FSC = NVL(IMP_SAL_FSC,0) + '+FloatToStr(DM1.cdsQry.FieldByName('IMP_COB_DEU').AsFloat)
        +', ULT_FEC_COB = '+QuotedStr(DM1.cdsQry1.FieldByName('FEC_COB_DEU').AsString)+', ID_EST_FSC = '+QuotedStr(xestfon)
        +' WHERE ASOID = '+QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)+' AND NUM_DEU = '+QuotedStr(DM1.cdsQry.FieldByName('NUM_DEU').AsString);
      DM1.DCOM1.AppServer.EjecutaSql(xSql);
      DM1.cdsQry.Next;
    End;

    // Cartas de designación
      xSql := 'UPDATE PVS302 SET PVSLBENNR = NULL WHERE ASOID = ' + QuotedStr(DM1.cdsCabLiq.FieldByname('ASOID').AsString)
         + ' AND PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString);
      DM1.DCOM1.AppServer.EjecutaSql(xSql);
      xSql := 'UPDATE PVS303 SET PVSLBENNR = NULL WHERE ASOID = ' + QuotedStr(DM1.cdsCabLiq.FieldByname('ASOID').AsString)
         + ' AND PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString);
      DM1.DCOM1.AppServer.EjecutaSql(xSql);
      // Retenciones judiciales
      xSql := 'UPDATE PVS304 SET PVSLBENNR = NULL WHERE ASOID = ' + QuotedStr(DM1.cdsCabLiq.FieldByname('ASOID').AsString)
         + ' AND PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString);
      DM1.DCOM1.AppServer.EjecutaSql(xSql);
      xSql := 'UPDATE PVS305 SET PVSLBENNR = NULL WHERE ASOID = ' + QuotedStr(DM1.cdsCabLiq.FieldByname('ASOID').AsString)
         + ' AND PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString);
      DM1.DCOM1.AppServer.EjecutaSql(xSql);
      // Familiares
      xSql := 'UPDATE APO203 SET PVSLBENNR = NULL WHERE ASOID = ' + QuotedStr(DM1.cdsCabLiq.FieldByname('ASOID').AsString)
         + ' AND PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString);
      DM1.DCOM1.AppServer.EjecutaSql(xSql);
      // Eliminando las libretas en el PVS308
      xSql := 'DELETE PVS308 WHERE ASOID = ' + QuotedStr(DM1.cdsCabLiq.FieldByname('ASOID').AsString)
         + ' AND PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString);
      DM1.DCOM1.AppServer.EjecutaSql(xSql);
      // Anulando aportes registrados por nivelaciones
      // Tomando los registros del apo301 para pasarlos al apo313
      xSql := 'INSERT INTO APO313 (ASOID, TRANSID , USEID , USEABR, UPAGOID, UPAGOABR, UPROID, UPROABR, TMONID, BANCOID, CCBCOID, TRANSNOPE, TRANSFOPE,'
         + ' TRANSFFCIND, TRANSANO, TRANSMES, TRANSMTO, TRANSMTODEV, SALDOANT, INTERESMTO, SALDO, SALDOBONUS, BONUSMTO, INTERESPORC, BONUSPORC, TRANSINTID, USUARIO,'
         + ' APOFRECL, ASOCODMOD, ASOCODAUX, FORPAGOID, ASOAPENOM, TRANSPRV, APOFNP, FECCTAIND , APOFDEV, DEVANO, DEVMES, FORPAGOABR, DPTOID, DPTOABR , CIUDID, FREG,'
         + ' HREG, TRANSAAMM, TRANSAATRI, TRANSTRIM, TRANSSEM, TRANSAASEM, APOFCNT, APOSEC, CIAID, TIPDESEID, TIPDESEABR, BCOGIRO, DPTOGIRO, AGENBANCOID, NRONABO,'
         + ' NROFICIO, DETRCOBID, USERCOBID, RCOBID, BANCOIDG, AGENCIDG, FILLER, FCIERRE, CNTCONTA, DOCID, PVSLBENNR, FLGNIV, APOSECID, APO301ID, FLGRECIBO, CNTANOMM, CNTFLAG)'
         + ' SELECT ASOID, TRANSID , USEID , USEABR, UPAGOID, UPAGOABR, UPROID, UPROABR, TMONID, BANCOID, CCBCOID, TRANSNOPE, TRANSFOPE,'
         + ' TRANSFFCIND, TRANSANO, TRANSMES, TRANSMTO, TRANSMTODEV, SALDOANT, INTERESMTO, SALDO, SALDOBONUS, BONUSMTO, INTERESPORC, BONUSPORC, TRANSINTID, USUARIO,'
         + ' APOFRECL, ASOCODMOD, ASOCODAUX, FORPAGOID, ASOAPENOM, TRANSPRV, APOFNP, FECCTAIND , APOFDEV, DEVANO, DEVMES, FORPAGOABR, DPTOID, DPTOABR , CIUDID, FREG, HREG,'
         + ' TRANSAAMM, TRANSAATRI, TRANSTRIM, TRANSSEM, TRANSAASEM, APOFCNT, APOSEC, CIAID, TIPDESEID, TIPDESEABR, BCOGIRO, DPTOGIRO, AGENBANCOID, NRONABO, NROFICIO, DETRCOBID,'
         + ' USERCOBID, RCOBID, BANCOIDG, AGENCIDG, FILLER, FCIERRE, CNTCONTA, DOCID, PVSLBENNR, FLGNIV, APOSECID, APO301ID, FLGRECIBO, CNTANOMM, CNTFLAG FROM APO301 WHERE ASOID = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)
         + ' AND TRANSNOPE = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString);
      DM1.DCOM1.AppServer.EjecutaSql(xSql);
      // Eliminando los registros del apo301
      xSql := 'DELETE APO301 WHERE ASOID = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)
         + ' AND TRANSNOPE = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString);
      DM1.DCOM1.AppServer.EjecutaSql(xSql);
      // Anulando devoluciones de aportes
      xSql := 'SELECT * FROM APO305 WHERE ASOID = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)
         + ' AND TRANSNOPE = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      While Not DM1.cdsQry.Eof Do
      Begin
         xSql := 'INSERT INTO APO313 (ASOID, TRANSID , USEID , USEABR, UPAGOID, UPAGOABR, UPROID, UPROABR, TMONID, BANCOID, CCBCOID, TRANSNOPE, TRANSFOPE,'
            + ' TRANSFFCIND, TRANSANO, TRANSMES, TRANSMTODEV, SALDOANT, INTERESMTO, SALDO, SALDOBONUS, BONUSMTO, INTERESPORC, BONUSPORC, TRANSINTID, USUARIO,'
            + ' APOFRECL, ASOCODMOD, ASOCODAUX, FORPAGOID, ASOAPENOM, TRANSPRV, APOFNP, FECCTAIND , APOFDEV, DEVANO, DEVMES, FORPAGOABR, DPTOID, DPTOABR , CIUDID, FREG,'
            + ' HREG, TRANSAAMM, TRANSAATRI, TRANSTRIM, TRANSSEM, TRANSAASEM, APOFCNT, APOSEC, CIAID, TIPDESEID, TIPDESEABR, BCOGIRO, DPTOGIRO, AGENBANCOID, NRONABO,'
            + ' NROFICIO, DETRCOBID, USERCOBID, RCOBID, BANCOIDG, AGENCIDG, FILLER, FCIERRE, CNTCONTA, DOCID, PVSLBENNR, FLGNIV, APOSECID, APO301ID, FLGRECIBO, CNTANOMM, CNTFLAG)'
            + ' SELECT ASOID, TRANSID , USEID , USEABR, UPAGOID, UPAGOABR, UPROID, UPROABR, TMONID, BANCOID, CCBCOID,' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString) + ',' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLFECBE').AsString)
            + ', TRANSFFCIND, TRANSANO, TRANSMES, TRANSMTODEV, SALDOANT, INTERESMTO, SALDO, SALDOBONUS, BONUSMTO, INTERESPORC, BONUSPORC, TRANSINTID, USUARIO,'
            + ' APOFRECL, ASOCODMOD, ASOCODAUX, FORPAGOID, ASOAPENOM, TRANSPRV, APOFNP, FECCTAIND , APOFDEV, DEVANO, DEVMES, FORPAGOABR, DPTOID, DPTOABR , CIUDID, FREG, HREG,'
            + ' TRANSAAMM, TRANSAATRI, TRANSTRIM, TRANSSEM, TRANSAASEM, APOFCNT, APOSEC, CIAID, TIPDESEID, TIPDESEABR, BCOGIRO, DPTOGIRO, AGENBANCOID, NRONABO, NROFICIO, DETRCOBID,'
            + ' USERCOBID, RCOBID, BANCOIDG, AGENCIDG, FILLER, FCIERRE, CNTCONTA, DOCID, PVSLBENNR, FLGNIV, APOSECID, APO301ID, FLGRECIBO, CNTANOMM, CNTFLAG'
            + ' FROM APO301 WHERE ASOID = ' + QuotedStr(DM1.cdsQry.FieldByName('ASOID').AsString)
            + ' AND TRANSANO = ' + QuotedStr(DM1.cdsQry.FieldByName('APOANO').AsString)
            + ' AND TRANSMES = ' + QuotedStr(DM1.cdsQry.FieldByName('APOMES').AsString);
         DM1.DCOM1.AppServer.EjecutaSql(xSql);
         xSql := 'UPDATE APO305 SET USUANU =' + QuotedStr(DM1.wUsuario)
            + ', FECANU = SYSDATE, OBSANU = ' + QuotedStr('ANULACION DE LA LIQUIDACION DE BENEFICIO Nº ' + DM1.cdsCabLiq.FieldByname('PVSLBENNR').AsString)
            + ' WHERE ASOID = ' + QuotedStr(DM1.cdsQry.FieldByName('ASOID').AsString)
            + ' AND APOANO = ' + QuotedStr(DM1.cdsQry.FieldByName('APOANO').AsString)
            + ' AND APOMES = ' + QuotedStr(DM1.cdsQry.FieldByName('APOMES').AsString);
         DM1.DCOM1.AppServer.EjecutaSql(xSql);
         DM1.cdsQry.Next;
      End;
      // Marcando en el apo313
      xSql := 'UPDATE APO313 SET CNTANOMMN = ' + QuotedStr(xcntflg)
         + ', OBSANULA  = ' + QuotedStr('ANULACION DE LA LIQUIDACION DE BENEFICIO Nº ' + DM1.cdsCabLiq.FieldByname('PVSLBENNR').AsString)
         + ', FECANULA  = SYSDATE'
         + ', USUANULA  = ' + QuotedStr(DM1.wUsuario)
         + ' WHERE ASOID = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)
         + ' AND TRANSNOPE = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString);
      DM1.DCOM1.AppServer.EjecutaSql(xSql);
      // Eliminando de la tabla de cheques
      xSql := 'DELETE PVS_CHE_GEN_CAB WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString);
      DM1.DCOM1.AppServer.EjecutaSql(xSql);
      // Limpiando tabla de aso_resoluciones
      xSql := 'UPDATE ASO_RESOLUCIONES SET LIQUIDADO = NULL, NUMLIQ=NULL, FECLIQ= NULL WHERE ASOID = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)
         + ' AND NUMLIQ = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString);
      DM1.DCOM1.AppServer.EjecutaSql(xSql);

      // Inicio HPC_201504_PRE : Descuentos por aplicaciones de CCI
      xSQL:='Update COB_APLI_CCI_DET '
           +   'SET NUMLIQBEN = null '
           + 'where NUMLIQBEN = '+QuotedStr( DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString );
      DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
      // Fin    HPC_201504_PRE : Descuentos por aplicaciones de CCI

      meobs.Text := '';
      pnlmenanu.Visible := True;
      pnlanula.Visible := False;
      btnanula.Enabled := False;
      btnmodforpag.Enabled := False;
      btnmodresnom.Enabled := False;
      xinicio := Copy(DateToStr(DM1.cdsCabLiq.FieldByName('ASOFRESNOM').AsDateTime), 7, 4) + Copy(DateToStr(DM1.cdsCabLiq.FieldByName('ASOFRESNOM').AsDateTime), 4, 2);
      xfinal := Copy(DateToStr(DM1.cdsCabLiq.FieldByName('ASOFRESCESE').AsDateTime), 7, 4) + Copy(DateToStr(DM1.cdsCabLiq.FieldByName('ASOFRESCESE').AsDateTime), 4, 2);
      DM1.actualizaaportes(DM1.cdsCabLiq.FieldByName('ASOID').AsString, DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString, DM1.cdsCabLiq.FieldByName('PVSLFECBE').AsString, xinicio, xfinal, 'A');
      DM1.xSgr := 'G';
      DM1.xanula := 'S';
      DM1.numeroLiquidacion := DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString;
      //Inicio: SPP_201401_PRE
      // Inicio HPC_201504_PRE  : Descuentos por aplicaciones de CCI
      // ANULADO
      //xSql := 'Begin SP_PVS_SEG_EXP('+QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString)+', '+QuotedStr(DM1.cdsExpLiq.FieldByName('PVSEXPNRO').AsString)
      //+', ''03'', ''10'', TO_DATE(SYSDATE,''DD/MM/YYYY''), '+QuotedStr(DM1.wUsuario)+', NULL); End;';
      //DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      //fin   HPC_201504_PRE  : Descuentos por aplicaciones de CCI
      //Fin: SPP_201401_PRE
      MessageDlg('Anulación Ok', mtInformation, [mbOk], 0);
// Inicio  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
      BotonesEstado( True );
// Fin  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
      btncerrar.OnClick(btncerrar);
   End;
End;

Procedure TFLiquidacionBeneficio.btncerrarClick(Sender: TObject);
Begin
   FLiquidacionBeneficio.Close;
End;

Procedure TFLiquidacionBeneficio.btnanulaClick(Sender: TObject);
Var
   xSql, xtipo: String;
// Inicio  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
   sMensaje, sDatosBanco : String;
// Fin  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
Begin
   If DM1.cdsCabLiq.FieldByName('PVSESTLIQ').AsString = '05' Then
   Begin
      MessageDlg(' No esta permitida la anulación de una re-liquidación ', mtInformation, [mbOk], 0);
// Inicio  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
      sNuevaLiq := 'N';
// Fin  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
      Exit;
   End;

   If (DM1.cdsCabLiq.FieldByName('PVSESTLIQ').AsString = '13') Or (DM1.cdsCabLiq.FieldByName('PVSESTLIQ').AsString = '04') Then
   Begin
      If DM1.cdsCabLiq.FieldByName('PVSESTLIQ').AsString = '13' Then
         xtipo := 'Anulado'
      Else
         xtipo := 'Extornado';
      MessageDlg('Esta Liquidación' + #13 + 'ya se encuentra ' + xtipo, mtCustom, [mbOk], 0);
// Inicio  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
      sNuevaLiq := 'N';
// Fin  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
      Exit;
   End;

// Inicio  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
   // verifica extorno
   if DM1.cdsCabLiq.FieldByName('numbenori').AsString<>'' then
   begin
      // chequeando si ya se genero oficios
      xSql:='SELECT PVSLBENNR, PVSFANUL, NUMBENORI FROM PVS306 '
           + 'WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('NUMBENORI').AsString)
           + ' AND PVSESTLIQ IN (''13'',''04'')';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      if DM1.cdsQry.Recordcount>0 then
      begin
          If MessageDlg('Esta liquidación es copia de '+DM1.cdsCabLiq.FieldByName('NUMBENORI').AsString
              +', Extornada el dia '+DM1.cdsQry.FieldByName('PVSFANUL').AsString + #13 + '¿ Seguro de Extornar ? ', mtConfirmation, [mbYes, mbNo], 0) <> mrYes Then
             Exit;
      end
   end;
   sDatosBanco:='N';
// Fin  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios

  // chequeando si ya se genero oficios
   xSql := 'SELECT * FROM PVS307 WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
      + ' AND PVSLAGRID IN (''FPG'', ''RET'') AND NVL(FLGVOUCHER,''X'') = ''N''';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   While Not DM1.cdsQry.Eof Do
   Begin
      If (DM1.cdsQry.FieldByName('PVSLNOFC').AsString <> '') Or (DM1.cdsQry.FieldByName('NROCHEQUE').AsString <> '') Then
      Begin
// Inicio  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
         sDatosBanco:='S';
         //MessageDlg('La liquidación ya genero oficio(s) y/o cheque(s)' + #13 + 'no puede ser eliminada', mtCustom, [mbOk], 0);
         if sNuevaLiq = 'S' then
            sMensaje:='¿ Seguro de Copiar Liquidación ? '
         else
            sMensaje:='¿ Seguro de Extornar ? ';
         If MessageDlg('La liquidación ya genero oficio(s) y/o cheque(s)' + #13 + sMensaje, mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
            Break
         else
         begin
            sNuevaLiq := 'N';
            Exit;
         end;
// Fin   HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
      End;
      DM1.cdsQry.Next;
   End;
   meusuanu.Text := DM1.wUsuario;
   mefecanu.Text := DateToStr(date);
   meobs.Text := '';
   pnlanula.Visible := True;
   btnconfirmaanula.Caption := btnanula.Caption;
   If DM1.cdsCabLiq.FieldByName('CNTFLAG').AsString = 'S' Then
      gbanula.Caption := ' Extorno de Beneficios '
   Else
      gbanula.Caption := ' Anulación de Beneficios ';
   pnlanula.Top := 210;
// Inicio  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
   pnlanula.Left := 30;

   if sNuevaLiq = 'S' then
   begin
      btnconfirmaanula.Visible:=False;
      bbtnNueva.Visible:=True;
   end
   else
   begin
      btnconfirmaanula.Visible:=True;
      bbtnNueva.Visible:=False;
   end;

   if sDatosBanco='S' then
   begin
      lblOpe.Visible:=True;
      lblFec.Visible:=True;
      Panel13.Visible:=True;
      Panel12.Visible:=True;
   end
   else
   begin
      lblOpe.Visible:=False;
      lblFec.Visible:=False;
      Panel13.Visible:=False;
      Panel12.Visible:=False;
   end;

   BotonesEstado( False );
// Fin   HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
   meobs.SetFocus;
End;


// Inicio  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
Procedure TFLiquidacionBeneficio.BotonesEstado( bEstado : Boolean );
begin
   btnanula.Enabled          := bEstado;
   btndesdev.Enabled         := bEstado;
   btnmodforpag.Enabled      := bEstado;
   btnImprimePrevio.Enabled  := bEstado;
   btnmodresnom.Enabled      := bEstado;
end;
// Fin  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios


Procedure TFLiquidacionBeneficio.btncerraranulacionClick(Sender: TObject);
Begin
   pnlanula.Visible := False;
// Inicio  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
   BotonesEstado( True );
   sNuevaLiq:='N';
// Fin   HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
End;

Procedure TFLiquidacionBeneficio.btncerrargridClick(Sender: TObject);
Begin
   pnldetalles.Visible := False;
End;

Procedure TFLiquidacionBeneficio.btnmodforpagClick(Sender: TObject);
Var
   xSql: String;
Begin
   DM1.numeroLiquidacion := DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString;
   If DM1.cdsCabLiq.FieldByName('PVSCOBASO').AsString = 'S' Then
   Begin
      xSql := 'SELECT * FROM PVS307 A WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
         + ' AND PVSLAGRID = ''FPG'' AND FLGVOUCHER = ''N''';
      DM1.cdsDetLiq.Close;
      DM1.cdsDetLiq.DataRequest(xSql);
      DM1.cdsDetLiq.Open;
      If (DM1.cdsDetLiq.FieldByName('PVSLNOFC').AsString <> '') Or (DM1.cdsDetLiq.FieldByName('NROCHEQUE').AsString <> '') Then
      Begin
         MessageDlg(' Liquidación ya desembolsada.' + #13 + ' No puede ser modificada ', mtCustom, [mbOk], 0);
         Exit;
      End;
      If DM1.cdsDetLiq.FieldByName('PVSLMONTO').AsFloat = 0 Then
      Begin
         MessageDlg(' Monto del beneficio es Cero ', mtCustom, [mbOk], 0);
         Exit;
      End;

      Try
         FModificaformadepago := TFModificaformadepago.Create(Self);
         FModificaformadepago.ShowModal;
      Finally
         FModificaformadepago.Free;
      End;
   End
   Else
  // En caso que sean por deudos
   Begin
      Try
         FModdeudos := TFModdeudos.create(Self);
         FModdeudos.ShowModal;
      Finally
         FModdeudos.Free;
      End;
   End;
   If DM1.xmoddeu = 'S' Then btncerrar.OnClick(btncerrar);
End;

Procedure TFLiquidacionBeneficio.btnmodresnomClick(Sender: TObject);
Var
   xSql: String;
Begin
   xSql := 'SELECT * FROM PVS307 A WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
      + ' AND PVSLAGRID = ''FPG'' AND FLGVOUCHER = ''N''';
   DM1.cdsDetLiq.Close;
   DM1.cdsDetLiq.DataRequest(xSql);
   DM1.cdsDetLiq.Open;
   DM1.cdsDetLiq.First;
   While Not DM1.cdsDetLiq.Eof Do
   Begin
      If (DM1.cdsDetLiq.FieldByName('PVSLNOFC').AsString <> '') Or (DM1.cdsDetLiq.FieldByName('NROCHEQUE').AsString <> '') Then
      Begin
         MessageDlg(' Liquidación ya desembolsada.' + #13 + ' No puede ser modificada ', mtCustom, [mbOk], 0);
         Exit;
      End;
      DM1.cdsDetLiq.Next;
   End;
   Try
      Fmodificacionresolucion := TFmodificacionresolucion.Create(Self);
      Fmodificacionresolucion.ShowModal;
   Finally
      Fmodificacionresolucion.Free;
   End;
End;

Procedure TFLiquidacionBeneficio.repcarabo;
Var
   xSql: String;
Begin
  //Creditos

   xSql := 'SELECT A.CREDID, A.CRECUOTA, A.CREAMORT, A.CREINTERES, A.MONCOBDESGRAV, A.CREFLAT, A.CREMTOCOB, B.CREFVEN, B.CREFVENINI'
      + '  FROM CRE310 A, CRE302 B '
      + ' WHERE A.ASOID = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)
      + '   AND A.CREDOCPAG = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString) + ' AND A.CREESTID NOT IN (''04'', ''13'')'
      + '   AND A.ASOID = B.ASOID AND A.CREDID = B.CREDID AND A.CRECUOTA = B.CRECUOTA'
      + ' ORDER BY A.CREDID, A.CRECUOTA';
   DM1.cdsQry20.Close;
   DM1.cdsQry20.DataRequest(xSql);
   DM1.cdsQry20.Open;

// Inicio HPC_201504_PRE  : Descuentos por aplicaciones de CCI
   xSql:='select A.CODAPLICA, A.CREDID, A.MONAPL, A.PERAPL, B.FECOPERA, B.NUMOPERA'
        + ' FROM COB_APLI_CCI_DET A, COB_APLI_CCI_CAB B'
        +' WHERE NUMLIQBEN=' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
        +  ' AND A.CODAPLICA=B.CODAPLICA '
        +' ORDER BY A.CREDID';
   DM1.cdsQry26.Close;
   DM1.cdsQry26.DataRequest(xSql);
   DM1.cdsQry26.Open;
// Fin HPC_201504_PRE  : Descuentos por aplicaciones de CCI

  //Nivelaciones
   xSql := 'SELECT TRANSANO, B.MESDESL, TRANSMTO '
      + '  FROM APO301 A, TGE181 B '
      + ' WHERE ASOID = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)
      + '   AND TRANSNOPE = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
      + '   AND A.TRANSMES = B.MESIDR ORDER BY TRANSANO, TRANSMES';
   DM1.cdsQry21.Close;
   DM1.cdsQry21.DataRequest(xSql);
   DM1.cdsQry21.Open;
  //Devoluciones
   xSql := 'SELECT APOANO, B.MESDESL, DEVMTO '
      + '  FROM APO305 A, TGE181 B '
      + ' WHERE ASOID     = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)
      + '   AND TRANSNOPE = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
      + '   AND A.APOMES  = B.MESIDR '
      + '   AND USUANU    IS NULL ORDER BY APOANO, APOMES';
   DM1.cdsQry22.Close;
   DM1.cdsQry22.DataRequest(xSql);
   DM1.cdsQry22.Open;
   // Se añade en el reporte de abonos y cargos cobrados por beneficios los cobros realizados al fondo solidario
   xSql := 'SELECT B.NUM_DEU, B.IMP_COB_DEU, USU_COB_DEU, B.EST_COB_COD, B.EST_COB_DES'
   +' FROM COB_FSC_DEUDA_FSC_CAB A, COB_FSC_PAGOS_AL_FSC B'
   +' WHERE A.ASOID = '+QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)
   +' AND A.ASOID = B.ASOID AND A.NUM_DEU = B.NUM_DEU'
   +' AND B.NROOPE = '+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
   +' AND B.EST_COB_COD NOT IN (''04'',''13'')';
   DM1.cdsQry23.Close;
   DM1.cdsQry23.DataRequest(xSql);
   DM1.cdsQry23.Open;
   pppvslbennr.Caption := DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString;
   pppvslfecbe.Caption := DM1.cdsCabLiq.FieldByName('PVSLFECBE').AsString;
   ppasoapenomdni.Caption := DM1.cdsCabLiq.FieldByName('ASOAPENOMDNI').AsString;
   xSql := 'SELECT BENEFDES FROM TGE186 WHERE TIPBENEF = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLTIPBE').AsString);
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   pptipobenabr.Caption := DM1.cdsQry.FieldByName('BENEFDES').AsString;
   // Se añade la condicion que si existe información en el Qry de Fondo Solidario muestra el reporte
   If (DM1.cdsQry20.RecordCount > 0) Or (DM1.cdsQry21.RecordCount > 0) Or (DM1.cdsQry22.RecordCount > 0) Or (DM1.cdsQry23.RecordCount > 0) Then
   Begin
      pprdesdev.Print;
      pprdesdev.Stop;
   End;
End;

Procedure TFLiquidacionBeneficio.btndesdevClick(Sender: TObject);
Begin
   repcarabo;
End;

Procedure TFLiquidacionBeneficio.srcreditosPrint(Sender: TObject);
Begin
   If DM1.cdsQry20.RecordCount = 0 Then srcreditos.Visible := False;
End;

Procedure TFLiquidacionBeneficio.ppsrnivapoPrint(Sender: TObject);
Begin
   If DM1.cdsQry21.RecordCount = 0 Then ppsrnivapo.Visible := False;
End;

Procedure TFLiquidacionBeneficio.ppsrdevapoPrint(Sender: TObject);
Begin
   If DM1.cdsQry22.RecordCount = 0 Then ppsrdevapo.Visible := False;
End;

Procedure TFLiquidacionBeneficio.ppDBText8Print(Sender: TObject);
Begin
   If Copy(DM1.cdsForPag.FieldByName('DESC').AsString, 1, 1) = '*' Then
      ppDBText8.Visible := False
   Else
      ppDBText8.Visible := True;
End;

Procedure TFLiquidacionBeneficio.ppDBText10Print(Sender: TObject);
Begin
   If Copy(DM1.cdsRetJud.FieldByName('DESC').AsString, 1, 1) = '*' Then
      ppDBText10.Visible := False
   Else
      ppDBText10.Visible := True;
End;

Procedure TFLiquidacionBeneficio.AnulaPagos(xAsoId, xCreDid, xDocPag, xFrmPag, xFecPag: String);
Var
   tAsoid, tCreDid, tCreCuota, tEstado, xSQL, rSQL, xObs: String;
   xcreestid, xcreestado: String;
   tCremtoCob: Currency;
Begin
   xObs := 'CUOTA ANULADA DESDE EL MONDULO DE BENEFICIO POR ANULACION DE LIQUIDACION';
   xSQL := 'SELECT ASOID,ASOCODMOD,ASOCODAUX,USEID,TIPCREID,CREDID,CRECUOTA,CREFPAG ' +
      ',CREAMORT,CREINTERES,CREFLAT,CREMTOCOB,TMONID,TCAMBIO,USUARIO,FREG,HREG,UPROID,DPTOID,UPAGOID,BANCOID,CCBCOID,ASOAPENOM,ARCHIVOFTP,CREOBS,CREANO,NROOPE,NRONABO,AREAID,CREMES,CREMTODEV,FORPAGOABR,TRANSINTID,CREESTID,CREESTADO,CREMTOCUO ' +
      ',CREDOCPAG,AGENBCOID,FORPAGID,FORPAGABR,NROREFINAN,CREFLAGDEV,CREESTANT,CREESTANTDES,NROOPETMP,FOPERACTMP,ASOSITID,CNTANOMM,TIPOCONT,NVL(CREMTOEXC,0) CREMTOEXC,NVL(CREAPLEXC,0) CREAPLEXC,PERCONTA,TIPNABO,CNTFLAG FROM CRE310 ' +
      ' WHERE ASOID=' + QuotedStr(Trim(xAsoId)) + ' AND CREDID=' + QuotedStr(Trim(xCreDid)) + ' AND CREDOCPAG=' + QuotedStr(Trim(xDocPag)) + ' AND FORPAGID=' + QuotedStr(Trim(xFrmPag)) + ' AND CREFPAG =To_Date(' + QuotedStr(Trim(xFecPag)) + ',''dd/mm/yyyy'') AND CREESTID NOT IN (''04'',''13'', ''99'') Order By ASOID,CREDID,CRECUOTA ';
   DM1.cdsCuotas.Close;
   DM1.cdsCuotas.DataRequest(xSQL);
   DM1.cdsCuotas.Open;
   If DM1.cdsCuotas.RecordCount > 0 Then
   Begin
      If DM1.cdsCuotas.FieldByName('CNTFLAG').AsString = 'S' Then
      Begin
         xcreestid := '04';
         xcreestado := 'EXTORNADO';
      End
      Else
      Begin
         xcreestid := '13';
         xcreestado := 'ANULADO';
      End;
      rSQL := 'UPDATE CRE310 '
         + '   SET CREESTID = ' + QuotedStr(xcreestid) + ', CREESTADO = ' + QuotedStr(xcreestado) + ' WHERE'
         + ' ASOID=' + QuotedStr(Trim(xAsoId)) + ' AND CREDID=' + QuotedStr(Trim(xCreDid))
         + ' AND CREDOCPAG=' + QuotedStr(Trim(xDocPag)) + ' AND FORPAGID=' + QuotedStr(Trim(xFrmPag))
         + ' AND CREFPAG =To_Date(' + QuotedStr(Trim(xFecPag)) + ',''dd/mm/yyyy'') ';
      DM1.DCOM1.AppServer.EjecutaSql(rSQL);
      DM1.cdsCuotas.First;
      While Not DM1.cdsCuotas.Eof Do
      Begin
         tAsoid := DM1.cdsCuotas.FieldByName('ASOID').AsString;
         tCreDid := DM1.cdsCuotas.FieldByName('CREDID').AsString;
         tCreCuota := DM1.cdsCuotas.FieldByName('CRECUOTA').AsString;
         tCremtoCob := DM1.cdsCuotas.FieldByName('CREMTOCOB').AsFloat;
         tEstado := Trim(DM1.cdsCuotas.FieldByName('CREESTANT').AsString) + Trim(DM1.cdsCuotas.FieldByName('CREESTANTDES').AsString);
         AnulCuota(tAsoid, tCreDid, tCreCuota, tEstado, tCremtoCob);
         DM1.cdsCuotas.Next;
      End;
      DM1.cdsCuotas.First;
      While Not DM1.cdsCuotas.Eof Do
      Begin
         rSQL := 'INSERT INTO COB901(ASOID,ASOCODMOD,ASOCODAUX,USEID,TIPCREID,CREDID,CRECUOTA,CREFPAG ' +
            ',CREAMORT , CREINTERES, CREFLAT,CREMTOCOB,TMONID, ' +
            'TCAMBIO,USUARIO,FREG,HREG,UPROID,DPTOID,UPAGOID,BANCOID,CCBCOID,ASOAPENOM,ARCHIVOFTP,CREOBS,CREANO,NROOPE,NRONABO,AREAID, ' +
            'CREMES,CREMTODEV,FORPAGOABR,TRANSINTID,CREESTID,CREESTADO,CREMTOCUO ' +
            ',CREDOCPAG,AGENBCOID,FORPAGID,FORPAGABR,NROREFINAN,CREFLAGDEV,CREESTANT,CREESTANTDES,NROOPETMP,FOPERACTMP,ASOSITID,CNTANOMM,TIPOCONT,CREMTOEXC,CREAPLEXC,PERCONTA,TIPNABO,CNTFLAG,CREMENANU,USRANULA,FECANULA )' +
            'VALUES (' + QuotedStr(DM1.cdsCuotas.FieldByName('ASOID').AsString) + ',' + QuotedStr(DM1.cdsCuotas.FieldByName('ASOCODMOD').AsString) + ',' + QuotedStr(DM1.cdsCuotas.FieldByName('ASOCODAUX').AsString) + ',' + QuotedStr(DM1.cdsCuotas.FieldByName('USEID').AsString) + ',' + QuotedStr(DM1.cdsCuotas.FieldByName('TIPCREID').AsString) + ',' + QuotedStr(DM1.cdsCuotas.FieldByName('CREDID').AsString) + ',' + QuotedStr(DM1.cdsCuotas.FieldByName('CRECUOTA').AsString) + ' ' +
            ',' + QuotedStr(DM1.cdsCuotas.FieldByName('CREFPAG').AsString) + ',' + DM1.cdsCuotas.FieldByName('CREAMORT').AsString + ',' + DM1.cdsCuotas.FieldByName('CREINTERES').AsString + ',' + DM1.cdsCuotas.FieldByName('CREFLAT').AsString + ',' + DM1.cdsCuotas.FieldByName('CREMTOCOB').AsString + ',' + QuotedStr(DM1.cdsCuotas.FieldByName('TMONID').AsString) + ',' + DM1.cdsCuotas.FieldByName('TCAMBIO').AsString + ',' + QuotedStr(DM1.cdsCuotas.FieldByName('USUARIO').AsString) + ' ' +
            ',' + QuotedStr(DateToStr(DM1.cdsCuotas.FieldByName('FREG').AsDateTime)) + ',' + QuotedStr(DateToStr(DM1.cdsCuotas.FieldByName('HREG').AsDateTime)) + ',' + QuotedStr(DM1.cdsCuotas.FieldByName('UPROID').AsString) + ',' + QuotedStr(DM1.cdsCuotas.FieldByName('DPTOID').AsString) + ',' + QuotedStr(DM1.cdsCuotas.FieldByName('UPAGOID').AsString) + ',' + QuotedStr(DM1.cdsCuotas.FieldByName('BANCOID').AsString) + ',' + QuotedStr(DM1.cdsCuotas.FieldByName('CCBCOID').AsString) + ' ' +
            ',' + QuotedStr(DM1.cdsCuotas.FieldByName('ASOAPENOM').AsString) + ',' + QuotedStr(DM1.cdsCuotas.FieldByName('ARCHIVOFTP').AsString) + ',' + QuotedStr(DM1.cdsCuotas.FieldByName('CREOBS').AsString) + ',' + QuotedStr(DM1.cdsCuotas.FieldByName('CREANO').AsString) + ',' + QuotedStr(DM1.cdsCuotas.FieldByName('NROOPE').AsString) + ',' + QuotedStr(DM1.cdsCuotas.FieldByName('NRONABO').AsString) + ',' + QuotedStr(DM1.cdsCuotas.FieldByName('AREAID').AsString) + ' ' +
            ',' + QuotedStr(DM1.cdsCuotas.FieldByName('CREMES').AsString) + ',' + QuotedStr(DM1.cdsCuotas.FieldByName('CREMTODEV').AsString) + ',' + QuotedStr(DM1.cdsCuotas.FieldByName('FORPAGOABR').AsString) + ',' + QuotedStr(DM1.cdsCuotas.FieldByName('TRANSINTID').AsString) + ',' + QuotedStr('13') + ',' + QuotedStr('ANULADO') + ',' + DM1.cdsCuotas.FieldByName('CREMTOCUO').AsString + ',' + QuotedStr(DM1.cdsCuotas.FieldByName('CREDOCPAG').AsString) + ',' + QuotedStr(DM1.cdsCuotas.FieldByName('AGENBCOID').AsString) + ' ' +
            ',' + QuotedStr(DM1.cdsCuotas.FieldByName('FORPAGID').AsString) + ',' + QuotedStr(DM1.cdsCuotas.FieldByName('FORPAGABR').AsString) + ',' + QuotedStr(DM1.cdsCuotas.FieldByName('NROREFINAN').AsString) + ',' + QuotedStr(DM1.cdsCuotas.FieldByName('CREFLAGDEV').AsString) + ',' + QuotedStr(DM1.cdsCuotas.FieldByName('CREESTANT').AsString) + ',' + QuotedStr(DM1.cdsCuotas.FieldByName('CREESTANTDES').AsString) + ',' + QuotedStr(DM1.cdsCuotas.FieldByName('NROOPETMP').AsString) + ',' + QuotedStr(DM1.cdsCuotas.FieldByName('FOPERACTMP').AsString) + ' ' +
            ',' + QuotedStr(DM1.cdsCuotas.FieldByName('ASOSITID').AsString) + ',' + QuotedStr(DM1.cdsCuotas.FieldByName('CNTANOMM').AsString) + ',' + QuotedStr(DM1.cdsCuotas.FieldByName('TIPOCONT').AsString) + ',' + DM1.cdsCuotas.FieldByName('CREMTOEXC').AsString + ',' + DM1.cdsCuotas.FieldByName('CREAPLEXC').AsString + ',' + QuotedStr(DM1.cdsCuotas.FieldByName('PERCONTA').AsString) + ',' + QuotedStr(DM1.cdsCuotas.FieldByName('TIPNABO').AsString) + ',' + QuotedStr(DM1.cdsCuotas.FieldByName('CNTFLAG').AsString) + ',' + QuotedStr(Trim(xobs)) + ' ' +
            ',' + QuotedStr(DM1.wUsuario) + ',SYSDATE' + ')';
         DM1.DCOM1.AppServer.EjecutaSql(rSQL);
         DM1.cdsCuotas.Next;
      End;
   End;
End;

Procedure TFLiquidacionBeneficio.AplicaSaldoPre(xAsoId, xCreDid: String);
Var
   xSaldoAct: Currency;
   xSql: String;
Begin
   xSaldoAct := DM1.SaldoActual(xAsoId, xCreDid, '0');
   DM1.cdsCreditos.Close;
   xSql := 'SELECT ASOID,CREDID,CREESTID,CREESTADO,CRESDOACT '
      + '  FROM CRE301'
      + ' WHERE ASOID = ' + QuotedStr(Trim(xAsoId)) + ' AND CREDID=' + QuotedStr(Trim(xCreDid))
      + '   AND CREESTID IN (''02'',''21'')';
   DM1.cdsCreditos.DataRequest(xSql);
   DM1.cdsCreditos.Open;
   If xSaldoAct > 0 Then
   Begin
      DM1.cdsCreditos.Edit;
      DM1.cdsCreditos.fieldbyname('CRESDOACT').AsFloat := xSaldoAct;
      DM1.cdsCreditos.fieldbyname('CREESTID').AsString := '02';
      DM1.cdsCreditos.fieldbyname('CREESTADO').AsString := 'POR COBRAR';
      DM1.cdsCreditos.ApplyUpdates(0);
   End
   Else
   Begin
      DM1.cdsCreditos.Edit;
      DM1.cdsCreditos.fieldbyname('CREESTID').AsString := '21';
      DM1.cdsCreditos.fieldbyname('CREESTADO').AsString := 'CANCELADO';
      DM1.cdsCreditos.fieldbyname('CRESDOACT').AsFloat := xSaldoAct;
      DM1.cdsCreditos.ApplyUpdates(0);
   End;
   DM1.cdsCreditos.Close;
End;

Procedure TFLiquidacionBeneficio.AnulCuota(tAsoid, tCreDid, tCreCuota, tEstado: String; tCremtoCob: Currency);
Var
   xCreEstid, xCreEstado, xSql: String;
   xCrefPag, xCrefVen: String;
   xCremtoCob, xCremtoExc: Currency;
   xCreAmort, xCreInteres, xCreFlat: Currency;
   xCremtoInt: Currency;
Begin
   xCremToInt  := 0;
   xCreAmort   := 0;
   xCreFlat    := 0;
   xCreInteres := 0;
   xCremtoExc  := 0;
   xSQL := 'SELECT ASOID,CREDID,CRECUOTA,CREFVEN,CREMTOCOB,CREMONLOC,CREMONEXT,CRECAPITAL,'
      + '       CREMTOINT,CREMTOFLAT,FORPAGOABR,CREESTID,CREESTADO,FLGINT,FLGPAG,'
      + '       CREDOCPAG,CRESALDO,NVL(TCAMBIO,0) TCAMBIO,CREMTO,CREAMORT,CREINTERES,CREFLAT'
      + '  FROM CRE302 '
      + ' WHERE ASOID = ' + QuotedStr(Trim(tAsoId)) + ' AND CREDID=' + QuotedStr(Trim(tCreDid)) + ' AND CRECUOTA=' + QuotedStr(Trim(tCreCuota));
   DM1.cdsBanco.Close;
   DM1.cdsBanco.DataRequest(xSQL);
   DM1.cdsBanco.Open;
   If DM1.cdsBanco.RecordCount > 0 Then
   Begin
      xCrefVen := DM1.cdsBanco.FieldByName('CREFVEN').AsString;
      xCreAmort := DM1.cdsBanco.FieldByName('CREAMORT').AsFloat;
      xCreInteres := DM1.cdsBanco.FieldByName('CREINTERES').AsFloat;
      xCreFlat := DM1.cdsBanco.FieldByName('CREFLAT').AsFloat;
      xCremtoInt := DM1.cdsBanco.FieldByName('CREMTOINT').AsFloat;
      xSql := 'UPDATE CRE302 '
         + '   SET CREMTOCOB  = 0.00, '
         + '       CREMONLOC  = 0.00, '
         + '       CREMONEXT  = 0.00, '
         + '       TCAMBIO    = 0.00, '
         + '       CRECAPITAL = 0.00, '
         + '       CREMTOINT  = 0.00, '
         + '       CREMTOFLAT = 0.00, '
         + '       CREESTID   = ' + QuotedStr(Copy(tEstado, 1, 2)) + ', CREESTADO = ' + QuotedStr(Copy(tEstado, 3, 25)) + ', FLGINT=NULL, FLGPAG=NULL'
         + ' WHERE ASOID      = ' + QuotedStr(Trim(tAsoId)) + ' AND CREDID = ' + QuotedStr(Trim(tCreDid))
         + '   AND CRECUOTA   = ' + QuotedStr(Trim(tCreCuota));
      DM1.DCOM1.AppServer.EjecutaSql(xSql);
   End;
  //Recupera el Saldo Actual Regraba Pagos
   xSQL := 'SELECT MAX(CREFPAG) CREFPAG,SUM(NVL(CREMTOCOB,0)) CREMTOCOB '
      + '  FROM CRE310 '
      + ' WHERE ASOID    = ' + QuotedStr(Trim(tAsoId)) + ' AND CREDID=' + QuotedStr(Trim(tCreDid))
      + '   AND CRECUOTA = ' + QuotedStr(Trim(tCreCuota)) + ' AND CREESTID NOT IN (''04'',''13'', ''99'')'
      + '   AND CREFLAGDEV IS NULL';
   DM1.cdsBanco.Close;
   DM1.cdsBanco.DataRequest(xSQL);
   DM1.cdsBanco.Open;
   If DM1.cdsBanco.RecordCount > 0 Then
   Begin
      xCremtoCob := DM1.cdsBanco.FieldByName('CREMTOCOB').AsCurrency;
      xCrefPag := DM1.cdsBanco.FieldByName('CREFPAG').AsString;
      If xCremtoCob > 0 Then
      Begin
         If (Copy(xCrefVen, 7, 4) + Copy(xCrefVen, 4, 2) > Copy(xCrefPag, 7, 4) + Copy(xCrefPag, 4, 2)) And (xCremToInt = 0) Then
         Begin
            If xCremtoCob > (xCreAmort + xCreFlat) Then
               xCremtoExc := xCremtoCob - (xCreAmort + xCreFlat)
            Else
               xCremtoExc := 0;
            If xCremtoCob >= (xCreAmort + xCreFlat) Then
            Begin
               xCreEstid := '26';
               xCreEstado := 'CANCELADO A BEN';
            End
            Else
            Begin
               xCreEstid := '27';
               xCreEstado := 'PARCIAL';
            End;
            DistCrono(tAsoId, tCredId, tCreCuota, xCreEstid, xCreEstado, xCrefPag, xCremtoCob, xCremtoInt, xCremtoExc);
         End
         Else
         Begin
            If xCremtoCob > (xCreAmort + xCreInteres + xCreFlat) Then
               xCremtoExc := xCremtoCob - (xCreAmort + xCreInteres + xCreFlat)
            Else
               xCremtoExc := 0;
            If xCremtoCob >= (xCreAmort + xCreInteres + xCreFlat) Then
            Begin
               xCreEstid := '24';
               xCreEstado := 'CANCELADO BEN';
            End
            Else
            Begin
               xCreEstid := '27';
               xCreEstado := 'PARCIAL';
            End;
            DistCrono(tAsoId, tCredId, tCreCuota, xCreEstid, xCreEstado, xCrefPag, xCremtoCob, xCremtoInt, xCremtoExc);
         End;
      End
      Else
      Begin
         xCreEstid := '02';
         xCreEstado := 'POR COBRAR';
         DistCrono(tAsoId, tCredId, tCreCuota, xCreEstid, xCreEstado, xCrefPag, xCremtoCob, xCremtoInt, xCremtoExc);
      End;
   End;
   DM1.cdsBanco.Close;
End;

Procedure TFLiquidacionBeneficio.DistCrono(xAsoId, xCredId, xCreCuota, xCreEstid, xCreEstado, xCrefPag: String; xCremtoCob, xCremToInt, xCremtoExc: Currency);
Var
   xSQL: String;
   sUno, sDos: Currency;
   xEstado: Integer;
Begin
   sUno := 0.00;
   sDos := 0.00;
   xSQL := 'SELECT ASOID,CREDID,CRECUOTA,CRESALDO,CREFPAG,CREFVEN,CREMTO,CREAMORT,CREINTERES,CREFLAT,CREMTOCOB, ' +
      'CRECAPITAL,CREMTOINT,CREMTOFLAT,CREMTOEXC,CREESTID,CREESTADO, CREFVENINI FROM CRE302 WHERE ASOID=' + QuotedStr(xAsoId) + ' AND ' +
      'CREDID=' + QuotedStr(xCredId) + ' AND CRECUOTA=' + xCreCuota;
   DM1.cdsTAso.Close;
   DM1.cdsTAso.DataRequest(xSQL);
   DM1.cdsTAso.Open;
   If DM1.cdsTAso.RecordCount > 0 Then
   Begin
      If (Copy(DM1.cdsTAso.fieldbyname('CREFVENINI').AsString, 7, 4) + Copy(DM1.cdsTAso.fieldbyname('CREFVENINI').AsString, 4, 2) > Copy(xCrefPag, 7, 4) + Copy(xCrefPag, 4, 2)) And (xCremToInt = 0) Then
         xEstado := 0
      Else
         xEstado := 1;
      DM1.cdsTAso.Edit;
      If xEstado > 0 Then
      Begin
         If xCremtoCob > DM1.cdsTAso.fieldbyname('CREFLAT').AsCurrency Then
         Begin
            DM1.cdsTAso.fieldbyname('CREMTOFLAT').AsCurrency := DM1.cdsTAso.fieldbyname('CREFLAT').AsCurrency;
            sUno := xCremtoCob - DM1.cdsTAso.fieldbyname('CREFLAT').AsCurrency;
            If sUno > DM1.cdsTAso.fieldbyname('CREINTERES').AsCurrency Then
            Begin
               DM1.cdsTAso.fieldbyname('CREMTOINT').AsCurrency := DM1.cdsTAso.fieldbyname('CREINTERES').AsCurrency;
               sDos := sUno - DM1.cdsTAso.fieldbyname('CREINTERES').AsCurrency;
               If sDos > DM1.cdsTAso.fieldbyname('CREAMORT').AsCurrency Then
               Begin
                  DM1.cdsTAso.fieldbyname('CRECAPITAL').AsCurrency := DM1.cdsTAso.fieldbyname('CREAMORT').AsCurrency;
               End
               Else
               Begin
                  DM1.cdsTAso.fieldbyname('CRECAPITAL').AsCurrency := sDos;
               End;
            End
            Else
            Begin
               DM1.cdsTAso.fieldbyname('CREMTOINT').AsCurrency := sUno;
            End;
         End
         Else
         Begin
            DM1.cdsTAso.fieldbyname('CREMTOFLAT').AsCurrency := xCremtoCob;
         End;
      End
      Else
      Begin
         DM1.cdsTAso.fieldbyname('CREMTOINT').AsCurrency := 0.00;
         If xCremtoCob > DM1.cdsTAso.fieldbyname('CREFLAT').AsCurrency Then
         Begin
            DM1.cdsTAso.fieldbyname('CREMTOFLAT').AsCurrency := DM1.cdsTAso.fieldbyname('CREFLAT').AsCurrency;
            sUno := xCremtoCob - DM1.cdsTAso.fieldbyname('CREFLAT').AsCurrency;
            If sUno > DM1.cdsTAso.fieldbyname('CREAMORT').AsCurrency Then
            Begin
               DM1.cdsTAso.fieldbyname('CRECAPITAL').AsCurrency := DM1.cdsTAso.fieldbyname('CREAMORT').AsCurrency;
            End
            Else
            Begin
               DM1.cdsTAso.fieldbyname('CRECAPITAL').AsCurrency := sUno;
            End;
         End
         Else
         Begin
            DM1.cdsTAso.fieldbyname('CREMTOFLAT').AsCurrency := xCremtoCob;
         End;
      End;
      DM1.cdsTAso.fieldbyname('CREESTID').AsString := xCreEstid;
      DM1.cdsTAso.fieldbyname('CREESTADO').AsString := xCreEstado;
      DM1.cdsTAso.fieldbyname('CREFPAG').AsString := xCrefPag;
      DM1.cdsTAso.fieldbyname('CREMTOCOB').AsCurrency := xCremtoCob;
      DM1.cdsTAso.fieldbyname('CREMTOEXC').AsCurrency := SumaExceso(xAsoId, xCredId, xCreCuota);
      DM1.cdsTAso.ApplyUpdates(0);
   End;
   DM1.cdsTAso.Close;

End;

Function TFLiquidacionBeneficio.SumaExceso(xAsoId, xCredId, xCreCuota: String): Currency;
Var
   xSQL: String;
Begin
   xSQL := 'SELECT SUM(NVL(CREMTOEXC,0)-NVL(CREAPLEXC,0)) CREMTOEXC FROM CRE310 WHERE ASOID=' + QuotedStr(xAsoId)
      + ' AND CREDID=' + QuotedStr(xCredId) + ' AND '
      + 'CRECUOTA=' + QuotedStr(xCreCuota) + ' AND CREESTID NOT IN (''04'',''13'') ';
   DM1.cdsInt.Close;
   DM1.cdsInt.DataRequest(xSQL);
   DM1.cdsInt.Open;
   If DM1.cdsInt.RecordCount > 0 Then
      If DM1.cdsInt.Fieldbyname('CREMTOEXC').AsCurrency < 0 Then
         Result := 0
      Else
         Result := DM1.cdsInt.Fieldbyname('CREMTOEXC').AsCurrency
   Else
      Result := 0;
   DM1.cdsInt.Close;
End;

Procedure TFLiquidacionBeneficio.BorraFotos;
Var
   search: TSearchRec;
   nFiles: integer;
Begin
   nFiles := FindFirst('C:\SOLEXES\*.JPG', faAnyFile, search);
   While nFiles = 0 Do
   Begin
      SysUtils.DeleteFile('C:\SOLEXES\' + Search.Name);
      nFiles := FindNext(Search);
   End;
   FindClose(Search);
End;

Procedure TFLiquidacionBeneficio.ppLabel39Print(Sender: TObject);
Begin
   If DM1.cdsQry20.FieldByName('CREFVEN').AsString <> DM1.cdsQry20.FieldByName('CREFVENINI').AsString Then
      ppLabel39.Visible := True
   Else
      ppLabel39.Visible := False;
End;

// Inicio: SPP_201307_PRE
procedure TFLiquidacionBeneficio.ppDBText12Print(Sender: TObject);
begin
  If Copy(DM1.cdsObs.FieldByName('DESC').AsString,1,5) = 'SALDO' Then
     ppDBText12.BlankWhenZero := False
  Else
     ppDBText12.BlankWhenZero := True;
end;
// Fin: SPP_201307_PRE

// Inicio: HPC_201506_PRE
// Se controla el imprimir o no la linea de sub total en el reporte hoja de liquidación.
procedure TFLiquidacionBeneficio.ppLine36Print(Sender: TObject);
begin
   If DM1.cdsDetCalLiq.FieldByName('TIPDES').AsString = 'TC' Then
      ppLine36.Visible := True
   Else
      ppLine36.Visible := False;
end;
// Fin: HPC_201506_PRE


// Inicio  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
procedure TFLiquidacionBeneficio.bbtnCopiarClick(Sender: TObject);
begin
   sNuevaLiq := 'S';

   btnanulaClick(self);
end;
// Fin   HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios


// Inicio  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
Procedure TFLiquidacionBeneficio.CopiarLiquidacion;
Var
   xSql, xinicio, xfinal: String;
   xReg:String;
   montofondo:Double;
begin
      // Llenando registros para la presentación
      xSql:='SELECT REGPENID, CODAFP, ASODESLAB, ASODIRLAB, ASODSTLABID, ASOID, ASOAPENOMDNI, ASOAPEPATDNI, ASOAPEMATDNI, ASONOMDNI, ASODNI, ZIPID, ASOCODMOD, ASOCODAUX, ASODESLAB, ASODSTLABID, USEID, '
           +       'UPAGOID, UPROID, ASODIR, TIPDOCCOD, ASODOCNUM, ASOTELF1, IDIMAGE, ASOFRESNOM, ASORESNOM, ASOFRESCESE, ASORESCESE, AUTDESAPO, ASOAPECASDNI, AUTDESAPO, FECAUTDESAPO '
           + 'FROM APO201 WHERE ASOID = ' + QuotedStr( DM1.cdsCabLiq.FieldByName('ASOID').AsString);
      DM1.cdsAsociado.Close;
      DM1.cdsAsociado.DataRequest(xSql);
      DM1.cdsAsociado.Open;

      xSql:='select PVSEXPNRO from PVS306 '
           + 'where ASOID='+QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)
           +  ' and PVSLBENNR='+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;

      xSql:='SELECT ciaid, pvsexpnro, pvstipben, asoid, asocodmod, asocodaux, dptoid_xx, ciuid_xx, '
           +       'pvsestado, pvsfecini_xx, pvsresnom_xx, pvsfresnm_xx, pvsresces_xx, pvsfrescs_xx, '
           +       'pvsfinval_xx, pvsfnaci_xx, pvsedad_xx, pvsffalle_xx, pvscausa, forpagoid, bancoid, '
           +       'pvsnrocta_xx, pvsimpben_xx, pvsapoaa_xx, pvsapomm_xx, pvsapodd_xx, pvssexo_xx, regpenid_xx, '
           +       'pvsultapo, pvsliqnro_xx, pvsvou_xx, pvsfconc_xx, pvsconcl_xx, usuario, freg, hreg, agenbcoid, '
           +       'pvsnom_xx, pvsnrochq_xx, pvsfliq_xx, pvsdnideudo_xx, reprid, bcodptoid_xx, pvsncargo_xx, '
           +       'pvsnabono_xx, asocobben_xx, useid_xx, upagoid_xx, uproid_xx, pvscobaso, asoapenomdni, asoncta, '
           +       'pvslbennr, pvslfecbe, asoresnom, asofresnom, asorescese, asofrescese, asofecnac, tipdoccod, '
           +       'asodocnum, asodni, asofecinv, asofecfal, ofdesidori, disoriexp, pvssegui_xx, usu_anu, fec_anu, '
           +       'com_anu, codotrdocide, numotrdocide, pvsfecexp, usucreexp, apenomsol, dnisol, vinparsol, forsolben, '
           +       'pvstipret, genporweb, versede, conofide, cod_err_dni, obs_memo_actual, tipbenef, codcauces '
           + ' FROM PVS301 WHERE ASOID = '+QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)
           +  ' AND PVSEXPNRO = '+QuotedStr(DM1.cdsQry.FieldByName('PVSEXPNRO').AsString);
      DM1.cdsExpLiq.Close;
      DM1.cdsExpLiq.DataRequest(xSql);
      DM1.cdsExpLiq.Open;

      DM1.totalMontoDescuento:= DM1.montoDescuento;

      DM1.formadepago( DM1.cdsCabLiq.FieldByName('ASOID').AsString );

      DM1.DCOM1.AppServer.SOLStartTransaction;

      Try
         DM1.cntanomm := Copy(DateToStr(DM1.FechaSys), 7, 4) + Copy(DateToStr(DM1.FechaSys), 4, 2);

         // Hallando numero de liquidación
         DM1.numeroLiquidacion := DM1.Gennumliq;

         CopiaBeneficio;

         GrabaDetFamilia;

         DM1.Grabafamiliares(DM1.cdsAsociado.FieldByName('ASOID').AsString);

         ActualizarDetalleLiquidacion;
      Except
         MessageDlg('Error al intentar actualizar la Base de datos', mtInformation, [mbOk], 0);
         DM1.DCOM1.AppServer.SOLRollBack;
         bbtnCopiar.Enabled := False;
         DM1.xSgr := 'G';
         btncerrar.OnClick(btncerrar);
         Exit;
      End;

      DM1.DCOM1.AppServer.SOLCommit;

      MessageDlg('Liquidación Generada de manera satisfactoria', mtInformation, [mbOk], 0);
      bbtnCopiar.Enabled := False;
      DM1.xSgr := 'G';
      btncerrar.OnClick(btncerrar);
end;
// Fin   HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios


// Inicio  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
Procedure TFLiquidacionBeneficio.ActualizarDetalleLiquidacion;
Var
   xSql: String;
Begin
   // Pago de Creditos
   xSql:='UPDATE CRE310 '
       +   'SET CREDOCPAG = '''+DM1.numeroLiquidacion+''' '
      + ' WHERE ASOID = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)
      + '   AND CREDOCPAG = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
      + '   AND CREESTID NOT IN (''04'', ''13'')';
   DM1.DCOM1.AppServer.EjecutaSQL(xSql);

   //  Descuentos por aplicaciones de CCI
   xSql:='update COB_APLI_CCI_DET '
        +  ' SET NUMLIQBEN=' + QuotedStr(DM1.numeroLiquidacion)
        +' WHERE NUMLIQBEN=' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
        +  ' AND ASOID = '   + QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString);
   DM1.DCOM1.AppServer.EjecutaSQL(xSql);

   // Nivelaciones
   xSql:='UPDATE APO301 '
      + '   SET TRANSNOPE = ' + QuotedStr(DM1.numeroLiquidacion)
      + ' WHERE ASOID = '     + QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)
      + '   AND TRANSNOPE = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString);
   DM1.DCOM1.AppServer.EjecutaSQL(xSql);

   // Devoluciones
   xSql:='UPDATE APO305 '
      + '   SET TRANSNOPE = ' + QuotedStr(DM1.numeroLiquidacion)
      + ' WHERE ASOID     = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)
      + '   AND TRANSNOPE = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
      + '   AND USUANU IS NULL';
   DM1.DCOM1.AppServer.EjecutaSQL(xSql);

   // cobros realizados al fondo solidario
   xSql:='UPDATE COB_FSC_PAGOS_AL_FSC '
      +  '   SET NROOPE = '+ QuotedStr(DM1.numeroLiquidacion)
      +  ' WHERE ASOID = '+QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)
      +  '   AND NROOPE = '+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
      +  '   AND EST_COB_COD NOT IN (''04'',''13'')';
   DM1.DCOM1.AppServer.EjecutaSQL(xSql);

   // Resoluciones
   xSql:='UPDATE ASO_RESOLUCIONES '
      +  '   SET NUMLIQ = '+ QuotedStr(DM1.numeroLiquidacion)
      +  ' WHERE ASOID = '+QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)
      +  '   AND NUMLIQ = '+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString);
   DM1.DCOM1.AppServer.EjecutaSQL(xSql);

   // Expediente
   xSql:='UPDATE PVS301 '
        +   'SET PVSLBENNR = ' + QuotedStr(DM1.numeroLiquidacion)+', '
        +       'PVSLFECBE = TO_DATE(SYSDATE) '
        + 'WHERE ASOID = '+QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)
        +  ' AND PVSEXPNRO = '+QuotedStr(DM1.cdsExpLiq.FieldByName('PVSEXPNRO').AsString);
   DM1.DCOM1.AppServer.EjecutaSQL(xSql);

   // Cartas de designación
   xSql:='UPDATE PVS302 '
        +   'SET PVSLBENNR = ' + QuotedStr(DM1.numeroLiquidacion)
        + 'WHERE ASOID = ' + QuotedStr(DM1.cdsCabLiq.FieldByname('ASOID').AsString)
        +  ' AND ( PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
        +   ' OR PVSLBENNR IS NULL )';
   DM1.DCOM1.AppServer.EjecutaSQL(xSql);

   // Cartas de designación
   xSql:='UPDATE PVS303 '
        +  ' SET PVSLBENNR = ' + QuotedStr(DM1.numeroLiquidacion) + ' '
        + 'WHERE ASOID = ' + QuotedStr(DM1.cdsCabLiq.FieldByname('ASOID').AsString)
        +  ' AND ( PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
        +   ' OR PVSLBENNR IS NULL )';
   DM1.DCOM1.AppServer.EjecutaSql(xSql);

   // Retenciones judiciales
   xSql:='UPDATE PVS304 '
        +  ' SET PVSLBENNR = ' + QuotedStr(DM1.numeroLiquidacion) + ' '
        + 'WHERE ASOID = ' + QuotedStr(DM1.cdsCabLiq.FieldByname('ASOID').AsString)
         + ' AND ( PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
        +   ' OR PVSLBENNR IS NULL )';
   DM1.DCOM1.AppServer.EjecutaSql(xSql);

   // Retenciones judiciales
   xSql:='UPDATE PVS305 '
        +  ' SET PVSLBENNR = ' + QuotedStr(DM1.numeroLiquidacion) + ' '
        + 'WHERE ASOID = ' + QuotedStr(DM1.cdsCabLiq.FieldByname('ASOID').AsString)
        +  ' AND ( PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
        +   ' OR PVSLBENNR IS NULL )';
   DM1.DCOM1.AppServer.EjecutaSql(xSql);

   // Familiares
   xSql:='UPDATE APO203 '
        +  ' SET PVSLBENNR = ' + QuotedStr(DM1.numeroLiquidacion) + ' '
        + 'WHERE ASOID = ' + QuotedStr(DM1.cdsCabLiq.FieldByname('ASOID').AsString)
        +  ' AND ( PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
        +   ' OR PVSLBENNR IS NULL )';
   DM1.DCOM1.AppServer.EjecutaSql(xSql);

   // Libretas
   xSql:='UPDATE PVS308 '
        +  ' SET PVSLBENNR = ' + QuotedStr(DM1.numeroLiquidacion) + ' '
        + 'WHERE ASOID = ' + QuotedStr(DM1.cdsCabLiq.FieldByname('ASOID').AsString)
        +  ' AND ( PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
        +   ' OR PVSLBENNR IS NULL )';
   DM1.DCOM1.AppServer.EjecutaSql(xSql);
End;
// Fin   HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios


// Inicio  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
Procedure TFLiquidacionBeneficio.GrabaDetFamilia;
Var
   item: Integer;
   xCremort, xCreinteres, xCreflat, xIntncob, xValor: Double;
   xSql, xVoucher, xFlgVoucher, xDif: String;
begin
   xSql:='delete from PVS307 '
        + 'where pvslbennr='''+DM1.numeroLiquidacion+''' and pvslagrid=''FPG''';
   DM1.DCOM1.AppServer.EjecutaSQL(xSql);

   // Formas de Pago (PVS307)
   DM1.numeroVoucherLib := '';
   DM1.numeroVoucher := '';
   DM1.cdsForPag.First;
   While Not DM1.cdsForPag.Eof Do
   Begin
      item := item + 1;
      // Tomando voucher para las libretas de ahorros y otras formas de pago
      If (DM1.cdsForPag.FieldByName('FORPAGID').AsString = '11') And (DM1.numeroVoucherLib = '') Then DM1.numeroVoucherLib := DM1.Gennumvou;
      If (DM1.cdsForPag.FieldByName('FORPAGID').AsString <> '11') Then DM1.numeroVoucher := DM1.Gennumvou;
      If DM1.cdsForPag.FieldByName('FORPAGID').AsString = '11' Then
         xVoucher := DM1.numeroVoucherLib
      Else
         xVoucher := DM1.numeroVoucher;
      If DM1.cdsForPag.FieldByName('PORCENTAJE').AsFloat = 0 Then
         xValor := 0
      Else
         xValor := DM1.cdsForPag.FieldByName('PORCENTAJE').AsFloat;
      xSql := 'INSERT INTO PVS307 (CIAID, PVSLBENNR, PVSLTIPBE,PVSLAGRID,PVSLSEC,PVSLCONCE,PVSLMONTO,USUARIO,FREG,'
         + ' HREG,PVSLNVOU,BANCOID, FORPAGOID, PVSLSALDO, PVSNOMBRE,FLGVOUCHER, AGENBCOID, PVSLDNIBEN, PVSLNCTA, APENOMTUT,'
         + ' DOCIDETUT, FECNACMEN, PORDES, APEPATTUT, APEMATTUT, NOMTUT, APEPATCOB, APEMATCOB, NOMCOB, CODRELCOB, DIRDOMCOB, CODZIPCOB, TELFIJCOB, TELMOVCOB, APECASCOB)'
         + ' VALUES (' + QuotedStr('02') + ',' + QuotedStr(DM1.numeroLiquidacion) + ',' + QuotedStr(DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString)
         + ',' + QuotedStr('FPG') + ',' + IntToStr(item) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('DESC').AsString) + ',' + FloatToStr(DM1.cdsForPag.FieldByName('MONTO').AsFloat)
         + ',' + QuotedStr(DM1.wUsuario) + ', TO_CHAR(SYSDATE, ''DD/MM/YYYY''), SYSDATE, ' + QuotedStr(xVoucher) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('BANCOID').AsString)
         + ',' + QuotedStr(DM1.cdsForPag.FieldByName('FORPAGID').AsString)
         + ',' + FloatToStr(DM1.cdsForPag.FieldByName('MONTO').AsFloat) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('PVSNOMBRE').AsString)
         + ',' + QuotedStr('S') + ',' + QuotedStr(DM1.cdsForPag.FieldByName('AGENBCOID').AsString) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('PVSLDNIBEN').AsString) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('PVSLNCTA').AsString)
         + ',' + QuotedStr(DM1.cdsForPag.FieldByName('APENOMTUT').AsString) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('DOCIDETUT').AsString) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('FECNACMEN').AsString)
         + ',' + FloatToStr(xValor)
         + ',' + QuotedStr(DM1.cdsForPag.FieldByName('APEPATTUT').AsString)
         + ',' + QuotedStr(DM1.cdsForPag.FieldByName('APEMATTUT').AsString)
         + ',' + QuotedStr(DM1.cdsForPag.FieldByName('NOMTUT').AsString)
         + ',' + QuotedStr(DM1.cdsForPag.FieldByName('APEPATCOB').AsString)
         + ',' + QuotedStr(DM1.cdsForPag.FieldByName('APEMATCOB').AsString)
         + ',' + QuotedStr(DM1.cdsForPag.FieldByName('NOMCOB').AsString)
         + ',' + QuotedStr(DM1.cdsForPag.FieldByName('CODRELCOB').AsString)
         + ',' + QuotedStr(DM1.cdsForPag.FieldByName('DIRDOMCOB').AsString)
         + ',' + QuotedStr(DM1.cdsForPag.FieldByName('CODZIPCOB').AsString)
         + ',' + QuotedStr(DM1.cdsForPag.FieldByName('TELFIJCOB').AsString)
         + ',' + QuotedStr(DM1.cdsForPag.FieldByName('TELMOVCOB').AsString)
         + ',' + QuotedStr(DM1.cdsForPag.FieldByName('APECASCOB').AsString) // SPP_201403_PRE
         + ')';
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      DM1.cdsForPag.Next;
      item := item + 1;
      If DM1.cdsForPag.FieldByName('PORCENTAJE').AsFloat = 0 Then
         xValor := 0
      Else
         xValor := DM1.cdsForPag.FieldByName('PORCENTAJE').AsFloat;
      xSql := 'INSERT INTO PVS307 (CIAID, PVSLBENNR, PVSLTIPBE,PVSLAGRID,PVSLSEC,PVSLCONCE,PVSLMONTO,USUARIO,FREG,'
         + ' HREG,PVSLNVOU,BANCOID, FORPAGOID, PVSLSALDO, PVSNOMBRE,FLGVOUCHER, AGENBCOID, PVSLDNIBEN, PVSLNCTA, APENOMTUT, DOCIDETUT, FECNACMEN, PORDES,'
         + ' APEPATTUT, APEMATTUT, NOMTUT, APEPATCOB, APEMATCOB, NOMCOB, CODRELCOB, DIRDOMCOB, CODZIPCOB, TELFIJCOB, TELMOVCOB, APECASCOB)'
         + ' VALUES (' + QuotedStr('02') + ',' + QuotedStr(DM1.numeroLiquidacion) + ',' + QuotedStr(DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString)
         + ',' + QuotedStr('FPG') + ',' + IntToStr(item) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('DESC').AsString) + ',' + FloatToStr(DM1.cdsForPag.FieldByName('MONTO').AsFloat)
         + ',' + QuotedStr(DM1.wUsuario) + ', TO_CHAR(SYSDATE, ''DD/MM/YYYY''), SYSDATE, ' + QuotedStr(xVoucher) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('BANCOID').AsString)
         + ',' + QuotedStr(DM1.cdsForPag.FieldByName('FORPAGID').AsString)
         + ',' + FloatToStr(DM1.cdsForPag.FieldByName('MONTO').AsFloat) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('PVSNOMBRE').AsString)
         + ',' + QuotedStr('N') + ',' + QuotedStr(DM1.cdsForPag.FieldByName('AGENBCOID').AsString) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('PVSLDNIBEN').AsString) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('PVSLNCTA').AsString)
         + ',' + QuotedStr(DM1.cdsForPag.FieldByName('APENOMTUT').AsString) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('DOCIDETUT').AsString) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('FECNACMEN').AsString)
         + ',' + FloatToStr(xValor)
         + ',' + QuotedStr(DM1.cdsForPag.FieldByName('APEPATTUT').AsString)
         + ',' + QuotedStr(DM1.cdsForPag.FieldByName('APEMATTUT').AsString)
         + ',' + QuotedStr(DM1.cdsForPag.FieldByName('NOMTUT').AsString)
         + ',' + QuotedStr(DM1.cdsForPag.FieldByName('APEPATCOB').AsString)
         + ',' + QuotedStr(DM1.cdsForPag.FieldByName('APEMATCOB').AsString)
         + ',' + QuotedStr(DM1.cdsForPag.FieldByName('NOMCOB').AsString)
         + ',' + QuotedStr(DM1.cdsForPag.FieldByName('CODRELCOB').AsString)
         + ',' + QuotedStr(DM1.cdsForPag.FieldByName('DIRDOMCOB').AsString)
         + ',' + QuotedStr(DM1.cdsForPag.FieldByName('CODZIPCOB').AsString)
         + ',' + QuotedStr(DM1.cdsForPag.FieldByName('TELFIJCOB').AsString)
         + ',' + QuotedStr(DM1.cdsForPag.FieldByName('TELMOVCOB').AsString)
         + ',' + QuotedStr(DM1.cdsForPag.FieldByName('APECASCOB').AsString) // SPP_201403_PRE
         + ')';
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      // Grabando en tabla de cheques los que son para pagar por cheques
      If (DM1.cdsForPag.FieldByName('MONTO').AsFloat > 0) And (DM1.cdsForPag.FieldByName('FORPAGID').AsString = '01') Then
      Begin
         xSql := 'INSERT INTO PVS_CHE_GEN_CAB(ASOID, PVSLBENNR, APENOMBEN, DOCIDEBEN, MONCHE, ESTCHE, PORDES, PVSNVOU, PVSLTIPBE, PVSLFECBE, BANCOID)'
            + ' VALUES (' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString) + ',' + QuotedStr(DM1.numeroLiquidacion) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('PVSNOMBRE').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('PVSLDNIBEN').AsString) + ',' + FloatToStr(DM1.cdsForPag.FieldByName('MONTO').AsFloat) + ',' + QuotedStr('01') + ',' + FloatToStr(xValor)
            + ',' + QuotedStr(DM1.numeroVoucher) + ',' + QuotedStr(DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString) + ', TO_CHAR(SYSDATE, ''DD/MM/YYYY''),' + QuotedStr(DM1.cdsForPag.FieldByName('BANCOID').AsString) + ')';
         DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      End;
      DM1.cdsForPag.Next;
   End;
  // Formas de Pago Retenciones Judiciales
   DM1.numeroVoucherLib := '';
   DM1.numeroVoucher := '';
   DM1.cdsRetJud.First;
end;
// Fin   HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios


// Inicio  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
Procedure TFLiquidacionBeneficio.CopiaBeneficio;
Var
   sSql : String;
Begin
  // Inicio: HPC_201704_PRE
  // Se modifica script para actualizar registro de liquidación
  // sSql:='Insert into pvs306 '
  //      +  '(ciaid, pvslbennr, pvsltipbe, pvslfecbe, asoid, asocodmod, asocodaux, '
  //      +   'pvslapnom_xx, pvsldni_xx, pvsldir_xx, pvsldpto_xx, pvslprov_xx, pvsldist_xx,  pvslceed_xx, pvslcedp_xx, pvslcepr_xx, '
  //      +   'pvslcedi_xx, pvslupri_xx, pvsluprn_xx, pvslupai_xx, pvslupan_xx, pvslusei_xx, pvslusen_xx, pvslnres_xx, pvslfres_xx, '
  //      +   'pvslnces_xx, pvslfces_xx, pvslulap, pvsltaap, pvslnvou_xx, pvslestad, forpagoid_xx, bancoid_xx, pvslncta_xx, '
  //      +   'pvsexpnro, pvsldesnm_xx, pvsltben_xx, pvsltdev_xx, pvsltdsc_xx, pvslsald_xx, pvsltpre_xx, pvslsldp_xx, pvstinnc_xx, '
  //      +   'pvstpran_xx, pvslobs_xx, usuario, freg, hreg, pvslnofc_xx, '
  //      +   'pvsestliq, pvslfpago_xx, agenbcoid_xx, pvsltcre_xx, '
  //      +   'pvsfanul, pvsusuanul, pvsmotanul, cntanomm, tipocont, cntflag, pvslliqant_xx, '
  //      +   'pvscobaso, asoapenomdni, tipdoccod, asodocnum, useid, upagoid, uproid, asodir, zipid, asodeslab, asodirlab, '
  //      +   'asodstlabid, asoresnom, asofresnom, asorescese, asofrescese, pvsultapo_xx, asoncta, monliqben, mondes, mondev, '
  //      +   'monpag, asodni, asotelf1, codotrdocide, numotrdocide, autdesapo, fecautdesapo, pvstipret, '
  //      +   'numopeban, fecopeban, numbenori, diferido, fecdifliq ) '
  //      +'select ciaid, '''+DM1.numeroLiquidacion+''' pvslbennr, pvsltipbe, to_date(sysdate) pvslfecbe, asoid, asocodmod, asocodaux, '
  //      +    'pvslapnom_xx, pvsldni_xx, pvsldir_xx, pvsldpto_xx, pvslprov_xx, pvsldist_xx, pvslceed_xx, pvslcedp_xx, pvslcepr_xx, '
  //      +    'pvslcedi_xx, pvslupri_xx, pvsluprn_xx, pvslupai_xx, pvslupan_xx, pvslusei_xx, pvslusen_xx, pvslnres_xx, pvslfres_xx, '
  //      +    'pvslnces_xx, pvslfces_xx, pvslulap, pvsltaap, pvslnvou_xx, pvslestad, forpagoid_xx, bancoid_xx, pvslncta_xx, '
  //      +    'pvsexpnro, pvsldesnm_xx, pvsltben_xx, pvsltdev_xx, pvsltdsc_xx, pvslsald_xx, pvsltpre_xx, pvslsldp_xx, pvstinnc_xx, '
  //      +    'pvstpran_xx, pvslobs_xx, usuario, to_date(sysdate) freg, sysdate hreg, pvslnofc_xx, '
  //      +    '''02'' pvsestliq, pvslfpago_xx, agenbcoid_xx, pvsltcre_xx, '
  //      +    'null pvsfanul, null pvsusuanul, null pvsmotanul, cntanomm, tipocont, null cntflag, pvslliqant_xx, '
  //      +    'pvscobaso, asoapenomdni, tipdoccod, asodocnum, useid, upagoid, uproid, asodir, zipid, asodeslab, asodirlab, '
  //      +    'asodstlabid, asoresnom, asofresnom, asorescese, asofrescese, pvsultapo_xx, asoncta, monliqben, mondes, mondev, '
  //      +    'monpag, asodni, asotelf1, codotrdocide, numotrdocide, autdesapo, fecautdesapo, pvstipret, '
  //      +    'null numopeban, null fecopeban, '''+DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString+''' numbenori, '
  //      +    '''S'' diferido, null fecdifliq '
  //      + 'from pvs306 '
  //      +'where PVSLBENNR='''+DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString+'''';
  // DM1.DCOM1.AppServer.EjecutaSQL(sSql);
  // sSql:='insert into pvs307 '
  //      +'select ciaid, '''+DM1.numeroLiquidacion+''' pvslbennr, pvsltipbe, pvslagrid, pvslsec, pvslconce, pvslmonto, usuario, freg, hreg, pvslnvou, tipcreid_xx, '
  //      +    'credid, pvstcre_xx, bancoid, forpagoid, pvslsaldo, pvsnombre, pvspagado, flgvoucher, bcodptoid_xx, '
  //      +    'null pvslnofc, '
  //      +    'agenbcoid, nrocheque, pvsltben_xx, pvsltdsc_xx, cntanomm_xx, tipocont_xx, cntflag, pvslncta, pvsldniben, pordes, '
  //      +    'creamort, creinteres, creflat, intncob, tipdes, apenomtut, docidetut, fecnacmen, ccbcoid_xx, fecpag, usupag, '
  //      +    'codrelcob, nomcob, apematcob, apepatcob, nomtut, apemattut, apepattut, salcreantliq, numcheger, dniruc, '
  //      +    'usuimpcheger, fechorimpcheger, codotrdocide, numotrdocide, moncobdesgrav, dirdomcob, codzipcob, telfijcob, '
  //      +    'telmovcob, apecascob '
  //      +  'from pvs307 '
  //      + 'where PVSLBENNR='''+DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString+'''';
  sSql:='Insert into pvs306 (ciaid, pvslbennr, pvsltipbe, pvslfecbe, asoid, asocodmod, asocodaux,  pvslulap, pvsltaap, pvslestad, pvsexpnro,'
  +' usuario, freg, hreg, pvsestliq, pvsfanul, pvsusuanul, pvsmotanul, cntanomm, tipocont, cntflag, pvscobaso, asoapenomdni, tipdoccod, asodocnum,'
  +' useid, upagoid, uproid, asodir, zipid, asodeslab, asodirlab, asodstlabid, asoresnom, asofresnom, asorescese, asofrescese, asoncta, monliqben,'
  +' mondes, mondev, monpag, asodni, asotelf1, codotrdocide, numotrdocide, autdesapo, fecautdesapo, pvstipret, numopeban, fecopeban, numbenori,'
  +' diferido, fecdifliq)'
  +' select ciaid, '+QuotedStr(DM1.numeroLiquidacion)+', pvsltipbe, to_date(sysdate), asoid, asocodmod, asocodaux,  pvslulap, pvsltaap, pvslestad, pvsexpnro,'
  +' usuario, to_date(sysdate), sysdate, '+QuotedStr('02')+', null, null, null, cntanomm, tipocont, cntflag, pvscobaso, asoapenomdni, tipdoccod, asodocnum,'
  +' useid, upagoid, uproid, asodir, zipid, asodeslab, asodirlab, asodstlabid, asoresnom, asofresnom, asorescese, asofrescese, asoncta, monliqben,'
  +' mondes, mondev, monpag, asodni, asotelf1, codotrdocide, numotrdocide, autdesapo, fecautdesapo, pvstipret, numopeban,'
  +' fecopeban,'+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)+', diferido, fecdifliq'
  +' from pvs306 where PVSLBENNR = '+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString);
  DM1.DCOM1.AppServer.EjecutaSQL(sSql);
  sSql:='insert into pvs307 (ciaid, pvslbennr, pvsltipbe, pvslagrid, pvslsec, pvslconce, pvslmonto, usuario, freg, hreg, pvslnvou, credid, bancoid,'
  +' forpagoid, pvslsaldo, pvsnombre, pvspagado, flgvoucher, pvslnofc, agenbcoid, nrocheque, cntflag, pvslncta, pvsldniben, pordes, creamort,'
  +' creinteres, creflat, intncob, tipdes, apenomtut, docidetut, fecnacmen, fecpag, usupag, codrelcob, nomcob, apematcob, apepatcob, nomtut, '
  +' apemattut, apepattut, salcreantliq, numcheger, dniruc, usuimpcheger, fechorimpcheger, codotrdocide, numotrdocide, moncobdesgrav, dirdomcob,'
  +' codzipcob, telfijcob, telmovcob, apecascob, fechoremail, fechormovil, emailcob)'
  +' select ciaid, '+QuotedStr(DM1.numeroLiquidacion)+', pvsltipbe, pvslagrid, pvslsec, pvslconce, pvslmonto, usuario, freg, hreg, pvslnvou, credid, bancoid,'
  +' forpagoid, pvslsaldo, pvsnombre, pvspagado, flgvoucher, null, agenbcoid, nrocheque, cntflag, pvslncta, pvsldniben, pordes, creamort,'
  +' creinteres, creflat, intncob, tipdes, apenomtut, docidetut, fecnacmen, fecpag, usupag, codrelcob, nomcob, apematcob, apepatcob, nomtut,'
  +' apemattut, apepattut, salcreantliq, numcheger, dniruc, usuimpcheger, fechorimpcheger, codotrdocide, numotrdocide, moncobdesgrav, dirdomcob,'
  +' codzipcob, telfijcob, telmovcob, apecascob, fechoremail, fechormovil, emailcob from pvs307 where PVSLBENNR = '+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString);
  DM1.DCOM1.AppServer.EjecutaSQL(sSql);
  // Fin: HPC_201704_PRE

  // Actualiza
  sSql:='select PVSEXPNRO from PVS306 '
       + 'where ASOID='+QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)
       +  ' and PVSLBENNR='+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString);
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(sSql);
  DM1.cdsQry.Open;

  sSql:='UPDATE PVS301 '
       +  ' SET PVSLBENNR = ''' + DM1.numeroLiquidacion +''' '
       + 'WHERE ASOID = '+QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)
       +  ' AND PVSEXPNRO = '+QuotedStr(DM1.cdsQry.FieldByName('PVSEXPNRO').AsString);
  DM1.DCOM1.AppServer.EjecutaSQL(sSql);
End;
// Fin   HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios


// Inicio  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
procedure TFLiquidacionBeneficio.bbtnNuevaClick(Sender: TObject);
Var
   xReg, xAsoId, xCredId,  xDocPag, xSql, xCrefPag, xFrmPag, xEstid, xcntflg, xinicio, xfinal, xestsol: String;
   xestfon:String;
Begin
   If Length(Trim(meobs.Text)) = 0 Then
   Begin
      MessageDlg('Ingrese motivo de la anulación ', mtInformation, [mbOk], 0);
      meobs.SetFocus;
      Exit;
   End;
   if lblOpe.Visible then
   begin
      If Length(Trim(meNumOpe.Text)) = 0 Then
      Begin
          MessageDlg('Ingrese el Número de Operación ', mtInformation, [mbOk], 0);
          meNumOpe.SetFocus;
          Exit;
      End;
      If Length(Trim(meFecOpe.Text)) = 0 Then
      Begin
          MessageDlg('Ingrese la Fecha de Operación ', mtInformation, [mbOk], 0);
          meFecOpe.SetFocus;
          Exit;
      End;
   end;

   If MessageDlg('¿ Seguro de Extornar y Generar Nueva liquidación ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
      xcntflg := Copy(DateToStr(Date), 7, 4) + Copy(DateToStr(Date), 4, 2);

      If DM1.cdsCabLiq.FieldByName('CNTFLAG').AsString = 'S' Then
         xEstid := '04'
      Else
         xEstid := '13';

      // Cabecera de liquidación
      xSql := 'UPDATE PVS306 SET PVSESTLIQ = ' + QuotedStr(xEstid) + ', PVSFANUL = ' + QuotedStr(mefecanu.Text)
         + ', PVSUSUANUL = ' + QuotedStr(meusuanu.Text) + ', PVSMOTANUL = ' + QuotedStr(meobs.Text)
         + ', NUMOPEBAN = ' + QuotedStr(meNumOpe.Text) + ', FECOPEBAN = ' + QuotedStr(meFecOpe.Text)
         + ' WHERE ASOID = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)
         + ' AND PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString);
      DM1.DCOM1.AppServer.EjecutaSql(xSql);

      meobs.Text := '';
      pnlmenanu.Visible := True;
      pnlanula.Visible := False;
      btnanula.Enabled := False;
      btnmodforpag.Enabled := False;
      btnmodresnom.Enabled := False;
      xinicio := Copy(DateToStr(DM1.cdsCabLiq.FieldByName('ASOFRESNOM').AsDateTime), 7, 4) + Copy(DateToStr(DM1.cdsCabLiq.FieldByName('ASOFRESNOM').AsDateTime), 4, 2);
      xfinal := Copy(DateToStr(DM1.cdsCabLiq.FieldByName('ASOFRESCESE').AsDateTime), 7, 4) + Copy(DateToStr(DM1.cdsCabLiq.FieldByName('ASOFRESCESE').AsDateTime), 4, 2);
      DM1.actualizaaportes(DM1.cdsCabLiq.FieldByName('ASOID').AsString, DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString, DM1.cdsCabLiq.FieldByName('PVSLFECBE').AsString, xinicio, xfinal, 'A');
      DM1.xSgr := 'G';
      DM1.xanula := 'S';
      DM1.numeroLiquidacion := DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString;
      BotonesEstado( True );
      btncerrar.OnClick(btncerrar);
      CopiarLiquidacion;
      
   End;
   sNuevaLiq := 'N';
end;
// Fin   HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios


// Inicio  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
procedure TFLiquidacionBeneficio.bbtnActFPClick(Sender: TObject);
var
  xSQL : String;
begin
  xSql:='SELECT REGPENID, CODAFP, ASODESLAB, ASODIRLAB, ASODSTLABID, ASOID, ASOAPENOMDNI, ASOAPEPATDNI, ASOAPEMATDNI, ASONOMDNI, ASODNI, ZIPID, ASOCODMOD, ASOCODAUX, ASODESLAB, ASODSTLABID, USEID, '
       +       'UPAGOID, UPROID, ASODIR, TIPDOCCOD, ASODOCNUM, ASOTELF1, IDIMAGE, ASOFRESNOM, ASORESNOM, ASOFRESCESE, ASORESCESE, AUTDESAPO, ASOAPECASDNI, AUTDESAPO, FECAUTDESAPO '
       + 'FROM APO201 WHERE ASOID = ' + QuotedStr( DM1.cdsCabLiq.FieldByName('ASOID').AsString);
  DM1.cdsAsociado.Close;
  DM1.cdsAsociado.DataRequest(xSql);
  DM1.cdsAsociado.Open;
  xSql:='select PVSEXPNRO from PVS306 '
       + 'where ASOID='+QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)
       +  ' and PVSLBENNR='+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString);
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;

  xSql:='SELECT ciaid, pvsexpnro, pvstipben, asoid, asocodmod, asocodaux, dptoid_xx, ciuid_xx, '
           +       'pvsestado, pvsfecini_xx, pvsresnom_xx, pvsfresnm_xx, pvsresces_xx, pvsfrescs_xx, '
           +       'pvsfinval_xx, pvsfnaci_xx, pvsedad_xx, pvsffalle_xx, pvscausa, forpagoid, bancoid, '
           +       'pvsnrocta_xx, pvsimpben_xx, pvsapoaa_xx, pvsapomm_xx, pvsapodd_xx, pvssexo_xx, regpenid_xx, '
           +       'pvsultapo, pvsliqnro_xx, pvsvou_xx, pvsfconc_xx, pvsconcl_xx, usuario, freg, hreg, agenbcoid, '
           +       'pvsnom_xx, pvsnrochq_xx, pvsfliq_xx, pvsdnideudo_xx, reprid, bcodptoid_xx, pvsncargo_xx, '
           +       'pvsnabono_xx, asocobben_xx, useid_xx, upagoid_xx, uproid_xx, pvscobaso, asoapenomdni, asoncta, '
           +       'pvslbennr, pvslfecbe, asoresnom, asofresnom, asorescese, asofrescese, asofecnac, tipdoccod, '
           +       'asodocnum, asodni, asofecinv, asofecfal, ofdesidori, disoriexp, pvssegui_xx, usu_anu, fec_anu, '
           +       'com_anu, codotrdocide, numotrdocide, pvsfecexp, usucreexp, apenomsol, dnisol, vinparsol, forsolben, '
           +       'pvstipret, genporweb, versede, conofide, cod_err_dni, obs_memo_actual, tipbenef, codcauces '
       + ' FROM PVS301 WHERE ASOID = '+QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)
       +  ' AND PVSEXPNRO = '+QuotedStr(DM1.cdsQry.FieldByName('PVSEXPNRO').AsString);
  DM1.cdsExpLiq.Close;
  DM1.cdsExpLiq.DataRequest(xSql);
  DM1.cdsExpLiq.Open;

  DM1.totalMontoDescuento:= DM1.montoDescuento;
  DM1.formadepago( DM1.cdsCabLiq.FieldByName('ASOID').AsString );
  GrabaDetFamilia;
end;
// Fin  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios


// Inicio   HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
procedure TFLiquidacionBeneficio.bbtnFecDifClick(Sender: TObject);
var
   xSql : String;
begin
   pnlDiferido.Visible := True;
   bbtnCopiar.Enabled  := False;
   bbtnActFP.Enabled   := False;
   bbtnFecDif.Enabled  := False;
   BotonesEstado( False );

   xSql:='select FECDIFLIQ from PVS306 '
       + 'where ASOID='+QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)
       +  ' and PVSLBENNR='+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString);
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;

   dbdtpFecDif.DataSource:=DM1.dsQry;
   dbdtpFecDif.DataField:='FECDIFLIQ';
   dbdtpFecDif.setFocus;
end;
// Fin  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios


// Inicio  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
procedure TFLiquidacionBeneficio.bbtnCerrarDifClick(Sender: TObject);
begin
   dbdtpFecDif.DataSource:=nil;
   dbdtpFecDif.DataField:='';
   pnlDiferido.Visible := False;
   bbtnCopiar.Enabled  := True;
   bbtnActFP.Enabled   := True;
   bbtnFecDif.Enabled  := True;
   BotonesEstado( True );
end;
// Fin   HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios

// Inicio  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
procedure TFLiquidacionBeneficio.bbtnConfirmaDifClick(Sender: TObject);
var
  xSql : String;
begin
  If dbdtpFecDif.Text = '' Then
  Begin
    MessageDlg('Ingrese la fecha Diferida', mtCustom, [mbOk], 0);
    dbdtpFecDif.SetFocus;
    Exit;
  End;
  If dbdtpFecDif.Date < Date Then
  Begin
    MessageDlg('La fecha Diferida debe ser mayor o igual a hoy', mtCustom, [mbOk], 0);
    dbdtpFecDif.SetFocus;
    Exit;
  End;

  xSql:='UPDATE PVS306 '
       +  ' SET FECDIFLIQ = ' + QuotedStr(dbdtpFecDif.Text)
       +' WHERE ASOID = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)
       +  ' AND PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString);
  DM1.DCOM1.AppServer.EjecutaSql(xSql);
  MessageDlg('Fecha Diferida Grabada', mtInformation, [mbOk], 0);
  bbtnCerrarDifClick(Self);
end;
// Fin   HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios

// Inicio: HPC_201809_PRE
// Datos a mostrar al momento de imprimir el cheque de gerencia
procedure TFLiquidacionBeneficio.btnchegerClick(Sender: TObject);
Var xSql:String;
begin
   // Inicio: HPC_201809_PRE
   // Se controla
   If DM1.cdsForPag.FieldByName('FORPAGID').AsString = '16' Then
   Begin
      pprregotros.Visible        := False;
      pprregdepctacajmon.Visible := False;
      pprregcheger.Visible       := True;
      pplchegen05.Caption        := 'BENEFICIARIO: '+DM1.cdsForPag.FieldByName('PVSNOMBRE').AsString;
      pplchegen06.Caption        := 'DNI: '+DM1.cdsForPag.FieldByName('PVSLDNIBEN').AsString;
   End
   Else If DM1.CdsForPag.FieldByName('FORPAGID').AsString = '19' Then
   Begin
      pprregotros.Visible        := False;
      pprregdepctacajmon.Visible := True;
      pprregcheger.Visible       := False;
      pplbendepctacajnac.Caption := 'BENEFICIARIO: '+DM1.cdsForPag.FieldByName('PVSNOMBRE').AsString;
      ppldnidepctacajnac.Caption := 'DNI: '+DM1.cdsForPag.FieldByName('PVSLDNIBEN').AsString;
   End
   Else
   Begin
      pprregotros.Visible        := True;
      pprregdepctacajmon.Visible := False;
      pprregcheger.Visible       := False;
   End;
   // Fin: HPC_201809_PRE
   // temporal
   xSql := 'SELECT * FROM APO201 WHERE ASOID = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString);
   DM1.cdsAsociado.Close;
   DM1.cdsAsociado.DataRequest(xSql);
   DM1.cdsAsociado.Open;
   dm1.CargaImagenes(DM1.cdsAsociado.FieldByName('ASODNI').AsString);
   ImagAso.Picture.Assign(DM1.Jpg);
   // Inicio: HPC_201506_PRE
   // Se asigna al componente el monto total de la liquidación de beneficio
   ppTotbenAsi.Caption := FloatToStrF(DM1.liquidacionbeneficio,ffNumber,10,2);
   // Fin: HPC_201506_PRE
   // Inicio: SPP_201304_PRE - Asigna datos del regimen de pensiòn a la etiqueta de hoja de liquidaciòn de beneficio
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

   If (DM1.cdsCabLiq.FieldByName('PVSESTLIQ').AsString = '04') Or (DM1.cdsCabLiq.FieldByName('PVSESTLIQ').AsString = '13') Then
   Begin
      ppanula.Visible := True;
      ppanula.Caption := 'LIQUIDACION ANULADA POR : ' + UpperCase(DM1.DevuelveValor('USERTABLE', 'USERNOM', 'USERID', DM1.cdsCabLiq.FieldByName('PVSUSUANUL').AsString))
         + ' EL : ' + DM1.cdsCabLiq.FieldByName('PVSFANUL').AsString;
   End
   Else
      ppanula.Visible := False;
   ppldesben.Caption := DM1.DevuelveValor('TGE186', 'BENEFDES', 'TIPBENEF', DM1.cdsCabLiq.FieldByName('PVSLTIPBE').AsString);
   // Inicio: SPP_201307_PRE
   If (DM1.cdsCabLiq.FieldByName('PVSLTIPBE').AsString = '01') And (DM1.cdsCabLiq.FieldByName('PVSTIPRET').AsString = '1')  Then
      ppldesben.Caption := ppldesben.Caption + ' (INVALIDEZ TEMPORAL-PARCIAL)';
   // Fin: SPP_201307_PRE
   pplblLiqBen.Caption := '';
   If DM1.cdsCabLiq.FieldByName('PVSESTLIQ').AsString = '05' Then
      pplblLiqBen.Caption := 'RE-';
   pplblLiqBen.Caption := pplblLiqBen.Caption+'LIQUIDACION DE BENEFICIO Nº ' + Copy(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString, 5, 7);
   pplfecliq.Caption := 'FECHA : ' + DM1.cdsCabLiq.FieldByname('HREG').AsString;
   pplAsoApeNomDni.Caption := DM1.cdsCabLiq.FieldByname('ASOAPENOMDNI').AsString;
   pplAsoDni.Caption := DM1.cdsCabLiq.FieldByname('ASODNI').AsString;
   pplasotelef.Caption := DM1.cdsCabLiq.FieldByname('ASOTELF1').AsString;
   pplAsoDir.Caption := DM1.cdsCabLiq.FieldByname('ASODIR').AsString;
   pplZipDes.Caption := DM1.DevuelveValor('APO158', 'DPTODES', 'DPTOID', Copy(DM1.cdsCabLiq.FieldByName('ZIPID').AsString, 1, 2)) + '/'
      + DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', Copy(DM1.cdsCabLiq.FieldByName('ZIPID').AsString, 1, 4)) + '/'
      + DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', DM1.cdsCabLiq.FieldByName('ZIPID').AsString);
   pplAsoCodMod.Caption := DM1.cdsCabLiq.FieldByName('ASOCODMOD').AsString;
   pplCentroEducativo.Caption := DM1.cdsCabLiq.FieldByName('ASODESLAB').AsString;
   xSql := 'SELECT USENOM FROM APO101 WHERE USEID = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('USEID').AsString)
      + ' AND UPAGOID = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('UPAGOID').AsString) + ' AND UPROID = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('UPROID').AsString);
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   pplUse.Caption := 'U.S.E. : ' + DM1.cdsQry.FieldByName('USENOM').AsString;
   pplUseZip.Caption := DM1.DevuelveValor('APO158', 'DPTODES', 'DPTOID', Copy(DM1.cdsCabLiq.FieldByName('ASODSTLABID').AsString, 1, 2)) + '/'
      + DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', Copy(DM1.cdsCabLiq.FieldByName('ASODSTLABID').AsString, 1, 4)) + '/'
      + DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', DM1.cdsCabLiq.FieldByName('ASODSTLABID').AsString);
   pplFecNom.Caption := DM1.cdsCabLiq.FieldByName('ASOFRESNOM').AsString;
   pplFecCes.Caption := DM1.cdsCabLiq.FieldByName('ASOFRESCESE').AsString;
   pplNumResNoM.Caption := DM1.cdsCabLiq.FieldByName('ASORESNOM').AsString;
   pplNumResCes.Caption := DM1.cdsCabLiq.FieldByName('ASORESCESE').AsString;
   pplUltApo.Caption := DM1.cdsCabLiq.FieldByName('PVSLULAP').AsString;
   pplAnoApo.Caption := DM1.cdsCabLiq.FieldByName('PVSLTAAP').AsString;
   pplSalDis.Caption := fcSalBen.Caption;
   // Inicio: HPC_201809_PRE
   // Se modifica la etiqueta que pinta los datos del usuario que imprime
   // pplblUsuario.Caption := UpperCase(DM1.DevuelveValor('USERTABLE', 'USERNOM', 'USERID', DM1.cdsCabLiq.FieldByName('USUARIO').AsString));
   pplliquidadopor.Caption := UpperCase(DM1.DevuelveValor('USERTABLE', 'USERNOM', 'USERID', DM1.cdsCabLiq.FieldByName('USUARIO').AsString));
   // Fin: HPC_201809_PRE
   pplimppor.Caption := 'IMPRESO POR : ' + UpperCase(DM1.DevuelveValor('USERTABLE', 'USERNOM', 'USERID', DM1.wUsuario));
   pprImprimePrevio.Print;
   pprImprimePrevio.Stop;

   If DM1.cdsForPag.FieldByName('FORPAGID').AsString <> '16' Then
   Begin
      MessageDlg('Documento no valido para esta forma de pago.', mtCustom, [mbOk], 0);
      Exit;
   End;
   xSql := 'SELECT B.PVSLBENNR, B.PVSNOMBRE, B.PVSLDNIBEN, B.HREG, B.NUMCHEGER, B.PVSLMONTO, B.DNIRUC, SYSDATE FECHA_HORA  FROM PVS306 A, PVS307 B WHERE A.PVSLBENNR = '+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
   +' AND A.PVSLBENNR = B.PVSLBENNR AND B.PVSLAGRID = ''FPG'' AND B.FLGVOUCHER = ''N'' AND B.FORPAGOID = ''16'''
   +' AND B.PVSLDNIBEN = '+QuotedStr(DM1.cdsForPag.FieldByName('PVSLDNIBEN').AsString);
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   pplpvsnombre.Caption := DM1.cdsQry.FieldByName('PVSNOMBRE').AsString;
   ppldni.Caption       := DM1.cdsQry.FieldByName('PVSLDNIBEN').AsString;
   pplfecha.Caption     := DM1.cdsQry.FieldByName('FECHA_HORA').AsString;
   ppbcDNI.Data         := DM1.cdsQry.FieldByName('PVSLDNIBEN').AsString;
   ppldes01.Caption     := 'Usted podrá cobrar su liquidación de Previsión Social Nº '+DM1.cdsQry.FieldByName('PVSLBENNR').AsString+' por S/. '+FloatToStrF(DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat, ffNumber,10,2)+' a través de';
   pplfechahora.Caption := 'Impresion: '+Copy(DM1.cdsQry.FieldByName('FECHA_HORA').AsString,1,10)+' Hora:'+Copy(DM1.cdsQry.FieldByName('FECHA_HORA').AsString,12,8)+' / '+DM1.wUsuario;
   pprcarrec.Print;

   repcarabo;

end;
// Fin: HPC_201809_PRE

End.

