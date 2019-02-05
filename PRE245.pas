// Inicio Uso Estándares: 01/08/2011
// Unidad               : PRE245
// Formulario           : FNueCont
// Fecha de Creación    : 16/07/2014
// Autor                : Area de desarrollo de sistemas.
// Objetivo             : Contabilización
//
// Actualizaciones
// HPP_201004_PRE - SAR-2009-0984
// HPC_201207_PRE : Se añade la cuenta contable para el caso de cuotas cobrada por degravamen
// DPP_201207_PRE : Se realiza el pase a producción a partir del HPC_201207.
// HPC_201210_PRE : MEMO 348-2012-DM-EPS DAF-2012000464-1-PRE // Visualizar periodos ya contabilizados
// SPP_201301_PRE : Se realiza el pase a producción de acuerdo al HPC_201210_PRE
// HPC_201302_PRE : Se cambia el Flag de Contabilización en las tablas de previsión Esta "I", Se Cambia por "S"
// SPP_201303_PRE : El pase a producción se realiza a partir del HPC_201302_PRE
// HPC_201307_PRE : Se añade nuevo logo institucional
// SPP_201401_PRE : Se realiza el pase a producción a partir del pase HPC_201307_PRE
// SPP_201402_PRE : Se modifica la cuenta 4860001 FONDO DE DESGRAVAMEN de acuero al HPC_201401_PRE
// HPC_201402_PRE : Se actualiza los campos de centro de costo según requerimiento si necesita o no.
//                  Se valida fecha inicial de la contabilización. No debe existir fechas anteriores sin contabilizar a la fecha inicial.
// SPP_201403_PRE : Se realiza el pase a producción a partir del pase HPC_201402_PRE.
// HPC_201504_PRE : Descuentos por aplicaciones de CCI
// HPC_201508_PRE : Se modifica la parte de la contabilización que calcula los montos de la liquidación
//                  Se condiciona para que no jale el total de la cuenta individual, ya que es un dato solo para mostrar.
// HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
// HPC_201802_PRE : Se añade las liquidacion por origen de oficio 
// HPC_201805_PRE : Se añade contabilizacion de reliquidaciones de beneficios
// HPC_201809_PRE : Se modifica la contabilización. Parte de la liquidacion  por oficio


Unit PRE245;

Interface

Uses
  Windows, Controls, Grids, Wwdbigrd, Wwdbgrid, StdCtrls,Forms,SysUtils,
  Dialogs,wwdbdatetimepicker, Classes, Buttons, db, Graphics, ppDB,
  ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppBands,
  ppCache, ppCtrls, ppVar, ppPrnabl, ppParameter, ppModule, daDataModule,
  ppEndUsr, ExtCtrls, jpeg; // SPP_201401_PRE
Type
  TFNueCont = class(TForm)
    GroupBox1: TGroupBox;
    dbdtpinicio: TwwDBDateTimePicker;
    dbdtpfinal: TwwDBDateTimePicker;
    btnPrevio: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    dbgPreCont: TwwDBGrid;
    btncontabiliza: TBitBtn;
    BitBtn1: TBitBtn;
    btnresumen: TBitBtn;
    btndetallado: TBitBtn;
    pprresumen: TppReport;
    ppbdepresumen: TppBDEPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
//Inicio: SPP_201401_PRE
    // ppLabel18: TppLabel; 
    // ppLabel19: TppLabel; 
//Fin: SPP_201401_PRE
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppltitulo0101: TppLabel;
    ppltitulo0102: TppLabel;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppLabel5: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppLine1: TppLine;
    ppLine2: TppLine;
    pplimppor: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    pprdetalle: TppReport;
    ppbdepdetalle: TppBDEPipeline;
    ppParameterList1: TppParameterList;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppLabel24: TppLabel;
    ppShape10: TppShape;
    ppLabel25: TppLabel;
    ppShape11: TppShape;
    ppShape12: TppShape;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppdbFecha: TppDBText;
    ppLabel26: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
//Inicio: SPP_201401_PRE
    // ppLabel27: TppLabel; 
    // ppLabel28: TppLabel; 
//Fin: SPP_201401_PRE
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    ppSystemVariable9: TppSystemVariable;
    ppltitulo02: TppLabel;
    pplimppor02: TppLabel;
    ppShape6: TppShape;
    ppShape9: TppShape;
    ppShape15: TppShape;
    ppShape16: TppShape;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppShape17: TppShape;
    ppLabel10: TppLabel;
    ppLine3: TppLine;
    daDataModule1: TdaDataModule;
    ppParameterList2: TppParameterList;
 // Inicio: SPP_201301_PRE
    chkConAnt: TCheckBox;
    //Inicio: SPP_201401_PRE
    ppImage1: TppImage;
    ppImage2: TppImage;
    // Inicio: SPP_201403_PRE
    pnlNoContabilizado: TPanel;
    StaticText1: TStaticText;
    btnNoContabilizado: TBitBtn;
    dbgFechaNoContabilizada: TwwDBGrid;
    // Fin: SPP_201403_PRE
    //Fin: SPP_201401_PRE
 // Fin: SPP_201301_PRE
    procedure FormActivate(Sender: TObject);
    procedure dbgPreContCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure btnPrevioClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btncontabilizaClick(Sender: TObject);
    procedure btnresumenClick(Sender: TObject);
    procedure btndetalladoClick(Sender: TObject);
 // Inicio: SPP_201301_PRE
    procedure chkConAntClick(Sender: TObject);
    procedure btnNoContabilizadoClick(Sender: TObject);  // SPP_201403_PRE
 // Fin: SPP_201301_PRE
  private
    { Private declarations }
    function centrodecosto(xpvslbennr:String):String;
    function describecuenta(cnttipcredes:String):String;
    procedure tipodebeneficio(xpvslbennr:String);

  public
    { Public declarations }
  end;

var
  FNueCont: TFNueCont;

implementation

uses PREDM;

{$R *.dfm}

Function TFNueCont.centrodecosto(xpvslbennr: String): String;
Var xSql: String;
begin
  // Hallando el centro de costo
  xSql := 'SELECT C.CCOSID FROM PVS306 A, APO201 B, APO101 C'
  +' WHERE  A.PVSLBENNR = '+QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)
  +' AND A.ASOID = B.ASOID AND B.USEID = C.USEID AND  B.UPAGOID = C.UPAGOID AND B.UPROID = C.UPROID';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  If DM1.cdsQry.RecordCount = 0 Then
  Begin
    MessageDlg('Existe un error en la tabla de ugel del asociado (centro de costo)', mtCustom, [mbOk], 0);
    Exit;
  End;
  Result := DM1.cdsQry.FieldByName('CCOSID').AsString;
  Exit;
End;

procedure TFNueCont.tipodebeneficio(xpvslbennr: String);
Var xSql:String;
begin
  xSql := 'SELECT B.CUENTAID, B.TB, B.TIPBENEF, B.BENEFDES, B.BENEFABR FROM PVS306 A, TGE186 B WHERE A.PVSLBENNR = '+QuotedStr(xpvslbennr)
  +' AND A.PVSLTIPBE = B.TIPBENEF';
  DM1.cdsTipBenef.Close;
  DM1.cdsTipBenef.DataRequest(xSql);
  DM1.cdsTipBenef.Open;
  If DM1.cdsQry.RecordCount = 0 Then
  Begin
    MessageDlg('existe un error en la tabla de tipo de beneficios', mtCustom, [mbOk], 0);
    Exit;
  End;
end;


