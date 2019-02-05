// Inicio Uso Estándares: 01/08/2011
// Unidad : Previsión Social
// Formulario : TFDatFam
// Fecha de Creación : 08/08/2011
// Autor : Sistemas
// Objetivo : Datos Familiares
// Actualizaciones
// HPC_201302_PRE  : AÑADIR EN LA TABLA APO203 LOS CAMPOS DIRECCION DEL BENEFICIARIO,  CODIGO ZIP DE LA DIRECCION DEL BENEFICIARIO,
                  // TELEFONO FIJO DE REFERENCIA DEL BENEFICIARIO Y TELEFONO CELULAR DE REFERENCIA DEL BENEFICIARIO.
// SPP_201303_PRE  : Se realiza el pase a producción a partir del HPC_201302_PRE
// HPC_201304_PRE  : Se añade tipo de Relación Otros y Sobrinos
// SPP_201305_PRE  : Se realiza el pase a producción a partir del HPC_201304_PRE
// HPC_201402_PRE  : Se añade al mantenimiento de beneficiarios el apellido de casada.
// SPP_201403_PRE  : Se realiza el pase a producción a partir del pase HPC_201402_PRE.
// HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
// HPC_201703_PRE : Se añade campo EMAIL del familiar
// HPC_201802_PRE : Se adapta la forma de datos de cartas de designatarios para que funcione con la opción
//                  Formas de pago del designatario
// HPC_201809_PRE : Se acondiciona la opción de mantenimiento de beneficiario para que acepte
//                  captura de datos RENIEC 

unit PRE239;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, wwdbdatetimepicker, StdCtrls, Mask, ExtCtrls, Buttons, Grids,
  Wwdbigrd, Wwdbgrid;

type
  TFDatFam = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    sbBuscar: TSpeedButton;
    Label7: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    pnlasocodmod: TPanel;
    meAsocodmod: TMaskEdit;
    pnlAsoDocNum: TPanel;
    meAsoDocNum: TMaskEdit;
    pnlAsoApeNomDni: TPanel;
    meAsoApeNomDni: TMaskEdit;
    Panel3: TPanel;
    meUsenom: TMaskEdit;
    meUseid: TMaskEdit;
    Panel4: TPanel;
    meUpagonom: TMaskEdit;
    meUpagoid: TMaskEdit;
    Panel5: TPanel;
    meUpronom: TMaskEdit;
    meUproid: TMaskEdit;
    dbgfamiliares: TwwDBGrid;
    btncerrar: TBitBtn;
    dbgbInserta: TwwIButton;
    procedure btncerrarClick(Sender: TObject);
    procedure dbgbInsertaClick(Sender: TObject);
    procedure meAsocodmodChange(Sender: TObject);
    procedure meAsocodmodExit(Sender: TObject);
    procedure sbBuscarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure meAsoApeNomDniChange(Sender: TObject);
    procedure dbgfamiliaresDblClick(Sender: TObject);
    procedure meAsoDocNumChange(Sender: TObject);
  private
    procedure llena;
    procedure limpia;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDatFam: TFDatFam;

implementation

// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
uses PRE240, PREDM, PRE234, PRE235;
// Fin    HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios

{$R *.dfm}

procedure TFDatFam.btncerrarClick(Sender: TObject);
begin
  FDatFam.Close;
end;

Procedure TFDatFam.dbgbInsertaClick(Sender: TObject);
Begin
  // Inicio: HPC_201809_PRE
  // Flag que marca el mantenimiento de familiares
  DM1.xSgr := 'F';
  // Fin: HPC_201809_PRE

  DM1.xCnd := 'I';
  Try
    FManFami := TFManFami.create(Self);
    FManFami.ShowModal;
  Finally
    FManFami.Free;
  End;
  dbgfamiliares.Refresh;
End;

procedure TFDatFam.meAsocodmodChange(Sender: TObject);
begin
  If Length(Trim(meAsocodmod.Text)) = 0 Then
  Begin
    limpia;
    DM1.xSgr := 'N';
  End;
end;

