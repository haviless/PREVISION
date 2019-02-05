unit PRE280;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, Buttons, DB, StdCtrls;

type
  TFprimanuit = class(TForm)
    dbgmanuit: TwwDBGrid;
    wwDBGrid1IButton: TwwIButton;
    BitBtn1: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure wwDBGrid1IButtonClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fprimanuit: TFprimanuit;

implementation

uses PREDM, PRE281;

{$R *.dfm}

Procedure TFprimanuit.FormActivate(Sender: TObject);
Var xSql:String;
Begin
  xSql := 'SELECT UITANO, UITFCINI, UITFCFIN, UITNUMER, UITMONTO , DECODE(UITTIPBE, ''F'', ''FALLECIMIENTO'',  DECODE(UITTIPBE, ''I'', ''INVALIDEZ'', '''')) UITTIPBE'
  +' FROM TGE188 ORDER BY UITANO';
  DM1.cdsQry10.Close;
  DM1.cdsQry10.DataRequest(xSql);
  DM1.cdsQry10.Open;
  dbgmanuit.Selected.Clear;
  dbgmanuit.Selected.Add('UITANO'#9'4'#9'Año del~UIT'#9#9);
  dbgmanuit.Selected.Add('UITFCINI'#9'12'#9'Fecha~Inicial'#9#9);
  dbgmanuit.Selected.Add('UITFCFIN'#9'12'#9'Fecha~Final'#9#9);
  dbgmanuit.Selected.Add('UITTIPBE'#9'15'#9'Tipo de~Beneficio'#9#9);
  dbgmanuit.Selected.Add('UITNUMER'#9'1'#9'Veces'#9#9);
  dbgmanuit.Selected.Add('UITMONTO'#9'10'#9'Monto~del UIT'#9#9);
  dbgmanuit.ApplySelected;
  TNumericField(DM1.cdsQry10.FieldByName('UITMONTO')).DisplayFormat := '###,###,##0.00';
End;

Procedure TFprimanuit.wwDBGrid1IButtonClick(Sender: TObject);
Begin
  Try
    FManUIT := TFManUIT.create(Self);
    FManUIT.ShowModal;
  Finally
    FManUIT.Free;
  End;
End;

procedure TFprimanuit.BitBtn1Click(Sender: TObject);
begin
  Fprimanuit.Close;
end;

end.
