// Inicio Uso Estándares : 01/08/2011
// Unidad                : PRE263.pas
// Formulario            : FReliquidacionBeneficios
// Fecha de Creación     : 15/12/1993
// Autor                 : Área de Desarrollo de Sistemas
// Objetivo              : Liquidación de Beneficios
// Actualizaciones:
// HPC_201609_PRE : Se controla que en la busqueda de cartas de designación no se incluyan las anuladas
// HPC_201704_PRE : Se actualiza campo DSGESTAD con "13" (anulado)
// HPC_201709_PRE : Se añaden los campos de departamento y oficina de origen de
//                  recepción de la carta de designación

unit PRE263;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  // Inicio: HPC_201709_PRE  
  // Se añade nueva unidades al formulario
  // Dialogs, StdCtrls, Buttons, Mask, ExtCtrls, wwdbdatetimepicker;
  Dialogs, StdCtrls, Buttons, Mask, ExtCtrls, wwdbdatetimepicker, wwdblook, Wwdbdlg;
  // Fin: HPC_201709_PRE

type
  TFnuecardes = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    pnlasocodmod: TPanel;
    meAsocodmod: TMaskEdit;
    sbBuscar: TSpeedButton;
    Panel2: TPanel;
    meAsoDocNum: TMaskEdit;
    Label7: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    meAsoApeNomDni: TMaskEdit;
    Label4: TLabel;
    Panel3: TPanel;
    meUsenom: TMaskEdit;
    meUseid: TMaskEdit;
    Label5: TLabel;
    Panel4: TPanel;
    meUpagonom: TMaskEdit;
    meUpagoid: TMaskEdit;
    Label6: TLabel;
    Panel5: TPanel;
    meUpronom: TMaskEdit;
    meUproid: TMaskEdit;
    dbdtpfecrec: TwwDBDateTimePicker;
    Label2: TLabel;
    Label8: TLabel;
    meobs: TMaskEdit;
    btngrabar: TBitBtn;
    btncerrar: TBitBtn;
    // Inicio: HPC_201709_PRE
    // Cajas de texto para el ingreso del departamento y oficina de origen
    gborigen: TGroupBox;
    Label20: TLabel;
    Label16: TLabel;
    dblcdptoid: TwwDBLookupCombo;
    dblcdofid: TwwDBLookupCombo;
    Panel12: TPanel;
    edtOficina: TMaskEdit;
    Panel13: TPanel;
    medesdpto: TMaskEdit;
    // procedure meAsocodmodChange(Sender: TObject);
    // Fin: HPC_201709_PRE

    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure meAsocodmodExit(Sender: TObject);
    procedure sbBuscarClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure btngrabarClick(Sender: TObject);
    // Inicio: HPC_201709_PRE
    // Nuevos procedimientos para el control e ingreso del departamento y oficina de origen
    procedure FormActivate(Sender: TObject);
    procedure dblcdptoidExit(Sender: TObject);
    procedure dblcdofidExit(Sender: TObject);
    procedure dbdtpfecrecExit(Sender: TObject);
    // Fin: HPC_201709_PRE
   // procedure meAsocodmodExit(Sender: TObject);
  private
    Procedure limpia;
    Procedure llena;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fnuecardes: TFnuecardes;

implementation

uses PREDM, PRE234;

{$R *.dfm}
// Inicio: HPC_201709_PRE
// Se retira procedimiento para el control de ingreso del codigo modular
// procedure TFnuecardes.meAsocodmodChange(Sender: TObject);
// begin
//   If Length(Trim(meAsocodmod.Text)) = 0 Then
//   Begin
//     limpia;
//     DM1.xSgr := 'N';
//   End;
// end;
// Fin: HPC_201709_PRE

procedure TFnuecardes.FormKeyPress(Sender: TObject; var Key: Char);
begin
 If Key = #13 Then
  begin
    Key := #0;
    Perform(CM_DIALOGKEY, VK_TAB, 0);
  end;
end;