Procedure TFNueCont.FormActivate(Sender: TObject);
Begin
  btncontabiliza.Enabled := False;
 // Inicio: SPP_201301_PRE
  btnresumen.Enabled     := False;
  btndetallado.Enabled   := False;
 // Fin: SPP_201301_PRE
  DM1.cdsTDiario.Close;
  dbgPreCont.Selected.Clear;
  dbgPreCont.Selected.Add('PVSLFECBE'#9'10'#9'Fecha de la~Liquidación'#9#9);
  dbgPreCont.Selected.Add('PVSLBENNR'#9'11'#9'Número de~Liquidación'#9#9);
// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
  dbgPreCont.Selected.Add('DEBE'#9'11'#9'Cuenta del~Debe'#9#9);
  dbgPreCont.Selected.Add('HABER'#9'11'#9'Cuenta del~Haber'#9#9);
  dbgPreCont.Selected.Add('DIF'#9'11'#9'Errores en~Liquidación'#9#9);
// Fin    HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
  dbgPreCont.ApplySelected;
  pnlNoContabilizado.Visible := False;  // SPP_201403_PRE  
End;

Procedure TFNueCont.dbgPreContCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
Begin
 If DM1.cdsTDiario.FieldByName('DIF').AsFloat <> 0 Then
 Begin
   AFont.Color := clRed;
 End;
End;

Procedure TFNueCont.btnPrevioClick(Sender: TObject);
Var xfecpag, cnttipcredes, xSql, xfecini, xfecfin, xCCOSID, xCUENTAID, xCtaDes, cntnodoc, cntglosa, grucomc,
    flgliq, flgpag, xnumofi, xforpag :String;
    debe, haber, dif, grucom, xmonhab : Double;
Begin
//Inicio: SPP_201402_PRE
  DM1.cdsTDiario.Close; 
//Fin: SPP_201402_PRE

  btncontabiliza.Enabled := False; // SPP_201403_PRE

  If dbdtpinicio.Text = '' Then
  Begin
    MessageDlg('Ingrese la fecha inicial del proceso', mtCustom, [mbOk], 0);
    dbdtpinicio.SetFocus;
    Exit;
  End;
  If dbdtpfinal.Text = '' Then
  Begin
    MessageDlg('Ingrese la fecha final del proceso', mtCustom, [mbOk], 0);
    dbdtpfinal.SetFocus;
    Exit;
  End;
  If dbdtpinicio.Date > dbdtpfinal.Date Then
  Begin
    MessageDlg('La fecha incial es mayor que la fecha final', mtCustom, [mbOk], 0);
    dbdtpinicio.SetFocus;
    Exit;
  End;
  // Inicio: SPP_201403_PRE
  // Se valida que no existan fechas sin contabilizar anterior a la Fecha de Incio.
  If Not chkConAnt.Checked Then
  Begin
     xSql := 'SELECT PVSLFECBE FROM PVS306 WHERE CNTFLAG IS NULL AND PVSESTLIQ NOT IN (''04'',''13'') AND PVSLFECBE < '+QuotedStr(dbdtpinicio.Text)
     +' Group By PVSLFECBE Order By PVSLFECBE';
     DM1.cdsQry.Close;
     DM1.cdsQry.DataRequest(xSql);
     DM1.cdsQry.Open;
     If DM1.cdsQry.RecordCount > 0 Then
     Begin
        dbgFechaNoContabilizada.Selected.Clear;
        dbgFechaNoContabilizada.Selected.Add('PVSLFECBE'#9'20'#9'Fechas no Contabilizadas'#9#9);
        dbgFechaNoContabilizada.ApplySelected;
        GroupBox1.Enabled := False;
        pnlNoContabilizado.Visible := True;
        Exit;
     End;
  End;
  // Fin: SPP_201403_PRE

  // Inicio: SPP_201301_PRE
  Screen.Cursor := crHourGlass;
  If chkConAnt.Checked Then
  Begin
// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
     xSql := 'SELECT COUNT(CIAID) CUENTA FROM CNT301 WHERE CIAID = ''02'' AND TDIARID = ''27'' AND (CNTFEMIS >= '+QuotedStr(dbdtpinicio.Text)+ ' AND CNTFEMIS <= '+QuotedStr(dbdtpfinal.Text)+') and CNTLOTE=''PRE''';
// Fin  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
     DM1.cdsReporte.Close;
     DM1.cdsReporte.DataRequest(xSql);
     DM1.cdsReporte.Open;
     If DM1.cdsReporte.FieldByName('CUENTA').AsInteger  = 0 Then
     Begin
        MessageDlg('No existe información contable para estas fechas', mtCustom, [mbOk], 0);
        dbdtpinicio.SetFocus;
        Screen.Cursor := crDefault;
        Exit;
     End;
// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
     xSql := 'SELECT A.CNTFCOMP PVSLFECBE, A.CNTGLOSA PVSLBENNR, SUM(NVL(B.CNTDEBEMN,0)) DEBE, SUM(NVL(B.CNTHABEMN,0)) HABER,  SUM(NVL(B.CNTDEBEMN,0)-NVL(B.CNTHABEMN,0)) DIF'
     +' FROM CNT300 A, CNT301 B WHERE A.CIAID = ''02'' AND A.TDIARID = ''27'' AND (A.CNTFCOMP >= '+QuotedStr(dbdtpinicio.Text)+' AND A.CNTFCOMP <= '+QuotedStr(dbdtpfinal.Text)+') and A.CNTLOTE=''PRE'''
     +' AND A.CNTCOMPROB = B.CNTCOMPROB AND B.CIAID = ''02'' AND B.TDIARID = ''27'' AND (B.CNTFEMIS >= '+QuotedStr(dbdtpinicio.Text)+' AND B.CNTFEMIS <= '+QuotedStr(dbdtpfinal.Text)+')'
     +' GROUP BY a.CNTFCOMP, A.CNTGLOSA';
// Fin  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
     DM1.cdsTDiario.Close;
     DM1.cdsTDiario.DataRequest(xSql);
     DM1.cdsTDiario.Open;
     TNumericField(DM1.cdsTDiario.FieldByName('DEBE')).DisplayFormat := '###,###,##0.00';
     TNumericField(DM1.cdsTDiario.FieldByName('HABER')).DisplayFormat := '###,###,##0.00';
     TNumericField(DM1.cdsTDiario.FieldByName('DIF')).DisplayFormat := '###,###,##0.00';
     DM1.cdsTDiario.First;
     debe  := 0;
     haber := 0;
     dif   := 0;
     While Not DM1.cdsTDiario.Eof Do
     Begin
        debe  := debe + DM1.cdsTDiario.FieldByName('DEBE').AsFloat;
        haber := haber+ DM1.cdsTDiario.FieldByName('HABER').AsFloat;
        dif   := dif  + DM1.cdsTDiario.FieldByName('DIF').AsFloat;
        DM1.cdsTDiario.Next;
     End;
     DM1.cdsTDiario.First;
     dbgPreCont.ColumnByName('PVSLBENNR').FooterValue := 'TOTALES S/.';
     dbgPreCont.ColumnByName('DEBE').FooterValue := FormatFloat('###,###.#0', debe);
     dbgPreCont.ColumnByName('HABER').FooterValue := FormatFloat('###,###.#0', haber);
     dbgPreCont.ColumnByName('DIF').FooterValue := FormatFloat('###,###.#0', dif);
     btnresumen.Enabled   := True;
     btndetallado.Enabled := True;
     Screen.Cursor := crDefault;
     Exit;
  End;
  // Fin: SPP_201301_PRE

  xSql := 'DELETE FROM PVS_DET_CON';
  DM1.DCOM1.AppServer.EjecutaSql(xSql);
  xfecini := Copy(dbdtpinicio.Text,7,4)+Copy(dbdtpinicio.Text,4,2)+Copy(dbdtpinicio.Text,1,2);
  xfecfin := Copy(dbdtpfinal.Text,7,4)+Copy(dbdtpfinal.Text,4,2)+Copy(dbdtpfinal.Text,1,2);
  flgpag := 'N';
  flgliq := 'N';
  // Verificando si existe información para contabilizar
  xSql := 'SELECT COUNT(*) CUENTA FROM PVS306 WHERE TO_CHAR(PVSLFECBE, ''YYYYMMDD'') >= '+QuotedStr(xfecini)+' AND  TO_CHAR(PVSLFECBE, ''YYYYMMDD'') <= '+QuotedStr(xfecfin)
  +' AND PVSESTLIQ IN (''02'', ''05'', ''06'') AND CNTFLAG IS NULL';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  //Inicio: SPP_201402_PRE
  // If DM1.cdsQry.RecordCount = 0 Then flgliq := 'S';
  If DM1.cdsQry.FieldByName('CUENTA').AsInteger = 0 Then flgliq := 'S';
  // xSql := 'SELECT B.* FROM PVS306 A, PVS307 B WHERE TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') >= '+QuotedStr(xfecini)+' AND TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') <= '+QuotedStr(xfecfin)
  xSql := 'SELECT B.* FROM PVS306 A, PVS307 B WHERE TO_CHAR(B.FECPAG, ''YYYYMMDD'') >= '+QuotedStr(xfecini)+' AND TO_CHAR(B.FECPAG, ''YYYYMMDD'') <= '+QuotedStr(xfecfin)
  //Fin: SPP_201402_PRE
  +' AND A.PVSESTLIQ IN (''02'', ''05'', ''06'') AND A.PVSLBENNR = B.PVSLBENNR AND PVSLAGRID IN (''FPG'', ''RET'')'
  +' AND FLGVOUCHER = ''N'' AND B.CNTFLAG IS NULL AND (B.NROCHEQUE IS NOT NULL OR B.PVSLNOFC IS NOT NULL)';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  If DM1.cdsQry.RecordCount = 0 Then flgpag := 'S';
  If (flgpag = 'S') And (flgliq = 'S') Then
  Begin
    dbgPreCont.Refresh;
    MessageDlg('No existe información para contabilizar', mtCustom, [mbOk], 0);
//Inicio: SPP_201402_PRE
    Screen.Cursor := crDefault; 
//Fin: SPP_201402_PRE
    btnresumen.Enabled     := False;
    btndetallado.Enabled   := False;
    btncontabiliza.Enabled := False;
    Exit;
  End;
  Screen.Cursor := crHourGlass;
  // Inicio: HPC_201802_PRE
  // Beneficios por pagar docentes (Liq. Oficio)
  // ********************************************\\
  // Beneficios por pagar docentes (Liq. Oficio) \\
  // ********************************************\\
  // Inicio: HPC_201809_PRE
  // Se remplaza campo. Existe un error al momento de asignar valor contable
  //  xSql := 'SELECT A.CIAID, A.PVSLBENNR, A.PVSLTIPBE, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'') PVSLFECBE, NVL(A.MONLIQBEN,0) MONTO'
      xSql := 'SELECT A.CIAID, A.PVSLBENNR, A.PVSLTIPBE, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'') PVSLFECBE, NVL(A.MONPAG,0) MONTO'
  // Inicio: HPC_201809_PRE
  +' FROM PVS306 A'
  +' WHERE TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') >= '+QuotedStr(xfecini)+' AND  TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') <= '+QuotedStr(xfecfin)
  +' AND A.PVSESTLIQ IN (''02'', ''05'', ''06'') AND A.CNTFLAG IS NULL'
  +' AND A.FORSOLBEN = ''O'' AND A.FLADES IS NULL';
  DM1.cdsQry2.Close;
  DM1.cdsQry2.DataRequest(xSql);
  DM1.cdsQry2.Open;
  DM1.cdsQry2.First;
  While Not DM1.cdsQry2.Eof Do
  Begin
     xCCOSID := centrodecosto(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString);
     tipodebeneficio(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString);
     cntnodoc := Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,7,4)+Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,4,2)+Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,1,2);
     cntglosa := 'LIQ:'+DM1.cdsQry2.FieldByName('PVSLBENNR').AsString+' '+DM1.cdsQry2.FieldByName('PVSLFECBE').AsString;
     xCUENTAID := '4691211';
     cnttipcredes := describecuenta(xCUENTAID);
     xSql := 'INSERT INTO PVS_DET_CON(CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE,'
     +' BENEFDES, CCOSID, CUENTAID, TIPCREDES, DEBE, HABER, CNTNODOC, CNTGLOSA)'
     +' VALUES (''02'''
     +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString)
     +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)
     +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLTIPBE').AsString)
     +', NULL'
     +','+QuotedStr(xCCOSID)
     +','+QuotedStr(xCUENTAID)
     +','+QuotedStr(cnttipcredes)
     +', 0.00'
     +','+DM1.cdsQry2.FieldByName('MONTO').AsString
     +','+QuotedStr(cntnodoc)
     +','+QuotedStr(copy(cntglosa,1,40))
     +' )';
    DM1.DCOM1.AppServer.EjecutaSql(xSql);
    DM1.cdsQry2.Next;
  End;
  // Fin: HPC_201802_PRE

  // ***********************************\\
  // Liquidaciones de beneficios retiro \\
  // ***********************************\\
  xSql := 'SELECT B.CIAID, B.PVSLBENNR, B.PVSLTIPBE, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'') PVSLFECBE,  SUM(NVL(B.PVSLMONTO,0)) MONTO'
  +' FROM PVS306 A, PVS307 B'
  +' WHERE TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') >= '+QuotedStr(xfecini)+' AND  TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') <= '+QuotedStr(xfecfin)
  // Inicio: HPC_201508_PRE
  // +' AND A.PVSLTIPBE = ''01'' AND A.PVSESTLIQ IN (''02'', ''05'', ''06'') AND A.CNTFLAG IS NULL AND A.PVSLBENNR = B.PVSLBENNR AND PVSLAGRID = ''DET'' AND TIPDES IS NOT NULL'
// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
  //+' AND A.PVSLTIPBE = ''01'' AND A.PVSESTLIQ IN (''02'', ''05'', ''06'') AND A.CNTFLAG IS NULL AND A.PVSLBENNR = B.PVSLBENNR AND PVSLAGRID = ''DET'' AND TIPDES <> ''TC'' AND TIPDES IS NOT NULL'
  +' AND A.PVSLTIPBE = ''999'' AND A.PVSESTLIQ IN (''02'', ''05'', ''06'') AND A.CNTFLAG IS NULL AND A.PVSLBENNR = B.PVSLBENNR AND PVSLAGRID = ''DET'' AND TIPDES <> ''TC'' AND TIPDES IS NOT NULL'
// Fin    HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
  // Fin: HPC_201508_PRE
  +' GROUP BY B.CIAID, B.PVSLBENNR, B.PVSLTIPBE, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'')';
  DM1.cdsQry2.Close;
  DM1.cdsQry2.DataRequest(xSql);
  DM1.cdsQry2.Open;
  DM1.cdsQry2.First;
  While Not DM1.cdsQry2.Eof Do
  Begin
    xCCOSID := centrodecosto(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString);
    tipodebeneficio(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString);
    cntnodoc := Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,7,4)+Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,4,2)+Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,1,2);
    cntglosa := 'LIQ:'+DM1.cdsQry2.FieldByName('PVSLBENNR').AsString+' '+DM1.cdsQry2.FieldByName('PVSLFECBE').AsString;
    xCUENTAID := DM1.cdsTipBenef.FieldByName('CUENTAID').AsString;
    cnttipcredes := describecuenta(xCUENTAID);
    xSql := 'INSERT INTO PVS_DET_CON(CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE,'
    +' BENEFDES, CCOSID, CUENTAID, TIPCREDES, DEBE, HABER, CNTNODOC, CNTGLOSA)'
    +' VALUES (''02'''
    +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString)
    +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)
    +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLTIPBE').AsString)
    +', NULL'
    +','+QuotedStr(xCCOSID)
    +','+QuotedStr(xCUENTAID)
    +','+QuotedStr(cnttipcredes)
    +','+DM1.cdsQry2.FieldByName('MONTO').AsString
    +', 0.00'
    +','+QuotedStr(cntnodoc)
    +','+QuotedStr(copy(cntglosa,1,40))
    +' )';
    DM1.DCOM1.AppServer.EjecutaSql(xSql);
    DM1.cdsQry2.Next;
  End;
  // ***************************************************************** \\
  // Liquidaciones de beneficios invalidez, fallecimiento menor a 1996 \\
  // ***************************************************************** \\
  xSql := 'SELECT  B.TIPDES, C.CUENTAID, B.CIAID, B.PVSLBENNR, B.PVSLTIPBE, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'') PVSLFECBE,  SUM(NVL(B.PVSLMONTO,0)) MONTO'
  +' FROM PVS306 A, PVS307 B, TGE186 C'
  +' WHERE TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') >= '+QuotedStr(xfecini)+' AND  TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') <= '+QuotedStr(xfecfin)
  // Inicio: HPC_201508_PRE
  // +' AND A.PVSESTLIQ IN (''02'', ''05'', ''06'') AND A.CNTFLAG IS NULL AND A.PVSLBENNR = B.PVSLBENNR AND PVSLAGRID = ''DET'''
  // +' AND A.PVSLTIPBE = C.TIPBENEF AND B.TIPDES = C.TB'
  +' AND A.PVSESTLIQ IN (''02'', ''05'', ''06'') AND A.CNTFLAG IS NULL AND A.PVSLBENNR = B.PVSLBENNR AND B.PVSLAGRID = ''DET'''  
  +' AND B.TIPDES <> ''TC'' AND B.TIPDES = C.TB AND A.PVSLTIPBE = C.TIPBENEF'
  // Fin: HPC_201508_PRE
// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
  //+' AND A.PVSLTIPBE IN (''02'',''03'') AND ASOFRESCESE < ''01/01/1997'''
  +' AND A.PVSLTIPBE IN (''01'',''02'',''03'') AND ASOFRESCESE < ''01/01/1997'''
// Fin   HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
  +' GROUP BY  B.TIPDES, C.CUENTAID, B.CIAID, B.PVSLBENNR, B.PVSLTIPBE, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'')';
  DM1.cdsQry2.Close;
  DM1.cdsQry2.DataRequest(xSql);
  DM1.cdsQry2.Open;
  While Not DM1.cdsQry2.Eof Do
  Begin
    xCCOSID := centrodecosto(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString);
    tipodebeneficio(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString);
    cntnodoc := Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,7,4)+Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,4,2)+Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,1,2);
    cntglosa := 'LIQ:'+DM1.cdsQry2.FieldByName('PVSLBENNR').AsString+' '+DM1.cdsQry2.FieldByName('PVSLFECBE').AsString;
    xCUENTAID := DM1.cdsQry2.FieldByName('CUENTAID').AsString;
    cnttipcredes := describecuenta(xCUENTAID);
    xSql := 'INSERT INTO PVS_DET_CON(CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE,'
    +' BENEFDES, CCOSID, CUENTAID, TIPCREDES, DEBE, HABER, CNTNODOC, CNTGLOSA)'
    +' VALUES (''02'''
    +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString)
    +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)
    +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLTIPBE').AsString)
    +', NULL'
    +','+QuotedStr(xCCOSID)
    +','+QuotedStr(xCUENTAID)
    +','+QuotedStr(cnttipcredes)
    +','+DM1.cdsQry2.FieldByName('MONTO').AsString
    +', 0.00'
    +','+QuotedStr(cntnodoc)
    +','+QuotedStr(copy(cntglosa,1,40))
    +' )';
    DM1.DCOM1.AppServer.EjecutaSql(xSql);
    DM1.cdsQry2.Next;
  End;
  // ****************************************** \\
  // Invalidez y fallecimiento mayores a 1997 * \\
  // ****************************************** \\
  // **************** \\
  // Fondo de aportes \\
  // **************** \\
  xSql := 'SELECT  B.TIPDES, C.CUENTAID, B.CIAID, B.PVSLBENNR, B.PVSLTIPBE, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'') PVSLFECBE,  SUM(NVL(B.PVSLMONTO,0)) MONTO'
  +' FROM PVS306 A, PVS307 B, TGE186 C'
  +' WHERE TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') >= '+QuotedStr(xfecini)+' AND  TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') <= '+QuotedStr(xfecfin)
  // Inicio: HPC_201805_PRE
  // Se retira la contabilizacion de las re-liquidaciones
  // +' AND A.PVSESTLIQ IN (''02'', ''05'', ''06'') AND A.CNTFLAG IS NULL AND A.PVSLBENNR = B.PVSLBENNR AND PVSLAGRID = ''DET'''
  +' AND A.PVSESTLIQ IN (''02'', ''06'') AND A.CNTFLAG IS NULL AND A.PVSLBENNR = B.PVSLBENNR AND PVSLAGRID = ''DET'''
  // Fin: HPC_201805_PRE
// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
  //+' AND A.PVSLTIPBE IN (''02'',''03'') AND ASOFRESCESE >= ''01/01/1997'''
  +' AND A.PVSLTIPBE IN (''01'',''02'',''03'') AND ASOFRESCESE >= ''01/01/1997'''
