// Inicio Uso Estándares: 01/08/2011
// Unidad : Previsión Social
// Formulario : FCalculoLiquidacion
// Fecha de Creación : 08/08/2011
// Autor : Sistemas
// Objetivo : Calculo de la liquidación
// Actualizaciones
// HPC_201305_PRE  : Se modifica la funcion verificaretenciones judiciales (usa tabla desactualizada)
// SPP_201306_PRE  : Se realiza el pase a producción a partir del HPC_201305_PRE
// HPC_201504_PRE  : Descuentos por aplicaciones de CCI
// HPC_201601_PRE		: CAMBIAR DE DO A CE AL GRABAR LA LIQUIDACION DE BENEFICIO
// HPC_201609_PRE  : Se modifica la lectura de datos en la tabla de Carta de Designación.
//                   Solo se leee los que tienen con estado "02 = Activos".
// HPC_201703_PRE : Se Modifica procedimiento de calculo de nivelaciones y/o devoluciones 
// HPC_201704_PRE : Se modifica el Qry para que solo busque cartas de beneficiarios abiertas
// HPC_201802_PRE : Se modifica la forma de calculo de la liquidación de beneficio, de tal manera
//                  que se pueda validar las liquidaciones sin oficio
// HPC_201809_PRE : Se controla que existe carta de beneficiarios con datos
Unit PRE229;

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, fcButton, fcImgBtn, fcShapeBtn, StdCtrls, Mask,
   wwdbdatetimepicker, Grids, DBGrids, Wwdbigrd, Wwdbgrid, DB, DBClient,
   ppPrnabl, ppClass, ppCtrls, ppDB, ppBands, ppCache, ppProd, ppReport,
   ppComm, ppRelatv, ppDBPipe, Buttons, ExtCtrls;

