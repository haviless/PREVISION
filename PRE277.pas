// Inicio Uso Estándares: 01/08/2011
// Unidad               : Previsión Social
// Formulario           : Fmueautdesapo
// Fecha de Creación    : 08/08/2011
// Autor                : Sistemas
// Objetivo             : Mostrar Autorización de Descuento
// Actualizaciones:
// HPC_201303_PRE       : Ventana para mostrar detalle del registro de autorización de descuento del asociado.
// SPP_201304_PRE       : Se realiza el pase a produccion a partir del HPC_201303_PRE

unit PRE277;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, wwdbdatetimepicker, Mask, wwdblook, Wwdbdlg, StdCtrls,
  Buttons;

type
  TFmueautdesapo = class(TForm)
    gbgrupo: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    btncerrar: TBitBtn;
    StaticText1: TStaticText;
    Panel2: TPanel;
    edtFecAutDesApo: TEdit;
    Panel1: TPanel;
    edtUsuAutRegApo: TEdit;
    Panel3: TPanel;
    edtFecRegAutDesApo: TEdit;
    Panel4: TPanel;
    edtOfAutDesApo: TEdit;
    Panel5: TPanel;
    edtDesUniPro: TEdit;
    Panel6: TPanel;
    edtDesUniPag: TEdit;
    Panel7: TPanel;
    edtDesUniGes: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fmueautdesapo: TFmueautdesapo;

implementation

uses PREDM;

{$R *.dfm}

procedure TFmueautdesapo.FormActivate(Sender: TObject);
Var xSql:String;
begin
   edtUsuAutRegApo.Text    := DM1.cdsAsociado.FieldByName('USUREGAUTDESAPO').AsString;
   edtFecAutDesApo.Text    := DM1.cdsAsociado.FieldByName('FECAUTDESAPO').AsString;
   edtFecRegAutDesApo.Text := DM1.cdsAsociado.FieldByName('FECREGAUTDESAPO').AsString;
   edtOfAutDesApo.Text     := DM1.DevuelveValor('APO110', 'OFDESNOM', 'OFDESID', DM1.cdsAsociado.FieldByName('OFIREGAUTDESAPO').AsString);
   xSql := 'SELECT UPRONOM FROM APO102 WHERE UPROID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Close;
   DM1.cdsQry.Open;
   edtDesUniPro.Text := DM1.cdsQry.FieldByName('UPRONOM').AsString;
   xSql := 'SELECT UPAGONOM FROM APO103 WHERE UPROID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString)+' AND UPAGOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString);
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Close;
   DM1.cdsQry.Open;
   edtDesUniPag.Text := DM1.cdsQry.FieldByName('UPAGONOM').AsString;
   xSql := 'SELECT USENOM FROM APO101 WHERE UPROID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString)+' AND UPAGOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString)+' AND USEID = '+QuotedStr(DM1.cdsAsociado.FieldByName('USEID').AsString);
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   edtDesUniGes.Text := DM1.cdsQry.FieldByName('USENOM').AsString;
end;

procedure TFmueautdesapo.btncerrarClick(Sender: TObject);
begin
   Fmueautdesapo.Close;
end;

end.
