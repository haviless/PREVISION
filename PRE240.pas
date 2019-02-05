// Inicio Uso Estándares: 01/08/2011
// Unidad : Previsión Social
// Formulario : FManFami
// Fecha de Creación : 20/05/2018
// Autor : Sistemas
// Objetivo : Mantenimiento de Familiares
// Actualizaciones : HPC_201809_PRE - Se modifca todo el formulario 

//Inicio HPC_201809_PRE
//Se modifca todo el formulario 
Unit PRE240;

Interface
Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Mask, ExtCtrls, Wwdbdlg, wwdbdatetimepicker, StdCtrls, wwdblook,
   Buttons, db, jpeg, SIPSvc, SIPSvcUTIL, JPEGLoader, ExtDlgs,
   ImageDLLLoader, ICOLoader, PNGLoader, HIPSLoader, BMPLoader, PCXLoader, WMFLoader, LinarBitmap,
  ppDB, ppDBPipe, ppDBBDE, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppComm, ppRelatv, ppProd, ppReport;
Type
   TFManFami = Class(TForm)
      btnCerrar: TBitBtn;
      btnGrabar: TBitBtn;
      btneditar: TBitBtn;
      btnElimina: TBitBtn;
    OpenPictureDialog1: TOpenPictureDialog;
    gbtutor: TGroupBox;
    Label18: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    pnldnitut: TPanel;
    mednitut: TMaskEdit;
    btnbuscarentut: TBitBtn;
    pnlapepattut: TPanel;
    meapepattut: TMaskEdit;
    pnlapemattut: TPanel;
    meapemattut: TMaskEdit;
    pnlnomtut: TPanel;
    menomtut: TMaskEdit;
    GroupBox4: TGroupBox;
    ImagenTut: TImage;
    FirmaTut: TImage;
    btnRENIECTut: TBitBtn;
    ppBDEReniec: TppBDEPipeline;
    ppRReniec: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppShape41: TppShape;
    ppLabel21: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppShape79: TppShape;
    ppShape78: TppShape;
    ppShape76: TppShape;
    ppShape77: TppShape;
    ppShape75: TppShape;
    ppShape74: TppShape;
    ppShape40: TppShape;
    ppShape39: TppShape;
    ppShape29: TppShape;
    ppShape19: TppShape;
    ppShape69: TppShape;
    ppShape71: TppShape;
    ppShape32: TppShape;
    ppShape67: TppShape;
    ppShape66: TppShape;
    ppShape65: TppShape;
    ppShape64: TppShape;
    ppShape31: TppShape;
    ppShape28: TppShape;
    ppShape26: TppShape;
    ppShape21: TppShape;
    ppShape4: TppShape;
    ppShape3: TppShape;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppShape8: TppShape;
    ppShape9: TppShape;
    ppShape10: TppShape;
    ppShape11: TppShape;
    ppShape12: TppShape;
    ppShape13: TppShape;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppShape14: TppShape;
    ppShape15: TppShape;
    ppShape16: TppShape;
    ppShape17: TppShape;
    ppShape18: TppShape;
    ppShape20: TppShape;
    ppShape22: TppShape;
    ppShape23: TppShape;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppShape24: TppShape;
    ppShape25: TppShape;
    ppShape27: TppShape;
    ppShape33: TppShape;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppShape34: TppShape;
    ppShape35: TppShape;
    ppShape36: TppShape;
    ppShape37: TppShape;
    ppShape38: TppShape;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppShape2: TppShape;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText15: TppDBText;
    ppDBText17: TppDBText;
    ppDBText19: TppDBText;
    ppFirma: TppImage;
    ppFoto: TppImage;
    ppLabel143: TppLabel;
    ppDBText29: TppDBText;
    ppLabel144: TppLabel;
    ppDBText30: TppDBText;
    pplDocAltRepRen: TppLabel;
    ppShape68: TppShape;
    ppLabel146: TppLabel;
    ppDBText31: TppDBText;
    pplEstCivRepRen: TppLabel;
    pplSexoRepRen: TppLabel;
    pplEstVotRepRen: TppLabel;
    pplGraInsRepRen: TppLabel;
    pplResRepRen: TppLabel;
    ppShape72: TppShape;
    ppLabel145: TppLabel;
    ppShape73: TppShape;
    pplLugDomRepRen: TppLabel;
    ppLabel17: TppLabel;
    ppShape30: TppShape;
    pplPreUrbImpRen: TppLabel;
    ppLabel20: TppLabel;
    pplDesUrbImpRen: TppLabel;
    ppShape60: TppShape;
    ppShape61: TppShape;
    ppShape62: TppShape;
    ppLabel141: TppLabel;
    ppShape63: TppShape;
    pplPreDirImpRen: TppLabel;
    ppLabel147: TppLabel;
    pplDesDirImpRen: TppLabel;
    ppLabel142: TppLabel;
    pplEtaDirImpRen: TppLabel;
    ppLabel149: TppLabel;
    ppLabel150: TppLabel;
    pplPreBloImpRen: TppLabel;
    pplDesBloImpRen: TppLabel;
    ppShape80: TppShape;
    ppShape83: TppShape;
    ppShape84: TppShape;
    ppShape85: TppShape;
    ppLabel153: TppLabel;
    ppLabel162: TppLabel;
    pplPreIntImpren: TppLabel;
    pplDesIntImpRen: TppLabel;
    ppShape86: TppShape;
    ppShape87: TppShape;
    ppLabel163: TppLabel;
    pplNumDirImpRen: TppLabel;
    ppShape88: TppShape;
    ppShape89: TppShape;
    ppShape90: TppShape;
    ppShape91: TppShape;
    ppLabel164: TppLabel;
    ppLabel165: TppLabel;
    pplManImpren: TppLabel;
    pplLotImpren: TppLabel;
    ppFooterBand1: TppFooterBand;
    gbbeneficiario: TGroupBox;
    Label4: TLabel;
    Label12: TLabel;
    Label17: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    lblporcentaje: TLabel;
    Label11: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label16: TLabel;
    Label6: TLabel;
    lblbanco: TLabel;
    lblagegir: TLabel;
    dblctiprel: TwwDBLookupCombo;
    pnldestiprel: TPanel;
    medestiprel: TMaskEdit;
    pnlfamotrtiprel: TPanel;
    mefamotrtiprel: TMaskEdit;
    pnldni: TPanel;
    medni: TMaskEdit;
    btnbuscarenben: TBitBtn;
    pnlapepatben: TPanel;
    meapepatben: TMaskEdit;
    pnlapematben: TPanel;
    meapematben: TMaskEdit;
    pnlApeCas: TPanel;
    meapecas: TMaskEdit;
    pnlnomben: TPanel;
    menomben: TMaskEdit;
    dbdtpfecnac: TwwDBDateTimePicker;
    dblcidesex: TwwDBLookupCombo;
    pnldessex: TPanel;
    medessex: TMaskEdit;
    pnlporcentaje: TPanel;
    pnldireccionfam: TPanel;
    medireccionfam: TMaskEdit;
    dblcddptoid: TwwDBLookupComboDlg;
    pnldesdptoben: TPanel;
    medptodes: TMaskEdit;
    dblcdProvincia: TwwDBLookupComboDlg;
    pnldesproben: TPanel;
    meprovinciades: TMaskEdit;
    dblcdDistrito: TwwDBLookupComboDlg;
    pnldesdisben: TPanel;
    medistritodes: TMaskEdit;
    pnltelefonofijo: TPanel;
    metelefonofijo: TMaskEdit;
    pnlmovil: TPanel;
    memovil: TMaskEdit;
    pnlemail: TPanel;
    meemail: TMaskEdit;
    dblcforpag: TwwDBLookupCombo;
    pnlforpagodes: TPanel;
    meforpagodes: TMaskEdit;
    dblcBanco: TwwDBLookupCombo;
    pnldesban: TPanel;
    mebancodes: TMaskEdit;
    dblcagegir: TwwDBLookupComboDlg;
    pnlagegir: TPanel;
    meagegir: TMaskEdit;
    gbfotofirmaben: TGroupBox;
    ImagenBen: TImage;
    FirmaBen: TImage;
    btnRENIECBen: TBitBtn;
    rgbenmenedad: TRadioGroup;
    meporcentaje: TMaskEdit;
    Procedure btnCerrarClick(Sender: TObject);
    Procedure btnGrabarClick(Sender: TObject);
    Procedure FormKeyPress(Sender: TObject; Var Key: Char);
    Procedure dblctiprelChange(Sender: TObject);
    Procedure dblcidesexChange(Sender: TObject);
    Procedure dblcBancoChange(Sender: TObject);
    Procedure dblcagegirChange(Sender: TObject);
    Procedure btneditarClick(Sender: TObject);
    Procedure dbdtpfecnacExit(Sender: TObject);
    Procedure btnEliminaClick(Sender: TObject);
    Procedure dblcforpagExit(Sender: TObject);
    Procedure dblcforpagChange(Sender: TObject);
    procedure dblcddptoidChange(Sender: TObject);
    procedure dblcddptoidExit(Sender: TObject);
    procedure dblcdProvinciaChange(Sender: TObject);
    procedure dblcdProvinciaExit(Sender: TObject);
    procedure dblcdDistritoExit(Sender: TObject);
    procedure meemailExit(Sender: TObject);
    procedure memovilKeyPress(Sender: TObject; var Key: Char);
    procedure memovilExit(Sender: TObject);
    procedure medniKeyPress(Sender: TObject; var Key: Char);
    procedure btnbuscarenbenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnbuscarentutClick(Sender: TObject);
    procedure btnRENIECBenClick(Sender: TObject);
    procedure btnRENIECTutClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure rgbenmenedadClick(Sender: TObject);
    Private
    Function  validadatos: Boolean;
    Procedure llenafamilia;
    Procedure llenabeneficiario;
    Procedure inhabilitar;
    Function  ActDatReniec(xAsoDni: STRING): Boolean;
    Procedure CargaMemStreamImg(xdni:String);
    Procedure GrabafotoAtabla(xDni: STRING);
    Procedure MostrarDatosReniecBen(xDni: STRING);
    Procedure MostrarDatosReniecTut(xDni: STRING);
    Procedure ImpImagenes(xdni:String);
    Procedure HabIngDeuMay;
    Procedure HabIngDeuMen;
    procedure Inicializa;
    procedure limpia;
    Public
      xfila: String;
      Reg: CPersonData2;
      xusuRENIEC:String;
   End;
Var
   FManFami: TFManFami;
   ISipObj : ISIPService;

Implementation

Uses DateUtils, PREDM, PRE235;

{$R *.dfm}

Procedure TFManFami.btnCerrarClick(Sender: TObject);
Begin
   FManFami.Close;
End;

Function TFManFami.validadatos: Boolean;
Var
   xSql :String;
   xedad, xConyuge, xPadres, xActual: Integer;
