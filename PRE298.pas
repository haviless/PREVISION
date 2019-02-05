// Inicio Uso Estándares: 01/08/2011
// Unidad               : PRE298
// Formulario           : Fasoxedadysexodet
// Fecha de Creación    : 06/07/2017
// Autor                : Area de desarrollo de sistemas.
// Objetivo             : Detalle de asociados x edad y sexo
// Actualizaciones
// HPC_201705_PRE : Creación
// HPC_201708_PRE : MODIFICAR REPORTE DE ACTIVOS POR EDAD Y SEXO AL CIERRE DE CADA MES
unit PRE298;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, db, DBGrids;
type
  TFasoxedadysexodet = class(TForm)
    btnretornar: TBitBtn;
    dbgdoxedadysexodet: TwwDBGrid;
    btnaexcel: TBitBtn;
    DBGrid: TDBGrid;
    procedure btnretornarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnaexcelClick(Sender: TObject);
// Inicio HPC_201708_PRE
//MODIFICAR REPORTE DE ACTIVOS POR EDAD Y SEXO AL CIERRE DE CADA MES
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
// Final HPC_201708_PRE
  private
    { Private declarations }
  public
    { Public declarations }
// Inicio HPC_201708_PRE
//MODIFICAR REPORTE DE ACTIVOS POR EDAD Y SEXO AL CIERRE DE CADA MES
    xcbCtaIndi : Integer;
// Final HPC_201708_PRE
  end;

var
  Fasoxedadysexodet: TFasoxedadysexodet;

implementation

uses PREDM, PRE293, PRE297;

{$R *.dfm}

procedure TFasoxedadysexodet.btnretornarClick(Sender: TObject);
begin
// Inicio HPC_201708_PRE
//MODIFICAR REPORTE DE ACTIVOS POR EDAD Y SEXO AL CIERRE DE CADA MES
   DM1.cdsSexo.EmptyDataSet;
// Final HPC_201708_PRE
   Close;
end;

procedure TFasoxedadysexodet.FormActivate(Sender: TObject);
Var xSql:String;
begin
   Screen.Cursor := crHourGlass;
   If DM1.cdsReporte.FieldByName('EDAD').AsString <> '' Then
   Begin
