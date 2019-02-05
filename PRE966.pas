// HPP_201004_PRE
// HPP_201101_PRE
// HPP_201107_PRE   24/06/2011
// HPC_201307_PRE : Se añade imagen de nuevo logo institucional
// SPP_201401_PRE : Se realiza el pase a producción a partir del pase HPC_201307_PRE

UNIT PRE966;

INTERFACE

USES
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, wwdblook, StdCtrls, ExtCtrls, Buttons, Wwdbdlg, Grids, DBGrids,
   Wwdbigrd, Wwdbgrid, ppCtrls, ppBands, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppEndUsr,
   ppParameter, ppVar, ppStrtch, ppMemo,
   db, jpeg;  // SPP_201401_PRE

TYPE
   TFrmAutxCenEdu = CLASS(TForm)
      grbRepfPago: TGroupBox;
      Label1: TLabel;
      BitPrint: TBitBtn;
      BitExporta: TBitBtn;
      btnProcesar: TBitBtn;
      dblcddptoid: TwwDBLookupComboDlg;
      dtgData: TDBGrid;
      dbgprevio: TwwDBGrid;
      ppbdAutxCenEdu: TppBDEPipeline;
      pprAutxCenEdu: TppReport;
      ppDesigner1: TppDesigner;
      ppParameterList1: TppParameterList;
      ppHeaderBand1: TppHeaderBand;
      ppltitulo: TppLabel;
      // ppLabel1: TppLabel; SPP_201401_PRE
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppLabel22: TppLabel;
      ppSystemVariable3: TppSystemVariable;
      ppLabel23: TppLabel;
      ppLabel24: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppDBText6: TppDBText;
      ppLine1: TppLine;
      ppLine14: TppLine;
      ppLine16: TppLine;
      ppLine18: TppLine;
      ppLine20: TppLine;
      ppLine22: TppLine;
      ppLine23: TppLine;
      ppLine24: TppLine;
      ppLine28: TppLine;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppDBCalc1: TppDBCalc;
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
      ppGroup3: TppGroup;
      ppGroupHeaderBand3: TppGroupHeaderBand;
      ppDBText11: TppDBText;
      ppLabel19: TppLabel;
      ppLabel20: TppLabel;
      ppGroupFooterBand3: TppGroupFooterBand;
      ppLabel3: TppLabel;
      ppLabel7: TppLabel;
      ppLabel10: TppLabel;
      ppLabel12: TppLabel;
      ppLine2: TppLine;
      ppLine4: TppLine;
      ppLine6: TppLine;
      ppLine7: TppLine;
      ppLine8: TppLine;
      ppLine12: TppLine;
      ppLine13: TppLine;
      ppLine27: TppLine;
      ppLine29: TppLine;
      ppLabel16: TppLabel;
      ppLabel9: TppLabel;
      ppLabel17: TppLabel;
      ppLabel4: TppLabel;
      ppLabel8: TppLabel;
      ppLabel11: TppLabel;
      ppLine3: TppLine;
      ppLine25: TppLine;
      ppLine26: TppLine;
      EdtDpto: TEdit;
      Label2: TLabel;
    Label3: TLabel;
    dblcdprovid: TwwDBLookupComboDlg;
    EdtProv: TEdit;
    ppLabel29: TppLabel;
    ppDBMemo1: TppDBMemo;
    ppDBMemo2: TppDBMemo;
    ppLine5: TppLine;
    ppLine9: TppLine;
      ppLine11: TppLine;
      ppDBText1: TppDBText;
      ppLine15: TppLine;
      ppDBText4: TppDBText;
      ppGroup4: TppGroup;
      ppGroupHeaderBand4: TppGroupHeaderBand;
      ppGroupFooterBand4: TppGroupFooterBand;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLabel30: TppLabel;
      ppLine10: TppLine;
      ppLabel31: TppLabel;
      ppDBCalc2: TppDBCalc;
      ppLabel13: TppLabel;
      ppDBCalc3: TppDBCalc;
      gbControles: TGroupBox;
      btnCerrar: TBitBtn;
// fin: HPP_201101_PRE

// inicio HPP_201107_PRE
    ppDBText5: TppDBText;
    ppLabel32: TppLabel;
    ppImage1: TppImage; // SPP_201401_PRE
// fin HPP_201107_PRE

