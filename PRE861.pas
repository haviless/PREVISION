// Inicio Uso Estándares   :  01/08/2011
// Unidad		          :  PRE861.pas
// Formulario		      :  FrepXTipPag
// Fecha de Creación	   :  15/12/1993
// Autor			       :  Área de Desarrollo de Sistemas
// Objetivo		        :  Beneficios atendidos por forma de pago
// HPC_201306_PRE          :  Se añade reporte "19" Banco de la nación (Deposito en cuenta)
//                            El reporte es igual al "16" Cheque de Gerencia
// SPP_201307_PRE          :  Se realiza el pase a producción a partir del HPC_201306_PRE.
// HPC_201307_PRE          :  Se añade imagen del nuevo logo institucional
// SPP_201401_PRE          :  Se realiza el pase a producción a partir del pase HPC_201307_PRE
// HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
// HPC_201705_PRE : Se incluye en las condiciones para seleccionar las formas de pago, que estas no
//                  sean extornadas. Se modifican los Qrys para buscar por fecha de liquidación y fecha de liquidacions diferidas.
// HPC_201807_PRE : Mostrar los cheques no pagados por fecha de reprogramación

Unit PRE861;

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Grids, Wwdbigrd, Wwdbgrid, wwdbdatetimepicker,
   wwdblook, Wwdbdlg, fcButton, fcImgBtn, fcShapeBtn, ppPrnabl, ppClass,
   ppCtrls, ppBands, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE, ppVar, Buttons, DBGrids, db, jpeg; // SPP_201401_PRE

Type
   TFrepXTipPag = Class(TForm)
      GroupBox1: TGroupBox;
      Label1: TLabel;
      Label2: TLabel;
      dbdtpInicial: TwwDBDateTimePicker;
      dbdtpFinal: TwwDBDateTimePicker;
      Label3: TLabel;
      edtTipDes: TEdit;
      ppbdepForPag: TppBDEPipeline;
      pprCheque: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppDetailBand1: TppDetailBand;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppLabel1: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppSystemVariable3: TppSystemVariable;
      pplTitulo: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppLabel13: TppLabel;
      ppSummaryBand1: TppSummaryBand;
      ppLine1: TppLine;
      ppLine2: TppLine;
      ppLine3: TppLine;
      ppLabel14: TppLabel;
      ppLabel15: TppLabel;
      ppLine4: TppLine;
      ppDBCalc1: TppDBCalc;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
      ppLabel18: TppLabel;
      ppLabel19: TppLabel;
      ppLabel20: TppLabel;
      pplcanmonpagche: TppLabel;
      pprGiros: TppReport;
      ppHeaderBand2: TppHeaderBand;
      ppDetailBand2: TppDetailBand;
      ppLabel21: TppLabel;
      ppLabel24: TppLabel;
      ppLabel25: TppLabel;
      ppLabel26: TppLabel;
      ppSystemVariable4: TppSystemVariable;
      ppSystemVariable5: TppSystemVariable;
      ppSystemVariable6: TppSystemVariable;
      ppLabel27: TppLabel;
      ppLabel28: TppLabel;
      ppLabel29: TppLabel;
      ppLabel30: TppLabel;
      ppLabel31: TppLabel;
      ppLabel32: TppLabel;
      ppLabel33: TppLabel;
      ppLabel34: TppLabel;
      ppLine5: TppLine;
      ppLine6: TppLine;
      ppLabel35: TppLabel;
      ppLabel36: TppLabel;
      ppLabel37: TppLabel;
      ppLabel38: TppLabel;
      ppSummaryBand2: TppSummaryBand;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppDBText13: TppDBText;
      ppDBText14: TppDBText;
      ppDBText15: TppDBText;
      ppDBText16: TppDBText;
      ppLine7: TppLine;
      ppLabel39: TppLabel;
      ppLabel40: TppLabel;
      ppLine9: TppLine;
      ppDBCalc3: TppDBCalc;
      ppLabel41: TppLabel;
      pplcanexppaggir: TppLabel;
      pprLibretas: TppReport;
      ppHeaderBand3: TppHeaderBand;
      ppDetailBand3: TppDetailBand;
      ppSummaryBand3: TppSummaryBand;
      ppLine8: TppLine;
      ppLabel43: TppLabel;
      ppLabel44: TppLabel;
      ppLine10: TppLine;
      ppDBCalc5: TppDBCalc;
      ppLabel45: TppLabel;
      pplcanexppaglib: TppLabel;
      ppDBText17: TppDBText;
      ppLabel47: TppLabel;
      ppLabel50: TppLabel;
      ppLabel51: TppLabel;
      ppLabel52: TppLabel;
      ppSystemVariable7: TppSystemVariable;
      ppSystemVariable8: TppSystemVariable;
      ppSystemVariable9: TppSystemVariable;
      ppLabel53: TppLabel;
      ppLabel54: TppLabel;
      ppLabel55: TppLabel;
      ppLabel56: TppLabel;
      ppLabel57: TppLabel;
      ppLabel59: TppLabel;
      ppLabel60: TppLabel;
      ppLine11: TppLine;
      ppLine12: TppLine;
      ppLabel61: TppLabel;
      ppLabel62: TppLabel;
      ppLabel63: TppLabel;
      ppLabel64: TppLabel;
      ppDBText18: TppDBText;
      ppDBText19: TppDBText;
      ppDBText20: TppDBText;
      ppDBText21: TppDBText;
      ppDBText22: TppDBText;
      ppDBText23: TppDBText;
      dtgData: TDBGrid;
      btnimprimir: TBitBtn;
      btnaexcel: TBitBtn;
      BitBtn3: TBitBtn;
      btnImprimePrevio: TBitBtn;
      dbgtippag: TwwDBGrid;
      dblcdTipId: TwwDBLookupCombo;
      pplcanexpateche: TppLabel;
      pplcanexpategir: TppLabel;
      pplcanexpatelib: TppLabel;
      pprabocta: TppReport;
      ppHeaderBand4: TppHeaderBand;
      ppLabel42: TppLabel;
      ppLabel65: TppLabel;
      ppLabel66: TppLabel;
      ppLabel67: TppLabel;
      ppSystemVariable10: TppSystemVariable;
      ppSystemVariable11: TppSystemVariable;
      ppSystemVariable12: TppSystemVariable;
      ppltitulo03: TppLabel;
      ppLabel69: TppLabel;
      ppLabel70: TppLabel;
      ppLabel71: TppLabel;
      ppLabel72: TppLabel;
      ppLabel73: TppLabel;
      ppLabel74: TppLabel;
      ppLine13: TppLine;
      ppLine14: TppLine;
      ppLabel75: TppLabel;
      ppLabel76: TppLabel;
      ppLabel77: TppLabel;
      ppLabel78: TppLabel;
      ppDetailBand4: TppDetailBand;
      ppDBText24: TppDBText;
      ppDBText25: TppDBText;
      ppDBText26: TppDBText;
      ppDBText27: TppDBText;
      ppDBText28: TppDBText;
      ppDBText29: TppDBText;
      ppDBText30: TppDBText;
      ppSummaryBand4: TppSummaryBand;
      ppLine15: TppLine;
      ppLabel79: TppLabel;
      ppLabel80: TppLabel;
      ppLine16: TppLine;
      ppDBCalc2: TppDBCalc;
      ppLabel81: TppLabel;
      pplcanbenpagcta: TppLabel;
      pplcanexpatecta: TppLabel;
      ppLabel84: TppLabel;
      ppLabel85: TppLabel;
      ppDBText31: TppDBText;
