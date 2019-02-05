// Inicio Uso Estándares: 01/08/2011
// Unidad : Previsión Social
// Formulario : FLibAhoMod
// Fecha de Creación : 08/08/2011
// Autor : Sistemas
// Objetivo : Libretas de Ahorros
// Actualizaciones
// HPC_201302_PRE : SE MODIFICA TITULO DEL REPORTE Y LA GLOSA DE DATOS DE DEUDO (MENOR DE EDAD)
// SPP_201303_PRE : El pase a producción se realiza a partir del HPC_201302_PRE
// HPC_201303_PRE : Se modifica titulo de reporte "ppRepConsEntrega"
// SPP_201304_PRE : Se realiza el pase a produccion a partir del HPC_201303_PRE
// HPC_201307_PRE : Se añade nuevo logo institucional derrama
// SPP_201401_PRE : Se realiza el pase a producción a partir del pase HPC_201307_PRE

unit PRE270;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, wwdbdatetimepicker, wwdblook, Wwdbdlg, Buttons,
  ExtCtrls, ppBands, ppCtrls, ppVar, ppPrnabl, ppClass, ppCache, ppProd, DateUtils,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, jpeg; // SPP_201401_PRE

type
  TFLibAhoMod = class(TForm)
    gbdatliq: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    gbdatlib: TGroupBox;
    Label7: TLabel;
    Label10: TLabel;
    dblcdbancoid: TwwDBLookupComboDlg;
    Label8: TLabel;
    meccbcoid: TMaskEdit;
    Label11: TLabel;
    dbdtpfecrec: TwwDBDateTimePicker;
    Label12: TLabel;
    dbdtpfecent: TwwDBDateTimePicker;
    Label14: TLabel;
    dbdtpfecenv: TwwDBDateTimePicker;
    gbdattut: TGroupBox;
    Label13: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    dblcddptoid: TwwDBLookupComboDlg;
    dblcdproid: TwwDBLookupComboDlg;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    dblcddisid: TwwDBLookupComboDlg;
    gbdatrep: TGroupBox;
    Label25: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    dblcddptoidrep: TwwDBLookupComboDlg;
    dblcdprovidrep: TwwDBLookupComboDlg;
    dblcddistidrep: TwwDBLookupComboDlg;
    pnlpvslbennr: TPanel;
    mepvslbennr: TMaskEdit;
    pnlpvslfecbe: TPanel;
    dbdtppvslfecbe: TwwDBDateTimePicker;
    pnlmonliq: TPanel;
    memonliq: TMaskEdit;
    pnlasoapepatdni: TPanel;
    measoapepatdni: TMaskEdit;
    pnlasoapematdni: TPanel;
    measoapematdni: TMaskEdit;
    pnlasonomdni: TPanel;
    measonomdni: TMaskEdit;
    btndeposito: TBitBtn;
    btntutor: TBitBtn;
    btnapertura: TBitBtn;
    btnrepre: TBitBtn;
    btnimprimir: TBitBtn;
    btnCerrar: TBitBtn;
    pnlapenomtut: TPanel;
    meapenomtut: TMaskEdit;
    pnldnitut: TPanel;
    mednitut: TMaskEdit;
    medomtut: TMaskEdit;
    pnldepdes: TPanel;
    medesdeptut: TMaskEdit;
    pnldespro: TPanel;
    medesprotut: TMaskEdit;
    pnldesdis: TPanel;
    medesdistut: TMaskEdit;
    dblcdrepid: TwwDBLookupComboDlg;
    pnldesrep: TPanel;
    medesrep: TMaskEdit;
    btngraba: TBitBtn;
    Panel2: TPanel;
    medsgapepat: TMaskEdit;
    Panel3: TPanel;
    medsgapemat: TMaskEdit;
    Panel4: TPanel;
    medsgnom: TMaskEdit;
    Label32: TLabel;
    Label33: TLabel;
    pnlbancodes: TPanel;
    mebancodes: TMaskEdit;
    Label16: TLabel;
    dbdtpfecdep: TwwDBDateTimePicker;
    BitBtn2: TBitBtn;
    btnCancela: TBitBtn;
    pnldesdptorep: TPanel;
    medesdptorep: TMaskEdit;
    pnldesprovrep: TPanel;
    medesprovrep: TMaskEdit;
    pnldesdistrep: TPanel;
    medesdistrep: TMaskEdit;
    ppdbConsEntrega: TppDBPipeline;
    ppRepConsEntrega: TppReport;
    ppHeaderBand1: TppHeaderBand;
    pplblTitulo: TppLabel;
    ppLabel8: TppLabel;
    ppLine3: TppLine;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLine4: TppLine;
    ppLabel20: TppLabel;
    ppShape10: TppShape;
    ppShape11: TppShape;
    ppDetailBand1: TppDetailBand;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel27: TppLabel;
    ppLabel29: TppLabel;
    ppLabel31: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel7: TppLabel;
    ppLabel46: TppLabel;
    ppLine6: TppLine;
    ppLabel47: TppLabel;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLine9: TppLine;
    pplblTipoCambio: TppLabel;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppShape8: TppShape;
    ppShape9: TppShape;
    ppSummaryBand1: TppSummaryBand;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLine5: TppLine;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppLabel45: TppLabel;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppLine22: TppLine;
    ppLabel13: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    pplasoapenomdni: TppLabel;
    pplasodni: TppLabel;
    pplestciv: TppLabel;
    pplasodir: TppLabel;
    ppldptoaso: TppLabel;
    pplprovaso: TppLabel;
    ppldistaso: TppLabel;
    pplapenommen: TppLabel;
    pplfecnacmen: TppLabel;
    ppldirmen: TppLabel;
    ppldptdirmen: TppLabel;
    ppltelefono: TppLabel;
    ppledadmen: TppLabel;
    pplcueahomen: TppLabel;
    pplmondes: TppLabel;
    pplmonape: TppLabel;
    pplapenomtut: TppLabel;
    ppldirtut: TppLabel;
    ppLabel89: TppLabel;
    ppldnitut: TppLabel;
    ppldpttut: TppLabel;
    pplprvtut: TppLabel;
    ppldsttut: TppLabel;
    pplteltut: TppLabel;
    ppLabel86: TppLabel;
    ppLabel87: TppLabel;
    ppLabel88: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppLabel90: TppLabel;
    ppLabel91: TppLabel;
    ppLabel92: TppLabel;
//Inicio: SPP_201401_PRE
    // ppLabel93: TppLabel;  
    // ppLabel94: TppLabel;  
    // ppLabel95: TppLabel;  
    // ppImage2: TppImage;  
