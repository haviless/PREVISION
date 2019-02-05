// Inicio Uso Estándares: 01/08/2011
// Unidad : Previsión Social
// Formulario : FModExpben
// Fecha de Creación : 08/08/2011
// Autor : Sistemas
// Objetivo : Modificar Expediente de beneficios
// Actualizaciones
// HPP_201005_PRE SAR-2009-0984
// HPC_201202_PRE 10/02/20002 Desactiva lectura de Foto y Firma de FTP, lee de archivo RENIEC
// DPP_201201_PRE   : Se realiza el pase a producción de acuerdo al HPC_201202_PRE
// HPC_201207_PRE   : Verificar si cuenta con registro en la tabla de desgravamen
   // 1. En el caso que ya cuenta permitira cambiar el tipo de liquidación, siempre y cuando el estado "ESTAPRDES" de la tabla ASO_FAC_GES_DET no este "APROBADO".
   // 2. Ejecuta el procedimiento "registrasuceso" para la modificación de los campos OBSMEM, FECFALGES, ESTADO, PVSTIPBEN en las tablas ASO_FAC_GES_DET y ASO_FAC_GES_CAB
// DPP_201207_PRE   : Se realiza el pase a producción a partir del HPC_201207.
// HPC_201209_PRE   : modifica la forma de pago
// SPP_201301_PRE   : El pase se realiza de acuerdo a lo indicado en el HPC_201209_PRE
// HPC_201303_PRE   : Visualizar mensaje si tiene autorización de descuento de aportes, Imprimir hoja de datos RENIEC, Visualizar el regimen de pensión
// SPP_201304_PRE   : Se realiza el pase a produccion a partir del HPC_201303_PRE.
// HPC_201304_PRE   : Anular expediente de liquidación, Se adiciona Datos del solicitante.
//                    Se corrige error al momento de seleccionar el tipo de AFP.
// SPP_201305_PRE   : Se realiza el pase a producción a partir del HPC_201304_PRE
// HPC_201305_PRE   : Se añade selección para determinar el origen de la solicitud, se añade campo FORSOLBEN en Qry para mostrar liquidación.
// SPP_201306_PRE   : Se realiza el pase a producción a partir del HPC_201305_PRE
// HPC_201306_PRE   : Se añade un radio group para Identificar el tipo de liquidación por retiro (1=Cese, 2= Invalidez temporal)
// SPP_201307_PRE   : Se realiza el pase a producción a partir del HPC_201306_PRE.
// HPC_201307_PRE   : Hitos de Segumiento de expediente Web.
// SPP_201401_PRE   : Se realiza el pase a producción a partir del pase HPC_201307_PRE
// HPC_201601_PRE		: CAMBIAR DE DO A CE AL GRABAR LA LIQUIDACION DE BENEFICIO
// HPC_201509_PRE : Categorizar Causas de Cese
// HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
// HPC_201605_PRE : Se modifica la información ingresada en el origen de expediente.
//                  Debe ser departamento de origen y oficina de origen. 
//                  Se quita selección del representante.
//                  Se imprime registro de solicitudes de expedientes 
// HPC_201607_PRE  : Se añaden los campos departamento de origen del expediente, oficina de origen del expediente (DEPORIEXP, OFIORIEXP)
//                   Se añade un procedimiento para controlar que la fecha de recepción no sea mayor al dia actual.
// HPC_201609_PRE  : Se modifica la lectura de datos en la tabla de Carta de Designación.
//                   Solo se leee los que tienen con estado "02 = Activos".
// HPC_201610_PRE : CREAR Y MODIFICAR INDICADORES DE CALIDAD
// HPC_201704_PRE : Se añade nuevo formulario "Fnuerepcueind" 
// HPC_201705_PRE : Se asigna numero de liquidación de beneficio a variable.
// HPC_201707_PRE : Validar la Fecha de la Hoja de Cargo
// HPC_201709_PRE : Se deshabilita los botones de actualizar datos cuando el
//                  expediente esta anulado. 
// HPC_201802_PRE : Se modifica la forma de pago de la liquidación para el caso
//                  que el expediente sea por Oficio interno   
// HPC_201805_PRE : Se asigna por defecto el valor del banco al tipo de desembolso
// HPC_201809_PRE : Se ingresa la opción para el registro de datos del solicitante


Unit PRE235;
Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Mask, Buttons, IniFiles, ExtCtrls, ComCtrls, Grids, Wwdbigrd,
   Wwdbgrid, wwdblook, Wwdbdlg, wwdbdatetimepicker, IdBaseComponent,
   IdComponent, IdTCPConnection, IdTCPClient, IdFTP, wwriched, jpeg, db,
  ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd,
  //Inicio HPC_201809_PRE
  //Se modifica el ingreso de datos para el solicitante
  // ppReport, ppDB, ppDBPipe, ppDBBDE, PRE901;
  ppReport, ppDB, ppDBPipe, ppDBBDE,ShellApi;
  //Final HPC_201809_PRE
Type
   TFModExpben = Class(TForm)
      Label1: TLabel;
      Label3: TLabel;
      Label4: TLabel;
      Label5: TLabel;
      Label6: TLabel;
      Label7: TLabel;
      Panel1: TPanel;
      meAsoApeNomDni: TMaskEdit;
      Panel2: TPanel;
      meAsoDocNum: TMaskEdit;
      Panel3: TPanel;
      meUsenom: TMaskEdit;
      Panel6: TPanel;
      meAsocodmod: TMaskEdit;
      meUseid: TMaskEdit;
      Panel4: TPanel;
      meUpagonom: TMaskEdit;
      meUpagoid: TMaskEdit;
      Panel5: TPanel;
      meUpronom: TMaskEdit;
      meUproid: TMaskEdit;
      Label8: TLabel;
      Panel7: TPanel;
      meAsodir: TMaskEdit;
      Panel8: TPanel;
      meAsozipdes: TMaskEdit;
      Label9: TLabel;
      Label10: TLabel;
      Panel9: TPanel;
      meAsodeslab: TMaskEdit;
      Label11: TLabel;
      Panel10: TPanel;
      meAsodirlab: TMaskEdit;
      Panel11: TPanel;
      meAsozipdeslab: TMaskEdit;
      Label12: TLabel;
      pgmulti: TPageControl;
      tsforpag: TTabSheet;
      tsresoluciones: TTabSheet;
      tsdatper: TTabSheet;
      btngraba: TBitBtn;
      btncerrar: TBitBtn;
      rgCobAso: TRadioGroup;
      // Inicio: HPC_201802_PRE
      // Se retira variables no usadas
      // lblagegir: TLabel;
      // lblbanco: TLabel;
      // lblforpag: TLabel;
      // Fin: HPC_201802_PRE
      GroupBox2: TGroupBox;
      Label18: TLabel;
      Label22: TLabel;
      dbdtpfecces: TwwDBDateTimePicker;
      Label23: TLabel;
      Label24: TLabel;
      // Inicio: HPC_201802_PRE
      // Se retira variables no usadas
      // dblcBanco: TwwDBLookupCombo;
      // pnlforpag: TPanel;
      // meforpagodes: TMaskEdit;
      // dblcforpag: TwwDBLookupCombo;
      // pnlbanco: TPanel;
      // mebancodes: TMaskEdit;
      // pnlagegir: TPanel;
      // meagengir: TMaskEdit;
      // lblasoncta: TLabel;
      // pnlasoncta: TPanel;
      // measoncta: TMaskEdit;
      // Fin: HPC_201802_PRE
      Label13: TLabel;
      Label14: TLabel;
      Label15: TLabel;
      btncreditos: TBitBtn;
      btnaportes: TBitBtn;
      btnedita: TBitBtn;
      btnsegui: TBitBtn;
      btnfamiliar: TBitBtn;
      pnlnumresnom: TPanel;
      menumresnom: TMaskEdit;
      pnlfecresnom: TPanel;
      mefecresnom: TMaskEdit;
      pnlnumresces: TPanel;
      menumresces: TMaskEdit;
      // Inicio: HPC_201802_PRE
      // Se retira variables no usadas
      // dblcagegir: TwwDBLookupComboDlg;
      // Fin: HPC_201802_PRE
      pnlobservacion: TPanel;
      StaticText1: TStaticText;
      // Inicio: HPC_201605_PRE --Se retira 
      // gborigen: TGroupBox;
      // Label20: TLabel;
      // Label16: TLabel;
      // Label21: TLabel;
      // pnlofdesnom: TPanel;
      // medistdes: TMaskEdit;
      // dblcdptoid: TwwDBLookupCombo;
      // dblcprovid: TwwDBLookupCombo;
      // dblcdistid: TwwDBLookupCombo;
      // Panel12: TPanel;
      // meprovdes: TMaskEdit;
      // Panel13: TPanel;
      // medptodes: TMaskEdit;
      // Fin: HPC_201605_PRE
      gbtipben: TGroupBox;
      Label17: TLabel;
      lblfacinv: TLabel;
      // INICIO HPC_201509_PRE
      // lblfallecimiento: TLabel;
      // FIN HPC_201509_PRE
      Panel16: TPanel;
      metipbenef: TMaskEdit;
      // Inicio: HPC_201605_PRE -- Se retira
      // dbdtpfacinv: TwwDBDateTimePicker;
      // Fin: HPC_201605_PRE
      // INICIO HPC_201509_PRE
      // pnlfallecimiento: TPanel;
      // mefallecimiento: TMaskEdit;
      // FIN HPC_201509_PRE
      dbltipbenef: TwwDBLookupCombo;
      btnliqben: TBitBtn;
      // Inicio: HPC_201605_PRE -- Se retira
      // lbltitrep: TLabel;
      // dblcRepori: TwwDBLookupComboDlg;
      // pnlapenomrep: TPanel;
      // merepder: TMaskEdit;
      // pnlubirep: TPanel;
      // meubigeorep: TMaskEdit;
      // Fin: HPC_201605_PRE
      IdFTP1: TIdFTP;
      meanoultapo: TMaskEdit;
      memesultapo: TMaskEdit;
      Label2: TLabel;
      Panel14: TPanel;
      measotelef: TMaskEdit;
      timerobsevaciones: TTimer;
      redit: TwwDBRichEdit;
      btnfotfir: TBitBtn;
      GroupBox3: TGroupBox;
      ImgFotoConfirme: TImage;
      ImgFirmaConfirme: TImage;
      btnfonsol: TBitBtn;
      // Inicio: HPC_201802_PRE
      // Se retira variables no usadas
      // Label19: TLabel;
      // Label25: TLabel;
      // lbldospun03: TLabel;
      // lbldospun04: TLabel;
      // Fin: HPC_201802_PRE
    // Inicio: SPP_201304_PRE - Varible para las hojas de datos de RENIEC y FSC.
    ppRReniec: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppShape41: TppShape;
    ppLabel21: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppShape31: TppShape;
    ppShape28: TppShape;
    ppShape26: TppShape;
    ppShape21: TppShape;
    ppShape4: TppShape;
    ppShape3: TppShape;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppShape8: TppShape;
    ppShape9: TppShape;
    ppShape10: TppShape;
    ppShape11: TppShape;
    ppShape12: TppShape;
    ppShape13: TppShape;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppShape14: TppShape;
    ppShape15: TppShape;
    ppShape16: TppShape;
    ppShape17: TppShape;
    ppShape18: TppShape;
    ppShape19: TppShape;
    ppShape20: TppShape;
    ppShape22: TppShape;
    ppShape23: TppShape;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppShape24: TppShape;
    ppShape25: TppShape;
    ppShape27: TppShape;
    ppShape29: TppShape;
    ppShape30: TppShape;
    ppShape32: TppShape;
    ppShape33: TppShape;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppShape34: TppShape;
    ppShape35: TppShape;
    ppShape36: TppShape;
    ppShape37: TppShape;
    ppShape38: TppShape;
    ppShape39: TppShape;
    ppShape40: TppShape;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppShape2: TppShape;
    ppDBText1: TppDBText;
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
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppFirma: TppImage;
    ppShape60: TppShape;
    ppShape61: TppShape;
    ppLabel141: TppLabel;
    ppDBText34: TppDBText;
    ppFoto: TppImage;
    ppFooterBand1: TppFooterBand;
    ppBDEReniec: TppBDEPipeline;
    btnDesApo: TBitBtn;
    Label26: TLabel;
    Panel15: TPanel;
    meregpen: TMaskEdit;
    // Inicio: SPP_201305_PRE
    btnanular: TBitBtn;
    // Inicio: HPC_201809_PRE
    // Se modifica el nombre de la hoja de datos del solicitante
    // TabSheet1: TTabSheet;
    tsdatsol: TTabSheet;
    // Fin: HPC_201809_PRE
    Label27: TLabel;
    meDNIsol: TMaskEdit;
    Label28: TLabel;
    meapenomsol: TMaskEdit;
    Label29: TLabel;
    mevinparentesco: TMaskEdit;
    rgforsolben: TRadioGroup;  // SPP_201306_PRE Radiogroup para seleccionar la forma de solicitud
//Inicio: SPP_201401_PRE
    rgtipret: TRadioGroup;  
    btnnueseg: TBitBtn; 
    // Inicio: HPC_201809_PRE
    // Se retira componente para la causa de cese
    // CboCausaCese: TFCboCausaCese;
    // Fin: HPC_201809_PRE

    // Inicio: HPC_201605_PRE --Se modifica la información ingresada en el origen de expediente.
    gborigen: TGroupBox;
    Label20: TLabel;
    Label16: TLabel;
    // Inicio: HPC_201809_PRE
    // Se modifica nombre del compronente
    // dblcdptoid: TwwDBLookupCombo;
    dblcdptoidori: TwwDBLookupCombo;
    // Fin: HPC_201809_PRE
    dblccodofi: TwwDBLookupCombo;
    Panel12: TPanel;
    meofides: TMaskEdit;
    Panel13: TPanel;
    // Inicio: HPC_201809_PRE
    // medptodes: TMaskEdit;
    // Se modifica nombre del compronente
    // Fin: HPC_201809_PRE
    medptodesori: TMaskEdit;
    GBfecrec: TGroupBox;
    DBDTPfecrecexp: TwwDBDateTimePicker;
    dbdtpfacinv: TwwDBDateTimePicker;
    btnImpresion: TBitBtn;
    pprRetiro: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    pplasodir: TppLabel;
    ppldepdir: TppLabel;
    pplprodir: TppLabel;
    ppldisdir: TppLabel;
    pplasotelfij: TppLabel;
    pplasotelcel: TppLabel;
    ppldiacese: TppLabel;
    pplmescese: TppLabel;
    pplanocese: TppLabel;
    pplcenedu: TppLabel;
    ppldiscenedu: TppLabel;
    pplprocenedu: TppLabel;
    ppldepcenedu: TppLabel;
    ppldianom: TppLabel;
    pplmesnom: TppLabel;
    pplanonom: TppLabel;
    pplciudad: TppLabel;
    pprFallecimiento: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLasodirF1: TppLabel;
    ppLasodepF: TppLabel;
    ppLasoproF: TppLabel;
    ppLAsodisF: TppLabel;
    ppLdiaresfall: TppLabel;
    ppLmesresfal: TppLabel;
    ppLanoresfal: TppLabel;
    ppLasocenedufal: TppLabel;
    pplciudadfal: TppLabel;
    ppLdisasoceneduF: TppLabel;
    ppLproasoceneduF: TppLabel;
    ppLdianomfal: TppLabel;
    ppLmesnomfal: TppLabel;
    ppLanonomfal: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppLasoapenomsol: TppLabel;
    ppLDNIsol: TppLabel;
    ppLasodirF2: TppLabel;
    ppLdepAsoceneduF: TppLabel;
    ppLAsopenomR: TppLabel;
    ppLASODNIR: TppLabel;
    ppLASOCODMODR: TppLabel;
    ppLRESCESE: TppLabel;
    ppLRESNOM: TppLabel;
    ppLAsoapenomdniF: TppLabel;
    ppLASODNIF: TppLabel;
    ppLASOCODMODF: TppLabel;
    ppLasoresceseF: TppLabel;
    ppLasoresnomF: TppLabel;
// Inicio HPC_201707_PRE : Validar la Fecha de la Hoja de Cargo
    btnFecCargo: TBitBtn;

    // Inicio: HPC_201802_PRE
    // Se añaden nuevas variables
    gbforpag: TGroupBox;
    lblforpag: TLabel;
    lblptoforpag: TLabel;
    lblbanco: TLabel;
    lblptobco: TLabel;
    lblagegir: TLabel;
    lblptoage: TLabel;
    lblasoncta: TLabel;
    lblptocta: TLabel;
    dblcforpag: TwwDBLookupCombo;
    pnlforpag: TPanel;
    meforpagodes: TMaskEdit;
    dblcBanco: TwwDBLookupCombo;
    pnlbanco: TPanel;
    mebancodes: TMaskEdit;
    dblcagegir: TwwDBLookupComboDlg;
    pnlagegir: TPanel;
    meagengir: TMaskEdit;
    pnlasoncta: TPanel;
    measoncta: TMaskEdit;
    // Inicio: HPC_201809_PRE
    // Componentes para el registro de datos del solicitante
    btnsolbenef: TBitBtn;
    pprsolbenefret: TppReport;
    ppDetailBand4: TppDetailBand;
    ppTitleBand1: TppTitleBand;
    ppSummaryBand1: TppSummaryBand;
    ppImage1: TppImage;
    ppShape42: TppShape;
    ppShape43: TppShape;
    ppdiahoysol01: TppLabel;
    pplanohoysol01: TppLabel;
    pplmeshoysol01: TppLabel;
    pplasoapenomdnisol01: TppLabel;
    pplasodnisol01: TppLabel;
    pplasocodmodsol01: TppLabel;
    pplasodirsol01: TppLabel;
    ppldistritosol01: TppLabel;
    pplprovinciasol01: TppLabel;
    ppldepartamentosol01: TppLabel;
    pplasotelfsol01: TppLabel;
    pplasoemail01: TppLabel;
    pplasorescessol01: TppLabel;
    ppldiarescessol01: TppLabel;
    pplmesrescessol01: TppLabel;
    pplanorescessol01: TppLabel;
    pplasocenedusol01: TppLabel;
    ppldiscenedusol01: TppLabel;
    pplprocenedusol01: TppLabel;
    ppldepcenedusol01: TppLabel;
    ppldianomsol01: TppLabel;
    pplmesnomsol01: TppLabel;
    pplanonomsol01: TppLabel;
    pplnumnomsol01: TppLabel;
    pplasodnifirmasol01: TppLabel;
    pplusuariofechasol01: TppLabel;
    pprsolbenefinv: TppReport;
    ppTitleBand2: TppTitleBand;
    ppShape44: TppShape;
    ppImage5: TppImage;
    ppImage6: TppImage;
    ppImage7: TppImage;
    ppdiahoysol02: TppLabel;
    pplmeshoysol02: TppLabel;
    pplanohoysol02: TppLabel;
    pplasoapenomdnisol02: TppLabel;
    pplasodnisol02: TppLabel;
    pplasocodmodsol02: TppLabel;
    pplasodirsol02: TppLabel;
    ppldistritosol02: TppLabel;
    pplprovinciasol02: TppLabel;
    ppldepartamentosol02: TppLabel;
    pplasotelfsol02: TppLabel;
    pplasoemail02: TppLabel;
    pplasorescessol02: TppLabel;
    pplanorescessol02: TppLabel;
    pplmesrescessol02: TppLabel;
    ppldiarescessol02: TppLabel;
    pplasocenedusol02: TppLabel;
    pplprocenedusol02: TppLabel;
    pplnumnomsol02: TppLabel;
    ppldiscenedusol02: TppLabel;
    pplanonomsol02: TppLabel;
    ppldepcenedusol02: TppLabel;
    ppldianomsol02: TppLabel;
    pplmesnomsol02: TppLabel;
    pplasodnifirmasol02: TppLabel;
    pplusuariofechasol02: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    ppShape45: TppShape;
    ppImage8: TppImage;
    pprsolbeneffal: TppReport;
    ppTitleBand3: TppTitleBand;
    ppShape46: TppShape;
    ppImage11: TppImage;
    ppldiahoysolfal: TppLabel;
    pplmeshoysolfal: TppLabel;
    pplanohoysolfal: TppLabel;
    pplapenomsolfal: TppLabel;
    ppldnisolfal: TppLabel;
    ppldirsolfal: TppLabel;
    ppldesdissolfal: TppLabel;
    ppldesdepsolfal: TppLabel;
    pplemailsolfal: TppLabel;
    ppltelsolfal: TppLabel;
    pplasoprosolfal: TppLabel;
    pplasoapenomdnisolfal: TppLabel;
    pplasodnisolfal: TppLabel;
    pplanocesesolfal: TppLabel;
    pplasocodmodsolfal: TppLabel;
    pplanonomfalsol: TppLabel;
    pplasodirsolfal: TppLabel;
    pplasodissolfal: TppLabel;
    pplmesnomfalsol: TppLabel;
    pplasodepsolfal: TppLabel;
    ppldiacesesolfal: TppLabel;
    pplasorescesesolfal: TppLabel;
    pplmescesesolfal: TppLabel;
    ppldianomfalsol: TppLabel;
    ppldnidirmasolfal: TppLabel;
    pplimpresoporsolfal: TppLabel;
    ppDetailBand6: TppDetailBand;
    ppSummaryBand3: TppSummaryBand;
    ppShape47: TppShape;
    ppImage12: TppImage;
    Label19: TLabel;
    metelsol: TMaskEdit;
    medirsol: TMaskEdit;
    meemailsol: TMaskEdit;
    Label21: TLabel;
    Label25: TLabel;
    ppldesprosolfal: TppLabel;
    Label30: TLabel;
    dblcddptoidsol: TwwDBLookupComboDlg;
    Panel17: TPanel;
    medptosol: TMaskEdit;
    Label34: TLabel;
    dblcdProvinciasol: TwwDBLookupComboDlg;
    Panel18: TPanel;
    meprovinciasol: TMaskEdit;
    Label35: TLabel;
    dblcddistritosol: TwwDBLookupComboDlg;
    Panel19: TPanel;
    medistritosol: TMaskEdit;
    pplresnomsolfal: TppLabel;
    gbCausaCese: TGroupBox;
    btnbuscacausa: TButton;
    mebuscacausa: TMaskEdit;
    ppImage2: TppImage;
    BitBtn1: TBitBtn;
    // Fin: HPC_201809_PRE

    // Fin: HPC_201802_PRE