// Fin    HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
  +' AND B.TIPDES = ''FA'' AND B.TIPDES = C.TB'
  +' GROUP BY  B.TIPDES, C.CUENTAID, B.CIAID, B.PVSLBENNR, B.PVSLTIPBE, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'')';
  DM1.cdsQry2.Close;
  DM1.cdsQry2.DataRequest(xSql);
  DM1.cdsQry2.Open;
  While Not DM1.cdsQry2.Eof Do
  Begin
    xCCOSID := centrodecosto(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString);
    tipodebeneficio(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString);
    cntnodoc := Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,7,4)+Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,4,2)+Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,1,2);
    cntglosa := 'LIQ:'+DM1.cdsQry2.FieldByName('PVSLBENNR').AsString+' '+DM1.cdsQry2.FieldByName('PVSLFECBE').AsString;
    xCUENTAID := DM1.cdsQry2.FieldByName('CUENTAID').AsString;
    cnttipcredes := describecuenta(xCUENTAID);
    xSql := 'INSERT INTO PVS_DET_CON(CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE,'
    +' BENEFDES, CCOSID, CUENTAID, TIPCREDES, DEBE, HABER, CNTNODOC, CNTGLOSA)'
    +' VALUES (''02'''
    +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString)
    +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)
    +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLTIPBE').AsString)
    +', NULL'
    +','+QuotedStr(xCCOSID)
    +','+QuotedStr(xCUENTAID)
    +','+QuotedStr(cnttipcredes)
    +','+DM1.cdsQry2.FieldByName('MONTO').AsString
    +', 0.00'
    +','+QuotedStr(cntnodoc)
    +','+QuotedStr(copy(cntglosa,1,40))
    +' )';
    DM1.DCOM1.AppServer.EjecutaSql(xSql);
    DM1.cdsQry2.Next;
  End;
  // **************** \\
  // Fondo intereses  \\
  // **************** \\
  xSql := 'SELECT  B.TIPDES, C.CUENTAID, B.CIAID, B.PVSLBENNR, B.PVSLTIPBE, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'') PVSLFECBE,  SUM(NVL(B.PVSLMONTO,0)) MONTO'
  +' FROM PVS306 A, PVS307 B, TGE186 C'
  +' WHERE TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') >= '+QuotedStr(xfecini)+' AND  TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') <= '+QuotedStr(xfecfin)
  // Inicio: HPC_201805_PRE 
  // Se retira la contabilizacion de las re-liquidaciones
  // +' AND A.PVSESTLIQ IN (''02'', ''05'', ''06'') AND A.CNTFLAG IS NULL AND A.PVSLBENNR = B.PVSLBENNR AND PVSLAGRID = ''DET'''
  +' AND A.PVSESTLIQ IN (''02'', ''06'') AND A.CNTFLAG IS NULL AND A.PVSLBENNR = B.PVSLBENNR AND PVSLAGRID = ''DET'''
  // Fin: HPC_201805_PRE
// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
  // +' AND A.PVSLTIPBE IN (''02'',''03'') AND ASOFRESCESE >= ''01/01/1997'''
  +' AND A.PVSLTIPBE IN (''01'',''02'',''03'') AND ASOFRESCESE >= ''01/01/1997'''
// Fin    HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
  +' AND B.TIPDES = ''FI'' AND B.TIPDES = C.TB'
  +' GROUP BY  B.TIPDES, C.CUENTAID, B.CIAID, B.PVSLBENNR, B.PVSLTIPBE, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'')';
  DM1.cdsQry2.Close;
  DM1.cdsQry2.DataRequest(xSql);
  DM1.cdsQry2.Open;
  While Not DM1.cdsQry2.Eof Do
  Begin
    xCCOSID := centrodecosto(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString);
    tipodebeneficio(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString);
    cntnodoc := Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,7,4)+Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,4,2)+Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,1,2);
    cntglosa := 'LIQ:'+DM1.cdsQry2.FieldByName('PVSLBENNR').AsString+' '+DM1.cdsQry2.FieldByName('PVSLFECBE').AsString;
    xCUENTAID := DM1.cdsQry2.FieldByName('CUENTAID').AsString;
    cnttipcredes := describecuenta(xCUENTAID);
    xSql := 'INSERT INTO PVS_DET_CON(CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE,'
    +' BENEFDES, CCOSID, CUENTAID, TIPCREDES, DEBE, HABER, CNTNODOC, CNTGLOSA)'
    +' VALUES (''02'''
    +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString)
    +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)
    +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLTIPBE').AsString)
    +', NULL'
    +','+QuotedStr(xCCOSID)
    +','+QuotedStr(xCUENTAID)
    +','+QuotedStr(cnttipcredes)
    +','+DM1.cdsQry2.FieldByName('MONTO').AsString
    +', 0.00'
    +','+QuotedStr(cntnodoc)
    +','+QuotedStr(copy(cntglosa,1,40))
    +' )';
    DM1.DCOM1.AppServer.EjecutaSql(xSql);
    DM1.cdsQry2.Next;
  End;
  // ************* \\
  // Fondo bonus   \\
  // **************\\
  xSql := 'SELECT  B.TIPDES, C.CUENTAID, B.CIAID, B.PVSLBENNR, B.PVSLTIPBE, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'') PVSLFECBE,  SUM(NVL(B.PVSLMONTO,0)) MONTO'
  +' FROM PVS306 A, PVS307 B, TGE186 C'
  +' WHERE TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') >= '+QuotedStr(xfecini)+' AND  TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') <= '+QuotedStr(xfecfin)

  // Inicio: HPC_201805_PRE
  // Se retira las reliquidaciones de beneficios
  // +' AND A.PVSESTLIQ IN (''02'', ''05'', ''06'') AND A.CNTFLAG IS NULL AND A.PVSLBENNR = B.PVSLBENNR AND PVSLAGRID = ''DET'''
  +' AND A.PVSESTLIQ IN (''02'', ''06'') AND A.CNTFLAG IS NULL AND A.PVSLBENNR = B.PVSLBENNR AND PVSLAGRID = ''DET'''
  // Fin: HPC_201805_PRE
// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
  //+' AND A.PVSLTIPBE IN (''02'',''03'') AND ASOFRESCESE >= ''01/01/1997'''
  +' AND A.PVSLTIPBE IN (''01'',''02'',''03'') AND ASOFRESCESE >= ''01/01/1997'''
