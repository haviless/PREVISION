Unit PREDM;
// Inicio Uso Estándares: 01/08/2011
// Unidad : Previsión Social
// Formulario : TDM1
// Fecha de Creación : 08/08/2011
// Autor : Sistemas
// Objetivo : Modulo de Datos
// Actualizaciones
// HPP_200902_PRE     : rutina calculaNivDev -- DM1.cdsNivApo.FieldByName('FILA').AsString := DM1.cdsAportes.FieldByName('FILA').AsString;
//                      SAR2009JC-0102 : 10/02/2009
//                      MEMO 053-2009-DM-EPS : 04/02/2009
// HPP_200903_PRE     SAR2009-0203
// HPP_200906_PRE realizado por IREVILLA - SAR2009-0406 -- Según SAR se solicita quitar las devoluciones anteriores a la fecha de cese.
// HPC_201003_PRE     SAR-2009-0984
// HPP_201005_PRE
// HPP_201104_PRE
   // rutina calculaNivDev
   // POR:IREVILLA 27/07/2011
   // MODIFICACION: EN LA TABLA DE APORTES (APO301)
   // CUANDO EXISTIA MAS DE UN REGISTRO POR AÑO Y MES (MAS DE UN PAGO EN UN SOLO PERIODO)
   // EL QRY GENERABA UNA NIVELACION POR CADA REGISTRO ADICIONAL
   // SOLUCION: SE CREA UN ALIAS PARA EL APO301 EN EL CUAL SE SUMA TODOS LOS APORTES Y SE AGRUPA POR TRANSANO, TRANSMES

// HPC_201202_PRE     : 10/02/20002 Desactiva lectura de Foto y Firma de FTP, lee de archivo RENIEC
// DPP_201201_PRE     : Se realiza el pase a producción de acuerdo al HPC_201202_PRE
// HPC_201204_PRE     : 08/05/2012 Se modifica el calculo de la retencion judicial. Se incluye retención por monto.
// DPP_201204_PRE     : Se realiza el pase a producción a partir del pase HPC_201204_PRE
// HPC_201205_PRE     : 22/05/2012 Se descuenta todos los créditos pendientes hasta donde el beneficio del asociado lo permita.
// HPC_201207_PRE
   // -- Se modifica el procedimiento "calculacreditos".
   // -- Se modifica el procedimiento "Grabacreditos".
   // -- Se añade el procedimiento "RegistraSuceso". Este procedimiento registra en la tablas aso_fac_ges_det y aso_fac_ges_cab.
   //    a los asociados que han solicitado su liquidación de beneficio por fallecimiento o invalidez.
// DPP_201207_PRE     : Se realiza el pase a producción a partir del HPC_201207.
// HPC_201208_PRE     : Calculo de la cuenta individual (Si DM1.montodiferencial < 0 => queda en 0.
//                      Se toma los montos 'DESCUENTO POR PRESTAMO EFECTUADO' y 'SALDO DE LA DEUDA DESPUES DE LA LIQUIDACION' desde COB_POLITICA_CUO_GTT
// DPP_201208_PRE     : Se realiza el pase a producción a partir del HPC_201208.
// HPC_201209_PRE     : Añadir nueva forma de pago
// HPC_201211_PRE     : Se Controla que la fecha de autorización de descuento de aportes sea menor que la fecha de cese.
//                      * Para los casos de Fallecimiento e Invalidez. Si la fecha de autorización de descuento de aportes es mayor a la fecha de cese
//                      * solo se pagara cuenta invididual (Tambien tomar en cuenta que para estos casos ya no se cobrara nivelación de Aportes
// DPP_201209_PRE     : Se realiza el pase a produccion a partir del HPC_201211_PRE
// HPC_201302_PRE     : Se Modifica modelo de impresión de la liquidación de beneficios
//                      En las glosas "DATOS GENERALES PARA EL CALCULO DE BENEFICIO" y "DETALLE DE CALCULO DE BENEFICIO"
// SPP_201303_PRE     : El pase a producción se realiza a partir del HPC_201302_PRE
// HPC_201304_PRE     : Procedimiento RepartePorcentaje se añadem a Sobrinos y Otros
//                      Se modifica procedimiento para exportar a excel
// SPP_201305_PRE     : Se realiza el pase a producción a partir del HPC_201304_PRE
// HPC_201305_PRE     : Se modifica la función Carga "CargaImagenes". Se toma el valor del parametro que se recepciona.
// SPP_201306_PRE     : Se realiza el pase a producción a partir del HPC_201305_PRE
// HPC_201306_PRE     : Se modifica la forma de calculo de la liquidación en caso de invalidez, según lo solicitado en el MEMO Nº 403-2013-DM-EPS
//                      En la hoja de liquidación de beneficios en la glosa bbservaciobes. Se añade el mensaje "NO APLICA BENEFICIO POR XXX POR NO CUMPLIR"
//                      CON LO ESTABLECIDO EN EL REGLAMENTO DE OPERACIONES DE PREVISION SOCIAL ART.º 22; SE PAGA SALDO SE LA CUENTA INDIVIDUAL.
// SPP_201307_PRE     : Se realiza el pase a producción a partir del HPC_201306_PRE.
// HPC_201307_PRE     : Se añaden client data set (cdsSegEstExp, cdsSegSitExp)
// SPP_201401_PRE     : Se realiza el pase a producción a partir del pase HPC_201307_PRE
// HPC_201402_PRE     : Se añade apellido de casada.
// HPC_201402_PRE     : Cambio de DCOM a Socket.
// SPP_201403_PRE     : Se realiza el pase a producción a partir del pase HPC_201402_PRE.
// HPC_201504_PRE     : Descuentos por aplicaciones de CCI
// HPC_201505_PRE     : Agregar en Consultas aplicaciones de CCI
// HPC_201506_PRE     : Se añade en la Glosa de "Detalles del Calculo de Beneficio" de la hoja de liquidación de beneficios, el total de la cuenta individual
//                      Se añade en la Glosa de "Observaciones" de la hoja de liquidación de beneficios, en la fila del saldo del credito. La fecha de la liquidación.
//                      Se añade en la Glosa de "Observaciones" de la hoja de liquidación de beneficios, mensaje indicando el estado de la aplicación del FPD
// HPC_201507_PRE    : Se modifica el calculo del "SALDO TOTAL DE LA DEUDA DESPUES DE LA LIQUIDACION"
// HPC_201508_PRE    : Se retira la observacion en liquidación con fecha de cese antes de febrero 2007 (MEMO Nº 406-2015-DM-EPS) 
// HPC_201509_PRE : Categorizar Causas de Cese
// HPC_201602_PRE : DESHABILITAR EL CRUCE CON EL PADRON MINEDU EN LA HOJA DE TRABAJO DE CAMPO
// HPC_201603_PRE : AGREGAR REINGRESANTES EN CARTA DE DESIGNATARIOS
// HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
// HPC_201606_PRE : Adición de Variables publicas genereales
// HPC_201607_PRE : Se añade impresion de Dpartamento / Oicina de origen en la glosa Obervación en la hoja de
//
// HPC_201609_PRE : Se controla el solicitar DNI o no para los casos de tipo de relación "Otros".                  liquidación de beneficios
// HPC_201610_PRE : CREAR Y MODIFICAR INDICADORES DE CALIDAD
// HPC_201703_PRE : Se actualizan campo email del asociado, familiar o designatario
//                  Se modifica los calculos de las nivelacion y devoluciones de las liquidaciones
// HPC_201704_PRE : Se modifica el procedimiento del calculo CCI
// HPC_201706_PRE : Se corrige error al momento de insertar registro del CCI
// HPC_201709_PRE : Se modifican los formatos de la fechas para exportar a excel
// HPC_201801_PRE : Generación de Reporte de Cesantes sin Liquidación
// HPC_201802_PRE : Se modifica los procedimientos que controlan las formas de pago, con la
//                  finalidad de acondicionar para las liquidaciones por oficio. 
// HPC_201805_PRE : Se modifica procedimiento para el calculo de las nivelacion y devoluciones
//                  en las reliquidaciones
// HPC_201806_PRE : Se corrige error al momento de calcular las devoluciones y/o nivelaciones de aportes
// HPC_201809_PRE : Se modifica procedimiento para controlar la captura de datos de RENIEC,
//                  se retira validación de datos socioeconomicos

Interface
Uses
// Inicio: SPP_201403_PRE    15/07/2014  : Cambio de DCOM a Socket
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Db, DBClient, wwclient, Wwdatsrc, MConnect, RecError, Variants, dateutils,
   ExcelXP, comctrls, INIFiles, DBTables, Wwquery, DBGrids,
   Excel2000, OleServer, IdBaseComponent, IdComponent, IdTCPConnection,
   IdTCPClient, IdFTP, wwdbedit, fcLabel, StdCtrls, ControlGridDisp,
   ExtCtrls, Buttons, ToolWin, wwDBigrd, Mant, ppCtrls,
   wwexport, shellapi, DBCtrls, Grids, Wwdbgrid, jpeg, rxgif,
   // INICIO HPC_201610_PRE
   // DECLARACION DE PAQUETES
   SConnect, Sockets, winsock,
   // Inicio: HPC_201809_PRE
   // Se añaden unidades para controlar nuevas opciones
   // Math, ComObj;
   Math, ComObj, ImageDLLLoader, FileCtrl, ObjBrkr, StrContainer;
   // Fin: HPC_201809_PRE

   // FIN HPC_201610_PRE
// Fin: SPP_201403_PRE    15/07/2014  : Cambio de DCOM a Socket

Type
   TDM1 = Class(TDataModule)
// Inicio: SPP_201403_PRE    15/07/2014  : Cambio de DCOM a Socket
      //DCOM1: TDCOMConnection;
// Fin: SPP_201403_PRE       15/07/2014  : Cambio de DCOM a Socket
      dsAcceso: TwwDataSource;
      cdsAcceso: TwwClientDataSet;
      cdsUsuarios: TwwClientDataSet;
      dsUsuarios: TwwDataSource;
      cdsGrupos: TwwClientDataSet;
      dsGrupos: TwwDataSource;
      cdsMGrupo: TwwClientDataSet;
      dsMGrupo: TwwDataSource;
      cdsReporte: TwwClientDataSet;
      dsReporte: TwwDataSource;
      cdsQry: TwwClientDataSet;
      dsQry: TwwDataSource;
      cdsMaestCartas: TwwClientDataSet;
      dsMaestCartas: TwwDataSource;
      cdsDetCartas: TwwClientDataSet;
      dsDetCartas: TwwDataSource;
      cdsTipoMoneda: TwwClientDataSet;
      cdsSexo: TwwClientDataSet;
      cdsResultSet: TwwClientDataSet;
      dsTipoMoneda: TwwDataSource;
      dsSexo: TwwDataSource;
      cdsEstCarta: TwwClientDataSet;
      dsEstCarta: TwwDataSource;
      cdsSituacAsoc: TwwClientDataSet;
      cdsTipoAsoc: TwwClientDataSet;
      dsSituacAsoc: TwwDataSource;
      dsTipoAsoc: TwwDataSource;
      cdsTRelacion: TwwClientDataSet;
      dsTRelacion: TwwDataSource;
      cdsMaestRetJud: TwwClientDataSet;
      dsMaestRetJud: TwwDataSource;
      cdsDetRetJud: TwwClientDataSet;
      dsDetRetJud: TwwDataSource;
      cdsDpto: TwwClientDataSet;
      dsDpto: TwwDataSource;
      cdsBanco: TwwClientDataSet;
      dsBanco: TwwDataSource;
      cdsAsociado: TwwClientDataSet;
      dsAsociado: TwwDataSource;
      cdsExpLiq: TwwClientDataSet;
      dsExpLiq: TwwDataSource;
      cdsNacionalidad: TwwClientDataSet;
      dsNacionalidad: TwwDataSource;
      cdsUPro: TwwClientDataSet;
      dsUPro: TwwDataSource;
      cdsUSES: TwwClientDataSet;
      dsUSES: TwwDataSource;
      cdsUPago: TwwClientDataSet;
      dsUPago: TwwDataSource;
      cdsTDoc: TwwClientDataSet;
      dsTDoc: TwwDataSource;
      cdsCtasBco: TwwClientDataSet;
      dsCtasBco: TwwDataSource;
      cdsSitCta: TwwClientDataSet;
      dsSitCta: TwwDataSource;
      cdsTipBenef: TwwClientDataSet;
      dsTipBenef: TwwDataSource;
      cdsProvincia: TwwClientDataSet;
      dsProvincia: TwwDataSource;
      cdsRegPension: TwwClientDataSet;
      dsRegPension: TwwDataSource;
      cdsCEdu: TwwClientDataSet;
      dsCEdu: TwwDataSource;
      cdsDist: TwwClientDataSet;
      dsDist: TwwDataSource;
      cdsDFam: TwwClientDataSet;
      dsDFam: TwwDataSource;
      cdsTipoResol: TwwClientDataSet;
      dsTipoResol: TwwDataSource;
      cdsAportes: TwwClientDataSet;
      dsAportes: TwwDataSource;
      dsCuentaEst: TwwDataSource;
      cdsCuentaEst: TwwClientDataSet;
      cdsBcos: TwwClientDataSet;
      dsBcos: TwwDataSource;
      cdsTVia: TwwClientDataSet;
      dsTVia: TwwDataSource;
      cdsTZona: TwwClientDataSet;
      dsTZona: TwwDataSource;
      cdsQry2: TwwClientDataSet;
      dsQry2: TwwDataSource;
      cdsQry3: TwwClientDataSet;
      dsQry3: TwwDataSource;
      cdsFPago: TwwClientDataSet;
      dsFPago: TwwDataSource;
      cdsOfDes: TwwClientDataSet;
      dsOfDes: TwwDataSource;
      cdsTipDesemb: TwwClientDataSet;
      dsTipDesemb: TwwDataSource;
      cdsCabLiq: TwwClientDataSet;
      dsCabLiq: TwwDataSource;
      cdsDetLiq: TwwClientDataSet;
      dsDetLiq: TwwDataSource;
      cdsCreditos: TwwClientDataSet;
      dsCreditos: TwwDataSource;
      cdsCuotas: TwwClientDataSet;
      dsCuotas: TwwDataSource;
      cdsQry4: TwwClientDataSet;
      dsQry4: TwwDataSource;
      cdsQry5: TwwClientDataSet;
      dsQry5: TwwDataSource;
      cdsQry6: TwwClientDataSet;
      dsQry6: TwwDataSource;
      cdsQry7: TwwClientDataSet;
      dsQry7: TwwDataSource;
      cdsQry8: TwwClientDataSet;
      dsQry8: TwwDataSource;
      dsQry9: TwwDataSource;
      cdsQry9: TwwClientDataSet;
      dsQry10: TwwDataSource;
      cdsQry10: TwwClientDataSet;
      cdsAgBco: TwwClientDataSet;
      dsAgBco: TwwDataSource;
      cdsTransacciones: TwwClientDataSet;
      dsTransacciones: TwwDataSource;
      cdsQry11: TwwClientDataSet;
      dsQry11: TwwDataSource;
      cdsQry1: TwwClientDataSet;
      dsQry1: TwwDataSource;
      cdsUse: TwwClientDataSet;
      dsUse: TwwDataSource;
      cdsQry12: TwwClientDataSet;
      dsQry12: TwwDataSource;
      cdsMovFam: TwwClientDataSet;
      cdsDetCuoLiq: TwwClientDataSet;
      dsDetCuoLiq: TwwDataSource;
      cdsQry13: TwwClientDataSet;
      dsQry13: TwwDataSource;
      cdsReclamos: TwwClientDataSet;
      dsReclamos: TwwDataSource;
      cdsMotivo: TwwClientDataSet;
      dsMotivo: TwwDataSource;
      cdsPais: TwwClientDataSet;
      dsPais: TwwDataSource;
      cdsTAso: TwwClientDataSet;
      dsTAso: TwwDataSource;
      cdsTPension: TwwClientDataSet;
      dsTPension: TwwDataSource;
      cdsUbigeo: TwwClientDataSet;
      dsUbigeo: TwwDataSource;
      cdsReporte1: TwwClientDataSet;
      dsReporte1: TwwDataSource;
      cdsCBcos: TwwClientDataSet;
      dsCBcos: TwwDataSource;
      cdsProvincia1: TwwClientDataSet;
      dsProvincia1: TwwDataSource;
      dsAgencias: TwwDataSource;
      cdsAgencias: TwwClientDataSet;
      cdsQry15: TwwClientDataSet;
      dsQry15: TwwDataSource;
      dsUser: TwwDataSource;
      cdsUser: TwwClientDataSet;
      cdsProvincia2: TwwClientDataSet;
      dsProvincia2: TwwDataSource;
      cdsDist2: TwwClientDataSet;
      dsDist2: TwwDataSource;
      cdsRepresentante: TwwClientDataSet;
      dsRepresentante: TwwDataSource;
      cdsDpto1: TwwClientDataSet;
      dsDpto1: TwwDataSource;
      cdsEgrCaja: TwwClientDataSet;
      dsEgrCaja: TwwDataSource;
      cdsBancoEgr: TwwClientDataSet;
      dsBancoEgr: TwwDataSource;
      dsDocPago: TwwDataSource;
      cdsDocPago: TwwClientDataSet;
      cdsTDiario: TwwClientDataSet;
      dsTDiario: TwwDataSource;
      cdsQry18: TwwClientDataSet;
      dsQry18: TwwDataSource;
      cdsQry19: TwwClientDataSet;
      dsQry19: TwwDataSource;
      cdsOficio: TwwClientDataSet;
      dsOficio: TwwDataSource;
      cdsMovContable: TwwClientDataSet;
      dsMovContable: TwwDataSource;
      cdsQry20: TwwClientDataSet;
      cdsQry21: TwwClientDataSet;
      cdsQry22: TwwClientDataSet;
      cdsQry23: TwwClientDataSet;
      cdsQry24: TwwClientDataSet;
      cdsQry25: TwwClientDataSet;
      dsQry20: TwwDataSource;
      dsQry21: TwwDataSource;
      dsQry22: TwwDataSource;
      dsQry23: TwwDataSource;
      dsQry24: TwwDataSource;
      dsQry25: TwwDataSource;
      cdsCalCre: TClientDataSet;
      dsCalCre: TDataSource;
      cdsCalCuo: TClientDataSet;
      dsCalCuo: TDataSource;
      cdsNivApo: TClientDataSet;
      dsNivApo: TDataSource;
      cdsDevApo: TClientDataSet;
      dsDevApo: TDataSource;
      cdsDetCalLiq: TClientDataSet;
      dsDetCalLiq: TDataSource;
      cdsDetDev: TClientDataSet;
      dsDetDev: TDataSource;
      cdsDetDes: TClientDataSet;
      dsDetDes: TDataSource;
      cdsRetJud: TClientDataSet;
      dsRetJud: TDataSource;
      cdsObs: TClientDataSet;
      dsObs: TDataSource;
      cdsCuentas: TwwClientDataSet;
      dsCuentas: TwwDataSource;
      dsInt: TwwDataSource;
      cdsInt: TwwClientDataSet;
      cdsCueInd: TClientDataSet;
      dsCueInd: TDataSource;
      cdsestapo: TClientDataSet;
      dsestapo: TDataSource;
      cdsDetCalBenRel: TClientDataSet;
      dsDetCalBenRel: TDataSource;
      cdsForPag: TClientDataSet;
      dsForPag: TDataSource;
      cdsDetCalLiqMod: TClientDataSet;
      dsDetCalLiqMod: TDataSource;
      cdsCalLiq: TClientDataSet;
      dsCalLiq: TDataSource;
      ExcelApp: TExcelApplication;
      ExcelBook: TExcelWorkbook;
      WS: TExcelWorksheet;
      cdsdetcardes: TClientDataSet;
      dsdetcardes: TDataSource;
      dsMovFam: TwwDataSource;
      cdsincompletos: TClientDataSet;
      dsincompletos: TDataSource;
      cdssinresolver: TClientDataSet;
      dssinresolver: TDataSource;
    cdsFonSolCab: TwwClientDataSet;
    dsFonSolCab: TwwDataSource;
    cdsFonSolDet: TwwClientDataSet;
    dsFonSolDet: TwwDataSource;
    cdsFonSol: TClientDataSet;
    dsFonSol: TDataSource;
    //Inicio: SPP_201401_PRE
    cdsSegEstExp: TwwClientDataSet;
    dsSegEstExp: TwwDataSource;
    cdsSegSitExp: TwwClientDataSet;
    dsSegSitExp: TwwDataSource;
    //Fin: SPP_201401_PRE
// Inicio: SPP_201403_PRE    15/07/2014  : Cambio de DCOM a Socket
    DCOM1: TSocketConnection;
// Inicio HPC_201504_PRE : Descuentos por aplicaciones de CCI
    dsCreCCI: TDataSource;
    cdsCreCCI: TClientDataSet;
    cdsQry26: TwwClientDataSet;
    dsQry26: TwwDataSource;
// Fin    HPC_201504_PRE : Descuentos por aplicaciones de CCI
// Fin: SPP_201403_PRE       15/07/2014  : Cambio de DCOM a Socket
// Inicio HPC_201505_PRE     : Agregar en Consultas aplicaciones de CCI
    cdsRepCCI: TwwClientDataSet;
    dsRepCCI: TwwDataSource;
    cdsRepCCIDet: TwwClientDataSet;
    dsRepCCIDet: TwwDataSource;
// Fin  HPC_201505_PRE     : Agregar en Consultas aplicaciones de CCI
// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
    cdsMovCnt1: TwwClientDataSet;
    dsMovCnt1: TwwDataSource;
//Inicio HPC_201606_PRE --Adición de Variables publicas generales
    cdsQry27: TwwClientDataSet;
    dsQry27: TwwDataSource;
    // Inicio: HPC_201809_PRE
    // Se añaden los client params, cdsDptooriexp 
    cdsParam: TwwClientDataSet;
    dsParam: TwwDataSource;
    cdsDptooriexp: TwwClientDataSet;
    dsDptooriexp: TwwDataSource;
    // Fin: HPC_201809_PRE

//Final HPC_201606_PRE
// Fin  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios

      Procedure c(Sender: TObject);
      Procedure DataModuleDestroy(Sender: TObject);
      Procedure cdsMaestCartasReconcileError(DataSet: TCustomClientDataSet;
         E: EReconcileError; UpdateKind: TUpdateKind;
         Var Action: TReconcileAction);
   Private
      FormatCel: Array Of OleVariant;
    { Private declarations }
   Public

      // Inicio: SPP_201403_PRE    15/07/2014  : Cambio de DCOM a Socket
      cIP, wOfiId, widepc, ideconex, fechorcon :String;
      // Fin: SPP_201403_PRE       15/07/2014  : Cambio de DCOM a Socket
      //Inicio HPC_201606_PRE --Adición de Variables publicas generales
      xopc1,xofides :String;
      // Inicio: HPC_201802_PRE
      // Variable para controlar la forma de desembolso
      xprodes:String;
      // Fin: HPC_201802_PRE
      //Final HPC_201606_PRE

      Jpg, jpgFirma: TJpegImage;
      gif, gifFirma: TGIFImage;
      Stream, StreamFirma: TMemoryStream;
    // Variables por Irc
      anoinicial, mesinicial, diainicial: Word;
      anoFinal, mesFinal, diaFinal: Word;
      anoHoy, mesHoy, diaHoy: Word;
      asoresnom, asorescese, asofresnom, asofrescese, tipben, cntanomm: String;
      anoultapo, mesultapo: String;
      anoServicio1996, anosTranscurridos, mesesTranscurridos, diasTranscurridos, anoServicio: Double;
      edadInvalidez: Double;
      deudaCredito, liquidacionbeneficio, calculoA1996CtaInd, aportesCtaInd: Double;
      xMonCreDes : Currency;
      // Inicio: HPC_201704_PRE
      // variable que calcula el descuento CCI
      xmontodesCreCCI: currency;
      // Fin: HPC_201704_PRE
      interesesCtaInd, bonusCtaInd, UIT, cantidadUIT, montoUIT, montoDiferencial: Double;
      montoTabRet, montoTabCap, montoTabSep, montoTabInv: Double;
      montoDevApo, montoNivApo, tipocambio: Double;
      montoDevolucion, montoDescuento, montoTransferencia: Double;
      montoliquidacionanterior, totalMontoFormadePago, totalMontoDescuento, totalMontoDevolucion, totalMontoRetencion, totalMontoLiquidacion: Double;
// Inicio HPC_201504_PRE : Descuentos por aplicaciones de CCI
      totalMontoCCI : Double;
// Fin    HPC_201504_PRE : Descuentos por aplicaciones de CCI

      montofonsol, montoRetencion, canTra: Double;
      xpvslbennr, ultapo, numerooficio, numeroexpediente, numeroLiquidacion, numeroVoucherLib, numeroVoucher, asoid, tTiempoTranscurrido, xFlg, xSgr, xCnd, xTipLiq, xanula, xmoddeu, xsqlPublic: String;
      xanomestop, xanomesact, xanomesultapo: String;
      ErrorCount: Integer;
      facred: Double; // Factor de Redondeo
      wFormatFecha: String;
      wTMonLoc, wTipoCambio: String;
      wTMonExt, cobraconcarta: String; // Tipo de Moneda extranjera oficial (normalmente dólares)
      wRptCia: String;
      xSRV_RUTA: String;
      bmk: TBookmark;
      wUsuario, wNivel, wTipoCambioUsar, wTCCompra, wTCVenta: String;
      wModo, wModoE, wGrupo, wAdmin, wofides,
         wRepFecServ,
         wRepFecServi,
         wModulo,
         wGrupoTmp,
         wObjetoDescr,
         wObjetoDesPr,
         wObjetoForma,
         wObjetoNombr: String;
      wComponente: TControl;
      wFechaUCierre: TDatetime;
      wCanje: String;
      xInteres, xBonus, xSaldo: Double;
      xSalAnt, xSalBon: Double;
      wInt, wBon: Double;
      wSRV, sClose, prAPOSEC, prAPOFDEV, prASOID, prTRANSFOPE, prFREG: String;
      prTRANSMTO, prTRANSMTODEV: Double;
      xNext: Boolean;
      // Inicio: HPC_201809_PRE
      // Se añade variable para guardar el nombre del computador
      wcomputadora,WdbePassword:String;
      // Fin: HPC_201809_PRE

      Function DisplayDescrip(wPrv, wTabla, wCampos, wWhere, wResult: String): String;
      Function NumtoStr(wNumero: double): String; // funcion convierte número a caracteres
      Function UltimoNum(wPrv, wTabla, wCampo, wWhere: String): String;
      Function StrZero(wNumero: String; wLargo: Integer): String;
      Function RecuperarDatos(wTabla, wCampos, wWhere: String): Boolean;
      Function NombreMes(wwMes: String): String;
      Procedure GetPriorControl(Sender: TObject);
      Procedure AccesosUsuariosR(xxModulo, xxUsuario, xxTipo: String; xxForma: TForm);
      Procedure AccesosUsuarios(xxModulo, xxUsuario, xxTipo, xxForma: String);
      Function BuscaObjeto(Const xNombre: String; xForm: TForm): TControl;
      Function FechaSys(): tDateTime;
      Function FechasOutPut(xFInput: tDateTime): tDateTime;
      Function Redondeo(WVALOR, wfacred: Single): Single;
      Function BuscaUltTGE(xPrv, xTabla, xCampo, xWhere: String): String;
      Procedure ControlTran;
      Function inserta_aso_resolucion(xasoid: String): Boolean;
      Procedure actualiza_aso_resolucion;
      Procedure AplicaDatos(wCDS: TClientDataSet; wNomArch: String);
      Procedure cdsPost(xxCds: TwwClientDataSet);
      Function MaxValue(Const sDetail: String; CD: TDataSet): String;
      Function SaldoActual(xAsoId, xCreDid, xTip: String): Currency;
      Function Desubigeo(vUbigeo: String): String;
      Function Desuse(vuse, vupagoid, vuproid: String): String;
      Function tiempoTranscurrido(fechaFinal, fechaInicial: TDate; xflg: String): String;
      Procedure Calculaliquidacion;
      Function DevuelveValor(xTabla, xValor, xLlave, xId: String): String;
      Function RecUltTipoCambio(Var xFecha: String): Double;
      Procedure RepartePorcentaje(xAsoid: String);
      Procedure Devoluciones(xAsoid: String);
      Procedure Descuentos(xAsoid: String);
      Procedure Observaciones(xAsoid: String);
      Function Gennumliq(): String;
      Function Gennumvou(): String;
      Function Gennumexp(): String;
      Procedure Grabanivelaciones(xAsoid: String);
      Procedure Grabadevoluciones(xAsoid: String);
      Procedure Grabacreditos(xAsoid: String);
      Procedure calculacreditos(xAsoid: String);
      // Inicio: HPC_201703_PRE
      // Se retira procedimiento antigua de calcula nivelaciones y devoluciones
      //  Procedure calculaNivDev(xAsoid: String; xFecNom, xFecCes: String);
      // Fin: HPC_201703_PRE
      Procedure formadepago(xAsoid: String);
      Procedure Grabaretencion(xAsoid: String);
      Procedure Grabafamiliares(xAsoid: String);
      Procedure Grabacartasdesignacion(xAsoid: String);
      Procedure Grabadetalleliquidacion(xAsoid: String);
      Procedure Grabacabeceraliquidacion(xAsoid: String);
      Procedure Grabasolicitudliquidacion(xAsoid: String);
      Procedure calcularetencion(xAsoid: String);
      Procedure Registro_Aud(xAsoId, xSecuencia, xCodReg: String);
      Function RecuperaDatos(xTabla, xCampo, xVariable, xRecupera: String): String;
      Function CodReg: String;
      Function Valores(Texto: String): Currency;
      Function OperClientDataSet(ClientDataSet: TwwClientDataSet; Expression, Condicion: String): Double;
      Procedure Tiempo(wwFecha1, wwFecha2: TDateTime; Var wwAnos, wwMeses, wwDias: Integer);
      Procedure Procesa(APOSEC: String; MONTO: Double; TRANSMTODEV: Double; APOFDEV: String; ASOID: String; TRANSFOPE: String; FREG: String);
      Function PrimerSalAnt(ASOID: String): Double;
      Function ObtieneintBon(ApoSec: String): Double;
      Procedure VerificaHueco(xAPOSEC, ckAPOSEC: String);
      Procedure MaxProgressB(xProgressBar: TProgressBar; xCountProgressBar: Integer);
      Procedure PBVisible(xPBVisible: TProgressBar);
      Procedure PBVisibleF(xPBVisible: TProgressBar);
      Function MaxSQL(Const sTabla, sMxCampo: String): String;
      Function BuscaCodMod(Const sTabla, sMxCampo: String): String;
      Function VerificaAcceso(Pass, EncDes: String): String;
      Function ASR(xAnos, xMeses: byte): byte;
      Function calculamontodecese(xasofresnom, xasofresces, xtipben: String): double;
      Procedure actualizapvs301(xasoid, xnumexp: String);
      Procedure actualizaaportes(xasoid, xbeneficio, xfecben, xfecini, xfecfin, graba: String);
      Procedure actualizalibretasdeahorro(xasoid: String);
      Function replace(texto: String; cantidad: Integer): String;
      Procedure HojaExcel(Tit: String; TDs: TDataSource; TDb: TDBGrid);
// Inicio HPC_201801_PRE
// Generación de Reporte de Cesantes sin Liquidación
      Procedure HojaExcelCesantesSinLiqui(Tit: String; TDs: TDataSource; TDb: TDBGrid);
// Fin HPC_201801_PRE
      Procedure FormatosCeldas(N: Integer; TDs: TDataSource);
      Function IsStrANumber(NumStr: String): bool;
      Function FormatoNumeros(xTexto: String): String;
      // Inicio: HPC_201809_PRE
      // Se añade función para controlar los formatos de numeros
      Function FormatoEntero(xTexto: String): String;
      // Fin: HPC_201809_PRE
      Function CalculaEdad(FechaNacimiento: String; Fechadecese: String): integer;
      Function CrgDescrip(xCondicion, xTabla, xCampo: String): String;
      Procedure BlqComponentes(xForm: tForm);
      Function CrgArea(xUsuario: String): String;
      Procedure validaasociados(xasoid, xcob: String);
      Procedure VerificaSinData(xVerData, xfaLtante: String);
      Function verificaexiste(xSql: String): Boolean;
      Procedure ExportaGridExcel(xDataGrid: TwwDBGrid; xFileName: String); // SPP_201305_PRE     
//Inicio: DPP_201207_PRE
      Procedure RegistraSuceso(xasoid, xtipben, xobssuc, xfecsuc :String);
//Fin: DPP_201207_PRE
// INICIO: DPP_201201_PRE
//    Procedure CargaImagenes;
      Procedure CargaImagenes(xAsodni:String);
// FINAL: DPP_201201_PRE
      Function ObtenerDigitoChequeoNuevoRUC(istrPrefijo, istrValor: String): String;
      Function ValInt(Texto: String): Integer;
      Function StrSpace(wNumero: String; wLargo: Integer): String;
      Function CountReg(xSQL: String): Integer;
      Function Bloqueados(xAsoId: String): Boolean;
      Procedure GrabaFondoSolidario(xAsoid: String;xmonto:Double);
      Procedure calculafondosolidario(xAsoid:String);
      Function GnrCDev: String;
      // Inicio: HPC_201809_PRE
      // Nuevos procedimiento para control del UBIGEO
      Function DevUbigeo(Departamento:String; Provincia:String; Distrito:String): String;
      Function DevDesDirecc(xdni: string):String;
      // Fin: HPC_201809_PRE


// inicio: HPP_201006_PRE, HPC_201005_PRE
// busca si Asociado tiene activo la marca de proceso en Maestro (APO201) campo:EN_ACTUALIZ
      Function IndicaAsociadoEnAct(wwAsoid:String):Boolean;
// fin: HPP_201006_PRE, HPC_201005_PRE

// Inicio: SPP_201403_PRE    15/07/2014  : Cambio de DCOM a Socket
    function ObtenerIpdeNetbios(Host: string): string;
    function ComputerName: string;
// Fin: SPP_201403_PRE       15/07/2014  : Cambio de DCOM a Socket

// Inicio HPC_201504_PRE : Descuentos por aplicaciones de CCI
    Function MuestraAlerta( vCodMensaje : String ) : Boolean;
    procedure calculaCreditoCCI(xAsoid: String);
// Fin  HPC_201504_PRE : Descuentos por aplicaciones de CCI

// Inicio HPC_201505_PRE : Agregar en Consultas aplicaciones de CCI
    procedure ResumenCCI(xAsoid: String);
    procedure DetalleCCI(xAsoid: String);
// fin  HPC_201505_PRE : Agregar en Consultas aplicaciones de CCI
    // INICIO HPC_201509_PRE
    procedure FG_CONECTA_CDS(var pxCdsQry : TwwClientDataSet; var pxDsQry : TwwDataSource);
    function FG_OBTIENE_MENSAJE_ERROR_ORACLE(psCadena: String): string;
    // FIN HPC_201509_PRE
    // INICIO HPC_201602_PRE
	// DECLARACION DE FUNCION
    function FG_PORLIQUIDAR(psAsoid: String): string;
    // INICIO HPC_201610_PRE
    // DECLARACION DE FUNCIONES
    function FG_EXPORTA_XLS(pxDataGrid: TwwDBGrid; psNombreHoja: string) : OleVariant; overload;
    function FG_EXPORTA_XLS(pxDataGrid: TwwDBGrid; psNombreHoja: string; var pxExcApp: OleVariant) : OleVariant; overload;
    // FIN HPC_201610_PRE
    // FIN HPC_201602_PRE
    // Inicio: HPC_201703_PRE
	// Calcula nivelación de Devoluciones
    procedure CalculaNivelacionesDevoluciones(xasoid:String; xpvsexpnro:String; xultanomes:String);
    // Fin: HPC_201703_PRE
    // Inicio: HPC_201809_PRE
    // Se añaden nuevos procedimiento para control de las fotos
    Procedure BorraFotos;
    Procedure CargaImagenesBen(xAsodni:String);
    // Fin: HPC_201809_PRE


   End;

Var
   DM1: TDM1;
   wUsuario: String;
   wRutaRpt, wRutaFTP: String;
   wAmedida: String;
   wModo: String;
   SRV_E: String;
   SRV_D: String;
   SRV_V: String;
   ErrorCount: Integer;
   wCiaDef, wTipoCambio, wRepFecServi, wRepHorServi, wReplacCeros, wFormatFecha, wRepFuncChar, wRepFuncDate, wFormatFServ: String;
   xFec_Sis, xHor_Sis: String;
Function FRound(xReal: double; xEnteros, xDecimal: Integer): double;
Function DateS: TDatetime;

Implementation

// Inicio: SPP_201403_PRE    15/07/2014  : Cambio de DCOM a Socket
// Inicio: HPC_201805_PRE
// Se añade la unidad PRE244
// Uses MsgDlgs, PRE001, PRE020;
Uses MsgDlgs, PRE001, PRE020, PRE244;
// Fin: HPC_201805_PRE
// Fin: SPP_201403_PRE       15/07/2014  : Cambio de DCOM a Socket

{$R *.DFM}


// Inicio HPC_201504_PRE : Descuentos por aplicaciones de CCI
function TDM1.MuestraAlerta(vCodMensaje:String) : Boolean;
Var xsql:string;
begin
   Result:=False;
   xsql:='Select FECFIN From ASO_EXP_MENSAJE Where IDMENSAJE='''+vCodMensaje+''' ';
   DM1.cdsQry1.Close;
   DM1.cdsQry1.DataRequest(xSQL);
   DM1.cdsQry1.Open;
   If DM1.cdsQry1.FieldByName('FECFIN').AsDateTime<DM1.FechaSys Then exit;

   xSql:='Select ASOID FROM COB_APLI_CCI_DET WHERE ASOID='''+DM1.cdsExpLiq.FieldByname('ASOID').AsString+''' ';
   DM1.cdsQry1.Close;
   DM1.cdsQry1.DataRequest(xSQL);
   DM1.cdsQry1.Open;

   If DM1.cdsQry1.RecordCount>=1 Then
   Begin
      ShowMessage('NO LIQUIDAR AUN, CESADO POR OFICIO...Comunicarse con el Supervisor de Previsión');
      Result:=True;
   End
   ELSE
      Result:=False;
End;
// Fin  HPC_201504_PRE : Descuentos por aplicaciones de CCI


// Inicio: SPP_201403_PRE    15/07/2014  : Cambio de DCOM a Socket
function TDM1.ObtenerIpdeNetbios(Host: string): string;
var
  WSAData: TWSADATA;
  HostEnt: phostent;
begin
  Result:= '';
  if WSAStartup(MAKEWORD(1, 1), WSADATA) = 0 then
  begin
    HostEnt:= gethostbyname(PChar(Host));
    if HostEnt <> nil then
      Result:= String(inet_ntoa(PInAddr(HostEnt.h_addr_list^)^));
    WSACleanup;
  end;
end;
// Fin: SPP_201403_PRE    15/07/2014  : Cambio de DCOM a Socket


// Inicio: SPP_201403_PRE    15/07/2014  : Cambio de DCOM a Socket
function TDM1.ComputerName: string;
var
  Buffer: array[ 0..100 ] of Char;
  MaxSize: Cardinal ;
begin
  MaxSize := SizeOf( Buffer );
  if not GetComputerName( @Buffer, MaxSize ) then
    raise Exception.Create( 'No puedo determinar el nombre de la máquina' );
  Result := StrPas( @Buffer );
end;
// Fin: SPP_201403_PRE    15/07/2014  : Cambio de DCOM a Socket


Procedure TDM1.c(Sender: TObject);
Var
   xSql: String;
Var
   inifile: TIniFile;
Begin
// Inicio: SPP_201403_PRE    15/07/2014  : Cambio de DCOM a Socket
   // <>'' Cuando el servidor se ejecuta Localmente
   //  =''  Ejecucion Servidor Remoto
   DCOM1.Connected := False;

   // Inicio: HPC_201809_PRE
   // Se añade DLL que controla imagenes TIF
   ImageDLLLoader.Default.FindDLLs('C:\Solexes');
   // Fin: HPC_201809_PRE

  // LEE LOS DATOS DE CONEXION
  if ParamStr(1)='' then
  begin
     inifile:=TIniFile.Create('C:\SOLExes\DM_Conf_CLI.ini');
     DCOM1.Address:=IniFile.ReadString('TCPIP','ADDRESS','');
     DCOM1.Port   :=STRTOINT( IniFile.ReadString('TCPIP','PORT','') );
     wSRV:=IniFile.ReadString('MOTOR','NAME','');
  end;

  // OBTIENE EL IP DE LA PC
  try
      cIP:= ObtenerIpdeNetbios( computerName);
  except
      ShowMessage( 'ERROR de Conexión.');
      DCOM1.Connected:=False;
      Exit;
  end;

  // Conexion con la Aplicación Servidor
  try
     DCOM1.Connected:=true;
  except
     ShowMessage( 'ERROR de Conexión.');
     Exit;
  end;

  // Accesos al Sistemas
  wModulo := 'COB';
  sClose  := '0';
  FCtrlAcceso := TFCtrlAcceso.Create(Application);
  FCtrlAcceso.ShowModal;

  if FCtrlAcceso.cAccesoSistema='S' then
  begin
     // SI Ingreso al Sistema
     wUsuario := FCtrlAcceso.dbeUsuario.Text;
     //Inicio HPC_201809_PRE
     //Asigna contraseña
     WdbePassword :=   FCtrlAcceso.dbePassword.Text;
     //Final HPC_201809_PRE	 
     FCtrlAcceso.free;
  end
  else
  begin
     // NO Ingreso al Sistema
     sClose:='1';
     DCOM1.Connected:=False;
     FCtrlAcceso.free;
     Exit;
  end;
// Fin: SPP_201403_PRE    15/07/2014  : Cambio de DCOM a Socket

   If sClose <> '1' Then
   Begin

// Inicio: SPP_201403_PRE    15/07/2014  : Cambio de DCOM a Socket
      {DM1.wAdmin := FAccesos.wAdmin;
      DM1.wGrupo := FAccesos.wGrupo;
      DM1.wUsuario := FAccesos.wUsuario;}
// Fin: SPP_201403_PRE       15/07/2014  : Cambio de DCOM a Socket
      // Tomando el nivel del usuario
      xSql := 'SELECT NIVEL, ORIGEN FROM USERTABLE WHERE USERID = ' + QuotedStr(DM1.wUsuario);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      wNivel := DM1.cdsQry.FieldByName('NIVEL').AsString;
      wofides := DM1.cdsQry.FieldByName('ORIGEN').AsString;
//Inicio HPC_201606_PRE --Adición de Variables publicas generales
      xofides := wofides;
//Final HPC_201606_PRE
      wModulo := 'PRE';
      cdsUsuarios.Open;
      cdsGrupos.Open;
      cdsMGrupo.Open;
      cdsAcceso.Open;
      wTipoCambioUsar := 'TCAMVOV';
      wTCCompra := 'TCAMVOC';
      wTCVenta := 'TCAMVOV';
// Inicio: SPP_201403_PRE    15/07/2014  : Cambio de DCOM a Socket
      //** hallo la ruta de acceso para las tablas DBF (para la recepción del FTP)
      //DM1.DCOM1.AppServer.RutaViaFTP(wRutaFTP);
// Fin: SPP_201403_PRE       15/07/2014  : Cambio de DCOM a Socket
      DM1.DisplayDescrip('prvSQL', 'SOLCONFIG', '*', '', 'SRV_DB');
      SRV_E := DM1.cdsQry.FieldByName('SRV_EQUIP').AsString;
      SRV_D := DM1.cdsQry.FieldByName('SRV_DB').AsString;
      SRV_V := DM1.cdsQry.FieldByName('SRV_VERS').AsString;
      wRptCia := DM1.cdsQry.FieldByName('RPTCIA').AsString;
      wAmedida := DM1.cdsQry.FieldByName('AMEDIDAOPC').AsString;
      xSRV_RUTA := cdsQry.FieldByName('SRV_RUTA').AsString;
      // *** PARA CAMBIAR LA RUTA
      wRutaRpt := wRutaFTP + 'SOLFormatos\' + wModulo + '\' + wRptCia;
      If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
      Begin
         wFormatFServ := 'DD/MM/YYYY';
         wFormatFecha := 'YYYY-MM-DD';
         wReplacCeros := 'COALESCE';
         wRepFecServi := 'CURRENT DATE';
         wRepFecServ := 'CURRENT DATE';
         wRepHorServi := 'CURRENT TIME';
         wRepFuncDate := 'DATE(';
      End
      Else
         If SRV_D = 'ORACLE' Then
         Begin
            wFormatFServ := 'DD/MM/YYYY';
            wFormatFecha := 'DD/MM/YYYY';
            wReplacCeros := 'NVL';
            wRepFecServi := 'SYSDATE';
            wRepFecServ := 'SYSDATE';
            wRepHorServi := 'SYSDATE';
            wRepFuncDate := 'TO_DATE(';
            wRepFuncChar := 'TO_CHAR(';
         End;
      wTMonLoc := DisplayDescrip('prvSQL', 'TGE103', 'TMONID', 'TMon_Loc=' + '''' + 'L' + '''', 'TMonID');
      wTMonExt := DisplayDescrip('prvSQL', 'TGE103', 'TMONID', 'TMon_Loc=' + '''' + 'E' + '''', 'TMonID');
      FPrincipal := TFPrincipal.Create(self);
      Try
         FPrincipal.ShowModal;
      Finally
         FPrincipal.free;
      End;
   End
   Else
   Begin
      If DM1 <> Nil Then
         dm1.DCOM1.Connected := False;
      Application.Terminate;
   End;
End;

Procedure TDM1.Procesa(APOSEC: String; MONTO: Double; TRANSMTODEV: Double; APOFDEV: String; ASOID: String; TRANSFOPE: String; FREG: String);
Var
   xSQL, wAno, wMes: String;
   qSalAnt, qSaldo, qSalBon, qBonus, qInteres: Double;
Begin
   wAno := Copy(APOSEC, 1, 4);
   wMes := Copy(APOSEC, 5, 2);
   xSQL := 'SELECT APOANO, APOMES, INTERES, BONUS ' +
      'FROM APO117 ' +
      'WHERE APOANO =''' + wAno + ''' ' + 'AND APOMES =''' + wMes + '''';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSQL);
   DM1.cdsQry.Open;
   wInt := DM1.cdsQry.FieldByName('INTERES').AsFloat;
   wBon := DM1.cdsQry.FieldByName('BONUS').AsFloat;
   DM1.cdsQry.Close;
   If wInt > 0 Then
      wInt := wInt / 100;
   If wBon > 0 Then
      wBon := wBon / 100;
   xBonus := FRound(DM1.ObtieneIntBon(wAno + wMes), 15, 2);
   xSalAnt := FRound(xSalAnt, 15, 2);
   xInteres := FRound(xSalAnt * wInt, 15, 2);
   xSaldo := xSalAnt + xInteres + xBonus + MONTO;
   If xBonus <> 0 Then
      xSalBon := xSaldo
   Else
      xBonus := 0;
   If (TRANSMTODEV > 0) Or (APOFDEV = 'S') Then
      xSaldo := xSaldo - TRANSMTODEV;
   qSalAnt := FRound(xSalAnt, 15, 2);
   qSaldo := FRound(xSaldo, 15, 2);
   qSalBon := FRound(xSalBon, 15, 2);
   qBonus := FRound(xBonus, 15, 2);
   qInteres := FRound(xInteres, 15, 2);
   DM1.cdsTransacciones.FieldByName('SALDOANT').AsFloat := qSalAnt;
   DM1.cdsTransacciones.FieldByName('SALDO').AsFloat := qSaldo;
   DM1.cdsTransacciones.FieldByName('SALDOBONUS').AsFloat := qSalBon;
   DM1.cdsTransacciones.FieldByName('INTERESMTO').AsFloat := qInteres;
   DM1.cdsTransacciones.FieldByName('BONUSMTO').AsFloat := qBonus;
   xSalAnt := xSaldo;
End;

Function TDM1.ObtieneIntBon(ApoSec: String): Double;
Var
   zAno, zMes: String;
Begin
   If Length(Trim(ApoSec)) = 0 Then
   Begin
      ObtieneIntBon := 0;
      Exit;
   End;
   zAno := Copy(ApoSec, 1, 4);
   zMes := Copy(ApoSec, 5, 2);
   If (zMes = '03') Or (zMes = '06') Or (zMes = '09') Or (zMes = '12') Then
   Begin
      ObtieneIntBon := xSalBon * wBon;
   End
   Else
   Begin
      ObtieneIntBon := 0;
   End;
End;

Procedure TDM1.VerificaHueco(xAPOSEC, ckAPOSEC: String);
Var
   xAno, xMes, ckAno, ckMes: String;
Begin
   xAno := Copy(xAPOSEC, 1, 4);
   xMes := Copy(xAPOSEC, 5, 2);
   ckAno := Copy(ckAPOSEC, 1, 4);
   ckMes := Copy(ckAPOSEC, 5, 2);
   If ckMes = '12' Then
   Begin
      ckMes := '01';
      ckAno := IntToStr(StrToInt(ckAno) + 1);
   End
   Else
   Begin
      ckMes := IntToStr(StrToInt(ckMes) + 1);
      If Length(Trim(ckMes)) = 1 Then ckMes := '0' + ckMes;
   End;
   If ((ckAno = xAno) And (ckMes = xMes)) Or (ckAPOSEC = xAPOSEC) Then
   Begin
      xNext := True;
      prAPOSEC := DM1.cdsTransacciones.FieldByName('TRANSANO').AsString + DM1.cdsTransacciones.FieldByName('TRANSMES').AsString;
      prASOID := DM1.cdsTransacciones.FieldByName('ASOID').AsString;
      prAPOFDEV := DM1.cdsTransacciones.FieldByName('APOFDEV').AsString;
      prTRANSMTO := DM1.cdsTransacciones.FieldByName('TRANSMTO').AsFloat;
      prTRANSMTODEV := DM1.cdsTransacciones.FieldByName('TRANSMTODEV').AsFloat;
      prTRANSFOPE := DM1.cdsTransacciones.FieldByName('TRANSFOPE').AsString;
      prFREG := DM1.cdsTransacciones.FieldByName('FREG').AsString;
   End
   Else
   Begin
      xNext := False;
      prAPOSEC := ckAno + ckMes;
      prAPOFDEV := '';
      prASOID := DM1.cdsTransacciones.FieldByName('ASOID').AsString;
      prTRANSMTO := 0;
      prTRANSMTODEV := 0;
      prTRANSFOPE := '';
      prFREG := '';
   End;
End;

Function TDM1.PrimerSalAnt(ASOID: String): Double;
Var
   xSQL: String;
   xAno, xDia: Integer; //xMes,
Begin
   xSQL := 'SELECT ASOFRESNOM FROM APO201 WHERE ASOID =''' +
      ASOID + '''';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSQL);
   DM1.cdsQry.Open;
   If Length(DM1.cdsQry.FieldByName('ASOFRESNOM').AsString) <> 0 Then
   Begin
      xAno := 1996 - StrToInt(FormatDateTime('YYYY', DM1.cdsQry.FieldByname('ASOFRESNOM').AsDateTime));
      If StrToInt(FormatDateTime('MM', DM1.cdsQry.FieldByname('ASOFRESNOM').AsDateTime)) = 1 Then
         xAno := xAno + 1;
      If xAno < 0 Then
      Begin
         xAno := 0;
      End;
      // buscando el beneficio por el nro de años de aportación
      xSQL := 'SELECT BENMONTO FROM APO121 WHERE APOANO =' + IntToStr(xAno);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSQL);
      DM1.cdsQry.Open;
      If DM1.cdsQry.RecordCount >= 1 Then
      Begin
         Result := DM1.cdsQry.FieldByName('BENMONTO').AsFloat;
      End
      Else
      Begin
         Result := 0;
      End;
   End
   Else
   Begin
      Result := 0;
   End;
   DM1.cdsQry.Close;
End;

Function TDM1.RecuperarDatos(wTabla, wCampos,
   wWhere: String): Boolean;
Begin
   Result := True;
End;

Function TDM1.DisplayDescrip(wPrv, wTabla, wCampos, wWhere, wResult: String): String;
Var
   sSQL: String;
Begin
   sSQL := 'SELECT ' + wCampos + ' FROM ' + wTabla;
   If Length(wWhere) > 0 Then
      sSQL := sSQL + ' WHERE ' + wWhere;
   cdsQry.IndexFieldNames := '';
   cdsQry.Filter := '';
   cdsQry.Filtered := False;
   cdsQry.Close;
   cdsQry.DataRequest(sSQL);
   cdsQry.Open;
   Result := cdsQry.FieldByName(wResult).AsString;
End;

Function TDM1.StrZero(wNumero: String; wLargo: Integer): String;
Var
   s: String;
   i: Word;
Begin
   For i := 1 To wLargo Do
      s := s + '0';
   s := s + Trim(wNumero);
   Result := Copy(s, Length(s) - (wLargo - 1), wLargo);
End;

Function TDM1.UltimoNum(wPrv, wTabla, wCampo, wWhere: String): String;
Var
   sSQL: String;
Begin
   sSQL := 'SELECT MAX(' + wCampo + ') as WMAXIMO From ' + wTabla;
   If Length(wWhere) > 0 Then
      sSQL := sSQL + ' WHERE ' + wWhere;
   cdsQry.Close;
   cdsQry.DataRequest(sSQL);
   cdsQry.Open;
   If cdsQry.FieldByName('WMAXIMO').Value = Null Then
      Result := '1'
   Else
      Result := IntToStr(StrToInt(cdsQry.FieldByName('WMAXIMO').Value) + 1);
End;

Procedure TDM1.AccesosUsuarios(xxModulo, xxUsuario, xxTipo, xxForma: String);
Begin
   If Trim(cdsUsuarios.FieldByName('GrupoId').AsString) = '' Then
   Begin
      cdsUsuarios.SetKey;
      cdsUsuarios.FieldByName('UserId').AsString := xxUsuario;
      If Not cdsUsuarios.GotoKey Then Exit;
   End;
   cdsGrupos.Filter := '';
   If xxTipo = '1' Then
   Begin
      cdsGrupos.Filter := 'GrupoID  =' + '''' + cdsUsuarios.FieldByName('GRUPOID').AsString + '''' + ' And '
         + 'ModuloID =' + '''' + xxModulo + '''' + ' And '
         + 'Tipo     =' + '''' + xxTipo + '''';
      cdsGrupos.Filtered := True;
      cdsGrupos.First;
      While Not cdsGrupos.Eof Do
      Begin
         wComponente := BuscaObjeto(cdsGrupos.FieldByName('OBJETO').AsString, Screen.ActiveForm);
         wComponente.Enabled := False;
         cdsGrupos.Next;
      End;
   End;
   If xxTipo = '2' Then
   Begin
      cdsGrupos.Filter := 'GrupoID  =' + '''' + cdsUsuarios.FieldByName('GrupoId').AsString + '''' + ' And '
         + 'ModuloID =' + '''' + xxModulo + '''' + ' And '
         + 'Forma    =' + '''' + xxForma + '''' + ' And '
         + 'Tipo     =' + '''' + xxTipo + '''';
      cdsGrupos.Filtered := True;
      cdsGrupos.First;
      While Not cdsGrupos.Eof Do
      Begin
         wComponente := BuscaObjeto(cdsGrupos.FieldByName('OBJETO').AsString, Screen.ActiveForm);
         If (wComponente.Name = 'Z2bbtnModifica') Or
            (wComponente.Name = 'Z2bbtnConsulta') Then
            wComponente.Enabled := False
         Else
         Begin
            wComponente.Visible := False;
         End;
         cdsGrupos.Next;
      End;
   End;
End;

Procedure TDM1.AccesosUsuariosR(xxModulo, xxUsuario, xxTipo: String; xxForma: TForm);
Begin
   If Trim(cdsUsuarios.FieldByName('GRUPOID').AsString) = '' Then
   Begin
      cdsUsuarios.SetKey;
      cdsUsuarios.FieldByName('USERID').AsString := xxUsuario;
      If Not cdsUsuarios.GotoKey Then Exit;
   End;
   cdsGrupos.Filter := '';
   If xxTipo = '1' Then
   Begin
      cdsGrupos.Filter := 'GrupoID  =' + '''' + cdsUsuarios.FieldByName('GRUPOID').AsString + '''' + ' And '
         + 'ModuloID =' + '''' + xxModulo + '''' + ' And '
         + 'Tipo     =' + '''' + xxTipo + '''';
      cdsGrupos.Filtered := True;
      If DM1.wAdmin = 'S' Then Exit;
      cdsGrupos.First;
      While Not cdsGrupos.Eof Do
      Begin
         wComponente := BuscaObjeto(cdsGrupos.FieldByName('OBJETO').AsString, xxForma);
         wComponente.Enabled := False;
         cdsGrupos.Next;
      End;
   End;
   If xxTipo = '2' Then
   Begin
      cdsGrupos.Filter := 'GrupoID  =' + '''' + cdsUsuarios.FieldByName('GRUPOID').AsString + '''' + ' And '
         + 'ModuloID =' + '''' + xxModulo + '''' + ' And '
         + 'Forma    =' + '''' + xxForma.Name + '''' + ' And '
         + 'Tipo     =' + '''' + xxTipo + '''';
      cdsGrupos.Filtered := True;
      If DM1.wAdmin = 'S' Then Exit;
      cdsGrupos.First;
      While Not cdsGrupos.Eof Do
      Begin
         wComponente := BuscaObjeto(cdsGrupos.FieldByName('OBJETO').AsString, xxForma);
         If (wComponente.Name = 'Z2bbtnModifica') Or
            (wComponente.Name = 'Z2bbtnConsulta') Then
            wComponente.Enabled := False
         Else
         Begin
            wComponente.Visible := False;
         End;
         cdsGrupos.Next;
      End;
   End;
End;

Function TDM1.NombreMes(wwMes: String): String;
Begin
   If StrToInt(wwMes) = 1 Then Result := 'ENERO';
   If StrToInt(wwMes) = 2 Then Result := 'FEBRERO';
   If StrToInt(wwMes) = 3 Then Result := 'MARZO';
   If StrToInt(wwMes) = 4 Then Result := 'ABRIL';
   If StrToInt(wwMes) = 5 Then Result := 'MAYO';
   If StrToInt(wwMes) = 6 Then Result := 'JUNIO';
   If StrToInt(wwMes) = 7 Then Result := 'JULIO';
   If StrToInt(wwMes) = 8 Then Result := 'AGOSTO';
   If StrToInt(wwMes) = 9 Then Result := 'SETIEMBRE';
   If StrToInt(wwMes) = 10 Then Result := 'OCTUBRE';
   If StrToInt(wwMes) = 11 Then Result := 'NOVIEMBRE';
   If StrToInt(wwMes) = 12 Then Result := 'DICIEMBRE';
End;

Procedure TDM1.GetPriorControl(Sender: TObject);
Var
   lResult: Boolean;
   nTabAct, nTabAnt: TTabOrder;
Begin
   If (sender = Nil) Or Not (Sender Is TWincontrol) Then
      lResult := True
   Else
   Begin
      nTabAnt := (Screen.ActiveControl.Parent.TabOrder * 128) + Screen.ActiveControl.TabOrder;
      nTabAct := ((Sender As TWincontrol).Parent.TabOrder * 128) + (Sender As TWincontrol).TabOrder;
      lResult := nTabAct > nTabAnt;
   End;
   If lResult Then
      Abort;
End;

Function TDM1.BuscaObjeto(Const xNombre: String; xForm: TForm): TControl;
Var
   ic: Integer;
Begin
   Result := Nil;
   ic := xForm.ComponentCount - 1;
   While (xForm.Components[ic].Name <> xNombre) And (ic > -1) Do
   Begin
      Dec(ic);
   End;
   If xForm.Components[ic].Name = xNombre Then
      Result := TControl(xForm.Components[ic]);
End;

Function FRound(xReal: Double; xEnteros, xDecimal: Integer): Double;
Var
   xParteDec, xflgneg: String;
   xDec: Integer;
   xMultiplo10, xUltdec, xNReal, xPDec: Double;
Begin
   Result := 0;
   xflgneg := '0';
   If xReal < 0 Then
   Begin
      xflgneg := '1';
      xReal := xReal * -1;
   End;
   If xReal = 0 Then Exit;
   xDec := xDecimal + 1;
   If xDec = 0 Then xMultiplo10 := 1;
   If xDec = 1 Then xMultiplo10 := 10;
   If xDec = 2 Then xMultiplo10 := 100;
   If xDec = 3 Then xMultiplo10 := 1000;
   If xDec = 4 Then xMultiplo10 := 10000;
   If xDec = 5 Then xMultiplo10 := 100000;
   If xDec = 6 Then xMultiplo10 := 1000000;
   If xDec = 7 Then xMultiplo10 := 10000000;
   xNreal := StrToFloat(FloatToStr(xReal * xMultiplo10));
   xPdec := Int(StrToFloat(FloatToStr(xReal))) * xMultiplo10;
   xPdec := xNReal - xPDec;
   xPDec := Int(xPDec);
   xParteDec := FloatToStr(xPDec);
   If length(xParteDec) < xDec Then
      xParteDec := DM1.StrZero(xParteDec, xDec);
   If Length(xParteDec) >= xDec Then
      xultdec := StrToFloat(copy(xParteDec, xDec, 1))
   Else
   Begin
      xUltDec := 0;
   End;
   xNReal := StrToFloat(FloatToStr(xReal * xMultiplo10 / 10));
   xNReal := int(xNReal);
   If xultdec >= 5 Then xNReal := xNReal + 1;
   If xflgneg = '1' Then
   Begin
      Result := (xNReal / (xMultiplo10 / 10)) * -1;
   End
   Else
   Begin
      Result := xNReal / (xMultiplo10 / 10);
   End;
End;

Function TDM1.Redondeo(WVALOR, wfacred: Single): Single;
Var
   wv, wdecimal, wentero: Single;
Begin
   wv := wfacred * 100;
   // set decimal to 2
   wfacred := wv / 100;
   WENTERO := INT(WVALOR / WFACRED);
   wdecimal := frac(wvalor / wfacred);
   If wdecimal >= 0.5 Then wentero := wentero + 1;
   wentero := wentero * WFACRED;
   Result := Wentero;
End;

Function TDM1.BuscaUltTGE(xPrv, xTabla, xCampo, xWhere: String): String;
Var
   xSQL: String;
Begin
   xSQL := '';
   xSQL := 'Select max(' + xCampo + ') as MaxNum From ' + xTabla;
   If Length(xWhere) > 0 Then xSQL := xSQL + ' Where ' + xWhere;
   cdsQry.Close;
   cdsQry.ProviderName := xPrv;
   cdsQry.DataRequest(xSQL); //Esta es la llamada remota al provider del servidor
   cdsQry.Open;
   If (cdsQry.FieldByName('MaxNum').Value = Null)
      Or (Trim(cdsQry.FieldByName('MaxNum').AsString) = '') Then
      Result := '1'
   Else
   Begin
      Result := FloatToStr(StrToFloat(Trim(cdsQry.FieldByName('MaxNum').AsString)) + 1);
   End;
End;

Procedure TDM1.AplicaDatos(wCDS: TClientDataSet; wNomArch: String);
Var
   Delta, Results, OwnerData: OleVariant;
   ErrorCount: Integer;
Begin
   If (wCDS.Modified) Or (wCDS.changeCount > 0) Then
   Begin
      If VarIsEmpty(wCDS.Delta) Then Exit;
      ErrorCount := 0;
      wCDS.CheckBrowseMode;
      Results := DCOM1.AppServer.AS_ApplyUpdates(wCDS.ProviderName, wCDS.Delta, -1, ErrorCount, OwnerData);
      cdsResultSet.Data := Results;
      wCDS.Reconcile(Results);
   End;
End;

Procedure TDM1.cdsPost(xxCds: TwwClientDataSet);
Var
   i: Integer;
Begin
   For i := 0 To xxCds.Fields.Count - 1 Do
   Begin
      If xxCds.Fields[i].ClassType = TStringField Then
      Begin
         If (xxCds.Fields[i].AsString = '') Then
            xxCds.Fields[i].Clear;
      End;
      If xxCds.Fields[i].ClassType = TMemoField Then
      Begin
         If (xxCds.Fields[i].AsString = '') Or (xxCds.Fields[i].AsString = ' ') Then xxCds.Fields[i].AsString := '.';
      End;
   End;
End;

// procedimiento
Function TDM1.OperClientDataSet(ClientDataSet: TwwClientDataSet; Expression, Condicion: String): Double;
Var
   cdsClone: TwwClientDataSet;
   bmk: TBookmark;
   Agg: TAggregate;
Begin
   Result := 0;
   If Trim(Expression) = '' Then Exit;
   bmk := ClientDataSet.GetBookmark;
   cdsClone := TwwClientDataSet.Create(Nil);
   Try
      With cdsClone Do
      Begin
         CloneCursor(ClientDataSet, True);
         Agg := Aggregates.Add;
         Agg.AggregateName := 'OPER';
         Agg.Expression := Expression;
         Agg.Active := True;
         If Trim(Condicion) <> '' Then
         Begin
            Filtered := False;
            Filter := Condicion;
            Filtered := True;
         End;
         If Aggregates.Items[Aggregates.IndexOf('OPER')].Value <> Null Then
            Result := Aggregates.Items[Aggregates.IndexOf('OPER')].Value;

         Aggregates.Clear;

      End;

      ClientDataSet.GotoBookmark(bmk);
      ClientDataSet.FreeBookmark(bmk);

   Finally
      cdsClone.Free;
   End;
End;

Function TDM1.MaxValue(Const sDetail: String; CD: TDataSet): String;
Var
   iMx: LongInt;
   bmk: TBookMark;
   dsI, dsE: Boolean;
Begin

  // --------------------------- ADVERTENCIA !!!!!!!! --------------------------
  //  ESTO NO FUNCIONA EN EL CACHÉ
  // ---------------------------------------------------------------------------
  //  result := MaxSQL('LOG309','DRQSID',
  //                   'where CIAID='''+sCIA+''' And '+'RQSID = '''+sRqs+'''' );
  // ---------------------------------------------------------------------------
   iMx := 0;
   CD.DisableControls;
   dsI := (CD.State = dsInsert);
   dsE := (CD.State = dsEdit);
   If CD.RecordCount > 0 Then
   Begin
      If dsE Then bmk := CD.GetBookmark;
      If dsI Or dsE Then CD.Cancel;

      CD.First;
      While Not CD.Eof Do
      Begin
         If CD.FieldByName(sDetail).IsNull Then
            iMx := 0
         Else
            If (CD.FieldByName(sDetail).AsInteger > iMx) And (CD.FieldByName(sDetail).AsInteger <> 999) Then
               iMx := CD.FieldByName(sDetail).AsInteger;
         CD.Next;
      End;
      If dsI Then
         CD.Insert
      Else
         If dsE Then
            CD.Edit;
      If dsE Then
      Begin
         CD.GotoBookmark(bmk);
         CD.FreeBookmark(bmk);
      End;
   End;
   CD.EnableControls;
   Result := IntToStr(iMx + 1);
End;

Procedure TDM1.Tiempo(wwFecha1, wwFecha2: TDateTime; Var wwAnos, wwMeses, wwDias: Integer);
Var
   wAno1, wMes1, wDia1: Word;
   wAno2, wMes2, wDia2: Word;
Begin
   wwAnos := 0;
   wwMeses := 0;
   wwDias := 0;
   If (wwFecha2 - wwFecha1) > 0 Then
   Begin
   // devuelve años, meses y días entre dos fechas
      DecodeDate(wwFecha1, wAno1, wMes1, wDia1);
      DecodeDate(wwFecha2, wAno2, wMes2, wDia2);
      If wDia2 < wDia1 Then
      Begin
         Case wMes2 Of
            1, 3, 5, 7,
               8, 10, 12:
               Begin
                  wwDias := 31 + wDia2 - wDia1;
               End;
            4, 6, 9, 11:
               Begin
                  wwDias := 30 + wDia2 - wDia1;
               End;
         Else
            Begin
               If (wAno1 Mod 4) = 0 Then
                  wwDias := 29 + wDia2 - wDia1
               Else
               Begin
                  wwDias := 28 + wDia2 - wDia1;
               End;
            End;
         End;
         wMes2 := wMes2 - 1;
      End
      Else
      Begin
         wwDias := wDia2 - wDia1;
      End;
   // CALCULO DE MESES EN EL RANGO
      If wMes2 < wMes1 Then
      Begin
         wwMeses := 12 + wMes2 - wMes1;
         wAno2 := wAno2 - 1;
      End
      Else
      Begin
         wwMeses := wMes2 - wMes1;
      End;
   // CALCULO DE ANUALIDADES DEL RANGO
   // CALCULO DE HenryIDADES DEL RANGO
      wwAnos := wAno2 - wAno1;
   End; // si fecha2>fecha1
End;

Procedure TDM1.ControlTran;
Begin
   ErrorCount := 0;
End;

Procedure TDM1.DataModuleDestroy(Sender: TObject);
Begin
   cdsUsuarios.Close;
   cdsGrupos.Close;
   cdsMGrupo.Close;
   cdsAcceso.Close;
   DCOM1.Connected := False;
End;

Procedure TDM1.MaxProgressB(xProgressBar: TProgressBar; xCountProgressBar: Integer);
Begin
   xProgressBar.Max := xCountProgressBar;
End;

Procedure TDM1.PBVisible(xPBVisible: TProgressBar);
Begin
   xPBVisible.Visible := True;
End;

Procedure TDM1.PBVisibleF(xPBVisible: TProgressBar);
Begin
   xPBVisible.Visible := False;
End;

Function TDM1.MaxSQL(Const sTabla, sMxCampo: String): String;
Var
   xNum: Integer;
   xSQL: String;
Begin
   xSQL := 'SELECT MAX(' + SMXCAMPO + ') AS X FROM ' + sTabla;
   cdsQry.Close;
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;
   If cdsQry.FieldByName('X').IsNull Then
      Result := '1'
   Else
   Begin
      xNum := StrToInt(Trim(cdsQry.FieldByName('X').AsString));
      Result := IntToStr(xNum + 1);
   End;
End;

Function TDM1.BuscaCodMod(Const sTabla, sMxCampo: String): String;
Var
   xSQL: String;
Begin
   xSQL := 'SELECT MAX(TO_NUMBER(NVL(ASOCODAUX, 0)))+1 X FROM APO201 WHERE ASOCODMOD =' + QuotedStr(SMXCAMPO);
   cdsQry.Close;
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;
   Result := cdsQry.FieldByName('X').AsString;
End;

Function TDM1.NumtoStr(wNumero: Double): String;
Var
   xNumStr, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12: String;
   xGrupo, xTotal, xDecimal: String;
   xLargo, xVeces: Integer;
Begin
   xNumStr := FloatToStr(Int(wNumero));
   xDecimal := FloatToStr(wNumero - Int(wNumero));
   If wNumero - Int(wNumero) > 0 Then
   Begin
      If Length(xDecimal) > 5 Then
      Begin
         If StrToInt(Copy(xDecimal, 5, 1)) >= 5 Then
            xDecimal := IntToStr(StrToInt(Copy(xDecimal, 3, 2)) + 1)
         Else
            xDEcimal := IntToStr(StrToInt(Copy(xDecimal, 3, 2)))
      End
      Else
         If StrToInt(Copy(xDecimal, 3, 1)) >= 5 Then
            xDecimal := IntToStr(StrToInt(Copy(xDecimal, 3, 2)))
   End
   Else
   Begin
      xDecimal := '00';
   End;
   xDecimal := ' y ' + xDecimal + '/100';
   xLargo := Length(xNumStr);
   x1 := '';
   x2 := '';
   x3 := '';
   x4 := '';
   x5 := '';
   x6 := '';
   x7 := '';
   x8 := '';
   x9 := '';
   x10 := '';
   If xLargo >= 1 Then x1 := Copy(xNumStr, xLargo, 1);
   If xLargo >= 2 Then x2 := Copy(xNumStr, xLargo - 1, 1);
   If xLargo >= 3 Then x3 := Copy(xNumStr, xLargo - 2, 1);
   If xLargo >= 4 Then x4 := Copy(xNumStr, xLargo - 3, 1);
   If xLargo >= 5 Then x5 := Copy(xNumStr, xLargo - 4, 1);
   If xLargo >= 6 Then x6 := Copy(xNumStr, xLargo - 5, 1);
   If xLargo >= 7 Then x7 := Copy(xNumStr, xLargo - 6, 1);
   If xLargo >= 8 Then x8 := Copy(xNumStr, xLargo - 7, 1);
   If xLargo >= 9 Then x9 := Copy(xNumStr, xLargo - 8, 1);
   If xLargo >= 10 Then x10 := Copy(xNumStr, xLargo - 9, 1);
   If xLargo >= 11 Then x11 := Copy(xNumStr, xLargo - 10, 1);
   If xLargo >= 12 Then x12 := Copy(xNumStr, xLargo - 11, 1);
   xVeces := 1;
   xTotal := '';
   While xVeces <= 4 Do // hasta 999,999'999,999
   Begin
      If xVeces = 2 Then
      Begin
         x1 := x4;
         x2 := x5;
         x3 := x6;
      End;
      If xVeces = 3 Then
      Begin
         x1 := x7;
         x2 := x8;
         x3 := x9;
      End;
      If xVeces = 4 Then
      Begin
         x1 := x10;
         x2 := x11;
         x3 := x12;
      End;
      If x2 = '1' Then // del 11 a 19
      Begin
         If x1 = '0' Then x2 := 'DIEZ';
         If x1 = '1' Then x2 := 'ONCE';
         If x1 = '2' Then x2 := 'DOCE';
         If x1 = '3' Then x2 := 'TRECE';
         If x1 = '4' Then x2 := 'CATORCE';
         If x1 = '5' Then x2 := 'QUINCE';
         If x1 = '6' Then x2 := 'DIECISEIS';
         If x1 = '7' Then x2 := 'DIECISIETE';
         If x1 = '8' Then x2 := 'DIECIOCHO';
         If x1 = '9' Then x2 := 'DIECINUEVE';
         x1 := '0';
      End
      Else
      Begin // del 0 al 9
         If x1 = '1' Then x1 := 'UNO';
         If (xVeces > 1) And (x1 = 'UNO') Then x1 := 'UN';
         If x1 = '2' Then x1 := 'DOS';
         If x1 = '3' Then x1 := 'TRES';
         If x1 = '4' Then x1 := 'CUATRO';
         If x1 = '5' Then x1 := 'CINCO';
         If x1 = '6' Then x1 := 'SEIS';
         If x1 = '7' Then x1 := 'SIETE';
         If x1 = '8' Then x1 := 'OCHO';
         If x1 = '9' Then x1 := 'NUEVE';
         If x2 = '2' Then
         Begin // veinte
            x2 := 'VEINTI';
            If x1 = '0' Then x2 := 'VEINTE';
         End;
         If x2 = '3' Then
         Begin
            x2 := 'TREINTI';
            If x1 = '0' Then x2 := 'TREINTA';
         End;
         If x2 = '4' Then
         Begin
            x2 := 'CUARENTI';
            If x1 = '0' Then x2 := 'CUARENTA';
         End;
         If x2 = '5' Then
         Begin
            x2 := 'CINCUENTI';
            If x1 = '0' Then x2 := 'CINCUENTA';
         End;
         If x2 = '6' Then
         Begin
            x2 := 'SESENTI';
            If x1 = '0' Then x2 := 'SESENTA';
         End;
         If x2 = '7' Then
         Begin
            x2 := 'SETENTI';
            If x1 = '0' Then x2 := 'SETENTA';
         End;
         If x2 = '8' Then
         Begin
            x2 := 'OCHENTI';
            If x1 = '0' Then x2 := 'OCHENTA';
         End;
         If x2 = '9' Then
         Begin
            x2 := 'NOVENTI';
            If x1 = '0' Then x2 := 'NOVENTA';
         End;
      End;
      If x3 = '1' Then x3 := 'CIENTO';
      If (x2 = '0') And (x1 = '0') And (x3 = 'CIENTO') Then
         x3 := 'CIEN';
      If x3 = '2' Then x3 := 'DOSCIENTOS';
      If x3 = '3' Then x3 := 'TRESCIENTOS';
      If x3 = '4' Then x3 := 'CUATROCIENTOS';
      If x3 = '5' Then x3 := 'QUINIENTOS';
      If x3 = '6' Then x3 := 'SEISCIENTOS';
      If x3 = '7' Then x3 := 'SETECIENTOS';
      If x3 = '8' Then x3 := 'OCHOCIENTOS';
      If x3 = '9' Then x3 := 'NOVECIENTOS';
      xGrupo := '';
      //xGrupo := x3;
      If x3 <> '0' Then xGrupo := x3;
      If x2 <> '0' Then xGrupo := xGrupo + ' ' + x2;
      If x1 <> '0' Then xGrupo := xGrupo + x1;
      If ((xVeces = 2) Or (xVeces = 4)) And (Length(xGrupo) > 1) Then
      Begin
         xGrupo := xGrupo + ' MIL';
      End;
      If (xVeces = 3) And (Length(xGrupo) > 1) Then
      Begin
         If x1 <> 'UN' Then
            xGrupo := xGrupo + ' MILLONES'
         Else
         Begin
            xGrupo := xGrupo + ' MILLÓN';
         End;
      End;
      If Length(xTotal) > 0 Then xGrupo := xGrupo + ' ';
      xTotal := xGrupo + xTotal;
      xVeces := xVeces + 1;
   End;
   Result := xTotal + xDecimal;
End;

Function DateS: TDatetime;
Var
   sSQL: String;
Begin
   sSQL := ' SELECT ' + DM1.wRepFecServi + ' FECHA  FROM TGE901 ';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(sSQL);
   DM1.cdsQry.Open;
   Result := DM1.cdsQry.fieldbyname('FECHA').AsDateTime;
End;

Function TDM1.VerificaAcceso(Pass, EncDes: String): String;
Begin
// Inicio: SPP_201403_PRE    15/07/2014  : Cambio de DCOM a Socket
{   If EncDes = '0' Then
      result := FAccesos.DesEncripta(Pass)
   Else
      result := FAccesos.Encripta(Pass);}
// Fin: SPP_201403_PRE       15/07/2014  : Cambio de DCOM a Socket
End;

Procedure TDM1.cdsMaestCartasReconcileError(DataSet: TCustomClientDataSet;
   E: EReconcileError; UpdateKind: TUpdateKind;
   Var Action: TReconcileAction);
Begin
   Action := HandleReconcileError(DataSet, UpdateKind, E);
End;

Function TDM1.FechaSys: tDateTime;
Var
   FormatoFecha: PChar;
Begin
   FormatoFecha := 'dd/MM/yyyy';
   SetLocaleInfo(LOCALE_SYSTEM_DEFAULT, LOCALE_SSHORTDATE, FormatoFecha);
   cdsQry9.Close;
   cdsQry9.DataRequest('SELECT TO_CHAR(SYSDATE,''dd/mm/yyyy'') AS FECHA FROM DUAL');
   cdsQry9.Open;
   If cdsQry9.RecordCount > 0 Then
      Result := FechasOutPut(cdsQry9.fieldbyname('FECHA').AsDateTime)
   Else
      Result := FechasOutPut(Date);
   cdsQry9.Close;
End;

Function TDM1.FechasOutPut(xFInput: tDateTime): tDateTime;
Begin
   Result := StrToDate(Copy(DateToStr(xFInput), 1, 10));
End;
//******************************************************
//   Fecha creacion : 22-Oct-2004
//   Objetivo : Entrega los años redondeados de servicio
//   Parametros de Entrada
//        xAnos son los años de servicio
//        xMeses son los meses de servicio
//   Parametro de Salida
//        Años redondeados de servicio redondeados
//******************************************************

Function TDM1.ASR(xAnos, xMeses: byte): byte;
Var
   rAnos: Byte;
Begin
   rAnos := xAnos;
   If (xMeses > 6) Then
      inc(rAnos);
   Result := rAnos;
End;

Function TDM1.desubigeo(vUbigeo: String): String;
Var
   xSql, retorna: String;
Begin
   xSql := 'SELECT UBIGEOID, UBIGEODES, CODDPTO, UBIGEODPTO, CODPROV, UBIGEOPROV,'
      + '       CODDIST, UBIGEODIST '
      + '  FROM TGE147 '
      + ' WHERE UBIGEOID = ' + QuotedStr(Copy(vUbigeo, 1, 2) + '0000');
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   retorna := DM1.cdsQry.FieldByName('UBIGEODES').AsString + '/';
   xSql := 'SELECT UBIGEOID, UBIGEODES, CODDPTO, UBIGEODPTO, CODPROV, UBIGEOPROV,'
      + '       CODDIST, UBIGEODIST '
      + '  FROM TGE147 WHERE UBIGEOID = ' + QuotedStr(Copy(vUbigeo, 1, 4) + '00');
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   retorna := retorna + DM1.cdsQry.FieldByName('UBIGEODES').AsString + '/';
   xSql := 'SELECT UBIGEOID, UBIGEODES, CODDPTO, UBIGEODPTO, CODPROV, UBIGEOPROV,'
      + '       CODDIST, UBIGEODIST '
      + '  FROM TGE147 WHERE UBIGEOID = ' + QuotedStr(vUbigeo);
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   retorna := retorna + DM1.cdsQry.FieldByName('UBIGEODES').AsString;
   Result := retorna;
   Exit;
End;

Function TDM1.desuse(vuse, vupagoid, vuproid: String): String;
Var
   xSql, resulta: String;
Begin
   xSql := 'SELECT USEID,USENOM,USEABRE,USETELF,USEDIR,DIRDPTOID,DIRPROVID,DIRZIPID,'
      + '       DPTOID,CIUDID,ZONAID,UPROID,UPAGOID,TIPUSEID,CCOSID,USUARIO,FREG,'
      + '       HREG,CODANT,FLGFUSION,CUENTAID,FLGACT,FDESHABILITADO,OFDESID,DIGABC,'
      + '       ABCID,ZONORIOPE,AMBITO,CODCARGO,DIGMASREP,AUTDESCUO,CODCARGODO,'
      + '       DIGMASREPDO,CODCARGOCE,DIGMASREPCE,FLACAR,CAPEND '
      + '  FROM APO101 '
      + ' WHERE USEID = ' + QuotedStr(vuse) + ' AND UPAGOID = ' + QuotedStr(vupagoid) + ' AND UPROID = ' + QuotedStr(vuproid);
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   result := vuse + ' - ' + DM1.cdsQry.FieldByName('USENOM').AsString;
   exit;
End;

Function TDM1.tiempoTranscurrido(fechaFinal, fechaInicial: TDate; xflg: String): String;
Begin
   DecodeDate(fechaInicial, anoInicial, mesInicial, diaInicial);
   DecodeDate(fechaFinal, anoFinal, mesFinal, diaFinal);
   anosTranscurridos := Int(anoFinal - anoInicial);
   If (mesInicial <= mesFinal) Then
      mesesTranscurridos := mesFinal - mesInicial
   Else
   Begin
      mesesTranscurridos := mesFinal + 12 - mesInicial;
      anosTranscurridos := anosTranscurridos - 1;
   End;
   If (diaInicial <= diaFinal) Then
      diasTranscurridos := diaFinal - diaInicial
   Else
   Begin
      diasTranscurridos := diaFinal + MonthDays[IsLeapYear(anoFinal), mesFinal] - diaInicial;
      mesesTranscurridos := mesesTranscurridos - 1;
   End;
  //Caso especial donde no ha cumplido años, pero los cumplirá el mismo mes
   If mesesTranscurridos < 0 Then
   Begin
      anosTranscurridos := anosTranscurridos - 1;
      mesesTranscurridos := 12 + mesesTranscurridos;
   End;
   If xflg = '0' Then
      Result := Format('AÑOS : %.0f, MESES : %.0f, DIAS : %.0f', [anosTranscurridos, mesesTranscurridos, diasTranscurridos])
   Else
      Result := Format('%.0f AÑOS, %.0f MESES', [anosTranscurridos, mesesTranscurridos]);
End;

//Inicio: DPP_201207_PRE
Procedure TDM1.calculacreditos(xAsoid: String);
Var
   xSql: String;
   cuodes, montoDescontar: Double;
   mesactual, mesanterior: String;
Begin
   DM1.cdsCalCre.EmptyDataSet;
   DM1.cdsCalCuo.EmptyDataSet;
   DM1.xMonCreDes := 0;

// Inicio HPC_201504_PRE : Descuentos por aplicaciones de CCI
   montoDescontar := (DM1.liquidacionbeneficio - DM1.montoliquidacionanterior) + DM1.montoDevApo - DM1.montoNivApo - DM1.montoRetencion - totalMontoCCI;
// Fin  HPC_201504_PRE : Descuentos por aplicaciones de CCI

   // Se añaden las variables mesactual, mesanterior
   xSql := 'SELECT TO_CHAR(SYSDATE,''YYYYMM'') MES_ACTUAL,  TO_CHAR(ADD_MONTHS(SYSDATE, -1),''YYYYMM'') MES_ANTERIOR FROM DUAL';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   mesactual   := DM1.cdsQry.FieldByName('MES_ACTUAL').AsString;
   mesanterior := DM1.cdsQry.FieldByName('MES_ANTERIOR').AsString;
// Inicio: SPP_201301_PRE
//   xSql := 'BEGIN DB2ADMIN.SP_COB_POLITICA_AMORTI_PRE('+QuotedStr(xAsoid)+',NULL,''1'',''1'','+FloatToStr(montoDescontar)+','+QuotedStr(mesactual)
   xSql := 'BEGIN DB2ADMIN.SP_COB_POLITICA_AMORTIZACION('+QuotedStr(xAsoid)+',NULL,''1'',''1'','+FloatToStr(montoDescontar)+','+QuotedStr(mesactual)
// Fin: SPP_201301_PRE
   +','+QuotedStr(mesanterior)+',NULL); END;';
   DM1.DCOM1.AppServer.EjecutaSQL(xSql);
   // Guardando en ClientDataSet las cabeceras de creditos pendientes
   xSql := 'SELECT A.ASOID, A.CREDID, A.CREFOTORG, A.TIPCREID, A.TIPCREDES, C.CREMTOOTOR, D.SALDO, D.PAGO'
   +' FROM DB2ADMIN.COB_POLITICA_CUO_GTT A, CRE110 B, CRE301 C, (SELECT ASOID, CREDID, SUM(NVL(SALDO,0)) SALDO, SUM(NVL(PAGO,0)) PAGO FROM DB2ADMIN.COB_POLITICA_CUO_GTT WHERE ASOID = '+QuotedStr(xAsoid)+' GROUP BY ASOID, CREDID) D'
   +' WHERE A.ASOID = '+QuotedStr(xAsoid)
   +' AND A.ASOID = C.ASOID AND A.CREDID = C.CREDID'
   +' AND A.ASOID = D.ASOID AND A.CREDID = D.CREDID'
   +' GROUP BY A.ASOID, A.CREDID, A.CREFOTORG, A.TIPCREID, A.TIPCREDES, C.CREMTOOTOR, D.SALDO, D.PAGO';
   DM1.cdsQry5.Close;
   DM1.cdsQry5.DataRequest(xSql);
   DM1.cdsQry5.Open;
   While Not DM1.cdsQry5.Eof Do
   Begin
      DM1.cdsCalCre.Append;
      DM1.cdsCalCre.FieldByName('ASOID').AsString     := DM1.cdsQry5.FieldByName('ASOID').AsString;
      DM1.cdsCalCre.FieldByName('CREDID').AsString    := DM1.cdsQry5.FieldByName('CREDID').AsString;
      DM1.cdsCalCre.FieldByName('CREFOTORG').AsString := DM1.cdsQry5.FieldByName('CREFOTORG').AsString;
      DM1.cdsCalCre.FieldByName('TIPCREID').AsString  := DM1.cdsQry5.FieldByName('TIPCREID').AsString;
      DM1.cdsCalCre.FieldByName('TIPCREDES').AsString := Copy(DM1.cdsQry5.FieldByName('TIPCREDES').AsString, 1, 20);
      DM1.cdsCalCre.FieldByName('CREMTOOTOR').AsFloat := DM1.cdsQry5.FieldByName('CREMTOOTOR').AsFloat;
      DM1.cdsCalCre.FieldByName('CRESDOACT').AsFloat  := DM1.cdsQry5.FieldByName('SALDO').AsFloat;
      DM1.cdsCalCre.FieldByName('CREMTODES').AsFloat  := DM1.cdsQry5.FieldByName('PAGO').AsFloat;
      DM1.cdsQry5.Next;
   End;
   // Guardando en ClientDataSet los cronograma de pagos
   xSql := 'SELECT * FROM DB2ADMIN.COB_POLITICA_CUO_GTT WHERE NVL(PAGO,0) > 0 ORDER BY XID';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   While Not DM1.cdsQry.Eof Do
   Begin
     DM1.cdsCalCuo.Append;
     DM1.cdsCalCuo.FieldByName('ASOID').AsString        := DM1.cdsQry.FieldByName('ASOID').AsString;
     DM1.cdsCalCuo.FieldByName('CREDID').AsString       := DM1.cdsQry.FieldByName('CREDID').AsString;
     DM1.cdsCalCuo.FieldByName('CRECUOTA').AsFloat      := DM1.cdsQry.FieldByName('CUOTA').AsFloat;
     DM1.cdsCalCuo.FieldByName('CREMTO').AsFloat        := DM1.cdsQry.FieldByName('PAGO').AsFloat;
     // Generando temporal de distribución de pago de cuotas. Esto es solo informativo para el previo de la liquidación.
     xSql := 'SELECT * FROM CRE302 WHERE ASOID = '+QuotedStr(DM1.cdsCalCuo.FieldByName('ASOID').AsString)+' AND CREDID = '+QuotedStr(DM1.cdsCalCuo.FieldByName('CREDID').AsString)+' AND CRECUOTA = '+QuotedStr(DM1.cdsCalCuo.FieldByName('CRECUOTA').AsString);
     DM1.cdsQry2.Close;
     DM1.cdsQry2.DataRequest(xSql);
     DM1.cdsQry2.Open;
     cuodes := DM1.cdsCalCuo.FieldByName('CREMTO').AsFloat;
     // Flat
     If cuodes > (DM1.cdsQry2.FieldByName('CREFLAT').AsFloat-DM1.cdsQry2.FieldByName('CREMTOFLAT').AsFloat) Then
     Begin
        DM1.cdsCalCuo.FieldByName('CREFLAT').AsFloat := DM1.cdsQry2.FieldByName('CREFLAT').AsFloat-DM1.cdsQry2.FieldByName('CREMTOFLAT').AsFloat;
        cuodes := cuodes - (DM1.cdsQry2.FieldByName('CREFLAT').AsFloat-DM1.cdsQry2.FieldByName('CREMTOFLAT').AsFloat);
     End
     Else
     Begin
        DM1.cdsCalCuo.FieldByName('CREFLAT').AsFloat := cuodes;
        cuodes := 0;
     End;
     // Desgravamen
     If cuodes > (DM1.cdsQry2.FieldByName('MONPACDESGRAV').AsFloat-DM1.cdsQry2.FieldByName('MONCOBDESGRAV').AsFloat) Then
     Begin
        DM1.cdsCalCuo.FieldByName('MONCOBDESGRAV').AsFloat := DM1.cdsQry2.FieldByName('MONPACDESGRAV').AsFloat-DM1.cdsQry2.FieldByName('MONCOBDESGRAV').AsFloat;
        cuodes := cuodes - (DM1.cdsQry2.FieldByName('MONPACDESGRAV').AsFloat-DM1.cdsQry2.FieldByName('MONCOBDESGRAV').AsFloat);
     End
     Else
     Begin
        DM1.cdsCalCuo.FieldByName('MONCOBDESGRAV').AsFloat := cuodes;
        cuodes := 0;
     End;
     // Interes
     If cuodes > (DM1.cdsQry2.FieldByName('CREINTERES').AsFloat-DM1.cdsQry2.FieldByName('CREMTOINT').AsFloat) Then
     Begin
        DM1.cdsCalCuo.FieldByName('CREINTERES').AsFloat := DM1.cdsQry2.FieldByName('CREINTERES').AsFloat-DM1.cdsQry2.FieldByName('CREMTOINT').AsFloat;
        cuodes := cuodes - (DM1.cdsQry2.FieldByName('CREINTERES').AsFloat-DM1.cdsQry2.FieldByName('CREMTOINT').AsFloat);
     End
     Else
     Begin
        DM1.cdsCalCuo.FieldByName('CREINTERES').AsFloat := cuodes;
        cuodes := 0;
     End;
     // Amortización
     If cuodes > (DM1.cdsQry2.FieldByName('CREAMORT').AsFloat-DM1.cdsQry2.FieldByName('CRECAPITAL').AsFloat) Then
     Begin
        DM1.cdsCalCuo.FieldByName('CREAMORT').AsFloat := DM1.cdsQry2.FieldByName('CREAMORT').AsFloat-DM1.cdsQry2.FieldByName('CRECAPITAL').AsFloat;
        cuodes := cuodes - (DM1.cdsQry2.FieldByName('CREAMORT').AsFloat-DM1.cdsQry2.FieldByName('CRECAPITAL').AsFloat);
     End
     Else
     Begin
        DM1.cdsCalCuo.FieldByName('CREAMORT').AsFloat := cuodes;
        cuodes := 0;
     End;
     DM1.cdsQry.Next;
   End;
End;
//Fin: DPP_201207_PRE

// Inicio: HPC_201703_PRE
// Se retira procedimiento del calculo de las nivelaciones y devoluciones
// Procedure TDM1.calculaNivDev(xAsoid, xFecNom, xFecCes: String);
// Var
//    xSql, xFec, xanomesultapo: String;
//
//    Procedure agregarNivelacion();
//    Begin
//       DM1.cdsNivApo.Append;
//       DM1.cdsNivApo.FieldByName('ASOID').AsString := DM1.cdsAportes.FieldByName('ASOID').AsString;
//       DM1.cdsNivApo.FieldByName('TRANSANO').AsString := DM1.cdsAportes.FieldByName('TRANSANO').AsString;
//       DM1.cdsNivApo.FieldByName('TRANSMES').AsString := DM1.cdsAportes.FieldByName('TRANSMES').AsString;
//       DM1.cdsNivApo.FieldByName('ESTADO').AsString := DM1.cdsAportes.FieldByName('ESTADO').AsString;
//       DM1.cdsNivApo.FieldByName('MONTO').AsCurrency := DM1.cdsAportes.FieldByName('MONTO').AsCurrency;
//       DM1.cdsNivApo.FieldByName('CASO').AsString := DM1.cdsAportes.FieldByName('CASO').AsString;
//       DM1.cdsNivApo.Post;
//       DM1.montoNivApo := DM1.montoNivApo + DM1.cdsAportes.FieldByName('MONTO').AsFloat;
//    End;
//
//    Procedure agregarDevolucion();
//    Begin
//       DM1.cdsDevApo.Append;
//       DM1.cdsDevApo.FieldByName('ASOID').AsString := DM1.cdsAportes.FieldByName('ASOID').AsString;
//       DM1.cdsDevApo.FieldByName('TRANSANO').AsString := DM1.cdsAportes.FieldByName('TRANSANO').AsString;
//       DM1.cdsDevApo.FieldByName('TRANSMES').AsString := DM1.cdsAportes.FieldByName('TRANSMES').AsString;
//       DM1.cdsDevApo.FieldByName('ESTADO').AsString := DM1.cdsAportes.FieldByName('ESTADO').AsString;
//       DM1.cdsDevApo.FieldByName('MONTO').AsCurrency := DM1.cdsAportes.FieldByName('MONTO').AsCurrency;
//       DM1.cdsDevApo.FieldByName('CASO').AsString := DM1.cdsAportes.FieldByName('CASO').AsString;
//       DM1.cdsDevApo.Post;
//       DM1.montoDevApo := DM1.montoDevApo + DM1.cdsAportes.FieldByName('MONTO').AsCurrency;
//    End;
// Begin
//    xFec := Copy(xFecCes, 7, 4) + Copy(xFecCes, 4, 2) + Copy(xFecCes, 1, 2);
//    xanomesultapo := Copy(DM1.cdsExpLiq.FieldByName('PVSULTAPO').AsString, 1, 4) + Copy(DM1.cdsExpLiq.FieldByName('PVSULTAPO').AsString, 6, 2);
//    DM1.montoNivApo := 0;
//    DM1.montoDevApo := 0;
//    DM1.cdsNivApo.EmptyDataSet;
//    DM1.cdsDevApo.EmptyDataSet;
//    xSql := ' SELECT A.ASOID, A.TRANSANO, A.TRANSMES, ''DEV'' ESTADO, '
//       + '        NVL(A.TRANSMTO,0)-NVL(A.TRANSMTODEV,0) MONTO, ''AN'' CASO '
//       + ' FROM APO301 A, PVS301 B '
//       + ' WHERE A.ASOID = ' + QuotedStr(xAsoid)
//       + '   AND A.ASOID = B.ASOID '
//       + '   AND A.TRANSANO||A.TRANSMES < TO_CHAR(TO_DATE(' + QuotedStr(xFecNom) + '), ''YYYYMM'')'
//       + '   AND NVL(A.TRANSMTO,0)-NVL(A.TRANSMTODEV,0) > 0'
//       + ' AND A.PVSLBENNR IS NULL'
//       + ' UNION '
//    +' SELECT A.ASOID, A.APOANO TRANSANO, A.APOMES TRANSMES, ''NIV'' ESTADO, NVL(A.APOVALOR,0)-(NVL(B.TRANSMTO,0)-NVL(B.TRANSMTODEV,0)) MONTO, ''AC'' CASO'
//    +' FROM (SELECT B.ASOID, A.APOANO, A.APOMES, A.APOVALOR FROM APO117 A, PVS301 B WHERE  B.ASOID = '+QuotedStr(xAsoid)
//    +' AND A.APOANO||A.APOMES >= TO_CHAR(TO_DATE('+QuotedStr(xFecNom)+'), ''YYYYMM'')'
//    +' AND A.APOANO||A.APOMES <= TO_CHAR(TO_DATE('+QuotedStr(xFecCes)+'), ''YYYYMM'')'
//    +' ) A,'
//    +' (SELECT ASOID, TRANSANO, TRANSMES, SUM(NVL(TRANSMTO,0)) TRANSMTO, SUM(NVL(TRANSMTODEV,0)) TRANSMTODEV FROM APO301'
//    +' WHERE ASOID = '+QuotedStr(xAsoid)
//    +' AND TRANSANO||TRANSMES >= TO_CHAR(TO_DATE('+QuotedStr(xFecNom)+'), ''YYYYMM'')'
//    +' AND TRANSANO||TRANSMES <= TO_CHAR(TO_DATE('+QuotedStr(xFecCes)+'), ''YYYYMM'')'
//    +' GROUP BY ASOID, TRANSANO, TRANSMES) B'
//    +' WHERE A.ASOID = B.ASOID(+) AND A.APOANO = B.TRANSANO(+) AND A.APOMES = B.TRANSMES(+) AND NVL(A.APOVALOR,0)-(NVL(B.TRANSMTO,0)-NVL(B.TRANSMTODEV,0)) > 0'
//    +' UNION ';
//    // Se cambia para diferenciar las devoluciones de Retiro versus las de Fallecimiento o Invalidez
//    If DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString = '01' Then // Retiro
//       xSql := xSql
//          + ' SELECT A.ASOID, A.TRANSANO, A.TRANSMES, ''DEV'' ESTADO, '
//          + '        NVL(A.TRANSMTO,0)-NVL(A.TRANSMTODEV,0) MONTO, ''DC'' CASO '
//          + ' FROM APO301 A, PVS301 B '
//          + ' WHERE A.ASOID = ' + QuotedStr(xAsoid)
//          + '   AND A.ASOID = B.ASOID '
//          + '   AND A.APOSEC > TO_CHAR(TO_DATE(' + QuotedStr(xFecCes) + '), ''YYYYMM'') '
//          + '   AND NVL(A.TRANSMTO,0)-NVL(A.TRANSMTODEV,0) > 0 '
//          + '   AND A.APOSEC <= ' + QuotedStr(xanomesultapo) // SE CONSIDERA APOSEC en vez de A.TRANSANO||A.TRANSMES
//    Else // Liquidacion por Invalidez o Fallecimiento
//       xSql := xSql
//          + ' SELECT A.ASOID, A.TRANSANO, A.TRANSMES, ''DEV'' ESTADO, '
//          + '        NVL(A.TRANSMTO,0)-NVL(A.TRANSMTODEV,0) MONTO, ''DC'' CASO '
//          + ' FROM APO301 A, PVS301 B '
//          + ' WHERE A.ASOID = ' + QuotedStr(xAsoid)
//          + '   AND A.ASOID = B.ASOID '
//          + '   AND A.TRANSANO||A.TRANSMES > TO_CHAR(TO_DATE(' + QuotedStr(xFecCes) + '), ''YYYYMM'') '
//          + '   AND NVL(A.TRANSMTO,0)-NVL(A.TRANSMTODEV,0) > 0 '
//          + '   AND A.TRANSANO||A.TRANSMES <= ' + QuotedStr(xanomesultapo);
//    // FIN - HPP_200903_PRE
//    DM1.cdsAportes.Close;
//    DM1.cdsAportes.DataRequest(xSql);
//    DM1.cdsAportes.Open;
//    DM1.cdsAportes.First;
//    While Not DM1.cdsAportes.Eof Do
//    Begin
//       If (xFec < '19970101') Then
//       Begin
//          If DM1.cdsAportes.FieldByName('ESTADO').AsString = 'NIV' Then agregarNivelacion();
//          If DM1.cdsAportes.FieldByName('ESTADO').AsString = 'DEV' Then agregarDevolucion();
//       End
//       Else
//       Begin
//          If (DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString = '01') Then
//          Begin
//             If (DM1.cdsAportes.FieldByName('ESTADO').AsString = 'DEV')
//                And (DM1.cdsAportes.FieldByName('CASO').AsString = 'DC') Then agregarDevolucion();
//          End
//          Else
//          Begin
//             If (DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString = '02')
//                Or (DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString = '03') Then
//             Begin
//                If (((DM1.cdsExpLiq.FieldByName('AUTDESAPO').AsString = 'S') and (DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsDateTime > StrToDate('31/12/2006')) )
//                 Or (DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsDateTime < StrToDate('01/01/2007'))) then
//                Begin
//                   if (DM1.montoDiferencial>0) and (DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsDateTime > DM1.cdsExpLiq.FieldByName('FECAUTDESAPO').AsDateTime) then
//                      If DM1.cdsAportes.FieldByName('ESTADO').AsString = 'NIV' Then agregarNivelacion();
//                   If DM1.cdsAportes.FieldByName('ESTADO').AsString = 'DEV' Then agregarDevolucion();
//                End;
//             End;
//          End;
//       End;
//       DM1.cdsAportes.Next;
//    End;
// End;
// Fin: HPC_201703_PRE




Procedure TDM1.calculaliquidacion;
Var
  // Inicio: SPP_201303_PRE - Se añade variable "ultanomescal" que almacena el ultimo ano y mes del calculo de la cuenta individual
   tmes, xSql, ultanomescal: String;
  // Fin: SPP_201303_PRE
Begin
   DM1.liquidacionbeneficio := 0;
   DM1.aportesCtaInd := 0;
   DM1.interesesCtaInd := 0;
   DM1.bonusCtaInd := 0;
   DM1.calculoA1996CtaInd := 0;
   DM1.montoTabRet := 0;
   DM1.montoTabCap := 0;
   DM1.montoTabSep := 0;
   DM1.montoUIT := 0;
   DM1.montoTabInv := 0;
   DM1.montoDiferencial := 0;
   DM1.cantidadUIT := 0;
   // Hallando los años de servicio
   DM1.tTiempoTranscurrido := DM1.tiempoTranscurrido(DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsDateTime, DM1.cdsExpLiq.FieldByName('ASOFRESNOM').AsDateTime, '0');
   If (DM1.mesesTranscurridos > 6) Or ((DM1.mesesTranscurridos = 6) And (DM1.diasTranscurridos > 15)) Then
      DM1.anoServicio := DM1.anosTranscurridos + 1
   Else
      DM1.anoServicio := DM1.anosTranscurridos;
   If DM1.anoServicio > 30 Then DM1.anoServicio := 30;
   // Hallando la edad en caso que sea por invalidez
   If DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString = '03' Then
   Begin
      DM1.edadInvalidez := int(YearSpan(DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsDateTime, DM1.cdsAsociado.FieldByName('ASOFECNAC').AsDateTime));
      If DM1.edadInvalidez < 31 Then
         DM1.edadInvalidez := 31;
      If DM1.edadInvalidez > 65 Then
         DM1.edadInvalidez := 65;
   End;
   // liquidacion por retiro
   If DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString = '01' Then
   Begin
      If DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsDateTime < StrToDate('01/01/1997') Then
      Begin
         // tabla de retiro
         tmes := 'PVSRMM' + DM1.StrZero(CurrToStr(DM1.mesFinal), 2);
         xSql := 'SELECT ' + tmes + ' VALOR '
            + 'FROM PVS104 '
            + 'WHERE PVSRANO = ' + QuotedStr(CurrToStr(DM1.anoFinal))
            + '  AND PVSRSERV = ' + QuotedStr(DM1.StrZero(CurrToStr(DM1.anoServicio), 2));
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         DM1.MontoTabRet := DM1.cdsQry.FieldByName('VALOR').AsCurrency;
      End
      Else
      Begin
         // Cuenta Individual
         DM1.DCOM1.AppServer.EjecutaSQL('DELETE T_CTAIND1');
         If DM1.xCnd = 'R' Then
            xSql := 'BEGIN '
               + '   P_CUENTA_INDIVIDUAL(' + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString) + ','
               + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOFRESNOM').AsString) + ','
               + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsString) + ','
               + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)+', ''S''); '
               + 'END;'
         Else
            xSql := 'BEGIN '
               + '   P_CUENTA_INDIVIDUAL(' + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString) + ','
               + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOFRESNOM').AsString) + ','
               + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsString) +','''',''N''); '
               + 'END;';

         DM1.DCOM1.AppServer.EjecutaSQL(xSql);
         xSql := 'SELECT SUM(NVL(CAPITAL,0)) CAPITAL, SUM(NVL(INTCAPACU,0)) INTCAPACU, '
            + '       SUM(NVL(BONOS,0)) BONOS FROM T_CTAIND1 '
            + 'WHERE ASOID = ' + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString);
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;

         If (DM1.cdsQry.FieldByName('CAPITAL').AsCurrency <> 0) Or
            (DM1.cdsQry.FieldByName('INTCAPACU').AsCurrency <> 0) Or
            (DM1.cdsQry.FieldByName('BONOS').AsCurrency <> 0) Then
         Begin
            DM1.aportesCtaInd := DM1.cdsQry.FieldByName('CAPITAL').AsCurrency;
            DM1.InteresesCtaInd := DM1.cdsQry.FieldByName('INTCAPACU').AsCurrency;
            DM1.BonusCtaInd := DM1.cdsQry.FieldByName('BONOS').AsCurrency;
            xSql := 'SELECT ACUMESANT, ANOSER  '
               + 'FROM T_CTAIND1 '
               + 'WHERE ASOID = ' + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString) + ' '
               + 'ORDER BY ANO, MES';
            DM1.cdsQry.Close;
            DM1.cdsQry.DataRequest(xSql);
            DM1.cdsQry.Open;
            DM1.cdsQry.First;
            DM1.anoServicio1996 := StrToCurr(DM1.cdsQry.FieldByName('ANOSER').AsString);
            DM1.calculoA1996CtaInd := DM1.cdsQry.FieldByName('ACUMESANT').AsCurrency;
         End;
      End;
   End;
// Liquidacion por fallecimiento
   If DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString = '02' Then
   Begin
      If DM1.anoFinal < 1997 Then
    // tabla de sepelio + capital de deudos
      Begin
      // tabla de sepelio
         tmes := 'PVSSMM' + DM1.StrZero(CurrToStr(DM1.mesFinal), 2);
         xSQL := 'SELECT ' + tmes + ' VALOR '
            + 'FROM PVS106 '
            + 'WHERE PVSSANO = ' + QuotedStr(CurrToStr(DM1.anoFinal))
            + '  AND PVSSSERV = ' + QuotedStr(DM1.StrZero(CurrToStr(DM1.anoServicio), 2));
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         DM1.MontoTabSep := DM1.cdsQry.FieldByName('VALOR').AsCurrency;
      // tabla de capital de deudos
         tmes := 'PVSCMM' + DM1.StrZero(CurrToStr(DM1.mesFinal), 2);
         xSQL := 'SELECT ' + tmes + ' VALOR '
            + 'FROM PVS107 '
            + 'WHERE PVSCANO = ' + QuotedStr(CurrToStr(DM1.anoFinal))
            + '  AND PVSCSERV = ' + QuotedStr(DM1.StrZero(CurrToStr(DM1.anoServicio), 2));
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         DM1.MontoTabCap := DM1.cdsQry.FieldByName('VALOR').AsCurrency;
      End
      Else
      Begin
         If DM1.anoFinal = 1997 Then
      // Tabla de Retiro + 2 UIT
         Begin
         // Tabla de Retiro
            tmes := 'PVSRMM' + DM1.StrZero(CurrToStr(DM1.mesFinal), 2);
            xSql := 'SELECT ' + tmes + ' VALOR '
            +'FROM PVS104 '
            +'WHERE PVSRANO = ' +QuotedStr(CurrToStr(DM1.anoFinal))
            +' AND PVSRSERV = ' + QuotedStr(DM1.StrZero(CurrToStr(DM1.anoServicio), 2));
            DM1.cdsQry.Close;
            DM1.cdsQry.DataRequest(xSql);
            DM1.cdsQry.Open;
            DM1.MontoTabRet := DM1.cdsQry.FieldByName('VALOR').AsCurrency;
        // 2 UIT
            xSQL := 'SELECT UITNUMER, UITNUMER * UITMONTO UIT, UITMONTO '
               +'FROM TGE188 '
               +'WHERE '+QuotedStr(DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsString)
               +' >= UITFCINI '
               +'  AND '+QuotedStr(DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsString)
               +' <=  UITFCFIN'
               +' AND UITTIPBE = ''F'' ';
            DM1.cdsQry.Close;
            DM1.cdsQry.DataRequest(xSql);
            DM1.cdsQry.Open;
            DM1.cantidadUIT := DM1.cdsQry.FieldByName('UITNUMER').AsCurrency;
            DM1.MontoUIT := DM1.cdsQry.FieldByName('UIT').AsCurrency;
            DM1.UIT := DM1.cdsQry.FieldByName('UITMONTO').AsCurrency;
         End
         Else
      // Cuenta individual + 2 UIT - cuenta individual
         Begin
        // Cuenta Individual
            DM1.DCOM1.AppServer.EjecutaSQL('DELETE T_CTAIND1');
            // Inicio: HPC_201805_PRE  Calculo de las cuentas individuales para los casos de reliquidaciones
            // Se modifica procedimiento de calculo de nivelaciones y devoluciones
            If DM1.xCnd = 'R' Then
               xSql := 'BEGIN '
               + '   P_CUENTA_INDIVIDUAL(' + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString) + ','
               + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOFRESNOM').AsString) + ','
               + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsString) + ','
               + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)+', ''S''); '
               + 'END;'
            Else
               xSql := 'BEGIN '
               + '   P_CUENTA_INDIVIDUAL(' + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString) + ','
               + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOFRESNOM').AsString) + ','
               + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsString) +','''',''N''); '
               + 'END;';
            // xSql := 'BEGIN '
            //    + '  P_CUENTA_INDIVIDUAL(' + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString) + ','
            //    + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOFRESNOM').AsString) + ','
            //    + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsString)+ ','''',''N''); '
            //    + 'END;';
            // Fin: HPC_201805_PRE
            DM1.DCOM1.AppServer.EjecutaSQL(xSql);
            xSql := 'SELECT SUM(NVL(CAPITAL,0)) CAPITAL, SUM(NVL(INTCAPACU,0)) INTCAPACU, '
            +' SUM(NVL(BONOS,0)) BONOS '
            +' FROM T_CTAIND1 '
            +' WHERE ASOID = ' +QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString);
            DM1.cdsQry.Close;
            DM1.cdsQry.DataRequest(xSql);
            DM1.cdsQry.Open;
           
           If (DM1.cdsQry.FieldByName('CAPITAL').AsCurrency <> 0) Or
              (DM1.cdsQry.FieldByName('INTCAPACU').AsCurrency <> 0) Or
              (DM1.cdsQry.FieldByName('BONOS').AsCurrency <> 0) Then
           Begin
              DM1.aportesCtaInd   := DM1.cdsQry.FieldByName('CAPITAL').AsCurrency;
              DM1.interesesCtaInd := DM1.cdsQry.FieldByName('INTCAPACU').AsCurrency;
              DM1.bonusCtaInd     := DM1.cdsQry.FieldByName('BONOS').AsCurrency;
              // Inicio: SPP_201303_PRE
               xSql := 'SELECT ACUMESANT, ANOSER FROM T_CTAIND1 WHERE ASOID = '+QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString)+' ORDER BY ANO, MES';
               // Fin: SPP_201303_PRE
               DM1.cdsQry.Close;
               DM1.cdsQry.DataRequest(xSql);
               DM1.cdsQry.Open;
               DM1.calculoA1996CtaInd := DM1.cdsQry.FieldByName('ACUMESANT').AsCurrency;
               DM1.anoServicio1996    := StrToCurr(DM1.cdsQry.FieldByName('ANOSER').AsString);
               If ((DM1.cdsExpLiq.FieldByName('AUTDESAPO').AsString = 'S') And (DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsDateTime > StrToDate('31/12/2006')) And (DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsDateTime > DM1.cdsExpLiq.FieldByName('FECAUTDESAPO').AsDateTime))
                Or (DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsDateTime < StrToDate('01/01/2007') ) Then
               Begin
               // 2 UIT
                  xSql := 'SELECT UITNUMER, UITNUMER * UITMONTO UIT, UITMONTO '
                  +' FROM TGE188 '
                  +' WHERE ' + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsString)
                  + ' >= UITFCINI '
                  +' AND '+QuotedStr(DM1.cdsExpliq.FieldByName('ASOFRESCESE').AsString)
                  +' <=  UITFCFIN '
                  +' AND UITTIPBE = ''F''';
                  DM1.cdsQry.Close;
                  DM1.cdsQry.DataRequest(xSql);
                  DM1.cdsQry.Open;
                  DM1.cantidadUIT := DM1.cdsQry.FieldByName('UITNUMER').AsCurrency;
                  DM1.montoUIT := DM1.cdsQry.FieldByName('UIT').AsCurrency;
                  // Inicio: SPP_201307_PRE
                  // Se calcula el monto por fallecimiento segun los nuevos parametros
                  DM1.UIT := DM1.cdsQry.FieldByName('UITMONTO').AsCurrency;
                  If DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsDateTime < StrToDate('01/09/2013') Then
                     DM1.montoDiferencial := DM1.MontoUIT - (DM1.aportesCtaInd + DM1.interesesCtaInd + DM1.bonusCtaInd + DM1.calculoA1996CtaInd)
                  Else
                     If (DM1.aportesCtaInd + DM1.interesesCtaInd + DM1.bonusCtaInd + DM1.calculoA1996CtaInd) > DM1.UIT * 1.5 Then
                     Begin
                        DM1.cantidadUIT := 0.5;
                        DM1.montoDiferencial := DM1.UIT * DM1.cantidadUIT;
                     End
                     Else
                        DM1.montoDiferencial := DM1.MontoUIT - (DM1.aportesCtaInd + DM1.interesesCtaInd + DM1.bonusCtaInd + DM1.calculoA1996CtaInd);
                  DM1.montoUIT := 0;
               End
               Else DM1.montoDiferencial := 0;
               // Fin: SPP_201307_PRE
            End;
         End;
      End;
   End;
   // Liquidacion por invalidez
   If DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString = '03' Then
   Begin
      If DM1.anoFinal < 1997 Then
      // tabla de retiro + tabla de invalidez
      Begin
         // tabla de retiro
         tmes := 'PVSRMM' + DM1.StrZero(CurrToStr(DM1.mesFinal), 2);
         xSql := 'SELECT '+tmes+' VALOR '
         +' FROM PVS104 '
         +' WHERE PVSRANO = '+QuotedStr(CurrToStr(DM1.anoFinal))
         +' AND PVSRSERV = '+QuotedStr(DM1.StrZero(CurrToStr(DM1.anoServicio), 2));
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         DM1.montoTabRet := DM1.cdsQry.FieldByName('VALOR').AsCurrency;
         // Tabla de Invalidez
         tmes := 'PVSIMM' + DM1.StrZero(CurrToStr(DM1.mesFinal), 2);
         xSql := 'SELECT '+tmes+' VALOR '
         +' FROM PVS105 '
         +' WHERE PVSIANO = '+QuotedStr(CurrToStr(DM1.anoFinal))
         +' AND PVSISERV = '+QuotedStr(CurrToStr(DM1.edadInvalidez));
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         DM1.montoTabInv := DM1.cdsQry.FieldByName('VALOR').AsCurrency;
      End
      Else
      Begin
         If DM1.anoFinal = 1997 Then
         // tabla de retiro + 4 UIT
         Begin
            // tabla de retiro
            tmes := 'PVSRMM'+DM1.StrZero(CurrToStr(DM1.mesFinal),2);
            xSql := 'SELECT '+tmes+' VALOR '
            +' FROM PVS104 '
            +' WHERE PVSRANO = ' + QuotedStr(CurrToStr(DM1.anoFinal))
            +' AND PVSRSERV = '+QuotedStr(DM1.StrZero(CurrToStr(DM1.anoServicio), 2));
            DM1.cdsQry.Close;
            DM1.cdsQry.DataRequest(xSql);
            DM1.cdsQry.Open;
            DM1.montoTabRet := DM1.cdsQry.FieldByName('VALOR').AsCurrency;
            // 4 UIT
            xSql := 'SELECT UITNUMER, UITNUMER * UITMONTO UIT, UITMONTO '
            +' FROM TGE188 '
            +' WHERE '+QuotedStr(DM1.cdsExpliq.FieldByName('ASOFRESCESE').AsString)
            +' >= UITFCINI '
            +' AND '+QuotedStr(DM1.cdsExpliq.FieldByName('ASOFRESCESE').AsString)
            +' <= UITFCFIN'
            +' AND UITTIPBE = ''I''';
            DM1.cdsQry.Close;
            DM1.cdsQry.DataRequest(xSql);
            DM1.cdsQry.Open;
            DM1.cantidadUIT := DM1.cdsQry.FieldByName('UITNUMER').AsCurrency;
            DM1.MontoUIT    := DM1.cdsQry.FieldByName('UIT').AsCurrency;
            DM1.UIT         := DM1.cdsQry.FieldByName('UITMONTO').AsCurrency;
         End
         Else
         // cuenta individual + 4 UIT - cuenta individual
         Begin
            // Cuenta individual
            DM1.DCOM1.AppServer.EjecutaSQL('DELETE T_CTAIND1');
            // Inicio: HPC_201805_PRE
            // Calculo de  cuenta indivial para los casos de reliquidaciones
            If DM1.xCnd = 'R' Then
               xSql := 'BEGIN '
               + '   P_CUENTA_INDIVIDUAL(' + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString) + ','
               + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOFRESNOM').AsString) + ','
               + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsString) + ','
               + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)+', ''S''); '
               + 'END;'
            Else
               xSql := 'BEGIN '
               + '   P_CUENTA_INDIVIDUAL(' + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString) + ','
               + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOFRESNOM').AsString) + ','
               + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsString) +','''',''N''); '
               + 'END;';
            // xSql := 'BEGIN '
            //    + '   P_CUENTA_INDIVIDUAL(' + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString) + ','
            //    + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOFRESNOM').AsString) + ','
            //    + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsString) + ','''', ''N''); '
            //    + 'END;';
            // Fin: HPC_201805_PRE
            DM1.DCOM1.AppServer.EjecutaSQL(xSql);
            xSql := 'SELECT SUM(NVL(CAPITAL,0)) CAPITAL, SUM(NVL(INTCAPACU,0)) INTCAPACU,'
            +' SUM(NVL(BONOS,0)) BONOS '
            +' FROM T_CTAIND1 '
            +' WHERE ASOID = '+QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString);
            DM1.cdsQry.Close;
            DM1.cdsQry.DataRequest(xSql);
            DM1.cdsQry.Open;
            If (DM1.cdsQry.FieldByName('CAPITAL').AsCurrency <> 0) Or
               (DM1.cdsQry.FieldByName('INTCAPACU').AsCurrency <> 0) Or
               (DM1.cdsQry.FieldByName('BONOS').AsCurrency <> 0) Then
            Begin
               DM1.aportesCtaInd    := DM1.cdsQry.FieldByName('CAPITAL').AsCurrency;
               DM1.interesesCtaInd  := DM1.cdsQry.FieldByName('INTCAPACU').AsCurrency;
               DM1.bonusCtaInd      := DM1.cdsQry.FieldByName('BONOS').AsCurrency;
               xSql := 'SELECT ACUMESANT, ANOSER '
               +' FROM T_CTAIND1 '
               +' WHERE ASOID = '+QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString)
               +' ORDER BY ANO, MES';
               DM1.cdsQry.Close;
               DM1.cdsQry.DataRequest(xSql);
               DM1.cdsQry.Open;
               DM1.calculoA1996CtaInd := DM1.cdsQry.FieldByName('ACUMESANT').AsCurrency;
               DM1.anoServicio1996    := StrToCurr(DM1.cdsQry.FieldByName('ANOSER').AsString);
               If ((DM1.cdsExpLiq.FieldByName('AUTDESAPO').AsString = 'S') And (DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsDateTime > StrToDate('31/12/2006')) And (DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsDateTime > DM1.cdsExpLiq.FieldByName('FECAUTDESAPO').AsDateTime))
                Or (DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsDateTime < StrToDate('01/01/2007') ) Then
               Begin
               // 4 UIT
               xSql := 'SELECT UITNUMER, UITNUMER * UITMONTO UIT, UITMONTO'
               +' FROM TGE188'
               + ' WHERE '+QuotedStr(DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsString)+' >= UITFCINI'
               +' AND '+QuotedStr(DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsString)+' <= UITFCFIN'
               +' AND UITTIPBE = ''I''';
               DM1.cdsQry.Close;
               DM1.cdsQry.DataRequest(xSql);
               DM1.cdsQry.Open;
               DM1.MontoUIT         := DM1.cdsQry.FieldByName('UIT').AsCurrency;
               DM1.cantidadUIT      := DM1.cdsQry.FieldByName('UITNUMER').AsCurrency;
               DM1.montoDiferencial := DM1.montoUIT - (DM1.aportesCtaInd + DM1.interesesCtaInd + DM1.bonusCtaInd + DM1.calculoA1996CtaInd);
               DM1.UIT := DM1.cdsQry.FieldByName('UITMONTO').AsCurrency;
               DM1.montoUIT := 0;
            End;
            End;
         End;
      End;
   End;
   // Inicio: SPP_201303_PRE
   xSql := 'SELECT MAX(ANO||MES) ANOMES FROM T_CTAIND1 WHERE ASOID = '+QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString)+' AND INTCAPACU IN (SELECT MAX(INTCAPACU) FROM T_CTAIND1)';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   ultanomescal := DM1.cdsQry.FieldByName('ANOMES').AsString;
   // Fin: SPP_201303_PRE
   DM1.cdsCalLiq.EmptyDataSet;
   TNumericField(DM1.cdsCalLiq.FieldByName('MONTO')).DisplayFormat := '###,###,##0.00';
   If DM1.calculoA1996CtaInd <> 0 Then
   Begin
      DM1.cdsCalLiq.Append;
      // Inicio: SPP_201303_PRE
      // DM1.cdsCalLiq.FieldByName('DESC').AsString := 'APORTES AL 31/12/1996 [' + CurrToStr(DM1.anoServicio1996) + ' AÑOS]';
      DM1.cdsCalLiq.FieldByName('DESC').AsString := 'APORTES A DICIEMBRE/1996 [' + CurrToStr(DM1.anoServicio1996) + ' AÑOS]';
      // Fin: SPP_201303_PRE
      DM1.cdsCalLiq.FieldByName('MONTO').AsCurrency := DM1.calculoA1996CtaInd;
      DM1.cdsCalLiq.FieldByName('TIPDES').AsString := 'FA';
      DM1.cdsCalLiq.Post;
   End;
   If DM1.aportesCtaInd <> 0 Then
   Begin
      DM1.cdsCalLiq.Append;
      // Inicio: SPP_201303_PRE
      If DM1.cdsExpLiq.FieldByName('ASOFRESNOM').AsDateTime > StrToDate('01/01/1997') Then
         DM1.cdsCalLiq.FieldByName('DESC').AsString := 'APORTES DE '+DM1.NombreMes(Copy(DM1.cdsExpLiq.FieldByName('ASOFRESNOM').AsString,4,2))+'/'+Copy(DM1.cdsExpLiq.FieldByName('ASOFRESNOM').AsString,7,4)
         +' A '+DM1.NombreMes(Copy(DM1.cdsExpLiq.FieldByName('PVSULTAPO').AsString,6,2))+'/'+Copy(DM1.cdsExpLiq.FieldByName('PVSULTAPO').AsString,1,4)
      Else
         DM1.cdsCalLiq.FieldByName('DESC').AsString := 'APORTES DE ENERO/1997 A '+DM1.NombreMes(Copy(DM1.cdsExpLiq.FieldByName('PVSULTAPO').AsString,6,2))+'/'+Copy(DM1.cdsExpLiq.FieldByName('PVSULTAPO').AsString,1,4);
      // Fin: SPP_201303_PRE
      DM1.cdsCalLiq.FieldByName('MONTO').AsCurrency := DM1.aportesCtaInd;
      DM1.cdsCalLiq.FieldByName('TIPDES').AsString := 'FA';
      DM1.cdsCalLiq.Post;
   End;
   If DM1.InteresesCtaInd <> 0 Then
   Begin
      DM1.cdsCalLiq.Append;
      // Inicio: SPP_201303_PRE
      // DM1.cdsCalLiq.FieldByName('DESC').AsString := 'INTERESES AL '+ DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsString;
      DM1.cdsCalLiq.FieldByName('DESC').AsString := 'INTERESES A '+NombreMes(Copy(ultanomescal,5,2))+'/'+Copy(ultanomescal,1,4);
      // Fin: SPP_201303_PRE
      DM1.cdsCalLiq.FieldByName('MONTO').AsCurrency := DM1.InteresesCtaInd;
      DM1.cdsCalLiq.FieldByName('TIPDES').AsString := 'FI';
      DM1.cdsCalLiq.Post;
   End;
   If DM1.BonusCtaInd <> 0 Then
   Begin
      DM1.cdsCalLiq.Append;
      // Inicio: SPP_201303_PRE
      // DM1.cdsCalLiq.FieldByName('DESC').AsString := 'BONOS AL ' + DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsString;
      DM1.cdsCalLiq.FieldByName('DESC').AsString := 'BONUS A ' + DM1.NombreMes(Copy(ultanomescal,5,2))+'/'+Copy(ultanomescal,1,4);
      // Fin: SPP_201303_PRE
      DM1.cdsCalLiq.FieldByName('MONTO').AsCurrency := DM1.BonusCtaInd;
      DM1.cdsCalLiq.FieldByName('TIPDES').AsString := 'FB';
      DM1.cdsCalLiq.Post;
   End;
   // Inicio: HPC_201506_PRE
   //  Linea de total de la cuenta individual
   If (DM1.calculoA1996CtaInd <> 0) Or (DM1.aportesCtaInd <> 0) Or (DM1.InteresesCtaInd <> 0) Or (DM1.BonusCtaInd <> 0) Then
   Begin
      DM1.cdsCalLiq.Append;
      DM1.cdsCalLiq.FieldByName('DESC').AsString := '                        TOTAL CUENTA INDIVIDUAL S/.';
      DM1.cdsCalLiq.FieldByName('MONTO').AsCurrency := DM1.calculoA1996CtaInd+DM1.aportesCtaInd+DM1.InteresesCtaInd+DM1.BonusCtaInd;
      DM1.cdsCalLiq.FieldByName('TIPDES').AsString := 'TC';
      DM1.cdsCalLiq.Post;
   End;
   // Fin: HPC_201506_PRE
   If DM1.montoTabRet <> 0 Then
   Begin
      DM1.cdsCalLiq.Append;
      DM1.cdsCalLiq.FieldByName('DESC').AsString := 'BENEFICIO ASIGNADO POR TABLA DE RETIRO [' + DM1.StrZero(CurrToStr(DM1.anoServicio), 2) + ' AÑOS]';
      DM1.cdsCalLiq.FieldByName('MONTO').AsCurrency := DM1.montoTabRet;
      DM1.cdsCalLiq.FieldByName('TIPDES').AsString := 'BR';
      DM1.cdsCalLiq.Post;
   End;
   If DM1.montoTabCap <> 0 Then
   Begin
      DM1.cdsCalLiq.Append;
      DM1.cdsCalLiq.FieldByName('DESC').AsString := 'BENEFICIO ASIGNADO POR TABLA DE CAPITAL DE DEUDOS [' + DM1.StrZero(CurrToStr(DM1.anoServicio), 2) + ' AÑOS]';
      DM1.cdsCalLiq.FieldByName('MONTO').AsCurrency := DM1.montoTabCap;
      DM1.cdsCalLiq.FieldByName('TIPDES').AsString := 'BF';
      DM1.cdsCalLiq.Post;
   End;
   If DM1.montoTabSep <> 0 Then
   Begin
      DM1.cdsCalLiq.Append;
      DM1.cdsCalLiq.FieldByName('DESC').AsString := 'BENEFICIO ASIGNADO POR TABLA DE SEPELIO [' + DM1.StrZero(CurrToStr(DM1.anoServicio), 2) + ' AÑOS]';
      DM1.cdsCalLiq.FieldByName('MONTO').AsCurrency := DM1.montoTabSep;
      DM1.cdsCalLiq.FieldByName('TIPDES').AsString := 'BF';
      DM1.cdsCalLiq.Post;
   End;
   If DM1.montoTabInv <> 0 Then
   Begin
      DM1.cdsCalLiq.Append;
      DM1.cdsCalLiq.FieldByName('DESC').AsString := 'BENEFICIO ASIGNADO POR TABLA DE INVALIDEZ [' + CurrToStr(DM1.edadInvalidez) + ' AÑOS]';
      DM1.cdsCalLiq.FieldByName('MONTO').AsCurrency := DM1.montoTabInv;
      DM1.cdsCalLiq.FieldByName('TIPDES').AsString := 'BI';
      DM1.cdsCalLiq.Post;
   End;

   If DM1.montoUIT <> 0 Then
   Begin
      DM1.cdsCalLiq.Append;
      DM1.cdsCalLiq.FieldByName('DESC').AsString := 'MONTO A ' + CurrToStr(DM1.cantidadUIT) + ' UIT [UIT VIGENTE S/. ' + FormatFloat('###,###.#0', DM1.UIT) + ']';
      DM1.cdsCalLiq.FieldByName('MONTO').AsCurrency := DM1.montoUIT;
      DM1.cdsCalLiq.FieldByName('TIPDES').AsString := 'FA';
      DM1.cdsCalLiq.Post;
   End;

   If (DM1.aportesCtaInd + DM1.interesesCtaInd + DM1.bonusCtaInd + DM1.calculoA1996CtaInd > 0) Then
   Begin
      If DM1.montoDiferencial > 0 Then
      Begin
         DM1.cdsCalLiq.Append;
         // Inicio: SPP_201307_PRE
         // Nueva descripción al momento de mostrar el registro de monto diferencial en el detalle de cuenta individual
         // DM1.cdsCalLiq.FieldByName('DESC').AsString := 'MONTO DIFERENCIAL A ' + CurrToStr(DM1.cantidadUIT) + ' UIT [UIT VIGENTE S/. ' + FormatFloat('###,###.#0', DM1.UIT) + ']';
         If DM1.cantidadUIT = 0.5 Then
            DM1.cdsCalLiq.FieldByName('DESC').AsString := 'MONTO ADICIONAL '+CurrToStr(DM1.cantidadUIT) + ' UIT [UIT VIGENTE S/. ' + FormatFloat('###,###.#0', DM1.UIT) + ']'
         Else
            DM1.cdsCalLiq.FieldByName('DESC').AsString := 'MONTO DIFERENCIAL A ' + CurrToStr(DM1.cantidadUIT) + ' UIT [UIT VIGENTE S/. ' + FormatFloat('###,###.#0', DM1.UIT) + ']';
         // Fin: SPP_201307_PRE
         DM1.cdsCalLiq.FieldByName('MONTO').AsCurrency := DM1.montoDiferencial;
         DM1.cdsCalLiq.FieldByName('TIPDES').AsString := 'MD';
         DM1.cdsCalLiq.Post;
      End
      Else 
         DM1.montoDiferencial := 0;
   End;

   DM1.liquidacionbeneficio := DM1.calculoA1996CtaInd + DM1.aportesCtaInd +
      DM1.InteresesCtaInd + DM1.BonusCtaInd + DM1.MontoTabRet + DM1.MontoTabCap +
      DM1.MontoTabSep + DM1.MontoTabInv + DM1.montoUIT + DM1.montoDiferencial;

  // En caso que sea reliquidación el monto de la liquidación anterior
  // Añadiendo registro si es por reliquidación
   If DM1.xTipLiq = 'R' Then
   Begin
      DM1.cdsDetDes.Append;
      DM1.cdsDetDes.FieldByName('DESC').AsString := 'PAGO REALIZADO POR LIQUIDACION ANTERIOR (LIQUIDACION ' + DM1.cdsExpLiq.FieldByName('BENEFDES').AsString + ' Nº ' + DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString;
      DM1.cdsDetDes.FieldByName('MONTO').AsFloat := DM1.montoliquidacionanterior;
      DM1.cdsDetDes.Post;
   End;
   If DM1.cdsCalLiq.RecordCount = 0 Then
   Begin
      DM1.cdsCalLiq.Append;
      DM1.cdsCalLiq.FieldByName('DESC').AsString := 'NO EXISTE DATOS PARA EL CALCULO DE BENEFICIO';
      DM1.cdsCalLiq.FieldByName('MONTO').AsFloat := 0;
      DM1.cdsCalLiq.FieldByName('GRABAR').AsString := 'N';
      DM1.cdsCalLiq.Post;
   End;
End;

Procedure TDM1.formadepago(xAsoid: String);
Var
   xSql, texto, valor: String;
   xApeNom:String; // SPP_201403_PRE
   totPorCar, totPorFam, montoCob, canTra: Currency;
   xdsgfrec: TDate;
Begin
   DM1.cobraconcarta := 'N';
   DM1.cdsForPag.EmptyDataSet;
   // Levantando infomación si hay Cartas o deudos
   // Verificar si existe Carta de beneficiario - Modifica Usuanu sea null - 06/03/2008
   // Inicio: HPC_201609_PRE
   // Se añade al script de busqueda la condicion en el cual no debe tomar  tipo de estado = "13" (anulado)
   // xSql := 'SELECT MAX(DSGFREC) DSGFREC FROM PVS302 WHERE ASOID = ' + QuotedStr(xAsoid) + ' AND USUANU IS NULL';
   xSql := 'SELECT MAX(DSGFREC) DSGFREC FROM PVS302 WHERE ASOID = '+QuotedStr(xAsoid)+' AND DSGESTAD NOT IN ''13''';
   // Fin: HPC_201609_PRE
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   xdsgfrec := DM1.cdsQry.FieldByName('DSGFREC').AsDateTime;
   // Inicio: HPC_201609_PRE
   // Se añade al script de busqueda la condicion en el cual no debe tomar  tipo de estado = "13" (anulado)
   // xSql := 'SELECT * FROM PVS302 WHERE ASOID = ' + QuotedStr(xAsoid) + ' AND DSGFREC = ' + QuotedStr(DateToStr(xdsgfrec)+ ' );
   xSql := 'SELECT DSGNRO, DSGFREC, DSGESTAD, DSGFAPER, DSGVIG, ASOID, DSGOBS, DSGNOMBR, DSGAPEPAT, DSGAPEMAT, DSGNOMBRT, USUARIO, FREG, HREG, FECAPER, PVSEXPNRO, PVSNROLIQ, PVSFANUL, ANULADO, USUANU, FECANU,'
   +' PVSLBENNR, ASODNI, ASOAPENOMDNI, ASOCODMOD, USUAPE, CODOTRDOCIDE, NUMOTRDOCIDE, MOTANUCAR FROM PVS302 WHERE ASOID = '+QuotedStr(xAsoid)+' AND DSGFREC = '+QuotedStr(DateToStr(xdsgfrec))+' AND DSGESTAD NOT IN ''13''';
   // Fin: HPC_201609_PRE
   DM1.cdsMaestCartas.Close;
   DM1.cdsMaestCartas.DataRequest(xSql);
   DM1.cdsMaestCartas.Open;
   If DM1.cdsMaestCartas.RecordCount > 0 Then
   Begin
      xSql := 'SELECT * FROM PVS303 WHERE ASOID = ' + QuotedStr(xAsoid);
      DM1.cdsDetCartas.Close;
      DM1.cdsDetCartas.DataRequest(xSql);
      DM1.cdsDetCartas.Open;
   End;
   xSql := 'SELECT * FROM APO203 WHERE ASOID = ' + QuotedStr(xAsoid);
   DM1.cdsDFam.Close;
   DM1.cdsDFam.DataRequest(xSql);
   DM1.cdsDFam.Open;
  // Chequeando los porcentajes de los beneficiarios
   If DM1.cdsExpLiq.FieldByName('PVSCOBASO').AsString = 'N' Then
   Begin
      If DM1.cdsMaestCartas.RecordCount > 0 Then
      Begin
         If DM1.cdsDetCartas.RecordCount > 0 Then
         Begin
            totPorCar := 0;
            While Not DM1.cdsDetCartas.Eof Do
            Begin
               totPorCar := totPorCar + DM1.cdsDetCartas.FieldByName('DSGPORC').AsFloat;
               DM1.cdsDetCartas.Next;
            End;
            If totPorCar <> 100 Then
               MessageDlg('El total porcentaje de la carta no es 100%', mtCustom, [mbOk], 0);
         End;
      End
      Else
      Begin
         If DM1.cdsDFam.RecordCount > 0 Then
         Begin
            totPorFam := 0;
            While Not DM1.cdsDFam.Eof Do
            Begin
               totPorFam := totPorFam + DM1.cdsDFam.FieldByName('FAMPORC').AsFloat;
               DM1.cdsDFam.Next;
            End;
            If DM1.Valores(FloatToStrF(totPorFam, ffNumber, 15, 2)) <> 100 Then
               MessageDlg('El total porcentaje de los familiares no es 100%', mtCustom, [mbOk], 0);
         End;
      End;
   End;
   //Forma de Pago si es el asociado el que cobra
   If DM1.cdsExpLiq.FieldByName('PVSCOBASO').AsString = 'S' Then
   Begin
      If DM1.cdsExpLiq.FieldByName('FORPAGOID').AsString = '05' Then
      Begin
         If DM1.liquidacionbeneficio + DM1.montoDevolucion - DM1.montoDescuento - DM1.montoRetencion - 11.50 > 0 Then
          montoCob := DM1.liquidacionbeneficio + DM1.montoDevolucion - DM1.totalMontoDescuento - 11.50 // HTC_SAR-984_EPS II
         Else
             montoCob := DM1.liquidacionbeneficio + DM1.montoDevolucion - DM1.totalMontoDescuento; // HTC_SAR-984_EPS II
      End
      Else
          montoCob := DM1.liquidacionbeneficio + DM1.montoDevolucion - DM1.totalMontoDescuento ;  // HTC_SAR-984_EPS II
      If DM1.cdsExpLiq.FieldByName('FORPAGOID').AsString = '01' Then
      Begin
         texto := '* CHEQUE DEL ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', DM1.cdsExpLiq.FieldByName('BANCOID').AsString);
      End;
      If DM1.cdsExpLiq.FieldByName('FORPAGOID').AsString = '05' Then
      Begin
         texto := '* GIRO DEL ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', DM1.cdsExpLiq.FieldByName('BANCOID').AsString)
            + ' A LA CIUDAD DE ' + DM1.DevuelveValor('COB102', 'AGENBCODES', 'AGENBCOID', DM1.cdsExpLiq.FieldByName('AGENBCOID').AsString) + '-'
            + DM1.DevuelveValor('TGE158', 'DPTODES', 'DPTOID', DM1.DevuelveValor('COB102', 'DPTOID', 'AGENBCOID', DM1.cdsExpLiq.FieldByName('AGENBCOID').AsString));
      End;
      If DM1.cdsExpLiq.FieldByName('FORPAGOID').AsString = '06' Then
      Begin
         texto := '* ABONO EN CUENTA Nº ' + DM1.cdsExpLiq.FieldByName('ASONCTA').AsString + ' DEL ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', DM1.cdsExpLiq.FieldByName('BANCOID').AsString);
      End;
      If DM1.cdsExpLiq.FieldByName('FORPAGOID').AsString = '16' Then
      Begin
         texto := '* CHEQUE DE GERENCIA ' + DM1.cdsExpLiq.FieldByName('ASONCTA').AsString + ' DEL ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', DM1.cdsExpLiq.FieldByName('BANCOID').AsString);
      End;
      // If DM1.cdsExpLiq.FieldByName('FORPAGOID').AsString = '18' Then
      If DM1.cdsExpLiq.FieldByName('FORPAGOID').AsString = '19' Then
      Begin
         //texto := '* DEPOSITO EN CUENTA - ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', DM1.cdsExpLiq.FieldByName('BANCOID').AsString) + ' ' + '[CTA.TEL. ' + DM1.cdsExpLiq.FieldByName('ASONCTA').AsString + ']';
         texto := '* DEPOSITO EN CUENTA DEL BANCO DE LA NACION  - ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', DM1.cdsExpLiq.FieldByName('BANCOID').AsString);
      End;
      // Insertando forma de Pago
      DM1.cdsForPag.Append;
      DM1.cdsForPag.FieldByName('DESC').AsString := texto;
      DM1.cdsForPag.FieldByName('FORPAGID').AsString := DM1.cdsExpLiq.FieldByName('FORPAGOID').AsString;
      DM1.cdsForPag.FieldByName('BANCOID').AsString := DM1.cdsExpLiq.FieldByName('BANCOID').AsString;
      DM1.cdsForPag.FieldByName('PVSLNCTA').AsString := DM1.cdsExpLiq.FieldByName('ASONCTA').AsString;
      DM1.cdsForPag.FieldByName('AGENBCOID').AsString := DM1.cdsExpLiq.FieldByName('AGENBCOID').AsString;
      DM1.cdsForPag.FieldByName('PVSLDNIBEN').AsString := DM1.cdsAsociado.FieldByName('ASODNI').AsString;
      DM1.cdsForPag.FieldByName('PVSNOMBRE').AsString := DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString;
      DM1.cdsForPag.FieldByName('APEPATCOB').AsString := DM1.cdsAsociado.FieldByName('ASOAPEPATDNI').AsString;
      DM1.cdsForPag.FieldByName('APEMATCOB').AsString := DM1.cdsAsociado.FieldByName('ASOAPEMATDNI').AsString;
      DM1.cdsForPag.FieldByName('APECASCOB').AsString := DM1.cdsAsociado.FieldByName('ASOAPECASDNI').AsString; // SPP_201403_PRE
      DM1.cdsForPag.FieldByName('NOMCOB').AsString := DM1.cdsAsociado.FieldByName('ASONOMDNI').AsString;
      DM1.cdsForPag.Post;
      // Quien cobra
      DM1.cdsForPag.Append;
      // Inicio: DPP_201209_PRE
      // DM1.cdsForPag.FieldByName('DESC').AsString := '  A : ' + DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString + '  [D.N.I. : ' + DM1.cdsExpLiq.FieldByName('ASODNI').AsString + ']';
      DM1.cdsForPag.FieldByName('DESC').AsString := '  A : ' + DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString;
      If DM1.cdsExpLiq.FieldByName('ASONCTA').AsString <> '' Then
         DM1.cdsForPag.FieldByName('DESC').AsString := DM1.cdsForPag.FieldByName('DESC').AsString + ' [CUENTA Nº ' + DM1.cdsExpLiq.FieldByName('ASONCTA').AsString+']';
      DM1.cdsForPag.FieldByName('DESC').AsString := DM1.cdsForPag.FieldByName('DESC').AsString + ' [D.N.I. : ' + DM1.cdsExpLiq.FieldByName('ASODNI').AsString + ']';
      // Fin: DPP_201209_PRE
      If montoCob < 0 Then montoCob := 0;
      DM1.cdsForPag.FieldByName('MONTO').AsCurrency := montoCob;
      DM1.cdsForPag.FieldByName('FORPAGID').AsString := DM1.cdsExpLiq.FieldByName('FORPAGOID').AsString;
      DM1.cdsForPag.FieldByName('BANCOID').AsString := DM1.cdsExpLiq.FieldByName('BANCOID').AsString;
      DM1.cdsForPag.FieldByName('AGENBCOID').AsString := DM1.cdsExpLiq.FieldByName('AGENBCOID').AsString;
      DM1.cdsForPag.FieldByName('PVSLNCTA').AsString := DM1.cdsExpLiq.FieldByName('ASONCTA').AsString;
      DM1.cdsForPag.FieldByName('PVSLDNIBEN').AsString := DM1.cdsAsociado.FieldByName('ASODNI').AsString;
      DM1.cdsForPag.FieldByName('PVSNOMBRE').AsString := DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString;
      DM1.cdsForPag.FieldByName('APEPATCOB').AsString := DM1.cdsAsociado.FieldByName('ASOAPEPATDNI').AsString;
      DM1.cdsForPag.FieldByName('APEMATCOB').AsString := DM1.cdsAsociado.FieldByName('ASOAPEMATDNI').AsString;
      DM1.cdsForPag.FieldByName('APECASCOB').AsString := DM1.cdsAsociado.FieldByName('ASOAPECASDNI').AsString; // SPP_201403_PRE
      DM1.cdsForPag.FieldByName('NOMCOB').AsString := DM1.cdsAsociado.FieldByName('ASONOMDNI').AsString;
      DM1.cdsForPag.FieldByName('PORCENTAJE').AsFloat := 100;
      // Inicio: HPC_201703_PRE
      // Se actualiza telefono movil del asociado
      DM1.cdsForPag.FieldByName('MOVCOB').AsString := DM1.cdsAsociado.FieldByName('ASOTELF1').AsString;
      // Fin: HPC_201703_PRE
      DM1.cdsForPag.Post;
   End
   Else
   Begin
      If DM1.cdsMaestCartas.RecordCount > 0 Then
      Begin
         If DM1.cdsDetCartas.RecordCount > 0 Then
         Begin
            DM1.cdsDetCartas.First;
            While Not DM1.cdsDetCartas.Eof Do
            Begin
               DM1.cobraconcarta := 'S';
               If DM1.cdsDetCartas.FieldByName('FORPAGOID').AsString = '01' Then
               Begin
                  texto := '* CHEQUE DEL ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', DM1.cdsDetCartas.FieldByName('BANCOID').AsString);
                  montoCob := DM1.Valores(FloatToStrF((DM1.liquidacionbeneficio + DM1.montoDevolucion - DM1.totalMontoDescuento  + DM1.montoTransferencia) * (DM1.cdsDetCartas.FieldByName('DSGPORC').AsCurrency / 100), ffNumber, 15, 2)); // HTC_SAR-984_EPS II
               End;
               If DM1.cdsDetCartas.FieldByName('FORPAGOID').AsString = '05' Then
               Begin
                  texto := '* GIRO DEL ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', DM1.cdsDetCartas.FieldByName('BANCOID').AsString)
                     + ' A LA CIUDAD DE ' + DM1.DevuelveValor('COB102', 'AGENBCODES', 'AGENBCOID', DM1.cdsDetCartas.FieldByName('AGENBCOID').AsString) + '-'
                     + DM1.DevuelveValor('TGE158', 'DPTODES', 'DPTOID', DM1.DevuelveValor('COB102', 'DPTOID', 'AGENBCOID', DM1.cdsDetCartas.FieldByName('AGENBCOID').AsString));
                   montoCob := DM1.Valores(FloatToStrF((DM1.liquidacionbeneficio + DM1.montoDevolucion - DM1.totalMontoDescuento) * (DM1.cdsDetCartas.FieldByName('DSGPORC').AsCurrency / 100) - 11.50, ffNumber, 15, 2));  // HTC_SAR-984_EPS II
               End;
               If DM1.cdsDetCartas.FieldByName('FORPAGOID').AsString = '11' Then
               Begin
                  texto := '* LIBRETA DE AHORRO DEL ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', DM1.cdsDetCartas.FieldByName('BANCOID').AsString);
                   montoCob := DM1.Valores(FloatToStrF((DM1.liquidacionbeneficio + DM1.montoDevolucion - DM1.totalMontoDescuento ) * (DM1.cdsDetCartas.FieldByName('DSGPORC').AsCurrency / 100), ffNumber, 15, 2));  // HTC_SAR-984_EPS II
               End;
               If DM1.cdsDetCartas.FieldByName('FORPAGOID').AsString = '06' Then
               Begin
                  texto := '* ABONO EN CUENTA DEL ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', DM1.cdsDetCartas.FieldByName('BANCOID').AsString);
                   montoCob := DM1.Valores(FloatToStrF((DM1.liquidacionbeneficio + DM1.montoDevolucion - DM1.totalMontoDescuento ) * (DM1.cdsDetCartas.FieldByName('DSGPORC').AsCurrency / 100), ffNumber, 15, 2));  // HTC_SAR-984_EPS II
               End;
               If DM1.cdsDetCartas.FieldByName('FORPAGOID').AsString = '16' Then
               Begin
                  texto := '* CHEQUE DE GERENCIA DEL ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', DM1.cdsDetCartas.FieldByName('BANCOID').AsString);
                  montoCob := DM1.Valores(FloatToStrF((DM1.liquidacionbeneficio + DM1.montoDevolucion - DM1.totalMontoDescuento) * (DM1.cdsDetCartas.FieldByName('DSGPORC').AsCurrency / 100), ffNumber, 15, 2));  // HTC_SAR-984_EPS II
               End;
               // Inicio: DPP_201209_PRE
               //If DM1.cdsDetCartas.FieldByName('FORPAGOID').AsString = '18' Then
               If DM1.cdsDetCartas.FieldByName('FORPAGOID').AsString = '19' Then
               // Fin: DPP_201209_PRE
               Begin
                  texto := '* DEPOSITO EN CUENTA - ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', DM1.cdsDetCartas.FieldByName('BANCOID').AsString);
                   montoCob := DM1.Valores(FloatToStrF((DM1.liquidacionbeneficio + DM1.montoDevolucion - DM1.totalMontoDescuento) * (DM1.cdsDetCartas.FieldByName('DSGPORC').AsCurrency / 100), ffNumber, 15, 2));  // HTC_SAR-984_EPS II
               End;
               // FIN SAR2009-0203
               // fin HPP_200903_PRE
               // Insertando forma de Pago
               // Inicio: SPP_201403_PRE
               xApeNom := '';
               If Trim(DM1.cdsDetCartas.FieldByName('DSGAPEPAT').AsString) <> '' Then xApeNom := xApeNom + Trim(DM1.cdsDetCartas.FieldByName('DSGAPEPAT').AsString)+' ';
               If Trim(DM1.cdsDetCartas.FieldByName('DSGAPEMAT').AsString) <> '' Then xApeNom := xApeNom + Trim(DM1.cdsDetCartas.FieldByName('DSGAPEMAT').AsString)+' ';
               If Trim(DM1.cdsDetCartas.FieldByName('DSGAPECAS').AsString) <> '' Then xApeNom := xApeNom + Trim(DM1.cdsDetCartas.FieldByName('DSGAPECAS').AsString)+' ';
               xApeNom := xApeNom + Trim(DM1.cdsDetCartas.FieldByName('DSGNOMBR').AsString);
               // Fin: SPP_201403_PRE
               DM1.cdsForPag.Append;
               DM1.cdsForPag.FieldByName('DESC').AsString := texto;
               DM1.cdsForPag.FieldByName('FORPAGID').AsString := DM1.cdsDetCartas.FieldByName('FORPAGOID').AsString;
               DM1.cdsForPag.FieldByName('BANCOID').AsString := DM1.cdsDetCartas.FieldByName('BANCOID').AsString;
               DM1.cdsForPag.FieldByName('AGENBCOID').AsString := DM1.cdsDetCartas.FieldByName('AGENBCOID').AsString;
               // Inicio: SPP_201403_PRE
               // DM1.cdsForPag.FieldByName('PVSNOMBRE').AsString := Trim(DM1.cdsDetCartas.FieldByName('DSGAPEPAT').AsString) + ' ' + Trim(DM1.cdsDetCartas.FieldByName('DSGAPEMAT').AsString) + ' ' + Trim(DM1.cdsDetCartas.FieldByName('DSGNOMBR').AsString);
               DM1.cdsForPag.FieldByName('PVSNOMBRE').AsString := xApeNom;
               // Fin: SPP_201403_PRE
               DM1.cdsForPag.FieldByName('PVSLDNIBEN').AsString := DM1.cdsDetCartas.FieldByName('DSGDNI').AsString;
               DM1.cdsForPag.FieldByName('APEPATCOB').AsString := DM1.cdsDetCartas.FieldByName('DSGAPEPAT').AsString;
               DM1.cdsForPag.FieldByName('APEMATCOB').AsString := DM1.cdsDetCartas.FieldByName('DSGAPEMAT').AsString;
               DM1.cdsForPag.FieldByName('APECASCOB').AsString := DM1.cdsDetCartas.FieldByName('DSGAPECAS').AsString; // SPP_201403_PRE
               DM1.cdsForPag.FieldByName('NOMCOB').AsString := DM1.cdsDetCartas.FieldByName('DSGNOMBR').AsString;
               DM1.cdsForPag.FieldByName('CODRELCOB').AsString := DM1.cdsDetCartas.FieldByName('DSGTREL').AsString;
               DM1.cdsForPag.FieldByName('APENOMTUT').AsString := Trim(DM1.cdsDetCartas.FieldByName('DSGTAPEP').AsString) + ' ' + Trim(DM1.cdsDetCartas.FieldByName('DSGTAPEM').AsString) + ' ' + Trim(DM1.cdsDetCartas.FieldByName('DSGTNOMB').AsString);
               DM1.cdsForPag.FieldByName('APEPATTUT').AsString := DM1.cdsDetCartas.FieldByName('DSGTAPEP').AsString;
               DM1.cdsForPag.FieldByName('APEMATTUT').AsString := DM1.cdsDetCartas.FieldByName('DSGTAPEM').AsString;
               DM1.cdsForPag.FieldByName('NOMTUT').AsString := DM1.cdsDetCartas.FieldByName('DSGTNOMB').AsString;
               DM1.cdsForPag.FieldByName('PORCENTAJE').AsString := DM1.cdsDetCartas.FieldByName('DSGPORC').AsString;
               // Inicio: SPP_201303_PRE
               DM1.cdsForPag.FieldByName('DIRDOMCOB').AsString := DM1.cdsDetCartas.FieldByName('DSGDIRDES').AsString;
               DM1.cdsForPag.FieldByName('CODZIPCOB').AsString :=  DM1.cdsDetCartas.FieldByName('DSGZIPIDDES').AsString;
               DM1.cdsForPag.FieldByName('TELFIJCOB').AsString :=  DM1.cdsDetCartas.FieldByName('DSGTELFIJDES').AsString;
               DM1.cdsForPag.FieldByName('TELMOVCOB').AsString :=  DM1.cdsDetCartas.FieldByName('DSGTELMOVDES').AsString;
               // Inicio: HPC_201703_PRE
               // Se actualiza telefono movil del designatario
               DM1.cdsForPag.FieldByName('EMAILCOB').AsString := DM1.cdsDetCartas.FieldByName('EMAILDES').AsString;
               // Fin: HPC_201703_PRE
               // Fin: SPP_201303_PRE
               DM1.cdsForPag.Post;
               // Quien cobra
               // Inicio: HPC_201809_PRE
               // // Inicio: SPP_201403_PRE
               // // texto := '  A : ' + Trim(DM1.cdsDetCartas.FieldByName('DSGAPEPAT').AsString) + ' '
               // //   + Trim(DM1.cdsDetCartas.FieldByName('DSGAPEMAT').AsString) + ' ' + Trim(DM1.cdsDetCartas.FieldByName('DSGNOMBR').AsString);
               // texto := '  A : ' + xApeNom;
               // // Fin: SPP_201403_PRE
               // If DM1.cdsDetCartas.FieldByName('DSGDNI').AsString <> '' Then
               //    texto := texto + '  [DNI.: ' + DM1.cdsDetCartas.FieldByName('DSGDNI').AsString + ']';
               // texto := texto + '  [' + DM1.DevuelveValor('TGE149', 'PARENABR', 'PARENID', DM1.cdsDetCartas.FieldByName('DSGTREL').AsString) + ']  [' + FloatToStrF(DM1.cdsDetCartas.FieldByName('DSGPORC').AsFloat, ffNumber, 5, 2) + '%]';
               // Se añade texto menor o mayor de edad
               texto := '  A : ' + xApeNom;
               If DM1.cdsDetCartas.FieldByName('DSGDNI').AsString <> '' Then
                  texto := texto + ' [DNI.: '+DM1.cdsDetCartas.FieldByName('DSGDNI').AsString+']';
               If DM1.cdsDetCartas.FieldByName('DSGTREL').AsString = '16' Then
                  texto := texto + ' ['+DM1.cdsDetCartas.FieldByName('DSGOTRTIPREL').AsString
               Else
                  texto := texto + ' ['+DM1.DevuelveValor('TGE149', 'PARENABR', 'PARENID', DM1.cdsDetCartas.FieldByName('DSGTREL').AsString);
               If (DM1.cdsDetCartas.FieldByName('DSGTREL').AsString = '02') Or (DM1.cdsDetCartas.FieldByName('DSGTREL').AsString = '15') Or (DM1.cdsDetCartas.FieldByName('DSGTREL').AsString = '16') Then
                  If DM1.cdsDetCartas.FieldByName('MENEDAD').AsString = 'S' Then
                     texto := texto + ' MENOR]'
                  Else
                     texto := texto + ' MAYOR]';
               texto := texto + ' ['+FloatToStrF(DM1.cdsDetCartas.FieldByName('DSGPORC').AsFloat, ffNumber, 5, 2)+'%]';
               // Fin: HPC_201809_PRE
               DM1.cdsForPag.Append;
               DM1.cdsForPag.FieldByName('DESC').AsString := texto;
               If montoCob < 0 Then montoCob := 0;
               DM1.cdsForPag.FieldByName('MONTO').AsFloat := montoCob;
               DM1.cdsForPag.FieldByName('PORCENTAJE').AsString := DM1.cdsDetCartas.FieldByName('DSGPORC').AsString;
               DM1.cdsForPag.FieldByName('FORPAGID').AsString := DM1.cdsDetCartas.FieldByName('FORPAGOID').AsString;
               DM1.cdsForPag.FieldByName('BANCOID').AsString := DM1.cdsDetCartas.FieldByName('BANCOID').AsString;
               DM1.cdsForPag.FieldByName('AGENBCOID').AsString := DM1.cdsDetCartas.FieldByName('AGENBCOID').AsString;
               // Inicio: SPP_201403_PRE
               // DM1.cdsForPag.FieldByName('PVSNOMBRE').AsString := Trim(DM1.cdsDetCartas.FieldByName('DSGAPEPAT').AsString) + ' ' + Trim(DM1.cdsDetCartas.FieldByName('DSGAPEMAT').AsString) + ' ' + Trim(DM1.cdsDetCartas.FieldByName('DSGNOMBR').AsString);
               DM1.cdsForPag.FieldByName('PVSNOMBRE').AsString := xApeNom;
               // Fin: SPP_201403_PRE
               DM1.cdsForPag.FieldByName('PVSLDNIBEN').AsString := DM1.cdsDetCartas.FieldByName('DSGDNI').AsString;
               DM1.cdsForPag.FieldByName('APEPATCOB').AsString := DM1.cdsDetCartas.FieldByName('DSGAPEPAT').AsString;
               DM1.cdsForPag.FieldByName('APEMATCOB').AsString := DM1.cdsDetCartas.FieldByName('DSGAPEMAT').AsString;
               DM1.cdsForPag.FieldByName('APECASCOB').AsString := DM1.cdsDetCartas.FieldByName('DSGAPECAS').AsString; // SPP_201403_PRE
               DM1.cdsForPag.FieldByName('NOMCOB').AsString := DM1.cdsDetCartas.FieldByName('DSGNOMBR').AsString;
               DM1.cdsForPag.FieldByName('CODRELCOB').AsString := DM1.cdsDetCartas.FieldByName('DSGTREL').AsString;
               DM1.cdsForPag.FieldByName('APENOMTUT').AsString := Trim(DM1.cdsDetCartas.FieldByName('DSGTAPEP').AsString) + ' ' + Trim(DM1.cdsDetCartas.FieldByName('DSGTAPEM').AsString) + ' ' + Trim(DM1.cdsDetCartas.FieldByName('DSGTNOMB').AsString);
               DM1.cdsForPag.FieldByName('APEPATTUT').AsString := DM1.cdsDetCartas.FieldByName('DSGTAPEP').AsString;
               DM1.cdsForPag.FieldByName('APEMATTUT').AsString := DM1.cdsDetCartas.FieldByName('DSGTAPEM').AsString;
               DM1.cdsForPag.FieldByName('NOMTUT').AsString := DM1.cdsDetCartas.FieldByName('DSGTNOMB').AsString;
               If DM1.cdsDetCartas.FieldByName('FORPAGOID').AsString = '11' Then
               Begin
                  DM1.cdsForPag.FieldByName('APENOMTUT').AsString := DM1.cdsDetCartas.FieldByName('DSGTAPEP').AsString + ' ' + DM1.cdsDetCartas.FieldByName('DSGTAPEM').AsString + ' ' + DM1.cdsDetCartas.FieldByName('DSGTNOMB').AsString;
                  DM1.cdsForPag.FieldByName('DOCIDETUT').AsString := DM1.cdsDetCartas.FieldByName('DSGTDNI').AsString;
                  DM1.cdsForPag.FieldByName('FECNACMEN').AsString := DM1.cdsDetCartas.FieldByName('DSGFNAC').AsString;
               End;
               // Inicio: SPP_201303_PRE
               DM1.cdsForPag.FieldByName('DIRDOMCOB').AsString := DM1.cdsDetCartas.FieldByName('DSGDIRDES').AsString;
               DM1.cdsForPag.FieldByName('CODZIPCOB').AsString :=  DM1.cdsDetCartas.FieldByName('DSGZIPIDDES').AsString;
               DM1.cdsForPag.FieldByName('TELFIJCOB').AsString :=  DM1.cdsDetCartas.FieldByName('DSGTELFIJDES').AsString;
               DM1.cdsForPag.FieldByName('TELMOVCOB').AsString :=  DM1.cdsDetCartas.FieldByName('DSGTELMOVDES').AsString;
               // Inicio: HPC_201703_PRE
               // Se actualiza email de la carta de designatario
               DM1.cdsForPag.FieldByName('EMAILCOB').AsString := DM1.cdsDetCartas.FieldByName('EMAILDES').AsString;
               // Fin: HPC_201703_PRE
               // Fin: SPP_201303_PRE
               DM1.cdsForPag.Post;
               DM1.cdsDetCartas.Next;
            End;
         End;
      End
      Else
      Begin
         If DM1.cdsDFam.RecordCount > 0 Then
         Begin
            DM1.cdsDFam.First;
            While Not DM1.cdsDFam.Eof Do
            Begin
               If DM1.cdsDFam.FieldByName('FORPAGOID').AsString = '01' Then
               Begin
                  texto := '* CHEQUE DEL ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', DM1.cdsDFam.FieldByName('BANCOID').AsString);
                   montoCob := DM1.Valores(FloatToStrF((DM1.liquidacionbeneficio + DM1.montoDevolucion - DM1.totalMontoDescuento) * (DM1.cdsDFam.FieldByName('FAMPORC').AsFloat / 100), ffNumber, 15, 2));  // HTC_SAR-984_EPS II
               End;
               If DM1.cdsDFam.FieldByName('FORPAGOID').AsString = '05' Then
               Begin
                  texto := '* GIRO DEL ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', DM1.cdsDFam.FieldByName('BANCOID').AsString)
                     + ' A LA CIUDAD DE ' + DM1.DevuelveValor('COB102', 'AGENBCODES', 'AGENBCOID', DM1.cdsDFam.FieldByName('AGENBCOID').AsString) + '-'
                     + DM1.DevuelveValor('TGE158', 'DPTODES', 'DPTOID', DM1.DevuelveValor('COB102', 'DPTOID', 'AGENBCOID', DM1.cdsDFam.FieldByName('AGENBCOID').AsString));
                  montoCob := DM1.Valores(FloatToStrF((DM1.liquidacionbeneficio + DM1.montoDevolucion - DM1.totalMontoDescuento) * (DM1.cdsDFam.FieldByName('FAMPORC').AsFloat / 100) - 11.50, ffNumber, 15, 2));  // HTC_SAR-984_EPS II
               End;
               If DM1.cdsDFam.FieldByName('FORPAGOID').AsString = '11' Then
               Begin
                  texto := '* LIBRETA DE AHORRO DEL ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', DM1.cdsDFam.FieldByName('BANCOID').AsString);
                   montoCob := DM1.Valores(FloatToStrF((DM1.liquidacionbeneficio + DM1.montoDevolucion - DM1.totalMontoDescuento) * (DM1.cdsDFam.FieldByName('FAMPORC').AsCurrency / 100), ffNumber, 15, 2));  // HTC_SAR-984_EPS II
               End;
               If DM1.cdsDFam.FieldByName('FORPAGOID').AsString = '06' Then
               Begin
                  texto := '* ABONO EN CUENTA DEL ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', DM1.cdsDFam.FieldByName('BANCOID').AsString);
                  montoCob := DM1.Valores(FloatToStrF((DM1.liquidacionbeneficio + DM1.montoDevolucion - DM1.totalMontoDescuento ) * (DM1.cdsDFam.FieldByName('FAMPORC').AsCurrency / 100), ffNumber, 15, 2));  // HTC_SAR-984_EPS II
               End;
               If DM1.cdsDFam.FieldByName('FORPAGOID').AsString = '16' Then
               Begin
                  texto := '* CHEQUE DE GERENCIA DEL ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', DM1.cdsDFam.FieldByName('BANCOID').AsString);
                  montoCob := DM1.Valores(FloatToStrF((DM1.liquidacionbeneficio + DM1.montoDevolucion - DM1.totalMontoDescuento) * (DM1.cdsDFam.FieldByName('FAMPORC').AsCurrency / 100), ffNumber, 15, 2));  // HTC_SAR-984_EPS II
               End;
               // Inicio: DPP_201209_PRE
               //If DM1.cdsDFam.FieldByName('FORPAGOID').AsString = '18' Then
               If DM1.cdsDFam.FieldByName('FORPAGOID').AsString = '19' Then
               // Fin: DPP_201209_PRE
               Begin
                  texto := '* DEPOSITO EN CUENTA - ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', DM1.cdsDFam.FieldByName('BANCOID').AsString);
                   montoCob := DM1.Valores(FloatToStrF((DM1.liquidacionbeneficio + DM1.montoDevolucion - DM1.totalMontoDescuento) * (DM1.cdsDFam.FieldByName('FAMPORC').AsCurrency / 100), ffNumber, 15, 2));  // HTC_SAR-984_EPS II
               End;
               // FIN SAR2009-0203
               // fin HPP_200903_PRE
               // Insertando forma de Pago
               DM1.cdsForPag.Append;
               DM1.cdsForPag.FieldByName('DESC').AsString := texto;
               DM1.cdsForPag.FieldByName('FORPAGID').AsString := DM1.cdsDFam.FieldByName('FORPAGOID').AsString;
               DM1.cdsForPag.FieldByName('BANCOID').AsString := DM1.cdsDFam.FieldByName('BANCOID').AsString;
               DM1.cdsForPag.FieldByName('AGENBCOID').AsString := DM1.cdsDFam.FieldByName('AGENBCOID').AsString;
               DM1.cdsForPag.FieldByName('PVSLDNIBEN').AsString := DM1.cdsDFam.FieldByName('FAMNUMDOC').AsString;
               DM1.cdsForPag.FieldByName('PVSNOMBRE').AsString := DM1.cdsDFam.FieldByName('FAMAPENOM').AsString;
               DM1.cdsForPag.FieldByName('APEPATCOB').AsString := DM1.cdsDFam.FieldByName('FAMAPEPAT').AsString;
               DM1.cdsForPag.FieldByName('APEMATCOB').AsString := DM1.cdsDFam.FieldByName('FAMAPEMAT').AsString;
               DM1.cdsForPag.FieldByName('APECASCOB').AsString := DM1.cdsDFam.FieldByName('FAMAPECAS').AsString; // SPP_201403_PRE
               DM1.cdsForPag.FieldByName('NOMCOB').AsString := DM1.cdsDFam.FieldByName('FAMNOMBRE').AsString;
               DM1.cdsForPag.FieldByName('CODRELCOB').AsString := DM1.cdsDFam.FieldByName('FAMRELID').AsString;
               DM1.cdsForPag.FieldByName('APENOMTUT').AsString := Trim(DM1.cdsDFam.FieldByName('APEPATTUT').AsString) + ' ' + Trim(DM1.cdsDFam.FieldByName('APEMATTUT').AsString) + ' ' + Trim(DM1.cdsDFam.FieldByName('NOMTUT').AsString);
               DM1.cdsForPag.FieldByName('APEPATTUT').AsString := DM1.cdsDFam.FieldByName('APEPATTUT').AsString;
               DM1.cdsForPag.FieldByName('APEMATTUT').AsString := DM1.cdsDFam.FieldByName('APEMATTUT').AsString;
               DM1.cdsForPag.FieldByName('NOMTUT').AsString := DM1.cdsDFam.FieldByName('NOMTUT').AsString;
               // Inicio: SPP_201303_PRE
               DM1.cdsForPag.FieldByName('DIRDOMCOB').AsString := DM1.cdsDFam.FieldByName('FAMDIRECC').AsString;
               DM1.cdsForPag.FieldByName('CODZIPCOB').AsString :=  DM1.cdsDFam.FieldByName('DISTID').AsString;
               DM1.cdsForPag.FieldByName('TELFIJCOB').AsString :=  DM1.cdsDFam.FieldByName('FAMTELF').AsString;
               DM1.cdsForPag.FieldByName('TELMOVCOB').AsString :=  DM1.cdsDFam.FieldByName('FAMTELMOV').AsString;
               // Inicio: HPC_201703_PRE
               // Se actualiza email del familiar
               DM1.cdsForPag.FieldByName('EMAILCOB').AsString := DM1.cdsDFam.FieldByName('EMAILFAM').AsString;
               // Fin: HPC_201703_PRE
               // Fin: SPP_201303_PRE
               DM1.cdsForPag.Post;
               // Quien cobra
               texto := '  A : ' + Trim(DM1.cdsDFam.FieldByName('FAMAPENOM').AsString);
               If DM1.cdsDFam.FieldByName('FAMNUMDOC').AsString <> '' Then
               // Inicio: HPC_201809_PRE
               // texto := texto + '  [DNI.: ' + DM1.cdsDFam.FieldByName('FAMNUMDOC').AsString + ']';
               // texto := texto + '  [' + DM1.DevuelveValor('TGE149', 'PARENABR', 'PARENID', DM1.cdsDFam.FieldByName('FAMRELID').AsString) + ']  [' + FloatToStrF(DM1.cdsDFam.FieldByName('FAMPORC').AsFloat, ffNumber, 5, 2) + '%]';
               // Se añade texto menor o mayor de edad
               texto := texto + ' [DNI.: ' + DM1.cdsDFam.FieldByName('FAMNUMDOC').AsString+']';
               If DM1.cdsDFam.FieldByName('FAMRELID').AsString = '16' Then
                  texto := texto + ' ['+DM1.cdsDFam.FieldByName('FAMOTRTIPREL').AsString
               Else
                  texto := texto + ' ['+DM1.DevuelveValor('TGE149', 'PARENABR', 'PARENID', DM1.cdsDFam.FieldByName('FAMRELID').AsString);
               If (DM1.cdsDFam.FieldByName('FAMRELID').AsString = '02') Or (DM1.cdsDFam.FieldByName('FAMRELID').AsString = '15') Or (DM1.cdsDFam.FieldByName('FAMRELID').AsString = '16') Then
                  If DM1.cdsDFam.FieldByName('MENEDAD').AsString = 'S' Then
                     texto := texto + ' MENOR]'
                  Else
                     texto := texto + ' MAYOR]';
               texto := texto + ' ['+FloatToStrF(DM1.cdsDFam.FieldByName('FAMPORC').AsFloat, ffNumber, 5, 2)+'%]';
               // Fin: HPC_201809_PRE
               DM1.cdsForPag.Append;
               DM1.cdsForPag.FieldByName('DESC').AsString := texto;
               If montoCob < 0 Then montoCob := 0;
               DM1.cdsForPag.FieldByName('MONTO').AsCurrency := montoCob;
               DM1.cdsForPag.FieldByName('PORCENTAJE').AsFloat := DM1.cdsDFam.FieldByName('FAMPORC').AsFloat;
               DM1.cdsForPag.FieldByName('FORPAGID').AsString := DM1.cdsDFam.FieldByName('FORPAGOID').AsString;
               DM1.cdsForPag.FieldByName('BANCOID').AsString := DM1.cdsDFam.FieldByName('BANCOID').AsString;
               DM1.cdsForPag.FieldByName('AGENBCOID').AsString := DM1.cdsDFam.FieldByName('AGENBCOID').AsString;
               DM1.cdsForPag.FieldByName('PVSLDNIBEN').AsString := DM1.cdsDFam.FieldByName('FAMNUMDOC').AsString;
               DM1.cdsForPag.FieldByName('PVSNOMBRE').AsString := DM1.cdsDFam.FieldByName('FAMAPENOM').AsString;
               DM1.cdsForPag.FieldByName('APEPATCOB').AsString := DM1.cdsDFam.FieldByName('FAMAPEPAT').AsString;
               DM1.cdsForPag.FieldByName('APEMATCOB').AsString := DM1.cdsDFam.FieldByName('FAMAPEMAT').AsString;
               DM1.cdsForPag.FieldByName('APECASCOB').AsString := DM1.cdsDFam.FieldByName('FAMAPECAS').AsString; // SPP_201403_PRE
               DM1.cdsForPag.FieldByName('NOMCOB').AsString := DM1.cdsDFam.FieldByName('FAMNOMBRE').AsString;
               DM1.cdsForPag.FieldByName('CODRELCOB').AsString := DM1.cdsDFam.FieldByName('FAMRELID').AsString;
               DM1.cdsForPag.FieldByName('APENOMTUT').AsString := Trim(DM1.cdsDFam.FieldByName('APEPATTUT').AsString) + ' ' + Trim(DM1.cdsDFam.FieldByName('APEMATTUT').AsString) + ' ' + Trim(DM1.cdsDFam.FieldByName('NOMTUT').AsString);
               DM1.cdsForPag.FieldByName('APEPATTUT').AsString := DM1.cdsDFam.FieldByName('APEPATTUT').AsString;
               DM1.cdsForPag.FieldByName('APEMATTUT').AsString := DM1.cdsDFam.FieldByName('APEMATTUT').AsString;
               DM1.cdsForPag.FieldByName('NOMTUT').AsString := DM1.cdsDFam.FieldByName('NOMTUT').AsString;
               If DM1.cdsDFam.FieldByName('FORPAGOID').AsString = '11' Then
               Begin
                  DM1.cdsForPag.FieldByName('APENOMTUT').AsString := DM1.cdsDFam.FieldByName('TUTAPENOM').AsString;
                  DM1.cdsForPag.FieldByName('DOCIDETUT').AsString := DM1.cdsDFam.FieldByName('TUTNUMDOC').AsString;
                  DM1.cdsForPag.FieldByName('FECNACMEN').AsString := DM1.cdsDFam.FieldByName('FAMFECNAC').AsString;
               End;
               // Inicio: SPP_201303_PRE
               DM1.cdsForPag.FieldByName('DIRDOMCOB').AsString := DM1.cdsDFam.FieldByName('FAMDIRECC').AsString;
               DM1.cdsForPag.FieldByName('CODZIPCOB').AsString :=  DM1.cdsDFam.FieldByName('DISTID').AsString;
               DM1.cdsForPag.FieldByName('TELFIJCOB').AsString :=  DM1.cdsDFam.FieldByName('FAMTELF').AsString;
               DM1.cdsForPag.FieldByName('TELMOVCOB').AsString :=  DM1.cdsDFam.FieldByName('FAMTELMOV').AsString;
               // Inicio: HPC_201703_PRE
               // Se actualiza email del familiar
               DM1.cdsForPag.FieldByName('EMAILCOB').AsString := DM1.cdsDFam.FieldByName('EMAILFAM').AsString;               
               // Fin: HPC_201703_PRE
               // Fin: SPP_201303_PRE
               DM1.cdsForPag.Post;
               DM1.cdsDFam.Next;
            End;
         End
         Else
            MessageDlg('La liquidación no cuenta con designatarios', mtCustom, [mbOk], 0);
      End;

    // Añadiendo o quintando centimo para el cuadre
      DM1.cdsForPag.First;
      montoCob := 0;
      While Not DM1.cdsForPag.Eof Do
      Begin
         montoCob := montoCob + DM1.cdsForPag.FieldByName('MONTO').AsFloat;
         DM1.cdsForPag.Next;
      End;

      If (DM1.liquidacionbeneficio + DM1.montoDevolucion - DM1.totalMontoDescuento) <> montoCob Then  // HTC_SAR-984_EPS II
      Begin
         DM1.cdsForPag.First;
         While Not DM1.cdsForPag.Eof Do
         Begin
            If DM1.cdsForPag.FieldByName('MONTO').AsFloat <> 0 Then
            Begin
               DM1.cdsForPag.Edit;
               DM1.cdsForPag.FieldByName('MONTO').AsFloat := DM1.cdsForPag.FieldByName('MONTO').AsFloat +
                  ((DM1.liquidacionbeneficio + DM1.montoDevolucion - DM1.totalMontoDescuento - DM1.montoTransferencia) - montoCob);  // HTC_SAR-984_EPS II
               DM1.cdsForPag.Post;
               Exit;
            End;
            DM1.cdsForPag.Next;
         End;
      End;

   End;

   If DM1.cdsForPag.RecordCount = 0 Then
   Begin
      DM1.cdsForPag.Append;
      // Inicio: HPC_201802_PRE
      // Se mofica el mensaje para los casos cuando no existe carta de designatarios 
      // DM1.cdsForPag.FieldByName('DESC').AsString := 'Error no existen designatarios';
      DM1.cdsForPag.FieldByName('DESC').AsString := 'Sin información de desembolso';
      // Fin: HPC_201802_PRE
      DM1.cdsForPag.FieldByName('MONTO').AsFloat := 0;
      DM1.cdsForPag.FieldByName('GRABAR').AsString := 'N';
      DM1.cdsForPag.Post;
   End;
End;

Function TDM1.DevuelveValor(xTabla, xValor, xLlave, xId: String): String;
Var
   xSql: String;
Begin
   xSql := 'SELECT ' + xValor + ' FROM ' + xTabla + ' WHERE ' + xLlave + ' = ' + QuotedStr(xId);
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   Result := DM1.cdsQry.FieldByName(xValor).AsString;
   Exit;
End;

Procedure TDM1.RepartePorcentaje(xAsoid: String);
Var
   xConyuge, xHijosMen, xHijosMay, xPadres, xHermanos, xOtros, xSobrinos: Word;
   xPorc, xConyugePor, xHijosMenPor, xHijosMayPor, xPadresPor, xHermanosPor, xOtrosPor, xSobrinosPor, xPorGra: Double;
   xSql, xUltPat, xUltMat, xUlNom: String;
Begin
   xConyuge := 0;
   xHijosMen := 0;
   xHijosMay := 0;
   xPadres := 0;
   xHermanos := 0;
   xOtros := 0;
   xSobrinos := 0;
   DM1.cdsDFam.First;
   While Not DM1.cdsDFam.Eof Do
   Begin
      If DM1.cdsDFam.FieldByName('FAMRELID').AsString = '01' Then xConyuge := xConyuge + 1;
      If DM1.cdsDFam.FieldByName('FAMRELID').AsString = '02' Then xHijosMen := xHijosMen + 1;
      If DM1.cdsDFam.FieldByName('FAMRELID').AsString = '03' Then xHijosMay := xHijosMay + 1;
      If DM1.cdsDFam.FieldByName('FAMRELID').AsString = '14' Then xPadres := xPadres + 1;
      If DM1.cdsDFam.FieldByName('FAMRELID').AsString = '15' Then xHermanos := xHermanos + 1;
      If DM1.cdsDFam.FieldByName('FAMRELID').AsString = '16' Then xOtros := xOtros + 1;
      If DM1.cdsDFam.FieldByName('FAMRELID').AsString = '17' Then xSobrinos := xSobrinos + 1; // SPP_201305_PRE
      DM1.cdsDFam.Next;
   End;
   If xConyuge > 1 Then MessageDlg('No puede existir más de un Conyuge', mtCustom, [mbOk], 0);
   If xPadres > 2 Then MessageDlg('No pueden existir más de dos padres', mtCustom, [mbOk], 0);
   If xConyuge > 0 Then
      If xHijosMen > 0 Then
      Begin
         xConyugePor := StrToFloat(FloatToStrF(50, ffNumber, 10, 6));
         xHijosMenPor := StrToFloat(FloatToStrF(50 / xHijosMen, ffNumber, 10, 6));
      End
      Else
         xConyugePor := StrToFloat(FloatToStrF(100, ffNumber, 10, 6))
   Else If xHijosMen > 0 Then xHijosMenPor := StrToFloat(FloatToStrF(100 / xHijosMen, ffNumber, 10, 6))
   Else If xHijosMay > 0 Then xHijosMayPor := StrToFloat(FloatToStrF(100 / xHijosMay, ffNumber, 10, 6))
   Else If xPadres   > 0 Then xPadresPor   := StrToFloat(FloatToStrF(100 / xPadres, ffNumber, 10, 6))
   Else If xHermanos > 0 Then xHermanosPor := StrToFloat(FloatToStrF(100 / xHermanos, ffNumber, 10, 6))
   Else If xSobrinos > 0 Then xSobrinosPor := StrToFloat(FloatToStrF(100 / xSobrinos, ffNumber, 10, 6))
   Else If xOtros    > 0 Then xOtrosPor    := StrToFloat(FloatToStrF(100 / xOtros, ffNumber, 10, 6));
   DM1.cdsDFam.First;
   While Not DM1.cdsDFam.Eof Do
   Begin
      If DM1.cdsDFam.FieldByName('FAMRELID').AsString = '01' Then xPorGra := xConyugePor;
      If DM1.cdsDFam.FieldByName('FAMRELID').AsString = '02' Then xPorGra := xHijosMenPor;
      If DM1.cdsDFam.FieldByName('FAMRELID').AsString = '03' Then xPorGra := xHijosMayPor;
      If DM1.cdsDFam.FieldByName('FAMRELID').AsString = '14' Then xPorGra := xPadresPor;
      If DM1.cdsDFam.FieldByName('FAMRELID').AsString = '15' Then xPorGra := xHermanosPor;
      If DM1.cdsDFam.FieldByName('FAMRELID').AsString = '17' Then xPorGra := xSobrinosPor; // SPP_201305_PRE
      If DM1.cdsDFam.FieldByName('FAMRELID').AsString = '16' Then xPorGra := xOtrosPor;
      xSql := 'UPDATE APO203 SET FAMPORC = ' + floattostr(xPorGra)
         + ' WHERE ASOID = ' + QuotedStr(DM1.cdsDFam.FieldByName('ASOID').AsString)
         + ' AND FAMAPEPAT = ' + QuotedStr(DM1.cdsDFam.FieldByName('FAMAPEPAT').AsString)
         + ' AND FAMAPEMAT = ' + QuotedStr(DM1.cdsDFam.FieldByName('FAMAPEMAT').AsString)
         + ' AND FAMNOMBRE     = ' + QuotedStr(DM1.cdsDFam.FieldByName('FAMNOMBRE').AsString);
      xUltPat := DM1.cdsDFam.FieldByName('FAMAPEPAT').AsString;
      xUltMat := DM1.cdsDFam.FieldByName('FAMAPEMAT').AsString;
      xUlNom := DM1.cdsDFam.FieldByName('FAMNOMBRE').AsString;
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      DM1.cdsDFam.Next;
   End;
   xSql := 'SELECT A.FAMAPENOM, A.FAMAPEPAT, A.FAMAPEMAT, A.FAMNOMBRE, A.FAMNUMDOC, B.PARENDES, A.FAMFECNAC,  A.FAMPORC, A.BANCOID,'
   // Inicio: HPC_201809_PRE 
   // Se añade el campo email
   // + ' A.FORPAGOID, A.FAMRELID, A.TUTAPENOM, A.APEPATTUT, A.APEMATTUT, A.NOMTUT, A.TUTNUMDOC, A.FAMSEXO, A.AGENBCOID, A.ASOID, A.ROWID FROM APO203 A, TGE149 B'
   + ' A.FORPAGOID, A.FAMRELID, A.TUTAPENOM, A.APEPATTUT, A.APEMATTUT, A.NOMTUT, A.TUTNUMDOC, A.FAMSEXO, A.AGENBCOID, A.ASOID, A.EMAILFAM, A.ROWID FROM APO203 A, TGE149 B'
   // Inicio: HPC_201809_PRE 
   + ' WHERE ASOID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString) + ' AND A.FAMRELID = B.PARENID(+)';
   DM1.cdsDFam.Close;
   DM1.cdsDFam.DataRequest(xSql);
   DM1.cdsDFam.Open;
   xPorc := 0;
   DM1.cdsDFam.First;
   While Not DM1.cdsDFam.Eof Do
   Begin
      xPorc := xPorc + DM1.cdsDFam.FieldByName('FAMPORC').AsFloat;
      DM1.cdsDFam.Next;
   End;
   xSql := 'UPDATE APO203 SET FAMPORC = ' + floattostr(xPorGra + (100 - xPorc))
      + ' WHERE ASOID = ' + QuotedStr(DM1.cdsDFam.FieldByName('ASOID').AsString)
      + ' AND FAMAPEPAT = ' + QuotedStr(xUltPat)
      + ' AND FAMAPEMAT = ' + QuotedStr(xUltMat)
      + ' AND FAMNOMBRE     = ' + QuotedStr(xUlNom);
   DM1.DCOM1.AppServer.EjecutaSQL(xSql);
   // Inicio: HPC_201809_PRE
   // Se retira Qry no usado
   // DM1.cdsQry.Next;
   // Fin: HPC_201809_PRE
End;

Procedure TDM1.descuentos(xAsoid: String);
Var
   xSql, texto: String;
   monto, canTran, montoTran: Double;
Begin
   DM1.cdsDetDes.EmptyDataSet;
   DM1.montoDescuento := 0;
   // Retenciones judiciales
   // Verificando si existen retenciones judiciales
   If DM1.cdsMaestRetJud.Active = True Then
   Begin
      DM1.montoRetencion := 0;
      DM1.cdsMaestRetJud.First;
      If DM1.cdsMaestRetJud.RecordCount > 0 Then
      Begin
         While Not DM1.cdsMaestRetJud.Eof Do
         Begin
            texto := '';
            monto := 0;
            If DM1.cdsMaestRetJud.FieldByName('RTJPORC').AsFloat > 0 Then
            Begin
               DM1.cdsDetDes.Append;
               If Trim(DM1.cdsMaestRetJud.FieldByName('RTJJUZG').AsString) <> '' Then
                  texto := texto + 'RJ [' + Trim(DM1.cdsMaestRetJud.FieldByName('RTJJUZG').AsString) + ']';
               If Trim(DM1.cdsMaestRetJud.FieldByName('APENOMBEN').AsString) <> '' Then
                  texto := texto + '  [' + Trim(DM1.cdsMaestRetJud.FieldByName('APENOMBEN').AsString) + ']';
               If Trim(DM1.cdsMaestRetJud.FieldByName('RTJPORC').AsString) <> '' Then
                  texto := texto + '  [' + Trim(DM1.cdsMaestRetJud.FieldByName('RTJPORC').AsString) + '%]';
               DM1.cdsDetDes.FieldByName('DESC').AsString := texto;
               monto := (DM1.liquidacionbeneficio + DM1.montoDevApo - DM1.montoNivApo) * (DM1.cdsMaestRetJud.FieldByName('RTJPORC').AsFloat / 100);
               if (monto+DM1.montoRetencion)>(DM1.liquidacionbeneficio + DM1.montoDevApo - DM1.montoNivApo) then
                  monto := DM1.liquidacionbeneficio + DM1.montoDevApo - DM1.montoNivApo -DM1.montoRetencion;
               monto := DM1.Valores(FloatToStrF(monto, ffnumber, 10, 2));
               DM1.cdsDetDes.FieldByName('TIPO').AsString := 'J';
               DM1.cdsDetDes.FieldByName('MONTO').AsFloat := monto;
               DM1.montoRetencion := DM1.montoRetencion + monto;
               DM1.cdsDetDes.Post;
            End
            Else
               If DM1.cdsMaestRetJud.FieldByName('RTJIMPOR').AsFloat > 0 Then
               Begin
                  If (DM1.liquidacionbeneficio + DM1.montoDevApo - DM1.montoNivApo - DM1.montoRetencion) > DM1.cdsMaestRetJud.FieldByName('RTJIMPOR').AsFloat Then
                  Begin
                     DM1.cdsDetDes.Append;
                     DM1.cdsDetDes.FieldByName('DESC').AsString := 'RJ [' + Trim(DM1.cdsMaestRetJud.FieldByName('RTJJUZG').AsString) + ']'
                        + '[' + Trim(DM1.cdsMaestRetJud.FieldByName('APENOMBEN').AsString) + ']';
                     DM1.cdsDetDes.FieldByName('TIPO').AsString := 'J';
                     DM1.cdsDetDes.FieldByName('MONTO').AsCurrency := DM1.cdsMaestRetJud.FieldByName('RTJIMPOR').AsFloat;
                     DM1.cdsDetDes.Post;
                     DM1.montoRetencion := DM1.montoRetencion + DM1.cdsMaestRetJud.FieldByName('RTJIMPOR').AsFloat;
                  End
                  Else
                  Begin
                     DM1.cdsDetDes.Append;
                     DM1.cdsDetDes.FieldByName('DESC').AsString := 'RJ [' + Trim(DM1.cdsMaestRetJud.FieldByName('RTJJUZG').AsString) + ']'
                        + '[' + Trim(DM1.cdsMaestRetJud.FieldByName('APENOMBEN').AsString) + ']';
                     DM1.cdsDetDes.FieldByName('TIPO').AsString := 'J';
                     DM1.cdsDetDes.FieldByName('MONTO').AsFloat := DM1.liquidacionbeneficio + DM1.montoDevApo - DM1.montoNivApo - DM1.montoRetencion;
                     DM1.cdsDetDes.Post;
                     DM1.montoRetencion := DM1.montoRetencion + (DM1.liquidacionbeneficio + DM1.montoDevApo - DM1.montoNivApo - DM1.montoRetencion);
                  End;
               End;
            DM1.cdsMaestRetJud.Next;
         End;
      End;
   End;
  // Nivelaciones
   If DM1.montoNivApo > 0 Then
   Begin
      DM1.cdsDetDes.Append;
      DM1.cdsDetDes.FieldByName('DESC').AsString := 'NIVELACION DE APORTES (APORTES NO PAGADOS)';
      DM1.cdsDetDes.FieldByName('MONTO').AsCurrency := DM1.montoNivApo;
      DM1.cdsDetDes.FieldByName('TIPO').AsString := 'A';
      DM1.cdsDetDes.Post;
      DM1.montoDescuento := DM1.montoDescuento + DM1.montoNivApo;
   End;

// Inicio HPC_201504_PRE : Descuentos por aplicaciones de CCI
   DM1.cdsCreCCI.First;
   While Not DM1.cdsCreCCI.Eof Do
   Begin
      If DM1.cdsCreCCI.FieldByName('monapl').AsCurrency > 0 Then
      Begin
         DM1.cdsDetDes.Append;
         DM1.cdsDetDes.FieldByName('DESC').AsString :=
            'Aplicaciones CCI Nº: '+DM1.cdsCreCCI.FieldByName('codaplica').AsString+' [Credito Nº : ' + Copy(DM1.cdsCreCCI.FieldByName('CREDID').AsString, 3, 4) + '-' + Copy(DM1.cdsCreCCI.FieldByName('CREDID').AsString, 10, 7)
            + ' - S/. ' + DM1.cdsCreCCI.FieldByName('monapl').AsString + ' ] ';
         DM1.cdsDetDes.FieldByName('MONTO').AsCurrency := DM1.cdsCreCCI.FieldByName('monapl').AsCurrency;
         DM1.cdsDetDes.FieldByName('TIPO').AsString := 'CI';
         DM1.cdsDetDes.FieldByName('CREDID').AsString := DM1.cdsCreCCI.FieldByName('CREDID').AsString;
         DM1.cdsDetDes.FieldByName('SDOACT').AsFloat := 0;
         DM1.cdsDetDes.Post;
         DM1.montoDescuento := DM1.montoDescuento + DM1.cdsCreCCI.FieldByName('monapl').AsCurrency;
      End;
      DM1.cdsCreCCI.Next;
   End;
// Fin   HPC_201504_PRE : Descuentos por aplicaciones de CCI


  // Prestamos
   DM1.cdsCalCre.First;
   While Not DM1.cdsCalCre.Eof Do
   Begin
      If DM1.cdsCalCre.FieldByName('CREMTODES').AsCurrency > 0 Then
      Begin
         DM1.cdsDetDes.Append;
         DM1.cdsDetDes.FieldByName('DESC').AsString := DM1.cdsCalCre.FieldByName('TIPCREDES').AsString
            + '  [Nº : ' + Copy(DM1.cdsCalCre.FieldByName('CREDID').AsString, 3, 4) + '-' + Copy(DM1.cdsCalCre.FieldByName('CREDID').AsString, 10, 7)
            + ' - S/. ' + DM1.cdsCalCre.FieldByName('CRESDOACT').AsString + ' ]';
         DM1.cdsDetDes.FieldByName('MONTO').AsCurrency := DM1.cdsCalCre.FieldByName('CREMTODES').AsCurrency;
         DM1.cdsDetDes.FieldByName('TIPO').AsString := 'C';
         DM1.cdsDetDes.FieldByName('CREDID').AsString := cdsCalCre.FieldByName('CREDID').AsString;
         DM1.cdsDetDes.FieldByName('SDOACT').AsFloat := DM1.cdsCalCre.FieldByName('CRESDOACT').AsFloat;
         DM1.cdsDetDes.Post;
         DM1.montoDescuento := DM1.montoDescuento + DM1.cdsCalCre.FieldByName('CREMTODES').AsCurrency;
      End;
      DM1.cdsCalCre.Next;
   End;
  // Añadiendo comisión por transferencias
   canTran := 0;
   DM1.montoTransferencia := 0;
   If DM1.cdsExpLiq.FieldByName('PVSCOBASO').AsString = 'S' Then
   Begin
      If DM1.cdsExpLiq.FieldByName('FORPAGOID').AsString = '05' Then canTran := 1;
   End
   Else
   Begin
      // Inicio: HPC_201609_PRE
      // Se añade al script de busqueda la condicion en el cual no debe tomar  tipo de estado = "13" (anulado)
      // xSql := 'SELECT * FROM PVS302 WHERE ASOID = ' + QuotedStr(xAsoid);
      xSql := 'SELECT DSGNRO, DSGFREC, DSGESTAD, DSGFAPER, DSGVIG, ASOID, DSGOBS, DSGNOMBR, DSGAPEPAT, DSGAPEMAT, DSGNOMBRT, USUARIO, FREG, HREG, FECAPER, PVSEXPNRO, PVSNROLIQ, PVSFANUL, ANULADO, USUANU,'
      +' FECANU, PVSLBENNR, ASODNI, ASOAPENOMDNI, ASOCODMOD, USUAPE, CODOTRDOCIDE, NUMOTRDOCIDE, MOTANUCAR FROM PVS302 WHERE ASOID = '+QuotedStr(xAsoid)+' AND DSGESTAD NOT IN ''13''';
      // Fin: HPC_201609_PRE
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      If DM1.cdsQry.RecordCount > 0 Then
      Begin
         xSql := 'SELECT * FROM PVS303 WHERE ASOID = ' + QuotedStr(xAsoid);
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         While Not DM1.cdsQry.Eof Do
         Begin
            If DM1.cdsQry.FieldByName('FORPAGOID').AsString = '05' Then
               canTran := canTran + 1;
            DM1.cdsQry.Next;
         End;
      End
      Else
      Begin
         xSql := 'SELECT * FROM APO203 WHERE ASOID = ' + QuotedStr(xAsoid);
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         While Not DM1.cdsQry.Eof Do
         Begin
            If DM1.cdsQry.FieldByName('FORPAGOID').AsString = '05' Then
               canTran := canTran + 1;
            DM1.cdsQry.Next;
         End;
      End;
   End;
  // Se añade en descuento la glosa de descuento por fondo solidario
   While Not DM1.cdsFonSol.Eof Do
   Begin
      DM1.cdsDetDes.Append;
      DM1.cdsDetDes.FieldByName('DESC').AsString := 'FSC.SOL. Nº: '+ DM1.cdsFonSol.FieldByName('NUM_DEU').AsString+' / '+DM1.cdsFonSol.FieldByName('NRO_REF_FSC').AsString;
      DM1.cdsDetDes.FieldByName('MONTO').AsCurrency := DM1.cdsFonSol.FieldByName('IMP_COB_FSC').AsFloat;
      DM1.cdsDetDes.FieldByName('TIPO').AsString := 'F';
      DM1.cdsDetDes.Post;
      DM1.cdsFonSol.Next;
      DM1.montoDescuento := DM1.montoDescuento + DM1.cdsFonSol.FieldByName('IMP_COB_FSC').AsFloat;
   End;
  // Fin : SAR-2009-0984 Fondo Solidario
  // Verificando si hay efectivo para los pagos
   If ((DM1.liquidacionbeneficio - DM1.montoliquidacionanterior) + DM1.montoDevolucion - DM1.montoDescuento - DM1.montoRetencion) > (canTran * 11.50) Then
   Begin
    // Insertando costo de transferencia si es el caso
      If canTran > 0 Then
      Begin
         DM1.cdsDetDes.Append;
         DM1.cdsDetDes.FieldByName('DESC').AsString := 'TRANSFERENCIA DE BENEFICIOS (G.PROV)';
         montoTran := (canTran * 11.50);
         DM1.cdsDetDes.FieldByName('MONTO').AsCurrency := montoTran;
         DM1.cdsDetDes.FieldByName('TIPO').AsString := 'T';
         DM1.cdsDetDes.Post;
         DM1.montoTransferencia := (canTran * 11.50);
      End;
   End;

   If DM1.cdsDetDes.RecordCount = 0 Then
   Begin
      DM1.cdsDetDes.Append;
      DM1.cdsDetDes.FieldByName('DESC').AsString := 'No existen conceptos por descuentos';
      DM1.cdsDetDes.FieldByName('MONTO').AsFloat := 0;
      DM1.cdsDetDes.FieldByName('GRABAR').AsString := 'N';
      DM1.cdsDetDes.Post;
   End;

End;

Procedure TDM1.devoluciones(xAsoid: String);
Begin
  // Devolucion de aportes
   DM1.montoDevolucion := 0;
   DM1.cdsDetDev.EmptyDataSet;
   If DM1.montoDevApo > 0 Then
   Begin
      DM1.cdsDetDev.Append;
      DM1.cdsDetDev.FieldByName('DESC').AsString := 'DEVOLUCION DE APORTES(APORTES INDEBIDOS)';
      DM1.cdsDetDev.FieldByName('MONTO').AsCurrency := DM1.montoDevApo;
      DM1.cdsDetDev.Post;
      DM1.montoDevolucion := DM1.montoDevolucion + DM1.montoDevApo;
   End;
   If DM1.cdsDetDev.RecordCount = 0 Then
   Begin
      DM1.cdsDetDev.Append;
      DM1.cdsDetDev.FieldByName('DESC').AsString := 'No existen conceptos por devoluciones';
      DM1.cdsDetDev.FieldByName('MONTO').AsFloat := 0;
      DM1.cdsDetDev.FieldByName('GRABAR').AsString := 'N';
      DM1.cdsDetDev.Post;
   End;
End;

Procedure TDM1.observaciones(xAsoid: String);
Var
   // Inicio: HPC_201506_PRE
   // Se añade variable para controlar si se cuenta con credito
   // xSql, texto: String;
   xSql, texto, xsconcredito: String;
   // Fin: HPC_201506_PRE
   // Inicio: DPP_201208_PRE
   // monforpag, montoCob, saldoAct, saldesliq: Double;
   monforpag, saldoAct: Double;
   // Fin: DPP_201208_PRE
Begin
   // Inicio: HPC_201607_PRE --Se añade impresion de Dpartamento / Oicina de origen en la glosa Obervación
   DM1.cdsObs.EmptyDataSet;
   If Trim(DM1.cdsExpLiq.FieldByName('DEPORIEXP').AsString) = '' Then
   Begin
      // Origen del expediente
      texto := 'Origen del Expediente : ';
      If DM1.cdsExpLiq.FieldByname('REPRID').AsString <> '' Then
      Begin
         // xSql := 'SELECT * FROM COB201 WHERE REPRID = '+QuotedStr(DM1.cdsExpLiq.FieldByname('REPRID').AsString);
         xSql := 'SELECT REPRID, REPRAPENOM FROM COB201 WHERE REPRID = '+QuotedStr(DM1.cdsExpLiq.FieldByname('REPRID').AsString);         
         DM1.cdsRepresentante.Close;
         DM1.cdsRepresentante.DataRequest(xSql);
         DM1.cdsRepresentante.Open;
         texto := texto + Trim(DM1.cdsRepresentante.FieldByName('REPRAPENOM').AsString)+' - '+DM1.desubigeo(DM1.cdsRepresentante.FieldByName('ZIPID').AsString);
      End
      Else
         texto := texto + 'Oficina de Previsión Social';
   End
   Else
      texto := texto + DM1.DevuelveValor('APO158', 'DPTODES', 'DPTOID', DM1.cdsExpLiq.FieldByname('DEPORIEXP').AsString ) + '/' +
      DM1.DevuelveValor('APO110', 'OFDESNOM', 'OFDESID', DM1.cdsExpLiq.FieldByname('OFIORIEXP').AsString );
   // Fin: HPC_201607_PRE
   DM1.cdsObs.Append;
   DM1.cdsObs.FieldByName('DESC').AsString := texto;
   DM1.cdsObs.Post;
   // Inicio: DPP_201204_PRE
   // Retención
   // Chequeando si existe monto sobrante para verificar si el total retenido no supero el total de la liquidación.
   If DM1.montoRetencion > 0 Then
   Begin
      monforpag := 0;
      DM1.cdsForPag.First;
      While Not DM1.cdsForPag.Eof Do
      Begin
         monforpag := monforpag + DM1.cdsForPag.FieldByName('MONTO').AsFloat;
         DM1.cdsForPag.Next;
      End;
      If monforpag = 0 Then
      Begin
         DM1.cdsObs.Append; DM1.cdsObs.FieldByName('DESC').AsString := '* RETENCION SUPERA O ES IGUAL AL MONTO DE LA LIQUIDACION DE BENEFICIO,'; DM1.cdsObs.Post;
         DM1.cdsObs.Append; DM1.cdsObs.FieldByName('DESC').AsString := ' SE ASIGNA EL TOTAL DE LO LIQUIDADO AL DEMANDANTE.'; DM1.cdsObs.Post;
      End;
   End;
   // Fin: DPP_201204_PRE
   // Prestamos efectuados
   If DM1.cdsCalCre.RecordCount > 0 Then
   Begin
      // Inicio: DPP_201208_PRE
      // saldesliq:= 0;
      // montoCob := 0;
      // Fin: DPP_201208_PRE
      saldoAct := 0;
      DM1.cdsCalCre.First;
      While Not DM1.cdsCalCre.Eof Do
      Begin
         saldoAct := saldoAct + DM1.cdsCalCre.FieldByName('CRESDOACT').AsFloat;
         DM1.cdsCalCre.Next;
      End;
      // Inicio: DPP_201208_PRE
// Inicio: SPP_201307_PRE
      // DM1.cdsCalCuo.First;
      // While Not DM1.cdsCalCuo.Eof Do
      // Begin
      //    If DM1.cdsCalCuo.FieldByName('CREESTID').AsString <> 'C' Then
      //       saldesliq := saldesliq + (DM1.cdsCalCuo.FieldByName('CREMTO').AsFloat-(DM1.cdsCalCuo.FieldByName('CREAMORT').AsFloat + DM1.cdsCalCuo.FieldByName('CREINTERES').AsFloat + DM1.cdsCalCuo.FieldByName('CREFLAT').AsFloat + DM1.cdsCalCuo.FieldByName('MONCOBDESGRAV').AsFloat));
      //    montoCob := montoCob + DM1.cdsCalCuo.FieldByName('CREAMORT').AsFloat + DM1.cdsCalCuo.FieldByName('CREINTERES').AsFloat + DM1.cdsCalCuo.FieldByName('CREFLAT').AsFloat  + DM1.cdsCalCuo.FieldByName('MONCOBDESGRAV').AsFloat;
      //    DM1.cdsCalCuo.Next;
      // End;
// Fin: SPP_201307_PRE
      xSql := 'SELECT SUM(NVL(SALDO,0)-NVL(PAGO,0)) SALDESLIQ, SUM(NVL(PAGO,0)) MONCOB FROM DB2ADMIN.COB_POLITICA_CUO_GTT';
      // Inicio: HPC_201506_PRE
      // DM1.cdsQry.Close;
      // DM1.cdsQry.DataRequest(xSql);
      // DM1.cdsQry.Open;
      DM1.cdsQry1.Close;
      DM1.cdsQry1.DataRequest(xSql);
      DM1.cdsQry1.Open;
      xsconcredito := 'S';
      DM1.cdsObs.Append;
      DM1.cdsObs.FieldByName('DESC').AsString := 'DESCUENTO POR PRESTAMO EFECTUADO';
      // DM1.cdsObs.FieldByName('MONTO').AsFloat := DM1.cdsQry.FieldByName('MONCOB').AsFloat;
      DM1.cdsObs.FieldByName('MONTO').AsFloat := DM1.cdsQry1.FieldByName('MONCOB').AsFloat;
      DM1.cdsObs.Post;
      DM1.cdsObs.Append;
      // DM1.cdsObs.FieldByName('DESC').AsString := 'SALDO DE LA DEUDA DESPUES DE LA LIQUIDACION';
      texto := 'SALDO DE LA DEUDA DESPUES DE LA LIQUIDACION AL: '+DateToStr(DM1.FechaSys);
      If DM1.cdsQry1.FieldByName('SALDESLIQ').AsFloat > 0 Then
         texto := texto + ', sin intereses';
      DM1.cdsObs.FieldByName('DESC').AsString := texto;
      DM1.cdsObs.FieldByName('MONTO').AsFloat := DM1.cdsQry1.FieldByName('SALDESLIQ').AsFloat;
      DM1.cdsObs.Post;
      // saldo total de la deuda
      If DM1.cdsQry1.FieldByName('SALDESLIQ').AsFloat > 0 Then
      Begin
         // Inicio: HPC_201507_PRE
         // Se coloca el monto saldo total despues de la liquidación,
         // incluyendo los intereses. 
         // xSql := 'SELECT SUM(NVL(B.CREMTO,0)-NVL(B.CREMTOCOB,0)) SALDOTOT FROM CRE301 A, CRE302 B WHERE A.ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)
         // +' AND A.CREESTID = ''02'' AND A.ASOID = B.ASOID AND A.CREDID = B.CREDID AND B.CREESTID IN (''02'',''11'',''14'',''19'',''27'')';
         xSql := 'SELECT SUM(NVL(SALDO,0)) SALDOTOT FROM (SELECT SUM(NVL(CREMTO,0)-NVL(PAGO,0)) SALDO  FROM DB2ADMIN.COB_POLITICA_CUO_GTT'
         +' WHERE NVL(PAGO,0) > 0 AND NVL(SALDO,0)-NVL(PAGO,0) > 0'
         +' UNION ALL'
         +' SELECT SUM(NVL(CREMTO,0)) SALDO  FROM DB2ADMIN.COB_POLITICA_CUO_GTT WHERE NVL(PAGO,0) = 0)';
         // Fin: HPC_201507_PRE
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         DM1.cdsObs.Append;
         DM1.cdsObs.FieldByName('DESC').AsString := 'SALDO TOTAL DE LA DEUDA(Incluye amortización, intereses, gastos y cuotas en proceso de cobranza)';
         DM1.cdsObs.FieldByName('MONTO').AsFloat := DM1.cdsQry.FieldByName('SALDOTOT').AsFloat;
         DM1.cdsObs.Post;
      End;
   End;
   // Se verifica si sus creditos aplican o no al desgravamen
   xSql := 'SELECT B.ESTAPRDES FROM ASO_FAC_GES_CAB A, ASO_FAC_GES_DET B WHERE A.NUMMEM = '+QuotedStr('EXP'+DM1.cdsExpLiq.FieldByName('PVSEXPNRO').AsString)
   +' AND A.IDEGESFAL = B.IDEGESFAL AND B.ASOID = '+QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString);
   // xSql := 'SELECT COUNT(*) CANTIDAD FROM CRE301 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND CREESTID = ''02'' AND NVL(TASFONDES,0) = 0';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   DM1.cdsObs.Append;
   If DM1.cdsQry.FieldByName('ESTAPRDES').AsString = 'POR APLICAR' Then
      DM1.cdsObs.FieldByName('DESC').AsString := 'APLICACION FPD PENDIENTE DE EVALUACION POR EL EQUIPO DE COBRANZAS';
   If DM1.cdsQry.FieldByName('ESTAPRDES').AsString = 'APLICADO' Then
      DM1.cdsObs.FieldByName('DESC').AsString := 'DEUDA YA FUE APLICADA AL FONDO DE PROTECCION DESGRAVAMEN';
   If DM1.cdsQry.FieldByName('ESTAPRDES').AsString = 'NO APLICA' Then
      DM1.cdsObs.FieldByName('DESC').AsString := 'DEUDA NO APLICA AL FONDO DE PROTECCION DESGRAVAMEN';
   DM1.cdsObs.FieldByName('GRABAR').AsString := 'N';
   DM1.cdsObs.Post;
   // DM1.cdsObs.Append;
   // If DM1.cdsQry.FieldByName('CANTIDAD').AsInteger = 0 Then
   //    DM1.cdsObs.FieldByName('DESC').AsString := 'DEUDA NO APLICA AL FONDO DE PROTECCION DESGRAVAMEN'
   // Else
   //    DM1.cdsObs.FieldByName('DESC').AsString := 'DEUDA SI APLICA AL FONDO DE PROTECCION DESGRAVAMEN';
   // DM1.cdsObs.FieldByName('GRABAR').AsString := 'N';
   // DM1.cdsObs.Post;
    If xsconcredito = 'S' Then
    Begin
       If DM1.cdsQry1.FieldByName('SALDESLIQ').AsFloat = 0 Then
       Begin
          DM1.cdsObs.Append;
          DM1.cdsObs.FieldByName('DESC').AsString := 'Nota: Después de la Liquidación, si hubiera alguna cuota en proceso de cobranza y esta sea descontada por planilla y registrada';
          DM1.cdsObs.FieldByName('MONTO').AsFloat := 0;
          DM1.cdsObs.Post;
          DM1.cdsObs.Append;
          DM1.cdsObs.FieldByName('DESC').AsString := 'en nuestro sistema, seran devueltas por el equipo de cobranzas de DM.';
          DM1.cdsObs.FieldByName('MONTO').AsFloat := 0;
          DM1.cdsObs.Post;
       End;
    End;
    // Fin: HPC_201506_PRE
    // Fin: DPP_201208_PRE

   // Inicio: SPP_201307_PRE
   // Se envia al final de procedimiento. Solo se ejecuta si no cuenta con observaciones registradas
   // If DM1.cdsObs.RecordCount = 0 Then
   // Begin
   //   DM1.cdsObs.Append;
   //   DM1.cdsObs.FieldByName('DESC').AsString := 'No existen observaciones';
   //   DM1.cdsObs.FieldByName('MONTO').AsFloat := 0;
   //   DM1.cdsObs.FieldByName('GRABAR').AsString := 'N';
   //   DM1.cdsObs.Post;
   // End;

   // Pago con carta de designación
   If DM1.cobraconcarta = 'S' Then
   Begin
      DM1.cdsObs.Append;
      DM1.cdsObs.FieldByName('DESC').AsString := 'DOCENTE LIQUIDADO CON CARTA DE BENEFICIARIO';
      DM1.cdsObs.Post;
   End;
   // Fin: SPP_201307_PRE

   // Inicio: SPP_201307_PRE
   // Se valida si es Retiro por invalidez temporal
   // o invalidez sin firmar carta por autorizacion de descuento de aportes
   // Inicio: HPC_201508_PRE
   // Se muestra información solo para liquidaciones fallecimiento e invalidez y con fecha de cese mayor o igual a febrero 2007
   // Se conserva el mensaje para liquidaciones de retiro con invalidez temporal.
   // If (DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString = '01') And (DM1.cdsExpLiq.FieldByName('PVSTIPRET').AsString = '1')
   // Or (((DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString = '02') Or (DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString = '03')) And (DM1.cdsAsociado.FieldByName('AUTDESAPO').AsString <> 'S')) Then
   If ((DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString = '01') And (DM1.cdsExpLiq.FieldByName('PVSTIPRET').AsString = '1'))
     Or (((DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString = '02') Or (DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString = '03'))
        And ((DM1.cdsAsociado.FieldByName('AUTDESAPO').AsString <> 'S') And (DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsDateTime >= StrToDate('01/02/2007')))
     ) Then 
   Begin
      If DM1.cdsExpLiq.FieldByName('PVSTIPRET').AsString = '1' Then
         texto := '* NO APLICA BENEFICIO POR INVALIDEZ'
      Else
         texto := '* NO APLICA BENEFICIO POR '+DM1.DevuelveValor('TGE186', 'BENEFABR', 'TIPBENEF', DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString);
      texto := texto + ' POR NO CUMPLIR CON LO ESTABLECIDO EN EL';
      DM1.cdsObs.Append;
      DM1.cdsObs.FieldByName('DESC').AsString := texto;
      DM1.cdsObs.Post;
      texto := '   REGLAMENTO DE OPERACIONES DE PREVISION SOCIAL; SE PAGA SALDO DE LA CUENTA INDIVIDUAL.';
      DM1.cdsObs.Append;
      DM1.cdsObs.FieldByName('DESC').AsString := texto;
      DM1.cdsObs.Post;
   End;
   // Fin: HPC_201508_PRE
   // Fin: SPP_201307_PRE

   // Inicio: SPP_201403_PRE
   // Pago con carta de designación
   // If DM1.cobraconcarta = 'S' Then
   // Begin
   //    DM1.cdsObs.Append;
   //   DM1.cdsObs.FieldByName('DESC').AsString := 'DOCENTE LIQUIDADO CON CARTA DE BENEFICIARIO';
   //   DM1.cdsObs.Post;
   // End;
   // Fin: SPP_201403_PRE

   // Inicio: SPP_201307_PRE
   // Se ejecuta si no se ha registrado observaciones.
   If DM1.cdsObs.RecordCount = 0 Then
   Begin
      DM1.cdsObs.Append;
      DM1.cdsObs.FieldByName('DESC').AsString := 'No existen observaciones';
      DM1.cdsObs.FieldByName('MONTO').AsFloat := 0;
      DM1.cdsObs.FieldByName('GRABAR').AsString := 'N';
      DM1.cdsObs.Post;
   End;
   // Fin: SPP_201307_PRE
End;

Function TDM1.GenNumLiq: String;
Var
   xSql, xAno, xNumLiq: String;
Begin
   xAno := Copy(DateToStr(date), 7, 4);
   xSql := 'SELECT CORREANO||LPAD(VARIOS+1, 7, ''0'') PVSLBENNR FROM CRE206 WHERE CREAREA = ''PRE'' AND TIPO = ''L'' AND CORREANO  = ' + QuotedStr(xAno);
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   xNumLiq := DM1.cdsQry.FieldByname('PVSLBENNR').AsString;
   xSql := 'UPDATE CRE206 SET VARIOS=LPAD(VARIOS+1, 7, ''0'') WHERE CREAREA = ''PRE'''
      + ' AND TIPO = ''L'' AND CORREANO = ' + QuotedStr(xAno);
   DM1.DCOM1.AppServer.EjecutaSQL(xSql);
   Result := xNumLiq;
End;

Procedure TDM1.Grabanivelaciones(xAsoid: String);
Var
   xSql, xWhere: String;
   xUseAbr, xUpagoAbr, xUproAbr: String;
   xDptoAbr, xNumLiq, xFecCes: String;
   xTransAamm, xTransTrim, xTransAaTri, xTransSem, xTransAaSem: String;
Begin
   DM1.cdsNivApo.First;
   While Not DM1.cdsNivApo.Eof Do
   Begin
      If DM1.cdsNivApo.FieldByName('GRABAR').AsString <> 'N' Then
      Begin
         xWhere := 'UPROID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString)
            + ' AND UPAGOID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString) + ' AND USEID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('USEID').AsString);
         xUseAbr := DM1.DisplayDescrip('PRV', 'APO101', 'USEABRE', xWhere, 'USEABRE');
         xWhere := 'UPROID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString) + ' AND UPAGOID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString);
         xUpagoAbr := DM1.DisplayDescrip('PRV', 'APO103', 'UPAGOABR', xWhere, 'UPAGOABR');
         xWhere := 'UPROID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
         xUproAbr := DM1.DisplayDescrip('PRV', 'APO102', 'UPROABR', xWhere, 'UPROABR');
         xWhere := 'DPTOID = ' + QuotedStr(Copy(DM1.cdsAsociado.FieldByname('ZIPID').AsString, 1, 2));
         xDptoAbr := DM1.DisplayDescrip('PRV', 'APO158', 'DPTOABR', xWhere, 'DPTOABR');
         xSql := 'SELECT TO_CHAR(SYSDATE, ''YYYYMM'') TRANSAAMM, TO_CHAR(SYSDATE, ''YYYYQ'') TRANSAATRI, TO_CHAR(SYSDATE, ''Q'') TRANSTRIM,'
            + ' DECODE(TO_CHAR(SYSDATE,''Q''),''1'',''1'',''2'',''1'',''3'',''2'',''4'',''2'') TRANSSEM,'
            + ' TO_CHAR(SYSDATE, ''YYYY'')||DECODE(TO_CHAR(SYSDATE,''Q''),''1'',''1'',''2'',''1'',''3'',''2'',''4'',''2'') TRANSAASEM FROM DUAL';
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         xTransAamm := DM1.cdsQry.FieldByName('TRANSAAMM').AsString;
         xTransTrim := DM1.cdsQry.FieldByName('TRANSTRIM').AsString;
         xTransAaTri := DM1.cdsQry.FieldByName('TRANSAATRI').AsString;
         xTransSem := DM1.cdsQry.FieldByName('TRANSSEM').AsString;
         xTransAaSem := DM1.cdsQry.FieldByName('TRANSAASEM').AsString;
         xSql := 'INSERT INTO APO301 (ASOID, TRANSID, USEID, USEABR, UPAGOID, UPAGOABR, UPROID, UPROABR, TRANSNOPE, TRANSFOPE,'
            + ' TRANSANO, TRANSMES, TRANSMTO, TRANSINTID, USUARIO, ASOCODMOD, ASOCODAUX, FORPAGOID, ASOAPENOM, FORPAGOABR, DPTOID,'
            + ' DPTOABR, CIUDID, FREG, HREG, APOSEC, CIAID, PVSLBENNR, CNTANOMM, TIPOCONT, TRANSAAMM, TRANSAATRI, TRANSTRIM, TRANSSEM, TRANSAASEM, TMONID, PVSLFECBE)'
            + ' VALUES ('
            + QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)
            + ', ''APORTE'''
            + ', ' + QuotedStr(DM1.cdsAsociado.FieldByname('USEID').AsString)
            + ', ' + QuotedStr(xUseAbr)
            + ', ' + QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString)
            + ', ' + QuotedStr(xUpagoAbr)
            + ', ' + QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString)
            + ', ' + QuotedStr(xUproAbr)
            + ', ' + QuotedStr(DM1.numeroLiquidacion)
            + ', ' + QuotedStr(DateToStr(date))
            + ', ' + QuotedStr(DM1.cdsNivApo.FieldByName('TRANSANO').AsString)
            + ', ' + QuotedStr(DM1.cdsNivApo.FieldByname('TRANSMES').AsString)
            + ', ' + FloatToStr(DM1.cdsNivApo.FieldByname('MONTO').AsFloat)
            + ', ''APO'''
            + ', ' + QuotedStr(DM1.wUsuario)
            + ', ' + QuotedStr(DM1.cdsAsociado.FieldByname('ASOCODMOD').AsString)
            + ', ' + QuotedStr(DM1.cdsAsociado.FieldByname('ASOCODAUX').AsString)
            + ', ''05'''
            + ', ' + QuotedStr(DM1.cdsAsociado.FieldByname('ASOAPENOMDNI').AsString)
            + ', ''BEN'''
            + ', ' + QuotedStr(Copy(DM1.cdsAsociado.FieldByname('ZIPID').AsString, 1, 2))
            + ', ' + QuotedStr(xDptoAbr)
            + ', ' + QuotedStr(Copy(DM1.cdsAsociado.FieldByname('ZIPID').AsString, 1, 4))
            + ', TO_CHAR(SYSDATE, ''DD/MM/YYYY'')'
            + ', SYSDATE'
            + ', TO_CHAR(SYSDATE, ''YYYYMM'')'
            + ', ''02'' '
            + ', ' + QuotedStr(DM1.numeroLiquidacion)
            + ', TO_CHAR(SYSDATE, ''YYYYMM'')'
            + ', ''APO'' '
            + ', ' + QuotedStr(xTransAamm)
            + ', ' + QuotedStr(xTransAaTri)
            + ', ' + QuotedStr(xTransTrim)
            + ', ' + QuotedStr(xTransSem)
            + ', ' + QuotedStr(xTransAaSem)
            + ', ''N'' '
            + ', ' + QuotedStr(DateToStr(date))
            + ')';
         DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      End;
      DM1.cdsNivApo.Next;
   End;
End;

Procedure TDM1.Grabadevoluciones(xAsoid: String);
Var
   xSql, xfila: String;
   Ide: Integer;
Begin
   Ide := 0;
   DM1.cdsDevApo.First;
   While Not DM1.cdsDevApo.Eof Do
   Begin
      If DM1.cdsDevApo.FieldByName('GRABAR').AsString <> 'N' Then
      Begin
         xSql := 'SELECT ROWID FILA, TRANSMTO FROM APO301 WHERE ASOID = ' + QuotedStr(xAsoid)
            + ' AND TRANSANO = ' + QuotedStr(DM1.cdsDevApo.FieldByName('TRANSANO').AsString) + ' AND TRANSMES = ' + QuotedStr(DM1.cdsDevApo.FieldByName('TRANSMES').AsString) + ' ORDER BY TRANSMTO DESC';
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         DM1.cdsQry.First;
         xfila := DM1.cdsQry.FieldByName('FILA').AsString;
         Ide := Ide + 1;
         xSql := ' UPDATE APO301 SET APOFDEV = ' + QuotedStr('S')
            + ' ,DEVANO = TO_CHAR(SYSDATE, ''YYYY'')'
            + ' ,DEVMES = TO_CHAR(SYSDATE, ''MM'')'
            + ' ,TRANSMTODEV = NVL(TRANSMTODEV,0) + ' + CurrToStr(DM1.cdsDevApo.FieldByName('MONTO').AsFloat)
            + ' ,DEVAPOBEN = ' + CurrToStr(DM1.cdsDevApo.FieldByName('MONTO').AsFloat)
            + ' ,PVSLBENNR   = ' + QuotedStr(DM1.numeroLiquidacion)
            + ' ,PVSLFECBE   = ' + QuotedStr(DateToStr(date))
            + ' WHERE ASOID  = ' + QuotedStr(DM1.cdsDevApo.FieldByName('ASOID').AsString)
            + ' AND TRANSANO = ' + QuotedStr(DM1.cdsDevApo.FieldByName('TRANSANO').AsString)
            + ' AND TRANSMES = ' + QuotedStr(DM1.cdsDevApo.FieldByName('TRANSMES').AsString)
            + ' AND ROWID = ' + QuotedStr(DM1.cdsQry.FieldByName('FILA').AsString);
         DM1.DCOM1.AppServer.EjecutaSQL(xSql);
         xSql := ' INSERT INTO APO305 (DEVID, ITEMID, ASOID, APOANO, APOMES, DEVMOTID, APOMONTO, DEVMTO'
            + ', TRANSNOPE, TRANSFOPE, TIPODEV, USUARIO, FREG, HREG)'
            + ' VALUES (' + QuotedStr(DM1.numeroLiquidacion)
            + ',' + QuotedStr(DM1.StrZero(IntToStr(ide), 3))
            + ',' + QuotedStr(DM1.cdsDevApo.FieldByName('ASOID').AsString)
            + ',' + QuotedStr(DM1.cdsDevApo.FieldByName('TRANSANO').AsString)
            + ',' + QuotedStr(DM1.cdsDevApo.FieldByName('TRANSMES').AsString)
            + ',''10'' '
            + ',' + CurrToStr(DM1.cdsDevApo.FieldByName('MONTO').AsCurrency)
            + ',' + CurrToStr(DM1.cdsDevApo.FieldByName('MONTO').AsCurrency)
            + ',' + QuotedStr(DM1.numeroLiquidacion)
            + ',' + QuotedStr(DateToStr(Date))
            + ', ''2'' '
            + ',' + QuotedStr(DM1.wUsuario)
            + ', TO_CHAR(SYSDATE, ''DD/MM/YYYY'')'
            + ', SYSDATE )';
         DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      End;
      DM1.cdsDevApo.Next;
   End;
End;

//Inicio: DPP_201207_PRE
Procedure TDM1.Grabacreditos(xAsoid: String);
Var
   xSql: String;
Begin
   xSql := 'DECLARE CURSOR Q IS SELECT * FROM DB2ADMIN.COB_POLITICA_CUO_GTT WHERE NVL(PAGO,0) > 0 ORDER BY XID; BEGIN FOR C IN Q LOOP';
// Inicio: DPP_201209_PRE
   xSql := xSql + ' DB2ADMIN.SP_COB_PAGO_CUOTA_V2_PRE(C.ASOID,C.CREDID, C.CUOTA,C.CINTERES, C.PAGO,'+QuotedStr(DM1.numeroLiquidacion)+', TO_DATE(SYSDATE), TO_DATE(SYSDATE),';
// Fin: DPP_201209_PRE
   xSql := xSql + ' '''','''',''05'',''PAGO POR DESCUENTO DE BENEFICIO'',''BEN'','''','''','''','+QuotedStr(DM1.wUsuario)+',''''); END LOOP; END;';
   DM1.DCOM1.AppServer.EjecutaSQL(xSql);
End;
//Fin: DPP_201207_PRE

Function TDM1.RecUltTipoCambio(Var xFecha: String): Double;
Var
   xSql: String;
Begin
   xSql := 'SELECT * FROM TGE107 WHERE FECHA = (SELECT MAX(FECHA) FROM TGE107'
      + ' WHERE FECHA <=' + wRepFuncDate + QuotedStr(Copy(xFecha, 1, 10)) + '))'
      + ' AND TMONID =' + QuotedStr(wTmonExt);
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSQL);
   DM1.cdsQry.Open;
   Result := DM1.cdsQry.FieldByName('TCAMVOV').AsFloat;
   Exit;
End;

Procedure TDM1.Grabaretencion(xAsoid: String);
Var
   xSql: String;
Begin
   xSql := 'UPDATE PVS304 SET PVSLBENNR = ' + QuotedStr(DM1.numeroLiquidacion) + ' WHERE ASOID = ' + QuotedStr(xAsoid)
      + ' AND NVL(ANULADO,''X'') <> ''S''';
   DM1.DCOM1.AppServer.EjecutaSQL(xSql);
   xSql := 'UPDATE PVS305 SET PVSLBENNR = ' + QuotedStr(DM1.numeroLiquidacion) + ' WHERE ASOID = ' + QuotedStr(xAsoid)
      + ' AND NVL(ANULADO,''X'') <> ''S''';
   DM1.DCOM1.AppServer.EjecutaSQL(xSql);
End;

Procedure TDM1.Grabafamiliares(xAsoid: String);
Var
   xSql: String;
Begin
  // Graba datos de los familiares (Tabla APO203)
   xSql := 'UPDATE APO203 SET PVSLBENNR = ' + QuotedStr(DM1.numeroLiquidacion) + ' WHERE ASOID = ' + QuotedStr(xAsoid)
      + ' AND NVL(FAMFLLQ, ''X'') <> ''X'' ';
   DM1.DCOM1.AppServer.EjecutaSQL(xSql);
End;

Procedure TDM1.Grabacartasdesignacion(xAsoid: String);
Var
   xSql: String;
Begin
  // Graba datos de las cartas de designatarios (Tabla PVS302, PVS303)
   xSql := 'UPDATE PVS302 SET PVSLBENNR = ' + QuotedStr(DM1.numeroLiquidacion) + ' WHERE ASOID = ' + QuotedStr(xAsoid)
      + ' AND NVL(ANULADO, ''X'') <> ''S'' ';
   DM1.DCOM1.AppServer.EjecutaSQL(xSql);
   xSql := 'UPDATE PVS303 SET PVSLBENNR = ' + QuotedStr(DM1.numeroLiquidacion) + ' WHERE ASOID = ' + QuotedStr(xAsoid)
      + ' AND NVL(ANULADO, ''X'') <> ''S'' ';
   DM1.DCOM1.AppServer.EjecutaSQL(xSql);
End;

Procedure TDM1.Grabadetalleliquidacion(xAsoid: String);
Var
   item: Integer;
   xCremort, xCreinteres, xCreflat, xIntncob, xValor: Double;
   xSql, xVoucher, xFlgVoucher, xDif: String;
Begin
  // Grabando detalle de la liquidación (PVS307)
   item := 0;
   DM1.cdsCalLiq.First;
   While Not DM1.cdsCalLiq.Eof Do
   Begin
      If DM1.cdsCalLiq.FieldByName('GRABAR').AsString <> 'N' Then
      Begin
         item := item + 1;
         xDif := DM1.cdsCalLiq.FieldByName('TIPDES').AsString;
         //  If DM1.cdsCalLiq.FieldByName('TIPDES').AsString = 'D' Then xDif := 'D' Else xDif := '';
         xSql := 'INSERT INTO PVS307 (CIAID, PVSLBENNR, PVSLTIPBE, PVSLAGRID, PVSLSEC, PVSLCONCE, PVSLMONTO, USUARIO, FREG, HREG, PVSLSALDO, PVSPAGADO, TIPDES)'
            + ' VALUES ( ' + QuotedStr('02')
            + ',' + QuotedStr(DM1.numeroLiquidacion)
            + ',' + QuotedStr(DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString)
            + ',' + QuotedStr('DET')
            + ',' + IntToStr(item)
            + ',' + QuotedStr(DM1.cdsCalLiq.FieldByname('DESC').AsString)
            + ',' + DM1.cdsCalLiq.FieldByName('MONTO').AsString
            + ',' + QuotedStr(DM1.wUsuario)
            + ', TO_CHAR(SYSDATE, ''DD/MM/YYYY''), SYSDATE, ' + DM1.cdsCalLiq.FieldByName('MONTO').AsString
            + ',0.00,' + QuotedStr(xDif) + ')';
         DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      End;
      cdsCalLiq.Next;
   End;
   // Grabando devoluciones de aportes (PVS307)
   DM1.cdsDetDev.First;
   While Not DM1.cdsDetDev.Eof Do
   Begin
      If DM1.cdsDetDev.FieldByName('GRABAR').AsString <> 'N' Then
      Begin
         item := item + 1;
         xSql := 'INSERT INTO PVS307 (CIAID, PVSLBENNR, PVSLTIPBE, PVSLAGRID, PVSLSEC, PVSLCONCE, PVSLMONTO, USUARIO, FREG, HREG, PVSLSALDO, PVSPAGADO)'
            + ' VALUES ( '
            + QuotedStr('02')
            + ',' + QuotedStr(DM1.numeroLiquidacion)
            + ',' + QuotedStr(DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString)
            + ',' + QuotedStr('DEV')
            + ',' + IntToStr(item)
            + ',' + QuotedStr(DM1.cdsDetDev.FieldByname('DESC').AsString)
            + ',' + DM1.cdsDetDev.FieldByName('MONTO').AsString
            + ',' + QuotedStr(DM1.wUsuario)
            + ', TO_CHAR(SYSDATE, ''DD/MM/YYYY''), SYSDATE, ' + DM1.cdsDetDev.FieldByName('MONTO').AsString
            + ',0.00 )';
         DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      End;
      DM1.cdsDetDev.Next;
   End;
   // Grabando descuentos de beneficios (PVS307)
   DM1.cdsDetDes.First;
   While Not DM1.cdsDetDes.Eof Do
   Begin
      If DM1.cdsDetDes.FieldByName('GRABAR').AsString <> 'N' Then
      Begin
      // Controlando si el tipo de descuento es credito
         xCremort := 0;
         xCreinteres := 0;
         xCreflat := 0;
         xIntncob := 0;
         If DM1.cdsDetDes.FieldByName('TIPO').AsString = 'C' Then
         Begin
            DM1.cdsCalCuo.First;
            While Not DM1.cdsCalCuo.Eof Do
            Begin
               If DM1.cdsCalCuo.FieldByName('CREDID').AsString = DM1.cdsDetDes.FieldByName('CREDID').AsString Then
               Begin
                  xCremort := xCremort + DM1.cdsCalCuo.FieldByName('CREAMORT').AsFloat;
                  xCreinteres := xCreinteres + DM1.cdsCalCuo.FieldByName('CREINTERES').AsFloat;
                  xCreflat := xCreflat + DM1.cdsCalCuo.FieldByName('CREFLAT').AsFloat;
                  xIntncob := xIntncob + DM1.cdsCalCuo.FieldByName('INTNCOB').AsFloat;
               End;
               DM1.cdsCalCuo.Next;
            End;
         End;
         item := item + 1;

         xSql := 'INSERT INTO PVS307 (CIAID, PVSLBENNR, PVSLTIPBE, PVSLAGRID, PVSLSEC, PVSLCONCE, PVSLMONTO, USUARIO, FREG, HREG, CREDID, PVSLSALDO, PVSPAGADO, CREAMORT, CREINTERES, CREFLAT, INTNCOB, TIPDES, SALCREANTLIQ)'
            + ' VALUES ( ' + QuotedStr('02')
            + ',' + QuotedStr(DM1.numeroLiquidacion)
            + ',' + QuotedStr(DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString)
            + ',' + QuotedStr('DSC')
            + ',' + IntToStr(item)
            + ',' + QuotedStr(DM1.cdsDetDes.FieldByname('DESC').AsString)
            + ',' + DM1.cdsDetDes.FieldByName('MONTO').AsString
            + ',' + QuotedStr(DM1.wUsuario)
            + ', TO_CHAR(SYSDATE, ''DD/MM/YYYY''), SYSDATE, ' + QuotedStr(DM1.cdsDetDes.FieldByName('CREDID').AsString) + ',' + DM1.cdsDetDes.FieldByName('MONTO').AsString
            + ',0';
         If xCremort = 0 Then
            xSql := xSql + ',NULL'
         Else
            xSql := xSql + ',' + FloatToStr(xCremort);
         If xCreinteres = 0 Then
            xSql := xSql + ',NULL'
         Else
            xSql := xSql + ',' + FloatToStr(xCreinteres);
         If xCreflat = 0 Then
            xSql := xSql + ',NULL'
         Else
            xSql := xSql + ',' + FloatToStr(xCreflat);
         If xIntncob = 0 Then
            xSql := xSql + ',NULL'
         Else
            xSql := xSql + ',' + FloatToStr(xIntncob);
         xSql := xSql + ',' + QuotedStr(DM1.cdsDetDes.FieldByName('TIPO').AsString);
         If Trim(DM1.cdsDetDes.FieldByName('SDOACT').AsString) = '' Then
            xSql := xSql + ', NULL)'
         Else
            xSql := xSql + ',' + DM1.cdsDetDes.FieldByName('SDOACT').AsString + ')';
         DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      End;
      DM1.cdsDetDes.Next;
   End;
   // Inicio: HPC_201802_PRE
   // Se mofica la forma de pago para que acepta en caso de liquidaciones por oficio
   If DM1.cdsExpLiq.FieldByName('FORSOLBEN').AsString = 'S' Then
   Begin
      // Formas de Pago (PVS307)
      DM1.numeroVoucherLib := '';
      DM1.numeroVoucher := '';
      DM1.cdsForPag.First;
      While Not cdsForPag.Eof Do
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
            // Inicio: SPP_201303_PRE
            // + ' DOCIDETUT, FECNACMEN, PORDES, APEPATTUT, APEMATTUT, NOMTUT, APEPATCOB, APEMATCOB, NOMCOB, CODRELCOB)'
            // Inicio: SPP_201403_PRE
            // + ' DOCIDETUT, FECNACMEN, PORDES, APEPATTUT, APEMATTUT, NOMTUT, APEPATCOB, APEMATCOB, NOMCOB, CODRELCOB, DIRDOMCOB, CODZIPCOB, TELFIJCOB, TELMOVCOB)'
            // Inicio: HPC_201703_PRE 
            // Se graba campo email del que cobra
            // + ' DOCIDETUT, FECNACMEN, PORDES, APEPATTUT, APEMATTUT, NOMTUT, APEPATCOB, APEMATCOB, NOMCOB, CODRELCOB, DIRDOMCOB, CODZIPCOB, TELFIJCOB, TELMOVCOB, APECASCOB)'
            + ' DOCIDETUT, FECNACMEN, PORDES, APEPATTUT, APEMATTUT, NOMTUT, APEPATCOB, APEMATCOB, NOMCOB, CODRELCOB, DIRDOMCOB, CODZIPCOB, TELFIJCOB, TELMOVCOB, APECASCOB, EMAILCOB)'
            // Fin: HPC_201703_PRE
            // Fin: SPP_201403_PRE
            // Fin: SPP_201303_PRE
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
            // Inicio: SPP_201303_PRE
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('DIRDOMCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('CODZIPCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('TELFIJCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('TELMOVCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('APECASCOB').AsString) // SPP_201403_PRE
            // Inicio: HPC_201703_PRE
            // Se graba campo email del que cobra
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('EMAILCOB').AsString)
            // Fin: HPC_201703_PRE
            // Fin: SPP_201303_PRE
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
            // Inicio: SPP_201303_PRE
            // + ' APEPATTUT, APEMATTUT, NOMTUT, APEPATCOB, APEMATCOB, NOMCOB, CODRELCOB)'
            // Inicio: SPP_201403_PRE
            //+ ' APEPATTUT, APEMATTUT, NOMTUT, APEPATCOB, APEMATCOB, NOMCOB, CODRELCOB, DIRDOMCOB, CODZIPCOB, TELFIJCOB, TELMOVCOB )'
            // Inicio: HPC_201703_PRE
            // Se actualiza campo email del que cobra
            // + ' APEPATTUT, APEMATTUT, NOMTUT, APEPATCOB, APEMATCOB, NOMCOB, CODRELCOB, DIRDOMCOB, CODZIPCOB, TELFIJCOB, TELMOVCOB, APECASCOB)'
            + ' APEPATTUT, APEMATTUT, NOMTUT, APEPATCOB, APEMATCOB, NOMCOB, CODRELCOB, DIRDOMCOB, CODZIPCOB, TELFIJCOB, TELMOVCOB, APECASCOB, EMAILCOB)'
            // Fin: HPC_201703_PRE
            // Fin: SPP_201403_PRE
            // Fin: SPP_201303_PRE
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
            // Inicio: SPP_201303_PRE
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('DIRDOMCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('CODZIPCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('TELFIJCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('TELMOVCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('APECASCOB').AsString) // SPP_201403_PRE
            // Inicio: HPC_201703_PRE
            // Se actualiza campo email del que cobra
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('EMAILCOB').AsString)
            // Fin: HPC_201703_PRE
            // Fin: SPP_201303_PRE
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
   // Fin: HPC_201802_PRE
   End;
  // Formas de Pago Retenciones Judiciales
   DM1.numeroVoucherLib := '';
   DM1.numeroVoucher := '';
   DM1.cdsRetJud.First;
   While Not DM1.cdsRetJud.Eof Do
   Begin
      item := item + 1;
    // Tomando voucher para las libretas de ahorros y otras formas de pago
      If (DM1.cdsRetJud.FieldByName('FORPAGID').AsString = '11') And (DM1.numeroVoucherLib = '') Then DM1.numeroVoucherLib := DM1.Gennumvou;
      If (DM1.cdsRetJud.FieldByName('FORPAGID').AsString <> '11') Then DM1.numeroVoucher := DM1.Gennumvou;
      If DM1.cdsRetJud.FieldByName('FORPAGID').AsString = '11' Then
         xVoucher := DM1.numeroVoucherLib
      Else
         xVoucher := DM1.numeroVoucher;
      If DM1.cdsRetJud.FieldByName('PORCENTAJE').AsFloat = 0 Then
         xValor := 0
      Else
         xValor := DM1.cdsRetJud.FieldByName('PORCENTAJE').AsFloat;
      xSql := 'INSERT INTO PVS307 (CIAID, PVSLBENNR, PVSLTIPBE,PVSLAGRID,PVSLSEC,PVSLCONCE,PVSLMONTO,USUARIO,FREG,'
         + ' HREG,PVSLNVOU,BANCOID,FORPAGOID, PVSLSALDO, PVSNOMBRE,FLGVOUCHER, AGENBCOID, PVSLDNIBEN, PVSLNCTA, PORDES)'
         + ' VALUES (' + QuotedStr('02') + ',' + QuotedStr(DM1.numeroLiquidacion) + ',' + QuotedStr(DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString)
         + ',' + QuotedStr('RET') + ',' + IntToStr(item) + ',' + QuotedStr(DM1.cdsRetJud.FieldByName('DESC').AsString) + ',' + FloatToStr(DM1.cdsRetJud.FieldByName('MONTO').AsFloat)
         + ',' + QuotedStr(DM1.wUsuario) + ', TO_CHAR(SYSDATE, ''DD/MM/YYYY''), SYSDATE, ' + QuotedStr(xVoucher) + ',' + QuotedStr(DM1.cdsRetJud.FieldByName('BANCOID').AsString)
         + ',' + QuotedStr(DM1.cdsRetJud.FieldByName('FORPAGID').AsString)
         + ',' + FloatToStr(DM1.cdsRetJud.FieldByName('MONTO').AsFloat) + ',' + QuotedStr(DM1.cdsRetJud.FieldByName('PVSNOMBRE').AsString)
         + ',' + QuotedStr('S') + ',' + QuotedStr(DM1.cdsRetJud.FieldByName('AGENBCOID').AsString) + ',' + QuotedStr(DM1.cdsRetJud.FieldByName('PVSLDNIBEN').AsString) + ',' + QuotedStr(DM1.cdsRetJud.FieldByName('PVSLNCTA').AsString) + ',' + FloatToStr(xValor) + ')';
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      DM1.cdsRetJud.Next;
      item := item + 1;
      If DM1.cdsRetJud.FieldByName('PORCENTAJE').AsFloat = 0 Then
         xValor := 0
      Else
         xValor := DM1.cdsRetJud.FieldByName('PORCENTAJE').AsFloat;
      xSql := 'INSERT INTO PVS307 (CIAID, PVSLBENNR, PVSLTIPBE,PVSLAGRID,PVSLSEC,PVSLCONCE,PVSLMONTO,USUARIO,FREG,'
         + ' HREG,PVSLNVOU,BANCOID,FORPAGOID, PVSLSALDO, PVSNOMBRE,FLGVOUCHER, AGENBCOID, PVSLDNIBEN, PVSLNCTA, PORDES)'
         + ' VALUES (' + QuotedStr('02') + ',' + QuotedStr(DM1.numeroLiquidacion) + ',' + QuotedStr(DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString)
         + ',' + QuotedStr('RET') + ',' + IntToStr(item) + ',' + QuotedStr(DM1.cdsRetJud.FieldByName('DESC').AsString) + ',' + FloatToStr(DM1.cdsRetJud.FieldByName('MONTO').AsFloat)
         + ',' + QuotedStr(DM1.wUsuario) + ', TO_CHAR(SYSDATE, ''DD/MM/YYYY''), SYSDATE, ' + QuotedStr(xVoucher) + ',' + QuotedStr(DM1.cdsRetJud.FieldByName('BANCOID').AsString)
         + ',' + QuotedStr(DM1.cdsRetJud.FieldByName('FORPAGID').AsString)
         + ',' + FloatToStr(DM1.cdsRetJud.FieldByName('MONTO').AsFloat) + ',' + QuotedStr(DM1.cdsRetJud.FieldByName('PVSNOMBRE').AsString)
         + ',' + QuotedStr('N') + ',' + QuotedStr(DM1.cdsRetJud.FieldByName('AGENBCOID').AsString) + ',' + QuotedStr(DM1.cdsRetJud.FieldByName('PVSLDNIBEN').AsString) + ',' + QuotedStr(DM1.cdsRetJud.FieldByName('PVSLNCTA').AsString) + ',' + FloatToStr(xValor) + ')';
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
    // Grabando en tabla de cheques los que son para pagar por cheques
      If (DM1.cdsRetJud.FieldByName('MONTO').AsFloat > 0) And (DM1.cdsRetJud.FieldByName('FORPAGID').AsString = '01') Then
      Begin
         If (DM1.cdsRetJud.FieldByName('MONTO').AsFloat > 0) And (DM1.cdsRetJud.FieldByName('FORPAGID').AsString = '01') Then
         Begin
            xSql := 'INSERT INTO PVS_CHE_GEN_CAB(ASOID, PVSLBENNR, APENOMBEN, DOCIDEBEN, MONCHE, ESTCHE, PORDES, PVSNVOU, PVSLTIPBE, PVSLFECBE, FLGRET, BANCOID)'
               + ' VALUES (' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString) + ',' + QuotedStr(DM1.numeroLiquidacion) + ',' + QuotedStr(DM1.cdsRetJud.FieldByName('PVSNOMBRE').AsString)
               + ',' + QuotedStr(DM1.cdsRetJud.FieldByName('PVSLDNIBEN').AsString) + ',' + FloatToStr(DM1.cdsRetJud.FieldByName('MONTO').AsFloat) + ',' + QuotedStr('01') + ',' + FloatToStr(xValor)
               + ',' + QuotedStr(DM1.numeroVoucher) + ',' + QuotedStr(DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString) + ', TO_CHAR(SYSDATE, ''DD/MM/YYYY''),''S'',' + QuotedStr(DM1.cdsRetJud.FieldByName('BANCOID').AsString) + ')';
            DM1.DCOM1.AppServer.EjecutaSQL(xSql);
         End;
      End;
      DM1.cdsRetJud.Next;
   End;
  // Insertando las observaciones
   DM1.cdsObs.First;
   While Not DM1.cdsObs.Eof Do
   Begin
      If DM1.cdsObs.FieldByName('GRABAR').AsString <> 'N' Then
      Begin
         item := item + 1;
         xSql := 'INSERT INTO PVS307 (CIAID, PVSLBENNR,PVSLTIPBE,PVSLAGRID,PVSLSEC,PVSLCONCE,PVSLMONTO,USUARIO,FREG,HREG,PVSLSALDO)'
            + ' VALUES (' + QuotedStr('02') + ',' + QuotedStr(DM1.numeroLiquidacion) + ',' + QuotedStr(DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString)
            + ',' + QuotedStr('OBS') + ',' + IntToStr(item) + ',' + QuotedStr(DM1.cdsObs.FieldByName('DESC').AsString) + ',' + FloatToStr(DM1.cdsObs.FieldByName('MONTO').AsFloat)
            + ',' + QuotedStr(DM1.wUsuario) + ', TO_CHAR(SYSDATE, ''DD/MM/YYYY''), SYSDATE ,' + FloatToStr(DM1.cdsObs.FieldByName('MONTO').AsFloat) + ')';
         DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      End;
      DM1.cdsObs.Next;
   End;
End;

Function TDM1.Gennumvou: String;
Var
   xSql, xAno, xNumVou: String;
Begin
   xAno := Copy(DateToStr(date), 7, 4);
   xSql := 'SELECT LPAD(VARIOS+1, 7, ''0'') VOUCHER FROM CRE206 WHERE CREAREA = ''PRE'' AND TIPO = ''V'' AND CORREANO  = ' + QuotedStr(xAno);
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   xNumVou := DM1.cdsQry.FieldByname('VOUCHER').AsString;
   xSql := 'UPDATE CRE206 SET VARIOS=LPAD(VARIOS+1, 7, ''0'') WHERE CREAREA = ''PRE'''
      + ' AND TIPO = ''V'' AND CORREANO = ' + QuotedStr(xAno);
   DM1.DCOM1.AppServer.EjecutaSQL(xSql);
   Result := xNumVou;
End;

Procedure TDM1.Grabacabeceraliquidacion(xAsoid: String);
Var
   xSql, xEstLiq, xTipDoc, xNumDoc: String;
Begin


   If DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString = '01' Then xEstLiq := '02';
   If DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString = '02' Then xEstLiq := '05';
   If DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString = '05' Then xEstLiq := '06';

   If (DM1.cdsAsociado.FieldByName('TIPDOCCOD').AsString = '') Or (DM1.cdsAsociado.FieldByName('ASODOCNUM').AsString = '') Then
   Begin
      xTipDoc := '10';
      xNumDoc := DM1.cdsAsociado.FieldByName('ASODNI').AsString;
   End
   Else
   Begin
      xTipDoc := DM1.cdsAsociado.FieldByName('TIPDOCCOD').AsString;
      xNumDoc := DM1.cdsAsociado.FieldByName('ASODOCNUM').AsString;
   End;

   xSql := 'INSERT INTO PVS306 (CIAID, PVSLBENNR, PVSLTIPBE,PVSLFECBE, ASOID, ASOCODMOD, ASOCODAUX,'
      + ' PVSLULAP,PVSLTAAP,PVSLESTAD,PVSEXPNRO,USUARIO,FREG,HREG,PVSESTLIQ,CNTANOMM,TIPOCONT, PVSCOBASO,'
      + ' ASOAPENOMDNI,TIPDOCCOD,ASODOCNUM,USEID,UPAGOID,UPROID, ASODIR, ZIPID, ASODESLAB, ASODIRLAB, ASODSTLABID,'
      // Inicio: SPP_201307_PRE
      // Se añade campo de Tipo de Liquidación por retiro.
      // + ' ASORESNOM,ASOFRESNOM,ASORESCESE,ASOFRESCESE, ASODNI, ASOTELF1 )'
      // Inicio: HPC_201506_PRE
      // Se añaden campos AUTDESAPO, FECAUTDESAPO
      // + ' ASORESNOM,ASOFRESNOM,ASORESCESE,ASOFRESCESE, ASODNI, ASOTELF1, PVSTIPRET)'
      // Inicio: HPC_201802_PRE
      // Se añade campo foma de solicitude del beneficio
      // + ' ASORESNOM,ASOFRESNOM,ASORESCESE,ASOFRESCESE, ASODNI, ASOTELF1, PVSTIPRET, AUTDESAPO, FECAUTDESAPO)'
      + ' ASORESNOM,ASOFRESNOM,ASORESCESE,ASOFRESCESE, ASODNI, ASOTELF1, PVSTIPRET, AUTDESAPO, FECAUTDESAPO, FORSOLBEN)'
      // Fin: HPC_201802_PRE
      // Fin: HPC_201506_PRE
      // Fin: SPP_201307_PRE
      + ' VALUES (''02'', ' + QuotedStr(DM1.numeroLiquidacion) + ',' + QuotedStr(DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString)
      + ', TO_CHAR(SYSDATE, ''DD/MM/YYYY''),' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString) + ',' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOCODMOD').AsString)
      + ',' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOCODAUX').AsString) + ',' + QuotedStr(DM1.cdsExpLiq.FieldByName('PVSULTAPO').AsString) + ',' + QuotedStr(DM1.tiempoTranscurrido(DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsDateTime, DM1.cdsExpLiq.FieldByName('ASOFRESNOM').AsDateTime, '0'))
      + ', ''01'', ' + QuotedStr(DM1.cdsExpLiq.FieldByName('PVSEXPNRO').AsString) + ',' + QuotedStr(DM1.wUsuario) + ', TO_CHAR(SYSDATE, ''DD/MM/YYYY''), SYSDATE'
      + ', ' + QuotedStr(xEstLiq) + ', ' + QuotedStr(DM1.cntanomm) + ',' + QuotedStr('BEN') + ',' + QuotedStr(DM1.cdsExpLiq.FieldByName('PVSCOBASO').AsString)
      + ', ' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString) + ',' + QuotedStr(xTipDoc) + ',' + QuotedStr(xNumDoc)
      + ', ' + QuotedStr(DM1.cdsAsociado.FieldByName('USEID').AsString) + ', ' + QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString) + ', ' + QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString)
      + ',' + QuotedStr(DM1.cdsAsociado.FieldByName('ASODIR').AsString) + ',' + QuotedStr(DM1.cdsAsociado.FieldByName('ZIPID').AsString) + ',' + QuotedStr(DM1.cdsAsociado.FieldByName('ASODESLAB').AsString)
      + ',' + QuotedStr(DM1.cdsAsociado.FieldByName('ASODIRLAB').AsString) + ',' + QuotedStr(DM1.cdsAsociado.FieldByName('ASODSTLABID').AsString)
      + ',' + QuotedStr(DM1.cdsExpLiq.FieldByName('ASORESNOM').AsString) + ',' + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOFRESNOM').AsString)
      + ',' + QuotedStr(DM1.cdsExpLiq.FieldByName('ASORESCESE').AsString) + ',' + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsString)
      + ',' + QuotedStr(DM1.cdsAsociado.FieldByName('ASODNI').AsString)
      // Inicio: SPP_201307_PRE
      // Se actualiza campo por tipo de liquidación por retiro.
      // + ',' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOTELF1').AsString) + ')';
      // Inicio: HPC_201506_PRE
      // Se añaden campos AUTDESAPO, FECAUTDESAPO
      // +','+QuotedStr(DM1.cdsAsociado.FieldByName('ASOTELF1').AsString)+','+QuotedStr(DM1.cdsExpLiq.FieldByName('PVSTIPRET').AsString)+')';
      +','+QuotedStr(DM1.cdsAsociado.FieldByName('ASOTELF1').AsString)+','+QuotedStr(DM1.cdsExpLiq.FieldByName('PVSTIPRET').AsString)
      +','+QuotedStr(DM1.cdsAsociado.FieldByName('AUTDESAPO').AsString)
      // Inicio: HPC_201802_PRE
      // Se añade la grabación del campo FORSOLBEN
      +', (SELECT FECAUTDESAPO FROM APO201 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+')'
      +','+QuotedStr(DM1.cdsExpLiq.FieldByName('FORSOLBEN').AsString)+')';
      // Fin: HPC_201802_PRE
      // Fin: HPC_201506_PRE
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      // Fin: SPP_201307_PRE
   // Inicio: DPP_201209_PRE
   // Inicio: HPC_201506_PRE
   // Se controla que totalice correctamente la grabación de monto total de liquidación
   // en la cabecera de beneficios
   // xSql := 'UPDATE PVS306 A SET (A.AUTDESAPO, A.FECAUTDESAPO)= (SELECT B.AUTDESAPO, B.FECAUTDESAPO FROM APO201 B WHERE A.ASOID = B.ASOID) WHERE A.ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString);
   // DM1.DCOM1.AppServer.EjecutaSQL(xSql);
   // Fin: DPP_201209_PRE
   // xSql := 'UPDATE PVS306 A SET A.MONLIQBEN = (SELECT SUM(NVL(B.PVSLMONTO,0)) FROM PVS307 B WHERE A.PVSLBENNR = B.PVSLBENNR'
   //  + ' AND B.PVSLAGRID = ''DET'') WHERE A.PVSLBENNR = ' + QuotedStr(DM1.numeroLiquidacion);
   // xSql := 'UPDATE PVS306 A SET A.MONLIQBEN = (SELECT SUM(NVL(B.PVSLMONTO,0)) FROM PVS307 B WHERE A.PVSLBENNR = B.PVSLBENNR'
   //   + ' AND B.PVSLAGRID = ''DET'' AND B.TIPDES IN (''FA'',''FI'',''FB'')) WHERE A.PVSLBENNR = ' + QuotedStr(DM1.numeroLiquidacion);
   // DM1.DCOM1.AppServer.EjecutaSQL(xSql);
   // xSql := 'UPDATE PVS306 A SET A.MONDES = (SELECT SUM(NVL(B.PVSLMONTO,0)) FROM PVS307 B WHERE A.PVSLBENNR = B.PVSLBENNR'
   //    + ' AND B.PVSLAGRID = ''DSC'')  WHERE A.PVSLBENNR = ' + QuotedStr(DM1.numeroLiquidacion);
   // DM1.DCOM1.AppServer.EjecutaSQL(xSql);
   // xSql := 'UPDATE PVS306 A SET A.MONDEV = (SELECT SUM(NVL(B.PVSLMONTO,0)) FROM PVS307 B WHERE A.PVSLBENNR = B.PVSLBENNR'
   //    + ' AND B.PVSLAGRID = ''DEV'') WHERE A.PVSLBENNR = ' + QuotedStr(DM1.numeroLiquidacion);
   // DM1.DCOM1.AppServer.EjecutaSQL(xSql);
   // xSql := ' UPDATE PVS306 A SET A.MONPAG = (SELECT SUM(NVL(B.PVSLMONTO,0)) FROM PVS307 B WHERE A.PVSLBENNR = B.PVSLBENNR'
   //    + ' AND B.PVSLAGRID IN (''FPG'', ''RET'')) WHERE A.PVSLBENNR = ' + QuotedStr(DM1.numeroLiquidacion);
   // DM1.DCOM1.AppServer.EjecutaSQL(xSql);
   // Fin: HPC_201506_PRE
End;

Procedure TDM1.Grabasolicitudliquidacion(xAsoid: String);
Var
   xSql, xforliq: String;
Begin

   If DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString = '01' Then xforliq := '02';
   If DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString = '02' Then xforliq := '02';
   If DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString = '05' Then xforliq := '06';

   xSql := 'UPDATE PVS301 SET PVSLBENNR = ' + QuotedStr(DM1.numeroLiquidacion)
      + ', PVSLFECBE = ' + QuotedStr(DateToStr(DM1.FechaSys))
      + ', PVSESTADO = ' + QuotedStr(xforliq)
      + ' WHERE ASOID = ' + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString)
      + ' AND PVSEXPNRO = ' + QuotedStr(DM1.cdsExpLiq.FieldByName('PVSEXPNRO').AsString);
   DM1.DCOM1.AppServer.EjecutaSQL(xSql);
End;

Function TDM1.Gennumexp: String;
Var
   xSql, xAno, xNumExp: String;
Begin
   xAno := Copy(DateToStr(date), 7, 4);
   xSql := 'SELECT CORREANO||LPAD(VARIOS+1, 7, ''0'') PVSLBENNR FROM CRE206 WHERE CREAREA = ''PRE'' AND TIPO = ''E'' AND CORREANO  = ' + QuotedStr(xAno);
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   xNumExp := DM1.cdsQry.FieldByname('PVSLBENNR').AsString;
   xSql := 'UPDATE CRE206 SET VARIOS=LPAD(VARIOS+1, 7, ''0'') WHERE CREAREA = ''PRE'''
      + ' AND TIPO = ''E'' AND CORREANO = ' + QuotedStr(xAno);
   DM1.DCOM1.AppServer.EjecutaSQL(xSql);
   Result := xNumExp;
End;

Procedure TDM1.Registro_Aud(xAsoId, xSecuencia, xCodReg: String);
Var
   xSql: String;
Begin
// inicio HPC_200906_PRE
// Memorándum 063-2009-DM-EPS
{
   xSql := 'INSERT INTO APO201_LOG(ASOID, ASOCODMOD, ASOCODAUX, ASOCODPAGO, ASOAPEPAT, ASOAPEMAT, ASONOMBRES, ASOAPENOM, USEID, UPROID, ' +
      'UPAGOID, ASORESNOM, ASOFRESNOM, RESID, REGPENID, ASOSITID, ASOFACT, ASOTIPID, VIAID, VIANOMBRE, ASONUMDIR, ASOFDPTO, ASODPTO, ' +
      'ZONAID, ZONANOMB, UBIGEOID, DPTOID, PAISID, REFDOM, ASOFECNAC, ASOTELF1, ASOTELF2, TIPDOCCOD, ASODOCNUM, ASOLIBMIL, ASORUC, ESTCIVID, ' +
      'ASOSEXO, ASOEMAIL, BANCOID, ASONCTA, SITCTA, ASODNI, GRAACID, GRAINSID, PROFID, ASOFMOV, ASOFLUGING, ASODIR, USUARIO, HREG, FREG, ASOLUGEST, ' +
      'FECTEREST, TIEMPOEST, ASOLNACID, ASORESCESE, ASOFRESCESE, FGARANTE, ZIPID, CIUDID, ARCHIVOFTP, CIAID, FLAGVAR, ASOAPNCRE, FLGFSOL, ESTCLF, ' +
      'OBSERVA, USR_CREA, FEC_CREA, USR_BEN, FEC_BEN, CTASER, CARGO, VARIASCUOT, CRENCUOTA, NFUSION, IDIMAGE, FSINLIQ, ASODESCOL, ASODIRCOL, ASOZIPCOL, ' +
      'ASOAPEPATDNI, ASOAPEMATDNI, ASONOMDNI, ASOAPENOMDNI, ASODESLAB, ASODIRLAB, ASODPTLABID, ASOPRVLABID, ASODSTLABID, ASOTELLAB, DPTNACID, PRVNACID, ' +
      'DSTNACID, VIALABID, ZONALABID, FECACT, INDICADOR, CCOSID, PASSWORD, CODAFP, USUARIO_AUD, REGISTRO_AUD, SECUENCIA, CODREG, MODULOID) SELECT ASOID, ASOCODMOD, ASOCODAUX, ASOCODPAGO, ASOAPEPAT, ' +
      'ASOAPEMAT, ASONOMBRES, ASOAPENOM, USEID, UPROID, UPAGOID, ASORESNOM, ASOFRESNOM, RESID, REGPENID, ASOSITID, ASOFACT, ASOTIPID, VIAID, VIANOMBRE, ' +
      'ASONUMDIR, ASOFDPTO, ASODPTO, ZONAID, ZONANOMB, UBIGEOID, DPTOID, PAISID, REFDOM, ASOFECNAC, ASOTELF1, ASOTELF2, TIPDOCCOD, ASODOCNUM, ASOLIBMIL, ' +
      'ASORUC, ESTCIVID, ASOSEXO, ASOEMAIL, BANCOID, ASONCTA, SITCTA, ASODNI, GRAACID, GRAINSID, PROFID, ASOFMOV, ASOFLUGING, ASODIR, USUARIO, HREG, FREG, ' +
      'ASOLUGEST, FECTEREST, TIEMPOEST, ASOLNACID, ASORESCESE, ASOFRESCESE, FGARANTE, ZIPID, CIUDID, ARCHIVOFTP, CIAID, FLAGVAR, ASOAPNCRE, FLGFSOL, ESTCLF, ' +
      'OBSERVA, USR_CREA, FEC_CREA, USR_BEN, FEC_BEN, CTASER, CARGO, VARIASCUOT, CRENCUOTA, NFUSION, IDIMAGE, FSINLIQ, ASODESCOL, ASODIRCOL, ASOZIPCOL, ASOAPEPATDNI, ' +
      'ASOAPEMATDNI, ASONOMDNI, ASOAPENOMDNI, ASODESLAB, ASODIRLAB, ASODPTLABID, ASOPRVLABID, ASODSTLABID, ASOTELLAB, DPTNACID, PRVNACID, DSTNACID, VIALABID, ZONALABID, ' +
      'FECACT, INDICADOR, CCOSID, PASSWORD, CODAFP,' + QuotedStr(DM1.wUsuario) + ',SYSDATE,' + QuotedStr(xSecuencia) + ',' + QuotedStr(xCodReg) + ',''BEN'' FROM APO201 WHERE ASOID=' + QuotedStr(xAsoId);
}
   xSql := 'INSERT INTO APO201_LOG( '
          +'       ASOID, ASOCODMOD, ASOCODAUX, ASOCODPAGO, ASOAPEPAT, ASOAPEMAT, ASONOMBRES, ASOAPENOM, '
          +'       USEID, UPROID, UPAGOID, ASORESNOM, ASOFRESNOM, RESID, REGPENID, ASOSITID, ASOFACT, ASOTIPID, '
          +'       VIAID, VIANOMBRE, ASONUMDIR, ASOFDPTO, ASODPTO, ZONAID, ZONANOMB, UBIGEOID, DPTOID, PAISID, REFDOM, '
          +'       ASOFECNAC, ASOTELF1, ASOTELF2, TIPDOCCOD, ASODOCNUM, ASOLIBMIL, ASORUC, ESTCIVID, ASOSEXO, ASOEMAIL, '
          +'       BANCOID, ASONCTA, SITCTA, ASODNI, GRAACID, GRAINSID, PROFID, ASOFMOV, ASOFLUGING, ASODIR, '
          +'       USUARIO, HREG, FREG, ASOLUGEST, FECTEREST, TIEMPOEST, ASOLNACID, ASORESCESE, ASOFRESCESE, '
          +'       FGARANTE, ZIPID, CIUDID, ARCHIVOFTP, CIAID, FLAGVAR, ASOAPNCRE, '
          +'       FLGFSOL, ESTCLF, OBSERVA, USR_CREA, FEC_CREA, USR_BEN, FEC_BEN, CTASER, CARGO, '
          +'       VARIASCUOT, CRENCUOTA, NFUSION, IDIMAGE, FSINLIQ, '
          +'       ASODESCOL, ASODIRCOL, ASOZIPCOL, '
          +'       ASOAPEPATDNI, ASOAPEMATDNI, ASONOMDNI, ASOAPENOMDNI, '
          +'       ASODESLAB,ASODIRLAB,ASODPTLABID, ASOPRVLABID, ASODSTLABID, ASOTELLAB, '
          +'       DPTNACID, PRVNACID,DSTNACID,VIALABID,ZONALABID, '
          +'       FECACT, INDICADOR, CCOSID, PASSWORD, CODAFP, USUARIO_AUD, REGISTRO_AUD, SECUENCIA, '
          +'       CODREG, MODULOID, FALLECIDO, TIPO_FALL_ID) '
          +'SELECT ASOID, ASOCODMOD, ASOCODAUX, ASOCODPAGO, ASOAPEPAT, ASOAPEMAT, ASONOMBRES, ASOAPENOM, '
          +'       USEID, UPROID, UPAGOID, ASORESNOM, ASOFRESNOM, RESID, REGPENID, ASOSITID, ASOFACT, ASOTIPID, '
          +'       VIAID, VIANOMBRE, ASONUMDIR, ASOFDPTO, ASODPTO, ZONAID, ZONANOMB, UBIGEOID, DPTOID, PAISID, REFDOM, '
          +'       ASOFECNAC, ASOTELF1, ASOTELF2, TIPDOCCOD, ASODOCNUM, ASOLIBMIL, ASORUC, ESTCIVID, ASOSEXO, ASOEMAIL, '
          +'       BANCOID, ASONCTA, SITCTA, ASODNI, GRAACID, GRAINSID, PROFID, ASOFMOV, ASOFLUGING, ASODIR, '
          +'       USUARIO, HREG, FREG, ASOLUGEST, FECTEREST, TIEMPOEST, ASOLNACID, ASORESCESE, ASOFRESCESE, '
          +'       FGARANTE, ZIPID, CIUDID, ARCHIVOFTP, CIAID, FLAGVAR, ASOAPNCRE, '
          +'       FLGFSOL, ESTCLF, OBSERVA, USR_CREA, FEC_CREA, USR_BEN, FEC_BEN, CTASER, CARGO, '
          +'       VARIASCUOT, CRENCUOTA, NFUSION, IDIMAGE,FSINLIQ, '
          +'       ASODESCOL, ASODIRCOL, ASOZIPCOL, '
          +'       ASOAPEPATDNI, ASOAPEMATDNI, ASONOMDNI, ASOAPENOMDNI, '
          +'       ASODESLAB, ASODIRLAB, ASODPTLABID, ASOPRVLABID, ASODSTLABID, ASOTELLAB, '
          +'       DPTNACID, PRVNACID, DSTNACID, VIALABID, ZONALABID, '
          +'       FECACT, INDICADOR, CCOSID, PASSWORD, CODAFP,'
          +          QuotedStr(DM1.wUsuario) + ',SYSDATE,' + QuotedStr(xSecuencia) + ','
          +          QuotedStr(xCodReg)+ ',''BEN'', FALLECIDO, TIPO_FALL_ID '
          +'FROM APO201 '
          +'WHERE ASOID=' + QuotedStr(xAsoId);
// fin HPC_200906_PRE
   DM1.DCOM1.AppServer.EjecutaSql(xSQL);
End;

Function TDM1.CodReg: String;
Var
   xSql, xResabn: String;
   xCorabn: Integer;
Begin
   xSql := 'SELECT CREAREA,CORREANO,TIPO,ASOID FROM CRE206 WHERE CORREANO=' + QuotedStr(Copy(DateToStr(DM1.FechaSys), 7, 4)) + ' AND CREAREA=''ASO'' ';
   DM1.cdsCuotas.Close;
   DM1.cdsCuotas.DataRequest(xSQL);
   DM1.cdsCuotas.Open;
   If DM1.cdsCuotas.RecordCount = 1 Then
   Begin
      xCorabn := StrToInt(DM1.cdsCuotas.fieldbyname('ASOID').AsString) + 1;
      xResabn := Format('%.10d', [xCorAbn]);
      DM1.cdsCuotas.Edit;
      DM1.cdsCuotas.fieldbyname('ASOID').AsString := xResAbn;
      DM1.cdsCuotas.ApplyUpdates(0);
      Result := xResabn;
   End;
   DM1.cdsCuotas.Close;
End;

Function TDM1.RecuperaDatos(xTabla, xCampo, xVariable, xRecupera: String): String;
Var
   xSQL: String;
Begin
   xSQL := 'SELECT * FROM ' + xTabla + ' WHERE ' + xCampo + '=' + QuotedStr(Trim(xVariable));
   cdsInt.Close;
   cdsInt.DataRequest(xSQL);
   cdsInt.Open;
   If cdsInt.RecordCount = 1 Then
      Result := cdsInt.fieldbyname(xRecupera).AsString
   Else
      Result := '';
   cdsInt.Close;
End;

Function TDM1.SaldoActual(xAsoId, xCreDid, xTip: String): Currency;
Var
   xSaldo: Currency;
   xSql: String;
Begin
   xSaldo := 0;
   cdsCuentas.Close;
   If xTip = '0' Then
      xSql := 'SELECT ASOID,CREDID,CREMTOCOB,CREMTO FROM CRE302 Where ASOID =' + QuotedStr(Trim(xAsoId)) + ' And CREDID=' + QuotedStr(Trim(xCreDid)) + ' And CREESTID IN (''02'',''11'',''27'',''14'', ''31'')'
   Else
      xSql := 'SELECT ASOID,CREDID,CREMTOCOB,CREMTO FROM CRE302 Where ASOID =' + QuotedStr(Trim(xAsoId)) + ' And CREDID=' + QuotedStr(Trim(xCreDid)) + ' And CREESTID IN (''02'',''11'',''27'', ''31'') ';
   cdsCuentas.DataRequest(xSql);
   cdsCuentas.Open;
   If cdsCuentas.RecordCount > 0 Then
   Begin
      cdsCuentas.First;
      While Not cdsCuentas.Eof Do
      Begin
         xSaldo := xSaldo + (cdsCuentas.fieldbyname('CREMTO').AsFloat - cdsCuentas.fieldbyname('CREMTOCOB').AsFloat);
         cdsCuentas.Next;
      End;
   End;
   Result := xSaldo;
   cdsCuentas.Close;
End;

Function TDM1.calculamontodecese(xasofresnom, xasofresces, xtipben: String): Double;
Var
   tmes, xSql: String;
Begin
   DM1.liquidacionbeneficio := 0;
   DM1.aportesCtaInd := 0;
   DM1.interesesCtaInd := 0;
   DM1.bonusCtaInd := 0;
   DM1.calculoA1996CtaInd := 0;
   DM1.montoTabRet := 0;
   DM1.montoTabCap := 0;
   DM1.montoTabSep := 0;
   DM1.montoUIT := 0;
   DM1.montoTabInv := 0;
   DM1.montoDiferencial := 0;
   DM1.cantidadUIT := 0;
   DM1.tTiempoTranscurrido := DM1.tiempoTranscurrido(StrToDate(xasofresces), StrToDate(xasofresnom), '0');
   If (DM1.mesesTranscurridos > 6) Or ((DM1.mesesTranscurridos = 6) And (DM1.diasTranscurridos > 15)) Then
      DM1.anoServicio := DM1.anosTranscurridos + 1
   Else
      DM1.anoServicio := DM1.anosTranscurridos;

   If DM1.anoServicio > 30 Then DM1.anoServicio := 30;
  // Hallando la edad en caso que sea por invalidez
   DM1.edadInvalidez := Int(YearSpan(StrToDate(xasofresces), DM1.cdsAsociado.FieldByName('ASOFECNAC').AsDateTime));
   If DM1.edadInvalidez < 31 Then DM1.edadInvalidez := 31;
   If DM1.edadInvalidez > 65 Then DM1.edadInvalidez := 65;
  // liquidacion por retiro
   If xtipben = '01' Then
   Begin
    // tabla de retiro
      tmes := 'PVSRMM' + DM1.StrZero(CurrToStr(DM1.mesFinal), 2);
      xSql := 'SELECT ' + tmes + ' VALOR FROM PVS104 WHERE PVSRANO = ' + QuotedStr(CurrToStr(DM1.anoFinal)) + ' AND PVSRSERV = ' + QuotedStr(DM1.StrZero(CurrToStr(DM1.anoServicio), 2));
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      DM1.MontoTabRet := DM1.cdsQry.FieldByName('VALOR').AsCurrency;
   End;
  // Liquidacion por fallecimiento
   If xtipben = '02' Then
   Begin
      If DM1.anoFinal < 1997 Then
    // tabla de sepelio + capital de deudos
      Begin
      // tabla de sepelio
         tmes := 'PVSSMM' + DM1.StrZero(CurrToStr(DM1.mesFinal), 2);
         xSql := 'SELECT ' + tmes + ' VALOR FROM PVS106 WHERE PVSSANO = ' + QuotedStr(CurrToStr(DM1.anoFinal)) + ' AND PVSSSERV = ' + QuotedStr(DM1.StrZero(CurrToStr(DM1.anoServicio), 2));
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         DM1.MontoTabSep := DM1.cdsQry.FieldByName('VALOR').AsCurrency;
      // tabla de capital de deudos
         tmes := 'PVSCMM' + DM1.StrZero(CurrToStr(DM1.mesFinal), 2);
         xSql := 'SELECT ' + tmes + ' VALOR FROM PVS107 WHERE PVSCANO = ' + QuotedStr(CurrToStr(DM1.anoFinal)) + ' AND PVSCSERV = ' + QuotedStr(DM1.StrZero(CurrToStr(DM1.anoServicio), 2));
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         DM1.MontoTabCap := DM1.cdsQry.FieldByName('VALOR').AsCurrency;
      End;
      If DM1.anoFinal = 1997 Then
    // tabla de retiro + 2 UIT
      Begin
      // tabla de retiro
         tmes := 'PVSRMM' + DM1.StrZero(CurrToStr(DM1.mesFinal), 2);
         xSql := 'SELECT ' + tmes + ' VALOR FROM PVS104 WHERE PVSRANO = ' + QuotedStr(CurrToStr(DM1.anoFinal)) + ' AND PVSRSERV = ' + QuotedStr(DM1.StrZero(CurrToStr(DM1.anoServicio), 2));
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         DM1.MontoTabRet := DM1.cdsQry.FieldByName('VALOR').AsCurrency;
      // 2 UIT
         xSql := ' SELECT UITNUMER, UITNUMER * UITMONTO UIT FROM TGE188 WHERE ' + QuotedStr(xasofresces) + ' >= UITFCINI AND '
            + QuotedStr(xasofresces) + ' <=  UITFCFIN AND UITTIPBE = ''F'' ';
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         DM1.cantidadUIT := DM1.cdsQry.FieldByName('UITNUMER').AsCurrency;
         DM1.MontoUIT := DM1.cdsQry.FieldByName('UIT').AsCurrency;
      End;
      If DM1.anoFinal > 1997 Then
      Begin
         xSql := ' SELECT UITNUMER, UITNUMER * UITMONTO UIT FROM TGE188 WHERE ' + QuotedStr(xasofresces) + ' >= UITFCINI AND '
            + QuotedStr(xasofresces) + ' <=  UITFCFIN AND UITTIPBE = ''F'' ';
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         DM1.cantidadUIT := DM1.cdsQry.FieldByName('UITNUMER').AsCurrency;
         DM1.montoUIT := DM1.cdsQry.FieldByName('UIT').AsCurrency;
         DM1.montoDiferencial := DM1.MontoUIT - (DM1.aportesCtaInd + DM1.interesesCtaInd + DM1.bonusCtaInd + DM1.calculoA1996CtaInd);
         DM1.montoUIT := 0;
      End;
   End;
  // Liquidacion por invalidez
   If xtipben = '03' Then
   Begin
      If DM1.anoFinal < 1997 Then
    // tabla de retiro + tabla de invalidez
      Begin
      // tabla de retiro
         tmes := 'PVSRMM' + DM1.StrZero(CurrToStr(DM1.mesFinal), 2);
         xSql := 'SELECT ' + tmes + ' VALOR FROM PVS104 WHERE PVSRANO = ' + QuotedStr(CurrToStr(DM1.anoFinal)) + ' AND PVSRSERV = ' + QuotedStr(DM1.StrZero(CurrToStr(DM1.anoServicio), 2));
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         DM1.montoTabRet := DM1.cdsQry.FieldByName('VALOR').AsCurrency;
      // Tabla de Invalidez
         tmes := 'PVSIMM' + DM1.StrZero(CurrToStr(DM1.mesFinal), 2);
         xSql := 'SELECT ' + tmes + ' VALOR FROM PVS105 WHERE PVSIANO = ' + QuotedStr(CurrToStr(DM1.anoFinal)) + ' AND PVSISERV = ' + QuotedStr(CurrToStr(DM1.edadInvalidez));
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         DM1.montoTabInv := DM1.cdsQry.FieldByName('VALOR').AsCurrency;
      End;
      If DM1.anoFinal = 1997 Then
    // tabla de retiro + 4 UIT
      Begin
      // tabla de retiro
         tmes := 'PVSRMM' + DM1.StrZero(CurrToStr(DM1.mesFinal), 2);
         xSql := 'SELECT ' + tmes + ' VALOR FROM PVS104 WHERE PVSRANO = ' + QuotedStr(CurrToStr(DM1.anoFinal)) + ' AND PVSRSERV = ' + QuotedStr(DM1.StrZero(CurrToStr(DM1.anoServicio), 2));
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         DM1.montoTabRet := DM1.cdsQry.FieldByName('VALOR').AsCurrency;
      // 4 UIT
         xSql := ' SELECT UITNUMER, UITNUMER * UITMONTO UIT FROM TGE188 WHERE ' + QuotedStr(xasofresces) + ' >= UITFCINI AND '
            + QuotedStr(xasofresces) + ' <=  UITFCFIN'
            + ' AND UITTIPBE = ''I'' ';
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         DM1.cantidadUIT := DM1.cdsQry.FieldByName('UITNUMER').AsCurrency;
         DM1.MontoUIT := DM1.cdsQry.FieldByName('UIT').AsCurrency;
      End;
      If DM1.anoFinal > 1997 Then
      Begin
         xSql := ' SELECT UITNUMER, UITNUMER * UITMONTO UIT FROM TGE188 WHERE ' + QuotedStr(xasofresces) + ' >= UITFCINI AND '
            + QuotedStr(xasofresces) + ' <=  UITFCFIN'
            + ' AND UITTIPBE = ''I'' ';
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         DM1.MontoUIT := DM1.cdsQry.FieldByName('UIT').AsCurrency;
         DM1.cantidadUIT := DM1.cdsQry.FieldByName('UITNUMER').AsCurrency;
         DM1.montoDiferencial := DM1.montoUIT - (DM1.aportesCtaInd + DM1.interesesCtaInd + DM1.bonusCtaInd + DM1.calculoA1996CtaInd);
         DM1.montoUIT := 0;
      End;
   End;
   DM1.liquidacionbeneficio := DM1.calculoA1996CtaInd + DM1.aportesCtaInd + DM1.InteresesCtaInd + DM1.BonusCtaInd +
      DM1.MontoTabRet + DM1.MontoTabCap + DM1.MontoTabSep + DM1.MontoTabInv + DM1.montoUIT + DM1.montoDiferencial;
   Result := DM1.liquidacionbeneficio;
End;

Function TDM1.Valores(Texto: String): Currency;
Var
   xMont, xValor: String;
   I: Integer;
Begin
   If Texto = '' Then Texto := '0';
   For I := 1 To Length(Trim(Texto)) Do
   Begin
      xMont := Copy(Texto, I, 1);
      If xMont <> ',' Then xValor := Trim(xValor) + Trim(xMont);
   End;
   Result := StrToFloat(xValor);
End;

Procedure TDM1.actualizapvs301(xasoid, xnumexp: String);
Var
   xSql, asoncta: String;
Begin
  // Para actualizar el pvs301 desde el apo201
   xSql := 'SELECT ASORESNOM, ASOFRESNOM, ASOAPENOMDNI, ASOFECNAC, TIPDOCCOD, ASODOCNUM, ASODNI, ASONCTA '
      + 'FROM APO201 WHERE ASOID = ' + QuotedStr(xasoid);
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;

   xSql := 'SELECT * FROM PVS301 WHERE ASOID = ' + QuotedStr(xasoid) + ' AND PVSEXPNRO = ' + QuotedStr(xnumexp);
   DM1.cdsQry2.Close;
   DM1.cdsQry2.DataRequest(xSql);
   DM1.cdsQry2.Open;

   If DM1.cdsQry2.FieldByName('FORPAGOID').AsString = '06' Then
      asoncta := DM1.cdsQry.FieldByName('ASONCTA').AsString
   Else
      asoncta := '';
// Inicio: DPP_201209_PRE
   // If DM1.cdsQry2.FieldByName('FORPAGOID').AsString = '18' Then asoncta := DM1.cdsQry.FieldByName('ASONCTA').AsString;
   If DM1.cdsQry2.FieldByName('FORPAGOID').AsString = '19' Then asoncta := DM1.cdsQry.FieldByName('ASONCTA').AsString;
// Fin: DPP_201209_PRE
   xSql := 'UPDATE PVS301 SET '
      + '  ASORESNOM    = ' + QuotedStr(DM1.cdsQry.FieldByName('ASORESNOM').AsString)
      + ', ASOFRESNOM   = ' + QuotedStr(DM1.cdsQry.FieldByName('ASOFRESNOM').AsString)
      + ', ASOAPENOMDNI = ' + QuotedStr(DM1.cdsQry.FieldByName('ASOAPENOMDNI').AsString)
      + ', ASOFECNAC    = ' + QuotedStr(DM1.cdsQry.FieldByName('ASOFECNAC').AsString)
      + ', TIPDOCCOD    = ' + QuotedStr(DM1.cdsQry.FieldByName('TIPDOCCOD').AsString)
      + ', ASODOCNUM    = ' + QuotedStr(DM1.cdsQry.FieldByName('ASODOCNUM').AsString)
      + ', ASODNI       = ' + QuotedStr(DM1.cdsQry.FieldByName('ASODNI').AsString)
      + ', ASONCTA      = ' + QuotedStr(asoncta)
      + ' WHERE ASOID = ' + QuotedStr(xasoid) + ' AND PVSEXPNRO = ' + QuotedStr(xnumexp);
   DM1.DCOM1.AppServer.EjecutaSQL(xSql);

End;

Procedure TDM1.actualizaaportes(xasoid, xbeneficio, xfecben, xfecini, xfecfin, graba: String);
Var
   xSql: String;
Begin
   If Graba = 'G' Then
   Begin
      xSql := 'UPDATE APO301 SET PVSLBENNR = ' + QuotedStr(xbeneficio) + ', PVSLFECBE = ' + QuotedStr(xfecben) + ' WHERE ASOID = ' + QuotedStr(xasoid)
         + ' AND APOSEC >= ' + QuotedStr(xfecini) + ' AND APOSEC <= ' + QuotedStr(xfecfin);
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
   End
   Else
   Begin
      xSql := 'UPDATE APO301 SET TRANSMTODEV =  NVL(TRANSMTODEV,0) -  NVL(DEVAPOBEN,0)'
         + ' WHERE ASOID = ' + QuotedStr(xasoid) + ' AND PVSLBENNR = ' + QuotedStr(xbeneficio);
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      xSql := 'UPDATE APO301 SET PVSLBENNR = NULL, PVSLFECBE = NULL, DEVAPOBEN = NULL'
         + ' WHERE ASOID = ' + QuotedStr(xasoid) + ' AND PVSLBENNR = ' + QuotedStr(xbeneficio);
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
   End;
End;

Function TDM1.replace(texto: String; cantidad: Integer): String;
Var
   x: Integer;
   devuelve: String;
Begin
   For x := 1 To cantidad Do
      devuelve := devuelve + texto;
   Result := devuelve;
End;

// Inicio: HPC_201709_PRE
// Se modifica procedimiento para exportar clientdataset a excel
Procedure TDM1.HojaExcel(Tit: String; TDs: TDataSource; TDb: TDBGrid);
Var
   Lcid, C, CH, CH1, I, W, X, Y, TotHoja: Integer;
   Bk: TBookmarkStr;
   Tabla: Variant;
   L, A: OleVariant;
   HH: Extended;
   F: TFieldDef;
Begin
   If Not TDs.DataSet.Active Then Exit;
   If TDs.DataSet.RecordCount = 0 Then Exit;
   Lcid := GetUserDefaultLCID;
   C := TDb.Columns.Count;
   CH := 1;
   If TDs.DataSet.RecordCount > 20100 Then
   Begin
      HH := TDs.DataSet.RecordCount / 20100;
      CH := Trunc(HH);
      If Frac(HH) > 0 Then CH := CH + 1;
   End;
   ExcelApp.Visible[Lcid] := True;
   ExcelApp.Caption := 'Consultas en EXCEL';
   ExcelBook.ConnectTo(ExcelApp.Workbooks.Add(1, Lcid));
   If CH > 1 Then
   Begin
      ExcelBook.Worksheets.Add(NULL, NULL, (CH - 1), NULL, Lcid);
      For I := 1 To CH Do
      Begin
         WS.ConnectTo(ExcelBook.Worksheets[I] As _Worksheet);
         WS.Name := Tit + '_' + IntToStr(I);
      End;
   End;
   WS.ConnectTo(ExcelBook.Worksheets[1] As _Worksheet);
   WS.Activate(Lcid);
   If CH = 1 Then WS.Name := Tit;
   ExcelApp.ScreenUpdating[Lcid] := False;
   For X := 1 To CH Do
   Begin
      WS.ConnectTo(ExcelBook.Worksheets[X] As _Worksheet);
      WS.Activate(Lcid);
      For I := 0 To (C - 1) Do
      Begin
         L := WS.Cells.Item[1, I + 1];
         WS.Range[L, L].Value2 := TDb.Columns[I].Title.Caption;
      End;
   End;
   WS.ConnectTo(ExcelBook.Worksheets[1] As _Worksheet);
   WS.Activate(Lcid);
   CH1 := 1;
   W := 2;
   I := 1;
   Y := 1;
   TotHoja := 0;
   TDs.DataSet.DisableControls;
   Bk := TDs.DataSet.Bookmark;
   Tabla := VarArrayCreate([1, 5000, 0, C], varVariant);
   TDs.DataSet.First;
   While Not TDs.DataSet.Eof Do
   Begin
      For X := 0 To (C - 1) Do
      Begin
         F:= TDs.DataSet.FieldDefs.Items[X];
         If ((F.DataType =  ftDate) or
            (F.DataType =  ftDateTime) or
            (F.DataType =  ftTimeStamp)) AND
            (Length(TRIM(TDs.DataSet.Fields[X].AsString))<>0) Then
            Begin
              Tabla[Y, X] := ''''+TDs.DataSet.Fields[X].AsString;
            end
         Else If F.DataType =  ftFMTBcd Then
            Tabla[Y, X] := TDs.DataSet.Fields[X].AsString
         Else
            Tabla[Y, X] := ''''+TDs.DataSet.Fields[X].AsString;
      end;
      If Y = 5000 Then
      Begin
         L := 'A' + IntToStr(W);
         WS.Range[L, WS.Cells.Item[I + 1, C]].Value2 := Tabla;
         Try
            Tabla := Unassigned;
         Finally
            Tabla := VarArrayCreate([1, 5000, 0, C], varVariant);
         End;
         Y := 0;
         W := I + 2;
      End;
      Inc(Y, 1);
      Inc(I, 1);
      Inc(TotHoja, 1);
      If TotHoja = 20100 Then
      Begin
         L := 'A' + IntToStr(W);
         WS.Range[L, WS.Cells.Item[I, C]].Value2 := Tabla;
         Try
            Tabla := Unassigned;
         Finally
            Tabla := VarArrayCreate([1, 5000, 0, C], varVariant);
         End;
         CH1 := CH1 + 1;
         WS.ConnectTo(ExcelBook.Worksheets[CH1] As _Worksheet);
         WS.Activate(Lcid);
         Y := 1;
         W := 2;
         I := 1;
         TotHoja := 0;
      End;
      Application.ProcessMessages;
      TDs.DataSet.Next;
   End;
   CH1 := I;
   Try
      WS.Range['A' + IntToStr(W), WS.Cells.Item[CH1, C]].Value2 := Tabla;
   Finally
      Tabla := Unassigned;
   End;
   For X := 1 To CH Do
   Begin
      WS.ConnectTo(ExcelBook.Worksheets[X] As _Worksheet);
      WS.Activate(Lcid);
      SetLength(FormatCel, C + 1);
      FormatosCeldas(C, TDs);
      For I := 1 To C Do
      Begin
         L := WS.Cells.Item[1, I];
         WS.Range[L, L].EntireColumn.NumberFormat := FormatCel[I];
      End;
      For I := 0 To (C - 1) Do
      Begin
         L := WS.Cells.Item[1, I + 1];
         Y := TDs.DataSet.Fields[I].DisplayWidth;
         If Length(TDb.Columns[I].Title.Caption) > Y Then
            Y := Length(TDb.Columns[I].Title.Caption);
         If Y>=255 Then Y:=243;
         WS.Range[L, L].EntireColumn.ColumnWidth := Y + 2;
         If TDb.Columns[I].Alignment = taLeftJustify Then A := 2;
         If TDb.Columns[I].Alignment = taCenter Then A := 3;
         If TDb.Columns[I].Alignment = taRightJustify Then A := 4;
         WS.Range[L, L].EntireColumn.HorizontalAlignment := A;
      End;
      L := WS.Cells.Item[1, C];
      WS.Range['A1', L].HorizontalAlignment := 3;
      WS.Range['A1', L].Interior.Color := clMaroon;
      WS.Range['A1', L].Font.Color := clWhite;
      WS.Range['A1', L].Font.Bold := True;
      If CH = 1 Then
         W := TDs.DataSet.RecordCount + 1
      Else
         If (CH > 1) And (X < CH) Then
            W := 15101
         Else
            If (CH > 1) And (X = CH) Then W := CH1;
      WS.PageSetup.PrintGridlines := True;
      WS.PageSetup.PrintTitleRows := '1:1';
      WS.DefaultInterface.Set_DisplayAutomaticPageBreaks(Lcid, True);
   End;
   WS.ConnectTo(ExcelBook.Worksheets[1] As _Worksheet);
   WS.Activate(Lcid);
   ExcelApp.ScreenUpdating[Lcid] := True;
   TDs.DataSet.EnableControls;
   TDs.DataSet.Bookmark := Bk;
End;
// Fin: HPC_201709_PRE

Procedure TDM1.FormatosCeldas(N: Integer; TDs: TDataSource);
Var
   I: Integer;
   F: TFieldDef;
Begin
   For I := 1 To N Do
   Begin
      F := TDs.DataSet.FieldDefs.Items[I - 1];
      Case F.DataType Of
         ftString: FormatCel[I] := DM1.StrZero('0', Length(TDs.DataSet.Fields[I - 1].AsString));
         // Inicio: HPC_201709_PRE
         // Se actualiza formatos de las fechas 
         // ftDate: FormatCel[I] := 'dd/mm/aaaa';
         // ftDateTime: FormatCel[I] := 'dd/mm/aaaa';
         // ftTimeStamp: FormatCel[I] := 'dd/mm/aaaa';
         // ftWideString: FormatCel[I] := 'dd/mm/aaaa';
         ftTimeStamp: FormatCel[I] := DM1.StrZero('0', Length(TDs.DataSet.Fields[I - 1].AsString));
         ftDate: FormatCel[I] := 'dd/mm/yyyy';
         ftDateTime: FormatCel[I] := 'dd/mm/yyyy';
         ftWideString: FormatCel[I] := 'dd/mm/yyyy';
         // Fin: HPC_201709_PRE
         ftUnknown: FormatCel[I] := DM1.StrZero('0', Length(TDs.DataSet.Fields[I - 1].AsString));
      Else
         FormatCel[I] := Null;
      End;
   End;
End;





Procedure TDM1.actualizalibretasdeahorro(xasoid: String);
Var
   xSql: String;
Begin
   // Inicio: SPP_201303_PRE
   // xSql := 'INSERT INTO PVS308(ASOID, PVSLTIPBE, PVSLBENNR, DSGTREL, DSGAPEPAT, DSGAPEMAT,'
   //   + ' DSGNOMBR, DSGPORC, DSGMTOORI, DSGMTOLOC, FLGENTLIB, FLGLIB, PVSEXPNRO, USUARIO, FREG, HREG, DSGFECPAGO, DSGTDNI, DSGTAPENOM, DSGTAPEPAT, DSGTAPEMAT, DSGTNOMBR, FECNACMEN)'
   //   + ' SELECT A.ASOID, A.PVSLTIPBE, A.PVSLBENNR, B.CODRELCOB, B.APEPATCOB, B.APEMATCOB,'
   //   + ' B.NOMCOB, B.PORDES, B.PVSLMONTO, B.PVSLMONTO, ''N'' , ''S'', A.PVSEXPNRO, ' + QuotedStr(DM1.wUsuario)
   //   + ' ,TO_CHAR(SYSDATE, ''DD/MM/YYYY''), SYSDATE, TO_CHAR(SYSDATE, ''DD/MM/YYYY''), B.DOCIDETUT, TRIM(B.APEPATTUT)||'' ''||TRIM(B.APEMATTUT)||'' ''||TRIM(B.NOMTUT), B.APEPATTUT, B.APEMATTUT, B.NOMTUT, B.FECNACMEN'
   //   + ' FROM PVS306 A, PVS307 B WHERE A.PVSLBENNR = ' + QuotedStr(DM1.numeroLiquidacion)
   //   + ' AND A.PVSLBENNR = B.PVSLBENNR AND PVSLAGRID IN (''FPG'',''RET'') AND FLGVOUCHER = ''N'' AND B.FORPAGOID = ''11'' AND B.BANCOID = ''03''';
   xSql := 'INSERT INTO PVS308(ASOID, PVSLTIPBE, PVSLBENNR, DSGTREL, DSGAPEPAT, DSGAPEMAT,'
      + ' DSGNOMBR, DSGPORC, DSGMTOORI, DSGMTOLOC, FLGENTLIB, FLGLIB, PVSEXPNRO, USUARIO, FREG, HREG, DSGFECPAGO, DSGTDNI, DSGTAPENOM, DSGTAPEPAT, DSGTAPEMAT, DSGTNOMBR, FECNACMEN, DIRDOMCOB, CODZIPCOB, TELFIJCOB, TELMOVCOB)'
      + ' SELECT A.ASOID, A.PVSLTIPBE, A.PVSLBENNR, B.CODRELCOB, B.APEPATCOB, B.APEMATCOB,'
      + ' B.NOMCOB, B.PORDES, B.PVSLMONTO, B.PVSLMONTO, ''N'' , ''S'', A.PVSEXPNRO, ' + QuotedStr(DM1.wUsuario)
      + ' ,TO_CHAR(SYSDATE, ''DD/MM/YYYY''), SYSDATE, TO_CHAR(SYSDATE, ''DD/MM/YYYY''), B.DOCIDETUT, TRIM(B.APEPATTUT)||'' ''||TRIM(B.APEMATTUT)||'' ''||TRIM(B.NOMTUT), B.APEPATTUT, B.APEMATTUT, B.NOMTUT, B.FECNACMEN, B.DIRDOMCOB, B.CODZIPCOB, B.TELFIJCOB, B.TELMOVCOB'
      + ' FROM PVS306 A, PVS307 B WHERE A.PVSLBENNR = ' + QuotedStr(DM1.numeroLiquidacion)
      + ' AND A.PVSLBENNR = B.PVSLBENNR AND PVSLAGRID IN (''FPG'',''RET'') AND FLGVOUCHER = ''N'' AND B.FORPAGOID = ''11'' AND B.BANCOID = ''03''';
   // Fin: SPP_201303_PRE
   DM1.DCOM1.AppServer.EjecutaSQL(xSql);
End;

Procedure TDM1.calcularetencion(xAsoid: String);
Var
   montocob: Double;
   texto, xSql: String;
Begin
// Inicio: DPP_201204_PRE
   xSql := 'SELECT ASOID, APENOMBEN, RTJNOMBR, RTJOBS, RTJPORC, RTJIMPOR, RTJJUZG, FORPAGOID, BANCOID, RTJFREC, '
      + ' AGENBCOID, CUEAHO, RTJGIRAR  FROM PVS305 WHERE ASOID = ' + QuotedStr(DM1.cdsExpLiq.FieldByname('ASOID').AsString)
      + ' AND PVSLBENNR IS NULL AND NVL(ANULADO,''X'') <> ''S'' '
      + ' order by RTJFREC';
// Fin: DPP_201204_PRE


   DM1.cdsMaestRetJud.Close;
   DM1.cdsMaestRetJud.DataRequest(xSql);
   DM1.cdsMaestRetJud.Open;
  // Calculando retención judicial
   DM1.montoRetencion := 0;
   DM1.cdsRetJud.EmptyDataSet;
   If DM1.cdsMaestRetJud.RecordCount > 0 Then
      DM1.cdsMaestRetJud.First;
   Begin
      While Not DM1.cdsMaestRetJud.Eof Do
      Begin
       // Verificando si es por porcentaje
         If DM1.cdsMaestRetJud.FieldByName('RTJPORC').AsFloat > 0 Then
         Begin
            montoCob := (DM1.liquidacionbeneficio + DM1.montoDevApo - DM1.montoNivApo) * (DM1.cdsMaestRetJud.FieldByName('RTJPORC').AsFloat / 100);
         // Inicio: DPP_201204_PRE
            if (montoCob+DM1.montoRetencion)>(DM1.liquidacionbeneficio + DM1.montoDevApo - DM1.montoNivApo) then
               montoCob := DM1.liquidacionbeneficio + DM1.montoDevApo - DM1.montoNivApo -DM1.montoRetencion;
         // Fin: DPP_201204_PRE
            montocob := DM1.Valores(FloatToStrF(montocob, ffNumber, 10, 2));
            DM1.montoRetencion := DM1.montoRetencion + montoCob;
         End
         Else
         Begin
            // Inicio: DPP_201204_PRE
            If (DM1.liquidacionbeneficio + DM1.montoDevApo - DM1.montoNivApo - DM1.montoRetencion) > DM1.cdsMaestRetJud.FieldByName('RTJIMPOR').AsFloat Then
            Begin
               montoCob := DM1.cdsMaestRetJud.FieldByName('RTJIMPOR').AsFloat;
               // montocob := StrToFloat(floattostrf(montocob, ffNumber, 10, 2));
               DM1.montoRetencion := DM1.montoRetencion + montoCob;
            End
            Else
            Begin
               montoCob := DM1.liquidacionbeneficio + DM1.montoDevApo - DM1.montoNivApo - DM1.montoRetencion;
               // montocob := StrToFloat(floattostrf(montocob, ffNumber, 10, 2));
               DM1.montoRetencion := DM1.montoRetencion + montoCob;
            End;
           // Fin: DPP_201204_PRE
         End;
       // Añadiendo texto de la forma de pago
         If DM1.cdsMaestRetJud.FieldByName('FORPAGOID').AsString = '01' Then
            texto := '* CHEQUE DEL ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', DM1.cdsMaestRetJud.FieldByName('BANCOID').AsString);
         If DM1.cdsMaestRetJud.FieldByName('FORPAGOID').AsString = '05' Then
            texto := '* GIRO DEL ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', DM1.cdsMaestRetJud.FieldByName('BANCOID').AsString)
               + ' A LA CIUDAD DE ' + DM1.DevuelveValor('COB102', 'AGENBCODES', 'AGENBCOID', DM1.cdsMaestRetJud.FieldByName('AGENBCOID').AsString) + '-'
               + DM1.DevuelveValor('TGE158', 'DPTODES', 'DPTOID', DM1.DevuelveValor('COB102', 'DPTOID', 'AGENBCOID', DM1.cdsMaestRetJud.FieldByName('AGENBCOID').AsString));
         If DM1.cdsMaestRetJud.FieldByName('FORPAGOID').AsString = '11' Then
            texto := '* LIBRETA DE AHORRO DEL ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', DM1.cdsMaestRetJud.FieldByName('BANCOID').AsString);
         If DM1.cdsMaestRetJud.FieldByName('FORPAGOID').AsString = '06' Then
            texto := '* ABONO EN CUENTA DEL ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', DM1.cdsMaestRetJud.FieldByName('BANCOID').AsString);
         DM1.cdsRetJud.Append;
         // Inicio: DPP_201204_PRE
         // DM1.cdsRetJud.FieldByName('DESC').AsString := texto + '  [' + DM1.cdsMaestRetJud.FieldByName('RTJPORC').AsString + '%]';
         If DM1.cdsMaestRetJud.FieldByName('RTJPORC').AsFloat > 0 Then
            DM1.cdsRetJud.FieldByName('DESC').AsString := texto + '  [PORCENTAJE DEMANDADO ' + DM1.cdsMaestRetJud.FieldByName('RTJPORC').AsString + '%]'
         Else
         Begin
            texto := texto + '  [';
            If  (DM1.liquidacionbeneficio+DM1.montoDevApo-DM1.montoNivApo) = DM1.montoRetencion Then texto := texto + '(*)';
            texto := texto + 'RETENCION DEMANDADA S/.' + DM1.cdsMaestRetJud.FieldByName('RTJIMPOR').AsString+']';
            DM1.cdsRetJud.FieldByName('DESC').AsString := texto;
         End;
         // Fin: DPP_201204_PRE
         DM1.cdsRetJud.FieldByName('FORPAGID').AsString := DM1.cdsMaestRetJud.FieldByName('FORPAGOID').AsString;
         DM1.cdsRetJud.FieldByName('BANCOID').AsString := DM1.cdsMaestRetJud.FieldByName('BANCOID').AsString;
         DM1.cdsRetJud.FieldByName('AGENBCOID').AsString := DM1.cdsMaestRetJud.FieldByName('AGENBCOID').AsString;
         DM1.cdsRetJud.FieldByName('PVSNOMBRE').AsString := DM1.cdsMaestRetJud.FieldByName('RTJGIRAR').AsString;
         DM1.cdsRetJud.Post;
         DM1.cdsRetJud.Append;
         DM1.cdsRetJud.FieldByName('DESC').AsString := ' A :' + DM1.cdsMaestRetJud.FieldByName('RTJGIRAR').AsString + '  [DEMANDANTE : ' + DM1.cdsMaestRetJud.FieldByName('APENOMBEN').AsString + ']';
         If montoCob < 0 Then montoCob := 0;
         DM1.cdsRetJud.FieldByName('MONTO').AsFloat := montoCob;
         DM1.cdsRetJud.FieldByName('FORPAGID').AsString := DM1.cdsMaestRetJud.FieldByName('FORPAGOID').AsString;
         DM1.cdsRetJud.FieldByName('BANCOID').AsString := DM1.cdsMaestRetJud.FieldByName('BANCOID').AsString;
         DM1.cdsRetJud.FieldByName('AGENBCOID').AsString := DM1.cdsMaestRetJud.FieldByName('AGENBCOID').AsString;
         DM1.cdsRetJud.FieldByName('PVSNOMBRE').AsString := DM1.cdsMaestRetJud.FieldByName('RTJGIRAR').AsString;
         DM1.cdsRetJud.FieldByName('PORCENTAJE').AsString := DM1.cdsMaestRetJud.FieldByName('RTJPORC').AsString;
         DM1.cdsRetJud.Post;
         DM1.cdsMaestRetJud.Next;
      End;
   End;
End;

Procedure TDM1.actualiza_aso_resolucion;
Var
   xSql: String;
Begin
   xSql := 'SELECT * FROM PVS301 WHERE ASOID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)
      + ' AND PVSEXPNRO = ' + QuotedStr(DM1.cdsExpLiq.FieldByName('PVSEXPNRO').AsString);
   DM1.cdsQry2.Close;
   DM1.cdsQry2.DataRequest(xSql);
   DM1.cdsQry2.Open;
   xSql := 'UPDATE ASO_RESOLUCIONES SET LIQUIDADO = ''S'', NUMLIQ = ' + QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)
      + ', FECLIQ = TO_CHAR(SYSDATE, ''DD/MM/YYYY'') WHERE ASOID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString);
   DM1.DCOM1.AppServer.EjecutaSQL(xSql);
End;

Function TDM1.inserta_aso_resolucion(xasoid: String): Boolean;
Var
   xSql: String;
Begin
   xSql := 'SELECT * FROM PVS301 WHERE ASOID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString);
   DM1.cdsQry2.Close;
   DM1.cdsQry2.DataRequest(xSql);
   DM1.cdsQry2.Open;
   xSql := 'SELECT * FROM ASO_RESOLUCIONES WHERE ASOID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString) + ' AND RESVIG = ''S''';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   If DM1.cdsQry.RecordCount = 1 Then
   Begin
      xSql := 'UPDATE ASO_RESOLUCIONES SET ASORESCESE = ' + QuotedStr(DM1.cdsQry2.FieldByName('ASORESCESE').AsString)
         + ' ,ASOFRESCESE = ' + QuotedStr(DM1.cdsQry2.FieldByName('ASOFRESCESE').AsString)
         + ' ,NUMLIQ = ' + QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)
         + ' ,FECLIQ = ' + QuotedStr(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString)
         + ' ,NUMEXPLIQ =' + QuotedStr(DM1.cdsQry2.FieldByName('PVSEXPNRO').AsString)
         + ' ,FECEXPLIQ =' + QuotedStr(DM1.cdsQry2.FieldByName('FREG').AsString)
         + ' ,USUARIO = ' + QuotedStr(DM1.wUsuario)
         + ' ,FREG = TO_CHAR(SYSDATE, ''DD/MM/YYYY''), HREG = SYSDATE'
         + ' WHERE ASOID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString) + ' AND RESVIG = ''S''';
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      Result := True;
   End
   Else
      Result := False;
End;

Function TDM1.IsStrANumber(NumStr: String): bool;
Begin
   result := true;
   Try
      StrToInt(NumStr);
   Except
      result := false;
   End;
End;

Function TDM1.FormatoNumeros(xTexto: String): String;
Begin
   Try
      Result := FormatFloat('###,##0.#0', DM1.Valores(xTexto));
   Except
   End;
End;

Function TDM1.CalculaEdad(FechaNacimiento, Fechadecese: String): integer;
Var
   iTemp, iTemp2, Nada: word;
   xFecha, yFecha: TDate;
Begin
   yFecha := StrToDate(Fechadecese);
   xFecha := StrToDate(FechaNacimiento);
   DecodeDate(yFecha, itemp, Nada, Nada);
   DecodeDate(xFecha, itemp2, Nada, Nada);
   If FormatDateTime('mmdd', yFecha) < FormatDateTime('mmdd', xFecha) Then
      Result := iTemp - iTemp2 - 1
   Else
      Result := iTemp - iTemp2;
End;
{
procedure TDM1.ExportaExcel(pStringGrid: TstringGrid; c0, r0, c1, r1: Integer);
var ExLin, ExCol, i, Linea, AuxInteger : Integer;
    AuxFloat : Double;
    AuxFecha : tDatetime;
    c : TCursor;
    Excel, ExcelDoc, WS : Variant;
begin
  c             := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  with pStringGrid do begin
    try
      coinitialize(nil);
      Excel         := CreateOleObject('Excel.Application');
      ExcelDoc      := Excel.Workbooks.Add;
      WS            := ExcelDoc.ActiveSheet;
      Excel.Visible := true;
      ExCol         := 0;
      for i := c0 to c1 do begin
        inc(ExCol);
        ws.Cells.Item[1, ExCol]:= cells[i, 0];
      end;

      for linea := r0 to r1 do begin
        inc(ExLin);
        ExCol := 0;
        for i := c0 to c1 do begin
          inc(ExCol);
          try
            try
              if pos('/', cells[i, linea - 1]) <> 0 then begin
                AuxFecha := strtodatetime(cells[i, linea - 1]));
                ws.Cells.Item[ExLin, ExCol] := AuxFecha;
              end
              else AuxFecha := strtodatetime('GENERA EXCEPCION');
            except
              try
                AuxInteger := strtoint(cells[i,linea-1]));
                ws.Cells.Item[ExLin,ExCol]:= AuxInteger;
              except
                try
                  AuxFloat := strtofloat(cells[i,linea-1]);
                  ws.Cells.Item[ExLin,ExCol]:= AuxFloat;
                except
                  ws.Cells.Item[ExLin,ExCol]:= cells[i,linea-1];
                end;
              end;
            end;
          except end;
        end;        TExcelExport
      end;
      ws.cells.entirecolumn.autofit;
    finally
      screen.Cursor := c;
    end;
  end;
end;
}

Function TDM1.CrgDescrip(xCondicion, xTabla, xCampo: String): String;
Begin
   cdsQry.Close;
   cdsQry.DataRequest('Select * From ' + xTabla + ' Where ' + xCondicion);
   cdsQry.Open;
   If cdsQry.RecordCount = 1 Then
      Result := cdsQry.fieldbyname(xCampo).AsString
   Else
      Result := '';

   cdsQry.Close;

End;

Procedure TDM1.BlqComponentes(xForm: tForm);
Var
   xSQL, xComponente, x, y: String;
   i: Integer;
Begin
   // Inicio: HPP_201003_PRE por JCARBONEL
   xSQL := 'SELECT USERID,TABLA,CAMPO,COMPONENTE FROM SIS000 WHERE USERID=' + QuotedStr(DM1.wUsuario) + ' AND COMPONENTE IS NOT NULL '
          +' and MODULOID=''PRE'' ';
   // Fin: HPP_201003_PRE
   cdsQry7.Close;
   cdsQry7.DataRequest(xSQL);
   cdsQry7.Open;
   If cdsQry7.RecordCount > 0 Then
   Begin
      cdsQry7.First;
      While Not cdsQry7.Eof Do
      Begin
         xComponente := Trim(cdsQry7.FieldByName('COMPONENTE').AsString);
         For i := 0 To xForm.ComponentCount - 1 Do
         Begin
            If UpperCase(xComponente) = UpperCase(xForm.Components[i].Name) Then
            Begin
               TwwDBEdit(xForm.Components[i]).Enabled := True;
            End;
         End;
         cdsQry7.Next;
      End;
   End;
   cdsQry7.Close;
End;

Function TDM1.CrgArea(xUsuario: String): String;
Begin
   cdsUser.Close;
   cdsUser.DataRequest('SELECT USERID,USERNOM,AREA,ORIGEN,NIVEL FROM USERTABLE WHERE USERID=' + QuotedStr(Trim(xUsuario)));
   cdsUser.Open;
   If cdsUser.RecordCount = 1 Then
      Result := cdsUser.fieldByname('AREA').AsString + cdsUser.fieldByname('ORIGEN').AsString + cdsUser.fieldByname('NIVEL').AsString
   Else
      Result := '';
   cdsUser.Close
End;

Procedure TDM1.validaasociados(xasoid, xcob: String);
Var
   xSql: String;
Begin
   xSql := 'SELECT * FROM APO201 WHERE ASOID = ' + QuotedStr(xasoid);
   DM1.cdsQry20.Close;
   DM1.cdsQry20.DataRequest(xSql);
   DM1.cdsQry20.Open;
   DM1.cdsincompletos.EmptyDataSet;
  //Valida si existe algun campo en blanco en la tabla de asociados
   VerificaSinData(Trim(DM1.cdsQry20.FieldByName('ASODNI').AsString), 'DNI');
   VerificaSinData(Trim(DM1.cdsQry20.FieldByName('ASOAPEPATDNI').AsString) + Trim(DM1.cdsQry20.FieldByName('ASOAPEMATDNI').AsString), 'APELLIDO PATERNO Y/O MATERNO EN BLANCO');
  //VerificaSinData(Trim(DM1.cdsQry20.FieldByName('ASOAPEPATDNI').AsString), 'APELLIDO PATERNO EN BLANCO');
  //VerificaSinData(Trim(DM1.cdsQry20.FieldByName('ASOAPEMATDNI').AsString), 'APELLIDO MATERNO EN BLANCO');
   VerificaSinData(Trim(DM1.cdsQry20.FieldByName('ASONOMDNI').AsString), 'NOMBRE(S) EN BLANCO');
   VerificaSinData(Trim(DM1.cdsQry20.FieldByName('ASOSEXO').AsString), 'SEXO EN BLANCO');
   VerificaSinData(Trim(DM1.cdsQry20.FieldByName('REGPENID').AsString), 'REGIMEN DE PENSION EN BLANCO');
   VerificaSinData(Trim(DM1.cdsQry20.FieldByName('ASOCODPAGO').AsString), 'CODIGO DE PAGO EN BLANCO');
   VerificaSinData(Trim(DM1.cdsQry20.FieldByName('UPAGOID').AsString), 'UNIDAD DE PAGO EN BLANCO');
   VerificaSinData(Trim(DM1.cdsQry20.FieldByName('UPROID').AsString), 'UNIDAD DE PROCESO EN BLANCO');
   VerificaSinData(Trim(DM1.cdsQry20.FieldByName('USEID').AsString), 'USE/UGEL EN BLANCO');
  // Verificando si la USE existe
   xSql := 'SELECT * FROM APO101 WHERE USEID = ' + QuotedStr(DM1.cdsQry20.FieldByName('USEID').AsString)
      + ' AND UPAGOID = ' + QuotedStr(DM1.cdsQry20.FieldByName('UPAGOID').AsString) + ' AND UPROID = ' + QuotedStr(DM1.cdsQry20.FieldByName('UPROID').AsString);
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   VerificaSinData(Trim(DM1.cdsQry.FieldByName('USENOM').AsString), 'NOMBRE DE USE NO VALIDA');
   VerificaSinData(Trim(DM1.cdsQry20.FieldByName('ASOTIPID').AsString), 'TIPO DE ASOCIADO');
   VerificaSinData(Trim(DM1.cdsQry20.FieldByName('ASODIR').AsString), 'DIRECCION (DOMICILIO)');
   VerificaSinData(Trim(DM1.cdsQry20.FieldByName('ASODPTO').AsString), 'DEPARTAMENTO (DOMICILIO)');
   VerificaSinData(Trim(DM1.cdsQry20.FieldByName('CIUDID').AsString), 'PROVINCIA (DOMICILIO)');
   VerificaSinData(Trim(DM1.cdsQry20.FieldByName('ZIPID').AsString), 'DISTRITO (DOMICILIO)');
   VerificaSinData(Trim(DM1.cdsQry20.FieldByName('ASOTELF1').AsString) + Trim(DM1.cdsQry20.FieldByName('ASOTELF1').AsString), 'TELEFONO (DOMICILIO)');
   VerificaSinData(Trim(DM1.cdsQry20.FieldByName('ASORESNOM').AsString), 'NRO DE RESOLUCION DE NOMBRAMIENTO');
   VerificaSinData(Trim(DM1.cdsQry20.FieldByName('ASOFRESNOM').AsString), 'FECHA DE RESOLUCION DE NOMBRAMIENTO');
  // Verifica Foto, firma y Reniec
   xSql := 'SELECT IDFIRMA, IDASO, ACTDATREN FROM APO110 WHERE OFDESID = ' + QuotedStr(DM1.wofides);
   DM1.cdsQry23.Close;
   DM1.cdsQry23.DataRequest(xSql);
   DM1.cdsQry23.Open;
   If (DM1.cdsQry23.FieldByName('ACTDATREN').AsString = 'S') And (Trim(DM1.cdsQry20.FieldByName('ACTARCREN').AsString) <> 'S') Then
   Begin
      DM1.cdsincompletos.Insert;
      DM1.cdsincompletos.FieldByName('DESCRIPCION').AsString := 'NO ACTUALIZO DE RENIEC';
   End;
  //Verifica Reniec
   If xcob = 'S' Then
   Begin
    //Verifica Fotos
      If (DM1.cdsQry23.FieldByName('IDASO').AsString = 'S') And (Trim(DM1.cdsQry20.FieldByName('IDIMAGE').AsString) = '') Then
      Begin
         DM1.cdsincompletos.Insert;
         DM1.cdsincompletos.FieldByName('DESCRIPCION').AsString := 'NO CUENTA CON FOTO';
      End;
    // Verifica firma
    //Levanta si hay firma
      xSql := 'SELECT * FROM PASSWORD WHERE ASOID = ' + QuotedStr(xasoid) + ' AND NVL(SCAFIR, ''N'') = ''1''';
      DM1.cdsQry24.Close;
      DM1.cdsQry24.DataRequest(xSql);
      DM1.cdsQry24.Open;
      If (DM1.cdsQry23.FieldByName('IDFIRMA').AsString = 'S') And (DM1.cdsQry24.RecordCount = 0) Then
      Begin
         DM1.cdsincompletos.Insert;
         DM1.cdsincompletos.FieldByName('DESCRIPCION').AsString := 'NO CUENTA CON FIRMA';
      End;
   End;
  // Inicio: HPC_201809_PRE
  // Se retira validación de datos socioeconomicos
  // Verificando datos socioeconomicos
  // xSql := 'SELECT GRAINSTID,CONVIVID,TIPPROID,INMUEBLE,NROHIJOS,ESTCIVID,VEHICULO FROM (SELECT MAX(ITEM) ITEM FROM APO206'
  //     + ' WHERE ASOID=' + QuotedStr(xasoid) + ') A, APO206 B WHERE ASOID = ' + QuotedStr(xasoid) + ' AND A.ITEM=B.ITEM';
  //  DM1.cdsQry21.Close;
  //  DM1.cdsQry21.DataRequest(xSql);
  //  DM1.cdsQry21.Open;
  //  VerificaSinData(Trim(dm1.cdsQry21.FieldByName('GRAINSTID').AsString), 'GRADO DE INSTRUCCION');
  //  VerificaSinData(Trim(DM1.cdsQry21.FieldByName('ESTCIVID').AsString), 'ESTADO CIVIL');
  //VerificaSinData(DM1.cdsQry21.FieldByName('CONVIVID').AsString,'CONDICION DE VIVIENDA');
  // Fin: HPC_201809_PRE
End;

Procedure TDM1.VerificaSinData(xVerData, xfaLtante: String);
Begin
   If xVerData = '' Then
   Begin
      DM1.cdsincompletos.Insert;
      DM1.cdsincompletos.FieldByName('DESCRIPCION').AsString := xfaLtante;
      DM1.cdsincompletos.Post;
   End;
End;

Function TDM1.verificaexiste(xSql: String): Boolean;
Begin
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   If DM1.cdsQry.RecordCount = 1 Then
      Result := True
   Else
      Result := False;
   Exit;
End;

//INICIO: DPP_201201_PRE
//Procedure TDM1.CargaImagenes;
procedure TDM1.CargaImagenes(xAsodni: String);
begin
//FINAL: DPP_201201_PRE

   DM1.Jpg := Nil;
   DM1.Stream := Nil;
   DM1.JpgFirma := Nil;
   DM1.StreamFirma := Nil;

  //INICIO: DPP_201201_PRE
   DM1.cdsTipoMoneda.Close;
   // Inicio: SPP_201306_PRE Se modifica el Qry para la captura de la foto. Se toma el valor del parametro que se recepciona.
   // DM1.cdsTipoMoneda.DataRequest('SELECT * FROM INF_RENIEC_CAP WHERE DNI='''+TRIM(DM1.cdsAsociado.FieldByName('ASODNI').AsString)+''' ORDER BY FECACT DESC ');
   DM1.cdsTipoMoneda.DataRequest('SELECT * FROM INF_RENIEC_CAP WHERE DNI = '+QuotedStr(xAsodni)+' ORDER BY FECACT DESC ');
   // Fin: SPP_201306_PRE
   DM1.cdsTipoMoneda.Open;
  //FINAL: DPP_201201_PRE
   Try
    // Crear una corriente y cargarle el contenido de un campo Blob
      DM1.Stream := TMemoryStream.Create;
      TBlobField(DM1.cdsTipoMoneda.FieldByName('FOTO')).SaveToStream(DM1.Stream);
      DM1.StreamFirma := TMemoryStream.Create;
      TBlobField(DM1.cdsTipoMoneda.FieldByName('FIRMA')).SaveToStream(DM1.StreamFirma);
      If DM1.Stream.Size > 0 Then
      Begin
    // Crear una imagen JPEG y cargarla desde la corriente
         DM1.Jpg := TJpegImage.Create;
         DM1.Stream.Position := 0;
         DM1.Jpg.LoadFromStream(DM1.Stream);
      End
      Else
         DM1.Jpg := Nil;
      If DM1.StreamFirma.Size > 0 Then
      Begin
    // Crear una imagen JPEG y cargarla desde la corriente
         DM1.jpgFirma := TJpegImage.Create;
         DM1.StreamFirma.Position := 0;
         DM1.jpgFirma.LoadFromStream(DM1.StreamFirma);
      End
      Else
         DM1.jpgFirma := Nil;
   Except
      DM1.Jpg := Nil;
      DM1.jpgFirma := Nil;
   End;
End;

{
function TDM1.ObtenerDigitoChequeoNuevoRUC(istrPrefijo, istrValor: String): String;

end;
}

Function TDM1.ObtenerDigitoChequeoNuevoRUC(istrPrefijo, istrValor: String): String;
Const
   astrPesos: Array[1..10] Of integer = (5, 4, 3, 2, 7, 6, 5, 4, 3, 2);
Var
   intCount: Byte;
   intPesoTotal: Integer;
   intVAsociado: Integer;
   intVControl: Integer;
   intVPivot: Integer;
   intDVC: Integer;
   strNuevoRUC: String;
Begin
   strNuevoRUC := istrPrefijo + istrValor;
   intPesoTotal := 0;
   For intCount := 1 To 10 Do
   Begin
      intPesoTotal := intPesoTotal + StrToInt(Copy(Trim(strNuevoRUC), intCount, 1)) * astrPesos[intCount];
   End;
   intVAsociado := ValInt(FloatToStr(intPesoTotal / 11));
   intVControl := intPesoTotal - (intVAsociado * 11);
   intVPivot := 11 - intVControl;
   Case intVPivot Of
      10: intDVC := 0;
      11: intDVC := 1;
   Else
      intDVC := intVPivot;
   End;
   Result := istrPrefijo + istrValor + IntToStr(intDVC);
End;

Function TDM1.ValInt(Texto: String): Integer;
Var
   xMont, xValor: String;
   I: Integer;
Begin
   If Texto = '' Then Texto := '0';
   For I := 1 To Length(Trim(Texto)) Do
   Begin
      xMont := Copy(Texto, I, 1);
      If xMont = '.' Then Break;
      Begin
         xValor := Trim(xValor) + Trim(xMont);
      End;
   End;
   Result := StrToInt(xValor);
End;

Function TDM1.StrSpace(wNumero: String; wLargo: Integer): String;
Var
   i: integer;
   s, xTemp: String;
Begin
   s := '';
   For i := 1 To wLargo Do
      s := s + ' ';
   s := s + trim(wNumero);
   xTemp := copy(s, length(s) - (wLargo - 1), wLargo);
   result := xTemp;
End;

Function TDM1.Bloqueados(xAsoId: String): Boolean;
Var
   xSQL: String;
Begin
   Result := False;
   xSQL := 'SELECT ASOID FROM CRE302 WHERE ASOID=' + QuotedStr(xAsoId) + ' AND CREESTID=''19'' ';
   If DM1.CountReg(xSQL) > 0 Then Result := True;
End;

Function TDM1.CountReg(xSQL: String): Integer;
Begin
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSQL);
   DM1.cdsQry.Open;
   Result := DM1.cdsQry.RecordCount;
End;

Function TDM1.GnrCDev: String;
Var
   xCorrAct: Integer;
   xCorrDev, xSQL, xSQL2: String;
Begin
   xSQL := 'SELECT CREAREA,TIPO,CANCUO FROM CRE206 WHERE CREAREA=''COB'' AND TIPO=''D'' AND CORREANO=' + QuotedStr(Copy(Trim(DateToStr(DM1.FechaSys)), 7, 4)) + ' AND CANCUO IS NOT NULL';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSQL);
   DM1.cdsQry.Open;
   If DM1.cdsQry.RecordCount = 1 Then
   Begin
      xCorrAct := StrToInt(DM1.cdsQry.fieldbyname('CANCUO').AsString) + 1;
      xCorrDev := Format('%.10d', [xCorrAct]);
      xSQL2 := 'Update CRE206 Set Cancuo=''' + xCorrDev + ''' WHERE CREAREA=''COB'' AND TIPO=''D'' AND CORREANO=' + QuotedStr(Copy(Trim(DateToStr(DM1.FechaSys)), 7, 4)) + ' AND CANCUO IS NOT NULL';
      DM1.DCOM1.AppServer.EjecutaSQL(xSQL2);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSQL);
      DM1.cdsQry.Open;
      If Trim(xCorrDev) > Trim(DM1.cdsQry.fieldbyname('CANCUO').AsString) Then xCorrDev := '';
      DM1.cdsQry.Close;
      Result := Copy(xCorrDev, 5, 6);
   End;
   DM1.cdsQry.Close;
End;

// Proceso de calculo del fondo solidario
procedure TDM1.calculafondosolidario(xAsoid: String);
Var
   xSql:String;
   montodesfonsol: currency;
begin
  // Calculando el fondo solidario
  DM1.cdsFonSol.EmptyDataSet;
  // Inicio: HPC_201704_PRE
  // Se desconto el monto del CCI
  // montodesfonsol := (DM1.liquidacionbeneficio - DM1.montoliquidacionanterior) + DM1.montoDevApo - DM1.montoNivApo - DM1.montoRetencion - DM1.xMonCreDes;
  montodesfonsol := (DM1.liquidacionbeneficio - DM1.montoliquidacionanterior) + DM1.montoDevApo - DM1.montoNivApo - DM1.montoRetencion - DM1.xMonCreDes - DM1.totalMontoCCI;
  // Fin: HPC_201704_PRE
  xSql := 'SELECT ASOID, NUM_DEU, NRO_REF_FSC, FEC_APL_FSC, NVL(IMP_APL_FSC,0) IMP_APL_FSC, NVL(IMP_COB_FSC,0) IMP_COB_FSC, NVL(IMP_APL_FSC,0)-NVL(IMP_COB_FSC,0) IMP_SAL_FSC'
  +' FROM COB_FSC_DEUDA_FSC_CAB WHERE ASOID = '+QuotedStr(xAsoid)+' AND ID_EST_FSC IN (''02'',''27'')';
  DM1.cdsFonSolCab.Close;
  DM1.cdsFonSolCab.DataRequest(xSql);
  DM1.cdsFonSolCab.Open;
  While Not DM1.cdsFonSolCab.Eof Do
  Begin
    If montodesfonsol = 0 Then Exit;
    If montodesfonsol >= 0 Then
    Begin
      DM1.cdsFonSol.Insert;
      DM1.cdsFonSol.FieldByName('NUM_DEU').AsString := DM1.cdsFonSolCab.FieldByName('NUM_DEU').AsString;
      DM1.cdsFonSol.FieldByName('NRO_REF_FSC').AsString := DM1.cdsFonSolCab.FieldByName('NRO_REF_FSC').AsString;
      DM1.cdsFonSol.FieldByName('FEC_APL_FSC').AsString := DM1.cdsFonSolCab.FieldByName('FEC_APL_FSC').AsString;
    End;
    If montodesfonsol >= DM1.cdsFonSolCab.FieldByName('IMP_SAL_FSC').AsCurrency Then
    Begin
       DM1.cdsFonSol.FieldByName('IMP_COB_FSC').AsFloat := DM1.cdsFonSolCab.FieldByName('IMP_SAL_FSC').AsFloat;
       DM1.cdsFonSol.FieldByName('IMP_SAL_FSC').AsFloat := 0;
       DM1.montofonsol := DM1.montofonsol + DM1.cdsFonSolCab.FieldByName('IMP_SAL_FSC').AsFloat;
    End
    Else
    Begin
      DM1.cdsFonSol.FieldByName('IMP_COB_FSC').AsFloat := montodesfonsol;
      DM1.cdsFonSol.FieldByName('IMP_SAL_FSC').AsFloat := DM1.cdsFonSolCab.FieldByName('IMP_SAL_FSC').AsFloat - montodesfonsol;
      DM1.montofonsol := DM1.montofonsol + montodesfonsol;
    End;
    DM1.cdsFonSol.Post;
    montodesfonsol := montodesfonsol - DM1.cdsFonSol.FieldByName('IMP_COB_FSC').AsFloat;
    DM1.cdsFonSolCab.Next;
  End;
end;


// Inicio HPC_201504_PRE : Descuentos por aplicaciones de CCI
// Proceso de calculo de Credito CCI
procedure TDM1.calculaCreditoCCI(xAsoid: String);
Var
   xSql:String;
begin
  // Inicio: HPC_201704_PRE 
  // // Calculando el fondo solidario
  // Calculando el monto del credito CCI
  // Fin: HPC_201704_PRE
  DM1.cdsCreCCI.EmptyDataSet;

  // Inicio: HPC_201704_PRE 
  // Se crea una variable publica para guardar la información del CCI
  // montodesCreCCI := (DM1.liquidacionbeneficio - DM1.montoliquidacionanterior) + DM1.montoDevApo - DM1.montoNivApo - DM1.montoRetencion - DM1.xMonCreDes;
  xmontodesCreCCI := (DM1.liquidacionbeneficio - DM1.montoliquidacionanterior) + DM1.montoDevApo - DM1.montoNivApo - DM1.montoRetencion - DM1.xMonCreDes;
  // Fin: HPC_201704_PRE 

  xSql:='Select codaplica, asoid, asotipid, perapl, credid, monapl, percont, flgcont, fecreg, usucrea, NUMLIQBEN '
       +  'from COB_APLI_CCI_DET '
       + 'where ASOID='+QuotedStr(xAsoid)+' and NUMLIQBEN is null';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSQL);
  DM1.cdsQry.Open;

  totalMontoCCI:=0;
  While Not DM1.cdsQry.Eof Do
  Begin
    // Inicio: HPC_201704_PRE
    // Se modifica varible que calcula el CCI
    // If montodesCreCCI = 0 Then Exit;
    // If montodesCreCCI >= 0 Then
    If xmontodesCreCCI = 0 Then Exit;
    If xmontodesCreCCI >= 0 Then
    // Fin: HPC_201704_PRE
    // Inicio: HPC_201706_PRE
    // Se cambia de lugar la actualización del registro. Solo actualiza si inserta información.
    Begin
      DM1.cdsCreCCI.Insert;
      DM1.cdsCreCCI.FieldByName('codaplica').AsString := DM1.cdsQry.FieldByName('codaplica').AsString;
      DM1.cdsCreCCI.FieldByName('credid').AsString := DM1.cdsQry.FieldByName('credid').AsString;
      DM1.cdsCreCCI.FieldByName('perapl').AsString := DM1.cdsQry.FieldByName('perapl').AsString;
      DM1.cdsCreCCI.FieldByName('fecreg').AsDateTime := DM1.cdsQry.FieldByName('fecreg').AsDateTime;
      DM1.cdsCreCCI.FieldByName('monapl').AsFloat := DM1.cdsQry.FieldByName('monapl').AsFloat;
      DM1.cdsCreCCI.Post;
    end;
    // DM1.cdsCreCCI.Post;
    // Fin: HPC_201706_PRE


    // Inicio: HPC_201704_PRE
    // Se modifica variable que calcula el CCI
    // montodesCreCCI := montodesCreCCI - DM1.cdsQry.FieldByName('monapl').AsFloat;
    xmontodesCreCCI := xmontodesCreCCI - DM1.cdsQry.FieldByName('monapl').AsFloat;
    // Fin: HPC_201704_PRE 
    totalMontoCCI := totalMontoCCI + DM1.cdsQry.FieldByName('monapl').AsFloat;
    DM1.cdsQry.Next;
  End;
end;
// Fin  HPC_201504_PRE : Descuentos por aplicaciones de CCI


procedure TDM1.GrabaFondoSolidario(xAsoid: String; xmonto:Double);
Var xSql:String;
begin
  xSql := 'BEGIN SP_DEV_AL_FSC('+QuotedStr(xAsoid)+','+FloatToStr(xmonto)+','+QuotedStr(DM1.wUsuario)
  +', SYSDATE, NULL, NULL, TO_CHAR(SYSDATE,''YYYYMM''),'+QuotedStr(DM1.numeroLiquidacion)
  +', TO_CHAR(SYSDATE,''DD/MM/YYYY''), ''05'', NULL, NULL, NULL, ''MONTO COBRADO POR LIQUIDACION DE BENEFICIOS''); END;';
  DM1.DCOM1.AppServer.EjecutaSQL(xSql);
end;


// Inicio: HPP_201006_PRE, HPC_201005_PRE
// se busca flga en Maestro de Asociados (APO201) para saber si Asociado
// está siendo actualizado por otro módulo
function TDM1.IndicaAsociadoEnAct(wwAsoid: String): Boolean;
var
   xSQL : String;
begin
   xSQL := 'select nvl(EN_ACTUALIZ,''XXX'') EN_ACTUALIZ '
          +'from APO201 '
          +'where ASOID='+quotedstr(wwAsoid);
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSQL);
   DM1.cdsQry.Open;
   result := false;
   if DM1.cdsQry.RecordCount>0 then
   begin
      if DM1.cdsQry.FieldByName('EN_ACTUALIZ').AsString<>'XXX' then
         result := True;
   end;
end;
// Fin: HPP_201006_PRE, HPC_201005_PRE

//Inicio: DPP_201207_PRE
// Solo para el caso de Fallecimiento o Invalidez que cuente con deudas pendientes
procedure TDM1.RegistraSuceso(xasoid, xtipben, xobssuc, xfecsuc: String);
Var xmoncre:Double;
    xSql, xIdeGesFal:String;
Begin
// Inicio: DPP_201209_PRE
// Se traslada comparativo a formulario PRE235
// If DM1.numeroexpediente = '' Then DM1.numeroexpediente := DM1.cdsExpLiq.FieldByName('PVSEXPNRO').AsString;
// Fin: DPP_201209_PRE
   If (xtipben = '02') Or (xtipben = '03') Then
   Begin
      // Verifica si cuenta con crédito pendiente, con monto de desgravamen Solo para casos de Invalidez o fallecimiento.
      // Se modifica la variable DM1.cdsExpLiq.FieldByName('ASOID').AsString por xasoid.
      xSql := 'SELECT SUM(NVL(B.CREMTO,0)-NVL(B.CREMTOCOB,0)) SALDO FROM CRE301 A, CRE302 B WHERE A.ASOID = '+QuotedStr(xasoid)
      //xSql := 'SELECT SUM(NVL(B.CREMTO,0)-NVL(B.CREMTOCOB,0)) SALDO FROM CRE301 A, CRE302 B WHERE A.ASOID = '+QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString)
      +' AND A.CREESTID = ''02'' AND A.ASOID = B.ASOID AND A.CREDID = B.CREDID AND NVL(B.MONPACDESGRAV,0) > 0';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      If DM1.cdsQry.FieldByName('SALDO').AsFloat > 0 Then
      Begin
         // Verificando si ya existe en la tabla de sucesos (se busca por numero de expediente)
      // Inicio: DPP_201208_PRE
      // xSql := 'SELECT IDEGESFAL, NUMMEM FROM ASO_FAC_GES_CAB WHERE NUMMEM = '+QuotedStr('EXP'+DM1.cdsExpLiq.FieldByName('PVSEXPNRO').AsString);
         xSql := 'SELECT IDEGESFAL, NUMMEM FROM ASO_FAC_GES_CAB WHERE NUMMEM = '+QuotedStr('EXP'+DM1.numeroexpediente);
      // Fin: DPP_201208_PRE
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         // Si no existe registro inserta un nuevo registro para que sea validado por cobranzas
         // En caso que ya exista realiza una modificación
         If DM1.cdsQry.RecordCount = 0 Then
         Begin
            // Actualiza en la tabla de Registro de Sucesos
            xSql := 'SELECT LPAD(MAX(IDEGESFAL)+1,6,''0'') IDEGESFAL FROM ASO_FAC_GES_CAB';
            DM1.cdsQry.Close;
            DM1.cdsQry.DataRequest(xSql);
            DM1.cdsQry.Open;
            xIdeGesFal := DM1.cdsQry.FieldByName('IDEGESFAL').AsString;
            // Actualizando Cabecera
            xSql := 'INSERT INTO ASO_FAC_GES_CAB (IDEGESFAL, AREGES, NUMMEM, FECMEM, OBSMEM, USUREG, FECREG, PVSTIPBEN, TIPCANFON)'
            +' VALUES ('+QuotedStr(xIdeGesFal)+','+QuotedStr('PRE')+','+QuotedStr('EXP'+DM1.numeroexpediente)+','
            +' TO_CHAR(SYSDATE,''DD/MM/YYYY''), '+QuotedStr('CAUSA:'+xobssuc)+','+QuotedStr(DM1.wUsuario)+', SYSDATE, '+QuotedStr(xtipben)+', ''FDD'')';
            DM1.DCOM1.AppServer.EjecutaSQL(xSql);
            // Actualizando Detalle
            // Se añade el campo ASOTIPID
            xSql := 'INSERT INTO ASO_FAC_GES_DET(IDEGESFAL, ASOID, ASODNI, ASOAPENOMDNI, FECFALGES, ESTAPRDES, ESTADO, ESTAPRFAL, USUAPRFAL, FECAPRFAL, ASOTIPID)'
            +' VALUES ('+QuotedStr(xIdeGesFal)+','+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+','
            +QuotedStr(DM1.cdsAsociado.FieldByName('ASODNI').AsString)+','+QuotedStr(DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString)+','
            +QuotedStr(xfecsuc)+', ''POR APLICAR'',''02'', ''CONFIRMADO'','+QuotedStr(DM1.wUsuario)+',SYSDATE,'+QuotedStr(DM1.cdsAsociado.FieldByName('ASOTIPID').AsString)+')';
            DM1.DCOM1.AppServer.EjecutaSQL(xSql);
         End
         Else
         Begin
            // Actualizando cabecera
            xSql := 'UPDATE ASO_FAC_GES_CAB SET OBSMEM = '+QuotedStr('CAUSA:'+xobssuc)+', PVSTIPBEN = '+QuotedStr(xtipben)+' WHERE IDEGESFAL = '+QuotedStr(DM1.cdsQry.FieldByName('IDEGESFAL').AsString);
            DM1.DCOM1.AppServer.EjecutaSQL(xSql);
            // Actualizando detalle
         // Inicio: DPP_201208_PRE
         // xSql := 'UPDATE ASO_FAC_GES_DET SET FECFALGES = '+QuotedStr(xfecsuc)+', ESTADO = ''02'' WHERE IDEGESFAL = '+QuotedStr(DM1.cdsQry.FieldByName('IDEGESFAL').AsString)+' AND ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString);
            xSql := 'UPDATE ASO_FAC_GES_DET SET FECFALGES = '+QuotedStr(xfecsuc)+', ESTADO = ''02'' WHERE IDEGESFAL = '+QuotedStr(DM1.cdsQry.FieldByName('IDEGESFAL').AsString)+' AND ASOID = '+QuotedStr(xasoid);
         // Fin: DPP_201208_PRE
            DM1.DCOM1.AppServer.EjecutaSQL(xSql);
         End;
      End;
   End
   Else
   // Si existe un registro para este expediente se procede a anular el registro,
   // siempre y cuando el campo "ESTAPRDES" tiene como estado "POR APLICAR"
   Begin
   // Inicio: DPP_201208_PRE
   // xSql := 'SELECT A.IDEGESFAL, B.ESTAPRDES FROM ASO_FAC_GES_CAB A, ASO_FAC_GES_DET B WHERE A.NUMMEM = '+QuotedStr('EXP'+DM1.cdsExpLiq.FieldByName('PVSEXPNRO').AsString)
      xSql := 'SELECT A.IDEGESFAL, B.ESTAPRDES FROM ASO_FAC_GES_CAB A, ASO_FAC_GES_DET B WHERE A.NUMMEM = '+QuotedStr('EXP'+DM1.numeroexpediente)
   // Fin: DPP_201208_PRE
      +' AND A.IDEGESFAL = B.IDEGESFAL AND B.ASOID = '+DM1.cdsAsociado.FieldByName('ASOID').AsString;
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      If DM1.cdsQry.FieldByName('ESTAPRDES').AsString = 'POR APLICAR' Then
      Begin
         xSql := 'UPDATE ASO_FAC_GES_DET SET ESTADO = ''13'' WHERE IDEGESFAL = '+QuotedStr(DM1.cdsQry.FieldByName('IDEGESFAL').AsString)+' AND ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString);
         DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      End;
   End;
End;
//Fin: DPP_201207_PRE

// Inicio: SPP_201305_PRE  Procedimiento para exportar a excel
procedure TDM1.ExportaGridExcel(xDataGrid: TwwDBGrid; xFileName: String);
begin
   Screen.Cursor := crHourGlass;
   With xDataGrid, xDataGrid.ExportOptions Do
   Begin
      ExportType := wwgetSYLK;
      FileName := xFileName + '.slk';
      Save;
      If Not (esoClipboard In Options) Then
         ShellExecute(Handle, 'Open', PChar(xDataGrid.exportoptions.Filename),
            Nil, Nil, sw_shownormal);
   End;
   Screen.Cursor := crDefault;

end;
// Fin: SPP_201305_PRE


// Inicio HPC_201505_PRE     : Agregar en Consultas aplicaciones de CCI
procedure TDM1.ResumenCCI(xAsoid: String);
var
  xSQL : String;
begin
  xSql:='Select ''Resumen Aplicado por CCI'' Titulo,  nvl(sum(nvl(monapl,0)),0) TOTCCI, 0.00 SALDO  '
       +  'from COB_APLI_CCI_DET '
       + 'where ASOID='+QuotedStr(xAsoid);
  DM1.cdsRepCCI.Close;
  DM1.cdsRepCCI.DataRequest(xSQL);
  DM1.cdsRepCCI.Open;
end;
// fin  HPC_201505_PRE     : Agregar en Consultas aplicaciones de CCI


// Inicio HPC_201505_PRE     : Agregar en Consultas aplicaciones de CCI
procedure TDM1.DetalleCCI(xAsoid: String);
var
  xSQL : String;
begin
  xSql:='select codaplica, asoid, asotipid, perapl, credid, monapl, percont, flgcont, fecreg, usucrea, numliqben '
       +  'from COB_APLI_CCI_DET '
       + 'where ASOID='+QuotedStr(xAsoid);
  DM1.cdsRepCCIDet.Close;
  DM1.cdsRepCCIDet.DataRequest(xSQL);
  DM1.cdsRepCCIDet.Open;
end;
// Fin HPC_201505_PRE     : Agregar en Consultas aplicaciones de CCI
// INICIO HPC_201509_PRE
(******************************************************************************)
procedure TDM1.FG_CONECTA_CDS(var pxCdsQry : TwwClientDataSet; var pxDsQry : TwwDataSource);
begin
  pxCdsQry := TwwClientDataSet.Create(self);
  pxCdsQry.ProviderName := 'prvSQL';
  pxCdsQry.RemoteServer := DCOM1;
  pxDsQry := TwwDataSource.Create(self);
  pxDsQry.DataSet := pxCdsQry;
end;
(******************************************************************************)
function TDM1.FG_OBTIENE_MENSAJE_ERROR_ORACLE(psCadena: String): string;
var
  xnPos: Integer;
  xsDelimitador : String;
  xsCadena : String;
begin
  xsCadena := psCadena;
  xsDelimitador := '~';
  xnPos:= Pos(xsDelimitador, xsCadena);
  if (xnPos > 0 ) then begin
    Delete(xsCadena, 1, xnPos);
    xnPos:= Pos(xsDelimitador, xsCadena);
    result := Copy(xsCadena, 1, xnPos-1);
   end else begin
    result := psCadena;
   end;
end;
// FIN HPC_201509_PRE

// INICIO HPC_201602_PRE
// FUNCION QUE VALIDA EL FILTRO
function TDM1.FG_PORLIQUIDAR(psAsoid: String): string;
var xsSql : String;
begin
    // INICIO HPC_201603_PRE
    // CAMBIO EN FILTRO
    xsSql := 'SELECT ASOID '
           + '  FROM PVS301 '
           + ' WHERE ASOID = ' + QuotedStr(psAsoid)
           + '   AND PVSESTADO IN (''01'',''05'') ';
    // FIN HPC_201603_PRE
    DM1.cdsQry.Close;
    DM1.cdsQry.DataRequest(xsSql);
    DM1.cdsQry.Open;
    if DM1.cdsQry.fieldbyname('ASOID').AsString <> '' then result := 'S' ELSE result := 'N';

end;
// FIN HPC_201602_PRE

// INICIO HPC_201610_PRE
// EXPORTA A EXCEL
(******************************************************************************)
function TDM1.FG_EXPORTA_XLS(pxDataGrid: TwwDBGrid; psNombreHoja: string) : OleVariant;
var
  xxExcApp: OleVariant;
begin
  xxExcApp := CreateOleObject('Excel.Application');
  xxExcApp.Visible := False;
  xxExcApp.WorkBooks.Add;
  result := FG_EXPORTA_XLS(pxDataGrid, psNombreHoja, xxExcApp);
end;

(******************************************************************************)
function TDM1.FG_EXPORTA_XLS(pxDataGrid: TwwDBGrid; psNombreHoja: string; var pxExcApp: OleVariant) : OleVariant;
var
  xnContador,l: integer;
  xxSheet : Variant;
  xxWorkBook : Variant;
  xxBookMark : TBookmark;
begin
  xxWorkBook := pxExcApp.WorkBooks[1];
  xxWorkBook.Worksheets.Add(After := xxWorkBook.Worksheets[xxWorkBook.Worksheets.Count]);
  xxWorkBook.WorkSheets[xxWorkBook.Worksheets.Count].Name :=  psNombreHoja;
  xxSheet := xxWorkBook.WorkSheets[psNombreHoja];
  l := 1;
  for xnContador := 0 to pxDataGrid.FieldCount - 1 do
      xxSheet.Cells[l,xnContador + 1] := pxDataGrid.DataSource.DataSet.Fields[xnContador].DisplayLabel;

  with pxDataGrid.DataSource do begin
      l := l + 1;
      xxBookMark := DataSet.GetBookmark;
      DataSet.First;
      while not DataSet.EOF do
      begin
        for xnContador := 0 to pxDataGrid.FieldCount - 1 do
           xxSheet.Cells[l,xnContador + 1] := Format('="%s"', [DataSet.Fields[xnContador].AsString]);
        DataSet.Next;
        l := l + 1;
      end;
      DataSet.GotoBookmark(xxBookMark);
  end;
  result := pxExcApp;
end;

// FIN HPC_201610_PRE

// Inicio: HPC_201703_PRE
// Nuevo procedimiento para el calculo de las nivelaciones y devoluciones
// Inicio: HPC_201805_PRE
// Se modifica procedimiento para el calculo de las nivelaciones y devoluciones
procedure TDM1.CalculaNivelacionesDevoluciones(xasoid, xpvsexpnro, xultanomes: String);
Var xSql:String;
    xPeriodoInicio:String;
begin
   DM1.montoNivApo := 0;
   DM1.montoDevApo := 0;
   DM1.cdsNivApo.EmptyDataSet;
   DM1.cdsDevApo.EmptyDataSet;
   xSql := 'DELETE FROM PRE_REG_DEV_NIV WHERE ASOID = '+QuotedStr(xasoid);
   DM1.DCOM1.AppServer.EjecutaSQL(xSql);
   // xSql := 'BEGIN SP_CAL_NIV_DEV_APORTES('+QuotedStr(xasoid)+','+QuotedStr(xpvsexpnro)+', '+QuotedStr(xultanomes)+'); END;';
   If DM1.xCnd = 'R' Then
   Begin
     xSql := 'SELECT ADD_MONTHS(ASOFRESCESE,1) ASOFRESNOM  FROM APO201 WHERE ASOID = '+QuotedStr(xasoid);
     DM1.cdsQry.Close;
     DM1.cdsQry.DataRequest(xSql);
     DM1.cdsQry.Open;
     xSql := 'BEGIN SP_CAL_NIV_DEV_APORTES('+QuotedStr(xasoid)+','+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLTIPBE').AsString)+', '+QuotedStr(DM1.cdsQry.FieldByName('ASOFRESNOM').AsString)
     +','+QuotedStr(DateToStr(FReliquidacionBeneficios.dbdtpfecces.Date))+','+QuotedStr(Copy(DateToStr(FReliquidacionBeneficios.dbdtpfecces.Date),7,4)+Copy(DateToStr(FReliquidacionBeneficios.dbdtpfecces.Date),4,2))
     +',''S''); END;';
   End
   Else
   Begin
     xSql := 'BEGIN SP_CAL_NIV_DEV_APORTES('+QuotedStr(xasoid)+','+QuotedStr(DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString)+', '+QuotedStr(DM1.cdsExpLiq.FieldByName('ASOFRESNOM').AsString)
     // Inicio: HPC_201806_PRE
     // Se corrige error al momento de calcular las devoluciones y/o nivelaciones
     // +','+QuotedStr(DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsString)+','+QuotedStr(Copy(DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsString,1,4)+Copy(DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsString,6,2))
     +','+QuotedStr(DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsString)+','+QuotedStr(Copy(DM1.cdsExpLiq.FieldByName('PVSULTAPO').AsString,1,4)+Copy(DM1.cdsExpLiq.FieldByName('PVSULTAPO').AsString,6,2))
     // Fin: HPC_201806_PRE
     +',''N''); END;';
   End;
   DM1.DCOM1.AppServer.EjecutaSQL(xSql);
   // Se controla Nivelaciones para las reliquidaciones
   If  DM1.xCnd = 'R' Then
   Begin
      xPeriodoInicio := Copy(DM1.cdsAsociado.FieldByName('ASOFRESCESE').AsString,7,4)+Copy(DM1.cdsAsociado.FieldByName('ASOFRESCESE').AsString,4,2);
      xSql := 'SELECT ASOID, ANOMES, ESTADO, CASO, MONTO FROM PRE_REG_DEV_NIV WHERE ASOID = '+QuotedStr(xasoid)+' AND ESTADO = ''NIV'' AND ANOMES >= '+QuotedStr(xPeriodoInicio)
   End
   Else
      xSql := 'SELECT ASOID, ANOMES, ESTADO, CASO, MONTO FROM PRE_REG_DEV_NIV WHERE ASOID = '+QuotedStr(xasoid)+' AND ESTADO = ''NIV''';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;



   While Not DM1.cdsQry.Eof Do
   Begin
      DM1.cdsNivApo.Append;
      DM1.cdsNivApo.FieldByName('ASOID').AsString := DM1.cdsQry.FieldByName('ASOID').AsString;
      DM1.cdsNivApo.FieldByName('TRANSANO').AsString := Copy(DM1.cdsQry.FieldByName('ANOMES').AsString,1,4);
      DM1.cdsNivApo.FieldByName('TRANSMES').AsString := Copy(DM1.cdsQry.FieldByName('ANOMES').AsString,5,2);
      DM1.cdsNivApo.FieldByName('ESTADO').AsString := DM1.cdsQry.FieldByName('ESTADO').AsString;
      DM1.cdsNivApo.FieldByName('MONTO').AsCurrency := DM1.cdsQry.FieldByName('MONTO').AsCurrency;
      DM1.cdsNivApo.FieldByName('CASO').AsString := DM1.cdsQry.FieldByName('CASO').AsString;
      DM1.cdsNivApo.Post;
      DM1.montoNivApo := DM1.montoNivApo + DM1.cdsQry.FieldByName('MONTO').AsFloat;
      DM1.cdsQry.Next;
   End;
   If  DM1.xCnd = 'R' Then
      xSql := 'SELECT ASOID, ANOMES, ESTADO, CASO, MONTO FROM PRE_REG_DEV_NIV WHERE ASOID = '+QuotedStr(xasoid)+' AND ESTADO = ''DEV'' AND ANOMES >= '+QuotedStr(xPeriodoInicio)
   Else
      xSql := 'SELECT ASOID, ANOMES, ESTADO, CASO, MONTO FROM PRE_REG_DEV_NIV WHERE ASOID = '+QuotedStr(xasoid)+' AND ESTADO = ''DEV''';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   While Not DM1.cdsQry.Eof Do
   Begin
      DM1.cdsDevApo.Append;
      DM1.cdsDevApo.FieldByName('ASOID').AsString := DM1.cdsQry.FieldByName('ASOID').AsString;
      DM1.cdsDevApo.FieldByName('TRANSANO').AsString := Copy(DM1.cdsQry.FieldByName('ANOMES').AsString,1,4);
      DM1.cdsDevApo.FieldByName('TRANSMES').AsString := Copy(DM1.cdsQry.FieldByName('ANOMES').AsString,5,2);
      DM1.cdsDevApo.FieldByName('ESTADO').AsString := DM1.cdsQry.FieldByName('ESTADO').AsString;
      DM1.cdsDevApo.FieldByName('MONTO').AsCurrency := DM1.cdsQry.FieldByName('MONTO').AsCurrency;
      DM1.cdsDevApo.FieldByName('CASO').AsString := DM1.cdsQry.FieldByName('CASO').AsString;
      DM1.cdsDevApo.Post;
      DM1.montoDevApo := DM1.montoDevApo + DM1.cdsQry.FieldByName('MONTO').AsCurrency;
      DM1.cdsQry.Next;
   End;
end;
// Fin: HPC_201805_PRE
// Fin: HPC_201703_PRE

// Inicio HPC_201801_PRE
// Generación de Reporte de Cesantes sin Liquidación
Procedure TDM1.HojaExcelCesantesSinLiqui(Tit: String; TDs: TDataSource; TDb: TDBGrid);
Var
   Lcid, C, CH, CH1, I, W, X, Y, TotHoja: Integer;
   Bk: TBookmarkStr;
   Tabla: Variant;
   L, A: OleVariant;
   HH: Extended;
   F: TFieldDef;
Begin
   If Not TDs.DataSet.Active Then Exit;
   If TDs.DataSet.RecordCount = 0 Then Exit;

   Lcid := GetUserDefaultLCID;
   C := TDb.Columns.Count;
   CH := 1;
   If TDs.DataSet.RecordCount > 20100 Then
   Begin
      HH := TDs.DataSet.RecordCount / 20100;
      CH := Trunc(HH);
      If Frac(HH) > 0 Then CH := CH + 1;
   End;

   ExcelApp.Visible[Lcid] := True;
   ExcelApp.Caption := 'Consultas en EXCEL';
   ExcelBook.ConnectTo(ExcelApp.Workbooks.Add(1, Lcid));
   If CH > 1 Then
   Begin
      ExcelBook.Worksheets.Add(NULL, NULL, (CH - 1), NULL, Lcid);
      For I := 1 To CH Do
      Begin
         WS.ConnectTo(ExcelBook.Worksheets[I] As _Worksheet);
         WS.Name := Tit + '_' + IntToStr(I);
      End;
   End;

   WS.ConnectTo(ExcelBook.Worksheets[1] As _Worksheet);
   WS.Activate(Lcid);
   If CH = 1 Then WS.Name := Tit;
   ExcelApp.ScreenUpdating[Lcid] := False;
   For X := 1 To CH Do
   Begin
      WS.ConnectTo(ExcelBook.Worksheets[X] As _Worksheet);
      WS.Activate(Lcid);
      For I := 0 To (C - 1) Do
      Begin
         L := WS.Cells.Item[1, I + 1];
         WS.Range[L, L].Value2 := TDb.Columns[I].Title.Caption;
      End;
   End;

   WS.ConnectTo(ExcelBook.Worksheets[1] As _Worksheet);
   WS.Activate(Lcid);

   CH1 := 1;
   W := 2;
   I := 1;
   Y := 1;
   TotHoja := 0;
   TDs.DataSet.DisableControls;
   Bk := TDs.DataSet.Bookmark;

   Tabla := VarArrayCreate([1, 5000, 0, C], varVariant);
   TDs.DataSet.First;
   While Not TDs.DataSet.Eof Do
   Begin
      For X := 0 To (C - 1) Do
      Begin
         F:= TDs.DataSet.FieldDefs.Items[X];
         If ((F.DataType =  ftDate) or
            (F.DataType =  ftDateTime) or
            (F.DataType =  ftTimeStamp)) AND
            (Length(TRIM(TDs.DataSet.Fields[X].AsString))<>0) Then
            Begin
              Tabla[Y, X] := ''''+TDs.DataSet.Fields[X].AsString;
            end
         Else If F.DataType =  ftFMTBcd Then
            Tabla[Y, X] := TDs.DataSet.Fields[X].AsString
         Else
            Tabla[Y, X] := ''''+TDs.DataSet.Fields[X].AsString;
      end;
      If Y = 5000 Then
      Begin
         L := 'A' + IntToStr(W);
         WS.Range[L, WS.Cells.Item[I + 1, C]].Value2 := Tabla;
         Try
            Tabla := Unassigned;
         Finally
            Tabla := VarArrayCreate([1, 5000, 0, C], varVariant);
         End;

         Y := 0;
         W := I + 2;
      End;
      Inc(Y, 1);
      Inc(I, 1);
      Inc(TotHoja, 1);
      If TotHoja = 20100 Then
      Begin
         L := 'A' + IntToStr(W);
         WS.Range[L, WS.Cells.Item[I, C]].Value2 := Tabla;

         Try
            Tabla := Unassigned;
         Finally
            Tabla := VarArrayCreate([1, 5000, 0, C], varVariant);
         End;

         CH1 := CH1 + 1;
         WS.ConnectTo(ExcelBook.Worksheets[CH1] As _Worksheet);
         WS.Activate(Lcid);

         Y := 1;
         W := 2;
         I := 1;
         TotHoja := 0;
      End;
      Application.ProcessMessages;
      TDs.DataSet.Next;
   End;
   CH1 := I;
   Try
      WS.Range['A' + IntToStr(W), WS.Cells.Item[CH1, C]].Value2 := Tabla;
   Finally
      Tabla := Unassigned;
   End;

   For X := 1 To CH Do
   Begin
      WS.ConnectTo(ExcelBook.Worksheets[X] As _Worksheet);
      WS.Activate(Lcid);

      SetLength(FormatCel, C + 1);
      FormatosCeldas(C, TDs);
      For I := 1 To C Do
      Begin
         L := WS.Cells.Item[1, I];
         WS.Range[L, L].EntireColumn.NumberFormat := FormatCel[I];
      End;

      For I := 0 To (C - 1) Do
      Begin
         L := WS.Cells.Item[1, I + 1];
         Y := TDs.DataSet.Fields[I].DisplayWidth;
         If Length(TDb.Columns[I].Title.Caption) > Y Then
            Y := Length(TDb.Columns[I].Title.Caption);
         If Y>=255 Then Y:=243;
         WS.Range[L, L].EntireColumn.ColumnWidth := Y + 2;
         If TDb.Columns[I].Alignment = taLeftJustify Then A := 2;
         If TDb.Columns[I].Alignment = taCenter Then A := 3;
         If TDb.Columns[I].Alignment = taRightJustify Then A := 4;
         WS.Range[L, L].EntireColumn.HorizontalAlignment := A;
      End;

      L := WS.Cells.Item[1, C];
      WS.Range['A1', L].HorizontalAlignment := 3;
      WS.Range['A1', L].Interior.Color := clMaroon;
      WS.Range['A1', L].Font.Color := clWhite;
      WS.Range['A1', L].Font.Bold := True;

      If CH = 1 Then
         W := TDs.DataSet.RecordCount + 1
      Else
         If (CH > 1) And (X < CH) Then
            W := 15101
         Else
            If (CH > 1) And (X = CH) Then W := CH1;

      WS.PageSetup.PrintGridlines := True;
      WS.PageSetup.PrintTitleRows := '1:1';

      WS.DefaultInterface.Set_DisplayAutomaticPageBreaks(Lcid, True);
   End;

   WS.ConnectTo(ExcelBook.Worksheets[1] As _Worksheet);
   WS.Activate(Lcid);

   ExcelApp.ScreenUpdating[Lcid] := True;

   TDs.DataSet.EnableControls;
   TDs.DataSet.Bookmark := Bk;
End;
// Fin HPC_201801_PRE

// Inicio: HPC_201809_PRE
// Nuevas funciones para control de fotos en captura RENIEC
function TDM1.FormatoEntero(xTexto: String): String;
begin
   Try
      Result := FormatFloat('##########', DM1.Valores(xTexto));
   Except
   End;
end;

procedure TDM1.BorraFotos;
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
   nFiles := FindFirst('C:\SOLEXES\*.TIF', faAnyFile, search);
   While nFiles = 0 Do
   Begin
      SysUtils.DeleteFile('C:\SOLEXES\' + Search.Name);
      nFiles := FindNext(Search);
   End;
   FindClose(Search);
end;


function TDM1.DevUbigeo(Departamento, Provincia, Distrito: String): String;
Var
  xSql, codubigeo:String;
begin
  xSql := 'SELECT DPTOID FROM APO158 WHERE DPTODES = '+QuotedStr(Trim(Departamento));
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  codubigeo := DM1.cdsQry.FieldByName('DPTOID').AsString;
  xSql := 'SELECT CIUDID FROM APO123 WHERE DPTOID = '+QuotedStr(codubigeo)+' AND CIUDDES = '+QuotedStr(Trim(Provincia));
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  codubigeo := DM1.cdsQry.FieldByName('CIUDID').AsString;
  xSql := 'SELECT ZIPID FROM APO122 WHERE CIUDID = '+QuotedStr(codubigeo)+' AND ZIPDES = '+QuotedStr(Trim(Distrito));
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  codubigeo := DM1.cdsQry.FieldByName('ZIPID').AsString;
  Result := codubigeo;
end;

function TDM1.DevDesDirecc(xdni: string): String;
Var
   xsql, xdireccion:String;
begin
   xSql := 'SELECT DIRECCION, PREDESURBAN, DESURBAN, PREDESDIRECC, DESDIRECC, NUMDIRECC, DESETAPA, PRECODBLOCK, PREDESBLOCK, PREDESINTER, DESINTER, DESMANZA, DESLOTE FROM PRE_INF_RENIEC WHERE DNI = '+QuotedStr(xdni);
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xsql);
   DM1.cdsQry.Open;
   xdireccion := '';
   If DM1.cdsQry.FieldByName('DIRECCION').AsString <> '' Then
         xdireccion := DM1.cdsQry.FieldByName('DIRECCION').AsString
      Else
      Begin
         // Urbanización
         If (DM1.cdsQry.FieldByName('PREDESURBAN').AsString <> '--') And (Trim(DM1.cdsQry.FieldByName('PREDESURBAN').AsString) <> '') Then
            xdireccion := Trim(DM1.cdsQry.FieldByName('PREDESURBAN').AsString);
         If (DM1.cdsQry.FieldByName('DESURBAN').AsString <> '--') And (Trim(DM1.cdsQry.FieldByName('DESURBAN').AsString) <> '') Then
         Begin
            If Trim(xdireccion) <> '' Then xdireccion := xdireccion + ' ';
            xdireccion := xdireccion + Trim(DM1.cdsQry.FieldByName('DESURBAN').AsString);
         End;
         // Dirección
         If (DM1.cdsQry.FieldByName('PREDESDIRECC').AsString <> '--') And (Trim(DM1.cdsQry.FieldByName('PREDESDIRECC').AsString) <> '') Then
         Begin
            If Trim(xdireccion) <> '' Then xdireccion := xdireccion + ' / ';
            xdireccion := xdireccion + Trim(DM1.cdsQry.FieldByName('PREDESDIRECC').AsString);
         End;
         If (DM1.cdsQry.FieldByName('DESDIRECC').AsString <> '--') And (Trim(DM1.cdsQry.FieldByName('DESDIRECC').AsString) <> '') Then
         Begin
            If Trim(xdireccion) <> '' Then xdireccion := xdireccion + ' ';
            xdireccion := xdireccion + DM1.cdsQry.FieldByName('DESDIRECC').AsString;
         End;
         If (DM1.cdsQry.FieldByName('NUMDIRECC').AsString <> '--') And (Trim(DM1.cdsQry.FieldByName('NUMDIRECC').AsString) <> '') Then
         Begin
            If Trim(xdireccion) <> '' Then xdireccion := xdireccion + ' # ';
            xdireccion := xdireccion + DM1.cdsQry.FieldByName('NUMDIRECC').AsString;
         End;
         // Etapa
         If (DM1.cdsQry.FieldByName('DESETAPA').AsString <> '--') And (Trim(DM1.cdsQry.FieldByName('DESETAPA').AsString) <> '') Then
         Begin
            If Trim(xdireccion) <> '' Then xdireccion := xdireccion + ' / Etapa:';
            xdireccion := xdireccion + DM1.cdsQry.FieldByName('DESETAPA').AsString;
         End;
         If (DM1.cdsQry.FieldByName('PRECODBLOCK').AsString <> '--') And (Trim(DM1.cdsQry.FieldByName('PRECODBLOCK').AsString) <> '') Then
         Begin
            If Trim(xdireccion) <> '' Then xdireccion := xdireccion + ' / ';
            xdireccion := xdireccion + DM1.cdsQry.FieldByName('PRECODBLOCK').AsString;
         End;
         If (DM1.cdsQry.FieldByName('PREDESBLOCK').AsString <> '--') And (Trim(DM1.cdsQry.FieldByName('PREDESBLOCK').AsString) <> '') Then
         Begin
            If Trim(xdireccion) <> '' Then xdireccion := xdireccion + ' ';
            xdireccion := xdireccion + ' ' + DM1.cdsQry.FieldByName('PREDESBLOCK').AsString;
         End;
         // Interior
         If (DM1.cdsQry.FieldByName('PREDESINTER').AsString <> '--') And (Trim(DM1.cdsQry.FieldByName('PREDESINTER').AsString) <> '') Then
         Begin
            If Trim(xdireccion) <> '' Then xdireccion := xdireccion + ' / ';
            xdireccion := xdireccion + DM1.cdsQry.FieldByName('PREDESINTER').AsString;
         End;
         If (DM1.cdsQry.FieldByName('DESINTER').AsString <> '--') And (Trim(DM1.cdsQry.FieldByName('DESINTER').AsString) <> '') Then
         Begin
            If Trim(xdireccion) <> '' Then xdireccion := xdireccion + ' ';
            xdireccion := xdireccion + DM1.cdsQry.FieldByName('DESINTER').AsString;
         End;
         // Manzana - Lote
         If (DM1.cdsQry.FieldByName('DESMANZA').AsString <> '--') And (Trim(DM1.cdsQry.FieldByName('DESMANZA').AsString) <> '') Then
         Begin
            If Trim(xdireccion) <> '' Then xdireccion := xdireccion + ' / ';
            xdireccion := xdireccion + ' Mz. '+DM1.cdsQry.FieldByName('DESMANZA').AsString;
         End;
         If (DM1.cdsQry.FieldByName('DESLOTE').AsString <> '--') And (Trim(DM1.cdsQry.FieldByName('DESLOTE').AsString) <> '') Then
            xdireccion := xdireccion + ' Lt. '+DM1.cdsQry.FieldByName('DESLOTE').AsString;
      End;
      Result := xdireccion;
end;

procedure TDM1.CargaImagenesBen(xAsodni: String);
Var xSql:String;
begin
   DM1.Jpg := Nil;
   DM1.Stream := Nil;
   DM1.JpgFirma := Nil;
   DM1.StreamFirma := Nil;
   xSql := 'SELECT DNI, FOTO, FIRMA FROM PRE_INF_RENIEC WHERE DNI = '+QuotedStr(xAsodni)+' ORDER BY FECACT DESC';
   DM1.cdsTipoMoneda.Close;
   DM1.cdsTipoMoneda.DataRequest(xSql);
   DM1.cdsTipoMoneda.Open;
   Try
      DM1.Stream := TMemoryStream.Create;
      TBlobField(DM1.cdsTipoMoneda.FieldByName('FOTO')).SaveToStream(DM1.Stream);
      DM1.StreamFirma := TMemoryStream.Create;
      TBlobField(DM1.cdsTipoMoneda.FieldByName('FIRMA')).SaveToStream(DM1.StreamFirma);
      If DM1.Stream.Size > 0 Then
      Begin
         DM1.Jpg := TJpegImage.Create;
         DM1.Stream.Position := 0;
         DM1.Jpg.LoadFromStream(DM1.Stream);
      End
      Else
         DM1.Jpg := Nil;
      If DM1.StreamFirma.Size > 0 Then
      Begin
         DM1.jpgFirma := TJpegImage.Create;
         DM1.StreamFirma.Position := 0;
         DM1.jpgFirma.LoadFromStream(DM1.StreamFirma);
      End
      Else
         DM1.jpgFirma := Nil;
   Except
      DM1.Jpg := Nil;
      DM1.jpgFirma := Nil;
   End;
end;
// Fin: HPC_201809_PRE

End.


