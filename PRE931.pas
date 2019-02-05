// HPC_201307_PRE   : Se reemplaza los spinedit
// SPP_201401_PRE   : Se realiza el pase a producción a partir del pase HPC_201307_PRE

Unit PRE931;

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Grids, Wwdbigrd, Wwdbgrid, Buttons, Mask, wwdblook,
   Wwdbdlg, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd, ppClass,
   ppReport, ppCtrls, ppStrtch, ppSubRpt, ppBands, ppPrnabl, ppCache,
   ppParameter, DB, DBClient, ExtCtrls, Chart, ppVar, ppChrtDP, DbChart,
   ppChrt, Series, TeEngine, jpeg, ppMemo, TeeProcs, ToolEdit, CurrEdit, DBGrids,
  Spin; //SPP_201401_PRE
Type
   Tfcueinddis = Class(TForm)
      gbdistrito: TGroupBox;
      Label12: TLabel;
      dblcdcoddep: TwwDBLookupComboDlg;
      medesdep: TMaskEdit;
      Label13: TLabel;
      dblcdcodpro: TwwDBLookupComboDlg;
      Label14: TLabel;
      dblcdcoddis: TwwDBLookupComboDlg;
      medespro: TMaskEdit;
      medesdis: TMaskEdit;
      btnfiltrar: TBitBtn;
      Label1: TLabel;
      Label2: TLabel;
      Label3: TLabel;
      btncerrar: TBitBtn;
      pprepcueind: TppReport;
      ppbderepcuenind: TppBDEPipeline;
      ppParameterList1: TppParameterList;
      ppLabel232: TppLabel;
      ppLabel233: TppLabel;
      ppLabel248: TppLabel;
      ppLabel258: TppLabel;
      ppLabel261: TppLabel;
      ppShape9: TppShape;
      ppShape11: TppShape;
      ppShape10: TppShape;
      ppShape12: TppShape;
      ppShape13: TppShape;
      ppldesini: TppLabel;
      pplapoini: TppLabel;
      pplintini: TppLabel;
      pplbonini: TppLabel;
      pplsalini: TppLabel;
      ppDetailBand12: TppDetailBand;
      cdsest: TClientDataSet;
      dsest: TDataSource;
      Image1: TImage;
      ppbdedetapo: TppBDEPipeline;
      ppLabel236: TppLabel;
      ppLabel237: TppLabel;
      ppLabel238: TppLabel;
      ppLabel239: TppLabel;
      ppLabel240: TppLabel;
      ppLabel241: TppLabel;
      ppLabel242: TppLabel;
      ppLabel243: TppLabel;
      ppLabel244: TppLabel;
      ppLabel245: TppLabel;
      ppLabel246: TppLabel;
      ppLabel247: TppLabel;
      pplasoapenomdni_nc: TppLabel;
      pplasodir_nc: TppLabel;
      pplasodni_nc: TppLabel;
      ppldst_nc: TppLabel;
      pplprv_nc: TppLabel;
      ppldep_nc: TppLabel;
      ppLabel234: TppLabel;
      ppLabel235: TppLabel;
      pplasotelf1_nc: TppLabel;
      ppLabel249: TppLabel;
      ppLabel250: TppLabel;
      ppLabel251: TppLabel;
      ppLabel252: TppLabel;
      ppLabel253: TppLabel;
      ppLabel254: TppLabel;
      ppLabel264: TppLabel;
      ppLabel266: TppLabel;
      pplasocodmod_nc: TppLabel;
      pplunipro_nc: TppLabel;
      ppLabel255: TppLabel;
      ppLabel256: TppLabel;
      ppLabel257: TppLabel;
      ppldstdeslab_nc: TppLabel;
      ppLabel259: TppLabel;
      ppLabel260: TppLabel;
      pplprvdeslab_nc: TppLabel;
      ppLabel262: TppLabel;
      ppLabel263: TppLabel;
      ppldepdeslab_nc: TppLabel;
      ppLabel270: TppLabel;
      ppLabel271: TppLabel;
      ppluniges_nc: TppLabel;
      pplunipag_nc: TppLabel;
      ppLabel274: TppLabel;
      ppLabel275: TppLabel;
      ppLabel276: TppLabel;
      pplasodeslab_nc: TppLabel;
      pplasodirleb_nc: TppLabel;
      pplasofresnom_nc: TppLabel;
      ppLabel280: TppLabel;
      pplasoresnom_nc: TppLabel;
      ppLabel231: TppLabel;
      pplanoapo_nc: TppLabel;
      ppLabel50: TppLabel;
      ppShape1: TppShape;
      ppShape23: TppShape;
      ppShape24: TppShape;
      ppShape25: TppShape;
      ppShape26: TppShape;
      Chart1: TChart;
      Series1: TPieSeries;
      ppHeaderBand1: TppHeaderBand;
      ppShape2: TppShape;
      ppShape3: TppShape;
      ppShape14: TppShape;
      ppShape15: TppShape;
      ppShape16: TppShape;
      ppShape21: TppShape;
      pplanomes: TppLabel;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppShape17: TppShape;
      ppShape20: TppShape;
      ppLabel163: TppLabel;
      ppShape18: TppShape;
      ppShape19: TppShape;
      ppShape22: TppShape;
      pplapofin: TppLabel;
      pplintfin: TppLabel;
      pplbonfin: TppLabel;
      pplsalfin: TppLabel;
      ppImage3: TppImage;
      pplsaldoal: TppLabel;
      ppSummaryBand1: TppSummaryBand;
      gbimprimir: TGroupBox;
      btnimprimir: TBitBtn;
      Label4: TLabel;
      Label5: TLabel;
//Inicio: SPP_201401_PRE
      // ceinicio: TCurrencyEdit; 
      // cefinal: TCurrencyEdit; 
//Fin: SPP_201401_PRE
      btnaexcel: TBitBtn;
      DBGrid: TDBGrid;
      dbgprevio: TwwDBGrid;
      rgTipo: TRadioGroup;
      pplcpocenedu: TppLabel; // HPP_200901_PRE
      ppLabel2: TppLabel; // HPP_200901_PRE
      ppLabel3: TppLabel; // HPP_200901_PRE
//Inicio: SPP_201401_PRE
      ceinicio: TSpinEdit;  
      cefinal: TSpinEdit;  
