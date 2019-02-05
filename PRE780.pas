unit PRE780;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Wwdbdlg, Mask, wwdbedit, wwdbdatetimepicker, wwdblook,
  fcButton, fcImgBtn, fcShapeBtn, ExtCtrls, Buttons, Wwdbigrd, Grids,
  Wwdbgrid, fcLabel, db;

type
  TFDatosBenef = class(TForm)
    lblTitulo: TfcLabel;
    lblCodigo: TfcLabel;
    dbgDatosFam: TwwDBGrid;
    btnDFam: TwwIButton;
    pnlFamiliares: TPanel;
    stFam: TStaticText;
    pnlFam: TPanel;
    sbtnDFAceptar: TfcShapeBtn;
    sbtnDFCancelar: TfcShapeBtn;
    dblcDFTRel: TwwDBLookupCombo;
    dbdtpDFFecNac: TwwDBDateTimePicker;
    dblcDFEstCiv: TwwDBLookupCombo;
    dbeDFTelf: TwwDBEdit;
    dbeDFDir: TwwDBEdit;
    dbeDFApePat: TwwDBEdit;
    dbeDFApeMat: TwwDBEdit;
    dbeDFNombres: TwwDBEdit;
    dblcDFTDoc: TwwDBLookupCombo;
    dbeDFNum: TwwDBEdit;
    dbeDFApeNom: TwwDBEdit;
    dblcSexo: TwwDBLookupCombo;
    dbeDFTRel: TwwDBEdit;
    dbeDFEstCiv: TwwDBEdit;
    dbeDFDoc: TwwDBEdit;
    dbeSexo: TwwDBEdit;
    dbePorc: TwwDBEdit;
    chkLiquid: TCheckBox;
    GroupBox1: TGroupBox;
    Label15: TLabel;
    dblcBanco: TwwDBLookupCombo;
    dbeBanco: TwwDBEdit;
    Label24: TLabel;
    dblcFPago: TwwDBLookupCombo;
    dbeFPago: TwwDBEdit;
    gbDatosTutor: TGroupBox;
    dbeApeNomT: TwwDBEdit;
    dblcTipDocT: TwwDBLookupCombo;
    dbeDescTipDocT: TwwDBEdit;
    dbeNumDocT: TwwDBEdit;
    dblcdLugGiro: TwwDBLookupComboDlg;
    Label13: TLabel;
    dbeLugGiro: TwwDBEdit;
    dblcdDptoBco: TwwDBLookupComboDlg;
    Label4: TLabel;
    dbeDptoBco: TwwDBEdit;
    dblcdDepto: TwwDBLookupComboDlg;
    lblDepartamento: TLabel;
    dbeDepto: TwwDBEdit;
    dblcdCiudad: TwwDBLookupComboDlg;
    lblProvincia: TLabel;
    dbeProvincia: TwwDBEdit;
    lblDistrito: TLabel;
    dblcdDistrito: TwwDBLookupComboDlg;
    dbeDistrito: TwwDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnDFCancelarClick(Sender: TObject);
    procedure sbtnDFAceptarClick(Sender: TObject);
    procedure dbgDatosFamDblClick(Sender: TObject);
    procedure dblcDFTRelExit(Sender: TObject);
    procedure dblcDFEstCivExit(Sender: TObject);
    procedure dblcDFTDocExit(Sender: TObject);
    procedure dblcSexoExit(Sender: TObject);
    procedure dbePorcExit(Sender: TObject);
    procedure dblcBancoExit(Sender: TObject);
    procedure dblcDFTRelKeyPress(Sender: TObject; var Key: Char);
    procedure dblcSexoKeyPress(Sender: TObject; var Key: Char);
    procedure dbePorcKeyPress(Sender: TObject; var Key: Char);
    procedure dblcBancoNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure btnDFamClick(Sender: TObject);
    procedure dbeDFNombresExit(Sender: TObject);
    procedure sbtnDFNuevoClick(Sender: TObject);
    procedure dbdtpDFFecNacExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dblcFPagoExit(Sender: TObject);
    procedure dblcFPagoNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
    procedure dblcTipDocTExit(Sender: TObject);
    procedure dbgDatosFamKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dblcdLugGiroExit(Sender: TObject);
    procedure dblcdDptoBcoExit(Sender: TObject);
    procedure dblcdDptoBcoDropDown(Sender: TObject);
    procedure dblcdDeptoExit(Sender: TObject);
    procedure dblcdDeptoChange(Sender: TObject);
    procedure dblcdDeptoDropDown(Sender: TObject);
    procedure dblcdDeptoKeyPress(Sender: TObject; var Key: Char);
    procedure dblcdCiudadExit(Sender: TObject);
    procedure dblcdCiudadChange(Sender: TObject);
    procedure dblcdCiudadDropDown(Sender: TObject);
    procedure dblcdCiudadKeyPress(Sender: TObject; var Key: Char);
    procedure dblcdDistritoExit(Sender: TObject);
    procedure dblcdDistritoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function ValidaDatosCEdu : Boolean;
    procedure LimpiaEditsDF;
  public
    { Public declarations }
  end;

