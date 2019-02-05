// Inicio Uso Estándares: 01/08/2011
// Unidad : Previsión Social
// Formulario : FCboCausaCese
// Fecha de Creación : 03/12/2015
// Autor : Juver De la Cruz
// Objetivo : Listar las Causas de Cese
// Actualizaciones:
// HPC_201509_PRE : Categorizar Causas de Cese
// HPC_201809_PRE : Se modifica la opción de seleccionar la causa de cese
unit PRE901;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, wwdblook, DB, Wwdatsrc, DBClient, wwclient, StrUtils,
  // Inicio: HPC_201809_PRE
  //  
  // Wwdbdlg;
  Wwdbdlg, Grids, Wwdbigrd, Wwdbgrid, Buttons;
  // Fin: HPC_201809_PRE
type
  // Inicio: HPC_201809_PRE
  // Nuevos procedimientos para controlar la cause de cese
  TFCboCausaCese = class(TForm)
  // TFCboCausaCese = class(TFrame)
  // lblEtiqueta: TLabel;
  // cbListaDatos: TwwDBLookupComboDlg;
  // procedure cbListaDatosEnter(Sender: TObject);
  // procedure cbListaDatosExit(Sender: TObject);
    edtbuscar: TEdit;
    btnbuscar: TBitBtn;
    dbgcausas: TwwDBGrid;
    btncerrar: TBitBtn;
    procedure btnbuscarClick(Sender: TObject);
    procedure dbgcausasDblClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
  // Fin: HPC_201809_PRE
  private
    { Private declarations }
  public
    { Public declarations }
    // Inicio: HPC_201809_PRE
    // Se retiran client ya no usados
    // xxCdsQry : TwwClientDataSet;
    //  xxDsQry : TwwDataSource;
    // procedure FG_CARGA_DATOS(psTipBenef : string; psIncluirOpcSeleccion : String = 'N'; psTextoSeleccion : String = '');
    // function FG_OBTENER_CODIGO_CODCAUCES(): String;
    // procedure FG_IR_REGISTRO_CODIGO(psTIPBENEF : String; psCODCAUCES : String);
    // Fin HPC_201809_PRE
  end;

var
  // Inicio: HPC_201809_PRE
  // Se añade nuevo componenete
  FCboCausaCese: TFCboCausaCese;
  // Fin: HPC_201809_PRE

implementation

// Inicio: HPC_201809_PRE
// Se añade nueva unidad
// uses PREDM;
uses PRE233, PREDM;
// Fin: HPC_201809_PRE

{$R *.dfm}


// Inicio: HPC_201809_PRE
// Se retira procedimientos no usados
// (******************************************************************************)
// procedure TFCboCausaCese.FG_CARGA_DATOS(psTipBenef : String;
//                                         psIncluirOpcSeleccion : String = 'N';
//                                         psTextoSeleccion : String = '');
// var xsSQL : String;
// begin
//   DM1.FG_CONECTA_CDS(xxCdsQry, xxDsQry);
//   xsSQL :=
//           ' SELECT TIPBENEF, CODCAUCES, DESCAUCES '
//         + '   FROM (SELECT TIPBENEF, CODCAUCES, DESCAUCES '
//         + '           FROM PRE_CAUSA_CESE_CAB '
//         + '          WHERE TIPBENEF = ' + QuotedStr(psTipBenef)
//         + '         ) '
//         + '  ORDER BY DESCAUCES';
//   if psIncluirOpcSeleccion = 'S' then begin
//     xsSQL := 'SELECT CASE WHEN CODCAUCES = ''^^'' THEN -1 ELSE ROWNUM END ORDEN, CODCAUCES, DESCAUCES FROM ( SELECT ''^^'' CODCAUCES, ''' + psTextoSeleccion + ''' DESCAUCES FROM DUAL UNION ALL '
//             + xsSQL
//             + ' ) ';
//     xxCdsQry.IndexFieldNames := 'ORDEN';
//   end;
//   xxCdsQry.Close;
//   xxCdsQry.DataRequest(xsSQL);
//   xxCdsQry.Open;
//   cbListaDatos.LookupTable := xxCdsQry;
//   cbListaDatos.LookupField := 'DESCAUCES';
//   cbListaDatos.Selected.Clear;
//   cbListaDatos.Selected.Add('DESCAUCES'#9'50'#9'CAUSA DE CESE');
//   cbListaDatos.Selected.Add('CODCAUCES'#9'5'#9'CODIGO DE CESE');
//   cbListaDatos.LookupValue := xxCdsQry.fieldbyname('DESCAUCES').AsString;
// end;

// (******************************************************************************)
// function TFCboCausaCese.FG_OBTENER_CODIGO_CODCAUCES() : String;
// begin
//   if Assigned(xxCdsQry) and (xxCdsQry.RecordCount > 0) and (cbListaDatos.Text<>'') then begin
//      xxCdsQry.Locate('DESCAUCES', VarArrayof([cbListaDatos.Text]), []);
//      result := xxCdsQry.fieldbyname('CODCAUCES').asstring
//   end else
//      result := '';
// Se retiran procedimiento no usados
// (******************************************************************************)
// procedure TFCboCausaCese.FG_IR_REGISTRO_CODIGO(psTIPBENEF : String; psCODCAUCES : String);
// begin
//   if xxCdsQry.Locate('TIPBENEF;CODCAUCES', VarArrayOf([psTIPBENEF, psCODCAUCES]),[]) then
//      cbListaDatos.Text :=  xxCdsQry.fieldbyname('DESCAUCES').AsString;
// end;
//
// (******************************************************************************)
// procedure TFCboCausaCese.cbListaDatosEnter(Sender: TObject);
// begin
//   xxCdsQry.IndexFieldNames := 'DESCAUCES';
// end;
//
// (******************************************************************************)
// procedure TFCboCausaCese.cbListaDatosExit(Sender: TObject);
// begin
//   xxCdsQry.IndexFieldNames := '';
// end;
// (******************************************************************************)
// Fin: HPC_201809_PRE



// Inicio: HPC_201809_PRE
// Se añade nuevo procedimiento
procedure TFCboCausaCese.btnbuscarClick(Sender: TObject);
Var xSql:String;
begin
   xSql := 'SELECT TIPBENEF, CODCAUCES, DESCAUCES FROM PRE_CAUSA_CESE_CAB WHERE TIPBENEF = '+QuotedStr(DM1.xTipLiq)
   +' AND DESCAUCES LIKE '+QuotedStr(Trim('%'+edtbuscar.Text+'%'));
   DM1.cdsQry22.Close;
   DM1.cdsQry22.DataRequest(xSql);
   DM1.cdsQry22.Open;
   dbgcausas.Selected.Clear;
   dbgcausas.Selected.Add('CODCAUCES'#9'4'#9'Código'#9#9);
   dbgcausas.Selected.Add('DESCAUCES'#9'55'#9'Descripción'#9#9);
   dbgcausas.ApplySelected;
end;

procedure TFCboCausaCese.dbgcausasDblClick(Sender: TObject);
begin
   Close;
end;

procedure TFCboCausaCese.btncerrarClick(Sender: TObject);
begin
   Close;
end;

procedure TFCboCausaCese.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  begin
    Key := #0;
    Perform(CM_DIALOGKEY, VK_TAB, 0);
  end;
end;

procedure TFCboCausaCese.FormActivate(Sender: TObject);
begin
  DM1.cdsQry22.Close;
end;
// Fin: HPC_201809_PRE

end.
