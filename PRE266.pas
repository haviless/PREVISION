unit PRE266;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, wwdbdatetimepicker, Grids, Wwdbigrd, Wwdbgrid, db,
  DBGrids, DBClient, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, ppPrnabl, ppCtrls, ppBands, ppCache, ppVar;

type
  TFbenotocon = class(TForm)
    gbfiltra: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dbdtpinicial: TwwDBDateTimePicker;
    dbdtpfinal: TwwDBDateTimePicker;
    dbgbenoto: TwwDBGrid;
    btnImprimePrevio: TBitBtn;
    btnimprimir: TBitBtn;
    btnaexcel: TBitBtn;
    btncerrar: TBitBtn;
    ppbdereporte: TppBDEPipeline;
    pprreporte: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText6: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppShape18: TppShape;
    ppShape17: TppShape;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppltitulo02: TppLabel;
    ppltitulo01: TppLabel;
    ppShape20: TppShape;
    ppLabel50: TppLabel;
    ppShape23: TppShape;
    ppShape26: TppShape;
    ppShape28: TppShape;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppShape1: TppShape;
    ppLabel7: TppLabel;
    ppShape2: TppShape;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppShape3: TppShape;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppShape6: TppShape;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLabel19: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    pplimpresopor: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    dtgdata: TDBGrid;
    procedure btnImprimePrevioClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure btnaexcelClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnimprimirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fbenotocon: TFbenotocon;

implementation

uses PREDM;

{$R *.dfm}

procedure TFbenotocon.btnImprimePrevioClick(Sender: TObject);
Var xSql:String;
begin
  xSql := 'SELECT SUBSTR(D.USENOM,1,18) USENOM, SUBSTR(C.ASOAPENOMDNI,1,25) ASOAPENOMDNI, SUBSTR(A.PVSLBENNR,5,7) PVSLBENNR, A.PVSLFECBE, E.BENEFABR, A.PVSLBENNR NUMBEN,'
  +' (SELECT SUM(NVL(PVSLMONTO,0)) FROM PVS307 WHERE PVSLBENNR = A.PVSLBENNR AND PVSLAGRID IN (''DET'')) MONBEN,'
  +' B.PVSNOMBRE, B.PVSLNOFC, B.NROCHEQUE, B.PVSLMONTO, TO_DATE(NULL) FECGEN'
  +' FROM PVS306 A, PVS307 B, APO201 C, APO101 D, TGE186 E'
  +' WHERE A.PVSESTLIQ IN (''02'',''05'') AND A.PVSLFECBE >= '+QuotedStr(dbdtpinicial.Text)+' AND A.PVSLFECBE <= '+QuotedStr(dbdtpfinal.Text)
  +' AND A.PVSLBENNR = B.PVSLBENNR AND B.PVSLAGRID IN (''FPG'',''RET'') AND B.FLGVOUCHER = ''N'''
  +' AND A.ASOID = C.ASOID AND C.USEID = D.USEID AND C.UPAGOID = D.UPAGOID AND C.UPROID = D.UPROID AND A.PVSLTIPBE = E.TIPBENEF AND A.PVSLBENNR = B.PVSLBENNR'
  +' AND NVL(B.PVSLMONTO,0) > 0 ORDER BY A.PVSLBENNR';
  DM1.cdsReporte.Close;
  DM1.cdsReporte.DataRequest(xSql);
  DM1.cdsReporte.Open;

  xSql := 'SELECT SUBSTR(D.USENOM,1,18) USENOM, SUBSTR(C.ASOAPENOMDNI,1,25) ASOAPENOMDNI, SUBSTR(A.PVSLBENNR,5,7) PVSLBENNR, A.PVSLFECBE, E.BENEFABR, A.PVSLBENNR NUMBEN,'
  +' (SELECT SUM(NVL(PVSLMONTO,0)) FROM PVS307 WHERE PVSLBENNR = A.PVSLBENNR AND PVSLAGRID IN (''DET'')) MONBEN,'
  +' B.PVSNOMBRE, B.PVSLNOFC, B.NROCHEQUE, B.PVSLMONTO, TO_DATE(NULL) FECGEN'
  +' FROM PVS306 A, PVS307 B, APO201 C, APO101 D, TGE186 E'
  +' WHERE A.PVSESTLIQ IN (''02'',''05'') AND A.PVSLFECBE >= '+QuotedStr(dbdtpinicial.Text)+' AND A.PVSLFECBE <= '+QuotedStr(dbdtpfinal.Text)
  +' AND A.PVSLBENNR = B.PVSLBENNR AND B.PVSLAGRID IN (''FPG'',''RET'') AND B.FLGVOUCHER = ''N'''
  +' AND A.ASOID = C.ASOID AND C.USEID = D.USEID AND C.UPAGOID = D.UPAGOID AND C.UPROID = D.UPROID AND A.PVSLTIPBE = E.TIPBENEF AND A.PVSLBENNR = B.PVSLBENNR'
  +' AND NVL(B.PVSLMONTO,0) > 0 ORDER BY A.PVSLBENNR';
  DM1.cdsQry22.Close;
  DM1.cdsQry22.DataRequest(xSql);
  DM1.cdsQry22.Open;

  TNumericField(DM1.cdsReporte.FieldByName('PVSLMONTO')).DisplayFormat := '###,###,##0.00';
  TNumericField(DM1.cdsReporte.FieldByName('MONBEN')).DisplayFormat := '###,###,##0.00';

  DM1.cdsQry22.First;
  While Not DM1.cdsQry22.Eof Do
  Begin
    If DM1.cdsQry22.FieldByName('NROCHEQUE').AsString <> '' Then
    Begin
      xSql := 'SELECT TO_DATE(FECGENCHE) FECGENCHE FROM PVS_CHE_GEN_CAB'
      +' WHERE PVSLBENNR = '+QuotedStr(DM1.cdsQry22.FieldByName('NUMBEN').AsString)
      +' AND APENOMBEN = '+QuotedStr(DM1.cdsQry22.FieldByName('PVSNOMBRE').AsString);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      DM1.cdsQry22.Edit;
      DM1.cdsQry22.FieldByName('FECGEN').AsDateTime  := DM1.cdsQry.FieldByName('FECGENCHE').AsDateTime;
      DM1.cdsReporte.Edit;
      DM1.cdsReporte.FieldByName('FECGEN').AsDateTime  := DM1.cdsQry.FieldByName('FECGENCHE').AsDateTime;
    End
    Else
    Begin
      xSql := 'SELECT TO_DATE(FREG) FECGENCHE FROM PVS203 WHERE NOFID = '+QuotedStr(DM1.cdsQry22.FieldByName('PVSLNOFC').AsString)
      +' AND CREANO = '+QuotedStr(Copy(DM1.cdsQry22.FieldByName('PVSLFECBE').AsString,7,4));
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      DM1.cdsQry22.Edit;
      DM1.cdsQry22.FieldByName('FECGEN').AsDateTime := DM1.cdsQry.FieldByName('FECGENCHE').AsDateTime;
      DM1.cdsReporte.Edit;
      DM1.cdsReporte.FieldByName('FECGEN').AsDateTime  := DM1.cdsQry.FieldByName('FECGENCHE').AsDateTime;
    End;
    DM1.cdsQry22.Next;
  End;
