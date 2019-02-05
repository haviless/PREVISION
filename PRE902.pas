// Inicio Uso Estándares: 01/08/2011
// Unidad : Previsión Social
// Formulario : FCboTipoBeneficio
// Fecha de Creación : 03/12/2015
// Autor : Juver De la Cruz
// Objetivo : Listar los tipos de beneficio
// Actualizaciones:
// HPC_201509_PRE : Categorizar Causas de Cese

unit PRE902;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, wwdblook, DB, Wwdatsrc, DBClient, wwclient, StrUtils,
  Wwdbdlg;

type
  TFCboTipoBeneficio = class(TFrame)
    lblEtiqueta: TLabel;
    cbListaDatos: TwwDBLookupCombo;
    procedure cbListaDatosEnter(Sender: TObject);
    procedure cbListaDatosExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    xxCdsQry : TwwClientDataSet;
     xxDsQry : TwwDataSource;
    procedure FG_CARGA_DATOS(psIncluirOpcSeleccion : String = 'N'; psTextoSeleccion : String = '');
    function FG_OBTENER_CODIGO_TIPBENEF(): String;
    procedure FG_IR_REGISTRO_CODIGO(psTIPBENEF : String);
  end;

implementation

uses PREDM;

{$R *.dfm}


(******************************************************************************)
procedure TFCboTipoBeneficio.FG_CARGA_DATOS(psIncluirOpcSeleccion : String = 'N';
                                            psTextoSeleccion : String = '');
var xsSQL : String;
begin
  DM1.FG_CONECTA_CDS(xxCdsQry, xxDsQry);
  xsSQL :=
          ' SELECT TIPBENEF, BENEFDES '
        + '   FROM (SELECT TIPBENEF, BENEFDES '
        + '           FROM TGE186 '
        + '          WHERE TIPBENEF IN (''01'', ''02'', ''03'') '
        + '          ORDER BY TIPBENEF '
        + '         ) '
        + '  ORDER BY BENEFDES';
  if psIncluirOpcSeleccion = 'S' then begin
    xsSQL := 'SELECT CASE WHEN TIPBENEF = ''^^'' THEN -1 ELSE ROWNUM END ORDEN, TIPBENEF, BENEFDES FROM ( SELECT ''^^'' TIPBENEF, ''' + psTextoSeleccion + ''' BENEFDES FROM DUAL UNION ALL '
            + xsSQL
            + ' ) ';
    xxCdsQry.IndexFieldNames := 'ORDEN';
  end;
  xxCdsQry.Close;
  xxCdsQry.DataRequest(xsSQL);
  xxCdsQry.Open;
  cbListaDatos.LookupTable := xxCdsQry;
  cbListaDatos.LookupField := 'BENEFDES';
  cbListaDatos.Selected.Clear;
  cbListaDatos.Selected.Add('BENEFDES'#9'30'#9'TIPO DE BENEFICIO');
  cbListaDatos.LookupValue := xxCdsQry.fieldbyname('BENEFDES').AsString;
end;

(******************************************************************************)
function TFCboTipoBeneficio.FG_OBTENER_CODIGO_TIPBENEF() : String;
begin
  if Assigned(xxCdsQry) and (xxCdsQry.RecordCount > 0) and (cbListaDatos.Text<>'') then begin
     xxCdsQry.Locate('BENEFDES', VarArrayof([cbListaDatos.Text]), []);
     result := xxCdsQry.fieldbyname('TIPBENEF').asstring
  end else
     result := '';
end;

(******************************************************************************)
procedure TFCboTipoBeneficio.FG_IR_REGISTRO_CODIGO(psTIPBENEF : String);
begin
  if xxCdsQry.Locate('TIPBENEF', VarArrayOf([psTIPBENEF]),[]) then
     cbListaDatos.Text :=  xxCdsQry.fieldbyname('BENEFDES').AsString;
end;

(******************************************************************************)
procedure TFCboTipoBeneficio.cbListaDatosEnter(Sender: TObject);
begin
  xxCdsQry.IndexFieldNames := 'BENEFDES';
end;

(******************************************************************************)
procedure TFCboTipoBeneficio.cbListaDatosExit(Sender: TObject);
begin
  xxCdsQry.IndexFieldNames := '';
end;

(******************************************************************************)
end.
