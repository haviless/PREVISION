// Inicio Uso Estándares : 01/08/2011
// Unidad                : Previsión Social
// Formulario            : fIndGestion
// Fecha de Creación     : 02/08/2011
// Autor                 : Equipo de desarrollo
// Objetivo              : Indicadores previsionales de calidad
// Actualizaciones
// HPC_201305_PRE        : Creación de indicadores previsionales de calidad
// SPP_201306_PRE        : Se realiza el pase a producción a partir del HPC_201305_PRE
// SPP_201401_PRE        : Se realiza el pase a producción a partir del pase HPC_201307_PRE
// HPC_201610_PRE : CREAR Y MODIFICAR INDICADORES DE CALIDAD
// HPC_201707_PRE : MODIFICAR INDICADORES DE CALIDAD

unit PRE288;

interface

uses
 { Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, wwdblook, Mask, Db;}

   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Buttons, ExtCtrls, TeEngine, Series, TeeProcs, Chart,
   DbChart, DB, wwClient, ComCtrls, Spin, wwdblook, ppComm, ppRelatv,
   ppProd, ppClass, ppReport, ppPrnabl, ppCtrls, ppBands, ppCache, fcLabel,
   Menus, jpeg, Grids, Wwdbigrd, Wwdbgrid,
   Mask, wwdbedit, Wwdbspin, BubbleCh, CheckLst, fcButton, fcImgBtn,
   // INICIO HPC_201610_PRE
   // DECLARACION DE COMPONENTES
   fcShapeBtn, Wwdatsrc, DBClient;
   // FIN HPC_201610_PRE

type
  TfIndGestion = class(TForm)
    Panel2: TPanel;
    btnCerrar: TBitBtn;
    chkMosValor: TCheckBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBChart2: TDBChart;
    DBChart1: TDBChart;
    Panel4: TPanel;
    pnl01: TPanel;
    lblannio: TLabel;
    dblAnnio: TwwDBLookupCombo;
    pnl02: TPanel;
    lblTipBen: TLabel;
    lblDepartamento: TLabel;
    dbltipbenef: TwwDBLookupCombo;
    Panel16: TPanel;
    metipbenef: TMaskEdit;
    dblcdptoid: TwwDBLookupCombo;
    Panel13: TPanel;
    medptodes: TMaskEdit;
    btnMostrar: TSpeedButton;
    bitPrint: TSpeedButton;
    rpGrafico: TppReport;
    ppHeaderBand1: TppHeaderBand;
    Image001: TppImage;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    // INICIO HPC_201610_PRE
    // DECLARACION DE VARIABLES
    tsTiempoPromedioLiquidacion: TTabSheet;
    chrtTiempoPromedioLiquidacion: TDBChart;
    btnAExcel: TBitBtn;
    dtgTiempoPromedioLiquidacionXLS: TwwDBGrid;
    lblOficina: TLabel;
    cbOficina: TwwDBLookupCombo;
    Panel1: TPanel;
    edtOficina: TMaskEdit;
    tsExpedienteProceso: TTabSheet;
    chrtTiempoExpPro: TDBChart;
    dtgExpeProXLS: TwwDBGrid;
    tsReprocesosObservados: TTabSheet;
    chrtExpObs: TDBChart;
    pnlTotObs: TPanel;
    // FIN HPC_201610_PRE
    procedure btnCerrarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbltipbenefChange(Sender: TObject);
    procedure dblcdptoidChange(Sender: TObject);
    procedure btnMostrarClick(Sender: TObject);
    procedure dblAnnioChange(Sender: TObject);
    procedure rdb01Click(Sender: TObject);
    procedure rdb02Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure bitPrintClick(Sender: TObject);
    // INICIO HPC_201610_PRE
    // DECLARACION DE PROCEDURES
    procedure btnAExcelClick(Sender: TObject);
    procedure cbOficinaChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chrtTiempoPromedioLiquidacionDblClick(Sender: TObject);
    procedure chrtTiempoExpProDblClick(Sender: TObject);
    // FIN HPC_201610_PRE
  private
    { Private declarations }
    // INICIO HPC_201610_PRE
    // DECLARACION DE VARIABLES Y PROCEDURES
    xsSelAnho : String;
    xsSelDPTOID : String;
    xsSelOFDESID : String;
    xsSelPVSTIPBEN : String;
    xxCdsQryOficina : TwwClientDataSet;
     xxDsQryOficina : TwwDataSource;
    xxCdsQryTiempoPromedioLiq : TwwClientDataSet;
     xxDsQryTiempoPromedioLiq : TwwDataSource;
    xxCdsQryTiempoPromedioLiqXLS : TwwClientDataSet;
     xxDsQryTiempoPromedioLiqXLS : TwwDataSource;
    xxCdsQryTiempoExpPro : TwwClientDataSet;
     xxDsQryTiempoExpPro : TwwDataSource;
    xxCdsQryTiempoExpProXLS : TwwClientDataSet;
     xxDsQryTiempoExpProXLS : TwwDataSource;
    xxCdsQryTiempoExpObs : TwwClientDataSet;
     xxDsQryTiempoExpObs : TwwDataSource;
    xxCdsQryTiempoExpObsXLS : TwwClientDataSet;
     xxDsQryTiempoExpObsXLS : TwwDataSource;

    procedure MostrarGraficoTP(xAnnio,xTipBen,xDptoid:String;xTipoGrafico,xOpcion:Integer);
    procedure CreaGrafico(xTipoGrafico : Integer; xCds : TwwClientDataSet; xChart : TDBChart; xMens01, xMens02, xMstSerie : String);
    procedure CambiaGrafico(xTipoGrafico : Integer; xChart : TDBChart);
    procedure FG_MUESTRA_TIEMPO_PROMEDIO_LIQ();
    procedure FG_MUESTRA_TIEMPO_EXPEDIENTE_PROCESO();
    procedure FG_MUESTRA_EXPEDIENTE_OBSERVADOS();
    // FIN HPC_201610_PRE

  public
    { Public declarations }
  end;

var
  fIndGestion: TfIndGestion;

implementation

// Inicio HPC_201610_PRE : CREAR Y MODIFICAR INDICADORES DE CALIDAD
uses PREDM, PRE400, PRE401;
// Fin    HPC_201610_PRE : CREAR Y MODIFICAR INDICADORES DE CALIDAD

{$R *.dfm}

procedure TfIndGestion.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

// INICIO HPC_201610_PRE
// INCIALIZA PARAMETROS
procedure TfIndGestion.FormActivate(Sender: TObject);
var xsSQL:String;
begin
   TabSheet1.Show;
   dblAnnio.Value:= Copy(DateToStr(DM1.FechaSys),7,4);

   DM1.FG_CONECTA_CDS(xxCdsQryOficina, xxDsQryOficina);
   DM1.FG_CONECTA_CDS(xxCdsQryTiempoPromedioLiq, xxDsQryTiempoPromedioLiq);
   DM1.FG_CONECTA_CDS(xxCdsQryTiempoPromedioLiqXLS, xxDsQryTiempoPromedioLiqXLS);
   DM1.FG_CONECTA_CDS(xxCdsQryTiempoExpPro, xxDsQryTiempoExpPro);
   DM1.FG_CONECTA_CDS(xxCdsQryTiempoExpProXLS, xxDsQryTiempoExpProXLS);
   DM1.FG_CONECTA_CDS(xxCdsQryTiempoExpObs, xxDsQryTiempoExpObs);
   DM1.FG_CONECTA_CDS(xxCdsQryTiempoExpObsXLS, xxDsQryTiempoExpObsXLS);

   xsSQL :=
        ' SELECT ''00'' TIPBENEF, ''TODOS LOS BENEF.'' BENEFDES FROM DUAL '
      + '  UNION ALL '
      + ' SELECT TIPBENEF, BENEFDES '
      + '   FROM TGE186 '
      + '  WHERE TIPBENEF IN (''01'',''02'',''03'') '
      + '  ORDER BY TIPBENEF ';
   DM1.cdsTipBenef.Close;
   DM1.cdsTipBenef.DataRequest(xsSQL);
   DM1.cdsTipBenef.Open;

   xsSQL :=
        ' SELECT ''00'' DPTOID, ''TODOS LOS DPTOS'' DPTODES FROM DUAL '
      + '  UNION ALL '
      + ' SELECT DPTOID, DPTODES '
      + '   FROM APO158 '
      + '  WHERE DPTOID <> ''07'' '
      + '  ORDER BY DPTOID ';
   DM1.cdsDpto.Close;
   DM1.cdsDpto.DataRequest(xsSQL);
   DM1.cdsDpto.Open;
   dblcdptoid.LookupValue := DM1.cdsDpto.fieldbyname('DPTOID').AsString;
   dblcdptoidChange(nil);

    PageControl1Change(nil);
end;
// FIN HPC_201610_PRE

// INICIO HPC_201610_PRE
// CAMBIO DE TIPO DE BENEFICIO
procedure TfIndGestion.dbltipbenefChange(Sender: TObject);
begin
   If DM1.cdsTipBenef.Locate('TIPBENEF', dbltipbenef.Text, []) Then Begin
      metipbenef.Text := DM1.cdsTipBenef.FieldByName('BENEFDES').AsString;
   End Else Begin
      dbltipbenef.Text := '';
      metipbenef.Text := '';
   End;
end;
// FIN HPC_201610_PRE

