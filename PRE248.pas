Unit PRE248;

// Inicio Uso Estándares         : 01/08/2011
// Unidad                        : PRE248
// Formulario                    : Fnueretjud
// Fecha de Creación             : 2002
// Autor                         : Área de Desarrollo DM
// Objetivo                      : Mantenimiento de Retenciones Judiciales

// Actualizaciones:
// HPP_200903_PRE
// HPC_201204_PRE : SE AÑADE AL MANTENIMIENTO DE RETENCIONES LA OPCION QUE SE PUEDA INGRESAR MONTO O PORCENTAJE
// DPP_201204_PRE : Se realiza el pase a producción a partir del pase HPC_201204_PRE
// HPC_201209_PRE : Modifica la forma de pago
// SPP_201301_PRE : El pase se realiza de acuerdo a lo indicado en el HPC_201209_PRE
// HPC_201305_PRE : Se retira el mensaje que se muestra por defecto en la caja de text "pagar a"
//                  Se retira todos los componentes RX
// SPP_201306_PRE : Se realiza el pase a producción a partir del HPC_201305_PRE

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Buttons, StdCtrls, Mask, ExtCtrls, wwdblook, Wwdbdlg,
   wwdbdatetimepicker, ToolEdit, CurrEdit;

Type
   TFnueretjud = Class(TForm)
      GroupBox1: TGroupBox;
      Label1: TLabel;
      pnlasocodmod: TPanel;
      meAsocodmod: TMaskEdit;
      sbBuscar: TSpeedButton;
      pnlasodocnum: TPanel;
      meAsoDocNum: TMaskEdit;
      Label7: TLabel;
      Label3: TLabel;
      pnlasoapenomDni: TPanel;
      meAsoApeNomDni: TMaskEdit;
      GroupBox2: TGroupBox;
      pnlbenret: TPanel;
      mebenret: TMaskEdit;
      Label2: TLabel;
      Label4: TLabel;
      pnldesdocide: TPanel;
      medesdocide: TMaskEdit;
      Label5: TLabel;
      pnlobsret: TPanel;
      meobsret: TMaskEdit;
      pnlnumdocide: TPanel;
      menumdocide: TMaskEdit;
      Label6: TLabel;
      lbltipret: TLabel;
      pnlmonret: TPanel;
      Label8: TLabel;
      Label9: TLabel;
      pnlnumofi: TPanel;
      menumofi: TMaskEdit;
      dbdtpfecofi: TwwDBDateTimePicker;
      Label11: TLabel;
      pnlpagara: TPanel;
      mepagara: TMaskEdit;
      gbforpag: TGroupBox;
      lblforpag: TLabel;
      dblcforpag: TwwDBLookupCombo;
      lblbanco: TLabel;
      dblcBanco: TwwDBLookupCombo;
      lblagegir: TLabel;
      lblasoncta: TLabel;
      pnlasoncta: TPanel;
      measoncta: TMaskEdit;
      pnlagegir: TPanel;
      meagengir: TMaskEdit;
      pnlbanco: TPanel;
      mebancodes: TMaskEdit;
      pnlforpag: TPanel;
      meforpagodes: TMaskEdit;
      dblctipdoc: TwwDBLookupCombo;
   // Inicio: DPP_201204_PRE
      //Label10: TLabel;
   // Fin: DPP_201204_PRE

      Label12: TLabel;
      pnlnomjuz: TPanel;
      menomjuz: TMaskEdit;
      btngrabar: TBitBtn;
      btnsalir: TBitBtn;
      dblcagegir: TwwDBLookupComboDlg;
      btnedita: TBitBtn;
   // Inicio: DPP_201204_PRE
      // memonret: TMaskEdit;
      rgporcentaje: TRadioGroup;
      // Inicio: SPP_201306_PRE Se retira componente RX
      // meporcentaje: TCurrencyEdit;
      // Fin: SPP_201306_PRE
      lblporcentaje: TLabel;
      lblporcentaje2: TLabel;
      meporcentaje: TMaskEdit; //SPP_201306_PRE Se añade en remplaza de meporcentaje: TCurrencyEdit
   // Fin: DPP_201204_PRE

      Procedure sbBuscarClick(Sender: TObject);
      Procedure meAsocodmodExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure meAsocodmodChange(Sender: TObject);
      Procedure FormActivate(Sender: TObject);
      Procedure dblcBancoChange(Sender: TObject);
      Procedure btnsalirClick(Sender: TObject);
      Procedure dblctipdocChange(Sender: TObject);
      Procedure mepagaraExit(Sender: TObject);
      Procedure btngrabarClick(Sender: TObject);
      Procedure dblcagegirChange(Sender: TObject);
      Procedure btneditaClick(Sender: TObject);
   // Inicio: DPP_201204_PRE
      //Procedure memonretExit(Sender: TObject);
   // Fin: DPP_201204_PRE
   //   Procedure menomjuzExit(Sender: TObject); SPP_201306_PRE Se retira colocar valor por defecto a caja de texto "pagar a"
      Procedure dblctipdocExit(Sender: TObject);
      Procedure dblcBancoExit(Sender: TObject);
      Procedure dblcagegirExit(Sender: TObject);
      Procedure dblcforpagExit(Sender: TObject);
      Procedure dblcforpagChange(Sender: TObject);
   // Inicio: DPP_201204_PRE
      procedure rgporcentajeClick(Sender: TObject);
      procedure meporcentajeExit(Sender: TObject);
      procedure meporcentajeKeyPress(Sender: TObject; var Key: Char); // SPP_201306_PRE Se añade validación de numeros a caja de texto 
   // Fin: DPP_201204_PRE
   Private
    { Private declarations }
      Procedure llena;
      Procedure limpia;
      Procedure llenamod;
      Function chequeadatos: Boolean;
   Public
    { Public declarations }
   End;