//Inicio: SPP_201401_PRE
      // ppImage4: TppImage; 
      // ppLabel2: TppLabel; 
      // ppLabel3: TppLabel; 
      // ppLabel114: TppLabel; 
      // ppImage1: TppImage; 
      // ppLabel22: TppLabel; 
      // ppLabel23: TppLabel; 
      // ppLabel68: TppLabel; 
      // ppImage2: TppImage; 
      // ppLabel48: TppLabel; 
      // ppLabel49: TppLabel; 
      // ppLabel82: TppLabel; 
      // ppImage3: TppImage; 
      // ppLabel46: TppLabel; 
      // ppLabel58: TppLabel; 
      // ppLabel83: TppLabel; 
//Fin: SPP_201401_PRE
      pprcheger: TppReport;
      ppHeaderBand5: TppHeaderBand;
      ppLabel86: TppLabel;
      ppLabel87: TppLabel;
      ppLabel88: TppLabel;
      ppLabel89: TppLabel;
      ppSystemVariable13: TppSystemVariable;
      ppSystemVariable14: TppSystemVariable;
      ppSystemVariable15: TppSystemVariable;
      ppLabel90: TppLabel;
      ppLabel91: TppLabel;
      ppLabel92: TppLabel;
      ppLabel93: TppLabel;
      ppLabel94: TppLabel;
      ppLabel95: TppLabel;
      ppLabel96: TppLabel;
      ppLine17: TppLine;
      ppLine18: TppLine;
      ppLabel97: TppLabel;
      ppLabel98: TppLabel;
      ppLabel99: TppLabel;
      ppLabel100: TppLabel;
//Inicio: SPP_201401_PRE
      // ppImage5: TppImage;  
      // ppLabel103: TppLabel;  
      // ppLabel104: TppLabel;  
      // ppLabel105: TppLabel;  
//Fin: SPP_201401_PRE
      ppDetailBand5: TppDetailBand;
      ppDBText32: TppDBText;
      ppDBText33: TppDBText;
      ppDBText34: TppDBText;
      ppDBText35: TppDBText;
      ppDBText36: TppDBText;
      ppDBText37: TppDBText;
      ppDBText38: TppDBText;
      ppSummaryBand5: TppSummaryBand;
      ppLine19: TppLine;
      ppLabel106: TppLabel;
      ppLabel107: TppLabel;
      ppLine20: TppLine;
      ppDBCalc4: TppDBCalc;
      ppLabel108: TppLabel;
      ppLabel109: TppLabel;
      ppLabel110: TppLabel;
      ppLabel111: TppLabel;
      ppLabel112: TppLabel;
      ppDBText39: TppDBText;
      ppLabel101: TppLabel;
      ppLabel102: TppLabel;
      ppDBText40: TppDBText;

      //Inicio: HPP_200904_PRE - realizado por IREVILLA
      pprDepCta: TppReport;
      ppHeaderBand6: TppHeaderBand;
      ppLabel113: TppLabel;
      ppLabel115: TppLabel;
      ppLabel116: TppLabel;
      ppLabel117: TppLabel;
      ppSystemVariable16: TppSystemVariable;
      ppSystemVariable17: TppSystemVariable;
      ppSystemVariable18: TppSystemVariable;
      ppLabel118: TppLabel;
      ppLabel119: TppLabel;
      ppLabel120: TppLabel;
      ppLabel121: TppLabel;
      ppLabel122: TppLabel;
      ppLabel123: TppLabel;
      ppLine21: TppLine;
      ppLine22: TppLine;
      ppLabel125: TppLabel;
//Inicio: SPP_201401_PRE
      // ppImage6: TppImage;  
      // ppLabel129: TppLabel;  
      // ppLabel130: TppLabel;  
      // ppLabel131: TppLabel;  
//Fin: SPP_201401_PRE
      ppDetailBand6: TppDetailBand;
      ppDBText41: TppDBText;
      ppDBText42: TppDBText;
      ppDBText43: TppDBText;
      ppDBText44: TppDBText;
      ppDBText45: TppDBText;
      ppDBText47: TppDBText;
      ppSummaryBand6: TppSummaryBand;
      ppLine23: TppLine;
      ppLabel136: TppLabel;
      ppLabel137: TppLabel;
      ppLine24: TppLine;
      ppDBCalc6: TppDBCalc;
      ppLabel138: TppLabel;
      ppLabel139: TppLabel;
      ppLabel140: TppLabel;
      ppDBText46: TppDBText;
//Inicio: SPP_201401_PRE
    ppImage4: TppImage;  
    ppImage1: TppImage;  
    ppImage2: TppImage;  
    ppImage3: TppImage;  
    ppImage5: TppImage;  
    ppImage6: TppImage;  
//Fin: SPP_201401_PRE
      //Fin: HPP_200904_PRE

      Procedure FormActivate(Sender: TObject);
      Procedure dblcdTipId1Exit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      // procedure BitExportaClick(Sender: TObject);
      // procedure fcsbtnExportaClick(Sender: TObject);
      Procedure btnimprimirClick(Sender: TObject);
      Procedure btnaexcelClick(Sender: TObject);
      Procedure BitBtn3Click(Sender: TObject);
      Procedure btnImprimePrevioClick(Sender: TObject);
      Procedure dblcdTipIdExit(Sender: TObject);
   Private
    { Private declarations }
   Public

    { Public declarations }
   End;

Var
   FrepXTipPag: TFrepXTipPag;
   cuenta, cuepag: Integer;
   montot: Double;

Implementation

Uses PREDM;

{$R *.dfm}

Procedure TFrepXTipPag.FormActivate(Sender: TObject);
Var
   xSql: String;
