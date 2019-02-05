// Inicio Uso Estándares: 01/08/2011
// Unidad               : PRE294
// Formulario           : FexpSMSEMAIL
// Fecha de Creación    : 13/02/2017
// Autor                : Area de desarrollo de sistemas.
// Objetivo             : Información para envío SMS y email
// Actualizaciones
// HPC_201703_PRE : Creación
// HPC_201708_PRE : MODIFICAR REPORTE DE ACTIVOS POR EDAD Y SEXO AL CIERRE DE CADA MES
unit PRE293;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, ExtCtrls, DBGrids;

type
  TFexpSMSEMAIL = class(TForm)
    btnexpSMS: TBitBtn;
    btnexpEMAIL: TBitBtn;
    btncerrar: TBitBtn;
    rgtipo: TRadioGroup;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtnumoficio: TEdit;
    edtrangofecha: TEdit;
    edttipodesembolso: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    rgvalido: TRadioGroup;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edtemailvalido: TEdit;
    edtemailinconsistente: TEdit;
    edtsmsvalido: TEdit;
    edtsmsinconsistente: TEdit;
    edttotaloficio: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    dbgExporta: TDBGrid;
    btninconsistencia: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure rgtipoClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure rgvalidoClick(Sender: TObject);
    procedure btnexpEMAILClick(Sender: TObject);
    procedure btnexpSMSClick(Sender: TObject);
    procedure btninconsistenciaClick(Sender: TObject);
  private
    { Private declarations }
  public
   procedure cargagrid;
   procedure habaccesos;
   procedure cargatitulooficio;
    { Public declarations }
  end;

var
  FexpSMSEMAIL: TFexpSMSEMAIL;
   xtotaloficio, xcanemailvalido, xcanemailinconsistente, xcansmsvalido, xcansmsinconsistente:Integer;
implementation

uses PREDM, Math;

{$R *.dfm}

procedure TFexpSMSEMAIL.cargagrid;
Var sBuscaFechas, xSql:String;
begin
   sBuscaFechas:='(( TO_DATE(A.PVSLFECBE) >= '+QuotedStr(DM1.cdsOficio.FieldByName('FECINIC').AsString)+' AND TO_DATE(A.PVSLFECBE) <= '+QuotedStr(DM1.cdsOficio.FieldByName('FECFIN').AsString)
   +' AND NVL(DIFERIDO, ''N'') = ''N'') OR ( TO_DATE(A.FECDIFLIQ) >= ' + QuotedStr(DM1.cdsOficio.FieldByName('FECINIC').AsString) + ' AND  TO_DATE(A.FECDIFLIQ) <= ' +QuotedStr(DM1.cdsOficio.FieldByName('FECFIN').AsString)+ ' AND NVL(DIFERIDO, ''N'') = ''S'' ))';
   If rgvalido.ItemIndex = 0 Then
      If rgtipo.ItemIndex = 0 Then
         xSql := 'SELECT CELULAR, VAR1, VAR2, VAR3, VAR4, VAR5, VAR6, VAR7, VAR8, VAR9, VAR10  FROM (SELECT'
         +' TRIM(CASE WHEN NVL(A.PVSCOBASO,''X'') = ''S'' THEN E.ASOTELF1 ELSE B.TELMOVCOB END) CELULAR,'
         +' B.NOMCOB VAR1,  B.APEPATCOB VAR2, ''     '' VAR3, ''     '' VAR4, ''     '' VAR5, ''     '' VAR6, ''     '' VAR7,'
         +' ''     '' VAR8, ''     '' VAR9, ''     '' VAR10'
         +' FROM PVS306 A, PVS307 B, COB102 C, APO158 D, APO201 E'
         +' WHERE '+sBuscaFechas
         +' AND A.PVSESTLIQ IN (''02'',''05'', ''06'', ''04'' ) AND A.PVSLBENNR = B.PVSLBENNR'
         +' AND B.BANCOID = '+QuotedStr(DM1.cdsOficio.FieldByName('BANCOID').AsString)
         +' AND B.FORPAGOID = '+QuotedStr(DM1.cdsOficio.FieldByName('TIPDESEID').AsString)
         +' AND NVL(B.FLGVOUCHER, ''X'') = ''N'''
         +' AND TO_CHAR(B.FREG, ''YYYY'') = '+QuotedStr(Copy(DM1.cdsOficio.FieldByName('NOFID').AsString,1,4))
