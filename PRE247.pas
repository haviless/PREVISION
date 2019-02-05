// HPC_201305_PRE   : Se añade boton "Imprimir"  que llama a la forma de impresiones de retenciones judiciales
// SPP_201306_PRE   : Se realiza el pase a producción a partir del HPC_201305_PRE

unit PRE247;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TFretencionjudicial = class(TForm)
    dbgretjud: TwwDBGrid;
    dbgretjudIButton: TwwIButton;
    btncerrar: TBitBtn;
    gbbuscar: TGroupBox;
    rgbusca: TRadioGroup;
    mebusca: TMaskEdit;
    btnBuscar: TBitBtn;
    btnimprimir: TBitBtn;  // SPP_201306_PRE bitbtn para llamar a la forma de impresión
    procedure FormActivate(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure dbgretjudIButtonClick(Sender: TObject);
    procedure dbgretjudDblClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure rgbuscaClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnimprimirClick(Sender: TObject);  // SPP_201306_PRE procedimiento que llama a la forma para la impresión de retenciones judiciales
  private
    { Private declarations }
  public
    xsqlPublic:String;
    { Public declarations }
  end;

var
  Fretencionjudicial: TFretencionjudicial;

implementation

uses PREDM, PRE248, PRE285; // SPP_201306_PRE

{$R *.dfm}

Procedure TFretencionjudicial.FormActivate(Sender: TObject);
Begin
// Inicio: DPP_201204_PRE
//  DM1.xsqlPublic := 'SELECT A.*, B.ASOAPENOMDNI FROM PVS305 A, APO201 B WHERE A.ASOID = B.ASOID';
  DM1.xsqlPublic := 'SELECT A.*, B.ASOAPENOMDNI FROM PVS305 A, APO201 B WHERE A.ASOID = B.ASOID order by RTJFREC';
// Fin: DPP_201204_PRE
  DM1.cdsMaestRetJud.Close;
  DM1.cdsMaestRetJud.DataRequest(DM1.xsqlPublic);
  DM1.cdsMaestRetJud.Open;
  dbgretjud.Selected.Clear;
  dbgretjud.Selected.Add('ASOID'#9'10'#9'Código de~Identificación'#9#9);
  dbgretjud.Selected.Add('ASOAPENOMDNI'#9'31'#9'Apellidos y nombre(s) del asociado'#9#9);
  dbgretjud.Selected.Add('APENOMBEN'#9'31'#9'Apellido y nombre(s) del demandante'#9#9);
  dbgretjud.Selected.Add('RTJNOFIC'#9'15'#9'Número~de oficio'#9#9);
  dbgretjud.Selected.Add('RTJFREC'#9'10'#9'Fecha~de recepción'#9#9);
  dbgretjud.Selected.Add('RTJOBS'#9'31'#9'Observación de la retención'#9#9);
  dbgretjud.Selected.Add('RTJJUZG'#9'20'#9'Nombre del juzgado'#9#9);
  dbgretjud.ApplySelected;
End;

procedure TFretencionjudicial.btncerrarClick(Sender: TObject);
begin
  Fretencionjudicial.Close;
end;

procedure TFretencionjudicial.dbgretjudIButtonClick(Sender: TObject);
begin
  DM1.xCnd := 'I';
  Try
    Fnueretjud := TFnueretjud.create(Self);
    Fnueretjud.ShowModal;
  Finally
    Fnueretjud.Free;
  End;
  dbgretjud.Refresh;
end;

procedure TFretencionjudicial.dbgretjudDblClick(Sender: TObject);
begin
  DM1.xCnd := 'M';
  Try
    Fnueretjud := TFnueretjud.create(Self);
    Fnueretjud.ShowModal;
  Finally
    Fnueretjud.Free;
  End;
  dbgretjud.Refresh;
end;

procedure TFretencionjudicial.btnBuscarClick(Sender: TObject);
Var xwhere:String;
begin
  If rgbusca.ItemIndex = 0 Then
    xWhere := 'B.ASOAPENOMDNI LIKE '+QuotedStr(Trim(mebusca.Text)+'%')
  Else
   xWhere := 'B.ASOAPENOMDNI LIKE '+QuotedStr(Trim(mebusca.Text)+'%');
  DM1.xsqlPublic  := 'SELECT A.*, B.ASOAPENOMDNI, B.ASODNI FROM PVS305 A, APO201 B WHERE A.ASOID = B.ASOID'
  +' AND '+xwhere;

// Inicio: DPP_201204_PRE
  DM1.xsqlPublic := DM1.xsqlPublic+' order by RTJFREC';
// Fin: DPP_201204_PRE

  DM1.cdsMaestRetJud.Close;
  DM1.cdsMaestRetJud.DataRequest(DM1.xsqlPublic);
  DM1.cdsMaestRetJud.Open;
  dbgretjud.Refresh;
end;

procedure TFretencionjudicial.rgbuscaClick(Sender: TObject);
begin
  If rgbusca.ItemIndex = 0 Then
  Begin
    mebusca.Width := 300;
    btnBuscar.Left := 464;
    gbbuscar.Width := 550;
    mebusca.Text := '';
  End
  Else
  Begin
     mebusca.Width := 80;
     btnBuscar.Left := 248;
     gbbuscar.Width := 334;
     mebusca.Text := '';
  End;
End;
procedure TFretencionjudicial.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  begin
    Key := #0;
    Perform(CM_DIALOGKEY, VK_TAB, 0);
  end;
end;

// Inicio: SPP_201306_PRE
procedure TFretencionjudicial.btnimprimirClick(Sender: TObject);
begin
   Try
      Fimpretjud := TFimpretjud.create(Self);
      Fimpretjud.ShowModal;
   Finally
      Fimpretjud.Free;
   End;
end;
// Fin: SPP_201306_PRE

end.
