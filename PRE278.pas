// Inicio Uso Estándares: 01/08/2011
// Unidad               : Previsión Social
// Formulario           : FMueNoTieAutDesApo
// Fecha de Creación    : 08/08/2011
// Autor                : Sistemas
// Objetivo             : Autorización de Descuento de Aportes
// Actualizaciones:
// HPC_201303_PRE       : Ventana para mostrar el mensaje que asociado no cuenta con autorización de descuento de aportes
// SPP_201304_PRE       : Se realiza el pase a produccion a partir del HPC_201303_PRE

unit PRE278;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, fcLabel;

type
  TFMueNoTieAutDesApo = class(TForm)
    StaticText1: TStaticText;
    GroupBox3: TGroupBox;
    fcLabel1: TfcLabel;
    btncerrar: TBitBtn;
    procedure btnaceptaClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMueNoTieAutDesApo: TFMueNoTieAutDesApo;

implementation

{$R *.dfm}

procedure TFMueNoTieAutDesApo.btnaceptaClick(Sender: TObject);
begin
Close;
end;

procedure TFMueNoTieAutDesApo.btncerrarClick(Sender: TObject);
begin
   FMueNoTieAutDesApo.Close;
end;

end.
