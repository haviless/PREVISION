Unit PRE936;
// Inicio Uso Estándares         : 01/08/2011
// Unidad                        : PRE936
// Formulario                    : Fctaindres
// Fecha de Creación             : 2002
// Autor                         : Área de Desarrollo DM
// Objetivo                      : Resumen de Saldos de Cuentas Individuales con Fecha de Resolución

// Actualizaciones:

// HPP_200906_PRE realizado por IREVILLA
// HPC_201102_PRE
// HPP_201001_PRE
// HPP_201102_PRE
// HPC_201302_PRE  : Se valida el spinedit "seAnio" para que su maximo valor sea 2020
// SPP_201303_PRE  : El pase a producción se realiza a partir del HPC_201302_PRE
// HPC_201402_PRE  : Cambio de columna para criterio de filtro de años de servicio.

// HPC_201203_PRE: Por Isaac Revilla.
//                 Fecha: 15/03/2012
//                 Se retira la ejecución del SP_ACT_TSERV_CTAIND_LOTE. Este procedimiento se ejecutara solo 
//                 una vez y sera el dia que se calcule la cuenta invidual.
// DPP_201203_PRE: Se realiza el pase a producción a partir del HPC_201203_PRE
// HPC_201307_PRE : Se añade proceso e impresión de reporte ultimo 12 meses
// SPP_201401_PRE : Se realiza el pase a producción a partir del pase HPC_201307_PRE
// HPC_201402_PRE : Cambio de logo en los reportes de cuenta individual.
// SPP_201403_PRE : Se realiza el pase a producción a partir del pase HPC_201402_PRE.
// HPC_201508_PRE : Se añade columna con el monto CCI
// HPC_201708_PRE : MODIFICAR REPORTE DE ACTIVOS POR EDAD Y SEXO AL CIERRE DE CADA MES
// HPC_201709_PRE : Validar que el control del campo acumulado se ejecute solo si es mayor a octubre 2017

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, Spin, DB, DBClient,
   ppCtrls, ppBands, ppVar, ppPrnabl, ppClass, ppCache, ppProd, ppReport,
   ppComm, ppRelatv, ppDB, ppDBPipe, ExtCtrls, wwExport, shellapi,
   ppParameter, ppEndUsr, ppChrt, ppChrtDP, TeEngine, Series, TeeProcs,
   jpeg, Chart, ppSubRpt, ppStrtch, TeeFunci;  // SPP_201401_PRE

Type
   TFctaindres = Class(TForm)
      //Inicio: SPP_201401_PRE
      // GroupBox1: TGroupBox;
      // Label2: TLabel;
      // Label3: TLabel;
      // seAnio: TSpinEdit;
      // seMes: TSpinEdit;
      // btnprocesar: TBitBtn;
      // Label1: TLabel;
      // Label4: TLabel;
      // BitBtn1: TBitBtn;
      // BitBtn2: TBitBtn;
      // dbgprevio: TwwDBGrid;
      //Fin: SPP_201401_PRE
      ppDB1: TppDBPipeline;
      ppReport1: TppReport;
      // btnDetalle: TBitBtn; SPP_201401_PRE
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLine2: TppLine;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    //Inicio: SPP_201401_PRE
    // ppLabel13: TppLabel;
    // ppLabel14: TppLabel; 
    // ppLabel15: TppLabel;
    // ppLabel16: TppLabel; 
    // ppSystemVariable1: TppSystemVariable; 
    // ppSystemVariable2: TppSystemVariable; 
    //Fin: SPP_201401_PRE
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLine1: TppLine;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppLine5: TppLine;
    ppDBText9: TppDBText;
    // Inicio: HPC_201508_PRE
    // ppFooterBand1: TppFooterBand;
    // Fin: HPC_201508_PRE
    ppShape3: TppShape;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    // bbtnxAnosServicio: TBitBtn; SPP_201401_PRE
    ppReport2: TppReport;
    ppParameterList2: TppParameterList;
    Chart1: TChart;
    Series1: TPieSeries;
    // Image1: TImage; SPP_201401_PRE
    ppDesigner1: TppDesigner;
    ppdbTotales: TppDBPipeline;
    ppHeaderBand2: TppHeaderBand;
    ppLine7: TppLine;
    ppLabel3: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel26: TppLabel;
//Inicio: SPP_201401_PRE
    // ppLabel27: TppLabel; 
    // ppSystemVariable3: TppSystemVariable; 
//Fin: SPP_201401_PRE
    ppDBText19: TppDBText;
    ppLabel25: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText12: TppDBText;
    ppDBText20: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc12: TppDBCalc;
    ppLine6: TppLine;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppImage3: TppImage;
    ppDetailBand3: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    //Inicio: SPP_201401_PRE
    pnlUlt12Meses: TPanel;
    Chart2: TChart;
    Series2: TFastLineSeries;
    TeeFunction1: TAddTeeFunction;
    BitBtn3: TBitBtn;
    sttitulo: TStaticText;
    BitBtn4: TBitBtn;
    gbprincipal: TGroupBox;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    seAnio: TSpinEdit;
    seMes: TSpinEdit;
    btnprocesar: TBitBtn;
    bbtnxAnosServicio: TBitBtn;
    btnUlt12Meses: TBitBtn;
    dbgprevio: TwwDBGrid;
    rgult12Meses: TRadioGroup;
    btnDetalle: TBitBtn;
    btnimprimir: TBitBtn;
    BitBtn1: TBitBtn;
    Image1: TImage;
    Image2: TImage;
    pprgraficos: TppReport;
    ppDetailBand4: TppDetailBand;
    ppImage1: TppImage;
    ppLine9: TppLine;
    pplUsuario: TppLabel;
    pplTitulo: TppLabel;
    pplUsuario1: TppLabel;
    pplusuario2: TppLabel;
    ppImage4: TppImage;
    ppLabel13: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppImage5: TppImage;
    ppLabel14: TppLabel;
    ppLabel27: TppLabel;
    ppLabel29: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppImage2: TppImage;
    ppLabel28: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    ppSystemVariable9: TppSystemVariable;
    // Inicio: HPC_201508_PRE
    ppLabel32: TppLabel;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppSummaryBand3: TppSummaryBand;
    // Fin: HPC_201508_PRE
    //
   Procedure btnprocesarClick(Sender: TObject);
    Procedure BitBtn1Click(Sender: TObject);
    // Procedure BitBtn2Click(Sender: TObject); SPP_201401_PRE
    Procedure btnimprimirClick(Sender: TObject);
    Procedure btnDetalleClick(Sender: TObject);
    procedure bbtnxAnosServicioClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnUlt12MesesClick(Sender: TObject);
    procedure rgult12MesesClick(Sender: TObject);
    procedure limpiar;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    //Fin: SPP_201401_PRE
   Private
    { Private declarations }
   Public
      xFecUlt: TDate;

      xFiltroSeleccionado : String;
   
    { Public declarations }
   End;

