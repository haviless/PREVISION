unit PRE208;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fcButton, fcImgBtn, fcShapeBtn, Wwdbspin, wwdbdatetimepicker, StdCtrls,
  ComCtrls, wwriched, Mask, wwdbedit, wwdblook, ExtCtrls, Buttons,
  Wwdbigrd, Grids, Wwdbgrid, db;

type
  TFContabilizacion = class(TForm)
    pnlCabecera: TPanel;
    bbtnCancelar: TfcShapeBtn;
    bbtnContabiliza: TfcShapeBtn;
    pbAvance: TProgressBar;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    dbseMes: TwwDBSpinEdit;
    dbseAno: TwwDBSpinEdit;
    dbdtpFecMov: TwwDBDateTimePicker;
    bbtnGeneraAsientos: TfcShapeBtn;
    dblcTipo: TwwDBLookupCombo;
    dbeTipo: TwwDBEdit;
    Label1: TLabel;
    dbgContabiliza: TwwDBGrid;
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnContabilizaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnGeneraAsientosClick(Sender: TObject);
    procedure dblcTipoExit(Sender: TObject);
    procedure dbseMesExit(Sender: TObject);
    procedure dbseAnoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dblcTipoNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContabilizacion: TFContabilizacion;
  Present : TDate;
  xFechaInicial, xFechaFinal : String; 

implementation

uses PREDM;

{$R *.DFM}

procedure TFContabilizacion.bbtnCancelarClick(Sender: TObject);
begin
   Self.close;
end;

procedure TFContabilizacion.bbtnContabilizaClick(Sender: TObject);
var
   xSQL, xWhere, xFecha, xTipoCambio : String;
   xNroComprob, xCount, xNumComp : Integer;
begin
   Beep;
   If MessageDlg('Desea Contabilizar ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
    begin
     Screen.Cursor := crHourGlass;
     //Verifica si ya se generó el Asiento Contable para un determinado Año y Mes
     xSQL := 'Select CNTANOMM From CNT300PRE'
            +' Where CNTANOMM = '+QuotedStr(dbseAno.Text+dbseMes.Text);
     DM1.cdsQry20.Filter   := '';
     DM1.cdsQry20.Filtered := False;
     DM1.cdsQry20.IndexFieldNames := '';
     DM1.cdsQry20.Close;
     DM1.cdsQry20.DataRequest(xSQL);
     DM1.cdsQry20.Open;
     //Para Colocar el Número de Comprobante
     xSQL := 'Select CIAID, MAX(CNTCOMPROB) + 1 CNTCOMPROB FROM CNT300PRE'
            +' Group By CIAID'
            +' Order By CIAID, CNTCOMPROB';
     DM1.cdsQry19.Filter   := '';
     DM1.cdsQry19.Filtered := False;
     DM1.cdsQry19.IndexFieldNames := '';
     DM1.cdsQry19.Close;
     DM1.cdsQry19.DataRequest(xSQL);
     DM1.cdsQry19.Open;
     xWhere := 'FECHA ='+QuotedStr(DateToStr(dbdtpFecMov.Date));
     If Length(DM1.DisplayDescrip('prvSQL', 'TGE107', 'TCAMVOV', xWhere, 'TCAMVOV')) = 0 Then //Si No Existe Tipo de Cambio
      begin
       Beep;
       MessageDlg('No Existe Tipo de Cambio para el día '+DateToStr(dbdtpFecMov.Date), mtWarning, [mbOk], 0);
       xFecha      := DM1.DisplayDescrip('prvSQL', 'TGE107', 'MAX(FECHA) FECHA', '', 'FECHA');
       xTipoCambio := DM1.DisplayDescrip('prvSQL', 'TGE107', 'TCAMVOV', 'FECHA ='+QuotedStr(xFecha), 'TCAMVOV');
       If MessageDlg('El Tipo de Cambio sugerido será el del día '+xFecha+' con Tipo de Cambio '+FloatToStrF(StrToFloat(xTipoCambio), ffNumber, 15, 4)
         +#13+' Desea Contabilizar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then




        begin

         dbdtpFecMov.Date := StrToDate(xFecha);
         DM1.cdsQry18.DisableControls;
         xSQL := 'Select CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, DOCID,'
                +' CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO,'
                +' SUM(CNTMTOORI) CNTMTOORI, SUM(CNTMTOLOC) CNTMTOLOC, SUM(CNTMTOEXT) CNTMTOEXT, CNTFEMIS, CNTFVCMTO,'
                +' CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM,'
                +' CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES,'
                +' CCOSDES, SUM(CNTDEBEMN) CNTDEBEMN, SUM(CNTDEBEME) CNTDEBEME, SUM(CNTHABEMN) CNTHABEMN,'
                +' SUM(CNTHABEME) CNTHABEME, SUM(CNTSALDMN) CNTSALDMN, SUM(CNTSALDME) CNTSALDME, CAMPOVAR, CNTTS,'
                +' CNTPAGADO, CNTMODDOC, ''N'' CNTREG, MODULO, CTA_SECU'
                +' From ('
                +' Select Y.CIAID, '+QuotedStr(dblcTipo.Text)+' TDIARID, ''0000000001'' CNTCOMPROB,'+QuotedStr(dbseAno.Text)+' CNTANO, '
                +QuotedStr(dbseAno.Text+dbseMes.Text)+' CNTANOMM,'
                +QuotedStr(DM1.wModulo)+' CNTLOTE, Y.CUENTAID, Null CLAUXID, Null AUXID, Null DOCID, Null CNTSERIE, Y.DOCUMENTO CNTNODOC,'
                +' Y.PVSNOMBRE CNTGLOSA,'
                +' CASE WHEN Y.DEBE > 0 THEN ''D'' ELSE ''H'' END CNTDH, Y.CCOSID,'
                +FloatToStrF(StrToFloat(xTipoCambio), ffNumber, 15, 4)+' CNTTCAMBIO,'
                +' CASE WHEN Y.DEBE > 0 THEN Y.DEBE ELSE Y.HABER END CNTMTOORI,'
                +' CASE WHEN Y.DEBE > 0 THEN Y.DEBE ELSE Y.HABER END CNTMTOLOC,'
                +' CASE WHEN Y.DEBE > 0 THEN Y.DEBE/'+xTipoCambio+' ELSE Y.HABER/'+xTipoCambio+' END CNTMTOEXT,'
                +' Null CNTFEMIS, Null CNTFVCMTO, To_char(Y.PVSLFECBE, ''DD/MM/YYYY'') CNTFCOMP,'
                +' ''I'' CNTESTADO, ''S'' CNTCUADRE, ''N'' CNTFAUTOM, ''GQUISPE'' CNTUSER, To_Date(To_Char(SysDate, ''DD/MM/YYYY'')) CNTFREG, SysDate CNTHREG,'
                +' ''06'' CNTMM, Null CNTDD, Null CNTTRI, Null CNTSEM, Null CNTSS, Null CNTAATRI, Null CNTAASEM,'
                +' NULL CNTAASS, ''N'' TMONID, ''L'' FLAGVAR, Null FCONS,'
                +' NULL CNTFMEC, ''EGRESOS BENEFICIOS'' TDIARDES, NULL CTADES,'
                +' NULL AUXDES, Null DOCDES, NULL CCOSDES, Y.DEBE CNTDEBEMN, '+'Y.DEBE/'+xTipoCambio+' CNTDEBEME,'
                +' Y.HABER CNTHABEMN, Y.HABER/'+xTipoCambio+' CNTHABEME, 0 CNTSALDMN, 0 CNTSALDME, Null CAMPOVAR,'
                +' Null CNTTS, Null CNTPAGADO, ''PRE'' CNTMODDOC, ''N'' CNTREG, ''PRE'' MODULO, Null CTA_SECU From'
                +' ('
                +' (Select S.CIAID, S.PVSLFECBE, S.PVSLBENNR, S.PVSLTIPBE, '''' BENEFDES, APO101.CCOSID, S.CUENTAID, S.TIPCREDES,'
                +' SUM(S.DEBE) DEBE, SUM(S.HABER) HABER, S.PVSNOMBRE, S.DOCUMENTO'
                +' From'
                +' ('
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI,'
                +' CASE WHEN A.PVSLTIPBE = ''01'' THEN ''4810003'''
                +'      WHEN A.PVSLTIPBE = ''02'' THEN ''4820005'''
                +'      WHEN A.PVSLTIPBE = ''03'' THEN ''4820002'' END CUENTAID,'
                +' CASE WHEN A.PVSLTIPBE = ''01'' THEN ''BENEFICIO POR RETIRO'''
                +'      WHEN A.PVSLTIPBE = ''02'' THEN ''BENEFICIO POR FALLECIMIENTO'''
                +'      WHEN A.PVSLTIPBE = ''03'' THEN ''BENEFICIO POR INVALIDEZ'' END TIPCREDES,'
                +' CASE WHEN A.PVSLTIPBE = ''01'' THEN A.PVSLTBEN'
                +'      WHEN A.PVSLTIPBE = ''02'' THEN SUM(PVS307.PVSLMONTO)'
                +'      WHEN A.PVSLTIPBE = ''03'' THEN SUM(PVS307.PVSLMONTO) END DEBE , 0 HABER, '''' PVSNOMBRE, '''' DOCUMENTO'
                +' From PVS306 A, PVS307'
                +' Where A.PVSESTLIQ In (''02'', ''05'')'
                +' And A.PVSLBENNR = PVS307.PVSLBENNR'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And NVL(PVS307.PVSLMONTO, 0) > 0'
                +' And PVS307.PVSLAGRID = '+QuotedStr('DET')
                +' And Not PVS307.PVSLCONCE Like ''MONTO DIFERENCIAL%'''
                +' Group By A.CIAID, A.PVSLBENNR, A.FREG, A.PVSLTIPBE, A.PVSLTBEN, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI)'

//  *LAS DIFERENCIAS DE BENEFICIOS  *//
                +' UNION ALL'
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI,'
                +' CASE WHEN A.PVSLTIPBE = ''01'' THEN ''4810003'''
                +'      WHEN A.PVSLTIPBE = ''02'' THEN ''4820005'''
                +'      WHEN A.PVSLTIPBE = ''03'' THEN ''4820002'' END CUENTAID,'
                +' CASE WHEN A.PVSLTIPBE = ''01'' THEN ''BENEFICIO POR RETIRO'''
                +'      WHEN A.PVSLTIPBE = ''02'' THEN ''BENEFICIO POR FALLECIMIENTO'''
                +'      WHEN A.PVSLTIPBE = ''03'' THEN ''BENEFICIO POR INVALIDEZ'' END TIPCREDES,'
                +' CASE WHEN A.PVSLTIPBE = ''02'' And (A.PVSLTBEN = SUM(PVS307.PVSLMONTO)) THEN 0 ELSE A.PVSLTBEN - SUM(PVS307.PVSLMONTO)'
                +' END DEBE, 0 HABER, '''' PVSNOMBRE, '''' DOCUMENTO'
                +' From PVS306 A, PVS307'
                +' Where A.PVSESTLIQ In (''02'', ''05'') And A.PVSLTIPBE In (''02'')'
                +' And A.PVSLBENNR = PVS307.PVSLBENNR'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And NVL(PVS307.PVSLMONTO, 0) > 0'
                +' And PVS307.PVSLAGRID = '+QuotedStr('DET')
                +' And Not PVS307.PVSLCONCE Like ''MONTO DIFERENCIAL%'''
                +' Group By A.CIAID, A.PVSLBENNR, A.FREG, A.PVSLTIPBE, A.PVSLTBEN, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI)'
                +' UNION ALL'
//  *PARA INVALIDEZ  *//
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI,'
                +' CASE WHEN A.PVSLTIPBE = ''01'' THEN ''4810003'''
                +'      WHEN A.PVSLTIPBE = ''02'' THEN ''4820005'''
                +'      WHEN A.PVSLTIPBE = ''03'' THEN ''4820002'' END CUENTAID,'
                +' CASE WHEN A.PVSLTIPBE = ''01'' THEN ''BENEFICIO POR RETIRO'''
                +'      WHEN A.PVSLTIPBE = ''02'' THEN ''BENEFICIO POR FALLECIMIENTO'''
                +'      WHEN A.PVSLTIPBE = ''03'' THEN ''BENEFICIO POR INVALIDEZ'' END TIPCREDES,'
                +' CASE WHEN A.PVSLTIPBE = ''03'' And (A.PVSLTBEN = SUM(PVS307.PVSLMONTO)) THEN 0 ELSE A.PVSLTBEN - SUM(PVS307.PVSLMONTO)'
                +' END DEBE, 0 HABER, '''' PVSNOMBRE, '''' DOCUMENTO'
                +' From PVS306 A, PVS307'
                +' Where A.PVSESTLIQ In (''02'', ''05'') And A.PVSLTIPBE In (''03'')'
                +' And A.PVSLBENNR = PVS307.PVSLBENNR'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And NVL(PVS307.PVSLMONTO, 0) > 0'
                +' And PVS307.PVSLAGRID = '+QuotedStr('DET')
                +' And Not PVS307.PVSLCONCE Like ''MONTO DIFERENCIAL%'''
                +' Group By A.CIAID, A.PVSLBENNR, A.FREG, A.PVSLTIPBE, A.PVSLTBEN, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI)'
                +' ) S, APO101'
                +' Where S.PVSLUSEI = APO101.USEID(+)'
                +' And S.PVSLUPAI = APO101.UPAGOID(+)'
                +' And S.PVSLUPRI = APO101.UPROID(+)'
                +' Group By S.CIAID, S.PVSLFECBE, S.PVSLBENNR, S.PVSLTIPBE, APO101.CCOSID, S.CUENTAID, S.TIPCREDES, PVSNOMBRE, DOCUMENTO'
                +' )'
                +' UNION ALL'
//*  CUENTAS PARA LOS DESCUENTOS INDEBIDOS  *//
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, TGE186.BENEFDES, X.CCOSID, X.CUENTAID, X.TIPCREDES,'
                +' SUM(NVL(X.PVSLMONTO, 0)) DEBE, 0 HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, ''DEV'' TIPCREID, ''4810002'' CUENTAID,'
                +' ''DESCUENTOS INDEBIDOS'' TIPCREDES, B.PVSLMONTO, APO101.CCOSID'
                +' From PVS306 A, PVS307 B, APO101'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And B.PVSLAGRID = '+QuotedStr('DEV')
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And A.PVSLUSEI = APO101.USEID(+)'
                +' And A.PVSLUPAI = APO101.UPAGOID(+)'
                +' And A.PVSLUPRI = APO101.UPROID(+)'
                +' ) X, TGE186'
                +' Where X.PVSLTIPBE = TIPBENEF'
                +' Group By X.CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CCOSID, BENEFDES, TIPCREDES)'
                +' UNION ALL'
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
                +' SUM(NVL(X.PVSLMONTO, 0)) HABER, X.PVSNOMBRE, X.DOCUMENTO From'
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE , A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
                +' B.PVSLMONTO, C.BENEFDES, D.CTAPRINC CUENTAID, B.PVSNOMBRE,'
                +' CASE WHEN B.BANCOID = ''03'' THEN ''CTA. CTE (BENEFICIOS)'''
                +'      WHEN B.BANCOID = ''04'' THEN ''CTA. CTE 0000-003905'' END TIPCREDES,'
                +' CASE WHEN B.BANCOID = ''03'' And B.FORPAGOID = ''01'' THEN B.NROCHEQUE'
                +'      WHEN B.BANCOID = ''04'' THEN B.PVSLNOFC'
                +' WHEN B.BANCOID = ''03'' And B.FORPAGOID = ''11'' THEN ''Of. ''|| B.PVSLNOFC END DOCUMENTO'
                +' From PVS306 A, PVS307 B, TGE186 C, TGE106 D'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And B.PVSLAGRID = '+QuotedStr('FPG')
                +' And B.FLGVOUCHER = '+QuotedStr('N')
                +' And B.TIPCREID Is Null'
                +' And B.BANCOID = D.BANCOID'
                +' And D.CIAID = '+QuotedStr('02')
                +' And ((D.BANCOID = ''03'' And D.CCBCOID = ''194-0625395-0-20'') Or'
                +' (D.BANCOID = ''04'' And D.CCBCOID = ''0000-003905''))'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And A.PVSLTIPBE = C.TIPBENEF) X'
                +' Group By CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, x.TIPCREDES, X.PVSNOMBRE, X.DOCUMENTO)'
                +' UNION ALL'
//*  PARA LAS RETENCIONES JUDICIALES-HABER  *//
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
                +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE , A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
                +' B.PVSLMONTO, C.BENEFDES, D.CTAPRINC CUENTAID,'
                +' CASE WHEN B.BANCOID = ''03'' THEN ''CTA. CTE (BENEFICIOS)'''
                +'      WHEN B.BANCOID = ''04'' THEN ''REG. RETENC. JUDIC.'' END TIPCREDES'
                +' From PVS306 A, PVS307 B, TGE186 C, TGE106 D'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And B.PVSLAGRID = '+QuotedStr('FPG')
                +' And B.FLGVOUCHER = '+QuotedStr('N')
                +' And TIPCREID = '+QuotedStr('RJ')
                +' And B.BANCOID = D.BANCOID'
                +' And D.CIAID = '+QuotedStr('02')
                +' And (D.BANCOID = ''03'' And D.CCBCOID = ''194-625395-0-20'')'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And A.PVSLTIPBE = C.TIPBENEF) X'
                +' Group By CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, X.TIPCREDES)'
                +' UNION ALL'
//*  CUENTAS PARA LOS DESCUENTOS PARA COMPAÑIA 02  *//
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, APO101.CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
                +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
                +' C.BENEFDES, E.CUENTAID, D.CREAMORT PVSLMONTO, E.TIPCREDES, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI'
                +' From PVS306 A, PVS307 B, TGE186 C, CRE310 D, CRE110 E'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And B.PVSLAGRID = '+QuotedStr('DSC')
                +' And A.ASOID = D.ASOID'
                +' And B.TIPCREID = D.TIPCREID'
                +' And B.CREDID = D.CREDID'
                +' And D.TIPCREID = E.TIPCREID'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And D.CREMTOCOB > 0'
                +' And A.PVSLBENNR = D.CREDOCPAG'
                +' And (NVL(E.CIAID, ''02'') = ''02'')'
                +' And A.PVSLTIPBE = C.TIPBENEF) X, APO101'
                +' Where X.PVSLUSEI = APO101.USEID(+)'
                +' And X.PVSLUPAI = APO101.UPAGOID(+)'
                +' And X.PVSLUPRI = APO101.UPROID(+)'
                +' Group By X.CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, X.CUENTAID, BENEFDES, CCOSID, X.TIPCREDES)'
                +' UNION ALL'
//*  PARA LAS AMORTIZACIONES  *//
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR,  X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
                +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
                +' C.BENEFDES, E.CTAINT CUENTAID, D.CREINTERES PVSLMONTO, E.TIPCREDES'
                +' From PVS306 A, PVS307 B, TGE186 C, CRE310 D, CRE110 E'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And B.PVSLAGRID = '+QuotedStr('DSC')
                +' And A.ASOID = D.ASOID'
                +' And B.TIPCREID = D.TIPCREID'
                +' And B.CREDID = D.CREDID'
                +' And D.TIPCREID = E.TIPCREID'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And A.PVSLBENNR = D.CREDOCPAG'
                +' And D.CREMTOCOB > 0'
                +' And A.PVSLTIPBE = C.TIPBENEF) X'
                +' Group By X.CIAID, PVSLFECBE, X.PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, X.TIPCREDES)'
                +' UNION ALL'
//*  PARA LOS INTERESES  *//
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
                +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
                +' C.BENEFDES, E.CTAFLAT CUENTAID, D.CREFLAT PVSLMONTO, E.TIPCREDES'
                +' From PVS306 A, PVS307 B, TGE186 C, CRE310 D, CRE110 E'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And B.PVSLAGRID = '+QuotedStr('DSC')
                +' And A.ASOID = D.ASOID'
                +' And B.TIPCREID = D.TIPCREID'
                +' And B.CREDID = D.CREDID'
                +' And D.TIPCREID = E.TIPCREID'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And A.PVSLBENNR = D.CREDOCPAG'
                +' And D.CREMTOCOB > 0'
                +' And A.PVSLTIPBE = C.TIPBENEF) X'
                +' Group By X.CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, X.TIPCREDES)'
                +' UNION ALL'
//*  PARA LOS DESCUENTOS DE OTRA COMPAÑIA  *//
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
                +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
                +' (Select ''02''  CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
                +' C.BENEFDES, E.FILIAL CUENTAID, (D.CREAMORT) PVSLMONTO, E.TIPCREDES'
                +' From PVS306 A, PVS307 B, TGE186 C, CRE310 D, CRE110 E'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And B.PVSLAGRID = '+QuotedStr('DSC')
                +' And A.ASOID = D.ASOID'
                +' And B.TIPCREID = D.TIPCREID'
                +' And B.CREDID = D.CREDID'
                +' And D.TIPCREID = E.TIPCREID'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And A.PVSLBENNR = D.CREDOCPAG'
                +' And (E.CIAID <> ''02'' And E.CIAID Is Not Null)'
                +' And A.PVSLTIPBE = C.TIPBENEF) X'
                +' Group By CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, X.TIPCREDES)'
                +' UNION ALL'
//*  CUENTAS PARA LOS  DESCUENTOS DE OTRAS COMPAÑIAS  *//
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES,'
                +' SUM(NVL(X.PVSLMONTO, 0)) DEBE, 0 HABER, '''' PVSNOMBRE, '''' DOCUMENTO  From'
                +' (Select E.CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
                +' C.BENEFDES, E.CUENTAH CUENTAID, (D.CREAMORT) PVSLMONTO, E.TIPCREDES'
                +' From PVS306 A, PVS307 B, TGE186 C, CRE310 D, CRE110 E'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And B.PVSLAGRID = '+QuotedStr('DSC')
                +' And A.ASOID = D.ASOID'
                +' And B.TIPCREID = D.TIPCREID'
                +' And B.CREDID = D.CREDID'
                +' And D.TIPCREID = E.TIPCREID'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And A.PVSLBENNR = D.CREDOCPAG'
                +' And (E.CIAID <> ''02'' And E.CIAID Is Not Null)'
                +' And A.PVSLTIPBE = C.TIPBENEF) X'
                +' Group By CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, X.TIPCREDES)'
                +' UNION ALL'
//*  CUENTAS 165  OTRA COMPAÑIA *//
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, APO101.CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
                +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
                +' (Select E.CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
                +' C.BENEFDES, E.CUENTAID, D.CREAMORT PVSLMONTO, E.TIPCREDES, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI'
                +' From PVS306 A, PVS307 B, TGE186 C, CRE310 D, CRE110 E'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And B.PVSLAGRID = '+QuotedStr('DSC')
                +' And A.ASOID = D.ASOID'
                +' And B.TIPCREID = D.TIPCREID'
                +' And B.CREDID = D.CREDID'
                +' And D.TIPCREID = E.TIPCREID'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And D.CREMTOCOB > 0'
                +' And A.PVSLBENNR = D.CREDOCPAG'
                +' And (E.CIAID <> ''02'' And E.CIAID Is Not Null)'
                +' And A.PVSLTIPBE = C.TIPBENEF) X, APO101'
                +' Where X.PVSLUSEI = APO101.USEID(+)'
                +' And X.PVSLUPAI = APO101.UPAGOID(+)'
                +' And X.PVSLUPRI = APO101.UPROID(+)'
                +' Group By CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, X.CUENTAID, BENEFDES, CCOSID, X.TIPCREDES)'
//*  PARA LAS NIVELACIONES  *//
                +' UNION ALL'
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, TGE186.BENEFDES, X.CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
                +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI,'
                +' CASE WHEN B.TIPCREID = ''N'' THEN ''APORTE DE MAESTROS'' END TIPCREDES,'
                +' CASE WHEN B.TIPCREID = ''N'' THEN ''4810001'' END CUENTAID, B.PVSLMONTO, CCOSID'
                +' From PVS306 A, PVS307 B, APO101 C'
                +' Where A.PVSLBENNR = B.PVSLBENNR And (B.TIPCREID = ''N'')'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And A.PVSLUSEI = C.USEID(+)'
                +' And A.PVSLUPRI = C.UPROID(+)'
                +' And A.PVSLUPAI = C.UPAGOID(+)'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)+') X, TGE186'
                +' Where X.PVSLTIPBE = TIPBENEF'
                +' Group By X.CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, X.CCOSID, X.CUENTAID, BENEFDES, TIPCREDES, PVSLUSEI, PVSLUPRI, PVSLUPAI)'
                +' UNION ALL'
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, TGE186.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
                +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
                +' CASE WHEN B.TIPCREID = ''T'' THEN ''OTROS'' END TIPCREDES,'
                +' CASE WHEN B.TIPCREID = ''T'' THEN ''75909'' END CUENTAID,'
                +' B.PVSLMONTO'
                +' From PVS306 A, PVS307 B'
                +' Where A.PVSLBENNR = B.PVSLBENNR And (B.TIPCREID = ''T'')'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)+') X, TGE186'
                +' Where X.PVSLTIPBE = TIPBENEF'
                +' Group By X.CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, TIPCREDES)'
                +' UNION ALL'
//* PARA LAS RELIQUIDACIONES  *//
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, TGE186.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
                +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
                +' CASE WHEN B.TIPCREID = ''PA'' THEN B.PVSLCONCE END TIPCREDES,'
                +' CASE WHEN B.TIPCREID = ''PA'' AND B.PVSLTIPBE = ''01'' THEN ''4810003'' '
                +'      WHEN B.TIPCREID = ''PA'' AND B.PVSLTIPBE = ''02'' THEN ''4820005'' '
                +'      WHEN B.TIPCREID = ''PA'' AND B.PVSLTIPBE = ''03'' THEN ''4820002'' END CUENTAID,'
                +' B.PVSLMONTO'
                +' From PVS306 A, PVS307 B'
                +' Where A.PVSLBENNR = B.PVSLBENNR And (B.TIPCREID = ''PA'')'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)+') X, TGE186'
                +' Where X.PVSLTIPBE = TIPBENEF'
                +' Group By X.CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, TIPCREDES)'
                +' ) Y'
                +' )'
                +' Group By CIAID, CNTCOMPROB, CUENTAID, CCOSID,'
                +' TDIARID, CNTANO, CNTANOMM, CNTLOTE, CLAUXID, AUXID, DOCID,'
                +' CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CNTTCAMBIO, CNTFEMIS, CNTFVCMTO,'
                +' CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM,'
                +' CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES,'
                +' CCOSDES, CAMPOVAR, CNTTS,'
                +' CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU'
                +' Order By CIAID, CNTFCOMP, CUENTAID, CCOSID';


         DM1.cdsQry18.Filter   := '';
         DM1.cdsQry18.Filtered := False;
         DM1.cdsQry18.IndexFieldNames := '';
         DM1.cdsQry18.Close;
         DM1.cdsQry18.DataRequest(xSQL);
         DM1.cdsQry18.Open;
         DM1.cdsQry18.IndexFieldNames := 'CIAID; CNTFCOMP; CUENTAID; CCOSID';

         xSQL := 'Select Distinct Z.CIAID, Z.PVSLFECBE, Cast('''' As Varchar2(12)) CNTCOMPROB From'
                +' ('
                +' (Select S.CIAID, S.PVSLFECBE, S.PVSLBENNR, S.PVSLTIPBE, '''' BENEFDES, APO101.CCOSID, S.CUENTAID, S.TIPCREDES,'
                +' SUM(S.DEBE) DEBE, SUM(S.HABER) HABER, S.PVSNOMBRE, S.DOCUMENTO'
                +' From'
                +' ('
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI,'
                +' CASE WHEN A.PVSLTIPBE = ''01'' THEN ''4810003'''
                +'      WHEN A.PVSLTIPBE = ''02'' THEN ''4820005'''
                +'      WHEN A.PVSLTIPBE = ''03'' THEN ''4820002'' END CUENTAID,'
                +' CASE WHEN A.PVSLTIPBE = ''01'' THEN ''BENEFICIO POR RETIRO'''
                +'      WHEN A.PVSLTIPBE = ''02'' THEN ''BENEFICIO POR FALLECIMIENTO'''
                +'      WHEN A.PVSLTIPBE = ''03'' THEN ''BENEFICIO POR INVALIDEZ'' END TIPCREDES,'
                +' CASE WHEN A.PVSLTIPBE = ''01'' THEN A.PVSLTBEN'
                +'      WHEN A.PVSLTIPBE = ''02'' THEN SUM(PVS307.PVSLMONTO)'
                +'      WHEN A.PVSLTIPBE = ''03'' THEN SUM(PVS307.PVSLMONTO) END DEBE , 0 HABER, '''' PVSNOMBRE, '''' DOCUMENTO'
                +' From PVS306 A, PVS307'
                +' Where A.PVSESTLIQ In (''02'', ''05'')'
                +' And A.PVSLBENNR = PVS307.PVSLBENNR'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And NVL(PVS307.PVSLMONTO, 0) > 0'
                +' And PVS307.PVSLAGRID = '+QuotedStr('DET')
                +' And Not PVS307.PVSLCONCE Like ''MONTO DIFERENCIAL%'''
                +' Group By A.CIAID, A.PVSLBENNR, A.FREG, A.PVSLTIPBE, A.PVSLTBEN, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI)'
