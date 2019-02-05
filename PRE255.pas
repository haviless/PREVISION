Unit PRE255;

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Buttons, Wwdbdlg, Mask, ExtCtrls, wwdblook;
Type
   TFmodforpagdeu = Class(TForm)
      GroupBox1: TGroupBox;
      btncerrar: TBitBtn;
      btneditar: TBitBtn;
      lblforpag: TLabel;
      dblcforpag: TwwDBLookupCombo;
      pnlforpag: TPanel;
      meforpagodes: TMaskEdit;
      lblbanco: TLabel;
      dblcBanco: TwwDBLookupCombo;
      pnlbanco: TPanel;
      mebancodes: TMaskEdit;
      lblagegir: TLabel;
      dblcagegir: TwwDBLookupComboDlg;
      pnlagegir: TPanel;
      meagengir: TMaskEdit;
      lblasoncta: TLabel;
      pnlasoncta: TPanel;
      measoncta: TMaskEdit;
      Label1: TLabel;
      Label2: TLabel;
      pnlapepatcob: TPanel;
      meapepatcob: TMaskEdit;
      pnlpvsldniben: TPanel;
      mepvsldniben: TMaskEdit;
      btngrabar: TBitBtn;
      pnlapematcob: TPanel;
      meapematcob: TMaskEdit;
      pnlnomcob: TPanel;
      menomcob: TMaskEdit;
      Label3: TLabel;
      Label4: TLabel;
      pnlapepattut: TPanel;
      meapepattut: TMaskEdit;
      pnlapemattut: TPanel;
      meapemattut: TMaskEdit;
      pnlnomtut: TPanel;
      menomtut: TMaskEdit;
      Label5: TLabel;
      Label6: TLabel;
      pnldocidetut: TPanel;
      medocidetut: TMaskEdit;
      Procedure FormActivate(Sender: TObject);
      Procedure dblcforpagChange(Sender: TObject);
      Procedure btncerrarClick(Sender: TObject);
      Procedure dblcBancoChange(Sender: TObject);
      Procedure dblcagegirChange(Sender: TObject);
      Procedure btneditarClick(Sender: TObject);
      Procedure btngrabarClick(Sender: TObject);
      Procedure dblcforpagExit(Sender: TObject);
      Procedure dblcBancoExit(Sender: TObject);
      Procedure dblcagegirExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
   Private
    { Private declarations }
   Public
      apepatcob, apematcob, nomcob, forpagoid, bancoid, agenbcoid, asoapenomdeu, dnideu, cueaho: String;
    { Public declarations }
   End;
Var
   Fmodforpagdeu: TFmodforpagdeu;

Implementation

Uses PREDM;
{$R *.dfm}

Procedure TFmodforpagdeu.FormActivate(Sender: TObject);
Var
   xSql: String;
Begin
   forpagoid := DM1.cdsDFam.FieldByName('FORPAGOID').AsString;
   bancoid := DM1.cdsDFam.FieldByName('BANCOID').AsString;
   agenbcoid := DM1.cdsDFam.FieldByName('AGENBCOID').AsString;
   asoapenomdeu := DM1.cdsDFam.FieldByName('PVSNOMBRE').AsString;
   dnideu := DM1.cdsDFam.FieldByName('PVSLDNIBEN').AsString;
   cueaho := DM1.cdsDFam.FieldByName('PVSLNCTA').AsString;
   apepatcob := DM1.cdsDFam.FieldByName('APEPATCOB').AsString;
   apematcob := DM1.cdsDFam.FieldByName('APEMATCOB').AsString;
   nomcob := DM1.cdsDFam.FieldByName('NOMCOB').AsString;
  // HPP_200903_PRE  SE RETIRA
  {
  xSql := 'SELECT BANCOID, BANCONOM FROM TGE105 WHERE BANCOID IN (''03'', ''04'')';
  DM1.cdsBanco.Close;
  DM1.cdsBanco.DataRequest(xSql);
  DM1.cdsBanco.Open;
  }
  // HPP_200903_PRE
   xSql := 'SELECT TIPDESEID, TIPDESEDES, FLACOBPRE FROM CRE104 A WHERE NVL(FLAVIGPRE, ''X'') = ''S'' ORDER BY TIPDESEID';
   DM1.cdsFPago.Close;
   DM1.cdsFPago.DataRequest(xSql);
   DM1.cdsFPago.Open;
  // FIN HPP_200903_PRE
   meapepatcob.Text := DM1.cdsDFam.FieldByName('APEPATCOB').AsString;
   meapematcob.Text := DM1.cdsDFam.FieldByName('APEMATCOB').AsString;
   menomcob.Text := DM1.cdsDFam.FieldByName('NOMCOB').AsString;
   mepvsldniben.Text := DM1.cdsDFam.FieldByName('PVSLDNIBEN').AsString;
   meapepattut.Text := DM1.cdsDFam.FieldByName('APEPATTUT').AsString;
   meapemattut.Text := DM1.cdsDFam.FieldByName('APEMATTUT').AsString;
   menomtut.Text := DM1.cdsDFam.FieldByName('NOMTUT').AsString;
   medocidetut.Text := DM1.cdsDFam.FieldByName('DOCIDETUT').AsString;
   dblcforpag.Text := DM1.cdsDFam.FieldByName('FORPAGOID').AsString;
   dblcBanco.Text := DM1.cdsDFam.FieldByName('BANCOID').AsString;
   dblcagegir.Text := DM1.cdsDFam.FieldByName('AGENBCOID').AsString;
   measoncta.Text := DM1.cdsDFam.FieldByName('PVSLNCTA').AsString;
