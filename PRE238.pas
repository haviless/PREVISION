// Inicio Uso Estándares: 01/08/2011
// Unidad : PRE238 (REPORTE POR TIPO DE BENEFICIO)
// Formulario : Frepxtipben
// Fecha de Creación : 15/12/2003
// Autor : Area de desarrollo de Sistemas
// Objetivo : REPORTE POR TIPO DE BENEFICIO
// Actualizaciones:
// HPC_200312_PRE 15/12/2003 (Creación del programa)
// HPC_201112_PRE 28/09/2011 (Se añade a nivel de exportable a excel los campos ASODNI, ASOFRESNOM, ASOFRESCESE)
// HPP_201108_PRE, se pasa a producción a partir del pase HPC_201112_PRE el 28/11/2011
// HPC_201304_PRE : Se modifica el procedimiento de exportar a Excel.
// SPP_201305_PRE : Se realiza el pase a producción a partir del HPC_201304_PRE
// HPC_201306_PRE : Se añade filtro por usuario
// SPP_201307_PRE : Se realiza el pase a producción a partir del HPC_201306_PRE.
// HPC_201307_PRE : Se añade nuevo logo institucional en los reportes
// SPP_201401_PRE : Se realiza el pase a producción a partir del pase HPC_201307_PRE
// HPC_201402_PRE : Se añade campo en reporte campo "autorización de descuento de aporte".
// SPP_201403_PRE : Se realiza el pase a producción a partir del pase HPC_201402_PRE.
// HPC_201508_PRE : Se modifica reporte. Se desagrega el monto de ajuste en desc. x credito, niv. de aporte, dev. aporte
//                  Otros descuentos
// HPC_201607_PRE : Se modifica el reporte. Se añaden los campos departamento de origen del expediente, oficina de origen del expediente (DEPORIEXP, OFIORIEXP)
// HPC_201610_PRE : CREAR Y MODIFICAR INDICADORES DE CALIDAD
// HPC_201701_PRE : Se agregaron los campos OFIORI,SEGUIMIENTO,OBSERVACIONES
// HPC_201705_PRE : Se añade sub-reporte de liquidaciones anuladas
// HPC_201802_PRE : Se añaden filtro por origen de la solicitud y nuevos campos en el reporte (origen de solicitud, monto x pagar)


unit PRE238;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, wwdblook, wwdbdatetimepicker, Mask, ExtCtrls,
  Grids, Wwdbigrd, Wwdbgrid, ppProd, ppClass, ppReport, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE, ppBands, ppCache, DB, DBClient, ppCtrls, ppVar,
  // INICIO HPC_201610_PRE
  // DECLARACION DE COMPONENTES
  // Inicio: HPC_201705_PRE
  // Se añade el componente "ppStrtch" 
  // ppPrnabl, DBGrids, ppParameter, jpeg, Wwdatsrc, wwclient; // SPP_201401_PRE
  ppPrnabl, DBGrids, ppParameter, jpeg, Wwdatsrc, wwclient, ppStrtch,
  ppSubRpt; // SPP_201401_PRE
  // Fin: HPC_201705_PRE
  // FIN HPC_201610_PRE
type
  TFrepxtipben = class(TForm)
    GroupBox1: TGroupBox;
    // Inicio: SPP_201307_PRE
    // dbdtpinicial: TwwDBDateTimePicker; 
    // dbdtpfinal: TwwDBDateTimePicker;   
    dblctipben: TwwDBLookupCombo;
    // Label1: TLabel; 
    // Label2: TLabel; 
    // Fin: SPP_201307_PRE
    Label3: TLabel;
    pnltipbenef: TPanel;
    metipbenef: TMaskEdit;
    btnimprimir: TBitBtn;
    // Inicio: HPC_201705_PRE
    // Se modifica boton para exportar a excel
    // btnaexcel: TBitBtn;
    btnTipBen: TBitBtn;
    // Fin: HPC_201705_PRE
    btncerrar: TBitBtn;
    bdeprepxtipben: TppBDEPipeline;
    btnImprimePrevio: TBitBtn;
    Label4: TLabel;
    dblcdptoid: TwwDBLookupCombo;
    pnldesdpto: TPanel;
    medesdpto: TMaskEdit;
    dbgliqben: TwwDBGrid;
    cdsbeneficios: TClientDataSet;
    dsbeneficios: TDataSource;
    pprtodos: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
//Inicio: SPP_201401_PRE
    // ppLabel18: TppLabel; 
    // ppLabel19: TppLabel; 
//Fin: SPP_201401_PRE
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppltittod01: TppLabel;
    ppltittod02: TppLabel;
    pplfecben: TppLabel;
    pplpvslbennr: TppLabel;
    ppDBText1: TppDBText;
    // Inicio: HPC_201508_PRE
    // ppDBText2: TppDBText;  
    // Fin: HPC_201508_PRE
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    // Inicio: HPC_201705_PRE
    // Se retira caja de texto del reporte de liquidaciones anuladas.
    // ppDBText7: TppDBText;
    // Fin: HPC_201705_PRE
    ppDBText8: TppDBText;
    // Inicio: HPC_201508_PRE
    // ppDBText9: TppDBText;
    // Fin: HPC_201508_PRE
    ppDBCalc1: TppDBCalc;
    // Inicio: HPC_201508_PRE    
    // ppDBCalc2: TppDBCalc;
    // Fin: HPC_201508_PRE
    ppSummaryBand1: TppSummaryBand;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppDBCalc3: TppDBCalc;
    pplimpresopor02: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppShape4: TppShape;
    ppLine3: TppLine;
    ppShape13: TppShape;
    ppShape14: TppShape;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    pplcanrettod: TppLabel;
    pplcanfaltod: TppLabel;
    pplcaninvtod: TppLabel;
    pplmonrettod: TppLabel;
    pplmonfaltod: TppLabel;
    pplmoninvtod: TppLabel;
    ppLabel33: TppLabel;
    ppShape15: TppShape;
    pplcantottod: TppLabel;
    pplmontottod: TppLabel;
    pprtipbenres: TppReport;
    ppbdetipben: TppBDEPipeline;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    rgtipben: TRadioGroup;
    cdsresumen: TClientDataSet;
    dsresumen: TDataSource;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLine4: TppLine;
    ppLabel44: TppLabel;
    ppLine5: TppLine;
    pplimpresopor03: TppLabel;
    ppSummaryBand2: TppSummaryBand;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppShape17: TppShape;
    ppShape18: TppShape;
    ppShape16: TppShape;
    ppShape19: TppShape;
    ppShape20: TppShape;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppShape21: TppShape;
    ppShape22: TppShape;
    ppShape23: TppShape;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppShape24: TppShape;
    ppShape25: TppShape;
    ppShape26: TppShape;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppShape27: TppShape;
    ppShape28: TppShape;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    bdeprepxtipbendpto: TppBDEPipeline;
    pprrpxtipbendpto: TppReport;
    ppParameterList1: TppParameterList;
    ppHeaderBand3: TppHeaderBand;
    // Inicio: HPC_201508_PRE
    // ppShape29: TppShape;
    // ppShape30: TppShape;
    // ppShape31: TppShape;
    // ppShape32: TppShape;
    // ppShape33: TppShape;
    // ppShape34: TppShape;
    // ppShape35: TppShape;
    // ppShape36: TppShape;
    // ppShape37: TppShape;
    // ppShape38: TppShape;
    // ppShape39: TppShape;
    // ppLabel59: TppLabel;
    // ppLabel60: TppLabel;
    // ppLabel61: TppLabel;
    // ppLabel62: TppLabel;
    // ppLabel63: TppLabel;
    // ppLabel64: TppLabel;
    // ppLabel65: TppLabel;
    // ppLabel66: TppLabel;
    // ppLabel67: TppLabel;
    // ppLabel68: TppLabel;
    // ppLabel69: TppLabel;
    // ppLabel70: TppLabel;
    // ppLabel71: TppLabel;
    // ppLabel72: TppLabel;
    // ppLabel73: TppLabel;
    // ppLabel74: TppLabel;
    // ppLabel75: TppLabel;
    // ppLabel76: TppLabel;
    // Fin: HPC_201508_PRE
    ppLabel79: TppLabel;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    ppSystemVariable9: TppSystemVariable;
    ppltitdpt01: TppLabel;
    ppltitdpt02: TppLabel;
    ppDetailBand3: TppDetailBand;

    // Inicio: HPC_201508_PRE
    // pplfecbe: TppLabel;
    // pplnumliq: TppLabel;
    // ppDBText21: TppDBText;
    // ppDBText22: TppDBText;
    // ppDBText23: TppDBText;
    // ppDBText24: TppDBText;
    // ppDBText25: TppDBText;
    // ppDBText26: TppDBText;
    // ppDBText27: TppDBText;
    // ppDBText28: TppDBText;
    // ppDBText29: TppDBText;
    // Fin: HPC_201508_PRE

    ppSummaryBand3: TppSummaryBand;
    ppShape40: TppShape;
    ppShape41: TppShape;
    // Inicio: HPC_201508_PRE
    // ppDBCalc15: TppDBCalc;
    // ppDBCalc16: TppDBCalc;
    // Fin: HPC_201508_PRE
    ppLine8: TppLine;
    ppLine9: TppLine;
    // Inicio: HPC_201508_PRE
    // ppDBCalc17: TppDBCalc;
    // Fin: HPC_201508_PRE
    pplimpresopor01: TppLabel;
    // Inicio: HPC_201508_PRE
    // ppLabel87: TppLabel;
    // Fin: HPC_201508_PRE
    ppLabel88: TppLabel;
    ppLabel90: TppLabel;
    ppLabel91: TppLabel;
    ppLabel92: TppLabel;
    ppLabel93: TppLabel;
    ppLine10: TppLine;
    ppShape42: TppShape;
    ppShape43: TppShape;
    ppLabel94: TppLabel;
    ppLabel95: TppLabel;
    ppLabel96: TppLabel;
    pplcanretdpt: TppLabel;
    pplcanfaldpt: TppLabel;
    pplcaninvdpt: TppLabel;
    pplmonretdpt: TppLabel;
    pplmonfaldpt: TppLabel;
    pplmoninvdpt: TppLabel;
    ppLabel103: TppLabel;
    pplcantotdpt: TppLabel;
    pplmontotdpt: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLabel97: TppLabel;
    ppLabel98: TppLabel;
    // Inicio: HPC_201508_PRE
    // ppLabel99: TppLabel;
    // ppLabel100: TppLabel;
    // ppShape44: TppShape;
    // ppLabel101: TppLabel;
    // ppLabel102: TppLabel;
    // ppShape45: TppShape;
    // ppLabel104: TppLabel;
    // ppLabel105: TppLabel;
    // Fin: HPC_201508_PRE
    ppShape1: TppShape;
    // Inicio: HPC_201508_PRE
    // ppShape2: TppShape;
    // Fin: HPC_201508_PRE
    ppShape3: TppShape;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppShape8: TppShape;
    ppShape9: TppShape;
    ppShape10: TppShape;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    // Inicio: HPC_2015_08_PRE
    // ppLabel13: TppLabel;
    // Fin: HPC_2015_08_PRE
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppShape11: TppShape;
    ppShape12: TppShape;
    ppLabel17: TppLabel;
    ppLabel23: TppLabel;
    ppLabel106: TppLabel;
    ppLabel107: TppLabel;
    ppShape46: TppShape;
    ppLabel108: TppLabel;
    ppLabel109: TppLabel;
    ppShape47: TppShape;
    ppLabel110: TppLabel;
    ppLabel111: TppLabel;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppLabel113: TppLabel;
//Inicio: SPP_201401_PRE
    // ppLabel114: TppLabel; 
    ppLabel115: TppLabel;
    ppLabel116: TppLabel;
    ppLabel117: TppLabel;
    // ppImage4: TppImage; 
    ppLabel118: TppLabel;
    ppLabel119: TppLabel;
    ppLabel120: TppLabel;  // SPP_201403_PRE
    ppImage1: TppImage; 
    ppImage2: TppImage; 
    // ppLabel123: TppLabel; 
    // ppImage1: TppImage; 
    // ppLabel34: TppLabel; 
    // ppLabel35: TppLabel; 
    // ppLabel77: TppLabel; 
    // ppImage2: TppImage; 
