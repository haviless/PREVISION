unit PRE925;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TXComp, ppCache, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppClass,
  ppReport, fcButton, fcImgBtn, fcShapeBtn, StdCtrls, wwdbdatetimepicker,
  ppTypes, ExtCtrls, ppViewr, ppVar, ppPrnabl, ppCtrls, ppBands;

type
  TFToolRepComprobantes = class(TForm)
    pnlRepComprobantes: TPanel;
    gbPeriodo: TGroupBox;
    Label3: TLabel;
    dbdtpDesde: TwwDBDateTimePicker;
    bbtnImprimir: TfcShapeBtn;
    bbtnRepBenRec: TfcShapeBtn;
    ppRepComprobantes: TppReport;
    ppdbRepComprobantes: TppDBPipeline;
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
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    pplblFecha: TppLabel;
    pplblPeriodo: TppLabel;
    pplblTCambio: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    pplblTDiario: TppLabel;
    pplblComprobante: TppLabel;
    pplblGlosa: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    pplblLote: TppLabel;
    pplblMoneda: TppLabel;
    pplblEstado: TppLabel;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppDBText1: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLabel31: TppLabel;
    ppLabel37: TppLabel;
    ppDBText4: TppDBText;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ExtraOptions1: TExtraOptions;
    procedure FormCreate(Sender: TObject);
    procedure bbtnRepBenRecClick(Sender: TObject);
    procedure ppRepComprobantesPreviewFormCreate(Sender: TObject);
    procedure bbtnImprimirClick(Sender: TObject);
    procedure ppHeaderBand1BeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FToolRepComprobantes: TFToolRepComprobantes;

implementation

uses PRE001, PREDM;

{$R *.DFM}

procedure TFToolRepComprobantes.FormCreate(Sender: TObject);
var
   Present : TDate;
begin
   Present := Date;
   dbdtpDesde.Date := Present;
//   dbdtpHasta.Date := Present;
end;

procedure TFToolRepComprobantes.bbtnRepBenRecClick(Sender: TObject);
var
   xSQL, xWhere, xTipoCambio : String;
begin
   If Length(dbdtpDesde.Text) = 0 Then
    begin
     Beep;
     MessageDlg('Ingrese la Fecha Inicial para Visualizar', mtInformation, [mbOk], 0);
     dbdtpDesde.SetFocus;
     Exit;
    end;

   xWhere := 'CNTANOMM = '+QuotedStr(Copy(dbdtpDesde.Text, 7, 4)+Copy(dbdtpDesde.Text, 4, 2))
            +' And TDIARID = '+QuotedStr('27');

   xTipoCambio := DM1.DisplayDescrip('prvSQL', 'CNT300PRE', 'MAX(CNTTCAMBIO) CNTTCAMBIO', xWhere, 'CNTTCAMBIO');

   If Length(xTipoCambio) = 0 Then
    begin
     Beep;
     MessageDlg('No Existen Datos para Visualizar', mtInformation, [mbOk], 0);
     dbdtpDesde.SetFocus;
     Exit;
    end;

