// Inicio Uso Estándares: 01/08/2011
// Unidad               : PRE295
// Formulario           : Fnuerepcueind
// Fecha de Creación    : 20/04/2017
// Autor                : Area de desarrollo de sistemas.
// Objetivo             : Reportes de cuentas individuales para asociados activos
// Actualizaciones
// HPC_201704_PRE : Creación
// HPC_201705_PRE : Se realiza modificaciones para controlar las liquidaciones de los
//                  asociados reingresantes
// HPC_201706_PRE : Se añade reporte estaditico de cuenta individual para impresión sin 
//                  formato pre-impreso. 
Unit PRE295;
Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, DB, DBClient,
   ppBands, ppClass, ppCtrls, ppVar, ppPrnabl, ppCache, ppProd, ppReport,
   ppComm, ppRelatv, ppDB, ppDBPipe, ExtCtrls, ppParameter, ppStrtch,
   ppSubRpt, ppDBBDE, ppChrtDP, DbChart, ppChrt, Series, TeEngine,
   jpeg,
   ppMemo,
   TeeProcs, Chart,
   Dateutils, ppRichTx,
   ppEndUsr, Mask, wwdbedit, ppRegion, Wwdatsrc, wwclient;

Type
   TFnuerepcueind = Class(TForm)
      dbgcueind: TwwDBGrid;
      btnimprime: TBitBtn;
      btnSalir: TBitBtn;
      ppdbpcueind: TppDBPipeline;
      pprccueind: TppReport;
      ppHeaderBand3: TppHeaderBand;
      ppDetailBand3: TppDetailBand;
      ppSummaryBand3: TppSummaryBand;
      ppLine1: TppLine;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      pplblasodni: TppLabel;
      pplblasoapenomdni: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      pplblusenom: TppLabel;
      ppLabel11: TppLabel;
      pplblregpen: TppLabel;
      ppLabel12: TppLabel;
      ppLabel21: TppLabel;
      pplblasoresnom: TppLabel;
      pplblasofresnom: TppLabel;
      pplblasofrescese: TppLabel;
      ppLabel23: TppLabel;
      pplblanoapodet: TppLabel;
      ppLabel29: TppLabel;
      ppLabel30: TppLabel;
      ppLabel31: TppLabel;
      ppLabel32: TppLabel;
      ppLabel33: TppLabel;
      ppLabel34: TppLabel;
      ppLabel35: TppLabel;
      ppLabel36: TppLabel;
      ppLabel37: TppLabel;
      ppLabel38: TppLabel;
      ppLabel40: TppLabel;
      ppLabel41: TppLabel;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppDBCalc2: TppDBCalc;
      ppDBCalc3: TppDBCalc;
      ppDBCalcApo: TppDBCalc;
      ppDBCalc5: TppDBCalc;
      ppLine2: TppLine;
      ppLine3: TppLine;
      ppLabel39: TppLabel;
      ppltotacum: TppLabel;
      ppLabel44: TppLabel;
      ppraportes: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppLine8: TppLine;
      ppSystemVariable4: TppSystemVariable;
      ppLabel42: TppLabel;
      ppLabel43: TppLabel;
      ppSystemVariable5: TppSystemVariable;
      ppLabel45: TppLabel;
      ppLabel46: TppLabel;
      pplbltitulo_a: TppLabel;
      ppLabel48: TppLabel;
      ppLabel49: TppLabel;
      pplasocodmod_a: TppLabel;
      pplasoapenomdni_a: TppLabel;
      ppLabel54: TppLabel;
      ppLabel55: TppLabel;
      pplblusenom_a: TppLabel;
      ppLabel57: TppLabel;
      ppLabel58: TppLabel;
      pplblupagonom_a: TppLabel;
      ppLabel60: TppLabel;
      ppLabel61: TppLabel;
      pplblupronom_a: TppLabel;
      ppLabel63: TppLabel;
      ppLabel64: TppLabel;
      pplblregpen_a: TppLabel;
      ppLabel66: TppLabel;
      ppLabel67: TppLabel;
      ppLabel68: TppLabel;
      ppLabel69: TppLabel;
      pplblasoresnom_a: TppLabel;
      pplblasofresnom_a: TppLabel;
      pplblasoresces_a: TppLabel;
      pplblasofresces_a: TppLabel;
      ppLabel93: TppLabel;
      ppLabel94: TppLabel;
      ppSystemVariable6: TppSystemVariable;
      ppDetailBand1: TppDetailBand;
      dbgaportes: TwwDBGrid;
      ppdbpestcue: TppDBPipeline;
      pprantes1997: TppReport;
      ppHeaderBand2: TppHeaderBand;
      ppLine9: TppLine;
      ppSystemVariable7: TppSystemVariable;
      ppLabel56: TppLabel;
      ppLabel59: TppLabel;
      ppSystemVariable8: TppSystemVariable;
      ppLabel62: TppLabel;
      ppLabel65: TppLabel;
      pplbltitulo_b: TppLabel;
      ppLabel71: TppLabel;
      ppLabel72: TppLabel;
      pplblasocodmod_b: TppLabel;
      pplblasoapenomdni_b: TppLabel;
      ppLabel78: TppLabel;
      ppLabel79: TppLabel;
      pplblusenom_b: TppLabel;
      ppLabel83: TppLabel;
      ppLabel84: TppLabel;
      pplblupagonom_b: TppLabel;
      ppLabel86: TppLabel;
      ppLabel88: TppLabel;
      pplblupronom_b: TppLabel;
      ppLabel90: TppLabel;
      ppLabel92: TppLabel;
      pplblregpen_b: TppLabel;
      ppLabel97: TppLabel;
      ppLabel99: TppLabel;
      ppLabel100: TppLabel;
      ppLabel101: TppLabel;
      pplblasoresnom_b: TppLabel;
      pplblasofresnom_b: TppLabel;
      pplblasoresces_b: TppLabel;
      pplblasofresces_b: TppLabel;
      ppLine10: TppLine;
      ppLine15: TppLine;
      ppLabel106: TppLabel;
      ppLabel107: TppLabel;
      ppLabel108: TppLabel;
      ppLabel109: TppLabel;
      ppLabel110: TppLabel;
      ppLabel111: TppLabel;
      ppSystemVariable9: TppSystemVariable;
      ppLabel112: TppLabel;
      ppLabel113: TppLabel;
      ppLabel114: TppLabel;
      ppLabel115: TppLabel;
      ppLabel116: TppLabel;
      ppDetailBand2: TppDetailBand;
      ppSummaryBand2: TppSummaryBand;
      ppLine16: TppLine;
      pplbluser_b: TppLabel;
      ppLabel121: TppLabel;
      ppLine17: TppLine;
      pplblmonben_b: TppLabel;
      ppLabel120: TppLabel;
      pplblbeneficio_b: TppLabel;
      lblnoaportes: TLabel;
      rgtiprep: TRadioGroup;
      rgmodcueind: TRadioGroup;
      pprcueindres: TppReport;
      ppParameterList1: TppParameterList;
      ppbderes20002004: TppBDEPipeline;
      ppbdeal2000: TppBDEPipeline;
      ppdbRepLiqxFallec: TppDBPipeline;
      ppbdedetalle: TppBDEPipeline;
      ppHeaderBand4: TppHeaderBand;
      ppLine18: TppLine;
      ppSystemVariable10: TppSystemVariable;
      ppLabel77: TppLabel;
      ppLabel80: TppLabel;
      ppSystemVariable11: TppSystemVariable;
      ppLabel85: TppLabel;
      ppLabel89: TppLabel;
    ppltituloresumen: TppLabel;
      ppLabel102: TppLabel;
      ppLabel103: TppLabel;
      pplasodni: TppLabel;
      pplasoapenomdni: TppLabel;
      ppLabel117: TppLabel;
      ppLabel118: TppLabel;
      pplusenom: TppLabel;
      ppLabel125: TppLabel;
      ppLabel126: TppLabel;
      ppLabel128: TppLabel;
      ppLabel129: TppLabel;
      pplregpendes: TppLabel;
      ppLabel131: TppLabel;
      ppLabel132: TppLabel;
      ppLabel133: TppLabel;
      pplnumresnom: TppLabel;
      pplfecresnom: TppLabel;
      pplfecresces: TppLabel;
      ppLabel140: TppLabel;
      pplanoapo: TppLabel;
      ppLabel142: TppLabel;
      ppLabel143: TppLabel;
      ppLine21: TppLine;
      ppltitpercunind: TppLabel;
      ppLabel148: TppLabel;
      ppLabel149: TppLabel;
      ppLabel150: TppLabel;
      ppLabel151: TppLabel;
      ppLabel158: TppLabel;
      ppLabel159: TppLabel;
      ppSystemVariable12: TppSystemVariable;
      ppLabel147: TppLabel;
      ppLabel164: TppLabel;
      ppLabel152: TppLabel;
      ppLabel156: TppLabel;
      ppLabel153: TppLabel;
      ppLabel154: TppLabel;
      ppsrresumen: TppSubReport;
      ppChildReport1: TppChildReport;
      ppDetailBand5: TppDetailBand;
      ppDBText16: TppDBText;
      ppDBText17: TppDBText;
      ppDBText21: TppDBText;
      ppDBText22: TppDBText;
      ppDBText23: TppDBText;
      ppDBText24: TppDBText;
    ppDBTAcuIni: TppDBText;
      ppDetailBand8: TppDetailBand;
      ppsrdetalle: TppSubReport;
      ppChildReport2: TppChildReport;
      ppTitleBand3: TppTitleBand;
      ppDetailBand6: TppDetailBand;
      ppSummaryBand6: TppSummaryBand;
      ppltitdet: TppLabel;
      ppDBText31: TppDBText;
      pplnommes: TppLabel;
      ppDBText32: TppDBText;
      ppDBText33: TppDBText;
      ppDBText34: TppDBText;
      ppDBText35: TppDBText;
      ppDBText36: TppDBText;
      ppLine32: TppLine;
      ppsrdesfecces: TppSubReport;
      ppChildReport3: TppChildReport;
      ppTitleBand2: TppTitleBand;
      ppDetailBand4: TppDetailBand;
      ppSummaryBand4: TppSummaryBand;
      ppLabel104: TppLabel;
      ppLabel155: TppLabel;
      ppLabel157: TppLabel;
      ppLabel160: TppLabel;
      ppLabel165: TppLabel;
      ppLine24: TppLine;
      ppLine28: TppLine;
      ppLabel161: TppLabel;
      ppDBText25: TppDBText;
      ppDBText26: TppDBText;
      ppDBText27: TppDBText;
      ppLine29: TppLine;
      ppLine33: TppLine;
      ppLabel162: TppLabel;
      ppdbpapodesces: TppBDEPipeline;
      ppDBCalc1: TppDBCalc;
      ppLabel1: TppLabel;
      ppLine13: TppLine;
      ppsrapodesces: TppSubReport;
      ppChildReport6: TppChildReport;
      ppTitleBand6: TppTitleBand;
      ppDetailBand10: TppDetailBand;
      ppSummaryBand1: TppSummaryBand;
      ppLabel47: TppLabel;
      ppLabel74: TppLabel;
      ppLabel75: TppLabel;
      ppLabel76: TppLabel;
      ppLabel81: TppLabel;
      ppLine14: TppLine;
      ppLine38: TppLine;
      ppLabel82: TppLabel;
      ppLine42: TppLine;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppDBText13: TppDBText;
      ppLine43: TppLine;
      ppDBCalc6: TppDBCalc;
      ppLabel91: TppLabel;
      ppLine44: TppLine;
      ppLabel95: TppLabel;
      ppLabel98: TppLabel;
      ppLabel192: TppLabel;
      ppLabel194: TppLabel;
      ppLabel197: TppLabel;
      ppLabel198: TppLabel;
      ppLine47: TppLine;
      ppDBText14: TppDBText;
      ppDBText15: TppDBText;
      ppDBText18: TppDBText;
      ppDBText19: TppDBText;
      ppDBText20: TppDBText;
      ppDBText49: TppDBText;
      ppDBText50: TppDBText;
      ppLine39: TppLine;
      ppLine51: TppLine;
      ppLabel185: TppLabel;
      pplblmonben_a: TppLabel;
      pplbluser_a: TppLabel;
      ppLabel188: TppLabel;
      ppDBCalc13: TppDBCalc;
      ppDBCalc14: TppDBCalc;
      ppDBCalc15: TppDBCalc;
      ppLine11: TppLine;
      ppLabel183: TppLabel;
      ppLabel190: TppLabel;
      ppLabel193: TppLabel;
      ppSummaryBand8: TppSummaryBand;
      ppSubReport1: TppSubReport;
      ppChildReport5: TppChildReport;
      ppTitleBand5: TppTitleBand;
      ppLabel181: TppLabel;
      ppLabel182: TppLabel;
      ppLabel184: TppLabel;
      ppLabel186: TppLabel;
      ppLabel187: TppLabel;
      ppLine36: TppLine;
      ppLine40: TppLine;
      ppLabel189: TppLabel;
      ppLine41: TppLine;
      ppDetailBand9: TppDetailBand;
      ppDBText37: TppDBText;
      ppDBText38: TppDBText;
      ppDBText39: TppDBText;
      ppSummaryBand9: TppSummaryBand;
      ppLine45: TppLine;
      ppDBCalc7: TppDBCalc;
      ppLabel195: TppLabel;
      ppLine46: TppLine;
      btnprocesar: TBitBtn;
      ppDBCalc8: TppDBCalc;
      ppLabel28: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
      ppSystemVariable2: TppSystemVariable;
      ppLabel18: TppLabel;
      ppLabel19: TppLabel;
    ppltitulodetalle: TppLabel;
      ppLabel51: TppLabel;
      ppLabel145: TppLabel;
      ppSystemVariable3: TppSystemVariable;
      ppLabel168: TppLabel;
      ppMemo4: TppMemo;
      ppBDEdetapo: TppBDEPipeline;
      cdsest: TClientDataSet;
      dsest: TDataSource;
      Image1: TImage;
      Chart1: TChart;
      Series1: TPieSeries;
      ppSummaryBand10: TppSummaryBand;
      ppShape1: TppShape;
      pplsalacu: TppLabel;
      pplusuario: TppLabel;
      ppLabel209: TppLabel;
      ppLabel210: TppLabel;
      ppLabel211: TppLabel;
      pplbonacu: TppLabel;
      pplintacu: TppLabel;
      ppltotAcu: TppLabel;
      pplporapoacu: TppLabel;
      pplporbonacu: TppLabel;
      pplporintacu: TppLabel;
      pplportotacu: TppLabel;
      ppLine34: TppLine;
      pplapoacu: TppLabel;
      ppLabel212: TppLabel;
    ppLabel179: TppLabel;
    ppLabel180: TppLabel;
    ppImage1: TppImage;
    ppImage2: TppImage;
    ppImage4: TppImage;
    ppImage5: TppImage;
    ppRegion2: TppRegion;
    pnlCCI: TPanel;
    dbeTotCCI: TwwDBEdit;
    dbeSaldo: TwwDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    ppdbCCI: TppBDEPipeline;
    ppd1: TppDesigner;
    ppdbCCIDet: TppBDEPipeline;
    ppSubReport3: TppSubReport;
    ppChildReport7: TppChildReport;
    ppTitleBand7: TppTitleBand;
    ppLine6: TppLine;
    ppLabel27: TppLabel;
    ppHeaderBand5: TppHeaderBand;
    ppDetailBand11: TppDetailBand;
    ppDBText41: TppDBText;
    ppDBText48: TppDBText;
    ppDBText51: TppDBText;
    ppLabel14: TppLabel;
    ppLabel24: TppLabel;
    ppLine12: TppLine;
    ppLine19: TppLine;
    ppFooterBand2: TppFooterBand;
    ppSummaryBand12: TppSummaryBand;
    ppLine4: TppLine;
    ppDBCalc9: TppDBCalc;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLine20: TppLine;
    ppLine35: TppLine;
    ppLine37: TppLine;
    ppLine48: TppLine;
    ppDBText52: TppDBText;
    ppLabel70: TppLabel;
    ppLabel73: TppLabel;
    ppParameterList3: TppParameterList;
    ppSubReport4: TppSubReport;
    ppChildReport8: TppChildReport;
    ppTitleBand8: TppTitleBand;
    ppLine49: TppLine;
    ppLabel208: TppLabel;
    ppHeaderBand6: TppHeaderBand;
    ppDetailBand13: TppDetailBand;
    ppDBText53: TppDBText;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppLabel213: TppLabel;
    ppLabel214: TppLabel;
    ppLine50: TppLine;
    ppLine52: TppLine;
    ppFooterBand3: TppFooterBand;
    ppSummaryBand13: TppSummaryBand;
    ppLine53: TppLine;
    ppDBCalc10: TppDBCalc;
    ppLabel215: TppLabel;
    ppLabel216: TppLabel;
    ppLine54: TppLine;
    ppLine55: TppLine;
    ppLine56: TppLine;
    ppLine57: TppLine;
    ppDBText56: TppDBText;
    ppLabel217: TppLabel;
    ppLabel218: TppLabel;
    ppLabel219: TppLabel;
    ppLabel220: TppLabel;
    ppltotapopenres: TppLabel;
    ppltotapopendet: TppLabel;
    // Inicio: HPC_201706_PRE
    // Se añade modifica el nombre del reporte  
    // pprresest: TppReport;
    pprresestconfor: TppReport;
    // Fin: HPC_201706_PRE
    ppHeaderBand7: TppHeaderBand;
    // Inicio: HPC_201706_PRE
    // Se retira lineas no usadas en el reporte estadistico de cuenta individual
    // ppShape2: TppShape;
    // ppShape12: TppShape;
    // ppShape13: TppShape;
    // Fin: HPC_201706_PRE
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
    pplasodir_nc: TppLabel;
    pplasodni_nc: TppLabel;
    ppldst_nc: TppLabel;
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
    // Inicio: HPC_201706_PRE
    // Se retira lineas no usadas en el reporte estadistico de cuenta individual
    // ppShape11: TppShape;
    // ppShape10: TppShape;
    // ppldesini: TppLabel;
    // pplapoini: TppLabel;
    // pplintini: TppLabel;
    // pplbonini: TppLabel;
    // pplsalini: TppLabel;
    // Fin: HPC_201706_PRE
    pplcpocenedu: TppLabel;
    ppLabel87: TppLabel;
    ppLabel163: TppLabel;
    ppLabel167: TppLabel;
    ppLabel169: TppLabel;
    pplcpoNIVEDU: TppLabel;
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
    // Inicio: HPC_201706_PRE
    // Se retira variable que muestra en año y mes de nombramiento
    // pplanomes: TppLabel;
    // Fin: HPC_201706_PRE
    ppFooterBand1: TppFooterBand;
    ppImage3: TppImage;
    pplFechaImp: TppLabel;
    ppLabel202: TppLabel;
    ppLabel204: TppLabel;
    pplnofirmores: TppLabel;
    ppSummaryBand7: TppSummaryBand;
    ppShape17: TppShape;
    ppShape20: TppShape;
    ppLabel170: TppLabel;
    ppShape18: TppShape;
    ppShape19: TppShape;
    ppShape22: TppShape;
    pplapofin: TppLabel;
    pplintfin: TppLabel;
    pplbonfin: TppLabel;
    pplsalfin: TppLabel;
    ppRegion1: TppRegion;
    ppltotsalpenpagest: TppLabel;
    pplsaldoal: TppLabel;
    ppParameterList2: TppParameterList;
    ppLabel139: TppLabel;
    ppLabel221: TppLabel;
    pplfecautdesapo: TppLabel;
    ppLabel122: TppLabel;
    ppLabel123: TppLabel;
    ppLabel134: TppLabel;
    pplfeccal: TppLabel;
    ppShape25: TppShape;
    ppLabel224: TppLabel;
    pplmonacuini: TppLabel;
    ppSummaryBand5: TppSummaryBand;
    ppLine22: TppLine;
    ppShape26: TppShape;
    ppLabel105: TppLabel;
    ppLabel119: TppLabel;
    ppLabel124: TppLabel;
    ppLabel127: TppLabel;
    ppLabel130: TppLabel;
    ppLabel135: TppLabel;
    ppLabel136: TppLabel;
    ppLabel137: TppLabel;
    ppLabel138: TppLabel;
    ppLabel141: TppLabel;
    ppLabel144: TppLabel;
    pplultapo: TppLabel;
    pplliquidacioncanceladares: TppLabel;
    ppLabel146: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel171: TppLabel;
    ppLabel15: TppLabel;
    ppLabel172: TppLabel;
    ppLabel173: TppLabel;
    ppLabel174: TppLabel;
    ppLabel175: TppLabel;
    pplfecautdesapodet: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel10: TppLabel;
    ppShape27: TppShape;
    ppDBText1: TppDBText;
    pplultapodet: TppLabel;
    pplfeccaldet: TppLabel;
    pplasotelf2_nc: TppLabel;
    ppLabel20: TppLabel;
    ppLabel22: TppLabel;
    pplanonomest: TppLabel;
    ppLabel26: TppLabel;
    ppLabel50: TppLabel;
    ppLabel176: TppLabel;
    ppLabel177: TppLabel;
    ppLabel178: TppLabel;
    pplasoresnomest: TppLabel;
    ppLabel199: TppLabel;
    ppLabel200: TppLabel;
    ppLabel201: TppLabel;
    ppluniges_nc: TppLabel;
    pplultapoest: TppLabel;
    pplfecautdesest: TppLabel;
    ppShape23: TppShape;
    ppLabel13: TppLabel;
    ppLabel25: TppLabel;
    ppLabel196: TppLabel;
    ppLabel205: TppLabel;
    ppLabel203: TppLabel;
    ppLabel206: TppLabel;
    pplliquidacioncanceladaest: TppLabel;
    ppLabel207: TppLabel;
    ppLabel222: TppLabel;
    ppLblUser: TppLabel;
    pplliquidacioncanceladadet: TppLabel;
    ppLabel226: TppLabel;
    Region1: TppRegion;
    ppLabel96: TppLabel;
    pplnumresces: TppLabel;
    // Inicio: HPC_201706_PRE
    // Nuevas variables para el reporte estaditico de cuenta
    // individual sin formato
    pprresestsinfor: TppReport;
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
    ppDetailBand7: TppDetailBand;
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
    pplliquidacioncanceladaest_sf: TppLabel;
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
    ppltotsalpenpagest_sf: TppLabel;
    pplsaldoal_sf: TppLabel;
    ppParameterList4: TppParameterList;
    ppSubReport2: TppSubReport;
    ppChildReport4: TppChildReport;
    ppDetailBand14: TppDetailBand;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppDBText57: TppDBText;
    pplanomes_sf: TppLabel;
    ppSubReport5: TppSubReport;
    ppChildReport9: TppChildReport;
    ppDetailBand15: TppDetailBand;
    ppImage7: TppImage;
    ppImage8: TppImage;
    ppLabel306: TppLabel;
    ppLabel326: TppLabel;
    ppShape37: TppShape;
    ppLabel327: TppLabel;
    ppLabel328: TppLabel;
    ppShape38: TppShape;
    ppLabel329: TppLabel;
    ppLine5: TppLine;
    ppLine7: TppLine;
    ppLine23: TppLine;
    ppLine25: TppLine;
    ppLine27: TppLine;
    ppLine30: TppLine;
    ppLine31: TppLine;
    ppShape39: TppShape;
    ppLabel330: TppLabel;
    ppShape40: TppShape;
    ppLabel331: TppLabel;
    ppLine26: TppLine;
    ppLine58: TppLine;
    ppLine59: TppLine;
    ppLine60: TppLine;
    ppLine61: TppLine;
    ppLine62: TppLine;
    ppLine63: TppLine;
    pplasodni_sf: TppLabel;
    ppShape41: TppShape;
    ppLabel244: TppLabel;
    ppLabel245: TppLabel;
    pplanomes_cf: TppLabel;
    ppShape2: TppShape;
    pplrenacu: TppLabel;
    ppImage9: TppImage;
    pplrenacu2: TppLabel;
    // Fin: HPC_201706_PRE
      Procedure FormActivate(Sender: TObject);
      Procedure btnSalirClick(Sender: TObject);
      Procedure pplblNombreMesPrint(Sender: TObject);
      Procedure pplbluser_aPrint(Sender: TObject);
      Procedure ppLabel95Print(Sender: TObject);
      Procedure ppLblUserPrint(Sender: TObject);
      Procedure rgtiprepClick(Sender: TObject);
      Procedure btnimprimeClick(Sender: TObject);
      Procedure btnprocesarClick(Sender: TObject);
      Procedure pplanomesPrint(Sender: TObject);

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ppDBText8Print(Sender: TObject);

   Private
   Public
      xSql: String;
      xasofresnom, xasofrescese: String;
      xasoresnom,  xasorescese:  String;
      xanomesnom, xanomesces: String;
      xfeccal:String;
      xanomesultapo: String;
      xanomesact:String;
      xtipcueind: String;
      // Inicio: HPC_201705_PRE
      // Se añade variable para controlar el numero de expediente de beneficio
      // xpvslbennr:String;
      xpvslbennr, xpvsexpnro:String;
      // Fin: HPC_201705_PRE
      xaportes, xbonus, xinteres, xmonini: Double;
      xapoofi, xaporec, xniv, xdev: Double;
      nSaldoCI : Double;
