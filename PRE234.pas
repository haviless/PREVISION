unit PRE234;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, Mask;

type
  TFBusAso = class(TForm)
    dbgAsociado: TwwDBGrid;
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    rgbusca: TRadioGroup;
    mebuscar: TMaskEdit;
    btnbuscar: TBitBtn;
    procedure btnbuscarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure rgbuscaClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dbgAsociadoDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBusAso: TFBusAso;

implementation

uses PREDM, PRE233;

{$R *.dfm}

Procedure TFBusAso.btnbuscarClick(Sender: TObject);
Var xSql:String;
Begin
  If rgbusca.ItemIndex = 0 Then
  Begin
    mebuscar.Text := Trim(mebuscar.Text);
    xSql := 'SELECT A.*, B.USENOM, C.ASOTIPDES FROM APO201 A, APO101 B, APO107 C WHERE ASOAPENOMDNI LIKE '+QuotedStr(mebuscar.Text+'%')
    +' AND A.USEID = B.USEID(+) AND A.UPAGOID = B.UPAGOID(+) AND A.UPROID = B.UPROID(+)'
    +' AND A.ASOTIPID = C.ASOTIPID';
  End
  Else If rgbusca.ItemIndex = 1 Then
  Begin
    mebuscar.Text := DM1.StrZero(Trim(mebuscar.Text),10);
    xSql := 'SELECT A.*, B.USENOM, C.ASOTIPDES FROM APO201 A, APO101 B, APO107 C WHERE ASOCODMOD = '+QuotedStr(mebuscar.Text)
    +' AND A.USEID = B.USEID(+) AND A.UPAGOID = B.UPAGOID(+) AND A.UPROID = B.UPROID(+)'
    +' AND A.ASOTIPID = C.ASOTIPID';
  End
  Else If rgbusca.ItemIndex = 2 Then
  Begin
    mebuscar.Text := DM1.StrZero(Trim(mebuscar.Text),8);
    xSql := 'SELECT A.*, B.USENOM, C.ASOTIPDES FROM APO201 A, APO101 B, APO107 C WHERE ASODNI = '+QuotedStr(mebuscar.Text)
    +' AND A.USEID = B.USEID(+) AND A.UPAGOID = B.UPAGOID(+) AND A.UPROID = B.UPROID(+)'
    +' AND A.ASOTIPID = C.ASOTIPID';
  End;
  DM1.cdsAsociado.Close;
  DM1.cdsAsociado.DataRequest(xSql);
  DM1.cdsAsociado.Open;
End;

procedure TFBusAso.FormKeyPress(Sender: TObject; var Key: Char);
begin
 If Key = #13 Then
    begin
     Key := #0;
     Perform(CM_DIALOGKEY, VK_TAB, 0);
    end;
end;

procedure TFBusAso.FormActivate(Sender: TObject);
Var xSql:String;
begin
  If DM1.cdsAsociado.Active Then DM1.cdsAsociado.EmptyDataSet;
  If DM1.xFlg = 'S' Then
  Begin
    xSql := 'SELECT A.*, B.USENOM, C.ASOTIPDES FROM APO201 A, APO101 B, APO107 C WHERE ASOID = '''' '
    +' AND A.USEID = B.USEID(+) AND A.UPAGOID = B.UPAGOID(+) AND A.UPROID = B.UPROID(+)'
    +' AND A.ASOTIPID = C.ASOTIPID';
    DM1.cdsAsociado.Close;
    DM1.cdsAsociado.DataRequest(xSql);
    DM1.cdsAsociado.Open;
  End;
  dbgAsociado.Selected.Clear;
  dbgAsociado.Selected.Add('ASOID'#9'10'#9'Identificación del~Asociado'#9#9);
  dbgAsociado.Selected.Add('ASOCODMOD'#9'10'#9'Código~modular'#9#9);
  dbgAsociado.Selected.Add('ASODNI'#9'10'#9'Número de~Documento'#9#9);
  dbgAsociado.Selected.Add('ASOAPENOMDNI'#9'40'#9'Apellido(s) y~Nombre(s)'#9#9);
  dbgAsociado.Selected.Add('USENOM'#9'20'#9'Descripción de la~Unidad de Gestión'#9#9);
  dbgAsociado.Selected.Add('ASOTIPDES'#9'10'#9'Tipo de~Asociado'#9#9);
  dbgAsociado.ApplySelected;
  mebuscar.SetFocus;
  mebuscar.MaxLength := 40;
  mebuscar.Width := 400;
  rgbusca.ItemIndex := 0;
end;

Procedure TFBusAso.rgbuscaClick(Sender: TObject);
Begin
  If rgbusca.ItemIndex = 0 Then
  Begin
    mebuscar.Width := 390;
    mebuscar.MaxLength := 40;
    btnbuscar.Left := 590;
  End
  Else If rgbusca.ItemIndex = 1 Then
  Begin
    mebuscar.Width := 100;
    mebuscar.MaxLength := 10;
    btnbuscar.Left := 300;
  End
  Else If rgbusca.ItemIndex = 2 Then
  Begin
    mebuscar.Width := 80;
    mebuscar.MaxLength := 10;
    btnbuscar.Left := 280;
  End;
  mebuscar.Text := '';
  mebuscar.SetFocus;
End;

procedure TFBusAso.BitBtn1Click(Sender: TObject);
begin
FBusAso.Close;
end;

Procedure TFBusAso.dbgAsociadoDblClick(Sender: TObject);
Begin
  FBusAso.Close;
End;

end.
