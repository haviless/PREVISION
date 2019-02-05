// Inicio Uso Estándares: 01/08/2011
// Unidad : Previsión Social
// Formulario : FNueExpben
// Fecha de Creación : 08/08/2011
// Autor : Sistemas
// Objetivo : Nuevo Expediente de beneficios
// Actualizaciones
// HPP_200903_PRE  Se modifica el "dblcforpag". Se envia el procedimiento al evento exit.
// HPC_200906_PRE  Memorándum 063-2009-DM-EPS, SE MODIFICA EL sql para el update en el apo201, Si el tipo de beneficio es 02 = FALLECIMIENTO se marca el campo FALLECIDO en el APO201 con "S"
// HPP_200908_PRE  SAR2009-0652 - DAD-IR-2009-0142, se cambia el clientdataset del campo asoid. Dicho campo de encontraba vacio en el client que se quita, por lo tanto nunca registraba en la auditoria (APO201_LOG)
// HPC_201005_PRE  Manejo de control de actualizaciones del asociado. Controla que otro modulo no use ese registro
// HPP_201006_PRE  Manejo de control de actualizaciones del asociado. Controla que otro modulo no use ese registro
// HPC_201202_PRE 10/02/20002 Desactiva lectura de Foto y Firma de FTP, lee de archivo RENIEC
// DPP_201201_PRE : Se realiza el pase a producción de acuerdo al HPC_201202_PRE
// HPC_201207_PRE : Ejecuta el procedimiento "registrasuceso" para Fondo de Desgravamen
// DPP_201207_PRE : Se realiza el pase a producción a partir del HPC_201207.
// HPC_201209_PRE : modifica la forma de pago
// SPP_201301_PRE : El pase se realiza de acuerdo a lo indicado en el HPC_201209_PRE
// HPC_201303_PRE : Visualización de Aportes Registrados, Visualizar mensaje si tiene autorización de descuento de aportes
//                  Imprimir hoja de datos RENIEC, Visualizar el regimen de pensión,
//                  Visualizar fondo solidario de contingencia.
// SPP_201304_PRE : Se realiza el pase a produccion a partir del HPC_201303_PRE
// HPC_201304_PRE : Se añade datos del solicitante de la solicitud
//                  Se corrige error al momento de seleccionar el tipo de AFP.
// SPP_201305_PRE : Se realiza el pase a producción a partir del HPC_201304_PRE
// HPC_201305_PRE : Actualización del campo FORMA DE SOLICITUD DE BENEFICIO
// SPP_201306_PRE : Se realiza el pase a producción a partir del HPC_201305_PRE
// HPC_201306_PRE : Se añade un radio group para Identificar el tipo de liquidación por retiro (1=Cese, 2= Invalidez temporal)
// SPP_201307_PRE : Se realiza el pase a producción a partir del HPC_201306_PRE.
// HPC_201307_PRE : Se añade procedimiento para el seguimiento de expediente
// SPP_201401_PRE : Se realiza el pase a producción a partir del pase HPC_201307_PRE
// HPC_201509_PRE : Categorizar Causas de Cese
// HPC_201601_PRE	    : CAMBIAR DE DO A CE AL GRABAR LA LIQUIDACION DE BENEFICIO
// HPC_201605_PRE : Se modifica la información ingresada en el origen de expediente.
//                  Debe ser departamento de origen y oficina de origen. 
//                  Se quita selección del representante.
// HPC_201609_PRE  : Se modifica la lectura de datos en la tabla de Carta de Designación.
//                   Solo se leee los que tienen con estado "02 = Activos".
// HPC_201610_PRE : CREAR Y MODIFICAR INDICADORES DE CALIDAD
// HPC_201704_PRE : Se retira unidad PRE237 y se añade PRE295
// HPC_201707_PRE : Validar la Fecha de la Hoja de Cargo
// HPC_201802_PRE : Se modifica el ingreso de nuevo expediente de beneficio
// HPC_201805_PRE : Se asigna por defecto el valor del banco al tipo de desembolso
// HPC_201809_PRE : Se modifica el ingreso de datos para el solicitante
// HPC_201810_PRE : Se modifica la opción que graba la hoja de cargo del expediente

unit PRE233;
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls, ComCtrls, Grids, Wwdbigrd,
  Wwdbgrid, wwdblook, Wwdbdlg, wwdbdatetimepicker, wwriched, fcButton,
  fcImgBtn, fcShapeBtn, DBGrids,  IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdFTP, Msgdlgs, ppDB, ppDBPipe, ppDBBDE,
// Inicio: SPP_201304_PRE
  ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd,
  // INICIO HPC_201509_PRE
//Inicio HPC_201809_PRE
//Se modifica el ingreso de datos para el solicitante
  ppReport, PRE901,ShellApi;
//Fin HPC_201809_PRE
  // FIN HPC_201509_PRE
// Fin: SPP_201304_PRE
type
  TFNueExpben = class(TForm)
    Label1: TLabel;
    sbBuscar: TSpeedButton;
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
    pnlasocodmod: TPanel;
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
    gborigen: TGroupBox;
    Label20: TLabel;
    // Inicio: HPC_201605_PRE --Se retira
    // pnlofdesnom: TPanel;
    // medistdes: TMaskEdit;
    // Fin: HPC_201605_PRE
    tsdatper: TTabSheet;
    btngrasol: TBitBtn;
    dblcdptoid: TwwDBLookupCombo;
    rgCobAso: TRadioGroup;
    GroupBox2: TGroupBox;
    Label18: TLabel;
    Label22: TLabel;
    dbdtpfecces: TwwDBDateTimePicker;
    Label23: TLabel;
    Label24: TLabel;
    btncerrar: TBitBtn;
    Label13: TLabel;
    meanoultapo: TMaskEdit;
    Label14: TLabel;
    Label15: TLabel;
    memesultapo: TMaskEdit;
    btncreditos: TBitBtn;
    btnaportes: TBitBtn;
    pnlnumresnom: TPanel;
    menumresnom: TMaskEdit;
    pnlfecresnom: TPanel;
    mefecresnom: TMaskEdit;
    pnlnumresces: TPanel;
    menumresces: TMaskEdit;
    pnlobservacion: TPanel;
    StaticText1: TStaticText;
    redit: TRichEdit;
    Label16: TLabel;
    // Inicio: HPC_201605_PRE --Se retira, queda oficina
    dblccodofi: TwwDBLookupCombo;
    // Label21: TLabel;
    // dblcprovid: TwwDBLookupCombo;
    // dblcdistid: TwwDBLookupCombo;
    // Fin: HPC_201605_PRE
    // Inicio: HPC_201605_PRE --Se retira, queda oficina
    meofides: TMaskEdit;
    // meprovdes: TMaskEdit;
    // Fin: HPC_201605_PRE
    Panel12: TPanel;
    Panel13: TPanel;
    medptodes: TMaskEdit;
    gbtipben: TGroupBox;
    Label17: TLabel;
    lblfacinv: TLabel;
    // Inicio: HPC_201809_PRE
    // Se modifica el nombre del panel de tipo de beneficio
    // Panel16: TPanel;
    pnltipobeneficio: TPanel;
    // Fin: HPC_201809_PRE
    metipbenef: TMaskEdit;
    dbdtpfacinv: TwwDBDateTimePicker;
    // INICIO HPC_201509_PRE
    // pnlfallecimiento: TPanel;
    // mefallecimiento: TMaskEdit;
    // FIN HPC_201509_PRE
    dbltipbenef: TwwDBLookupCombo;
    // Inicio: HPC_201605_PRE --Se retira
    // lbltitrep: TLabel;
    // Fin: HPC_201605_PRE
    pnlalerta: TPanel;
    mealterta: TMaskEdit;
    timeralerta: TTimer;
    // Inicio: HPC_201605_PRE --Se retira
    // dblcRepori: TwwDBLookupComboDlg;
    // pnlapenomrep: TPanel;
    // merepder: TMaskEdit;
    // lblRepresentante: TLabel;
    // pnlubirep: TPanel;
    // meubigeorep: TMaskEdit;
    // Fin: HPC_201605_PRE


    Label2: TLabel;
    Panel6: TPanel;
    measotelef: TMaskEdit;
    timerobservacion: TTimer;
    btnfotfir: TBitBtn;
    gbfotoreniec: TGroupBox;
    ImgFotoConfirme: TImage;
    ImgFirmaConfirme: TImage;
    gbforpag: TGroupBox;
    lblforpag: TLabel;
    lblbanco: TLabel;
    lblagegir: TLabel;
    lblasoncta: TLabel;
    dblcforpag: TwwDBLookupCombo;
    dblcBanco: TwwDBLookupCombo;
    dblcagegir: TwwDBLookupComboDlg;
    pnlforpag: TPanel;
    meforpagodes: TMaskEdit;
    pnlbanco: TPanel;
    mebancodes: TMaskEdit;
    pnlagegir: TPanel;
    meagengir: TMaskEdit;
    pnlasoncta: TPanel;
    meAsoncta: TMaskEdit;
    lbldospun04: TLabel;
    lbldospun03: TLabel;
    lbldospun02: TLabel;
    lbldospun01: TLabel;
    // Inicio: SPP_201304_PRE - Variables para el reporte RENIEC y reporte de FSC
    btnfonsol: TBitBtn;
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
    Label19: TLabel;
    Panel14: TPanel;
    meregpen: TMaskEdit;
    // Inicio: SPP_201305_PRE
    TabSheet1: TTabSheet;
    // Inicio: HPC_201809_PRE
    // Se retiran caja de texto y etiquetas no usadas
    // meDNIsol: TMaskEdit;
    // meapenomsol: TMaskEdit;
    // Label25: TLabel;
    // Label26: TLabel;
    // Label27: TLabel;
    // mevinparentesco: TMaskEdit;
    // Fin: HPC_201809_PRE
    rgforsolben: TRadioGroup; // SPP_201306_PRE
    rgtipret: TRadioGroup; // SPP_201307_PRE
    // Inicio: HPC_201809_PRE
    // Se retiran caja de texto y etiquetas no usadas
    // CboCausaCese: TFCboCausaCese;
    // Fin: HPC_201809_PRE
    GBfecrec: TGroupBox;
    DBDTPfecrecexp: TwwDBDateTimePicker;
    // Fin: HPC_201605_PRE
    // FIN HPC_201509_PRE
    // Fin: SPP_201305_PRE
    // Fin: SPP_201304_PRE
// Inicio HPC_201707_PRE : Validar la Fecha de la Hoja de Cargo
    btnFecCargo: TBitBtn;
    // Inicio: HPC_201809_PRE
    // Se añaden etiquetas y cajas de texto para el ingreso de los datos del solicitante
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label21: TLabel;
    Label25: TLabel;
    meDNIsol: TMaskEdit;
    meapenomsol: TMaskEdit;
    mevinparentesco: TMaskEdit;
    medirsol: TMaskEdit;
    meemailsol: TMaskEdit;
    Label26: TLabel;
    metelsol: TMaskEdit;
    dblcddptoidsol: TwwDBLookupComboDlg;
    Panel17: TPanel;
    medptosol: TMaskEdit;
    Label34: TLabel;
    Label30: TLabel;
    dblcdProvinciasol: TwwDBLookupComboDlg;
    Panel18: TPanel;
    meprovinciasol: TMaskEdit;
    Label35: TLabel;
    dblcddistritosol: TwwDBLookupComboDlg;
    Panel19: TPanel;
    medistritosol: TMaskEdit;
    gbCausaCese: TGroupBox;
    btnbuscacausa: TButton;
    mebuscacausa: TMaskEdit;
    BitBtn1: TBitBtn;
    // Fin: HPC_201809_PRE
// Fin    HPC_201707_PRE : Validar la Fecha de la Hoja de Cargo

    procedure sbBuscarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure rgCobAsoClick(Sender: TObject);
    procedure dblcdBancoidChange(Sender: TObject);
    procedure dbdtpfacinvExit(Sender: TObject);
    procedure mefallecimientoExit(Sender: TObject);
    procedure dblcdreporiExit(Sender: TObject);
    procedure dbltipbenefChange(Sender: TObject);
    procedure dbltipbenefExit(Sender: TObject);
    procedure dblcdptoidChange(Sender: TObject);
//  Inicio: HPC_201605_PRE --Se retira
//  procedure dblcProoriExit(Sender: TObject);
//  procedure dblcRepori1Change(Sender: TObject);
//  Fin: HPC_201605_PRE
    procedure dblcRepori1Exit(Sender: TObject);
    procedure dblcBancoChange(Sender: TObject);
    procedure dblcagegir1Change(Sender: TObject);
    procedure btngrasolClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure btncreditosClick(Sender: TObject);
    procedure btnaportesClick(Sender: TObject);
    procedure dbdtpfeccesExit(Sender: TObject);
    procedure dblcagegirChange(Sender: TObject);
//  Inicio: HPC_201605_PRE --Se retira
//  procedure dblccodofiChange(Sender: TObject);
//  procedure dblcdistidChange(Sender: TObject);
//  procedure dblcReporiChange(Sender: TObject);
//  procedure dblcReporiExit(Sender: TObject);
//  procedure dblcdistidExit(Sender: TObject);
//  procedure dblcdptoidExit(Sender: TObject);
// Fin: HPC_201605_PRE
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure timeralertaTimer(Sender: TObject);
    procedure dblcforpagExit(Sender: TObject);
    procedure dblcBancoExit(Sender: TObject);
    procedure dblcagegirExit(Sender: TObject);
    // Inicio: HPC_201605_PRE --Se retira
    // procedure dblccodofiExit(Sender: TObject);
    // Fin: HPC_201605_PRE
    procedure timerobservacionTimer(Sender: TObject);
    procedure btnfotfirClick(Sender: TObject);
    procedure ImgFotoConfirmeDblClick(Sender: TObject);
    procedure meAsocodmodKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure meAsocodmodChange(Sender: TObject);
// Inicio: SPP_201304_PRE 
    procedure gbfotoreniecClick(Sender: TObject);   // Procedimiento muestra foto RENIEC
    procedure btnDesApoClick(Sender: TObject);      // Procedimiento muestra mensaje de autorización de descuento de aportes
    procedure btnfonsolClick(Sender: TObject);      // Procedimiento muestra formulario de fondo solidario de contingencia
    // Inicio: HPC_201605_PRE --Oficina fecha de recepcion
    procedure dblccodofiChange(Sender: TObject);
    procedure DBDTPfecrecexpExit(Sender: TObject);
    // Fin: HPC_201605_PRE