procedure TFDatFam.meAsocodmodExit(Sender: TObject);
Var xSql:String;
begin
  If DM1.xFlg = 'M' Then
  Begin
    If DM1.xSgr = 'N' Then
    Begin
      If Length(Trim(meAsocodmod.Text))=0 Then
      Else
      Begin
        If Length(Trim(meAsocodmod.Text))>10 Then
        Begin
          MessageDlg('Codigo Modular No Puede Tener Mas De 10 Caracteres...!', mtError, [mbOk], 0);
          meAsocodmod.Text:='';
          meAsocodmod.SetFocus;
          Exit;
        End;
        meAsocodmod.Text:=Format('%.10d',[StrToInt(meAsocodmod.Text)]);
        DM1.cdsAsociado.Close;
        xSql := 'SELECT A.*, B.USENOM, C.ASOTIPDES FROM APO201 A, APO101 B, APO107 C WHERE ASOCODMOD LIKE '+QuotedStr(meAsocodmod.Text+'%')
        +' AND A.USEID = B.USEID(+) AND A.UPAGOID = B.UPAGOID(+) AND A.UPROID = B.UPROID(+)'
        +' AND A.ASOTIPID = C.ASOTIPID';
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
        Begin
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
            MessageDlg('Codigo Modular No Existe...!', mtError, [mbOk], 0);
            meAsocodmod.SetFocus;
          End;
        End;
      End;
    End;
  End;
End;

procedure TFDatFam.sbBuscarClick(Sender: TObject);
Var xSql:String;
begin
  DM1.xSgr := 'S';
  limpia;
  Try
    FBusAso := TFBusAso.create(Self);
    FBusAso.ShowModal;
  Finally
    FBusAso.Free;
  End;
  If Length(Trim(DM1.cdsAsociado.FieldByName('ASOID').AsString)) > 0 Then llena;
  xSql := 'SELECT * FROM PVS306 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND PVSESTLIQ IN (''02'', ''05'', ''06'')';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  If DM1.cdsQry.RecordCount > 0 Then dbgbInserta.Enabled := False Else dbgbInserta.Enabled := True;
end;

procedure TFDatFam.llena;
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
  //Inicio: SPP_201303_PRE
  // xSql := 'SELECT A.ASOID, A.FAMAPEPAT, A.FAMAPEMAT, A.FAMNOMBRE, B.PARENDES, A.FAMFECNAC, A.FAMSEXO, A.TIPDOCCOD, A.FAMRELID,'
  // +' A.FAMNUMDOC, A.APEPATTUT, A.APEMATTUT, A.NOMTUT, A.TUTTIPDOC, A.TUTNUMDOC, A.FORPAGOID, A.BANCOID, A.AGENBCOID, A.ROWID FROM APO203 A, TGE149 B'
  // +' WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND A.FAMRELID = B.PARENID(+)';
  xSql := 'SELECT A.ASOID, A.FAMAPEPAT, A.FAMAPEMAT, A.FAMNOMBRE, B.PARENDES, A.FAMFECNAC, A.FAMSEXO, A.TIPDOCCOD, A.FAMRELID, A.FAMDIRECC, A.DISTID, A.FAMTELF, A.FAMTELMOV,'
   // Inicio: HPC_201809_PRE
   // Se añade el campo emailfam 
   // +' A.FAMNUMDOC, A.APEPATTUT, A.APEMATTUT, A.NOMTUT, A.TUTTIPDOC, A.TUTNUMDOC, A.FORPAGOID, A.BANCOID, A.AGENBCOID, A.ROWID FROM APO203 A, TGE149 B'
   +' A.FAMNUMDOC, A.APEPATTUT, A.APEMATTUT, A.NOMTUT, A.TUTTIPDOC, A.TUTNUMDOC, A.FORPAGOID, A.BANCOID, A.AGENBCOID, A.EMAILFAM, A.ROWID FROM APO203 A, TGE149 B'
   // Fin: HPC_201809_PRE
  +' WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND A.FAMRELID = B.PARENID(+)';
  //Fin: SPP_201303_PRE
  DM1.cdsDFam.Close;
  DM1.cdsDFam.DataRequest(xSql);
  DM1.cdsDFam.Open;
  //Inicio: SPP_201303_PRE
  // dbgfamiliares.Selected.Clear;
  // dbgfamiliares.Selected.Add('FAMAPEPAT'#9'25'#9'Apellido paterno'#9#9);
  // dbgfamiliares.Selected.Add('FAMAPEMAT'#9'25'#9'Apellido materno'#9#9);
  // dbgfamiliares.Selected.Add('FAMNOMBRE'#9'25'#9'Nombre del beneficiario'#9#9);
  // dbgfamiliares.Selected.Add('FAMNUMDOC'#9'10'#9'Documento~de identidad'#9#9);
  // dbgfamiliares.Selected.Add('PARENDES'#9'15'#9'Relación del~beneficiario'#9#9);
  // dbgfamiliares.Selected.Add('FAMFECNAC'#9'10'#9'Fecha de~nacimiento'#9#9);
  // dbgfamiliares.Selected.Add('FAMSEXO'#9'1'#9'Sexo'#9#9);
  // dbgfamiliares.Selected.Add('APEPATTUT'#9'25'#9'Apellido paterno~del tutor'#9#9);
  // dbgfamiliares.Selected.Add('APEMATTUT'#9'25'#9'Apellido materno~del tutor'#9#9);
  // dbgfamiliares.Selected.Add('NOMTUT'#9'25'#9'Nombre del tutor'#9#9);
  // dbgfamiliares.Selected.Add('TUTNUMDOC'#9'10'#9'Documento de~identidad del tutor'#9#9);
  // bgfamiliares.ApplySelected;
  //Fin: SPP_201303_PRE
