// Actualizaciones
// HPC_201207_PRE : Se añade la cuenta contable para el caso que el voucher tenga que mostrar el registo monto cobrado por desgravamen.
// DPP_201207_PRE : Se realiza el pase a producción a partir del HPC_201207.
// HPC_201307_PRE : Se añade imagen de nuevo logo institucional
// SPP_201401_PRE : Se realiza el pase a producción a partir del pase HPC_201307_PRE
// HPC_201609_PRE : Se controla los registos que van a contabizar el total de la cuenta individual.

unit PRE252;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, wwdblook, Mask, DB,
  ExtCtrls, wwdbdatetimepicker, ppCtrls, ppPrnabl, ppClass, ppBands,
  ppCache, ppComm, ppRelatv, ppProd, ppReport, DBClient, ppDB, ppDBPipe,
  ppDBBDE, ppParameter, jpeg; // SPP_201401_PRE


type
  TFcobliq = class(TForm)
    dbgcheques: TwwDBGrid;
    gbfiltra: TGroupBox;
    Label1: TLabel;
    dbdtpinicial: TwwDBDateTimePicker;
    Label2: TLabel;
    dbdtpfinal: TwwDBDateTimePicker;
    lblbanco: TLabel;
    dblcestvou: TwwDBLookupCombo;
    pnlbanco: TPanel;
    medesestvou: TMaskEdit;
    btnfiltrar: TBitBtn;
    btncerrar: TBitBtn;
    btncheque: TBitBtn;
    btnvoucher: TBitBtn;
    pprepvou: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
//Inicio: SPP_201401_PRE
    // ppLabel1: TppLabel; 
    // ppLabel2: TppLabel; 
//Fin: SPP_201401_PRE
    ppLabel3: TppLabel;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppLabel4: TppLabel;
    pplfecces: TppLabel;
    pplfecexp: TppLabel;
    pplemiche: TppLabel;
    ppShape4: TppShape;
    ppShape3: TppShape;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    pplvoucher: TppLabel;
    pplliquidacion: TppLabel;
    pplmonche: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    pplfecche: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    pplnumche: TppLabel;
    ppLabel25: TppLabel;
    ppltipbendes: TppLabel;
    ppltippag: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppShape7: TppShape;
    ppShape8: TppShape;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppShape9: TppShape;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppShape10: TppShape;
    ppShape11: TppShape;
    ppShape12: TppShape;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppShape13: TppShape;
    ppLabel52: TppLabel;
    ppShape14: TppShape;
    ppLabel53: TppLabel;
    bdevoucher: TppBDEPipeline;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppSummaryBand1: TppSummaryBand;
    ppShape15: TppShape;
    pplbancodes: TppLabel;
    ppShape16: TppShape;
    pplasoapeben: TppLabel;
    ppShape17: TppShape;
    pplmonchedes: TppLabel;
    ppLabel5: TppLabel;
    pnlcheque: TPanel;
    gbcheque: TGroupBox;
    btncierracheque: TBitBtn;
    Panel2: TPanel;
    memonche: TMaskEdit;
    Label3: TLabel;
    btngraba: TBitBtn;
    btnimprimecheque: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    pnlnumche: TPanel;
    menumcheque: TMaskEdit;
    Panel4: TPanel;
    meapenomben: TMaskEdit;
    pprcheque: TppReport;
    ppbdecheques: TppBDEPipeline;
    ppParameterList1: TppParameterList;
    ppDetailBand2: TppDetailBand;
    ppGiradoa: TppLabel;
    ppImporte: TppLabel;
    ppMontoLetras: TppLabel;
    ppDia: TppLabel;
    ppMes: TppLabel;
    ppAno: TppLabel;
    btneliche: TBitBtn;
    pnlanuche: TPanel;
    gbanuche: TGroupBox;
    btnanulacheque: TBitBtn;
    btncerraranu: TBitBtn;
    Label6: TLabel;
    pnlapenombenanu: TPanel;
    meapenombenanu: TMaskEdit;
    Label7: TLabel;
    pnlmoncheanu: TPanel;
    memoncheanu: TMaskEdit;
    Label8: TLabel;
    pnlnumcheanu: TPanel;
    menumcheanu: TMaskEdit;
    Label9: TLabel;
    pnlobsanu: TPanel;
    meobsanu: TMaskEdit;
    Label10: TLabel;
    pnlusuanu: TPanel;
    meusuanu: TMaskEdit;
    Label11: TLabel;
    pnlfecanu: TPanel;
    mefecanu: TMaskEdit;
    Label12: TLabel;
    pnldocideben: TPanel;
    medocideben: TMaskEdit;
    //Inicio: SPP_201401_PRE
    ppImage1: TppImage;
    btnDesembolso: TBitBtn;
    //Fin: SPP_201401_PRE
    procedure FormActivate(Sender: TObject);
    procedure dblcestvouChange(Sender: TObject);
    procedure btnfiltrarClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure btnvoucherClick(Sender: TObject);
    procedure btnchequeClick(Sender: TObject);
    procedure btncierrachequeClick(Sender: TObject);
    procedure btngrabaClick(Sender: TObject);
    procedure btnimprimechequeClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure pprchequePrintingComplete(Sender: TObject);
    procedure btncerraranuClick(Sender: TObject);
    procedure btnanulachequeClick(Sender: TObject);
    procedure btnelicheClick(Sender: TObject);
    procedure pprepvouPrintingComplete(Sender: TObject);
    procedure btnDesembolsoClick(Sender: TObject); // SPP_201401_PRE
 // Inicio: DPP_201207_PRE
    {
    procedure dbgchequesRowChanged(Sender: TObject);
    }
 // Fin: DPP_201207_PRE
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fcobliq: TFcobliq;

implementation

uses PREDM;

{$R *.dfm}