// Inicio HPC_201708_PRE
//MODIFICAR REPORTE DE ACTIVOS POR EDAD Y SEXO AL CIERRE DE CADA MES
         //+' AND B.PVSLNOFC  = '+QuotedStr(Copy(DM1.cdsOficio.FieldByName('NOFID').AsString,5,7))
         +' AND B.PVSLNOFC  = '+QuotedStr(DM1.cdsOficio.FieldByName('NOFID').AsString)
// Final HPC_201708_PRE
         +' AND B.AGENBCOID = C.AGENBCOID(+) AND C.DPTOID = D.DPTOID(+) AND A.ASOID = E.ASOID)'
         +' WHERE (CELULAR IS NOT NULL AND LENGTH(TRIM(CELULAR)) = 9 AND SUBSTR(CELULAR,1,1) = ''9'' AND TRANSLATE(CELULAR,''T 0123456789'',''T'') IS NULL)'
      Else
         xSql := 'SELECT EMAILS, VAR1, VAR2, VAR3, VAR4, VAR5, VAR6, VAR7, VAR8, VAR9, VAR10, CORREO_REMITENTE, NOMBRE_REMITENTE, ASUNTO_REMITENTE'
         +' FROM (SELECT TRIM(CASE WHEN NVL(A.PVSCOBASO,''X'') = ''S'' THEN E.ASOEMAIL ELSE B.EMAILCOB END) EMAILS, B.NOMCOB VAR1, B.APEPATCOB VAR2,'
         +' ''     '' VAR3, ''     '' VAR4, ''     '' VAR5, ''     '' VAR6, ''     '' VAR7, ''     '' VAR8, ''     '' VAR9, ''     '' VAR10,'
         +' F.CORREO_REMITENTE, F.NOMBRE_REMITENTE, F.ASUNTO_REMITENTE'
         +' FROM PVS306 A, PVS307 B, COB102 C, APO158 D, APO201 E, PRE_PAR_GENERALES F'
         +' WHERE '+sBuscaFechas
         +' AND A.PVSESTLIQ IN (''02'',''05'', ''06'', ''04'' ) AND A.PVSLBENNR = B.PVSLBENNR AND B.BANCOID = '+QuotedStr(DM1.cdsOficio.FieldByName('BANCOID').AsString)
         +' AND B.FORPAGOID = '+QuotedStr(DM1.cdsOficio.FieldByName('TIPDESEID').AsString)
         +' AND NVL(B.FLGVOUCHER, ''X'') = ''N'' AND TO_CHAR(B.FREG, ''YYYY'') = '+QuotedStr(Copy(DM1.cdsOficio.FieldByName('NOFID').AsString,1,4))
// Inicio HPC_201708_PRE
//MODIFICAR REPORTE DE ACTIVOS POR EDAD Y SEXO AL CIERRE DE CADA MES
         //+ ' AND B.PVSLNOFC  = '+QuotedStr(Copy(DM1.cdsOficio.FieldByName('NOFID').AsString,5,7))
         +' AND B.PVSLNOFC  = '+QuotedStr(DM1.cdsOficio.FieldByName('NOFID').AsString)