end;

procedure TFbenotocon.btncerrarClick(Sender: TObject);
begin
  Fbenotocon.Close;
end;

procedure TFbenotocon.btnaexcelClick(Sender: TObject);
begin
  dtgData.DataSource := DM1.dsQry22;
  DM1.HojaExcel('REPORTE', DM1.dsQry22, dtgData);
end;

procedure TFbenotocon.FormKeyPress(Sender: TObject; var Key: Char);
begin
 If Key = #13 Then
  begin
    Key := #0;
    Perform(CM_DIALOGKEY, VK_TAB, 0);
  end;
end;

procedure TFbenotocon.btnimprimirClick(Sender: TObject);
begin
  ppltitulo01.Caption := 'RELACION DE BENEFICIOS OTORGADOS';
  ppltitulo02.Caption := 'REGISTRADOS DEL '+dbdtpinicial.Text+' AL '+dbdtpfinal.Text;
  pplimpresopor.Caption := 'Impreso por : '+DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
  pprreporte.Print;
end;

procedure TFbenotocon.FormActivate(Sender: TObject);
begin
  dbgbenoto.Selected.Clear;
  dbgbenoto.Selected.Add('USENOM'#9'15'#9'Descripción~de UGEL'#9#9);
  dbgbenoto.Selected.Add('ASOAPENOMDNI'#9'35'#9'Apellidos y Nombre(s)~del Asociado'#9#9);
  dbgbenoto.Selected.Add('PVSLBENNR'#9'7'#9'Número de~Liquidación'#9#9);
  dbgbenoto.Selected.Add('PVSLFECBE'#9'10'#9'Fecha de~Liquidación'#9#9);
  dbgbenoto.Selected.Add('BENEFABR'#9'15'#9'Tipo de~Beneficio'#9#9);
  dbgbenoto.Selected.Add('MONBEN'#9'10'#9'Importe del~Beneficio'#9#9);
  dbgbenoto.Selected.Add('PVSNOMBRE'#9'35'#9'Apellidos y Nombre(s)~del Beneficiario'#9#9);
  dbgbenoto.Selected.Add('PVSLNOFC'#9'7'#9'Número de~Oficio'#9#9);
  dbgbenoto.Selected.Add('NROCHEQUE'#9'8'#9'Número de~Cheque'#9#9);
  dbgbenoto.Selected.Add('FECGEN'#9'10'#9'Fecha de~Generación'#9#9);
  dbgbenoto.Selected.Add('PVSLMONTO'#9'10'#9'Monto a~Pagar'#9#9);
  dbgbenoto.ApplySelected;

end;

end.