procedure TFcobliq.FormActivate(Sender: TObject);
Var xSql, xfecini:String;
begin

  pnlcheque.Visible := False;
  pnlanuche.Visible := False;

  xSql := 'SELECT PVSESTDSG, PVSESTDES FROM PVS102 A WHERE PVSDOC = ''V'' AND PVSESTDSG IN (''01'',''02'')';
  DM1.cdsSitCta.Close;
  DM1.cdsSitCta.DataRequest(xSql);
  DM1.cdsSitCta.Open;

  dblcestvou.Selected.Clear;
  dblcestvou.Selected.Add('PVSESTDSG'#9'2'#9'Tipo'#9#9);
  dblcestvou.Selected.Add('PVSESTDES'#9'25'#9'Descripción'#9#9);

  dblcestvou.Text := '01';
  xfecini := '01/'+copy(DateToStr(date),4,2)+'/'+copy(DateToStr(date),7,4);
  dbdtpfinal.Date   := date;
  dbdtpinicial.Date := StrToDate(xfecini);

  xSql := 'SELECT A.PVSLBENNR, A.PVSNVOU, B.BENEFDES, A.APENOMBEN, A.DOCIDEBEN, A.MONCHE, C.PVSESTDES, A.ASOID, A.BANCOID, A.ESTCHE,'
  +' A.NUMCHE, A.USUGENCHE, A.FECGENCHE, A.USUANU, A.FECANU, A.MOTANU, A.PVSLFECBE, A.PVSLTIPBE, A.PORDES, A.USUIMPVOU, A.FECIMPVOU'
  +' FROM PVS_CHE_GEN_CAB A, TGE186 B, (SELECT PVSESTDSG, PVSESTDES FROM PVS102 A WHERE PVSDOC = ''V'') C'
  +' WHERE A.MONCHE > 0 AND NVL(ESTCHE, ''XX'') = '+QuotedStr(dblcestvou.Text)
  +' AND A.PVSLFECBE >= '+QuotedStr(DateToStr(dbdtpinicial.Date))+' AND A.PVSLFECBE <= '+QuotedStr(DateToStr(dbdtpfinal.Date))
  +' AND A.PVSLTIPBE = B.TIPBENEF AND A.ESTCHE = C.PVSESTDSG';
  DM1.cdsTransacciones.Close;
  DM1.cdsTransacciones.DataRequest(xSql);
  DM1.cdsTransacciones.Open;

  dbgcheques.Selected.Clear;
  dbgcheques.Selected.Add('PVSLFECBE'#9'10'#9'Fecha de~Liquidación'#9#9);
  dbgcheques.Selected.Add('PVSLBENNR'#9'11'#9'Número de~Liquidación'#9#9);
  dbgcheques.Selected.Add('PVSNVOU'#9'7'#9'Número de~Voucher'#9#9);
  dbgcheques.Selected.Add('BENEFDES'#9'15'#9'Tipo de~Beneficio'#9#9);
  dbgcheques.Selected.Add('APENOMBEN'#9'35'#9'Apellidos y nombres~del beneficiario'#9#9);
  dbgcheques.Selected.Add('DOCIDEBEN'#9'7'#9'Número de~documento'#9#9);
  dbgcheques.Selected.Add('MONCHE'#9'8'#9'Monto a~girar'#9#9);
  dbgcheques.Selected.Add('PVSESTDES'#9'12'#9'Situación del~cheque'#9#9);
  dbgcheques.ApplySelected;
  TNumericField(DM1.cdsTransacciones.FieldByName('MONCHE')).DisplayFormat := '###,###,##0.00';
  dblcestvou.SetFocus;

end;

procedure TFcobliq.dblcestvouChange(Sender: TObject);
begin
  If Length(dblcestvou.Text) = 2 then
  Begin
    If DM1.cdsSitCta.Locate('PVSESTDSG', dblcestvou.Text, []) Then
    Begin
      medesestvou.Text := DM1.cdsSitCta.FieldByName('PVSESTDES').AsString;
    End
    Else
    Begin
      MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
      dblcestvou.Text := '';
      medesestvou.Text := '';
    End;
  End;
  If dblcestvou.Text = '02' Then
     btnvoucher.Visible := true
  Else
     btnvoucher.Visible := false;
end;

procedure TFcobliq.btnfiltrarClick(Sender: TObject);
Var xSql:String;
begin
  If dblcestvou.Text = '' Then
  Begin
    MessageDlg('Seleccione el estado del Voucher', mtInformation, [mbOk], 0);
    dblcestvou.SetFocus;
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
    dbdtpInicial.SetFocus;
    Exit;
  End;
  xSql := 'SELECT A.PVSLBENNR, A.PVSNVOU, B.BENEFDES, A.APENOMBEN, A.DOCIDEBEN, A.MONCHE, C.PVSESTDES, A.ASOID, A.BANCOID,'
  +' A.NUMCHE, A.USUGENCHE, A.FECGENCHE, A.USUANU, A.FECANU, A.MOTANU, A.PVSLFECBE, A.PORDES, A.PVSLTIPBE, A.ESTCHE, A.USUIMPVOU, A.FECIMPVOU'
  +' FROM PVS_CHE_GEN_CAB A, TGE186 B, (SELECT PVSESTDSG, PVSESTDES FROM PVS102 A WHERE PVSDOC = ''V'') C'
  +' WHERE NVL(A.MONCHE,0) > 0 AND NVL(ESTCHE, ''XX'') = '+QuotedStr(dblcestvou.Text)
  +' AND A.PVSLFECBE >= '+QuotedStr(DateToStr(dbdtpinicial.Date))+' AND A.PVSLFECBE <= '+QuotedStr(DateToStr(dbdtpfinal.Date))
  +' AND A.PVSLTIPBE = B.TIPBENEF AND A.ESTCHE = C.PVSESTDSG';
  DM1.cdsTransacciones.Close;
  DM1.cdsTransacciones.DataRequest(xSql);
  DM1.cdsTransacciones.Open;
  TNumericField(DM1.cdsTransacciones.FieldByName('MONCHE')).DisplayFormat := '###,###,##0.00';
  dbgcheques.Refresh;
  If DM1.cdsTransacciones.RecordCount > 0 Then
  Begin
    If dblcestvou.Text = '01' Then
    Begin
      btncheque.Enabled := True;
   //   btnvoucher.Enabled := False;
    End
    Else
    Begin
      btncheque.Enabled := False;
//      btnvoucher.Enabled := True;
    End;
    If DM1.wNivel = '03' Then
       If dblcestvou.Text = '02' Then btneliche.Enabled := True Else btneliche.Enabled := False;
  End
  Else
  Begin
    btncheque.Enabled := False;
//    btnvoucher.Enabled := False;
  End;
end;

procedure TFcobliq.btncerrarClick(Sender: TObject);
begin
 Fcobliq.Close;
end;

procedure TFcobliq.btnvoucherClick(Sender: TObject);
Var xSql, detalle:String;
    xtamano:Integer;
begin
  If (DM1.cdsTransacciones.FieldByName('NUMCHE').AsString = '') Then
  Begin
    MessageDlg('Ingrese el número de cheque', mtInformation, [mbOk], 0);
    Exit;
  End;

  If (DM1.cdsTransacciones.FieldByName('USUIMPVOU').AsString <> '') And
     (DM1.wNivel <> '03') Then
  Begin
    MessageDlg('Voucher ya sue impreso', mtInformation, [mbOk], 0);
    Exit;
  End;

  xSql := 'DELETE FROM PVS_DET_VOU';
  DM1.DCOM1.AppServer.EjecutaSql(xSql);
  // Voucher
  // Insertando el monto del beneficio
  // Inicio: HPC_201609_PRE
  // Se controla que al momento de tomar el monto del beneficio no tome la descripcipión del total cuenta individual
  xSql := 'SELECT SUM(NVL(PVSLMONTO,0)) PVSLMONTO  FROM PVS307 WHERE PVSLBENNR = '+QuotedStr(DM1.cdsTransacciones.FieldByName('PVSLBENNR').AsString)
  // +' AND PVSLAGRID = ''DET''';
  +' AND PVSLAGRID = ''DET'' AND TIPDES <> ''TC''';
  // Fin: HPC_201609_PRE
  DM1.cdsQry10.Close;
  DM1.cdsQry10.DataRequest(xSql);
  DM1.cdsQry10.Open;


  xSql := 'SELECT BENEFDES, CUENTAID FROM TGE186 WHERE TIPBENEF = '+QuotedStr(DM1.cdsTransacciones.FieldByName('PVSLTIPBE').AsString);
  DM1.cdsQry11.Close;
  DM1.cdsQry11.DataRequest(xSql);
  DM1.cdsQry11.Open;

  xSql := 'INSERT INTO PVS_DET_VOU (CUENTA, DETALLE, DEBE, HABER, CORRELATIVO)'
  +' VALUES('+QuotedStr(DM1.cdsQry11.FieldByName('CUENTAID').AsString)
  +','+QuotedStr(DM1.cdsQry11.FieldByName('BENEFDES').AsString)
  +','+FloatToStr(DM1.Valores(FloatToStrF(DM1.cdsQry10.FieldByName('PVSLMONTO').AsFloat*(DM1.cdsTransacciones.FieldByName('PORDES').AsFloat/100),ffNumber,15,2)))
  +', NULL, ''01'' )';
  DM1.DCOM1.AppServer.EjecutaSql(xSql);
  // Insertando devoluciones
  xSql := 'SELECT SUM(NVL(PVSLMONTO,0)) PVSLMONTO FROM PVS307 WHERE PVSLBENNR = '+QuotedStr(DM1.cdsTransacciones.FieldByName('PVSLBENNR').AsString)+' AND PVSLAGRID = ''DEV''';
  DM1.cdsQry10.Close;
  DM1.cdsQry10.DataRequest(xSql);
  DM1.cdsQry10.Open;
  If DM1.cdsQry10.FieldByName('PVSLMONTO').AsFloat > 0 Then
  Begin
    xSql := 'INSERT INTO PVS_DET_VOU (CUENTA, DETALLE, DEBE, HABER, CORRELATIVO)'
    +' VALUES('+QuotedStr('4810002')
    +','+QuotedStr('DESCUENTOS INDEBIDOS DE APORTES')
    +','+FloatToStr(DM1.Valores(FloatToStrF(DM1.cdsQry10.FieldByName('PVSLMONTO').AsFloat*(DM1.cdsTransacciones.FieldByName('PORDES').AsFloat/100),ffNumber,15,2)))
    +', NULL, ''02'' )';
    DM1.DCOM1.AppServer.EjecutaSql(xSql);
  End;
  // Insertando nivelaciones de aportes
  xSql := 'SELECT SUM(NVL(PVSLMONTO,0)) PVSLMONTO FROM PVS307 WHERE PVSLBENNR = '+QuotedStr(DM1.cdsTransacciones.FieldByName('PVSLBENNR').AsString)+' AND PVSLAGRID = ''DSC'' AND TIPDES = ''A''';
  DM1.cdsQry10.Close;
  DM1.cdsQry10.DataRequest(xSql);
  DM1.cdsQry10.Open;
  If DM1.cdsQry10.FieldByName('PVSLMONTO').AsFloat > 0 Then
  Begin
    xSql := 'INSERT INTO PVS_DET_VOU (CUENTA, DETALLE, DEBE, HABER, CORRELATIVO)'
    +' VALUES('+QuotedStr('4810001')
    +','+QuotedStr('NIVELACION DE APORTES (APORTES NO PAGADOS)')
    +', NULL'
    +','+FloatToStr(DM1.Valores(FloatToStrF(DM1.cdsQry10.FieldByName('PVSLMONTO').AsFloat*(DM1.cdsTransacciones.FieldByName('PORDES').AsFloat/100),ffNumber,15,2)))
    +', ''03'' )';
    DM1.DCOM1.AppServer.EjecutaSql(xSql);
  End;

  // No se incluye cobros por transferencias
  // ya que esto lo paga el que cobra por giro
  //Tomando la forma de pago
  xSql := 'SELECT PVSLAGRID, PVSLMONTO FROM PVS307 WHERE PVSLBENNR = '+QuotedStr(DM1.cdsTransacciones.FieldByName('PVSLBENNR').AsString)+' AND PVSLNVOU = '+QuotedStr(DM1.cdsTransacciones.FieldByName('PVSNVOU').AsString)
  +' AND PVSLAGRID IN (''FPG'',''RET'') AND FLGVOUCHER = ''N''';
  DM1.cdsQry10.Close;
  DM1.cdsQry10.DataRequest(xSql);
  DM1.cdsQry10.Open;

  If DM1.cdsQry10.FieldByName('PVSLAGRID').AsString <> 'RET' Then
  Begin
    // Insertando creditos
 // Inicio: DPP_201207_PRE
    xSql := 'SELECT CREDID, NVL(CREAMORT,0) CREAMORT, NVL(CREINTERES,0) CREINTERES, NVL(CREFLAT,0) CREFLAT, NVL(MONCOBDESGRAV,0) MONCOBDESGRAV FROM PVS307 WHERE PVSLBENNR = '+QuotedStr(DM1.cdsTransacciones.FieldByName('PVSLBENNR').AsString)+' AND PVSLAGRID = ''DSC'' AND TIPDES = ''C''';
 // Fin: DPP_201207_PRE
    DM1.cdsQry12.Close;
    DM1.cdsQry12.DataRequest(xSql);
    DM1.cdsQry12.Open;
    While Not DM1.cdsQry12.Eof Do
    Begin
      xSql := 'SELECT TIPCREABR, CUENTAID, CTAINT, CTAFLAT  FROM CRE110 WHERE TIPCREID = '+QuotedStr(Copy(DM1.cdsQry12.FieldByName('CREDID').AsString,7,2));
      DM1.cdsQry13.Close;
      DM1.cdsQry13.DataRequest(xSql);
      DM1.cdsQry13.Open;
      // Insertando Amortizacion
      detalle := 'AMORTIZACION ('+DM1.cdsQry13.FieldByName('TIPCREABR').AsString+' Nº : '+Copy(DM1.cdsQry12.FieldByName('CREDID').AsString,11,5)+')';
      xSql := 'INSERT INTO PVS_DET_VOU (CUENTA, DETALLE, DEBE, HABER, CORRELATIVO)'
      +' VALUES('+QuotedStr(DM1.cdsQry13.FieldByName('CUENTAID').AsString)
      +','+QuotedStr(detalle)
      +', NULL'
      +','+FloatToStr(DM1.Valores(FloatToStrF(DM1.cdsQry12.FieldByName('CREAMORT').AsFloat*(DM1.cdsTransacciones.FieldByName('PORDES').AsFloat/100),ffNumber,15,2)))
      +', ''04'')';
      DM1.DCOM1.AppServer.EjecutaSql(xSql);

      // Insertando el Interes
      xSql := 'INSERT INTO PVS_DET_VOU (CUENTA, DETALLE, DEBE, HABER, CORRELATIVO)'
      +' VALUES('+QuotedStr(DM1.cdsQry13.FieldByName('CTAINT').AsString)
      +','+QuotedStr('INTERES DE CREDITO')
      +', NULL'
      +','+FloatToStr(DM1.Valores(FloatToStrF(DM1.cdsQry12.FieldByName('CREINTERES').AsFloat*(DM1.cdsTransacciones.FieldByName('PORDES').AsFloat/100),ffNumber,15,2)))
      +', ''05'' )';
      DM1.DCOM1.AppServer.EjecutaSql(xSql);

      // Inicio: DPP_201207_PRE
      // Insertando desgravamen
      xSql := 'INSERT INTO PVS_DET_VOU (CUENTA, DETALLE, DEBE, HABER, CORRELATIVO)'
      +' VALUES('+QuotedStr(DM1.cdsQry13.FieldByName('CTAINT').AsString)
      +','+QuotedStr('DESGRAVAMEN DEL CREDITO')
      +', NULL'
      +','+FloatToStr(DM1.Valores(FloatToStrF(DM1.cdsQry12.FieldByName('MONCOBDESGRAV').AsFloat*(DM1.cdsTransacciones.FieldByName('PORDES').AsFloat/100),ffNumber,15,2)))
      +', ''05'' )';
      DM1.DCOM1.AppServer.EjecutaSql(xSql);
      // Fin: DPP_201207_PRE

      // Insertando el Flat
      xSql := 'INSERT INTO PVS_DET_VOU (CUENTA, DETALLE, DEBE, HABER, CORRELATIVO)'
      +' VALUES('+QuotedStr(DM1.cdsQry13.FieldByName('CTAFLAT').AsString)
      +','+QuotedStr('GASTOS DE CREDITO')
      +', NULL'
      +','+FloatToStr(DM1.Valores(FloatToStrF(DM1.cdsQry12.FieldByName('CREFLAT').AsFloat*(DM1.cdsTransacciones.FieldByName('PORDES').AsFloat/100),ffNumber,15,2)))
      +', ''06'')';
      DM1.DCOM1.AppServer.EjecutaSql(xSql);
      DM1.cdsQry12.Next;
    End;
  End;

  If DM1.cdsQry10.FieldByName('PVSLMONTO').AsFloat <> DM1.cdsTransacciones.FieldByName('MONCHE').AsFloat Then
  Begin
    // Se ha detectado un error en el voucher
    ShowMessage('ERROR');
    Exit;
  End;

  xSql := 'INSERT INTO PVS_DET_VOU (CUENTA, DETALLE, DEBE, HABER, CORRELATIVO)'
  +' VALUES('+QuotedStr('104010301')
  +','+QuotedStr('CTA. CTE (BENEFICIOS)')
  +', NULL'
  +','+FloatToStr(DM1.Valores(FloatToStrF(DM1.cdsTransacciones.FieldByName('MONCHE').AsFloat,ffNumber,15,2)))
  +', ''07'')';
  DM1.DCOM1.AppServer.EjecutaSql(xSql);
  xSql := 'DELETE PVS_DET_VOU WHERE NVL(DEBE,0) = 0 AND NVL(HABER,0) = 0';
  DM1.DCOM1.AppServer.EjecutaSql(xSql);

  xSql := 'SELECT CORRELATIVO, CUENTA, DETALLE, SUM(NVL(DEBE,0)) DEBE, SUM(NVL(HABER,0)) HABER FROM PVS_DET_VOU'
  +' GROUP BY CORRELATIVO, CUENTA, DETALLE ORDER BY CORRELATIVO';
  DM1.cdsReporte.Close;
  DM1.cdsReporte.DataRequest(xSql);
  DM1.cdsReporte.Open;
  xSql := 'SELECT * FROM PVS306 WHERE ASOID = '+QuotedStr(DM1.cdsTransacciones.FieldByName('ASOID').AsString)
  +' AND PVSLBENNR = '+QuotedStr(DM1.cdsTransacciones.FieldByName('PVSLBENNR').AsString);
  DM1.cdsCabLiq.Close;
  DM1.cdsCabLiq.DataRequest(xSql);
  DM1.cdsCabLiq.Open;
  pplvoucher.Caption     := DM1.cdsTransacciones.FieldByName('PVSNVOU').AsString;
  pplliquidacion.Caption := Copy(DM1.cdsTransacciones.FieldByName('PVSLBENNR').AsString,5,7);
  pplmonche.Caption      := FloatToStrF(DM1.cdsTransacciones.FieldByName('MONCHE').AsFloat , ffNumber, 10,2);
  pplfecces.Caption := 'CESE : '+DM1.cdsCabLiq.FieldByname('ASOFRESCESE').AsString;
  pplfecexp.Caption := 'FEC. EXPED. : '+Copy(DM1.cdsCabLiq.FieldByname('PVSLFECBE').AsString,1,10);
  pplemiche.Caption := 'EMI. CHEQUE : '+DateToStr(date);
  pplfecche.Caption := DateToStr(date);
  pplnumche.Caption := DM1.cdsTransacciones.FieldByName('NUMCHE').AsString;
  ppltipbendes.Caption := Copy(DM1.cdsTransacciones.FieldByName('BENEFDES').AsString,4,13);
  ppltippag.Caption    := 'PAGO DE BENEFICIO POR CAPITAL DE '+Copy(DM1.cdsTransacciones.FieldByName('BENEFDES').AsString,4,13);
  pplasoapeben.Caption := DM1.cdsTransacciones.FieldByName('APENOMBEN').AsString;
  xSql := 'SELECT * FROM TGE105 WHERE BANCOID = '+QuotedStr(DM1.cdsTransacciones.FieldByName('BANCOID').AsString);
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  pplbancodes.Caption  := DM1.cdsQry.FieldByName('BANCONOM').AsString;
  xtamano := length(Trim(DM1.NumtoStr(DM1.cdsTransacciones.FieldByName('MONCHE').AsFloat)+' NUEVOS SOLES'));
  pplmonchedes.Caption := Trim(DM1.NumtoStr(DM1.cdsTransacciones.FieldByName('MONCHE').AsFloat)+' NUEVOS SOLES')+dm1.replace('*', 71-xtamano);
  DM1.xSgr := 'N';
  pprepvou.Print;
  pprepvou.Stop;
  If DM1.xSgr = 'S' Then
  Begin
    xSql := 'UPDATE PVS_CHE_GEN_CAB SET USUIMPVOU = '+QuotedStr(DM1.wUsuario)+', FECIMPVOU = SYSDATE'
    +' WHERE PVSLBENNR = '+QuotedStr(DM1.cdsTransacciones.FieldByName('PVSLBENNR').AsString)+' AND PVSNVOU = '+QuotedStr(DM1.cdsTransacciones.FieldByName('PVSNVOU').AsString);
    DM1.DCOM1.AppServer.EjecutaSql(xSql);

    xSql := 'SELECT A.PVSLBENNR, A.PVSNVOU, B.BENEFDES, A.APENOMBEN, A.DOCIDEBEN, A.MONCHE, C.PVSESTDES, A.ASOID, A.BANCOID,'
    +' A.NUMCHE, A.USUGENCHE, A.FECGENCHE, A.USUANU, A.FECANU, A.MOTANU, A.PVSLFECBE, A.PORDES, A.PVSLTIPBE, A.ESTCHE, A.USUIMPVOU, A.FECIMPVOU'
    +' FROM PVS_CHE_GEN_CAB A, TGE186 B, (SELECT PVSESTDSG, PVSESTDES FROM PVS102 A WHERE PVSDOC = ''V'') C'
    +' WHERE NVL(A.MONCHE,0) > 0 AND NVL(ESTCHE, ''XX'') = '+QuotedStr(dblcestvou.Text)
    +' AND A.PVSLFECBE >= '+QuotedStr(DateToStr(dbdtpinicial.Date))+' AND A.PVSLFECBE <= '+QuotedStr(DateToStr(dbdtpfinal.Date))
    +' AND A.PVSLTIPBE = B.TIPBENEF AND A.ESTCHE = C.PVSESTDSG';
    DM1.cdsTransacciones.Close;
    DM1.cdsTransacciones.DataRequest(xSql);
    DM1.cdsTransacciones.Open;
    MessageDlg('Voucher Impreso Ok', mtInformation, [mbOk], 0);
  End;

End;

procedure TFcobliq.btnchequeClick(Sender: TObject);
Var xSql:String;
begin
  pnlcheque.Visible := true;
  pnlcheque.Top  := 170;
  pnlcheque.Left := 150;
  xSql := 'SELECT * FROM PVS_CHE_GEN_CAB WHERE ASOID = '+QuotedStr(DM1.cdsTransacciones.FieldByName('ASOID').AsString)
  +' AND PVSLBENNR = '+QuotedStr(DM1.cdsTransacciones.FieldByName('PVSLBENNR').AsString)
  +' AND APENOMBEN = '+QuotedStr(DM1.cdsTransacciones.FieldByName('APENOMBEN').AsString)
  +' AND PVSNVOU = '+QuotedStr(DM1.cdsTransacciones.FieldByName('PVSNVOU').AsString);
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  meapenomben.Text := DM1.cdsQry.FieldByName('APENOMBEN').AsString;
  memonche.Text    := FloatToStrF(DM1.cdsQry.FieldByName('MONCHE').AsFloat, ffNumber,10,2);
  menumcheque.Text := DM1.cdsQry.FieldByName('NUMCHE').AsString;
  If menumcheque.Text = '' Then
  Begin
    menumcheque.Enabled := True;
    menumcheque.SetFocus;
    btngraba.Enabled := True;
    btnimprimecheque.Enabled := False
  End
  Else
  Begin
    menumcheque.Enabled := False;
    btngraba.Enabled := False;
    btnimprimecheque.Enabled := True
  End;
end;

procedure TFcobliq.btncierrachequeClick(Sender: TObject);
begin
  pnlcheque.Visible := False;
end;

procedure TFcobliq.btngrabaClick(Sender: TObject);
Var xSql:String;
begin
 // Grabar numero de cheque para poder imprimir
 If  Length(Trim(menumcheque.Text)) = 8 Then
 Begin
   If MessageDlg('¿ Seguro de grabar cheque ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
     xSql := 'UPDATE PVS_CHE_GEN_CAB SET NUMCHE = '+QuotedStr(menumcheque.Text)
     +' ,USUGENCHE = '+QuotedStr(DM1.wUsuario)
     +' ,FECGENCHE = SYSDATE'
     +' WHERE ASOID = '+QuotedStr(DM1.cdsTransacciones.FieldByName('ASOID').AsString)
     +' AND PVSLBENNR = '+QuotedStr(DM1.cdsTransacciones.FieldByName('PVSLBENNR').AsString)
     +' AND PVSNVOU   = '+QuotedStr(DM1.cdsTransacciones.FieldByName('PVSNVOU').AsString);
     DM1.DCOM1.AppServer.EjecutaSql(xSql);
     xSql := 'INSERT INTO PVS_CHE_GEN_DET SELECT * FROM PVS_CHE_GEN_CAB WHERE'
     +' ASOID = '+QuotedStr(DM1.cdsTransacciones.FieldByName('ASOID').AsString)
     +' AND PVSLBENNR = '+QuotedStr(DM1.cdsTransacciones.FieldByName('PVSLBENNR').AsString)
     +' AND APENOMBEN = '+QuotedStr(DM1.cdsTransacciones.FieldByName('APENOMBEN').AsString);
     DM1.DCOM1.AppServer.EjecutaSql(xSql);

     // Actulizando numero de cheque en la liquidación
     xSql := 'UPDATE PVS307 SET NROCHEQUE = '+QuotedStr(menumcheque.Text)
     +', FECPAG = TO_CHAR(SYSDATE, ''DD/MM/YYYY'')'
     +', USUPAG = '+QuotedStr(DM1.wUsuario)
     +' WHERE PVSLBENNR = '+QuotedStr(DM1.cdsTransacciones.FieldByName('PVSLBENNR').AsString)
     +' AND PVSLNVOU   = '+QuotedStr(DM1.cdsTransacciones.FieldByName('PVSNVOU').AsString);

     DM1.DCOM1.AppServer.EjecutaSql(xSql);
     MessageDlg('Grabación de cheque Ok', mtInformation, [mbOk], 0);
     btngraba.Enabled := False;
     btnimprimecheque.Enabled := True;
   End;
 End
 Else
 Begin
   MessageDlg('No se ingreso número de cheque'+#13+'o la longitud del número de cheque no es la correcta', mtInformation, [mbOk], 0);
   Exit;
 End;
End;

procedure TFcobliq.btnimprimechequeClick(Sender: TObject);
Var xSql:String;
ano,mes,dia:Word;
begin
  DM1.xSgr := 'N';
  If Application.MessageBox( 'Coloque Cheque en la Impresora', 'Confirmación Impresión', MB_OKCANCEL + MB_DEFBUTTON1) = IDOK Then
  Begin
    DecodeDate(date, ano,mes,dia);
    ppDia.Caption := DM1.StrZero(IntToStr(dia),2);
    ppmes.Caption := DM1.StrZero(IntToStr(mes),2);
    ppAno.Caption := DM1.StrZero(IntToStr(ano),4);
    ppImporte.Caption     := StringOfChar('*', 15-length(FloatToStrF(DM1.cdsQry.FieldByName('MONCHE').AsFloat, ffNumber,10,2)))+FloatToStrF(DM1.cdsQry.FieldByName('MONCHE').AsFloat, ffNumber,10,2);
    ppGiradoa.Caption     := Trim(DM1.cdsQry.FieldByName('APENOMBEN').AsString)+StringOfChar('*', 75-length(Trim(DM1.cdsQry.FieldByName('APENOMBEN').AsString)));
    ppMontoLetras.Caption := Trim(DM1.NumtoStr(DM1.cdsQry.FieldByName('MONCHE').AsFloat))+StringOfChar('*', 90-length(Trim(DM1.NumtoStr(DM1.cdsQry.FieldByName('MONCHE').AsFloat))));
    pprcheque.Print;
    pprcheque.Stop;
    If DM1.xSgr = 'S' Then
    Begin
      // Impresion conforme
      xSql := 'UPDATE PVS_CHE_GEN_CAB SET ESTCHE = ''02'', USUIMP = '+QuotedStr(DM1.wUsuario)
      +' , FECIMP = SYSDATE WHERE ASOID = '+QuotedStr(DM1.cdsTransacciones.FieldByName('ASOID').AsString)
      +' AND PVSLBENNR = '+QuotedStr(DM1.cdsTransacciones.FieldByName('PVSLBENNR').AsString)
      +' AND PVSNVOU   = '+QuotedStr(DM1.cdsTransacciones.FieldByName('PVSNVOU').AsString);
      DM1.DCOM1.AppServer.EjecutaSql(xSql);

      xSql := 'INSERT INTO PVS_CHE_GEN_DET SELECT * FROM PVS_CHE_GEN_CAB WHERE ASOID = '+QuotedStr(DM1.cdsTransacciones.FieldByName('ASOID').AsString)
      +' AND PVSLBENNR = '+QuotedStr(DM1.cdsTransacciones.FieldByName('PVSLBENNR').AsString)
      +' AND APENOMBEN = '+QuotedStr(DM1.cdsTransacciones.FieldByName('APENOMBEN').AsString);
      DM1.DCOM1.AppServer.EjecutaSql(xSql);

      MessageDlg('Impresión del cheque Ok', mtInformation, [mbOk], 0);

      btnimprimecheque.Enabled := False;
      xSql := 'SELECT A.PVSLBENNR, A.PVSNVOU, B.BENEFDES, A.APENOMBEN, A.DOCIDEBEN, A.MONCHE, C.PVSESTDES, A.ASOID, A.BANCOID,'
      +' A.NUMCHE, A.USUGENCHE, A.FECGENCHE, A.USUANU, A.FECANU, A.MOTANU, A.PVSLFECBE, A.PORDES, A.PVSLTIPBE, A.USUIMPVOU, A.FECIMPVOU'
      +' FROM PVS_CHE_GEN_CAB A, TGE186 B, (SELECT PVSESTDSG, PVSESTDES FROM PVS102 A WHERE PVSDOC = ''V'') C'
      +' WHERE NVL(ESTCHE, ''XX'') = '+QuotedStr(dblcestvou.Text)
      +' AND A.PVSLFECBE >= '+QuotedStr(DateToStr(dbdtpinicial.Date))+' AND A.PVSLFECBE <= '+QuotedStr(DateToStr(dbdtpfinal.Date))
      +' AND A.PVSLTIPBE = B.TIPBENEF AND A.ESTCHE = C.PVSESTDSG';
      DM1.cdsTransacciones.Close;
      DM1.cdsTransacciones.DataRequest(xSql);
      DM1.cdsTransacciones.Open;
      TNumericField(DM1.cdsTransacciones.FieldByName('MONCHE')).DisplayFormat := '###,###,##0.00';
      dbgcheques.Refresh;
    End;
  End;
  pnlcheque.Visible := False;
End;

procedure TFcobliq.FormKeyPress(Sender: TObject; var Key: Char);
begin
 If Key = #13 Then
  begin
    Key := #0;
    Perform(CM_DIALOGKEY, VK_TAB, 0);
  end;
end;

procedure TFcobliq.pprchequePrintingComplete(Sender: TObject);
begin
 DM1.xSgr := 'S';
end;


procedure TFcobliq.btncerraranuClick(Sender: TObject);
begin
  pnlanuche.Visible := False;
end;

procedure TFcobliq.btnanulachequeClick(Sender: TObject);
Var xMensaje, xSql :String;
begin
  If meobsanu.Text = '' Then
  Begin
    MessageDlg('Ingrese el motivo de la anulación', mtInformation, [mbOk], 0);
    Exit;
  End;
  xMensaje := '¿ Seguro de Eliminar el Cheque del Sr. : '+DM1.cdsTransacciones.FieldByName('APENOMBEN').AsString+' ?';
  If MessageDlg(xMensaje, mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
  Begin
    xSql := 'INSERT INTO PVS_CHE_GEN_DET (ASOID, PVSLBENNR, APENOMBEN, DOCIDEBEN, MONCHE, NUMCHE, USUGENCHE, FECGENCHE, ESTCHE,'
    +' PORDES, USUANU, FECANU, MOTANU, PVSNVOU, PVSLTIPBE, PVSLFECBE, FLGRET, BANCOID, USUIMP, FECIMP, USUIMPVOU, FECIMPVOU)'
    +' SELECT ASOID, PVSLBENNR, APENOMBEN, DOCIDEBEN, MONCHE, NUMCHE, USUGENCHE, FECGENCHE, ESTCHE, PORDES, USUANU, FECANU, MOTANU,'
    +' PVSNVOU, PVSLTIPBE, PVSLFECBE, FLGRET, BANCOID, USUIMP, FECIMP, USUIMPVOU, FECIMPVOU'
    +' FROM PVS_CHE_GEN_CAB WHERE PVSLBENNR = '+QuotedStr(DM1.cdsTransacciones.FieldByName('PVSLBENNR').AsString)
    +' AND PVSNVOU = '+QuotedStr(DM1.cdsTransacciones.FieldByName('PVSNVOU').AsString);
    DM1.DCOM1.AppServer.EjecutaSql(xSql);


    xSql := 'UPDATE PVS_CHE_GEN_DET SET USUANU = '+QuotedStr(DM1.wUsuario)+' ,FECANU = '+QuotedStr(DateToStr(date))
    +', MOTANU = '+QuotedStr(meobsanu.Text)
    +' WHERE PVSLBENNR = '+QuotedStr(DM1.cdsTransacciones.FieldByName('PVSLBENNR').AsString)
    +' AND PVSNVOU = '+QuotedStr(DM1.cdsTransacciones.FieldByName('PVSNVOU').AsString);
    DM1.DCOM1.AppServer.EjecutaSql(xSql);

    xSql := 'UPDATE PVS_CHE_GEN_CAB SET ESTCHE = ''01'', NUMCHE = NULL, USUGENCHE = NULL, FECGENCHE = NULL,'
    +' USUIMP = NULL, FECIMP = NULL, FECIMPVOU = NULL, USUIMPVOU = NULL'
    +' WHERE PVSLBENNR = '+QuotedStr(DM1.cdsTransacciones.FieldByName('PVSLBENNR').AsString)
    +' AND PVSNVOU = '+QuotedStr(DM1.cdsTransacciones.FieldByName('PVSNVOU').AsString);
    DM1.DCOM1.AppServer.EjecutaSql(xSql);

    xSql := 'UPDATE PVS307 SET NROCHEQUE = NULL'
    +' WHERE PVSLBENNR = '+QuotedStr(DM1.cdsTransacciones.FieldByName('PVSLBENNR').AsString)
    +' AND PVSLNVOU = '+QuotedStr(DM1.cdsTransacciones.FieldByName('PVSNVOU').AsString);
    DM1.DCOM1.AppServer.EjecutaSql(xSql);

    xSql := 'SELECT A.PVSLBENNR, A.PVSNVOU, B.BENEFDES, A.APENOMBEN, A.DOCIDEBEN, A.MONCHE, C.PVSESTDES, A.ASOID, A.BANCOID,'
    +' A.NUMCHE, A.USUGENCHE, A.FECGENCHE, A.USUANU, A.FECANU, A.MOTANU, A.PVSLFECBE, A.PORDES, A.PVSLTIPBE, A.ESTCHE, A.USUIMPVOU, A.FECIMPVOU'
    +' FROM PVS_CHE_GEN_CAB A, TGE186 B, (SELECT PVSESTDSG, PVSESTDES FROM PVS102 A WHERE PVSDOC = ''V'') C'
    +' WHERE NVL(ESTCHE, ''XX'') = '+QuotedStr(dblcestvou.Text)
    +' AND A.PVSLFECBE >= '+QuotedStr(DateToStr(dbdtpinicial.Date))+' AND A.PVSLFECBE <= '+QuotedStr(DateToStr(dbdtpfinal.Date))
    +' AND A.PVSLTIPBE = B.TIPBENEF AND A.ESTCHE = C.PVSESTDSG';
    DM1.cdsTransacciones.Close;
    DM1.cdsTransacciones.DataRequest(xSql);
    DM1.cdsTransacciones.Open;

    TNumericField(DM1.cdsTransacciones.FieldByName('MONCHE')).DisplayFormat := '###,###,##0.00';
    dbgcheques.Refresh;
    If DM1.cdsTransacciones.RecordCount = 0 Then btneliche.Enabled := False;
    MessageDlg(' El cheque Nº : '+menumcheque.Text+' fue anulado satisfactoriamente ', mtInformation, [mbOk], 0);
    pnlanuche.Visible := False;
  End;
end;

procedure TFcobliq.btnelicheClick(Sender: TObject);
Var xSql :String;
begin
  pnlanuche.Visible := True;
  pnlanuche.Top :=  110;
  pnlanuche.Left := 150;
   xSql := 'SELECT * FROM PVS_CHE_GEN_CAB WHERE ASOID = '+QuotedStr(DM1.cdsTransacciones.FieldByName('ASOID').AsString)
  +' AND PVSLBENNR = '+QuotedStr(DM1.cdsTransacciones.FieldByName('PVSLBENNR').AsString)
  +' AND PVSNVOU = '+QuotedStr(DM1.cdsTransacciones.FieldByName('PVSNVOU').AsString);
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  meapenombenanu.Text := DM1.cdsQry.FieldByName('APENOMBEN').AsString;
  medocideben.Text    := DM1.cdsQry.FieldByName('DOCIDEBEN').AsString;
  memoncheanu.Text    := FloatToStrF(DM1.cdsQry.FieldByName('MONCHE').AsFloat, ffNumber,10,2);
  menumcheanu.Text    := DM1.cdsQry.FieldByName('NUMCHE').AsString;
  meusuanu.Text       := DM1.wUsuario;
  mefecanu.Text       := DateToStr(Date);
  meobsanu.Text := '';
  meobsanu.SetFocus;
end;

procedure TFcobliq.pprepvouPrintingComplete(Sender: TObject);
begin
  DM1.xSgr := 'S';
end;


// Inicio: DPP_201207_PRE
{
procedure TFcobliq.dbgchequesRowChanged(Sender: TObject);
begin

  If DM1.wNivel <> '03' Then
  Begin
    If DM1.cdsTransacciones.FieldByName('USUIMPVOU').AsString = '' Then
      btnvoucher.Enabled := True
    Else
      btnvoucher.Enabled := False;
  End;


end;
}
// Fin: DPP_201207_PRE
//Inicio: SPP_201401_PRE
procedure TFcobliq.btnDesembolsoClick(Sender: TObject);
Var xSql, xPvsExpNro:String;
begin
   xSql := 'SELECT PVSEXPNRO FROM PVS301 WHERE ASOID = '+QuotedStr(DM1.cdsTransacciones.FieldByName('ASOID').AsString)+' AND PVSLBENNR = '+QuotedStr(DM1.cdsTransacciones.FieldByName('PVSLBENNR').AsString);
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   xPvsExpNro := DM1.cdsQry.FieldByName('PVSEXPNRO').AsString;
   xSql := 'SELECT count(*) CUENTA FROM PVSSEGEXPDET WHERE ASOID = '+DM1.cdsTransacciones.FieldByName('ASOID').AsString+' AND NUMEXP = '+QuotedStr(xPvsExpNro)
   +' AND CODESTEXP = ''04'' AND CODSITEXP = ''02''';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   If DM1.cdsQry.FieldByName('CUENTA').AsInteger > 0 Then
   Begin
      MessageDlg('Cheque ya tiene marca de desembolso.', mtInformation, [mbOk], 0);
      Exit;
   End;
   If MessageDlg('¿Seguro de confirmar que el cheque se encuentra listo para ser cobrado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
      xSql := 'Begin SP_PVS_SEG_EXP('+QuotedStr(DM1.cdsTransacciones.FieldByName('ASOID').AsString)+', '+QuotedStr(xPvsExpNro)
      +', ''04'', ''02'', TO_DATE(SYSDATE,''DD/MM/YYYY''), '+QuotedStr(DM1.wUsuario)+', NULL); End;';
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      MessageDlg('Se ha registrado la marca de desembolso.', mtInformation, [mbOk], 0);
   End;
end;
//Fin: SPP_201401_PRE

end.