// Fin   HPC_201707_PRE : Validar la Fecha de la Hoja de Cargo
    // Fin: HPC_201605_PRE

    // FIN HPC_201509_PRE
//Fin: SPP_201401_PRE
    // Fin: SPP_201305_PRE
    // Fin: SPP_201304_PRE
      Procedure FormActivate(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure rgCobAsoClick(Sender: TObject);
      Procedure dblcdBancoidChange(Sender: TObject);
      Procedure dblcdreporiExit(Sender: TObject);
      Procedure dbltipbenefChange(Sender: TObject);
      Procedure dblcDeporiChange(Sender: TObject);
      // Inicio: HPC_201605_PRE --Se retira
      // Procedure dblcReporiChange(Sender: TObject);
      // Fin: HPC_201605_PRE
      Procedure dblcBancoChange(Sender: TObject);
      Procedure dblcagegirChange(Sender: TObject);
      Procedure dblcagegirExit(Sender: TObject);
      Procedure btngrabaClick(Sender: TObject);
      Procedure btncerrarClick(Sender: TObject);
      Procedure btncreditosClick(Sender: TObject);
      Procedure btneditaClick(Sender: TObject);
      Procedure btnaportesClick(Sender: TObject);
      Procedure btnprocobClick(Sender: TObject);
      Procedure btnseguiClick(Sender: TObject);
      // Inicio: HPC_201809_PRE
      // Se modifica nombre del procedimiento
      // Procedure dblcdptoidChange(Sender: TObject);
      Procedure dblcdptoidoriChange(Sender: TObject);
      // Fin: HPC_201809_PRE
      // Inicio: HPC_201605_PRE --Se retira
      // Procedure dblcprovidChange(Sender: TObject);
      // Procedure dblcdistidChange(Sender: TObject);
      // Fin: HPC_201605_PRE
      Procedure dbdtpfacinvExit(Sender: TObject);
      // Inicio: HPC_201809_PRE  
      // Se retira el procedimiento
      // Procedure dblcdptoidExit(Sender: TObject);
      // Fin: HPC_201809_PRE  
      Procedure btnliqbenClick(Sender: TObject);
      Procedure btnfamiliarClick(Sender: TObject);
      Procedure dbdtpfeccesExit(Sender: TObject);
      Procedure dbltipbenefExit(Sender: TObject);
      // Inicio: HPC_201605_PRE  --Se retira
      // Procedure dblcprovidExit(Sender: TObject);
      // Procedure dblcdistidExit(Sender: TObject);
      // Procedure dblcReporiExit(Sender: TObject);
      // Fin: HPC_201605_PRE
      Procedure dblcBancoExit(Sender: TObject);
      Procedure Timer1Timer(Sender: TObject);
      Procedure timerobsevacionesTimer(Sender: TObject);
      Procedure btnfotfirClick(Sender: TObject);
      Procedure ImgFotoConfirmeDblClick(Sender: TObject);
      Procedure btnfonsolClick(Sender: TObject);
      Procedure dblcforpagExit(Sender: TObject);
    procedure btnDesApoClick(Sender: TObject); // SPP_201304_PRE Procedimiento muestra mensaje de autorización de descuento de aportes
    procedure btnanularClick(Sender: TObject);  // SPP_201305_PRE Boton para la anulación de expediente en tramite
    procedure btnnuesegClick(Sender: TObject);  // SPP_201401_PRE
    // Inicio: HPC_201605_PRE --Codigo de oficina y boton de impresion
    procedure dblccodofiChange(Sender: TObject);
    procedure btnImpresionClick(Sender: TObject);
    // Inicio: HPC_201607_PRE
    // Se valida que la fecha de recepción del expediente no sea mayor a la fecha actual
    procedure DBDTPfecrecexpExit(Sender: TObject);
    // Fin: HPC_201607_PRE
    // Fin: HPC_201605_PRE
// Inicio HPC_201707_PRE : Validar la Fecha de la Hoja de Cargo
    procedure btnFecCargoClick(Sender: TObject);
    // Inicio: HPC_201802_PRE 
    // Se añade nuevo procedimiento
    procedure rgforsolbenClick(Sender: TObject);
    // Fin: HPC_201802_PRE

    // Inicio: HPC_201809_PRE
    // Procedimiento para validar los datos del solicitante
    procedure btnsolbenefClick(Sender: TObject);
    procedure meemailsolExit(Sender: TObject);
    procedure meDNIsolExit(Sender: TObject);
    procedure dblcddptoidsolChange(Sender: TObject);
    procedure dblcddptoidsolExit(Sender: TObject);
    procedure dblcdProvinciasolExit(Sender: TObject);
    procedure dblcddistritosolExit(Sender: TObject);
    procedure dblcdProvinciasolChange(Sender: TObject);
    procedure btnbuscacausaClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure actualiza();
    procedure mebuscacausaExit(Sender: TObject);
    procedure dblcddistritosolChange(Sender: TObject);
    // Fin: HPC_201809_PRE


// Fin   HPC_201707_PRE : Validar la Fecha de la Hoja de Cargo

   Private
    { Private declarations }
// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
      Procedure habilitaModFam;
// Fin    HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
   Public
// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
      sModExpR : String;
// Fin    HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
     // Inicio: HPC_201809_PRE
     // Variable que guarda el codigo de causa de cese
     xCodCauCes:String;
     // Fin: HPC_201809_PRE
      Procedure llena;
      Procedure deshabilita;
      Procedure habilita;
      Function chksolicitud: Boolean;
      Procedure llenaredit;
   End;
Var
   FModExpben: TFModExpben;
Implementation

// Inicio: SPP_201304_PRE - Se añade Mensaje de autorización de descuento de aportes y mensaje de no autorización de
//        Descuento de aportes (PRE233, PRE277, PRE278)
// Inicio: HPC_201704_PRE
// Se retira unidad PRE237 y se añade PRE295
// Uses PREDM, PRE236, PRE237, PRE253, PRE256, PRE241, PRE239, PRE283,
// Inicio HPC_201707_PRE : Validar la Fecha de la Hoja de Cargo
Uses PREDM, PRE236, PRE253, PRE256, PRE241, PRE239, PRE283,
   //PRE284, PRE276, PRE233, PRE277, PRE278, PRE213, PRE232, PRE292  PRE294; // SPP_201401_PRE
   PRE284, PRE276, PRE233, PRE277, PRE278, PRE213, PRE232, PRE292, PRE295,
   // Inicio: HPC_201809_PRE
   // Se añade unidad que selecciona el codigo de cese
   // PRE299; 
   PRE299, PRE901;
   // Fin: HPC_201809_PRE
// Fin   HPC_201707_PRE : Validar la Fecha de la Hoja de Cargo
// Fin: HPC_201704_PRE
// Fin: SPP_201304_PRE
{$R *.dfm}




Procedure TFModExpben.FormActivate(Sender: TObject);
Var
   xSql: String;
Begin
// Inicio: SPP_201304_PRE
   btnfonsol.Enabled := False; 
// Fin: SPP_201304_PRE
   pgmulti.TabIndex := 0;
   rgCobAso.ItemIndex := -1;
   If DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString <> '01' Then
      xSql := 'SELECT TIPDESEID, TIPDESEDES, FLACOBPRE FROM CRE104 A WHERE NVL(FLAHISPRE, ''X'') = ''S'' ORDER BY TIPDESEID'
   Else
      xSql := 'SELECT TIPDESEID, TIPDESEDES, FLACOBPRE FROM CRE104 A WHERE NVL(FLAVIGPRE, ''X'') = ''S'' ORDER BY TIPDESEID';
   DM1.cdsFPago.Close;
   DM1.cdsFPago.DataRequest(xSql);
   DM1.cdsFPago.Open;
   // Inicio: HPC_201809_PRE
   // Se añade cliente de departamento para controlar la seleccion del departamento del solicitante
   xSql := 'SELECT DPTOID, DPTODES FROM APO158 ORDER BY DPTOID';
   DM1.cdsDpto1.Close;
   DM1.cdsDpto1.DataRequest(xSql);
   DM1.cdsDpto1.Open;
   dblcddptoidsol.Selected.Clear;
   dblcddptoidsol.Selected.Add('DPTOID'#9'2'#9'Código'#9#9);
   dblcddptoidsol.Selected.Add('DPTODES'#9'25'#9'Descripción'#9#9);
   // Fin: HPC_201809_PRE

   llena;
   deshabilita;
   btngraba.Enabled := False;
   If (DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString = '02') Or (DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString = '06') Then
   Begin
      btnedita.Enabled := False;
      btnliqben.Enabled := True;
      tsforpag.Enabled := False;
      btnanular.Enabled := False;  // SPP_201305_PRE
   End;
   // Inicio: HPC_201709_PRE
   // Se deshabilita los botones de actualización cuando el expediente es nulo.
   If DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString = '13' Then
   Begin
      btnedita.Enabled    := False;
      btngraba.Enabled    := False;
      btnfamiliar.Enabled := False;
      btnsegui.Enabled    := False;
      btnfonsol.Enabled   := False;
      btnliqben.Enabled   := False;
      btnanular.Enabled   := False;
      btnFecCargo.Enabled := False;
   End;
   // Fin: HPC_201709_PRE

// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
  xSql:='SELECT a.pvslbennr, '
       +   'nvl((select max(case when pvslnofc is not null then ''S'' else ''N'' end) '
       +         ' from PVS307 b '
       +        ' where a.pvslbennr = b.pvslbennr and pvslnofc is not null ),''N'') tiene_num_ofi '
       + ' FROM PVS306 a '
       + 'WHERE ASOID = '''+DM1.cdsExpLiq.FieldByName('ASOID').AsString+''' '
       +  ' and a.pvslbennr='''+DM1.cdsExpLiq.FieldByname('pvslbennr').AsString+''' and numbenori is not null ';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  sModExpR:='N';
  if (DM1.cdsQry.RecordCount=1) and (DM1.cdsQry.FieldByname('tiene_num_ofi').AsString='N') then
  begin
    tsforpag.Enabled := True;
    btngraba.Enabled := True;
    habilitaModFam;
    sModExpR:='S';
  end;
// Fin    HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
End;

Procedure TFModExpben.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If Key = #13 Then
   Begin
      Key := #0;
      Perform(CM_DIALOGKEY, VK_TAB, 0);
   End;
End;

Procedure TFModExpben.llena;
Var
   xSql: String;
Begin
   If DM1.cdsExpLiq.FieldByName('PVSTIPRET').AsString <> '' Then
      rgtipret.ItemIndex := DM1.cdsExpLiq.FieldByName('PVSTIPRET').AsInteger;
   xSql := 'SELECT * FROM APO201 WHERE ASOID = ' + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString);
   DM1.cdsAsociado.Close;
   DM1.cdsAsociado.DataRequest(xSql);
   DM1.cdsAsociado.Open;
   meregpen.Text := DM1.DevuelveValor('APO105', 'REGPENABR', 'REGPENID', Copy(DM1.cdsAsociado.FieldByName('REGPENID').AsString,1,2));
   If DM1.cdsAsociado.FieldByName('REGPENID').AsString = '03' Then
   Begin
      xSql := 'SELECT SUBSTR(PROV,4,2) CODAFP, PROVDES DESAFP  FROM TGE201 WHERE SUBSTR(PROV,1,1) = ''A'' AND CLAUXID = ''A'' AND SUBSTR(PROV,4,2) = '+QuotedStr(DM1.cdsAsociado.FieldByName('CODAFP').AsString);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      meregpen.Text := meregpen.Text + ' - ' + DM1.cdsQry.FieldByName('DESAFP').AsString;
   End;
  DM1.CargaImagenes(DM1.cdsAsociado.FieldByName('ASODNI').AsString);
  ImgFotoConfirme.Picture.Assign(DM1.Jpg);
  ImgFirmaConfirme.Picture.Assign(DM1.jpgFirma);
  llenaredit;
  If (DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString = '01') Or (DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString = '05') Or (DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString = '13') Then
  Begin
      xSql := 'SELECT * FROM TGE186 WHERE TIPBENEF IN (''01'',''02'',''03'')';
      DM1.cdsTipBenef.Close;
      DM1.cdsTipBenef.DataRequest(xSql);
      DM1.cdsTipBenef.Open;
      xSql := 'SELECT DPTOID, DPTODES FROM APO158 ORDER BY DPTOID';
      // Inicio: HPC_201809_PRE
      // Se modifica los nombres de los clientdataset, el componente
      // DM1.cdsDpto.Close;
      // DM1.cdsDpto.DataRequest(xSql);
      // DM1.cdsDpto.Open;
      // dblcdptoid.Selected.Clear;
      // dblcdptoid.Selected.Add('DPTOID'#9'2'#9'Código'#9#9);
      // dblcdptoid.Selected.Add('DPTODES'#9'25'#9'Departamento'#9#9);
      // dblcdptoid.Text := DM1.cdsExpLiq.FieldByName('DEPORIEXP').AsString;
      DM1.cdsDptooriexp.Close;
      DM1.cdsDptooriexp.DataRequest(xSql);
      DM1.cdsDptooriexp.Open;
      dblcdptoidori.Selected.Clear;
      dblcdptoidori.Selected.Add('DPTOID'#9'2'#9'Código'#9#9);
      dblcdptoidori.Selected.Add('DPTODES'#9'25'#9'Departamento'#9#9);
      dblcdptoidori.Text := DM1.cdsExpLiq.FieldByName('DEPORIEXP').AsString;
      // Fin: HPC_201809_PRE
      dblccodofi.Text := DM1.cdsExpLiq.FieldByName('OFIORIEXP').AsString;
      dbltipbenef.Text := DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString;
      meAsozipdes.Text := DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', DM1.cdsAsociado.FieldByName('ZIPID').AsString) + '/'
         + DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', Copy(DM1.cdsAsociado.FieldByName('ZIPID').AsString, 1, 4)) + '/'
         + DM1.DevuelveValor('APO158', 'DPTODES', 'DPTOID', Copy(DM1.cdsAsociado.FieldByName('ZIPID').AsString, 1, 2));
      meAsozipdeslab.Text := DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', DM1.cdsAsociado.FieldByName('ASODSTLABID').AsString) + '/'
         + DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', Copy(DM1.cdsAsociado.FieldByName('ASODSTLABID').AsString, 1, 4)) + '/'
         + DM1.DevuelveValor('APO158', 'DPTODES', 'DPTOID', Copy(DM1.cdsAsociado.FieldByName('ASODSTLABID').AsString, 1, 2));
      measotelef.Text := DM1.cdsAsociado.FieldByName('ASOTELF1').AsString;
      menumresnom.Text := DM1.cdsAsociado.FieldByName('ASORESNOM').AsString;
      dbdtpfecces.Date := DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsDateTime;
      menumresces.Text := DM1.cdsExpLiq.FieldByName('ASORESCESE').AsString;
      mefecresnom.Text := DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString;
      meAsoncta.Text := DM1.cdsAsociado.FieldByName('ASONCTA').AsString;
      meUpagoid.Text := DM1.cdsAsociado.FieldByName('UPAGOID').AsString;
      meUproid.Text := DM1.cdsAsociado.FieldByName('UPROID').AsString;
      meUseid.Text := DM1.cdsAsociado.FieldByName('USEID').AsString;
      meAsodir.Text := DM1.cdsAsociado.FieldByName('ASODIR').AsString;
      meAsodeslab.Text := DM1.cdsAsociado.FieldByName('ASODESLAB').AsString;
      meAsodirlab.Text := DM1.cdsAsociado.FieldByName('ASODIRLAB').AsString;
      meAsocodmod.Text := DM1.cdsAsociado.FieldByName('ASOCODMOD').AsString;
      meAsoApeNomDni.Text := DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString;
      meUpagoid.Text := DM1.cdsAsociado.FieldByName('UPAGOID').AsString;
      meUproid.Text := DM1.cdsAsociado.FieldByName('UPROID').AsString;
      meUseid.Text := DM1.cdsAsociado.FieldByName('USEID').AsString;
      meAsodir.Text := DM1.cdsAsociado.FieldByName('ASODIR').AsString;
      meAsodeslab.Text := DM1.cdsAsociado.FieldByName('ASODESLAB').AsString;
      meAsodirlab.Text := DM1.cdsAsociado.FieldByName('ASODIRLAB').AsString;
      If DM1.cdsAsociado.FieldByName('ASODNI').AsString = '' Then
      Begin
         xSql := 'SELECT TIPDOCABR FROM TGE159 WHERE TIPDOCCOD = ' + QuotedStr(DM1.cdsAsociado.FieldByName('TIPDOCCOD').AsString);
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         meAsoDocNum.Text := DM1.cdsQry.FieldByName('TIPDOCABR').AsString + '-' + DM1.cdsAsociado.FieldByName('ASODOCNUM').AsString;
      End
      Else
      Begin
         xSql := 'SELECT TIPDOCABR FROM TGE159 WHERE TIPDOCCOD = ' + QuotedStr('10');
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         meAsoDocNum.Text := DM1.cdsQry.FieldByName('TIPDOCABR').AsString + '-' + DM1.cdsAsociado.FieldByName('ASODNI').AsString;
      End;
      xSql := 'SELECT USENOM FROM APO101 WHERE USEID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('USEID').AsString) + ' AND UPAGOID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString) + ' AND UPROID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      meUsenom.Text := DM1.cdsQry.FieldByName('USENOM').AsString;
      xSql := 'SELECT UPAGONOM FROM APO103 WHERE UPAGOID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString) + ' AND UPROID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      meUpagonom.Text := DM1.cdsQry.FieldByName('UPAGONOM').AsString;
      xSql := 'SELECT UPRONOM FROM APO102 WHERE UPROID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      meUpronom.Text := DM1.cdsQry.FieldByName('UPRONOM').AsString;
     //Tomando registro para el ultimo aporte
      meanoultapo.Text := Copy(DM1.cdsExpLiq.FieldByName('PVSULTAPO').AsString, 1, 4);
      memesultapo.Text := Copy(DM1.cdsExpLiq.FieldByName('PVSULTAPO').AsString, 6, 2);
      If dbltipbenef.Text = '01' Then
      Begin
         rgtipret.Visible := True; // SPP_201307_PRE
         dbdtpfacinv.Visible := False;
         dbdtpfacinv.text := '';
      End;
      If dbltipbenef.Text = '02' Then
      Begin
         rgtipret.Visible := False; // SPP_201307_PRE
         dbdtpfacinv.Visible := True;
         dbdtpfacinv.Date := DM1.cdsExpLiq.FieldByName('ASOFECFAL').AsDateTime;
      End;
      If dbltipbenef.Text = '03' Then
      Begin
         rgtipret.Visible := False; // SPP_201307_PRE
         dbdtpfacinv.Visible := True;
         dbdtpfacinv.Date := DM1.cdsExpLiq.FieldByName('ASOFECINV').AsDateTime;
      End;
      pgmulti.TabIndex := 0;
      If DM1.cdsExpLiq.FieldByName('PVSCOBASO').AsString = 'S' Then
      Begin
         rgCobAso.ItemIndex := 0;
         dblcforpag.Text := DM1.cdsExpLiq.FieldByName('FORPAGOID').AsString;
         DM1.cdsFPago.Locate('TIPDESEID', dblcforpag.Text, []);
         meforpagodes.Text :=  DM1.cdsFPago.FieldByName('TIPDESEDES').AsString;
         If DM1.cdsFPago.FieldByName('FLACOBPRE').AsString = 'B' Then
            xSql := 'SELECT BANCOID, BANCONOM FROM TGE105 WHERE FLAVIGPRE = ''S'' AND CLAUXID = ''B'''
         Else
            xSql := 'SELECT BANCOID, BANCONOM FROM TGE105 WHERE FLAVIGPRE = ''S'' AND CLAUXID = ''C''';
         DM1.cdsBcos.Close;
         DM1.cdsBcos.DataRequest(xSql);
         DM1.cdsBcos.Open;
         dblcBanco.Text := DM1.cdsExpLiq.FieldByName('BANCOID').AsString;
         dblcagegir.Text := DM1.cdsExpLiq.FieldByName('AGENBCOID').AsString;
         measoncta.Text := DM1.cdsExpLiq.FieldByName('ASONCTA').AsString;
      End
      Else
      Begin
         rgCobAso.ItemIndex := 1;
      End;
  End;
   If (DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString = '02') Or (DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString = '06') Then
   Begin
      xSql := 'SELECT * FROM PVS306 WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsExpLiq.FieldByName('PVSLBENNR').AsString);
      DM1.cdsCabLiq.Close;
      DM1.cdsCabLiq.DataRequest(xSql);
      DM1.cdsCabLiq.Open;
      xSql := 'SELECT DPTOID, DPTODES FROM APO158';
      DM1.cdsDpto.Close;
      DM1.cdsDpto.DataRequest(xSql);
      DM1.cdsDpto.Open;
      // Inicio: HPC_201809_PRE
      // Se modifica nombre del componente
      // dblcdptoid.Text := DM1.cdsExpLiq.FieldByName('DEPORIEXP').AsString;
      dblcdptoidori.Text := DM1.cdsExpLiq.FieldByName('DEPORIEXP').AsString;
      // Fin: HPC_201809_PRE
      dblccodofi.Text := DM1.cdsExpLiq.FieldByName('OFIORIEXP').AsString;
      xSql := 'SELECT * FROM TGE186 WHERE TIPBENEF IN (''01'',''02'',''03'')';
      DM1.cdsTipBenef.Close;
      DM1.cdsTipBenef.DataRequest(xSql);
      DM1.cdsTipBenef.Open;
      dbltipbenef.Text := DM1.cdsCabLiq.FieldByName('PVSLTIPBE').AsString;
      menumresnom.Text := DM1.cdsCabLiq.FieldByName('ASORESNOM').AsString;
      mefecresnom.Text := DM1.cdsCabLiq.FieldByName('ASOFRESNOM').AsString;
      menumresces.Text := DM1.cdsCabLiq.FieldByName('ASORESCESE').AsString;
      dbdtpfecces.Date := DM1.cdsCabLiq.FieldByName('ASOFRESCESE').AsDateTime;
      meAsoncta.Text := DM1.cdsCabLiq.FieldByName('ASONCTA').AsString;
      meUproid.Text := DM1.cdsCabLiq.FieldByName('UPROID').AsString;
      xSql := 'SELECT UPRONOM FROM APO102 WHERE UPROID = ' + QuotedStr(meUproid.Text);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      meUpronom.Text := DM1.cdsQry.FieldByName('UPRONOM').AsString;
      meUpagoid.Text := DM1.cdsCabLiq.FieldByName('UPAGOID').AsString;
      xSql := 'SELECT UPAGONOM FROM APO103 WHERE UPAGOID = ' + QuotedStr(meUpagoid.Text) + ' AND UPROID = ' + QuotedStr(meUproid.Text);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      meUpagonom.Text := DM1.cdsQry.FieldByName('UPAGONOM').AsString;
      meUseid.Text := DM1.cdsCabLiq.FieldByName('USEID').AsString;
      xSql := 'SELECT USENOM FROM APO101 WHERE USEID = ' + QuotedStr(meUseid.Text) + ' AND UPAGOID = ' + QuotedStr(meUpagoid.Text) + ' AND UPROID = ' + QuotedStr(meUproid.Text);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      meUsenom.Text := DM1.cdsQry.FieldByName('USENOM').AsString;
      meAsodir.Text := DM1.cdsCabLiq.FieldByName('ASODIR').AsString;
      meAsodeslab.Text := DM1.cdsCabLiq.FieldByName('ASODESLAB').AsString;
      meAsodirlab.Text := DM1.cdsCabLiq.FieldByName('ASODIRLAB').AsString;
      meAsocodmod.Text := DM1.cdsCabLiq.FieldByName('ASOCODMOD').AsString;
      meAsoApeNomDni.Text := DM1.cdsCabLiq.FieldByName('ASOAPENOMDNI').AsString;
      If DM1.cdsCabLiq.FieldByName('ASODNI').AsString = '' Then
      Begin
         xSql := 'SELECT TIPDOCABR FROM TGE159 WHERE TIPDOCCOD = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('TIPDOCCOD').AsString);
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         meAsoDocNum.Text := DM1.cdsQry.FieldByName('TIPDOCABR').AsString + '-' + DM1.cdsCabLiq.FieldByName('ASODOCNUM').AsString;
      End
      Else
      Begin
         xSql := 'SELECT TIPDOCABR FROM TGE159 WHERE TIPDOCCOD = ' + QuotedStr('10');
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         meAsoDocNum.Text := DM1.cdsQry.FieldByName('TIPDOCABR').AsString + '-' + DM1.cdsCabLiq.FieldByName('ASODNI').AsString;
      End;
      meAsozipdes.Text := DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', DM1.cdsCabLiq.FieldByName('ZIPID').AsString) + '/'
         + DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', Copy(DM1.cdsCabLiq.FieldByName('ZIPID').AsString, 1, 4)) + '/'
         + DM1.DevuelveValor('APO158', 'DPTODES', 'DPTOID', Copy(DM1.cdsCabLiq.FieldByName('ZIPID').AsString, 1, 2));
      meAsozipdeslab.Text := DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', DM1.cdsCabLiq.FieldByName('ASODSTLABID').AsString) + '/'
         + DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', Copy(DM1.cdsCabLiq.FieldByName('ASODSTLABID').AsString, 1, 4)) + '/'
         + DM1.DevuelveValor('APO158', 'DPTODES', 'DPTOID', Copy(DM1.cdsCabLiq.FieldByName('ASODSTLABID').AsString, 1, 2));
      meanoultapo.Text := Copy(DM1.cdsCabLiq.FieldByName('PVSLULAP').AsString, 1, 4);
      memesultapo.Text := Copy(DM1.cdsCabLiq.FieldByName('PVSLULAP').AsString, 6, 2);
      If dbltipbenef.Text = '01' Then
      Begin
         rgtipret.Visible := True;
         rgtipret.ItemIndex := StrToInt(DM1.cdsExpLiq.FieldByName('PVSTIPRET').AsString);
         dbdtpfacinv.Visible := False;
         dbdtpfacinv.text := '';
      End;
      If dbltipbenef.Text = '02' Then
      Begin
         rgtipret.Visible := False; // SPP_201307_PRE
         dbdtpfacinv.Visible := True;
         dbdtpfacinv.Date := DM1.cdsExpLiq.FieldByName('ASOFECFAL').AsDateTime;
      End;
      If dbltipbenef.Text = '03' Then
      Begin
         rgtipret.Visible := False; // SPP_201307_PRE
         dbdtpfacinv.Visible := True;
         dbdtpfacinv.Date := DM1.cdsExpLiq.FieldByName('ASOFECINV').AsDateTime;
      End;
      pgmulti.TabIndex := 0;
      If DM1.cdsCabLiq.FieldByName('PVSCOBASO').AsString = 'S' Then
      Begin
         rgCobAso.ItemIndex := 0;
         dblcforpag.Text := DM1.cdsExpLiq.FieldByName('FORPAGOID').AsString;
         DM1.cdsFPago.Locate('TIPDESEID', dblcforpag.Text, []);
         If DM1.cdsFPago.FieldByName('FLACOBPRE').AsString = 'B' Then
            xSql := 'SELECT BANCOID, BANCONOM FROM TGE105 WHERE FLAVIGPRE = ''S'' AND CLAUXID = ''B'''
         Else
            xSql := 'SELECT BANCOID, BANCONOM FROM TGE105 WHERE FLAVIGPRE = ''S'' AND CLAUXID = ''C''';
         DM1.cdsBcos.Close;
         DM1.cdsBcos.DataRequest(xSql);
         DM1.cdsBcos.Open;
         dblcBanco.Text := DM1.cdsExpLiq.FieldByName('BANCOID').AsString;
         dblcagegir.Text := DM1.cdsExpLiq.FieldByName('AGENBCOID').AsString;
         measoncta.Text := DM1.cdsExpLiq.FieldByName('ASONCTA').AsString;
      End
      Else
      Begin
         rgCobAso.ItemIndex := 1;
      End;
   End;
   If dbltipbenef.Text = '01' Then
   Begin
      lblfacinv.Visible := False;
      dbdtpfacinv.Visible := False;
      dbdtpfacinv.Text := '';
      meAsocodmod.SetFocus;
   End;
   If dbltipbenef.Text = '02' Then
   Begin
      lblfacinv.Visible := True;
      lblfacinv.Caption := 'Fecha de fallecimiento :';
      dbdtpfacinv.Visible := True;
      dbdtpfacinv.SetFocus;
      rgCobAso.ItemIndex := 1;
      rgCobAso.Enabled := False;
   End;
   If dbltipbenef.Text = '03' Then
   Begin
      lblfacinv.Visible := True;
      lblfacinv.Caption := 'Fecha de invalidez :';
      dbdtpfacinv.Visible := True;
      dbdtpfacinv.SetFocus;
   End;
   If dbltipbenef.Text <> '02' Then
   Begin
      pgmulti.TabIndex := 0;
      rgCobAso.SetFocus;
   End;
   // Inicio: HPC_201809_PRE
   // Se habilita o deshabilita boton de fondo solidario
   xSql := 'SELECT count(*) REGISTROS FROM COB_FSC_DEUDA_FSC_CAB WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+ ' AND ID_EST_FSC NOT IN (''04'',''13'')';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   If DM1.cdsQry.FieldByName('REGISTROS').AsInteger = 0 Then btnfonsol.Enabled := False Else btnfonsol.Enabled := True;
   meapenomsol.Text     := DM1.cdsExpLiq.FieldByName('APENOMSOL').AsString;
   meDNIsol.Text        := DM1.cdsExpLiq.FieldByName('DNISOL').AsString;
   mevinparentesco.Text := DM1.cdsExpLiq.FieldByName('VINPARSOL').AsString;
   // Se asigna los valores a las variable de datos del solicitante
   metelsol.Text        := DM1.cdsExpLiq.FieldByName('TELEFONOSOL').AsString;
   medirsol.Text        := DM1.cdsExpLiq.FieldByName('DIRSOL').AsString;
   meemailsol.Text      := DM1.cdsExpLiq.FieldByName('EMAILSOL').AsString;
   dblcddptoidsol.Text     := Copy(DM1.cdsExpLiq.FieldByName('ZIPIDSOL').AsString,1,2);
   xSql := 'SELECT CIUDID, CIUDDES FROM APO123 WHERE DPTOID = '+QuotedStr(dblcddptoidsol.Text)+' ORDER BY CIUDID';
   DM1.cdsProvincia1.Close;
   DM1.cdsProvincia1.DataRequest(xSql);
   DM1.cdsProvincia1.Open;
   dblcdProvinciasol.Selected.Clear;
   dblcdProvinciasol.Selected.Add('CIUDID'#9'4'#9'Ubigeo'#9#9);
   dblcdProvinciasol.Selected.Add('CIUDDES'#9'23'#9'Provincia'#9#9);
   dblcdProvinciasol.Text  := Copy(DM1.cdsExpLiq.FieldByName('ZIPIDSOL').AsString,1,4);
   xSql := 'SELECT ZIPID, ZIPDES FROM APO122 WHERE CIUDID = '+QuotedStr(dblcdProvinciasol.Text)+' ORDER BY ZIPID';
   DM1.cdsDist2.Close;
   DM1.cdsDist2.DataRequest(xSql);
   DM1.cdsDist2.Open;
   dblcddistritosol.Selected.Clear;
   dblcddistritosol.Selected.Add('ZIPID'#9'6'#9'Ubigeo'#9#9);
   dblcddistritosol.Selected.Add('ZIPDES'#9'23'#9'Distrito'#9#9);
   dblcddistritosol.Text   := DM1.cdsExpLiq.FieldByName('ZIPIDSOL').AsString;
   medptosol.Text       := DM1.DevuelveValor('APO158', 'DPTODES', 'DPTOID', Copy(DM1.cdsExpLiq.FieldByName('ZIPIDSOL').AsString,1,2));
   meprovinciasol.Text  := DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', Copy(DM1.cdsExpLiq.FieldByName('ZIPIDSOL').AsString,1,4));
   medistritosol.Text   := DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', DM1.cdsExpLiq.FieldByName('ZIPIDSOL').AsString);
   If DM1.cdsExpLiq.FieldByName('FORSOLBEN').AsString = 'S' Then rgforsolben.ItemIndex := 0;
   If DM1.cdsExpLiq.FieldByName('FORSOLBEN').AsString = 'O' Then rgforsolben.ItemIndex := 1;
   DBDTPfecrecexp.Date := DM1.cdsExpLiq.FieldByName('FECRECEXP').AsDateTime;
   // Se asigna los valores del motivo de la causa de cese
   xCodCauCes := DM1.cdsExpLiq.FieldByName('CODCAUCES').AsString;
   mebuscacausa.Text := DM1.cdsExpLiq.FieldByName('PVSCAUSA').AsString;
   // Fin: HPC_201809_PRE
End;

// Inicio: HPC_201802_PRE
// Se modifica procedimiento si cobra el asociado
// Procedure TFModExpben.rgCobAsoClick(Sender: TObject);
// Begin
//    If rgCobAso.ItemIndex = 0 Then
//    Begin
//       gbforpag.Visible := True;
//       If dblcforpag.Text = '05' Then
//       Begin
//          lblagegir.Visible   := True;
//          dblcagegir.Visible  := True;
//          pnlagegir.Visible   := True;
//          lbldospun03.Visible := True;
//       End;
//       If dblcforpag.Text = '06' Then
//       Begin
//          lblasoncta.Visible  := True;
//          pnlasoncta.Visible  := True;
//          lbldospun04.Visible := True;
//       End;
//       dblcforpag.Setfocus;
//    End
//    Else
//       gbforpag.Visible := False;
// End;
Procedure TFModExpben.rgCobAsoClick(Sender: TObject);
Begin
   If rgCobAso.ItemIndex = 0 Then
   Begin
      // Inicio: HPC_201809_PRE
      // Se habilita grupo de forma de pago
      gbforpag.Visible := True;
      // Fin: HPC_201809_PRE
      btnfamiliar.Enabled := false;
      dblcBanco.Visible := true;
      lblptobco.Visible := True;
      lblbanco.Visible := true;
      pnlbanco.Visible := true;
      lblforpag.Visible := true;
      dblcforpag.Visible := true;
      pnlforpag.Visible := true;
      dblcforpag.Enabled := True;
      If dblcforpag.Text = '05' Then
      Begin
         lblagegir.Visible := True;
         lblptoage.Visible := True;
         dblcagegir.Visible := True;
         pnlagegir.Visible := True;
      End;
      If dblcforpag.Text = '06' Then
      Begin
         lblasoncta.Visible := True;
         lblptocta.Visible := True;
         pnlasoncta.Visible := True;
      End;
      dblcforpag.Setfocus;
   End
   Else
   Begin
      lblptoforpag.Visible := False;
      lblptobco.Visible := False;
      lblptocta.Visible := False;
      lblptoage.Visible := False;
      dblcBanco.Visible := false;
      lblbanco.Visible := false;
      pnlbanco.Visible := false;
      lblforpag.Visible := false;
      dblcforpag.Visible := false;
      pnlforpag.Visible := false;
      lblagegir.Visible := false;
      dblcagegir.Visible := false;
      pnlagegir.Visible := false;
      lblasoncta.Visible := false;
      pnlasoncta.Visible := false;
      btnfamiliar.Enabled := True;
      // Inicio: HPC_201809_PRE
      // Se deshabilita grupo de forma de pago
      gbforpag.Visible := False;
      // Fin: HPC_201809_PRE
   End;
End;
// Fin: HPC_201802_PRE


Procedure TFModExpben.dblcdBancoidChange(Sender: TObject);
Begin
   If DM1.cdsTipBenef.Locate('TIPBENEF', dbltipbenef.Text, []) Then
      metipbenef.Text := DM1.cdsTipBenef.FieldByName('BENEFDES').AsString
   Else
   Begin
      If Length(dbltipbenef.Text) <> 2 Then
      Begin
         Beep;
         dbltipbenef.Text := '';
      End;
   End;
End;

Procedure TFModExpben.dblcdreporiExit(Sender: TObject);
Begin
   meAsocodmod.SetFocus;
End;

Procedure TFModExpben.dbltipbenefChange(Sender: TObject);
Begin
   // Inicio: HPC_201809_PRE
   // Se retira componente que captura causa de cese
   mebuscacausa.Text := '';
   If DM1.cdsTipBenef.Active = False Then Exit;
   // // INICIO HPC_201509_PRE
   // CboCausaCese.FG_CARGA_DATOS(dbltipbenef.Text);
   // // FIN HPC_201509_PRE
   // Fin: HPC_201809_PRE
   If Length(dbltipbenef.Text) = 2 Then
   Begin
      If DM1.cdsTipBenef.Locate('TIPBENEF', dbltipbenef.Text, []) Then
      Begin
         metipbenef.Text := DM1.cdsTipBenef.FieldByName('BENEFDES').AsString;
      End
      Else
      Begin
         MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
         dbltipbenef.Text := '';
         metipbenef.Text := '';
         dbltipbenef.SetFocus;
      End;
   End;
   If (dbltipbenef.Text = '01') Or (dbltipbenef.Text = '03') Then rgCobAso.Enabled := True;
  // Verificando el tipo de beneficio
   If dbltipbenef.Text = '01' Then
   Begin
      lblfacinv.Visible := False;
      dbdtpfacinv.Visible := False;
      dbdtpfacinv.Text := '';
      // INICIO HPC_201509_PRE
      // mefallecimiento.Text := '';
      // lblfallecimiento.Visible := False;
      // pnlfallecimiento.Visible := False;
      // FIN HPC_201509_PRE
   End;
   If dbltipbenef.Text = '02' Then
   Begin
      lblfacinv.Visible := True;
      lblfacinv.Caption := 'Fecha de fallecimiento :';
      dbdtpfacinv.Visible := True;
      // INICIO HPC_201509_PRE
      // lblfallecimiento.Visible := True;
      // pnlfallecimiento.Visible := True;
      // FIN HPC_201509_PRE
      dbdtpfacinv.SetFocus;
      Exit;
   End;
   If dbltipbenef.Text = '03' Then
   Begin
      lblfacinv.Visible := True;
      lblfacinv.Caption := 'Fecha de invalidez :';
      dbdtpfacinv.Visible := True;
      // INICIO HPC_201509_PRE
      // lblfallecimiento.Visible := False;
      // pnlfallecimiento.Visible := False;
      // mefallecimiento.Text := '';
      // FIN HPC_201509_PRE
      dbdtpfacinv.SetFocus;
      Exit;
   End;
End;

// Inicio: HPC_201809_PRE 
// Se modifica nombre del componente 
Procedure TFModExpben.dblcDeporiChange(Sender: TObject);
Var
   xSql: String;
Begin
   // If dblcdptoid.Text = '' Then
   If dblcdptoidori.Text = '' Then
   Begin
      // medptodes.Text := '';
      medptodesori.Text := '';
      dblccodofi.Text := '';
      meofides.Text := '';
   End;
   // If Length(dblcdptoid.Text) = 2 Then
   If Length(dblcdptoidori.Text) = 2 Then
   Begin
      //If DM1.cdsDpto.Locate('DPTOID', dblcdptoid.Text, []) Then
      If DM1.cdsDptooriexp.Locate('DPTOID', dblcdptoidori.Text, []) Then
      Begin
         // medptodes.Text := DM1.cdsDpto.FieldByName('DPTODES').AsString;
         medptodesori.Text := DM1.cdsDptooriexp.FieldByName('DPTODES').AsString;
         // xSql := 'SELECT OFDESID, OFDESNOM FROM APO110 WHERE DPTOID = '+QuotedStr(dblcdptoid.Text)+' ORDER BY OFDESID';
         xSql := 'SELECT OFDESID, OFDESNOM FROM APO110 WHERE DPTOID = '+QuotedStr(dblcdptoidori.Text)+' ORDER BY OFDESID';
         DM1.cdsOfDes.Close;
         DM1.cdsOfDes.DataRequest(xSql);
         DM1.cdsOfDes.Open;
         dblccodofi.Selected.Clear;
         dblccodofi.Selected.Add('OFDESID'#9'2'#9'Código'#9#9);
         dblccodofi.Selected.Add('OFDESNOM'#9'35'#9'Oficina'#9#9);
      End
      Else
      Begin
         MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
         // dblcdptoid.Text := '';
         // medptodes.Text := '';
         dblcdptoidori.Text := '';
         medptodesori.Text := '';
         dblccodofi.Text := '';
         meofides.Text := '';
         // dblcprovid.Text := '';
         // meprovdes.Text := '';
         // dblcdistid.Text := '';
         // medistdes.Text := '';
         Exit;
      End;
   End;
End;
// Fin; HPC_201809_PRE

Procedure TFModExpben.dblcBancoChange(Sender: TObject);
Begin
   If Trim(dblcBanco.Text) = '' Then
   Begin
      dblcBanco.Text := '';
      mebancodes.Text := '';
   End;
   If Length(dblcBanco.Text) = 2 Then
   Begin
      If DM1.cdsBcos.Locate('BANCOID', dblcBanco.Text, []) Then
      Begin
         mebancodes.Text := DM1.cdsBcos.FieldByName('BANCONOM').AsString;
      End
      Else
      Begin
         MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
         dblcBanco.Text := '';
         mebancodes.Text := '';
      End;
   End;
End;

Procedure TFModExpben.dblcagegirChange(Sender: TObject);
Begin
   If dblcforpag.Text = '05' Then
   Begin
      If dblcagegir.Text = '' Then meagengir.Text := '';
      If Length(dblcagegir.Text) = 8 Then
      Begin
         If DM1.cdsAgBco.Locate('AGENBCOID', dblcagegir.Text, []) Then
         Begin
            meagengir.Text := DM1.cdsAgBco.FieldByName('AGENBCODES').AsString;
         End
         Else
         Begin
            MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
            dblcagegir.Text := '';
            meagengir.Text := '';
         End;
      End;
   End;
End;

Procedure TFModExpben.dblcagegirExit(Sender: TObject);
Var
   xSql: String;
Begin
   If Trim(dblcagegir.Text) <> '' Then
   Begin
      xSql := 'SELECT * FROM COB102 WHERE AGENBCOID = ' + QuotedStr(dblcagegir.Text);
      If DM1.verificaexiste(xSql) = False Then
      Begin
         MessageDlg('Código de agencia no valida', mtInformation, [mbOk], 0);
         dblcagegir.Text := '';
         dblcagegir.SetFocus;
         Exit;
      End;
   End;
   btngraba.SetFocus;
End;

Procedure TFModExpben.btngrabaClick(Sender: TObject);
Var
   xReg, xSql, xCobAso, xultapo, xfecinval, xfecfalle: String;
   xforsolben:String;
   xtipret:String;
   xsCODCAREXP : String;
Begin
   DM1.bmk := DM1.cdsExpLiq.GetBookmark;
   If dbltipbenef.Text = '01' Then
      If rgtipret.ItemIndex = -1 Then
         xtipret := '0'
      Else
         xtipret := IntToStr(rgtipret.ItemIndex)
   Else
      xtipret := '';

  xSql:='SELECT A.CODCAREXP, TRUNC(B.FECHA) FECHA_HOJA_CARGO '
       + ' FROM DB2ADMIN.PRE_CARGO_EXPEDIENTE_MOV A, '
       + '      DB2ADMIN.PRE_CARGO_EXPEDIENTE_EST_MOV B '
       +' WHERE A.CODCAREXP = B.CODCAREXP '
       +  ' AND B.CODCAREXPEST = ''PENDIENTE'' '
       +  ' AND A.ASOID ='''+ DM1.cdsAsociado.FieldByName('ASOID').AsString + '''';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  If DM1.cdsQry.RecordCount<=0 Then
  Begin
     MessageDlg('NO existe Hoja de Cargo. ', mtError, [mbOk], 0);
     Exit;
  End;
// Fin   HPC_201707_PRE : Validar la Fecha de la Hoja de Cargo
   If chksolicitud = True Then
   Begin
      xfecinval := '';
      xfecfalle := '';
      If dbltipbenef.Text = '02' Then
      Begin
         xfecinval := '';
         xfecfalle := dbdtpfacinv.Text;
      End;
      If dbltipbenef.Text = '03' Then
      Begin
         xfecinval := dbdtpfacinv.Text;
         xfecfalle := '';
      End;
      If rgforsolben.ItemIndex = 0 then xforsolben := 'S';
      If rgforsolben.ItemIndex = 1 then xforsolben := 'O';
      // Verificar si cuenta con registro en la tabla de desgravamen
      If dbltipbenef.Text = '01' Then
      Begin
         xSql := 'SELECT B.ESTAPRDES FROM ASO_FAC_GES_CAB A, ASO_FAC_GES_DET B WHERE A.NUMMEM = '+QuotedStr('EXP'+DM1.cdsExpLiq.FieldByName('PVSEXPNRO').AsString)
         +' AND A.IDEGESFAL = B.IDEGESFAL AND B.ASOID =  '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString);
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         If (DM1.cdsQry.RecordCount > 0) And (DM1.cdsQry.FieldByName('ESTAPRDES').AsString = 'APLICADO') Then
         Begin
            MessageDlg('El cambio no procede ya que el asociado tiene créditos cancelados por desgravamen', mtError, [mbOk],0);
            Exit;
         End;
      End;
      If MessageDlg('¿ Seguro de modificar el expediente de liquidación ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         If rgCobAso.ItemIndex = 0 Then
            xCobAso := 'S'
         Else
            xCobAso := 'N';
         xultapo := trim(meanoultapo.Text) + '/' + Trim(memesultapo.Text);
         // Inicio: HPC_201802_PRE
         // Se valida cuando forma de solicitud del beneficio 
         If rgforsolben.ItemIndex = 1 Then
         Begin
            xCobAso := '';
            dblcforpag.Text    := '';
            dblcBanco.Text     := '';
            dblcagegir.Text    := '';
            meAsoncta.Text     := '';
         End;
         // Fin: HPC_201802_PRE
         xSql := 'UPDATE PVS301 SET '
            + '  PVSTIPBEN = ' + QuotedStr(dbltipbenef.Text)
            + ', ASORESNOM = ' + QuotedStr(menumresnom.Text)
            + ', ASOFRESNOM = ' + QuotedStr(mefecresnom.Text)
            + ', ASORESCESE = ' + QuotedStr(menumresces.Text)
            + ', ASOFRESCESE = ' + QuotedStr(dbdtpfecces.Text)
            + ', FORPAGOID = ' + QuotedStr(dblcforpag.Text)
            + ', BANCOID = ' + QuotedStr(dblcBanco.Text)
            + ', AGENBCOID = ' + QuotedStr(dblcagegir.Text)
            + ', ASONCTA = ' + QuotedStr(measoncta.Text)
            + ', PVSULTAPO = ' + QuotedStr(xultapo)
            + ', PVSCOBASO = ' + QuotedStr(xCobAso)
            + ', ASOFECINV = ' + QuotedStr(xfecinval)
            + ', ASOFECFAL = ' + QuotedStr(xfecfalle)
            // Inicio: HPC_201809_PRE
            // Se modifica la actualización de la causa de cese del asociado
            // + ', PVSCAUSA = SUBSTR(' + QuotedStr(CboCausaCese.cbListaDatos.Text) + ',1,50),'
            + ', PVSCAUSA =  SUBSTR(' + QuotedStr(mebuscacausa.Text)+',1,50)'
            + ', ASOAPENOMDNI = ' + QuotedStr(meAsoApeNomDni.Text)
            // Fin: HPC_201809_PRE
            + ', ASOFECNAC = ' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOFECNAC').AsString)
            + ', TIPDOCCOD = ' + QuotedStr(DM1.cdsAsociado.FieldByName('TIPDOCCOD').AsString)
            + ', ASODOCNUM = ' + QuotedStr(DM1.cdsAsociado.FieldByName('ASODOCNUM').AsString)
            + ', ASODNI = ' + QuotedStr(DM1.cdsAsociado.FieldByName('ASODNI').AsString)
            + ', USUARIO = ' + QuotedStr(DM1.wUsuario) + ', FREG = TO_DATE(SYSDATE), HREG = SYSDATE'
            + ', FORSOLBEN = ' + QuotedStr(xforsolben) // SPP_201306_PRE
            + ', APENOMSOL = ' + QuotedStr(meapenomsol.Text)
            + ', DNISOL = ' + QuotedStr(meDNIsol.Text)
            + ', VINPARSOL = ' + QuotedStr(mevinparentesco.Text)
            + ', PVSTIPRET = ' + QuotedStr(xtipret)
            + ', TIPBENEF = ' + QuotedStr(dbltipbenef.Text)
            // Inicio: HPC_201809_PRE
            // Se actualiza datos del solicitante en la tabla del expediente de beneficio
            // + ', CODCAUCES = ' + QuotedStr(CboCausaCese.FG_OBTENER_CODIGO_CODCAUCES)
            + ', CODCAUCES = ' + QuotedStr(xCodCauCes)
            // Inicio: HPC_201809_PRE
            // Se modifica nombre del componente
            // + ', DEPORIEXP = ' + QuotedStr(dblcdptoid.Text)
            + ', DEPORIEXP = ' + QuotedStr(dblcdptoidori.Text)
            // Fin: HPC_201809_PRE
            + ', OFIORIEXP = ' + QuotedStr(dblccodofi.Text)
            + ', FECRECEXP = ' + QuotedStr(DBDTPfecrecexp.Text)
            + ', TELEFONOSOL = ' + QuotedStr(metelsol.Text)
            + ', DIRSOL = ' + QuotedStr(medirsol.Text)
            + ', EMAILSOL = ' + QuotedStr(meemailsol.Text)
            + ', ZIPIDSOL = ' + QuotedStr(dblcddistritosol.Text)
            // Fin: HPC_201809_PRE
            + ' WHERE ASOID = ' + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString)
            + ' AND PVSEXPNRO = ' + QuotedStr(DM1.cdsExpLiq.FieldByName('PVSEXPNRO').AsString);
         DM1.DCOM1.AppServer.EjecutaSQL(xSql);
         // Actualizar Liquidación
         xSql:='UPDATE PVS306 SET PVSCOBASO = ' + QuotedStr(xCobAso)
              + ' WHERE ASOID = ' + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString)
              +   ' AND pvslbennr = '+ QuotedStr(DM1.cdsExpLiq.FieldByName('pvslbennr').AsString);
         DM1.DCOM1.AppServer.EjecutaSQL(xSql);
         // Insertando Resolución de nombramiento si es que se modifico
         If (DM1.cdsAsociado.FieldByName('ASORESNOM').AsString <> menumresnom.text) Or (DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString <> mefecresnom.text) Then
         Begin
            xSql := 'UPDATE APO205 SET RESFVIG = ''N'' WHERE ASOID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString) + ' AND RESID = ''01'' ';
            xSql := 'INSERT INTO APO205 (ASOID, ASOCODMOD, ASOCODAUX, ASONRES, ASOFRES, RESID, RESFVIG, USUARIO, FREG, HREG)'
               + ' VALUES (' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString) + ',' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOCODMOD').AsString)
               + ',' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOCODAUX').AsString) + ',' + QuotedStr(menumresnom.Text) + ',' + QuotedStr(mefecresnom.Text) + ', ''01'', ''S'', '
               + QuotedStr(DM1.wUsuario) + ',' + 'TO_DATE(SYSDATE), SYSDATE )';
            DM1.DCOM1.AppServer.EjecutaSQL(xSql);
         End;
         // Insertando Resolución de cese si es que se modifico
         If (DM1.cdsAsociado.FieldByName('ASORESCESE').AsString <> menumresces.text) Or (DM1.cdsAsociado.FieldByName('ASOFRESCESE').AsString <> dbdtpfecces.text) Then
         Begin
            xSql := 'UPDATE APO205 SET RESFVIG = ''N'' WHERE ASOID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString) + ' AND RESID = ''04'' ';
            xSql := 'INSERT INTO APO205 (ASOID, ASOCODMOD, ASOCODAUX, ASONRES, ASOFRES, RESID, RESFVIG, USUARIO, FREG, HREG)'
               + ' VALUES (' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString) + ',' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOCODMOD').AsString)
               + ',' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOCODAUX').AsString) + ',' + QuotedStr(menumresces.Text) + ',' + QuotedStr(dbdtpfecces.text) + ', ''04'', ''S'', '
               + QuotedStr(DM1.wUsuario) + ',' + 'TO_DATE(SYSDATE), SYSDATE )';
            DM1.DCOM1.AppServer.EjecutaSQL(xSql);
         End;
         If (DM1.cdsAsociado.FieldByName('ASORESNOM').AsString <> menumresnom.text) Or (DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString <> mefecresnom.text)
            Or (DM1.cdsAsociado.FieldByName('ASORESCESE').AsString <> menumresces.text) Or (DM1.cdsAsociado.FieldByName('ASOFRESCESE').AsString <> dbdtpfecces.text)
            Or (dbltipbenef.Text <> DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString) Then
         Begin
            xReg := DM1.CodReg;
            DM1.Registro_Aud(DM1.cdsExpLiq.FieldByName('ASOID').AsString, '0', xReg);
            xSql :='UPDATE APO201 '
                  +'SET ASORESNOM = ' + QuotedStr(menumresnom.Text)+','
                  +'    ASOFRESNOM = ' + QuotedStr(mefecresnom.Text)+','
                  +'    ASORESCESE = ' + QuotedStr(menumresces.Text)+','
                  +'    ASOFRESCESE = ' + QuotedStr(dbdtpfecces.text);
            If dbltipbenef.Text = '02' Then
               xSql := xSql + ', FALLECIDO = ''S'' ';
            xSql := xSql + 'WHERE ASOID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString);
            DM1.DCOM1.AppServer.EjecutaSQL(xSql);
            DM1.Registro_Aud(DM1.cdsExpLiq.FieldByName('ASOID').AsString, '1', xReg);
         End;
         // Si el registro fue ingresado por la Web se procede a cesar al asociado
         If DM1.cdsExpLiq.FieldByName('GENPORWEB').AsString = 'S' Then
         Begin
            xSql := 'UPDATE PVS301 SET VERSEDE = ''S'' WHERE ASOID = '
            +QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString)+' AND PVSEXPNRO = '+QuotedStr(DM1.cdsExpLiq.FieldByName('PVSEXPNRO').AsString);
            DM1.DCOM1.AppServer.EjecutaSQL(xSql);
            // VERIFICADO
            xSql := 'Begin SP_PVS_SEG_EXP('+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+', '+QuotedStr(DM1.cdsExpLiq.FieldByName('PVSEXPNRO').AsString)
            +', ''02'', ''01'', TO_DATE(SYSDATE,''DD/MM/YYYY''), '+QuotedStr(DM1.wUsuario)+', NULL); End;';
            DM1.DCOM1.AppServer.EjecutaSQL(xSql);
         End;
         If Not DM1.inserta_aso_resolucion(DM1.cdsExpLiq.FieldByName('ASOID').AsString) Then
            MessageDlg('El expediente fue registrado con errores en la tabla de resoluciones', mtInformation, [mbOk], 0)
         Else
            MessageDlg('Grabación Ok', mtInformation, [mbOk], 0);
         If DM1.numeroexpediente = '' Then DM1.numeroexpediente := DM1.cdsExpLiq.FieldByName('PVSEXPNRO').AsString;
         // Inicio: HPC_201809_PRE
         // Esta funcion ya no se utiliza
         // DM1.registrasuceso(DM1.cdsExpLiq.FieldByName('ASOID').AsString, dbltipbenef.Text, CboCausaCese.cbListaDatos.Text, dbdtpfacinv.Text);
         // Final: HPC_201809_PRE         DM1.xSgr := 'G';
         deshabilita;
         DM1.cdsExpLiq.GotoBookmark(DM1.bmk);
         btngraba.Enabled := False;
         btnedita.Enabled := True;
         FModExpben.Close;
      End;
   End;
End;

Procedure TFModExpben.btncerrarClick(Sender: TObject);
Begin
   // Inicio: HPC_201809_PRE
   // Se envie variable que se realizo la busqueda
   DM1.xCnd := 'M';
   // Fin: HPC_201809_PRE
   FModExpben.Close;
End;

Procedure TFModExpben.btncreditosClick(Sender: TObject);
Var
   xSql: String;
Begin
   xSql := 'SELECT ASOID, CREDID, CREINTERES, CREDFLAT, ASOTIPID, SUBSTR(CREDID,10,6) NUMERO, CREFOTORG, TMONABR, CREMTOOTOR,'
   +' CRENUMCUO, CRESDOACT, TIPCREDES, CREESTADO, TIPDESEID, TIPCREID, USUARIO, FORPAGOID, TASFONDES, OFDESID FROM CRE301'
   +' WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND CREESTID = ''02''';
   DM1.cdsCreditos.Close;
   DM1.cdsCreditos.DataRequest(xSql);
   DM1.cdsCreditos.Open;
   Try
      fMstCre := TfMstCre.create(Self);
      fMstCre.ShowModal;
   Finally
      fMstCre.Free;
   End;
End;

Procedure TFModExpben.deshabilita;
//Inicio: SPP_201401_PRE
//var
//   xSQL : String;
//Fin: SPP_201401_PRE
Begin
   // Inicio: HPC_201809_PRE
   // Se retira componente que guarda la causa de cese y se habilita boton de causa de cese
   // CboCausaCese.Enabled := False;
   btnbuscacausa.Enabled := False;
   // Se valida que la impresión solo sea para origen de expediente sede central y usuario de sede central
   If (DM1.wofides = '01') And  (dblccodofi.Text = '01') Then
      btnsolbenef.Enabled := True
   Else
      btnsolbenef.Enabled := False;
   // Fin: HPC_201809_PRE
   rgtipret.Enabled := False;  // SPP_201307_PRE
   meAsocodmod.Enabled := False;
   meAsoDocNum.Enabled := False;
   meAsoApeNomDni.Enabled := False;
   meUseid.Enabled := False;
   meUsenom.Enabled := False;
   meUpagoid.Enabled := False;
   meUpagonom.Enabled := False;
   meUproid.Enabled := False;
   meUpronom.Enabled := False;
   meAsodir.Enabled := False;
   meAsozipdes.Enabled := False;
   meAsodeslab.Enabled := False;
   meAsodirlab.Enabled := False;
   meAsozipdeslab.Enabled := False;
   dbltipbenef.Enabled := False;
   // Inicio: HPC_201809_PRE
   // dblcdptoid.Enabled := False;
   dblcdptoidori.Enabled := False;
   // Fin: HPC_201809_PRE
   // Inicio: HPC_201605_PRE --Se retira
   // dblcprovid.Enabled := False;
   // dblcdistid.Enabled := False;
   // dblcRepori.Enabled := False;
   // Fin: HPC_201605_PRE
   rgCobAso.Enabled := False;
   dblcforpag.Enabled := False;
   dblcBanco.Enabled := False;
   dblcagegir.Enabled := False;
   measoncta.Enabled := False;
   menumresces.Enabled := False;
   dbdtpfecces.Enabled := False;
   meanoultapo.Enabled := False;
   memesultapo.Enabled := False;
   dbdtpfacinv.Enabled := False;
   // INICIO HPC_201509_PRE
   //mefallecimiento.Enabled := False;
   // FIN HPC_201509_PRE
   // Inicio: SPP_201304_PRE
   {
   btnfonsol.Enabled := False;
   xSql := 'SELECT count(*) RESULTADO '
          +'FROM COB_FSC_DEUDA_FSC_CAB A '
          +'WHERE A.ASOID = '+QuotedStr(DM1.cdsAsociado.Fieldbyname('ASOID').AsString)
          +'  AND A.ID_EST_FSC NOT IN (''04'',''13'') ';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(XSQL);
   DM1.cdsQry.Open;
   If DM1.cdsQry.FieldByName('RESULTADO').AsInteger > 0 Then
      btnfonsol.Enabled := True;
   }
   // Fin: SPP_201304_PRE

   // Inicio: SPP_201305_PRE
   meapenomsol.Enabled     := False;
   meDNIsol.Enabled        := False;
   mevinparentesco.Enabled := False;

   // Inicio: HPC_201809_PRE
   // Se deshabilita datos del solicitante
   metelsol.Enabled := False;
   medirsol.Enabled := False;
   dblcddptoidsol.Enabled := False;
   dblcdProvinciasol.Enabled := False;
   dblcddistritosol.Enabled := False;
   meemailsol.Enabled := False;
   // Fin: HPC_201809_PRE








   // Fin: SPP_201305_PRE

   rgforsolben.Enabled := False;    // SPP_201306_PRE Deshabilita radiogroup de origen de la solicitud
   // Inicio: HPC_201605_PRE --Validacion
   DBDTPfecrecexp.Enabled := False;
   dblccodofi.Enabled := False;
   // Fin: HPC_201605_PRE

End;

Procedure TFModExpben.habilita;
Begin
   // Inicio: HPC_201809_PRE
   // Se retira componente que actualiza la causa de cese y se habilita boton
   // CboCausaCese.Enabled := True;
   btnbuscacausa.Enabled := True;
   // Fin: HPC_201809_PRE
   rgtipret.Enabled    := True;
   dbltipbenef.Enabled := True;
   // Inicio: HPC_201809_PRE
   // dblcdptoid.Enabled := True;
   dblcdptoidori.Enabled := True;
   // Fin: HPC_201809_PRE
   dbdtpfacinv.Enabled := true;
   // INICIO HPC_201509_PRE
   //mefallecimiento.Enabled := true;
   // FIN HPC_201509_PRE
   If (dbltipbenef.Text = '01') Or (dbltipbenef.Text = '03') Then
      rgCobAso.Enabled := True
   Else
      rgCobAso.Enabled := False;
   dblcforpag.Enabled := true;
   dblcBanco.Enabled := true;
   dblcagegir.Enabled := true;
   measoncta.Enabled := true;
   menumresces.Enabled := true;
   dbdtpfecces.Enabled := true;
   meanoultapo.Enabled := true;
   memesultapo.Enabled := true;
   meapenomsol.Enabled     := True;
   meDNIsol.Enabled        := True;
   mevinparentesco.Enabled := True;

   // Inicio: HPC_201809_PRE
   // Se habilita datos del solicitante
   metelsol.Enabled := true;
   medirsol.Enabled := true;
   dblcddptoidsol.Enabled := true;
   dblcdProvinciasol.Enabled := true;
   dblcddistritosol.Enabled := true;
   meemailsol.Enabled := true;
   // Fin: HPC_201809_PRE







   rgforsolben.Enabled := True;
   DBDTPfecrecexp.Enabled := True;
   dblccodofi.Enabled := True;
End;


// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
Procedure TFModExpben.habilitaModFam;
Begin
   rgtipret.Enabled    := False;
   meAsocodmod.Enabled := False;
   meAsoDocNum.Enabled := False;
   meAsoApeNomDni.Enabled := False;
   meUseid.Enabled    := False;
   meUsenom.Enabled   := False;
   meUpagoid.Enabled  := False;
   meUpagonom.Enabled := False;
   meUproid.Enabled   := False;
   meUpronom.Enabled  := False;
   meAsodir.Enabled   := False;
   meAsozipdes.Enabled := False;
   meAsodeslab.Enabled := False;
   meAsodirlab.Enabled := False;
   meAsozipdeslab.Enabled := False;
   dbltipbenef.Enabled := False;
   // Inicio: HPC_201809:PRE
   // Se modifica nombre del componente
   // dblcdptoid.Enabled := False;
   dblcdptoidori.Enabled := False;
   // Fin: HPC_201809:PRE
   // Inicio: HPC_201605_PRE --Se retira
   // dblcprovid.Enabled := False;
   // dblcdistid.Enabled := False;
   // dblcRepori.Enabled := False;
   // Fin: HPC_201605_PRE

   rgCobAso.Enabled   := True;
   dblcforpag.Enabled := True;
   dblcBanco.Enabled  := True;

   dblcagegir.Enabled := False;
   measoncta.Enabled := False;
   menumresces.Enabled := False;
   dbdtpfecces.Enabled := False;
   meanoultapo.Enabled := False;
   memesultapo.Enabled := False;
   dbdtpfacinv.Enabled := False;
   meapenomsol.Enabled     := False;
   meDNIsol.Enabled        := False;
   mevinparentesco.Enabled := False;

   // Inicio: HPC_201809_PRE
   // Se deshabilita datos del solicitante
   metelsol.Enabled := False;
   medirsol.Enabled := False;
   dblcddptoidsol.Enabled := False;
   dblcdProvinciasol.Enabled := False;
   meemailsol.Enabled := False;
   // Fin: HPC_201809_PRE






   rgforsolben.Enabled := False;    // SPP_201306_PRE Deshabilita radiogroup de origen de la solicitud
End;
// Fin   HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios

Procedure TFModExpben.btneditaClick(Sender: TObject);
Begin
   If DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString = '02' Then
   Begin
      MessageDlg('Expediente no puede ser modificado. Ya fue liquidado', mtInformation, [mbOk], 0);
      Exit;
   End;
   habilita;
   btngraba.Enabled := True;
   btnedita.Enabled := False;
   // Inicio: HPC_201809_PRE 
   // Se modifica nombre del componente 
   // dblcdptoid.SetFocus;
   dblcdptoidori.SetFocus;
   // Fin: HPC_201809_PRE 
End;

Procedure TFModExpben.btnaportesClick(Sender: TObject);
Begin
   // Inicio: HPC_201704_PRE
   // Se añade nueva forma "Fnuerepcueind" para proceso de las cuentas individuales
   // y se retira "fmscueind"
   If (DM1.cdsAsociado.FieldByName('ASOTIPID').AsString <> 'DO') And (DM1.cdsAsociado.FieldByName('ASOTIPID').AsString <> 'CE') Then
   Begin
      MessageDlg('No es un Asociado Activo O Cesante', mtInformation, [mbOk], 0);
      Exit;
   End;
   If DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString = '' Then
   Begin
      MessageDlg('Asociado no cuenta con resolución de nombramiento', mtInformation, [mbOk], 0);
      Exit;
   End;
   // Try
   //    fmscueind := Tfmscueind.create(Self);
   //    fmscueind.ShowModal;
   // Finally
   //    fmscueind.Free;
   // End;
   // Inicio: HPC_201705_PRE
   // Se asigna variable con numero de liquidación de beneficio
   DM1.xpvslbennr := DM1.cdsExpLiq.FieldByName('PVSLBENNR').AsString;
   // Fin: HPC_201705_PRE
   Try
      Fnuerepcueind := TFnuerepcueind.create(Self);
      Fnuerepcueind.ShowModal;
   Finally
      Fnuerepcueind.Free;
   End;
   // DM1.asoresnom := menumresnom.Text;
   // DM1.asorescese := menumresces.Text;
   // DM1.asofresnom := mefecresnom.Text;
   // DM1.asofrescese := dbdtpfecces.Text;
   // DM1.tipben := dbltipbenef.Text;
   // DM1.anoultapo := meanoultapo.Text;
   // DM1.mesultapo := memesultapo.Text;
   // If DM1.asofrescese = '' Then DM1.asofrescese := DateToStr(DM1.FechaSys);
   // If DM1.asofresnom = '' Then
   // Begin
   //    MessageDlg('Ingrese fecha de resolución de nombramiento para esa opción', mtInformation, [mbOk], 0);
   //    Exit;
   // End;
   // If DM1.asofrescese = '' Then
   // Begin
   //    MessageDlg('Ingrese fecha de resolución de cese para esa opción', mtInformation, [mbOk], 0);
   //    Exit;
   // End;
   // If Copy(DM1.asofrescese, 7, 4) + Copy(DM1.asofrescese, 4, 2) < '199912' Then
   // Begin
   //    If DM1.tipben = '' Then
   //    Begin
   //       MessageDlg('Ingrese el tipo de beneficio para procesar esta opción', mtInformation, [mbOk], 0);
   //       Exit;
   //    End;
   // End;
   // If (DM1.tipben = '03') And (Copy(DM1.asofrescese, 7, 4) < '1997') And (DM1.cdsAsociado.FieldByName('ASOFECNAC').AsString = '') Then
   // Begin
   //    MessageDlg('Ingrese la fecha de nacimiento del asociado para procesar esta opción', mtInformation, [mbOk], 0);
   //    Exit;
   // End;
   // Inicio: SPP_201304_PRE
   // If Trim(DM1.cdsExpLiq.FieldByName('PVSLBENNR').AsString) <> '' Then
   // Begin
   //   MessageDlg('El asociado ya cuenta con liquidación de beneficio', mtInformation, [mbOk], 0);
   //   Exit;
   // End;
   // Fin: SPP_201304_PRE
   // DM1.xpvslbennr := DM1.cdsExpLiq.FieldByName('PVSLBENNR').AsString;
   // DM1.xSgr := 'E';
   // Try
   //    fmstapo := Tfmstapo.create(Self);
   //    fmstapo.ShowModal;
   // Finally
   //    fmstapo.Free;
   // End;
   // Fin: HPC_201704_PRE


End;

Function TFModExpben.chksolicitud: Boolean;
Begin
  //Primeros datos de la liquidación
  // Tipo de beneficio
   If dbltipbenef.Text = '' Then
   Begin
      MessageDlg('Ingrese el tipo de beneficio', mtInformation, [mbOk], 0);
      dbltipbenef.SetFocus;
      Result := False;
      Exit;
   End;
   //Departamento de origen del expediente
   // Inicio: HPC_201809_PRE 
   // Se modifica nombre del componente
   // If dblcdptoid.Text = '' Then
   If dblcdptoidori.Text = '' Then
   // Fin: HPC_201809_PRE 
   Begin
      MessageDlg('Ingrese el departamento de origen del expediente', mtInformation, [mbOk], 0);
      // Inicio: HPC_201809_PRE 
      // Se modifica nombre del componente
      // dblcdptoid.SetFocus;
      dblcdptoidori.SetFocus;
      // Fin: HPC_201809_PRE 
      Result := False;
      Exit;
   End;
   // Si es por retiro se limpia las cajas de texto dbdtpfacinv, mefallecimiento
   If dbltipbenef.Text = '01' Then
   Begin
      dbdtpfacinv.Text := '';
   End;
   //Verificar en el caso que sea por fallecimiento
   If dbltipbenef.Text = '02' Then
   Begin
      If dbdtpfacinv.Text = '' Then
      Begin
         MessageDlg('Ingrese la fecha de fallecimiento', mtInformation, [mbOk], 0);
         dbdtpfacinv.SetFocus;
         Result := False;
         Exit;
      End;
   End;
   //Verificar en el caso que sea por invalidez
   If dbltipbenef.Text = '03' Then
   Begin
      If dbdtpfacinv.Text = '' Then
      Begin
         MessageDlg('Ingrese la fecha de invalidez', mtInformation, [mbOk], 0);
         dbdtpfacinv.SetFocus;
         Result := false;
         Exit;
      End;
   End;
   //Datos personales del asociado
   //Verificando si se ha seleccionado al asociado
   If meAsocodmod.Text = '' Then
   Begin
      MessageDlg('Seleccione el asociado', mtInformation, [mbOk], 0);
      meAsocodmod.SetFocus;
      Result := False;
      Exit;
   End;
   //Verificando datos del asociado
   If meAsoApeNomDni.Text = '' Then
   Begin
      MessageDlg('Ingrese los apellidos y nombre(s) del cesante ', mtInformation, [mbOk], 0);
      Result := False;
      Exit;
   End;
   //Verificando DNI
   If meAsoDocNum.Text = '' Then
   Begin
      MessageDlg('Ingrese el número de DNI del cesante', mtInformation, [mbOk], 0);
      Result := False;
      Exit;
   End;
   //Verificando UGEL
   If meUseid.Text = '' Then
   Begin
      MessageDlg('Ingrese los datos de la UGEL del asociado', mtInformation, [mbOk], 0);
      Result := False;
      Exit;
   End;
   //Verificando UPAGOID
   If meUpagoid.Text = '' Then
   Begin
      MessageDlg('Ingrese los datos de la unidad de pago del asociado', mtInformation, [mbOk], 0);
      Result := False;
      Exit;
   End;
   //Verificando UPROID
   If meUproid.Text = '' Then
   Begin
      MessageDlg('Ingrese los datos de la unidad de proceso del asociado', mtInformation, [mbOk], 0);
      Result := False;
      Exit;
   End;
   // Dirección domiciliaria
   If meAsodir.Text = '' Then
   Begin
      MessageDlg(' Actualice la dirección del asociado ', mtInformation, [mbOk], 0);
      btncerrar.SetFocus;
      Result := False;
      Exit;
   End;
   // Ubigeo de la dirección del asociado
   If meAsozipdes.Text = '' Then
   Begin
      MessageDlg(' Actualice el ubigeo de la dirección del asociado ', mtInformation, [mbOk], 0);
      btncerrar.SetFocus;
      Result := False;
      Exit;
   End;
   // Resoluciones del asociado
   //Verifica el numero de resolución de nombramiento
   If menumresnom.Text = '' Then
   Begin
      MessageDlg('Ingrese el número de resolución de nombramiento', mtInformation, [mbOk], 0);
      pgmulti.TabIndex := 1;
      menumresnom.SetFocus;
      Result := False;
      Exit;
   End;
   //Verifica fecha de resolución de nombramiento
   If mefecresnom.Text = '' Then
   Begin
      MessageDlg('Ingrese la fecha de resolución de nombramiento', mtInformation, [mbOk], 0);
      pgmulti.TabIndex := 1;
      mefecresnom.SetFocus;
      Result := False;
      Exit;
   End;
   //Verifica numero de resolución de cese
   If menumresces.Text = '' Then
   Begin
      MessageDlg('Ingrese el número de resolución de cese', mtInformation, [mbOk], 0);
      pgmulti.TabIndex := 1;
      menumresces.SetFocus;
      Result := False;
      Exit;
   End;
   //Verifica fecha de resolución de cese
   If dbdtpfecces.Text = '' Then
   Begin
      MessageDlg('Ingrese la fecha de resolución de cese', mtInformation, [mbOk], 0);
      pgmulti.TabIndex := 1;
      dbdtpfecces.SetFocus;
      Result := False;
      Exit;
   End;
   //verifica si fecha de cese es menor a la fecha de nombramiento
   If dbdtpfecces.Date < StrToDate(mefecresnom.Text) Then
   Begin
      MessageDlg('Fecha de resolución de cese es menor a la fecha de resolución de nombramiento', mtInformation, [mbOk], 0);
      pgmulti.TabIndex := 1;
      dbdtpfecces.SetFocus;
      Result := False;
      Exit;
   End;
   //Verificando si cobra el asociado
   pgmulti.TabIndex := 0;
   If rgCobAso.ItemIndex = 0 Then
   Begin
   //Verificando si ingreso la forma de pago
      If dblcforpag.text = '' Then
      Begin
         MessageDlg('Ingrese la forma de pago', mtInformation, [mbOk], 0);
         dblcforpag.SetFocus;
         Result := false;
         Exit;
      End;
      //Si es cheque
      If dblcforpag.text = '01' Then
      Begin
         If dblcBanco.Text = '' Then
         Begin
            MessageDlg('Ingrese el banco', mtInformation, [mbOk], 0);
            dblcBanco.SetFocus;
            Result := False;
            Exit;
         End;
         dblcagegir.Text := '';
         meagengir.Text := '';
         measoncta.Text := '';
      End;
      //Si es giros a agencias
      If dblcforpag.text = '05' Then
      Begin
         If dblcBanco.Text = '' Then
         Begin
            MessageDlg('Ingrese el banco', mtInformation, [mbOk], 0);
            dblcBanco.SetFocus;
            Result := False;
            Exit;
         End;
         If dblcagegir.Text = '' Then
         Begin
            MessageDlg('Ingrese la agencia del banco', mtInformation, [mbOk], 0);
            dblcagegir.SetFocus;
            Result := False;
            Exit;
         End;
         measoncta.Text := '';
      End;
    //Si es abono en cuenta
      If dblcforpag.text = '06' Then
      Begin
      // Verificando si se ingreo el banco
         If dblcBanco.Text = '' Then
         Begin
            MessageDlg('Ingrese el banco', mtInformation, [mbOk], 0);
            dblcBanco.SetFocus;
            Result := False;
            Exit;
         End;
      // verificando que exista cuenta
         If meAsoncta.Text = '' Then
         Begin
            MessageDlg('Ingrese el número de la cuenta del banco', mtInformation, [mbOk], 0);
            meAsoncta.SetFocus;
            Result := False;
            Exit;
         End;
         dblcagegir.Text := '';
         meagengir.Text := '';
      End;
    //Si es abono en cuenta de ahorros
      If dblcforpag.text = '11' Then
      Begin
         If dblcBanco.Text = '' Then
         Begin
            MessageDlg('Ingrese el banco', mtInformation, [mbOk], 0);
            dblcBanco.SetFocus;
            Result := False;
            Exit;
         End;
         dblcagegir.Text := '';
         meagengir.Text := '';
         measoncta.Text := '';
      End;
   End;
  // Revisando ultimos aportes
   If Copy(dbdtpfecces.Text, 7, 4) + Copy(dbdtpfecces.Text, 4, 2) < '199701' Then
   Begin
      meanoultapo.Text := Copy(dbdtpfecces.Text, 7, 4);
      memesultapo.Text := Copy(dbdtpfecces.Text, 4, 2);
   End
   Else
   Begin
      If Length(trim(meanoultapo.Text)) <> 4 Then
      Begin
         MessageDlg('Existe una inconsistencia en el año del ultimo aporte', mtInformation, [mbOk], 0);
         pgmulti.TabIndex := 2;
         meanoultapo.SetFocus;
         Result := False;
         Exit;
      End;
      If StrToInt(meanoultapo.Text) > StrToInt(Copy(DateToStr(Date), 7, 4)) Then
      Begin
         MessageDlg('Existe una inconsistencia en el año del ultimo aporte.' + #13 + 'Año del ultimo aporte mayor al año actual', mtInformation, [mbOk], 0);
         pgmulti.TabIndex := 2;
         meanoultapo.SetFocus;
         Result := False;
         Exit;
      End;
      If Length(trim(memesultapo.Text)) <> 2 Then
      Begin
         MessageDlg('Existe una inconsistencia en el mes del ultimo aporte', mtInformation, [mbOk], 0);
         pgmulti.TabIndex := 2;
         memesultapo.SetFocus;
         Result := False;
         Exit;
      End;
      If (StrToInt(memesultapo.Text) < 1) Or (StrToInt(memesultapo.Text) > 12) Then
      Begin
         MessageDlg('El rango de los meses deben estar entre 1 y 12', mtInformation, [mbOk], 0);
         pgmulti.TabIndex := 2;
         memesultapo.SetFocus;
         Result := False;
         Exit;
      End;
   End;
   // Inicio: HPC_201809_PRE
   // Validar solicitud (para el caso de retiro e invalidez si ingresa DNI debe ingresar minimo apellidos y nombres
   // para fallecimiento es obligatorio todos los datos
   If (dbltipbenef.Text = '01') Or (dbltipbenef.Text = '03')  Then
   Begin
      If (Trim(meDNIsol.Text) <> '') Or (Trim(meapenomsol.Text) <> '') Then
      Begin
         If Trim(meDNIsol.Text) = '' Then
         Begin
            MessageDlg('Debe registrar DNI del solicitante.', mtInformation, [mbOk], 0);
            pgmulti.TabIndex := 3;
            meDNIsol.SetFocus;
            Result := False;
            Exit;
         End;
         If Trim(meapenomsol.Text) = '' Then
         Begin
            MessageDlg('Debe registrar apellidos y nombres del solicitante.', mtInformation, [mbOk], 0);
            pgmulti.TabIndex := 3;
            meapenomsol.SetFocus;
            Result := False;
            Exit;
         End;
      End;
   End;
   If (dbltipbenef.Text = '02') Then
   Begin
      If Trim(meDNIsol.Text) = '' Then
      Begin
         MessageDlg('Debe registrar DNI del solicitante.', mtInformation, [mbOk], 0);
         pgmulti.TabIndex := 3;
         meDNIsol.SetFocus;
         Result := False;
         Exit;
      End;
      If Trim(meapenomsol.Text) = '' Then
      Begin
         MessageDlg('Debe registrar apellidos y nombres del solicitante', mtInformation, [mbOk], 0);
         pgmulti.TabIndex := 3;
         meapenomsol.SetFocus;
         Result := False;
         Exit;
      End;
      If Trim(mevinparentesco.Text) = '' Then
      Begin
         MessageDlg('Debe registrar el parentesco con el asociado.', mtInformation, [mbOk], 0);
         pgmulti.TabIndex := 3;
         mevinparentesco.SetFocus;
         Result := False;
         Exit;
      End;
      If Trim(metelsol.Text) = '' Then
      Begin
         MessageDlg('Debe registrar como mínimo un número de teléfono del solicitante.', mtInformation, [mbOk], 0);
         pgmulti.TabIndex := 3;
         metelsol.SetFocus;
         Result := False;
         Exit;
      End;
      If Trim(medirsol.Text) = '' Then
      Begin
         MessageDlg('Debe registrar la dirección del solicitante.', mtInformation, [mbOk], 0);
         pgmulti.TabIndex := 3;
         medirsol.SetFocus;
         Result := False;
         Exit;
      End;
      If Trim(dblcddptoidsol.Text) = '' Then
      Begin
         MessageDlg('Debe registrar el código de departamento del solicitante.', mtInformation, [mbOk], 0);
         pgmulti.TabIndex := 3;
         dblcddptoidsol.SetFocus;
         Result := False;
         Exit;
      End;

      If Trim(dblcdProvinciasol.Text) = '' Then
      Begin
         MessageDlg('Debe registrar el código de provincia del solicitante.', mtInformation, [mbOk], 0);
         pgmulti.TabIndex := 3;
         dblcdProvinciasol.SetFocus;
         Result := False;
         Exit;
      End;
      If Trim(dblcddistritosol.Text) = '' Then
      Begin
         MessageDlg('Debe registrar el código de distrito del solicitante.', mtInformation, [mbOk], 0);
         pgmulti.TabIndex := 3;
         dblcddistritosol.SetFocus;
         Result := False;
         Exit;
      End;
      If Trim(meemailsol.Text) = '' Then
      Begin
         MessageDlg('Debe registrar el correo electronico del solicitante.', mtInformation, [mbOk], 0);
         pgmulti.TabIndex := 3;
         meemailsol.SetFocus;
         Result := False;
         Exit;
      End;
   End;
   // Fin: HPC_201809_PRE
   // Se verifica que existe valor en causa de cese
   If Trim(mebuscacausa.Text) = '' Then
   Begin
      MessageDlg('Debe registrar el motivo de la causa de cese.', mtInformation, [mbOk], 0);
      mebuscacausa.SetFocus;
      Result := False;
      Exit;
   End;
   // Fin: HPC_201809_PRE

   Result := True;
End;

Procedure TFModExpben.btnprocobClick(Sender: TObject);
Var
   xFecVen, xFecHoy: String;
   xSql, limpiar: String;
Begin
   If DM1.cdsAsociado.FieldByName('REGPENID').AsString = '' Then
   Begin
      MessageDlg('Registre regimen de pensión', mtInformation, [mbOk], 0);
      Exit;
   End;
   If DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString = '' Then
   Begin
      MessageDlg('Ingrese el tipo de beneficio', mtInformation, [mbOk], 0);
      Exit;
   End;
  // Verificando si existen cuotas a limpiar
   limpiar := 'N';
   xSql := 'SELECT ASOID, CREDID, CRECUOTA, CREFVEN, CREESTID, CREESTADO FROM CRE302'
      + ' WHERE ASOID =' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString) + ' AND CREESTID IN (''14'', ''19'')';
   DM1.cdsQry15.Close;
   DM1.cdsQry15.DataRequest(xSql);
   DM1.cdsQry15.Open;
   DM1.cdsQry15.First;
   While Not DM1.cdsQry15.EOF Do
   Begin
      xFecHoy := Copy(DateToStr(Date), 7, 4) + Copy(DateToStr(Date), 4, 2);
      xFecVen := Copy(DateToStr(DM1.cdsQry15.FieldByName('CREFVEN').AsDateTime), 7, 4) + Copy(DateToStr(DM1.cdsQry15.FieldByName('CREFVEN').AsDateTime), 4, 2);
      If (DM1.cdsAsociado.FieldByName('REGPENID').AsString = '02') Or
         (DM1.cdsAsociado.FieldByName('REGPENID').AsString = '03') Or
         (DM1.cdsAsociado.FieldByName('REGPENID').AsString = '99') Then
         limpiar := 'S'
      Else
      Begin
         If ((DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString = '01') Or
            (DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString = '03')) And
            (xFecVen <> xFecHoy) Then
            limpiar := 'S';
         If (DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString = '02') Then
            limpiar := 'S';
      End;
      DM1.cdsQry15.Next;
   End;
   If limpiar = 'N' Then
   Begin
      MessageDlg('No existen cuotas por limpiar', mtInformation, [mbOk], 0);
      Exit;
   End;
   If MessageDlg('¿ Esta seguro de limpiar cuotas ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
      xSql := 'SELECT ASOID, CREDID, CRECUOTA, CREFVEN, CREESTID, CREESTADO FROM CRE302'
         + ' WHERE ASOID =' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString) + ' AND CREESTID IN (''14'', ''19'')';
      DM1.cdsQry15.Close;
      DM1.cdsQry15.DataRequest(xSql);
      DM1.cdsQry15.Open;
      DM1.cdsQry15.First;
    // Actualizando Cuotas Bloqueadas o En Proceso de Cobranza
      While Not DM1.cdsQry15.EOF Do
      Begin
         xFecHoy := Copy(DateToStr(Date), 7, 4) + Copy(DateToStr(Date), 4, 2);
         xFecVen := Copy(DateToStr(DM1.cdsQry15.FieldByName('CREFVEN').AsDateTime), 7, 4) + Copy(DateToStr(DM1.cdsQry15.FieldByName('CREFVEN').AsDateTime), 4, 2);
         If (DM1.cdsAsociado.FieldByName('REGPENID').AsString = '02') Or (DM1.cdsAsociado.FieldByName('REGPENID').AsString = '03') Or (DM1.cdsAsociado.FieldByName('REGPENID').AsString = '99') Then
      // Si es de la 19990 se desbloqueran todas las cuotas y todos los procesos de Cobranzas;
         Begin
            If xFecVen > xFecHoy Then
            Begin
               xSql := ' UPDATE CRE302 SET CREESTID = ' + QuotedStr('02') + ' ,CREESTADO = ' + QuotedStr('POR COBRAR')
                  + ' WHERE ASOID = ' + QuotedStr(DM1.cdsQry15.FieldByName('ASOID').AsString)
                  + ' AND CREDID = ' + QuotedStr(DM1.cdsQry15.FieldByName('CREDID').AsString)
                  + ' AND CRECUOTA = ' + QuotedStr(DM1.cdsQry15.FieldByName('CRECUOTA').AsString);
               DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
            End
            Else
            Begin
               xSql := ' UPDATE CRE302 SET CREESTID = ' + QuotedStr('11') + ' ,CREESTADO = ' + QuotedStr('NO PAGADO')
                  + ' WHERE ASOID = ' + QuotedStr(DM1.cdsQry15.FieldByName('ASOID').AsString)
                  + ' AND CREDID = ' + QuotedStr(DM1.cdsQry15.FieldByName('CREDID').AsString)
                  + ' AND CRECUOTA = ' + QuotedStr(DM1.cdsQry15.FieldByName('CRECUOTA').AsString);
               DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
            End;
         End
         Else
         Begin
        // Si es Retiro o Invalidez y las Cuotas no son del Mes
            If ((DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString = '01') Or (DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString = '03')) And (xFecVen <> xFecHoy) Then
            Begin
               If xFecVen > xFecHoy Then
               Begin
                  xSql := ' UPDATE CRE302 SET CREESTID = ' + QuotedStr('02') + ' ,CREESTADO = ' + QuotedStr('POR COBRAR')
                     + ' WHERE ASOID = ' + QuotedStr(DM1.cdsQry15.FieldByName('ASOID').AsString) + ' AND CREDID = ' + QuotedStr(DM1.cdsQry15.FieldByName('CREDID').AsString)
                     + ' AND CRECUOTA = ' + QuotedStr(DM1.cdsQry15.FieldByName('CRECUOTA').AsString);
                  DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
               End
               Else
               Begin
                  xSql := ' UPDATE CRE302 SET CREESTID = ' + QuotedStr('11') + ' ,CREESTADO = ' + QuotedStr('NO PAGADO')
                     + ' WHERE ASOID = ' + QuotedStr(DM1.cdsQry15.FieldByName('ASOID').AsString) + ' AND CREDID = ' + QuotedStr(DM1.cdsQry15.FieldByName('CREDID').AsString)
                     + ' AND CRECUOTA = ' + QuotedStr(DM1.cdsQry15.FieldByName('CRECUOTA').AsString);
                  DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
               End;
            End;
            If (DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString = '02') Then
            Begin
               If xFecVen > xFecHoy Then
               Begin
                  xSql := 'UPDATE CRE302 SET CREESTID = ' + QuotedStr('02') + ' ,CREESTADO = ' + QuotedStr('POR COBRAR')
                     + ' WHERE ASOID = ' + QuotedStr(DM1.cdsQry15.FieldByName('ASOID').AsString)
                     + ' AND CREDID = ' + QuotedStr(DM1.cdsQry15.FieldByName('CREDID').AsString)
                     + ' AND CRECUOTA = ' + QuotedStr(DM1.cdsQry15.FieldByName('CRECUOTA').AsString);
                  DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
               End
               Else
               Begin
                  xSql := 'UPDATE CRE302 SET CREESTID = ' + QuotedStr('11') + ' ,CREESTADO = ' + QuotedStr('NO PAGADO')
                     + ' WHERE ASOID = ' + QuotedStr(DM1.cdsQry15.FieldByName('ASOID').AsString)
                     + ' AND CREDID = ' + QuotedStr(DM1.cdsQry15.FieldByName('CREDID').AsString)
                     + ' AND CRECUOTA = ' + QuotedStr(DM1.cdsQry15.FieldByName('CRECUOTA').AsString);
                  DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
               End;
            End;
         End;
         DM1.cdsQry15.Next;
      End;
      MessageDlg('Proceso concluido', mtInformation, [mbOk], 0);
   End;
End;

Procedure TFModExpben.btnseguiClick(Sender: TObject);
Begin
   Try
      FSeguimiento := TFSeguimiento.create(Self);
      FSeguimiento.ShowModal;
   Finally
      FSeguimiento.Free;
   End;
End;

Procedure TFModExpben.llenaredit;
Var
   xtexto, xSql: String;
Begin
   xSql := 'SELECT B.ESTAPRDES FROM ASO_FAC_GES_CAB A, ASO_FAC_GES_DET B WHERE SUBSTR(A.NUMMEM,4,11) = '+QuotedStr('EXP'+DM1.cdsExpLiq.FieldByName('PVSEXPNRO').AsString)
   +' AND A.IDEGESFAL = B.IDEGESFAL';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   If DM1.cdsQry.FieldByName('ESTAPRDES').AsString = 'POR APLICAR' Then xtexto := 'Los créditos han sido transferidos al área de cobranzas para la evaluación de la aplicación del FDD.';
   If DM1.cdsQry.FieldByName('ESTAPRDES').AsString = 'APLICADO'    Then xtexto := 'Los créditos han sido aplicados al FDD.';
   If DM1.cdsQry.FieldByName('ESTAPRDES').AsString = 'NO APLICA'   Then xtexto := 'Los créditos no pueden ser aplicados al FDD.';
   redit.Color := clMoneyGreen;
   redit.Font.Style := [fsbold];
   redit.Lines.Text := xtexto;
   pnlobservacion.Visible := True;
   // Mensaje para las observaciones. Revisando si ya fue liquidado
   redit.Lines.Clear;
   If (DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString = '02') Or (DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString = '06') Then
   Begin
      redit.Color := clMoneyGreen;
      redit.Font.Style := [fsbold];
      redit.Lines.Text := 'Expediente ya cuenta con liquidación.';
      pnlobservacion.Visible := True;
   End
   Else
   Begin
      If (DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString = '01') Then
      Begin
         redit.Color := clMoneyGreen;
         redit.Font.Style := [fsbold];
         redit.Lines.Text := 'Expediente en trámite';
         pnlobservacion.Visible := True;
      End;
      If (DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString = '05') Then
      Begin
         redit.Color := clMoneyGreen;
         redit.Font.Style := [fsbold];
         redit.Lines.Text := 'Expediente reingresante en trámite';
         pnlobservacion.Visible := True;
      End;
    // Cartas y retención judicial
    // revisando si tiene carta de designación.
      // Inicio: HPC_201609_PRE
      // Se añade al script de busqueda la condicion en el cual no debe tomar  tipo de estado = "13" (anulado)
      // xSql := 'SELECT ASOID, COUNT(*) CUENTA FROM PVS302 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND DSGESTAD = ''02'' GROUP BY ASOID';
      xSql := 'SELECT ASOID, COUNT(1) CUENTA FROM PVS302 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND DSGESTAD NOT IN ''13'' GROUP BY ASOID';
      // Fin: HPC_201609_PRE
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      If DM1.cdsQry.RecordCount > 0 Then
      Begin
         redit.Color := clMoneyGreen;
         redit.Font.Style := [fsbold];
         redit.Lines.Text := redit.Lines.Text + 'Asociado cuenta con ' + DM1.cdsQry.FieldByName('CUENTA').AsString + ' carta(s) de designación'#13#13;
      End;
    // revisando si tiene retención judicial
      xSql := 'SELECT * FROM PVS305 WHERE ASOID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      If DM1.cdsQry.RecordCount > 0 Then
      Begin
         redit.Color := clMoneyGreen;
         redit.Font.Style := [fsbold];
         redit.Lines.Text := redit.Lines.Text + 'Asociado cuenta con retención judicial.'#13#13;
      End;
      If Length(Trim(redit.Lines.Text)) > 0 Then
      Begin
         pnlobservacion.Visible := True;
      End;
   End;
End;

// Inicio: HPC_201809_PRE
// Se modifica el nombre del procedimiento
// Procedure TFModExpben.dblcdptoidChange(Sender: TObject);
Procedure TFModExpben.dblcdptoidoriChange(Sender: TObject);
Var
   xSql: String;
Begin
   // If dblcdptoid.Text = '' Then
   If dblcdptoidori.Text = '' Then
   Begin
      // medptodes.Text := '';
      medptodesori.Text := '';
      dblccodofi.Text := '';
      meofides.Text := '';
   End;
   // If Length(dblcdptoid.Text) = 2 Then
   If Length(dblcdptoidori.Text) = 2 Then
   Begin
      // If DM1.cdsDpto.Locate('DPTOID', dblcdptoid.Text, []) Then
      If DM1.cdsDptooriexp.Locate('DPTOID', dblcdptoidori.Text, []) Then
      Begin
         // medptodes.Text := DM1.cdsDpto.FieldByName('DPTODES').AsString;
         medptodesori.Text := DM1.cdsDptooriexp.FieldByName('DPTODES').AsString;
         xSql := 'SELECT OFDESID, OFDESNOM FROM APO110 WHERE DPTOID = '+QuotedStr(dblcdptoidori.Text);
         DM1.cdsOfDes.Close;
         DM1.cdsOfDes.DataRequest(xSql);
         DM1.cdsOfDes.Open;
         dblccodofi.Selected.Clear;
         dblccodofi.Selected.Add('OFDESID'#9'2'#9'Código'#9#9);
         dblccodofi.Selected.Add('OFDESNOM'#9'35'#9'Oficina'#9#9);
      End
      Else
      Begin
         MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
         dblcdptoidori.Text := '';
         medptodesori.Text := '';
         Exit;
      End;
   End;
End;
// Fin: HPC_201809_PRE
Procedure TFModExpben.dbdtpfacinvExit(Sender: TObject);
Begin
   If dbdtpfacinv.Enabled = True Then
   Begin
      If dbltipbenef.Text = '02' Then
      Begin
         If dbdtpfacinv.Text = '' Then
         Begin
            MessageDlg('Ingrese la fecha de fallecimiento', mtInformation, [mbOk], 0);
            dbdtpfacinv.SetFocus;
            Exit;
         End
         Else
         Begin
            Exit;
         End;
      End;

      If dbltipbenef.Text = '03' Then
      Begin
         If dbdtpfacinv.Text = '' Then
         Begin
            MessageDlg('Ingrese la fecha de invalidez', mtInformation, [mbOk], 0);
            dbdtpfacinv.SetFocus;
            Exit;
         End
         Else
         Begin
            pgmulti.TabIndex := 1;
            menumresces.SetFocus;
            Exit;
         End;
      End;
      pgmulti.TabIndex := 0;
      rgCobAso.SetFocus;
      Exit;

   End;

End;

// Inicio: HPC_201809_PRE
// Se retira procedimiento
// Procedure TFModExpben.dblcdptoidExit(Sender: TObject);
// Var
//    xSql: String;
// Begin
//    If Trim(dblcdptoid.Text) <> '' Then
//    Begin
//       xSql := 'SELECT * FROM TGE158 WHERE DPTOID = ' + QuotedStr(dblcdptoid.Text);
//       If DM1.verificaexiste(xSql) = False Then
//       Begin
//          MessageDlg('Código de departamento no valida', mtInformation, [mbOk], 0);
//          dblcdptoid.Text := '';
//          dblcdptoid.SetFocus;
//          Exit;
//       End;
//    End;
//    // Inicio: HPC_201605_PRE --Se retira
//    // If (dblcdptoid.Text <> '07') And (dblcdptoid.Text <> '15') Then
//    // Begin
//    //    pnlubirep.Visible := True;
//    //    lbltitrep.Visible := True;
//    //    dblcRepori.Visible := True;
//    //    pnlapenomrep.Visible := True;
//    // End
//    // Else
//    // Begin
//    //    dblcRepori.Text := '';
//    //    merepder.Text := '';
//    //    meubigeorep.Text := '';
//    //    lbltitrep.Visible := False;
//    //    dblcRepori.Visible := False;
//    //    pnlapenomrep.Visible := False;
//    //    pnlubirep.Visible := False;
//    // End;
//    // Fin: HPC_201605_PRE
// End;
// Fin: HPC_201809_PRE

Procedure TFModExpben.btnliqbenClick(Sender: TObject);
Var
   xSql: String;
Begin
   // Inicio: HPC_201809_PRE
   // Se añade campo OFICINA DE Origen
   // xSql := 'SELECT A.*, B.FORSOLBEN FROM PVS306 A, PVS301 B WHERE A.PVSLBENNR = ' + QuotedStr(DM1.cdsExpLiq.FieldByName('PVSLBENNR').AsString)
   xSql := 'SELECT '
   +'A.ciaid,A.pvslbennr,A.pvsltipbe,A.pvslfecbe,A.asoid,A.asocodmod,A.asocodaux,A.pvslapnom_xx,A.pvsldni_xx,A.pvsldir_xx,A.pvsldpto_xx,A.pvslprov_xx,' 
   +'A.pvsldist_xx, A.pvslceed_xx, A.pvslcedp_xx, A.pvslcepr_xx, A.pvslcedi_xx, A.pvslupri_xx, A.pvsluprn_xx, A.pvslupai_xx,A.pvslupan_xx, A.pvslusei_xx,' 
   +'A.pvslusen_xx, A.pvslnres_xx, A.pvslfres_xx, A.pvslnces_xx, A.pvslfces_xx, A.pvslulap, A.pvsltaap, A.pvslnvou_xx, A.pvslestad, A.forpagoid_xx, A.bancoid_xx,'
   +'A.pvslncta_xx, A.pvsexpnro, A.pvsldesnm_xx, A.pvsltben_xx, A.pvsltdev_xx, A.pvsltdsc_xx, A.pvslsald_xx, A.pvsltpre_xx, A.pvslsldp_xx, A.pvstinnc_xx,' 
   +'A.pvstpran_xx, A.pvslobs_xx, A.usuario, A.freg, A.hreg, A.pvslnofc_xx, A.pvsestliq, A.pvslfpago_xx, A.agenbcoid_xx, A.pvsltcre_xx, A.pvsfanul, A.pvsusuanul,'
   +'A.pvsmotanul, A.cntanomm, A.tipocont, A.cntflag, A.pvslliqant_xx, A.pvscobaso, A.asoapenomdni, A.tipdoccod, A.asodocnum, A.useid, A.upagoid, A.uproid, A.asodir,' 
   +'A.zipid, A.asodeslab, A.asodirlab, A.asodstlabid,A.asoresnom, A.asofresnom, A.asorescese, A.asofrescese, A.pvsultapo_xx, A.asoncta, A.monliqben, A.mondes, A.mondev,' 
   +'A.monpag, A.asodni, A.asotelf1, A.codotrdocide, A.numotrdocide, A.autdesapo, A.fecautdesapo, A.pvstipret, A.numopeban, A.fecopeban, A.numbenori, A.diferido, A.fecdifliq,' 
   +'A.forsolben, A.flades, A.usudes, A.fecdes,' 
   +' B.FORSOLBEN, B.OFIORIEXP FROM PVS306 A, PVS301 B WHERE A.PVSLBENNR = ' + QuotedStr(DM1.cdsExpLiq.FieldByName('PVSLBENNR').AsString)
   // Fin: HPC_201809_PRE
   +' AND A.ASOID = B.ASOID(+) AND A.PVSLBENNR = B.PVSLBENNR(+)';
   DM1.cdsCabLiq.Close;
   DM1.cdsCabLiq.DataRequest(xSql);
   DM1.cdsCabLiq.Open;
   Try
      FLiquidacionBeneficio := TFLiquidacionBeneficio.create(Self);
      FLiquidacionBeneficio.ShowModal;
   Finally
      FLiquidacionBeneficio.Free;
   End;
End;

Procedure TFModExpben.btnfamiliarClick(Sender: TObject);
Var
   xSql: String;
Begin
   xSql := 'SELECT DSGNRO, DSGFREC, DSGESTAD, DSGFAPER, DSGVIG, ASOID, DSGOBS, DSGNOMBR, DSGAPEPAT, DSGAPEMAT, DSGNOMBRT, USUARIO, FREG, HREG, FECAPER, PVSEXPNRO, PVSNROLIQ, PVSFANUL, ANULADO, USUANU, FECANU,'
   +' PVSLBENNR, ASODNI, ASOAPENOMDNI, ASOCODMOD, USUAPE, CODOTRDOCIDE, NUMOTRDOCIDE, MOTANUCAR FROM PVS302 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND DSGESTAD NOT IN ''13''';
   DM1.cdsAportes.Close;
   DM1.cdsAportes.DataRequest(xSql);
   DM1.cdsAportes.Open;
   If DM1.cdsAportes.RecordCount > 0 Then
   Begin
      MessageDlg('Este asociado cuenta con carta de designación!', mtError, [mbOk], 0);
      Exit;
   End;
   DM1.xFlg := 'E';
   Try
      FDatFam := TFDatFam.create(Self);
      FDatFam.ShowModal;
   Finally
      FDatFam.Free;
      // Inicio: HPC_201809_PRE
      // Se modifica origen de expediente 
      // dblcdptoid.Text := DM1.cdsExpLiq.FieldByName('DEPORIEXP').AsString;
      dblcdptoidori.Text := DM1.cdsExpLiq.FieldByName('DEPORIEXP').AsString;
      dblccodofi.Text := DM1.cdsExpLiq.FieldByName('OFIORIEXP').AsString;
      // Fin: HPC_201809_PRE
   End;
End;

Procedure TFModExpben.dbdtpfeccesExit(Sender: TObject);
Begin
   If (date <= dbdtpfecces.Date) Then
   Begin
      MessageDlg('Fecha de cese es menor o igual a la fecha actual', mtInformation, [mbOk], 0);
      dbdtpfecces.Text := '';
      dbdtpfecces.SetFocus;
      Exit;
   End;
End;

Procedure TFModExpben.dbltipbenefExit(Sender: TObject);
Var
   xSql: String;
Begin
   If Trim(dbltipbenef.Text) <> '' Then
   Begin
      xSql := 'SELECT  * FROM TGE186 WHERE TIPBENEF = ' + QuotedStr(dbltipbenef.Text);
      If DM1.verificaexiste(xSql) = False Then
      Begin
         MessageDlg('Tipo de beneficio no valido', mtInformation, [mbOk], 0);
         dbltipbenef.Text := '';
         dbltipbenef.SetFocus;
         Exit;
      End;
   End;
   If dbltipbenef.Enabled = True Then
   Begin
      If dbltipbenef.Text = '01' Then
      Begin
         rgtipret.Visible := True; // SPP_201307_PRE
         lblfacinv.Visible := False;
         dbdtpfacinv.Visible := False;
         dbdtpfacinv.Text := '';
         If rgCobAso.ItemIndex = -1 Then
         Begin
            pgmulti.TabIndex := 0;
            rgCobAso.ItemIndex := 0;
            rgCobAso.SetFocus;
         End;
         Exit;
      End;
      If dbltipbenef.Text = '02' Then
      Begin
         rgtipret.Visible := False; // SPP_201307_PRE
         lblfacinv.Visible := True;
         lblfacinv.Caption := 'Fecha de fallecimiento :';
         dbdtpfacinv.Visible := True;
         dbdtpfacinv.SetFocus;
         pgmulti.TabIndex := 0;
         rgCobAso.Enabled := True;
         rgCobAso.ItemIndex := 1;
         rgCobAso.Enabled := False;
         btnfamiliar.Enabled := True;
         Exit;
      End;
      If dbltipbenef.Text = '03' Then
      Begin
         rgtipret.Visible := False;
         lblfacinv.Visible := True;
         lblfacinv.Caption := 'Fecha de invalidez :';
         dbdtpfacinv.Visible := True;
         dbdtpfacinv.SetFocus;
         pgmulti.TabIndex := 0;
         rgCobAso.Enabled := True;
         Exit;
      End;
   End;
End;

Procedure TFModExpben.dblcBancoExit(Sender: TObject);
Var
   xSql: String;
Begin
   If Trim(dblcBanco.Text) <> '' Then
   Begin
      xSql := 'SELECT * FROM TGE105 WHERE BANCOID = ' + QuotedStr(dblcBanco.Text);
      If DM1.verificaexiste(xSql) = False Then
      Begin
         MessageDlg('Código de banco no valido', mtInformation, [mbOk], 0);
         dblcBanco.Text := '';
         dblcBanco.SetFocus;
         Exit;
      End;
   End;
End;

Procedure TFModExpben.Timer1Timer(Sender: TObject);
Begin
   If redit.Visible = True Then
      redit.Visible := False
   Else
      redit.Visible := True;
End;

Procedure TFModExpben.timerobsevacionesTimer(Sender: TObject);
Begin
   If redit.Visible = True Then
      redit.Visible := False
   Else
      redit.Visible := True;
End;

Procedure TFModExpben.btnfotfirClick(Sender: TObject);
Begin
   Try
      Fmstfotder := TFmstfotder.create(Self);
      Fmstfotder.ShowModal;
   Finally
      Fmstfotder.Free;
   End;
End;

Procedure TFModExpben.ImgFotoConfirmeDblClick(Sender: TObject);
Var xSql:String;
begin
   xSql := 'SELECT DNI, NUMLIB, APEPAT, APEMAT, NOMBRE, OTRDOC, LUGNAC, NOMPAD, NOMMAD, FECNAC, ESTATURA, '
      + '       SEXO, ESTCIV, GRAINS, LUGDOM, RESTRICCIONES, FECINS, STAVOT, FECEMIDOC, DIRECCION, '
      + '       FOTO, FIRMA, USUACT, FECACT, OFIACT, EQUUSU, UNICO, '
      + '       case when FLAG_EXPIRA IS NULL THEN '''' '
      + '            when FLAG_EXPIRA=''V'' THEN ''VIGENTE'' '
      + '            when FLAG_EXPIRA=''C'' THEN ''CADUCADO'' '
      + '       else ''INDEFINIDO'' end FLAG_EXPIRA '
      + '  FROM INF_RENIEC_CAP '
      + ' WHERE DNI=''' + TRIM(DM1.cdsAsociado.FieldByName('ASODNI').AsString) + '''AND ROWNUM < 2 '
      + ' ORDER BY FECACT DESC ';
   DM1.cdsReporte.Close;
   DM1.cdsReporte.DataRequest(XSQL);
   DM1.cdsReporte.Open;
   If DM1.cdsReporte.RecordCount = 0 Then
   Begin
     MessageDlg('No existe datos de RENIEC para imprimir', mtCustom, [mbOk], 0);
     Exit;
   End;
   ppBDEReniec.DataSource := DM1.dsReporte;
   ppFoto.Picture.Assign(DM1.JPG);
   ppFirma.Picture.Assign(DM1.jpgFirma);
   ppRReniec.Print;
   ppRReniec.Stop;
End;

Procedure TFModExpben.btnfonsolClick(Sender: TObject);
Var
   xSql: String;
Begin
  xSql := 'SELECT A.ASOID,A.NUM_DEU,A.NRO_REF_FSC,A.FEC_REF_FSC,B.FORPAGODES,A.FEC_APL_FSC,A.IMP_APL_FSC,C.ESTDES,'
  +' A.USU_APL_FSC,A.IMP_COB_FSC,A.ULT_FEC_COB,A.IMP_SAL_FSC,FORPAGID,A.ID_EST_FSC,A.OBS_FSC,A.FREG_ANULA,A.USER_ANULA,OBS_ANULA, A.OFI_CREACION'
  +' FROM COB_FSC_DEUDA_FSC_CAB A,COB101 B, CRE113 C'
  +' WHERE A.ASOID = '+QuotedStr(DM1.cdsAsociado.Fieldbyname('ASOID').AsString)
  // SE HABILITA PARA QUE SE MUESTRE TODOS LOS PAGOS AL FONDO SOLIDARIO
  //+' AND A.ID_EST_FSC IN (''02'',''27'') AND A.FORPAGID = B.FORPAGOID(+) AND A.ID_EST_FSC = C.ESTID(+)';
  +' AND A.ID_EST_FSC NOT IN (''04'',''13'') AND A.FORPAGID = B.FORPAGOID(+) AND A.ID_EST_FSC = C.ESTID(+)';
  DM1.cdsFonSolCab.Close;
  DM1.cdsFonSolCab.DataRequest(XSQL);
  DM1.cdsFonSolCab.Open;
  If DM1.cdsFonSolCab.RecordCount > 0 Then
  Begin
    Try
      Fcuocanfonsol := TFcuocanfonsol.create(Self);
      Fcuocanfonsol.ShowModal;
    Finally
      Fcuocanfonsol.Free;
    End;
  End
  Else
     MessageDlg('No existe información de fondo solidario para mostrar', mtCustom, [mbOk], 0);
End;

// Inicio: HPC_201802_PRE
// Se modifica procedimiento de forma de pago para controlar la forma
// de pago caja interna 
Procedure TFModExpben.dblcforpagExit(Sender: TObject);
Var
   xSql: String;
Begin
   If DM1.cdsFPago.Locate('TIPDESEID', dblcforpag.Text, []) Then
   Begin
      meforpagodes.Text := DM1.cdsFPago.FieldByName('TIPDESEDES').AsString;
      If DM1.cdsFPago.FieldByName('FLACOBPRE').AsString = 'B' Then
         xSql := 'SELECT BANCOID, BANCONOM FROM TGE105 WHERE FLAVIGPRE = ''S'' AND CLAUXID = ''B'''
      Else
         xSql := 'SELECT BANCOID, BANCONOM FROM TGE105 WHERE FLAVIGPRE = ''S'' AND CLAUXID = ''C''';
      DM1.cdsBcos.Close;
      DM1.cdsBcos.DataRequest(xSql);
      DM1.cdsBcos.Open;
      // If (dblcforpag.Text = '01') Or (dblcforpag.Text = '11') Or (dblcforpag.Text = '16') Or (dblcforpag.Text = '19') Then
      If (dblcforpag.Text = '01') Or (dblcforpag.Text = '11') Or (dblcforpag.Text = '16') Then
      Begin
         // If dblcforpag.Text <> '19' Then
         // Begin
         //    lblasoncta.Visible := False;
         //    pnlasoncta.Visible := False;
         //    lbldospun04.Visible := False;
         //    meAsoncta.Text := '';
         //    dblcBanco.Text := '03';
         // End
         // Else
         // Begin
         //    dblcBanco.Text := '15';
         //    lblasoncta.Visible := True;
         //    lblasoncta.Top := 65;
         //    lbldospun04.Visible := True;
         //    lbldospun04.Top := 65;
         //    pnlasoncta.Visible := True;
         //    pnlasoncta.Top := 65;
         //    measoncta.Text := DM1.cdsAsociado.FieldByName('ASONCTA').AsString;
         //    lblasoncta.Top := 54;
         //    lbldospun04.Top := 54;
         //    pnlasoncta.Top := 54;
         // End;
         // lblagegir.Visible := False;
         // dblcagegir.Visible := False;
         // pnlagegir.Visible := False;
         // lbldospun03.Visible := False;
         // dblcagegir.Text := '';
        // End;

          lblasoncta.Visible := False;
          pnlasoncta.Visible := False;
          lblptoage.Visible := False;
          lblagegir.Visible := False;
          lblptocta.Visible := False;
          dblcagegir.Visible := False;
          dblcagegir.Text := '';
          pnlagegir.Visible := False;
          meAsoncta.Text := '';
          dblcBanco.Text := '03';
       End;
       If (dblcforpag.Text = '19') Or (dblcforpag.Text = '18') Then
       Begin
          // Inicio: HPC_201805_PRE
          // Se asigna por defecto valor del banco al tipo desembolso
          // If dblcforpag.Text = '18' Then dblcBanco.Text := '15'
          // Else dblcBanco.Text := '04';
          If dblcforpag.Text = '19' Then dblcBanco.Text := '15'
          Else dblcBanco.Text := '04';
          // Fin: HPC_201805_PRE
          lblasoncta.Visible := True;
          lblptoage.Visible := True;
          pnlasoncta.Visible := True;
          measoncta.Text := DM1.cdsAsociado.FieldByName('ASONCTA').AsString;
          lblagegir.Visible := False;
          dblcagegir.Visible := False;
          pnlagegir.Visible := False;
          lblptocta.Visible := False;
          dblcagegir.Text := '';
       End;
      If dblcforpag.Text = '05' Then
      Begin
         dblcBanco.Text := '04';
         dblcagegir.Selected.Clear;
         dblcagegir.Selected.Add('AGENBCOID'#9'8'#9'Código'#9#9);
         dblcagegir.Selected.Add('AGENBCODES'#9'25'#9'Nombre de Agencia'#9#9);
         dblcagegir.Selected.Add('DPTODES'#9'20'#9'Departamento de Agencia'#9#9);
         xSql := 'SELECT A.AGENBCOID, A.AGENBCODES, B.DPTODES FROM COB102 A, APO158 B WHERE A.DPTOID = B.DPTOID(+) AND A.BANCOID = ' + QuotedStr(dblcBanco.Text)
            + ' ORDER BY DPTODES, AGENBCODES';
         DM1.cdsAgBco.Close;
         DM1.cdsAgBco.DataRequest(xSql);
         DM1.cdsAgBco.Open;
         lblagegir.Visible := True;
         dblcagegir.Visible := True;
         pnlagegir.Visible := True;
         // lbldospun03.Visible := True;
         lblptoage.Visible := True;
         dblcagegir.Text := '';
         meagengir.Text := '';
         lblagegir.Left := 110;
         lblagegir.Top := 57;
         dblcagegir.Left := 193;
         dblcagegir.Top := 57;
         pnlagegir.Left := 274;
         pnlagegir.Top := 57;
         lblasoncta.Visible := False;
         pnlasoncta.Visible := False;
         meAsoncta.Text := '';
      End;
      If dblcforpag.Text = '06' Then
      Begin
         lblagegir.Visible := False;
         dblcagegir.Visible := False;
         pnlagegir.Visible := False;
         // lbldospun03.Visible := False;
         lblptoage.Visible := False;
         dblcagegir.Text := '';
         lblasoncta.Visible := True;
         pnlasoncta.Visible := True;
         // lbldospun04.Visible := False;
         lblptoage.Visible := False;
         lblasoncta.Left := 110;
         lblasoncta.Top := 57;
         pnlasoncta.Left := 274;
         pnlasoncta.Top := 57;
      End;
   End
   Else
   Begin
      //Inicio: SPP_201401_PRE
      If (DM1.cdsExpLiq.FieldByName('GENPORWEB').AsString = 'S') And (Trim(DM1.cdsExpLiq.FieldByName('VERSEDE').AsString)= '') Then Exit;
         MessageDlg('Forma de pago no valida', mtInformation, [mbOk], 0);
      dblcforpag.Text := '';
      dblcforpag.SetFocus;
      Exit;
   End;
End;
// Fin: HPC_201802_PRE

// Inicio: SPP_201304_PRE - Procedimiento que invoca a los formularios que muestra la autorización
// de descuento de aportes y el formulario de no autorización de descuento de aportes
procedure TFModExpben.btnDesApoClick(Sender: TObject);
begin
   If DM1.cdsAsociado.FieldByName('AUTDESAPO').AsString = 'S' Then
   Begin
      Try
         Fmueautdesapo := TFmueautdesapo.Create(Self);
         Fmueautdesapo.ShowModal;
      Finally
         Fmueautdesapo.Free;
      End;
   End
   Else
   Begin
      Try
         FMueNoTieAutDesApo := TFMueNoTieAutDesApo.Create(Self);
         FMueNoTieAutDesApo.ShowModal;
      Finally
         FMueNoTieAutDesApo.Free;
      End;
   End;
end;
// Fin: SPP_201304_PRE


// Inicio: SPP_201305_PRE
procedure TFModExpben.btnanularClick(Sender: TObject);
begin
   Try
      Fanulacionexpediente := TFanulacionexpediente.create(Self);
      Fanulacionexpediente.ShowModal;
   Finally
      Fanulacionexpediente.Free;
   End;
   If DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString = '13' Then btncerrar.OnClick(btncerrar);
end;
// Fin: SPP_201305_PRE

procedure TFModExpben.btnnuesegClick(Sender: TObject);
begin
//Inicio: SPP_201401_PRE
   If (DM1.cdsExpLiq.FieldByName('GENPORWEB').AsString = 'S')  And (DM1.cdsExpLiq.FieldByName('VERSEDE').AsString <> 'S') Then
   Begin
      MessageDlg('Expediente generado por Web. Debe tener flag de verificado por Sede Central.', mtInformation, [mbOk], 0);
      Exit;
   End;
   Try
      FNueSegExp := TFNueSegExp.Create(Self);
      FNueSegExp.ShowModal;
   Finally
      FNueSegExp.Free;
   End;
//Fin: SPP_201401_PRE
End;

// Inicio: HPC_201605_PRE --Impresion
procedure TFModExpben.dblccodofiChange(Sender: TObject);
begin
  If dblccodofi.Text = '' Then
  Begin
     dblccodofi.Text := '';
     meofides.Text := '';
  End
  Else
     If Length(dblccodofi.Text) = 2 then
        If DM1.cdsOfDes.Locate('OFDESID', dblccodofi.Text , []) Then
           meofides.Text   := DM1.cdsOfDes.FieldByName('OFDESNOM').AsString
        Else
        Begin
           MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
           dblccodofi.Text := '';
           meofides.Text := '';
        End;
end;

procedure TFModExpben.btnImpresionClick(Sender: TObject);
Var xSql:String;
begin
   // Retiro y Invalidez
   If (DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString = '01') Or (DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString = '03') Then
   Begin
      ppLAsopenomR.Caption := DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString;
      ppLASOCODMODR.Caption := DM1.cdsAsociado.FieldByName('ASOCODMOD').AsString;
      ppLASODNIR.Caption := DM1.cdsAsociado.FieldByName('ASODNI').AsString;
      ppLRESCESE.Caption := DM1.cdsAsociado.FieldByName('ASORESCESE').AsString;
      ppLRESNOM.Caption  := DM1.cdsAsociado.FieldByName('ASORESNOM').AsString;
      pplasodir.Caption := meAsodir.Text;
      ppldepdir.Caption := DM1.DevuelveValor('APO158', 'DPTODES', 'DPTOID', Copy(DM1.cdsAsociado.FieldByName('ZIPID').AsString, 1, 2));
      pplprodir.Caption := DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', Copy(DM1.cdsAsociado.FieldByName('ZIPID').AsString, 1, 4));
      ppldisdir.Caption := DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', DM1.cdsAsociado.FieldByName('ZIPID').AsString);
      xSql := 'SELECT CODTIPTEL1, CODCIUTELFIJ1, ASOTELF1, CODREFTEL1, CODTIPTEL2, CODCIUTELFIJ2, ASOTELF2, CODREFTEL2 FROM APO201 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      // Telefono fijo
      If DM1.cdsQry.FieldByName('CODTIPTEL1').AsString = 'F' Then
         pplasotelfij.Caption := DM1.cdsQry.FieldByName('ASOTELF1').AsString
      Else
         If DM1.cdsQry.FieldByName('CODTIPTEL2').AsString = 'F' Then
            pplasotelfij.Caption := DM1.cdsQry.FieldByName('ASOTELF2').AsString;
      // Telefono celular
      If DM1.cdsQry.FieldByName('CODTIPTEL1').AsString <> 'F' Then
         pplasotelcel.Caption := DM1.cdsQry.FieldByName('ASOTELF1').AsString
      Else
         If DM1.cdsQry.FieldByName('CODTIPTEL2').AsString <> 'F' Then
            pplasotelcel.Caption := DM1.cdsQry.FieldByName('ASOTELF2').AsString;
      pplcenedu.Caption := DM1.cdsAsociado.FieldByName('ASODESLAB').AsString;
      ppldepcenedu.Caption := DM1.DevuelveValor('APO158', 'DPTODES', 'DPTOID', Copy(DM1.cdsAsociado.FieldByName('ASODSTLABID').AsString, 1, 2));
      pplprocenedu.Caption := DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', Copy(DM1.cdsAsociado.FieldByName('ASODSTLABID').AsString, 1, 4));
      ppldiscenedu.Caption := DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', DM1.cdsAsociado.FieldByName('ASODSTLABID').AsString);
      ppldiacese.Caption := Copy(DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsString,1,2);
      pplmescese.Caption := DM1.NombreMes(Copy(DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsString,4,2));
      pplanocese.Caption := Copy(DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsString,7,4);
      ppldianom.Caption :=  Copy(DM1.cdsExpLiq.FieldByName('ASOFRESNOM').AsString,1,2);
      pplmesnom.Caption := DM1.NombreMes(Copy(DM1.cdsExpLiq.FieldByName('ASOFRESNOM').AsString,4,2));
      pplanonom.Caption := Copy(DM1.cdsExpLiq.FieldByName('ASOFRESNOM').AsString,7,4);
      pplciudad.Caption := meofides.Text;
      pprRetiro.Print;
   End;

    // Fallecimiento
    If (DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString = '02') Then
    Begin
       ppLAsoapenomdniF.Caption := DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString;
       ppLASOCODMODF.Caption    := DM1.cdsAsociado.FieldByName('ASOCODMOD').AsString;
       ppLASODNIF.Caption       := DM1.cdsAsociado.FieldByName('ASODNI').AsString;
       ppLasoresnomF.Caption    := DM1.cdsAsociado.FieldByName('ASORESNOM').AsString;
       ppLasoresceseF.Caption   := DM1.cdsAsociado.FieldByName('ASORESCESE').AsString;
       ppLasoapenomsol.Caption  := meapenomsol.Text;
       ppLDNIsol.Caption        := meDNIsol.Text;
       ppLasodirF1.Caption      := Copy(meAsodir.Text,1,26);
       ppLasodirF2.Caption      := Copy(meAsodir.Text,27,50);
       ppLAsodisF.Caption       := DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', DM1.cdsAsociado.FieldByName('ZIPID').AsString);
       ppLasoproF.Caption       := DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', Copy(DM1.cdsAsociado.FieldByName('ZIPID').AsString, 1, 4));
       ppLasodepF.Caption       := DM1.DevuelveValor('APO158', 'DPTODES', 'DPTOID', Copy(DM1.cdsAsociado.FieldByName('ZIPID').AsString, 1, 2));
       ppLdiaresfall.Caption    := Copy(DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsString,1,2);
       ppLmesresfal.Caption     := DM1.NombreMes(Copy(DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsString,4,2));
       ppLanoresfal.Caption     := Copy(DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsString,7,4);
       ppLasocenedufal.Caption  := DM1.cdsAsociado.FieldByName('ASODESLAB').AsString;
       ppLdisasoceneduF.Caption := DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', DM1.cdsAsociado.FieldByName('ASODSTLABID').AsString);
       ppLproasoceneduF.Caption := DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', Copy(DM1.cdsAsociado.FieldByName('ASODSTLABID').AsString, 1, 4));
       ppLdepAsoceneduF.Caption := DM1.DevuelveValor('APO158', 'DPTODES', 'DPTOID', Copy(DM1.cdsAsociado.FieldByName('ASODSTLABID').AsString, 1, 2));
       ppLdianomfal.Caption := Copy(DM1.cdsExpLiq.FieldByName('ASOFRESNOM').AsString,1,2);
       ppLmesnomfal.Caption := DM1.NombreMes(Copy(DM1.cdsExpLiq.FieldByName('ASOFRESNOM').AsString,4,2));
       ppLanonomfal.Caption := Copy(DM1.cdsExpLiq.FieldByName('ASOFRESNOM').AsString,7,4);
       pplciudadfal.Caption :=  meofides.Text;
       pprFallecimiento.Print;
    End;
end;
// Fin: HPC_201605_PRE

// Inicio: HPC_201607_PRE
// Se valida que la fecha de recepción del expediente no sea mayor a la fecha actual
procedure TFModExpben.DBDTPfecrecexpExit(Sender: TObject);
begin
   If DBDTPfecrecexp.Date > DM1.FechaSys Then
   Begin
      MessageDlg('Fecha de recepción no puede ser mayor al día de hoy.', mtInformation, [mbOk], 0);
      DBDTPfecrecexp.Text := '';
      DBDTPfecrecexp.SetFocus;
   End;
end;
// Fin: HPC_201607_PRE

// Inicio HPC_201707_PRE : Validar la Fecha de la Hoja de Cargo
procedure TFModExpben.btnFecCargoClick(Sender: TObject);
begin
   FFecCargo := TFFecCargo.Create(self);
   FFecCargo.sExpedienteBen:=DM1.cdsExpLiq.FieldByName('PVSEXPNRO').AsString;
   FFecCargo.dFechaExp := DBDTPfecrecexp.Date;
   FFecCargo.Flag_Anular:='S';
   FFecCargo.ShowModal;
   FFecCargo.Free;
end;
// Fin   HPC_201707_PRE : Validar la Fecha de la Hoja de Cargo

// Inicio: HPC_201802_PRE
// Se añade procedimiento de forma de solicitud del expediente
procedure TFModExpben.rgforsolbenClick(Sender: TObject);
begin
   If rgforsolben.ItemIndex = 0 Then
   Begin
      rgCobAso.Visible := True;
      If rgCobAso.ItemIndex = 0 Then gbforpag.Visible := True
      Else gbforpag.Visible := False;
   End
   Else
   Begin
      rgCobAso.Visible := False;
      gbforpag.Visible := False;
   End;
end;
// Fin: HPC_201802_PRE

// Inicio: HPC_201809_PRE
// Procedimiento para validar las solicitudes de beneficios
procedure TFModExpben.btnsolbenefClick(Sender: TObject);
Var  xAno, xMes, xDia: Word;
xSql, xFechaHora:String;
begin
   DecodeDate(Date, xAno, xMes, xDia);
   xSql := 'SELECT TO_CHAR(SYSDATE,''DD/MM/YYYY HH12:MI:SS AM'') HORA_FECHA FROM DUAL';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   xFechaHora := DM1.cdsQry.FieldByName('HORA_FECHA').AsString;
   // 01 = RETIRO
   If DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString = '01' Then
   Begin
      ppdiahoysol01.Caption := DM1.StrZero(CurrToStr(xDia),2);
      pplmeshoysol01.Caption := DM1.NombreMes(CurrToStr(xMes));
      pplanohoysol01.Caption := Copy(CurrToStr(xAno),3,2);
      pplasoapenomdnisol01.Caption := DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString;
      pplasodnisol01.Caption := DM1.cdsAsociado.FieldByName('ASODNI').AsString;
      pplasocodmodsol01.Caption := DM1.cdsAsociado.FieldByName('ASOCODMOD').AsString;
      pplasodirsol01.Caption := DM1.cdsAsociado.FieldByName('ASODIR').AsString;
      ppldistritosol01.Caption := DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', DM1.cdsAsociado.FieldByName('ZIPID').AsString);
      pplprovinciasol01.Caption := DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', Copy(DM1.cdsAsociado.FieldByName('ZIPID').AsString, 1, 4));
      ppldepartamentosol01.Caption := DM1.DevuelveValor('APO158', 'DPTODES', 'DPTOID', Copy(DM1.cdsAsociado.FieldByName('ZIPID').AsString, 1, 2));
      pplasotelfsol01.Caption := Trim(DM1.cdsAsociado.FieldByName('ASOTELF1').AsString)+' / '+Trim(DM1.cdsAsociado.FieldByName('ASOTELF2').AsString);
      pplasoemail01.Caption := DM1.cdsAsociado.FieldByName('ASOEMAIL').AsString;
      pplasorescessol01.Caption := DM1.cdsAsociado.FieldByName('ASORESCESE').AsString;
      ppldiarescessol01.Caption := Copy(DM1.cdsAsociado.FieldByName('ASOFRESCESE').AsString,1,2);
      pplmesrescessol01.Caption := DM1.NombreMes(Copy(DM1.cdsAsociado.FieldByName('ASOFRESCESE').AsString,4,2));
      pplanorescessol01.Caption := Copy(DM1.cdsAsociado.FieldByName('ASOFRESCESE').AsString,7,4);
      xSql := 'SELECT A.NOMCENEDU NOMCENEDU, B.DPTODES DPTO, C.CIUDDES PROV, D.ZIPDES DIST'
      +' FROM ASO_CEN_EDU A, APO158 B, APO123 C, APO122 D WHERE A.CENEDUID = '+QuotedStr(DM1.cdsAsociado.FieldByName('CENEDUID').AsString)
      +' AND SUBSTR(A.UBIGEO_DIR,1,2) = B.DPTOID(+) AND SUBSTR(A.UBIGEO_DIR,1,4) = C.CIUDID(+) AND A.UBIGEO_DIR = D.ZIPID(+)';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      pplasocenedusol01.Caption := DM1.cdsQry.FieldByName('NOMCENEDU').AsString;
      ppldiscenedusol01.Caption := DM1.cdsQry.FieldByName('DIST').AsString;
      pplprocenedusol01.Caption := DM1.cdsQry.FieldByName('PROV').AsString;
      ppldepcenedusol01.Caption := DM1.cdsQry.FieldByName('DPTO').AsString;
      ppldianomsol01.Caption := Copy(DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString,1,2);
      pplmesnomsol01.Caption := DM1.NombreMes(Copy(DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString,4,2));
      pplanonomsol01.Caption := Copy(DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString,7,4);
      pplnumnomsol01.Caption := DM1.cdsAsociado.FieldByName('ASORESNOM').AsString;
      If Trim(DM1.cdsExpLiq.FieldByName('DNISOL').AsString) = '' Then
         pplasodnifirmasol01.Caption := DM1.cdsAsociado.FieldByName('ASODNI').AsString
      Else
         pplasodnifirmasol01.Caption := DM1.cdsExpLiq.FieldByName('DNISOL').AsString;
      pplusuariofechasol01.Caption := DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario)+' / '+Trim(xFechaHora);
      pprsolbenefret.Print;
   End;
   // 02 = FALLECIMIENTO
   If DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString = '02' Then
   Begin
   ppldiahoysolfal.Caption := DM1.StrZero(CurrToStr(xDia),2);
      pplmeshoysolfal.Caption := DM1.NombreMes(CurrToStr(xMes));
      pplanohoysolfal.Caption := Copy(CurrToStr(xAno),3,2);
      pplapenomsolfal.Caption := DM1.cdsExpLiq.FieldByName('APENOMSOL').AsString;
      ppldnisolfal.Caption    := DM1.cdsExpLiq.FieldByName('DNISOL').AsString;
      ppldirsolfal.Caption    := DM1.cdsExpLiq.FieldByName('DIRSOL').AsString;
      ppldesdissolfal.Caption := DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', DM1.cdsExpLiq.FieldByName('ZIPIDSOL').AsString);
      ppldesprosolfal.Caption := DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', Copy(DM1.cdsExpLiq.FieldByName('ZIPIDSOL').AsString, 1, 4));
      ppldesdepsolfal.Caption := DM1.DevuelveValor('APO158', 'DPTODES', 'DPTOID', Copy(DM1.cdsExpLiq.FieldByName('ZIPIDSOL').AsString, 1, 2));
      ppltelsolfal.Caption    := DM1.cdsExpLiq.FieldByName('TELEFONOSOL').AsString;
      pplemailsolfal.Caption  := DM1.cdsExpLiq.FieldByName('EMAILSOL').AsString;
      pplasoapenomdnisolfal.Caption := DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString;
      pplasodnisolfal.Caption       := DM1.cdsAsociado.FieldByName('ASODNI').AsString;
      pplasocodmodsolfal.Caption    := DM1.cdsAsociado.FieldByName('ASOCODMOD').AsString;
      pplasodirsolfal.Caption       := DM1.cdsAsociado.FieldByName('ASODIR').AsString;
      pplasodissolfal.Caption       := DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', DM1.cdsAsociado.FieldByName('ZIPID').AsString);
      pplasoprosolfal.Caption       := DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', Copy(DM1.cdsAsociado.FieldByName('ZIPID').AsString, 1, 4));
      pplasodepsolfal.Caption       := DM1.DevuelveValor('APO158', 'DPTODES', 'DPTOID', Copy(DM1.cdsAsociado.FieldByName('ZIPID').AsString, 1, 2));
      ppldiacesesolfal.Caption      := Copy(DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsString,1,2);
      pplmescesesolfal.Caption      := DM1.NombreMes( Copy(DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsString,4,2));
      pplanocesesolfal.Caption      := Copy(DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsString,7,4);
      pplasorescesesolfal.Caption   := DM1.cdsExpLiq.FieldByName('ASORESCESE').AsString;
      ppldianomfalsol.Caption := Copy(DM1.cdsExpLiq.FieldByName('ASOFRESNOM').AsString,1,2);
      pplmesnomfalsol.Caption := DM1.NombreMes( Copy(DM1.cdsExpLiq.FieldByName('ASOFRESNOM').AsString,4,2));
      pplanonomfalsol.Caption := Copy(DM1.cdsExpLiq.FieldByName('ASOFRESNOM').AsString,7,4);
      pplresnomsolfal.Caption := DM1.cdsExpLiq.FieldByName('ASORESNOM').AsString;
      ppldnidirmasolfal.Caption := DM1.cdsExpLiq.FieldByName('DNISOL').AsString;
      pplimpresoporsolfal.Caption := DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario)+' / '+Trim(xFechaHora);
      pprsolbeneffal.Print;
   End;
   // 03 = INVALIDEZ
   If DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString = '03' Then
   Begin
      ppdiahoysol02.Caption := DM1.StrZero(CurrToStr(xDia),2);
      pplmeshoysol02.Caption := DM1.NombreMes(CurrToStr(xMes));
      pplanohoysol02.Caption := Copy(CurrToStr(xAno),3,2);
      pplasoapenomdnisol02.Caption := DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString;
      pplasodnisol02.Caption := DM1.cdsAsociado.FieldByName('ASODNI').AsString;
      pplasocodmodsol02.Caption := DM1.cdsAsociado.FieldByName('ASOCODMOD').AsString;
      pplasodirsol02.Caption := DM1.cdsAsociado.FieldByName('ASODIR').AsString;
      ppldistritosol02.Caption := DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', DM1.cdsAsociado.FieldByName('ZIPID').AsString);
      pplprovinciasol02.Caption := DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', Copy(DM1.cdsAsociado.FieldByName('ZIPID').AsString, 1, 4));
      ppldepartamentosol02.Caption := DM1.DevuelveValor('APO158', 'DPTODES', 'DPTOID', Copy(DM1.cdsAsociado.FieldByName('ZIPID').AsString, 1, 2));
      pplasotelfsol02.Caption := Trim(DM1.cdsAsociado.FieldByName('ASOTELF1').AsString)+' / '+Trim(DM1.cdsAsociado.FieldByName('ASOTELF2').AsString);
      pplasoemail02.Caption := DM1.cdsAsociado.FieldByName('ASOEMAIL').AsString;
      pplasorescessol02.Caption := DM1.cdsAsociado.FieldByName('ASORESCESE').AsString;
      ppldiarescessol02.Caption := Copy(DM1.cdsAsociado.FieldByName('ASOFRESCESE').AsString,1,2);
      pplmesrescessol02.Caption := DM1.NombreMes(Copy(DM1.cdsAsociado.FieldByName('ASOFRESCESE').AsString,4,2));
      pplanorescessol02.Caption := Copy(DM1.cdsAsociado.FieldByName('ASOFRESCESE').AsString,7,4);
      xSql := 'SELECT A.NOMCENEDU NOMCENEDU, B.DPTODES DPTO, C.CIUDDES PROV, D.ZIPDES DIST'
      +' FROM ASO_CEN_EDU A, APO158 B, APO123 C, APO122 D WHERE A.CENEDUID = '+QuotedStr(DM1.cdsAsociado.FieldByName('CENEDUID').AsString)
      +' AND SUBSTR(A.UBIGEO_DIR,1,2) = B.DPTOID(+) AND SUBSTR(A.UBIGEO_DIR,1,4) = C.CIUDID(+) AND A.UBIGEO_DIR = D.ZIPID(+)';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      pplasocenedusol02.Caption := DM1.cdsQry.FieldByName('NOMCENEDU').AsString;
      ppldiscenedusol02.Caption := DM1.cdsQry.FieldByName('DIST').AsString;
      pplprocenedusol02.Caption := DM1.cdsQry.FieldByName('PROV').AsString;
      ppldepcenedusol02.Caption := DM1.cdsQry.FieldByName('DPTO').AsString;
      ppldianomsol02.Caption := Copy(DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString,1,2);
      pplmesnomsol02.Caption := DM1.NombreMes(Copy(DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString,4,2));
      pplanonomsol02.Caption := Copy(DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString,7,4);
      pplnumnomsol02.Caption := DM1.cdsAsociado.FieldByName('ASORESNOM').AsString;
      If Trim(DM1.cdsExpLiq.FieldByName('DNISOL').AsString) = '' Then
         pplasodnifirmasol02.Caption := DM1.cdsAsociado.FieldByName('ASODNI').AsString
      Else
         pplasodnifirmasol02.Caption := DM1.cdsExpLiq.FieldByName('DNISOL').AsString;
      pplusuariofechasol02.Caption := DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario)+' / '+Trim(xFechaHora);
      pprsolbenefinv.Print;
   End;
end;

procedure TFModExpben.meemailsolExit(Sender: TObject);
Var xSql:String;
begin
   If Trim(meemailsol.Text) <> '' Then
   Begin
      xSql := 'SELECT SF_ASO_VALIDA_DIR_CORREO('+QuotedStr(Trim(meemailsol.Text))+') VALOR FROM DUAL';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      If DM1.cdsQry.FieldByName('VALOR').AsInteger <> 0 Then
      Begin
         MessageDlg('Email no valido, o debe dejar en blanco', mtInformation, [mbOk], 0);
         meemailsol.SetFocus;
      End;
   End;
end;

procedure TFModExpben.meDNIsolExit(Sender: TObject);
begin
    If Trim(meDNIsol.Text) = '' Then Exit;
    meDNIsol.Text :=  DM1.FormatoEntero(meDNIsol.Text);
    If ((Trim(meDNIsol.Text) = '') Or  (Length(Trim(meDNIsol.Text)) <> 8)) Then
    Begin
        MessageDlg('Debe ingresar un número de DNI valido', mtError, [mbAbort], 0);
        meDNIsol.SetFocus;
        Exit;
    End;
end;


// Inicio: HPC_201809_PRE
// Se modifica procedimiento para controlar el departamento,
// provincia y distrito del solicitante
procedure TFModExpben.dblcddptoidsolChange(Sender: TObject);
begin
  medptosol.Text         := '';
  dblcdProvinciasol.Text := '';
  meprovinciasol.Text := '';
  dblcddistritosol.Text  := '';
  medistritosol.Text  := '';
end;

procedure TFModExpben.dblcddptoidsolExit(Sender: TObject);
Var xSql:String;
begin
   If DM1.cdsDpto1.Locate('DPTOID',VarArrayof([dblcddptoidsol.text]),[]) Then
   Begin
      medptosol.Text := DM1.cdsDpto1.FieldByName('DPTODES').AsString;
      xSql := 'SELECT CIUDID, CIUDDES FROM APO123 WHERE DPTOID = '+QuotedStr(dblcddptoidsol.Text)+' ORDER BY CIUDID';
      DM1.cdsProvincia1.Close;
      DM1.cdsProvincia1.DataRequest(xSql);
      DM1.cdsProvincia1.Open;
      dblcdProvinciasol.Selected.Clear;
      dblcdProvinciasol.Selected.Add('CIUDID'#9'4'#9'Ubigeo'#9#9);
      dblcdProvinciasol.Selected.Add('CIUDDES'#9'23'#9'Provincia'#9#9);
      dblcdProvinciasol.Enabled := True;
      dblcddistritosol.Enabled  := False;
      dblcdProvinciasol.SetFocus;
   End
   Else
   Begin
      If Trim(dblcddptoidsol.Text) = '' Then
      Begin
         dblcdProvinciasol.Enabled := False;
         dblcddistritosol.Enabled  := False;
      End;
      dblcddptoidsol.Text    := '';
      medptodesori.Text      := '';
      dblcdProvinciasol.Text := '';
      meprovinciasol.Text := '';
      dblcddistritosol.Text  := '';
      medistritosol.Text  := '';
      dblcdProvinciasol.Enabled := False;
      dblcddistritosol.Enabled  := False;
      MessageDlg('Código errado', mtError, [mbOk], 0);
      dblcddptoidsol.SetFocus;
   End;
End;

procedure TFModExpben.dblcdProvinciasolExit(Sender: TObject);
Var xSql:String;
begin
   If DM1.cdsProvincia1.Locate('CIUDID',VarArrayof([dblcdProvinciasol.text]),[]) Then
   Begin
      meprovinciasol.Text := DM1.cdsProvincia1.FieldByName('CIUDDES').AsString;
      xSql := 'SELECT ZIPID, ZIPDES FROM APO122 WHERE CIUDID = '+QuotedStr(dblcdProvinciasol.Text)+' ORDER BY ZIPID';
      DM1.cdsDist2.Close;
      DM1.cdsDist2.DataRequest(xSql);
      DM1.cdsDist2.Open;
      dblcddistritosol.Selected.Clear;
      dblcddistritosol.Selected.Add('ZIPID'#9'6'#9'Ubigeo'#9#9);
      dblcddistritosol.Selected.Add('ZIPDES'#9'23'#9'Distrito'#9#9);
      dblcddistritosol.Enabled := True;
      dblcddistritosol.SetFocus;
   End
   Else
   Begin
      If Trim(dblcdProvinciasol.Text) = '' Then
      Begin
         dblcddistritosol.Enabled  := False;
      End;
      dblcdProvinciasol.Text := '';
      meprovinciasol.Text := '';
      dblcddistritosol.Text := '';
      medistritosol.Text := '';
      dblcdProvinciasol.Enabled := True;
      dblcddistritosol.Enabled  := False;
      MessageDlg('Código errado', mtError, [mbOk], 0);
      dblcdProvinciasol.SetFocus;
  End;
end;

procedure TFModExpben.dblcddistritosolExit(Sender: TObject);
begin
   If DM1.cdsDist2.Locate('ZIPID',VarArrayof([dblcddistritosol.text]),[]) Then
   Begin
      medistritosol.Text := DM1.cdsDist2.FieldByName('ZIPDES').AsString;
      meemailsol.SetFocus;
   End
   Else
   Begin
      If Trim(dblcddistritosol.Text) = '' Then Exit;   
      medistritosol.Text    := '';
      dblcddistritosol.Text := '';
      MessageDlg('Código errado', mtError, [mbOk], 0);
      dblcddistritosol.SetFocus;
   End;
end;

procedure TFModExpben.dblcdProvinciasolChange(Sender: TObject);
begin
  meprovinciasol.Text   := '';
  dblcddistritosol.Text := '';
  medistritosol.Text    := '';
end;
// Fin: HPC_201809_PRE

procedure TFModExpben.btnbuscacausaClick(Sender: TObject);
begin
   DM1.xTipLiq := dbltipbenef.Text;
   If Trim(dbltipbenef.Text) = '' Then
   Begin
      MessageDlg('Debe seleccionar el tipo de beneficio antes de seleccionar la causa de cese.', mtError, [mbOk], 0);
      dbltipbenef.SetFocus;
      Exit;
   End;
   Try
      FCboCausaCese := TFCboCausaCese.create(Self);
      FCboCausaCese.Top  := FModExpben.Top+133;
      FCboCausaCese.Left := FModExpben.Left+375;
      FCboCausaCese.ShowModal;
   Finally
      FCboCausaCese.Free;
   End;
   If DM1.cdsQry22.Active = True Then
   Begin
      mebuscacausa.Text := DM1.cdsQry22.FieldByName('DESCAUCES').AsString;
      xCodCauCes := DM1.cdsQry22.FieldByName('CODCAUCES').AsString;
   End;
end;
// Fin: HPC_201809_PRE

procedure TFModExpben.BitBtn1Click(Sender: TObject);
VAR DATOS  : sTRING ;
   SEInfo  : TShellExecuteInfo;
   ExitCode: DWORD;
   ExecuteFile, ParamString, StartInString: string;
begin
   Try
      If (Length(trim(meAsocodmod.Text))=0) Then
      Begin
         ShowMessage('Debe seleccionar un asociado');
         exit;
      End;
      DATOS :=  DM1.wUsuario+' '+dm1.WdbePassword+' '+DM1.cdsAsociado.FieldByName('ASOID').AsString;
   Except
      ShowMessage('Debe seleccionar un asociado');
      exit;
   End;

   ExecuteFile:='C:\SOLEXES\MANASO.exe';
   FillChar(SEInfo, SizeOf(SEInfo), 0) ;
   FModExpben.Enabled := False;

   with SEInfo do begin
     cbSize       := SizeOf(TShellExecuteInfo) ;
     fMask        := SEE_MASK_NOCLOSEPROCESS;
     Wnd          := Application.Handle;
     lpFile       := PChar(ExecuteFile) ;
     lpParameters := PChar(DATOS);
     nShow        := SW_SHOWNORMAL;

If ShellExecuteEx(@SEInfo) Then
begin
  repeat
       Application.ProcessMessages;
       GetExitCodeProcess(SEInfo.hProcess, ExitCode) ;
       until (ExitCode <> STILL_ACTIVE) or
Application.Terminated;
     FModExpben.Enabled := True;
     actualiza;
 end;
end;
end;

procedure TFModExpben.actualiza;
var xsql,xsql2:String;
begin
     xsql2:='Select '
              +'asoid, asocodmod, asocodaux, asocodpago, asoapepat, asoapemat, asonombres, asoapenom, useid, uproid, upagoid,'
              +'asoresnom, asofresnom, resid, regpenid, asositid, asofact, asotipid, viaid, vianombre, asonumdir, asofdpto,'
              +'asodpto, zonaid, zonanomb, ubigeoid, dptoid, paisid, refdom, asofecnac, asotelf1, asotelf2, tipdoccod, asodocnum,'
              +'asolibmil, asoruc, estcivid, asosexo, asoemail, bancoid, asoncta, sitcta, asodni, graacid, grainsid, profid, asofmov,'
              +'asofluging, asodir, usuario, hreg, freg, asolugest, fecterest, tiempoest, asolnacid, asorescese, asofrescese, fgarante,'
              +'zipid, ciudid, archivoftp, ciaid, flagvar, asoapncre, flgfsol, estclf, observa, usr_crea, fec_crea, usr_ben, fec_ben,'
              +'ctaser, cargo, variascuot, crencuota, nfusion, idimage, fsinliq, asodescol, asodircol, asozipcol, asoapepatdni,'
              +'asoapematdni, asonomdni, asoapenomdni, asodeslab, asodirlab, asodptlabid, asoprvlabid, asodstlabid, asotellab,'
              +'dptnacid, prvnacid, dstnacid, vialabid, zonalabid, fecact, indicador, ccosid, password, codafp, deshabilitado,'
              +'valida_ci, tcreacion, regverif, codmodant, valcodmoddni, actarcrenant, actarcren, reingreso, autdesapo, fecautdesapo,'
              +'usuregautdesapo, ofiregautdesapo, codmodautdesapo, codarchivo, gencodbar, envautdes, corenvautdes, codtiplug, numdirviv,'
              +'nummanviv, numlotviv, desintviv, desrefviv, codurbviv, desurbviv, numetaviv, desetaviv, numintviv, nomdirviv, anoenv,'
              +'envio, codotrdocide, numotrdocide, codmotdestapo, autdescuo, fecautdescuo, usuregautdescuo, ofiregautdescuo, codmodautdescuo,'
              +'mdfasodir, mdfzipid, mdfcntreg, mdfusrmod, mdffecmod, emicarta, desmanviv, codmotdestcuo, fecactpad, ceneduid, fallecido,'
              +'tipo_fall_id, en_actualiz, codtiptel1, codreftel1, codtiptel2, codreftel2, codpension, fecregautdesapo, codleypen, numautonp,'
              +'codblocharen, numblocharen, coddepintren, desdepintren, asoapecasdni, invalidez, tipo_inva_id, fecautonp, asoaptser, fecactsit,'
              +'codreglab, usuautonp, oriopeonp, codciutelfij1, codciutelfij2, fecreccadaps, usureccadaps, codmotautcadaps, codpre, asocci,'
              +'latitud_dir, longitud_dir '
              + ' From apo201 where asoid='+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString);
              DM1.cdsAsociado.Close;
              DM1.cdsAsociado.DataRequest(xsql2);
              DM1.cdsAsociado.Open;

   meregpen.Text := DM1.DevuelveValor('APO105', 'REGPENABR', 'REGPENID', Copy(DM1.cdsAsociado.FieldByName('REGPENID').AsString,1,2));
   If DM1.cdsAsociado.FieldByName('REGPENID').AsString = '03' Then
   Begin
      xSql := 'SELECT SUBSTR(PROV,4,2) CODAFP, PROVDES DESAFP  FROM TGE201 WHERE SUBSTR(PROV,1,1) = ''A'' AND CLAUXID = ''A'' AND SUBSTR(PROV,4,2) = '+QuotedStr(DM1.cdsAsociado.FieldByName('CODAFP').AsString);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      meregpen.Text := meregpen.Text + ' - ' + DM1.cdsQry.FieldByName('DESAFP').AsString;
   End;
  DM1.CargaImagenes(DM1.cdsAsociado.FieldByName('ASODNI').AsString);
  ImgFotoConfirme.Picture.Assign(DM1.Jpg);
  ImgFirmaConfirme.Picture.Assign(DM1.jpgFirma);
     meAsozipdes.Text := DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', DM1.cdsAsociado.FieldByName('ZIPID').AsString) + '/'
         + DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', Copy(DM1.cdsAsociado.FieldByName('ZIPID').AsString, 1, 4)) + '/'
         + DM1.DevuelveValor('APO158', 'DPTODES', 'DPTOID', Copy(DM1.cdsAsociado.FieldByName('ZIPID').AsString, 1, 2));
      meAsozipdeslab.Text := DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', DM1.cdsAsociado.FieldByName('ASODSTLABID').AsString) + '/'
         + DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', Copy(DM1.cdsAsociado.FieldByName('ASODSTLABID').AsString, 1, 4)) + '/'
         + DM1.DevuelveValor('APO158', 'DPTODES', 'DPTOID', Copy(DM1.cdsAsociado.FieldByName('ASODSTLABID').AsString, 1, 2));
      measotelef.Text := DM1.cdsAsociado.FieldByName('ASOTELF1').AsString;
      menumresnom.Text := DM1.cdsAsociado.FieldByName('ASORESNOM').AsString;
      mefecresnom.Text := DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString;
      meAsoncta.Text := DM1.cdsAsociado.FieldByName('ASONCTA').AsString;
      meUpagoid.Text := DM1.cdsAsociado.FieldByName('UPAGOID').AsString;
      meUproid.Text := DM1.cdsAsociado.FieldByName('UPROID').AsString;
      meUseid.Text := DM1.cdsAsociado.FieldByName('USEID').AsString;
      meAsodir.Text := DM1.cdsAsociado.FieldByName('ASODIR').AsString;
      meAsodeslab.Text := DM1.cdsAsociado.FieldByName('ASODESLAB').AsString;
      meAsodirlab.Text := DM1.cdsAsociado.FieldByName('ASODIRLAB').AsString;
      meAsocodmod.Text := DM1.cdsAsociado.FieldByName('ASOCODMOD').AsString;
      meAsoApeNomDni.Text := DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString;
      meUpagoid.Text := DM1.cdsAsociado.FieldByName('UPAGOID').AsString;
      meUproid.Text := DM1.cdsAsociado.FieldByName('UPROID').AsString;
      meUseid.Text := DM1.cdsAsociado.FieldByName('USEID').AsString;
      meAsodir.Text := DM1.cdsAsociado.FieldByName('ASODIR').AsString;
      meAsodeslab.Text := DM1.cdsAsociado.FieldByName('ASODESLAB').AsString;
      meAsodirlab.Text := DM1.cdsAsociado.FieldByName('ASODIRLAB').AsString;
      If DM1.cdsAsociado.FieldByName('ASODNI').AsString = '' Then
      Begin
         xSql := 'SELECT TIPDOCABR FROM TGE159 WHERE TIPDOCCOD = ' + QuotedStr(DM1.cdsAsociado.FieldByName('TIPDOCCOD').AsString);
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         meAsoDocNum.Text := DM1.cdsQry.FieldByName('TIPDOCABR').AsString + '-' + DM1.cdsAsociado.FieldByName('ASODOCNUM').AsString;
      End
      Else
      Begin
         xSql := 'SELECT TIPDOCABR FROM TGE159 WHERE TIPDOCCOD = ' + QuotedStr('10');
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         meAsoDocNum.Text := DM1.cdsQry.FieldByName('TIPDOCABR').AsString + '-' + DM1.cdsAsociado.FieldByName('ASODNI').AsString;
      End;
      xSql := 'SELECT USENOM FROM APO101 WHERE USEID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('USEID').AsString) + ' AND UPAGOID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString) + ' AND UPROID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      meUsenom.Text := DM1.cdsQry.FieldByName('USENOM').AsString;
      xSql := 'SELECT UPAGONOM FROM APO103 WHERE UPAGOID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString) + ' AND UPROID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      meUpagonom.Text := DM1.cdsQry.FieldByName('UPAGONOM').AsString;
      xSql := 'SELECT UPRONOM FROM APO102 WHERE UPROID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      meUpronom.Text := DM1.cdsQry.FieldByName('UPRONOM').AsString;
end;

// Inicio: HPC_201809_PRE
// Se valida el ingreso de la causa de cese
procedure TFModExpben.mebuscacausaExit(Sender: TObject);
Var xSql:String;
begin
   If Trim(mebuscacausa.Text) = '' Then
      Exit;
   xSql := 'SELECT TIPBENEF, CODCAUCES, DESCAUCES FROM PRE_CAUSA_CESE_CAB WHERE TIPBENEF = '+QuotedStr(dbltipbenef.Text)
   +' AND DESCAUCES = '+QuotedStr(Trim(mebuscacausa.Text));
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   If DM1.cdsQry.RecordCount = 0 Then
   Begin
      MessageDlg('Descripción de causa de cese no existe, seleccione o registro uno valido.', mtError, [mbOk], 0);
      mebuscacausa.Text := '';
      mebuscacausa.SetFocus;
      Exit;
   End;
end;


procedure TFModExpben.dblcddistritosolChange(Sender: TObject);
begin
   medistritosol.Text := '';
end;
// Fin: HPC_201809_PRE

End.

