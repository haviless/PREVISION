// Inicio Uso Estándares: 01/08/2011
// Unidad               : PRE001
// Formulario           : FPrincipal
// Fecha de Creación    : 01/06/2003
// Autor                : Area de desarrollo de sistemas.
// Objetivo             : Menu principal
//
// Actualizaciones      :
// HPC_201305_PRE : Se añaden botones de menu "Resumen por tipo de desembolso" y "Indicadores Previsionales de Calidad"
// SPP_201306_PRE : Se realiza el pase a producción a partir del HPC_201305_PRE
// HPC_201307_PRE : Se añade opción de Liquidaciones por tipo de beneficio.
//                  Se retira la forma FCuentaInd y se hace llamado directo a la forma Fctaindres
// SPP_201401_PRE : Se realiza el pase a producción a partir del pase HPC_201307_PRE
// HPC_201402_PRE : Etiqueta de desarrollo. Se añade opción "Resumen de Liquidaciones con CADAPS" en sub menu reportes y Socket.
// SPP_201403_PRE : Se realiza el pase a producción a partir del pase HPC_201402_PRE
// HPC_201502_PRE : Se modifica cierre de aplicación cuando la versión es incorrecta.
// HPC_201508_PRE : Se añade opción de reporte Asociados aplicadoa al CII
// HPC_201509_PRE : Categorizar Causas de Cese
// HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
// HPC_201610_PRE : CREAR Y MODIFICAR INDICADORES DE CALIDAD
// HPC_201705_PRE : Se añadel el speedbutton "sbextrepdesembolso" y "spdespagypenpag"
// Extornos de formas de pago y reporte de desembolsos pagados y pendientes de pago.
// HPC_201706_PRE : Se pone en invisible el menú "Reportes y Estadisticos" antes de ingresar a la opción.
// HPC_201709_PRE : Se añaden opciones al menu principal "Liquidaciones por causas de cese" y "Hojas de cargo"
// HPC_201801_PRE : Generación de Reporte de Cesantes sin Liquidación
// HPC_201802_PRE : Se añade reporte "Liquidaciones por oficio interno"
// HPC_201804_PRE : Se añade opción del reporte de "Reportes liquidaciones RG"
// HPC_201805_PRE : Se modifica el formulario dfm
// HPC_201808_PRE : Jerarquía del módulo del Control de Ticket
// HPC_201813_PRE : Se modifica rutina de control de acceso al sistema
Unit PRE001;

Interface

Uses
   msgdlgs, Windows, Messages, SysUtils, Classes, fcLabel, StdCtrls,
   Controls, ExtCtrls, Buttons, ComCtrls, ToolWin, Forms, DB, dialogs,
   ppCtrls, wwDBigrd, fcButton, fcImgBtn, fcShapeBtn, Mant,
// Inicio HPC_201808_PRE
// Jerarquía del módulo del Control de Ticket
   ControlGridDisp, Gauges, Graphics, wwdblook;
// Fin HPC_201808_PRE
// Fin: SPP_201403_PRE : Etiqueta de desarrollo




Type
   TFPrincipal = Class(TForm)
      clbPrincipal: TCoolBar;
      tlbPrincipal: TToolBar;
      Z1sbReglas: TSpeedButton;
      Z1sbMovimientos: TSpeedButton;
      // Inicio: HPC_201802_PRE
      // Se retira boton reportes
      // Z1sbReportes: TSpeedButton;
      // Fin: HPC_201802_PRE
      Z1sbSalida: TSpeedButton;
      Z1sbReferencias: TSpeedButton;
      fclCxP: TfcLabel;
      lblVersion: TLabel;
      Z1sbProcesos: TSpeedButton;
      pnlReferencias: TPanel;
      pnlProcesos: TPanel;
      pnlMovimientos: TPanel;
      // Inicio: HPC_201802_PRE
      // Se cambia nombre del panel
      //pnlReportes: TPanel;
      pnlReportes1: TPanel;
      // Fin: HPC_201802_PRE
      Z1sbCamPassw: TSpeedButton;
      fcLabel1: TfcLabel;
      sbmanrec: TSpeedButton;
      sbrepbenatextipapg: TSpeedButton;
      sbLiqBen: TSpeedButton;
      sbExpBen: TSpeedButton;
      sbretjud: TSpeedButton;
      sbnuegenofi: TSpeedButton;
      sbnueconta: TSpeedButton;
      sbcobliq: TSpeedButton;
      sbreliquidaciones: TSpeedButton;
      sbrepxtipben: TSpeedButton;
      sbrepliqxdep: TSpeedButton;
      sbrepnivdevben: TSpeedButton;
      sbrepcuocreben: TSpeedButton;
      sbmancardes: TSpeedButton;
      SpeedButton2: TSpeedButton;
      sbmanlibaho: TSpeedButton;
      MRefe: TMant;
      cgdPrincipal: TControlGridDisp;
      sbmanret: TSpeedButton;
      spdEstBen: TSpeedButton;
      pnlResumen: TPanel;
      sbrepestxsex: TSpeedButton;
      spdCredPend: TSpeedButton;
      spdControl: TSpeedButton;
      spdCueInd: TSpeedButton;
    spbBenAnoOcu: TSpeedButton;
      spliqanu: TSpeedButton;
      sbCuentaInd: TSpeedButton;
      spdcueinddis: TSpeedButton;
      sbMatrizResClick: TSpeedButton;
    spdresliq: TSpeedButton; // SPP_201306_PRE Se modifica el nombre del boton para manejar seguridad
      sbCtaIndLote: TSpeedButton;
      sbReportePostReest: TSpeedButton;
      sbmaninv: TSpeedButton;
      sbmansep: TSpeedButton;
      sbmancapdeu: TSpeedButton;
      sbBenefxDptoUgelTipo: TSpeedButton;
      sbRptCartaDesig: TSpeedButton;
      sbAutxCenEdu: TSpeedButton;
      spdBenCheGer: TSpeedButton;
      //Inicio: HPP_201105_PRE
    sbBenefDetxDptoUgel: TSpeedButton;
      //Inicio: DPP_201202_PRE
      sbHojaTrabajoCampo: TSpeedButton;
// Inicio: SPP_201306_PRE
    sbrepxtipdes: TSpeedButton;
    sbIndGestion: TSpeedButton;
    sbliqxTipBen: TSpeedButton; // SPP_201401_PRE
// Inicio: SPP_201403_PRE    
    Label1: TLabel;
    sbresliqconCADAPS: TSpeedButton;
    Label2: TLabel;
    // Inicio: HPC_201508_PRE
    // Se añade opción de reportes Asociados aplicados CCI
    sbAsoAplCCI: TSpeedButton;
    // Fin: HPC_201508_PRE
    // INICIO HPC_201509_PRE
    btnMantenimientoCausaCese: TSpeedButton;
    // FIN HPC_201509_PRE
// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
    sbContaExtorno: TSpeedButton;
    // Inicio: HPC_201705_PRE
    // Se crean los componentes para las dos nuevas opciones.
    sbextrepdesembolso: TSpeedButton;
    spdespagypenpag: TSpeedButton;
    spdocxedadysexo: TSpeedButton;
    // Inicio: HPC_201709_PRE
    // Se añade boton de los nuevas opciones implementadas
    sprepcausacese: TSpeedButton;
    // Inicio: HPC_201802_PRE
    // Se retiran variables
    // sprephojcar: TSpeedButton;
    // Fin: HPC_201709_PRE
    // // Inicio HPC_201801_PRE
    // // Generación de Reporte de Cesantes sin Liquidación
    // sbCesantesSinLiqui: TSpeedButton;
    // Fin: HPC_201802_PRE
    pnlCesantesSinLiquidacion: TPanel;
    sbProgramarReporte: TSpeedButton;
    sbReportesCesantes: TSpeedButton;
    sbVisorProgramacion: TSpeedButton;
    // Inicio: HPC_201802_PRE
    // Se añaden nuevos botones
    sbprogdesem: TSpeedButton;
    Z1Reportes2: TSpeedButton;
    Z1Reportes1: TSpeedButton;
    pnlReportes2: TPanel;
    sprephojcar: TSpeedButton;
    sbCesantesSinLiqui: TSpeedButton;
    sbliqxofiint: TSpeedButton;
    // Inicio: HPC_201804_PRE
    // Boton del nuevo reporte a crear
    sprepliqRG: TSpeedButton;
// INICIO HPC_201808_PRE 
// Jerarquía del módulo del Control de Ticket
    pnlVentanilla: TPanel;
    lblNumVentanilla: TLabel;
    SEMAFORO: TShape;
    btnIniAtencion: TButton;
    btnFinAtencion: TButton;
    btnAsigna: TButton;
    pnlAsignacion: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    estNumVen: TEdit;
    dblPantalla: TwwDBLookupCombo;
    btnOK: TButton;
    btnCancel: TButton;
    btnLimpiar: TButton;
    pnlDesasignar: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    edtUsuario: TEdit;
    btnDesasignarOK: TButton;
    btnDesasignarCancel: TButton;
    edtPassword: TEdit;
//FIN HPC_201808_PRE 
    // Inicio: HPC_201804_PRE
    // Fin: HPC_201802_PRE
// Fin HPC_201801_PRE
    // Fin: HPC_201705_PRE