// INICIO HPC_201610_PRE
// CAMBIO DE DEPARTAMENTO
procedure TfIndGestion.dblcdptoidChange(Sender: TObject);
VAR xsSQL : String;
begin
   IF DM1.cdsDpto.Locate('DPTOID', VarArrayof([dblcdptoid.Text]), []) THEN BEGIN
      medptodes.Text := DM1.cdsDpto.fieldbyname('DPTODES').AsString;
      xsSQL :=
            ' SELECT ''00'' OFDESID, ''00 TODAS LAS OFICINAS'' OFDESNOM FROM DUAL '
          + '  UNION ALL '
          + ' SELECT OFDESID, OFDESNOM '
          + '   FROM DB2ADMIN.APO110 '
          + '  WHERE DPTOID = ' + QuotedStr(DM1.cdsDpto.fieldbyname('DPTOID').AsString)
          + '    AND DISTID IS NOT NULL '
          + '    AND OFDESNOM NOT LIKE ''BAZAR%'' '
          + '  ORDER BY OFDESID ';
      xxCdsQryOficina.Close;
      xxCdsQryOficina.DataRequest(xsSQL);
      xxCdsQryOficina.Open;
      cbOficina.LookupTable := xxCdsQryOficina;
      cbOficina.LookupField := 'OFDESID';
      cbOficina.Selected.Clear;
      cbOficina.Selected.Add('OFDESID'#9'2'#9'Oficina ID');
      cbOficina.Selected.Add('OFDESNOM'#9'20'#9'Oficina');
      cbOficina.LookupValue := xxCdsQryOficina.fieldbyname('OFDESID').AsString;
   END;
end;
// FIN HPC_201610_PRE

// INICIO HPC_201610_PRE
// MEJORA DE CONSULTAS PARA ACEPTAR PARAMETROS OPCIONALES
procedure TfIndGestion.MostrarGraficoTP(xAnnio, xTipBen, xDptoid: String;xTipoGrafico,xOpcion:Integer);
var xSQL:String;
begin
Screen.Cursor := crHourGlass;
If xOpcion=1 Then
   Begin
      xSQL:=
         ' SELECT MESIDR||''-''||MESDESC MES,ROUND(AVG(DIASLAB),2) PROMEDIO '
       + '   FROM (SELECT TO_CHAR(MAX(FECPAG),''YYYYMM'') PEROFI,ASOID,A.PVSLBENNR, '
       + '                A.PVSFECEXP FECEXP, MAX(FECPAG) FECOFI,DB2ADMIN.DIAS_LABORABLES(A.PVSFECEXP,MAX(FECPAG)) DIASLAB, '
       + '                A.PVSTIPBEN,C.BENEFDES,DECODE(DEPORIEXP, ''07'', ''15'', DEPORIEXP) DPTOID, DPTODES '
       + '           FROM PVS301 A,PVS307 B,TGE186 C, APO158 D '
       + '          WHERE A.PVSLBENNR=B.PVSLBENNR(+) '
       + '            AND B.PVSLAGRID=''FPG'' '
       + '            AND FLGVOUCHER=''N'' '
       + '            AND NVL(PVSLMONTO,0)>0 '
       + '            AND TO_CHAR(A.PVSFECEXP,''YYYY'')='+QuotedStr(xAnnio)
       + '            AND NVL(A.OFIORIEXP,''XX'') = NVL((CASE WHEN ' + QuotedStr(xsSelOFDESID) + '= ''00''   THEN A.OFIORIEXP ELSE ' + QuotedStr(xsSelOFDESID) + '   END),''XX'') '
       + '            AND B.FECPAG IS NOT NULL '
       + '            AND A.PVSTIPBEN=C.TIPBENEF(+) '
       + '            AND PVSESTADO<>''13'' '
       + '            AND DECODE(SUBSTR(DISORIEXP,1,2),''07'',''15'',SUBSTR(DISORIEXP,1,2))=D.DPTOID(+)  '
       + '          GROUP BY ASOID,A.PVSFECEXP,A.PVSLBENNR,A.PVSTIPBEN,C.BENEFDES, '
       + '                DECODE(DEPORIEXP, ''07'', ''15'', DEPORIEXP), DPTODES) X, '
       + '        TGE181 Y '
       + '  WHERE SUBSTR(PEROFI,1,4) = ' + QuotedStr(xAnnio)
       + '    AND NVL(X.DPTOID,''XX'')    = NVL((CASE WHEN ' + QuotedStr(xsSelDPTOID) + '= ''00''    THEN X.DPTOID    ELSE ' + QuotedStr(xsSelDPTOID) + '    END),''XX'') '
       + '    AND NVL(X.PVSTIPBEN,''XX'') = NVL((CASE WHEN ' + QuotedStr(xsSelPVSTIPBEN) + '= ''00'' THEN X.PVSTIPBEN ELSE ' + QuotedStr(xsSelPVSTIPBEN) + ' END),''XX'') '
       + '    AND SUBSTR(X.PEROFI,5,2)=Y.MESIDR '
       + '  GROUP BY MESIDR||''-''||MESDESC '
       + '  ORDER BY MESIDR||''-''||MESDESC ';

      DM1.cdsReporte.Close;
      DM1.cdsReporte.DataRequest(xSQL);
      DM1.cdsReporte.Open;
      CreaGrafico(xTipoGrafico, DM1.cdsReporte, DBChart1
                 ,'TIEMPO PROMEDIO DE ATENCIÓN DE SOLICITUDES ( EN DÍAS )'
                 , 'DEPARTAMENTO : ' +  medptodes.Text + ' | OFICINA : ' +  edtOficina.Text + ' | TIPO DE BENEFICIO : ' + metipbenef.Text
                 , 'S');
   End;
If xOpcion=2 Then
   Begin
       xSQL:=
          ' SELECT MES, ROUND((CON_REPROCESO/TOTAL)*100,2) "Con_Reproceso", ROUND((SIN_REPROCESO/TOTAL)*100,2) "Sin_Reproceso" '
        + '   FROM (SELECT MES,SUM(CON_RE_PRO) CON_REPROCESO,SUM(SIN_RE_PRO) SIN_REPROCESO, SUM(CON_RE_PRO)+SUM(SIN_RE_PRO) TOTAL '
        + '           FROM (SELECT TO_CHAR(A.PVSLFECBE,''YYYY'') AÑO,F.MESIDR||''-''||F.MESDESC MES, E.PVSESTDES, '
        + '                        CASE WHEN A.PVSESTLIQ IN (''04'',''05'',''13'') THEN 1 ELSE 0 END CON_RE_PRO, '
        + '                        CASE WHEN A.PVSESTLIQ IN (''02'',''06'') THEN 1 ELSE 0 END SIN_RE_PRO, '
        + '                        DECODE(SUBSTR(B.DISORIEXP,1,2),''07'',''15'',SUBSTR(B.DISORIEXP,1,2)) DPTOID '
        + '                   FROM PVS306 A, PVS301 B, TGE186 C, APO158 D, '
        + '                        (SELECT PVSESTDSG, PVSESTDES FROM PVS102 WHERE PVSDOC = ''L'') E , TGE181 F '
        + '                  WHERE TO_CHAR(A.PVSLFECBE,''YYYY'') = ' + QuotedStr(xAnnio)
        + '                    AND NVL(B.OFIORIEXP,''XX'') = NVL((CASE WHEN ' + QuotedStr(xsSelOFDESID) + '= ''00''   THEN B.OFIORIEXP ELSE ' + QuotedStr(xsSelOFDESID) + '   END),''XX'') '
        + '                    AND NVL(B.PVSTIPBEN,''XX'') = NVL((CASE WHEN ' + QuotedStr(xsSelPVSTIPBEN) + '= ''00'' THEN B.PVSTIPBEN ELSE ' + QuotedStr(xsSelPVSTIPBEN) + ' END),''XX'') '
        + '                    AND A.PVSESTLIQ NOT IN (''04'') '
        + '                    AND A.ASOID = B.ASOID(+) '
        + '                    AND A.PVSLBENNR = B.PVSLBENNR(+) '
        + '                    AND A.PVSLTIPBE = C.TIPBENEF(+) '
        + '                    AND A.PVSESTLIQ = E.PVSESTDSG '
        + '                    AND SUBSTR(B.DISORIEXP, 1,2) = D.DPTOID(+) '
        + '                    AND TO_CHAR(A.PVSLFECBE,''MM'')=F.MESIDR ) '
        + '          WHERE AÑO='+QuotedStr(xAnnio)
        + '             AND NVL(DPTOID,''XX'')    = NVL((CASE WHEN ' + QuotedStr(xsSelDPTOID) + '= ''00''    THEN DPTOID    ELSE ' + QuotedStr(xsSelDPTOID) + '    END),''XX'') '
        + '          GROUP BY MES ORDER BY MES) ';
       DM1.cdsDetCartas.Close;
       DM1.cdsDetCartas.DataRequest(xSQL);
       DM1.cdsDetCartas.Open;
       CreaGrafico(0, DM1.cdsDetCartas, DBChart2
                 , 'SOLICITUDES DE BENEFICIOS CON REPROCESO'
                 , 'AÑO : ' + dblAnnio.Text + ' | DEPARTAMENTO : ' +  medptodes.Text + ' | OFICINA : ' +  edtOficina.Text + ' | TIPO DE BENEFICIO : ' + metipbenef.Text
                 , 'S');
   End;
   Screen.Cursor := crDefault;
end;
// FIN HPC_201610_PRE

procedure TfIndGestion.CambiaGrafico(xTipoGrafico: Integer; xChart: TDBChart);
var
   xSerie : TChartSeries;
   i : Integer;
Begin
   For i := 0 To xChart.SeriesList.Count - 1 Do
   Begin
      xSerie := xChart.Series[i];
      Case xTipoGrafico Of
         1 :
            Begin
               ChangeSeriesType(xSerie, TBarSeries);
               TBarSeries(xSerie).BarPen.Visible := True;
            End;
         2 :
            Begin
               ChangeSeriesType(xSerie, TLineSeries);
               TLineSeries(xChart.Series[i]).LinePen.Width := 3;
               TLineSeries(xChart.Series[i]).Pointer.Visible := True;
            End;
         3 :
            Begin
               ChangeSeriesType(xSerie, TAreaSeries);
            End;
      End;
   End;

end;

procedure TfIndGestion.CreaGrafico(xTipoGrafico: Integer;   xCds: TwwClientDataSet; xChart: TDBChart; xMens01, xMens02,   xMstSerie: String);
const
   Color_01 : Array[0..0] Of Integer = (16747804);
   Color_02 : Array[0..0] Of Integer = (5855743);
   // INICIO HPC_201610_PRE
   // AMPLIA RANGO DE COLORES
   Color_03 : Array[0..4] Of TColor = (5855743, 16747804, 40704, 5212415, 16744911);
   // FIN HPC_201610_PRE
   Color_04 : Array[0..0] Of TColor = (16747804);
   Color_05 : Array[0..0] Of TColor = (40704);
   Color_06 : Array[0..4] Of TColor = (40704,16747804,5212415,16742911,5855743);
   Color_07 : Array[0..3] Of TColor = (40704,16747804,5212415,16742911);
   Color_08 : Array[0..1] Of TColor = (5855743, 16747804);
var
   xFieldDefList : TFieldDefList;
   i, i2, xMark, xColor, xTitle : integer;
   MySerie : TChartSeries;
   xIndex : String;
begin
   Randomize;
   xChart.FreeAllSeries;
   xChart.Title.Text.Clear;
   xChart.Title.Text.Add(xMens01);
   xChart.Title.Text.Add(xMens02);
   xFieldDefList := xCds.FieldDefList;
   xIndex := xFieldDefList.FieldDefs[0].Name;
   i2 := 0;
   xMark := 5;
   xTitle := StrToInt(Copy(DateToStr(DM1.FechaSys), 7, 4)) - 1;
   For i := 0 To xFieldDefList.Count - 1 Do
   Begin
      If xFieldDefList.FieldDefs[i].Name <> xIndex Then
      Begin
         Case xTipoGrafico Of
            0 :Begin
                  xChart.AddSeries(TBarSeries.Create(Self));
                  TBarSeries(xChart.Series[i2]).BarPen.Visible := True;
                  TBarSeries(xChart.Series[i2]).MultiBar:= mbStacked100;
                  TBarSeries(xChart.Series[i2]).BarStyle:= bsCilinder;
               End;

            1 :Begin
                  xChart.AddSeries(TBarSeries.Create(Self));
                  TBarSeries(xChart.Series[i2]).BarPen.Visible := True;
               End;
            2 :Begin
                  xChart.AddSeries(TLineSeries.Create(Self));
                  TLineSeries(xChart.Series[i2]).LinePen.Width := 3;
                  TLineSeries(xChart.Series[i2]).Pointer.Visible := True;
               End;
            3 :Begin
                  xChart.AddSeries(TAreaSeries.Create(Self));
               End;
            4 :Begin
                  xChart.AddSeries(TPieSeries.Create(self));
                  TPieSeries(xChart.Series[i2]).Marks.Style:= smsPercent;
                  TPieSeries(xChart.Series[i2]).Marks.Font.Size:=11;
               End;
            5:Begin
                  xChart.AddSeries(TBubbleSeries.Create(self));
              End;
            6:Begin
                  xChart.AddSeries(THorizBarSeries.Create(self));
              End;
// Inicio HPC_201610_PRE : CREAR Y MODIFICAR INDICADORES DE CALIDAD
            7 :Begin
                  xChart.AddSeries(TBarSeries.Create(Self));
                  TBarSeries(xChart.Series[i2]).BarPen.Visible := True;
               End;
// Fin   HPC_201610_PRE : CREAR Y MODIFICAR INDICADORES DE CALIDAD
         End;
         xChart.Series[i2].DataSource := xCds;
         xChart.Series[i2].XLabelsSource := xIndex;
         //xChart.Series[i2].YValueS.ValueSource := xFieldDefList.FieldDefs[i].Name;

         if xTipoGrafico = 6 then
           xChart.Series[i2].XValues.ValueSource := xFieldDefList.FieldDefs[i].Name
         else
           xChart.Series[i2].YValueS.ValueSource := xFieldDefList.FieldDefs[i].Name;

         xChart.Series[i2].Name := xFieldDefList.FieldDefs[i].Name;
         xChart.Series[i2].Marks.Visible := False;
         xChart.Series[i2].Marks.Style := smsValue;
//         xChart.Series[i2].Marks.ArrowLength := xMark;
         xChart.Series[i2].Marks.BackColor := clYellow;
    //     xChart.Series[i2].Marks.Arrow.Width := 2;
   //      xChart.Series[i2].Marks.Arrow.Color := clBlack;
         If xTipoGrafico=4 Then
            Begin
                xChart.Series[i2].valueFormat := '##,###,##0';
                xChart.Series[i2].Marks.Visible := False;
                xChart.Series[i2].Marks.Style := smsValue;
            End;
         If (xMstSerie='S') Or (Copy(xMstSerie,1,1)='W') Then
            Begin
               xChart.Series[i2].Title := xFieldDefList.FieldDefs[i].Name;
            End
         Else
            xChart.Series[i2].Title := IntToStr(xTitle);

         xTitle := xTitle + 1;

         If i2 = 0 Then
            If xMstSerie = 'X' Then
               xChart.Series[i2].SeriesColor := Color_01[Random(1)]
            Else If xMstSerie = 'S' Then
               xChart.Series[i2].SeriesColor := Color_03[i2]
            Else If xMstSerie = 'R' Then
               xChart.Series[i2].SeriesColor := Color_04[i2]
            Else If xMstSerie = 'N' Then
               xChart.Series[i2].SeriesColor := Color_05[i2]
            Else
               xChart.Series[i2].SeriesColor := Color_01[Random(1)]
         Else
            If xMstSerie = 'S' Then
               xChart.Series[i2].SeriesColor := Color_03[i2]
            Else
               xChart.Series[i2].SeriesColor := Color_02[Random(1)];

         If Copy(xMstSerie,1,1)='W' Then
            Begin
              xChart.Series[i2].SeriesColor := Color_06[StrToInt(Copy(xMstSerie,2,1))];
            End;

         If xMstSerie='A' Then
            Begin
              xChart.Series[i2].SeriesColor := Color_08[i2];
            End;

         If chkMosValor.Checked Then
             xChart.Series[i2].Marks.Visible:=True
         Else xChart.Series[i2].Marks.Visible:=False;

//         xMark := xMark + 25;

         i2 := i2 + 1;

         If i2 > 1 Then
         Begin
            xChart.Legend.Visible := True;
         End
         Else
            xChart.Legend.Visible := False;

         If xMstSerie = 'X' Then
         Begin
            xTipoGrafico := xTipoGrafico + 1;
            xChart.Legend.Visible := False;
         End;

      End;
   End;
   xChart.AllowPanning:=pmNone;
   xChart.AllowZoom:=False;
   xChart.Legend.Font.Size:=9;
   If xTipoGrafico=4 Then
      Begin
        xChart.Legend.Visible := True;
        xChart.Legend.TextStyle:=ltsPlain;
        xChart.Legend.Font.Size:=9;
      End;

   xChart.RefreshData;
end;


// INICIO HPC_201610_PRE
// MUSTRA GRAFICOS DE CADA PESTAÑA
procedure TfIndGestion.btnMostrarClick(Sender: TObject);
begin
   If Length(Trim(dblAnnio.Text)) = 0 Then Begin
      MessageDlg('SELECCIONE EL AÑO', mtError, [mbOk], 0);
      Exit;
   End;
   If Length(Trim(dblcdptoid.Text)) = 0 Then Begin
      MessageDlg('SELECCIONE EL DEPARTAMENTO', mtError, [mbOk], 0);
      Exit;
   End;
   If Length(Trim(cbOficina.Text)) = 0 Then Begin
      MessageDlg('SELECCIONE LA OFICINA', mtError, [mbOk], 0);
      Exit;
   End;
   If Length(Trim(dbltipbenef.Text)) = 0 Then Begin
      MessageDlg('SELECCIONE EL TIPO DE BENEFICIO', mtError, [mbOk], 0);
      Exit;
   End;

   xsSelAnho := dblAnnio.Text;
   xsSelDPTOID  := dblcdptoid.Text;
   xsSelOFDESID := cbOficina.Text;
   xsSelPVSTIPBEN := dbltipbenef.Text;
   chkMosValor.Checked := True;
   // TabSheet1.Showing
   DBChart1.Visible:=True;
   MostrarGraficoTP(dblAnnio.Text, dbltipbenef.Text, dblcdptoid.Text,2,1);
   DBChart1.Series[0].Marks.Visible := True;
   // TabSheet2.Showing
   DBChart2.Visible:=True;
   MostrarGraficoTP(dblAnnio.Text, dbltipbenef.Text, dblcdptoid.Text,2,2);
   DBChart2.Series[0].Marks.Visible := True;
   DBChart2.Series[1].Marks.Visible := True;
   //tsTiempoPromedioLiquidacion.Showing
   FG_MUESTRA_TIEMPO_PROMEDIO_LIQ();
   //tsExpedienteProceso.Showing
   FG_MUESTRA_TIEMPO_EXPEDIENTE_PROCESO();
   FG_MUESTRA_EXPEDIENTE_OBSERVADOS();
end;
// FIN HPC_201610_PRE

// INICIO HPC_201610_PRE
// EVENTO DE CAMBIO DE AÑO
procedure TfIndGestion.dblAnnioChange(Sender: TObject);
begin
(*
If TabSheet1.Showing Then
   If (Length(Trim(dblAnnio.Text)) > 0) And (Length(Trim(metipbenef.Text)) > 0) And (Length(Trim(medptodes.Text)) > 0) Then
       Begin
         btnMostrar.OnClick(btnMostrar);
       End;

If TabSheet2.Showing Then
   If (Length(Trim(dblAnnio.Text)) > 0)  Then
       Begin
         btnMostrar.OnClick(btnMostrar);
       End;
*)
end;
// FIN HPC_201610_PRE

procedure TfIndGestion.rdb01Click(Sender: TObject);
begin
//DBChart1.Visible:=False;
//DBChart2.Visible:=False;
end;

procedure TfIndGestion.rdb02Click(Sender: TObject);
begin
//DBChart1.Visible:=False;
//DBChart2.Visible:=False;

end;

// INICIO HPC_201610_PRE
// CAMBIO DE PESTAÑA
procedure TfIndGestion.PageControl1Change(Sender: TObject);
begin
   btnAExcel.Visible := TabSheet2.Showing OR tsTiempoPromedioLiquidacion.Showing OR tsExpedienteProceso.Showing OR tsReprocesosObservados.Showing;
end;
// FIN HPC_201610_PRE

procedure TfIndGestion.bitPrintClick(Sender: TObject);
var Image01: TImage;
begin
// INICIO HPC_201610_PRE
IF not xxCdsQryTiempoPromedioLiq.Active then Exit;

Image01 := TImage.Create(Nil);
If TabSheet1.Showing Then
   Begin
     Image01.Width := DBChart1.Width;
     Image01.Height := DBChart1.Height;
     DBChart1.Draw(Image01.Canvas, Image01.BoundsRect);
   End;
If TabSheet2.Showing Then
   Begin
     Image01.Width := DBChart2.Width;
     Image01.Height := DBChart2.Height;
     DBChart2.Draw(Image01.Canvas, Image01.BoundsRect);
   End;
   // IMPRIME GRAFICOS
   If tsTiempoPromedioLiquidacion.Showing Then Begin
     Image01.Width := chrtTiempoPromedioLiquidacion.Width;
     Image01.Height := chrtTiempoPromedioLiquidacion.Height;
     chrtTiempoPromedioLiquidacion.Draw(Image01.Canvas, Image01.BoundsRect);
   End;
   If tsExpedienteProceso.Showing Then Begin
     Image01.Width := chrtTiempoExpPro.Width;
     Image01.Height := chrtTiempoExpPro.Height;
     chrtTiempoExpPro.Draw(Image01.Canvas, Image01.BoundsRect);
   End;
   If tsReprocesosObservados.Showing Then Begin
     Image01.Width := chrtExpObs.Width;
     Image01.Height := chrtExpObs.Height;
     chrtExpObs.Draw(Image01.Canvas, Image01.BoundsRect);
   End;
   // FIN HPC_201610_PRE
Image001.Picture := Image01.Picture;
rpGrafico.Print;
rpGrafico.Stop;

end;

// INICIO HPC_201610_PRE
// MUESTRA GRAFICO DE EXPEDIENTE EN PROCESO
(******************************************************************************)
procedure TfIndGestion.FG_MUESTRA_TIEMPO_EXPEDIENTE_PROCESO;
var xsSQL : String;
begin
  screen.Cursor := crHourGlass;
  xsSQL :=
    ' SELECT TIPO_BENEFICIO EP_TIPO_BENEFICIO '
  + '       ,CEIL(AVG(DIAS_CARGO_EXPREC)) RECEPCION_P '
  + '       ,CEIL(AVG(DIAS_EXPREC_EXPSIS)) EXPEDIENTE_P '
  + '       ,CEIL(AVG(DIAS_EXPSIS_HOY)) EXPEDIENTE_A_HOY '
  + '       ,CEIL(AVG(DIAS_CARGO_HOY)) TOTAL_DIAS_A_HOY '
  + '   FROM (SELECT OFICINA '
  + '               ,DEPARTAMENTO '
  + '               ,TIPO_BENEFICIO '
  + '               ,DB2ADMIN.DIAS_LABORABLES(FECHA_HOJA_CARGO, FECHA_EXPEDIENTE_RECEPCION) DIAS_CARGO_EXPREC '
  + '               ,DB2ADMIN.DIAS_LABORABLES(FECHA_EXPEDIENTE_RECEPCION, FECHA_EXPEDIENTE_SISTEMA) DIAS_EXPREC_EXPSIS '
  + '               ,DB2ADMIN.DIAS_LABORABLES(FECHA_EXPEDIENTE_SISTEMA, TRUNC(SYSDATE)) DIAS_EXPSIS_HOY '
  + '               ,CASE WHEN DB2ADMIN.DIAS_LABORABLES(FECHA_HOJA_CARGO, TRUNC(SYSDATE))-1 <= 0 THEN 1 '
  + '                     ELSE DB2ADMIN.DIAS_LABORABLES(FECHA_HOJA_CARGO, TRUNC(SYSDATE))-1 END DIAS_CARGO_HOY '
  + '           FROM (SELECT D.DPTODES DEPARTAMENTO '
  + '                       ,A.OFDESNOM OFICINA '
  + '                       ,A.BENEFDES TIPO_BENEFICIO '
  + '                       ,A.ESTADO '
  + '                       ,A.HOJA_CARGO '
  + '                       ,A.EXPEDIENTE '
  + '                       ,TRUNC(NVL(C.FECHA_HOJA_CARGO, A.FECHA_EXPEDIENTE_RECEPCION)) FECHA_HOJA_CARGO '
  + '                       ,A.FECHA_EXPEDIENTE_RECEPCION '
  + '                       ,A.FECHA_EXPEDIENTE_SISTEMA '
  + '                  FROM (SELECT A.CODCAREXP HOJA_CARGO '
  + '                              ,A.PVSEXPNRO EXPEDIENTE '
  + '                              ,C.OFDESNOM '
  + '                              ,B.BENEFDES '
  + '                              ,TRUNC(A.FECRECEXP) FECHA_EXPEDIENTE_RECEPCION '
  + '                              ,TRUNC(A.PVSFECEXP)      FECHA_EXPEDIENTE_SISTEMA '
  + '                              ,DECODE(A.DEPORIEXP,''07'',''15'',A.DEPORIEXP) DPTOID '
  + '                              ,D.PVSESTDES ESTADO '
  + '                         FROM DB2ADMIN.PVS301 A '
  + '                             ,DB2ADMIN.TGE186 B '
  + '                             ,DB2ADMIN.APO110 C '
  + '                             ,DB2ADMIN.PVS102 D '
  + '                        WHERE A.PVSESTADO IN (''01'', ''05'') '
  + '                          AND A.PVSLBENNR IS NULL '
  + '                          AND A.PVSTIPBEN IN (''01'', ''02'', ''03'') '
  + '                          AND TO_CHAR(A.PVSFECEXP,''YYYY'') = ' + QuotedStr(xsSelAnho)
  + '                          AND A.PVSTIPBEN = B.TIPBENEF '
  + '                          AND A.OFIORIEXP = C.OFDESID '
  + '                          AND A.PVSESTADO = D.PVSESTDSG '
  + '                          AND D.PVSDOC = ''E'' '
  + '                          AND NVL(A.OFIORIEXP,''XX'') = NVL((CASE WHEN ' + QuotedStr(xsSelOFDESID)   + ' = ''00'' THEN A.OFIORIEXP ELSE ' + QuotedStr(xsSelOFDESID)   + ' END),''XX'') '
  + '                          AND NVL(A.PVSTIPBEN,''XX'') = NVL((CASE WHEN ' + QuotedStr(xsSelPVSTIPBEN) + ' = ''00'' THEN A.PVSTIPBEN ELSE ' + QuotedStr(xsSelPVSTIPBEN) + ' END),''XX'') '
  + '                       ) A '
  + '                     ,(SELECT A.CODCAREXP, TRUNC(B.FECHA) FECHA_HOJA_CARGO '
  + '                         FROM DB2ADMIN.PRE_CARGO_EXPEDIENTE_MOV     A '
  + '                             ,DB2ADMIN.PRE_CARGO_EXPEDIENTE_EST_MOV B '
  + '                        WHERE A.CODCAREXPEST = ''LIQUIDADA'' '
  + '                          AND A.CODCAREXP = B.CODCAREXP '
  + '                          AND B.CODCAREXPEST = ''PENDIENTE'') C '
  + '                     ,DB2ADMIN.APO158 D '
  + '                 WHERE A.HOJA_CARGO = C.CODCAREXP(+) '
  + '                   AND A.DPTOID =  D.DPTOID(+) '
  + '                   AND NVL(A.DPTOID,''XX'') = NVL((CASE WHEN ' + QuotedStr(xsSelDPTOID) + ' = ''00'' THEN A.DPTOID ELSE ' + QuotedStr(xsSelDPTOID) + ' END),''XX'') '
  + '                 ORDER BY D.DPTODES, A.OFDESNOM '
  + '                ) '
  + '        ) A '
  + ' GROUP BY TIPO_BENEFICIO '
  + ' ORDER BY TIPO_BENEFICIO ';

  xxCdsQryTiempoExpPro.Close;
  xxCdsQryTiempoExpPro.DataRequest(xsSQL);
  xxCdsQryTiempoExpPro.Open;
  // muestra grafico
  CreaGrafico(1, xxCdsQryTiempoExpPro,
              chrtTiempoExpPro, 'TIEMPO DE EXPEDIENTES EN PROCESO ( EN DÍAS )',
              'AÑO : ' + dblAnnio.Text + ' | DEPARTAMENTO : ' +  medptodes.Text + ' | OFICINA : ' +  edtOficina.Text + ' | TIPO DE BENEFICIO : ' + metipbenef.Text,
              'S');
  screen.Cursor := crDefault;
end;
// FIN HPC_201610_PRE


// INICIO HPC_201610_PRE
// MUESTRA GRAFICO DE EXPEDIENTES EN OBSERVADOS
(******************************************************************************)
procedure TfIndGestion.FG_MUESTRA_EXPEDIENTE_OBSERVADOS;
var
   xsSQL : String;
   nRet, nFal, nInv : Integer;
begin
  screen.Cursor := crHourGlass;
  IF dbltipbenef.Text='00' then
  xsSQL :=
    ' SELECT MESDESC, '
  + '       SUM(CASE WHEN TIPO_BENEFICIO = ''POR RETIRO'' THEN TOTREG ELSE 0 END ) RETIRO, '
  + '       SUM(CASE WHEN TIPO_BENEFICIO = ''POR FALLECIMIENTO'' THEN TOTREG ELSE 0 END ) FALLECIMIENTO, '
  + '       SUM(CASE WHEN TIPO_BENEFICIO = ''POR INVALIDEZ'' THEN TOTREG ELSE 0 END ) INVALIDEZ ';

  IF dbltipbenef.Text='01' then
  xsSQL :=
    ' SELECT MESDESC, '
  + '       SUM(CASE WHEN TIPO_BENEFICIO = ''POR RETIRO'' THEN TOTREG ELSE 0 END ) RETIRO ';

  IF dbltipbenef.Text='02' then
  xsSQL :=
    ' SELECT MESDESC, '
  + '       SUM(CASE WHEN TIPO_BENEFICIO = ''POR FALLECIMIENTO'' THEN TOTREG ELSE 0 END ) FALLECIMIENTO ';

  IF dbltipbenef.Text='03' then
  xsSQL :=
    ' SELECT MESDESC, '
  + '       SUM(CASE WHEN TIPO_BENEFICIO = ''POR INVALIDEZ'' THEN TOTREG ELSE 0 END ) INVALIDEZ ';

  xsSQL := xsSQL
  + '   FROM (SELECT OFICINA '
  + '               ,DEPARTAMENTO '
  + '               ,TIPO_BENEFICIO '
  + '               ,DB2ADMIN.DIAS_LABORABLES(FECHA_HOJA_CARGO, FECHA_EXPEDIENTE_RECEPCION) DIAS_CARGO_EXPREC '
  + '               ,DB2ADMIN.DIAS_LABORABLES(FECHA_EXPEDIENTE_RECEPCION, FECHA_EXPEDIENTE_SISTEMA) DIAS_EXPREC_EXPSIS '
  + '               ,DB2ADMIN.DIAS_LABORABLES(FECHA_EXPEDIENTE_SISTEMA, TRUNC(SYSDATE)) DIAS_EXPSIS_HOY '
  + '               ,DB2ADMIN.DIAS_LABORABLES(FECHA_HOJA_CARGO, TRUNC(SYSDATE)) DIAS_CARGO_HOY '
  + '               ,ANO, MES, MESDESL, MESDESC, 1 TOTREG '
  + '           FROM (SELECT D.DPTODES DEPARTAMENTO '
  + '                       ,A.OFDESNOM OFICINA '
  + '                       ,A.BENEFDES TIPO_BENEFICIO '
  + '                       ,A.ESTADO '
  + '                       ,A.HOJA_CARGO '
  + '                       ,A.EXPEDIENTE '
  + '                       ,TRUNC(NVL(C.FECHA_HOJA_CARGO, A.FECHA_EXPEDIENTE_RECEPCION)) FECHA_HOJA_CARGO '
  + '                       ,A.FECHA_EXPEDIENTE_RECEPCION '
  + '                       ,A.FECHA_EXPEDIENTE_SISTEMA '
  + '                       ,A.ANO, A.MES, M.MESDESL, M.MESDESC '
  + '                  FROM (SELECT A.CODCAREXP HOJA_CARGO '
  + '                              ,A.PVSEXPNRO EXPEDIENTE '
  + '                              ,C.OFDESNOM '
  + '                              ,B.BENEFDES '
  + '                              ,TRUNC(A.FECRECEXP) FECHA_EXPEDIENTE_RECEPCION '
  + '                              ,TRUNC(A.PVSFECEXP)      FECHA_EXPEDIENTE_SISTEMA '
  + '                              ,DECODE(A.DEPORIEXP,''07'',''15'',A.DEPORIEXP) DPTOID '
  + '                              ,D.PVSESTDES ESTADO, '
  + '                               TO_CHAR(A.PVSFECEXP, ''YYYY'') ANO, TO_CHAR(A.PVSFECEXP, ''MM'') MES '
  + '                         FROM DB2ADMIN.PVS301 A '
  + '                             ,DB2ADMIN.TGE186 B '
  + '                             ,DB2ADMIN.APO110 C '
  + '                             ,DB2ADMIN.PVS102 D '
  + '                             ,DB2ADMIN.PVSSEGEXPCAB X '
  + '                        WHERE A.PVSLBENNR IS NULL '
  + '                          AND A.PVSTIPBEN IN (''01'', ''02'', ''03'') '
  + '                          AND TO_CHAR(A.PVSFECEXP,''YYYY'') = ' + QuotedStr(xsSelAnho)
  + '                          AND A.PVSTIPBEN = B.TIPBENEF '
  + '                          AND A.OFIORIEXP = C.OFDESID '
  + '                          AND A.PVSESTADO = D.PVSESTDSG '
  + '                          AND D.PVSDOC = ''E'' '
  + '                          AND NVL(A.OFIORIEXP,''XX'') = NVL((CASE WHEN ' + QuotedStr(xsSelOFDESID)   + ' = ''00'' THEN A.OFIORIEXP ELSE ' + QuotedStr(xsSelOFDESID)   + ' END),''XX'') '
  + '                          AND NVL(A.PVSTIPBEN,''XX'') = NVL((CASE WHEN ' + QuotedStr(xsSelPVSTIPBEN) + ' = ''00'' THEN A.PVSTIPBEN ELSE ' + QuotedStr(xsSelPVSTIPBEN) + ' END),''XX'') '
  + '                          AND A.PVSEXPNRO =X.NUMEXP AND X.CODSITEXP=''01'' and A.asoid=X.ASOID AND X.CODESTEXP=''03'' '
  + '                       ) A '
  + '                     ,(SELECT A.CODCAREXP, TRUNC(B.FECHA) FECHA_HOJA_CARGO '
  + '                         FROM DB2ADMIN.PRE_CARGO_EXPEDIENTE_MOV     A '
  + '                             ,DB2ADMIN.PRE_CARGO_EXPEDIENTE_EST_MOV B '
  + '                        WHERE A.CODCAREXPEST = ''LIQUIDADA'' '
  + '                          AND A.CODCAREXP = B.CODCAREXP '
  + '                          AND B.CODCAREXPEST = ''PENDIENTE'') C '
  + '                     ,DB2ADMIN.APO158 D, db2admin.TGE181 M '
  + '                 WHERE A.HOJA_CARGO = C.CODCAREXP(+) '
  + '                   AND A.DPTOID =  D.DPTOID(+) '
  + '                   AND NVL(A.DPTOID,''XX'') = NVL((CASE WHEN ' + QuotedStr(xsSelDPTOID) + ' = ''00'' THEN A.DPTOID ELSE ' + QuotedStr(xsSelDPTOID) + ' END),''XX'') '
  + '                   AND A.MES=M.MESIDR(+) '
  + '                 ORDER BY D.DPTODES, A.OFDESNOM '
  + '                ) '
  + '        ) A '
  + ' GROUP BY MESDESC, MES '
  + ' ORDER BY MES ';

  chrtExpObs.FreeAllSeries;

  xxCdsQryTiempoExpObs.Close;
  xxCdsQryTiempoExpObs.DataRequest(xsSQL);
  xxCdsQryTiempoExpObs.Open;

  pnlTotObs.Caption:='                              ';
  nRet:=0;  nFal:=0;  nInv:=0;
  xxCdsQryTiempoExpObs.first;
  while not xxCdsQryTiempoExpObs.Eof do
  begin
     IF (dbltipbenef.Text='00') OR (dbltipbenef.Text='01') then
        nRet:= nRet + xxCdsQryTiempoExpObs.FieldbyName('RETIRO').AsInteger;
     IF (dbltipbenef.Text='00') OR (dbltipbenef.Text='02') then
        nFal:= nFal + xxCdsQryTiempoExpObs.FieldbyName('FALLECIMIENTO').AsInteger;
     IF (dbltipbenef.Text='00') OR (dbltipbenef.Text='03') then
        nInv:= nInv + xxCdsQryTiempoExpObs.FieldbyName('INVALIDEZ').AsInteger;
     xxCdsQryTiempoExpObs.Next;
  end;

  IF (dbltipbenef.Text='00') OR (dbltipbenef.Text='01') then
     pnlTotObs.Caption:=pnlTotObs.Caption+'           RETIRO: '+IntToStr(nRet);
  IF (dbltipbenef.Text='00') OR (dbltipbenef.Text='02') then
     pnlTotObs.Caption:=pnlTotObs.Caption+'           FALLECIMIENTO: '+IntToStr(nFal);
  IF (dbltipbenef.Text='00') OR (dbltipbenef.Text='03') then
     pnlTotObs.Caption:=pnlTotObs.Caption+'           INVALIDEZ: '+IntToStr(nInv);

  xxCdsQryTiempoExpObs.first;

  // muestra grafico
  CreaGrafico(7, xxCdsQryTiempoExpObs,
              chrtExpObs, 'EXPEDIENTES OBSERVADOS ( CANTIDAD )',
              'AÑO : ' + dblAnnio.Text + ' | DEPARTAMENTO : ' +  medptodes.Text + ' | OFICINA : ' +  edtOficina.Text + ' | TIPO DE BENEFICIO : ' + metipbenef.Text,
              'S');
  screen.Cursor := crDefault;
end;
// FIN HPC_201610_PRE


// INICIO HPC_201610_PRE
// MUESTRA TIEMPO DE LIQUIDACION
(******************************************************************************)
procedure TfIndGestion.FG_MUESTRA_TIEMPO_PROMEDIO_LIQ;
var xsSQL : String;
begin
  screen.Cursor := crHourGlass;
// Inicio HPC_201707_PRE : MODIFICAR INDICADORES DE CALIDAD
  xsSQL :=
    ' SELECT TIPO_BENEFICIO '
  +      ' ,CEIL(AVG(DIAS_CARGO_EXPREC)) RECEPCION ' (*DIAS_CARGO_EXPREC*)
  +      ' ,CEIL(AVG(DIAS_EXPREC_EXPSIS)) EXPEDIENTE '
  +      ' ,CEIL(AVG(DIAS_EXPSIS_LIQ)) LIQUIDACION '
  +      ' ,CEIL(AVG(DIAS_LIQ_DES)) DESEMBOLSO '
  +      ' ,CEIL(AVG(DIAS_CARGO_DESEMBOLSO)) TIEMPO_TOTAL '
  +   ' FROM (SELECT OFICINA '
  +            ' ,DEPARTAMENTO '
  +            ' ,TIPO_BENEFICIO '
//  +            ' ,DB2ADMIN.DIAS_LABORABLES(FECHA_HOJA_CARGO, FECHA_EXPEDIENTE_RECEPCION) DIAS_CARGO_EXPREC '
//  +            ' ,DB2ADMIN.DIAS_LABORABLES(FECHA_EXPEDIENTE_RECEPCION, FECHA_EXPEDIENTE_SISTEMA) DIAS_EXPREC_EXPSIS '
//  +            ' ,DB2ADMIN.DIAS_LABORABLES(FECHA_EXPEDIENTE_SISTEMA, FECHA_LIQUIDACION) DIAS_EXPSIS_LIQ '
//  +            ' ,DB2ADMIN.DIAS_LABORABLES(FECHA_LIQUIDACION, FECHA_DESEMBOLSO) DIAS_LIQ_DES '

//    + '       ,DB2ADMIN.DIAS_LABORABLES(TRUNC(NVL(C.FECHA_HOJA_CARGO, A.FECHA_EXPEDIENTE_RECEPCION)), FECHA_EXPEDIENTE_RECEPCION) DIAS_CARGO_EXPREC '
    + '       ,CASE WHEN DB2ADMIN.DIAS_LABORABLES(TRUNC(NVL(FECHA_HOJA_CARGO, FECHA_EXPEDIENTE_RECEPCION)), FECHA_EXPEDIENTE_RECEPCION)-1 <= 0 THEN 1 '
    + '             ELSE DB2ADMIN.DIAS_LABORABLES(TRUNC(NVL(FECHA_HOJA_CARGO, FECHA_EXPEDIENTE_RECEPCION)), FECHA_EXPEDIENTE_RECEPCION)-1 END DIAS_CARGO_EXPREC '

//    + '       ,DB2ADMIN.DIAS_LABORABLES(FECHA_EXPEDIENTE_RECEPCION, FECHA_EXPEDIENTE_SISTEMA) DIAS_EXPREC_EXPSIS '
    + '       ,CASE WHEN DB2ADMIN.DIAS_LABORABLES(FECHA_EXPEDIENTE_RECEPCION, FECHA_EXPEDIENTE_SISTEMA)-1 <= 0 THEN 1 '
    + '             ELSE DB2ADMIN.DIAS_LABORABLES(FECHA_EXPEDIENTE_RECEPCION, FECHA_EXPEDIENTE_SISTEMA)-1 END DIAS_EXPREC_EXPSIS '

//    + '       ,DB2ADMIN.DIAS_LABORABLES(FECHA_EXPEDIENTE_SISTEMA, FECHA_LIQUIDACION) DIAS_EXPSIS_LIQ '
    + '       ,CASE WHEN DB2ADMIN.DIAS_LABORABLES(FECHA_EXPEDIENTE_SISTEMA, FECHA_LIQUIDACION)-1 <= 0 THEN 1 '
    + '             ELSE DB2ADMIN.DIAS_LABORABLES(FECHA_EXPEDIENTE_SISTEMA, FECHA_LIQUIDACION)-1 END DIAS_EXPSIS_LIQ '

//    + '       ,DB2ADMIN.DIAS_LABORABLES(FECHA_LIQUIDACION, FECHA_DESEMBOLSO) DIAS_LIQ_DES '
    + '       ,CASE WHEN DB2ADMIN.DIAS_LABORABLES(FECHA_LIQUIDACION, FECHA_DESEMBOLSO)-1 <= 0 THEN 1 '
    + '             ELSE DB2ADMIN.DIAS_LABORABLES(FECHA_LIQUIDACION, FECHA_DESEMBOLSO)-1 END DIAS_LIQ_DES '


  +            ' ,CASE WHEN DB2ADMIN.DIAS_LABORABLES(FECHA_HOJA_CARGO, FECHA_DESEMBOLSO)-1 <= 0 THEN 1 '
  +            '       ELSE DB2ADMIN.DIAS_LABORABLES(FECHA_HOJA_CARGO, FECHA_DESEMBOLSO)-1 END DIAS_CARGO_DESEMBOLSO '
  +           ' FROM (SELECT A.OFDESNOM OFICINA '
  +                       ' ,D.DPTODES DEPARTAMENTO '
  +                       ' ,A.BENEFDES TIPO_BENEFICIO '
  +                       ' ,TRUNC(NVL(C.FECHA_HOJA_CARGO, A.FECHA_EXPEDIENTE_RECEPCION)) FECHA_HOJA_CARGO '
  +                       ' ,A.FECHA_EXPEDIENTE_RECEPCION '
  +                       ' ,A.FECHA_EXPEDIENTE_SISTEMA '
  +                       ' ,B.FECHA_LIQUIDACION '
  +                       ' ,B.FECHA_DESEMBOLSO '
  + '                   FROM (SELECT A.PVSEXPNRO '
  + '                               ,A.CODCAREXP '
  + '                               ,C.OFDESNOM '
  + '                               ,B.BENEFDES '
  + '                               ,TRUNC(A.FECRECEXP) FECHA_EXPEDIENTE_RECEPCION '
  + '                               ,TRUNC(A.PVSFECEXP) FECHA_EXPEDIENTE_SISTEMA '
  + '                               ,DECODE(A.DEPORIEXP,''07'',''15'',A.DEPORIEXP) DPTOID '
  + '                           FROM DB2ADMIN.PVS301 A '
  + '                               ,DB2ADMIN.TGE186 B '
  + '                               ,DB2ADMIN.APO110 C '
  + '                          WHERE A.PVSESTADO NOT IN (''04'', ''13'') '
  + '                            AND A.PVSLBENNR IS NOT NULL '
  + '                            AND A.PVSTIPBEN IN (''01'', ''02'', ''03'') '
                                 
  + '                            AND NVL(A.FORSOLBEN,''S'') = ''S'' '   // NO CONSIDERAR POR OFICIO
  + '                            AND A.PVSTIPBEN = B.TIPBENEF '
  + '                            AND A.OFIORIEXP = C.OFDESID '
  + '                            AND NVL(A.OFIORIEXP,''XX'') = NVL((CASE WHEN ' + QuotedStr(xsSelOFDESID) + '= ''00''   THEN A.OFIORIEXP ELSE ' + QuotedStr(xsSelOFDESID) + '   END),''XX'') '
  + '                            AND NVL(A.PVSTIPBEN,''XX'') = NVL((CASE WHEN ' + QuotedStr(xsSelPVSTIPBEN) + '= ''00'' THEN A.PVSTIPBEN ELSE ' + QuotedStr(xsSelPVSTIPBEN) + ' END),''XX'') '
  + '                        ) A '
  + '                       ,(SELECT A.PVSEXPNRO, A.PVSLBENNR, TRUNC(A.PVSLFECBE) FECHA_LIQUIDACION, TRUNC(MAX(B.FECPAG)) FECHA_DESEMBOLSO '
  + '                           FROM DB2ADMIN.PVS306 A '
  + '                               ,DB2ADMIN.PVS307 B '
  + '                          WHERE TO_CHAR(A.PVSLFECBE,''YYYY'') = ' + QuotedStr(xsSelAnho)
  + '                            AND A.PVSESTLIQ NOT IN (''04'', ''13'') '
  + '                            AND A.PVSLBENNR = B.PVSLBENNR '
  + '                            AND B.PVSLAGRID = ''FPG'' '
  + '                            AND B.FLGVOUCHER = ''N'' '
  + '                            AND NVL(B.PVSLMONTO, 0) > 0 '
  + '                            AND B.FECPAG IS NOT NULL '
  + '                            AND (B.PVSLNOFC IS NOT NULL OR B.NROCHEQUE IS NOT NULL) '
  + '                          GROUP BY A.PVSEXPNRO, A.PVSLBENNR, TRUNC(A.PVSLFECBE))B '
  + '                       ,(SELECT A.CODCAREXP, TRUNC(B.FECHA) FECHA_HOJA_CARGO '
  + '                            FROM DB2ADMIN.PRE_CARGO_EXPEDIENTE_MOV     A '
  + '                               ,DB2ADMIN.PRE_CARGO_EXPEDIENTE_EST_MOV B '
  
  //+ '                          WHERE A.CODCAREXPEST = ''LIQUIDADA'' '
  //+ '                            AND A.CODCAREXP = B.CODCAREXP '
  + '                          WHERE A.CODCAREXP = B.CODCAREXP '
  + '                            AND B.CODCAREXPEST = ''PENDIENTE'') C '
  + '                       ,DB2ADMIN.APO158 D '
  + '    , ( '
  + '        SELECT PVSEXPNRO, PVSLBENNR, ''EXTORNADO'' EXTORNADO '
  + '          FROM DB2ADMIN.PVS306 '
  + '         WHERE PVSESTLIQ=''04'' '
  + '       ) E '
  + '                  WHERE A.PVSEXPNRO = B.PVSEXPNRO '
  + '                    AND A.CODCAREXP = C.CODCAREXP(+) '
  + '                    AND NVL(A.DPTOID,''XX'')    = NVL((CASE WHEN ' + QuotedStr(xsSelDPTOID) + '= ''00''    THEN A.DPTOID    ELSE ' + QuotedStr(xsSelDPTOID) + '    END),''XX'') '
  + '                    AND A.DPTOID =  D.DPTOID(+) '
  + '                    and A.PVSEXPNRO = E.PVSEXPNRO(+) AND E.EXTORNADO IS NULL '
  + '           ) '
  + '        ) A '
  + ' GROUP BY TIPO_BENEFICIO '
  + ' ORDER BY TIPO_BENEFICIO ';
// Fin   HPC_201707_PRE : MODIFICAR INDICADORES DE CALIDAD


  xxCdsQryTiempoPromedioLiq.Close;
  xxCdsQryTiempoPromedioLiq.DataRequest(xsSQL);
  xxCdsQryTiempoPromedioLiq.Open;
  // muestra grafico
  CreaGrafico(1, xxCdsQryTiempoPromedioLiq,
              chrtTiempoPromedioLiquidacion, 'TIEMPO PROMEDIO DE LIQUIDACIÓN ( EN DÍAS )',
              'AÑO : ' + dblAnnio.Text + ' | DEPARTAMENTO : ' +  medptodes.Text + ' | OFICINA : ' +  edtOficina.Text + ' | TIPO DE BENEFICIO : ' + metipbenef.Text,
              'S');
  screen.Cursor := crDefault;
end;
// FIN HPC_201610_PRE


// INICIO HPC_201610_PRE
// EXPORTA A EXCEL
(******************************************************************************)
procedure TfIndGestion.btnAExcelClick(Sender: TObject);
var xsSQL : String;
    xxExcApp: OleVariant;
begin
  IF not xxCdsQryTiempoPromedioLiq.Active then Exit;

  IF TabSheet2.Showing THEN BEGIN
    Screen.Cursor := crHourGlass;
    xsSQL :=
          'SELECT TO_CHAR(A.PVSLFECBE,''YYYY'') ANO, F.MESIDR||''-''||F.MESDESC MES, E.PVSESTDES, '
        + '       CASE WHEN A.PVSESTLIQ IN (''05'',''13'') THEN 1 ELSE 0 END CON_RE_PRO, '
        + '       CASE WHEN A.PVSESTLIQ IN (''02'',''06'') THEN 1 ELSE 0 END SIN_RE_PRO, '
        + '       TRUNC(B.FECRECEXP) FECHA_EXPEDIENTE_RECEPCION, '
        + '       TRUNC(B.PVSFECEXP) FECHA_EXPEDIENTE_SISTEMA, '
        + '       A.PVSLBENNR, A.PVSEXPNRO, A.ASOAPENOMDNI, A.PVSFANUL, PVSMOTANUL '
        + '  FROM PVS306 A, PVS301 B, TGE186 C, APO158 D, '
        + '       (SELECT PVSESTDSG, PVSESTDES FROM PVS102 WHERE PVSDOC = ''L'') E , TGE181 F '
        + ' WHERE TO_CHAR(A.PVSLFECBE,''YYYY'') = ' + QuotedStr(xsSelAnho)
        + '   AND NVL(B.OFIORIEXP,''XX'') = NVL((CASE WHEN ' + QuotedStr(xsSelOFDESID) + '= ''00''   THEN B.OFIORIEXP ELSE ' + QuotedStr(xsSelOFDESID) + '   END),''XX'') '
        + '   AND NVL(B.PVSTIPBEN,''XX'') = NVL((CASE WHEN ' + QuotedStr(xsSelPVSTIPBEN) + '= ''00'' THEN B.PVSTIPBEN ELSE ' + QuotedStr(xsSelPVSTIPBEN) + ' END),''XX'') '
        + '   AND A.ASOID = B.ASOID(+) '
        + '   AND A.PVSESTLIQ NOT IN (''04'') '
        + '   AND A.PVSLBENNR = B.PVSLBENNR(+) '
        + '   AND A.PVSLTIPBE = C.TIPBENEF(+) '
        + '   AND A.PVSESTLIQ = E.PVSESTDSG '
        + '   AND SUBSTR(B.DISORIEXP, 1,2) = D.DPTOID(+) '
        + '   AND TO_CHAR(A.PVSLFECBE,''MM'')=F.MESIDR ';
    xxCdsQryTiempoPromedioLiqXLS.Close;
    xxCdsQryTiempoPromedioLiqXLS.DataRequest(xsSQL);
    xxCdsQryTiempoPromedioLiqXLS.Open;
    WITH dtgTiempoPromedioLiquidacionXLS DO BEGIN
        DataSource := xxDsQryTiempoPromedioLiqXLS;
        Selected.Clear;
        Selected.Add('ANO'#9'10'#9'AÑO');
        Selected.Add('MES'#9'10'#9'MES');
        Selected.Add('PVSESTDES'#9'20'#9'ESTADO');
        Selected.Add('CON_RE_PRO'#9'20'#9'HOJA_CARGO');
        Selected.Add('SIN_RE_PRO'#9'20'#9'No.EXPEDIENTE');
        Selected.Add('PVSLBENNR'#9'20'#9'BENEFICIO');
        Selected.Add('PVSEXPNRO'#9'20'#9'NOMBRE');
        Selected.Add('FECHA_EXPEDIENTE_RECEPCION'#9'20'#9'FECHA_EXPEDIENTE_RECEPCION');
        Selected.Add('FECHA_EXPEDIENTE_SISTEMA'#9'20'#9'FECHA_EXPEDIENTE_SISTEMA');
        Selected.Add('ASOAPENOMDNI'#9'20'#9'ASOCIADO');
        Selected.Add('PVSFANUL'#9'20'#9'FECHA_ANULACION');
        Selected.Add('PVSMOTANUL'#9'20'#9'MOTIVO_ANULACION');
        ApplySelected;
    end;
    xxExcApp := DM1.FG_EXPORTA_XLS(dtgTiempoPromedioLiquidacionXLS, 'BENEFICIOS CON REPROCESOS');
    xxExcApp.visible := True;
    Screen.Cursor := crDefault;
  END;

  IF tsTiempoPromedioLiquidacion.Showing THEN BEGIN
    Screen.Cursor := crHourGlass;
// Inicio HPC_201707_PRE : MODIFICAR INDICADORES DE CALIDAD
    xsSQL :=
      ' SELECT D.DPTODES DEPARTAMENTO '
    + '       ,A.OFDESNOM OFICINA '
    + '       ,A.BENEFDES TIPO_BENEFICIO '
    + '       ,A.CODCAREXP HOJA_CARGO '
    + '       ,A.PVSEXPNRO EXPEDIENTE '
    + '       ,A.PVSLBENNR BENEFICIO, A.ASOAPENOMDNI '
    + '       ,TRUNC(NVL(C.FECHA_HOJA_CARGO, A.FECHA_EXPEDIENTE_RECEPCION)) FECHA_HOJA_CARGO '
    + '       ,A.FECHA_EXPEDIENTE_RECEPCION '
    + '       ,A.FECHA_EXPEDIENTE_SISTEMA '

    +       ' ,(select freg from PVSSEGEXPDET A '
    +          ' where numexp in (a.PVSEXPNRO) and codestexp=''03'' and codsitexp=''01'' '
    +            ' and hreg=(select max(hreg) from PVSSEGEXPDET A '
    +                       ' where numexp in (a.PVSEXPNRO) and codestexp=''03'' and codsitexp=''01'') '
    +        ' ) FECHA_OBSERVACIONES '

    + '       ,B.FECHA_LIQUIDACION '
    + '       ,B.FECHA_DESEMBOLSO '
    + '       ,DB2ADMIN.DIAS_LABORABLES(TRUNC(NVL(C.FECHA_HOJA_CARGO, A.FECHA_EXPEDIENTE_RECEPCION)), FECHA_EXPEDIENTE_RECEPCION) RECEPCION '
    + '       ,DB2ADMIN.DIAS_LABORABLES(FECHA_EXPEDIENTE_RECEPCION, FECHA_EXPEDIENTE_SISTEMA) EXPEDIENTE_D '
    + '       ,DB2ADMIN.DIAS_LABORABLES(FECHA_EXPEDIENTE_SISTEMA, FECHA_LIQUIDACION) LIQUIDACION '
    + '       ,DB2ADMIN.DIAS_LABORABLES(FECHA_LIQUIDACION, FECHA_DESEMBOLSO) DESEMBOLSO '
    + '       ,CASE WHEN DB2ADMIN.DIAS_LABORABLES(TRUNC(NVL(C.FECHA_HOJA_CARGO, A.FECHA_EXPEDIENTE_RECEPCION)), FECHA_DESEMBOLSO)-1 <= 0 THEN 1 '
    + '             ELSE DB2ADMIN.DIAS_LABORABLES(TRUNC(NVL(C.FECHA_HOJA_CARGO, A.FECHA_EXPEDIENTE_RECEPCION)), FECHA_DESEMBOLSO)-1 END DIAS_TOTAL '
    + '  FROM (SELECT A.ASOAPENOMDNI, A.CODCAREXP '
    + '              ,A.PVSEXPNRO '
    + '              ,A.PVSLBENNR '
    + '              ,C.OFDESNOM '
    + '              ,B.BENEFDES '
    + '              ,TRUNC(A.FECRECEXP) FECHA_EXPEDIENTE_RECEPCION '
    + '              ,TRUNC(A.PVSFECEXP)      FECHA_EXPEDIENTE_SISTEMA '
    + '              ,DECODE(A.DEPORIEXP,''07'',''15'',A.DEPORIEXP) DPTOID '
    + '          FROM DB2ADMIN.PVS301 A '
    + '              ,DB2ADMIN.TGE186 B '
    + '              ,DB2ADMIN.APO110 C '
    + '         WHERE A.PVSESTADO NOT IN (''04'', ''13'') '
    + '           AND A.PVSLBENNR IS NOT NULL '
    + '           AND A.PVSTIPBEN IN (''01'', ''02'', ''03'') '
    + '           AND A.PVSTIPBEN = B.TIPBENEF '
    + '           AND A.OFIORIEXP = C.OFDESID '
    + '           AND NVL(A.OFIORIEXP,''XX'') = NVL((CASE WHEN ' + QuotedStr(xsSelOFDESID) + '= ''00''   THEN A.OFIORIEXP ELSE ' + QuotedStr(xsSelOFDESID) + '   END),''XX'') '
    + '           AND NVL(A.PVSTIPBEN,''XX'') = NVL((CASE WHEN ' + QuotedStr(xsSelPVSTIPBEN) + '= ''00'' THEN A.PVSTIPBEN ELSE ' + QuotedStr(xsSelPVSTIPBEN) + ' END),''XX'') '
    + '       ) A '
    + '      ,(SELECT A.PVSEXPNRO, A.PVSLBENNR, TRUNC(A.PVSLFECBE) FECHA_LIQUIDACION, TRUNC(MAX(B.FECPAG)) FECHA_DESEMBOLSO '
    + '          FROM DB2ADMIN.PVS306 A '
    + '              ,DB2ADMIN.PVS307 B '
    + '         WHERE TO_CHAR(A.PVSLFECBE,''YYYY'') = ' + QuotedStr(xsSelAnho)
    + '           AND A.PVSESTLIQ NOT IN (''04'', ''13'') '
    + '           AND A.PVSLBENNR = B.PVSLBENNR '
    + '           AND B.PVSLAGRID = ''FPG'' '
    + '           AND B.FLGVOUCHER = ''N'' '
    + '           AND NVL(B.PVSLMONTO, 0) > 0 '
    + '           AND B.FECPAG IS NOT NULL '
    + '           AND (B.PVSLNOFC IS NOT NULL OR B.NROCHEQUE IS NOT NULL) '
    + '         GROUP BY A.PVSEXPNRO, A.PVSLBENNR, TRUNC(A.PVSLFECBE))B '
    + '      ,(SELECT A.CODCAREXP, TRUNC(B.FECHA) FECHA_HOJA_CARGO '
    + '          FROM DB2ADMIN.PRE_CARGO_EXPEDIENTE_MOV     A '
    + '              ,DB2ADMIN.PRE_CARGO_EXPEDIENTE_EST_MOV B '
    
    //+ '         WHERE A.CODCAREXPEST = ''LIQUIDADA'' '
    //+ '           AND A.CODCAREXP = B.CODCAREXP '
    + '         WHERE A.CODCAREXP = B.CODCAREXP '
    + '           AND B.CODCAREXPEST = ''PENDIENTE'') C '
    + '      ,DB2ADMIN.APO158 D '
    + '    , ( '
    + '        SELECT PVSEXPNRO, PVSLBENNR, ''EXTORNADO'' EXTORNADO '
    + '          FROM DB2ADMIN.PVS306 '
    + '         WHERE PVSESTLIQ=''04'' '
    + '       ) E '
    + ' WHERE A.PVSEXPNRO = B.PVSEXPNRO '
    + '   AND A.CODCAREXP = C.CODCAREXP(+) '
    + '   AND A.DPTOID = D.DPTOID(+) '
    + '   AND NVL(D.DPTOID,''XX'')    = NVL((CASE WHEN ' + QuotedStr(xsSelDPTOID) + '= ''00''    THEN D.DPTOID    ELSE ' + QuotedStr(xsSelDPTOID) + '    END),''XX'') '
    + '   and A.PVSEXPNRO = E.PVSEXPNRO(+) AND E.EXTORNADO IS NULL '
    + ' ORDER BY D.DPTODES, A.OFDESNOM ';
// Fin HPC_201707_PRE : MODIFICAR INDICADORES DE CALIDAD


    xxCdsQryTiempoPromedioLiqXLS.Close;
    xxCdsQryTiempoPromedioLiqXLS.DataRequest(xsSQL);
    xxCdsQryTiempoPromedioLiqXLS.Open;
    WITH dtgTiempoPromedioLiquidacionXLS DO BEGIN
        DataSource := xxDsQryTiempoPromedioLiqXLS;
        Selected.Clear;
        Selected.Add('DEPARTAMENTO'#9'20'#9'DEPARTAMENTO');
        Selected.Add('OFICINA'#9'20'#9'OFICINA');
        Selected.Add('TIPO_BENEFICIO'#9'20'#9'TIPO_BENEFICIO');
        Selected.Add('HOJA_CARGO'#9'20'#9'HOJA_CARGO');
        Selected.Add('EXPEDIENTE'#9'20'#9'No.EXPEDIENTE');
        Selected.Add('BENEFICIO'#9'20'#9'BENEFICIO');
        Selected.Add('ASOAPENOMDNI'#9'20'#9'NOMBRE');
        Selected.Add('FECHA_HOJA_CARGO'#9'20'#9'FECHA_HOJA_CARGO');
        Selected.Add('FECHA_EXPEDIENTE_RECEPCION'#9'20'#9'FECHA_EXPEDIENTE_RECEPCION');
        Selected.Add('FECHA_EXPEDIENTE_SISTEMA'#9'20'#9'FECHA_EXPEDIENTE_SISTEMA');
// Inicio HPC_201707_PRE : MODIFICAR INDICADORES DE CALIDAD
        Selected.Add('FECHA_OBSERVACIONES'#9'20'#9'FECHA_OBSERVACIONES');
// Fin   HPC_201707_PRE : MODIFICAR INDICADORES DE CALIDAD
        Selected.Add('FECHA_LIQUIDACION'#9'20'#9'FECHA_LIQUIDACION');
        Selected.Add('FECHA_DESEMBOLSO'#9'20'#9'FECHA_DESEMBOLSO');
        Selected.Add('RECEPCION'#9'20'#9'RECEPCION');
        Selected.Add('EXPEDIENTE_D'#9'20'#9'EXPEDIENTE');
        Selected.Add('LIQUIDACION'#9'20'#9'LIQUIDACION');
        Selected.Add('DESEMBOLSO'#9'20'#9'DESEMBOLSO');
        Selected.Add('DIAS_TOTAL'#9'20'#9'TIEMPO_TOTAL');
        ApplySelected;
    end;
    xxExcApp := DM1.FG_EXPORTA_XLS(dtgTiempoPromedioLiquidacionXLS, 'TIEMPO_PROM_LIQ');
    xxExcApp.visible := True;
    Screen.Cursor := crDefault;
  END;

  IF tsExpedienteProceso.Showing THEN BEGIN
    Screen.Cursor := crHourGlass;
    xsSQL :=
      ' SELECT D.DPTODES DEPARTAMENTO '
    + '       ,A.OFDESNOM OFICINA '
    + '       ,A.BENEFDES TIPO_BENEFICIO '
    + '       ,A.ESTADO '
    + '       ,A.HOJA_CARGO '
    + '       ,A.EXPEDIENTE, A.ASOAPENOMDNI '
    + '       ,TRUNC(NVL(C.FECHA_HOJA_CARGO, A.FECHA_EXPEDIENTE_RECEPCION)) FECHA_HOJA_CARGO '
    + '       ,A.FECHA_EXPEDIENTE_RECEPCION '
    + '       ,A.FECHA_EXPEDIENTE_SISTEMA '
    + '       ,TO_CHAR(SYSDATE,''DD/MM/YYYY'') FECHA_ACTUAL '
    + '       ,DB2ADMIN.DIAS_LABORABLES(TRUNC(NVL(C.FECHA_HOJA_CARGO, A.FECHA_EXPEDIENTE_RECEPCION)), FECHA_EXPEDIENTE_RECEPCION) RECEPCION '
    + '       ,DB2ADMIN.DIAS_LABORABLES(FECHA_EXPEDIENTE_RECEPCION, FECHA_EXPEDIENTE_SISTEMA) EXPEDIENTE_P '
    + '       ,DB2ADMIN.DIAS_LABORABLES(FECHA_EXPEDIENTE_SISTEMA, TO_CHAR(SYSDATE,''DD/MM/YYYY'')) EXPEDIENTE_A_HOY '
    + '       ,CASE WHEN DB2ADMIN.DIAS_LABORABLES(TRUNC(NVL(C.FECHA_HOJA_CARGO, A.FECHA_EXPEDIENTE_RECEPCION)), TO_CHAR(SYSDATE,''DD/MM/YYYY''))-1 <= 0 THEN 1 '
    + '             ELSE DB2ADMIN.DIAS_LABORABLES(TRUNC(NVL(C.FECHA_HOJA_CARGO, A.FECHA_EXPEDIENTE_RECEPCION)), TO_CHAR(SYSDATE,''DD/MM/YYYY''))-1 END TOTAL_DIAS_A_HOY '
    + '  FROM (SELECT A.ASOAPENOMDNI, A.CODCAREXP HOJA_CARGO '
    + '              ,A.PVSEXPNRO EXPEDIENTE '
    + '              ,C.OFDESNOM '
    + '              ,B.BENEFDES '
    + '              ,TRUNC(A.FECRECEXP) FECHA_EXPEDIENTE_RECEPCION '
    + '              ,TRUNC(A.PVSFECEXP) FECHA_EXPEDIENTE_SISTEMA '
    + '              ,DECODE(A.DEPORIEXP,''07'',''15'',A.DEPORIEXP) DPTOID '
    + '              ,D.PVSESTDES ESTADO '
    + '         FROM DB2ADMIN.PVS301 A '
    + '             ,DB2ADMIN.TGE186 B '
    + '             ,DB2ADMIN.APO110 C '
    + '             ,DB2ADMIN.PVS102 D '
    + '        WHERE A.PVSESTADO IN (''01'', ''05'') '
    + '          AND A.PVSLBENNR IS NULL '
    + '          AND A.PVSTIPBEN IN (''01'', ''02'', ''03'') '
    + '          AND TO_CHAR(A.PVSFECEXP,''YYYY'') = ' + QuotedStr(xsSelAnho)
    + '          AND A.PVSTIPBEN = B.TIPBENEF '
    + '          AND A.OFIORIEXP = C.OFDESID '
    + '          AND A.PVSESTADO = D.PVSESTDSG '
    + '          AND D.PVSDOC = ''E'' '
    + '          AND NVL(A.OFIORIEXP,''XX'') = NVL((CASE WHEN ' + QuotedStr(xsSelOFDESID)   + ' = ''00'' THEN A.OFIORIEXP ELSE ' + QuotedStr(xsSelOFDESID)   + ' END),''XX'') '
    + '          AND NVL(A.PVSTIPBEN,''XX'') = NVL((CASE WHEN ' + QuotedStr(xsSelPVSTIPBEN) + ' = ''00'' THEN A.PVSTIPBEN ELSE ' + QuotedStr(xsSelPVSTIPBEN) + ' END),''XX'') '
    + '       ) A '
    + '      ,(SELECT A.CODCAREXP, TRUNC(B.FECHA) FECHA_HOJA_CARGO '
    + '          FROM DB2ADMIN.PRE_CARGO_EXPEDIENTE_MOV     A '
    + '              ,DB2ADMIN.PRE_CARGO_EXPEDIENTE_EST_MOV B '
    + '         WHERE A.CODCAREXPEST = ''LIQUIDADA'' '
    + '           AND A.CODCAREXP = B.CODCAREXP '
    + '           AND B.CODCAREXPEST = ''PENDIENTE'') C '
    + '      ,DB2ADMIN.APO158 D '
    + ' WHERE A.HOJA_CARGO = C.CODCAREXP(+) '
    + '   AND A.DPTOID =  D.DPTOID(+) '
    + '   AND NVL(A.DPTOID,''XX'') = NVL((CASE WHEN ' + QuotedStr(xsSelDPTOID) + ' = ''00'' THEN A.DPTOID ELSE ' + QuotedStr(xsSelDPTOID) + ' END),''XX'') '
    + ' ORDER BY D.DPTODES, A.OFDESNOM ';
    xxCdsQryTiempoExpProXLS.Close;
    xxCdsQryTiempoExpProXLS.DataRequest(xsSQL);
    xxCdsQryTiempoExpProXLS.Open;
    WITH dtgExpeProXLS DO BEGIN
        DataSource := xxDsQryTiempoExpProXLS;
        Selected.Clear;
        Selected.Add('DEPARTAMENTO'#9'20'#9'DEPARTAMENTO');
        Selected.Add('OFICINA'#9'20'#9'OFICINA');
        Selected.Add('TIPO_BENEFICIO'#9'20'#9'TIPO_BENEFICIO');
        Selected.Add('ESTADO'#9'20'#9'ESTADO');
        Selected.Add('HOJA_CARGO'#9'20'#9'HOJA_CARGO');
        Selected.Add('EXPEDIENTE'#9'20'#9'No.EXPEDIENTE');
        Selected.Add('ASOAPENOMDNI'#9'20'#9'NOMBRE');
        Selected.Add('FECHA_HOJA_CARGO'#9'20'#9'FECHA_HOJA_CARGO');
        Selected.Add('FECHA_EXPEDIENTE_RECEPCION'#9'20'#9'FECHA_EXPEDIENTE_RECEPCION');
        Selected.Add('FECHA_EXPEDIENTE_SISTEMA'#9'20'#9'FECHA_EXPEDIENTE_SISTEMA');
        Selected.Add('FECHA_ACTUAL'#9'20'#9'FECHA_ACTUAL');
        Selected.Add('RECEPCION'#9'20'#9'RECEPCION');
        Selected.Add('EXPEDIENTE_P'#9'20'#9'EXPEDIENTE');
        Selected.Add('EXPEDIENTE_A_HOY'#9'20'#9'EXPEDIENTE_A_HOY');
        Selected.Add('TOTAL_DIAS_A_HOY'#9'20'#9'TOTAL_DIAS_A_HOY');
        ApplySelected;
    end;
    xxExcApp := DM1.FG_EXPORTA_XLS(dtgExpeProXLS, 'EXP_PROCESO');
    xxExcApp.visible := True;
    Screen.Cursor := crDefault;
  END;

  IF tsReprocesosObservados.Showing THEN BEGIN
    Screen.Cursor := crHourGlass;
// Inicio HPC_201707_PRE : MODIFICAR INDICADORES DE CALIDAD
  xsSQL :=
    '                 SELECT D.DPTODES DEPARTAMENTO '
  + '                       ,A.OFDESNOM OFICINA '
  + '                       ,A.BENEFDES TIPO_BENEFICIO '
  + '                       ,A.ESTADO '
  + '                       ,A.HOJA_CARGO '
  + '                       ,C.FECHA_HOJA_CARGO '
  + '                       ,A.EXPEDIENTE, A.ASOAPENOMDNI '
  + '                       ,TRUNC(NVL(C.FECHA_HOJA_CARGO, A.FECHA_EXPEDIENTE_RECEPCION)) FECHA_HOJA_CARGO '
  + '                       ,A.FECHA_EXPEDIENTE_RECEPCION '
  + '                       ,A.FECHA_EXPEDIENTE_SISTEMA '
  + '                       ,A.ANO, A.MES, M.MESDESL, M.MESDESC, '
  + '                       USUOBS, FECSITEXP, COMOBS '
  + '                  FROM (SELECT A.ASOAPENOMDNI, A.CODCAREXP HOJA_CARGO '
  + '                              ,A.PVSEXPNRO EXPEDIENTE '
  + '                              ,C.OFDESNOM '
  + '                              ,B.BENEFDES '
  + '                              ,TRUNC(A.FECRECEXP) FECHA_EXPEDIENTE_RECEPCION '
  + '                              ,TRUNC(A.PVSFECEXP) FECHA_EXPEDIENTE_SISTEMA '
  + '                              ,DECODE(A.DEPORIEXP,''07'',''15'',A.DEPORIEXP) DPTOID '
  + '                              ,D.PVSESTDES ESTADO, '
  + '                               TO_CHAR(A.PVSFECEXP, ''YYYY'') ANO, TO_CHAR(A.PVSFECEXP, ''MM'') MES, '
  + '                              Y.USUARIO USUOBS, Y.FECSITEXP, Y.COMOBS '
  + '                         FROM DB2ADMIN.PVS301 A '
  + '                             ,DB2ADMIN.TGE186 B '
  + '                             ,DB2ADMIN.APO110 C '
  + '                             ,DB2ADMIN.PVS102 D '
  + '                             ,DB2ADMIN.PVSSEGEXPCAB X '
  + '                             ,DB2ADMIN.PVSSEGEXPDET Y '
  + '                        WHERE '  //A.PVSESTADO IN (''01'', ''05'') '
//  + '                          AND
  + '                              A.PVSLBENNR IS NULL '
  + '                          AND A.PVSTIPBEN IN (''01'', ''02'', ''03'') '
  + '                          AND TO_CHAR(A.PVSFECEXP,''YYYY'') = ' + QuotedStr(xsSelAnho)
  + '                          AND A.PVSTIPBEN = B.TIPBENEF '
  + '                          AND A.OFIORIEXP = C.OFDESID '
  + '                          AND A.PVSESTADO = D.PVSESTDSG '
  + '                          AND D.PVSDOC = ''E'' '
  + '                          AND NVL(A.OFIORIEXP,''XX'') = NVL((CASE WHEN ' + QuotedStr(xsSelOFDESID)   + ' = ''00'' THEN A.OFIORIEXP ELSE ' + QuotedStr(xsSelOFDESID)   + ' END),''XX'') '
  + '                          AND NVL(A.PVSTIPBEN,''XX'') = NVL((CASE WHEN ' + QuotedStr(xsSelPVSTIPBEN) + ' = ''00'' THEN A.PVSTIPBEN ELSE ' + QuotedStr(xsSelPVSTIPBEN) + ' END),''XX'') '
  + '                          AND A.PVSEXPNRO =X.NUMEXP AND X.CODSITEXP=''01'' and X.ASOID=Y.ASOID AND X.CODESTEXP=''03'' '
  + '                          AND X.NUMEXP=Y.NUMEXP and X.ASOID=Y.ASOID AND Y.CODSITEXP=''01'' AND Y.CODESTEXP=''03'' '
  + '                       ) A '
  + '                     ,(SELECT A.CODCAREXP, TRUNC(B.FECHA) FECHA_HOJA_CARGO '
  + '                         FROM DB2ADMIN.PRE_CARGO_EXPEDIENTE_MOV     A '
  + '                             ,DB2ADMIN.PRE_CARGO_EXPEDIENTE_EST_MOV B '
//  + '                        WHERE A.CODCAREXPEST = ''LIQUIDADA'' '
//  + '                          AND A.CODCAREXP = B.CODCAREXP '
  + '                        WHERE A.CODCAREXP = B.CODCAREXP '
  + '                          AND B.CODCAREXPEST = ''PENDIENTE'') C '
  + '                     ,DB2ADMIN.APO158 D, db2admin.TGE181 M '
  + '                 WHERE A.HOJA_CARGO = C.CODCAREXP(+) '
  + '                   AND A.DPTOID =  D.DPTOID(+) '
  + '                   AND NVL(A.DPTOID,''XX'') = NVL((CASE WHEN ' + QuotedStr(xsSelDPTOID) + ' = ''00'' THEN A.DPTOID ELSE ' + QuotedStr(xsSelDPTOID) + ' END),''XX'') '
  + '                   AND A.MES=M.MESIDR(+) '
  + '                 ORDER BY D.DPTODES, A.OFDESNOM, A.EXPEDIENTE ';
    xxCdsQryTiempoExpObsXLS.Close;
    xxCdsQryTiempoExpObsXLS.DataRequest(xsSQL);
    xxCdsQryTiempoExpObsXLS.Open;

    WITH dtgExpeProXLS DO BEGIN
        DataSource := xxDsQryTiempoExpObsXLS;
        Selected.Clear;
        Selected.Add('DEPARTAMENTO'#9'20'#9'DEPARTAMENTO');
        Selected.Add('OFICINA'#9'20'#9'OFICINA');
        Selected.Add('TIPO_BENEFICIO'#9'20'#9'TIPO_BENEFICIO');
        Selected.Add('ESTADO'#9'20'#9'ESTADO');
        Selected.Add('HOJA_CARGO'#9'20'#9'HOJA_CARGO');
        Selected.Add('FECHA_HOJA_CARGO'#9'20'#9'FECHA_HOJA_CARGO');
        Selected.Add('EXPEDIENTE'#9'20'#9'EXPEDIENTE');
        Selected.Add('ASOAPENOMDNI'#9'20'#9'NOMBRE');
        Selected.Add('FECHA_EXPEDIENTE_SISTEMA'#9'20'#9'FECHA_EXPEDIENTE_SISTEMA');
        Selected.Add('ANO'#9'10'#9'Año');
        Selected.Add('MES'#9'10'#9'Mes');
        Selected.Add('MESDESL'#9'20'#9'Mes-Nombre');
        Selected.Add('USUOBS'#9'20'#9'USUARIO_OBS');
        Selected.Add('FECSITEXP'#9'12'#9'FECHA_OBS');
        Selected.Add('COMOBS'#9'50'#9'MOTIVO');
        ApplySelected;
    end;
// Fin   HPC_201707_PRE : MODIFICAR INDICADORES DE CALIDAD

    xxExcApp := DM1.FG_EXPORTA_XLS(dtgExpeProXLS, 'EXP_OBSERVADOS');
    xxExcApp.visible := True;
    Screen.Cursor := crDefault;
  END;

end;
// FIN HPC_201610_PRE

// INICIO HPC_201610_PRE
// CAMBIA OFICINA
(******************************************************************************)
procedure TfIndGestion.cbOficinaChange(Sender: TObject);
begin
  If cbOficina.Text = '' Then edtOficina.Text := '';
  If Length(cbOficina.Text) = 2 then Begin
    If xxCdsQryOficina.Locate('OFDESID', cbOficina.Text, []) Then Begin
      edtOficina.Text := xxCdsQryOficina.FieldByName('OFDESNOM').AsString;
    End Else Begin
      MessageDlg('SELECCIONE UNA OFICINA', mtInformation, [mbOk], 0);
      edtOficina.Text := '';
      cbOficina.SetFocus;
    End;
  End;
end;
// FIN HPC_201610_PRE

// INICIO HPC_201610_PRE
// CIERRE DE FORMULARIO
(******************************************************************************)
procedure TfIndGestion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM1.cdsReporte.Close;
  Action := caFree
end;
// FIN HPC_201610_PRE


// Inicio HPC_201610_PRE
procedure TfIndGestion.chrtTiempoPromedioLiquidacionDblClick(
  Sender: TObject);
begin
   FTiempoLiq := TFTiempoLiq.Create(self);

   FTiempoLiq.xsSelAnho := xsSelAnho;
   FTiempoLiq.xsSelOFDESID := xsSelOFDESID;
   FTiempoLiq.xsSelPVSTIPBEN := xsSelPVSTIPBEN;
   FTiempoLiq.xsSelDPTOID := xsSelDPTOID;

   FTiempoLiq.medptodes := medptodes.Text;
   FTiempoLiq.edtOficina := edtOficina.Text;
   FTiempoLiq.dblAnnio := dblAnnio.Text;
   FTiempoLiq.metipbenef := metipbenef.Text;

   FTiempoLiq.meAno.Text := dblAnnio.Text;
   FTiempoLiq.meDpto.Text := medptodes.Text;
   FTiempoLiq.meOfi.Text := edtOficina.Text;
   FTiempoLiq.meTipBen.Text := metipbenef.Text;

   FTiempoLiq.ShowModal;
   FTiempoLiq.Free;
end;
// FIN HPC_201610_PRE



// Inicio HPC_201610_PRE
procedure TfIndGestion.chrtTiempoExpProDblClick(Sender: TObject);
begin
   FExpeProc := TFExpeProc.Create(self);

   FExpeProc.xsSelAnho := xsSelAnho;
   FExpeProc.xsSelOFDESID := xsSelOFDESID;
   FExpeProc.xsSelPVSTIPBEN := xsSelPVSTIPBEN;
   FExpeProc.xsSelDPTOID := xsSelDPTOID;

   FExpeProc.medptodes := medptodes.Text;
   FExpeProc.edtOficina := edtOficina.Text;
   FExpeProc.dblAnnio := dblAnnio.Text;
   FExpeProc.metipbenef := metipbenef.Text;

   FExpeProc.meAno.Text := dblAnnio.Text;
   FExpeProc.meDpto.Text := medptodes.Text;
   FExpeProc.meOfi.Text := edtOficina.Text;
   FExpeProc.meTipBen.Text := metipbenef.Text;

   FExpeProc.ShowModal;
   FExpeProc.Free;
end;
// FIN HPC_201610_PRE


end.
