unit PRE203;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, Buttons,db, StdCtrls, fcLabel;

type
  TFmantabret = class(TForm)
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
  Fmantabret: TFmantabret;

implementation

uses PREDM, PRE205;

{$R *.dfm}



procedure TFmantabret.dbgmantabretDblClick(Sender: TObject);
begin
  DM1.xSgr := 'M';
  Try
    Fingdattabret := TFingdattabret.create(Self);
    Fingdattabret.ShowModal;
  Finally
    Fingdattabret.Free;
  End;
  refresca('1');
end;

procedure TFmantabret.dbgExpBenIButtonClick(Sender: TObject);
begin
  DM1.xSgr := 'I';
end;

procedure TFmantabret.FormActivate(Sender: TObject);
begin
  If DM1.cdsQry18.Active = True Then DM1.cdsQry18.Close;
  refresca('0');
end;

procedure TFmantabret.refresca(xforma: String);
Var xanoces, xtieser, xSql:String;
begin
  If DM1.cdsQry18.Active = True Then
  Begin
    xanoces := DM1.cdsQry18.FieldByName('PVSRANO').AsString;
    xtieser := DM1.cdsQry18.FieldByName('PVSRSERV').AsString;
  End;

  xSql:= 'SELECT PVSRANO, PVSRSERV, PVSRMM01, PVSRMM02, PVSRMM03, PVSRMM04, PVSRMM05, PVSRMM06,'
  +' PVSRMM07, PVSRMM08, PVSRMM09, PVSRMM10, PVSRMM11, PVSRMM12 FROM PVS104'
  +' ORDER BY PVSRANO, PVSRSERV';

  DM1.cdsQry18.Close;
  DM1.cdsQry18.DataRequest(xSql);
  DM1.cdsQry18.Open;

  If xforma = '1' Then
    DM1.cdsQry18.Locate('PVSRANO;PVSRSERV',VarArrayof([xanoces,xtieser]),[]);

  dbgmantabret.Selected.Clear;
  dbgmantabret.Selected.Add('PVSRANO'#9'5'#9'Año de~Cese'#9#9);
  dbgmantabret.Selected.Add('PVSRSERV'#9'7'#9'Años de~Servicio'#9#9);
  dbgmantabret.Selected.Add('PVSRMM01'#9'8'#9'Monto~Enero'#9#9);
  dbgmantabret.Selected.Add('PVSRMM02'#9'8'#9'Monto~Febrero'#9#9);
  dbgmantabret.Selected.Add('PVSRMM03'#9'8'#9'Monto~Marzo'#9#9);
  dbgmantabret.Selected.Add('PVSRMM04'#9'8'#9'Monto~Abril'#9#9);
  dbgmantabret.Selected.Add('PVSRMM05'#9'8'#9'Monto~Mayo'#9#9);
  dbgmantabret.Selected.Add('PVSRMM06'#9'8'#9'Monto~Junio'#9#9);
  dbgmantabret.Selected.Add('PVSRMM07'#9'8'#9'Monto~Julio'#9#9);
  dbgmantabret.Selected.Add('PVSRMM08'#9'8'#9'Monto~Agosto'#9#9);
  dbgmantabret.Selected.Add('PVSRMM09'#9'8'#9'Monto~Setiembre'#9#9);
  dbgmantabret.Selected.Add('PVSRMM10'#9'8'#9'Monto~Octubre'#9#9);
  dbgmantabret.Selected.Add('PVSRMM11'#9'8'#9'Monto~Noviembre'#9#9);
  dbgmantabret.Selected.Add('PVSRMM12'#9'8'#9'Monto~Diciembre'#9#9);
  dbgmantabret.ApplySelected;
  TNumericField(DM1.cdsQry18.FieldByName('PVSRMM01')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSRMM02')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSRMM03')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSRMM04')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSRMM05')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSRMM06')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSRMM07')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSRMM08')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSRMM09')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSRMM10')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSRMM11')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSRMM12')).DisplayFormat := '##,###.#0';
End;

procedure TFmantabret.btncerrarClick(Sender: TObject);
begin
  Fmantabret.Close;
end;

end.
