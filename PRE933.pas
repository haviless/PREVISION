// SPP_201401_PRE   : Se realiza el pase a producción a partir del pase HPC_201307_PRE

unit PRE933;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, wwdblook, Mask, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid,
  DBGrids;

type
  TFRMREPORTEPOSTRESST = class(TForm)
    Panel2: TPanel;
    dblcdptoid: TwwDBLookupCombo;
    medptodes: TMaskEdit;
    Label1: TLabel;
    btnGenerarReporte: TButton;
    btnExportarExcel: TButton;
    wwDBGData: TwwDBGrid;
    dtgData: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure dblcdptoidChange(Sender: TObject);
    procedure dblcdptoidExit(Sender: TObject);
    procedure btnGenerarReporteClick(Sender: TObject);
    procedure btnExportarExcelClick(Sender: TObject);
  private
    function isDxsValidos():boolean;
  public
    { Public declarations }
  end;

var
  FRMREPORTEPOSTRESST: TFRMREPORTEPOSTRESST;

implementation

{$R *.dfm}
uses PREDM;
procedure TFRMREPORTEPOSTRESST.FormCreate(Sender: TObject);
VAR xSql:string;
begin
  DM1.cdsQry10.Close;
  xSql := 'SELECT DPTOID, DPTODES FROM APO158 ORDER BY DPTOID';
  DM1.cdsDpto.Close;
  DM1.cdsDpto.DataRequest(xSql);
  DM1.cdsDpto.Open;
  dblcdptoid.Selected.Clear;
  dblcdptoid.Selected.Add('DPTOID'#9'2'#9'Código'#9#9);
  dblcdptoid.Selected.Add('DPTODES'#9'25'#9'Departamento'#9#9);
end;
(******************************************************************************)
procedure TFRMREPORTEPOSTRESST.dblcdptoidChange(Sender: TObject);
begin
  medptodes.Text := DM1.cdsDpto.FieldByName('DPTODES').AsString;
end;
(******************************************************************************)
procedure TFRMREPORTEPOSTRESST.dblcdptoidExit(Sender: TObject);
begin
    dblcdptoidChange(Sender);
end;
(******************************************************************************)
function TFRMREPORTEPOSTRESST.isDxsValidos():boolean;
begin
     if dblcdptoid.text<>'' then
       isDxsValidos:=true
     else
        begin
            showmessage('Por favor Seleccione un Departamento');
            dblcdptoid.setfocus();
            isDxsValidos:=false;
        end;
end;
(******************************************************************************)
procedure TFRMREPORTEPOSTRESST.btnGenerarReporteClick(Sender: TObject);
Var xSQL:String;
    isValido:boolean;
begin
   if isDxsValidos() then
      begin
         Screen.Cursor := crHourGlass;
         xSQL := 'SELECT ROWNUM ORD, DOC, DNI, "NOMBRE DOCENTE", DPTO, PROVINCIA, DISTRITO, '
               + '       "TIPO LUGAR", "NOMBRE LUGAR", "ETAPA/SECTOR/GRUPO",  MANZANA, LOTE,  INTERIOR, '
               + '       "EDIFICIO/BLOCK", PISO, NUMERO, VIA, NOMBRE_v, NUMERO_v, INTERIOR_v, REFERENCIA, '
               + '       "SI/NO", FECHA, UPROID '
               + ' FROM ( SELECT A.ASOTIPID DOC, A.ASODNI DNI, A.ASOAPENOMDNI AS "NOMBRE DOCENTE", '
               + '               D.DPTODES DPTO, E.CIUDDES PROVINCIA, F.ZIPDES DISTRITO, '
               + '               B.DESURB "TIPO LUGAR", A.DESURBVIV "NOMBRE LUGAR", '
               + '               DESMANVIV "ETAPA/SECTOR/GRUPO",  NUMMANVIV MANZANA, '
               + '               NUMLOTVIV LOTE,  NUMINTVIV INTERIOR, '
 +' CASE WHEN DESMANVIV IN (''BLOCK'',''EDIFICIO'') THEN DESMANVIV ELSE NULL END "EDIFICIO/BLOCK", '
 +'CASE WHEN DESMANVIV IN (''BLOCK'',''EDIFICIO'') THEN NUMLOTVIV ELSE NULL END PISO,'
 +'CASE WHEN DESMANVIV IN (''BLOCK'',''EDIFICIO'') THEN NUMINTVIV ELSE NULL END NUMERO,'
 +'C.DESTIPLUG VIA,'
 +'A.NOMDIRVIV NOMBRE_v, A.NUMDIRVIV NUMERO_v, NUMINTVIV INTERIOR_v, A.DESREFVIV REFERENCIA,'
 +'CASE WHEN NVL(AUTDESAPO,''X'') = ''S'' THEN ''SI'' ELSE ''NO'' END "SI/NO",'
 +'TO_DATE(FECAUTDESAPO) FECHA, UPROID  '
               + '       FROM APO201 A, ASO_TIP_URB B, ASO_TIP_LUG C, '
               + '       APO158 D, APO123 E, APO122 F '
               + '       WHERE (UPROID, UPAGOID, USEID) IN (SELECT UPROID, UPAGOID, USEID FROM APO101 WHERE DPTOID =  '''+dblcdptoid.Text+''') '
               + '       AND A.CODURBVIV = B.CODURB(+) '
               + '       AND A.CODTIPLUG = C.CODTIPLUG(+) AND SUBSTR(A.ZIPID,1,2) = D.DPTOID(+) AND SUBSTR(A.ZIPID,1,4) = E.CIUDID(+)AND A.ZIPID = F.ZIPID(+) '
               + '       ORDER BY ASOAPENOMDNI ) A1';

         DM1.cdsQry10.Close;
         DM1.cdsQry10.DataRequest(xSQL);
         DM1.cdsQry10.Open;
         Screen.Cursor := crDefault;
         btnExportarExcel.Enabled:=true;
      end
   else
     btnExportarExcel.Enabled:=false;
end;
(******************************************************************************)
procedure TFRMREPORTEPOSTRESST.btnExportarExcelClick(Sender: TObject);
begin
   DM1.HojaExcel('REPORTE', DM1.dsQry10, dtgData);
   showmessage('Exportacion Terminada');
end;

end.
