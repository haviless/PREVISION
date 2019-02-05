unit PRE267;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, wwdblook, wwdbdatetimepicker, Mask, ExtCtrls,
  Grids, Wwdbigrd, Wwdbgrid, ppProd, ppClass, ppReport, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE, ppBands, ppCache, DB, DBClient, ppCtrls, ppVar,
  ppPrnabl, DBGrids;

type
  TFrepxtipben1 = class(TForm)
    GroupBox1: TGroupBox;
    dbdtpinicial: TwwDBDateTimePicker;
    dbdtpfinal: TwwDBDateTimePicker;
    dblctipben: TwwDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    pnltipbenef: TPanel;
    metipbenef: TMaskEdit;
    btnimprimir: TBitBtn;
    btnaexcel: TBitBtn;
    btncerrar: TBitBtn;
    bdeprepxtipben: TppBDEPipeline;
    btnImprimePrevio: TBitBtn;
    Label4: TLabel;
    dblcdptoid: TwwDBLookupCombo;
    pnldesdpto: TPanel;
    medesdpto: TMaskEdit;
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
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
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
    pplfecben: TppLabel;
    pplpvslbennr: TppLabel;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppShape8: TppShape;
    ppShape9: TppShape;
    ppShape10: TppShape;
    ppShape11: TppShape;
    ppShape12: TppShape;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppSummaryBand1: TppSummaryBand;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppDBCalc3: TppDBCalc;
    pplimpresopor: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    pplcantidad: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppShape4: TppShape;
    ppLine3: TppLine;
    ppShape13: TppShape;
    ppShape14: TppShape;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    pplcanret: TppLabel;
    pplcanfal: TppLabel;
    pplcaninv: TppLabel;
    pplmonret: TppLabel;
    pplmonfal: TppLabel;
    pplmoninv: TppLabel;
    ppLabel33: TppLabel;
    ppShape15: TppShape;
    pplcantot: TppLabel;
    pplmontot: TppLabel;
    dtgData: TDBGrid;
    pprtipbenres: TppReport;
    ppbdetipben: TppBDEPipeline;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    rgtipben: TRadioGroup;
    cdsresumen: TClientDataSet;
    dsresumen: TDataSource;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLine4: TppLine;
    ppLabel44: TppLabel;
    ppLine5: TppLine;
    ppLabel45: TppLabel;
    ppSummaryBand2: TppSummaryBand;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppShape17: TppShape;
    ppShape18: TppShape;
    ppShape16: TppShape;
    ppShape19: TppShape;
    ppShape20: TppShape;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppShape21: TppShape;
    ppShape22: TppShape;
    ppShape23: TppShape;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppShape24: TppShape;
    ppShape25: TppShape;
    ppShape26: TppShape;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppShape27: TppShape;
    ppShape28: TppShape;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    procedure FormActivate(Sender: TObject);
    procedure dblctipbenChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btncerrarClick(Sender: TObject);
    procedure btnImprimePrevioClick(Sender: TObject);
    procedure dblcdptoidChange(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
    procedure btnaexcelClick(Sender: TObject);
    procedure rgtipbenClick(Sender: TObject);
  private
    xSql, xfecini, xfecfin :String;
    monben, ajuben, imppag: Double;
    canret, monret, canfal, monfal, caninv, moninv : Double;


    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frepxtipben1: TFrepxtipben1;

implementation

uses PREDM, PRE238;

{$R *.dfm}

procedure TFrepxtipben1.FormActivate(Sender: TObject);
Var xSql:String;
begin
  xSql := 'SELECT DPTOID, DPTODES FROM APO158';
  DM1.cdsDpto.Close;
  DM1.cdsDpto.DataRequest(xSql);
  DM1.cdsDpto.Open;
  dblcdptoid.Selected.Clear;
  dblcdptoid.Selected.Add('DPTOID'#9'2'#9'Código'#9#9);
  dblcdptoid.Selected.Add('DPTODES'#9'25'#9'Nombre del departamento'#9#9);
  xSql := 'SELECT TIPBENEF, BENEFDES FROM TGE186 WHERE TIPBENEF IN (''01'',''02'',''03'')';
  DM1.cdsTipBenef.Close;
  DM1.cdsTipBenef.DataRequest(xSql);
  DM1.cdsTipBenef.Open;
  dblctipben.Selected.Clear;
  dblctipben.Selected.Add('TIPBENEF'#9'2'#9'Código'#9#9);
  dblctipben.Selected.Add('BENEFDES'#9'25'#9'Tipo de beneficio'#9#9);
  dbdtpinicial.Date := DM1.FechaSys;
  dbdtpfinal.Date   := DM1.FechaSys;
  dbdtpinicial.SetFocus;
end;

procedure TFrepxtipben1.dblctipbenChange(Sender: TObject);
begin
  If dblctipben.Text = '' Then metipbenef.Text := '';
  If Length(dblctipben.Text) = 2 then
  Begin
    If DM1.cdsTipBenef.Locate('TIPBENEF', dblctipben.Text, []) Then
    Begin
      metipbenef.Text := DM1.cdsTipBenef.FieldByName('BENEFDES').AsString;
    End
    Else
    Begin
      MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
      dblctipben.Text := '';
      metipbenef.Text := '';
      dblctipben.SetFocus;
    End;
  End;
end;

procedure TFrepxtipben1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  begin
    Key := #0;
    Perform(CM_DIALOGKEY, VK_TAB, 0);
  end;
end;


procedure TFrepxtipben1.btncerrarClick(Sender: TObject);
begin
  Frepxtipben.Close;
end;

procedure TFrepxtipben1.btnImprimePrevioClick(Sender: TObject);
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
  If rgtipben.ItemIndex = 0 Then
  Begin
    //todos los beneficios todos los departamentos
    If (dblctipben.Text = '') And (dblcdptoid.Text = '') Then
    Begin
      xSql := 'SELECT A.ASOID, A.PVSLTIPBE, A.PVSLFECBE, A.PVSLBENNR, A.ASOCODMOD, SUBSTR(A.ASOAPENOMDNI,1,30) ASOAPENOMDNI,  SUBSTR(C.BENEFDES,1,6) BENEFDES, D.DPTODES, (SELECT SUM(NVL(PVSLMONTO,0)) FROM PVS307 WHERE PVSLBENNR = A.PVSLBENNR'
      +' AND PVSLAGRID = ''DET'') MONBEN, (SELECT SUM(NVL(PVSLMONTO,0)) FROM PVS307 WHERE PVSLBENNR = A.PVSLBENNR AND PVSLAGRID = ''DET'')-(SELECT SUM(NVL(PVSLMONTO,0)) FROM PVS307 WHERE PVSLBENNR = A.PVSLBENNR'
      +' AND PVSLAGRID IN (''FPG'', ''RET'') AND FLGVOUCHER = ''N'') AJUSTE, (SELECT SUM(NVL(PVSLMONTO,0)) FROM PVS307 WHERE PVSLBENNR = A.PVSLBENNR AND PVSLAGRID IN (''FPG'', ''RET'') AND FLGVOUCHER = ''N'') MONPAG'
      +' FROM PVS306 A, PVS301 B, TGE186 C, APO158 D WHERE TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') >= '+QuotedStr(xfecini)+' AND TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'')  <= '+QuotedStr(xfecfin)
      +' AND A.PVSESTLIQ IN (''02'', ''05'') AND A.ASOID = B.ASOID(+) AND A.PVSLTIPBE = C.TIPBENEF(+) AND SUBSTR(B.DISORIEXP, 1,2) = D.DPTOID(+)'
      +' ORDER BY A.PVSLTIPBE, A.PVSLFECBE, A.PVSLBENNR';
    End;
    //Todos los beneficios un departamento
    If (dblctipben.Text = '') And (dblcdptoid.Text <> '') Then
    Begin
      xSql := 'SELECT A.ASOID, A.PVSLTIPBE, A.PVSLFECBE, A.PVSLBENNR, A.ASOCODMOD, A.ASOAPENOMDNI, C.BENEFDES, D.DPTODES, (SELECT SUM(NVL(PVSLMONTO,0)) FROM PVS307 WHERE PVSLBENNR = A.PVSLBENNR'
      +' AND PVSLAGRID = ''DET'') MONBEN, (SELECT SUM(NVL(PVSLMONTO,0)) FROM PVS307 WHERE PVSLBENNR = A.PVSLBENNR AND PVSLAGRID = ''DET'')-(SELECT SUM(NVL(PVSLMONTO,0)) FROM PVS307 WHERE PVSLBENNR = A.PVSLBENNR'
      +' AND PVSLAGRID IN (''FPG'', ''RET'') AND FLGVOUCHER = ''N'') AJUSTE, (SELECT SUM(NVL(PVSLMONTO,0)) FROM PVS307 WHERE PVSLBENNR = A.PVSLBENNR AND PVSLAGRID IN (''FPG'', ''RET'') AND FLGVOUCHER = ''N'') MONPAG'
      +' FROM PVS306 A, PVS301 B, TGE186 C, APO158 D WHERE TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') >= '+QuotedStr(xfecini)+' AND TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'')  <= '+QuotedStr(xfecfin)
      +' AND A.PVSESTLIQ IN (''02'', ''05'') AND A.ASOID = B.ASOID(+)'
      +' AND SUBSTR(B.DISORIEXP,1,2) = '+QuotedStr(dblcdptoid.Text)
      +' AND A.PVSLTIPBE = C.TIPBENEF(+) AND SUBSTR(B.DISORIEXP, 1,2) = D.DPTOID(+)'
      +' ORDER BY A.PVSLTIPBE, A.PVSLFECBE, A.PVSLBENNR';
    End;
    //selecciona un departamento, un tipo de beneficio
    If (dblctipben.Text <> '') And (dblcdptoid.Text <> '') Then
    Begin
      xSql := 'SELECT A.ASOID, A.PVSLTIPBE, A.PVSLFECBE, A.PVSLBENNR, A.ASOCODMOD, A.ASOAPENOMDNI, C.BENEFDES, D.DPTODES, (SELECT SUM(NVL(PVSLMONTO,0)) FROM PVS307 WHERE PVSLBENNR = A.PVSLBENNR'
      +' AND PVSLAGRID = ''DET'') MONBEN, (SELECT SUM(NVL(PVSLMONTO,0)) FROM PVS307 WHERE PVSLBENNR = A.PVSLBENNR AND PVSLAGRID = ''DET'')-(SELECT SUM(NVL(PVSLMONTO,0)) FROM PVS307 WHERE PVSLBENNR = A.PVSLBENNR'
      +' AND PVSLAGRID IN (''FPG'', ''RET'') AND FLGVOUCHER = ''N'') AJUSTE, (SELECT SUM(NVL(PVSLMONTO,0)) FROM PVS307 WHERE PVSLBENNR = A.PVSLBENNR AND PVSLAGRID IN (''FPG'', ''RET'') AND FLGVOUCHER = ''N'') MONPAG'
      +' FROM PVS306 A, PVS301 B, TGE186 C, APO158 D WHERE TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') >= '+QuotedStr(xfecini)+' AND TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'')  <= '+QuotedStr(xfecfin)
      +' AND A.PVSESTLIQ IN (''02'', ''05'')'
      +' AND A.ASOID = B.ASOID(+) AND SUBSTR(B.DISORIEXP,1,2) = '+QuotedStr(dblcdptoid.Text)
      +' AND A.PVSLTIPBE = '+QuotedStr(dblctipben.Text)
      +' AND A.PVSLTIPBE = C.TIPBENEF(+) AND SUBSTR(B.DISORIEXP, 1,2) = D.DPTOID(+)'
      +' ORDER BY A.PVSLTIPBE, A.PVSLFECBE, A.PVSLBENNR';
    End;
    //Todos los departamentos un beneficio
    If (dblcdptoid.Text = '') And (dblctipben.Text <> '') Then
    Begin
      xSql := 'SELECT A.ASOID, A.PVSLTIPBE, A.PVSLFECBE, A.PVSLBENNR, A.ASOCODMOD, A.ASOAPENOMDNI, C.BENEFDES, D.DPTODES, (SELECT SUM(NVL(PVSLMONTO,0)) FROM PVS307 WHERE PVSLBENNR = A.PVSLBENNR'
      +' AND PVSLAGRID = ''DET'') MONBEN, (SELECT SUM(NVL(PVSLMONTO,0)) FROM PVS307 WHERE PVSLBENNR = A.PVSLBENNR AND PVSLAGRID = ''DET'')-(SELECT SUM(NVL(PVSLMONTO,0)) FROM PVS307 WHERE PVSLBENNR = A.PVSLBENNR'
      +' AND PVSLAGRID IN (''FPG'', ''RET'') AND FLGVOUCHER = ''N'') AJUSTE, (SELECT SUM(NVL(PVSLMONTO,0)) FROM PVS307 WHERE PVSLBENNR = A.PVSLBENNR AND PVSLAGRID IN (''FPG'', ''RET'') AND FLGVOUCHER = ''N'') MONPAG'
      +' FROM PVS306 A, PVS301 B, TGE186 C, APO158 D WHERE TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'') >= '+QuotedStr(xfecini)+' AND TO_CHAR(A.PVSLFECBE, ''YYYYMMDD'')  <= '+QuotedStr(xfecfin)
      +' AND A.PVSESTLIQ IN (''02'', ''05'') AND A.ASOID = B.ASOID(+)'
      +' AND A.PVSLTIPBE = '+QuotedStr(dblctipben.Text)
      +' AND A.PVSLTIPBE = C.TIPBENEF(+) AND SUBSTR(B.DISORIEXP, 1,2) = D.DPTOID(+)'
      +' ORDER BY A.PVSLTIPBE, A.PVSLFECBE, A.PVSLBENNR';
    End;
    DM1.cdsReporte.Close;
    DM1.cdsReporte.DataRequest(xSql);
    DM1.cdsReporte.Open;
    DM1.cdsReporte.First;
    cdsbeneficios.EmptyDataSet;
    canret := 0; monret := 0; caninv := 0; moninv := 0;
    monben := 0; ajuben := 0; imppag := 0; canfal := 0; monfal := 0;
    While Not DM1.cdsReporte.Eof Do
    Begin
      If DM1.cdsReporte.FieldByName('PVSLTIPBE').AsString = '01' Then
      Begin
        canret := canret + 1;
        monret := monret + DM1.cdsReporte.FieldByName('MONBEN').AsFloat;
      End;
      If DM1.cdsReporte.FieldByName('PVSLTIPBE').AsString = '02' Then
      Begin
        canfal := canfal + 1;
        monfal := monfal + DM1.cdsReporte.FieldByName('MONBEN').AsFloat;
      End;
      If DM1.cdsReporte.FieldByName('PVSLTIPBE').AsString = '03' Then
      Begin
        caninv := caninv + 1;
        moninv := moninv + DM1.cdsReporte.FieldByName('MONBEN').AsFloat;
      End;
      monben := monben   + DM1.cdsReporte.FieldByName('MONBEN').AsFloat;
      ajuben := ajuben   + DM1.cdsReporte.FieldByName('AJUSTE').AsFloat;
      imppag := imppag  + DM1.cdsReporte.FieldByName('MONPAG').AsFloat;
      xSql := 'SELECT * FROM PVS306 WHERE PVSLBENNR = '+QuotedStr(DM1.cdsReporte.FieldByname('PVSLBENNR').AsString);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      cdsbeneficios.Append;
      cdsbeneficios.FieldByName('PVSLFECBE').AsDateTime   := DM1.cdsQry.FieldByName('PVSLFECBE').AsDateTime;
      cdsbeneficios.FieldByName('PVSLBENNR').AsString     := DM1.cdsQry.FieldByname('PVSLBENNR').AsString;
      cdsbeneficios.FieldByName('ASOCODMOD').AsString     := DM1.cdsQry.FieldByname('ASOCODMOD').AsString;
      cdsbeneficios.FieldByName('ASOAPENOMBEN').AsString  := DM1.cdsQry.FieldByname('ASOAPENOMDNI').AsString;
      cdsbeneficios.FieldByName('MONBEN').AsFloat     := DM1.cdsReporte.FieldByName('MONBEN').AsFloat;
      cdsbeneficios.FieldByName('AJUBEN').AsFloat     := DM1.cdsReporte.FieldByName('AJUSTE').AsFloat;
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
        // Giudad en donde se gira
        xSql := 'SELECT AGENBCOABR FROM COB102 WHERE AGENBCOID = '+QuotedStr(DM1.cdsQry2.FieldByName('AGENBCOID').AsString);
        DM1.cdsQry3.Close;
        DM1.cdsQry3.DataRequest(xSql);
        DM1.cdsQry3.Open;
        cdsbeneficios.FieldByName('CIUGIR').AsString := DM1.cdsQry3.FieldByName('AGENBCOABR').AsString;
        cdsbeneficios.Post;
        // Si hay mas de un beneficiario
      End
      Else
      Begin
        DM1.cdsQry2.First;
        While Not DM1.cdsQry2.Eof Do
        Begin
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
          // Giudad en donde se gira
          xSql := 'SELECT AGENBCOABR FROM COB102 WHERE AGENBCOID = '+QuotedStr(DM1.cdsQry2.FieldByName('AGENBCOID').AsString);
          DM1.cdsQry3.Close;
          DM1.cdsQry3.DataRequest(xSql);
          DM1.cdsQry3.Open;
          cdsbeneficios.FieldByName('CIUGIR').AsString := DM1.cdsQry3.FieldByName('AGENBCOABR').AsString;
          cdsbeneficios.Post;
          DM1.cdsQry2.Next;
        End;
      End;
      DM1.cdsReporte.Next;
    End;
    dbgliqben.DataSource := dsbeneficios;
    dbgliqben.Selected.Clear;
    dbgliqben.Selected.Add('PVSLFECBE'#9'10'#9'Fecha de~la liquidación'#9#9);
    dbgliqben.Selected.Add('PVSLBENNR'#9'11'#9'Número de~la liquidación'#9#9);
    dbgliqben.Selected.Add('ASOCODMOD'#9'10'#9'Código~Modular'#9#9);
    dbgliqben.Selected.Add('ASOAPENOMBEN'#9'45'#9'Apellidos y Nombre(s)~del beneficiario'#9#9);
    dbgliqben.Selected.Add('BENEFICIO'#9'15'#9'Tipo de~Beneficio'#9#9);
    dbgliqben.Selected.Add('TIPPAG'#9'15'#9'Tipo de~Pago'#9#9);
    dbgliqben.Selected.Add('BCODES'#9'15'#9'Nombre del Banco'#9#9);
    dbgliqben.Selected.Add('CIUGIR'#9'15'#9'Ciudad de~Giro'#9#9);
    dbgliqben.Selected.Add('MONBEN'#9'10'#9'Monto del~Beneficio'#9#9);
    dbgliqben.Selected.Add('AJUBEN'#9'10'#9'Monto del~Ajuste'#9#9);
    dbgliqben.Selected.Add('IMPPAG'#9'10'#9'Importe~Pagado'#9#9);
    TNumericField(cdsbeneficios.FieldByName('MONBEN')).DisplayFormat := '###,###,##0.00';
    TNumericField(cdsbeneficios.FieldByName('AJUBEN')).DisplayFormat := '###,###,##0.00';
    TNumericField(cdsbeneficios.FieldByName('IMPPAG')).DisplayFormat := '###,###,##0.00';
    dbgliqben.ApplySelected;
    dbgliqben.ColumnByName('CIUGIR').FooterValue := 'TOTALES : ';
    TNumericField(cdsbeneficios.FieldByName('MONBEN')).DisplayFormat := '###,###,##0.00';
    TNumericField(cdsbeneficios.FieldByName('AJUBEN')).DisplayFormat := '###,###,##0.00';
    TNumericField(cdsbeneficios.FieldByName('IMPPAG')).DisplayFormat := '###,###,##0.00';
    dbgliqben.ColumnByName('MONBEN').FooterValue := FormatFloat('###,###.#0',monben);
    dbgliqben.ColumnByName('AJUBEN').FooterValue := FormatFloat('###,###.#0',ajuben);
    dbgliqben.ColumnByName('IMPPAG').FooterValue := FormatFloat('###,###.#0',imppag);
  End;
  If rgtipben.ItemIndex = 1 Then
  Begin
    xSql := 'SELECT PVSLFECBE, SUM(CASE WHEN PVSLTIPBE = ''01'' THEN 1 ELSE 0 END) CANRET, SUM(CASE WHEN PVSLTIPBE = ''01'' THEN PVSLMONTO ELSE 0 END) MONRET,'
    +'                         SUM(CASE WHEN PVSLTIPBE = ''02'' THEN 1 ELSE 0 END) CANFAL, SUM(CASE WHEN PVSLTIPBE = ''02'' THEN PVSLMONTO ELSE 0 END) MONFAL,'
    +'                         SUM(CASE WHEN PVSLTIPBE = ''03'' THEN 1 ELSE 0 END) CANINV, SUM(CASE WHEN PVSLTIPBE = ''03'' THEN PVSLMONTO ELSE 0 END) MONINV'
    +' FROM ( SELECT TO_CHAR(PVSLFECBE, ''YYYYMM'') PVSLFECBE, PVSLTIPBE,'
    +' (SELECT SUM(NVL(B.PVSLMONTO,0)) FROM PVS307 B WHERE PVSLFECBE >= '+QuotedStr(dbdtpinicial.Text)+' AND PVSLFECBE <= '+QuotedStr(dbdtpfinal.Text)
    +' AND PVSESTLIQ IN (''02'',''05'') AND A.PVSLBENNR = B.PVSLBENNR AND B.PVSLAGRID = ''DET'') PVSLMONTO'
    +' FROM PVS306 A WHERE PVSLFECBE >= '+QuotedStr(dbdtpinicial.Text)+' AND PVSLFECBE <= '+QuotedStr(dbdtpfinal.Text)
    +' AND PVSESTLIQ IN (''02'',''05'')) GROUP BY PVSLFECBE ORDER BY PVSLFECBE';
    DM1.cdsReporte.Close;
    DM1.cdsReporte.DataRequest(xSql);
    DM1.cdsReporte.Open;
    DM1.cdsReporte.First;
    canret := 0;
    caninv := 0;
    canfal := 0;
    monret := 0;
    moninv := 0;
    monfal := 0;
    cdsresumen.EmptyDataSet;
    While Not DM1.cdsReporte.Eof Do
    Begin
      canret := canret + DM1.cdsReporte.FieldByName('CANRET').AsFloat;
      caninv := caninv + DM1.cdsReporte.FieldByName('CANINV').AsFloat;
      canfal := canfal + DM1.cdsReporte.FieldByName('CANFAL').AsFloat;
      monret := monret + DM1.cdsReporte.FieldByName('MONRET').AsFloat;
      moninv := moninv + DM1.cdsReporte.FieldByName('MONINV').AsFloat;
      monfal := monfal + DM1.cdsReporte.FieldByName('MONFAL').AsFloat;
      cdsresumen.Append;
      cdsresumen.FieldByName('MES').AsString := DM1.NombreMes(Copy(DM1.cdsReporte.FieldByName('PVSLFECBE').AsString,5,2));
      cdsresumen.FieldByName('CANRET').AsFloat := DM1.cdsReporte.FieldByName('CANRET').AsFloat;
      cdsresumen.FieldByName('MONRET').AsFloat := DM1.cdsReporte.FieldByName('MONRET').AsFloat;
      cdsresumen.FieldByName('CANINV').AsFloat := DM1.cdsReporte.FieldByName('CANINV').AsFloat;
      cdsresumen.FieldByName('MONINV').AsFloat := DM1.cdsReporte.FieldByName('MONINV').AsFloat;
      cdsresumen.FieldByName('CANFAL').AsFloat := DM1.cdsReporte.FieldByName('CANFAL').AsFloat;
      cdsresumen.FieldByName('MONFAL').AsFloat := DM1.cdsReporte.FieldByName('MONFAL').AsFloat;
      cdsresumen.FieldByName('CANTOT').AsFloat := DM1.cdsReporte.FieldByName('CANRET').AsFloat+DM1.cdsReporte.FieldByName('CANINV').AsFloat+DM1.cdsReporte.FieldByName('CANFAL').AsFloat;
      cdsresumen.FieldByName('MONTOT').AsFloat := DM1.cdsReporte.FieldByName('MONRET').AsFloat+DM1.cdsReporte.FieldByName('MONINV').AsFloat+DM1.cdsReporte.FieldByName('MONFAL').AsFloat;
      cdsresumen.Post;
      DM1.cdsReporte.Next;
    End;
    dbgliqben.Selected.Clear;
    dbgliqben.Selected.Add('MES'#9'18'#9'Mes del~Proceso'#9#9);
    dbgliqben.Selected.Add('CANRET'#9'10'#9'Cantidad~por retiro'#9#9);
    dbgliqben.Selected.Add('MONRET'#9'13'#9'Monto por~retiro'#9#9);
    dbgliqben.Selected.Add('CANFAL'#9'10'#9'Cantidad por~Fallecimiento'#9#9);
    dbgliqben.Selected.Add('MONFAL'#9'13'#9'Monto por~Fallecimiento'#9#9);
    dbgliqben.Selected.Add('CANINV'#9'10'#9'Cantidad por~Invalidez'#9#9);
    dbgliqben.Selected.Add('MONINV'#9'13'#9'Monto por~Invalidez'#9#9);
    dbgliqben.Selected.Add('CANTOT'#9'10'#9'Cantidad~Total'#9#9);
    dbgliqben.Selected.Add('MONTOT'#9'13'#9'Monto~Total'#9#9);
    TNumericField(cdsresumen.FieldByName('CANRET')).DisplayFormat := '###,###,##0';
    TNumericField(cdsresumen.FieldByName('CANFAL')).DisplayFormat := '###,###,##0';
    TNumericField(cdsresumen.FieldByName('CANINV')).DisplayFormat := '###,###,##0';
    TNumericField(cdsresumen.FieldByName('CANTOT')).DisplayFormat := '###,###,##0';
    TNumericField(cdsresumen.FieldByName('MONRET')).DisplayFormat := '###,###,###.#0';
    TNumericField(cdsresumen.FieldByName('MONFAL')).DisplayFormat := '###,###,###.#0';
    TNumericField(cdsresumen.FieldByName('MONINV')).DisplayFormat := '###,###,###.#0';
    TNumericField(cdsresumen.FieldByName('MONTOT')).DisplayFormat := '###,###,###.#0';
    dbgliqben.DataSource := dsresumen;
    dbgliqben.ColumnByName('MES').FooterValue := 'TOTALES';
    dbgliqben.ColumnByName('CANRET').FooterValue := FormatFloat('###,###,##0',canret);
    dbgliqben.ColumnByName('CANFAL').FooterValue := FormatFloat('###,###,##0',canfal);
    dbgliqben.ColumnByName('CANINV').FooterValue := FormatFloat('###,###,##0',caninv);
    dbgliqben.ColumnByName('CANTOT').FooterValue := FormatFloat('###,###,##0',canret+canfal+caninv);
    dbgliqben.ColumnByName('MONRET').FooterValue := FormatFloat('###,###,###.#0',monret);
    dbgliqben.ColumnByName('MONFAL').FooterValue := FormatFloat('###,###,###.#0',monfal);
    dbgliqben.ColumnByName('MONINV').FooterValue := FormatFloat('###,###,###.#0',moninv);
    dbgliqben.ColumnByName('MONTOT').FooterValue := FormatFloat('###,###,###.#0',monret+monfal+moninv);
  End;
End;

procedure TFrepxtipben1.dblcdptoidChange(Sender: TObject);
begin
  If dblcdptoid.Text = '' Then medesdpto.Text := '';
  If Length(dblcdptoid.Text) = 2 then
  Begin
    If DM1.cdsDpto.Locate('DPTOID', dblcdptoid.Text, []) Then
    Begin
      medesdpto.Text := DM1.cdsDpto.FieldByName('DPTODES').AsString;
    End
    Else
    Begin
      MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
      dblcdptoid.Text := '';
      medesdpto.Text := '';
      dblctipben.SetFocus;
    End;
  End;
end;

procedure TFrepxtipben1.btnimprimirClick(Sender: TObject);
begin
  If rgtipben.ItemIndex = 0 Then
  Begin
    ppltitulo0101.Caption := 'LIQUIDACIONES DE BENEFICIOS';
    ppltitulo0102.Caption := 'DEL '+dbdtpinicial.Text+' AL '+dbdtpfinal.Text;
    pplcanret.Caption := FloatToStrF(canret, ffNumber, 15, 0);
    pplcaninv.Caption := FloatToStrF(caninv, ffNumber, 15, 0);
    pplcanfal.Caption := FloatToStrF(canfal, ffNumber, 15, 0);
    pplcantot.Caption := FloatToStrF(canret+caninv+canfal, ffNumber, 15, 0);
    pplmonret.Caption := FloatToStrF(monret, ffNumber, 15, 2);
    pplmoninv.Caption := FloatToStrF(moninv, ffNumber, 15, 2);
    pplmonfal.Caption := FloatToStrF(monfal, ffNumber, 15, 2);
    pplmontot.Caption := FloatToStrF(monret+moninv+monfal , ffNumber, 15, 2);
    pprtodos.Print;
  End
  Else
  Begin
    ppLabel40.Caption := 'DEL '+dbdtpinicial.Text+' AL '+dbdtpfinal.Text;
    ppLabel45.Caption := 'Impreso por : '+DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
    pprtipbenres.Print;
    pprtipbenres.Stop;
  End;
end;

procedure TFrepxtipben1.ppDetailBand1BeforePrint(Sender: TObject);
begin
  If Trim(cdsbeneficios.FieldByName('ASOCODMOD').AsString) <> '' Then
  Begin
    pplfecben.Caption := cdsbeneficios.FieldByName('PVSLFECBE').AsString;
    pplpvslbennr.Caption := Copy(cdsbeneficios.FieldByName('PVSLBENNR').AsString,5,7);
  End
  Else
  Begin
    pplfecben.Caption := '';
    pplpvslbennr.Caption := '';
  End;
end;

procedure TFrepxtipben1.btnaexcelClick(Sender: TObject);
begin
 If rgtipben.ItemIndex = 0 Then
 Begin
   dtgData.DataSource := dsbeneficios;
   DM1.HojaExcel('REPORTE', dsbeneficios, dtgData)
 End
 Else
 Begin
   dtgData.DataSource := dsresumen;
   DM1.HojaExcel('REPORTE', dsresumen, dtgData);
 End;
end;

procedure TFrepxtipben1.rgtipbenClick(Sender: TObject);
begin
 If rgtipben.ItemIndex = 0 Then
 Begin
   dblctipben.Enabled := True;
   dblcdptoid.Enabled := True;
 End
 Else
 Begin
   dblctipben.Text := '';
   dblcdptoid.Text := '';
   metipbenef.Text := '';
   medesdpto.Text  := '';
   dblctipben.Enabled := False;
   dblcdptoid.Enabled := False;
 End;

 
end;

end.