// Fin   HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
  +' AND B.TIPDES = ''FB'' AND B.TIPDES = C.TB'
  +' GROUP BY  B.TIPDES, C.CUENTAID, B.CIAID, B.PVSLBENNR, B.PVSLTIPBE, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'')';
  DM1.cdsQry2.Close;
  DM1.cdsQry2.DataRequest(xSql);
  DM1.cdsQry2.Open;
  While Not DM1.cdsQry2.Eof Do
  Begin
    xCCOSID := centrodecosto(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString);
    tipodebeneficio(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString);
    cntnodoc := Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,7,4)+Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,4,2)+Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,1,2);
    cntglosa := 'LIQ:'+DM1.cdsQry2.FieldByName('PVSLBENNR').AsString+' '+DM1.cdsQry2.FieldByName('PVSLFECBE').AsString;
    xCUENTAID := DM1.cdsQry2.FieldByName('CUENTAID').AsString;
    cnttipcredes := describecuenta(xCUENTAID);
    xSql := 'INSERT INTO PVS_DET_CON(CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE,'
    +' BENEFDES, CCOSID, CUENTAID, TIPCREDES, DEBE, HABER, CNTNODOC, CNTGLOSA)'
    +' VALUES (''02'''
    +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString)
    +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)
    +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLTIPBE').AsString)
    +', NULL'
    +','+QuotedStr(xCCOSID)
    +','+QuotedStr(xCUENTAID)
    +','+QuotedStr(cnttipcredes)
    +','+DM1.cdsQry2.FieldByName('MONTO').AsString
    +', 0.00'
    +','+QuotedStr(cntnodoc)
    +','+QuotedStr(copy(cntglosa,1,40))
    +' )';
    DM1.DCOM1.AppServer.EjecutaSql(xSql);
    DM1.cdsQry2.Next;
  End;
  // ***************** \\
  // Monto diferencial \\
  // ***************** \\
  xSql := 'SELECT  B.TIPDES, B.CIAID, B.PVSLBENNR, B.PVSLTIPBE, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'') PVSLFECBE,  SUM(NVL(B.PVSLMONTO,0)) MONTO'
  +' FROM PVS306 A, PVS307 B'
  +' WHERE TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') >= '+QuotedStr(xfecini)+' AND  TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') <= '+QuotedStr(xfecfin)
  // Inicio: HPC_201805_PRE
  // Se retira las reliquidaciones de beneficios
  // +' AND A.PVSESTLIQ IN (''02'', ''05'', ''06'')'
  +' AND A.PVSESTLIQ IN (''02'', ''06'')'  
  // Fin: HPC_201805_PRE
  +' AND A.CNTFLAG IS NULL AND A.PVSLBENNR = B.PVSLBENNR'
  +' AND PVSLAGRID = ''DET'' AND A.PVSLTIPBE IN (''02'',''03'') AND ASOFRESCESE >= ''01/01/1997'' AND B.TIPDES = ''MD'''
  +' GROUP BY  B.TIPDES, B.CIAID, B.PVSLBENNR, B.PVSLTIPBE, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'')';
  DM1.cdsQry2.Close;
  DM1.cdsQry2.DataRequest(xSql);
  DM1.cdsQry2.Open;
  While Not DM1.cdsQry2.Eof Do
  Begin
    xCCOSID := centrodecosto(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString);
    tipodebeneficio(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString);
    cntnodoc := Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,7,4)+Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,4,2)+Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,1,2);
    cntglosa := 'LIQ:'+DM1.cdsQry2.FieldByName('PVSLBENNR').AsString+' '+DM1.cdsQry2.FieldByName('PVSLFECBE').AsString;
    xCUENTAID := DM1.cdsTipBenef.FieldByName('CUENTAID').AsString;
    DM1.cdsTipBenef.Close;
    cnttipcredes := describecuenta(xCUENTAID);
    xSql := 'INSERT INTO PVS_DET_CON(CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE,'
    +' BENEFDES, CCOSID, CUENTAID, TIPCREDES, DEBE, HABER, CNTNODOC, CNTGLOSA)'
    +' VALUES (''02'''
    +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString)
    +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)
    +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLTIPBE').AsString)
    +', NULL'
    +','+QuotedStr(xCCOSID)
    +','+QuotedStr(xCUENTAID)
    +','+QuotedStr(cnttipcredes)
    +','+DM1.cdsQry2.FieldByName('MONTO').AsString
    +', 0.00'
    +','+QuotedStr(cntnodoc)
    +','+QuotedStr(copy(cntglosa,1,40))
    +' )';
    DM1.DCOM1.AppServer.EjecutaSql(xSql);
    DM1.cdsQry2.Next;
  End;


  // Inicio: HPC_201805_PRE
  // Contabilizacion de las reliquidaciones
  // ******************** \\
  // Monto reliquidaciones\\
  // ******************** \\
  xSql := 'SELECT  B.CIAID, B.PVSLBENNR, B.PVSLTIPBE, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'') PVSLFECBE,  SUM(NVL(B.PVSLMONTO,0))'
  +' MONTO FROM PVS306 A, PVS307 B WHERE TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') >= '+QuotedStr(xfecini)+' AND  TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') <= '+QuotedStr(xfecfin)
  +' AND A.PVSESTLIQ IN (''05'') AND A.CNTFLAG IS NULL AND A.PVSLBENNR = B.PVSLBENNR AND B.PVSLAGRID = ''DET'''
  +' AND B.TIPDES <> ''TC'' AND A.PVSLTIPBE IN (''02'',''03'',''01'')'
  +' GROUP BY  B.CIAID, B.PVSLBENNR, B.PVSLTIPBE, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'')';
  DM1.cdsQry2.Close;
  DM1.cdsQry2.DataRequest(xSql);
  DM1.cdsQry2.Open;
  While Not DM1.cdsQry2.Eof Do
  Begin
    xCCOSID := centrodecosto(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString);
    tipodebeneficio(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString);
    cntnodoc := Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,7,4)+Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,4,2)+Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,1,2);
    cntglosa := 'RE-LIQ:'+DM1.cdsQry2.FieldByName('PVSLBENNR').AsString+' '+DM1.cdsQry2.FieldByName('PVSLFECBE').AsString;
    xCUENTAID := DM1.cdsTipBenef.FieldByName('CUENTAID').AsString;
    DM1.cdsTipBenef.Close;
    cnttipcredes := describecuenta(xCUENTAID);
    xSql := 'INSERT INTO PVS_DET_CON(CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE,'
    +' BENEFDES, CCOSID, CUENTAID, TIPCREDES, DEBE, HABER, CNTNODOC, CNTGLOSA)'
    +' VALUES (''02'''
    +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString)
    +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)
    +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLTIPBE').AsString)
    +', NULL'
    +','+QuotedStr(xCCOSID)
    +','+QuotedStr(xCUENTAID)
    +','+QuotedStr(cnttipcredes)
    +','+DM1.cdsQry2.FieldByName('MONTO').AsString
    +', 0.00'
    +','+QuotedStr(cntnodoc)
    +','+QuotedStr(copy(cntglosa,1,40))
    +' )';
    DM1.DCOM1.AppServer.EjecutaSql(xSql);
    DM1.cdsQry2.Next;
  End;
  // Fin: HPC_201805_PRE

  // ************************************************* \\
  // Inserción de registros de devoluciones de aportes \\
  // ************************************************* \\
  xSql := 'SELECT B.CIAID, B.PVSLBENNR, B.PVSLTIPBE, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'') PVSLFECBE, SUM(NVL(B.PVSLMONTO,0)) MONTO'
  +' FROM PVS306 A, PVS307 B'
  +' WHERE TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') >= '+QuotedStr(xfecini)+' AND TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') <= '+QuotedStr(xfecfin)
  +' AND A.PVSESTLIQ IN (''02'', ''05'', ''06'') AND A.CNTFLAG IS NULL AND A.PVSLBENNR = B.PVSLBENNR AND PVSLAGRID = ''DEV'''
  +' GROUP BY B.CIAID, B.PVSLBENNR, B.PVSLTIPBE, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'')';
  DM1.cdsQry2.Close;
  DM1.cdsQry2.DataRequest(xSql);
  DM1.cdsQry2.Open;
  DM1.cdsQry2.First;
  xCUENTAID := '4810002';
  cnttipcredes := describecuenta(xCUENTAID);
  While Not DM1.cdsQry2.Eof Do
  Begin
    xCCOSID := centrodecosto(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString);
    tipodebeneficio(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString);
    cntnodoc := Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,7,4)+Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,4,2)+Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,1,2);

    cntglosa := 'LIQ:'+DM1.cdsQry2.FieldByName('PVSLBENNR').AsString+' '+DM1.cdsQry2.FieldByName('PVSLFECBE').AsString;

    xSql := 'INSERT INTO PVS_DET_CON(CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE,'
    +' BENEFDES, CCOSID, CUENTAID, TIPCREDES, DEBE, HABER, CNTNODOC, CNTGLOSA)'
    +' VALUES (''02'''
    +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString)
    +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)
    +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLTIPBE').AsString)
    +', NULL'
    +','+QuotedStr(xCCOSID)
    +','+QuotedStr(xCUENTAID)
    +','+QuotedStr(cnttipcredes)
    +','+DM1.cdsQry2.FieldByName('MONTO').AsString
    +', 0.00'
    +','+QuotedStr(cntnodoc)
    +','+QuotedStr(copy(cntglosa,1,40))
    +' )';
    DM1.DCOM1.AppServer.EjecutaSql(xSql);
    DM1.cdsQry2.Next;
  End;
  // *********************************** \\
  // Todo que va al debe                 \\
  // En caso que haya sido reliquidaciòn \\
  // *********************************** \\
  xSql := 'SELECT B.CIAID, B.PVSLBENNR, B.PVSLTIPBE, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'') PVSLFECBE,  SUM(NVL(B.PVSLMONTO,0)) MONTO'
  +' FROM PVS306 A, PVS307 B'
  +' WHERE TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') >= '+QuotedStr(xfecini)+' AND  TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') <= '+QuotedStr(xfecfin)
  +' AND A.PVSESTLIQ IN (''02'', ''05'', ''06'') AND A.CNTFLAG IS NULL AND A.PVSLBENNR = B.PVSLBENNR AND PVSLAGRID = ''DSC'' AND TIPDES IS NULL AND SUBSTR(PVSLCONCE,1,4) = ''PAGO'''
  +' GROUP BY B.CIAID, B.PVSLBENNR, B.PVSLTIPBE, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'')';
  DM1.cdsQry2.Close;
  DM1.cdsQry2.DataRequest(xSql);
  DM1.cdsQry2.Open;
  DM1.cdsQry2.First;
  While Not DM1.cdsQry2.Eof Do
  Begin
    tipodebeneficio(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString);
    xCUENTAID := DM1.cdsTipBenef.FieldByName('CUENTAID').AsString;
    cnttipcredes := describecuenta(xCUENTAID);
    xCCOSID := centrodecosto(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString);
    cntnodoc := Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,7,4)+Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,4,2)+Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,1,2);

    cntglosa := 'LIQ:'+DM1.cdsQry2.FieldByName('PVSLBENNR').AsString+' '+DM1.cdsQry2.FieldByName('PVSLFECBE').AsString;

    xSql := 'INSERT INTO PVS_DET_CON(CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE,'
    +' BENEFDES, CCOSID, CUENTAID, TIPCREDES, DEBE, HABER, CNTNODOC, CNTGLOSA)'
    +' VALUES (''02'''
    +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString)
    +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)
    +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLTIPBE').AsString)
    +', NULL'
    +','+QuotedStr(xCCOSID)
    +','+QuotedStr(xCUENTAID)
    +','+QuotedStr(cnttipcredes)
    +', 0.00'
    +','+DM1.cdsQry2.FieldByName('MONTO').AsString
    +','+QuotedStr(cntnodoc)
    +','+QuotedStr(copy(cntglosa,1,40))
    +')';
    DM1.DCOM1.AppServer.EjecutaSql(xSql);
    DM1.cdsQry2.Next;
  End;
  // ************************************************* \\
  // Inserción de registros de nivelaciones de aportes \\
  // ************************************************* \\
  xSql := 'SELECT B.CIAID, B.PVSLBENNR, B.PVSLTIPBE, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'') PVSLFECBE, SUM(NVL(B.PVSLMONTO,0)) MONTO'
  +' FROM PVS306 A, PVS307 B'
  +' WHERE TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') >= '+QuotedStr(xfecini)+' AND TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') <= '+QuotedStr(xfecfin)
  +' AND A.PVSESTLIQ IN (''02'', ''05'', ''06'') AND A.CNTFLAG IS NULL AND A.PVSLBENNR = B.PVSLBENNR AND PVSLAGRID = ''DSC'''
  +' AND TIPDES = ''A'' '
  +' GROUP BY B.CIAID, B.PVSLBENNR, B.PVSLTIPBE, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'')';
  DM1.cdsQry2.Close;
  DM1.cdsQry2.DataRequest(xSql);
  DM1.cdsQry2.Open;
  DM1.cdsQry2.First;
  xCUENTAID := '4810001';
  cnttipcredes := describecuenta(xCUENTAID);
  While Not DM1.cdsQry2.Eof Do
  Begin
    xCCOSID := centrodecosto(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString);
    tipodebeneficio(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString);
    cntnodoc := Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,7,4)+Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,4,2)+Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,1,2);

    cntglosa := 'LIQ:'+DM1.cdsQry2.FieldByName('PVSLBENNR').AsString+' '+DM1.cdsQry2.FieldByName('PVSLFECBE').AsString;

    xSql := 'INSERT INTO PVS_DET_CON(CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE,'
    +' BENEFDES, CCOSID, CUENTAID, TIPCREDES, DEBE, HABER, CNTNODOC, CNTGLOSA)'
    +' VALUES (''02'''
    +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString)
    +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)
    +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLTIPBE').AsString)
    +', NULL'
    +','+QuotedStr(xCCOSID)
    +','+QuotedStr(xCUENTAID)
    +','+QuotedStr(cnttipcredes)
    +', 0.00 '
    +','+DM1.cdsQry2.FieldByName('MONTO').AsString
    +','+QuotedStr(cntnodoc)
    +','+QuotedStr(copy(cntglosa,1,40))
    +')';
    DM1.DCOM1.AppServer.EjecutaSql(xSql);
    DM1.cdsQry2.Next;
  End;
  // ************************************************** \\
  // Inserción de registros de cobro por transferencias \\
  // ************************************************** \\
  xSql := 'SELECT B.CIAID, B.PVSLBENNR, B.PVSLTIPBE, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'') PVSLFECBE, SUM(NVL(B.PVSLMONTO,0)) MONTO'
  +' FROM PVS306 A, PVS307 B'
  +' WHERE TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') >= '+QuotedStr(xfecini)+' AND TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') <= '+QuotedStr(xfecfin)
  +' AND A.PVSESTLIQ IN (''02'', ''05'', ''06'') AND A.CNTFLAG IS NULL AND A.PVSLBENNR = B.PVSLBENNR AND PVSLAGRID = ''DSC'''
  +' AND TIPDES = ''T'' '
  +' GROUP BY B.CIAID, B.PVSLBENNR, B.PVSLTIPBE, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'')';
  DM1.cdsQry2.Close;
  DM1.cdsQry2.DataRequest(xSql);
  DM1.cdsQry2.Open;
  DM1.cdsQry2.First;
  xCUENTAID := '75909';
  cnttipcredes := describecuenta(xCUENTAID);
  While Not DM1.cdsQry2.Eof Do
  Begin
    tipodebeneficio(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString);
    cntnodoc := Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,7,4)+Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,4,2)+Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,1,2);

    cntglosa := 'LIQ:'+DM1.cdsQry2.FieldByName('PVSLBENNR').AsString+' '+DM1.cdsQry2.FieldByName('PVSLFECBE').AsString;

    xSql := 'INSERT INTO PVS_DET_CON(CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE,'
    +' BENEFDES, CUENTAID, TIPCREDES, DEBE, HABER, CNTNODOC, CNTGLOSA)'
    +' VALUES (''02'''
    +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString)
    +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)
    +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLTIPBE').AsString)
    +', NULL'
    +','+QuotedStr(xCUENTAID)
    +','+QuotedStr(cnttipcredes)
    +', 0.00 '
    +','+DM1.cdsQry2.FieldByName('MONTO').AsString
    +','+QuotedStr(cntnodoc)
    +','+QuotedStr(copy(cntglosa,1,40))
    +')';
    DM1.DCOM1.AppServer.EjecutaSql(xSql);
    DM1.cdsQry2.Next;
  End;
  // ******************************************* \\
  // Inserción de registros de cobro de creditos \\
  // ******************************************* \\
  xSql := 'SELECT B.CIAID, B.PVSLBENNR, B.PVSLTIPBE, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'') PVSLFECBE, SUM(NVL(B.PVSLMONTO,0)) MONTO'
  +' FROM PVS306 A, PVS307 B'
  +' WHERE TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') >= '+QuotedStr(xfecini)+' AND TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') <= '+QuotedStr(xfecfin)
  +' AND A.PVSESTLIQ IN (''02'', ''05'', ''06'') AND A.CNTFLAG IS NULL AND A.PVSLBENNR = B.PVSLBENNR AND PVSLAGRID = ''DSC'''
  +' AND TIPDES = ''C'' '
  +' GROUP BY B.CIAID, B.PVSLBENNR, B.PVSLTIPBE, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'')';
  DM1.cdsQry2.Close;
  DM1.cdsQry2.DataRequest(xSql);
  DM1.cdsQry2.Open;
  DM1.cdsQry2.First;
  While Not DM1.cdsQry2.Eof Do
  Begin
    xCCOSID := centrodecosto(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString);
    tipodebeneficio(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString);
    cntnodoc := Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,7,4)+Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,4,2)+Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,1,2);

    cntglosa := 'LIQ:'+DM1.cdsQry2.FieldByName('PVSLBENNR').AsString+' '+DM1.cdsQry2.FieldByName('PVSLFECBE').AsString;

    //Buscando el monto cobrado por creditos
    xSql := 'SELECT CREDID, SUM(NVL(CREAMORT,0)) CREAMORT, SUM(NVL(CREINTERES,0)) CREINTERES, SUM(NVL(CREFLAT ,0)) CREFLAT, SUM(NVL(MONCOBDESGRAV,0)) MONCOBDESGRAV'

    +' FROM CRE310 WHERE ASOID IN (SELECT ASOID FROM PVS306 WHERE PVSLBENNR = '+QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)+')'
    +' AND CREDOCPAG = '+QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)+' AND CREESTID NOT IN (''04'', ''13'') GROUP BY CREDID';
    DM1.cdsCuotas.Close;
    DM1.cdsCuotas.DataRequest(xSql);
    DM1.cdsCuotas.Open;
    DM1.cdsCuotas.First;
    While Not DM1.cdsCuotas.Eof Do
    Begin
      xCCOSID := centrodecosto(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString);
      tipodebeneficio(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString);
      xSql := 'SELECT TIPCREDES, TIPCREID, CUENTAID AMO, CTAINT INT, CTAFLAT FLA FROM CRE110 WHERE TIPCREID = '+QuotedStr(Copy(DM1.cdsCuotas.FieldByName('CREDID').AsString,7,2));
      DM1.cdsQry20.Close;
      DM1.cdsQry20.DataRequest(xSql);
      DM1.cdsQry20.Open;
      // ************************** \\
      // Insertando la amortizacion \\
      // ************************** \\
      xCUENTAID := DM1.cdsQry20.FieldByName('AMO').AsString;
      cnttipcredes := describecuenta(xCUENTAID);
      xSql := 'INSERT INTO PVS_DET_CON(CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE,'
      +' BENEFDES, CCOSID, CUENTAID, TIPCREDES, DEBE, HABER, CNTNODOC, CNTGLOSA)'
      +' VALUES (''02'''
      +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString)
      +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)
      +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLTIPBE').AsString)
      +', NULL'
      +','+QuotedStr(xCCOSID)
      +','+QuotedStr(xCUENTAID)
      +','+QuotedStr(cnttipcredes)
      +', 0.00 '
      +','+DM1.cdsCuotas.FieldByName('CREAMORT').AsString
      +','+QuotedStr(cntnodoc)
      +','+QuotedStr(copy(cntglosa,1,40))
      +')';
      DM1.DCOM1.AppServer.EjecutaSql(xSql);
      // ********************* \\
      // Insertando el interes \\
      // ********************* \\
      xCUENTAID := DM1.cdsQry20.FieldByName('INT').AsString;
      cnttipcredes := describecuenta(xCUENTAID);
      xSql := 'INSERT INTO PVS_DET_CON(CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE,'
      +' BENEFDES, CCOSID, CUENTAID, TIPCREDES, DEBE, HABER, CNTNODOC, CNTGLOSA)'
      +' VALUES (''02'''
      +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString)
      +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)
      +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLTIPBE').AsString)
      +', NULL'
      +', NULL'
      +','+QuotedStr(xCUENTAID)
      +','+QuotedStr(cnttipcredes)
      +', 0.00 '
      +','+DM1.cdsCuotas.FieldByName('CREINTERES').AsString
      +','+QuotedStr(cntnodoc)
      +','+QuotedStr(copy(cntglosa,1,40))
      +')';
      DM1.DCOM1.AppServer.EjecutaSql(xSql);
      // ****************** \\
      // Insertando el flat \\
      // ****************** \\
      xCUENTAID := DM1.cdsQry20.FieldByName('FLA').AsString;
      cnttipcredes := describecuenta(xCUENTAID);
      xSql := 'INSERT INTO PVS_DET_CON(CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE,'
      +' BENEFDES, CCOSID, CUENTAID, TIPCREDES, DEBE, HABER, CNTNODOC, CNTGLOSA)'
      +' VALUES (''02'''
      +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString)
      +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)
      +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLTIPBE').AsString)
      +', NULL'
      +', NULL'
      +','+QuotedStr(xCUENTAID)
      +','+QuotedStr(cnttipcredes)
      +', 0.00 '
      +','+DM1.cdsCuotas.FieldByName('CREFLAT').AsString
      +','+QuotedStr(cntnodoc)
      +','+QuotedStr(copy(cntglosa,1,40))
      +')';
      DM1.DCOM1.AppServer.EjecutaSql(xSql);

      // Cambiar las cuentas por los reales.
      // ********************** \\
      // Insertando desgravamen \\
      // ********************** \\

