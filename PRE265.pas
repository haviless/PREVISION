// Inicio Uso Estándares: 01/08/2011
// Unidad : Previsión Social
// Formulario : Fingdeucar
// Fecha de Creación : 08/08/2011
// Autor : Sistemas
// Objetivo : Datos del Designatarios
// Actualizaciones
// HPP_200903_PRE   : Se valida los bancos que trabajan con previsión
// HPC_201209_PRE  : Modifica la forma de pago
// SPP_201301_PRE  : El pase se realiza de acuerdo a lo indicado en el HPC_201209_PRE
// HPC_201302_PRE  : AÑADIR EN LA TABLA PVS303 LOS CAMPOS DIRECCION DEL DESIGNATARIO,  CODIGO ZIP DE LA DIRECCION DEL DESIGNATARIO,
//                   TELEFONO FIJO DE REFERENCIA DEL DESIGNATARIO Y TELEFONO CELULAR DE REFERENCIA DEL DESIGNATARIO.
//                   SE VALIDA EL DNI DEL TUTOR
// SPP_201303_PRE  : El pase a producción se realiza a partir del HPC_201302_PRE
// HPC_201303_PRE  : Se retira validaciòn de direcciòn y telefono fijo del beneficiario
// SPP_201304_PRE  : Se realiza el pase a produccion a partir del HPC_201303_PRE
// HPC_201304_PRE  : Se añade caja de texto para ingresar el tipo de relación para los casos que se seleccione "OTROS"
// SPP_201305_PRE  : Se realiza el pase a producción a partir del HPC_201304_PRE
// HPC_201402_PRE  : Se añade al mantenimiento de cartas de designatarios el campo de apellido de casada.
// SPP_201403_PRE  : Se realiza el pase a producción a partir del pase HPC_201402_PRE.
// HPC_201609_PRE : Se controla el solicitar DNI o no para los casos de tipo de relación "Otros".
// HPC_201703_PRE : Se añade campo que permita grabar el email del designatario, de igual forma validar el movil del designatario

Unit PRE265;

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, wwdblook, StdCtrls, Mask, wwdbdatetimepicker, Buttons, Wwdbdlg,
   ExtCtrls, dateutils;

