unit PRE269;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppBands,
  ppCtrls, ppVar, ppPrnabl, ppCache, ppParameter, wwdblook, Wwdbdlg,
  wwdbdatetimepicker;

type
  TFlibAho = class(TForm)
    dbglibretas: TwwDBGrid;
    gbbuscar: TGroupBox;
    btnbuscar: TBitBtn;
    meapenommenor: TMaskEdit;
    BitBtn1: TBitBtn;
    procedure btnbuscarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btncerrarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbglibretasDblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FlibAho: TFlibAho;

implementation

uses PREDM, PRE270;

{$R *.dfm}

procedure TFlibAho.btnbuscarClick(Sender: TObject);
Var xSql:String;
begin
  xSql := 'SELECT * FROM PVS308 WHERE TRIM(DSGAPEPAT)||'' ''||TRIM(DSGAPEMAT)||'' ''||TRIM(DSGNOMBR) LIKE '+QuotedStr(trim(meapenommenor.Text)+'%')+' ORDER BY PVSLBENNR DESC';
  DM1.cdsDFam.Close;
  DM1.cdsDFam.DataRequest(xSql);
  DM1.cdsDFam.Open;
end;

procedure TFlibAho.FormKeyPress(Sender: TObject; var Key: Char);
begin
 If Key = #13 Then
    begin
     Key := #0;
     Perform(CM_DIALOGKEY, VK_TAB, 0);
    end;
end;

procedure TFlibAho.btncerrarClick(Sender: TObject);
begin
 FlibAho.Close;
end;

Procedure TFlibAho.FormActivate(Sender: TObject);
Var xSql:String;
Begin
  meapenommenor.SetFocus;
  xSql := 'SELECT NROLIBAH, PVSLBENNR, ASOID, DSGAPEPAT, DSGAPEMAT, DSGNOMBR,'
  +' CCBCOID, DECODE(NVL(FLGENTLIB, ''N''), ''S'', ''SI'', ''NO'') FLGENTLIB'
  +'  FROM PVS308 WHERE ASOID = ''''';
  DM1.cdsDFam.Close;
  DM1.cdsDFam.DataRequest(xSql);
  DM1.cdsDFam.Open;
  dbglibretas.Selected.Clear;
  dbglibretas.Selected.Add('NROLIBAH'#9'7'#9'Nro. Libreta~Ahorros'#9#9);
  dbglibretas.Selected.Add('PVSLBENNR'#9'11'#9'Nro.~Liquidación'#9#9);
  dbglibretas.Selected.Add('ASOID'#9'10'#9'Asociado~Id'#9#9);
  dbglibretas.Selected.Add('DSGAPEPAT'#9'30'#9'Apellido Paterno'#9#9);
  dbglibretas.Selected.Add('DSGAPEMAT'#9'30'#9'Apellido Materno'#9#9);
  dbglibretas.Selected.Add('DSGNOMBR'#9'30'#9'Nombre del Beneficiario'#9#9);
  dbglibretas.Selected.Add('CCBCOID'#9'18'#9'Nro Cuenta'#9#9);
  dbglibretas.Selected.Add('FLGENTLIB'#9'2'#9'Libreta~Entregada'#9#9);
  dbglibretas.ApplySelected;
end;






procedure TFlibAho.dbglibretasDblClick(Sender: TObject);
Var xSql:String;
begin
  xSql := 'SELECT * FROM APO201 WHERE ASOID = '+QuotedStr(DM1.cdsDFam.FieldByName('ASOID').AsString);
  DM1.cdsAsociado.Close;
  DM1.cdsAsociado.DataRequest(xSql);
  DM1.cdsAsociado.Open;
  Try
    FLibAhoMod := TFLibAhoMod.create(Self);
    FLibAhoMod.ShowModal;
  Finally
    FLibAhoMod.Free;
  end;
  dbglibretas.Refresh;
end;

procedure TFlibAho.BitBtn1Click(Sender: TObject);
begin
  FlibAho.Close;
end;

end.