//*  LAS DIFERENCIAS DE BENEFICIOS  *//
                +' UNION ALL'
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI,'
                +' CASE WHEN A.PVSLTIPBE = ''01'' THEN ''4810003'''
                +'      WHEN A.PVSLTIPBE = ''02'' THEN ''4820005'''
                +'      WHEN A.PVSLTIPBE = ''03'' THEN ''4820002'' END CUENTAID,'
                +' CASE WHEN A.PVSLTIPBE = ''01'' THEN ''BENEFICIO POR RETIRO'''
                +'      WHEN A.PVSLTIPBE = ''02'' THEN ''BENEFICIO POR FALLECIMIENTO'''
                +'      WHEN A.PVSLTIPBE = ''03'' THEN ''BENEFICIO POR INVALIDEZ'' END TIPCREDES,'
                +' CASE WHEN A.PVSLTIPBE = ''02'' And (A.PVSLTBEN = SUM(PVS307.PVSLMONTO)) THEN 0 ELSE A.PVSLTBEN - SUM(PVS307.PVSLMONTO)'
                +'      END DEBE, 0 HABER, '''' PVSNOMBRE, '''' DOCUMENTO'
                +' From PVS306 A, PVS307'
                +' Where A.PVSESTLIQ In (''02'', ''05'')'
                +' And A.PVSLTIPBE In (''02'')'
                +' And A.PVSLBENNR = PVS307.PVSLBENNR'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And NVL(PVS307.PVSLMONTO, 0) > 0'
                +' And PVS307.PVSLAGRID = '+QuotedStr('DET')
                +' And Not PVS307.PVSLCONCE Like ''MONTO DIFERENCIAL%'''
                +' Group By A.CIAID, A.PVSLBENNR, A.FREG, A.PVSLTIPBE, A.PVSLTBEN, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI)'
                +' UNION ALL'
//*  PARA INVALIDEZ  *//
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI,'
                +' CASE WHEN A.PVSLTIPBE = ''01'' THEN ''4810003'''
                +'      WHEN A.PVSLTIPBE = ''02'' THEN ''4820005'''
                +'      WHEN A.PVSLTIPBE = ''03'' THEN ''4820002'' END CUENTAID,'
                +' CASE WHEN A.PVSLTIPBE = ''01'' THEN ''BENEFICIO POR RETIRO'''
                +'      WHEN A.PVSLTIPBE = ''02'' THEN ''BENEFICIO POR FALLECIMIENTO'''
                +'      WHEN A.PVSLTIPBE = ''03'' THEN ''BENEFICIO POR INVALIDEZ'' END TIPCREDES,'
                +' CASE WHEN A.PVSLTIPBE = ''03'' And (A.PVSLTBEN = SUM(PVS307.PVSLMONTO)) THEN 0 ELSE A.PVSLTBEN - SUM(PVS307.PVSLMONTO)'
                +'      END DEBE, 0 HABER, '''' PVSNOMBRE, '''' DOCUMENTO'
                +' From PVS306 A, PVS307'
                +' Where A.PVSESTLIQ In (''02'', ''05'')'
                +' And A.PVSLTIPBE In (''03'')'
                +' And A.PVSLBENNR = PVS307.PVSLBENNR'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And NVL(PVS307.PVSLMONTO, 0) > 0'
                +' And PVS307.PVSLAGRID = '+QuotedStr('DET')
                +' And Not PVS307.PVSLCONCE Like ''MONTO DIFERENCIAL%'''
                +' Group By A.CIAID, A.PVSLBENNR, A.FREG, A.PVSLTIPBE, A.PVSLTBEN, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI)'
                +' ) S, APO101'
                +' Where S.PVSLUSEI = APO101.USEID(+)'
                +' And S.PVSLUPAI = APO101.UPAGOID(+)'
                +' And S.PVSLUPRI = APO101.UPROID(+)'
                +' Group By S.CIAID, S.PVSLFECBE, S.PVSLBENNR, S.PVSLTIPBE, APO101.CCOSID, S.CUENTAID, S.TIPCREDES, PVSNOMBRE, DOCUMENTO'
                +' )'
                +' UNION ALL'
//*  CUENTAS PARA LOS DESCUENTOS INDEBIDOS  *//
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, TGE186.BENEFDES, X.CCOSID, X.CUENTAID, X.TIPCREDES,'
                +' SUM(NVL(X.PVSLMONTO, 0)) DEBE, 0 HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, ''DEV'' TIPCREID, ''4810002'' CUENTAID,'
                +' ''DESCUENTOS INDEBIDOS'' TIPCREDES, B.PVSLMONTO, APO101.CCOSID'
                +' From PVS306 A, PVS307 B, APO101'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And B.PVSLAGRID = '+QuotedStr('DEV')
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And A.PVSLUSEI = APO101.USEID(+)'
                +' And A.PVSLUPAI = APO101.UPAGOID(+)'
                +' And A.PVSLUPRI = APO101.UPROID(+)'
                +' ) X, TGE186'
                +' Where X.PVSLTIPBE = TIPBENEF'
                +' Group By X.CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CCOSID, BENEFDES, TIPCREDES)'
                +' UNION ALL'
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
                +' SUM(NVL(X.PVSLMONTO, 0)) HABER, X.PVSNOMBRE, X.DOCUMENTO From'
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE , A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
                +' B.PVSLMONTO, C.BENEFDES, D.CTAPRINC CUENTAID, B.PVSNOMBRE,'
                +' CASE WHEN B.BANCOID = ''03'' THEN ''CTA. CTE (BENEFICIOS)'''
                +'      WHEN B.BANCOID = ''04'' THEN ''CTA. CTE 0000-003905'' END TIPCREDES,'
                +' CASE WHEN B.BANCOID = ''03'' And B.FORPAGOID = ''01'' THEN B.NROCHEQUE'
                +'      WHEN B.BANCOID = ''04'' THEN ''Of. ''|| B.PVSLNOFC'
                +'      WHEN B.BANCOID = ''03'' And B.FORPAGOID = ''11'' THEN ''Of. ''|| B.PVSLNOFC END DOCUMENTO'
                +' From PVS306 A, PVS307 B, TGE186 C, TGE106 D'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And B.PVSLAGRID = '+QuotedStr('FPG')
                +' And B.FLGVOUCHER = '+QuotedStr('N')
                +' And B.TIPCREID Is Null'
                +' And B.BANCOID = D.BANCOID'
                +' And D.CIAID = '+QuotedStr('02')
                +' And ((D.BANCOID = ''03'' And D.CCBCOID = ''194-625395-0-20'') Or'
                +' (D.BANCOID = ''04'' And D.CCBCOID = ''0000-003905''))'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And A.PVSLTIPBE = C.TIPBENEF) X'
                +' Group By CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, x.TIPCREDES, X.PVSNOMBRE, X.DOCUMENTO)'
                +' UNION ALL'
//*  CUENTAS PARA LOS DESCUENTOS PARA COMPAÑIA 02  *//
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, APO101.CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
                +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
                +' C.BENEFDES, E.CUENTAID, D.CREAMORT PVSLMONTO, E.TIPCREDES, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI'
                +' From PVS306 A, PVS307 B, TGE186 C, CRE310 D, CRE110 E'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And B.PVSLAGRID = '+QuotedStr('DSC')
                +' And A.ASOID = D.ASOID'
                +' And B.TIPCREID = D.TIPCREID'
                +' And B.CREDID = D.CREDID'
                +' And D.TIPCREID = E.TIPCREID'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And D.CREMTOCOB > 0'
                +' And A.PVSLBENNR = D.CREDOCPAG'
                +' And A.PVSLTIPBE = C.TIPBENEF) X, APO101'
                +' Where X.PVSLUSEI = APO101.USEID(+)'
                +' And X.PVSLUPAI = APO101.UPAGOID(+)'
                +' And X.PVSLUPRI = APO101.UPROID(+)'
                +' Group By X.CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, X.CUENTAID, BENEFDES, CCOSID, X.TIPCREDES)'
                +' UNION ALL'
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR,  X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
                +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
                +' C.BENEFDES, E.CTAINT CUENTAID, D.CREINTERES PVSLMONTO, E.TIPCREDES'
                +' From PVS306 A, PVS307 B, TGE186 C, CRE310 D, CRE110 E'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And B.PVSLAGRID = '+QuotedStr('DSC')
                +' And A.ASOID = D.ASOID'
                +' And B.TIPCREID = D.TIPCREID'
                +' And B.CREDID = D.CREDID'
                +' And D.TIPCREID = E.TIPCREID'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And A.PVSLBENNR = D.CREDOCPAG'
                +' And D.CREMTOCOB > 0'
                +' And A.PVSLTIPBE = C.TIPBENEF) X'
                +' Group By X.CIAID, PVSLFECBE, X.PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, X.TIPCREDES)'
                +' UNION ALL'
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
                +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
                +' C.BENEFDES, E.CTAFLAT CUENTAID, D.CREFLAT PVSLMONTO, E.TIPCREDES'
                +' From PVS306 A, PVS307 B, TGE186 C, CRE310 D, CRE110 E'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And B.PVSLAGRID = '+QuotedStr('DSC')
                +' And A.ASOID = D.ASOID'
                +' And B.TIPCREID = D.TIPCREID'
                +' And B.CREDID = D.CREDID'
                +' And D.TIPCREID = E.TIPCREID'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And A.PVSLBENNR = D.CREDOCPAG'
                +' And (NVL(E.CIAID, ''02'') = ''02'')'
                +' And D.CREMTOCOB > 0'
                +' And A.PVSLTIPBE = C.TIPBENEF) X'
                +' Group By X.CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, X.TIPCREDES)'
                +' UNION ALL'
//*  PARA LOS DESCUENTOS DE OTRA COMPAÑIA  *//
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
                +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
                +' (Select ''02''  CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
                +' C.BENEFDES, E.FILIAL CUENTAID, (D.CREAMORT + D.CREINTERES + D.CREFLAT) PVSLMONTO, E.TIPCREDES'
                +' From PVS306 A, PVS307 B, TGE186 C, CRE310 D, CRE110 E'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And B.PVSLAGRID = '+QuotedStr('DSC')
                +' And A.ASOID = D.ASOID'
                +' And B.TIPCREID = D.TIPCREID'
                +' And B.CREDID = D.CREDID'
                +' And D.TIPCREID = E.TIPCREID'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And A.PVSLBENNR = D.CREDOCPAG'
                +' And (E.CIAID <> ''02'' And E.CIAID Is Not Null)'
                +' And A.PVSLTIPBE = C.TIPBENEF) X'
                +' Group By CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, X.TIPCREDES)'
                +' UNION ALL'
//*  CUENTAS PARA LOS  DESCUENTOS DE OTRAS COMPAÑIAS  *//
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES,'
                +' SUM(NVL(X.PVSLMONTO, 0)) DEBE, 0 HABER, '''' PVSNOMBRE, '''' DOCUMENTO  From'
                +' (Select E.CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
                +' C.BENEFDES, E.CUENTAH CUENTAID, (D.CREAMORT + D.CREINTERES + D.CREFLAT) PVSLMONTO, E.TIPCREDES'
                +' From PVS306 A, PVS307 B, TGE186 C, CRE310 D, CRE110 E'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And B.PVSLAGRID = '+QuotedStr('DSC')
                +' And A.ASOID = D.ASOID'
                +' And B.TIPCREID = D.TIPCREID'
                +' And B.CREDID = D.CREDID'
                +' And D.TIPCREID = E.TIPCREID'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And A.PVSLBENNR = D.CREDOCPAG'
                +' And (E.CIAID <> ''02'' And E.CIAID Is Not Null)'
                +' And A.PVSLTIPBE = C.TIPBENEF) X'
                +' Group By CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, X.TIPCREDES)'
                +' UNION ALL'
//*  CUENTAS 165  *//
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, APO101.CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
                +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
                +' (Select E.CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
                +' C.BENEFDES, E.CUENTAID, D.CREAMORT PVSLMONTO, E.TIPCREDES, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI'
                +' From PVS306 A, PVS307 B, TGE186 C, CRE310 D, CRE110 E'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And B.PVSLAGRID = '+QuotedStr('DSC')
                +' And A.ASOID = D.ASOID'
                +' And B.TIPCREID = D.TIPCREID'
                +' And B.CREDID = D.CREDID'
                +' And D.TIPCREID = E.TIPCREID'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And D.CREMTOCOB > 0'
                +' And A.PVSLBENNR = D.CREDOCPAG'
                +' And (E.CIAID <> ''02'' And E.CIAID Is Not Null)'
                +' And A.PVSLTIPBE = C.TIPBENEF) X, APO101'
                +' Where X.PVSLUSEI = APO101.USEID(+)'
                +' And X.PVSLUPAI = APO101.UPAGOID(+)'
                +' And X.PVSLUPRI = APO101.UPROID(+)'
                +' Group By CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, x.CUENTAID, BENEFDES, CCOSID, X.TIPCREDES)'
                +' UNION ALL'
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
                +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
                +' (Select E.CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
                +' C.BENEFDES, E.CTAINT CUENTAID, D.CREINTERES PVSLMONTO, E.TIPCREDES'
                +' From PVS306 A, PVS307 B, TGE186 C, CRE310 D, CRE110 E'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And B.PVSLAGRID = '+QuotedStr('DSC')
                +' And A.ASOID = D.ASOID'
                +' And B.TIPCREID = D.TIPCREID'
                +' And B.CREDID = D.CREDID'
                +' And D.TIPCREID = E.TIPCREID'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And A.PVSLBENNR = D.CREDOCPAG'
                +' And (E.CIAID <> ''02'' And E.CIAID Is Not Null)'
                +' And D.CREMTOCOB > 0'
                +' And A.PVSLTIPBE = C.TIPBENEF) X'
                +' Group By CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, X.TIPCREDES)'
                +' UNION ALL'
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
                +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
                +' (Select E.CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
                +' C.BENEFDES, E.CTAFLAT CUENTAID, D.CREFLAT PVSLMONTO, E.TIPCREDES'
                +' From PVS306 A, PVS307 B, TGE186 C, CRE310 D, CRE110 E'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And B.PVSLAGRID = '+QuotedStr('DSC')
                +' And A.ASOID = D.ASOID'
                +' And B.TIPCREID = D.TIPCREID'
                +' And B.CREDID = D.CREDID'
                +' And D.TIPCREID = E.TIPCREID'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And A.PVSLBENNR = D.CREDOCPAG'
                +' And (E.CIAID <> ''02'' And E.CIAID Is Not Null)'
                +' And D.CREMTOCOB > 0'
                +' And A.PVSLTIPBE = C.TIPBENEF) X'
                +' Group By CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, X.TIPCREDES)'
//*  PARA LAS NIVELACIONES  *//
                +' UNION ALL'
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, TGE186.BENEFDES, X.CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
                +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI,'
                +' CASE WHEN B.TIPCREID = ''N'' THEN ''APORTE DE MAESTROS'' END TIPCREDES,'
                +' CASE WHEN B.TIPCREID = ''N'' THEN ''4810001'' END CUENTAID, B.PVSLMONTO, CCOSID'
                +' From PVS306 A, PVS307 B, APO101 C'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And (B.TIPCREID = ''N'')'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And A.PVSLUSEI = C.USEID(+)'
                +' And A.PVSLUPRI = C.UPROID(+)'
                +' And A.PVSLUPAI = C.UPAGOID(+)'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)+') X, TGE186'
                +' Where X.PVSLTIPBE = TIPBENEF'
                +' Group By X.CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, X.CCOSID, X.CUENTAID, BENEFDES, TIPCREDES, PVSLUSEI, PVSLUPRI, PVSLUPAI)'
                +' UNION ALL'
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, TGE186.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
                +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
                +' CASE WHEN B.TIPCREID = ''T'' THEN ''OTROS'' END TIPCREDES,'
                +' CASE WHEN B.TIPCREID = ''T'' THEN ''75909'' END CUENTAID,'
                +' B.PVSLMONTO'
                +' From PVS306 A, PVS307 B'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And (B.TIPCREID = ''T'')'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)+') X, TGE186'
                +' Where X.PVSLTIPBE = TIPBENEF'
                +' Group By X.CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, TIPCREDES)'
                +') Z';

           DM1.cdsQry21.Filter   := '';
           DM1.cdsQry21.Filtered := False;
           DM1.cdsQry21.IndexFieldNames := '';
           DM1.cdsQry21.Close;
           DM1.cdsQry21.DataRequest(xSQL);
           DM1.cdsQry21.Open;
           DM1.cdsQry21.IndexFieldNames := 'CIAID; PVSLFECBE';

//*  Para Ver el Número de Compañías
         xSQL := 'Select Distinct Z.CIAID From'
                +' ('
                +' (Select S.CIAID, S.PVSLFECBE, S.PVSLBENNR, S.PVSLTIPBE, '''' BENEFDES, APO101.CCOSID, S.CUENTAID, S.TIPCREDES,'
                +' SUM(S.DEBE) DEBE, SUM(S.HABER) HABER, S.PVSNOMBRE, S.DOCUMENTO'
                +' From'
                +' ('
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI,'
                +' CASE WHEN A.PVSLTIPBE = ''01'' THEN ''4810003'''
                +'      WHEN A.PVSLTIPBE = ''02'' THEN ''4820005'''
                +'      WHEN A.PVSLTIPBE = ''03'' THEN ''4820002'' END CUENTAID,'
                +' CASE WHEN A.PVSLTIPBE = ''01'' THEN ''BENEFICIO POR RETIRO'''
                +'      WHEN A.PVSLTIPBE = ''02'' THEN ''BENEFICIO POR FALLECIMIENTO'''
                +'      WHEN A.PVSLTIPBE = ''03'' THEN ''BENEFICIO POR INVALIDEZ'' END TIPCREDES,'
                +' CASE WHEN A.PVSLTIPBE = ''01'' THEN A.PVSLTBEN'
                +'      WHEN A.PVSLTIPBE = ''02'' THEN SUM(PVS307.PVSLMONTO)'
                +'      WHEN A.PVSLTIPBE = ''03'' THEN SUM(PVS307.PVSLMONTO) END DEBE , 0 HABER, '''' PVSNOMBRE, '''' DOCUMENTO'
                +' From PVS306 A, PVS307'
                +' Where A.PVSESTLIQ In (''02'', ''05'')'
                +' And A.PVSLBENNR = PVS307.PVSLBENNR'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And NVL(PVS307.PVSLMONTO, 0) > 0'
                +' And PVS307.PVSLAGRID = '+QuotedStr('DET')
                +' And Not PVS307.PVSLCONCE Like ''MONTO DIFERENCIAL%'''
                +' Group By A.CIAID, A.PVSLBENNR, A.FREG, A.PVSLTIPBE, A.PVSLTBEN, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI)'
//*  LAS DIFERENCIAS DE BENEFICIOS  *//
                +' UNION ALL'
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI,'
                +' CASE WHEN A.PVSLTIPBE = ''01'' THEN ''4810003'''
                +'      WHEN A.PVSLTIPBE = ''02'' THEN ''4820005'''
                +'      WHEN A.PVSLTIPBE = ''03'' THEN ''4820002'' END CUENTAID,'
                +' CASE WHEN A.PVSLTIPBE = ''01'' THEN ''BENEFICIO POR RETIRO'''
                +'      WHEN A.PVSLTIPBE = ''02'' THEN ''BENEFICIO POR FALLECIMIENTO'''
                +'      WHEN A.PVSLTIPBE = ''03'' THEN ''BENEFICIO POR INVALIDEZ'' END TIPCREDES,'
                +' CASE WHEN A.PVSLTIPBE = ''02'' And (A.PVSLTBEN = SUM(PVS307.PVSLMONTO)) THEN 0 ELSE A.PVSLTBEN - SUM(PVS307.PVSLMONTO)'
                +'      END DEBE, 0 HABER, '''' PVSNOMBRE, '''' DOCUMENTO'
                +' From PVS306 A, PVS307'
                +' Where A.PVSESTLIQ In (''02'', ''05'')'
                +' And A.PVSLTIPBE In (''02'')'
                +' And A.PVSLBENNR = PVS307.PVSLBENNR'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And NVL(PVS307.PVSLMONTO, 0) > 0'
                +' And PVS307.PVSLAGRID = '+QuotedStr('DET')
                +' And Not PVS307.PVSLCONCE Like ''MONTO DIFERENCIAL%'''
                +' Group By A.CIAID, A.PVSLBENNR, A.FREG, A.PVSLTIPBE, A.PVSLTBEN, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI)'
                +' UNION ALL'
//*  PARA INVALIDEZ  *//
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI,'
                +' CASE WHEN A.PVSLTIPBE = ''01'' THEN ''4810003'''
                +'      WHEN A.PVSLTIPBE = ''02'' THEN ''4820005'''
                +'      WHEN A.PVSLTIPBE = ''03'' THEN ''4820002'' END CUENTAID,'
                +' CASE WHEN A.PVSLTIPBE = ''01'' THEN ''BENEFICIO POR RETIRO'''
                +'      WHEN A.PVSLTIPBE = ''02'' THEN ''BENEFICIO POR FALLECIMIENTO'''
                +'      WHEN A.PVSLTIPBE = ''03'' THEN ''BENEFICIO POR INVALIDEZ'' END TIPCREDES,'
                +' CASE WHEN A.PVSLTIPBE = ''03'' And (A.PVSLTBEN = SUM(PVS307.PVSLMONTO)) THEN 0 ELSE A.PVSLTBEN - SUM(PVS307.PVSLMONTO)'
                +'      END DEBE, 0 HABER, '''' PVSNOMBRE, '''' DOCUMENTO'
                +' From PVS306 A, PVS307'
                +' Where A.PVSESTLIQ In (''02'', ''05'')'
                +' And A.PVSLTIPBE In (''03'')'
                +' And A.PVSLBENNR = PVS307.PVSLBENNR'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And NVL(PVS307.PVSLMONTO, 0) > 0'
                +' And PVS307.PVSLAGRID = '+QuotedStr('DET')
                +' And Not PVS307.PVSLCONCE Like ''MONTO DIFERENCIAL%'''
                +' Group By A.CIAID, A.PVSLBENNR, A.FREG, A.PVSLTIPBE, A.PVSLTBEN, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI)'
                +' ) S, APO101'
                +' Where S.PVSLUSEI = APO101.USEID(+)'
                +' And S.PVSLUPAI = APO101.UPAGOID(+)'
                +' And S.PVSLUPRI = APO101.UPROID(+)'
                +' Group By S.CIAID, S.PVSLFECBE, S.PVSLBENNR, S.PVSLTIPBE, APO101.CCOSID, S.CUENTAID, S.TIPCREDES, PVSNOMBRE, DOCUMENTO'
                +' )'
                +' UNION ALL'
//*  CUENTAS PARA LOS DESCUENTOS INDEBIDOS  *//
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, TGE186.BENEFDES, X.CCOSID, X.CUENTAID, X.TIPCREDES,'
                +' SUM(NVL(X.PVSLMONTO, 0)) DEBE, 0 HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, ''DEV'' TIPCREID, ''4810002'' CUENTAID,'
                +' ''DESCUENTOS INDEBIDOS'' TIPCREDES, B.PVSLMONTO, APO101.CCOSID'
                +' From PVS306 A, PVS307 B, APO101'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And B.PVSLAGRID = '+QuotedStr('DEV')
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And A.PVSLUSEI = APO101.USEID(+)'
                +' And A.PVSLUPAI = APO101.UPAGOID(+)'
                +' And A.PVSLUPRI = APO101.UPROID(+)'
                +' ) X, TGE186'
                +' Where X.PVSLTIPBE = TIPBENEF'
                +' Group By X.CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CCOSID, BENEFDES, TIPCREDES)'
                +' UNION ALL'
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
                +' SUM(NVL(X.PVSLMONTO, 0)) HABER, X.PVSNOMBRE, X.DOCUMENTO From'
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE , A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
                +' B.PVSLMONTO, C.BENEFDES, D.CTAPRINC CUENTAID, B.PVSNOMBRE,'
                +' CASE WHEN B.BANCOID = ''03'' THEN ''CTA. CTE (BENEFICIOS)'''
                +'      WHEN B.BANCOID = ''04'' THEN ''CTA. CTE 0000-003905'' END TIPCREDES,'
                +' CASE WHEN B.BANCOID = ''03'' And B.FORPAGOID = ''01'' THEN B.NROCHEQUE'
                +'      WHEN B.BANCOID = ''04'' THEN ''Of. ''|| B.PVSLNOFC'
                +'      WHEN B.BANCOID = ''03'' And B.FORPAGOID = ''11'' THEN ''Of. ''|| B.PVSLNOFC END DOCUMENTO'
                +' From PVS306 A, PVS307 B, TGE186 C, TGE106 D'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And B.PVSLAGRID = '+QuotedStr('FPG')
                +' And B.FLGVOUCHER = '+QuotedStr('N')
                +' And B.TIPCREID Is Null'
                +' And B.BANCOID = D.BANCOID'
                +' And D.CIAID = '+QuotedStr('02')
                +' And ((D.BANCOID = ''03'' And D.CCBCOID = ''194-625395-0-20'') Or'
                +' (D.BANCOID = ''04'' And D.CCBCOID = ''0000-003905''))'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And A.PVSLTIPBE = C.TIPBENEF) X'
                +' Group By CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, x.TIPCREDES, X.PVSNOMBRE, X.DOCUMENTO)'
                +' UNION ALL'