End;

Var
   Fnuerepcueind: TFnuerepcueind;

Implementation

// Inicio: HPC_201704_PRE
// Se retira unidad PRE237
// Uses PREDM, VCLCom, PRE237;
Uses PREDM, VCLCom;
// Fin: HPC_201704_PRE

{$R *.dfm}

Procedure TFnuerepcueind.FormActivate(Sender: TObject);
Begin
   // Se verifica la condición del docente para proceder al calculo de su cuenta individual
   // 1. Asociado cesante con cuenta individual y liquidación de beneficio
   // 2. Si es asociado docente con expediente de beneficio en tramite
   // 3. Si es asociado docente sin expediente de beneficio en tramite

   xtipcueind := '3';

   xSql := 'SELECT MAX(A.PVSLBENNR) PVSLBENNR FROM PVS306 A, APO201 B WHERE A.ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND A.ASOID = B.ASOID AND B.ASOTIPID = ''CE''';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   xpvslbennr := DM1.cdsQry.FieldByName('PVSLBENNR').AsString;
   If DM1.cdsQry.FieldByName('PVSLBENNR').AsString <> '' Then xtipcueind := '1';
   // Inicio: HPC_201705_PRE
   // Se controla si es reingresante.
   If DM1.xpvslbennr <> '' Then
   Begin
      xpvslbennr := DM1.xpvslbennr;
      xtipcueind := '1';
   End;
   xSql := 'SELECT MAX(PVSEXPNRO) PVSEXPNRO FROM PVS301 A WHERE A.ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND PVSESTADO IN (''01'',''05'')';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   xpvsexpnro := DM1.cdsQry.FieldByName('PVSEXPNRO').AsString;
   If xpvsexpnro <> '' Then xtipcueind := '2';
   // Fin: HPC_201705_PRE


   // Se calcula el mes actual
   xSql := 'SELECT TO_CHAR(ADD_MONTHS(SYSDATE,-1),''YYYYMM'') ANOMESACT FROM DUAL';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   xanomesact := DM1.cdsQry.FieldByName('ANOMESACT').AsString;
   // Inicio: HPC_201705_PRE
   // Se controla que el asociado no cuenta con expediente o liquidación
   If xtipcueind = '' Then xtipcueind := '3';
   // Fin: HPC_201705_PRE

   If xtipcueind = '1' Then
   Begin
      xSql := 'SELECT PVSLTIPBE, ASORESNOM, ASOFRESNOM, ASOFRESCESE, ASORESCESE, PVSLULAP FROM PVS306 Where ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)
      +' And PVSLBENNR = '+QuotedStr(xpvslbennr);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      xasofresnom    := DM1.cdsQry.FieldByName('ASOFRESNOM').AsString;
      xasofrescese   := DM1.cdsQry.FieldByName('ASOFRESCESE').AsString;
      xasoresnom     := DM1.cdsQry.FieldByName('ASORESNOM').AsString;
      xasorescese    := DM1.cdsQry.FieldByName('ASORESCESE').AsString;
      xfeccal        := DM1.cdsQry.FieldByName('ASOFRESCESE').AsString;
      xanomesces := Copy(DM1.cdsQry.FieldByName('ASOFRESCESE').AsString,7,4)+Copy(DM1.cdsQry.FieldByName('ASOFRESCESE').AsString,4,2);
      xanomesnom := Copy(DM1.cdsQry.FieldByName('ASOFRESNOM').AsString,7,4)+Copy(DM1.cdsQry.FieldByName('ASOFRESNOM').AsString,4,2);
      xanomesultapo := Copy(DM1.cdsQry.FieldByName('PVSLULAP').AsString,1,4)+Copy(DM1.cdsQry.FieldByName('PVSLULAP').AsString,6,2);
      xanomesact := xanomesces;
   End;

   If xtipcueind = '2' Then
   Begin
      // Inicio: HPC_201705_PRE
      // xSql := 'SELECT ASORESNOM, ASOFRESNOM, ASOFRESCESE, ASORESCESE, PVSULTAPO FROM PVS301 Where ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' And PVSESTADO = ''01''';
      xSql := 'SELECT ASORESNOM, ASOFRESNOM, ASOFRESCESE, ASORESCESE, PVSULTAPO FROM PVS301 Where ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' And PVSEXPNRO = '+QuotedStr(xpvsexpnro)+ ' And PVSESTADO IN (''01'',''05'')';
      // Fin: HPC_201705_PRE
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      xasofresnom    := DM1.cdsQry.FieldByName('ASOFRESNOM').AsString;
      xasofrescese   := DM1.cdsQry.FieldByName('ASOFRESCESE').AsString;
      xasoresnom     := DM1.cdsQry.FieldByName('ASORESNOM').AsString;
      xasorescese    := DM1.cdsQry.FieldByName('ASORESCESE').AsString;
      xfeccal        := DM1.cdsQry.FieldByName('ASOFRESCESE').AsString;
      xanomesces := Copy(DM1.cdsQry.FieldByName('ASOFRESCESE').AsString,7,4)+Copy(DM1.cdsQry.FieldByName('ASOFRESCESE').AsString,4,2);
      xanomesnom := Copy(DM1.cdsQry.FieldByName('ASOFRESNOM').AsString,7,4)+Copy(DM1.cdsQry.FieldByName('ASOFRESNOM').AsString,4,2);
      xanomesultapo := Copy(DM1.cdsQry.FieldByName('PVSULTAPO').AsString,1,4)+Copy(DM1.cdsQry.FieldByName('PVSULTAPO').AsString,6,2);
      xanomesact := xanomesces;
   End;

   If xtipcueind = '3' Then
   Begin
      xasofresnom  := DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString;
      xasoresnom   := DM1.cdsAsociado.FieldByName('ASORESNOM').AsString;
      xSql := 'SELECT MAX(APOSEC) APOSEC FROM APO301 WHERE ASOID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      xanomesultapo := DM1.cdsQry.FieldByName('APOSEC').AsString;
      xasofrescese := '28/'+Copy(xanomesultapo,5,2)+'/'+Copy(xanomesultapo,1,4);
      xSql := 'SELECT TO_DATE(LAST_DAY(ADD_MONTHS('+QuotedStr(xasofrescese)+',24))) ULDIAFECCES FROM DUAL';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      xasofrescese := DM1.cdsQry.FieldByName('ULDIAFECCES').AsString;
      xSql := 'SELECT TO_DATE(last_day('+QuotedStr('28/'+Copy(xanomesact,5,2)+'/'+Copy(xanomesact,1,4))+')) ULDIAMESACT FROM DUAL';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      If DM1.cdsQry.FieldByName('ULDIAMESACT').AsDateTime < StrToDate(xasofrescese) Then
         xasofrescese := DM1.cdsQry.FieldByName('ULDIAMESACT').AsString;
      xasorescese  := '0000';
      xanomesces   := Copy(xasofrescese,7,4)+Copy(xasofrescese,4,2);
      xanomesnom   := Copy(xasofresnom,7,4)+Copy(xasofresnom,4,2);
      xfeccal      := xasofrescese;
   End;


   DM1.cdsestapo.EmptyDataSet;
   DM1.cdsCueInd.EmptyDataSet;

   btnimprime.Enabled := False;
   rgmodcueind.Enabled := False;
   pnlCCI.Visible  := False;