// Inicio: HPC_201709_PRE
// Se modifica el control en el ingreso del codigo modular del asociado
procedure TFnuecardes.meAsocodmodExit(Sender: TObject);
Var xSql:String;
begin
  Begin
    If Length(Trim(meAsocodmod.Text))=0 Then
    Begin
       meAsocodmod.Text := '';
       meAsoDocNum.Text := '';
       meUproid.Text := '';
       meUpronom.Text := '';
       meUpagoid.Text := '';
       meUpagonom.Text := '';
       meUseid.Text := '';
       meUsenom.Text := '';
       dblcdptoid.Text := '';
       dblcdofid.Text := '';
       dbdtpfecrec.Text := '';
       meobs.Text := '';
       // meAsocodmod.SetFocus;
       Exit;
    End
    Else
    Begin
      // If Length(Trim(meAsocodmod.Text))>10 Then
      // Begin
      //   // INICIO: HPC_201704_PRE
      //   // Se añade tilde a la palabra "Codigo"
      //   // MessageDlg('Codigo Modular No Puede Tener Mas De 10 Caracteres...!', mtError, [mbOk], 0);
      //   MessageDlg('Código Modular No Puede Tener Mas De 10 Caracteres...!', mtError, [mbOk], 0);
      //   // Fin: HPC_201704_PRE
      //   meAsocodmod.Text:='';
      //   meAsocodmod.SetFocus;
      //   Exit;
      // End;
      // meAsocodmod.Text := Format('%.10d',[StrToInt(meAsocodmod.Text)]);
      meAsocodmod.Text := DM1.StrZero(Trim(meAsocodmod.Text),10);
      // DM1.cdsAsociado.Close;
      xSql := 'SELECT A.ASOID, A.ASODNI, A.ASOCODMOD, A.ASOAPENOMDNI, A.UPROID, A.UPAGOID, A.USEID, A.DESHABILITADO, A.ASOTIPID, B.USENOM, C.ASOTIPDES'
      // +' FROM APO201 A, APO101 B, APO107 C WHERE ASOCODMOD LIKE '+QuotedStr(meAsocodmod.Text+'%')
      +' FROM APO201 A, APO101 B, APO107 C WHERE ASOCODMOD = '+QuotedStr(meAsocodmod.Text)      
      +' AND A.USEID = B.USEID(+) AND A.UPAGOID = B.UPAGOID(+) AND A.UPROID = B.UPROID(+)'
      +' AND A.ASOTIPID = C.ASOTIPID';
      DM1.cdsAsociado.Close;
      DM1.cdsAsociado.DataRequest(xSql);
      DM1.cdsAsociado.Open;
      If DM1.cdsAsociado.RecordCount = 1 Then
      Begin
        If DM1.cdsAsociado.FieldByName('DESHABILITADO').AsString = 'S' Then
        Begin
          MessageDlg('El registro se encuentra bloqueado/deshabilitado', mtError, [mbOk], 0);
          Exit;
        End;
        If DM1.cdsAsociado.FieldByName('ASOTIPID').AsString <> 'DO' Then
        Begin
          llena;
          MessageDlg('No es un asociado docente', mtError, [mbOk], 0);
          limpia;
          Exit;
        End;
        limpia;
        llena;
      End
      Else
        If DM1.cdsAsociado.RecordCount > 1 Then
        Begin
          limpia;
          Try
            FBusAso := TFBusAso.create(Self);
            FBusAso.ShowModal;
          Finally
            FBusAso.Free;
          End;
          limpia;
          llena;
        End
        Else
        Begin
          limpia;
          // INICIO: HPC_201704_PRE
          // Se añade tilde a la palabra "Codigo"
          // MessageDlg('Codigo Modular No Existe...!', mtError, [mbOk], 0);
          MessageDlg('Código Modular No Existe...!', mtError, [mbOk], 0);
          // FIN: HPC_201704_PRE
          meAsocodmod.SetFocus;
        End;
    End;
  End;
  // dbdtpfecrec.SetFocus;
end;
// Fin: HPC_201709_PRE

