// Actualizaciones
// SAR-2009-0984  : SE AÑADE EL CAMPO AUTDESAPO
// HPC_201211_PRE : Se Controla que la fecha de autorización de descuento de aportes sea menor que la fecha de cese.
//                      * Para los casos de Fallecimiento e Invalidez. Si la fecha de autorización de descuento de aportes es mayor a la fecha de cese
//                      * solo se pagara cuenta invididual (Tambien tomar en cuenta que para estos casos ya no se cobrara nivelación de Aportes
// DPP_201209_PRE : Se realiza el pase a produccion a partir del HPC_201211_PRE
// HPC_201305_PRE : Se añade campo FORSOLBEN en el Client cdsExpLiq.
// SPP_201306_PRE : Se realiza el pase a producción a partir del HPC_201305_PRE
// HPC_201306_PRE : Se modifica el client cdsExpLiq. Se añade campo que maneja el tipo de liquidación de retiro (PVSTIPRET)
// SPP_201307_PRE : Se realiza el pase a producción a partir del HPC_201306_PRE.
// HPC_201607_PRE  : Se añaden los campos departamento de origen del expediente, oficina de origen del expediente (DEPORIEXP, OFIORIEXP)

unit PRE228;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fcButton, fcImgBtn, fcShapeBtn, StdCtrls, Grids, Wwdbigrd,
  Wwdbgrid, Mask, Buttons, ExtCtrls;

type
  TFBuscaExpediente = class(TForm)
    dbgexpsolicitud: TwwDBGrid;
    GroupBox1: TGroupBox;
    rgbusca: TRadioGroup;
    mebusca: TMaskEdit;
    btnBuscar: TBitBtn;
    btncerrar: TBitBtn;
    procedure dbgexpsolicitudDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure rgbuscaClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBuscaExpediente: TFBuscaExpediente;

implementation

uses PREDM, PRE229;

{$R *.dfm}

procedure TFBuscaExpediente.dbgexpsolicitudDblClick(Sender: TObject);
Var xSql :String;
begin
  DM1.actualizapvs301(DM1.cdsExpLiq.FieldByName('ASOID').AsString, DM1.cdsExpLiq.FieldByName('PVSEXPNRO').AsString);
  xSql := 'SELECT  A.PVSESTADO, A.ASOID, A.PVSEXPNRO, A.ASORESNOM, A.ASOFRESNOM, A.ASORESCESE, A.ASOFRESCESE, A.PVSCOBASO, A.PVSTIPBEN, A.PVSULTAPO,'
  +' A.FORPAGOID, A.BANCOID, A.AGENBCOID, A.ASONCTA, A.REPRID, A.FREG,'
  +' B.ASOAPENOMDNI, B.ASOCODMOD, B.USEID, B.UPAGOID, B.UPROID, B.ASODIR, B.ZIPID, B.ASODNI, '
  // Inicio: DPP_201209_PRE
  //+' F.TIPDOCDES, D.BENEFDES, C.PVSESTDES, DECODE(E.REPRAPENOM, NULL, ''SEDE CENTRAL'', E.REPRAPENOM) REPRAPENOM, B.AUTDESAPO'
  // Inicio: SPP_201306_PRE
  // Inicio: SPP_201307_PRE
  // +' F.TIPDOCDES, D.BENEFDES, C.PVSESTDES, DECODE(E.REPRAPENOM, NULL, ''SEDE CENTRAL'', E.REPRAPENOM) REPRAPENOM, B.AUTDESAPO, B.FECAUTDESAPO, A.FORSOLBEN'
  // Inicio: HPC_201607_PRE --Se añaden los campos departamento de origen del expediente, oficina de origen del expediente 
  +' F.TIPDOCDES, D.BENEFDES, C.PVSESTDES, DECODE(E.REPRAPENOM, NULL, ''SEDE CENTRAL'', E.REPRAPENOM) REPRAPENOM, B.AUTDESAPO, B.FECAUTDESAPO, A.FORSOLBEN, A.PVSTIPRET, A.DEPORIEXP, A.OFIORIEXP, A.FECRECEXP'
  // +' F.TIPDOCDES, D.BENEFDES, C.PVSESTDES, DECODE(E.REPRAPENOM, NULL, ''SEDE CENTRAL'', E.REPRAPENOM) REPRAPENOM, B.AUTDESAPO, B.FECAUTDESAPO, A.FORSOLBEN, A.PVSTIPRET'
  // Fin: HPC_201607_PRE
  // Fin: SPP_201307_PRE
  // Fin: SPP_201306_PRE
  // Fin: DPP_201209_PRE
  +' FROM PVS301 A, APO201 B,  PVS102 C, TGE186 D, COB201 E, TGE159 F'
  +' WHERE A.ASOID = '+QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString)
  +' AND A.PVSESTADO IN (''01'', ''05'') AND A.ASOID = B.ASOID AND A.ASOID = B.ASOID'
  +' And A.PVSESTADO = C.PVSESTDSG AND C.PVSDOC = ''E'' AND A.PVSTIPBEN = D.TIPBENEF'
  +' AND A.TIPDOCCOD = F.TIPDOCCOD(+) AND A.REPRID = E.REPRID(+) ORDER BY PVSEXPNRO';
  DM1.cdsExpLiq.Close;
  DM1.cdsExpLiq.DataRequest(xSql);
  DM1.cdsExpLiq.Open;
  Try
    FCalculoLiquidacion := TFCalculoLiquidacion.Create(Self);
    FCalculoLiquidacion.ShowModal;
  Finally
    FCalculoLiquidacion.Free;
  End;
  If DM1.xSgr = 'G' Then
    btncerrar.OnClick(btncerrar);
