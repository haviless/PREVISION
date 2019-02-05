// Inicio Uso Estándares: 01/08/2011
// Unidad               : PRE297
// Formulario           : Fasoxedadysexo
// Fecha de Creación    : 06/07/2017
// Autor                : Area de desarrollo de sistemas.
// Objetivo             : Estadistica docente x edad y sexo
// Actualizaciones
// HPC_201705_PRE : Creación
// HPC_201708_PRE : MODIFICAR REPORTE DE ACTIVOS POR EDAD Y SEXO AL CIERRE DE CADA MES

unit PRE297;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, Mask, ppCtrls,
  ppBands, jpeg, ppVar, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv,
  ppProd, ppReport, DBGrids, ppDB, ppDBPipe,db, ExtCtrls, wwdbedit,
// Inicio HPC_201708_PRE
//MODIFICAR REPORTE DE ACTIVOS POR EDAD Y SEXO AL CIERRE DE CADA MES
  Wwdbspin, wwdblook;
// Final HPC_201708_PRE

type
  TFasoxedadysexo = class(TForm)
    gbseleccion: TGroupBox;
    dbgdoxedadysexo: TwwDBGrid;
    btnimprimir: TBitBtn;
    btnaexcel: TBitBtn;
    btncerrar: TBitBtn;
    DBGrid: TDBGrid;
    pprresedadxsexo: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppShape39: TppShape;
    ppltitdpt01: TppLabel;
    pplperiodo: TppLabel;
    ppLabel79: TppLabel;
    ppLabel81: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    ppLabel60: TppLabel;
    ppShape3: TppShape;
    ppLabel1: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel4: TppLabel;
    ppShape6: TppShape;
    ppLabel7: TppLabel;
    ppShape8: TppShape;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppImage1: TppImage;
    ppDetailBand1: TppDetailBand;
    ppDBedad: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLabel14: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    pplimpresopor: TppLabel;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppdbasoxedadysexo: TppDBPipeline;
    btndetalle: TBitBtn;
    btnImprimePrevio: TBitBtn;
    GroupBox2: TGroupBox;
    dbseMes: TwwDBSpinEdit;
    dbseAno: TwwDBSpinEdit;
// Inicio HPC_201708_PRE
//MODIFICAR REPORTE DE ACTIVOS POR EDAD Y SEXO AL CIERRE DE CADA MES
    GroupBox1: TGroupBox;
    cbCtaIndi: TComboBox;
