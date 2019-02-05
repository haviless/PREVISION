unit PRE243;

interface

uses
  Windows, Controls, Grids, Wwdbigrd, Wwdbgrid, StdCtrls,Forms,SysUtils,
  Dialogs,wwdbdatetimepicker, Classes, Buttons, db, Graphics, ppDB,
  ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppBands,
  ppCache, ppCtrls, ppVar, ppPrnabl, ppParameter;
type
  TFNueCont02 = class(TForm)
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
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
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
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
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
  private
    { Private declarations }
    function centrodecosto(xpvslbennr:String):String;
    function describecuenta(cnttipcredes:String):String;
    procedure tipodebeneficio(xpvslbennr:String);

  public
    { Public declarations }
  end;

var
  FNueCont02: TFNueCont02;

implementation

uses PREDM, PRE245;

{$R *.dfm}

Function TFNueCont02.centrodecosto(xpvslbennr: String): String;
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

procedure TFNueCont02.tipodebeneficio(xpvslbennr: String);
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


Procedure TFNueCont02.FormActivate(Sender: TObject);
Begin
  btncontabiliza.Enabled := False;
  DM1.cdsTDiario.Close;
  dbgPreCont.Selected.Clear;
  dbgPreCont.Selected.Add('PVSLFECBE'#9'10'#9'Fecha de la~Liquidación'#9#9);
  dbgPreCont.Selected.Add('PVSLBENNR'#9'11'#9'Número de~Liquidación'#9#9);
  dbgPreCont.Selected.Add('DEBE'#9'9'#9'Cuenta del~Debe'#9#9);
  dbgPreCont.Selected.Add('HABER'#9'9'#9'Cuenta del~Haber'#9#9);
  dbgPreCont.Selected.Add('DIF'#9'9'#9'Errores en~Liquidación'#9#9);
  dbgPreCont.ApplySelected;
End;

Procedure TFNueCont02.dbgPreContCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
Begin
 If DM1.cdsTDiario.FieldByName('DIF').AsFloat <> 0 Then
 Begin
   AFont.Color := clRed;
 End;
End;

Procedure TFNueCont02.btnPrevioClick(Sender: TObject);
Var cnttipcredes, xSql, xfecini, xfecfin, xCCOSID, xCUENTAID, xCtaDes, cntnodoc, cntglosa, grucomc, flgliq, flgpag :String;
    debe, haber, dif, grucom : Double;
Begin
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
  xSql := 'DELETE FROM PVS_DET_CON';
  DM1.DCOM1.AppServer.EjecutaSql(xSql);
  xfecini := Copy(dbdtpinicio.Text,7,4)+Copy(dbdtpinicio.Text,4,2)+Copy(dbdtpinicio.Text,1,2);
  xfecfin := Copy(dbdtpfinal.Text,7,4)+Copy(dbdtpfinal.Text,4,2)+Copy(dbdtpfinal.Text,1,2);
  flgpag := 'N';
  flgliq := 'N';
  // Verificando si existe información para contabilizar
  xSql := 'SELECT COUNT(*) CUENTA FROM PVS306 WHERE TO_CHAR(PVSLFECBE, ''YYYYMMDD'') >= '+QuotedStr(xfecini)+' AND  TO_CHAR(PVSLFECBE, ''YYYYMMDD'') <= '+QuotedStr(xfecfin)
  +' AND PVSESTLIQ IN (''02'', ''05'') AND CNTFLAG IS NULL';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  If DM1.cdsQry.RecordCount = 0 Then flgliq := 'S';
  xSql := 'SELECT B.* FROM PVS306 A, PVS307 B WHERE TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') >= '+QuotedStr(xfecini)+' AND TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') <= '+QuotedStr(xfecfin)
  +' AND A.PVSESTLIQ IN (''02'', ''05'') AND A.PVSLBENNR = B.PVSLBENNR AND PVSLAGRID IN (''FPG'', ''RET'') '
  +' AND FLGVOUCHER = ''N'' AND B.CNTFLAG IS NULL AND (B.NROCHEQUE IS NOT NULL OR B.PVSLNOFC IS NOT NULL)';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  If DM1.cdsQry.RecordCount = 0 Then flgpag := 'S';
  If (flgpag = 'S') And (flgliq = 'S') Then
  Begin
    dbgPreCont.Refresh;
    MessageDlg('No existe información para contabilizar', mtCustom, [mbOk], 0);
    btnresumen.Enabled     := False;
    btndetallado.Enabled   := False;
    btncontabiliza.Enabled := False;
    Exit;
  End;

  btncontabiliza.Enabled := True;
  btnresumen.Enabled     := True;
  btndetallado.Enabled   := True;
  // ************************************ \\
  // Todo que va al Haber                 \\
  // Registros del pago de los beneficios \\
  // ************************************ \\
  xSql := 'SELECT B.CIAID, B.PVSLBENNR, B.PVSLTIPBE, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'') PVSLFECBE,  SUM(NVL(B.PVSLMONTO,0)) MONTO'
  +' FROM PVS306 A, PVS307 B'
  +' WHERE TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') >= '+QuotedStr(xfecini)+' AND  TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') <= '+QuotedStr(xfecfin)
  +' AND A.PVSESTLIQ IN (''02'', ''05'') AND A.CNTFLAG IS NULL AND A.PVSLBENNR = B.PVSLBENNR AND PVSLAGRID = ''DET'' AND B.TIPDES IS NULL'
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
    xCUENTAID := DM1.cdsTipBenef.FieldByName('CUENTAID').AsString;
    cnttipcredes := describecuenta(xCUENTAID);
    cntglosa := 'LIQUIDACION : '+DM1.cdsQry2.FieldByName('PVSLFECBE').AsString;
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
  // *************************************************** \\
  // Registros del diferencial de los uit - el beneficio \\
  // *************************************************** \\
  xSql := 'SELECT B.CIAID, B.PVSLBENNR, B.PVSLTIPBE, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'') PVSLFECBE,  SUM(NVL(B.PVSLMONTO,0)) MONTO'
  +' FROM PVS306 A, PVS307 B'
  +' WHERE TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') >= '+QuotedStr(xfecini)+' AND  TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') <= '+QuotedStr(xfecfin)
  +' AND A.PVSESTLIQ IN (''02'', ''05'') AND A.CNTFLAG IS NULL AND A.PVSLBENNR = B.PVSLBENNR AND PVSLAGRID = ''DET'' AND TIPDES IS NOT NULL'
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
    cntglosa := 'LIQUIDACION : '+DM1.cdsQry2.FieldByName('PVSLFECBE').AsString;
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
  // ************************************************* \\
  // Inserción de registros de devoluciones de aportes \\
  // ************************************************* \\
  xSql := 'SELECT B.CIAID, B.PVSLBENNR, B.PVSLTIPBE, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'') PVSLFECBE, SUM(NVL(B.PVSLMONTO,0)) MONTO'
  +' FROM PVS306 A, PVS307 B'
  +' WHERE TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') >= '+QuotedStr(xfecini)+' AND TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') <= '+QuotedStr(xfecfin)
  +' AND A.PVSESTLIQ IN (''02'', ''05'') AND A.CNTFLAG IS NULL AND A.PVSLBENNR = B.PVSLBENNR AND PVSLAGRID = ''DEV'''
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
    cntglosa := 'LIQUIDACION : '+DM1.cdsQry2.FieldByName('PVSLFECBE').AsString;
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
  +' AND A.PVSESTLIQ IN (''02'', ''05'') AND A.CNTFLAG IS NULL AND A.PVSLBENNR = B.PVSLBENNR AND PVSLAGRID = ''DSC'' AND TIPDES IS NULL AND SUBSTR(PVSLCONCE,1,4) = ''PAGO'''
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
    cntglosa := 'LIQUIDACION : '+DM1.cdsQry2.FieldByName('PVSLFECBE').AsString;
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
  +' AND A.PVSESTLIQ IN (''02'', ''05'') AND A.CNTFLAG IS NULL AND A.PVSLBENNR = B.PVSLBENNR AND PVSLAGRID = ''DSC'''
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
    cntglosa := 'LIQUIDACION : '+DM1.cdsQry2.FieldByName('PVSLFECBE').AsString;
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
  +' AND A.PVSESTLIQ IN (''02'', ''05'') AND A.CNTFLAG IS NULL AND A.PVSLBENNR = B.PVSLBENNR AND PVSLAGRID = ''DSC'''
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

  {
    xCCOSID := centrodecosto(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString);
    tipodebeneficio(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString);
    cntnodoc := Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,7,4)+Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,4,2)+Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,1,2);
    cntglosa := 'LIQUIDACION : '+DM1.cdsQry2.FieldByName('PVSLFECBE').AsString;
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
  }

    tipodebeneficio(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString);
    cntnodoc := Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,7,4)+Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,4,2)+Copy(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString,1,2);
    cntglosa := 'LIQUIDACION : '+DM1.cdsQry2.FieldByName('PVSLFECBE').AsString;
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
  +' AND A.PVSESTLIQ IN (''02'', ''05'') AND A.CNTFLAG IS NULL AND A.PVSLBENNR = B.PVSLBENNR AND PVSLAGRID = ''DSC'''
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
    cntglosa := 'LIQUIDACION : '+DM1.cdsQry2.FieldByName('PVSLFECBE').AsString;
    //Buscando el monto cobrado por creditos
    xSql := 'SELECT CREDID, SUM(NVL(CREAMORT,0)) CREAMORT, SUM(NVL(CREINTERES,0)) CREINTERES, SUM(NVL(CREFLAT ,0)) CREFLAT'
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
      DM1.cdsCuotas.Next;
    End;
    DM1.cdsQry2.Next;
  End;
  // ******************************************* \\
  // Inserción de los registros de forma de pago \\
  // ******************************************* \\
  xSql := 'SELECT A.PVSLBENNR, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'') PVSLFECBE, A.PVSLTIPBE, B.BANCOID, B.FORPAGOID, B.PVSLNOFC, B.NROCHEQUE, B.PVSNOMBRE,'
  +' SUM(NVL(B.PVSLMONTO,0)) MONTO FROM PVS306 A, PVS307 B WHERE TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') >= '+QuotedStr(xfecini)
  +' AND TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') <= '+QuotedStr(xfecfin)
  +' AND A.PVSESTLIQ IN (''02'', ''05'') AND A.CNTFLAG IS NULL AND A.PVSLBENNR = B.PVSLBENNR AND PVSLAGRID IN (''FPG'', ''RET'') '
  +' AND B.FLGVOUCHER = ''N'' GROUP BY A.PVSLBENNR, A.PVSLFECBE, A.PVSLTIPBE, B.BANCOID, B.FORPAGOID, B.PVSLNOFC, B.NROCHEQUE, B.PVSNOMBRE';
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
    xCUENTAID := '4691207';
    cnttipcredes := describecuenta(xCUENTAID);
    cntnodoc := 'EXP: '+Copy(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString,5,7);
    cntglosa := DM1.cdsQry2.FieldByName('PVSNOMBRE').AsString;
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
  // ***************************** \\
  // Conrolando pagos realizados   \\
  // ***************************** \\
  xSql := 'SELECT A.PVSLBENNR, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'') PVSLFECBE, A.PVSLTIPBE, B.BANCOID, B.FORPAGOID, B.PVSLNOFC, B.NROCHEQUE, B.PVSNOMBRE,'
  +' SUM(NVL(B.PVSLMONTO,0)) MONTO FROM PVS306 A, PVS307 B WHERE TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') >= '+QuotedStr(xfecini)
  +' AND TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') <= '+QuotedStr(xfecfin)
  +' AND A.PVSESTLIQ IN (''02'', ''05'') AND A.PVSLBENNR = B.PVSLBENNR AND B.PVSLAGRID IN (''FPG'', ''RET'') '
  +' AND B.FLGVOUCHER = ''N'' AND B.CNTFLAG IS NULL AND (B.NROCHEQUE IS NOT NULL OR B.PVSLNOFC IS NOT NULL) GROUP BY A.PVSLBENNR, A.PVSLFECBE, A.PVSLTIPBE, B.BANCOID, B.FORPAGOID, B.PVSLNOFC, B.NROCHEQUE, B.PVSNOMBRE';
  DM1.cdsQry2.Close;
  DM1.cdsQry2.DataRequest(xSql);
  DM1.cdsQry2.Open;
  DM1.cdsQry2.First;
  grucom := 0;
  While Not DM1.cdsQry2.Eof Do
  Begin
     grucom := grucom + 1;
     grucomc := DM1.StrZero(FloatToStr(grucom),2);
    // ************************* \\
    // Sub cuenta detallado Debe \\
    // ************************* \\
    xCUENTAID := '4691207';
    cnttipcredes := describecuenta(xCUENTAID);
    xCtaDes := 'BENEFICIOS POR PAGAR DOCENTES';
    cntnodoc := 'EXP: '+Copy(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString,5,7);
    cntglosa := DM1.cdsQry2.FieldByName('PVSNOMBRE').AsString;
    xSql := 'INSERT INTO PVS_DET_CON(CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE,'
    +' BENEFDES, CCOSID, CUENTAID, TIPCREDES, DEBE, HABER, CNTNODOC, CNTGLOSA, GRUCOM)'
    +' VALUES (''02'''
    +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLFECBE').AsString)
    +','+QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)
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
    If DM1.cdsQry2.FieldByName('FORPAGOID').AsString = '01' Then
    Begin
      xCUENTAID := '104010301';
      cnttipcredes := describecuenta(xCUENTAID);
      cntnodoc := 'Che.: '+DM1.cdsQry2.FieldByName('NROCHEQUE').AsString;
      cntglosa := DM1.cdsQry2.FieldByName('PVSNOMBRE').AsString;
    End;
    If DM1.cdsQry2.FieldByName('FORPAGOID').AsString = '11' Then
    Begin
      xCUENTAID := '104010301';
      cnttipcredes := describecuenta(xCUENTAID);
      cntnodoc := 'Ofi.: '+DM1.cdsQry2.FieldByName('PVSLNOFC').AsString;
      cntglosa := DM1.cdsQry2.FieldByName('PVSNOMBRE').AsString;
    End;
    If DM1.cdsQry2.FieldByName('FORPAGOID').AsString = '05' Then
    Begin
      xCUENTAID := '104010401';
      cnttipcredes := describecuenta(xCUENTAID);
      cntnodoc := 'Ofi.: '+DM1.cdsQry2.FieldByName('PVSLNOFC').AsString;
      cntglosa := DM1.cdsQry2.FieldByName('PVSNOMBRE').AsString;
    End;
    xSql := 'INSERT INTO PVS_DET_CON(CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE,'
    +' BENEFDES, CCOSID, CUENTAID, TIPCREDES, DEBE, HABER, CNTNODOC, CNTGLOSA, GRUCOM)'
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
  If DM1.cdsTDiario.RecordCount > 0 Then
  Begin
    MessageDlg(' Generación de cuenta Ok ', mtCustom, [mbOk], 0);
    xSql := 'DELETE PVS_DET_CON WHERE  NVL(DEBE,0) = 0 AND NVL(HABER,0) = 0';
    DM1.DCOM1.AppServer.EjecutaSql(xSql);
  End
  Else
   MessageDlg(' No existe información para procesar ', mtCustom, [mbOk], 0);