// Inicio HPC_201708_PRE
//MODIFICAR REPORTE DE ACTIVOS POR EDAD Y SEXO AL CIERRE DE CADA MES
      {xSql := 'SELECT ROWNUM NUMERO, ASOCODMOD, ASOAPENOMDNI, ASODNI,  ASOSEXO, TO_DATE(ASOFECNAC,''DD/MM/YYYY'') ASOFECNAC, ASOTIPID, SUBSTR('+QuotedStr(Fasoxedadysexo.xperiodo)+',1,4)-TO_CHAR(ASOFECNAC,''YYYY'') EDAD,'
         +' SUBSTR('+QuotedStr(Fasoxedadysexo.xperiodo)+ ',1,4)-TO_CHAR(ASOFRESNOM,''YYYY'') ANO_SERV, ACUMESANT CAP_INI, CAPITAL APORTES, INTCAPACU INTERES, BONOS, MONCUO MONTO_CCI,'
         +' ACUMULADO TOT_ACU, TO_DATE(ASOFRESNOM,''DD/MM/YYYY'') ASOFRESNOM, TO_DATE(FECAUTDESAPO,''DD/MM/YYYY'') FECAUTDESAPO, DPTODES_DOM DEPARTAMENTO, CIUDDES_DOM PROVINCIA, ZIPDES_DOM DISTRITO, CREVIG FROM PRE_ASO_HIS_DET'
         +' WHERE PERIODO = '+QuotedStr(Fasoxedadysexo.xperiodo)+' AND SUBSTR('+QuotedStr(Fasoxedadysexo.xperiodo)+',1,4)-TO_CHAR(ASOFECNAC,''YYYY'') = '+DM1.cdsReporte.FieldByName('EDAD').AsString;}
      If (xcbCtaIndi = 0) Then
      begin
         xSql := 'SELECT ROWNUM NUMERO, ASOCODMOD, ASOAPENOMDNI, ASODNI,  ASOSEXO, CASE WHEN ASOFECNAC IS NULL THEN TO_DATE(''01/01/1900'', ''DD/MM/YYYY'') ELSE TO_DATE(ASOFECNAC, ''DD/MM/YYYY'') END ASOFECNAC, ASOTIPID, CASE WHEN ASOFECNAC IS NULL THEN 0 ELSE SUBSTR('+QuotedStr(Fasoxedadysexo.xperiodo)+',1,4)-TO_CHAR(ASOFECNAC,''YYYY'') END EDAD,'
         +' SUBSTR('+QuotedStr(Fasoxedadysexo.xperiodo)+ ',1,4)-TO_CHAR(ASOFRESNOM,''YYYY'') ANO_SERV, ACUMESANT CAP_INI, CAPITAL APORTES, INTCAPACU INTERES, BONOS, MONCUO MONTO_CCI,'
         //+' ACUMULADO TOT_ACU, TO_DATE(ASOFRESNOM,''DD/MM/YYYY'') ASOFRESNOM, TO_DATE(FECAUTDESAPO,''DD/MM/YYYY'') FECAUTDESAPO, DPTODES_DOM DEPARTAMENTO, CIUDDES_DOM PROVINCIA, ZIPDES_DOM DISTRITO, CREVIG FROM PRE_ASO_HIS_DET'
         +' ACUMULADO TOT_ACU, TRUNC(ASOFRESNOM), TRUNC(FECAUTDESAPO), DPTODES_DOM DEPARTAMENTO, CIUDDES_DOM PROVINCIA, ZIPDES_DOM DISTRITO, CREVIG FROM PRE_ASO_HIS_DET'
         +' WHERE PERIODO = '+QuotedStr(Fasoxedadysexo.xperiodo)+' AND NVL(ACUMULADO,0) >0 AND (ASOAPENOMDNI NOT LIKE ''DRE %'' AND ASOAPENOMDNI NOT LIKE ''UGEL %'') AND (CASE WHEN ASOFECNAC IS NULL THEN 0 ELSE SUBSTR('+QuotedStr(Fasoxedadysexo.xperiodo)+',1,4)-TO_CHAR(ASOFECNAC,''YYYY'') END) = '+DM1.cdsReporte.FieldByName('EDAD').AsString;

      end;
      If (xcbCtaIndi = 1) Then
      begin
         xSql := 'SELECT ROWNUM NUMERO, ASOCODMOD, ASOAPENOMDNI, ASODNI,  ASOSEXO, CASE WHEN ASOFECNAC IS NULL THEN TO_DATE(''01/01/1900'', ''DD/MM/YYYY'') ELSE TO_DATE(ASOFECNAC, ''DD/MM/YYYY'') END ASOFECNAC, ASOTIPID, CASE WHEN ASOFECNAC IS NULL THEN 0 ELSE SUBSTR('+QuotedStr(Fasoxedadysexo.xperiodo)+',1,4)-TO_CHAR(ASOFECNAC,''YYYY'') END EDAD,'
         +' SUBSTR('+QuotedStr(Fasoxedadysexo.xperiodo)+ ',1,4)-TO_CHAR(ASOFRESNOM,''YYYY'') ANO_SERV, ACUMESANT CAP_INI, CAPITAL APORTES, INTCAPACU INTERES, BONOS, MONCUO MONTO_CCI,'
         //+' ACUMULADO TOT_ACU, TO_DATE(ASOFRESNOM,''DD/MM/YYYY'') ASOFRESNOM, TO_DATE(FECAUTDESAPO,''DD/MM/YYYY'') FECAUTDESAPO, DPTODES_DOM DEPARTAMENTO, CIUDDES_DOM PROVINCIA, ZIPDES_DOM DISTRITO, CREVIG FROM PRE_ASO_HIS_DET'
         +' ACUMULADO TOT_ACU, TRUNC(ASOFRESNOM), TRUNC(FECAUTDESAPO), DPTODES_DOM DEPARTAMENTO, CIUDDES_DOM PROVINCIA, ZIPDES_DOM DISTRITO, CREVIG FROM PRE_ASO_HIS_DET'
         +' WHERE PERIODO = '+QuotedStr(Fasoxedadysexo.xperiodo)+' AND NVL(ACUMULADO,0) =0  AND (ASOAPENOMDNI NOT LIKE ''DRE %'' AND ASOAPENOMDNI NOT LIKE ''UGEL %'') AND (CASE WHEN ASOFECNAC IS NULL THEN 0 ELSE SUBSTR('+QuotedStr(Fasoxedadysexo.xperiodo)+',1,4)-TO_CHAR(ASOFECNAC,''YYYY'') END) ='+DM1.cdsReporte.FieldByName('EDAD').AsString;
      end;
      If (xcbCtaIndi = 2) Then
      begin
          xSql := 'SELECT ROWNUM NUMERO, ASOCODMOD, ASOAPENOMDNI, ASODNI,  ASOSEXO, CASE WHEN ASOFECNAC IS NULL THEN TO_DATE(''01/01/1900'', ''DD/MM/YYYY'') ELSE TO_DATE(ASOFECNAC, ''DD/MM/YYYY'') END ASOFECNAC, ASOTIPID, CASE WHEN ASOFECNAC IS NULL THEN 0 ELSE SUBSTR('+QuotedStr(Fasoxedadysexo.xperiodo)+',1,4)-TO_CHAR(ASOFECNAC,''YYYY'') END EDAD,'
         +' SUBSTR('+QuotedStr(Fasoxedadysexo.xperiodo)+ ',1,4)-TO_CHAR(ASOFRESNOM,''YYYY'') ANO_SERV, ACUMESANT CAP_INI, CAPITAL APORTES, INTCAPACU INTERES, BONOS, MONCUO MONTO_CCI,'
         //+' ACUMULADO TOT_ACU, TO_DATE(ASOFRESNOM,''DD/MM/YYYY'') ASOFRESNOM, TO_DATE(FECAUTDESAPO,''DD/MM/YYYY'') FECAUTDESAPO, DPTODES_DOM DEPARTAMENTO, CIUDDES_DOM PROVINCIA, ZIPDES_DOM DISTRITO, CREVIG FROM PRE_ASO_HIS_DET'
         +' ACUMULADO TOT_ACU, TRUNC(ASOFRESNOM), TRUNC(FECAUTDESAPO), DPTODES_DOM DEPARTAMENTO, CIUDDES_DOM PROVINCIA, ZIPDES_DOM DISTRITO, CREVIG FROM PRE_ASO_HIS_DET'
         +' WHERE PERIODO = '+QuotedStr(Fasoxedadysexo.xperiodo)+' AND (ASOAPENOMDNI NOT LIKE ''DRE %'' AND ASOAPENOMDNI NOT LIKE ''UGEL %'') AND (CASE WHEN ASOFECNAC IS NULL THEN 0 ELSE SUBSTR('+QuotedStr(Fasoxedadysexo.xperiodo)+',1,4)-TO_CHAR(ASOFECNAC,''YYYY'') END) = '+DM1.cdsReporte.FieldByName('EDAD').AsString;
      end;   