Var
   Fnueretjud: TFnueretjud;
// Inicio: DPP_201204_PRE
   porcRetencion, valorRetencion :Double;
// Fin: DPP_201204_PRE

Implementation

Uses PREDM, PRE234;

{$R *.dfm}

Procedure TFnueretjud.sbBuscarClick(Sender: TObject);
Begin
   meAsocodmod.Text := '';
   DM1.xFlg := 'S';
   limpia;
   Try
      FBusAso := TFBusAso.create(Self);
      FBusAso.ShowModal;
   Finally
      FBusAso.Free;
   End;
   llena;
   mebenret.SetFocus;
End;

Procedure TFnueretjud.meAsocodmodExit(Sender: TObject);
Var
   xSql: String;
Begin
   If DM1.xCnd = 'I' Then
   Begin
      If Length(meAsocodmod.Text) <> 0 Then
      Begin
         meAsocodmod.Text := DM1.StrZero(trim(meAsocodmod.Text), 10);
         xSql := 'SELECT ASOID, ASOCODMOD, ASODNI, ASOAPENOMDNI, B.USENOM, C.ASOTIPDES, A.*   FROM APO201 A, APO101 B, APO107 C WHERE ASOCODMOD = ' + QuotedStr(DM1.StrZero(trim(meAsocodmod.Text), 10))
            + ' AND A.USEID = B.USEID(+) AND A.UPAGOID = B.UPAGOID(+) AND A.UPROID = B.UPROID(+)'
            + ' AND A.ASOTIPID = C.ASOTIPID';
         DM1.cdsAsociado.Close;
         DM1.cdsAsociado.DataRequest(xSql);
         DM1.cdsAsociado.Open;
         If DM1.cdsAsociado.RecordCount > 1 Then
         Begin
            Try
               FBusAso := TFBusAso.create(Self);
               FBusAso.ShowModal;
            Finally
               FBusAso.Free;
            End;
         End
         Else
         Begin
            If DM1.cdsAsociado.RecordCount = 1 Then llena;
            If DM1.cdsAsociado.RecordCount = 0 Then
            Begin
               MessageDlg('Código modular ingresado no exste', mtError, [mbOk], 0);
               meAsocodmod.Text := '';
               meAsocodmod.SetFocus;
            End;
         End;
      End;
   End;

   If (DM1.xCnd = 'I') And (meAsocodmod.Text <> '') Then
   Begin
      xSql := 'SELECT * FROM PVS306 WHERE ASOID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)
         + ' AND PVSESTLIQ IN(''02'',''05'', ''06'')';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      If DM1.cdsQry.RecordCount > 0 Then
      Begin
         MessageDlg('El tipo de asociado seleccionado ya fue liquidado', mtError, [mbOk], 0);
         meAsocodmod.Visible := True;
         meAsocodmod.Enabled := True;
         meAsocodmod.Text := '';
         meAsocodmod.SetFocus;
         Exit;
      End;
   End;
End;

Procedure TFnueretjud.llena;
Var
   xSql: String;
Begin
   meAsocodmod.Text := DM1.cdsAsociado.FieldByName('ASOCODMOD').AsString;
   meAsoApeNomDni.Text := DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString;
   If DM1.cdsAsociado.FieldByName('ASODNI').AsString = '' Then
   Begin
      xSql := 'SELECT TIPDOCABR FROM TGE159 WHERE TIPDOCCOD = ' + QuotedStr(DM1.cdsAsociado.FieldByName('TIPDOCCOD').AsString);
      DM1.cdsQry1.Close;
      DM1.cdsQry1.DataRequest(xSql);
      DM1.cdsQry1.Open;
      meAsoDocNum.Text := DM1.cdsQry1.FieldByName('TIPDOCABR').AsString + '-' + DM1.cdsAsociado.FieldByName('ASODOCNUM').AsString;
   End
   Else
   Begin
      xSql := 'SELECT TIPDOCABR FROM TGE159 WHERE TIPDOCCOD = ' + QuotedStr('10');
      DM1.cdsQry1.Close;
      DM1.cdsQry1.DataRequest(xSql);
      DM1.cdsQry1.Open;
      meAsoDocNum.Text := DM1.cdsQry1.FieldByName('TIPDOCABR').AsString + '-' + DM1.cdsAsociado.FieldByName('ASODNI').AsString;
   End;
   dblcforpag.Text := '01';
   dblcBanco.Text := '03';
   If meobsret.Text = '' Then meobsret.Text := 'Retención por alimentos';