End;


procedure TFNueCont02.BitBtn1Click(Sender: TObject);
begin
  FNueCont02.Close;
end;

procedure TFNueCont02.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  begin
    Key := #0;
    Perform(CM_DIALOGKEY, VK_TAB, 0);
  end;
end;

procedure TFNueCont02.btncontabilizaClick(Sender: TObject);
Var  xFecha, xSql, xWhere, xFecIni, xFecFin, xTipo, xanomes, xCNTComprob:String; //xFeccam
  xNumComp, xitem :Integer;
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
  xWhere := 'TO_CHAR(CNTFEMIS, ''YYYYMMDD'') >= '+QuotedStr(xFecIni)+' AND TO_CHAR(CNTFEMIS, ''YYYYMMDD'') <= '+QuotedStr(xFecFin);
  //Verifica si ya se generó el Asiento en el CNT311PRE
  If Length(DM1.DisplayDescrip('prvSQL', 'CNT311PRE', '*', xWhere, 'CNTFEMIS')) > 0 Then
  Begin
    Beep;
    MessageDlg('Ya se Generararon los Asientos para los dias '+xFecIni+' al '+xFecFin, mtInformation, [mbOk], 0);
    If MessageDlg('Desea Generar Asientos Contables ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
    Begin
      Screen.Cursor := crHourGlass;
      xSQL := 'DELETE FROM CNT300PRE WHERE TO_CHAR(CNTFCOMP, ''YYYYMMDD'') >= '+QuotedStr(xFecIni)+' AND TO_CHAR(CNTFCOMP, ''YYYYMMDD'') <= '+QuotedStr(xFecFin);
      DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
      xSQL := 'DELETE FROM CNT311PRE WHERE TO_CHAR(CNTFEMIS, ''YYYYMMDD'') >= '+QuotedStr(xFecIni)+' AND TO_CHAR(CNTFEMIS, ''YYYYMMDD'') <= '+QuotedStr(xFecFin);
      DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
    End
    Else Exit;
  End;
  Screen.Cursor := crHourGlass;
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
    DM1.cdsQry23.FieldByName('GRUCOM').AsString     := DM1.cdsQry18.FieldByName('GRUCOM').AsString;
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

  xSql := 'SELECT TO_CHAR(CNTFCOMP, ''YYYYMMDD'') CNTFCOMP, GRUCOM FROM CNT311PRE WHERE'
  +' TO_CHAR(CNTFCOMP, ''YYYYMMDD'') >= '+QuotedStr(xFecIni)+' AND TO_CHAR(CNTFCOMP, ''YYYYMMDD'') <= '+QuotedStr(xFecFin)
  +' AND CIAID = ''02'' AND TDIARID = ''27'' GROUP BY TO_CHAR(CNTFCOMP, ''YYYYMMDD''), GRUCOM';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;

  DM1.cdsQry.First;
  While Not DM1.cdsQry.Eof Do
  Begin
    xSql := 'UPDATE CNT311PRE SET CNTCOMPROB = '+QuotedStr(xCNTComprob)
    +' WHERE CIAID = ''02'' AND TDIARID = ''27'' AND TO_CHAR(CNTFCOMP, ''YYYYMMDD'') = '+QuotedStr(DM1.cdsQry.FieldByName('CNTFCOMP').AsString);
    If DM1.cdsQry.FieldByName('GRUCOM').AsString = '' Then
       xSql := xSql + ' AND GRUCOM IS NULL'
    Else
       xSql := xSql + ' AND GRUCOM = '+QuotedStr(DM1.cdsQry.FieldByName('GRUCOM').AsString);
    DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
    xCNTComprob :=  DM1.StrZero(IntToStr(StrToInt(xCNTComprob)+1), 10);
    DM1.cdsQry.Next;
  End;
  // Enumerar por dia
  xSql := 'SELECT TO_CHAR(CNTFCOMP, ''YYYYMMDD'') CNTFCOMP'
  +' FROM CNT311PRE WHERE CIAID = ''02'' AND TDIARID = ''27'''
  +' AND CNTANOMM = ''200510'' AND TO_CHAR(CNTFCOMP, ''YYYYMMDD'') >= '+QuotedStr(xFecIni)+' AND  TO_CHAR(CNTFCOMP, ''YYYYMMDD'') <= '+QuotedStr(xFecFin)+' GROUP BY TO_CHAR(CNTFCOMP, ''YYYYMMDD'')';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  DM1.cdsQry.First;
  While Not DM1.cdsQry.Eof Do
  Begin
    xSql := 'SELECT * FROM CNT311PRE WHERE TO_CHAR(CNTFCOMP, ''YYYYMMDD'') = '+QuotedStr(DM1.cdsQry.FieldByName('CNTFCOMP').AsString);
    DM1.cdsQry15.Close;
    DM1.cdsQry15.DataRequest(xSql);
    DM1.cdsQry15.Open;
    xNumComp := 1;
    While Not DM1.cdsQry15.Eof Do
    Begin
      DM1.cdsQry15.Edit;
      DM1.cdsQry15.FieldByName('CNTREG').AsInteger := xNumComp;
      DM1.cdsQry15.ApplyUpdates(0);
      xNumComp := xNumComp + 1;
      DM1.cdsQry15.Next;
    End;
    DM1.cdsQry.Next;
  End;

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
  +' WHERE A.TDIARID ='+QuotedStr(xtipo)
  +' AND TO_CHAR(A.CNTFCOMP, ''YYYYMMDD'') > = '+QuotedStr(xFecIni)+' AND TO_CHAR(A.CNTFCOMP, ''YYYYMMDD'') <= '+QuotedStr(xFecFin)
  +' GROUP BY A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, A.CNTLOTE, A.CNTFCOMP, A.CNTANO,'
  +' A.CNTMM, A.CNTDD, A.CNTTRI,  A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS,'
  +' A.TDIARDES';
  DM1.DCOM1.AppServer.EjecutaSQL(xSQL);

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
  +' GROUP BY CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID';
  DM1.DCOM1.AppServer.EjecutaSQL(xSQL);

  xSql := 'SELECT * FROM CNT311 WHERE TDIARID = ''27'''
  +' AND TO_CHAR(CNTFCOMP, ''YYYYMMDD'') >= '+QuotedStr(xFecIni)+' AND TO_CHAR(CNTFCOMP, ''YYYYMMDD'') <= '+QuotedStr(xFecFin)
  +' ORDER BY CUENTAID';
  DM1.cdsMaestCartas.Close;
  DM1.cdsMaestCartas.DataRequest(xSql);
  DM1.cdsMaestCartas.Open;
  DM1.cdsMaestCartas.First;
  xitem := 0;
  While Not DM1.cdsMaestCartas.Eof Do
  Begin
    xitem := xitem + 1;
    DM1.cdsMaestCartas.Edit;
    DM1.cdsMaestCartas.FieldByName('CNTREG').AsInteger := xitem;
    DM1.cdsMaestCartas.ApplyUpdates(0);
    DM1.cdsMaestCartas.Next;
  End;
  xSQL := 'INSERT INTO CNT300 SELECT * FROM CNT300PRE WHERE TDIARID = ''27'' '
  +' AND TO_CHAR(CNTFCOMP, ''YYYYMMDD'') >= '+QuotedStr(xFecIni)+' AND TO_CHAR(CNTFCOMP, ''YYYYMMDD'') <= '+QuotedStr(xFecFin);
  DM1.DCOM1.AppServer.EjecutaSQL(xSQL);


  // Marcando en el PVS306 como contabilizado
  xSql := 'UPDATE PVS306 SET CNTFLAG = ''I'' WHERE TO_CHAR(PVSLFECBE, ''YYYYMMDD'') >= '+QuotedStr(xFecIni)+' AND TO_CHAR(PVSLFECBE, ''YYYYMMDD'') <= '+QuotedStr(xFecFin)
  +' AND PVSESTLIQ IN (''02'', ''05'') AND CNTFLAG IS NULL';
  DM1.DCOM1.AppServer.EjecutaSQL(xSQL);

  // Marcando Formas de pago del PVS307 como contabilizados
  xSql := 'UPDATE PVS307 SET CNTFLAG = ''I'' WHERE ROWID IN ('
  +' SELECT B.ROWID FROM PVS306 A, PVS307 B WHERE TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') >= '+QuotedStr(xFecIni)
  +' AND TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') <= '+QuotedStr(xFecFin)+' AND A.PVSESTLIQ IN (''02'', ''05'')'
  +' AND A.PVSLBENNR = B.PVSLBENNR AND PVSLAGRID IN (''FPG'', ''RET'') AND FLGVOUCHER = ''N'' AND B.CNTFLAG IS NULL'
  +' AND (B.NROCHEQUE IS NOT NULL OR B.PVSLNOFC IS NOT NULL))';
  DM1.DCOM1.AppServer.EjecutaSQL(xSQL);

  DM1.cdsQry18.EnableControls;
  Beep;
  MessageDlg('Asientos Contables Generados', mtCustom, [mbOk], 0);
  btncontabiliza.Enabled := False;
  Screen.Cursor := crDefault;
