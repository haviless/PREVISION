// Inicio Uso Estándares: 01/08/2011
// Unidad               : PRE217
// Formulario           : Fbuscaliqext
// Fecha de Creación    : 26/06/2017
// Autor                : Area de desarrollo de sistemas.
// Objetivo             : Seleccionar registro en el caso que exista mas de uno.
// Actualizaciones
// HPC_201705_PRE : Creación

unit PRE217;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons;

type
  TFbuscaliqext = class(TForm)
    dbgbuscar: TwwDBGrid;
    btnCerrar: TBitBtn;
    btnAceptar: TBitBtn;
    procedure dbgbuscarDblClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fbuscaliqext: TFbuscaliqext;

implementation

uses PREDM;

{$R *.dfm}

procedure TFbuscaliqext.dbgbuscarDblClick(Sender: TObject);
begin
  btnAceptar.OnClick(btnAceptar);
end;

procedure TFbuscaliqext.btnAceptarClick(Sender: TObject);
begin
   DM1.xFlg := 'S';
   btncerrar.OnClick(btncerrar);
end;

procedure TFbuscaliqext.btnCerrarClick(Sender: TObject);
begin
   Close;
end;

procedure TFbuscaliqext.FormActivate(Sender: TObject);
begin
   dbgbuscar.Selected.Clear;
   dbgbuscar.Selected.Add('ASOAPENOMDNI'#9'45'#9'Apellidos y Nombres~del beneficiario'#9#9);
   dbgbuscar.Selected.Add('ASODNI'#9'10'#9'DNI del~beneficiario'#9#9);
   dbgbuscar.Selected.Add('PVSLBENNR'#9'13'#9'Número de~liquidación'#9#9);
   dbgbuscar.Selected.Add('PVSLFECBE'#9'18'#9'Fecha de~liquidación'#9#9);
   dbgbuscar.Selected.Add('BENEFDES'#9'18'#9'Tipo de~beneficio'#9#9);
   dbgbuscar.ApplySelected;
end;

end.