//Fin: SPP_201401_PRE
   //Inicio: HPC_201508_PRE
   // ppDBText32: TppDBText;
   // ppDBText33: TppDBText;
   //Fin: HPC_201508_PRE
    // Inicio: HPC_201709_PRE
    // Se retira el GRID
    // DBGrid: TDBGrid;
    // Inicio: HPC_201709_PRE

    // Inicio: SPP_201307_PRE


    gbFecha: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dbdtpinicial: TwwDBDateTimePicker;
    dbdtpfinal: TwwDBDateTimePicker;
    Label5: TLabel;
    dblcdusuario: TwwDBLookupCombo;
    pnlUsuario: TPanel;
    medesusuario: TMaskEdit;
    pplUsuario: TppLabel;
    pplUsuarioxDpto: TppLabel;
    ppImage3: TppImage; //  SPP_201401_PRE
    pplUsuarioTodos: TppLabel;
    // Inicio: HPC_201508_PRE
    ppDBText2: TppDBText;
    ppDBText19: TppDBText;
    ppShape48: TppShape;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppShape49: TppShape;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppShape50: TppShape;
    ppLabel45: TppLabel;
    ppLabel57: TppLabel;
    ppDBText20: TppDBText;
    ppDBText34: TppDBText;
    ppDBCalc2: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    pplfecbe: TppLabel;
    pplnumliq: TppLabel;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    // Inicio: HPC_201705_PRE
    // Se retira caja de texto del reporte de liquidaciones anuladas.
    // ppDBText26: TppDBText;
    // Fin: HPC_201705_PRE
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBCalc15: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppLabel87: TppLabel;
    ppLabel122: TppLabel;
    ppDBCalc17: TppDBCalc;
    ppDBCalc18: TppDBCalc;
    ppDBCalc19: TppDBCalc;
    ppDBCalc20: TppDBCalc;
    // Inicio: HPC_201705_PRE
    // Se retira caja de texto del reporte de liquidaciones anuladas.
    // ppShape2: TppShape;
    // ppLabel13: TppLabel;
    // Fin: HPC_201705_PRE
    ppDBText9: TppDBText;
    ppShape29: TppShape;
    ppShape30: TppShape;
    ppShape31: TppShape;
    ppShape32: TppShape;
    ppShape33: TppShape;
    ppShape34: TppShape;
    ppShape35: TppShape;
    ppShape36: TppShape;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppShape37: TppShape;
    ppShape38: TppShape;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppShape39: TppShape;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppShape44: TppShape;
    ppLabel86: TppLabel;
    ppLabel89: TppLabel;
    ppShape45: TppShape;
    ppLabel99: TppLabel;
    ppLabel100: TppLabel;
    ppShape51: TppShape;
    ppLabel101: TppLabel;
    ppLabel102: TppLabel;
    ppShape52: TppShape;
    ppLabel104: TppLabel;
    ppLabel105: TppLabel;
    // Inicio: HPC_201705_PRE
    // Se retira caja de texto del reporte de liquidaciones anuladas.
    // ppShape53: TppShape;
    // ppLabel112: TppLabel;
    // Fin: HPC_201705_PRE
    ppDBText27: TppDBText;
    ppLabel114: TppLabel;
    ppLabel121: TppLabel;
    ppLabel123: TppLabel;
    // INICIO HPC_201610_PRE
    // DECLARACION DE VARIABLES
    Label6: TLabel;
    cbOficina: TwwDBLookupCombo;
    Panel1: TPanel;
    edtOficina: TMaskEdit;
    // Inicio: HPC_201705_PRE
    // Se añaden caja de texto para la creación del sub-reporte
    // de resumen de liquidaciones anuladas y extornadas.
    ppBDEPAnulados: TppBDEPipeline;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand4: TppDetailBand;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppSummaryBand4: TppSummaryBand;
    ppShape54: TppShape;
    ppShape55: TppShape;
    ppLabel124: TppLabel;
    ppShape56: TppShape;
    ppShape57: TppShape;
    ppLabel125: TppLabel;
    ppLabel126: TppLabel;
    ppLabel127: TppLabel;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLabel128: TppLabel;
    ppLine14: TppLine;
    ppDBCalc21: TppDBCalc;
    ppDBCalc22: TppDBCalc;
    ppShape2: TppShape;
    ppLabel13: TppLabel;
    ppLabel129: TppLabel;
    ppDBText7: TppDBText;
    ppDBCalc23: TppDBCalc;
    ppShape53: TppShape;
    ppLabel112: TppLabel;
    ppLabel130: TppLabel;
    ppDBText26: TppDBText;
    ppDBCalc24: TppDBCalc;
    ppShape58: TppShape;
    ppLabel131: TppLabel;
    ppShape59: TppShape;
    ppShape60: TppShape;
    ppLabel132: TppLabel;
    ppLabel133: TppLabel;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppDBCalc25: TppDBCalc;
    ppDBCalc26: TppDBCalc;
    btnAnulado: TBitBtn;
    cdsAnulados: TClientDataSet;
    dsAnulados: TDataSource;
    gbanulados: TGroupBox;
    dbganulados: TwwDBGrid;
    // Inicio: HPC_201709_PRE
    // Se añade grid para exportar a excel
    dbgAExcel: TDBGrid;
    // Inicio: HPC_201802_PRE
    // Nuevas variables para los reportes
    rgorisol: TRadioGroup;
    ppShape61: TppShape;
    ppLabel134: TppLabel;
    ppLabel135: TppLabel;
    ppDBText43: TppDBText;
    ppShape62: TppShape;
    ppLabel136: TppLabel;
    ppLabel137: TppLabel;
    ppDBText44: TppDBText;
    ppDBCalc27: TppDBCalc;
    ppDBCalc28: TppDBCalc;
    ppltiprep: TppLabel;
    ppLabel138: TppLabel;
    // Fin: HPC_201802_PRE
    // Fin: HPC_201709_PRE

    // Fin: HPC_201705_PRE
    // FIN HPC_201610_PRE
    // Fin: HPC_201508_PRE
    // Fin: SPP_201307_PRE
    procedure FormActivate(Sender: TObject);
    procedure dblctipbenChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btncerrarClick(Sender: TObject);
    procedure btnImprimePrevioClick(Sender: TObject);
    procedure dblcdptoidChange(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
    // Inicio: HPC_201705_PRE
    // Se modifica el nombre del procedimiento
    // procedure btnaexcelClick(Sender: TObject);
    procedure btnTipBenClick(Sender: TObject);
    // Fin: HPC_201705_PRE
    procedure rgtipbenClick(Sender: TObject);
    procedure ppDetailBand3BeforePrint(Sender: TObject);
    procedure dbdtpinicialChange(Sender: TObject);
    procedure dbdtpfinalChange(Sender: TObject);
    // Inicio: SPP_201307_PRE
    procedure dblcdusuarioExit(Sender: TObject);
    procedure pplUsuarioTodosPrint(Sender: TObject);  
    procedure pplUsuarioPrint(Sender: TObject);        
    procedure pplUsuarioxDptoPrint(Sender: TObject);
    // INICIO HPC_201610_PRE
    // DECLARACION DE PROCEDURES
    procedure dblcdusuarioChange(Sender: TObject);
    procedure cbOficinaChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    // Inicio: HPC_201705_PRE
    // Se añade procedimiento para el boton "btnAnulado"
    procedure btnAnuladoClick(Sender: TObject);
    // Inicio: HPC_201802_PRE
    // Nuevo procedimiento origen de solicitud  
    procedure rgorisolClick(Sender: TObject);
    // Fin: HPC_201802_PRE

    // Fin: HPC_201705_PRE

    // FIN HPC_201610_PRE
    // Fin: SPP_201307_PRE
  private
    // Inicio: HPC_201709_PRE
    // Se crean variables para ser usadas en los Qrys de grid y exportación a excel
    xSql, xSqlAExcel:String;
    // Fin: HPC_201709_PRE

    // Inicio: HPC_201508_PRE
    // monben, ajuben, imppag: Double;
    // Inicio: HPC_201705_PRE
    // Se añade variables para calcular monto de beneficios anulados "monbenanu".
    // monben, imppag, xndescre, xnnivapo, xndevapo, xnotrdes: Double;
    // Inicio: HPC_201802_PRE
    // Se añade nueva variable para el reporte
    // monben, imppag, xndescre, xnnivapo, xndevapo, xnotrdes, monbenanu: Double;
    monben, imppag, xndescre, xnnivapo, xndevapo, xnotrdes, monbenanu, impxpag: Double;
    // Fin: HPC_201802_PRE 
    // Fin: HPC_201705_PRE

    // Fin: HPC_201508_PRE
    canret, monret, canfal, monfal, caninv, moninv : Double;
    // INICIO HPC_201610_PRE
    // DECLARACION DE VARIABLES
    xxCdsQryOficina : TwwClientDataSet;
     xxDsQryOficina : TwwDataSource;
    // FIN HPC_201610_PRE
    procedure limpia;

   { Private declarations }
  public
    { Public declarations }
  end;

var
  Frepxtipben: TFrepxtipben;

implementation

uses PREDM;

{$R *.dfm}

procedure TFrepxtipben.FormActivate(Sender: TObject);
Var xSql:String;
begin
   // Inicio: HPC_201705_PRE
   // Se cierras los clientdataset
   // al momento de activar la forma principal
   DM1.cdsReporte.Close;
   DM1.cdsRepresentante.Close;
   // Fin: HPC_201705_PRE


  // INICIO HPC_201610_PRE
  // CARGA OPCIONES POR DEFECTO
  DM1.FG_CONECTA_CDS(xxCdsQryOficina, xxDsQryOficina);
  // Inicio: SPP_201307_PRE
  xSql :=
     ' SELECT ''00'' USERID, ''TODOS LOS USUARIOS'' USERNOM FROM DUAL '
   + ' UNION ALL '
   + ' SELECT USERID, USERNOM FROM TGE006 WHERE USERID IN (SELECT USUARIO FROM PVS306 GROUP BY USUARIO) ';
  DM1.cdsUsuarios.Close;
  DM1.cdsUsuarios.DataRequest(xSql);
  DM1.cdsUsuarios.Open;
  dblcdusuario.Selected.Clear;
  dblcdusuario.Selected.Add('USERID'#9'15'#9'Usuario'#9#9);
  dblcdusuario.Selected.Add('USERNOM'#9'25'#9'Nombre del Usuario'#9#9);
  dblcdusuario.LookupValue := DM1.cdsUsuarios.fieldbyname('USERID').AsString;
  dblcdusuarioExit(nil);
  // Fin: SPP_201307_PRE

  xSql :=
     ' SELECT ''00'' DPTOID, ''TODOS LOS DEPARTAMENTOS'' DPTODES FROM DUAL '
   + ' UNION ALL '
   + 'SELECT DPTOID, DPTODES FROM APO158';
  DM1.cdsDpto.Close;
  DM1.cdsDpto.DataRequest(xSql);
  DM1.cdsDpto.Open;
  dblcdptoid.Selected.Clear;
  dblcdptoid.Selected.Add('DPTOID'#9'2'#9'Código'#9#9);
  dblcdptoid.Selected.Add('DPTODES'#9'25'#9'Nombre del departamento'#9#9);
  dblcdptoid.LookupValue := DM1.cdsDpto.fieldbyname('DPTOID').AsString;
  dblcdptoidChange(nil);

  xSql :=
     ' SELECT ''00'' TIPBENEF, ''TODOS LOS BENEFICIOS'' BENEFDES FROM DUAL '
   + ' UNION ALL '
   + ' SELECT TIPBENEF, BENEFDES FROM TGE186 WHERE TIPBENEF IN (''01'',''02'',''03'')';
  DM1.cdsTipBenef.Close;
  DM1.cdsTipBenef.DataRequest(xSql);
  DM1.cdsTipBenef.Open;
  dblctipben.Selected.Clear;
  dblctipben.Selected.Add('TIPBENEF'#9'2'#9'Código'#9#9);
  dblctipben.Selected.Add('BENEFDES'#9'25'#9'Tipo de beneficio'#9#9);
  dblctipben.LookupValue := DM1.cdsTipBenef.fieldbyname('TIPBENEF').AsString;
  // FIN HPC_201610_PRE
  rgtipben.ItemIndex := 0;
  dbdtpinicial.Date := DM1.FechaSys;
  dbdtpfinal.Date   := DM1.FechaSys;
  dbdtpinicial.SetFocus;
end;

procedure TFrepxtipben.dblctipbenChange(Sender: TObject);
begin
  If dblctipben.Text = '' Then metipbenef.Text := '';
  If Length(dblctipben.Text) = 2 then
  Begin
    If DM1.cdsTipBenef.Locate('TIPBENEF', dblctipben.Text, []) Then
    Begin
      metipbenef.Text := DM1.cdsTipBenef.FieldByName('BENEFDES').AsString;
    End
    Else
    Begin
      MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
      dblctipben.Text := '';
      metipbenef.Text := '';
      dblctipben.SetFocus;
    End;
  End;
  limpia;
end;

procedure TFrepxtipben.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  begin
    Key := #0;
    Perform(CM_DIALOGKEY, VK_TAB, 0);
  end;
end;

procedure TFrepxtipben.btncerrarClick(Sender: TObject);
begin
  Frepxtipben.Close;
end;

procedure TFrepxtipben.btnImprimePrevioClick(Sender: TObject);
// Inicio: HPP_201108_PRE
// INICIO HPC_201610_PRE
// DECLARACION DE VARIABLES
// Inicio: HPC_201709_PRE
// Se retira variable no usada
// Var xSql(*, xWhere1*) :String;
// Fin: HPC_201709_PRE
    //xWhere2 :String; // SPP_201307_PRE
// FIN HPC_201610_PRE
// Fin: HPP_201108_PRE
// Inicio: HPC_201802_PRE
// Nueva variable si cobra el asociado
Var xcobraaso:String;
// Fin: HPC_201802_PRE

begin
  If Trim(dbdtpInicial.Text) = '' Then
  Begin
    MessageDlg('Ingrese la fecha inicial', mtInformation, [mbOk], 0);
    dbdtpInicial.SetFocus;
    Exit;
  End;
  If Trim(dbdtpFinal.Text) = '' Then
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

  If rgtipben.ItemIndex = -1 Then
  Begin
    MessageDlg('Seleccione el tipo de reporte', mtInformation, [mbOk], 0);
    dbdtpInicial.SetFocus;
    Exit;
  End;
  // INICIO HPC_201610_PRE
  // VALIDA PARAMETROS INGRESADOS
  IF (dblctipben.Enabled = True ) and (trim(dblctipben.Text) = '') then begin
    MessageDlg('SELECCIONE EL TIPO DE BENEFICIO', mtInformation, [mbOk], 0);
    dblctipben.SetFocus;
    Exit;
  end;

  IF (dblcdptoid.Enabled = True ) and (trim(dblcdptoid.Text) = '') then begin
    MessageDlg('SELECCIONE EL TIPO DEPARTAMENTO', mtInformation, [mbOk], 0);
    dblcdptoid.SetFocus;
    Exit;
  end;

  IF (cbOficina.Enabled = True ) and (trim(cbOficina.Text) = '') then begin
    MessageDlg('SELECCIONE LA OFICINA', mtInformation, [mbOk], 0);
    cbOficina.SetFocus;
    Exit;
  end;

  IF trim(dblcdusuario.Text) = '' then begin
    MessageDlg('SELECCIONE EL USUARIO', mtInformation, [mbOk], 0);
    dblcdusuario.SetFocus;
    Exit;
  end;
  // FIN HPC_201610_PRE
  // Inicio: HPC_201705_PRE
  // Se retira diseño de cursor "HourGlass".
  // Screen.Cursor := crHourGlass;
  // Fin: HPC_201705_PRE

  // INICIO HPC_201610_PRE
  // MEJORA LA CONSULTA PARA QUE ACEPTE PARAMETROS OPCIONALES
  // Inicio: HPP_201108_PRE
  //xWhere1 := '';
  // Inicio: SPP_201307_PRE (Usuarios)
  //xWhere2 := '';
  //If Trim(dblcdusuario.Text) <> '' Then
  //   xWhere2 := ' AND A.USUARIO = '+QuotedStr(dblcdusuario.Text);
  // Fin: SPP_201307_PRE
  // FIN HPC_201610_PRE
  If rgtipben.ItemIndex = 0 Then
  Begin
     // Inicio: HPC_201705_PRE
     // Se Añade diseño de cursor "HourGlass".
     Screen.Cursor := crHourGlass;
     // Fin: HPC_201705_PRE
     // INICIO HPC_201610_PRE
     // MEJORA LA CONSULTA PARA QUE ACEPTE PARAMETROS OPCIONALES
     (*
     //Todos los beneficios un departamento
    If (dblctipben.Text = '') And (dblcdptoid.Text <> '') Then
       // Inicio: HPC_201607_PRE --Se añade campos de Departamento / Oicina de origen en la glosa Obervación
       // xWhere1 := ' AND SUBSTR(B.DISORIEXP,1,2) = '+QuotedStr(dblcdptoid.Text);
       xWhere1 := ' AND B.DEPORIEXP = '+QuotedStr(dblcdptoid.Text);
       // Fin: HPC_201607_PRE
    //selecciona un departamento, un tipo de beneficio
    If (dblctipben.Text <> '') And (dblcdptoid.Text <> '') Then
       xWhere1 := ' AND A.PVSLTIPBE = '+QuotedStr(dblctipben.Text)+' AND SUBSTR(B.DISORIEXP,1,2) = '+QuotedStr(dblcdptoid.Text);
    //Todos los departamentos un beneficio
    If (dblcdptoid.Text = '') And (dblctipben.Text <> '') Then
       xWhere1 := ' AND A.PVSLTIPBE = '+QuotedStr(dblctipben.Text);
    *)
    xSql :=
    // Inicio : HPC_201802_PRE
    // Se añade campo de desembolso
    // ' SELECT A.ASOID, A.PVSESTLIQ, A.PVSLTIPBE, A.PVSLFECBE, A.PVSLBENNR,'
    ' SELECT A.ASOID, A.PVSESTLIQ, CASE WHEN A.FORSOLBEN = ''S'' THEN ''SOLICITUD DEL BENEFICIARIO'' ELSE ''OFICIO INTERNO'' END FORSOLBEN, A.PVSLTIPBE, A.PVSLFECBE, A.PVSLBENNR, A.FLADES,'
    +' CASE WHEN A.FORSOLBEN = ''O'' AND A.FLADES IS NULL THEN NVL(A.MONLIQBEN,0)+NVL(A.MONDEV,0)-NVL(A.MONDES,0) ELSE 0 END MONXPAG,'
    +' CASE WHEN ((A.FORSOLBEN = ''O'' AND A.FLADES IS NOT NULL) OR (A.FORSOLBEN = ''S'')) THEN NVL(A.MONLIQBEN,0)+NVL(A.MONDEV,0)-NVL(A.MONDES,0) ELSE 0 END MONPAG'
    // Fin: HPC_201802_PRE
    + '       ,E.PVSESTDES, A.ASODNI, SUBSTR(A.ASOAPENOMDNI,1,30) ASOAPENOMDNI '
    + '       ,A.ASOFRESNOM, A.ASOFRESCESE, SUBSTR(C.BENEFABR,1,13) BENEFDES '
    + '       ,D.DPTODES, A.USUARIO, A.AUTDESAPO '
    + '       ,(SELECT SUM(NVL(PVSLMONTO,0)) FROM PVS307 WHERE PVSLBENNR = A.PVSLBENNR AND PVSLAGRID = ''DET'' AND TIPDES <> ''TC'') MONBEN '
    // Inicio: HPC_201705_PRE
    // Se añade columna que calcula el monto anulado de beneficio
    + '       ,(SELECT SUM(NVL(PVSLMONTO,0)) FROM PVS307 WHERE PVSLBENNR = A.PVSLBENNR AND PVSLAGRID = ''DET'' AND TIPDES <> ''TC'' AND A.PVSESTLIQ IN (''04'',''13'')) MONBENANU '
    // Fin: HPC_201705_PRE
    + '       ,(SELECT SUM(NVL(PVSLMONTO,0)) FROM PVS307 WHERE PVSLBENNR =  A.PVSLBENNR AND PVSLAGRID =  ''DEV'') DEVAPO '
    + '       ,(SELECT SUM(NVL(PVSLMONTO,0)) FROM PVS307 WHERE PVSLBENNR = A.PVSLBENNR AND PVSLAGRID = ''DSC'' AND TIPDES = ''C'') DESCRE '
    + '       ,(SELECT SUM(NVL(PVSLMONTO,0)) FROM PVS307 WHERE PVSLBENNR = A.PVSLBENNR AND PVSLAGRID = ''DSC'' AND TIPDES = ''A'') NIVAPO '
    + '       ,(SELECT SUM(NVL(PVSLMONTO,0)) FROM PVS307 WHERE PVSLBENNR = A.PVSLBENNR AND PVSLAGRID = ''DSC'' AND (TIPDES In (''CI'',''F'') Or TIPDES Is Null)) OTRDES '
    // Inicio: HPC_201802
    // Se retira campo de monto de la liquidacion
    // + '    ,(SELECT SUM(NVL(PVSLMONTO,0)) FROM PVS307 WHERE PVSLBENNR = A.PVSLBENNR AND PVSLAGRID IN (''FPG'', ''RET'') AND FLGVOUCHER = ''N'') MONPAG '
    // Fin: HPC_201802
    //INICIO HPC_201701_PRE
    //Adicion de los campos Oficina de origen, seguimiento expediente, observaciones expediente
    + '       ,(SELECT OFDESNOM FROM apo110 WHERE OFDESID = B.OFIORIEXP) OFIORI '
    + '       ,(SELECT CASE WHEN (CODESTEXP = ''03'' AND CODSITEXP = ''01'') THEN ''EN TRAMITE/OBSERVADO FALTA REQUISITOS'' ELSE '''' END CASE FROM PVSSEGEXPDET '
    + '         WHERE ASOID = B.ASOID  AND NUMEXP = B.PVSEXPNRO AND CODESTEXP=''03'' AND CODSITEXP=''01'' AND ROWNUM =1) SEGUIMIENTO '
    + '       ,(SELECT RTRIM(XMLAGG(XMLELEMENT(F, UPPER(F.COMOBS) || '' - '') ORDER BY F.COMOBS).EXTRACT(''//text()''),'' - '') FROM PVSSEGEXPDET F '
    + '         WHERE F.ASOID=B.ASOID AND F.NUMEXP= B.PVSEXPNRO AND F.CODESTEXP =''03'' AND F.CODSITEXP=''01'' GROUP BY F.ASOID,F.NUMEXP) OBSERVACION '
    //FIN HPC_201701_PRE
    + '  FROM PVS306 A, PVS301 B, TGE186 C, APO158 D '
    + '       ,(SELECT PVSESTDSG, PVSESTDES FROM PVS102 WHERE PVSDOC = ''L'') E '
    + ' WHERE TO_DATE(A.PVSLFECBE) >= '+QuotedStr(dbdtpinicial.Text)
    + '   AND TO_DATE(A.PVSLFECBE) <= '+QuotedStr(dbdtpfinal.Text)
    + '   AND NVL(A.USUARIO,''XX'')   = NVL((CASE WHEN ' + QuotedStr(dblcdusuario.Text) + '= ''00'' THEN A.USUARIO ELSE ' + QuotedStr(dblcdusuario.Text) + ' END),''XX'') '
    + '   AND NVL(A.PVSLTIPBE,''XX'') = NVL((CASE WHEN ' + QuotedStr(dblctipben.Text)   + '= ''00'' THEN A.PVSLTIPBE ELSE ' + QuotedStr(dblctipben.Text) + ' END),''XX'') '
    + '   AND NVL(B.DEPORIEXP,''XX'') = NVL((CASE WHEN ' + QuotedStr(dblcdptoid.Text)   + '= ''00'' THEN B.DEPORIEXP ELSE ' + QuotedStr(dblcdptoid.Text) + ' END),''XX'') '
    + '   AND NVL(B.OFIORIEXP,''XX'') = NVL((CASE WHEN ' + QuotedStr(cbOficina.Text)    + '= ''00'' THEN B.OFIORIEXP ELSE ' + QuotedStr(cbOficina.Text)  + ' END),''XX'') '
    + '   AND A.ASOID = B.ASOID(+) '
    + '   AND A.PVSLBENNR = B.PVSLBENNR(+) '
    + '   AND A.PVSLTIPBE = C.TIPBENEF(+) '
    + '   AND A.PVSESTLIQ = E.PVSESTDSG '
    // Inicio: HPC_201802_PRE
    // Se añade filtro de la forma de la solicitud
    + '   AND SUBSTR(B.DISORIEXP, 1,2) = D.DPTOID(+)';
    If rgorisol.ItemIndex = 0 Then
       xSql := xSql + ' AND A.FORSOLBEN = ''S''';
    If rgorisol.ItemIndex = 1 Then
       xSql := xSql + ' AND A.FORSOLBEN = ''O''';
    xSql := xSql + ' ORDER BY A.PVSLBENNR, D.DPTODES, A.PVSLTIPBE, A.PVSLFECBE';
    // Fin: HPC_201802_PRE
    // FIN HPC_201610_PRE
    // Fin: HPC_201508_PRE
    // Inicio: HPC_201709_PRE
    // Se carga variable para exportar a excel
    xSqlAExcel := xSql;
   // Fin: HPC_201709_PRE
    DM1.cdsReporte.Close;
    DM1.cdsReporte.DataRequest(xSql);
    DM1.cdsReporte.Open;
    // Inicio: HPC_201508_PRE
    Screen.Cursor := crDefault;
    // Fin: HPC_201508_PRE
    // Inicio: SPP_201307_PRE
    If DM1.cdsReporte.RecordCount = 0 Then
    Begin
       MessageDlg('No existe información para mostrar', mtInformation, [mbOk], 0);
       limpia;
       btnimprimir.Enabled := False;
       // Inicio: HPC_201705_PRE
       // Se añade boton para exportar a excel los anulados
       // btnaexcel.Enabled   := False;
       btnTipBen.Enabled  := False;
       // Fin: HPC_201705_PRE
       Exit;
    End;
    btnimprimir.Enabled := True;
    // Inicio: HPC_201705_PRE
    // Se añade boton para exportar a excel los anulados
    // btnaexcel.Enabled   := True;
    btnTipBen.Enabled  := True;
    // Fin: HPC_201705_PRE
    // Fin: SPP_201307_PRE
    DM1.cdsReporte.First;
    cdsbeneficios.EmptyDataSet;
    canret := 0; monret := 0; caninv := 0; moninv := 0;
    // Inicio: HPC_201508_PRE
    // monben := 0; ajuben := 0; imppag := 0; canfal := 0; monfal := 0;
    // Inicio: HPC_201705_PRE
    // Se inicializa variables para almacenar el monto de liquidaciones anuladas
    // monben := 0; imppag := 0; canfal := 0; monfal := 0;
    monbenanu := 0; monben := 0; imppag := 0; canfal := 0; monfal := 0;
    // Inicio: HPC_201802_PRE
    // Se añade variable de importe x pagar
    impxpag := 0;
    // Fin: HPC_201802_PRE

    // Fin: HPC_201705_PRE
    xndescre := 0; xnnivapo := 0; xndevapo := 0; xnotrdes := 0;
    Screen.Cursor := crHourGlass;
    // Fin: HPC_201508_PRE
    While Not DM1.cdsReporte.Eof Do
    Begin
      If (DM1.cdsReporte.FieldByName('PVSESTLIQ').AsString = '02') Or (DM1.cdsReporte.FieldByName('PVSESTLIQ').AsString = '05') Or (DM1.cdsReporte.FieldByName('PVSESTLIQ').AsString = '06') Then
      Begin
        If DM1.cdsReporte.FieldByName('PVSLTIPBE').AsString = '01' Then
        Begin
          canret := canret + 1;
          monret := monret + DM1.cdsReporte.FieldByName('MONBEN').AsFloat;
        End;
        If DM1.cdsReporte.FieldByName('PVSLTIPBE').AsString = '02' Then
        Begin
          canfal := canfal + 1;
          monfal := monfal + DM1.cdsReporte.FieldByName('MONBEN').AsFloat;
        End;
        If DM1.cdsReporte.FieldByName('PVSLTIPBE').AsString = '03' Then
        Begin
          caninv := caninv + 1;
          moninv := moninv + DM1.cdsReporte.FieldByName('MONBEN').AsFloat;
        End;
        // Inicio: HPC_201705_PRE
        // Se modifica el calculos de los totales de beneficios anulados
        monben    := monben    + DM1.cdsReporte.FieldByName('MONBEN').AsFloat;
        xndevapo  := xndevapo  + DM1.cdsReporte.FieldByName('DEVAPO').AsFloat;
        xndescre  := xndescre  + DM1.cdsReporte.FieldByName('NIVAPO').AsFloat;
        xndescre  := xndescre  + DM1.cdsReporte.FieldByName('DESCRE').AsFloat;
        xnotrdes  := xnotrdes  + DM1.cdsReporte.FieldByName('OTRDES').AsFloat;
        imppag    := imppag    + DM1.cdsReporte.FieldByName('MONPAG').AsFloat;
        // Inicio: HPC_201802_PRE
        // Se sumariza importes por pagar
        impxpag   := impxpag   + DM1.cdsReporte.FieldByName('MONXPAG').AsFloat;
        // Fin: HPC_201802_PRE
        End
      Else
         monbenanu := monbenanu + DM1.cdsReporte.FieldByName('MONBEN').AsFloat;
      // monben    := monben      + DM1.cdsReporte.FieldByName('MONBEN').AsFloat;
      // // Inicio: HPC_201508_PRE
      // // ajuben := ajuben   + DM1.cdsReporte.FieldByName('AJUSTE').AsFloat;
      // xndevapo  := xndevapo  + DM1.cdsReporte.FieldByName('DEVAPO').AsFloat;
      // xndescre := xndescre + DM1.cdsReporte.FieldByName('NIVAPO').AsFloat;
      // xndescre  := xndescre  + DM1.cdsReporte.FieldByName('DESCRE').AsFloat;
      // xnotrdes  := xnotrdes  + DM1.cdsReporte.FieldByName('OTRDES').AsFloat;
      // Fin: HPC_201508_PRE
      // imppag := imppag  + DM1.cdsReporte.FieldByName('MONPAG').AsFloat;
      // Fin: HPC_201705_PRE

      xSql := 'SELECT * FROM PVS306 WHERE PVSLBENNR = '+QuotedStr(DM1.cdsReporte.FieldByname('PVSLBENNR').AsString);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      // Inicio: HPC_201802_PRE
      // Se asigna valor si cobra el asociado
      xcobraaso := DM1.cdsQry.FieldByName('PVSCOBASO').AsString;
      // Fin: HPC_201802_PRE
      cdsbeneficios.Append;
      cdsbeneficios.FieldByName('PVSLFECBE').AsDateTime   := DM1.cdsQry.FieldByName('PVSLFECBE').AsDateTime;
      cdsbeneficios.FieldByName('ESTLIQ').AsString        := DM1.cdsReporte.FieldByName('PVSESTDES').AsString;
      // Inicio: HPC_201802_PRE
      // Se guarda el valor de la forma de solicitud
      cdsbeneficios.FieldByName('FORSOLBEN').AsString     := DM1.cdsReporte.FieldByName('FORSOLBEN').AsString;
      // Fin: HPC_201802_PRE
      cdsbeneficios.FieldByName('PVSLBENNR').AsString     := DM1.cdsQry.FieldByname('PVSLBENNR').AsString;
      cdsbeneficios.FieldByName('ASOCODMOD').AsString     := DM1.cdsQry.FieldByname('ASOCODMOD').AsString;
      cdsbeneficios.FieldByName('ASOAPENOMBEN').AsString  := DM1.cdsQry.FieldByname('ASOAPENOMDNI').AsString;

    //INICIO HPC_201701_PRE
    //Adicion de los campos Oficina de origen, seguimiento expediente, observaciones expediente
      cdsbeneficios.FieldByName('OFIORI').AsString  := DM1.cdsReporte.FieldByname('OFIORI').AsString;
      cdsbeneficios.FieldByName('SEGUIMIENTO').AsString  := DM1.cdsReporte.FieldByname('SEGUIMIENTO').AsString;
      cdsbeneficios.FieldByName('OBSERVACION').AsString  := DM1.cdsReporte.FieldByname('OBSERVACION').AsString;
   //FIN HPC_201701_PRE
   // Inicio: HPP_201108_PRE
      cdsbeneficios.FieldByName('ASODNI').AsString        := DM1.cdsReporte.FieldByName('ASODNI').AsString;
      cdsbeneficios.FieldByName('ASOFRESNOM').AsDateTime  := DM1.cdsReporte.FieldByName('ASOFRESNOM').AsDateTime;
      cdsbeneficios.FieldByName('ASOFRESCESE').AsDateTime := DM1.cdsReporte.FieldByName('ASOFRESCESE').AsDateTime;
	  // Inicio: SPP_201403_PRE
      cdsbeneficios.FieldByName('AUTDESAPO').AsString     := DM1.cdsReporte.FieldByName('AUTDESAPO').AsString;
	  // Fin: SPP_201403_PRE
      // Inicio: SPP_201307_PRE
      cdsbeneficios.FieldByName('USUARIO').AsString       := DM1.cdsReporte.FieldByName('USUARIO').AsString;
      // Fin: SPP_201307_PRE
   // Fin: HPP_201108_PRE
      // Tipo de beneficio
      xSql := 'SELECT BENEFABR FROM TGE186 WHERE TIPBENEF = '+QuotedStr(DM1.cdsQry.FieldByName('PVSLTIPBE').AsString);
      DM1.cdsQry2.Close;
      DM1.cdsQry2.DataRequest(xSql);
      DM1.cdsQry2.Open;
      cdsbeneficios.FieldByName('BENEFICIO').AsString := DM1.cdsQry2.FieldByName('BENEFABR').AsString;
      // Inicio: HPC_201508_PRE
      If DM1.cdsReporte.FieldByName('PVSLTIPBE').AsString = '01' Then
      Begin
         xSql := 'SELECT ''Interino'' MOTIVO From ASO_CES_INTERINOS Where ASOID = '+QuotedStr(DM1.cdsReporte.FieldByName('ASOID').AsString)+' And (GRUPO_1_INTERINO = ''SI'' OR GRUPO_2_INTERINO = ''SI'')';
         DM1.cdsQry10.Close;
         DM1.cdsQry10.DataRequest(xSql);
         DM1.cdsQry10.Open;
         If Trim(DM1.cdsQry10.FieldByName('MOTIVO').AsString) = '' Then
         Begin
            xSql := 'Select Case When TO_CHAR(ASOFRESCESE,''YYYY'')-TO_CHAR(ASOFECNAC,''YYYY'') >= 65 Then ''Limite de edad'' Else ''Voluntario/Otros'' End MOTIVO From PVS301 Where ASOID = '+QuotedStr(DM1.cdsReporte.FieldByName('ASOID').AsString);
            DM1.cdsQry10.Close;
            DM1.cdsQry10.DataRequest(xSql);
            DM1.cdsQry10.Open;
         End;
         cdsbeneficios.FieldByName('MOTIVO').AsString := DM1.cdsQry10.FieldByName('MOTIVO').AsString;
      End;
      // Fin: HPC_201508_PRE
      cdsbeneficios.FieldByName('DPTODES').AsString        := DM1.cdsReporte.FieldByName('DPTODES').AsString;
      If (DM1.cdsReporte.FieldByName('PVSESTLIQ').AsString = '02') Or (DM1.cdsReporte.FieldByName('PVSESTLIQ').AsString = '05') Or (DM1.cdsReporte.FieldByName('PVSESTLIQ').AsString = '06') Then
      Begin
        cdsbeneficios.FieldByName('MONBEN').AsFloat         := DM1.cdsReporte.FieldByName('MONBEN').AsFloat;
        // Inicio: HPC_201508_PRE
        // cdsbeneficios.FieldByName('AJUBEN').AsFloat         := DM1.cdsReporte.FieldByName('AJUSTE').AsFloat;
        cdsbeneficios.FieldByName('DEVAPO').AsFloat         := DM1.cdsReporte.FieldByName('DEVAPO').AsFloat;
        cdsbeneficios.FieldByName('NIVAPO').AsFloat         := DM1.cdsReporte.FieldByName('NIVAPO').AsFloat;
        cdsbeneficios.FieldByName('DESCRE').AsFloat         := DM1.cdsReporte.FieldByName('DESCRE').AsFloat;
        cdsbeneficios.FieldByName('OTRDES').AsFloat         := DM1.cdsReporte.FieldByName('OTRDES').AsFloat;
        // Fin: HPC_201508_PRE
        // Tipo de pago
        // Primero se cuenta cuantos beneficiarios existen. Si existe solo uno se actualizan los datos
        // del pago en el mismo registro. En caso que sean mas de un beneficiario si van ha añadir un registro por cada beneficiario
        xSql := 'SELECT PVSLBENNR, FORPAGOID, BANCOID, AGENBCOID, PVSNOMBRE, FECPAG, PVSLNOFC, NROCHEQUE, SUM(NVL(PVSLMONTO,0)) PVSLMONTO'
        +' FROM PVS307 WHERE PVSLBENNR = '+QuotedStr(DM1.cdsReporte.FieldByName('PVSLBENNR').AsString)+' AND PVSLAGRID = ''FPG'' AND FLGVOUCHER = ''N'''
        +' GROUP BY PVSLBENNR, FORPAGOID, BANCOID, AGENBCOID, PVSNOMBRE, FECPAG, PVSLNOFC, NROCHEQUE';
        DM1.cdsQry2.Close;
        DM1.cdsQry2.DataRequest(xSql);
        DM1.cdsQry2.Open;
        // Si solo hay un beneficiario
        // Inicio: HPC_201802_PRE
        // Se valida si cobra el asociado
        // If DM1.cdsQry.FieldByName('PVSCOBASO').AsString = 'S' Then
        If (xcobraaso = 'S') Or (xcobraaso = '') Then
        // Fin: HPC_201802_PRE
        Begin
          If DM1.cdsQry2.FieldByName('FECPAG').AsFloat <> 0 Then
            cdsbeneficios.FieldByName('FECPAG').AsDateTime := DM1.cdsQry2.FieldByName('FECPAG').AsDateTime;

          If DM1.cdsQry2.FieldByName('PVSLNOFC').AsString <> '' Then
             cdsbeneficios.FieldByName('DOCPAG').AsString    := DM1.cdsQry2.FieldByName('PVSLNOFC').AsString
          Else
             cdsbeneficios.FieldByName('DOCPAG').AsString    := DM1.cdsQry2.FieldByName('NROCHEQUE').AsString;
          // Tipo de pago
          xSql := 'SELECT TIPDESEABR FROM CRE104 WHERE TIPDESEID = '+QuotedStr(DM1.cdsQry2.FieldByName('FORPAGOID').AsString);
          DM1.cdsQry3.Close;
          DM1.cdsQry3.DataRequest(xSql);
          DM1.cdsQry3.Open;
          cdsbeneficios.FieldByName('TIPPAG').AsString := DM1.cdsQry3.FieldByName('TIPDESEABR').AsString;
          // Banco
          xSql := 'SELECT BANCOABR FROM TGE105 WHERE BANCOID = '+QuotedStr(DM1.cdsQry2.FieldByName('BANCOID').AsString);
          DM1.cdsQry3.Close;
          DM1.cdsQry3.DataRequest(xSql);
          DM1.cdsQry3.Open;
          cdsbeneficios.FieldByName('BCODES').AsString := DM1.cdsQry3.FieldByName('BANCOABR').AsString;

          // Inicio: HPC_201508_PRE
          // Giudad en donde se gira
          // xSql := 'SELECT AGENBCOABR FROM COB102 WHERE AGENBCOID = '+QuotedStr(DM1.cdsQry2.FieldByName('AGENBCOID').AsString);
          // DM1.cdsQry3.Close;
          // DM1.cdsQry3.DataRequest(xSql);
          // DM1.cdsQry3.Open;
          // cdsbeneficios.FieldByName('CIUGIR').AsString := DM1.cdsQry3.FieldByName('AGENBCOABR').AsString;
          // Actualizando CCI
          xSql := 'SELECT SUM(CREMTOCOB) MONTO, MAX(FOPERAC) FECHA, COUNT(*) CUOTAS FROM CRE310 WHERE ASOID = '+QuotedStr(DM1.cdsReporte.FieldByName('ASOID').AsString)
          +' AND FORPAGABR = ''CCI'' And CREESTID NOT IN (''04'',''13'',''99'') AND NUMDEV IS Null';
          DM1.cdsQry.Close;
          DM1.cdsQry.DataRequest(xSql);
          DM1.cdsQry.Open;
          If Trim(DM1.cdsQry.FieldByName('FECHA').AsString) <>  '' Then
          Begin
             cdsbeneficios.FieldByName('MONTOCCI').AsFloat    := DM1.cdsQry.FieldByName('MONTO').AsFloat;
             cdsbeneficios.FieldByName('FECHACCI').AsDateTime := DM1.cdsQry.FieldByName('FECHA').AsDateTime;
             cdsbeneficios.FieldByName('CANCCI').AsInteger    := DM1.cdsQry.FieldByName('CUOTAS').AsInteger;
          End;
          // Fin: HPC_201508_PRE
          // Inicio : HPC_201802_PRE 
          // Se añaden campo importe pagado e importes por pagar
          cdsbeneficios.FieldByName('IMPPAG').AsFloat  := DM1.cdsReporte.FieldByName('MONPAG').AsFloat;
          cdsbeneficios.FieldByName('IMPXPAG').AsFloat := DM1.cdsReporte.FieldByName('MONXPAG').AsFloat;
          // Fin : HPC_201802_PRE 
          cdsbeneficios.Post;
        End;
        // Inicio: HPC_201802_PRE
        // Si no cobra el beneficiario
        If (xcobraaso = 'N') Then
        // Fin: HPC_201802_PRE
        Begin
          DM1.cdsQry2.First;
          While Not DM1.cdsQry2.Eof Do
          Begin
            cdsbeneficios.Append;
            cdsbeneficios.FieldByName('DPTODES').AsString        := DM1.cdsReporte.FieldByName('DPTODES').AsString;
            cdsbeneficios.FieldByName('ASOAPENOMBEN').AsString  := DM1.cdsQry2.FieldByname('PVSNOMBRE').AsString;
            cdsbeneficios.FieldByName('PVSLBENNR').AsString     := DM1.cdsQry2.FieldByname('PVSLBENNR').AsString;

            If DM1.cdsQry2.FieldByName('FECPAG').AsFloat <> 0 Then
              cdsbeneficios.FieldByName('FECPAG').AsDateTime := DM1.cdsQry2.FieldByName('FECPAG').AsDateTime;

            If DM1.cdsQry2.FieldByName('PVSLNOFC').AsString <> '' Then
               cdsbeneficios.FieldByName('DOCPAG').AsString    := DM1.cdsQry2.FieldByName('PVSLNOFC').AsString
            Else
               cdsbeneficios.FieldByName('DOCPAG').AsString    := DM1.cdsQry2.FieldByName('NROCHEQUE').AsString;
            // Inicio: HPC_201802_PRE
            // Se añaden campos monto pagado y monto x pagar 
            cdsbeneficios.FieldByName('IMPPAG').AsFloat  := DM1.cdsQry2.FieldByName('PVSLMONTO').AsFloat;
            cdsbeneficios.FieldByName('IMPXPAG').AsFloat := 0;
            // Fin: HPC_201802_PRE

            // Tipo de pago
            xSql := 'SELECT TIPDESEABR FROM CRE104 WHERE TIPDESEID = '+QuotedStr(DM1.cdsQry2.FieldByName('FORPAGOID').AsString);
            DM1.cdsQry3.Close;
            DM1.cdsQry3.DataRequest(xSql);
            DM1.cdsQry3.Open;
            cdsbeneficios.FieldByName('TIPPAG').AsString := DM1.cdsQry3.FieldByName('TIPDESEABR').AsString;
            // Banco
            xSql := 'SELECT BANCOABR FROM TGE105 WHERE BANCOID = '+QuotedStr(DM1.cdsQry2.FieldByName('BANCOID').AsString);
            DM1.cdsQry3.Close;
            DM1.cdsQry3.DataRequest(xSql);
            DM1.cdsQry3.Open;
            cdsbeneficios.FieldByName('BCODES').AsString := DM1.cdsQry3.FieldByName('BANCOABR').AsString;

            // Inicio: HPC_201508_PRE
            // Giudad en donde se gira
            // xSql := 'SELECT AGENBCOABR FROM COB102 WHERE AGENBCOID = '+QuotedStr(DM1.cdsQry2.FieldByName('AGENBCOID').AsString);
            // DM1.cdsQry3.Close;
            // DM1.cdsQry3.DataRequest(xSql);
            // DM1.cdsQry3.Open;
            // cdsbeneficios.FieldByName('CIUGIR').AsString := DM1.cdsQry3.FieldByName('AGENBCOABR').AsString;
            cdsbeneficios.Post;
            DM1.cdsQry2.Next;
          End;
        End;
     // Inicio: HPC_201705_PRE
     // Se actualiza la columna monto de beneficio anulado
     // End;
     End
      Else
         cdsbeneficios.FieldByName('MONBENANU').AsFloat := DM1.cdsReporte.FieldByName('MONBENANU').AsFloat;
      DM1.cdsReporte.Next;
    End;
    // Fin: HPC_201705_PRE
    cdsbeneficios.First;
    // Fin: HPC_201508_PRE
    dbgliqben.DataSource := dsbeneficios;
    dbgliqben.Selected.Clear;
    dbgliqben.Selected.Add('PVSLFECBE'#9'10'#9'Fecha de~la liquidación'#9#9);
    dbgliqben.Selected.Add('PVSLBENNR'#9'11'#9'Número de~la liquidación'#9#9);
    dbgliqben.Selected.Add('ESTLIQ'#9'20'#9'Estado de la~liquidación'#9#9);
    // Inicio: HPC_201802_PRE
    // Se añade campo origen de solicitud del beneficiario
    dbgliqben.Selected.Add('FORSOLBEN'#9'20'#9'Origen de~la solicitud'#9#9);
    // Fin: HPC_201802_PRE
    dbgliqben.Selected.Add('ASOCODMOD'#9'10'#9'Código~Modular'#9#9);
 // Inicio: HPP_201108_PRE
    dbgliqben.Selected.Add('ASODNI'#9'8'#9'D.N.I.'#9#9);
    dbgliqben.Selected.Add('ASOAPENOMBEN'#9'45'#9'Apellidos y Nombre(s)~del beneficiario'#9#9);
    dbgliqben.Selected.Add('ASOFRESNOM'#9'10'#9'Fecha de~Nombramiento'#9#9);
    dbgliqben.Selected.Add('ASOFRESCESE'#9'10'#9'Fecha de~Cese'#9#9);
 // Fin: HPP_201108_PRE
    dbgliqben.Selected.Add('BENEFICIO'#9'15'#9'Tipo de~Beneficio'#9#9);
    // Inicio: HPC_201508_PRE
    dbgliqben.Selected.Add('MOTIVO'#9'16'#9'Motivo del~Beneficio'#9#9);
    // Fin: HPC_201508_PRE

    dbgliqben.Selected.Add('TIPPAG'#9'15'#9'Tipo de~Pago'#9#9);
    dbgliqben.Selected.Add('BCODES'#9'15'#9'Nombre del Banco'#9#9);
    // Inicio: HPC_201508_PRE
    // dbgliqben.Selected.Add('CIUGIR'#9'15'#9'Ciudad de~Giro'#9#9);
    // Fin: HPC_201508_PRE

    dbgliqben.Selected.Add('DOCPAG'#9'15'#9'Documento de~pago'#9#9);
    dbgliqben.Selected.Add('FECPAG'#9'10'#9'Fecha de~pago'#9#9);
    // Inicio: HPC_201705_PRE
    // Se modifica la longitud de la columna "Monto del beneficio"
    // dbgliqben.Selected.Add('MONBEN'#9'10'#9'Monto del~Beneficio'#9#9);
    dbgliqben.Selected.Add('MONBEN'#9'13'#9'Monto del~Beneficio'#9#9);
    dbgliqben.Selected.Add('MONBENANU'#9'13'#9'Monto Beneficio~Anulado/Extornado'#9#9);
    // Fin: HPC_201705_PRE
    // Inicio: HPC_201508_PRE

    // Inicio: HPC_201705_PRE
    // Se modifica tamaños de las columnas del grid previo de la impresión.
    // dbgliqben.Selected.Add('DEVAPO'#9'10'#9'Devolución de~Aporte'#9#9);
    // dbgliqben.Selected.Add('DESCRE'#9'10'#9'Creditos~Descontados'#9#9);
    // dbgliqben.Selected.Add('NIVAPO'#9'10'#9'Nivelación de~Aporte'#9#9);
    // dbgliqben.Selected.Add('OTRDES'#9'10'#9'Otros~Descuentos'#9#9);
    // dbgliqben.Selected.Add('MONTOCCI'#9'10'#9'Monto~CCI'#9#9);
    // dbgliqben.Selected.Add('FECHACCI'#9'10'#9'Fecha~CCI'#9#9);
    // dbgliqben.Selected.Add('CANCCI'#9'10'#9'Cuotas~CCI'#9#9);
    dbgliqben.Selected.Add('DEVAPO'#9'13'#9'Devolución de~Aporte'#9#9);
    dbgliqben.Selected.Add('DESCRE'#9'13'#9'Creditos~Descontados'#9#9);
    dbgliqben.Selected.Add('NIVAPO'#9'13'#9'Nivelación de~Aporte'#9#9);
    dbgliqben.Selected.Add('OTRDES'#9'13'#9'Otros~Descuentos'#9#9);
    dbgliqben.Selected.Add('MONTOCCI'#9'13'#9'Monto~CCI'#9#9);
    dbgliqben.Selected.Add('FECHACCI'#9'13'#9'Fecha~CCI'#9#9);
    dbgliqben.Selected.Add('CANCCI'#9'13'#9'Cuotas~CCI'#9#9);
    // Fin: HPC_201705_PRE

    // dbgliqben.Selected.Add('AJUBEN'#9'10'#9'Monto del~Ajuste'#9#9); HPC_201508_PRE
    // Fin: HPC_201508_PRE
    // Inicio: HPC_201705_PRE
    // Se modifica tamaños de las columnas del grid previo de la impresión.
    // dbgliqben.Selected.Add('IMPPAG'#9'10'#9'Importe~Pagado'#9#9);
    dbgliqben.Selected.Add('IMPPAG'#9'13'#9'Importe~Pagado'#9#9);
    // Inicio: HPC_201802_PRE
    // Se añade campo importe x pagar 
    dbgliqben.Selected.Add('IMPXPAG'#9'13'#9'Importe~por pagar'#9#9);
    // Fin: HPC_201802_PRE
    // Fin: HPC_201705_PRE

    // Inicio: SPP_201307_PRE
    dbgliqben.Selected.Add('USUARIO'#9'15'#9'Usuario~que liquida'#9#9);
    // Inicio: SPP_201403_PRE
    dbgliqben.Selected.Add('AUTDESAPO'#9'1'#9'CADAP'#9#9);
	// Fin: SPP_201403_PRE
    // Fin: SPP_201307_PRE
    //INICIO HPC_201701_PRE
    //Adicion de los campos Oficina de origen, seguimiento expediente, observaciones expediente
    dbgliqben.Selected.Add('OFIORI'#9'14'#9'Oficina de~origen'#9#9);
    dbgliqben.Selected.Add('SEGUIMIENTO'#9'42'#9'Seguimiento~expediente'#9#9);
    dbgliqben.Selected.Add('OBSERVACION'#9'60'#9'Observaciones~expediente'#9#9);
    //FIN HPC_201701_PRE
    TNumericField(cdsbeneficios.FieldByName('MONBEN')).DisplayFormat := '###,###,##0.00';
    // Inicio: HPC_201705_PRE
    // Se añade columna "Monto de la liquidación anulada" del grid previo de la impresión.
    TNumericField(cdsbeneficios.FieldByName('MONBENANU')).DisplayFormat := '###,###,##0.00';
    // Fin: HPC_201705_PRE
    // Inicio: HPC_201508_PRE
    // TNumericField(cdsbeneficios.FieldByName('AJUBEN')).DisplayFormat := '###,###,##0.00';
    TNumericField(cdsbeneficios.FieldByName('DEVAPO')).DisplayFormat := '###,###,##0.00';
    TNumericField(cdsbeneficios.FieldByName('DESCRE')).DisplayFormat := '###,###,##0.00';
    TNumericField(cdsbeneficios.FieldByName('NIVAPO')).DisplayFormat := '###,###,##0.00';
    TNumericField(cdsbeneficios.FieldByName('OTRDES')).DisplayFormat := '###,###,##0.00';
    TNumericField(cdsbeneficios.FieldByName('IMPPAG')).DisplayFormat := '###,###,##0.00';
    // Inicio: HPC_201802_PRE
    // se formatea campo importe x pagar
    TNumericField(cdsbeneficios.FieldByName('IMPXPAG')).DisplayFormat := '###,###,##0.00';
    // Fin: HPC_201802_PRE
    dbgliqben.ApplySelected;
    // dbgliqben.ColumnByName('CIUGIR').FooterValue := 'TOTALES : ';
    // TNumericField(cdsbeneficios.FieldByName('MONBEN')).DisplayFormat := '###,###,##0.00';
    // TNumericField(cdsbeneficios.FieldByName('AJUBEN')).DisplayFormat := '###,###,##0.00';
    // TNumericField(cdsbeneficios.FieldByName('IMPPAG')).DisplayFormat := '###,###,##0.00';
    dbgliqben.ColumnByName('MONBEN').FooterValue := FormatFloat('###,###.#0',monben);
    // Inicio: HPC_201705_PRE
    // Se añade columna "Monto de la liquidación anulada" del grid previo de la impresión.
    dbgliqben.ColumnByName('MONBENANU').FooterValue := FormatFloat('###,###.#0',monbenanu);
    // Fin: HPC_201705_PRE
    // dbgliqben.ColumnByName('AJUBEN').FooterValue := FormatFloat('###,###.#0',ajuben);
    dbgliqben.ColumnByName('DEVAPO').FooterValue := FormatFloat('###,###.#0',xndevapo);
    dbgliqben.ColumnByName('DESCRE').FooterValue := FormatFloat('###,###.#0',xndescre);
    dbgliqben.ColumnByName('NIVAPO').FooterValue := FormatFloat('###,###.#0',xnnivapo);
    dbgliqben.ColumnByName('OTRDES').FooterValue := FormatFloat('###,###.#0',xnotrdes);
    dbgliqben.ColumnByName('IMPPAG').FooterValue := FormatFloat('###,###.#0',imppag);
    // Inicio: HPC_201802_PRE
    // Se asigna valor importe x pagar
    dbgliqben.ColumnByName('IMPXPAG').FooterValue := FormatFloat('###,###.#0',impxpag);
    // Fin: HPC_201802_PRE
    Screen.Cursor := crDefault;
    // Fin: HPC_201508_PRE
  End;

  If rgtipben.ItemIndex = 1 Then
  Begin
     // Inicio: HPC_201705_PRE
     // Se Añade diseño de cursor "HourGlass".
     Screen.Cursor := crHourGlass;
     // Fin: HPC_201705_PRE
    // INICIO HPC_201610_PRE
    // MEJORA CONSULTA PARA ACEPTAR PARAMETROS OPCIONALES
    // Inicio: HPC_201709_PRE 
    // Se modifican los campos de la consulta
    xSql :=
    // ' SELECT PVSLFECBE '
    // + '       ,SUM(CASE WHEN PVSLTIPBE = ''01'' THEN 1 ELSE 0 END) CANRET '
    // + '       ,SUM(CASE WHEN PVSLTIPBE = ''01'' THEN PVSLMONTO ELSE 0 END) MONRET '
    // + '       ,SUM(CASE WHEN PVSLTIPBE = ''02'' THEN 1 ELSE 0 END) CANFAL '
    // + '       ,SUM(CASE WHEN PVSLTIPBE = ''02'' THEN PVSLMONTO ELSE 0 END) MONFAL '
    // + '       ,SUM(CASE WHEN PVSLTIPBE = ''03'' THEN 1 ELSE 0 END) CANINV '
    // + '       ,SUM(CASE WHEN PVSLTIPBE = ''03'' THEN PVSLMONTO ELSE 0 END) MONINV '
    // + '   FROM (SELECT TO_CHAR(PVSLFECBE, ''YYYYMM'') PVSLFECBE, PVSLTIPBE'
      ' SELECT ANOMES, TO_CHAR(PVSLFECBE,''MONTH'',''nls_date_language=spanish'') DESC_MES '
    + '       ,SUM(CASE WHEN PVSLTIPBE = ''01'' THEN 1 ELSE 0 END) CANT_RETIRO '
    + '       ,SUM(CASE WHEN PVSLTIPBE = ''01'' THEN PVSLMONTO ELSE 0 END) MONT_RETIRO '
    + '       ,SUM(CASE WHEN PVSLTIPBE = ''02'' THEN 1 ELSE 0 END) CANT_FALLECIMIENTO '
    + '       ,SUM(CASE WHEN PVSLTIPBE = ''02'' THEN PVSLMONTO ELSE 0 END) MONT_FALLECIMIENTO '
    + '       ,SUM(CASE WHEN PVSLTIPBE = ''03'' THEN 1 ELSE 0 END) CANT_INVALIDEZ '
    + '       ,SUM(CASE WHEN PVSLTIPBE = ''03'' THEN PVSLMONTO ELSE 0 END) MONT_INVALIDEZ '
    + '       ,SUM(1) CANT_TOTAL '
    + '       ,SUM(PVSLMONTO) MONT_TOTAL '
    + '   FROM (SELECT  TO_CHAR(PVSLFECBE,''YYYYMM'') ANOMES, PVSLFECBE, PVSLTIPBE'
    + '                ,(SELECT SUM(NVL(B.PVSLMONTO,0)) '
    + '                    FROM PVS307 B '
    + '                   WHERE PVSLFECBE >= '+QuotedStr(dbdtpinicial.Text)
    + '                     AND PVSLFECBE <= '+QuotedStr(dbdtpfinal.Text)
    + '                     AND PVSESTLIQ IN (''02'',''05'', ''06'') '
    + '                     AND A.PVSLBENNR = B.PVSLBENNR '
    + '                     AND B.PVSLAGRID = ''DET'' '
    + '                     AND B.TIPDES <> ''TC'') PVSLMONTO'
    + '           FROM PVS306 A '
    + '          WHERE PVSLFECBE >= '+QuotedStr(dbdtpinicial.Text)
    + '            AND PVSLFECBE <= '+QuotedStr(dbdtpfinal.Text)
    + '            AND NVL(A.USUARIO,''XX'')   = NVL((CASE WHEN ' + QuotedStr(dblcdusuario.Text) + '= ''00'' THEN A.USUARIO   ELSE ' + QuotedStr(dblcdusuario.Text) + ' END),''XX'') '
    // Inicio: HPC_201802
    // Se añade filtro de forma de solicitud del beneficiario
    + '            AND PVSESTLIQ IN (''02'',''05'', ''06'')';

    If rgorisol.ItemIndex = 0 Then
       xSql := xSql + ' AND A.FORSOLBEN = ''S''';
    If rgorisol.ItemIndex = 1 Then
       xSql := xSql + ' AND A.FORSOLBEN = ''O''';

    // + '  GROUP BY PVSLFECBE ORDER BY PVSLFECBE';
    xSql := xSql + ' )  GROUP BY ANOMES, TO_CHAR(PVSLFECBE,''MONTH'',''nls_date_language=spanish'') ORDER BY ANOMES, TO_CHAR(PVSLFECBE,''MONTH'',''nls_date_language=spanish'')';
    // Fin: HPC_201802
    // FIN HPC_201610_PRE
    xSqlAExcel := xSql;
    DM1.cdsReporte.Close;
    DM1.cdsReporte.DataRequest(xSql);
    DM1.cdsReporte.Open;
    // Fin: HPC_201709_PRE
    // Inicio: HPC_201705_PRE
    // Qry Calcular la cantidad y monto de liquidaciones anuladas
    xSql := 'SELECT ANOMES, MES, SUM(NVL(CANEXT,0)) CANEXT, SUM(NVL(MONEXT,0)) MONEXT, SUM(NVL(CANANU,0)) CANANU, SUM(NVL(MONANU,0)) MONANU'
    +' FROM (SELECT TO_CHAR(PVSLFECBE, ''YYYYMM'') ANOMES, UPPER(TRIM(TO_CHAR(PVSLFECBE,''MONTH'',''NLS_DATE_LANGUAGE=SPANISH''))) MES,'
    +' CASE WHEN PVSESTLIQ = ''04'' THEN 1 ELSE 0 END CANEXT, CASE WHEN PVSESTLIQ = ''04'' THEN MONLIQBEN ELSE 0 END MONEXT,'
    +' CASE WHEN PVSESTLIQ = ''13'' THEN 1 ELSE 0 END CANANU, CASE WHEN PVSESTLIQ = ''13'' THEN MONLIQBEN ELSE 0 END MONANU'
    +' FROM PVS306'
    +' WHERE PVSLFECBE >= '+QuotedStr(dbdtpinicial.Text)+' AND PVSLFECBE <= '+QuotedStr(dbdtpfinal.Text)
    +' AND PVSESTLIQ IN (''04'',''13''))'
    +' GROUP BY ANOMES, MES'
    +' ORDER BY ANOMES';
    DM1.cdsRepresentante.Close;
    DM1.cdsRepresentante.DataRequest(xSql);
    DM1.cdsRepresentante.Open;
    cdsAnulados.EmptyDataSet;
    While Not DM1.cdsRepresentante.Eof Do
    Begin
       cdsAnulados.Append;
       cdsAnulados.FieldByName('ANOMES').AsString := DM1.cdsRepresentante.FieldByName('ANOMES').AsString;
       cdsAnulados.FieldByName('MES').AsString := DM1.cdsRepresentante.FieldByName('MES').AsString;
       cdsAnulados.FieldByName('CANANU').AsFloat := DM1.cdsRepresentante.FieldByName('CANANU').AsFloat;
       cdsAnulados.FieldByName('MONANU').AsFloat := DM1.cdsRepresentante.FieldByName('MONANU').AsFloat;
       cdsAnulados.FieldByName('CANEXT').AsFloat := DM1.cdsRepresentante.FieldByName('CANEXT').AsFloat;
       cdsAnulados.FieldByName('MONEXT').AsFloat := DM1.cdsRepresentante.FieldByName('MONEXT').AsFloat;
       cdsAnulados.Post;
       DM1.cdsRepresentante.Next;
    End;
    If DM1.cdsRepresentante.RecordCount > 0 Then
       btnAnulado.Enabled := True
    Else
       btnAnulado.Enabled := False;
    // Fin: HPC_201705_PRE

    // Inicio: HPC_201508_PRE
    Screen.Cursor := crDefault;
    // Fin: HPC_201508_PRE

    // Inicio: SPP_201307_PRE
    If DM1.cdsReporte.RecordCount = 0 Then
    Begin
       MessageDlg('No existe información para mostrar', mtInformation, [mbOk], 0);
       limpia;
       btnimprimir.Enabled := False;
       // Inicio: HPC_201705_PRE
       // Se realiza una modificación del nombre del boton para exportar a excel
       // btnaexcel.Enabled := False;
       btnTipBen.Enabled   := False;
       // Fin: HPC_201705_PRE
       Exit;
    End;
    btnimprimir.Enabled := True;

    // Inicio: HPC_201705_PRE
    // Se realiza una modificación del nombre del boton para exportar a excel
    // btnaexcel.Enabled   := True;
    btnTipBen.Enabled   := True;
    // Fin: HPC_201705_PRE

    // Fin: SPP_201307_PRE
    DM1.cdsReporte.First;
    canret := 0;
    caninv := 0;
    canfal := 0;
    monret := 0;
    moninv := 0;
    monfal := 0;
    cdsresumen.EmptyDataSet;
    // Inicio: HPC_201508_PRE
    cursor := crHourGlass;
    // Fin: HPC_201508_PRE
    While Not DM1.cdsReporte.Eof Do
    Begin
    // Inicio: HPC_201709_PRE
      // Se modifican los nombres de los campos que se muestran en el grid
      // canret := canret + DM1.cdsReporte.FieldByName('CANRET').AsFloat;
      // caninv := caninv + DM1.cdsReporte.FieldByName('CANINV').AsFloat;
      // canfal := canfal + DM1.cdsReporte.FieldByName('CANFAL').AsFloat;
      // monret := monret + DM1.cdsReporte.FieldByName('MONRET').AsFloat;
      // moninv := moninv + DM1.cdsReporte.FieldByName('MONINV').AsFloat;
      // monfal := monfal + DM1.cdsReporte.FieldByName('MONFAL').AsFloat;
      canret := canret + DM1.cdsReporte.FieldByName('CANT_RETIRO').AsFloat;
      caninv := caninv + DM1.cdsReporte.FieldByName('CANT_INVALIDEZ').AsFloat;
      canfal := canfal + DM1.cdsReporte.FieldByName('CANT_FALLECIMIENTO').AsFloat;
      monret := monret + DM1.cdsReporte.FieldByName('MONT_RETIRO').AsFloat;
      moninv := moninv + DM1.cdsReporte.FieldByName('MONT_INVALIDEZ').AsFloat;
      monfal := monfal + DM1.cdsReporte.FieldByName('MONT_FALLECIMIENTO').AsFloat;
      cdsresumen.Append;
      // cdsresumen.FieldByName('MES').AsString := DM1.NombreMes(Copy(DM1.cdsReporte.FieldByName('PVSLFECBE').AsString,5,2));
      // cdsresumen.FieldByName('CANRET').AsFloat := DM1.cdsReporte.FieldByName('CANRET').AsFloat;
      // cdsresumen.FieldByName('MONRET').AsFloat := DM1.cdsReporte.FieldByName('MONRET').AsFloat;
      // cdsresumen.FieldByName('CANINV').AsFloat := DM1.cdsReporte.FieldByName('CANINV').AsFloat;
      // cdsresumen.FieldByName('MONINV').AsFloat := DM1.cdsReporte.FieldByName('MONINV').AsFloat;
      // cdsresumen.FieldByName('CANFAL').AsFloat := DM1.cdsReporte.FieldByName('CANFAL').AsFloat;
      // cdsresumen.FieldByName('MONFAL').AsFloat := DM1.cdsReporte.FieldByName('MONFAL').AsFloat;
      // cdsresumen.FieldByName('CANTOT').AsFloat := DM1.cdsReporte.FieldByName('CANRET').AsFloat+DM1.cdsReporte.FieldByName('CANINV').AsFloat+DM1.cdsReporte.FieldByName('CANFAL').AsFloat;
      // cdsresumen.FieldByName('MONTOT').AsFloat := DM1.cdsReporte.FieldByName('MONRET').AsFloat+DM1.cdsReporte.FieldByName('MONINV').AsFloat+DM1.cdsReporte.FieldByName('MONFAL').AsFloat;
      cdsresumen.FieldByName('DESC_MES').AsString := DM1.NombreMes(IntToStr(strtoint(Copy(DM1.cdsReporte.FieldByName('ANOMES').AsString,5,2))));
      cdsresumen.FieldByName('CANT_RETIRO').AsFloat := DM1.cdsReporte.FieldByName('CANT_RETIRO').AsFloat;
      cdsresumen.FieldByName('MONT_RETIRO').AsFloat := DM1.cdsReporte.FieldByName('MONT_RETIRO').AsFloat;
      cdsresumen.FieldByName('CANT_INVALIDEZ').AsFloat := DM1.cdsReporte.FieldByName('CANT_INVALIDEZ').AsFloat;
      cdsresumen.FieldByName('MONT_INVALIDEZ').AsFloat := DM1.cdsReporte.FieldByName('MONT_INVALIDEZ').AsFloat;
      cdsresumen.FieldByName('CANT_FALLECIMIENTO').AsFloat := DM1.cdsReporte.FieldByName('CANT_FALLECIMIENTO').AsFloat;
      cdsresumen.FieldByName('MONT_FALLECIMIENTO').AsFloat := DM1.cdsReporte.FieldByName('MONT_FALLECIMIENTO').AsFloat;
      cdsresumen.FieldByName('CANT_TOTAL').AsFloat := DM1.cdsReporte.FieldByName('CANT_RETIRO').AsFloat+DM1.cdsReporte.FieldByName('CANT_INVALIDEZ').AsFloat+DM1.cdsReporte.FieldByName('CANT_FALLECIMIENTO').AsFloat;
      cdsresumen.FieldByName('MONT_TOTAL').AsFloat := DM1.cdsReporte.FieldByName('MONT_RETIRO').AsFloat+DM1.cdsReporte.FieldByName('MONT_INVALIDEZ').AsFloat+DM1.cdsReporte.FieldByName('MONT_FALLECIMIENTO').AsFloat;
      cdsresumen.Post;
      DM1.cdsReporte.Next;
    End;
    dbgliqben.Selected.Clear;
    // dbgliqben.Selected.Add('MES'#9'18'#9'Mes del~Proceso'#9#9);
    // dbgliqben.Selected.Add('CANRET'#9'10'#9'Cantidad~por retiro'#9#9);
    // dbgliqben.Selected.Add('MONRET'#9'13'#9'Monto por~retiro'#9#9);
    // dbgliqben.Selected.Add('CANFAL'#9'10'#9'Cantidad por~Fallecimiento'#9#9);
    // dbgliqben.Selected.Add('MONFAL'#9'13'#9'Monto por~Fallecimiento'#9#9);
    // dbgliqben.Selected.Add('CANINV'#9'10'#9'Cantidad por~Invalidez'#9#9);
    // dbgliqben.Selected.Add('MONINV'#9'13'#9'Monto por~Invalidez'#9#9);
    // dbgliqben.Selected.Add('CANTOT'#9'10'#9'Cantidad~Total'#9#9);
    // dbgliqben.Selected.Add('MONTOT'#9'13'#9'Monto~Total'#9#9);
    // TNumericField(cdsresumen.FieldByName('CANRET')).DisplayFormat := '###,###,##0';
    // TNumericField(cdsresumen.FieldByName('CANFAL')).DisplayFormat := '###,###,##0';
    // TNumericField(cdsresumen.FieldByName('CANINV')).DisplayFormat := '###,###,##0';
    // TNumericField(cdsresumen.FieldByName('CANTOT')).DisplayFormat := '###,###,##0';
    // TNumericField(cdsresumen.FieldByName('MONRET')).DisplayFormat := '###,###,###.#0';
    // TNumericField(cdsresumen.FieldByName('MONFAL')).DisplayFormat := '###,###,###.#0';
    // TNumericField(cdsresumen.FieldByName('MONINV')).DisplayFormat := '###,###,###.#0';
    // TNumericField(cdsresumen.FieldByName('MONTOT')).DisplayFormat := '###,###,###.#0';
    dbgliqben.Selected.Add('ANOMES'#9'18'#9'Año Mes del~Proceso'#9#9);
    dbgliqben.Selected.Add('DESC_MES'#9'18'#9'Mes del~Proceso'#9#9);
    dbgliqben.Selected.Add('CANT_RETIRO'#9'10'#9'Cantidad~por retiro'#9#9);
    dbgliqben.Selected.Add('MONT_RETIRO'#9'13'#9'Monto por~retiro'#9#9);
    dbgliqben.Selected.Add('CANT_FALLECIMIENTO'#9'10'#9'Cantidad por~Fallecimiento'#9#9);
    dbgliqben.Selected.Add('MONT_FALLECIMIENTO'#9'13'#9'Monto por~Fallecimiento'#9#9);
    dbgliqben.Selected.Add('CANT_INVALIDEZ'#9'10'#9'Cantidad por~Invalidez'#9#9);
    dbgliqben.Selected.Add('MONT_INVALIDEZ'#9'13'#9'Monto por~Invalidez'#9#9);
    dbgliqben.Selected.Add('CANT_TOTAL'#9'10'#9'Cantidad~Total'#9#9);
    dbgliqben.Selected.Add('MONT_TOTAL'#9'13'#9'Monto~Total'#9#9);
    TNumericField(cdsresumen.FieldByName('CANT_RETIRO')).DisplayFormat := '###,###,##0';
    TNumericField(cdsresumen.FieldByName('CANT_FALLECIMIENTO')).DisplayFormat := '###,###,##0';
    TNumericField(cdsresumen.FieldByName('CANT_INVALIDEZ')).DisplayFormat := '###,###,##0';
    TNumericField(cdsresumen.FieldByName('CANT_TOTAL')).DisplayFormat := '###,###,##0';
    TNumericField(cdsresumen.FieldByName('MONT_RETIRO')).DisplayFormat := '###,###,###.#0';
    TNumericField(cdsresumen.FieldByName('MONT_FALLECIMIENTO')).DisplayFormat := '###,###,###.#0';
    TNumericField(cdsresumen.FieldByName('MONT_INVALIDEZ')).DisplayFormat := '###,###,###.#0';
    TNumericField(cdsresumen.FieldByName('MONT_TOTAL')).DisplayFormat := '###,###,###.#0';
    dbgliqben.DataSource := dsresumen;
    // dbgliqben.ColumnByName('MES').FooterValue := 'TOTALES';
    // dbgliqben.ColumnByName('CANRET').FooterValue := FormatFloat('###,###,##0',canret);
    // dbgliqben.ColumnByName('CANFAL').FooterValue := FormatFloat('###,###,##0',canfal);
    // dbgliqben.ColumnByName('CANINV').FooterValue := FormatFloat('###,###,##0',caninv);
    // dbgliqben.ColumnByName('CANTOT').FooterValue := FormatFloat('###,###,##0',canret+canfal+caninv);
    // dbgliqben.ColumnByName('MONRET').FooterValue := FormatFloat('###,###,###.#0',monret);
    // dbgliqben.ColumnByName('MONFAL').FooterValue := FormatFloat('###,###,###.#0',monfal);
    // dbgliqben.ColumnByName('MONINV').FooterValue := FormatFloat('###,###,###.#0',moninv);
    // dbgliqben.ColumnByName('MONTOT').FooterValue := FormatFloat('###,###,###.#0',monret+monfal+moninv);
    dbgliqben.ColumnByName('ANO_MES_BENEFICIO').FooterValue := 'TOTALES';
    dbgliqben.ColumnByName('CANT_RETIRO').FooterValue := FormatFloat('###,###,##0',canret);
    dbgliqben.ColumnByName('CANT_FALLECIMIENTO').FooterValue := FormatFloat('###,###,##0',canfal);
    dbgliqben.ColumnByName('CANT_INVALIDEZ').FooterValue := FormatFloat('###,###,##0',caninv);
    dbgliqben.ColumnByName('CANT_TOTAL').FooterValue := FormatFloat('###,###,##0',canret+canfal+caninv);
    dbgliqben.ColumnByName('MONT_RETIRO').FooterValue := FormatFloat('###,###,###.#0',monret);
    dbgliqben.ColumnByName('MONT_FALLECIMIENTO').FooterValue := FormatFloat('###,###,###.#0',monfal);
    dbgliqben.ColumnByName('MONT_INVALIDEZ').FooterValue := FormatFloat('###,###,###.#0',moninv);
    dbgliqben.ColumnByName('MONT_TOTAL').FooterValue := FormatFloat('###,###,###.#0',monret+monfal+moninv);
    // Fin: HPC_201709_PRE
    // Inicio: HPC_201508_PRE
    Screen.Cursor := crDefault;
    // Fin: HPC_201508_PRE
  End;
End;

// INICIO HPC_201610_PRE
// SELECION DE DEPARTAMENTO
procedure TFrepxtipben.dblcdptoidChange(Sender: TObject);
var xsSQL : String;
begin
  xsSQL :=
     ' SELECT ''00'' OFDESID, ''TODAS LAS OFICINAS'' OFDESNOM FROM DUAL '
   + '  UNION ALL '
   + ' SELECT OFDESID, OFDESNOM '
   + '   FROM DB2ADMIN.APO110 '
   + '  WHERE DPTOID = ' + QuotedStr(dblcdptoid.Text)
   + '    AND DISTID IS NOT NULL '
   + '    AND OFDESNOM NOT LIKE ''BAZAR%'' '
   + '  ORDER BY OFDESID ';
  xxCdsQryOficina.Close;
  xxCdsQryOficina.DataRequest(xsSQL);
  xxCdsQryOficina.Open;
  cbOficina.LookupTable := xxCdsQryOficina;
  cbOficina.LookupField := 'OFDESID';
  cbOficina.Selected.Clear;
  cbOficina.Selected.Add('OFDESID'#9'2'#9'Oficina ID');
  cbOficina.Selected.Add('OFDESNOM'#9'20'#9'Oficina');
  cbOficina.LookupValue := xxCdsQryOficina.fieldbyname('OFDESID').AsString;

  If dblcdptoid.Text = '' Then medesdpto.Text := '';
  If Length(dblcdptoid.Text) = 2 then
  Begin
    If DM1.cdsDpto.Locate('DPTOID', dblcdptoid.Text, []) Then
    Begin
      medesdpto.Text := DM1.cdsDpto.FieldByName('DPTODES').AsString;
    End
    Else
    Begin
      MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
      dblcdptoid.Text := '';
      medesdpto.Text := '';
      dblctipben.SetFocus;
    End;
  End;
  limpia;
end;
// FIN HPC_201610_PRE

procedure TFrepxtipben.btnimprimirClick(Sender: TObject);
begin
  If rgtipben.ItemIndex = 0 Then
  Begin
    If dblcdptoid.Text = '' Then
    Begin
      ppltittod01.Caption := 'LIQUIDACIONES DE BENEFICIOS';
      ppltittod02.Caption := 'DEL '+dbdtpinicial.Text+' AL '+dbdtpfinal.Text;
      pplimpresopor02.Caption := 'Impreso por : '+DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
      pplcanrettod.Caption := FloatToStrF(canret, ffNumber, 15, 0);
      pplcaninvtod.Caption := FloatToStrF(caninv, ffNumber, 15, 0);
      pplcanfaltod.Caption := FloatToStrF(canfal, ffNumber, 15, 0);
      pplcantottod.Caption := FloatToStrF(canret+caninv+canfal, ffNumber, 15, 0);
      pplmonrettod.Caption := FloatToStrF(monret, ffNumber, 15, 2);
      pplmoninvtod.Caption := FloatToStrF(moninv, ffNumber, 15, 2);
      pplmonfaltod.Caption := FloatToStrF(monfal, ffNumber, 15, 2);
      pplmontottod.Caption := FloatToStrF(monret+moninv+monfal , ffNumber, 15, 2);
      // Inicio: SPP_201307_PRE
      If Trim(medesusuario.Text) <> '' Then
         pplUsuarioTodos.Caption := 'Usuario : '+ medesusuario.Text;
      // Fin: SPP_201307_PRE
      pprtodos.Print;
    End
    Else
    Begin
      ppltitdpt01.Caption := 'LIQUIDACIONES DE BENEFICIOS DEL DEPARTAMENTO DE : '+medesdpto.Text;
      ppltitdpt02.Caption := 'DEL '+dbdtpinicial.Text+' AL '+dbdtpfinal.Text;
      pplimpresopor01.Caption := 'Impreso por : '+DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
      pplcanretdpt.Caption := FloatToStrF(canret, ffNumber, 15, 0);
      pplcaninvdpt.Caption := FloatToStrF(caninv, ffNumber, 15, 0);
      pplcanfaldpt.Caption := FloatToStrF(canfal, ffNumber, 15, 0);
      pplcantotdpt.Caption := FloatToStrF(canret+caninv+canfal, ffNumber, 15, 0);
      pplmonretdpt.Caption := FloatToStrF(monret, ffNumber, 15, 2);
      pplmoninvdpt.Caption := FloatToStrF(moninv, ffNumber, 15, 2);
      pplmonfaldpt.Caption := FloatToStrF(monfal, ffNumber, 15, 2);
      pplmontotdpt.Caption := FloatToStrF(monret+moninv+monfal , ffNumber, 15, 2);
      // Inicio: SPP_201307_PRE
      If Trim(medesusuario.Text) <> '' Then
         pplUsuarioxDpto.Caption := 'Usuario : '+ medesusuario.Text;
      // Fin: SPP_201307_PRE
      pprrpxtipbendpto.Print;
    End;
  End
  Else
  Begin
    ppLabel40.Caption := 'DEL '+dbdtpinicial.Text+' AL '+dbdtpfinal.Text;
    // Inicio: HPC_201802_PRE
    // Se añade sub-titulo al reporte
    If rgorisol.ItemIndex = 0 Then ppltiprep.Caption := 'ORIGEN: SOLICITUD DEL BENEFICIARIO';
    If rgorisol.ItemIndex = 1 Then ppltiprep.Caption := 'ORIGEN: OFICIO INTERNO';
    If rgorisol.ItemIndex = 2 Then ppltiprep.Caption := 'ORIGEN: TODOS';
    // Fin: HPC_201802_PRE

    pplimpresopor03.Caption := 'Impreso por : '+DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
    // Inicio: SPP_201307_PRE
    If Trim(medesusuario.Text) <> '' Then
       pplUsuario.Caption := 'Usuario : '+ medesusuario.Text;
    // Fin: SPP_201307_PRE
    pprtipbenres.Print;
    pprtipbenres.Stop;
  End;
end;

procedure TFrepxtipben.ppDetailBand1BeforePrint(Sender: TObject);
begin
  If Trim(cdsbeneficios.FieldByName('ASOCODMOD').AsString) <> '' Then
  Begin
    pplfecben.Caption := cdsbeneficios.FieldByName('PVSLFECBE').AsString;
    pplpvslbennr.Caption := Copy(cdsbeneficios.FieldByName('PVSLBENNR').AsString,5,7);
  End
  Else
  Begin
    pplfecben.Caption := '';
    pplpvslbennr.Caption := '';
  End;
end;

// Inicio: HPC_201705_PRE
// Se modifica el nombre del procedimiento
// procedure TFrepxtipben.btnaexcelClick(Sender: TObject);
procedure TFrepxtipben.btnTipBenClick(Sender: TObject);
// Fin: HPC_201705_PRE
begin
   // Inicio: SPP_201305_PRE
   {
   If rgtipben.ItemIndex = 0 Then
   Begin
      DBGrid.DataSource := dsbeneficios;
      DM1.HojaExcel('REPORTE', dsbeneficios, DBGrid);
   End
   Else
   Begin
      DBGrid.DataSource := dsresumen;
      DM1.HojaExcel('REPORTE', dsresumen,DBGrid);
   End;
   }
   // Inicio: HPC_201709_PRE
   // Se modifica el procedimiento para exportar a excel
   // DM1.ExportaGridExcel(dbgliqben, 'PRE_DETXTIPBEN');
   // Inicio: HPC_201802_PRE
   // Se modifica el procedimiento para exportar a excel
   // DM1.cdsReporte1.Close;
   // DM1.cdsReporte1.DataRequest(xSqlAExcel);
   // DM1.cdsReporte1.Open;
   // DM1.HojaExcel('PRE_DETXTIPBEN',DM1.dsReporte1, dbgAExcel);
   DM1.ExportaGridExcel(dbgliqben, 'PRE_DETXTIPBEN');
   // Fin: HPC_201802_PRE
   // Fin: HPC_201709_PRE
   // Fin: SPP_201305_PRE
end;

// INICIO HPC_201610_PRE
// SELECCIONA TIPO DE BENEFICIO
procedure TFrepxtipben.rgtipbenClick(Sender: TObject);
begin
 limpia;
 If rgtipben.ItemIndex = 0 Then
 Begin
   dblctipben.Enabled := True;
   dblcdptoid.Enabled := True;
   cbOficina.Enabled := True;
   // Inicio: HPC_201802_PRE
   // Se se aigna valor al grupo origen de la solicitud
   rgorisol.ItemIndex := 2;
   // Fin: HPC_201802_PRE
 End
 Else
 Begin
   // Inicio: HPC_201802_PRE
   // Se se aigna valor al grupo origen de la solicitud
   rgorisol.ItemIndex := 2;
   // Fin: HPC_201802_PRE
   dblctipben.Text := '00';
   dblctipbenChange(nil);
   dblcdptoid.Text := '00';
   dblcdptoidChange(nil);
   cbOficina.Text := '00';
   cbOficinaChange(nil);
   dblctipben.Enabled := False;
   dblcdptoid.Enabled := False;
   cbOficina.Enabled := False;
 End;
end;
// FIN HPC_201610_PRE

procedure TFrepxtipben.ppDetailBand3BeforePrint(Sender: TObject);
begin
  If Trim(cdsbeneficios.FieldByName('ASOCODMOD').AsString) <> '' Then
  Begin
    pplfecbe.Caption := cdsbeneficios.FieldByName('PVSLFECBE').AsString;
    pplnumliq.Caption := Copy(cdsbeneficios.FieldByName('PVSLBENNR').AsString,5,7);
  End
  Else
  Begin
    pplfecbe.Caption := '';
    pplnumliq.Caption := '';
  End;
end;

Procedure TFrepxtipben.limpia;
Begin
  // Inicio: HPC_201705_PRE
  // Se modifica las condiciones para visualizar el grupo
  // de anulados
  If rgtipben.ItemIndex = 0 Then gbanulados.Visible := False
  Else gbanulados.Visible := True;

  If cdsresumen.Active = True Then cdsresumen.EmptyDataSet;
  If cdsbeneficios.Active = True Then cdsbeneficios.EmptyDataSet;
  If cdsAnulados.Active = True Then cdsAnulados.EmptyDataSet;
  dbgliqben.ColumnByName('CANRET').FooterValue := FormatFloat('###,###,##0',0);
  dbgliqben.ColumnByName('CANFAL').FooterValue := FormatFloat('###,###,##0',0);
  dbgliqben.ColumnByName('CANINV').FooterValue := FormatFloat('###,###,##0',0);
  dbgliqben.ColumnByName('CANTOT').FooterValue := FormatFloat('###,###,##0',0);
  dbgliqben.ColumnByName('MONRET').FooterValue := FormatFloat('###,###,###.#0',0);
  dbgliqben.ColumnByName('MONFAL').FooterValue := FormatFloat('###,###,###.#0',0);
  dbgliqben.ColumnByName('MONINV').FooterValue := FormatFloat('###,###,###.#0',0);
  dbgliqben.ColumnByName('MONTOT').FooterValue := FormatFloat('###,###,###.#0',0);
  dbgliqben.ColumnByName('MONBEN').FooterValue := FormatFloat('###,###.#0',0);
  dbgliqben.ColumnByName('AJUBEN').FooterValue := FormatFloat('###,###.#0',0);
  dbgliqben.ColumnByName('IMPPAG').FooterValue := FormatFloat('###,###.#0',0);
  // Inicio: HPC_201802_PRE
  // Se añade campo importe x pagar
  dbgliqben.ColumnByName('IMPXPAG').FooterValue := FormatFloat('###,###.#0',0);
  // Inicio: HPC_201802_PRE

  dbgliqben.Refresh;
// Inicio: SPP_201307_PRE
  btnimprimir.Enabled := False;
  // btnaexcel.Enabled := False;
  btnTipBen.Enabled := False;
  btnAnulado.Enabled := False;
  // Fin: HPC_201705_PRE

// Fin: SPP_201307_PRE
End;

procedure TFrepxtipben.dbdtpinicialChange(Sender: TObject);
begin
  limpia;
end;

procedure TFrepxtipben.dbdtpfinalChange(Sender: TObject);
begin
 limpia;
end;

// Inicio: SPP_201307_PRE
procedure TFrepxtipben.dblcdusuarioExit(Sender: TObject);
begin
   If dblcdusuario.Text = '' Then
   Begin
      medesusuario.Text := '';
      Exit;
   End;
   If DM1.cdsUsuarios.Locate('USERID', dblcdusuario.Text, []) Then
      medesusuario.Text := DM1.cdsUsuarios.FieldByName('USERNOM').AsString
   Else
   Begin
      MessageDlg('Usuario no valido', mtInformation, [mbOk], 0);
      dblcdusuario.Text := '';
      medesusuario.Text := '';
   End;
end;
// Fin: SPP_201307_PRE

// Inicio: SPP_201307_PRE
procedure TFrepxtipben.pplUsuarioTodosPrint(Sender: TObject);
begin
   If Trim(medesusuario.Text) = '' Then
      pplUsuarioTodos.Visible := False
   Else
      pplUsuarioTodos.Visible := True;
end;
// Fin: SPP_201307_PRE

// Inicio: SPP_201307_PRE
procedure TFrepxtipben.pplUsuarioPrint(Sender: TObject);
begin
   If Trim(medesusuario.Text) = '' Then
      pplUsuario.Visible := False
   Else
      pplUsuario.Visible := True;
end;
// Fin: SPP_201307_PRE

// Inicio: SPP_201307_PRE
procedure TFrepxtipben.pplUsuarioxDptoPrint(Sender: TObject);
begin
   If Trim(medesusuario.Text) = '' Then
      pplUsuarioxDpto.Visible := False
   Else
      pplUsuarioxDpto.Visible := True;
end;
// Fin: SPP_201307_PRE

// Inicio: SPP_201307_PRE
procedure TFrepxtipben.dblcdusuarioChange(Sender: TObject);
begin
  limpia;
end;
// Fin: SPP_201307_PRE

// INICIO HPC_201610_PRE
// MANEJO DEL EVENTO DE CAMBIO DE OFICINA
(******************************************************************************)
procedure TFrepxtipben.cbOficinaChange(Sender: TObject);
begin
  If cbOficina.Text = '' Then edtOficina.Text := '';
  If Length(cbOficina.Text) = 2 then Begin
    If xxCdsQryOficina.Locate('OFDESID', cbOficina.Text, []) Then Begin
      edtOficina.Text := xxCdsQryOficina.FieldByName('OFDESNOM').AsString;
    End Else Begin
      MessageDlg('SELECCIONE UNA OFICINA', mtInformation, [mbOk], 0);
      edtOficina.Text := '';
      cbOficina.SetFocus;
    End;
  End;
  limpia;
end;
// FIN HPC_201610_PRE

// INICIO HPC_201610_PRE
(******************************************************************************)
// MANEJO DEL EVENTO DE CIERRE DE FORMULARIO
procedure TFrepxtipben.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM1.cdsReporte.Close;
  Action := caFree
end;
// FIN HPC_201610_PRE
// Inicio: HPC_201705_PRE
// Se añade procedimiento para mostrar información en Excel
procedure TFrepxtipben.btnAnuladoClick(Sender: TObject);
begin
   DM1.ExportaGridExcel(dbganulados, 'PRE_RESXANULADO');
end;
// Fin: HPC_201705_PRE

// Inicio: HPC_201802_PRE
// Procedimiento para limpiar valores del grupo forma de solicitud
procedure TFrepxtipben.rgorisolClick(Sender: TObject);
begin
  limpia;
end;
// Fin: HPC_201802_PRE

end.