End;

Procedure TFnuerepcueind.btnSalirClick(Sender: TObject);
Begin
   Close;
End;

Procedure TFnuerepcueind.pplblNombreMesPrint(Sender: TObject);
Begin
   pplnommes.Caption := DM1.NombreMes(DM1.cdsQry22.FieldByName('MES').AsString);
End;

Procedure TFnuerepcueind.pplbluser_aPrint(Sender: TObject);
Begin
   If DM1.cdsQry19.RecordCount > 0 Then pplbluser_a.Visible := False;
End;

Procedure TFnuerepcueind.ppLabel95Print(Sender: TObject);
Begin
   If StrToDate(xasofrescese) > StrToDate('30/11/1999') Then
   Begin
      ppLabel185.Visible := False;
      ppLabel188.Visible := False;
      pplblmonben_a.Visible := False;
   End
   Else
   Begin
      ppLabel185.Visible := True;
      ppLabel188.Visible := True;
      pplblmonben_a.Visible := True;
   End;
End;

Procedure TFnuerepcueind.ppLblUserPrint(Sender: TObject);
Begin
   If DM1.cdsQry19.RecordCount > 0 Then
      ppLblUser.Visible := False
   Else
      ppLblUser.Visible := True;
End;

Procedure TFnuerepcueind.btnprocesarClick(Sender: TObject);
Begin
   If rgtiprep.ItemIndex = 0 Then
   Begin
      xSql := 'SELECT SUBSTR(A.APOSEC,1,4) TRANSANO, SUBSTR(A.APOSEC,5,2) TRANSMES, SUBSTR(A.APOSEC,1,4)||''-''||SUBSTR(A.APOSEC,5,2) APOSEC,'
         + ' A.TRANSMTO, C.USENOM FROM APO301 A, APO201 B, APO101 C'
         + ' WHERE A.ASOID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString) + ' AND A.APOSEC > ' + QuotedStr(xanomesces)
         + ' AND A.APOSEC <= ' + QuotedStr(xanomesultapo)
         + ' AND A.ASOID = B.ASOID AND B.USEID = C.USEID AND B.UPAGOID = C.UPAGOID AND B.UPROID = C.UPROID ORDER BY APOSEC';
      DM1.cdsQry19.Close;
      DM1.cdsQry19.DataRequest(xSql);
      DM1.cdsQry19.Open;
      If Copy(xasofrescese, 7, 4) + Copy(xasofrescese, 4, 2) < '199701' Then
      Begin
         MessageDlg('No se puede generar cuenta individual para fechas de cese menores a Ene/1997 ', mtInformation, [mbOk], 0);
         Exit;
      End;
      dbgcueind.Refresh;
      dbgcueind.Visible := True;
      dbgaportes.Visible := False;
      dbgcueind.Top := 61;
      dbgcueind.Left := 8;
      // Inicio: HPC_201706_PRE
      // Se borra tabla global tempory
      // xSql := 'DELETE FROM T_CTAIND1 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString);
      xSql := 'DELETE FROM T_CTAIND1 WHERE 1=1';
      // Fin: HPC_201706_PRE
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      xSql := 'BEGIN P_CUENTA_INDIVIDUAL('+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+','+QuotedStr(xasofresnom)+','+QuotedStr(xasofrescese)+','+QuotedStr(xpvslbennr)+',''N''); END;';
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      xSql := 'SELECT LUG_PRO, COD_USE, COD_MOD, NRO_VEZ, LIB_ELE, ACUMESANT, INTCAPACU, BONOS, CAPITAL, TRANSMTODEV, ACUMULADO, BONOS, FEC_ING, FEC_CES, ANOSERF, ANOSER, FEC_PROC, FLG_PROC, TIP_CLI, ANO, MES, ASOID, TRI,COD_PAG, TRANSMTODEV, TRANSMTO'
      +' FROM (SELECT LUG_PRO,COD_USE,COD_MOD,NRO_VEZ,LIB_ELE, 0 ACUMESANT, ACUMESANT ACUMULADO, ACUMESANT CAPITAL, 0 INTCAPACU, 0 BONOS,FEC_ING,FEC_CES,ANOSERF,ANOSER,FEC_PROC,FLG_PROC, TIP_CLI, ''1996'' ANO, ''12'' MES,ASOID,TRI,COD_PAG, 0 TRANSMTODEV,'
      +' TRANSMTO FROM T_CTAIND1 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND ANO||MES = ''199701'''
      +' UNION ALL SELECT LUG_PRO,COD_USE,COD_MOD,NRO_VEZ,LIB_ELE, ACUMESANT, ACUMULADO, CAPITAL, INTCAPACU, BONOS,FEC_ING,FEC_CES,ANOSERF,ANOSER,FEC_PROC,FLG_PROC, TIP_CLI, ANO, MES, ASOID, TRI, COD_PAG, TRANSMTODEV, TRANSMTO FROM T_CTAIND1'
      +' WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND ANO||MES < to_char(sysdate,''YYYYMM'')'
      +' ) ORDER BY ANO,MES';
      DM1.cdsCuentas.Close;
      DM1.cdsCuentas.DataRequest(xSql);
      DM1.cdsCuentas.Open;
      DM1.cdsCuentas.First;
      xmonini := DM1.cdsCuentas.FieldByName('ACUMESANT').AsFloat;
      If DM1.cdsCuentas.RecordCount > 0 Then
      Begin
         rgmodcueind.Enabled := True;
         btnimprime.Enabled := True;
      End
      Else
      Begin
         MessageDlg('No existe información de cuenta individual', mtInformation, [mbOk], 0);
         Exit;
      End;
      DM1.cdsCueInd.EmptyDataSet;
      dbgcueind.Visible := True;
      dbgcueind.Top := 61;
      dbgcueind.Left := 8;
      dbgaportes.Visible := False;
      lblnoaportes.Visible := False;
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
            If DM1.cdsCuentas.FieldByName('ANO').AsString+DM1.cdsCuentas.FieldByName('MES').AsString = '199612' Then
            Begin
              DM1.cdsCueInd.FieldByName('ANO').AsString := Copy(DM1.NombreMes(Copy(DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString,4,2)),1,3)+' '+Copy(DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString,7,4)+' A DIC 1996';
              DM1.cdsCueInd.FieldByName('MES').AsString := '';
            End
            Else
            Begin
              DM1.cdsCueInd.FieldByName('MES').AsString := DM1.NombreMes(DM1.cdsCuentas.FieldByName('MES').AsString);
              DM1.cdsCueInd.FieldByName('ANO').AsString := DM1.cdsCuentas.FieldByName('ANO').AsString
            End;
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
            ppltotacum.Caption := FormatFloat('###,###.00', DM1.cdsCueInd.FieldByName('TOTACU').AsFloat);
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
      dbgcueind.ColumnByName('APORTE').FooterValue := FormatFloat('###,###.#0', xaportes);
      dbgcueind.ColumnByName('BONUS').FooterValue := FormatFloat('###,###.#0', xbonus);
      dbgcueind.ColumnByName('INTERES').FooterValue := FormatFloat('###,###.#0', xinteres);
   End;

   If rgtiprep.ItemIndex = 1 Then
   Begin
      xSql := 'SELECT A.TRANSANO, A.TRANSMES, A.TRANSANO||''-''||A.TRANSMES APOSEC, A.TRANSMTO, C.USENOM FROM APO301 A, APO201 B, APO101 C'
      + ' WHERE A.ASOID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString) + ' AND A.TRANSANO||A.TRANSMES > ' + QuotedStr(xanomesces)
      + ' AND A.TRANSANO||A.TRANSMES <= ' + QuotedStr(xanomesultapo)
      + ' AND A.ASOID = B.ASOID AND B.USEID = C.USEID AND B.UPAGOID = C.UPAGOID AND B.UPROID = C.UPROID ORDER BY A.TRANSANO, A.TRANSMES';
      DM1.cdsQry19.Close;
      DM1.cdsQry19.DataRequest(xSql);
      DM1.cdsQry19.Open;
      dbgaportes.Visible := True;
      dbgcueind.Visible := False;
      dbgaportes.Top := 61;
      dbgaportes.Left := 8;
      dbgaportes.Refresh;
      TNumericField(DM1.cdsestapo.FieldByName('APOOFI')).DisplayFormat := '###,###,##0.00';
      TNumericField(DM1.cdsestapo.FieldByName('APOREC')).DisplayFormat := '###,###,##0.00';
      TNumericField(DM1.cdsestapo.FieldByName('NIV')).DisplayFormat := '###,###,##0.00';
      TNumericField(DM1.cdsestapo.FieldByName('DEV')).DisplayFormat := '###,###,##0.00';
      xSql := 'SELECT C.USENOM, A.APOANO, A.APOMES, NVL(A.APOVALOR,0) APOVALOR, NVL(B.TRANSMTO,0) TRANSMTO, NVL(A.APOVALOR,0)-(NVL(B.TRANSMTO,0)-NVL(B.TRANSMTODEV,0)+NVL(B.DEVAPOBEN,0)) NIV'
         + ' FROM APO117 A, (SELECT TRANSANO, TRANSMES, MAX(USEID) USEID, MAX(UPAGOID) UPAGOID, MAX(UPROID) UPROID, SUM(NVL(TRANSMTO,0)) TRANSMTO, SUM(NVL(TRANSMTODEV,0)) TRANSMTODEV, SUM(NVL(DEVAPOBEN,0)) DEVAPOBEN'
         + ' FROM APO301 WHERE ASOID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString) + ' AND FORPAGOABR <> ''BEN'' GROUP BY TRANSANO, TRANSMES) B, APO101 C WHERE APOANO||APOMES >= '+QuotedStr(xanomesnom)
         + ' AND APOANO||APOMES <= ' + QuotedStr(xanomesces) + ' AND A.APOANO = B.TRANSANO(+)'
         + ' AND A.APOMES = B.TRANSMES(+) AND B.USEID = C.USEID(+) AND B.UPAGOID = C.UPAGOID(+) AND B.UPROID = C.UPROID(+) ORDER BY A.APOANO, A.APOMES';
      DM1.cdsQry25.Close;
      DM1.cdsQry25.DataRequest(xSql);
      DM1.cdsQry25.Open;
      If DM1.cdsQry25.RecordCount = 0 Then
      Begin
         Exit;
      End;
      btnimprime.Enabled := True;
      DM1.cdsestapo.EmptyDataSet;
      While Not DM1.cdsQry25.Eof Do
      Begin
         DM1.cdsestapo.Append;
         DM1.cdsestapo.FieldByName('APOANO').AsString := DM1.cdsQry25.FieldByName('APOANO').AsString;
         DM1.cdsestapo.FieldByName('APOMES').AsString := DM1.cdsQry25.FieldByName('APOMES').AsString;
         DM1.cdsestapo.FieldByName('USENOM').AsString := DM1.cdsQry25.FieldByName('USENOM').AsString;
         DM1.cdsestapo.FieldByName('APOOFI').AsFloat := DM1.cdsQry25.FieldByName('APOVALOR').AsFloat;
         DM1.cdsestapo.FieldByName('APOREC').AsFloat := DM1.cdsQry25.FieldByName('TRANSMTO').AsFloat;
         If DM1.cdsQry25.FieldByName('NIV').AsFloat > 0 Then
            DM1.cdsestapo.FieldByName('NIV').AsFloat := DM1.cdsQry25.FieldByName('NIV').AsFloat;
         If DM1.cdsQry25.FieldByName('NIV').AsFloat < 0 Then
            DM1.cdsestapo.FieldByName('DEV').AsFloat := Abs(DM1.cdsQry25.FieldByName('NIV').AsFloat);
         DM1.cdsestapo.FieldByName('MES').AsString := DM1.NombreMes(DM1.cdsQry25.FieldByName('APOMES').AsString);
         DM1.cdsQry25.Next;
      End;
      DM1.cdsestapo.First;
      xapoofi := 0;
      xaporec := 0;
      xniv := 0;
      xdev := 0;
      While Not DM1.cdsestapo.Eof Do
      Begin
         xapoofi := xapoofi + DM1.cdsestapo.FieldByName('APOOFI').AsFloat;
         xaporec := xaporec + DM1.cdsestapo.FieldByName('APOREC').AsFloat;
         xniv := xniv + DM1.cdsestapo.FieldByName('NIV').AsFloat;
         xdev := xdev + DM1.cdsestapo.FieldByName('DEV').AsFloat;
         DM1.cdsestapo.Next;
      End;
      DM1.cdsestapo.First;
      dbgaportes.ColumnByName('APOOFI').FooterValue := FormatFloat('###,###.#0', xapoofi);
      dbgaportes.ColumnByName('APOREC').FooterValue := FormatFloat('###,###.#0', xaporec);
      dbgaportes.ColumnByName('NIV').FooterValue := FormatFloat('###,###.#0', xniv);
      dbgaportes.ColumnByName('DEV').FooterValue := FormatFloat('###,###.#0', xdev);
   End;

   DM1.ResumenCCI( DM1.cdsAsociado.FieldByName('ASOID').AsString );
   If DM1.cdsRepCCI.FieldByName('TOTCCI').AsFloat>0 then
   Begin
      If rgtiprep.ItemIndex = 0 Then
         nSaldoCI:= strtofloat(StringReplace(ppltotacum.Caption,',','',[rfReplaceAll]))
      Else
         nSaldoCI:= xapoofi;
      DM1.cdsRepCCI.Edit;
      DM1.cdsRepCCI.FieldByName('SALDO').AsFloat:= nSaldoCI - DM1.cdsRepCCI.FieldByName('TOTCCI').AsFloat;
      DM1.cdsRepCCI.Post;

     dbeTotCCI.DataField :='TOTCCI';
     dbeTotCCI.DataSource:=DM1.dsRepCCI;

     dbeSaldo.DataField  :='SALDO';
     dbeSaldo.DataSource :=DM1.dsRepCCI;

     TNumericField(DM1.cdsRepCCI.FieldByName('TOTCCI')).DisplayFormat := '###,###,##0.00';
     TNumericField(DM1.cdsRepCCI.FieldByName('SALDO')).DisplayFormat := '###,###,##0.00';
     pnlCCI.Visible:=True;
  end
  else
     pnlCCI.Visible:=False;