Type
   TFingdeucar = Class(TForm)
      GroupBox1: TGroupBox;
      Label1: TLabel;
      Label2: TLabel;
      Label3: TLabel;
      Label4: TLabel;
      dblctiprel: TwwDBLookupCombo;
      dbdtpfecnac: TwwDBDateTimePicker;
      Label5: TLabel;
      Label6: TLabel;
      dblcidesex: TwwDBLookupCombo;
      Label7: TLabel;
      lblbanco: TLabel;
      dblcforpag: TwwDBLookupCombo;
      Label8: TLabel;
      dblcBanco: TwwDBLookupCombo;
      Label9: TLabel;
      lblagegir: TLabel;
      btnAdicionar: TBitBtn;
      btnCerrar: TBitBtn;
      dblcagegir: TwwDBLookupComboDlg;
      Label13: TLabel;
      Label14: TLabel;
      Label15: TLabel;
      Label10: TLabel;
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
      // Inicio: SPP_201403_PRE
      // pnldni: TPanel;
      // medni: TMaskEdit;
      // Fin: SPP_201403_PRE
      pnlpor: TPanel;
      mepor: TMaskEdit;
      pnlapepattut: TPanel;
      meapepattut: TMaskEdit;
      pnlapemattut: TPanel;
      meapemattut: TMaskEdit;
      pnlnomtut: TPanel;
      menomtut: TMaskEdit;
      pnldnitut: TPanel;
      mednitut: TMaskEdit;
      pnlforpagodes: TPanel;
      meforpagodes: TMaskEdit;
      pnldesban: TPanel;
      medesban: TMaskEdit;
      pnlagegir: TPanel;
      meagegir: TMaskEdit;
    Label11: TLabel;
    pnldirecciondesgna: TPanel;
    medirecciondesgna: TMaskEdit;
    pnltelefonofijo: TPanel;
    metelefonofijo: TMaskEdit;
    Label19: TLabel;
    Label20: TLabel;
    pnlmovil: TPanel;
    memovil: TMaskEdit;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    dblcddptoid: TwwDBLookupComboDlg;
    dblcdProvincia: TwwDBLookupComboDlg;
    dblcdDistrito: TwwDBLookupComboDlg;
    Panel2: TPanel;
    medptodes: TMaskEdit;
    Panel1: TPanel;
    Panel3: TPanel;
    meprovinciades: TMaskEdit;
    medistritodes: TMaskEdit;
    // Inicio: SPP_201305_PRE
    pnldsgotrtiprel: TPanel;
    medsgotrtiprel: TMaskEdit;
    Label12: TLabel; 
    // Inicio: SPP_201403_PRE 
    Label16: TLabel;
    pnlapecasben: TPanel;
    medsgapecas: TMaskEdit;
    pnldni: TPanel;
    medni: TMaskEdit;
    // Inicio: HPC_201703_PRE
    // Se añade objeto para el ingreso de email del designatario 
    Label17: TLabel;
    pnlemaildes: TPanel;
    meemaildes: TMaskEdit;
    Label24: TLabel;
    // Fin: HPC_201703_PRE
    // Fin: SPP_201403_PRE
    // Fin: SPP_201305_PRE
      Procedure btnCerrarClick(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormActivate(Sender: TObject);
      Procedure dblcforpagChange(Sender: TObject);
      Procedure dblcBancoChange(Sender: TObject);
      Procedure dblcagegirChange(Sender: TObject);
      Procedure dblctiprelChange(Sender: TObject);
      Procedure dblcidesexChange(Sender: TObject);
      Procedure btnAdicionarClick(Sender: TObject);
      Function validatos: Boolean;
      Procedure dbdtpfecnacExit(Sender: TObject);
      Procedure meporExit(Sender: TObject);
      Procedure dblctiprelExit(Sender: TObject);
      Procedure dblcforpagExit(Sender: TObject);
      Procedure dblcBancoExit(Sender: TObject);
      Procedure dblcagegirExit(Sender: TObject);
    procedure dblcddptoidChange(Sender: TObject);
    procedure dblcddptoidExit(Sender: TObject);
    procedure dblcdProvinciaChange(Sender: TObject);
    procedure dblcdProvinciaExit(Sender: TObject);
    procedure dblcdDistritoExit(Sender: TObject);
    // Inicio: HPC_201703_PRE
    // Procedimientos para la validación del email y numero movil
    procedure memovilKeyPress(Sender: TObject; var Key: Char);
    procedure meemaildesExit(Sender: TObject);
    procedure memovilExit(Sender: TObject);
    // Fin: HPC_201703_PRE
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   Fingdeucar: TFingdeucar;

Implementation

Uses PREDM;

{$R *.dfm}

Procedure TFingdeucar.btnCerrarClick(Sender: TObject);
Begin
   Fingdeucar.Close;
End;

Procedure TFingdeucar.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If Key = #13 Then
   Begin
      Key := #0;
      Perform(CM_DIALOGKEY, VK_TAB, 0);
   End;
End;

Procedure TFingdeucar.FormActivate(Sender: TObject);
Var
   xSql: String;
Begin

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

   If DM1.xSgr = 'M' Then
   Begin
      meapepatben.Text       := DM1.cdsdetcardes.FieldByName('APEPAT').AsString;
      meapematben.Text       := DM1.cdsdetcardes.FieldByName('APEMAT').AsString;
      meapenomben.Text       := DM1.cdsdetcardes.FieldByName('APENOM').AsString;
      dblctiprel.Text        := DM1.cdsdetcardes.FieldByName('TIPREL').AsString;
      medsgotrtiprel.Text    := DM1.cdsdetcardes.FieldByName('DSGOTRTIPREL').AsString; // SPP_201305_PRE
      dbdtpfecnac.Date       := DM1.cdsdetcardes.FieldByName('FECNAC').AsDateTime;
      dblcidesex.Text        := DM1.cdsdetcardes.FieldByName('SEXO').AsString;
      medni.Text             := DM1.cdsdetcardes.FieldByName('DNI').AsString;
      mepor.Text             := FloatToStr(DM1.cdsdetcardes.FieldByName('PORC').AsFloat);
      meapepattut.Text       := DM1.cdsdetcardes.FieldByName('APEPATTUT').AsString;
      meapemattut.Text       := DM1.cdsdetcardes.FieldByName('APEMATTUT').AsString;
      menomtut.Text          := DM1.cdsdetcardes.FieldByName('NOMTUT').AsString;
      mednitut.Text          := DM1.cdsdetcardes.FieldByName('DNITUT').AsString;
      dblcforpag.Text        := DM1.cdsdetcardes.FieldByName('FORPAGID').AsString;
      // Inicio: HPC_201703_PRE
      // Se asigna el campo EMAIL a la variable de email del designatario
      meemaildes.Text        := DM1.cdsdetcardes.FieldByName('EMAILDES').AsString;
      // Fin: HPC_201703_PRE

      medirecciondesgna.Text := DM1.cdsdetcardes.FieldByName('DSGDIRDES').AsString;
      dblcddptoid.Text       := Copy(DM1.cdsdetcardes.FieldByName('DSGZIPIDDES').AsString,1,2);
      medptodes.Text         := DM1.DevuelveValor('APO158', 'DPTODES', 'DPTOID', dblcddptoid.Text);
      dblcdProvincia.Text    := Copy(DM1.cdsdetcardes.FieldByName('DSGZIPIDDES').AsString,1,4);
      meprovinciades.Text    :=  DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', dblcdProvincia.Text);
      dblcdDistrito.Text     := DM1.cdsdetcardes.FieldByName('DSGZIPIDDES').AsString;
      medistritodes.Text     :=  DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', dblcdDistrito.Text);
      metelefonofijo.Text    := DM1.cdsdetcardes.FieldByName('DSGTELFIJDES').AsString;
      memovil.Text           := DM1.cdsdetcardes.FieldByName('DSGTELMOVDES').AsString;
      If DM1.cdsFPago.Locate('TIPDESEID', dblcforpag.Text, []) Then
      Begin
         xSql := 'SELECT BANCOID, BANCONOM FROM TGE105 WHERE FLAVIGPRE = ''S'' AND CLAUXID = ' + QuotedStr(DM1.cdsFPago.FieldByName('FLACOBPRE').AsString);
         DM1.cdsBanco.Close;
         DM1.cdsBanco.DataRequest(xSql);
         DM1.cdsBanco.Open;
      End;
      dblcBanco.Text := DM1.cdsdetcardes.FieldByName('BANCOID').AsString;
      dblcagegir.Text := DM1.cdsdetcardes.FieldByName('AGEBCOID').AsString;
   End;
End;

Procedure TFingdeucar.dblcforpagChange(Sender: TObject);
Begin
   dblcagegir.Text := '';
   meagegir.Text := '';
End;

Procedure TFingdeucar.dblcBancoChange(Sender: TObject);
Begin
   If Trim(dblcBanco.Text) = '' Then medesban.Text := '';
   If Length(dblcBanco.Text) = 2 Then
   Begin
      If DM1.cdsBanco.Locate('BANCOID', dblcBanco.Text, []) Then
      Begin
         medesban.Text := DM1.cdsBanco.FieldByName('BANCONOM').AsString;
      End
      Else
      Begin
         MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
         dblcBanco.Text := '';
         medesban.Text := '';
      End;
   End;
End;

Procedure TFingdeucar.dblcagegirChange(Sender: TObject);
Begin
   If dblcagegir.Text = '' Then meagegir.Text := '';
   If Length(dblcagegir.Text) = 8 Then
   Begin
      If DM1.cdsAgBco.Locate('AGENBCOID', dblcagegir.Text, []) Then
      Begin
         meagegir.Text := DM1.cdsAgBco.FieldByName('AGENBCODES').AsString;
      End
      Else
      Begin
         MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
         dblcagegir.Text := '';
         meagegir.Text := '';
      End;
   End;
End;

Procedure TFingdeucar.dblctiprelChange(Sender: TObject);
Begin
// Inicio: SPP_201305_PRE
   If dblctiprel.Text = '16' Then pnldsgotrtiprel.Enabled := True Else pnldsgotrtiprel.Enabled := False;  
// Fin: SPP_201305_PRE
   dblcforpag.Text := '';
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
            medni.Text := '';
            pnlapepattut.Enabled := True;
            pnlapemattut.Enabled := True;
            pnlnomtut.Enabled := True;
            pnldnitut.Enabled := True;
            pnldni.Enabled := False;
            meapepattut.Color := clWhite;
            meapemattut.Color := clWhite;
            menomtut.Color := clWhite;
            mednitut.Color := clWhite;
            medni.Color := clInfoBk;
            medni.Text := '';
         End
         Else
         Begin
            pnlapepattut.Enabled := False;
            pnlapemattut.Enabled := False;
            pnlnomtut.Enabled := False;
            pnldnitut.Enabled := False;
            pnldni.Enabled := True;
            meapepattut.Color := clInfoBk;
            meapemattut.Color := clInfoBk;
            menomtut.Color := clInfoBk;
            mednitut.Color := clInfoBk;
            medni.Color := clWhite;
            meapepattut.Text := '';
            meapemattut.Text := '';
            menomtut.Text := '';
            mednitut.Text := '';
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

Procedure TFingdeucar.dblcidesexChange(Sender: TObject);
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

Procedure TFingdeucar.btnAdicionarClick(Sender: TObject);
Begin
   If validatos Then
   Begin
      If MessageDlg('¿ Seguro de Actualizar registros de designatarios ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         DM1.xCnd := 'N';
         If DM1.xSgr = 'I' Then DM1.cdsdetcardes.Append;
         If DM1.xSgr = 'M' Then DM1.cdsdetcardes.Edit;
         DM1.cdsdetcardes.FieldByName('APEPAT').AsString := meapepatben.Text;
         DM1.cdsdetcardes.FieldByName('APEMAT').AsString := meapematben.Text;
         DM1.cdsdetcardes.FieldByName('APECAS').AsString := medsgapecas.Text; // SPP_201403_PRE         
         DM1.cdsdetcardes.FieldByName('APENOM').AsString := meapenomben.Text;
         DM1.cdsdetcardes.FieldByName('TIPREL').AsString := dblctiprel.Text;
         DM1.cdsdetcardes.FieldByName('DSGOTRTIPREL').AsString := medsgotrtiprel.Text;  // SPP_201305_PRE
         DM1.cdsdetcardes.FieldByName('FECNAC').AsDateTime := dbdtpfecnac.DateTime;
         DM1.cdsdetcardes.FieldByName('SEXO').AsString := dblcidesex.Text;
         DM1.cdsdetcardes.FieldByName('DNI').AsString := medni.Text;
         DM1.cdsdetcardes.FieldByName('PORC').AsString := mepor.Text;
         DM1.cdsdetcardes.FieldByName('APEPATTUT').AsString := meapepattut.Text;
         DM1.cdsdetcardes.FieldByName('APEMATTUT').AsString := meapemattut.Text;
         DM1.cdsdetcardes.FieldByName('NOMTUT').AsString := menomtut.Text;
         DM1.cdsdetcardes.FieldByName('DNITUT').AsString := mednitut.Text;
         DM1.cdsdetcardes.FieldByName('FORPAGID').AsString := dblcforpag.Text;
         DM1.cdsdetcardes.FieldByName('BANCOID').AsString := dblcBanco.Text;
         DM1.cdsdetcardes.FieldByName('AGEBCOID').AsString := dblcagegir.Text;
         DM1.cdsdetcardes.FieldByName('DSGDIRDES').AsString := medirecciondesgna.Text;
         DM1.cdsdetcardes.FieldByName('DSGZIPIDDES').AsString     := dblcdDistrito.Text;
         DM1.cdsdetcardes.FieldByName('DSGTELFIJDES').AsString  := metelefonofijo.Text;
         DM1.cdsdetcardes.FieldByName('DSGTELMOVDES').AsString     := memovil.Text;
         // Inicio: HPC_201703_PRE 
         // Se guarda en un dataset el email del designatario
         DM1.cdsdetcardes.FieldByName('EMAILDES').AsString     := meemaildes.Text;         
         // Fin: HPC_201703_PRE
         DM1.cdsdetcardes.Post;
         DM1.xFlg := 'S';
         Fingdeucar.Close;
      End;
   End;
End;

Function TFingdeucar.validatos: Boolean;
Var
   edad: Integer;
Begin
   // Inicio: HPC_201609_PRE
   // Se valida el ingreso de la fecha de nacimiento
   If dblctiprel.Text = '16' Then
   Begin
      If Trim(dbdtpfecnac.Text) = '' Then
      Begin
         MessageDlg('Debe ingresar la fecha de nacimiento', mtInformation, [mbOk], 0);
         Result := False;
         dbdtpfecnac.SetFocus;
         Exit;
      End;
   End;
   // Fin: HPC_201609_PRE
   edad := DM1.CalculaEdad(dbdtpfecnac.Text, DateToStr(DM1.FechaSys));
   If Trim(meapepatben.Text) = '' Then
   Begin
      MessageDlg('Apellido paterno del designatario no valido', mtInformation, [mbOk], 0);
      Result := False;
      meapepatben.SetFocus;
      Exit;
   End;
   If Trim(meapematben.Text) = '' Then
   Begin
      MessageDlg('Apellido materno del designatario no valido', mtInformation, [mbOk], 0);
      Result := False;
      meapematben.SetFocus;
      Exit;
   End;
   If Trim(meapenomben.Text) = '' Then
   Begin
      MessageDlg('Nombre del desiganario no valido', mtInformation, [mbOk], 0);
      Result := False;
      meapenomben.SetFocus;
      Exit;
   End;
   If Trim(dblctiprel.text) = '' Then
   Begin
      MessageDlg('Tipo de relación no valido', mtInformation, [mbOk], 0);
      Result := False;
      dblctiprel.SetFocus;
      Exit;
   End;
   If trim(dbdtpfecnac.Text) = '' Then
   Begin
      MessageDlg('Fecha de nacimiento del designatario no valido', mtInformation, [mbOk], 0);
      Result := False;
      dbdtpfecnac.SetFocus;
      Exit;
   End;
   If trim(dblcidesex.Text) = '' Then
   Begin
      MessageDlg('Sexo del designatario no valido', mtInformation, [mbOk], 0);
      Result := False;
      dblcidesex.SetFocus;
      Exit;
   End;

   If Trim(mepor.Text) = '' Then
   Begin
      MessageDlg('Porcentaje de designación no valido', mtInformation, [mbOk], 0);
      Result := False;
      mepor.SetFocus;
      Exit;
   End;
   // Inicio: SPP_201304_PRE
   // Se retira validaciòn de direcciòn y telefono fijo del beneficiario
   // Inicio: SPP_201303_PRE
   // If Trim(medirecciondesgna.Text) = '' Then
   // Begin
   // MessageDlg('Dirección de designatario no valido', mtInformation, [mbOk], 0);
   // Result := False;
   // medirecciondesgna.SetFocus;
   // Exit;
   // End;
   // If Length(Trim(dblcdDistrito.Text)) <> 6 Then
   // Begin
   // MessageDlg('Código de distrito de la dirección de designatario no valido', mtInformation, [mbOk], 0);
   // Result := False;
   // dblcddptoid.Text    := '';
   // dblcdProvincia.Text := '';
   // dblcdDistrito.Text  := '';
   // dblcddptoid.SetFocus;
   // Exit;
   // End;
   // If Trim(metelefonofijo.Text) = '' Then
   // Begin
   // MessageDlg('Telefono Fijo de designatario no valido', mtInformation, [mbOk], 0);
   // Result := False;
   // metelefonofijo.SetFocus;
   // Exit;
   // End;
   // Fin: SPP_201303_PRE
   // Fin: SPP_201304_PRE
   // Inicio: HPC_201609_PRE
   // Se valida que para tipo de relación Otros que sean menores de edad se exija datos del tutor y DNI
   // If (dblctiprel.Text = '02') Then
   If (dblctiprel.Text = '02') Or ((dblctiprel.Text = '16') And (edad < 18)) Then
   // Fin: HPC_201609_PRE
   Begin
      If Trim(meapepattut.Text) = '' Then
      Begin
         MessageDlg('Apellido paterno del tutor no valido', mtInformation, [mbOk], 0);
         Result := False;
         meapepattut.SetFocus;
         Exit;
      End;
      If Trim(meapemattut.Text) = '' Then
      Begin
         MessageDlg('Apellido materno del tutor no valido', mtInformation, [mbOk], 0);
         Result := False;
         meapemattut.SetFocus;
         Exit;
      End;
      If Trim(menomtut.Text) = '' Then
      Begin
         MessageDlg('Nombre del tutor no valido', mtInformation, [mbOk], 0);
         Result := False;
         menomtut.SetFocus;
         Exit;
      End;
      If Trim(mednitut.Text) = '' Then
      Begin
         MessageDlg('DNI del tutor no valido', mtInformation, [mbOk], 0);
         Result := False;
         mednitut.SetFocus;
         Exit;
      End;
   End
   Else
   Begin
      If ((dblctiprel.Text = '15') And (edad > 18)) Or ((dblctiprel.Text = '16') And (edad > 18)) Then
      Begin
         If Trim(medni.Text) = '' Then
         Begin
            MessageDlg('dni del designatario no valido', mtInformation, [mbOk], 0);
            Result := False;
            medni.SetFocus;
            Exit;
         End;
      End;
   End;
   If Trim(dblcforpag.Text) = '' Then
   Begin
      MessageDlg('Forma de pago no valido', mtInformation, [mbOk], 0);
      Result := False;
      dblcforpag.SetFocus;
      Exit;
   End;
   If Trim(dblcBanco.Text) = '' Then
   Begin
      MessageDlg('Banco no valido', mtInformation, [mbOk], 0);
      Result := False;
      dblcBanco.SetFocus;
      Exit;
   End;
   If dblcforpag.Text = '05' Then
   Begin
      If Trim(dblcagegir.Text) = '' Then
      Begin
         MessageDlg('Código de agencia no valido', mtInformation, [mbOk], 0);
         Result := False;
         dblcagegir.SetFocus;
         Exit;
      End;
   End;
   Result := True;
End;

Procedure TFingdeucar.dbdtpfecnacExit(Sender: TObject);
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
      dblcforpag.Text := '11';
      pnldni.Enabled := False;
      medni.Color := clInfoBk;
      medni.Text := '';
      pnlapepattut.Enabled := True;
      meapepattut.Color := clWhite;
      pnlapemattut.Enabled := True;
      meapemattut.Color := clWhite;
      pnlnomtut.Enabled := True;
      menomtut.Color := clWhite;
      pnldnitut.Enabled := True;
      mednitut.Color := clWhite;
   End
   Else
   Begin
      dblcforpag.Text := '';
      pnldni.Enabled := True;
      medni.Color := clWhite;
      pnlapepattut.Enabled := False;
      meapepattut.Color := clInfoBk;
      meapepattut.Text := '';
      pnlapemattut.Enabled := False;
      meapemattut.Color := clInfoBk;
      meapemattut.Text := '';
      pnlnomtut.Enabled := False;
      menomtut.Color := clInfoBk;
      menomtut.Text := '';
      pnldnitut.Enabled := False;
      mednitut.Color := clInfoBk;
      mednitut.Text := '';
   End;
End;

Procedure TFingdeucar.meporExit(Sender: TObject);
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

Procedure TFingdeucar.dblctiprelExit(Sender: TObject);
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

Procedure TFingdeucar.dblcforpagExit(Sender: TObject);
Var
   xSql: String;
Begin
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
      pnldesban.Visible := True;
      If (dblcforpag.Text = '01') Or (dblcforpag.Text = '11') Or (dblcforpag.Text = '16') Then
      Begin
         lblagegir.Visible := False;
         dblcagegir.Visible := False;
         pnlagegir.Visible := False;
         dblcBanco.Text := '03';
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
         lblagegir.Visible := True;
         dblcagegir.Visible := True;
         pnlagegir.Visible := True;
         dblcBanco.Text := '04';
      End;
      If dblcforpag.Text = '06' Then
      Begin
         lblagegir.Visible := False;
         dblcagegir.Visible := False;
         pnlagegir.Visible := False;
         dblcBanco.Text := '04';
      End;
      If dblcforpag.Text = '19' Then
      Begin
         lblagegir.Visible := False;
         dblcagegir.Visible := False;
         pnlagegir.Visible := False;
         dblcBanco.Text := '15';
      End;
   End
   Else
   Begin
      MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
      dblcforpag.Text := '';
      meforpagodes.Text := '';
   End;
End;

Procedure TFingdeucar.dblcBancoExit(Sender: TObject);
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

Procedure TFingdeucar.dblcagegirExit(Sender: TObject);
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

procedure TFingdeucar.dblcddptoidExit(Sender: TObject);
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
         dblcdDistrito.Text  := '';
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
      dblcdDistrito.Text  := '';
      medistritodes.Text  := '';
      MessageDlg('Código errado', mtError, [mbOk], 0);
      // dblcddptoid.SetFocus; SPP_201304_PRE
   End;
end;

procedure TFingdeucar.dblcdProvinciaExit(Sender: TObject);
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
        dblcdDistrito.Selected.Clear;
        dblcdDistrito.Selected.Add('ZIPID'#9'6'#9'Ubigeo'#9#9);
        dblcdDistrito.Selected.Add('ZIPDES'#9'23'#9'Distrito'#9#9);
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
     // dblcdProvincia.SetFocus; SPP_201304_PRE
  End;
end;

procedure TFingdeucar.dblcdDistritoExit(Sender: TObject);
begin
   If Length(trim(dblcdDistrito.Text)) = 6 Then
  Begin
    If DM1.cdsDist.Locate('ZIPID',VarArrayof([dblcdDistrito.text]),[]) Then
    Begin
      medistritodes.Text := DM1.cdsDist.FieldByName('ZIPDES').AsString;
    End
    Else
    Begin
      medistritodes.Text := '';
      dblcdDistrito.Text := '';
      MessageDlg('Código errado', mtError, [mbOk], 0);
      dblcdDistrito.SetFocus;
    End;
  End
  Else
  Begin
    dblcdDistrito.Text := '';
    medistritodes.Text := '';
    MessageDlg('Código errado', mtError, [mbOk], 0);
    // dblcdDistrito.SetFocus; SPP_201304_PRE
  End;
end;

procedure TFingdeucar.dblcddptoidChange(Sender: TObject);
begin
  dblcdProvincia.Text := '';
  meprovinciades.Text := '';
  dblcdDistrito.Text  := '';
  medistritodes.Text  := '';
end;

procedure TFingdeucar.dblcdProvinciaChange(Sender: TObject);
begin
  dblcdDistrito.Text := '';
  medistritodes.Text := '';
end;

// Inicio: HPC_201703_PRE
// Procedimientos del validación del email y numro de celular del designatario
procedure TFingdeucar.memovilKeyPress(Sender: TObject; var Key: Char);
begin
   If Not (Key In ['0'..'9','.',#8]) Then
   Begin
      Key:=#0;
      MessageDlg('Introduzca solo números.', mtError, [mbOk], 0);
   End;
end;

procedure TFingdeucar.meemaildesExit(Sender: TObject);
Var xSql:String;
begin
   If Trim(meemaildes.Text) <> '' Then
   Begin
      xSql := 'SELECT SF_ASO_VALIDA_DIR_CORREO('+QuotedStr(Trim(meemaildes.Text))+') VALOR FROM DUAL';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      If DM1.cdsQry.FieldByName('VALOR').AsInteger <> 0 Then
      Begin
         MessageDlg('Email no valido, o debe dejar en blanco.', mtInformation, [mbOk], 0);
         meemaildes.SetFocus;
      End;
   End;
end;

procedure TFingdeucar.memovilExit(Sender: TObject);
begin
  If Copy(Trim(memovil.Text),1,1) <> '9' Then
  Begin
    MessageDlg('Número de celular debe empezar con 9.', mtError, [mbOk], 0);
    memovil.SetFocus;
    Exit;
  End;
  If Length(Trim(memovil.Text)) <> 9 Then
  Begin
    MessageDlg('Número de celular debe contener 9 dígitos.', mtError, [mbOk], 0);
    memovil.SetFocus;
    Exit;
  End;
end;
// Fin: HPC_201703_PRE

End.

