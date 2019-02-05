// Inicio Uso Estándares: 01/08/2011
// Unidad : Previsión Social
// Formulario : Fnuegenofi
// Fecha de Creación : 08/08/2011
// Autor : Sistemas
// Objetivo : Generación de Oficios
// Actualizaciones
// HPP_200903_PRE : Se desarrolla la forma de pago cobro en caja derrama
// HPP_200904_PRE : Chequea los botones de impresión
// HPP_201103_PRE : Se añade codigo de banco a los reporte de libretas de ahorro
// HPC_201209_PRE : Se realiza la transferencia del oficio TIPO DE DESEMBOLSO "BANCO DE LA NACIÓN (DEPÓSITOS EN CTA.)"
// SPP_201301_PRE : El pase se realiza de acuerdo a lo indicado en el HPC_201209_PRE
// HPC_201302_PRE : En el reporte apertura de libretas de ahorro por donación. Se añade la dirección domiciliaria y telefono del beneficiario
// SPP_201303_PRE : El pase a producción se realiza a partir del HPC_201302_PRE
// HPC_201303_PRE : Se modifica reporte de "cuenta de ahorro" Debe decir Ref.: Apertura de Cuenta de Ahorro por Donaciòn.
// SPP_201304_PRE : Se realiza el pase a produccion a partir del HPC_201303_PRE
// HPC_201304_PRE : Se añade para tipo de apertura/deposito "Cuenta de ahorro" tipo de moneda (soles, dolares)
// SPP_201305_PRE : Se realiza el pase a producción a partir del HPC_201304_PRE
// HPC_201305_PRE : Se modifica la impresión de oficios de apertura y deposito de cuenta de ahooros.
//                  La impresión se debe hacer con oficios de soles y dolares.
// SPP_201306_PRE : Se realiza el pase a producción a partir del HPC_201305_PRE
// HPC_201307_PRE : Hitos de desembolso de de oficios (CON GENERACION DE DESEMBOLSO)
//                  Se añade nuevo logo institucional
// SPP_201401_PRE : Se realiza el pase a producción a partir del pase HPC_201307_PRE
// HPC_201402_PRE : Se añade a los reportes de oficios el apellido de casada.  
// SPP_201403_PRE : Se realiza el pase a producción a partir del pase HPC_201402_PRE.
// HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
// HPC_201702_PRE : Se retira el código para insertar registros en las tablas seguimiento de expedientes
//                  Solo se deja el flag que marca que el desembolso ya fue ejecutado
// HPC_201703_PRE : Se añade forma para exportar información de email y movil de los beneficiarios
// HPC_201704_PRE : Se añade el boton "Transferir a caja"
// HPC_201705_PRE : Se modifica el Qry para que tome el numero de oficio directamente del
//                  detalle de las liquidaciones.
//HPC_201706_PRE  : Se guarda en la tabla de transferencias a caja
//                  el numero de oficio completo  
//HPC_201803_PRE  : Se modificó en el Oficio de Depósito el simbolo y denominacion de moneda para el tipo
//                  soles. Los cambios solo se aplicaron en el formulario delphi.  


Unit PRE249;
Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Grids, Wwdbigrd, Wwdbgrid, Buttons, StdCtrls, ComCtrls, ppDB, DB,
   ppDBPipe, ppDBBDE, ppBands, ppCtrls, ppClass, ppVar, ppPrnabl, ppCache,
   // Inicio: HPC_201703_PRE 
   // Se añade unidad DBGrids
   // ppComm, ppRelatv, ppProd, ppReport, ppParameter, jpeg; // SPP_201401_PRE
   ppComm, ppRelatv, ppProd, ppReport, ppParameter, jpeg, DBGrids; // SPP_201401_PRE
   // Fin: HPC_201703_PRE
Type
   TFnuegenofi = Class(TForm)
      btncerrar: TBitBtn;
      pgoficios: TPageControl;
      TabSheet1: TTabSheet;
      TabSheet2: TTabSheet;
      dbgoficios: TwwDBGrid;
      dbgoficiosIButton: TwwIButton;
      dbgdetalle: TwwDBGrid;
      btnimpofi: TBitBtn;
      ppRepGiro: TppReport;
      ppHeaderBand2: TppHeaderBand;
      ppLabel96: TppLabel;
      ppSystemVariable3: TppSystemVariable;
      ppLine25: TppLine;
//Inicio: SPP_201401_PRE
      // ppImage4: TppImage; 
      // ppLabel97: TppLabel; 
      // ppLabel98: TppLabel; 
//Fin: SPP_201401_PRE
      pplfechalugarG: TppLabel;
      ppDetailBand2: TppDetailBand;
      ppDBText1: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppLabel24: TppLabel;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      pplOficioG: TppLabel;
      ppLabel6: TppLabel;
      ppLabel5: TppLabel;
      pplblAtencion: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLine1: TppLine;
      ppLabel12: TppLabel;
      ppLabel20: TppLabel;
      ppLabel21: TppLabel;
      ppLabel22: TppLabel;
      ppLabel23: TppLabel;
      ppLabel4: TppLabel;
      ppLabel61: TppLabel;
      ppLine2: TppLine;
      pplrepresentanteG: TppLabel;
      pplbancoG: TppLabel;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppLine5: TppLine;
      ppLabel19: TppLabel;
      ppDBCalc1: TppDBCalc;
      ppLabel25: TppLabel;
      ppLabel26: TppLabel;
      ppLabel27: TppLabel;
      ppDBCalc2: TppDBCalc;
      ppLine6: TppLine;
      ppLabel15: TppLabel;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
      ppLabel18: TppLabel;
      ppLine3: TppLine;
      ppLabel13: TppLabel;
      ppLine4: TppLine;
      ppLabel14: TppLabel;
      ppLine13: TppLine;
      ppLabel62: TppLabel;
      ppLabel63: TppLabel;
      ppLabel64: TppLabel;
      ppRepApeLib: TppReport;
      ppRepTeleahorro: TppReport;
      ppHeaderBand4: TppHeaderBand;
      pplfechalugarA: TppLabel;
      ppLabel82: TppLabel;
      ppSystemVariable2: TppSystemVariable;
      ppLine19: TppLine;
//Inicio: SPP_201401_PRE
      // ppImage3: TppImage;  
      // ppLabel84: TppLabel; 
      // ppLabel85: TppLabel; 
//Fin: SPP_201401_PRE
      ppDetailBand4: TppDetailBand;
      ppDBText20: TppDBText;
      ppDBText22: TppDBText;
      ppLabel3: TppLabel;
      ppDBText23: TppDBText;
      ppSummaryBand3: TppSummaryBand;
      ppLabel77: TppLabel;
      ppLabel79: TppLabel;
      ppLabel86: TppLabel;
      ppLabel87: TppLabel;
      ppLine21: TppLine;
      ppLabel88: TppLabel;
      ppLine22: TppLine;
      ppLabel89: TppLabel;
      ppLine24: TppLine;
      ppLabel93: TppLabel;
      ppLabel94: TppLabel;
      ppLabel95: TppLabel;
      ppGroup3: TppGroup;
      ppGroupHeaderBand3: TppGroupHeaderBand;
      pplOficioA: TppLabel;
      ppLabel68: TppLabel;
      ppLabel69: TppLabel;
      ppLabel71: TppLabel;
      ppLabel72: TppLabel;
      ppLabel73: TppLabel;
      ppLabel74: TppLabel;
      ppLine17: TppLine;
      ppLine18: TppLine;
      ppLabel75: TppLabel;
      ppLabel78: TppLabel;
      ppLabel80: TppLabel;
      ppLabel81: TppLabel;
      ppLabel83: TppLabel;
      pplbancoA: TppLabel;
      ppGroupFooterBand3: TppGroupFooterBand;
      ppLine20: TppLine;
      ppLabel30: TppLabel;
      ppDBCalc5: TppDBCalc;
      ppLabel90: TppLabel;
      ppLabel91: TppLabel;
      ppLabel92: TppLabel;
      ppDBCalc6: TppDBCalc;
      ppLine23: TppLine;
      ppbdepimprime: TppBDEPipeline;
      pplcuentaG: TppLabel;
      ppLabel101: TppLabel;
      ppParameterList1: TppParameterList;
      btngraba: TBitBtn;
      btnofcape: TBitBtn;
      btnofcdep: TBitBtn;
    pprDepLibDol: TppReport;  // SPP_201305_PRE
      ppHeaderBand1: TppHeaderBand;
//Inicio: SPP_201401_PRE
      // ppLabel43: TppLabel; 
      // ppLabel66: TppLabel; 
      pplfechalugarLD: TppLabel;
      ppLine14: TppLine;
      // ppImage2: TppImage; 
//Fin: SPP_201401_PRE
      ppLabel99: TppLabel;
      ppSystemVariable4: TppSystemVariable;
      ppDetailBand1: TppDetailBand;
      ppDBText2: TppDBText;
      ppDBText5: TppDBText;
      ppGroup4: TppGroup;
      ppGroupHeaderBand4: TppGroupHeaderBand;
      ppLabel103: TppLabel;
      ppLabel104: TppLabel;
      ppLabel105: TppLabel;
      ppLabel106: TppLabel;
      ppLabel107: TppLabel;
      pplbancoLD: TppLabel;
      pplrepresentanteLD: TppLabel;
      ppLabel110: TppLabel;
      ppLabel111: TppLabel;
      ppLabel112: TppLabel;
      ppLine26: TppLine;
      ppLabel113: TppLabel;
      ppLine27: TppLine;
      ppLabel114: TppLabel;
      ppLabel115: TppLabel;
      ppLabel116: TppLabel;
      ppLabel117: TppLabel;
      ppGroupFooterBand4: TppGroupFooterBand;
      ppLine28: TppLine;
      ppLine29: TppLine;
      ppLabel118: TppLabel;
      ppLabel119: TppLabel;
      ppDBCalc7: TppDBCalc;
      ppLabel120: TppLabel;
      ppLabel121: TppLabel;
      ppDBCalc8: TppDBCalc;
      ppLabel122: TppLabel;
      ppLabel123: TppLabel;
      ppLabel124: TppLabel;
      ppLabel125: TppLabel;
      ppLabel126: TppLabel;
      ppLabel127: TppLabel;
      ppLabel128: TppLabel;
      ppLabel129: TppLabel;
      ppLabel130: TppLabel;
      ppLine30: TppLine;
      ppLabel131: TppLabel;
      ppLine31: TppLine;
      ppLabel132: TppLabel;
      ppLine32: TppLine;
      ppLabel133: TppLabel;
      ppLabel134: TppLabel;
      ppLabel135: TppLabel;
      // pplcodcueban: TppLabel; SPP_201306_PRE
      pplcodcuebanLD: TppLabel; // SPP_201306_PRE
      ppParameterList2: TppParameterList;
      ppHeaderBand3: TppHeaderBand;