// Final HPC_201708_PRE
         +' AND B.AGENBCOID = C.AGENBCOID(+) AND C.DPTOID = D.DPTOID(+) AND A.ASOID = E.ASOID) WHERE SF_ASO_VALIDA_DIR_CORREO(EMAILS) = 0'
   Else
      If rgtipo.ItemIndex = 0 Then
         xSql := 'SELECT ASODNI, ASOCODMOD, ASOAPENOMDNI, CELULAR FROM (SELECT'
         +' A.ASODNI, A.ASOCODMOD, SUBSTR(A.ASOAPENOMDNI,1,50) ASOAPENOMDNI, TRIM(CASE WHEN NVL(A.PVSCOBASO,''X'') = ''S'' THEN E.ASOTELF1 ELSE B.TELMOVCOB END) CELULAR'
         +' FROM PVS306 A, PVS307 B, COB102 C, APO158 D, APO201 E'
         +' WHERE '+sBuscaFechas
         +' AND A.PVSESTLIQ IN (''02'',''05'', ''06'', ''04'' ) AND A.PVSLBENNR = B.PVSLBENNR'
         +' AND B.BANCOID = '+QuotedStr(DM1.cdsOficio.FieldByName('BANCOID').AsString)
         +' AND B.FORPAGOID = '+QuotedStr(DM1.cdsOficio.FieldByName('TIPDESEID').AsString)
         +' AND NVL(B.FLGVOUCHER, ''X'') = ''N'''
         +' AND TO_CHAR(B.FREG, ''YYYY'') = '+QuotedStr(Copy(DM1.cdsOficio.FieldByName('NOFID').AsString,1,4))
// Inicio HPC_201708_PRE
//MODIFICAR REPORTE DE ACTIVOS POR EDAD Y SEXO AL CIERRE DE CADA MES
         //+' AND B.PVSLNOFC  = '+QuotedStr(Copy(DM1.cdsOficio.FieldByName('NOFID').AsString,5,7))
         +' AND B.PVSLNOFC  = '+QuotedStr(DM1.cdsOficio.FieldByName('NOFID').AsString)
// Final HPC_201708_PRE
         +' AND B.AGENBCOID = C.AGENBCOID(+) AND C.DPTOID = D.DPTOID(+) AND A.ASOID = E.ASOID)'
         +' WHERE (CELULAR IS NULL OR LENGTH(TRIM(CELULAR)) <> 9 OR SUBSTR(CELULAR,1,1) <> ''9'' OR TRANSLATE(CELULAR,''T 0123456789'',''T'') IS NOT NULL)'
      Else
         xSql := 'SELECT ASODNI, ASOCODMOD, ASOAPENOMDNI, EMAILS'
         +' FROM (SELECT A.ASODNI, A.ASOCODMOD, SUBSTR(A.ASOAPENOMDNI,1,50) ASOAPENOMDNI, SUBSTR(TRIM(CASE WHEN NVL(A.PVSCOBASO,''X'') = ''S'' THEN E.ASOEMAIL ELSE B.EMAILCOB END),1,60) EMAILS'
         +' FROM PVS306 A, PVS307 B, COB102 C, APO158 D, APO201 E'
         +' WHERE '+sBuscaFechas
         +' AND A.PVSESTLIQ IN (''02'',''05'', ''06'', ''04'' ) AND A.PVSLBENNR = B.PVSLBENNR AND B.BANCOID = '+QuotedStr(DM1.cdsOficio.FieldByName('BANCOID').AsString)
         +' AND B.FORPAGOID = '+QuotedStr(DM1.cdsOficio.FieldByName('TIPDESEID').AsString)
         +' AND NVL(B.FLGVOUCHER, ''X'') = ''N'' AND TO_CHAR(B.FREG, ''YYYY'') = '+QuotedStr(Copy(DM1.cdsOficio.FieldByName('NOFID').AsString,1,4))
// Inicio HPC_201708_PRE
//MODIFICAR REPORTE DE ACTIVOS POR EDAD Y SEXO AL CIERRE DE CADA MES
         //+ ' AND B.PVSLNOFC  = '+QuotedStr(Copy(DM1.cdsOficio.FieldByName('NOFID').AsString,5,7))
         +' AND B.PVSLNOFC  = '+QuotedStr(DM1.cdsOficio.FieldByName('NOFID').AsString)
// Final HPC_201708_PRE
         +' AND B.AGENBCOID = C.AGENBCOID(+) AND C.DPTOID = D.DPTOID(+) AND A.ASOID = E.ASOID) WHERE SF_ASO_VALIDA_DIR_CORREO(EMAILS) <> 0';
   DM1.cdsReporte.Close;
   DM1.cdsReporte.DataRequest(xSql);
   DM1.cdsReporte.Open;
end;

procedure TFexpSMSEMAIL.FormActivate(Sender: TObject);
begin
   cargatitulooficio;
   cargagrid;
   habaccesos;
   DM1.xFlg := 'N';
