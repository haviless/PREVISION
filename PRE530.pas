Unit PRE530;
// Inicio Uso Estándares   :  01/08/2011
// Unidad                  :  PRE530.pas
// Formulario              :  FHojaTrabajoCampo.pas
// Fecha de Creación       :  03/11/2011
// Autor                   :  DFERNANDEZ
// Objetivo                :  Mostrar el listado de los asociados sin CADAP (DO y VO)
// Actualizaciones:
// HPC             FECHA       AUTOR      DESCRIPCION
// -------------------------------------------------------------------------------------------------------------------------
// HPC_201114_PRE  03/11/2011  DFERNANDEZ Creación del Formulario
// DPP_201202_PRE : Se realiza el pase a produccion a partir del pase HPC_201114_PRE
// HPC_201301_PRE : Se agrega quita la condición de mostrar los asociados tipo DO que no firmaron la carta de descuento
// SPP_201302_PRE : Se realiza el pase a producción a partir del HPC_201301_PRE
// HPC_201305_PRE : Se añade campo de EMAIL.
// SPP_201306_PRE : Se realiza el pase a producción a partir del HPC_201305_PRE
// HPC_201307_PRE : Se añade imagen del nuevo logo institucional
// SPP_201401_PRE : Se realiza el pase a producción a partir del pase HPC_201307_PRE
// HPC_201402_PRE : Corregie el orden de las columnas del reporte
// HPC_201402_PRE : Mejorar la busqueda de asociados
// SPP_201403_PRE : Se realiza el pase a producción a partir del pase HPC_201402_PRE
// SPP_201404_PRE : Se realiza el pase a producción a partir del pase HPC_201403_PRE
// HPC_201404_PRE : Se adiciona un nuevo filtro que perimite obtener docentes aportantes y/o docentes regulares.  
// SPP_201405_PRE : Se realiza el pase a producción a partir del pase HPC_201404_PRE  
// HPC_201501_PRE : Optimización y mejoras a la generación de la Hoja de Trabajo de Campo
// HPC_201502_PRE : Optimización de la consulta Hoja de Trabajo de Campo.
// HPC_201602_PRE : DESHABILITAR EL CRUCE CON EL PADRON MINEDU EN LA HOJA DE TRABAJO DE CAMPO
// HPC_201606_PRE : Se cambia solo para la hoja de trabajo los asociados DO po VO si no tiene aportes ni autorización de descuento
// HPC_201811_PRE : Funcionalidad de Contactabilidad añadida

// Inicio: SPP_201403_PRE    
Interface
Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, wwdblook, StdCtrls, ExtCtrls, Buttons, Wwdbdlg, Grids, DBGrids,
   Wwdbigrd, Wwdbgrid, ppCtrls, ppBands, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppEndUsr,
   ppParameter, ppVar, ppStrtch, ppMemo,
   // Inicio: SPP_201404_PRE
    series,  Chart, ppChrt, jpeg,ppSubRpt, TeeProcs, TeEngine,ppChrtDP, 
   // Fin: SPP_201404_PRE
// Inicio HPC_201811_PRE : Funcionalidad de Contactabilidad añadida
    db, wwdbdatetimepicker, Mask,wwExport,shellapi, wwDataInspector;
// Fin  HPC_201811_PRE : Funcionalidad de Contactabilidad añadida

Type
   TFHojaTrabajoCampo = Class(TForm)
      grbRepfPago: TGroupBox;
      BitPrint: TBitBtn;
      BitExporta: TBitBtn;
      btnProcesar: TBitBtn;
      dbgprevio: TwwDBGrid;
      ppbdAutxCenEdu: TppBDEPipeline;
      pprAutxCenEdu: TppReport;
      ppDesigner1: TppDesigner;
      ppParameterList1: TppParameterList;
      Label2: TLabel;
      gbControles: TGroupBox;
      btnCerrar: TBitBtn;
    dblcRegPension: TwwDBLookupCombo;
    Label16: TLabel;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    rbDomicilio: TRadioButton;
    rbColegio: TRadioButton;
    dblcddptoid: TwwDBLookupComboDlg;
    EdtDpto: TEdit;
    dblcdprovid: TwwDBLookupComboDlg;
    EdtProv: TEdit;
    dblcdDistId: TwwDBLookupComboDlg;
    edtDist: TEdit;
    Label10: TLabel;
    lblContador: TLabel;
    dtgExcel: TwwDBGrid;
// Inicio HPC_201811_PRE : Funcionalidad de Contactabilidad añadida
    gbTipoCar: TGroupBox;
    cbDo: TCheckBox;
    cbVo: TCheckBox;
    cbCe: TCheckBox;
    cbCo: TCheckBox;
    pprAutxDom: TppReport;
    ppParameterList2: TppParameterList;
    ppbdAutxDom: TppBDEPipeline;
    ppDesigner2: TppDesigner;    // SPP_201401_PRE
    // Fin: SPP_201306_PRE
    // Fin: SPP_201302_PRE
    // Inicio: SPP_201404_PRE
    lblFirmo: TLabel;
    mdesRegPen: TMaskEdit;
    cbCadaps: TCheckBox;
	// Inicio SPP_201405_PRE 
    rdgApoReg: TRadioGroup;
//Inicio: HPC:201501_PRE
    dblcFallecidos: TwwDBLookupCombo;
    lblFallecidos: TLabel;
    dblcFirmo: TwwDBLookupCombo;
    wwDataInspector1: TwwDataInspector;
    wwDataInspector2: TwwDataInspector;
    wwDataInspector3: TwwDataInspector;
// Fin  HPC_201811_PRE : Funcionalidad de Contactabilidad añadida
    ppHeaderBand1: TppHeaderBand;
    ppltitulo: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel22: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppDBText5: TppDBText;
    ppLabel32: TppLabel;
    ppImage1: TppImage;
    ppDetailBand1: TppDetailBand;
    ppLine1: TppLine;
    ppLine14: TppLine;
    ppLine16: TppLine;
    ppLine18: TppLine;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLine28: TppLine;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppLine5: TppLine;
    ppLine11: TppLine;
    ppDBText1: TppDBText;
    ppLine15: TppLine;
    ppDBText4: TppDBText;
    ppDBText6: TppDBText;
    ppLine17: TppLine;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText12: TppDBText;
    ppLine20: TppLine;
    ppDBText13: TppDBText;
// Inicio HPC_201811_PRE : Funcionalidad de Contactabilidad añadida
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
// Fin  HPC_201811_PRE : Funcionalidad de Contactabilidad añadida
    ppSummaryBand1: TppSummaryBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLabel25: TppLabel;
    ppLabel27: TppLabel;
    ppDBText3: TppDBText;
    ppLabel21: TppLabel;
    ppLabel2: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel18: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppLabel26: TppLabel;
    ppLabel28: TppLabel;
    ppDBText2: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppLabel11: TppLabel;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppDBText11: TppDBText;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel3: TppLabel;
    ppLine4: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine27: TppLine;
    ppLine29: TppLine;
    ppLabel9: TppLabel;
    ppLabel17: TppLabel;
    ppLine3: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLabel29: TppLabel;
    ppLine9: TppLine;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppDBMemo1: TppDBMemo;
    ppLabel30: TppLabel;
    ppDBMemo2: TppDBMemo;
    ppLine10: TppLine;
    ppLabel7: TppLabel;
    ppLabel33: TppLabel;
    ppLine8: TppLine;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel13: TppLabel;
    ppLabel16: TppLabel;
    ppLine19: TppLine;
    ppLabel8: TppLabel;
    ppLabel10: TppLabel;
    ppLine2: TppLine;
    ppLabel12: TppLabel;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLabel31: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppLabel4: TppLabel;
// Inicio HPC_201811_PRE : Funcionalidad de Contactabilidad añadida
//    gbTipoCar: TGroupBox;
//    cbDo: TCheckBox;
//    cbVo: TCheckBox;
//    cbCe: TCheckBox;
//    cbCo: TCheckBox;
//    pprAutxDom: TppReport;
//    ppParameterList2: TppParameterList;
//    ppbdAutxDom: TppBDEPipeline;
//    ppDesigner2: TppDesigner;
// Fin  HPC_201811_PRE : Funcionalidad de Contactabilidad añadida
    ppHeaderBand2: TppHeaderBand;
    ppLabel1: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppLabel37: TppLabel;
    ppSystemVariable6: TppSystemVariable;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppDBText14: TppDBText;
    ppLabel40: TppLabel;
    ppImage2: TppImage;
    ppDetailBand2: TppDetailBand;
    ppLine21: TppLine;
    ppLine30: TppLine;
    ppLine31: TppLine;
    ppLine32: TppLine;
    ppLine33: TppLine;
    ppLine34: TppLine;
    ppLine35: TppLine;
    ppLine36: TppLine;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBCalc4: TppDBCalc;
    ppLine37: TppLine;
    ppLine38: TppLine;
    ppDBText17: TppDBText;
    ppLine39: TppLine;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppLine40: TppLine;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppLine41: TppLine;
    ppDBText23: TppDBText;
// Inicio HPC_201811_PRE : Funcionalidad de Contactabilidad añadida
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
// Fin  HPC_201811_PRE : Funcionalidad de Contactabilidad añadida
    ppSummaryBand2: TppSummaryBand;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppDBText24: TppDBText;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppDBText25: TppDBText;
    ppLabel53: TppLabel;
    ppLine42: TppLine;
    ppLine43: TppLine;
    ppLine44: TppLine;
    ppLine45: TppLine;
    ppLine46: TppLine;
    ppLine47: TppLine;
    ppLine48: TppLine;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLine49: TppLine;
    ppLine50: TppLine;
    ppLine51: TppLine;
    ppLabel56: TppLabel;
    ppLine52: TppLine;
    ppLine53: TppLine;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLine54: TppLine;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLine55: TppLine;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLine56: TppLine;
    ppLabel69: TppLabel;
    ppGroupFooterBand6: TppGroupFooterBand;    // SPP_201401_PRE
    // Fin: SPP_201306_PRE
    // Fin: SPP_201302_PRE
    // Inicio: SPP_201404_PRE
// Inicio HPC_201811_PRE : Funcionalidad de Contactabilidad añadida
//    lblFirmo: TLabel;
//    mdesRegPen: TMaskEdit;
//    cbCadaps: TCheckBox;
	// Inicio SPP_201405_PRE 
//    rdgApoReg: TRadioGroup;
//Inicio: HPC:201501_PRE
//    dblcFallecidos: TwwDBLookupCombo;
//    lblFallecidos: TLabel;
//    dblcFirmo: TwwDBLookupCombo;
    ppDBText30: TppDBText;
    ppLine57: TppLine;
    ppDBText31: TppDBText;
    ppLine58: TppLine;
    ppLine59: TppLine;
    ppLine60: TppLine;
