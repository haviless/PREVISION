unit PRE301;
// Inicio Uso Estándares: 01/08/2011
// Unidad            : Previsión Social
// Formulario        : 
// Fecha de Creación : 03/05/2016
// Autor             : Sistemas
// Objetivo          : Contabilidad de Extornos
//
// Actualizaciones
// ---------------
// HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
// HPC_201705_PRE : Contabilizar Extornos de Desembolsos o Liquidaciones
// HPC_201709_PRE : Se modifica el script que muestra los registros extornados.
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, wwdbedit, wwdblook, Buttons, Wwdbigrd, Grids,
  Wwdbgrid, fcButton, fcImgBtn, fcShapeBtn, Mask, Wwdbspin, StdCtrls,
  wwdbdatetimepicker, ExtCtrls, db, ppEndUsr, ppDB, ppDBPipe, ppParameter,
  ppBands, ppClass, ppCtrls, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv,
  ppProd, ppReport, jpeg;

type
  TFContaExtorno = class(TForm)
    pnlCabecera: TPanel;
    Label5: TLabel;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    dtpFecIni: TwwDBDateTimePicker;
    dtpFecFin: TwwDBDateTimePicker;
    GroupBox2: TGroupBox;
    dbseMes: TwwDBSpinEdit;
    dbseAno: TwwDBSpinEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    fcShapeBtn3: TfcShapeBtn;
    fcShapeBtn6: TfcShapeBtn;
    fcShapeBtn4: TfcShapeBtn;
    fcShapeBtn7: TfcShapeBtn;
    fcShpDevoTrans: TfcShapeBtn;
    fcShapeBtn5: TfcShapeBtn;
    fcShapeBtn2: TfcShapeBtn;
    dbgConta: TwwDBGrid;
    wwIButton2: TwwIButton;
    dblcTipo: TwwDBLookupCombo;
    dbeTipo: TwwDBEdit;
    dtpFComp: TwwDBDateTimePicker;
    dbeComprob: TwwDBEdit;
    fcShapeBtn1: TfcShapeBtn;
    prbAvance: TProgressBar;
    ppdb1: TppDBPipeline;
    ppD2: TppDesigner;
    ppr2: TppReport;
    ppHeaderBand7: TppHeaderBand;
    ppDBText99: TppDBText;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLine79: TppLine;
    ppLine80: TppLine;
    ppLabel62: TppLabel;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppDetailBand8: TppDetailBand;
    ppDBText100: TppDBText;
    ppDBText101: TppDBText;
    ppDBText102: TppDBText;
    ppDBText103: TppDBText;
    ppDBText107: TppDBText;
    ppDBText108: TppDBText;
    ppDBText109: TppDBText;
    ppDBText110: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppGroup13: TppGroup;
    ppGroupHeaderBand13: TppGroupHeaderBand;
    ppGroupFooterBand13: TppGroupFooterBand;
    ppLine81: TppLine;
    ppDBCalc89: TppDBCalc;
    ppDBCalc90: TppDBCalc;
    ppLabel72: TppLabel;
    ppDBText112: TppDBText;
    ppGroup14: TppGroup;
    ppGroupHeaderBand14: TppGroupHeaderBand;
    ppGroupFooterBand14: TppGroupFooterBand;
    ppGroup15: TppGroup;
    ppGroupHeaderBand15: TppGroupHeaderBand;
    ppGroupFooterBand15: TppGroupFooterBand;
    ppLine82: TppLine;
    ppDBCalc91: TppDBCalc;
    ppDBCalc92: TppDBCalc;
    ppLabel73: TppLabel;
    ppParameterList3: TppParameterList;
    ppr1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDBText8: TppDBText;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText104: TppDBText;
    ppDBText105: TppDBText;
    ppDBText106: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText111: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine3: TppLine;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppLabel12: TppLabel;
    ppDBText17: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLine4: TppLine;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppLabel13: TppLabel;
    ppParameterList2: TppParameterList;
    ppImage3: TppImage;
    ppLabel91: TppLabel;
    ppLabel92: TppLabel;
    ppLabel93: TppLabel;
    ppSystemVariable10: TppSystemVariable;
    ppSystemVariable11: TppSystemVariable;
    ppSystemVariable12: TppSystemVariable;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppImage1: TppImage;
    ppLabel90: TppLabel;
    ppLabel11: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
// Inicio HPC_201705_PRE : Contabilizar Extornos de Desembolsos o Liquidaciones
    ppLabel19: TppLabel;
    pplTotCom: TppLabel;
    ppLabel20: TppLabel;
    pplTotExt: TppLabel;
// Fin  HPC_201705_PRE : Contabilizar Extornos de Desembolsos o Liquidaciones
    procedure FormActivate(Sender: TObject);
    procedure fcShapeBtn1Click(Sender: TObject);
    procedure dbseMesExit(Sender: TObject);
    procedure fcShapeBtn4Click(Sender: TObject);
    procedure fcShapeBtn7Click(Sender: TObject);
    procedure fcShpDevoTransClick(Sender: TObject);
    procedure fcShapeBtn5Click(Sender: TObject);
    procedure fcShapeBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    xCNT300 : String;
    xCNT311 : String;
    xPeriodo: String;
    procedure PasaDatosFecha;
    procedure GeneraCNT300( sComprob : String );
// Inicio HPC_201705_PRE : Contabilizar Extornos de Desembolsos o Liquidaciones
    procedure GeneraCNT300_P( sComprob : String );
// Fin    HPC_201705_PRE : Contabilizar Extornos de Desembolsos o Liquidaciones
    procedure ReporteContabilizaCredito( cTabla, cLote,xPeriodo : String);
  public
    { Public declarations }
  end;

var
  FContaExtorno: TFContaExtorno;

implementation

uses PREDM;

{$R *.dfm}

procedure TFContaExtorno.FormActivate(Sender: TObject);
var
   xSQL : String;
   wAno, wMes, wDia : Word;
   xMes : String;
begin
   decodedate(Date-8,wAno,wMes,wDia);
   dbseAno.Text := inttostr(wAno);
   if wMes<=0 then
   begin
      dbseMes.Text := '12';
      dbseAno.Text := inttostr(wAno-1)
   end
   else
   begin
      if wMes<10 then
         dbseMes.Text := '0'+inttostr(wMes)
      else
         dbseMes.Text := inttostr(wMes)
   end;

   dblcTipo.Text:='27';
   xSQL:= 'SELECT tdiarid, tdiardes, tdiarnum, tdiarest, autonum, flagbcocja, tdiarman, registro, flagalm, tdiarabr, flagpdt, flagpl, flgplper, tdiarid1, flagaf FROM TGE104 WHERE TDIARID='+quotedstr( dblcTipo.Text );
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest( xSQL );
   DM1.cdsQry.Open;

   dbeTipo.Text:=DM1.cdsQry.FieldByName('TDIARDES').AsString;

   xCNT300  := 'CNT300PRE';
   xCNT311  := 'CNT311PRE';

   PasaDatosFecha;