// Fin  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
// Fin: SPP_201403_PRE
// Fin: SPP_201306_PRE
      //Fin: DPP_201202_PRE
      //Fin: HPP_201105_PRE
      Procedure bbtnTachoDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; Var Accept: Boolean);
      Procedure lbOrdenDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; Var Accept: Boolean);
      Procedure wwDBGrid2DragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; Var Accept: Boolean);
      Procedure wwDBGrid3DragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; Var Accept: Boolean);
      Procedure FormShow(Sender: TObject);
      Procedure Z1sbReferenciasClick(Sender: TObject);
      Procedure Z1sbReglasMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
      Procedure Z1sbMovimientosMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
      Procedure Z1sbReportesMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
      Procedure dbgMovCxPMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
      Procedure SacaMenu(Sender: TObject);
      Procedure dbgOPagoMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
      Procedure lbFiltroOPDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; Var Accept: Boolean);
      Procedure lbOrdenOPDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; Var Accept: Boolean);
      Procedure Z1sbMenuRegistro5Click(Sender: TObject);
      Procedure Z1sbMaestrosMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
      Procedure FormCreate(Sender: TObject);
      Procedure Z1sbSalidaClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure Z1sbSalidaMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
      Procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
      Procedure Z1sbProcesosMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
      Procedure Z1sbRepLibAhAbClick(Sender: TObject);
      Procedure FormActivate(Sender: TObject);
      Procedure Z1sbCamPasswClick(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure Z1sbReglasClick(Sender: TObject);
      Procedure Z1sbMovimientosClick(Sender: TObject);
      Procedure Z1sbProcesosClick(Sender: TObject);
      Procedure Z1sbReportesClick(Sender: TObject);
      Procedure Z1sbtnContabilizaClick(Sender: TObject);
      Procedure Z1sbLiqAnterioresClick(Sender: TObject);
      Procedure sbmanrecClick(Sender: TObject);
      Procedure sbrepbenatextipapgClick(Sender: TObject);
      Procedure sbLiqBenClick(Sender: TObject);
      Procedure sbExpBenClick(Sender: TObject);
      Procedure sbnuecontaClick(Sender: TObject);
      Procedure sbretjudClick(Sender: TObject);
      Procedure sbnuegenofiClick(Sender: TObject);
      Procedure sbcobliqClick(Sender: TObject);
      Procedure sbreliquidacionesClick(Sender: TObject);
      Procedure sbrepxtipbenClick(Sender: TObject);
      Procedure sbrepliqxdepClick(Sender: TObject);
      Procedure sbrepnivdevbenClick(Sender: TObject);
      Procedure sbrepcuocrebenClick(Sender: TObject);
      Procedure sbmancardesClick(Sender: TObject);
      Procedure SpeedButton16Click(Sender: TObject);
      Procedure SpeedButton2Click(Sender: TObject);
      Procedure sbmanlibahoClick(Sender: TObject);
      Procedure spdReferenClick(Sender: TObject);
      Procedure spdEstBenMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
      Procedure sbrepbenatextipapgMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
      Procedure sbrepestxsexClick(Sender: TObject);
      Procedure spdCredPendClick(Sender: TObject);
      Procedure spdControlClick(Sender: TObject);
      Procedure spdCueIndMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
      Procedure spdCueIndClick(Sender: TObject);
      Procedure spbBenAnoOcuMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
      // Inicio: HPC_201802_PRE
      // Se modifica nombre del procedimiento
      // Procedure pnlReportesMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
      Procedure pnlReportes1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
      // Fin: HPC_201802_PRE
      Procedure spliqanuClick(Sender: TObject);
      Procedure spdcueinddisClick(Sender: TObject);
      Procedure sbMatrizResClickClick(Sender: TObject);
      Procedure sbCuentaIndClick(Sender: TObject);
      Procedure spdresliqClick(Sender: TObject); // SPP_201306_PRE
      Procedure sbCtaIndLoteClick(Sender: TObject);
      Procedure sbReportePostReestClick(Sender: TObject);
      Procedure sbmanretClick(Sender: TObject);
      Procedure sbmaninvClick(Sender: TObject);
      Procedure sbmancapdeuClick(Sender: TObject);
      Procedure sbmansepClick(Sender: TObject);
      Procedure sbBenefxDptoUgelTipoClick(Sender: TObject);
      Procedure sbRptCartaDesigClick(Sender: TObject);
      Procedure spbBenAnoOcuClick(Sender: TObject);
      Procedure sbAutxCenEduClick(Sender: TObject);
      procedure spdBenCheGerClick(Sender: TObject);
      //Inicio: HPP_201105_PRE
      procedure sbBenefDetxDptoUgelClick(Sender: TObject);
      //Inicio: DPP_201202_PRE
      procedure sbHojaTrabajoCampoClick(Sender: TObject);
// Inicio: SPP_201306_PRE
    procedure sbrepxtipdesClick(Sender: TObject);
    procedure sbIndGestionClick(Sender: TObject);
    procedure sbliqxTipBenClick(Sender: TObject);  // SPP_201401_PRE
    procedure sbresliqconCADAPSClick(Sender: TObject); // SPP_201403_PRE
    // Inicio: HPC_201508_PRE
    procedure sbAsoAplCCIClick(Sender: TObject);
    // Fin: HPC_201508_PRE
    // INICIO HPC_201509_PRE
    procedure btnMantenimientoCausaCeseClick(Sender: TObject);
    // FIN HPC_201509_PRE
// Fin: SPP_201306_PRE
      //Fin: DPP_201202_PRE
      //Fin: HPP_201105_PRE
// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
    procedure sbContaExtornoClick(Sender: TObject);
    // Inicio: HPC_201705_PRE
    // Se crean los componentes para las dos nuevas opciones.
    procedure sbextrepdesembolsoClick(Sender: TObject);
    procedure spdespagypenpagClick(Sender: TObject);
    procedure spdocxedadysexoClick(Sender: TObject);
    // Inicio: HPC_201709_PRE
    // Se añaden procedimientos para llamar a las nuevas formas implementadas
    procedure sprepcausaceseClick(Sender: TObject);
    procedure sprephojcarClick(Sender: TObject);
    // Fin: HPC_201709_PRE
// Inicio HPC_201801_PRE
// Generación de Reporte de Cesantes sin Liquidación
    procedure sbCesantesSinLiquiMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure sbCesantesSinLiquiClick(Sender: TObject);
    procedure spdespagypenpagMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure spdocxedadysexoMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure sbProgramarReporteClick(Sender: TObject);
    procedure sbVisorProgramacionClick(Sender: TObject);
    procedure sbReportesCesantesClick(Sender: TObject);
    procedure sprepcausaceseMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure sprephojcarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer); 
    // Inicio: HPC_201802_PRE
    // Se crean nuevos procedimientos
    procedure sbprogdesemClick(Sender: TObject);
    procedure Z1Reportes2Click(Sender: TObject);
    procedure Z1Reportes2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbliqxofiintMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbliqxofiintClick(Sender: TObject);
    // Inicio: HPC_201804_PRE
    // Procedimiento del nuevo boton creado "Reporte de liquidaciones RG"
    procedure sprepliqRGClick(Sender: TObject);
//INICIO HPC_201808_PRE 
//Jerarquía del módulo del Control de Ticket
    procedure btnAsignaClick(Sender: TObject);
    procedure btnIniAtencionClick(Sender: TObject);
    procedure btnFinAtencionClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnLimpiarClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnDesasignarOKClick(Sender: TObject);
    procedure btnDesasignarCancelClick(Sender: TObject);
//FIN HPC_201808_PRE
    // Fin: HPC_201804_PRE
    // Fin: HPC_201802_PRE
// Fin HPC_201801_PRE
    // Fin: HPC_201705_PRE

// Fin   HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios

   Private
    { Private declarations }
//INICIO HPC_201808_PRE 
//Jerarquía del módulo del Control de Ticket
      sNumVenta,sPantalla : String;
//FIN HPC_201808_PRE 
      Function VerificaVersion: Boolean;
      Procedure Verpercadpas;
//INICIO HPC_201808_PRE
//Jerarquía del módulo del Control de Ticket
      procedure bloqueamenu;
      procedure Desbloqueamenu;
//FIN HPC_201808_PRE 
   Public
      pnltool2, pnltool3: TPanel;
      Mtx, Mtx1, MCabLiq, MRecLiq, MtxOficioP: TMant;
      Procedure CreaAccesos;
      Procedure CreaOpciones;
      Procedure ListaComponentes(xForm: TForm);
      Procedure AppMessage(Var Msg: TMsg; Var Handled: Boolean);
      Procedure MueveMouse(xObjeto: TObject; Shift: TShiftState; X, Y: Integer);
   End;

Var
   FPrincipal: TFPrincipal;
   xFechasys: TDate;

Implementation

Uses PREDM, PRE570, PRE395, PRE311, PRE861, PRE227, PRE280, PRE245,
   PRE247, PRE249, PRE252, PRE258, PRE238, PRE927, PRE928, PRE929, PRE259,
   PRE268, PRE239, PRE269, PRE232, Math, PRE862, PRE271, ASO939, PRE272,
   PRE282, PRE274, PRE930, PRE931, PRE320, PRE932, PRE934, PRE933,
   PRE203, PRE206, PRE209, PRE211, PRE290, PRE291, PRE966,
   // Inicio: SPP_201403_PRE    15/07/2014  : Cambio de DCOM a Socket
   // Inicio: HPC_201508_PRE
   // Se añade fuente PRE940
   // INICIO HPC_201509_PRE
   ASO962, PRE417, PRE530, PRE286, PRE288, PRE938, PRE936, PRE939, PRE022,
// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
   // Inicio: HPC_201705_PRE
   // Se incluyen las dos nuevas unidades
   // PRE940, PRE215, PRE301;
   // Inicio: HPC_201709_PRE
   // Se añaden las nuevas unidades implementadas
   // PRE940, PRE215, PRE301, PRE216, PRE296, PRE297;
// Inicio HPC_201801_PRE
// Generación de Reporte de Cesantes sin Liquidación
   // Inicio: HPC_201802_PRE
   // Se añaden nueva unidades de los nuevos reportes
   PRE940, PRE215, PRE301, PRE216, PRE296, PRE297, PRE300, PRE302, PRE601, PRE600, PRE602,
   // Inicio: HPC_201804_PRE
   // Se añade la unidad de la forma "Reportes liquidaciones RG"
   // PRE221, PRE303;
//INICIO HPC_201808_PRE 
//Jerarquía del módulo del Control de Ticket
   PRE221, PRE303, PRE304,WSAutenticacion;
//FIN HPC_201808_PRE 
   // Fin: HPC_201804_PRE
   // Fin: HPC_201802_PRE
// Fin HPC_201801_PRE
   // Fin: HPC_201709_PRE
   // Fin: HPC_201705_PRE

// Fin    HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
   // FIN HPC_201509_PRE
   // Fin: HPC_201508_PRE
   // Fin: SPP_201403_PRE    15/07/2014  : Cambio de DCOM a Socket


{$R *.DFM}

Function TFPrincipal.VerificaVersion: Boolean;
Var
   xSQL: String;
