// Inicio Uso Estándares: 01/08/2011
// Unidad : Previsión Social
// Formulario : TFnueofi
// Fecha de Creación : 08/08/2011
// Autor : Sistemas
// Objetivo : Generación de Oficios
// Actualizaciones
// HPC_201302_PRE  : Se valida la fecha inicial y la fecha final. No debe ser mayor que el dia de hoy.
// SPP_201303_PRE  : El pase a producción se realiza a partir del HPC_201302_PRE
// HPC_201304_PRE  : Generación de oficios. Forma de pago cuente de ahorros en soles
// SPP_201305_PRE  : Se realiza el pase a producción a partir del HPC_201304_PRE
// HPC_201305_PRE  : Se modifica la variable que guarda tipo de moneda (En ves de "N" se cambia por "S")
// SPP_201306_PRE  : Se realiza el pase a producción a partir del HPC_201305_PRE
// HPC_201307_PRE  : Hitos de desembolso de de oficios (CON GENERACION DE DESEMBOLSO)
// SPP_201401_PRE  : Se realiza el pase a producción a partir del pase HPC_201307_PRE
// HPC_201402_PRE  : Se añade a los reportes de oficios el apellido de casada.
// SPP_201403_PRE  : Se realiza el pase a producción a partir del pase HPC_201402_PRE.
// HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
// HPC_201702_PRE : Se corrige inconsistencias de códigos en las actualizaciones de 
//                  Seguimiento de expedientes, liquidaciones y desembolsos
// HPC_201705_PRE : Se controla que no se muestren las formas de pagos extornadas, y se añade el año al numero de oficio. Campo "NUEOFI".

Unit PRE251;

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, wwdbdatetimepicker, wwdblook, Mask, ExtCtrls, Buttons,
   Grids, Wwdbigrd, Wwdbgrid, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE,
   ppProd, ppClass, ppReport, ppBands, ppCache, ppCtrls, ppVar, ppPrnabl;

