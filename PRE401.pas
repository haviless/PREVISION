// Inicio Uso Estándares : 01/08/2011
// Unidad                : Previsión Social
// Formulario            : FExpeProc
// Fecha de Creación     : 02/08/2011
// Autor                 : Hugo Noriega
// Objetivo              : Expedientes en Proceso
// Actualizaciones
// HPC_201610_PRE : CREAR Y MODIFICAR INDICADORES DE CALIDAD
// HPC_201707_PRE : MODIFICAR INDICADORES DE CALIDAD

unit PRE401;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, TeeProcs, TeEngine, Chart, DBClient, DbChart, DB,
  wwclient, Wwdatsrc, Series, BubbleCh, StdCtrls, Grids, Wwdbigrd, Wwdbgrid,
  Mask, Buttons, ppBands, ppPrnabl, ppClass, ppCtrls, ppCache, ppComm,
  ppRelatv, ppProd, ppReport;

type
  TFExpeProc = class(TForm)
    pnlPie: TPanel;
    Panel4: TPanel;
    bitPrint: TSpeedButton;
    btnAExcel: TBitBtn;
    btnCerrar: TBitBtn;
    pnlCab: TPanel;
    lblannio: TLabel;
    lblDepartamento: TLabel;
    lblOficina: TLabel;
    lblTipBen: TLabel;
    pnlforpag: TPanel;
    meAno: TMaskEdit;
    Panel1: TPanel;
    meDpto: TMaskEdit;
    Panel2: TPanel;
    meOfi: TMaskEdit;
    Panel3: TPanel;
    meTipBen: TMaskEdit;
    pnlMes: TPanel;
    dbgMes: TwwDBGrid;
    pnlCuerpo: TPanel;
    dtgTiempoPromedioLiquidacionXLS: TwwDBGrid;
    chkMosValor: TCheckBox;
    rpGrafico: TppReport;
    ppHeaderBand1: TppHeaderBand;
    Image001: TppImage;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    chrtTiempoExpPro: TDBChart;
    procedure FormActivate(Sender: TObject);
    procedure dbgMesRowChanged(Sender: TObject);
    procedure btnAExcelClick(Sender: TObject);
    procedure bitPrintClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
  private
    { Private declarations }
     xxCdsQryMes : TwwClientDataSet;
     xxDsQryMes : TwwDataSource;
    xxCdsQryTiempoExpPro : TwwClientDataSet;
     xxDsQryTiempoExpPro : TwwDataSource;
    xxCdsQryTiempoExpProXLS : TwwClientDataSet;
     xxDsQryTiempoExpProXLS : TwwDataSource;


    function GeneraSQL_Mes : String;
    function  GeneraSQL_Exp : String;
    procedure FG_MUESTRA_MESES;
    procedure FG_MUESTRA_TIEMPO_EXPEDIENTE_PROCESO;
    procedure CreaGrafico(xTipoGrafico: Integer;   xCds: TwwClientDataSet; xChart: TDBChart; xMens01, xMens02, xMens03, xMstSerie: String);

  public
    { Public declarations }
    xsSelAnho : String;
    xsSelOFDESID : String;
    xsSelPVSTIPBEN : String;
    xsSelDPTOID : String;

    medptodes : String;
    edtOficina : String;
    dblAnnio : String;
    metipbenef : String;
  end;

var
  FExpeProc: TFExpeProc;

implementation

uses PREDM;

{$R *.dfm}

procedure TFExpeProc.FormActivate(Sender: TObject);
begin
   DM1.FG_CONECTA_CDS(xxCdsQryMes, xxDsQryMes);
   DM1.FG_CONECTA_CDS(xxCdsQryTiempoExpPro, xxDsQryTiempoExpPro);
   DM1.FG_CONECTA_CDS(xxCdsQryTiempoExpProXLS, xxDsQryTiempoExpProXLS);
   FG_MUESTRA_MESES;
   FG_MUESTRA_TIEMPO_EXPEDIENTE_PROCESO;
end;

function TFExpeProc.GeneraSQL_Mes : String;
var
    xsSQL : String;