end;

procedure TFexpSMSEMAIL.rgtipoClick(Sender: TObject);
begin
   cargagrid;
   habaccesos;   
end;

procedure TFexpSMSEMAIL.btncerrarClick(Sender: TObject);
begin
   Close;
end;

procedure TFexpSMSEMAIL.habaccesos;

begin
   If rgvalido.ItemIndex = 0 Then
   Begin
      If rgtipo.ItemIndex = 0 Then
      Begin
         btnexpSMS.Visible := True;
         btnexpSMS.Top  := 347;
         btnexpSMS.Left := 457;
         btnexpEMAIL.Visible := False;
      End
      Else
      Begin
         btnexpSMS.Visible := False;
         btnexpEMAIL.Visible := True;
         btnexpEMAIL.Top  := 347;
         btnexpEMAIL.Left := 457;
      End;
      btninconsistencia.Visible := False;
   End
   Else
   Begin
      btnexpSMS.Visible := False;
      btnexpEMAIL.Visible := False;
      btninconsistencia.Visible := True;
      btninconsistencia.Top  := 347;
      btninconsistencia.Left := 457;
   End;
end;

procedure TFexpSMSEMAIL.cargatitulooficio;
Var xSql:String;
begin
   edtnumoficio.Text := Copy(DM1.cdsOficio.FieldByName('NOFID').AsString,1,4)+'-'+Copy(DM1.cdsOficio.FieldByName('NOFID').AsString,5,7);
   edtrangofecha.Text := 'Del : '+DM1.cdsOficio.FieldByName('FECINIC').AsString+ ' Al : '+DM1.cdsOficio.FieldByName('FECFIN').AsString;
   edttipodesembolso.Text := 'Banco : '+DM1.cdsOficio.FieldByName('BANCOABR').AsString+' Forma de desembolso : '+DM1.cdsOficio.FieldByName('TIPDESEDES').AsString;
   DM1.cdsDocPago.First;
   xtotaloficio := 0;
   xcanemailvalido := 0;
   xcanemailinconsistente := 0;
   xcansmsvalido := 0;
   xcansmsinconsistente := 0;
   While Not DM1.cdsDocPago.Eof Do
   Begin
      xSql := 'SELECT SF_ASO_VALIDA_DIR_CORREO('+QuotedStr(DM1.cdsDocPago.FieldByName('EMAILCOB').AsString)+') VALOR FROM DUAL';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      If DM1.cdsQry.FieldByName('VALOR').AsInteger = 0 Then
         xcanemailvalido := xcanemailvalido  + 1
      Else
         xcanemailinconsistente := xcanemailinconsistente + 1;
     xSql := 'SELECT COUNT(1) CANTIDAD FROM DUAL WHERE  '+QuotedStr(DM1.cdsDocPago.FieldByName('MOVILCOB').AsString)
     +' IS NOT NULL AND LENGTH(TRIM('+QuotedStr(DM1.cdsDocPago.FieldByName('MOVILCOB').AsString)+')) = 9'
     +' AND SUBSTR('+QuotedStr(DM1.cdsDocPago.FieldByName('MOVILCOB').AsString)+',1,1) = ''9'' AND TRANSLATE('+QuotedStr(DM1.cdsDocPago.FieldByName('MOVILCOB').AsString)+',''T 0123456789'',''T'') IS NULL';
     DM1.cdsQry.Close;
     DM1.cdsQry.DataRequest(xSql);
     DM1.cdsQry.Open;
     If DM1.cdsQry.FieldByName('CANTIDAD').AsInteger = 1 Then
        xcansmsvalido := xcansmsvalido  + 1
     Else
        xcansmsinconsistente := xcansmsinconsistente + 1;
     xtotaloficio := xtotaloficio + 1;
     DM1.cdsDocPago.Next;
   End;
   edtemailvalido.Text := IntToStr(xcanemailvalido);
   edtemailinconsistente.Text := IntToStr(xcanemailinconsistente);
   edtsmsvalido.Text :=  IntToStr(xcansmsvalido);
   edtsmsinconsistente.Text := IntToStr(xcansmsinconsistente);
   edttotaloficio.Text := IntToStr(DM1.cdsDocPago.RecordCount);
