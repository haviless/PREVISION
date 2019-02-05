// Inicio Uso Estándares : 01/08/2011
// Unidad                : PRE244.pas
// Formulario            : FReliquidacionBeneficios
// Fecha de Creación     : 15/12/1993
// Autor                 : Área de Desarrollo de Sistemas
// Objetivo              : Liquidación de Beneficios
// Actualizaciones:
// HPC_201609_PRE : Se controla los registos que van a contabizar el total de la cuenta individual.
// HPC_201703_PRE : Se Modifica procedimiento de calculo de nivelaciones y/o devoluciones 
// HPC_201805_PRE : Se añade el signo de pregunta a una expresión.

unit PRE244;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, wwdbdatetimepicker, Mask, ExtCtrls, wwdblook,
  Grids, Wwdbigrd, Wwdbgrid, Wwdbdlg;

type
  TFReliquidacionBeneficios = class(TForm)
    btncerrarreliquidacion: TBitBtn;
    pnlliqant: TPanel;
    btngenerareliquidacion: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Panel3: TPanel;
    menumeroliquidacion: TMaskEdit;
    Panel4: TPanel;
    measoapenomdni: TMaskEdit;
    Label6: TLabel;
    Panel5: TPanel;
    mefechaliquidacion: TMaskEdit;
    Label7: TLabel;
    Panel6: TPanel;
    metipoliquidacion: TMaskEdit;
    Label8: TLabel;
    Panel7: TPanel;
    medocumentoidentidad: TMaskEdit;
    Label9: TLabel;
    Panel9: TPanel;
    menumeronombramiento: TMaskEdit;
    Label10: TLabel;
    Panel10: TPanel;
    mefechanombramiento: TMaskEdit;
    Label11: TLabel;
    Panel11: TPanel;
    menumerocese: TMaskEdit;
    Label12: TLabel;
    Panel12: TPanel;
    mefechacese: TMaskEdit;
    Label13: TLabel;
    gbdatliq: TGroupBox;
    pnlresoluciones: TPanel;
    Label18: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label3: TLabel;
    menumresnom: TMaskEdit;
    menumresces: TMaskEdit;
    dbdtpfecnom: TwwDBDateTimePicker;
    dbdtpfecces: TwwDBDateTimePicker;
    pnlforpago: TPanel;
    lblforpag: TLabel;
    lblbanco: TLabel;
    lblagegir: TLabel;
    lblasoncta: TLabel;
    Label4: TLabel;
    rgCobAso: TRadioGroup;
    dblcforpag: TwwDBLookupCombo;
    dblcBanco: TwwDBLookupCombo;
    pnlforpag: TPanel;
    meforpagodes: TMaskEdit;
    pnlbanco: TPanel;
    mebancodes: TMaskEdit;
    pnlagegir: TPanel;
    meagengir: TMaskEdit;
    pnlasoncta: TPanel;
    measoncta: TMaskEdit;
    dbgDetCalBenRel: TwwDBGrid;
    dblcagegir: TwwDBLookupComboDlg;
    procedure btncerrarreliquidacionClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btngenerareliquidacionClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure rgCobAsoClick(Sender: TObject);
    procedure dblcforpagChange(Sender: TObject);
    procedure dblcforpagExit(Sender: TObject);
    procedure dblcBancoChange(Sender: TObject);
    procedure dblcagegir1Change(Sender: TObject);
    procedure dblcagegirChange(Sender: TObject);
    procedure dblcBancoExit(Sender: TObject);
    procedure dblcagegirExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FReliquidacionBeneficios: TFReliquidacionBeneficios;

implementation

uses PREDM, PRE230, PRE241;

{$R *.dfm}

procedure TFReliquidacionBeneficios.btncerrarreliquidacionClick(
  Sender: TObject);
begin
  FReliquidacionBeneficios.Close;
end;

