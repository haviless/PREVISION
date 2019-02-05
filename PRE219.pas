// Inicio Uso Estándares: 01/08/2011
// Unidad               : PRE219
// Formulario           : Fbeneficiarios
// Fecha de Creación    : 26/06/2017
// Autor                : Area de desarrollo de sistemas
// Objetivo             : Mantenimiento de beneficiarios a reprogramar
// Actualizaciones
// HPC_201705_PRE : Creación
Unit PRE219;

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, wwdblook, StdCtrls, Mask, wwdbdatetimepicker, Buttons, Wwdbdlg,
   ExtCtrls, dateutils, Wwdbigrd, Grids, Wwdbgrid;

Type
   TFbeneficiarios = Class(TForm)
      btnCerrar: TBitBtn;
    GroupBox1: TGroupBox;
    dbgbenrep: TwwDBGrid;
    dbgbInserta: TwwIButton;
    btnmostrarbeneficiario: TBitBtn;
    gbmanbeneficiarios: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lblbanco: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label12: TLabel;
    Label16: TLabel;
    Label24: TLabel;
    dblctiprel: TwwDBLookupCombo;
    dbdtpfecnac: TwwDBDateTimePicker;
    dblcidesex: TwwDBLookupCombo;
    dblcdforpagben: TwwDBLookupCombo;
    dblcdbancoben: TwwDBLookupCombo;
    pnlapepatben: TPanel;
    meapepatben: TMaskEdit;
    pnlapematben: TPanel;
    meapematben: TMaskEdit;
    pnlapenomben: TPanel;
    meapenomben: TMaskEdit;
    pnldestiprel: TPanel;
    medestiprel: TMaskEdit;
    pnldessex: TPanel;
    medessex: TMaskEdit;
    pnlpor: TPanel;
    mepor: TMaskEdit;
    pnlapepattut: TPanel;
    meapepattutben: TMaskEdit;
    pnlapemattut: TPanel;
    meapemattutben: TMaskEdit;
    pnlnomtut: TPanel;
    menomtutben: TMaskEdit;
    pnldnitut: TPanel;
    mednitutben: TMaskEdit;
    pnlforpagodes: TPanel;
    meforpagodes: TMaskEdit;
    pnldesban: TPanel;
    medesban: TMaskEdit;
    pnldirecciondesgna: TPanel;
    medireccionben: TMaskEdit;
    pnltelefonofijo: TPanel;
    metelefonofijoben: TMaskEdit;
    pnlmovil: TPanel;
    memovilben: TMaskEdit;
    dblcddptoid: TwwDBLookupComboDlg;
    dblcdProvincia: TwwDBLookupComboDlg;
    dblcddistritoben: TwwDBLookupComboDlg;
    Panel2: TPanel;
    medptodes: TMaskEdit;
    Panel1: TPanel;
    medistritodes: TMaskEdit;
    Panel3: TPanel;
    meprovinciades: TMaskEdit;
    pnldsgotrtiprel: TPanel;
    meotrtiprelben: TMaskEdit;
    pnlapecasben: TPanel;
    meapecasben: TMaskEdit;
    pnldni: TPanel;
    medniben: TMaskEdit;
    pnlemaildes: TPanel;
    meemailben: TMaskEdit;
    btneditarbeneficiario: TBitBtn;
    btnretirarbeneficiario: TBitBtn;
    btnactualizarbeneficiario: TBitBtn;
    btncancelar: TBitBtn;
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormActivate(Sender: TObject);
      Procedure dblcdbancobenChange(Sender: TObject);
      Procedure dblctiprelChange(Sender: TObject);
      Procedure dblcidesexChange(Sender: TObject);
      Procedure dbdtpfecnacExit(Sender: TObject);
      Procedure meporExit(Sender: TObject);
      Procedure dblctiprelExit(Sender: TObject);
      Procedure dblcdforpagbenExit(Sender: TObject);
      Procedure dblcdbancobenExit(Sender: TObject);
    procedure dblcddptoidChange(Sender: TObject);
    procedure dblcddptoidExit(Sender: TObject);
    procedure dblcdProvinciaChange(Sender: TObject);
    procedure dblcdProvinciaExit(Sender: TObject);
    procedure dblcddistritobenExit(Sender: TObject);
    procedure memovilbenKeyPress(Sender: TObject; var Key: Char);
    procedure meemailbenExit(Sender: TObject);
    procedure memovilbenExit(Sender: TObject);
    procedure dbgbInsertaClick(Sender: TObject);
    procedure btneditarbeneficiarioClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure btnretirarbeneficiarioClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnactualizarbeneficiarioClick(Sender: TObject);
    procedure dbgbenrepDblClick(Sender: TObject);
    procedure btnmostrarbeneficiarioClick(Sender: TObject);
    procedure mednibenKeyPress(Sender: TObject; var Key: Char);
   Private
    procedure insertabeneficiarios;
    procedure llenabeneficiarios;
    procedure limpiabeneficiarios;
   Public
       procedure actualizagridbeneficiarios;
   End;

Var
   Fbeneficiarios: TFbeneficiarios;

Implementation

Uses PREDM, PRE265;

{$R *.dfm}

Procedure TFbeneficiarios.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If Key = #13 Then
   Begin
      Key := #0;
      Perform(CM_DIALOGKEY, VK_TAB, 0);
   End;
End;

Procedure TFbeneficiarios.FormActivate(Sender: TObject);
Var
   xSql: String;