end;

procedure TFDatFam.limpia;
begin
  meAsocodmod.Text := '';
  meAsoDocNum.Text := ''; meAsoApeNomDni.Text := '';
  meUseid.Text     := ''; meUsenom.Text       := '';
  meUpagoid.Text   := ''; meUpagonom.Text     := '';
  meUproid.Text    := ''; meUpronom.Text      := '';
  DM1.cdsDFam.Close;
end;

Procedure TFDatFam.FormActivate(Sender: TObject);
Var xSql:String;
Begin
  If DM1.cdsDFam.Active Then DM1.cdsDFam.EmptyDataSet;
  // Inicio: HPC_201802_PRE 
  // Se valida que tambien deje añadir duedos y es por origen de solicitud por oficio
  If (DM1.xFlg = 'E') Or (DM1.xprodes = 'S') Then
  // Fin: HPC_201802_PRE
  Begin
    meAsocodmod.Text := DM1.cdsAsociado.FieldByName('ASOCODMOD').AsString;
    meAsoDocNum.Text := DM1.cdsAsociado.FieldByName('ASODNI').AsString;
    meAsoApeNomDni.Text := DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString;
    meUseid.Text := DM1.cdsAsociado.FieldByName('USEID').AsString;
    xSql := 'SELECT USENOM FROM APO101 WHERE USEID = '+QuotedStr(DM1.cdsAsociado.FieldByName('USEID').AsString)+' AND UPAGOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString)+' AND UPROID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
    DM1.cdsQry.Close;
    DM1.cdsQry.DataRequest(xSql);
    DM1.cdsQry.Open;
    meUsenom.Text   := DM1.cdsQry.FieldByName('USENOM').AsString;
    meUpagoid.Text := DM1.cdsAsociado.FieldByName('UPAGOID').AsString;
    xSql := 'SELECT UPAGONOM FROM APO103 WHERE UPAGOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString)+' AND UPROID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
    DM1.cdsQry.Close;
    DM1.cdsQry.DataRequest(xSql);
    DM1.cdsQry.Open;
    meUpagonom.Text := DM1.cdsQry.FieldByName('UPAGONOM').AsString;
    meUproid.Text := DM1.cdsAsociado.FieldByName('UPROID').AsString;
    xSql := 'SELECT UPRONOM FROM APO102 WHERE UPROID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
    DM1.cdsQry.Close;
    DM1.cdsQry.DataRequest(xSql);
    DM1.cdsQry.Open;
    meUpronom.Text          := DM1.cdsQry.FieldByName('UPRONOM').AsString;
    sbBuscar.Enabled        := False;
    pnlasocodmod.Enabled    := False;
    pnlAsoDocNum.Enabled    := False;
    pnlAsoApeNomDni.Enabled := False;
    dbgbInserta.Enabled     := True;
    xSql := 'SELECT A.FAMAPENOM, A.FAMAPEPAT, A.FAMAPEMAT, A.FAMNOMBRE, A.FAMNUMDOC, B.PARENDES, A.FAMOTRTIPREL, A.FAMFECNAC,  A.FAMPORC, A.BANCOID,'
    +' A.FORPAGOID, A.FAMRELID, A.TUTAPENOM, A.APEPATTUT, A.APEMATTUT, A.NOMTUT, A.TUTNUMDOC, A.FAMSEXO, A.AGENBCOID, A.ASOID,'
    // Inicio: HPC_201809_PRE
    // Se añade campo menor de edad
    // +' A.FAMDIRECC, A.DISTID, A.FAMTELF, A.FAMTELMOV, A.FAMAPECAS, A.EMAILFAM, A.ROWID FILA FROM APO203 A, TGE149 B'
    +' A.FAMDIRECC, A.DISTID, A.FAMTELF, A.FAMTELMOV, A.FAMAPECAS, A.EMAILFAM, A.ROWID FILA, A.MENEDAD FROM APO203 A, TGE149 B'
    // Fin: HPC_201809_PRE
    +' WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND A.FAMRELID = B.PARENID(+)';
    DM1.cdsDFam.Close;
    DM1.cdsDFam.DataRequest(xSql);
    DM1.cdsDFam.Open;
    dbgfamiliares.Selected.Add('FAMAPENOM'#9'45'#9'Apellidos y Nombre(s)~del beneficiario'#9#9);
    dbgfamiliares.Selected.Add('FAMNUMDOC'#9'10'#9'DNI. del~Beneficiario'#9#9);
    dbgfamiliares.Selected.Add('FAMDIRECC'#9'120'#9'Dirección del~Beneficiario'#9#9);
    dbgfamiliares.Selected.Add('DISTID'#9'10'#9'Código ZIP del~Beneficiario'#9#9);
    dbgfamiliares.Selected.Add('FAMTELF'#9'10'#9'Telefono fijo~del beneficiario'#9#9);
    dbgfamiliares.Selected.Add('FAMTELMOV'#9'10'#9'Telefono movil~del beneficiario'#9#9);
    dbgfamiliares.Selected.Add('EMAILFAM'#9'45'#9'Email~del familiar'#9#9);
    dbgfamiliares.Selected.Add('FAMFECNAC'#9'10'#9'Fecha de~Nacimiento'#9#9);
    dbgfamiliares.Selected.Add('PARENDES'#9'15'#9'Parentesco con~el asociado'#9#9);
    dbgfamiliares.Selected.Add('FAMOTRTIPREL'#9'15'#9'Tipo de~relación'#9#9);
    dbgfamiliares.Selected.Add('FAMPORC'#9'10'#9'Porcentaje~Asignado'#9#9);
    dbgfamiliares.Selected.Add('BANCOID'#9'10'#9'Identificación~del Banco'#9#9);
    dbgfamiliares.Selected.Add('FORPAGOID'#9'10'#9'Forma~de Pago'#9#9);
    dbgfamiliares.Selected.Add('TUTAPENOM'#9'45'#9'Apellidos y Nombre(s)~del Tutor'#9#9);
    dbgfamiliares.Selected.Add('TUTNUMDOC'#9'10'#9'DNI del~Tutor'#9#9);
    dbgfamiliares.ApplySelected;
    If (DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString = '02') Or (DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString = '06') Then
    Begin
     // Valida que no ingrese si al asociado no cuenta por liquidacion por oficio
     If DM1.xprodes <> 'S' Then
     Begin
        If FModExpben.sModExpR='S' then
         begin
            dbgbInserta.Enabled := True;
            sbBuscar.Enabled := False;
         end
         else
         begin
            sbBuscar.Enabled := False;
            dbgbInserta.Enabled := False;
         end;
     End;
    End;
  End;

End;

procedure TFDatFam.meAsoApeNomDniChange(Sender: TObject);
begin
 If Trim(meAsoApeNomDni.Text) = '' Then dbgbInserta.Enabled := False Else dbgbInserta.Enabled := True;
end;

Procedure TFDatFam.dbgfamiliaresDblClick(Sender: TObject);
Var xSql:String;
Begin
  xSql := 'SELECT * FROM APO203 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString);
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  If DM1.cdsQry.RecordCount = 0 Then
  Begin
    MessageDlg('No existe registro para modificar', mtError, [mbOk], 0);
    Exit;
  End;
  If (DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString <> '02') And (DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString <> '06') Then
  Begin
    DM1.xCnd := 'M';
    // Inicio: HPC_201809_PRE
    // Flag que marca el mantenimiento de familiares
    DM1.xSgr := 'F';
    // Fin: HPC_201809_PRE
    Try
      FManFami := TFManFami.create(Self);
      FManFami.ShowModal;
    Finally
      FManFami.Free;
    End;
    xSql := 'SELECT A.FAMAPENOM, A.FAMAPEPAT, A.FAMAPEMAT, A.FAMNOMBRE, A.FAMNUMDOC, B.PARENDES, A.FAMOTRTIPREL, A.FAMFECNAC,  A.FAMPORC, A.BANCOID, A.FAMDIRECC, A.DISTID, A.FAMTELF, A.FAMTELMOV,'
    // Inicio: HPC_201809_PRE
    // Se añade campo menor de edad
    //+' A.FORPAGOID, A.FAMRELID, A.TUTAPENOM, A.APEPATTUT, A.APEMATTUT, A.NOMTUT, A.TUTNUMDOC, A.FAMSEXO, A.AGENBCOID, A.ASOID, A.FAMAPECAS, A.EMAILFAM, A.ROWID FILA FROM APO203 A, TGE149 B'
    +' A.FORPAGOID, A.FAMRELID, A.TUTAPENOM, A.APEPATTUT, A.APEMATTUT, A.NOMTUT, A.TUTNUMDOC, A.FAMSEXO, A.AGENBCOID, A.ASOID, A.FAMAPECAS, A.EMAILFAM, A.ROWID FILA, A.MENEDAD FROM APO203 A, TGE149 B'
    // Fin: HPC_201809_PRE
    +' WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND A.FAMRELID = B.PARENID(+)';
    DM1.cdsDFam.Close;
    DM1.cdsDFam.DataRequest(xSql);
    DM1.cdsDFam.Open;
    dbgfamiliares.Refresh;
  End
  else
    if FModExpben.sModExpR='S' then
    begin
        DM1.xCnd := 'M';
        Try
          FManFami := TFManFami.create(Self);
          FManFami.ShowModal;
        Finally
          FManFami.Free;
        End;
        xSql := 'SELECT A.FAMAPENOM, A.FAMAPEPAT, A.FAMAPEMAT, A.FAMNOMBRE, A.FAMNUMDOC, B.PARENDES, A.FAMOTRTIPREL, A.FAMFECNAC,  A.FAMPORC, A.BANCOID, A.FAMDIRECC, A.DISTID, A.FAMTELF, A.FAMTELMOV,'
        // Inicio: HPC_201809_PRE   
        // Se añade campo menor de edad
        // +' A.FORPAGOID, A.FAMRELID, A.TUTAPENOM, A.APEPATTUT, A.APEMATTUT, A.NOMTUT, A.TUTNUMDOC, A.FAMSEXO, A.AGENBCOID, A.ASOID, A.FAMAPECAS, A.ROWID FILA, A.MENEDAD FROM APO203 A, TGE149 B'
        +' A.FORPAGOID, A.FAMRELID, A.TUTAPENOM, A.APEPATTUT, A.APEMATTUT, A.NOMTUT, A.TUTNUMDOC, A.FAMSEXO, A.AGENBCOID, A.ASOID, A.FAMAPECAS, A.ROWID FILA, A.MENEDAD, A.EMAILFAM FROM APO203 A, TGE149 B'
        // Fin: HPC_201809_PRE   
        +' WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND A.FAMRELID = B.PARENID(+)';
        DM1.cdsDFam.Close;
        DM1.cdsDFam.DataRequest(xSql);
        DM1.cdsDFam.Open;
        dbgfamiliares.Refresh;
    end;
End;

procedure TFDatFam.meAsoDocNumChange(Sender: TObject);
begin
  If meAsoDocNum.Text <> '' Then dbgbInserta.Enabled := True;
end;

end.