procedure TFReliquidacionBeneficios.FormActivate(Sender: TObject);
Var xSql:String;
begin
  //Tomando información del expendiente del beneficio
  // Inicio: SPP_201301_PRE POR EALVA
  xSql := 'SELECT TIPDESEID, TIPDESEDES FROM CRE104 A WHERE NVL(FLAHISPRE, ''X'') = ''S'' AND TIPDESEID <> ''19'' ORDER BY TIPDESEID';
  // Fin: SPP_201301_PRE
  DM1.cdsFPago.Close;
  DM1.cdsFPago.DataRequest(xSql);
  DM1.cdsFPago.Open;

  xSql := 'SELECT BANCOID, BANCOABR, BANCONOM FROM TGE105 WHERE NVL(FLAHISPRE, ''X'') = ''S'' ORDER BY BANCOID';
  DM1.cdsBanco.Close;
  DM1.cdsBanco.DataRequest(xSql);
  DM1.cdsBanco.Open;

  xSql := 'SELECT FORPAGOID, BANCOID, AGENBCOID, ASONCTA, PVSCOBASO FROM PVS301'
  +' WHERE ASOID = '+QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)+' AND PVSLBENNR = '+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString);
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;

  If DM1.cdsQry.FieldByName('PVSCOBASO').AsString = 'S' Then rgCobAso.ItemIndex := 0 Else rgCobAso.ItemIndex := 1;
  dblcforpag.Text := DM1.cdsQry.FieldByName('FORPAGOID').AsString;
  dblcBanco.Text  := DM1.cdsQry.FieldByName('BANCOID').AsString;
  dblcagegir.Text := DM1.cdsQry.FieldByName('AGENBCOID').AsString;
  measoncta.Text  := DM1.cdsQry.FieldByName('ASONCTA').AsString;

  //Chequenado los datos de la forma de pago
  If rgCobAso.ItemIndex = 0 Then
  Begin
    If dblcforpag.Text = '' Then
    Begin
      dblcforpag.Text    := '';
      meforpagodes.Text  := '';
      dblcBanco.Text     := '';
      mebancodes.Text    := '';
      measoncta.Text     := '';
      lblforpag.Visible  := True;
      dblcforpag.Visible := True;
      pnlforpag.Visible  := True;
    End;
  End
  Else
  Begin
    lblforpag.Visible  := False;
    dblcforpag.Visible := False;
    pnlforpag.Visible  := False;
    lblbanco.Visible   := False;
    dblcBanco.Visible  := False;
    pnlbanco.Visible   := False;
    lblagegir.Visible  := False;
    dblcagegir.Visible := False;
    pnlagegir.Visible  := False;
    lblasoncta.Visible := False;
    pnlasoncta.Visible := False;
  End;
  xSql := 'SELECT * FROM APO201 WHERE ASOID = '+QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString);
  DM1.cdsAsociado.Close;
  DM1.cdsAsociado.DataRequest(xSql);
  DM1.cdsAsociado.Open;
  menumresnom.Text          := DM1.cdsAsociado.FieldByName('ASORESNOM').AsString;
  dbdtpfecnom.Date          := DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsDateTime;
  dbdtpfecces.Date          := DM1.cdsAsociado.FieldByName('ASOFRESCESE').AsDateTime;
  menumresces.Text          := DM1.cdsAsociado.FieldByName('ASORESCESE').AsString;
  menumeroliquidacion.Text  := DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString;
  mefechaliquidacion.Text   := Copy(DM1.cdsCabLiq.FieldByName('PVSLFECBE').AsString,1,2)+'/'+Copy(DM1.cdsCabLiq.FieldByName('PVSLFECBE').AsString,4,2)+'/'+Copy(DM1.cdsCabLiq.FieldByName('PVSLFECBE').AsString,7,4);
  mefechanombramiento.Text  := DM1.cdsCabLiq.FieldByName('ASOFRESNOM').AsString;
  menumeronombramiento.Text := DM1.cdsCabLiq.FieldByName('ASORESNOM').AsString;
  menumerocese.Text         := DM1.cdsCabLiq.FieldByName('ASORESCESE').AsString;
  mefechacese.Text          := DM1.cdsCabLiq.FieldByName('ASOFRESCESE').AsString;
  measoapenomdni.Text       := DM1.cdsCabLiq.FieldByName('ASOAPENOMDNI').AsString;
  metipoliquidacion.Text    := DM1.DevuelveValor('TGE186', 'BENEFDES', 'TIPBENEF', DM1.cdsCabLiq.FieldByName('PVSLTIPBE').AsString);
  medocumentoidentidad.Text := DM1.cdsCabLiq.FieldByName('ASODOCNUM').AsString+'-'+DM1.DevuelveValor('TGE159', 'TIPDOCDES', 'TIPDOCCOD', DM1.cdsCabLiq.FieldByName('TIPDOCCOD').AsString);
  DM1.montoliquidacionanterior := 0;
  // Inicio: HPC_201609_PRE
  // Se controla que al momento de tomar el monto del beneficio no tome la descripcipión del total cuenta individual
  // xSql := 'SELECT PVSLCONCE, PVSLMONTO  FROM PVS307 WHERE PVSLBENNR = '+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)+' AND PVSLAGRID = ''DET'' ORDER BY PVSLSEC';
  xSql := 'SELECT PVSLCONCE, PVSLMONTO  FROM PVS307 WHERE PVSLBENNR = '+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)+' AND PVSLAGRID = ''DET'' AND TIPDES <> ''TC'' ORDER BY PVSLSEC';
  // Fin: HPC_201609_PRE
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  DM1.cdsQry.First;
  DM1.cdsDetCalLiq.EmptyDataSet;
  While Not DM1.cdsQry.Eof Do
  Begin
    DM1.cdsDetCalLiq.Append;
    DM1.cdsDetCalLiq.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString;
    DM1.cdsDetCalLiq.FieldByName('MONTO').AsFloat := DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat;
    DM1.cdsDetCalLiq.Post;
    DM1.montoliquidacionanterior := DM1.montoliquidacionanterior + DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat;
    DM1.cdsQry.Next;
  End;
  // Detalle de la liquidación
  dbgDetCalBenRel.ColumnByName('DESC').FooterValue := 'TOTAL BENEFICIO ASIGNADO '+metipoliquidacion.Text;
  dbgDetCalBenRel.ColumnByName('MONTO').FooterValue := FormatFloat('###,###.#0', DM1.montoliquidacionanterior);

  // Inicio: SPP_201301_PRE POR EALVA
  xSql := 'SELECT TIPDESEID, TIPDESEDES FROM CRE104 A WHERE NVL(FLAHISPRE, ''X'') = ''S'' AND TIPDESEID <> ''19'' ORDER BY TIPDESEID';
  //xSql := 'SELECT TIPDESEID, TIPDESEDES FROM CRE104 A WHERE NVL(FLAVIGPRE, ''X'') = ''S'' ORDER BY TIPDESEID';
  // Fin: SPP_201301_PRE
  DM1.cdsFPago.Close;
  DM1.cdsFPago.DataRequest(xSql);
  DM1.cdsFPago.Open;

  xSql := 'SELECT BANCOID, BANCOABR, BANCONOM FROM TGE105 WHERE NVL(FLAVIGPRE, ''X'') = ''S'' ORDER BY BANCOID';
  DM1.cdsBanco.Close;
  DM1.cdsBanco.DataRequest(xSql);
  DM1.cdsBanco.Open;

  menumresces.SetFocus;