// Final HPC_201708_PRE
    procedure btncerrarClick(Sender: TObject);
    procedure btnImprimePrevioClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnaexcelClick(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure btndetalleClick(Sender: TObject);
    procedure dbgdoxedadysexoDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure rgtipoClick(Sender: TObject);
// Inicio HPC_201708_PRE
//MODIFICAR REPORTE DE ACTIVOS POR EDAD Y SEXO AL CIERRE DE CADA MES
    procedure cbCtaIndiChange(Sender: TObject);
// Final HPC_201708_PRE
  private
    procedure detalle;
    procedure inicializa;

  public
    xmasc, xfeme: Integer;
    xperiodo, xano, xmes, xanoact, xmesact:String;
    { Public declarations }
  end;

var
  Fasoxedadysexo: TFasoxedadysexo;

implementation

uses PREDM, PRE294, PRE298;

{$R *.dfm}

procedure TFasoxedadysexo.btncerrarClick(Sender: TObject);
begin
   Close;
end;

procedure TFasoxedadysexo.btnImprimePrevioClick(Sender: TObject);
Var xSql: String;
begin
   xano := DM1.StrZero(dbseAno.Text,4);
   xmes := DM1.StrZero(dbseMes.Text,2);
   xperiodo := xano+xmes;
   xanoact := Copy(DateToStr(dm1.FechaSys),7,4);
   xmesact := Copy(DateToStr(dm1.FechaSys),4,2);

   If (StrToInt(xmes) < 1) Or (StrToInt(xmes) > 12) Then

   Begin
      MessageDlg('Mes del periodo no valido, solo se acepta [1..12]', mtInformation, [mbOk], 0);
      dbseMes.SetFocus;
      Exit;
   End;
   
   If (StrToInt(xano) < 2012) Or (StrToInt(xano) > StrToInt(xanoact)) Then
   Begin
      MessageDlg('Año no valido, solo valido [2012..año actual]', mtInformation, [mbOk], 0);
      dbseAno.SetFocus;
      Exit;
   End;

   If (StrToInt(xano) = StrToInt(xanoact)) And (StrToInt(xmes) > StrToInt(xmesact)) Then
   Begin
      MessageDlg('Mes no valido, no puede ser mayor que de la fecha actual.', mtInformation, [mbOk], 0);
      dbseMes.SetFocus;
      Exit;
   End;

   Screen.Cursor := crHourGlass;
   inicializa;
// Inicio HPC_201708_PRE
//MODIFICAR REPORTE DE ACTIVOS POR EDAD Y SEXO AL CIERRE DE CADA MES
   If cbCtaIndi.ItemIndex = 2 Then
   Begin
     xSql := 'SELECT EDAD, SUM(NVL(MASCULINO,0)) MASCULINO, SUM(NVL(FEMENINO,0)) FEMENINO, SUM(NVL(TOTAL,0)) TOTAL'
      +' FROM ( SELECT ASOFECNAC, CASE WHEN ASOFECNAC IS NULL THEN 0 ELSE SUBSTR('+QuotedStr(xperiodo)+',1,4) - TO_CHAR(ASOFECNAC,''YYYY'') END  EDAD,'
      +' CASE WHEN ASOSEXO = ''M'' THEN 1 ELSE 0 END MASCULINO, CASE WHEN ASOSEXO = ''F'' THEN 1 ELSE 0 END FEMENINO,'
      +' CASE WHEN ASOSEXO IN (''M'',''F'') THEN 1 ELSE 0 END TOTAL'
      +' FROM PRE_ASO_HIS_DET WHERE ASOTIPID = ''DO'' AND PERIODO = '+QuotedStr(xperiodo)+')'
      +' GROUP BY EDAD ORDER BY EDAD ASC';
   End;
   If cbCtaIndi.ItemIndex = 0 Then
   Begin
     xSql := 'SELECT EDAD, SUM(NVL(MASCULINO,0)) MASCULINO, SUM(NVL(FEMENINO,0)) FEMENINO, SUM(NVL(TOTAL,0)) TOTAL'
      +' FROM ( SELECT ASOFECNAC, CASE WHEN ASOFECNAC IS NULL THEN 0 ELSE SUBSTR('+QuotedStr(xperiodo)+',1,4) - TO_CHAR(ASOFECNAC,''YYYY'') END  EDAD,'
      +' CASE WHEN ASOSEXO = ''M'' THEN 1 ELSE 0 END MASCULINO, CASE WHEN ASOSEXO = ''F'' THEN 1 ELSE 0 END FEMENINO,'
      +' CASE WHEN ASOSEXO IN (''M'',''F'') THEN 1 ELSE 0 END TOTAL'
      +' FROM PRE_ASO_HIS_DET WHERE ASOTIPID = ''DO'' AND PERIODO = '+QuotedStr(xperiodo)+' AND NVL(ACUMULADO,0) > 0)'
      +' GROUP BY EDAD ORDER BY EDAD ASC';
      //ASOFECNAC IS NOT NULL AND NVL(ASOSEXO,''X'') IN (''F'',''M'') AND
   End;

   If cbCtaIndi.ItemIndex = 1 Then
   Begin
     xSql := 'SELECT EDAD, SUM(NVL(MASCULINO,0)) MASCULINO, SUM(NVL(FEMENINO,0)) FEMENINO, SUM(NVL(TOTAL,0)) TOTAL'
      +' FROM ( SELECT ASOFECNAC, CASE WHEN ASOFECNAC IS NULL THEN 0 ELSE SUBSTR('+QuotedStr(xperiodo)+',1,4) - TO_CHAR(ASOFECNAC,''YYYY'') END EDAD,'
      +' CASE WHEN ASOSEXO = ''M'' THEN 1 ELSE 0 END MASCULINO, CASE WHEN ASOSEXO = ''F'' THEN 1 ELSE 0 END FEMENINO,'
      +' CASE WHEN ASOSEXO IN (''M'',''F'') THEN 1 ELSE 0 END TOTAL'
      +' FROM PRE_ASO_HIS_DET WHERE ASOTIPID = ''DO'' AND PERIODO = '+QuotedStr(xperiodo)+' AND NVL(ACUMULADO,0) = 0)'
      +' GROUP BY EDAD ORDER BY EDAD ASC';
   End;
   {xSql := 'SELECT EDAD, SUM(NVL(MASCULINO,0)) MASCULINO, SUM(NVL(FEMENINO,0)) FEMENINO, SUM(NVL(TOTAL,0)) TOTAL'
      +' FROM ( SELECT ASOFECNAC, SUBSTR('+QuotedStr(xperiodo)+',1,4) - TO_CHAR(ASOFECNAC,''YYYY'') EDAD,'
      +' CASE WHEN ASOSEXO = ''M'' THEN 1 ELSE 0 END MASCULINO, CASE WHEN ASOSEXO = ''F'' THEN 1 ELSE 0 END FEMENINO,'
      +' CASE WHEN ASOSEXO IN (''M'',''F'') THEN 1 ELSE 0 END TOTAL'
      +' FROM PRE_ASO_HIS_DET WHERE ASOFECNAC IS NOT NULL AND NVL(ASOSEXO,''X'') IN (''F'',''M'') AND ASOTIPID = ''DO'' AND PERIODO = '+QuotedStr(xperiodo)+')'
      +' GROUP BY EDAD ORDER BY EDAD ASC';}
// Final HPC_201708_PRE
   DM1.cdsReporte.Close;
   DM1.cdsReporte.DataRequest(xSql);
   DM1.cdsReporte.Open;
   If DM1.cdsReporte.RecordCount = 0 Then
   Begin
      Screen.Cursor := crDefault;
      MessageDlg('No se ha encontrado información en el periodo procesado.', mtInformation, [mbOk], 0);
      dbseAno.SetFocus;
      Exit;
   End;
   xmasc := 0;
   xfeme := 0;
   While Not DM1.cdsReporte.Eof Do
   Begin
      xmasc := xmasc + DM1.cdsReporte.FieldByName('MASCULINO').AsInteger;
      xfeme := xfeme + DM1.cdsReporte.FieldByName('FEMENINO').AsInteger; ;
      DM1.cdsReporte.Next;
   End;
   DM1.cdsReporte.First;
   dbgdoxedadysexo.Selected.Clear;
   dbgdoxedadysexo.Selected.Add('EDAD'#9'12'#9'Edad del~asociado'#9#9);
   dbgdoxedadysexo.Selected.Add('MASCULINO'#9'9'#9'Cant.Asociados~sexo masculino'#9#9);
   dbgdoxedadysexo.Selected.Add('FEMENINO'#9'13'#9'Cant.Asociados~sexo femenino'#9#9);
   dbgdoxedadysexo.Selected.Add('TOTAL'#9'9'#9'Cant.Asociados~por edad'#9#9);
   dbgdoxedadysexo.ApplySelected;
   TNumericField(DM1.cdsReporte.FieldByName('MASCULINO')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsReporte.FieldByName('FEMENINO')).DisplayFormat  := '###,##0';
   TNumericField(DM1.cdsReporte.FieldByName('TOTAL')).DisplayFormat     := '###,##0';
   dbgdoxedadysexo.ColumnByName('EDAD').FooterValue := 'TOTALES : ';
   dbgdoxedadysexo.ColumnByName('MASCULINO').FooterValue := FormatFloat('###,###0',xmasc);
   dbgdoxedadysexo.ColumnByName('FEMENINO').FooterValue := FormatFloat('###,###.#0',xfeme);
   dbgdoxedadysexo.ColumnByName('TOTAL').FooterValue := FormatFloat('###,###0',xmasc+xfeme);
   Screen.Cursor := crDefault;
end;

procedure TFasoxedadysexo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  begin
    Key := #0;
    Perform(CM_DIALOGKEY, VK_TAB, 0);
  end;
end;

procedure TFasoxedadysexo.btnaexcelClick(Sender: TObject);
begin
  DM1.ExportaGridExcel(dbgdoxedadysexo, 'PRE_RESEDADXSEXO');
end;

procedure TFasoxedadysexo.btnimprimirClick(Sender: TObject);
begin
  pplperiodo.Caption := 'PERIODO : '+xperiodo;
  pplimpresopor.Caption := 'Impreso por : '+DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
  pprresedadxsexo.Print;
  pprresedadxsexo.Stop;
end;


procedure TFasoxedadysexo.detalle;
begin
   Try
      Fasoxedadysexodet := TFasoxedadysexodet.Create(self);
// Inicio HPC_201708_PRE
//MODIFICAR REPORTE DE ACTIVOS POR EDAD Y SEXO AL CIERRE DE CADA MES
      Fasoxedadysexodet.xcbCtaIndi := cbCtaIndi.ItemIndex;
      xperiodo := xano+xmes;
// Final HPC_201708_PRE
      Fasoxedadysexodet.Showmodal;
   Finally
      Fasoxedadysexodet.Free;
   End;
end;

procedure TFasoxedadysexo.btndetalleClick(Sender: TObject);
begin
   detalle;
end;

procedure TFasoxedadysexo.dbgdoxedadysexoDblClick(Sender: TObject);
begin
   detalle;
end;

procedure TFasoxedadysexo.inicializa;
Var xSql:String;
begin
   xSql := 'SELECT EDAD, SUM(NVL(MASCULINO,0)) MASCULINO, SUM(NVL(FEMENINO,0)) FEMENINO, SUM(NVL(TOTAL,0)) TOTAL'
   +' FROM (SELECT ASOFECNAC, 0 EDAD,'
   +' CASE WHEN ASOSEXO = ''M'' THEN 1 ELSE 0 END MASCULINO, CASE WHEN ASOSEXO = ''F'' THEN 1 ELSE 0 END FEMENINO,'
   +' CASE WHEN ASOSEXO IN (''M'',''F'') THEN 1 ELSE 0 END TOTAL'
   +' FROM PRE_ASO_HIS_DET WHERE ASOTIPID = ''DO'' AND PERIODO = ''9999'')'
   +' GROUP BY EDAD ORDER BY EDAD ASC';
   DM1.cdsReporte.Close;
   DM1.cdsReporte.DataRequest(xSql);
   DM1.cdsReporte.Open;
   xmasc := 0;
   xfeme := 0;
   dbgdoxedadysexo.Selected.Add('EDAD'#9'12'#9'Edad del~asociado'#9#9);
   dbgdoxedadysexo.Selected.Add('MASCULINO'#9'9'#9'Cant.Asociados~sexo masculino'#9#9);
   dbgdoxedadysexo.Selected.Add('FEMENINO'#9'13'#9'Cant.Asociados~sexo femenino'#9#9);
   dbgdoxedadysexo.Selected.Add('TOTAL'#9'9'#9'Cant.Asociados~por edad'#9#9);
   dbgdoxedadysexo.ApplySelected;
   TNumericField(DM1.cdsReporte.FieldByName('MASCULINO')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsReporte.FieldByName('FEMENINO')).DisplayFormat  := '###,##0';
   TNumericField(DM1.cdsReporte.FieldByName('TOTAL')).DisplayFormat     := '###,##0';
   dbgdoxedadysexo.ColumnByName('EDAD').FooterValue := 'TOTALES : ';
   dbgdoxedadysexo.ColumnByName('MASCULINO').FooterValue := FormatFloat('###,###0',xmasc);
   dbgdoxedadysexo.ColumnByName('FEMENINO').FooterValue :=  FormatFloat('###,###0',xfeme);
   dbgdoxedadysexo.ColumnByName('TOTAL').FooterValue :=     FormatFloat('###,###0',xmasc+xfeme);
end;

procedure TFasoxedadysexo.FormActivate(Sender: TObject);
// Inicio HPC_201708_PRE
//MODIFICAR REPORTE DE ACTIVOS POR EDAD Y SEXO AL CIERRE DE CADA MES
var
Fecha : TDate;
Dia,Mes,Anio : Word;
// Final HPC_201708_PRE
begin
   inicializa;
// Inicio HPC_201708_PRE
//MODIFICAR REPORTE DE ACTIVOS POR EDAD Y SEXO AL CIERRE DE CADA MES
   Fecha := Date;
   DecodeDate(Fecha, Anio, Mes, Dia);
   dbseAno.Text := IntToStr(Anio);
   dbseMes.Text := StringOfChar('0',2 - Length(IntToStr(Mes-1)))+IntToStr(Mes-1);
// Final HPC_201708_PRE
end;

procedure TFasoxedadysexo.rgtipoClick(Sender: TObject);
begin
   inicializa;
end;
// Inicio HPC_201708_PRE
//MODIFICAR REPORTE DE ACTIVOS POR EDAD Y SEXO AL CIERRE DE CADA MES
procedure TFasoxedadysexo.cbCtaIndiChange(Sender: TObject);
begin
    btnImprimePrevioClick(Self);
end;
// Final HPC_201708_PRE
end.