//*  CUENTAS PARA LOS DESCUENTOS PARA COMPAÑIA 02  *//
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, APO101.CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
                +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
                +' C.BENEFDES, E.CUENTAID, D.CREAMORT PVSLMONTO, E.TIPCREDES, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI'
                +' From PVS306 A, PVS307 B, TGE186 C, CRE310 D, CRE110 E'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And B.PVSLAGRID = '+QuotedStr('DSC')
                +' And A.ASOID = D.ASOID'
                +' And B.TIPCREID = D.TIPCREID'
                +' And B.CREDID = D.CREDID'
                +' And D.TIPCREID = E.TIPCREID'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And D.CREMTOCOB > 0'
                +' And A.PVSLBENNR = D.CREDOCPAG'
                +' And A.PVSLTIPBE = C.TIPBENEF) X, APO101'
                +' Where X.PVSLUSEI = APO101.USEID(+)'
                +' And X.PVSLUPAI = APO101.UPAGOID(+)'
                +' And X.PVSLUPRI = APO101.UPROID(+)'
                +' Group By X.CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, X.CUENTAID, BENEFDES, CCOSID, X.TIPCREDES)'
                +' UNION ALL'
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR,  X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
                +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
                +' C.BENEFDES, E.CTAINT CUENTAID, D.CREINTERES PVSLMONTO, E.TIPCREDES'
                +' From PVS306 A, PVS307 B, TGE186 C, CRE310 D, CRE110 E'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And B.PVSLAGRID = '+QuotedStr('DSC')
                +' And A.ASOID = D.ASOID'
                +' And B.TIPCREID = D.TIPCREID'
                +' And B.CREDID = D.CREDID'
                +' And D.TIPCREID = E.TIPCREID'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And A.PVSLBENNR = D.CREDOCPAG'
                +' And D.CREMTOCOB > 0'
                +' And A.PVSLTIPBE = C.TIPBENEF) X'
                +' Group By X.CIAID, PVSLFECBE, X.PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, X.TIPCREDES)'
                +' UNION ALL'
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
                +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
                +' C.BENEFDES, E.CTAFLAT CUENTAID, D.CREFLAT PVSLMONTO, E.TIPCREDES'
                +' From PVS306 A, PVS307 B, TGE186 C, CRE310 D, CRE110 E'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And B.PVSLAGRID = '+QuotedStr('DSC')
                +' And A.ASOID = D.ASOID'
                +' And B.TIPCREID = D.TIPCREID'
                +' And B.CREDID = D.CREDID'
                +' And D.TIPCREID = E.TIPCREID'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And A.PVSLBENNR = D.CREDOCPAG'
                +' And (NVL(E.CIAID, ''02'') = ''02'')'
                +' And D.CREMTOCOB > 0'
                +' And A.PVSLTIPBE = C.TIPBENEF) X'
                +' Group By X.CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, X.TIPCREDES)'
                +' UNION ALL'
//*  PARA LOS DESCUENTOS DE OTRA COMPAÑIA  *//
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
                +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
                +' (Select ''02''  CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
                +' C.BENEFDES, E.FILIAL CUENTAID, (D.CREAMORT + D.CREINTERES + D.CREFLAT) PVSLMONTO, E.TIPCREDES'
                +' From PVS306 A, PVS307 B, TGE186 C, CRE310 D, CRE110 E'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And B.PVSLAGRID = '+QuotedStr('DSC')
                +' And A.ASOID = D.ASOID'
                +' And B.TIPCREID = D.TIPCREID'
                +' And B.CREDID = D.CREDID'
                +' And D.TIPCREID = E.TIPCREID'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And A.PVSLBENNR = D.CREDOCPAG'
                +' And (E.CIAID <> ''02'' And E.CIAID Is Not Null)'
                +' And A.PVSLTIPBE = C.TIPBENEF) X'
                +' Group By CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, X.TIPCREDES)'
                +' UNION ALL'
//*  PARA LAS RETENCIONES JUDICIALES-HABER  *//
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES,'
                +' 0 DEBE, SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE , A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
                +' B.PVSLMONTO, C.BENEFDES, ''46901'' CUENTAID,'
                +' ''REG. RETENC. JUDIC.'' TIPCREDES'
                +' From PVS306 A, PVS307 B, TGE186 C'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And B.PVSLAGRID = '+QuotedStr('DSC')
                +' And TIPCREID = '+QuotedStr('RJ')
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And A.PVSLTIPBE = C.TIPBENEF) X'
                +' Group By CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, X.TIPCREDES)'
                +' UNION ALL'
//*  CUENTAS PARA LOS  DESCUENTOS DE OTRAS COMPAÑIAS  *//
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES,'
                +' SUM(NVL(X.PVSLMONTO, 0)) DEBE, 0 HABER, '''' PVSNOMBRE, '''' DOCUMENTO  From'
                +' (Select E.CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
                +' C.BENEFDES, E.CUENTAH CUENTAID, (D.CREAMORT + D.CREINTERES + D.CREFLAT) PVSLMONTO, E.TIPCREDES'
                +' From PVS306 A, PVS307 B, TGE186 C, CRE310 D, CRE110 E'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And B.PVSLAGRID = '+QuotedStr('DSC')
                +' And A.ASOID = D.ASOID'
                +' And B.TIPCREID = D.TIPCREID'
                +' And B.CREDID = D.CREDID'
                +' And D.TIPCREID = E.TIPCREID'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And A.PVSLBENNR = D.CREDOCPAG'
                +' And (E.CIAID <> ''02'' And E.CIAID Is Not Null)'
                +' And A.PVSLTIPBE = C.TIPBENEF) X'
                +' Group By CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, X.TIPCREDES)'
                +' UNION ALL'
//*  CUENTAS 165  *//
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, APO101.CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
                +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
                +' (Select E.CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
                +' C.BENEFDES, E.CUENTAID, D.CREAMORT PVSLMONTO, E.TIPCREDES, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI'
                +' From PVS306 A, PVS307 B, TGE186 C, CRE310 D, CRE110 E'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And B.PVSLAGRID = '+QuotedStr('DSC')
                +' And A.ASOID = D.ASOID'
                +' And B.TIPCREID = D.TIPCREID'
                +' And B.CREDID = D.CREDID'
                +' And D.TIPCREID = E.TIPCREID'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And D.CREMTOCOB > 0'
                +' And A.PVSLBENNR = D.CREDOCPAG'
                +' And (E.CIAID <> ''02'' And E.CIAID Is Not Null)'
                +' And A.PVSLTIPBE = C.TIPBENEF) X, APO101'
                +' Where X.PVSLUSEI = APO101.USEID(+)'
                +' And X.PVSLUPAI = APO101.UPAGOID(+)'
                +' And X.PVSLUPRI = APO101.UPROID(+)'
                +' Group By CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, x.CUENTAID, BENEFDES, CCOSID, X.TIPCREDES)'
                +' UNION ALL'
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
                +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
                +' (Select E.CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
                +' C.BENEFDES, E.CTAINT CUENTAID, D.CREINTERES PVSLMONTO, E.TIPCREDES'
                +' From PVS306 A, PVS307 B, TGE186 C, CRE310 D, CRE110 E'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And B.PVSLAGRID = '+QuotedStr('DSC')
                +' And A.ASOID = D.ASOID'
                +' And B.TIPCREID = D.TIPCREID'
                +' And B.CREDID = D.CREDID'
                +' And D.TIPCREID = E.TIPCREID'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And A.PVSLBENNR = D.CREDOCPAG'
                +' And (E.CIAID <> ''02'' And E.CIAID Is Not Null)'
                +' And D.CREMTOCOB > 0'
                +' And A.PVSLTIPBE = C.TIPBENEF) X'
                +' Group By CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, X.TIPCREDES)'
                +' UNION ALL'
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
                +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
                +' (Select E.CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
                +' C.BENEFDES, E.CTAFLAT CUENTAID, D.CREFLAT PVSLMONTO, E.TIPCREDES'
                +' From PVS306 A, PVS307 B, TGE186 C, CRE310 D, CRE110 E'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And B.PVSLAGRID = '+QuotedStr('DSC')
                +' And A.ASOID = D.ASOID'
                +' And B.TIPCREID = D.TIPCREID'
                +' And B.CREDID = D.CREDID'
                +' And D.TIPCREID = E.TIPCREID'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And A.PVSLBENNR = D.CREDOCPAG'
                +' And (E.CIAID <> ''02'' And E.CIAID Is Not Null)'
                +' And D.CREMTOCOB > 0'
                +' And A.PVSLTIPBE = C.TIPBENEF) X'
                +' Group By CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, X.TIPCREDES)'
//*  PARA LAS NIVELACIONES  *//
                +' UNION ALL'
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, TGE186.BENEFDES, X.CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
                +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI,'
                +' CASE WHEN B.TIPCREID = ''N'' THEN ''APORTE DE MAESTROS'' END TIPCREDES,'
                +' CASE WHEN B.TIPCREID = ''N'' THEN ''4810001'' END CUENTAID, B.PVSLMONTO, CCOSID'
                +' From PVS306 A, PVS307 B, APO101 C'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And (B.TIPCREID = ''N'')'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And A.PVSLUSEI = C.USEID(+)'
                +' And A.PVSLUPRI = C.UPROID(+)'
                +' And A.PVSLUPAI = C.UPAGOID(+)'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)+') X, TGE186'
                +' Where X.PVSLTIPBE = TIPBENEF'
                +' Group By X.CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, X.CCOSID, X.CUENTAID, BENEFDES, TIPCREDES, PVSLUSEI, PVSLUPRI, PVSLUPAI)'
                +' UNION ALL'
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, TGE186.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
                +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
                +' CASE WHEN B.TIPCREID = ''T'' THEN ''OTROS'' END TIPCREDES,'
                +' CASE WHEN B.TIPCREID = ''T'' THEN ''75909'' END CUENTAID,'
                +' B.PVSLMONTO'
                +' From PVS306 A, PVS307 B'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And (B.TIPCREID = ''T'')'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)+') X, TGE186'
                +' Where X.PVSLTIPBE = TIPBENEF'
                +' Group By X.CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, TIPCREDES)'
                 +') Z';
//PARA LAS RETENCIONES JUDICIALES - UN ASIENTO ADICIONAL
//*PARA LAS RETENCIONES JUDICIALES-DEBE*/
         DM1.cdsQry22.Filter   := '';
         DM1.cdsQry22.Filtered := False;
         DM1.cdsQry22.IndexFieldNames := '';
         DM1.cdsQry22.Close;
         DM1.cdsQry22.DataRequest(xSQL);
         DM1.cdsQry22.Open;
         DM1.cdsQry22.IndexFieldNames := 'CIAID';