End;

procedure TFReliquidacionBeneficios.btngenerareliquidacionClick(Sender: TObject);
// Inicio: HPC_201703_PRE
// Se añade variable para guardar ultimo año y mes de aporte
// Var xSql:String;
Var xSql, xultmesapo:String;
// Fin: HPC_201703_PRE

  porcentanje:Double;
begin
  // chequeando nuevas resoluciones
  If menumresnom.Text = '' Then
  Begin
    Beep;
    MessageDlg(' No se ha ingresado nueva resolución de nombramiento ', mtInformation, [mbOk], 0);
    menumresnom.SetFocus;
    Exit;
  End;
  If dbdtpfecnom.Text = '' Then
  Begin
    Beep;
    MessageDlg(' No se ha ingresado nueva fecha de nombramiento ', mtInformation, [mbOk], 0);
    dbdtpfecnom.SetFocus;
    Exit;
  End;
  If menumresces.Text = '' Then
  Begin
    Beep;
    MessageDlg(' No se ha ingresado nueva resolución de cese ', mtInformation, [mbOk], 0);
    meNumResCes.SetFocus;
    Exit;
  End;
  If dbdtpfecces.Text = '' Then
  Begin
    Beep;
    MessageDlg(' No se ha ingresado nueva fecha de Cese ', mtInformation, [mbOk], 0);
    dbdtpfecces.SetFocus;
    Exit;
  End;
  If dbdtpfecnom.Date >= dbdtpfecces.Date Then
  Begin
    Beep;
    MessageDlg(' La fecha de resolución de nombramiento es mayor a la del cese ', mtInformation, [mbOk], 0);
    dbdtpfecnom.SetFocus;
    Exit;
  End;
  // Revisando si la forma de pago ingresada es la correcta
  If rgCobAso.ItemIndex = 0 Then
  Begin
    //Verificando si ingreso la forma de pago
    If dblcforpag.text = '' Then
    Begin
      MessageDlg('Ingrese la forma de pago', mtInformation, [mbOk], 0);
      dblcforpag.SetFocus;
      Exit;
    End;
    //Si es cheque
    If dblcforpag.text = '01' Then
    Begin
      If dblcBanco.Text = '' Then
      Begin
        MessageDlg('Ingrese el banco', mtInformation, [mbOk], 0);
        dblcBanco.SetFocus;
        Exit;
      End;
      dblcagegir.Text := '';
      meagengir.Text  := '';
      measoncta.Text  := '';
    End;
    //Si es giros a agencias
    If dblcforpag.text = '05' Then
    Begin
      If dblcBanco.Text = '' Then
      Begin
        MessageDlg('Ingrese el banco', mtInformation, [mbOk], 0);
        dblcBanco.SetFocus;
        Exit;
      End;
      If dblcagegir.Text = '' Then
      Begin
        MessageDlg('Ingrese la agencia del banco', mtInformation, [mbOk], 0);
        dblcagegir.SetFocus;
        Exit;
      End;
        measoncta.Text  := '';
    End;
    //Si es abono en cuenta
    If dblcforpag.text = '06' Then
    Begin
      // Verificando si se ingreo el banco
      If dblcBanco.Text = '' Then
      Begin
        MessageDlg('Ingrese el banco', mtInformation, [mbOk], 0);
        dblcBanco.SetFocus;
        Exit;
      End;
      // verificando que exista cuenta
      If meAsoncta.Text = '' Then
      Begin
        MessageDlg('Ingrese el número de la cuenta del banco', mtInformation, [mbOk], 0);
