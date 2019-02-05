// Inicio Uso Estándares: 01/08/2011
// Unidad               : PRE272
// Formulario           : Fprocueind
// Fecha de Creación    : 16/07/2014
// Autor                : Area de desarrollo de sistemas.
// Objetivo             : Contabilización
//
// Actualizaciones
// HPC_201504_PRE : Visualizar Cuenta Individual de CE sin Liq de Beneficios
// HPC_201703_PRE : Llama a nueva forma que calcula la cuenta individual
// HPC_201704_PRE : Se modifica los Qrys con nuevos campos que necesita el nuevo
//                  reporte de cuenta individual  



UNIT PRE272;

INTERFACE

USES
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, fcButton, fcImgBtn, fcShapeBtn, Grids, Wwdbigrd, Wwdbgrid,
   StdCtrls, Buttons, ExtCtrls, Mask, ppDB, ppDBPipe, ppDBBDE, ppParameter,
   ppCtrls, ppBands, ppReport, ppStrtch, ppSubRpt, ppVar, ppPrnabl, ppClass,
   ppCache, ppComm, ppRelatv, ppProd;

TYPE
   TFprocueind = CLASS(TForm)
      dbgasociado: TwwDBGrid;
      GroupBox1: TGroupBox;
      rgbusca: TRadioGroup;
      mebusca: TMaskEdit;
      btnBuscar: TBitBtn;
      btncerrar: TBitBtn;
      PROCEDURE FormActivate(Sender: TObject);
      PROCEDURE FormKeyPress(Sender: TObject; VAR Key: Char);
      PROCEDURE btnBuscarClick(Sender: TObject);
      PROCEDURE btncerrarClick(Sender: TObject);
      PROCEDURE rgbuscaClick(Sender: TObject);
      PROCEDURE dbgasociadoDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
   Private
    { Private declarations }
   Public
      xWhere: STRING;
    { Public declarations }
   END;

VAR
   Fprocueind: TFprocueind;

IMPLEMENTATION

// Inicio: HPC_201703_PRE
// Llama a nueva unidad de calculo de la cuenta individual
// USES PREDM, PRE273, PRE237;
// Inicio: HPC_201704_PRE
// Se añade unidad PRE295, se retira unidad PRE294
// USES PREDM, PRE273, PRE294;
USES PREDM, PRE273, PRE295;
// Fin: HPC_201704_PRE
// Fin: HPC_201703_PRE

{$R *.dfm}

PROCEDURE TFprocueind.FormActivate(Sender: TObject);
VAR
   xSql: STRING;