//PARA LAS RETENCIONES JUDICIALES - UN ASIENTO ADICIONAL
//*PARA LAS RETENCIONES JUDICIALES-DEBE*/
         xSQL := 'Select CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, DOCID,'
                +' CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO,'
                +' SUM(CNTMTOORI) CNTMTOORI, SUM(CNTMTOLOC) CNTMTOLOC, SUM(CNTMTOEXT) CNTMTOEXT, CNTFEMIS, CNTFVCMTO,'
                +' CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM,'
                +' CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES,'
                +' CCOSDES, SUM(CNTDEBEMN) CNTDEBEMN, SUM(CNTDEBEME) CNTDEBEME, SUM(CNTHABEMN) CNTHABEMN,'
                +' SUM(CNTHABEME) CNTHABEME, SUM(CNTSALDMN) CNTSALDMN, SUM(CNTSALDME) CNTSALDME, CAMPOVAR, CNTTS,'
                +' CNTPAGADO, CNTMODDOC, ''N'' CNTREG, MODULO, CTA_SECU'
                +' From ('
                +' Select Y.CIAID, '+QuotedStr(dblcTipo.Text)+' TDIARID, ''0000000001'' CNTCOMPROB,'+QuotedStr(dbseAno.Text)+' CNTANO, '
                +QuotedStr(dbseAno.Text+dbseMes.Text)+' CNTANOMM, '
                +QuotedStr(DM1.wModulo)+' CNTLOTE, Y.CUENTAID, Null CLAUXID, Null AUXID, Null DOCID, Null CNTSERIE, Y.DOCUMENTO CNTNODOC,'
                +' Y.PVSNOMBRE CNTGLOSA,'
                +' CASE WHEN Y.DEBE > 0 THEN ''D'' ELSE ''H'' END CNTDH, Y.CCOSID,'
                +FloatToStrF(StrToFloat(xTipoCambio), ffNumber, 15, 4)+' CNTTCAMBIO,'
                +' CASE WHEN Y.DEBE > 0 THEN Y.DEBE ELSE Y.HABER END CNTMTOORI,'
                +' CASE WHEN Y.DEBE > 0 THEN Y.DEBE ELSE Y.HABER END CNTMTOLOC,'
                +' CASE WHEN Y.DEBE > 0 THEN Y.DEBE/'+xTipoCambio+' ELSE Y.HABER/'+xTipoCambio+' END CNTMTOEXT,'
                +' Null CNTFEMIS, Null CNTFVCMTO, To_char(Y.PVSLFECBE, ''DD/MM/YYYY'') CNTFCOMP,'
                +' ''I'' CNTESTADO, ''S'' CNTCUADRE, ''N'' CNTFAUTOM, ''GQUISPE'' CNTUSER, To_Date(To_Char(SysDate, ''DD/MM/YYYY'')) CNTFREG, SysDate CNTHREG,'
                +' ''06'' CNTMM, Null CNTDD, Null CNTTRI, Null CNTSEM, Null CNTSS, Null CNTAATRI, Null CNTAASEM,'
                +' NULL CNTAASS, ''N'' TMONID, ''L'' FLAGVAR, Null FCONS,'
                +' NULL CNTFMEC, ''EGRESOS BENEFICIOS'' TDIARDES, NULL CTADES,'
                +' NULL AUXDES, Null DOCDES, NULL CCOSDES, Y.DEBE CNTDEBEMN, '+'Y.DEBE/'+xTipoCambio+' CNTDEBEME,'
                +' Y.HABER CNTHABEMN, Y.HABER/'+xTipoCambio+' CNTHABEME, 0 CNTSALDMN, 0 CNTSALDME, Null CAMPOVAR,'
                +' Null CNTTS, Null CNTPAGADO, ''PRE'' CNTMODDOC, ''N'' CNTREG, ''PRE'' MODULO, Null CTA_SECU From'
                +' ('
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
                +' SUM(NVL(X.PVSLMONTO, 0)) HABER, ''REG. RETENC. JUDIC.'' PVSNOMBRE, '''' DOCUMENTO From'
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE , A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
                +' B.PVSLMONTO, C.BENEFDES, ''104010301'' CUENTAID,'
                +' CASE WHEN B.BANCOID = ''03'' THEN ''CTA. CTE (BENEFICIOS)'''
                +'      WHEN B.BANCOID = ''04'' THEN ''REG. RETENC. JUDIC.'' END TIPCREDES'
                +' From PVS306 A, PVS307 B, TGE186 C, TGE106 D'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And B.PVSLAGRID = '+QuotedStr('FPG')
                +' And B.FLGVOUCHER = '+QuotedStr('N')
                +' And TIPCREID = '+QuotedStr('RJ')
                +' And B.BANCOID = D.BANCOID'
                +' And D.CIAID = '+QuotedStr('02')
                +' And (D.BANCOID = ''03'' And D.CCBCOID = ''194-625395-0-20'')'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And A.PVSLTIPBE = C.TIPBENEF) X'
                +' Group By CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, X.TIPCREDES)'
                +' UNION ALL'
  //*PARA LAS RETENCIONES JUDICIALES-DEBE*/
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES,'
                +' SUM(NVL(X.PVSLMONTO, 0)) DEBE, 0 HABER, ''REG. RETENC. JUDIC.'' PVSNOMBRE, '''' DOCUMENTO From'
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE , A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
                +' B.PVSLMONTO, C.BENEFDES, ''46901'' CUENTAID,'
                +' ''REG. RETENC. JUDIC.'' TIPCREDES'
                +' From PVS306 A, PVS307 B, TGE186 C'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And B.PVSLAGRID = '+QuotedStr('DSC')
                +' And TIPCREID = '+QuotedStr('RJ')
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And A.PVSLTIPBE = C.TIPBENEF) X'
                +' Group By CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, X.TIPCREDES)'
                +' ) Y'
                +' )'
                +' Group By CIAID, CNTCOMPROB, CUENTAID, CCOSID, TDIARID, CNTANO, CNTANOMM, CNTLOTE, CLAUXID, AUXID, DOCID,'
                +' CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CNTTCAMBIO, CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE,'
                +' CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS,'
                +' TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, CAMPOVAR, CNTTS, CNTPAGADO,'
                +' CNTMODDOC, CNTREG, MODULO, CTA_SECU';

         DM1.cdsQry13.Filter   := '';
         DM1.cdsQry13.Filtered := False;
         DM1.cdsQry13.IndexFieldNames := '';
         DM1.cdsQry13.Close;
         DM1.cdsQry13.DataRequest(xSQL);
         DM1.cdsQry13.Open;
         DM1.cdsQry13.IndexFieldNames := 'CNTFCOMP';

         xCount := 0; //Sólo existen dos Registros para las Retenciones
         If DM1.cdsQry13.RecordCount > 0 Then
          begin
           DM1.cdsQry13.First;
           While Not DM1.cdsQry13.EOF do
            begin
             If xCount < 2 Then
              begin
               DM1.cdsQry18.Append;
               DM1.cdsQry18.FieldByName('CIAID').AsString      := DM1.cdsQry13.FieldByName('CIAID').AsString;
               DM1.cdsQry18.FieldByName('CNTCOMPROB').AsString := DM1.StrZero(IntToStr(xNroComprob + 1), 10);
               DM1.cdsQry18.FieldByName('TDIARID').AsString    := DM1.cdsQry13.FieldByName('TDIARID').AsString;
               DM1.cdsQry18.FieldByName('CNTANO').AsString     := DM1.cdsQry13.FieldByName('CNTANO').AsString;
               DM1.cdsQry18.FieldByName('CNTANOMM').AsString   := DM1.cdsQry13.FieldByName('CNTANOMM').AsString;
               DM1.cdsQry18.FieldByName('CNTLOTE').AsString    := DM1.cdsQry13.FieldByName('CNTLOTE').AsString;
               DM1.cdsQry18.FieldByName('CUENTAID').AsString   := DM1.cdsQry13.FieldByName('CUENTAID').AsString;
               DM1.cdsQry18.FieldByName('CNTGLOSA').AsString   := DM1.cdsQry13.FieldByName('CNTGLOSA').AsString;
               DM1.cdsQry18.FieldByName('CNTDH').AsString      := DM1.cdsQry13.FieldByName('CNTDH').AsString;
               DM1.cdsQry18.FieldByName('CNTTCAMBIO').AsString := DM1.cdsQry13.FieldByName('CNTTCAMBIO').AsString;
               DM1.cdsQry18.FieldByName('CNTMTOORI').AsString  := DM1.cdsQry13.FieldByName('CNTMTOORI').AsString;
               DM1.cdsQry18.FieldByName('CNTMTOLOC').AsString  := DM1.cdsQry13.FieldByName('CNTMTOLOC').AsString;
               DM1.cdsQry18.FieldByName('CNTMTOEXT').AsString  := DM1.cdsQry13.FieldByName('CNTMTOEXT').AsString;
               DM1.cdsQry18.FieldByName('CNTFCOMP').AsString   := DM1.cdsQry13.FieldByName('CNTFCOMP').AsString;
               DM1.cdsQry18.FieldByName('CNTESTADO').AsString  := DM1.cdsQry13.FieldByName('CNTESTADO').AsString;
               DM1.cdsQry18.FieldByName('CNTCUADRE').AsString  := DM1.cdsQry13.FieldByName('CNTCUADRE').AsString;
               DM1.cdsQry18.FieldByName('CNTFAUTOM').AsString  := DM1.cdsQry13.FieldByName('CNTFAUTOM').AsString;
               DM1.cdsQry18.FieldByName('CNTUSER').AsString    := DM1.wUsuario;
               DM1.cdsQry18.FieldByName('CNTFREG').AsString    := DM1.cdsQry13.FieldByName('CNTFREG').AsString;
               DM1.cdsQry18.FieldByName('CNTHREG').AsString    := DM1.cdsQry13.FieldByName('CNTHREG').AsString;
               DM1.cdsQry18.FieldByName('CNTMM').AsString      := DM1.cdsQry13.FieldByName('CNTMM').AsString;
               DM1.cdsQry18.FieldByName('TMONID').AsString     := DM1.cdsQry13.FieldByName('TMONID').AsString;
               DM1.cdsQry18.FieldByName('FLAGVAR').AsString    := DM1.cdsQry13.FieldByName('FLAGVAR').AsString;
               DM1.cdsQry18.FieldByName('TDIARDES').AsString   := DM1.cdsQry13.FieldByName('TDIARDES').AsString;
               DM1.cdsQry18.FieldByName('CNTDEBEMN').AsString  := DM1.cdsQry13.FieldByName('CNTDEBEMN').AsString;
               DM1.cdsQry18.FieldByName('CNTDEBEME').AsString  := DM1.cdsQry13.FieldByName('CNTDEBEME').AsString;
               DM1.cdsQry18.FieldByName('CNTHABEMN').AsString  := DM1.cdsQry13.FieldByName('CNTHABEMN').AsString;
               DM1.cdsQry18.FieldByName('CNTHABEME').AsString  := DM1.cdsQry13.FieldByName('CNTHABEME').AsString;
               DM1.cdsQry18.FieldByName('CNTSALDMN').AsString  := DM1.cdsQry13.FieldByName('CNTSALDMN').AsString;
               DM1.cdsQry18.FieldByName('CNTSALDME').AsString  := DM1.cdsQry13.FieldByName('CNTSALDME').AsString;
               DM1.cdsQry18.FieldByName('CNTMODDOC').AsString  := DM1.cdsQry13.FieldByName('CNTMODDOC').AsString;
               DM1.cdsQry18.FieldByName('CNTREG').AsString     := DM1.cdsQry13.FieldByName('CNTREG').AsString;
               DM1.cdsQry18.FieldByName('MODULO').AsString     := DM1.cdsQry13.FieldByName('MODULO').AsString;
               DM1.cdsQry18.FieldByName('CNTDEBEMN').AsString  := DM1.cdsQry13.FieldByName('CNTDEBEMN').AsString;
               xCount := xCount + 1;
              end
             Else
              begin
               xNroComprob := xNroComprob + 1;
               DM1.cdsQry18.Append;
               DM1.cdsQry18.FieldByName('CIAID').AsString      := DM1.cdsQry13.FieldByName('CIAID').AsString;
               DM1.cdsQry18.FieldByName('CNTCOMPROB').AsString := DM1.StrZero(IntToStr(xNroComprob + 1), 10);
               DM1.cdsQry18.FieldByName('TDIARID').AsString    := DM1.cdsQry13.FieldByName('TDIARID').AsString;
               DM1.cdsQry18.FieldByName('CNTANO').AsString     := DM1.cdsQry13.FieldByName('CNTANO').AsString;
               DM1.cdsQry18.FieldByName('CNTANOMM').AsString   := DM1.cdsQry13.FieldByName('CNTANOMM').AsString;
               DM1.cdsQry18.FieldByName('CNTLOTE').AsString    := DM1.cdsQry13.FieldByName('CNTLOTE').AsString;
               DM1.cdsQry18.FieldByName('CUENTAID').AsString   := DM1.cdsQry13.FieldByName('CUENTAID').AsString;
               DM1.cdsQry18.FieldByName('CNTGLOSA').AsString   := DM1.cdsQry13.FieldByName('CNTGLOSA').AsString;
               DM1.cdsQry18.FieldByName('CNTDH').AsString      := DM1.cdsQry13.FieldByName('CNTDH').AsString;
               DM1.cdsQry18.FieldByName('CNTTCAMBIO').AsString := DM1.cdsQry13.FieldByName('CNTTCAMBIO').AsString;
               DM1.cdsQry18.FieldByName('CNTMTOORI').AsString  := DM1.cdsQry13.FieldByName('CNTMTOORI').AsString;
               DM1.cdsQry18.FieldByName('CNTMTOLOC').AsString  := DM1.cdsQry13.FieldByName('CNTMTOLOC').AsString;
               DM1.cdsQry18.FieldByName('CNTMTOEXT').AsString  := DM1.cdsQry13.FieldByName('CNTMTOEXT').AsString;
               DM1.cdsQry18.FieldByName('CNTFCOMP').AsString   := DM1.cdsQry13.FieldByName('CNTFCOMP').AsString;
               DM1.cdsQry18.FieldByName('CNTESTADO').AsString  := DM1.cdsQry13.FieldByName('CNTESTADO').AsString;
               DM1.cdsQry18.FieldByName('CNTCUADRE').AsString  := DM1.cdsQry13.FieldByName('CNTCUADRE').AsString;
               DM1.cdsQry18.FieldByName('CNTFAUTOM').AsString  := DM1.cdsQry13.FieldByName('CNTFAUTOM').AsString;
               DM1.cdsQry18.FieldByName('CNTUSER').AsString    := DM1.wUsuario;
               DM1.cdsQry18.FieldByName('CNTFREG').AsString    := DM1.cdsQry13.FieldByName('CNTFREG').AsString;
               DM1.cdsQry18.FieldByName('CNTHREG').AsString    := DM1.cdsQry13.FieldByName('CNTHREG').AsString;
               DM1.cdsQry18.FieldByName('CNTMM').AsString      := DM1.cdsQry13.FieldByName('CNTMM').AsString;
               DM1.cdsQry18.FieldByName('TMONID').AsString     := DM1.cdsQry13.FieldByName('TMONID').AsString;
               DM1.cdsQry18.FieldByName('FLAGVAR').AsString    := DM1.cdsQry13.FieldByName('FLAGVAR').AsString;
               DM1.cdsQry18.FieldByName('TDIARDES').AsString   := DM1.cdsQry13.FieldByName('TDIARDES').AsString;
               DM1.cdsQry18.FieldByName('CNTDEBEMN').AsString  := DM1.cdsQry13.FieldByName('CNTDEBEMN').AsString;
               DM1.cdsQry18.FieldByName('CNTDEBEME').AsString  := DM1.cdsQry13.FieldByName('CNTDEBEME').AsString;
               DM1.cdsQry18.FieldByName('CNTHABEMN').AsString  := DM1.cdsQry13.FieldByName('CNTHABEMN').AsString;
               DM1.cdsQry18.FieldByName('CNTHABEME').AsString  := DM1.cdsQry13.FieldByName('CNTHABEME').AsString;
               DM1.cdsQry18.FieldByName('CNTSALDMN').AsString  := DM1.cdsQry13.FieldByName('CNTSALDMN').AsString;
               DM1.cdsQry18.FieldByName('CNTSALDME').AsString  := DM1.cdsQry13.FieldByName('CNTSALDME').AsString;
               DM1.cdsQry18.FieldByName('CNTMODDOC').AsString  := DM1.cdsQry13.FieldByName('CNTMODDOC').AsString;
               DM1.cdsQry18.FieldByName('CNTREG').AsString     := DM1.cdsQry13.FieldByName('CNTREG').AsString;
               DM1.cdsQry18.FieldByName('MODULO').AsString     := DM1.cdsQry13.FieldByName('MODULO').AsString;
               DM1.cdsQry18.FieldByName('CNTDEBEMN').AsString  := DM1.cdsQry13.FieldByName('CNTDEBEMN').AsString;
               xCount := 0;
              end;
             DM1.cdsQry13.Next;
            end;
          end;


  //Para Generar el Número Correlativo de Comprobante según Compañía
         DM1.cdsQry22.First;
         While Not DM1.cdsQry22.EOF do
          begin
           xNroComprob := 2;
           DM1.cdsQry21.First;
           While Not DM1.cdsQry21.EOF do
            begin
             If DM1.cdsQry22.FieldByName('CIAID').AsString = DM1.cdsQry21.FieldByName('CIAID').AsString Then
              begin
               DM1.cdsQry21.Edit;
               DM1.cdsQry21.FieldByName('CNTCOMPROB').AsString := DM1.StrZero(IntToStr(xNroComprob + 1), 10);
               xNroComprob := xNroComprob + 1;
              end;
             DM1.cdsQry21.Next;
            end;
           DM1.cdsQry22.Next;
          end;

         DM1.cdsQry21.First;
         While Not DM1.cdsQry21.EOF do
          begin
           DM1.cdsQry18.First;
           While Not DM1.cdsQry18.EOF do
            begin
             If (DM1.cdsQry21.FieldByName('CIAID').AsString = DM1.cdsQry18.FieldByName('CIAID').AsString) And
                (DM1.cdsQry21.FieldByName('PVSLFECBE').AsString = DM1.cdsQry18.FieldByName('CNTFCOMP').AsString) Then
              begin
               DM1.cdsQry18.Edit;
               DM1.cdsQry18.FieldByName('CNTCOMPROB').AsString := DM1.cdsQry21.FieldByName('CNTCOMPROB').AsString;
              end;
             DM1.cdsQry18.Next;
            end;
           DM1.cdsQry21.Next;
          end;

         dbgContabiliza.Selected.Clear;
         dbgContabiliza.Selected.Add('CIAID'#9'2'#9'Companía'#9'T');
         dbgContabiliza.Selected.Add('TDIARID'#9'2'#9'Tipo~Diario'#9'T');
         dbgContabiliza.Selected.Add('CNTCOMPROB'#9'11'#9'Número~Documento'#9'T');
         dbgContabiliza.Selected.Add('CNTFCOMP'#9'10'#9'Fecha~Documento'#9'T');
         dbgContabiliza.Selected.Add('CNTANO'#9'4'#9'Año'#9'T');
         dbgContabiliza.Selected.Add('CNTANOMM'#9'6'#9'Año-Mes'#9'T');
         dbgContabiliza.Selected.Add('CUENTAID'#9'10'#9'Id~Cuenta'#9'T');
         dbgContabiliza.Selected.Add('CNTDH'#9'3'#9'Debe(D)~Haber(H)'#9'T');
         dbgContabiliza.Selected.Add('CCOSID'#9'10'#9'Id. Centro~Costo'#9'T');
         dbgContabiliza.Selected.Add('CNTTCAMBIO'#9'10'#9'Tipo~Cambio'#9'T');
         dbgContabiliza.Selected.Add('CNTMTOLOC'#9'10'#9'Monto~(Soles)'#9'T');
         dbgContabiliza.Selected.Add('CNTMTOEXT'#9'10'#9'Monto~(Dólares)'#9'T');
         dbgContabiliza.Selected.Add('CNTDEBEMN'#9'14'#9'Monto Debe~(Soles)'#9'T');
         dbgContabiliza.Selected.Add('CNTDEBEME'#9'14'#9'Monto Debe~(Dólares)'#9'T');
         dbgContabiliza.Selected.Add('CNTHABEMN'#9'14'#9'Monto Haber~(Soles)'#9'T');
         dbgContabiliza.Selected.Add('CNTHABEME'#9'14'#9'Monto Haber~(Dólares)'#9'T');

         TNumericField(DM1.cdsQry18.FieldByName('CNTMTOLOC')).DisplayFormat := '###,###,##0.00';
         TNumericField(DM1.cdsQry18.FieldByName('CNTMTOLOC')).EditFormat    := '########0.00';
         TNumericField(DM1.cdsQry18.FieldByName('CNTMTOEXT')).DisplayFormat := '###,###,##0.00';
         TNumericField(DM1.cdsQry18.FieldByName('CNTMTOEXT')).EditFormat    := '########0.00';
         TNumericField(DM1.cdsQry18.FieldByName('CNTDEBEMN')).DisplayFormat := '###,###,##0.00';
         TNumericField(DM1.cdsQry18.FieldByName('CNTDEBEMN')).EditFormat    := '########0.00';
         TNumericField(DM1.cdsQry18.FieldByName('CNTDEBEME')).DisplayFormat := '###,###,##0.00';
         TNumericField(DM1.cdsQry18.FieldByName('CNTDEBEME')).EditFormat    := '########0.00';
         TNumericField(DM1.cdsQry18.FieldByName('CNTHABEMN')).DisplayFormat := '###,###,##0.00';
         TNumericField(DM1.cdsQry18.FieldByName('CNTHABEMN')).EditFormat    := '########0.00';
         TNumericField(DM1.cdsQry18.FieldByName('CNTHABEME')).DisplayFormat := '###,###,##0.00';
         TNumericField(DM1.cdsQry18.FieldByName('CNTHABEME')).EditFormat    := '########0.00';

         dbgContabiliza.ColumnByName('CNTDEBEMN').FooterValue := FloatToStrF(DM1.OperClientDataSet(DM1.cdsQry18, 'SUM(CNTDEBEMN)', ''), ffNumber, 15, 2);
         dbgContabiliza.ColumnByName('CNTDEBEME').FooterValue := FloatToStrF(DM1.OperClientDataSet(DM1.cdsQry18, 'SUM(CNTDEBEME)', ''), ffNumber, 15, 2);
         dbgContabiliza.ColumnByName('CNTHABEMN').FooterValue := FloatToStrF(DM1.OperClientDataSet(DM1.cdsQry18, 'SUM(CNTHABEMN)', ''), ffNumber, 15, 2);
         dbgContabiliza.ColumnByName('CNTHABEME').FooterValue := FloatToStrF(DM1.OperClientDataSet(DM1.cdsQry18, 'SUM(CNTHABEME)', ''), ffNumber, 15, 2);
         dbgContabiliza.ApplySelected;

         DM1.cdsQry18.IndexFieldNames := 'CIAID; CNTCOMPROB';         
         DM1.cdsQry18.EnableControls;

         If DM1.cdsQry18.RecordCount = 0 Then
          begin
           Beep;
           MessageDlg('No Existen Datos para el Año '+dbseAno.Text+' y Mes '+dbseMes.Text, mtInformation, [mbOk], 0);
           dbseAno.SetFocus;
          end
         Else
          begin
           Beep;
           MessageDlg('Datos Contabilizados para el Año '+dbseAno.Text+' y el Mes de '+DM1.NombreMes(dbseMes.Text), mtCustom, [mbOk], 0);
          end;
        end
       Else
        begin
         Screen.Cursor := crDefault;
         Exit;
        end;
      end
     Else //Si Existe Tipo de Cambio
      begin
       xFecha      := DateToStr(dbdtpFecMov.Date);
       xTipoCambio := DM1.cdsQry.FieldByName('TCAMVOV').AsString;
       DM1.cdsQry18.DisableControls;

       xSQL := 'Select CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, DOCID,'
              +' CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO,'
              +' SUM(CNTMTOORI) CNTMTOORI, SUM(CNTMTOLOC) CNTMTOLOC, SUM(CNTMTOEXT) CNTMTOEXT, CNTFEMIS, CNTFVCMTO,'
              +' CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM,'
              +' CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES,'
              +' CCOSDES, SUM(CNTDEBEMN) CNTDEBEMN, SUM(CNTDEBEME) CNTDEBEME, SUM(CNTHABEMN) CNTHABEMN,'
              +' SUM(CNTHABEME) CNTHABEME, SUM(CNTSALDMN) CNTSALDMN, SUM(CNTSALDME) CNTSALDME, CAMPOVAR, CNTTS,'
              +' CNTPAGADO, CNTMODDOC, ''N'' CNTREG, MODULO, CTA_SECU'
              +' From ('
              +' Select Y.CIAID, '+QuotedStr(dblcTipo.Text)+' TDIARID, ''0000000001'' CNTCOMPROB,'+QuotedStr(dbseAno.Text)+' CNTANO, '
              +QuotedStr(dbseAno.Text+dbseMes.Text)+' CNTANOMM,'
              +QuotedStr(DM1.wModulo)+' CNTLOTE, Y.CUENTAID, Null CLAUXID, Null AUXID, Null DOCID, Null CNTSERIE, Y.DOCUMENTO CNTNODOC,'
              +' Y.PVSNOMBRE CNTGLOSA,'
              +' CASE WHEN Y.DEBE > 0 THEN ''D'' ELSE ''H'' END CNTDH, Y.CCOSID,'
              +FloatToStrF(StrToFloat(xTipoCambio), ffNumber, 15, 4)+' CNTTCAMBIO,'
              +' CASE WHEN Y.DEBE > 0 THEN Y.DEBE ELSE Y.HABER END CNTMTOORI,'
              +' CASE WHEN Y.DEBE > 0 THEN Y.DEBE ELSE Y.HABER END CNTMTOLOC,'
              +' CASE WHEN Y.DEBE > 0 THEN Y.DEBE/'+xTipoCambio+' ELSE Y.HABER/'+xTipoCambio+' END CNTMTOEXT,'
              +' Null CNTFEMIS, Null CNTFVCMTO, To_char(Y.PVSLFECBE, ''DD/MM/YYYY'') CNTFCOMP,'
              +' ''I'' CNTESTADO, ''S'' CNTCUADRE, ''N'' CNTFAUTOM, ''GQUISPE'' CNTUSER, To_Date(To_Char(SysDate, ''DD/MM/YYYY'')) CNTFREG, SysDate CNTHREG,'
              +' ''06'' CNTMM, Null CNTDD, Null CNTTRI, Null CNTSEM, Null CNTSS, Null CNTAATRI, Null CNTAASEM,'
              +' NULL CNTAASS, ''N'' TMONID, ''L'' FLAGVAR, Null FCONS,'
              +' NULL CNTFMEC, ''EGRESOS BENEFICIOS'' TDIARDES, NULL CTADES,'
              +' NULL AUXDES, Null DOCDES, NULL CCOSDES, Y.DEBE CNTDEBEMN, '+'Y.DEBE/'+xTipoCambio+' CNTDEBEME,'
              +' Y.HABER CNTHABEMN, Y.HABER/'+xTipoCambio+' CNTHABEME, 0 CNTSALDMN, 0 CNTSALDME, Null CAMPOVAR,'
              +' Null CNTTS, Null CNTPAGADO, ''PRE'' CNTMODDOC, ''N'' CNTREG, ''PRE'' MODULO, Null CTA_SECU From'
              +' ('
              +' (Select S.CIAID, S.PVSLFECBE, S.PVSLBENNR, S.PVSLTIPBE, '''' BENEFDES, APO101.CCOSID, S.CUENTAID, S.TIPCREDES,'
              +' SUM(S.DEBE) DEBE, SUM(S.HABER) HABER, S.PVSNOMBRE, S.DOCUMENTO'
              +' From'
              +' ('
              +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI,'
              +' CASE WHEN A.PVSLTIPBE = ''01'' THEN ''4810003'''
              +'      WHEN A.PVSLTIPBE = ''02'' THEN ''4820005'''
              +'      WHEN A.PVSLTIPBE = ''03'' THEN ''4820002'' END CUENTAID,'
              +' CASE WHEN A.PVSLTIPBE = ''01'' THEN ''BENEFICIO POR RETIRO'''
              +'      WHEN A.PVSLTIPBE = ''02'' THEN ''BENEFICIO POR FALLECIMIENTO'''
              +'      WHEN A.PVSLTIPBE = ''03'' THEN ''BENEFICIO POR INVALIDEZ'' END TIPCREDES,'
              +' CASE WHEN A.PVSLTIPBE = ''01'' THEN A.PVSLTBEN'
              +'      WHEN A.PVSLTIPBE = ''02'' THEN SUM(PVS307.PVSLMONTO)'
              +'      WHEN A.PVSLTIPBE = ''03'' THEN SUM(PVS307.PVSLMONTO) END DEBE , 0 HABER, '''' PVSNOMBRE, '''' DOCUMENTO'
              +' From PVS306 A, PVS307'
              +' Where A.PVSESTLIQ In (''02'', ''05'')'
              +' And A.PVSLBENNR = PVS307.PVSLBENNR'
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
              +' And NVL(PVS307.PVSLMONTO, 0) > 0'
              +' And PVS307.PVSLAGRID = '+QuotedStr('DET')
              +' And Not PVS307.PVSLCONCE Like ''MONTO DIFERENCIAL%'''
              +' Group By A.CIAID, A.PVSLBENNR, A.FREG, A.PVSLTIPBE, A.PVSLTBEN, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI)'
              //*LAS DIFERENCIAS DE BENEFICIOS*/
              +' UNION ALL'
              +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI,'
              +' CASE WHEN A.PVSLTIPBE = ''01'' THEN ''4810003'''
              +'      WHEN A.PVSLTIPBE = ''02'' THEN ''4820005'''
              +'      WHEN A.PVSLTIPBE = ''03'' THEN ''4820002'' END CUENTAID,'
              +' CASE WHEN A.PVSLTIPBE = ''01'' THEN ''BENEFICIO POR RETIRO'''
              +'      WHEN A.PVSLTIPBE = ''02'' THEN ''BENEFICIO POR FALLECIMIENTO'''
              +'      WHEN A.PVSLTIPBE = ''03'' THEN ''BENEFICIO POR INVALIDEZ'' END TIPCREDES,'
              +' CASE WHEN A.PVSLTIPBE = ''02'' And (A.PVSLTBEN = SUM(PVS307.PVSLMONTO)) THEN 0 ELSE A.PVSLTBEN - SUM(PVS307.PVSLMONTO)'
              +' END DEBE, 0 HABER, '''' PVSNOMBRE, '''' DOCUMENTO'
              +' From PVS306 A, PVS307'
              +' Where A.PVSESTLIQ In (''02'', ''05'') And A.PVSLTIPBE In (''02'')'
              +' And A.PVSLBENNR = PVS307.PVSLBENNR'
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
              +' And NVL(PVS307.PVSLMONTO, 0) > 0'
              +' And PVS307.PVSLAGRID = '+QuotedStr('DET')
              +' And Not PVS307.PVSLCONCE Like ''MONTO DIFERENCIAL%'''
              +' Group By A.CIAID, A.PVSLBENNR, A.FREG, A.PVSLTIPBE, A.PVSLTBEN, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI)'
              +' UNION ALL'
              //*PARA INVALIDEZ*/
              +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI,'
              +' CASE WHEN A.PVSLTIPBE = ''01'' THEN ''4810003'''
              +'      WHEN A.PVSLTIPBE = ''02'' THEN ''4820005'''
              +'      WHEN A.PVSLTIPBE = ''03'' THEN ''4820002'' END CUENTAID,'
              +' CASE WHEN A.PVSLTIPBE = ''01'' THEN ''BENEFICIO POR RETIRO'''
              +'      WHEN A.PVSLTIPBE = ''02'' THEN ''BENEFICIO POR FALLECIMIENTO'''
              +'      WHEN A.PVSLTIPBE = ''03'' THEN ''BENEFICIO POR INVALIDEZ'' END TIPCREDES,'
              +' CASE WHEN A.PVSLTIPBE = ''03'' And (A.PVSLTBEN = SUM(PVS307.PVSLMONTO)) THEN 0 ELSE A.PVSLTBEN - SUM(PVS307.PVSLMONTO)'
              +' END DEBE, 0 HABER, '''' PVSNOMBRE, '''' DOCUMENTO'
              +' From PVS306 A, PVS307'
              +' Where A.PVSESTLIQ In (''02'', ''05'') And A.PVSLTIPBE In (''03'')'
              +' And A.PVSLBENNR = PVS307.PVSLBENNR'
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
              +' And NVL(PVS307.PVSLMONTO, 0) > 0'
              +' And PVS307.PVSLAGRID = '+QuotedStr('DET')
              +' And Not PVS307.PVSLCONCE Like ''MONTO DIFERENCIAL%'''
              +' Group By A.CIAID, A.PVSLBENNR, A.FREG, A.PVSLTIPBE, A.PVSLTBEN, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI)'
              +' ) S, APO101'
              +' Where S.PVSLUSEI = APO101.USEID(+)'
              +' And S.PVSLUPAI = APO101.UPAGOID(+)'
              +' And S.PVSLUPRI = APO101.UPROID(+)'
              +' Group By S.CIAID, S.PVSLFECBE, S.PVSLBENNR, S.PVSLTIPBE, APO101.CCOSID, S.CUENTAID, S.TIPCREDES, PVSNOMBRE, DOCUMENTO'
              +' )'
              +' UNION ALL'
              //*CUENTAS PARA LOS DESCUENTOS INDEBIDOS */
              +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, TGE186.BENEFDES, X.CCOSID, X.CUENTAID, X.TIPCREDES,'
              +' SUM(NVL(X.PVSLMONTO, 0)) DEBE, 0 HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
              +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, ''DEV'' TIPCREID, ''4810002'' CUENTAID,'
              +' ''DESCUENTOS INDEBIDOS'' TIPCREDES, B.PVSLMONTO, APO101.CCOSID'
              +' From PVS306 A, PVS307 B, APO101'
              +' Where A.PVSLBENNR = B.PVSLBENNR'
              +' And B.PVSLAGRID = '+QuotedStr('DEV')
              +' And A.PVSESTLIQ In (''02'', ''05'')'
              +' And B.PVSLMONTO > 0'
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
              +' And A.PVSLUSEI = APO101.USEID(+)'
              +' And A.PVSLUPAI = APO101.UPAGOID(+)'
              +' And A.PVSLUPRI = APO101.UPROID(+)'
              +' ) X, TGE186'
              +' Where X.PVSLTIPBE = TIPBENEF'
              +' Group By X.CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CCOSID, BENEFDES, TIPCREDES)'
              +' UNION ALL'
              +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
              +' SUM(NVL(X.PVSLMONTO, 0)) HABER, X.PVSNOMBRE, X.DOCUMENTO From'
              +' (Select ''02'' CIAID, A.FREG PVSLFECBE , A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
              +' B.PVSLMONTO, C.BENEFDES, D.CTAPRINC CUENTAID, B.PVSNOMBRE,'
              +' CASE WHEN B.BANCOID = ''03'' THEN ''CTA. CTE (BENEFICIOS)'''
              +'      WHEN B.BANCOID = ''04'' THEN ''CTA. CTE 0000-003905'' END TIPCREDES,'
              +' CASE WHEN B.BANCOID = ''03'' And B.FORPAGOID = ''01'' THEN B.NROCHEQUE'
              +'      WHEN B.BANCOID = ''04'' THEN B.PVSLNOFC'
              +' WHEN B.BANCOID = ''03'' And B.FORPAGOID = ''11'' THEN ''Of. ''|| B.PVSLNOFC END DOCUMENTO'
              +' From PVS306 A, PVS307 B, TGE186 C, TGE106 D'
              +' Where A.PVSLBENNR = B.PVSLBENNR'
              +' And B.PVSLAGRID = '+QuotedStr('FPG')
              +' And B.FLGVOUCHER = '+QuotedStr('N')
              +' And B.TIPCREID Is Null'
              +' And B.BANCOID = D.BANCOID'
              +' And D.CIAID = '+QuotedStr('02')
              +' And ((D.BANCOID = ''03'' And D.CCBCOID = ''194-625395-0-20'') Or'
              +' (D.BANCOID = ''04'' And D.CCBCOID = ''0000-003905''))'
              +' And A.PVSESTLIQ In (''02'', ''05'')'
              +' And B.PVSLMONTO > 0'
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
              +' And A.PVSLTIPBE = C.TIPBENEF) X'
              +' Group By CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, x.TIPCREDES, X.PVSNOMBRE, X.DOCUMENTO)'
              +' UNION ALL'
              //*PARA LAS RETENCIONES JUDICIALES-HABER*/
              +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
              +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
              +' (Select ''02'' CIAID, A.FREG PVSLFECBE , A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
              +' B.PVSLMONTO, C.BENEFDES, D.CTAPRINC CUENTAID,'
              +' CASE WHEN B.BANCOID = ''03'' THEN ''CTA. CTE (BENEFICIOS)'''
              +'      WHEN B.BANCOID = ''04'' THEN ''REG. RETENC. JUDIC.'' END TIPCREDES'
              +' From PVS306 A, PVS307 B, TGE186 C, TGE106 D'
              +' Where A.PVSLBENNR = B.PVSLBENNR'
              +' And B.PVSLAGRID = '+QuotedStr('FPG')
              +' And B.FLGVOUCHER = '+QuotedStr('N')
              +' And TIPCREID = '+QuotedStr('RJ')
              +' And B.BANCOID = D.BANCOID'
              +' And D.CIAID = '+QuotedStr('02')
              +' And (D.BANCOID = ''03'' And D.CCBCOID = ''194-625395-0-20'')'
              +' And A.PVSESTLIQ In (''02'', ''05'')'
              +' And B.PVSLMONTO > 0'
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
              +' And A.PVSLTIPBE = C.TIPBENEF) X'
              +' Group By CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, X.TIPCREDES)'
              +' UNION ALL'
              //*CUENTAS PARA LOS DESCUENTOS PARA COMPAÑIA 02*/
              +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, APO101.CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
              +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
              +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
              +' C.BENEFDES, E.CUENTAID, D.CREAMORT PVSLMONTO, E.TIPCREDES, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI'
              +' From PVS306 A, PVS307 B, TGE186 C, CRE310 D, CRE110 E'
              +' Where A.PVSLBENNR = B.PVSLBENNR'
              +' And B.PVSLAGRID = '+QuotedStr('DSC')
              +' And A.ASOID = D.ASOID'
              +' And B.TIPCREID = D.TIPCREID'
              +' And B.CREDID = D.CREDID'
              +' And D.TIPCREID = E.TIPCREID'
              +' And A.PVSESTLIQ In (''02'', ''05'')'
              +' And B.PVSLMONTO > 0'
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
              +' And D.CREMTOCOB > 0'
              +' And A.PVSLBENNR = D.CREDOCPAG'
              +' And (NVL(E.CIAID, ''02'') = ''02'')'
              +' And A.PVSLTIPBE = C.TIPBENEF) X, APO101'
              +' Where X.PVSLUSEI = APO101.USEID(+)'
              +' And X.PVSLUPAI = APO101.UPAGOID(+)'
              +' And X.PVSLUPRI = APO101.UPROID(+)'
              +' Group By X.CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, X.CUENTAID, BENEFDES, CCOSID, X.TIPCREDES)'
              +' UNION ALL'
              //*PARA LAS AMORTIZACIONES*/
              +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR,  X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
              +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
              +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
              +' C.BENEFDES, E.CTAINT CUENTAID, D.CREINTERES PVSLMONTO, E.TIPCREDES'
              +' From PVS306 A, PVS307 B, TGE186 C, CRE310 D, CRE110 E'
              +' Where A.PVSLBENNR = B.PVSLBENNR'
              +' And B.PVSLAGRID = '+QuotedStr('DSC')
              +' And A.ASOID = D.ASOID'
              +' And B.TIPCREID = D.TIPCREID'
              +' And B.CREDID = D.CREDID'
              +' And D.TIPCREID = E.TIPCREID'
              +' And A.PVSESTLIQ In (''02'', ''05'')'
              +' And B.PVSLMONTO > 0'
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
              +' And A.PVSLBENNR = D.CREDOCPAG'
              +' And D.CREMTOCOB > 0'
              +' And A.PVSLTIPBE = C.TIPBENEF) X'
              +' Group By X.CIAID, PVSLFECBE, X.PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, X.TIPCREDES)'
              +' UNION ALL'
              //*PARA LOS INTERESES*/
              +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
              +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
              +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
              +' C.BENEFDES, E.CTAFLAT CUENTAID, D.CREFLAT PVSLMONTO, E.TIPCREDES'
              +' From PVS306 A, PVS307 B, TGE186 C, CRE310 D, CRE110 E'
              +' Where A.PVSLBENNR = B.PVSLBENNR'
              +' And B.PVSLAGRID = '+QuotedStr('DSC')
              +' And A.ASOID = D.ASOID'
              +' And B.TIPCREID = D.TIPCREID'
              +' And B.CREDID = D.CREDID'
              +' And D.TIPCREID = E.TIPCREID'
              +' And A.PVSESTLIQ In (''02'', ''05'')'
              +' And B.PVSLMONTO > 0'
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
              +' And A.PVSLBENNR = D.CREDOCPAG'
              +' And D.CREMTOCOB > 0'
              +' And A.PVSLTIPBE = C.TIPBENEF) X'
              +' Group By X.CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, X.TIPCREDES)'
              +' UNION ALL'
              //*PARA LOS DESCUENTOS DE OTRA COMPAÑIA*/
              +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
              +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
              +' (Select ''02''  CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
              +' C.BENEFDES, E.FILIAL CUENTAID, (D.CREAMORT) PVSLMONTO, E.TIPCREDES'
              +' From PVS306 A, PVS307 B, TGE186 C, CRE310 D, CRE110 E'
              +' Where A.PVSLBENNR = B.PVSLBENNR'
              +' And B.PVSLAGRID = '+QuotedStr('DSC')
              +' And A.ASOID = D.ASOID'
              +' And B.TIPCREID = D.TIPCREID'
              +' And B.CREDID = D.CREDID'
              +' And D.TIPCREID = E.TIPCREID'
              +' And A.PVSESTLIQ In (''02'', ''05'')'
              +' And B.PVSLMONTO > 0'
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
              +' And A.PVSLBENNR = D.CREDOCPAG'
              +' And (E.CIAID <> ''02'' And E.CIAID Is Not Null)'
              +' And A.PVSLTIPBE = C.TIPBENEF) X'
              +' Group By CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, X.TIPCREDES)'
              +' UNION ALL'
              //*CUENTAS PARA LOS  DESCUENTOS DE OTRAS COMPAÑIAS*/
              //********************************************************************************************/
              +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES,'
              +' SUM(NVL(X.PVSLMONTO, 0)) DEBE, 0 HABER, '''' PVSNOMBRE, '''' DOCUMENTO  From'
              +' (Select E.CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
              +' C.BENEFDES, E.CUENTAH CUENTAID, (D.CREAMORT) PVSLMONTO, E.TIPCREDES'
              +' From PVS306 A, PVS307 B, TGE186 C, CRE310 D, CRE110 E'
              +' Where A.PVSLBENNR = B.PVSLBENNR'
              +' And B.PVSLAGRID = '+QuotedStr('DSC')
              +' And A.ASOID = D.ASOID'
              +' And B.TIPCREID = D.TIPCREID'
              +' And B.CREDID = D.CREDID'
              +' And D.TIPCREID = E.TIPCREID'
              +' And A.PVSESTLIQ In (''02'', ''05'')'
              +' And B.PVSLMONTO > 0'
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
              +' And A.PVSLBENNR = D.CREDOCPAG'
              +' And (E.CIAID <> ''02'' And E.CIAID Is Not Null)'
              +' And A.PVSLTIPBE = C.TIPBENEF) X'
              +' Group By CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, X.TIPCREDES)'
              +' UNION ALL'
              //********************************************************************************************/
              //*****CUENTAS 165 */
              +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, APO101.CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
              +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
              +' (Select E.CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
              +' C.BENEFDES, E.CUENTAID, D.CREAMORT PVSLMONTO, E.TIPCREDES, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI'
              +' From PVS306 A, PVS307 B, TGE186 C, CRE310 D, CRE110 E'
              +' Where A.PVSLBENNR = B.PVSLBENNR'
              +' And B.PVSLAGRID = '+QuotedStr('DSC')
              +' And A.ASOID = D.ASOID'
              +' And B.TIPCREID = D.TIPCREID'
              +' And B.CREDID = D.CREDID'
              +' And D.TIPCREID = E.TIPCREID'
              +' And A.PVSESTLIQ In (''02'', ''05'')'
              +' And B.PVSLMONTO > 0'
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
              +' And D.CREMTOCOB > 0'
              +' And A.PVSLBENNR = D.CREDOCPAG'
              +' And (E.CIAID <> ''02'' And E.CIAID Is Not Null)'
              +' And A.PVSLTIPBE = C.TIPBENEF) X, APO101'
              +' Where X.PVSLUSEI = APO101.USEID(+)'
              +' And X.PVSLUPAI = APO101.UPAGOID(+)'
              +' And X.PVSLUPRI = APO101.UPROID(+)'
              +' Group By CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, X.CUENTAID, BENEFDES, CCOSID, X.TIPCREDES)'
              //*PARA LAS NIVELACIONES*/
              +' UNION ALL'
              +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, TGE186.BENEFDES, X.CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
              +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
              +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI,'
              +' CASE WHEN B.TIPCREID = ''N'' THEN ''APORTE DE MAESTROS'' END TIPCREDES,'
              +' CASE WHEN B.TIPCREID = ''N'' THEN ''4810001'' END CUENTAID, B.PVSLMONTO, CCOSID'
              +' From PVS306 A, PVS307 B, APO101 C'
              +' Where A.PVSLBENNR = B.PVSLBENNR And (B.TIPCREID = ''N'')'
              +' And A.PVSESTLIQ In (''02'', ''05'')'
              +' And B.PVSLMONTO > 0'
              +' And A.PVSLUSEI = C.USEID(+)'
              +' And A.PVSLUPRI = C.UPROID(+)'
              +' And A.PVSLUPAI = C.UPAGOID(+)'
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)+') X, TGE186'
              +' Where X.PVSLTIPBE = TIPBENEF'
              +' Group By X.CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, X.CCOSID, X.CUENTAID, BENEFDES, TIPCREDES, PVSLUSEI, PVSLUPRI, PVSLUPAI)'
              +' UNION ALL'
              +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, TGE186.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
              +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
              +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
              +' CASE WHEN B.TIPCREID = ''T'' THEN ''OTROS'' END TIPCREDES,'
              +' CASE WHEN B.TIPCREID = ''T'' THEN ''75909'' END CUENTAID,'
              +' B.PVSLMONTO'
              +' From PVS306 A, PVS307 B'
              +' Where A.PVSLBENNR = B.PVSLBENNR And (B.TIPCREID = ''T'')'
              +' And A.PVSESTLIQ In (''02'', ''05'')'
              +' And B.PVSLMONTO > 0'
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)+') X, TGE186'
              +' Where X.PVSLTIPBE = TIPBENEF'
              +' Group By X.CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, TIPCREDES)'
              +' UNION ALL'
              //*PARA LAS RELIQUIDACIONES*/
              +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, TGE186.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
              +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
              +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
              +' CASE WHEN B.TIPCREID = ''PA'' THEN B.PVSLCONCE END TIPCREDES,'
              +' CASE WHEN B.TIPCREID = ''PA'' AND B.PVSLTIPBE = ''01'' THEN ''4810003'' '
              +'      WHEN B.TIPCREID = ''PA'' AND B.PVSLTIPBE = ''02'' THEN ''4820005'' '
              +'      WHEN B.TIPCREID = ''PA'' AND B.PVSLTIPBE = ''03'' THEN ''4820002'' END CUENTAID,'
              +' B.PVSLMONTO'
              +' From PVS306 A, PVS307 B'
              +' Where A.PVSLBENNR = B.PVSLBENNR And (B.TIPCREID = ''PA'')'
              +' And A.PVSESTLIQ In (''02'', ''05'')'
              +' And B.PVSLMONTO > 0'
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)+') X, TGE186'
              +' Where X.PVSLTIPBE = TIPBENEF'
              +' Group By X.CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, TIPCREDES)'
              +' ) Y'
              +' )'
              +' Group By CIAID, CNTCOMPROB, CUENTAID, CCOSID,'
              +' TDIARID, CNTANO, CNTANOMM, CNTLOTE, CLAUXID, AUXID, DOCID,'
              +' CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CNTTCAMBIO, CNTFEMIS, CNTFVCMTO,'
              +' CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM,'
              +' CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES,'
              +' CCOSDES, CAMPOVAR, CNTTS,'
              +' CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU'
              +' Order By CIAID, CNTFCOMP, CUENTAID, CCOSID';

       DM1.cdsQry18.Filter   := '';
       DM1.cdsQry18.Filtered := False;
       DM1.cdsQry18.IndexFieldNames := '';
       DM1.cdsQry18.Close;
       DM1.cdsQry18.DataRequest(xSQL);
       DM1.cdsQry18.Open;
       DM1.cdsQry18.IndexFieldNames := 'CIAID; CNTFCOMP; CUENTAID; CCOSID';

       xSQL := 'Select Distinct Z.CIAID, Z.PVSLFECBE, Cast('''' As Varchar2(12)) CNTCOMPROB From'
              +' ('
              +' (Select S.CIAID, S.PVSLFECBE, S.PVSLBENNR, S.PVSLTIPBE, '''' BENEFDES, APO101.CCOSID, S.CUENTAID, S.TIPCREDES,'
              +' SUM(S.DEBE) DEBE, SUM(S.HABER) HABER, S.PVSNOMBRE, S.DOCUMENTO'
              +' From'
              +' ('
              +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI,'
              +' CASE WHEN A.PVSLTIPBE = ''01'' THEN ''4810003'''
              +'      WHEN A.PVSLTIPBE = ''02'' THEN ''4820005'''
              +'      WHEN A.PVSLTIPBE = ''03'' THEN ''4820002'' END CUENTAID,'
              +' CASE WHEN A.PVSLTIPBE = ''01'' THEN ''BENEFICIO POR RETIRO'''
              +'      WHEN A.PVSLTIPBE = ''02'' THEN ''BENEFICIO POR FALLECIMIENTO'''
              +'      WHEN A.PVSLTIPBE = ''03'' THEN ''BENEFICIO POR INVALIDEZ'' END TIPCREDES,'
              +' CASE WHEN A.PVSLTIPBE = ''01'' THEN A.PVSLTBEN'
              +'      WHEN A.PVSLTIPBE = ''02'' THEN SUM(PVS307.PVSLMONTO)'
              +'      WHEN A.PVSLTIPBE = ''03'' THEN SUM(PVS307.PVSLMONTO) END DEBE , 0 HABER, '''' PVSNOMBRE, '''' DOCUMENTO'
              +' From PVS306 A, PVS307'
              +' Where A.PVSESTLIQ In (''02'', ''05'')'
              +' And A.PVSLBENNR = PVS307.PVSLBENNR'
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
              +' And NVL(PVS307.PVSLMONTO, 0) > 0'
              +' And PVS307.PVSLAGRID = '+QuotedStr('DET')
              +' And Not PVS307.PVSLCONCE Like ''MONTO DIFERENCIAL%'''
              +' Group By A.CIAID, A.PVSLBENNR, A.FREG, A.PVSLTIPBE, A.PVSLTBEN, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI)'
              //*LAS DIFERENCIAS DE BENEFICIOS*/
              +' UNION ALL'
              +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI,'
              +' CASE WHEN A.PVSLTIPBE = ''01'' THEN ''4810003'''
              +'      WHEN A.PVSLTIPBE = ''02'' THEN ''4820005'''
              +'      WHEN A.PVSLTIPBE = ''03'' THEN ''4820002'' END CUENTAID,'
              +' CASE WHEN A.PVSLTIPBE = ''01'' THEN ''BENEFICIO POR RETIRO'''
              +'      WHEN A.PVSLTIPBE = ''02'' THEN ''BENEFICIO POR FALLECIMIENTO'''
              +'      WHEN A.PVSLTIPBE = ''03'' THEN ''BENEFICIO POR INVALIDEZ'' END TIPCREDES,'
              +' CASE WHEN A.PVSLTIPBE = ''02'' And (A.PVSLTBEN = SUM(PVS307.PVSLMONTO)) THEN 0 ELSE A.PVSLTBEN - SUM(PVS307.PVSLMONTO)'
              +' END DEBE, 0 HABER, '''' PVSNOMBRE, '''' DOCUMENTO'
              +' From PVS306 A, PVS307'
              +' Where A.PVSESTLIQ In (''02'', ''05'') And A.PVSLTIPBE In (''02'')'
              +' And A.PVSLBENNR = PVS307.PVSLBENNR'
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
              +' And NVL(PVS307.PVSLMONTO, 0) > 0'
              +' And PVS307.PVSLAGRID = '+QuotedStr('DET')
              +' And Not PVS307.PVSLCONCE Like ''MONTO DIFERENCIAL%'''
              +' Group By A.CIAID, A.PVSLBENNR, A.FREG, A.PVSLTIPBE, A.PVSLTBEN, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI)'
              +' UNION ALL'
              //*PARA INVALIDEZ*/
              +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI,'
              +' CASE WHEN A.PVSLTIPBE = ''01'' THEN ''4810003'''
              +'      WHEN A.PVSLTIPBE = ''02'' THEN ''4820005'''
              +'      WHEN A.PVSLTIPBE = ''03'' THEN ''4820002'' END CUENTAID,'
              +' CASE WHEN A.PVSLTIPBE = ''01'' THEN ''BENEFICIO POR RETIRO'''
              +'      WHEN A.PVSLTIPBE = ''02'' THEN ''BENEFICIO POR FALLECIMIENTO'''
              +'      WHEN A.PVSLTIPBE = ''03'' THEN ''BENEFICIO POR INVALIDEZ'' END TIPCREDES,'
              +' CASE WHEN A.PVSLTIPBE = ''03'' And (A.PVSLTBEN = SUM(PVS307.PVSLMONTO)) THEN 0 ELSE A.PVSLTBEN - SUM(PVS307.PVSLMONTO)'
              +' END DEBE, 0 HABER, '''' PVSNOMBRE, '''' DOCUMENTO'
              +' From PVS306 A, PVS307'
              +' Where A.PVSESTLIQ In (''02'', ''05'') And A.PVSLTIPBE In (''03'')'
              +' And A.PVSLBENNR = PVS307.PVSLBENNR'
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
              +' And NVL(PVS307.PVSLMONTO, 0) > 0'
              +' And PVS307.PVSLAGRID = '+QuotedStr('DET')
              +' And Not PVS307.PVSLCONCE Like ''MONTO DIFERENCIAL%'''
              +' Group By A.CIAID, A.PVSLBENNR, A.FREG, A.PVSLTIPBE, A.PVSLTBEN, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI)'
              +' ) S, APO101'
              +' Where S.PVSLUSEI = APO101.USEID(+)'
              +' And S.PVSLUPAI = APO101.UPAGOID(+)'
              +' And S.PVSLUPRI = APO101.UPROID(+)'
              +' Group By S.CIAID, S.PVSLFECBE, S.PVSLBENNR, S.PVSLTIPBE, APO101.CCOSID, S.CUENTAID, S.TIPCREDES, PVSNOMBRE, DOCUMENTO'
              +' )'
              +' UNION ALL'
              //*CUENTAS PARA LOS DESCUENTOS INDEBIDOS */
              +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, TGE186.BENEFDES, X.CCOSID, X.CUENTAID, X.TIPCREDES,'
              +' SUM(NVL(X.PVSLMONTO, 0)) DEBE, 0 HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
              +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, ''DEV'' TIPCREID, ''4810002'' CUENTAID,'
              +' ''DESCUENTOS INDEBIDOS'' TIPCREDES, B.PVSLMONTO, APO101.CCOSID'
              +' From PVS306 A, PVS307 B, APO101'
              +' Where A.PVSLBENNR = B.PVSLBENNR'
              +' And B.PVSLAGRID = '+QuotedStr('DEV')
              +' And A.PVSESTLIQ In (''02'', ''05'')'
              +' And B.PVSLMONTO > 0'
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
              +' And A.PVSLUSEI = APO101.USEID(+)'
              +' And A.PVSLUPAI = APO101.UPAGOID(+)'
              +' And A.PVSLUPRI = APO101.UPROID(+)'
              +' ) X, TGE186'
              +' Where X.PVSLTIPBE = TIPBENEF'
              +' Group By X.CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CCOSID, BENEFDES, TIPCREDES)'
              +' UNION ALL'
              +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
              +' SUM(NVL(X.PVSLMONTO, 0)) HABER, X.PVSNOMBRE, X.DOCUMENTO From'
              +' (Select ''02'' CIAID, A.FREG PVSLFECBE , A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
              +' B.PVSLMONTO, C.BENEFDES, D.CTAPRINC CUENTAID, B.PVSNOMBRE,'
              +' CASE WHEN B.BANCOID = ''03'' THEN ''CTA. CTE (BENEFICIOS)'''
              +'      WHEN B.BANCOID = ''04'' THEN ''CTA. CTE 0000-003905'' END TIPCREDES,'
              +' CASE WHEN B.BANCOID = ''03'' And B.FORPAGOID = ''01'' THEN B.NROCHEQUE'
              +'      WHEN B.BANCOID = ''04'' THEN B.PVSLNOFC'
              +'      WHEN B.BANCOID = ''03'' And B.FORPAGOID = ''11'' THEN ''Of. ''|| B.PVSLNOFC END DOCUMENTO'
              +' From PVS306 A, PVS307 B, TGE186 C, TGE106 D'
              +' Where A.PVSLBENNR = B.PVSLBENNR'
              +' And B.PVSLAGRID = '+QuotedStr('FPG')
              +' And B.FLGVOUCHER = '+QuotedStr('N')
              +' And B.TIPCREID Is Null'
              +' And B.BANCOID = D.BANCOID'
              +' And D.CIAID = '+QuotedStr('02')
              +' And ((D.BANCOID = ''03'' And D.CCBCOID = ''194-625395-0-20'') Or'
              +' (D.BANCOID = ''04'' And D.CCBCOID = ''0000-003905''))'
              +' And A.PVSESTLIQ In (''02'', ''05'')'
              +' And B.PVSLMONTO > 0'
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
              +' And A.PVSLTIPBE = C.TIPBENEF) X'
              +' Group By CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, x.TIPCREDES, X.PVSNOMBRE, X.DOCUMENTO)'
              +' UNION ALL'
              //*PARA LAS RETENCIONES JUDICIALES-HABER*/
              +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
              +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
              +' (Select ''02'' CIAID, A.FREG PVSLFECBE , A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
              +' B.PVSLMONTO, C.BENEFDES, D.CTAPRINC CUENTAID,'
              +' CASE WHEN B.BANCOID = ''03'' THEN ''CTA. CTE (BENEFICIOS)'''
              +'      WHEN B.BANCOID = ''04'' THEN ''REG. RETENC. JUDIC.'' END TIPCREDES'
              +' From PVS306 A, PVS307 B, TGE186 C, TGE106 D'
              +' Where A.PVSLBENNR = B.PVSLBENNR'
              +' And B.PVSLAGRID = '+QuotedStr('FPG')
              +' And B.FLGVOUCHER = '+QuotedStr('N')
              +' And TIPCREID = '+QuotedStr('RJ')
              +' And B.BANCOID = D.BANCOID'
              +' And D.CIAID = '+QuotedStr('02')
              +' And ((D.BANCOID = ''03'' And D.CCBCOID = ''194-625395-0-20'')'
              +' Or (D.BANCOID = ''04'' And D.CCBCOID = ''0000-003905''))'
              +' And A.PVSESTLIQ In (''02'', ''05'')'
              +' And B.PVSLMONTO > 0'
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
              +' And A.PVSLTIPBE = C.TIPBENEF) X'
              +' Group By CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, X.TIPCREDES)'
              +' UNION ALL'
              //*CUENTAS PARA LOS DESCUENTOS PARA COMPAÑIA 02*/
              +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, APO101.CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
              +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
              +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
              +' C.BENEFDES, E.CUENTAID, D.CREAMORT PVSLMONTO, E.TIPCREDES, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI'
              +' From PVS306 A, PVS307 B, TGE186 C, CRE310 D, CRE110 E'
              +' Where A.PVSLBENNR = B.PVSLBENNR'
              +' And B.PVSLAGRID = '+QuotedStr('DSC')
              +' And A.ASOID = D.ASOID'
              +' And B.TIPCREID = D.TIPCREID'
              +' And B.CREDID = D.CREDID'
              +' And D.TIPCREID = E.TIPCREID'
              +' And A.PVSESTLIQ In (''02'', ''05'')'
              +' And B.PVSLMONTO > 0'
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
              +' And D.CREMTOCOB > 0'
              +' And A.PVSLBENNR = D.CREDOCPAG'
              +' And (NVL(E.CIAID, ''02'') = ''02'')'
              +' And A.PVSLTIPBE = C.TIPBENEF) X, APO101'
              +' Where X.PVSLUSEI = APO101.USEID(+)'
              +' And X.PVSLUPAI = APO101.UPAGOID(+)'
              +' And X.PVSLUPRI = APO101.UPROID(+)'
              +' Group By X.CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, X.CUENTAID, BENEFDES, CCOSID, X.TIPCREDES)'
              +' UNION ALL'
              //*PARA LAS AMORTIZACIONES*/
              +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR,  X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
              +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
              +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
              +' C.BENEFDES, E.CTAINT CUENTAID, D.CREINTERES PVSLMONTO, E.TIPCREDES'
              +' From PVS306 A, PVS307 B, TGE186 C, CRE310 D, CRE110 E'
              +' Where A.PVSLBENNR = B.PVSLBENNR'
              +' And B.PVSLAGRID = '+QuotedStr('DSC')
              +' And A.ASOID = D.ASOID'
              +' And B.TIPCREID = D.TIPCREID'
              +' And B.CREDID = D.CREDID'
              +' And D.TIPCREID = E.TIPCREID'
              +' And A.PVSESTLIQ In (''02'', ''05'')'
              +' And B.PVSLMONTO > 0'
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
              +' And A.PVSLBENNR = D.CREDOCPAG'
              +' And D.CREMTOCOB > 0'
              +' And A.PVSLTIPBE = C.TIPBENEF) X'
              +' Group By X.CIAID, PVSLFECBE, X.PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, X.TIPCREDES)'
              +' UNION ALL'
              //*PARA LOS INTERESES*/
              +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
              +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
              +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
              +' C.BENEFDES, E.CTAFLAT CUENTAID, D.CREFLAT PVSLMONTO, E.TIPCREDES'
              +' From PVS306 A, PVS307 B, TGE186 C, CRE310 D, CRE110 E'
              +' Where A.PVSLBENNR = B.PVSLBENNR'
              +' And B.PVSLAGRID = '+QuotedStr('DSC')
              +' And A.ASOID = D.ASOID'
              +' And B.TIPCREID = D.TIPCREID'
              +' And B.CREDID = D.CREDID'
              +' And D.TIPCREID = E.TIPCREID'
              +' And A.PVSESTLIQ In (''02'', ''05'')'
              +' And B.PVSLMONTO > 0'
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
              +' And A.PVSLBENNR = D.CREDOCPAG'
              +' And D.CREMTOCOB > 0'
              +' And A.PVSLTIPBE = C.TIPBENEF) X'
              +' Group By X.CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, X.TIPCREDES)'
              +' UNION ALL'
              //*PARA LOS DESCUENTOS DE OTRA COMPAÑIA*/
              +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
              +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
              +' (Select ''02''  CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
              +' C.BENEFDES, E.FILIAL CUENTAID, (D.CREAMORT + D.CREINTERES + D.CREFLAT) PVSLMONTO, E.TIPCREDES'
              +' From PVS306 A, PVS307 B, TGE186 C, CRE310 D, CRE110 E'
              +' Where A.PVSLBENNR = B.PVSLBENNR'
              +' And B.PVSLAGRID = '+QuotedStr('DSC')
              +' And A.ASOID = D.ASOID'
              +' And B.TIPCREID = D.TIPCREID'
              +' And B.CREDID = D.CREDID'
              +' And D.TIPCREID = E.TIPCREID'
              +' And A.PVSESTLIQ In (''02'', ''05'')'
              +' And B.PVSLMONTO > 0'
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
              +' And A.PVSLBENNR = D.CREDOCPAG'
              +' And (E.CIAID <> ''02'' And E.CIAID Is Not Null)'
              +' And A.PVSLTIPBE = C.TIPBENEF) X'
              +' Group By CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, X.TIPCREDES)'
              +' UNION ALL'
              //*CUENTAS PARA LOS  DESCUENTOS DE OTRAS COMPAÑIAS*/
              //********************************************************************************************/
              +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES,'
              +' SUM(NVL(X.PVSLMONTO, 0)) DEBE, 0 HABER, '''' PVSNOMBRE, '''' DOCUMENTO  From'
              +' (Select E.CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
              +' C.BENEFDES, E.CUENTAH CUENTAID, (D.CREAMORT + D.CREINTERES + D.CREFLAT) PVSLMONTO, E.TIPCREDES'
              +' From PVS306 A, PVS307 B, TGE186 C, CRE310 D, CRE110 E'
              +' Where A.PVSLBENNR = B.PVSLBENNR'
              +' And B.PVSLAGRID = '+QuotedStr('DSC')
              +' And A.ASOID = D.ASOID'
              +' And B.TIPCREID = D.TIPCREID'
              +' And B.CREDID = D.CREDID'
              +' And D.TIPCREID = E.TIPCREID'
              +' And A.PVSESTLIQ In (''02'', ''05'')'
              +' And B.PVSLMONTO > 0'
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
              +' And A.PVSLBENNR = D.CREDOCPAG'
              +' And (E.CIAID <> ''02'' And E.CIAID Is Not Null)'
              +' And A.PVSLTIPBE = C.TIPBENEF) X'
              +' Group By CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, X.TIPCREDES)'
              +' UNION ALL'
              //********************************************************************************************/
              //*****CUENTAS 165 */
              +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, APO101.CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
              +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
              +' (Select E.CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
              +' C.BENEFDES, E.CUENTAID, D.CREAMORT PVSLMONTO, E.TIPCREDES, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI'
              +' From PVS306 A, PVS307 B, TGE186 C, CRE310 D, CRE110 E'
              +' Where A.PVSLBENNR = B.PVSLBENNR'
              +' And B.PVSLAGRID = '+QuotedStr('DSC')
              +' And A.ASOID = D.ASOID'
              +' And B.TIPCREID = D.TIPCREID'
              +' And B.CREDID = D.CREDID'
              +' And D.TIPCREID = E.TIPCREID'
              +' And A.PVSESTLIQ In (''02'', ''05'')'
              +' And B.PVSLMONTO > 0'
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
              +' And D.CREMTOCOB > 0'
              +' And A.PVSLBENNR = D.CREDOCPAG'
              +' And (E.CIAID <> ''02'' And E.CIAID Is Not Null)'
              +' And A.PVSLTIPBE = C.TIPBENEF) X, APO101'
              +' Where X.PVSLUSEI = APO101.USEID(+)'
              +' And X.PVSLUPAI = APO101.UPAGOID(+)'
              +' And X.PVSLUPRI = APO101.UPROID(+)'
              +' Group By CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, X.CUENTAID, BENEFDES, CCOSID, X.TIPCREDES)'
              //*PARA LAS NIVELACIONES*/
              +' UNION ALL'
              +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, TGE186.BENEFDES, X.CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
              +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
              +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI,'
              +' CASE WHEN B.TIPCREID = ''N'' THEN ''APORTE DE MAESTROS'' END TIPCREDES,'
              +' CASE WHEN B.TIPCREID = ''N'' THEN ''4810001'' END CUENTAID, B.PVSLMONTO, CCOSID'
              +' From PVS306 A, PVS307 B, APO101 C'
              +' Where A.PVSLBENNR = B.PVSLBENNR And (B.TIPCREID = ''N'')'
              +' And A.PVSESTLIQ In (''02'', ''05'')'
              +' And B.PVSLMONTO > 0'
              +' And A.PVSLUSEI = C.USEID(+)'
              +' And A.PVSLUPRI = C.UPROID(+)'
              +' And A.PVSLUPAI = C.UPAGOID(+)'
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)+') X, TGE186'
              +' Where X.PVSLTIPBE = TIPBENEF'
              +' Group By X.CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, X.CCOSID, X.CUENTAID, BENEFDES, TIPCREDES, PVSLUSEI, PVSLUPRI, PVSLUPAI)'
              +' UNION ALL'
              +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, TGE186.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
              +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
              +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
              +' CASE WHEN B.TIPCREID = ''T'' THEN ''OTROS'' END TIPCREDES,'
              +' CASE WHEN B.TIPCREID = ''T'' THEN ''75909'' END CUENTAID,'
              +' B.PVSLMONTO'
              +' From PVS306 A, PVS307 B'
              +' Where A.PVSLBENNR = B.PVSLBENNR And (B.TIPCREID = ''T'')'
              +' And A.PVSESTLIQ In (''02'', ''05'')'
              +' And B.PVSLMONTO > 0'
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)+') X, TGE186'
              +' Where X.PVSLTIPBE = TIPBENEF'
              +' Group By X.CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, TIPCREDES)'
              +' UNION ALL'
              //*PARA LAS RELIQUIDACIONES*/
              +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, TGE186.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
              +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
              +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
              +' CASE WHEN B.TIPCREID = ''PA'' THEN B.PVSLCONCE END TIPCREDES,'
              +' CASE WHEN B.TIPCREID = ''PA'' AND B.PVSLTIPBE = ''01'' THEN ''4810003'' '
              +'      WHEN B.TIPCREID = ''PA'' AND B.PVSLTIPBE = ''02'' THEN ''4820005'' '
              +'      WHEN B.TIPCREID = ''PA'' AND B.PVSLTIPBE = ''03'' THEN ''4820002'' END CUENTAID,'