//      Inicio: SPP_201402_PRE
      {
      xCUENTAID := 'TEMPDESGAV';
      // cnttipcredes := describecuenta(xCUENTAID);
      cnttipcredes := 'TEMPORAL DESGRAVAMEN';
       }
      xCUENTAID := '4860001';
      cnttipcredes := 'FON.SEG.DESGRAVAMEN';

//      Fin: SPP_201402_PRE

      xSql := 'INSERT INTO PVS_DET_CON(CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE,'
      +' BENEFDES, CCOSID, CUENTAID, TIPCREDES, DEBE, HABER, CNTNODOC, CNTGLOSA)'
      +' VALUES (''02'''
      +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString)
      +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)
      +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLTIPBE').AsString)
      +', NULL'
      +', NULL'
      +','+QuotedStr(xCUENTAID)
      +','+QuotedStr(cnttipcredes)
      +', 0.00 '
      +','+DM1.cdsCuotas.FieldByName('MONCOBDESGRAV').AsString
      +','+QuotedStr(cntnodoc)
      +','+QuotedStr(copy(cntglosa,1,40))
      +')';
      DM1.DCOM1.AppServer.EjecutaSql(xSql);

      DM1.cdsCuotas.Next;
    End;
    DM1.cdsQry2.Next;
  End;


// inicio HPC_201504_PRE     : Descuentos por aplicaciones de CCI
  // ******************************************* \\
  // Inserción de registros de cobro de CCI      \\
  // ******************************************* \\
  xSql := 'SELECT B.CIAID, B.PVSLBENNR, B.PVSLTIPBE, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'') PVSLFECBE, SUM(NVL(B.PVSLMONTO,0)) MONTO'
  +' FROM PVS306 A, PVS307 B'
  +' WHERE TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') >= '+QuotedStr(xfecini)+' AND TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') <= '+QuotedStr(xfecfin)
  +' AND A.PVSESTLIQ IN (''02'', ''05'', ''06'') AND A.CNTFLAG IS NULL AND A.PVSLBENNR = B.PVSLBENNR AND PVSLAGRID = ''DSC'''
  +' AND TIPDES = ''CI'' '
  +' GROUP BY B.CIAID, B.PVSLBENNR, B.PVSLTIPBE, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'')';
  DM1.cdsQry2.Close;
  DM1.cdsQry2.DataRequest(xSql);
  DM1.cdsQry2.Open;
  DM1.cdsQry2.First;
  While Not DM1.cdsQry2.Eof Do
  Begin
    xCCOSID := centrodecosto(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString);
    tipodebeneficio(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString);
    cntnodoc := Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,7,4)+Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,4,2)+Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,1,2);

    cntglosa := 'LIQ:'+DM1.cdsQry2.FieldByName('PVSLBENNR').AsString+' '+DM1.cdsQry2.FieldByName('PVSLFECBE').AsString;

    xCCOSID := centrodecosto(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString);
    tipodebeneficio(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString);

    // ************************** \\
    // Insertando la cci          \\
    // ************************** \\
    xCUENTAID := '4840001';
    cnttipcredes := describecuenta(xCUENTAID);
    xSql := 'INSERT INTO PVS_DET_CON(CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE,'
    +' BENEFDES, CCOSID, CUENTAID, TIPCREDES, DEBE, HABER, CNTNODOC, CNTGLOSA)'
    +' VALUES (''02'''
    +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString)
    +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)
    +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLTIPBE').AsString)
    +', NULL'
    +','+QuotedStr(xCCOSID)
    +','+QuotedStr(xCUENTAID)
    +','+QuotedStr(cnttipcredes)
    +', 0.00 '
    +','+DM1.cdsQry2.FieldByName('MONTO').AsString
    +','+QuotedStr(cntnodoc)
    +','+QuotedStr(copy(cntglosa,1,40))
    +')';
    DM1.DCOM1.AppServer.EjecutaSql(xSql);

    DM1.cdsQry2.Next;
  End;
