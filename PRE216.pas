// Inicio Uso Estándares: 01/08/2011
// Unidad               : PRE216
// Formulario           : FExtRepDes
// Fecha de Creación    : 26/06/2017
// Autor                : Area de desarrollo de sistemas.
// Objetivo             : Extorno y reprog. de desembolso.
// Actualizaciones
// HPC_201705_PRE : Creación
// HPC_201809_PRE : Se añade el campo oficina de origen

unit PRE216;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, ExtCtrls, Buttons, Mask, DB,
  wwdblook, Wwdbdlg, ComCtrls, wwdbdatetimepicker;

type
  TFExtRepDes = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    edtNunBen: TEdit;
    Panel2: TPanel;
    edtApeNom: TEdit;
    Panel3: TPanel;
    edtTipBen: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Panel4: TPanel;
    edtFecben: TEdit;
    GroupBox3: TGroupBox;
    rgbusca: TRadioGroup;
    mebusca: TMaskEdit;
    btnBuscar: TBitBtn;
    gbtitdesgenxliq: TGroupBox;
    dbgdesembolsos: TwwDBGrid;
    btnextorna: TBitBtn;
    btnrepdepagoext: TBitBtn;
    btnimprimeliq: TBitBtn;
    btnsalir: TBitBtn;
    procedure rgbuscaClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnextornarClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btnrepdepagoextClick(Sender: TObject);
    procedure btnextornaClick(Sender: TObject);
    procedure dbgdesembolsosDrawDataCell(Sender: TObject;
      const Rect: TRect; Field: TField; State: TGridDrawState);
    procedure btnimprimeliqClick(Sender: TObject);
    procedure btnsalirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure actualizagrid;  
    { Public declarations }
  end;

var
  FExtRepDes: TFExtRepDes;

implementation

uses PREDM, PRE217, PRE218, PRE241, PRE220;

{$R *.dfm}

procedure TFExtRepDes.rgbuscaClick(Sender: TObject);
begin
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
  If rgbusca.ItemIndex = 2 Then
  Begin
    mebusca.Width := 78;
    mebusca.MaxLength := 10;
    mebusca.SetFocus;
    btnBuscar.Left := 247;
    mebusca.Text := '';
  End;
end;

procedure TFExtRepDes.btnBuscarClick(Sender: TObject);
Var xSql, xtexto:String;
begin
   xtexto := 'A.ASOID, A.PVSLBENNR, A.ASOAPENOMDNI, A.PVSLTIPBE, C.BENEFDES, A.PVSLFECBE, B.ASONCTA, A.PVSESTLIQ, A.CNTFLAG, A.PVSTIPRET, A.PVSEXPNRO,'
   +' A.ASODNI, A.ASODIR, A.ZIPID, A.ASOCODMOD, A.ASODESLAB, A.ASODSTLABID, A.USEID, A.UPAGOID, A.UPROID, A.ASOFRESNOM, A.ASOTELF1,'
   // Inicio: HPC_201809_PRE
   // +' A.ASOFRESCESE, A.ASORESNOM, A.ASORESCESE, A.PVSLULAP, A.PVSLTAAP, A.PVSLFECBE, A.FECDIFLIQ, D.FORSOLBEN, A.DIFERIDO, A.HREG, A.USUARIO';
      +' A.ASOFRESCESE, A.ASORESNOM, A.ASORESCESE, A.PVSLULAP, A.PVSLTAAP, A.PVSLFECBE, A.FECDIFLIQ, D.FORSOLBEN, A.DIFERIDO, A.HREG, A.USUARIO, D.OFIORIEXP';
   // Fin: HPC_201809_PRE
   If rgbusca.ItemIndex = 0 Then
      xSql := 'SELECT '+xtexto+' FROM PVS306 A, APO201 B, TGE186 C, PVS301 D WHERE B.ASOAPENOMDNI LIKE '+QuotedStr(Trim(mebusca.Text)+'%');
   If rgbusca.ItemIndex = 1 Then
      xSql := 'SELECT '+xtexto+' FROM PVS306 A, APO201 B, TGE186 C, PVS301 D WHERE A.PVSLBENNR = '+QuotedStr(mebusca.Text)+' AND A.ASOID = B.ASOID AND A.PVSLTIPBE = C.TIPBENEF';
   If rgbusca.ItemIndex = 2 Then
      xSql := 'SELECT '+xtexto+' FROM PVS306 A, APO201 B, TGE186 C, PVS301 D WHERE B.ASOCODMOD = '+QuotedStr(mebusca.Text)+' AND A.ASOID = B.ASOID AND A.PVSLTIPBE = C.TIPBENEF';
   xSql := xSql + ' AND A.ASOID = B.ASOID AND A.PVSLTIPBE = C.TIPBENEF AND A.ASOID = D.ASOID(+) AND A.PVSLBENNR = D.PVSLBENNR(+)';
   DM1.cdsCabLiq.Close;
   DM1.cdsCabLiq.DataRequest(xSql);
   DM1.cdsCabLiq.Open;
   gbtitdesgenxliq.Caption := 'Desembolso(s) generado(s) por la liquidación Nº '+DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString;
   If DM1.cdsCabLiq.RecordCount = 0 Then
   Begin
      MessageDlg('No existe ninguna liquidación con estos datos.', mtInformation, [mbOk], 0);
      actualizagrid;
      mebusca.SetFocus;
      Exit;
   End;

   btnextorna.Enabled := true;
   btnrepdepagoext.Enabled := true;
   btnimprimeliq.Enabled := true;

   DM1.xFlg := 'S';
   If DM1.cdsCabLiq.RecordCount > 1 Then
   Begin
      DM1.xFlg := 'N';
      Try
         Fbuscaliqext := TFbuscaliqext.Create(self);
         Fbuscaliqext.Showmodal;
      Finally
         Fbuscaliqext.Free;
      End;
   End;
   If DM1.xFlg = 'S' Then
      actualizagrid
   Else
   Begin
      mebusca.SetFocus;
      Exit;
   End;
   actualizagrid;