//Fin: SPP_201401_PRE
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    pploriexp: TppLabel;
    Label9: TLabel;
    Panel1: TPanel;
    meoriexp: TMaskEdit;
    pplimpresopor: TppLabel;
    pplregistradopor: TppLabel;
    memontodol: TMaskEdit;
    Label15: TLabel;
    medsgttelef: TMaskEdit;
    Label17: TLabel;
    ppShape12: TppShape;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel26: TppLabel;
    ppLine1: TppLine;
    ppImage1: TppImage; // SPP_201401_PRE
    procedure FormActivate(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure btntutorClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btngrabaClick(Sender: TObject);
    procedure dblcddisidExit(Sender: TObject);
    procedure dblcddptoidExit(Sender: TObject);
    procedure dblcddptoidChange(Sender: TObject);
    procedure dblcdproidChange(Sender: TObject);
    procedure dblcddisidChange(Sender: TObject);
    procedure btnaperturaClick(Sender: TObject);
    procedure dblcdbancoidChange(Sender: TObject);
    procedure dbdtpfecrecExit(Sender: TObject);
    procedure btndepositoClick(Sender: TObject);
    procedure btnCancelaClick(Sender: TObject);
    procedure dbdtpfecenvExit(Sender: TObject);
    procedure btnrepreClick(Sender: TObject);
    procedure dblcddptoidrepChange(Sender: TObject);
    procedure dblcdprovidrepChange(Sender: TObject);
    procedure dblcddistidrepChange(Sender: TObject);
    procedure dblcdrepidChange(Sender: TObject);
    procedure dblcddistidrepExit(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure habbot;
    procedure memontodolKeyPress(Sender: TObject; var Key: Char);
    procedure dblcdproidExit(Sender: TObject);
    procedure dblcdbancoidExit(Sender: TObject);
    procedure dblcdrepidExit(Sender: TObject);
    procedure dblcddptoidrepExit(Sender: TObject);
    procedure dblcdprovidrepExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLibAhoMod: TFLibAhoMod;

implementation

uses PREDM;

{$R *.dfm}

procedure TFLibAhoMod.FormActivate(Sender: TObject);
Var xSql:String;
begin
  xSql := 'SELECT DISORIEXP FROM PVS301 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND PVSLBENNR = '+QuotedStr(DM1.cdsDFam.FieldByName('PVSLBENNR').AsString);
  DM1.cdsQry2.Close;
  DM1.cdsQry2.DataRequest(xSql);
  DM1.cdsQry2.Open;
  meoriexp.Text := DM1.DevuelveValor('TGE158', 'DPTODES', 'DPTOID', Copy(DM1.cdsQry2.FieldByName('DISORIEXP').AsString,1,2))+'/';
  meoriexp.Text := meoriexp.Text + DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', Copy(DM1.cdsQry2.FieldByName('DISORIEXP').AsString,1,4))+'/';
  meoriexp.Text := meoriexp.Text + DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', DM1.cdsQry2.FieldByName('DISORIEXP').AsString);

  xSql := 'SELECT BANCOID, BANCONOM FROM TGE105 WHERE BANCOID IN (''03'', ''04'', ''05'')';
  DM1.cdsBanco.Close;
  DM1.cdsBanco.DataRequest(xSql);
  DM1.cdsBanco.Open;
  dblcdbancoid.Selected.Clear;
  dblcdbancoid.Selected.Add('BANCOID'#9'2'#9'Código'#9#9);
  dblcdbancoid.Selected.Add('BANCONOM'#9'30'#9'Descripción'#9#9);

  // Departamento del tutor
  xSql := 'SELECT DPTOID, DPTODES FROM TGE158';
  DM1.cdsDpto.Close;
  DM1.cdsDpto.DataRequest(xSql);
  DM1.cdsDpto.Open;
  dblcddptoid.Selected.Clear;
  dblcddptoid.Selected.Add('DPTOID'#9'2'#9'Código'#9#9);
  dblcddptoid.Selected.Add('DPTODES'#9'30'#9'Descripción'#9#9);

  // Departamento del representante
  xSql := 'SELECT DPTOID, DPTODES FROM TGE158';
  DM1.cdsDpto1.Close;
  DM1.cdsDpto1.DataRequest(xSql);
  DM1.cdsDpto1.Open;
  dblcddptoidrep.Selected.Clear;
  dblcddptoidrep.Selected.Add('DPTOID'#9'2'#9'Código'#9#9);
  dblcddptoidrep.Selected.Add('DPTODES'#9'30'#9'Descripción'#9#9);

  xSql := 'SELECT REPRID, REPRAPENOM FROM COB201 WHERE NVL(REPRFLGACT, ''X'') = ''A'' AND REPRAPENOM IS NOT NULL';
  DM1.cdsRepresentante.Close;
  DM1.cdsRepresentante.DataRequest(xSql);
  DM1.cdsRepresentante.Open;
  dblcdrepid.Selected.Clear;
  dblcdrepid.Selected.Add('REPRID'#9'5'#9'Código'#9#9);
  dblcdrepid.Selected.Add('REPRAPENOM'#9'30'#9'Descripción'#9#9);

  xSql := 'SELECT A.PVSLBENNR, A.PVSLFECBE, B.ASOAPEPATDNI, B.ASOAPEMATDNI, B.ASONOMDNI, SUM(NVL(C.PVSLMONTO,0)) PVSLMONTO'
  +' FROM PVS306 A, APO201 B, PVS307 C WHERE A.PVSLBENNR = '+QuotedStr(DM1.cdsDFam.FieldByName('PVSLBENNR').AsString)+' AND A.ASOID = B.ASOID AND A.PVSLBENNR = C.PVSLBENNR'
  +' AND C.PVSLAGRID = ''DET'' GROUP BY A.PVSLBENNR, A.PVSLFECBE, B.ASOAPEPATDNI, B.ASOAPEMATDNI, B.ASONOMDNI';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;

  mepvslbennr.Text    := DM1.cdsQry.FieldByName('PVSLBENNR').AsString;
  dbdtppvslfecbe.Date := DM1.cdsQry.FieldByName('PVSLFECBE').AsDateTime;
  memonliq.Text       := FloatToStrF(DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat,ffNumber, 10,2);
  measoapepatdni.Text := DM1.cdsQry.FieldByName('ASOAPEPATDNI').AsString;
  measoapematdni.Text := DM1.cdsQry.FieldByName('ASOAPEMATDNI').AsString;
  measonomdni.Text    := DM1.cdsQry.FieldByName('ASONOMDNI').AsString;
  medsgapepat.Text    := DM1.cdsDFam.FieldByName('DSGAPEPAT').AsString;
  medsgapemat.Text    := DM1.cdsDFam.FieldByName('DSGAPEMAT').AsString;
  medsgnom.Text       := DM1.cdsDFam.FieldByName('DSGNOMBR').AsString;
  meapenomtut.Text    := DM1.cdsDFam.FieldByName('DSGTAPENOM').AsString;
  mednitut.text       := DM1.cdsDFam.FieldByName('DSGTDNI').AsString;
  medomtut.Text       := DM1.cdsDFam.FieldByName('DSGTDIR').AsString;
  medsgttelef.Text    := DM1.cdsDFam.FieldByName('DSGTTELEF').AsString;
  dblcddptoid.Text    := DM1.cdsDFam.FieldByName('DPTOID').AsString;
  dblcdproid.Text     := DM1.cdsDFam.FieldByName('CIUDID').AsString;
  dblcddisid.Text     := DM1.cdsDFam.FieldByName('ZIPID').AsString;
  dbdtpfecrec.Date    := DM1.cdsDFam.FieldByName('FECRECEP').AsDateTime;
  dblcdbancoid.Text   := DM1.cdsDFam.FieldByName('BANCOID').AsString;
  meccbcoid.Text      := DM1.cdsDFam.FieldByName('CCBCOID').AsString;
  memontodol.Text     := FloatToStr(DM1.cdsDFam.FieldByName('DSGMTOEXT').AsFloat);
  dbdtpfecdep.Date    := DM1.cdsDFam.FieldByName('FECDEPCUE').AsDateTime;
  dbdtpfecent.Date    := DM1.cdsDFam.FieldByName('FECENTLIB').AsDateTime;
  dbdtpfecenv.Date    := DM1.cdsDFam.FieldByName('FECENVLIB').AsDateTime;
  dblcdrepid.Text     := DM1.cdsDFam.FieldByName('REPRID').AsString;
  dblcddptoidrep.Text := Copy(DM1.cdsDFam.FieldByName('UBIREP').AsString,1,2);
  dblcdprovidrep.Text := Copy(DM1.cdsDFam.FieldByName('UBIREP').AsString,1,4);
  dblcddistidrep.Text := DM1.cdsDFam.FieldByName('UBIREP').AsString;
  gbdatliq.Enabled    := False;
  gbdatlib.Enabled    := False;
  gbdattut.Enabled    := False;
  gbdatrep.Enabled    := False;
end;

procedure TFLibAhoMod.btncerrarClick(Sender: TObject);
begin
  FLibAhoMod.Close;
end;

procedure TFLibAhoMod.BitBtn5Click(Sender: TObject);
begin
  FLibAhoMod.Close;
end;

procedure TFLibAhoMod.btntutorClick(Sender: TObject);
begin
  btntutor.Enabled := True;
  btnCancela.Enabled := True;
  btngraba.Enabled := True;
  btnimprimir.Enabled := True;
  btnapertura.Enabled := False;
  btndeposito.Enabled := False;
  btnrepre.Enabled := False;
  DM1.xSgr := 'T';
  gbdattut.Enabled := True;
  pnlapenomtut.Enabled := False;
  pnldnitut.Enabled := False;
  medomtut.SetFocus;
  medomtut.Color    := clInfoBk;
  medsgttelef.Color := clInfoBk;
  dblcddptoid.Color := clInfoBk;
  dblcdproid.Color  := clInfoBk;
  dblcddisid.Color  := clInfoBk;
  medesdeptut.Color := clInfoBk;
  medesprotut.Color := clInfoBk;
  medesdistut.Color := clInfoBk;
end;

procedure TFLibAhoMod.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  begin
    Key := #0;
    Perform(CM_DIALOGKEY, VK_TAB, 0);
  end;
end;

Procedure TFLibAhoMod.btngrabaClick(Sender: TObject);
Var xSql, xdptoid, xprovid, xdistid:String;
Begin
  // Datos del tutor del menor de edad
  If DM1.xSgr = 'T' Then
  Begin
    If Trim(dblcddptoid.Text) = '' Then
    Begin
      MessageDlg('Ingrese el código del departamento', mtCustom, [mbOk], 0);
      dblcddptoid.SetFocus;
      Exit;
    End;
    If Trim(dblcdproid.Text) = '' Then
    Begin
      MessageDlg('Ingrese el código de la provincia', mtCustom, [mbOk], 0);
      dblcdproid.SetFocus;
      Exit;
    End;
    If Trim(dblcddisid.Text) = '' Then
    Begin
      MessageDlg('Ingrese el código del distrito', mtCustom, [mbOk], 0);
      dblcddisid.SetFocus;
      Exit;
    End;
    If Trim(medomtut.Text) = '' Then
    Begin
      MessageDlg('Ingrese la dirección del tutor', mtCustom, [mbOk], 0);
      medomtut.SetFocus;
      Exit;
    End;

    If MessageDlg('¿ Seguro de actualizar datos del tutor ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
    Begin
      xSql := 'UPDATE PVS308 SET DSGTDIR = '+QuotedStr(medomtut.Text)
      +', DPTOID = '+QuotedStr(dblcddptoid.Text)
      +', CIUDID = '+QuotedStr(dblcdproid.Text)
      +', ZIPID = '+QuotedStr(dblcddisid.Text)
      +', DSGTTELEF = '+QuotedStr(medsgttelef.Text)
      +' WHERE PVSLBENNR = '+QuotedStr(mepvslbennr.Text)
      +' AND DSGAPEPAT = '+QuotedStr(medsgapepat.Text)+' AND DSGAPEMAT = '+QuotedStr(medsgapemat.Text)+' AND DSGNOMBR = '+QuotedStr(medsgnom.Text);
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      xSql := 'SELECT * FROM PVS308 WHERE ASOID = '+QuotedStr(DM1.cdsDFam.FieldByName('ASOID').AsString)
      +' AND DSGAPEPAT = '+QuotedStr(medsgapepat.Text)+' AND DSGAPEMAT = '+QuotedStr(medsgapemat.Text)+' AND DSGNOMBR = '+QuotedStr(medsgnom.Text);
      DM1.cdsDFam.Close;
      DM1.cdsDFam.DataRequest(xSql);
      DM1.cdsDFam.Open;
      medsgttelef.Color := clWhite;
      medomtut.Color := clWhite;
      dblcddptoid.Color := clWhite;
      dblcdproid.Color  := clWhite;
      dblcddisid.Color  := clWhite;
      medesdeptut.Color := clWhite;
      medesprotut.Color := clWhite;
      medesdistut.Color := clWhite;
      gbdattut.Enabled := False;
      MessageDlg('Actualización Ok', mtCustom, [mbOk], 0);
      habbot;
    End;
  End;
  // Datos de la apertura de cuenta
  If DM1.xSgr = 'A' Then
  Begin
    If Trim(dblcdbancoid.Text) = '' Then
    Begin
      MessageDlg('Ingrese el código del banco', mtCustom, [mbOk], 0);
      dblcdbancoid.SetFocus;
      Exit;
    End;
    If Trim(meccbcoid.Text) = '' Then
    Begin
      MessageDlg('Ingrese número de la cuenta', mtCustom, [mbOk], 0);
      meccbcoid.SetFocus;
      Exit;
    End;
    If MessageDlg('¿ Seguro de actualizar datos de apertura de cuenta ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
    Begin
      xSql := 'UPDATE PVS308 SET BANCOID = '+QuotedStr(dblcdbancoid.Text)
      +', CCBCOID = '+QuotedStr(meccbcoid.Text)
      +', FECRECEP = '+QuotedStr(dbdtpfecrec.Text)
      +', USUREG = '+QuotedStr(DM1.wUsuario)
      +' WHERE PVSLBENNR = '+QuotedStr(mepvslbennr.Text)
      +' AND DSGAPEPAT = '+QuotedStr(medsgapepat.Text)+' AND DSGAPEMAT = '+QuotedStr(medsgapemat.Text)+' AND DSGNOMBR = '+QuotedStr(medsgnom.Text);
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      xSql := 'SELECT * FROM PVS308 WHERE ASOID = '+QuotedStr(DM1.cdsDFam.FieldByName('ASOID').AsString)
      +' AND DSGAPEPAT = '+QuotedStr(medsgapepat.Text)+' AND DSGAPEMAT = '+QuotedStr(medsgapemat.Text)+' AND DSGNOMBR = '+QuotedStr(medsgnom.Text);
      DM1.cdsDFam.Close;
      DM1.cdsDFam.DataRequest(xSql);
      DM1.cdsDFam.Open;
      gbdatlib.Enabled := False;
      dblcdbancoid.Enabled := False;
      meccbcoid.Enabled := False;
      dbdtpfecrec.Enabled := False;
      dblcdbancoid.Color := clWhite;
      mebancodes.Color := clWhite;
      meccbcoid.Color := clWhite;
      dbdtpfecrec.Color := clWhite;
      MessageDlg('Actualización Ok', mtCustom, [mbOk], 0);
      habbot;
    End;
  End;
  // Datos del deposito en la cuenta
  If DM1.xSgr = 'D' Then
  Begin
    If DM1.Valores(memontodol.Text) = 0 Then
    Begin
      MessageDlg('Ingrese monto del deposito', mtInformation, [mbOk], 0);
      memontodol.SetFocus;
      Exit;
    End;

    If MessageDlg('¿ Seguro de actualizar datos de deposito en cuenta ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
    Begin
      xSql := 'UPDATE PVS308 SET DSGMTOEXT = '+memontodol.Text
      +',FECDEPCUE  = '+QuotedStr(dbdtpfecdep.Text)
      +',FECENTLIB  = '+QuotedStr(dbdtpfecent.Text)
      +',FECENVLIB  = '+QuotedStr(dbdtpfecenv.Text)
      +' WHERE PVSLBENNR = '+QuotedStr(mepvslbennr.Text)
      +' AND DSGAPEPAT = '+QuotedStr(medsgapepat.Text)+' AND DSGAPEMAT = '+QuotedStr(medsgapemat.Text)+' AND DSGNOMBR = '+QuotedStr(medsgnom.Text);
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      xSql := 'SELECT * FROM PVS308 WHERE ASOID = '+QuotedStr(DM1.cdsDFam.FieldByName('ASOID').AsString)
      +' AND DSGAPEPAT = '+QuotedStr(medsgapepat.Text)+' AND DSGAPEMAT = '+QuotedStr(medsgapemat.Text)+' AND DSGNOMBR = '+QuotedStr(medsgnom.Text);
      DM1.cdsDFam.Close;
      DM1.cdsDFam.DataRequest(xSql);
      DM1.cdsDFam.Open;
      memontodol.Enabled := False;
      dbdtpfecdep.Enabled := False;
      dbdtpfecent.Enabled := False;
      dbdtpfecenv.Enabled := False;
      gbdatlib.Enabled := False;
      memontodol.Color := clWhite;
      dbdtpfecdep.Color := clWhite;
      dbdtpfecent.Color := clWhite;
      dbdtpfecenv.Color := clWhite;
      MessageDlg('Actualización Ok', mtCustom, [mbOk], 0);
      habbot;
    End;
  End;
  // Grabando representante
  If DM1.xSgr = 'R' Then
  Begin
    If Trim(dblcdrepid.Text) = '' Then
    Begin
      MessageDlg('Ingrese código del representante', mtCustom, [mbOk], 0);
      dblcdrepid.SetFocus;
      Exit;
    End;
    If Trim(dblcddptoidrep.Text) = '' Then
    Begin
      MessageDlg('Ingrese el código del departamento', mtCustom, [mbOk], 0);
      dblcddptoidrep.SetFocus;
      Exit;
    End;
    If Trim(dblcdprovidrep.Text) = '' Then
    Begin
      MessageDlg('Ingrese el código de la provincia', mtCustom, [mbOk], 0);
      dblcdprovidrep.SetFocus;
      Exit;
    End;
    If Trim(dblcddistidrep.Text) = '' Then
    Begin
      MessageDlg('Ingrese el código del distrito', mtCustom, [mbOk], 0);
      dblcddistidrep.SetFocus;
      Exit;
    End;
    If MessageDlg('¿ Seguro de actualizar datos del representante ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
    Begin
      xdptoid := Copy(DM1.cdsDFam.FieldByName('UBIREP').AsString,1,2);
      xprovid := Copy(DM1.cdsDFam.FieldByName('UBIREP').AsString,1,4);
      xdistid := DM1.cdsDFam.FieldByName('UBIREP').AsString;
      xSql := 'UPDATE PVS308 SET REPRID = '+QuotedStr(dblcdrepid.Text)
      +', UBIREP = '+QuotedStr(dblcddistidrep.Text)
      +' WHERE PVSLBENNR = '+QuotedStr(mepvslbennr.Text)
      +' AND DSGAPEPAT = '+QuotedStr(medsgapepat.Text)+' AND DSGAPEMAT = '+QuotedStr(medsgapemat.Text)+' AND DSGNOMBR = '+QuotedStr(medsgnom.Text);
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      xSql := 'SELECT * FROM PVS308 WHERE ASOID = '+QuotedStr(DM1.cdsDFam.FieldByName('ASOID').AsString)
      +' AND DSGAPEPAT = '+QuotedStr(medsgapepat.Text)+' AND DSGAPEMAT = '+QuotedStr(medsgapemat.Text)+' AND DSGNOMBR = '+QuotedStr(medsgnom.Text);
      DM1.cdsDFam.Close;
      DM1.cdsDFam.DataRequest(xSql);
      DM1.cdsDFam.Open;
      gbdatrep.Enabled := False;
      dblcdrepid.Color := clWhite;
      medesrep.Color   := clWhite;
      dblcddptoidrep.Color := clWhite;
      medesdptorep.Color := clWhite;
      dblcdprovidrep.Color := clWhite;
      medesprovrep.Color := clWhite;
      dblcddistidrep.Color := clWhite;
      medesdistrep.Color := clWhite;
      MessageDlg('Actualización Ok', mtCustom, [mbOk], 0);
      habbot;
    End;
  End;
  // Chequeando si ya se ingresaron todos las cuentas de ahorros en el oficio
  //respectivo.
End;

procedure TFLibAhoMod.dblcddisidExit(Sender: TObject);
Var xSql:String;
begin
  If Trim(dblcddisid.Text) <> '' Then
  Begin
    xSql := 'SELECT * FROM APO122 WHERE ZIPID = '+QuotedStr(dblcddisid.Text);
    If DM1.verificaexiste(xSql) = False Then
    Begin
      MessageDlg('Código de distrito no valido', mtInformation, [mbOk], 0);
      dblcddisid.Text := '';
      medesdistut.Text := '';
      dblcddisid.SetFocus;
      Exit;
    End;
  End;
  btngraba.SetFocus;
end;

Procedure TFLibAhoMod.dblcddptoidExit(Sender: TObject);
Var xSql:String;
Begin
  If Trim(dblcddptoid.Text) <> '' Then
  Begin
    xSql := 'SELECT * FROM APO158 WHERE DPTOID = '+QuotedStr(dblcddptoid.Text);
    If DM1.verificaexiste(xSql) = False Then
    Begin
      MessageDlg('Código de departamento no valido', mtInformation, [mbOk], 0);
      dblcddptoid.Text := '';
      medesdeptut.Text := '';
      dblcdproid.Text := '';
      medesprotut.Text := '';
      dblcddisid.Text := '';
      medesdistut.Text := '';
      dblcddptoid.SetFocus;
      Exit;
    End;
  End;
End;

procedure TFLibAhoMod.dblcddptoidChange(Sender: TObject);
Var xSql:String;
begin
  If dblcddptoid.Text = '' Then
  Begin
    medesdeptut.Text := '';
    dblcdproid.Text := '';
    medesprotut.Text := '';
    dblcddisid.Text := '';
    medesdistut.Text := '';
    xSql := 'SELECT CIUDID, CIUDDES FROM APO123 WHERE CIUDID = ''''';
    DM1.cdsProvincia.Close;
    DM1.cdsProvincia.DataRequest(xSql);
    DM1.cdsProvincia.Open;
    xSql := 'SELECT ZIPID, ZIPDES FROM APO122 WHERE ZIPID = ''''';
    DM1.cdsDist.Close;
    DM1.cdsDist.DataRequest(xSql);
    DM1.cdsDist.Open;
  End;
  If Length(dblcddptoid.Text) = 2 then
  Begin
    If DM1.cdsDpto.Locate('DPTOID', dblcddptoid.Text, []) Then
    Begin
      medesdeptut.Text := DM1.cdsDpto.FieldByName('DPTODES').AsString;
      xSql := 'SELECT CIUDID, CIUDDES FROM APO123 WHERE DPTOID = '+QuotedStr(dblcddptoid.Text)+' ORDER BY CIUDID';
      DM1.cdsProvincia.Close;
      DM1.cdsProvincia.DataRequest(xSql);
      DM1.cdsProvincia.Open;
      dblcdproid.Selected.Clear;
      dblcdproid.Selected.Add('CIUDID'#9'4'#9'Código'#9#9);
      dblcdproid.Selected.Add('CIUDDES'#9'25'#9'Provincia'#9#9);
    End
    Else
    Begin
      MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
      dblcddptoid.Text := '';
      medesdeptut.Text := '';
      dblcdproid.Text := '';
      medesprotut.Text := '';
      dblcddisid.Text := '';
      medesdistut.Text := '';
      Exit;
    End;
  End;
end;

procedure TFLibAhoMod.dblcdproidChange(Sender: TObject);
Var xSql:String;
begin
  If dblcdproid.Text = '' Then
  Begin
    medesprotut.Text := '';
    dblcddisid.Text  := '';
    medesdistut.Text := '';
    xSql := 'SELECT ZIPID, ZIPDES FROM APO122 WHERE ZIPID = ''''';
    DM1.cdsDist.Close;
    DM1.cdsDist.DataRequest(xSql);
    DM1.cdsDist.Open;
  End;
  If Length(dblcdproid.Text) = 4 then
  Begin
    If DM1.cdsProvincia.Locate('CIUDID', dblcdproid.Text , []) Then
    Begin
      medesprotut.Text := DM1.cdsProvincia.FieldByName('CIUDDES').AsString;
      xSql := 'SELECT ZIPID, ZIPDES FROM APO122 WHERE CIUDID = '+QuotedStr(dblcdproid.Text)+' ORDER BY ZIPID';
      DM1.cdsDist.Close;
      DM1.cdsDist.DataRequest(xSql);
      DM1.cdsDist.Open;
      dblcddisid.Selected.Clear;
      dblcddisid.Selected.Add('ZIPID'#9'6'#9'Código'#9#9);
      dblcddisid.Selected.Add('ZIPDES'#9'25'#9'Distrito'#9#9);
    End
    Else
    Begin
      MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
      dblcdproid.Text := '';
      medesprotut.Text := '';
      dblcddisid.Text := '';
      medesdistut.Text := '';
      Exit;
    End;
  End;
end;

procedure TFLibAhoMod.dblcddisidChange(Sender: TObject);
begin
 If dblcddisid.Text = '' Then
  Begin
    medesdistut.Text := '';
  End;
  If Length(dblcddisid.Text) = 6 then
  Begin
    If DM1.cdsDist.Locate('ZIPID', dblcddisid.Text , []) Then
    Begin
      medesdistut.Text := DM1.cdsDist.FieldByName('ZIPDES').AsString;
    End
    Else
    Begin
      MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
      dblcddisid.Text := '';
      medesdistut.Text := '';
    End;
  End;
end;

procedure TFLibAhoMod.btnaperturaClick(Sender: TObject);
begin
  btnCancela.Enabled := True;
  btngraba.Enabled := True;
  btnapertura.Enabled := True;
  btndeposito.Enabled := False;
  btnrepre.Enabled := False;
  btnimprimir.Enabled := True;
  btntutor.Enabled := False;
  DM1.xSgr := 'A';
  gbdatlib.Enabled := True;
  dblcdbancoid.Enabled := True;
  meccbcoid.Enabled := True;
  dbdtpfecrec.Enabled := True;
  dblcdbancoid.Color := clInfoBk;
  mebancodes.Color := clInfoBk;
  meccbcoid.Color := clInfoBk;
  dbdtpfecrec.Color := clInfoBk;
  dblcdbancoid.SetFocus;
end;

procedure TFLibAhoMod.dblcdbancoidChange(Sender: TObject);
begin
  If dblcdbancoid.Text = '' Then mebancodes.Text := '';
  If Length(dblcdbancoid.Text) = 2 then
    If DM1.cdsBanco.Locate('BANCOID', dblcdbancoid.Text , []) Then
       mebancodes.Text := DM1.cdsBanco.FieldByName('BANCONOM').AsString
    Else
    Begin
      MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
      dblcdbancoid.Text := '';
      mebancodes.Text := '';
    End;
End;



procedure TFLibAhoMod.dbdtpfecrecExit(Sender: TObject);
begin
  btngraba.SetFocus;
end;


procedure TFLibAhoMod.btndepositoClick(Sender: TObject);
begin
  btnCancela.Enabled := True;
  btngraba.Enabled := True;
  btnapertura.Enabled := False;
  btndeposito.Enabled := True;
  btnrepre.Enabled := False;
  btnimprimir.Enabled := True;
  btntutor.Enabled := False;

  DM1.xSgr := 'D';
  gbdatlib.Enabled := True;
  memontodol.Enabled := True;
  dbdtpfecdep.Enabled := True;
  dbdtpfecent.Enabled := True;
  dbdtpfecenv.Enabled := True;
  memontodol.SetFocus;
  memontodol.Color := clInfoBk;
  dbdtpfecdep.Color := clInfoBk;
  dbdtpfecent.Color := clInfoBk;
  dbdtpfecenv.Color := clInfoBk;
end;

procedure TFLibAhoMod.btnCancelaClick(Sender: TObject);
begin
  habbot;
  medomtut.Color := clWhite;
  medsgttelef.Color := clWhite;
  dblcddptoid.Color := clWhite;
  dblcdproid.Color  := clWhite;
  dblcddisid.Color  := clWhite;
  medesdeptut.Color := clWhite;
  medesprotut.Color := clWhite;
  medesdistut.Color := clWhite;
  gbdattut.Enabled := False;
  gbdatlib.Enabled := False;
  dblcdbancoid.Enabled := False;
  meccbcoid.Enabled := False;
  dbdtpfecrec.Enabled := False;
  dblcdbancoid.Color := clWhite;
  mebancodes.Color := clWhite;
  meccbcoid.Color := clWhite;
  dbdtpfecrec.Color := clWhite;
  memontodol.Enabled := False;
  dbdtpfecdep.Enabled := False;
  dbdtpfecent.Enabled := False;
  dbdtpfecenv.Enabled := False;
  gbdatlib.Enabled := False;
  memontodol.Color := clWhite;
  dbdtpfecdep.Color := clWhite;
  dbdtpfecent.Color := clWhite;
  dbdtpfecenv.Color := clWhite;
  gbdatrep.Enabled := False;
  dblcdrepid.Color := clWhite;
  medesrep.Color   := clWhite;
  dblcddptoidrep.Color := clWhite;
  medesdptorep.Color := clWhite;
  dblcdprovidrep.Color := clWhite;
  medesprovrep.Color := clWhite;
  dblcddistidrep.Color := clWhite;
  medesdistrep.Color := clWhite;
end;

procedure TFLibAhoMod.dbdtpfecenvExit(Sender: TObject);
begin
  btngraba.SetFocus;
end;

procedure TFLibAhoMod.btnrepreClick(Sender: TObject);
begin
  btnCancela.Enabled := True;
  btngraba.Enabled := True;
  btnapertura.Enabled := False;
  btndeposito.Enabled := False;
  btnrepre.Enabled := True;
  btnimprimir.Enabled := True;
  btntutor.Enabled := False;
  DM1.xSgr := 'R';
  gbdatrep.Enabled := True;
  dblcdrepid.Color := clInfoBk;
  medesrep.Color := clInfoBk;
  dblcddptoidrep.Color := clInfoBk;
  medesdptorep.Color := clInfoBk;
  dblcdprovidrep.Color := clInfoBk;
  medesprovrep.Color := clInfoBk;
  dblcddistidrep.Color := clInfoBk;
  medesdistrep.Color := clInfoBk;
  dblcdrepid.SetFocus;
end;

procedure TFLibAhoMod.dblcddptoidrepChange(Sender: TObject);
Var xSql:String;
begin
  If dblcddptoidrep.Text = '' Then
  Begin
    medesdptorep.Text := '';
    dblcdprovidrep.Text := '';
    medesprovrep.Text := '';
    dblcddistidrep.Text := '';
    medesdistrep.Text := '';
    xSql := 'SELECT CIUDID, CIUDDES FROM APO123 WHERE CIUDID = ''''';
    DM1.cdsProvincia1.Close;
    DM1.cdsProvincia1.DataRequest(xSql);
    DM1.cdsProvincia1.Open;
    xSql := 'SELECT ZIPID, ZIPDES FROM APO122 WHERE ZIPID = ''''';
    DM1.cdsDist2.Close;
    DM1.cdsDist2.DataRequest(xSql);
    DM1.cdsDist2.Open;
  End;
  If Length(dblcddptoidrep.Text) = 2 then
  Begin
    If DM1.cdsDpto1.Locate('DPTOID', dblcddptoidrep.Text, []) Then
    Begin
      medesdptorep.Text := DM1.cdsDpto1.FieldByName('DPTODES').AsString;
      xSql := 'SELECT CIUDID, CIUDDES FROM APO123 WHERE DPTOID = '+QuotedStr(dblcddptoidrep.Text)+' ORDER BY CIUDID';
      DM1.cdsProvincia1.Close;
      DM1.cdsProvincia1.DataRequest(xSql);
      DM1.cdsProvincia1.Open;
      dblcdprovidrep.Selected.Clear;
      dblcdprovidrep.Selected.Add('CIUDID'#9'4'#9'Código'#9#9);
      dblcdprovidrep.Selected.Add('CIUDDES'#9'25'#9'Provincia'#9#9);
    End
    Else
    Begin
      MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
      dblcddptoidrep.Text := '';
      medesdptorep.Text := '';
      dblcdprovidrep.Text := '';
      medesprovrep.Text := '';
      dblcddistidrep.Text := '';
      medesdistrep.Text := '';
      Exit;
    End;
  End;
end;

procedure TFLibAhoMod.dblcdprovidrepChange(Sender: TObject);
Var xSql:String;
begin
 If dblcdprovidrep.Text = '' Then
  Begin
    medesprovrep.Text := '';
    dblcddistidrep.Text := '';
    medesdistrep.Text := '';
    xSql := 'SELECT ZIPID, ZIPDES FROM APO122 WHERE ZIPID = ''''';
    DM1.cdsDist2.Close;
    DM1.cdsDist2.DataRequest(xSql);
    DM1.cdsDist2.Open;
  End;
  If Length(dblcdprovidrep.Text) = 4 then
  Begin
    If DM1.cdsProvincia1.Locate('CIUDID', dblcdprovidrep.Text , []) Then
    Begin
      medesprovrep.Text := DM1.cdsProvincia1.FieldByName('CIUDDES').AsString;
      xSql := 'SELECT ZIPID, ZIPDES FROM APO122 WHERE CIUDID = '+QuotedStr(dblcdprovidrep.Text)+' ORDER BY ZIPID';
      DM1.cdsDist2.Close;
      DM1.cdsDist2.DataRequest(xSql);
      DM1.cdsDist2.Open;
      dblcddistidrep.Selected.Clear;
      dblcddistidrep.Selected.Add('ZIPID'#9'6'#9'Código'#9#9);
      dblcddistidrep.Selected.Add('ZIPDES'#9'25'#9'Distrito'#9#9);
    End
    Else
    Begin
      MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
      dblcdprovidrep.Text := '';
      medesprovrep.Text := '';
      dblcddistidrep.Text := '';
      medesdistrep.Text := '';
      Exit;
    End;
  End;
end;

procedure TFLibAhoMod.dblcddistidrepChange(Sender: TObject);
begin
 If dblcddistidrep.Text = '' Then
  Begin
    medesdistrep.Text := '';
  End;
  If Length(dblcddistidrep.Text) = 6 then
  Begin
    If DM1.cdsDist2.Locate('ZIPID', dblcddistidrep.Text , []) Then
    Begin
      medesdistrep.Text := DM1.cdsDist2.FieldByName('ZIPDES').AsString;
    End
    Else
    Begin
      MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
      dblcddistidrep.Text := '';
      medesdistrep.Text := '';
    End;
  End;
end;

procedure TFLibAhoMod.dblcdrepidChange(Sender: TObject);
begin
 If dblcdrepid.Text = '' Then medesrep.Text := '';
 If Length(dblcdrepid.Text) = 5 then
  Begin
    If DM1.cdsRepresentante.Locate('REPRID', dblcdrepid.Text , []) Then
      medesrep.Text := DM1.cdsRepresentante.FieldByName('REPRAPENOM').AsString
    Else
    Begin
      MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
      dblcdrepid.Text := '';
      medesrep.Text := '';
    End;
  End;
end;

procedure TFLibAhoMod.dblcddistidrepExit(Sender: TObject);
Var xSql:String;
begin
 If Trim(dblcddisid.Text) <> '' Then
  Begin
    xSql := 'SELECT * FROM APO122 WHERE ZIPID = '+QuotedStr(dblcddistidrep.Text);
    If DM1.verificaexiste(xSql) = False Then
    Begin
      MessageDlg('Código de distrito no valido', mtInformation, [mbOk], 0);
      dblcddistidrep.Text := '';
      medesdistrep.Text := '';
      dblcddistidrep.SetFocus;
      Exit;
    End;
  End;
  btngraba.SetFocus;
end;

procedure TFLibAhoMod.btnimprimirClick(Sender: TObject);
Var edad:Double;
    xSql,xNroLib :String;
begin
  // Datos del asociado
  pploriexp.Caption := meoriexp.Text;
  pplasoapenomdni.Caption := DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString;
  pplasodni.Caption       := DM1.cdsAsociado.FieldByName('ASODNI').AsString;
  pplasodir.Caption       := DM1.cdsAsociado.FieldByName('ASODIR').AsString;
  pplestciv.Caption       := DM1.DevuelveValor('TGE125', 'ESTCIVDES', 'ESTCIVID', DM1.cdsAsociado.FieldByName('ESTCIVID').AsString);
  ppldptoaso.Caption      := DM1.DevuelveValor('TGE158', 'DPTODES', 'DPTOID', Copy(DM1.cdsAsociado.FieldByName('ZIPID').AsString,1,2));
  pplprovaso.Caption      := DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', Copy(DM1.cdsAsociado.FieldByName('ZIPID').AsString,1,4));
  ppldistaso.Caption      := DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', DM1.cdsAsociado.FieldByName('ZIPID').AsString);
  // Datos del menor de edad
  pplapenommen.Caption := Trim(DM1.cdsDFam.FieldByName('DSGAPEPAT').AsString)+' '+Trim(DM1.cdsDFam.FieldByName('DSGAPEMAT').AsString)+' '+Trim(DM1.cdsDFam.FieldByName('DSGNOMBR').AsString);
  pplfecnacmen.Caption := DM1.cdsDFam.FieldByName('FECNACMEN').AsString;

  ppldirmen.Caption    := DM1.cdsDFam.FieldByName('DIRDOMCOB').AsString;
  ppldptdirmen.Caption := Trim(DM1.DevuelveValor('APO158', 'DPTODES', 'DPTOID', Copy(DM1.cdsDFam.FieldByName('CODZIPCOB').AsString,1,2)))+'/'
                         +Trim(DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', Copy(DM1.cdsDFam.FieldByName('CODZIPCOB').AsString,1,4)))+'/'
                         +Trim(DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', DM1.cdsDFam.FieldByName('CODZIPCOB').AsString));
  ppltelefono.Caption  := DM1.cdsDFam.FieldByName('TELFIJCOB').AsString+' - '+DM1.cdsDFam.FieldByName('TELMOVCOB').AsString;

  pplfecnacmen.Caption := DM1.cdsDFam.FieldByName('FECNACMEN').AsString;
  edad := YearSpan(Date, DM1.cdsDFam.FieldByName('FECNACMEN').AsDatetime);
  If DM1.cdsDFam.FieldByName('FECNACMEN').AsString <> '' Then ppledadmen.Caption := FloatToStr(int(edad))+' Años' Else ppledadmen.Caption := '';
  ppledadmen.Caption := '( '+Trim(ppledadmen.Caption)+' )';
  pplmondes.Caption := FloatToStrF(DM1.cdsDFam.FieldByName('DSGMTOORI').AsFloat,ffNumber,10,2);
  pplmonape.Caption := FloatToStrF(DM1.cdsDFam.FieldByName('DSGMTOEXT').AsFloat,ffNumber,10,2);
  If (DM1.cdsDFam.FieldByName('DSGMTOORI').AsFloat > 0) And (DM1.cdsDFam.FieldByName('DSGMTOEXT').AsFloat >0) Then
    pplblTipoCambio.Caption := FloatToStrF(DM1.cdsDFam.FieldByName('DSGMTOORI').AsFloat/DM1.cdsDFam.FieldByName('DSGMTOEXT').AsFloat,ffNumber,10,2);

  pplcueahomen.Caption := DM1.cdsDFam.FieldByName('CCBCOID').AsString;
  // Datos del tutor
  pplapenomtut.Caption := DM1.cdsDFam.FieldByName('DSGTAPENOM').AsString;
  ppldnitut.Caption    := DM1.cdsDFam.FieldByName('DSGTDNI').AsString;
  ppldirtut.Caption    := DM1.cdsDFam.FieldByName('DSGTDIR').AsString;
  pplteltut.Caption    := DM1.cdsDFam.FieldByName('DSGTTELEF').AsString;
  ppldpttut.Caption    := DM1.DevuelveValor('TGE158', 'DPTODES', 'DPTOID', Copy(DM1.cdsDFam.FieldByName('ZIPID').AsString,1,2));
  pplprvtut.Caption    := DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', Copy(DM1.cdsDFam.FieldByName('ZIPID').AsString,1,4));
  ppldsttut.Caption    := DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', DM1.cdsDFam.FieldByName('ZIPID').AsString);
  // Chequeando si existe numero de constancia de entrega de libreta
  If Trim(DM1.cdsDFam.FieldByName('NROLIBAH').AsString) = '' Then
  Begin
     xSql := 'SELECT LPAD(VARIOS+1, 7, ''0'') VARIOS FROM CRE206 WHERE CREAREA = ''PRE'' AND CORREANO = '+QuotedStr(Copy(DateToStr(DM1.FechaSys),7,4))+' AND TIPO = ''A''';
     DM1.cdsQry.Close;
     DM1.cdsQry.DataRequest(xSql);
     DM1.cdsQry.Open;
     If DM1.cdsQry.RecordCount > 0 Then xNroLib := DM1.cdsQry.FieldByName('VARIOS').AsString Else xNroLib := '0000001';
     DM1.cdsDFam.Edit;
     DM1.cdsDFam.FieldByName('NROLIBAH').AsString := xNroLib;
     DM1.cdsDFam.ApplyUpdates(0);
     xSql := 'UPDATE CRE206 SET VARIOS=LPAD(VARIOS+1, 7, ''0'') WHERE CREAREA = ''PRE'' AND CORREANO = '+QuotedStr(Copy(DateToStr(DM1.FechaSys),7,4))+' AND TIPO = ''A''';
     DM1.DCOM1.AppServer.EjecutaSQL(xSql);
  End;
// Inicio: SPP_201304_PRE
  pplblTitulo.Caption := 'CONSTANCIA DE APERTURA DE CUENTA Y DEPOSITO DE BENEFICIO N° '+DM1.cdsDFam.FieldByName('NROLIBAH').AsString;
// Fin: SPP_201304_PRE
  pplimpresopor.Caption    := 'Impreso por : '+DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
  pplregistradopor.Caption := 'Registrado por : '+DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.cdsDFam.FieldByName('USUREG').AsString);

  ppRepConsEntrega.Print;
end;

procedure TFLibAhoMod.habbot;
begin
  btnCancela.Enabled := True;
  btngraba.Enabled := True;
  btnapertura.Enabled := True;
  btndeposito.Enabled := True;
  btnrepre.Enabled := True;
  btnimprimir.Enabled := True;
  btntutor.Enabled := True;
end;


procedure TFLibAhoMod.memontodolKeyPress(Sender: TObject; var Key: Char);
begin
  If Key In [' ','A'..'Z','a'..'z','°','|','!','"','#','$','%','&','/','(',')','=','?','\','¡','¿','@','¨','´','*','+','~','~','[',']','{','}','^','`','<','>',';',',',':','''','-','_'] Then
     Key :=#0;
end;

procedure TFLibAhoMod.dblcdproidExit(Sender: TObject);
Var xSql:String;
begin
  If Trim(dblcdproid.Text) <> '' Then
  Begin
    xSql := 'SELECT * FROM APO123 WHERE CIUDID = '+QuotedStr(dblcdproid.Text);
    If DM1.verificaexiste(xSql) = False Then
    Begin
      MessageDlg('Código de provincia no valido', mtInformation, [mbOk], 0);
      dblcdproid.Text := '';
      medesprotut.Text := '';
      dblcddisid.Text := '';
      medesdistut.Text := '';
      dblcdproid.SetFocus;
      Exit;
    End;
  End;
end;

procedure TFLibAhoMod.dblcdbancoidExit(Sender: TObject);
Var xSql:String;
begin
  If Trim(dblcdbancoid.Text) <> '' Then
  Begin
    xSql := 'SELECT BANCOID FROM (SELECT BANCOID FROM TGE105 WHERE BANCOID IN (''03'',''04'',''05'')) WHERE BANCOID = '+QuotedStr(dblcdbancoid.Text);
    If DM1.verificaexiste(xSql) = False Then
    Begin
      MessageDlg('Código de banco no valido', mtInformation, [mbOk], 0);
      dblcdbancoid.Text := '';
      dblcdbancoid.SetFocus;
      Exit;
    End;
  End;
end;

procedure TFLibAhoMod.dblcdrepidExit(Sender: TObject);
Var xSql:String;
begin
  If Trim(dblcdrepid.Text) <> '' Then
  Begin
    xSql := 'SELECT * FROM (SELECT REPRID, REPRAPENOM FROM COB201 WHERE NVL(REPRFLGACT, ''X'') = ''A'' AND REPRAPENOM IS NOT NULL)'
    +' WHERE REPRID = '+QuotedStr(dblcdrepid.Text);
    If DM1.verificaexiste(xSql) = False Then
    Begin
      MessageDlg('Código de representante no valido', mtInformation, [mbOk], 0);
      dblcdrepid.Text := '';
      dblcdrepid.SetFocus;
      Exit;
    End;
  End;
end;

procedure TFLibAhoMod.dblcddptoidrepExit(Sender: TObject);
Var xSql:String;
begin
  If Trim(dblcddptoidrep.Text) <> '' Then
  Begin
    xSql := 'SELECT * FROM APO158 WHERE DPTOID = '+QuotedStr(dblcddptoidrep.Text);
    If DM1.verificaexiste(xSql) = False Then
    Begin
      MessageDlg('Código de departamento no valido', mtInformation, [mbOk], 0);
      dblcddptoidrep.Text := '';
      medesdptorep.Text := '';
      dblcdprovidrep.Text := '';
      medesprovrep.Text := '';
      dblcddistidrep.Text := '';
      medesdistrep.Text := '';
      dblcddptoidrep.SetFocus;
      Exit;
    End;
  End;
end;

procedure TFLibAhoMod.dblcdprovidrepExit(Sender: TObject);
Var xSql:String;
begin
 If Trim(dblcdprovidrep.Text) <> '' Then
  Begin
    xSql := 'SELECT * FROM APO123 WHERE CIUDID = '+QuotedStr(dblcdprovidrep.Text);
    If DM1.verificaexiste(xSql) = False Then
    Begin
      MessageDlg('Código de provincia no valido', mtInformation, [mbOk], 0);
      dblcdprovidrep.Text := '';
      medesprovrep.Text := '';
      dblcddistidrep.Text := '';
      medesdistrep.Text := '';
      dblcdprovidrep.SetFocus;
      Exit;
    End;
  End;
end;

end.