Begin
   Result := False;
   xSQL := 'SELECT CODIGO,DESCRIP,VERSION,USUARIO,FLAGSTD,PREFIJO,MODDIFC,VERSIG '
         + '  FROM TGE600 WHERE CODIGO =''' + DM1.wModulo + '''';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSQL);
   DM1.cdsQry.Open;
   If lblVersion.Caption = DM1.cdsQry.FieldByName('VERSION').AsString Then
      Result := True
   Else
   Begin
      ShowMessage('Para poder continuar, es necesario que actualice la Versión');
      DM1.DCOM1.Connected := False;
      //Inicio: HPC_201502_PRE
      Result:=False;
      //Fin: HPC_201502_PRE
      Application.Terminate;
   End
End;

Procedure TFPrincipal.CreaAccesos;
Begin
   // Inicio: SPP_201403_PRE
   {

   If FMantAcceso <> Nil Then Exit;
   FMantAcceso := TFMantAcceso.Create(Self);
   FMantAcceso.sSRV_D := SRV_D;

   FMantAcceso.wDCOM1 := DM1.DCOM1;

   FMantAcceso.wcdsAcceso := DM1.cdsAcceso;
   FMantAcceso.wcdsGrupos := DM1.cdsGrupos;
   FMantAcceso.wcdsMGrupo := DM1.cdsMGrupo;
   FMantAcceso.wcdsUsuarios := DM1.cdsUsuarios;
   FMantAcceso.wcdsResultSet := DM1.cdsResultSet;
   FMantAcceso.wcdsUser := DM1.cdsUser;
   FMantAcceso.wFPrincipal := FPrincipal;
   FMantAcceso.sModulo := DM1.wModulo;
   With FMantAcceso Do
   Try
      ShowModal;
   Finally
      DM1.wGrupoTmp := FMantAcceso.sGrupoTmp;
      Free;
   End;
   FMantAcceso := Nil; }
   // Fin: SPP_201403_PRE
End;

Procedure TFPrincipal.CreaOpciones;
Begin
   // Inicio: SPP_201403_PRE
   {
   If FMantOpcion <> Nil Then Exit;
   FMantOpcion := TFMantOpcion.Create(Self);
   FMantOpcion.wcdsAcceso := DM1.cdsAcceso;
   FMantOpcion.wcdsGrupos := DM1.cdsGrupos;
   FMantOpcion.wcdsMGrupo := DM1.cdsMGrupo;
   FMantOpcion.wcdsUsuarios := DM1.cdsUsuarios;
   FMantOpcion.wcdsResultSet := DM1.cdsResultSet;
   // Inicio: SPP_201403_PRE
   //   FMantOpcion.wDCOM1 := DM1.DCOM1;
   // Fin: SPP_201403_PRE
   FMantOpcion.sGrupoTmp := DM1.wGrupoTmp;
   FMantOpcion.sObjetoDescr := DM1.wObjetoDescr;
   FMantOpcion.sObjetoForma := DM1.wObjetoForma;
   FMantOpcion.sObjetoNombr := DM1.wObjetoNombr;
   FMantOpcion.sModulo := DM1.wModulo;
   FMantOpcion.wFPrincipal := FPrincipal;
   With FMantOpcion Do
   Try
      If Length(DM1.wGrupoTmp) > 0 Then
      Begin
         ShowModal;
      End;
   Finally
      Free;
   End;
   FMantOpcion := Nil;
   }
   // Fin: SPP_201403_PRE
End;

Procedure TFPrincipal.bbtnTachoDragOver(Sender, Source: TObject; X, Y: Integer;
   State: TDragState; Var Accept: Boolean);
Begin
   Accept := True;
End;

Procedure TFPrincipal.lbOrdenDragOver(Sender, Source: TObject; X, Y: Integer;
   State: TDragState; Var Accept: Boolean);
Begin
   Accept := True;
End;

Procedure TFPrincipal.wwDBGrid2DragOver(Sender, Source: TObject; X, Y: Integer;
   State: TDragState; Var Accept: Boolean);
Begin
   Accept := True;
End;

Procedure TFPrincipal.wwDBGrid3DragOver(Sender, Source: TObject; X, Y: Integer;
   State: TDragState; Var Accept: Boolean);
Begin
   Accept := True;
End;

Procedure TFPrincipal.FormShow(Sender: TObject);
Begin
   Screen.Cursor := CrDefault;
End;

Procedure TFPrincipal.Z1sbReferenciasClick(Sender: TObject);
Begin
   SacaMenu(Sender);
   MRefe := TMant.Create(Self);
   With MRefe Do
   Begin
      Try
         User := DM1.wUsuario;
         Titulo := '';
         Module := DM1.wModulo;
         DComC := DM1.DCOM1;
// Inicio: SPP_201403_PRE
         Tipo := 'NORMAL';
// Fin: SPP_201403_PRE
         ControlGridDisp := cgdPrincipal;
         Execute;
      Finally
         Free;
      End;
   End;
End;

Procedure TFPrincipal.Z1sbReglasMouseMove(Sender: TObject;
   Shift: TShiftState; X, Y: Integer);
Begin
   pnlReferencias.Left := TSpeedButton(Sender).Left + 10;
   pnlReferencias.Top := TSpeedButton(Sender).Top + TSpeedButton(Sender).Height;
   pnlReferencias.Visible := True;
   pnlMovimientos.Visible := False;
   pnlProcesos.Visible := False;
   // Inicio: HPC_201802_PRE
   // Se validan nuevos paneles 
   // pnlReportes.Visible := False;
   pnlReportes1.Visible := False;
   pnlReportes2.Visible := False;
   // Fin: HPC_201802_PRE
End;

Procedure TFPrincipal.Z1sbMaestrosMouseMove(Sender: TObject; Shift: TShiftState;
   X, Y: Integer);
Begin
   pnlReferencias.Visible := False;
   pnlMovimientos.Visible := False;
   pnlProcesos.Visible := False;
   // Inicio: HPC_201802_PRE
   // Se validan nuevos paneles 
   // pnlReportes.Visible := False;
   pnlReportes1.Visible := False;
   pnlReportes2.Visible := False;
   // Fin: HPC_201802_PRE
End;

Procedure TFPrincipal.Z1sbMovimientosMouseMove(Sender: TObject;
   Shift: TShiftState; X, Y: Integer);
Begin
   pnlMovimientos.Left := TSpeedButton(Sender).Left + 10;
   pnlMovimientos.Top := TSpeedButton(Sender).Top + TSpeedButton(Sender).Height;
   pnlReferencias.Visible := False;
   pnlMovimientos.Visible := True;
   pnlProcesos.Visible := False;
   // Inicio: HPC_201802_PRE
   // Se validan nuevos paneles 
   // pnlReportes.Visible := False;
   pnlReportes1.Visible := False;
   pnlReportes2.Visible := False;
   // Fin: HPC_201802_PRE
End;

Procedure TFPrincipal.Z1sbReportesMouseMove(Sender: TObject;
   Shift: TShiftState; X, Y: Integer);
Begin
   // Inicio: HPC_201802_PRE
   // Se validan nuevos paneles de las opciones
   // pnlReportes.Left := TSpeedButton(Sender).Left + 10;
   // pnlReportes.Top := TSpeedButton(Sender).Top + TSpeedButton(Sender).Height;
   pnlReportes1.Left := TSpeedButton(Sender).Left + 10;
   pnlReportes1.Top := TSpeedButton(Sender).Top + TSpeedButton(Sender).Height;
   pnlReferencias.Visible := False;
   pnlMovimientos.Visible := False;
   pnlProcesos.Visible := False;
   // pnlReportes.Visible := True;
   pnlReportes2.Visible := False;
   pnlReportes1.Visible := True;
   // Fin: HPC_201802_PRE
End;

Procedure TFPrincipal.dbgMovCxPMouseMove(Sender: TObject;
   Shift: TShiftState; X, Y: Integer);
Begin
   SacaMenu(Sender);
End;

Procedure TFPrincipal.SacaMenu(Sender: TObject);
Begin
   clbPrincipal.Enabled := True;
   pnlReferencias.Visible := False;
   pnlMovimientos.Visible := False;
   pnlProcesos.Visible := False;
   // Inicio: HPC_201802_PRE
   // Se validan nuevos paneles de las opciones
   // pnlReportes.Visible := False;
   pnlReportes1.Visible := False;
   pnlReportes2.Visible := False;
   pnlResumen.Visible := False;
   // Fin: HPC_201802_PRE
// Inicio HPC_201801_PRE
// Generación de Reporte de Cesantes sin Liquidación
   pnlCesantesSinLiquidacion.Visible := False
// Fin HPC_201801_PRE
End;

Procedure TFPrincipal.dbgOPagoMouseMove(Sender: TObject;
   Shift: TShiftState; X, Y: Integer);
Begin
   SacaMenu(Sender);
End;

Procedure TFPrincipal.lbFiltroOPDragOver(Sender, Source: TObject; X,
   Y: Integer; State: TDragState; Var Accept: Boolean);
Begin
   Accept := True;
End;

Procedure TFPrincipal.lbOrdenOPDragOver(Sender, Source: TObject; X,
   Y: Integer; State: TDragState; Var Accept: Boolean);
Begin
   Accept := True;
End;

Procedure TFPrincipal.Z1sbMenuRegistro5Click(Sender: TObject);
Begin
   SacaMenu(Sender);
End;

Procedure TFPrincipal.FormCreate(Sender: TObject);
//Inicio HPC_201808_PRE
//Jerarquía del módulo del Control de Ticket
var
  xsql:String;
//Fin HPC_201808_PRE
Begin
   DM1.BlqComponentes(Self);
   If (DM1.wAdmin = 'G') Or (DM1.wAdmin = 'M') Then
   Begin
      DM1.wGrupoTmp := '';
      Application.OnMessage := AppMessage;
      ListaComponentes(Self);
   End;
   sbAutxCenEdu.Enabled := true; 

//Inicio HPC_201808_PRE
//Jerarquía del módulo del Control de Ticket
  DM1.xOfiDes := DM1.CrgDescrip('USERID=' + QuotedStr(Trim(DM1.wUsuario)), 'TGE006', 'OFDESID');
  xSQL:='SELECT OFDESID,USERID,PANTALLA,VENTANILLA,OPERACION,FECREG FROM TICKET_ASG_VEN_MOD_USU '
       +' WHERE OFDESID='+QuotedStr(DM1.xOfiDes)+ ' AND USERID='+QuotedStr(Trim(DM1.wUsuario))+' AND OPERACION='+QuotedStr(DM1.wModulo);
  DM1.cdsQry27.Close;
  DM1.cdsQry27.DataRequest(xSQL);
  DM1.cdsQry27.Open;
  If  DM1.cdsQry27.RecordCount>0 Then
  Begin
     sNumVenta := Trim(DM1.cdsQry27.FieldByname('VENTANILLA').AsString);
     sPantalla := Trim(DM1.cdsQry27.FieldByname('PANTALLA').AsString);
     btnFinAtencion.Enabled:=False;
     pnlVentanilla.Visible := true;
     pnlVentanilla.Width:=204;
     pnlVentanilla.Height:=135;
     lblNumVentanilla.Caption := 'De la Ventanilla '+sNumVenta+' -> '+sPantalla;
     bloqueamenu;
  End
  Else
  Begin
     pnlVentanilla.Visible := true;
     lblNumVentanilla.Caption := 'Sin Asignación de Ventanilla';
     pnlVentanilla.Width:=179;
     pnlVentanilla.Height:=62;
  End;
//Fin HPC_201808_PRE
End;

Procedure TFPrincipal.AppMessage(Var Msg: TMsg; Var Handled: Boolean);
Begin
   If Msg.message = WM_KEYDOWN Then
   Begin
      If (Msg.wParam = VK_F5) Then
      Begin
         If (Copy(DM1.wObjetoNombr, 1, 2) = 'Z1') Or (Copy(DM1.wObjetoNombr, 1, 2) = 'Z2') Then
         Begin
            CreaOpciones;
         End;
      End;
      If (Msg.wParam = VK_F12) Then
      Begin
         CreaAccesos;
      End;
   End;
End;

Procedure TFPrincipal.Z1sbSalidaClick(Sender: TObject);
Begin
   Close;
End;

Procedure TFPrincipal.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   DM1.DCOM1.Connected := False;
   Application.Terminate;
End;

Procedure TFPrincipal.Z1sbSalidaMouseMove(Sender: TObject;
   Shift: TShiftState; X, Y: Integer);
Begin
   pnlReferencias.Visible := False;
   pnlMovimientos.Visible := False;
   pnlProcesos.Visible := False;
   // Inicio: HPC_201802_PRE
   // Se validan nuevos paneles de los reportes
   // pnlReportes.Visible := False;
   pnlReportes1.Visible := False;
   pnlReportes2.Visible := False;
   pnlCesantesSinLiquidacion.Visible := False;
   // Fin: HPC_201802_PRE
End;

Procedure TFPrincipal.FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
Begin
   SacaMenu(Self);
End;

Procedure TFPrincipal.Z1sbProcesosMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
Begin
   pnlProcesos.Left := TSpeedButton(Sender).Left + 10;
   pnlProcesos.Top := TSpeedButton(Sender).Top + TSpeedButton(Sender).Height;
   pnlReferencias.Visible := False;
   pnlMovimientos.Visible := False;
   pnlProcesos.Visible := True;
   // Inicio: HPC_201802_PRE
   // Se validan nuevos paneles de los reportes
   // pnlReportes.Visible := False;
   pnlReportes1.Visible := False;
   pnlReportes2.Visible := False;
   // Fin: HPC_201802_PRE
End;

Procedure TFPrincipal.Z1sbRepLibAhAbClick(Sender: TObject);
Begin
   SacaMenu(Sender);
   Try
      FRepLibAhorro := TFRepLibAhorro.Create(Self);
      FRepLibAhorro.ShowModal;
   Finally
      FRepLibAhorro.Free;
   End;
End;

Procedure TFPrincipal.FormActivate(Sender: TObject);
Var
   // Inicio: HPC_201813_PRE
   // Seañade variable xRuta
   // xSQL: String;
   xSQL, xSQL2, xRuta: String;
   // Fin: HPC_201813_PRE
   xbol: Boolean;
Begin
   // Inicio: HPC_201813_PRE
   // Se contola que la aplicación se ejecute solo de la carpeta C:\SOLExes\
   xRuta:=UpperCase(ExtractFilePath(Application.ExeName));
   If Trim(xRuta)<>'C:\SOLEXES\' Then
   Begin
      MessageDlg(' EL SISTEMA Debe Ejecutase Desde :  >>> C:\SOLExes\ <<<  VERIFIQUE LA RUTA !!!! ', mtError, [mbOk], 0);
      Application.Terminate;
      Exit;
   End;

   xSQL2:='Select SF_CONTROL_ACCESO('+QuotedStr(dm1.wUsuario)+','+QuotedStr(DM1.wModulo)+') Mensaje From dual ';
   DM1.cdsQry1.Close;
   DM1.cdsQry1.DataRequest(xSQL2);
   DM1.cdsQry1.Open;
   If copy(DM1.cdsQry1.FieldByName('Mensaje').AsString,1,3)='Err' Then
   Begin
      ShowMessage(DM1.cdsQry1.FieldByName('Mensaje').AsString);
      Application.Terminate;
      Exit;
   End;
   // Fin: HPC_201813_PRE


   xbol:=VerificaVersion;
   if xbol = False then
      exit;
//Fin: HPC_201502_PRE
   Verpercadpas;
   lblVersion.Height := 13;
   lblVersion.Left := 16;
   lblVersion.Top := 528;

   If Copy(DM1.CrgArea(DM1.wUsuario), 6, 2) = '03' Then spdControl.Enabled := True;
   Try
      DM1.AccesosUsuarios(DM1.wModulo, DM1.wUsuario, '1', '');
   Except
   End;

   xSQL := 'USERID =' + QuotedStr(DM1.wUsuario);
   Caption := 'Módulo de Previsión Social   -   Usuario:  ' + DM1.DisplayDescrip('prvTGE', 'TGE006', 'USERNOM', xSQL, 'USERNOM');
End;

Procedure TFPrincipal.Z1sbCamPasswClick(Sender: TObject);
Var
   xSQL: String;
   xpassact, xpassnue: String;
   xdiasduracpass: Integer;
Begin
   DM1.cdsUser.Close;
   DM1.cdsUser.DataRequest('SELECT USERID,USERNOM,PASSWORD,FECEXP,OFDESID,CTLFAC,FLGAUT,FECINI_PWD,FECFIN_PWD,DIASEXP_PWD,DIASDURAC_PWD,CTRL_IP FROM TGE006 WHERE USERID=''' + DM1.wUsuario + '''');
   DM1.cdsUser.Open;

   xpassact := DM1.cdsUser.FieldByName('PASSWORD').AsString;
   xdiasduracpass := DM1.cdsUser.FieldByName('DIASDURAC_PWD').AsInteger;
// Inicio: SPP_201403_PRE       : 15/07/2014  : Cambio de DCOM a Socket
   FCPassw := TFCPassw.Create(Self);
   FCPassw.dbeUsuario.Text := DM1.wUsuario;
   FCPassw.dbeNombre.Text := DM1.cdsUser.FieldByname('USERNOM').AsString;
   FCPassw.dbeUsuario.Text := DM1.wUsuario;
   FCPassw.sPassword := DM1.cdsUser.FieldByname('PASSWORD').AsString;
   FCPassw.sModulo := DM1.wModulo;
   FCPassw.wcdsUsuarios := DM1.cdsUser;
   Try
      FCPassw.ShowModal;
   Finally
      FCPassw.Free;
   End;
// Fin: SPP_201403_PRE       : 15/07/2014  : Cambio de DCOM a Socket

   xSQL := 'SELECT PASSWORD FROM TGE006 WHERE USERID = ' + QuotedStr(DM1.wUsuario);
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSQL);
   DM1.cdsQry.Open;
   xpassnue := DM1.cdsQry.FieldByName('PASSWORD').AsString;
   If xpassact <> xpassnue Then
   Begin
      xSql := 'UPDATE TGE006 '
            + '   SET FECINI_PWD = TO_DATE(SYSDATE), '
            + '       FECFIN_PWD = TO_DATE(SYSDATE)+' + IntToStr(xdiasduracpass)
            + ' WHERE USERID     = ' + QuotedStr(DM1.wUsuario);
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      Application.Terminate;
   End;
End;

Procedure TFPrincipal.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If Key = #13 Then
   Begin
      Key := #0;
      Perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFPrincipal.ListaComponentes(xForm: TForm);
Var
   i: Integer;
Begin
   For i := 0 To xForm.ComponentCount - 1 Do
   Begin

      If xForm.Components[i].ClassName = 'TPanel' Then
         TPanel(xForm.components[i]).OnMouseMove := MueveMouse;
      // para botones
      If xForm.Components[i].ClassName = 'TButton' Then
         TButton(xForm.components[i]).OnMouseMove := MueveMouse;
      // para bitbuttons
      If xForm.Components[i].ClassName = 'TBitBtn' Then
         TBitBtn(xForm.components[i]).OnMouseMove := MueveMouse;
      // para speedbuttons
      If xForm.Components[i].ClassName = 'TSpeedButton' Then
         TSpeedButton(xForm.components[i]).OnMouseMove := MueveMouse;
      // Boton de Grid
      If xForm.Components[i].ClassName = 'TwwIButton' Then
         TwwIButton(xForm.components[i]).OnMouseMove := MueveMouse;
      // para la forma
      xForm.onMouseMove := MueveMouse;
   End;
End;

Procedure TFPrincipal.MueveMouse(xObjeto: TObject; Shift: TShiftState; X,
   Y: Integer);
Var
   xComponente: String;
   xForma: TForm;
Begin
   xForma := Screen.ActiveForm;
   xComponente := xForma.Name;

   If xObjeto Is TForm Then
   Else
   Begin
      xComponente := xComponente + '.' + TControl(xObjeto).Name;

      DM1.wObjetoForma := xForma.Name;
      DM1.wObjetoNombr := TControl(xObjeto).Name;
      If Copy(DM1.wObjetoNombr, 2, 1) = '2' Then
         DM1.wObjetoDescr := DM1.wObjetoDesPr + ' - ' + TControl(xObjeto).Hint
      Else
      Begin
         DM1.wObjetoDescr := TControl(xObjeto).Hint;
      End;
   End;
End;

Procedure TFPrincipal.Z1sbReglasClick(Sender: TObject);
Begin
   pnlReferencias.Left := TSpeedButton(Sender).Left + 10;
   pnlReferencias.Top := TSpeedButton(Sender).Top + TSpeedButton(Sender).Height;
   pnlReferencias.Visible := True;
   pnlMovimientos.Visible := False;
   pnlProcesos.Visible := False;
   // Inicio: HPC_201802_PRE
   // Se validan nuevos paneles de los reportes
   // pnlReportes.Visible := False;
   pnlReportes1.Visible := False;
   pnlReportes2.Visible := False;
   // Fin: HPC_201802_PRE
End;

Procedure TFPrincipal.Z1sbMovimientosClick(Sender: TObject);
Begin
   pnlMovimientos.Left := TSpeedButton(Sender).Left + 10;
   pnlMovimientos.Top := TSpeedButton(Sender).Top + TSpeedButton(Sender).Height;
   pnlReferencias.Visible := False;
   pnlMovimientos.Visible := True;
   pnlProcesos.Visible := False;
   // Inicio: HPC_201802_PRE
   // Se valida nuevos paneles de las opciones
   // pnlReportes.Visible := False;
   pnlReportes1.Visible := False;
   pnlReportes2.Visible := False;
   // Fin: HPC_201802_PRE
End;

Procedure TFPrincipal.Z1sbProcesosClick(Sender: TObject);
Begin
   pnlProcesos.Left := TSpeedButton(Sender).Left + 10;
   pnlProcesos.Top := TSpeedButton(Sender).Top + TSpeedButton(Sender).Height;
   pnlReferencias.Visible := False;
   pnlMovimientos.Visible := False;
   pnlProcesos.Visible := True;
   // Inicio: HPC_201802_PRE
   // Se validan nuevos paneles de los reportes
   // pnlReportes.Visible := False;
   pnlReportes1.Visible := False;
   pnlReportes1.Visible := False;
   // Fin: HPC_201802_PRE
End;

Procedure TFPrincipal.Z1sbReportesClick(Sender: TObject);
Begin
   // Inicio: HPC_201802_PRE
   // Se validan nuevos paneles de los reportes
   // pnlReportes.Left := TSpeedButton(Sender).Left + 10;
   // pnlReportes.Top := TSpeedButton(Sender).Top + TSpeedButton(Sender).Height;
   pnlReportes1.Left := TSpeedButton(Sender).Left + 10;
   pnlReportes1.Top := TSpeedButton(Sender).Top + TSpeedButton(Sender).Height;
   pnlReferencias.Visible := False;
   pnlMovimientos.Visible := False;
   pnlProcesos.Visible := False;
   // pnlReportes.Visible := True;
   pnlReportes2.Visible := True;
   pnlReportes1.Visible := True;
   // Fin: HPC_201802_PRE
End;

Procedure TFPrincipal.Z1sbtnContabilizaClick(Sender: TObject);
Var
   xSQL: String;
Begin
   SacaMenu(Sender);
   xSQL := 'Select TDIARID,TDIARDES,TDIARNUM,TDIAREST,AUTONUM,FLAGBCOCJA,TDIARMAN,'
         + '       REGISTRO,FLAGALM,TDIARABR,FLAGPDT,FLAGPL,FLGPLPER,TDIARID1,FLAGAF '
         + '  From TGE104';
   DM1.cdsTDiario.Filter := '';
   DM1.cdsTDiario.Filtered := False;
   DM1.cdsTDiario.IndexFieldNames := '';
   DM1.cdsTDiario.Close;
   DM1.cdsTDiario.DataRequest(xSQL);
   DM1.cdsTDiario.Open;
End;

Procedure TFPrincipal.Z1sbLiqAnterioresClick(Sender: TObject);
Begin
   SacaMenu(Sender);
   Try
      FLiqAnteriores := TFLiqAnteriores.create(Self);
      FLiqAnteriores.ShowModal;
   Finally
      FLiqAnteriores.Free;
   End;
End;

Procedure TFPrincipal.sbmanrecClick(Sender: TObject);
Begin
   SacaMenu(Sender);
   Try
      FmanReclamos := TFmanReclamos.create(Self);
      FmanReclamos.ShowModal;
   Finally
      FmanReclamos.Free;
   End;
End;

Procedure TFPrincipal.sbrepbenatextipapgClick(Sender: TObject);
Begin
   SacaMenu(Sender);
   Try
      FrepXTipPag := TFrepXTipPag.create(Self);
      FrepXTipPag.ShowModal;
   Finally
      FrepXTipPag.Free;
   End;
End;

Procedure TFPrincipal.sbLiqBenClick(Sender: TObject);
Begin
   SacaMenu(Sender);
   DM1.xSgr := '';
   DM1.xTipLiq := 'L';
   Try
      FBuscaLiqBeneficios := TFBuscaLiqBeneficios.create(Self);
      FBuscaLiqBeneficios.ShowModal;
   Finally
      FBuscaLiqBeneficios.Free;
   End;
End;

Procedure TFPrincipal.sbExpBenClick(Sender: TObject);
Begin
   SacaMenu(Sender);
   Try
      FExpedientebeneficio := TFExpedientebeneficio.create(Self);
      FExpedientebeneficio.ShowModal;
   Finally
      FExpedientebeneficio.Free;
   End;
End;

Procedure TFPrincipal.sbnuecontaClick(Sender: TObject);
Begin
   SacaMenu(Sender);
   Try
      FNueCont := TFNueCont.create(Self);
      FNueCont.ShowModal;
   Finally
      FNueCont.Free;
   End;
End;

Procedure TFPrincipal.sbretjudClick(Sender: TObject);
Begin
   SacaMenu(Sender);
   Try
      Fretencionjudicial := TFretencionjudicial.create(Self);
      Fretencionjudicial.ShowModal;
   Finally
      Fretencionjudicial.Free;
   End;
End;

Procedure TFPrincipal.sbnuegenofiClick(Sender: TObject);
Begin
   SacaMenu(Sender);
   Try
      Fnuegenofi := TFnuegenofi.create(Self);
      Fnuegenofi.ShowModal;
   Finally
      Fnuegenofi.Free;
   End;
End;

Procedure TFPrincipal.sbcobliqClick(Sender: TObject);
Begin
   SacaMenu(Sender);
   Try
      Fcobliq := TFcobliq.create(Self);
      Fcobliq.ShowModal;
   Finally
      Fcobliq.Free;
   End;
End;

Procedure TFPrincipal.sbreliquidacionesClick(Sender: TObject);
Begin
   SacaMenu(Sender);
   DM1.xSgr := '';
   DM1.xTipLiq := 'R';
   Try
      Fbuscareliquidacion := TFbuscareliquidacion.create(Self);
      Fbuscareliquidacion.ShowModal;
   Finally
      Fbuscareliquidacion.Free;
   End;
End;

Procedure TFPrincipal.sbrepxtipbenClick(Sender: TObject);
Begin
   SacaMenu(Sender);
   Try
      Frepxtipben := TFrepxtipben.create(Self);
      Frepxtipben.ShowModal;
   Finally
      Frepxtipben.Free;
   End;
End;

Procedure TFPrincipal.sbrepliqxdepClick(Sender: TObject);
Begin
   SacaMenu(Sender);
   Try
      FRepliqxDpto := TFRepliqxDpto.create(Self);
      FRepliqxDpto.ShowModal;
   Finally
      FRepliqxDpto.Free;
   End;
End;

Procedure TFPrincipal.sbrepnivdevbenClick(Sender: TObject);
Begin
   SacaMenu(Sender);
   Try
      FNivApo := TFNivApo.create(Self);
      FNivApo.ShowModal;
   Finally
      FNivApo.Free;
   End;
End;

Procedure TFPrincipal.sbrepcuocrebenClick(Sender: TObject);
Begin
   SacaMenu(Sender);
   Try
      Fcuocrexben := TFcuocrexben.create(Self);
      Fcuocrexben.ShowModal;
   Finally
      Fcuocrexben.Free;
   End;
End;

Procedure TFPrincipal.sbmancardesClick(Sender: TObject);
Begin
   SacaMenu(Sender);
   Try
      Fmancardes := TFmancardes.create(Self);
      Fmancardes.ShowModal;
   Finally
      Fmancardes.Free;
   End;
End;

Procedure TFPrincipal.SpeedButton16Click(Sender: TObject);
Begin
   SacaMenu(Sender);
   Try
      FrepxtipbenCon := TFrepxtipbenCon.create(Self);
      FrepxtipbenCon.ShowModal;
   Finally
      FrepxtipbenCon.Free;
   End;
End;

Procedure TFPrincipal.SpeedButton2Click(Sender: TObject);
Begin
   SacaMenu(Sender);
   DM1.xFlg := 'M';
   Try
      FDatFam := TFDatFam.create(Self);
      FDatFam.ShowModal;
   Finally
      FDatFam.Free;
   End;
End;

Procedure TFPrincipal.sbmanlibahoClick(Sender: TObject);
Begin
   SacaMenu(Sender);
   Try
      FlibAho := TFlibAho.create(Self);
      FlibAho.ShowModal;
   Finally
      FlibAho.Free;
   End;
End;

Procedure TFPrincipal.spdReferenClick(Sender: TObject);
Begin
   SacaMenu(Sender);
   Try
      Fprimanuit := TFprimanuit.create(Self);
      Fprimanuit.ShowModal;
   Finally
      Fprimanuit.Free;
   End;
End;

Procedure TFPrincipal.spdEstBenMouseMove(Sender: TObject;
   Shift: TShiftState; X, Y: Integer);
Begin
   // Inicio: HPC_201802_PRE
   // Se modifica los datos del nuevo panel 
   // pnlResumen.Left := pnlReportes.Left - pnlResumen.Width;
   pnlResumen.Left := pnlReportes2.Left - pnlResumen.Width;
   // Fin: HPC_201802_PRE

   pnlResumen.Top := TSpeedButton(Sender).Top + TSpeedButton(Sender).Height + 10;
   pnlResumen.Visible := True;
End;

Procedure TFPrincipal.sbrepbenatextipapgMouseMove(Sender: TObject;
   Shift: TShiftState; X, Y: Integer);
Begin
   pnlResumen.Visible := False;
End;

Procedure TFPrincipal.sbrepestxsexClick(Sender: TObject);
Begin
   SacaMenu(Sender);
   Try
      FRepResSex := TFRepResSex.create(Self);
      FRepResSex.ShowModal;
   Finally
      FRepResSex.Free;
   End;
End;

Procedure TFPrincipal.spdCredPendClick(Sender: TObject);
Begin
   SacaMenu(Sender);
   Try
      Frepcrepen := TFrepcrepen.create(Self);
      Frepcrepen.ShowModal;
   Finally
      Frepcrepen.Free;
   End;
End;

Procedure TFPrincipal.spdControlClick(Sender: TObject);
Var
   xSQL: String;
Begin
   If DM1.CrgDescrip('USERID=' + QuotedStr(Trim(DM1.wUsuario)) + ' AND GRUPOID=''GRPPRE''', 'TGE007', 'GRUPOID') <> 'GRPPRE' Then Exit;
   If Copy(DM1.CrgArea(DM1.wUsuario), 6, 2) <> '03' Then Exit;
   SacaMenu(sender);
   Try
      fCtrAcceso := TfCtrAcceso.create(self);
      xSQL := 'SELECT MODULOID,AREADES FROM CRE117 WHERE MODULOID IN (''PRE'') ORDER BY MODULOID';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSQL);
      DM1.cdsQry.Open;
      xSQL := 'SELECT TABLA,GRUPO,CAMPODES FROM SIS001 WHERE COMPONENTE IS NULL AND SUBSTR(GRUPO,4,1)=''0'' AND MODULOID IN (''PRE'') ' +
              ' GROUP BY TABLA,GRUPO,CAMPODES ORDER BY TABLA,GRUPO,CAMPODES';
      DM1.cdsQry3.Close;
      DM1.cdsQry3.DataRequest(xSQL);
      DM1.cdsQry3.Open;
      xSQL := 'SELECT PERFIL,USUARIO,HREG FROM SIS002 ORDER BY PERFIL';
      DM1.cdsQry5.Close;
      DM1.cdsQry5.DataRequest(xSQL);
      DM1.cdsQry5.Open;
      fCtrAcceso.dblEqUsr.Text := 'PRE';
      fCtrAcceso.Showmodal;
   Finally
      fCtrAcceso.free;
   End;

