unit PRE260;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls;

type
  TFMstLiqAnt = class(TForm)
    gbliqant: TGroupBox;
    dbgliqant: TwwDBGrid;
    lbladvertencia: TLabel;
    btncerrarliqant: TBitBtn;
    Timer2: TTimer;
    procedure FormActivate(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure btncerrarliqantClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMstLiqAnt: TFMstLiqAnt;

implementation

{$R *.dfm}

Procedure TFMstLiqAnt.FormActivate(Sender: TObject);
Begin
  dbgliqant.Selected.Clear;
  dbgliqant.Selected.Add('NUM_EXP'#9'12'#9'Número del~Expediente'#9#9);
  dbgliqant.Selected.Add('FEC_EXP'#9'10'#9'Fecha del~Expediente'#9#9);
  dbgliqant.Selected.Add('COD_MOD'#9'10'#9'Código~modular'#9#9);
  dbgliqant.Selected.Add('NOM_GEN'#9'35'#9'Apellidos y~Nombres'#9#9);
  dbgliqant.Selected.Add('LIB_ELE'#9'10'#9'Libreta~Electoral'#9#9);
  dbgliqant.ApplySelected;
End;

Procedure TFMstLiqAnt.Timer2Timer(Sender: TObject);
Begin
  If lbladvertencia.Visible = True Then lbladvertencia.Visible := False Else lbladvertencia.Visible := True;
End;

Procedure TFMstLiqAnt.btncerrarliqantClick(Sender: TObject);
Begin
  FMstLiqAnt.Close;
End;

end.