end;

procedure TFNueCont02.btnresumenClick(Sender: TObject);
Var xSql:String;
begin
  xSql := 'SELECT CUENTAID, TIPCREDES, SUM(NVL(DEBE,0)) DEBE, SUM(NVL(HABER,0)) HABER  FROM PVS_DET_CON'
  +' GROUP BY CUENTAID, TIPCREDES ORDER BY CUENTAID';
  DM1.cdsReporte.Close;
  DM1.cdsReporte.DataRequest(xSql);
  DM1.cdsReporte.Open;
  ppltitulo0101.Caption := '*** Resumen de transacciones del '+dbdtpinicio.Text+' al '+dbdtpfinal.Text+' ***';
  pplimppor.Caption := 'IMPRESO POR : '+ UpperCase(DM1.DevuelveValor('USERTABLE', 'USERNOM', 'USERID', DM1.wUsuario ));
  pprresumen.Print;
  pprresumen.Stop;
end;

procedure TFNueCont02.btndetalladoClick(Sender: TObject);
Var xSql:String;
begin
  xSql := 'SELECT PVSLFECBE, CUENTAID, MAX(TIPCREDES) TIPCREDES, SUM(NVL(DEBE,0)) DEBE,  SUM(NVL(HABER,0)) HABER'
  +' FROM PVS_DET_CON GROUP BY PVSLFECBE, CUENTAID ORDER BY PVSLFECBE';
  DM1.cdsReporte.Close;
  DM1.cdsReporte.DataRequest(xSql);
  DM1.cdsReporte.Open;
  ppltitulo02.Caption :='*** Resumido Diario del '+dbdtpinicio.Text+' al '+dbdtpfinal.Text+' ***';
  pplimppor02.Caption := 'IMPRESO POR : '+ UpperCase(DM1.DevuelveValor('USERTABLE', 'USERNOM', 'USERID', DM1.wUsuario ));
  pprdetalle.Print;
  pprdetalle.Stop;
end;

function TFNueCont02.describecuenta(cnttipcredes: String): String;
Var xSql :String;
begin
  xSql := 'SELECT CTADES FROM TGE202 WHERE CIAID = ''02'' AND CUENTAID = '+QuotedStr(cnttipcredes);
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  Result := DM1.cdsQry.FieldByName('CTADES').AsString;
  Exit;
end;

End.


