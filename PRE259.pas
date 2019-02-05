// Inicio Uso Estándares: 01/08/2011
// Unidad : Previsión Social
// Formulario : TFmancardes
// Fecha de Creación : 08/08/2011
// Autor : Sistemas
// Objetivo : Mantenimiento de carta de designatario.
// Actualizaciones  :
// HPC_201304_PRE   : Anulación de carta de designatario.
// SPP_201305_PRE   : Se realiza el pase a producción a partir del HPC_201304_PRE
// HPC_201305_PRE   : Se añade boton para llamar a la forma que imprime cartas de designación.
// SPP_201306_PRE   : Se realiza el pase a producción a partir del HPC_201305_PRE
// HPC_201602_PRE : APERTURA DE CARTA DE BENEFICIARIO
// HPC_201609_PRE  : Se modifica la lectura de datos en la tabla de Carta de Designación.
//                   Solo se leee los que tienen con estado "02 = Activos".
// HPC_201709_PRE  : Se actualizan las busquedas por Apellidos y nombres, codigo modular y DNI

unit PRE259;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TFmancardes = class(TForm)
    dbgcardes: TwwDBGrid;
    GroupBox1: TGroupBox;
    rgbusca: TRadioGroup;
    mebusca: TMaskEdit;
    btnBuscar: TBitBtn;
    wwDBGrid1IButton: TwwIButton;
    btncerrar: TBitBtn;
    btnanular: TBitBtn; // SPP_201305_PRE
    btnimprimir: TBitBtn; // SPP_201306_PRE
    procedure btncerrarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure rgbuscaClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure wwDBGrid1IButtonClick(Sender: TObject);
    procedure dbgcardesDblClick(Sender: TObject);
    procedure btnanularClick(Sender: TObject); // SPP_201305_PRE
    procedure btnimprimirClick(Sender: TObject); // SPP_201306_PRE
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fmancardes: TFmancardes;

implementation

uses PREDM, PRE263, PRE264, PRE214, PRE289;  // SPP_201306_PRE Se añade fuente para la impresión de carta de designatario

{$R *.dfm}

procedure TFmancardes.btncerrarClick(Sender: TObject);
begin
  Fmancardes.Close;
end;

procedure TFmancardes.FormActivate(Sender: TObject);
Var xSql:String;
begin
  xSql := 'SELECT A.ASOID, A.DSGNRO, A.ASOCODMOD, A.DSGFREC, A.ASOAPENOMDNI, B.PVSESTDES, A.USUARIO, A.FREG, A.ASODNI, DSGOBS FROM PVS302 A, PVS102 B'
  +' WHERE A.DSGESTAD = B.PVSESTDSG AND B.PVSDOC = ''C'' AND ASOID = ''''';

// xSql := 'SELECT A.ASOID, A.ASOCODMOD, A.DSGFREC, A.ASOAPENOMDNI, B.PVSESTDES, A.USUARIO, A.FREG, A.ASODNI, DSGOBS FROM PVS302 A, PVS102 B'
// +' WHERE A.DSGESTAD = B.PVSESTDSG AND B.PVSDOC = ''C'' AND ASOID = ''''';
  DM1.cdsMaestCartas.Close;
  DM1.cdsMaestCartas.DataRequest(xSql);
  DM1.cdsMaestCartas.Open;
  dbgcardes.Selected.Clear;