//  +' CASE WHEN B.TIPCREID = ''PA'' THEN ''RELIQUIDACION'' END CUENTAID,'
              +' B.PVSLMONTO'
              +' From PVS306 A, PVS307 B'
              +' Where A.PVSLBENNR = B.PVSLBENNR And (B.TIPCREID = ''PA'')'
              +' And A.PVSESTLIQ In (''02'', ''05'')'
              +' And B.PVSLMONTO > 0'
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)+') X, TGE186'
              +' Where X.PVSLTIPBE = TIPBENEF'
              +' Group By X.CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, TIPCREDES)'
              +') Z';

       DM1.cdsQry21.Filter   := '';
       DM1.cdsQry21.Filtered := False;
       DM1.cdsQry21.IndexFieldNames := '';
       DM1.cdsQry21.Close;
       DM1.cdsQry21.DataRequest(xSQL);
       DM1.cdsQry21.Open;
       DM1.cdsQry21.IndexFieldNames := 'CIAID; PVSLFECBE';

//Para Ver el Número de Compañías
       xSQL := 'Select Distinct Z.CIAID From'
              +' ('
                +' (Select S.CIAID, S.PVSLFECBE, S.PVSLBENNR, S.PVSLTIPBE, '''' BENEFDES, APO101.CCOSID, S.CUENTAID, S.TIPCREDES,'
                +' SUM(S.DEBE) DEBE, SUM(S.HABER) HABER, S.PVSNOMBRE, S.DOCUMENTO'
                +' From'
                +' ('
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI,'
                +' CASE WHEN A.PVSLTIPBE = ''01'' THEN ''4810003'''
                +'      WHEN A.PVSLTIPBE = ''02'' THEN ''4820005'''
                +'      WHEN A.PVSLTIPBE = ''03'' THEN ''4820002'' END CUENTAID,'
                +' CASE WHEN A.PVSLTIPBE = ''01'' THEN ''BENEFICIO POR RETIRO'''
                +'      WHEN A.PVSLTIPBE = ''02'' THEN ''BENEFICIO POR FALLECIMIENTO'''
                +'      WHEN A.PVSLTIPBE = ''03'' THEN ''BENEFICIO POR INVALIDEZ'' END TIPCREDES,'
                +' CASE WHEN A.PVSLTIPBE = ''01'' THEN A.PVSLTBEN'
                +'      WHEN A.PVSLTIPBE = ''02'' THEN SUM(PVS307.PVSLMONTO)'
                +'      WHEN A.PVSLTIPBE = ''03'' THEN SUM(PVS307.PVSLMONTO) END DEBE , 0 HABER, '''' PVSNOMBRE, '''' DOCUMENTO'
                +' From PVS306 A, PVS307'
                +' Where A.PVSESTLIQ In (''02'', ''05'')'
                +' And A.PVSLBENNR = PVS307.PVSLBENNR'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And NVL(PVS307.PVSLMONTO, 0) > 0'
                +' And PVS307.PVSLAGRID = '+QuotedStr('DET')
                +' And Not PVS307.PVSLCONCE Like ''MONTO DIFERENCIAL%'''
                +' Group By A.CIAID, A.PVSLBENNR, A.FREG, A.PVSLTIPBE, A.PVSLTBEN, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI)'
                //*LAS DIFERENCIAS DE BENEFICIOS*/
                +' UNION ALL'
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI,'
                +' CASE WHEN A.PVSLTIPBE = ''01'' THEN ''4810003'''
                +'      WHEN A.PVSLTIPBE = ''02'' THEN ''4820005'''
                +'      WHEN A.PVSLTIPBE = ''03'' THEN ''4820002'' END CUENTAID,'
                +' CASE WHEN A.PVSLTIPBE = ''01'' THEN ''BENEFICIO POR RETIRO'''
                +'      WHEN A.PVSLTIPBE = ''02'' THEN ''BENEFICIO POR FALLECIMIENTO'''
                +'      WHEN A.PVSLTIPBE = ''03'' THEN ''BENEFICIO POR INVALIDEZ'' END TIPCREDES,'
                +' CASE WHEN A.PVSLTIPBE = ''02'' And (A.PVSLTBEN = SUM(PVS307.PVSLMONTO)) THEN 0 ELSE A.PVSLTBEN - SUM(PVS307.PVSLMONTO)'
                +' END DEBE, 0 HABER, '''' PVSNOMBRE, '''' DOCUMENTO'
                +' From PVS306 A, PVS307'
                +' Where A.PVSESTLIQ In (''02'', ''05'') And A.PVSLTIPBE In (''02'')'
                +' And A.PVSLBENNR = PVS307.PVSLBENNR'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And NVL(PVS307.PVSLMONTO, 0) > 0'
                +' And PVS307.PVSLAGRID = '+QuotedStr('DET')
                +' And Not PVS307.PVSLCONCE Like ''MONTO DIFERENCIAL%'''
                +' Group By A.CIAID, A.PVSLBENNR, A.FREG, A.PVSLTIPBE, A.PVSLTBEN, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI)'
                +' UNION ALL'
                //*PARA INVALIDEZ*/
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI,'
                +' CASE WHEN A.PVSLTIPBE = ''01'' THEN ''4810003'''
                +'      WHEN A.PVSLTIPBE = ''02'' THEN ''4820005'''
                +'      WHEN A.PVSLTIPBE = ''03'' THEN ''4820002'' END CUENTAID,'
                +' CASE WHEN A.PVSLTIPBE = ''01'' THEN ''BENEFICIO POR RETIRO'''
                +'      WHEN A.PVSLTIPBE = ''02'' THEN ''BENEFICIO POR FALLECIMIENTO'''
                +'      WHEN A.PVSLTIPBE = ''03'' THEN ''BENEFICIO POR INVALIDEZ'' END TIPCREDES,'
                +' CASE WHEN A.PVSLTIPBE = ''03'' And (A.PVSLTBEN = SUM(PVS307.PVSLMONTO)) THEN 0 ELSE A.PVSLTBEN - SUM(PVS307.PVSLMONTO)'
                +' END DEBE, 0 HABER, '''' PVSNOMBRE, '''' DOCUMENTO'
                +' From PVS306 A, PVS307'
                +' Where A.PVSESTLIQ In (''02'', ''05'') And A.PVSLTIPBE In (''03'')'
                +' And A.PVSLBENNR = PVS307.PVSLBENNR'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And NVL(PVS307.PVSLMONTO, 0) > 0'
                +' And PVS307.PVSLAGRID = '+QuotedStr('DET')
                +' And Not PVS307.PVSLCONCE Like ''MONTO DIFERENCIAL%'''
                +' Group By A.CIAID, A.PVSLBENNR, A.FREG, A.PVSLTIPBE, A.PVSLTBEN, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI)'
                +' ) S, APO101'
                +' Where S.PVSLUSEI = APO101.USEID(+)'
                +' And S.PVSLUPAI = APO101.UPAGOID(+)'
                +' And S.PVSLUPRI = APO101.UPROID(+)'
                +' Group By S.CIAID, S.PVSLFECBE, S.PVSLBENNR, S.PVSLTIPBE, APO101.CCOSID, S.CUENTAID, S.TIPCREDES, PVSNOMBRE, DOCUMENTO'
                +' )'
                +' UNION ALL'
                //*CUENTAS PARA LOS DESCUENTOS INDEBIDOS */
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, TGE186.BENEFDES, X.CCOSID, X.CUENTAID, X.TIPCREDES,'
                +' SUM(NVL(X.PVSLMONTO, 0)) DEBE, 0 HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, ''DEV'' TIPCREID, ''4810002'' CUENTAID,'
                +' ''DESCUENTOS INDEBIDOS'' TIPCREDES, B.PVSLMONTO, APO101.CCOSID'
                +' From PVS306 A, PVS307 B, APO101'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And B.PVSLAGRID = '+QuotedStr('DEV')
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And A.PVSLUSEI = APO101.USEID(+)'
                +' And A.PVSLUPAI = APO101.UPAGOID(+)'
                +' And A.PVSLUPRI = APO101.UPROID(+)'
                +' ) X, TGE186'
                +' Where X.PVSLTIPBE = TIPBENEF'
                +' Group By X.CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CCOSID, BENEFDES, TIPCREDES)'
                +' UNION ALL'
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
                +' SUM(NVL(X.PVSLMONTO, 0)) HABER, X.PVSNOMBRE, X.DOCUMENTO From'
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE , A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
                +' B.PVSLMONTO, C.BENEFDES, D.CTAPRINC CUENTAID, B.PVSNOMBRE,'
                +' CASE WHEN B.BANCOID = ''03'' THEN ''CTA. CTE (BENEFICIOS)'''
                +'      WHEN B.BANCOID = ''04'' THEN ''CTA. CTE 0000-003905'' END TIPCREDES,'
                +' CASE WHEN B.BANCOID = ''03'' And B.FORPAGOID = ''01'' THEN B.NROCHEQUE'
                +'      WHEN B.BANCOID = ''04'' THEN B.PVSLNOFC'
                +'      WHEN B.BANCOID = ''03'' And B.FORPAGOID = ''11'' THEN ''Of. ''|| B.PVSLNOFC END DOCUMENTO'
                +' From PVS306 A, PVS307 B, TGE186 C, TGE106 D'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And B.PVSLAGRID = '+QuotedStr('FPG')
                +' And B.FLGVOUCHER = '+QuotedStr('N')
                +' And B.TIPCREID Is Null'
                +' And B.BANCOID = D.BANCOID'
                +' And D.CIAID = '+QuotedStr('02')
                +' And ((D.BANCOID = ''03'' And D.CCBCOID = ''194-625395-0-20'') Or'
                +' (D.BANCOID = ''04'' And D.CCBCOID = ''0000-003905''))'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And A.PVSLTIPBE = C.TIPBENEF) X'
                +' Group By CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, x.TIPCREDES, X.PVSNOMBRE, X.DOCUMENTO)'
                +' UNION ALL'
                //*PARA LAS RETENCIONES JUDICIALES-HABER*/
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
                +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE , A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
                +' B.PVSLMONTO, C.BENEFDES, D.CTAPRINC CUENTAID,'
                +' CASE WHEN B.BANCOID = ''03'' THEN ''CTA. CTE (BENEFICIOS)'''
                +'      WHEN B.BANCOID = ''04'' THEN ''REG. RETENC. JUDIC.'' END TIPCREDES'
                +' From PVS306 A, PVS307 B, TGE186 C, TGE106 D'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And B.PVSLAGRID = '+QuotedStr('FPG')
                +' And B.FLGVOUCHER = '+QuotedStr('N')
                +' And TIPCREID = '+QuotedStr('RJ')
                +' And B.BANCOID = D.BANCOID'
                +' And D.CIAID = '+QuotedStr('02')
                +' And (D.BANCOID = ''03'' And D.CCBCOID = ''194-625395-0-20'')'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And A.PVSLTIPBE = C.TIPBENEF) X'
                +' Group By CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, X.TIPCREDES)'
                +' UNION ALL'
                //*CUENTAS PARA LOS DESCUENTOS PARA COMPAÑIA 02*/
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, APO101.CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
                +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
                +' C.BENEFDES, E.CUENTAID, D.CREAMORT PVSLMONTO, E.TIPCREDES, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI'
                +' From PVS306 A, PVS307 B, TGE186 C, CRE310 D, CRE110 E'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And B.PVSLAGRID = '+QuotedStr('DSC')
                +' And A.ASOID = D.ASOID'
                +' And B.TIPCREID = D.TIPCREID'
                +' And B.CREDID = D.CREDID'
                +' And D.TIPCREID = E.TIPCREID'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And D.CREMTOCOB > 0'
                +' And A.PVSLBENNR = D.CREDOCPAG'
                +' And (NVL(E.CIAID, ''02'') = ''02'')'
                +' And A.PVSLTIPBE = C.TIPBENEF) X, APO101'
                +' Where X.PVSLUSEI = APO101.USEID(+)'
                +' And X.PVSLUPAI = APO101.UPAGOID(+)'
                +' And X.PVSLUPRI = APO101.UPROID(+)'
                +' Group By X.CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, X.CUENTAID, BENEFDES, CCOSID, X.TIPCREDES)'
                +' UNION ALL'
                //*PARA LAS AMORTIZACIONES*/
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR,  X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
                +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
                +' C.BENEFDES, E.CTAINT CUENTAID, D.CREINTERES PVSLMONTO, E.TIPCREDES'
                +' From PVS306 A, PVS307 B, TGE186 C, CRE310 D, CRE110 E'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And B.PVSLAGRID = '+QuotedStr('DSC')
                +' And A.ASOID = D.ASOID'
                +' And B.TIPCREID = D.TIPCREID'
                +' And B.CREDID = D.CREDID'
                +' And D.TIPCREID = E.TIPCREID'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And A.PVSLBENNR = D.CREDOCPAG'
                +' And D.CREMTOCOB > 0'
                +' And A.PVSLTIPBE = C.TIPBENEF) X'
                +' Group By X.CIAID, PVSLFECBE, X.PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, X.TIPCREDES)'
                +' UNION ALL'
                //*PARA LOS INTERESES*/
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
                +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
                +' C.BENEFDES, E.CTAFLAT CUENTAID, D.CREFLAT PVSLMONTO, E.TIPCREDES'
                +' From PVS306 A, PVS307 B, TGE186 C, CRE310 D, CRE110 E'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And B.PVSLAGRID = '+QuotedStr('DSC')
                +' And A.ASOID = D.ASOID'
                +' And B.TIPCREID = D.TIPCREID'
                +' And B.CREDID = D.CREDID'
                +' And D.TIPCREID = E.TIPCREID'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And A.PVSLBENNR = D.CREDOCPAG'
                +' And D.CREMTOCOB > 0'
                +' And A.PVSLTIPBE = C.TIPBENEF) X'
                +' Group By X.CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, X.TIPCREDES)'
                +' UNION ALL'
                //*PARA LOS DESCUENTOS DE OTRA COMPAÑIA*/
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
                +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
                +' (Select ''02''  CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
                +' C.BENEFDES, E.FILIAL CUENTAID, (D.CREAMORT + D.CREINTERES + D.CREFLAT) PVSLMONTO, E.TIPCREDES'
                +' From PVS306 A, PVS307 B, TGE186 C, CRE310 D, CRE110 E'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And B.PVSLAGRID = '+QuotedStr('DSC')
                +' And A.ASOID = D.ASOID'
                +' And B.TIPCREID = D.TIPCREID'
                +' And B.CREDID = D.CREDID'
                +' And D.TIPCREID = E.TIPCREID'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And A.PVSLBENNR = D.CREDOCPAG'
                +' And (E.CIAID <> ''02'' And E.CIAID Is Not Null)'
                +' And A.PVSLTIPBE = C.TIPBENEF) X'
                +' Group By CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, X.TIPCREDES)'
                +' UNION ALL'
                //*CUENTAS PARA LOS  DESCUENTOS DE OTRAS COMPAÑIAS*/
                //********************************************************************************************/
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES,'
                +' SUM(NVL(X.PVSLMONTO, 0)) DEBE, 0 HABER, '''' PVSNOMBRE, '''' DOCUMENTO  From'
                +' (Select E.CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
                +' C.BENEFDES, E.CUENTAH CUENTAID, (D.CREAMORT + D.CREINTERES + D.CREFLAT) PVSLMONTO, E.TIPCREDES'
                +' From PVS306 A, PVS307 B, TGE186 C, CRE310 D, CRE110 E'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And B.PVSLAGRID = '+QuotedStr('DSC')
                +' And A.ASOID = D.ASOID'
                +' And B.TIPCREID = D.TIPCREID'
                +' And B.CREDID = D.CREDID'
                +' And D.TIPCREID = E.TIPCREID'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And A.PVSLBENNR = D.CREDOCPAG'
                +' And (E.CIAID <> ''02'' And E.CIAID Is Not Null)'
                +' And A.PVSLTIPBE = C.TIPBENEF) X'
                +' Group By CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, X.TIPCREDES)'
                +' UNION ALL'
                //********************************************************************************************/
                //*****CUENTAS 165 */
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, APO101.CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
                +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
                +' (Select E.CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
                +' C.BENEFDES, E.CUENTAID, D.CREAMORT PVSLMONTO, E.TIPCREDES, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI'
                +' From PVS306 A, PVS307 B, TGE186 C, CRE310 D, CRE110 E'
                +' Where A.PVSLBENNR = B.PVSLBENNR'
                +' And B.PVSLAGRID = '+QuotedStr('DSC')
                +' And A.ASOID = D.ASOID'
                +' And B.TIPCREID = D.TIPCREID'
                +' And B.CREDID = D.CREDID'
                +' And D.TIPCREID = E.TIPCREID'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
                +' And D.CREMTOCOB > 0'
                +' And A.PVSLBENNR = D.CREDOCPAG'
                +' And (E.CIAID <> ''02'' And E.CIAID Is Not Null)'
                +' And A.PVSLTIPBE = C.TIPBENEF) X, APO101'
                +' Where X.PVSLUSEI = APO101.USEID(+)'
                +' And X.PVSLUPAI = APO101.UPAGOID(+)'
                +' And X.PVSLUPRI = APO101.UPROID(+)'
                +' Group By CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, X.CUENTAID, BENEFDES, CCOSID, X.TIPCREDES)'
                //*PARA LAS NIVELACIONES*/
                +' UNION ALL'
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, TGE186.BENEFDES, X.CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
                +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI,'
                +' CASE WHEN B.TIPCREID = ''N'' THEN ''APORTE DE MAESTROS'' END TIPCREDES,'
                +' CASE WHEN B.TIPCREID = ''N'' THEN ''4810001'' END CUENTAID, B.PVSLMONTO, CCOSID'
                +' From PVS306 A, PVS307 B, APO101 C'
                +' Where A.PVSLBENNR = B.PVSLBENNR And (B.TIPCREID = ''N'')'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And A.PVSLUSEI = C.USEID(+)'
                +' And A.PVSLUPRI = C.UPROID(+)'
                +' And A.PVSLUPAI = C.UPAGOID(+)'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)+') X, TGE186'
                +' Where X.PVSLTIPBE = TIPBENEF'
                +' Group By X.CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, X.CCOSID, X.CUENTAID, BENEFDES, TIPCREDES, PVSLUSEI, PVSLUPRI, PVSLUPAI)'
                +' UNION ALL'
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, TGE186.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
                +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
                +' CASE WHEN B.TIPCREID = ''T'' THEN ''OTROS'' END TIPCREDES,'
                +' CASE WHEN B.TIPCREID = ''T'' THEN ''75909'' END CUENTAID,'
                +' B.PVSLMONTO'
                +' From PVS306 A, PVS307 B'
                +' Where A.PVSLBENNR = B.PVSLBENNR And (B.TIPCREID = ''T'')'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)+') X, TGE186'
                +' Where X.PVSLTIPBE = TIPBENEF'
                +' Group By X.CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, TIPCREDES)'
                +' UNION ALL'
                //*PARA LAS RELIQUIDACIONES*/
                +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, TGE186.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
                +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
                +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
                +' CASE WHEN B.TIPCREID = ''PA'' THEN B.PVSLCONCE END TIPCREDES,'