End;

Procedure TFmodforpagdeu.dblcforpagChange(Sender: TObject);
Var
   xSql: String;
Begin
   If Trim(dblcforpag.Text) = '' Then
   Begin
      meforpagodes.Text := '';
      dblcBanco.Text := '';
      mebancodes.Text := '';
      dblcagegir.Text := '';
      meagengir.Text := '';
   End;
   If Length(dblcforpag.Text) = 2 Then
   Begin
      If DM1.cdsFPago.Locate('TIPDESEID', dblcforpag.Text, []) Then
      Begin
         meforpagodes.Text := DM1.cdsFPago.FieldByName('TIPDESEDES').AsString;
     // HPP_200903_PRE
         xSql := 'SELECT BANCOID, BANCONOM FROM TGE105 WHERE NVL(FLAVIGPRE,''X'') = ''S'' AND NVL(CLAUXID,''X'') = ' + QuotedStr(DM1.cdsFPago.FieldByName('FLACOBPRE').AsString);
         DM1.cdsBanco.Close;
         DM1.cdsBanco.DataRequest(xSql);
         DM1.cdsBanco.Open;
     // FIN HPP_200903_PRE
         If (dblcforpag.Text = '01') Or (dblcforpag.Text = '11') Or (dblcforpag.Text = '16') Then dblcBanco.Text := '03';
         If (dblcforpag.Text = '05') Or (dblcforpag.Text = '06') Then dblcBanco.Text := '04';
         If (dblcforpag.Text = '05') Or (dblcforpag.Text = '06') Then dblcBanco.Text := '04';
         If dblcforpag.Text = '05' Then dblcBanco.Text := '15';
         lblbanco.Visible := True;
         dblcBanco.Visible := True;
         pnlbanco.Visible := True;
         If (dblcforpag.Text = '01') Or (dblcforpag.Text = '11') Or (dblcforpag.Text = '16') Then
         Begin
            lblagegir.Visible := False;
            dblcagegir.Visible := False;
            pnlagegir.Visible := False;
            lblasoncta.Visible := False;
            pnlasoncta.Visible := False;
         End;
         If dblcforpag.Text = '05' Then
         Begin
            dblcagegir.Selected.Clear;
            dblcagegir.Selected.Add('AGENBCOID'#9'8'#9'Código'#9#9);
            dblcagegir.Selected.Add('AGENBCODES'#9'25'#9'Nombre de Agencia'#9#9);
            dblcagegir.Selected.Add('DPTODES'#9'20'#9'Departamento de Agencia'#9#9);
            xSql := 'SELECT A.AGENBCOID, A.AGENBCODES, B.DPTODES FROM COB102 A, APO158 B WHERE A.DPTOID = B.DPTOID(+) AND A.BANCOID = ' + QuotedStr(dblcBanco.Text)
               + ' ORDER BY DPTODES, AGENBCODES';
            DM1.cdsAgBco.Close;
            DM1.cdsAgBco.DataRequest(xSql);
            DM1.cdsAgBco.Open;
            lblasoncta.Visible := False;
            pnlasoncta.Visible := False;
            lblagegir.Visible := True;
            dblcagegir.Visible := True;
            pnlagegir.Visible := True;
            dblcagegir.Text := '';
            meagengir.Text := '';
         End;
         If dblcforpag.Text = '06' Then
         Begin
            lblagegir.Visible := False;
            dblcagegir.Visible := False;
            pnlagegir.Visible := False;
            lblasoncta.Visible := True;
            pnlasoncta.Visible := True;
            measoncta.Text := '';
         End;
      End
      Else
      Begin
         MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
         dblcforpag.Text := '';
         meforpagodes.Text := '';
      End;
   End;
End;

Procedure TFmodforpagdeu.btncerrarClick(Sender: TObject);
Begin
   Fmodforpagdeu.Close;
End;

Procedure TFmodforpagdeu.dblcBancoChange(Sender: TObject);
Begin
   If Trim(dblcBanco.Text) = '' Then
   Begin
      mebancodes.Text := '';
      dblcagegir.Text := '';
      meagengir.Text := '';
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

Procedure TFmodforpagdeu.dblcagegirChange(Sender: TObject);
Begin
   If dblcagegir.Text = '' Then meagengir.Text := '';
   If Length(dblcagegir.Text) = 8 Then
   Begin
      If DM1.cdsAgBco.Locate('AGENBCOID', dblcagegir.Text, []) Then
      Begin
         meagengir.Text := DM1.cdsAgBco.FieldByName('AGENBCODES').AsString;
      End
      Else
      Begin
         MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
         dblcagegir.Text := '';
         meagengir.Text := '';
      End;
   End;
End;

Procedure TFmodforpagdeu.btneditarClick(Sender: TObject);
Begin
   pnlapepatcob.Enabled := True;
   pnlapematcob.Enabled := True;
   pnlnomcob.Enabled := True;
   pnlpvsldniben.Enabled := true;
   pnlapepattut.Enabled := True;
   pnlapemattut.Enabled := True;
   pnlnomtut.Enabled := True;
   pnldocidetut.Enabled := True;
   dblcforpag.Enabled := True;
   dblcBanco.Enabled := True;
   dblcagegir.Enabled := True;

   If dblcforpag.Text = '05' Then dblcagegir.Enabled := True;
   If dblcforpag.Text = '06' Then pnlasoncta.Enabled := True;
End;

Procedure TFmodforpagdeu.btngrabarClick(Sender: TObject);
Var
   xSql, texto, cambiaapenomcob: String;
   xValor, xnuevomonto: Double;
Begin
   cambiaapenomcob := Trim(meapepatcob.Text) + ' ' + Trim(meapematcob.Text) + ' ' + Trim(menomcob.Text);
   xnuevomonto := DM1.cdsDFam.FieldByName('PVSLMONTO').AsFloat;
   If MessageDlg('¿ Seguro de modificar el expediente de liquidación ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
    // Actualizando tabla de detalle de liquidación
      xSql := 'UPDATE PVS307 SET'
         + '  FORPAGOID  = ' + QuotedStr(dblcforpag.Text)
         + ', BANCOID    = ' + QuotedStr(dblcBanco.Text)
         + ', AGENBCOID  = ' + QuotedStr(dblcagegir.text)
         + ', PVSLNCTA   = ' + QuotedStr(measoncta.Text)
         + ', APEPATCOB  = ' + QuotedStr(meapepatcob.Text)
         + ', APEMATCOB  = ' + QuotedStr(meapematcob.Text)
         + ', NOMCOB     = ' + QuotedStr(menomcob.Text)
         + ', PVSNOMBRE  = ' + QuotedStr(cambiaapenomcob)
         + ', PVSLDNIBEN = ' + QuotedStr(mepvsldniben.Text)
         + ', APEPATTUT  = ' + QuotedStr(meapepattut.Text)
         + ', APEMATTUT  = ' + QuotedStr(meapemattut.Text)
         + ', NOMTUT     = ' + QuotedStr(menomtut.Text)
         + ', APENOMTUT  = ' + QuotedStr(Trim(meapepattut.Text) + ' ' + Trim(meapemattut.Text) + ' ' + Trim(menomtut.Text))
         + ', DOCIDETUT  = ' + QuotedStr(medocidetut.Text)
         + ' WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
         + ' AND PVSLAGRID = ''FPG'' AND PVSNOMBRE = ' + QuotedStr(asoapenomdeu);
      If dnideu = '' Then
         xSql := xSql + ' AND PVSLDNIBEN IS NULL'
      Else
         xSql := xSql + ' AND PVSLDNIBEN = ' + QuotedStr(dnideu);
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
    // Cambiando el texto de la forma de pago
      If dblcforpag.Text = '01' Then texto := '* CHEQUE DEL ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', dblcBanco.Text);
      If dblcforpag.Text = '16' Then texto := '* CHEQUE DE GERENCIA DEL ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', dblcBanco.Text);
      If dblcforpag.Text = '05' Then texto := '* GIRO DEL ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', dblcBanco.Text) + ' A LA CIUDAD DE ' + DM1.DevuelveValor('COB102', 'AGENBCODES', 'AGENBCOID', dblcagegir.Text) + '-' + DM1.DevuelveValor('TGE158', 'DPTODES', 'DPTOID', DM1.DevuelveValor('COB102', 'DPTOID', 'AGENBCOID', dblcagegir.Text));
      If dblcforpag.Text = '11' Then texto := '* LIBRETA DE AHORRO DEL ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', dblcBanco.Text);
      If dblcforpag.Text = '18' Then texto := '* DEPOSITO EN CUENTA : ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', dblcBanco.Text);
      xSql := 'UPDATE PVS307 SET PVSLCONCE = ' + QuotedStr(texto)
         + ' WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
         + ' AND PVSNOMBRE = ' + QuotedStr(cambiaapenomcob)
         + ' AND PVSLAGRID = ''FPG'' AND FLGVOUCHER = ''S''';
      If mepvsldniben.Text = '' Then
         xSql := xSql + ' AND PVSLDNIBEN IS NULL'
      Else
         xSql := xSql + ' AND PVSLDNIBEN = ' + QuotedStr(mepvsldniben.Text);
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
    // Cambiando los datos del beneficiario
    // Cambiando el nombre
      xSql := 'UPDATE PVS307 SET PVSLCONCE = REPLACE(PVSLCONCE, ' + QuotedStr(asoapenomdeu) + ',' + QuotedStr(cambiaapenomcob) + ')'
         + ' WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
         + ' AND PVSLAGRID = ''FPG'' AND FLGVOUCHER = ''N'''
         + ' AND PVSNOMBRE = ' + QuotedStr(cambiaapenomcob);
      If mepvsldniben.Text = '' Then
         xSql := xSql + ' AND PVSLDNIBEN IS NULL'
      Else
         xSql := xSql + ' AND PVSLDNIBEN = ' + QuotedStr(mepvsldniben.Text);
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
    // Cambiando el DNI
      xSql := 'UPDATE PVS307 SET PVSLCONCE = REPLACE(PVSLCONCE, ' + QuotedStr(dnideu) + ',' + QuotedStr(mepvsldniben.Text) + ')'
         + ' WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
         + ' AND PVSLAGRID = ''FPG'' AND FLGVOUCHER = ''N'''
         + ' AND PVSNOMBRE = ' + QuotedStr(cambiaapenomcob);
      If mepvsldniben.Text = '' Then
         xSql := xSql + ' AND PVSLDNIBEN IS NULL'
      Else
         xSql := xSql + ' AND PVSLDNIBEN = ' + QuotedStr(mepvsldniben.Text);
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      If forpagoid = '05' Then
      Begin
         If dblcforpag.Text <> '05' Then
         Begin
        // Si anteriormente fue giro y ahora no es giro borrar 11.50 del descuentos de transferencias y añadirlo al pago del
        // deudo
            xSql := 'SELECT NVL(PVSLMONTO,0) PVSLMONTO FROM PVS307 WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString) + ' AND TIPDES = ''T''';
            DM1.cdsQry.Close;
            DM1.cdsQry.DataRequest(xSql);
            DM1.cdsQry.Open;
            If DM1.cdsQry.RecordCount > 0 Then
            Begin
          // Si el total de la transferencia es solo 11.50 se elimina el registro. Si es más solo se resta
               If DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat <= 11.50 Then
               Begin
                  xSql := 'DELETE PVS307 WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString) + ' AND TIPDES = ''T''';
                  DM1.DCOM1.AppServer.EjecutaSQL(xSql);
               End
               Else
               Begin
                  xSql := 'UPDATE PVS307 SET PVSLMONTO = NVL(PVSLMONTO,0) - 11.50, PVSTCRE =  NVL(PVSTCRE,0) - 11.50, PVSLSALDO = NVL(PVSLSALDO,0) - 11.50'
                     + ' WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString) + ' AND TIPDES = ''T''';
                  DM1.DCOM1.AppServer.EjecutaSQL(xSql);
               End;
          // Añadir los 11.50 al pago del deudo
               xnuevomonto := DM1.cdsDFam.FieldByName('PVSLMONTO').AsFloat + 11.50;
               xSql := 'UPDATE PVS307 SET PVSLMONTO =' + FloatToStr(xnuevomonto) + ',PVSLSALDO = ' + FloatToStr(xnuevomonto)
                  + ' WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString) + ' AND PVSLAGRID = ''FPG'' AND PVSNOMBRE = ' + QuotedStr(cambiaapenomcob)
                  + ' AND FLGVOUCHER = ''N''';
               If mepvsldniben.Text <> '' Then
                  xSql := xSql + ' AND PVSLDNIBEN = ' + QuotedStr(mepvsldniben.Text)
               Else
                  xSql := xSql + 'AND PVSLDNIBEN IS NULL';
               DM1.DCOM1.AppServer.EjecutaSQL(xSql);
            End;
         End;
      End
      Else
      Begin
         If dblcforpag.Text = '05' Then
         Begin
        // Si anteriormente no fue giro y ahora es giro añadir 11.50 del descuentos de transferencias y disminuirlo del pago del deudo
            xSql := 'SELECT NVL(PVSLMONTO,0) PVSLMONTO FROM PVS307 WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString) + ' AND TIPDES = ''T''';
            DM1.cdsQry.Close;
            DM1.cdsQry.DataRequest(xSql);
            DM1.cdsQry.Open;
            If DM1.cdsQry.RecordCount = 0 Then
            Begin
               xSql := 'INSERT INTO PVS307 (CIAID, PVSLBENNR, PVSLTIPBE, PVSLAGRID, PVSLSEC, PVSLCONCE, PVSLMONTO, USUARIO, FREG, HREG,  PVSLSALDO, TIPDES)'
                  + ' VALUES (''02'''
                  + ',' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
                  + ',' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLTIPBE').AsString)
                  + ', ''DSC'' '
                  + ', 99'
                  + ',' + QuotedStr('TRANSFERENCIA DE BENEFICIOS (G.PROV)')
                  + ', 11.50'
                  + ',' + QuotedStr(DM1.wUsuario)
                  + ', TO_CHAR(SYSDATE, ''DD/MM/YYYY''), SYSDATE'
                  + ', 11.50'
                  + ',''T'' )';
               DM1.DCOM1.AppServer.EjecutaSQL(xSql);
            End
            Else
            Begin
               xSql := 'UPDATE PVS307 SET PVSLMONTO = NVL(PVSLMONTO,0) + 11.50, PVSTCRE =  NVL(PVSTCRE,0) + 11.50, PVSLSALDO = NVL(PVSLSALDO,0) + 11.50'
                  + ' WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString) + ' AND TIPDES = ''T''';
               DM1.DCOM1.AppServer.EjecutaSQL(xSql);
            End;
        // Resta 11.50 al pago del deudo
            xnuevomonto := DM1.cdsDFam.FieldByName('PVSLMONTO').AsFloat - 11.50;
            xSql := 'UPDATE PVS307 SET PVSLMONTO = ' + FloatToStr(xnuevomonto) + ', PVSLSALDO =' + FloatToStr(xnuevomonto)
               + ' WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
               + ' AND PVSLAGRID = ''FPG'' AND FLGVOUCHER = ''N'''
               + ' AND PVSNOMBRE = ' + QuotedStr(cambiaapenomcob);
            If mepvsldniben.Text = '' Then
               xSql := xSql + ' AND PVSLDNIBEN IS NULL'
            Else
               xSql := xSql + ' AND PVSLDNIBEN = ' + QuotedStr(mepvsldniben.Text);
            DM1.DCOM1.AppServer.EjecutaSQL(xSql);
         End;
      End;
    // Actualizando cheques
      If dblcforpag.Text = '01' Then
      Begin
         xSql := 'SELECT * FROM PVS_CHE_GEN_CAB WHERE ASOID = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)
            + ' AND PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
            + ' AND APENOMBEN = ' + QuotedStr(asoapenomdeu) + ' AND DOCIDEBEN = ' + QuotedStr(dnideu);
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         If DM1.cdsQry.RecordCount = 1 Then
         Begin
            xSql := 'UPDATE PVS_CHE_GEN_CAB SET APENOMBEN = ' + QuotedStr(cambiaapenomcob) + ', DOCIDEBEN = ' + QuotedStr(mepvsldniben.Text)
               + ' WHERE ASOID = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString) + ' AND PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
               + ' AND APENOMBEN = ' + QuotedStr(asoapenomdeu)
               + ' AND DOCIDEBEN = ' + QuotedStr(dnideu);
            DM1.DCOM1.AppServer.EjecutaSQL(xSql);
         End
         Else
         Begin
            If DM1.cdsDFam.FieldByName('PORDES').AsFloat = 0 Then
               xValor := 0
            Else
               xValor := DM1.cdsDFam.FieldByName('PORDES').AsFloat;
            xSql := 'INSERT INTO PVS_CHE_GEN_CAB(ASOID, PVSLBENNR, APENOMBEN, DOCIDEBEN, MONCHE, ESTCHE, PORDES, PVSNVOU, PVSLTIPBE, PVSLFECBE, BANCOID)'
               + ' VALUES (' + QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString) + ',' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString) + ',' + QuotedStr(cambiaapenomcob)
               + ',' + QuotedStr(mepvsldniben.Text) + ',' + FloatToStr(xnuevomonto) + ',' + QuotedStr('01') + ',' + FloatToStr(xValor)
               + ',' + QuotedStr(DM1.cdsDFam.FieldByName('PVSLNVOU').AsString) + ',' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLTIPBE').AsString) + ', TO_CHAR(SYSDATE, ''DD/MM/YYYY''),' + QuotedStr(DM1.cdsForPag.FieldByName('BANCOID').AsString) + ')';
            DM1.DCOM1.AppServer.EjecutaSQL(xSql);
         End;
      End
      Else
      Begin
         xSql := 'DELETE PVS_CHE_GEN_CAB WHERE ASOID = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString) + ' AND PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
            + ' AND APENOMBEN = ' + QuotedStr(asoapenomdeu) + ' AND DOCIDEBEN = ' + QuotedStr(dnideu);
         DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      End;
    // Actualizando libretas de ahorros
      If dblcforpag.Text = '11' Then
      Begin
         If forpagoid = '11' Then
         Begin
            xSql := 'UPDATE PVS308 SET '
               + ' DSGAPEPAT = ' + QuotedStr(meapepatcob.Text)
               + ', DSGAPEMAT = ' + QuotedStr(meapematcob.Text)
               + ', DSGNOMBR = ' + QuotedStr(menomcob.Text)
               + ', DSGTAPEPAT = ' + QuotedStr(meapepattut.Text)
               + ', DSGTAPEMAT = ' + QuotedStr(meapemattut.Text)
               + ', DSGTNOMBR = ' + QuotedStr(menomtut.Text)
               + ', DSGTDNI = ' + QuotedStr(medocidetut.Text)
               + ', DSGTAPENOM = ' + QuotedStr(Trim(meapepattut.Text) + ' ' + Trim(meapemattut.Text) + ' ' + Trim(menomtut.Text))
               + ' WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
               + ' AND DSGAPEPAT = ' + QuotedStr(apepatcob)
               + ' AND DSGAPEMAT = ' + QuotedStr(apematcob)
               + ' AND DSGNOMBR = ' + QuotedStr(nomcob);
            DM1.DCOM1.AppServer.EjecutaSQL(xSql);
         End
         Else
         Begin
            xSql := 'INSERT INTO PVS308(ASOID, PVSLTIPBE, PVSLBENNR, DSGTREL, DSGAPEPAT, DSGAPEMAT,'
               + ' DSGNOMBR, DSGPORC, DSGMTOORI, DSGMTOLOC, FLGENTLIB, FLGLIB, PVSEXPNRO,'
               + ' DSGTDNI, DSGTAPEPAT, DSGAPEMAT, DSGTNOMBR, DSGTAPENOM, USUARIO, FREG, HREG, DSGFECPAGO) VALUES ('
               + QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString) + ',' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLTIPBE').AsString) + ',' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
               + ',' + QuotedStr(DM1.cdsDFam.FieldByName('CODRELCOB').AsString) + ',' + QuotedStr(meapepatcob.Text) + ',' + QuotedStr(meapematcob.Text)
               + ',' + QuotedStr(menomcob.Text) + ',' + QuotedStr(DM1.cdsDFam.FieldByName('PORDES').AsString)
               + ',' + FloatToStr(xnuevomonto) + ',' + FloatToStr(xnuevomonto) + ',' + QuotedStr('N') + ',' + QuotedStr('S') + ',' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSEXPNRO').AsString)
               + ',' + QuotedStr(medocidetut.Text) + ',' + QuotedStr(meapepattut.Text) + ',' + QuotedStr(meapemattut.Text) + ',' + QuotedStr(menomtut.Text)
               + ',' + QuotedStr(Trim(meapepattut.Text) + ' ' + Trim(meapemattut.Text) + ' ' + QuotedStr(menomtut.Text))
               + ',' + QuotedStr(DM1.wUsuario) + ', TO_DATE(SYSDATE), SYSDATE, TO_DATE(SYSDATE) )';
            DM1.DCOM1.AppServer.EjecutaSQL(xSql);
         End;
      End
      Else
      Begin
         xSql := 'DELETE FROM PVS308 WHERE TRIM(DSGAPEPAT)||'' ''||TRIM(DSGAPEMAT)||'' ''||TRIM(DSGNOMBR) = ' + QuotedStr(asoapenomdeu)
            + ' AND PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString);
      End;
      MessageDlg('Modificación Ok', mtInformation, [mbOk], 0);
   End;