var
  FDatosBenef: TFDatosBenef;
  xPorcen : Integer;
  Ano, Mes, Dia : Integer;

implementation

uses MsgDlgs,  PREDM; //PRE203,

{$R *.DFM}

Procedure TFDatosBenef.FormActivate(Sender: TObject);
Var
  xSQL : String;
Begin
  If DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString = '02' Then btnDFam.Enabled := False;
  xSql := 'SELECT * FROM TGE125';
  DM1.cdsEstCivil.Close;
  DM1.cdsEstCivil.DataRequest(xSql);
  DM1.cdsEstCivil.Open;

  xSql := 'SELECT * FROM TGE159';
  DM1.cdsTDoc.Close;
  DM1.cdsTDoc.DataRequest(xSql);
  DM1.cdsTDoc.Open;

  xSql := 'SELECT ''F'' SEXO, ''Femenino'' DESCRIP FROM TGE901 UNION'
  +' SELECT ''M'' SEXO, ''Masculino'' DESCRIP FROM TGE901';
  DM1.cdsSexo.Close;
  DM1.cdsSexo.DataRequest(xSQL);
  DM1.cdsSexo.Open;

  xSql := 'SELECT * FROM TGE105';
  DM1.cdsBanco.Close;
  DM1.cdsBanco.DataRequest(xSql);
  DM1.cdsBanco.Open;

  xSql := 'SELECT * FROM APO158';
  DM1.cdsDpto1.Close;
  DM1.cdsDpto1.DataRequest(xSql);
  DM1.cdsDpto1.Open;

  Screen.Cursor := crHourGlass;
  lblTitulo.Caption := 'Asociado : '+DM1.cdsExpLiq.FieldByName('ASOAPENOMDNI').AsString;
  lblCodigo.Caption := 'Código Modular : '+DM1.cdsExpLiq.FieldByName('ASOCODMOD').AsString;
  DM1.cdsTRelacion.Open;
  DM1.cdsTipoMoneda.Open;
  DM1.cdsDpto3.Open;
  DM1.cdsProvincia3.Open;
  DM1.cdsDist3.Open;
  xSQL := 'SELECT * FROM CRE104 WHERE TIPDEV = ''S'' ';
  DM1.cdsTipDesemb.Filter   := '';
  DM1.cdsTipDesemb.Filtered := False;
  DM1.cdsTipDesemb.IndexFieldNames := '';
  DM1.cdsTipDesemb.Close;
  DM1.cdsTipDesemb.DataRequest(xSQL);
  DM1.cdsTipDesemb.Open;
  DM1.cdsTipDesemb.IndexFieldNames := 'TIPDESEID';
  xSQL := 'SELECT ASOID, FAMAPEPAT, FAMAPEMAT, FAMNOMBRE, FAMAPENOM, FAMRELID,'
  +' FAMDIRECC, DPTOID, CIUDID, ZIPID, FAMPORC, FAMFLLQ, FAMTELF, FAMSEXO, TIPDOCCOD,'
  +' FAMNUMDOC, ESTCIVID, FAMFECNAC, TUTAPENOM, TUTTIPDOC, TUTNUMDOC, HREG, FREG, USUARIO,'
  +' BANCOID, TMONID, CCBCOID, FECAPERT, FORPAGOID, BCODPTOID FROM APO203'
  +' WHERE ASOID ='+QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString);
  DM1.cdsDFam.Filter   := '';
  DM1.cdsDFam.Filtered := False;
  DM1.cdsDFam.IndexFieldNames := '';
  DM1.cdsDFam.Close;
  DM1.cdsDFam.DataRequest(xSQL);
  DM1.cdsDFam.Open;
  DM1.cdsDFam.IndexFieldNames := 'FAMRELID';
  dbgDatosFam.Selected.Clear;
  dbgDatosFam.Selected.Add('FAMAPEPAT'#9'20'#9'Apellido Paterno'#9'T');
  dbgDatosFam.Selected.Add('FAMAPEMAT'#9'20'#9'Apellido Materno'#9'T');
  dbgDatosFam.Selected.Add('FAMNOMBRE'#9'20'#9'Nombres'#9'T');
  dbgDatosFam.Selected.Add('FAMDIRECC'#9'30'#9'Dirección'#9'T');
  dbgDatosFam.Selected.Add('FAMTELF'#9'10'#9'Teléfono'#9'T');
  dbgDatosFam.Selected.Add('FAMSEXO'#9'5'#9'Sexo'#9'T');
  dbgDatosFam.Selected.Add('FAMNUMDOC'#9'10'#9'Número~Documento'#9'T');
  dbgDatosFam.Selected.Add('FAMFECNAC'#9'12'#9'Fecha~Nacimiento'#9'T');
  dbgDatosFam.ApplySelected;
  DM1.cdsDFam.First;
  If dblcSexo.Text = 'M' Then dbeSexo.Text := 'MASCULINO';
  If dblcSexo.Text = 'F' Then dbeSexo.Text := 'FEMENINO';
  Screen.Cursor := crDefault;
End;

Procedure TFDatosBenef.FormClose(Sender: TObject;
Var Action: TCloseAction);
Begin
  DM1.cdsDFam.Filter                := '';
  DM1.cdsDFam.Filtered              := False;
  DM1.cdsDFam.IndexFieldNames       := '';
  DM1.cdsDFam.Close;
  DM1.cdsTRelacion.Filter           := '';
  DM1.cdsTRelacion.Filtered         := False;
  DM1.cdsTRelacion.IndexFieldNames  := '';
  DM1.cdsTRelacion.Open;
  DM1.cdsTipoMoneda.Filter          := '';
  DM1.cdsTipoMoneda.Filtered        := False;
  DM1.cdsTipoMoneda.IndexFieldNames := '';
  DM1.cdsTipoMoneda.Open;
  DM1.cdsDpto3.Filter               := '';
  DM1.cdsDpto3.Filtered             := False;
  DM1.cdsDpto3.IndexFieldNames      := '';
  DM1.cdsDpto3.Close;
  DM1.cdsProvincia3.Filter          := '';
  DM1.cdsProvincia3.Filtered        := False;
  DM1.cdsProvincia3.IndexFieldNames := '';
  DM1.cdsProvincia3.Close;
  DM1.cdsDist3.Filter               := '';
  DM1.cdsDist3.Filtered             := False;
  DM1.cdsDist3.IndexFieldNames      := '';
  DM1.cdsDist3.Close;
End;

Function TFDatosBenef.ValidaDatosCEdu : Boolean;
Var Present: TDateTime;
    Year, Month, Day: Word;
Begin
  Result := False;
  If Length(dbeDFTRel.Text) = 0 Then
  Begin
    Beep;
    MessageDlg('Seleccione el Tipo de Relación', mtInformation, [mbOk], 0);
    dblcDFTRel.SetFocus;
    Exit;
  End;
  If length(dbeDFNombres.Text) = 0 Then
  Begin
    Beep;
    MessageDlg('Registre los Nombres', mtInformation, [mbOk], 0);
    dbeDFNombres.SetFocus;
    Exit;
  End;
  If (Length(dbeDFApePat.Text) = 0) And (Length(dbeDFApeMat.Text) = 0) Then
  Begin
    Beep;
    MessageDlg('Debe Ingresar el Apellido Paterno o el Apellido Materno', mtInformation, [mbOk], 0);
    dbeDFApePat.SetFocus;
    Exit;
  End;
  If dblcDFTRel.Text = '02' Then
  Begin
    If Length(dbdtpDFFecNac.Text) = 0 Then
    Begin
      Beep;
      MessageDlg('Ingrese la Fecha de Nacimiento', mtInformation, [mbOk], 0);
      dbdtpDFFecNac.SetFocus;
      Exit;
    End;
  End;
  If Not (Length(dbdtpDFFecNac.Text) = 0) Then
  Begin
    Present := Date;
    DecodeDate(Present, Year, Month, Day);
    If dbdtpDFFecNac.DateTime >= Present Then
    Begin
      Beep;
      MessageDlg('La Fecha de Nacimiento debe ser Menor a la Fecha Actual', mtInformation, [mbOk], 0);
      dbdtpDFFecNac.SetFocus;
      Exit;
    End;
  End;
  If (Ano > 0) And (Ano < 18) Then
  Begin
    If Length(Trim(dbeApeNomT.Text)) = 0 Then
    Begin
      Beep;
      MessageDlg('Ingrese el Nombre del Tutor', mtInformation, [mbOk], 0);
      dbeApeNomT.SetFocus;
      Exit;
    End;
    If Length(Trim(dblcTipDocT.Text)) = 0 Then
    Begin
      Beep;
      MessageDlg('Ingrese el Tipo de Documento del Tutor', mtInformation, [mbOk], 0);
      dblcTipDocT.SetFocus;
      Exit;
    End;
    If Length(Trim(dbeNumDocT.Text)) = 0 Then
    Begin
      Beep;
      MessageDlg('Ingrese el Número del Documento', mtInformation, [mbOk], 0);
      dbeNumDocT.SetFocus;
      Exit;
    End;
  End
  Else
  Begin
    If dblcDFTRel.Text <> '02' Then
    Begin
      If Length(Trim(dblcDFTDoc.Text)) = 0 Then
      Begin
        Beep;
        MessageDlg('Ingrese el Tipo de Documento', mtInformation, [mbOk], 0);
        dblcDFTDoc.SetFocus;
        Exit;
      End;
    End;
  End;
  If (dblcDFTRel.Text <> '02') And (dblcDFTRel.Text <> '01') Then
  Begin
    If length(dbeDFEstCiv.Text) = 0 Then
    Begin
      Beep;
      MessageDlg('Seleccione el Estado Civil', mtInformation, [mbOk], 0);
      dblcDFEstCiv.SetFocus;
      Exit;
    End;
  End;
  If Length(dblcSexo.Text) = 0 Then
  Begin
     Beep;
     MessageDlg('Ingrese el Sexo', mtInformation, [mbOk], 0);
     dblcSexo.SetFocus;
     Exit;
  End;
  If Length(dblcFPago.Text) = 0 Then
  Begin
    Beep;
    MessageDlg('Ingrese la Forma de Pago', mtInformation, [mbOk], 0);
    dblcFPago.SetFocus;
    Exit;
  End;
  If length(DM1.cdsDFam.FieldByName('BANCOID').AsString) = 0 Then
  Begin
    Beep;
    MessageDlg('Ingrese el Banco', mtInformation, [mbOk], 0);
    dblcBanco.SetFocus;
    Exit;
  End;
  {If Not chkLiquid.Checked Then
  Begin
    If MessageDlg('Desea que el Beneficiario participe en la Liquidación?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
    Begin
      Beep;
      chkLiquid.Checked := True;
    End;
  End;
  }
  chkLiquid.Checked := True;
  Result := True;
End;

Procedure TFDatosBenef.LimpiaEditsDF;
Begin
  dbeDFTRel.Clear;
  dbeSexo.Clear;
  dbeDFEstCiv.Clear;
  dbeDFDoc.Clear;
  dbeBanco.Clear;
  dbeFPago.Clear;
  dbeDptoBco.Clear;
  chkLiquid.Checked := False;
  dbeApeNomT.Clear;
  dbeDescTipDocT.Clear;
  dbeNumDocT.Clear;
  dblcDFEstCiv.Enabled := True;
  dblcDFTDoc.Enabled   := True;
  dbeDFNum.Enabled     := True;
  dbeLugGiro.Clear;
End;

Procedure TFDatosBenef.sbtnDFCancelarClick(Sender: TObject);
Begin
  DM1.wModo := '';
  DM1.cdsDFam.CancelUpdates;
  pnlFamiliares.Visible := False;
End;

Procedure TFDatosBenef.sbtnDFAceptarClick(Sender: TObject);
Begin
  Screen.Cursor := crHourGlass;
  DM1.cdsDFam.Edit;
  If (DM1.wModo = 'A') or (DM1.wModo = 'M') Then
  Begin
    If Not ValidaDatosCEdu Then
    Begin
      Screen.Cursor := crDefault;
      Exit;
    End;

    If chkLiquid.Checked Then DM1.cdsDFam.FieldByName('FAMFLLQ').AsString := 'S' Else DM1.cdsDFam.FieldByName('FAMFLLQ').AsString := 'N';
    DM1.cdsDFam.FieldByName('ASOID').AsString    := DM1.cdsExpLiq.FieldByName('ASOID').AsString;
    DM1.cdsDFam.FieldByName('USUARIO').AsString  := DM1.wUsuario;
    DM1.cdsDFam.FieldByName('FREG').AsDateTime   := Date;
    DM1.cdsDFam.FieldByName('HREG').AsDateTime   := Date+SysUtils.Time;;

    DM1.AplicaDatos(DM1.cdsDFam, 'DFAM');
    DM1.RepartePorcentaje(DM1.cdsExpLiq.FieldByName('ASOID').AsString);
    FormActivate(Sender);
    Beep;
    MessageDlg('Registro Grabado', mtCustom, [mbOk], 0);
  End;
  Screen.Cursor := crDefault;
End;

Procedure TFDatosBenef.dbgDatosFamDblClick(Sender: TObject);
Var
   xWhere : String;
Begin
  If DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString = '02' Then
  Begin
    MessageDlg('Expediente ya fue liquidado no puede modificar información de los designatarios', mtInformation, [mbOk], 0);
    Exit;
  End;
  If DM1.cdsDFam.RecordCount = 0 Then
  Begin
    MessageDlg('Error. No Existen Registros a Editar', mtInformation, [mbOk], 0);
    Exit;
  End;
  DM1.wModo := 'M';
  xPorcen := DM1.cdsDFam.FieldByName('FAMPORC').AsInteger;
  dblcdDeptoExit(Sender);
  dblcdCiudadExit(Sender);
  dblcdDistritoExit(Sender);
  dblcFPagoExit(Sender);
  dblcBancoExit(Sender);
  dblcdDptoBcoExit(Sender);
  dblcdLugGiroExit(Sender);
  dblcDFTRelExit(Sender);
  dbdtpDFFecNacExit(Sender);
  If DM1.cdsDFam.FieldByName('FAMFLLQ').AsString = 'S' Then chkLiquid.Checked := True Else chkLiquid.Checked := False;
  dblcTipDocTExit(Sender);
  dblcDFEstCivExit(Sender);
  xWhere := 'TIPDOCCOD ='+QuotedStr(dblcDFTDoc.Text);
  dbeDFDoc.Text := DM1.DisplayDescrip('prvSQL', 'TGE159', 'TIPDOCDES', xWhere, 'TIPDOCDES');
  DM1.cdsDFam.Edit;
  pnlFamiliares.Visible := True;
  dblcDFTRel.SetFocus;
End;

Procedure TFDatosBenef.dblcDFTRelExit(Sender: TObject);
Var
   xSQL, xWhere : String;
Begin
  xWhere := 'PARENID ='+QuotedStr(dblcDFTRel.Text);
  dbeDFTRel.Text := DM1.DisplayDescrip('prvSQL', 'TGE149', 'PARENDES', xWhere, 'PARENDES');
  If DM1.wModo = 'A' Then
  Begin
    If dblcDFTRel.Text <> '02' Then
      xSQL := 'SELECT * FROM CRE104 WHERE TIPDEV =''S'' AND TIPDESEID <> ''11'' '
    Else
      xSQL := 'SELECT * FROM CRE104 WHERE TIPDEV =''S'' ';
    DM1.cdsTipDesemb.Filter   := '';
    DM1.cdsTipDesemb.Filtered := False;
    DM1.cdsTipDesemb.IndexFieldNames := '';
    DM1.cdsTipDesemb.Close;
    DM1.cdsTipDesemb.DataRequest(xSQL);
    DM1.cdsTipDesemb.Open;
  End;
End;

Procedure TFDatosBenef.dblcDFEstCivExit(Sender: TObject);
Var
   xWhere : String;
Begin
  xWhere := 'ESTCIVID ='+QuotedStr(dblcDFEstCiv.Text);
  dbeDFEstCiv.Text := DM1.DisplayDescrip('prvSQL', 'TGE125', 'ESTCIVDES', xWhere, 'ESTCIVDES');
End;

Procedure TFDatosBenef.dblcDFTDocExit(Sender: TObject);
Var
   xWhere : String;
Begin
   xWhere := 'TIPDOCCOD ='+QuotedStr(dblcDFTDoc.Text);
   dbeDFDoc.Text := DM1.DisplayDescrip('prvSQL', 'TGE159', 'TIPDOCDES', xWhere, 'TIPDOCDES');
End;

Procedure TFDatosBenef.dblcSexoExit(Sender: TObject);
Begin
  If dblcSexo.Text = 'M' Then dbeSexo.Text := 'MASCULINO';
  If dblcSexo.Text = 'F' Then dbeSexo.Text := 'FEMENINO';
End;

Procedure TFDatosBenef.dbePorcExit(Sender: TObject);
Var
  xWhere, xPorc : String;
Begin
  If Length(dbePorc.Text) > 0 Then
  Begin
    If StrToInt(dbePorc.Text) > 100 Then
    Begin
      ErrorMsg('Error', 'El Porcentaje debe ser Menor que 100');
      DM1.cdsDFam.Edit;
      DM1.cdsDFam.FieldByName('FAMPORC').AsInteger := 100;
      dbePorc.SetFocus;
      Exit;
    End
    Else
    Begin
      If xPorcen = StrToInt(dbePorc.Text) Then Exit
      Else
      Begin
        xWhere := 'ASOID ='+QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString);
        xPorc  := DM1.DisplayDescrip('prvSQL', 'APO203', 'SUM(FAMPORC) FAMPORC', xWhere, 'FAMPORC');
        If Length(xPorc) = 0 Then xPorc := IntToStr(0)
        Else xPorc  := IntToStr(StrToInt(xPorc) - xPorcen);
        If Length(xPorc) > 0 Then
        Begin
          If StrToInt(xPorc) + StrToInt(dbePorc.Text) > 100 Then
          Begin
            Beep;
          MessageDlg('La Suma de Porcentajes es Mayor a 100, No se puede adicionar Beneficiarios!!!', mtInformation, [mbOk], 0);
          DM1.cdsDFam.Edit;
          DM1.cdsDFam.FieldByName('FAMPORC').AsInteger := 100 - StrToInt(xPorc);
          dbePorc.SetFocus;
          Exit;
          End;
        End;
      End;
    End;
    end
   Else Exit;
end;

procedure TFDatosBenef.dblcBancoExit(Sender: TObject);
var
   xWhere : String;
begin
   xWhere := 'BANCOID ='+QuotedStr(dblcBanco.Text);
   dbeBanco.Text := DM1.DisplayDescrip('prvSQL', 'TGE105', 'BANCONOM', xWhere, 'BANCONOM');
   If dblcFPago.Text = '11' Then
    begin
     DM1.cdsDFam.Edit;
     DM1.cdsDFam.FieldByName('BCODPTOID').AsString := '15';
     dblcdDptoBcoExit(Sender);
   end;
end;

procedure TFDatosBenef.dblcBancoNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField,NewValue,[]);
   If not Accept Then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFDatosBenef.btnDFamClick(Sender: TObject);
begin
   DM1.wModo := 'A';
   pnlFamiliares.Visible := True;
   dblcDFTRel.SetFocus;
   LimpiaEditsDF;
   dblcBanco.Enabled   := True;
//   sbtnDFNuevo.Visible := True;
   DM1.cdsDFam.Append;
end;

procedure TFDatosBenef.dbeDFNombresExit(Sender: TObject);
begin
   If Length(dbeDFApePat.Text) <> 0 Then
    begin
     If length(dbeDFApeMat.Text) <> 0 Then
      begin
       If length(dbeDFNombres.Text) <> 0 Then
        begin
         DM1.cdsDFam.Edit;
         DM1.cdsDFam.FieldByName('FAMAPENOM').AsString := Trim(dbeDFApePat.Text)+' '+Trim(dbeDFApeMat.Text)+' '+Trim(dbeDFNombres.Text);
        end;
      end;
    end;
end;

procedure TFDatosBenef.sbtnDFNuevoClick(Sender: TObject);
begin
{
   If (DM1.cdsDFam.Modified) or (DM1.cdsDFam.ChangeCount > 0)  Then
    begin
     DM1.cdsDFam.Edit;
     If MessageDlg('Desea Guardar los Datos', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      begin
       sbtnDFAceptar.Click;
       Exit;
      end;
    end
   Else
    begin
     DM1.wModo := 'A';
     pnlFamiliares.Visible := True;
     chkLiquid.Checked     := False;
     dblcDFTRel.SetFocus;
     LimpiaEditsDF;
     sbtnDFNuevo.Visible := True;
     DM1.cdsDFam.Append;
    end;
}
end;

procedure TFDatosBenef.dbdtpDFFecNacExit(Sender: TObject);
begin
   ///cim 24/09/2002
   DM1.Tiempo(DM1.cdsDFam.FieldByName('FAMFECNAC').AsDateTime, Date, Ano, Mes, Dia);

   If Ano < 18 Then
    begin
     gbDatosTutor.Enabled := True;
     dblcDFEstCiv.Enabled := False;
     dblcDFTDoc.Enabled   := False;
     dbeDFNum.Enabled     := False;
    end
   Else
    begin
     gbDatosTutor.Enabled := False;
     dblcDFEstCiv.Enabled := True;
     dblcDFTDoc.Enabled   := True;
     dbeDFNum.Enabled     := True;
    end;

{   If xEdad < 18 Then
    begin
     dblcBanco.Enabled   := True;
     dblcTmon.Enabled    := True;
     dbeCta.Enabled      := True;
     dbdtpFecApe.Enabled := True;
    end
   Else
    begin
     dblcBanco.Enabled   := False;
     dblcTmon.Enabled    := False;
     dbeCta.Enabled      := False;
     dbdtpFecApe.Enabled := False;
    end;}
end;

procedure TFDatosBenef.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   If (DM1.wModo = 'A') or (DM1.wModo = 'M') Then
    begin
     If (DM1.cdsDFam.ChangeCount > 0) or (DM1.cdsDFam.Modified) Then
      begin
       If MessageDlg('¿Desea Grabar?',mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
        begin
         sbtnDFAceptar.Click;
        end
       Else
        begin
         DM1.cdsDFam.Cancel;
         DM1.cdsDFam.CancelUpdates;
        end;
      end;
    end;
   DM1.wModo := '';
end;

procedure TFDatosBenef.dblcFPagoExit(Sender: TObject);
var
   xWhere : String;
begin
   If Length(dblcFPago.Text) > 0 Then
    begin
     xWhere := 'TIPDESEID ='+QuotedStr(dblcFPago.Text)
              +' And TIPDEV ='+QuotedStr('S');
     If Length(DM1.DisplayDescrip('prvSQL', 'CRE104', 'TIPDESEABR', xWhere, 'TIPDESEABR')) = 0 Then
      begin
       Beep;
       MessageDlg('Código No Válido', mtInformation, [mbOk], 0);
       DM1.cdsDFam.FieldByName('FORPAGOID').Clear;
       dblcFPago.SetFocus;
       Exit;
      end
     Else
      dbeFPago.Text := DM1.cdsQry.FieldByName('TIPDESEABR').AsString;
    end;

   If dblcFPago.Text = '11' Then
    begin
     dblcdDptoBco.Enabled := False;
     dblcdLugGiro.Enabled := False;
     DM1.cdsDFam.Edit;
     DM1.cdsDFam.FieldByName('BANCOID').AsString := '03';
     dblcBancoExit(Sender);
    end
   Else
    begin
     dblcdDptoBco.Enabled := True;
     dblcdLugGiro.Enabled := True;
    end;

   If dblcFPago.Text = '01' Then
    begin
     DM1.cdsDFam.Edit;
     DM1.cdsDFam.FieldByName('BANCOID').AsString := '03';
     dblcBancoExit(Sender);
    end;

   If dblcFPago.Text = '05' Then
    begin
     DM1.cdsDFam.Edit;
     DM1.cdsDFam.FieldByName('BANCOID').AsString := '04';
     dblcBancoExit(Sender);
    end;
end;

procedure TFDatosBenef.dblcFPagoNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField,NewValue,[]);
   If not Accept Then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFDatosBenef.dblcTipDocTExit(Sender: TObject);
var
   xWhere : String;
begin
   xWhere := 'TIPDOCCOD ='+QuotedStr(dblcTipDocT.Text);
   dbeDescTipDocT.Text := DM1.DisplayDescrip('prvSQL', 'TGE159', 'TIPDOCDES', xWhere, 'TIPDOCDES');
end;

procedure TFDatosBenef.dbgDatosFamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   If (Key = VK_DELETE) And (ssCtrl in Shift)  Then
    begin
     If DM1.cdsDFam.RecordCount > 0 Then
      begin
       If Question(Caption, 'Esta Seguro de Eliminar?'+#13+#13+'Desea Continuar') Then
        begin
         DM1.cdsDFam.Delete;
         DM1.AplicaDatos(DM1.cdsDFam, 'DFAM');
         Beep;
         MessageDlg('Registro Eliminado', mtCustom, [mbOk], 0);
        end
       Else
      	Exit;
      end
     Else
      MessageDlg('No Existen Registros a Eliminar', mtInformation, [mbOk], 0);
   end;
end;

procedure TFDatosBenef.dblcDFTRelKeyPress(Sender: TObject; var Key: Char);
begin
   If Key In [' ', 'A'..'Z', 'a'..'z',
              '°', '|', '¬', '!', '"', '#', '$', '%', '&', '/', '(', ')',
              '=', '?', '\', '¡', '¿', '@', '¨', '´', '*', '+', '~', '[',
              ']', '{', '}', '^', '`', '<', '>', ';', ',', ':', '''',
              '.', '-', '_'] Then
    Key := #0;
end;

procedure TFDatosBenef.dblcSexoKeyPress(Sender: TObject; var Key: Char);
begin
   If Key In [' ', '0'..'9',
              'a', 'b', 'c', 'd', 'e', 'g', 'h', 'i', 'j', 'k', 'l', 'n',
              'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
              'A', 'B', 'C', 'D', 'E', 'G', 'H', 'I', 'J', 'K', 'L', 'N',
              'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
              '°', '|', '¬', '!', '"', '#', '$', '%', '&', '/', '(', ')',
              '=', '?', '\', '¡', '¿', '@', '¨', '´', '*', '+', '~', '[',
              ']', '{', '}', '^', '`', '<', '>', ';', ',', ':', '''',
              '.', '-', '_'] Then
    Key := #0;
end;

procedure TFDatosBenef.dbePorcKeyPress(Sender: TObject; var Key: Char);
begin
   If Key In [' ', 'A'..'Z', 'a'..'z',
              '°', '|', '¬', '!', '"', '#', '$', '%', '&', '/', '(', ')',
              '=', '?', '\', '¡', '¿', '@', '¨', '´', '*', '+', '~', '[',
              ']', '{', '}', '^', '`', '<', '>', ';', ',', ':', '''',
              '.', '-', '_'] Then
    Key := #0;
end;

procedure TFDatosBenef.FormKeyPress(Sender: TObject; var Key: Char);
begin
   If Key = #13 Then
    begin
     Key := #0;
     Perform(CM_DialogKey, VK_TAB, 0);
    end;
end;

procedure TFDatosBenef.dblcdLugGiroExit(Sender: TObject);
var
   xWhere : String;
begin
   xWhere := 'BANCOID ='+QuotedStr(dblcBanco.Text)
            +' And AGENBCOID ='+QuotedStr(dblcdLugGiro.Text);

   dbeLugGiro.Text := DM1.DisplayDescrip('prvSQL', 'COB102', 'AGENBCODES', xWhere, 'AGENBCODES');
end;

procedure TFDatosBenef.dblcdDptoBcoExit(Sender: TObject);
var
   xSQL : String;
begin
   dbeDptoBco.Text := DM1.DisplayDescrip('prvSQL', 'APO158', 'DPTODES', 'DPTOID ='+QuotedStr(dblcdDptoBco.Text), 'DPTODES');
   xSQL := 'Select * From COB102'
          +' Where BANCOID ='+QuotedStr(dblcBanco.Text)
          +' And DPTOID ='+QuotedStr(dblcdDptoBco.Text);

   DM1.cdsAgBco.Filter   := '';
   DM1.cdsAgBco.Filtered := False;
   DM1.cdsAgBco.IndexFieldNames := '';
   DM1.cdsAgBco.Close;
   DM1.cdsAgBco.DataRequest(xSQL);
   DM1.cdsAgBco.Open;
   DM1.cdsAgBco.IndexFieldNames := 'AGENBCODES';
end;

procedure TFDatosBenef.dblcdDptoBcoDropDown(Sender: TObject);
begin
   DM1.cdsDpto1.IndexFieldNames := 'DPTODES';
end;

procedure TFDatosBenef.dblcdDeptoExit(Sender: TObject);
var
   xSQL : String;
begin
   dbeDepto.Text := DM1.DisplayDescrip('prvSQL', 'APO158', 'DPTODES', 'DPTOID ='+QuotedStr(dblcdDepto.Text), 'DPTODES');

   If Length(Trim(dblcdCiudad.Text)) = 0 Then
    begin
     dbeProvincia.Clear;
     dbeDistrito.Clear;
     xSQL := 'Select DPTOID, CIUDID, CIUDDES From APO123'
            +' Where DPTOID ='+QuotedStr(dblcdDepto.Text);

     DM1.cdsProvincia3.Filter   := '';
     DM1.cdsProvincia3.Filtered := False;
     DM1.cdsProvincia3.IndexFieldNames := '';
     DM1.cdsProvincia3.Close;
     DM1.cdsProvincia3.DataRequest(xSQL);
     DM1.cdsProvincia3.Open;
     DM1.cdsProvincia3.IndexFieldNames := 'CIUDDES; DPTOID; CIUDID';
    end;
end;

procedure TFDatosBenef.dblcdDeptoChange(Sender: TObject);
begin
   dblcdCiudad.Clear;
   dbeProvincia.Clear;
   dblcdDistrito.Clear;
   dbeDistrito.Clear;
end;

procedure TFDatosBenef.dblcdDeptoDropDown(Sender: TObject);
begin
   DM1.cdsDpto.IndexFieldNames := 'DPTODES';
end;

procedure TFDatosBenef.dblcdDeptoKeyPress(Sender: TObject; var Key: Char);
begin
   If Key In [' ',
              '°', '|', '¬', '!', '"', '#', '$', '%', '&', '/', '(', ')',
              '=', '?', '\', '¡', '¿', '@', '¨', '´', '*', '+', '~', '[',
              ']', '{', '}', '^', '`', '<', '>', ';', ',', ':', '''',
              '.', '-', '_'] Then
    Key := #0;
end;

procedure TFDatosBenef.dblcdCiudadExit(Sender: TObject);
var
   xSQL, xWhere : String;
begin
   xWhere := 'DPTOID ='+QuotedStr(dblcdDepto.Text)
            +' And CIUDID ='+QuotedStr(dblcdCiudad.Text);
   dbeProvincia.Text := DM1.DisplayDescrip('prvSQL', 'APO123', 'CIUDDES', xWhere, 'CIUDDES');

   xSQL := 'Select ZIPID, ZIPDES, CIUDID, DPTOID From APO122'
          +' Where CIUDID ='+QuotedStr(dblcdCiudad.Text)
          +' And DPTOID ='+QuotedStr(dblcdDepto.Text);

   DM1.cdsDist3.Filter   := '';
   DM1.cdsDist3.Filtered := False;
   DM1.cdsDist3.IndexFieldNames := '';
   DM1.cdsDist3.Close;
   DM1.cdsDist3.DataRequest(xSQL);
   DM1.cdsDist3.Open;
   DM1.cdsDist3.IndexFieldNames := 'ZIPDES; DPTOID; CIUDID; ZIPID';
end;

procedure TFDatosBenef.dblcdCiudadChange(Sender: TObject);
begin
   dblcdDistrito.Clear;
end;

procedure TFDatosBenef.dblcdCiudadDropDown(Sender: TObject);
var
   xSQL : String;
begin
   If Length(dblcdDepto.Text) > 0 Then
    begin
     xSQL := 'Select DPTOID, CIUDID, CIUDDES From APO123'
            +' Where DPTOID ='+QuotedStr(dblcdDepto.Text);

     DM1.cdsProvincia3.Filter   := '';
     DM1.cdsProvincia3.Filtered := False;
     DM1.cdsProvincia3.IndexFieldNames := '';
     DM1.cdsProvincia3.Close;
     DM1.cdsProvincia3.DataRequest(xSQL);
     DM1.cdsProvincia3.Open;
     DM1.cdsProvincia3.IndexFieldNames := 'CIUDDES; DPTOID; CIUDID';
    end;
end;

procedure TFDatosBenef.dblcdCiudadKeyPress(Sender: TObject; var Key: Char);
begin
   If Key In [' ',
              '°', '|', '¬', '!', '"', '#', '$', '%', '&', '/', '(', ')',
              '=', '?', '\', '¡', '¿', '@', '¨', '´', '*', '+', '~', '[',
              ']', '{', '}', '^', '`', '<', '>', ';', ',', ':', '''',
              '.', '-', '_'] Then
    Key := #0;
end;

procedure TFDatosBenef.dblcdDistritoExit(Sender: TObject);
var
   xSQL, xWhere : String;
begin
   If Trim(dblcdDistrito.Text) <> '' Then
    begin
     xWhere := 'DPTOID ='+QuotedStr(dblcdDepto.Text)
              +' And CIUDID ='+QuotedStr(dblcdCiudad.Text)
              +' And ZIPID ='+QuotedStr(dblcdDistrito.Text);
     dbeDistrito.Text := DM1.DisplayDescrip('prvSQL', 'APO122', 'ZIPDES', xWhere, 'ZIPDES');
    end
   Else
    begin
     dbeDistrito.Clear;
     If (Length(dblcdDepto.Text) > 0) And (Length(dblcdCiudad.Text) > 0) Then
      begin
       xSQL := 'Select ZIPID, ZIPDES, CIUDID, DPTOID From APO122'
              +' Where CIUDID ='+QuotedStr(dblcdCiudad.Text)
              +' And DPTOID ='+QuotedStr(dblcdDepto.Text);

       DM1.cdsDist3.Filter   := '';
       DM1.cdsDist3.Filtered := False;
       DM1.cdsDist3.IndexFieldNames := '';
       DM1.cdsDist3.Close;
       DM1.cdsDist3.DataRequest(xSQL);
       DM1.cdsDist3.Open;
       DM1.cdsDist3.IndexFieldNames := 'ZIPDES; DPTOID; CIUDID; ZIPID';
      end;
    end;
end;

procedure TFDatosBenef.dblcdDistritoKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key In [' ',
              '°', '|', '¬', '!', '"', '#', '$', '%', '&', '/', '(', ')',
              '=', '?', '\', '¡', '¿', '@', '¨', '´', '*', '+', '~', '[',
              ']', '{', '}', '^', '`', '<', '>', ';', ',', ':', '''',
              '.', '-', '_'] Then
    Key := #0;
end;

end.