begin
    xsSQL :=
      ' SELECT D.DPTODES DEPARTAMENTO '
    + '       ,A.OFDESNOM OFICINA '
    + '       ,A.BENEFDES TIPO_BENEFICIO '
    + '       ,A.ESTADO '
    + '       ,A.HOJA_CARGO '
    + '       ,A.EXPEDIENTE '
    + '       ,TRUNC(NVL(C.FECHA_HOJA_CARGO, A.FECHA_EXPEDIENTE_RECEPCION)) FECHA_HOJA_CARGO '
    + '       ,A.FECHA_EXPEDIENTE_RECEPCION '
    + '       ,A.FECHA_EXPEDIENTE_SISTEMA '
    + '       ,TO_CHAR(SYSDATE,''DD/MM/YYYY'') FECHA_ACTUAL '
    + '  FROM (SELECT A.CODCAREXP HOJA_CARGO '
    + '              ,A.PVSEXPNRO EXPEDIENTE '
    + '              ,C.OFDESNOM '
    + '              ,B.BENEFDES '
    + '              ,TRUNC(A.FECRECEXP) FECHA_EXPEDIENTE_RECEPCION '
    + '              ,TRUNC(A.PVSFECEXP)      FECHA_EXPEDIENTE_SISTEMA '
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
   result := xsSQL;
end;



procedure TFExpeProc.FG_MUESTRA_MESES;
var xsSQL : String;
    nTotReg : Integer;