// Inicio HPC_201705_PRE : Contabilizar Extornos de Desembolsos o Liquidaciones
   xSQL:='SELECT A.PVSFANUL FECEXT, PVSLBENNR LIQUIDACION, '
        +  '(select MAX(FORPAGOID) FORPAGOID FROM PVS307 B WHERE PVSLBENNR = A.PVSLBENNR) TIPDESEID, '
        +  '(select MAX(G.TIPDESEDES) FROM PVS307 F, CRE104 G  WHERE PVSLBENNR = A.PVSLBENNR AND FORPAGOID=TIPDESEID ) TIPDESEDES, '
        +  'A.MONLIQBEN MONTO_OTO, A.MONPAG MONTO_GIR, 1, ''          '' COMPROBANTE, ''          '' COMPROBANTE2, '
        +  'A.MONDEV MONTO_DEV, '
        +  '( select MAX(PVSLNOFC) PVSLNOFC FROM PVS307 B WHERE PVSLBENNR = A.PVSLBENNR ) PVSLNOFC, '
        +  'NUMOPEBAN, FECOPEBAN, ''   '' TIPO  '
        +'FROM PVS306 A '
        +'WHERE A.PVSFANUL>='+quotedstr(formatdatetime(wFormatFecha,dtpFecIni.Date))
        + ' AND A.PVSFANUL<='+quotedstr(formatdatetime(wFormatFecha,dtpFecFin.Date))
        + ' AND A.PVSESTLIQ IN (''04'', ''13'') and PVSLBENNR=''XYZ'' '
        +'ORDER BY A.PVSFANUL, PVSLBENNR ';
   DM1.cdsQry2.Close;
   DM1.cdsQry2.DataRequest( xSQL );
   DM1.cdsQry2.Open;

   dbgConta.Selected.Clear;
   dbgConta.Selected.Add('TIPO'#9'4'#9'Tipo'#9#9);
   dbgConta.Selected.Add('FECEXT'#9'10'#9'Fecha~Extorno'#9#9);
   dbgConta.Selected.Add('LIQUIDACION'#9'12'#9'Liquidación'#9#9);
   dbgConta.Selected.Add('PVSLNOFC'#9'12'#9'Oficio'#9#9);
   dbgConta.Selected.Add('TIPDESEDES'#9'20'#9'Tipo~Desembolso'#9#9);
   dbgConta.Selected.Add('MONTO_OTO'#9'13'#9'Monto~Liquidado'#9#9);
   dbgConta.Selected.Add('MONTO_DEV'#9'10'#9'Monto~Devolución'#9#9);
   dbgConta.Selected.Add('MONTO_GIR'#9'13'#9'Monto~Desembolsado'#9#9);
   dbgConta.Selected.Add('REGISTROS'#9'10'#9'Registros'#9#9);
   dbgConta.Selected.Add('COMPROBANTE'#9'11'#9'Comprobante'#9#9);
   dbgConta.ApplySelected;
// Fin    HPC_201705_PRE : Contabilizar Extornos de Desembolsos o Liquidaciones

   PageControl1.TabIndex := 0;
end;

procedure TFContaExtorno.fcShapeBtn1Click(Sender: TObject);
var
   xSQL : String;
   cont : integer;
begin
// Inicio HPC_201705_PRE : Contabilizar Extornos de Desembolsos o Liquidaciones
   // Liquidación y Desembolso
   xSQL:='SELECT A.PVSFANUL FECEXT, PVSLBENNR LIQUIDACION, '
        +  '(select MAX(FORPAGOID) FORPAGOID FROM PVS307 B WHERE PVSLBENNR = A.PVSLBENNR) TIPDESEID, '
        +  '(select MAX(G.TIPDESEDES) FROM PVS307 F, CRE104 G  WHERE PVSLBENNR = A.PVSLBENNR AND FORPAGOID=TIPDESEID ) TIPDESEDES, '
        +  'A.MONLIQBEN MONTO_OTO, A.MONPAG MONTO_GIR, 1, ''          '' COMPROBANTE, ''          '' COMPROBANTE2, '
        +  'nvl(A.MONDEV,0) MONTO_DEV, '
        +  '( select MAX(PVSLNOFC) PVSLNOFC FROM PVS307 B WHERE PVSLBENNR = A.PVSLBENNR ) PVSLNOFC, '
        +  'NUMOPEBAN, FECOPEBAN, ''LYD'' TIPO '
        +'FROM PVS306 A '
        // Inicio: HPC_201709_PRE
        // Se modifica el Qry. Se actaliza el campo de la fecha de anulación
        // +'WHERE A.PVSFANUL>='+quotedstr(formatdatetime(wFormatFecha,dtpFecIni.Date))
        // + ' AND A.PVSFANUL<='+quotedstr(formatdatetime(wFormatFecha,dtpFecFin.Date))
        +'WHERE TO_DATE(A.PVSFANUL) >= '+quotedstr(formatdatetime(wFormatFecha,dtpFecIni.Date))
        + ' AND TO_DATE(A.PVSFANUL) <= '+quotedstr(formatdatetime(wFormatFecha,dtpFecFin.Date))
        // Fin: HPC_201709_PRE
        + ' AND A.PVSESTLIQ IN (''04'', ''13'') '
        + ' AND ( select MAX(PVSLNOFC) PVSLNOFC FROM PVS307 B WHERE PVSLBENNR = A.PVSLBENNR ) is not null '

        +'UNION ALL '

   // Desembolso
        +'SELECT TO_DATE(X.FECEXT) FECEXT, '
        +  ' A.PVSLBENNR LIQUIDACION, '
        +  'X.FORPAGOID TIPDESEID, '
        +  '(select MAX(G.TIPDESEDES) FROM PVS307 F, CRE104 G  WHERE PVSLBENNR = A.PVSLBENNR AND X.FORPAGOID=TIPDESEID ) TIPDESEDES, '
        +  '0.00 MONTO_OTO, SUM( NVL(PVSLSALDO,0) ) MONTO_GIR, '
        +  '1, ''          '' COMPROBANTE, ''          '' COMPROBANTE2, '
        +  '0 MONTO_DEV, '
        +  'OFIEXT PVSLNOFC, '
        +  'NUMOPEBAN, FECOPEBAN, ''DES'' TIPO '
        + 'FROM PVS306 A, PVS307 X '
        + 'WHERE A.PVSLBENNR IN (select DISTINCT PVSLBENNR FROM PVS307 B '
        // Inicio: HPC_201709_PRE
        // Se modifica el Qry. Se actaliza el campo de la fecha de extorno
        // +                     'WHERE FECEXT >= '+quotedstr(formatdatetime(wFormatFecha,dtpFecIni.Date))
        // +                      ' AND FECEXT <= '+quotedstr(formatdatetime(wFormatFecha,dtpFecFin.Date))
        +                     'WHERE TO_DATE(FECEXT) >= '+quotedstr(formatdatetime(wFormatFecha,dtpFecIni.Date))
        +                      ' AND TO_DATE(FECEXT) <= '+quotedstr(formatdatetime(wFormatFecha,dtpFecFin.Date))
        // Fin: HPC_201709_PRE
        +                      ' AND FLAEXT=''S'')'
        +  ' AND A.PVSLBENNR = X.PVSLBENNR and X.FLAEXT = ''S'' '
        + 'GROUP BY A.PVSLBENNR, TO_DATE(X.FECEXT), X.FORPAGOID, OFIEXT, NUMOPEBAN, FECOPEBAN '
     +'UNION ALL '
   // Liquidación
        +'SELECT A.PVSFANUL FECEXT, PVSLBENNR LIQUIDACION, '
        +  '(select MAX(FORPAGOID) FORPAGOID FROM PVS307 B WHERE PVSLBENNR = A.PVSLBENNR) TIPDESEID, '
        +  '(select MAX(G.TIPDESEDES) FROM PVS307 F, CRE104 G  WHERE PVSLBENNR = A.PVSLBENNR AND FORPAGOID=TIPDESEID ) TIPDESEDES, '
        +  'A.MONLIQBEN MONTO_OTO, 0 MONTO_GIR, 1, ''          '' COMPROBANTE, ''          '' COMPROBANTE2, '
        +  'nvl(A.MONDEV,0) MONTO_DEV, '
        +  '( select MAX(PVSLNOFC) PVSLNOFC FROM PVS307 B WHERE PVSLBENNR = A.PVSLBENNR ) PVSLNOFC, '
        +  'NUMOPEBAN, FECOPEBAN, ''LIQ'' TIPO '
        +'FROM PVS306 A '
        // Inicio: HPC_201709_PRE
        // Se modifica el Qry. Se actaliza el campo de la fecha de anulación
        // +'WHERE A.PVSFANUL>='+quotedstr(formatdatetime(wFormatFecha,dtpFecIni.Date))
        // + ' AND A.PVSFANUL<='+quotedstr(formatdatetime(wFormatFecha,dtpFecFin.Date))
        +'WHERE TO_DATE(A.PVSFANUL) >='+quotedstr(formatdatetime(wFormatFecha,dtpFecIni.Date))
        + ' AND TO_DATE(A.PVSFANUL) <='+quotedstr(formatdatetime(wFormatFecha,dtpFecFin.Date))
        // Fin: HPC_201709_PRE
        + ' AND A.PVSESTLIQ IN (''04'') '
        + ' AND ( select MAX(PVSLNOFC) PVSLNOFC FROM PVS307 B WHERE PVSLBENNR = A.PVSLBENNR ) is null '
        + 'ORDER BY TIPO, FECEXT, LIQUIDACION, PVSLNOFC';
   DM1.cdsQry5.Close;
   DM1.cdsQry5.DataRequest( xSQL );
   DM1.cdsQry5.Open;

   TNumericField(DM1.cdsQry5.FieldByName('MONTO_OTO')).DisplayFormat:='###,###,##0.00';
   TNumericField(DM1.cdsQry5.FieldByName('MONTO_GIR')).DisplayFormat:='###,###,##0.00';
   TNumericField(DM1.cdsQry5.FieldByName('MONTO_DEV')).DisplayFormat:='###,###,##0.00';

   dbgConta.DataSource:=DM1.dsQry5;

   dbgConta.ColumnByName('MONTO_OTO').FooterValue := FloatToStrF(DM1.OperClientDataSet(dm1.cdsQry5, 'SUM(MONTO_OTO)',''),ffCurrency, 10, 2);
   dbgConta.ColumnByName('MONTO_GIR').FooterValue := FloatToStrF(DM1.OperClientDataSet(dm1.cdsQry5, 'SUM(MONTO_GIR)',''),ffCurrency, 10, 2);
   dbgConta.ColumnByName('MONTO_DEV').FooterValue := FloatToStrF(DM1.OperClientDataSet(dm1.cdsQry5, 'SUM(MONTO_DEV)',''),ffCurrency, 10, 2);
// Fin  HPC_201705_PRE : Contabilizar Extornos de Desembolsos o Liquidaciones

   DM1.cdsQry5.First;
   cont:=1;
   while not DM1.cdsQry5.Eof do
   begin
      DM1.cdsQry5.Edit;
      DM1.cdsQry5.FieldByName('COMPROBANTE').AsString:= DM1.StrZero(inttostr(cont),10);
      cont:=cont+1;
      DM1.cdsQry5.FieldByName('COMPROBANTE2').AsString:= DM1.StrZero(inttostr(cont),10);
      cont:=cont+1;
      DM1.cdsQry5.Next;
   end;
   DM1.cdsQry5.First;
   ShowMessage( ' ok ' );
end;


procedure TFContaExtorno.PasaDatosFecha;
var
   xDiaFin, xDiaIni, xMes : String;
begin
   xDiaIni := '01/'+dbseMes.Text+'/'+dbseAno.Text;
   xMes := DM1.strZero(inttostr(strtoint(dbseMes.Text)+1),2);
   if strtoint(xMes)>12 then
      xDiaFin := '31/12/'+dbseAno.Text
   else
   begin
      xDiaFin := datetostr(strtodate('01/'+xMes+'/'+dbseAno.Text)-1);
   end;
   dtpFecIni.date := strtodate(xDiaIni);
   dtpFecFin.date := strtodate(xDiaFin);
   dtpFComp.date := strtodate(xDiaFin);
   xPeriodo := dbseAno.Text+dbseMes.Text;
end;


procedure TFContaExtorno.dbseMesExit(Sender: TObject);
begin
   if Length( dbseMes.Text )<2 then
      dbseMes.Text := DM1.StrZero(dbseMes.Text,2);
   PasaDatosFecha;
end;


procedure TFContaExtorno.fcShapeBtn4Click(Sender: TObject);
var
   xWhere, xSQL, xSQL1, xSQL2, xTipodesem : String;
   xTCambio, xTotHaber : Double;
   xNReg : Integer;
   sAno,SaNO1, sResMes : String;
begin
   SaNO1:='2015';
   if MessageDlg('Esta Seguro(a) de Contabilizar ',mtconfirmation,[mbYes,MbNo],0)<>mrYes then Exit;

   DM1.cdsQry6.IndexFieldNames:='';
   DM1.cdsQry5.First;

   if DM1.cdsQry5.FieldByName('COMPROBANTE').AsString='' then
   begin
      ShowMessage('Falta Generar Comprobante');
      Exit;
   end;

   Screen.Cursor:=crHourGlass;
   xWhere := 'Select TCAMVBV FROM TGE107 '
           + 'WHERE FECHA='+wRepFuncDate+''''+formatdatetime(wFormatFecha,dtpFComp.date)+''''+')';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest( xWhere );
   DM1.cdsQry.Open;

   xTCambio:=DM1.cdsQry.FieldByName('TCAMVBV').AsFloat;
   if xTCambio<=0 then xTCambio:=3.5;

   xWhere := 'FECHA='+wRepFuncDate+''''+formatdatetime(wFormatFecha,dtpFComp.date)+''''+')';
   DM1.DisplayDescrip('PrvTGE','TGE114','*',xWhere,'FECANO');

   xSQL:='delete from '+xCNT300+' '
        +'where CIAID=''02'' and CNTANOMM='''+xPeriodo+''' and CNTLOTE=''EXTP'' ';
   DM1.cdsQry2.Close;
   DM1.cdsQry2.DataRequest( xSQL );
   try
     DM1.cdsQry2.Execute;
   except
   end;

   xSQL:='delete from '+xCNT311+' '
        +'where CIAID=''02'' and CNTANOMM='''+xPeriodo+''' and CNTLOTE=''EXTP'' ';
   DM1.cdsQry2.Close;
   DM1.cdsQry2.DataRequest( xSQL );
   try
     DM1.cdsQry2.Execute;
   except
   end;

// Inicio HPC_201705_PRE : Contabilizar Extornos de Desembolsos o Liquidaciones
   DM1.cdsQry5.First;
   while not DM1.cdsQry5.Eof do
   begin

      sAno:=Copy(DM1.cdsQry5.FieldByname('LIQUIDACION').AsString,1,4);

      if (DM1.cdsQry5.FieldByname('TIPO').AsString='LYD') OR (DM1.cdsQry5.FieldByname('TIPO').AsString='LIQ') then
      begin
          // Extorno del Beneficio
          xSQL:=
            'insert into cnt311pre( '
           +   'ciaid, tdiarid, cntcomprob, cntano, cntanomm, cntlote, cuentaid, clauxid, auxid, docid, cntserie, cntnodoc, '
           +   'cntglosa, cntdh, ccosid, cnttcambio, cntmtoori, cntmtoloc, cntmtoext, cntfemis, cntfvcmto, cntfcomp, cntestado, '
           +   'cntcuadre, cntfautom, cntuser, cntfreg, cnthreg, cntmm, cntdd, cnttri, cntsem, cntss, cntaatri, cntaasem, cntaass, '
           +   'tmonid, flagvar, fcons, cntfmec, tdiardes, ctades, auxdes, docdes, ccosdes, cntdebemn, cntdebeme, cnthabemn, '
           +   'cnthabeme, cntsaldmn, cntsaldme, campovar, cntts, cntpagado, cntmoddoc, cntreg, modulo, cta_secu ) '
           +'select ciaid, tdiarid, '''+DM1.cdsQry5.FieldByname('COMPROBANTE').AsString+''' cntcomprob, '
           +   ''''+Copy( xPeriodo,1,4 )+''' cntano, '''+xPeriodo+''' cntanomm, ''EXTP'' cntlote, cuentaid, clauxid, auxid, '
           +   'docid, cntserie, '''+DM1.cdsQry5.FieldByname('LIQUIDACION').AsString+''' cntnodoc, '
           +   'cntglosa, case when cntdh=''D'' then ''H'' else ''D'' end cntdh, ccosid, '
           +   'cnttcambio, cntmtoori, cntmtoloc, cntmtoext, '
           +   'cntfemis, cntfvcmto, '''+DM1.cdsQry5.FieldByname('FECEXT').AsString+''' cntfcomp, '
           +   '''I'' cntestado, ''N'' cntcuadre, ''N'' cntfautom, '
           +   ''''+DM1.wUsuario+''' cntuser, TO_DATE(SYSDATE) cntfreg, SYSDATE cnthreg, '
           +   ''''+DM1.cdsQry.FieldByName('FECMES').AsString   +''', '
           +   ''''+DM1.cdsQry.FieldByName('FECDIA').AsString   +''', '
           +   ''''+DM1.cdsQry.FieldByName('FECTRIM').AsString  +''', '
           +   ''''+DM1.cdsQry.FieldByName('FECSEM').AsString   +''', '
           +   ''''+DM1.cdsQry.FieldByName('FECSS').AsString    +''', '
           +   ''''+DM1.cdsQry.FieldByName('FECAATRI').AsString +''', '
           +   ''''+DM1.cdsQry.FieldByName('FECAASEM').AsString +''', '
           +   ''''+DM1.cdsQry.FieldByName('FECAASS').AsString  +''', '
           +   'tmonid, flagvar, fcons, cntfmec, tdiardes, ctades, auxdes, docdes, ccosdes, '
           +   'cnthabemn, cnthabeme, cntdebemn, cntdebeme, '
           +   'cntsaldmn, cntsaldme, campovar, cntts, cntpagado, cntmoddoc, ROWNUM cntreg, modulo, cta_secu '
           + 'from cnt301 '
           +'where ciaid=''02'' and CNTANOMM like '+sAno+'||''%'' AND cntlote=''PRE'' and tdiarid=''27'' '
           +  ' and CNTGLOSA LIKE ''%''||'+DM1.cdsQry5.FieldByname('LIQUIDACION').AsString+'||''%'' '
           + 'order by CNTCOMPROB, CNTDH, CNTREG';

          DM1.cdsQry2.Close;
          DM1.cdsQry2.DataRequest( xSQL );
          try
             DM1.cdsQry2.Execute;
          except
          end;

          GeneraCNT300( DM1.cdsQry5.FieldByname('COMPROBANTE').AsString );

          if (DM1.cdsQry5.FieldByname('TIPO').AsString='LYD') then
          begin
              if Copy(DM1.cdsQry5.FieldByname('FECEXT').AsString,4,2)=Copy(DM1.cdsQry5.FieldByname('FECOPEBAN').AsString,4,2) then
                 sResMes:='V'
              else
                 sResMes:='F';

              // Desembolso del Extorno
              xSQL:=
                'insert into cnt311pre( '
               +    'ciaid, tdiarid, cntcomprob, cntano, cntanomm, cntlote, cuentaid, clauxid, auxid, docid, cntserie, cntnodoc, '
               +    'cntglosa, cntdh, ccosid, cnttcambio, cntmtoori, cntmtoloc, cntmtoext, cntfemis, cntfvcmto, cntfcomp, cntestado, '
               +    'cntcuadre, cntfautom, cntuser, cntfreg, cnthreg, cntmm, cntdd, cnttri, cntsem, cntss, cntaatri, cntaasem, cntaass, '
               +    'tmonid, flagvar, fcons, cntfmec, tdiardes, ctades, auxdes, docdes, ccosdes, cntdebemn, cntdebeme, cnthabemn, '
               +    'cnthabeme, cntsaldmn, cntsaldme, campovar, cntts, cntpagado, cntmoddoc, cntreg, modulo, cta_secu ) '
               +'select ciaid, tdiarid, '''+DM1.cdsQry5.FieldByname('COMPROBANTE2').AsString+''' cntcomprob, '
               +    ''''+Copy( xPeriodo,1,4 )+''' cntano, '''+xPeriodo+''' cntanomm, ''EXTP'' cntlote, cuentaid, clauxid, auxid, '
               +    'docid, cntserie, '''+DM1.cdsQry5.FieldByname('LIQUIDACION').AsString+''' cntnodoc, cntglosa, cntdh, '
               +    'ccosid, cnttcambio, cntmtoori, cntmtoloc, cntmtoext, cntfemis, cntfvcmto, '
               +    ''''+DM1.cdsQry5.FieldByname('FECEXT').AsString+''' cntfcomp, '
               +    '''I'' cntestado, ''N'' cntcuadre, ''N'' cntfautom, '''+DM1.wUsuario+''' cntuser, TO_DATE(SYSDATE) cntfreg, '
               +    'SYSDATE cnthreg, '
               +    ''''+DM1.cdsQry.FieldByName('FECMES').AsString   +''', '
               +    ''''+DM1.cdsQry.FieldByName('FECDIA').AsString   +''', '
               +    ''''+DM1.cdsQry.FieldByName('FECTRIM').AsString  +''', '
               +    ''''+DM1.cdsQry.FieldByName('FECSEM').AsString   +''', '
               +    ''''+DM1.cdsQry.FieldByName('FECSS').AsString    +''', '
               +    ''''+DM1.cdsQry.FieldByName('FECAATRI').AsString +''', '
               +    ''''+DM1.cdsQry.FieldByName('FECAASEM').AsString +''', '
               +    ''''+DM1.cdsQry.FieldByName('FECAASS').AsString  +''', '
               +    'tmonid, flagvar, fcons, cntfmec, tdiardes, ctades, auxdes, docdes, ccosdes, '
               +    'cntdebemn, cntdebeme, cnthabemn, cnthabeme, '
               +    'cntsaldmn, cntsaldme, campovar, cntts, cntpagado, cntmoddoc, 2 cntreg, modulo, cta_secu '
               +  'from cnt301 '
               + 'where ciaid=''02'' and CNTANOMM like '+sAno+'||''%'' AND cntlote=''PRE'' and tdiarid=''27'' '
               +  ' and CNTGLOSA LIKE ''%''||'+DM1.cdsQry5.FieldByname('LIQUIDACION').AsString+'||''%'' '
               +  ' and cuentaid like ''469%'' '
               +'union all '

               +'select ciaid, tdiarid, '''+DM1.cdsQry5.FieldByname('COMPROBANTE2').AsString+''' cntcomprob, '
               +    ''''+Copy( xPeriodo,1,4 )+''' cntano, '''+xPeriodo+''' cntanomm, ''EXTP'' cntlote, '
               +    'case when '''+sResMes+'''=''V'' then cuentaid else ''4691203'' end cuentaid,  '
               +    'clauxid, auxid, docid, cntserie, '
               +    ''''+DM1.cdsQry5.FieldByname('NUMOPEBAN').AsString+''' cntnodoc, '
               +    'cntglosa, ''D'' cntdh, '
               +    'ccosid, cnttcambio, '
               +    DM1.cdsQry5.FieldByname('MONTO_GIR').AsString+' cntmtoori, '
               +    DM1.cdsQry5.FieldByname('MONTO_GIR').AsString+' cntmtoloc, '
               +    'round('+DM1.cdsQry5.FieldByname('MONTO_GIR').AsString +'/cnttcambio,2) cntmtoext, '
               +    'TO_DATE('''+DM1.cdsQry5.FieldByname('FECOPEBAN').AsString+''') cntfemis, '
               +    'TO_DATE('''+DM1.cdsQry5.FieldByname('FECOPEBAN').AsString+''') cntfvcmto, '
               +    ''''+DM1.cdsQry5.FieldByname('FECEXT').AsString+''' cntfcomp, '
               +    '''I'' cntestado, ''N'' cntcuadre, ''N'' cntfautom, '''+DM1.wUsuario+''' cntuser, TO_DATE(SYSDATE) cntfreg, '
               +    'SYSDATE cnthreg, '
               +    ''''+DM1.cdsQry.FieldByName('FECMES').AsString   +''', '
               +    ''''+DM1.cdsQry.FieldByName('FECDIA').AsString   +''', '
               +    ''''+DM1.cdsQry.FieldByName('FECTRIM').AsString  +''', '
               +    ''''+DM1.cdsQry.FieldByName('FECSEM').AsString   +''', '
               +    ''''+DM1.cdsQry.FieldByName('FECSS').AsString    +''', '
               +    ''''+DM1.cdsQry.FieldByName('FECAATRI').AsString +''', '
               +    ''''+DM1.cdsQry.FieldByName('FECAASEM').AsString +''', '
               +    ''''+DM1.cdsQry.FieldByName('FECAASS').AsString  +''', '
               +    'tmonid, flagvar, fcons, cntfmec, tdiardes, ctades, auxdes, docdes, ccosdes, '
               +    DM1.cdsQry5.FieldByname('MONTO_GIR').AsString+' cnthabemn, '
               +    'round('+DM1.cdsQry5.FieldByname('MONTO_GIR').AsString +'/cnttcambio,2) cnthabeme, '
               +    '0 cntdebemn, 0 cntdebeme, '
               +    'cntsaldmn, cntsaldme, campovar, cntts, cntpagado, cntmoddoc, 1 cntreg, modulo, cta_secu '
               +  'from cnt301 '
               + 'where ciaid=''02'' '
               +  ' and ( CNTANOMM like '+sAno+'||''%'' or CNTANOMM like '+sAno+'||''%'' )'
               +  ' and cntlote=''PRE'' and tdiarid=''27'' '
               +  ' and cuentaid like ''10%'' '
               +  ' and (cntnodoc=''OFI'+DM1.cdsQry5.FieldByname('PVSLNOFC').AsString+''' '
               +   ' or cntnodoc=''OFI'+Copy(DM1.cdsQry5.FieldByname('PVSLNOFC').AsString,5,7)+''') '
               +  ' and rownum=1 '
               + 'order by CNTCOMPROB, CNTDH, CNTREG';
              DM1.cdsQry2.Close;
              DM1.cdsQry2.DataRequest( xSQL );
              try
                 DM1.cdsQry2.Execute;
              except
              end;

              GeneraCNT300( DM1.cdsQry5.FieldByname('COMPROBANTE2').AsString );
          end;
      end
      else
      begin
          xSQL:='SELECT ciaid, pvslbennr, pvslsec, usuario, freg, pvslnvou, bancoid, forpagoid, '
               +   'pvslsaldo, pvsnombre, cntflag, pordes, fecpag, usupag, codrelcob, flaext, '
               +   'usuext, fecext, ofiext, codmotextdes, fecopeextdes, numopeextdes '
               + ' FROM PVS307 '
               +' WHERE PVSLBENNR='''+DM1.cdsQry5.FieldByname('LIQUIDACION').AsString+''' '
               +  ' and FECEXT >= '+quotedstr(formatdatetime(wFormatFecha,dtpFecIni.Date))
               +  ' and FECEXT <= '+quotedstr(formatdatetime(wFormatFecha,dtpFecFin.Date))
               +  ' and FLAEXT = ''S'' '
               +  ' and OFIEXT = '''+DM1.cdsQry5.FieldByname('PVSLNOFC').AsString+''' '
               +  ' and PVSLAGRID=''FPG''';
          DM1.cdsQry27.Close;
          DM1.cdsQry27.DataRequest( xSQL );
          DM1.cdsQry27.Open;

          if Copy(DM1.cdsQry5.FieldByname('FECEXT').AsString,4,2)=Copy(DM1.cdsQry27.FieldByname('fecopeextdes').AsString,4,2) then
             sResMes:='V'
          else
             sResMes:='F';

          while not DM1.cdsQry27.Eof do
          begin
              // Desembolso del Extorno
              xSQL:=
                'insert into cnt311pre( '
               +    'ciaid, tdiarid, cntcomprob, cntano, cntanomm, cntlote, cuentaid, clauxid, auxid, docid, cntserie, cntnodoc, '
               +    'cntglosa, cntdh, ccosid, cnttcambio, cntmtoori, cntmtoloc, cntmtoext, cntfemis, cntfvcmto, cntfcomp, cntestado, '
               +    'cntcuadre, cntfautom, cntuser, cntfreg, cnthreg, cntmm, cntdd, cnttri, cntsem, cntss, cntaatri, cntaasem, cntaass, '
               +    'tmonid, flagvar, fcons, cntfmec, tdiardes, ctades, auxdes, docdes, ccosdes, cntdebemn, cntdebeme, cnthabemn, '
               +    'cnthabeme, cntsaldmn, cntsaldme, campovar, cntts, cntpagado, cntmoddoc, cntreg, modulo, cta_secu ) '
               +'select ciaid, tdiarid, '''+DM1.cdsQry5.FieldByname('COMPROBANTE2').AsString+''' cntcomprob, '
               +    ''''+Copy( xPeriodo,1,4 )+''' cntano, '''+xPeriodo+''' cntanomm, ''EXTP'' cntlote, cuentaid, clauxid, auxid, '
               +    'docid, ''OFI'' cntserie, '''+DM1.cdsQry27.FieldByname('ofiext').AsString+''' cntnodoc, cntglosa, cntdh, '
               +    'ccosid, cnttcambio, '
               +    DM1.cdsQry27.FieldByName('pvslsaldo').AsString+' cntmtoori, '
               +    DM1.cdsQry27.FieldByName('pvslsaldo').AsString+' cntmtoloc, '
               +    'round('+DM1.cdsQry27.FieldByName('pvslsaldo').AsString+'/cnttcambio,2) cntmtoext, '
               +    'cntfemis, cntfvcmto, '
               +    ''''+DM1.cdsQry5.FieldByname('FECEXT').AsString+''' cntfcomp, '
               +    '''I'' cntestado, ''N'' cntcuadre, ''N'' cntfautom, '''+DM1.wUsuario+''' cntuser, TO_DATE(SYSDATE) cntfreg, '
               +    'SYSDATE cnthreg, '
               +    ''''+DM1.cdsQry.FieldByName('FECMES').AsString   +''', '
               +    ''''+DM1.cdsQry.FieldByName('FECDIA').AsString   +''', '
               +    ''''+DM1.cdsQry.FieldByName('FECTRIM').AsString  +''', '
               +    ''''+DM1.cdsQry.FieldByName('FECSEM').AsString   +''', '
               +    ''''+DM1.cdsQry.FieldByName('FECSS').AsString    +''', '
               +    ''''+DM1.cdsQry.FieldByName('FECAATRI').AsString +''', '
               +    ''''+DM1.cdsQry.FieldByName('FECAASEM').AsString +''', '
               +    ''''+DM1.cdsQry.FieldByName('FECAASS').AsString  +''', '
               +    'tmonid, flagvar, fcons, cntfmec, tdiardes, ctades, auxdes, docdes, ccosdes, '
               +    '0 cntdebemn, '
               +    '0 cntdebeme, '
               +    DM1.cdsQry27.FieldByName('pvslsaldo').AsString+' cnthabemn, '
               +    'round('+DM1.cdsQry27.FieldByName('pvslsaldo').AsString+'/cnttcambio,2) cnthabeme, '
               +    'cntsaldmn, cntsaldme, campovar, cntts, cntpagado, cntmoddoc, 2 cntreg, modulo, cta_secu '
               +  'from cnt301 '
               + 'where ciaid=''02'' and CNTANOMM like '+sAno+'||''%'' AND cntlote=''PRE'' and tdiarid=''27'' '
               +  ' and CNTGLOSA LIKE ''%''||'+DM1.cdsQry5.FieldByname('LIQUIDACION').AsString+'||''%'' '
               +  ' and CNTGLOSA LIKE ''%''||'''+Copy(DM1.cdsQry27.FieldByname('pvsnombre').AsString,1,20)+'''||''%'' '
               +  ' and cuentaid like ''469%'' '
               +  ' and rownum=1 ';
              DM1.cdsQry2.Close;
              DM1.cdsQry2.DataRequest( xSQL );
              try
                 DM1.cdsQry2.Execute;
              except
              end;

              xSQL:=
                'insert into cnt311pre( '
               +    'ciaid, tdiarid, cntcomprob, cntano, cntanomm, cntlote, cuentaid, clauxid, auxid, docid, cntserie, cntnodoc, '
               +    'cntglosa, cntdh, ccosid, cnttcambio, cntmtoori, cntmtoloc, cntmtoext, cntfemis, cntfvcmto, cntfcomp, cntestado, '
               +    'cntcuadre, cntfautom, cntuser, cntfreg, cnthreg, cntmm, cntdd, cnttri, cntsem, cntss, cntaatri, cntaasem, cntaass, '
               +    'tmonid, flagvar, fcons, cntfmec, tdiardes, ctades, auxdes, docdes, ccosdes, cntdebemn, cntdebeme, cnthabemn, '
               +    'cnthabeme, cntsaldmn, cntsaldme, campovar, cntts, cntpagado, cntmoddoc, cntreg, modulo, cta_secu ) '
               +'select ciaid, tdiarid, '''+DM1.cdsQry5.FieldByname('COMPROBANTE2').AsString+''' cntcomprob, '
               +    ''''+Copy( xPeriodo,1,4 )+''' cntano, '''+xPeriodo+''' cntanomm, ''EXTP'' cntlote, '
               +    'case when '''+sResMes+'''=''V'' then cuentaid else ''4691203'' end cuentaid,  '
               +    'clauxid, auxid, docid, ''OP'' cntserie, '
               +    ''''+DM1.cdsQry27.FieldByname('numopeextdes').AsString+''' cntnodoc, '
               +    'cntglosa, ''D'' cntdh, '
               +    'ccosid, cnttcambio, '
               +    DM1.cdsQry27.FieldByName('pvslsaldo').AsString+' cntmtoori, '
               +    DM1.cdsQry27.FieldByName('pvslsaldo').AsString+' cntmtoloc, '
               +    'round('+DM1.cdsQry27.FieldByName('pvslsaldo').AsString+'/cnttcambio,2) cntmtoext, '
               +    'TO_DATE('''+DM1.cdsQry27.FieldByname('fecopeextdes').AsString+''') cntfemis, '
               +    'TO_DATE('''+DM1.cdsQry27.FieldByname('fecopeextdes').AsString+''') cntfvcmto, '
               +    ''''+DM1.cdsQry5.FieldByname('FECEXT').AsString+''' cntfcomp, '
               +    '''I'' cntestado, ''N'' cntcuadre, ''N'' cntfautom, '''+DM1.wUsuario+''' cntuser, TO_DATE(SYSDATE) cntfreg, '
               +    'SYSDATE cnthreg, '
               +    ''''+DM1.cdsQry.FieldByName('FECMES').AsString   +''', '
               +    ''''+DM1.cdsQry.FieldByName('FECDIA').AsString   +''', '
               +    ''''+DM1.cdsQry.FieldByName('FECTRIM').AsString  +''', '
               +    ''''+DM1.cdsQry.FieldByName('FECSEM').AsString   +''', '
               +    ''''+DM1.cdsQry.FieldByName('FECSS').AsString    +''', '
               +    ''''+DM1.cdsQry.FieldByName('FECAATRI').AsString +''', '
               +    ''''+DM1.cdsQry.FieldByName('FECAASEM').AsString +''', '
               +    ''''+DM1.cdsQry.FieldByName('FECAASS').AsString  +''', '
               +    'tmonid, flagvar, fcons, cntfmec, tdiardes, ctades, auxdes, docdes, ccosdes, '
               +    DM1.cdsQry27.FieldByName('pvslsaldo').AsString+' cnthabemn, '
               +    'round('+DM1.cdsQry27.FieldByName('pvslsaldo').AsString+'/cnttcambio,2) cnthabeme, '
               +    '0 cntdebemn, 0 cntdebeme, '
               +    'cntsaldmn, cntsaldme, campovar, cntts, cntpagado, cntmoddoc, 1 cntreg, modulo, cta_secu '
               +  'from cnt301 '
               + 'where ciaid=''02'' '
               +  ' and ( CNTANOMM like '+sAno+'||''%'' )'
               +  ' and cntlote=''PRE'' and tdiarid=''27'' '
               +  ' and cuentaid like ''10%'' '
               +  ' and (cntnodoc=''OFI'+DM1.cdsQry5.FieldByname('PVSLNOFC').AsString+''' '
               +   ' or cntnodoc=''OFI'+Copy(DM1.cdsQry5.FieldByname('PVSLNOFC').AsString,5,7)+''') '
               +  ' and rownum=1 '
               + 'order by CNTCOMPROB, CNTDH, CNTREG';
              DM1.cdsQry2.Close;
              DM1.cdsQry2.DataRequest( xSQL );
              try
                 DM1.cdsQry2.Execute;
              except
              end;

              DM1.cdsQry27.Next;
          end;

          GeneraCNT300_p( DM1.cdsQry5.FieldByname('COMPROBANTE2').AsString );
      end;

      DM1.cdsQry5.Next;
   end;
// Fin   HPC_201705_PRE : Contabilizar Extornos de Desembolsos o Liquidaciones

   DM1.cdsQry6.IndexFieldNames:='';

   Screen.Cursor:=crDefault;
   MessageDlg('Se Contabilizo con EXITO !!!', mtConfirmation, [mbOk], 0);
   prbAvance.Position:=0;
   prbAvance.Visible:=False;
end;

procedure TFContaExtorno.GeneraCNT300( sComprob : String );
var
   xSQL : String;
begin
   xSQL:='INSERT INTO '+xCNT300+' ';
   xSQL:=xSQL+ '( CIAID, TDIARID, CNTANOMM, CNTCOMPROB, CNTLOTE, ';
   xSQL:=xSQL+ 'CNTGLOSA, CNTTCAMBIO, CNTFCOMP, CNTESTADO, CNTCUADRE, ';
   xSQL:=xSQL+ 'CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, CNTTRI, ';
   xSQL:=xSQL+ 'CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, ';
   xSQL:=xSQL+ 'TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, ';
   xSQL:=xSQL+ 'CNTTS, DOCMOD, MODULO ) ' ;

   xSQL:=xSQL+ 'SELECT A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB,  A.CNTLOTE, ';
   xSQL:=xSQL+ '''EXTORNO DE PREVISION - ''||MAX(CNTNODOC) CNTGLOSA, ';
   xSQL:=xSQL+ 'MAX( NVL(A.CNTTCAMBIO, 0 )), ';
   xSQL:=xSQL+ 'A.CNTFCOMP, ''I'', ''N'', ';
   xSQL:=xSQL+ 'MAX(CNTUSER), MAX( CNTFREG ), MAX( CNTHREG ), A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI, ';
   xSQL:=xSQL+ 'A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS, ';
   xSQL:=xSQL+ 'MAX( CASE WHEN A.CNTREG = 1 THEN A.TMONID  END ) TMONID, '' '', ';
   xSQL:=xSQL+ 'A.TDIARDES, ';
   xSQL:=xSQL+ 'SUM(A.CNTDEBEMN), SUM(A.CNTDEBEME), SUM(A.CNTHABEMN), SUM(A.CNTHABEME), ';
   xSQL:=xSQL+ 'MAX( CNTTS ), MAX( CNTMODDOC), MAX( MODULO ) ';
   xSQL:=xSQL+ 'FROM '+xCNT311+' A ';
   xSQL:=xSQL+ 'WHERE A.CIAID=''02'' AND ';
   xSQL:=xSQL+       'A.TDIARID=''27'' AND ';
   xSQL:=xSQL+       'A.CNTANOMM='''+xPeriodo+''' ';
   xSQL:=xSQL+'AND A.CNTCOMPROB='''+sComprob+''' ';
   xSQL:=xSQL+ 'GROUP BY A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, A.CNTLOTE, ';
   xSQL:=xSQL+ 'A.CNTFCOMP, A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI,  ';
   xSQL:=xSQL+ 'A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS, ';
   xSQL:=xSQL+ 'A.TDIARDES';

   DM1.cdsQry2.Close;
   DM1.cdsQry2.DataRequest( xSQL );
   try
     DM1.cdsQry2.Execute;
   except

   end;
end;


// Inicio HPC_201705_PRE : Contabilizar Extornos de Desembolsos o Liquidaciones
procedure TFContaExtorno.GeneraCNT300_P( sComprob : String );
var
   xSQL : String;
begin
   xSQL:='INSERT INTO '+xCNT300+' ';
   xSQL:=xSQL+ '( CIAID, TDIARID, CNTANOMM, CNTCOMPROB, CNTLOTE, ';
   xSQL:=xSQL+ 'CNTGLOSA, CNTTCAMBIO, CNTFCOMP, CNTESTADO, CNTCUADRE, ';
   xSQL:=xSQL+ 'CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, CNTTRI, ';
   xSQL:=xSQL+ 'CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, ';
   xSQL:=xSQL+ 'TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, ';
   xSQL:=xSQL+ 'CNTTS, DOCMOD, MODULO ) ' ;

   xSQL:=xSQL+ 'SELECT A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB,  A.CNTLOTE, ';
   xSQL:=xSQL+ '''EXTORNO DE PREVISION - ''||MAX(CASE WHEN CNTDH=''H'' THEN CNTNODOC ELSE '' '' END) CNTGLOSA, ';
   xSQL:=xSQL+ 'MAX( NVL(A.CNTTCAMBIO, 0 )), ';
   xSQL:=xSQL+ 'A.CNTFCOMP, ''I'', ''N'', ';
   xSQL:=xSQL+ 'MAX(CNTUSER), MAX( CNTFREG ), MAX( CNTHREG ), A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI, ';
   xSQL:=xSQL+ 'A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS, ';
   xSQL:=xSQL+ 'MAX( CASE WHEN A.CNTREG = 1 THEN A.TMONID  END ) TMONID, '' '', ';
   xSQL:=xSQL+ 'A.TDIARDES, ';
   xSQL:=xSQL+ 'SUM(A.CNTDEBEMN), SUM(A.CNTDEBEME), SUM(A.CNTHABEMN), SUM(A.CNTHABEME), ';
   xSQL:=xSQL+ 'MAX( CNTTS ), MAX( CNTMODDOC), MAX( MODULO ) ';
   xSQL:=xSQL+ 'FROM '+xCNT311+' A ';
   xSQL:=xSQL+ 'WHERE A.CIAID=''02'' AND ';
   xSQL:=xSQL+       'A.TDIARID=''27'' AND ';
   xSQL:=xSQL+       'A.CNTANOMM='''+xPeriodo+''' ';
   xSQL:=xSQL+'AND A.CNTCOMPROB='''+sComprob+''' ';
   xSQL:=xSQL+ 'GROUP BY A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, A.CNTLOTE, ';
   xSQL:=xSQL+ 'A.CNTFCOMP, A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI,  ';
   xSQL:=xSQL+ 'A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS, ';
   xSQL:=xSQL+ 'A.TDIARDES';

   DM1.cdsQry2.Close;
   DM1.cdsQry2.DataRequest( xSQL );
   try
     DM1.cdsQry2.Execute;
   except

   end;
end;
// Fin   HPC_201705_PRE : Contabilizar Extornos de Desembolsos o Liquidaciones



procedure TFContaExtorno.fcShapeBtn7Click(Sender: TObject);
begin
   ReporteContabilizaCredito( 'CNT311PRE', 'EXTP', xPeriodo );
end;


procedure TFContaExtorno.ReporteContabilizaCredito( cTabla, cLote, xPeriodo : String);
var
   xSQL, cCampo : String;
// Inicio HPC_201705_PRE : Contabilizar Extornos de Desembolsos o Liquidaciones
   sOrigenONP, sTotComp : String;
// Fin    HPC_201705_PRE : Contabilizar Extornos de Desembolsos o Liquidaciones
begin
   Screen.Cursor:=crHourGlass;

   cLote:='EXTP';
// Inicio HPC_201705_PRE : Contabilizar Extornos de Desembolsos o Liquidaciones
   xSQL:='SELECT CIAID, TDIARID, CNTANOMM, CNTCOMPROB '
        +'FROM '+cTabla+' '
        +'WHERE CIAID>=''02'' AND CNTANOMM = '''+xPeriodo+''' '
        +  'AND TDIARID IN ( ''27'' ) AND CNTLOTE LIKE '''+cLote+'%'' '
        +' GROUP BY CIAID, TDIARID, CNTANOMM, CNTCOMPROB ';
   DM1.cdsQry2.Close;
   DM1.cdsQry2.DataRequest(xSQL);
   DM1.cdsQry2.Open;

   sTotComp:= IntToStr(DM1.cdsQry2.recordCount);
   DM1.cdsQry2.Close;
// Fin   HPC_201705_PRE : Contabilizar Extornos de Desembolsos o Liquidaciones

   xSQL:='SELECT CIAID, TDIARID, CNTANOMM, CNTCOMPROB, CNTDH, CUENTAID, DOCID, CNTSERIE, '
        +  'CNTNODOC, sum( CNTDEBEMN ) CNTDEBEMN, sum( CNTHABEMN ) CNTHABEMN, '
        +  'CNTLOTE '
        +'FROM '+cTabla+' '
        +'WHERE CIAID>=''02'' AND CNTANOMM = '''+xPeriodo+''' '
        +  'AND TDIARID IN ( ''27'' ) AND CNTLOTE LIKE '''+cLote+'%'' '
        +' GROUP BY CIAID, TDIARID, CNTANOMM, CNTCOMPROB, CNTDH, CUENTAID, DOCID, CNTSERIE, CNTNODOC, CNTLOTE '
        +'ORDER BY CIAID, TDIARID, CNTCOMPROB,CNTDH,CUENTAID';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSQL);
   DM1.cdsQry.Open;

   Screen.Cursor:=crDefault;
   If DM1.cdsQry.RecordCount>0 Then
   begin
      //imprime el reporte contable
      ppdb1.DataSource :=nil;
      ppr1.DataPipeline:=nil;
      ppdb1.DataSource :=DM1.dsQry;
      ppr1.DataPipeline:=ppdb1;
// Inicio HPC_201705_PRE : Contabilizar Extornos de Desembolsos o Liquidaciones
      pplTotCom.Caption:=sTotComp;
      pplTotExt.Caption:=IntToStr(DM1.cdsQry5.recordCount);
// Fin    HPC_201705_PRE : Contabilizar Extornos de Desembolsos o Liquidaciones
      ppr1.Print;
      ppr1.Stop;
      ppdb1.DataSource :=nil;
      ppr1.DataPipeline:=nil;

      // se cerciora si hay diferencia entre debe y haber
      xSql:='SELECT CNTCOMPROB, SUM(CNTDEBEMN), SUM(CNTHABEMN) FROM (' + xSql
          +') GROUP BY CNTCOMPROB HAVING SUM(CNTDEBEMN) <> SUM(CNTHABEMN)';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSQL);
      DM1.cdsQry.Open;
      If DM1.cdsQry.RecordCount>0 Then
         ShowMessage('No hay igualdad entre el Debe y Haber');
   end
   else
   begin
      if cTabla='CNT311' then
      begin
        xSQL:='SELECT ciaid, tdiarid, cntcomprob, cntanomm, cntlote, cntglosa, cnttcambio, cntfcomp, cntestado, cntcuadre, '
             +       'cntfautom, cntuser, cntfreg, cnthreg, cntano, cntmm, cntdd, cnttri, cntsem, cntss, cntaatri, cntaasem, '
             +       'cntaass, tmonid, flagvar, fcons, cntfmec, tdiardes, cntdebemn, cntdebeme, cnthabemn, cnthabeme, '
             +       'cntsaldmn, cntsaldme, cntts, docmod, modulo '
             + ' FROM CNT300 '
             +'WHERE CIAID>=''02'' AND CNTANOMM = '''+xPeriodo+''' '
             +  'AND TDIARID IN ( ''27'' ) AND CNTLOTE LIKE '''+cLote+'%'' '
             +  'AND CNTESTADO=''P'' '
             +'ORDER BY CIAID, TDIARID, CNTCOMPROB';
        DM1.cdsQry.Close;
        DM1.cdsQry.DataRequest(xSQL);
        DM1.cdsQry.Open;

        If DM1.cdsQry.RecordCount>0 Then
        begin
           ShowMessage('Transferencia ya fue Aceptada por Contabilidad');
           xSQL:='SELECT ciaid, tdiarid, cntcomprob, cntano, cntanomm, cntlote, cuentaid, clauxid, auxid, docid, cntserie, '
                +       'cntnodoc, cntglosa, cntdh, ccosid, cnttcambio, cntmtoori, cntmtoloc, cntmtoext, cntfemis, cntfvcmto, '
                +       'cntfcomp, cntestado, cntcuadre, cntfautom, cntuser, cntfreg, cnthreg, cntmm, cntdd, cnttri, cntsem, '
                +       'cntss, cntaatri, cntaasem, cntaass, tmonid, flagvar, fcons, cntfmec, tdiardes, ctades, auxdes, docdes, '
                +       'ccosdes, cntdebemn, cntdebeme, cnthabemn, cnthabeme, cntsaldmn, cntsaldme, campovar, cntts, cntpagado, '
                +       'cntmoddoc, cntreg, modulo, cta_secu '
                + ' FROM CNT301 '
                +'WHERE CIAID>=''02'' AND CNTANOMM = '''+xPeriodo+''' '
                +  'AND TDIARID IN ( ''27'' ) AND CNTLOTE LIKE '''+cLote+'%'' '
                +'ORDER BY CIAID, TDIARID, CNTCOMPROB, CNTREG';
           DM1.cdsQry.Close;
           DM1.cdsQry.DataRequest(xSQL);
           DM1.cdsQry.Open;
           ppdb1.DataSource :=nil;
           ppr1.DataPipeline:=nil;
           ppdb1.DataSource :=DM1.dsQry;
           ppr1.DataPipeline:=ppdb1;
           //ppd1.ShowModal;
// Inicio HPC_201705_PRE : Contabilizar Extornos de Desembolsos o Liquidaciones
           pplTotCom.Caption:=sTotComp;
           pplTotExt.Caption:=IntToStr(DM1.cdsQry5.recordCount);
// Fin    HPC_201705_PRE : Contabilizar Extornos de Desembolsos o Liquidaciones
           ppr1.Print;
           ppr1.Stop;
           ppdb1.DataSource :=nil;
           ppr1.DataPipeline:=nil;
        end
        else
           ShowMessage('No se ha Transferido Contabilización');

     end
     else
        ShowMessage('No se ha Generado Contabilización')
  end;
end;


procedure TFContaExtorno.fcShpDevoTransClick(Sender: TObject);
var
   xSQL, xNumMax, xNumMin : String;
   xCambioNum : String;
   NumComp, NumCompAnt : String;
   cLote, cOrigen : String;
begin
   If MessageDlg('¿Está Seguro de Transferir Contabilidad ( '+cLote+ ' ) ?',mtconfirmation,[mbYes,MbNo],0)=mrNo then
      Begin
         Screen.Cursor:=crDefault;
         Exit;
      end;

   Screen.Cursor:=crHourGlass;
   cLote:='EXTP';
   cOrigen:='27';

   xSQL:='Select CNTCOMPROB from CNT300 A '
        +'where CIAID=''02'' AND TDIARID='''+cOrigen+''' and CNTANOMM='''+xPeriodo+''' '
        +  'and CNTLOTE='''+cLote+'''';
   DM1.cdsQry2.Close;
   DM1.cdsQry2.DataRequest( xSQL );
   try
     DM1.cdsQry2.Open;
   except
   end;

   if DM1.cdsQry2.Recordcount>0 then
   begin
      If MessageDlg('Asientos Generados fueron Transferidos a Contabilidad. ¿Desea Eliminar Asientos Transferidos?',mtconfirmation,[mbYes,MbNo],0)=mrNo then
      Begin
         Screen.Cursor:=crDefault;
         Exit;
      end;

      xSQL:='Select CNTCOMPROB from CNT300 A '
           +'where CIAID=''02'' AND TDIARID='''+cOrigen+''' and CNTANOMM='''+xPeriodo+''' '
           +  'and CNTLOTE='''+cLote+''' and CNTESTADO=''P''';
      DM1.cdsQry2.Close;
      DM1.cdsQry2.DataRequest( xSQL );
      try
         DM1.cdsQry2.Open;
      except
      end;

      if DM1.cdsQry2.Recordcount>0 then
      begin
         Screen.Cursor:=crDefault;
         MessageDlg('Asientos ya fueron Aceptados por Contabilidad. NO se pueden Eliminar !!!', mtError, [mbOk], 0);
         Exit
      end;
   end;

   xSQL:='Select CNTCOMPROB from CNT300 A '
        +'where CIAID=''02'' AND TDIARID='''+cOrigen+'''  and CNTANOMM='''+xPeriodo+''' '
        +  'and CNTLOTE='''+cLote+'''';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest( xSQL );
   try
      DM1.cdsQry.Open;
   except
      Exit;
   end;

   if DM1.cdsQry.RecordCount>0 Then
   begin
       If MessageDlg('Existen Registros Transferidos de Cobranzas. ¿Desea continuar con Transferencia?',mtconfirmation,[mbYes,MbNo],0)=mrNo then
       Begin
          Screen.Cursor:=crDefault;
          Exit;
       end;
       xSQL:='Delete from CNT300 '
        +'where CIAID=''02'' AND TDIARID='''+cOrigen+'''  and CNTANOMM='''+xPeriodo+''' '
        +  'and CNTLOTE='''+cLote+'''';
       DM1.cdsQry2.Close;
       DM1.cdsQry2.DataRequest( xSQL );
       try
          DM1.cdsQry2.Execute;
       except
       end;

       xSQL:='Delete from CNT311 '
        +'where CIAID=''02'' AND TDIARID='''+cOrigen+'''  and CNTANOMM='''+xPeriodo+''' '
        +  'and CNTLOTE='''+cLote+'''';
       DM1.cdsQry2.Close;
       DM1.cdsQry2.DataRequest( xSQL );
       try
         DM1.cdsQry2.Execute;
       except
       end;

      xSQL:='Delete from CNT301 '
        +'where CIAID=''02'' AND TDIARID='''+cOrigen+''' and CNTANOMM='''+xPeriodo+''' '
        +  'and CNTLOTE='''+cLote+'''';
      DM1.cdsQry2.Close;
      DM1.cdsQry2.DataRequest( xSQL );
      try
         DM1.cdsQry2.Execute;
      except
      end;

   end;

   // Para poder obtener el xNumMin y xNumMax
   xSQL:='SELECT NVL(MAX( CNTCOMPROB ),''0'') NUMMAX, NVL(MIN( CNTCOMPROB ),''0'') NUMMIN '
        +  'FROM CNT311PRE '
        + 'WHERE CIAID=''02'' AND CNTANOMM = '''+xPeriodo+''' '
        +   'AND TDIARID='''+cOrigen+''' and CNTLOTE='''+cLote+''' '
        + 'ORDER BY TDIARID, CNTCOMPROB';
    DM1.cdsQry.Close;
    DM1.cdsQry.DataRequest(xSQL);
    DM1.cdsQry.Open;

    xNumMax:=DM1.cdsQry.FieldByName('NUMMAX').AsString;
    xNumMin:=DM1.cdsQry.FieldByName('NUMMIN').AsString;

    xSQL:='select NVL(MAX( CNTCOMPROB ),''0'') MAXIMO FROM CNT300 '
         +'where CIAID=''02'' AND TDIARID in ('''+cOrigen+''') and CNTANOMM='''+xPeriodo+''' '
         +'order by CIAID, TDIARID, CNTCOMPROB';
    DM1.cdsQry2.Close;
    DM1.cdsQry2.DataRequest( xSQL );
    try
       DM1.cdsQry2.oPEN;
    except
    end;

    NUMCOMP:=DM1.cdsQry2.FieldByName('MAXIMO').ASSTRING;
    NUMCOMP:= DM1.strzero(inttostr(strtoint(numcomp)+1),10);
    NUMCOMPANT:=xNumMin;

    xCambioNum := 'F';

    WHILE NUMCOMPANT<=xNumMax do
    BEGIN
       xSQL:='update CNT300PRE '
            +   'set CNTCOMPROB = '''+'RF'+Copy(NUMCOMP,3,8)+''' '
            + 'where CIAID=''02'' AND TDIARID='''+cOrigen+''' and CNTANOMM='''+xPeriodo+''' '
            +   'and CNTLOTE='''+cLote+''' '
	          +   'and CNTCOMPROB='''+NUMCOMPANT+''' ';
       DM1.cdsQry.Close;
       DM1.cdsQry.DataRequest( xSQL );
       try
          DM1.cdsQry.Execute;
       except
       end;

       xSQL:='update CNT311PRE '
            +   'set CNTCOMPROB = '''+'RF'+Copy(NUMCOMP,3,8)+''' '
            + 'where CIAID=''02'' AND TDIARID='''+cOrigen+''' and CNTANOMM='''+xPeriodo+''' '
            +   'and CNTLOTE='''+cLote+''' '
            +   'and CNTCOMPROB='''+NUMCOMPANT+''' ';
       DM1.cdsQry.Close;
       DM1.cdsQry.DataRequest( xSQL );
       try
          DM1.cdsQry.Execute;
       except
       end;
       NUMCOMP:=DM1.strzero(inttostr(strtoint(NUMCOMP)+1),10);
       NUMCOMPANT:=DM1.strzero(inttostr(strtoint(NUMCOMPANT)+1),10);
       xCambioNum := 'S';
    END;

    if xCambioNum='S' then
    begin
      xSQL:='update CNT300PRE '
           +   'set CNTCOMPROB = ''00''||SUBSTR(CNTCOMPROB,3,8)'+' '
           + 'where CIAID=''02'' AND TDIARID='''+cOrigen+''' and CNTANOMM='''+xPeriodo+''' '
           +   'and CNTLOTE='''+cLote+''' ';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest( xSQL );
      try
         DM1.cdsQry.Execute;
      except
      end;

      xSQL:='update CNT311PRE '
           +   'set CNTCOMPROB = ''00''||SUBSTR(CNTCOMPROB,3,8)'+' '
           + 'where CIAID=''02'' AND TDIARID='''+cOrigen+''' and CNTANOMM='''+xPeriodo+''' '
           +   'and CNTLOTE='''+cLote+''' ';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest( xSQL );
      try
         DM1.cdsQry.Execute;
      except
      end;

    end;

   // Valida si no hay repetidos antes de insertarlos en la tabla xCnt300r
   xSQL:='SELECT MAX( CNTCOMPROB ) NUMMAX, MIN( CNTCOMPROB ) NUMMIN FROM CNT311PRE '
        +'WHERE CIAID=''02'' AND CNTANOMM = '''+xPeriodo+''' '
        +  'AND TDIARID in ('''+cOrigen+''') '
        +  'and CNTLOTE LIKE '''+cLote+'%'' '
        +'ORDER BY TDIARID, CNTCOMPROB';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSQL);
   DM1.cdsQry.Open;

   xNumMax:=DM1.cdsQry.FieldByName('NUMMAX').AsString;
   xNumMin:=DM1.cdsQry.FieldByName('NUMMIN').AsString;

   xSQL:='SELECT ciaid, tdiarid, cntcomprob, cntanomm, cntlote FROM CNT300 '
        +'WHERE CIAID=''02'' AND CNTANOMM = '''+xPeriodo+''' '
        +  'AND TDIARID='''+cOrigen+''' '
        +  'AND CNTCOMPROB BETWEEN '''+xNumMin+''' AND '''+xNumMax+''' '
        +'ORDER BY TDIARID, CNTCOMPROB';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSQL);
   DM1.cdsQry.Open;

   if DM1.cdsQry.RecordCount>0 Then
   begin
      MessageDlg('Error : En Contabilidad existen comprobantes con el mismo Número, Debe volver a Transferir Contabilidad !!!', mtError, [mbOk], 0);
      Exit;
   end;

   // transferir
   xSQL:='insert into CNT300 '
        +'select ciaid, tdiarid, cntcomprob, cntanomm, cntlote, cntglosa, cnttcambio, cntfcomp, cntestado, cntcuadre, '
        +    'cntfautom, cntuser, cntfreg, cnthreg, cntano, cntmm, cntdd, cnttri, cntsem, cntss, cntaatri, cntaasem, '
        +    'cntaass, tmonid, flagvar, fcons, cntfmec, tdiardes, cntdebemn, cntdebeme, cnthabemn, cnthabeme, cntsaldmn, '
        +    'cntsaldme, cntts, docmod, modulo '
        + 'from CNT300PRE '
        +'where CIAID=''02'' AND TDIARID='''+cOrigen+''' and CNTANOMM='''+xPeriodo+''' '
        +  'and CNTLOTE='''+cLote+''' '
        +'order by CIAID, TDIARID, CNTCOMPROB';
   DM1.cdsQry2.Close;
   DM1.cdsQry2.DataRequest( xSQL );
   try
      DM1.cdsQry2.Execute;
   except
   end;

   xSQL:='insert into CNT311 '
        +'select ciaid, tdiarid, cntcomprob, cntano, cntanomm, cntlote, cuentaid, clauxid, auxid, docid, cntserie, '
        +    'cntnodoc, cntglosa, cntdh, ccosid, cnttcambio, cntmtoori, cntmtoloc, cntmtoext, cntfemis, cntfvcmto, '
        +    'cntfcomp, cntestado, cntcuadre, cntfautom, cntuser, cntfreg, cnthreg, cntmm, cntdd, cnttri, cntsem, '
        +    'cntss, cntaatri, cntaasem, cntaass, tmonid, flagvar, fcons, cntfmec, tdiardes, ctades, auxdes, docdes, '
        +    'ccosdes, cntdebemn, cntdebeme, cnthabemn, cnthabeme, cntsaldmn, cntsaldme, campovar, cntts, cntpagado, '
        +    'cntmoddoc, cntreg, modulo, cta_secu '
        + 'from CNT311PRE '
        +'where CIAID=''02'' AND TDIARID='''+cOrigen+''' and CNTANOMM='''+xPeriodo+''' '
        +  'and CNTLOTE='''+cLote+''' '
        +'order by CIAID, TDIARID, CNTCOMPROB';
   DM1.cdsQry2.Close;
   DM1.cdsQry2.DataRequest( xSQL );
   try
      DM1.cdsQry2.Execute;
   except
   end;

   Screen.Cursor:=crDefault;
   MessageDlg('La Transferencia Exitosa !!!', mtConfirmation, [mbOk], 0);
end;

procedure TFContaExtorno.fcShapeBtn5Click(Sender: TObject);
begin
   ReporteContabilizaCredito( 'CNT311', 'EXTP', xPeriodo );
end;

procedure TFContaExtorno.fcShapeBtn2Click(Sender: TObject);
begin
  self.Close;
end;

procedure TFContaExtorno.FormCreate(Sender: TObject);
var
   xSQL : String;
begin
// Inicio HPC_201705_PRE : Contabilizar Extornos de Desembolsos o Liquidaciones
   xSQL:='SELECT A.PVSFANUL FECEXT, PVSLBENNR LIQUIDACION, '
        +  '(select MAX(FORPAGOID) FORPAGOID FROM PVS307 B WHERE PVSLBENNR = A.PVSLBENNR) TIPDESEID, '
        +  '(select MAX(G.TIPDESEDES) FROM PVS307 F, CRE104 G  WHERE PVSLBENNR = A.PVSLBENNR AND FORPAGOID=TIPDESEID ) TIPDESEDES, '
        +  'A.MONLIQBEN MONTO_OTO, A.MONPAG MONTO_GIR, 1, ''          '' COMPROBANTE, ''          '' COMPROBANTE2, '
        +  'A.MONDEV MONTO_DEV, '
        +  '( select MAX(PVSLNOFC) PVSLNOFC FROM PVS307 B WHERE PVSLBENNR = A.PVSLBENNR ) PVSLNOFC, '
        +  'NUMOPEBAN, FECOPEBAN '
        +'FROM PVS306 A '
        +'WHERE A.PVSFANUL>='+quotedstr(formatdatetime(wFormatFecha,dtpFecIni.Date))
        + ' AND A.PVSFANUL<='+quotedstr(formatdatetime(wFormatFecha,dtpFecFin.Date))
        + ' AND A.PVSESTLIQ IN (''04'', ''13'') and PVSLBENNR=''XYZ'' '
        +'ORDER BY A.PVSFANUL, PVSLBENNR ';
   DM1.cdsQry5.Close;
   DM1.cdsQry5.DataRequest( xSQL );
   DM1.cdsQry5.Open;

   dbgConta.Selected.Clear;
   dbgConta.Selected.Add('TIPO'#9'4'#9'Tipo'#9#9);
   dbgConta.Selected.Add('FECEXT'#9'10'#9'Fecha~Extorno'#9#9);
   dbgConta.Selected.Add('LIQUIDACION'#9'12'#9'Liquidación'#9#9);
   dbgConta.Selected.Add('PVSLNOFC'#9'10'#9'Oficio'#9#9);
   dbgConta.Selected.Add('TIPDESEDES'#9'20'#9'Tipo~Desembolso'#9#9);
   dbgConta.Selected.Add('MONTO_OTO'#9'13'#9'Monto~Liquidado'#9#9);
   dbgConta.Selected.Add('MONTO_DEV'#9'10'#9'Monto~Devolución'#9#9);
   dbgConta.Selected.Add('MONTO_GIR'#9'13'#9'Monto~Desembolsado'#9#9);
   dbgConta.Selected.Add('REGISTROS'#9'10'#9'Registros'#9#9);
   dbgConta.Selected.Add('COMPROBANTE'#9'12'#9'Comprobante'#9#9);
   dbgConta.ApplySelected;
end;
// Fin    HPC_201705_PRE : Contabilizar Extornos de Desembolsos o Liquidaciones

end.
