unit PRE209;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, Buttons,db, StdCtrls, fcLabel;

type
  TFmantabcapdeu = class(TForm)
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
  Fmantabcapdeu: TFmantabcapdeu;

implementation

uses PREDM, PRE210;

{$R *.dfm}



procedure TFmantabcapdeu.dbgmantabretDblClick(Sender: TObject);
begin
  DM1.xSgr := 'M';
  Try
    Fingdattabcapdeu := TFingdattabcapdeu.create(Self);
    Fingdattabcapdeu.ShowModal;
  Finally
    Fingdattabcapdeu.Free;
  End;
  refresca('1');
end;

procedure TFmantabcapdeu.dbgExpBenIButtonClick(Sender: TObject);
begin
  DM1.xSgr := 'I';
end;

procedure TFmantabcapdeu.FormActivate(Sender: TObject);
begin
  If DM1.cdsQry18.Active = True Then DM1.cdsQry18.Close;
  refresca('0');
end;

procedure TFmantabcapdeu.refresca(xforma: String);
Var xanoces, xtieser, xSql:String;
begin
  If DM1.cdsQry18.Active = True Then
  Begin
    xanoces := DM1.cdsQry18.FieldByName('PVSCANO').AsString;
    xtieser := DM1.cdsQry18.FieldByName('PVSCSERV').AsString;
  End;

  xSql := 'SELECT PVSCANO, PVSCSERV, PVSCMM01, PVSCMM02, PVSCMM03, PVSCMM04, PVSCMM05, PVSCMM06,'
  +' PVSCMM07, PVSCMM08, PVSCMM09, PVSCMM10, PVSCMM11, PVSCMM12 FROM PVS107'
  +' ORDER BY PVSCANO, PVSCSERV';

  DM1.cdsQry18.Close;
  DM1.cdsQry18.DataRequest(xSql);
  DM1.cdsQry18.Open;

  If xforma = '1' Then
    DM1.cdsQry18.Locate('PVSCANO;PVSCSERV',VarArrayof([xanoces,xtieser]),[]);

  dbgmantabret.Selected.Clear;
  dbgmantabret.Selected.Add('PVSCANO'#9'5'#9'Año de~Cese'#9#9);
  dbgmantabret.Selected.Add('PVSCSERV'#9'7'#9'Años de~Servicio'#9#9);
  dbgmantabret.Selected.Add('PVSCMM01'#9'8'#9'Monto~Enero'#9#9);
  dbgmantabret.Selected.Add('PVSCMM02'#9'8'#9'Monto~Febrero'#9#9);
  dbgmantabret.Selected.Add('PVSCMM03'#9'8'#9'Monto~Marzo'#9#9);
  dbgmantabret.Selected.Add('PVSCMM04'#9'8'#9'Monto~Abril'#9#9);
  dbgmantabret.Selected.Add('PVSCMM05'#9'8'#9'Monto~Mayo'#9#9);
  dbgmantabret.Selected.Add('PVSCMM06'#9'8'#9'Monto~Junio'#9#9);
  dbgmantabret.Selected.Add('PVSCMM07'#9'8'#9'Monto~Julio'#9#9);
  dbgmantabret.Selected.Add('PVSCMM08'#9'8'#9'Monto~Agosto'#9#9);
  dbgmantabret.Selected.Add('PVSCMM09'#9'8'#9'Monto~Setiembre'#9#9);
  dbgmantabret.Selected.Add('PVSCMM10'#9'8'#9'Monto~Octubre'#9#9);
  dbgmantabret.Selected.Add('PVSCMM11'#9'8'#9'Monto~Noviembre'#9#9);
  dbgmantabret.Selected.Add('PVSCMM12'#9'8'#9'Monto~Diciembre'#9#9);
  dbgmantabret.ApplySelected;
  TNumericField(DM1.cdsQry18.FieldByName('PVSCMM01')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSCMM02')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSCMM03')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSCMM04')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSCMM05')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSCMM06')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSCMM07')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSCMM08')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSCMM09')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSCMM10')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSCMM11')).DisplayFormat := '##,###.#0';
  TNumericField(DM1.cdsQry18.FieldByName('PVSCMM12')).DisplayFormat := '##,###.#0';
End;

procedure TFmantabcapdeu.btncerrarClick(Sender: TObject);
begin
  Fmantabcapdeu.Close;
end;

end.