End;

Procedure TFnuerepcueind.rgtiprepClick(Sender: TObject);
Begin
   pnlCCI.visible:=False;
   dbgcueind.Visible := True;
   dbgaportes.Visible := False;
   rgmodcueind.Enabled := False;
   btnimprime.Enabled := False;
   DM1.cdsestapo.EmptyDataSet;
   DM1.cdsCueInd.EmptyDataSet;
   If rgtiprep.ItemIndex = 0 Then
   Begin
      dbgcueind.ColumnByName('APORTE').FooterValue := FormatFloat('###,###.#0', 0);
      dbgcueind.ColumnByName('BONUS').FooterValue := FormatFloat('###,###.#0', 0);
      dbgcueind.ColumnByName('INTERES').FooterValue := FormatFloat('###,###.#0', 0);
      dbgcueind.Visible := True;
      dbgcueind.Top := 61;
      dbgcueind.Left := 8;
      dbgaportes.Visible := False;
   End
   Else
   Begin
      dbgaportes.ColumnByName('APOOFI').FooterValue := FormatFloat('###,###.#0', 0);
      dbgaportes.ColumnByName('APOREC').FooterValue := FormatFloat('###,###.#0', 0);
      dbgaportes.ColumnByName('NIV').FooterValue := FormatFloat('###,###.#0', 0);
      dbgaportes.ColumnByName('DEV').FooterValue := FormatFloat('###,###.#0', 0);
      dbgaportes.Visible := True;
      dbgaportes.Top := 61;
      dbgaportes.Left := 8;
      dbgcueind.Visible := False;
   End;