// Fin  HPC_201504_PRE     : Descuentos por aplicaciones de CCI

  // Se inserta la cuenta de pagos al fondo solidario
  // ******************************************* \\
  // Inserción de registros de fondo solidario   \\
  // ******************************************* \\
  xSql := 'SELECT B.CIAID, B.PVSLBENNR, B.PVSLTIPBE, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'') PVSLFECBE, SUM(NVL(B.PVSLMONTO,0)) MONTO'
  +' FROM PVS306 A, PVS307 B'
  +' WHERE TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') >= '+QuotedStr(xfecini)+' AND TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') <= '+QuotedStr(xfecfin)
  +' AND A.PVSESTLIQ IN (''02'', ''05'', ''06'') AND A.CNTFLAG IS NULL AND A.PVSLBENNR = B.PVSLBENNR AND PVSLAGRID = ''DSC'''
  +' AND TIPDES = ''F'''
  +' GROUP BY B.CIAID, B.PVSLBENNR, B.PVSLTIPBE, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'')';
  DM1.cdsQry2.Close;
  DM1.cdsQry2.DataRequest(xSql);
  DM1.cdsQry2.Open;
  DM1.cdsQry2.First;
  While Not DM1.cdsQry2.Eof Do
  Begin
    tipodebeneficio(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString);
    cntnodoc := Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,7,4)+Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,4,2)+Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,1,2);

    cntglosa := 'DEV.F.CONTINGENCIA : '+DM1.cdsQry2.FieldByName('PVSLBENNR').AsString+' '+DM1.cdsQry2.FieldByName('PVSLFECBE').AsString;

    //Buscando el monto devuelto al fonso solidario
    xSql := 'SELECT B.TIP_ASO_ORIGEN, SUM(NVL(IMP_COB_DEU,0)) IMP_COB_DEU FROM COB_FSC_PAGOS_AL_FSC A, COB_FSC_DEUDA_FSC_CAB B'
    +' WHERE A.ASOID IN (SELECT ASOID FROM PVS306 WHERE PVSLBENNR = '+QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)+')'
    +' AND A.EST_COB_COD NOT IN (''04'',''13'') AND A.ASOID = B.ASOID AND A.NROOPE = '+QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)
    +' AND A.NUM_DEU = B.NUM_DEU GROUP BY B.TIP_ASO_ORIGEN';
    DM1.cdsCuotas.Close;
    DM1.cdsCuotas.DataRequest(xSql);
    DM1.cdsCuotas.Open;
    // Buscando cuenta de tipo de asociado para el fondo
    xSql := 'SELECT ''FONDO CONTINGENCIA : ''||ASOTIPDES ASOTIPDES, CTA_FSC FROM APO107 WHERE ASOTIPID = '+QuotedStr(DM1.cdsCuotas.FieldByName('TIP_ASO_ORIGEN').AsString);
    DM1.cdsTipoAsoc.Close;
    DM1.cdsTipoAsoc.DataRequest(xSql);
    DM1.cdsTipoAsoc.Open;
    xCUENTAID := DM1.cdsTipoAsoc.FieldByName('CTA_FSC').AsString;
    cnttipcredes := DM1.cdsTipoAsoc.FieldByName('ASOTIPDES').AsString;
    DM1.cdsCuotas.First;
    While Not DM1.cdsCuotas.Eof Do
    Begin
      tipodebeneficio(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString);
      // **************************** \\
      // Insertando el fondo solidario\\
      // **************************** \\
      xSql := 'INSERT INTO PVS_DET_CON(CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE,'
      +' BENEFDES, CCOSID, CUENTAID, TIPCREDES, DEBE, HABER, CNTNODOC, CNTGLOSA)'
      +' VALUES (''02'''
      +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString)
      +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)
      +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLTIPBE').AsString)
      +', NULL'
      +','+QuotedStr(xCCOSID)
      +','+QuotedStr(xCUENTAID)
      +','+QuotedStr(cnttipcredes)
      +', 0.00 '
      +','+DM1.cdsCuotas.FieldByName('IMP_COB_DEU').AsString
      +','+QuotedStr(cntnodoc)
      +','+QuotedStr(copy(cntglosa,1,40))
      +')';
      DM1.DCOM1.AppServer.EjecutaSql(xSql);
      DM1.cdsCuotas.Next;
    End;
    DM1.cdsQry2.Next;
  End;
  // ******************************************* \\
  // Inserción de los registros de forma de pago \\
  // ******************************************* \\
  // Inicio: HPC_201802_PRE
  // Se adiciona liquidaciones por oficio
  // xSql := 'SELECT A.PVSLBENNR, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'') PVSLFECBE, A.PVSLTIPBE, B.BANCOID, B.FORPAGOID, B.PVSLNOFC, B.NROCHEQUE, B.PVSNOMBRE'
  xSql := 'SELECT A.PVSLBENNR, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'') PVSLFECBE, A.PVSLTIPBE, B.BANCOID, B.FORPAGOID, B.PVSLNOFC, B.NROCHEQUE, B.PVSNOMBRE, A.FLADES, A.FORSOLBEN,'
  +' SUM(NVL(B.PVSLMONTO,0)) MONTO FROM PVS306 A, PVS307 B'
  +' WHERE TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') >= '+QuotedStr(xfecini)
  +' AND TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') <= '+QuotedStr(xfecfin)
  +' AND A.PVSESTLIQ IN (''02'', ''05'', ''06'') AND B.CNTFLAG IS NULL AND A.PVSLBENNR = B.PVSLBENNR'
  +' AND PVSLAGRID IN (''FPG'', ''RET'') AND B.FLGVOUCHER = ''N'''
  +' GROUP BY A.PVSLBENNR, A.PVSLFECBE, A.PVSLTIPBE, B.BANCOID, B.FORPAGOID, B.PVSLNOFC, B.NROCHEQUE, B.PVSNOMBRE, A.FLADES, A.FORSOLBEN';
  // Fin:HPC_201802_PRE
  DM1.cdsQry2.Close;
  DM1.cdsQry2.DataRequest(xSql);
  DM1.cdsQry2.Open;
  DM1.cdsQry2.First;
  While Not DM1.cdsQry2.Eof Do
  Begin
    // ************************* \\
    // Cuenta generica detallado \\
    // ************************* \\
    xCCOSID := centrodecosto(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString);
    tipodebeneficio(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString);
    xCUENTAID := '';
    xCtaDes := '';
    cntnodoc := '';
    cntglosa := '';
    // Inicio: HPC_201802_PRE
    // Se valida el numero de cuenta dependiendo del tipo de solicitud
    // xCUENTAID := '4691207';
    If DM1.cdsQry2.FieldByName('FORSOLBEN').AsString = 'O' Then
       xCUENTAID := '4691211'
    Else
       xCUENTAID := '4691207';
    // Fin: HPC_201802_PRE
    cnttipcredes := describecuenta(xCUENTAID);
    cntnodoc := 'LIQ:'+Copy(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString,5,7);
    cntglosa := DM1.cdsQry2.FieldByName('PVSLBENNR').AsString+' '+DM1.cdsQry2.FieldByName('PVSNOMBRE').AsString;
    xSql := 'INSERT INTO PVS_DET_CON(CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE,'
    +' BENEFDES, CCOSID, CUENTAID, TIPCREDES, DEBE, HABER, CNTNODOC, CNTGLOSA)'
    +' VALUES (''02'''
    +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString)
    +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)
    +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLTIPBE').AsString)
    +', NULL'
    +', NULL'
    +','+QuotedStr(xCUENTAID)
    +','+QuotedStr(cnttipcredes)
    +', 0.00 '
    +','+DM1.cdsQry2.FieldByName('MONTO').AsString
    +','+QuotedStr(cntnodoc)
    +','+QuotedStr(copy(cntglosa,1,40))
    +')';
    DM1.DCOM1.AppServer.EjecutaSql(xSql);
    DM1.cdsQry2.Next;
  End;
  grucom := 0;
  // Inicio: HPC_201802_PRE
  // Se controla pagos realizado por liquidaciones por oficio
  //******************************************\\
  // Controlando pagos realizados por oficios \\
  //******************************************\\
  // xSql := 'SELECT A.PVSLBENNR, TO_CHAR(B.FECPAG, ''DD/MM/YYYY'') PVSLFECBE, A.PVSLTIPBE, B.BANCOID, B.FORPAGOID, B.PVSLNOFC, B.NROCHEQUE, B.PVSLNCTA, B.PVSNOMBRE, SUM(NVL(B.PVSLMONTO,0)) MONTO'
  xSql := 'SELECT A.PVSLBENNR, TO_CHAR(B.FECPAG, ''DD/MM/YYYY'') PVSLFECBE, A.PVSLTIPBE, B.BANCOID, B.FORPAGOID, B.PVSLNOFC, B.NROCHEQUE, B.PVSLNCTA, B.PVSNOMBRE, A.FLADES, A.FORSOLBEN, SUM(NVL(B.PVSLMONTO,0)) MONTO'
  +' FROM PVS306 A, PVS307 B WHERE TO_CHAR(B.FECPAG, ''YYYYMMDD'') >= '+QuotedStr(xfecini)
  +' AND TO_CHAR(B.FECPAG, ''YYYYMMDD'') <= '+QuotedStr(xfecfin)
  +' AND A.PVSESTLIQ IN (''02'', ''05'', ''06'') AND A.PVSLBENNR = B.PVSLBENNR AND B.PVSLAGRID IN (''FPG'', ''RET'')  AND B.FLGVOUCHER = ''N'''
  +' AND B.CNTFLAG IS NULL AND (B.PVSLNOFC IS NOT NULL)'
  // +' GROUP BY A.PVSLBENNR, TO_CHAR(B.FECPAG, ''DD/MM/YYYY''), A.PVSLTIPBE, B.BANCOID, B.FORPAGOID, B.PVSLNOFC, B.NROCHEQUE, B.PVSLNCTA, B.PVSNOMBRE ORDER BY B.PVSLNOFC';
  +' GROUP BY A.PVSLBENNR, TO_CHAR(B.FECPAG, ''DD/MM/YYYY''), A.PVSLTIPBE, B.BANCOID, B.FORPAGOID, B.PVSLNOFC, B.NROCHEQUE, B.PVSLNCTA, B.PVSNOMBRE, A.FLADES, A.FORSOLBEN ORDER BY B.PVSLNOFC';
  // Fin: HPC_201802_PRE
  DM1.cdsQry2.Close;
  DM1.cdsQry2.DataRequest(xSql);
  DM1.cdsQry2.Open;
  DM1.cdsQry2.First;
  While Not DM1.cdsQry2.Eof Do
  Begin
     grucom := grucom + 1;
     grucomc := DM1.StrZero(FloatToStr(grucom),2);
     xnumofi := DM1.cdsQry2.FieldByName('PVSLNOFC').AsString;
     xfecpag := DM1.cdsQry2.FieldByName('PVSLFECBE').AsString;
     xmonhab := 0;
     While (xnumofi = DM1.cdsQry2.FieldByName('PVSLNOFC').AsString) AND (Not DM1.cdsQry2.Eof) Do
     Begin
       // ************************* \\
       // Sub cuenta detallado Debe \\
       // ************************* \\
       // Inicio: HPC_201802_PRE
       // Inicio: Se añade cuenta en el caso que sea por oficio
       If DM1.cdsQry2.FieldByName('FORSOLBEN').AsString = 'O' Then
          xCUENTAID := '4691211'
       Else
          xCUENTAID := '4691207';
       // Fin: HPC_201802_PRE
       cnttipcredes := describecuenta(xCUENTAID);
       xCtaDes := 'BENEFICIOS POR PAGAR DOCENTES';

       cntnodoc := 'LIQ:'+Copy(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString,5,7);

       cntglosa := DM1.cdsQry2.FieldByName('PVSNOMBRE').AsString;
       xSql := 'INSERT INTO PVS_DET_CON(CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE,'
       +' BENEFDES, CCOSID, CUENTAID, TIPCREDES, DEBE, HABER, CNTNODOC, CNTGLOSA, GRUCON)'
       +' VALUES (''02'''
       +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString)
       +','+QuotedStr('OFI'+xnumofi)
       +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLTIPBE').AsString)
       +', NULL'
       +', NULL'
       +','+QuotedStr(xCUENTAID)
       +','+QuotedStr(cnttipcredes)
       +','+DM1.cdsQry2.FieldByName('MONTO').AsString
       +', 0.00 '
       +','+QuotedStr(cntnodoc)
       +','+QuotedStr(copy(cntglosa,1,40))
       +','+QuotedStr(grucomc)
       +')';
       DM1.DCOM1.AppServer.EjecutaSql(xSql);
       xmonhab := xmonhab + DM1.cdsQry2.FieldByName('MONTO').AsFloat;
       xforpag := DM1.cdsQry2.FieldByName('FORPAGOID').AsString;
       DM1.cdsQry2.Next;
     End;
     // ************************** \\
     // Sub cuenta detallado Haber \\
     // ************************** \\
     // Giro Bancario
     If xforpag = '05' Then
     Begin
       xCUENTAID := '104010401';
       cnttipcredes := describecuenta(xCUENTAID);
       cntnodoc := 'OFI'+xnumofi;
       cntglosa := 'OFI'+xnumofi;
     End;
     // Abono en Cuenta
     If xforpag = '06' Then
     Begin
       xCUENTAID := '104010401';
       cnttipcredes := describecuenta(xCUENTAID);
       cntnodoc := 'OFI'+xnumofi;
       cntglosa := 'OFI'+xnumofi;
     End;
     //Cuenta de Ahorros
     If xforpag = '11' Then
     Begin
       xCUENTAID := '104010301';
       cnttipcredes := describecuenta(xCUENTAID);
       cntnodoc := 'OFI'+xnumofi;
       cntglosa := 'OFI'+xnumofi;
     End;
     If xforpag = '16' Then
     Begin
       xCUENTAID := '104010301';
       cnttipcredes := describecuenta(xCUENTAID);
       cntnodoc := 'OFI'+xnumofi;
       cntglosa := 'OFI'+xnumofi;
     End;
     xSql := 'INSERT INTO PVS_DET_CON(CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE,'
     +' BENEFDES, CCOSID, CUENTAID, TIPCREDES, DEBE, HABER, CNTNODOC, CNTGLOSA, GRUCON)'
     +' VALUES (''02'''
     +','+QuotedStr(xfecpag)
     +','+QuotedStr('OFI'+xnumofi)
     +', NULL'
     +', NULL'
     +', NULL'
     +','+QuotedStr(xCUENTAID)
     +','+QuotedStr(cnttipcredes)
     +', 0.00 '
     +','+FloatToStr(xmonhab)
     +','+QuotedStr(cntnodoc)
     +','+QuotedStr(copy(cntglosa,1,40))
     +','+QuotedStr(grucomc)
     +')';
     DM1.DCOM1.AppServer.EjecutaSql(xSql);
  End;
  // Inicio: HPC_201802_PRE
  // Se controla pagos realizados por cheques de liquidaciones por oficio
  //******************************************\\
  // Controlando pagos realizados por cheques \\
  //******************************************\\
  // xSql := 'SELECT A.PVSLBENNR, TO_CHAR(B.FECPAG, ''DD/MM/YYYY'') PVSLFECBE, A.PVSLTIPBE, B.BANCOID, B.FORPAGOID, B.PVSLNOFC, B.NROCHEQUE, B.PVSLNCTA, B.PVSNOMBRE,'
  xSql := 'SELECT A.PVSLBENNR, TO_CHAR(B.FECPAG, ''DD/MM/YYYY'') PVSLFECBE, A.PVSLTIPBE, B.BANCOID, B.FORPAGOID, B.PVSLNOFC, B.NROCHEQUE, B.PVSLNCTA, B.PVSNOMBRE, A.FLADES,'
  +' SUM(NVL(B.PVSLMONTO,0)) MONTO FROM PVS306 A, PVS307 B WHERE TO_CHAR(B.FECPAG, ''YYYYMMDD'') >= '+QuotedStr(xfecini)
  +' AND TO_CHAR(B.FECPAG, ''YYYYMMDD'') <= '+QuotedStr(xfecfin)
  +' AND A.PVSESTLIQ IN (''02'', ''05'', ''06'') AND A.PVSLBENNR = B.PVSLBENNR AND B.PVSLAGRID IN (''FPG'', ''RET'') '
  +' AND B.FLGVOUCHER = ''N'' AND B.CNTFLAG IS NULL AND (B.NROCHEQUE IS NOT NULL)'
  +' GROUP BY A.PVSLBENNR, TO_CHAR(B.FECPAG, ''DD/MM/YYYY''), A.PVSLTIPBE, B.BANCOID, B.FORPAGOID, B.PVSLNOFC, B.NROCHEQUE, B.PVSLNCTA, B.PVSNOMBRE, A.FLADES';
  // Fin: HPC_201802_PRE
  DM1.cdsQry2.Close;
  DM1.cdsQry2.DataRequest(xSql);
  DM1.cdsQry2.Open;
  DM1.cdsQry2.First;
  While Not DM1.cdsQry2.Eof Do
  Begin
     grucom := grucom + 1;
     grucomc := DM1.StrZero(FloatToStr(grucom),2);
     // ************************* \\
     // Sub cuenta detallado Debe \\
     // ************************* \\
     // Inicio: HPC_201802_PRE
     // Se adiciona cuenta dependiendo el tipo de liquidacion (oficio o por solicitud del beneficiario)
     // xCUENTAID := '4691207';
     If DM1.cdsQry2.FieldByName('FORSOLBEN').AsString = 'O' Then
        xCUENTAID := '4691211'
     Else
        xCUENTAID := '4691207';
     // Fin: HPC_201802_PRE
     cnttipcredes := describecuenta(xCUENTAID);
     xCtaDes := 'BENEFICIOS POR PAGAR DOCENTES';
     cntnodoc := 'LIQ:'+Copy(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString,5,7);
     cntglosa := DM1.cdsQry2.FieldByName('PVSNOMBRE').AsString;
     xSql := 'INSERT INTO PVS_DET_CON(CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE,'
     +' BENEFDES, CCOSID, CUENTAID, TIPCREDES, DEBE, HABER, CNTNODOC, CNTGLOSA, GRUCON)'
     +' VALUES (''02'''
     +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString)
     +','+QuotedStr('CHE'+DM1.cdsQry2.FieldByName('NROCHEQUE').AsString)
     +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLTIPBE').AsString)
     +', NULL'
     +', NULL'
     +','+QuotedStr(xCUENTAID)
     +','+QuotedStr(cnttipcredes)
     +','+DM1.cdsQry2.FieldByName('MONTO').AsString
     +', 0.00 '
     +','+QuotedStr(cntnodoc)
     +','+QuotedStr(copy(cntglosa,1,40))
     +','+QuotedStr(grucomc)
     +')';
     DM1.DCOM1.AppServer.EjecutaSql(xSql);
     // ************************** \\
     // Sub cuenta detallado Haber \\
     // ************************** \\
     cntglosa := DM1.cdsQry2.FieldByName('PVSNOMBRE').AsString;
     // Cheque
     If DM1.cdsQry2.FieldByName('FORPAGOID').AsString = '01' Then
     Begin
       xCUENTAID := '104010301';
       cnttipcredes := describecuenta(xCUENTAID);
       cntnodoc := 'CHE:'+DM1.cdsQry2.FieldByName('NROCHEQUE').AsString;
       cntglosa := DM1.cdsQry2.FieldByName('PVSNOMBRE').AsString;
     End;
     xSql := 'INSERT INTO PVS_DET_CON(CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE,'
     +' BENEFDES, CCOSID, CUENTAID, TIPCREDES, DEBE, HABER, CNTNODOC, CNTGLOSA, GRUCON)'
     +' VALUES (''02'''
     +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString)
     +','+QuotedStr('CHE'+DM1.cdsQry2.FieldByName('NROCHEQUE').AsString)
     +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLTIPBE').AsString)
     +', NULL'
     +', NULL'
     +','+QuotedStr(xCUENTAID)
     +','+QuotedStr(cnttipcredes)
     +', 0.00 '
     +','+DM1.cdsQry2.FieldByName('MONTO').AsString
     +','+QuotedStr(cntnodoc)
     +','+QuotedStr(copy(cntglosa,1,40))
     +','+QuotedStr(grucomc)
     +')';
     DM1.DCOM1.AppServer.EjecutaSql(xSql);
     DM1.cdsQry2.Next;
  End;
  // ************ \\
  // Finalización \\
  // ************ \\
  xSql := 'SELECT PVSLFECBE, PVSLBENNR, SUM(NVL(DEBE,0)) DEBE, SUM(NVL(HABER,0)) HABER,  SUM(NVL(DEBE,0)-NVL(HABER,0)) DIF'
  +' FROM PVS_DET_CON GROUP BY PVSLFECBE, PVSLBENNR';
  DM1.cdsTDiario.Close;
  DM1.cdsTDiario.DataRequest(xSql);
  DM1.cdsTDiario.Open;
  TNumericField(DM1.cdsTDiario.FieldByName('DEBE')).DisplayFormat := '###,###,##0.00';
  TNumericField(DM1.cdsTDiario.FieldByName('HABER')).DisplayFormat := '###,###,##0.00';
  TNumericField(DM1.cdsTDiario.FieldByName('DIF')).DisplayFormat := '###,###,##0.00';
  DM1.cdsTDiario.First;
  debe  := 0;
  haber := 0;
  dif   := 0;
  While Not DM1.cdsTDiario.Eof Do
  Begin
    debe  := debe + DM1.cdsTDiario.FieldByName('DEBE').AsFloat;
    haber := haber+ DM1.cdsTDiario.FieldByName('HABER').AsFloat;
    dif   := dif  + DM1.cdsTDiario.FieldByName('DIF').AsFloat;
    DM1.cdsTDiario.Next;
  End;
  DM1.cdsTDiario.First;
  dbgPreCont.ColumnByName('PVSLBENNR').FooterValue := 'TOTALES S/.';
  dbgPreCont.ColumnByName('DEBE').FooterValue := FormatFloat('###,###.#0', debe);
  dbgPreCont.ColumnByName('HABER').FooterValue := FormatFloat('###,###.#0', haber);
  dbgPreCont.ColumnByName('DIF').FooterValue := FormatFloat('###,###.#0', dif);

  Screen.Cursor := crDefault;

  If DM1.cdsTDiario.RecordCount > 0 Then
  Begin
    btnresumen.Enabled     := True;
    btndetallado.Enabled   := True;
    btncontabiliza.Enabled := True;
   // Inicio: SPP_201403_PRE
    // MessageDlg(' Generación de cuenta Ok ', mtCustom, [mbOk], 0); HPC_201402_PRE
    xSql := 'DELETE PVS_DET_CON WHERE  NVL(DEBE,0) = 0 AND NVL(HABER,0) = 0';
    DM1.DCOM1.AppServer.EjecutaSql(xSql);    
    // Se actualiza los registros que no necesitan centro de costo.
    xSql := 'UPDATE PVS_DET_CON A SET A.CCOSID = (SELECT CASE WHEN NVL(B.CTA_CCOS,''N'') = ''S'' THEN A.CCOSID ELSE NULL END'
    +' FROM TGE202 B WHERE A.CUENTAID = B.CUENTAID AND B.CIAID = ''02'')';
    DM1.DCOM1.AppServer.EjecutaSql(xSQL);    
    MessageDlg(' Generación de cuenta Ok ', mtCustom, [mbOk], 0);
   // Fin: SPP_201403_PRE
  End
  Else
  Begin
    MessageDlg(' No existe información para procesar ', mtCustom, [mbOk], 0);
    btnresumen.Enabled     := False;
    btndetallado.Enabled   := False;
    btncontabiliza.Enabled := False;
    Exit;
  End;
End;

procedure TFNueCont.BitBtn1Click(Sender: TObject);
begin
  FNueCont.Close;
end;

procedure TFNueCont.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  begin
    Key := #0;
    Perform(CM_DIALOGKEY, VK_TAB, 0);
  end;
end;

