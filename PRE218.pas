// Inicio Uso Estándares: 01/08/2011
// Unidad               : PRE218
// Formulario           : Freprogdesembolso
// Fecha de Creación    : 26/06/2017
// Autor                : Area de desarrollo de sistemas.
// Objetivo             : Opción de reprogramación de desembolsos.
// Actualizaciones
// HPC_201705_PRE : Creación
// HPC_201807_PRE : Se actualiza los campos Flag de reprogramado, usuario y fecha de reprogramación

unit PRE218;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, ExtCtrls, Mask, wwdblook, DB,
  Wwdbdlg, Buttons;

type
  TFreprogdesembolso = class(TForm)
    gbtitdesext: TGroupBox;
    dbgdesext: TwwDBGrid;
    gbCobAso: TGroupBox;
    lblforpag: TLabel;
    lblbanco: TLabel;
    Label25: TLabel;
    Label19: TLabel;
    dblcforpag: TwwDBLookupCombo;
    dblcBanco: TwwDBLookupCombo;
    pnlbanco: TPanel;
    mebancodes: TMaskEdit;
    pnlforpag: TPanel;
    meforpagodes: TMaskEdit;
    rgCobAso: TRadioGroup;
    gbtitnueben: TGroupBox;
    dbgbenrep: TwwDBGrid;
    lblasoncta: TLabel;
    lbldospun04: TLabel;
    pnlasoncta: TPanel;
    measoncta: TMaskEdit;
    btnbeneficiarios: TBitBtn;
    btncerrar: TBitBtn;
    btnreprogramar: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure rgCobAsoClick(Sender: TObject);
    procedure dblcforpagExit(Sender: TObject);
    procedure btnbeneficiariosClick(Sender: TObject);
    procedure dblcBancoChange(Sender: TObject);
    procedure dblcBancoExit(Sender: TObject);
    procedure dblcforpagChange(Sender: TObject);
    procedure btnreprogramarClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
  private
    xmontorep: Double;
    { Private declarations }
    Function verificaporcentaje: bool;
  public

    { Public declarations }
  end;

var
  Freprogdesembolso: TFreprogdesembolso;

implementation

uses PREDM, PRE219, Math, PRE241, PRE216;

{$R *.dfm}

