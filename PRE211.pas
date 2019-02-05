unit PRE211;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, Buttons,db, StdCtrls, fcLabel;

type
  TFmantabsep = class(TForm)
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
  Fmantabsep: TFmantabsep;

implementation

uses PREDM, PRE212;

{$R *.dfm}



procedure TFmantabsep.dbgmantabretDblClick(Sender: TObject);
begin
  DM1.xSgr := 'M';
  Try
    Fingdattabsep := TFingdattabsep.create(Self);
    Fingdattabsep.ShowModal;
  Finally
    Fingdattabsep.Free;
  End;
  refresca('1');
end;

procedure TFmantabsep.dbgExpBenIButtonClick(Sender: TObject);
begin
  DM1.xSgr := 'I';
end;

procedure TFmantabsep.FormActivate(Sender: TObject);
begin
  If DM1.cdsQry18.Active = True Then DM1.cdsQry18.Close;
  refresca('0');
end;

procedure TFmantabsep.refresca(xforma: String);
Var xanoces, xtieser, xSql:String;
begin
  If DM1.cdsQry18.Active = True Then
  Begin
    xanoces := DM1.cdsQry18.FieldByName('PVSSANO').AsString;
    xtieser := DM1.cdsQry18.FieldByName('PVSSSERV').AsString;
  End;

  xSql := 'SELECT PVSSANO, PVSSSERV, PVSSMM01, PVSSMM02, PVSSMM03, PVSSMM04, PVSSMM05, PVSSMM06,'
  +' PVSSMM07, PVSSMM08, PVSSMM09, PVSSMM10, PVSSMM11, PVSSMM12 FROM PVS106'
  +' ORDER BY PVSSANO, PVSSSERV';

  DM1.cdsQry18.Close;
  DM1.cdsQry18.DataRequest(xSql);
  DM1.cdsQry18.Open;

  If xforma = '1' Then
    DM1.cdsQry18.Locate('PVSSANO;PVSSSERV',VarArrayof([xanoces,xtieser]),[]);

  dbgmantabret.Selected.Clear;
  dbgmantabret.Selected.Add('PVSSANO'#9'5'#9'Año de~Cese'#9#9);
  dbgmantabret.Selected.Add('PVSSSERV'#9'7'#9'Años de~Servicio'#9#9);
  dbgmantabret.Selected.Add('PVSSMM01'#9'8'#9'Monto~Enero'#9#9);
  dbgmantabret.Selected.Add('PVSSMM02'#9'8'#9'Monto~Febrero'#9#9);
  dbgmantabret.Selected.Add('PVSSMM03'#9'8'#9'Monto~Marzo'#9#9);
  dbgmantabret.Selected.Add('PVSSMM04'#9'8'#9'Monto~Abril'#9#9);
  dbgmantabret.Selected.Add('PVSSMM05'#9'8'#9'Monto~Mayo'#9#9);
  dbgmantabret.Selected.Add('PVSSMM06'#9'8'#9'Monto~Junio'#9#9);
  dbgmantabret.Selected.Add('PVSSMM07'#9'8'#9'Monto~Julio'#9#9);
  dbgmantabret.Selected.Add('PVSSMM08'#9'8'#9'Monto~Agosto'#9#9);
  dbgmantabret.Selected.Add('PVSSMM09'#9'8'#9'Monto~Setiembre'#9#9);
  dbgmantabret.Selected.Add('PVSSMM10'#9'8'#9'Monto~Octubre'#9#9);
  dbgmantabret.Selected.Add('PVSSMM11'#9'8'#9'Monto~Noviembre'#9#9);
  dbgmantabret.Selected.Add('PVSSMM12'#9'8'#9'Monto~Diciembre'#9#9);
  dbgmantabret.ApplySelected;
  TNumericField(DM1.cdsQry18.FieldByName('PVSSMM01')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSSMM02')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSSMM03')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSSMM04')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSSMM05')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSSMM06')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSSMM07')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSSMM08')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSSMM09')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSSMM10')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSSMM11')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSSMM12')).DisplayFormat := '##,###.#0';
End;

procedure TFmantabsep.btncerrarClick(Sender: TObject);
begin
  Fmantabsep.Close;
end;

end.