//Inicio: SPP_201401_PRE
      // ppLabel28: TppLabel; 
      // ppLabel29: TppLabel; 
      pplfechalugarL: TppLabel;
      ppLine16: TppLine;
      // ppImage1: TppImage; 
//Fin: SPP_201401_PRE
      ppLabel1: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppDetailBand3: TppDetailBand;
      ppDBText11: TppDBText;
      ppDBText13: TppDBText;
      ppDBText14: TppDBText;
      ppDBText15: TppDBText;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      pplOficioL: TppLabel;
      ppLabel33: TppLabel;
      ppLabel34: TppLabel;
      ppLabel35: TppLabel;
      ppLabel36: TppLabel;
      ppLabel31: TppLabel;
      pplbancoL: TppLabel;
      pplrepresentanteL: TppLabel;
      ppLabel32: TppLabel;
      ppLabel37: TppLabel;
    ppllintipmon: TppLabel; // SPP_201305_PRE
      ppLine7: TppLine;
      ppLabel39: TppLabel;
      ppLine8: TppLine;
      ppLabel42: TppLabel;
      ppLabel40: TppLabel;
      ppLabel44: TppLabel;
      ppLabel41: TppLabel;
      ppLabel45: TppLabel;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppLine9: TppLine;
      ppLabel55: TppLabel;
      ppLabel56: TppLabel;
      ppLabel57: TppLabel;
      ppLabel58: TppLabel;
      ppLine11: TppLine;
      ppLabel59: TppLabel;
      ppLine12: TppLine;
      ppLabel60: TppLabel;
      ppLine15: TppLine;
      ppLabel65: TppLabel;
      ppLabel137: TppLabel;
      ppLabel138: TppLabel;
      ppDBText6: TppDBText;
      pplOficioLD: TppLabel;
      pplfecgenofc: TppLabel;
      // ppLabel11: TppLabel; SPP_201306_PRE
      // ppLabel46: TppLabel; SPP_201306_PRE
      pplfecgenLD: TppLabel;  // SPP_201306_PRE
      pprchegen: TppReport;
      ppHeaderBand5: TppHeaderBand;
      pplfeccheger: TppLabel;
      ppLabel48: TppLabel;
      ppSystemVariable5: TppSystemVariable;
//Inicio: SPP_201401_PRE
      // ppImage5: TppImage; 
      // ppLabel49: TppLabel; 
      // ppLabel50: TppLabel; 
//Fin: SPP_201401_PRE
      ppDetailBand5: TppDetailBand;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppDBText12: TppDBText;
      ppSummaryBand1: TppSummaryBand;
      ppLabel52: TppLabel;
      ppLabel53: TppLabel;
      ppLabel54: TppLabel;
      ppLabel67: TppLabel;
      ppLine33: TppLine;
      ppLabel100: TppLabel;
      ppLine34: TppLine;
      ppLabel102: TppLabel;
      ppLine35: TppLine;
      ppLabel108: TppLabel;
      ppLabel109: TppLabel;
      ppLabel139: TppLabel;
      pplnumoficheger: TppLabel;
      ppLabel147: TppLabel;
      ppLine36: TppLine;
      ppLine37: TppLine;
      ppLabel150: TppLabel;
      ppLabel151: TppLabel;
      ppLine38: TppLine;
      ppLabel47: TppLabel;
      ppLabel51: TppLabel;
      ppDBCalc3: TppDBCalc;
      ppDBCalc4: TppDBCalc;
      ppLine10: TppLine;
      ppLabel76: TppLabel;
      ppDBText16: TppDBText;
      pplgenerado_por: TppLabel;
      ppLabel140: TppLabel;
      ppLabel141: TppLabel;
      // Inicio: HPC_201703_PRE
      // Se retira boton no usado
      // btntransacaja: TBitBtn;
      // Fin: HPC_201703_PRE
      ppLine39: TppLine;
      ppLabel70: TppLabel;
    ppLabel136: TppLabel;
    ppldireccion: TppLabel;
    ppltelefono: TppLabel;
    // Inicio: SPP_201305_PRE
    pprDepLibSol: TppReport;
    ppHeaderBand6: TppHeaderBand;
//Inicio: SPP_201401_PRE
    // ppLabel38: TppLabel; 
    // ppLabel142: TppLabel; 
    // ppLabel143: TppLabel; SPP_201306_PRE
    pplfechalugarLS: TppLabel; // SPP_201306_PRE
    ppLine40: TppLine;
    // ppImage6: TppImage; 
//Fin: SPP_201401_PRE
    ppLabel144: TppLabel;
    ppSystemVariable6: TppSystemVariable;
    ppDetailBand6: TppDetailBand;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    // ppLabel145: TppLabel; SPP_201306_PRE
    pplOficioLS: TppLabel; // SPP_201306_PRE
    ppLabel146: TppLabel;
    ppLabel148: TppLabel;
    ppLabel149: TppLabel;
    ppLabel152: TppLabel;
    ppLabel153: TppLabel;
    // ppLabel154: TppLabel; SPP_201306_PRE
    // ppLabel155: TppLabel; SPP_201306_PRE
    pplbancoLS: TppLabel;  // SPP_201306_PRE
    pplrepresentanteLS: TppLabel; // SPP_201306_PRE
    ppLabel156: TppLabel;
    ppLabel157: TppLabel;
    ppLabel158: TppLabel;
    ppLine41: TppLine;
    ppLabel159: TppLabel;
    ppLine42: TppLine;
    ppLabel160: TppLabel;
    ppLabel161: TppLabel;
    ppLabel162: TppLabel;
    ppLabel163: TppLabel;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppLine43: TppLine;
    ppLine44: TppLine;
    ppLabel164: TppLabel;
    ppLabel165: TppLabel;
    ppDBCalc9: TppDBCalc;
    ppLabel166: TppLabel;
    ppLabel167: TppLabel;
    ppDBCalc10: TppDBCalc;
    ppLabel168: TppLabel;
    ppLabel169: TppLabel;
    ppLabel170: TppLabel;
    ppLabel171: TppLabel;
    ppLabel172: TppLabel;
    ppLabel173: TppLabel;
    ppLabel174: TppLabel;
    ppLabel175: TppLabel;
    ppLabel176: TppLabel;
    ppLine45: TppLine;
    ppLabel177: TppLabel;
    ppLine46: TppLine;
    ppLabel178: TppLabel;
    ppLine47: TppLine;
    ppLabel179: TppLabel;
    ppLabel180: TppLabel;
    ppLabel181: TppLabel;
    // ppLabel182: TppLabel; SPP_201306_PRE
    // ppLabel183: TppLabel; SPP_201306_PRE
    // ppLabel184: TppLabel; SPP_201306_PRE
    pplcodcuebanLS: TppLabel; // SPP_201306_PRE
    pplfecgenLS: TppLabel;    // SPP_201306_PRE
    ppParameterList3: TppParameterList;
    //Inicio: SPP_201401_PRE
    btnDesembolsado: TBitBtn;
    ppImage4: TppImage;
    ppImage3: TppImage;
    ppImage5: TppImage;
    ppImage1: TppImage;
    ppImage6: TppImage;
    ppImage2: TppImage;
    // Inicio: HPC_201703_PRE
    // Se añade botón para llamar a la forma exportar EMAIL y MOVIL de los beneficiarios
    btnexportar: TBitBtn;
    // Inicio: HPC_201704_PRE
    // Se añade boton transferir a caja
    btntransacaja: TBitBtn;
    // Fin: HPC_201704_PRE
    // Fin: HPC_201703_PRE
    //Fin: SPP_201401_PRE
    // Fin: SPP_201305_PRE
      Procedure FormActivate(Sender: TObject);
      Procedure pgoficiosChange(Sender: TObject);
      Procedure dbgoficiosIButtonClick(Sender: TObject);
      Procedure btncerrarClick(Sender: TObject);
      Procedure btngrabaClick(Sender: TObject);
      Procedure ppRepGiroPrintingComplete(Sender: TObject);
      Procedure ppRepTeleahorroPrintingComplete(Sender: TObject);
      Procedure pprDepLibDolPrintingComplete(Sender: TObject); // SPP_201305_PRE
      Procedure ppRepApeLibPrintingComplete(Sender: TObject);
      Procedure btnofcapeClick(Sender: TObject);
      Procedure btnofcdepClick(Sender: TObject);
      Procedure dbgoficiosDblClick(Sender: TObject);
      Procedure btnimpofiClick(Sender: TObject);
      Function SumaChecksum(xCuenta: String): Double;
      Function TotRegAbonos(): Integer;
      Function VerificaCadena(xCadena: String): String;
      Procedure actdetgrid;
      procedure btntransacajaClick(Sender: TObject);
    procedure ppDBText11Print(Sender: TObject);
    procedure btnDesembolsadoClick(Sender: TObject); //SPP_201401_PRE
    // Inicio: HPC_201703_PRE
    // procedimiento que llama a la forma de exportar registros a excel del movil y email del beneficiario 
    procedure btnexportarClick(Sender: TObject);
    // Fin: HPC_201703_PRE
    
   Private
    { Private declarations }
// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
      sBuscaFechas : String;
// Fin    HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
   Public
    { Public declarations }
   End;
Var
   Fnuegenofi: TFnuegenofi;
Implementation
// Inicio: HPC_201703_PRE
// Se añade la unidad PRE293 (Exportar información a excel del los email y movil de los beneficiarios)
// Uses PREDM, PRE251;
Uses PREDM, PRE251, PRE293;
// Fin: HPC_201703_PRE

{$R *.dfm}

Procedure TFnuegenofi.FormActivate(Sender: TObject);
Var
   xSql: String;
