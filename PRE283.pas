unit PRE283;

// Actualizaciones
// HPC_201202_PRE 10/02/20002 Desactiva lectura de Foto y Firma de FTP, lee de archivo RENIEC
// DPP_201201_PRE   : Se realiza el pase a producción de acuerdo al HPC_201202_PRE

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, ValEdit, ExtCtrls;

type
  Tfmstdatrec = class(TForm)
    pnlDatCapRen: TPanel;
    imgFoto: TImage;
    imgfirma2: TImage;
    lblMsgUltimaAct2: TLabel;
    lblMsgUltimaAct1: TLabel;
    vallis: TValueListEditor;
    btncerrar: TBitBtn;
    lblusuario: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmstdatrec: Tfmstdatrec;

implementation

uses PREDM;

{$R *.dfm}

Procedure Tfmstdatrec.FormActivate(Sender: TObject);
Begin
  If DM1.cdsTipoMoneda.RecordCount > 0 Then
  Begin
    vallis.InsertRow('Nro. de Libro',DM1.cdsTipoMoneda.FieldByName('NUMLIB').AsString ,True);
    vallis.InsertRow('Libreta Electoral/DNI',DM1.cdsTipoMoneda.FieldByName('DNI').AsString ,True);
    vallis.InsertRow('Apellido Paterno',DM1.cdsTipoMoneda.FieldByName('APEPAT').AsString ,True);
    vallis.InsertRow('Apellido Materno',DM1.cdsTipoMoneda.FieldByName('APEMAT').AsString ,True);
    vallis.InsertRow('Nombres',DM1.cdsTipoMoneda.FieldByName('NOMBRE').AsString ,True);
    vallis.InsertRow('Documento Sustentatorio',DM1.cdsTipoMoneda.FieldByName('OTRDOC').AsString ,True);
    vallis.InsertRow('Lugar de Nacimiento',DM1.cdsTipoMoneda.FieldByName('LUGNAC').AsString ,True);
    vallis.InsertRow('Nombre del Padre',DM1.cdsTipoMoneda.FieldByName('NOMPAD').AsString ,True);
    vallis.InsertRow('Nombre de la Madre',DM1.cdsTipoMoneda.FieldByName('NOMMAD').AsString ,True);
    vallis.InsertRow('Fecha de Nacimiento',DM1.cdsTipoMoneda.FieldByName('FECNAC').AsString ,True);
    vallis.InsertRow('Estatura',DM1.cdsTipoMoneda.FieldByName('ESTATURA').AsString ,True);
    vallis.InsertRow('Sexo',DM1.cdsTipoMoneda.FieldByName('SEXO').AsString ,True);
    vallis.InsertRow('Estado Civil',DM1.cdsTipoMoneda.FieldByName('ESTCIV').AsString ,True);
    vallis.InsertRow('Grado de Instruccin',DM1.cdsTipoMoneda.FieldByName('GRAINS').AsString ,True);
    vallis.InsertRow('Lugar de Domicilio',DM1.cdsTipoMoneda.FieldByName('LUGDOM').AsString ,True);
    vallis.InsertRow('Restricciones',DM1.cdsTipoMoneda.FieldByName('RESTRICCIONES').AsString ,True);
    vallis.InsertRow('Fechade Inscripci n',DM1.cdsTipoMoneda.FieldByName('FECINS').AsString ,True);
    vallis.InsertRow('Constancia de Votacin',DM1.cdsTipoMoneda.FieldByName('STAVOT').AsString ,True);
    vallis.InsertRow('Fecha de Emisi n Docum.',DM1.cdsTipoMoneda.FieldByName('FECEMIDOC').AsString ,True);
    vallis.InsertRow('Direccin',DM1.cdsTipoMoneda.FieldByName('DIRECCION').AsString ,True);
    //INCIO: DPP_201201_PRE
    //dm1.CargaImagenes;
    dm1.CargaImagenes(DM1.cdsAsociado.FieldByName('ASODNI').AsString);
    //FINAL: DPP_201201_PRE
    imgFoto.Picture.Assign(DM1.JPG);
    imgFirma2.Picture.Assign(DM1.jpgFirma);
    lblMsgUltimaAct2.Caption := 'EL : '+DM1.cdsTipoMoneda.FieldByName('FECACT').AsString;
    lblusuario.Caption := 'POR : '+UpperCase(DM1.DevuelveValor('USERTABLE', 'USERNOM', 'USERID', DM1.cdsTipoMoneda.FieldByName('USUACT').AsString));
  End
  Else ShowMessage('No existen datos de RENIEC');
End;

procedure Tfmstdatrec.btncerrarClick(Sender: TObject);
begin
  fmstdatrec.Close;
end;

end.
