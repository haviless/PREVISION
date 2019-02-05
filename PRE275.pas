unit PRE275;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, DB, DBClient;

type
  TFMstObsOtrAre = class(TForm)
    wwDBGrid1: TwwDBGrid;
    btncerrar: TBitBtn;
    procedure btncerrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMstObsOtrAre: TFMstObsOtrAre;

implementation

uses PREDM;

{$R *.dfm}

procedure TFMstObsOtrAre.btncerrarClick(Sender: TObject);
begin
  FMstObsOtrAre.Close;
end;



end.