// Final HPC_201708_PRE
      DM1.cdsSexo.Close;
      DM1.cdsSexo.DataRequest(xSql);
      DM1.cdsSexo.Open;
      dbgdoxedadysexodet.Selected.Clear;
      dbgdoxedadysexodet.Selected.Add('NUMERO'#9'8'#9'Item'#9#9);
      dbgdoxedadysexodet.Selected.Add('ASOCODMOD'#9'10'#9'Código~modular'#9#9);
      dbgdoxedadysexodet.Selected.Add('ASOAPENOMDNI'#9'45'#9'Apellidos y~nombre(s)'#9#9);
      dbgdoxedadysexodet.Selected.Add('ASODNI'#9'10'#9'DNI~asociado'#9#9);
      dbgdoxedadysexodet.Selected.Add('ASOSEXO'#9'10'#9'Sexo del~asociado'#9#9);
      dbgdoxedadysexodet.Selected.Add('ASOFECNAC'#9'10'#9'Fecha de~nacimiento'#9#9);
      dbgdoxedadysexodet.Selected.Add('ASOFRESNOM'#9'10'#9'Fecha de~Res.Nombramiento'#9#9);
      dbgdoxedadysexodet.Selected.Add('ASOTIPID'#9'2'#9'Tipo~asociado'#9#9);
      dbgdoxedadysexodet.Selected.Add('EDAD'#9'3'#9'Edad'#9#9);
      dbgdoxedadysexodet.Selected.Add('ANO_SERV'#9'3'#9'Años de~servicio'#9#9);
      dbgdoxedadysexodet.Selected.Add('CAP_INI'#9'12'#9'Capital~inicial'#9#9);
      dbgdoxedadysexodet.Selected.Add('APORTES'#9'12'#9'Aportes'#9#9);
      dbgdoxedadysexodet.Selected.Add('INTERES'#9'12'#9'Interes'#9#9);
      dbgdoxedadysexodet.Selected.Add('BONOS'#9'12'#9'Bonos'#9#9);
      dbgdoxedadysexodet.Selected.Add('MONTO_CCI'#9'12'#9'Monto~CCI'#9#9);
      dbgdoxedadysexodet.Selected.Add('TOT_ACU'#9'12'#9'Total~acumulado'#9#9);
      dbgdoxedadysexodet.Selected.Add('FECAUTDESAPO'#9'10'#9'Fecha~CADAPS'#9#9);
      dbgdoxedadysexodet.Selected.Add('DEPARTAMENTO'#9'30'#9'Departamento~domicilio'#9#9);
      dbgdoxedadysexodet.Selected.Add('PROVINCIA'#9'30'#9'Provincia~domicilio'#9#9);
      dbgdoxedadysexodet.Selected.Add('DISTRITO'#9'50'#9'Distrito~domicilio'#9#9);
      dbgdoxedadysexodet.Selected.Add('CREVIG'#9'1'#9'Credito~vigente'#9#9);
      dbgdoxedadysexodet.ApplySelected;
      TNumericField(DM1.cdsSexo.FieldByName('NUMERO')).DisplayFormat := '###,##0';
      TNumericField(DM1.cdsSexo.FieldByName('EDAD')).DisplayFormat := '##0';
      TNumericField(DM1.cdsSexo.FieldByName('ANO_SERV')).DisplayFormat := '##0';
      TNumericField(DM1.cdsSexo.FieldByName('CAP_INI')).DisplayFormat := '##,##0.00';
      TNumericField(DM1.cdsSexo.FieldByName('APORTES')).DisplayFormat := '##,##0.00';
      TNumericField(DM1.cdsSexo.FieldByName('INTERES')).DisplayFormat := '##,##0.00';
      TNumericField(DM1.cdsSexo.FieldByName('BONOS')).DisplayFormat := '##,##0.00';
      TNumericField(DM1.cdsSexo.FieldByName('MONTO_CCI')).DisplayFormat := '##,##0.00';
      TNumericField(DM1.cdsSexo.FieldByName('TOT_ACU')).DisplayFormat := '##,##0.00';
// Inicio HPC_201708_PRE
//MODIFICAR REPORTE DE ACTIVOS POR EDAD Y SEXO AL CIERRE DE CADA MES
      //Screen.Cursor := crDefault;
   End;
   Screen.Cursor := crDefault;
   If (DM1.cdsSexo.RecordCount = 0) Then
   Begin
       MessageDlg('No se ha encontrado información en el periodo procesado.', mtInformation, [mbOk], 0);
   End;
// Final HPC_201708_PRE
end;

procedure TFasoxedadysexodet.btnaexcelClick(Sender: TObject);
begin
  DM1.ExportaGridExcel(dbgdoxedadysexodet, 'PRE_DETEDADXSEXO');
end;
// Inicio HPC_201708_PRE
//MODIFICAR REPORTE DE ACTIVOS POR EDAD Y SEXO AL CIERRE DE CADA MES
procedure TFasoxedadysexodet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    btnretornarClick(Self);
end;
// Final HPC_201708_PRE
end.