End;

Procedure TFPrincipal.spdCueIndMouseMove(Sender: TObject;
   Shift: TShiftState; X, Y: Integer);
Begin
   pnlResumen.Visible := False;
End;

Procedure TFPrincipal.spdCueIndClick(Sender: TObject);
Begin
   SacaMenu(Sender);
   DM1.xSgr := 'R';
   // Inicio: HPC_201705_PRE
   // Se envia una variable para identificar de donde se esta ejecutando
   // el formulario.
   DM1.xpvslbennr := '';
   // Fin: HPC_201705_PRE
   Try
      Fprocueind := TFprocueind.create(Self);
      Fprocueind.ShowModal;
   Finally
      Fprocueind.Free;
   End;
End;

Procedure TFPrincipal.spbBenAnoOcuMouseMove(Sender: TObject;
   Shift: TShiftState; X, Y: Integer);
Begin
   pnlResumen.Visible := False;
End;

// Inicio: HPC_201802_PRE
// Se modifica el nombre del procedimiento
// Procedure TFPrincipal.pnlReportesMouseMove(Sender: TObject;
//   Shift: TShiftState; X, Y: Integer);
Procedure TFPrincipal.pnlReportes1MouseMove(Sender: TObject;
   Shift: TShiftState; X, Y: Integer);