//                +' CASE WHEN B.TIPCREID = ''PA'' THEN ''RELIQUIDACION'' END CUENTAID,'
                +' CASE WHEN B.TIPCREID = ''PA'' AND B.PVSLTIPBE = ''01'' THEN ''4810003'' '
                +'      WHEN B.TIPCREID = ''PA'' AND B.PVSLTIPBE = ''02'' THEN ''4820005'' '
                +'      WHEN B.TIPCREID = ''PA'' AND B.PVSLTIPBE = ''03'' THEN ''4820002'' END CUENTAID,'
                +' B.PVSLMONTO'
                +' From PVS306 A, PVS307 B'
                +' Where A.PVSLBENNR = B.PVSLBENNR And (B.TIPCREID = ''PA'')'
                +' And A.PVSESTLIQ In (''02'', ''05'')'
                +' And B.PVSLMONTO > 0'
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
                +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)+') X, TGE186'
                +' Where X.PVSLTIPBE = TIPBENEF'
                +' Group By X.CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, TIPCREDES)'
              +') Z';

       DM1.cdsQry22.Filter   := '';
       DM1.cdsQry22.Filtered := False;
       DM1.cdsQry22.IndexFieldNames := '';
       DM1.cdsQry22.Close;
       DM1.cdsQry22.DataRequest(xSQL);
       DM1.cdsQry22.Open;
       DM1.cdsQry22.IndexFieldNames := 'CIAID';

//PARA LAS RETENCIONES JUDICIALES - UN ASIENTO ADICIONAL
//*PARA LAS RETENCIONES JUDICIALES-DEBE*/
       xSQL := 'Select CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, DOCID,'
              +' CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO,'
              +' SUM(CNTMTOORI) CNTMTOORI, SUM(CNTMTOLOC) CNTMTOLOC, SUM(CNTMTOEXT) CNTMTOEXT, CNTFEMIS, CNTFVCMTO,'
              +' CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM,'
              +' CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES,'
              +' CCOSDES, SUM(CNTDEBEMN) CNTDEBEMN, SUM(CNTDEBEME) CNTDEBEME, SUM(CNTHABEMN) CNTHABEMN,'
              +' SUM(CNTHABEME) CNTHABEME, SUM(CNTSALDMN) CNTSALDMN, SUM(CNTSALDME) CNTSALDME, CAMPOVAR, CNTTS,'
              +' CNTPAGADO, CNTMODDOC, ''N'' CNTREG, MODULO, CTA_SECU'
              +' From ('
              +' Select Y.CIAID, '+QuotedStr(dblcTipo.Text)+' TDIARID, ''0000000001'' CNTCOMPROB,'+QuotedStr(dbseAno.Text)+' CNTANO, '
              +QuotedStr(dbseAno.Text+dbseMes.Text)+' CNTANOMM,'
              +QuotedStr(DM1.wModulo)+' CNTLOTE, Y.CUENTAID, Null CLAUXID, Null AUXID, Null DOCID, Null CNTSERIE, Y.DOCUMENTO CNTNODOC,'
              +' Y.PVSNOMBRE CNTGLOSA,'
              +' CASE WHEN Y.DEBE > 0 THEN ''D'' ELSE ''H'' END CNTDH, Y.CCOSID,'
              +FloatToStrF(StrToFloat(xTipoCambio), ffNumber, 15, 4)+' CNTTCAMBIO,'
              +' CASE WHEN Y.DEBE > 0 THEN Y.DEBE ELSE Y.HABER END CNTMTOORI,'
              +' CASE WHEN Y.DEBE > 0 THEN Y.DEBE ELSE Y.HABER END CNTMTOLOC,'
              +' CASE WHEN Y.DEBE > 0 THEN Y.DEBE/'+xTipoCambio+' ELSE Y.HABER/'+xTipoCambio+' END CNTMTOEXT,'
              +' Null CNTFEMIS, Null CNTFVCMTO, To_char(Y.PVSLFECBE, ''DD/MM/YYYY'') CNTFCOMP,'
              +' ''I'' CNTESTADO, ''S'' CNTCUADRE, ''N'' CNTFAUTOM, ''GQUISPE'' CNTUSER, To_Date(To_Char(SysDate, ''DD/MM/YYYY'')) CNTFREG, SysDate CNTHREG,'
              +' ''06'' CNTMM, Null CNTDD, Null CNTTRI, Null CNTSEM, Null CNTSS, Null CNTAATRI, Null CNTAASEM,'
              +' NULL CNTAASS, ''N'' TMONID, ''L'' FLAGVAR, Null FCONS,'
              +' NULL CNTFMEC, ''EGRESOS BENEFICIOS'' TDIARDES, NULL CTADES,'
              +' NULL AUXDES, Null DOCDES, NULL CCOSDES, Y.DEBE CNTDEBEMN, '+'Y.DEBE/'+xTipoCambio+' CNTDEBEME,'
              +' Y.HABER CNTHABEMN, Y.HABER/'+xTipoCambio+' CNTHABEME, 0 CNTSALDMN, 0 CNTSALDME, Null CAMPOVAR,'
              +' Null CNTTS, Null CNTPAGADO, ''PRE'' CNTMODDOC, ''N'' CNTREG, ''PRE'' MODULO, Null CTA_SECU From'
              +' ('
              +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
              +' SUM(NVL(X.PVSLMONTO, 0)) HABER, ''REG. RETENC. JUDIC.'' PVSNOMBRE, '''' DOCUMENTO From'
              +' (Select ''02'' CIAID, A.FREG PVSLFECBE , A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
              +' B.PVSLMONTO, C.BENEFDES, ''104010301'' CUENTAID,'
              +' CASE WHEN B.BANCOID = ''03'' THEN ''CTA. CTE (BENEFICIOS)'''
              +'      WHEN B.BANCOID = ''04'' THEN ''REG. RETENC. JUDIC.'' END TIPCREDES'
              +' From PVS306 A, PVS307 B, TGE186 C, TGE106 D'
              +' Where A.PVSLBENNR = B.PVSLBENNR'
              +' And B.PVSLAGRID = '+QuotedStr('FPG')
              +' And B.FLGVOUCHER = '+QuotedStr('N')
              +' And TIPCREID = '+QuotedStr('RJ')
              +' And B.BANCOID = D.BANCOID'
              +' And D.CIAID = '+QuotedStr('02')
              +' And (D.BANCOID = ''03'' And D.CCBCOID = ''194-625395-0-20'')'
              +' And A.PVSESTLIQ In (''02'', ''05'')'
              +' And B.PVSLMONTO > 0'
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
              +' And A.PVSLTIPBE = C.TIPBENEF) X'
              +' Group By CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, X.TIPCREDES)'
              +' UNION ALL'
