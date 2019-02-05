// Inicio Uso Estándares: 01/08/2011
// Unidad               : Previsión Social
// Formulario           : TFanucardesignatario
// Fecha de Creación    : 11/06/2013
// Autor                : Sistemas
// Objetivo             : Anulación Carta de Designatario
// Actualizaciones:
// HPC_201304_PRE       : ANULACION DE CARTA DE DESIGNATARIO
// SPP_201305_PRE       : Se realiza el pase a producción a partir del HPC_201304_PRE

unit PRE214;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons;

type
  TFanucardesignatario = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    measodni: TMaskEdit;
    measoapenomdni: TMaskEdit;
    Label3: TLabel;
    medsgnro: TMaskEdit;
    Label4: TLabel;
    medsgfrec: TMaskEdit;
    Label5: TLabel;
    meusuario: TMaskEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    meestado: TMaskEdit;
    medsgfecape: TMaskEdit;
    meusuape: TMaskEdit;
    mepvslbennr: TMaskEdit;
    btnanular: TBitBtn;
    btnsalir: TBitBtn;
    memotanu: TMemo;
    Label10: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure btnsalirClick(Sender: TObject);
    procedure btnanularClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fanucardesignatario: TFanucardesignatario;

implementation

uses PREDM;

{$R *.dfm}

procedure TFanucardesignatario.FormActivate(Sender: TObject);
Var xsql:String;
begin
   measodni.Text       := DM1.cdsMaestCartas.FieldByName('ASODNI').AsString;
   measoapenomdni.Text := DM1.cdsMaestCartas.FieldByName('ASOAPENOMDNI').AsString;
   medsgnro.Text       := DM1.cdsMaestCartas.FieldByName('DSGNRO').AsString;
   medsgfrec.Text      := DM1.cdsMaestCartas.FieldByName('DSGFREC').AsString;
   meusuario.Text      := DM1.cdsMaestCartas.FieldByName('USUARIO').AsString;
   xsql := 'SELECT PVSESTDES FROM PVS102 WHERE PVSESTDSG = '+QuotedStr(DM1.cdsMaestCartas.FieldByName('DSGESTAD').AsString)+' AND PVSDOC = ''C''';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xsql);
   DM1.cdsQry.Open;
   meestado.Text       := DM1.cdsQry.FieldByName('PVSESTDES').AsString;
   medsgfecape.Text    := DM1.cdsMaestCartas.FieldByName('DSGFAPER').AsString;
   meusuape.Text       := DM1.cdsMaestCartas.FieldByName('USUAPE').AsString;
   mepvslbennr.Text    := DM1.cdsMaestCartas.FieldByName('PVSLBENNR').AsString;
end;

procedure TFanucardesignatario.btnsalirClick(Sender: TObject);
begin
   Fanucardesignatario.Close;
end;

procedure TFanucardesignatario.btnanularClick(Sender: TObject);
Var xsql:String;
begin
   // Se controla que el expediente no se encuentre anulado
   If DM1.cdsMaestCartas.FieldByName('DSGESTAD').AsString = '13' Then
   Begin
      MessageDlg('La carta de designación se encuentra anulado.', mtError, [mbOk], 0);
      Exit;
   End;
   // Controla que el expediente no cuente con liquidación
   If ((DM1.cdsMaestCartas.FieldByName('DSGESTAD').AsString <> '01') Or (DM1.cdsMaestCartas.FieldByName('PVSLBENNR').AsString <> '')) Then
   Begin
      MessageDlg('La carta de designación ya se encuentra abierta o con Liquidación de beneficio.', mtError, [mbOk], 0);
      Exit;
   End;
   If Trim(memotanu.Text) = '' Then
   Begin
      MessageDlg('Ingrese el motivo de la anulación.', mtInformation, [mbOk], 0);
      Exit;
   End;
   If MessageDlg('Se va a proceder a anular la carta de designación.'+#13+'¿Esta seguro de anular la carta de designación?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
      xSql := 'UPDATE PVS302 SET DSGESTAD = ''13'', ANULADO = ''S'', USUANU = '+QuotedStr(DM1.wUsuario)+', MOTANUCAR = '+QuotedStr(memotanu.Text)+' , FECANU = SYSDATE WHERE ASOID = '+QuotedStr(DM1.cdsMaestCartas.FieldByName('ASOID').AsString)+' AND DSGNRO = '+QuotedStr(DM1.cdsMaestCartas.FieldByName('DSGNRO').AsString);
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      DM1.cdsMaestCartas.Edit;
      DM1.cdsMaestCartas.FieldByName('DSGESTAD').AsString := '13';
      DM1.cdsMaestCartas.FieldByName('PVSESTDES').AsString := 'ANULADA';
      MessageDlg('La anulación ha concluido.', mtInformation, [mbOk], 0);
      btnsalir.OnClick(btnsalir);
   End;
end;

end.