// Fin: SPP_201304_PRE
// Inicio HPC_201707_PRE : Validar la Fecha de la Hoja de Cargo
    procedure btnFecCargoClick(Sender: TObject);
    // Inicio: HPC_201802_PRE
    // Se añade el radio grupo para seleccionar el origen de la solicitud 
    procedure rgforsolbenClick(Sender: TObject);
    // Inicio: HPC_201809_PRE
    // Se añaden nuevos procedimientos que ayudan a controlar el ingreso de los nuevos datos del solicitante 
    procedure meDNIsolExit(Sender: TObject);
    procedure meemailsolExit(Sender: TObject);
    procedure dblcddptoidsolChange(Sender: TObject);
    procedure dblcddptoidsolExit(Sender: TObject);
    procedure dblcdProvinciasolExit(Sender: TObject);
    procedure dblcddistritosolExit(Sender: TObject);
    procedure dblcdProvinciasolChange(Sender: TObject);
    procedure btnbuscacausaClick(Sender: TObject);
    procedure mebuscacausaExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    // Fin: HPC_201809_PRE
//Inicio HPC_201809_PRE
//Actualiza las modificaciones delcliente
    procedure actualiza();
    procedure dblcdptoidExit(Sender: TObject);
    procedure dblccodofiExit(Sender: TObject);
    // Inicio: HPC_201809_PRE
    // Se crea procedimiento para controlar los cambios del distrito del solicitante
    procedure dblcddistritosolChange(Sender: TObject);
    // Fin: HPC_201809_PRE


//Fin HPC_201809_PRE
    // Fin: HPC_201802_PRE
// Fin   HPC_201707_PRE : Validar la Fecha de la Hoja de Cargo

  private
    { Private declarations }
  public
//Inicio HPC_201809_PRE
//Actualiza las modificaciones delcliente
    xpuedeingresarmantenimiento:String;
    xDpto : String;
    xOfici : String;
    xreingresante:String;
//Fin HPC_201809_PRE
    // Inicio: HPC_201809_PRE
    // Se añade variable para guardar el codigo de causa de la liquidación
    xCodCauCes:String;    
    // Fin: HPC_201809_PRE
    procedure limpia;
    procedure llena;
// Inicio: SPP_201304_PRE 
// Procedimiento que invoca a muestra autorización de descuento de aportes
    procedure mueautdesapo; 
// Fin: SPP_201304_PRE 
    function chksolicitud:Boolean;
    // Inicio: HPC_201809_PRE
    // Se retira procedimiento de borrar fotos del disco duro
    // Se añade procedimiento actualiza origen del expediente
    // procedure borrafotos; 
    procedure actoriexp;
    // Fin: HPC_201809_PRE
    { Public declarations }
  end;
var
  FNueExpben: TFNueExpben;
  xMarcaPRE : boolean;



implementation

// Inicio: SPP_201304_PRE Se añaden los fuentes PRE276 (FSC), PRE277 (Mensaje de autorización de descuento de aportes)
// PRE278 (Mensaje de no autorización de descuento de aportes)
// Inicio: HPC_201704_PRE
// Se retira unidad PRE237 y se añade PRE295
// uses PREDM, PRE234, PRE236, PRE237,  PRE235, PRE260, PRE275, PRE283,
// Inicio HPC_201707_PRE : Validar la Fecha de la Hoja de Cargo
uses PREDM, PRE234, PRE236, PRE235, PRE260, PRE275, PRE283,
      PRE284, Math, PRE277, PRE278, PRE276, PRE295, PRE299;
// Fin   HPC_201707_PRE : Validar la Fecha de la Hoja de Cargo
// Fin: HPC_201704_PRE

// Fin: SPP_201304_PRE

{$R *.dfm}

procedure TFNueExpben.sbBuscarClick(Sender: TObject);
var
   xSQL : String;
begin
  DM1.xSgr := 'S';
//Inicio HPC_201809_PRE
//Adiciona nueva variable
  xpuedeingresarmantenimiento:='N';
//Final HPC_201809_PRE
  // Inicio: HPC_201809_PRE
  // Se modifica el procedimiento para borrar fotos del disco duro
  // borrafotos;
  DM1.BorraFotos;
  // Fin: HPC_201809_PRE
  ImgFotoConfirme.Visible  := False;
  ImgFirmaConfirme.Visible := False;
  limpia;
  Try
    FBusAso := TFBusAso.create(Self);
    FBusAso.ShowModal;
  Finally
    FBusAso.Free;
  End;

  If DM1.cdsAsociado.Active = True Then
  Begin
    If Length(Trim(DM1.cdsAsociado.FieldByName('ASOID').AsString)) > 0 Then
    Begin
      if DM1.IndicaAsociadoEnAct(DM1.cdsAsociado.FieldByName('ASOID').AsString) then
      begin
// Inicio: SPP_201304_PRE
         ErrorMsg('Módulo de Previsión', 'Existe otra opción que puede estar actualizando datos del Asociado'+chr(13)+'no se puede ejecutar en simultáneo con esta Opción');
// Fin: SPP_201304_PRE
//Inicio HPC_201809_PRE
//Adiciona nueva variable
         xpuedeingresarmantenimiento:='N';
//Final HPC_201809_PRE
         exit;
      end;
      xSQL := 'begin '
             +' SP_ACT_PROC_ACT_MAE('+quotedstr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+','
                                      +quotedstr(DM1.wModulo)+', ' + QuotedStr(DM1.wUsuario) + '); '
                                      +'end; ';
      DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
//Inicio HPC_201809_PRE
//Adiciona nueva variable
      xpuedeingresarmantenimiento:='S';
//Final HPC_201809_PRE
      xMarcaPRE := True;
      llena;
      // Inicio: SPP_201304_PRE
      //        Controla que se haya seleccionado un docente
      If DM1.cdsAsociado.FieldByName('AUTDESAPO').AsString <> 'S' Then
         If meAsocodmod.Text <> '' Then mueautdesapo;
      // Fin: SPP_201304_PRE
      pgmulti.Enabled := True;
      pgmulti.TabIndex := 0;
      // INICIO HPC_201509_PRE
      IF rgCobAso.Enabled THEN rgCobAso.SetFocus;
      // FIN HPC_201509_PRE

    End;
  End;
end;

Procedure TFNueExpben.FormActivate(Sender: TObject);
Var xSql:String;
Begin
//Inicio HPC_201809_PRE
//Adiciona nueva variable
  xpuedeingresarmantenimiento:='N';