end;


procedure TFExtRepDes.FormKeyPress(Sender: TObject; var Key: Char);
begin
   If Key = #13 Then
   Begin
      Key := #0;
      Perform(CM_DIALOGKEY, VK_TAB, 0);
   End;
end;

procedure TFExtRepDes.actualizagrid;
Var xSql:String;
begin
   edtNunBen.Text := DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString;
   edtFecben.Text := DM1.cdsCabLiq.FieldByName('PVSLFECBE').AsString;
   edtApeNom.Text := DM1.cdsCabLiq.FieldByName('ASOAPENOMDNI').AsString;
   edtTipBen.Text := DM1.cdsCabLiq.FieldByName('BENEFDES').AsString;
   xSql := 'SELECT A.PVSLAGRID, A.FLGVOUCHER, A.PVSLBENNR, A.PVSLNVOU, A.PVSNOMBRE, A.PVSLMONTO,'
   +' B.BANCONOM, C.TIPDESEDES, A.PVSLNOFC, A.FECPAG, A.FLAEXT, A.FLAREP,'
   +' CASE WHEN A.PVSLNOFC IS NULL AND A.FLAEXT IS NULL THEN       ''POR PAGAR'''
   +'      WHEN A.PVSLNOFC IS NOT NULL THEN                        ''PAGADO'''
   +'      WHEN A.FLAEXT IS NOT NULL AND A.FLAREP IS NULL THEN     ''EXTORNADO'''
   +'      WHEN A.FLAEXT IS NOT NULL AND A.FLAREP IS NOT NULL THEN ''EXTORN./REPROG.'' END ESTADO'
   +' FROM PVS307 A, TGE105 B, CRE104 C'
   +' WHERE A.PVSLBENNR = '+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
   +' AND A.PVSLAGRID = ''FPG'''
   +' AND A.FLGVOUCHER = ''N'''
   +' AND A.BANCOID = B.BANCOID AND A.FORPAGOID = C.TIPDESEID';
   DM1.cdsEstCarta.Close;
   DM1.cdsEstCarta.DataRequest(xSql);
   DM1.cdsEstCarta.Open;
   dbgdesembolsos.Selected.Clear;
   dbgdesembolsos.Selected.Add('PVSNOMBRE'#9'42'#9'Nombre del~beneficiario'#9#9);
   dbgdesembolsos.Selected.Add('BANCONOM'#9'20'#9'Banco de~desembolso'#9#9);
   dbgdesembolsos.Selected.Add('TIPDESEDES'#9'28'#9'Forma de pago~de desembolso'#9#9);
   dbgdesembolsos.Selected.Add('PVSLMONTO'#9'12'#9'Monto~desembolsado'#9#9);
   dbgdesembolsos.Selected.Add('PVSLNOFC'#9'11'#9'Oficio~generado'#9#9);
   dbgdesembolsos.Selected.Add('FECPAG'#9'10'#9'Fecha de~oficio'#9#9);
   dbgdesembolsos.Selected.Add('ESTADO'#9'17'#9'Estado del~desembolso'#9#9);
   dbgdesembolsos.ApplySelected;
end;

procedure TFExtRepDes.btnextornarClick(Sender: TObject);
var xSql, xtexto:String;
begin

end;

procedure TFExtRepDes.Button3Click(Sender: TObject);
begin
   Try
      Freprogdesembolso := TFreprogdesembolso.Create(self);
      Freprogdesembolso.Showmodal;
   Finally
      Freprogdesembolso.Free;
   End;
end;

procedure TFExtRepDes.btnrepdepagoextClick(Sender: TObject);
Var xSql:String;
begin
  xSql := 'SELECT PVSLDNIBEN FROM PVS307 WHERE PVSLBENNR = '+QuotedStr(DM1.cdsCabLiq.FieldByname('PVSLBENNR').AsString)+' AND NVL(FLAEXT,''N'') = ''S'' AND NVL(FLAREP,''N'') = ''N''';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  If DM1.cdsQry.RecordCount > 0 Then
  Begin
     Try
        Freprogdesembolso := TFreprogdesembolso.Create(self);
        Freprogdesembolso.Showmodal;
     Finally
        Freprogdesembolso.Free;
     End;
  End
  Else
     MessageDlg('Debe existir al menos un pago extornado y no reprogramado'+#13+'para poder proceder a la reprogramación.', mtInformation, [mbOk], 0);


end;

procedure TFExtRepDes.btnextornaClick(Sender: TObject);
Var xSql:String;
begin
   If Trim(DM1.cdsEstCarta.FieldByName('PVSLNOFC').AsString) = '' Then
   Begin
      MessageDlg('No se puede extornar desembolso no pagado.', mtInformation, [mbOk], 0);
      Exit;
   End;
   If DM1.cdsEstCarta.FieldByName('FLAEXT').AsString  = 'S' Then
   Begin
      MessageDlg('Este desembolso ya se encuentra extornado.', mtInformation, [mbOk], 0);
      Exit;
   End;
   If DM1.cdsEstCarta.FieldByName('FLAREP').AsString = 'S' Then
   Begin
      MessageDlg('Este desembolso ya se encuentra reprogramado.', mtInformation, [mbOk], 0);
      Exit;
   End;
   If DM1.cdsEstCarta.RecordCount = 0 Then
   Begin
      MessageDlg('No existe formas de pago para extornar.', mtInformation, [mbOk], 0);
      Exit;
   End;
   Try
      Fextornodesembolso := TFextornodesembolso.Create(self);
      Fextornodesembolso.Showmodal;
   Finally
      Fextornodesembolso.Free;
   End;

   actualizagrid;

end;

procedure TFExtRepDes.dbgdesembolsosDrawDataCell(Sender: TObject; const Rect: TRect; Field: TField; State: TGridDrawState);
begin
   If DM1.cdsEstCarta.Active = True Then
   Begin
      If (DM1.cdsEstCarta.FieldByName('ESTADO').AsString = 'EXTORNADO') Or (DM1.cdsEstCarta.FieldByName('ESTADO').AsString = 'EXTORN./REPROG.') Then
      Begin
        dbgdesembolsos.Canvas.Font.Color := clRed;
        dbgdesembolsos.DefaultDrawDataCell(Rect, Field, State);
      End;
   End;
end;

procedure TFExtRepDes.btnimprimeliqClick(Sender: TObject);
Var xSql:String;
begin
   xSql := 'SELECT ASOID, PVSLBENNR FROM PVS301 WHERE ASOID = '+DM1.cdsCabLiq.FieldByName('ASOID').AsString+' AND pvslbennr = '+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString);
   DM1.cdsExpLiq.Close;
   DM1.cdsExpLiq.DataRequest(xSql);
   DM1.cdsExpLiq.Open;
   DM1.xFlg := 'R';
   Try
      FLiquidacionBeneficio := TFLiquidacionBeneficio.create(Self);
      FLiquidacionBeneficio.ShowModal;
   Finally
      FLiquidacionBeneficio.Free;
   End;
end;

procedure TFExtRepDes.btnsalirClick(Sender: TObject);
begin
   DM1.cdsEstCarta.Close;
   DM1.cdsCabLiq.Close;
   DM1.cdsExpLiq.Close;
   Close;
end;

procedure TFExtRepDes.FormActivate(Sender: TObject);
begin
   rgbusca.ItemIndex := 0;
   mebusca.SetFocus;
end;

end.
