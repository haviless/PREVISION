unit PRE927;

// Actualizaciones
// HPC_201202_PRE 10/02/20002 Desactiva lectura de Foto y Firma de FTP, lee de archivo RENIEC
// DPP_201201_PRE : Se realiza el pase a producción de acuerdo al HPC_201202_PRE
// HPC_201305_PRE : Em el reporte liquidación de beneficio se añade eqtiqueta de forma de solicitud de beneficio
//                  Se modifica el margen de la liquidación.
//                  Se añade etiqueta de regimen de pension
// SPP_201306_PRE  : Se realiza el pase a producción a partir del HPC_201305_PRE
// HPC_201307_PRE  : Añadir imagen del nuevo logo institucional
// SPP_201401_PRE  : Se realiza el pase a producción a partir del pase HPC_201307_PRE
// HPC_201609_PRE : Se controla los registos que van a contabizar el total de la cuenta individual.
// HPC_201802_PRE : Se modifica en mensaje cuando la liquidación no cuenta con formas de pago
// HPC_201809_PRE : Se retira procedimiento de borar fotos del disco duro

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, wwdblook, StdCtrls, Buttons,
  wwdbdatetimepicker, ppDB, ppDBPipe, ppDBBDE, ppParameter, ppBands,
  ppReport, ppStrtch, ppSubRpt, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppComm, ppRelatv, ppProd, IniFiles, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdFTP,  ppTypes, ppVar, jpeg ; // SPP_201401_PRE

type
  TFRepliqxDpto = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbdtpInicial: TwwDBDateTimePicker;
    dbdtpFinal: TwwDBDateTimePicker;
    medesdep: TEdit;
    btnImprimePrevio: TBitBtn;
    dblcdtipdpto: TwwDBLookupCombo;
    dbgliqben: TwwDBGrid;
    btntodas: TBitBtn;
    btncerrar: TBitBtn;
    pprImprimePrevio: TppReport;
    BDEPDetCalLiq: TppBDEPipeline;
    BDEPDetDes: TppBDEPipeline;
    BDEPRetJud: TppBDEPipeline;
    BDEPObs: TppBDEPipeline;
    BDEPForPag: TppBDEPipeline;
    BDEPDetDev: TppBDEPipeline;
    IdFTP1: TIdFTP;
    ppParameterList1: TppParameterList;
//Inicio: SPP_201401_PRE
    // ppLabel1: TppLabel;  
    // ppLabel2: TppLabel;  
    // ppLabel3: TppLabel;  
