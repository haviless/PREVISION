// Inicio Uso Estándares: 01/08/2011
// Unidad               : Previsión Social
// Formulario           : TFanulacionexpediente
// Fecha de Creación    : 10/06/2013
// Autor                : Sistemas
// Objetivo             : Anulación Expediente de beneficios
// Actualizaciones:
// HPC_201304_PRE       : Anulación de expediente
// SPP_201305_PRE       : Se realiza el pase a producción a partir del HPC_201304_PRE
// HPC_201601_PRE		: CAMBIAR DE DO A CE AL GRABAR LA LIQUIDACION DE BENEFICIO
// HPC_201802_PRE       : Se modifica el Qry para anular los expedientes de beneficios 
// HPC_201810_PRE       : Se controla la anulación de expedientes de beneficio
//                      : Se limpia codigo de cargo en la tabla PVS301 al momento de anular el expediente 
unit PRE213;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFanulacionexpediente = class(TForm)
    btnanular: TBitBtn;
    btnsalir: TBitBtn;
    memmotanu: TMemo;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtnumexp: TEdit;
    edtusucreexp: TEdit;
    Label3: TLabel;
    edttipobeneficio: TEdit;
    Label4: TLabel;
    edtasoapenomdni: TEdit;
    Label5: TLabel;
    edtfecexp: TEdit;
    Label6: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure btnanularClick(Sender: TObject);
    procedure btnsalirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fanulacionexpediente: TFanulacionexpediente;

implementation

uses PREDM;
{$R *.dfm}

procedure TFanulacionexpediente.FormActivate(Sender: TObject);
begin
  edtnumexp.Text        := Copy(DM1.cdsExpLiq.FieldByName('PVSEXPNRO').AsString,1,4)+'-'+Copy(DM1.cdsExpLiq.FieldByName('PVSEXPNRO').AsString,5,7);
  edttipobeneficio.Text := DM1.cdsExpLiq.FieldByName('BENEFDES').AsString;
  edtfecexp.Text        := DM1.cdsExpLiq.FieldByName('PVSFECEXP').AsString;
  edtusucreexp.Text     := UpperCase(DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.cdsExpLiq.FieldByName('USUCREEXP').AsString));
  edtasoapenomdni.Text  := DM1.cdsExpLiq.FieldByName('ASOAPENOMDNI').AsString;
end;

procedure TFanulacionexpediente.btnanularClick(Sender: TObject);
Var xSql:String;
begin
   // Se controla que el expediente no se encuentre anulado
   If DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString = '13' Then
   Begin
      MessageDlg('El expediente se encuentra anulado.', mtError, [mbOk], 0);
      Exit;
   End;
   // Controla que el expediente no cuente con liquidación
   // Inicio: HPC_201810_PRE
   // Se contola la anulación de expediente de beneficio
   // If ((DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString <> '01') Or (DM1.cdsExpLiq.FieldByName('PVSLBENNR').AsString <> '')) Then
   If (DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString = '02') Or (DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString = '06') Or (DM1.cdsExpLiq.FieldByName('PVSLBENNR').AsString <> '') Then
   // Fin: HPC_201810_PRE
   Begin
      MessageDlg('El expediente cuenta con liquidación.', mtError, [mbOk], 0);
      Exit;
   End;
   // Se controla que el asociado no tenga crédito cesate despues de la generación del expediente
   xSql := 'SELECT A.ASOID FROM PVS301 A, CRE301 B, CRE110 C WHERE A.ASOID = '+QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString)
   +' AND A.ASOID = B.ASOID AND A.HREG < B.HREG AND B.CREESTID = ''02'' AND B.TIPCREID = C.TIPCREID AND C.ASOTIPID = ''CE''';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   If DM1.cdsQry.RecordCount > 0 Then
   Begin
      MessageDlg('El asociado solicito un crédito cesante después de generado su expediente.', mtError, [mbOk], 0);
      Exit;
   End;
   If memmotanu.Text = '' Then
   Begin
      MessageDlg('Ingrese el motivo de la anulación.', mtInformation, [mbOk], 0);
      Exit;
   End;
   If MessageDlg('Se va a proceder a anular el expediente.'+#13+'Al anular el expediente el asociado que se encuentra como Cesante volverá a Docente.'+#13+'¿Seguro de anular el expediente?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
      // Inicio: HPC_201802_PRE
      // Se modifica el Qry para anular los expedientes de beneficios
      // xSql := 'UPDATE PVS301 SET PVSESTADO = ''13'', USU_ANU = '+QuotedStr(DM1.wUsuario)+', FEC_ANU = SYSDATE, COM_ANU = '+QuotedStr(Trim(memmotanu.Text))+' WHERE ASOID = '+QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString);
      // Inicio: HPC_201810_PRE
      // Se deja nulo el campo numero de codigo de cargo al momento de anular un expediente de beneficio
      // xSql := 'UPDATE PVS301 SET PVSESTADO = ''13'', USU_ANU = '+QuotedStr(DM1.wUsuario)+', FEC_ANU = SYSDATE, COM_ANU = '+QuotedStr(Trim(memmotanu.Text))+' WHERE ASOID = '+QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString)
      xSql := 'UPDATE PVS301 SET CODCAREXP = NULL, PVSESTADO = ''13'', USU_ANU = '+QuotedStr(DM1.wUsuario)+', FEC_ANU = SYSDATE, COM_ANU = '+QuotedStr(Trim(memmotanu.Text))+' WHERE ASOID = '+QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString)
      // Fin: HPC_201810_PRE
      +' AND PVSEXPNRO = '+QuotedStr(DM1.cdsExpLiq.FieldByName('PVSEXPNRO').AsString);
      // Fin: HPC_201802_PRE
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      // INICIO HPC_201601_PRE
      //xSql := 'UPDATE APO201 SET ASOTIPID = ''DO'',ASOSITID = ''DO'' WHERE ASOID = '+QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString);
      //DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      // FIN HPC_201601_PRE
      DM1.cdsExpLiq.Edit;
      DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString := '13';
      DM1.cdsExpLiq.FieldByName('PVSESTDES').AsString := 'ANULADA';
      MessageDlg('La anulación ha concluido.', mtInformation, [mbOk], 0);
      btnsalir.OnClick(btnsalir);
   End;
end;

procedure TFanulacionexpediente.btnsalirClick(Sender: TObject);
begin
   Fanulacionexpediente.Close;
end;

end.