Begin
   If DM1.cdsQry2.Active = True Then DM1.cdsQry2.Close;
   btnimprimir.Enabled := False;
   btnaexcel.Enabled := False;
   xSql := 'SELECT TIPDESEID, TIPDESEABR FROM CRE104 WHERE NVL(FLAHISPRE, ''X'') = ''S''';
   DM1.cdsTipDesemb.Close;
   DM1.cdsTipDesemb.DataRequest(xSql);
   DM1.cdsTipDesemb.Open;
   dblcdTipId.Selected.Clear;
   dblcdTipId.Selected.Add('TIPDESEID'#9'2'#9'Código'#9#9);
   dblcdTipId.Selected.Add('TIPDESEABR'#9'25'#9'Representantes'#9#9);

   dbdtpInicial.SetFocus;
   dbdtpInicial.Date := DM1.FechaSys;
   dbdtpFinal.Date := DM1.FechaSys;
End;

Procedure TFrepXTipPag.dblcdTipId1Exit(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'TIPDESEID =' + QuotedStr(dblcdTipId.text);
   edtTipDes.Text := DM1.DisplayDescrip('prvSQL', 'CRE104', 'TIPDESEDES', xWhere, 'TIPDESEDES');
   If (edtTipDes.Text = '') And (dblcdTipId.Text <> '') Then
   Begin
      MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
      dblcdTipId.SetFocus;
   End;
End;

Procedure TFrepXTipPag.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If Key = #13 Then
   Begin
      Key := #0;
      Perform(CM_DIALOGKEY, VK_TAB, 0);
   End;
End;

Procedure TFrepXTipPag.btnimprimirClick(Sender: TObject);
Begin
   If dblcdTipId.Text = '01' Then // Cheques
   Begin
      pplcanmonpagche.Caption := IntToStr(cuenta);
      pplcanexpateche.Caption := IntToStr(cuepag);
      pplTitulo.Caption := 'BENEFICIOS ATENDIDOS POR CHEQUE DEL ' + dbdtpInicial.Text + ' AL ' + dbdtpFinal.Text;
      pprCheque.Print;
   End;
   If dblcdTipId.Text = '05' Then // Giros Bancarios
   Begin
      pplcanexppaggir.Caption := IntToStr(cuepag);
      pplcanexpategir.Caption := IntToStr(cuenta);
      ppLabel27.Caption := 'BENEFICIOS ATENDIDOS POR GIROS DEL BANCO DE LA NACION DEL ' + dbdtpInicial.Text + ' AL ' + dbdtpFinal.Text;
      pprGiros.Print;
   End;
   If dblcdTipId.Text = '06' Then // Teleahorro
   Begin
      pplcanexpatecta.Caption := IntToStr(cuenta);
      pplcanbenpagcta.Caption := IntToStr(cuepag);
      ppltitulo03.Caption := 'BENEFICIOS ATENDIDOS POR ABONO EN CUENTA DEL ' + dbdtpInicial.Text + ' AL ' + dbdtpFinal.Text;
      pprabocta.Print;
   End;
   If dblcdTipId.Text = '11' Then // Libretas de Ahorros
   Begin
      pplcanexpatelib.Caption := IntToStr(cuenta);
      pplcanexppaglib.Caption := IntToStr(cuepag);
      ppLabel53.Caption := 'BENEFICIOS ATENDIDOS POR LIBRETAS DE AHORRO DEL ' + dbdtpInicial.Text + ' AL ' + dbdtpFinal.Text;
      pprLibretas.Print;
   End;
   // Inicio: SPP_201307_PRE
   // If dblcdTipId.Text = '16'
   If (dblcdTipId.Text = '16') Or (dblcdTipId.Text = '19') Then // Cheques de Gerencia
   // Fin: SPP_201307_PRE
   Begin
      ppLabel110.Caption := IntToStr(cuenta);
      ppLabel109.Caption := IntToStr(cuepag);
      // Inicio: SPP_201307_PRE
      // ppLabel90.Caption := 'BENEFICIOS ATENDIDOS POR CHEQUES DE GERENCIA DEL ' + dbdtpInicial.Text + ' AL ' + dbdtpFinal.Text;
      ppLabel90.Caption := 'BENEFICIOS ATENDIDOS POR '+Trim(edtTipDes.Text)+' DEL ' + dbdtpInicial.Text + ' AL ' + dbdtpFinal.Text;
      // Fin: SPP_201307_PRE
      pprcheger.Print;
   End;

  // Inicio: HPP_200904_PRE - realizado por IREVILLA
   If dblcdTipId.Text = '18' Then // Deposito en Cuenta
   Begin
      ppLabel139.Caption := IntToStr(cuenta);
      ppLabel140.Caption := IntToStr(cuepag);
      ppLabel118.Caption := 'BENEFICIOS ATENDIDOS POR PAGO A CUENTA DEL ' + dbdtpInicial.Text + ' AL ' + dbdtpFinal.Text;
      pprDepCta.Print;
   End;
  // FIN HPP_200904_PRE - SAR2009-0369

End;

Procedure TFrepXTipPag.btnaexcelClick(Sender: TObject);
Begin
   DM1.HojaExcel('REPORTE', DM1.dsQry2, dtgData);
End;

Procedure TFrepXTipPag.BitBtn3Click(Sender: TObject);
Begin
   FrepXTipPag.Close;
End;

Procedure TFrepXTipPag.btnImprimePrevioClick(Sender: TObject);
Var
   xSql, xforma, xbanco: String; // SPP_201307_PRE
// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
   sBuscaFechas : String;
// Fin  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
Begin
   montot := 0;
   cuenta := 0;
   cuepag := 0;
   //Inicio   HPC_201807_PRE
   // Se crea cadena para incluir en el reporte de liquidaciones reprogramadas no pagadas
   // sBuscaFechas:=' ( '
   //              +'( TO_DATE(A.PVSLFECBE) >= ' + QuotedStr(dbdtpInicial.Text) + ' AND  TO_DATE(A.PVSLFECBE) <= ' + QuotedStr(dbdtpFinal.Text) + ' AND NVL(DIFERIDO, ''N'') = ''N'' ) '
   //              +' or '
   //              +'( TO_DATE(A.FECDIFLIQ) >= ' + QuotedStr(dbdtpInicial.Text) + ' AND  TO_DATE(A.FECDIFLIQ) <= ' + QuotedStr(dbdtpFinal.Text) + ' AND NVL(DIFERIDO, ''N'') = ''S'' ) '
   //              +' ) ';
   sBuscaFechas:=' ( '
                +'( TO_DATE(A.PVSLFECBE) >= ' + QuotedStr(dbdtpInicial.Text) + ' AND  TO_DATE(A.PVSLFECBE) <= ' + QuotedStr(dbdtpFinal.Text) + ' AND NVL(DIFERIDO, ''N'') = ''N'' ) '
                +' or '
                +'( TO_DATE(A.FECDIFLIQ) >= ' + QuotedStr(dbdtpInicial.Text) + ' AND  TO_DATE(A.FECDIFLIQ) <= ' + QuotedStr(dbdtpFinal.Text) + ' AND NVL(DIFERIDO, ''N'') = ''S''  AND TRUNC(FECREP)=A.FECDIFLIQ ) '
                +' ) ';
   //Inicio   HPC_201807_PRE
   If dblcdTipId.Text = '' Then
   Begin
      MessageDlg('Ingrese el tipo de pago', mtInformation, [mbOk], 0);
      dblcdTipId.SetFocus;
      Exit;
   End;
   If dbdtpInicial.Text = '' Then
   Begin
      MessageDlg('Ingrese la fecha inicial', mtInformation, [mbOk], 0);
      dbdtpInicial.SetFocus;
      Exit;
   End;
   If dbdtpFinal.Text = '' Then
   Begin
      MessageDlg('Ingrese la fecha final', mtInformation, [mbOk], 0);
      dbdtpFinal.SetFocus;
      Exit;
   End;
   If dbdtpInicial.Date > dbdtpFinal.Date Then
   Begin
      MessageDlg('Ingrese una fecha inicial menor o igual a la fecha final', mtInformation, [mbOk], 0);
      dblcdTipId.SetFocus;
   End;
  // Cheques
   If dblcdTipId.Text = '01' Then
   Begin
      xSql := ' SELECT COUNT(*) CUENTA '
            + '   FROM (SELECT DISTINCT A.PVSLBENNR FROM PVS306 A, PVS307 B'
            // Inicio: HPC_201705_PRE
            // Se modifica la busqueda de fecha
            // + '          WHERE TO_DATE(A.PVSLFECBE) >= ' + QuotedStr(dbdtpInicial.Text)
            // + '            AND TO_DATE(A.PVSLFECBE) <= ' + QuotedStr(dbdtpFinal.Text)
            + ' WHERE '+sBuscaFechas
            // Fin: HPC_201705_PRE
            + '            AND A.PVSLBENNR = B.PVSLBENNR '
            + '            AND A.PVSESTLIQ IN (''02'', ''05'', ''06'')'
            + '            AND B.FORPAGOID = ''01''  '
            + '            AND B.BANCOID   = ''03'' )';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;

      cuenta := DM1.cdsQry.FieldByName('CUENTA').AsInteger;
      xSql := ' SELECT SUBSTR(A.PVSLBENNR,5,7) PVSLBENNR, B.PVSLNVOU, A.ASOCODMOD, B.PVSNOMBRE, B.PVSLDNIBEN, '
            + '        SUBSTR(C.BENEFABR,1,15) BENEFABR, D.BANCOABR, B.PVSLMONTO '
            + '   FROM PVS306 A, PVS307 B, TGE186 C, TGE105 D '
            // Inicio: HPC_201705_PRE
            // Se modifica la busqueda de fecha
            // + '          WHERE TO_DATE(A.PVSLFECBE) >= ' + QuotedStr(dbdtpInicial.Text)
            // + '            AND TO_DATE(A.PVSLFECBE) <= ' + QuotedStr(dbdtpFinal.Text)
            + ' WHERE '+sBuscaFechas
            // Fin: HPC_201705_PRE
            + '    AND A.PVSLBENNR  = B.PVSLBENNR '
            + '    AND B.FORPAGOID  = ''01'' '
            + '    AND B.BANCOID    = ''03'' '
            + '    AND B.FLGVOUCHER = ''N''  '
            // Inicio: HPC_201705_PRE
            // Se añade la condición para que no se incluya forma de pagos extornadas
            + '    AND B.FLAEXT IS NULL '
            // Fin: HPC_201705_PRE
            + '    AND A.PVSESTLIQ  IN (''02'', ''05'', ''06'') '
            + '    AND A.PVSLTIPBE  = C.TIPBENEF '
            + '    AND B.BANCOID    = D.BANCOID '
            + '  ORDER BY SUBSTR(A.PVSLBENNR,5,7)';
      DM1.cdsQry2.Close;
      DM1.cdsQry2.DataRequest(xSql);
      DM1.cdsQry2.Open;
      DM1.cdsQry2.First;
      montot := 0;
      cuepag := 0;
      While Not DM1.cdsQry2.Eof Do
      Begin
         If DM1.cdsQry2.FieldByName('PVSLMONTO').AsFloat > 0 Then cuepag := cuepag + 1;
         montot := montot + DM1.cdsQry2.FieldByName('PVSLMONTO').AsFloat;
         DM1.cdsQry2.Next;
      End;
      DM1.cdsQry2.First;
      dbgtippag.Selected.Clear;
      dbgtippag.Selected.Add('PVSLBENNR'#9'7'#9'Número de~Beneficio'#9#9);
      dbgtippag.Selected.Add('PVSLNVOU'#9'7'#9'Número de~Voucher'#9#9);
      dbgtippag.Selected.Add('ASOCODMOD'#9'10'#9'Código~Modular'#9#9);
      dbgtippag.Selected.Add('PVSNOMBRE'#9'40'#9'Apellidos y nombre(s) del beneficiario'#9#9);
      dbgtippag.Selected.Add('PVSLDNIBEN'#9'8'#9'Documento~de identidad'#9#9);
      dbgtippag.Selected.Add('BENEFABR'#9'12'#9'Tipo de~beneficio'#9#9);
      dbgtippag.Selected.Add('BANCOABR'#9'12'#9'Descripción~del Banco'#9#9);
      dbgtippag.Selected.Add('PVSLMONTO'#9'10'#9'Monto del~beneficio'#9#9);
      dbgtippag.ApplySelected;
      TNumericField(DM1.cdsQry2.FieldByName('PVSLMONTO')).DisplayFormat := '###,###,##0.00';
      dbgtippag.ColumnByName('BANCOABR').FooterValue := 'TOTAL';
      dbgtippag.ColumnByName('PVSLMONTO').FooterValue := FormatFloat('###,###.#0', montot);
   End;
  // Efectivo
  { If dblcdTipId.Text = '04' Then
    Begin
      xSql := ' SELECT COUNT(*) CUENTA FROM (SELECT DISTINCT A.PVSLBENNR FROM PVS306 A, PVS307 B'
            +' WHERE TO_DATE(A.PVSLFECBE) >= '+QuotedStr(dbdtpInicial.Text)
            +' AND TO_DATE(A.PVSLFECBE) <= '+QuotedStr(dbdtpFinal.Text)
            +' AND A.PVSLBENNR = B.PVSLBENNR AND A.PVSESTLIQ IN (''02'', ''05'', ''06'')'
            +' AND B.FORPAGOID = ''05'' AND B.BANCOID = ''04'')';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      cuenta := DM1.cdsQry.FieldByName('CUENTA').AsInteger;
      xSql := 'SELECT SUBSTR(A.PVSLBENNR,5,7) PVSLBENNR, B.PVSLNVOU,  A.ASOCODMOD, B.PVSNOMBRE, B.PVSLDNIBEN, SUBSTR(C.BENEFABR,1,6) BENEFABR,  D.AGENBCOABR, B.PVSLMONTO'
      +' FROM PVS306 A, PVS307 B, TGE186 C, COB102 D'
      +' WHERE TO_DATE(A.PVSLFECBE) >= '+QuotedStr(dbdtpInicial.Text)
      +' AND TO_DATE(A.PVSLFECBE) <= '+QuotedStr(dbdtpFinal.Text)
      +' AND A.PVSLBENNR = B.PVSLBENNR AND B.FORPAGOID = ''05'' AND B.BANCOID = ''04'' AND B.FLGVOUCHER = ''N'''
      +' AND A.PVSESTLIQ IN (''02'', ''05'', ''06'') AND A.PVSLTIPBE = C.TIPBENEF AND B.AGENBCOID = D.AGENBCOID'
      +' ORDER BY SUBSTR(A.PVSLBENNR,5,7)' ;
      DM1.cdsQry2.Close;
      DM1.cdsQry2.DataRequest(xSql);
      DM1.cdsQry2.Open;
      DM1.cdsQry2.First;
      While Not DM1.cdsQry2.Eof Do
      Begin
        If DM1.cdsQry2.FieldByName('PVSLMONTO').AsFloat > 0 Then cuepag := cuepag + 1;
        montot := montot + DM1.cdsQry2.FieldByName('PVSLMONTO').AsFloat;
        DM1.cdsQry2.Next;
      End;
      DM1.cdsQry2.First;
      dbgtippag.Selected.Clear;
      dbgtippag.Selected.Add('PVSLBENNR'#9'7'#9'Número de~Beneficio'#9#9);
      dbgtippag.Selected.Add('PVSLNVOU'#9'7'#9'Número de~Voucher'#9#9);
      dbgtippag.Selected.Add('ASOCODMOD'#9'10'#9'Código~Modular'#9#9);
      dbgtippag.Selected.Add('PVSNOMBRE'#9'40'#9'Apellidos y nombre(s) del beneficiario'#9#9);
      dbgtippag.Selected.Add('PVSLDNIBEN'#9'8'#9'Documento~de identidad'#9#9);
      dbgtippag.Selected.Add('BENEFABR'#9'12'#9'Tipo de~beneficio'#9#9);
      dbgtippag.Selected.Add('AGENBCOABR'#9'12'#9'Agencia~del Banco'#9#9);
      dbgtippag.Selected.Add('PVSLMONTO'#9'10'#9'Monto del~beneficio'#9#9);
      dbgtippag.ApplySelected;
      TNumericField(DM1.cdsQry2.FieldByName('PVSLMONTO')).DisplayFormat := '###,###,##0.00';
      dbgtippag.ColumnByName('BANCOABR').FooterValue := 'TOTAL';
      dbgtippag.ColumnByName('PVSLMONTO').FooterValue := FormatFloat('###,###.#0',montot);
    End; }

  // Giros Bancarios
   If dblcdTipId.Text = '05' Then
   Begin
      xSql := ' SELECT COUNT(*) CUENTA FROM (SELECT DISTINCT A.PVSLBENNR FROM PVS306 A, PVS307 B'
            // Inicio: HPC_201705_PRE
            // Se modifica la busqueda de fecha
            // + '          WHERE TO_DATE(A.PVSLFECBE) >= ' + QuotedStr(dbdtpInicial.Text)
            // + '            AND TO_DATE(A.PVSLFECBE) <= ' + QuotedStr(dbdtpFinal.Text)
            + ' WHERE '+sBuscaFechas
            // Fin: HPC_201705_PRE
            + '                                 AND A.PVSLBENNR = B.PVSLBENNR'
            + '                                 AND A.PVSESTLIQ IN (''02'', ''05'', ''06'')'
            + '                                 AND B.FORPAGOID = ''05'' '
            + '                                 AND B.BANCOID   = ''04'' )';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      cuenta := DM1.cdsQry.FieldByName('CUENTA').AsInteger;
      xSql := 'SELECT SUBSTR(A.PVSLBENNR,5,7) PVSLBENNR, B.PVSLNVOU, A.ASOCODMOD, B.PVSNOMBRE,'
            + '       B.PVSLDNIBEN, SUBSTR(C.BENEFABR,1,6) BENEFABR,  D.AGENBCOABR, B.PVSLMONTO'
            + '  FROM PVS306 A, PVS307 B, TGE186 C, COB102 D'
            // Inicio: HPC_201705_PRE
            // Se modifica la busqueda de fecha
            // + '          WHERE TO_DATE(A.PVSLFECBE) >= ' + QuotedStr(dbdtpInicial.Text)
            // + '            AND TO_DATE(A.PVSLFECBE) <= ' + QuotedStr(dbdtpFinal.Text)
            + ' WHERE '+sBuscaFechas
            // Fin: HPC_201705_PRE
            + '   AND A.PVSLBENNR  = B.PVSLBENNR '
            + '   AND B.FORPAGOID  = ''05'' '
            + '   AND B.BANCOID    = ''04'' '
            + '   AND B.FLGVOUCHER = ''N''  '
            // Inicio: HPC_201705_PRE
            // Se añade la condición para que no se incluya forma de pagos extornadas
            + '   AND B.FLAEXT IS NULL '
            // Fin: HPC_201705_PRE
            + '   AND A.PVSESTLIQ  IN (''02'', ''05'', ''06'') '
            + '   AND A.PVSLTIPBE  = C.TIPBENEF '
            + '   AND B.AGENBCOID  = D.AGENBCOID'
            + ' ORDER BY SUBSTR(A.PVSLBENNR,5,7)';
      DM1.cdsQry2.Close;
      DM1.cdsQry2.DataRequest(xSql);
      DM1.cdsQry2.Open;
      DM1.cdsQry2.First;
      While Not DM1.cdsQry2.Eof Do
      Begin
         If DM1.cdsQry2.FieldByName('PVSLMONTO').AsFloat > 0 Then cuepag := cuepag + 1;
         montot := montot + DM1.cdsQry2.FieldByName('PVSLMONTO').AsFloat;
         DM1.cdsQry2.Next;
      End;
      DM1.cdsQry2.First;
      dbgtippag.Selected.Clear;
      dbgtippag.Selected.Add('PVSLBENNR'#9'7'#9'Número de~Beneficio'#9#9);
      dbgtippag.Selected.Add('PVSLNVOU'#9'7'#9'Número de~Voucher'#9#9);
      dbgtippag.Selected.Add('ASOCODMOD'#9'10'#9'Código~Modular'#9#9);
      dbgtippag.Selected.Add('PVSNOMBRE'#9'40'#9'Apellidos y nombre(s) del beneficiario'#9#9);
      dbgtippag.Selected.Add('PVSLDNIBEN'#9'8'#9'Documento~de identidad'#9#9);
      dbgtippag.Selected.Add('BENEFABR'#9'12'#9'Tipo de~beneficio'#9#9);
      dbgtippag.Selected.Add('AGENBCOABR'#9'12'#9'Agencia~del Banco'#9#9);
      dbgtippag.Selected.Add('PVSLMONTO'#9'10'#9'Monto del~beneficio'#9#9);
      dbgtippag.ApplySelected;
      TNumericField(DM1.cdsQry2.FieldByName('PVSLMONTO')).DisplayFormat := '###,###,##0.00';
      dbgtippag.ColumnByName('BANCOABR').FooterValue := 'TOTAL';
      dbgtippag.ColumnByName('PVSLMONTO').FooterValue := FormatFloat('###,###.#0', montot);
   End;
   // Teleahorro
   If dblcdTipId.Text = '06' Then
   Begin
      xSql := ' SELECT COUNT(*) CUENTA FROM (SELECT DISTINCT A.PVSLBENNR FROM PVS306 A, PVS307 B'
            // Inicio: HPC_201705_PRE
            // Se modifica la busqueda de fecha
            // + '          WHERE TO_DATE(A.PVSLFECBE) >= ' + QuotedStr(dbdtpInicial.Text)
            // + '            AND TO_DATE(A.PVSLFECBE) <= ' + QuotedStr(dbdtpFinal.Text)
            + ' WHERE '+sBuscaFechas
            // Fin: HPC_201705_PRE
            + '                                 AND A.PVSLBENNR = B.PVSLBENNR '
            + '                                 AND A.PVSESTLIQ IN (''02'', ''05'', ''06'') '
            + '                                 AND B.FORPAGOID = ''06'' '
            + '                                 AND B.BANCOID   = ''04'' )';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      cuenta := DM1.cdsQry.FieldByName('CUENTA').AsInteger;
      xSql := ' SELECT SUBSTR(A.PVSLBENNR,5,7) PVSLBENNR, A.ASOCODMOD, B.PVSNOMBRE, B.PVSLDNIBEN,'
            + '        B.PVSLMONTO, B.PVSLNCTA, B.PVSLNVOU, C.BENEFABR, D.BANCOABR'
            + '   FROM PVS306 A, PVS307 B, TGE186 C, TGE105 D'
            // Inicio: HPC_201705_PRE
            // Se modifica la busqueda de fecha
            // + '          WHERE TO_DATE(A.PVSLFECBE) >= ' + QuotedStr(dbdtpInicial.Text)
            // + '            AND TO_DATE(A.PVSLFECBE) <= ' + QuotedStr(dbdtpFinal.Text)
            + ' WHERE '+sBuscaFechas
            // Fin: HPC_201705_PRE
            + '    AND A.PVSLBENNR  = B.PVSLBENNR '
            + '    AND B.FORPAGOID  = ''06'' '
            + '    AND B.BANCOID    = ''04'' '
            + '    AND B.BANCOID    = D.BANCOID'
            + '    AND B.FLGVOUCHER = ''N''  '
            // Inicio: HPC_201705_PRE
            // Se añade la condición para que no se incluya forma de pagos extornadas
            + '   AND B.FLAEXT IS NULL '
            // Fin: HPC_201705_PRE
            + '    AND A.PVSESTLIQ  IN (''02'', ''05'', ''06'') '
            + '    AND A.PVSLTIPBE  = C.TIPBENEF '
            + '  ORDER BY SUBSTR(A.PVSLBENNR,5,7)';
      DM1.cdsQry2.Close;
      DM1.cdsQry2.DataRequest(xSql);
      DM1.cdsQry2.Open;
      DM1.cdsQry2.First;
      While Not DM1.cdsQry2.Eof Do
      Begin
         If DM1.cdsQry2.FieldByName('PVSLMONTO').AsFloat > 0 Then
            cuepag := cuepag + 1;
         DM1.cdsQry2.Next;
      End;
      dbgtippag.Selected.Clear;
      dbgtippag.Selected.Add('PVSLBENNR'#9'7'#9'Número de~Beneficio'#9#9);
      dbgtippag.Selected.Add('ASOCODMOD'#9'10'#9'Código~Modular'#9#9);
      dbgtippag.Selected.Add('PVSNOMBRE'#9'40'#9'Apellidos y nombre(s) del beneficiario'#9#9);
      dbgtippag.Selected.Add('PVSLDNIBEN'#9'8'#9'Documento~de identidad'#9#9);
      dbgtippag.Selected.Add('PVSLMONTO'#9'12'#9'Monto del~beneficio'#9#9);
      dbgtippag.Selected.Add('PVSLNCTA'#9'10'#9'Número de~Cuenta'#9#9);
      dbgtippag.Selected.Add('BENEFABR'#9'8'#9'Tipo de~Beneficio'#9#9);
      dbgtippag.ApplySelected;
   End;
   // Libretas de Ahorros
   If dblcdTipId.Text = '11' Then
   Begin
      xSql := ' SELECT COUNT(*) CUENTA '
            + '   FROM (SELECT DISTINCT A.PVSLBENNR FROM PVS306 A, PVS307 B'
            // Inicio: HPC_201705_PRE
            // Se modifica la busqueda de fecha
            // + '          WHERE TO_DATE(A.PVSLFECBE) >= ' + QuotedStr(dbdtpInicial.Text)
            // + '            AND TO_DATE(A.PVSLFECBE) <= ' + QuotedStr(dbdtpFinal.Text)
            + ' WHERE '+sBuscaFechas
            // Fin: HPC_201705_PRE
            + '            AND A.PVSLBENNR = B.PVSLBENNR '
            + '            AND A.PVSESTLIQ IN (''02'', ''05'', ''06'') '
            + '            AND B.FORPAGOID = ''11'' '
            + '            AND B.BANCOID   = ''03'' )';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      cuenta := DM1.cdsQry.FieldByName('CUENTA').AsInteger;
      xSql := ' SELECT SUBSTR(B.PVSLBENNR,5,7) PVSLBENNR,  B.PVSLNVOU, A.ASOCODMOD, '
            + '        B.PVSNOMBRE, SUBSTR(C.BENEFABR,1,6) BENEFABR, D.BANCOABR, B.PVSLMONTO'
            + '   FROM PVS306 A, PVS307 B, TGE186 C, TGE105 D'
            // Inicio: HPC_201705_PRE
            // Se modifica la busqueda de fecha
            // + '          WHERE TO_DATE(A.PVSLFECBE) >= ' + QuotedStr(dbdtpInicial.Text)
            // + '            AND TO_DATE(A.PVSLFECBE) <= ' + QuotedStr(dbdtpFinal.Text)
            + ' WHERE '+sBuscaFechas
            // Fin: HPC_201705_PRE
            + '    AND A.PVSLBENNR  = B.PVSLBENNR '
            + '    AND B.FORPAGOID  = ''11'' '
            + '    AND B.BANCOID    = ''03'' '
            + '    AND B.FLGVOUCHER = ''N'' '
            // Inicio: HPC_201705_PRE
            // Se añade la condición para que no se incluya forma de pagos extornadas
            + '   AND B.FLAEXT IS NULL '
            // Fin: HPC_201705_PRE
            + '    AND A.PVSESTLIQ IN (''02'', ''05'', ''06'') '
            + '    AND A.PVSLTIPBE  = C.TIPBENEF '
            + '    AND B.BANCOID    = D.BANCOID '
            + '  ORDER BY SUBSTR(B.PVSLBENNR,5,7)';
      DM1.cdsQry2.Close;
      DM1.cdsQry2.DataRequest(xSql);
      DM1.cdsQry2.Open;
      DM1.cdsQry2.First;
      While Not DM1.cdsQry2.Eof Do
      Begin
         If DM1.cdsQry2.FieldByName('PVSLMONTO').AsFloat > 0 Then cuepag := cuepag + 1;
         montot := montot + DM1.cdsQry2.FieldByName('PVSLMONTO').AsFloat;
         DM1.cdsQry2.Next;
      End;
      DM1.cdsQry2.First;
      dbgtippag.Selected.Clear;
      dbgtippag.Selected.Add('PVSLBENNR'#9'7'#9'Número de~Beneficio'#9#9);
      dbgtippag.Selected.Add('PVSLNVOU'#9'7'#9'Número de~Voucher'#9#9);
      dbgtippag.Selected.Add('ASOCODMOD'#9'10'#9'Código~Modular'#9#9);
      dbgtippag.Selected.Add('PVSNOMBRE'#9'40'#9'Apellidos y nombre(s) del beneficiario'#9#9);
      dbgtippag.Selected.Add('BENEFABR'#9'12'#9'Tipo de~beneficio'#9#9);
      dbgtippag.Selected.Add('BANCOABR'#9'12'#9'Descripción~del Banco'#9#9);
      dbgtippag.Selected.Add('PVSLMONTO'#9'10'#9'Monto del~beneficio'#9#9);
      dbgtippag.ApplySelected;
      TNumericField(DM1.cdsQry2.FieldByName('PVSLMONTO')).DisplayFormat := '###,###,##0.00';
      dbgtippag.ColumnByName('BANCOABR').FooterValue := 'TOTAL';
      dbgtippag.ColumnByName('PVSLMONTO').FooterValue := FormatFloat('###,###.#0', montot);
   End;

   // Cheques de Gerencia
   // Inicio: SPP_201307_PRE
   // If dblcdTipId.Text = '16' Then
   If (dblcdTipId.Text = '16') Or (dblcdTipId.Text = '19') Then
   Begin
      If dblcdTipId.Text = '16' Then
      Begin
         xforma := '16';
         xbanco := '03';
      End;
      If dblcdTipId.Text = '19' Then
      Begin
         xforma := '19';
         xbanco := '15';
      End;
// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
      // Inicio: HPC_201705_PRE
      // Se retira asignación "sBuscaFechas"
      // sBuscaFechas:=' ( '
      //           +'( TO_DATE(A.PVSLFECBE) >= ' + QuotedStr(dbdtpInicial.Text) + ' AND  TO_DATE(A.PVSLFECBE) <= ' + QuotedStr(dbdtpFinal.Text) + ' AND NVL(DIFERIDO, ''N'') = ''N'' ) '
      //           +' or '
      //           +'( TO_DATE(A.FECDIFLIQ) >= ' + QuotedStr(dbdtpInicial.Text) + ' AND  TO_DATE(A.FECDIFLIQ) <= ' + QuotedStr(dbdtpFinal.Text) + ' AND NVL(DIFERIDO, ''N'') = ''S'' ) '
      //           +' ) ';
      // Fin: HPC_201705_PRE
// Fin   HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
      xSQL := ' SELECT COUNT(*) CUENTA '
            + '   FROM (SELECT DISTINCT A.PVSLBENNR FROM PVS306 A, PVS307 B'
// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
            //+ '          WHERE TO_DATE(A.PVSLFECBE) >= ' + QuotedStr(dbdtpInicial.Text)
            //+ '            AND TO_DATE(A.PVSLFECBE) <= ' + QuotedStr(dbdtpFinal.Text)
            + ' WHERE '+sBuscaFechas
// Fin  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
            + '            AND A.PVSLBENNR = B.PVSLBENNR '
            + '            AND A.PVSESTLIQ IN (''02'', ''05'', ''06'')'
            + '            AND B.FORPAGOID = '+QuotedStr(xforma)
            + '            AND B.BANCOID   = '+QuotedStr(xbanco)+')';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      cuenta := DM1.cdsQry.FieldByName('CUENTA').AsInteger;
      xSQL := ' SELECT SUBSTR(B.PVSLBENNR,5,7) PVSLBENNR,  B.PVSLNVOU, A.ASOCODMOD, B.PVSNOMBRE,'
            + '        SUBSTR(C.BENEFABR,1,6) BENEFABR, D.BANCOABR, B.PVSLMONTO, B.NUMCHEGER, B.DNIRUC'
            + '   FROM PVS306 A, PVS307 B, TGE186 C, TGE105 D'

// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
            //+ '  WHERE TO_DATE(A.PVSLFECBE) >= ' + QuotedStr(dbdtpInicial.Text)
            //+ '    AND TO_DATE(A.PVSLFECBE) <= ' + QuotedStr(dbdtpFinal.Text)
            + ' WHERE '+sBuscaFechas
// Fin  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
            + '    AND A.PVSLBENNR  = B.PVSLBENNR '
            + '    AND B.FORPAGOID  = '+QuotedStr(xforma)
            + '    AND B.BANCOID    = '+QuotedStr(xbanco)
            + '    AND B.FLGVOUCHER = ''N'' '
            // Inicio: HPC_201705_PRE
            // Se añade la condición para que no se incluya forma de pagos extornadas
            + '   AND B.FLAEXT IS NULL '
            // Fin: HPC_201705_PRE
            + '    AND A.PVSESTLIQ  IN (''02'', ''05'', ''06'') '
            + '    AND A.PVSLTIPBE  = C.TIPBENEF '
            + '    AND B.BANCOID    = D.BANCOID '
            + '  ORDER BY SUBSTR(B.PVSLBENNR,5,7)';
      DM1.cdsQry2.Close;
      DM1.cdsQry2.DataRequest(xSql);
      DM1.cdsQry2.Open;
      DM1.cdsQry2.First;
      While Not DM1.cdsQry2.Eof Do
      Begin
         If DM1.cdsQry2.FieldByName('PVSLMONTO').AsFloat > 0 Then cuepag := cuepag + 1;
         montot := montot + DM1.cdsQry2.FieldByName('PVSLMONTO').AsFloat;
         DM1.cdsQry2.Next;
      End;
      DM1.cdsQry2.First;
      dbgtippag.Selected.Clear;
      dbgtippag.Selected.Add('PVSLBENNR'#9'7'#9'Número de~Beneficio'#9#9);
      dbgtippag.Selected.Add('PVSLNVOU'#9'7'#9'Número de~Voucher'#9#9);
      dbgtippag.Selected.Add('ASOCODMOD'#9'10'#9'Código~Modular'#9#9);
      dbgtippag.Selected.Add('PVSNOMBRE'#9'40'#9'Apellidos y nombre(s) del beneficiario'#9#9);
      dbgtippag.Selected.Add('BENEFABR'#9'12'#9'Tipo de~beneficio'#9#9);
      dbgtippag.Selected.Add('BANCOABR'#9'12'#9'Descripción~del Banco'#9#9);
      dbgtippag.Selected.Add('PVSLMONTO'#9'10'#9'Monto del~beneficio'#9#9);
      dbgtippag.Selected.Add('NUMCHEGER'#9'10'#9'Número de Cheque~de gerencia'#9#9);
      dbgtippag.Selected.Add('DNIRUC'#9'10'#9''#9#9);
      dbgtippag.ApplySelected;
      TNumericField(DM1.cdsQry2.FieldByName('PVSLMONTO')).DisplayFormat := '###,###,##0.00';
      dbgtippag.ColumnByName('BANCOABR').FooterValue := 'TOTAL';
      dbgtippag.ColumnByName('PVSLMONTO').FooterValue := FormatFloat('###,###.#0', montot);
   End;
   // Fin: SPP_201307_PRE

  // Inicio: HPP_200904_PRE - SAR2009-0369 - realizado por IREVILLA
  // Depositos en banco
   If dblcdTipId.Text = '18' Then
   Begin
      xSql := ' SELECT COUNT(*) CUENTA '
            + '   FROM (SELECT DISTINCT A.PVSLBENNR FROM PVS306 A, PVS307 B'
            // Inicio: HPC_201705_PRE
            // Se modifica la busqueda de fecha
            // + '          WHERE TO_DATE(A.PVSLFECBE) >= ' + QuotedStr(dbdtpInicial.Text)
            // + '            AND TO_DATE(A.PVSLFECBE) <= ' + QuotedStr(dbdtpFinal.Text)
            + ' WHERE '+sBuscaFechas
            // Fin: HPC_201705_PRE
            + '            AND A.PVSLBENNR = B.PVSLBENNR '
            + '            AND A.PVSESTLIQ IN (''02'', ''05'', ''06'') '
            + '            AND B.FORPAGOID = ''18'' '
            + '            AND B.BANCOID   = ''15'' )';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      cuenta := DM1.cdsQry.FieldByName('CUENTA').AsInteger;
      xSql := 'SELECT SUBSTR(B.PVSLBENNR,5,7) PVSLBENNR,  B.PVSLNVOU, A.ASOCODMOD, '
            + '       B.PVSNOMBRE, SUBSTR(C.BENEFABR,1,6) BENEFABR, B.PVSLNCTA, B.PVSLMONTO'
            + '  FROM PVS306 A, PVS307 B, TGE186 C, TGE105 D'
            // Inicio: HPC_201705_PRE
            // Se modifica la busqueda de fecha
            // + '          WHERE TO_DATE(A.PVSLFECBE) >= ' + QuotedStr(dbdtpInicial.Text)
            // + '            AND TO_DATE(A.PVSLFECBE) <= ' + QuotedStr(dbdtpFinal.Text)
            + ' WHERE '+sBuscaFechas
            // Fin: HPC_201705_PRE
            + '   AND A.PVSLBENNR  = B.PVSLBENNR '
            + '   AND B.FORPAGOID  = ''18'' '
            + '   AND B.BANCOID    = ''15'' '
            + '   AND B.FLGVOUCHER = ''N'' '
            // Inicio: HPC_201705_PRE
            // Se añade la condición para que no se incluya forma de pagos extornadas
            + '   AND B.FLAEXT IS NULL '            
            // Fin: HPC_201705_PRE
            + '   AND A.PVSESTLIQ  IN (''02'', ''05'', ''06'') '
            + '   AND A.PVSLTIPBE  = C.TIPBENEF'
            + '   AND B.BANCOID    = D.BANCOID '
            + ' ORDER BY SUBSTR(B.PVSLBENNR,5,7)';
      DM1.cdsQry2.Close;
      DM1.cdsQry2.DataRequest(xSql);
      DM1.cdsQry2.Open;
      DM1.cdsQry2.First;
      While Not DM1.cdsQry2.Eof Do
      Begin
         If DM1.cdsQry2.FieldByName('PVSLMONTO').AsFloat > 0 Then
            cuepag := cuepag + 1;
         montot := montot + DM1.cdsQry2.FieldByName('PVSLMONTO').AsFloat;
         DM1.cdsQry2.Next;
      End;
      dbgtippag.Selected.Clear;
      dbgtippag.Selected.Add('PVSLBENNR'#9'7'#9'Número de~Expediente'#9#9);
      dbgtippag.Selected.Add('PVSLNVOU'#9'7'#9'Número de~Voucher'#9#9);
      dbgtippag.Selected.Add('ASOCODMOD'#9'10'#9'Código~Modular'#9#9);
      dbgtippag.Selected.Add('PVSNOMBRE'#9'40'#9'Apellidos y nombre(s) del beneficiario'#9#9);
      dbgtippag.Selected.Add('BENEFABR'#9'12'#9'Tipo de~Beneficio'#9#9);
      dbgtippag.Selected.Add('PVSLNCTA'#9'12'#9'Núm.Cta.~Teleahorro'#9#9);
      dbgtippag.Selected.Add('PVSLMONTO'#9'12'#9'Monto del~beneficio'#9#9);
      dbgtippag.ApplySelected;
      TNumericField(DM1.cdsQry2.FieldByName('PVSLMONTO')).DisplayFormat := '###,###,##0.00';
      dbgtippag.ColumnByName('PVSLNCTA').FooterValue := 'TOTAL';
      dbgtippag.ColumnByName('PVSLMONTO').FooterValue := FormatFloat('###,###.#0', montot);
   End;
   // Fin: SAR2009-0369 - HPP_200904_PRE

   If DM1.cdsQry2.RecordCount = 0 Then
   Begin
      btnimprimir.Enabled := False;
      btnaexcel.Enabled := False;
      MessageDlg('No existe información para imprimir', mtInformation, [mbOk], 0);
      dbdtpInicial.SetFocus;
      Exit;
   End;
   btnimprimir.Enabled := True;
   btnaexcel.Enabled := True;
End;

Procedure TFrepXTipPag.dblcdTipIdExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If dblcdTipId.Text = '' Then
   Begin
      MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
      dblcdTipId.SetFocus;
   End;
   xWhere := 'TIPDESEID =' + QuotedStr(dblcdTipId.text);
   edtTipDes.Text := DM1.DisplayDescrip('prvSQL', 'CRE104', 'TIPDESEDES', xWhere, 'TIPDESEDES');
   If edtTipDes.Text = '' Then
   Begin
      MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
      dblcdTipId.SetFocus;
   End;
End;
End.