// Fin: HPC_201802_PRE
Begin
   pnlResumen.Visible := False;
End;

Procedure TFPrincipal.spliqanuClick(Sender: TObject);
Begin
  // Liquidaciones anuladas
   SacaMenu(Sender);
   Try
      frepliqanu := Tfrepliqanu.create(Self);
      frepliqanu.ShowModal;
   Finally
      frepliqanu.Free;
   End;
End;

Procedure TFPrincipal.spdcueinddisClick(Sender: TObject);
Begin
   SacaMenu(Sender);
   Try
      fcueinddis := Tfcueinddis.create(Self);
      fcueinddis.ShowModal;
   Finally
      fcueinddis.Free;
   End;
End;

Procedure TFPrincipal.sbMatrizResClickClick(Sender: TObject);
Begin
   SacaMenu(Sender);
   Try
      FMatResTec := TFMatResTec.create(Self);
      FMatResTec.ShowModal;
   Finally
      FMatResTec.Free;
   End;
End;

Procedure TFPrincipal.sbCuentaIndClick(Sender: TObject);
Begin
   SacaMenu(Sender);
   //Inicio: SPP_201401_PRE
   // Try
   //  FCuentaInd := TFCuentaInd.create(Self);
   //  FCuentaInd.ShowModal;
   // Finally
   //  FCuentaInd.Free;
   // End;
   Try
      Fctaindres := TFctaindres.create(Self);
      Fctaindres.ShowModal;
   Finally
      Fctaindres.Free;
   End;
   //Fin: SPP_201401_PRE
End;

Procedure TFPrincipal.spdresliqClick(Sender: TObject);
Begin
   SacaMenu(Sender);
   Try
      Fresliqben := TFresliqben.create(Self);
      Fresliqben.ShowModal;
   Finally
      Fresliqben.Free;
   End;