Begin
   If DM1.xSgr = 'F' Then
   Begin
      xConyuge := 0;
      xPadres := 0;
      xActual := DM1.cdsDFam.RecNo;
      If dblctiprel.Text = '01' Then xConyuge := xConyuge + 1;
      If dblctiprel.Text = '14' Then xPadres := xPadres + 1;
      DM1.cdsDFam.First;
      While Not DM1.cdsDFam.Eof Do
      Begin
         If (DM1.xCnd = 'M') Then
         Begin
            If (DM1.cdsDFam.RecNo <> xActual) Then
            Begin
               If DM1.cdsDFam.FieldByName('FAMRELID').AsString = '01' Then xConyuge := xConyuge + 1;
               If DM1.cdsDFam.FieldByName('FAMRELID').AsString = '14' Then xPadres := xPadres + 1;
            End;
         End
         Else
         Begin
            If DM1.cdsDFam.FieldByName('FAMRELID').AsString = '01' Then xConyuge := xConyuge + 1;
            If DM1.cdsDFam.FieldByName('FAMRELID').AsString = '14' Then xPadres := xPadres + 1;
         End;
         DM1.cdsDFam.Next;
      End;
      DM1.cdsDFam.First;
      If xConyuge > 1 Then
      Begin
         MessageDlg('No puede existir más de un Conyuge', mtCustom, [mbOk], 0);
         Result := False;
         Exit;
      End;
      If xPadres > 2 Then
      Begin
         MessageDlg('No pueden existir más de dos padres', mtCustom, [mbOk], 0);
         Result := False;
         Exit;
      End;
   End;

   // Chequeo si es menor de edad
   If rgbenmenedad.ItemIndex = 0 Then
   Begin
      If Trim(meapepatben.Text) = '' Then
      Begin
         MessageDlg('Apellido paterno del beneficiario no valido', mtInformation, [mbOk], 0);
         Result := False;
         meapepatben.SetFocus;
         Exit;
      End;
      If Trim(meapematben.Text) = '' Then
      Begin
         MessageDlg('Apellido materno del beneficiario no valido', mtInformation, [mbOk], 0);
         Result := False;
         meapematben.SetFocus;
         Exit;
      End;
      If Trim(menomben.Text) = '' Then
      Begin
         MessageDlg('Nombre del beneficiario no valido', mtInformation, [mbOk], 0);
         Result := False;
         menomben.SetFocus;
         Exit;
      End;
      If trim(dbdtpfecnac.Text) = '' Then
      Begin
         MessageDlg('Fecha de nacimiento del beneficiario no valido', mtInformation, [mbOk], 0);
         Result := False;
         dbdtpfecnac.SetFocus;
         Exit;
      End;
      If trim(dblcidesex.Text) = '' Then
      Begin
         MessageDlg('Sexo del beneficiario no valido', mtInformation, [mbOk], 0);
         Result := False;
         dblcidesex.SetFocus;
         Exit;
      End;

      If Trim(meapepattut.Text)+Trim(meapemattut.Text)+Trim(menomtut.Text) = '' Then
      Begin
         MessageDlg('DNI del tutor no valido', mtInformation, [mbOk], 0);
         Result := False;
         mednitut.SetFocus;
         Exit;
      End;
   End;

   If rgbenmenedad.ItemIndex = 1 Then
   Begin
      If Trim(meapepatben.Text)+Trim(meapematben.Text)+Trim(meapecas.Text)+Trim(menomben.Text) = '' Then
      Begin
         MessageDlg('DNI del beneficiario no valido', mtInformation, [mbOk], 0);
         Result := False;
         medni.SetFocus;
         Exit;
      End;
   End;

   If Trim(dblctiprel.text) = '' Then
   Begin
      MessageDlg('Tipo de relación no valido', mtInformation, [mbOk], 0);
      Result := False;
      dblctiprel.SetFocus;
      Exit;
   End;

   If DM1.xSgr = 'D' Then
   Begin
      If Trim(meporcentaje.text) = '' Then
      Begin
         MessageDlg('Debe registrar monto del porcentaje', mtInformation, [mbOk], 0);
         Result := False;
         meporcentaje.SetFocus;
         Exit;
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

Procedure TFManFami.btnGrabarClick(Sender: TObject);
Var
   xMenEdad, xSql, xApenom, xTipDocTut: String;
Begin
   If validadatos = True Then
   Begin
      If MessageDlg('¿ Actualizar datos de los familiares ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         xApenom := '';
         If Trim(meapepatben.Text) <> '' Then xApenom := xApenom + Trim(meapepatben.Text)+' ';
         If Trim(meapematben.Text) <> '' Then xApenom := xApenom + Trim(meapematben.Text)+' ';
         If Trim(meapecas.Text) <> ''    Then xApenom := xApenom + Trim(meapecas.Text)+' ';
         xApenom := xApenom + Trim(menomben.Text);
         If mednitut.Text <> '' Then
            xTipDocTut := '10'
         Else
            xTipDocTut := '';
         If rgbenmenedad.ItemIndex = 0 Then xMenEdad := 'S'
         Else If rgbenmenedad.ItemIndex = 1 Then xMenEdad := 'N';
         If DM1.xSgr = 'F' Then
         Begin
            If DM1.xCnd = 'I' Then
            Begin
               xSql := 'INSERT INTO APO203 (ASOID, FAMAPEPAT, FAMAPEMAT, FAMNOMBRE, FAMAPENOM, FAMRELID, FAMFECNAC, FAMSEXO, FAMDIRECC, DISTID, FAMTELF, FAMTELMOV,'
               + ' TIPDOCCOD, FAMNUMDOC, APEPATTUT, APEMATTUT, NOMTUT,  FORPAGOID, BANCOID, AGENBCOID, USUARIO, FREG, HREG, TUTTIPDOC, TUTNUMDOC, FAMFLLQ, TUTAPENOM, FAMOTRTIPREL, FAMAPECAS, EMAILFAM, MENEDAD)'
               + ' VALUES (' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString) + ',' + QuotedStr(meapepatben.Text) + ','
               + QuotedStr(meapematben.Text) + ',' + QuotedStr(menomben.Text) + ',' + QuotedStr(xApenom) + ',' + QuotedStr(dblctiprel.Text) + ','
               + QuotedStr(dbdtpfecnac.Text) + ',' + QuotedStr(dblcidesex.Text) + ',' + QuotedStr(medireccionfam.Text) + ',' + QuotedStr(dblcdDistrito.Text) + ','
               + QuotedStr(metelefonofijo.Text) + ',' + QuotedStr(memovil.Text) +','
               + QuotedStr('10') + ',' + QuotedStr(medni.Text) + ','
               + QuotedStr(meapepattut.Text) + ',' + QuotedStr(meapemattut.Text) + ',' + QuotedStr(menomtut.Text) + ',' + QuotedStr(dblcforpag.Text) + ','
               + QuotedStr(dblcBanco.Text) + ',' + QuotedStr(dblcagegir.Text) + ',' + QuotedStr(DM1.wUsuario) + ', TO_CHAR(SYSDATE, ''DD/MM/YYYY''), SYSDATE,'
               + QuotedStr(xTipDocTut) + ',' + QuotedStr(mednitut.Text) + ',' + QuotedStr('S') + ','
               + QuotedStr(Trim(meapepattut.Text)+' '+Trim(meapemattut.Text)+' '+Trim(menomtut.Text)) + ',' + QuotedStr(Trim(mefamotrtiprel.Text)) + ',' + QuotedStr(Trim(meapecas.Text)) + ',' + QuotedStr(meemail.Text)+ ','
               + QuotedStr(xMenEdad) + ')';
               DM1.DCOM1.AppServer.EjecutaSQL(xSql);
            End;
            If DM1.xCnd = 'M' Then
            Begin
               xSql := 'UPDATE APO203 SET'
               + '  FAMAPEPAT = ' + QuotedStr(meapepatben.Text)
               + ', FAMAPEMAT = ' + QuotedStr(meapematben.Text)
               + ', FAMAPECAS = ' + QuotedStr(meapecas.Text)
               + ', FAMNOMBRE = ' + QuotedStr(menomben.Text)
               + ', FAMAPENOM = ' + QuotedStr(xApenom)
               + ', FAMRELID  = ' + QuotedStr(dblctiprel.Text)
               + ', FAMFECNAC = ' + QuotedStr(dbdtpfecnac.Text)
               + ', FAMSEXO   = ' + QuotedStr(dblcidesex.Text)
               + ', TIPDOCCOD = ' + QuotedStr('10')
               + ', FAMNUMDOC = ' + QuotedStr(medni.Text)
               + ', FAMDIRECC = ' + QuotedStr(medireccionfam.Text)
               + ', DISTID    = ' + QuotedStr(dblcdDistrito.Text)
               + ', FAMTELF   = ' + QuotedStr(metelefonofijo.Text)
               + ', FAMTELMOV = ' + QuotedStr(memovil.Text)
               + ', APEPATTUT = ' + QuotedStr(meapepattut.Text)
               + ', APEMATTUT = ' + QuotedStr(meapemattut.Text)
               + ', NOMTUT    = ' + QuotedStr(menomtut.Text)
               + ', TUTAPENOM = ' + QuotedStr(Trim(meapepattut.Text) + ' ' + Trim(meapemattut.Text) + ' ' + Trim(menomtut.Text))
               + ', TUTTIPDOC = ' + QuotedStr(xTipDocTut)
               + ', TUTNUMDOC = ' + QuotedStr(mednitut.Text)
               + ', FORPAGOID = ' + QuotedStr(dblcforpag.Text)
               + ', BANCOID   = ' + QuotedStr(dblcBanco.Text)
               + ', AGENBCOID = ' + QuotedStr(dblcagegir.Text)
               + ', USUARIO   = ' + QuotedStr(DM1.wUsuario)
               + ', FAMFLLQ   = ' + QuotedStr('S')
               + ', EMAILFAM   = ' + QuotedStr(meemail.Text)
               + ', FREG = TO_CHAR(SYSDATE, ''DD/MM/YYYY''), HREG = SYSDATE'
               + ', FAMOTRTIPREL = ' + QuotedStr(mefamotrtiprel.Text)
               + ', MENEDAD = ' + QuotedStr(xMenEdad)
               + ' WHERE ASOID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)
               + ' AND ROWID = ' + QuotedStr(xfila);
               DM1.DCOM1.AppServer.EjecutaSQL(xSql);
            End;
            xSql := 'SELECT A.FAMAPENOM, A.FAMAPEPAT, A.FAMAPEMAT, A.FAMNOMBRE, A.FAMNUMDOC, B.PARENDES, A.FAMOTRTIPREL, A.FAMFECNAC,  A.FAMPORC, A.BANCOID,'
            + ' A.FAMDIRECC, A.DISTID, A.FAMTELF, A.FAMTELMOV,'
            + ' A.FORPAGOID, A.FAMRELID, A.TUTAPENOM, A.APEPATTUT, A.APEMATTUT, A.NOMTUT, A.TUTNUMDOC, A.FAMSEXO, A.AGENBCOID, A.ASOID, A.FAMAPECAS, A.EMAILFAM, A.ROWID, A.MENEDAD FILA FROM APO203 A, TGE149 B'
            + ' WHERE ASOID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString) + ' AND A.FAMRELID = B.PARENID(+)';
            DM1.cdsDFam.Close;
            DM1.cdsDFam.DataRequest(xSql);
            DM1.cdsDFam.Open;
            DM1.RepartePorcentaje(DM1.cdsExpLiq.FieldByName('ASOID').AsString);
            xSql := 'SELECT A.FAMAPENOM, A.FAMAPEPAT, A.FAMAPEMAT, A.FAMNOMBRE, A.FAMNUMDOC, B.PARENDES, A.FAMOTRTIPREL, A.FAMFECNAC,  A.FAMPORC, A.BANCOID,'
            + ' A.FAMDIRECC, A.DISTID, A.FAMTELF, A.FAMTELMOV,'
            + ' A.FORPAGOID, A.FAMRELID, A.TUTAPENOM, A.APEPATTUT, A.APEMATTUT, A.NOMTUT, A.TUTNUMDOC, A.FAMSEXO, A.AGENBCOID, A.ASOID, A.FAMAPECAS, A.ROWID FILA, A.MENEDAD, A.EMAILFAM FROM APO203 A, TGE149 B'
            + ' WHERE ASOID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString) + ' AND A.FAMRELID = B.PARENID(+)';
            DM1.cdsDFam.Close;
            DM1.cdsDFam.DataRequest(xSql);
            DM1.cdsDFam.Open;
            MessageDlg('Grabación Ok', mtInformation, [mbOk], 0);
            FManFami.Close;
         End;
         If DM1.xSgr = 'D' Then
         Begin
            If DM1.xCnd = 'I' Then DM1.cdsdetcardes.Append;
            If DM1.xCnd = 'M' Then DM1.cdsdetcardes.Edit;
            DM1.cdsdetcardes.FieldByName('APEPAT').AsString       := meapepatben.Text;
            DM1.cdsdetcardes.FieldByName('APEMAT').AsString       := meapematben.Text;
            DM1.cdsdetcardes.FieldByName('APECAS').AsString       := meapecas.Text; // SPP_201403_PRE
            DM1.cdsdetcardes.FieldByName('APENOM').AsString       := menomben.Text;
            DM1.cdsdetcardes.FieldByName('TIPREL').AsString       := dblctiprel.Text;
            DM1.cdsdetcardes.FieldByName('DSGOTRTIPREL').AsString := mefamotrtiprel.Text;  // SPP_201305_PRE
            DM1.cdsdetcardes.FieldByName('FECNAC').AsDateTime     := dbdtpfecnac.DateTime;
            DM1.cdsdetcardes.FieldByName('SEXO').AsString         := dblcidesex.Text;
            DM1.cdsdetcardes.FieldByName('DNI').AsString          := medni.Text;
            DM1.cdsdetcardes.FieldByName('PORC').AsString         := meporcentaje.Text;
            DM1.cdsdetcardes.FieldByName('APEPATTUT').AsString    := meapepattut.Text;
            DM1.cdsdetcardes.FieldByName('APEMATTUT').AsString    := meapemattut.Text;
            DM1.cdsdetcardes.FieldByName('NOMTUT').AsString       := menomtut.Text;
            DM1.cdsdetcardes.FieldByName('DNITUT').AsString       := mednitut.Text;
            DM1.cdsdetcardes.FieldByName('FORPAGID').AsString     := dblcforpag.Text;
            DM1.cdsdetcardes.FieldByName('BANCOID').AsString      := dblcBanco.Text;
            DM1.cdsdetcardes.FieldByName('AGEBCOID').AsString := dblcagegir.Text;
            DM1.cdsdetcardes.FieldByName('DSGDIRDES').AsString := medireccionfam.Text;
            DM1.cdsdetcardes.FieldByName('DSGZIPIDDES').AsString     := dblcdDistrito.Text;
            DM1.cdsdetcardes.FieldByName('DSGTELFIJDES').AsString  := metelefonofijo.Text;
            DM1.cdsdetcardes.FieldByName('DSGTELMOVDES').AsString     := memovil.Text;
            DM1.cdsdetcardes.FieldByName('EMAILDES').AsString     := meemail.Text;
            DM1.cdsdetcardes.FieldByName('MENEDAD').AsString     := xMenEdad;
            DM1.cdsdetcardes.Post;
            FManFami.Close;
         End;
      End;
   End;