// Fin   HPC_201811_PRE : Funcionalidad de Contactabilidad añadida
//Fin: HPC:201501_PRE
	// Fin SPP_201405_PRE 
    // Fin: SPP_201404_PRE

      Procedure FormShow(Sender: TObject); 
      Procedure BitExportaClick(Sender: TObject);
      Procedure BitPrintClick(Sender: TObject); 
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure btnCerrarClick(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormActivate(Sender: TObject);
      Procedure btnProcesarClick(Sender: TObject);
      
    procedure dblcddptoidChange(Sender: TObject);
    procedure dblcddptoidExit(Sender: TObject);
    procedure dblcdprovidChange(Sender: TObject);
    procedure dblcdprovidExit(Sender: TObject);
    procedure dblcdDistIdChange(Sender: TObject);
    procedure rbDomicilioClick(Sender: TObject);
    procedure rbColegioClick(Sender: TObject);
    procedure dblcRegPensionChange(Sender: TObject);
    // Inicio: SPP_201404_PRE
//Inicio: HPC:201501_PRE
    //procedure dblcFirmoChange(Sender: TObject);
//Fin: HPC:201501_PRE
    // Fin: SPP_201404_PRE
    
   Private
    { Private declarations }         
   Public
    { Public declarations }
   End;

Var
   FHojaTrabajoCampo: TFHojaTrabajoCampo;

Implementation

Uses PREDM;

{$R *.dfm}

(******************************************************************************)

Procedure TFHojaTrabajoCampo.FormShow(Sender: TObject);
Var
   xSQL: String;
Begin 
   dm1.cdsQry10.Close;
   dbgprevio.DataSource := dm1.dsQry10;
   ppbdAutxCenEdu.DataSource := dm1.dsQry10;
End;

(******************************************************************************)
//Inicio: HPC_201502_PRE
Procedure TFHojaTrabajoCampo.btnProcesarClick(Sender: TObject);

   Var
      xSQL: String;
// Inicio HPC_201811_PRE : Funcionalidad de Contactabilidad añadida
      xSQL01, xSQL02, xSQL03, xSQL04: String;
// Fin  HPC_201811_PRE : Funcionalidad de Contactabilidad añadida
      xSQL2: String;
      xSQLWhere: String;
      xSQLOrderBy: String;
      xSQLWhere2: String;
      xSQLOrderBy2: String;
      xSqlInsert: String;
      xDo,xVo,xCe,xCo :String;
//Inicio HPC_201606_PRE --Variables
      xDo2,xVo2,xCe2,xCo2 :String;
//Final HPC_201606_PRE
      // Inicio SPP_201405_PRE
      xWhereAct: String;
      // Fin SPP_201405_PRE
Begin
   xDo:='null';
   xVo:='null';
   xCe:='null';
   xCo:='null';
//Inicio HPC_201606_PRE --Variables
   xDo2:='null';
   xVo2:='null';
   xCe2:='null';
   xCo2:='null';
//Final HPC_201606_PRE
    //Validacion
      If (trim(EdtDpto.Text) = '' ) Then
        Begin
               showmessage('Seleccione un Departamento..!!!');
               exit;
        end;
      Screen.Cursor := crHourGlass;

      // Inicio SPP_201405_PRE

      If rdgApoReg.ItemIndex>0 Then
         Begin
            If (cbCo.Checked) Then
               Begin
                  Screen.Cursor := crDefault;
                  MessageDlg('El Criterio: Aportante y/o Docente Regular, solo aplica a DO,CE y VO !!!', mtInformation, [mbOk], 0);
                  Exit;
               End;
         End;

      Case rdgApoReg.ItemIndex Of
           0: xWhereAct:=' ';
           1: xWhereAct:=' AND NVL(UNIV.ASOAPTSER,''N'')=''S''  ';
           2: xWhereAct:=' AND NVL(UNIV.ASOAPTSER,''N'')=''N''  ';
      End;

      // Fin SPP_201405_PRE

      if rbColegio.Checked = true then
      begin
         //Nueva consulta para obtener solo los colegios agrupados que tengan al menos una firma de CADAPS
         if cbCadaps.Checked then  //cbCadaps.Checked
         begin
             //Consulta para obtener los colegios no tienen niguna firma de CADAPS. Se insertan en una tabla fisica temporal
             xSQL2:=' SELECT DEP||PROV||DIST||CPO_CEN_EDUCATIVO||CENTRO_EDUCATIVO CAMPO FROM ('
+' SELECT '
+'       NVL(DEP.DPTODES, ''Z:DEP. NO UBICADA'') DEP,'
+'       NVL(PROV.CIUDDES, ''Z:PROV. NO UBICADA'') PROV,'
+'       NVL(DIST.ZIPABR, ''Z:DIST. NO UBICADA'') DIST,'
+'       UNIV.CPO_CEN_EDUCATIVO, '
+'       UNIV.NIV_CEN_EDUCATIVO,'
+'       UNIV.CENTRO_EDUCATIVO,'
+'       UNIV.AUTORIZO_DSCTO,'
+'       CASE WHEN UNIV.AUTORIZO_DSCTO=''N'' THEN ''1'' ELSE ''0'' END FLG'
+'  FROM (SELECT X.ZIPID,'
+'               X.UBIGEO_DIR,'
+'               NVL(CENPO, ''Z:CPO. NO UBICADA'') CPO_CEN_EDUCATIVO,'
+'               NVL(NIVEDU_DES, ''Z:NIV_CEN. NO UBICADA'') NIV_CEN_EDUCATIVO,'
+'               NVL(NOMCENEDU, ''Z:C.E. NO UBICADA'') CENTRO_EDUCATIVO,'
+'               NVL(DIREC, ''Z:DIR_CE. NO UBICADA'') DIR_CEN_EDUCATIVO,'
+'               X.ASOAPENOM APELLIDOS_NOMBRES,'
+'               X.ASODNI,'
+'               AUTDESAPO AUTORIZO_DSCTO,'
+'               ASOID,'
+'               SINFIRMA,'
+'               0 NUMCOL,'
+'               X.ASOTIPID,'
+'               REGPENID,'
+'               ASODIR,'
+'               ASODIR2,'
+'               ASOTELF1,'
+'               ASOEMAIL,'
+'               ASOFECNAC,'
+'               X.FALLECIDO,'
+'               ASOAPTSER'
+'          FROM (SELECT B.ZIPID,'
+'                       A.UBIGEO_DIR,'
+'                       B.ASOAPENOM,'
+'                       NVL(B.AUTDESAPO, ''N'') AUTDESAPO,'
+'                       A.NOMCENEDU,'
+'                       A.CENPO,'
+'                       A.DIREC,'
+'                       A.NIVEDU_DES,'
+'                       B.ASODNI,'
+'                       B.ASOID,'
+'                       CASE'
+'                         WHEN NVL(AUTDESAPO, ''N'') = ''N'' THEN'
+'                          1'
+'                         ELSE'
+'                          0'
+'                       END SINFIRMA,'
+'                       B.ASOTIPID,'
+'                       trim(B.ASODIR) ASODIR,'
+'                       B.ASODIR ASODIR2,'
+'                       B.ASOTELF1,'
+'                       B.ASOEMAIL,'
+'                       B.ASOFECNAC,'
+'                       B.REGPENID,'
+'                       B.FALLECIDO,'
+'                       B.ASOAPTSER'
+'                  FROM (SELECT X.CENEDUID,'
+'                               X.UBIGEO_DIR,'
+'                               X.NOMCENEDU,'
+'                               X.CENPO,'
+'                               X.DIREC,'
+'                               Y.NIVEDU_DES'
+'                          FROM ASO_CEN_EDU X, NIV_CEN_EDU Y'
+'                         WHERE X.NIVEDU_ID = Y.NIVEDU_ID(+)) A,'
+'                       APO201 B'
+'                 WHERE B.CENEDUID =A.CENEDUID(+) '
+'                   AND SUBSTR(A.UBIGEO_DIR, 1, 2) = '+ QuotedStr(dblcddptoid.Text)
+'                UNION ALL'
+'                SELECT B.ZIPID,'
+'                       A.UBIGEO_DIR,'
+'                       B.ASOAPENOM,'
+'                       NVL(B.AUTDESAPO, ''N'') AUTDESAPO,'
+'                       A.NOMCENEDU,'
+'                       A.CENPO,'
+'                       A.DIREC,'
+'                       A.NIVEDU_DES,'
+'                       B.ASODNI,'
+'                       B.ASOID,'
+'                       CASE'
+'                         WHEN NVL(AUTDESAPO, ''N'') = ''N'' THEN'
+'                          1'
+'                         ELSE'
+'                          0'
+'                       END SINFIRMA,'
+'                       B.ASOTIPID,'
+'                       B.ASODIR ASODIR,'
+'                       B.ASODIR ASODIR2,'
+'                       B.ASOTELF1,'
+'                       B.ASOEMAIL,'
+'                       B.ASOFECNAC,'
+'                       B.REGPENID,'
+'                       B.FALLECIDO,'
+'                       B.ASOAPTSER'
+'                  FROM (SELECT X.CENEDUID,'
+'                               X.UBIGEO_DIR,'
+'                               X.NOMCENEDU,'
+'                               X.CENPO,'
+'                               X.DIREC,'
+'                               Y.NIVEDU_DES'
+'                          FROM ASO_CEN_EDU X, NIV_CEN_EDU Y'
+'                         WHERE X.NIVEDU_ID = Y.NIVEDU_ID(+)) A,'
+'                       ASO_NUE_CLI B'
+'                 WHERE B.CENEDUID =A.CENEDUID(+) '
+'                   AND NVL(B.AUTDESAPO, ''N'') = ''N'''
+'                   AND B.FEC_AUT_CLI IS NULL'
+'                   AND B.ACTARCREN = ''S'''
+'                   AND SUBSTR(A.UBIGEO_DIR, 1, 2) = '+ QuotedStr(dblcddptoid.Text)
+'                   AND NOT EXISTS'
// INICIO HPC_201602_PRE
// COMENTAR CONSULTA DE BASE DE DATOS
+'                 (SELECT 1 FROM APO201 WHERE ASOID = B.ASOID)) X /*,'
+'               (SELECT ASODNI, MAX(TIPSER) TIPSER'
+'                  FROM ASO_PAD_HIS'
+'                 GROUP BY ASODNI) Y'
+'         WHERE X.ASODNI = Y.ASODNI(+)'
+'           AND NVL(Y.TIPSER, 01) IN (01, 08)*/) UNIV'
// FIN HPC_201602_PRE
+'  LEFT JOIN (SELECT ASOID,'
+'                    SITACT,'
+'                    ROW_NUMBER() OVER(PARTITION BY ASOID ORDER BY ASOID, FREG DESC) DRK'
+'               FROM APO206) B2 ON B2.DRK = 1'
+'                              AND UNIV.ASOID = B2.ASOID'
+'  LEFT JOIN ASO_PAD_SIT_ASO SIT ON SIT.COD_MAE = 02'
+'                               AND B2.SITACT = SIT.COD_SIT'
+'                                                              '
+'  LEFT JOIN APO158 DEP ON DEP.DPTOID = SUBSTR(UNIV.UBIGEO_DIR, 1, 2)'
+'  LEFT JOIN APO123 PROV ON PROV.DPTOID = SUBSTR(UNIV.UBIGEO_DIR, 1, 2)'
+'                       AND PROV.CIUDID = SUBSTR(UNIV.UBIGEO_DIR, 1, 4)'
+'  LEFT JOIN APO122 DIST ON DIST.ZIPID = UNIV.UBIGEO_DIR'
+'  LEFT JOIN APO105 REG ON REG.REGPENID = UNIV.REGPENID'
+'  LEFT JOIN APO158 DEPDOM ON DEPDOM.DPTOID = SUBSTR(UNIV.ZIPID, 1, 2)'
+'  LEFT JOIN APO123 PROVDOM ON PROVDOM.DPTOID = SUBSTR(UNIV.ZIPID, 1, 2)'
+'                          AND PROVDOM.CIUDID = SUBSTR(UNIV.ZIPID, 1, 4)'
+'  LEFT JOIN APO122 DISTDOM ON DISTDOM.ZIPID = UNIV.ZIPID'
+'  LEFT JOIN (SELECT DNI,'
+'                    RESTRICCIONES,'
+'                    ROW_NUMBER() OVER(PARTITION BY DNI ORDER BY DNI, FECACT DESC) DRK3'
+'               FROM INF_RENIEC_CAP) R ON R.DRK3 = 1'
+'                                     AND R.DNI = UNIV.ASODNI'
+' WHERE NUMCOL IS NOT NULL'+xWhereAct;

      if  dblcddptoid.Text<>'' then
                xSQLWhere2:=xSQLWhere2+' AND SUBSTR(UNIV.UBIGEO_DIR, 1, 2)='+QuotedStr(dblcddptoid.Text);

      if dblcdprovid.Text<>'' then
                xSQLWhere2:=xSQLWhere2+' AND SUBSTR(UNIV.UBIGEO_DIR, 1, 4)='+QuotedStr(dblcdprovid.Text);

      if dblcdDistId.Text<>'' then
                xSQLWhere2:=xSQLWhere2+' AND UNIV.UBIGEO_DIR='+QuotedStr(dblcdDistId.Text);

  //Inicio HPC_201606_PRE --Se cambia solo para la hoja de trabajo los asociados DO po VO si no tiene aportes ni autorización de descuento
  //   if cbDo.Checked=true then
  //           xDo:=QuotedStr('DO');
  //   if cbVo.Checked=true then
  //           xVo:=QuotedStr('VO');
  //   if cbCe.Checked=true then
  //           xCe:=QuotedStr('CE');
  //   if cbCo.Checked=true then
  //           xCo:=QuotedStr('CO');

      if (cbDo.Checked=true) AND (cbVo.Checked=false) then
      begin
        //No consiedera a los DO que no tengan autorizacion de descuento ni aportes
        xDo :=QuotedStr('DO');
        xDo2:=QuotedStr('DO');
      end;

      if (cbVo.Checked=true) AND (cbDo.Checked=false) then
      begin
        xVo:=QuotedStr('VO');
        //Considerar como VO a los DO  que no tengan autorizacion de descuento ni aportes
        //no mostrar los DO
        xDo :=QuotedStr('DO');
        xDo2:=QuotedStr('VO');
      end;

      if (cbVo.Checked=true) AND (cbDo.Checked=true) then
      begin
        xVo:=QuotedStr('VO');
        //Considerar como VO a los DO  que no tengan autorizacion de descuento ni aportes
        //Mostar Los VO y los DO
        xDo :=QuotedStr('DO');
        xDo2:=QuotedStr('DO');
        xVo2:=QuotedStr('VO');
      end;

      if cbCe.Checked=true then
      begin
        xCe := QuotedStr('CE');
        xCe2:= QuotedStr('CE');
      end;

      if cbCo.Checked=true then
      begin
        xCo :=QuotedStr('CO');
        xCo2:=QuotedStr('CO');
      end;
  //Final HPC_201606_PRE

      xSQLWhere2:=xSQLWhere2+' AND UNIV.ASOTIPID IN ('+xDo+','+xVo+','+xCe+','+xCo+')';


      if dblcRegPension.Text<>'' then
                xSQLWhere2:=xSQLWhere2+' AND UNIV.REGPENID='+QuotedStr(dblcRegPension.Text);

      if dblcFirmo.Text<>'' then
      begin
          if dblcFirmo.Text='1' then
                 xSQLWhere2:=xSQLWhere2+' AND UNIV.AUTORIZO_DSCTO = ''S''';
          if dblcFirmo.Text='2' then
                 xSQLWhere2:=xSQLWhere2+' AND UNIV.AUTORIZO_DSCTO = ''N''';
      end;

      if dblcFallecidos.Text<>'' then
      begin
          if dblcFallecidos.Text='SI' then
                 xSQLWhere2:=xSQLWhere2+' AND (NVL(UNIV.FALLECIDO,''N'')=''S'' OR NVL(UPPER(R.RESTRICCIONES),'' '') LIKE ''FALLE%'')';
          if dblcFallecidos.Text='NO' then
                 xSQLWhere2:=xSQLWhere2+' AND (NVL(UNIV.FALLECIDO,''N'')=''N'' AND NVL(UPPER(R.RESTRICCIONES),'' '') NOT LIKE ''FALLE%'')';
      end;

      xSQLOrderBy2:= ' ORDER BY  NVL(DEP.DPTODES,''Z:DEP. NO UBICADA'')     ,'
+'               NVL(PROV.CIUDDES,''Z:PROV. NO UBICADA'')    ,'
+'               NVL(DIST.ZIPABR,''Z:DIST. NO UBICADA''), UNIV.CPO_CEN_EDUCATIVO,'
+'              UNIV.CENTRO_EDUCATIVO,UNIV.NIV_CEN_EDUCATIVO,'
+'              UNIV.APELLIDOS_NOMBRES'
+' )'
+'          GROUP BY DEP,PROV,DIST,CPO_CEN_EDUCATIVO,CENTRO_EDUCATIVO'
+'          HAVING SUM(FLG)=0';
        xSQL2:=xSQL2+xSQLWhere2+xSQLOrderBy2;
        DM1.cdsQry18.Close;
        DM1.cdsQry18.DataRequest(xSQL2);
        DM1.cdsQry18.Open;

        //Borrar Tabla temporal
         xSqlInsert := ' DELETE FROM PRE_HOJACAMPO_TMP';
         DM1.DCOM1.AppServer.EjecutaSQL(xSqlInsert);
         
        While Not DM1.cdsQry18.Eof Do
        Begin
          xSqlInsert := ' INSERT INTO PRE_HOJACAMPO_TMP (CAMPO)'
                        +' VALUES ('+QuotedStr(DM1.cdsQry18.FieldByName('CAMPO').AsString) +')';
         DM1.DCOM1.AppServer.EjecutaSQL(xSqlInsert);
         DM1.cdsQry18.Next;
        End;

        //Consulta Principal
//Inicio HPC_201606_PRE --Consulta
         xSQL:='WITH APO AS (SELECT  ASOID,1 APORTES FROM APO201 A '
              +'WHERE EXISTS(SELECT ASOID FROM APO301 B WHERE B.ASOID=A.ASOID AND NVL(B.TRANSMTO,0)-NVL(B.TRANSMTODEV,0)>0) ) ';
         xSQL:= xSQL+' SELECT UNIV.ZIPID,'
+'       NVL(APO.APORTES,0) APORTE,'
//Final HPC_201606_PRE
+'       UNIV.UBIGEO_DIR,'
+'       NVL(DEP.DPTODES, ''Z:DEP. NO UBICADA'') DEP,'
+'       NVL(PROV.CIUDDES, ''Z:PROV. NO UBICADA'') PROV,'
+'       NVL(DIST.ZIPABR, ''Z:DIST. NO UBICADA'') DIST,'
+'       UNIV.CPO_CEN_EDUCATIVO, '
+'       UNIV.NIV_CEN_EDUCATIVO,'
+'       UNIV.CENTRO_EDUCATIVO,'
+'       UNIV.DIR_CEN_EDUCATIVO,'
+'       UNIV.APELLIDOS_NOMBRES,'
+'       UNIV.ASODNI,'
+'       UNIV.AUTORIZO_DSCTO,'
+'       SIT.DES_SIT,'
+'       UNIV.SINFIRMA,'
+'       UNIV.NUMCOL,'
//Inicio HPC_201606_PRE --Variable
+'       UNIV.ASOTIPID ASOTIPID2,'
//Final HPC_201606_PRE
+'       UNIV.ASODIR || ''-'' || DEPDOM.DPTODES || ''-'' || PROVDOM.CIUDDES || ''-'' ||'
+'       DISTDOM.ZIPABR ASODIR,'
+'       UNIV.ASODIR2,'
+'       UNIV.ASOTELF1,'
+'       UNIV.ASOEMAIL,'
+'       UNIV.REGPENID,'
+'       REG.REGPENABR,'
+'       UNIV.ASOFECNAC,'
+'       UNIV.ASOAPTSER,'
+'       UNIV.FALLECIDO,'
// Inicio HPC_201811_PRE : Funcionalidad de Contactabilidad añadida
+'       R.RESTRICCIONES, '
+'       DB2ADMIN.SF_ASO_DIRECCION_PRIORIDAD(UNIV.ASOID, 1, ''22'') DIR_PRI_1, '
+'       DB2ADMIN.SF_ASO_DIRECCION_PRIORIDAD(UNIV.ASOID, 2, ''22'') DIR_PRI_2, '
+'       DB2ADMIN.SF_ASO_TELEFONO_PRIORIDAD(UNIV.ASOID,''FIJO'', 2) TEL_FIJO, '
+'       DB2ADMIN.SF_ASO_TELEFONO_PRIORIDAD(UNIV.ASOID,''CELULAR'', 5) TEL_CELU, '
+'       DB2ADMIN.SF_ASO_CORREO_PRIORIDAD(UNIV.ASOID,1,''22'') CORREO_PRI_1, '
+'       DB2ADMIN.SF_ASO_CORREO_PRIORIDAD(UNIV.ASOID,2,''22'') CORREO_PRI_2 '
// Fin  HPC_201811_PRE : Funcionalidad de Contactabilidad añadida
+'  FROM (SELECT X.ZIPID,'
+'               X.UBIGEO_DIR,'
+'               NVL(CENPO, ''Z:CPO. NO UBICADA'') CPO_CEN_EDUCATIVO,'
+'               NVL(NIVEDU_DES, ''Z:NIV_CEN. NO UBICADA'') NIV_CEN_EDUCATIVO,'
+'               NVL(NOMCENEDU, ''Z:C.E. NO UBICADA'') CENTRO_EDUCATIVO,'
+'               NVL(DIREC, ''Z:DIR_CE. NO UBICADA'') DIR_CEN_EDUCATIVO,'
+'               X.ASOAPENOM APELLIDOS_NOMBRES,'
+'               X.ASODNI,'
+'               AUTDESAPO AUTORIZO_DSCTO,'
+'               ASOID,'
+'               SINFIRMA,'
+'               0 NUMCOL,'
+'               X.ASOTIPID,'
+'               REGPENID,'
+'               ASODIR,'
+'               ASODIR2,'
+'               ASOTELF1,'
+'               ASOEMAIL,'
+'               ASOFECNAC,'
+'               X.FALLECIDO,'
+'               ASOAPTSER'
+'          FROM (SELECT B.ZIPID,'
+'                       A.UBIGEO_DIR,'
+'                       B.ASOAPENOM,'
+'                       NVL(B.AUTDESAPO, ''N'') AUTDESAPO,'
+'                       A.NOMCENEDU,'
+'                       A.CENPO,'
+'                       A.DIREC,'
+'                       A.NIVEDU_DES,'
+'                       B.ASODNI,'
+'                       B.ASOID,'
+'                       CASE'
+'                         WHEN NVL(AUTDESAPO, ''N'') = ''N'' THEN'
+'                          1'
+'                         ELSE'
+'                          0'
+'                       END SINFIRMA,'
+'                       B.ASOTIPID,'
+'                       trim(B.ASODIR) ASODIR,'
+'                       B.ASODIR ASODIR2,'
+'                       B.ASOTELF1,'
+'                       B.ASOEMAIL,'
+'                       B.ASOFECNAC,'
+'                       B.REGPENID,'
+'                       B.FALLECIDO,'
+'                       B.ASOAPTSER'
+'                  FROM (SELECT X.CENEDUID,'
+'                               X.UBIGEO_DIR,'
+'                               X.NOMCENEDU,'
+'                               X.CENPO,'
+'                               X.DIREC,'
+'                               Y.NIVEDU_DES'
+'                          FROM ASO_CEN_EDU X, NIV_CEN_EDU Y'
+'                         WHERE X.NIVEDU_ID = Y.NIVEDU_ID(+)) A,'
+'                       APO201 B'
+'                 WHERE B.CENEDUID =A.CENEDUID(+) '
+'                   AND SUBSTR(A.UBIGEO_DIR, 1, 2) = '+ QuotedStr(dblcddptoid.Text)
+'                UNION ALL'
+'                SELECT B.ZIPID,'
+'                       A.UBIGEO_DIR,'
+'                       B.ASOAPENOM,'
+'                       NVL(B.AUTDESAPO, ''N'') AUTDESAPO,'
+'                       A.NOMCENEDU,'
+'                       A.CENPO,'
+'                       A.DIREC,'
+'                       A.NIVEDU_DES,'
+'                       B.ASODNI,'
+'                       B.ASOID,'
+'                       CASE'
+'                         WHEN NVL(AUTDESAPO, ''N'') = ''N'' THEN'
+'                          1'
+'                         ELSE'
+'                          0'
+'                       END SINFIRMA,'
+'                       B.ASOTIPID,'
+'                       B.ASODIR ASODIR,'
+'                       B.ASODIR ASODIR2,'
+'                       B.ASOTELF1,'
+'                       B.ASOEMAIL,'
+'                       B.ASOFECNAC,'
+'                       B.REGPENID,'
+'                       B.FALLECIDO,'
+'                       B.ASOAPTSER'
+'                  FROM (SELECT X.CENEDUID,'
+'                               X.UBIGEO_DIR,'
+'                               X.NOMCENEDU,'
+'                               X.CENPO,'
+'                               X.DIREC,'
+'                               Y.NIVEDU_DES'
+'                          FROM ASO_CEN_EDU X, NIV_CEN_EDU Y'
+'                         WHERE X.NIVEDU_ID = Y.NIVEDU_ID(+)) A,'
+'                       ASO_NUE_CLI B'
+'                 WHERE B.CENEDUID =A.CENEDUID(+) '
+'                   AND NVL(B.AUTDESAPO, ''N'') = ''N'''
+'                   AND B.FEC_AUT_CLI IS NULL'
+'                   AND B.ACTARCREN = ''S'''
+'                   AND SUBSTR(A.UBIGEO_DIR, 1, 2) = '+ QuotedStr(dblcddptoid.Text)
+'                   AND NOT EXISTS'
// INICIO HPC_201602_PRE
// COMENTAR CONSULTA DE BASE DE DATOS
+'                 (SELECT 1 FROM APO201 WHERE ASOID = B.ASOID)) X /*,'
+'               (SELECT ASODNI, MAX(TIPSER) TIPSER'
+'                  FROM ASO_PAD_HIS'
+'                 GROUP BY ASODNI) Y'
+'         WHERE X.ASODNI = Y.ASODNI(+)'
+'           AND NVL(Y.TIPSER, 01) IN (01, 08)*/) UNIV'
// FIN HPC_201602_PRE
+'  LEFT JOIN (SELECT ASOID,'
+'                    SITACT,'
+'                    ROW_NUMBER() OVER(PARTITION BY ASOID ORDER BY ASOID, FREG DESC) DRK'
+'               FROM APO206) B2 ON B2.DRK = 1'
+'                              AND UNIV.ASOID = B2.ASOID'
+'  LEFT JOIN ASO_PAD_SIT_ASO SIT ON SIT.COD_MAE = 02'
+'                               AND B2.SITACT = SIT.COD_SIT'
+'                                                              '
+'  LEFT JOIN APO158 DEP ON DEP.DPTOID = SUBSTR(UNIV.UBIGEO_DIR, 1, 2)'
+'  LEFT JOIN APO123 PROV ON PROV.DPTOID = SUBSTR(UNIV.UBIGEO_DIR, 1, 2)'
+'                       AND PROV.CIUDID = SUBSTR(UNIV.UBIGEO_DIR, 1, 4)'
+'  LEFT JOIN APO122 DIST ON DIST.ZIPID = UNIV.UBIGEO_DIR'
+'  LEFT JOIN APO105 REG ON REG.REGPENID = UNIV.REGPENID'
+'  LEFT JOIN APO158 DEPDOM ON DEPDOM.DPTOID = SUBSTR(UNIV.ZIPID, 1, 2)'
+'  LEFT JOIN APO123 PROVDOM ON PROVDOM.DPTOID = SUBSTR(UNIV.ZIPID, 1, 2)'
+'                          AND PROVDOM.CIUDID = SUBSTR(UNIV.ZIPID, 1, 4)'
+'  LEFT JOIN APO122 DISTDOM ON DISTDOM.ZIPID = UNIV.ZIPID'
+'  LEFT JOIN (SELECT DNI,'
+'                    RESTRICCIONES,'
+'                    ROW_NUMBER() OVER(PARTITION BY DNI ORDER BY DNI, FECACT DESC) DRK3'
+'               FROM INF_RENIEC_CAP) R ON R.DRK3 = 1'
+'                                     AND R.DNI = UNIV.ASODNI'
//Inicio HPC_201606_PRE --Campo adicional
+'  LEFT JOIN APO ON APO.ASOID=UNIV.ASOID '
//Final HPC_201606_PRE
+' WHERE NUMCOL IS NOT NULL'+xWhereAct;


      if  dblcddptoid.Text<>'' then
                xSQLWhere:=xSQLWhere+' AND SUBSTR(UNIV.UBIGEO_DIR, 1, 2)='+QuotedStr(dblcddptoid.Text);

      if dblcdprovid.Text<>'' then
                xSQLWhere:=xSQLWhere+' AND SUBSTR(UNIV.UBIGEO_DIR, 1, 4)='+QuotedStr(dblcdprovid.Text);

      if dblcdDistId.Text<>'' then
                xSQLWhere:=xSQLWhere+' AND UNIV.UBIGEO_DIR='+QuotedStr(dblcdDistId.Text);


  //Inicio HPC_201606_PRE --Se cambia solo para la hoja de trabajo los asociados DO po VO si no tiene aportes ni autorización de descuento
  //   if cbDo.Checked=true then
  //           xDo:=QuotedStr('DO');
  //   if cbVo.Checked=true then
  //           xVo:=QuotedStr('VO');
  //   if cbCe.Checked=true then
  //           xCe:=QuotedStr('CE');
  //   if cbCo.Checked=true then
  //           xCo:=QuotedStr('CO');

      if (cbDo.Checked=true) AND (cbVo.Checked=false) then
      begin
        //No consiedera a los DO que no tengan autorizacion de descuento ni aportes
        xDo :=QuotedStr('DO');
        xDo2:=QuotedStr('DO');
      end;

      if (cbVo.Checked=true) AND (cbDo.Checked=false) then
      begin
        xVo:=QuotedStr('VO');
        //Considerar como VO a los DO  que no tengan autorizacion de descuento ni aportes
        //no mostrar los DO
        xDo :=QuotedStr('DO');
        xDo2:=QuotedStr('VO');
      end;

      if (cbVo.Checked=true) AND (cbDo.Checked=true) then
      begin
        xVo:=QuotedStr('VO');
        //Considerar como VO a los DO  que no tengan autorizacion de descuento ni aportes
        //Mostar Los VO y los DO
        xDo :=QuotedStr('DO');
        xDo2:=QuotedStr('DO');
        xVo2:=QuotedStr('VO');
      end;

      if cbCe.Checked=true then
      begin
        xCe := QuotedStr('CE');
        xCe2:= QuotedStr('CE');
      end;

      if cbCo.Checked=true then
      begin
        xCo :=QuotedStr('CO');
        xCo2:=QuotedStr('CO');
      end;
  //Final HPC_201606_PRE



      xSQLWhere:=xSQLWhere+' AND UNIV.ASOTIPID IN ('+xDo+','+xVo+','+xCe+','+xCo+')';


      if dblcRegPension.Text<>'' then
                xSQLWhere:=xSQLWhere+' AND UNIV.REGPENID='+QuotedStr(dblcRegPension.Text);

      if dblcFirmo.Text<>'' then
      begin
          if dblcFirmo.Text='1' then
                 xSQLWhere:=xSQLWhere+' AND UNIV.AUTORIZO_DSCTO = ''S''';
          if dblcFirmo.Text='2' then
                 xSQLWhere:=xSQLWhere+' AND UNIV.AUTORIZO_DSCTO = ''N''';
      end;

      if dblcFallecidos.Text<>'' then
      begin
          if dblcFallecidos.Text='SI' then
                 xSQLWhere:=xSQLWhere+' AND (NVL(UNIV.FALLECIDO,''N'')=''S'' OR NVL(UPPER(R.RESTRICCIONES),'' '') LIKE ''FALLE%'')';
          if dblcFallecidos.Text='NO' then
                 xSQLWhere:=xSQLWhere+' AND (NVL(UNIV.FALLECIDO,''N'')=''N'' AND NVL(UPPER(R.RESTRICCIONES),'' '') NOT LIKE ''FALLE%'')';
      end;

      //Unir consulta 1 con consulta 2 temporal
      xSQLWhere:=xSQLWhere+' AND NOT EXISTS ('
             +'   SELECT 1 FROM PRE_HOJACAMPO_TMP WHERE NVL(DEP.DPTODES, ''Z:DEP. NO UBICADA'') ||'
             +'   NVL(PROV.CIUDDES, ''Z:PROV. NO UBICADA'') ||'
             +'   NVL(DIST.ZIPABR, ''Z:DIST. NO UBICADA'') || UNIV.CPO_CEN_EDUCATIVO ||'
             +'   UNIV.CENTRO_EDUCATIVO=CAMPO)';

      xSQLOrderBy:= ' ORDER BY  NVL(DEP.DPTODES,''Z:DEP. NO UBICADA'')     ,'
+'               NVL(PROV.CIUDDES,''Z:PROV. NO UBICADA'')    ,'
+'               NVL(DIST.ZIPABR,''Z:DIST. NO UBICADA''), UNIV.CPO_CEN_EDUCATIVO,'
+'              UNIV.CENTRO_EDUCATIVO,UNIV.NIV_CEN_EDUCATIVO,'
+'              UNIV.APELLIDOS_NOMBRES';

        //Query final
        DM1.cdsQry10.IndexFieldNames:='';
        DM1.cdsQry10.Close;
//Inicial HPC_201606_PRE --Se cambia solo para la hoja de trabajo los asociados DO po VO si no tiene aportes ni autorización de descuento
//      DM1.cdsQry10.DataRequest(xSQL+xSQLWhere+xSQLOrderBy);





// Inicio HPC_201811_PRE : Funcionalidad de Contactabilidad añadida
        DM1.cdsQry10.DataRequest('Select (CASE WHEN (Z.ASOTIPID2=''DO'') AND (Z.APORTE=0) AND (Z.AUTORIZO_DSCTO=''N'') THEN ''VO'' ELSE Z.ASOTIPID2 END) ASOTIPID,'
                                 +' Z.ZIPID,Z.APORTE, Z.UBIGEO_DIR,Z.DEP,Z.PROV,Z.DIST,Z.CPO_CEN_EDUCATIVO,Z.NIV_CEN_EDUCATIVO,Z.CENTRO_EDUCATIVO,'
                                 +' Z.DIR_CEN_EDUCATIVO,Z.APELLIDOS_NOMBRES,Z.ASODNI,Z.AUTORIZO_DSCTO,Z.DES_SIT,Z.SINFIRMA,Z.NUMCOL,Z.ASOTIPID2,Z.ASODIR,'
                                 +' Z.ASODIR2,Z.ASOTELF1,Z.ASOEMAIL,Z.REGPENID, Z.REGPENABR,Z.ASOFECNAC,Z.ASOAPTSER,Z.FALLECIDO,Z.RESTRICCIONES,'
                                 +' Z.DIR_PRI_1, Z.DIR_PRI_2, Z.TEL_FIJO, TEL_CELU, CORREO_PRI_1, CORREO_PRI_2 '
                                 +'From ('+xSQL+xSQLWhere+xSQLOrderBy+') Z ');
// Fin  HPC_201811_PRE : Funcionalidad de Contactabilidad añadida
        DM1.cdsQry10.Open;

        DM1.cdsQry10.Filtered := False;
        DM1.cdsQry10.Filter   := '( (ASOTIPID='+xDo2+') or (ASOTIPID='+xVo2+') or (ASOTIPID='+xCe2+') or (ASOTIPID='+xCo2+') )';
        DM1.cdsQry10.Filtered := True;
//Final HPC_201606_PRE
        DM1.cdsQry10.IndexFieldNames:='DEP; PROV; DIST;CPO_CEN_EDUCATIVO;CENTRO_EDUCATIVO;NIV_CEN_EDUCATIVO;APELLIDOS_NOMBRES ';

        //Borrar Tabla temporal
        xSqlInsert := ' DELETE FROM PRE_HOJACAMPO_TMP';
        DM1.DCOM1.AppServer.EjecutaSQL(xSqlInsert);
     end
     else
     begin

         //Colegio sin CADASP>=1
//Inicio HPC_201606_PRE --Busca asociado
         xSQL:='WITH APO AS (SELECT  ASOID,1 APORTES FROM APO201 A '
              +'WHERE EXISTS(SELECT ASOID FROM APO301 B WHERE B.ASOID=A.ASOID AND NVL(B.TRANSMTO,0)-NVL(B.TRANSMTODEV,0)>0) ) ';

// Inicio HPC_201811_PRE : Funcionalidad de Contactabilidad añadida
         xSQL01:=xSQL;
//       xSQL:= xSQL+' SELECT UNIV.ZIPID,'
         xSQL02:='SELECT UNIV.ZIPID, '
// Fin  HPC_201811_PRE : Funcionalidad de Contactabilidad añadida
+'       NVL(APO.APORTES,0) APORTE,'
//Final HPC_201606_PRE
+'       UNIV.UBIGEO_DIR,'
+'       NVL(DEP.DPTODES, ''Z:DEP. NO UBICADA'') DEP,'
+'       NVL(PROV.CIUDDES, ''Z:PROV. NO UBICADA'') PROV,'
+'       NVL(DIST.ZIPABR, ''Z:DIST. NO UBICADA'') DIST,'
+'       UNIV.CPO_CEN_EDUCATIVO, '
+'       UNIV.NIV_CEN_EDUCATIVO,'
+'       UNIV.CENTRO_EDUCATIVO,'
+'       UNIV.DIR_CEN_EDUCATIVO,'
+'       UNIV.APELLIDOS_NOMBRES,'
+'       UNIV.ASODNI,'
+'       UNIV.AUTORIZO_DSCTO,'
+'       SIT.DES_SIT,'
+'       UNIV.SINFIRMA,'
+'       UNIV.NUMCOL,'
//Inicio HPC_201606_PRE --Variable
+'       UNIV.ASOTIPID ASOTIPID2,'
//Final HPC_201606_PRE
// Inicio HPC_201811_PRE : Funcionalidad de Contactabilidad añadida

//+'       UNIV.ASODIR || ''-'' || DEPDOM.DPTODES || ''-'' || PROVDOM.CIUDDES || ''-'' ||'
//+'       DISTDOM.ZIPABR ASODIR,'
+'      UNIV.ASODIR, '
// Fin  HPC_201811_PRE : Funcionalidad de Contactabilidad añadida

+'       UNIV.ASODIR2,'
+'       UNIV.ASOTELF1,'
+'       UNIV.ASOEMAIL,'
+'       UNIV.REGPENID,'
+'       REG.REGPENABR,'
+'       UNIV.ASOFECNAC,'
+'       UNIV.ASOAPTSER,'
+'       UNIV.FALLECIDO,'
// Inicio HPC_201811_PRE : Funcionalidad de Contactabilidad añadida
+'       R.RESTRICCIONES, '
+'       DB2ADMIN.SF_ASO_DIRECCION_PRIORIDAD(UNIV.ASOID, 1, ''22'' ) DIR_PRI_1, '
+'       DB2ADMIN.SF_ASO_DIRECCION_PRIORIDAD(UNIV.ASOID, 2, ''22'' ) DIR_PRI_2, '
+'       DB2ADMIN.SF_ASO_TELEFONO_PRIORIDAD(UNIV.ASOID,''FIJO'', 2) TEL_FIJO, '
+'       DB2ADMIN.SF_ASO_TELEFONO_PRIORIDAD(UNIV.ASOID,''CELULAR'', 5) TEL_CELU, '
+'       DB2ADMIN.SF_ASO_CORREO_PRIORIDAD(UNIV.ASOID,1,''22'') CORREO_PRI_1, '
+'       DB2ADMIN.SF_ASO_CORREO_PRIORIDAD(UNIV.ASOID,2,''22'') CORREO_PRI_2 '
// Fin  HPC_201811_PRE : Funcionalidad de Contactabilidad añadida

+'  FROM (SELECT X.ZIPID,'
+'               X.UBIGEO_DIR,'
+'               NVL(CENPO, ''Z:CPO. NO UBICADA'') CPO_CEN_EDUCATIVO,'
+'               NVL(NIVEDU_DES, ''Z:NIV_CEN. NO UBICADA'') NIV_CEN_EDUCATIVO,'
+'               NVL(NOMCENEDU, ''Z:C.E. NO UBICADA'') CENTRO_EDUCATIVO,'
+'               NVL(DIREC, ''Z:DIR_CE. NO UBICADA'') DIR_CEN_EDUCATIVO,'
+'               X.ASOAPENOM APELLIDOS_NOMBRES,'
+'               X.ASODNI,'
+'               AUTDESAPO AUTORIZO_DSCTO,'
+'               ASOID,'
+'               SINFIRMA,'
+'               0 NUMCOL,'
+'               X.ASOTIPID,'
+'               REGPENID,'
+'               ASODIR,'
+'               ASODIR2,'
+'               ASOTELF1,'
+'               ASOEMAIL,'
+'               ASOFECNAC,'
+'               X.FALLECIDO,'
+'               ASOAPTSER'
+'          FROM (SELECT B.ZIPID,'
+'                       A.UBIGEO_DIR,'
+'                       B.ASOAPENOM,'
+'                       NVL(B.AUTDESAPO, ''N'') AUTDESAPO,'
+'                       A.NOMCENEDU,'
+'                       A.CENPO,'
+'                       A.DIREC,'
+'                       A.NIVEDU_DES,'
+'                       B.ASODNI,'
+'                       B.ASOID,'
+'                       CASE'
+'                         WHEN NVL(AUTDESAPO, ''N'') = ''N'' THEN'
+'                          1'
+'                         ELSE'
+'                          0'
+'                       END SINFIRMA,'
+'                       B.ASOTIPID,'
+'                       trim(B.ASODIR) ASODIR,'
+'                       B.ASODIR ASODIR2,'
+'                       B.ASOTELF1,'
+'                       B.ASOEMAIL,'
+'                       B.ASOFECNAC,'
+'                       B.REGPENID,'
+'                       B.FALLECIDO,'
+'                       B.ASOAPTSER'
+'                  FROM (SELECT X.CENEDUID,'
+'                               X.UBIGEO_DIR,'
+'                               X.NOMCENEDU,'
+'                               X.CENPO,'
+'                               X.DIREC,'
+'                               Y.NIVEDU_DES'
+'                          FROM ASO_CEN_EDU X, NIV_CEN_EDU Y'
+'                         WHERE X.NIVEDU_ID = Y.NIVEDU_ID(+)) A,'
+'                       APO201 B'
+'                 WHERE B.CENEDUID =A.CENEDUID(+) '
// Inicio HPC_201811_PRE : Funcionalidad de Contactabilidad añadida
+'                   AND SUBSTR(A.UBIGEO_DIR, 1, 2) = '+ QuotedStr(dblcddptoid.Text);
         xSQL03:=' '
// Fin  HPC_201811_PRE : Funcionalidad de Contactabilidad añadida
+'                UNION ALL'
+'                SELECT B.ZIPID,'
+'                       A.UBIGEO_DIR,'
+'                       B.ASOAPENOM,'
+'                       NVL(B.AUTDESAPO, ''N'') AUTDESAPO,'
+'                       A.NOMCENEDU,'
+'                       A.CENPO,'
+'                       A.DIREC,'
+'                       A.NIVEDU_DES,'
+'                       B.ASODNI,'
+'                       B.ASOID,'
+'                       CASE'
+'                         WHEN NVL(AUTDESAPO, ''N'') = ''N'' THEN'
+'                          1'
+'                         ELSE'
+'                          0'
+'                       END SINFIRMA,'
+'                       B.ASOTIPID,'
+'                       B.ASODIR ASODIR,'
+'                       B.ASODIR ASODIR2,'
+'                       B.ASOTELF1,'
+'                       B.ASOEMAIL,'
+'                       B.ASOFECNAC,'
+'                       B.REGPENID,'
+'                       B.FALLECIDO,'
+'                       B.ASOAPTSER'
+'                  FROM (SELECT X.CENEDUID,'
+'                               X.UBIGEO_DIR,'
+'                               X.NOMCENEDU,'
+'                               X.CENPO,'
+'                               X.DIREC,'
+'                               Y.NIVEDU_DES'
+'                          FROM ASO_CEN_EDU X, NIV_CEN_EDU Y'
+'                         WHERE X.NIVEDU_ID = Y.NIVEDU_ID(+)) A,'
+'                       ASO_NUE_CLI B'
+'                 WHERE B.CENEDUID =A.CENEDUID(+) '
+'                   AND NVL(B.AUTDESAPO, ''N'') = ''N'''
+'                   AND B.FEC_AUT_CLI IS NULL'
+'                   AND B.ACTARCREN = ''S'''
+'                   AND SUBSTR(A.UBIGEO_DIR, 1, 2) = '+ QuotedStr(dblcddptoid.Text)
+'                   AND NOT EXISTS'
// INICIO HPC_201602_PRE
// COMENTAR CONSULTA DE BASE DE DATOS
+'                 (SELECT 1 FROM APO201 WHERE ASOID = B.ASOID)) X /*,'
+'               (SELECT ASODNI, MAX(TIPSER) TIPSER'
+'                  FROM ASO_PAD_HIS'
+'                 GROUP BY ASODNI) Y'
+'         WHERE X.ASODNI = Y.ASODNI(+)'
+'           AND NVL(Y.TIPSER, 01) IN (01, 08)*/) UNIV'
// FIN HPC_201602_PRE
+'  LEFT JOIN (SELECT ASOID,'
+'                    SITACT,'
+'                    ROW_NUMBER() OVER(PARTITION BY ASOID ORDER BY ASOID, FREG DESC) DRK'
+'               FROM APO206) B2 ON B2.DRK = 1'
+'                              AND UNIV.ASOID = B2.ASOID'
+'  LEFT JOIN ASO_PAD_SIT_ASO SIT ON SIT.COD_MAE = 02'
+'                               AND B2.SITACT = SIT.COD_SIT'
+'                                                              '
+'  LEFT JOIN APO158 DEP ON DEP.DPTOID = SUBSTR(UNIV.UBIGEO_DIR, 1, 2)'
+'  LEFT JOIN APO123 PROV ON PROV.DPTOID = SUBSTR(UNIV.UBIGEO_DIR, 1, 2)'
+'                       AND PROV.CIUDID = SUBSTR(UNIV.UBIGEO_DIR, 1, 4)'
+'  LEFT JOIN APO122 DIST ON DIST.ZIPID = UNIV.UBIGEO_DIR'
+'  LEFT JOIN APO105 REG ON REG.REGPENID = UNIV.REGPENID'
// Inicio HPC_201811_PRE : Funcionalidad de Contactabilidad añadida
//+'  LEFT JOIN APO158 DEPDOM ON DEPDOM.DPTOID = SUBSTR(UNIV.ZIPID, 1, 2)'
//+'  LEFT JOIN APO123 PROVDOM ON PROVDOM.DPTOID = SUBSTR(UNIV.ZIPID, 1, 2)'
//+'                          AND PROVDOM.CIUDID = SUBSTR(UNIV.ZIPID, 1, 4)'
//+'  LEFT JOIN APO122 DISTDOM ON DISTDOM.ZIPID = UNIV.ZIPID'
// Fin  HPC_201811_PRE : Funcionalidad de Contactabilidad añadida
+'  LEFT JOIN (SELECT DNI,'
+'                    RESTRICCIONES,'
+'                    ROW_NUMBER() OVER(PARTITION BY DNI ORDER BY DNI, FECACT DESC) DRK3'
+'               FROM INF_RENIEC_CAP) R ON R.DRK3 = 1'
+'                                     AND R.DNI = UNIV.ASODNI'
//Inicio HPC_201606_PRE --Busca asociado
+'  LEFT JOIN APO ON APO.ASOID=UNIV.ASOID '
//Final HPC_201606_PRE

// Inicio HPC_201811_PRE : Funcionalidad de Contactabilidad añadida

+' WHERE NUMCOL IS NOT NULL'+xWhereAct;

  xSQL:= xSQL01 + xSQL02 + xSQL03;
// Fin  HPC_201811_PRE : Funcionalidad de Contactabilidad añadida


      if  dblcddptoid.Text<>'' then
                xSQLWhere:=xSQLWhere+' AND SUBSTR(UNIV.UBIGEO_DIR, 1, 2)='+QuotedStr(dblcddptoid.Text);

      if dblcdprovid.Text<>'' then
                xSQLWhere:=xSQLWhere+' AND SUBSTR(UNIV.UBIGEO_DIR, 1, 4)='+QuotedStr(dblcdprovid.Text);

      if dblcdDistId.Text<>'' then
                xSQLWhere:=xSQLWhere+' AND UNIV.UBIGEO_DIR='+QuotedStr(dblcdDistId.Text);

  //Inicio HPC_201606_PRE --Se cambia solo para la hoja de trabajo los asociados DO po VO si no tiene aportes ni autorización de descuento
  //   if cbDo.Checked=true then
  //           xDo:=QuotedStr('DO');
  //   if cbVo.Checked=true then
  //           xVo:=QuotedStr('VO');
  //   if cbCe.Checked=true then
  //           xCe:=QuotedStr('CE');
  //   if cbCo.Checked=true then
  //           xCo:=QuotedStr('CO');

      if (cbDo.Checked=true) AND (cbVo.Checked=false) then
      begin
        //No consiedera a los DO que no tengan autorizacion de descuento ni aportes
        xDo :=QuotedStr('DO');
        xDo2:=QuotedStr('DO');
      end;

      if (cbVo.Checked=true) AND (cbDo.Checked=false) then
      begin
        xVo:=QuotedStr('VO');
        //Considerar como VO a los DO  que no tengan autorizacion de descuento ni aportes
        //no mostrar los DO
        xDo :=QuotedStr('DO');
        xDo2:=QuotedStr('VO');
      end;

      if (cbVo.Checked=true) AND (cbDo.Checked=true) then
      begin
        xVo:=QuotedStr('VO');
        //Considerar como VO a los DO  que no tengan autorizacion de descuento ni aportes
        //Mostrar Los VO y los DO
        xDo :=QuotedStr('DO');
        xDo2:=QuotedStr('DO');
        xVo2:=QuotedStr('VO');
      end;

      if cbCe.Checked=true then
      begin
        xCe := QuotedStr('CE');
        xCe2:= QuotedStr('CE');
      end;

      if cbCo.Checked=true then
      begin
        xCo :=QuotedStr('CO');
        xCo2:=QuotedStr('CO');
      end;
  //Final HPC_201606_PRE


      xSQLWhere:=xSQLWhere+' AND UNIV.ASOTIPID IN ('+xDo+','+xVo+','+xCe+','+xCo+')';


      if dblcRegPension.Text<>'' then
                xSQLWhere:=xSQLWhere+' AND UNIV.REGPENID='+QuotedStr(dblcRegPension.Text);
      
      if dblcFirmo.Text<>'' then
      begin
          if dblcFirmo.Text='SI' then
                 xSQLWhere:=xSQLWhere+' AND UNIV.AUTORIZO_DSCTO = ''S''';
          if dblcFirmo.Text='NO' then
                 xSQLWhere:=xSQLWhere+' AND UNIV.AUTORIZO_DSCTO = ''N''';
      end;

      if dblcFallecidos.Text<>'' then
      begin
          if dblcFallecidos.Text='SI' then
                 xSQLWhere:=xSQLWhere+' AND (NVL(UNIV.FALLECIDO,''N'')=''S'' OR NVL(UPPER(R.RESTRICCIONES),'' '') LIKE ''FALLE%'')';
          if dblcFallecidos.Text='NO' then
                 xSQLWhere:=xSQLWhere+' AND (NVL(UNIV.FALLECIDO,''N'')=''N'' AND NVL(UPPER(R.RESTRICCIONES),'' '') NOT LIKE ''FALLE%'')';
      end;

      xSQLOrderBy:= ' ORDER BY  NVL(DEP.DPTODES,''Z:DEP. NO UBICADA'')     ,'
+'               NVL(PROV.CIUDDES,''Z:PROV. NO UBICADA'')    ,'
+'               NVL(DIST.ZIPABR,''Z:DIST. NO UBICADA''), UNIV.CPO_CEN_EDUCATIVO,'
+'              UNIV.CENTRO_EDUCATIVO,UNIV.NIV_CEN_EDUCATIVO,'
+'              UNIV.APELLIDOS_NOMBRES';

        //Query final
        DM1.cdsQry10.IndexFieldNames:='';
        DM1.cdsQry10.Close;
//Inicial HPC_201606_PRE --Se cambia solo para la hoja de trabajo los asociados DO po VO si no tiene aportes ni autorización de descuento
//      DM1.cdsQry10.DataRequest(xSQL+xSQLWhere+xSQLOrderBy);
// Inicio HPC_201811_PRE : Funcionalidad de Contactabilidad añadida
        DM1.cdsQry10.DataRequest('Select (CASE WHEN (Z.ASOTIPID2=''DO'') AND (Z.APORTE=0) AND (Z.AUTORIZO_DSCTO=''N'') THEN ''VO'' ELSE Z.ASOTIPID2 END) ASOTIPID, '
                                 +' Z.ZIPID,Z.APORTE, Z.UBIGEO_DIR,Z.DEP,Z.PROV,Z.DIST,Z.CPO_CEN_EDUCATIVO,Z.NIV_CEN_EDUCATIVO,Z.CENTRO_EDUCATIVO,'
                                 +' Z.DIR_CEN_EDUCATIVO,Z.APELLIDOS_NOMBRES,Z.ASODNI,Z.AUTORIZO_DSCTO,Z.DES_SIT,Z.SINFIRMA,Z.NUMCOL,Z.ASOTIPID2,Z.ASODIR,'
                                 +' Z.ASODIR2,Z.ASOTELF1,Z.ASOEMAIL,Z.REGPENID, Z.REGPENABR,Z.ASOFECNAC,Z.ASOAPTSER,Z.FALLECIDO,Z.RESTRICCIONES, '
                                 +' Z.DIR_PRI_1, DIR_PRI_2, Z.TEL_FIJO, TEL_CELU, CORREO_PRI_1, CORREO_PRI_2 '
                                 +'From ('+xSQL+xSQLWhere+xSQLOrderBy+') Z ');
// Fin  HPC_201811_PRE : Funcionalidad de Contactabilidad añadida
        DM1.cdsQry10.Open;

        DM1.cdsQry10.Filtered := False;
        DM1.cdsQry10.Filter   := '( (ASOTIPID='+xDo2+') or (ASOTIPID='+xVo2+') or (ASOTIPID='+xCe2+') or (ASOTIPID='+xCo2+') )';
        DM1.cdsQry10.Filtered := True;
//Final HPC_201606_PRE

        DM1.cdsQry10.IndexFieldNames:='DEP; PROV; DIST;CPO_CEN_EDUCATIVO;CENTRO_EDUCATIVO;NIV_CEN_EDUCATIVO;APELLIDOS_NOMBRES ';
      end;   //cbCadaps.Checked

      lblContador.Caption := IntToStr(DM1.cdsQry10.RecordCount) + ' Registros ';

      BitExporta.Enabled := true;
      BitPrint.Enabled := true;

      dbgprevio.Selected.Clear;
      dbgprevio.Selected.Add('DEP'#9'15'#9'Departamento'#9#9);
      dbgprevio.Selected.Add('PROV'#9'15'#9'Provincia'#9#9);
      dbgprevio.Selected.Add('DIST'#9'15'#9'Distrito'#9#9);
      dbgprevio.Selected.Add('CPO_CEN_EDUCATIVO'#9'25'#9'Centro Poblado~del Centro Educativo'#9#9);
      dbgprevio.Selected.Add('NIV_CEN_EDUCATIVO'#9'15'#9'Nivel'#9#9);
      dbgprevio.Selected.Add('CENTRO_EDUCATIVO'#9'25'#9'Centro Educativo'#9#9);
      dbgprevio.Selected.Add('DIR_CEN_EDUCATIVO'#9'25'#9'Dirección Centro Educ.'#9#9);
      dbgprevio.Selected.Add('APELLIDOS_NOMBRES'#9'25'#9'Apellidos y Nombres'#9#9);
      dbgprevio.Selected.Add('ASODNI'#9'10'#9'DNI'#9#9);
      dbgprevio.Selected.Add('ASOTIPID'#9'4'#9'Tipo'#9#9);
      dbgprevio.Selected.Add('REGPENABR'#9'10'#9'Reg. Pensión'#9#9);
      dbgprevio.Selected.Add('DES_SIT'#9'25'#9'Sit~Actual'#9#9);
      dbgprevio.Selected.Add('AUTORIZO_DSCTO'#9'3'#9'Aut~Descuento'#9#9);
// Inicio HPC_201811_PRE : Funcionalidad de Contactabilidad añadida
//      dbgprevio.Selected.Add('ASODIR'#9'50'#9'Dirección Dom.'#9'T'#9);
      dbgprevio.Selected.Add('DIR_PRI_1'#9'65'#9'Direcciones'#9'T'#9);
//      dbgprevio.Selected.Add('ASOTELF1'#9'15'#9'Teléfono'#9#9);
      dbgprevio.Selected.Add('TEL_FIJO'#9'25'#9'Teléfonos'#9#9);
//      dbgprevio.Selected.Add('ASOEMAIL'#9'25'#9'Correo~Electronico'#9#9);
      dbgprevio.Selected.Add('CORREO_PRI_1'#9'35'#9'Correos~Electronicos'#9#9);

      dbgprevio.Selected.Add('ASOFECNAC'#9'25'#9'Fecha Nac.'#9#9);
      dbgprevio.Selected.Add('ASOAPTSER'#9'15'#9'Aport/Doc.Reg'#9#9);
      dbgprevio.Selected.Add('FALLECIDO'#9'15'#9'Estado Fallec.'#9#9);
      dbgprevio.Selected.Add('RESTRICCIONES'#9'15'#9'Estado Fallec. Reniec'#9#9);
      dbgprevio.RowHeightPercent:=200;
      dbgprevio.SetControlType( 'DIR_PRI_1', fctCustom , 'wwDataInspector1;T');
      dbgprevio.SetControlType( 'TEL_FIJO', fctCustom , 'wwDataInspector2;T');
      dbgprevio.SetControlType( 'CORREO_PRI_1', fctCustom , 'wwDataInspector3;T');
// Fin  HPC_201811_PRE : Funcionalidad de Contactabilidad añadida
      dbgprevio.ApplySelected;

      end;     //fin de query

      if rbDomicilio.Checked = true then
      begin

        //Consulta principal domicilio
//Inicio HPC_201606_PRE --Busca asociado
//       xSQL:=' SELECT UNIV.ZIPID,'
         xSQL:='WITH APO AS (SELECT  ASOID,1 APORTES FROM APO201 A '
              +'WHERE EXISTS(SELECT ASOID FROM APO301 B WHERE B.ASOID=A.ASOID AND NVL(B.TRANSMTO,0)-NVL(B.TRANSMTODEV,0)>0) ) ';
         xSQL:= xSQL+' SELECT UNIV.ZIPID,'
+'       NVL(APO.APORTES,0) APORTE,'
//Final HPC_201606_PRE
+'       UNIV.UBIGEO_DIR,'
+'       NVL(DEPDOM.DPTODES, ''Z:DEP. NO UBICADA'') DEP,'
+'       NVL(PROVDOM.CIUDDES, ''Z:PROV. NO UBICADA'') PROV,'
+'       NVL(DISTDOM.ZIPABR, ''Z:DIST. NO UBICADA'') DIST,'
+'       /*UNIV.CPO_CEN_EDUCATIVO, */'
+'       UNIV.NIV_CEN_EDUCATIVO,'
+'       /*UNIV.CENTRO_EDUCATIVO,*/'
+'       UNIV.DIR_CEN_EDUCATIVO,'
+'       UNIV.APELLIDOS_NOMBRES,'
+'       UNIV.ASODNI,'
+'       UNIV.AUTORIZO_DSCTO,'
+'       SIT.DES_SIT,'
+'       UNIV.SINFIRMA,'
+'       UNIV.NUMCOL,'
//Inicio HPC_201606_PRE --variable
+'       UNIV.ASOTIPID ASOTIPID2,'
//Final HPC_201606_PRE
+'       UNIV.ASODIR2,'
+'       UNIV.ASOTELF1,'
+'       UNIV.ASOEMAIL,'
+'       UNIV.REGPENID,'
+'       REG.REGPENABR,'
+'       UNIV.ASOFECNAC,'
+'       UNIV.ASOAPTSER,'
+'       UNIV.FALLECIDO,'
// Inicio HPC_201811_PRE : Funcionalidad de Contactabilidad añadida
+'       R.RESTRICCIONES, '
+'       UNIV.ASODIR2 ASODIR,'
+'       DB2ADMIN.SF_ASO_DIRECCION_PRIORIDAD(UNIV.ASOID, 1, ''22'') DIR_PRI_1, '
+'       DB2ADMIN.SF_ASO_DIRECCION_PRIORIDAD(UNIV.ASOID, 2, ''22'') DIR_PRI_2, '
+'       DB2ADMIN.SF_ASO_TELEFONO_PRIORIDAD(UNIV.ASOID,''FIJO'', 2) TEL_FIJO, '
+'       DB2ADMIN.SF_ASO_TELEFONO_PRIORIDAD(UNIV.ASOID,''CELULAR'', 5) TEL_CELU, '
+'       DB2ADMIN.SF_ASO_CORREO_PRIORIDAD(UNIV.ASOID, 1, ''22'') CORREO_PRI_1, '
+'       DB2ADMIN.SF_ASO_CORREO_PRIORIDAD(UNIV.ASOID, 2, ''22'') CORREO_PRI_2 '
// Fin  HPC_201811_PRE : Funcionalidad de Contactabilidad añadida
+'  FROM (SELECT X.ZIPID,'
+'               X.UBIGEO_DIR,'
+'               NVL(CENPO, ''Z:CPO. NO UBICADA'') CPO_CEN_EDUCATIVO,'
+'               NVL(NIVEDU_DES, ''Z:NIV_CEN. NO UBICADA'') NIV_CEN_EDUCATIVO,'
+'               NVL(NOMCENEDU, ''Z:C.E. NO UBICADA'') CENTRO_EDUCATIVO,'
+'               NVL(DIREC, ''Z:DIR_CE. NO UBICADA'') DIR_CEN_EDUCATIVO,'
+'               X.ASOAPENOM APELLIDOS_NOMBRES,'
+'               X.ASODNI,'
+'               AUTDESAPO AUTORIZO_DSCTO,'
+'               ASOID,'
+'               SINFIRMA,'
+'               0 NUMCOL,'
+'               X.ASOTIPID,'
+'               REGPENID,'
+'               ASODIR,'
+'               ASODIR2,'
+'               ASOTELF1,'
+'               ASOEMAIL,'
+'               ASOFECNAC,'
+'               X.FALLECIDO,'
+'               ASOAPTSER'
+'          FROM (SELECT B.ZIPID,'
+'                       A.UBIGEO_DIR,'
+'                       B.ASOAPENOM,'
+'                       NVL(B.AUTDESAPO, ''N'') AUTDESAPO,'
+'                       A.NOMCENEDU,'
+'                       A.CENPO,'
+'                       A.DIREC,'
+'                       A.NIVEDU_DES,'
+'                       B.ASODNI,'
+'                       B.ASOID,'
+'                       CASE'
+'                         WHEN NVL(AUTDESAPO, ''N'') = ''N'' THEN'
+'                          1'
+'                         ELSE'
+'                          0'
+'                       END SINFIRMA,'
+'                       B.ASOTIPID,'
+'                       trim(B.ASODIR) ASODIR,'
+'                       B.ASODIR ASODIR2,'
+'                       B.ASOTELF1,'
+'                       B.ASOEMAIL,'
+'                       B.ASOFECNAC,'
+'                       B.REGPENID,'
+'                       B.FALLECIDO,'
+'                       B.ASOAPTSER'
+'                  FROM (SELECT X.CENEDUID,'
+'                               X.UBIGEO_DIR,'
+'                               X.NOMCENEDU,'
+'                               X.CENPO,'
+'                               X.DIREC,'
+'                               Y.NIVEDU_DES'
+'                          FROM ASO_CEN_EDU X, NIV_CEN_EDU Y'
+'                         WHERE X.NIVEDU_ID = Y.NIVEDU_ID(+)) A,'
+'                       APO201 B'
+'                 WHERE B.CENEDUID =A.CENEDUID(+) '
+'                   AND SUBSTR(B.ZIPID, 1, 2) = '+ QuotedStr(dblcddptoid.Text)
+'                UNION ALL'
+'                SELECT B.ZIPID,'
+'                       A.UBIGEO_DIR,'
+'                       B.ASOAPENOM,'
+'                       NVL(B.AUTDESAPO, ''N'') AUTDESAPO,'
+'                       A.NOMCENEDU,'
+'                       A.CENPO,'
+'                       A.DIREC,'
+'                       A.NIVEDU_DES,'
+'                       B.ASODNI,'
+'                       B.ASOID,'
+'                       CASE'
+'                         WHEN NVL(AUTDESAPO, ''N'') = ''N'' THEN'
+'                          1'
+'                         ELSE'
+'                          0'
+'                       END SINFIRMA,'
+'                       B.ASOTIPID,'
+'                       B.ASODIR ASODIR,'
+'                       B.ASODIR ASODIR2,'
+'                       B.ASOTELF1,'
+'                       B.ASOEMAIL,'
+'                       B.ASOFECNAC,'
+'                       B.REGPENID,'
+'                       B.FALLECIDO,'
+'                       B.ASOAPTSER'
+'                  FROM (SELECT X.CENEDUID,'
+'                               X.UBIGEO_DIR,'
+'                               X.NOMCENEDU,'
+'                               X.CENPO,'
+'                               X.DIREC,'
+'                               Y.NIVEDU_DES'
+'                          FROM ASO_CEN_EDU X, NIV_CEN_EDU Y'
+'                         WHERE X.NIVEDU_ID = Y.NIVEDU_ID(+)) A,'
+'                       ASO_NUE_CLI B'
+'                 WHERE B.CENEDUID =A.CENEDUID(+) '
+'                   AND NVL(B.AUTDESAPO, ''N'') = ''N'''
+'                   AND B.FEC_AUT_CLI IS NULL'
+'                   AND B.ACTARCREN = ''S'''
+'                   AND SUBSTR(B.ZIPID, 1, 2) = '+ QuotedStr(dblcddptoid.Text)
+'                   AND NOT EXISTS'
// INICIO HPC_201602_PRE
// COMENTAR CONSULTA DE BASE DE DATOS
+'                 (SELECT 1 FROM APO201 WHERE ASOID = B.ASOID)) X /*,'
+'               (SELECT ASODNI, MAX(TIPSER) TIPSER'
+'                  FROM ASO_PAD_HIS'
+'                 GROUP BY ASODNI) Y'
+'         WHERE X.ASODNI = Y.ASODNI(+)'
+'           AND NVL(Y.TIPSER, 01) IN (01, 08)*/) UNIV'
// FIN HPC_201602_PRE
+'  LEFT JOIN (SELECT ASOID,'
+'                    SITACT,'
+'                    ROW_NUMBER() OVER(PARTITION BY ASOID ORDER BY ASOID, FREG DESC) DRK'
+'               FROM APO206) B2 ON B2.DRK = 1'
+'                              AND UNIV.ASOID = B2.ASOID'
+'  LEFT JOIN ASO_PAD_SIT_ASO SIT ON SIT.COD_MAE = 02'
+'                               AND B2.SITACT = SIT.COD_SIT'
+'                                                              '
+'  LEFT JOIN APO158 DEP ON DEP.DPTOID = SUBSTR(UNIV.UBIGEO_DIR, 1, 2)'
+'  LEFT JOIN APO123 PROV ON PROV.DPTOID = SUBSTR(UNIV.UBIGEO_DIR, 1, 2)'
+'                       AND PROV.CIUDID = SUBSTR(UNIV.UBIGEO_DIR, 1, 4)'
+'  LEFT JOIN APO122 DIST ON DIST.ZIPID = UNIV.UBIGEO_DIR'
+'  LEFT JOIN APO105 REG ON REG.REGPENID = UNIV.REGPENID'
+'  LEFT JOIN APO158 DEPDOM ON DEPDOM.DPTOID = SUBSTR(UNIV.ZIPID, 1, 2)'
+'  LEFT JOIN APO123 PROVDOM ON PROVDOM.DPTOID = SUBSTR(UNIV.ZIPID, 1, 2)'
+'                          AND PROVDOM.CIUDID = SUBSTR(UNIV.ZIPID, 1, 4)'
+'  LEFT JOIN APO122 DISTDOM ON DISTDOM.ZIPID = UNIV.ZIPID'
+'  LEFT JOIN (SELECT DNI,'
+'                    RESTRICCIONES,'
+'                    ROW_NUMBER() OVER(PARTITION BY DNI ORDER BY DNI, FECACT DESC) DRK3'
+'               FROM INF_RENIEC_CAP) R ON R.DRK3 = 1'
+'                                     AND R.DNI = UNIV.ASODNI'
//Inicio HPC_201606_PRE --Busca asociado
+'  LEFT JOIN APO ON APO.ASOID=UNIV.ASOID '

//Final HPC_201606_PRE
+' WHERE NUMCOL IS NOT NULL'+xWhereAct;

      if  dblcddptoid.Text<>'' then
                xSQLWhere:=xSQLWhere+' AND SUBSTR(UNIV.ZIPID, 1, 2)='+QuotedStr(dblcddptoid.Text);

      if dblcdprovid.Text<>'' then
                xSQLWhere:=xSQLWhere+' AND SUBSTR(UNIV.ZIPID, 1, 4)='+QuotedStr(dblcdprovid.Text);

      if dblcdDistId.Text<>'' then
                xSQLWhere:=xSQLWhere+' AND UNIV.ZIPID='+QuotedStr(dblcdDistId.Text);

  //Inicio HPC_201606_PRE --Se cambia solo para la hoja de trabajo los asociados DO po VO si no tiene aportes ni autorización de descuento
  //  if cbDo.Checked=true then
  //          xDo:=QuotedStr('DO');
  //  if cbVo.Checked=true then
  //          xVo:=QuotedStr('VO');
  //  if cbCe.Checked=true then
  //          xCe:=QuotedStr('CE');
  //  if cbCo.Checked=true then
  //          xCo:=QuotedStr('CO');

      if (cbDo.Checked=true) AND (cbVo.Checked=false) then
      begin
        //No consiedera a los DO que no tengan autorizacion de descuento ni aportes
        xDo :=QuotedStr('DO');
        xDo2:=QuotedStr('DO');
      end;

      if (cbVo.Checked=true) AND (cbDo.Checked=false) then
      begin
        xVo:=QuotedStr('VO');
        //Considerar como VO a los DO  que no tengan autorizacion de descuento ni aportes
        //no mostrar los DO
        xDo :=QuotedStr('DO');
        xDo2:=QuotedStr('VO');
      end;

      if (cbVo.Checked=true) AND (cbDo.Checked=true) then
      begin
        xVo:=QuotedStr('VO');
        //Considerar como VO a los DO  que no tengan autorizacion de descuento ni aportes
        //Mostar Los VO y los DO
        xDo :=QuotedStr('DO');
        xDo2:=QuotedStr('DO');
        xVo2:=QuotedStr('VO');
      end;

      if cbCe.Checked=true then
      begin
        xCe := QuotedStr('CE');
        xCe2:= QuotedStr('CE');
      end;

      if cbCo.Checked=true then
      begin
        xCo :=QuotedStr('CO');
        xCo2:=QuotedStr('CO');
      end;
  //Final HPC_201606_PRE


      xSQLWhere:=xSQLWhere+' AND UNIV.ASOTIPID IN ('+xDo+','+xVo+','+xCe+','+xCo+')';

      if dblcRegPension.Text<>'' then
                xSQLWhere:=xSQLWhere+' AND UNIV.REGPENID='+QuotedStr(dblcRegPension.Text);
     
      if dblcFirmo.Text<>'' then
      begin
          if dblcFirmo.Text='1' then
                 xSQLWhere:=xSQLWhere+' AND UNIV.AUTORIZO_DSCTO = ''S''';
          if dblcFirmo.Text='2' then
                 xSQLWhere:=xSQLWhere+' AND UNIV.AUTORIZO_DSCTO = ''N''';
      end;

      if dblcFallecidos.Text<>'' then
      begin
          if dblcFallecidos.Text='SI' then
                 xSQLWhere:=xSQLWhere+' AND (NVL(UNIV.FALLECIDO,''N'')=''S'' OR NVL(UPPER(R.RESTRICCIONES),'' '') LIKE ''FALLE%'')';
          if dblcFallecidos.Text='NO' then
                 xSQLWhere:=xSQLWhere+' AND (NVL(UNIV.FALLECIDO,''N'')=''N'' AND NVL(UPPER(R.RESTRICCIONES),'' '') NOT LIKE ''FALLE%'')';
      end;

      xSQLOrderBy:= 'ORDER BY  NVL(DEP.DPTODES,''Z:DEP. NO UBICADA'')     ,'
+'               NVL(PROV.CIUDDES,''Z:PROV. NO UBICADA'')    ,'
+'               NVL(DIST.ZIPABR,''Z:DIST. NO UBICADA''),UNIV.APELLIDOS_NOMBRES';

      //Query final
      DM1.cdsQry10.IndexFieldNames:='';
      DM1.cdsQry10.Close;
//Inicial HPC_201606_PRE --Se cambia solo para la hoja de trabajo los asociados DO po VO si no tiene aportes ni autorización de descuento
//    DM1.cdsQry10.DataRequest(xSQL+xSQLWhere+xSQLOrderBy);
// Inicio HPC_201811_PRE : Funcionalidad de Contactabilidad añadida
      DM1.cdsQry10.DataRequest('Select (CASE WHEN (Z.ASOTIPID2=''DO'') AND (Z.APORTE=0) AND (Z.AUTORIZO_DSCTO=''N'') THEN ''VO'' ELSE Z.ASOTIPID2 END) ASOTIPID,'
                              +' Z.ZIPID,Z.APORTE, Z.UBIGEO_DIR,Z.DEP,Z.PROV,Z.DIST,Z.NIV_CEN_EDUCATIVO,Z.DIR_CEN_EDUCATIVO,Z.APELLIDOS_NOMBRES,Z.ASODNI,'
                              +' Z.AUTORIZO_DSCTO,Z.DES_SIT,Z.SINFIRMA,Z.NUMCOL,Z.ASOTIPID2,Z.ASODIR2, ASODIR, Z.ASOTELF1,Z.ASOEMAIL,Z.REGPENID, Z.REGPENABR,'
                              +' Z.ASOFECNAC,Z.ASOAPTSER,Z.FALLECIDO,Z.RESTRICCIONES,  '
                              +' Z.DIR_PRI_1, DIR_PRI_2, Z.TEL_FIJO, TEL_CELU, CORREO_PRI_1, CORREO_PRI_2 '
                              +'From ('+xSQL+xSQLWhere+xSQLOrderBy+') Z ');
// Fin  HPC_201811_PRE : Funcionalidad de Contactabilidad añadida
      DM1.cdsQry10.Open;

      DM1.cdsQry10.Filtered := False;
      DM1.cdsQry10.Filter   := '( (ASOTIPID='+xDo2+') or (ASOTIPID='+xVo2+') or (ASOTIPID='+xCe2+') or (ASOTIPID='+xCo2+') )';
      DM1.cdsQry10.Filtered := True;
//Final HPC_201606_PRE
      DM1.cdsQry10.IndexFieldNames:='DEP; PROV; DIST;APELLIDOS_NOMBRES ';

      lblContador.Caption := IntToStr(DM1.cdsQry10.RecordCount) + ' Registros ';

      BitExporta.Enabled := true;
      BitPrint.Enabled := true;

      dbgprevio.Selected.Clear;
      dbgprevio.Selected.Add('DEP'#9'15'#9'Departamento'#9#9);
      dbgprevio.Selected.Add('PROV'#9'15'#9'Provincia'#9#9);
      dbgprevio.Selected.Add('DIST'#9'15'#9'Distrito'#9#9);
      {dbgprevio.Selected.Add('CENTRO_EDUCATIVO'#9'25'#9'Centro Educativo'#9#9);
      dbgprevio.Selected.Add('NIV_CEN_EDUCATIVO'#9'15'#9'Nivel'#9#9);
      dbgprevio.Selected.Add('CPO_CEN_EDUCATIVO'#9'25'#9'Centro Poblado~del Centro Educativo'#9#9);
      dbgprevio.Selected.Add('DIR_CEN_EDUCATIVO'#9'25'#9'Dirección Centro Educ.'#9#9); }

      dbgprevio.Selected.Add('APELLIDOS_NOMBRES'#9'25'#9'Apellidos y Nombres'#9#9);
      dbgprevio.Selected.Add('ASODNI'#9'10'#9'DNI'#9#9);
      dbgprevio.Selected.Add('ASOTIPID'#9'4'#9'Tipo'#9#9);
      dbgprevio.Selected.Add('REGPENABR'#9'10'#9'Reg. Pensión'#9#9);
      dbgprevio.Selected.Add('DES_SIT'#9'25'#9'Sit~Actual'#9#9);
      dbgprevio.Selected.Add('AUTORIZO_DSCTO'#9'3'#9'Aut~Descuento'#9#9);
// Inicio HPC_201811_PRE : Funcionalidad de Contactabilidad añadida
//      dbgprevio.Selected.Add('ASODIR'#9'50'#9'Dirección Dom.'#9'F'#9);
      dbgprevio.Selected.Add('DIR_PRI_1'#9'65'#9'Direcciones'#9'F'#9);
//      dbgprevio.Selected.Add('ASOTELF1'#9'20'#9'Teléfono'#9#9);
      dbgprevio.Selected.Add('TEL_FIJO'#9'25'#9'Teléfonos'#9#9);
//      dbgprevio.Selected.Add('ASOEMAIL'#9'25'#9'Correo~Electronico'#9#9);
      dbgprevio.Selected.Add('CORREO_PRI_1'#9'35'#9'Correos~Electronicos'#9#9);

      dbgprevio.Selected.Add('ASOFECNAC'#9'25'#9'Fecha Nac.'#9#9);
      dbgprevio.Selected.Add('ASOAPTSER'#9'15'#9'Aport/Doc.Reg'#9#9);
      dbgprevio.Selected.Add('FALLECIDO'#9'15'#9'Estado Fallec.'#9#9);
      dbgprevio.Selected.Add('RESTRICCIONES'#9'15'#9'Estado Fallec. Reniec'#9#9);

      dbgprevio.RowHeightPercent:=200;
      dbgprevio.SetControlType( 'DIR_PRI_1', fctCustom , 'wwDataInspector1;T');
      dbgprevio.SetControlType( 'TEL_FIJO', fctCustom , 'wwDataInspector2;T');
      dbgprevio.SetControlType( 'CORREO_PRI_1', fctCustom , 'wwDataInspector3;T');
// Fin  HPC_201811_PRE : Funcionalidad de Contactabilidad añadida
      dbgprevio.ApplySelected;


      end;     //fin de query





      Screen.Cursor := crDefault;

      DM1.cdsQry10.IndexFieldNames:='';
End;
//Fin: HPC_201502_PRE

procedure TFHojaTrabajoCampo.dblcddptoidChange(Sender: TObject);
Var xSql:String;
begin
  if dblcddptoid.Text <>'' then
  begin
  If Length(Trim(dblcddptoid.Text)) = 2 Then
  begin
     EdtDpto.Text := DM1.DevuelveValor('APO158', 'DPTODES', 'DPTOID', dblcddptoid.Text);
     If Trim(EdtDpto.Text) <> '' Then
     Begin
        xSql := 'SELECT CIUDID, CIUDDES FROM APO123 WHERE DPTOID = '+QuotedStr(dblcddptoid.Text)+' ORDER BY CIUDID';
        DM1.cdsProvincia.Close;
        DM1.cdsProvincia.DataRequest(xSql);
        DM1.cdsProvincia.Open;
        dblcdprovid.Selected.Clear;
        dblcdprovid.Selected.Add('CIUDID'#9'4'#9'Código'#9#9);
        dblcdprovid.Selected.Add('CIUDDES'#9'15'#9'Descripción'#9#9);
     End;
    dblcdprovid.Enabled:=true;
  end;
  end
  else
  begin
        dblcddptoid.Text := '';
        EdtDpto.Text    := '';
        dblcdprovid.Text := '';
        EdtProv.Text    := '';
        dblcdDistId.Text := '';
        edtDist.Text    := '';
  End;
End;

procedure TFHojaTrabajoCampo.dblcddptoidExit(Sender: TObject);
begin
  If Trim(dblcddptoid.Text) = '' Then
  Begin
     EdtDpto.Text    := '';
     dblcdprovid.Enabled:=false;
     dblcdprovid.Text := '';
     EdtProv.Text    := '';
     dblcdprovid.Enabled:=false;
     dblcdprovid.Text := '';
     EdtProv.Text    := '';
     dblcdDistId.Enabled:=false;
     dblcdDistId.Text := '';
     edtDist.Text    := '';
  End;
end;

procedure TFHojaTrabajoCampo.dblcdprovidChange(Sender: TObject);
Var xSql:String;
begin
  if dblcdprovid.Text <>'' then
  begin
  If Length(Trim(dblcdprovid.Text)) = 4 Then
  Begin
     EdtProv.Text := DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', dblcdprovid.Text);
     If Trim(EdtProv.Text) <> '' Then
     Begin
        xSql := 'SELECT ZIPID, ZIPDES FROM APO122 WHERE CIUDID = '+QuotedStr(dblcdprovid.Text)+' ORDER BY ZIPID';
        DM1.cdsDist.Close;
        DM1.cdsDist.DataRequest(xSql);
        DM1.cdsDist.Open;
        dblcdDistId.Selected.Clear;
        dblcdDistId.Selected.Add('ZIPID'#9'6'#9'Código'#9#9);
        dblcdDistId.Selected.Add('ZIPDES'#9'25'#9'Descripción'#9#9);
     End;
     dblcdDistId.Enabled:=true;
  End;
  end
  else
  begin
        dblcdprovid.Text := '';
        EdtProv.Text    := '';
        dblcdDistId.Text := '';
        edtDist.Text    := '';
  end;
end;

procedure TFHojaTrabajoCampo.dblcdprovidExit(Sender: TObject);
begin
  If Trim(dblcdprovid.Text) = '' Then
  Begin
     EdtProv.Text    := '';
     dblcdDistId.Enabled:=false;
     dblcdDistId.Text := '';
     edtDist.Text    := '';
  End;
end;

procedure TFHojaTrabajoCampo.dblcdDistIdChange(Sender: TObject);
begin
  if dblcdDistId.Text <>'' then
  begin
  If Length(Trim(dblcdDistId.Text)) = 6 Then
  Begin
   edtDist.Text := DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', dblcdDistId.Text);
  end;
  end
  else
  begin
   dblcdDistId.Text := '';
   edtDist.Text    := '';
  end;
end;

Procedure TFHojaTrabajoCampo.BitExportaClick(Sender: TObject);
Begin
   dtgExcel.DataSource:=DM1.dsQry10;
   With dtgExcel, dtgExcel.ExportOptions Do
        Begin
                ExportType := wwgetSYLK;
                FileName := 'Resumen.slk';
                Save;
                If Not (esoClipboard In Options) Then
                ShellExecute(Handle, 'Open', PChar(dtgExcel.exportoptions.Filename), Nil, Nil, sw_shownormal);
        End;

End;

Procedure TFHojaTrabajoCampo.BitPrintClick(Sender: TObject);
Var xNumColegio: integer;
Var xNomColegio: String;
Begin
      Screen.Cursor := crHourGlass;
     if rbColegio.Checked=true then
     begin
      // determina número de colegio según lista
     // se imprimirá debajo del número de página
      xNumColegio := 0;
      DM1.cdsQry10.First;
      While Not DM1.cdsQry10.EOF Do
      Begin
         xNumColegio := xNumColegio + 1;
         xNomColegio := DM1.cdsQry10.FieldByName('CENTRO_EDUCATIVO').AsString;
         While (Not DM1.cdsQry10.EOF)
            And (DM1.cdsQry10.FieldByName('CENTRO_EDUCATIVO').AsString = xNomColegio) Do
         Begin
            DM1.cdsQry10.Edit;
            DM1.cdsQry10.FieldByName('NUMCOL').AsInteger := xNumColegio;
            DM1.cdsQry10.Next;
         End;
      End;
    DM1.cdsQry10.First;

     ppltitulo.Caption := 'HOJA DE TRABAJO DE CAMPO POR COLEGIOS - ' + QuotedStr(DM1.cdsDpto.fieldbyname('DPTODES').AsString);
     pprAutxCenEdu.Print;
     //ppDesigner1.Show;
   end;

   if rbDomicilio.Checked=true then
   begin
       // Inicio: SPP_201404_PRE
       ppLabel1.Caption := 'HOJA DE TRABAJO DE CAMPO POR DOMICILIOS - ' + QuotedStr(DM1.cdsDpto.fieldbyname('DPTODES').AsString);
       // Fin: SPP_201403_PRE
       DM1.cdsQry10.IndexFieldNames:='DEP; PROV; DIST;NIV_CEN_EDUCATIVO;APELLIDOS_NOMBRES ' ;
       ppbdAutxDom.DataSource:=DM1.dsQry10;
       pprAutxDom.Print;
       //ppDesigner2.Show;
   end;

   Screen.Cursor := crDefault;

   DM1.cdsQry10.IndexFieldNames:='';
   
End;

(******************************************************************************)

Procedure TFHojaTrabajoCampo.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   DM1.cdsDpto.Close;
   DM1.cdsDpto.Filter := '';
   DM1.cdsDpto.IndexFieldNames := '';

   DM1.cdsProvincia.Close;
   DM1.cdsProvincia.Filter := '';
   DM1.cdsProvincia.IndexFieldNames := '';

   DM1.cdsQry.Close;
   DM1.cdsQry.Filter := '';
   DM1.cdsQry.IndexFieldNames := '';

   // Inicio: SPP_201302_PRE
   {DM1.CdsReporte.Close;
   DM1.CdsReporte.Filter := '';
   DM1.CdsReporte.IndexFieldNames := '';}
   // Fin: SPP_201302_PRE

   Action := caFree;
End;

Procedure TFHojaTrabajoCampo.btnCerrarClick(Sender: TObject);
Begin
   DM1.cdsQry.IndexFieldNames:='';
   Close;
End;

Procedure TFHojaTrabajoCampo.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If Key = #13 Then
   Begin
      Key := #0;
      Perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFHojaTrabajoCampo.FormActivate(Sender: TObject);
Var
   xSQL: String;
Begin
     //lLena Combo Departamento
      xSQL := 'SELECT DPTOID,DPTODES FROM APO158';
        DM1.cdsDpto.Close;
        DM1.cdsDpto.DataRequest(xSQL);
        DM1.cdsDpto.Open;
        dblcddptoid.LookupTable := DM1.cdsDpto;
        dblcddptoid.Selected.Clear;
        dblcddptoid.Selected.Add('DPTOID'#9'3'#9'Código'#9#9);
        dblcddptoid.Selected.Add('DPTODES'#9'17'#9'Descripción'#9#9);  

   //--Llena Combo Regimen de Pension--//
   xSql := 'SELECT '''' REGPENID,''-TODOS-'' REGPENABR from dual UNION ALL SELECT A.REGPENID,A.REGPENABR FROM APO105 A';
   DM1.cdsRegPension.Close;
   DM1.cdsRegPension.DataRequest(xSql);
   DM1.cdsRegPension.Open;
   dblcRegPension.LookupTable := DM1.cdsRegPension;
   dblcRegPension.LookupField := 'REGPENID';
   dblcRegPension.Selected.Clear;
   dblcRegPension.Selected.Add('REGPENID'#9'5'#9'Codigo'#9#9);
   dblcRegPension.Selected.Add('REGPENABR'#9'9'#9'Descripcion'#9#9);
   dblcRegPension.Text:=DM1.cdsRegPension.fieldbyname('REGPENID').AsString;
   // Inicio: SPP_201404_PRE
   mdesRegPen.Text:='-TODOS-';

    //--Llena Combo Firmo CADAPAS--//
   xSql := ' SELECT D.VALDES01,D.NOMVAL FROM ASO_GENERICA_CAB C  '
                        +  'INNER JOIN ASO_GENERICA_DET D ON C.CODCAB=D.CODCAB  '
                        + 'AND C.ESTREG=1 '
                        +  'AND D.ESTREG=1   '
                        +  'AND C.CODCAB=''FIRMO'' ORDER BY 1 DESC '  ;
   DM1.cdsQry23.Close;
   DM1.cdsQry23.DataRequest(xSql);
   DM1.cdsQry23.Open;
   dblcFirmo.LookupTable := DM1.cdsQry23;
   dblcFirmo.LookupField := 'VALDES01';
   dblcFirmo.Selected.Clear;
//Inicio: HPC:201501_PRE
   dblcFirmo.Selected.Add('NOMVAL'#9'8'#9'Descripción'#9#9);
   dblcFirmo.Text:='-TODOS-';

     //--Llena combo Fallecidos--//
   xSql := 'SELECT D.VALDES01,D.NOMVAL FROM ASO_GENERICA_CAB C  '
                        +  'INNER JOIN ASO_GENERICA_DET D ON C.CODCAB=D.CODCAB  '
                        + 'AND C.ESTREG=1 '
                        +  'AND D.ESTREG=1   '
                        +  'AND C.CODCAB=''FIRMO'' ORDER BY 1 DESC '  ;
   DM1.cdsQry24.Close;
   DM1.cdsQry24.DataRequest(xSql);
   DM1.cdsQry24.Open;
   dblcFallecidos.LookupTable := DM1.cdsQry24;
   dblcFallecidos.LookupField := 'NOMVAL';
   dblcFallecidos.Selected.Clear;
   dblcFallecidos.Selected.Add('NOMVAL'#9'8'#9'Código'#9#9);
   dblcFallecidos.Text:='NO';
//Fin: HPC:201501_PRE
   

   //Valores inciales
   rbDomicilio.Checked:=true;
   lblContador.Caption:=IntToStr(0)+' Registros' ;
   dtgExcel.Visible:=false;
   rbColegio.Checked:=true;
   cbDo.Checked:=true;
   cbVo.Checked:=true;
   cbCadaps.Checked:=false;
   // Fin: SPP_201404_PRE

   xSQL:=' SELECT UNIV.ZIPID,'
+'        UNIV.UBIGEO_DIR,'
+'        NVL(DEP.DPTODES, ''Z:DEP. NO UBICADA'') DEP,'
+'        NVL(PROV.CIUDDES, ''Z:PROV. NO UBICADA'') PROV,'
+'        NVL(DIST.ZIPABR, ''Z:DIST. NO UBICADA'') DIST,'
+'        UNIV.CPO_CEN_EDUCATIVO,'
+'        UNIV.NIV_CEN_EDUCATIVO,'
+'        UNIV.CENTRO_EDUCATIVO,'
+'        UNIV.DIR_CEN_EDUCATIVO,'
+'        UNIV.APELLIDOS_NOMBRES,'
+'        UNIV.ASODNI,'
+'        UNIV.AUTORIZO_DSCTO,'
+'        UNIV.DES_SIT,'
+'        UNIV.SINFIRMA,'
+'        UNIV.NUMCOL,'
+'        UNIV.ASOTIPID,'
+'        UNIV.ASODIR||''-''||DEPDOM.DPTODES||''-''||PROVDOM.CIUDDES||''-''||DISTDOM.ZIPABR ASODIR,'
+'        UNIV.ASODIR2,'
+'        UNIV.ASOTELF1,'
+'        UNIV.ASOEMAIL,'
+'        UNIV.REGPENID,'
+'        REG.REGPENABR'
+'   FROM (SELECT X.ZIPID,'
+'                X.UBIGEO_DIR,'
+'                NVL(CENPO, ''Z:CPO. NO UBICADA'') CPO_CEN_EDUCATIVO,'
+'                NVL(NIVEDU_DES, ''Z:NIV_CEN. NO UBICADA'') NIV_CEN_EDUCATIVO,'
+'                NVL(NOMCENEDU, ''Z:C.E. NO UBICADA'') CENTRO_EDUCATIVO,'
+'                NVL(DIREC, ''Z:DIR_CE. NO UBICADA'') DIR_CEN_EDUCATIVO,'
+'                X.ASOAPENOM APELLIDOS_NOMBRES,'
+'                X.ASODNI,'
+'                AUTDESAPO AUTORIZO_DSCTO,'
+'                DES_SIT,'
+'                SINFIRMA,'
+'                0 NUMCOL,'
+'                X.ASOTIPID,'
+'                REGPENID,'
+'                ASODIR,'
+'                ASODIR2,'
+'                ASOTELF1,'
+'                ASOEMAIL'
+'           FROM (SELECT B.ZIPID,'
+'                        A.UBIGEO_DIR,'
+'                        B.ASOAPENOM,'
+'                        NVL(B.AUTDESAPO, ''N'') AUTDESAPO,'
+'                        A.NOMCENEDU,'
+'                        A.CENPO,'
+'                        A.DIREC,'
+'                        A.NIVEDU_DES,'
+'                        B.ASODNI,'
+'                        SIT.DES_SIT,'
+'                        CASE'
+'                          WHEN NVL(AUTDESAPO, ''N'') = ''N'' THEN'
+' 1'
+'                          ELSE'
+' 0'
+'                        END SINFIRMA,'
+'                        B.ASOTIPID,'
+'                        trim(B.ASODIR) ASODIR,'
+'                        B.ASODIR ASODIR2,'
+'                        B.ASOTELF1,'
+'                        B.ASOEMAIL,'
+'                        B.ASOFECNAC,'
+'                        B.REGPENID'
+'                   FROM (SELECT X.CENEDUID,'
+'                                X.UBIGEO_DIR,'
+'                                X.NOMCENEDU,'
+'                                X.CENPO,'
+'                                X.DIREC,'
+'                                Y.NIVEDU_DES'
+'                           FROM ASO_CEN_EDU X, NIV_CEN_EDU Y'
+'                          WHERE X.NIVEDU_ID = Y.NIVEDU_ID(+)) A,'
+'                        APO201 B,'
+'                        (SELECT ASOID,'
+'                                SITACT,'
+'                                ROW_NUMBER() OVER(PARTITION BY ASOID ORDER BY ASOID,FREG DESC )DRK                                '
+'                                FROM APO206) B2,'
+'                        ASO_PAD_SIT_ASO SIT                       '
+'                  WHERE A.CENEDUID = B.CENEDUID'
+'                    AND B2.DRK=1 AND B.ASOID = B2.ASOID(+) '
+'                    AND SIT.COD_MAE = 02'
+'                    AND B2.SITACT = SIT.COD_SIT(+)                                '
+'                 UNION ALL'
+'                 SELECT B.ZIPID,'
+'                        A.UBIGEO_DIR,'
+'                        B.ASOAPENOM,'
+'                        NVL(B.AUTDESAPO, ''N'') AUTDESAPO,'
+'                        A.NOMCENEDU,'
+'                        A.CENPO,'
+'                        A.DIREC,'
+'                        A.NIVEDU_DES,'
+'                        B.ASODNI,'
+'                        SIT.DES_SIT,'
+'                        CASE'
+'                          WHEN NVL(AUTDESAPO, ''N'') = ''N'' THEN'
+' 1'
+'                          ELSE'
+' 0'
+'                        END SINFIRMA,'
+'                        B.ASOTIPID,'
+'                        B.ASODIR ASODIR,'
+'                        B.ASODIR ASODIR2,'
+'                        B.ASOTELF1,'
+'                        B.ASOEMAIL,'
+'                        B.ASOFECNAC,'
+'                        B.REGPENID'
+'                   FROM (SELECT X.CENEDUID,'
+'                                X.UBIGEO_DIR,'
+'                                X.NOMCENEDU,'
+'                                X.CENPO,'
+'                                X.DIREC,'
+'                                Y.NIVEDU_DES'
+'                           FROM ASO_CEN_EDU X, NIV_CEN_EDU Y'
+'                          WHERE X.NIVEDU_ID = Y.NIVEDU_ID(+)) A,'
+'                        ASO_NUE_CLI B,                     '
+'                        (SELECT ASOID,'
+'                                SITACT,'
+'                                ROW_NUMBER() OVER(PARTITION BY ASOID ORDER BY ASOID,FREG DESC )DRK2                                '
+'                                FROM APO206) B2,'
+'                        ASO_PAD_SIT_ASO SIT                     '
+'                  WHERE A.CENEDUID = B.CENEDUID'
+'                    AND NVL(B.AUTDESAPO, ''N'') = ''N'''
+'                    AND B.FEC_AUT_CLI IS NULL'
+'                    AND B.ACTARCREN = ''S'''
+'                    AND B2.DRK2=1 AND B.ASOID = B2.ASOID(+)  '
+'                    AND SIT.COD_MAE(+) = 02'
+'                    AND B2.SITACT = SIT.COD_SIT(+)'
// INICIO HPC_201602_PRE
// COMENTAR CONSULTA DE BASE DE DATOS
+'                    AND NOT EXISTS (SELECT 1 FROM APO201 WHERE ASOID=B.ASOID)) X /*,'
+'                (SELECT ASODNI, MAX(TIPSER) TIPSER'
+'                   FROM ASO_PAD_HIS'
+'                  GROUP BY ASODNI) Y'
+'          WHERE X.ASODNI = Y.ASODNI(+)'
+'            AND NVL(Y.TIPSER, 01) IN (01, 08)*/) UNIV'
// FIN HPC_201602_PRE
+'   LEFT JOIN APO158 DEP'
+'     ON DEP.DPTOID = SUBSTR(UNIV.UBIGEO_DIR, 1, 2)'
+'   LEFT JOIN APO123 PROV'
+'     ON PROV.DPTOID = SUBSTR(UNIV.UBIGEO_DIR, 1, 2)'
+'    AND PROV.CIUDID = SUBSTR(UNIV.UBIGEO_DIR, 1, 4)'
+'   LEFT JOIN APO122 DIST'
+'     ON DIST.ZIPID = UNIV.UBIGEO_DIR'
+'   LEFT JOIN APO105 REG'
+'     ON REG.REGPENID = UNIV.REGPENID'
+'   LEFT JOIN APO158 DEPDOM'
+'    ON DEPDOM.DPTOID = SUBSTR(UNIV.ZIPID, 1, 2)'
+'  LEFT JOIN APO123 PROVDOM'
+'    ON PROVDOM.DPTOID = SUBSTR(UNIV.ZIPID, 1, 2)'
+'   AND PROVDOM.CIUDID = SUBSTR(UNIV.ZIPID, 1, 4)'
+'  LEFT JOIN APO122 DISTDOM'
+'    ON DISTDOM.ZIPID = UNIV.ZIPID'
+'  WHERE NUMCOL = 5';

   DM1.cdsQry10.Close;
   DM1.cdsQry10.DataRequest(xSQL);
   DM1.cdsQry10.Open;


   dbgprevio.Selected.Clear;
   dbgprevio.Selected.Add('DEP'#9'15'#9'Departamento'#9#9);
      dbgprevio.Selected.Add('PROV'#9'15'#9'Provincia'#9#9);
      dbgprevio.Selected.Add('DIST'#9'15'#9'Distrito'#9#9);
      dbgprevio.Selected.Add('CPO_CEN_EDUCATIVO'#9'25'#9'Centro Poblado~del Centro Educativo'#9#9);
      dbgprevio.Selected.Add('CENTRO_EDUCATIVO'#9'25'#9'Centro Educativo'#9#9);
      dbgprevio.Selected.Add('NIV_CEN_EDUCATIVO'#9'15'#9'Nivel'#9#9);
      dbgprevio.Selected.Add('DIR_CEN_EDUCATIVO'#9'25'#9'Dirección Centro Educ.'#9#9);
      dbgprevio.Selected.Add('APELLIDOS_NOMBRES'#9'25'#9'Apellidos y Nombres'#9#9);
      dbgprevio.Selected.Add('ASODNI'#9'10'#9'DNI'#9#9);
      dbgprevio.Selected.Add('ASOTIPID'#9'4'#9'Tipo'#9#9);
      dbgprevio.Selected.Add('REGPENABR'#9'10'#9'Reg. Pensión'#9#9);
      dbgprevio.Selected.Add('DES_SIT'#9'25'#9'Sit~Actual'#9#9);
      dbgprevio.Selected.Add('AUTORIZO_DSCTO'#9'3'#9'Aut~Descuento'#9#9);
// Inicio HPC_201811_PRE : Funcionalidad de Contactabilidad añadida
      dbgprevio.Selected.Add('ASODIR'#9'65'#9'Dirección Dom.'#9#9);
      dbgprevio.Selected.Add('ASOTELF1'#9'25'#9'Teléfono'#9#9);
      dbgprevio.Selected.Add('ASOEMAIL'#9'35'#9'Correo~Electronico'#9#9);
      dbgprevio.ApplySelected;
// Fin  HPC_201811_PRE : Funcionalidad de Contactabilidad añadida

End;


// Inicio: SPP_201404_PRE
procedure TFHojaTrabajoCampo.rbDomicilioClick(Sender: TObject);
begin
     dblcddptoid.Text:='';
        dblcdprovid.Text:='';
        dblcdDistId.Text:='';
        dblcdprovid.Enabled:=false;
        dblcdDistId.Enabled:=false;
        cbCadaps.Enabled:=false;
end;

procedure TFHojaTrabajoCampo.rbColegioClick(Sender: TObject);
begin
        dblcddptoid.Text:='';
        dblcdprovid.Text:='';
        dblcdDistId.Text:='';
        dblcdprovid.Enabled:=false;
        dblcdDistId.Enabled:=false;
        cbCadaps.Enabled:=true;        

end;

procedure TFHojaTrabajoCampo.dblcRegPensionChange(Sender: TObject);
begin
      if dblcRegPension.Text ='' then
     begin
       mdesRegPen.Text:='-TODOS-';
     end
     else
     begin
         dblcRegPension.Text:=DM1.cdsRegPension.fieldbyname('REGPENID').AsString;
         mdesRegPen.Text:=DM1.cdsRegPension.fieldbyname('REGPENABR').AsString;
     end;
end;
//Inicio: HPC:201501_PRE
{
procedure TFHojaTrabajoCampo.dblcFirmoChange(Sender: TObject);
begin
     if dblcFirmo.Text='' then
     begin
        mdesFirmo.Text:='-TODOS-';
     end
     else
     begin
        dblcFirmo.Text:=DM1.cdsQry23.fieldbyname('VALDES01').AsString;
        mdesFirmo.Text:=DM1.cdsQry23.fieldbyname('NOMVAL').AsString;
     end;

end;
}
//Fin: HPC:201501_PRE
End.