//Final HPC_201809_PRE
  rgtipret.Visible := False;  // SPP_201307_PRE
  pgmulti.TabIndex := 0;
  pgmulti.Enabled := False;
  pnlalerta.Visible        := False;
  pnlobservacion.Visible   := False;
  timeralerta.Enabled      := False;
  timerobservacion.Enabled := False;
  gbfotoreniec.Visible     := False;
  btnfonsol.Enabled        := False;
  DM1.xSgr := 'N';
  // Inicio: HPC_201809_PRE
  // Se retira variable no usada
  // DM1.xCnd := 'N';
  // Fin: HPC_201809_PRE

  xSql := 'SELECT TIPDESEID, TIPDESEDES, FLACOBPRE FROM CRE104 A WHERE NVL(FLAVIGPRE, ''X'') = ''S'' ORDER BY TIPDESEID';
  DM1.cdsFPago.Close;
  DM1.cdsFPago.DataRequest(xSql);
  DM1.cdsFPago.Open;
  dblcforpag.Selected.Add('TIPDESEID'#9'2'#9'Código'#9#9);
  dblcforpag.Selected.Add('TIPDESEDES'#9'30'#9'Descripción'#9#9);

  xSql := 'SELECT * FROM TGE186 WHERE TIPBENEF IN (''01'',''02'',''03'')';
  DM1.cdsTipBenef.Close;
  DM1.cdsTipBenef.DataRequest(xSql);
  DM1.cdsTipBenef.Open;
  dbltipbenef.Selected.Clear;
  dbltipbenef.Selected.Add('TIPBENEF'#9'2'#9'Código'#9#9);
  dbltipbenef.Selected.Add('BENEFABR'#9'15'#9'Descripción'#9#9);
  xSql := 'SELECT CIUDID, CIUDDES FROM APO123 WHERE CIUDID = ''''';
  DM1.cdsProvincia.Close;
  DM1.cdsProvincia.DataRequest(xSql);
  DM1.cdsProvincia.Open;
  xSql := 'SELECT ZIPID, ZIPDES FROM APO122 WHERE ZIPID = ''''';
  DM1.cdsDist.Close;
  DM1.cdsDist.DataRequest(xSql);
  DM1.cdsDist.Open;

  xSql := 'SELECT DPTOID, DPTODES FROM APO158 ORDER BY DPTOID';
  DM1.cdsDpto.Close;
  DM1.cdsDpto.DataRequest(xSql);
  DM1.cdsDpto.Open;
  dblcdptoid.Selected.Clear;
  dblcdptoid.Selected.Add('DPTOID'#9'2'#9'Código'#9#9);
  dblcdptoid.Selected.Add('DPTODES'#9'25'#9'Departamento'#9#9);

  // Inicio: HPC_201809_PRE
  // Se añade client de departamento para el solicitante
  xSql := 'SELECT DPTOID, DPTODES FROM APO158 ORDER BY DPTOID';
  DM1.cdsDpto1.Close;
  DM1.cdsDpto1.DataRequest(xSql);
  DM1.cdsDpto1.Open;
  dblcddptoidsol.Selected.Clear;
  dblcddptoidsol.Selected.Add('DPTOID'#9'2'#9'Código'#9#9);
  dblcddptoidsol.Selected.Add('DPTODES'#9'25'#9'Descripción'#9#9);
  // Fin: HPC_201809_PRE

  DBDTPfecrecexp.SetFocus;
  xMarcaPRE := False;

End;

Procedure TFNueExpben.limpia;
Begin
  pnlalerta.Visible        := False;
  timeralerta.Enabled      := False;
  timerobservacion.Enabled := False;
  redit.Lines.Text := '';
  menumresnom.Text := '';
  menumresces.Text := '';
  dbdtpfecces.Text := '';
  meAsocodmod.Text := '';
  meAsoApeNomDni.Text := '';
  meAsoDocNum.Text := '';
  meUsenom.Text := '';
  meUseid.Text := '';
  meUpagoid.Text := '';
  meUpagonom.Text := '';
  meUproid.Text := '';
  meUpronom.Text := '';
  meAsodir.Text := '';
  measotelef.Text := '';
  meAsozipdes.Text := '';
  meAsodirlab.Text := '';
  meAsodeslab.Text := '';
  meAsozipdeslab.Text := '';
  meAsoncta.Text := '';
  dblcforpag.Text := '';
  meforpagodes.Text := '';
  dblcBanco.Text := '';
  mebancodes.Text := '';
  meanoultapo.Text := '';
  memesultapo.Text := '';
  meregpen.Text := '';  // SPP_201304_PRE Variable para visualizar el regimen de pensión.
//Inicio HPC_201809_PRE
//Inicializa variable
  dblcdptoid.Text :='';
  dblccodofi.Text :='';
  medptodes.Text  :='';
  meofides.Text   :='';
//Final HPC_201809_PRE
End;


Procedure TFNueExpben.llena;
Var xSql, xapenom :String;
Begin
  xreingresante := 'N';
  meAsocodmod.Text := DM1.cdsAsociado.FieldByName('ASOCODMOD').AsString;
  meAsoApeNomDni.Text := DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString;
  DM1.CargaImagenes(DM1.cdsAsociado.FieldByName('ASODNI').AsString);
  ImgFotoConfirme.Visible  := True;
  ImgFirmaConfirme.Visible := True;
  ImgFotoConfirme.Picture.Assign(DM1.Jpg);
  ImgFirmaConfirme.Picture.Assign(DM1.jpgFirma);
  gbfotoreniec.Visible := True;
  If DM1.cdsAsociado.FieldByName('ASODNI').AsString = '' Then
  Begin
    xSql := 'SELECT TIPDOCABR FROM TGE159 WHERE TIPDOCCOD = '+QuotedStr(DM1.cdsAsociado.FieldByName('TIPDOCCOD').AsString);
    DM1.cdsQry.Close;
    DM1.cdsQry.DataRequest(xSql);
    DM1.cdsQry.Open;
    meAsoDocNum.Text :=  DM1.cdsQry.FieldByName('TIPDOCABR').AsString+'-'+DM1.cdsAsociado.FieldByName('ASODOCNUM').AsString;
  End
  Else
  Begin
    xSql := 'SELECT TIPDOCABR FROM TGE159 WHERE TIPDOCCOD = '+QuotedStr('10');
    DM1.cdsQry.Close;
    DM1.cdsQry.DataRequest(xSql);
    DM1.cdsQry.Open;
    meAsoDocNum.Text :=  DM1.cdsQry.FieldByName('TIPDOCABR').AsString+'-'+DM1.cdsAsociado.FieldByName('ASODNI').AsString;
  End;
  xSql := 'SELECT USENOM FROM APO101 WHERE USEID = '+QuotedStr(DM1.cdsAsociado.FieldByName('USEID').AsString)+' AND UPAGOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString)+' AND UPROID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  meUsenom.Text   := DM1.cdsQry.FieldByName('USENOM').AsString;
  meUseid.Text    := DM1.cdsAsociado.FieldByName('USEID').AsString;
  xSql := 'SELECT UPAGONOM FROM APO103 WHERE UPAGOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString)+' AND UPROID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  meUpagonom.Text := DM1.cdsQry.FieldByName('UPAGONOM').AsString;
  meUpagoid.Text  := DM1.cdsAsociado.FieldByName('UPAGOID').AsString;
  meUproid.Text   := DM1.cdsAsociado.FieldByName('UPROID').AsString;
  xSql := 'SELECT UPRONOM FROM APO102 WHERE UPROID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  meUpronom.Text  := DM1.cdsQry.FieldByName('UPRONOM').AsString;
  meAsodir.Text := DM1.cdsAsociado.FieldByName('ASODIR').AsString;
  measotelef.Text := DM1.cdsAsociado.FieldByName('ASOTELF1').AsString;
  meAsodeslab.Text := DM1.cdsAsociado.FieldByName('ASODESLAB').AsString;
  meAsodirlab.Text := DM1.cdsAsociado.FieldByName('ASODIRLAB').AsString;
  meAsozipdes.Text := DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', DM1.cdsAsociado.FieldByName('ZIPID').AsString)+'/'
                      +DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', Copy(DM1.cdsAsociado.FieldByName('ZIPID').AsString,1,4))+'/'
                      +DM1.DevuelveValor('APO158', 'DPTODES', 'DPTOID', Copy(DM1.cdsAsociado.FieldByName('ZIPID').AsString,1,2));
  meAsozipdeslab.Text := DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', DM1.cdsAsociado.FieldByName('ASODSTLABID').AsString)+'/'
                      +DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', Copy(DM1.cdsAsociado.FieldByName('ASODSTLABID').AsString,1,4))+'/'
                      +DM1.DevuelveValor('APO158', 'DPTODES', 'DPTOID', Copy(DM1.cdsAsociado.FieldByName('ASODSTLABID').AsString,1,2));
  menumresnom.Text := DM1.cdsAsociado.FieldByName('ASORESNOM').AsString;
  menumresces.Text := DM1.cdsAsociado.FieldByName('ASORESCESE').AsString;
  mefecresnom.Text := DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString;
  dbdtpfecces.Date := DM1.cdsAsociado.FieldByName('ASOFRESCESE').AsDateTime;
  meAsoncta.Text := DM1.cdsAsociado.FieldByName('ASONCTA').AsString;
  // Inicio: SPP_201304_PRE Actualiza caja de texto con los datos de regimen de pensión del asociado
  meregpen.Text := DM1.DevuelveValor('APO105', 'REGPENABR', 'REGPENID', Copy(DM1.cdsAsociado.FieldByName('REGPENID').AsString,1,2));
  If DM1.cdsAsociado.FieldByName('REGPENID').AsString = '03' Then
  Begin
     // Inicio: SPP_201305_PRE  // xSql := 'SELECT SUBSTR(PROV,4,2) CODAFP, PROVDES DESAFP  FROM TGE201 WHERE SUBSTR(PROV,1,1) = ''A'' AND CLAUXID = ''A''';
     xSql := 'SELECT SUBSTR(PROV,4,2) CODAFP, PROVDES DESAFP  FROM TGE201 WHERE SUBSTR(PROV,1,1) = ''A'' AND CLAUXID = ''A'' AND SUBSTR(PROV,4,2) = '+QuotedStr(DM1.cdsAsociado.FieldByName('CODAFP').AsString);
     // Fin: SPP_201305_PRE
     DM1.cdsQry.Close;
     DM1.cdsQry.DataRequest(xSql);
     DM1.cdsQry.Open;
     meregpen.Text := meregpen.Text + ' - ' + DM1.cdsQry.FieldByName('DESAFP').AsString;
  End;
  // Fin: SPP_201304_PRE
  If meAsoApeNomDni.Text <> '' Then
  Begin
    // Verificando si el asociado esta apto para la liquidación
    If (DM1.cdsAsociado.FieldByName('ASOTIPID').AsString <> 'DO')  And (DM1.cdsAsociado.FieldByName('ASOTIPID').AsString <> 'CE') Then
    Begin
      MessageDlg('Verifique la situación del asociado : '+Trim(meAsoApeNomDni.Text), mtInformation, [mbOk], 0);
      meAsocodmod.Text := '';
      meAsocodmod.SetFocus;
      Exit;
    End;
    // Verificando si tiene expediente ingresado
    If (DM1.cdsAsociado.FieldByName('ASOTIPID').AsString = 'CE') Then timeralerta.Enabled := true;
    xSql := 'SELECT ASOID, PVSESTADO FROM PVS301 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND PVSESTADO NOT IN (''04'',''13'')';
    DM1.cdsQry.Close;
    DM1.cdsQry.DataRequest(xSql);
    DM1.cdsQry.Open;
    If DM1.cdsQry.RecordCount > 0 Then
    Begin
      If DM1.cdsQry.FieldByName('PVSESTADO').AsString = '01' Then
      Begin
        MessageDlg(' El asociado : '+Trim(meAsoApeNomDni.Text)+' ya cuenta con un expediente de beneficio en tramite ', mtInformation, [mbOk], 0);
        pnlalerta.Visible := False;
        timeralerta.Enabled := False;
        meAsocodmod.Text := '';
        meAsocodmod.SetFocus;
        Exit;
      End;
      If DM1.cdsQry.FieldByName('PVSESTADO').AsString = '02' Then
      Begin
        // INICIO: HPC_201704_PRE
        // Se añade tilde a la palabra "procedera"
        // MessageDlg(' El asociado : '+Trim(meAsoApeNomDni.Text)+' cuenta con un expediente ya liquidado,'+#13+' se procedera a crear un expediente como reingresante ', mtInformation, [mbOk], 0);
        MessageDlg(' El asociado : '+Trim(meAsoApeNomDni.Text)+' cuenta con un expediente ya liquidado,'+#13+' se procederá a crear un expediente como reingresante ', mtInformation, [mbOk], 0);
        // FIN: HPC_201704_PRE
        xreingresante := 'S';
      End;
    End;
    // Verificando si tiene liquidacion en la tabla de beneficios antigua
    xSql := 'SELECT NOM_GEN FROM PVS315 WHERE NOM_GEN LIKE '+QuotedStr(Trim(DM1.cdsAsociado.FieldByname('ASOAPENOMDNI').AsString)+'%');
    DM1.cdsQry.Close;
    DM1.cdsQry.DataRequest(xSql);
    DM1.cdsQry.Open;
    If DM1.cdsQry.RecordCount > 0 Then
    Begin
       // INICIO: HPC_201704_PRE
       // Se añade tilde a la palabra "procedera", "liquidacion"
       // MessageDlg(' Se ha detectado un asociado : '+Trim(DM1.cdsQry.FieldByName('NOM_GEN').AsString)+' que ya cuenta con una liquidacion antigua '+#13+'se procedera a crear un expediente como reingresante', mtInformation, [mbOk], 0);
       MessageDlg(' Se ha detectado un asociado : '+Trim(DM1.cdsQry.FieldByName('NOM_GEN').AsString)+' que ya cuenta con una liquidación antigua '+#13+'se procederá a crear un expediente como reingresante', mtInformation, [mbOk], 0);
       // FIN: HPC_201704_PRE
      xreingresante := 'S';
    End;
    // Verificando si tiene liquidacion en la tabla de beneficios antigua
    // buscando por dni
    xSql := 'SELECT NOM_GEN FROM PVS315 WHERE TRIM(LIB_ELE) = '+QuotedStr(Trim(DM1.cdsAsociado.FieldByname('ASODNI').AsString));

    DM1.cdsQry.Close;
    DM1.cdsQry.DataRequest(xSql);
    DM1.cdsQry.Open;
    If DM1.cdsQry.RecordCount > 0 Then
    Begin
      // INICIO: HPC_201704_PRE
      // MessageDlg('Se ha detectado un asociado : '+Trim(DM1.cdsQry.FieldByName('NOM_GEN').AsString)+' con el DNI de asociado seleccionado en la tabla liquidacion antigua', mtInformation, [mbOk], 0);
      MessageDlg('Se ha detectado un asociado : '+Trim(DM1.cdsQry.FieldByName('NOM_GEN').AsString)+' con el DNI de asociado seleccionado en la tabla liquidación antigua', mtInformation, [mbOk], 0);
      // FIN: HPC_201704_PRE
      xreingresante := 'S';
    End;
  End;
  // Mensaje para las observaciones
  // Revisando si ya fue liquidado
  redit.Lines.Clear;
  redit.Color := clMoneyGreen;
  redit.Font.Style := [fsbold];
  If xreingresante = 'S' Then
  Begin
    pnlobservacion.Visible := True;
    redit.Lines.Text := 'Asociado reingresante'#13#13;
  End;
  // revisando si tiene carta de designación.
  // Inicio: HPC_201609_PRE
  // Se añade al script de busqueda la condicion en el cual no debe tomar  tipo de estado = "13" (anulado)
  // xSql := 'SELECT ASOID, COUNT(*) CUENTA FROM PVS302 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' where usuanu is not null  GROUP BY ASOID';
  xSql := 'SELECT ASOID, COUNT(1) CUENTA FROM PVS302 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND DSGESTAD NOT IN ''13'' GROUP BY ASOID';
  // Fin: HPC_201609_PRE
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  If DM1.cdsQry.RecordCount > 0 Then
  Begin
    redit.Lines.Text := redit.Lines.Text + 'Asociado cuenta con '+DM1.cdsQry.FieldByName('CUENTA').AsString+' carta(s) de designación.'#13#13;
  End;
  // revisando si tiene retención judicial
  xSql := 'SELECT * FROM PVS305 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString);
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  If DM1.cdsQry.RecordCount > 0 Then
  Begin
    redit.Lines.Text := redit.Lines.Text + 'Asociado cuenta con retención judicial.'#13#13;
  End;
  If Length(Trim(redit.Lines.Text)) > 0 Then
  Begin
    pnlobservacion.Visible := True;
    timerobservacion.Enabled := True;
  End;
  xapenom := Trim(DM1.cdsAsociado.FieldByName('ASOAPEPAT').AsString)+' '+Trim(DM1.cdsAsociado.FieldByName('ASOAPEMAT').AsString);
  // Verificar por apellido paterno y apellido materno
  xSql := 'SELECT ANO||''-''||NUM_EXP NUM_EXP, FEC_EXP, COD_MOD, NUM_EXP, NOM_GEN, LIB_ELE, COD_MOD FROM PVS315 WHERE NOM_GEN LIKE '+QuotedStr(Trim(xapenom)+'%');
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  If DM1.cdsQry.RecordCount >  0 Then
  Begin
    Try
      FMstLiqAnt := TFMstLiqAnt.create(Self);
      FMstLiqAnt.ShowModal;
    Finally
      FMstLiqAnt.Free;
    End;
  End;
  // Inicio: HPC_201605_PRE --Se retira
  // If (dblcdptoid.Text <> '15') And (dblcdptoid.Text <> '07') Then
  // Begin
  //   dblcRepori.Enabled := True;
  //   pnlubirep.Visible := True;
  // End
  // Else
  // Begin
  //   pnlubirep.Visible := False;
  //   dblcRepori.Enabled := False;
  // End;
  // Fin: HPC_201605_PRE
  pgmulti.Enabled := True;
  pgmulti.TabIndex := 0;

  // Inicio: SPP_201304_PRE
  // Se habilita o deshabilita boton de fondo solidario
  xSql := 'SELECT count(*) REGISTROS FROM COB_FSC_DEUDA_FSC_CAB WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+ ' AND ID_EST_FSC NOT IN (''04'',''13'')';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  If DM1.cdsQry.FieldByName('REGISTROS').AsInteger = 0 Then btnfonsol.Enabled := False Else btnfonsol.Enabled := True;
  // Fin: SPP_201304_PRE

  // Inicio: HPC_201809_PRE
  // Se añade procedimiento para actualizar el origen del expediente 
  actoriexp;
  // Fin: HPC_201809_PRE



End;

// Inicio: HPC_201802_PRE
// Se modifica la forma de seleccionar el origen de la creación del expediente
Procedure TFNueExpben.rgCobAsoClick(Sender: TObject);
Begin
// If rgCobAso.ItemIndex = 0 Then
// Begin
//     gbforpag.Visible := True;
//     If dblcforpag.Text = '' Then
//     Begin
//       dblcforpag.Text    := '';
//       meforpagodes.Text  := '';
//       dblcBanco.Text     := '';
//       mebancodes.Text    := '';
//       measoncta.Text     := '';
//     End;
//   End
//   Else
//   Begin
//     gbforpag.Visible := False;
//   End;
   If rgforsolben.ItemIndex = 0 Then
   Begin
      If rgCobAso.ItemIndex = 0 Then
      Begin
         gbforpag.Visible := True;
         If dblcforpag.Text = '' Then
         Begin
            dblcforpag.Text    := '';
            meforpagodes.Text  := '';
            dblcBanco.Text     := '';
            mebancodes.Text    := '';
            measoncta.Text     := '';
         End;
      End
      Else
         gbforpag.Visible := False;
   End;
End;
// Fin: HPC_201802_PRE

procedure TFNueExpben.dblcdBancoidChange(Sender: TObject);
begin
  If DM1.cdsTipBenef.Locate('TIPBENEF',dbltipbenef.Text,[]) then
     metipbenef.Text := DM1.cdsTipBenef.FieldByName('BENEFDES').AsString
  Else
  Begin
    If Length(dbltipbenef.Text) <> 2 then
    Begin
      Beep;
      dbltipbenef.Text  :='';
    End;
  End;
end;

procedure TFNueExpben.dbdtpfacinvExit(Sender: TObject);
begin
  If dbltipbenef.Text = '02' Then
  Begin
    If dbdtpfacinv.Text = '' Then
    Begin
      MessageDlg('Ingrese la fecha de fallecimiento', mtInformation, [mbOk], 0);
      dbdtpfacinv.SetFocus;
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
      meAsocodmod.SetFocus;
  End;
end;

procedure TFNueExpben.mefallecimientoExit(Sender: TObject);
begin
  meAsocodmod.SetFocus;
end;

procedure TFNueExpben.dblcdreporiExit(Sender: TObject);
begin
meAsocodmod.SetFocus;
end;

Procedure TFNueExpben.dbltipbenefChange(Sender: TObject);
Begin
  // Inicio: HPC_201809_PRE
  // Se retira procedimiento de carga de datos
  // // INICIO HPC_201509_PRE
  // CboCausaCese.FG_CARGA_DATOS(dbltipbenef.Text);
  // // FIN HPC_201509_PRE
  mebuscacausa.Text := '';
  // Fin: HPC_201809_PRE

  // Inicio: HPC_201802_PRE
  // Se controla la forma de pago para los origen de solicitud 
  // If dbltipbenef.Text <> '02'  Then
  If (dbltipbenef.Text <> '02') And (rgforsolben.ItemIndex = 0)  Then
  // Fin: HPC_201802_PRE
  Begin
    rgCobAso.Enabled := True;
    rgCobAso.ItemIndex := 0;
    gbforpag.Visible := True;
  End
  Else
  Begin
    rgCobAso.Enabled := True;
    rgCobAso.ItemIndex := 1;
    rgCobAso.Enabled := False;
    gbforpag.Visible := False;
  End;

  If Trim(dbltipbenef.Text) = '' Then
  Begin
    dbltipbenef.Text := '';
    metipbenef.Text := '';
  End;
  If Length(Trim(dbltipbenef.Text)) = 2 then
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
  dbdtpfacinv.Text := '';
  // INICIO HPC_201509_PRE
  // mefallecimiento.Text := '';
  // FIN HPC_201509_PRE
End;

procedure TFNueExpben.dbltipbenefExit(Sender: TObject);
Var xSql:String;
begin
  If Trim(dbltipbenef.Text) <> '' Then
  Begin
    xSql := 'SELECT  * FROM TGE186 WHERE TIPBENEF = '+QuotedStr(dbltipbenef.Text);
    If DM1.verificaexiste(xSql) = False Then
    Begin
      MessageDlg('Tipo de beneficio no valido', mtInformation, [mbOk], 0);
      dbltipbenef.Text := '';
      dbltipbenef.SetFocus;
      Exit;
    End;
    If dbltipbenef.Text = '01' Then
    Begin
      lblfacinv.Visible := False;
      dbdtpfacinv.Visible := False;
      dbdtpfacinv.Text := '';
      // INICIO HPC_201509_PRE
      //mefallecimiento.Text := '';
      //lblfallecimiento.Visible := False;
      //pnlfallecimiento.Visible := False;
      // FIN HPC_201509_PRE
      // Inicio: SPP_201307_PRE
      rgtipret.Visible := True;
      rgtipret.SetFocus;
      // meAsocodmod.SetFocus;
      // Fin: SPP_201307_PRE
    End;
    If dbltipbenef.Text = '02' Then
    Begin
      rgtipret.Visible := False; //SPP_201307_PRE
      lblfacinv.Visible := True;
      lblfacinv.Caption := 'Fecha de fallecimiento :';
      dbdtpfacinv.Visible := True;
      // INICIO HPC_201509_PRE
      // lblfallecimiento.Visible := True;
      // pnlfallecimiento.Visible := True;
      // FIN HPC_201509_PRE
      dbdtpfacinv.SetFocus;
      pgmulti.TabIndex := 0;
      rgCobAso.ItemIndex := 1;
      rgCobAso.Enabled := False;
    End;
    If dbltipbenef.Text = '03' Then
    Begin
      rgtipret.Visible := False; //SPP_201307_PRE    
      lblfacinv.Visible := True;
      lblfacinv.Caption := 'Fecha de invalidez :';
      dbdtpfacinv.Visible := True;
      // INICIO HPC_201509_PRE
      // lblfallecimiento.Visible := False;
      // pnlfallecimiento.Visible := False;
      // FIN HPC_201509_PRE
      dbdtpfacinv.SetFocus;
      pgmulti.TabIndex := 0;
      If rgCobAso.ItemIndex = -1 Then
      Begin
        rgCobAso.ItemIndex := 0;
        rgCobAso.Enabled := True;
      End;
    End;
  End;
End;

// Inicio: HPC_201605_PRE --Expediente de beneficio
Procedure TFNueExpben.dblcdptoidChange(Sender: TObject);
Var xSql:String;
Begin
  If dblcdptoid.Text = '' Then
  Begin
    medptodes.Text     := '';
    dblccodofi.Text    := '';
    meofides.Text      := '';
    dblccodofi.Enabled := False;
    DM1.cdsOfDes.Close;
    // dblcprovid.Text := '';
    // meprovdes.Text  := '';
    // dblcdistid.Text := '';
    // medistdes.Text  := '';
    // xSql := 'SELECT CIUDID, CIUDDES FROM APO123 WHERE CIUDID = ''''';
    // DM1.cdsProvincia.Close;
    // DM1.cdsProvincia.DataRequest(xSql);
    // DM1.cdsProvincia.Open;
    // xSql := 'SELECT ZIPID, ZIPDES FROM APO122 WHERE ZIPID = ''''';
    // DM1.cdsDist.Close;
    // DM1.cdsDist.DataRequest(xSql);
    // DM1.cdsDist.Open;
  End;
  If Length(dblcdptoid.Text) = 2 then
  Begin
    If DM1.cdsDpto.Locate('DPTOID', dblcdptoid.Text, []) Then
    Begin
      medptodes.Text := DM1.cdsDpto.FieldByName('DPTODES').AsString;
      dblccodofi.Enabled := True;
      dblccodofi.Text    := '';
      meofides.Text      := '';
      xSql := 'SELECT OFDESID, OFDESNOM FROM APO110 WHERE DPTOID = '+QuotedStr(dblcdptoid.Text)+' ORDER BY OFDESID';
      DM1.cdsOfDes.Close;
      DM1.cdsOfDes.DataRequest(xSql);
      DM1.cdsOfDes.Open;
      dblccodofi.Selected.Clear;
      dblccodofi.Selected.Add('OFDESID'#9'2'#9'Código'#9#9);
      dblccodofi.Selected.Add('OFDESNOM'#9'35'#9'Oficina'#9#9);
      // xSql := 'SELECT CIUDID, CIUDDES FROM APO123 WHERE DPTOID = '+QuotedStr(dblcdptoid.Text)+' ORDER BY CIUDID';
      // DM1.cdsProvincia.Close;
      // DM1.cdsProvincia.DataRequest(xSql);
      // DM1.cdsProvincia.Open;
      // dblcprovid.Selected.Clear;
      // dblcprovid.Selected.Add('CIUDID'#9'4'#9'Código'#9#9);
      // dblcprovid.Selected.Add('CIUDDES'#9'25'#9'Provincia'#9#9);
    End
    Else
    Begin
      MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
      dblcdptoid.Text    := '';
      medptodes.Text     := '';
      dblccodofi.Text    := '';
      meofides.Text      := '';
      dblccodofi.Enabled := False;
      // dblcprovid.Text := '';
      // meprovdes.Text  := '';
      // dblcdistid.Text := '';
      // medistdes.Text  := '';
      Exit;
    End;
  End;
End;
// Fin: HPC_201605_PRE

// Inicio: HPC_201605_PRE --Se retira
// Procedure TFNueExpben.dblcProoriExit(Sender: TObject);
// Begin
// If (dblcdptoid.Text <> '15') And (dblcdptoid.Text <> '07') Then
//    dblcRepori.SetFocus
// Else
//    meAsocodmod.SetFocus;
// End;
// Fin: HPC_201605_PRE

// Inicio: HPC_201605_PRE --Se retira
// procedure TFNueExpben.dblcRepori1Change(Sender: TObject);
// begin
//    If Length(dblcRepori.Text) = 5 then
//    Begin
//       If DM1.cdsRepresentante.Locate('REPRID', dblcRepori.Text, []) Then
//       Begin
//          merepder.Text := DM1.cdsRepresentante.FieldByname('REPRAPENOM').AsString;
//       End
//       Else
//       Begin
//          MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
//          dblcRepori.Text := '';
//          merepder.Text := '';
//       End;
//    End;
// end;
// Fin: HPC_201605_PRE

procedure TFNueExpben.dblcRepori1Exit(Sender: TObject);
begin
  If Trim(meAsocodmod.Text) = '' Then meAsocodmod.SetFocus;
end;

Procedure TFNueExpben.dblcBancoChange(Sender: TObject);
Begin
  If Trim(dblcBanco.Text) = '' Then
  Begin
    dblcBanco.Text := '';
    mebancodes.Text := '';
  End;
  If Length(dblcBanco.Text) = 2 then
  Begin
    If DM1.cdsBanco.Locate('BANCOID', dblcBanco.Text, []) Then
    Begin
      mebancodes.Text := DM1.cdsBanco.FieldByName('BANCONOM').AsString;
    End
    Else
    Begin
      MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
      dblcBanco.Text := '';
      mebancodes.Text := '';
    End;
  End;
End;

Procedure TFNueExpben.dblcagegir1Change(Sender: TObject);
Begin
  If Length(dblcagegir.Text) = 8 then
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

Procedure TFNueExpben.btngrasolClick(Sender: TObject);
Var xSql, xReg, xCobAso, xultapo, xAsoid: String;
    xFecInv, xFecFal, xestado, xforsolben: String; // SPP_201306_PRE Se añade variable para la forma de solicitud de beneficio
    xIdeGesFal : String;
    xmoncre    : Double;
    xtipret    : String; // SPP_201307_PRE
    // INICIO HPC_201610_PRE
    // DECLARACION DE VARIABLE
    xsCODCAREXP : String;
    // FIN HPC_201610_PRE
Begin
// Inicio HPC_201707_PRE : Validar la Fecha de la Hoja de Cargo
  if meAsocodmod.Text='' then Exit;

  If Length(trim(DBDTPfecrecexp.Text)) <= 0 Then
  Begin
      MessageDlg('Debe Registrar la Fecha de Recepción del Expediente', mtError, [mbOk], 0);
      DBDTPfecrecexp.SetFocus;
      Exit;
  End;

  If DBDTPfecrecexp.Date > DM1.FechaSys Then
  Begin
     MessageDlg('Fecha de recepción no puede ser mayor al día de hoy.', mtError, [mbOk], 0);
     Exit;
  end;

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

  If DBDTPfecrecexp.Date < StrToDate(Copy(DateToStr(DM1.cdsQry.fieldbyname('FECHA_HOJA_CARGO').AsDateTime), 1, 10)) Then
  Begin
     MessageDlg('Fecha de recepción no puede ser menor a la fecha de la Hoja de Cargo ('
                 +DM1.cdsQry.fieldbyname('FECHA_HOJA_CARGO').AsString+').' , mtError, [mbOk], 0);
     Exit;
  end;
// Fin   HPC_201707_PRE : Validar la Fecha de la Hoja de Cargo

  // Muestra observaciones de otras areas
  // Ver si existen antes de abrir
  DM1.cdssinresolver.EmptyDataSet;
  xSql := 'SELECT OBSERVA, TO_DATE(FECHA) FECHA, CODOBS FROM OBSERVACION_ASOCIADO WHERE ASOID='+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' ORDER BY FECHA DESC';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  If Dm1.cdsQry.RecordCount>0 Then
  Begin
    If DM1.cdsQry.FieldByName('CODOBS').AsString <> '07' Then
    Begin
      While Not DM1.cdsQry.Eof do
      Begin
        If DM1.cdsQry.FieldByName('CODOBS').AsString = '07' then Break;
        DM1.cdssinresolver.Insert;
        DM1.cdssinresolver.FieldByName('OBSERVACION').AsString := Dm1.cdsQry.FieldByName('OBSERVA').AsString;
        DM1.cdssinresolver.FieldByName('FECHA').AsString       := Dm1.cdsQry.FieldByName('FECHA').AsString;
        DM1.cdssinresolver.FieldByName('PROCEDENCIA').AsString := 'ASOCIADOS';
        DM1.cdssinresolver.Post;
        DM1.cdsQry.Next;
      End;
    End;
  End;
  xSql := 'SELECT * FROM OBS000 Where Asoid='+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND FECAPRO IS NULL';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  If DM1.cdsQry.RecordCount>0 Then
  Begin
    While Not DM1.cdsQry.Eof do
    Begin
      DM1.cdssinresolver.Insert;
      DM1.cdssinresolver.FieldByName('OBSERVACION').AsString:= Dm1.cdsQry.FieldByName('MTOOBSR').AsString;
      DM1.cdssinresolver.FieldByName('FECHA').AsString:= Dm1.cdsQry.FieldByName('FECOBSR').AsString;
      DM1.cdssinresolver.FieldByName('PROCEDENCIA').AsString:= 'CREDITOS' ;
      DM1.cdssinresolver.Post;
      DM1.cdsQry.Next;
    End;
  End;
  If DM1.cdssinresolver.RecordCount > 0 Then
  Begin
    Try
      FMstObsOtrAre := TFMstObsOtrAre.create(Self);
      FMstObsOtrAre.ShowModal;
    Finally
      FMstObsOtrAre.Free;
    End;
    MessageDlg('Levante las observaciones pendientes antes de continuar', mtInformation, [mbOk], 0);
    Exit;
  End;
  If rgCobAso.ItemIndex = 0 Then xCobAso := 'S' Else xCobAso := 'N';
  DM1.validaasociados(DM1.cdsAsociado.FieldByName('ASOID').AsString, xCobAso);
  If chksolicitud = True Then
  Begin
    If MessageDlg('¿ Seguro de crear el expediente de liquidación ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
    Begin
      // Inicio: SPP_201307_PRE
      If dbltipbenef.Text = '01' Then
         If rgtipret.ItemIndex = -1 Then
            xtipret := '0'
         Else
            xtipret := IntToStr(rgtipret.ItemIndex)
      Else
         xtipret := '';
      // Fin: SPP_201307_PRE
      // Inicio: HPC_201809_PRE 
      // Se retira variable no usada
      // DM1.xCnd := 'S';
      // Fin: HPC_201809_PRE 
      DM1.numeroexpediente := DM1.Gennumexp;
      xFecInv:= ''; xFecFal:= '';
      // Fallecimiento
      If dbltipbenef.Text = '02' Then xFecFal := dbdtpfacinv.Text;
      // Invalidez
      If dbltipbenef.Text = '03' Then xFecInv := dbdtpfacinv.Text;
      xultapo := meanoultapo.text+'/'+memesultapo.text;
      If xreingresante = 'S' Then xestado := '05' Else xestado := '01';
      // Inicio: SPP_201306_PRE  Se añade la actualización del campo TIPO DE EXPEDIENTE DE BENEFICIO
      If rgforsolben.ItemIndex = 0 Then xforsolben := 'S';
      If rgforsolben.ItemIndex = 1 Then xforsolben := 'O';

      // Inicio: HPC_201810_PRE
      // Se quita procedimiento
      //// INICIO HPC_201610_PRE
      //// crea registro de hoja de cargo de expediente, si no existe lo crea
      // xSql :=
      //   'SELECT DB2ADMIN.PCK_PRE_CARGO_EXPEDIENTE.SF_PRE_OBTIENE_CODIGO_PENDIENT '
      // + '       (' + QuotedStr(dblccodofi.Text) + ', ' + QuotedStr(DM1.wUsuario) + ', ' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString) + ', TO_DATE(' + QuotedStr(DBDTPfecrecexp.Text) + ',''DD/MM/YYYY'')) CODCAREXP '
      // + '  FROM DUAL ';
      xSql := 'SELECT NVL(MAX(CODCAREXP),''NULL'') CODCAREXP FROM DB2ADMIN.PRE_CARGO_EXPEDIENTE_MOV A, APO201 B'
      +' WHERE A.ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND B.ASOTIPID IN (''DO'',''CE'') AND A.CODCAREXPEST = ''PENDIENTE'''
      +' AND A.ASOID = B.ASOID';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      // Fin: HPC_201810_PRE
      xsCODCAREXP := DM1.cdsQry.fieldbyname('CODCAREXP').AsString;

      // Inicio: HPC_201802_PRE
      // Se inicializa variable de forma de pago en el caso que el expediente sea por oficio
      If rgforsolben.ItemIndex = 1 Then
      Begin
         xCobAso := '';
         dblcforpag.Text    := '';
         dblcBanco.Text     := '';
         dblcagegir.Text    := '';
         meAsoncta.Text     := '';
      End;
      // Inicio: HPC_201809_PRE
      // Se añade en el proceso de grabación de la solicitud los campos del solicitante
      xSql  :=' INSERT INTO PVS301 (CIAID, PVSEXPNRO, PVSTIPBEN, ASOID, ASOCODMOD, ASOCODAUX, PVSESTADO, ASORESNOM, ASOFRESNOM, ASORESCESE, ASOFRESCESE, PVSCAUSA,'
      +' FORPAGOID, BANCOID, AGENBCOID, ASOAPENOMDNI, PVSULTAPO, PVSCOBASO, ASOFECNAC, TIPDOCCOD, ASODOCNUM, ASODNI, USUARIO,'
      // +' FREG, HREG, ASOFECINV, ASOFECFAL, ASONCTA, PVSFECEXP, USUCREEXP, APENOMSOL, DNISOL, VINPARSOL, FORSOLBEN, PVSTIPRET, VERSEDE, OFDESIDORI, TIPBENEF, CODCAUCES, DEPORIEXP, OFIORIEXP, FECRECEXP, CODCAREXP)'
      +' FREG, HREG, ASOFECINV, ASOFECFAL, ASONCTA, PVSFECEXP, USUCREEXP, APENOMSOL, DNISOL, VINPARSOL, FORSOLBEN, PVSTIPRET, VERSEDE, OFDESIDORI, TIPBENEF, CODCAUCES, DEPORIEXP, OFIORIEXP, FECRECEXP, CODCAREXP, TELEFONOSOL, DIRSOL, EMAILSOL, ZIPIDSOL)'
      +' VALUES (''02'', '+QuotedStr(DM1.numeroexpediente)+', '+QuotedStr(dbltipbenef.Text)+', '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+', '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOCODMOD').AsString)+', '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOCODAUX').AsString)
      // +','+QuotedStr(xestado)+', '+QuotedStr(menumresnom.Text)+', '+QuotedStr(mefecresnom.Text)+', '+QuotedStr(menumresces.Text)+', '+QuotedStr(dbdtpfecces.Text)+', SUBSTR('+QuotedStr(CboCausaCese.cbListaDatos.Text)+',1,50),'
      +','+QuotedStr(xestado)+', '+QuotedStr(menumresnom.Text)+', '+QuotedStr(mefecresnom.Text)+', '+QuotedStr(menumresces.Text)+', '+QuotedStr(dbdtpfecces.Text)+', SUBSTR('+QuotedStr(mebuscacausa.Text)+',1,50),'
      +QuotedStr(dblcforpag.Text)+', '+QuotedStr(dblcBanco.Text)+', '+QuotedStr(dblcagegir.Text)+', '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString)+', '+QuotedStr(xultapo)+', '+QuotedStr(xCobAso)
      +','+QuotedStr(DM1.cdsAsociado.FieldByName('ASOFECNAC').AsString)+', '+QuotedStr(DM1.cdsAsociado.FieldByName('TIPDOCCOD').AsString)+', '+QuotedStr(DM1.cdsAsociado.FieldByName('ASODOCNUM').AsString)+', '+QuotedStr(DM1.cdsAsociado.FieldByName('ASODNI').AsString)+', '+QuotedStr(DM1.wUsuario)
      +', TO_CHAR(SYSDATE, ''DD/MM/YYYY''), SYSDATE ,'+QuotedStr(xFecInv)+', '+QuotedStr(xFecFal)+', '+QuotedStr(meAsoncta.Text)+', SYSDATE'
      // +','+QuotedStr(DM1.wUsuario)+', '+QuotedStr(meapenomsol.Text)+', '+QuotedStr(meDNIsol.Text)+', '+QuotedStr(mevinparentesco.Text)+','+QuotedStr(xforsolben)+','+QuotedStr(xtipret)+', '+QuotedStr('S')+', '+QuotedStr(DM1.wofides)+', ' + QuotedStr(dbltipbenef.Text) + ', ' + QuotedStr(CboCausaCese.FG_OBTENER_CODIGO_CODCAUCES)
      +','+QuotedStr(DM1.wUsuario)+', '+QuotedStr(meapenomsol.Text)+', '+QuotedStr(meDNIsol.Text)+', '+QuotedStr(mevinparentesco.Text)+','+QuotedStr(xforsolben)+','+QuotedStr(xtipret)+', '+QuotedStr('S')+', '+QuotedStr(DM1.wofides)+', ' + QuotedStr(dbltipbenef.Text) + ', ' + QuotedStr(xCodCauCes)
      // +','+QuotedStr(dblcdptoid.Text)+', '+QuotedStr(dblccodofi.Text)+', '+QuotedStr(DBDTPfecrecexp.Text)+ ',' + QuotedStr(xsCODCAREXP) + ')';
      +','+QuotedStr(dblcdptoid.Text)+', '+QuotedStr(dblccodofi.Text)+', '+QuotedStr(DBDTPfecrecexp.Text)+ ',' + QuotedStr(xsCODCAREXP)
      +', '+QuotedStr(metelsol.Text)+', '+QuotedStr(medirsol.Text)+ ',' + QuotedStr(meemailsol.Text)+', '+QuotedStr(dblcddistritosol.Text)+')';
      // Fin: HPC_201809_PRE
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      // Insertando Resolución de nombramiento si es que se modifico
      If (DM1.cdsAsociado.FieldByName('ASORESNOM').AsString <> menumresnom.text) Or (DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString  <> mefecresnom.Text)  Then
      Begin
        xSql := 'UPDATE APO205 SET RESFVIG = ''N'' WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND RESID = ''01'' ';
        xSql := 'INSERT INTO APO205 (ASOID, ASOCODMOD, ASOCODAUX, ASONRES, ASOFRES, RESID, RESFVIG, USUARIO, FREG, HREG)'
        +' VALUES ('+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+','+QuotedStr(DM1.cdsAsociado.FieldByName('ASOCODMOD').AsString)
        +','+QuotedStr(DM1.cdsAsociado.FieldByName('ASOCODAUX').AsString)+','+QuotedStr(menumresnom.Text)+','+QuotedStr(mefecresnom.Text)+', ''01'', ''S'', '
        +QuotedStr(DM1.wUsuario)+','+'TO_CHAR(SYSDATE, ''DD/MM/YYYY''), SYSDATE )';
        DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      End;
      // Insertando Resolución de Cese si es que se modifico
      If (DM1.cdsAsociado.FieldByName('ASORESCESE').AsString <> menumresces.text) Or (DM1.cdsAsociado.FieldByName('ASOFRESCESE').AsString <> dbdtpfecces.text) Then
      Begin
        xSql := 'UPDATE APO205 SET RESFVIG = ''N'' WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND RESID = ''04'' ';
        xSql := 'INSERT INTO APO205 (ASOID, ASOCODMOD, ASOCODAUX, ASONRES, ASOFRES, RESID, RESFVIG, USUARIO, FREG, HREG)'
        +' VALUES ('+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+','+QuotedStr(DM1.cdsAsociado.FieldByName('ASOCODMOD').AsString)
        +','+QuotedStr(DM1.cdsAsociado.FieldByName('ASOCODAUX').AsString)+','+QuotedStr(menumresces.Text)+','+QuotedStr(dbdtpfecces.text)+', ''04'', ''S'', '
        +QuotedStr(DM1.wUsuario)+','+'TO_CHAR(SYSDATE, ''DD/MM/YYYY''), SYSDATE )';
        DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      End;
      xReg :=  DM1.CodReg;
      DM1.Registro_Aud(DM1.cdsAsociado.FieldByName('ASOID').AsString,'0', xReg);
      xSql := 'UPDATE APO201 '
            + '   SET ASORESNOM   = '+QuotedStr(menumresnom.Text)+','
            + '       ASOFRESNOM  = '+QuotedStr(mefecresnom.Text)+','
            + '       ASORESCESE  = '+QuotedStr(menumresces.Text)+','
            + '       ASOFRESCESE = '+QuotedStr(dbdtpfecces.text);
      // Si el tipo de beneficio es 02 = FALLECIMIENTO se marca el campo FALLECIDO en el APO201 con "S"
      If dbltipbenef.Text = '02' Then
         xSql := xSql + ', FALLECIDO = ''S'', TIPO_FALL_ID = ''X LIQ.FALL''';
      xSql := xSql + ' WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString);
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      DM1.Registro_Aud(DM1.cdsAsociado.FieldByName('ASOID').AsString,'1', xReg);
      xAsoid := DM1.cdsAsociado.FieldByName('ASOID').AsString;
      //Inicio: SPP_201401_PRE
      // REGISTRADO
      xSql := 'Begin SP_PVS_SEG_EXP('+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+', '+QuotedStr(DM1.numeroexpediente)
      +', ''01'', ''01'', TO_DATE(SYSDATE,''DD/MM/YYYY''), '+QuotedStr(DM1.wUsuario)+', NULL); End;';
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      // VERIFICADO
      xSql := 'Begin SP_PVS_SEG_EXP('+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+', '+QuotedStr(DM1.numeroexpediente)
      +', ''02'', ''01'', TO_DATE(SYSDATE,''DD/MM/YYYY''), '+QuotedStr(DM1.wUsuario)+', NULL); End;';
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      //Fin: SPP_201401_PRE
      If Not DM1.inserta_aso_resolucion(xAsoid) Then
         MessageDlg('El expediente fue registrado con errores en la tabla de resoluciones', mtInformation, [mbOk], 0)
      Else
        // Inicio: HPC_201809_PRE
        // Se añade variable para controlar los cambios
        DM1.xCnd := 'I';
        // Fin: HPC_201809_PRE
        MessageDlg('Grabación Ok', mtInformation, [mbOk], 0);
      // Inicio: HPC_201809_PRE
      // Se modifica el procedimiento registra suceso
      // INICIO HPC_201509_PRE
      // DM1.registrasuceso(xAsoid, dbltipbenef.Text, CboCausaCese.cbListaDatos.Text, dbdtpfacinv.Text);
      DM1.registrasuceso(xAsoid, dbltipbenef.Text, mebuscacausa.Text, dbdtpfacinv.Text);
      // FIN HPC_201509_PRE
      // Fin: HPC_201809_PRE
      xSql := 'SELECT * FROM PVS301 WHERE ASOID = '+QuotedStr(xAsoid)+' AND PVSEXPNRO = '+QuotedStr(DM1.numeroexpediente);
      DM1.cdsExpLiq.Close;
      DM1.cdsExpLiq.DataRequest(xSql);
      DM1.cdsExpLiq.Open;
      xSql := 'SELECT * FROM APO201 WHERE ASOID = '+QuotedStr(xAsoid);
      DM1.cdsAsociado.Close;
      DM1.cdsAsociado.DataRequest(xSql);
      DM1.cdsAsociado.Open;
      btncerrar.OnClick(btncerrar);
    End;
  End;
End;

Function TFNueExpben.chksolicitud: Boolean;
Var xSql, xvalren, xasoid:String;
Begin
   If Trim(DBDTPfecrecexp.Text) = '' Then
   Begin
      MessageDlg('Debe ingresar fecha de recepción del expediente.', mtInformation, [mbOk], 0);
      Result := False;
      Exit;
   End;
  If rgforsolben.ItemIndex = -1 Then
  Begin
    MessageDlg('Seleccione el tipo de origen de la solicitud', mtInformation, [mbOk], 0);
    Result := False;
    Exit;
  End;
  If DM1.cdsincompletos.RecordCount > 0 Then
  Begin
    MessageDlg('Existen datos por actualizar, pase por el modulo de asociados', mtInformation, [mbOk], 0);
    Result := False;
    Exit;
  End;

  xasoid := DM1.cdsAsociado.FieldByName('ASOID').AsString;
  xvalren := 'N';
  // Validando datos de RECNIEC
  // Validando DNI
  xSql := 'SELECT A.FECCAD FROM VAL_DAT_ASO A, CAMPOS_VALIDA B WHERE A.ASOID = '+QuotedStr(xasoid)
  +' AND A.CAMPO = ''ASODNI'' AND NVL(A.STATUS,''X'') = ''S'' AND (A.CAMPO = B.CAMPO AND NVL(B.VALPER, ''X'') <> ''S'' AND A.FECCAD < SYSDATE)';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  If DM1.cdsQry.RecordCount = 0 Then   xvalren := 'S';
  // Validando Apelido Paterno
  xSql := 'SELECT A.FECCAD FROM VAL_DAT_ASO A, CAMPOS_VALIDA B WHERE A.ASOID = '+QuotedStr(xasoid)
  +' AND A.CAMPO = ''ASOAPEPATDNI'' AND NVL(A.STATUS,''X'') = ''S'' AND (A.CAMPO = B.CAMPO AND NVL(B.VALPER, ''X'') <> ''S'' AND A.FECCAD < SYSDATE)';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  If DM1.cdsQry.RecordCount = 0 Then   xvalren := 'S';
  // Validando Apelido Materno
  xSql := 'SELECT A.FECCAD FROM VAL_DAT_ASO A, CAMPOS_VALIDA B WHERE A.ASOID = '+QuotedStr(xasoid)
  +' AND A.CAMPO = ''ASOAPEMATDNI'' AND NVL(A.STATUS,''X'') = ''S'' AND (A.CAMPO = B.CAMPO AND NVL(B.VALPER, ''X'') <> ''S'' AND A.FECCAD < SYSDATE)';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  If DM1.cdsQry.RecordCount = 0 Then   xvalren := 'S';
  // Validando Nombres
  xSql := 'SELECT A.FECCAD FROM VAL_DAT_ASO A, CAMPOS_VALIDA B WHERE A.ASOID = '+QuotedStr(xasoid)
  +' AND A.CAMPO = ''ASONOMDNI'' AND NVL(A.STATUS,''X'') = ''S'' AND (A.CAMPO = B.CAMPO AND NVL(B.VALPER, ''X'') <> ''S'' AND A.FECCAD < SYSDATE)';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  If DM1.cdsQry.RecordCount = 0 Then   xvalren := 'S';
  // Validando Sexo
  xSql := 'SELECT A.FECCAD FROM VAL_DAT_ASO A, CAMPOS_VALIDA B WHERE A.ASOID = '+QuotedStr(xasoid)
  +' AND A.CAMPO = ''ASOSEXO'' AND NVL(A.STATUS,''X'') = ''S'' AND (A.CAMPO = B.CAMPO AND NVL(B.VALPER, ''X'') <> ''S'' AND A.FECCAD < SYSDATE)';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  If DM1.cdsQry.RecordCount = 0 Then xvalren := 'S';
  // Validando Fecha de Nacimiento
  xSql := 'SELECT A.FECCAD FROM VAL_DAT_ASO A, CAMPOS_VALIDA B WHERE A.ASOID = '+QuotedStr(xasoid)
  +' AND A.CAMPO = ''ASOFECNAC'' AND NVL(A.STATUS,''X'') = ''S'' AND (A.CAMPO = B.CAMPO AND NVL(B.VALPER, ''X'') <> ''S'' AND A.FECCAD < SYSDATE)';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  If DM1.cdsQry.RecordCount = 0 Then xvalren := 'S';
  If xvalren = 'N' Then
  Begin
    MessageDlg('Los datos capturados de RENIEC ya caducaron', mtInformation, [mbOk], 0);
    Result := False;
    Exit;
  End;
  //Primeros datos de la liquidación
  // Ubigeo del asociado
  If DM1.cdsAsociado.FieldByName('ZIPID').AsString = '' Then
  Begin
    MessageDlg('Ingrese el ubigeo del asociado', mtInformation, [mbOk], 0);
    Result := False;
    Exit;
  End;
  // regimen de pensión
  If DM1.cdsAsociado.FieldByName('REGPENID').AsString = '' Then
  Begin
    // INICIO: HPC_201704_PRE
    // Se añade tilde a la palabra "regimen"
    //MessageDlg('Registre el tipo de regimen de pensión', mtInformation, [mbOk], 0);
    MessageDlg('Registre el tipo de régimen de pensión', mtInformation, [mbOk], 0);
    // FIN: HPC_201704_PRE

    dbltipbenef.SetFocus;
    Result := False;
    Exit;
  End;
  // Tipo de beneficio
  If dbltipbenef.Text = '' Then
  Begin
    MessageDlg('Ingrese el tipo de beneficio', mtInformation, [mbOk], 0);
    dbltipbenef.SetFocus;
    Result := False;
    Exit;
  End;
  // Inicio: HPC_201605_PRE --Se retira
  //Departamento de origen del expediente
  // If dblcdistid.Text = ''  Then
  If dblcdptoid.Text = ''  Then
  Begin
    //  MessageDlg('Ingrese el origen del expediente', mtInformation, [mbOk], 0);
    MessageDlg('Debe ingresar el departamento de origen del expediente', mtInformation, [mbOk], 0);
    dblcdptoid.SetFocus;
    Result := False;
    Exit;
  End;
  // Oficina del departamento de origen del expediente
  If dblccodofi.Text = ''  Then
  Begin
    MessageDlg('Debe ingresar la oficina del departamento de origen del expediente.', mtInformation, [mbOk], 0);
    dblccodofi.SetFocus;
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
  //Resoluciones del asociado
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
  // Verificando fecha de nombramiento para el caso de reingresante.
  //Verificando si cobra el asociado
  // Inicio: HPC_201802_PRE
  // Se valida forma de pago solo si la forma de pago es por solicitud del beneficiario  
  If rgforsolben.ItemIndex = 0 Then
  Begin
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
         meagengir.Text  := '';
         measoncta.Text  := '';
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
           measoncta.Text  := '';
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
         meagengir.Text  := '';
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
         meagengir.Text  := '';
         measoncta.Text  := '';
       End;
     End;
  End;
// Fin: HPC_201802_PRE
  // Revisando ultimos aportes
  If Copy(dbdtpfecces.Text,7,4)+Copy(dbdtpfecces.Text,4,2) < '199701' Then
  Begin
    meanoultapo.Text := Copy(dbdtpfecces.Text,7,4);
    memesultapo.Text := Copy(dbdtpfecces.Text,4,2);
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
    If StrToInt(meanoultapo.Text) >  StrToInt(Copy(DateToStr(Date),7,4)) Then
    Begin
      MessageDlg('Existe una inconsistencia en el año del ultimo aporte.'+#13+'Año del ultimo aporte mayor al año actual', mtInformation, [mbOk], 0);
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

procedure TFNueExpben.btncerrarClick(Sender: TObject);
begin
FNueExpben.Close;
end;

procedure TFNueExpben.btncreditosClick(Sender: TObject);
var xSql:String;
begin

  xSql := 'SELECT * FROM CRE301 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)
  +' AND CREESTID = ''02'' ORDER BY CREFOTORG';
  DM1.cdsCreditos.Close;
  DM1.cdsCreditos.DataRequest(xSql);
  DM1.cdsCreditos.Open;
  Try
     fMstCre := TfMstCre.create(Self);
     fMstCre.ShowModal;
  Finally
     fMstCre.Free;
  end;
end;

Procedure TFNueExpben.btnaportesClick(Sender: TObject);
Begin
  DM1.asoresnom   := menumresnom.Text;
  DM1.asorescese  := menumresces.Text;
  DM1.asofresnom  := mefecresnom.Text;
  DM1.asofrescese := dbdtpfecces.Text;
  DM1.tipben      := dbltipbenef.Text;
  If DM1.asofrescese = '' Then DM1.asofrescese := DateToStr(DM1.FechaSys);
  If DM1.asofresnom = '' Then
  Begin
    MessageDlg('Ingrese fecha de resolución de nombramiento para esa opción', mtInformation, [mbOk], 0);
    Exit;
  End;
  If DM1.asofrescese = '' Then
  Begin
    MessageDlg('Ingrese fecha de resolución de cese para esa opción', mtInformation, [mbOk], 0);
    Exit;
  End;
  If Copy(DM1.asofrescese,7,4)+Copy(DM1.asofrescese,4,2) < '199912' Then
  Begin
    If DM1.tipben = '' Then
    Begin
      MessageDlg('Ingrese el tipo de beneficio para procesar esta opción', mtInformation, [mbOk], 0);
      Exit;
    End;
  End;
  If (DM1.tipben = '03') And (Copy(DM1.asofrescese,7,4) < '1997') And (DM1.cdsAsociado.FieldByName('ASOFECNAC').AsString = '') Then
  Begin
    MessageDlg('Ingrese la fecha de nacimiento del asociado para procesar esta opción', mtInformation, [mbOk], 0);
    Exit;
  End;
  DM1.xpvslbennr := '';

  // Inicio: HPC_201704_PRE
  // Se retira forma "fmstapo", se añade forma "Fnuerepcueind"
  Try
     Fnuerepcueind := TFnuerepcueind.create(Self);
     Fnuerepcueind.ShowModal;
   Finally
      Fnuerepcueind.Free;
   End;
  // Try
  //   fmstapo := Tfmstapo.create(Self);
  //   fmstapo.ShowModal;
  // Finally
  //   fmstapo.Free;
  // End;
  // Fin: HPC_201704_PRE

End;

procedure TFNueExpben.dbdtpfeccesExit(Sender: TObject);
begin
 If (date <= dbdtpfecces.Date) Then
 Begin
   MessageDlg('Fecha de cese es menor o igual a la fecha actual', mtInformation, [mbOk], 0);
   dbdtpfecces.Text := '';
   dbdtpfecces.SetFocus;
   Exit;
 End;
 btngrasol.SetFocus;
end;

procedure TFNueExpben.dblcagegirChange(Sender: TObject);
begin
  If Trim(dblcagegir.Text) = '' Then
  Begin
    meagengir.Text := '';
    dblcagegir.Text := '';
  End;
  If Length(dblcagegir.Text) = 8 then
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
end;
// Inicio: HPC_201605_PRE --Se retira
// procedure TFNueExpben.dblccodofiChange(Sender: TObject);
// Var xSql:String;
// begin
//    If dblcprovid.Text = '' Then
//    Begin
//       meprovdes.Text := '';
//       dblcdistid.Text := '';
//       medistdes.Text := '';
//       xSql := 'SELECT ZIPID, ZIPDES FROM APO122 WHERE ZIPID = ''''';
//       DM1.cdsDist.Close;
//       DM1.cdsDist.DataRequest(xSql);
//      DM1.cdsDist.Open;
//    End;
//    If Length(dblcprovid.Text) = 4 then
//    Begin
//       If DM1.cdsProvincia.Locate('CIUDID', dblcprovid.Text , []) Then
//       Begin
//          meprovdes.Text := DM1.cdsProvincia.FieldByName('CIUDDES').AsString;
//          xSql := 'SELECT ZIPID, ZIPDES FROM APO122 WHERE CIUDID = '+QuotedStr(dblcprovid.Text)+' ORDER BY ZIPID';
//          DM1.cdsDist.Close;
//          DM1.cdsDist.DataRequest(xSql);
//          DM1.cdsDist.Open;
//          dblcdistid.Selected.Clear;
//          dblcdistid.Selected.Add('ZIPID'#9'6'#9'Código'#9#9);
//          dblcdistid.Selected.Add('ZIPDES'#9'25'#9'Distrito'#9#9);
//       End
//       Else
//       Begin
//          MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
//          dblcprovid.Text := '';
//          meprovdes.Text := '';
//          dblcdistid.Text := '';
//          medistdes.Text := '';
//          Exit;
//       End;
//    End;
// end;

// procedure TFNueExpben.dblcdistidChange(Sender: TObject);
// begin
//    If dblcdistid.Text = '' Then
//    Begin
//       medistdes.Text := '';
//    End;
//    If Length(dblcdistid.Text) = 6 then
//    Begin
//       If DM1.cdsDist.Locate('ZIPID', dblcdistid.Text , []) Then
//       Begin
//          medistdes.Text := DM1.cdsDist.FieldByName('ZIPDES').AsString;
//       End
//       Else
//       Begin
//          MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
//          dblcdistid.Text := '';
//          medistdes.Text := '';
//          Exit;
//       End;
//    End;
// end;

// procedure TFNueExpben.dblcReporiChange(Sender: TObject);
// begin
//    If Length(dblcRepori.Text) = 5 then
//    Begin
//       If DM1.cdsRepresentante.Locate('REPRID', dblcRepori.Text, []) Then
//       Begin
//          merepder.Text := DM1.cdsRepresentante.FieldByname('REPRAPENOM').AsString;
//          meubigeorep.Text := DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', DM1.cdsRepresentante.FieldByName('ZIPID').AsString)+'/'
//          +DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', Copy(DM1.cdsRepresentante.FieldByName('ZIPID').AsString,1,4))+'/'+DM1.DevuelveValor('APO158', 'DPTODES', 'DPTOID', Copy(DM1.cdsRepresentante.FieldByName('ZIPID').AsString,1,2));
//       End
//       Else
//       Begin
//          MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
//          dblcRepori.Text := '';
//          merepder.Text := '';
//       End;
//    End;
// end;

// procedure TFNueExpben.dblcReporiExit(Sender: TObject);
// Var xSql:String;
// begin
//    If Trim(dblcRepori.Text) <> '' Then
//    Begin
//       xSql := 'SELECT * FROM COB201 WHERE REPRID = '+QuotedStr(dblcRepori.Text);
//       If DM1.verificaexiste(xSql) = False Then
//       Begin
//          MessageDlg('Código de representante no valida', mtInformation, [mbOk], 0);
//          dblcRepori.Text := '';
//          dblcRepori.SetFocus;
//          Exit;
//       End;
//    End;
//    dbltipbenef.SetFocus;
// end;

// procedure TFNueExpben.dblcdistidExit(Sender: TObject);
// Var xSql:String;
// begin
//    If Trim(dblcdistid.Text) <> '' Then
//    Begin
//       xSql := 'SELECT * FROM APO122 WHERE ZIPID = '+QuotedStr(dblcdistid.Text);
//      If DM1.verificaexiste(xSql) = False Then
//      Begin
//         MessageDlg('Código de distrito no valida', mtInformation, [mbOk], 0);
//         dblcdistid.Text := '';
//         dblcdistid.SetFocus;
//         Exit;
//      End;
//    End;
//    If (dblcdptoid.Text = '07') Or (dblcdptoid.Text = '15') Then
//    Begin
//       dbltipbenef.SetFocus;
//       dblcRepori.Text := '';
//       meubigeorep.Text := '';
//       merepder.Text := '';
//    End;
//end;

// procedure TFNueExpben.dblcdptoidExit(Sender: TObject);
// Var xSql:String;
// begin
//    If Trim(dblcdptoid.Text) <> '' Then
//    Begin
//       xSql := 'SELECT * FROM TGE158 WHERE DPTOID = '+QuotedStr(dblcdptoid.Text);
//       If DM1.verificaexiste(xSql) = False Then
//       Begin
//          MessageDlg('Código de departamento no valida', mtInformation, [mbOk], 0);
//          dblcdptoid.Text := '';
//          dblcdptoid.SetFocus;
//          Exit;
//       End;
//    End;
//    If dblcdptoid.Text <> '' Then
//    Begin
//       If (dblcdptoid.Text <> '07') And (dblcdptoid.Text <> '15') Then
//       Begin
//          pnlubirep.Visible := True;
//          lbltitrep.Visible := True;
//          dblcRepori.Visible := True;
//          pnlapenomrep.Visible := True;
//          pnlubirep.Visible := True;
//          lblRepresentante.Visible := True;
//       End
//       Else
//       Begin
//          lbltitrep.Visible := False;
//          dblcRepori.Visible := False;
//          pnlapenomrep.Visible := False;
//          pnlubirep.Visible := False;
//          lblRepresentante.Visible := False;
//       End;
//    End;
// End;
// Fin: HPC_201605_PRE

procedure TFNueExpben.FormClose(Sender: TObject; var Action: TCloseAction);
var
   xSQL : String;
begin
  // libera el registro del Asociado en Maestro de Asociados, para que pueda sea actualizado
  if xMarcaPRE then
  begin
// Inicio: SPP_201304_PRE
      xSQL := 'begin '
             +'  SP_ACT_PROC_ACT_MAE('+quotedstr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+','
             + quotedstr('XXX')+', ' + QuotedStr(DM1.wUsuario) + '); '
// Fin: SPP_201304_PRE
             +'end; ';
      DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
      xMarcaPRE := False;
   end;
   DM1.cdsTipBenef.Close;
   Action := caFree;
end;


procedure TFNueExpben.timeralertaTimer(Sender: TObject);
begin
  If pnlalerta.Visible = True Then pnlalerta.Visible := False Else pnlalerta.Visible := true;
end;

Procedure TFNueExpben.dblcforpagExit(Sender: TObject);
Var xSql:String;
Begin
  If DM1.cdsFPago.Locate('TIPDESEID', dblcforpag.Text, []) Then
  Begin
    meforpagodes.Text := DM1.cdsFPago.FieldByName('TIPDESEDES').AsString;
    If DM1.cdsFPago.FieldByName('FLACOBPRE').AsString = 'B' Then
      xSql := 'SELECT BANCOID, BANCONOM FROM TGE105 WHERE FLAVIGPRE = ''S'' AND CLAUXID = ''B'''
    Else
      xSql := 'SELECT BANCOID, BANCONOM FROM TGE105 WHERE FLAVIGPRE = ''S'' AND CLAUXID = ''C''';
    DM1.cdsBanco.Close;
    DM1.cdsBanco.DataRequest(xSql);
    DM1.cdsBanco.Open;
    // Inicio: HPC_201802_PRE
    // Se valida las nuevas formas de pago
    If (dblcforpag.Text = '01') Or (dblcforpag.Text = '11') Or (dblcforpag.Text = '16') Then
    Begin
       lblasoncta.Visible := False;
       pnlasoncta.Visible := False;
       lbldospun04.Visible := False;
       lblagegir.Visible := False;
       lbldospun03.Visible := False;
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
       lbldospun04.Visible := True;
       pnlasoncta.Visible := True;
       measoncta.Text := DM1.cdsAsociado.FieldByName('ASONCTA').AsString;
       lblagegir.Visible := False;
       dblcagegir.Visible := False;
       pnlagegir.Visible := False;
       lbldospun03.Visible := False;
       dblcagegir.Text := '';
    End;
    // Fin: HPC_201802_PRE

    If dblcforpag.Text = '05' Then
    Begin
      dblcBanco.Text := '04';
      dblcagegir.Selected.Clear;
      dblcagegir.Selected.Add('AGENBCOID'#9'8'#9'Código'#9#9);
      dblcagegir.Selected.Add('AGENBCODES'#9'25'#9'Nombre de Agencia'#9#9);
      dblcagegir.Selected.Add('DPTODES'#9'20'#9'Departamento de Agencia'#9#9);
      xSql := 'SELECT A.AGENBCOID, A.AGENBCODES, B.DPTODES FROM COB102 A, APO158 B WHERE A.DPTOID = B.DPTOID(+) AND A.BANCOID = '+QuotedStr(dblcBanco.Text)
      +' ORDER BY DPTODES, AGENBCODES';
      DM1.cdsAgBco.Close;
      DM1.cdsAgBco.DataRequest(xSql);
      DM1.cdsAgBco.Open;
      lblagegir.Visible   := True;
      dblcagegir.Visible  := True;
      pnlagegir.Visible   := True;
      lbldospun03.Visible := True;
      dblcagegir.Text     := '';
      meagengir.Text      := '';
      lblagegir.Left  := 110;
      lblagegir.Top   := 57;
      dblcagegir.Left := 193;
      dblcagegir.Top  := 57;
      pnlagegir.Left  := 274;
      pnlagegir.Top   := 57;
      lblasoncta.Visible := False;
      pnlasoncta.Visible := False;
      meAsoncta.Text := '';
    End;
    If dblcforpag.Text = '06' Then
    Begin
      lblagegir.Visible   := False;
      dblcagegir.Visible  := False;
      pnlagegir.Visible   := False;
      lbldospun03.Visible := False;
      dblcagegir.Text     := '';
      lblasoncta.Visible := True;
      pnlasoncta.Visible := True;
      lbldospun04.Visible := False;
      lblasoncta.Left := 110;
      lblasoncta.Top  := 57;
      pnlasoncta.Left := 274;
      pnlasoncta.Top  := 57;
    End;
  End
  Else
  Begin
    MessageDlg('Forma de pago no válida', mtInformation, [mbOk], 0);
    dblcforpag.Text := '';
    dblcforpag.SetFocus;
    Exit;
  End;
End;

procedure TFNueExpben.dblcBancoExit(Sender: TObject);
Var xSql:String;
begin
  If Trim(dblcBanco.Text) <> '' Then
  Begin
    xSql := 'SELECT * FROM TGE105 WHERE BANCOID = '+QuotedStr(dblcBanco.Text);
    If DM1.verificaexiste(xSql) = False Then
    Begin
      MessageDlg('Código de banco no valido', mtInformation, [mbOk], 0);
      dblcBanco.Text := '';
      dblcBanco.SetFocus;
      Exit;
    End;
  End;
End;

procedure TFNueExpben.dblcagegirExit(Sender: TObject);
Var xSql:String;
begin
  If Trim(dblcagegir.Text) <> '' Then
  Begin
    xSql := 'SELECT * FROM COB102 WHERE AGENBCOID = '+QuotedStr(dblcagegir.Text);
    If DM1.verificaexiste(xSql) = False Then
    Begin
      MessageDlg('Código de agencia no valida', mtInformation, [mbOk], 0);
      dblcagegir.Text := '';
      dblcagegir.SetFocus;
      Exit;
    End;
  End;
End;
// Inicio: HPC_201605_PRE --Se retira
// procedure TFNueExpben.dblccodofiExit(Sender: TObject);
// Var xSql:String;
// begin
//    If Trim(dblcprovid.Text) <> '' Then
//    Begin
//       xSql := 'SELECT * FROM APO123 WHERE CIUDID = '+QuotedStr(dblcprovid.Text);
//       If DM1.verificaexiste(xSql) = False Then
//       Begin
//          MessageDlg('Código de provincia no valida', mtInformation, [mbOk], 0);
//          dblcprovid.Text := '';
//          dblcprovid.SetFocus;
//          Exit;
//       End;
//    End;
// end;
// Fin: HPC_201605_PRE

procedure TFNueExpben.timerobservacionTimer(Sender: TObject);
begin
  If redit.Visible = True Then
    redit.Visible := False
  Else
    redit.Visible := True;
end;

procedure TFNueExpben.btnfotfirClick(Sender: TObject);

begin
   Try
    Fmstfotder := TFmstfotder.create(Self);
    Fmstfotder.ShowModal;
   Finally
    Fmstfotder.Free;
   End;
end;

Procedure TFNueExpben.ImgFotoConfirmeDblClick(Sender: TObject);
Begin
  Try
    fmstdatrec := Tfmstdatrec.create(Self);
    fmstdatrec.ShowModal;
  Finally
    fmstdatrec.Free;
  End;
End;

procedure TFNueExpben.meAsocodmodKeyPress(Sender: TObject; var Key: Char);
var
   xSQL : String;
begin
  If Key = #13 then
  Begin

    If Length(Trim(meAsocodmod.Text))>10 Then
    Begin
      // INICIO: HPC_201704_PRE
      // Se añade tilde en la palabra "Codigo"
      // MessageDlg('Codigo Modular No Puede Tener Mas De 10 Caracteres...!', mtError, [mbOk], 0);
      MessageDlg('Código Modular No Puede Tener Mas De 10 Caracteres...!', mtError, [mbOk], 0);
      // FIN: HPC_201704_PRE
      meAsocodmod.Text:='';
      Exit;
    End;
    meAsocodmod.Text:=Format('%.10d',[StrToInt(meAsocodmod.Text)]);
    DM1.cdsAsociado.Close;
    DM1.cdsAsociado.DataRequest('Select * From APO201 Where ASOCODMOD LIKE '+QuotedStr(Trim(meAsocodmod.Text)+'%'));
    DM1.cdsAsociado.Open;
    If DM1.cdsAsociado.RecordCount = 1 Then
    Begin
//Inicio HPC_201809_PRE
//Adiciona nueva variable
       xpuedeingresarmantenimiento:='S';
//Fin HPC_201809_PRE
      // Inicio: HPC_201809_PRE
      // Se modifica procedimiento para borrar fotos del disco duro
      // borrafotos;
      DM1.BorraFotos;
      // Fin: HPC_201809_PRE
      ImgFotoConfirme.Visible := False;
      ImgFirmaConfirme.Visible := False;
      limpia;
      // se controla para que si el Asociado se encuentra en actualización por el módulo de Asociados
      // no pueda ingresar a esta opción, ya que tembién actualiza el Maestro de Asociados
      
      if DM1.IndicaAsociadoEnAct(DM1.cdsAsociado.FieldByName('ASOID').AsString) then
      begin
         ErrorMsg('Módulo de Previsión', 'Existe otra opción que puede estar actualizando datos del Asociado'+chr(13)
                                               +'no se puede ejecutar en simultáneo con esta Opción');
//Inicio HPC_201809_PRE
//Adiciona nueva variable
         xpuedeingresarmantenimiento:='N';
//Final HPC_201809_PRE
         exit;
      end;
      // marca el registro del Asociado en Maestro de Asociados, para que no pueda sea actualizado por otro lado
      xSQL := 'begin '
             +'  SP_ACT_PROC_ACT_MAE('+quotedstr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+','




                                      +quotedstr(DM1.wModulo)+', ' + QuotedStr(DM1.wUsuario) + '); '
   
                                   +'end; ';
      DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
      xMarcaPRE := True;
//Inicio HPC_201809_PRE
//Adiciona nueva variable
      xpuedeingresarmantenimiento:='S';
//Final HPC_201809_PRE
      llena;
      // Inicio: SPP_201304_PRE Controla que se haya seleccionado un docente
      If DM1.cdsAsociado.FieldByName('AUTDESAPO').AsString <> 'S' Then
         If meAsocodmod.Text <> '' Then mueautdesapo;
      // Fin: SPP_201304_PRE
      pgmulti.TabIndex := 0;
      pgmulti.SetFocus;
    End
    Else
    Begin
      If DM1.cdsAsociado.RecordCount > 1 Then
      Begin
        // Inicio: HPC_201809_PRE
        // Se modifica procedimiento para borrar fotos del disco duro
        // borrafotos;
        DM1.BorraFotos;
        // Fin: HPC_201809_PRE
        ImgFotoConfirme.Visible := False;
        ImgFirmaConfirme.Visible := False;
        limpia;
        FBusAso := TFBusAso.create(self);
        FBusAso.mebuscar.Text := meAsocodmod.Text;
        FBusAso.Showmodal;
        FBusAso.free;
        // se controla para que si el Asociado se encuentra en actualización por el módulo de Asociados
        // no pueda ingresar a esta opción, ya que tembién actualiza el Maestro de Asociados
        
        if DM1.IndicaAsociadoEnAct(DM1.cdsAsociado.FieldByName('ASOID').AsString) then
        begin
            ErrorMsg('Módulo de Previsión', 'Existe otra opción que puede estar actualizando datos del Asociado'+chr(13)
                                                  +'no se puede ejecutar en simultáneo con esta Opción');
//Inicio HPC_201809_PRE
//Se adiciona variable
            xpuedeingresarmantenimiento:='N';
//Final HPC_201809_PRE
            exit;
        end;
        // marca el registro del Asociado en Maestro de Asociados, para que no pueda sea actualizado por otro lado
        
        xSQL := 'begin '
                +'  SP_ACT_PROC_ACT_MAE('+quotedstr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+','
                                         



                                         +quotedstr(DM1.wModulo)+', ' + QuotedStr(DM1.wUsuario) + '); '

                                         +'end; ';
         DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
//Inicio HPC_201809_PRE
//Se adiciona variable
         xpuedeingresarmantenimiento:='S';
//Final HPC_201809_PRE
         xMarcaPRE := True;
        llena;
        // Inicio: SPP_201304_PRE Controla que se haya seleccionado un docente
        If DM1.cdsAsociado.FieldByName('AUTDESAPO').AsString <> 'S' Then
           If meAsocodmod.Text <> '' Then mueautdesapo;
        // Fin: SPP_201304_PRE
      End
      Else
      Begin
       // Inicio: HPC_201809_PRE
       // Se modifica procedimiento para borrar fotos del disco duro
       // borrafotos;
       DM1.BorraFotos;
       // Fin: HPC_201809_PRE
       ImgFotoConfirme.Visible := False;
       ImgFirmaConfirme.Visible := False;
       limpia;
       // INICIO: HPC_201704_PRE
       // Se añade tilde en la palabra "Codigo"
       // MessageDlg('Codigo Modular No Existe...!', mtError, [mbOk], 0);
       MessageDlg('Código Modular No Existe...!', mtError, [mbOk], 0);
//Inicio HPC_201809_PRE
//Se adiciona variable
       xpuedeingresarmantenimiento:='N';
//Final HPC_201809_PRE
       // FIN: HPC_201704_PRE

       meAsocodmod.SetFocus;
      End;
    End;
  // libera el registro del Asociado en Maestro de Asociados, para que pueda sea actualizado
      if xMarcaPRE then
      begin
         xSQL := 'begin '
                +'  SP_ACT_PROC_ACT_MAE('+quotedstr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+','
                                         +quotedstr('XXX')+', ' + QuotedStr(DM1.wUsuario) + '); '
                +'end; ';
         DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
      end;
  End;
end;

// Inicio: HPC_201809_PRE
// Se retira procedimiento para borrar fotos del disco duro, se pasa al Data modulo 
// procedure TFNueExpben.borrafotos;
// Var search: TSearchRec;
//     nFiles: integer;
// begin
//   nFiles:=FindFirst('C:\SOLEXES\*.JPG', faAnyFile,  search );
//   while nFiles=0 do
//   begin
//     SysUtils.DeleteFile('C:\SOLEXES\'+ Search.Name);
//     nFiles:=FindNext( Search );
//   end;
//   FindClose(Search);
// end;
// Fin: HPC_201809_PRE


procedure TFNueExpben.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  begin
    Key := #0;
    Perform(CM_DIALOGKEY, VK_TAB, 0);
  end;
end;

procedure TFNueExpben.meAsocodmodChange(Sender: TObject);
begin
 If Trim(meAsocodmod.Text) = '' Then
 Begin
   // DM1.xSgr := 'S';
   // Inicio: HPC_201809_PRE
   // Se modifica procedimiento borrafotos para que lea del data modulo
   // borrafotos;
   DM1.BorraFotos;
   // Fin: HPC_201809_PRE

   ImgFotoConfirme.Visible := False;
   ImgFirmaConfirme.Visible := False;
   limpia;
 End;
end;

// Inicio: SPP_201304_PRE - Procedimiento que controla el mensaje de autorización de descuento de aportes
procedure TFNueExpben.mueautdesapo;
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

// Inicio: SPP_201304_PRE - Procedimiento que muestra hoja de datos de reniec del asociado
procedure TFNueExpben.gbfotoreniecClick(Sender: TObject);
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
end;
// Fin: SPP_201304_PRE

// Inicio: SPP_201304_PRE - Procedimiento que invoca al procedimiento de mueautdesapo
procedure TFNueExpben.btnDesApoClick(Sender: TObject);
begin
   mueautdesapo;
end;
// Fin: SPP_201304_PRE

// Inicio: SPP_201304_PRE - Procedimiento que invoca al formulario de fondo solidario de contingencia
Procedure TFNueExpben.btnfonsolClick(Sender: TObject);
Var
   xSql: String;
Begin
   xSql := 'SELECT A.ASOID,A.NUM_DEU,A.NRO_REF_FSC,A.FEC_REF_FSC,B.FORPAGODES,A.FEC_APL_FSC,A.IMP_APL_FSC,C.ESTDES,'
   +' A.USU_APL_FSC,A.IMP_COB_FSC,A.ULT_FEC_COB,A.IMP_SAL_FSC,FORPAGID,A.ID_EST_FSC,A.OBS_FSC,A.FREG_ANULA,A.USER_ANULA,OBS_ANULA, A.OFI_CREACION'
   +' FROM COB_FSC_DEUDA_FSC_CAB A,COB101 B, CRE113 C'
   +' WHERE A.ASOID = '+QuotedStr(DM1.cdsAsociado.Fieldbyname('ASOID').AsString)
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
// Fin: SPP_201304_PRE

// Inicio: HPC_201605_PRE --Expediente de beneficio
procedure TFNueExpben.dblccodofiChange(Sender: TObject);
Var xSql:String;
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

procedure TFNueExpben.DBDTPfecrecexpExit(Sender: TObject);
begin
   If DBDTPfecrecexp.Date > DM1.FechaSys Then
   Begin
      MessageDlg('Fecha de recepción no puede ser mayor al día de hoy.', mtInformation, [mbOk], 0);
      DBDTPfecrecexp.Text := '';
      DBDTPfecrecexp.SetFocus;
   End;
end;
// Fin: HPC_201605_PRE


// Inicio HPC_201707_PRE : Validar la Fecha de la Hoja de Cargo
procedure TFNueExpben.btnFecCargoClick(Sender: TObject);
begin
   if meAsocodmod.Text<>'' then
   begin
      FFecCargo := TFFecCargo.Create(self);
      FFecCargo.dFechaExp := DBDTPfecrecexp.Date;
      FFecCargo.sExpedienteBen:='';
      FFecCargo.Flag_Anular:='S';
      FFecCargo.ShowModal;
      FFecCargo.Free;
      // Inicio: HPC_201809_PRE
      // Se añade procedimiento para actualizar datos del origen del expediente 
      actoriexp;
      // Inicio: HPC_201809_PRE
   end;
end;
// Fin   HPC_201707_PRE : Validar la Fecha de la Hoja de Cargo

// Inicio: HPC_201802_PRE
// Valida la forma de pago
procedure TFNueExpben.rgforsolbenClick(Sender: TObject);
begin
   dblcforpag.Text := '';
   dblcBanco.Text := '';
   dblcagegir.Text := '';
   meAsoncta.Text := '';
   If rgforsolben.ItemIndex = 0 Then
   Begin
      rgCobAso.ItemIndex := 0;
      rgCobAso.Visible := True;
      rgCobAso.Enabled := True;
      gbforpag.Visible := True;
   End
   Else
   Begin
      rgCobAso.ItemIndex := -1;
      rgCobAso.Enabled := False;
      rgCobAso.Visible := False;
      gbforpag.Visible := False;
   End;
end;
// Fin: HPC_201802_PRE

// Inicio: HPC_201809_PRE
// Nuevos procedimientos para controlar datos del solicitante,
// El departamento y origen de oficina
procedure TFNueExpben.meDNIsolExit(Sender: TObject);
begin
   If Trim(meDNIsol.Text) = '' Then Exit;
   meDNIsol.Text :=  DM1.FormatoEntero(meDNIsol.Text);
   If ((Trim(meDNIsol.Text) = '') Or  (Length(Trim(meDNIsol.Text)) <> 8)) Then
   Begin
      MessageDlg('Debe registrar un número de DNI valido', mtError, [mbAbort], 0);
      meDNIsol.SetFocus;
      Exit;
   End;
end;

procedure TFNueExpben.meemailsolExit(Sender: TObject);
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

procedure TFNueExpben.dblcddptoidsolChange(Sender: TObject);
begin
   medptosol.Text         := '';
   dblcdProvinciasol.Text := '';
   meprovinciasol.Text    := '';
   dblcddistritosol.Text  := '';
   medistritosol.Text     := '';
end;

procedure TFNueExpben.dblcddptoidsolExit(Sender: TObject);
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
      medptodes.Text      := '';
      dblcdProvinciasol.Text := '';
      meprovinciasol.Text := '';
      dblcddistritosol.Text  := '';
      medistritosol.Text  := '';
      dblcdProvinciasol.Enabled := False;
      dblcddistritosol.Enabled  := False;
      MessageDlg('Código errado', mtError, [mbOk], 0);
      dblcddptoidsol.SetFocus;
   End;
end;

procedure TFNueExpben.dblcdProvinciasolExit(Sender: TObject);
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

procedure TFNueExpben.dblcddistritosolExit(Sender: TObject);
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

procedure TFNueExpben.dblcdProvinciasolChange(Sender: TObject);
begin
  meprovinciasol.Text   := '';
  dblcddistritosol.Text := '';
  medistritosol.Text    := '';
end;

procedure TFNueExpben.btnbuscacausaClick(Sender: TObject);
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
      FCboCausaCese.Top  := FNueExpben.Top+133;
      FCboCausaCese.Left := FNueExpben.Left+375;
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

procedure TFNueExpben.mebuscacausaExit(Sender: TObject);
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

procedure TFNueExpben.dblcddistritosolChange(Sender: TObject);
begin
   medistritosol.Text := '';
end;

procedure TFNueExpben.actoriexp;
Var xSql:String;
begin
   If DM1.cdsAsociado.Active = True Then
   Begin
      xSql := 'SELECT C.DPTOID, C.DPTODES, B.OFDESID, B.OFDESNOM FROM PRE_CARGO_EXPEDIENTE_MOV A, APO110 B, APO158 C'
      +' WHERE A.ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString) +' AND A.CODCAREXPEST <> ''ANULADA'' AND A.OFDESID = B.OFDESID AND B.DPTOID = C.DPTOID';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      If Length(trim(dblcdptoid.Text))=0 Then
      begin
         xDpto:=DM1.cdsQry.FieldByName('DPTOID').AsString;
         xOfici:=DM1.cdsQry.FieldByName('OFDESID').AsString;
       end
      Else
      begin
         xDpto :=dblcdptoid.Text;
         xOfici:=dblccodofi.Text;
      end;
      dblcdptoid.Text := xDpto;
      dblccodofi.Text := xOfici;
    End;
end;


procedure TFNueExpben.BitBtn1Click(Sender: TObject);
VAR DATOS  : sTRING ;
   SEInfo  : TShellExecuteInfo;
   ExitCode: DWORD;
   ExecuteFile, ParamString, StartInString: string;
begin
   Try
      If (Length(Trim(DM1.cdsAsociado.FieldByName('ASOID').AsString))=0) or
         (xpuedeingresarmantenimiento='N') or (Length(trim(meAsocodmod.Text))=0) Then
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
   FNueExpben.Enabled := False;
   
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
     FNueExpben.Enabled := True;
     actualiza;
     dblcdptoid.Text := xDpto;
     dblccodofi.Text := xOfici;
 end;
end;
end;

procedure TFNueExpben.actualiza;
var xsql,xsql2:String;
begin
    If Length(Trim(meAsocodmod.Text))>10 Then
    Begin
      MessageDlg('Código Modular No Puede Tener Mas De 10 Caracteres...!', mtError, [mbOk], 0);
      meAsocodmod.Text:='';
      Exit;
    End;
 xsql2:='Select '
    +'asoid, asocodmod, asocodaux, asocodpago, asoapepat, asoapemat, asonombres, asoapenom, useid, uproid, upagoid, asoresnom, asofresnom,'
    +'resid, regpenid, asositid, asofact, asotipid, viaid, vianombre, asonumdir, asofdpto, asodpto, zonaid, zonanomb, ubigeoid, dptoid,'
    +'paisid, refdom, asofecnac, asotelf1, asotelf2, tipdoccod, asodocnum, asolibmil, asoruc, estcivid, asosexo, asoemail, bancoid, asoncta,'
    +'sitcta, asodni, graacid, grainsid, profid, asofmov, asofluging, asodir, usuario, hreg, freg, asolugest, fecterest, tiempoest, asolnacid,'
    +'asorescese, asofrescese, fgarante, zipid, ciudid, archivoftp, ciaid, flagvar, asoapncre, flgfsol, estclf, observa, usr_crea, fec_crea,'
    +'usr_ben, fec_ben, ctaser, cargo, variascuot, crencuota, nfusion, idimage, fsinliq, asodescol, asodircol, asozipcol, asoapepatdni, asoapematdni,'
    +'asonomdni, asoapenomdni, asodeslab, asodirlab, asodptlabid, asoprvlabid, asodstlabid, asotellab, dptnacid, prvnacid, dstnacid, vialabid,'
    +'zonalabid, fecact, indicador, ccosid, password, codafp, deshabilitado, valida_ci, tcreacion, regverif, codmodant, valcodmoddni, actarcrenant,'
    +'actarcren, reingreso, autdesapo, fecautdesapo, usuregautdesapo, ofiregautdesapo, codmodautdesapo, codarchivo, gencodbar, envautdes, corenvautdes,'
    +'codtiplug, numdirviv, nummanviv, numlotviv, desintviv, desrefviv, codurbviv, desurbviv, numetaviv, desetaviv, numintviv, nomdirviv, anoenv, envio,'
    +'codotrdocide, numotrdocide, codmotdestapo, autdescuo, fecautdescuo, usuregautdescuo, ofiregautdescuo, codmodautdescuo, mdfasodir, mdfzipid, mdfcntreg,'
    +'mdfusrmod, mdffecmod, emicarta, desmanviv, codmotdestcuo, fecactpad, ceneduid, fallecido, tipo_fall_id, en_actualiz, codtiptel1, codreftel1, codtiptel2,'
    +'codreftel2, codpension, fecregautdesapo, codleypen, numautonp, codblocharen, numblocharen, coddepintren, desdepintren, asoapecasdni,'
    +'invalidez, tipo_inva_id, fecautonp, asoaptser, fecactsit, codreglab, usuautonp, oriopeonp, codciutelfij1, codciutelfij2, fecreccadaps,'
    +'usureccadaps, codmotautcadaps, codpre, asocci, latitud_dir, longitud_dir '
    +'From APO201 Where ASOCODMOD LIKE ';
    DM1.cdsAsociado.Close;
    DM1.cdsAsociado.DataRequest(xsql2+QuotedStr(Trim(meAsocodmod.Text)+'%'));
    DM1.cdsAsociado.Open;

    xSql := 'SELECT USENOM FROM APO101 WHERE USEID = '+QuotedStr(DM1.cdsAsociado.FieldByName('USEID').AsString)+' AND UPAGOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString)+' AND UPROID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
    DM1.cdsQry.Close;
    DM1.cdsQry.DataRequest(xSql);
    DM1.cdsQry.Open;
    meUsenom.Text   := DM1.cdsQry.FieldByName('USENOM').AsString;
    meUseid.Text    := DM1.cdsAsociado.FieldByName('USEID').AsString;
    xSql := 'SELECT UPAGONOM FROM APO103 WHERE UPAGOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString)+' AND UPROID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
    DM1.cdsQry.Close;
    DM1.cdsQry.DataRequest(xSql);
    DM1.cdsQry.Open;
    meUpagonom.Text := DM1.cdsQry.FieldByName('UPAGONOM').AsString;
    meUpagoid.Text  := DM1.cdsAsociado.FieldByName('UPAGOID').AsString;
    meUproid.Text   := DM1.cdsAsociado.FieldByName('UPROID').AsString;
    xSql := 'SELECT UPRONOM FROM APO102 WHERE UPROID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
    DM1.cdsQry.Close;
    DM1.cdsQry.DataRequest(xSql);
    DM1.cdsQry.Open;
    meUpronom.Text  := DM1.cdsQry.FieldByName('UPRONOM').AsString;
    meAsodir.Text    := DM1.cdsAsociado.FieldByName('ASODIR').AsString;
    measotelef.Text  := DM1.cdsAsociado.FieldByName('ASOTELF1').AsString;
    meAsodeslab.Text := DM1.cdsAsociado.FieldByName('ASODESLAB').AsString;
    meAsodirlab.Text := DM1.cdsAsociado.FieldByName('ASODIRLAB').AsString;
    meAsozipdes.Text := DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', DM1.cdsAsociado.FieldByName('ZIPID').AsString)+'/'
                      +DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', Copy(DM1.cdsAsociado.FieldByName('ZIPID').AsString,1,4))+'/'
                      +DM1.DevuelveValor('APO158', 'DPTODES', 'DPTOID', Copy(DM1.cdsAsociado.FieldByName('ZIPID').AsString,1,2));
    meAsozipdeslab.Text := DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', DM1.cdsAsociado.FieldByName('ASODSTLABID').AsString)+'/'
                      +DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', Copy(DM1.cdsAsociado.FieldByName('ASODSTLABID').AsString,1,4))+'/'
                      +DM1.DevuelveValor('APO158', 'DPTODES', 'DPTOID', Copy(DM1.cdsAsociado.FieldByName('ASODSTLABID').AsString,1,2));
    menumresnom.Text := DM1.cdsAsociado.FieldByName('ASORESNOM').AsString;
    mefecresnom.Text := DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString;
    meAsoncta.Text := DM1.cdsAsociado.FieldByName('ASONCTA').AsString;
    meregpen.Text := DM1.DevuelveValor('APO105', 'REGPENABR', 'REGPENID', Copy(DM1.cdsAsociado.FieldByName('REGPENID').AsString,1,2));
    If DM1.cdsAsociado.FieldByName('REGPENID').AsString = '03' Then
    Begin
     xSql := 'SELECT SUBSTR(PROV,4,2) CODAFP, PROVDES DESAFP  FROM TGE201 WHERE SUBSTR(PROV,1,1) = ''A'' AND CLAUXID = ''A'' AND SUBSTR(PROV,4,2) = '+QuotedStr(DM1.cdsAsociado.FieldByName('CODAFP').AsString);
     DM1.cdsQry.Close;
     DM1.cdsQry.DataRequest(xSql);
     DM1.cdsQry.Open;
     meregpen.Text := meregpen.Text + ' - ' + DM1.cdsQry.FieldByName('DESAFP').AsString;
    End;
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
    If DM1.cdsAsociado.RecordCount = 1 Then
    Begin
      DM1.BorraFotos;
      ImgFotoConfirme.Visible := False;
      ImgFirmaConfirme.Visible := False;

      xSQL := 'begin '
             +'  SP_ACT_PROC_ACT_MAE('+quotedstr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+','
                                      +quotedstr(DM1.wModulo)+', ' + QuotedStr(DM1.wUsuario) + '); '
                                   +'end; ';
      DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
      xMarcaPRE := True;
      If DM1.cdsAsociado.FieldByName('AUTDESAPO').AsString <> 'S' Then
         If meAsocodmod.Text <> '' Then mueautdesapo;
      pgmulti.TabIndex := 0;
      pgmulti.SetFocus;
    End
    Else
    Begin
      If DM1.cdsAsociado.RecordCount > 1 Then
      Begin
        DM1.BorraFotos;
        ImgFotoConfirme.Visible := False;
        ImgFirmaConfirme.Visible := False;
        FBusAso := TFBusAso.create(self);
        FBusAso.mebuscar.Text := meAsocodmod.Text;
        FBusAso.Showmodal;
        FBusAso.free;
        xSQL := 'begin '
                +'  SP_ACT_PROC_ACT_MAE('+quotedstr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+','
                                         +quotedstr(DM1.wModulo)+', ' + QuotedStr(DM1.wUsuario) + '); '
                                         +'end; ';
         DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
         xMarcaPRE := True;
        llena;
        If DM1.cdsAsociado.FieldByName('AUTDESAPO').AsString <> 'S' Then
           If meAsocodmod.Text <> '' Then mueautdesapo;
      End
      Else
      Begin
       DM1.BorraFotos;
       ImgFotoConfirme.Visible := False;
       ImgFirmaConfirme.Visible := False;
       MessageDlg('Código Modular No Existe...!', mtError, [mbOk], 0);
       meAsocodmod.SetFocus;
      End;
    End;
  // libera el registro del Asociado en Maestro de Asociados, para que pueda sea actualizado
      if xMarcaPRE then
      begin
         xSQL := 'begin '
                +'  SP_ACT_PROC_ACT_MAE('+quotedstr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+','
                                         +quotedstr('XXX')+', ' + QuotedStr(DM1.wUsuario) + '); '
                +'end; ';
         DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
      end;

end;
procedure TFNueExpben.dblcdptoidExit(Sender: TObject);
begin
 xDpto:=dblcdptoid.Text;
 xOfici:=dblccodofi.Text;
end;

procedure TFNueExpben.dblccodofiExit(Sender: TObject);
begin
 xDpto:=dblcdptoid.Text;
 xOfici:=dblccodofi.Text;
end;
// Fin: HPC_201809_PRE


End.