End;

Procedure TFManFami.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If Key = #13 Then
   Begin
      Key := #0;
      Perform(CM_DIALOGKEY, VK_TAB, 0);
   End;
End;

Procedure TFManFami.dblctiprelChange(Sender: TObject);
Begin
   mefamotrtiprel.Text := '';
   If dblctiprel.Text = '16' Then
   Begin
      pnlfamotrtiprel.Enabled := True;
      mefamotrtiprel.Color := clWindow;
   End
   Else
   Begin
      pnlfamotrtiprel.Enabled := False;
      mefamotrtiprel.Color := clMoneyGreen;
   End;
   If Length(dblctiprel.Text) = 2 Then
   Begin
      medestiprel.Text := DM1.DevuelveValor('TGE149', 'PARENDES', 'PARENID', dblctiprel.Text);
      If Trim(medestiprel.Text) = '' Then
      Begin
         MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
         dblctiprel.Text := '';
         medestiprel.Text := '';
         dblctiprel.SetFocus;
         Exit;
      End;
   End;
   If Trim(medestiprel.Text) <> '' Then
   Begin
      If dblctiprel.Text = '16' Then
         pnlfamotrtiprel.Enabled := True
      Else
         pnlfamotrtiprel.Enabled := False;
      dblcforpag.Text := '';
      If Trim(dblctiprel.Text) = '' Then
      Begin
         dblctiprel.Text := '';
         medestiprel.Text := '';
      End;
   End;
End;

Procedure TFManFami.dblcidesexChange(Sender: TObject);
Begin
   If Trim(dblcidesex.Text) = '' Then
   Begin
      dblcidesex.Text := '';
      medessex.Text := '';
   End;
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
         dblcidesex.SetFocus;
      End;
   End;
End;

Procedure TFManFami.dblcBancoChange(Sender: TObject);
Begin
   If Trim(dblcBanco.Text) = '' Then
   Begin
      dblcBanco.Text := '';
      mebancodes.Text := '';
      dblcagegir.Text := '';
      meagegir.Text := '';
   End;
   If Length(dblcBanco.Text) = 2 Then
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
End;

Procedure TFManFami.dblcagegirChange(Sender: TObject);
Begin
   If Trim(dblcagegir.Text) = '' Then
   Begin
      dblcagegir.Text := '';
      meagegir.Text := '';
   End;
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

Procedure TFManFami.llenafamilia;
Var
   xmenedad, xSql: String;
Begin
   If DM1.cdsDFam.FieldByName('MENEDAD').AsString = 'S' Then rgbenmenedad.ItemIndex := 0;
   If DM1.cdsDFam.FieldByName('MENEDAD').AsString = 'N' Then rgbenmenedad.ItemIndex := 1;
   medni.Text          := DM1.cdsDFam.FieldByName('FAMNUMDOC').AsString;
   meapepatben.Text    := DM1.cdsDFam.FieldByName('FAMAPEPAT').AsString;
   meapematben.Text    := DM1.cdsDFam.FieldByName('FAMAPEMAT').AsString;
   meapecas.Text       := DM1.cdsDFam.FieldByName('FAMAPECAS').AsString;
   menomben.Text       := DM1.cdsDFam.FieldByName('FAMNOMBRE').AsString;
   dblctiprel.Text     := DM1.cdsDFam.FieldByName('FAMRELID').AsString;
   medestiprel.Text     := DM1.DevuelveValor('TGE149', 'PARENDES', 'PARENID', dblctiprel.Text);
   mefamotrtiprel.Text := DM1.cdsDFam.FieldByName('FAMOTRTIPREL').AsString;
   dbdtpfecnac.Date    := DM1.cdsDFam.FieldByName('FAMFECNAC').AsDateTime;
   dblcidesex.Text     := DM1.cdsDFam.FieldByName('FAMSEXO').AsString;
   medessex.Text        := DM1.DevuelveValor('TGE817', 'DESCRIP', 'ID', dblcidesex.Text);
   medireccionfam.Text := DM1.cdsDFam.FieldByName('FAMDIRECC').AsString;
   dblcddptoid.Text    := Copy(DM1.cdsDFam.FieldByName('DISTID').AsString,1,2);
   medptodes.Text      := DM1.DevuelveValor('APO158', 'DPTODES', 'DPTOID', dblcddptoid.Text);
   dblcdProvincia.Text := Copy(DM1.cdsDFam.FieldByName('DISTID').AsString,1,4);
   meprovinciades.Text :=  DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', dblcdProvincia.Text);
   dblcdDistrito.Text  := DM1.cdsDFam.FieldByName('DISTID').AsString;
   medistritodes.Text  :=  DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', dblcdDistrito.Text);
   metelefonofijo.Text := DM1.cdsDFam.FieldByName('FAMTELF').AsString;
   memovil.Text        := DM1.cdsDFam.FieldByName('FAMTELMOV').AsString;
   meemail.Text        := DM1.cdsDFam.FieldByName('EMAILFAM').AsString;
   dblcforpag.Text     := DM1.cdsDFam.FieldByName('FORPAGOID').AsString;
   meforpagodes.Text :=  DM1.DevuelveValor('CRE104', 'TIPDESEDES', 'TIPDESEID', dblcforpag.Text);
   dblcBanco.Text      := DM1.cdsDFam.FieldByName('BANCOID').AsString;
   mebancodes.Text :=  DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', dblcBanco.Text);
   dblcagegir.Text := DM1.cdsDFam.FieldByName('AGENBCOID').AsString;
   meapepattut.Text    := DM1.cdsDFam.FieldByName('APEPATTUT').AsString;
   meapemattut.Text    := DM1.cdsDFam.FieldByName('APEMATTUT').AsString;
   menomtut.Text       := DM1.cdsDFam.FieldByName('NOMTUT').AsString;
   mednitut.Text       := DM1.cdsDFam.FieldByName('TUTNUMDOC').AsString;
   DM1.CargaImagenesBen(medni.Text);
   ImagenBen.Picture.Assign(DM1.Jpg);
   If Trim(medni.Text) = '' Then
      btnRENIECBen.Enabled := False
   Else
      btnRENIECBen.Enabled := True;
   FirmaBen.Picture.Assign(DM1.jpgFirma);
   DM1.CargaImagenesBen(mednitut.Text);
   ImagenTut.Picture.Assign(DM1.Jpg);
   If Trim(mednitut.Text) = '' Then
      btnRENIECTut.Enabled := False
   Else
      btnRENIECTut.Enabled := True;
   FirmaTut.Picture.Assign(DM1.jpgFirma);
   inhabilitar;
End;

Procedure TFManFami.inhabilitar;
Begin
   rgbenmenedad.Enabled    := False;
   pnldni.Enabled          := False;
   pnlapepatben.Enabled    := False;
   pnlapematben.Enabled    := False;
   pnlapecas.Enabled       := False;
   pnlnomben.Enabled       := False;
   dblctiprel.Enabled      := False;
   pnlfamotrtiprel.Enabled := False;
   dbdtpfecnac.Enabled     := False;
   dblcidesex.Enabled      := False;
   pnldireccionfam.Enabled := False;
   dblcddptoid.Enabled     := False;
   dblcdProvincia.Enabled  := False;
   dblcdDistrito.Enabled   := False;
   pnltelefonofijo.Enabled := False;
   pnlmovil.Enabled        := False;
   pnlemail.Enabled        := False;
   dblcforpag.Enabled      := False;
   dblcBanco.Enabled       := False;
   dblcagegir.Enabled      := False;
   pnldnitut.Enabled       := False;
   pnlapepattut.Enabled    := False;
   pnlapemattut.Enabled    := False;
   pnlnomtut.Enabled       := False;
   btnbuscarenben.Enabled  := False;
   btnbuscarentut.Enabled  := False;
End;

Procedure TFManFami.btneditarClick(Sender: TObject);
Begin
   btnGrabar.Enabled  := True;
   btnElimina.Enabled := True;
   DM1.xCnd := 'M';
   If rgbenmenedad.ItemIndex = 0 Then HabIngDeuMen;
   If rgbenmenedad.ItemIndex = 1 Then HabIngDeuMay;

End;

Procedure TFManFami.dbdtpfecnacExit(Sender: TObject);
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
   If rgbenmenedad.ItemIndex = 0 Then
   Begin
      If edad >= 18 Then
      Begin
         MessageDlg('Beneficiario mayor de edad', mtInformation, [mbOk], 0);
         dbdtpfecnac.SetFocus;
         Exit;
      End;
   End;
   If rgbenmenedad.ItemIndex = 1 Then
   Begin
      If edad < 18 Then
      Begin
         MessageDlg('Beneficiario menor de edad', mtInformation, [mbOk], 0);
         dbdtpfecnac.SetFocus;
         Exit;
      End;
   End;
End;

Procedure TFManFami.btnEliminaClick(Sender: TObject);
Var
   xSql: String;