End;

Procedure TFPrincipal.sbCtaIndLoteClick(Sender: TObject);
Begin
   SacaMenu(Sender);
   DM1.xSgr := 'R';
   Try
      FrmListaCtaIndBloque := TFrmListaCtaIndBloque.create(Self);
      FrmListaCtaIndBloque.ShowModal;
   Finally
      FrmListaCtaIndBloque.Free;
   End;
End;

Procedure TFPrincipal.sbReportePostReestClick(Sender: TObject);
Begin
   SacaMenu(Sender);
   DM1.xSgr := 'R';
   Try
      FRMREPORTEPOSTRESST := TFRMREPORTEPOSTRESST.create(Self);
      FRMREPORTEPOSTRESST.ShowModal;
   Finally
      FRMREPORTEPOSTRESST.Free;
   End;
End;

Procedure TFPrincipal.sbmanretClick(Sender: TObject);
Begin
   SacaMenu(Sender);
   Try
      Fmantabret := TFmantabret.create(Self);
      Fmantabret.ShowModal;
   Finally
      Fmantabret.Free;
   End;
End;

Procedure TFPrincipal.sbmaninvClick(Sender: TObject);
Begin
   SacaMenu(Sender);
   Try
      Fmantabinv := TFmantabinv.create(Self);
      Fmantabinv.ShowModal;
   Finally
      Fmantabinv.Free;
   End;
End;

Procedure TFPrincipal.sbmancapdeuClick(Sender: TObject);
Begin
   SacaMenu(Sender);
   Try
      Fmantabcapdeu := TFmantabcapdeu.create(Self);
      Fmantabcapdeu.ShowModal;
   Finally
      Fmantabcapdeu.Free;
   End;
End;

Procedure TFPrincipal.sbmansepClick(Sender: TObject);
Begin
   SacaMenu(Sender);
   Try
      Fmantabsep := TFmantabsep.create(Self);
      Fmantabsep.ShowModal;
   Finally
      Fmantabsep.Free;
   End;
End;

(******************************************************************************)

Procedure TFPrincipal.Verpercadpas;
Var
   xSql: String;
   xfecfin: TDate;
   xdiasexppass, xdiasduracpass: Integer;
   xdiasfaltantes: Integer;
   xpassact, xpassnue: String;