{   If Length(dbdtpHasta.Text) = 0 Then
    begin
     Beep;
     MessageDlg('Ingrese la Fecha Final para Visualizar', mtinformation, [mbOk], 0);
     dbdtpHasta.SetFocus;
     Exit;
    end;

   If (dbdtpDesde.DateTime) > (dbdtpHasta.DateTime) Then
    begin
     Beep;
     MessageDlg('La Fecha de Inicio es Mayor a la Fecha de Fin', mtInformation, [mbOk], 0);
     dbdtpDesde.SetFocus;
     Exit;
    end;}

   Screen.Cursor := crHourGlass;
   xSQL := 'Select Z.CUENTAID, Z.PVSLFECBE, Z.PVSLTIPBE, Z.CCOSID, SUM(Z.DEBE) DEBE, SUM(Z.HABER) HABER, Z.PVSNOMBRE, Z.DOCUMENTO,'
          +' SUM(Z.DEBE/'+xTipoCambio+') DEBEME, SUM(Z.HABER/'+xTipoCambio+') HABERME From'
          +' ('
          +' ('
          +' Select S.CIAID, S.PVSLFECBE, S.PVSLBENNR, S.PVSLTIPBE, '''' BENEFDES, APO101.CCOSID, S.CUENTAID, S.TIPCREDES,'
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
          +' Where A.PVSESTLIQ = '+QuotedStr('02')
          +' And A.PVSLBENNR = PVS307.PVSLBENNR'
          +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(DateToStr(dbdtpDesde.Date))
          +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(DateToStr(dbdtpDesde.Date))
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
          +'      END DEBE, 0 HABER, '''' PVSNOMBRE, '''' DOCUMENTO'
          +' From PVS306 A, PVS307'
          +' Where A.PVSESTLIQ = '+QuotedStr('02')
          +' And A.PVSLTIPBE In (''02'')'
          +' And A.PVSLBENNR = PVS307.PVSLBENNR'
          +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(DateToStr(dbdtpDesde.Date))
          +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(DateToStr(dbdtpDesde.Date))
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
          +'      END DEBE, 0 HABER, '''' PVSNOMBRE, '''' DOCUMENTO'
          +' From PVS306 A, PVS307'
          +' Where A.PVSESTLIQ = '+QuotedStr('02')
          +' And A.PVSLTIPBE In (''03'')'
          +' And A.PVSLBENNR = PVS307.PVSLBENNR'
          +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(DateToStr(dbdtpDesde.Date))
          +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(DateToStr(dbdtpDesde.Date))
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
          +' And A.PVSESTLIQ = '+QuotedStr('02')
          +' And B.PVSLMONTO > 0'
          +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(DateToStr(dbdtpDesde.Date))
          +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(DateToStr(dbdtpDesde.Date))
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
          +'      WHEN B.BANCOID = ''03'' And B.FORPAGOID = ''11'' THEN ''LIBRETA DE AHORRO'' END DOCUMENTO'
          +' From PVS306 A, PVS307 B, TGE186 C, TGE106 D'
          +' Where A.PVSLBENNR = B.PVSLBENNR'
          +' And B.PVSLAGRID = '+QuotedStr('FPG')
          +' And B.FLGVOUCHER = '+QuotedStr('N')
          +' And B.BANCOID = D.BANCOID'
          +' And D.CIAID = '+QuotedStr('02')
          +' And ((D.BANCOID = ''03'' And D.CCBCOID = ''194-625395-0-20'') Or'
          +' (D.BANCOID = ''04'' And D.CCBCOID = ''0000-003905''))'
          +' And A.PVSESTLIQ = '+QuotedStr('02')
          +' And B.PVSLMONTO > 0'
          +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(DateToStr(dbdtpDesde.Date))
          +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(DateToStr(dbdtpDesde.Date))
          +' And A.PVSLTIPBE = C.TIPBENEF) X'
          +' Group By CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, x.TIPCREDES, X.PVSNOMBRE, X.DOCUMENTO)'
          +' UNION ALL'
          //*CUENTAS PARA LOS DESCUENTOS PARA COMPAÑIA 02*/
          +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
          +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
          +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
          +' C.BENEFDES, E.CUENTAID, D.CREAMORT PVSLMONTO, E.TIPCREDES'
          +' From PVS306 A, PVS307 B, TGE186 C, CRE310 D, CRE110 E, APO101 F'
          +' Where A.PVSLBENNR = B.PVSLBENNR'
          +' And B.PVSLAGRID = '+QuotedStr('DSC')
          +' And A.ASOID = D.ASOID'
          +' And B.TIPCREID = D.TIPCREID'
          +' And B.CREDID = D.CREDID'
          +' And D.TIPCREID = E.TIPCREID'
          +' And A.PVSESTLIQ = '+QuotedStr('02')
          +' And B.PVSLMONTO > 0'
          +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(DateToStr(dbdtpDesde.Date))
          +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(DateToStr(dbdtpDesde.Date))
          +' And D.CREMTOCOB > 0'
          +' And A.PVSLBENNR = D.CREDOCPAG'
          +' And A.PVSLUSEI = F.USEID(+)'
          +' And A.PVSLUPAI = F.UPAGOID(+)'
          +' And A.PVSLUPRI = F.UPROID(+)'
          +' And (NVL(E.CIAID, ''02'') = ''02'')'
          +' And A.PVSLTIPBE = C.TIPBENEF) X'
          +' Group By X.CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, X.TIPCREDES)'
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
          +' And A.PVSESTLIQ = '+QuotedStr('02')
          +' And B.PVSLMONTO > 0'
          +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(DateToStr(dbdtpDesde.Date))
          +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(DateToStr(dbdtpDesde.Date))
          +' And A.PVSLBENNR = D.CREDOCPAG'
          +' And (NVL(E.CIAID, ''02'') = ''02'')'
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
          +' And A.PVSESTLIQ = '+QuotedStr('02')
          +' And B.PVSLMONTO > 0'
          +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(DateToStr(dbdtpDesde.Date))
          +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(DateToStr(dbdtpDesde.Date))
          +' And A.PVSLBENNR = D.CREDOCPAG'
          +' And (NVL(E.CIAID, ''02'') = ''02'')'
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
          +' And A.PVSESTLIQ = '+QuotedStr('02')
          +' And B.PVSLMONTO > 0'
          +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(DateToStr(dbdtpDesde.Date))
          +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(DateToStr(dbdtpDesde.Date))
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
          +' C.BENEFDES, E.CTACOBD CUENTAID, (D.CREAMORT + D.CREINTERES + D.CREFLAT) PVSLMONTO, E.TIPCREDES'
          +' From PVS306 A, PVS307 B, TGE186 C, CRE310 D, CRE110 E'
          +' Where A.PVSLBENNR = B.PVSLBENNR'
          +' And B.PVSLAGRID = '+QuotedStr('DSC')
          +' And A.ASOID = D.ASOID'
          +' And B.TIPCREID = D.TIPCREID'
          +' And B.CREDID = D.CREDID'
          +' And D.TIPCREID = E.TIPCREID'
          +' And A.PVSESTLIQ = '+QuotedStr('02')
          +' And B.PVSLMONTO > 0'
          +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(DateToStr(dbdtpDesde.Date))
          +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(DateToStr(dbdtpDesde.Date))
          +' And A.PVSLBENNR = D.CREDOCPAG'
          +' And (E.CIAID <> ''02'' And E.CIAID Is Not Null)'
          +' And A.PVSLTIPBE = C.TIPBENEF) X'
          +' Group By CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, X.TIPCREDES)'
          +' UNION ALL'
          //********************************************************************************************/
          +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, X.BENEFDES, Null CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
          +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
          +' (Select E.CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID,'
          +' C.BENEFDES, E.CUENTAID, D.CREAMORT PVSLMONTO, E.TIPCREDES'
          +' From PVS306 A, PVS307 B, TGE186 C, CRE310 D, CRE110 E'
          +' Where A.PVSLBENNR = B.PVSLBENNR'
          +' And B.PVSLAGRID = '+QuotedStr('DSC')
          +' And A.ASOID = D.ASOID'
          +' And B.TIPCREID = D.TIPCREID'
          +' And B.CREDID = D.CREDID'
          +' And D.TIPCREID = E.TIPCREID'
          +' And A.PVSESTLIQ = '+QuotedStr('02')
          +' And B.PVSLMONTO > 0'
          +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(DateToStr(dbdtpDesde.Date))
          +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(DateToStr(dbdtpDesde.Date))
          +' And D.CREMTOCOB > 0'
          +' And A.PVSLBENNR = D.CREDOCPAG'
          +' And (E.CIAID <> ''02'' And E.CIAID Is Not Null)'
          +' And A.PVSLTIPBE = C.TIPBENEF) X'
          +' Group By CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, X.TIPCREDES)'
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
          +' And A.PVSESTLIQ = '+QuotedStr('02')
          +' And B.PVSLMONTO > 0'
          +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(DateToStr(dbdtpDesde.Date))
          +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(DateToStr(dbdtpDesde.Date))
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
          +' And A.PVSESTLIQ = '+QuotedStr('02')
          +' And B.PVSLMONTO > 0'
          +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(DateToStr(dbdtpDesde.Date))
          +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(DateToStr(dbdtpDesde.Date))
          +' And A.PVSLBENNR = D.CREDOCPAG'
          +' And (E.CIAID <> ''02'' And E.CIAID Is Not Null)'
          +' And D.CREMTOCOB > 0'
          +' And A.PVSLTIPBE = C.TIPBENEF) X'
          +' Group By CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, X.TIPCREDES)'
          //*PARA LAS NIVELACIONES*/
          +' UNION ALL'
          +' (Select X.CIAID, X.PVSLFECBE, X.PVSLBENNR, X.PVSLTIPBE, TGE186.BENEFDES, X.CCOSID, X.CUENTAID, X.TIPCREDES, 0 DEBE,'
          +' SUM(NVL(X.PVSLMONTO, 0)) HABER, '''' PVSNOMBRE, '''' DOCUMENTO From'
          +' (Select ''02'' CIAID, A.FREG PVSLFECBE, A.PVSLBENNR, A.PVSLTIPBE, B.TIPCREID, A.PVSLUSEI, A.PVSLUPAI, A.PVSLUPRI,'
          +' CASE WHEN B.TIPCREID = ''N'' THEN ''APORTE DE MAESTROS'' END TIPCREDES,'
          +' CASE WHEN B.TIPCREID = ''N'' THEN ''4810101'' END CUENTAID, B.PVSLMONTO, CCOSID'
          +' From PVS306 A, PVS307 B, APO101 C'
          +' Where A.PVSLBENNR = B.PVSLBENNR'
          +' And (B.TIPCREID = ''N'')'
          +' And A.PVSESTLIQ = '+QuotedStr('02')
          +' And B.PVSLMONTO > 0'
          +' And A.PVSLUSEI = C.USEID(+)'
          +' And A.PVSLUPRI = C.UPROID(+)'
          +' And A.PVSLUPAI = C.UPAGOID(+)'
          +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(DateToStr(dbdtpDesde.Date))
          +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(DateToStr(dbdtpDesde.Date))+') X, TGE186'
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
          +' And A.PVSESTLIQ = '+QuotedStr('02')
          +' And B.PVSLMONTO > 0'
          +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) >= '+QuotedStr(DateToStr(dbdtpDesde.Date))
          +' And To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) <= '+QuotedStr(DateToStr(dbdtpDesde.Date))+') X, TGE186'
          +' Where X.PVSLTIPBE = TIPBENEF'
          +' Group By X.CIAID, PVSLFECBE, PVSLBENNR, PVSLTIPBE, CUENTAID, BENEFDES, TIPCREDES)'
          +' ) Z'
          +' Group By Z.CUENTAID, Z.CCOSID, Z.PVSLTIPBE, Z.PVSNOMBRE, Z.DOCUMENTO, Z.PVSLFECBE'
          +' Order By PVSLFECBE, CUENTAID';

   FPrincipal.MRefe.UsuarioSQL.Clear;
   FPrincipal.MRefe.FMant.wTabla := 'VWPREREPXCOMP';
   FPrincipal.MRefe.UsuarioSQL.Add(xSQL);
   FPrincipal.MRefe.NewQuery;
   Screen.Cursor := crDefault;
end;

procedure TFToolRepComprobantes.ppRepComprobantesPreviewFormCreate(
  Sender: TObject);
begin
   ppRepComprobantes.PreviewForm.WindowState := wsMaximized;
   TppViewer(ppRepComprobantes.PreviewForm.Viewer).ZoomSetting := zsPageWidth;
end;

procedure TFToolRepComprobantes.bbtnImprimirClick(Sender: TObject);
var
   x10 : Integer;
begin
   If DM1.cdsReporte.RecordCount = 0 Then
    begin
     Beep;
     MessageDlg('No Existen Datos a Visualizar', mtInformation, [mbOk], 0);
     Exit;
    end;

   Screen.Cursor := crHourGlass;
   ppRepComprobantes.Template.FileName  := wRutaRpt +'\RepComprobantes.rtm';
   ppRepComprobantes.Template.LoadFromFile ;

   DM1.cdsReporte.DisableControls;
   ppRepComprobantes.Print;
   ppRepComprobantes.Stop;

   x10 := Self.ComponentCount - 1;
   While x10 > 0 do
    begin
     If Self.Components[x10].ClassName = 'TppGroup' Then
      begin
       Self.Components[x10].Free;
      end;
     x10 := x10 - 1;
    end;
   DM1.cdsReporte.EnableControls;

   Screen.Cursor := crDefault;
end;

procedure TFToolRepComprobantes.ppHeaderBand1BeforePrint(Sender: TObject);
var
   xWhere : String;
begin
   xWhere := 'CNTANOMM = '+QuotedStr(Copy(dbdtpDesde.Text, 7, 4)+Copy(dbdtpDesde.Text, 4, 2))
            +' And TDIARID = '+QuotedStr('27');

   pplblFecha.Caption       := DM1.DisplayDescrip('prvSQL', 'CNT300PRE', 'TDIARID, TDIARDES, CNTANOMM, CNTCOMPROB, CNTLOTE, CNTTCAMBIO, CNTFCOMP', xWhere, 'CNTFCOMP');
   pplblTCambio.Caption     := FloatToStrF(StrToFloat(DM1.cdsQry.FieldByName('CNTTCAMBIO').AsString), ffNumber, 15, 3);
   pplblComprobante.Caption := DM1.cdsQry.FieldByName('CNTCOMPROB').AsString;
   pplblTDiario.Caption     := DM1.cdsQry.FieldByName('TDIARID').AsString+' - '+DM1.cdsQry.FieldByName('TDIARDES').AsString;
   pplblPeriodo.Caption     := DM1.NombreMes(Copy(DM1.cdsQry.FieldByName('CNTANOMM').AsString, 4, 2));
end;

end.