Begin
   If DM1.xSgr = 'F' Then
   Begin
      If MessageDlg('¿ Eliminar registro ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         xSql := 'DELETE FROM APO203 WHERE ROWID = ' + QuotedStr(DM1.cdsDFam.FieldByName('FILA').AsString);
         DM1.DCOM1.AppServer.EjecutaSQL(xSql);
         MessageDlg('Eliminación Ok', mtInformation, [mbOk], 0);
         FManFami.Close;
      End;
   End;
End;

Procedure TFManFami.dblcforpagExit(Sender: TObject);
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

Procedure TFManFami.dblcforpagChange(Sender: TObject);
Begin
   dblcBanco.Text := '';
   mebancodes.Text := '';
   dblcagegir.Text := '';
   meagegir.Text := '';
End;

procedure TFManFami.dblcddptoidChange(Sender: TObject);
Var xSql:String;
begin
  dblcdProvincia.Text := '';
  meprovinciades.Text := '';
  dblcdDistrito.Text  := '';
  medistritodes.Text  := '';
  xSql := 'SELECT CIUDID, CIUDDES FROM APO123 WHERE DPTOID = '+QuotedStr(dblcddptoid.Text)+' ORDER BY CIUDID';
  DM1.cdsProvincia.Close;
  DM1.cdsProvincia.DataRequest(xSql);
  DM1.cdsProvincia.Open;
  dblcdProvincia.Selected.Clear;
  dblcdProvincia.Selected.Add('CIUDID'#9'4'#9'Ubigeo'#9#9);
  dblcdProvincia.Selected.Add('CIUDDES'#9'23'#9'Provincia'#9#9);
end;

procedure TFManFami.dblcddptoidExit(Sender: TObject);
Var xSql:String;
begin
   If Length(trim(dblcddptoid.Text)) = 2 Then
   Begin
      If DM1.cdsDpto.Locate('DPTOID',VarArrayof([dblcddptoid.text]),[]) Then
      Begin
         medptodes.Text := DM1.cdsDpto.FieldByName('DPTODES').AsString;
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
   End;
end;

procedure TFManFami.dblcdProvinciaChange(Sender: TObject);
Var xSql:String;
begin
   dblcdDistrito.Text := '';
   medistritodes.Text := '';
   xSql := 'SELECT ZIPID, ZIPDES FROM APO122 WHERE CIUDID = '+QuotedStr(dblcdProvincia.Text)+' ORDER BY ZIPID';
   DM1.cdsDist.Close;
   DM1.cdsDist.DataRequest(xSql);
   DM1.cdsDist.Open;
   dblcdDistrito.Selected.Clear;
   dblcdDistrito.Selected.Add('ZIPID'#9'6'#9'Ubigeo'#9#9);
   dblcdDistrito.Selected.Add('ZIPDES'#9'23'#9'Distrito'#9#9);
end;

procedure TFManFami.dblcdProvinciaExit(Sender: TObject);
Var xSql:String;
begin
  If Length(trim(dblcdProvincia.Text)) = 4 Then
  Begin
     If DM1.cdsProvincia.Locate('CIUDID',VarArrayof([dblcdProvincia.text]),[]) Then
     Begin
        meprovinciades.Text := DM1.cdsProvincia.FieldByName('CIUDDES').AsString;
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
  End;
end;

procedure TFManFami.dblcdDistritoExit(Sender: TObject);
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
  End;
end;

procedure TFManFami.meemailExit(Sender: TObject);
Var xSql:String;
begin
   If Trim(meemail.Text) <> '' Then
   Begin
      xSql := 'SELECT SF_ASO_VALIDA_DIR_CORREO('+QuotedStr(Trim(meemail.Text))+') VALOR FROM DUAL';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      If DM1.cdsQry.FieldByName('VALOR').AsInteger <> 0 Then
      Begin
         MessageDlg('Email no valido, o debe dejar en blanco.', mtInformation, [mbOk], 0);
         meemail.SetFocus;
      End;
   End;
end;

procedure TFManFami.memovilKeyPress(Sender: TObject; var Key: Char);
Begin
   If Not (Key In ['0'..'9','.',#8]) Then
   Begin
      Key:=#0;
      MessageDlg('Introduzca solo números.', mtError, [mbOk], 0);
   End;
end;

procedure TFManFami.memovilExit(Sender: TObject);
begin
  If Trim(memovil.Text) = '' Then Exit;
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

procedure TFManFami.medniKeyPress(Sender: TObject; var Key: Char);
begin
   If Key In [' ','°', '|', '!', '"', '#', '$', '%', '&', '/', '(', ')', '=', '?', '\', '¡', '¿', '@', '¨', '´', '*', '+', '~', '~', '[', ']', '{', '}', '^', '`', '<', '>', ';', ',', ':', '''', '-', '_',chr(39)] Then
      Key := #0;
end;

procedure TFManFami.btnbuscarenbenClick(Sender: TObject);
Var xSql, xEstCiv, xSexo, xgrains, xrestriccion:String;
    xFirma, xFoto, ubigeodom, ubigeonac: String;
begin
   If Length(trim(medni.Text)) <> 8 Then
   Begin
     MessageDlg('DNI Incorrecto...', mtError, [mbOk], 0);
     Exit;
   End;
   xSql := 'SELECT DNI, NUMLIB, APEPAT, APEMAT, NOMBRE, OTRDOC, LUGNAC, NOMPAD, NOMMAD, FECNAC, ESTATURA, SEXO, ESTCIV, GRAINS, LUGDOM,'
   +' RESTRICCIONES, FECINS, STAVOT, FECEMIDOC, DIRECCION, FOTO, FIRMA, USUACT, FECACT, OFIACT, EQUUSU, FLAG_EXPIRA, UNICO, APECAS,'
   +' CODUBIDEPNAC, DESDEPNAC, CODUBIPRONAC, DESPRONAC, CODUBIDISNAC, DESDISNAC, CODGRAINS, CODESTCIV, CODDOCSUS, NUMDOCSUS, FLACONVOT,'
   +' CODRES, FECEXP, CODUBIDEPDOM, DESDEPDOM, CODUBIPRODOM, DESPRODOM, CODUBIDISDOM, DESDISDOM, PRECODDIRECC, PREDESDIRECC, DESDIRECC,'
   +' NUMDIRECC, DESETAPA, DESMANZA, DESLOTE, PRECODBLOCK, PREDESBLOCK, DESBLOCK, PRECODINTER, PREDESINTER, DESINTER, PRECODURBAN,'
   +' PREDESURBAN, DESURBAN, USURENIEC FROM PRE_INF_RENIEC WHERE DNI = '+QuotedStr(medni.Text);
   DM1.cdsQry22.Close;
   DM1.cdsQry22.DataRequest(xSql);
   DM1.cdsQry22.Open;
   If DM1.cdsQry22.RecordCount = 0 Then
   Begin
      Try
         ActDatReniec(trim(medni.Text));
         If Reg.dcGender = '1' Then
         Begin
            xEstCiv := DM1.CrgDescrip('ESTCIVID='+QuotedStr(DM1.StrZero(reg.dcCivilState,2)),'TGE125','ESTCIVDES');
            xSexo := 'M';
         End
         Else
         Begin
            xEstCiv := DM1.CrgDescrip('ESTCIVID='+QuotedStr(DM1.StrZero(reg.dcCivilState,2)),'TGE125','ESTCIVDESFEM');
            xSexo := 'F';
         End;
         ubigeonac := DM1.DevUbigeo(reg.dcBornDepartment, reg.dcBornProvince, reg.dcBornDistrit);
         ubigeodom := DM1.DevUbigeo(reg.dcDepartmentAddress, reg.dcProvinceAddress, reg.dcDistritAddress);
         xgrains := DM1.CrgDescrip('CODGRAINS='+QuotedStr(reg.dcInstGrade),'ASO_GRA_INS','DESGRAINS');
         If Trim(reg.dcRestrictionCode) = '' Then xrestriccion := 'NINGUNO';
         If reg.dcRestrictionCode = 'A' Then xrestriccion := 'FALLECIMIENTO';
         xsql := 'INSERT INTO PRE_INF_RENIEC (DNI, APEPAT, APEMAT, NOMBRE, NOMPAD, NOMMAD, FECNAC, ESTATURA,SEXO, ESTCIV,  FECINS, FECEMIDOC, FECACT,'
         +' OFIACT,EQUUSU, USUACT, LUGNAC, LUGDOM, FECEXP, CODUBIDEPDOM, CODUBIPRODOM, CODUBIDISDOM, DESDEPDOM, DESPRODOM, DESDISDOM, CODUBIDEPNAC,'
         +' CODUBIPRONAC, CODUBIDISNAC, DESDEPNAC, DESPRONAC, DESDISNAC, APECAS, PRECODDIRECC, PREDESDIRECC, DESDIRECC, NUMDIRECC, DESMANZA, DESLOTE,'
         +' DESETAPA, PRECODBLOCK, PREDESBLOCK, DESBLOCK, PRECODINTER, PREDESINTER, DESINTER, PRECODURBAN, PREDESURBAN, DESURBAN, CODGRAINS, CODDOCSUS,'
         +' NUMDOCSUS, FLACONVOT, CODRES, CODESTCIV, OTRDOC, GRAINS, RESTRICCIONES,USURENIEC, UBIGEODOM_DER, UBIGEONAC_DER)'
         + ' VALUES ('
         + QuotedStr(Trim(reg.dcDocument))+ ','+ QuotedStr(Trim(reg.dcLastName1))+ ',' + QuotedStr(Trim(reg.dcLastName2))+ ','+ QuotedStr(Trim(reg.dcFirstName))+ ','
         + QuotedStr(Trim(reg.dcFatherName))+','+QuotedStr(Trim(reg.dcMotherName))+','
         + QuotedStr(Copy(reg.dcBornDate,7,2)+'/'+Copy(reg.dcBornDate,5,2)+'/'+Copy(reg.dcBornDate,1,4))+ ','
         + FloatToStrF(reg.dnHeight/100,ffNumber,5,2)+','+QuotedStr(xSexo)+','+ QuotedStr(xEstCiv)+ ','
         + QuotedStr(Copy(reg.dcRegisterDate,7,2)+'/'+Copy(reg.dcRegisterDate,5,2)+'/'+Copy(reg.dcRegisterDate,1,4))+ ','
         + QuotedStr(Copy(reg.dcExpeditionDate,7,2)+'/'+Copy(reg.dcExpeditionDate,5,2)+'/'+Copy(reg.dcExpeditionDate,1,4))+','
         + 'SYSDATE,'
         + QuotedStr(Trim(DM1.wofides))+ ','
         + QuotedStr(Trim(DM1.wcomputadora)) + ','
         + QuotedStr(Trim(DM1.wUsuario))+','
         + QuotedStr(Trim(reg.dcBornDepartment)+', '+Trim(reg.dcBornProvince)+', '+Trim(reg.dcBornDistrit))+','
         + QuotedStr(Trim(reg.dcDepartmentAddress)+', '+Trim(reg.dcProvinceAddress)+', '+Trim(reg.dcDistritAddress))+','
         + QuotedStr(Copy(reg.dcExpirationDate,7,2)+'/'+Copy(reg.dcExpirationDate,5,2)+'/'+Copy(reg.dcExpirationDate,1,4))+','
         + QuotedStr(Trim(reg.dcAddDepUbigCode))+', '+QuotedStr(Trim(reg.dcAddProvUbigCode))+', '+QuotedStr(Trim(reg.dcAddDistUbigCode))+','
         + QuotedStr(Trim(reg.dcDepartmentAddress))+','+QuotedStr(Trim(reg.dcProvinceAddress))+','+QuotedStr(Trim(reg.dcDistritAddress))+','
         + QuotedStr(Trim(reg.dcBornDepartmentUbigCode))+','+QuotedStr(Trim(reg.dcBonrProvinceUbigCode))+','+QuotedStr(Trim(reg.dcBonrDistritUbigCode))+','
         + QuotedStr(Trim(reg.dcBornDepartment))+','+QuotedStr(Trim(reg.dcBornProvince))+','+QuotedStr(Trim(reg.dcBornDistrit))+','+QuotedStr(Trim(reg.dcMerriedName))+','
         + QuotedStr(Trim(reg.dcAddPrefix))+','+QuotedStr(Trim(reg.dcAddPrefixDes))+','+QuotedStr(Trim(reg.dcAddress))+','+QuotedStr(Trim(reg.dcAddressNumber))+','
         + QuotedStr(Trim(reg.dcAddressMz))+','+QuotedStr(Trim(reg.dcAddressLt))+','+QuotedStr(Trim(reg.dcAddressEt))+','
         + QuotedStr(Trim(reg.dcAddressBlockPrefix))+','+QuotedStr(Trim(reg.dcAddressBlockPrefixDes))+','+QuotedStr(Trim(reg.dcAddressBlockPrefixDes))+','
         + QuotedStr(Trim(reg.dcAddressIntPrefix))+','+QuotedStr(Trim(reg.dcAddressIntPrefixDes))+','+QuotedStr(Trim(reg.dcAddressInterior))+','
         + QuotedStr(Trim(reg.dcAddressUrbPrefix))+','+QuotedStr(Trim(reg.dcAddressUrbPrefixDes))+','+QuotedStr(Trim(reg.dcAddressUrb))+','
         + QuotedStr(Trim(reg.dcInstGrade))+','+QuotedStr(Trim(reg.dcAltDocumentType))+','+QuotedStr(Trim(reg.dcAltDocument))+', '
         + QuotedStr(Trim(reg.dcVoteStatus))+','+QuotedStr(Trim(reg.dcRestrictionCode))+', '
         + QuotedStr(reg.dcCivilState)+', '
         + QuotedStr(Trim(reg.dcAltDocument))+', '
         + QuotedStr(xgrains)+', '
         + QuotedStr(reg.dcRestrictionDes)+','
         + QuotedStr(xusuRENIEC)+','
         + QuotedStr(ubigeodom)+','
         + QuotedStr(ubigeonac)
         + ')';
         DM1.DCOM1.AppServer.EjecutaSql(xsql);
         // Presentar foto y firma
         xFoto  := '_Fot'+Trim(medni.Text);
         xFirma := '_Fir'+Trim(medni.Text);
         Grabar_Imagen(xFoto, 'JPG', reg.photo);
         Leer_Imagen(xFoto, 'JPG', ImagenBen);
         Grabar_Imagen(xFirma, 'TIF', reg.Signature);
         OpenPictureDialog1.Filter:='All images ('+BitmapLoaders.GetLoadFilter;
         With TLinearBitmap.Create do
         Try
            FirmaBen.Picture := nil;
            LoadFromFile('C:\SOLEXES\'+xFirma+'.TIF');
            AssignTo(Firmaben.Picture.Bitmap);
         Finally
            Free;
         End;
         // Grabar firma de TIF a JPG
         With TLinearBitmap.Create do
         Try
            Assign(FirmaBen.Picture.Bitmap);
            SaveToFile('C:\SOLEXES\'+xFirma+'.JPG');
         Finally
            Free;
         End;
         CargaMemStreamImg(medni.Text);
         GrabafotoAtabla(Trim(medni.Text));
      Finally
         Screen.Cursor := crDefault;
      End;
   End;
   MostrarDatosReniecBen (Trim(medni.Text));
   dblctiprel.SetFocus;
end;

function TFManFami.ActDatReniec(xAsoDni: STRING): Boolean;
Var
   lin: integer;
   arr: CPersonDataMember2;
begin
   xusuRENIEC := 'JRODRIGUEZ';
   Try
      Reg := ISipObj.FindByDocument(5,0,xusuRENIEC,xAsoDni);
   Except On E: Exception Do
      Begin
         MessageDlg(DM1.DevuelveValor('ASO_ERR_REN', 'DESERR', 'CODERR', Reg.dcResultCode), mtError, [mbOk], 0);
         Exit;
      End;
   End;
   result := true;
end;

procedure TFManFami.FormCreate(Sender: TObject);
begin
   Try
      ISipObj := GetISIPService(false,K_URL_WEB_SERVICE);
   Except On E: Exception Do
      Begin
         showmessage('Existe un problema de conexión al Web Service, comuníquese con Helpdesk ('+E.Message+')');
      End;
   End;
end;

Procedure TFManFami.CargaMemStreamImg(xdni:String);
Begin
   DM1.Jpg    := Nil;
   DM1.Stream := Nil;
   DM1.jpg    := TJPEGImage.Create;
   DM1.Stream := TMemoryStream.Create;
   DM1.Stream.Position := 0;
   DM1.Jpg.LoadFromStream(DM1.Stream);
   DM1.jpg.LoadFromFile('C:\Solexes\_Fot'+Trim(xdni)+'.JPG');
   DM1.Stream := TMemoryStream.Create;
   DM1.Jpg.SaveToStream(DM1.Stream);
   DM1.Stream.Position := 0;
   DM1.JpgFirma    := Nil;
   DM1.StreamFirma := Nil;
   DM1.jpgFirma    := TJPEGImage.Create;
   DM1.StreamFirma := TMemoryStream.Create;
   DM1.StreamFirma.Position := 0;
   DM1.jpgFirma.LoadFromStream(DM1.StreamFirma);
   DM1.jpgFirma.LoadFromFile('C:\Solexes\_Fir'+Trim(xdni)+'.JPG');
   DM1.StreamFirma := TMemoryStream.Create;
   DM1.jpgFirma.SaveToStream(DM1.StreamFirma);
   DM1.StreamFirma.Position := 0;
End;

PROCEDURE TFManFami.GrabafotoAtabla(xDni: STRING);
VAR
   xSql: STRING;
BEGIN
   xSql := 'SELECT DNI, FOTO, FIRMA FROM PRE_INF_RENIEC WHERE DNI = ''' + TRIM(xDni) + ''' ORDER BY FECACT DESC';
   DM1.cdsParam.Close;
   DM1.cdsParam.DataRequest(xSql);
   DM1.cdsParam.Open;
   IF DM1.cdsParam.RecordCount > 0 THEN
   BEGIN
      DM1.cdsParam.Edit;
      TBlobField(DM1.cdsParam.FieldByName('Foto')).LoadFromStream(DM1.Stream);
      TBlobField(DM1.cdsParam.FieldByName('Firma')).LoadFromStream(DM1.StreamFirma);
      DM1.cdsParam.ApplyUpdates(-1);
   END;
END;

procedure TFManFami.MostrarDatosReniecBen(xDni: STRING);
Var xSql:String;
begin
   xSql := 'SELECT DNI, NUMLIB, APEPAT, APEMAT, NOMBRE, OTRDOC, LUGNAC, NOMPAD, NOMMAD, FECNAC, ESTATURA, SEXO, ESTCIV, GRAINS, LUGDOM, RESTRICCIONES,'
   +' FECINS, STAVOT, FECEMIDOC, DIRECCION, FOTO, FIRMA, USUACT, FECACT, OFIACT, EQUUSU, FLAG_EXPIRA, UNICO, APECAS, CODUBIDEPNAC, DESDEPNAC, CODUBIPRONAC,'
   +' DESPRONAC, CODUBIDISNAC, DESDISNAC, CODGRAINS, CODESTCIV, CODDOCSUS, NUMDOCSUS, FLACONVOT, CODRES, FECEXP, CODUBIDEPDOM, DESDEPDOM, CODUBIPRODOM,'
   +' DESPRODOM, CODUBIDISDOM, DESDISDOM, PRECODDIRECC, PREDESDIRECC, DESDIRECC, NUMDIRECC, DESETAPA, DESMANZA, DESLOTE, PRECODBLOCK, PREDESBLOCK, DESBLOCK,'
   +' PRECODINTER, PREDESINTER, DESINTER, PRECODURBAN, PREDESURBAN, DESURBAN, USURENIEC, UBIGEODOM_DER, UBIGEONAC_DER'
   +' FROM PRE_INF_RENIEC WHERE DNI = '+QuotedStr(Trim(xDni));
   DM1.cdsQry22.Close;
   DM1.cdsQry22.DataRequest(xSql);
   DM1.cdsQry22.Open;
   meapepatben.Text := DM1.cdsQry22.FieldByName('APEPAT').AsString;
   meapematben.Text := DM1.cdsQry22.FieldByName('APEMAT').AsString;
   meapecas.Text := DM1.cdsQry22.FieldByName('APECAS').AsString;
   menomben.Text := DM1.cdsQry22.FieldByName('NOMBRE').AsString;
   dbdtpfecnac.Date := DM1.cdsQry22.FieldByName('FECNAC').AsDateTime;
   dblcidesex.Text := DM1.cdsQry22.FieldByName('SEXO').AsString;
   medireccionfam.Text := DM1.DevDesDirecc(xDni);
   dblcddptoid.Text := Copy(DM1.cdsQry22.FieldByName('UBIGEODOM_DER').AsString,1,2);
   medptodes.Text := DM1.CrgDescrip('DPTOID = '+QuotedStr(Copy(DM1.cdsQry22.FieldByName('UBIGEODOM_DER').AsString, 1, 2)), 'APO158', 'DPTODES');
   dblcdProvincia.Text := Copy(DM1.cdsQry22.FieldByName('UBIGEODOM_DER').AsString,1,4);
   meprovinciades.Text := DM1.CrgDescrip('CIUDID = '+QuotedStr(Copy(DM1.cdsQry22.FieldByName('UBIGEODOM_DER').AsString, 1, 4)),   'APO123', 'CIUDDES');
   dblcdDistrito.Text := DM1.cdsQry22.FieldByName('UBIGEODOM_DER').AsString;
   medistritodes.Text := DM1.CrgDescrip('ZIPID = '+QuotedStr(DM1.cdsQry22.FieldByName('UBIGEODOM_DER').AsString), 'APO122', 'ZIPDES');
   DM1.CargaImagenesBen(xDni);
   ImagenBen.Picture.Assign(DM1.Jpg);
   If Trim(xDni) = '' Then
      btnRENIECBen.Enabled := False
   Else
      btnRENIECBen.Enabled := True;
   FirmaBen.Picture.Assign(DM1.jpgFirma);
end;

procedure TFManFami.btnbuscarentutClick(Sender: TObject);
Var
   xSql, xEstCiv, xSexo, ubigeonac, ubigeodom, xgrains, xrestriccion, xFoto, xFirma:String;
begin
   If Length(trim(mednitut.Text)) <> 8 Then
   Begin
      MessageDlg('DNI Incorrecto...', mtError, [mbOk], 0);
      Exit;
   End;
   xSql := 'SELECT DNI, NUMLIB, APEPAT, APEMAT, NOMBRE, OTRDOC, LUGNAC, NOMPAD, NOMMAD, FECNAC, ESTATURA, SEXO, ESTCIV, GRAINS, LUGDOM,'
   +' RESTRICCIONES, FECINS, STAVOT, FECEMIDOC, DIRECCION, FOTO, FIRMA, USUACT, FECACT, OFIACT, EQUUSU, FLAG_EXPIRA, UNICO, APECAS,'
   +' CODUBIDEPNAC, DESDEPNAC, CODUBIPRONAC, DESPRONAC, CODUBIDISNAC, DESDISNAC, CODGRAINS, CODESTCIV, CODDOCSUS, NUMDOCSUS, FLACONVOT,'
   +' CODRES, FECEXP, CODUBIDEPDOM, DESDEPDOM, CODUBIPRODOM, DESPRODOM, CODUBIDISDOM, DESDISDOM, PRECODDIRECC, PREDESDIRECC, DESDIRECC,'
   +' NUMDIRECC, DESETAPA, DESMANZA, DESLOTE, PRECODBLOCK, PREDESBLOCK, DESBLOCK, PRECODINTER, PREDESINTER, DESINTER, PRECODURBAN,'
   +' PREDESURBAN, DESURBAN, USURENIEC FROM PRE_INF_RENIEC WHERE DNI = '+QuotedStr(mednitut.Text);
   DM1.cdsQry23.Close;
   DM1.cdsQry23.Close;
   DM1.cdsQry23.DataRequest(xSql);
   DM1.cdsQry23.Open;
   If DM1.cdsQry23.RecordCount = 0 Then
   Begin
      Try
         ActDatReniec(trim(mednitut.Text));
         If Reg.dcGender = '1' Then
         Begin
            xEstCiv := DM1.CrgDescrip('ESTCIVID='+QuotedStr(DM1.StrZero(reg.dcCivilState,2)),'TGE125','ESTCIVDES');
            xSexo := 'M';
         End
         Else
         Begin
            xEstCiv := DM1.CrgDescrip('ESTCIVID='+QuotedStr(DM1.StrZero(reg.dcCivilState,2)),'TGE125','ESTCIVDESFEM');
            xSexo := 'F';
         End;
         ubigeonac := DM1.DevUbigeo(reg.dcBornDepartment, reg.dcBornProvince, reg.dcBornDistrit);
         ubigeodom := DM1.DevUbigeo(reg.dcDepartmentAddress, reg.dcProvinceAddress, reg.dcDistritAddress);
         xgrains := DM1.CrgDescrip('CODGRAINS='+QuotedStr(reg.dcInstGrade),'ASO_GRA_INS','DESGRAINS');
         If Trim(reg.dcRestrictionCode) = '' Then xrestriccion := 'NINGUNO';
         If reg.dcRestrictionCode = 'A' Then xrestriccion := 'FALLECIMIENTO';
         xsql := 'INSERT INTO PRE_INF_RENIEC (DNI, APEPAT, APEMAT, NOMBRE, NOMPAD, NOMMAD, FECNAC, ESTATURA,SEXO, ESTCIV,  FECINS, FECEMIDOC, FECACT,'
         +' OFIACT,EQUUSU, USUACT, LUGNAC, LUGDOM, FECEXP, CODUBIDEPDOM, CODUBIPRODOM, CODUBIDISDOM, DESDEPDOM, DESPRODOM, DESDISDOM, CODUBIDEPNAC,'
         +' CODUBIPRONAC, CODUBIDISNAC, DESDEPNAC, DESPRONAC, DESDISNAC, APECAS, PRECODDIRECC, PREDESDIRECC, DESDIRECC, NUMDIRECC, DESMANZA, DESLOTE,'
         +' DESETAPA, PRECODBLOCK, PREDESBLOCK, DESBLOCK, PRECODINTER, PREDESINTER, DESINTER, PRECODURBAN, PREDESURBAN, DESURBAN, CODGRAINS, CODDOCSUS,'
         +' NUMDOCSUS, FLACONVOT, CODRES, CODESTCIV, OTRDOC, GRAINS, RESTRICCIONES,USURENIEC, UBIGEODOM_DER, UBIGEONAC_DER)'
         + ' VALUES ('
         + QuotedStr(Trim(reg.dcDocument))+ ','+ QuotedStr(Trim(reg.dcLastName1))+ ',' + QuotedStr(Trim(reg.dcLastName2))+ ','+ QuotedStr(Trim(reg.dcFirstName))+ ','
         + QuotedStr(Trim(reg.dcFatherName))+','+QuotedStr(Trim(reg.dcMotherName))+','
         + QuotedStr(Copy(reg.dcBornDate,7,2)+'/'+Copy(reg.dcBornDate,5,2)+'/'+Copy(reg.dcBornDate,1,4))+ ','
         + FloatToStrF(reg.dnHeight/100,ffNumber,5,2)+','+QuotedStr(xSexo)+','+ QuotedStr(xEstCiv)+ ','
         + QuotedStr(Copy(reg.dcRegisterDate,7,2)+'/'+Copy(reg.dcRegisterDate,5,2)+'/'+Copy(reg.dcRegisterDate,1,4))+ ','
         + QuotedStr(Copy(reg.dcExpeditionDate,7,2)+'/'+Copy(reg.dcExpeditionDate,5,2)+'/'+Copy(reg.dcExpeditionDate,1,4))+','
         + 'SYSDATE,'
         + QuotedStr(Trim(DM1.wofides))+ ','
         + QuotedStr(Trim(DM1.wcomputadora)) + ','
         + QuotedStr(Trim(DM1.wUsuario))+','
         + QuotedStr(Trim(reg.dcBornDepartment)+', '+Trim(reg.dcBornProvince)+', '+Trim(reg.dcBornDistrit))+','
         + QuotedStr(Trim(reg.dcDepartmentAddress)+', '+Trim(reg.dcProvinceAddress)+', '+Trim(reg.dcDistritAddress))+','
         + QuotedStr(Copy(reg.dcExpirationDate,7,2)+'/'+Copy(reg.dcExpirationDate,5,2)+'/'+Copy(reg.dcExpirationDate,1,4))+','
         + QuotedStr(Trim(reg.dcAddDepUbigCode))+', '+QuotedStr(Trim(reg.dcAddProvUbigCode))+', '+QuotedStr(Trim(reg.dcAddDistUbigCode))+','
         + QuotedStr(Trim(reg.dcDepartmentAddress))+','+QuotedStr(Trim(reg.dcProvinceAddress))+','+QuotedStr(Trim(reg.dcDistritAddress))+','
         + QuotedStr(Trim(reg.dcBornDepartmentUbigCode))+','+QuotedStr(Trim(reg.dcBonrProvinceUbigCode))+','+QuotedStr(Trim(reg.dcBonrDistritUbigCode))+','
         + QuotedStr(Trim(reg.dcBornDepartment))+','+QuotedStr(Trim(reg.dcBornProvince))+','+QuotedStr(Trim(reg.dcBornDistrit))+','+QuotedStr(Trim(reg.dcMerriedName))+','
         + QuotedStr(Trim(reg.dcAddPrefix))+','+QuotedStr(Trim(reg.dcAddPrefixDes))+','+QuotedStr(Trim(reg.dcAddress))+','+QuotedStr(Trim(reg.dcAddressNumber))+','
         + QuotedStr(Trim(reg.dcAddressMz))+','+QuotedStr(Trim(reg.dcAddressLt))+','+QuotedStr(Trim(reg.dcAddressEt))+','
         + QuotedStr(Trim(reg.dcAddressBlockPrefix))+','+QuotedStr(Trim(reg.dcAddressBlockPrefixDes))+','+QuotedStr(Trim(reg.dcAddressBlockPrefixDes))+','
         + QuotedStr(Trim(reg.dcAddressIntPrefix))+','+QuotedStr(Trim(reg.dcAddressIntPrefixDes))+','+QuotedStr(Trim(reg.dcAddressInterior))+','
         + QuotedStr(Trim(reg.dcAddressUrbPrefix))+','+QuotedStr(Trim(reg.dcAddressUrbPrefixDes))+','+QuotedStr(Trim(reg.dcAddressUrb))+','
         + QuotedStr(Trim(reg.dcInstGrade))+','+QuotedStr(Trim(reg.dcAltDocumentType))+','+QuotedStr(Trim(reg.dcAltDocument))+', '
         + QuotedStr(Trim(reg.dcVoteStatus))+','+QuotedStr(Trim(reg.dcRestrictionCode))+', '
         + QuotedStr(reg.dcCivilState)+', '
         + QuotedStr(Trim(reg.dcAltDocument))+', '
         + QuotedStr(xgrains)+', '
         + QuotedStr(reg.dcRestrictionDes)+','
         + QuotedStr(xusuRENIEC)+','
         + QuotedStr(ubigeodom)+','
         + QuotedStr(ubigeonac)
         + ')';
         DM1.DCOM1.AppServer.EjecutaSql(xsql);
         // Presentar foto y firma
         xFoto  := '_Fot'+Trim(mednitut.Text);
         xFirma := '_Fir'+Trim(mednitut.Text);
         Grabar_Imagen(xFoto, 'JPG', reg.photo);
         Leer_Imagen(xFoto, 'JPG', ImagenBen);
         Grabar_Imagen(xFirma, 'TIF', reg.Signature);
         OpenPictureDialog1.Filter:='All images ('+BitmapLoaders.GetLoadFilter;
         With TLinearBitmap.Create do
         Try
            FirmaTut.Picture := nil;
            LoadFromFile('C:\SOLEXES\'+xFirma+'.TIF');
            AssignTo(FirmaTut.Picture.Bitmap);
         Finally
            Free;
         End;
         // Grabar firma de TIF a JPG
         With TLinearBitmap.Create do
         Try
            Assign(FirmaTut.Picture.Bitmap);
            SaveToFile('C:\SOLEXES\'+xFirma+'.JPG');
         Finally
            Free;
         End;
         CargaMemStreamImg(mednitut.Text);
         GrabafotoAtabla(Trim(mednitut.Text));
      Finally
         Screen.Cursor := crDefault;
      End;
   End;
   MostrarDatosReniecTut(Trim(mednitut.Text));
   ImagenBen.Picture    := nil;
   FirmaBen.Picture     := nil;
end;

procedure TFManFami.MostrarDatosReniecTut(xDni: STRING);
Var xSql:String;
begin
   xSql := 'SELECT DNI, NUMLIB, APEPAT, APEMAT, NOMBRE, OTRDOC, LUGNAC, NOMPAD, NOMMAD, FECNAC, ESTATURA, SEXO, ESTCIV, GRAINS, LUGDOM, RESTRICCIONES,'
   +' FECINS, STAVOT, FECEMIDOC, DIRECCION, FOTO, FIRMA, USUACT, FECACT, OFIACT, EQUUSU, FLAG_EXPIRA, UNICO, APECAS, CODUBIDEPNAC, DESDEPNAC, CODUBIPRONAC,'
   +' DESPRONAC, CODUBIDISNAC, DESDISNAC, CODGRAINS, CODESTCIV, CODDOCSUS, NUMDOCSUS, FLACONVOT, CODRES, FECEXP, CODUBIDEPDOM, DESDEPDOM, CODUBIPRODOM,'
   +' DESPRODOM, CODUBIDISDOM, DESDISDOM, PRECODDIRECC, PREDESDIRECC, DESDIRECC, NUMDIRECC, DESETAPA, DESMANZA, DESLOTE, PRECODBLOCK, PREDESBLOCK, DESBLOCK,'
   +' PRECODINTER, PREDESINTER, DESINTER, PRECODURBAN, PREDESURBAN, DESURBAN, USURENIEC, UBIGEODOM_DER, UBIGEONAC_DER'
   +' FROM PRE_INF_RENIEC WHERE DNI = '+QuotedStr(Trim(xDni));
   DM1.cdsQry23.Close;
   DM1.cdsQry23.DataRequest(xSql);
   DM1.cdsQry23.Open;
   meapepattut.Text := DM1.cdsQry23.FieldByName('APEPAT').AsString;
   meapemattut.Text := DM1.cdsQry23.FieldByName('APEMAT').AsString;
   menomtut.Text    := DM1.cdsQry23.FieldByName('NOMBRE').AsString;
   DM1.CargaImagenesBen(xDni);
   ImagenTut.Picture.Assign(DM1.Jpg);
   If Trim(xDni) = '' Then
      btnRENIECTut.Enabled := False
   Else
      btnRENIECTut.Enabled := True;
   FirmaTut.Picture.Assign(DM1.jpgFirma);
end;

procedure TFManFami.ImpImagenes(xdni: String);
Var xSql:String;
begin
   xSql := 'SELECT DNI, NUMLIB, APEPAT, APEMAT, NOMBRE, OTRDOC, LUGNAC, NOMPAD, NOMMAD, FECNAC, ESTATURA, CODUBIDEPDOM, CODUBIPRODOM,'
   +' CODUBIDISDOM, DESDEPDOM, DESPRODOM, DESDISDOM, CODUBIDEPNAC, CODUBIPRONAC, CODUBIDISNAC, DESDEPNAC, DESPRONAC, DESDISNAC,'
   +' APECAS, PRECODDIRECC, PREDESDIRECC, DESDIRECC, NUMDIRECC, DESETAPA, DESMANZA, DESLOTE, PRECODBLOCK, PREDESBLOCK, DESBLOCK,'
   +' PRECODINTER, PREDESINTER, DESINTER, PRECODURBAN, PREDESURBAN, DESURBAN, CODDOCSUS, FLACONVOT, CODRES, CODGRAINS, NUMDOCSUS,'
   +' CODESTCIV, SEXO, ESTCIV, GRAINS, LUGDOM, RESTRICCIONES, FECINS, STAVOT, FECEMIDOC, DIRECCION, FOTO, FIRMA, USUACT, FECACT, FECEXP,'
   +' OFIACT, EQUUSU, UNICO, CASE WHEN FECEXP >= SYSDATE THEN ''VIGENTE'' ELSE ''CADUCADO'' END FLAG_EXPIRA'
   +' FROM PRE_INF_RENIEC'
   +' WHERE DNI = '+QuotedStr(Trim(xdni))
   +' AND FOTO IS NOT NULL'
   +' AND (FECEMIDOC IN (SELECT MAX(FECEMIDOC) FROM PRE_INF_RENIEC WHERE DNI = '+QuotedStr(Trim(xdni))+'))';
   DM1.cdsParam.Close;
   DM1.cdsParam.DataRequest(XSQL);
   DM1.cdsParam.Open;

   DM1.CargaImagenesBen(xdni);
   ppFoto.Picture.Assign(DM1.JPG);
   ppFirma.Picture.Assign(DM1.jpgFirma);

   pplDocAltRepRen.Caption := DM1.cdsParam.FieldByName('CODDOCSUS').AsString+' '+DM1.CrgDescrip('CODDOCSUS='+QuotedStr(DM1.cdsParam.FieldByName('CODDOCSUS').AsString),'ASO_DOC_SUS','DESDOCSUS');
   pplEstCivRepRen.Caption := DM1.cdsParam.FieldByName('CODESTCIV').AsString+' '+DM1.cdsParam.FieldByName('ESTCIV').AsString;
   If DM1.cdsParam.FieldByName('SEXO').AsString = 'M' Then
      pplSexoRepRen.Caption   := 'M MASCULINO'
   Else
      pplSexoRepRen.Caption   := 'F FEMENINO';
   pplEstVotRepRen.Caption := DM1.cdsParam.FieldByName('FLACONVOT').AsString+' '+DM1.CrgDescrip('CODESTVOT='+QuotedStr(DM1.cdsParam.FieldByName('FLACONVOT').AsString),'ASO_COD_EST_VOT','DESESTVOT');
   pplGraInsRepRen.Caption := DM1.cdsParam.FieldByName('CODGRAINS').AsString+' '+DM1.cdsParam.FieldByName('GRAINS').AsString;
   If Trim(DM1.cdsParam.FieldByName('CODRES').AsString) = '' Then
       pplResRepRen.Caption := 'X-NINGUNO'
   Else
       pplResRepRen.Caption := DM1.cdsParam.FieldByName('CODRES').AsString+' '+DM1.cdsParam.FieldByName('RESTRICCIONES').AsString;
   pplLugDomRepRen.Caption := DM1.cdsParam.FieldByName('LUGDOM').AsString;
   pplPreUrbImpRen.Caption := DM1.cdsParam.FieldByName('PRECODURBAN').AsString+' '+DM1.cdsParam.FieldByName('PREDESURBAN').AsString;
   pplPreUrbImpRen.Caption := DM1.cdsParam.FieldByName('PRECODURBAN').AsString+' '+DM1.cdsParam.FieldByName('PREDESURBAN').AsString;
   pplDesUrbImpRen.Caption := DM1.cdsParam.FieldByName('DESURBAN').AsString;
   pplPreDirImpRen.Caption := DM1.cdsParam.FieldByName('PRECODDIRECC').AsString+' '+DM1.cdsParam.FieldByName('PREDESDIRECC').AsString;
   pplDesDirImpRen.Caption := DM1.cdsParam.FieldByName('DESDIRECC').AsString;
   pplNumDirImpRen.Caption := DM1.cdsParam.FieldByName('NUMDIRECC').AsString;
   pplEtaDirImpRen.Caption := DM1.cdsParam.FieldByName('DESETAPA').AsString;
   pplPreBloImpRen.Caption := DM1.cdsParam.FieldByName('PRECODBLOCK').AsString+' '+DM1.cdsParam.FieldByName('PREDESBLOCK').AsString;
   pplDesBloImpRen.Caption := DM1.cdsParam.FieldByName('DESBLOCK').AsString;
   pplPreIntImpren.Caption := DM1.cdsParam.FieldByName('PRECODINTER').AsString+' '+DM1.cdsParam.FieldByName('PREDESINTER').AsString;
   pplDesIntImpRen.Caption := DM1.cdsParam.FieldByName('DESINTER').AsString;
   pplManImpren.Caption := DM1.cdsParam.FieldByName('DESMANZA').AsString;
   pplLotImpren.Caption := DM1.cdsParam.FieldByName('DESLOTE').AsString;
   ppRReniec.Print;
   ppRReniec.Stop;
end;

procedure TFManFami.btnRENIECBenClick(Sender: TObject);
begin
   ImpImagenes(Trim(medni.Text));
end;

procedure TFManFami.btnRENIECTutClick(Sender: TObject);
begin
   ImpImagenes(Trim(mednitut.Text));
end;

procedure TFManFami.Inicializa;
begin
   dblctiprel.Enabled      := True;
   pnlfamotrtiprel.Enabled := False;
   pnldni.Enabled          := False;
   btnbuscarenben.Enabled  := False;
   pnlapepatben.Enabled    := False;
   pnlapematben.Enabled    := False;
   pnlApeCas.Enabled       := False;
   pnlnomben.Enabled       := False;
   dbdtpfecnac.Enabled     := False;
   dblcidesex.Enabled      := False;
   pnldireccionfam.Enabled := False;
   dblcddptoid.Enabled     := False;
   dblcdProvincia.Enabled  := False;
   dblcdDistrito.Enabled   := False;
   pnltelefonofijo.Enabled := False;
   pnlmovil.Enabled        := False;
   pnlemail.Enabled        := False;
   dblcforpag.Enabled      := False;
   dblcBanco.Enabled       := False;
   dblcagegir.Enabled      := False;
   btnbuscarentut.Enabled  := False;
   pnlapepattut.Enabled    := False;
   pnlapemattut.Enabled    := False;
   pnlnomtut.Enabled       := False;
   ImagenBen.Enabled       := False;
   FirmaBen.Enabled        := False;
   btnRENIECBen.Enabled    := False;
   ImagenTut.Enabled       := False;
   FirmaTut.Enabled        := False;
   btnRENIECTut.Enabled    := False;
end;

procedure TFManFami.HabIngDeuMay;
begin
   mednitut.Text           := '';
   meapepattut.Text        := '';
   meapemattut.Text        := '';
   menomtut.Text           := '';
   ImagenTut.Picture       := nil;
   FirmaTut.Picture        := nil;
   rgbenmenedad.Enabled    := True;
   pnldni.Enabled          := True;
   medni.Color             := clWindow;
   dblctiprel.Enabled      := True;
   dblctiprel.Color        := clWindow;
   pnlfamotrtiprel.Enabled := True;
   mefamotrtiprel.Color    := clWindow;
   pnlapepatben.Enabled    := False;
   meapepatben.Color       := clMoneyGreen;
   pnlapematben.Enabled    := False;
   meapematben.Color       := clMoneyGreen;
   pnlApeCas.Enabled       := False;
   meapecas.Color          := clMoneyGreen;
   pnlnomben.Enabled       := False;
   menomben.Color          := clMoneyGreen;
   dbdtpfecnac.Enabled     := False;
   dbdtpfecnac.Color       := clMoneyGreen;
   dblcidesex.Enabled      := False;
   dblcidesex.Color        := clMoneyGreen;
   pnldessex.Enabled       := False;
   medessex.Color          := clMoneyGreen;
   pnlporcentaje.Enabled   := True;
   pnldireccionfam.Enabled := True;
   dblcddptoid.Enabled     := True;
   dblcdProvincia.Enabled  := True;
   dblcdDistrito.Enabled   := True;
   pnltelefonofijo.Enabled := True;
   pnlmovil.Enabled        := True;
   pnlemail.Enabled        := True;
   dblcforpag.Enabled      := True;
   dblcBanco.Enabled       := True;
   dblcagegir.Enabled      := True;
   mednitut.Enabled        := False;
   mednitut.Color          := clMoneyGreen;
   meapepattut.Enabled     := False;
   meapepattut.Color       := clMoneyGreen;
   meapemattut.Enabled     := False;
   meapemattut.Color       := clMoneyGreen;
   menomtut.Enabled        := False;
   menomtut.Color          := clMoneyGreen;
   btnbuscarenben.Enabled := True;
   btnbuscarentut.Enabled := False;
End;

procedure TFManFami.HabIngDeuMen;
begin
   ImagenBen.Picture       := nil;
   FirmaBen.Picture        := nil;
   medni.Text              := '';
   rgbenmenedad.Enabled    := True;
   pnldni.Enabled          := False;
   medni.Color             := clMoneyGreen;
   dblctiprel.Enabled      := True;
   dblctiprel.Color        := clWindow;
   pnlfamotrtiprel.Enabled := True;
   mefamotrtiprel.Color    := clWindow;
   pnlapepatben.Enabled    := True;
   meapepatben.Color       := clWindow;
   pnlapematben.Enabled    := True;
   meapematben.Color       := clWindow;
   pnlApeCas.Enabled       := True;
   meApeCas.Color          := clWindow;
   pnlnomben.Enabled       := True;
   menomben.Color          := clWindow;
   dbdtpfecnac.Enabled     := True;
   dbdtpfecnac.Color       := clWindow;
   dblcidesex.Enabled      := True;
   dblcidesex.Color        := clWindow;
   pnldessex.Enabled       := True;
   medessex.Color          := clWindow;
   pnlporcentaje.Enabled   := True;
   meporcentaje.Color      := clWindow;
   pnldireccionfam.Enabled := True;
   medireccionfam.Color    := clWindow;
   dblcddptoid.Enabled     := True;
   dblcddptoid.Color       := clWindow;
   dblcdProvincia.Enabled  := True;
   dblcdProvincia.Color    := clWindow;
   dblcdDistrito.Enabled   := True;
   dblcdDistrito.Color     := clWindow;
   pnltelefonofijo.Enabled := True;
   metelefonofijo.Color    := clWindow;
   pnlmovil.Enabled        := True;
   memovil.Color           := clWindow;
   pnlemail.Enabled        := True;
   meemail.Color           := clWindow;
   dblcforpag.Enabled      := True;
   dblcforpag.Color        := clWindow;
   dblcBanco.Enabled       := True;
   dblcBanco.Color         := clWindow;
   dblcagegir.Enabled      := True;
   dblcagegir.Color        := clWindow;
   mednitut.Enabled        := True;
   mednitut.Color          := clWindow;
   meapepattut.Enabled     := False;
   meapepattut.Color       := clMoneyGreen;
   meapemattut.Enabled     := False;
   meapemattut.Color       := clMoneyGreen;
   menomtut.Enabled        := False;
   menomtut.Color          := clMoneyGreen;
   pnldnitut.Enabled       := True;
   btnbuscarenben.Enabled  := False;
   btnbuscarentut.Enabled  := True;
end;

procedure TFManFami.FormActivate(Sender: TObject);
Var xSql:String;
begin

   xSql := 'SELECT ID, '' ''||UPPER(DESCRIP) DESCRIP FROM TGE817';
   DM1.cdsSexo.Close;
   DM1.cdsSexo.DataRequest(xSQL);
   DM1.cdsSexo.Open;
   dblcidesex.Selected.Clear;
   dblcidesex.Selected.Add('ID'#9'1'#9'Código'#9#9);
   dblcidesex.Selected.Add('DESCRIP'#9'25'#9'Descripción'#9#9);

   xSql := 'SELECT DPTOID, DPTODES FROM APO158 ORDER BY DPTOID';
   DM1.cdsDpto.Close;
   DM1.cdsDpto.DataRequest(xSql);
   DM1.cdsDpto.Open;
   dblcddptoid.Selected.Clear;
   dblcddptoid.Selected.Add('DPTOID'#9'2'#9'Código'#9#9);
   dblcddptoid.Selected.Add('DPTODES'#9'25'#9'Descripción'#9#9);

   xSql := 'SELECT TIPDESEID, TIPDESEDES, FLACOBPRE FROM CRE104 A WHERE NVL(FLAVIGPRE, ''X'') = ''S'' AND NVL(FLAHISPRE, ''X'') = ''S'' AND TIPDESEID <> ''19'' ORDER BY TIPDESEID';
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

   xSql := 'SELECT PARENID, PARENDES FROM TGE149 ORDER BY PARENID';
   DM1.cdsTRelacion.Close;
   DM1.cdsTRelacion.DataRequest(xSql);
   DM1.cdsTRelacion.Open;
   dblctiprel.Selected.Clear;
   dblctiprel.Selected.Add('PARENID'#9'2'#9'Código'#9#9);
   dblctiprel.Selected.Add('PARENDES'#9'25'#9'Descripción'#9#9);

   btneditar.Enabled := False;
   btnElimina.Enabled := False;
   btnGrabar.Enabled := False;
   gbbeneficiario.Enabled := False;
   gbtutor.Enabled := False;

   If DM1.xCnd = 'M' Then
   Begin
      If DM1.xSgr = 'F' Then
      Begin
         llenafamilia;
         xSql := 'SELECT * FROM PVS306 WHERE ASOID = ' + QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+ ' AND PVSESTLIQ IN (''02'',''05'', ''06'')';
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         If DM1.cdsQry.RecordCount > 0 Then
         Begin
             If FModExpben.sModExpR='S' then
             Begin
                btneditar.Enabled := True;
                btnGrabar.Enabled := True;
             End
             Else
             Begin
                btneditar.Enabled := False;
                btnGrabar.Enabled := False;
             End;
         End
         Else
         Begin
            btneditar.Enabled := True;
         End;
      End;
      If DM1.xSgr = 'D' Then
      Begin
         llenabeneficiario;
      End;
   End;

   IF DM1.xSgr = 'F' Then
   Begin
      xfila := DM1.cdsDFam.FieldByName('FILA').AsString;
      lblporcentaje.Visible := False;
      pnlporcentaje.Visible := False;
   End
   Else
   Begin
      lblporcentaje.Visible := True;
      pnlporcentaje.Visible := True;
   End;

   If rgbenmenedad.ItemIndex = -1 Then
   Begin
      MessageDlg('Selecccione tipo de beneficiario', mtError,[mbOk], 0);
      rgbenmenedad.Enabled := True;
      rgbenmenedad.SetFocus;
      Exit;
   End;

   If DM1.xCnd = 'I' Then
   Begin
      btnElimina.Enabled := False;
      btneditar.Enabled  := False;
      btnGrabar.Enabled  := True;
   End;





end;

procedure TFManFami.rgbenmenedadClick(Sender: TObject);
Var xSql:String;
begin
   limpia;
   If rgbenmenedad.ItemIndex = 0 Then
   Begin
      gbbeneficiario.Enabled := True;
      gbtutor.Enabled := True;
      xSql := 'SELECT PARENID, PARENDES FROM TGE149 WHERE PARENID IN (''02'', ''15'', ''16'') ORDER BY PARENID';
      DM1.cdsTRelacion.Close;
      DM1.cdsTRelacion.DataRequest(xSql);
      DM1.cdsTRelacion.Open;
      HabIngDeuMen;
      dblctiprel.SetFocus;
   End;
   If rgbenmenedad.ItemIndex = 1 Then
   Begin
      xSql := 'SELECT PARENID, PARENDES FROM TGE149 ORDER BY PARENID';
      DM1.cdsTRelacion.Close;
      DM1.cdsTRelacion.DataRequest(xSql);
      DM1.cdsTRelacion.Open;
      gbbeneficiario.Enabled := True;
      gbtutor.Enabled := False;
      HabIngDeuMay;
      medni.SetFocus;
   End;
   dblctiprel.Selected.Clear;
   dblctiprel.Selected.Add('PARENID'#9'2'#9'Código'#9#9);
   dblctiprel.Selected.Add('PARENDES'#9'25'#9'Descripción'#9#9);

   If DM1.xCnd = 'I' Then btnGrabar.Enabled := True;

end;

procedure TFManFami.llenabeneficiario;
Var xSql:String;
begin

   medestiprel.Text     := DM1.DevuelveValor('TGE149', 'PARENDES', 'PARENID', dblctiprel.Text);
   medessex.Text        := DM1.DevuelveValor('TGE817', 'DESCRIP', 'ID', dblcidesex.Text);
   meforpagodes.Text    := DM1.DevuelveValor('CRE104', 'TIPDESEDES', 'TIPDESEID', dblcforpag.Text);
   mebancodes.Text      := DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', dblcBanco.Text);
   dblcddptoid.Text     := Copy(DM1.cdsdetcardes.FieldByName('DSGZIPIDDES').AsString,1,2);
   meprovinciades.Text  := DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', dblcdProvincia.Text);
   medistritodes.Text   := DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', dblcdDistrito.Text);

   If DM1.cdsdetcardes.FieldByName('MENEDAD').AsString = 'S' Then rgbenmenedad.ItemIndex := 0;
   If DM1.cdsdetcardes.FieldByName('MENEDAD').AsString = 'N' Then rgbenmenedad.ItemIndex := 1;

   medni.Text           := DM1.cdsdetcardes.FieldByName('DNI').AsString;
   dblctiprel.Text      := DM1.cdsdetcardes.FieldByName('TIPREL').AsString;
   medestiprel.Text     := DM1.DevuelveValor('TGE149', 'PARENDES', 'PARENID', dblctiprel.Text);
   mefamotrtiprel.Text  := DM1.cdsdetcardes.FieldByName('DSGOTRTIPREL').AsString;
   meapepatben.Text     := DM1.cdsdetcardes.FieldByName('APEPAT').AsString;
   meapematben.Text     := DM1.cdsdetcardes.FieldByName('APEMAT').AsString;
   meapecas.Text        := DM1.cdsdetcardes.FieldByName('APECAS').AsString;
   menomben.Text        := DM1.cdsdetcardes.FieldByName('APENOM').AsString;
   dbdtpfecnac.DateTime := DM1.cdsdetcardes.FieldByName('FECNAC').AsDateTime;
   dblcidesex.Text      := DM1.cdsdetcardes.FieldByName('SEXO').AsString;
   medessex.Text        := DM1.DevuelveValor('TGE817', 'DESCRIP', 'ID', dblcidesex.Text);
   meporcentaje.Text    := DM1.cdsdetcardes.FieldByName('PORC').AsString;
   medireccionfam.Text  := DM1.cdsdetcardes.FieldByName('DSGDIRDES').AsString;
   dblcddptoid.Text     := Copy(DM1.cdsdetcardes.FieldByName('DSGZIPIDDES').AsString,1,2);
   medptodes.Text       := DM1.DevuelveValor('APO158', 'DPTODES', 'DPTOID', dblcddptoid.Text);
   dblcdProvincia.Text  := Copy(DM1.cdsdetcardes.FieldByName('DSGZIPIDDES').AsString,1,4);
   meprovinciades.Text  := DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', dblcdProvincia.Text);
   dblcdDistrito.Text   := DM1.cdsdetcardes.FieldByName('DSGZIPIDDES').AsString;
   medistritodes.Text   := DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', dblcdDistrito.Text);
   meapepattut.Text     := DM1.cdsdetcardes.FieldByName('APEPATTUT').AsString;
   meapemattut.Text     := DM1.cdsdetcardes.FieldByName('APEMATTUT').AsString;
   menomtut.Text        := DM1.cdsdetcardes.FieldByName('NOMTUT').AsString;
   mednitut.Text        := DM1.cdsdetcardes.FieldByName('DNITUT').AsString;
   dblcforpag.Text      := DM1.cdsdetcardes.FieldByName('FORPAGID').AsString;
   meforpagodes.Text    := DM1.DevuelveValor('CRE104', 'TIPDESEDES', 'TIPDESEID', dblcforpag.Text);
   dblcBanco.Text       := DM1.cdsdetcardes.FieldByName('BANCOID').AsString;
   mebancodes.Text      := DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', dblcBanco.Text);
   dblcagegir.Text      := DM1.cdsdetcardes.FieldByName('AGEBCOID').AsString;
   metelefonofijo.Text  := DM1.cdsdetcardes.FieldByName('DSGTELFIJDES').AsString;
   memovil.Text         := DM1.cdsdetcardes.FieldByName('DSGTELMOVDES').AsString;
   meemail.Text         := DM1.cdsdetcardes.FieldByName('EMAILDES').AsString;

   DM1.CargaImagenesBen(medni.Text);
   ImagenBen.Picture.Assign(DM1.Jpg);
   If Trim(medni.Text) = '' Then
      btnRENIECBen.Enabled := False
   Else
      btnRENIECBen.Enabled := True;
   FirmaBen.Picture.Assign(DM1.jpgFirma);
   DM1.CargaImagenesBen(mednitut.Text);
   ImagenTut.Picture.Assign(DM1.Jpg);
   If Trim(mednitut.Text) = '' Then
      btnRENIECTut.Enabled := False
   Else
      btnRENIECTut.Enabled := True;
   FirmaTut.Picture.Assign(DM1.jpgFirma);
   inhabilitar;
end;

procedure TFManFami.limpia;
begin
   medni.Text := '';
   dblctiprel.Text := '';
   medestiprel.Text := '';
   mefamotrtiprel.Text := '';
   meapepatben.Text := '';
   meapematben.Text := '';
   meapecas.Text := '';
   menomben.Text := '';
   ImagenBen.Picture := nil;
   FirmaBen.Picture := nil;
   dbdtpfecnac.Text := '';
   dblcidesex.Text := '';
   medessex.Text := '';
   meporcentaje.Text := '';
   medireccionfam.Text := '';
   dblcddptoid.Text := '';
   medptodes.Text := '';
   dblcdProvincia.Text := '';
   meprovinciades.Text := '';
   dblcdDistrito.Text := '';
   medistritodes.Text := '';
   metelefonofijo.Text := '';
   memovil.Text := '';
   meemail.Text := '';
   dblcforpag.Text := '';
   meforpagodes.Text := '';
   dblcBanco.Text := '';
   mebancodes.Text := '';
   dblcagegir.Text := '';
   meagegir.Text := '';
   mednitut.Text := '';
   meapepattut.Text := '';
   meapemattut.Text := '';
   menomtut.Text := '';
   ImagenTut.Picture := nil;
   FirmaTut.Picture := nil;
   btnRENIECBen.Enabled := False;
   btnRENIECTut.Enabled := False;
end;
//Final HPC_201809_PRE
End.

