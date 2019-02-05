// Inicio Uso Estándares: 01/08/2011
// Unidad               : Previsión Social
// Formulario           : FProgDesembolso
// Fecha de Creación    : 22/01/2018
// Autor                : Sistemas
// Objetivo             : Nuevos desembolsos por liquidación por oficio
// Actualizaciones:
// HPC_201802_PRE       : Creación
// HPC_201809_PRE : Se añade el campo oficina de origen
unit PRE221;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, db,
  DBClient;

type
  TFProgDesembolso = class(TForm)
    GroupBox1: TGroupBox;
    dbgliquidaciones: TwwDBGrid;
    rgestliq: TRadioGroup;
    pnlbuscar: TGroupBox;
    pnlasoapenomdni: TPanel;
    edtBuscarDet: TEdit;
    btnSalir: TBitBtn;
    btnliqben: TBitBtn;
    rgbuscar: TRadioGroup;
    procedure FormActivate(Sender: TObject);
    procedure rgestliqClick(Sender: TObject);
    procedure edtBuscarDetKeyPress(Sender: TObject; var Key: Char);
    procedure edtBuscarDetChange(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure dbgliquidacionesDblClick(Sender: TObject);
    procedure btnliqbenClick(Sender: TObject);
    procedure bubuscarClick(Sender: TObject);
  private
    procedure filtar;

  public
    { Public declarations }
  end;

var
  FProgDesembolso: TFProgDesembolso;

implementation

uses PREDM, PRE222, PRE241;

{$R *.dfm}

procedure TFProgDesembolso.filtar;
Var xSql, xwhere, xbusca:String;
begin
   xwhere := '';
   If rgestliq.ItemIndex = 0 Then xwhere := ' AND NVL(A.FLADES,''N'') = ''N''';
   If rgestliq.ItemIndex = 1 Then xwhere := ' AND NVL(A.FLADES,''N'') = ''S''';
   xSql := 'SELECT C.ASODNI, C.ASONCTA, A.ASOID, A.ASOCODMOD, A.PVSLBENNR, A.PVSLFECBE, B.BENEFDES, A.ASOAPENOMDNI, MONLIQBEN, MONDEV, MONDES,'
   +' NVL(A.MONLIQBEN,0)+NVL(A.MONDEV,0)-NVL(A.MONDES,0) MONAPAG, CASE WHEN A.FLADES IS NULL THEN ''POR DESEMBOLSAR'' ELSE ''DESEMBOLSADO'' END ESTADO,'
   +' A.USUDES, A.FECDES, C.ASOAPENOMDNI, C.ASOAPEPATDNI, C.ASOAPEMATDNI, C.ASOAPECASDNI, C.ASONOMDNI, C.ASOTELF1, C.ASOAPECASDNI, A.PVSLTIPBE, A.FLADES,'
   +' A.PVSESTLIQ, A.CNTFLAG, A.ASODIR, A.ZIPID, A.ASOCODMOD, A.ASODESLAB, A.ASODSTLABID, A.USEID, A.UPAGOID, A.UPROID, A.ASOFRESNOM, A.ASOFRESCESE,'
   +' A.ASORESNOM, A.ASORESCESE, A.PVSLULAP, A.PVSLTAAP, A.FECDIFLIQ, A.FORSOLBEN, A.DIFERIDO, A.PVSTIPRET, A.HREG, A.USUARIO, A.PVSCOBASO,'
   // Inicio: HPC_201809_PRE
   // Se añade campo oficina de origen
   // +' A.NUMBENORI, A.PVSFANUL, A.PVSUSUANUL, A.PVSMOTANUL'
      +' A.NUMBENORI, A.PVSFANUL, A.PVSUSUANUL, A.PVSMOTANUL, D.OFIORIEXP'
   // Fin: HPC_201809_PRE
   +' FROM PVS306 A, TGE186 B, APO201 C, PVS301 D WHERE PVSESTLIQ NOT IN (''04'',''13'')'+xwhere
   + xbusca
   +' AND A.FORSOLBEN = ''O'' AND (NVL(A.MONLIQBEN,0)+NVL(A.MONDEV,0)-NVL(A.MONDES,0) > 0) AND A.PVSLTIPBE = B.TIPBENEF'
   +' AND A.ASOID = C.ASOID'
   +' AND A.ASOID = D.ASOID(+) AND A.PVSLBENNR = D.PVSLBENNR(+)';
   DM1.cdsCabLiq.Close;
   DM1.cdsCabLiq.DataRequest(xSql);
   DM1.cdsCabLiq.Open;
   dbgliquidaciones.Selected.Clear;
   dbgliquidaciones.Selected.Add('PVSLBENNR'#9'11'#9'Número~de liquidación'#9#9);
   dbgliquidaciones.Selected.Add('PVSLFECBE'#9'10'#9'Fecha~de liquidación'#9#9);
   dbgliquidaciones.Selected.Add('BENEFDES'#9'15'#9'Tipo de~beneficio'#9#9);
   dbgliquidaciones.Selected.Add('ASOCODMOD'#9'10'#9'Código~modular'#9#9);
   dbgliquidaciones.Selected.Add('ASOAPENOMDNI'#9'48'#9'Apellidos y nombres del asociado'#9#9);
   dbgliquidaciones.Selected.Add('MONAPAG'#9'10'#9'Monto a~desembolsar'#9#9);
   dbgliquidaciones.Selected.Add('ESTADO'#9'18'#9'Estado del~desembolso'#9#9);
   dbgliquidaciones.Selected.Add('USUDES'#9'20'#9'Usuario que~desembolsa'#9#9);
   dbgliquidaciones.Selected.Add('FECDES'#9'10'#9'Fecha de~desembolso'#9#9);
   dbgliquidaciones.ApplySelected;
   TNumericField(DM1.cdsCabLiq.FieldByName('MONAPAG')).DisplayFormat := '##,##0.00';
end;

procedure TFProgDesembolso.FormActivate(Sender: TObject);
begin
   filtar;
end;

procedure TFProgDesembolso.rgestliqClick(Sender: TObject);
begin
   filtar;
end;


procedure TFProgDesembolso.edtBuscarDetKeyPress(Sender: TObject;
  var Key: Char);
begin
 If Key=#13 Then
  Begin
    If Length(Trim(edtBuscarDet.Text))>0 Then
    Begin
      edtBuscarDet.Text := '';
      dbgliquidaciones.SetFocus;
    End
    Else
    Begin
      MessageDlg('Debe Digitar El Nombre Del Asociado, Para Iniciar La Busqueda', mtError,[mbOk], 0 );
      edtBuscarDet.SetFocus;
    End;
  End;
end;

procedure TFProgDesembolso.edtBuscarDetChange(Sender: TObject);
begin
If rgbuscar.ItemIndex = 0 Then
Begin
   If Length(Trim(edtBuscarDet.Text))>0 Then
   DM1.cdsCabLiq.Locate('ASOAPENOMDNI', VarArrayOf([TRIM(edtBuscarDet.Text)]), [loPartialKey]);
End;

If rgbuscar.ItemIndex = 1 Then
Begin
   If Length(Trim(edtBuscarDet.Text))>0 Then
   DM1.cdsCabLiq.Locate('ASOCODMOD', VarArrayOf([TRIM(edtBuscarDet.Text)]), [loPartialKey]);
End;

If rgbuscar.ItemIndex = 2 Then
Begin
   If Length(Trim(edtBuscarDet.Text))>0 Then
   DM1.cdsCabLiq.Locate('PVSLBENNR', VarArrayOf([TRIM(edtBuscarDet.Text)]), [loPartialKey]);
End;


end;

procedure TFProgDesembolso.btnSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TFProgDesembolso.dbgliquidacionesDblClick(Sender: TObject);
begin
   If DM1.cdsCabLiq.FieldByName('FLADES').AsString = 'S' Then
   Begin
      MessageDlg('Liquidación ya cuenta con desembolso asignado', mtError,[mbOk], 0 );
      Exit;
   End;
   Try
      FProgramacionDesembolso := TFProgramacionDesembolso.Create(self);
      FProgramacionDesembolso.Showmodal;
   Finally
      FProgramacionDesembolso.Free;
   End;
   filtar;
end;

procedure TFProgDesembolso.btnliqbenClick(Sender: TObject);
begin
   Try
      FLiquidacionBeneficio := TFLiquidacionBeneficio.create(Self);
      FLiquidacionBeneficio.ShowModal;
   Finally
      FLiquidacionBeneficio.Free;
   End;
end;

procedure TFProgDesembolso.bubuscarClick(Sender: TObject);
begin
   If rgbuscar.ItemIndex = 0 Then
   Begin
      pnlbuscar.Caption := 'Buscar por apellidos y Nombre';
      edtBuscarDet.Width := 373;
      pnlasoapenomdni.Width := 373;
      edtBuscarDet.Text := '';
      edtBuscarDet.MaxLength := 45;
   End;
   If rgbuscar.ItemIndex = 1 Then
   Begin
      pnlbuscar.Caption := 'Buscar por Código modular';
      edtBuscarDet.Width := 80;
      pnlasoapenomdni.Width := 84;
      edtBuscarDet.Text := '';
      edtBuscarDet.MaxLength := 10;
   End;
   If rgbuscar.ItemIndex = 2 Then
   Begin
      pnlbuscar.Caption := 'Buscar por Número de beneficio';
      edtBuscarDet.Width := 80;
      pnlasoapenomdni.Width := 84;
      edtBuscarDet.Text := '';
      edtBuscarDet.MaxLength := 11;                  
   End;
   edtBuscarDet.SetFocus;
end;

end.