Type
   TFnueofi = Class(TForm)
      gbdatos: TGroupBox;
      dbdtpfecini: TwwDBDateTimePicker;
      dbdtpfecfin: TwwDBDateTimePicker;
      pnlforpagodes: TPanel;
      meforpagodes: TMaskEdit;
      pnlbancodes: TPanel;
      mebancodes: TMaskEdit;
      Label1: TLabel;
      Label2: TLabel;
      Label3: TLabel;
      Label4: TLabel;
      btnImprimePrevio: TBitBtn;
      GroupBox2: TGroupBox;
      dbgprevio: TwwDBGrid;
      btnimppre: TBitBtn;
      btngenera: TBitBtn;
      dblcforpagoid: TwwDBLookupCombo;
      dblcbancoid: TwwDBLookupCombo;
      btncerrar: TBitBtn;
      ppbdereporte: TppBDEPipeline;
      pprGiros: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppDetailBand1: TppDetailBand;
      ppLabel96: TppLabel;
      ppSystemVariable3: TppSystemVariable;
      ppLine25: TppLine;
      ppImage4: TppImage;
      ppLabel97: TppLabel;
      ppLabel98: TppLabel;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppDBText1: TppDBText;
      ppltitulo01: TppLabel;
      pplfecha01: TppLabel;
      ppLine1: TppLine;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBCalc1: TppDBCalc;
      ppDBCalc2: TppDBCalc;
      ppLine2: TppLine;
      ppLine3: TppLine;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppSummaryBand1: TppSummaryBand;
      pprahorros: TppReport;
      ppHeaderBand2: TppHeaderBand;
      ppLabel9: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppLine4: TppLine;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppLabel14: TppLabel;
      ppLabel15: TppLabel;
      ppltitulo02: TppLabel;
      pplfecha02: TppLabel;
      ppLine5: TppLine;
      ppLabel19: TppLabel;
      ppDetailBand2: TppDetailBand;
      ppDBText6: TppDBText;
      ppDBText8: TppDBText;
      ppDBText10: TppDBText;
      ppSummaryBand2: TppSummaryBand;
      ppDBCalc3: TppDBCalc;
      ppDBCalc4: TppDBCalc;
      ppLine6: TppLine;
      ppLine7: TppLine;
      ppLabel20: TppLabel;
      ppLabel21: TppLabel;
      pprlibretas: TppReport;
      ppHeaderBand3: TppHeaderBand;
      ppLabel22: TppLabel;
      ppSystemVariable2: TppSystemVariable;
      ppLine8: TppLine;
      ppLabel24: TppLabel;
      ppLabel25: TppLabel;
      ppLabel27: TppLabel;
      ppLabel28: TppLabel;
      ppLabel29: TppLabel;
      ppltitulo03: TppLabel;
      pplfecha03: TppLabel;
      ppLine9: TppLine;
      ppLabel32: TppLabel;
      ppDetailBand3: TppDetailBand;
      ppDBText11: TppDBText;
      ppDBText13: TppDBText;
      ppDBText14: TppDBText;
      ppDBText15: TppDBText;
      ppSummaryBand3: TppSummaryBand;
      ppDBCalc5: TppDBCalc;
      ppDBCalc6: TppDBCalc;
      ppLine10: TppLine;
      ppLine11: TppLine;
      ppLabel33: TppLabel;
      ppLabel34: TppLabel;
      ppLabel13: TppLabel;
      ppLabel16: TppLabel;
      ppLabel26: TppLabel;
      ppLabel35: TppLabel;
      ppDBText7: TppDBText;
      ppImage1: TppImage;
      ppLabel10: TppLabel;
      ppImage2: TppImage;
      ppLabel17: TppLabel;
      pprcheger: TppReport;
      ppHeaderBand4: TppHeaderBand;
      ppLabel18: TppLabel;
      ppSystemVariable4: TppSystemVariable;
      ppLine12: TppLine;
      ppImage3: TppImage;
      ppLabel23: TppLabel;
      ppLabel30: TppLabel;
      ppLabel31: TppLabel;
      ppLabel36: TppLabel;
      ppLabel37: TppLabel;
      ppLabel38: TppLabel;
      ppLabel39: TppLabel;
      ppLabel40: TppLabel;
      ppLabel41: TppLabel;
      ppLine13: TppLine;
      ppLabel42: TppLabel;
      ppDetailBand4: TppDetailBand;
      ppDBText9: TppDBText;
      ppDBText12: TppDBText;
      ppDBText16: TppDBText;
      ppDBText17: TppDBText;
      ppDBText18: TppDBText;
      ppSummaryBand4: TppSummaryBand;
      ppDBCalc7: TppDBCalc;
      ppDBCalc8: TppDBCalc;
      ppLine14: TppLine;
      ppLine15: TppLine;
      ppLabel43: TppLabel;
      ppLabel44: TppLabel;
      ppLabel45: TppLabel;
      pprDepCta: TppReport;
      ppHeaderBand5: TppHeaderBand;
      ppLabel46: TppLabel;
      ppSystemVariable5: TppSystemVariable;
      ppLine16: TppLine;
      ppImage5: TppImage;
      ppLabel47: TppLabel;
      ppLabel48: TppLabel;
      ppLabel49: TppLabel;
      ppLabel50: TppLabel;
      ppLabel51: TppLabel;
      ppLabel52: TppLabel;
      ppLabel53: TppLabel;
      ppLabel54: TppLabel;
      ppLabel55: TppLabel;
      ppLine17: TppLine;
      ppLabel57: TppLabel;
      ppDetailBand5: TppDetailBand;
      ppDBText19: TppDBText;
      ppDBText20: TppDBText;
      ppDBText21: TppDBText;
      ppDBText22: TppDBText;
      ppSummaryBand5: TppSummaryBand;
      ppDBCalc9: TppDBCalc;
      ppDBCalc10: TppDBCalc;
      ppLine18: TppLine;
      ppLine19: TppLine;
      ppLabel58: TppLabel;
      ppLabel59: TppLabel;
      rgtipomoneda: TRadioGroup; // SPP_201305_PRE
      Procedure btnImprimePrevioClick(Sender: TObject);
      Procedure dblcbancoidChange(Sender: TObject);
      Procedure FormActivate(Sender: TObject);
      Procedure dblcforpagoidChange(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure btncerrarClick(Sender: TObject);
      Procedure btnimppreClick(Sender: TObject);
      Procedure btngeneraClick(Sender: TObject);
      Procedure dblcforpagoidExit(Sender: TObject);
   Private
    { Private declarations }

// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
      sBuscaFechas : String;
      // Inicio: HPC_201705_PRE
      // Se añade variable para controlar si hay registros sin DNI.
      xDNIRUC :String;
      // Fin: HPC_201705_PRE
// Fin    HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
      
   Public
    { Public declarations }
   End;

Var
   Fnueofi: TFnueofi;

Implementation

Uses PREDM;

{$R *.dfm}

Procedure TFnueofi.btnImprimePrevioClick(Sender: TObject);
Var
   xSql: String;
   monto: Double;
   cantidad: Integer;
Begin
  // Verificando si los datos fueron ingresados correctamente
   If dblcforpagoid.Text = '' Then
   Begin
      MessageDlg('No se ha ingresado la forma de pago', mtError, [mbCancel], 0);
      dblcforpagoid.SetFocus;
      Exit;
   End;
   If dblcbancoid.Text = '' Then
   Begin
      MessageDlg('No se ha ingresado el banco', mtError, [mbCancel], 0);
      dblcbancoid.SetFocus;
      Exit;
   End;
   If dbdtpfecini.Text = '' Then
   Begin
      MessageDlg('No se ha ingresado la fecha inicial', mtError, [mbCancel], 0);
      dbdtpfecini.SetFocus;
      Exit;
   End;
   If dbdtpfecfin.Text = '' Then
   Begin
      MessageDlg('No se ha ingresado la fecha final', mtError, [mbCancel], 0);
      dbdtpfecfin.SetFocus;
      Exit;
   End;
   If dbdtpfecini.Date > dbdtpfecfin.Date Then
   Begin
      MessageDlg('La fecha inicial es mayor que la final', mtError, [mbCancel], 0);
      dbdtpfecini.SetFocus;
      Exit;
   End;
   // Inicio: SPP_201303_PRE
   If dbdtpfecini.Date > DM1.FechaSys Then
   Begin
       MessageDlg('La fecha inicial no debe ser mayor que el dia de hoy.', mtError, [mbCancel], 0);
       dbdtpfecini.SetFocus;
       Exit;
   End;
   If dbdtpfecfin.Date > DM1.FechaSys Then
   Begin
       MessageDlg('La fecha final no debe ser mayor que el dia de hoy.', mtError, [mbCancel], 0);
       dbdtpfecfin.SetFocus;
       Exit;
   End;

// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
   sBuscaFechas:=' ( '
                +'( TO_DATE(A.PVSLFECBE) >= ' + QuotedStr(dbdtpfecini.Text) + ' AND  TO_DATE(A.PVSLFECBE) <= ' + QuotedStr(dbdtpfecfin.Text) + ' AND NVL(DIFERIDO, ''N'') = ''N'' ) '
                +' or '
                +'( TO_DATE(A.FECDIFLIQ) >= ' + QuotedStr(dbdtpfecini.Text) + ' AND  TO_DATE(A.FECDIFLIQ) <= ' + QuotedStr(dbdtpfecfin.Text) + ' AND NVL(DIFERIDO, ''N'') = ''S'' ) '
                +' ) ';
// Fin   HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios

   // Fin: SPP_201303_PRE
   If dblcforpagoid.Text = '05' Then // Giros bancarios
   Begin
      dbgprevio.Selected.Clear;
      dbgprevio.Selected.Add('PVSNOMBRE'#9'25'#9'Apellidos y~nombres'#9#9);
      dbgprevio.Selected.Add('PVSLDNIBEN'#9'10'#9'Documento~de identidad'#9#9);
      dbgprevio.Selected.Add('PVSLMONTO'#9'11'#9'Importe~asignado'#9#9);
      dbgprevio.Selected.Add('AGENBCODES'#9'25'#9'Agencia del~banco'#9#9);
      dbgprevio.Selected.Add('DPTODES'#9'25'#9'Departamento~de la agencia'#9#9);
      dbgprevio.ApplySelected;
      //Inicio: SPP_201401_PRE
      // xSql := 'SELECT TRIM(B.APEPATCOB)||'' ''||TRIM(B.APEMATCOB)||'' ''||TRIM(B.NOMCOB) PVSNOMBRE, B.PVSLDNIBEN, B.PVSLMONTO, C.AGENBCODES, D.DPTODES'
      // Inicio: SPP_201403_PRE
      // xSql := 'SELECT A.ASOID, A.PVSEXPNRO, TRIM(B.APEPATCOB)||'' ''||TRIM(B.APEMATCOB)||'' ''||TRIM(B.NOMCOB) PVSNOMBRE, B.PVSLDNIBEN, B.PVSLMONTO, C.AGENBCODES, D.DPTODES'
// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
      xSql := 'SELECT A.ASOID, A.PVSEXPNRO, B.PVSNOMBRE, B.PVSLDNIBEN, B.PVSLMONTO, C.AGENBCODES, D.DPTODES'
      // Fin: SPP_201403_PRE

      //Fin: SPP_201401_PRE
         + ' FROM PVS306 A, PVS307 B, COB102 C, APO158 D'
         + ' WHERE '+sBuscaFechas
         //+ ' WHERE TO_DATE(A.PVSLFECBE) >= ' + QuotedStr(dbdtpfecini.Text) + ' AND  TO_DATE(A.PVSLFECBE) <= ' + QuotedStr(dbdtpfecfin.Text)
         + ' AND A.PVSESTLIQ IN (''02'', ''05'', ''06'') AND A.PVSLBENNR = B.PVSLBENNR AND B.PVSLAGRID IN (''FPG'', ''RET'') AND NVL(B.FLGVOUCHER, ''X'') = ''N'''
         + ' AND B.FORPAGOID = ' + QuotedStr(dblcforpagoid.Text) + ' AND B.BANCOID = ' + QuotedStr(dblcbancoid.Text)
         + ' AND NVL(B.PVSLMONTO,0) > 0 AND B.PVSLNOFC IS NULL AND B.AGENBCOID = C.AGENBCOID(+) AND C.DPTOID = D.DPTOID(+) ';
// Fin   HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
      DM1.cdsReporte.Close;
      DM1.cdsReporte.DataRequest(xSql);
      DM1.cdsReporte.Open;
      dbgprevio.DataSource := DM1.dsReporte;
      DM1.cdsReporte.First;
      monto := 0;
      cantidad := 0;
      While Not DM1.cdsReporte.Eof Do
      Begin
         monto := monto + DM1.cdsReporte.FieldByName('PVSLMONTO').AsFloat;
         cantidad := cantidad + 1;
         DM1.cdsReporte.Next;
      End;
      dbgprevio.ColumnByName('PVSNOMBRE').FooterValue := 'TOTAL OFICIO';
      dbgprevio.ColumnByName('PVSLDNIBEN').FooterValue := FormatFloat('###,###', cantidad);
      dbgprevio.ColumnByName('PVSLMONTO').FooterValue := FormatFloat('###,###.#0', monto);
   End;
   If dblcforpagoid.Text = '06' Then // Teleahorro
   Begin
      dbgprevio.Selected.Clear;
      dbgprevio.Selected.Add('PVSNOMBRE'#9'25'#9'Apellidos y~nombres'#9#9);
      dbgprevio.Selected.Add('PVSLMONTO'#9'11'#9'Importe~asignado'#9#9);
      dbgprevio.Selected.Add('PVSLNCTA'#9'10'#9'Número de~Cuenta'#9#9);
      dbgprevio.ApplySelected;
      //Inicio: SPP_201401_PRE
      // xSql := 'SELECT TRIM(B.APEPATCOB)||'' ''||TRIM(B.APEMATCOB)||'' ''||TRIM(B.NOMCOB) PVSNOMBRE, B.PVSLMONTO, B.PVSLNCTA'
      // Inicio: SPP_201403_PRE
      // xSql := 'SELECT A.ASOID, A.PVSEXPNRO, TRIM(B.APEPATCOB)||'' ''||TRIM(B.APEMATCOB)||'' ''||TRIM(B.NOMCOB) PVSNOMBRE, B.PVSLMONTO, B.PVSLNCTA'
// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
      xSql := 'SELECT A.ASOID, A.PVSEXPNRO, B.PVSNOMBRE, B.PVSLMONTO, B.PVSLNCTA, ''S'' MARCA '
      // Fin: SPP_201403_PRE
      + ' FROM PVS306 A, PVS307 B'
      + ' WHERE '+sBuscaFechas
      //+ ' WHERE TO_DATE(A.PVSLFECBE) >= ' + QuotedStr(dbdtpfecini.Text) + ' AND  TO_DATE(A.PVSLFECBE) <= ' + QuotedStr(dbdtpfecfin.Text)
      + ' AND A.PVSESTLIQ IN (''02'', ''05'', ''06'') AND A.PVSLBENNR = B.PVSLBENNR AND B.PVSLAGRID IN (''FPG'', ''RET'') AND NVL(B.FLGVOUCHER, ''X'') = ''N'''
      + ' AND B.FORPAGOID = ' + QuotedStr(dblcforpagoid.Text) + ' AND B.BANCOID = ' + QuotedStr(dblcbancoid.Text)
      + ' AND NVL(B.PVSLMONTO,0) > 0 AND B.PVSLNOFC IS NULL';
// Fin  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
      //Fin: SPP_201401_PRE
      DM1.cdsReporte.Close;
      DM1.cdsReporte.DataRequest(xSql);
      DM1.cdsReporte.Open;
      DM1.cdsReporte.First;
      monto := 0;
      cantidad := 0;
      While Not DM1.cdsReporte.Eof Do
      Begin
         monto := monto + DM1.cdsReporte.FieldByName('PVSLMONTO').AsFloat;
         cantidad := cantidad + 1;
         DM1.cdsReporte.Next;
      End;
      dbgprevio.ColumnByName('PVSNOMBRE').FooterValue := 'TOTAL OFICIO';
      dbgprevio.ColumnByName('PVSLMONTO').FooterValue := FormatFloat('###,###', cantidad);
      dbgprevio.ColumnByName('PVSLNCTA').FooterValue := FormatFloat('###,###.#0', monto);
   End;
   If dblcforpagoid.Text = '11' Then // Libretas de ahorros
   Begin
      dbgprevio.Selected.Clear;
      dbgprevio.Selected.Add('PVSNOMBRE'#9'25'#9'Apellidos y~nombres'#9#9);
      dbgprevio.Selected.Add('PVSLMONTO'#9'11'#9'Importe~asignado'#9#9);
      dbgprevio.Selected.Add('FECNACMEN'#9'10'#9'Fecha de~nacimiento'#9#9);
      dbgprevio.Selected.Add('APENOMTUT'#9'25'#9'Apellidos y nombre(s)~del tutor'#9#9);
      dbgprevio.Selected.Add('PVSLNCTA'#9'10'#9'Documento de~identidad'#9#9);
      dbgprevio.ApplySelected;
      //Inicio: SPP_201401_PRE
      // xSql := 'SELECT TRIM(B.APEPATCOB)||'' ''||TRIM(B.APEMATCOB)||'' ''||TRIM(B.NOMCOB) PVSNOMBRE, B.PVSLMONTO, B.FECNACMEN, B.APENOMTUT, B.PVSLNCTA, B.DOCIDETUT'
      // Inicio: SPP_201403_PRE
      // xSql := 'SELECT A.ASOID, A.PVSEXPNRO, TRIM(B.APEPATCOB)||'' ''||TRIM(B.APEMATCOB)||'' ''||TRIM(B.NOMCOB) PVSNOMBRE, B.PVSLMONTO, B.FECNACMEN, B.APENOMTUT, B.PVSLNCTA, B.DOCIDETUT'
// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
      xSql := 'SELECT A.ASOID, A.PVSEXPNRO, B.PVSNOMBRE, B.PVSLMONTO, B.FECNACMEN, B.APENOMTUT, B.PVSLNCTA, B.DOCIDETUT, ''S'' MARCA '
      // Fin: SPP_201403_PRE
      //Fin: SPP_201401_PRE
         + ' FROM PVS306 A, PVS307 B'
         + ' WHERE '+sBuscaFechas
         //+ ' WHERE TO_DATE(A.PVSLFECBE) >= ' + QuotedStr(dbdtpfecini.Text) + ' AND  TO_DATE(A.PVSLFECBE) <= ' + QuotedStr(dbdtpfecfin.Text)
         + ' AND A.PVSESTLIQ IN (''02'', ''05'', ''06'') AND A.PVSLBENNR = B.PVSLBENNR AND B.PVSLAGRID IN (''FPG'', ''RET'') AND NVL(B.FLGVOUCHER, ''X'') = ''N'''
         + ' AND B.FORPAGOID = ' + QuotedStr(dblcforpagoid.Text) + ' AND B.BANCOID = ' + QuotedStr(dblcbancoid.Text)
         + ' AND NVL(B.PVSLSALDO,0) > 0 AND B.PVSLNOFC IS NULL';
// Fin  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
      DM1.cdsReporte.Close;
      DM1.cdsReporte.DataRequest(xSql);
      DM1.cdsReporte.Open;
      DM1.cdsReporte.First;
      monto := 0;
      cantidad := 0;
      While Not DM1.cdsReporte.Eof Do
      Begin
         monto := monto + DM1.cdsReporte.FieldByName('PVSLMONTO').AsFloat;
         cantidad := cantidad + 1;
         DM1.cdsReporte.Next;
      End;
      dbgprevio.ColumnByName('PVSNOMBRE').FooterValue := 'TOTAL OFICIO';
      dbgprevio.ColumnByName('PVSLMONTO').FooterValue := FormatFloat('###,###', cantidad);
      dbgprevio.ColumnByName('FECNACMEN').FooterValue := FormatFloat('###,###.#0', monto);
   End;
   If dblcforpagoid.Text = '16' Then // Cheque de Gerencia
   Begin
      dbgprevio.Selected.Clear;
      dbgprevio.Selected.Add('PVSNOMBRE'#9'32'#9'Apellidos y~nombres'#9#9);
      dbgprevio.Selected.Add('PVSLDNIBEN'#9'8'#9'Documento~de identidad'#9#9);
      dbgprevio.Selected.Add('PVSLMONTO'#9'10'#9'Importe~asignado'#9#9);
      dbgprevio.Selected.Add('NUMCHEGER'#9'13'#9'Núm. cheque~de gerencia'#9#9);
      dbgprevio.Selected.Add('DNIRUC'#9'11'#9'Número del~código de recojo'#9#9);
      dbgprevio.ApplySelected;
      //Inicio: SPP_201401_PRE
      // xSql := 'SELECT TRIM(B.APEPATCOB)||'' ''||TRIM(B.APEMATCOB)||'' ''||TRIM(B.NOMCOB) PVSNOMBRE, B.PVSLDNIBEN, B.PVSLMONTO, C.AGENBCODES, D.DPTODES, B.NUMCHEGER , B.DNIRUC'
      // Inicio: SPP_201403_PRE
      // xSql := 'SELECT A.ASOID, A.PVSEXPNRO, TRIM(B.APEPATCOB)||'' ''||TRIM(B.APEMATCOB)||'' ''||TRIM(B.NOMCOB) PVSNOMBRE, B.PVSLDNIBEN, B.PVSLMONTO, C.AGENBCODES, D.DPTODES, B.NUMCHEGER , B.DNIRUC'
// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
      xSql := 'SELECT A.ASOID, A.PVSEXPNRO, B.PVSNOMBRE, B.PVSLDNIBEN, B.PVSLMONTO, C.AGENBCODES, D.DPTODES, B.NUMCHEGER , B.DNIRUC, ''S'' MARCA '
      // Fin: SPP_201403_PRE
      + ' FROM PVS306 A, PVS307 B, COB102 C, APO158 D'
      + ' WHERE '+sBuscaFechas
      //+ ' WHERE TO_DATE(A.PVSLFECBE) >= ' + QuotedStr(dbdtpfecini.Text) + ' AND  TO_DATE(A.PVSLFECBE) <= ' + QuotedStr(dbdtpfecfin.Text)
      + ' AND A.PVSESTLIQ IN (''02'', ''05'', ''06'') AND A.PVSLBENNR = B.PVSLBENNR AND B.PVSLAGRID IN (''FPG'', ''RET'') AND NVL(B.FLGVOUCHER, ''X'') = ''N'''
      + ' AND B.FORPAGOID = ' + QuotedStr(dblcforpagoid.Text) + ' AND B.BANCOID = ' + QuotedStr(dblcbancoid.Text)
      + ' AND NVL(B.PVSLMONTO,0) > 0 AND B.PVSLNOFC IS NULL AND B.AGENBCOID = C.AGENBCOID(+) AND C.DPTOID = D.DPTOID(+) ';
// Fin   HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
      //Fin: SPP_201401_PRE
      DM1.cdsReporte.Close;
      DM1.cdsReporte.DataRequest(xSql);
      DM1.cdsReporte.Open;
      dbgprevio.DataSource := DM1.dsReporte;
      DM1.cdsReporte.First;
      monto := 0;
      cantidad := 0;
      // Inicio: HPC_201705_PRE
      // Se controla que todos los registros cuenten DNIRUC antes de generar oficio
      xDNIRUC := 'S';
      While Not DM1.cdsReporte.Eof Do
      Begin
         If Trim(DM1.cdsReporte.FieldByName('PVSLDNIBEN').AsString) = '' Then  xDNIRUC := 'N';
         monto := monto + DM1.cdsReporte.FieldByName('PVSLMONTO').AsFloat;
         cantidad := cantidad + 1;
         DM1.cdsReporte.Next;
      End;
      // Fin: HPC_201705_PRE
      dbgprevio.ColumnByName('PVSNOMBRE').FooterValue := 'TOTAL OFICIO';
      dbgprevio.ColumnByName('PVSLDNIBEN').FooterValue := FormatFloat('###,###', cantidad);
      dbgprevio.ColumnByName('PVSLMONTO').FooterValue := FormatFloat('###,###.#0', monto);
   End;
   // Inicio: SPP_201301_PRE
   //If dblcforpagoid.Text = '18' Then // Deposito en cuenta
   If dblcforpagoid.Text = '19' Then // Deposito en cuenta
   // Fin: SPP_201301_PRE
   Begin
      dbgprevio.Selected.Clear;
      dbgprevio.Selected.Add('PVSNOMBRE'#9'32'#9'Apellidos y~nombres'#9#9);
      dbgprevio.Selected.Add('PVSLDNIBEN'#9'8'#9'Documento~de identidad'#9#9);
      dbgprevio.Selected.Add('PVSLMONTO'#9'10'#9'Importe~asignado'#9#9);
      dbgprevio.Selected.Add('PVSLNCTA'#9'11'#9'Número de~Cta.Teleahorro'#9#9);
      dbgprevio.ApplySelected;
      //Inicio: SPP_201401_PRE
      // xSql := 'SELECT TRIM(B.APEPATCOB)||'' ''||TRIM(B.APEMATCOB)||'' ''||TRIM(B.NOMCOB) PVSNOMBRE, B.PVSLDNIBEN, B.PVSLMONTO, B.PVSLNCTA'
      // Inicio: SPP_201403_PRE
      // xSql := 'SELECT A.ASOID, A.PVSEXPNRO, TRIM(B.APEPATCOB)||'' ''||TRIM(B.APEMATCOB)||'' ''||TRIM(B.NOMCOB) PVSNOMBRE, B.PVSLDNIBEN, B.PVSLMONTO, B.PVSLNCTA'
// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
      xSql := 'SELECT A.ASOID, A.PVSEXPNRO, B.PVSNOMBRE, B.PVSLDNIBEN, B.PVSLMONTO, B.PVSLNCTA, ''S'' MARCA '
      // Fin: SPP_201403_PRE
      //Fin: SPP_201401_PRE
            + '  FROM PVS306 A, PVS307 B'
            + ' WHERE '+sBuscaFechas
            //+ ' WHERE TO_DATE(A.PVSLFECBE) >= ' + QuotedStr(dbdtpfecini.Text)
            //+ '   AND TO_DATE(A.PVSLFECBE) <= ' + QuotedStr(dbdtpfecfin.Text)
            + '   AND A.PVSESTLIQ IN (''02'', ''05'', ''06'') '
            + '   AND A.PVSLBENNR = B.PVSLBENNR '
            + '   AND B.PVSLAGRID IN (''FPG'', ''RET'') '
            + '   AND NVL(B.FLGVOUCHER, ''X'') = ''N'''
            + '   AND B.FORPAGOID = ' + QuotedStr(dblcforpagoid.Text)
            + '   AND B.BANCOID = ' + QuotedStr(dblcbancoid.Text)
            + '   AND NVL(B.PVSLMONTO,0) > 0 '
            + '   AND B.PVSLNOFC IS NULL';
// Fin   HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
      DM1.cdsReporte.Close;
      DM1.cdsReporte.DataRequest(xSql);
      DM1.cdsReporte.Open;
      dbgprevio.DataSource := DM1.dsReporte;
      DM1.cdsReporte.First;
      monto := 0;
      cantidad := 0;
      While Not DM1.cdsReporte.Eof Do
      Begin
         monto := monto + DM1.cdsReporte.FieldByName('PVSLMONTO').AsFloat;
         cantidad := cantidad + 1;
         DM1.cdsReporte.Next;
      End;
      dbgprevio.ColumnByName('PVSNOMBRE').FooterValue := 'TOTAL OFICIO';
      dbgprevio.ColumnByName('PVSLDNIBEN').FooterValue := FormatFloat('###,###', cantidad);
      dbgprevio.ColumnByName('PVSLMONTO').FooterValue := FormatFloat('###,###.#0', monto);
   End;

   If DM1.cdsReporte.RecordCount > 0 Then
   Begin
      btnimppre.Enabled := True;
      btngenera.Enabled := True;
   End;
End;

Procedure TFnueofi.dblcbancoidChange(Sender: TObject);
Begin
   If Length(dblcbancoid.Text) = 2 Then
   Begin
      If DM1.cdsBanco.Locate('BANCOID', dblcbancoid.Text, []) Then
      Begin
         mebancodes.Text := DM1.cdsBanco.FieldByName('BANCONOM').AsString;
      End
      Else
      Begin
         MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
         dblcbancoid.Text := '';
         mebancodes.Text := '';
      End;
   End;
End;

Procedure TFnueofi.FormActivate(Sender: TObject);
Var
   xSql: String;
Begin
  // Inicio: SPP_201306_PRE
  rgtipomoneda.ItemIndex := 1;
  rgtipomoneda.Enabled := False;
  // Fin: SPP_201306_PRE

   If DM1.cdsReporte.Active = True Then DM1.cdsReporte.EmptyDataSet;

   xSql := 'SELECT TIPDESEID, TIPDESEDES, FLACOBPRE FROM CRE104 WHERE NVL(FLAVIGPRE,''X'') = ''S''';

   DM1.cdsFPago.Close;
   DM1.cdsFPago.DataRequest(xSql);
   DM1.cdsFPago.Open;
   btnimppre.Enabled := False;
   btngenera.Enabled := False;
End;

Procedure TFnueofi.dblcforpagoidChange(Sender: TObject);
Begin
   If Length(dblcforpagoid.Text) = 2 Then
   Begin
      If DM1.cdsFPago.Locate('TIPDESEID', dblcforpagoid.Text, []) Then
      Begin
         meforpagodes.Text := DM1.cdsFPago.FieldByName('TIPDESEDES').AsString;
      End
      Else
      Begin
         MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
         dblcforpagoid.Text := '';
         meforpagodes.Text := '';
      End;
   End;
   dblcbancoid.Text := '';
   mebancodes.Text := '';
End;

Procedure TFnueofi.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If Key = #13 Then
   Begin
      Key := #0;
      Perform(CM_DIALOGKEY, VK_TAB, 0);
   End;
End;

Procedure TFnueofi.btncerrarClick(Sender: TObject);
Begin
   Fnueofi.Close;
End;

Procedure TFnueofi.btnimppreClick(Sender: TObject);
Var
   xTitulo, xFecha: String;
Begin
   xTitulo := 'REPORTE PREVIO DE GENERACION DE OFICIO POR : ' + meforpagodes.Text;
   xFecha := 'BENEFICIOS OTORGADOS DEL ' + dbdtpfecini.Text + ' AL ' + dbdtpfecfin.Text;
   If dblcforpagoid.Text = '05' Then
   Begin
      ppltitulo01.Caption := xTitulo;
      pplfecha01.Caption := xFecha;
      pprGiros.Print;
      pprGiros.Stop;
   End;
   If dblcforpagoid.Text = '06' Then
   Begin
      ppltitulo02.Caption := xTitulo;
      pplfecha02.Caption := xFecha;
      pprahorros.Print;
      pprahorros.Stop;
   End;
   If dblcforpagoid.Text = '11' Then
   Begin
      ppltitulo03.Caption := xTitulo;
      pplfecha03.Caption := xFecha;
      pprlibretas.Print;
      pprlibretas.Stop;
   End;
   If dblcforpagoid.Text = '16' Then
   Begin
      ppLabel40.Caption := xTitulo;
      ppLabel41.Caption := xFecha;
      pprcheger.Print;
      pprcheger.Stop;
   End;

  // Inicio: SPP_201301_PRE
   //If dblcforpagoid.Text = '18' Then
   If dblcforpagoid.Text = '19' Then
  // Fin: SPP_201301_PRE
   Begin
      ppLabel54.Caption := xTitulo;
      ppLabel55.Caption := xFecha;
      pprDepCta.Print;
      pprDepCta.Stop;
   End;

End;

Procedure TFnueofi.btngeneraClick(Sender: TObject);
// Inicio: SPP_201305_PRE
Var xtipmon:String;
Var
   xtmp, xSql, xnumerooficio, xAno, xMes, xcueban, xapenomrep, xTipo, xEstado: String;
   monto: Double;
   xcorr, cantidad: Integer;

Begin
   // Inicio: SPP_201306_PRE
   If rgtipomoneda.ItemIndex = 0 Then xtipmon := 'D' Else xtipmon := 'S';
   // Fin: SPP_201306_PRE
   // Fin: SPP_201305_PRE
   If DM1.cdsReporte.RecordCount = 0 Then
   Begin
      MessageDlg(' No existen registros para generar oficio ', mtInformation, [mbOk], 0);
      Exit;
   End;
   If MessageDlg('¿ Seguro de generar oficio ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
      // Inicio: HPC_201705_PRE
      // Se añade al campo "NUEOFI" para que tambien se muestre el año
      // xSql := 'SELECT LPAD(NROFICIO+1,7,''0'') NUEOFI FROM CRE206 WHERE CREAREA = ''PRE'''
      xSql := 'SELECT CORREANO||LPAD(NROFICIO+1,7,''0'') NUEOFI FROM CRE206 WHERE CREAREA = ''PRE'''
      // Fin: HPC_201705_PRE
         + ' AND CORREANO = ' + QuotedStr(Copy(DateToStr(dbdtpfecini.date), 7, 4)) + ' AND TIPO = ''6''';
      DM1.cdsOfDes.Close;
      DM1.cdsOfDes.DataRequest(xSql);
      DM1.cdsOfDes.Open;
      xnumerooficio := DM1.cdsOfDes.FieldByName('NUEOFI').AsString;
      If xnumerooficio = '' Then
      Begin
         MessageDlg(' Error en la generación de numero de oficio ', mtInformation, [mbOk], 0);
         Exit;
      End;
      xSql := 'UPDATE CRE206 SET NROFICIO = LPAD(NROFICIO+1,7,''0'') WHERE CREAREA = ''PRE'''
         + ' AND CORREANO = ' + QuotedStr(Copy(DateToStr(dbdtpfecini.date), 7, 4)) + ' AND TIPO = ''6''';
      DM1.DCOM1.AppServer.EjecutaSql(xSql);

// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
      xSql := 'UPDATE PVS307 SET PVSLNOFC = ' + QuotedStr(xnumerooficio)
         + ', FECPAG = TO_CHAR(SYSDATE, ''DD/MM/YYYY'')'
         + ', USUPAG = ' + QuotedStr(DM1.wUsuario)
         + ' WHERE ROWID IN (SELECT B.ROWID FROM PVS306 A, PVS307 B '
         + ' WHERE '+sBuscaFechas
         //' WHERE TO_DATE(A.PVSLFECBE) >= ' + QuotedStr(dbdtpfecini.Text) + ' AND A.PVSLFECBE <= ' + QuotedStr(dbdtpfecfin.Text)
         + ' AND A.PVSESTLIQ IN (''02'',''05'', ''06'') AND A.PVSLBENNR = B.PVSLBENNR AND B.PVSLAGRID IN (''FPG'',''RET'')'
         + ' AND B.PVSLNOFC IS NULL '
         // Inicio: HPC_201705_PRE
         // Se controla en el Qry que no se muestran los pagos ya extornados
         + ' AND NVL(B.PVSLSALDO,0) > 0 AND B.BANCOID = ' + QuotedStr(dblcbancoid.Text) + ' AND B.FORPAGOID = ' + QuotedStr(dblcforpagoid.Text)
         + ' AND NVL(B.FLAEXT,''N'') = ''N'')';
         // Fin: HPC_201705_PRE
// Fin   HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
      DM1.DCOM1.AppServer.EjecutaSql(xSql);

// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
      xSql := 'SELECT B.PVSLSALDO FROM PVS306 A, PVS307 B'
         + ' WHERE '+sBuscaFechas
         //+ ' WHERE TO_DATE(A.PVSLFECBE) >= ' + QuotedStr(dbdtpfecini.Text) + ' AND  TO_DATE(A.PVSLFECBE) <= ' + QuotedStr(dbdtpfecfin.Text)
         + ' AND A.PVSESTLIQ IN (''02'', ''05'', ''06'') AND A.PVSLBENNR = B.PVSLBENNR AND B.PVSLAGRID IN (''FPG'', ''RET'') AND NVL(B.FLGVOUCHER, ''X'') = ''N'''
         + ' AND B.FORPAGOID = ' + QuotedStr(dblcforpagoid.Text) + ' AND B.BANCOID = ' + QuotedStr(dblcbancoid.Text)
         + ' AND NVL(B.PVSLSALDO,0) > 0 AND B.PVSLNOFC = ' + QuotedStr(xnumerooficio);
// Fin   HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      DM1.cdsQry.First;
      monto := 0;
      // Inicio: SPP_201301_PRE
      cantidad := 0;
      While Not DM1.cdsQry.Eof Do
      Begin
         monto := monto + DM1.cdsQry.FieldByname('PVSLSALDO').AsFloat;
         cantidad := cantidad  + 1;
         DM1.cdsQry.Next;
      End;
      // Fin: SPP_201301_PRE
      xAno := Copy(dbdtpfecini.text, 7, 4);
      xMes := Copy(dbdtpfecini.text, 4, 2);
      If dblcforpagoid.Text = '05' Then xTipo := 'SG';
      If dblcforpagoid.Text = '06' Then xTipo := 'SA';
      If dblcforpagoid.Text = '11' Then xTipo := 'SA';
      xSql := 'SELECT REPNOM, CCBCOID FROM PVS108 WHERE BANCOID = ' + QuotedStr(dblcbancoid.Text) + ' AND FLGCAR = ' + QuotedStr(xTipo);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      xEstado := 'INICIAL';
      xcueban := DM1.cdsQry.FieldByName('CCBCOID').AsString;
      xapenomrep := DM1.cdsQry.FieldByName('REPNOM').AsString;
      xSql := 'INSERT INTO PVS203 (NOFID, CREANO, CREMES, FECINIC, FECFIN, BANCOID, TIPDESEID,'
      // Inicio: SPP_201301_PRE
      // + ' MONTOTOT, MONTDES, FREG, HREG, CREUSER, MODOFIC, TMONID, CREMOD, CIAID, CCBCOVOUCH, OFIESTADO, CCBCOID, APENOMREPBAN)'
      + ' MONTOTOT, NUMREGOFI, MONTDES, FREG, HREG, CREUSER, MODOFIC, TMONID, CREMOD, CIAID, CCBCOVOUCH, OFIESTADO, CCBCOID, APENOMREPBAN)'
      // Inicio: SPP_201303_PRE
      + ' VALUES (' + QuotedStr(xnumerooficio)+',' + QuotedStr(xAno) + ',' + QuotedStr(xMes) + ',' + QuotedStr(dbdtpfecini.Text)
      + ',' + QuotedStr(dbdtpfecfin.Text)+','+QuotedStr(dblcbancoid.Text)+ ','+ QuotedStr(dblcforpagoid.Text)
      // Fin: SPP_201303_PRE
      + ',' + FloatToStr(monto) + ',' + FloatToStr(cantidad) + ',' + QuotedStr(Trim(DM1.NumtoStr(monto))) + ', TO_DATE(SYSDATE), SYSDATE,' + QuotedStr(DM1.wUsuario)
      // Inicio: SPP_201305_PRE
      //   + ', ''PRE'', ''N'', ''PRE'', ''02'', ''06'', ' + QuotedStr(xEstado) + ',' + QuotedStr(xcueban) + ',' + QuotedStr(xapenomrep) + ')';
      + ', ''PRE'', '+QuotedStr(xtipmon)+', ''PRE'', ''02'', ''06'', ' + QuotedStr(xEstado) + ',' + QuotedStr(xcueban) + ',' + QuotedStr(xapenomrep) + ')';
      // Fin: SPP_201305_PRE
      // Fin: SPP_201301_PRE
      DM1.DCOM1.AppServer.EjecutaSql(xSql);
      // Inicio: HPC_201705_PRE
      // DM1.numerooficio := xAno + xnumerooficio;
      DM1.numerooficio := xnumerooficio;
      // Fin: HPC_201705_PRE
      // Insertando número de Correlativo de beneficio y RUC de recojo
      If dblcforpagoid.Text = '16' Then
      Begin
         // Inicio: HPC_201705_PRE
         // Se muestra error si existe registro sin DNI.
         If xDNIRUC <> 'S' Then
         Begin
          MessageDlg('Existe uno o mas registros sin número de DNI. Verifique y corrija antes de proceder.', mtInformation, [mbOk], 0);
          Exit;
         End;
         // xSql := 'SELECT * FROM PVS307 WHERE SUBSTR(PVSLBENNR,1,4)||PVSLNOFC = ' + QuotedStr(DM1.numerooficio)+' ORDER BY PVSLBENNR';
         xSql := 'SELECT ciaid, pvslbennr, pvsltipbe, pvslagrid, pvslsec, pvslconce, pvslmonto, usuario, freg, hreg, pvslnvou, credid, bancoid, forpagoid, pvslsaldo, pvsnombre,'
         +' pvspagado, flgvoucher, pvslnofc, agenbcoid, nrocheque, cntflag, pvslncta, pvsldniben, pordes, creamort, creinteres, creflat, intncob, tipdes, apenomtut, docidetut,'
         +' fecnacmen, fecpag, usupag, codrelcob, nomcob, apematcob, apepatcob, nomtut, apemattut, apepattut, salcreantliq, numcheger, dniruc, usuimpcheger, fechorimpcheger, codotrdocide,'
         +' numotrdocide, moncobdesgrav, dirdomcob, codzipcob, telfijcob, telmovcob, apecascob, fechoremail, fechormovil, emailcob, flaext, usuext, fecext, ofiext, flarep, usurep, fecrep,'
         +' codmotextdes, desotrmotextdes, fecopeextdes, numopeextdes FROM PVS307 WHERE PVSLNOFC = ' + QuotedStr(DM1.numerooficio)+' ORDER BY PVSLBENNR';
         // Fin: HPC_201705_PRE
         DM1.cdsDetLiq.Close;
         DM1.cdsDetLiq.DataRequest(xSql);
         DM1.cdsDetLiq.Open;
         xtmp := DM1.cdsDetLiq.FieldByName('PVSLBENNR').AsString;
         xcorr := 0;
         While Not DM1.cdsDetLiq.Eof Do
         Begin
            If xtmp = DM1.cdsDetLiq.FieldByName('PVSLBENNR').AsString Then
            Begin
               xcorr := xcorr + 1;
            End
            Else
            Begin
               xcorr := 1;
            End;
            xtmp := DM1.cdsDetLiq.FieldByName('PVSLBENNR').AsString;
            DM1.cdsDetLiq.Edit;
            DM1.cdsDetLiq.FieldByName('NUMCHEGER').AsString := Copy(DM1.cdsDetLiq.FieldByName('PVSLBENNR').AsString, 3, 2) + Copy(DM1.cdsDetLiq.FieldByName('PVSLBENNR').AsString, 6, 6) + DM1.StrZero(IntToStr(xcorr), 2);
            DM1.cdsDetLiq.FieldByName('DNIRUC').AsString := DM1.ObtenerDigitoChequeoNuevoRUC('10', DM1.cdsDetLiq.FieldByName('PVSLDNIBEN').AsString);
            DM1.cdsDetLiq.ApplyUpdates(0);
            DM1.cdsDetLiq.Next;
         End;
      End;
      //Inicio: SPP_201401_PRE
      DM1.cdsReporte.First;
      While Not DM1.cdsReporte.Eof Do
      Begin
         // Inicio: HPC_201702_PRE
         // CON GENERACION DE DESEMBOLSO
         // 04 DESEMBOLSADO 02 CON GENERACION DE DESEMBOLSO
         xSql := 'Begin SP_PVS_SEG_EXP('+QuotedStr(DM1.cdsReporte.FieldByName('ASOID').AsString)+', '+QuotedStr(DM1.cdsReporte.FieldByName('PVSEXPNRO').AsString)
         // +', ''03'', ''09'', TO_DATE(SYSDATE,''DD/MM/YYYY''), '+QuotedStr(DM1.wUsuario)+', NULL); End;';
         +', ''04'', ''02'', TO_DATE(SYSDATE,''DD/MM/YYYY''), '+QuotedStr(DM1.wUsuario)+','+QuotedStr('DESEMBOLSADO A:'+Trim(DM1.cdsReporte.FieldByName('PVSNOMBRE').AsString))+'); End;';
         // Fin: HPC_201702_PRE
         DM1.DCOM1.AppServer.EjecutaSQL(xSql);
         DM1.cdsReporte.Next;
      End;
      //Fin: SPP_201401_PRE
      MessageDlg('Generación de oficio Ok', mtInformation, [mbOk], 0);
      Fnueofi.Close;
   End;
End;

Procedure TFnueofi.dblcforpagoidExit(Sender: TObject);
Var
   xSql: String;
Begin
// Inicio: SPP_201305_PRE
   If dblcforpagoid.Text = '11' Then
      rgtipomoneda.Enabled := True
   Else
   Begin
      rgtipomoneda.ItemIndex := 1;
      rgtipomoneda.Enabled := False;
   End;
// Fin: SPP_201305_PRE

   If DM1.cdsFPago.FieldByName('FLACOBPRE').AsString = 'B' Then
      xSql := 'SELECT BANCOID, BANCONOM FROM TGE105 WHERE FLAVIGPRE = ''S'' AND CLAUXID = ''B'''
   Else
      xSql := 'SELECT BANCOID, BANCONOM FROM TGE105 WHERE FLAVIGPRE = ''S'' AND CLAUXID = ''C''';
   DM1.cdsBanco.Close;
   DM1.cdsBanco.DataRequest(xSql);
   DM1.cdsBanco.Open;
  
End;

End.