procedure TFNueCont.btncontabilizaClick(Sender: TObject);
Var  xFecha, xSql, xWhere, xFecIni, xFecFin, xTipo, xanomes, xCNTComprob:String;
  xNumComp :Integer;
  montoori, montotipcam:Double;
begin
  xSql := 'SELECT * FROM CNT311PRE WHERE CNTCOMPROB =''''';
  DM1.cdsQry23.Close;
  DM1.cdsQry23.DataRequest(xSQL);
  DM1.cdsQry23.Open;
  xTipo := '27';
  xanomes := Copy(dbdtpinicio.Text,7,4)+Copy(dbdtpinicio.Text,4,2);
  xFecIni := Copy(dbdtpinicio.Text,7,4)+Copy(dbdtpinicio.Text,4,2)+Copy(dbdtpinicio.Text,1,2);
  xFecFin := Copy(dbdtpfinal.Text,7,4)+Copy(dbdtpfinal.Text,4,2)+Copy(dbdtpfinal.Text,1,2);
  If DM1.cdsTDiario.RecordCount = 0 Then
  Begin
    Beep;
    MessageDlg('No existe informaciòn para contabilizar'+#13+'Debe dar previo primero', mtInformation, [mbOk], 0);
    Exit;
  End;
  xSql := 'SELECT * FROM PVS_DET_CON';
  DM1.cdsQry18.Close;
  DM1.cdsQry18.DataRequest(xSql);
  DM1.cdsQry18.Open;
  //Inicio: SPP_201402_PRE
  // xWhere := 'TO_CHAR(CNTFEMIS, ''YYYYMMDD'') >= '+QuotedStr(xFecIni)+' AND TO_CHAR(CNTFEMIS, ''YYYYMMDD'') <= '+QuotedStr(xFecFin);
  xWhere := 'TO_CHAR(CNTFCOMP, ''YYYYMMDD'') >= '+QuotedStr(xFecIni)+' AND TO_CHAR(CNTFCOMP, ''YYYYMMDD'') <= '+QuotedStr(xFecFin)
  +' AND TDIARID = ''27'' AND CNTLOTE = ''PRE'' AND CIAID = ''02''';
  // Verifica si ya se generó el Asiento en el CNT311PRE
  // If Length(DM1.DisplayDescrip('prvSQL', 'CNT311PRE', '*', xWhere, 'CNTFEMIS')) > 0 Then
  If Length(DM1.DisplayDescrip('prvSQL', 'CNT300', '*', xWhere, 'CNTFCOMP')) > 0 Then
  Begin
     MessageDlg('Ya se Generaron los asientos para los dias '+xFecIni+' al '+xFecFin, mtInformation, [mbOk], 0);
     Exit;
  End;
// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
  xSQL := 'DELETE FROM CNT300PRE WHERE TO_CHAR(CNTFCOMP, ''YYYYMMDD'') >= '+QuotedStr(xFecIni)+' AND TO_CHAR(CNTFCOMP, ''YYYYMMDD'') <= '+QuotedStr(xFecFin)+' AND CNTLOTE = ''PRE''';
  DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
  xSQL := 'DELETE FROM CNT311PRE WHERE TO_CHAR(CNTFEMIS, ''YYYYMMDD'') >= '+QuotedStr(xFecIni)+' AND TO_CHAR(CNTFEMIS, ''YYYYMMDD'') <= '+QuotedStr(xFecFin)+' AND CNTLOTE = ''PRE''';
  DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
// Fin HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios

  Screen.Cursor := crHourGlass;

  //Fin: SPP_201402_PRE

  DM1.cdsQry18.DisableControls;
  //Genera Detalle
  DM1.cdsQry18.First;
  While Not DM1.cdsQry18.EOF do
  Begin
    If DM1.cdsQry18.FieldByName('DEBE').AsFloat > 0 Then
      montoori := DM1.cdsQry18.FieldByName('DEBE').AsFloat
    Else
      montoori := DM1.cdsQry18.FieldByName('HABER').AsFloat;
    xFecha := DateToStr(dbdtpfinal.Date);
    montotipcam := DM1.RecUltTipoCambio(xFecha);
    xWhere := 'FECHA ='+QuotedStr(DM1.cdsQry18.FieldByName('PVSLFECBE').AsString);
    DM1.DisplayDescrip('prvSQL', 'TGE114', 'FECHA, FECANO, FECTRIM, FECSEM, FECSS, FECAATRI, FECAASEM, FECAASS', xWhere, 'FECHA');
    DM1.cdsQry23.Append;
    DM1.cdsQry23.FieldByName('CIAID').AsString      := DM1.cdsQry18.FieldByName('CIAID').AsString;
    DM1.cdsQry23.FieldByName('GRUCON').AsString     := DM1.cdsQry18.FieldByName('GRUCON').AsString;
    DM1.cdsQry23.FieldByName('TDIARID').AsString    := xTipo;
    DM1.cdsQry23.FieldByName('CNTANO').AsString     := Copy(xanomes,1,4);
    DM1.cdsQry23.FieldByName('CNTANOMM').AsString   := xanomes;
    DM1.cdsQry23.FieldByName('CNTLOTE').AsString    := 'PRE';
    DM1.cdsQry23.FieldByName('CUENTAID').AsString   := DM1.cdsQry18.FieldByName('CUENTAID').AsString;
    DM1.cdsQry23.FieldByName('DOCID').AsString      := '17';
    DM1.cdsQry23.FieldByName('CNTSERIE').AsString   := '000';
    If DM1.cdsQry18.FieldByName('DEBE').AsFloat > 0 Then
       DM1.cdsQry23.FieldByName('CNTDH').AsString := 'D'
    Else
       DM1.cdsQry23.FieldByName('CNTDH').AsString := 'H';
    DM1.cdsQry23.FieldByName('CCOSID').AsString     := DM1.cdsQry18.FieldByName('CCOSID').AsString;
    DM1.cdsQry23.FieldByName('CNTTRI').AsString     := DM1.cdsQry.FieldByName('FECTRIM').AsString;
    DM1.cdsQry23.FieldByName('CNTSEM').AsString     := DM1.cdsQry.FieldByName('FECSEM').AsString;
    DM1.cdsQry23.FieldByName('CNTSS').AsString      := DM1.cdsQry.FieldByName('FECSS').AsString;
    DM1.cdsQry23.FieldByName('CNTAATRI').AsString   := DM1.cdsQry.FieldByName('FECAATRI').AsString;
    DM1.cdsQry23.FieldByName('CNTAASEM').AsString   := DM1.cdsQry.FieldByName('FECAASEM').AsString;
    DM1.cdsQry23.FieldByName('CNTAASS').AsString    := DM1.cdsQry.FieldByName('FECAASS').AsString;
    DM1.cdsQry23.FieldByName('DOCDES').AsString     := 'LIQUIDAC';
    DM1.cdsQry23.FieldByName('CNTTS').AsString      := 'OV';
    DM1.cdsQry23.FieldByName('MODULO').AsString     := DM1.wModulo;
    DM1.cdsQry23.FieldByName('CNTFEMIS').AsString   := DM1.cdsQry18.FieldByName('PVSLFECBE').AsString;
    DM1.cdsQry23.FieldByName('CNTFVCMTO').AsString  := DM1.cdsQry18.FieldByName('PVSLFECBE').AsString;
    DM1.cdsQry23.FieldByName('CNTFCOMP').AsString   := DM1.cdsQry18.FieldByName('PVSLFECBE').AsString;
    DM1.cdsQry23.FieldByName('CNTTCAMBIO').AsFloat  := montotipcam;
    DM1.cdsQry23.FieldByName('CNTMTOORI').AsFloat   := montoori;
    DM1.cdsQry23.FieldByName('CNTMTOLOC').AsFloat   := montoori;
    DM1.cdsQry23.FieldByName('CNTMTOEXT').AsFloat   := montoori/montotipcam;
    If DM1.cdsQry18.FieldByName('DEBE').AsFloat > 0 Then
    Begin
      DM1.cdsQry23.FieldByName('CNTDEBEMN').AsFloat  := montoori;
      DM1.cdsQry23.FieldByName('CNTDEBEME').AsFloat  := montoori/montotipcam;
    End
    Else
    Begin
      DM1.cdsQry23.FieldByName('CNTHABEMN').AsFloat  := montoori;
      DM1.cdsQry23.FieldByName('CNTHABEME').AsFloat  := montoori/montotipcam;
    End;
    DM1.cdsQry23.FieldByName('CNTSALDMN').AsFloat := 0;
    DM1.cdsQry23.FieldByName('CNTSALDME').AsFloat := 0;
    DM1.cdsQry23.FieldByName('TMONID').AsString   := 'N';
    DM1.cdsQry23.FieldByName('CNTNODOC').AsString := DM1.cdsQry18.FieldByName('CNTNODOC').AsString;
    DM1.cdsQry23.FieldByName('CNTGLOSA').AsString := DM1.cdsQry18.FieldByName('CNTGLOSA').AsString;
    DM1.cdsQry23.FieldByName('CNTUSER').AsString  := DM1.wUsuario;
    DM1.cdsQry23.FieldByName('CNTFREG').AsDateTime  := Date;
    DM1.cdsQry23.FieldByName('CNTHREG').AsDateTime  := Date+Time;
    DM1.cdsQry23.FieldByName('CNTESTADO').AsString  := 'I';
    DM1.cdsQry23.FieldByName('CNTCUADRE').AsString  := 'N';
    DM1.cdsQry23.FieldByName('CNTFAUTOM').AsString  := 'N';
    DM1.cdsQry23.FieldByName('CNTMM').AsString      := Copy(DM1.cdsQry18.FieldByName('PVSLFECBE').AsString,4,2);
    DM1.cdsQry23.FieldByName('CNTDD').AsString      := Copy(DM1.cdsQry18.FieldByName('PVSLFECBE').AsString,1,2);
    DM1.cdsQry23.FieldByName('FLAGVAR').AsString    := 'L';
    DM1.cdsQry23.FieldByName('TDIARDES').AsString   := 'EGRESOS BENEFICIOS';
    DM1.cdsQry23.FieldByName('CNTMODDOC').AsString  := 'PRE';
    DM1.AplicaDatos(DM1.cdsQry23, 'ASIENTOS');
    DM1.cdsQry18.Next;
  End;
  // Insertando número de comprobantes
  xSql := 'SELECT LPAD(MAX(CNTCOMPROB+1),10,''0'') CNTCOMPROB FROM CNT300'
  +' WHERE CIAID = ''02'' AND TDIARID = ''27'' AND CNTANOMM = '+QuotedStr(xanomes);
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  If Trim(DM1.cdsQry.FieldByName('CNTCOMPROB').AsString) = '' Then
    xCNTComprob := '0000000001'
  Else
    xCNTComprob := DM1.cdsQry.FieldByName('CNTCOMPROB').AsString;
// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
  xSql := 'SELECT TO_CHAR(CNTFCOMP, ''YYYYMMDD'') CNTFCOMP, GRUCON FROM CNT311PRE WHERE'
  +' TO_CHAR(CNTFCOMP, ''YYYYMMDD'') >= '+QuotedStr(xFecIni)+' AND TO_CHAR(CNTFCOMP, ''YYYYMMDD'') <= '+QuotedStr(xFecFin)
  +' AND CIAID = ''02'' AND TDIARID = ''27'' and CNTLOTE=''PRE'' GROUP BY TO_CHAR(CNTFCOMP, ''YYYYMMDD''), GRUCON';
// Fin  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  DM1.cdsQry.First;
  While Not DM1.cdsQry.Eof Do
  Begin
// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
    xSql := 'UPDATE CNT311PRE SET CNTCOMPROB = '+QuotedStr(xCNTComprob)
    +' WHERE CIAID = ''02'' AND TDIARID = ''27'' AND TO_CHAR(CNTFCOMP, ''YYYYMMDD'') = '+QuotedStr(DM1.cdsQry.FieldByName('CNTFCOMP').AsString) +' and CNTLOTE=''PRE''';
// Fin  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
    If DM1.cdsQry.FieldByName('GRUCON').AsString = '' Then
       xSql := xSql + ' AND GRUCON IS NULL'
    Else
       xSql := xSql + ' AND GRUCON = '+QuotedStr(DM1.cdsQry.FieldByName('GRUCON').AsString);
    DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
    xCNTComprob :=  DM1.StrZero(IntToStr(StrToInt(xCNTComprob)+1), 10);
    DM1.cdsQry.Next;
  End;
// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
  // Insertando en la cabecera de contabilizacion
  xSQL := 'INSERT INTO CNT300PRE ( CIAID, TDIARID, CNTANOMM, CNTCOMPROB, CNTLOTE, CNTGLOSA,'
  +' CNTTCAMBIO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTUSER, CNTFREG, CNTHREG, CNTANO,'
  +' CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID,'
  +' FLAGVAR, TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME,'
  +' CNTTS, DOCMOD, MODULO )'
  +' SELECT A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, A.CNTLOTE,'
  +' ''LIQUIDACION ''||A.CNTFCOMP CNTGLOSA,'
  +' MAX( NVL(A.CNTTCAMBIO, 0 )), A.CNTFCOMP, ''I'', ''N'', MAX(CNTUSER), MAX( CNTFREG ),'
  +' MAX( CNTHREG ), A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI, A.CNTSEM, A.CNTSS,'
  +' A.CNTAATRI, A.CNTAASEM, A.CNTAASS,'
  +' ''N'' TMONID, '' '', A.TDIARDES,'
  +' SUM(A.CNTDEBEMN), SUM(A.CNTDEBEME), SUM(A.CNTHABEMN), SUM(A.CNTHABEME),'
  +' MAX( CNTTS ), MAX( CNTMODDOC), MAX( MODULO )'
  +' FROM CNT311PRE A'
  +' WHERE A.TDIARID ='+QuotedStr(xtipo) + ' and A.CNTLOTE=''PRE'' '
  +' AND TO_CHAR(A.CNTFCOMP, ''YYYYMMDD'') > = '+QuotedStr(xFecIni)+' AND TO_CHAR(A.CNTFCOMP, ''YYYYMMDD'') <= '+QuotedStr(xFecFin)
  +' GROUP BY A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, A.CNTLOTE, A.CNTFCOMP, A.CNTANO,'
  +' A.CNTMM, A.CNTDD, A.CNTTRI,  A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS,'
  +' A.TDIARDES';
  DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
  // Cambiando la glosa del oficio
  xSql := 'SELECT CNTCOMPROB, CNTNODOC  FROM CNT311PRE WHERE TDIARID = ''27'' AND CNTANOMM = '+QuotedStr(xanomes) + ' and CNTLOTE=''PRE'' '
  +' AND SUBSTR(CNTNODOC,1,3) = ''OFI'' GROUP BY CNTCOMPROB, CNTNODOC';