//
      PROCEDURE FormShow(Sender: TObject);
      PROCEDURE btnProcesarClick(Sender: TObject);
      PROCEDURE dblcddptoidExit(Sender: TObject);
      PROCEDURE BitExportaClick(Sender: TObject);
      PROCEDURE BitPrintClick(Sender: TObject);
      PROCEDURE dblcdprovidExit(Sender: TObject);
// inicio: HPP_201004_PRE
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
// fin: HPP_201004_PRE
// inicio: HPP_201101_PRE
    procedure btnCerrarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
// fin: HPP_201101_PRE
//
   Private
    { Private declarations }
   Public
    { Public declarations }
   END;

VAR
   FrmAutxCenEdu: TFrmAutxCenEdu;

IMPLEMENTATION

USES PREDM;

{$R *.dfm}

(******************************************************************************)

PROCEDURE TFrmAutxCenEdu.FormShow(Sender: TObject);
VAR
   xSQL: STRING;
BEGIN
// inicio: HPP_201004_PRE
   xSQL := 'SELECT DPTOID,DPTODES FROM APO158';
   DM1.cdsDpto.Close;
   DM1.cdsDpto.DataRequest(xSQL);
   DM1.cdsDpto.Open;
   dblcddptoid.LookupTable :=DM1.cdsDpto;
   dblcddptoid.Selected.Clear;
   dblcddptoid.Selected.Add('DPTOID'#9'3'#9'Código'#9#9);
   dblcddptoid.Selected.Add('DPTODES'#9'17'#9'Descripción'#9#9);

   xSQL := 'SELECT DPTOID,CIUDID,CIUDDES FROM APO123';
   DM1.cdsProvincia.Close;
   DM1.cdsProvincia.DataRequest(xSQL);
   DM1.cdsProvincia.Open;
   dblcdprovid.LookupTable :=DM1.cdsProvincia;
   dblcdprovid.Selected.Clear;
   dblcdprovid.Selected.Add('CIUDID'#9'3'#9'Código'#9#9);
   dblcdprovid.Selected.Add('CIUDDES'#9'17'#9'Descripción'#9#9);

   DM1.cdsProvincia.Filtered := false;
   DM1.cdsProvincia.Filter := 'DPTOID=''#%&/''';
   DM1.cdsProvincia.Filtered := true;

   dm1.cdsQry.Close;
// fin: HPP_201004_PRE
   dbgprevio.DataSource := dm1.dsQry;
   ppbdAutxCenEdu.DataSource := dm1.dsQry;

END;

(******************************************************************************)

PROCEDURE TFrmAutxCenEdu.btnProcesarClick(Sender: TObject);

   FUNCTION isProceso(): boolean;
   VAR
      xSQL: STRING;
      xNumColegio : integer; // HPP_201107_PRE
      xNomColegio : String; // HPP_201107_PRE
   BEGIN
      Screen.Cursor := crHourGlass;
      result := false;
// inicio: HPP_201004_PRE
      // INICIO SAR2010-0282
//inicio: HPP_201101_PRE
//se agregan los campos Situacion actual del docente DES_SIT y asociado sin firma SINFIRMA
      xSQL := 'SELECT ROWNUM NUM, CIUDDES PROVINCIA, ZIPDES DISTRITO, CENPO CPO_CEN_EDUCATIVO, '
         + '          NIVEDU_DES NIV_CEN_EDUCATIVO, NOMCENEDU CENTRO_EDUCATIVO, '
         + '          DIREC DIR_CEN_EDUCATIVO,  '
         + '          ASOAPENOM APELLIDOS_NOMBRES, '
         + '          ASODNI, '
// inicio HPP_201107_PRE
{
         + '          AUTDESAPO AUTORIZO_DSCTO, DES_SIT, SINFIRMA'
}
         + '          AUTDESAPO AUTORIZO_DSCTO, DES_SIT, SINFIRMA, 0 NUMCOL '
// fin HPP_201107_PRE
         + '  FROM (SELECT NVL(PROV.CIUDDES,''Z : PROV. NO UBICADA'') CIUDDES, '
         + '               NVL(DIST.ZIPDES,''Z : DIST. NO UBICADO'') ZIPDES, '
         + '               B.ASOAPENOM, NVL(B.AUTDESAPO, ''N'') AUTDESAPO, '
         + '               A.NOMCENEDU, A.CENPO, A.DIREC, A.NIVEDU_DES, '
         + '               B.ASODNI, SIT.DES_SIT, CASE WHEN NVL(AUTDESAPO,''N'')=''N'' THEN 1 ELSE 0 END SINFIRMA'
         + '           FROM (SELECT X.CENEDUID, X.UBIGEO_DIR, X.NOMCENEDU, X.CENPO, X.DIREC,Y.NIVEDU_DES '
         + '                   FROM ASO_CEN_EDU X, NIV_CEN_EDU Y'
         + '                  WHERE SUBSTR(X.UBIGEO_DIR, 1, 4) = ' + QuotedStr(DM1.cdsProvincia.fieldbyname('CIUDID').AsString)
         + '                    AND X.NIVEDU_ID = Y.NIVEDU_ID(+)'
         + '                ) A, APO201 B, '
         + '                APO123 PROV, APO122 DIST, APO206 B2, ASO_PAD_SIT_ASO SIT '
         + '          WHERE A.CENEDUID = B.CENEDUID '
         + '            AND B.ASOTIPID =''DO'' '
         + '            AND SUBSTR(A.UBIGEO_DIR, 1, 2) = PROV.DPTOID(+) '
         + '            AND SUBSTR(A.UBIGEO_DIR, 1, 4) = PROV.CIUDID(+) '
         + '            AND SUBSTR(A.UBIGEO_DIR, 1, 2) = DIST.DPTOID(+) '
         + '            AND SUBSTR(A.UBIGEO_DIR, 1, 4) = DIST.CIUDID(+) '
         + '            AND A.UBIGEO_DIR = DIST.ZIPID(+) '
         + '            AND B.ASOID = B2.ASOID (+)'
         + '            AND B2.ITEM=(SELECT MAX(B3.ITEM) FROM APO206 B3 WHERE B3.ASOID = B.ASOID)'
// inicio HPC_201102_PRE
// se corrige añadiendo esta condición porque no se había considerado originalmente en el pase HPC_201101_PRE
         + '            AND SIT.COD_MAE=''02'' '
// fin HPC_201102_PRE
         + '            AND B2.SITACT = SIT.COD_SIT (+)'
         + '           ORDER BY NVL(PROV.CIUDDES,''Z : PROV. NO UBICADA''), NVL(DIST.ZIPDES,''Z : DIST. NO UBICADO''), '
         + '                    A.CENPO, A.NIVEDU_DES, A.NOMCENEDU, B.ASOAPENOM) X';
//fin: HPP_201101_PRE
      // FIN SAR2010-0282
// fin: HPP_201004_PRE
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSQL);
      DM1.cdsQry.Open;

// inicio HPP_201107_PRE
// determina número de colegio según lista
// se imprimirá debajo del número de página
      xNumColegio := 0;
      DM1.cdsQry.First;
      while not DM1.cdsQry.EOF do
      begin
         xNumColegio := xNumColegio+1;
         xNomColegio := DM1.cdsQry.FieldByName('CENTRO_EDUCATIVO').AsString;
         while (not DM1.cdsQry.EOF)
             and (DM1.cdsQry.FieldByName('CENTRO_EDUCATIVO').AsString=xNomColegio) do
         begin
            DM1.cdsQry.Edit;
            DM1.cdsQry.FieldByName('NUMCOL').AsInteger := xNumColegio; 
            DM1.cdsQry.Next;
         end;
      end;
      DM1.cdsQry.First;
// fin HPP_201107_PRE

      DM1.CdsReporte.Close;
      DM1.CdsReporte.DataRequest(xSQL);
      DM1.CdsReporte.Open;
      Screen.Cursor := crDefault;
      IF DM1.cdsQry.RecordCount > 0 THEN result := true;
   END;
BEGIN

   IF (trim(EdtDpto.Text) <> '') AND (trim(EdtProv.Text) <> '') THEN
   BEGIN
      IF isProceso THEN
      BEGIN
         BitExporta.Enabled := true;
         BitPrint.Enabled := true;
         dbgprevio.Selected.Clear;
// inicio: HPP_201004_PRE
         // INICIO SAR2010-0282
      // inicio: HPP_201101_PRE
         dbgprevio.Selected.Add('NUM'#9'3'#9'Número'#9#9);
         dbgprevio.Selected.Add('CENTRO_EDUCATIVO'#9'25'#9'Centro Educativo'#9#9);
         dbgprevio.Selected.Add('PROVINCIA'#9'15'#9'Provincia'#9#9);
         dbgprevio.Selected.Add('DISTRITO'#9'15'#9'Distrito'#9#9);
         dbgprevio.Selected.Add('CPO_CEN_EDUCATIVO'#9'25'#9'Centro Poblado~del Centro Educativo'#9#9);
         dbgprevio.Selected.Add('NIV_CEN_EDUCATIVO'#9'15'#9'Nivel'#9#9);
         dbgprevio.Selected.Add('DIR_CEN_EDUCATIVO'#9'25'#9'Dirección Centro Educ.'#9#9);
         dbgprevio.Selected.Add('ASODNI'#9'10'#9'DNI'#9#9);
         dbgprevio.Selected.Add('APELLIDOS_NOMBRES'#9'25'#9'Apellidos y Nombres'#9#9);
         dbgprevio.Selected.Add('DES_SIT'#9'25'#9'Sit~Actual'#9#9);
         dbgprevio.Selected.Add('AUTORIZO_DSCTO'#9'3'#9'Aut~Descuento'#9#9);
      // fin: HPP_201101_PRE
         // FIN SAR2010-0282
// fin: HPP_201004_PRE
         dbgprevio.ApplySelected;
      END;
   END
   ELSE
      showmessage('Seleccione un Departamento y una Provincia');
END;

(******************************************************************************)

PROCEDURE TFrmAutxCenEdu.BitExportaClick(Sender: TObject);
BEGIN
   DM1.HojaExcel('Resumen', DM1.dsReporte, dtgData);
END;

(******************************************************************************)

PROCEDURE TFrmAutxCenEdu.dblcddptoidExit(Sender: TObject);
BEGIN
   IF DM1.cdsDpto.Locate('DPTOID', VarArrayof([dblcddptoid.Text]), []) THEN
   BEGIN
      EdtDpto.Text := DM1.cdsDpto.fieldbyname('DPTODES').AsString;
      DM1.cdsProvincia.Filtered := false;
      DM1.cdsProvincia.Filter := 'DPTOID=' + QuotedStr(dblcddptoid.Text);
      DM1.cdsProvincia.Filtered := true;
   END
   ELSE
   BEGIN
      EdtDpto.Text := '';
      DM1.cdsProvincia.Filtered := false;
      DM1.cdsProvincia.Filter := 'DPTOID=''#%&/''';
      DM1.cdsProvincia.Filtered := true;
   END;
   BitExporta.Enabled := false;
   BitPrint.Enabled := false;
END;

(******************************************************************************)

PROCEDURE TFrmAutxCenEdu.dblcdprovidExit(Sender: TObject);
BEGIN
   IF DM1.cdsProvincia.Locate('CIUDID', VarArrayof([dblcdprovid.Text]), []) THEN
      EdtProv.Text := DM1.cdsProvincia.fieldbyname('CIUDDES').AsString
   ELSE
      EdtProv.Text := '';
   BitExporta.Enabled := false;
   BitPrint.Enabled := false;
END;

(******************************************************************************)

PROCEDURE TFrmAutxCenEdu.BitPrintClick(Sender: TObject);
BEGIN
   ppltitulo.Caption := 'HOJA DE CARGO POR ENTREGA DE ESTADOS DE CUENTA INDIVIDUAL POR COLEGIOS - ' + QuotedStr(DM1.cdsDpto.fieldbyname('DPTODES').AsString);
   pprAutxCenEdu.Print;
   //ppDesigner1.Show;
END;

(******************************************************************************)

procedure TFrmAutxCenEdu.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
// inicio: HPP_201004_PRE
   DM1.cdsDpto.Close;
   DM1.cdsDpto.Filter:='';
   DM1.cdsDpto.IndexFieldNames:='';

   DM1.cdsProvincia.Close;
   DM1.cdsProvincia.Filter:='';
   DM1.cdsProvincia.IndexFieldNames:='';

   DM1.cdsQry.Close;
   DM1.cdsQry.Filter:='';
   DM1.cdsQry.IndexFieldNames:='';

   DM1.CdsReporte.Close;
   DM1.CdsReporte.Filter:='';
   DM1.CdsReporte.IndexFieldNames:='';

   Action := caFree;
// fin: HPP_201004_PRE
end;
//Inicio: HPP_201101_PRE
procedure TFrmAutxCenEdu.btnCerrarClick(Sender: TObject);
begin
  Close;
end;
//fin: HPP_201101_PRE

procedure TFrmAutxCenEdu.FormKeyPress(Sender: TObject; var Key: Char);
begin
//inicio: HPP_201101_PRE
   If Key = #13 Then
   Begin
      Key := #0;
      Perform(CM_DialogKey, VK_TAB, 0);
   End;
//fin: HPP_201101_PRE
end;

END.