Begin
   insertabeneficiarios;
   actualizagridbeneficiarios;
   If DM1.cdsDetCartas.RecordCount = 0 Then
      btnmostrarbeneficiario.Enabled := False
   Else
      btnmostrarbeneficiario.Enabled := True;

   btneditarbeneficiario.Enabled := False;
   btnretirarbeneficiario.Enabled := False;
   btnactualizarbeneficiario.Enabled := False;
   btncancelar.Enabled := True;
   btnCerrar.Enabled := False;

   xSql := 'SELECT ID, '' ''||UPPER(DESCRIP) DESCRIP FROM TGE817';
   DM1.cdsSexo.Close;
   DM1.cdsSexo.DataRequest(xSQL);
   DM1.cdsSexo.Open;
   dblcidesex.Selected.Clear;
   dblcidesex.Selected.Add('ID'#9'1'#9'Código'#9#9);
   dblcidesex.Selected.Add('DESCRIP'#9'25'#9'Descripción'#9#9);

   xSql := 'SELECT PARENID, PARENDES FROM TGE149 ORDER BY PARENID';
   DM1.cdsTRelacion.Close;
   DM1.cdsTRelacion.DataRequest(xSql);
   DM1.cdsTRelacion.Open;
   dblctiprel.Selected.Clear;
   dblctiprel.Selected.Add('PARENID'#9'2'#9'Código'#9#9);
   dblctiprel.Selected.Add('PARENDES'#9'25'#9'Descripción'#9#9);

   xSql := 'SELECT DPTOID, DPTODES FROM APO158 ORDER BY DPTOID';
   DM1.cdsDpto.Close;
   DM1.cdsDpto.DataRequest(xSql);
   DM1.cdsDpto.Open;
   dblcddptoid.Selected.Clear;
   dblcddptoid.Selected.Add('DPTOID'#9'2'#9'Código'#9#9);
   dblcddptoid.Selected.Add('DPTODES'#9'25'#9'Descripción'#9#9);

   xSql := 'SELECT TIPDESEID, TIPDESEDES, FLACOBPRE FROM CRE104 WHERE NVL(FLAVIGPRE, ''X'') = ''S'' AND TIPDESEID<>''19''  ORDER BY TIPDESEID';
   DM1.cdsFPago.Close;
   DM1.cdsFPago.DataRequest(xSql);
   DM1.cdsFPago.Open;
   dblcdforpagben.Selected.Clear;
   dblcdforpagben.Selected.Add('TIPDESEID'#9'2'#9'Código'#9#9);
   dblcdforpagben.Selected.Add('TIPDESEDES'#9'25'#9'Descripción'#9#9);

   xSql := 'SELECT BANCOID, BANCONOM FROM TGE105 WHERE BANCOID IN (''04'', ''03'')';
   DM1.cdsBanco.Close;
   DM1.cdsBanco.DataRequest(xSql);
   DM1.cdsBanco.Open;
   dblcdbancoben.Selected.Clear;
   dblcdbancoben.Selected.Add('BANCOID'#9'2'#9'Código'#9#9);
   dblcdbancoben.Selected.Add('BANCONOM'#9'25'#9'Descripción'#9#9);
End;


Procedure TFbeneficiarios.dblcdbancobenChange(Sender: TObject);
Begin
   If Trim(dblcdbancoben.Text) = '' Then medesban.Text := '';
   If Length(dblcdbancoben.Text) = 2 Then
   Begin
      If DM1.cdsBanco.Locate('BANCOID', dblcdbancoben.Text, []) Then
      Begin
         medesban.Text := DM1.cdsBanco.FieldByName('BANCONOM').AsString;
      End
      Else
      Begin
         MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
         dblcdbancoben.Text := '';
         medesban.Text := '';
      End;
   End;
End;


Procedure TFbeneficiarios.dblctiprelChange(Sender: TObject);
Begin
   If dblctiprel.Text = '16' Then pnldsgotrtiprel.Enabled := True Else pnldsgotrtiprel.Enabled := False;
   dblcdforpagben.Text := '';
   If Trim(dblctiprel.Text) = '' Then
   Begin
      dblctiprel.Text := '';
      medestiprel.Text := '';
   End;
   If Length(dblctiprel.Text) = 2 Then
   Begin
      If DM1.cdsTRelacion.Locate('PARENID', dblctiprel.Text, []) Then
      Begin
         medestiprel.Text := DM1.cdsTRelacion.FieldByName('PARENDES').AsString;
         If dblctiprel.Text = '02' Then
         Begin
            medniben.Text := '';
            pnlapepattut.Enabled := True;
            pnlapemattut.Enabled := True;
            pnlnomtut.Enabled := True;
            pnldnitut.Enabled := True;
            pnldni.Enabled := False;
            meapepattutben.Color := clWhite;
            meapemattutben.Color := clWhite;
            menomtutben.Color := clWhite;
            mednitutben.Color := clWhite;
            medniben.Color := clInfoBk;
            medniben.Text := '';
         End
         Else
         Begin
            pnlapepattut.Enabled := False;
            pnlapemattut.Enabled := False;
            pnlnomtut.Enabled := False;
            pnldnitut.Enabled := False;
            pnldni.Enabled := True;
            meapepattutben.Color := clInfoBk;
            meapemattutben.Color := clInfoBk;
            menomtutben.Color := clInfoBk;
            mednitutben.Color := clInfoBk;
            medniben.Color := clWhite;
            meapepattutben.Text := '';
            meapemattutben.Text := '';
            menomtutben.Text := '';
            mednitutben.Text := '';
         End;
      End
      Else
      Begin
         MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
         dblctiprel.Text := '';
         medestiprel.Text := '';
         dblctiprel.SetFocus;
      End;
   End;
End;

Procedure TFbeneficiarios.dblcidesexChange(Sender: TObject);
Begin
   If Trim(dblcidesex.Text) = '' Then medessex.Text := '';
   If Length(dblcidesex.Text) = 1 Then
   Begin
      If DM1.cdsSexo.Locate('ID', dblcidesex.Text, []) Then
      Begin
         medessex.Text := DM1.cdsSexo.FieldByName('DESCRIP').AsString;
      End
      Else
      Begin
         MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
         dblcidesex.Text := '';
         medessex.Text := '';
      End;
   End;
End;





Procedure TFbeneficiarios.dbdtpfecnacExit(Sender: TObject);
Var
   edad: Double;
Begin
   If Trim(dbdtpfecnac.Text) = '' Then Exit;
   If (dbdtpfecnac.Date > DM1.FechaSys) Then
   Begin
      MessageDlg('Fecha de nacimiento mayor a la fecha actual', mtInformation, [mbOk], 0);
      dbdtpfecnac.SetFocus;
      Exit;
   End;
   edad := DM1.CalculaEdad(dbdtpfecnac.Text, DateToStr(DM1.FechaSys));
   If dblctiprel.Text = '02' Then
   Begin
      If edad >= 18 Then
      Begin
         MessageDlg('Beneficiario mayor de edad', mtInformation, [mbOk], 0);
         dbdtpfecnac.SetFocus;
         Exit;
      End;
   End
   Else
   Begin
      If (edad < 18) Then
      Begin
         If (dblctiprel.Text <> '15') And (dblctiprel.Text <> '16') Then
         Begin
            MessageDlg('Beneficiario es menor de edad', mtInformation, [mbOk], 0);
            dbdtpfecnac.SetFocus;
            Exit;
         End;
      End;
   End;

   If (dblctiprel.Text = '02') Or ((dblctiprel.Text = '15') And (edad < 18)) Or ((dblctiprel.Text = '16') And (edad < 18)) Then
   Begin
      dblcdforpagben.Text := '11';
      pnldni.Enabled := False;
      medniben.Color := clInfoBk;
      medniben.Text := '';
      pnlapepattut.Enabled := True;
      meapepattutben.Color := clWhite;
      pnlapemattut.Enabled := True;
      meapemattutben.Color := clWhite;
      pnlnomtut.Enabled := True;
      menomtutben.Color := clWhite;
      pnldnitut.Enabled := True;
      mednitutben.Color := clWhite;
   End
   Else
   Begin
      If Trim(dblcdforpagben.Text) = '' Then dblcdforpagben.Text := '16';
      pnldni.Enabled := True;
      medniben.Color := clWhite;
      pnlapepattut.Enabled := False;
      meapepattutben.Color := clInfoBk;
      meapepattutben.Text := '';
      pnlapemattut.Enabled := False;
      meapemattutben.Color := clInfoBk;
      meapemattutben.Text := '';
      pnlnomtut.Enabled := False;
      menomtutben.Color := clInfoBk;
      menomtutben.Text := '';
      pnldnitut.Enabled := False;
      mednitutben.Color := clInfoBk;
      mednitutben.Text := '';
   End;
End;

Procedure TFbeneficiarios.meporExit(Sender: TObject);
Begin
   If DM1.Valores(mepor.Text) = 0 Then
      mepor.SetFocus
   Else
   Begin
      mepor.Text := DM1.FormatoNumeros(mepor.Text);
   End;
   If StrToFloat(FloatToStr(DM1.Valores(mepor.Text))) > 100 Then
   Begin
      MessageDlg('El porcentaje no puede ser mayor a 100', mtInformation, [mbOk], 0);
      mepor.SetFocus;
   End;
End;

Procedure TFbeneficiarios.dblctiprelExit(Sender: TObject);
Var
   xSql: String;
Begin
   If Trim(dblctiprel.Text) <> '' Then
   Begin
      xSql := 'SELECT * FROM TGE149 WHERE PARENID = ' + QuotedStr(dblctiprel.Text);
      If DM1.verificaexiste(xSql) = False Then
      Begin
         MessageDlg('Código de tipo de relación no valido', mtInformation, [mbOk], 0);
         dblctiprel.Text := '';
         dblctiprel.SetFocus;
         Exit;
      End;
   End;
End;

Procedure TFbeneficiarios.dblcdforpagbenExit(Sender: TObject);
Var
   xSql: String;
Begin
   If DM1.cdsFPago.Locate('TIPDESEID', dblcdforpagben.Text, []) Then
   Begin
      If DM1.cdsFPago.FieldByName('FLACOBPRE').AsString = 'B' Then
         xSql := 'SELECT BANCOID, BANCONOM FROM TGE105 WHERE FLAVIGPRE = ''S'' AND CLAUXID = ''B'''
      Else
         xSql := 'SELECT BANCOID, BANCONOM FROM TGE105 WHERE FLAVIGPRE = ''S'' AND CLAUXID = ''C''';
      DM1.cdsBanco.Close;
      DM1.cdsBanco.DataRequest(xSql);
      DM1.cdsBanco.Open;
      dblcdbancoben.Selected.Clear;
      dblcdbancoben.Selected.Add('BANCOID'#9'2'#9'Código'#9#9);
      dblcdbancoben.Selected.Add('BANCONOM'#9'25'#9'Descripción'#9#9);
      meforpagodes.Text := DM1.cdsFPago.FieldByName('TIPDESEDES').AsString;
      lblbanco.Visible := True;
      dblcdbancoben.Visible := True;
      pnldesban.Visible := True;
      If (dblcdforpagben.Text = '01') Or (dblcdforpagben.Text = '11') Or (dblcdforpagben.Text = '16') Then dblcdbancoben.Text := '03';
      If dblcdforpagben.Text = '05' Then dblcdbancoben.Text := '04';
      If dblcdforpagben.Text = '06' Then dblcdbancoben.Text := '04';
      If dblcdforpagben.Text = '19' Then
      Begin
         dblcdbancoben.Text := '15';
      End;
   End
   Else
   Begin
      MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
      dblcdforpagben.Text := '';
      meforpagodes.Text := '';
   End;
End;

Procedure TFbeneficiarios.dblcdbancobenExit(Sender: TObject);
Var
   xSql: String;
Begin
   If Trim(dblcdbancoben.Text) <> '' Then
   Begin
      xSql := 'SELECT * FROM TGE105 WHERE BANCOID = ' + QuotedStr(dblcdbancoben.Text);
      If DM1.verificaexiste(xSql) = False Then
      Begin
         MessageDlg('Código de banco no valido', mtInformation, [mbOk], 0);
         dblcdbancoben.Text := '';
         dblcdbancoben.SetFocus;
         Exit;
      End;
   End;
End;

procedure TFbeneficiarios.dblcddptoidExit(Sender: TObject);
Var xSql:String;
begin
   If Length(trim(dblcddptoid.Text)) = 2 Then
   Begin
      If DM1.cdsDpto.Locate('DPTOID',VarArrayof([dblcddptoid.text]),[]) Then
      Begin
         medptodes.Text := DM1.cdsDpto.FieldByName('DPTODES').AsString;
         xSql := 'SELECT CIUDID, CIUDDES FROM APO123 WHERE DPTOID = '+QuotedStr(dblcddptoid.Text)+' ORDER BY CIUDID';
         DM1.cdsProvincia.Close;
         DM1.cdsProvincia.DataRequest(xSql);
         DM1.cdsProvincia.Open;
         dblcdProvincia.Selected.Clear;
         dblcdProvincia.Selected.Add('CIUDID'#9'4'#9'Ubigeo'#9#9);
         dblcdProvincia.Selected.Add('CIUDDES'#9'23'#9'Provincia'#9#9);
      End
      Else
      Begin
         dblcddptoid.Text    := '';
         medptodes.Text      := '';
         dblcdProvincia.Text := '';
         meprovinciades.Text := '';
         dblcddistritoben.Text  := '';
         medistritodes.Text  := '';
         MessageDlg('Código errado', mtError, [mbOk], 0);
         dblcddptoid.SetFocus;
      End;
   End
   Else
   Begin
      dblcddptoid.Text    := '';
      medptodes.Text      := '';
      dblcdProvincia.Text := '';
      meprovinciades.Text := '';
      dblcddistritoben.Text  := '';
      medistritodes.Text  := '';
      MessageDlg('Código errado', mtError, [mbOk], 0);
   End;
end;

procedure TFbeneficiarios.dblcdProvinciaExit(Sender: TObject);
Var xSql:String;
begin
  If Length(trim(dblcdProvincia.Text)) = 4 Then
  Begin
     If DM1.cdsProvincia.Locate('CIUDID',VarArrayof([dblcdProvincia.text]),[]) Then
     Begin
        meprovinciades.Text := DM1.cdsProvincia.FieldByName('CIUDDES').AsString;
        xSql := 'SELECT ZIPID, ZIPDES FROM APO122 WHERE CIUDID = '+QuotedStr(dblcdProvincia.Text)+' ORDER BY ZIPID';
        DM1.cdsDist.Close;
        DM1.cdsDist.DataRequest(xSql);
        DM1.cdsDist.Open;
        dblcddistritoben.Selected.Clear;
        dblcddistritoben.Selected.Add('ZIPID'#9'6'#9'Ubigeo'#9#9);
        dblcddistritoben.Selected.Add('ZIPDES'#9'23'#9'Distrito'#9#9);
     End
     Else
     Begin
        dblcdProvincia.Text := '';
        meprovinciades.Text := '';
        MessageDlg('Código errado', mtError, [mbOk], 0);
        dblcdProvincia.SetFocus;
     End;
  End
  Else
  Begin
     dblcdProvincia.Text := '';
     meprovinciades.Text := '';
     MessageDlg('Código errado', mtError, [mbOk], 0);
  End;
end;

procedure TFbeneficiarios.dblcddistritobenExit(Sender: TObject);
begin
   If Length(trim(dblcddistritoben.Text)) = 6 Then
  Begin
    If DM1.cdsDist.Locate('ZIPID',VarArrayof([dblcddistritoben.text]),[]) Then
    Begin
      medistritodes.Text := DM1.cdsDist.FieldByName('ZIPDES').AsString;
    End
    Else
    Begin
      medistritodes.Text := '';
      dblcddistritoben.Text := '';
      MessageDlg('Código errado', mtError, [mbOk], 0);
      dblcddistritoben.SetFocus;
    End;
  End
  Else
  Begin
    dblcddistritoben.Text := '';
    medistritodes.Text := '';
    MessageDlg('Código errado', mtError, [mbOk], 0);
  End;
end;

procedure TFbeneficiarios.dblcddptoidChange(Sender: TObject);
begin
  dblcdProvincia.Text := '';
  meprovinciades.Text := '';
  dblcddistritoben.Text  := '';
  medistritodes.Text  := '';
end;

procedure TFbeneficiarios.dblcdProvinciaChange(Sender: TObject);
begin
  dblcddistritoben.Text := '';
  medistritodes.Text := '';
end;

procedure TFbeneficiarios.memovilbenKeyPress(Sender: TObject; var Key: Char);
begin
   If Not (Key In ['0'..'9','.',#8]) Then
   Begin
      Key:=#0;
      MessageDlg('Introduzca solo números.', mtError, [mbOk], 0);
   End;
end;

procedure TFbeneficiarios.meemailbenExit(Sender: TObject);
Var xSql:String;
begin
   If Trim(meemailben.Text) <> '' Then
   Begin
      xSql := 'SELECT SF_ASO_VALIDA_DIR_CORREO('+QuotedStr(Trim(meemailben.Text))+') VALOR FROM DUAL';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      If DM1.cdsQry.FieldByName('VALOR').AsInteger <> 0 Then
      Begin
         MessageDlg('Email no valido, o debe dejar en blanco.', mtInformation, [mbOk], 0);
         meemailben.SetFocus;
      End;
   End;
end;

procedure TFbeneficiarios.memovilbenExit(Sender: TObject);
begin
  If Copy(Trim(memovilben.Text),1,1) <> '9' Then
  Begin
    MessageDlg('Número de celular debe empezar con 9.', mtError, [mbOk], 0);
    memovilben.SetFocus;
    Exit;
  End;
  If Length(Trim(memovilben.Text)) <> 9 Then
  Begin
    MessageDlg('Número de celular debe contener 9 dígitos.', mtError, [mbOk], 0);
    memovilben.SetFocus;
    Exit;
  End;
end;

procedure TFbeneficiarios.actualizagridbeneficiarios;
Var xSql:String;
begin
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
   dbgbenrep.Selected.Clear;
   dbgbenrep.Selected.Add('APENOMBEN'#9'42'#9'Apellidos y nombre(s)~del beneficiario'#9#9);
   dbgbenrep.Selected.Add('PARENDES'#9'22'#9'Parentesco'#9#9);
   dbgbenrep.Selected.Add('BANCONOM'#9'22'#9'Banco de~desembolso'#9#9);
   dbgbenrep.Selected.Add('TIPDESEDES'#9'22'#9'Forma de~desembolso'#9#9);
   dbgbenrep.Selected.Add('PORBEN'#9'22'#9'Porcentaje'#9#9);
   dbgbenrep.ApplySelected;
end;

procedure TFbeneficiarios.dbgbInsertaClick(Sender: TObject);
begin
   DM1.xSgr := 'I';
   gbmanbeneficiarios.Visible := True;
   gbmanbeneficiarios.Enabled := True;
   limpiabeneficiarios;
   meapepatben.SetFocus;
   btnactualizarbeneficiario.Enabled := True;
end;

procedure TFbeneficiarios.llenabeneficiarios;
Var xSql:String;
begin
   meapepatben.Text       := DM1.cdsDetCartas.FieldByName('APEPATBEN').AsString;
   meapematben.Text       := DM1.cdsDetCartas.FieldByName('APEMATBEN').AsString;
   meapenomben.Text       := DM1.cdsDetCartas.FieldByName('NOMBEN').AsString;
   meapecasben.Text       := DM1.cdsDetCartas.FieldByName('APECASBEN').AsString;
   dblctiprel.Text        := DM1.cdsDetCartas.FieldByName('TIPRELBEN').AsString;
   meotrtiprelben.Text    := DM1.cdsDetCartas.FieldByName('OTRTIPRELBEN').AsString;
   dbdtpfecnac.Date       := DM1.cdsDetCartas.FieldByName('FECNACBEN').AsDateTime;
   dblcidesex.Text        := DM1.cdsDetCartas.FieldByName('SEXBEN').AsString;
   medniben.Text             := DM1.cdsDetCartas.FieldByName('DOCIDEBEN').AsString;
   mepor.Text             := FloatToStr(DM1.cdsDetCartas.FieldByName('PORBEN').AsFloat);
   meapepattutben.Text       := DM1.cdsDetCartas.FieldByName('APEPATTUTBEN').AsString;
   meapemattutben.Text       := DM1.cdsDetCartas.FieldByName('APEMATTUTBEN').AsString;
   menomtutben.Text          := DM1.cdsDetCartas.FieldByName('NOMTUTBEN').AsString;
   mednitutben.Text          := DM1.cdsDetCartas.FieldByName('DOCIDETUT').AsString;
   dblcdforpagben.Text        := DM1.cdsDetCartas.FieldByName('FORPAGOID').AsString;
   meemailben.Text        := DM1.cdsDetCartas.FieldByName('EMAILBEN').AsString;
   medireccionben.Text := DM1.cdsDetCartas.FieldByName('DIRBEN').AsString;
   dblcddptoid.Text       := Copy(DM1.cdsDetCartas.FieldByName('ZIPIDBEN').AsString,1,2);
   medptodes.Text         := DM1.DevuelveValor('APO158', 'DPTODES', 'DPTOID', dblcddptoid.Text);
   dblcdProvincia.Text    := Copy(DM1.cdsDetCartas.FieldByName('ZIPIDBEN').AsString,1,4);
   meprovinciades.Text    :=  DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', dblcdProvincia.Text);
   dblcdDistritoben.Text     := DM1.cdsDetCartas.FieldByName('ZIPIDBEN').AsString;
   medistritodes.Text     :=  DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', dblcddistritoben.Text);
   metelefonofijoben.Text    := DM1.cdsDetCartas.FieldByName('TELFIJBEN').AsString;
   memovilben.Text           := DM1.cdsDetCartas.FieldByName('TELMOVBEN').AsString;
   meforpagodes.Text := DM1.DevuelveValor('CRE104', 'TIPDESEDES', 'TIPDESEID', dblcdforpagben.Text);
   If DM1.cdsFPago.Locate('TIPDESEID', dblcdforpagben.Text, []) Then
   Begin
      xSql := 'SELECT BANCOID, BANCONOM FROM TGE105 WHERE FLAVIGPRE = ''S'' AND CLAUXID = ' + QuotedStr(DM1.cdsFPago.FieldByName('FLACOBPRE').AsString);
      DM1.cdsBanco.Close;
      DM1.cdsBanco.DataRequest(xSql);
      DM1.cdsBanco.Open;
   End;
   dblcdbancoben.Text := DM1.cdsDetCartas.FieldByName('BANCOID').AsString;


end;

procedure TFbeneficiarios.btneditarbeneficiarioClick(Sender: TObject);
begin
   dbgbenrep.Enabled := False;
   DM1.xSgr := 'M';
   gbmanbeneficiarios.Visible := True;
   gbmanbeneficiarios.Enabled := True;
   llenabeneficiarios;
   dbgbenrep.Enabled := False;
   meapepatben.SetFocus;

   btnmostrarbeneficiario.Enabled := False;
   btneditarbeneficiario.Enabled := False;
   btnretirarbeneficiario.Enabled := False;
   btnactualizarbeneficiario.Enabled := True;
   btncancelar.Enabled := True;
   btnCerrar.Enabled := False;

end;

procedure TFbeneficiarios.limpiabeneficiarios;
begin
   meapepatben.Text := '';
   meapematben.Text := '';
   meapecasben.Text := '';
   meapenomben.Text := '';
   dblctiprel.Text := '';
   medestiprel.Text := '';
   meotrtiprelben.Text := '';
   dbdtpfecnac.Text := '';
   medniben.Text := '';
   dblcidesex.Text := '';
   mepor.Text := '';
   medireccionben.Text := '';
   dblcddptoid.Text := '';
   medptodes.Text := '';
   dblcdProvincia.Text := '';
   meprovinciades.Text := '';
   dblcddistritoben.Text := '';
   medistritodes.Text := '';
   metelefonofijoben.Text := '';
   memovilben.Text := '';
   meemailben.Text := '';
   meapepattutben.Text := '';
   meapemattutben.Text := '';
   menomtutben.Text := '';
   mednitutben.Text := '';
   dblcdforpagben.Text := '';
   meforpagodes.Text := '';
   dblcdbancoben.Text := '';
   medesban.Text := '';
end;

procedure TFbeneficiarios.btncancelarClick(Sender: TObject);
begin
   dbgbenrep.Enabled := True;
   limpiabeneficiarios;
   gbmanbeneficiarios.Enabled := False;
   gbmanbeneficiarios.Visible := False;
   btneditarbeneficiario.Enabled := False;

   If DM1.cdsDetCartas.RecordCount = 0 Then btnmostrarbeneficiario.Enabled := False
   Else btnmostrarbeneficiario.Enabled := True;
   btneditarbeneficiario.Enabled := False;
   btnretirarbeneficiario.Enabled := False;
   btnactualizarbeneficiario.Enabled := False;
   btncancelar.Enabled := False;
   btnCerrar.Enabled := True;
end;

procedure TFbeneficiarios.btnretirarbeneficiarioClick(Sender: TObject);
Var xSql:String;
begin
   If MessageDlg('¿ Seguro de retirar el registro de beneficiario ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
      xSql := 'DELETE FROM PRE_REP_DES_MOV WHERE ASOID = '+QuotedStr(DM1.cdsDetCartas.FieldByName('ASOID').AsString)
      +' AND PVSLBENNR = '+QuotedStr(DM1.cdsDetCartas.FieldByName('PVSLBENNR').AsString)
      +' AND FECNACBEN = '+QuotedStr(DM1.cdsDetCartas.FieldByName('FECNACBEN').AsString)
      +' AND APEPATBEN = '+QuotedStr(DM1.cdsDetCartas.FieldByName('APEPATBEN').AsString)
      +' AND APEMATBEN = '+QuotedStr(DM1.cdsDetCartas.FieldByName('APEMATBEN').AsString)
      +' AND NOMBEN = '+QuotedStr(DM1.cdsDetCartas.FieldByName('NOMBEN').AsString);
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      actualizagridbeneficiarios;
      limpiabeneficiarios;
      MessageDlg('Registro de beneficiario fue retirado.', mtInformation, [mbOk], 0);

      If DM1.cdsDetCartas.RecordCount = 0 Then
         btnmostrarbeneficiario.Enabled := False
      Else
         btnmostrarbeneficiario.Enabled := True;
      btneditarbeneficiario.Enabled := False;
      btnretirarbeneficiario.Enabled := False;
      btnactualizarbeneficiario.Enabled := False;
      btncancelar.Enabled := True;
      btnCerrar.Enabled := False;
      gbmanbeneficiarios.Visible := False;
   End;
end;

procedure TFbeneficiarios.btnCerrarClick(Sender: TObject);
begin
   Close;
end;

procedure TFbeneficiarios.btnactualizarbeneficiarioClick(Sender: TObject);
Var xSql:String;
begin
   If Trim(meapepatben.Text) = '' Then
   Begin
     MessageDlg('Debe registrar el apellido paterno del beneficiario.', mtInformation, [mbOk], 0);
     meapepatben.SetFocus;
     Exit;
   End;
   If Trim(meapematben.Text) = '' Then
   Begin
     MessageDlg('Debe registrar el apellido materno del beneficiario.', mtInformation, [mbOk], 0);
     meapematben.SetFocus;
     Exit;
   End;
   If Trim(meapenomben.Text) = '' Then
   Begin
     MessageDlg('Debe registrar el nombre del beneficiario.', mtInformation, [mbOk], 0);
     meapenomben.SetFocus;
     Exit;
   End;
   If Trim(dblctiprel.Text) = '' Then
   Begin
     MessageDlg('Debe registrar el tipo de relación del beneficiario.', mtInformation, [mbOk], 0);
     dblctiprel.SetFocus;
     Exit;
   End;
   If dblctiprel.Text = '16' Then
   Begin
      If Trim(meotrtiprelben.Text) = '' Then
      Begin
         MessageDlg('Debe registrar la descripción del otro tipo de relación.', mtInformation, [mbOk], 0);
         meotrtiprelben.SetFocus;
         Exit;
      End;
   End;
   If Trim(dbdtpfecnac.Text) = '' Then
   Begin
     MessageDlg('Debe registrar la fecha de nacimiento del beneficiario.', mtInformation, [mbOk], 0);
     dbdtpfecnac.SetFocus;
     Exit;
   End;
   If dblctiprel.Text <> '02' Then
   Begin
      If Trim(medniben.Text) = '' Then
      Begin
         MessageDlg('Debe registrar el documento de identidad del beneficiario.', mtInformation, [mbOk], 0);
         medniben.SetFocus;
         Exit;
      End;
      If Length(Trim(medniben.Text)) <> 8 Then
      Begin
         MessageDlg('Número de DNI debe ser de 8 digitos.', mtInformation, [mbOk], 0);
         medniben.SetFocus;
         Exit;
      End;
   End;
   If Trim(dblcidesex.Text) = '' Then
   Begin
     MessageDlg('Debe registrar el sexo del beneficiario.', mtInformation, [mbOk], 0);
     dblcidesex.SetFocus;
     Exit;
   End;
   If Trim(mepor.Text) = '' Then
   Begin
     MessageDlg('Debe de registrar el porcentaje a pagar al beneficiario.', mtInformation, [mbOk], 0);
     mepor.SetFocus;
     Exit;
   End;
   If Trim(medireccionben.Text) = '' Then
   Begin
     MessageDlg('Debe registrar la dirección del beneficiario.', mtInformation, [mbOk], 0);
     medireccionben.SetFocus;
     Exit;
   End;
   If Trim(dblcddptoid.Text) = '' Then
   Begin
     MessageDlg('Debe registrar el código de departamento domiciliario del beneficiario.', mtInformation, [mbOk], 0);
     dblcddptoid.SetFocus;
     Exit;
   End;
   If Trim(dblcdProvincia.Text) = '' Then
   Begin
     MessageDlg('Debe registrar el código de provincia domiciliario del beneficiario.', mtInformation, [mbOk], 0);
     dblcdProvincia.SetFocus;
     Exit;
   End;
   If Trim(dblcddistritoben.Text) = '' Then
   Begin
     MessageDlg('Debe registrar el código de distrito domiciliario del beneficiario.', mtInformation, [mbOk], 0);
     dblcddistritoben.SetFocus;
     Exit;
   End;
   If dblctiprel.Text = '02' Then
   Begin
      If Trim(meapepattutben.Text) = '' Then
      Begin
         MessageDlg('Debe registrar el apellido paterno del tutor del beneficiario.', mtInformation, [mbOk], 0);
         meapepattutben.SetFocus;
         Exit;
      End;
      If Trim(meapemattutben.Text) = '' Then
      Begin
         MessageDlg('Debe registrar el apellido materno del tutor del beneficiario.', mtInformation, [mbOk], 0);
        meapemattutben.SetFocus;
        Exit;
      End;
      If Trim(menomtutben.Text) = '' Then
      Begin
         MessageDlg('Debe registrar el nombre del tutor del beneficiario.', mtInformation, [mbOk], 0);
         menomtutben.SetFocus;
         Exit;
      End;
      If Trim(mednitutben.Text) = '' Then
      Begin
         MessageDlg('Debe registrar el DNI del tutor del beneficiario.', mtInformation, [mbOk], 0);
         mednitutben.SetFocus;
         Exit;
      End;
   End;
   If Trim(dblcdforpagben.Text) = '' Then
   Begin
      MessageDlg('Debe registrar la forma de pago al beneficiario.', mtInformation, [mbOk], 0);
      dblcdforpagben.SetFocus;
      Exit;
   End;
   If Trim(dblcdbancoben.Text) = '' Then
   Begin
      MessageDlg('Debe registrar el banco de la forma de pago al beneficiario.', mtInformation, [mbOk], 0);
      dblcdbancoben.SetFocus;
      Exit;
   End;

   If DM1.xSgr = 'I' Then
   Begin
      If MessageDlg('¿ Seguro de insertar un nuevo registro de beneficiario ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         xSql := 'INSERT INTO PRE_REP_DES_MOV (ASOID, PVSLBENNR, TIPBEN, TIPRELBEN, APEPATBEN, APEMATBEN, APECASBEN, NOMBEN, TIPDOCIDEBEN,'
         +' DOCIDEBEN, FECNACBEN, SEXBEN, PORBEN, FORPAGOID, BANCOID, DIRBEN, ZIPIDBEN, TELFIJBEN, TELMOVBEN, OTRTIPRELBEN, EMAILBEN, APEPATTUTBEN,'
         +' APEMATTUTBEN, NOMTUTBEN, TIPDOCIDETUT, DOCIDETUT, USUREG, FECREG) VALUES ('
         +QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)+','+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)+','+QuotedStr(DM1.xSgr)
         +','+QuotedStr(dblctiprel.Text)+','+QuotedStr(meapepatben.Text)+','+QuotedStr(meapematben.Text)+','+QuotedStr(meapecasben.Text)
         +','+QuotedStr(meapenomben.Text)+','+QuotedStr('10')+','+QuotedStr(medniben.Text)+','+QuotedStr(dbdtpfecnac.Text)+','+QuotedStr(dblcidesex.Text)+','+mepor.Text
         +','+QuotedStr(dblcdforpagben.Text)+','+QuotedStr(dblcdbancoben.Text)
         +','+QuotedStr(medireccionben.Text)+','+QuotedStr(dblcddistritoben.Text)+','+QuotedStr(metelefonofijoben.Text)+','+QuotedStr(memovilben.Text)
         +','+QuotedStr(meotrtiprelben.Text)+','+QuotedStr(meemailben.Text)+','+QuotedStr(meapepattutben.Text)
         +','+QuotedStr(meapemattutben.Text)+','+QuotedStr(menomtutben.Text)+','+QuotedStr('10')+','+QuotedStr(mednitutben.Text)+','+QuotedStr(DM1.wUsuario)+', SYSDATE)';
         DM1.DCOM1.AppServer.EjecutaSQL(xSql);
         MessageDlg('Registro de beneficiario fue insertado.', mtInformation, [mbOk], 0);
         btnmostrarbeneficiario.Enabled := True;
         btneditarbeneficiario.Enabled := False;
         btnretirarbeneficiario.Enabled := False;
         btnactualizarbeneficiario.Enabled := False;
         btncancelar.Enabled := False;
         btnCerrar.Enabled := True;
         actualizagridbeneficiarios;
         limpiabeneficiarios;
         gbmanbeneficiarios.Visible := False;
      End;
   End;
   If DM1.xSgr = 'M' Then
   Begin
      If MessageDlg('¿ Seguro de actualiza el registro de beneficiario ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         xSql := 'UPDATE PRE_REP_DES_MOV SET TIPRELBEN = '+QuotedStr(dblctiprel.Text)
         +', APEPATBEN = '+QuotedStr(meapepatben.Text)
         +', APEMATBEN = '+QuotedStr(meapematben.Text)
         +', APECASBEN = '+QuotedStr(meapecasben.Text)
         +', NOMBEN = '+QuotedStr(meapenomben.Text)
         +', DOCIDEBEN = '+QuotedStr(medniben.Text)
         +', FECNACBEN = '+QuotedStr(dbdtpfecnac.Text)
         +', SEXBEN = '+QuotedStr(dblcidesex.Text)
         +', PORBEN = '+mepor.Text
         +', FORPAGOID = '+QuotedStr(dblcdforpagben.Text)
         +', BANCOID = '+QuotedStr(dblcdbancoben.Text)
         +', DIRBEN = '+QuotedStr(medireccionben.Text)
         +', ZIPIDBEN = '+QuotedStr(dblcddistritoben.Text)
         +', TELFIJBEN = '+QuotedStr(metelefonofijoben.Text)
         +', TELMOVBEN = '+QuotedStr(memovilben.Text)
         +', OTRTIPRELBEN = '+QuotedStr(meotrtiprelben.Text)
         +', EMAILBEN = '+QuotedStr(meemailben.Text)
         +', APEPATTUTBEN = '+QuotedStr(meapepattutben.Text)
         +', APEMATTUTBEN = '+QuotedStr(meapemattutben.Text)
         +', NOMTUTBEN = '+QuotedStr(menomtutben.Text)
         +', DOCIDETUT = '+QuotedStr(mednitutben.Text)
         +', USUMOD = '+QuotedStr(DM1.wUsuario)
         +', FECMOD = SYSDATE'
         +' WHERE ASOID = '+QuotedStr(DM1.cdsDetCartas.FieldByName('ASOID').AsString)
         +' AND PVSLBENNR = '+QuotedStr(DM1.cdsDetCartas.FieldByName('PVSLBENNR').AsString)
         +' AND FECNACBEN = '+QuotedStr(DM1.cdsDetCartas.FieldByName('FECNACBEN').AsString)
         +' AND APEPATBEN = '+QuotedStr(DM1.cdsDetCartas.FieldByName('APEPATBEN').AsString)
         +' AND APEMATBEN = '+QuotedStr(DM1.cdsDetCartas.FieldByName('APEMATBEN').AsString)
         +' AND NOMBEN = '+QuotedStr(DM1.cdsDetCartas.FieldByName('NOMBEN').AsString);
         DM1.DCOM1.AppServer.EjecutaSQL(xSql);
         MessageDlg('Registro de beneficiario fue actualizado.', mtInformation, [mbOk], 0);
         btnmostrarbeneficiario.Enabled := True;
         btneditarbeneficiario.Enabled := False;
         btnretirarbeneficiario.Enabled := False;
         btnactualizarbeneficiario.Enabled := False;
         btncancelar.Enabled := False;
         btnCerrar.Enabled := True;
         actualizagridbeneficiarios;
         limpiabeneficiarios;
         gbmanbeneficiarios.Visible := False;
      End;
   End;
end;

procedure TFbeneficiarios.insertabeneficiarios;
Var xSql:String;
begin
   DM1.xSgr := '';
   xSql := 'SELECT ASOID FROM PRE_REP_DES_MOV WHERE ASOID = '+QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)
   +' AND PVSLBENNR = '+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString);
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   If DM1.cdsQry.RecordCount = 0 Then
   Begin
      xSql := 'SELECT COUNT(1) CUENTA FROM PVS302 A, PVS303 B WHERE A.ASOID = '+QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)
      +' AND A.PVSLBENNR = '+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)+' AND A.ASOID = B.ASOID AND A.PVSLBENNR = B.PVSLBENNR';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      If DM1.cdsQry.FieldByName('CUENTA').AsInteger > 0 Then
      Begin
         DM1.xSgr := 'D';
         xSql := 'INSERT INTO PRE_REP_DES_MOV (ASOID, PVSLBENNR, TIPBEN, TIPRELBEN, APEPATBEN, APEMATBEN, APECASBEN, NOMBEN, TIPDOCIDEBEN, DOCIDEBEN,'
         +' FECNACBEN, SEXBEN, FORPAGOID, BANCOID, AGENBCOID, DIRBEN, ZIPIDBEN, TELFIJBEN, TELMOVBEN, OTRTIPRELBEN, EMAILBEN, APEPATTUTBEN, APEMATTUTBEN,'
         +' NOMTUTBEN, TIPDOCIDETUT, DOCIDETUT, USUREG, FECREG, PORBEN)'
         +' SELECT ASOID, PVSLBENNR, ''D'', DSGTREL, DSGAPEPAT, DSGAPEMAT, DSGAPECAS, DSGNOMBR, ''10'', DSGDNI, DSGFNAC, DSGSEX, FORPAGOID,'
         +' BANCOID, AGENBCOID, DSGDIRDES, DSGZIPIDDES, DSGTELFIJDES, DSGTELMOVDES, DSGOTRTIPREL, EMAILDES, DSGTAPEP, DSGTAPEM, DSGTNOMB, ''10'', DSGTDNI,'
         +QuotedStr(DM1.wUsuario)+', SYSDATE, DSGPORC FROM PVS303 WHERE ASOID = '+QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)
         +' AND PVSLBENNR = '+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString);
      End
      Else
      Begin
         DM1.xSgr := 'F';
         xSql := 'INSERT INTO PRE_REP_DES_MOV (ASOID, PVSLBENNR, TIPBEN, TIPRELBEN, APEPATBEN, APEMATBEN, APECASBEN, NOMBEN, TIPDOCIDEBEN, DOCIDEBEN,'
         +' FECNACBEN, SEXBEN, FORPAGOID, BANCOID, AGENBCOID, DIRBEN, ZIPIDBEN, TELFIJBEN, TELMOVBEN, OTRTIPRELBEN, EMAILBEN, APEPATTUTBEN, APEMATTUTBEN,'
         +' NOMTUTBEN, TIPDOCIDETUT, DOCIDETUT, USUREG, FECREG)'
         +' SELECT ASOID, PVSLBENNR, ''F'', FAMRELID, FAMAPEPAT, FAMAPEMAT, FAMAPECAS, FAMNOMBRE, TIPDOCCOD,  FAMNUMDOC, FAMFECNAC, FAMSEXO, FORPAGOID,'
         +' BANCOID, AGENBCOID, FAMDIRECC, DISTID, FAMTELF, FAMTELMOV, FAMOTRTIPREL, EMAILFAM, APEPATTUT, APEMATTUT, NOMTUT, TUTTIPDOC, TUTNUMDOC,'
         +QuotedStr(DM1.wUsuario)+', SYSDATE FROM APO203 WHERE ASOID = '+QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)
         +' AND PVSLBENNR = '+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString);
      End;
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
   End;
End;

procedure TFbeneficiarios.dbgbenrepDblClick(Sender: TObject);
begin
   btnmostrarbeneficiario.OnClick(btnmostrarbeneficiario);
end;

procedure TFbeneficiarios.btnmostrarbeneficiarioClick(Sender: TObject);
begin

   gbmanbeneficiarios.Visible := True;
   gbmanbeneficiarios.Enabled := True;
   gbmanbeneficiarios.Caption := 'Mostrando datos del beneficiario';
   llenabeneficiarios;
   gbmanbeneficiarios.Enabled := False;

   btnmostrarbeneficiario.Enabled := False;
   btneditarbeneficiario.Enabled := True;
   btnretirarbeneficiario.Enabled := True;
   btnactualizarbeneficiario.Enabled := False;
   btncancelar.Enabled := True;
   btnCerrar.Enabled := False;

end;



Procedure TFbeneficiarios.mednibenKeyPress(Sender: TObject; var Key: Char);
Begin
   If Not (Key In ['0'..'9','.',#8]) Then
   Begin
      Key:=#0;
      MessageDlg('Por favor introduzca solo números.', mtInformation, [mbOk], 0);
   End;
End;



End.