Type
   TFCalculoLiquidacion = Class(TForm)
      Label1: TLabel;
      Label2: TLabel;
      Label3: TLabel;
      Label4: TLabel;
      Label5: TLabel;
      Label6: TLabel;
      Label7: TLabel;
      meNumResNom: TMaskEdit;
      meNumResCes: TMaskEdit;
      DBDTPFecResNom: TwwDBDateTimePicker;
      DBDTPFecResCes: TwwDBDateTimePicker;
      Panel2: TPanel;
      measoid: TMaskEdit;
      Panel1: TPanel;
      measocodmod: TMaskEdit;
      Panel3: TPanel;
      measoapenomdni: TMaskEdit;
      btncalliquidacion: TBitBtn;
      btncerrar: TBitBtn;
      Procedure FormActivate(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure btncalliquidacionClick(Sender: TObject);
      Procedure btncerrarClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
   Private
   // Inicio  HPC_201504_PRE  : Descuentos por aplicaciones de CCI
      bMsgCCI : Boolean;
   // Fin     HPC_201504_PRE  : Descuentos por aplicaciones de CCI
   Public
      Function verificaDesignatarios(): Boolean;
      Function verificadatosdelasociado(): Boolean;
      Function verificaRetencionesJudiciales(): Boolean;
  //  function verificadatosliquidacion():Boolean;
      Function verificasicobraelasociado(): Boolean;
   End;
Var
   FCalculoLiquidacion: TFCalculoLiquidacion;

Implementation

Uses DateUtils, PRE230, PREDM;

{$R *.dfm}

Procedure TFCalculoLiquidacion.FormActivate(Sender: TObject);
Begin
// Inicio  HPC_201504_PRE  : Descuentos por aplicaciones de CCI
   if DM1.MuestraAlerta('00002') then
      bMsgCCI:=True
   else
      bMsgCCI:=False;

   measocodmod.Text := DM1.cdsExpLiq.FieldByName('ASOCODMOD').AsString;
   measoid.Text := DM1.cdsExpLiq.FieldByName('ASOID').AsString;
   measoapenomdni.Text := DM1.cdsExpLiq.FieldByName('ASOAPENOMDNI').AsString;
   meNumResNom.Text := DM1.cdsExpLiq.FieldByName('ASORESNOM').AsString;
   DBDTPFecResNom.Date := DM1.cdsExpLiq.FieldByName('ASOFRESNOM').AsDateTime;
   if meNumResCes.Enabled then meNumResCes.SetFocus;
// Fin  HPC_201504_PRE  : Descuentos por aplicaciones de CCI
End;




Procedure TFCalculoLiquidacion.FormKeyPress(Sender: TObject;
   Var Key: Char);
Begin
   If Key = #13 Then
   Begin
      Key := #0;
      Perform(CM_DIALOGKEY, VK_TAB, 0);
   End;
End;

Function TFCalculoLiquidacion.verificaDesignatarios;
Var
   xSql: String;
   porcentanje: Double;
Begin
   // Inicio: HPC_201609_PRE
   // Se añade al script de busqueda la condicion en el cual no debe tomar  tipo de estado = "13" (anulado)
   // xSql := 'SELECT * FROM PVS302 WHERE ASOID =' + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString) + ' AND DSGESTAD =' + QuotedStr('02');
   xSql := 'SELECT DSGNRO, DSGFREC, DSGESTAD, DSGFAPER, DSGVIG, ASOID, DSGOBS, DSGNOMBR, DSGAPEPAT, DSGAPEMAT, DSGNOMBRT, USUARIO, FREG, HREG, FECAPER, PVSEXPNRO, PVSNROLIQ, PVSFANUL, ANULADO, USUANU, FECANU, PVSLBENNR,'
   // Inicio: HPC_201704_PRE
   // Se modifica el Qry para que solo busque cartas de beneficiarios abiertas
   //+' ASODNI, ASOAPENOMDNI, ASOCODMOD, USUAPE, CODOTRDOCIDE, NUMOTRDOCIDE, MOTANUCAR FROM PVS302 WHERE ASOID =' + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString) + ' AND DSGESTAD NOT IN ''13''';
   // Inicio: HPC_201809_PRE
   // Se controla si hay carta de beneficiarios
   // +' ASODNI, ASOAPENOMDNI, ASOCODMOD, USUAPE, CODOTRDOCIDE, NUMOTRDOCIDE, MOTANUCAR FROM PVS302 WHERE ASOID =' + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString) + ' AND DSGESTAD = ''02''';
   +' ASODNI, ASOAPENOMDNI, ASOCODMOD, USUAPE, CODOTRDOCIDE, NUMOTRDOCIDE, MOTANUCAR FROM PVS302 WHERE ASOID =' + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString) + ' AND DSGESTAD <> ''13''';
   // Fin: HPC_201809_PRE
   // Fin: HPC_201704_PRE
   // 	Fin: HPC_201609_PRE
   DM1.cdsMaestCartas.Close;
   DM1.cdsMaestCartas.DataRequest(xSql);
   DM1.cdsMaestCartas.Open;
   If DM1.cdsMaestCartas.RecordCount > 0 Then
   Begin
      xSql := ' SELECT * FROM PVS303 Where DSGNRO =' + QuotedStr(DM1.cdsMaestCartas.FieldByName('DSGNRO').AsString)
         + ' AND ASOID =' + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString);
      DM1.cdsDetCartas.Close;
      DM1.cdsDetCartas.DataRequest(xSql);
      DM1.cdsDetCartas.Open;
      If DM1.cdsDetCartas.RecordCount = 0 Then
      Begin
         MessageDlg('El asociado tiene carta de designatario, pero no fue abierta', mtError, [mbOk], 0);
         Result := False;
         Exit;
      End
      Else
      Begin
         DM1.cdsDetCartas.First;
         porcentanje := 0;
         While Not DM1.cdsDetCartas.Eof Do
         Begin
            porcentanje := porcentanje + DM1.cdsDetCartas.FieldByName('DSGPORC').AsFloat;
            DM1.cdsDetCartas.Next;
         End;
         If porcentanje <> 100 Then
         Begin
            MessageDlg('El total porcentaje de la carta de designación no es 100%', mtError, [mbOk], 0);
            Result := False;
            Exit;
         End
         Else
         Begin
            Result := True;
            Exit;
         End;
      End;
   End
   Else
   Begin
      xSql := ' SELECT * FROM APO203 WHERE ASOID =' + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString)
         + ' AND FAMPORC IS NOT NULL AND FAMFLLQ =' + QuotedStr('S');
      DM1.cdsDFam.Close;
      DM1.cdsDFam.DataRequest(xSql);
      DM1.cdsDFam.Open;
      DM1.cdsDFam.First;
      porcentanje := 0;
      If DM1.cdsDFam.RecordCount > 0 Then
      Begin
         DM1.cdsDFam.First;
         While Not DM1.cdsDFam.Eof Do
         Begin
            porcentanje := porcentanje + DM1.cdsDFam.FieldByName('FAMPORC').AsCurrency;
            DM1.cdsDFam.Next;
         End;
         If DM1.Valores(FloatToStrF(porcentanje, ffNumber, 15, 2)) = 100 Then
         Begin
            Result := True;
            Exit;
         End
         Else
         Begin
            MessageDlg('El total porcentaje de los beneficiarios no es 100 %', mtError, [mbOk], 0);
            Result := False;
            Exit;
         End;
      End
      Else
      Begin
         MessageDlg('El expediente de beneficios no cuenta con beneficiarios designados', mtError, [mbOk], 0);
         Result := False;
         Exit;
      End;
   End;