End;

Procedure TFnuerepcueind.btnimprimeClick(Sender: TObject);
Var
   // Inicio: HPC_201706_PRE
   // Se añade variable para guardar el nuevo Sql de la cuenta individual
   // xSql, xfecini, xultano, xAnoMesIni: String;
   xSql, xfectmp, xSqlctaind, xfecini, xultano, xAnoMesIni: String;
   // Fin: HPC_201706_PRE
   xtmp: Double;
   xAno, xMes, xMesIni, xAnoIni, i: Integer;
   xmonpen, xtotal_pie: Double;
   // Inicio: HPC_201706_PRE
   // Nueva variable para guadar montos para el calculo de la rentabilidad acumulada
   xtotcueind, xtotapo: Double;
   // Fin: HPC_201706_PRE
   Chart: TDBChart;
   Series: TPieSeries;
   Image: TImage;
   Jpeg: TJpegImage;
   apo, int, bon: Double;
   XULT_ANHOMES_APORT:string;
   ultimoAnhoSaldo:integer;
   ultimoMesSaldo:integer;
   ultimoDiaSaldo :Integer;
Begin
   // ppltotapopenres
   // ppltotapopendet
   // ppltotsalpenpagest

   If rgtiprep.ItemIndex = 0 Then
   Begin
      DM1.DetalleCCI(DM1.cdsAsociado.FieldByName('ASOID').AsString);
      If xtipcueind = '3' Then
         DM1.tTiempoTranscurrido := DM1.tiempoTranscurrido(dm1.FechaSys, StrToDate(xasofresnom), '0')
      Else
         DM1.tTiempoTranscurrido := DM1.tiempoTranscurrido(StrToDate( xasofrescese), StrToDate(xasofresnom) , '0');

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
      // Se muestra mensaje que cuenta individual ya fue pagada por beneficios
      If xpvslbennr = '' Then
      Begin
         pplliquidacioncanceladares.Visible := False;
         pplliquidacioncanceladadet.Visible := False;
         pplliquidacioncanceladaest.Visible := False;
         // Inicio: HPC_201706_PRE
         // Se pone en estado de invisible mensaje de cuenta individual cancelada
         pplliquidacioncanceladaest_sf.Visible := False;
         // Fin: HPC_201706_PRE
      End
      Else
      Begin
         pplliquidacioncanceladares.Visible := True;
         pplliquidacioncanceladares.Caption := 'CUENTA INDIVIDUAL CANCELADA. LIQUIDACION Nº '+Copy(xpvslbennr,1,4)+'-'+Copy(xpvslbennr,5,7);
         pplliquidacioncanceladadet.Visible := True;
         pplliquidacioncanceladadet.Caption := 'CUENTA INDIVIDUAL CANCELADA. LIQUIDACION Nº '+Copy(xpvslbennr,1,4)+'-'+Copy(xpvslbennr,5,7);
         pplliquidacioncanceladaest.Visible := True;
         pplliquidacioncanceladaest.Caption := 'CUENTA INDIVIDUAL CANCELADA. LIQUIDACION Nº '+Copy(xpvslbennr,1,4)+'-'+Copy(xpvslbennr,5,7);
         // Inicio: HPC_201706_PRE
         // Se muestra mensaje de cuenta individual cancelada
         pplliquidacioncanceladaest_sf.Visible := True;
         pplliquidacioncanceladaest_sf.Caption := 'CUENTA INDIVIDUAL CANCELADA. LIQUIDACION Nº '+Copy(xpvslbennr,1,4)+'-'+Copy(xpvslbennr,5,7);
         // Fin: HPC_201706_PRE
      End;
      If rgmodcueind.ItemIndex = 0 Then
      Begin
         xSql := 'SELECT A.TRANSANO, A.TRANSMES, A.TRANSANO||''-''||A.TRANSMES APOSEC, A.TRANSMTO, C.USENOM FROM APO301 A, APO201 B, APO101 C'
            + ' WHERE A.ASOID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString) + ' AND A.APOSEC > ' + QuotedStr(xanomesces)
            + ' AND A.APOSEC <= ' + QuotedStr(xanomesultapo)
            + ' AND A.ASOID = B.ASOID AND B.USEID = C.USEID AND B.UPAGOID = C.UPAGOID AND B.UPROID = C.UPROID ORDER BY APOSEC';
         DM1.cdsQry25.Close;
         DM1.cdsQry25.DataRequest(xSql);
         DM1.cdsQry25.Open;
         // Impresion de datos generales del asociado
         xultano              := Copy(xanomesces,1,4);
         pplfecresnom.Caption := xasofresnom;
         // No se muestra la fecha de cese si es asociado docente sin expediente ni liquidación de beneficio
         If xtipcueind <> '3' Then
         Begin
            pplfecresces.Caption := xasofrescese;
            pplnumresces.Caption := xasorescese;
         End
         Else
         Begin
            pplfecresces.Caption := '';
            pplnumresces.Caption := '';            
         End;
         pplfeccal.Caption := xfeccal;
         pplultapo.Caption := Copy(DM1.NombreMes(Copy(xanomesultapo, 5, 2)),1,3)+'-'+Copy(xanomesultapo, 1, 4);
         pplasodni.Caption := DM1.cdsAsociado.FieldByName('ASODNI').AsString;
         pplasoapenomdni.Caption := Copy(DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString,1,41);
         pplnumresnom.Caption := xasoresnom;
         pplregpendes.Caption := DM1.DevuelveValor('APO105', 'REGPENDES', 'REGPENID', DM1.cdsAsociado.FieldByName('REGPENID').AsString);
         pplanoapo.Caption := FloatToStr(DM1.anosTranscurridos)+' AÑOS';
         pplfecautdesapo.Caption := Copy(DM1.cdsAsociado.FieldByName('FECAUTDESAPO').AsString,1,10);
         xSql := 'UPROID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString)+' AND UPAGOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString)+' AND USEID = '+QuotedStr(DM1.cdsAsociado.FieldByName('USEID').AsString);
         pplusenom.Caption := DM1.DisplayDescrip('PRV', 'APO101', 'USENOM', xSql, 'USENOM');
         pplmonacuini.Caption := Copy(DM1.NombreMes(Copy(xasofresnom, 4, 2)),1,3)+' '+Copy(xanomesnom, 1, 4)+' A DIC 1996';
         ppltitpercunind.Caption := 'RESUMEN PERIODO ACUMULADO Y CUENTA INDIVIDUAL POR AÑO DE '+Copy(DM1.NombreMes(Copy(xasofresnom, 4, 2)),1,3)+' '+Copy(xanomesnom, 1, 4)+' A DIC '+IntToStr(StrToInt(xultano)-1);
         // Inicio: HPC_201706_PRE
         // Se retira el punto del signo de soles.
         // ppltotapopenres.Caption := 'TOTAL APORTES PENDIENTE DE PAGO S/. '+FloatToStrF(xmonpen,ffNumber,9,2);
         ppltotapopenres.Caption := 'TOTAL APORTES PENDIENTE DE PAGO S/ '+FloatToStrF(xmonpen,ffNumber,9,2);
         // Fin: HPC_201706_PRE
         xSql := 'SELECT ACUMESANT ACUMULADO FROM T_CTAIND1 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND ANO = ''1997'' AND MES = ''01''';
         DM1.cdsQry20.Close;
         DM1.cdsQry20.DataRequest(xSql);
         DM1.cdsQry20.Open;
         If DM1.cdsQry20.RecordCount = 0 Then
         Begin
            ppsrresumen.Top :=  14.288;
            pplmonacuini.Visible := False;
            ppDBTAcuIni.Visible := False;
         End
         Else
         Begin
            pplmonacuini.Visible := True;
            ppDBTAcuIni.Visible := True;
         End;
         xSql := 'SELECT ANO, MIN(NVL(ACUMESANT,0)) ACUMESANT, SUM(NVL(CAPITAL,0)) CAPITAL, SUM(NVL(INTCAPACU,0)) INTCAPACU, SUM(NVL(BONOS,0)) BONOS,'
         + ' MAX(NVL(ACUMULADO,0)) ACUMULADO FROM T_CTAIND1 WHERE ASOID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)
         + ' AND ANO > ''1996'' AND ANO < ' + QuotedStr(IntToStr(StrToInt(xultano)))
         + ' AND ANO||MES < to_char(sysdate,''YYYYMM'') '
         + ' GROUP BY ANO ORDER BY ANO';
         DM1.cdsQry21.Close;
         DM1.cdsQry21.DataRequest(xSql);
         DM1.cdsQry21.Open;
         xSql := 'SELECT ANO, MES, NVL(ACUMESANT,0) ACUMESANT, NVL(CAPITAL,0) CAPITAL, NVL(INTCAPACU,0) INTCAPACU, NVL(BONOS,0) BONOS,'
         + ' NVL(ACUMULADO,0) ACUMULADO FROM T_CTAIND1 WHERE ASOID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)
         + ' AND ANO = ' + QuotedStr(xultano)
         + ' AND ANO||MES < to_char(sysdate,''YYYYMM'') '
         + ' ORDER BY ANO,MES';
         DM1.cdsQry22.Close;
         DM1.cdsQry22.DataRequest(xSql);
         DM1.cdsQry22.Open;
         ppltitdet.Caption := 'DETALLE DE CUENTA INDIVIDUAL AÑO : ' + xultano;
         pplusuario.Caption := 'Impreso por   : ' + DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
         ppltituloresumen.Caption := 'ESTADO DE CUENTA INDIVIDUAL DE APORTES AL '+xfeccal;
         pplapoacu.Caption := FloatToStrF(xaportes + xmonini, ffNumber, 10, 2);
         pplbonacu.Caption := FloatToStrF(xbonus, ffNumber, 10, 2);
         pplintacu.Caption := FloatToStrF(xinteres, ffNumber, 10, 2);
         ppltotAcu.Caption := FloatToStrF(xmonini + xaportes + xbonus + xinteres, ffNumber, 10, 2);
         pplporapoacu.Caption := FloatToStrF(((xaportes + xmonini) / (xmonini + xaportes + xbonus + xinteres)) * 100, ffNumber, 10, 2) + '%';
         pplporintacu.Caption := FloatToStrF((xinteres / (xmonini + xaportes + xbonus + xinteres)) * 100, ffNumber, 10, 2) + '%';
         xtmp := 100 - (StrToFloat(FloatToStrF(((xaportes + xmonini) / (xmonini + xaportes + xbonus + xinteres)) * 100, ffNumber, 10, 2)) + StrToFloat(FloatToStrF((xinteres / (xmonini + xaportes + xbonus + xinteres)) * 100, ffNumber, 10, 2)));
         pplporbonacu.Caption := FloatToStrF(xtmp, ffNumber, 10, 2) + '%';
         pprcueindres.Print;
         pprcueindres.Stop;
      End;
      If rgmodcueind.ItemIndex = 1 Then
      Begin
         DM1.cdsCuentas.First;
         pplblanoapodet.Caption := FloatToStr(DM1.anosTranscurridos)+' AÑOS';
         ppltitulodetalle.Caption := 'ESTADO DE CUENTA INDIVIDUAL DE APORTES AL ' + xfeccal;
         // Inicio: HPC_201706_PRE 
         // Se retira el punto del signo de soles.
         // ppltotapopendet.Caption := 'TOTAL APORTES PENDIENTE DE PAGO S/. '+FloatToStrF(xmonpen,ffNumber,9,2);
         ppltotapopendet.Caption := 'TOTAL APORTES PENDIENTE DE PAGO S/ '+FloatToStrF(xmonpen,ffNumber,9,2);
         // Fin: HPC_201706_PRE

         pplblregpen.Caption := DM1.DevuelveValor('APO105', 'REGPENDES', 'REGPENID', DM1.cdsAsociado.FieldByName('REGPENID').AsString);
         xSql := 'UPROID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString)+' AND UPAGOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString)+' AND USEID = '+QuotedStr(DM1.cdsAsociado.FieldByName('USEID').AsString);
         pplblusenom.Caption := DM1.DisplayDescrip('PRV', 'APO101', 'USENOM', xSql, 'USENOM');
         pplblasoresnom.Caption   := xasoresnom;
         pplblasofresnom.Caption  := xasofresnom;
         pplfecautdesapodet.Caption := Copy(DM1.cdsAsociado.FieldByName('FECAUTDESAPO').AsString,1,10);
         // No se muestra la fecha de cese si es asociado docente sin expediente ni liquidación de beneficio
         If xtipcueind <> '3' Then
            pplblasofrescese.Caption := xasofrescese
         Else
            pplblasofrescese.Caption := '';
         // Inicio: HPC_201706_PRE
         // Se añade etiqueta con numero de DNI
         pplblasodni.Caption := DM1.cdsAsociado.FieldByName('ASODNI').AsString;
         // Fin: HPC_201706_PRE
         pplblasoapenomdni.Caption := DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString;
         pplultapodet.Caption := Copy(DM1.NombreMes(Copy(xanomesultapo, 5, 2)),1,3)+'-'+Copy(xanomesultapo, 1, 4);
         pplfeccaldet.Caption := xfeccal;
         ppLblUser.Caption := 'Impreso por   : ' + DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
         pprccueind.Print;
         pprccueind.Stop;
      End;
      // Inicio: HPC_201706_PRE
      // Se crea reporte de estaditico de cuenta individual
      // en hojas sin formato.  
      // Estadistico sin formato de cuenta individual
      If rgmodcueind.ItemIndex = 2 Then
      Begin
         MessageDlg('Debe configurar la impresora, seleccionar la impresión en ambas caras', mtInformation, [mbOk], 0);
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
         ' SELECT 2 ORDEN, ''SALDO CTA. IND.: '+Copy(DM1.NombreMes(Copy(xfectmp,5,2)),1,3)+' '+Copy(xfectmp,1,4)+'-'+Copy(DM1.NombreMes(Copy(xAnoMesIni,5,2)),1,3)+' '+Copy(xAnoMesIni,1,4)+' '' DESCRIPCION,'
         +' SUM(INTCAPACU) INTERES, SUM(BONOS) BONUS, SUM(CAPITAL) APORTE, MIN(ACUMESANT)+SUM(INTCAPACU+BONOS+CAPITAL) SALDO FROM T_CTAIND1'
         +' WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND ANO||MES >= '+QuotedStr(xfectmp)+' AND ANO||MES <= '+QuotedStr(xAnoMesIni)+'  UNION ALL ';
         xSqlctaind := xSqlctaind +
         'SELECT ROWNUM ORDEN, ANO||MES DESCRPCION, NVL(INTCAPACU,0) INTERES, NVL(BONOS,0) BONUS, NVL(CAPITAL,0) APORTE, NVL(ACUMULADO,0) SALDO FROM T_CTAIND1'
            + ' WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND ANO||MES > ' + QuotedStr(xAnoMesIni)+ ' AND ANO||MES <= '+QuotedStr(xanomesces);
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
         Image := TImage.Create(Nil);
         Image.Width := Chart1.Width;
         Image.Height := Chart1.Height;
         // configura os valores específicos
         Chart1.Draw(Image1.Canvas, Image.BoundsRect);
         Jpeg := TJpegImage.Create;
         Jpeg.Assign(Image1.Picture.Bitmap);
         ppImage6.Picture.Bitmap := image1.Picture.Bitmap;
         xSql := 'SELECT MIN(NVL(ACUMESANT,0))+SUM(CAPITAL) APORTE, MAX(NVL(ACUMULADO,0)) SALDO FROM T_CTAIND1 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString);
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         pplrenacu.Caption := 'Rentabilidad Acumulada = (('+FloatToStrF(DM1.cdsQry.FieldByName('SALDO').AsFloat,ffNumber,10,2)+'/'
         +FloatToStrF(DM1.cdsQry.FieldByName('APORTE').AsFloat,ffNumber,10,2)+')-1)*100 = '+FloatToStrF(((DM1.cdsQry.FieldByName('SALDO').AsFloat/DM1.cdsQry.FieldByName('APORTE').AsFloat)-1)*100,ffNumber,12,0)+'%';
         pprresestsinfor.Print;
         pprresestsinfor.Stop;
      End;
      // Estadistico con formato cuenta individual
      If rgmodcueind.ItemIndex = 3 Then
      Begin
         // COLOCAR NIVEL DEL CENTRO EDUCATIVO
         xSql := 'SELECT UPPER(NIVEDU_DES) NIVEDU_DES, B.CENEDUID FROM ASO_CEN_EDU B, NIV_CEN_EDU C WHERE B.NIVEDU_ID = C.NIVEDU_ID(+) AND B.CENEDUID = '+ QuotedStr(DM1.cdsAsociado.FieldByName('CENEDUID').AsString);
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         pplcpoNIVEDU.Caption := DM1.cdsQry.FieldByName('NIVEDU_DES').AsString;
         pplasoapenomdni_nc.Caption := DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString;
         pplasodni_nc.Caption := DM1.cdsAsociado.FieldByName('ASODNI').AsString;
         pplasodir_nc.Caption := DM1.cdsAsociado.FieldByName('ASODIR').AsString;
         ppldst_nc.Caption := Trim(DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', DM1.cdsAsociado.FieldByName('ZIPID').AsString))+'/'+
         Trim(DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', Copy(DM1.cdsAsociado.FieldByName('ZIPID').AsString, 1, 4)))+'/'+
         Trim(DM1.DevuelveValor('APO158', 'DPTODES', 'DPTOID', Copy(DM1.cdsAsociado.FieldByName('ZIPID').AsString, 1, 2)));
         pplasotelf1_nc.Caption := DM1.cdsAsociado.FieldByName('ASOTELF1').AsString;
         pplasotelf2_nc.Caption := DM1.cdsAsociado.FieldByName('ASOTELF2').AsString;
         pplasocodmod_nc.Caption := DM1.cdsAsociado.FieldByName('ASOCODMOD').AsString;
         xSql := 'UPROID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString)+' AND UPAGOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString)+' AND USEID = '+QuotedStr(DM1.cdsAsociado.FieldByName('USEID').AsString);
         ppluniges_nc.Caption := DM1.DisplayDescrip('PRV', 'APO101', 'USENOM', xSql, 'USENOM');
         pplasofresnom_nc.Caption := DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString;
         pplasoresnomest.Caption := DM1.cdsAsociado.FieldByName('ASORESNOM').AsString;
         pplultapoest.Caption := Copy(DM1.NombreMes(Copy(xanomesultapo, 5, 2)),1,3)+'-'+Copy(xanomesultapo, 1, 4);
         pplfecautdesest.Caption := Copy(DM1.cdsAsociado.FieldByName('FECAUTDESAPO').AsString,1,10);
         pplanonomest.Caption :=  FloatToStr(DM1.anosTranscurridos)+' AÑOS';
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
         pplcpocenedu.Caption := DM1.cdsQry24.FieldByName('CENPO').AsString;
         pplasodeslab_nc.Caption := DM1.cdsQry24.FieldByName('NOMCENEDU').AsString;
         ppldstdeslab_nc.Caption := Trim(DM1.cdsQry24.FieldByName('DPTO').AsString)+'/'+Trim(DM1.cdsQry24.FieldByName('PROV').AsString)+'/'+Trim(DM1.cdsQry24.FieldByName('DIST').AsString);
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
         ' SELECT 2 ORDEN, ''SALDO CTA. IND.: '+Copy(DM1.NombreMes(Copy(xfectmp,5,2)),1,3)+' '+Copy(xfectmp,1,4)+'-'+Copy(DM1.NombreMes(Copy(xAnoMesIni,5,2)),1,3)+' '+Copy(xAnoMesIni,1,4)+' '' DESCRIPCION,'
         +' SUM(INTCAPACU) INTERES, SUM(BONOS) BONUS, SUM(CAPITAL) APORTE, MIN(ACUMESANT)+SUM(INTCAPACU+BONOS+CAPITAL) SALDO FROM T_CTAIND1'
         +' WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND ANO||MES >= '+QuotedStr(xfectmp)+' AND ANO||MES <= '+QuotedStr(xAnoMesIni)+'  UNION ALL ';
         xSqlctaind := xSqlctaind +
         'SELECT ROWNUM ORDEN, ANO||MES DESCRPCION, NVL(INTCAPACU,0) INTERES, NVL(BONOS,0) BONUS, NVL(CAPITAL,0) APORTE, NVL(ACUMULADO,0) SALDO FROM T_CTAIND1'
            + ' WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND ANO||MES > ' + QuotedStr(xAnoMesIni)+ ' AND ANO||MES <= '+QuotedStr(xanomesces);
         DM1.cdsQry21.Close;
         DM1.cdsQry21.DataRequest(xSqlctaind);
         DM1.cdsQry21.Open;

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
         // Inicio: Se modifica el detalle del reporte estadistico cuenta individual
         // xSql := 'SELECT ANO, MES, NVL(CAPITAL,0) APORTE, NVL(INTCAPACU,0) INTERES, NVL(BONOS,0) BONUS, NVL(ACUMULADO,0) SALDO FROM T_CTAIND1'
         //    + ' WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND ANO||MES > ' + QuotedStr(xAnoMesIni)
         //    + ' AND ANO||MES < to_char(sysdate,''YYYYMM'') '
         //     + ' ORDER BY ANO, MES';
         // DM1.cdsQry21.Close;
         // DM1.cdsQry21.DataRequest(xSql);
         // DM1.cdsQry21.Open;
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
         // Se retiran variables del reporte. Linea se incluye en el Qry.
         // ppldesini.Caption := 'SALDO ACUMULADO AL: ' + DM1.cdsQry.FieldByName('FEC_INI').AsString;
         // pplapoini.Caption := FloatToStrF(DM1.cdsQry20.FieldByName('INICIAL').AsFloat + DM1.cdsQry20.FieldByName('APORTE').AsFloat, ffNumber, 10, 2);
         // pplintini.Caption := FloatToStrF(DM1.cdsQry20.FieldByName('INTERES').AsFloat, ffNumber, 10, 2);
         // pplbonini.Caption := FloatToStrF(DM1.cdsQry20.FieldByName('BONUS').AsFloat, ffNumber, 10, 2);
         // pplsalini.Caption := FloatToStrF(DM1.cdsQry20.FieldByName('SALDO').AsFloat, ffNumber, 10, 2);
         xSql := 'SELECT MIN(NVL(ACUMESANT,0)) ACUMESANT,  SUM(NVL(CAPITAL,0)) CAPITAL,  SUM(NVL(INTCAPACU,0)) INTCAPACU, SUM(NVL(BONOS,0)) BONOS, MAX(NVL(ACUMULADO,0)) ACUMULADO  FROM T_CTAIND1'
            + ' WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND ANO||MES < to_char(sysdate,''YYYYMM'')';
         DM1.cdsQry22.Close;
         DM1.cdsQry22.DataRequest(xSql);
         DM1.cdsQry22.Open;
         // COLOCAR FECHA DE ULTIMO APORTE
         // Se calcula montos para rentabilidad acumulada
         xSql := 'SELECT MIN(NVL(ACUMESANT,0))+SUM(CAPITAL) APORTE, MAX(NVL(ACUMULADO,0)) SALDO FROM T_CTAIND1 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString);
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         pplrenacu2.Caption := 'Rentabilidad Acumulada = (('+FloatToStrF(DM1.cdsQry.FieldByName('SALDO').AsFloat,ffNumber,10,2)+'/'
         +FloatToStrF(DM1.cdsQry.FieldByName('APORTE').AsFloat,ffNumber,10,2)+')-1)*100 = '+FloatToStrF(((DM1.cdsQry.FieldByName('SALDO').AsFloat/DM1.cdsQry.FieldByName('APORTE').AsFloat)-1)*100,ffNumber,12,0)+'%';
         pplapofin.Caption := FloatToStrF(DM1.cdsQry22.FieldByName('ACUMESANT').AsFloat + DM1.cdsQry22.FieldByName('CAPITAL').AsFloat, ffNumber, 10, 2);
         pplintfin.Caption := FloatToStrF(DM1.cdsQry22.FieldByName('INTCAPACU').AsFloat, ffNumber, 10, 2);
         pplbonfin.Caption := FloatToStrF(DM1.cdsQry22.FieldByName('BONOS').AsFloat, ffNumber, 10, 2);
         pplsalfin.Caption := FloatToStrF(DM1.cdsQry22.FieldByName('ACUMULADO').AsFloat, ffNumber, 10, 2);
         xtotal_pie := DM1.cdsQry22.FieldByName('ACUMESANT').AsFloat + DM1.cdsQry22.FieldByName('CAPITAL').AsFloat + DM1.cdsQry22.FieldByName('INTCAPACU').AsFloat + DM1.cdsQry22.FieldByName('BONOS').AsFloat;
         ultimoDiaSaldo:= DaysInAMonth(ultimoAnhoSaldo,ultimoMesSaldo);
         pplsaldoal.Caption := 'SALDO A '+Copy(DM1.NombreMes(DM1.StrZero(IntToStr(ultimoMesSaldo),2)),1,3)+'-'+IntToStr(ultimoAnhoSaldo)+' S/ '+FloatToStrF(xtotal_pie, ffNumber, 10, 2);
         ppltotsalpenpagest.Caption := 'Total aportes pendientes de pago S/ '+FloatToStrF(xmonpen,ffNumber,10,2);
         pplFechaImp.Caption := 'Fecha de Impresión : '+DateToStr(Date);

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
         Image := TImage.Create(Nil);
         Image.Width := Chart1.Width;
         Image.Height := Chart1.Height;
         // configura os valores específicos
         Chart1.Draw(Image1.Canvas, Image.BoundsRect);
         Jpeg := TJpegImage.Create;
         Jpeg.Assign(Image1.Picture.Bitmap);
         ppImage3.Picture.Bitmap := image1.Picture.Bitmap;

         // Se modifico el nombre del reporte estadistico cuenta individual con formato
         // pprresest.Print;
         // pprresest.Stop;
         pprresestconfor.Print;
         pprresestconfor.Stop;
      End;
      // Fin: HPC_201706_PRE
   End;

   If rgtiprep.ItemIndex = 1 Then
   Begin
      If xanomesces < '199701' Then
      Begin
         pplblmonben_b.Caption := FormatFloat('###,###.00', DM1.calculamontodecese(DM1.asofresnom, DM1.asofrescese, DM1.tipben));
         pplbluser_b.Caption := 'Impreso por   : ' + DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
         pplblasocodmod_b.Caption := DM1.cdsAsociado.FieldByName('ASOCODMOD').AsString;
         pplblasoapenomdni_b.Caption := DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString;
         pplblasoresnom_b.Caption := DM1.asoresnom;
         pplblasoresces_b.Caption := DM1.asorescese;
         pplblasofresnom_b.Caption := DM1.asofresnom;
         pplblasofresces_b.Caption := DM1.asofrescese;

         xSql := 'SELECT REGPENDES FROM APO105 WHERE REGPENID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('REGPENID').AsString);
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         pplblregpen_b.Caption := DM1.cdsQry.FieldByName('REGPENDES').AsString;
         xSql := 'SELECT USENOM FROM APO101 WHERE USEID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('USEID').AsString)
            + ' AND UPAGOID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString) + ' AND UPROID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         pplblusenom_b.Caption := Copy(DM1.cdsQry.FieldByName('USENOM').AsString, 1, 29);
         xSql := 'SELECT UPAGONOM FROM APO103 WHERE UPAGOID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString) + ' AND UPROID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         pplblupagonom_b.Caption := Copy(DM1.cdsQry.FieldByName('UPAGONOM').AsString, 1, 29);
         xSql := 'SELECT UPRONOM FROM APO102 WHERE UPROID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         pplblupronom_b.Caption := Copy(DM1.cdsQry.FieldByName('UPRONOM').AsString, 1, 29);
         pplbltitulo_b.Caption := 'ESTADO DE APORTES RECAUDADOS AL ' + DM1.asofrescese;
         pprantes1997.Print;
         Exit;
      End;
      xSql := 'SELECT A.TRANSANO, A.TRANSMES, A.TRANSANO||''-''||A.TRANSMES APOSEC, A.TRANSMTO, C.USENOM FROM APO301 A, APO201 B, APO101 C'
         + ' WHERE A.ASOID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString) + ' AND A.APOSEC > ' + QuotedStr(xanomesces)
         + ' AND A.APOSEC <= ' + QuotedStr(xanomesultapo)
         + ' AND A.ASOID = B.ASOID AND B.USEID = C.USEID AND B.UPAGOID = C.UPAGOID AND B.UPROID = C.UPROID ORDER BY APOSEC';
      DM1.cdsQry25.Close;
      DM1.cdsQry25.DataRequest(xSql);
      DM1.cdsQry25.Open;
      pplbltitulo_a.Caption := 'ESTADO DE APORTES RECAUDADOS AL ' + DateToStr(DM1.FechaSys);
      pplblmonben_a.Caption := FormatFloat('###,###.00', DM1.calculamontodecese(xasofresnom, xasofrescese, DM1.tipben));
      pplblregpen_a.Caption := DM1.DevuelveValor('APO105', 'REGPENDES', 'REGPENID', DM1.cdsAsociado.FieldByName('REGPENID').AsString);
      pplasocodmod_a.Caption := DM1.cdsAsociado.FieldByName('ASOCODMOD').AsString;
      pplasoapenomdni_a.Caption := DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString;
      xSql := 'SELECT USENOM FROM APO101 WHERE USEID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('USEID').AsString)
         + ' AND UPAGOID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString) + ' AND UPROID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      pplblusenom_a.Caption := Copy(DM1.cdsQry.FieldByName('USENOM').AsString, 1, 29);
      xSql := 'SELECT UPAGONOM FROM APO103 WHERE UPAGOID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString) + ' AND UPROID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      pplblupagonom_a.Caption := Copy(DM1.cdsQry.FieldByName('UPAGONOM').AsString, 1, 29);
      xSql := 'SELECT UPRONOM FROM APO102 WHERE UPROID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      pplblupronom_a.Caption := Copy(DM1.cdsQry.FieldByName('UPRONOM').AsString, 1, 29);
      pplblasoresnom_a.Caption := DM1.asoresnom;
      pplblasoresces_a.Caption := DM1.asorescese;
      pplblasofresnom_a.Caption := DM1.asofresnom;
      pplblasofresces_a.Caption := DM1.asofrescese;
      pplblasoapenomdni.Caption := DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString;
      pplbluser_a.Caption := 'Impreso por   : ' + DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
      ppLabel162.Caption := 'Impreso por   : ' + DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
      ppraportes.Print;
   End;

End;

// Inicio: HPC_201706_PRE
// Se modifica procedimiento que muestra la descripción en el detalle
// de los reportes estadisticos de cuenta individual
Procedure TFnuerepcueind.pplanomesPrint(Sender: TObject);
Var
   xMes: String;
Begin
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

End;
// Fin: HPC_201706_PRE

procedure TFnuerepcueind.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  DM1.cdsCuentas.Close;
  DM1.cdsCuentas.Filter:='';
  DM1.cdsCuentas.IndexFieldNames:='';

  DM1.cdsQry.Close;
  DM1.cdsQry.Filter:='';
  DM1.cdsQry.IndexFieldNames:='';

  DM1.cdsQry19.Close;
  DM1.cdsQry19.Filter:='';
  DM1.cdsQry19.IndexFieldNames:='';

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

  DM1.cdsQry25.Close;
  DM1.cdsQry25.Filter:='';
  DM1.cdsQry25.IndexFieldNames:='';

  Action := caFree;
end;

procedure TFnuerepcueind.ppDBText8Print(Sender: TObject);
begin
If Trim(ppDBText10.Text) = '' Then
Begin
   ppDBText8.Width := 60;
   ppDBText8.Font.Style := [fsbold];
End
Else
Begin
   ppDBText8.Width := 9.525;
   ppDBText8.Font.Style := [];
End;
end;

End.