Begin
   //Inicio: SPP_201401_PRE
   // Inicio: HPC_201705_PRE
   // Se retira del campo "NOFID" el año del correlativo. El dato ya se incluyo en el campo al momento de la grabación.
   // xSql := 'SELECT A.CREANO||A.NOFID NOFID, B.BANCOABR, C.TIPDESEDES, A.MONTOTOT, A.FECINIC, A.FECFIN, A.OFIESTADO, A.FREG, A.CREUSER, A.BANCOID, A.TIPDESEID,'
   xSql := 'SELECT A.NOFID, B.BANCOABR, C.TIPDESEDES, A.MONTOTOT, A.FECINIC, A.FECFIN, A.OFIESTADO, A.FREG, A.CREUSER, A.BANCOID, A.TIPDESEID,'
   // +' A.CCBCOID, A.APENOMREPBAN, A.USUIMPAPE, A.FECIMPAPE, A.USUIMPDEP, A.FECIMPDEP, A.MONTDES, A.CREANO, A.CREMES, A.NUMREGOFI FROM PVS203 A, TGE105 B, CRE104 C'
   //   +' A.CCBCOID, A.APENOMREPBAN, A.USUIMPAPE, A.FECIMPAPE, A.USUIMPDEP, A.FECIMPDEP, A.MONTDES, A.CREANO, A.CREMES, A.NUMREGOFI, A.TMONID FROM PVS203 A, TGE105 B, CRE104 C'
   +' A.CCBCOID, A.APENOMREPBAN, A.USUIMPAPE, A.FECIMPAPE, A.USUIMPDEP, A.FECIMPDEP, A.MONTDES, A.CREANO, A.CREMES, A.NUMREGOFI, A.TMONID, A.FLGDESOFI FROM PVS203 A, TGE105 B, CRE104 C'
   //Fin: SPP_201401_PRE
   //+' WHERE A.BANCOID = B.BANCOID AND A.TIPDESEID = C.TIPDESEID ORDER BY A.CREANO||A.NOFID DESC';
   +' WHERE A.BANCOID = B.BANCOID AND A.TIPDESEID = C.TIPDESEID ORDER BY A.NOFID DESC';
   // Fin: HPC_201705_PRE
   // Fin: SPP_201305_PRE
   DM1.cdsOficio.Close;
   DM1.cdsOficio.DataRequest(xSql);
   DM1.cdsOficio.Open;
   TNumericField(DM1.cdsOficio.FieldByName('MONTOTOT')).DisplayFormat := '###,###,##0.00';
   dbgoficios.Selected.Clear;
   dbgoficios.Selected.Add('NOFID'#9'11'#9'Número~de oficio'#9#9);
   dbgoficios.Selected.Add('BANCOABR'#9'15'#9'Banco~de desembolso'#9#9);
   dbgoficios.Selected.Add('TIPDESEDES'#9'35'#9'Forma de~desembolso'#9#9);
   dbgoficios.Selected.Add('MONTOTOT'#9'10'#9'Monto total~del oficio'#9#9);
   dbgoficios.Selected.Add('TMONID'#9'1'#9'Tipo de~moneda'#9#9); // SPP_201305_PRE
   dbgoficios.Selected.Add('NUMREGOFI'#9'6'#9'Número de~Registros'#9#9);
   dbgoficios.Selected.Add('FECINIC'#9'10'#9'Fecha~inicial'#9#9);
   dbgoficios.Selected.Add('FECFIN'#9'10'#9'Fecha~final'#9#9);
   dbgoficios.Selected.Add('OFIESTADO'#9'10'#9'Estado del~oficio'#9#9);
   dbgoficios.Selected.Add('FREG'#9'10'#9'Fecha de~generación'#9#9);
   dbgoficios.Selected.Add('CREUSER'#9'15'#9'Usuario que~generó'#9#9);
   // Inicio: HPC_201702_PRE
   // Se añade la columna para mostrar le ejecución del desembolso de oficio
   dbgoficios.Selected.Add('FLGDESOFI'#9'1'#9'Desembolso~de oficio'#9#9);
   // Fin: HPC_201702_PRE
   dbgoficios.ApplySelected;
   pgoficios.TabIndex := 0;
End;

Procedure TFnuegenofi.pgoficiosChange(Sender: TObject);
Begin
   If pgoficios.TabIndex = 1 Then
   Begin
      actdetgrid;
   End;
End;

Procedure TFnuegenofi.dbgoficiosIButtonClick(Sender: TObject);
Var
   xSql: String;
Begin
   Try
      Fnueofi := TFnueofi.create(Self);
      Fnueofi.ShowModal;
   Finally
      Fnueofi.Free;
   End;
   // Inicio: SPP_201305_PRE
   // xSql := 'SELECT A.CREANO||A.NOFID NOFID, B.BANCOABR, C.TIPDESEDES, A.MONTOTOT, A.FECINIC, A.FECFIN, A.OFIESTADO, A.FREG, A.CREUSER, A.BANCOID, A.TIPDESEID, A.CCBCOID, A.APENOMREPBAN, A.USUIMPAPE, A.FECIMPAPE, A.USUIMPDEP, A.FECIMPDEP,'
   // +' A.MONTDES, A.CREANO, A.CREMES, A.NUMREGOFI FROM PVS203 A, TGE105 B, CRE104 C WHERE A.BANCOID   = B.BANCOID AND A.TIPDESEID = C.TIPDESEID ORDER BY A.CREANO||A.NOFID DESC';
   // Inicio: HPC_201705_PRE
   // Se retira del campo "NOFID" el año del correlativo. El dato ya se incluyo en el campo al momento de la grabación.
   // xSql := 'SELECT A.CREANO||A.NOFID NOFID, B.BANCOABR, C.TIPDESEDES, A.MONTOTOT, A.TMONID, A.FECINIC, A.FECFIN, A.OFIESTADO, A.FREG, A.CREUSER, A.BANCOID, A.TIPDESEID, A.CCBCOID, A.APENOMREPBAN, A.USUIMPAPE, A.FECIMPAPE, A.USUIMPDEP, A.FECIMPDEP,'
   xSql := 'SELECT A.NOFID, B.BANCOABR, C.TIPDESEDES, A.MONTOTOT, A.TMONID, A.FECINIC, A.FECFIN, A.OFIESTADO, A.FREG, A.CREUSER, A.BANCOID, A.TIPDESEID, A.CCBCOID, A.APENOMREPBAN, A.USUIMPAPE, A.FECIMPAPE, A.USUIMPDEP, A.FECIMPDEP,'   
   //Inicio: SPP_201401_PRE
   // +' A.MONTDES, A.CREANO, A.CREMES, A.NUMREGOFI FROM PVS203 A, TGE105 B, CRE104 C WHERE A.BANCOID   = B.BANCOID AND A.TIPDESEID = C.TIPDESEID ORDER BY A.CREANO||A.NOFID DESC';
   // +' A.MONTDES, A.CREANO, A.CREMES, A.NUMREGOFI, A.FLGDESOFI FROM PVS203 A, TGE105 B, CRE104 C WHERE A.BANCOID   = B.BANCOID AND A.TIPDESEID = C.TIPDESEID ORDER BY A.CREANO||A.NOFID DESC';
   +' A.MONTDES, A.CREANO, A.CREMES, A.NUMREGOFI, A.FLGDESOFI FROM PVS203 A, TGE105 B, CRE104 C WHERE A.BANCOID   = B.BANCOID AND A.TIPDESEID = C.TIPDESEID ORDER BY A.NOFID DESC';
   // Fin: HPC_201705_PRE
   //Fin: SPP_201401_PRE
   // Fin: SPP_201305_PRE



   DM1.cdsOficio.Close;
   DM1.cdsOficio.DataRequest(xSql);
   DM1.cdsOficio.Open;
   DM1.cdsOficio.Locate('NOFID', DM1.numerooficio, []);
   dbgoficios.Refresh;

End;

Procedure TFnuegenofi.btncerrarClick(Sender: TObject);
Begin
   Fnuegenofi.Close;
End;

Procedure TFnuegenofi.btngrabaClick(Sender: TObject);
Var
   xnomarc, Importe, fichero, xNombre, Entero, Decimal: String;
   f: textfile;
   xLinea: String;
   xFalta: Integer;
   xImpCar, Linea, Cabecera, ChecSum, TotReg: String;
Begin
   If DM1.cdsOficio.FieldByName('TIPDESEID').AsString = '05' Then
   Begin
      xnomarc := 'C:\GP' + Copy(DM1.cdsOficio.FieldByName('FECFIN').AsString, 7, 4) + Copy(DM1.cdsOficio.FieldByName('FECFIN').AsString, 4, 2) + Copy(DM1.cdsOficio.FieldByName('FECFIN').AsString, 1, 2) + '.TXT';
      fichero := xnomarc;
      AssignFile(f, fichero);
      Rewrite(f);
      DM1.cdsDocPago.First;
      While Not DM1.cdsDocPago.Eof Do
      Begin
         xLinea := '11230022';
         xLinea := xLinea + DM1.cdsDocPago.FieldByName('AGENBCOID').AsString;
         xNombre := Copy(DM1.cdsDocPago.FieldByName('PVSNOMBRE').AsString, 1, 30);
         If Length(xNombre) < 30 Then
         Begin
            xFalta := 30 - Length(xNombre);
            For xFalta := 0 To xFalta - 1 Do
               xNombre := xNombre + ' ';
         End;
         xLinea := xLinea + xNombre;
         xLinea := xLinea + DM1.cdsDocPago.FieldByName('PVSLDNIBEN').AsString;
         Importe := FormatFloat('######.#0', DM1.cdsDocPago.FieldByName('PVSLMONTO').AsFloat);
         Entero := Copy(DM1.StrZero(Importe, 16), 1, 13);
         Decimal := Copy(DM1.StrZero(Importe, 16), 15, 2);
         xLinea := xLinea + Entero;
         xLinea := xLinea + Decimal;
         xLinea := xLinea + '1180';
         writeln(f, xlinea);
         DM1.cdsDocPago.Next;
      End;
      CloseFile(f);
      MessageDlg('Se grabó con Exito el archivo TXT', mtInformation, [mbOk], 0);
   End;
   If DM1.cdsOficio.FieldByName('TIPDESEID').AsString = '16' Then
   Begin
      xnomarc := 'C:\GP' + Copy(DM1.cdsOficio.FieldByName('FECFIN').AsString, 7, 4) + Copy(DM1.cdsOficio.FieldByName('FECFIN').AsString, 4, 2) + Copy(DM1.cdsOficio.FieldByName('FECFIN').AsString, 1, 2) + '.TXT';
      fichero := xnomarc;
      AssignFile(f, Fichero);
      Rewrite(f);
      xImpCar := FormatFloat('######.#0', DM1.cdsOficio.FieldByName('MONTOTOT').AsFloat);
      Entero := Copy(DM1.StrZero(xImpCar, 16), 1, 13);
      Decimal := Copy(DM1.StrZero(xImpCar, 16), 15, 2);
      ChecSum := DM1.StrZero(FloatToStr(SumaChecksum('00625395')), 15);
      TotReg := DM1.StrZero(IntToStr(TotRegAbonos()), 6);
      Cabecera := '';
      Cabecera := '#1PC19400625395020      S/' + Entero + Decimal + Copy(DateToStr(DM1.FechaSys), 1, 2) + Copy(DateToStr(DM1.FechaSys), 4, 2) + Copy(DateToStr(DM1.FechaSys), 7, 4) + '-DERRAMAMAGISTERIAL-' + ChecSum + TotReg + '0' + DM1.StrSpace(' ', 15) + '1';
      writeln(f, Cabecera);
      DM1.cdsDocPago.First;
      While Not DM1.cdsDocPago.Eof Do
      Begin
         Linea := '';
         Importe := FormatFloat('######.#0', DM1.cdsDocPago.FieldByName('PVSLMONTO').AsCurrency);
         Entero := Copy(DM1.StrZero(Importe, 16), 1, 13);
         Decimal := Copy(DM1.StrZero(Importe, 16), 15, 2);
         Linea := DM1.StrSpace(' ', 1) + '0' + 'G' + DM1.StrSpace(' ', 20) + VerificaCadena(Copy(Trim(DM1.cdsDocPago.FieldByName('PVSNOMBRE').AsString), 1, 40)) + 'S/' + Entero + Decimal + 'RUC' + DM1.cdsDocPago.FieldByName('DNIRUC').AsString + ' ' + 'F' + Trim(DM1.cdsDocPago.FieldByName('NUMCHEGER').AsString) + '1' + VerificaCadena('DESEMBOLSO CHEQUES DE GERENCIA') + '000';
         writeln(f, Linea);
         DM1.cdsDocPago.Next;
      End;
      CloseFile(f);
      MessageDlg('Se grabó con Exito el archivo TXT', mtInformation, [mbOk], 0);
   End;
End;

Procedure TFnuegenofi.ppRepGiroPrintingComplete(Sender: TObject);
Begin
   DM1.xSgr := 'S';
End;

Procedure TFnuegenofi.ppRepTeleahorroPrintingComplete(Sender: TObject);
Begin
   DM1.xSgr := 'S';
End;

Procedure TFnuegenofi.pprDepLibDolPrintingComplete(Sender: TObject); // SPP_201305_PRE
Begin
   DM1.xSgr := 'DL';
End;

Procedure TFnuegenofi.ppRepApeLibPrintingComplete(Sender: TObject);
Begin
   DM1.xSgr := 'AL';
End;

Procedure TFnuegenofi.btnofcapeClick(Sender: TObject);
Var
   xSql, xrepresentante, xfechalugar, xoficio, xbanco, xcuenta: String;
   xAno, xMes, xDia: Word;
   oficio: String;
Begin
   If DM1.cdsOficio.FieldByName('USUIMPAPE').AsString <> '' Then
   Begin
      If MessageDlg('El oficio ya fue impreso por ' + DM1.cdsOficio.FieldByName('USUIMPAPE').AsString + ', con fecha ' + DM1.cdsOficio.FieldByName('FECIMPAPE').AsString
         + #13 + '¿ Desea volver a imprimir ?', mtConfirmation, [mbYes, mbNo], 0) = mrno Then
         Exit;
   End;
   oficio := DM1.cdsOficio.FieldByName('NOFID').AsString;
   DecodeDate(Date, xAno, xMes, xDia);
   xSql := 'SELECT CIALUGAR FROM TGE101 WHERE CNTCONSOL =' + QuotedStr('S');
   DM1.cdsQry1.Close;
   DM1.cdsQry1.DataRequest(xSQL);
   DM1.cdsQry1.Open;
   xfechalugar := DM1.cdsQry1.FieldByName('CIALUGAR').AsString + ', ' + DM1.StrZero(CurrToStr(xDia), 2) + ' de ' + DM1.NombreMes(CurrToStr(xMes)) + ' del ' + CurrToStr(xAno);
   xoficio := 'OFICIO N° ' + Copy(DM1.cdsOficio.FieldByName('NOFID').AsString, 5, 7) + '-' + Copy(DM1.cdsOficio.FieldByName('NOFID').AsString, 1, 4) + '-DM-BENEFICIOS';
   xSql := 'SELECT BANCONOM FROM TGE105 WHERE BANCOID = ' + QuotedStr(DM1.cdsOficio.FieldByname('BANCOID').AsString);
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   xbanco := DM1.cdsQry.FieldByName('BANCONOM').AsString;
   xcuenta := DM1.cdsOficio.FieldByName('CCBCOID').AsString;
   xrepresentante := DM1.cdsOficio.FieldByName('APENOMREPBAN').AsString;
   pplOficioL.Caption := xoficio;
   pplfechalugarL.Caption := xfechalugar;
   pplrepresentanteL.Caption := xrepresentante;
   pplbancoL.Caption := xbanco;
   // Inicio: SPP_201306_PRE
   // pplfecgenofc.Caption := 'Fecha Generación : ' + Copy(DM1.cdsOficio.FieldByName('FREG').AsString, 1, 10);
   pplfecgenofc.Caption := 'Fecha de generación de oficio: ' + Copy(DM1.cdsOficio.FieldByName('FREG').AsString, 1, 10);
   // Fin: SPP_201306_PRE
   // Inicio: SPP_201305_PRE
   If DM1.cdsOficio.FieldByName('TMONID').AsString = 'D' Then ppllintipmon.Caption := 'Ahorros por DONACION en Moneda Extranjera (dólar) a favor de los siguientes menores:';
   If DM1.cdsOficio.FieldByName('TMONID').AsString = 'S' Then ppllintipmon.Caption := 'Ahorros por DONACION en Moneda de Nuevos Soles a favor de los siguientes menores:';
   // Fin: SPP_201305_PRE
   ppRepApeLib.Print;
   ppRepApeLib.Stop;
   If DM1.xSgr = 'AL' Then
   Begin
      xSql := 'UPDATE PVS203 '
            + '   SET USUIMPAPE = ' + QuotedStr(DM1.wUsuario)
            + '     , FECIMPAPE = SYSDATE'
           // Inicio: HPC_201705_PRE
           // Se modifica las condiciones de la actualización.
           //  + ' WHERE CREANO||NOFID = ' + QuotedStr(oficio);
           + ' WHERE NOFID = ' + QuotedStr(oficio);
           // Fin: HPC_201705_PRE

      DM1.DCOM1.AppServer.EjecutaSql(xSql);
      // Inicio: HPC_201705_PRE
      // Se modifica las condiciones del select.
      // xSql := 'SELECT A.CREANO||A.NOFID NOFID, B.BANCOABR, C.TIPDESEDES, A.MONTOTOT,'
      xSql := 'SELECT A.NOFID, B.BANCOABR, C.TIPDESEDES, A.MONTOTOT,'
            + '       A.FECINIC, A.FECFIN, A.OFIESTADO, A.FREG, A.CREUSER, A.BANCOID, '
            + '       A.TIPDESEID, A.CCBCOID, A.APENOMREPBAN, A.USUIMPAPE, '
            + '       A.FECIMPAPE, A.USUIMPDEP, A.FECIMPDEP,'
      // Inicio: SPP_201306_PRE
      //    +'        A.NUMREGOFI, A.CREANO, A.CREMES, A.MONTDES'
            +'        A.NUMREGOFI, A.CREANO, A.CREMES, A.MONTDES, A.TMONID'
      // Fin: SPP_201306_PRE
            + '  FROM PVS203 A, TGE105 B, CRE104 C '
            + ' WHERE A.BANCOID   = B.BANCOID '
            + '   AND A.TIPDESEID = C.TIPDESEID '
            // + ' ORDER BY A.CREANO||A.NOFID DESC';
            + ' ORDER BY A.NOFID DESC';
      // Fin: HPC_201705_PRE

      DM1.cdsOficio.Close;
      DM1.cdsOficio.DataRequest(xSql);
      DM1.cdsOficio.Open;
      DM1.cdsOficio.Locate('NOFID', oficio, []);
      DM1.cdsOficio.Refresh;
      btnofcape.Enabled := False;
   End;
End;

Procedure TFnuegenofi.btnofcdepClick(Sender: TObject);
Var
   xSql, xrepresentante, xfechalugar, xoficio, xbanco, xcuenta: String;
   xAno, xMes, xDia: Word;
   oficio: String;
Begin
   If DM1.cdsOficio.FieldByName('USUIMPDEP').AsString <> '' Then
   Begin
      If MessageDlg('El oficio ya fue impreso por ' + DM1.cdsOficio.FieldByName('USUIMPDEP').AsString + ', con fecha ' + DM1.cdsOficio.FieldByName('FECIMPDEP').AsString
         + #13 + '¿ Desea volver a imprimir ?', mtConfirmation, [mbYes, mbNo], 0) = mrno Then
         Exit;
   End;
   // Chequeando que todos tengan numero de cuenta y les pone al oficio como concluido
   oficio := DM1.cdsOficio.FieldByName('NOFID').AsString;
   If DM1.cdsOficio.FieldByName('OFIESTADO').AsString = 'INICIAL' Then
   Begin
      DM1.xFlg := 'S';
      DM1.cdsDocPago.First;
      While Not DM1.cdsDocPago.Eof Do
      Begin
         If Trim(DM1.cdsDocPago.FieldByName('CCBCOID').AsString) = '' Then DM1.xFlg := 'N';
         DM1.cdsDocPago.Next;
      End;
      If DM1.xFlg = 'S' Then
      Begin
         // Inicio: HPC_201705_PRE
         // Se modifica la actualización del estado de la cabecera de oficios
         // xSql := 'UPDATE PVS203 SET OFIESTADO = ''CONCLUIDO'' WHERE CREANO||NOFID = ' + QuotedStr(oficio);
         xSql := 'UPDATE PVS203 SET OFIESTADO = ''CONCLUIDO'' WHERE NOFID = ' + QuotedStr(oficio);
         // Fin: HPC_201705_PRE
         DM1.DCOM1.AppServer.EjecutaSql(xSql);
      End
      Else
      Begin
         MessageDlg('No sa ha completado el ingreso de todas las cuentas de ahorros', mtInformation, [mbOk], 0);
         Exit;
      End;
   End;
   DecodeDate(Date, xAno, xMes, xDia);
   xSql := 'SELECT CIALUGAR FROM TGE101 WHERE CNTCONSOL =' + QuotedStr('S');
   DM1.cdsQry1.Close;
   DM1.cdsQry1.DataRequest(xSQL);
   DM1.cdsQry1.Open;
   xfechalugar := DM1.cdsQry1.FieldByName('CIALUGAR').AsString + ', ' + DM1.StrZero(CurrToStr(xDia), 2) + ' de ' + DM1.NombreMes(CurrToStr(xMes)) + ' del ' + CurrToStr(xAno);
   xoficio := 'OFICIO N° ' + Copy(DM1.cdsOficio.FieldByName('NOFID').AsString, 5, 7) + '-' + Copy(DM1.cdsOficio.FieldByName('NOFID').AsString, 1, 4) + '-DM-BENEFICIOS';

   xSql := 'SELECT BANCONOM, CCBCOIDPRE FROM TGE105 WHERE BANCOID = ' + QuotedStr(DM1.cdsOficio.FieldByname('BANCOID').AsString);
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   xbanco := DM1.cdsQry.FieldByName('BANCONOM').AsString;
   // Se asgina al pplabel el código de la cuenta "CCBCOIDPRE" // SPP_201306_PRE
   // pplcodcueban.Caption := DM1.cdsQry.FieldByName('CCBCOIDPRE').AsString;  // SPP_201306_PRE
   xcuenta := DM1.cdsOficio.FieldByName('CCBCOID').AsString;
   xrepresentante := DM1.cdsOficio.FieldByName('APENOMREPBAN').AsString;
   // Inicio: SPP_201306_PRE
   // pplOficioLD.Caption := xoficio;
   // pplfechalugarLD.Caption := xfechalugar;
   // pplrepresentanteLD.Caption := xrepresentante;
   // pplbancoLD.Caption := xbanco;
   // ppLabel11.Caption := 'Fecha Generación : ' + Copy(DM1.cdsOficio.FieldByName('FREG').AsString, 1, 10);
   // Fin: SPP_201306_PRE
  
   If DM1.cdsOficio.FieldByName('TMONID').AsString = 'S' Then
   Begin
      // Inicio: SPP_201306_PRE
      pplOficioLS.Caption := xoficio;
      pplfechalugarLS.Caption := xfechalugar;
      pplrepresentanteLS.Caption :=   xrepresentante;
      pplbancoLS.Caption := xbanco;
      pplcodcuebanLS.Caption := xcuenta;
      pplfecgenLS.Caption := 'Fecha Generación del oficio : ' + Copy(DM1.cdsOficio.FieldByName('FREG').AsString, 1, 10);
      // Fin: SPP_201306_PRE
      pprDepLibSol.Print;
      pprDepLibSol.Stop;
   End;
   If DM1.cdsOficio.FieldByName('TMONID').AsString = 'D' Then
   Begin
      // Inicio: SPP_201306_PRE
      pplOficioLD.Caption     := xoficio;
      pplfechalugarLD.Caption := xfechalugar;
      pplrepresentanteLD.Caption := xrepresentante;
      pplbancoLD.Caption := xbanco;
      // pplcodcuebanLD.Caption := DM1.cdsQry.FieldByName('CCBCOIDPRE').AsString;
      pplcodcuebanLD.Caption := xcuenta;
      // ppLabel11.Caption := 'Fecha Generación : ' + Copy(DM1.cdsOficio.FieldByName('FREG').AsString, 1, 10);
      pplfecgenLD.Caption  := 'Fecha Generación del oficio : ' + Copy(DM1.cdsOficio.FieldByName('FREG').AsString, 1, 10);
      // Fin: SPP_201306_PRE
      pprDepLibDol.Print;
      pprDepLibDol.Stop;
   End;
   // Fin: SPP_201305_PRE
   If DM1.xSgr = 'DL' Then
   Begin
      xSql := 'UPDATE PVS203 '
            + '   SET USUIMPDEP = ' + QuotedStr(DM1.wUsuario)
            + '     , FECIMPDEP = SYSDATE'
           // Inicio: HPC_201705_PRE
           // Se modifica la condición para la actualización en la cabecera de oficios
           // + ' WHERE CREANO||NOFID = ' + QuotedStr(oficio);
           + ' WHERE NOFID = ' + QuotedStr(oficio);
           // Fin: HPC_201705_PRE
      DM1.DCOM1.AppServer.EjecutaSql(xSql);
      // Inicio: SPP_201306_PRE
      // Inicio: HPC_201705_PRE
      // Se modifica la condición para el select de la cabecera de oficios
      // xSql := 'SELECT A.CREANO||A.NOFID NOFID, B.BANCOABR, C.TIPDESEDES, A.MONTOTOT,'
      xSql := 'SELECT A.NOFID, B.BANCOABR, C.TIPDESEDES, A.MONTOTOT,'
            + '       A.FECINIC, A.FECFIN, A.OFIESTADO, A.FREG, A.CREUSER, A.BANCOID,'
            + '       A.TIPDESEID, A.CCBCOID, A.APENOMREPBAN, A.USUIMPAPE, '
            + '       A.FECIMPAPE, A.USUIMPDEP, A.FECIMPDEP,'
      //    +'        A.NUMREGOFI, A.CREANO, A.CREMES, A.MONTDES'
            +'        A.NUMREGOFI, A.CREANO, A.CREMES, A.MONTDES, A.TMONID'
            + '  FROM PVS203 A, TGE105 B, CRE104 C'
            + ' WHERE A.BANCOID   = B.BANCOID '
            + '   AND A.TIPDESEID = C.TIPDESEID '
            // + ' ORDER BY A.CREANO||A.NOFID DESC';
            + ' ORDER BY A.NOFID DESC';
      // Fin: HPC_201705_PRE
      // Fin: SPP_201306_PRE
      DM1.cdsOficio.Close;
      DM1.cdsOficio.DataRequest(xSql);
      DM1.cdsOficio.Open;
      DM1.cdsOficio.Locate('NOFID', oficio, []);
      DM1.cdsOficio.Refresh;
      btnofcdep.Enabled := False;
   End;
End;

Procedure TFnuegenofi.dbgoficiosDblClick(Sender: TObject);
Begin
   pgoficios.TabIndex := 1;
   actdetgrid;
End;

Procedure TFnuegenofi.btnimpofiClick(Sender: TObject);
Var
   oficio, xSql, xrepresentante, xfechalugar, xoficio, xbanco, xcuenta: String;
   xAno, xMes, xDia: Word;
Begin
   If DM1.cdsOficio.FieldByName('USUIMPDEP').AsString <> '' Then
   Begin
      If MessageDlg('El oficio ya fue impreso por ' + DM1.cdsOficio.FieldByName('USUIMPDEP').AsString + ', con fecha ' + DM1.cdsOficio.FieldByName('FECIMPDEP').AsString
         + #13 + '¿ Desea volver a imprimir ?', mtConfirmation, [mbYes, mbNo], 0) = mrno Then
         Exit;
   End;
   oficio := DM1.cdsOficio.FieldByName('NOFID').AsString;
   DM1.xSgr := 'N';
   DecodeDate(Date, xAno, xMes, xDia);
   xSql := 'SELECT CIALUGAR FROM TGE101 WHERE CNTCONSOL =' + QuotedStr('S');
   DM1.cdsQry1.Close;
   DM1.cdsQry1.DataRequest(xSQL);
   DM1.cdsQry1.Open;
   xfechalugar := DM1.cdsQry1.FieldByName('CIALUGAR').AsString + ', ' + DM1.StrZero(CurrToStr(xDia), 2) + ' de ' + DM1.NombreMes(CurrToStr(xMes)) + ' del ' + CurrToStr(xAno);
   xoficio := 'OFICIO N° ' + Copy(DM1.cdsOficio.FieldByName('NOFID').AsString, 5, 7) + '-' + Copy(DM1.cdsOficio.FieldByName('NOFID').AsString, 1, 4) + '-DM-BENEFICIOS';
   xSql := 'SELECT BANCONOM FROM TGE105 WHERE BANCOID = ' + QuotedStr(DM1.cdsOficio.FieldByname('BANCOID').AsString);
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   xbanco := DM1.cdsQry.FieldByName('BANCONOM').AsString;
   xcuenta := DM1.cdsOficio.FieldByName('CCBCOID').AsString;
   xrepresentante := DM1.cdsOficio.FieldByName('APENOMREPBAN').AsString;
   If DM1.cdsOficio.FieldByName('TIPDESEID').AsString = '05' Then
   Begin
      pplOficioG.Caption := xoficio;
      pplfechalugarG.Caption := xfechalugar;
      pplrepresentanteG.Caption := xrepresentante;
      pplcuentaG.Caption := xcuenta;
      pplbancoG.Caption := xbanco;
      ppRepGiro.Print;
      ppRepGiro.Stop;
   End;
   If DM1.cdsOficio.FieldByName('TIPDESEID').AsString = '06' Then
   Begin
      pplOficioA.Caption := xoficio;
      pplfechalugarA.Caption := xfechalugar;
      pplgenerado_por.Caption := 'Generado por: ' + DM1.wUsuario + ' el ' + DateToStr(Date);
      ppRepTeleahorro.Print;
      ppRepTeleahorro.Stop;
   End;
   If DM1.cdsOficio.FieldByName('TIPDESEID').AsString = '16' Then
   Begin
      pplnumoficheger.Caption := xoficio;
      pplfeccheger.Caption := xfechalugar;
      pprchegen.Print;
      pprchegen.Stop;
   End;
   If DM1.cdsOficio.FieldByName('TIPDESEID').AsString = '19' Then
   Begin
      pplOficioA.Caption := 'OFICIO Nº ' + Copy(DM1.cdsOficio.FieldByName('NOFID').AsString, 5, 7)
         + '-' + Copy(DM1.cdsOficio.FieldByName('NOFID').AsString, 1, 4) + '-DM-BENEFICIOS';
      pplfechalugarA.Caption := xfechalugar;
      pplgenerado_por.Caption := 'Generado por: ' + DM1.wUsuario + ' el ' + DM1.cdsOficio.FieldByName('FREG').AsString;
      ppRepTeleahorro.Print;
      ppRepTeleahorro.Stop;
   End;
   If DM1.xSgr = 'S' Then
   Begin
      xSql := 'UPDATE PVS203 '
            + '   SET OFIESTADO = ''CONCLUIDO'', '
            + '       USUIMPDEP = ' + QuotedStr(DM1.wUsuario) + ', '
            + '       FECIMPDEP = SYSDATE'
            // Inicio: HPC_201705_PRE
            // Se modifica la condición para la actualización de la cabecera de oficios
            // + ' WHERE CREANO||NOFID = ' + QuotedStr(oficio);
            + ' WHERE NOFID = ' + QuotedStr(oficio);
            // Fin: HPC_201705_PRE
      DM1.DCOM1.AppServer.EjecutaSql(xSql);
      // Inicio: SPP_201306_PRE
      // Inicio: HPC_201705_PRE
      // Se modifica la condición para el select de la cabecera de oficios
      // xSql := 'SELECT A.CREANO||A.NOFID NOFID, B.BANCOABR, C.TIPDESEDES, A.MONTOTOT,'
      xSql := 'SELECT A.NOFID, B.BANCOABR, C.TIPDESEDES, A.MONTOTOT,'
            + '       A.FECINIC, A.FECFIN, A.OFIESTADO, A.FREG, A.CREUSER, A.BANCOID,'
            + '       A.TIPDESEID, A.CCBCOID, A.APENOMREPBAN, A.USUIMPAPE, '
            + '       A.FECIMPAPE, A.USUIMPDEP, A.FECIMPDEP,'
      //    +'        A.NUMREGOFI, A.CREANO, A.CREMES, A.MONTDES'
            +'        A.NUMREGOFI, A.CREANO, A.CREMES, A.MONTDES, A.TMONID'
            + '  FROM PVS203 A, TGE105 B, CRE104 C '
            + ' WHERE A.BANCOID   = B.BANCOID '
            + '   AND A.TIPDESEID = C.TIPDESEID '
            // + ' ORDER BY A.CREANO||A.NOFID DESC';
            + ' ORDER BY A.NOFID DESC';
      // Fin: HPC_201705_PRE
      // Fin: SPP_201306_PRE
      DM1.cdsOficio.Close;
      DM1.cdsOficio.DataRequest(xSql);
      DM1.cdsOficio.Open;
      DM1.cdsOficio.Locate('NOFID', oficio, []);
      DM1.cdsOficio.Refresh;
      btnimpofi.Enabled := False;
   End;
End;

Function TFnuegenofi.TotRegAbonos: Integer;
Begin
   Result := 0;
   DM1.cdsDocPago.First;
   While Not DM1.cdsDocPago.Eof Do
   Begin
      Result := Result + 1;
      DM1.cdsDocPago.Next;
   End;
End;

Function TFnuegenofi.SumaChecksum(xCuenta: String): Double;
Begin
   Result := 0;
   DM1.cdsDocPago.First;
   While Not DM1.cdsDocPago.Eof Do
   Begin
      Result := Result + DM1.cdsDocPago.FieldByName('DNIRUC').AsFloat;
      DM1.cdsDocPago.Next;
   End;
   Result := Result + StrToInt(xCuenta);
End;

Function TFnuegenofi.VerificaCadena(xCadena: String): String;
Var
   xAuxiliar, Space: String;
   I: Integer;
Begin
   Result := '';
   For I := 1 To Length(Trim(xCadena)) Do
   Begin
      xAuxiliar := Copy(Trim(xCadena), I, 1);
      If xAuxiliar = 'Ñ' Then xAuxiliar := 'N';
      Result := Result + xAuxiliar;
   End;
   If Length(Trim(Result)) < 40 Then
   Begin
      Space := '';
      For i := 1 To (40 - Length(Trim(Result))) Do
         Space := Space + ' ';
   End;
   Result := Trim(Result) + Space;
End;

Procedure TFnuegenofi.actdetgrid;
Var
   xSql: String;
   xmonto: Double;
Begin
   btngraba.Visible  := False;
   If DM1.cdsOficio.FieldByName('TIPDESEID').AsString = '11' Then
   Begin
      btnofcape.Visible := True;
      btnofcdep.Visible := True;
      btnimpofi.Visible := False;
      If DM1.cdsOficio.FieldByName('USUIMPAPE').AsString = '' Then
         btnofcape.Enabled := True
      Else
         btnofcape.Enabled := False;
      If DM1.cdsOficio.FieldByName('USUIMPDEP').AsString = '' Then
         btnofcdep.Enabled := True
      Else
         btnofcdep.Enabled := False;
   End
   Else
   Begin
      btnofcape.Visible := False;
      btnofcdep.Visible := False;
      btnimpofi.Visible := True;
      If DM1.cdsOficio.FieldByName('USUIMPDEP').AsString = '' Then
      Begin
         btnimpofi.Enabled := True;
      End
      Else
      Begin
         btnimpofi.Enabled := False;
      End;
   End;

   If (DM1.cdsOficio.FieldByName('TIPDESEID').AsString = '05') Or
      (DM1.cdsOficio.FieldByName('TIPDESEID').AsString = '16')  Then btngraba.Visible := True;


   // Solo si es nivel 3 activa todos los botones de impresión
   If DM1.wNivel = '03' Then
   Begin
      If DM1.cdsOficio.FieldByName('TIPDESEID').AsString = '11' Then
      Begin
         btnofcape.Visible := True;
         btnofcdep.Visible := True;
         btnofcape.Enabled := True;
         btnofcdep.Enabled := True;
      End
      Else
      Begin
         btnimpofi.Visible := True;
         btngraba.Visible  := True;
         btnimpofi.Enabled := True;
         btngraba.Enabled  := True;
      End;
   End;
   If DM1.cdsOficio.FieldByName('TIPDESEID').AsString = '05' Then
   Begin
      dbgdetalle.Selected.Clear;
      dbgdetalle.Selected.Add('PVSLDNIBEN'#9'10'#9'Documento~de identidad'#9#9);
      dbgdetalle.Selected.Add('PVSNOMBRE'#9'40'#9'Apellidos y~nombres'#9#9);
      dbgdetalle.Selected.Add('PVSLMONTO'#9'11'#9'Importe~asignado'#9#9);
      dbgdetalle.Selected.Add('AGENBCODES'#9'25'#9'Agencia del~banco'#9#9);
      dbgdetalle.Selected.Add('DPTODES'#9'20'#9'Departamento~de la agencia'#9#9);
      dbgdetalle.ApplySelected;
   End;
   If DM1.cdsOficio.FieldByName('TIPDESEID').AsString = '06' Then
   Begin
      dbgdetalle.Selected.Clear;
      dbgdetalle.Selected.Add('PVSNOMBRE'#9'40'#9'Apellidos y~nombres'#9#9);
      dbgdetalle.Selected.Add('PVSLMONTO'#9'11'#9'Importe~asignado'#9#9);
      dbgdetalle.Selected.Add('PVSLDNIBEN'#9'10'#9'Documento de~identidad'#9#9);
      dbgdetalle.Selected.Add('PVSLNCTA'#9'10'#9'Número de~Cuenta'#9#9);
      dbgdetalle.ApplySelected;
   End;
   If DM1.cdsOficio.FieldByName('TIPDESEID').AsString = '11' Then
   Begin
      dbgdetalle.Selected.Clear;
      dbgdetalle.Selected.Add('PVSNOMBRE'#9'40'#9'Apellidos y~nombres'#9#9);
      dbgdetalle.Selected.Add('PVSLMONTO'#9'11'#9'Importe~asignado'#9#9);
      dbgdetalle.Selected.Add('FECNACMEN'#9'10'#9'Fecha de~nacimiento'#9#9);
      dbgdetalle.Selected.Add('APENOMTUT'#9'30'#9'Apellidos y nombre(s)~del tutor'#9#9);
      dbgdetalle.Selected.Add('DOCIDETUT'#9'10'#9'Documento de~identidad'#9#9);
      dbgdetalle.Selected.Add('CCBCOID'#9'10'#9'Número de~Cuenta'#9#9);
      dbgdetalle.ApplySelected;
   End;
   If DM1.cdsOficio.FieldByName('TIPDESEID').AsString = '16' Then
   Begin
      dbgdetalle.Selected.Clear;
      dbgdetalle.Selected.Add('PVSLDNIBEN'#9'10'#9'Documento~de identidad'#9#9);
      dbgdetalle.Selected.Add('PVSNOMBRE'#9'40'#9'Apellidos y~nombres'#9#9);
      dbgdetalle.Selected.Add('PVSLMONTO'#9'11'#9'Importe~asignado'#9#9);
      dbgdetalle.Selected.Add('NUMCHEGER'#9'13'#9'Número de cheque~de gerencia'#9#9);
      dbgdetalle.Selected.Add('DNIRUC'#9'11'#9'Código de recojo'#9#9);
// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
      dbgdetalle.Selected.Add('ESTADOLIQ'#9'12'#9'Extornado'#9#9);
// Fin    HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
      dbgdetalle.ApplySelected;
   End;
   If DM1.cdsOficio.FieldByName('TIPDESEID').AsString = '19' Then
   Begin
      dbgdetalle.Selected.Clear;
      dbgdetalle.Selected.Add('PVSNOMBRE'#9'40'#9'Apellidos y~nombres'#9#9);
      dbgdetalle.Selected.Add('PVSLDNIBEN'#9'10'#9'Documento de~identidad'#9#9);
      dbgdetalle.Selected.Add('PVSLMONTO'#9'11'#9'Importe~asignado'#9#9);
      dbgdetalle.Selected.Add('PVSLNCTA'#9'10'#9'Número de~Cuenta'#9#9);
      dbgdetalle.ApplySelected;
   End;
   // Inicio: HPC_201703_PRE
   // Se añade columnas en el grid detalle de los oficios
   dbgdetalle.Selected.Add('EMAILCOB'#9'20'#9'Email del~beneficiario'#9#9);
   dbgdetalle.Selected.Add('MOVILCOB'#9'20'#9'Movil del~beneficiario'#9#9);
   dbgdetalle.Selected.Add('FECHOREMAIL'#9'20'#9'Fecha y hora~notificación EMAIL'#9#9);
   dbgdetalle.Selected.Add('FECHORMOVIL'#9'20'#9'Fecha y hora~notificación SMS'#9#9);
   // Fin: HPC_201703_PRE
// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
   sBuscaFechas:=' ( '
                +'( TO_DATE(A.PVSLFECBE) >= ' + QuotedStr(DM1.cdsOficio.FieldByName('FECINIC').AsString) + ' AND  TO_DATE(A.PVSLFECBE) <= ' + QuotedStr(DM1.cdsOficio.FieldByName('FECFIN').AsString) + ' AND NVL(DIFERIDO, ''N'') = ''N'' ) '
                +' or '
                +'( TO_DATE(A.FECDIFLIQ) >= ' + QuotedStr(DM1.cdsOficio.FieldByName('FECINIC').AsString) + ' AND  TO_DATE(A.FECDIFLIQ) <= ' + QuotedStr(DM1.cdsOficio.FieldByName('FECFIN').AsString) + ' AND NVL(DIFERIDO, ''N'') = ''S'' ) '
                +' ) ';
   // Inicio: HPC_201703_PRE
   // Se modifica el script con la finalidad de mostrar el movil y email de los beneficiarios
   // // Fin    HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
   // // Inicio: SPP_201403_PRE
   // // xSql := 'SELECT TRIM(B.APEPATCOB)||'' ''||TRIM(B.APEMATCOB)||'' ''||TRIM(B.NOMCOB) PVSNOMBRE, '
   // // Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
   // xSql := 'SELECT B.PVSNOMBRE, '
   // // Fin: SPP_201403_PRE
   //       + '       B.PVSLMONTO, B.PVSLDNIBEN, B.FECNACMEN, '
   //       + '       TRIM(B.APEPATTUT)||'' ''||TRIM(B.APEMATTUT)||'' ''||TRIM(B.NOMTUT) APENOMTUT,'
   //       + '       B.DOCIDETUT, B.PVSLNCTA, C.AGENBCODES, D.DPTODES, B.AGENBCOID, B.PVSLDNIBEN, '
   //       //Inicio: SPP_201401_PRE
   //       // + '       B.PVSLBENNR, ''                    '' CCBCOID, B.NUMCHEGER, B.DNIRUC, B.DIRDOMCOB, B.CODZIPCOB, B.TELFIJCOB, B.TELMOVCOB'
   //       + '       B.PVSLBENNR, ''                    '' CCBCOID, B.NUMCHEGER, B.DNIRUC, B.DIRDOMCOB, B.CODZIPCOB, B.TELFIJCOB, B.TELMOVCOB, A.PVSEXPNRO, A.ASOID'
   //       + ', case when A.PVSESTLIQ=''04'' then ''EXTORNADO'' ELSE '' '' END ESTADOLIQ '
   //       //Fin: SPP_201401_PRE
   //       + '  FROM PVS306 A, PVS307 B, COB102 C, APO158 D'
   //       + ' WHERE '+sBuscaFechas
   //       //+ ' WHERE TO_DATE(A.PVSLFECBE) >= ' + QuotedStr(DM1.cdsOficio.FieldByName('FECINIC').AsString)
   //       //+ '   AND TO_DATE(A.PVSLFECBE) <= ' + QuotedStr(DM1.cdsOficio.FieldByName('FECFIN').AsString)
   //       //+ '   AND A.PVSESTLIQ IN (''02'',''05'', ''06'') '
   //       + '   AND A.PVSESTLIQ IN (''02'',''05'', ''06'', ''04'' ) '
   //       + '   AND A.PVSLBENNR = B.PVSLBENNR '
   //       + '   AND B.BANCOID   = ' + QuotedStr(DM1.cdsOficio.FieldByName('BANCOID').AsString)
   //       + '   AND B.FORPAGOID = ' + QuotedStr(DM1.cdsOficio.FieldByName('TIPDESEID').AsString)
   //       + '   AND NVL(FLGVOUCHER, ''X'') = ''N'' '
   //       + '   AND TO_CHAR(B.FREG, ''YYYY'') = ' + QuotedStr(Copy(DM1.cdsOficio.FieldByName('NOFID').AsString, 1, 4))
   //       + '   AND B.PVSLNOFC  = ' + QuotedStr(Copy(DM1.cdsOficio.FieldByName('NOFID').AsString, 5, 7))
   //       + '   AND B.AGENBCOID = C.AGENBCOID(+) '
   //       + '   AND C.DPTOID    = D.DPTOID(+)';
   //  // Fin    HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
   // Inicio: HPC_201705_PRE
   // Se modifica Qry para que tome la información directamente el numero de oficicio que se
   // encuentra en el detalle de la liquidación.
   // xSql := 'SELECT B.PVSNOMBRE, B.PVSLMONTO, B.PVSLDNIBEN, B.FECNACMEN, TRIM(B.APEPATTUT)||'' ''||TRIM(B.APEMATTUT)||'' ''||TRIM(B.NOMTUT) APENOMTUT,'
   // +' B.DOCIDETUT, B.PVSLNCTA, C.AGENBCODES, D.DPTODES, B.AGENBCOID, B.PVSLDNIBEN, B.PVSLBENNR, ''                    '' CCBCOID, B.NUMCHEGER, B.DNIRUC,'
   // +' B.DIRDOMCOB, B.CODZIPCOB, B.TELFIJCOB, B.TELMOVCOB, A.PVSEXPNRO, A.ASOID, CASE WHEN A.PVSESTLIQ = ''04'' THEN ''EXTORNADO'' ELSE '' '' END ESTADOLIQ,'
   // +' CASE WHEN NVL(A.PVSCOBASO,''X'') = ''S'' THEN E.ASOEMAIL ELSE B.EMAILCOB END EMAILCOB, CASE WHEN NVL(A.PVSCOBASO,''X'') = ''S'' THEN E.ASOTELF1 ELSE B.TELMOVCOB END MOVILCOB,'
   // +' FECHOREMAIL, FECHORMOVIL'
   // +' FROM PVS306 A, PVS307 B, COB102 C, APO158 D, APO201 E'
   // + ' WHERE '+sBuscaFechas
   // +' AND A.PVSESTLIQ IN (''02'',''05'', ''06'', ''04'' ) AND A.PVSLBENNR = B.PVSLBENNR'
   // +' AND B.BANCOID = '+QuotedStr(DM1.cdsOficio.FieldByName('BANCOID').AsString)+' AND B.FORPAGOID = '+QuotedStr(DM1.cdsOficio.FieldByName('TIPDESEID').AsString)
   // +' AND NVL(FLGVOUCHER, ''X'') = ''N'''
   // +' AND TO_CHAR(B.FREG, ''YYYY'') = '+QuotedStr(Copy(DM1.cdsOficio.FieldByName('NOFID').AsString, 1, 4))
   // +' AND B.PVSLNOFC  = '+QuotedStr(Copy(DM1.cdsOficio.FieldByName('NOFID').AsString, 5, 7))
   // +' AND B.AGENBCOID = C.AGENBCOID(+) AND C.DPTOID = D.DPTOID(+) AND A.ASOID = E.ASOID';
   xSql := 'SELECT B.PVSNOMBRE, B.PVSLMONTO, B.PVSLDNIBEN, B.FECNACMEN, TRIM(B.APEPATTUT)||'' ''||TRIM(B.APEMATTUT)||'' ''||TRIM(B.NOMTUT) APENOMTUT,'
   +' B.DOCIDETUT, B.PVSLNCTA, C.AGENBCODES, D.DPTODES, B.AGENBCOID, B.PVSLDNIBEN, B.PVSLBENNR, ''                    '' CCBCOID,'
   +' B.NUMCHEGER, B.DNIRUC, B.DIRDOMCOB, B.CODZIPCOB, B.TELFIJCOB, B.TELMOVCOB, A.PVSEXPNRO, A.ASOID,'
   +' CASE WHEN A.PVSESTLIQ = ''04'' THEN ''EXTORNADO'' ELSE '' '' END ESTADOLIQ,'
   +' CASE WHEN NVL(A.PVSCOBASO,''X'') = ''S'' THEN E.ASOEMAIL ELSE B.EMAILCOB END EMAILCOB,'
   +' CASE WHEN NVL(A.PVSCOBASO,''X'') = ''S'' THEN E.ASOTELF1 ELSE B.TELMOVCOB END MOVILCOB, FECHOREMAIL, FECHORMOVIL'
   +' FROM PVS306 A, PVS307 B, COB102 C, APO158 D, APO201 E'
   +' WHERE B.PVSLNOFC  = '+QuotedStr(DM1.cdsOficio.FieldByName('NOFID').AsString)+' AND NVL(B.FLGVOUCHER, ''X'') = ''N'''
   +' AND B.PVSLBENNR = A.PVSLBENNR AND A.PVSESTLIQ IN (''02'',''05'',''06'',''04'')'
   +' AND B.AGENBCOID = C.AGENBCOID(+) AND C.DPTOID = D.DPTOID(+) AND A.ASOID = E.ASOID';
   // Fin: HPC_201705_PRE

   // Fin: HPC_201703_PRE
   DM1.cdsDocPago.Close;
   DM1.cdsDocPago.DataRequest(xSql);
   DM1.cdsDocPago.Open;
   TNumericField(DM1.cdsDocPago.FieldByName('PVSLMONTO')).DisplayFormat := '###,###,##0.00';
   xMonto := 0;
   DM1.cdsDocPago.First;
   While Not DM1.cdsDocPago.Eof Do
   Begin
      xMonto := xMonto + DM1.cdsDocPago.FieldByName('PVSLMONTO').AsFloat;
      DM1.cdsDocPago.Next;
   End;
   dbgdetalle.ColumnByName('PVSNOMBRE').FooterValue := 'TOTAL OFICIO :';
   dbgdetalle.ColumnByName('PVSLMONTO').FooterValue := FormatFloat('###,###.#0', xMonto);
   DM1.cdsDocPago.First;
   DM1.xSgr := 'S';
   While Not DM1.cdsDocPago.Eof Do
   Begin
      xSql := 'SELECT CCBCOID FROM PVS308 '
            + ' WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsDocPago.FieldByName('PVSLBENNR').AsString)
            + '   AND TRIM(DSGAPEPAT||'' ''||DSGAPEMAT||'' ''||DSGNOMBR) = ' + QuotedStr(DM1.cdsDocPago.FieldByName('PVSNOMBRE').AsString);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      If DM1.cdsQry.RecordCount = 1 Then
      Begin
         If DM1.cdsQry.FieldByName('CCBCOID').AsString = '' Then
            DM1.xSgr := 'N'
         Else
         Begin
            DM1.cdsDocPago.Edit;
            DM1.cdsDocPago.FieldByName('CCBCOID').AsString := DM1.cdsQry.FieldByName('CCBCOID').AsString;
            DM1.cdsDocPago.Post;
         End;
      End
      Else
         DM1.xSgr := 'N';
      DM1.cdsDocPago.Next;
   End;
End;

procedure TFnuegenofi.btntransacajaClick(Sender: TObject);
Var
  Boton: Integer;
  xSql:String;
begin
  If Copy(DM1.cdsOficio.FieldByName('OFIESTADO').AsString ,1,1) = 'T' Then
  Begin
     MessageDlg(' DESEMBOLSO YA FUE TRANSFERIDO A LA UNIDAD DE CAJA/BOVEDA ', mtInformation,[mbOk],0);
     Exit;
  End;
  If Copy(DM1.cdsOficio.FieldByName('OFIESTADO').AsString,1,1) = 'P' Then
  Begin
     MessageDlg(' DESEMBOLSO YA FUE PROCESADO POR LA UNIDAD DE CAJA/BOVEDA ', mtInformation,[mbOk],0);
     Exit;
  End;
  Boton := Application.MessageBox ('¿Está Seguro De Realizar La TRANSFERENCIA?','Sistema De Previsión',MB_YESNO+MB_ICONQUESTION);
  If Boton = ID_YES Then
  Begin
     xSql := 'INSERT INTO CAJ_TRA_DEP(NOFID,FECINIC,FECFIN,MOVTOT,MONTO, MONDES, USUTRANS, FECTRANS, TIPDESEID, OFIESTADO, CREANO, CREMES, CREFDES,MODULOID)'
     // Inicio: HPC_201706_PRE
     // Se guarda el numero de oficio con todo el año.
     // +' VALUES (' + QuotedStr(Copy(DM1.cdsOficio.FieldByName('NOFID').AsString,5,7))+ ',' + QuotedStr(DM1.cdsOficio.FieldByName('FECINIC').AsString) + ',' + QuotedStr(DM1.cdsOficio.FieldByName('FECFIN').AsString)
     +' VALUES (' + QuotedStr(DM1.cdsOficio.FieldByName('NOFID').AsString)+ ',' + QuotedStr(DM1.cdsOficio.FieldByName('FECINIC').AsString) + ',' + QuotedStr(DM1.cdsOficio.FieldByName('FECFIN').AsString)
     // Fin: HPC_201706_PRE
     + ',' + IntToStr(DM1.cdsOficio.FieldByName('NUMREGOFI').AsInteger) + ',' + FloatToStr(DM1.cdsOficio.FieldByName('MONTOTOT').AsFloat)+ ',' + QuotedStr(DM1.cdsOficio.FieldByName('MONTDES').AsString)
     + ',' + QuotedStr(DM1.wUsuario)+ ', SYSDATE, ' + QuotedStr(DM1.cdsOficio.FieldByName('TIPDESEID').AsString)+ ',' + QuotedStr('TRANSFERIDO')
     + ', TO_CHAR(SYSDATE,''YYYY''), TO_CHAR(SYSDATE,''MM''), SYSDATE, ' + QuotedStr('PRE')+ ')';
     DM1.DCOM1.AppServer.EjecutaSql(xSql);
     // Inicio: HPC_201705_PRE
     // Se modifica la condición para la actualización de la cabecera de oficios 
     // xSql := 'UPDATE PVS203 SET OFIESTADO = ''TRANSFERIDO'' WHERE CREANO = '+QuotedStr(DM1.cdsOficio.FieldByName('CREANO').AsString)+' AND NOFID = '+QuotedStr(Copy(DM1.cdsOficio.FieldByName('NOFID').AsString,5,7));
     xSql := 'UPDATE PVS203 SET OFIESTADO = ''TRANSFERIDO'' WHERE NOFID = '+QuotedStr(DM1.cdsOficio.FieldByName('NOFID').AsString);
     // Fin: HPC_201705_PRE
     DM1.DCOM1.AppServer.EjecutaSql(xSql);
     DM1.cdsOficio.Edit;
     DM1.cdsOficio.FieldByName('OFIESTADO').AsString := 'TRANSFERIDO';
     DM1.cdsOficio.Post;
     MessageDlg(' DESEMBOLSO TRANSFERIDO CON EXITO A UNIDAD DE CAJA/BOVEDA ', mtInformation,[mbOk],0);
  End;
End;

procedure TFnuegenofi.ppDBText11Print(Sender: TObject);
var xtexto:String;
begin
  xtexto := DM1.DevuelveValor('APO158', 'DPTODES', 'DPTOID', Copy(DM1.cdsDocPago.FieldByName('CODZIPCOB').AsString,1,2))+'/'+
            DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', Copy(DM1.cdsDocPago.FieldByName('CODZIPCOB').AsString,1,4))+'/'+
            DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', DM1.cdsDocPago.FieldByName('CODZIPCOB').AsString);
   ppldireccion.Caption := Trim(DM1.cdsDocPago.FieldByName('DIRDOMCOB').AsString)+' - '+xtexto;
   ppltelefono.Caption := 'Teléf.: '+Trim(DM1.cdsDocPago.FieldByname('TELFIJCOB').AsString)+' - '+Trim(DM1.cdsDocPago.FieldByname('TELMOVCOB').AsString);
end;

//Inicio: SPP_201401_PRE
procedure TFnuegenofi.btnDesembolsadoClick(Sender: TObject);
var xSql, xTipoCob:String;
begin
   If DM1.cdsOficio.FieldByName('FLGDESOFI').AsString = 'S' Then
   Begin
    MessageDlg('El proceso de desembolso ya fue ejecutado.', mtInformation,[mbOk],0);
    Exit;
   End;
   DM1.cdsDocPago.First;
   // Inicio: HPC_201702_PRE
   // Se retira el código para insertar registros en las tablas seguimiento de expedientes
   // Solo se deja el flag que marca que el desembolso ya fue ejecutado
   If MessageDlg('¿ Esta seguro de marcar el desembolso al oficio ?', mtConfirmation, [mbYes, mbNo], 0) =  mryes Then
   Begin
      // While Not DM1.cdsDocPago.Eof Do
      // Begin
      //    xTipoCob := '02';
      //    xSql := 'SELECT B.PVSLNOFC FROM PVS306 A, PVS307 B WHERE PVSEXPNRO = '+QuotedStr(DM1.cdsDocPago.FieldByName('PVSEXPNRO').AsString)
      //    +' AND A.PVSLBENNR = B.PVSLBENNR AND PVSLAGRID IN (''FPG'',''RET'') AND NVL(B.PVSLMONTO,0) > 0 AND NVL(FLGVOUCHER,''N'') = ''N''';
      //    DM1.cdsQry.Close;
      //    DM1.cdsQry.DataRequest(xSql);
      //    DM1.cdsQry.Open;
      //    While Not DM1.cdsQry.Eof Do
      //    Begin
      //       If Trim(DM1.cdsQry.FieldByName('PVSLNOFC').AsString) = '' Then xTipoCob := '01';
      //       DM1.cdsQry.Next;
      //    End;
      //    // DESEMBOLSO DE OFICIO (TOTAL O PARCIAL)
      //    // 01 PARCIAL, 02 TOTAL
      //    xSql := 'Begin SP_PVS_SEG_EXP('+QuotedStr(DM1.cdsDocPago.FieldByName('ASOID').AsString)+', '+QuotedStr(DM1.cdsDocPago.FieldByName('PVSEXPNRO').AsString)
      //    +', ''04'', '+QuotedStr(xTipoCob)+', TO_DATE(SYSDATE,''DD/MM/YYYY''), '+QuotedStr(DM1.wUsuario)+', NULL); End;';
      //    DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      //    DM1.cdsDocPago.Next;
      // End;
      // Inicio: HPC_201705_PRE
      // Se modifica la condición para la actualización de la cabecera de oficios 
      // xSql := 'UPDATE PVS203 SET FLGDESOFI = ''S'' WHERE CREANO = '+QuotedStr(DM1.cdsOficio.FieldByName('CREANO').AsString)+' AND NOFID = '+QuotedStr(Copy(DM1.cdsOficio.FieldByName('NOFID').AsString,5,7));
      xSql := 'UPDATE PVS203 SET FLGDESOFI = ''S'' WHERE NOFID = '+QuotedStr(DM1.cdsOficio.FieldByName('NOFID').AsString);
      // Fin: HPC_201705_PRE
      DM1.DCOM1.AppServer.EjecutaSql(xSql);
      DM1.cdsOficio.Edit;
      DM1.cdsOficio.FieldByName('FLGDESOFI').AsString := 'S';
      DM1.cdsOficio.Post;
      MessageDlg('Proceso de desembolso ha sido marcado.', mtInformation,[mbOk],0);
   End;
   // Fin: HPC_201702_PRE
end;
//Fin: SPP_201401_PRE




// Inicio: HPC_201703_PRE
// Llama al procedimiento que exporta a excel email y movil del asociado
procedure TFnuegenofi.btnexportarClick(Sender: TObject);
begin
   Try
      FexpSMSEMAIL := TFexpSMSEMAIL.create(Self);
      FexpSMSEMAIL.ShowModal;
   Finally
      FexpSMSEMAIL.Free;
   End;
   If DM1.xFlg = 'S' Then actdetgrid;
end;
// Fin: HPC_201703_PRE
End.

