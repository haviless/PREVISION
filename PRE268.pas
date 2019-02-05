unit PRE268;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, wwdblook, wwdbdatetimepicker, Mask, ExtCtrls,
  Grids, Wwdbigrd, Wwdbgrid, ppProd, ppClass, ppReport, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE, ppBands, ppCache, DB, DBClient, ppCtrls, ppVar,
  ppPrnabl, DBGrids;

type
  TFrepxtipbenCon = class(TForm)
    GroupBox1: TGroupBox;
    dbdtpinicial: TwwDBDateTimePicker;
    dbdtpfinal: TwwDBDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    btnimprimir: TBitBtn;
    btnaexcel: TBitBtn;
    btncerrar: TBitBtn;
    bdeprepxtipben: TppBDEPipeline;
    btnImprimePrevio: TBitBtn;
    dbgliqben: TwwDBGrid;
    cdsbeneficios: TClientDataSet;
    dsbeneficios: TDataSource;
    pprtodos: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel23: TppLabel;
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
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppShape8: TppShape;
    ppShape10: TppShape;
    ppShape11: TppShape;
    ppShape12: TppShape;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppSummaryBand1: TppSummaryBand;
    ppLine1: TppLine;
    ppDBCalc3: TppDBCalc;
    pplimpresopor: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    pplcantidad: TppLabel;
    dtgData: TDBGrid;
    ppDBText5: TppDBText;
    ppDBText9: TppDBText;
    ppLabel5: TppLabel;
    ppShape3: TppShape;
    ppLabel6: TppLabel;
    ppShape4: TppShape;
    ppLabel13: TppLabel;
    ppLine2: TppLine;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppLine3: TppLine;
    ppShape9: TppShape;
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btncerrarClick(Sender: TObject);
    procedure btnImprimePrevioClick(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure btnaexcelClick(Sender: TObject);
  private
    xSql, xfecini, xfecfin :String;
    monben, ajuben, imppag: Double;
    canret, monret, canfal, monfal, caninv, moninv : Double;


    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrepxtipbenCon: TFrepxtipbenCon;

implementation

uses PREDM, PRE238;

{$R *.dfm}

procedure TFrepxtipbenCon.FormActivate(Sender: TObject);
Var xSql:String;
begin
  dbdtpinicial.Date := DM1.FechaSys;
  dbdtpfinal.Date   := DM1.FechaSys;
  dbdtpinicial.SetFocus;
end;



procedure TFrepxtipbenCon.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  begin
    Key := #0;
    Perform(CM_DIALOGKEY, VK_TAB, 0);
  end;
end;


procedure TFrepxtipbenCon.btncerrarClick(Sender: TObject);
begin
  FrepxtipbenCon.Close;
end;

procedure TFrepxtipbenCon.btnImprimePrevioClick(Sender: TObject);
Var xSql:String;
begin
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
    dbdtpInicial.SetFocus;
    Exit;
  End;
  xfecini := Copy(dbdtpinicial.Text,7,4)+Copy(dbdtpinicial.Text,4,2)+Copy(dbdtpinicial.Text,1,2);
  xfecfin := Copy(dbdtpfinal.Text,7,4)+Copy(dbdtpfinal.Text,4,2)+Copy(dbdtpfinal.Text,1,2);
  xSql := 'SELECT A.ASOID, A.PVSLTIPBE, A.PVSLFECBE, A.PVSLBENNR, A.ASOCODMOD, A.ASOAPENOMDNI,  C.BENEFDES, D.DPTODES, '
  +' (SELECT SUM(NVL(PVSLMONTO,0)) FROM PVS307 WHERE PVSLBENNR = A.PVSLBENNR AND PVSLAGRID = ''DET'') MONBEN,'
  +' (SELECT SUM(NVL(PVSLMONTO,0)) FROM PVS307 WHERE PVSLBENNR = A.PVSLBENNR AND PVSLAGRID = ''DET'')-(SELECT SUM(NVL(PVSLMONTO,0)) FROM PVS307 WHERE PVSLBENNR = A.PVSLBENNR AND PVSLAGRID IN (''FPG'', ''RET'') AND FLGVOUCHER = ''N'') AJUSTE,'
  +' (SELECT SUM(NVL(PVSLMONTO,0)) FROM PVS307 WHERE PVSLBENNR = A.PVSLBENNR AND PVSLAGRID IN (''FPG'', ''RET'') AND FLGVOUCHER = ''N'') MONPAG, E.NROCHEQUE, E.PVSLNOFC, E.FECPAG FROM'
  +' PVS306 A, PVS301 B, TGE186 C, APO158 D, PVS307 E WHERE TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') >= '+QuotedStr(xfecini)+' AND TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'')  <= '+QuotedStr(xfecfin)+' AND A.PVSLBENNR = E.PVSLBENNR AND E.PVSLAGRID IN (''FPG'', ''RET'')'
  +' AND E.FLGVOUCHER = ''N'' AND A.PVSESTLIQ IN (''02'', ''05'', ''06'') AND A.ASOID = B.ASOID(+) AND A.PVSLTIPBE = C.TIPBENEF(+) AND SUBSTR(B.DISORIEXP, 1,2) = D.DPTOID(+)'
  +' UNION'
  +' SELECT ASOID, PVSLTIPBE, PVSLFECBE, PVSLBENNR, ASOCODMOD, ASOAPENOMDNI, C.BENEFDES, B.PVSESTDES DPTODES, 0 MONBEN, 0 AJUSTE, 0 MONPAG, '' '' NROCHEQUE, '' '' PVSLNOFC,'
  +' TO_DATE(NULL) FECPAG FROM PVS306 A, PVS102 B, TGE186 C WHERE A.PVSESTLIQ = B.PVSESTDSG AND B.PVSDOC = ''L'' AND A.PVSLTIPBE = C.TIPBENEF'
  +' AND TO_CHAR(PVSLFECBE, ''YYYYMMDD'') >= '+QuotedStr(xfecini)+' AND TO_CHAR(PVSLFECBE, ''YYYYMMDD'')  <= '+QuotedStr(xfecfin)
  +' AND PVSESTLIQ NOT IN (''02'', ''05'', ''06'') ORDER BY PVSLBENNR, PVSLTIPBE';
  DM1.cdsReporte.Close;
  DM1.cdsReporte.DataRequest(xSql);
  DM1.cdsReporte.Open;

  xSql := 'SELECT COUNT(*) CANTIDAD FROM PVS306 WHERE '
  +' TO_CHAR(PVSLFECBE, ''YYYYMMDD'') >= '+QuotedStr(xfecini)+' AND TO_CHAR(PVSLFECBE, ''YYYYMMDD'')  <= '+QuotedStr(xfecfin);
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  pplcantidad.Caption := IntToStr(DM1.cdsQry.FieldByName('CANTIDAD').AsInteger);
  cdsbeneficios.EmptyDataSet;
  DM1.cdsReporte.First;
  While Not DM1.cdsReporte.Eof Do
  Begin
    monben := monben + DM1.cdsReporte.FieldByName('MONBEN').AsFloat;
    ajuben := ajuben + DM1.cdsReporte.FieldByName('AJUSTE').AsFloat;
    imppag := imppag + DM1.cdsReporte.FieldByName('MONPAG').AsFloat;
    xSql := 'SELECT * FROM PVS306 WHERE PVSLBENNR = '+QuotedStr(DM1.cdsReporte.FieldByname('PVSLBENNR').AsString);
    DM1.cdsQry.Close;
    DM1.cdsQry.DataRequest(xSql);
    DM1.cdsQry.Open;
    cdsbeneficios.Append;
    cdsbeneficios.FieldByName('PVSLFECBE').AsDateTime  := DM1.cdsQry.FieldByName('PVSLFECBE').AsDateTime;
    cdsbeneficios.FieldByName('PVSLBENNR').AsString    := DM1.cdsQry.FieldByname('PVSLBENNR').AsString;
    cdsbeneficios.FieldByName('ASOAPENOMBEN').AsString := DM1.cdsQry.FieldByname('ASOAPENOMDNI').AsString;
    cdsbeneficios.FieldByName('MONBEN').AsFloat        := DM1.cdsReporte.FieldByName('MONBEN').AsFloat;
    cdsbeneficios.FieldByName('AJUBEN').AsFloat        := DM1.cdsReporte.FieldByName('AJUSTE').AsFloat;
    cdsbeneficios.FieldByName('TIPPAG').AsString       := DM1.cdsReporte.FieldByName('DPTODES').AsString;
    If (DM1.cdsQry.FieldByName('PVSESTLIQ').AsString = '02') Or (DM1.cdsQry.FieldByName('PVSESTLIQ').AsString = '05') Or (DM1.cdsQry.FieldByName('PVSESTLIQ').AsString = '06') Then
    Begin
      // Tipo de beneficio
      xSql := 'SELECT BENEFABR FROM TGE186 WHERE TIPBENEF = '+QuotedStr(DM1.cdsQry.FieldByName('PVSLTIPBE').AsString);
      DM1.cdsQry2.Close;
      DM1.cdsQry2.DataRequest(xSql);
      DM1.cdsQry2.Open;
      cdsbeneficios.FieldByName('BENEFICIO').AsString := DM1.cdsQry2.FieldByName('BENEFABR').AsString;
      // Tipo de pago
      // Primero se cuenta cuantos beneficiarios existen. Si existe solo uno se actualizan los datos
      // del pago en el mismo registro. En caso que sean mas de un beneficiario si van ha añadir un registro por cada beneficiario
      xSql := 'SELECT PVSLBENNR, FORPAGOID, BANCOID, AGENBCOID, PVSNOMBRE, SUM(NVL(PVSLMONTO,0)) PVSLMONTO'
      +' FROM PVS307 WHERE PVSLBENNR = '+QuotedStr(DM1.cdsReporte.FieldByName('PVSLBENNR').AsString)+' AND PVSLAGRID = ''FPG'' AND FLGVOUCHER = ''N'''
      +' GROUP BY PVSLBENNR, FORPAGOID, BANCOID, AGENBCOID, PVSNOMBRE';
      DM1.cdsQry2.Close;
      DM1.cdsQry2.DataRequest(xSql);
      DM1.cdsQry2.Open;
      // Si solo hay un beneficiario
      If DM1.cdsQry.FieldByName('PVSCOBASO').AsString = 'S' Then
      Begin
        cdsbeneficios.FieldByName('IMPPAG').AsFloat     := DM1.cdsReporte.FieldByName('MONPAG').AsFloat;
        // Tipo de pago
        xSql := 'SELECT TIPDESEABR FROM CRE104 WHERE TIPDESEID = '+QuotedStr(DM1.cdsQry2.FieldByName('FORPAGOID').AsString);
        DM1.cdsQry3.Close;
        DM1.cdsQry3.DataRequest(xSql);
        DM1.cdsQry3.Open;
        cdsbeneficios.FieldByName('TIPPAG').AsString := DM1.cdsQry3.FieldByName('TIPDESEABR').AsString;
        // Banco
        xSql := 'SELECT BANCOABR FROM TGE105 WHERE BANCOID = '+QuotedStr(DM1.cdsQry2.FieldByName('BANCOID').AsString);
        DM1.cdsQry3.Close;
        DM1.cdsQry3.DataRequest(xSql);
        DM1.cdsQry3.Open;
        cdsbeneficios.FieldByName('BCODES').AsString := DM1.cdsQry3.FieldByName('BANCOABR').AsString;
        cdsbeneficios.FieldByName('NROCHEQUE').AsString    := DM1.cdsReporte.FieldByName('NROCHEQUE').AsString;
        cdsbeneficios.FieldByName('PVSLNOFC').AsString     := DM1.cdsReporte.FieldByName('PVSLNOFC').AsString;
        If DM1.cdsReporte.FieldByName('FECPAG').AsString <> '' Then
           cdsbeneficios.FieldByName('FECPAG').AsDateTime     := DM1.cdsReporte.FieldByName('FECPAG').AsDateTime;
        cdsbeneficios.Post;
        // Si hay mas de un beneficiario
      End
      Else
      Begin
        DM1.cdsQry2.First;
        While Not DM1.cdsQry2.Eof Do
        Begin
          cdsbeneficios.Edit;
          cdsbeneficios.FieldByName('TIPPAG').AsString := '';
          cdsbeneficios.Append;
          cdsbeneficios.FieldByName('ASOAPENOMBEN').AsString  := DM1.cdsQry2.FieldByname('PVSNOMBRE').AsString;
          cdsbeneficios.FieldByName('PVSLBENNR').AsString     := DM1.cdsQry2.FieldByname('PVSLBENNR').AsString;
          cdsbeneficios.FieldByName('IMPPAG').AsFloat         := DM1.cdsQry2.FieldByname('PVSLMONTO').AsFloat;
          // Tipo de pago
          xSql := 'SELECT TIPDESEABR FROM CRE104 WHERE TIPDESEID = '+QuotedStr(DM1.cdsQry2.FieldByName('FORPAGOID').AsString);
          DM1.cdsQry3.Close;
          DM1.cdsQry3.DataRequest(xSql);
          DM1.cdsQry3.Open;
          cdsbeneficios.FieldByName('TIPPAG').AsString := DM1.cdsQry3.FieldByName('TIPDESEABR').AsString;
          // Banco
          xSql := 'SELECT BANCOABR FROM TGE105 WHERE BANCOID = '+QuotedStr(DM1.cdsQry2.FieldByName('BANCOID').AsString);
          DM1.cdsQry3.Close;
          DM1.cdsQry3.DataRequest(xSql);
          DM1.cdsQry3.Open;
          cdsbeneficios.FieldByName('BCODES').AsString := DM1.cdsQry3.FieldByName('BANCOABR').AsString;
          cdsbeneficios.FieldByName('NROCHEQUE').AsString    := DM1.cdsReporte.FieldByName('NROCHEQUE').AsString;
          cdsbeneficios.FieldByName('PVSLNOFC').AsString     := DM1.cdsReporte.FieldByName('PVSLNOFC').AsString;
          If DM1.cdsReporte.FieldByName('FECPAG').AsString <> '' Then
            cdsbeneficios.FieldByName('FECPAG').AsDateTime     := DM1.cdsReporte.FieldByName('FECPAG').AsDateTime;
          cdsbeneficios.Post;
          DM1.cdsQry2.Next;
        End;
      End;
    End;
    DM1.cdsReporte.Next;
  End;
  dbgliqben.DataSource := dsbeneficios;
  dbgliqben.Selected.Clear;
  dbgliqben.Selected.Add('PVSLFECBE'#9'10'#9'Fecha de~la liquidación'#9#9);
  dbgliqben.Selected.Add('PVSLBENNR'#9'11'#9'Número de~la liquidación'#9#9);
  dbgliqben.Selected.Add('ASOAPENOMBEN'#9'45'#9'Apellidos y Nombre(s)~del beneficiario'#9#9);
  dbgliqben.Selected.Add('BENEFICIO'#9'15'#9'Tipo de~Beneficio'#9#9);
  dbgliqben.Selected.Add('TIPPAG'#9'15'#9'Tipo de~Pago'#9#9);
  dbgliqben.Selected.Add('BCODES'#9'15'#9'Nombre del Banco'#9#9);
  dbgliqben.Selected.Add('MONBEN'#9'10'#9'Monto del~Beneficio'#9#9);
  dbgliqben.Selected.Add('AJUBEN'#9'10'#9'Monto del~Ajuste'#9#9);
  dbgliqben.Selected.Add('IMPPAG'#9'10'#9'Importe~Pagado'#9#9);
  dbgliqben.Selected.Add('PVSLNOFC'#9'7'#9'Número de~Oficio'#9#9);
  dbgliqben.Selected.Add('NROCHEQUE'#9'10'#9'Número de~Cheque'#9#9);
  dbgliqben.Selected.Add('FECPAG'#9'10'#9'Fecha de~Pago'#9#9);
  TNumericField(cdsbeneficios.FieldByName('MONBEN')).DisplayFormat := '###,###,##0.00';
  TNumericField(cdsbeneficios.FieldByName('AJUBEN')).DisplayFormat := '###,###,##0.00';
  TNumericField(cdsbeneficios.FieldByName('IMPPAG')).DisplayFormat := '###,###,##0.00';
  dbgliqben.ApplySelected;
  dbgliqben.ColumnByName('BCODES').FooterValue := 'TOTALES : ';
  TNumericField(cdsbeneficios.FieldByName('MONBEN')).DisplayFormat := '###,###,##0.00';
  TNumericField(cdsbeneficios.FieldByName('AJUBEN')).DisplayFormat := '###,###,##0.00';
  TNumericField(cdsbeneficios.FieldByName('IMPPAG')).DisplayFormat := '###,###,##0.00';
  dbgliqben.ColumnByName('MONBEN').FooterValue := FormatFloat('###,###.#0',monben);
  dbgliqben.ColumnByName('AJUBEN').FooterValue := FormatFloat('###,###.#0',ajuben);
  dbgliqben.ColumnByName('IMPPAG').FooterValue := FormatFloat('###,###.#0',imppag);
End;

procedure TFrepxtipbenCon.btnimprimirClick(Sender: TObject);
begin
    ppltitulo0101.Caption := 'LIQUIDACIONES DE BENEFICIOS';
    ppltitulo0102.Caption := 'DEL '+dbdtpinicial.Text+' AL '+dbdtpfinal.Text;
    pplimpresopor.Caption := 'Impreso por : '+DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
    pprtodos.Print;
end;

procedure TFrepxtipbenCon.btnaexcelClick(Sender: TObject);
begin
  dtgData.DataSource := dsbeneficios;
  DM1.HojaExcel('REPORTE', dsbeneficios, dtgData)
end;

end.