procedure TFnuecardes.llena;
Var xSql:String;
begin
  If DM1.cdsAsociado.FieldByName('ASODNI').AsString = '' Then
  Begin
    xSql := 'SELECT TIPDOCABR FROM TGE159 WHERE TIPDOCCOD = '+QuotedStr(DM1.cdsAsociado.FieldByName('TIPDOCCOD').AsString);
    DM1.cdsQry.Close;
    DM1.cdsQry.DataRequest(xSql);
    DM1.cdsQry.Open;
    meAsoDocNum.Text :=  DM1.cdsQry.FieldByName('TIPDOCABR').AsString+'-'+DM1.cdsAsociado.FieldByName('ASODOCNUM').AsString;
  End
  Else
  Begin
    xSql := 'SELECT TIPDOCABR FROM TGE159 WHERE TIPDOCCOD = '+QuotedStr('10');
    DM1.cdsQry.Close;
    DM1.cdsQry.DataRequest(xSql);
    DM1.cdsQry.Open;
    meAsoDocNum.Text :=  DM1.cdsQry.FieldByName('TIPDOCABR').AsString+'-'+DM1.cdsAsociado.FieldByName('ASODNI').AsString;
  End;
  meAsoApeNomDni.Text := DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString;
  meAsocodmod.Text := DM1.cdsAsociado.FieldByName('ASOCODMOD').AsString;
    xSql := 'SELECT USENOM FROM APO101 WHERE USEID = '+QuotedStr(DM1.cdsAsociado.FieldByName('USEID').AsString)+' AND UPAGOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString)+' AND UPROID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  meUsenom.Text   := DM1.cdsQry.FieldByName('USENOM').AsString;
  meUseid.Text    := DM1.cdsAsociado.FieldByName('USEID').AsString;
  xSql := 'SELECT UPAGONOM FROM APO103 WHERE UPAGOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString)+' AND UPROID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  meUpagonom.Text := DM1.cdsQry.FieldByName('UPAGONOM').AsString;
  meUpagoid.Text  := DM1.cdsAsociado.FieldByName('UPAGOID').AsString;
  meUproid.Text   := DM1.cdsAsociado.FieldByName('UPROID').AsString;
  xSql := 'SELECT UPRONOM FROM APO102 WHERE UPROID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  meUpronom.Text  := DM1.cdsQry.FieldByName('UPRONOM').AsString;
end;

procedure TFnuecardes.limpia;
begin
  meAsocodmod.Text := '';
  meAsoDocNum.Text := ''; meAsoApeNomDni.Text := '';
  meUseid.Text     := ''; meUsenom.Text       := '';
  meUpagoid.Text   := ''; meUpagonom.Text     := '';
  meUproid.Text    := ''; meUpronom.Text      := '';
  // Inicio: HPC_201709_PRE
  // Se inicializan las nueva variables a usar.
  dblcdptoid.Text := '';
  medesdpto.Text := '';
  dblcdofid.Text := '';
  edtOficina.Text := '';
  // Fin: HPC_201709_PRE
end;

procedure TFnuecardes.sbBuscarClick(Sender: TObject);
begin
  // Inicio: HPC_201709_PRE
  // Se retira flag de control
  // DM1.xSgr := 'S';
  // Fin: HPC_201709_PRE
  limpia;
  Try
    FBusAso := TFBusAso.create(Self);
    FBusAso.ShowModal;
  Finally
    FBusAso.Free;
  End;
  If DM1.cdsAsociado.FieldByName('ASOTIPID').AsString <> 'DO' Then
  Begin
    llena;
    MessageDlg(' No es un asociado docente..! ', mtError, [mbOk], 0);
    limpia;
    Exit;
  End;
  If Length(Trim(DM1.cdsAsociado.FieldByName('ASOID').AsString)) > 0 Then
  Begin
    llena;
  End;
  // Inicio: HPC_201709_PRE
  // nuevo campo inicial departamento de origen en remplaz de la fecha
  // dbdtpfecrec.SetFocus;
  dblcdptoid.SetFocus;
  // Fin: HPC_201709_PRE
end;

Procedure TFnuecardes.btncerrarClick(Sender: TObject);
Begin
   // Inicio: HPC_201709_PRE
   // Se cierra el formulario
   // Fnuecardes.Close;
   Close;
   // Fin: HPC_201709_PRE
End;