end;

procedure TFexpSMSEMAIL.rgvalidoClick(Sender: TObject);
begin
   cargagrid;
   habaccesos;
end;

procedure TFexpSMSEMAIL.btnexpEMAILClick(Sender: TObject);
Var sBuscaFechas, xSql:String;
begin
   sBuscaFechas:='(( TO_DATE(A.PVSLFECBE) >= '+QuotedStr(DM1.cdsOficio.FieldByName('FECINIC').AsString)+' AND TO_DATE(A.PVSLFECBE) <= '+QuotedStr(DM1.cdsOficio.FieldByName('FECFIN').AsString)
   +' AND NVL(DIFERIDO, ''N'') = ''N'') OR ( TO_DATE(A.FECDIFLIQ) >= ' + QuotedStr(DM1.cdsOficio.FieldByName('FECINIC').AsString) + ' AND  TO_DATE(A.FECDIFLIQ) <= ' +QuotedStr(DM1.cdsOficio.FieldByName('FECFIN').AsString)+ ' AND NVL(DIFERIDO, ''N'') = ''S'' ))';
   xSql := 'SELECT PVSLBENNR, PVSLSEC, EMAILS, APEPATCOB, NOMCOB FROM (SELECT B.PVSLBENNR, B.PVSLSEC, TRIM(CASE WHEN NVL(A.PVSCOBASO,''X'') = ''S'' THEN E.ASOEMAIL ELSE B.EMAILCOB END) EMAILS,'
   +' B.NOMCOB, B.APEPATCOB FROM PVS306 A, PVS307 B, COB102 C, APO158 D, APO201 E, PRE_PAR_GENERALES F'
   +' WHERE '+sBuscaFechas
   +' AND A.PVSESTLIQ IN (''02'',''05'', ''06'', ''04'' ) AND A.PVSLBENNR = B.PVSLBENNR AND B.BANCOID = '+QuotedStr(DM1.cdsOficio.FieldByName('BANCOID').AsString)
   +' AND B.FORPAGOID = '+QuotedStr(DM1.cdsOficio.FieldByName('TIPDESEID').AsString)+' AND NVL(B.FLGVOUCHER, ''X'') = ''N'''
   +' AND TO_CHAR(B.FREG, ''YYYY'') = '+QuotedStr(Copy(DM1.cdsOficio.FieldByName('NOFID').AsString,1,4))
// Inicio HPC_201708_PRE
//MODIFICAR REPORTE DE ACTIVOS POR EDAD Y SEXO AL CIERRE DE CADA MES
//   +' AND B.PVSLNOFC  = '+QuotedStr(Copy(DM1.cdsOficio.FieldByName('NOFID').AsString,5,7))
   +' AND B.PVSLNOFC  = '+QuotedStr(DM1.cdsOficio.FieldByName('NOFID').AsString)
// Final HPC_201708_PRE
   +' AND B.AGENBCOID = C.AGENBCOID(+) AND C.DPTOID = D.DPTOID(+) AND A.ASOID = E.ASOID) WHERE SF_ASO_VALIDA_DIR_CORREO(EMAILS) = 0';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   While Not DM1.cdsQry.Eof Do
   Begin
      xSql := 'UPDATE PVS307 SET FECHOREMAIL = SYSDATE WHERE '
      +' PVSLBENNR = '+QuotedStr(DM1.cdsQry.FieldByName('PVSLBENNR').AsString)
      +' AND PVSLSEC = '+QuotedStr(DM1.cdsQry.FieldByName('PVSLSEC').AsString)
      +' AND APEPATCOB = '+QuotedStr(DM1.cdsQry.FieldByName('APEPATCOB').AsString)
      +' AND NOMCOB = '+QuotedStr(DM1.cdsQry.FieldByName('NOMCOB').AsString);
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      DM1.cdsQry.Next;
   End;
   DM1.HojaExcel('REPORTE_SMS', DM1.dsReporte, dbgExporta);
   DM1.xFlg := 'S';   
end;