// dbgcardes.Selected.Add('DSGNRO'#9'11'#9'Número de~la carta'#9#9);
  dbgcardes.Selected.Add('DSGFREC'#9'10'#9'Fecha de~Recepción'#9#9);
  dbgcardes.Selected.Add('ASOID'#9'10'#9'Identificación~del asociado'#9#9);
  dbgcardes.Selected.Add('ASOCODMOD'#9'10'#9'Código~Modular'#9#9);
  dbgcardes.Selected.Add('ASODNI'#10'8'#9'DNI del~asociado'#9#9);
  dbgcardes.Selected.Add('ASOAPENOMDNI'#9'40'#9'Apellidos y~Nombre(s)'#9#9);
  dbgcardes.Selected.Add('PVSESTDES'#9'10'#9'Estado de la~carta'#9#9);
  dbgcardes.Selected.Add('USUARIO'#9'15'#9'Usuario de~Registro'#9#9);
  dbgcardes.Selected.Add('FREG'#9'15'#9'Fecha de~Registro'#9#9);
  dbgcardes.Selected.Add('DSGOBS'#9'50'#9'Observaciones de la Carta'#9#9);  
  dbgcardes.ApplySelected;
  rgbusca.ItemIndex := 0;
  mebusca.SetFocus;
end;

// Inicio: HPC_201709_PRE
// Se actualizan las busquedas por codigo modular, apellidos y nombres, DNI
procedure TFmancardes.btnBuscarClick(Sender: TObject);
Var xSql:String;
begin
  // Inicio: HPC_201609_PRE 
  // Se añade al script de busqueda la condicion en el cual no debe tomar  tipo de estado = "13" (anulado)
  // Inicio: SPP_201305_PRE
  If rgbusca.ItemIndex = 0 Then
    // xSql := 'SELECT A.DSGESTAD, A.ASOID, A.DSGNRO, A.ASOCODMOD, A.DSGFREC, A.ASOAPENOMDNI, B.PVSESTDES, A.USUARIO, A.FREG, A.ASODNI, A.PVSLBENNR, A.DSGOBS  FROM PVS302 A, PVS102 B'
    // xSql := 'SELECT DSGFAPER, USUAPE, PVSLBENNR, A.DSGESTAD, A.ASOID, A.DSGNRO, A.ASOCODMOD, A.DSGFREC, A.ASOAPENOMDNI, B.PVSESTDES, A.USUARIO, A.FREG, A.ASODNI, A.PVSLBENNR, A.DSGOBS  FROM PVS302 A, PVS102 B'
    // +' WHERE A.DSGESTAD = B.PVSESTDSG AND B.PVSDOC = ''C'''
    // +' AND A.USUANU IS NULL AND A.ASOAPENOMDNI LIKE '+QuotedStr(Trim(mebusca.Text)+'%')
    xSql := 'SELECT DSGFAPER, USUAPE, PVSLBENNR, A.DSGESTAD, A.ASOID, A.DSGNRO, A.ASOCODMOD, A.DSGFREC, A.ASOAPENOMDNI, B.PVSESTDES, A.USUARIO, A.FREG, A.ASODNI, A.PVSLBENNR, A.DSGOBS  FROM PVS302 A, PVS102 B'
    // +' WHERE A.DSGESTAD = B.PVSESTDSG AND B.PVSDOC = ''C'' AND A.DSGESTAD NOT IN ''13'' AND A.ASOAPENOMDNI LIKE '+QuotedStr(Trim(mebusca.Text)+'%')
    +' WHERE A.DSGESTAD = B.PVSESTDSG AND B.PVSDOC = ''C'' AND A.ASOAPENOMDNI LIKE '+QuotedStr(Trim(mebusca.Text)+'%')
  Else If rgbusca.ItemIndex = 1 Then
    // xSql := 'SELECT A.DSGESTAD, A.ASOID, A.DSGNRO, A.ASOCODMOD, A.DSGFREC, A.ASOAPENOMDNI, B.PVSESTDES, A.USUARIO, A.FREG, A.ASODNI, A.PVSLBENNR, A.DSGOBS  FROM PVS302 A, PVS102 B'

    // xSql := 'SELECT DSGFAPER, USUAPE, PVSLBENNR, A.DSGESTAD, A.ASOID, A.DSGNRO, A.ASOCODMOD, A.DSGFREC, A.ASOAPENOMDNI, B.PVSESTDES, A.USUARIO, A.FREG, A.ASODNI, A.PVSLBENNR, A.DSGOBS  FROM PVS302 A, PVS102 B'
    // +' WHERE A.DSGESTAD = B.PVSESTDSG AND B.PVSDOC = ''C'''
    // +' AND A.USUANU IS NULL AND A.ASOCODMOD = '+QuotedStr(Trim(mebusca.Text))
    xSql := 'SELECT DSGFAPER, USUAPE, PVSLBENNR, A.DSGESTAD, A.ASOID, A.DSGNRO, A.ASOCODMOD, A.DSGFREC, A.ASOAPENOMDNI, B.PVSESTDES, A.USUARIO, A.FREG, A.ASODNI, A.PVSLBENNR, A.DSGOBS  FROM PVS302 A, PVS102 B'
    // +' WHERE A.DSGESTAD = B.PVSESTDSG AND B.PVSDOC = ''C'' AND A.DSGESTAD NOT IN ''13'' AND A.ASOCODMOD = '+QuotedStr(Trim(mebusca.Text))
    +' WHERE A.DSGESTAD = B.PVSESTDSG AND B.PVSDOC = ''C'' AND A.ASOCODMOD = '+QuotedStr(Trim(mebusca.Text))
  Else If rgbusca.ItemIndex = 2 Then
    // xSql := 'SELECT A.DSGESTAD, A.ASOID, A.DSGNRO, A.ASOCODMOD, A.DSGFREC, A.ASOAPENOMDNI, B.PVSESTDES, A.USUARIO, A.FREG, A.ASODNI, A.PVSLBENNR, A.DSGOBS  FROM PVS302 A, PVS102 B'
    // xSql := 'SELECT DSGFAPER, USUAPE, PVSLBENNR, A.DSGESTAD, A.ASOID, A.DSGNRO, A.ASOCODMOD, A.DSGFREC, A.ASOAPENOMDNI, B.PVSESTDES, A.USUARIO, A.FREG, A.ASODNI, A.PVSLBENNR, A.DSGOBS  FROM PVS302 A, PVS102 B'
    // +' WHERE A.USUANU IS NULL AND A.DSGESTAD = B.PVSESTDSG AND B.PVSDOC = ''C'''
    xSql := 'SELECT DSGFAPER, USUAPE, PVSLBENNR, A.DSGESTAD, A.ASOID, A.DSGNRO, A.ASOCODMOD, A.DSGFREC, A.ASOAPENOMDNI, B.PVSESTDES, A.USUARIO, A.FREG, A.ASODNI, A.PVSLBENNR, A.DSGOBS  FROM PVS302 A, PVS102 B'
    // +' WHERE A.DSGESTAD NOT IN ''13''  AND A.DSGESTAD = B.PVSESTDSG AND B.PVSDOC = ''C'' AND A.ASODNI = '+QuotedStr(Trim(mebusca.Text));
    +' WHERE A.DSGESTAD = B.PVSESTDSG AND B.PVSDOC = ''C'' AND A.ASODNI = '+QuotedStr(Trim(mebusca.Text));
  // Fin: HPC_201609_PRE
  DM1.cdsMaestCartas.Close;
  DM1.cdsMaestCartas.DataRequest(xSql);
  DM1.cdsMaestCartas.Open;
  // Fin: SPP_201305_PRE
end;
// Fin: HPC_201709_PRE

procedure TFmancardes.rgbuscaClick(Sender: TObject);
begin
  If rgbusca.ItemIndex = 0 Then
  Begin
    mebusca.Width := 300;
    mebusca.MaxLength := 40;
  End
  Else If rgbusca.ItemIndex = 1 Then
  Begin
   mebusca.Width := 100;
   mebusca.MaxLength := 10;
  End
  Else If rgbusca.ItemIndex = 2 Then
  Begin
   mebusca.Width := 80;
   mebusca.MaxLength := 8;
  End;
  mebusca.SetFocus;
  mebusca.Text := '';
end;

procedure TFmancardes.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key = #13 Then
    begin
     Key := #0;
     Perform(CM_DIALOGKEY, VK_TAB, 0);
    end;
end;

procedure TFmancardes.wwDBGrid1IButtonClick(Sender: TObject);
begin
  DM1.xSgr := 'N';
  Try
    Fnuecardes := TFnuecardes.create(Self);
    Fnuecardes.ShowModal;
  Finally
    Fnuecardes.Free;
  end;
end;

procedure TFmancardes.dbgcardesDblClick(Sender: TObject);
Var xSql:String;
begin
  xSql := 'SELECT * FROM APO201 WHERE ASOID = '+QuotedStr(DM1.cdsMaestCartas.FieldByName('ASOID').AsString);
  DM1.cdsAsociado.Close;
  DM1.cdsAsociado.DataRequest(xSql);
  DM1.cdsAsociado.Open;

  If DM1.cdsMaestCartas.RecordCount = 0 Then
  Begin
    MessageDlg('No se ha seleccionado ningun asociado', mtInformation, [mbOk], 0);
    Exit;
  End;
  // INICIO HPC_201602_PRE
  // CAMBIAR CONDICIONAL DE FILTRO
  // If DM1.cdsAsociado.FieldByName('ASOTIPID').AsString <> 'CE' Then
  If DM1.FG_PORLIQUIDAR(DM1.cdsMaestCartas.FieldByName('ASOID').AsString) = 'N' Then
  // FIN HPC_201602_PRE
  Begin
    MessageDlg('Tiene que ser un asociado cesante para que pueda abrir carta de designatarios', mtInformation, [mbOk], 0);
    Exit;
  End;
  DM1.xFlg := 'N';
  Try
    Fapecardes := TFapecardes.create(Self);
    Fapecardes.ShowModal;
  Finally
    Fapecardes.Free;
  end;
  If DM1.xFlg = 'S' Then
  Begin
    xSql := 'SELECT A.DSGESTAD, A.ASOID, A.DSGNRO, A.ASOCODMOD, A.DSGFREC, A.ASOAPENOMDNI, B.PVSESTDES, A.USUARIO, A.FREG, A.ASODNI, A.PVSLBENNR, A.DSGOBS  FROM PVS302 A, PVS102 B'
    +' WHERE A.DSGESTAD = B.PVSESTDSG AND B.PVSDOC = ''C'''
    +' AND A.ASOID = '+QuotedStr(DM1.cdsMaestCartas.FieldByName('ASOID').AsString);
    DM1.cdsMaestCartas.Close;
    DM1.cdsMaestCartas.DataRequest(xSql);
    DM1.cdsMaestCartas.Open;
    dbgcardes.Refresh;
  End;
End;

// Inicio: SPP_201305_PRE
procedure TFmancardes.btnanularClick(Sender: TObject);
begin
   Try
      Fanucardesignatario := TFanucardesignatario.create(Self);
      Fanucardesignatario.ShowModal;
   Finally
      Fanucardesignatario.Free;
   End;
end;
// Fin: SPP_201305_PRE

// Inicio: SPP_201306_PRE
procedure TFmancardes.btnimprimirClick(Sender: TObject);
begin
   Try
      Frepcardes := TFrepcardes.create(Self);
      Frepcardes.ShowModal;
   Finally
      Frepcardes.Free;
   End;
end;
// Fin: SPP_201306_PRE

end.