Procedure TFnuecardes.btngrabarClick(Sender: TObject);
Var xSql, xnumdes, xAno:String;
Begin
   // Inicio: HPC_201709_PRE
   // Validan los campos antes de grabar la información
   If Trim(meAsocodmod.Text) = '' Then
   Begin
      MessageDlg('Debe registar el código modular del asociado.', mtError, [mbOk], 0);
      meAsocodmod.SetFocus;
      Exit;
   End;
   If Trim(dblcdptoid.Text) = '' Then
   Begin
      MessageDlg('Debe registar el departamento de origen de la carta de designatario.', mtError, [mbOk], 0);
      dblcdptoid.SetFocus;
      Exit;
   End;
   If Trim(dblcdofid.Text) = '' Then
   Begin
      MessageDlg('Debe registar la oficina de origen de la carta de designatario.', mtError, [mbOk], 0);
      dblcdofid.SetFocus;
      Exit;
   End;
   If Trim(dbdtpfecrec.Text) = '' Then
   Begin
      MessageDlg('Debe registar la fecha de recepción de la carta de designación.', mtError, [mbOk], 0);
      dbdtpfecrec.SetFocus;
      Exit;
   End;
   // Fin: HPC_201709_PRE

  If MessageDlg('¿ Seguro de ingresar la carta de designación ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
  Begin
    // Inicio: HPC_201609_PRE
    // Se añade al script de busqueda la condicion en el cual no debe tomar  tipo de estado = "13" (anulado)
    // xSql := 'SELECT COUNT(*) CUENTA FROM PVS302 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString);
    xSql := 'SELECT COUNT(1) CUENTA FROM PVS302 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND DSGESTAD NOT IN ''13''';
    // Fin: HPC_201609_PRE
    DM1.cdsQry.Close;
    DM1.cdsQry.DataRequest(xSql);
    DM1.cdsQry.Open;
    If DM1.cdsQry.FieldByName('CUENTA').AsInteger > 0 Then
    Begin
      If MessageDlg('El asociado cuenta con otras cartas registradas en el'+#13+'sistema. La actual carta anulara las anteriores'+#13+'¿ Seguro de continuar ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
      Begin
        Exit;
      End;
    End;
    xAno := Copy(DateToStr(date),7,4);
    xSql := 'SELECT LPAD(VARIOS+1,7,''0'') CORRE FROM CRE206 WHERE CREAREA = ''PRE'' AND CORREANO = '+QuotedStr(xAno)+' AND TIPO = ''D''';
    DM1.cdsQry.Close;
    DM1.cdsQry.DataRequest(xSql);
    DM1.cdsQry.Open;
    xnumdes := DM1.cdsQry.FieldByName('CORRE').AsString;
    //HPP_200903_PRE - JCARBONEL LO HABILITO EN EL PASE HPP_200903_PRE por error
    {xSql := 'UPDATE CRE206 '
           +'   SET VARIOS=(SELECT LPAD(VARIOS+1, 7,''0'') FROM CRE206 '
           +'                WHERE CREAREA = ''PRE'' AND CORREANO = '+QuotedStr(xAno)+' AND TIPO = ''D'')'
           +' WHERE CREAREA = ''PRE'' AND CORREANO = ''2005'' AND TIPO = ''D''';
    DM1.DCOM1.AppServer.EjecutaSQL(xSql);}

    // Anulando cartas anteriores
    // Inicio: HPC_201704_PRE
    // Se actualiza campo DSGESTAD con "13" (anulado)
    // xSql := 'UPDATE PVS302 SET ANULADO = ''S'' ,USUANU = '+QuotedStr(DM1.wUsuario)
    // +' ,FECANU = SYSDATE WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND USUANU IS NULL';
    xSql := 'UPDATE PVS302 SET ANULADO = ''S'' , DSGESTAD = ''13'', USUANU = '+QuotedStr(DM1.wUsuario)
    // Fin: HPC_201704_PRE
    +' ,FECANU = SYSDATE WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND USUANU IS NULL';
    DM1.DCOM1.AppServer.EjecutaSQL(xSql);
    // Inicio: HPC_201709_PRE
    // Se añade la grabación de los campos departamento y oficina de origen
    // xSql := 'INSERT INTO PVS302 (CIAID, DSGESTAD, DSGVIG, DSGNRO, DSGFREC,  ASOID, ASOAPENOMDNI, ASODNI, ASOCODMOD, DSGOBS, USUARIO, FREG, HREG)'
    xSql := 'INSERT INTO PVS302 (CIAID, DSGESTAD, DSGVIG, DSGNRO, DSGFREC,  ASOID, ASOAPENOMDNI, ASODNI, ASOCODMOD, DSGOBS, USUARIO, FREG, HREG, DEPORICARDES, OFIORICARDES)'
    +' VALUES (''02'',''01'',''N'','+QuotedStr(xnumdes)+','+QuotedStr(dbdtpfecrec.Text)+','+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)
    +','+QuotedStr(DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString)+','+QuotedStr(DM1.cdsAsociado.fieldByName('ASODNI').AsString)
    +','+QuotedStr(DM1.cdsAsociado.fieldByName('ASOCODMOD').AsString)+','+QuotedStr(meobs.Text)
    // +','+QuotedStr(DM1.wUsuario)+','+'TO_DATE(SYSDATE), SYSDATE )';
    +','+QuotedStr(DM1.wUsuario)+','+'TO_DATE(SYSDATE), SYSDATE,'+QuotedStr(dblcdptoid.Text)+','+QuotedStr(dblcdofid.Text)+')';
    DM1.DCOM1.AppServer.EjecutaSQL(xSql);
    xSql := 'UPDATE CRE206 SET VARIOS = LPAD(VARIOS+1,7,''0'') WHERE CREAREA = ''PRE'' AND CORREANO = '+QuotedStr(xAno)+' AND TIPO = ''D''';
    // Fin: HPC_201709_PRE
    DM1.DCOM1.AppServer.EjecutaSQL(xSql);
    MessageDlg('Grabación Ok !!!', mtWarning, [mbOk], 0);
    Fnuecardes.Close;
  End;
End;

// Inicio: HPC_201709_PRE
// Se actualizan los procedimientos para la validación del
// ingreso del departamento y oficina de origen 
procedure TFnuecardes.FormActivate(Sender: TObject);
Var xSql:String;
begin
   xSql := 'SELECT DPTOID, DPTODES FROM APO158 WHERE DPTOID IS NOT NULL ORDER BY DPTOID';
   DM1.cdsDpto.Close;
   DM1.cdsDpto.DataRequest(xSql);
   DM1.cdsDpto.Open;
   dblcdptoid.Selected.Clear;
   dblcdptoid.Selected.Add('DPTOID'#9'2'#9'Código'#9#9);
   dblcdptoid.Selected.Add('DPTODES'#9'25'#9'Decripción departamento'#9#9);
end;

procedure TFnuecardes.dblcdptoidExit(Sender: TObject);
Var xSql:String;
begin
   If dblcdptoid.Text = '' Then
   Begin
      medesdpto.Text := '';
      dblcdofid.Text := '';
      edtOficina.Text := '';
   End;
   If Length(dblcdptoid.Text) = 2 then
   Begin
      If DM1.cdsDpto.Locate('DPTOID', dblcdptoid.Text, []) Then
      Begin
         medesdpto.Text := DM1.cdsDpto.FieldByName('DPTODES').AsString;
         dblcdofid.Text := '';
         edtOficina.Text := '';
      End
      Else
      Begin
         MessageDlg('Código de departamento no valido', mtInformation, [mbOk], 0);
         dblcdptoid.Text := '';
         medesdpto.Text := '';
         dblcdofid.Text := '';
         edtOficina.Text := '';
         dblcdptoid.SetFocus;
         Exit;
      End;
   End;
   xSql := 'SELECT OFDESID, OFDESNOM FROM APO110 WHERE DPTOID = '+QuotedStr(dblcdptoid.Text);
   DM1.cdsOfDes.Close;
   DM1.cdsOfDes.DataRequest(xSql);
   DM1.cdsOfDes.Open;
   dblcdofid.Selected.Clear;
   dblcdofid.Selected.Add('OFDESID'#9'2'#9'Código oficina');
   dblcdofid.Selected.Add('OFDESNOM'#9'20'#9'Descripción oficina');
end;

procedure TFnuecardes.dblcdofidExit(Sender: TObject);
begin
  If dblcdofid.Text = '' Then
     edtOficina.Text := '';
  If Length(dblcdofid.Text) = 2 Then
  Begin
     If DM1.cdsOfDes.Locate('OFDESID', dblcdofid.Text, []) Then
     Begin
        edtOficina.Text := DM1.cdsOfDes.FieldByName('OFDESNOM').AsString;
     End
     Else
     Begin
      MessageDlg('Código de oficina no valido', mtInformation, [mbOk], 0);
      dblcdofid.Text := '';
      edtOficina.Text := '';
      dblcdofid.SetFocus;
     End;
  End;
end;
// Fin: HPC_201709_PRE

// Inicio: HPC_201709_PRE
// Se valida que la fecha de recepción no sea mayor al dia de hoy. 
procedure TFnuecardes.dbdtpfecrecExit(Sender: TObject);
begin
 If dbdtpfecrec.Date > DM1.FechaSys Then
 Begin
    MessageDlg('Debe registrar una fecha menor o igual a la fecha actual.', mtInformation, [mbOk], 0);
    dbdtpfecrec.SetFocus;
    Exit;
 End;
end;
// Fin: HPC_201709_PRE

end.