//        meAsoncta.SetFocus;
        Exit;
      End;
      dblcagegir.Text := '';
      meagengir.Text  := '';
    End;
    //Si es abono en cuenta de ahorros
    If dblcforpag.text = '11' Then
    Begin
      If dblcBanco.Text = '' Then
      Begin
        MessageDlg('Ingrese el banco', mtInformation, [mbOk], 0);
        dblcBanco.SetFocus;
        Exit;
      End;
      dblcagegir.Text := '';
      meagengir.Text  := '';
      measoncta.Text  := '';
    End;
  End
  Else
  Begin
    // Inicio: HPC_201609_PRE
    // Se añade al script de busqueda la condicion en el cual no debe tomar  tipo de estado = "13" (anulado)
    // xSql := 'SELECT * FROM PVS302 WHERE ASOID ='+QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString)+' AND DSGESTAD ='+QuotedStr('02');
    xSql := 'SELECT DSGNRO, DSGFREC, DSGESTAD, DSGFAPER, DSGVIG, ASOID, DSGOBS, DSGNOMBR, DSGAPEPAT, DSGAPEMAT, DSGNOMBRT, USUARIO, FREG, HREG, FECAPER, PVSEXPNRO, PVSNROLIQ, PVSFANUL, ANULADO, USUANU,'
    +' FECANU, PVSLBENNR, ASODNI, ASOAPENOMDNI, ASOCODMOD, USUAPE, CODOTRDOCIDE, NUMOTRDOCIDE, MOTANUCAR FROM PVS302 WHERE ASOID = '+QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString)+' AND DSGESTAD NOT IN ''13''';
    // Fin: HPC_201609_PRE
    DM1.cdsMaestCartas.Close;
    DM1.cdsMaestCartas.DataRequest(xSql);
    DM1.cdsMaestCartas.Open;
    If DM1.cdsMaestCartas.RecordCount > 0 Then
    Begin
      xSql := ' SELECT * FROM PVS303 Where DSGNRO ='+QuotedStr(DM1.cdsMaestCartas.FieldByName('DSGNRO').AsString)
      +' AND ASOID ='+QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString);
      DM1.cdsDetCartas.Close;
      DM1.cdsDetCartas.DataRequest(xSql);
      DM1.cdsDetCartas.Open;
      If DM1.cdsDetCartas.RecordCount = 0 Then
      Begin
        MessageDlg('El asociado tiene carta de designatario, pero no fue abierta', mtError, [mbOk], 0);
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
          Exit;
        End;
      End;
    End
    Else
    Begin
      xSql := ' SELECT * FROM APO203 WHERE ASOID ='+QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString)
      +' AND FAMPORC IS NOT NULL AND FAMFLLQ ='+QuotedStr('S');
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
        If DM1.Valores(FloatToStrF(porcentanje, ffNumber,15,2)) <> 100 Then
        Begin
          MessageDlg('El total porcentaje de los beneficiarios no es 100 %', mtError, [mbOk], 0);
          Exit;
        End;
      End
      Else
      Begin
        MessageDlg('El expediente de beneficios no cuenta con beneficiarios designados', mtError, [mbOk], 0);
        Exit;
      End;
    End;
  End;