End;

Procedure TFBuscaExpediente.FormActivate(Sender: TObject);
Begin
  dbgexpsolicitud.Selected.Clear;
  dbgexpsolicitud.Selected.Add('PVSEXPNRO'#9'11'#9'Número de~Expediente'#9);
  dbgexpsolicitud.Selected.Add('ASOCODMOD'#9'10'#9'Código~Modular'#9);
  dbgexpsolicitud.Selected.Add('ASOAPENOMDNI'#9'45'#9'Apellido(s) y Nombre(s)~Del Asociado'#9);
  dbgexpsolicitud.Selected.Add('BENEFDES'#9'15'#9'Tipo de~Beneficio'#9);
  dbgexpsolicitud.Selected.Add('PVSESTDES'#9'15'#9'Estado del~Expediente'#9);
  dbgexpsolicitud.ApplySelected;
  rgbusca.ItemIndex := 0;
  mebusca.Text := '';
  mebusca.SetFocus;
End;

procedure TFBuscaExpediente.btnBuscarClick(Sender: TObject);
Var xSql, xWhere:String;
begin
  If rgbusca.ItemIndex = 0 Then xWhere := ' WHERE A.ASOAPENOMDNI LIKE '+QuotedStr(mebusca.Text+'%');
  If rgbusca.ItemIndex = 1 Then xWhere := ' WHERE A.ASOCODMOD = '+QuotedStr(mebusca.Text);
  xSql := 'SELECT  A.PVSESTADO, A.ASOID, A.PVSEXPNRO, A.ASORESNOM, A.ASOFRESNOM, A.ASORESCESE, A.ASOFRESCESE, A.PVSCOBASO, A.PVSTIPBEN, A.PVSULTAPO, '
  // Inicio: HPC_201607_PRE --Se añaden los campos departamento de origen del expediente, oficina de origen del expediente 
  // +' A.FORPAGOID, A.BANCOID, A.AGENBCOID, A.ASONCTA, A.REPRID, A.FREG,'
  +' A.FORPAGOID, A.BANCOID, A.AGENBCOID, A.ASONCTA, A.REPRID, A.FREG, A.DEPORIEXP, A.OFIORIEXP, A.FECRECEXP,'
  // Fin: HPC_201607_PRE
  +' B.ASOAPENOMDNI, B.ASOCODMOD, B.USEID, B.UPAGOID, B.UPROID, B.ASODIR, B.ZIPID, B.ASODNI, '
  // Inicio: SPP_201306_PRE
  // Inicio: DPP_201209_PRE
  // +' F.TIPDOCDES, D.BENEFDES, C.PVSESTDES, DECODE(E.REPRAPENOM, NULL, ''SEDE CENTRAL'', E.REPRAPENOM) REPRAPENOM, B.AUTDESAPO'
  // +' F.TIPDOCDES, D.BENEFDES, C.PVSESTDES, DECODE(E.REPRAPENOM, NULL, ''SEDE CENTRAL'', E.REPRAPENOM) REPRAPENOM, B.AUTDESAPO, B.FECAUTDESAPO'
  // Inicio: SPP_201307_PRE
  // +' F.TIPDOCDES, D.BENEFDES, C.PVSESTDES, DECODE(E.REPRAPENOM, NULL, ''SEDE CENTRAL'', E.REPRAPENOM) REPRAPENOM, B.AUTDESAPO, B.FECAUTDESAPO, A.FORSOLBEN'
  +' F.TIPDOCDES, D.BENEFDES, C.PVSESTDES, DECODE(E.REPRAPENOM, NULL, ''SEDE CENTRAL'', E.REPRAPENOM) REPRAPENOM, B.AUTDESAPO, B.FECAUTDESAPO, A.FORSOLBEN, A.PVSTIPRET'
  // Fin: SPP_201307_PRE
  // Fin: DPP_201209_PRE
  // Fin: SPP_201306_PRE
  +' FROM PVS301 A, APO201 B,  PVS102 C, TGE186 D, COB201 E, TGE159 F'
  +xWhere
  +' AND A.PVSESTADO IN (''01'', ''05'') AND A.ASOID = B.ASOID AND A.ASOID = B.ASOID'
  +' And A.PVSESTADO = C.PVSESTDSG AND C.PVSDOC = ''E'' AND A.PVSTIPBEN = D.TIPBENEF'
  +' AND A.TIPDOCCOD = F.TIPDOCCOD(+) AND A.REPRID = E.REPRID(+) ORDER BY PVSEXPNRO';
  DM1.cdsExpLiq.Close;
  DM1.cdsExpLiq.DataRequest(xSql);
  DM1.cdsExpLiq.Open;
End;

procedure TFBuscaExpediente.btncerrarClick(Sender: TObject);
begin
  FBuscaExpediente.Close;
end;

Procedure TFBuscaExpediente.rgbuscaClick(Sender: TObject);
Begin
  If rgbusca.ItemIndex = 0 Then
  Begin
    mebusca.Width := 353;
    mebusca.MaxLength := 42;
    mebusca.SetFocus;
    btnBuscar.Left := 520;
    mebusca.Text := '';
  End;
  If rgbusca.ItemIndex = 1 Then
  Begin
    mebusca.Width := 89;
    mebusca.MaxLength := 11;
    mebusca.SetFocus;
    btnBuscar.Left := 256;
    mebusca.Text := '';
  End;
End;


procedure TFBuscaExpediente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  begin
    Key := #0;
    Perform(CM_DIALOGKEY, VK_TAB, 0);
  end;
end;

end.