//Fin: SPP_201401_PRE
    pplblLiqBen: TppLabel;
    ppldesben: TppLabel;
    pplfecliq: TppLabel;
    ppLine1: TppLine;
    ppLabel7: TppLabel;
    pplAsoApeNomDni: TppLabel;
    pplAsoDni: TppLabel;
    pplZipDes: TppLabel;
    pplAsoDir: TppLabel;
    pplAsoCodMod: TppLabel;
    pplCentroEducativo: TppLabel;
    pplUse: TppLabel;
    pplUseZip: TppLabel;
    ppShape3: TppShape;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    pplFecNom: TppLabel;
    pplFecCes: TppLabel;
    pplAnoApo: TppLabel;
    pplNumResNoM: TppLabel;
    pplNumResCes: TppLabel;
    pplUltApo: TppLabel;
    pplasotelef: TppLabel;
    ImagAso: TppImage;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppSRDevoluciones: TppSubReport;
    ppChildRDevolucion: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppLine4: TppLine;
    ppLabel19: TppLabel;
    ppShape10: TppShape;
    ppShape11: TppShape;
    ppDetailBand2: TppDetailBand;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppShape14: TppShape;
    ppShape15: TppShape;
    ppSummaryBand2: TppSummaryBand;
    ppLine5: TppLine;
    ppLabel20: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppShape12: TppShape;
    ppShape13: TppShape;
    ppLabel5: TppLabel;
    SRObs: TppSubReport;
    ppChildReport4: TppChildReport;
    ppTitleBand5: TppTitleBand;
    ppLine10: TppLine;
    ppLabel27: TppLabel;
    ppShape35: TppShape;
    ppShape36: TppShape;
    ppDetailBand6: TppDetailBand;
    ppShape37: TppShape;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppShape38: TppShape;
    ppSummaryBand6: TppSummaryBand;
    ppLine12: TppLine;
    ppShape39: TppShape;
    ppShape40: TppShape;
    ppLabel29: TppLabel;
    ppShape41: TppShape;
    ppLine13: TppLine;
    ppLabel30: TppLabel;
    ppLine14: TppLine;
    pplblUsuario: TppLabel;
    ppanula: TppLabel;
    pplimppor: TppLabel;
    ppSRRetJud: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand4: TppTitleBand;
    ppShape29: TppShape;
    ppShape30: TppShape;
    ppDetailBand5: TppDetailBand;
    ppShape31: TppShape;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppShape32: TppShape;
    ppSummaryBand5: TppSummaryBand;
    ppLine11: TppLine;
    ppLabel28: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppShape33: TppShape;
    ppShape34: TppShape;
    ppLabel33: TppLabel;
    SRForPago: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppLine8: TppLine;
    ppLabel23: TppLabel;
    ppShape22: TppShape;
    ppShape23: TppShape;
    ppDetailBand4: TppDetailBand;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppShape24: TppShape;
    ppShape25: TppShape;
    ppSummaryBand4: TppSummaryBand;
    ppLine9: TppLine;
    ppLabel24: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppShape26: TppShape;
    ppShape27: TppShape;
    ppLabel32: TppLabel;
    ppSRDescuentos: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppLine6: TppLine;
    ppLabel21: TppLabel;
    ppShape16: TppShape;
    ppShape17: TppShape;
    ppDetailBand3: TppDetailBand;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppShape18: TppShape;
    ppShape19: TppShape;
    ppSummaryBand3: TppSummaryBand;
    ppLine7: TppLine;
    ppLabel22: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppShape20: TppShape;
    ppShape21: TppShape;
    ppShape28: TppShape;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    pplSalDis: TppLabel;
    ppLabel6: TppLabel;
    ppLabel31: TppLabel;
    SRDetLiq: TppSubReport;
    ppDetailBand7: TppDetailBand;
    ppSummaryBand7: TppSummaryBand;
    ppLine2: TppLine;
    ppLabel17: TppLabel;
    ppShape4: TppShape;
    ppShape7: TppShape;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppShape6: TppShape;
    ppShape5: TppShape;
    ppLabel18: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppShape9: TppShape;
    ppShape8: TppShape;
    ppLabel4: TppLabel;
    ppLine3: TppLine;
    ppBDEPReporte: TppBDEPipeline;
    ppTitleBand6: TppTitleBand;
    ppDBText13: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppSystemVariable1: TppSystemVariable;
    ppLabel37: TppLabel;
    pploriexp: TppLabel;   // SPP_201306_PRE
    ppLabel90: TppLabel;    // SPP_201306_PRE
    pplregpen: TppLabel;  // SPP_201306_PRE
    ppImage1: TppImage;  // SPP_201401_PRE
    procedure FormActivate(Sender: TObject);
    procedure btnImprimePrevioClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dblcdtipdptoChange(Sender: TObject);
    procedure btntodasClick(Sender: TObject);
    //INICIO: DPP_201201_PRE
    //SE RETIRA LA CARGA DE FOTO POR FTP
    //procedure CargaFoto(IdFoto: String);
    //FINAL: DPP_201201_PRE
    // Inicio: HPC_201809_PRE
    // Se retira procedimiento para borrar fotos del disco duro   
    // procedure BorraFotos;
    // Fin: HPC_201809_PRE
    procedure btncerrarClick(Sender: TObject);
    procedure ppDetailBand1BeforePrint(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRepliqxDpto: TFRepliqxDpto;

implementation

uses PREDM;

{$R *.dfm}

procedure TFRepliqxDpto.FormActivate(Sender: TObject);
Var xSql:String;
begin
  xSql := 'SELECT DPTOID, DPTODES FROM APO158';
  DM1.cdsDpto.Close;
  DM1.cdsDpto.DataRequest(xSql);
  DM1.cdsDpto.Open;

  dblcdtipdpto.Selected.Clear;
  dblcdtipdpto.Selected.Add('DPTOID'#9'2'#9'Código'#9#9);
  dblcdtipdpto.Selected.Add('DPTODES'#9'25'#9'Departamento'#9#9);

  btntodas.Enabled := False;
  // Inicio: SPP_201306_PRE
  // xSql := 'SELECT A.ASOID, A.PVSLTIPBE, A.PVSLFECBE, A.PVSLBENNR, A.ASOCODMOD, A.ASOAPENOMDNI, C.BENEFDES, D.DPTODES'
  xSql := 'SELECT A.ASOID, A.PVSLTIPBE, A.PVSLFECBE, A.PVSLBENNR, A.ASOCODMOD, A.ASOAPENOMDNI, C.BENEFDES, D.DPTODES, B.FORSOLBEN, E.REGPENID, CODAFP'
  +' FROM PVS306 A, PVS301 B, TGE186 C, APO158 D, APO201 E'
  +' WHERE TO_DATE(A.PVSLFECBE) >= '''' AND TO_DATE(A.PVSLFECBE) <= '''''
  // +' AND A.PVSESTLIQ IN (''02'', ''05'', ''06'') AND A.ASOID = B.ASOID AND A.PVSLBENNR = B.PVSLBENNR AND SUBSTR(B.DISORIEXP,1,2) = '''' AND A.PVSLTIPBE = C.TIPBENEF'
  +' AND A.PVSESTLIQ IN (''02'', ''05'', ''06'') AND A.ASOID = B.ASOID(+) AND A.PVSLBENNR = B.PVSLBENNR(+)'
  +' AND SUBSTR(B.DISORIEXP,1,2) = '''' AND A.PVSLTIPBE = C.TIPBENEF AND A.ASOID = E.ASOID(+)'
  // Fin: SPP_201306_PRE
  +' AND SUBSTR(B.DISORIEXP,1,2) = D.DPTOID';
  DM1.cdsReporte.Close;
  DM1.cdsReporte.DataRequest(xSql);
  DM1.cdsReporte.Open;

  dbgliqben.Selected.Clear;
  // Inicio: HPC_201609_PRE
  // Se añade en el grid la fecha de beneficio
  // dbgliqben.Selected.Add('AUT_DESC'#9'18'#9'Autorización~de descuento'#9#9);
  dbgliqben.Selected.Add('PVSLFECBE'#9'10'#9'Fecha de~la liquidación'#9#9);
  // Fin: HPC_201609_PRE

  dbgliqben.Selected.Add('PVSLBENNR'#9'11'#9'Número de~la liquidación'#9#9);
  dbgliqben.Selected.Add('ASOCODMOD'#9'10'#9'Código~Modular'#9#9);
  dbgliqben.Selected.Add('ASOAPENOMDNI'#9'45'#9'Apellidos y Nombre(s)~del asociado'#9#9);
  dbgliqben.Selected.Add('BENEFDES'#9'15'#9'Tipo de~Beneficio'#9#9);
  dbgliqben.Selected.Add('DPTODES'#9'15'#9'Departamento~de Origen'#9#9);
  dbgliqben.ApplySelected;

end;

procedure TFRepliqxDpto.btnImprimePrevioClick(Sender: TObject);
Var xSql:String;
begin
  If dbdtpInicial.Text = '' Then
  Begin
    MessageDlg('No se ingreso la fecha inicial', mtInformation, [mbOk], 0);
    dbdtpInicial.SetFocus;
    Exit;
  End;
  If dbdtpFinal.Text = '' Then
  Begin
    MessageDlg('No se ingreso la fecha final', mtInformation, [mbOk], 0);
    dbdtpFinal.SetFocus;
    Exit;
  End;
  If dblcdtipdpto.Text = '' Then
  Begin
    MessageDlg('No se ingreso el departamento', mtInformation, [mbOk], 0);
    dbdtpFinal.SetFocus;
    Exit;
  End;
  If dbdtpFinal.Date < dbdtpInicial.Date Then
  Begin
    MessageDlg('La fecha final es menor que la fecha inicial', mtInformation, [mbOk], 0);
    dbdtpFinal.SetFocus;
    Exit;
  End;
  // Inicio: HPC_201609_PRE
  // Se valida la busqueda de las liquidaciones de beneficio de tal manera que se 
  // incluya el departamento de origen
  // xSql := 'SELECT A.ASOID, A.PVSLTIPBE, A.PVSLFECBE, A.PVSLBENNR, A.ASOCODMOD, A.ASOAPENOMDNI, C.BENEFDES, D.DPTODES, B.FORSOLBEN, E.REGPENID, E.CODAFP'
  // +' FROM PVS306 A, PVS301 B, TGE186 C, APO158 D, APO201 E'
  // +' WHERE TO_DATE(A.PVSLFECBE) >= '+QuotedStr(dbdtpInicial.Text)+' AND TO_DATE(A.PVSLFECBE) <= '+QuotedStr(dbdtpFinal.Text)
  // +' AND A.PVSESTLIQ IN (''02'', ''05'', ''06'') AND A.ASOID = B.ASOID(+) AND A.PVSLBENNR = B.PVSLBENNR(+) AND SUBSTR(B.DISORIEXP,1,2) = '+QuotedStr(dblcdtipdpto.Text)+' AND A.PVSLTIPBE = C.TIPBENEF'
  // +' AND SUBSTR(B.DISORIEXP,1,2) = D.DPTOID AND A.ASOID = E.ASOID(+)';
  xSql := 'SELECT A.ASOID, A.PVSLTIPBE, A.PVSLFECBE, A.PVSLBENNR, A.ASOCODMOD, A.ASOAPENOMDNI, C.BENEFDES, D.DPTODES, B.FORSOLBEN, E.REGPENID, E.CODAFP'
  +' FROM PVS306 A, PVS301 B, TGE186 C, APO158 D, APO201 E'
  +' WHERE TO_DATE(A.PVSLFECBE) >= '+QuotedStr(dbdtpInicial.Text)+' AND TO_DATE(A.PVSLFECBE) <= '+QuotedStr(dbdtpFinal.Text)
  +' AND A.PVSESTLIQ IN (''02'', ''05'', ''06'') AND A.ASOID = B.ASOID(+) AND A.PVSLBENNR = B.PVSLBENNR(+)'
  +' AND B.DEPORIEXP = '+QuotedStr(dblcdtipdpto.Text)+' AND A.PVSLTIPBE = C.TIPBENEF(+) AND A.ASOID = E.ASOID(+) AND B.DEPORIEXP = D.DPTOID(+)';
  // Fin: HPC_201609_PRE
  DM1.cdsReporte.Close;
  DM1.cdsReporte.DataRequest(xSql);
  DM1.cdsReporte.Open;
  If DM1.cdsReporte.RecordCount = 0 Then
  Begin
    btntodas.Enabled := False;
  End
  Else
  Begin
    btntodas.Enabled := True;
  End;
end;

procedure TFRepliqxDpto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
    begin
     Key := #0;
     Perform(CM_DIALOGKEY, VK_TAB, 0);
    end;
end;

procedure TFRepliqxDpto.dblcdtipdptoChange(Sender: TObject);
begin
 If dblcdtipdpto.Text = '' Then medesdep.Text := '';
 If Length(dblcdtipdpto.Text) = 2 Then
 Begin
    If DM1.cdsDpto.Locate('DPTOID', dblcdtipdpto.Text, []) Then
    Begin
      medesdep.Text := DM1.cdsDpto.FieldByName('DPTODES').AsString;
    End
    Else
    Begin
      MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
      dblcdtipdpto.Text := '';
      medesdep.Text := '';
      dblcdtipdpto.SetFocus;
    End;
  End;
end;

Procedure TFRepliqxDpto.btntodasClick(Sender: TObject);
Begin
  pprImprimePrevio.Print;
End;

// Inicio: HPC_201809_PRE
// Se retira procedimiento para borrar fotos del disco duro
// procedure TFRepliqxDpto.BorraFotos;
// Var search: TSearchRec;
//     nFiles: integer;
// begin
//   nFiles:=FindFirst('C:\SOLEXES\*.JPG', faAnyFile,  search );
//   while nFiles=0 do
//   begin
//     SysUtils.DeleteFile('C:\SOLEXES\'+ Search.Name);
//     nFiles:=FindNext( Search );
//   end;
//   FindClose(Search);
// end;
// Fin: HPC_201809_PRE


//INICIO: DPP_201201_PRE
//SE RETIRA LA CARGA DE FOTO POR FTP
{procedure TFRepliqxDpto.CargaFoto(IdFoto: String);
var RemoteTxt, LocalTxt,xFtp:String;
    IniFile : TIniFile;
begin
 ImagAso.Visible := True;
 IniFile:=TIniFile.Create('C:\SOLExes\SOLConf.ini'); xFtp:=IniFile.ReadString('FOTOS','FTP','');
 IDFTP1.Host := xFtp; IDFTP1.Port := 21; IDFTP1.ReadTimeout := 5000; IDFTP1.UserName := 'imagen'; IDFTP1.Password := 'imagen';
 Try
   IDFTP1.Connect;
   If Trim(IdFoto) <> '' then
   Begin
     Try
       SysUtils.deletefile(LocalTxt);
       BorraFotos;
       RemoteTxt := '/data02/imagen/jpeg/JPEG'+copy(IdFoto,1,1)+'/'+IdFoto+'.jpg';
       LocalTxt  :=  'C:\SolExes\'+IdFoto+'.jpg';
       DeleteFile('C:\SolExes\'+IdFoto+'.jpg');
       IdFTP1.Get(RemoteTxt, LocalTxt, False);
       ImagAso.Picture.LoadFromFile(LocalTxt);
     Except
     End;
   End
   Else
   Begin
     Try
       SysUtils.deletefile(LocalTxt);
       BorraFotos;
       RemoteTxt := '/data02/imagen/jpeg/SINFOTO.jpg';
       LocalTxt  :=  'C:\SolExes\SINFOTO.Jpg';
       IdFTP1.Get(RemoteTxt, LocalTxt, False);
       ImagAso.Picture.LoadFromFile(LocalTxt);
     Except
     End;
   End;
 Except
     MessageDlg('Error al Intentar Conectar Al Servidor De Fotos (RS/6000) ...!', mtError, [mbOk], 0);
 End;
 idFTP1.Disconnect;
end;}
//FINAL: DPP_201201_PRE


procedure TFRepliqxDpto.btncerrarClick(Sender: TObject);
begin
  FRepliqxDpto.Close;
end;

procedure TFRepliqxDpto.ppDetailBand1BeforePrint(Sender: TObject);
Var xSql:String;
begin
  xSql := 'SELECT * FROM PVS306 WHERE PVSLBENNR = '+QuotedStr(DM1.cdsReporte.FieldByName('PVSLBENNR').AsString);
  DM1.cdsCabLiq.Close;
  DM1.cdsCabLiq.DataRequest(xSql);
  DM1.cdsCabLiq.Open;

  xSql := 'SELECT * FROM APO201 WHERE ASOID = '+QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString);
  DM1.cdsAsociado.Close;
  DM1.cdsAsociado.DataRequest(xSql);
  DM1.cdsAsociado.Open;

  // Detalle de calculo de beneficios
  DM1.liquidacionbeneficio := 0;
  xSql := 'SELECT PVSLCONCE, PVSLMONTO  FROM PVS307 WHERE PVSLBENNR = '+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
  // Inicio: HPC_201609_PRE
  // Se controla que al momento de tomar el monto del beneficio no tome la descripcipión del total cuenta individual
  // los aportes, los intereses y los bonus ("FA", "FI","FB")
  // +' AND PVSLAGRID = ''DET'' ORDER BY PVSLSEC';
  +' AND PVSLAGRID = ''DET'' AND TIPDES <> ''TC'' ORDER BY PVSLSEC';
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
    DM1.liquidacionbeneficio := DM1.liquidacionbeneficio + DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat;
    DM1.cdsQry.Next;
  End;
  If DM1.cdsDetCalLiq.RecordCount = 0 Then
  Begin
    DM1.cdsDetCalLiq.Append;
    DM1.cdsDetCalLiq.FieldByName('DESC').AsString := 'ERROR NO EXISTE INFORMACION DE CALCULO DE BENEFICIOS';
    DM1.cdsDetCalLiq.Post;
  End;
  // Detalle de Devoluciones
  DM1.montoDevolucion := 0;
  xSql := 'SELECT PVSLCONCE, PVSLMONTO  FROM PVS307 WHERE PVSLBENNR = '+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
  +' AND PVSLAGRID = ''DEV'' ORDER BY PVSLSEC';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  DM1.cdsQry.First;
  DM1.cdsDetDev.EmptyDataSet;
  While Not DM1.cdsQry.Eof Do
  Begin
    DM1.cdsDetDev.Append;
    DM1.cdsDetDev.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString;
    DM1.cdsDetDev.FieldByName('MONTO').AsFloat := DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat;
    DM1.cdsDetDev.Post;
    DM1.montoDevolucion := DM1.montoDevolucion + DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat;
    DM1.cdsQry.Next;
  End;
  // Detalle de Descuentos
  DM1.montoDescuento := 0;
  xSql := 'SELECT PVSLCONCE, PVSLMONTO, CREDID FROM PVS307 WHERE PVSLBENNR = '+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
  +' AND PVSLAGRID = ''DSC'' ORDER BY PVSLSEC';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  DM1.cdsQry.First;
  DM1.cdsDetDes.EmptyDataSet;
  While Not DM1.cdsQry.Eof Do
  Begin
    DM1.cdsDetDes.Append;
    DM1.cdsDetDes.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString;
    DM1.cdsDetDes.FieldByName('MONTO').AsFloat := DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat;
    DM1.cdsDetDes.FieldByName('CREDID').AsString := DM1.cdsQry.FieldByName('CREDID').AsString;
    DM1.montoDescuento := DM1.montoDescuento + DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat;
    DM1.cdsDetDes.Post;
    DM1.cdsQry.Next;
  End;
  // Formas de Pago
  DM1.totalMontoFormadePago := 0;
  xSql := 'SELECT PVSLCONCE, PVSLMONTO, PVSLNOFC, NROCHEQUE, PVSLNVOU FROM PVS307 WHERE PVSLBENNR = '+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
  +' AND PVSLAGRID = ''FPG'' ORDER BY PVSLSEC';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  DM1.cdsQry.First;
  DM1.cdsForPag.EmptyDataSet;
  While Not DM1.cdsQry.Eof Do
  Begin
    DM1.cdsForPag.Append;
    If Copy (DM1.cdsQry.FieldByName('PVSLCONCE').AsString,1,1) <> '*' Then
    Begin
      If DM1.cdsQry.FieldByName('PVSLNOFC').AsString <> '' Then
         DM1.cdsForPag.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString+'  [OFC:'+DM1.cdsQry.FieldByName('PVSLNOFC').AsString+']'
      Else If DM1.cdsQry.FieldByName('NROCHEQUE').AsString <> '' Then
         DM1.cdsForPag.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString+'  [CHQ:'+DM1.cdsQry.FieldByName('NROCHEQUE').AsString+']'
      Else DM1.cdsForPag.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString;
    End
    Else
      DM1.cdsForPag.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString+'  [VOUCHER N° '+DM1.cdsQry.FieldByName('PVSLNVOU').AsString+']';
    DM1.cdsForPag.FieldByName('MONTO').AsFloat := DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat;
    DM1.cdsForPag.Post;
    DM1.totalMontoFormadePago := DM1.totalMontoFormadePago + DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat;
    DM1.cdsQry.Next;
  End;
  If DM1.cdsDetDes.RecordCount = 0 Then
  Begin
    DM1.cdsDetDes.Append;
    // Inicio: HPC_201802_PRE
    // Se modifica el mensaje de la forma de pago
    // DM1.cdsDetDes.FieldByName('DESC').AsString := 'Error no existen designatarios';
    DM1.cdsDetDes.FieldByName('DESC').AsString := 'Sin información de desembolso';
    // Fin: HPC_201802_PRE
    DM1.cdsDetDes.Post;
  End;
  //Retenciones judiciales
  xSql := 'SELECT PVSLCONCE, PVSLMONTO  FROM PVS307 WHERE PVSLBENNR = '+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
  +' AND PVSLAGRID = ''RET'' ORDER BY PVSLSEC';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  If DM1.cdsQry.RecordCount > 0 Then
  Begin
    DM1.cdsRetJud.EmptyDataSet;
    While Not DM1.cdsQry.Eof Do
    Begin
      DM1.cdsRetJud.Append;
      DM1.cdsRetJud.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString;
      DM1.cdsRetJud.FieldByName('MONTO').AsFloat := DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat;
      DM1.cdsRetJud.Post;
      DM1.totalMontoFormadePago := DM1.totalMontoFormadePago + DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat;
      DM1.cdsQry.Next;
    End;
  End;
  // Observaciones
  xSql := 'SELECT PVSLCONCE, PVSLMONTO  FROM PVS307 WHERE PVSLBENNR = '+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString)
  +' AND PVSLAGRID = ''OBS'' ORDER BY PVSLSEC';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  DM1.cdsQry.First;
  DM1.cdsObs.EmptyDataSet;
  While Not DM1.cdsQry.Eof Do
  Begin
    DM1.cdsObs.Append;
    DM1.cdsObs.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString;
    DM1.cdsObs.FieldByName('MONTO').AsFloat := DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat;
    DM1.cdsObs.Post;
    DM1.cdsQry.Next;
  End;
  If DM1.cdsObs.RecordCount = 0 Then
  Begin
    DM1.cdsObs.Append;
    DM1.cdsObs.FieldByName('DESC').AsString := 'NO EXISTEN OBSERVACIONES REGISTRADAS';
    DM1.cdsObs.Post;
  End;
  //INICIO: DPP_201201_PRE
  //SE RETIRA LA CARGA DE FOTO POR FTP
  //CargaFoto(DM1.cdsAsociado.FieldByName('IDIMAGE').AsString);
   dm1.CargaImagenes(DM1.cdsAsociado.FieldByName('ASODNI').AsString);
   ImagAso.Picture.Assign(DM1.Jpg);
  //FINAL: DPP_201201_PRE
  If (DM1.cdsCabLiq.FieldByName('PVSESTLIQ').AsString = '04') Or (DM1.cdsCabLiq.FieldByName('PVSESTLIQ').AsString = '13') Then
  Begin
    ppanula.Visible := True;
    ppanula.Caption := 'LIQUIDACION ANULADA POR : '+UpperCase(DM1.DevuelveValor('USERTABLE', 'USERNOM', 'USERID', DM1.cdsCabLiq.FieldByName('PVSUSUANUL').AsString ))
    +' EL : '+DM1.cdsCabLiq.FieldByName('PVSFANUL').AsString;
  End
  Else
    ppanula.Visible := False;
  ppldesben.Caption   := DM1.DevuelveValor('TGE186', 'BENEFDES', 'TIPBENEF', DM1.cdsCabLiq.FieldByName('PVSLTIPBE').AsString);
  pplblLiqBen.Caption := 'LIQUIDACION DE BENEFICIO Nº '+Copy(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString,5,7);
  pplfecliq.Caption   := 'FECHA : '+DM1.cdsCabLiq.FieldByname('HREG').AsString;
  pplAsoApeNomDni.Caption := DM1.cdsCabLiq.FieldByname('ASOAPENOMDNI').AsString;
  pplAsoDni.Caption       := DM1.cdsCabLiq.FieldByname('ASODNI').AsString;
  pplasotelef.Caption     := DM1.cdsCabLiq.FieldByname('ASOTELF1').AsString;
  pplAsoDir.Caption       := DM1.cdsCabLiq.FieldByname('ASODIR').AsString;
  pplZipDes.Caption       := DM1.DevuelveValor('APO158', 'DPTODES', 'DPTOID', Copy(DM1.cdsCabLiq.FieldByName('ZIPID').AsString,1,2))+'/'
  + DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', Copy(DM1.cdsCabLiq.FieldByName('ZIPID').AsString,1,4))+'/'
  + DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', DM1.cdsCabLiq.FieldByName('ZIPID').AsString);
  pplAsoCodMod.Caption    := DM1.cdsCabLiq.FieldByName('ASOCODMOD').AsString;
  pplCentroEducativo.Caption := DM1.cdsCabLiq.FieldByName('ASODESLAB').AsString;
  xSql := 'SELECT USENOM FROM APO101 WHERE USEID = '+QuotedStr(DM1.cdsCabLiq.FieldByName('USEID').AsString)
  +' AND UPAGOID = '+QuotedStr(DM1.cdsCabLiq.FieldByName('UPAGOID').AsString)+' AND UPROID = '+QuotedStr(DM1.cdsCabLiq.FieldByName('UPROID').AsString);
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  pplUse.Caption := 'U.S.E. : '+DM1.cdsQry.FieldByName('USENOM').AsString;
  pplUseZip.Caption := DM1.DevuelveValor('APO158', 'DPTODES', 'DPTOID', Copy(DM1.cdsCabLiq.FieldByName('ASODSTLABID').AsString,1,2))+'/'
  + DM1.DevuelveValor('APO123', 'CIUDDES', 'CIUDID', Copy(DM1.cdsCabLiq.FieldByName('ASODSTLABID').AsString,1,4))+'/'
  + DM1.DevuelveValor('APO122', 'ZIPDES', 'ZIPID', DM1.cdsCabLiq.FieldByName('ASODSTLABID').AsString);
  pplFecNom.Caption := DM1.cdsCabLiq.FieldByName('ASOFRESNOM').AsString;
  pplFecCes.Caption := DM1.cdsCabLiq.FieldByName('ASOFRESCESE').AsString;
  pplNumResNoM.Caption := DM1.cdsCabLiq.FieldByName('ASORESNOM').AsString;
  pplNumResCes.Caption := DM1.cdsCabLiq.FieldByName('ASORESCESE').AsString;
  pplUltApo.Caption    := DM1.cdsCabLiq.FieldByName('PVSLULAP').AsString;
  pplAnoApo.Caption := DM1.cdsCabLiq.FieldByName('PVSLTAAP').AsString;
  pplSalDis.Caption := FloatToStrF(DM1.liquidacionbeneficio+DM1.montoDevolucion-DM1.montoDescuento, ffNumber, 10,2);
  pplblUsuario.Caption := UpperCase(DM1.DevuelveValor('USERTABLE', 'USERNOM', 'USERID', DM1.cdsCabLiq.FieldByName('USUARIO').AsString ));
  pplimppor.Caption := 'IMPRESO POR : '+ UpperCase(DM1.DevuelveValor('USERTABLE', 'USERNOM', 'USERID', DM1.wUsuario ));

  // Inicio: SPP_201306_PRE
  If DM1.cdsReporte.FieldByName('FORSOLBEN').AsString = 'O' Then pploriexp.Caption := 'ORIGEN : OFICIO INTERNO';
  If DM1.cdsReporte.FieldByName('FORSOLBEN').AsString = 'S' Then pploriexp.Caption := 'ORIGEN : SOLICITUD DEL BENEFICIARIO';
  pplregpen.Caption := DM1.DevuelveValor('APO105', 'REGPENABR', 'REGPENID', Copy(DM1.cdsReporte.FieldByName('REGPENID').AsString,1,2));
  If DM1.cdsReporte.FieldByName('REGPENID').AsString = '03' Then
  Begin
     xSql := 'SELECT SUBSTR(PROV,4,2) CODAFP, PROVDES DESAFP  FROM TGE201 WHERE SUBSTR(PROV,1,1) = ''A'' AND CLAUXID = ''A'' AND SUBSTR(PROV,4,2) = '+QuotedStr(DM1.cdsReporte.FieldByName('CODAFP').AsString);
     DM1.cdsQry.Close;
     DM1.cdsQry.DataRequest(xSql);
     DM1.cdsQry.Open;
     pplregpen.Caption := pplregpen.Caption + ' - ' + DM1.cdsQry.FieldByName('DESAFP').AsString;
   End;
  // Fin: SPP_201306_PRE




end;

end.