//Inicio HPC_201805_PRE 
//Se añade el signo de pregunta a una expresión.
  If MessageDlg('¿Desea Generar Re-liquidación?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
//Fin HPC_201805_PRE
  Begin
    DM1.cdsExpLiq.Edit;
    DM1.cdsExpLiq.FieldByName('ASORESNOM').AsString   := menumresnom.Text;
    DM1.cdsExpLiq.FieldByName('ASOFRESNOM').AsString  := dbdtpfecnom.Text;
    DM1.cdsExpLiq.FieldByName('ASORESCESE').AsString  := menumresces.Text;
    DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsString := dbdtpfecces.Text;
    DM1.cdsExpLiq.FieldByName('FORPAGOID').AsString   := dblcforpag.Text;
    DM1.cdsExpLiq.FieldByName('BANCOID').AsString     := dblcBanco.Text;
    DM1.cdsExpLiq.FieldByName('AGENBCOID').AsString   := dblcagegir.Text;
    DM1.cdsExpLiq.FieldByName('ASONCTA').AsString     := measoncta.Text;
    DM1.xCnd := 'R';
    DM1.calculaliquidacion;
    If (DM1.liquidacionbeneficio - DM1.montoliquidacionanterior) <= 0 Then
    Begin
      MessageDlg('Monto de la nueva liquidación : S/. '+FloatToStrF(DM1.liquidacionbeneficio, ffNumber, 10,2)+
      ' Es menor que la liquidación original', mtCustom, [mbOk], 0);
      Exit;
    End;
    // Inicio: HPC_201703_PRE
    // Se cambia el procedimiento de calculo de nivelaciones y/o devoluciones
    // DM1.calculaNivDev(DM1.cdsExpLiq.FieldByName('ASOID').AsString,DM1.cdsExpLiq.FieldByName('ASOFRESNOM').AsString, DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsString);
    xultmesapo := Copy(DM1.cdsExpLiq.FieldByName('PVSULTAPO').AsString, 1, 4) + Copy(DM1.cdsExpLiq.FieldByName('PVSULTAPO').AsString, 6, 2);
    DM1.CalculaNivelacionesDevoluciones(DM1.cdsExpLiq.FieldByName('ASOID').AsString, DM1.cdsExpLiq.FieldByName('PVSEXPNRO').AsString, xultmesapo);
    // Fin: HPC_201703_PRE

    DM1.calculacreditos(DM1.cdsExpLiq.FieldByName('ASOID').AsString);
// Inicio: HPP_201004_PRE
// SAR-2009-0984
// SE AÑADE CALCULO DE FONDO SOLIDARIO
    DM1.calculafondosolidario(DM1.cdsExpLiq.FieldByName('ASOID').AsString);
// Fin: HPP_201004_PRE
    DM1.xFlg := 'R';
    Try
      FPrevioLiquidacion := TFPrevioLiquidacion.create(Self);
      FPrevioLiquidacion.ShowModal;
    Finally
      FPrevioLiquidacion.Free;
    End;
    If DM1.xSgr = 'G' Then
       btncerrarreliquidacion.OnClick(btncerrarreliquidacion);
  End;
end;

procedure TFReliquidacionBeneficios.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
  begin
    Key := #0;
    Perform(CM_DIALOGKEY, VK_TAB, 0);
  end;
end;

procedure TFReliquidacionBeneficios.rgCobAsoClick(Sender: TObject);
begin
  If rgCobAso.ItemIndex = 0 Then
  Begin

    dblcBanco.Text := '';
    mebancodes.Text := '';
    dblcforpag.Text := '';
    meforpagodes.Text := '';
    dblcagegir.Text := '';
    meagengir.Text := '';
    meAsoncta.Text := '';

    {
    dblcBanco.Visible := true;
    lblbanco.Visible := true;
    pnlbanco.Visible := true;
    }

    lblforpag.Visible := true;
    dblcforpag.Visible := true;
    pnlforpag.Visible := true;
    dblcforpag.Setfocus;
  End
  Else
  Begin
    dblcBanco.Text := '';
    mebancodes.Text := '';
    dblcforpag.Text := '';
    meforpagodes.Text := '';
    dblcagegir.Text := '';
    meagengir.Text := '';
    meAsoncta.Text := '';
    dblcBanco.Visible := false;
    lblbanco.Visible := false;
    pnlbanco.Visible := false;
    lblforpag.Visible := false;
    dblcforpag.Visible := false;
    pnlforpag.Visible := false;
    lblagegir.Visible := false;
    dblcagegir.Visible := false;
    pnlagegir.Visible := false;
    lblasoncta.Visible := false;
    pnlasoncta.Visible := false;
  End;
end;

procedure TFReliquidacionBeneficios.dblcforpagChange(Sender: TObject);
Var xSql:String;
begin
  If dblcforpag.Text = '' Then
  Begin
    meforpagodes.Text := '';
    dblcBanco.Text := '';
    dblcagegir.Text := '';
    measoncta.Text := '';
    lblbanco.Visible   := False;
    dblcBanco.Visible  := False;
    pnlbanco.Visible   := False;
    lblagegir.Visible  := False;
    dblcagegir.Visible := False;
    pnlagegir.Visible  := False;
    lblasoncta.Visible := False;
    pnlasoncta.Visible := False;
  End;
  If (dblcforpag.Text = '01') Or (dblcforpag.Text = '11') Or (dblcforpag.Text = '16') Then dblcBanco.Text := '03';
  If (dblcforpag.Text = '05') Or (dblcforpag.Text = '06') Then dblcBanco.Text := '04';
  If Length(dblcforpag.Text) = 2 then
  Begin
    If DM1.cdsFPago.Locate('TIPDESEID', dblcforpag.Text, []) Then
    Begin
      meforpagodes.Text := DM1.cdsFPago.FieldByName('TIPDESEDES').AsString;
      lblbanco.Visible := True;
      dblcBanco.Visible := True;
      pnlbanco.Visible := True;
      If (dblcforpag.Text = '01') Or (dblcforpag.Text = '11') Then
      Begin
        lblagegir.Visible  := False;
        dblcagegir.Visible := False;
        pnlagegir.Visible  := False;
        lblasoncta.Visible := False;
        pnlasoncta.Visible := False;
      End;
      If dblcforpag.Text = '05' Then
      Begin
        dblcagegir.Selected.Clear;
        dblcagegir.Selected.Add('AGENBCOID'#9'8'#9'Código'#9#9);
        dblcagegir.Selected.Add('AGENBCODES'#9'25'#9'Nombre de Agencia'#9#9);
        dblcagegir.Selected.Add('DPTODES'#9'20'#9'Departamento de Agencia'#9#9);
        xSql := 'SELECT A.AGENBCOID, A.AGENBCODES, B.DPTODES FROM COB102 A, APO158 B WHERE A.DPTOID = B.DPTOID(+) AND A.BANCOID = '+QuotedStr(dblcBanco.Text)
        +' ORDER BY DPTODES, AGENBCODES';
        DM1.cdsAgBco.Close;
        DM1.cdsAgBco.DataRequest(xSql);
        DM1.cdsAgBco.Open;
        lblasoncta.Visible := False;
        pnlasoncta.Visible := False;
        lblagegir.Visible  := True;
        dblcagegir.Visible := True;
        pnlagegir.Visible  := True;
        lblagegir.Top   := 66;
        dblcagegir.Top  := 66;
        pnlagegir.Top   := 66;
        lblagegir.Left  := 129;
        dblcagegir.Left := 219;
        pnlagegir.Left  := 300;
        dblcagegir.Text := '';
        meagengir.Text  := '';
      End;
      If dblcforpag.Text = '06' Then
      Begin
        lblagegir.Visible  := False;
        dblcagegir.Visible := False;
        pnlagegir.Visible  := False;
        lblasoncta.Visible := True;
        pnlasoncta.Visible := True;
        lblasoncta.Left := 126;
        lblasoncta.Top  := 70;
        pnlasoncta.Left := 297;
        pnlasoncta.Top  := 67;
        measoncta.Text  := '';
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

procedure TFReliquidacionBeneficios.dblcforpagExit(Sender: TObject);
Var xSql:String;
begin
  If Trim(dblcforpag.Text) <> '' Then
  Begin
    xSql := 'SELECT * FROM CRE104 WHERE TIPDESEID = '+QuotedStr(dblcforpag.Text);
    If DM1.verificaexiste(xSql) = False Then
    Begin
      MessageDlg('Forma de pago no valida', mtInformation, [mbOk], 0);
      dblcforpag.Text := '';
      dblcforpag.SetFocus;
      Exit;
    End;
  End;
  If dblcforpag.Text <> '05' Then btngenerareliquidacion.SetFocus;
end;

Procedure TFReliquidacionBeneficios.dblcBancoChange(Sender: TObject);
Begin
  If dblcBanco.Text = '' Then
  Begin
   mebancodes.Text := '';
   dblcagegir.Text := '';
   lblagegir.Visible  := False;
   dblcagegir.Visible := False;
   pnlagegir.Visible  := False;
   lblasoncta.Visible := False;
   pnlasoncta.Visible := False;
  End;
  If Length(dblcBanco.Text) = 2 then
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
end;

procedure TFReliquidacionBeneficios.dblcagegir1Change(Sender: TObject);
begin
  If Length(dblcagegir.Text) = 8 then
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
end;

procedure TFReliquidacionBeneficios.dblcagegirChange(Sender: TObject);
begin
  If dblcagegir.Text = '' Then
  Begin
    meagengir.Text := '';
    meforpagodes.Text := '';
    measoncta.Text := '';
  End;
  If Length(dblcagegir.Text) = 8 then
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
end;


procedure TFReliquidacionBeneficios.dblcBancoExit(Sender: TObject);
Var xSql:String;
begin
  If Trim(dblcBanco.Text) <> '' Then
  Begin
    xSql := 'SELECT * FROM TGE105 WHERE BANCOID = '+QuotedStr(dblcBanco.Text);
    If DM1.verificaexiste(xSql) = False Then
    Begin
      MessageDlg('Código de banco no valido', mtInformation, [mbOk], 0);
      dblcBanco.Text := '';
      dblcBanco.SetFocus;
      Exit;
    End;
  End;
end;

procedure TFReliquidacionBeneficios.dblcagegirExit(Sender: TObject);
Var xSql:String;
begin
  If Trim(dblcagegir.Text) <> '' Then
  Begin
    xSql := 'SELECT * FROM COB102 WHERE AGENBCOID = '+QuotedStr(dblcagegir.Text);
    If DM1.verificaexiste(xSql) = False Then
    Begin
      MessageDlg('Código de agencia no valida', mtInformation, [mbOk], 0);
      dblcagegir.Text := '';
      dblcagegir.SetFocus;
      Exit;
    End;
  End;
end;

end.