begin
  screen.Cursor := crHourGlass;
  xsSQL := GeneraSQL_Mes;
  xsSQL:='SELECT TO_CHAR(FECHA_EXPEDIENTE_SISTEMA,''MM'') CODMES, M.MESDESL MESES, count(*) TOTREG '
        +  'FROM ( '
        +   xsSQL +' ) a, db2admin.TGE181 M '
        + 'WHERE TO_CHAR(FECHA_EXPEDIENTE_SISTEMA,''MM'')=M.MESIDR(+) '
        +  ' GROUP BY TO_CHAR(FECHA_EXPEDIENTE_SISTEMA,''MM''), M.MESDESL '
        +  ' ORDER BY TO_CHAR(FECHA_EXPEDIENTE_SISTEMA,''MM'')';
  xxCdsQryMes.Close;
  xxCdsQryMes.DataRequest(xsSQL);
  xxCdsQryMes.Open;
  xxCdsQryMes.Last;
  TNumericField(xxCdsQryMes.FieldByName('TOTREG')).DisplayFormat := '###,##0';
  dbgMes.DataSource:= xxDsQryMes;
  dbgMes.Selected.Clear;
  dbgMes.Selected.Add('MESES'#9'10'#9'Meses'#9#9);
  dbgMes.Selected.Add('TOTREG'#9'7'#9'# Exp.'#9#9);
  dbgMes.ApplySelected;
  dbgMes.OnRowChanged:=nil;
  nTotReg:=0;
  xxCdsQryMes.First;
  while not xxCdsQryMes.Eof do
  begin
     nTotReg:=nTotReg + xxCdsQryMes.FieldByName('TOTREG').AsInteger;
     xxCdsQryMes.Next;
  end;
  dbgMes.OnRowChanged:=dbgMesRowChanged;
  xxCdsQryMes.Last;
  dbgMes.ColumnByName('MESES').FooterValue := 'TOTAL';
  dbgMes.ColumnByName('TOTREG').FooterValue := FormatFloat('###,##0', nTotReg);
end;


procedure TFExpeProc.dbgMesRowChanged(Sender: TObject);
begin
   FG_MUESTRA_TIEMPO_EXPEDIENTE_PROCESO;
end;


procedure TFExpeProc.FG_MUESTRA_TIEMPO_EXPEDIENTE_PROCESO;
var xsSQL : String;
begin
  screen.Cursor := crHourGlass;
// Inicio HPC_201707_PRE : MODIFICAR INDICADORES DE CALIDAD
  xsSQL :=
    ' SELECT TIPO_BENEFICIO EP_TIPO_BENEFICIO '
  //+ '       ,CEIL(AVG(DIAS_CARGO_EXPREC)) RECEPCION '
  //+ '       ,CEIL(AVG(DIAS_EXPREC_EXPSIS)) EXPEDIENTE '
  //+ '       ,CEIL(AVG(DIAS_EXPSIS_HOY)) EXPEDIENTE_A_HOY '
  //+ '       ,CEIL(AVG(DIAS_CARGO_HOY)) TOTAL_DIAS_A_HOY '
  + '       ,ROUND(AVG(DIAS_CARGO_EXPREC),1) RECEPCION '
  + '       ,ROUND(AVG(DIAS_EXPREC_EXPSIS),1) EXPEDIENTE '
  + '       ,ROUND(AVG(DIAS_EXPSIS_HOY),1) EXPEDIENTE_A_HOY '
  + '       ,ROUND(AVG(DIAS_CARGO_HOY),1) TOTAL_DIAS_A_HOY '

  + '   FROM (SELECT OFICINA '
  + '               ,DEPARTAMENTO '
  + '               ,TIPO_BENEFICIO '
//  + '               ,DB2ADMIN.DIAS_LABORABLES(FECHA_HOJA_CARGO, FECHA_EXPEDIENTE_RECEPCION) DIAS_CARGO_EXPREC '
    + '       ,CASE WHEN DB2ADMIN.DIAS_LABORABLES(TRUNC(NVL(FECHA_HOJA_CARGO, FECHA_EXPEDIENTE_RECEPCION)), FECHA_EXPEDIENTE_RECEPCION)-1 <= 0 THEN 1 '
    + '             ELSE DB2ADMIN.DIAS_LABORABLES(TRUNC(NVL(FECHA_HOJA_CARGO, FECHA_EXPEDIENTE_RECEPCION)), FECHA_EXPEDIENTE_RECEPCION)-1 END DIAS_CARGO_EXPREC '

//  + '               ,DB2ADMIN.DIAS_LABORABLES(FECHA_EXPEDIENTE_RECEPCION, FECHA_EXPEDIENTE_SISTEMA) DIAS_EXPREC_EXPSIS '
    + '       ,CASE WHEN DB2ADMIN.DIAS_LABORABLES(FECHA_EXPEDIENTE_RECEPCION, FECHA_EXPEDIENTE_SISTEMA)-1 <= 0 THEN 1 '
    + '             ELSE DB2ADMIN.DIAS_LABORABLES(FECHA_EXPEDIENTE_RECEPCION, FECHA_EXPEDIENTE_SISTEMA)-1 END DIAS_EXPREC_EXPSIS '

//  + '               ,DB2ADMIN.DIAS_LABORABLES(FECHA_EXPEDIENTE_SISTEMA, TRUNC(SYSDATE)) DIAS_EXPSIS_HOY '
    + '       ,CASE WHEN DB2ADMIN.DIAS_LABORABLES(FECHA_EXPEDIENTE_SISTEMA, TRUNC(SYSDATE))-1 <= 0 THEN 1 '
    + '             ELSE DB2ADMIN.DIAS_LABORABLES(FECHA_EXPEDIENTE_SISTEMA, TRUNC(SYSDATE))-1 END DIAS_EXPSIS_HOY '

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
  + '                          AND TO_CHAR(A.PVSFECEXP,''YYYYMM'') = ' + QuotedStr(xsSelAnho+xxCdsQryMes.FieldByName('CODMES').AsString)
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
//  + '                        WHERE A.CODCAREXPEST = ''LIQUIDADA'' '
//  + '                          AND A.CODCAREXP = B.CODCAREXP '
  + '                        WHERE A.CODCAREXP = B.CODCAREXP '
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
// Fin  HPC_201707_PRE : MODIFICAR INDICADORES DE CALIDAD

  xxCdsQryTiempoExpPro.Close;
  xxCdsQryTiempoExpPro.DataRequest(xsSQL);
  xxCdsQryTiempoExpPro.Open;
  // muestra grafico
  CreaGrafico(1, xxCdsQryTiempoExpPro,
              chrtTiempoExpPro, 'TIEMPO DE EXPEDIENTES EN PROCESO ( EN DÍAS )',
              'MES: ' + dblAnnio + ' - ' + xxCdsQryMes.FieldByName('MESES').AsString ,
               'DEPARTAMENTO : ' +  medptodes + ' | OFICINA : ' +  edtOficina + ' | TIPO DE BENEFICIO : ' + metipbenef,
              'S');
   chrtTiempoExpPro.Series[0].Marks.Visible := True;
   chrtTiempoExpPro.Series[1].Marks.Visible := True;
   chrtTiempoExpPro.Series[2].Marks.Visible := True;
   chrtTiempoExpPro.Series[3].Marks.Visible := True;

  screen.Cursor := crDefault;
end;


procedure TFExpeProc.CreaGrafico(xTipoGrafico: Integer;   xCds: TwwClientDataSet; xChart: TDBChart; xMens01, xMens02, xMens03,  xMstSerie: String);
const
   Color_01 : Array[0..0] Of Integer = (16747804);
   Color_02 : Array[0..0] Of Integer = (5855743);
   Color_03 : Array[0..4] Of TColor = (5855743, 16747804, 40704, 5212415, 16744911);
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
   xChart.Title.Text.Add(xMens03);
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
         xChart.Series[i2].Marks.BackColor := clYellow;
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

procedure TFExpeProc.btnAExcelClick(Sender: TObject);
var xsSQL : String;
    xxExcApp: OleVariant;
begin
    Screen.Cursor := crHourGlass;

    xsSQL := GeneraSQL_Exp;
    xxCdsQryTiempoExpProXLS.Close;
    xxCdsQryTiempoExpProXLS.DataRequest(xsSQL);
    xxCdsQryTiempoExpProXLS.Open;

    WITH dtgTiempoPromedioLiquidacionXLS DO BEGIN
        DataSource := xxDsQryTiempoExpProXLS;
        Selected.Clear;
        Selected.Add('DEPARTAMENTO'#9'20'#9'DEPARTAMENTO');
        Selected.Add('OFICINA'#9'20'#9'OFICINA');
        Selected.Add('TIPO_BENEFICIO'#9'20'#9'TIPO_BENEFICIO');
        Selected.Add('ESTADO'#9'20'#9'ESTADO');
        Selected.Add('HOJA_CARGO'#9'20'#9'HOJA_CARGO');
        Selected.Add('EXPEDIENTE'#9'20'#9'EXPEDIENTE');
        Selected.Add('ASOAPENOMDNI'#9'20'#9'NOMBRE');
        Selected.Add('FECHA_HOJA_CARGO'#9'20'#9'FECHA_HOJA_CARGO');
        Selected.Add('FECHA_EXPEDIENTE_RECEPCION'#9'20'#9'FECHA_EXPEDIENTE_RECEPCION');
        Selected.Add('FECHA_EXPEDIENTE_SISTEMA'#9'20'#9'FECHA_EXPEDIENTE_SISTEMA');
        Selected.Add('FECHA_ACTUAL'#9'20'#9'FECHA_ACTUAL');
        Selected.Add('RECEPCION'#9'20'#9'RECEPCION');
        Selected.Add('F_EXPEDIENTE'#9'20'#9'F_EXPEDIENTE');
        Selected.Add('DIAS_EXPEDIENTE'#9'20'#9'DIAS_EXPEDIENTE');
        Selected.Add('TOTAL_DIAS'#9'20'#9'TOTAL_DIAS');
        ApplySelected;
    end;
    xxExcApp := DM1.FG_EXPORTA_XLS(dtgTiempoPromedioLiquidacionXLS, 'EXP_PROCESO');
    xxExcApp.visible := True;
    Screen.Cursor := crDefault;
end;

function TFExpeProc.GeneraSQL_Exp : String;
var
    xsSQL : String;
begin
// Inicio HPC_201707_PRE : MODIFICAR INDICADORES DE CALIDAD

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
//    + '       ,DB2ADMIN.DIAS_LABORABLES(TRUNC(NVL(C.FECHA_HOJA_CARGO, A.FECHA_EXPEDIENTE_RECEPCION)), FECHA_EXPEDIENTE_RECEPCION) RECEPCION '
//    + '       ,DB2ADMIN.DIAS_LABORABLES(FECHA_EXPEDIENTE_RECEPCION, FECHA_EXPEDIENTE_SISTEMA) F_EXPEDIENTE '
//    + '       ,DB2ADMIN.DIAS_LABORABLES(FECHA_EXPEDIENTE_SISTEMA, TO_CHAR(SYSDATE,''DD/MM/YYYY'') ) DIAS_EXPEDIENTE '
//    + '       ,DB2ADMIN.DIAS_LABORABLES(TRUNC(NVL(C.FECHA_HOJA_CARGO, A.FECHA_EXPEDIENTE_RECEPCION)), TO_CHAR(SYSDATE,''DD/MM/YYYY'')) TOTAL_DIAS '

    + '       ,CASE WHEN DB2ADMIN.DIAS_LABORABLES(TRUNC(NVL(FECHA_HOJA_CARGO, FECHA_EXPEDIENTE_RECEPCION)), FECHA_EXPEDIENTE_RECEPCION)-1 <= 0 THEN 1 '
    + '             ELSE DB2ADMIN.DIAS_LABORABLES(TRUNC(NVL(FECHA_HOJA_CARGO, FECHA_EXPEDIENTE_RECEPCION)), FECHA_EXPEDIENTE_RECEPCION)-1 END RECEPCION '

    + '       ,CASE WHEN DB2ADMIN.DIAS_LABORABLES(FECHA_EXPEDIENTE_RECEPCION, FECHA_EXPEDIENTE_SISTEMA)-1 <= 0 THEN 1 '
    + '             ELSE DB2ADMIN.DIAS_LABORABLES(FECHA_EXPEDIENTE_RECEPCION, FECHA_EXPEDIENTE_SISTEMA)-1 END F_EXPEDIENTE '

    + '       ,CASE WHEN DB2ADMIN.DIAS_LABORABLES(FECHA_EXPEDIENTE_SISTEMA, TRUNC(SYSDATE))-1 <= 0 THEN 1 '
    + '             ELSE DB2ADMIN.DIAS_LABORABLES(FECHA_EXPEDIENTE_SISTEMA, TRUNC(SYSDATE))-1 END DIAS_EXPEDIENTE '

  + '               ,CASE WHEN DB2ADMIN.DIAS_LABORABLES(FECHA_HOJA_CARGO, TRUNC(SYSDATE))-1 <= 0 THEN 1 '
  + '                     ELSE DB2ADMIN.DIAS_LABORABLES(FECHA_HOJA_CARGO, TRUNC(SYSDATE))-1 END TOTAL_DIAS '

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
    + '          AND TO_CHAR(A.PVSFECEXP,''YYYYMM'') = ' + QuotedStr(xsSelAnho+xxCdsQryMes.FieldByName('CODMES').AsString)
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
//    + '         WHERE A.CODCAREXPEST = ''LIQUIDADA'' '
//    + '           AND A.CODCAREXP = B.CODCAREXP '
    + '         WHERE A.CODCAREXP = B.CODCAREXP '
    + '           AND B.CODCAREXPEST = ''PENDIENTE'') C '
    + '      ,DB2ADMIN.APO158 D '
    + ' WHERE A.HOJA_CARGO = C.CODCAREXP(+) '
    + '   AND A.DPTOID =  D.DPTOID(+) '
    + '   AND NVL(A.DPTOID,''XX'') = NVL((CASE WHEN ' + QuotedStr(xsSelDPTOID) + ' = ''00'' THEN A.DPTOID ELSE ' + QuotedStr(xsSelDPTOID) + ' END),''XX'') '
    + ' ORDER BY D.DPTODES, A.OFDESNOM ';
// Fin  HPC_201707_PRE : MODIFICAR INDICADORES DE CALIDAD

   result := xsSQL;
   result := xsSQL;
end;


procedure TFExpeProc.bitPrintClick(Sender: TObject);
var Image01: TImage;
begin
  Image01 := TImage.Create(Nil);
  Image01.Width := chrtTiempoExpPro.Width;
  Image01.Height := chrtTiempoExpPro.Height;
  chrtTiempoExpPro.Draw(Image01.Canvas, Image01.BoundsRect);
  Image001.Picture := Image01.Picture;
  rpGrafico.Print;
  rpGrafico.Stop;
end;

procedure TFExpeProc.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

end.