//*PARA LAS RETENCIONES JUDICIALES-DEBE*/
              +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES,'
              +' SUM(NVL(X.PVSLMONTO, 0)) DEBE, 0 HABER, ''REG. RETENC. JUDIC.'' PVSNOMBRE, '''' DOCUMENTO From'
              +' (Select ''02'' CIAID, A.FREG PVSLFECBE , A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
              +' B.PVSLMONTO, C.BENEFDES, ''46901'' CUENTAID,'
              +' ''REG. RETENC. JUDIC.'' TIPCREDES'
              +' From PVS306 A, PVS307 B, TGE186 C'
              +' Where A.PVSLBENNR = B.PVSLBENNR'
              +' And B.PVSLAGRID = '+QuotedStr('DSC')
              +' And TIPCREID = '+QuotedStr('RJ')
              +' And A.PVSESTLIQ In (''02'', ''05'')'
              +' And B.PVSLMONTO > 0'
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(xFechaInicial)
              +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(xFechaFinal)
              +' And A.PVSLTIPBE = C.TIPBENEF) X'
              +' Group By CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, X.TIPCREDES)'
              +' ) Y'
              +' )'
              +' Group By CIAID, CNTCOMPROB, CUENTAID, CCOSID, TDIARID, CNTANO, CNTANOMM, CNTLOTE, CLAUXID, AUXID, DOCID,'
              +' CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CNTTCAMBIO, CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE,'
              +' CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS,'
              +' TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, CAMPOVAR, CNTTS, CNTPAGADO,'
              +' CNTMODDOC, CNTREG, MODULO, CTA_SECU';

       DM1.cdsQry13.Filter   := '';
       DM1.cdsQry13.Filtered := False;
       DM1.cdsQry13.IndexFieldNames := '';
       DM1.cdsQry13.Close;
       DM1.cdsQry13.DataRequest(xSQL);
       DM1.cdsQry13.Open;
       DM1.cdsQry13.IndexFieldNames := 'CNTFCOMP';

       xCount := 0; //Sólo existen dos Registros para las Retenciones
       If DM1.cdsQry13.RecordCount > 0 Then
        begin
         DM1.cdsQry13.First;
         While Not DM1.cdsQry13.EOF do
          begin
           If xCount < 2 Then
            begin
             DM1.cdsQry18.Append;
             DM1.cdsQry18.FieldByName('CIAID').AsString      := DM1.cdsQry13.FieldByName('CIAID').AsString;
             DM1.cdsQry18.FieldByName('CNTCOMPROB').AsString := DM1.StrZero(IntToStr(xNroComprob + 1), 10);
             DM1.cdsQry18.FieldByName('TDIARID').AsString    := DM1.cdsQry13.FieldByName('TDIARID').AsString;
             DM1.cdsQry18.FieldByName('CNTANO').AsString     := DM1.cdsQry13.FieldByName('CNTANO').AsString;
             DM1.cdsQry18.FieldByName('CNTANOMM').AsString   := DM1.cdsQry13.FieldByName('CNTANOMM').AsString;
             DM1.cdsQry18.FieldByName('CNTLOTE').AsString    := DM1.cdsQry13.FieldByName('CNTLOTE').AsString;
             DM1.cdsQry18.FieldByName('CUENTAID').AsString   := DM1.cdsQry13.FieldByName('CUENTAID').AsString;
             DM1.cdsQry18.FieldByName('CNTGLOSA').AsString   := DM1.cdsQry13.FieldByName('CNTGLOSA').AsString;
             DM1.cdsQry18.FieldByName('CNTDH').AsString      := DM1.cdsQry13.FieldByName('CNTDH').AsString;
             DM1.cdsQry18.FieldByName('CNTTCAMBIO').AsString := DM1.cdsQry13.FieldByName('CNTTCAMBIO').AsString;
             DM1.cdsQry18.FieldByName('CNTMTOORI').AsString  := DM1.cdsQry13.FieldByName('CNTMTOORI').AsString;
             DM1.cdsQry18.FieldByName('CNTMTOLOC').AsString  := DM1.cdsQry13.FieldByName('CNTMTOLOC').AsString;
             DM1.cdsQry18.FieldByName('CNTMTOEXT').AsString  := DM1.cdsQry13.FieldByName('CNTMTOEXT').AsString;
             DM1.cdsQry18.FieldByName('CNTFCOMP').AsString   := DM1.cdsQry13.FieldByName('CNTFCOMP').AsString;
             DM1.cdsQry18.FieldByName('CNTESTADO').AsString  := DM1.cdsQry13.FieldByName('CNTESTADO').AsString;
             DM1.cdsQry18.FieldByName('CNTCUADRE').AsString  := DM1.cdsQry13.FieldByName('CNTCUADRE').AsString;
             DM1.cdsQry18.FieldByName('CNTFAUTOM').AsString  := DM1.cdsQry13.FieldByName('CNTFAUTOM').AsString;
             DM1.cdsQry18.FieldByName('CNTUSER').AsString    := DM1.wUsuario;
             DM1.cdsQry18.FieldByName('CNTFREG').AsString    := DM1.cdsQry13.FieldByName('CNTFREG').AsString;
             DM1.cdsQry18.FieldByName('CNTHREG').AsString    := DM1.cdsQry13.FieldByName('CNTHREG').AsString;
             DM1.cdsQry18.FieldByName('CNTMM').AsString      := DM1.cdsQry13.FieldByName('CNTMM').AsString;
             DM1.cdsQry18.FieldByName('TMONID').AsString     := DM1.cdsQry13.FieldByName('TMONID').AsString;
             DM1.cdsQry18.FieldByName('FLAGVAR').AsString    := DM1.cdsQry13.FieldByName('FLAGVAR').AsString;
             DM1.cdsQry18.FieldByName('TDIARDES').AsString   := DM1.cdsQry13.FieldByName('TDIARDES').AsString;
             DM1.cdsQry18.FieldByName('CNTDEBEMN').AsString  := DM1.cdsQry13.FieldByName('CNTDEBEMN').AsString;
             DM1.cdsQry18.FieldByName('CNTDEBEME').AsString  := DM1.cdsQry13.FieldByName('CNTDEBEME').AsString;
             DM1.cdsQry18.FieldByName('CNTHABEMN').AsString  := DM1.cdsQry13.FieldByName('CNTHABEMN').AsString;
             DM1.cdsQry18.FieldByName('CNTHABEME').AsString  := DM1.cdsQry13.FieldByName('CNTHABEME').AsString;
             DM1.cdsQry18.FieldByName('CNTSALDMN').AsString  := DM1.cdsQry13.FieldByName('CNTSALDMN').AsString;
             DM1.cdsQry18.FieldByName('CNTSALDME').AsString  := DM1.cdsQry13.FieldByName('CNTSALDME').AsString;
             DM1.cdsQry18.FieldByName('CNTMODDOC').AsString  := DM1.cdsQry13.FieldByName('CNTMODDOC').AsString;
             DM1.cdsQry18.FieldByName('CNTREG').AsString     := DM1.cdsQry13.FieldByName('CNTREG').AsString;
             DM1.cdsQry18.FieldByName('MODULO').AsString     := DM1.cdsQry13.FieldByName('MODULO').AsString;
             DM1.cdsQry18.FieldByName('CNTDEBEMN').AsString  := DM1.cdsQry13.FieldByName('CNTDEBEMN').AsString;
             DM1.cdsQry18.Post;
             xCount := xCount + 1;
            end
           Else
            begin
             xNroComprob := xNroComprob + 1;
             DM1.cdsQry18.Append;
             DM1.cdsQry18.FieldByName('CIAID').AsString      := DM1.cdsQry13.FieldByName('CIAID').AsString;
             DM1.cdsQry18.FieldByName('CNTCOMPROB').AsString := DM1.StrZero(IntToStr(xNroComprob + 1), 10);
             DM1.cdsQry18.FieldByName('TDIARID').AsString    := DM1.cdsQry13.FieldByName('TDIARID').AsString;
             DM1.cdsQry18.FieldByName('CNTANO').AsString     := DM1.cdsQry13.FieldByName('CNTANO').AsString;
             DM1.cdsQry18.FieldByName('CNTANOMM').AsString   := DM1.cdsQry13.FieldByName('CNTANOMM').AsString;
             DM1.cdsQry18.FieldByName('CNTLOTE').AsString    := DM1.cdsQry13.FieldByName('CNTLOTE').AsString;
             DM1.cdsQry18.FieldByName('CUENTAID').AsString   := DM1.cdsQry13.FieldByName('CUENTAID').AsString;
             DM1.cdsQry18.FieldByName('CNTGLOSA').AsString   := DM1.cdsQry13.FieldByName('CNTGLOSA').AsString;
             DM1.cdsQry18.FieldByName('CNTDH').AsString      := DM1.cdsQry13.FieldByName('CNTDH').AsString;
             DM1.cdsQry18.FieldByName('CNTTCAMBIO').AsString := DM1.cdsQry13.FieldByName('CNTTCAMBIO').AsString;
             DM1.cdsQry18.FieldByName('CNTMTOORI').AsString  := DM1.cdsQry13.FieldByName('CNTMTOORI').AsString;
             DM1.cdsQry18.FieldByName('CNTMTOLOC').AsString  := DM1.cdsQry13.FieldByName('CNTMTOLOC').AsString;
             DM1.cdsQry18.FieldByName('CNTMTOEXT').AsString  := DM1.cdsQry13.FieldByName('CNTMTOEXT').AsString;
             DM1.cdsQry18.FieldByName('CNTFCOMP').AsString   := DM1.cdsQry13.FieldByName('CNTFCOMP').AsString;
             DM1.cdsQry18.FieldByName('CNTESTADO').AsString  := DM1.cdsQry13.FieldByName('CNTESTADO').AsString;
             DM1.cdsQry18.FieldByName('CNTCUADRE').AsString  := DM1.cdsQry13.FieldByName('CNTCUADRE').AsString;
             DM1.cdsQry18.FieldByName('CNTFAUTOM').AsString  := DM1.cdsQry13.FieldByName('CNTFAUTOM').AsString;
             DM1.cdsQry18.FieldByName('CNTUSER').AsString    := DM1.wUsuario;
             DM1.cdsQry18.FieldByName('CNTFREG').AsString    := DM1.cdsQry13.FieldByName('CNTFREG').AsString;
             DM1.cdsQry18.FieldByName('CNTHREG').AsString    := DM1.cdsQry13.FieldByName('CNTHREG').AsString;
             DM1.cdsQry18.FieldByName('CNTMM').AsString      := DM1.cdsQry13.FieldByName('CNTMM').AsString;
             DM1.cdsQry18.FieldByName('TMONID').AsString     := DM1.cdsQry13.FieldByName('TMONID').AsString;
             DM1.cdsQry18.FieldByName('FLAGVAR').AsString    := DM1.cdsQry13.FieldByName('FLAGVAR').AsString;
             DM1.cdsQry18.FieldByName('TDIARDES').AsString   := DM1.cdsQry13.FieldByName('TDIARDES').AsString;
             DM1.cdsQry18.FieldByName('CNTDEBEMN').AsString  := DM1.cdsQry13.FieldByName('CNTDEBEMN').AsString;
             DM1.cdsQry18.FieldByName('CNTDEBEME').AsString  := DM1.cdsQry13.FieldByName('CNTDEBEME').AsString;
             DM1.cdsQry18.FieldByName('CNTHABEMN').AsString  := DM1.cdsQry13.FieldByName('CNTHABEMN').AsString;
             DM1.cdsQry18.FieldByName('CNTHABEME').AsString  := DM1.cdsQry13.FieldByName('CNTHABEME').AsString;
             DM1.cdsQry18.FieldByName('CNTSALDMN').AsString  := DM1.cdsQry13.FieldByName('CNTSALDMN').AsString;
             DM1.cdsQry18.FieldByName('CNTSALDME').AsString  := DM1.cdsQry13.FieldByName('CNTSALDME').AsString;
             DM1.cdsQry18.FieldByName('CNTMODDOC').AsString  := DM1.cdsQry13.FieldByName('CNTMODDOC').AsString;
             DM1.cdsQry18.FieldByName('CNTREG').AsString     := DM1.cdsQry13.FieldByName('CNTREG').AsString;
             DM1.cdsQry18.FieldByName('MODULO').AsString     := DM1.cdsQry13.FieldByName('MODULO').AsString;
             DM1.cdsQry18.FieldByName('CNTDEBEMN').AsString  := DM1.cdsQry13.FieldByName('CNTDEBEMN').AsString;
             DM1.cdsQry18.Post;
             xCount := 0;
            end;
           DM1.cdsQry13.Next;
          end;
        end;

//******************************************************************************
//Para Generar el Número Correlativo de Comprobante según Compañía
       DM1.cdsQry22.First;
       While Not DM1.cdsQry22.EOF do
        begin
         xNroComprob := 2;
         DM1.cdsQry21.First;
         While Not DM1.cdsQry21.EOF do
          begin
           If DM1.cdsQry22.FieldByName('CIAID').AsString = DM1.cdsQry21.FieldByName('CIAID').AsString Then
            begin
             DM1.cdsQry21.Edit;
             DM1.cdsQry21.FieldByName('CNTCOMPROB').AsString := DM1.StrZero(IntToStr(xNroComprob + 1), 10);
             xNroComprob := xNroComprob + 1;
             DM1.cdsQry21.Post;
            end;
           DM1.cdsQry21.Next;
          end;
         DM1.cdsQry22.Next;
        end;

       DM1.cdsQry21.First;
       While Not DM1.cdsQry21.EOF do
        begin
         DM1.cdsQry18.First;
         While Not DM1.cdsQry18.EOF do
          begin
           If (DM1.cdsQry21.FieldByName('CIAID').AsString = DM1.cdsQry18.FieldByName('CIAID').AsString) And
              (DM1.cdsQry21.FieldByName('PVSLFECBE').AsString = DM1.cdsQry18.FieldByName('CNTFCOMP').AsString) Then
            begin
             DM1.cdsQry18.Edit;
             DM1.cdsQry18.FieldByName('CNTCOMPROB').AsString := DM1.cdsQry21.FieldByName('CNTCOMPROB').AsString;
             DM1.cdsQry18.Post;
            end;
           DM1.cdsQry18.Next;
          end;
         DM1.cdsQry21.Next;
        end;
//******************************************************************************


       dbgContabiliza.Selected.Clear;
       dbgContabiliza.Selected.Add('CIAID'#9'2'#9'Companía'#9'T');
       dbgContabiliza.Selected.Add('TDIARID'#9'2'#9'Tipo~Diario'#9'T');
       dbgContabiliza.Selected.Add('CNTCOMPROB'#9'11'#9'Número~Documento'#9'T');
       dbgContabiliza.Selected.Add('CNTFCOMP'#9'10'#9'Fecha~Documento'#9'T');
       dbgContabiliza.Selected.Add('CNTANO'#9'4'#9'Año'#9'T');
       dbgContabiliza.Selected.Add('CNTANOMM'#9'6'#9'Año-Mes'#9'T');
       dbgContabiliza.Selected.Add('CUENTAID'#9'10'#9'Id~Cuenta'#9'T');
       dbgContabiliza.Selected.Add('CNTDH'#9'3'#9'Debe(D)~Haber(H)'#9'T');
       dbgContabiliza.Selected.Add('CCOSID'#9'10'#9'Id. Centro~Costo'#9'T');
       dbgContabiliza.Selected.Add('CNTTCAMBIO'#9'10'#9'Tipo~Cambio'#9'T');
       dbgContabiliza.Selected.Add('CNTMTOLOC'#9'10'#9'Monto~(Soles)'#9'T');
       dbgContabiliza.Selected.Add('CNTMTOEXT'#9'10'#9'Monto~(Dólares)'#9'T');
       dbgContabiliza.Selected.Add('CNTDEBEMN'#9'14'#9'Monto Debe~(Soles)'#9'T');
       dbgContabiliza.Selected.Add('CNTDEBEME'#9'14'#9'Monto Debe~(Dólares)'#9'T');
       dbgContabiliza.Selected.Add('CNTHABEMN'#9'14'#9'Monto Haber~(Soles)'#9'T');
       dbgContabiliza.Selected.Add('CNTHABEME'#9'14'#9'Monto Haber~(Dólares)'#9'T');

       TNumericField(DM1.cdsQry18.FieldByName('CNTMTOLOC')).DisplayFormat := '###,###,##0.00';
       TNumericField(DM1.cdsQry18.FieldByName('CNTMTOLOC')).EditFormat    := '########0.00';
       TNumericField(DM1.cdsQry18.FieldByName('CNTMTOEXT')).DisplayFormat := '###,###,##0.00';
       TNumericField(DM1.cdsQry18.FieldByName('CNTMTOEXT')).EditFormat    := '########0.00';
       TNumericField(DM1.cdsQry18.FieldByName('CNTDEBEMN')).DisplayFormat := '###,###,##0.00';
       TNumericField(DM1.cdsQry18.FieldByName('CNTDEBEMN')).EditFormat    := '########0.00';
       TNumericField(DM1.cdsQry18.FieldByName('CNTDEBEME')).DisplayFormat := '###,###,##0.00';
       TNumericField(DM1.cdsQry18.FieldByName('CNTDEBEME')).EditFormat    := '########0.00';
       TNumericField(DM1.cdsQry18.FieldByName('CNTHABEMN')).DisplayFormat := '###,###,##0.00';
       TNumericField(DM1.cdsQry18.FieldByName('CNTHABEMN')).EditFormat    := '########0.00';
       TNumericField(DM1.cdsQry18.FieldByName('CNTHABEME')).DisplayFormat := '###,###,##0.00';
       TNumericField(DM1.cdsQry18.FieldByName('CNTHABEME')).EditFormat    := '########0.00';

       dbgContabiliza.ColumnByName('CNTDEBEMN').FooterValue := FloatToStrF(DM1.OperClientDataSet(DM1.cdsQry18, 'SUM(CNTDEBEMN)', ''), ffNumber, 15, 2);
       dbgContabiliza.ColumnByName('CNTDEBEME').FooterValue := FloatToStrF(DM1.OperClientDataSet(DM1.cdsQry18, 'SUM(CNTDEBEME)', ''), ffNumber, 15, 2);
       dbgContabiliza.ColumnByName('CNTHABEMN').FooterValue := FloatToStrF(DM1.OperClientDataSet(DM1.cdsQry18, 'SUM(CNTHABEMN)', ''), ffNumber, 15, 2);
       dbgContabiliza.ColumnByName('CNTHABEME').FooterValue := FloatToStrF(DM1.OperClientDataSet(DM1.cdsQry18, 'SUM(CNTHABEME)', ''), ffNumber, 15, 2);
       dbgContabiliza.ApplySelected;
       DM1.cdsQry18.IndexFieldNames := 'CIAID; CNTCOMPROB';
       DM1.cdsQry18.First;

       DM1.cdsQry18.EnableControls;

       If DM1.cdsQry18.RecordCount = 0 Then
        begin
         Beep;
         MessageDlg('No Existen Datos para el Año '+dbseAno.Text+' y Mes '+dbseMes.Text, mtInformation, [mbOk], 0);
         dbseAno.SetFocus;
         Exit;
        end
       Else
        begin
         Beep;
         MessageDlg('Datos Contabilizados para el Año '+dbseAno.Text+' y el Mes de '+DM1.NombreMes(dbseMes.Text), mtCustom, [mbOk], 0);
        end;
      end
    end;
   Screen.Cursor := crDefault;
end;

procedure TFContabilizacion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DM1.cdsQry3.Filter    := '';
   DM1.cdsQry3.Filtered  := False;
   DM1.cdsQry3.IndexFieldNames := '';
   DM1.cdsQry3.Close;
   DM1.cdsQry13.Filter   := '';
   DM1.cdsQry13.Filtered := False;
   DM1.cdsQry13.IndexFieldNames := '';
   DM1.cdsQry13.Close;
   DM1.cdsQry18.Filter   := '';
   DM1.cdsQry18.Filtered := False;
   DM1.cdsQry18.IndexFieldNames := '';
   DM1.cdsQry18.Close;
   DM1.cdsQry19.Filter   := '';
   DM1.cdsQry19.Filtered := False;
   DM1.cdsQry19.IndexFieldNames := '';
   DM1.cdsQry19.Close;
   DM1.cdsQry20.Filter   := '';
   DM1.cdsQry20.Filtered := False;
   DM1.cdsQry20.IndexFieldNames := '';
   DM1.cdsQry20.Close;
   DM1.cdsQry21.Filter   := '';
   DM1.cdsQry21.Filtered := False;
   DM1.cdsQry21.IndexFieldNames := '';
   DM1.cdsQry21.Close;
   DM1.cdsQry22.Filter   := '';
   DM1.cdsQry22.Filtered := False;
   DM1.cdsQry22.IndexFieldNames := '';
   DM1.cdsQry22.Close;
   DM1.cdsQry23.Filter   := '';
   DM1.cdsQry23.Filtered := False;
   DM1.cdsQry23.IndexFieldNames := '';
   DM1.cdsQry23.Close;
end;

procedure TFContabilizacion.bbtnGeneraAsientosClick(Sender: TObject);
var
   xSQL, xWhere, xCNTComprob : String;
   xNumComp : Integer;
begin
   If DM1.cdsQry18.RecordCount = 0 Then
    begin
     Beep;
     MessageDlg('No ha Realizado el Proceso de Contabilización para el Año '+dbseAno.Text+' y Mes '+dbseMes.Text+#13+'Debe Contabilizar Primero', mtInformation, [mbOk], 0);
     Exit;
    end;

   xWhere := 'CNTANOMM = '+QuotedStr(dbseAno.Text+dbseMes.Text);
   //Verifica si ya se generó el Asiento en el CNT300PRE
   If Length(DM1.DisplayDescrip('prvSQL', 'CNT300PRE', '*', xWhere, 'CNTANOMM')) > 0 Then
    begin
     Beep;
     MessageDlg('Ya se Generararon los Asientos para el Año '+dbseAno.Text+' y Mes '+dbseMes.Text, mtInformation, [mbOk], 0);
     If MessageDlg('Desea Generar Asientos Contables ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      begin
       Screen.Cursor := crHourGlass;
       xSQL := 'Delete From CNT300PRE Where CNTANOMM ='+QuotedStr(dbseAno.Text+dbseMes.Text);
       DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
       xSQL := 'Delete From CNT311PRE Where CNTANOMM ='+QuotedStr(dbseAno.Text+dbseMes.Text);
       DM1.DCOM1.AppServer.EjecutaSQL(xSQL);


       DM1.cdsQry18.DisableControls;
       //Genera Cabecera
       //Genera Detalle
       DM1.cdsQry18.First;
       While Not DM1.cdsQry18.EOF do
        begin
         xWhere := 'FECHA ='+QuotedStr(DM1.cdsQry18.FieldByName('CNTFCOMP').AsString);
         DM1.DisplayDescrip('prvSQL', 'TGE114', 'FECHA, FECANO, FECTRIM, FECSEM, FECSS, FECAATRI, FECAASEM, FECAASS', xWhere, 'FECHA');
         DM1.cdsQry23.Append;
         DM1.cdsQry23.FieldByName('CIAID').AsString      := DM1.cdsQry18.FieldByName('CIAID').AsString;
         DM1.cdsQry23.FieldByName('TDIARID').AsString    := DM1.cdsQry18.FieldByName('TDIARID').AsString;
         DM1.cdsQry23.FieldByName('CNTCOMPROB').AsString := DM1.cdsQry18.FieldByName('CNTCOMPROB').AsString;
         DM1.cdsQry23.FieldByName('CNTANO').AsString     := DM1.cdsQry18.FieldByName('CNTANO').AsString;
         DM1.cdsQry23.FieldByName('CNTANOMM').AsString   := DM1.cdsQry18.FieldByName('CNTANOMM').AsString;
         DM1.cdsQry23.FieldByName('CNTLOTE').AsString    := DM1.cdsQry18.FieldByName('CNTLOTE').AsString;
         DM1.cdsQry23.FieldByName('CUENTAID').AsString   := DM1.cdsQry18.FieldByName('CUENTAID').AsString;
         DM1.cdsQry23.FieldByName('DOCID').AsString      := '17';
         DM1.cdsQry23.FieldByName('CNTSERIE').AsString   := '000';//DM1.cdsQry18.FieldByName('CNTSERIE').AsString;
         If Length(DM1.cdsQry18.FieldByName('CNTNODOC').AsString) = 0 Then
          DM1.cdsQry23.FieldByName('CNTNODOC').AsString   := Copy(DM1.cdsQry18.FieldByName('CNTFCOMP').AsString, 7, 4)
                                                            +Copy(DM1.cdsQry18.FieldByName('CNTFCOMP').AsString, 4, 2)
                                                            +Copy(DM1.cdsQry18.FieldByName('CNTFCOMP').AsString, 1, 2)
         Else
          If Copy(DM1.cdsQry18.FieldByName('CNTNODOC').AsString, 1, 3) = 'Of.' Then
           DM1.cdsQry23.FieldByName('CNTNODOC').AsString := 'Of. '+Copy(DM1.cdsQry18.FieldByName('CNTNODOC').AsString, 8, 4)
          Else
           DM1.cdsQry23.FieldByName('CNTNODOC').AsString  := DM1.cdsQry18.FieldByName('CNTNODOC').AsString;
         If Length(DM1.cdsQry18.FieldByName('CNTGLOSA').AsString) = 0 Then
          DM1.cdsQry23.FieldByName('CNTGLOSA').AsString  := 'LIQUIDACION : '+DM1.cdsQry18.FIeldByName('CNTFCOMP').AsString
         Else
          DM1.cdsQry23.FieldByName('CNTGLOSA').AsString  := DM1.cdsQry18.FieldByName('CNTGLOSA').AsString;

         DM1.cdsQry23.FieldByName('CNTDH').AsString      := DM1.cdsQry18.FieldByName('CNTDH').AsString;
         DM1.cdsQry23.FieldByName('CCOSID').AsString     := DM1.cdsQry18.FieldByName('CCOSID').AsString;
         DM1.cdsQry23.FieldByName('CNTTCAMBIO').AsString := DM1.cdsQry18.FieldByName('CNTTCAMBIO').AsString;
         DM1.cdsQry23.FieldByName('CNTMTOORI').AsString  := DM1.cdsQry18.FieldByName('CNTMTOORI').AsString;
         DM1.cdsQry23.FieldByName('CNTMTOLOC').AsString  := DM1.cdsQry18.FieldByName('CNTMTOLOC').AsString;
         DM1.cdsQry23.FieldByName('CNTMTOEXT').AsString  := DM1.cdsQry18.FieldByName('CNTMTOEXT').AsString;
         DM1.cdsQry23.FieldByName('CNTFEMIS').AsString   := DM1.cdsQry18.FieldByName('CNTFCOMP').AsString;
         DM1.cdsQry23.FieldByName('CNTFVCMTO').AsString  := DM1.cdsQry18.FieldByName('CNTFCOMP').AsString;
         DM1.cdsQry23.FieldByName('CNTFCOMP').AsString   := DM1.cdsQry18.FieldByName('CNTFCOMP').AsString;
         DM1.cdsQry23.FieldByName('CNTESTADO').AsString  := DM1.cdsQry18.FieldByName('CNTESTADO').AsString;
         DM1.cdsQry23.FieldByName('CNTCUADRE').AsString  := 'N';
         DM1.cdsQry23.FieldByName('CNTFAUTOM').AsString  := DM1.cdsQry18.FieldByName('CNTFAUTOM').AsString;
         DM1.cdsQry23.FieldByName('CNTUSER').AsString    := DM1.wUsuario;
         DM1.cdsQry23.FieldByName('CNTFREG').AsString    := DM1.cdsQry18.FieldByName('CNTFREG').AsString;
         DM1.cdsQry23.FieldByName('CNTHREG').AsString    := DM1.cdsQry18.FieldByName('CNTHREG').AsString;
         DM1.cdsQry23.FieldByName('CNTMM').AsString      := DM1.cdsQry18.FieldByName('CNTMM').AsString;
         DM1.cdsQry23.FieldByName('CNTDD').AsString      := Copy(DM1.cdsQry18.FieldByName('CNTFCOMP').AsString, 1, 2);
         DM1.cdsQry23.FieldByName('CNTTRI').AsString     := DM1.cdsQry.FieldByName('FECTRIM').AsString;
         DM1.cdsQry23.FieldByName('CNTSEM').AsString     := DM1.cdsQry.FieldByName('FECSEM').AsString;
         DM1.cdsQry23.FieldByName('CNTSS').AsString      := DM1.cdsQry.FieldByName('FECSS').AsString;
         DM1.cdsQry23.FieldByName('CNTAATRI').AsString   := DM1.cdsQry.FieldByName('FECAATRI').AsString;
         DM1.cdsQry23.FieldByName('CNTAASEM').AsString   := DM1.cdsQry.FieldByName('FECAASEM').AsString;
         DM1.cdsQry23.FieldByName('CNTAASS').AsString    := DM1.cdsQry.FieldByName('FECAASS').AsString;
         DM1.cdsQry23.FieldByName('TMONID').AsString     := DM1.cdsQry18.FieldByName('TMONID').AsString;
         DM1.cdsQry23.FieldByName('FLAGVAR').AsString    := DM1.cdsQry18.FieldByName('FLAGVAR').AsString;
         DM1.cdsQry23.FieldByName('TDIARDES').AsString   := DM1.cdsQry18.FieldByName('TDIARDES').AsString;
         DM1.cdsQry23.FieldByName('DOCDES').AsString     := 'LIQUIDAC';
         DM1.cdsQry23.FieldByName('CNTDEBEMN').AsString  := DM1.cdsQry18.FieldByName('CNTDEBEMN').AsString;
         DM1.cdsQry23.FieldByName('CNTDEBEME').AsString  := DM1.cdsQry18.FieldByName('CNTDEBEME').AsString;
         DM1.cdsQry23.FieldByName('CNTHABEMN').AsString  := DM1.cdsQry18.FieldByName('CNTHABEMN').AsString;
         DM1.cdsQry23.FieldByName('CNTHABEME').AsString  := DM1.cdsQry18.FieldByName('CNTHABEME').AsString;
         DM1.cdsQry23.FieldByName('CNTSALDMN').AsString  := DM1.cdsQry18.FieldByName('CNTSALDMN').AsString;
         DM1.cdsQry23.FieldByName('CNTSALDME').AsString  := DM1.cdsQry18.FieldByName('CNTSALDME').AsString;
         DM1.cdsQry23.FieldByName('CNTTS').AsString      := 'OV';
         DM1.cdsQry23.FieldByName('CNTMODDOC').AsString  := DM1.cdsQry18.FieldByName('CNTMODDOC').AsString;
         DM1.cdsQry23.FieldByName('MODULO').AsString     := DM1.wModulo;
         DM1.AplicaDatos(DM1.cdsQry23, 'ASIENTOS');
         DM1.cdsQry18.Next;
        end;

       xSQL := 'INSERT INTO CNT300PRE ( CIAID, TDIARID, CNTANOMM, CNTCOMPROB, CNTLOTE, CNTGLOSA,'
              +' CNTTCAMBIO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTUSER, CNTFREG, CNTHREG, CNTANO,'
              +' CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID,'
              +' FLAGVAR, TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME,'
              +' CNTTS, DOCMOD, MODULO )'
              +' SELECT A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB,  A.CNTLOTE,'
              +' ''LIQUIDACION ''||A.CNTFCOMP CNTGLOSA,'
              +' MAX( NVL(A.CNTTCAMBIO, 0 )), A.CNTFCOMP, ''I'', ''N'', MAX(CNTUSER), MAX( CNTFREG ),'
              +' MAX( CNTHREG ), A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI, A.CNTSEM, A.CNTSS,'
              +' A.CNTAATRI, A.CNTAASEM, A.CNTAASS,'
              +' ''N'' TMONID, '' '', A.TDIARDES,'
              +' SUM(A.CNTDEBEMN), SUM(A.CNTDEBEME), SUM(A.CNTHABEMN), SUM(A.CNTHABEME),'
              +' MAX( CNTTS ), MAX( CNTMODDOC), MAX( MODULO )'
              +' FROM CNT311PRE A'
              +' WHERE A.TDIARID ='+QuotedStr(dblcTipo.Text)
              +' AND A.CNTANOMM ='+QuotedStr(dbseAno.Text+dbseMes.Text)
              +' GROUP BY A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, A.CNTLOTE, A.CNTFCOMP, A.CNTANO,'
              +' A.CNTMM, A.CNTDD, A.CNTTRI,  A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS,'
              +' A.TDIARDES';

       DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
       Screen.Cursor := crDefault;
      end;
    end
   Else
    begin
     If MessageDlg('Desea Generar Asientos Contables ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      begin
       Screen.Cursor := crHourGlass;
       DM1.cdsQry18.DisableControls;
       //Genera Cabecera
       //Genera Detalle
       DM1.cdsQry18.First;
       While Not DM1.cdsQry18.EOF do
        begin
         xWhere := 'FECHA ='+QuotedStr(DM1.cdsQry18.FieldByName('CNTFCOMP').AsString);
         DM1.DisplayDescrip('prvSQL', 'TGE114', 'FECHA, FECANO, FECTRIM, FECSEM, FECSS, FECAATRI, FECAASEM, FECAASS', xWhere, 'FECHA');
         DM1.cdsQry23.Append;
         DM1.cdsQry23.FieldByName('CIAID').AsString      := DM1.cdsQry18.FieldByName('CIAID').AsString;
         DM1.cdsQry23.FieldByName('TDIARID').AsString    := DM1.cdsQry18.FieldByName('TDIARID').AsString;
         DM1.cdsQry23.FieldByName('CNTCOMPROB').AsString := DM1.cdsQry18.FieldByName('CNTCOMPROB').AsString;
         DM1.cdsQry23.FieldByName('CNTANO').AsString     := DM1.cdsQry18.FieldByName('CNTANO').AsString;
         DM1.cdsQry23.FieldByName('CNTANOMM').AsString   := DM1.cdsQry18.FieldByName('CNTANOMM').AsString;
         DM1.cdsQry23.FieldByName('CNTLOTE').AsString    := DM1.cdsQry18.FieldByName('CNTLOTE').AsString;
         DM1.cdsQry23.FieldByName('CUENTAID').AsString   := DM1.cdsQry18.FieldByName('CUENTAID').AsString;
         DM1.cdsQry23.FieldByName('DOCID').AsString      := '17';
         DM1.cdsQry23.FieldByName('CNTSERIE').AsString   := '000';//DM1.cdsQry18.FieldByName('CNTSERIE').AsString;
         If Length(DM1.cdsQry18.FieldByName('CNTNODOC').AsString) = 0 Then
          DM1.cdsQry23.FieldByName('CNTNODOC').AsString   := Copy(DM1.cdsQry18.FieldByName('CNTFCOMP').AsString, 7, 4)
                                                            +Copy(DM1.cdsQry18.FieldByName('CNTFCOMP').AsString, 4, 2)
                                                            +Copy(DM1.cdsQry18.FieldByName('CNTFCOMP').AsString, 1, 2)
         Else
          If Copy(DM1.cdsQry18.FieldByName('CNTNODOC').AsString, 1, 3) = 'Of.' Then
           DM1.cdsQry23.FieldByName('CNTNODOC').AsString := 'Of. '+Copy(DM1.cdsQry18.FieldByName('CNTNODOC').AsString, 8, 4)
          Else
           DM1.cdsQry23.FieldByName('CNTNODOC').AsString  := DM1.cdsQry18.FieldByName('CNTNODOC').AsString;
         If Length(DM1.cdsQry18.FieldByName('CNTGLOSA').AsString) = 0 Then
          DM1.cdsQry23.FieldByName('CNTGLOSA').AsString  := 'LIQUIDACION : '+DM1.cdsQry18.FIeldByName('CNTFCOMP').AsString
         Else
          DM1.cdsQry23.FieldByName('CNTGLOSA').AsString  := DM1.cdsQry18.FieldByName('CNTGLOSA').AsString;
         DM1.cdsQry23.FieldByName('CNTDH').AsString      := DM1.cdsQry18.FieldByName('CNTDH').AsString;
         DM1.cdsQry23.FieldByName('CCOSID').AsString     := DM1.cdsQry18.FieldByName('CCOSID').AsString;
         DM1.cdsQry23.FieldByName('CNTTCAMBIO').AsString := DM1.cdsQry18.FieldByName('CNTTCAMBIO').AsString;
         DM1.cdsQry23.FieldByName('CNTMTOORI').AsString  := DM1.cdsQry18.FieldByName('CNTMTOORI').AsString;
         DM1.cdsQry23.FieldByName('CNTMTOLOC').AsString  := DM1.cdsQry18.FieldByName('CNTMTOLOC').AsString;
         DM1.cdsQry23.FieldByName('CNTMTOEXT').AsString  := DM1.cdsQry18.FieldByName('CNTMTOEXT').AsString;
         DM1.cdsQry23.FieldByName('CNTFEMIS').AsString   := DM1.cdsQry18.FieldByName('CNTFCOMP').AsString;
         DM1.cdsQry23.FieldByName('CNTFVCMTO').AsString  := DM1.cdsQry18.FieldByName('CNTFCOMP').AsString;
         DM1.cdsQry23.FieldByName('CNTFCOMP').AsString   := DM1.cdsQry18.FieldByName('CNTFCOMP').AsString;
         DM1.cdsQry23.FieldByName('CNTESTADO').AsString  := DM1.cdsQry18.FieldByName('CNTESTADO').AsString;
         DM1.cdsQry23.FieldByName('CNTCUADRE').AsString  := 'N';
         DM1.cdsQry23.FieldByName('CNTFAUTOM').AsString  := DM1.cdsQry18.FieldByName('CNTFAUTOM').AsString;
         DM1.cdsQry23.FieldByName('CNTUSER').AsString    := DM1.wUsuario;
         DM1.cdsQry23.FieldByName('CNTFREG').AsString    := DM1.cdsQry18.FieldByName('CNTFREG').AsString;
         DM1.cdsQry23.FieldByName('CNTHREG').AsString    := DM1.cdsQry18.FieldByName('CNTHREG').AsString;
         DM1.cdsQry23.FieldByName('CNTMM').AsString      := DM1.cdsQry18.FieldByName('CNTMM').AsString;
         DM1.cdsQry23.FieldByName('CNTDD').AsString      := Copy(DM1.cdsQry18.FieldByName('CNTFCOMP').AsString, 1, 2);
         DM1.cdsQry23.FieldByName('CNTTRI').AsString     := DM1.cdsQry.FieldByName('FECTRIM').AsString;
         DM1.cdsQry23.FieldByName('CNTSEM').AsString     := DM1.cdsQry.FieldByName('FECSEM').AsString;
         DM1.cdsQry23.FieldByName('CNTSS').AsString      := DM1.cdsQry.FieldByName('FECSS').AsString;
         DM1.cdsQry23.FieldByName('CNTAATRI').AsString   := DM1.cdsQry.FieldByName('FECAATRI').AsString;
         DM1.cdsQry23.FieldByName('CNTAASEM').AsString   := DM1.cdsQry.FieldByName('FECAASEM').AsString;
         DM1.cdsQry23.FieldByName('CNTAASS').AsString    := DM1.cdsQry.FieldByName('FECAASS').AsString;
         DM1.cdsQry23.FieldByName('TMONID').AsString     := DM1.cdsQry18.FieldByName('TMONID').AsString;
         DM1.cdsQry23.FieldByName('FLAGVAR').AsString    := DM1.cdsQry18.FieldByName('FLAGVAR').AsString;
  //       DM1.cdsQry23.FieldByName('FCONS').AsString      := DM1.cdsQry18.FieldByName('FCONS').AsString;
  //       DM1.cdsQry23.FieldByName('CNTFMEC').AsString    := DM1.cdsQry18.FieldByName('CNTFMEC').AsString;
         DM1.cdsQry23.FieldByName('TDIARDES').AsString   := DM1.cdsQry18.FieldByName('TDIARDES').AsString;
  //       DM1.cdsQry23.FieldByName('CTADES').AsString     := DM1.cdsQry18.FieldByName('CTADES').AsString;
  //       DM1.cdsQry23.FieldByName('AUXDES').AsString     := DM1.cdsQry18.FieldByName('AUXDES').AsString;
         DM1.cdsQry23.FieldByName('DOCDES').AsString     := 'LIQUIDAC';
  //       DM1.cdsQry23.FieldByName('CCOSDES').AsString    := DM1.cdsQry18.FieldByName('CCOSDES').AsString;
         DM1.cdsQry23.FieldByName('CNTDEBEMN').AsString  := DM1.cdsQry18.FieldByName('CNTDEBEMN').AsString;
         DM1.cdsQry23.FieldByName('CNTDEBEME').AsString  := DM1.cdsQry18.FieldByName('CNTDEBEME').AsString;
         DM1.cdsQry23.FieldByName('CNTHABEMN').AsString  := DM1.cdsQry18.FieldByName('CNTHABEMN').AsString;
         DM1.cdsQry23.FieldByName('CNTHABEME').AsString  := DM1.cdsQry18.FieldByName('CNTHABEME').AsString;
         DM1.cdsQry23.FieldByName('CNTSALDMN').AsString  := DM1.cdsQry18.FieldByName('CNTSALDMN').AsString;
         DM1.cdsQry23.FieldByName('CNTSALDME').AsString  := DM1.cdsQry18.FieldByName('CNTSALDME').AsString;
  //       DM1.cdsQry23.FieldByName('CAMPOVAR').AsString   := DM1.cdsQry18.FieldByName('CAMPOVAR').AsString;
         DM1.cdsQry23.FieldByName('CNTTS').AsString      := 'OV';
  //       DM1.cdsQry23.FieldByName('CNTPAGADO').AsString  := DM1.cdsQry18.FieldByName('CNTPAGADO').AsString;
         DM1.cdsQry23.FieldByName('CNTMODDOC').AsString  := DM1.cdsQry18.FieldByName('CNTMODDOC').AsString;
  //       DM1.cdsQry23.FieldByName('CNTREG').AsString     := DM1.cdsQry18.FieldByName('CNTREG').AsString;
         DM1.cdsQry23.FieldByName('MODULO').AsString     := DM1.wModulo;
  //       DM1.cdsQry23.FieldByName('CTA_SECU').AsString   := DM1.cdsQry18.FieldByName('CTA_SECU').AsString;
         DM1.AplicaDatos(DM1.cdsQry23, 'ASIENTOS');
         DM1.cdsQry18.Next;
        end;

// Numeración de Item por cada Comprobante Generado
       xSQL := 'Select CIAID, CNTCOMPROB, CNTREG, CNTDH, CUENTAID, CCOSID'
              +' From CNT311PRE'
              +' Where TDIARID ='+QuotedStr(dblcTipo.Text)
              +' And CNTANOMM ='+QuotedStr(dbseAno.Text+dbseMes.Text);

       DM1.cdsQry3.Close;
       DM1.cdsQry3.Filter   := '';
       DM1.cdsQry3.Filtered := False;
       DM1.cdsQry3.IndexFieldNames := '';
       DM1.cdsQry3.DataRequest(xSQL);
       DM1.cdsQry3.Open;
       DM1.cdsQry3.IndexFieldNames := 'CIAID; CNTCOMPROB; CNTDH; CUENTAID; CCOSID';

       DM1.cdsQry3.First;
       While not DM1.cdsQry3.EOF do
        begin
         xCNTComprob := DM1.cdsQry3.FieldByName('CNTCOMPROB').AsString;
         xNumComp := 1;
         While (not DM1.cdsQry3.EOF) and (DM1.cdsQry3.FieldByName('CNTCOMPROB').AsString = xCNTComprob) do
          begin
           DM1.cdsQry3.Edit;
           DM1.cdsQry3.FieldByName('CNTREG').AsInteger := xNumComp;
           DM1.cdsQry3.Post;
           If DM1.cdsQry3.ApplyUpdates(0)>0 Then
            begin
             xSQL := 'Update CNT311PRE'
                    +' Set CNTREG ='+IntToStr(xNumComp)
                    +' Where TDIARID ='+QuotedStr(dblcTipo.Text)
                    +' And CNTANOMM ='+QuotedStr(dbseAno.Text+dbseMes.Text)
                    +' And CNTCOMPROB ='+QuotedStr(xCNTComprob)
                    +' And CNTDH ='+QuotedStr(DM1.cdsQry3.FieldByName('CNTDH').AsString)
                    +' And CUENTAID ='+QuotedStr(DM1.cdsQry3.FieldByName('CUENTAID').AsString)
                    +' And NVL(CCOSID,''XX'')='+QuotedStr(DM1.cdsQry3.FieldByName('CCOSID').AsString);
             DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
            end;
           xNumComp := xNumComp+1;
           DM1.cdsQry3.Next;
          end;
        end;

       xSQL := 'INSERT INTO CNT300PRE ( CIAID, TDIARID, CNTANOMM, CNTCOMPROB, CNTLOTE, CNTGLOSA,'
              +' CNTTCAMBIO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTUSER, CNTFREG, CNTHREG, CNTANO,'
              +' CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID,'
              +' FLAGVAR, TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME,'
              +' CNTTS, DOCMOD, MODULO )'
              +' SELECT A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, A.CNTLOTE,'
              +' ''LIQUIDACION ''||A.CNTFCOMP CNTGLOSA,'
//              +' MAX( CASE WHEN A.CNTREG = 1 THEN A.CNTGLOSA END ) CNTGLOSA,'
              +' MAX( NVL(A.CNTTCAMBIO, 0 )), A.CNTFCOMP, ''I'', ''N'', MAX(CNTUSER), MAX( CNTFREG ),'
              +' MAX( CNTHREG ), A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI, A.CNTSEM, A.CNTSS,'
              +' A.CNTAATRI, A.CNTAASEM, A.CNTAASS,'
              +' ''N'' TMONID, '' '', A.TDIARDES,'
              +' SUM(A.CNTDEBEMN), SUM(A.CNTDEBEME), SUM(A.CNTHABEMN), SUM(A.CNTHABEME),'
              +' MAX( CNTTS ), MAX( CNTMODDOC), MAX( MODULO )'
              +' FROM CNT311PRE A'
              +' WHERE A.TDIARID ='+QuotedStr(dblcTipo.Text)
              +' AND A.CNTANOMM ='+QuotedStr(dbseAno.Text+dbseMes.Text)
              +' GROUP BY A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, A.CNTLOTE, A.CNTFCOMP, A.CNTANO,'
              +' A.CNTMM, A.CNTDD, A.CNTTRI,  A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS,'
              +' A.TDIARDES';

       DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
      end;
    end;


      xSQL := 'INSERT INTO CNT311 SELECT * FROM CNT311PRE WHERE TDIARID = ''27'' '
       +' AND CNTANOMM = '+QuotedStr(dbseAno.Text+dbseMes.Text);
       DM1.DCOM1.AppServer.EjecutaSQL(xSQL);

       xSQL := 'INSERT INTO CNT300 SELECT * FROM CNT300PRE WHERE TDIARID = ''27'' '
       +' AND CNTANOMM = '+QuotedStr(dbseAno.Text+dbseMes.Text);
       DM1.DCOM1.AppServer.EjecutaSQL(xSQL);



   DM1.cdsQry18.EnableControls;
   Beep;
   MessageDlg('Asientos Contables Generados', mtCustom, [mbOk], 0);
   Screen.Cursor := crDefault;
end;




procedure TFContabilizacion.dblcTipoExit(Sender: TObject);
var
   xWhere : String;
begin
   xWhere := 'TDIARID ='+QuotedStr(dblcTipo.Text);
   dbeTipo.Text := DM1.DisplayDescrip('prvQSL', 'TGE104', 'TDIARDES', xWhere, 'TDIARDES');
end;

procedure TFContabilizacion.dbseMesExit(Sender: TObject);
var
   xSQL : String;
begin
   dbseMes.Text := DM1.StrZero(dbseMes.Text, 2);
   If ((StrToInt(dbseMes.Text) = 0) Or (StrToInt(dbseMes.Text) > 12)) Then
    begin
     Beep;
     MessageDlg('El Mes debe estar entre 1 y 12', mtInformation, [mbOk], 0);
     dbseMes.Text := '1';
     dbseMesExit(Sender);
     Exit;
    end
   Else
    begin
     xSQL := 'Select CASE WHEN '+QuotedStr(dbseMes.Text)+' In ( ''01'',''03'',''05'',''07'',''08'',''10'',''12'' )'
            +' THEN ''31/''||'+QuotedStr(dbseMes.Text)+'||''/''||'+QuotedStr(dbseAno.Text)
            +' ELSE CASE WHEN '+QuotedStr(dbseMes.Text)+' In ( ''04'',''06'',''09'',''11'' )'
            +' THEN ''30/''||'+QuotedStr(dbseMes.Text)+'||''/''||'+QuotedStr(dbseAno.Text)
            +' ELSE ''28/''||'+QuotedStr(dbseMes.Text)+'||''/''||'+QuotedStr(dbseAno.Text)+' END END FECHA From DUAL';

     DM1.cdsQry3.Filter   := '';
     DM1.cdsQry3.Filtered := False;
     DM1.cdsQry3.IndexFieldNames := '';
     DM1.cdsQry3.Close;
     DM1.cdsQry3.DataRequest(xSQL);
     DM1.cdsQry3.Open;

     dbdtpFecMov.Date := StrToDate(DM1.cdsQry3.FieldByName('FECHA').AsString);
     xFechaInicial := '01/'+dbseMes.Text+'/'+dbseAno.Text;     
     xFechaFinal   := DM1.cdsQry3.FieldByName('FECHA').AsString;
    end;
end;

procedure TFContabilizacion.dbseAnoExit(Sender: TObject);
var
   xSQL : String;
begin
   If Length(dbseAno.Text) < 4 Then
    begin
     Beep;
     MessageDlg('El Año debe tener 4 dígitos', mtInformation, [mbOk], 0);
     dbseAno.SetFocus;
     Exit;
    end
   Else
    begin
     xSQL := 'Select CASE WHEN '+QuotedStr(dbseMes.Text)+' In ( ''01'',''03'',''05'',''07'',''08'',''10'',''12'' )'
            +' THEN ''31/''||'+QuotedStr(dbseMes.Text)+'||''/''||'+QuotedStr(dbseAno.Text)
            +' ELSE CASE WHEN '+QuotedStr(dbseMes.Text)+' In ( ''04'',''06'',''09'',''11'' )'
            +' THEN ''30/''||'+QuotedStr(dbseMes.Text)+'||''/''||'+QuotedStr(dbseAno.Text)
            +' ELSE ''28/''||'+QuotedStr(dbseMes.Text)+'||''/''||'+QuotedStr(dbseAno.Text)+' END END FECHA From DUAL';

     DM1.cdsQry3.Filter   := '';
     DM1.cdsQry3.Filtered := False;
     DM1.cdsQry3.IndexFieldNames := '';
     DM1.cdsQry3.Close;
     DM1.cdsQry3.DataRequest(xSQL);
     DM1.cdsQry3.Open;

     dbdtpFecMov.Date := StrToDate(DM1.cdsQry3.FieldByName('FECHA').AsString);

    // xFechaInicial := '08/08/2003';
    // xFechaFinal   := '08/08/2003';

     xFechaInicial := '01/'+dbseMes.Text+'/'+dbseAno.Text;
     xFechaFinal   := DM1.cdsQry3.FieldByName('FECHA').AsString;
    end;
end;

procedure TFContabilizacion.FormCreate(Sender: TObject);
var
  xSQL : String;
begin
   Screen.Cursor := crHourGlass;
   Present := Date;
   xSQL := 'Select To_Char(To_Date('+QuotedStr(DateToStr(Present))+'), ''YYYY'') ANO,'
          +' To_Char(To_Date('+QuotedStr(DateToStr(Present))+'), ''MM'') MES From DUAL';

   DM1.cdsQry2.Filter   := '';
   DM1.cdsQry2.Filtered := False;
   DM1.cdsQry2.IndexFieldNames := '';
   DM1.cdsQry2.Close;
   DM1.cdsQry2.DataRequest(xSQL);
   DM1.cdsQry2.Open;

   dbseAno.Text := DM1.cdsQry2.FieldByName('ANO').AsString;
   dbseMes.Text := DM1.cdsQry2.FieldByName('MES').AsString;

   xSQL := 'Select CASE WHEN '+QuotedStr(dbseMes.Text)+' In ( ''01'',''03'',''05'',''07'',''08'',''10'',''12'' )'
          +' THEN ''31/''||'+QuotedStr(dbseMes.Text)+'||''/''||'+QuotedStr(dbseAno.Text)
          +' ELSE CASE WHEN '+QuotedStr(dbseMes.Text)+' In ( ''04'',''06'',''09'',''11'' )'
          +' THEN ''30/''||'+QuotedStr(dbseMes.Text)+'||''/''||'+QuotedStr(dbseAno.Text)
          +' ELSE ''28/''||'+QuotedStr(dbseMes.Text)+'||''/''||'+QuotedStr(dbseAno.Text)+' END END FECHA From DUAL';

   DM1.cdsQry3.Filter   := '';
   DM1.cdsQry3.Filtered := False;
   DM1.cdsQry3.IndexFieldNames := '';
   DM1.cdsQry3.Close;
   DM1.cdsQry3.DataRequest(xSQL);
   DM1.cdsQry3.Open;

   dbdtpFecMov.Date := StrToDate(DM1.cdsQry3.FieldByName('FECHA').AsString);
   xFechaInicial := '01/'+dbseMes.Text+'/'+dbseAno.Text;
   xFechaFinal   := DM1.cdsQry3.FieldByName('FECHA').AsString;

   dblcTipo.Text := '27';
   dblcTipoExit(Sender);

   xSQL := 'Select '''' TDIARID, '''' CNTCOMPROB, '''' CNTANO,'
          +' '''' CNTANOMM, '''' CUENTAID, '''' CNTDH, '''' CCOSID,'
          +' 0 CNTCAMBIO, 0 CNTMTOLOC, 0 CNTMTOEXT, 0 CNTDEBEMN, 0 CNTDEBEME,'
          +' 0 CNTHABEMN, 0 CNTHABEME From TGE901';

   DM1.cdsQry18.Filter   := '';
   DM1.cdsQry18.Filtered := False;
   DM1.cdsQry18.IndexFieldNames := '';
   DM1.cdsQry18.Close;
   DM1.cdsQry18.DataRequest(xSQL);
   DM1.cdsQry18.Open;
   DM1.cdsQry18.Delete;

   xSQL := 'Select * From CNT311PRE'
          +' Where CNTCOMPROB ='+QuotedStr('XXX');

   DM1.cdsQry23.Filter   := '';
   DM1.cdsQry23.Filtered := False;
   DM1.cdsQry23.IndexFieldNames := '';
   DM1.cdsQry23.Close;
   DM1.cdsQry23.DataRequest(xSQL);
   DM1.cdsQry23.Open;

   dbgContabiliza.Selected.Clear;
   dbgContabiliza.Selected.Add('CIAID'#9'2'#9'Companía'#9'T');   
   dbgContabiliza.Selected.Add('TDIARID'#9'2'#9'Tipo~Diario'#9'T');
   dbgContabiliza.Selected.Add('CNTCOMPROB'#9'11'#9'Número~Documento'#9'T');
   dbgContabiliza.Selected.Add('CNTFCOMP'#9'10'#9'Fecha~Documento'#9'T');   
   dbgContabiliza.Selected.Add('CNTANO'#9'4'#9'Año'#9'T');
   dbgContabiliza.Selected.Add('CNTANOMM'#9'6'#9'Año-Mes'#9'T');
   dbgContabiliza.Selected.Add('CUENTAID'#9'10'#9'Id~Cuenta'#9'T');
   dbgContabiliza.Selected.Add('CNTDH'#9'3'#9'Debe(D)~Haber(H)'#9'T');
   dbgContabiliza.Selected.Add('CCOSID'#9'10'#9'Id. Centro~Costo'#9'T');
   dbgContabiliza.Selected.Add('CNTTCAMBIO'#9'10'#9'Tipo~Cambio'#9'T');
   dbgContabiliza.Selected.Add('CNTMTOLOC'#9'10'#9'Monto~(Soles)'#9'T');
   dbgContabiliza.Selected.Add('CNTMTOEXT'#9'10'#9'Monto~(Dólares)'#9'T');
   dbgContabiliza.Selected.Add('CNTDEBEMN'#9'14'#9'Monto Debe~(Soles)'#9'T');
   dbgContabiliza.Selected.Add('CNTDEBEME'#9'14'#9'Monto Debe~(Dólares)'#9'T');
   dbgContabiliza.Selected.Add('CNTHABEMN'#9'14'#9'Monto Haber~(Soles)'#9'T');
   dbgContabiliza.Selected.Add('CNTHABEME'#9'14'#9'Monto Haber~(Dólares)'#9'T');
   dbgContabiliza.ApplySelected;

   TNumericField(DM1.cdsQry18.FieldByName('CNTMTOLOC')).DisplayFormat := '###,###,##0.00';
   TNumericField(DM1.cdsQry18.FieldByName('CNTMTOLOC')).EditFormat    := '########0.00';
   TNumericField(DM1.cdsQry18.FieldByName('CNTMTOEXT')).DisplayFormat := '###,###,##0.00';
   TNumericField(DM1.cdsQry18.FieldByName('CNTMTOEXT')).EditFormat    := '########0.00';
   TNumericField(DM1.cdsQry18.FieldByName('CNTDEBEMN')).DisplayFormat := '###,###,##0.00';
   TNumericField(DM1.cdsQry18.FieldByName('CNTDEBEMN')).EditFormat    := '########0.00';
   TNumericField(DM1.cdsQry18.FieldByName('CNTDEBEME')).DisplayFormat := '###,###,##0.00';
   TNumericField(DM1.cdsQry18.FieldByName('CNTDEBEME')).EditFormat    := '########0.00';
   TNumericField(DM1.cdsQry18.FieldByName('CNTHABEMN')).DisplayFormat := '###,###,##0.00';
   TNumericField(DM1.cdsQry18.FieldByName('CNTHABEMN')).EditFormat    := '########0.00';
   TNumericField(DM1.cdsQry18.FieldByName('CNTHABEME')).DisplayFormat := '###,###,##0.00';
   TNumericField(DM1.cdsQry18.FieldByName('CNTHABEME')).EditFormat    := '########0.00';

   dbgContabiliza.ColumnByName('CNTDEBEMN').FooterValue := FloatToStrF(DM1.OperClientDataSet(DM1.cdsQry18, 'SUM(CNTDEBEMN)', ''), ffNumber, 15, 2);
   dbgContabiliza.ColumnByName('CNTDEBEME').FooterValue := FloatToStrF(DM1.OperClientDataSet(DM1.cdsQry18, 'SUM(CNTDEBEME)', ''), ffNumber, 15, 2);
   dbgContabiliza.ColumnByName('CNTHABEMN').FooterValue := FloatToStrF(DM1.OperClientDataSet(DM1.cdsQry18, 'SUM(CNTHABEMN)', ''), ffNumber, 15, 2);
   dbgContabiliza.ColumnByName('CNTHABEME').FooterValue := FloatToStrF(DM1.OperClientDataSet(DM1.cdsQry18, 'SUM(CNTHABEME)', ''), ffNumber, 15, 2);
  
   Screen.Cursor := crDefault;
end;

procedure TFContabilizacion.FormKeyPress(Sender: TObject; var Key: Char);
begin
   If Key = #13 Then
    begin
     Key := #0;
     Perform(CM_DialogKey, VK_TAB, 0);
    end;
end;

procedure TFContabilizacion.dblcTipoNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

end.