BEGIN
   dbgasociado.Selected.Clear;
   dbgasociado.Selected.Add('ASOCODMOD'#9'10'#9'Código~modular'#9);
   dbgasociado.Selected.Add('ASOTIPDES'#9'12'#9'Tipo de~asociado'#9);
   dbgasociado.Selected.Add('ASODNI'#9'10'#9'DNI del~asociado'#9);
   dbgasociado.Selected.Add('ASOAPENOMDNI'#9'40'#9'Apellidos y nombre(s)'#9);
   dbgasociado.Selected.Add('USENOM'#9'25'#9'UGEL del asociado'#9);
   dbgasociado.Selected.Add('ASOFRESNOM'#9'10'#9'Fecha de~nombramiento'#9);
   dbgasociado.ApplySelected;
   rgbusca.ItemIndex := 0;
   mebusca.Width := 353;
   mebusca.MaxLength := 42;
   mebusca.SetFocus;
   btnBuscar.Left := 520;

   xSql := 'SELECT A.*, C.ASOTIPDES, C.ASOTIPABR, B.USENOM'
      + ' FROM APO201 A, APO101 B, APO107 C WHERE A.USEID = B.USEID AND A.UPAGOID = B.UPAGOID AND A.UPROID = B.UPROID'
      + ' AND A.ASOTIPID = C.ASOTIPID AND A.ASOID = ''''';
   DM1.cdsAsociado.Close;
   DM1.cdsAsociado.DataRequest(xSql);
   DM1.cdsAsociado.Open;

END;

PROCEDURE TFprocueind.FormKeyPress(Sender: TObject;
   VAR Key: Char);
BEGIN
   IF Key = #13 THEN
   BEGIN
      Key := #0;
      Perform(CM_DIALOGKEY, VK_TAB, 0);
   END;
END;

PROCEDURE TFprocueind.btnBuscarClick(Sender: TObject);
VAR
   xSql, cadena: STRING;
BEGIN
   IF rgbusca.ItemIndex = 0 THEN cadena := 'Ingrese los apellidos y nombre(s) del asociado';
   IF rgbusca.ItemIndex = 1 THEN cadena := 'Ingrese el código modular del asociado';
   IF rgbusca.ItemIndex = 2 THEN cadena := 'Ingrese el DNI del asociado';
   IF Trim(mebusca.Text) = '' THEN
   BEGIN
      MessageDlg(cadena, mtInformation, [mbOk], 0);
      mebusca.SetFocus;
      Exit;
   END;
   IF rgbusca.ItemIndex = 0 THEN xWhere := ' A.ASOAPENOMDNI LIKE ' + QuotedStr(Trim(mebusca.Text) + '%');
   IF rgbusca.ItemIndex = 1 THEN
   BEGIN
      mebusca.Text := DM1.StrZero(Trim(mebusca.Text), 10);
      xWhere := ' A.ASOCODMOD = ' + QuotedStr(Trim(mebusca.Text));
   END;
   IF rgbusca.ItemIndex = 2 THEN
   BEGIN
      mebusca.Text := DM1.StrZero(Trim(mebusca.Text), 8);
      xWhere := ' A.ASODNI = ' + QuotedStr(Trim(mebusca.Text));
   END;
   xSql := 'SELECT A.*, C.ASOTIPDES, C.ASOTIPABR, B.USENOM FROM APO201 A, APO101 B, APO107 C'
      + ' WHERE ' + xWhere + ' AND A.USEID = B.USEID'
      + ' AND A.UPAGOID = B.UPAGOID AND A.UPROID = B.UPROID AND A.ASOTIPID = C.ASOTIPID';
   DM1.cdsAsociado.Close;
   DM1.cdsAsociado.DataRequest(xSql);
   DM1.cdsAsociado.Open;
   IF DM1.cdsAsociado.RecordCount = 0 THEN
   BEGIN
      MessageDlg('Cadena buscada no existe', mtError, [mbOk], 0);
      mebusca.SetFocus;
      Exit;
   END;
END;

PROCEDURE TFprocueind.btncerrarClick(Sender: TObject);
BEGIN
   Fprocueind.Close;
END;

PROCEDURE TFprocueind.rgbuscaClick(Sender: TObject);
BEGIN
   IF rgbusca.ItemIndex = 0 THEN
   BEGIN
      mebusca.Width := 353;
      mebusca.MaxLength := 42;
      mebusca.SetFocus;
      btnBuscar.Left := 520;
      mebusca.Text := '';
   END;
   IF rgbusca.ItemIndex = 1 THEN
   BEGIN
      mebusca.Width := 89;
      mebusca.MaxLength := 11;
      mebusca.SetFocus;
      btnBuscar.Left := 256;
      mebusca.Text := '';
   END;
   IF rgbusca.ItemIndex = 2 THEN
   BEGIN
      mebusca.Width := 78;
      mebusca.MaxLength := 10;
      mebusca.SetFocus;
      btnBuscar.Left := 247;
      mebusca.Text := '';
   END;
END;

Procedure TFprocueind.dbgasociadoDblClick(Sender: TObject);
// Inicio: HPC_201704_PRE
// Se retira variable no usada
//   xSql: STRING;
// Fin: HPC_201704_PRE
Begin
   // Inicio: HPC_201704_PRE
   // Se retira rutina para calcular el año y mes actual  
   // xSql := 'SELECT TO_CHAR(SYSDATE, ''YYYYMM'') ANOMESACT FROM DUAL';
   // DM1.cdsQry.Close;
   // DM1.cdsQry.DataRequest(xSql);
   // DM1.cdsQry.Open;
   // DM1.xanomesact := DM1.cdsQry.FieldByName('ANOMESACT').AsString;
   // // Inicio HPC_201504_PRE : Visualizar Cuenta Individual de CE sin Liq de Beneficios
   // Fin: HPC_201704_PRE
   IF (DM1.cdsAsociado.FieldByName('ASOTIPID').AsString <> 'DO') And (DM1.cdsAsociado.FieldByName('ASOTIPID').AsString <> 'CE') THEN
   BEGIN
      MessageDlg('No es un Asociado Activo O Cesante', mtInformation, [mbOk], 0);
      Exit;
   END;
   IF DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString = '' THEN
   BEGIN
      MessageDlg('Asociado no cuenta con resolución de nombramiento', mtInformation, [mbOk], 0);
      Exit;
   END;
   // Inicio: HPC_201704_PRE
   // Se retira control para verificar si el asociado cuenta con expediente de beneficio
   // // Inicio: HPC_201703_PRE
   // // Se controla que el asociado no cuente con expediente de beneficio
   // xSql := 'SELECT ASOID FROM PVS301 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND PVSESTADO NOT IN (''04'',''13'')';
   // DM1.cdsQry.Close;
   // DM1.cdsQry.DataRequest(xSql);
   // DM1.cdsQry.Open;
   // If DM1.cdsQry.FieldByName('ASOID').AsString <> '' Then
   // Begin
   //    MessageDlg('El asociado ya cuenta con expediente de beneficio, consulte su cuenta individual desde la opción de expedientes de beneficio.', mtInformation, [mbOk], 0);
   //    Exit;
   // End;
   // // Fin: HPC_201703_PRE
   // // Inicio: HPC_201703_PRE
   // // Se controla que el asociado no cuente con expediente de beneficio
   // xSql := 'SELECT ASOID FROM PVS301 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND PVSESTADO NOT IN (''04'',''13'')';
   // DM1.cdsQry.Close;
   // DM1.cdsQry.DataRequest(xSql);
   // DM1.cdsQry.Open;
   // If DM1.cdsQry.FieldByName('ASOID').AsString <> '' Then
   // Begin
   //    MessageDlg('El asociado ya cuenta con expediente de beneficio, consulte su cuenta individual desde la opción de expedientes de beneficio.', mtInformation, [mbOk], 0);
   //    Exit;
   // End;
   // // Fin: HPC_201703_PRE
   // xSql:='SELECT A.PVSLBENNR'
   //      +' FROM APO201 B, PVS301 A '
   //      +' WHERE A.ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)
   //      +' AND ((NVL(GENPORWEB,''N'') = ''S'' AND NVL(CONOFIDE,''N'') = ''S'')  OR (NVL(GENPORWEB,''N'') = ''N''))'
   //      +' And A.PVSESTADO NOT IN (''04'',''13'') AND A.ASOID = B.ASOID '
   //      +' ORDER BY A.FREG DESC';
   // DM1.cdsExpLiq.Close;
   // DM1.cdsExpLiq.DataRequest(xSql);
   // DM1.cdsExpLiq.Open;
   // If Trim(DM1.cdsExpLiq.FieldByName('PVSLBENNR').AsString) <> '' Then
   // Begin
   //    MessageDlg('El asociado ya cuenta con liquidación de beneficio', mtInformation, [mbOk], 0);
   //    Exit;
   //  End;
   // // Fin   HPC_201504_PRE : Visualizar Cuenta Individual de CE sin Liq de Beneficios
   // DM1.asoresnom := DM1.cdsAsociado.FieldByName('ASORESNOM').AsString;
   // DM1.asorescese := DM1.cdsAsociado.FieldByName('ASORESCESE').AsString;
   // DM1.asofresnom := DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString;
   // DM1.tipben := '01';
   // xSql := 'SELECT MAX(APOSEC) APOSEC FROM APO301 WHERE ASOID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString);
   // DM1.cdsQry.Close;
   // DM1.cdsQry.DataRequest(xSql);
   // DM1.cdsQry.Open;
   // DM1.anoultapo := Copy(DM1.cdsQry.FieldByName('APOSEC').AsString, 1, 4);
   // DM1.mesultapo := Copy(DM1.cdsQry.FieldByName('APOSEC').AsString, 5, 2);
   // DM1.xanomesultapo := DM1.cdsQry.FieldByName('APOSEC').AsString;
   // DM1.xanomestop := inttostr(StrToInt(DM1.anoultapo) + 2) + DM1.mesultapo;
   //DM1.asofrescese   := DateToStr(DM1.FECHASYS); PARA REVISAR
   // IF DM1.xanomestop > DM1.xanomesact THEN
   //    DM1.asofrescese := '28/' + Copy(DM1.xanomesact, 5, 2) + '/' + Copy(DM1.xanomesact, 1, 4)
   // ELSE
   //    DM1.asofrescese := '28/' + Copy(DM1.xanomestop, 5, 2) + '/' + Copy(DM1.xanomestop, 1, 4);
   // IF DM1.asofrescese = '' THEN
   // BEGIN
   //    MessageDlg('Ingrese fecha de resolución de cese para esa opción', mtInformation, [mbOk], 0);
   //    Exit;
   // END;
   // IF Copy(DM1.asofrescese, 7, 4) + Copy(DM1.asofrescese, 4, 2) < '199912' THEN
   // BEGIN
   //    IF DM1.tipben = '' THEN
   //    BEGIN
   //       MessageDlg('Ingrese el tipo de beneficio para procesar esta opción', mtInformation, [mbOk], 0);
   //       Exit;
   //    END;
   // END;
   // IF (DM1.tipben = '03') AND (Copy(DM1.asofrescese, 7, 4) < '1997') AND (DM1.cdsAsociado.FieldByName('ASOFECNAC').AsString = '') THEN
   // BEGIN
   //    MessageDlg('Ingrese la fecha de nacimiento del asociado para procesar esta opción', mtInformation, [mbOk], 0);
   //    Exit;
   // END;
   // DM1.xpvslbennr := '';
   // Fin: HPC_201704_PRE





   // Inicio: HPC_201704_PRE
   // Se hace llamado a la nueva forma de reportes de cuenta individual
   // // Inicio: HPC_201703_PRE
   // // Llama a nueva forma para el calculo de la cuenta individual
   // // TRY
   // //    fmstapo := Tfmstapo.create(Self);
   // //    fmstapo.ShowModal;
   // // FINALLY
   // //    fmstapo.Free;
   // // END;
   // TRY
   //    fmscueind := Tfmscueind.create(Self);
   //    fmscueind.ShowModal;
   // FINALLY
   //    fmscueind.Free;
   // END;
   // // Fin: HPC_201703_PRE
   Try
      Fnuerepcueind := TFnuerepcueind.create(Self);
      Fnuerepcueind.ShowModal;
   Finally
      Fnuerepcueind.Free;
   End;
   // Fin: HPC_201704_PRE
   
END;


procedure TFprocueind.FormCreate(Sender: TObject);
begin
// Inicio: HPP_200909_PRE por JDCRUZ
// Memorándum 308-2009-DM-EPS - SAR-2009-0726 - DAD-JD-2009-0140
// COLOCAR FECHA DE ULTIMO APORTE
  DM1.cdsCueInd.open();
// Fin: HPP_200909_PRE
end;


procedure TFprocueind.FormClose(Sender: TObject; var Action: TCloseAction);
begin
// Inicio: HPP_201004_PRE por IREVILLA
// El client cdsCueind no debe ser cerrado de abre al inicio de la aplicación.
// y solo de limpia si se desea utilizarlo otra vez.
// el client cdsCueInd es un client temporal que siempre esta abierto.
// COLOCAR FECHA DE ULTIMO APORTE
//  DM1.cdsCueInd.Close;
//  DM1.cdsCueInd.Filter:='';
//  DM1.cdsCueInd.IndexFieldNames:='';
// Fin: HPP_201004_PRE
end;

End.

