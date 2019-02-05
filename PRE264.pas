// Inicio Uso Estándares: 01/08/2011
// Unidad : Previsión Social
// Formulario : TFapecardes
// Fecha de Creación : 08/08/2011
// Autor : Sistemas
// Objetivo : APERTURA DE LA CARTA DE DESIGNATARIO
// Actualizaciones
// HPC_201302_PRE  : AÑADIR EN LA TABLA PVS303 LOS CAMPOS DIRECCION DEL DESIGNATARIO,  CODIGO ZIP DE LA DIRECCION DEL DESIGNATARIO,
//                   TELEFONO FIJO DE REFERENCIA DEL DESIGNATARIO Y TELEFONO CELULAR DE REFERENCIA DEL DESIGNATARIO.
// SPP_201303_PRE  : El pase a producción se realiza a partir del HPC_201302_PRE
// HPC_201304_PRE  : Se añade en el combo tipo de relación SOBRINOS Y OTROS PARA EL DETALLE DE LA CARTA DE DESIGNATARIO
// SPP_201305_PRE  : Se realiza el pase a producción a partir del HPC_201304_PRE
// HPC_201402_PRE  : Se añade al mantenimiento de cartas de designatarios el campo de apellido de casada.
// SPP_201403_PRE  : Se realiza el pase a producción a partir del pase HPC_201402_PRE.
// HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
// HPC_201703_PRE : Se graba email del designatario
// HPC_201809_PRE : Se modifica la opción de mantenimiento de beneficiarios de la carta de designación

unit PRE264;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, DB, DBClient, Mask,
  ExtCtrls, wwdbdatetimepicker, Buttons;

type
  TFapecardes = class(TForm)
    gbcartas: TGroupBox;
    Label1: TLabel;
    pnlasocodmod: TPanel;
    Label7: TLabel;
    Panel2: TPanel;
    meAsoDocNum: TMaskEdit;
    Label3: TLabel;
    Panel1: TPanel;
    meAsoApeNomDni: TMaskEdit;
    dbdtpfecape: TwwDBDateTimePicker;
    meobs: TMaskEdit;
    Label2: TLabel;
    Label4: TLabel;
    dbgdeudos: TwwDBGrid;
    dbgbinserta: TwwIButton;
    btnGrabar: TBitBtn;
    btnCerrar: TBitBtn;
    Label5: TLabel;
    Label6: TLabel;
    meAsocodmod: TMaskEdit;
    Panel3: TPanel;
    medsgnro: TMaskEdit;
    Panel4: TPanel;
    medsgfrec: TMaskEdit;
    btnElimina: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure dbgbinsertaClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    function validagrabacion:Boolean;
    procedure btnGrabarClick(Sender: TObject);
    procedure btnEliminaClick(Sender: TObject);
    procedure dbgdeudosDblClick(Sender: TObject);
  private
    { Private declarations }
// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
    sModLiqR : String;
// Fin    HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
  public
    { Public declarations }
  end;

var
  Fapecardes: TFapecardes;

implementation
// Inicio: HPC_201809_PRE
// Se añade la unidad de mantenimiento de familiares
// uses PREDM, PRE265;
uses PREDM, PRE265, PRE240;
// Fin: HPC_201809_PRE

{$R *.dfm}

Procedure TFapecardes.FormActivate(Sender: TObject);
Var xSql:String;
    xporc :Double;
