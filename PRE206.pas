unit PRE206;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, Buttons,db, StdCtrls, fcLabel;

type
  TFmantabinv = class(TForm)
    dbgmantabret: TwwDBGrid;
    dbgExpBenIButton: TwwIButton;
    btncerrar: TBitBtn;
    fcLabel1: TfcLabel;
    procedure dbgmantabretDblClick(Sender: TObject);
    procedure dbgExpBenIButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
  private
    procedure refresca(xforma:String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fmantabinv: TFmantabinv;

implementation

uses PREDM, PRE207;

{$R *.dfm}



procedure TFmantabinv.dbgmantabretDblClick(Sender: TObject);
begin
  DM1.xSgr := 'M';
  Try
    Fingdattabinv := TFingdattabinv.create(Self);
    Fingdattabinv.ShowModal;
  Finally
    Fingdattabinv.Free;
  End;
  refresca('1');
end;

procedure TFmantabinv.dbgExpBenIButtonClick(Sender: TObject);
begin
  DM1.xSgr := 'I';
end;

procedure TFmantabinv.FormActivate(Sender: TObject);
begin
  If DM1.cdsQry18.Active = True Then DM1.cdsQry18.Close;
  refresca('0');
end;

procedure TFmantabinv.refresca(xforma: String);
Var xanoces, xtieser, xSql:String;
begin
  If DM1.cdsQry18.Active = True Then
  Begin
    xanoces := DM1.cdsQry18.FieldByName('PVSIANO').AsString;
    xtieser := DM1.cdsQry18.FieldByName('PVSISERV').AsString;
  End;

  xSql := 'SELECT PVSIANO, PVSISERV, PVSIMM01, PVSIMM02, PVSIMM03, PVSIMM04, PVSIMM05, PVSIMM06,'
  +' PVSIMM07, PVSIMM08, PVSIMM09, PVSIMM10, PVSIMM11, PVSIMM12 FROM PVS105'
  +' ORDER BY PVSIANO, PVSISERV';
  DM1.cdsQry18.Close;
  DM1.cdsQry18.DataRequest(xSql);
  DM1.cdsQry18.Open;

  If xforma = '1' Then
    DM1.cdsQry18.Locate('PVSIANO;PVSISERV',VarArrayof([xanoces,xtieser]),[]);

  dbgmantabret.Selected.Clear;
  dbgmantabret.Selected.Add('PVSIANO'#9'5'#9'Año de~Cese'#9#9);
  dbgmantabret.Selected.Add('PVSISERV'#9'7'#9'Edad'#9#9);
  dbgmantabret.Selected.Add('PVSIMM01'#9'8'#9'Monto~Enero'#9#9);
  dbgmantabret.Selected.Add('PVSIMM02'#9'8'#9'Monto~Febrero'#9#9);
  dbgmantabret.Selected.Add('PVSIMM03'#9'8'#9'Monto~Marzo'#9#9);
  dbgmantabret.Selected.Add('PVSIMM04'#9'8'#9'Monto~Abril'#9#9);
  dbgmantabret.Selected.Add('PVSIMM05'#9'8'#9'Monto~Mayo'#9#9);
  dbgmantabret.Selected.Add('PVSIMM06'#9'8'#9'Monto~Junio'#9#9);
  dbgmantabret.Selected.Add('PVSIMM07'#9'8'#9'Monto~Julio'#9#9);
  dbgmantabret.Selected.Add('PVSIMM08'#9'8'#9'Monto~Agosto'#9#9);
  dbgmantabret.Selected.Add('PVSIMM09'#9'8'#9'Monto~Setiembre'#9#9);
  dbgmantabret.Selected.Add('PVSIMM10'#9'8'#9'Monto~Octubre'#9#9);
  dbgmantabret.Selected.Add('PVSIMM11'#9'8'#9'Monto~Noviembre'#9#9);
  dbgmantabret.Selected.Add('PVSIMM12'#9'8'#9'Monto~Diciembre'#9#9);
  dbgmantabret.ApplySelected;
  TNumericField(DM1.cdsQry18.FieldByName('PVSIMM01')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSIMM02')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSIMM03')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSIMM04')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSIMM05')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSIMM06')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSIMM07')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSIMM08')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSIMM09')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSIMM10')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSIMM11')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSIMM12')).DisplayFormat := '##,###.#0';
End;

procedure TFmantabinv.btncerrarClick(Sender: TObject);
begin
  Fmantabinv.Close;
end;

end.