End;

Function TFCalculoLiquidacion.verificaRetencionesJudiciales: Boolean;
Var
   xSql: String;
Begin
   DM1.cdsDetRetJud.Close;
   DM1.cdsDetRetJud.DataRequest(xSql);
   // Inicio: SPP_201306_PRE Se modifica la verificación de las retenciones judiciales. La tabla PVS304 ha quedado desactualizada (no se usa)
   // xSql := 'SELECT ROWID, A.* FROM PVS304 A WHERE ASOID = ' + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString)+ 'AND PVSLBENNR IS NULL AND NVL(ANULADO,''N'') = ''N'' ';
   xSql := 'SELECT ROWID, A.* FROM PVS305 A WHERE ASOID = ' + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString)+ 'AND PVSLBENNR IS NULL AND NVL(ANULADO,''N'') = ''N'' ';
   // Fin: SPP_201306_PRE
   DM1.cdsDetRetJud.Open;
   If DM1.cdsDetRetJud.RecordCount = 1 Then
      Result := True
   Else
      If DM1.cdsDetRetJud.RecordCount > 1 Then
      Begin
         MessageDlg(' Verifique las retenciones judiciales', mtError, [mbOk], 0);
         Result := False;
      End
      Else
         Result := False;
End;

Procedure TFCalculoLiquidacion.btncalliquidacionClick(Sender: TObject);
Var
   // Inicio: HPC_201703_PRE
   // Se añade variable para guardar ultimo año y mes de aporte
   // xSql: String;
   xSql, xultmesapo: String;
   // Fin: HPC_201703_PRE