//Fin: SPP_201401_PRE
      Procedure FormActivate(Sender: TObject);
      Procedure dblcdcoddepChange(Sender: TObject);
      Procedure dblcdcoddepExit(Sender: TObject);
      Procedure dblcdcodproChange(Sender: TObject);
      Procedure dblcdcodproExit(Sender: TObject);
      Procedure dblcdcoddisExit(Sender: TObject);
      Procedure btnfiltrarClick(Sender: TObject);
      Procedure btnimprimirClick(Sender: TObject);
      Procedure btncerrarClick(Sender: TObject);
      Procedure pplanomesPrint(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure btnaexcelClick(Sender: TObject);
      Procedure bbtnFilDisClick(Sender: TObject);
      Procedure dbgprevioTitleButtonClick(Sender: TObject;
         AFieldName: String);
   Private
    { Private declarations }
      sTipo: String;
   Public
    { Public declarations }
   End;

Var
   fcueinddis: Tfcueinddis;

Implementation

Uses PREDM;

{$R *.dfm}

Procedure Tfcueinddis.FormActivate(Sender: TObject);
Var
   xSql: String;
Begin
   xSql := 'SELECT DPTOID, DPTODES FROM APO158 ORDER BY DPTOID';
   DM1.cdsDpto.Close;
   DM1.cdsDpto.DataRequest(xSql);
   DM1.cdsDpto.Open;
   dblcdcoddep.Selected.Clear;
   dblcdcoddep.Selected.Add('DPTOID'#9'2'#9'Código'#9#9);
   dblcdcoddep.Selected.Add('DPTODES'#9'23'#9'Departamento'#9#9);

   If DM1.cdsReporte.Active = True Then DM1.cdsReporte.Close;
{  dbgprevio.Selected.Clear;
  dbgprevio.Selected.Add('NUMERO'#9'4'#9'Número'#9#9);
  dbgprevio.Selected.Add('ASOCODMOD'#9'10'#9'Código~Modular'#9#9);
  dbgprevio.Selected.Add('ASODNI'#9'8'#9'DNI del~asociado'#9#9);
  dbgprevio.Selected.Add('ASOAPENOMDNI'#9'42'#9'Apellidos y Nombre(s)~del asociado'#9#9);
  dbgprevio.Selected.Add('ASOFRESNOM'#9'10'#9'Fecha de~nombramiento'#9#9);
  dbgprevio.Selected.Add('ASODIR'#9'65'#9'Dirección del asociado'#9#9);
  dbgprevio.Selected.Add('DESURBVIV'#9'42'#9'Descripción~de la Urbanización'#9#9);
  dbgprevio.Selected.Add('NOMDIRVIV'#9'42'#9'Descripción de la~Calle'#9#9);
  dbgprevio.Selected.Add('NUMDIRVIV'#9'10'#9'Número~vivienda'#9#9);
  dbgprevio.Selected.Add('AUTORIZACION'#9'15'#9'Autorización~descuento'#9#9);
  dbgprevio.ApplySelected;
}
End;

Procedure Tfcueinddis.dblcdcoddepChange(Sender: TObject);
Begin
   dblcdcodpro.Text := '';
   medespro.Text := '';
   dblcdcoddis.Text := '';
   medesdis.Text := '';
End;

Procedure Tfcueinddis.dblcdcoddepExit(Sender: TObject);
Var
   xSql: String;
Begin
   If trim(dblcdcoddep.Text) = '' Then Exit;
   If Length(trim(dblcdcoddep.Text)) = 2 Then
   Begin
      If DM1.cdsDpto.Locate('DPTOID', VarArrayof([dblcdcoddep.text]), []) Then
      Begin
         medesdep.Text := DM1.cdsDpto.FieldByName('DPTODES').AsString;
         xSql := 'SELECT CIUDID, CIUDDES FROM APO123 WHERE DPTOID = ' + QuotedStr(dblcdcoddep.Text) + ' ORDER BY CIUDID';
         DM1.cdsProvincia.Close;
         DM1.cdsProvincia.DataRequest(xSql);
         DM1.cdsProvincia.Open;
         dblcdcodpro.Selected.Clear;
         dblcdcodpro.Selected.Add('CIUDID'#9'4'#9'Ubigeo'#9#9);
         dblcdcodpro.Selected.Add('CIUDDES'#9'23'#9'Provincia'#9#9);
         dblcdcodpro.Color := clWhite;
         dblcdcodpro.Enabled := True;
      {
      If Copy(DM1.cdsQry.FieldByName('ZIPID').AsString,1,2) = dblcdcoddep.Text Then
      Begin
         dblcdcodpro.Text := Copy(DM1.cdsQry.FieldByName('ZIPID').AsString,1,4);
         dblcdcoddis.Text := DM1.cdsQry.FieldByName('ZIPID').AsString;
      End;
      }
         dblcdcodpro.SetFocus;
         Exit;
      End
      Else
      Begin
         medesdep.Text := '';
         dblcdcodpro.Color := clMoneyGreen;
         dblcdcodpro.Enabled := False;
         dblcdcoddep.Text := '';
         MessageDlg('Código errado', mtError, [mbOk], 0);
         dblcdcoddep.SetFocus;
         Exit;
      End;
   End
   Else
   Begin
      medesdep.Text := '';
      dblcdcodpro.Color := clMoneyGreen;
      dblcdcodpro.Enabled := False;
      dblcdcoddep.Text := '';
      MessageDlg('Código errado', mtError, [mbOk], 0);
      dblcdcoddep.SetFocus;
      Exit;
   End;
End;

Procedure Tfcueinddis.dblcdcodproChange(Sender: TObject);
Begin
   dblcdcoddis.Text := '';
   medesdis.Text := '';
End;

Procedure Tfcueinddis.dblcdcodproExit(Sender: TObject);
Var
   xSql: String;
Begin
   If trim(dblcdcodpro.Text) = '' Then Exit;
   If Length(trim(dblcdcodpro.Text)) = 4 Then
   Begin
      If DM1.cdsProvincia.Locate('CIUDID', VarArrayof([dblcdcodpro.text]), []) Then
      Begin
         medespro.Text := DM1.cdsProvincia.FieldByName('CIUDDES').AsString;
         xSql := 'SELECT ZIPID, ZIPDES FROM APO122 WHERE CIUDID = ' + QuotedStr(dblcdcodpro.Text) + ' ORDER BY ZIPID';
         DM1.cdsDist.Close;
         DM1.cdsDist.DataRequest(xSql);
         DM1.cdsDist.Open;
         dblcdcoddis.Selected.Clear;
         dblcdcoddis.Selected.Add('ZIPID'#9'6'#9'Ubigeo'#9#9);
         dblcdcoddis.Selected.Add('ZIPDES'#9'23'#9'Distrito'#9#9);
         dblcdcoddis.Color := clWhite;
         dblcdcoddis.Enabled := True;

      {
      If Copy(DM1.cdsQry.FieldByName('ZIPID').AsString,1,4) = dblcdcodpro.Text Then
        dblcdcoddis.Text := DM1.cdsQry.FieldByName('ZIPID').AsString;
        }

         dblcdcoddis.SetFocus;
         Exit;

      End
      Else
      Begin
         medespro.Text := '';
         dblcdcoddis.Color := clMoneyGreen;
         dblcdcoddis.Enabled := False;
         dblcdcodpro.Text := '';
         MessageDlg('Código errado', mtError, [mbOk], 0);
         dblcdcodpro.SetFocus;
         Exit;
      End;
   End
   Else
   Begin
      medespro.Text := '';
      dblcdcodpro.Color := clMoneyGreen;
      dblcdcoddis.Enabled := False;
      dblcdcoddis.Text := '';
      MessageDlg('Código errado', mtError, [mbOk], 0);
      dblcdcodpro.SetFocus;
      Exit;
   End;
End;

Procedure Tfcueinddis.dblcdcoddisExit(Sender: TObject);
Begin
   If trim(dblcdcoddis.Text) = '' Then Exit;
   If Length(trim(dblcdcoddis.Text)) = 6 Then
   Begin
      If DM1.cdsDist.Locate('ZIPID', VarArrayof([dblcdcoddis.text]), []) Then
      Begin
         medesdis.Text := DM1.cdsDist.FieldByName('ZIPDES').AsString;
         Exit;
      End
      Else
      Begin
         medesdis.Text := '';
         dblcdcoddis.Text := '';
         MessageDlg('Código errado', mtError, [mbOk], 0);
         dblcdcoddis.SetFocus;
         Exit;
      End;
   End
   Else
   Begin
      dblcdcoddis.Text := '';
      medesdis.Text := '';
      MessageDlg('Código errado', mtError, [mbOk], 0);
      dblcdcodpro.SetFocus;
      Exit;
   End;
End;

Procedure Tfcueinddis.btnfiltrarClick(Sender: TObject);
Var
   xSql: String;
Begin
   If (dblcdcoddis.Text = '') Or (medesdis.Text = '') Then
   Begin
      ShowMessage('Falta seleccionar el Ubigeo de Distrito');
      Exit;
   End;

   If rgTipo.ItemIndex = 0 Then sTipo := 'A.ZIPID = ' + QuotedStr(dblcdcoddis.Text);
   If rgTipo.ItemIndex = 1 Then sTipo := 'A.ASODSTLABID = ' + QuotedStr(dblcdcoddis.Text);
   // pase 20 SAR 2008JC-0125 6/11/2008 se cambio condicional Y por condicional O
   // autorizado por Juan Sánchez
   If rgTipo.ItemIndex = 2 Then
      sTipo := '(A.ZIPID = ' + QuotedStr(dblcdcoddis.Text)
         + ' or A.ASODSTLABID=' + QuotedStr(dblcdcoddis.Text) + ')';

   screen.Cursor := crHourGlass;

   xSql := 'SELECT NUMERO, ASOID, ZIPID, ASODNI, ASOAPENOMDNI,CENEDUID, ASOFRESNOM, ASOFRESCESE, '
      + '       ASORESCESE, DPTO_DIR, PROV_DIR, DIST_DIR, ASODIR, ASOTELF1, ASOCODMOD, '
      + '       ASODESLAB, DPTO_LAB, PROV_LAB, DIST_LAB, ASODIRLAB, USEID, UPAGOID, '
      + '       UPROID, ASODSTLABID, ASORESNOM, DESURBVIV, DESETAVIV, NOMDIRVIV, '
      + '       NUMDIRVIV, AUTORIZACION '
      + '  FROM (SELECT ROWNUM NUMERO, ASOID, ZIPID, ASODNI, ASOAPENOMDNI, CENEDUID,ASOFRESNOM, '
      + '                ASOFRESCESE, ASORESCESE, DPTO_DIR, PROV_DIR, DIST_DIR, ASODIR, '
      + '                ASOTELF1, ASOCODMOD, ASODESLAB, DPTO_LAB, PROV_LAB, DIST_LAB, '
      + '                ASODIRLAB, USEID, UPAGOID, UPROID, ASODSTLABID, ASORESNOM, '
      + '                DESURBVIV, DESETAVIV, NOMDIRVIV, NUMDIRVIV, AUTORIZACION '
      + '           FROM (SELECT A.ASOID, A.ZIPID, A.ASODNI, A.ASOAPENOMDNI,A.CENEDUID, '
      + '                         A.ASOFRESNOM, A.ASOFRESCESE, A.ASORESCESE, '
      + '                         B.DPTODES DPTO_DIR, C.CIUDDES PROV_DIR, '
      + '                         D.ZIPDES DIST_DIR, A.ASODIR, A.ASOTELF1, A.ASOCODMOD, '
      + '                         A.ASODESLAB, E.DPTODES DPTO_LAB, F.CIUDDES PROV_LAB, '
      + '                         G.ZIPDES DIST_LAB, A.ASODIRLAB, A.USEID, A.UPAGOID, '
      + '                         A.UPROID, A.ASODSTLABID, A.ASORESNOM, A.DESURBVIV, '
      + '                         A.DESETAVIV, A.NOMDIRVIV, A.NUMDIRVIV, '
      + '                         CASE '
      + '                           WHEN NVL(A.AUTDESAPO, ''N'') = ''S'' THEN '
      + '                            ''SI'' '
      + '                           ELSE '
      + '                            ''NO'' '
      + '                         END AUTORIZACION '
      + '                    FROM APO201 A, APO158 B, APO123 C, APO122 D, APO158 E, '
      + '                         APO123 F, APO122 G '
      + '                   WHERE ' + sTipo
      + '                     AND A.ASOTIPID = ''DO'' '
      + '                     AND A.ASOFRESNOM IS NOT NULL '
      + '                     AND SUBSTR(A.ZIPID, 1, 2) = B.DPTOID(+) '
      + '                     AND SUBSTR(A.ZIPID, 1, 2) = C.DPTOID(+) '
      + '                     AND SUBSTR(A.ZIPID, 1, 4) = C.CIUDID(+) '
      + '                     AND SUBSTR(A.ZIPID, 1, 2) = D.DPTOID(+) '
      + '                     AND SUBSTR(A.ZIPID, 1, 4) = D.CIUDID(+) '
      + '                     AND A.ZIPID = D.ZIPID(+) '
      + '                     AND SUBSTR(A.ASODSTLABID, 1, 2) = E.DPTOID(+) '
      + '                     AND SUBSTR(A.ASODSTLABID, 1, 2) = F.DPTOID(+) '
      + '                     AND SUBSTR(A.ASODSTLABID, 1, 4) = F.CIUDID(+) '
      + '                     AND SUBSTR(A.ASODSTLABID, 1, 2) = G.DPTOID(+) '
      + '                     AND SUBSTR(A.ASODSTLABID, 1, 4) = G.CIUDID(+) '
      + '                     AND A.ASODSTLABID = G.ZIPID(+) '
      + '                   ORDER BY DESURBVIV, NOMDIRVIV, NUMDIRVIV) '
      + '          ORDER BY NUMERO)';


  (*
  //Modificado por Isaac Revilla - HPP_00019_PRE
  xSql := 'SELECT NUMERO,  ASOID, ZIPID, ASODNI, ASOAPENOMDNI, ASOFRESNOM, ASOFRESCESE, ASORESCESE, '
         +'       DPTO_DIR, PROV_DIR, DIST_DIR, ASODIR, ASOTELF1, ASOCODMOD,'
         +'       ASODESLAB, DPTO_LAB, PROV_LAB, DIST_LAB, ASODIRLAB, USEID, UPAGOID, UPROID, ASODSTLABID, '
         +'       ASORESNOM, DESURBVIV, DESETAVIV, NOMDIRVIV, NUMDIRVIV, AUTORIZACION '
         +'FROM (SELECT ROWNUM NUMERO,  ASOID, ZIPID, ASODNI, ASOAPENOMDNI, ASOFRESNOM, ASOFRESCESE, '
         +'             ASORESCESE, DPTO_DIR, PROV_DIR, DIST_DIR, ASODIR, ASOTELF1, ASOCODMOD, '
         +'             ASODESLAB, DPTO_LAB, PROV_LAB, DIST_LAB, ASODIRLAB, USEID, UPAGOID, UPROID, '
         +'             ASODSTLABID, ASORESNOM, DESURBVIV, DESETAVIV, NOMDIRVIV, NUMDIRVIV, AUTORIZACION '
         +'      FROM (SELECT A.ASOID, A.ZIPID, A.ASODNI, A.ASOAPENOMDNI, A.ASOFRESNOM, A.ASOFRESCESE, '
         +'                   A.ASORESCESE, B.DPTODES DPTO_DIR, C.CIUDDES PROV_DIR, D.ZIPDES DIST_DIR, '
         +'                   A.ASODIR, A.ASOTELF1, A.ASOCODMOD, A.ASODESLAB, B.DPTODES DPTO_LAB, '
         +'                   C.CIUDDES PROV_LAB, D.ZIPDES DIST_LAB, A.ASODIRLAB, A.USEID, A.UPAGOID, '
         +'                   A.UPROID, A.ASODSTLABID, A.ASORESNOM, A.DESURBVIV, A.DESETAVIV, A.NOMDIRVIV, '
         +'                   A.NUMDIRVIV, '
         +'                   CASE WHEN NVL(A.AUTDESAPO,''N'')=''S'' THEN ''SI'' ELSE ''NO'' END AUTORIZACION '
         +'             FROM APO201 A, APO158 B, APO123 C, APO122 D, APO158 E, APO123 F, APO122 G '
         +'            WHERE '+sTipo+' AND A.ASOTIPID = ''DO'' '
         +'              AND A.ASOFRESNOM IS NOT NULL AND SUBSTR(A.ZIPID,1,2) = B.DPTOID(+) '
         +'              AND SUBSTR(A.ZIPID,1,4) = C.CIUDID(+) '
         +'              AND A.ZIPID = D.ZIPID(+) AND SUBSTR(A.ASODSTLABID,1,2) = E.DPTOID(+) '
         +'              AND SUBSTR(A.ASODSTLABID,1,4) = F.CIUDID(+) AND A.ASODSTLABID = G.ZIPID(+)'
         +' ORDER BY DESURBVIV, NOMDIRVIV, NUMDIRVIV ) ORDER BY NUMERO)';
    *)
  { //Comentado por que no se usa
  xSql := 'SELECT NUMERO, ASOID, ZIPID, ASODNI, ASOAPENOMDNI, ASOFRESNOM, ASOFRESCESE, ASORESCESE, ASODIR, ASOTELF1,'
  +' ASOCODMOD, ASODESLAB, ASODIRLAB, USEID, UPAGOID, UPROID, ASODSTLABID, ASORESNOM, DESURBVIV, DESETAVIV,'
  +' NOMDIRVIV,NUMDIRVIV, AUTORIZACION FROM (SELECT ROWNUM NUMERO, ASOID, ZIPID, ASODNI, ASOAPENOMDNI, ASOFRESNOM, ASOFRESCESE,'
  +' ASORESCESE, ASODIR, ASOTELF1, ASOCODMOD, ASODESLAB, ASODIRLAB, USEID, UPAGOID, UPROID, ASODSTLABID, ASORESNOM,'
  +' DESURBVIV, DESETAVIV, NOMDIRVIV,NUMDIRVIV, AUTORIZACION FROM (SELECT ASOID, ZIPID, ASODNI, ASOAPENOMDNI, ASOFRESNOM, ASOFRESCESE,'
  +' ASORESCESE, ASODIR, ASOTELF1, ASOCODMOD, ASODESLAB, ASODIRLAB, USEID, UPAGOID, UPROID, ASODSTLABID, ASORESNOM,'
  +' DESURBVIV, DESETAVIV, NOMDIRVIV, NUMDIRVIV, '
  +' CASE WHEN nvl(AUTDESAPO,''N'')=''S'' THEN ''SI'' ELSE ''NO'' END AUTORIZACION'
  +' FROM APO201 A '
  +' WHERE '+sTipo+' = '+QuotedStr(dblcdcoddis.Text)
  +' AND ASOTIPID = ''DO'''
  +' AND ASOFRESNOM IS NOT NULL ORDER BY DESURBVIV, NOMDIRVIV, NUMDIRVIV ) ORDER BY NUMERO)';
  }

   DM1.cdsReporte.Close;
   DM1.cdsReporte.IndexFieldNames := '';
   DM1.cdsReporte.DataRequest(xSql);
   DM1.cdsReporte.Open;
   DM1.cdsReporte.IndexFieldNames := 'NUMERO';
   DM1.cdsReporte.First;

  {
  SELECT
   ASOTELF1, ASOCODMOD,
  ASODESLAB, DPTO_LAB, PROV_LAB, DIST_LAB, ASODIRLAB, USEID, UPAGOID, UPROID, ASODSTLABID, ASORESNOM,
  DESURBVIV, DESETAVIV, NOMDIRVIV, NUMDIRVIV, AUTORIZACION
  }

   dbgprevio.Selected.Clear;
   dbgprevio.Selected.Add('NUMERO'#9'4'#9'Número'#9#9);
   dbgprevio.Selected.Add('ASOCODMOD'#9'10'#9'Código~Modular'#9#9);
   dbgprevio.Selected.Add('ASODNI'#9'8'#9'DNI del~asociado'#9#9);
   dbgprevio.Selected.Add('ASOAPENOMDNI'#9'42'#9'Apellidos y Nombre(s)~del asociado'#9#9);
   dbgprevio.Selected.Add('ASOFRESNOM'#9'10'#9'Fecha de~nombramiento'#9#9);
   dbgprevio.Selected.Add('ASOFRESCESE'#9'10'#9'Fecha de~cese'#9#9);
   dbgprevio.Selected.Add('DPTO_DIR'#9'15'#9'Departamento~dirección'#9#9);
   dbgprevio.Selected.Add('PROV_DIR'#9'15'#9'Provincia~dirección'#9#9);
   dbgprevio.Selected.Add('DIST_DIR'#9'15'#9'Distrito~dirección'#9#9);
   dbgprevio.Selected.Add('ASODIR'#9'65'#9'Dirección del asociado'#9#9);
   dbgprevio.Selected.Add('DESURBVIV'#9'42'#9'Descripción~de la Urbanización'#9#9);
   dbgprevio.Selected.Add('NOMDIRVIV'#9'42'#9'Descripción de la~Calle'#9#9);
   dbgprevio.Selected.Add('NUMDIRVIV'#9'10'#9'Número~vivienda'#9#9);
   dbgprevio.Selected.Add('ASODESLAB'#9'50'#9'Nombre de~colegio'#9#9);
   dbgprevio.Selected.Add('DPTO_LAB'#9'15'#9'Departamento~colegio'#9#9);
   dbgprevio.Selected.Add('PROV_LAB'#9'15'#9'Provincia~colegio'#9#9);
   dbgprevio.Selected.Add('DIST_LAB'#9'15'#9'Distrito~colegio'#9#9);
   dbgprevio.Selected.Add('ASODIRLAB'#9'50'#9'Dirección~colegio'#9#9);
   dbgprevio.Selected.Add('AUTORIZACION'#9'15'#9'Autorización~descuento'#9#9);
   dbgprevio.ApplySelected;

 {
  dbgprevio.Selected.Clear;
  if rgTipo.ItemIndex=0 then
  begin
    dbgprevio.Selected.Add('NUMERO'#9'4'#9'Número'#9#9);
    dbgprevio.Selected.Add('ASOCODMOD'#9'10'#9'Código~Modular'#9#9);
    dbgprevio.Selected.Add('ASODNI'#9'8'#9'DNI del~asociado'#9#9);
    dbgprevio.Selected.Add('ASOAPENOMDNI'#9'42'#9'Apellidos y Nombre(s)~del asociado'#9#9);
    dbgprevio.Selected.Add('ASOFRESNOM'#9'10'#9'Fecha de~nombramiento'#9#9);
    dbgprevio.Selected.Add('ASODIR'#9'65'#9'Dirección del asociado'#9#9);
    dbgprevio.Selected.Add('DESURBVIV'#9'42'#9'Descripción~de la Urbanización'#9#9);
    dbgprevio.Selected.Add('NOMDIRVIV'#9'42'#9'Descripción de la~Calle'#9#9);
    dbgprevio.Selected.Add('NUMDIRVIV'#9'10'#9'Número~vivienda'#9#9);
    dbgprevio.Selected.Add('AUTORIZACION'#9'15'#9'Autorización~descuento'#9#9);
  end
  else
  begin
    dbgprevio.Selected.Add('NUMERO'#9'4'#9'Número'#9#9);
    dbgprevio.Selected.Add('ASOCODMOD'#9'10'#9'Código~Modular'#9#9);
    dbgprevio.Selected.Add('ASODNI'#9'8'#9'DNI del~asociado'#9#9);
    dbgprevio.Selected.Add('ASOAPENOMDNI'#9'42'#9'Apellidos y Nombre(s)~del asociado'#9#9);
    dbgprevio.Selected.Add('ASOFRESNOM'#9'10'#9'Fecha de~nombramiento'#9#9);
    dbgprevio.Selected.Add('ASODESLAB'#9'50'#9'Nombre de colegio'#9#9);
    dbgprevio.Selected.Add('DESURBVIV'#9'50'#9'Dirección de colegio'#9#9);
    dbgprevio.Selected.Add('AUTORIZACION'#9'15'#9'Autorización~descuento'#9#9);
  end;
  dbgprevio.ApplySelected;

  }


   xSql := 'SELECT TO_CHAR(SYSDATE, ''YYYYMM'') ANOMESACT FROM DUAL';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   DM1.xanomesact := DM1.cdsQry.FieldByName('ANOMESACT').AsString;
   screen.Cursor := crDefault;
End;

Procedure Tfcueinddis.btnimprimirClick(Sender: TObject);
Var
   xSql, xAnoMesIni, xfecini: String;
   xano, xMes: Integer;
   xinicio, xfinal: Integer;
   i, xMesIni, xAnoIni: Integer;
   xtotal_pie: Double;
   Chart: TDBChart;
   Series: TPieSeries;
   Image: TImage;
   Jpeg: TJpegImage;
// Inicio: HPP_201004_PRE POR IREVILLA
// SAR-2009-0984
   xReq:String;
// Fin: HPP_201004_PRE
Begin
   If trim(ceinicio.Text) = '' Then
   Begin
      MessageDlg('Ingrese la pagina inicial', mtCustom, [mbOk], 0);
      ceinicio.SetFocus;
      Exit;
   End;
   If trim(cefinal.Text) = '' Then
   Begin
      MessageDlg('Ingrese la pagina final', mtCustom, [mbOk], 0);
      cefinal.SetFocus;
      Exit;
   End;
   xinicio := StrToInt(ceinicio.Text);
   xfinal := StrToInt(cefinal.Text);

   DM1.cdsReporte.First;
   While Not DM1.cdsReporte.Eof Do
   Begin
      If (DM1.cdsReporte.FieldByName('NUMERO').AsInteger >= xinicio) And (DM1.cdsReporte.FieldByName('NUMERO').AsInteger <= xfinal) Then
      Begin
         xSql := 'SELECT TO_CHAR(SYSDATE, ''YYYYMM'') ANOMESACT FROM DUAL';
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         DM1.xanomesact := DM1.cdsQry.FieldByName('ANOMESACT').AsString;
         DM1.asoresnom := DM1.cdsReporte.FieldByName('ASORESNOM').AsString;
         DM1.asorescese := DM1.cdsReporte.FieldByName('ASORESCESE').AsString;
         DM1.asofresnom := DM1.cdsReporte.FieldByName('ASOFRESNOM').AsString;
         xSql := 'SELECT MAX(APOSEC) APOSEC FROM APO301 WHERE ASOID = ' + QuotedStr(DM1.cdsReporte.FieldByName('ASOID').AsString);
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         DM1.anoultapo := Copy(DM1.cdsQry.FieldByName('APOSEC').AsString, 1, 4);
         DM1.mesultapo := Copy(DM1.cdsQry.FieldByName('APOSEC').AsString, 5, 2);
         DM1.xanomesultapo := DM1.cdsQry.FieldByName('APOSEC').AsString;

// Inicio: HPP_201004_PRE POR IREVILLA
         // INICIO: SAR-2009-0984
         {
         DM1.xanomestop := inttostr(StrToInt(DM1.anoultapo) + 2) + DM1.mesultapo;
         If DM1.xanomestop > DM1.xanomesact Then
            DM1.asofrescese := '28/' + Copy(DM1.xanomesact, 5, 2) + '/' + Copy(DM1.xanomesact, 1, 4)
         Else
            DM1.asofrescese := '28/' + Copy(DM1.xanomestop, 5, 2) + '/' + Copy(DM1.xanomestop, 1, 4);
         }   

         DM1.xpvslbennr := '';
         DM1.asofrescese := DateToStr(DM1.FechaSys);

         // Se añade el parametro de reliquidación
         xReq := 'N';
         xSql := 'DELETE T_CTAIND1';
         DM1.DCOM1.AppServer.EjecutaSQL(xSql);
// Se añade el parámetro de reliquidación
         xSql := 'BEGIN P_CUENTA_INDIVIDUAL(' + QuotedStr(DM1.cdsReporte.FieldByName('ASOID').AsString)
{
            + ',' + QuotedStr(DM1.asofresnom) + ',' + QuotedStr(DM1.asofrescese) + ',' + QuotedStr(DM1.xpvslbennr) + '); END;';
}
         + ',' + QuotedStr(DM1.asofresnom) + ',' + QuotedStr(DM1.asofrescese) + ',' + QuotedStr(DM1.xpvslbennr)+','+QuotedStr(xReq)+'); END;';
         // FIN: SAR-2009-0984
// Fin: HPP_201004_PRE 
         DM1.DCOM1.AppServer.EjecutaSQL(xSql);

         xSql := 'SELECT * FROM T_CTAIND1 WHERE ASOID = ' + QuotedStr(DM1.cdsReporte.FieldByName('ASOID').AsString)
            + '   AND ANO||MES < to_char(sysdate,''YYYYMM'') '
            + ' ORDER BY ANO,MES';
         DM1.DCOM1.AppServer.EjecutaSQL(xSql);
         DM1.cdsCuentas.Close;
         DM1.cdsCuentas.DataRequest(xSql);
         DM1.cdsCuentas.Open;
         If DM1.cdsCuentas.RecordCount > 0 Then
         Begin

        (*************************)
            xSql := 'SELECT MAX(ANO||MES) vFechaFinal,MAX(ANOSERF) vANOSERF FROM T_CTAIND1'
               + ' WHERE ANO||MES < to_char(sysdate,''YYYYMM'') ';
            DM1.cdsQry.Close;
            DM1.cdsQry.DataRequest(xSql);
            DM1.cdsQry.Open;
            xAno := StrToInt(Copy(DM1.cdsQry.FieldByName('vFechaFinal').AsString, 1, 4));
            xMes := StrToInt(Copy(DM1.cdsQry.FieldByName('vFechaFinal').AsString, 5, 2));

        //xAno := StrToInt(Copy(DM1.asofrescese,7,4));
        //xMes := StrToInt(Copy(DM1.asofrescese,4,2));
        (**************************)
            xMesIni := xMes - 6;
            xAnoIni := xAno;
            If xMesIni < 1 Then
            Begin
               xMesIni := xMesIni + 12;
               xAnoIni := xAno - 1;
            End;
            xAnoMesIni := DM1.StrZero(IntToStr(xAnoIni), 4) + DM1.StrZero(IntToStr(xMesIni), 2);
            xSql := 'SELECT MIN(NVL(ACUMESANT,0)) INICIAL, SUM(NVL(CAPITAL,0)) APORTE, SUM(NVL(INTCAPACU,0)) INTERES, SUM(NVL(BONOS,0)) BONUS, MAX(NVL(ACUMULADO,0)) SALDO, max(anoserf) anoserf  FROM T_CTAIND1'
               + ' WHERE ANO||MES <= ' + QuotedStr(xAnoMesIni)
               + ' AND ANO||MES < to_char(sysdate,''YYYYMM'') '
               + ' ORDER BY ANO, MES';
            DM1.cdsQry20.Close;
            DM1.cdsQry20.DataRequest(xSql);
            DM1.cdsQry20.Open;
            pplapoini.Caption := FloatToStrF(DM1.cdsQry20.FieldByName('INICIAL').AsFloat + DM1.cdsQry20.FieldByName('APORTE').AsFloat, ffNumber, 10, 2);
            pplintini.Caption := FloatToStrF(DM1.cdsQry20.FieldByName('INTERES').AsFloat, ffNumber, 10, 2);
            pplbonini.Caption := FloatToStrF(DM1.cdsQry20.FieldByName('BONUS').AsFloat, ffNumber, 10, 2);
            pplsalini.Caption := FloatToStrF(DM1.cdsQry20.FieldByName('SALDO').AsFloat, ffNumber, 10, 2);
            xSql := 'SELECT ANO, MES, NVL(CAPITAL,0) APORTE, NVL(INTCAPACU,0) INTERES, NVL(BONOS,0) BONUS, NVL(ACUMULADO,0) SALDO FROM T_CTAIND1'
               + ' WHERE ANO||MES > ' + QuotedStr(xAnoMesIni)
               + ' AND ANO||MES < to_char(sysdate,''YYYYMM'') '
               + ' ORDER BY ANO, MES';
            DM1.cdsQry.Close;
            DM1.cdsQry.DataRequest(xSql);
            DM1.cdsQry.Open;
            DM1.cdsCueInd.EmptyDataSet;
            DM1.cdsQry.First;
            While Not DM1.cdsQry.Eof Do
            Begin
               DM1.cdsCueInd.Append;
               DM1.cdsCueInd.FieldByName('ANO').AsString := DM1.cdsQry.FieldByName('ANO').AsString;
               DM1.cdsCueInd.FieldByName('MES').AsString := DM1.cdsQry.FieldByName('MES').AsString;
               DM1.cdsCueInd.FieldByName('APORTE').AsString := DM1.cdsQry.FieldByName('APORTE').AsString;
               DM1.cdsCueInd.FieldByName('INTERES').AsString := DM1.cdsQry.FieldByName('INTERES').AsString;
               DM1.cdsCueInd.FieldByName('BONUS').AsString := DM1.cdsQry.FieldByName('BONUS').AsString;
               DM1.cdsCueInd.FieldByName('TOTACU').AsString := DM1.cdsQry.FieldByName('SALDO').AsString;
               DM1.cdsCueInd.Post;
               DM1.cdsQry.Next;
            End;
            pplasoapenomdni_nc.Caption := DM1.cdsReporte.FieldByName('ASOAPENOMDNI').AsString;
            pplasodni_nc.Caption := DM1.cdsReporte.FieldByName('ASODIR').AsString;
            pplasodir_nc.Caption := DM1.cdsReporte.FieldByName('ASODNI').AsString;
            ppldep_nc.Caption := DM1.DevuelveValor('APO158', 'DPTODES', 'DPTOID', Copy(DM1.cdsReporte.FieldByName('ZIPID').AsString, 1, 2));
            pplprv_nc.Caption := DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', Copy(DM1.cdsReporte.FieldByName('ZIPID').AsString, 1, 4));
            ppldst_nc.Caption := DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', DM1.cdsReporte.FieldByName('ZIPID').AsString);
            pplasotelf1_nc.Caption := DM1.cdsReporte.FieldByName('ASOTELF1').AsString;
            pplasocodmod_nc.Caption := DM1.cdsReporte.FieldByName('ASOCODMOD').AsString;

        // HPP_200901_PRE
        (*
        xSql := 'SELECT CENPO '
               +'  FROM ASO_CEN_EDU '
               +' WHERE CENEDUID = '+QuotedStr(DM1.cdsAsociado.FieldByName('CENEDUID').AsString);
         *)

   // HPP_200903_PRE, cambio considerando la nueva tabla de Centros Educativos
   // 20090326 - MOSTRAR CENEDU EN CTA IND
            xSQL := 'SELECT NOMCENEDU, DIREC, CENPO, DPTO.DPTODES DPTO, PROV.CIUDDES PROV, DIST.ZIPDES DIST '
               + '  FROM ASO_CEN_EDU CE, APO158 DPTO, APO123 PROV, APO122 DIST '
// Inicio: HPP_201004_PRE POR IREVILLA
{
               + ' WHERE CENEDUID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('CENEDUID').AsString)
}
               + ' WHERE CENEDUID = ' + QuotedStr(DM1.cdsReporte.FieldByName('CENEDUID').AsString)
// Fin: HPP_201004_PRE
               + '   AND SUBSTR(CE.UBIGEO_DIR, 1, 2) = DPTO.DPTOID(+) '
               + '   AND SUBSTR(CE.UBIGEO_DIR, 1, 2) = PROV.DPTOID(+) '
               + '   AND SUBSTR(CE.UBIGEO_DIR, 1, 4) = PROV.CIUDID(+) '
               + '   AND SUBSTR(CE.UBIGEO_DIR, 1, 2) = DIST.DPTOID(+) '
               + '   AND SUBSTR(CE.UBIGEO_DIR, 1, 4) = DIST.CIUDID(+) '
               + '   AND CE.UBIGEO_DIR = DIST.ZIPID(+) ';

            DM1.cdsQry.Close;
            DM1.cdsQry.DataRequest(xSql);
            DM1.cdsQry.Open;
            pplcpocenedu.Caption := DM1.cdsQry.FieldByName('CENPO').AsString;
            If trim(DM1.cdsQry.FieldByName('NOMCENEDU').AsString) <> '' Then
               pplasodeslab_nc.Caption := DM1.cdsQry.FieldByName('NOMCENEDU').AsString
            Else
               pplasodeslab_nc.Caption := DM1.cdsAsociado.FieldByName('ASODESLAB').AsString;

            If trim(DM1.cdsQry.FieldByName('DIREC').AsString) <> '' Then
               pplasodirleb_nc.Caption := DM1.cdsQry.FieldByName('DIREC').AsString
            Else
               pplasodirleb_nc.Caption := DM1.cdsAsociado.FieldByName('ASODIRLAB').AsString;

            If trim(DM1.cdsQry.FieldByName('DIST').AsString) <> '' Then
               ppldstdeslab_nc.Caption := DM1.cdsQry.FieldByName('DIST').AsString
            Else
               ppldstdeslab_nc.Caption := DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', DM1.cdsAsociado.FieldByName('ASODSTLABID').AsString);

            If trim(DM1.cdsQry.FieldByName('PROV').AsString) <> '' Then
               pplprvdeslab_nc.Caption := DM1.cdsQry.FieldByName('PROV').AsString
            Else
               pplprvdeslab_nc.Caption := DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', Copy(DM1.cdsAsociado.FieldByName('ASODSTLABID').AsString, 1, 4));

            If trim(DM1.cdsQry.FieldByName('DPTO').AsString) <> '' Then
               ppldepdeslab_nc.Caption := DM1.cdsQry.FieldByName('DPTO').AsString
            Else
               ppldepdeslab_nc.Caption := DM1.DevuelveValor('APO158', 'DPTODES', 'DPTOID', Copy(DM1.cdsAsociado.FieldByName('ASODSTLABID').AsString, 1, 2));
            (*
            pplcpocenedu.Caption := DM1.cdsQry.FieldByName('CENPO').AsString;
            pplasodeslab_nc.Caption := DM1.cdsReporte.FieldByName('ASODESLAB').AsString;
            pplasodirleb_nc.Caption := DM1.cdsReporte.FieldByName('ASODIRLAB').AsString;
            ppldstdeslab_nc.Caption := DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', DM1.cdsReporte.FieldByName('ASODSTLABID').AsString);
            pplprvdeslab_nc.Caption := DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', Copy(DM1.cdsReporte.FieldByName('ASODSTLABID').AsString, 1, 4));
            ppldepdeslab_nc.Caption := DM1.DevuelveValor('APO158', 'DPTODES', 'DPTOID', Copy(DM1.cdsReporte.FieldByName('ASODSTLABID').AsString, 1, 2));
            *)

            xSql := 'SELECT UPRONOM FROM APO102 WHERE UPROID = ' + QuotedStr(DM1.cdsReporte.FieldByName('UPROID').AsString);
            DM1.cdsQry.Close;
            DM1.cdsQry.DataRequest(xSql);
            DM1.cdsQry.Open;
            pplunipro_nc.Caption := DM1.cdsQry.FieldByName('UPRONOM').AsString;
            xSql := 'SELECT UPAGONOM FROM APO103 WHERE UPROID = ' + QuotedStr(DM1.cdsReporte.FieldByName('UPROID').AsString) + ' AND UPAGOID = ' + QuotedStr(DM1.cdsReporte.FieldByName('UPAGOID').AsString);
            DM1.cdsQry.Close;
            DM1.cdsQry.DataRequest(xSql);
            DM1.cdsQry.Open;
            pplunipag_nc.Caption := DM1.cdsQry.FieldByName('UPAGONOM').AsString;
            xSql := 'SELECT USENOM FROM APO101 WHERE UPROID = ' + QuotedStr(DM1.cdsReporte.FieldByName('UPROID').AsString) + ' AND UPAGOID = ' + QuotedStr(DM1.cdsReporte.FieldByName('UPAGOID').AsString) + ' AND USEID = ' + QuotedStr(DM1.cdsReporte.FieldByName('USEID').AsString);
            DM1.cdsQry.Close;
            DM1.cdsQry.DataRequest(xSql);
            DM1.cdsQry.Open;

            ppluniges_nc.Caption := DM1.cdsQry.FieldByName('USENOM').AsString;
         // HPP_200903_PRE, cambio considerando la nueva tabla de Centros Educativos
            pplasofresnom_nc.Caption := DM1.cdsReporte.FieldByName('ASOFRESNOM').AsString;
            pplasoresnom_nc.Caption := DM1.cdsReporte.FieldByName('ASORESNOM').AsString;
        (*************************)
            pplanoapo_nc.Caption := DM1.cdsQry20.fieldbyname('anoserf').AsString;
        //pplanoapo_nc.Caption     :=  DM1.TiempoTranscurrido(Date, DM1.cdsReporte.FieldByName('ASOFRESNOM').AsDateTime, '1');
        (*************************)
        //ppldesini.Caption := 'SALDO AL : '+DateToStr(Date);
            xfecini := '01/' + IntToStr(xMesIni) + '/' + IntToStr(xAnoIni);
            xSql := 'SELECT LAST_DAY(' + QuotedStr(xfecini) + ') FEC_INI FROM DUAL';
            DM1.cdsQry.Close;
            DM1.cdsQry.DataRequest(xSql);
            DM1.cdsQry.Open;
            ppldesini.Caption := 'SALDO AL : ' + DM1.cdsQry.FieldByName('FEC_INI').AsString;
            xSql := 'SELECT MIN(NVL(ACUMESANT,0)) ACUMESANT,  SUM(NVL(CAPITAL,0)) CAPITAL,  SUM(NVL(INTCAPACU,0)) INTCAPACU, SUM(NVL(BONOS,0)) BONOS, MAX(NVL(ACUMULADO,0)) ACUMULADO  FROM T_CTAIND1'
               + ' where ANO||MES < to_char(sysdate,''YYYYMM'') ';
            DM1.cdsQry22.Close;
            DM1.cdsQry22.DataRequest(xSql);
            DM1.cdsQry22.Open;
            pplapofin.Caption := FloatToStrF(DM1.cdsQry22.FieldByName('ACUMESANT').AsFloat + DM1.cdsQry22.FieldByName('CAPITAL').AsFloat, ffNumber, 10, 2);
            pplintfin.Caption := FloatToStrF(DM1.cdsQry22.FieldByName('INTCAPACU').AsFloat, ffNumber, 10, 2);
            pplbonfin.Caption := FloatToStrF(DM1.cdsQry22.FieldByName('BONOS').AsFloat, ffNumber, 10, 2);
            pplsalfin.Caption := FloatToStrF(DM1.cdsQry22.FieldByName('ACUMULADO').AsFloat, ffNumber, 10, 2);
            xtotal_pie :=
               DM1.cdsQry22.FieldByName('ACUMESANT').AsFloat + DM1.cdsQry22.FieldByName('CAPITAL').AsFloat
               + DM1.cdsQry22.FieldByName('INTCAPACU').AsFloat + DM1.cdsQry22.FieldByName('BONOS').AsFloat;
            pplsaldoal.Caption := DateToStr(Date) + ' : S/. ' + FloatToStrF(xtotal_pie, ffNumber, 10, 2);
            Chart1.Series[0].Clear;
            Chart1.Series[0].Add(((DM1.cdsQry22.FieldByName('ACUMESANT').AsFloat + DM1.cdsQry22.FieldByName('CAPITAL').AsFloat) / xtotal_pie) * 100, 'Aportes');
            Chart1.Series[0].Add((DM1.cdsQry22.FieldByName('INTCAPACU').AsFloat / xtotal_pie) * 100, 'Intereses');
            Chart1.Series[0].Add((DM1.cdsQry22.FieldByName('BONOS').AsFloat / xtotal_pie) * 100, 'Bonus');
        // crea o bitmap de memória
            Image := TImage.Create(Nil);
            Image.Width := Chart1.Width;
            Image.Height := Chart1.Height;
            Chart1.Draw(Image1.Canvas, Image.BoundsRect);
            Jpeg := TJpegImage.Create;
            Jpeg.Assign(Image1.Picture.Bitmap);
            ppImage3.Picture.Bitmap := image1.Picture.Bitmap;
            pprepcueind.Print;
         End;
      End;
      DM1.cdsReporte.Next;
   End;
End;

Procedure Tfcueinddis.btncerrarClick(Sender: TObject);
Begin
   fcueinddis.Close;
End;

Procedure Tfcueinddis.pplanomesPrint(Sender: TObject);
Var
   xMes: String;
Begin
   If DM1.cdsCueInd.FieldByName('MES').AsString = '01' Then xMes := 'ENE - ';
   If DM1.cdsCueInd.FieldByName('MES').AsString = '02' Then xMes := 'FEB - ';
   If DM1.cdsCueInd.FieldByName('MES').AsString = '03' Then xMes := 'MAR - ';
   If DM1.cdsCueInd.FieldByName('MES').AsString = '04' Then xMes := 'ABR - ';
   If DM1.cdsCueInd.FieldByName('MES').AsString = '05' Then xMes := 'MAY - ';
   If DM1.cdsCueInd.FieldByName('MES').AsString = '06' Then xMes := 'JUN - ';
   If DM1.cdsCueInd.FieldByName('MES').AsString = '07' Then xMes := 'JUL - ';
   If DM1.cdsCueInd.FieldByName('MES').AsString = '08' Then xMes := 'AGO - ';
   If DM1.cdsCueInd.FieldByName('MES').AsString = '09' Then xMes := 'SET - ';
   If DM1.cdsCueInd.FieldByName('MES').AsString = '10' Then xMes := 'OCT - ';
   If DM1.cdsCueInd.FieldByName('MES').AsString = '11' Then xMes := 'NOV - ';
   If DM1.cdsCueInd.FieldByName('MES').AsString = '12' Then xMes := 'DIC - ';
   pplanomes.Caption := xMes + DM1.cdsCueInd.FieldByName('ANO').AsString;
End;

Procedure Tfcueinddis.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If Key = #13 Then
   Begin
      Key := #0;
      Perform(CM_DIALOGKEY, VK_TAB, 0);
   End;
End;

Procedure Tfcueinddis.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   DM1.cdsReporte.IndexFieldNames := '';
   Action := caFree;
End;

Procedure Tfcueinddis.btnaexcelClick(Sender: TObject);
Begin
   DM1.HojaExcel('REPORTE', DM1.dsReporte, DBGrid);
End;

Procedure Tfcueinddis.bbtnFilDisClick(Sender: TObject);
Begin
   If rgTipo.ItemIndex = 0 Then
      sTipo := 'ZIPID'
   Else
      sTipo := 'ASODSTLABID';

End;

Procedure Tfcueinddis.dbgprevioTitleButtonClick(Sender: TObject;
   AFieldName: String);
Var
   nReg: Integer;
Begin
   dbgprevio.SetActiveField(AFieldName);
   DM1.cdsReporte.IndexFieldNames := AFieldName;

   nReg := 0;
   DM1.cdsReporte.First;
   While Not DM1.cdsReporte.Eof Do
   Begin
      nReg := nReg + 1;
      DM1.cdsReporte.Edit;
      DM1.cdsReporte.FieldByName('NUMERO').AsInteger := nReg;
      DM1.cdsReporte.Next;
   End;
   DM1.cdsReporte.First;
//   xTitLabel := dbgFiltro.SelectedField.DisplayLabel;
End;

End.