procedure TFexpSMSEMAIL.btnexpSMSClick(Sender: TObject);
Var sBuscaFechas, xSql:String;
begin
   sBuscaFechas:='(( TO_DATE(A.PVSLFECBE) >= '+QuotedStr(DM1.cdsOficio.FieldByName('FECINIC').AsString)+' AND TO_DATE(A.PVSLFECBE) <= '+QuotedStr(DM1.cdsOficio.FieldByName('FECFIN').AsString)
   +' AND NVL(DIFERIDO, ''N'') = ''N'') OR ( TO_DATE(A.FECDIFLIQ) >= ' + QuotedStr(DM1.cdsOficio.FieldByName('FECINIC').AsString) + ' AND  TO_DATE(A.FECDIFLIQ) <= ' +QuotedStr(DM1.cdsOficio.FieldByName('FECFIN').AsString)+ ' AND NVL(DIFERIDO, ''N'') = ''S'' ))';
   xSql := 'SELECT PVSLBENNR, PVSLSEC, CELULAR, APEPATCOB, NOMCOB FROM'
   +' (SELECT B.PVSLBENNR, B.PVSLSEC, TRIM(CASE WHEN NVL(A.PVSCOBASO,''X'') = ''S'' THEN E.ASOTELF1 ELSE B.TELMOVCOB END) CELULAR,'
   +' B.APEPATCOB, B.NOMCOB FROM PVS306 A, PVS307 B, COB102 C, APO158 D, APO201 E'
   +' WHERE '+sBuscaFechas
   +' AND A.PVSESTLIQ IN (''02'',''05'', ''06'', ''04'' ) AND A.PVSLBENNR = B.PVSLBENNR AND B.BANCOID = '+QuotedStr(DM1.cdsOficio.FieldByName('BANCOID').AsString)
   +' AND B.FORPAGOID = '+QuotedStr(DM1.cdsOficio.FieldByName('TIPDESEID').AsString)
   +' AND NVL(B.FLGVOUCHER, ''X'') = ''N'' AND TO_CHAR(B.FREG, ''YYYY'') = '+QuotedStr(Copy(DM1.cdsOficio.FieldByName('NOFID').AsString,1,4))
// Inicio HPC_201708_PRE
//MODIFICAR REPORTE DE ACTIVOS POR EDAD Y SEXO AL CIERRE DE CADA MES
//   + ' AND B.PVSLNOFC  = '+QuotedStr(Copy(DM1.cdsOficio.FieldByName('NOFID').AsString,5,7))
   + ' AND B.PVSLNOFC  = '+QuotedStr(DM1.cdsOficio.FieldByName('NOFID').AsString)
// Final HPC_201708_PRE
   +' AND B.AGENBCOID = C.AGENBCOID(+) AND C.DPTOID = D.DPTOID(+) AND A.ASOID = E.ASOID)'
   +' WHERE CELULAR IS NOT NULL AND LENGTH(TRIM(CELULAR)) = 9 AND SUBSTR(CELULAR,1,1) = ''9'' AND TRANSLATE(CELULAR,''T 0123456789'',''T'') IS NULL';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   While Not DM1.cdsQry.Eof Do
   Begin
      xSql := 'UPDATE PVS307 SET FECHORMOVIL = SYSDATE WHERE '
      +' PVSLBENNR = '+QuotedStr(DM1.cdsQry.FieldByName('PVSLBENNR').AsString)
      +' AND PVSLSEC = '+QuotedStr(DM1.cdsQry.FieldByName('PVSLSEC').AsString)
      +' AND APEPATCOB = '+QuotedStr(DM1.cdsQry.FieldByName('APEPATCOB').AsString)
      +' AND NOMCOB = '+QuotedStr(DM1.cdsQry.FieldByName('NOMCOB').AsString);
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      DM1.cdsQry.Next;
   End;
   DM1.HojaExcel('REPORTE_SMS', DM1.dsReporte, dbgExporta);
   DM1.xFlg := 'S';   
end;
procedure TFexpSMSEMAIL.btninconsistenciaClick(Sender: TObject);
begin
   DM1.HojaExcel('REPORTE_INCONSISTENCIAS', DM1.dsReporte, dbgExporta);
end;

End.