Begin
   xSql := 'SELECT * FROM APO201 WHERE ASOID = ' + QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString);
   DM1.cdsAsociado.Close;
   DM1.cdsAsociado.DataRequest(xSql);
   DM1.cdsAsociado.Open;

   DecodeDate(Now, DM1.anoHoy, DM1.mesHoy, DM1.diaHoy);
   // INICIO HPC_201601_PRE
  // Chequeando si el asociado sigue cesante.
   //If DM1.cdsAsociado.FieldByName('ASOTIPID').AsString <> 'CE' Then
   //Begin
   //   Beep;
   //   MessageDlg('Error!! El asociado no cuenta con flag de cesante verifique', mtInformation, [mbOk], 0);
   //   btncerrar.SetFocus;
   //   Exit;
   //End;
   // FIN HPC_201601_PRE
  // Chequeando si los datos ingresados. Estos datos se validan con los datos
  // ingresados en la tabla PVS301
   If DM1.cdsExpLiq.FieldByName('ASORESNOM').AsString <> TRIM(meNumResNom.Text) Then
   Begin
      Beep;
      MessageDlg('Resolución de Nombramiento mal ingresada', mtInformation, [mbOk], 0);
      meNumResNom.SetFocus;
      Exit;
   End;
   If DM1.cdsExpLiq.FieldByName('ASOFRESNOM').AsString <> TRIM(DBDTPFecResNom.Text) Then
   Begin
      Beep;
      MessageDlg('Fecha de Resolución de Nombramiento mal ingresada', mtInformation, [mbOk], 0);
      DBDTPFecResNom.SetFocus;
      Exit;
   End;
   If DM1.cdsExpLiq.FieldByName('ASORESCESE').AsString <> TRIM(meNumResCes.Text) Then
   Begin
      Beep;
      MessageDlg('Resolución de Cese mal ingresada', mtInformation, [mbOk], 0);
      meNumResCes.SetFocus;
      Exit;
   End;
   If DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsString <> TRIM(DBDTPFecResCes.Text) Then
   Begin
      Beep;
      MessageDlg('Fecha de Resolución de Cese mal ingresada', mtInformation, [mbOk], 0);
      DBDTPFecResCes.SetFocus;
      Exit;
   End;
   // Inicio: HPC_201802_PRE
   // Si es liquidación por oficio no se solicita quien cobra
   If DM1.cdsExpLiq.FieldByName('FORSOLBEN').AsString = 'S' Then
   Begin
      // Si el campo de quien cobra la liquidación esta en blanco no se puede
      // liquidar
      // Verifica si no cobra el asociado
      If DM1.cdsExpLiq.FieldByName('PVSCOBASO').AsString = '' Then
      Begin
         MessageDlg('No se ha seleccionado quien cobra la liquidación', mtInformation, [mbOk], 0);
         Exit;
      End;
      If DM1.cdsExpLiq.FieldByName('PVSCOBASO').AsString = 'N' Then
      Begin
         If Not verificaDesignatarios Then
         Begin
            MessageDlg('Existe un error en el registro de los designatarios', mtInformation, [mbOk], 0);
            Exit;
         End;
      End;
      // Verifica si cobra el asociado
      If DM1.cdsExpLiq.FieldByName('PVSCOBASO').AsString = 'S' Then
      Begin
      // Verificando si cobra el asociado
         If Not verificasicobraelasociado Then
         Begin
            MessageDlg('Existe un error en la forma de pago del asociado', mtInformation, [mbOk], 0);
            Exit;
         End;
      End;
   End
   Else DM1.cdsForPag.EmptyDataSet;
   // Fin: HPC_201802_PRE
  // Verifica que esten todos los campos del asociado esten con datos
   If Not verificadatosdelasociado Then
   Begin
      MessageDlg('Datos del asociado no se han registrado correctamente', mtInformation, [mbOk], 0);
      Exit;
   End;
   If MessageDlg('Desea Generar Liquidación?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
      DM1.montoliquidacionanterior := 0;
// Inicio HPC_201504_PRE  : Descuentos por aplicaciones de CCI
      DM1.calculaliquidacion;  // Calcula Cuenta Individual
      // Inicio: HPC_201703_PRE
      // Se cambia procedimiento de calculo de nivelaciones y/o devoluciones 
      // DM1.calculaNivDev(DM1.cdsExpLiq.FieldByName('ASOID').AsString, DM1.cdsExpLiq.FieldByName('ASOFRESNOM').AsString, DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsString);
      xultmesapo := Copy(DM1.cdsExpLiq.FieldByName('PVSULTAPO').AsString, 1, 4) + Copy(DM1.cdsExpLiq.FieldByName('PVSULTAPO').AsString, 6, 2);
      DM1.CalculaNivelacionesDevoluciones(DM1.cdsExpLiq.FieldByName('ASOID').AsString, DM1.cdsExpLiq.FieldByName('PVSEXPNRO').AsString, xultmesapo);
      // Fin: HPC_201703_PRE

      DM1.calcularetencion(DM1.cdsExpLiq.FieldByName('ASOID').AsString);
      DM1.calculaCreditoCCI(DM1.cdsExpLiq.FieldByName('ASOID').AsString);
// Fin    HPC_201504_PRE  : Descuentos por aplicaciones de CCI
      DM1.calculacreditos(DM1.cdsExpLiq.FieldByName('ASOID').AsString);
// Inicio: HPP_201004_PRE
// SAR-2009-0984
      // Calcula el monto de la deuda por FSC
      DM1.calculafondosolidario(DM1.cdsExpLiq.FieldByName('ASOID').AsString);
// Fin : HPP_201004_PRE
      FPrevioLiquidacion := TFPrevioLiquidacion.Create(Self);
      With FPrevioLiquidacion Do
      Try
         FPrevioLiquidacion.Top := 0;
// Inicio HPC_201504_PRE  : Descuentos por aplicaciones de CCI
         FPrevioLiquidacion.lblMsgCCI.Visible:=bMsgCCI;
// Fin    HPC_201504_PRE  : Descuentos por aplicaciones de CCI
         FPrevioLiquidacion.Caption := FPrevioLiquidacion.Caption;
         ShowModal;
      Finally
         Free;
      End;
      If DM1.xSgr = 'G' Then
         btncerrar.OnClick(btncerrar);
   End;
End;

Procedure TFCalculoLiquidacion.btncerrarClick(Sender: TObject);
Begin
   FCalculoLiquidacion.Close;
End;

Function TFCalculoLiquidacion.verificadatosdelasociado: Boolean;
Begin
   If DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString = '' Then
   Begin
      MessageDlg('Ingrese los apellidos y nombre(s) del asociado', mtInformation, [mbOk], 0);
      Result := False;
      Exit;
   End;
   If DM1.cdsAsociado.FieldByName('ASODNI').AsString = '' Then
   Begin
      MessageDlg('Ingrese el DNI del asociado', mtInformation, [mbOk], 0);
      Result := False;
      Exit;
   End;
   If DM1.cdsAsociado.FieldByName('ASODIR').AsString = '' Then
   Begin
      MessageDlg('Ingrese la dirección del asociado', mtInformation, [mbOk], 0);
      Result := False;
      Exit;
   End;
   If DM1.cdsAsociado.FieldByName('ZIPID').AsString = '' Then
   Begin
      MessageDlg('Ingrese el ubigeo del asociado', mtInformation, [mbOk], 0);
      Result := False;
      Exit;
   End;
   If DM1.cdsAsociado.FieldByName('ASOCODMOD').AsString = '' Then
   Begin
      // INICIO: HPC_201704_PRE
      // Se añade tilde a la palabra "codigo"
      // MessageDlg('Ingrese el codigo modular del asociado', mtInformation, [mbOk], 0);
      MessageDlg('Ingrese el código modular del asociado', mtInformation, [mbOk], 0);
      // FIN: HPC_201704_PRE
      Result := False;
      Exit;
   End;

   If (DM1.cdsAsociado.FieldByName('USEID').AsString = '') Then
   Begin
      MessageDlg('Ingrese la ugel del asociado', mtInformation, [mbOk], 0);
      Result := False;
      Exit;
   End;
   If (DM1.cdsAsociado.FieldByName('UPAGOID').AsString = '') Then
   Begin
      MessageDlg('Ingrese la unidad de pago del asociado', mtInformation, [mbOk], 0);
      Result := False;
      Exit;
   End;
   If (DM1.cdsAsociado.FieldByName('UPROID').AsString = '') Then
   Begin
      MessageDlg('Ingrese la unidad de proceso del asociado', mtInformation, [mbOk], 0);
      Result := False;
      Exit;
   End;
   Result := True;
End;

Function TFCalculoLiquidacion.verificasicobraelasociado: Boolean;
Begin
   If DM1.cdsExpLiq.FieldByName('FORPAGOID').AsString = '' Then
   Begin
      MessageDlg('Ingrese la forma de pago al asociado', mtInformation, [mbOk], 0);
      Result := False;
      Exit;
   End
   Else
   Begin
    // Si es por cheque
      If DM1.cdsExpLiq.FieldByName('FORPAGOID').AsString = '01' Then
      Begin
         If DM1.cdsExpLiq.FieldByName('BANCOID').AsString <> '03' Then
         Begin
            MessageDlg('Banco errado para la forma de pago', mtInformation, [mbOk], 0);
            Result := False;
            Exit;
         End;
      End;
    // Si es por Giro
      If DM1.cdsExpLiq.FieldByName('FORPAGOID').AsString = '05' Then
      Begin
         If DM1.cdsExpLiq.FieldByName('BANCOID').AsString <> '04' Then
         Begin
            MessageDlg('Banco errado para la forma de pago', mtInformation, [mbOk], 0);
            Result := False;
            Exit;
         End;
         If DM1.cdsExpLiq.FieldByName('AGENBCOID').AsString = '' Then
         Begin
            MessageDlg('Ingrese el código de agencia del banco de la nación', mtInformation, [mbOk], 0);
            Result := False;
            Exit;
         End;
      End;
    // Si es por abono en cuenta
      If DM1.cdsExpLiq.FieldByName('FORPAGOID').AsString = '06' Then
      Begin
         If DM1.cdsExpLiq.FieldByName('BANCOID').AsString <> '04' Then
         Begin
            MessageDlg('Banco errado para la forma de pago', mtInformation, [mbOk], 0);
            Result := False;
            Exit;
         End;
         If DM1.cdsAsociado.FieldByName('ASONCTA').AsString = '' Then
         Begin
            MessageDlg('Ingrese el número de cuenta del banco de la nación del asociado', mtInformation, [mbOk], 0);
            Result := False;
            Exit;
         End;
      End;
    // Si es por libreta de ahorros
      If DM1.cdsExpLiq.FieldByName('FORPAGOID').AsString = '11' Then
      Begin
         If DM1.cdsExpLiq.FieldByName('BANCOID').AsString <> '03' Then
         Begin
            MessageDlg('Banco errado para la forma de pago', mtInformation, [mbOk], 0);
            Result := False;
            Exit;
         End;
      End;
   End;
   Result := True;
End;

Procedure TFCalculoLiquidacion.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   Action := caFree;
End;

End.