procedure TFreprogdesembolso.FormActivate(Sender: TObject);
Var xSql: String;
begin

   xSql := 'SELECT TIPDESEID, TIPDESEDES, FLACOBPRE FROM CRE104 WHERE NVL(FLAVIGPRE, ''X'') = ''S'' AND TIPDESEID<>''18''  ORDER BY TIPDESEID';
   DM1.cdsFPago.Close;
   DM1.cdsFPago.DataRequest(xSql);
   DM1.cdsFPago.Open;
   dblcforpag.Selected.Clear;
   dblcforpag.Selected.Add('TIPDESEID'#9'2'#9'Código'#9#9);
   dblcforpag.Selected.Add('TIPDESEDES'#9'25'#9'Descripción'#9#9);

   xSql := 'SELECT BANCOID, BANCONOM FROM TGE105 WHERE BANCOID IN (''04'', ''03'')';
   DM1.cdsBanco.Close;
   DM1.cdsBanco.DataRequest(xSql);
   DM1.cdsBanco.Open;
   dblcBanco.Selected.Clear;
   dblcBanco.Selected.Add('BANCOID'#9'2'#9'Código'#9#9);
   dblcBanco.Selected.Add('BANCONOM'#9'25'#9'Descripción'#9#9);

   xSql := 'SELECT B.PVSNOMBRE, C.BANCONOM, D.TIPDESEDES, B.PVSLSALDO PVSLMONTO, B.USUEXT, TO_DATE(B.FECEXT,''DD/MM/YYYY'') FECEXT'
   +' FROM PVS306 A, PVS307 B, TGE105 C, CRE104 D'
   +' WHERE A.PVSLBENNR = '+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
   +' AND A.PVSLBENNR = B.PVSLBENNR'
   +' AND B.PVSLAGRID = ''FPG'' AND B.FLGVOUCHER = ''N'''
   +' AND NVL(B.PVSLSALDO,0) > 0 AND NVL(FLAEXT,''X'') = ''S'' AND B.BANCOID = C.BANCOID'
   +' AND B.FORPAGOID = D.TIPDESEID';
   DM1.cdsDetLiq.Close;
   DM1.cdsDetLiq.DataRequest(xSql);
   DM1.cdsDetLiq.Open;

   xSql := 'SELECT FORPAGOID, BANCOID, AGENBCOID, ASONCTA, ASODNI FROM PVS301 WHERE ASOID = '
   +QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)+' AND PVSLBENNR = '+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
   +' AND PVSCOBASO = ''S''';
   DM1.cdsExpLiq.Close;
   DM1.cdsExpLiq.DataRequest(xSql);
   DM1.cdsExpLiq.Open;
   dblcforpag.Text := DM1.cdsExpLiq.FieldByName('FORPAGOID').AsString;
   dblcBanco.Text  := DM1.cdsExpLiq.FieldByName('BANCOID').AsString;
   measoncta.Text  := DM1.cdsExpLiq.FieldByName('ASONCTA').AsString;

   xSql := 'SELECT ASODNI, ASOAPENOMDNI, ASOAPEPATDNI, ASOAPEMATDNI, ASOAPECASDNI, ASONOMDNI, ASOTELF1 FROM APO201 WHERE ASOID = '+QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString);
   DM1.cdsAsociado.Close;
   DM1.cdsAsociado.DataRequest(xSql);
   DM1.cdsAsociado.Open;
   gbtitdesext.Caption := 'Desembolsos extornados Liquidación Nº '+DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString;
   gbtitnueben.Caption := 'Beneficiarios a incluir en la reprogramación de pago Liquidación Nº '+DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString;
   xmontorep := 0;
   While Not DM1.cdsDetLiq.Eof Do
   Begin
      xmontorep := xmontorep + DM1.cdsDetLiq.FieldByName('PVSLMONTO').AsFloat;
      DM1.cdsDetLiq.Next;
   End;
   DM1.cdsDetLiq.First;
   dbgdesext.Selected.Clear;
   dbgdesext.Selected.Add('PVSNOMBRE'#9'42'#9'Apellidos y nombre(s)~del beneficiario'#9#9);
   dbgdesext.Selected.Add('BANCONOM'#9'20'#9'Banco de desembolso'#9#9);
   dbgdesext.Selected.Add('TIPDESEDES'#9'22'#9'Tipo de desembolso'#9#9);
   dbgdesext.Selected.Add('PVSLMONTO'#9'12'#9'Monto~extornado'#9#9);
   dbgdesext.Selected.Add('USUEXT'#9'12'#9'Usuario que~extorno'#9#9);
   dbgdesext.Selected.Add('FECEXT'#9'12'#9'Fecha de~extorno'#9#9);
   dbgdesext.ApplySelected;
   TNumericField(DM1.cdsDetLiq.FieldByName('PVSLMONTO')).DisplayFormat := '###,###,##0.00';
   dbgdesext.ColumnByName('TIPDESEDES').FooterValue := 'Monto a Reprogramar S/.';
   dbgdesext.ColumnByName('PVSLMONTO').FooterValue := FormatFloat('###,###.#0', xmontorep);

   rgCobAso.ItemIndex := 0;
   gbCobAso.Visible := True;
   btnbeneficiarios.Visible := False;
   If DM1.cdsDetCartas.Active = True Then DM1.cdsDetCartas.Close;

   xSql := 'SELECT A.ASOID, A.PVSLBENNR, A.PVSLNVOU, A.TIPBEN, A.TIPRELBEN, B.PARENDES, A.APEPATBEN, A.APEMATBEN, A.APECASBEN, A.NOMBEN,'
   +' TRIM(A.APEPATBEN)||'' ''||TRIM(A.APEMATBEN)||'' ''||TRIM(A.APECASBEN)||'' ''||TRIM(A.NOMBEN) APENOMBEN, A.TIPDOCIDEBEN, A.DOCIDEBEN, A.FECNACBEN, A.SEXBEN,'
   +' A.PORBEN, A.FORPAGOID, C.TIPDESEDES, A.BANCOID, D.BANCONOM, A.AGENBCOID, A.DIRBEN, ZIPIDBEN, TELFIJBEN, TELMOVBEN, OTRTIPRELBEN, EMAILBEN,'
   +' APEPATTUTBEN, APEMATTUTBEN, NOMTUTBEN, TIPDOCIDETUT, DOCIDETUT, USUREG, FECREG, USUMOD, FECMOD'
   +' FROM PRE_REP_DES_MOV A, TGE149 B, CRE104 C, TGE105 D'
   +' WHERE A.ASOID = '+QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)
   +' AND A.PVSLBENNR = '+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
   +' AND A.TIPRELBEN = B.PARENID(+) AND A.FORPAGOID = C.TIPDESEID(+) AND A.BANCOID = D.BANCOID(+)';
   DM1.cdsDetCartas.Close;
   DM1.cdsDetCartas.DataRequest(xSql);
   DM1.cdsDetCartas.Open;

   If DM1.cdsDetCartas.RecordCount > 0 Then
      rgCobAso.ItemIndex := 1
   Else
      rgCobAso.ItemIndex := 0;

   dbgbenrep.Selected.Clear;
   dbgbenrep.Selected.Add('APENOMBEN'#9'42'#9'Apellidos y nombre(s)~del beneficiario'#9#9);
   dbgbenrep.Selected.Add('PARENDES'#9'22'#9'Parentesco'#9#9);
   dbgbenrep.Selected.Add('BANCONOM'#9'22'#9'Banco de~desembolso'#9#9);
   dbgbenrep.Selected.Add('TIPDESEDES'#9'22'#9'Forma de~desembolso'#9#9);
   dbgbenrep.Selected.Add('PORBEN'#9'22'#9'Porcentaje'#9#9);
   dbgbenrep.ApplySelected;

end;

procedure TFreprogdesembolso.rgCobAsoClick(Sender: TObject);
Var xSql:String;
begin
   If rgCobAso.ItemIndex = 0 Then
   Begin
      If DM1.cdsDetCartas.RecordCount > 0 Then
      Begin
         MessageDlg('Existe información ingresada de beneficiarios'+#13+'En el caso de elegir que cobra el asociado,'+#13+'esta información será borrada.', mtInformation, [mbOk], 0);
         If MessageDlg('Seguro de cambiar ¿Quién cobrará la liquidación?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
         Begin
            xSql := 'DELETE FROM PRE_REP_DES_MOV WHERE ASOID = '+QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)+' AND PVSLBENNR = '+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString);
            DM1.DCOM1.AppServer.EjecutaSQL(xSql);
         End;
      End;
      gbCobAso.Visible := True;
      btnbeneficiarios.Visible := False;
   End
   Else
   Begin
      gbCobAso.Visible  := False;
      btnbeneficiarios.Visible := True;
      dblcforpag.Text   := '';
      meforpagodes.Text := '';
      dblcBanco.Text    := '';
      mebancodes.Text   := '';
      measoncta.Text    := '';
   End;
end;

procedure TFreprogdesembolso.dblcforpagExit(Sender: TObject);
Var xSql:String;
begin
   If DM1.cdsFPago.Locate('TIPDESEID', dblcforpag.Text, []) Then
   Begin
      If DM1.cdsFPago.FieldByName('FLACOBPRE').AsString = 'B' Then
         xSql := 'SELECT BANCOID, BANCONOM FROM TGE105 WHERE FLAVIGPRE = ''S'' AND CLAUXID = ''B'''
      Else
         xSql := 'SELECT BANCOID, BANCONOM FROM TGE105 WHERE FLAVIGPRE = ''S'' AND CLAUXID = ''C''';
      DM1.cdsBanco.Close;
      DM1.cdsBanco.DataRequest(xSql);
      DM1.cdsBanco.Open;
      dblcBanco.Selected.Clear;
      dblcBanco.Selected.Add('BANCOID'#9'2'#9'Código'#9#9);
      dblcBanco.Selected.Add('BANCONOM'#9'25'#9'Descripción'#9#9);
      meforpagodes.Text := DM1.cdsFPago.FieldByName('TIPDESEDES').AsString;
      lblbanco.Visible := True;
      dblcBanco.Visible := True;
      pnlbanco.Visible := True;
      If (dblcforpag.Text = '01') Or (dblcforpag.Text = '11') Or (dblcforpag.Text = '16') Then dblcBanco.Text := '03';
      If (dblcforpag.Text = '05') Or (dblcforpag.Text = '06') Then dblcBanco.Text := '04';
      If dblcforpag.Text = '19' Then
      Begin
         dblcBanco.Text := '15';
         measoncta.Text := DM1.cdsCabLiq.FieldByName('ASONCTA').AsString;
      End;
   End
   Else
   Begin
      MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
      dblcforpag.Text := '';
      meforpagodes.Text := '';
   End;
end;

function TFreprogdesembolso.verificaporcentaje: bool;
Var xSql:String;
begin
   xSql := 'SELECT SUM(NVL(PORBEN,0)) PORBEN FROM PRE_REP_DES_MOV WHERE PVSLBENNR = '+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString);
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   If DM1.cdsQry.FieldByName('PORBEN').AsFloat = 100 Then
      Result := True
   Else
      Result := False;
end;

procedure TFreprogdesembolso.btnbeneficiariosClick(Sender: TObject);
begin
   Try
      Fbeneficiarios := TFbeneficiarios.Create(self);
      Fbeneficiarios.Showmodal;
   Finally
      Fbeneficiarios.Free;
   End;
end;


procedure TFreprogdesembolso.dblcBancoChange(Sender: TObject);
begin
   If Trim(dblcBanco.Text) = '' Then
   Begin
      dblcBanco.Text := '';
      mebancodes.Text := '';
   End;
   If Length(dblcBanco.Text) = 2 Then
   Begin
      If DM1.cdsBanco.Locate('BANCOID', dblcBanco.Text, []) Then
      Begin
         mebancodes.Text := DM1.cdsBanco.FieldByName('BANCONOM').AsString;
      End
      Else
      Begin
         MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
         dblcBanco.Text := '';
         mebancodes.Text := '';
      End;
   End;
End;
procedure TFreprogdesembolso.dblcBancoExit(Sender: TObject);
var xSql:String;
begin
  If Trim(dblcBanco.Text) <> '' Then
  Begin
    xSql := 'SELECT BANCOID FROM TGE105 WHERE BANCOID = '+QuotedStr(dblcBanco.Text);
    If DM1.verificaexiste(xSql) = False Then
    Begin
      MessageDlg('Código de banco no valido', mtInformation, [mbOk], 0);
      dblcBanco.Text := '';
      dblcBanco.SetFocus;
      Exit;
    End;
  End;
end;

procedure TFreprogdesembolso.dblcforpagChange(Sender: TObject);
begin
   If DM1.cdsFPago.Locate('TIPDESEID', dblcforpag.Text, []) Then
      meforpagodes.Text := DM1.cdsFPago.FieldByName('TIPDESEDES').AsString;
end;

procedure TFreprogdesembolso.btnreprogramarClick(Sender: TObject);
var texto, xSql, xApeNom:String;
    montoCob: Double;
    item: Integer;
    xVoucher:String;
    xValor:Double;
begin
   DM1.cdsForPag.EmptyDataSet;
   If rgCobAso.ItemIndex = 1 Then
   Begin
      If Not verificaporcentaje Then
      Begin
         MessageDlg('El total porcentaje de los beneficiario debe ser 100%', mtInformation, [mbOK], 0);
         Exit;
      End;
   End;
   MessageDlg('Se va a proceder a realizar la reprogramación del monto extornado.', mtInformation, [mbOK], 0);
   If MessageDlg('¿ Está seguro de realizar la reprogramación del monto extornado ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
      If rgCobAso.ItemIndex = 0 Then
      Begin
         If dblcforpag.Text = '01' Then
            texto := '* CHEQUE DEL ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', dblcBanco.Text);
         If dblcforpag.Text = '11' Then
            texto := '* LIBRETA DE AHORRO DEL ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', dblcBanco.Text);
         If dblcforpag.Text = '16' Then
            texto := '* CHEQUE DE GERENCIA ' + measoncta.Text + ' DEL ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', dblcBanco.Text);
         If dblcforpag.Text = '19' Then
            texto := '* DEPOSITO EN CUENTA DEL BANCO DE LA NACION  - ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', dblcBanco.Text);
         DM1.cdsForPag.Append;
         DM1.cdsForPag.FieldByName('DESC').AsString := texto;
         DM1.cdsForPag.FieldByName('FORPAGID').AsString := dblcforpag.Text;
         DM1.cdsForPag.FieldByName('BANCOID').AsString := dblcBanco.Text;
         DM1.cdsForPag.FieldByName('PVSLNCTA').AsString := measoncta.Text;
         DM1.cdsForPag.FieldByName('PVSLDNIBEN').AsString := DM1.cdsAsociado.FieldByName('ASODNI').AsString;
         DM1.cdsForPag.FieldByName('PVSNOMBRE').AsString := DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString;
         DM1.cdsForPag.FieldByName('APEPATCOB').AsString := DM1.cdsAsociado.FieldByName('ASOAPEPATDNI').AsString;
         DM1.cdsForPag.FieldByName('APEMATCOB').AsString := DM1.cdsAsociado.FieldByName('ASOAPEMATDNI').AsString;
         DM1.cdsForPag.FieldByName('APECASCOB').AsString := DM1.cdsAsociado.FieldByName('ASOAPECASDNI').AsString; // SPP_201403_PRE
         DM1.cdsForPag.FieldByName('NOMCOB').AsString := DM1.cdsAsociado.FieldByName('ASONOMDNI').AsString;
         DM1.cdsForPag.Post;
         DM1.cdsForPag.Append;
         DM1.cdsForPag.FieldByName('DESC').AsString := '  A : ' + DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString;
         If measoncta.Text <> '' Then
            DM1.cdsForPag.FieldByName('DESC').AsString := DM1.cdsForPag.FieldByName('DESC').AsString + ' [CUENTA Nº ' + measoncta.Text +']';
         DM1.cdsForPag.FieldByName('DESC').AsString := DM1.cdsForPag.FieldByName('DESC').AsString + ' [D.N.I. : ' + DM1.cdsAsociado.FieldByName('ASODNI').AsString + ']';
         If xmontorep < 0 Then
            xmontorep := 0;
         DM1.cdsForPag.FieldByName('MONTO').AsCurrency := xmontorep;
         DM1.cdsForPag.FieldByName('FORPAGID').AsString := dblcforpag.Text;
         DM1.cdsForPag.FieldByName('BANCOID').AsString := dblcBanco.Text;
         DM1.cdsForPag.FieldByName('PVSLNCTA').AsString := measoncta.Text;
         DM1.cdsForPag.FieldByName('PVSLDNIBEN').AsString := DM1.cdsAsociado.FieldByName('ASODNI').AsString;
         DM1.cdsForPag.FieldByName('PVSNOMBRE').AsString := DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString;
         DM1.cdsForPag.FieldByName('APEPATCOB').AsString := DM1.cdsAsociado.FieldByName('ASOAPEPATDNI').AsString;
         DM1.cdsForPag.FieldByName('APEMATCOB').AsString := DM1.cdsAsociado.FieldByName('ASOAPEMATDNI').AsString;
         DM1.cdsForPag.FieldByName('APECASCOB').AsString := DM1.cdsAsociado.FieldByName('ASOAPECASDNI').AsString;
         DM1.cdsForPag.FieldByName('NOMCOB').AsString := DM1.cdsAsociado.FieldByName('ASONOMDNI').AsString;
         DM1.cdsForPag.FieldByName('PORCENTAJE').AsFloat := 100;
         DM1.cdsForPag.FieldByName('MOVCOB').AsString := DM1.cdsAsociado.FieldByName('ASOTELF1').AsString;
         DM1.cdsForPag.Post;
      End;
      If rgCobAso.ItemIndex = 1 Then
      Begin
         DM1.cdsDetCartas.First;
         DM1.cdsForPag.EmptyDataSet;
         While Not  DM1.cdsDetCartas.Eof Do
         Begin
            If DM1.cdsDetCartas.FieldByName('FORPAGOID').AsString = '01' Then
               texto := '* CHEQUE DEL ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', DM1.cdsDetCartas.FieldByName('BANCOID').AsString);
            If DM1.cdsDetCartas.FieldByName('FORPAGOID').AsString = '05' Then
               texto := '* GIRO DEL ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', DM1.cdsDetCartas.FieldByName('BANCOID').AsString)
                   + ' A LA CIUDAD DE ' + DM1.DevuelveValor('COB102', 'AGENBCODES', 'AGENBCOID', DM1.cdsDetCartas.FieldByName('AGENBCOID').AsString) + '-'
                   + DM1.DevuelveValor('TGE158', 'DPTODES', 'DPTOID', DM1.DevuelveValor('COB102', 'DPTOID', 'AGENBCOID', DM1.cdsDetCartas.FieldByName('AGENBCOID').AsString));
            If DM1.cdsDetCartas.FieldByName('FORPAGOID').AsString = '11' Then
               texto := '* LIBRETA DE AHORRO DEL ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', DM1.cdsDetCartas.FieldByName('BANCOID').AsString);
            If DM1.cdsDetCartas.FieldByName('FORPAGOID').AsString = '06' Then
               texto := '* ABONO EN CUENTA DEL ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', DM1.cdsDetCartas.FieldByName('BANCOID').AsString);
            If DM1.cdsDetCartas.FieldByName('FORPAGOID').AsString = '16' Then
               texto := '* CHEQUE DE GERENCIA DEL ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', DM1.cdsDetCartas.FieldByName('BANCOID').AsString);
            If DM1.cdsDetCartas.FieldByName('FORPAGOID').AsString = '19' Then
               texto := '* DEPOSITO EN CUENTA - ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', DM1.cdsDetCartas.FieldByName('BANCOID').AsString);
            montoCob := xmontorep * DM1.cdsDetCartas.FieldByName('PORBEN').AsFloat/100;
            xApeNom := '';
            If Trim(DM1.cdsDetCartas.FieldByName('APEPATBEN').AsString) <> '' Then xApeNom := xApeNom + Trim(DM1.cdsDetCartas.FieldByName('APEPATBEN').AsString)+' ';
            If Trim(DM1.cdsDetCartas.FieldByName('APEMATBEN').AsString) <> '' Then xApeNom := xApeNom + Trim(DM1.cdsDetCartas.FieldByName('APEMATBEN').AsString)+' ';
            If Trim(DM1.cdsDetCartas.FieldByName('APECASBEN').AsString) <> '' Then xApeNom := xApeNom + Trim(DM1.cdsDetCartas.FieldByName('APECASBEN').AsString)+' ';
            xApeNom := xApeNom + Trim(DM1.cdsDetCartas.FieldByName('NOMBEN').AsString);
            DM1.cdsForPag.Append;
            DM1.cdsForPag.FieldByName('DESC').AsString := texto;
            DM1.cdsForPag.FieldByName('FORPAGID').AsString := DM1.cdsDetCartas.FieldByName('FORPAGOID').AsString;
            DM1.cdsForPag.FieldByName('BANCOID').AsString := DM1.cdsDetCartas.FieldByName('BANCOID').AsString;
            DM1.cdsForPag.FieldByName('AGENBCOID').AsString := DM1.cdsDetCartas.FieldByName('AGENBCOID').AsString;
            DM1.cdsForPag.FieldByName('PVSNOMBRE').AsString := xApeNom;
            DM1.cdsForPag.FieldByName('PVSLDNIBEN').AsString := DM1.cdsDetCartas.FieldByName('DOCIDEBEN').AsString;
            DM1.cdsForPag.FieldByName('APEPATCOB').AsString := DM1.cdsDetCartas.FieldByName('APEPATBEN').AsString;
            DM1.cdsForPag.FieldByName('APEMATCOB').AsString := DM1.cdsDetCartas.FieldByName('APEMATBEN').AsString;
            DM1.cdsForPag.FieldByName('APECASCOB').AsString := DM1.cdsDetCartas.FieldByName('APECASBEN').AsString;
            DM1.cdsForPag.FieldByName('NOMCOB').AsString := DM1.cdsDetCartas.FieldByName('NOMBEN').AsString;
            DM1.cdsForPag.FieldByName('CODRELCOB').AsString := DM1.cdsDetCartas.FieldByName('TIPRELBEN').AsString;
            DM1.cdsForPag.FieldByName('APENOMTUT').AsString := Trim(DM1.cdsDetCartas.FieldByName('APEPATTUTBEN').AsString) + ' ' + Trim(DM1.cdsDetCartas.FieldByName('APEMATTUTBEN').AsString) + ' ' + Trim(DM1.cdsDetCartas.FieldByName('NOMTUTBEN').AsString);
            DM1.cdsForPag.FieldByName('APEPATTUT').AsString := DM1.cdsDetCartas.FieldByName('APEPATTUTBEN').AsString;
            DM1.cdsForPag.FieldByName('APEMATTUT').AsString := DM1.cdsDetCartas.FieldByName('APEMATTUTBEN').AsString;
            DM1.cdsForPag.FieldByName('NOMTUT').AsString := DM1.cdsDetCartas.FieldByName('NOMTUTBEN').AsString;
            DM1.cdsForPag.FieldByName('PORCENTAJE').AsString := DM1.cdsDetCartas.FieldByName('PORBEN').AsString;
            DM1.cdsForPag.FieldByName('DIRDOMCOB').AsString := DM1.cdsDetCartas.FieldByName('DIRBEN').AsString;
            DM1.cdsForPag.FieldByName('CODZIPCOB').AsString :=  DM1.cdsDetCartas.FieldByName('ZIPIDBEN').AsString;
            DM1.cdsForPag.FieldByName('TELFIJCOB').AsString :=  DM1.cdsDetCartas.FieldByName('TELFIJBEN').AsString;
            DM1.cdsForPag.FieldByName('TELMOVCOB').AsString :=  DM1.cdsDetCartas.FieldByName('TELMOVBEN').AsString;
            DM1.cdsForPag.FieldByName('EMAILCOB').AsString := DM1.cdsDetCartas.FieldByName('EMAILBEN').AsString;
            DM1.cdsForPag.Post;
            texto := '  A : ' + xApeNom;
            If DM1.cdsDetCartas.FieldByName('DOCIDEBEN').AsString <> '' Then
               texto := texto + '  [DNI.: ' + DM1.cdsDetCartas.FieldByName('DOCIDEBEN').AsString + ']';
            texto := texto + '  [' + DM1.DevuelveValor('TGE149', 'PARENABR', 'PARENID', DM1.cdsDetCartas.FieldByName('TIPRELBEN').AsString) + ']  [' + FloatToStrF(DM1.cdsDetCartas.FieldByName('PORBEN').AsFloat, ffNumber, 5, 2) + '%]';
            DM1.cdsForPag.Append;
            DM1.cdsForPag.FieldByName('DESC').AsString := texto;
            If montoCob < 0 Then montoCob := 0;
            DM1.cdsForPag.FieldByName('MONTO').AsFloat := montoCob;
            DM1.cdsForPag.FieldByName('PORCENTAJE').AsString := DM1.cdsDetCartas.FieldByName('PORBEN').AsString;
            DM1.cdsForPag.FieldByName('FORPAGID').AsString := DM1.cdsDetCartas.FieldByName('FORPAGOID').AsString;
            DM1.cdsForPag.FieldByName('BANCOID').AsString := DM1.cdsDetCartas.FieldByName('BANCOID').AsString;
            DM1.cdsForPag.FieldByName('AGENBCOID').AsString := DM1.cdsDetCartas.FieldByName('AGENBCOID').AsString;
            DM1.cdsForPag.FieldByName('PVSNOMBRE').AsString := xApeNom;
            DM1.cdsForPag.FieldByName('PVSLDNIBEN').AsString := DM1.cdsDetCartas.FieldByName('DOCIDEBEN').AsString;
            DM1.cdsForPag.FieldByName('APEPATCOB').AsString := DM1.cdsDetCartas.FieldByName('APEPATBEN').AsString;
            DM1.cdsForPag.FieldByName('APEMATCOB').AsString := DM1.cdsDetCartas.FieldByName('APEMATBEN').AsString;
            DM1.cdsForPag.FieldByName('APECASCOB').AsString := DM1.cdsDetCartas.FieldByName('APECASBEN').AsString;
            DM1.cdsForPag.FieldByName('NOMCOB').AsString := DM1.cdsDetCartas.FieldByName('NOMBEN').AsString;
            DM1.cdsForPag.FieldByName('CODRELCOB').AsString := DM1.cdsDetCartas.FieldByName('TIPRELBEN').AsString;
            DM1.cdsForPag.FieldByName('APENOMTUT').AsString := Trim(DM1.cdsDetCartas.FieldByName('APEPATTUTBEN').AsString) + ' ' + Trim(DM1.cdsDetCartas.FieldByName('APEMATTUTBEN').AsString) + ' ' + Trim(DM1.cdsDetCartas.FieldByName('NOMTUTBEN').AsString);
            DM1.cdsForPag.FieldByName('APEPATTUT').AsString := DM1.cdsDetCartas.FieldByName('APEPATTUTBEN').AsString;
            DM1.cdsForPag.FieldByName('APEMATTUT').AsString := DM1.cdsDetCartas.FieldByName('APEMATTUTBEN').AsString;
            DM1.cdsForPag.FieldByName('NOMTUT').AsString := DM1.cdsDetCartas.FieldByName('NOMTUTBEN').AsString;
            If DM1.cdsDetCartas.FieldByName('FORPAGOID').AsString = '11' Then
            Begin
               DM1.cdsForPag.FieldByName('APENOMTUT').AsString := Trim(DM1.cdsDetCartas.FieldByName('APEPATTUTBEN').AsString) + ' ' + Trim(DM1.cdsDetCartas.FieldByName('APEMATTUTBEN').AsString) + ' ' + Trim(DM1.cdsDetCartas.FieldByName('NOMTUTBEN').AsString);
               DM1.cdsForPag.FieldByName('DOCIDETUT').AsString := DM1.cdsDetCartas.FieldByName('DOCIDETUT').AsString;
               DM1.cdsForPag.FieldByName('FECNACMEN').AsString := DM1.cdsDetCartas.FieldByName('FECNACBEN').AsString;
            End;
            DM1.cdsForPag.FieldByName('DIRDOMCOB').AsString := DM1.cdsDetCartas.FieldByName('DIRBEN').AsString;
            DM1.cdsForPag.FieldByName('CODZIPCOB').AsString :=  DM1.cdsDetCartas.FieldByName('ZIPIDBEN').AsString;
            DM1.cdsForPag.FieldByName('TELFIJCOB').AsString :=  DM1.cdsDetCartas.FieldByName('TELFIJBEN').AsString;
            DM1.cdsForPag.FieldByName('TELMOVCOB').AsString :=  DM1.cdsDetCartas.FieldByName('TELMOVBEN').AsString;
            DM1.cdsForPag.FieldByName('EMAILCOB').AsString := DM1.cdsDetCartas.FieldByName('EMAILBEN').AsString;
            DM1.cdsForPag.Post;
            DM1.cdsDetCartas.Next;
         End;
      End;
      // Guardando en la base de datos
      xSql := 'SELECT MAX(PVSLSEC) ITEMINICIAL  FROM PVS307 WHERE PVSLBENNR = '+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      item := DM1.cdsQry.FieldByName('ITEMINICIAL').AsInteger;
      DM1.cdsForPag.First;
      While Not DM1.cdsForPag.Eof Do
      Begin
         item := item + 1;
         // Tomando voucher para las libretas de ahorros y otras formas de pago
         If (DM1.cdsForPag.FieldByName('FORPAGID').AsString = '11') And (DM1.numeroVoucherLib = '') Then DM1.numeroVoucherLib := DM1.Gennumvou;
         If (DM1.cdsForPag.FieldByName('FORPAGID').AsString <> '11') Then DM1.numeroVoucher := DM1.Gennumvou;
         If DM1.cdsForPag.FieldByName('FORPAGID').AsString = '11' Then
            xVoucher := DM1.numeroVoucherLib
         Else
            xVoucher := DM1.numeroVoucher;
         If DM1.cdsForPag.FieldByName('PORCENTAJE').AsFloat = 0 Then
            xValor := 0
         Else
            xValor := DM1.cdsForPag.FieldByName('PORCENTAJE').AsFloat;
         xSql := 'INSERT INTO PVS307 (CIAID, PVSLBENNR, PVSLTIPBE,PVSLAGRID,PVSLSEC,PVSLCONCE,PVSLMONTO,USUARIO,FREG,'
            + ' HREG,PVSLNVOU,BANCOID, FORPAGOID, PVSLSALDO, PVSNOMBRE,FLGVOUCHER, AGENBCOID, PVSLDNIBEN, PVSLNCTA, APENOMTUT,'
            + ' DOCIDETUT, FECNACMEN, PORDES, APEPATTUT, APEMATTUT, NOMTUT, APEPATCOB, APEMATCOB, NOMCOB, CODRELCOB, DIRDOMCOB, CODZIPCOB, TELFIJCOB, TELMOVCOB, APECASCOB, EMAILCOB)'
            + ' VALUES (' + QuotedStr('02') + ',' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString) + ',' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLTIPBE').AsString)
            + ',' + QuotedStr('FPG') + ',' + IntToStr(item) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('DESC').AsString) + ',' + FloatToStr(DM1.cdsForPag.FieldByName('MONTO').AsFloat)
            + ',' + QuotedStr(DM1.wUsuario) + ', TO_CHAR(SYSDATE, ''DD/MM/YYYY''), SYSDATE, ' + QuotedStr(xVoucher) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('BANCOID').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('FORPAGID').AsString)
            + ',' + FloatToStr(DM1.cdsForPag.FieldByName('MONTO').AsFloat) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('PVSNOMBRE').AsString)
            + ',' + QuotedStr('S') + ',' + QuotedStr(DM1.cdsForPag.FieldByName('AGENBCOID').AsString) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('PVSLDNIBEN').AsString) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('PVSLNCTA').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('APENOMTUT').AsString) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('DOCIDETUT').AsString) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('FECNACMEN').AsString)
            + ',' + FloatToStr(xValor)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('APEPATTUT').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('APEMATTUT').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('NOMTUT').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('APEPATCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('APEMATCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('NOMCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('CODRELCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('DIRDOMCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('CODZIPCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('TELFIJCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('TELMOVCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('APECASCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('EMAILCOB').AsString)
            + ')';
         DM1.DCOM1.AppServer.EjecutaSQL(xSql);
         DM1.cdsForPag.Next;
         item := item + 1;
         If DM1.cdsForPag.FieldByName('PORCENTAJE').AsFloat = 0 Then
            xValor := 0
         Else
            xValor := DM1.cdsForPag.FieldByName('PORCENTAJE').AsFloat;
         xSql := 'INSERT INTO PVS307 (CIAID, PVSLBENNR, PVSLTIPBE,PVSLAGRID,PVSLSEC,PVSLCONCE,PVSLMONTO,USUARIO,FREG,'
            + ' HREG,PVSLNVOU,BANCOID, FORPAGOID, PVSLSALDO, PVSNOMBRE,FLGVOUCHER, AGENBCOID, PVSLDNIBEN, PVSLNCTA, APENOMTUT, DOCIDETUT, FECNACMEN, PORDES,'
            // Inicio: HPC_201807_PRE 
            // Se actualizan los campos marca de reprogramado, usuario y fecha de reprogramación 
            // + ' APEPATTUT, APEMATTUT, NOMTUT, APEPATCOB, APEMATCOB, NOMCOB, CODRELCOB, DIRDOMCOB, CODZIPCOB, TELFIJCOB, TELMOVCOB, APECASCOB, EMAILCOB)'
            + ' APEPATTUT, APEMATTUT, NOMTUT, APEPATCOB, APEMATCOB, NOMCOB, CODRELCOB, DIRDOMCOB, CODZIPCOB, TELFIJCOB, TELMOVCOB, APECASCOB, EMAILCOB, FLAREP, USUREP, FECREP)'
            // Fin: HPC_201807_PRE 
            + ' VALUES (' + QuotedStr('02') + ',' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString) + ',' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLTIPBE').AsString)
            + ',' + QuotedStr('FPG') + ',' + IntToStr(item) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('DESC').AsString) + ',' + FloatToStr(DM1.cdsForPag.FieldByName('MONTO').AsFloat)
            + ',' + QuotedStr(DM1.wUsuario) + ', TO_CHAR(SYSDATE, ''DD/MM/YYYY''), SYSDATE, ' + QuotedStr(xVoucher) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('BANCOID').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('FORPAGID').AsString)
            + ',' + FloatToStr(DM1.cdsForPag.FieldByName('MONTO').AsFloat) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('PVSNOMBRE').AsString)
            + ',' + QuotedStr('N') + ',' + QuotedStr(DM1.cdsForPag.FieldByName('AGENBCOID').AsString) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('PVSLDNIBEN').AsString) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('PVSLNCTA').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('APENOMTUT').AsString) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('DOCIDETUT').AsString) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('FECNACMEN').AsString)
            + ',' + FloatToStr(xValor)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('APEPATTUT').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('APEMATTUT').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('NOMTUT').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('APEPATCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('APEMATCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('NOMCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('CODRELCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('DIRDOMCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('CODZIPCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('TELFIJCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('TELMOVCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('APECASCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('EMAILCOB').AsString)
            // Inicio: HPC_201807_PRE 
            // Se actualizan los campos marca de reprogramado, usuario y fecha de reprogramación 
            + ',' + QuotedStr('S')
            + ',' + QuotedStr(DM1.wUsuario)
            + ', SYSDATE'
            // Fin: HPC_201807_PRE 
            + ')';
         DM1.DCOM1.AppServer.EjecutaSQL(xSql);

         If (DM1.cdsForPag.FieldByName('BANCOID').AsString = '03') And (DM1.cdsForPag.FieldByName('FORPAGID').AsString = '11') Then
         Begin
            xSql := 'INSERT INTO PVS308(ASOID, PVSLTIPBE, PVSLBENNR, DSGTREL, DSGAPEPAT, DSGAPEMAT, DSGNOMBR, DSGPORC, DSGMTOORI, DSGMTOLOC,'
            +' FLGENTLIB, FLGLIB, PVSEXPNRO, USUARIO, FREG, HREG, DSGFECPAGO, DSGTDNI, DSGTAPENOM, DSGTAPEPAT, DSGTAPEMAT, DSGTNOMBR, FECNACMEN,'
            +' DIRDOMCOB, CODZIPCOB, TELFIJCOB, TELMOVCOB)'
            +' VALUES ('+QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)
            +','+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLTIPBE').AsString)
            +','+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
            +','+QuotedStr('02')
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('APEPATCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('APEMATCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('NOMCOB').AsString)
            + ',' + FloatToStr(xValor)
            + ',' + DM1.cdsForPag.FieldByName('MONTO').AsString
            + ',' + DM1.cdsForPag.FieldByName('MONTO').AsString
            + ',' + QuotedStr('N')
            + ',' + QuotedStr('S')
            +','+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSEXPNRO').AsString)
            + ',' + QuotedStr(DM1.wUsuario)
            + ', TO_CHAR(SYSDATE, ''DD/MM/YYYY'')'
            +', SYSDATE'
            +', TO_CHAR(SYSDATE, ''DD/MM/YYYY'')'
            +','+QuotedStr(DM1.cdsForPag.FieldByName('DOCIDETUT').AsString)
            +','+QuotedStr(DM1.cdsForPag.FieldByName('APENOMTUT').AsString)
            +','+QuotedStr(DM1.cdsForPag.FieldByName('APEPATTUT').AsString)
            +','+QuotedStr(DM1.cdsForPag.FieldByName('APEMATTUT').AsString)
            +','+QuotedStr(DM1.cdsForPag.FieldByName('NOMTUT').AsString)
            +','+QuotedStr(DM1.cdsForPag.FieldByName('FECNACMEN').AsString)
            +','+QuotedStr(DM1.cdsForPag.FieldByName('DIRDOMCOB').AsString)
            +','+QuotedStr(DM1.cdsForPag.FieldByName('CODZIPCOB').AsString)
            +','+QuotedStr(DM1.cdsForPag.FieldByName('TELFIJCOB').AsString)
            +','+QuotedStr(DM1.cdsForPag.FieldByName('TELMOVCOB').AsString)+')';
            DM1.DCOM1.AppServer.EjecutaSQL(xSql);
         End;

         If (DM1.cdsForPag.FieldByName('MONTO').AsFloat > 0) And (DM1.cdsForPag.FieldByName('FORPAGID').AsString = '01') Then
         Begin
            xSql := 'INSERT INTO PVS_CHE_GEN_CAB(ASOID, PVSLBENNR, APENOMBEN, DOCIDEBEN, MONCHE, ESTCHE, PORDES, PVSNVOU, PVSLTIPBE, PVSLFECBE, BANCOID)'
               + ' VALUES (' + QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString) + ',' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('PVSNOMBRE').AsString)
               + ',' + QuotedStr(DM1.cdsForPag.FieldByName('PVSLDNIBEN').AsString) + ',' + FloatToStr(DM1.cdsForPag.FieldByName('MONTO').AsFloat) + ',' + QuotedStr('01') + ',' + FloatToStr(xValor)
               + ',' + QuotedStr(DM1.numeroVoucher) + ',' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLTIPBE').AsString) + ', TO_CHAR(SYSDATE, ''DD/MM/YYYY''),' + QuotedStr(DM1.cdsForPag.FieldByName('BANCOID').AsString) + ')';
            DM1.DCOM1.AppServer.EjecutaSQL(xSql);
         End;
         DM1.cdsForPag.Next;
      End;
      xSql := 'UPDATE PVS306 SET DIFERIDO = ''S'', FECDIFLIQ = TO_DATE(SYSDATE,''DD/MM/YYYY'') WHERE PVSLBENNR = '+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString);
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      xSql := 'UPDATE PVS307 SET FLAREP = ''S'', USUREP = '+QuotedStr(DM1.wUsuario)+', FECREP = SYSDATE WHERE PVSLBENNR = '+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
      +' AND PVSLAGRID = ''FPG'' AND FLGVOUCHER = ''N'' AND FLAEXT = ''S''';
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      FExtRepDes.actualizagrid;
      MessageDlg('Proceso de reprogramación ha concluido.', mtInformation, [mbOK], 0);
     btncerrar.OnClick(btncerrar);
   End;
end;

procedure TFreprogdesembolso.btncerrarClick(Sender: TObject);
begin
   Close;
end;


end.