End;

Procedure TFmodforpagdeu.dblcforpagExit(Sender: TObject);
Var
   xSql: String;
Begin
   If Trim(dblcforpag.Text) <> '' Then
   Begin
      xSql := 'SELECT * FROM CRE104 WHERE TIPDESEID = ' + QuotedStr(dblcforpag.Text);
      If DM1.verificaexiste(xSql) = False Then
      Begin
         MessageDlg('Forma de pago no valida', mtInformation, [mbOk], 0);
         dblcforpag.Text := '';
         dblcforpag.SetFocus;
         Exit;
      End;
   End;
End;

Procedure TFmodforpagdeu.dblcBancoExit(Sender: TObject);
Var
   xSql: String;
Begin
   If Trim(dblcBanco.Text) <> '' Then
   Begin
      xSql := 'SELECT * FROM TGE105 WHERE BANCOID = ' + QuotedStr(dblcBanco.Text);
      If DM1.verificaexiste(xSql) = False Then
      Begin
         MessageDlg('Código de banco no valida', mtInformation, [mbOk], 0);
         dblcBanco.Text := '';
         dblcBanco.SetFocus;
         Exit;
      End;
   End;
End;

Procedure TFmodforpagdeu.dblcagegirExit(Sender: TObject);
Var
   xSql: String;
Begin
   If Trim(dblcagegir.Text) <> '' Then
   Begin
      xSql := 'SELECT * FROM COB102 WHERE AGENBCOID = ' + QuotedStr(dblcagegir.Text);
      If DM1.verificaexiste(xSql) = False Then
      Begin
         MessageDlg('Código de agencia no valida', mtInformation, [mbOk], 0);
         dblcagegir.Text := '';
         dblcagegir.SetFocus;
         Exit;
      End;
   End;
End;

Procedure TFmodforpagdeu.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If Key = #13 Then
   Begin
      Key := #0;
      Perform(CM_DIALOGKEY, VK_TAB, 0);
   End;
End;
End.

