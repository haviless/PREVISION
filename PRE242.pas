Unit PRE242;
// Inicio Uso Estándares: 01/08/2011
// Unidad            : Previsión Social
// Formulario        : 
// Fecha de Creación : 03/05/2016
// Autor             : Sistemas
// Objetivo          : Modifica Forma de Pago
//
// Actualizaciones
// ---------------
// HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios

Interface
Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Buttons, Mask, ExtCtrls, wwdblook, fcButton, fcImgBtn,
   fcShapeBtn, Wwdbdlg;
Type
   TFModificaformadepago = Class(TForm)
      gbforpag: TGroupBox;
      GroupBox2: TGroupBox;
      lblforpag: TLabel;
      lblbanco: TLabel;
      lblagegir: TLabel;
      lblasoncta: TLabel;
      dblcforpag: TwwDBLookupCombo;
      pnlforpag: TPanel;
      meforpagodes: TMaskEdit;
      dblcBanco: TwwDBLookupCombo;
      pnlbanco: TPanel;
      mebancodes: TMaskEdit;
      pnlagegir: TPanel;
      meagengir: TMaskEdit;
      pnlasoncta: TPanel;
      measoncta: TMaskEdit;
      btncerrar: TBitBtn;
      btnGeneraLiquidacion: TBitBtn;
      dblcagegir: TwwDBLookupComboDlg;
      Procedure FormActivate(Sender: TObject);
      Procedure btncerrarClick(Sender: TObject);
      Procedure dblcforpagChange(Sender: TObject);
      Procedure btnCerrarModClick(Sender: TObject);
      Procedure dblcBancoChange(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure btnGeneraLiquidacionClick(Sender: TObject);
      Procedure dblcagegirChange(Sender: TObject);
      Procedure dblcforpagExit(Sender: TObject);
      Procedure dblcBancoExit(Sender: TObject);
      Procedure dblcagegirExit(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;
Var
   FModificaformadepago: TFModificaformadepago;
Implementation
Uses PREDM, PRE241;
{$R *.dfm}

Procedure TFModificaformadepago.FormActivate(Sender: TObject);
Var
   xSql: String;
Begin
   xSql := 'SELECT TIPDESEID, TIPDESEDES, FLACOBPRE FROM CRE104 A WHERE NVL(FLAVIGPRE, ''X'') = ''S'' ORDER BY TIPDESEID';
   DM1.cdsFPago.Close;
   DM1.cdsFPago.DataRequest(xSql);
   DM1.cdsFPago.Open;
  {
  xSql := 'SELECT BANCOID, BANCONOM FROM TGE105 WHERE BANCOID IN (''03'', ''04'')';
  DM1.cdsBanco.Close;
  DM1.cdsBanco.DataRequest(xSql);
  DM1.cdsBanco.Open;
  }
   lblagegir.Visible := False;
   dblcagegir.Visible := False;
   pnlagegir.Visible := False;
   lblasoncta.Visible := False;
   pnlasoncta.Visible := False;
End;

Procedure TFModificaformadepago.btncerrarClick(Sender: TObject);
Begin
   gbforpag.Visible := False;
   FModificaformadepago.Close;
End;

Procedure TFModificaformadepago.dblcforpagChange(Sender: TObject);
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
  // HPP_200903_PRE
   If Length(dblcforpag.Text) = 2 Then
   Begin
      If DM1.cdsFPago.Locate('TIPDESEID', dblcforpag.Text, []) Then
      Begin
         meforpagodes.Text := DM1.cdsFPago.FieldByName('TIPDESEDES').AsString;
         xSql := 'SELECT BANCOID, BANCONOM '
               + '  FROM TGE105 '
               + ' WHERE NVL(FLAVIGPRE,''X'') = ''S'' AND '
               + '       NVL(CLAUXID,''X'')   = ' + QuotedStr(DM1.cdsFPago.FieldByName('FLACOBPRE').AsString);
         DM1.cdsBanco.Close;
         DM1.cdsBanco.DataRequest(xSql);
         DM1.cdsBanco.Open;
         If (dblcforpag.Text = '01') Or (dblcforpag.Text = '11') Or (dblcforpag.Text = '16') Then dblcBanco.Text := '03';
         If (dblcforpag.Text = '05') Or (dblcforpag.Text = '06') Then dblcBanco.Text := '04';
         If dblcforpag.Text = '18' Then dblcBanco.Text := '15';
// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
         If dblcforpag.Text = '19' Then dblcBanco.Text := '15';
// Fin   HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
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
            xSql := 'SELECT A.AGENBCOID, A.AGENBCODES, B.DPTODES '
                  + '  FROM COB102 A, APO158 B '
                  + ' WHERE A.DPTOID  = B.DPTOID(+) '
                  + '   AND A.BANCOID = ' + QuotedStr(dblcBanco.Text)
                  + ' ORDER BY DPTODES, AGENBCODES';
            DM1.cdsAgBco.Close;
            DM1.cdsAgBco.DataRequest(xSql);
            DM1.cdsAgBco.Open;
            lblasoncta.Visible := False;
            pnlasoncta.Visible := False;
            lblagegir.Visible := True;
            dblcagegir.Visible := True;
            pnlagegir.Visible := True;
            lblagegir.Left := 16;
            lblagegir.Top := 74;
            dblcagegir.Left := 118;
            dblcagegir.Top := 72;
            pnlagegir.Left := 202;
            pnlagegir.Top := 72;
            dblcagegir.Text := '';
            meagengir.Text := '';
         End;
// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
         If (dblcforpag.Text = '06') Or (dblcforpag.Text = '18') Or (dblcforpag.Text = '19') Then
// Fin   HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
         Begin
            lblagegir.Visible := False;
            dblcagegir.Visible := False;
            pnlagegir.Visible := False;
            lblasoncta.Visible := True;
            pnlasoncta.Visible := True;
            lblasoncta.Left := 16;
            lblasoncta.Top := 74;
            pnlasoncta.Left := 118;
            pnlasoncta.Top := 72;
            measoncta.Text := '';
            lblasoncta.Visible := True;
            xSql := 'SELECT ASONCTA FROM APO201 WHERE ASOID = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString);
            DM1.cdsQry.Close;
            DM1.cdsQry.DataRequest(xSql);
            DM1.cdsQry.Open;
            measoncta.Text := DM1.cdsQry.FieldByName('ASONCTA').AsString;
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

Procedure TFModificaformadepago.btnCerrarModClick(Sender: TObject);
Begin
   FModificaformadepago.Close;
End;

Procedure TFModificaformadepago.dblcBancoChange(Sender: TObject);
Var
   xSql: String;
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
         If dblcforpag.Text = '05' Then
         Begin
            dblcagegir.Selected.Clear;
            dblcagegir.Selected.Add('AGENBCOID'#9'8'#9'Código'#9#9);
            dblcagegir.Selected.Add('AGENBCODES'#9'25'#9'Nombre de Agencia'#9#9);
            dblcagegir.Selected.Add('DPTODES'#9'20'#9'Departamento de Agencia'#9#9);
            xSql := 'SELECT A.AGENBCOID, A.AGENBCODES, B.DPTODES '
                  + '  FROM COB102 A, APO158 B '
                  + ' WHERE A.DPTOID  = B.DPTOID(+) '
                  + '   AND A.BANCOID = ' + QuotedStr(dblcBanco.Text)
                  + ' ORDER BY DPTODES, AGENBCODES';
            DM1.cdsAgBco.Close;
            DM1.cdsAgBco.DataRequest(xSql);
            DM1.cdsAgBco.Open;
            lblagegir.Visible := True;
            dblcagegir.Visible := True;
            pnlagegir.Visible := True;
         End;
// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
         If (dblcforpag.Text = '06') Or (dblcforpag.Text = '18') Or (dblcforpag.Text = '19') Then
// Fin   HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
         Begin
            lblasoncta.Visible := True;
            pnlasoncta.Visible := True;
            xSql := 'SELECT ASONCTA FROM APO201 WHERE ASOID = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString);
            DM1.cdsQry.Close;
            DM1.cdsQry.DataRequest(xSql);
            DM1.cdsQry.Open;
            measoncta.Text := DM1.cdsQry.FieldByName('ASONCTA').AsString;
         End;
      End
      Else
      Begin
         MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
      End;
   End;
End;

Procedure TFModificaformadepago.FormKeyPress(Sender: TObject;
   Var Key: Char);
Begin
   If Key = #13 Then
   Begin
      Key := #0;
      Perform(CM_DIALOGKEY, VK_TAB, 0);
   End;
End;

Procedure TFModificaformadepago.btnGeneraLiquidacionClick(Sender: TObject);
Var
   xSql, texto: String;
Begin
   DM1.xmoddeu := 'N';
   DM1.xFlg := 'N';
   If dblcforpag.Text = '' Then
   Begin
      MessageDlg('Ingrese el codigo de la forma de pago', mtInformation, [mbOk], 0);
      dblcforpag.SetFocus;
      Exit;
   End;
   If dblcBanco.Text = '' Then
   Begin
      MessageDlg('Ingrese el codigo del banco', mtInformation, [mbOk], 0);
      dblcBanco.SetFocus;
      Exit;
   End;
   If dblcforpag.Text = '05' Then
   Begin
      If dblcagegir.Text = '' Then
      Begin
         MessageDlg('Ingrese el código de la agencia del banco', mtInformation, [mbOk], 0);
         dblcagegir.SetFocus;
         Exit;
      End;
   End;
   If dblcforpag.Text = '06' Then
   Begin
      If measoncta.Text = '' Then
      Begin
         MessageDlg('Ingrese el numero de la cuenta del asociado', mtInformation, [mbOk], 0);
         btncerrar.SetFocus;
         Exit;
      End;
   End;
  // Verificando si los datos ingresados son consistentes
   If (dblcforpag.Text = '05') And (dblcagegir.Text = '') Then
   Begin
      MessageDlg(' Ingrese la agencia del banco ', mtInformation, [mbOk], 0);
      Exit;
   End;
   If (dblcforpag.Text = '06') And (measoncta.Text = '') Then
   Begin
      MessageDlg(' Ingrese número de la cuenta del asociado ', mtInformation, [mbOk], 0);
      Exit;
   End;
  // Pregunta si se va ha actualizar la forma de pago
   If MessageDlg('¿ Seguro de actualizar la liquidación ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
      DM1.xmoddeu := 'S';
      DM1.xFlg := 'F';
    // Actualizando Tabla de solicitud de beneficio
      xSql := 'UPDATE PVS301 '
            + '   SET FORPAGOID = ' + QuotedStr(dblcforpag.Text)
            + '     , BANCOID   = ' + QuotedStr(dblcBanco.Text)
            + '     , AGENBCOID = ' + QuotedStr(dblcagegir.text)
            + '     , ASONCTA   = ' + QuotedStr(measoncta.Text)
            + ' WHERE ASOID     = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString) + ' AND '
            + '       PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString);
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);

    // Actualizando tabla de detalle de liquidación
      xSql := 'UPDATE PVS307 '
            + '   SET FORPAGOID = ' + QuotedStr(dblcforpag.Text)
            + '     , BANCOID   = ' + QuotedStr(dblcBanco.Text)
            + '     , AGENBCOID = ' + QuotedStr(dblcagegir.text)
            + '     , PVSLNCTA  = ' + QuotedStr(measoncta.Text)
            + ' WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
            + '   AND PVSLAGRID = ''FPG''';
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
    // Actualizando texto del texto del pvs307
      If dblcforpag.Text = '01' Then
         texto := '* CHEQUE DEL ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', dblcBanco.Text);
      If dblcforpag.Text = '16' Then
         texto := '* CHEQUE DE GERENCIA DEL ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', dblcBanco.Text);
      If dblcforpag.Text = '05' Then
         texto := '* GIRO DEL ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', dblcBanco.Text)
            + ' A LA CIUDAD DE ' + DM1.DevuelveValor('COB102', 'AGENBCODES', 'AGENBCOID', dblcagegir.Text) + '-'
            + DM1.DevuelveValor('TGE158', 'DPTODES', 'DPTOID', DM1.DevuelveValor('COB102', 'DPTOID', 'AGENBCOID', dblcagegir.Text));
      If dblcforpag.Text = '11' Then
         texto := '* LIBRETA DE AHORRO DEL ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', dblcBanco.Text);
    // Inicio: HPP_200903_PRE - realizado por IREVILLA
      If dblcforpag.Text = '18' Then
      Begin
         texto := '* DEPOSITO EN CUENTA : ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', dblcBanco.Text) + ' ' + '[CTA.TEL. ' + measoncta.Text + ']';
      End;
// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
      If dblcforpag.Text = '19' Then
      Begin
           texto := '* DEPOSITO EN CUENTA DEL BANCO DE LA NACION  - ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', DM1.cdsExpLiq.FieldByName('BANCOID').AsString);
      End;
// Fin   HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
    // Actualizando texto de la liquidación
      xSql := 'UPDATE PVS307 '
            + '   SET PVSLCONCE = ' + QuotedStr(texto)
            + '     , PVSLNCTA  = ' + QuotedStr(measoncta.Text)
            + ' WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
            + '   AND PVSLAGRID = ''FPG'' AND FLGVOUCHER = ''S'' ';
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
    // Fin: HPP_200903_PRE
    // Modificando el monto de pago
      If dblcforpag.Text <> '05' Then
      Begin
         xSql := 'SELECT * FROM PVS307 '
               + ' WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString) + ' AND '
               + '       TIPDES    = ''T''';
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         If DM1.cdsQry.RecordCount > 0 Then
         Begin
            xSql := 'DELETE PVS307 '
                  + ' WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString) + ' AND '
                  + '       TIPDES    = ''T''';
            DM1.DCOM1.AppServer.EjecutaSQL(xSql);
            xSql := 'UPDATE PVS307 '
                  + '   SET PVSLSALDO = NVL(PVSLSALDO,0)+11.50, '
                  + '       PVSLMONTO = NVL(PVSLMONTO,0)+11.50'
                  + ' WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString) + ' AND  PVSLAGRID = ''FPG''  AND FLGVOUCHER = ''N''';
            DM1.DCOM1.AppServer.EjecutaSQL(xSql);
         End;
      End;
      If dblcforpag.Text = '05' Then
      Begin
         xSql := 'SELECT * FROM PVS307 '
               + ' WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString) + ' AND '
               + '       TIPDES = ''T''';
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
               + ', 0.00'
               + ',' + QuotedStr('TRANSFERENCIA DE BENEFICIOS (G.PROV)')
               + ', 11.50'
               + ',' + QuotedStr(DM1.wUsuario)
               + ', TO_CHAR(SYSDATE, ''DD/MM/YYYY''), SYSDATE'
               + ', 11.50'
               + ',''T'' )';
            DM1.DCOM1.AppServer.EjecutaSQL(xSql);
            xSql := 'UPDATE PVS307 SET PVSLSALDO = NVL(PVSLSALDO,0)-11.50, PVSLMONTO = NVL(PVSLMONTO,0)-11.50'
               + ' WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString) + ' AND  PVSLAGRID = ''FPG''  AND FLGVOUCHER = ''N''';
            DM1.DCOM1.AppServer.EjecutaSQL(xSql);
         End;
      End;
      // verificando los pagos si son por cheques o giros
      // Para mandar a cobranza de cheques
      xSql := 'SELECT * FROM PVS307 '
            + ' WHERE PVSLBENNR  = ' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString) + ' AND '
            + '       PVSLAGRID  = ''FPG'' AND '
            + '       FLGVOUCHER = ''N''';
      DM1.cdsDetLiq.Close;
      DM1.cdsDetLiq.DataRequest(xSql);
      DM1.cdsDetLiq.Open;
      If (DM1.cdsDetLiq.FieldByName('PVSLMONTO').AsFloat > 0) And (DM1.cdsDetLiq.FieldByName('FORPAGOID').AsString = '01') Then
      Begin
         xSql := 'SELECT * FROM PVS_CHE_GEN_CAB '
               + ' WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsDetLiq.FieldByName('PVSLBENNR').AsString)
               + '   AND PVSNVOU   = ' + QuotedStr(DM1.cdsDetLiq.FieldByName('PVSLNVOU').AsString)
               + '   AND APENOMBEN = ' + QuotedStr(DM1.cdsDetLiq.FieldByName('PVSNOMBRE').AsString);
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         If DM1.cdsQry.RecordCount = 0 Then
         Begin
            // Insertando el pago
            xSql := 'INSERT INTO PVS_CHE_GEN_CAB(ASOID, PVSLBENNR, APENOMBEN, DOCIDEBEN, MONCHE, ESTCHE, PORDES, PVSNVOU, PVSLTIPBE, PVSLFECBE)'
               + ' VALUES (' + QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)
               + ',' + QuotedStr(DM1.cdsDetLiq.FieldByName('PVSLBENNR').AsString)
               + ',' + QuotedStr(DM1.cdsDetLiq.FieldByName('PVSNOMBRE').AsString)
               + ',' + QuotedStr(DM1.cdsDetLiq.FieldByName('PVSLDNIBEN').AsString)
               + ',' + FloatToStr(DM1.cdsDetLiq.FieldByName('PVSLMONTO').AsFloat)
               + ',' + QuotedStr('01')
               + ',' + DM1.cdsDetLiq.FieldByName('PORDES').AsString
               + ',' + QuotedStr(DM1.cdsDetLiq.FieldByName('PVSLNVOU').AsString)
               + ',' + QuotedStr(DM1.cdsDetLiq.FieldByName('PVSLTIPBE').AsString)
               + ', TO_CHAR(SYSDATE, ''DD/MM/YYYY'') )';
            DM1.DCOM1.AppServer.EjecutaSQL(xSql);
         End
         Else
         Begin
            If DM1.cdsDetLiq.FieldByName('PVSLMONTO').AsFloat <> DM1.cdsQry.FieldByName('MONCHE').AsFloat Then
            Begin
               xSql := 'UPDATE PVS_CHE_GEN_CAB '
                     + '   SET MONCHE    = ' + DM1.cdsDetLiq.FieldByName('PVSLMONTO').AsString
                     + ' WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsDetLiq.FieldByName('PVSLBENNR').AsString)
                     + '   AND PVSNVOU   = ' + QuotedStr(DM1.cdsDetLiq.FieldByName('PVSLNVOU').AsString)
                     + '   AND APENOMBEN = ' + QuotedStr(DM1.cdsDetLiq.FieldByName('PVSNOMBRE').AsString);
               DM1.DCOM1.AppServer.EjecutaSQL(xSql);
            End;
         End;
      End
      Else
      Begin
         xSql := 'DELETE PVS_CHE_GEN_CAB '
               + ' WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsDetLiq.FieldByName('PVSLBENNR').AsString)
               + '   AND PVSNVOU   = ' + QuotedStr(DM1.cdsDetLiq.FieldByName('PVSLNVOU').AsString)
               + '   AND APENOMBEN = ' + QuotedStr(DM1.cdsDetLiq.FieldByName('PVSNOMBRE').AsString);
         DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      End;
      MessageDlg(' Modificación concluida Ok ', mtInformation, [mbOk], 0);
      FModificaformadepago.Close;
   End
   Else
   Begin
      dblcforpag.SetFocus;
      Exit;
   End;
End;

Procedure TFModificaformadepago.dblcagegirChange(Sender: TObject);
Begin
   If Trim(dblcagegir.Text) = '' Then meagengir.Text := '';
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

Procedure TFModificaformadepago.dblcforpagExit(Sender: TObject);
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

Procedure TFModificaformadepago.dblcBancoExit(Sender: TObject);
Var
   xSql: String;
Begin
   If Trim(dblcBanco.Text) <> '' Then
   Begin
      xSql := 'SELECT * FROM TGE105 WHERE BANCOID = ' + QuotedStr(dblcBanco.Text);
      If DM1.verificaexiste(xSql) = False Then
      Begin
         MessageDlg('Código de banco no valido', mtInformation, [mbOk], 0);
         dblcBanco.Text := '';
         dblcBanco.SetFocus;
         Exit;
      End;
   End;
End;

Procedure TFModificaformadepago.dblcagegirExit(Sender: TObject);
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
End.