Begin
   //Se modifico por JCarbonel - HPP_00019_PRE
   xSql := 'SELECT TO_DATE(nvl(FECINI_PWD,sysdate)) FECINI_PWD, '
      + '       TO_DATE(nvl(FECFIN_PWD,sysdate+30)) FECFIN_PWD, '
      + '       nvl(DIASEXP_PWD,7) DIASEXP_PWD, '
      + '       nvl(DIASDURAC_PWD,30) DIASDURAC_PWD, PASSWORD '
      + '  FROM TGE006 WHERE USERID = ' + QuotedStr(DM1.wUsuario);

   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   xfecfin := DM1.cdsQry.FieldByName('FECFIN_PWD').AsDateTime;
   xdiasexppass := DM1.cdsQry.FieldByName('DIASEXP_PWD').AsInteger;
   xdiasduracpass := DM1.cdsQry.FieldByName('DIASDURAC_PWD').AsInteger;
   xpassact := DM1.cdsQry.FieldByName('PASSWORD').AsString;
   xSql := 'SELECT TO_DATE(' + QuotedStr(DateToStr(xfecfin)) + ') - TO_DATE(SYSDATE) DIASFALTANTE FROM DUAL';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   xdiasfaltantes := DM1.cdsQry.FieldByName('DIASFALTANTE').AsInteger; // dias que faltan
   If xdiasfaltantes <= xdiasexppass Then
   Begin
      If xdiasfaltantes <= 0 Then
         MessageDlg('SU CONTRASEÑA HA CADUCADO, DEBE CAMBIARLA AHORA', mtCustom, [mbOk], 0)
      Else
         If xdiasfaltantes = 1 Then
            MessageDlg('*** FALTA 1 DíA PARA EL VENCIMIENTO DE SU PASSWORD. ***'#13'                            SE SUGIERE CAMBIAR LA CONTRASEÑA', mtCustom, [mbOk], 0)
         Else
            MessageDlg('*** FALTAN ' + IntToStr(xdiasfaltantes) + ' DÍAS PARA EL VENCIMIENTO DE SU PASSWORD. ***'#13'                            SE SUGIERE CAMBIAR LA CONTRASEÑA', mtCustom, [mbOk], 0);
      DM1.cdsUser.Close;
      DM1.cdsUser.DataRequest('SELECT USERID,USERNOM,PASSWORD,FECEXP,OFDESID,CTLFAC,FLGAUT,FECINI_PWD,FECFIN_PWD,DIASEXP_PWD,DIASDURAC_PWD,CTRL_IP FROM TGE006 WHERE USERID=''' + DM1.wUsuario + '''');
      DM1.cdsUser.Open;
    // Inicio: SPP_201403_PRE       : 15/07/2014  : Cambio de DCOM a Socket
      FCPassw := TFCPassw.Create(Self);
      FCPassw.dbeUsuario.Text := DM1.wUsuario;
      FCPassw.dbeNombre.Text := DM1.cdsUser.FieldByname('USERNOM').AsString;
      FCPassw.dbeUsuario.Text := DM1.wUsuario;
      FCPassw.sPassword := DM1.cdsUser.FieldByname('PASSWORD').AsString;
      FCPassw.sModulo := DM1.wModulo;
      FCPassw.wcdsUsuarios := DM1.cdsUser;
      Try
         FCPassw.ShowModal;
      Finally
         FCPassw.Free;
      End;
// Fin: SPP_201403_PRE       : 15/07/2014  : Cambio de DCOM a Socket
      xSql := 'SELECT PASSWORD FROM TGE006 WHERE USERID = ' + QuotedStr(DM1.wUsuario);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      xpassnue := DM1.cdsQry.FieldByName('PASSWORD').AsString;
      If xpassact <> xpassnue Then
      Begin
         xSql := 'UPDATE TGE006 '
               + '   SET FECINI_PWD = TO_DATE(SYSDATE), '
               + '       FECFIN_PWD = TO_DATE(SYSDATE)+' + IntToStr(xdiasduracpass)
               + ' WHERE USERID     = ' + QuotedStr(DM1.wUsuario);
         DM1.DCOM1.AppServer.EjecutaSQL(xSql);
         Application.Terminate;
      End;
      If xdiasfaltantes <= 0 Then Application.Terminate;
   End // if xdiasfaltantes <= xdiasexppass
   Else
      If xdiasfaltantes <= 0 Then Application.Terminate;
End;
(******************************************************************************)

Procedure TFPrincipal.sbBenefxDptoUgelTipoClick(Sender: TObject);
Begin
   SacaMenu(Sender);
   Try
      FRptPagBenXTipo := TFRptPagBenXTipo.create(Self);
      FRptPagBenXTipo.ShowModal;
   Finally
      FRptPagBenXTipo.Free;
   End;
End;

Procedure TFPrincipal.sbRptCartaDesigClick(Sender: TObject);
Begin
   SacaMenu(Sender);
   Try
      FRptCartaDesignatario := TFRptCartaDesignatario.create(Self);
      FRptCartaDesignatario.ShowModal;
   Finally
      FRptCartaDesignatario.Free;
   End;

End;

Procedure TFPrincipal.spbBenAnoOcuClick(Sender: TObject);
Begin
   SacaMenu(Sender);
   Try
      Frepxtipbenxocu := TFrepxtipbenxocu.create(Self);
      Frepxtipbenxocu.ShowModal;
   Finally
      Frepxtipbenxocu.Free;
   End;
End;


Procedure TFPrincipal.sbAutxCenEduClick(Sender: TObject);
Begin
   SacaMenu(Sender);
   Try
      FrmAutxCenEdu := TFrmAutxCenEdu.create(self);
      FrmAutxCenEdu.Showmodal;
   Finally
      FrmAutxCenEdu.free;
   End;
End;

procedure TFPrincipal.spdBenCheGerClick(Sender: TObject);
begin
// se traslada de Asociados a Previsión - Cheques de gerencia de beneficios
   SacaMenu(sender);
   If DM1.CrgDescrip('USERID=' + QuotedStr(Trim(DM1.wUsuario))
       + ' AND GRUPOID=''GRPPRE''', 'TGE007', 'GRUPOID') <> 'GRPPRE' Then
   Begin
      ShowMessage('No tiene acceso a esta opción');
      Exit;
   End;

   Try
      FGenCheGerBen:= TFGenCheGerBen.create(self);
      FGenCheGerBen.Showmodal;
   Finally
      FGenCheGerBen.free;
   End;

end;

procedure TFPrincipal.sbBenefDetxDptoUgelClick(Sender: TObject);
begin
// Inicio: HPP_201105_PRE por DFERNANDEZ
   SacaMenu(Sender);
   Try
      FRptPagBenDet := TFRptPagBenDet.Create(Self);
      FRptPagBenDet.ShowModal;
   Finally
      FRptPagBenDet.Free;
   End;
// Fin: HPP_201105_PRE
end;

procedure TFPrincipal.sbHojaTrabajoCampoClick(Sender: TObject);
begin
// Inicio: DPP_201202_PRE
   SacaMenu(sender);
   Try
   // PRE530.pas
      FHojaTrabajoCampo := TFHojaTrabajoCampo.Create(self);
      FHojaTrabajoCampo.Showmodal;
   Finally
      FHojaTrabajoCampo.Free;
   End;
// Fin: DPP_201202_PRE
end;

// Inicio: SPP_201306_PRE
procedure TFPrincipal.sbrepxtipdesClick(Sender: TObject);
begin
   SacaMenu(sender);
   Try
      Frepxtipdes := TFrepxtipdes.Create(self);
      Frepxtipdes.Showmodal;
   Finally
      Frepxtipdes.Free;
   End;
end;
// Fin: SPP_201306_PRE

// Inicio: SPP_201306_PRE
procedure TFPrincipal.sbIndGestionClick(Sender: TObject);
var xSql:String;
begin
   // INICIO HPC_201610_PRE
   // ORDEN DECRECIENTE DE LOS AÑOS
   xSql := 'SELECT TO_CHAR(FECPAG,''YYYY'') AÑO FROM PVS307 WHERE FECPAG IS NOT NULL GROUP BY TO_CHAR(FECPAG,''YYYY'') ORDER BY TO_CHAR(FECPAG,''YYYY'') DESC ';
   // FIN HPC_201610_PRE
   DM1.cdsAgencias.Close;
   DM1.cdsAgencias.DataRequest(xSQL);
   DM1.cdsAgencias.Open;
   SacaMenu(sender);
   Try
      fIndGestion := TfIndGestion.Create(self);
      fIndGestion.Showmodal;
   Finally
      fIndGestion.Free;
   End;
end;
// Fin: SPP_201306_PRE

//Inicio: SPP_201401_PRE
procedure TFPrincipal.sbliqxTipBenClick(Sender: TObject);
begin
   // Inicio: HPC_201706_PRE
   // Se pone en invisible el menú "Reportes y Estadisticos" antes de ingresar a la opción.
   SacaMenu(Sender);
   // Fin: HPC_201706_PRE
   Try
      FLiqxTipBen := TFLiqxTipBen.Create(self);
      FLiqxTipBen.Showmodal;
   Finally
      FLiqxTipBen.Free;
   End;
end;
//Fin: SPP_201401_PRE

// Inicio: SPP_201403_PRE
procedure TFPrincipal.sbresliqconCADAPSClick(Sender: TObject);
begin
   Try
      FresliqconCADAPS := TFresliqconCADAPS.Create(self);
      FresliqconCADAPS.Showmodal;
   Finally
      FresliqconCADAPS.Free;
   End;
end;
// Fin: SPP_201403_PRE

// Inicio: HPC_201508_PRE
// Se añade procedimiento que llama a la opción Aplicación CCI
procedure TFPrincipal.sbAsoAplCCIClick(Sender: TObject);
begin
   SacaMenu(Sender);
   Try
      FbAsoAplCCI := TFbAsoAplCCI.Create(self);
      FbAsoAplCCI.Showmodal;
   Finally
      FbAsoAplCCI.Free;
   End;
end;
// Fin: HPC_201508_PRE

// INICIO HPC_201509_PRE
(******************************************************************************)
procedure TFPrincipal.btnMantenimientoCausaCeseClick(Sender: TObject);
begin
 SacaMenu(Sender);
   Try
      FrmMantenimientoCausaCese := TFrmMantenimientoCausaCese.Create(self);
      FrmMantenimientoCausaCese.Showmodal;
   Finally
      FrmMantenimientoCausaCese.Free;
   End;
end;

(******************************************************************************)
// FIN HPC_201509_PRE


// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
procedure TFPrincipal.sbContaExtornoClick(Sender: TObject);
begin
 SacaMenu(Sender);
   Try
      FContaExtorno := TFContaExtorno.Create(self);
      FContaExtorno.Showmodal;
   Finally
      FContaExtorno.Free;
   End;
end;
// Fin    HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios

// Inicio: HPC_201705_PRE
// procedimiento para ejecutar los dos nuevos formularios
procedure TFPrincipal.sbextrepdesembolsoClick(Sender: TObject);
begin
   SacaMenu(Sender);
   Try
      FExtRepDes := TFExtRepDes.Create(self);
      FExtRepDes.Showmodal;
   Finally
      FExtRepDes.Free;
   End;
end;

procedure TFPrincipal.spdespagypenpagClick(Sender: TObject);
begin
   SacaMenu(Sender);
   Try
      Fdespagypenpag := TFdespagypenpag.Create(self);
      Fdespagypenpag.Showmodal;
   Finally
      Fdespagypenpag.Free;
   End;
end;

procedure TFPrincipal.spdocxedadysexoClick(Sender: TObject);
begin
   SacaMenu(Sender);
   Try
      Fasoxedadysexo := TFasoxedadysexo.Create(self);
      Fasoxedadysexo.Showmodal;
   Finally
      Fasoxedadysexo.Free;
   End;
end;
// Fin: HPC_201705_PRE

// Inicio: HPC_201709_PRE
// Procedimientos de llamado a lasformas "Liquidaciones por causas de cese" y "Hojas de cargo" 
procedure TFPrincipal.sprepcausaceseClick(Sender: TObject);
begin
   SacaMenu(Sender);
   Try
      Frepcausacese := TFrepcausacese.Create(self);
      Frepcausacese.Showmodal;
   Finally
      Frepcausacese.Free;
   End;
end;

procedure TFPrincipal.sprephojcarClick(Sender: TObject);
begin

   SacaMenu(Sender);
   Try
      Frephojcar := TFrephojcar.Create(self);
      Frephojcar.Showmodal;
   Finally
      Frephojcar.Free;
   End;

end;
// Fin: HPC_201709_PRE

// Inicio HPC_201801_PRE
// Generación de Reporte de Cesantes sin Liquidación
procedure TFPrincipal.sbCesantesSinLiquiMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   // Inicio: HPC_201802_PRE
   // Se modifica el nombre del panel
   // pnlCesantesSinLiquidacion.Left := pnlReportes.Left + pnlReportes.Width - 20;
   pnlCesantesSinLiquidacion.Left := pnlReportes2.Left + pnlReportes2.Width - 20;
   // Fin: HPC_201802_PRE
   pnlCesantesSinLiquidacion.Top := TSpeedButton(Sender).Top + TSpeedButton(Sender).Height + 10;
   pnlCesantesSinLiquidacion.BringToFront;
   pnlCesantesSinLiquidacion.Visible := True
end;
// Fin HPC_201801_PRE

// Inicio HPC_201801_PRE
// Generación de Reporte de Cesantes sin Liquidación
procedure TFPrincipal.sbCesantesSinLiquiClick(Sender: TObject);
begin
   SacaMenu(sender);
   If pnlCesantesSinLiquidacion.Visible Then
      pnlCesantesSinLiquidacion.Visible := False
   Else
      pnlCesantesSinLiquidacion.Visible := True;
   // Inicio: HPC_201802_PRE
   // Se modifica el nombre del panel
   // pnlCesantesSinLiquidacion.Left := pnlReportes.Left + pnlReportes.Width - 20;
   pnlCesantesSinLiquidacion.Left := pnlReportes2.Left + pnlReportes2.Width - 20;
   // Fin: HPC_201802_PRE
   pnlCesantesSinLiquidacion.Top := TSpeedButton(Sender).Top + TSpeedButton(Sender).Height + 10;
end;
// Fin HPC_201801_PRE

// Inicio HPC_201801_PRE
// Generación de Reporte de Cesantes sin Liquidación
procedure TFPrincipal.spdespagypenpagMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    pnlCesantesSinLiquidacion.Visible := False
end;
// Fin HPC_201801_PRE

// Inicio HPC_201801_PRE
// Generación de Reporte de Cesantes sin Liquidación
procedure TFPrincipal.spdocxedadysexoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    pnlCesantesSinLiquidacion.Visible := False
end;
// Fin HPC_201801_PRE

// Inicio HPC_201801_PRE
// Generación de Reporte de Cesantes sin Liquidación
procedure TFPrincipal.sbProgramarReporteClick(Sender: TObject);
begin
   SacaMenu(Sender);
   Try
      ProgCesaSinLiqui := TProgCesaSinLiqui.Create(self);
      ProgCesaSinLiqui.Showmodal;
   Finally
      ProgCesaSinLiqui.Free;
   End;
end;
// Fin HPC_201801_PRE

// Inicio HPC_201801_PRE
// Generación de Reporte de Cesantes sin Liquidación
procedure TFPrincipal.sbVisorProgramacionClick(Sender: TObject);
begin
   SacaMenu(Sender);
   Try
      VisorProgCesaSinLiqui := TVisorProgCesaSinLiqui.Create(self);
      VisorProgCesaSinLiqui.Showmodal;
   Finally
      VisorProgCesaSinLiqui.Free;
   End;
end;
// Fin HPC_201801_PRE

// Inicio HPC_201801_PRE
// Generación de Reporte de Cesantes sin Liquidación
procedure TFPrincipal.sbReportesCesantesClick(Sender: TObject);
begin
   SacaMenu(Sender);
   Try
      ReportesCesaSinLiqui := TReportesCesaSinLiqui.Create(self);
      ReportesCesaSinLiqui.Showmodal;
   Finally
      ReportesCesaSinLiqui.Free;
   End;
end;
// Fin HPC_201801_PRE

// Inicio HPC_201801_PRE
// Generación de Reporte de Cesantes sin Liquidación
procedure TFPrincipal.sprepcausaceseMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  pnlCesantesSinLiquidacion.Visible := False
end;
// Fin HPC_201801_PRE

// Inicio HPC_201801_PRE
// Generación de Reporte de Cesantes sin Liquidación
procedure TFPrincipal.sprephojcarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   pnlCesantesSinLiquidacion.Visible := False
end;
// Fin HPC_201801_PRE


// Inicio: HPC_201802_PRE
// Nuevos procedimientos para controlar el menu principal del sistema
procedure TFPrincipal.sbprogdesemClick(Sender: TObject);
begin
   SacaMenu(Sender);
   Try
      FProgDesembolso := TFProgDesembolso.Create(self);
      FProgDesembolso.Showmodal;
   Finally
      FProgDesembolso.Free;
   End;
end;

procedure TFPrincipal.Z1Reportes2Click(Sender: TObject);
begin
   pnlReportes2.Left := TSpeedButton(Sender).Left + 10;
   pnlReportes2.Top := TSpeedButton(Sender).Top + TSpeedButton(Sender).Height;
   pnlReferencias.Visible := False;
   pnlMovimientos.Visible := False;
   pnlProcesos.Visible := False;
   pnlReportes1.Visible := False;
   pnlReportes2.Visible := True;
end;

procedure TFPrincipal.Z1Reportes2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   pnlReportes2.Left := TSpeedButton(Sender).Left + 10;
   pnlReportes2.Top := TSpeedButton(Sender).Top + TSpeedButton(Sender).Height;
   pnlReferencias.Visible := False;
   pnlMovimientos.Visible := False;
   pnlProcesos.Visible := False;
   pnlReportes1.Visible := False;
   pnlReportes2.Visible := True;
   pnlCesantesSinLiquidacion.Visible := False
end;

procedure TFPrincipal.sbliqxofiintMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   pnlCesantesSinLiquidacion.Visible := False
end;

procedure TFPrincipal.sbliqxofiintClick(Sender: TObject);
begin
   SacaMenu(Sender);
   Try
      Fliqxofiint := TFliqxofiint.Create(self);
      Fliqxofiint.Showmodal;
   Finally
      Fliqxofiint.Free;
   End;
end;
// Fin: HPC_201802_PRE

// Inicio: HPC_201804_PRE
// Procedimiento para la ejecución de la nueva forma de "Reportes de liquidaciones RG"
procedure TFPrincipal.sprepliqRGClick(Sender: TObject);
begin
   SacaMenu(Sender);
   Try
      FRepLiqRG := TFRepLiqRG.Create(self);
      FRepLiqRG.Showmodal;
   Finally
      FRepLiqRG.Free;
   End;
end;
// Fin: HPC_201804_PRE
// INICIO HPC_201808_PRE
// Jerarquía del módulo del Control de Ticket
procedure TFPrincipal.btnAsignaClick(Sender: TObject);
var
  xSQL:String;
begin
  xSQL:='SELECT OPERACION FROM ASO_TICKETS_PANTALLA WHERE OFICINA='+QuotedStr(DM1.xOfiDes);
  DM1.cdsQry26.close;
  DM1.cdsQry26.DataRequest(xSQL);
  DM1.cdsQry26.open;
  dblPantalla.LookupTable := DM1.cdsQry26;
  pnlAsignacion.Visible:=true;
  pnlVentanilla.Enabled:=false;

  If Length(trim(sNumVenta))>0 Then
  begin
    btnOK.Enabled       := False;
    estNumVen.Enabled   := False;
    dblPantalla.Enabled := False;
    btnLimpiar.Enabled  := True;
  end
  else
  begin
    btnOK.Enabled       := True;
    estNumVen.Enabled   := True;
    dblPantalla.Enabled := True;
    btnLimpiar.Enabled  := False;
  end;

  estNumVen.Text:= sNumVenta;
  dblPantalla.Text:= sPantalla;
end;

procedure TFPrincipal.btnIniAtencionClick(Sender: TObject);
var
  xSQL: String;
begin
    xSQL:='SELECT FLGATE FROM TICKET_MOD_CTRL_VEN_MOV '+
          ' WHERE OFIDES='+QuotedStr(DM1.xOfiDes)+
          ' AND PANTALLA='+QuotedStr(sPantalla)+
          ' AND NUMVEN='+QuotedStr(sNumVenta)+
          ' AND TIPOPE='+QuotedStr(DM1.wModulo)+
          ' AND USUVEN='+QuotedStr(dm1.wUsuario)+
          ' AND TRUNC(FECATE) = TRUNC(SYSDATE)';
    DM1.cdsqry.close;
    DM1.cdsqry.DataRequest(xSQL);
    DM1.cdsqry.open;
    If (DM1.cdsQry.FieldByname('FLGATE').AsString)='V' Then
    Begin
       xsql:='UPDATE TICKET_MOD_CTRL_VEN_MOV SET FLGATE=''M'' '+
             ' WHERE OFIDES='+QuotedStr(DM1.xOfiDes)+
             ' AND PANTALLA='+QuotedStr(sPantalla)+
             ' AND NUMVEN='+QuotedStr(sNumVenta)+
             ' AND TIPOPE='+QuotedStr(DM1.wModulo)+
             ' AND USUVEN='+QuotedStr(dm1.wUsuario)+
             ' AND TRUNC(FECATE) = TRUNC(SYSDATE)';
       DM1.DCOM1.AppServer.EjecutaSQL(xSql);
       SEMAFORO.Brush.Color := clRed;
       btnIniAtencion.Enabled:=False;
       btnFinAtencion.Enabled:=True;
       Desbloqueamenu;
    End;
end;

procedure TFPrincipal.btnFinAtencionClick(Sender: TObject);
var
  xSQL: String;
begin
   Try
      xSQL:='UPDATE TICKET_MOD_CTRL_VEN_MOV SET FLGATE=''V'''+
          ' WHERE OFIDES='+QuotedStr(DM1.xOfiDes)+
          ' AND PANTALLA='+QuotedStr(sPantalla)+
          ' AND NUMVEN='+QuotedStr(sNumVenta)+
          ' AND TIPOPE='+QuotedStr(DM1.wModulo)+
          ' AND USUVEN='+QuotedStr(dm1.wUsuario)+
          ' AND TRUNC(FECATE) = TRUNC(SYSDATE)';
      DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
      SEMAFORO.Brush.Color := clLime;
      bloqueamenu;
      btnIniAtencion.Enabled:=True;
      btnFinAtencion.Enabled:=False;
   Except
      Desbloqueamenu;
      ShowMessage( 'Error al Terminar la atención');
   End;
end;

procedure TFPrincipal.btnOKClick(Sender: TObject);
var
  xSQL: String;
begin
  If Length(trim(estNumVen.Text))=0 Then
  begin
    ShowMessage('El módulo no tiene ventanilla asignada');
    exit;
  end;

  If Length(trim(dblPantalla.Text))=0 Then
  begin
    ShowMessage('Debe ingresar la Pantalla de Visualización');
    exit;
  end;

  xSQL:='SELECT OFDESID,USERID,PANTALLA,VENTANILLA,OPERACION,FECREG FROM TICKET_ASG_VEN_MOD_USU '
       +' WHERE OFDESID='+QuotedStr(DM1.xOfiDes)+ ' AND USERID='+QuotedStr(Trim(DM1.wUsuario))+' AND OPERACION='+QuotedStr(DM1.wModulo)+' '
       +' AND PANTALLA='+QuotedStr(dblPantalla.Text)+'  AND VENTANILLA='+QuotedStr(Trim(estNumVen.Text)) ;
  DM1.cdsQry27.Close;
  DM1.cdsQry27.DataRequest(xSQL);
  DM1.cdsQry27.Open;
  If  DM1.cdsQry27.RecordCount>0 Then
  Begin
     ShowMessage('Modulo ya esta asignado a la ventanilla');
     exit;
  End;
  DM1.cdsQry27.Close;


  xSQL:='Select COUNT(1) ASIGNADOS FROM TICKET_MOD_CTRL_VEN_MOV '+
        ' WHERE OFIDES='+QuotedStr(DM1.xOfiDes)+
        ' AND PANTALLA='+QuotedStr(dblPantalla.Text)+
        ' AND   NUMVEN='+QuotedStr(estNumVen.Text)+
        ' AND   USUVEN='+QuotedStr(dm1.wUsuario)+
        ' AND TRUNC(FECATE) = TRUNC(SYSDATE)' +
        ' AND FLGATE IS NOT NULL ';
  DM1.cdsQry27.Close;
  DM1.cdsQry27.DataRequest(xSQL);
  DM1.cdsQry27.Open;

  If  DM1.cdsQry27.Fieldbyname('ASIGNADOS').AsInteger>0 Then
  BEGIN
      XSQL:= 'INSERT INTO TICKET_MOD_CTRL_VEN_MOV (OFIDES,PANTALLA, NUMVEN, TIPOPE, USUVEN, FECATE, FLGATE) VALUES ('+
             QuotedStr(DM1.xOfiDes)+','+QuotedStr(dblPantalla.Text)+','+QuotedStr(estNumVen.Text)+','+
             QuotedStr(DM1.wModulo)+','+QuotedStr(DM1.wUsuario)+',SYSDATE,'+QuotedStr('V')+')';
      DM1.DCOM1.AppServer.EjecutaSQL(xSQL);             
  END;
        

  xSQL:='Insert Into TICKET_ASG_VEN_MOD_USU(OFDESID,USERID,PANTALLA,VENTANILLA,OPERACION,FECREG) '
       +' Values('+QuotedStr(DM1.xOfiDes)+','+QuotedStr(Trim(DM1.wUsuario))+','+QuotedStr(dblPantalla.Text)+','
       + QuotedStr(Trim(estNumVen.Text))+','+QuotedStr(DM1.wModulo)+',sysdate)';
   DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
   sNumVenta := Trim(estNumVen.Text);
   sPantalla := Trim(dblPantalla.Text);


  If (length(sNumVenta)>0) And (length(sPantalla)>0) Then
  Begin
      lblNumVentanilla.Caption := 'De la Ventanilla '+sNumVenta+' -> '+sPantalla;
      pnlVentanilla.Width:=204;
      pnlVentanilla.Height:=135;
      pnlVentanilla.Enabled:=true;
      pnlAsignacion.Visible:=false;
      dblPantalla.LookupTable := nil;
      btnFinAtencion.Enabled:=False;
      bloqueamenu;
  End;
  dblPantalla.LookupTable := nil;
end;

procedure TFPrincipal.btnLimpiarClick(Sender: TObject);
begin
  If Length(trim(estNumVen.Text))=0 Then
  begin
    ShowMessage('El módulo no tiene ventanilla asignada');
    exit;
  end;
  pnlDesasignar.Top:=532;
  pnlDesasignar.Left:=205;
  pnlDesasignar.Visible:=true;
  pnlAsignacion.Visible:=false;
  edtUsuario.Text:='';
  edtPassword.Text:='';
  dblPantalla.LookupTable := nil;
end;

procedure TFPrincipal.btnCancelClick(Sender: TObject);
begin
  pnlVentanilla.Enabled:=true;
  pnlAsignacion.Visible:=false;
  dblPantalla.LookupTable := nil;
end;

procedure TFPrincipal.btnDesasignarOKClick(Sender: TObject);
var
  xSQL:String;
  v_SOAP_CLIENT : WSAutenticacionSoap;
  AutenticarIntranetResult:Boolean;
  param1,param2,param3,param4,param5,param6 :WideString;
begin

      param1:= WideString(edtUsuario.Text);
      param2:= WideString(UpperCase(edtPassword.text));
      Param3:= WideString('');
      param6:= WideString('');

      v_SOAP_CLIENT:=GetWSAutenticacionSoap(true,DM1.CrgDescrip('CODURL=' + QuotedStr('AUTORIZACION'), 'URL_WS_MAE', 'URL'),nil);
      v_SOAP_CLIENT.AutenticarIntranet(param1,param2,param3,param6,AutenticarIntranetResult,param4,param5);

      If (AutenticarIntranetResult) Then
      begin

        DM1.xOfiDes := DM1.CrgDescrip('USERID=' + QuotedStr(Trim(DM1.wUsuario)), 'TGE006', 'OFDESID');      
       xSQL:='DELETE TICKET_MOD_CTRL_VEN_MOV '+
             ' WHERE OFIDES='+QuotedStr(DM1.xOfiDes)+
             ' AND PANTALLA='+QuotedStr(sPantalla)+
             ' AND NUMVEN='+QuotedStr(sNumVenta)+
             ' AND TIPOPE='+QuotedStr(DM1.wModulo)+
             ' AND USUVEN='+QuotedStr(dm1.wUsuario);
             DM1.DCOM1.AppServer.EjecutaSQL(xSQL);

         xSQL:='DELETE TICKET_ASG_VEN_MOD_USU  '
              +' WHERE OFDESID='+QuotedStr(DM1.xOfiDes)+ ' AND USERID='+QuotedStr(Trim(DM1.wUsuario))+' AND OPERACION='+QuotedStr(DM1.wModulo)+' '
              +' AND PANTALLA='+QuotedStr(dblPantalla.Text)+'  AND VENTANILLA='+QuotedStr(Trim(estNumVen.Text)) ;
        DM1.DCOM1.AppServer.EjecutaSQL(xSQL);

        sNumVenta:='';
        sPantalla:='';
        Desbloqueamenu;
        lblNumVentanilla.Caption := 'Sin Asignación de Ventanilla';
        pnlVentanilla.Width:=179;
        pnlVentanilla.Height:=62;
        pnlVentanilla.Enabled:=true;
        pnlAsignacion.Visible:=false;
        pnlDesasignar.Visible:=false;
        dblPantalla.LookupTable := nil;
      End
      Else
      Begin
        MessageDlg('USUARIO Y/O CONTRASEÑA INCORRECTA', mtError, [mbYes], 0);
        Exit;
      End;
end;

procedure TFPrincipal.btnDesasignarCancelClick(Sender: TObject);
begin
  pnlAsignacion.Visible:=true;
  pnlDesasignar.Visible:=false;
end;

procedure TFPrincipal.bloqueamenu;
begin
  Z1sbReglas.Enabled      := False;
  Z1Reportes1.Enabled     := False;
  Z1Reportes2.Enabled     := False;
  Z1sbProcesos.Enabled    := False;
  Z1sbMovimientos.Enabled := False;
  Z1sbReglas.Enabled      := False;
  Z1sbSalida.Enabled      := True;
end;

procedure TFPrincipal.Desbloqueamenu;
begin
  Z1sbReglas.Enabled      := True;
  Z1Reportes1.Enabled     := True;
  Z1Reportes2.Enabled     := True;
  Z1sbProcesos.Enabled    := True;
  Z1sbMovimientos.Enabled := True;
  Z1sbReglas.Enabled      := True;
  If SEMAFORO.Brush.Color = clRed Then  Z1sbSalida.Enabled := False;
end;
// FIN HPC_201808_PRE

Initialization
   registerclasses([TLabel, TBevel, TppLabel]);
End.