Var
   Fctaindres: TFctaindres;
   wwAcuMesAnt, wwCapital, wwIntCapAcu, wwTotAportes, wwBonos, wwTotCuentaInd: Double;
   // Inicio: HPC_201508_PRE
   wwMonCCI : Double;
   // Fin: HPC_201508_PRE
   
Implementation

Uses PREDM, PRE937, Math;  // SPP_201401_PRE

{$R *.dfm}

Procedure TFctaindres.btnprocesarClick(Sender: TObject);
Var
   xSql: String;
   xperiodo: String;
   xFecUlt: String;
   xNroDocen, xAcuMesAnt, xCapital, xIntCapAcu, xBonos, xAcumulado: Double;
   // Inicio: HPC_201508_PRE
   xnMonCCI : Double;
   // Fin: HPC_201508_PRE
Begin
   // diferencia Tipo de Filtro seleccionado
   //Inicio: SPP_201401_PRE
   // Inicio: HPC_201508_PRE
   // btnDetalle.Enabled := True;
   // btnimprimir.Enabled := True;
   // limpiar;
   // Fin: HPC_201508_PRE
   //Fin: SPP_201401_PRE
   xFiltroSeleccionado := 'xAñosAportados';
   Screen.Cursor := crHourGlass;
   If seMes.Value = 12 Then
      xFecUlt := DateToStr(StrToDate('01/01/' + DM1.StrZero(IntToStr(seAnio.value + 1), 4)) - 1)
   Else
      xFecUlt := DateToStr(StrToDate('01/' + DM1.StrZero(IntToStr(seMes.value + 1), 2) + '/' + seAnio.Text) - 1);

   xperiodo := seAnio.Text + DM1.StrZero(seMes.Text, 2);
   // Inicio: HPC_201508_PRE
   xSql := 'SELECT ANOSER, SUM(NRODOCEN) NRODOCEN, SUM(ACUMESANT) ACUMESANT, ANOSERF, '
         // + '    SUM(CAPITAL) CAPITAL, SUM(INTCAPACU) INTCAPACU, SUM(BONOS) BONOS, '
         + '       SUM(CAPITAL) CAPITAL, SUM(INTCAPACU) INTCAPACU, SUM(BONOS) BONOS, SUM(MONCCI) MONCCI, '
         + '       SUM(ACUMULADO) ACUMULADO, ' + QuotedStr(xFecUlt) + ' FECULT '
         + '  FROM (SELECT CASE WHEN TO_NUMBER(ANOSER) < 0 THEN 0 ELSE TO_NUMBER(ANOSER) END ANOSER, 1 NRODOCEN,'
         + '               NVL(ACUMESANT,0) ACUMESANT, TO_NUMBER(ANOSERF) ANOSERF, NVL(CAPITAL,0) CAPITAL,'
         // + '            NVL(INTCAPACU,0) INTCAPACU, NVL(BONOS,0) BONOS, NVL(ACUMULADO,0) ACUMULADO'
         + '               NVL(INTCAPACU,0) INTCAPACU, NVL(BONOS,0) BONOS, NVL(MONCUO,0) MONCCI,  NVL(ACUMULADO,0) ACUMULADO'
         + '          FROM RES_TEC_1 '
         + '         WHERE PERIODO = ' + QuotedStr(xperiodo) + ') '
         + ' GROUP BY ANOSER, ANOSERF,' + QuotedStr(xFecUlt)
         + ' ORDER BY ANOSER, ANOSERF';
   // Fin: HPC_201508_PRE
   DM1.cdsReporte.Close;
   DM1.cdsReporte.DataRequest(xSql);
   DM1.cdsReporte.Open;

   // Inicio: HPC_201508_PRE
   Screen.Cursor := crDefault;
   If DM1.cdsReporte.RecordCount = 0 Then
   Begin
      limpiar;
      btnDetalle.Enabled := False;
      btnimprimir.Enabled   := False;
      MessageDlg('No existe información para mostrar', mtInformation, [mbOk], 0);
      Exit;
   End
   Else
   Begin
      btnDetalle.Enabled := True;
      btnimprimir.Enabled   := True;
   End;
   // Fin: HPC_201508_PRE

   xNroDocen := 0;
   xAcuMesAnt := 0;
   xCapital := 0;
   xIntCapAcu := 0;
   xBonos := 0;
   // Inicio: HPC_201508_PRE
   xnMonCCI := 0;
   // Fin: HPC_201508_PRE
   xAcumulado := 0;
   DM1.cdsReporte.First;
   While Not DM1.cdsReporte.Eof Do
   Begin
      xNroDocen := xNroDocen + DM1.cdsReporte.FieldByName('NRODOCEN').AsInteger;
      xAcuMesAnt := xAcuMesAnt + DM1.cdsReporte.FieldByName('ACUMESANT').AsFloat;
      xCapital := xCapital + DM1.cdsReporte.FieldByName('CAPITAL').AsFloat;
      xIntCapAcu := xIntCapAcu + DM1.cdsReporte.FieldByName('INTCAPACU').AsFloat;
      xBonos := xBonos + DM1.cdsReporte.FieldByName('BONOS').AsFloat;
      // Inicio: HPC_201508_PRE
      xnMonCCI := xnMonCCI + DM1.cdsReporte.FieldByName('MONCCI').AsFloat;
      // Fin: HPC_201508_PRE
      xAcumulado := xAcumulado + DM1.cdsReporte.FieldByName('ACUMULADO').AsFloat;
      DM1.cdsReporte.Next;
   End;
   DM1.cdsReporte.First;
   dbgprevio.Selected.Clear;
   dbgprevio.Selected.Add('ANOSER'#9'9'#9'Años~Aportados'#9'F'#9'ACUMULADO AL 31/12/1996');
   dbgprevio.Selected.Add('NRODOCEN'#9'10'#9'Aportantes'#9'F'#9'ACUMULADO AL 31/12/1996');
   dbgprevio.Selected.Add('ACUMESANT'#9'15'#9'Capital'#9'F'#9'ACUMULADO AL 31/12/1996');
   dbgprevio.Selected.Add('ANOSERF'#9'9'#9'Años~aportados'#9'F'#9'TOTAL AL ' + xFecUlt);
   dbgprevio.Selected.Add('CAPITAL'#9'15'#9'Tabla~Beneficio'#9'F'#9'TOTAL AL ' + xFecUlt);
   dbgprevio.Selected.Add('INTCAPACU'#9'15'#9'Aportes'#9'F'#9'TOTAL AL ' + xFecUlt);
   dbgprevio.Selected.Add('BONOS'#9'15'#9'Capital'#9'F'#9'TOTAL AL ' + xFecUlt);
   dbgprevio.Selected.Add('ACUMULADO'#9'22'#9'Importe'#9'F'#9'ACUMULADO AL ' + xFecUlt);
   dbgprevio.ApplySelected;
   TNumericField(DM1.cdsReporte.FieldByName('NRODOCEN')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsReporte.FieldByName('ACUMESANT')).DisplayFormat := '###,###,##0.00';
   TNumericField(DM1.cdsReporte.FieldByName('CAPITAL')).DisplayFormat := '###,###,##0.00';
   TNumericField(DM1.cdsReporte.FieldByName('INTCAPACU')).DisplayFormat := '###,###,##0.00';
   TNumericField(DM1.cdsReporte.FieldByName('BONOS')).DisplayFormat := '###,###,##0.00';
   TNumericField(DM1.cdsReporte.FieldByName('ACUMULADO')).DisplayFormat := '###,###,##0.00';
   dbgprevio.ColumnByName('NRODOCEN').FooterValue := FloatToStrF(xNroDocen, ffNumber, 10, 0);
   dbgprevio.ColumnByName('ACUMESANT').FooterValue := FloatToStrF(xAcuMesAnt, ffNumber, 15, 2);
   dbgprevio.ColumnByName('CAPITAL').FooterValue := FloatToStrF(xCapital, ffNumber, 15, 2);
   dbgprevio.ColumnByName('INTCAPACU').FooterValue := FloatToStrF(xIntCapAcu, ffNumber, 15, 2);
   dbgprevio.ColumnByName('BONOS').FooterValue := FloatToStrF(xBonos, ffNumber, 15, 2);
   dbgprevio.ColumnByName('ACUMULADO').FooterValue := FloatToStrF(xAcumulado, ffNumber, 15, 2);
   Screen.Cursor := crDefault;
End;

Procedure TFctaindres.BitBtn1Click(Sender: TObject);
Begin
   Fctaindres.Close;
End;

//Inicio: SPP_201401_PRE
Procedure TFctaindres.btnimprimirClick(Sender: TObject);
var
// variables para Imagen
   Image: TImage;
   Jpeg: TJpegImage;
   xSQL : String;
Begin
   // reporte de Años aportados
   If xFiltroSeleccionado = 'xAñosAportados' Then
   Begin
      pplUsuario1.Caption := 'Usuario : ' + DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
      // pplFecha1.Caption := 'Fecha y hora de impresiòn : '+DateToStr(Date)+' - '+TimeToStr(Time); SPP_201401_PRE
      ppReport1.Print;
   End
   else
   begin
      Chart1.Series[0].Clear;
      // Chart1.Series[0].Add(wwAcuMesAnt, 'APORTES<=1996 -->');
      Chart1.Series[0].Add(wwAcuMesAnt+wwCapital, 'APORTES -->');
      Chart1.Series[0].Add(wwIntCapAcu, 'INTERÉS -->');
      Chart1.Series[0].Add(wwBonos, 'BONUS -->');

      // crea o bitmap de memória
      Image := TImage.Create(Nil);
      Image.Width := Chart1.Width;
      Image.Height := Chart1.Height;
      // configura os valores específicos
      Chart1.Draw(Image1.Canvas, Image.BoundsRect);
      Jpeg := TJpegImage.Create;
      Jpeg.Assign(Image1.Picture.Bitmap);
      ppImage3.Picture.Bitmap := image1.Picture.Bitmap;

      xSQL := 'SELECT '
             +floattostr(wwAcuMesAnt) +' TOT_APO_1996,'
             +floattostr(wwCapital) +' TOT_APORTES_CI,'
             +floattostr(wwTotAportes) +' TOT_APORTES,'
             +floattostr(wwIntCapAcu) +' TOT_INTERES,'
             // Inicio: HPC_201508_PRE
             +floattostr(wwMonCCI) +' TOT_MONCCI,'
             // Fin: HPC_201508_PRE
             +floattostr(wwBonos) +' TOT_BONUS,'
             +floattostr(wwTotCuentaInd) +' TOT_CI '
             +' FROM DUAL ';
      DM1.cdsQry20.Close;
      DM1.cdsQry20.DataRequest(xSQL);
      DM1.cdsQry20.Open;
      ppdbTotales.DataSource := DM1.dsQry20;
      // ppdesigner1.Show;
      pplUsuario2.Caption := 'Usuario : ' + DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
      // pplFecha2.Caption := 'Fecha y hora de impresiòn : '+DateToStr(Date)+' - '+TimeToStr(Time); SPP_201401_PRE
      ppReport2.Print;
   end;
End;
//Fin: SPP_201401_PRE

Procedure TFctaindres.btnDetalleClick(Sender: TObject);
Var
   xSql, xperiodo: String;
Begin
   Screen.Cursor := crHourGlass;
   xperiodo := seAnio.Text + DM1.StrZero(seMes.Text, 2);
   if xFiltroSeleccionado = 'xAñosAportados' then
   begin
     xSql := 'SELECT A.ASOCODMOD, A.ASOAPENOM, A.FECRES,'
           + '       CASE WHEN NVL(A.ANOSER,0) <= 0 THEN 0 ELSE TO_NUMBER(A.ANOSER) END ANOSER,'
           + '       CASE WHEN NVL(A.ANOSERF,0) <= 0 THEN 0 ELSE TO_NUMBER(A.ANOSERF) END ANOSERF,'
           // Inicio: HPC_201508_PRE
           // + '       A.ACUMESANT, A.CAPITAL, A.INTCAPACU, A.BONOS, A.ACUMULADO '
           + '       A.ACUMESANT, A.CAPITAL, A.INTCAPACU, A.BONOS, A.MONCUO MONCCI, A.ACUMULADO'
           // Fin: HPC_201508_PRE
           + '  FROM RES_TEC_1 A'
           + ' WHERE A.PERIODO = ' + QuotedStr(xperiodo);
     If DM1.cdsReporte.FieldByName('ANOSER').AsInteger <= 0 Then
        xSql := xSql + ' AND A.ANOSER <= ' + QuotedStr(DM1.cdsReporte.FieldByName('ANOSER').AsString)
     Else
        xSql := xSql + ' AND A.ANOSER = ' + QuotedStr(DM1.cdsReporte.FieldByName('ANOSER').AsString);
     If DM1.cdsReporte.FieldByName('ANOSERF').AsInteger <= 0 Then
        xSql := xSql + ' AND A.ANOSERF <= ' + QuotedStr(DM1.cdsReporte.FieldByName('ANOSERF').AsString)
     Else
        xSql := xSql + ' AND A.ANOSERF = ' + QuotedStr(DM1.cdsReporte.FieldByName('ANOSERF').AsString);
   end
   else

   begin
     // Inicio: SPP_201403_PRE
     // xSql := 'SELECT A.ASOCODMOD, A.ASOAPENOM, A.FECRES,'
     //      + '       CASE WHEN NVL(A.ANOSER,0) <= 0 THEN 0 ELSE TO_NUMBER(A.ANOSER) END ANOSER,'
     //      + '       CASE WHEN NVL(A.ANOSERF,0) <= 0 THEN 0 ELSE TO_NUMBER(A.ANOSERF) END ANOSERF,'
     //      + '       A.ACUMESANT, A.CAPITAL, A.INTCAPACU, A.BONOS, A.ACUMULADO '
     //      + '  FROM RES_TEC_1 A'
     //      + ' WHERE A.PERIODO = ' + QuotedStr(xperiodo);
     // If DM1.cdsReporte.FieldByName('ANO_SERV').AsInteger <= 0 Then
     //    xSql := xSql + ' AND A.ANO_SERV <= ' + QuotedStr(DM1.cdsReporte.FieldByName('ANO_SERV').AsString)
     // Else
     //   xSql := xSql + ' AND A.ANO_SERV = ' + QuotedStr(DM1.cdsReporte.FieldByName('ANO_SERV').AsString);
     xSql := 'SELECT A.ASOCODMOD, A.ASOAPENOM, A.FECRES,'
           + '       CASE WHEN NVL(A.ANOSER,0) <= 0 THEN 0 ELSE TO_NUMBER(A.ANOSER) END ANOSER,'
           + '       CASE WHEN NVL(A.ANOSERF,0) <= 0 THEN 0 ELSE TO_NUMBER(A.ANOSERF) END ANOSERF,'
           // Inicio: HPC_201508_PRE
           + '       A.ACUMESANT, A.CAPITAL, A.INTCAPACU, A.BONOS, A.MONCUO MONCCI, A.ACUMULADO '
           // Fin: HPC_201508_PRE
           + '  FROM RES_TEC_1 A'
           + ' WHERE A.PERIODO = ' + QuotedStr(xperiodo);
     If DM1.cdsReporte.FieldByName('ANO_SERV').AsInteger <= 0 Then
        xSql := xSql + ' AND A.ANOSERF <= ' + QuotedStr(DM1.cdsReporte.FieldByName('ANO_SERV').AsString)
     Else
        xSql := xSql + ' AND A.ANOSERF = ' + QuotedStr(DM1.cdsReporte.FieldByName('ANO_SERV').AsString);
     // Fin: SPP_201403_PRE
   end;
   //Inicio: SPP_201401_PRE
   // DM1.cdsQry.Close; 
   // DM1.cdsQry.DataRequest(xSql);
   // DM1.cdsQry.Open;
   DM1.cdsCuentas.Close;
   DM1.cdsCuentas.DataRequest(xSql);
   DM1.cdsCuentas.Open;
   //Fin: SPP_201401_PRE
   Screen.Cursor := crDefault;
   Try
      Fctainddet := TFctainddet.create(Self);
      Fctainddet.ShowModal;
   Finally
      Fctainddet.Free;
   End;
End;

procedure TFctaindres.bbtnxAnosServicioClick(Sender: TObject);
Var
   xSql: String;
   xperiodo: String;
   xFecUlt: String;
   xNroDocen, xAcuMesAnt, xCapital, xTotAportes, xIntCapAcu, xBonos, xTotCuentaInd: Double;
   // Inicio: HPC_201508_PRE
   xnMonCCI : Double;
   // Fin: HPC_201508_PRE
Begin
   //Inicio: SPP_201401_PRE
   // Inicio: HPC_201508_PRE
   // btnDetalle.Enabled := True;
   // btnimprimir.Enabled := True;
   // limpiar;
   // Fin: HPC_201508_PRE
   //Fin: SPP_201401_PRE
   If seMes.Value = 12 Then
      xFecUlt := DateToStr(StrToDate('01/01/' + DM1.StrZero(IntToStr(seAnio.value + 1), 4)) - 1)
   Else
      xFecUlt := DateToStr(StrToDate('01/' + DM1.StrZero(IntToStr(seMes.value + 1), 2) + '/' + seAnio.Text) - 1);
   xFiltroSeleccionado := 'xAñosServicio';
   Screen.Cursor := crHourGlass;
   xperiodo := seAnio.Text + DM1.StrZero(seMes.Text, 2);
   // Inicio: DPP_201203_PRE
   {
   xSQL := 'select count(*) VACIOS '
          +'from RES_TEC_1 '
          +'where PERIODO = '+ QuotedStr(xperiodo)
          +'  and ANO_SERV is null ';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   if DM1.cdsQry.FieldByName('VACIOS').AsInteger>0 then
   begin
      xSQL := 'Begin SP_ACT_TSERV_CTAIND_LOTE('+quotedstr(xPeriodo)+'); end;';
      DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
   end
   else
   begin
      if MessageDlg('¿ Recalcular Tiempo de Servicio ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      begin
         xSQL := 'Begin SP_ACT_TSERV_CTAIND_LOTE('+quotedstr(xPeriodo)+'); end;';
         DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
      end;
   end;
   DM1.cdsQry.Close;
   }
   // Fin: DPP_201203_PRE

   // Inicio: SPP_201403_PRE
   // xSql := 'SELECT '+QuotedStr('RESUMEN DE SALDOS DE LAS CUENTAS INDIVIDUALES DE APORTE AL '+xFecUlt)+' TITULO1, '
   //       +'       ANO_SERV , SUM(1) NUM_ASOCIADOS, ' + QuotedStr(xFecUlt) + ' FECULT,'
   //       +'       SUM(ACUMESANT) ACUM_1996, SUM(CAPITAL) APORTES, SUM(ACUMESANT)+SUM(CAPITAL) TOT_APORTES, '
   //       +'       SUM(INTCAPACU) INTERES,   SUM(BONOS) BONUS, '
   //       +'       SUM(ACUMULADO) TOT_CTA_IND '
   //       +'FROM RES_TEC_1 '
   //       +'WHERE PERIODO = '+ QuotedStr(xperiodo)
   //       +'  AND ASOTIP_ACT=''DO'' '
   //       +'GROUP BY ANO_SERV '
   //       +'ORDER BY ANO_SERV ';
   xSql := 'SELECT '+QuotedStr('RESUMEN DE SALDOS DE LAS CUENTAS INDIVIDUALES DE APORTE AL '+xFecUlt)+' TITULO1, '
          +'       TO_NUMBER(ANOSERF) ANO_SERV, SUM(1) NUM_ASOCIADOS, ' + QuotedStr(xFecUlt) + ' FECULT,'
          +'       SUM(ACUMESANT) ACUM_1996, SUM(CAPITAL) APORTES, SUM(ACUMESANT)+SUM(CAPITAL) TOT_APORTES, '
          // Inicio: HPC_201508_PRE
          // +'       SUM(INTCAPACU) INTERES,   SUM(BONOS) BONUS, '
          +'       SUM(INTCAPACU) INTERES,   SUM(BONOS) BONUS, SUM(MONCUO) MONCCI,'
          // Fin: HPC_201508_PRE
          +'       SUM(ACUMULADO) TOT_CTA_IND '
          +'FROM RES_TEC_1 '



    // Inicio: HPC_201709_PRE
    // Se valida siempre y cuando la fecha sea mayor a octubre 2017
          // +'WHERE PERIODO = '+ QuotedStr(xperiodo)+' '
          +'WHERE PERIODO = '+ QuotedStr(xperiodo)+' ';
// Inicio HPC_201708_PRE
//MODIFICAR REPORTE DE ACTIVOS POR EDAD Y SEXO AL CIERRE DE CADA MES
  If DM1.StrZero(IntToStr(seAnio.Value),4)+DM1.StrZero(IntToStr(seMes.Value),2) >= '201710' Then
     xSql := xSql + ' AND ACUMULADO > 0 ';
// Final HPC_201708_PRE
    xSql := xSql +' GROUP BY TO_NUMBER(ANOSERF) ORDER BY TO_NUMBER(ANOSERF)';
    //      +'GROUP BY TO_NUMBER(ANOSERF) '
    //      +'ORDER BY TO_NUMBER(ANOSERF) ';
   // Fin: SPP_201403_PRE
    // Fin: HPC_201709_PRE




   DM1.cdsReporte.Close;
   DM1.cdsReporte.DataRequest(xSql);
   DM1.cdsReporte.Open;

    // Inicio: HPC_201508_PRE
   Screen.Cursor := crDefault;
   If DM1.cdsReporte.RecordCount = 0 Then
   Begin
      limpiar;
      btnDetalle.Enabled := False;
      btnimprimir.Enabled   := False;
      MessageDlg('No existe información para mostrar', mtInformation, [mbOk], 0);
      Exit;
   End
   Else
   Begin
      btnDetalle.Enabled := True;
      btnimprimir.Enabled   := True;
   End;
   // Fin: HPC_201508_PRE

   xNroDocen := 0;
   xAcuMesAnt := 0;
   xCapital := 0;
   xIntCapAcu := 0;
   xTotAportes := 0;
   xBonos := 0;
   xTotCuentaInd := 0;
   // Inicio: HPC_201508_PRE;
   xnMonCCI := 0;
   // Fin: HPC_201508_PRE;
   DM1.cdsReporte.First;
   While Not DM1.cdsReporte.Eof Do
   Begin
      xNroDocen := xNroDocen + DM1.cdsReporte.FieldByName('NUM_ASOCIADOS').AsInteger;
      xAcuMesAnt := xAcuMesAnt + DM1.cdsReporte.FieldByName('ACUM_1996').AsFloat;
      xCapital := xCapital + DM1.cdsReporte.FieldByName('APORTES').AsFloat;
      xTotAportes := xTotAportes + DM1.cdsReporte.FieldByName('TOT_APORTES').AsFloat;
      xIntCapAcu := xIntCapAcu + DM1.cdsReporte.FieldByName('INTERES').AsFloat;
      xBonos := xBonos + DM1.cdsReporte.FieldByName('BONUS').AsFloat;
      xTotCuentaInd := xTotCuentaInd + DM1.cdsReporte.FieldByName('TOT_CTA_IND').AsFloat;
      // Inicio: HPC_201508_PRE
      xnMonCCI := xnMonCCI + DM1.cdsReporte.FieldByName('MONCCI').AsFloat;
      // Fin: HPC_201508_PRE
      DM1.cdsReporte.Next;
   End;

// totales para le gráfico
   wwAcuMesAnt    := xAcuMesAnt;
   wwCapital      := xCapital;
   wwTotAportes   := xTotAportes;
   wwIntCapAcu    := xIntCapAcu;
   wwBonos        := xBonos;
   // Inicio: HPC_201508_PRE
   wwMonCCI       := xnMonCCI;
   // Fin: HPC_201508_PRE
   wwTotCuentaInd := xTotCuentaInd;
   DM1.cdsReporte.First;

   dbgprevio.Selected.Clear;
   dbgprevio.Selected.Add('ANO_SERV'#9'9'#9'Años de~Servicio'#9'F'#9);
   // Inicio: HPC_201508_PRE
   // dbgprevio.Selected.Add('NUM_ASOCIADOS'#9'10'#9'Total~Asociados'#9'F'#9);
   dbgprevio.Selected.Add('NUM_ASOCIADOS'#9'9'#9'Total~Asociados'#9'F'#9);
   // dbgprevio.Selected.Add('ACUM_1996'#9'15'#9'Aportes al~31.12.1996'#9'F'#9'APORTES'#9);
   dbgprevio.Selected.Add('ACUM_1996'#9'13'#9'Aportes al~31.12.1996'#9'F'#9'APORTES'#9);
   // dbgprevio.Selected.Add('APORTES'#9'15'#9'Aportes~C.I.'#9'F'#9'APORTES'#9);
   dbgprevio.Selected.Add('APORTES'#9'13'#9'Aportes~C.I.'#9'F'#9'APORTES'#9);
   dbgprevio.Selected.Add('TOT_APORTES'#9'15'#9'Total~Aportes'#9'F'#9'APORTES'#9);
   // dbgprevio.Selected.Add('INTERES'#9'15'#9'Interés'#9'F'#9);
   dbgprevio.Selected.Add('INTERES'#9'12'#9'Interés'#9'F'#9);
   // dbgprevio.Selected.Add('BONUS'#9'15'#9'Bonus'#9'F'#9);
   dbgprevio.Selected.Add('BONUS'#9'12'#9'Bonus'#9'F'#9);
   dbgprevio.Selected.Add('MONCCI'#9'12'#9'Monto~CCI(-)'#9'F'#9);
   // Fin: HPC_201508_PRE
   dbgprevio.Selected.Add('TOT_CTA_IND'#9'15'#9'Total Cuenta~Individual'#9'F'#9);
   dbgprevio.ApplySelected;
   TNumericField(DM1.cdsReporte.FieldByName('NUM_ASOCIADOS')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsReporte.FieldByName('ACUM_1996')).DisplayFormat := '###,###,##0.00';
   TNumericField(DM1.cdsReporte.FieldByName('APORTES')).DisplayFormat := '###,###,##0.00';
   TNumericField(DM1.cdsReporte.FieldByName('TOT_APORTES')).DisplayFormat := '###,###,##0.00';
   TNumericField(DM1.cdsReporte.FieldByName('INTERES')).DisplayFormat := '###,###,##0.00';
   TNumericField(DM1.cdsReporte.FieldByName('BONUS')).DisplayFormat := '###,###,##0.00';
   // Inicio: HPC_201508_PRE
   TNumericField(DM1.cdsReporte.FieldByName('MONCCI')).DisplayFormat := '###,###,##0.00';
   // Fin: HPC_201508_PRE

   TNumericField(DM1.cdsReporte.FieldByName('TOT_CTA_IND')).DisplayFormat := '###,###,##0.00';
   dbgprevio.ColumnByName('NUM_ASOCIADOS').FooterValue := FloatToStrF(xNroDocen, ffNumber, 10, 0);
   dbgprevio.ColumnByName('ACUM_1996').FooterValue := FloatToStrF(xAcuMesAnt, ffNumber, 15, 2);
   dbgprevio.ColumnByName('APORTES').FooterValue := FloatToStrF(xCapital, ffNumber, 15, 2);
   dbgprevio.ColumnByName('TOT_APORTES').FooterValue := FloatToStrF(xTotAportes, ffNumber, 15, 2);
   dbgprevio.ColumnByName('INTERES').FooterValue := FloatToStrF(xIntCapAcu, ffNumber, 15, 2);
   dbgprevio.ColumnByName('BONUS').FooterValue := FloatToStrF(xBonos, ffNumber, 15, 2);
   // Inicio: HPC_201508_PRE
   dbgprevio.ColumnByName('MONCCI').FooterValue := FloatToStrF(xnMonCCI, ffNumber, 15, 2);
   // Fin: HPC_201508_PRE

   dbgprevio.ColumnByName('TOT_CTA_IND').FooterValue := FloatToStrF(xTotCuentaInd, ffNumber, 15, 2);
   Screen.Cursor := crDefault;
end;

//Inicio: SPP_201401_PRE
procedure TFctaindres.FormActivate(Sender: TObject);
var
   xAno, xMes, xDia : word;
begin
   limpiar;
   decodedate(DM1.FechaSys, xAno, xMes, xDia);
   seAnio.Text := inttostr(xAno);
   seMes.Text := DM1.StrZero(inttostr(xMes-1),2);
   // Inicio: HPC_201508_PRE
   btnDetalle.Enabled  := False;
   btnimprimir.Enabled := False;
   // Fin: HPC_201508_PRE
end;
procedure TFctaindres.btnUlt12MesesClick(Sender: TObject);
Var xSql, xInicio, xFin: String;
begin
   Screen.Cursor := crHourGlass;
   xSql := 'SELECT TO_CHAR(ADD_MONTHS('+QuotedStr('01/'+DM1.StrZero(seMes.Text,2)+'/'+DM1.StrZero(seAnio.Text,4))+',-11),''YYYYMM'') INICIO FROM DUAL';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   xInicio := DM1.cdsQry.FieldByName('INICIO').AsString;
   xFin  := DM1.StrZero(seAnio.Text,4)+DM1.StrZero(seMes.Text,2);
   xSql := 'SELECT SUBSTR(TO_CHAR(TO_DATE(''01/''||SUBSTR(A.PERIODO,5,2)||''/''||SUBSTR(A.PERIODO,1,4)),''month''),1,3)||''-''||SUBSTR(A.PERIODO,1,4) PERIODO,'
   // Inicio: HPC_201508_PRE
   // +' NUM_ASOCIADOS, TOT_APORTES, TOT_APORTES-TOT_APORTES_ANT DIF_APORTES, INTERES, BONUS, TOT_CTA_IND FROM'
   // +' (SELECT PERIODO, SUM(1) NUM_ASOCIADOS, SUM(ACUMESANT)+SUM(CAPITAL) TOT_APORTES, SUM(INTCAPACU) INTERES, SUM(BONOS) BONUS,'
   +' NUM_ASOCIADOS, TOT_APORTES, TOT_APORTES-TOT_APORTES_ANT DIF_APORTES, INTERES, BONUS, MONCCI, TOT_CTA_IND FROM'
   +' (SELECT PERIODO, SUM(1) NUM_ASOCIADOS, SUM(ACUMESANT)+SUM(CAPITAL) TOT_APORTES, SUM(INTCAPACU) INTERES, SUM(BONOS) BONUS, SUM(MONCUO) MONCCI,'
   // Fin: HPC_201508_PRE
   +' SUM(ACUMULADO) TOT_CTA_IND FROM RES_TEC_1 WHERE PERIODO BETWEEN '+QuotedStr(xInicio)+' AND '+QuotedStr(xFin)
   +' AND ASOTIP_ACT = ''DO'' GROUP BY PERIODO  ORDER BY PERIODO) A, (SELECT PERIODO, TO_CHAR(ADD_MONTHS(''01/''||SUBSTR(PERIODO,5,2)||''/''||SUBSTR(PERIODO,1,4),1),''YYYYMM'') PERCON,'
   +' SUM(ACUMESANT)+SUM(CAPITAL) TOT_APORTES_ANT FROM RES_TEC_1 WHERE PERIODO BETWEEN '+QuotedStr(xInicio)+' AND '+QuotedStr(xFin)
   +' AND ASOTIP_ACT = ''DO'' GROUP BY PERIODO,TO_CHAR(ADD_MONTHS(''01/''||SUBSTR(PERIODO,5,2)||''/''||SUBSTR(PERIODO,1,4),-1),''YYYYMM'')'
   +' ORDER BY PERIODO,TO_CHAR(ADD_MONTHS(''01/''||SUBSTR(PERIODO,5,2)||''/''||SUBSTR(PERIODO,1,4),-1),''YYYYMM'')) B'
   +' WHERE A.PERIODO=B.PERCON(+)'
   +' ORDER BY A.PERIODO';
   DM1.cdsReporte.Close;
   DM1.cdsReporte.DataRequest(xSql);
   DM1.cdsReporte.Open;
   dbgprevio.Selected.Clear;
   dbgprevio.Selected.Add('PERIODO'#9'8'#9'Periodo'#9#9);
   dbgprevio.Selected.Add('NUM_ASOCIADOS'#9'6'#9'Número de~asociados'#9#9);
   dbgprevio.Selected.Add('TOT_APORTES'#9'15'#9'Monto total~aportes'#9#9);
   dbgprevio.Selected.Add('DIF_APORTES'#9'15'#9'Diferencia apo.~mes anterior'#9#9);
   dbgprevio.Selected.Add('INTERES'#9'15'#9'Total~Intereses'#9#9);
   dbgprevio.Selected.Add('BONUS'#9'15'#9'Total~Bonus'#9#9);
   // Inicio: HPC_201508_PRE
   dbgprevio.Selected.Add('MONCCI'#9'15'#9'Descontado~CCI(-)'#9#9);
   // Fin: HPC_201508_PRE
   dbgprevio.Selected.Add('TOT_CTA_IND'#9'15'#9'Monto total~cuenta individual'#9#9);
   dbgprevio.ApplySelected;
   TNumericField(DM1.cdsReporte.FieldByName('NUM_ASOCIADOS')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsReporte.FieldByName('TOT_APORTES')).DisplayFormat := '###,###,##0.00';
   TNumericField(DM1.cdsReporte.FieldByName('DIF_APORTES')).DisplayFormat := '###,###,##0.00';
   TNumericField(DM1.cdsReporte.FieldByName('INTERES')).DisplayFormat := '###,###,##0.00';
   TNumericField(DM1.cdsReporte.FieldByName('BONUS')).DisplayFormat := '###,###,##0.00';
   // Inicio: HPC_201508_PRE
   TNumericField(DM1.cdsReporte.FieldByName('MONCCI')).DisplayFormat := '###,###,##0.00';
   // Fin: HPC_201508_PRE
   TNumericField(DM1.cdsReporte.FieldByName('TOT_CTA_IND')).DisplayFormat := '###,###,##0.00';
   Screen.Cursor := crDefault;
   rgult12Meses.Visible := True;
   btnDetalle.Enabled := False;
   btnimprimir.Enabled := False;
end;

procedure TFctaindres.rgult12MesesClick(Sender: TObject);
Var i, xIncremento, xMin, xMax :Double;
begin
   Chart2.LeftAxis.Maximum := 100000000000;
   Chart2.LeftAxis.Minimum := 0;
   gbprincipal.Enabled := False;
   pnlUlt12Meses.Visible := True;
   pnlUlt12Meses.Left := 28;
   pnlUlt12Meses.Top := 100;
   If rgult12Meses.ItemIndex = 0 Then
   Begin
      sttitulo.Caption := 'TOTAL APORTES';
      DM1.cdsReporte.First;
      xMin := DM1.cdsReporte.FieldByName('TOT_APORTES').AsFloat;
      xMax := DM1.cdsReporte.FieldByName('TOT_APORTES').AsFloat;
      DM1.cdsReporte.Next;
      While Not DM1.cdsReporte.Eof Do
      Begin
         If DM1.cdsReporte.FieldByName('TOT_APORTES').AsFloat > xMax Then xMax := DM1.cdsReporte.FieldByName('TOT_APORTES').AsFloat;
         If DM1.cdsReporte.FieldByName('TOT_APORTES').AsFloat < xMin Then xMin := DM1.cdsReporte.FieldByName('TOT_APORTES').AsFloat;
         DM1.cdsReporte.Next;
      End;
      xMax := RoundTo(xMax,0);
      xmin := RoundTo(xMin,0);
      xIncremento :=  RoundTo((xMax - xMin)/12,0);

      Chart2.LeftAxis.Increment := xIncremento;
      Chart2.LeftAxis.Maximum := xMax;
      Chart2.LeftAxis.Minimum := xMin;
      DM1.cdsReporte.First;
      Chart2.Series[0].Clear;
      While Not DM1.cdsReporte.Eof Do
      Begin
         Chart2.Series[0].Add(RoundTo(DM1.cdsReporte.FieldByName('TOT_APORTES').AsFloat,0), DM1.cdsReporte.FieldByName('PERIODO').AsString);
         DM1.cdsReporte.Next;
      End;
   End;
   If rgult12Meses.ItemIndex = 1 Then
   Begin
      sttitulo.Caption := 'DIFERENCIAS DE APORTES AL MES ANTERIOR';
      DM1.cdsReporte.First;
      xMin := DM1.cdsReporte.FieldByName('DIF_APORTES').AsFloat;
      xMax := DM1.cdsReporte.FieldByName('DIF_APORTES').AsFloat;
      DM1.cdsReporte.Next;
      While Not DM1.cdsReporte.Eof Do
      Begin
         If DM1.cdsReporte.FieldByName('DIF_APORTES').AsFloat > xMax Then xMax := DM1.cdsReporte.FieldByName('DIF_APORTES').AsFloat;
         If DM1.cdsReporte.FieldByName('DIF_APORTES').AsFloat < xMin Then xMin := DM1.cdsReporte.FieldByName('DIF_APORTES').AsFloat;
         DM1.cdsReporte.Next;
      End;
      xMax := RoundTo(xMax,0);
      xmin := RoundTo(xMin,0);
      xIncremento :=  RoundTo((xMax - xMin)/12,0);
      Chart2.LeftAxis.Increment := xIncremento;
      Chart2.LeftAxis.Maximum := xMax;
      Chart2.LeftAxis.Minimum := xMin;
      DM1.cdsReporte.First;
      Chart2.Series[0].Clear;
      While Not DM1.cdsReporte.Eof Do
      Begin
         Chart2.Series[0].Add(RoundTo(DM1.cdsReporte.FieldByName('DIF_APORTES').AsFloat,0), DM1.cdsReporte.FieldByName('PERIODO').AsString);
         DM1.cdsReporte.Next;
      End;
   End;
   If rgult12Meses.ItemIndex = 2 Then
   Begin
      sttitulo.Caption := 'NUMERO DE ASOCIADOS';
      DM1.cdsReporte.First;
      xMin := DM1.cdsReporte.FieldByName('NUM_ASOCIADOS').AsFloat;
      xMax := DM1.cdsReporte.FieldByName('NUM_ASOCIADOS').AsFloat;
      DM1.cdsReporte.Next;
      While Not DM1.cdsReporte.Eof Do
      Begin
         If DM1.cdsReporte.FieldByName('NUM_ASOCIADOS').AsFloat > xMax Then xMax := DM1.cdsReporte.FieldByName('NUM_ASOCIADOS').AsFloat;
         If DM1.cdsReporte.FieldByName('NUM_ASOCIADOS').AsFloat < xMin Then xMin := DM1.cdsReporte.FieldByName('NUM_ASOCIADOS').AsFloat;
         DM1.cdsReporte.Next;
      End;
      xMax := RoundTo(xMax,0);
      xmin := RoundTo(xMin,0);
      xIncremento :=  RoundTo((xMax - xMin)/12,0);
      Chart2.LeftAxis.Increment := xIncremento;
      Chart2.LeftAxis.Maximum := xMax;
      Chart2.LeftAxis.Minimum := xMin;
      DM1.cdsReporte.First;
      Chart2.Series[0].Clear;
      While Not DM1.cdsReporte.Eof Do
      Begin
         Chart2.Series[0].Add(RoundTo(DM1.cdsReporte.FieldByName('NUM_ASOCIADOS').AsFloat,0), DM1.cdsReporte.FieldByName('PERIODO').AsString);
         DM1.cdsReporte.Next;
      End;
   End;
   If rgult12Meses.ItemIndex = 3 Then
   Begin
      sttitulo.Caption := 'TOTAL CUENTA INDIVIDUAL';
      DM1.cdsReporte.First;
      xMin := DM1.cdsReporte.FieldByName('TOT_CTA_IND').AsFloat;
      xMax := DM1.cdsReporte.FieldByName('TOT_CTA_IND').AsFloat;
      DM1.cdsReporte.Next;
      While Not DM1.cdsReporte.Eof Do
      Begin
         If DM1.cdsReporte.FieldByName('TOT_CTA_IND').AsFloat > xMax Then xMax := DM1.cdsReporte.FieldByName('TOT_CTA_IND').AsFloat;
         If DM1.cdsReporte.FieldByName('TOT_CTA_IND').AsFloat < xMin Then xMin := DM1.cdsReporte.FieldByName('TOT_CTA_IND').AsFloat;
         DM1.cdsReporte.Next;
      End;
      xMax := RoundTo(xMax,0);
      xmin := RoundTo(xMin,0);
      xIncremento :=  RoundTo((xMax - xMin)/12,0);
      Chart2.LeftAxis.Increment := xIncremento;
      Chart2.LeftAxis.Maximum := xMax;
      Chart2.LeftAxis.Minimum := xMin;
      DM1.cdsReporte.First;
      Chart2.Series[0].Clear;
      While Not DM1.cdsReporte.Eof Do
      Begin
         Chart2.Series[0].Add(RoundTo(DM1.cdsReporte.FieldByName('TOT_CTA_IND').AsFloat,0), DM1.cdsReporte.FieldByName('PERIODO').AsString);
         DM1.cdsReporte.Next;
      End;
   End;
end;

procedure TFctaindres.limpiar;
begin
  pnlUlt12Meses.Visible := False;
  DM1.cdsReporte.Close;
  // Inicio: HPC_201508_PRE
  dbgprevio.Selected.Clear;
  // Fin: HPC_201508_PRE
  rgult12Meses.Visible := False;
end;

procedure TFctaindres.BitBtn4Click(Sender: TObject);
begin
  pnlUlt12Meses.Visible := False;
  gbprincipal.Enabled := True;
end;

procedure TFctaindres.BitBtn3Click(Sender: TObject);
var Image2: TImage;
    Jpeg: TJpegImage;
begin
   // crea o bitmap de memória
   Image2 := TImage.Create(Nil);
   Image2.Width := Chart2.Width;
   Image2.Height := Chart2.Height;
   // configura os valores específicos
   Chart2.Draw(Image2.Canvas, Image2.BoundsRect);
   Jpeg := TJpegImage.Create;
   Jpeg.Assign(Image2.Picture.Bitmap);
   ppImage1.Picture.Bitmap := image2.Picture.Bitmap;
   pplusuario.Caption := 'Usuario : ' + DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
   // pplfechahora.Caption := 'Fecha y hora de impresiòn : '+DateToStr(Date)+' - '+TimeToStr(Time); SPP_201401_PRE
   pplTitulo.Caption := sttitulo.Caption; 
   pprgraficos.Print;
end;
//Fin: SPP_201401_PRE

End.