Begin
  xSQL := 'SELECT CIAID, PVSEXPNRO, PVSTIPBEN, ASOID, ASOCODMOD, ASOCODAUX, PVSESTADO, '
         +'       PVSCAUSA, FORPAGOID, BANCOID, PVSULTAPO, USUARIO, FREG, HREG, AGENBCOID, '
         +'       REPRID, PVSCOBASO, ASOAPENOMDNI, ASONCTA, PVSLBENNR, PVSLFECBE, ASORESNOM,'
         +'       ASOFRESNOM, ASORESCESE, ASOFRESCESE, ASOFECNAC, TIPDOCCOD, ASODOCNUM, ASODNI, '
         +'       ASOFECINV, ASOFECFAL, DISORIEXP, USU_ANU, FEC_ANU, COM_ANU, CODOTRDOCIDE, NUMOTRDOCIDE, '
         +'       PVSFECEXP, USUCREEXP '
         +'  FROM PVS301 '
         +' WHERE ASOID = '+QuotedStr(DM1.cdsMaestCartas.FieldByName('ASOID').AsString)
         +'   AND FREG  = (select max(FREG) '
         +'                  from PVS301 '
         +'                 where ASOID = '+QuotedStr(DM1.cdsMaestCartas.FieldByName('ASOID').AsString)+')';
  DM1.cdsExpLiq.Close;
  DM1.cdsExpLiq.DataRequest(xSql);
  DM1.cdsExpLiq.Open;
  DM1.xCnd := '';
  meobs.Text := DM1.cdsMaestCartas.FieldByName('DSGOBS').AsString;
  DM1.cdsdetcardes.EmptyDataSet;
  dbgdeudos.ColumnByName('DNI').FooterValue := 'TOTALES';
  dbgdeudos.ColumnByName('PORC').FooterValue := FormatFloat('###,###,##0',0);
  medsgnro.Text       := DM1.cdsMaestCartas.FieldByName('DSGNRO').AsString;
  medsgfrec.Text      := DM1.cdsMaestCartas.FieldByName('DSGFREC').AsString;
  meAsocodmod.Text    := DM1.cdsMaestCartas.FieldByName('ASOCODMOD').AsString;
  meAsoApeNomDni.Text := DM1.cdsMaestCartas.FieldByName('ASOAPENOMDNI').AsString;
  meAsoDocNum.Text    := DM1.cdsMaestCartas.FieldByName('ASODNI').AsString;
  dbdtpfecape.Date    := Date;
  xSql := 'SELECT A.DSGAPEPAT, A.DSGAPEMAT, A.DSGNOMBR, A.DSGTREL, A.DSGOTRTIPREL,  A.DSGFNAC, A.DSGSEX, A.DSGDNI, A.DSGPORC, A.DSGDIRDES, A.DSGZIPIDDES, A.DSGTELFIJDES, A.DSGTELMOVDES, A.DSGTAPEP,'
  // Inicio: HPC_201809_PRE
  // Se añade campo menor de edad 
  // +' A.DSGTAPEM, A.DSGTNOMB, A.DSGTDNI, A.FORPAGOID, A.BANCOID, A.AGENBCOID, B.PARENDES, A.DSGAPECAS, A.EMAILDES FROM PVS303 A, TGE149 B WHERE A.ASOID = '+QuotedStr(DM1.cdsMaestCartas.FieldByName('ASOID').AsString)
  +' A.DSGTAPEM, A.DSGTNOMB, A.DSGTDNI, A.FORPAGOID, A.BANCOID, A.AGENBCOID, B.PARENDES, A.DSGAPECAS, A.EMAILDES, A.MENEDAD FROM PVS303 A, TGE149 B WHERE A.ASOID = '+QuotedStr(DM1.cdsMaestCartas.FieldByName('ASOID').AsString)
  // Fin: HPC_201809_PRE
  +' AND DSGNRO = '+QuotedStr(DM1.cdsMaestCartas.FieldByName('DSGNRO').AsString)+' AND A.DSGTREL = B.PARENID(+)';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  DM1.cdsdetcardes.EmptyDataSet;
  xporc := 0;
  While Not DM1.cdsQry.Eof Do
  Begin
    DM1.cdsdetcardes.Append;
    DM1.cdsdetcardes.FieldByName('APEPAT').AsString       := DM1.cdsQry.FieldByName('DSGAPEPAT').AsString;
    DM1.cdsdetcardes.FieldByName('APEMAT').AsString       := DM1.cdsQry.FieldByName('DSGAPEMAT').AsString;
    DM1.cdsdetcardes.FieldByName('APECAS').AsString       := DM1.cdsQry.FieldByName('DSGAPECAS').AsString; // SPP_201403_PRE 
    DM1.cdsdetcardes.FieldByName('APENOM').AsString       := DM1.cdsQry.FieldByName('DSGNOMBR').AsString;
    DM1.cdsdetcardes.FieldByName('TIPREL').AsString       := DM1.cdsQry.FieldByName('DSGTREL').AsString;
    DM1.cdsdetcardes.FieldByName('EMAILDES').AsString       := DM1.cdsQry.FieldByName('EMAILDES').AsString;
    DM1.cdsdetcardes.FieldByName('PARENDES').AsString     := DM1.cdsQry.FieldByName('PARENDES').AsString;
    DM1.cdsdetcardes.FieldByName('DSGOTRTIPREL').AsString := DM1.cdsQry.FieldByName('DSGOTRTIPREL').AsString;
    DM1.cdsdetcardes.FieldByName('FECNAC').AsDateTime  := DM1.cdsQry.FieldByName('DSGFNAC').AsDateTime;
    DM1.cdsdetcardes.FieldByName('SEXO').AsString      := DM1.cdsQry.FieldByName('DSGSEX').AsString;
    DM1.cdsdetcardes.FieldByName('DNI').AsString       := DM1.cdsQry.FieldByName('DSGDNI').AsString;
    DM1.cdsdetcardes.FieldByName('PORC').AsFloat       := DM1.cdsQry.FieldByName('DSGPORC').AsFloat;
    xporc := xporc + DM1.cdsdetcardes.FieldByName('PORC').AsFloat;
    DM1.cdsdetcardes.FieldByName('DSGDIRDES').AsString    := DM1.cdsQry.FieldByName('DSGDIRDES').AsString;
    DM1.cdsdetcardes.FieldByName('DSGZIPIDDES').AsString  := DM1.cdsQry.FieldByName('DSGZIPIDDES').AsString;
    DM1.cdsdetcardes.FieldByName('DSGTELFIJDES').AsString := DM1.cdsQry.FieldByName('DSGTELFIJDES').AsString;
    DM1.cdsdetcardes.FieldByName('DSGTELMOVDES').AsString := DM1.cdsQry.FieldByName('DSGTELMOVDES').AsString;
    DM1.cdsdetcardes.FieldByName('APEPATTUT').AsString := DM1.cdsQry.FieldByName('DSGTAPEP').AsString;
    DM1.cdsdetcardes.FieldByName('APEMATTUT').AsString := DM1.cdsQry.FieldByName('DSGTAPEM').AsString;
    DM1.cdsdetcardes.FieldByName('NOMTUT').AsString    := DM1.cdsQry.FieldByName('DSGTNOMB').AsString;
    DM1.cdsdetcardes.FieldByName('DNITUT').AsString    := DM1.cdsQry.FieldByName('DSGTDNI').AsString;
    DM1.cdsdetcardes.FieldByName('FORPAGID').AsString  := DM1.cdsQry.FieldByName('FORPAGOID').AsString;
    DM1.cdsdetcardes.FieldByName('BANCOID').AsString   := DM1.cdsQry.FieldByName('BANCOID').AsString;
    DM1.cdsdetcardes.FieldByName('AGEBCOID').AsString  := DM1.cdsQry.FieldByName('AGENBCOID').AsString;
    // Inicio: HPC_201809_PRE
    // Se añade el campo menor de edad
    DM1.cdsdetcardes.FieldByName('MENEDAD').AsString  := DM1.cdsQry.FieldByName('MENEDAD').AsString;
    // Fin: HPC_201809_PRE

    DM1.cdsdetcardes.Post;
    DM1.cdsQry.Next;
  End;
  dbgdeudos.ColumnByName('PORC').FooterValue := FormatFloat('###,###,##0',xporc);
  If (DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString <> '02') And (DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString <> '06')  Then
  Begin
    btnElimina.Enabled  := True;
    btnGrabar.Enabled   := True;
    dbgbinserta.Enabled := True;
    dbdtpfecape.Enabled := True;
    meobs.Enabled       := True;
  End
  Else
  Begin
    dbdtpfecape.Enabled := False;
    meobs.Enabled       := False;
    btnElimina.Enabled  := False;
    btnGrabar.Enabled   := False;
    dbgbinserta.Enabled := False;
  End;

// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
  xSql:='SELECT a.pvslbennr FROM PVS306 a, PVS307 b '
       + 'WHERE ASOID = '''+DM1.cdsMaestCartas.FieldByName('ASOID').AsString+''' '
       +  ' and a.pvslbennr='''+DM1.cdsExpLiq.FieldByname('pvslbennr').AsString+''' and numbenori is not null '
       +  ' and a.pvslbennr = b.pvslbennr and pvslnofc is not null';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  sModLiqR:='N';
  if DM1.cdsQry.RecordCount<=0 then
  begin
    btnElimina.Enabled  := True;
    btnGrabar.Enabled   := True;
    dbgbinserta.Enabled := True;
    dbdtpfecape.Enabled := True;
    meobs.Enabled       := True;
    sModLiqR:='S';
  end;
// Fin    HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios

  If DM1.cdsMaestCartas.FieldByName('DSGESTAD').AsString = '01' Then
  Begin
    dbdtpfecape.Enabled := True;
    meobs.Enabled := True;
  End
  Else
  Begin
    dbdtpfecape.Enabled := False;
    meobs.Enabled := False;
  End;
End;

Procedure TFapecardes.dbgbinsertaClick(Sender: TObject);
Var xpor:Double;
begin
  If (DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString <> '02') And (DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString <> '06') Then
  Begin
    // Inicio: HPC_201809_PRE
    // Se modifica la opción de ingresos de beneficiarios de la carta
    DM1.xSgr := 'D';
    DM1.xCnd := 'I';
    // Try
    //   Fingdeucar := TFingdeucar.create(Self);
    //   Fingdeucar.ShowModal;
    // Finally
    //   Fingdeucar.Free;
    // end;
    Try
       FManFami := TFManFami.create(Self);
       FManFami.ShowModal;
    Finally
       FManFami.Free;
    End;
    // Fin: HPC_201809_PRE

    If DM1.xFlg = 'S' Then
    Begin
      xpor := 0;
      DM1.cdsdetcardes.First;
      While Not DM1.cdsdetcardes.Eof Do
      Begin
        xpor := xpor + DM1.cdsdetcardes.FieldByName('PORC').AsFloat;
        DM1.cdsdetcardes.Next;
      End;
      dbgdeudos.ColumnByName('PORC').FooterValue := FormatFloat('###,###,##0',xpor);
    End;
// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
  End
  else
    if sModLiqR='S' Then
    Begin
      DM1.xSgr := 'I';
      Try
        Fingdeucar := TFingdeucar.create(Self);
        Fingdeucar.ShowModal;
      Finally
        Fingdeucar.Free;
      end;
      If DM1.xFlg = 'S' Then
      Begin
        xpor := 0;
        DM1.cdsdetcardes.First;
        While Not DM1.cdsdetcardes.Eof Do
        Begin
          xpor := xpor + DM1.cdsdetcardes.FieldByName('PORC').AsFloat;
          DM1.cdsdetcardes.Next;
        End;
        dbgdeudos.ColumnByName('PORC').FooterValue := FormatFloat('###,###,##0',xpor);
      End;
    End;
// Fin   HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
End;

Procedure TFapecardes.btnCerrarClick(Sender: TObject);
Begin
  If DM1.xCnd = 'N' Then
  Begin
    If MessageDlg('¿ Seguro de salir sin actualizar la apertura de carta ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
    Begin
      Fapecardes.Close;
    End;
  End
  Else
    Fapecardes.Close;
End;

procedure TFapecardes.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key = #13 Then
    begin
     Key := #0;
     Perform(CM_DIALOGKEY, VK_TAB, 0);
    end;
end;

function TFapecardes.validagrabacion: Boolean;
Var totpor:Double;
begin
  DM1.cdsdetcardes.First;
  totpor := 0;
  While Not DM1.cdsdetcardes.Eof Do
  Begin
    totpor := totpor + DM1.cdsdetcardes.FieldByName('PORC').AsFloat;
    DM1.cdsdetcardes.Next;
  End;
  If totpor < 100 Then
  Begin
    MessageDlg('No se ha cubierto el 100%', mtInformation, [mbOk], 0);
    Result := False;
    btnCerrar.SetFocus;
    Exit;
  End;
  If totpor > 100 Then
  Begin
    MessageDlg('El total porcentaje ha excedido el 100%', mtInformation, [mbOk], 0);
    Result := False;
    btnCerrar.SetFocus;
    Exit;
  End;
  Result := True;
end;

procedure TFapecardes.btnGrabarClick(Sender: TObject);
// Inicio: HPC_201809_PRE
// Se añade variable para calculo de menor de edad
Var xSql:String;
// Fin: HPC_201809_PRE
begin
  If validagrabacion Then
  Begin
    If MessageDlg('¿ Seguro de actualizar la carta de designación ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
    Begin
      DM1.xCnd := 'S';
      xSql := 'DELETE PVS303 WHERE ASOID = '+QuotedStr(DM1.cdsMaestCartas.FieldByName('ASOID').AsString);
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      xSql := 'UPDATE PVS302 SET DSGESTAD = '+QuotedStr('02')+', DSGFAPER= '+QuotedStr(dbdtpfecape.Text)+', USUAPE= '+QuotedStr(DM1.wUsuario)
             +', FECAPER = '+QuotedStr(dbdtpfecape.Text)+', DSGOBS = '+QuotedStr(meobs.Text)
             +'  WHERE ASOID = '+QuotedStr(DM1.cdsMaestCartas.FieldByName('ASOID').AsString)+' AND DSGNRO = '+QuotedStr(DM1.cdsMaestCartas.FieldByName('DSGNRO').AsString);
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      DM1.cdsdetcardes.First;
      While Not DM1.cdsdetcardes.Eof Do
      Begin
        // Inicio: HPC_201809_PRE
        // Se añade el campo menor de edad
        xSql := 'INSERT INTO PVS303 (CIAID, DSGNRO, ASOID, DSGTREL, DSGAPEPAT, DSGAPEMAT, DSGNOMBR, DSGFNAC, DSGSEX,'
        +' DSGPORC, DSGTAPEP, DSGTAPEM, DSGTNOMB, DSGTDNI, DSGDNI, FORPAGOID, BANCOID, AGENBCOID, USUARIO, FREG, HREG, DSGDIRDES, DSGZIPIDDES, DSGTELFIJDES, DSGTELMOVDES, DSGOTRTIPREL, DSGAPECAS, EMAILDES, MENEDAD)'
        +' VALUES (''02'','+QuotedStr(DM1.cdsMaestCartas.FieldByName('DSGNRO').AsString)+','+QuotedStr(DM1.cdsMaestCartas.FieldByName('ASOID').AsString)
        +','+QuotedStr(DM1.cdsdetcardes.FieldByName('TIPREL').AsString)+','+QuotedStr(DM1.cdsdetcardes.FieldByName('APEPAT').AsString)
        +','+QuotedStr(DM1.cdsdetcardes.FieldByName('APEMAT').AsString)+','+QuotedStr(DM1.cdsdetcardes.FieldByName('APENOM').AsString)
        +','+QuotedStr(DM1.cdsdetcardes.FieldByName('FECNAC').AsString)+','+QuotedStr(DM1.cdsdetcardes.FieldByName('SEXO').AsString)
        +','+DM1.cdsdetcardes.FieldByName('PORC').AsString+','+QuotedStr(DM1.cdsdetcardes.FieldByName('APEPATTUT').AsString)
        +','+QuotedStr(DM1.cdsdetcardes.FieldByName('APEMATTUT').AsString)+','+QuotedStr(DM1.cdsdetcardes.FieldByName('NOMTUT').AsString)
        +','+QuotedStr(DM1.cdsdetcardes.FieldByName('DNITUT').AsString)+','+QuotedStr(DM1.cdsdetcardes.FieldByName('DNI').AsString)
        +','+QuotedStr(DM1.cdsdetcardes.FieldByName('FORPAGID').AsString)+','+QuotedStr(DM1.cdsdetcardes.FieldByName('BANCOID').AsString)
        +','+QuotedStr(DM1.cdsdetcardes.FieldByName('AGEBCOID').AsString)+','+QuotedStr(DM1.wUsuario)+', TO_DATE(SYSDATE)'+', SYSDATE'
        +','+QuotedStr(DM1.cdsdetcardes.FieldByName('DSGDIRDES').AsString)+','+QuotedStr(DM1.cdsdetcardes.FieldByName('DSGZIPIDDES').AsString)
        +','+QuotedStr(DM1.cdsdetcardes.FieldByName('DSGTELFIJDES').AsString)+','+QuotedStr(DM1.cdsdetcardes.FieldByName('DSGTELMOVDES').AsString)
        +','+QuotedStr(DM1.cdsdetcardes.FieldByName('DSGOTRTIPREL').AsString)
        +','+QuotedStr(DM1.cdsdetcardes.FieldByName('APECAS').AsString)
        +','+QuotedStr(DM1.cdsdetcardes.FieldByName('EMAILDES').AsString)
        +','+QuotedStr(DM1.cdsdetcardes.FieldByName('MENEDAD').AsString)
        +' )';
        // Fin: HPC_201809_PRE
        DM1.DCOM1.AppServer.EjecutaSQL(xSql);
        DM1.cdsdetcardes.Next;
      End;
      MessageDlg('Apertura de la carta Ok', mtInformation, [mbOk], 0);
      DM1.xFlg := 'S';
      Fapecardes.Close;
    End;
  End;
end;

procedure TFapecardes.btnEliminaClick(Sender: TObject);
Var xporc :Double;
begin
  DM1.xCnd := 'N';
  DM1.cdsdetcardes.Delete;
  DM1.cdsdetcardes.First;
  xporc := 0;
  While Not DM1.cdsdetcardes.Eof Do
  Begin
    xporc := xporc + DM1.cdsdetcardes.fieldByName('PORC').AsFloat;
    DM1.cdsdetcardes.Next;
  End;
  dbgdeudos.ColumnByName('PORC').FooterValue := FormatFloat('###,###,##0',xporc);
end;

procedure TFapecardes.dbgdeudosDblClick(Sender: TObject);
Var xporc :Double;
begin
  If (DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString <> '02') And (DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString <> '06') Then
  Begin
    // Inicio: HPC_201809_PRE
    // Se modifica la opción de mantenimiento de beneficiarios de la carta
    DM1.xSgr := 'D';
    DM1.xCnd := 'M';
    If DM1.cdsMaestCartas.FieldByName('PVSLBENNR').AsString = '' Then
    Begin
      Try
        FManFami := TFManFami.create(Self);
        FManFami.ShowModal;
      Finally
        FManFami.Free;
      End;
      // Try
      //    Fingdeucar := TFingdeucar.create(Self);
      //    Fingdeucar.ShowModal;
      // Finally
      //    Fingdeucar.Free;
      // End;
    End;
    // Fin: HPC_201809_PRE
    xporc := 0;
    DM1.cdsdetcardes.First;
    While Not DM1.cdsdetcardes.Eof Do
    Begin
      xporc := xporc + DM1.cdsdetcardes.FieldByName('PORC').AsFloat;
      DM1.cdsdetcardes.Next;
    End;
    dbgdeudos.ColumnByName('PORC').FooterValue := FormatFloat('###,###,##0',xporc);
  End
  else
    if sModLiqR='S' Then
    Begin
      DM1.xCnd := 'N';
      DM1.xSgr := 'M';
      Try
        Fingdeucar := TFingdeucar.create(Self);
        Fingdeucar.ShowModal;
      Finally
        Fingdeucar.Free;
      End;
      xporc := 0;
      DM1.cdsdetcardes.First;
      While Not DM1.cdsdetcardes.Eof Do
      Begin
        xporc := xporc + DM1.cdsdetcardes.FieldByName('PORC').AsFloat;
        DM1.cdsdetcardes.Next;
      End;
      dbgdeudos.ColumnByName('PORC').FooterValue := FormatFloat('###,###,##0',xporc);
   end;
End;

end.
