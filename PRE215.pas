// Inicio Uso Estándares: 01/08/2011
// Unidad : Previsión Social
// Formulario : FrmMantenimientoCausaCese
// Fecha de Creación : 03/12/2015
// Autor : Juver De la Cruz
// Objetivo : Mantenimiento de Causas de Cese
// Actualizaciones:
// HPC_201509_PRE : Categorizar Causas de Cese

unit PRE215;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, ExtCtrls, PRE902,
  DB, Wwdatsrc, DBClient, wwclient;

type
  TFrmMantenimientoCausaCese = class(TForm)
    pnlPie: TPanel;
    Label1: TLabel;
    btnSalir: TBitBtn;
    Panel1: TPanel;
    CboTipoBeneficio: TFCboTipoBeneficio;
    cdsQry26: TwwClientDataSet;
    dsQry26: TwwDataSource;
    dbgUniverso: TwwDBGrid;
    btnAgregarCausaCese: TwwIButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CboTipoBeneficiocbListaDatosChange(Sender: TObject);
    procedure dbgUniversoDblClick(Sender: TObject);
    procedure btnAgregarCausaCeseClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
  private
    { Private declarations }
    xxCdsQryUniverso : TwwClientDataSet;
     xxDsQryUniverso : TwwDataSource;
  public
    { Public declarations }
  end;

var
  FrmMantenimientoCausaCese: TFrmMantenimientoCausaCese;

implementation

uses PREDM, PRE215a;

{$R *.dfm}

(******************************************************************************)
procedure TFrmMantenimientoCausaCese.FormShow(Sender: TObject);
begin
    DM1.FG_CONECTA_CDS(xxCdsQryUniverso, xxDsQryUniverso);
    CboTipoBeneficio.FG_CARGA_DATOS();
end;

(******************************************************************************)
procedure TFrmMantenimientoCausaCese.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

(******************************************************************************)
procedure TFrmMantenimientoCausaCese.CboTipoBeneficiocbListaDatosChange(
  Sender: TObject);
var xsSQL : String;
begin
  xsSQL :=  ' SELECT TIPBENEF, CODCAUCES, DESCAUCES '
          + '   FROM PRE_CAUSA_CESE_CAB '
          + '  WHERE TIPBENEF = ' + QuotedStr(CboTipoBeneficio.FG_OBTENER_CODIGO_TIPBENEF)
          + '  ORDER BY CODCAUCES, DESCAUCES';
  xxCdsQryUniverso.Close;
  xxCdsQryUniverso.DataRequest(xsSQL);
  xxCdsQryUniverso.Open;
  With dbgUniverso Do Begin
      DataSource := xxdsQryUniverso;
      Selected.Clear;
      Selected.Add('CODCAUCES'#9'5'#9'Código~Causa cese');
      Selected.Add('DESCAUCES'#9'50'#9'Causa Cese');
      ApplySelected;
  End;
end;

(******************************************************************************)
procedure TFrmMantenimientoCausaCese.dbgUniversoDblClick(Sender: TObject);
begin
   if xxCdsQryUniverso.RecordCount <= 0 then begin
     MessageDlg(AnsiUpperCase('Seleccione una causa de cese'), mtInformation, [mbOk], 0);
     exit;
   end;

   Try
      FrmMantCausaCese := TFrmMantCausaCese.Create(self);
      FrmMantCausaCese.xsCODCAUCES := xxCdsQryUniverso.fieldbyname('CODCAUCES').AsString;
      FrmMantCausaCese.xsTIPBENEF := xxCdsQryUniverso.fieldbyname('TIPBENEF').AsString;
      FrmMantCausaCese.edtCausaCese.Text := xxCdsQryUniverso.fieldbyname('DESCAUCES').AsString;
      FrmMantCausaCese.Caption := FrmMantCausaCese.Caption + ' - ' + CboTipoBeneficio.cbListaDatos.Text;
      if FrmMantCausaCese.ShowModal = mrOk then begin
         CboTipoBeneficiocbListaDatosChange(nil);
      end;
   Finally
      FrmMantCausaCese.Free;
   End;
end;

(******************************************************************************)
procedure TFrmMantenimientoCausaCese.btnAgregarCausaCeseClick(
  Sender: TObject);
begin
   Try
      FrmMantCausaCese := TFrmMantCausaCese.Create(self);
      FrmMantCausaCese.xsCODCAUCES := '0';
      FrmMantCausaCese.xsTIPBENEF := CboTipoBeneficio.FG_OBTENER_CODIGO_TIPBENEF();
      FrmMantCausaCese.Caption := FrmMantCausaCese.Caption + ' - ' + CboTipoBeneficio.cbListaDatos.Text;
      if FrmMantCausaCese.ShowModal = mrOk then begin
         CboTipoBeneficiocbListaDatosChange(nil);
      end;
   Finally
      FrmMantCausaCese.Free;
   End;
end;

(******************************************************************************)
procedure TFrmMantenimientoCausaCese.btnSalirClick(Sender: TObject);
begin
  Close;
end;

(******************************************************************************)
end.