// Fin  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  While Not DM1.cdsQry.Eof Do
  Begin
   xSql := 'UPDATE CNT300PRE SET CNTGLOSA = '+QuotedStr('OFICIO : '+Copy(DM1.cdsQry.FieldByName('CNTNODOC').AsString,4,7))
   +' WHERE TDIARID = ''27'' AND CNTANOMM = '+QuotedStr(xanomes)+' AND CNTCOMPROB = '+QuotedStr(DM1.cdsQry.FieldByName('CNTCOMPROB').AsString);
   DM1.DCOM1.AppServer.EjecutaSQL(xSql);
    DM1.cdsQry.Next;
  End;
  // Cambiando la glosa del cheque
// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
  xSql := 'SELECT CNTCOMPROB, CNTNODOC  FROM CNT311PRE WHERE TDIARID = ''27'' AND CNTANOMM = '+QuotedStr(xanomes) + ' and CNTLOTE=''PRE'' '
  +' AND SUBSTR(CNTNODOC,1,3) = ''CHE'' GROUP BY CNTCOMPROB, CNTNODOC';
// Fin  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  While Not DM1.cdsQry.Eof Do
  Begin
   xSql := 'UPDATE CNT300PRE SET CNTGLOSA = '+QuotedStr('CHEQUE : '+Copy(DM1.cdsQry.FieldByName('CNTNODOC').AsString,4,8))
   +' WHERE TDIARID = ''27'' AND CNTANOMM = '+QuotedStr(xanomes)+' AND CNTCOMPROB = '+QuotedStr(DM1.cdsQry.FieldByName('CNTCOMPROB').AsString);
   DM1.DCOM1.AppServer.EjecutaSQL(xSql);
    DM1.cdsQry.Next;
  End;
// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
  xSql := 'INSERT INTO CNT311 SELECT CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, DOCID, CNTSERIE,'
  +' CNTNODOC, CNTGLOSA, CNTDH, CCOSID, MAX(CNTTCAMBIO) CNTTCAMBIO, SUM(NVL(CNTMTOORI,0)) CNTMTOORI, SUM(NVL(CNTMTOLOC,0)) CNTMTOLOC,'
  +' SUM(NVL(CNTMTOEXT,0)) CNTMTOEXT, MAX(CNTFEMIS) CNTFEMIS, MAX(CNTFVCMTO) CNTFVCMTO, MAX(CNTFCOMP) CNTFCOMP, MAX(CNTESTADO) CNTESTADO,'
  +' MAX(CNTCUADRE) CNTCUADRE, MAX(CNTFAUTOM) CNTFAUTOM, MAX(CNTUSER) CNTUSER, MAX(CNTFREG) CNTFREG,  MAX(CNTHREG) CNTHREG, MAX(CNTMM) CNTMM,'
  +' MAX(CNTDD) CNTDD, MAX(CNTTRI) CNTTRI, MAX(CNTSEM) CNTSEM, MAX(CNTSS) CNTSS, MAX(CNTAATRI) CNTAATRI, MAX(CNTAASEM) CNTAASEM, MAX(CNTAASS) CNTAASS,'
  +' MAX(TMONID) TMONID, MAX(FLAGVAR) FLAGVAR, MAX(FCONS) FCONS, MAX(CNTFMEC) CNTFMEC, MAX(TDIARDES) TDIARDES, MAX(CTADES) CTADES, MAX(AUXDES) AUXDES,'
  +' MAX(DOCDES) DOCDES, MAX(CCOSDES) CCOSDES,  SUM(NVL(CNTDEBEMN,0)) CNTDEBEMN, SUM(NVL(CNTDEBEME,0)) CNTDEBEME, SUM(NVL(CNTHABEMN,0)) CNTHABEMN, SUM(NVL(CNTHABEME,0)) CNTHABEME,'
  +' SUM(NVL(CNTSALDMN,0)) CNTSALDMN, SUM(NVL(CNTSALDME,0)) CNTSALDME, MAX(CAMPOVAR) CAMPOVAR, MAX(CNTTS) CNTTS, MAX(CNTPAGADO) CNTPAGADO, MAX(CNTMODDOC) CNTMODDOC,  MAX(CNTREG) CNTREG,'
  +' MAX(MODULO) MODULO, MAX(CTA_SECU) CTA_SECU FROM CNT311PRE WHERE TDIARID = ''27'''
  +' AND TO_CHAR(CNTFCOMP, ''YYYYMMDD'') >= '+QuotedStr(xFecIni)+' AND TO_CHAR(CNTFCOMP, ''YYYYMMDD'') <= '+QuotedStr(xFecFin)
  +' AND CNTLOTE=''PRE'' '
  +' GROUP BY CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID';
  DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
  xSQL := 'INSERT INTO CNT300 SELECT * FROM CNT300PRE WHERE TDIARID = ''27'' '
  +' AND CNTLOTE=''PRE'' '
  +' AND TO_CHAR(CNTFCOMP, ''YYYYMMDD'') >= '+QuotedStr(xFecIni)+' AND TO_CHAR(CNTFCOMP, ''YYYYMMDD'') <= '+QuotedStr(xFecFin);
  DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
// Fin  HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
  // Enumerar por dia
  xSql := 'SELECT CNTCOMPROB FROM CNT300 WHERE CIAID = ''02'' AND TDIARID = ''27'' AND CNTANOMM = '+QuotedStr(xanomes);
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  DM1.cdsQry.First;
  While Not DM1.cdsQry.Eof Do
  Begin
    xSql := 'SELECT ROWID FROM CNT311 WHERE CIAID = ''02'' AND TDIARID = ''27'' AND CNTANOMM = '+QuotedStr(xanomes)+' AND CNTCOMPROB = '+QuotedStr(DM1.cdsQry.FieldByName('CNTCOMPROB').AsString)+' ORDER BY CUENTAID DESC';
    DM1.cdsMaestCartas.Close;
    DM1.cdsMaestCartas.DataRequest(xSql);
    DM1.cdsMaestCartas.Open;
    DM1.cdsMaestCartas.First;

    xNumComp := 1;
    While Not DM1.cdsMaestCartas.Eof Do
    Begin
      xSql := 'UPDATE CNT311 SET CNTREG = '+IntToStr(xnumComp)+' WHERE ROWID = '+QuotedStr(DM1.cdsMaestCartas.FieldByName('ROWID').AsString);
      DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
      xNumComp := xNumComp + 1;
      DM1.cdsMaestCartas.Next;
    End;
    DM1.cdsQry.Next;
  End;
  // Marcando en el PVS306 como contabilizado
  // Inicio: SPP_201303_PRE
  // xSql := 'UPDATE PVS306 SET CNTFLAG = ''I'' WHERE TO_CHAR(PVSLFECBE, ''YYYYMMDD'') >= '+QuotedStr(xFecIni)+' AND TO_CHAR(PVSLFECBE, ''YYYYMMDD'') <= '+QuotedStr(xFecFin)
  xSql := 'UPDATE PVS306 SET CNTFLAG = ''S'' WHERE TO_CHAR(PVSLFECBE, ''YYYYMMDD'') >= '+QuotedStr(xFecIni)+' AND TO_CHAR(PVSLFECBE, ''YYYYMMDD'') <= '+QuotedStr(xFecFin)
  // Fin: SPP_201303_PRE
  +' AND PVSESTLIQ IN (''02'', ''05'', ''06'') AND CNTFLAG IS NULL';
  DM1.DCOM1.AppServer.EjecutaSQL(xSQL);

  // Inicio: SPP_201303_PRE
  // xSql := 'UPDATE PVS307 SET CNTFLAG = ''I'' WHERE ROWID IN ('
  xSql := 'UPDATE PVS307 SET CNTFLAG = ''S'' WHERE ROWID IN ('
  // Fin: SPP_201303_PRE
  +' SELECT B.ROWID FROM PVS306 A, PVS307 B WHERE TO_CHAR(B.FECPAG, ''YYYYMMDD'') >= '+QuotedStr(xFecIni)
  +' AND TO_CHAR(B.FECPAG, ''YYYYMMDD'') <= '+QuotedStr(xFecFin)+' AND A.PVSESTLIQ IN (''02'', ''05'', ''06'')'
  +' AND A.PVSLBENNR = B.PVSLBENNR AND PVSLAGRID IN (''FPG'', ''RET'') AND FLGVOUCHER = ''N'' AND B.CNTFLAG IS NULL'
  +' AND (B.NROCHEQUE IS NOT NULL OR B.PVSLNOFC IS NOT NULL))';

  DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
  DM1.cdsQry18.EnableControls;
  Beep;
  MessageDlg('Asientos Contables Generados', mtCustom, [mbOk], 0);
  btncontabiliza.Enabled := False;
  Screen.Cursor := crDefault;

End;

procedure TFNueCont.btnresumenClick(Sender: TObject);
Var xSql:String;
begin
 // Inicio: SPP_201301_PRE
  Screen.Cursor := crHourGlass;
  If chkConAnt.Checked Then
     xSql := 'SELECT A.CUENTAID, B.CTADES TIPCREDES,  SUM(NVL(A.CNTDEBEMN,0)) DEBE, SUM(NVL(A.CNTHABEMN,0)) HABER FROM CNT301 A, TGE202 B'
     +' WHERE (CNTFEMIS >= '+QuotedStr(dbdtpinicio.Text)+ ' AND CNTFEMIS <= '+QuotedStr(dbdtpfinal.Text)+')'
     +' AND A.CIAID = ''02'' AND A.TDIARID = ''27'' AND B.CIAID = ''02'' AND A.CUENTAID = B.CUENTAID(+)'
     +' GROUP BY A.CUENTAID, B.CTADES ORDER BY A.CUENTAID, B.CTADES'
  Else
     xSql := 'SELECT CUENTAID, TIPCREDES, SUM(NVL(DEBE,0)) DEBE, SUM(NVL(HABER,0)) HABER  FROM PVS_DET_CON'
     +' GROUP BY CUENTAID, TIPCREDES ORDER BY CUENTAID';
  DM1.cdsReporte.Close;
  DM1.cdsReporte.DataRequest(xSql);
  DM1.cdsReporte.Open;
  Screen.Cursor := crDefault;
 // Fin: SPP_201301_PRE

  ppltitulo0101.Caption := '*** Resumen de transacciones del '+dbdtpinicio.Text+' al '+dbdtpfinal.Text+' ***';
  pplimppor.Caption := 'IMPRESO POR : '+ UpperCase(DM1.DevuelveValor('USERTABLE', 'USERNOM', 'USERID', DM1.wUsuario ));
  ppDBText3.AutoSize := True; // detalle debe
  ppDBText4.AutoSize := True; // detalle haber
  ppDBCalc1.AutoSize := True; // total debe
  ppDBCalc2.AutoSize := True; // total haber
  pprresumen.Print;
  pprresumen.Stop;
end;

procedure TFNueCont.btndetalladoClick(Sender: TObject);
Var xSql:String;
begin
 // Inicio: SPP_201301_PRE
  Screen.Cursor := crHourGlass;
  If chkConAnt.Checked Then
     xSql := 'SELECT A.CNTFEMIS PVSLFECBE, A.CUENTAID, B.CTADES TIPCREDES,  SUM(NVL(A.CNTDEBEMN,0)) DEBE, SUM(NVL(A.CNTHABEMN,0)) HABER'
     +' FROM CNT301 A, TGE202 B WHERE (A.CNTFEMIS >= '+QuotedStr(dbdtpinicio.Text)+' AND A.CNTFEMIS <= '+QuotedStr(dbdtpfinal.Text)+')'
     +' AND A.CIAID = ''02'' AND A.TDIARID = ''27'' AND  B.CIAID = ''02'' AND A.CUENTAID = B.CUENTAID(+)'
     +' GROUP BY A.CNTFEMIS, A.CUENTAID, B.CTADES ORDER BY A.CNTFEMIS'
  Else
     xSql := 'SELECT PVSLFECBE, CUENTAID, MAX(TIPCREDES) TIPCREDES, SUM(NVL(DEBE,0)) DEBE,  SUM(NVL(HABER,0)) HABER'
     +' FROM PVS_DET_CON GROUP BY PVSLFECBE, CUENTAID ORDER BY PVSLFECBE';
  DM1.cdsReporte.Close;
  DM1.cdsReporte.DataRequest(xSql);
  DM1.cdsReporte.Open;
  Screen.Cursor := crDefault;
 // Fin: SPP_201301_PRE
 
  ppltitulo02.Caption :='*** Resumido Diario del '+dbdtpinicio.Text+' al '+dbdtpfinal.Text+' ***';
  pplimppor02.Caption := 'IMPRESO POR : '+ UpperCase(DM1.DevuelveValor('USERTABLE', 'USERNOM', 'USERID', DM1.wUsuario ));
  pprdetalle.Print;
  pprdetalle.Stop;
end;

function TFNueCont.describecuenta(cnttipcredes: String): String;
Var xSql :String;
begin
  xSql := 'SELECT CTADES FROM TGE202 WHERE CIAID = ''02'' AND CUENTAID = '+QuotedStr(cnttipcredes);
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  Result := DM1.cdsQry.FieldByName('CTADES').AsString;
  Exit;
end;

// Inicio: SPP_201301_PRE
procedure TFNueCont.chkConAntClick(Sender: TObject);
begin
 DM1.cdsTDiario.Close;
 btnresumen.Enabled := False;
 btndetallado.Enabled := False;
end;
// Fin: SPP_201301_PRE
// Inicio: SPP_201403_PRE 
procedure TFNueCont.btnNoContabilizadoClick(Sender: TObject);
begin
   GroupBox1.Enabled := True;
   pnlNoContabilizado.Visible := False;
   btnPrevio.SetFocus;
end;
// Fin: SPP_201403_PRE 

End.