End;

Procedure TFnueretjud.limpia;
Begin
   meAsocodmod.Text := '';
   meAsoDocNum.Text := '';
   meAsoApeNomDni.Text := '';
End;

Procedure TFnueretjud.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If Key = #13 Then
   Begin
      Key := #0;
      Perform(CM_DIALOGKEY, VK_TAB, 0);
   End;
End;

Procedure TFnueretjud.meAsocodmodChange(Sender: TObject);
Begin
   If meAsocodmod.Text = '' Then limpia;
End;

Procedure TFnueretjud.FormActivate(Sender: TObject);
Var
   xSql: String;
Begin
   // Inicio: SPP_201306_PRE Se coloca valores por defecto a caja de texto de pago de retención 
   rgporcentaje.ItemIndex := 0;
   lblporcentaje.Caption  := 'S/.';
   lblporcentaje2.Caption := 'Monto';
   // Fin: SPP_201306_PRE

   xSql := 'SELECT TIPDOCCOD, TIPDOCDES, TIPDOCABR FROM TGE159';
   DM1.cdsTDoc.Close;
   DM1.cdsTDoc.DataRequest(xSql);
   DM1.cdsTDoc.Open;

   // Inicio: SPP_201301_PRE POR EALVA
   xSql := 'SELECT TIPDESEID, TIPDESEDES, FLACOBPRE FROM CRE104 WHERE NVL(FLAVIGPRE,''X'') = ''S'' AND TIPDESEID<>''19'' ORDER BY TIPDESEID'; 
   // Fin: SPP_201301_PRE POR EALVA
   DM1.cdsFPago.Close;
   DM1.cdsFPago.DataRequest(xSql);
   DM1.cdsFPago.Open;

   dblctipdoc.Selected.Clear;
   dblctipdoc.Selected.Add('TIPDOCCOD'#9'2'#9'Código'#9#9);
   dblctipdoc.Selected.Add('TIPDOCDES'#9'25'#9'Descripción'#9#9);
   If DM1.xCnd = 'I' Then meAsocodmod.SetFocus;
// Inicio: DPP_201204_PRE
// If DM1.xCnd = 'M' Then llenamod;
// Fin: DPP_201204_PRE
   If DM1.xCnd = 'M' Then
   Begin
// Inicio: DPP_201204_PRE
      llenamod;
// Fin: DPP_201204_PRE
      If DM1.cdsMaestRetJud.FieldByName('PVSLBENNR').AsString <> '' Then
      Begin
         btnedita.Enabled := False;
         btngrabar.Enabled := False;
      End
      Else
      Begin
         btnedita.Enabled := True;
         btngrabar.Enabled := True;
      End;
   End;
End;

Procedure TFnueretjud.dblcBancoChange(Sender: TObject);
Var
   xSql: String;
Begin
   If dblcBanco.Text = '' Then
   Begin
      mebancodes.Text := '';
      dblcagegir.Text := '';
   End;
   If Length(dblcBanco.Text) = 2 Then
   Begin
      If DM1.cdsBanco.Locate('BANCOID', dblcBanco.Text, []) Then
      Begin
         mebancodes.Text := DM1.cdsBanco.FieldByName('BANCONOM').AsString;
         If dblcforpag.Text = '05' Then
         Begin
            xSql := 'SELECT A.AGENBCOID, A.AGENBCODES, B.DPTODES FROM COB102 A, APO158 B WHERE A.DPTOID = B.DPTOID(+) AND A.BANCOID = ' + QuotedStr(dblcBanco.Text)
               + ' ORDER BY DPTODES, AGENBCODES';
            DM1.cdsAgBco.Close;
            DM1.cdsAgBco.DataRequest(xSql);
            DM1.cdsAgBco.Open;
         End;
      End
      Else
      Begin
         MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
         dblcBanco.Text := '';
         mebancodes.Text := '';
      End;
   End;
  //Si es forma de pago abono en cuenta solo se muestra el numero de cuenta
   If dblcforpag.Text = '06' Then
   Begin
      lblasoncta.Visible := true;
      pnlasoncta.Visible := true;
      lblasoncta.Top := 71;
      pnlasoncta.Top := 71;
      lblagegir.Visible := false;
      dblcagegir.Visible := false;
      pnlagegir.Visible := false;
      dblcBanco.SetFocus;
   End;
  //Si es forma de pago giro se muestran las oficinas
   If dblcforpag.Text = '05' Then
   Begin
      lblasoncta.Visible := false;
      pnlasoncta.Visible := false;
      dblcagegir.Visible := true;
      pnlagegir.Visible := true;
      lblagegir.Visible := true;
   End;
  //Si es forma de pago abono en cuenta solo se muestra el numero de cuenta
   If dblcforpag.Text = '11' Then
   Begin
      lblasoncta.Visible := false;
      pnlasoncta.Visible := false;
      lblagegir.Visible := false;
      dblcagegir.Visible := false;
      pnlagegir.Visible := false;
      dblcBanco.SetFocus;
   End;
End;

Procedure TFnueretjud.btnsalirClick(Sender: TObject);
Begin
   Fnueretjud.Close;
End;

Procedure TFnueretjud.dblctipdocChange(Sender: TObject);
Begin
   If Length(dblctipdoc.Text) = 2 Then
   Begin
      If DM1.cdsTDoc.Locate('TIPDOCCOD', dblctipdoc.Text, []) Then
      Begin
         medesdocide.Text := DM1.cdsTDoc.FieldByName('TIPDOCDES').AsString;
      End
      Else
      Begin
         MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
         dblctipdoc.Text := '';
         medesdocide.Text := '';
      End;
   End;
End;

Procedure TFnueretjud.mepagaraExit(Sender: TObject);
Begin
   dblcforpag.Text := '01';
   dblcBanco.Text := '03';
End;

Procedure TFnueretjud.btngrabarClick(Sender: TObject);
Var
   xSql: String;

Begin
   If meAsoApeNomDni.Text = '' Then
   Begin
      MessageDlg(' Seleccione primero el asociado ', mtInformation, [mbOk], 0);
      meAsocodmod.SetFocus;
      Exit;
   End;
   If chequeadatos Then
   Begin
      If DM1.xCnd = 'I' Then
      Begin
         If MessageDlg('¿ Seguro de insertar la retención judicial ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
         Begin
            xSql := 'INSERT INTO PVS305 (CIAID, ASOID, ASOAPENOMDNI, TIPDOCBEN, NUMDOCBEN, APENOMBEN, RTJGIRAR,'
            // Inicio: DPP_201204_PRE
               + ' RTJOBS, RTJPORC, RTJIMPOR, RTJJUZG, RTJNOFIC, RTJFREC, FORPAGOID, BANCOID, AGENBCOID, CUEAHO, USUARIO, FREG, HREG)'
               + ' VALUES (' + QuotedStr('02') + ',' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)
               + ',' + QuotedStr(Copy(DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString, 1, 60)) + ',' + QuotedStr(dblctipdoc.Text)
               + ',' + QuotedStr(menumdocide.Text) + ',' + QuotedStr(mebenret.Text) + ',' + QuotedStr(mepagara.Text) + ',' + QuotedStr(meobsret.Text)
               + ',' + FloatToStr(porcRetencion)+ ',' + FloatToStr(valorRetencion)
            // Fin: DPP_201204_PRE
               + ',' + QuotedStr(menomjuz.Text) + ',' + QuotedStr(menumofi.Text) + ',' + QuotedStr(dbdtpfecofi.Text) + ',' + QuotedStr(dblcforpag.Text)
               + ',' + QuotedStr(dblcBanco.Text) + ',' + QuotedStr(dblcagegir.Text) + ',' + QuotedStr(measoncta.Text)
               + ',' + QuotedStr(DM1.wUsuario) + ',' + 'TO_DATE(SYSDATE), SYSDATE )';
            DM1.DCOM1.AppServer.EjecutaSQL(xSql);
            MessageDlg(' Grabación Ok ', mtInformation, [mbOk], 0);
            Fnueretjud.Close;
            DM1.cdsMaestRetJud.Close;
            DM1.cdsMaestRetJud.DataRequest(DM1.xsqlPublic);
            DM1.cdsMaestRetJud.Open;
         End;
      End;
      If DM1.xCnd = 'M' Then
      Begin
         If MessageDlg('¿ Seguro de Modificar la retencion judicial ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
         Begin
            xSql := 'UPDATE PVS305 SET '
               + ' APENOMBEN = ' + QuotedStr(mebenret.Text)
               + ', TIPDOCBEN = ' + QuotedStr(dblctipdoc.Text)
               + ', NUMDOCBEN = ' + QuotedStr(menumdocide.Text)
               + ', RTJOBS = ' + QuotedStr(meobsret.Text)
              // Inicio: DPP_201204_PRE
               + ', RTJPORC  = ' + FloatToStr(porcRetencion)
               + ', RTJIMPOR = ' + FloatToStr(valorRetencion)
               // Fin: DPP_201204_PRE
               + ', RTJJUZG = ' + QuotedStr(menomjuz.Text)
               + ', RTJNOFIC = ' + QuotedStr(menumofi.Text)
               + ', RTJFREC = ' + QuotedStr(dbdtpfecofi.Text)
               + ', FORPAGOID = ' + QuotedStr(dblcforpag.Text)
               + ', BANCOID = ' + QuotedStr(dblcBanco.Text)
               + ', AGENBCOID = ' + QuotedStr(dblcagegir.Text)
               + ', CUEAHO = ' + QuotedStr(measoncta.Text)
               + ', RTJGIRAR = ' + QuotedStr(mepagara.Text)
               + ' WHERE ASOID = ' + QuotedStr(DM1.cdsMaestRetJud.FieldByName('ASOID').AsString)
               + ' AND APENOMBEN = ' + QuotedStr(DM1.cdsMaestRetJud.FieldByname('APENOMBEN').AsString);
            DM1.DCOM1.AppServer.EjecutaSQL(xSql);
            MessageDlg(' Grabación Ok ', mtInformation, [mbOk], 0);
            Fnueretjud.Close;
            DM1.cdsMaestRetJud.Close;
            DM1.cdsMaestRetJud.DataRequest(DM1.xsqlPublic);
            DM1.cdsMaestRetJud.Open;
         End;
      End;
   End;
End;

Procedure TFnueretjud.dblcagegirChange(Sender: TObject);
Begin
   If dblcforpag.Text = '05' Then
   Begin
      If dblcagegir.Text = '' Then
      Begin
         meagengir.Text := '';
         dblcBanco.Text := '';
      End;
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
End;

Procedure TFnueretjud.llenamod;
Var
   xSql: String;
Begin
   xSql := 'SELECT * FROM APO201 WHERE ASOID = ' + QuotedStr(DM1.cdsMaestRetJud.FieldByName('ASOID').AsString);
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   meAsocodmod.Text := DM1.cdsQry.FieldByName('ASOCODMOD').AsString;
   meAsoApeNomDni.Text := DM1.cdsQry.FieldByName('ASOAPENOMDNI').AsString;
   If DM1.cdsQry.FieldByName('ASODNI').AsString = '' Then
   Begin
      xSql := 'SELECT TIPDOCABR FROM TGE159 WHERE TIPDOCCOD = ' + QuotedStr(DM1.cdsQry.FieldByName('TIPDOCCOD').AsString);
      DM1.cdsQry1.Close;
      DM1.cdsQry1.DataRequest(xSql);
      DM1.cdsQry1.Open;
      meAsoDocNum.Text := DM1.cdsQry1.FieldByName('TIPDOCABR').AsString + '-' + DM1.cdsQry.FieldByName('ASODOCNUM').AsString;
   End
   Else
   Begin
      xSql := 'SELECT TIPDOCABR FROM TGE159 WHERE TIPDOCCOD = ' + QuotedStr('10');
      DM1.cdsQry1.Close;
      DM1.cdsQry1.DataRequest(xSql);
      DM1.cdsQry1.Open;
      meAsoDocNum.Text := DM1.cdsQry1.FieldByName('TIPDOCABR').AsString + '-' + DM1.cdsQry.FieldByName('ASODNI').AsString;
   End;
   pnlasocodmod.Enabled := False;
   pnlasodocnum.Enabled := False;
   pnlasoapenomDni.Enabled := False;
   mebenret.Text := DM1.cdsMaestRetJud.FieldByName('APENOMBEN').AsString;
   dblctipdoc.Text := DM1.cdsMaestRetJud.FieldByName('TIPDOCBEN').AsString;
   menumdocide.Text := DM1.cdsMaestRetJud.FieldByName('NUMDOCBEN').AsString;
   meobsret.Text := DM1.cdsMaestRetJud.FieldByName('RTJOBS').AsString;
   // Inicio: DPP_201204_PRE
   If DM1.cdsMaestRetJud.FieldByName('RTJPORC').AsFloat > 0 Then
   Begin
      rgporcentaje.ItemIndex := 1;
      lblporcentaje.Caption := '%';
      lblporcentaje2.Caption := 'Porcentaje';
      // Inicio: SPP_201306_PRE Se modifica la forma de asignacion de valor al componente
      // meporcentaje.Value := DM1.cdsMaestRetJud.FieldByName('RTJPORC').AsFloat;
      meporcentaje.Text :=  FloatToStr(DM1.cdsMaestRetJud.FieldByName('RTJPORC').AsFloat);
      // Fin: SPP_201306_PRE
   End;
   If DM1.cdsMaestRetJud.FieldByName('RTJIMPOR').AsFloat > 0 Then
   Begin
      rgporcentaje.ItemIndex := 0;   
      lblporcentaje.Caption := 'S/.';
      lblporcentaje2.Caption := 'Monto';
      // Inicio: SPP_201306_PRE Se modifica la forma de asignacion de valor al componente
      // meporcentaje.Value := DM1.cdsMaestRetJud.FieldByName('RTJIMPOR').AsFloat;
      meporcentaje.Text :=    FloatToStr(DM1.cdsMaestRetJud.FieldByName('RTJIMPOR').AsFloat);
      // Fin: SPP_201306_PRE
   End;
   // Fin: DPP_201204_PRE
   menomjuz.Text := DM1.cdsMaestRetJud.FieldByName('RTJJUZG').AsString;
   menumofi.Text := DM1.cdsMaestRetJud.FieldByName('RTJNOFIC').AsString;
   dbdtpfecofi.Date := DM1.cdsMaestRetJud.FieldByName('RTJFREC').AsDateTime;
   mepagara.Text := DM1.cdsMaestRetJud.FieldByName('RTJGIRAR').AsString;
   dblcforpag.Text := DM1.cdsMaestRetJud.FieldByName('FORPAGOID').AsString;
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
   End;
   dblcBanco.Text := DM1.cdsMaestRetJud.FieldByName('BANCOID').AsString;
   dblcagegir.Text := DM1.cdsMaestRetJud.FieldByName('AGENBCOID').AsString;
   measoncta.Text := DM1.cdsMaestRetJud.FieldByName('CUEAHO').AsString;
   pnlasocodmod.Enabled := False;
   pnlasodocnum.Enabled := False;
   pnlasoapenomDni.Enabled := False;
   pnlbenret.Enabled := False;
   dblctipdoc.Enabled := False;
   pnlnumdocide.Enabled := False;
   pnlobsret.Enabled := False;
   // Inicio: DPP_201204_PRE
   pnlmonret.Enabled := False;
   rgporcentaje.Enabled :=False;
  // Fin: DPP_201204_PRE
   pnlnomjuz.Enabled := False;
   pnlnumofi.Enabled := False;
   dbdtpfecofi.Enabled := False;
   pnlpagara.Enabled := False;
   dblcforpag.Enabled := False;
   dblcBanco.Enabled := False;
   dblcagegir.Enabled := False;
   pnlasoncta.Enabled := False;
   sbBuscar.Enabled := False;
   dblcagegir.Enabled := False;
End;

Procedure TFnueretjud.btneditaClick(Sender: TObject);
Begin
   sbBuscar.Enabled := True;
   pnlbenret.Enabled := True;
   dblctipdoc.Enabled := True;
   pnlnumdocide.Enabled := True;
   pnlobsret.Enabled := True;
   // Inicio: DPP_201204_PRE
   pnlmonret.Enabled := True;
   rgporcentaje.Enabled := True;
   // Fin: DPP_201204_PRE
   pnlnomjuz.Enabled := True;
   pnlnumofi.Enabled := True;
   dbdtpfecofi.Enabled := True;
   pnlpagara.Enabled := True;
   dblcforpag.Enabled := True;
   dblcBanco.Enabled := True;
   dblcagegir.Enabled := True;
   pnlasoncta.Enabled := True;
   sbBuscar.Enabled := False;
   mebenret.SetFocus;
End;

// Inicio: DPP_201204_PRE
{
Procedure TFnueretjud.memonretExit(Sender: TObject);
Begin
   If DM1.Valores(memonret.Text) = 0 Then
      memonret.SetFocus
   Else
   Begin
      memonret.Text := DM1.FormatoNumeros(memonret.Text);
      menomjuz.SetFocus;
   End;
   If StrToFloat(FloatToStr(DM1.Valores(memonret.Text))) > 100 Then
   Begin
      MessageDlg('El porcentaje no puede ser mayo a 100', mtInformation, [mbOk], 0);
      memonret.SetFocus;
   End;
End;
}
// Fin: DPP_201204_PRE

Function TFnueretjud.chequeadatos: Boolean;
Begin
   Result := False;
   If mebenret.Text = '' Then
   Begin
      MessageDlg('Ingrese apellidos y nombre(s) del beneficiario', mtInformation, [mbOk], 0);
      mebenret.SetFocus;
      Exit;
   End;
   If dblctipdoc.Text = '' Then
   Begin
      MessageDlg('Ingrese documento de identidad del beneficiario', mtInformation, [mbOk], 0);
      dblctipdoc.SetFocus;
      Exit;
   End;
   If menumdocide.Text = '' Then
   Begin
      MessageDlg('Ingrese numero del documento de identidad del beneficiario', mtInformation, [mbOk], 0);
      menumdocide.SetFocus;
      Exit;
   End;
   If meobsret.Text = '' Then
   Begin
      MessageDlg('Ingrese observación de la retención', mtInformation, [mbOk], 0);
      meobsret.SetFocus;
      Exit;
   End;

   // Inicio: DPP_201204_PRE
   If rgporcentaje.ItemIndex = 0 Then // monto
   Begin
     // Inicio: SPP_201306_PRE Se modifica propiedad por cambio de componente
     // If meporcentaje.Value  = 0 Then
     If  DM1.Valores(meporcentaje.Text)  = 0 Then
     // Fin: SPP_201306_PRE
     Begin
        MessageDlg('Ingrese un Monto mayor a cero (0) para que sea válido', mtInformation, [mbOk], 0);
        meporcentaje.SetFocus;
        Exit;
     End;
   End;
   If rgporcentaje.ItemIndex = 1 Then // porcentaje
   Begin
     // Inicio: SPP_201306_PRE Se modifica propiedad por cambio de componente
     // If meporcentaje.Value  = 0 Then
     If DM1.Valores(meporcentaje.Text)  = 0 Then
     // Fin: SPP_201306_PRE
     Begin
        MessageDlg('Ingrese un porcentaje mayor a cero (0) para que sea válido', mtInformation, [mbOk], 0);
        meporcentaje.SetFocus;
        Exit;
     End;
     // Inicio: SPP_201306_PRE Se modifica propiedad por cambio de componente
     // If meporcentaje.Value > 100 Then
     If DM1.Valores(meporcentaje.Text) > 100 Then
     // Fin: SPP_201306_PRE
     Begin
        MessageDlg('El porcentaje no puede ser mayor a 100%.', mtInformation, [mbOk], 0);
        meporcentaje.SetFocus;
        Exit;
     End;
   End;
   {
   If memonret.Text = '' Then
   Begin
      MessageDlg('Ingrese porcentaje de la retención', mtInformation, [mbOk], 0);
      memonret.SetFocus;
      Exit;
   End;
   }
   // Fin: DPP_201204_PRE


   If menomjuz.Text = '' Then
   Begin
      MessageDlg('Ingrese nombre del Juzgado', mtInformation, [mbOk], 0);
      menomjuz.SetFocus;
      Exit;
   End;
   If menumofi.Text = '' Then
   Begin
      MessageDlg('Ingrese número del oficio', mtInformation, [mbOk], 0);
      menumofi.SetFocus;
      Exit;
   End;
   If dbdtpfecofi.Text = '' Then
   Begin
      MessageDlg('Ingrese fecha de recepción de la retención', mtInformation, [mbOk], 0);
      dbdtpfecofi.SetFocus;
      Exit;
   End;
   If mepagara.Text = '' Then
   Begin
      MessageDlg('Ingrese datos de la persona o instiución que cobra', mtInformation, [mbOk], 0);
      mepagara.SetFocus;
      Exit;
   End;
   If dblcforpag.Text = '' Then
   Begin
      MessageDlg('Ingrese la forma de pago de la retención', mtInformation, [mbOk], 0);
      dblcforpag.SetFocus;
      Exit;
   End;
   If dblcforpag.Text <> '04' Then
   Begin
      If dblcBanco.Text = '' Then
      Begin
         MessageDlg('Ingrese el banco de paga la retención', mtInformation, [mbOk], 0);
         dblcBanco.SetFocus;
         Exit;
      End;
   End;
   If dblcforpag.Text = '05' Then
   Begin
      If dblcagegir.Text = '' Then
      Begin
         MessageDlg('Ingrese la ciudad a donde se gira la retención', mtInformation, [mbOk], 0);
         dblcagegir.SetFocus;
         Exit;
      End;
   End;
   If dblcforpag.Text = '06' Then
   Begin
      If measoncta.Text = '' Then
      Begin
         MessageDlg('Ingrese el numero de la cuenta en donde se deposita la retención', mtInformation, [mbOk], 0);
         measoncta.SetFocus;
         Exit;
      End;
   End;
   Result := True;
   Exit;
End;

// Inicio: SPP_201306_PRE
//Procedure TFnueretjud.menomjuzExit(Sender: TObject);
//Begin
//   mepagara.Text := menomjuz.Text;
//End;
// Fin: SPP_201306_PRE


Procedure TFnueretjud.dblctipdocExit(Sender: TObject);
Var
   xSql: String;
Begin
   If Trim(dblctipdoc.Text) <> '' Then
   Begin
      xSql := 'SELECT * FROM TGE159 WHERE TIPDOCCOD = ' + QuotedStr(dblctipdoc.Text);
      If DM1.verificaexiste(xSql) = False Then
      Begin
         MessageDlg('Código de tipo de documento no existe', mtInformation, [mbOk], 0);
         dblctipdoc.Text := '';
         dblctipdoc.SetFocus;
         Exit;
      End;
   End;
End;

Procedure TFnueretjud.dblcBancoExit(Sender: TObject);
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

Procedure TFnueretjud.dblcagegirExit(Sender: TObject);
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

Procedure TFnueretjud.dblcforpagExit(Sender: TObject);
Var
   xSql: String;
Begin
   If DM1.cdsFPago.Locate('TIPDESEID', dblcforpag.Text, []) Then
   Begin
      meforpagodes.Text := DM1.cdsFPago.FieldByName('TIPDESEDES').AsString;
      lblbanco.Visible := True;
      dblcBanco.Visible := True;
      pnlbanco.Visible := True;
      If (dblcforpag.Text = '01') Or (dblcforpag.Text = '11') Or (dblcforpag.Text = '16') Then
      Begin
         lblagegir.Visible := False;
         dblcagegir.Visible := False;
         pnlagegir.Visible := False;
         dblcBanco.Text := '03';
      End;
      If dblcforpag.Text = '05' Then
      Begin
         dblcBanco.Text := '04';
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
      End;
      If dblcforpag.Text = '06' Then
      Begin
         lblagegir.Visible := False;
         dblcagegir.Visible := False;
         pnlagegir.Visible := False;
      End;
      // Inicio: SPP_201301_PRE
      //If dblcforpag.Text = '18' Then
      If dblcforpag.Text = '19' Then
      // Fin: SPP_201301_PRE
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

Procedure TFnueretjud.dblcforpagChange(Sender: TObject);
Var
   xSql: String;
Begin
  If dblcforpag.Text = '' Then
  Begin
    dblcforpag.Text := '';
    meforpagodes.Text := '';
  End;
  If Length(dblcforpag.Text) = 2 Then
  Begin
    If DM1.cdsFPago.Locate('TIPDESEID', dblcforpag.Text, []) Then
    Begin
      meforpagodes.Text := DM1.cdsFPago.FieldbyName('TIPDESEDES').AsString;
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
    End
    Else
    Begin
      MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
      dblcforpag.Text := '';
      meforpagodes.Text := '';
    End;
  End;
End;

// Inicio: DPP_201204_PRE
procedure TFnueretjud.rgporcentajeClick(Sender: TObject);
begin
   // Inicio: SPP_201306_PRE Se modifica variable de RX a edit
   // meporcentaje.Value := 0;
   meporcentaje.Text := '0.00';
   // Fin: SPP_201306_PRE
   If rgporcentaje.ItemIndex =  0 Then  // monto
   Begin
      lblporcentaje.Caption  := 'S/.';
      lblporcentaje2.Caption := 'Monto';
   End;

   If rgporcentaje.ItemIndex =  1 Then // porcentaje
   Begin
      lblporcentaje.Caption  := '%';
      lblporcentaje2.Caption := 'Porcentaje';
   End;
end;
// Fin: DPP_201204_PRE



// Inicio: DPP_201204_PRE
procedure TFnueretjud.meporcentajeExit(Sender: TObject);
begin
   // Inicio: SPP_201306_PRE // Se valida caja de texto meporcentaje
   Try
      meporcentaje.Text := FloatToStr(DM1.Valores(meporcentaje.Text));
   Except
      MessageDlg('Valor numerico no valido', mtInformation, [mbOk], 0);
      meporcentaje.Text := '0.00';
      meporcentaje.SetFocus;
   End;
   // Fin: SPP_201306_PRE
   
   If rgporcentaje.ItemIndex = 0 Then  // monto
   Begin
      porcRetencion  := 0;
      // Inicio: SPP_201306_PRE Se asigna valor a variable
      // valorRetencion := meporcentaje.Value;
      valorRetencion :=  DM1.Valores(meporcentaje.Text);
      // Fin: SPP_201306_PRE
   End;
   If rgporcentaje.ItemIndex = 1 Then // porcentaje
   Begin
      // Inicio: SPP_201306_PRE Se asigna valor a variable
      // porcRetencion  := meporcentaje.Value;
      porcRetencion  := DM1.Valores(meporcentaje.Text);
      // Fin: SPP_201306_PRE
      valorRetencion := 0;
   End;
end;
// Fin: DPP_201204_PRE

// Inicio: SPP_201306_PRE Se añade validación a caja de texto meporcentaje. No debe aceptar texto
procedure TFnueretjud.meporcentajeKeyPress(Sender: TObject; var Key: Char);
begin
   If Key In [' ', 'A'..'Z', 'a'..'z', '°', '|', '!', '"', '#', '$', '%', '&', '/', '(', ')', '=', '?', '\', '¡', '¿', '@', '¨', '´', '*', '+', '~', '~', '[', ']', '{', '}', '^', '`', '<', '>', ';', ',', ':', '''', '-', '_'] Then
      Key := #0;
end;
// Fin: SPP_201306_PRE

End.

