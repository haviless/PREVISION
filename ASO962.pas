// Inicio Uso Estándares: 01/08/2011
// Unidad               : ASO962
// Formulario           : FGenCheGerBen
// Fecha de Creación    : 16/07/2014
// Autor                : Area de desarrollo de sistemas.
// Objetivo             : Generar cheques de gerencia

// Actualizaciones
// Inicio: HPP_201002_PRE por IREVILLA
// se traslada de Asociados a Previsión
// HPC_201202_PRE 10/02/20002 Desactiva lectura de Foto y Firma de FTP, lee de archivo RENIEC
// DPP_201201_PRE   : Se realiza el pase a producción de acuerdo al HPC_201202_PRE
// HPC_201305_PRE   : Se modifica la fecha por defecto de inicio y fin de proceso.
//                    Corrección en la impresión de foto en la liquidación de beneficio.
//                    Se retira el boton de impresión de liquidación (btnLiquidacion. La propiedad Visible queda en falso)
//                    Se añade la impresión de liquidación en el boton "Cheque".
//                    Se añade al grid principal de cheque el numero de liquidación.
//                    Se añade en el reporte liquidación de beneficio. Forma de solicitud de beneficio
//                    Se añade regimen de pensión de la liquidación
// SPP_201306_PRE   : Se realiza el pase a producción a partir del HPC_201305_PRE
// HPC_201307_PRE   : Se añade nuevo logo institucional
// SPP_201401_PRE   : Se realiza el pase a producción a partir del pase HPC_201307_PRE
// HPC_201402_PRE   : Se añade en el reporte de liquidación de beneficio el campo apellido de casada.
// SPP_201403_PRE   : Se realiza el pase a producción a partir del pase HPC_201402_PRE
// HPC_201507_PRE   : Se modifica reporte de liquidación de beneficio
// HPC_201607_PRE   : Cambio de campo (ANTES SUBSTR(DISORIEXP,1,2), AHORA DEPORIEXP)
// HPC_201709_PRE   : Se añaden los campo telefonos 1 y 2, departamento y oficina de origen.
//                    Se modifica rengo de fecha por defecto de 30 dias a 180 dias.
// HPC_201802_PRE   : Se modifica la forma de mostrar formas de pago

unit ASO962;
interface

uses

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, Mask, db,
  wwdbdatetimepicker, ppBarCod, ppCtrls, jpeg, ppPrnabl, ppClass, ppCache,
  ppBands, ppComm, ppRelatv, ppProd, ppReport, ComCtrls, ppDB, ppDBPipe,
  ppDBBDE, ppVar, DBGrids, ppParameter, ppStrtch, ppSubRpt, IniFiles,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdFTP,
  DBClient;

type
  TFGenCheGerBen = class(TForm)
    btncerrar: TBitBtn;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dbdinicio: TwwDBDateTimePicker;
    dbdfinal: TwwDBDateTimePicker;
    BitBtn1: TBitBtn;
    pprcarrec: TppReport;
    ppDetailBand1: TppDetailBand;
    //Inicio: SPP_201401_PRE
    // ppImage1: TppImage; 
    // ppLabel1: TppLabel; 
    //Fin: SPP_201401_PRE
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    pplpvsnombre: TppLabel;
    ppldni: TppLabel;
    pplfecha: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppldes01: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppldes02: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppbcDNIRUC: TppBarCode;
    pccheger: TPageControl;
    ts01: TTabSheet;
    ts02: TTabSheet;
    dbgcheger: TwwDBGrid;
    btnimprimir: TBitBtn;
    pnlapenom: TPanel;
    Label3: TLabel;
    pnlasoapenomdni: TPanel;
    edtBuscarDet: TEdit;
    dbgdetimp: TwwDBGrid;
    BitBtn2: TBitBtn;
    ppbdepyaimpreso: TppBDEPipeline;
    ppryaimpresos: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    //Inicio: SPP_201401_PRE
    // ppLabel114: TppLabel; 
    // ppLabel115: TppLabel; 
    //Fin: SPP_201401_PRE
    ppLabel116: TppLabel;
    ppLabel120: TppLabel;
    ppLabel121: TppLabel;
    ppLabel122: TppLabel;
    ppSystemVariable19: TppSystemVariable;
    ppSystemVariable20: TppSystemVariable;
    ppSystemVariable21: TppSystemVariable;
    ppLabel123: TppLabel;
    ppLabel124: TppLabel;
    ppLabel125: TppLabel;
    ppShape1: TppShape;
    ppLabel10: TppLabel;
    ppShape2: TppShape;
    ppLabel18: TppLabel;
    ppShape3: TppShape;
    ppLabel25: TppLabel;
    ppShape4: TppShape;
    ppLabel26: TppLabel;
    ppShape5: TppShape;
    ppLabel27: TppLabel;
    ppShape6: TppShape;
    ppLabel28: TppLabel;
    ppShape7: TppShape;
    ppLabel29: TppLabel;
    ppShape8: TppShape;
    ppLabel30: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLine1: TppLine;
    ppDBCalc1: TppDBCalc;
    ppLine2: TppLine;
    pplimpresopor: TppLabel;
    BitBtn3: TBitBtn;
    btnExcel: TBitBtn;
    dtgData: TDBGrid;
    BitBtn4: TBitBtn;
    btnLiquidacion: TBitBtn;
    IdFTP1: TIdFTP;
    cdsDetCalLiq: TClientDataSet;
    dsDetCalLiq: TDataSource;
    BDEPDetDev: TppBDEPipeline;
    BDEPForPag: TppBDEPipeline;
    BDEPObs: TppBDEPipeline;
    BDEPRetJud: TppBDEPipeline;
    BDEPDetDes: TppBDEPipeline;
    BDEPDetCalLiq: TppBDEPipeline;
    pprImprimePrevio: TppReport;
    ppHeaderBand2: TppHeaderBand;
    //Inicio: SPP_201401_PRE
    // ppLabel31: TppLabel;  
    // ppLabel32: TppLabel;  
    // ppLabel33: TppLabel;  
    //Fin: SPP_201401_PRE
    pplblLiqBen: TppLabel;
    ppldesben: TppLabel;
    pplfecliq: TppLabel;
    ppLine3: TppLine;
    ppLabel34: TppLabel;
    pplAsoApeNomDni: TppLabel;
    pplAsoDni: TppLabel;
    pplZipDes: TppLabel;
    pplAsoDir: TppLabel;
    pplAsoCodMod: TppLabel;
    pplCentroEducativo: TppLabel;
    pplUse: TppLabel;
    pplUseZip: TppLabel;
    ppShape9: TppShape;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    pplFecNom: TppLabel;
    pplFecCes: TppLabel;
    pplAnoApo: TppLabel;
    pplNumResNoM: TppLabel;
    pplNumResCes: TppLabel;
    pplUltApo: TppLabel;
    ppLine4: TppLine;
    ppLabel42: TppLabel;
    ppShape10: TppShape;
    ppShape11: TppShape;
    pplasotelef: TppLabel;
    ImagAso: TppImage;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppShape12: TppShape;
    ppShape13: TppShape;
    ppSummaryBand2: TppSummaryBand;
    ppLine5: TppLine;
    ppLabel48: TppLabel;
    // Inicio: HPC_201507_PRE
    // Se retira componente que totaliza la cuenta individual.
    // Es reemplazada por una variable y calculada manualmente.
    // ppDBCalc2: TppDBCalc;
    // Fin: HPC_201507_PRE

    ppShape14: TppShape;
    ppShape15: TppShape;
    ppSRDevoluciones: TppSubReport;
    ppChildRDevolucion: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppLine6: TppLine;
    ppLabel49: TppLabel;
    ppShape16: TppShape;
    ppShape17: TppShape;
    ppDetailBand4: TppDetailBand;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppShape18: TppShape;
    ppShape19: TppShape;
    ppSummaryBand3: TppSummaryBand;
    ppLine7: TppLine;
    ppLabel50: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppShape20: TppShape;
    ppShape21: TppShape;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    SRObs: TppSubReport;
    ppChildReport4: TppChildReport;
    ppTitleBand5: TppTitleBand;
    ppLine10: TppLine;
    ppLabel53: TppLabel;
    ppShape35: TppShape;
    ppShape36: TppShape;
    ppDetailBand6: TppDetailBand;
    ppShape37: TppShape;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppShape38: TppShape;
    ppSummaryBand6: TppSummaryBand;
    ppLine12: TppLine;
    ppShape39: TppShape;
    ppShape40: TppShape;
    ppLabel54: TppLabel;
    ppShape41: TppShape;
    ppLine13: TppLine;
    ppLabel55: TppLabel;
    ppLine14: TppLine;
    pplblUsuario: TppLabel;
    ppanula: TppLabel;
    pplimppor: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel56: TppLabel;
    ppSRRetJud: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand4: TppTitleBand;
    ppShape29: TppShape;
    ppShape30: TppShape;
    ppDetailBand5: TppDetailBand;
    ppShape31: TppShape;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppShape32: TppShape;
    ppSummaryBand5: TppSummaryBand;
    ppLine11: TppLine;
    ppLabel57: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppShape33: TppShape;
    ppShape34: TppShape;
    ppLabel58: TppLabel;
    SRForPago: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppLine8: TppLine;
    ppLabel59: TppLabel;
    ppShape22: TppShape;
    ppShape23: TppShape;
    ppDetailBand7: TppDetailBand;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppShape24: TppShape;
    ppShape25: TppShape;
    ppSummaryBand4: TppSummaryBand;
    ppLine9: TppLine;
    ppLabel60: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppShape26: TppShape;
    ppShape27: TppShape;
    ppLabel61: TppLabel;
    ppSRDescuentos: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppLine15: TppLine;
    ppLabel62: TppLabel;
    ppShape28: TppShape;
    ppShape42: TppShape;
    ppDetailBand8: TppDetailBand;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppShape43: TppShape;
    ppShape44: TppShape;
    ppSummaryBand7: TppSummaryBand;
    ppLine16: TppLine;
    ppLabel63: TppLabel;
    ppDBCalc6: TppDBCalc;
    ppShape45: TppShape;
    ppShape46: TppShape;
    ppShape47: TppShape;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    pplSalDis: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppParameterList1: TppParameterList;
    ppLabel110: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLine19: TppLine;
    pplbenasoapenom: TppLabel;
    pplbendni: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    cdsDetDev: TClientDataSet;
    dsDetDev: TDataSource;
    cdsDetDes: TClientDataSet;
    dsDetDes: TDataSource;
    cdsForPag: TClientDataSet;
    dsForPag: TDataSource;
    dsRetJud: TDataSource;
    cdsRetJud: TClientDataSet;
    cdsObs: TClientDataSet;
    dsObs: TDataSource;
    ppLabel68: TppLabel;
    pploriexp: TppLabel; // SPP_201306_PRE
    ppLabel90: TppLabel; // SPP_201306_PRE
    pplregpen: TppLabel; // SPP_201306_PRE
    //Inicio: SPP_201401_PRE
    ppImage2: TppImage; 
    ppImage1: TppImage; 
    ppImage3: TppImage;
    // Inicio: HPC_201507_PRE
    // Variables para controlar el subtotal de la cuenta individual
    ppLine36: TppLine;
    ppTotbenAsi: TppLabel;
    // Inicio: HPC_201709_PRE
    // Se añaden boton para impresión de las liquidaciones
    btnimprimirimpreso: TBitBtn;
    ppImage4: TppImage;
    // Fin: HPC_201709_PRE
    // Fin: HPC_201507_PRE
    //Fin: SPP_201401_PRE
    procedure FormActivate(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure actualizagrid;
    procedure actualizagridimp;
    // procedure pprcarrecPrintingComplete(Sender: TObject); // SPP_201306_PRE Se retira procedimiento del componente TppReport FGenCheGerBen
    procedure edtBuscarDetChange(Sender: TObject);
    procedure edtBuscarDetKeyPress(Sender: TObject; var Key: Char);
    procedure pcchegerChange(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn3Click(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure btnLiquidacionClick(Sender: TObject);
    // Inicio: HPC_201507_PRE
    // Controla impresión de linea de total de la cuenta individual
    procedure ppLine36Print(Sender: TObject);
    procedure ppDBText14Print(Sender: TObject);
    // Inicio: HPC_201709_PRE
    // Se crea procedimiennto para la impresión de la liquidación
    procedure btnimprimirimpresoClick(Sender: TObject);
    // Fin: HPC_201709_PRE
    // Fin: HPC_201507_PRE


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGenCheGerBen: TFGenCheGerBen;

implementation

uses PREDM;

{$R *.dfm}

procedure TFGenCheGerBen.FormActivate(Sender: TObject);
Var xSql:String;
begin
  // Inicio: SPP_201306_PRE
  // Se modifica la fecha por defecto en la caja fecha de proceso
  // xSql := 'SELECT TO_CHAR(SYSDATE-15,''DD/MM/YYYY'') INICIO, TO_CHAR(SYSDATE+15, ''DD/MM/YYYY'') FINAL FROM DUAL';
  // Inicio: HPC_201709_PRE
  // Se modifica el rango para filtrar información de 30 a 180 dias
  // xSql := 'SELECT TO_CHAR(SYSDATE-30,''DD/MM/YYYY'') INICIO, TO_CHAR(SYSDATE, ''DD/MM/YYYY'') FINAL FROM DUAL';
  xSql := 'SELECT TO_DATE(ADD_MONTHS(SYSDATE, -6)) INICIO, TO_DATE(SYSDATE) FINAL FROM DUAL';
  // Fin: HPC_201709_PRE

  // Fin: SPP_201306_PRE
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  dbdinicio.Date := DM1.cdsQry.FieldByName('INICIO').AsDateTime;
  dbdfinal.Date  := DM1.cdsQry.FieldByName('FINAL').AsDateTime;
  actualizagrid;
  pccheger.TabIndex := 0;
end;

procedure TFGenCheGerBen.btncerrarClick(Sender: TObject);
begin
  FGenCheGerBen.Close;
end;

procedure TFGenCheGerBen.BitBtn1Click(Sender: TObject);
begin
  If dbdinicio.Text = '' Then
  Begin
    MessageDlg('Ingrese la fecha inicial', mtInformation, [mbOk], 0);
    dbdinicio.SetFocus;
    Exit;
  End;
  If dbdfinal.Text = '' Then
  Begin
    MessageDlg('Ingrese la fecha final', mtInformation, [mbOk], 0);
    dbdfinal.SetFocus;
    Exit;
  End;
  If dbdinicio.Date > dbdfinal.Date   Then
  Begin
    MessageDlg('Fecha inicial mayor que la fecha final', mtInformation, [mbOk], 0);
    dbdinicio.SetFocus;
    Exit;
  End;
  If pccheger.TabIndex = 0 Then actualizagrid
  Else actualizagridimp;

end;

procedure TFGenCheGerBen.btnimprimirClick(Sender: TObject);
Var xSql:String; // SPP_201306_PRE
begin
   // Inicio: SPP_201306_PRE
   //If MessageDlg('¿ Seguro de imprimir la carta de recojo del'+#13+'beneficiario '+DM1.cdsQry2.FieldByName('PVSNOMBRE').AsString, mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   //Begin
   pplpvsnombre.Caption := DM1.cdsQry2.FieldByName('PVSNOMBRE').AsString;
   ppldni.Caption       := DM1.cdsQry2.FieldByName('PVSLDNIBEN').AsString;
   pplfecha.Caption     := DM1.cdsQry2.FieldByName('HREG').AsString;
   ppbcDNIRUC.Data      := DM1.cdsQry2.FieldByName('DNIRUC').AsString;
   ppldes01.Caption     := 'Usted podrá cobrar su liquidación de Previsión Social Nº '+DM1.cdsQry2.FieldByName('NUMCHEGER').AsString+' por S/. '+FloatToStrF(DM1.cdsQry2.FieldByName('PVSLMONTO').AsFloat, ffNumber,10,2)+' a través de';
   ppldes02.Caption     := '2) Indicar en ventanilla su RUC de Recojo Nº : '+DM1.cdsQry2.FieldByName('DNIRUC').AsString;
   pprcarrec.Print;
   pprcarrec.Stop;
   // Fin: SPP_201306_PRE

   // Inicio: SPP_201306_PRE
   // Impresión de liquidación de benefio
   // xSql := 'SELECT PVSESTLIQ, PVSUSUANUL, PVSFANUL, PVSLTIPBE,PVSLBENNR,HREG, ASODNI, ASOTELF1,ASODIR,ASOCODMOD,ASODESLAB,'
   // +' USEID, UPAGOID, UPROID, ASOFRESNOM, ASOFRESCESE, ASORESNOM, ASORESCESE, PVSLULAP, MONLIQBEN, MONDES, MONDEV, USUARIO,'
   // +' ASOAPENOMDNI, ZIPID, ASODSTLABID, PVSLTAAP'
   // +' FROM PVS306 WHERE ASOID =  '+QuotedStr(DM1.cdsQry2.FieldByName('ASOID').AsString)
   // +' AND PVSLBENNR = '+QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString);
   xSql := 'SELECT A.PVSESTLIQ, A.PVSUSUANUL, A.PVSFANUL, A.PVSLTIPBE, A.PVSLBENNR, A.HREG, A.ASODNI, A.ASOTELF1, A.ASODIR, A.ASOCODMOD, A.ASODESLAB,'
   +' USEID, A.UPAGOID, A.UPROID, A.ASOFRESNOM, A.ASOFRESCESE, A.ASORESNOM, A.ASORESCESE, A.PVSLULAP, A.MONLIQBEN, A.MONDES, A.MONDEV, A.USUARIO,'
   +' A.ASOAPENOMDNI, A.ZIPID, A.ASODSTLABID, A.PVSLTAAP, B.FORSOLBEN'
   +' FROM PVS306 A, PVS301 B WHERE A.ASOID =  '+QuotedStr(DM1.cdsQry2.FieldByName('ASOID').AsString)
   +' AND A.PVSLBENNR = '+QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)
   +' AND A.ASOID = B.ASOID(+) AND A.PVSLBENNR = B.PVSLBENNR(+)';
   DM1.cdsQry8.Close;
   DM1.cdsQry8.DataRequest(xSql);
   DM1.cdsQry8.Open;
   // Fin: SPP_201306_PRE

   // Inicio: SPP_201306_PRE
   xSql := 'SELECT IDIMAGE, REGPENID, CODAFP FROM APO201 WHERE ASOID = ' + QuotedStr(DM1.cdsQry2.FieldByName('ASOID').AsString);
   DM1.cdsQry4.Close;
   DM1.cdsQry4.DataRequest(xSql);
   DM1.cdsQry4.Open;
   // Fin: SPP_201306_PRE
   // Detalle de la liquidación
   // Inicio: HPC_201507_PRE
   // Se añade campo para controlar el detalle de la cuenta individual
   xSql := 'SELECT PVSLCONCE, PVSLMONTO, TIPDES  FROM PVS307 WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)
   // xSql := 'SELECT PVSLCONCE, PVSLMONTO  FROM PVS307 WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)
   + ' AND PVSLAGRID = ''DET'' ORDER BY PVSLSEC';
   // Fin: HPC_201507_PRE
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   DM1.cdsQry.First;
   cdsDetCalLiq.Close;
   cdsDetCalLiq.Open;
   cdsDetCalLiq.EmptyDataSet;
   While Not DM1.cdsQry.Eof Do
   Begin
      cdsDetCalLiq.Append;
      cdsDetCalLiq.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString;
      cdsDetCalLiq.FieldByName('MONTO').AsFloat := DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat;
      // Inicio: HPC_201507_PRE
      // Se añade campo para controlar los registros de la cuenta individual
      cdsDetCalLiq.FieldByName('TIPDES').AsString := DM1.cdsQry.FieldByName('TIPDES').AsString;
      // Fin: HPC_201507_PRE
      cdsDetCalLiq.Post;
      DM1.cdsQry.Next;
   End;
   If cdsDetCalLiq.RecordCount = 0 Then
   Begin
      cdsDetCalLiq.Append;
      cdsDetCalLiq.FieldByName('DESC').AsString := 'Error no existe información de calculo de beneficio';
      cdsDetCalLiq.Post;
   End;
   // Detalle de Devoluciones
   xSql := 'SELECT PVSLCONCE, PVSLMONTO  FROM PVS307 WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)
   + ' AND PVSLAGRID = ''DEV'' ORDER BY PVSLSEC';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   DM1.cdsQry.First;
   cdsDetDev.Close;
   cdsDetDev.Open;
   cdsDetDev.EmptyDataSet;
   While Not DM1.cdsQry.Eof Do
   Begin
      cdsDetDev.Append;
      cdsDetDev.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString;
      cdsDetDev.FieldByName('MONTO').AsFloat := DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat;
      cdsDetDev.Post;
      DM1.cdsQry.Next;
   End;
   If cdsDetDev.RecordCount = 0 Then
   Begin
      cdsDetDev.Append;
      cdsDetDev.FieldByName('DESC').AsString := 'No existen conceptos por devolución';
      cdsDetDev.Post;
   End;
   // Detalle de Descuentos
   xSql := 'SELECT PVSLCONCE, PVSLMONTO, CREDID FROM PVS307 WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)
   + ' AND PVSLAGRID = ''DSC'' ORDER BY PVSLSEC';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   DM1.cdsQry.First;
   cdsDetDes.Close;
   cdsDetDes.Open;
   cdsDetDes.EmptyDataSet;
   While Not DM1.cdsQry.Eof Do
   Begin
      cdsDetDes.Append;
      cdsDetDes.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString;
      cdsDetDes.FieldByName('MONTO').AsFloat := DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat;
      cdsDetDes.FieldByName('CREDID').AsString := DM1.cdsQry.FieldByName('CREDID').AsString;
      cdsDetDes.Post;
      DM1.cdsQry.Next;
   End;
   If cdsDetDes.RecordCount = 0 Then
   Begin
      cdsDetDes.Append;
      cdsDetDes.FieldByName('DESC').AsString := 'No existen conceptos por descuentos';
      cdsDetDes.Post;
   End;
   TNumericField(cdsDetDes.FieldByName('MONTO')).DisplayFormat := '###,###,##0.00';
   // Formas de Pago
   xSql := 'SELECT PVSLCONCE, PVSLMONTO, PVSLNOFC, NROCHEQUE, PVSLNVOU FROM PVS307 WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)
   + ' AND PVSLAGRID = ''FPG'' ORDER BY PVSLSEC';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   DM1.cdsQry.First;
   cdsForPag.Close;
   cdsForPag.Open;
   cdsForPag.EmptyDataSet;
   While Not DM1.cdsQry.Eof Do
   Begin
      cdsForPag.Append;
      If Copy(DM1.cdsQry.FieldByName('PVSLCONCE').AsString, 1, 1) <> '*' Then
      Begin
         If DM1.cdsQry.FieldByName('PVSLNOFC').AsString <> '' Then
            cdsForPag.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString + '  [OFC:' + DM1.cdsQry.FieldByName('PVSLNOFC').AsString + ']'
         Else
            If DM1.cdsQry.FieldByName('NROCHEQUE').AsString <> '' Then
               cdsForPag.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString + '  [CHQ:' + DM1.cdsQry.FieldByName('NROCHEQUE').AsString + ']'
            Else
               cdsForPag.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString;
      End
      Else
         cdsForPag.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString + '  [VOUCHER N° ' + DM1.cdsQry.FieldByName('PVSLNVOU').AsString + ']';
      cdsForPag.FieldByName('MONTO').AsFloat := DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat;
      cdsForPag.Post;
      DM1.cdsQry.Next;
   End;
   If cdsForPag.RecordCount = 0 Then
   Begin
      cdsForPag.Append;
      // Inicio: HPC_201802_PRE
      // Se modifica el mensaje para el grupo de las formas de pago
      // cdsForPag.FieldByName('DESC').AsString := 'Error no existen designatarios';
      cdsForPag.FieldByName('DESC').AsString := 'Sin información de desembolso';
      // Fin: HPC_201802_PRE
      cdsForPag.Post;
   End;
   TNumericField(cdsForPag.FieldByName('MONTO')).DisplayFormat := '###,###,##0.00';
   //Retenciones judiciales
   xSql := 'SELECT PVSLCONCE, PVSLMONTO  FROM PVS307 WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)
   + ' AND PVSLAGRID = ''RET'' ORDER BY PVSLSEC';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   cdsRetJud.Close;
   cdsRetJud.Open;
   cdsRetJud.EmptyDataSet;
   If DM1.cdsQry.RecordCount > 0 Then
   Begin
      While Not DM1.cdsQry.Eof Do
      Begin
         cdsRetJud.Append;
         cdsRetJud.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString;
         cdsRetJud.FieldByName('MONTO').AsFloat := DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat;
         cdsRetJud.Post;
         DM1.cdsQry.Next;
      End;
   End;
   // Observaciones
   xSql := 'SELECT PVSLCONCE, PVSLMONTO  FROM PVS307 WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsQry8.FieldByName('PVSLBENNR').AsString)
   + ' AND PVSLAGRID = ''OBS'' ORDER BY PVSLSEC';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   DM1.cdsQry.First;
   cdsObs.Close;
   cdsObs.Open;
   cdsObs.EmptyDataSet;
   While Not DM1.cdsQry.Eof Do
   Begin
      cdsObs.Append;
      cdsObs.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString;
      cdsObs.FieldByName('MONTO').AsFloat := DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat;
      cdsObs.Post;
      DM1.cdsQry.Next;
   End;
   If cdsObs.RecordCount = 0 Then
   Begin
      cdsObs.Append;
      cdsObs.FieldByName('DESC').AsString := 'No existen observaciones registradas';
      cdsObs.Post;
   End;
   // Inicio: SPP_201306_PRE Se carga las imagenes
   // dm1.CargaImagenes(DM1.cdsQry2.FieldByName('ASODNI').AsString);
   dm1.CargaImagenes(DM1.cdsQry2.FieldByName('ASODNI').AsString);
   // Fin: SPP_201306_PRE

   ImagAso.Picture.Assign(DM1.Jpg);
   If (DM1.cdsQry8.FieldByName('PVSESTLIQ').AsString = '04') Or (DM1.cdsQry8.FieldByName('PVSESTLIQ').AsString = '13') Then
   Begin
      ppanula.Visible := True;
      ppanula.Caption := 'LIQUIDACION ANULADA POR : ' +DM1.CrgDescrip('USERID='+QuotedStr(Trim(DM1.cdsQry8.FieldByName('PVSUSUANUL').AsString)),'TGE006','USERNOM')
      + ' EL : ' + DM1.cdsQry8.FieldByName('PVSFANUL').AsString;
   End
   Else
      ppanula.Visible := False;
   ppldesben.Caption := DM1.CrgDescrip('TIPBENEF='+QuotedStr(DM1.cdsQry8.FieldByName('PVSLTIPBE').AsString), 'TGE186', 'BENEFDES');
   pplblLiqBen.Caption     := 'LIQUIDACION DE BENEFICIO Nº ' + Copy(DM1.cdsQry8.FieldByName('PVSLBENNR').AsString, 5, 7);
   pplfecliq.Caption       := 'FECHA : ' + DM1.cdsQry8.FieldByname('HREG').AsString;
   pplAsoApeNomDni.Caption := DM1.cdsQry8.FieldByname('ASOAPENOMDNI').AsString;
   pplAsoDni.Caption       := DM1.cdsQry8.FieldByname('ASODNI').AsString;
   pplasotelef.Caption     := DM1.cdsQry8.FieldByname('ASOTELF1').AsString;
   pplAsoDir.Caption       := DM1.cdsQry8.FieldByname('ASODIR').AsString;
   pplZipDes.Caption := DM1.CrgDescrip('DPTOID = '+QuotedStr(Copy(DM1.cdsQry8.FieldByName('ZIPID').AsString, 1, 2)), 'APO158', 'DPTODES') + '/'
   + DM1.CrgDescrip('CIUDID = '+QuotedStr(Copy(DM1.cdsQry8.FieldByName('ZIPID').AsString, 1, 4)),   'APO123', 'CIUDDES', ) + '/'
   + DM1.CrgDescrip('ZIPID = '+QuotedStr(DM1.cdsQry8.FieldByName('ZIPID').AsString), 'APO122', 'ZIPDES');
   pplAsoCodMod.Caption := DM1.cdsQry8.FieldByName('ASOCODMOD').AsString;
   pplCentroEducativo.Caption := DM1.cdsQry8.FieldByName('ASODESLAB').AsString;
   xSql := 'SELECT USENOM FROM APO101 WHERE USEID = ' + QuotedStr(DM1.cdsQry8.FieldByName('USEID').AsString)
   + ' AND UPAGOID = ' + QuotedStr(DM1.cdsQry8.FieldByName('UPAGOID').AsString) + ' AND UPROID = ' + QuotedStr(DM1.cdsQry8.FieldByName('UPROID').AsString);
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   pplUse.Caption := 'U.S.E. : ' + DM1.cdsQry.FieldByName('USENOM').AsString;
   pplUseZip.Caption := DM1.CrgDescrip('DPTOID = '+QuotedStr(Copy(DM1.cdsQry8.FieldByName('ASODSTLABID').AsString, 1, 2)), ' APO158', 'DPTODES') + '/'
   + DM1.CrgDescrip('CIUDID = '+QuotedStr(Copy(DM1.cdsQry8.FieldByName('ASODSTLABID').AsString, 1, 4)), 'APO123', 'CIUDDES' ) + '/'
   + DM1.CrgDescrip('ZIPID = '+QuotedStr(DM1.cdsQry8.FieldByName('ASODSTLABID').AsString), 'APO122', 'ZIPDES' );
   pplFecNom.Caption := DM1.cdsQry8.FieldByName('ASOFRESNOM').AsString;
   pplFecCes.Caption := DM1.cdsQry8.FieldByName('ASOFRESCESE').AsString;
   pplNumResNoM.Caption := DM1.cdsQry8.FieldByName('ASORESNOM').AsString;
   pplNumResCes.Caption := DM1.cdsQry8.FieldByName('ASORESCESE').AsString;
   pplUltApo.Caption := DM1.cdsQry8.FieldByName('PVSLULAP').AsString;
   pplAnoApo.Caption := DM1.cdsQry8.FieldByName('PVSLTAAP').AsString;
   pplSalDis.Caption := FloatToStrF((DM1.cdsQry8.FieldByName('MONLIQBEN').AsFloat+DM1.cdsQry8.FieldByName('MONDEV').AsFloat-DM1.cdsQry8.FieldByName('MONDES').AsFloat), ffNumber, 10, 2);
   pplblUsuario.Caption := UpperCase(DM1.CrgDescrip('USERID = '+QuotedStr(DM1.cdsQry8.FieldByName('USUARIO').AsString), 'USERTABLE', 'USERNOM'));
   pplimppor.Caption := 'IMPRESO POR : ' + UpperCase(DM1.CrgDescrip('USERID = '+QuotedStr(DM1.wUsuario), 'USERTABLE', 'USERNOM'));
   pplbenasoapenom.Caption := 'Beneficiario : '+Trim(DM1.cdsQry2.FieldByName('PVSNOMBRE').AsString);
   pplbendni.Caption       := 'DNI : '+Trim(DM1.cdsQry2.FieldByName('PVSLDNIBEN').AsString);

     // Inicio: SPP_201306_PRE
  If DM1.cdsQry8.FieldByName('FORSOLBEN').AsString = 'O' Then pploriexp.Caption := 'ORIGEN : OFICIO INTERNO';
  If DM1.cdsQry8.FieldByName('FORSOLBEN').AsString = 'S' Then pploriexp.Caption := 'ORIGEN : SOLICITUD DEL BENEFICIARIO';
  pplregpen.Caption := DM1.DevuelveValor('APO105', 'REGPENABR', 'REGPENID', Copy(DM1.cdsQry4.FieldByName('REGPENID').AsString,1,2));
  If DM1.cdsQry4.FieldByName('REGPENID').AsString = '03' Then
  Begin
     xSql := 'SELECT SUBSTR(PROV,4,2) CODAFP, PROVDES DESAFP  FROM TGE201 WHERE SUBSTR(PROV,1,1) = ''A'' AND CLAUXID = ''A'' AND SUBSTR(PROV,4,2) = '+QuotedStr(DM1.cdsQry4.FieldByName('CODAFP').AsString);
     DM1.cdsQry.Close;
     DM1.cdsQry.DataRequest(xSql);
     DM1.cdsQry.Open;
     pplregpen.Caption := pplregpen.Caption + ' - ' + DM1.cdsQry.FieldByName('DESAFP').AsString;
   End;

   pprImprimePrevio.Print;
   pprImprimePrevio.Stop;
   If MessageDlg('¿Impresión correcta?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
      xSql := 'UPDATE PVS307 SET USUIMPCHEGER = '+QuotedStr(DM1.wUsuario)+', FECHORIMPCHEGER = SYSDATE WHERE PVSLBENNR = '+QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)+' AND DNIRUC = '+QuotedStr(DM1.cdsQry2.FieldByName('DNIRUC').AsString);
      DM1.DCOM1.AppServer.EjecutaSql(xSql);
      actualizagrid;
   End;
   // Fin: SPP_201306_PRE
end;

// Inicio: HPC_201607_PRE
// Se modifica la de busqueda para actualizar el grid.
// Cambio de campo (ANTES SUBSTR(DISORIEXP,1,2), AHORA DEPORIEXP)
procedure TFGenCheGerBen.actualizagrid;
Var xSql:String;
begin
   // Inicio: HPC_201709_PRE
   // Se modifica Qry que muestra información en el grid de cheques por imprimir 
   // xSql := 'SELECT B.PVSLBENNR, B.PVSLDNIBEN, TRIM(B.APEPATCOB)||'' ''||TRIM(B.APEMATCOB)||'' ''||TRIM(B.APECASCOB)||'' ''||B.NOMCOB PVSNOMBRE,'
   // //+'            B.PVSLMONTO, B.NUMCHEGER, B.DNIRUC, B.HREG, C.DPTODES, C.CIUDDES, C.ZIPDES, A.ASOID, A.ASODNI'
   // +'              B.PVSLMONTO, B.NUMCHEGER, B.DNIRUC, B.HREG, C.DPTODES, C.OFDESNOM, A.ASOID, A.ASODNI'
   // +'         FROM PVS306 A, PVS307 B,'
   // +'         (SELECT P.PVSLBENNR, D.DPTODES, E.OFDESNOM'
   // +'          FROM PVS301 P, APO158 D, APO110 E'
   // +'          WHERE P.DEPORIEXP = D.DPTOID AND P.OFIORIEXP = E.OFDESID) C'
   // // +'       (SELECT P.PVSLBENNR, D.DPTODES, E.CIUDDES, F.ZIPDES'
   // // +'       FROM PVS301 P, APO158 D, APO123 E, APO122 F'
   // // +'       WHERE D.DPTOID = SUBSTR(P.DISORIEXP,1,2)'
   // // +'       AND E.CIUDID = SUBSTR(P.DISORIEXP,1,4)'
   // // +'       AND F.ZIPID  = P.DISORIEXP) C'
   // +'        WHERE A.PVSLFECBE >= '+QuotedStr(dbdinicio.Text)+' AND PVSLFECBE <= '+QuotedStr(dbdfinal.Text)
   // +'          AND A.PVSESTLIQ IN (''02'',''05'',''06'')'
   // +'          AND A.PVSLBENNR = B.PVSLBENNR'
   // +'          AND A.PVSLBENNR = C.PVSLBENNR'
   // +'          AND B.PVSLBENNR = C.PVSLBENNR'
   // +'          AND B.FORPAGOID = ''16'''
   // +'          AND NVL(B.FLGVOUCHER, ''X'') = ''N'''
   // +'          AND B.USUIMPCHEGER IS NULL AND B.DNIRUC IS NOT NULL';
   xSql := 'SELECT A.PVSLFECBE, A.PVSLBENNR, B.PVSLDNIBEN, TRIM(B.APEPATCOB)||'' ''||TRIM(B.APEMATCOB)||'' ''||TRIM(B.APECASCOB)||'' ''||B.NOMCOB PVSNOMBRE,'
   +' B.PVSLMONTO, B.NUMCHEGER, B.DNIRUC, B.HREG, D.DPTODES, E.OFDESNOM, A.ASOID, A.ASODNI, F.ASOTELF1, F.ASOTELF2'
   +' FROM PVS306 A, PVS307 B, PVS301 C, APO158 D, APO110 E, APO201 F'
   +' WHERE A.PVSLFECBE >= '+QuotedStr(dbdinicio.Text)+' AND A.PVSLFECBE <= '+QuotedStr(dbdfinal.Text)
   +' AND A.PVSESTLIQ IN (''02'',''05'',''06'')'
   +' AND A.PVSLBENNR = B.PVSLBENNR AND B.FORPAGOID = ''16'' AND NVL(B.FLGVOUCHER, ''X'') = ''N'''
   +' AND B.USUIMPCHEGER IS NULL AND B.DNIRUC IS NOT NULL'
   +' AND A.ASOID = C.ASOID AND A.PVSEXPNRO = C.PVSEXPNRO'
   +' AND C.DEPORIEXP = D.DPTOID AND C.OFIORIEXP = E.OFDESID'
   +' AND A.ASOID = F.ASOID';
   // Fin: HPC_201709_PRE
  DM1.cdsQry2.Close;
  DM1.cdsQry2.DataRequest(xSql);
  DM1.cdsQry2.Open;
  dbgcheger.DataSource := DM1.dsQry2;
  dbgcheger.Selected.Clear;
  dbgcheger.Selected.Add('PVSLDNIBEN'#9'8'#9'DNI del~beneficiario'#9#9);
  // Inicio: HPC_201709_PRE
  // Se añade columna con fecha de liquidación
  dbgcheger.Selected.Add('PVSLFECBE'#9'10'#9'Fecha de~liquidación'#9#9);
  // Fin: HPC_201709_PRE
  dbgcheger.Selected.Add('PVSLBENNR'#9'11'#9'Número de~liquidación'#9#9);
  dbgcheger.Selected.Add('PVSNOMBRE'#9'60'#9'Apellidos y Nombre(s)~del beneficiario'#9#9);
  dbgcheger.Selected.Add('DPTODES'#9'25'#9'Departamento Origen~del expediente'#9#9);
  dbgcheger.Selected.Add('OFDESNOM'#9'25'#9'Oficina Origen~del expediente'#9#9);
  // dbgcheger.Selected.Add('CIUDDES'#9'25'#9'Provincia Origen~del expediente'#9#9);
  // dbgcheger.Selected.Add('ZIPDES'#9'25'#9'Distrito Origen~del expediente'#9#9);
  dbgcheger.Selected.Add('PVSLMONTO'#9'10'#9'Monto del~beneficio'#9#9);
  dbgcheger.Selected.Add('NUMCHEGER'#9'10'#9'Número cheque de~gerencia'#9#9);
  dbgcheger.Selected.Add('DNIRUC'#9'11'#9'DNI-RUC'#9#9);
  // Inicio: HPC_201709_PRE
  // Se añaden campos de telefonos en el grid de cheques por imprimir
  dbgcheger.Selected.Add('ASOTELF1'#9'15'#9'Telefono~Nº 01'#9#9);
  dbgcheger.Selected.Add('ASOTELF2'#9'15'#9'Telefono~Nº 02'#9#9);
  // Fin: HPC_201709_PRE
  dbgcheger.ApplySelected;
  TNumericField(DM1.cdsQry2.FieldByName('PVSLMONTO')).DisplayFormat := '###,###,##0.00';
  dbgcheger.Refresh;
end;
// Fin: HPC_201607_PRE
// Inicio: SPP_201306_PRE  Se retira el procedimiento que actualiza el flag de cheque de gerencia impreso.
// procedure TFGenCheGerBen.pprcarrecPrintingComplete(Sender: TObject);
// Var xSql:String;
// begin
 //  Se comento la pregunta de confirmación de la impresión
// If MessageDlg('¿Impresión correcta?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
// Begin
//    xSql := 'UPDATE PVS307 SET USUIMPCHEGER = '+QuotedStr(DM1.wUsuario)+', FECHORIMPCHEGER = SYSDATE'
//    +' WHERE PVSLBENNR = '+QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)+' AND DNIRUC = '+QuotedStr(DM1.cdsQry2.FieldByName('DNIRUC').AsString);
//    DM1.DCOM1.AppServer.EjecutaSql(xSql);
//  End;
 //  End;
//end;
// Fin: SPP_201306_PRE


procedure TFGenCheGerBen.edtBuscarDetChange(Sender: TObject);
begin
  If pccheger.TabIndex = 0 Then
  Begin
    If Length(Trim(edtBuscarDet.Text))>0 Then
      DM1.cdsQry2.Locate('PVSNOMBRE', VarArrayOf([TRIM(edtBuscarDet.Text)]), [loPartialKey]);
  End;

  If pccheger.TabIndex = 1 Then
  Begin
    If Length(Trim(edtBuscarDet.Text))>0 Then
      DM1.cdsQry3.Locate('PVSNOMBRE', VarArrayOf([TRIM(edtBuscarDet.Text)]), [loPartialKey]);
  End;

end;

procedure TFGenCheGerBen.edtBuscarDetKeyPress(Sender: TObject;
  var Key: Char);
begin
 If Key=#13 Then
  Begin
    If Length(Trim(edtBuscarDet.Text))>0 Then
    Begin
      edtBuscarDet.Text := '';
      dbgcheger.SetFocus;
    End
    Else
    Begin
      MessageDlg('Debe Digitar El Nombre Del Asociado, Para Iniciar La Busqueda', mtError,[mbOk], 0 );
      edtBuscarDet.SetFocus;
    End;
  End;
end;

procedure TFGenCheGerBen.actualizagridimp;
Var xSql:String;
begin
// Muestra información ya impresa
// Memorándum 0317-2009-DM-EPS - SAR-2009-0746 - DAD-IR-2009-0157
  // Inicio: HPC_201709_PRE
  // Se añaden numero de telefono 1 y 2 en el reporte de información ya impresa.
  // xSql := 'SELECT B.PVSLBENNR, B.PVSLDNIBEN, B.APEPATCOB||'' ''||B.APEMATCOB||'' ''||B.NOMCOB PVSNOMBRE, B.PVSLMONTO, B.NUMCHEGER, B.DNIRUC, B.HREG, B.USUIMPCHEGER, B.FECHORIMPCHEGER, A.ASOID'
  // +' FROM PVS306 A, PVS307 B WHERE A.PVSLFECBE >= '+QuotedStr(dbdinicio.Text)+' AND PVSLFECBE <= '+QuotedStr(dbdfinal.Text)
  // +' AND A.PVSESTLIQ IN (''02'',''05'',''06'') AND A.PVSLBENNR = B.PVSLBENNR AND B.FORPAGOID = ''16'' AND NVL(B.FLGVOUCHER, ''X'') = ''N'''
  // +' AND B.USUIMPCHEGER IS NOT NULL AND B.DNIRUC IS NOT NULL';
  xSql := 'SELECT A.PVSLFECBE, B.PVSLBENNR, B.PVSLDNIBEN, B.APEPATCOB||'' ''||B.APEMATCOB||'' ''||B.NOMCOB PVSNOMBRE,'
  +' B.PVSLMONTO, B.NUMCHEGER, B.DNIRUC, B.HREG, B.USUIMPCHEGER, B.FECHORIMPCHEGER, A.ASOID, C.ASOTELF1, C.ASOTELF2, E.DPTODES, F.OFDESNOM, C.ASODNI'
  +' FROM PVS306 A, PVS307 B, APO201 C, PVS301 D, APO158 E, APO110 F'
  +' WHERE A.PVSLFECBE >= '+QuotedStr(dbdinicio.Text)+' AND A.PVSLFECBE <= '+QuotedStr(dbdfinal.Text)
  +' AND A.PVSESTLIQ IN (''02'',''05'',''06'') AND A.PVSLBENNR = B.PVSLBENNR'
  +' AND B.FORPAGOID = ''16'' AND NVL(B.FLGVOUCHER, ''X'') = ''N'''
  +' AND B.USUIMPCHEGER IS NOT NULL AND B.DNIRUC IS NOT NULL'
  +' AND A.ASOID = C.ASOID'
  +' AND A.ASOID = D.ASOID AND A.PVSEXPNRO = D.PVSEXPNRO'
  +' AND D.DEPORIEXP = E.DPTOID'
  +' AND D.OFIORIEXP = F.OFDESID';
  // Fin: HPC_201709_PRE
  
  DM1.cdsQry3.Close;
  DM1.cdsQry3.DataRequest(xSql);
  DM1.cdsQry3.Open;
  dbgdetimp.DataSource := DM1.dsQry3;
  dbgdetimp.Selected.Clear;
  dbgdetimp.Selected.Add('PVSLDNIBEN'#9'8'#9'DNI del~beneficiario'#9#9);
  // Inicio: SPP_201306_PRE Se añade numero de liquidación en el grid de cheque de gerencia (Cheques impresos)
  dbgdetimp.Selected.Add('PVSLBENNR'#9'11'#9'Número de~liquidación'#9#9);
  // Inicio: HPC_201709_PRE
  // Se añaden campos fecha de beneficio, departamento de origen
  dbgdetimp.Selected.Add('PVSLFECBE'#9'10'#9'Fecha de~liquidación'#9#9);
  dbgdetimp.Selected.Add('DPTODES'#9'25'#9'Departamento Origen~del expediente'#9#9);
  dbgdetimp.Selected.Add('OFDESNOM'#9'25'#9'Oficina Origen~del expediente'#9#9);
  // Fin: HPC_201709_PRE
  // Fin: SPP_201306_PRE
  dbgdetimp.Selected.Add('PVSNOMBRE'#9'60'#9'Apellidos y Nombre(s)~del beneficiario'#9#9);
  dbgdetimp.Selected.Add('PVSLMONTO'#9'10'#9'Monto del~beneficio'#9#9);
  dbgdetimp.Selected.Add('NUMCHEGER'#9'10'#9'Número cheque de~gerencia'#9#9);
  dbgdetimp.Selected.Add('DNIRUC'#9'11'#9'DNI-RUC'#9#9);
  dbgdetimp.Selected.Add('USUIMPCHEGER'#9'15'#9'Usuario que~imprime'#9#9);
  dbgdetimp.Selected.Add('FECHORIMPCHEGER'#9'15'#9'Fecha y Hora~de impresión'#9#9);
  // Inicio: HPC_201709_PRE
  // Se añaden campos numero de telefono 1 y 2
  dbgdetimp.Selected.Add('ASOTELF1'#9'15'#9'Telefono~Nº 01'#9#9);
  dbgdetimp.Selected.Add('ASOTELF2'#9'15'#9'Telefono~Nº 02'#9#9);
  // Fin: HPC_201709_PRE
  dbgdetimp.ApplySelected;
  TNumericField(DM1.cdsQry3.FieldByName('PVSLMONTO')).DisplayFormat := '###,###,##0.00';
  dbgdetimp.Refresh;
end;

procedure TFGenCheGerBen.pcchegerChange(Sender: TObject);
begin
 If pccheger.TabIndex = 0 Then
   actualizagrid
 Else
   actualizagridimp;
end;

procedure TFGenCheGerBen.BitBtn2Click(Sender: TObject);
begin
  // Imprime listado de ya impresos
  ppbdepyaimpreso.DataSource := DM1.dsQry3;
  pplimpresopor.Caption:='Impreso por   : '+DM1.CrgDescrip('USERID='+QuotedStr(Trim(DM1.wUsuario)),'TGE006','USERNOM');
  ppryaimpresos.Print;
end;

procedure TFGenCheGerBen.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key = #13 Then
  begin
    Key := #0;
    Perform(CM_DIALOGKEY, VK_TAB, 0);
  end;
end;

procedure TFGenCheGerBen.BitBtn3Click(Sender: TObject);
begin
  //Validamos que solo el Nivel 3 pueda volver a imprimir
  If Copy(DM1.CrgArea(DM1.wUsuario),6,2) ='03' Then
  Begin
      If MessageDlg('Se esta volviendo a imprimir el cheque de gerencia del'+#13+'beneficiario '+DM1.cdsQry3.FieldByName('PVSNOMBRE').AsString+#13+'¿ Seguro que desea volver a imprimir ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
        pplpvsnombre.Caption := DM1.cdsQry3.FieldByName('PVSNOMBRE').AsString;
        ppldni.Caption       := DM1.cdsQry3.FieldByName('PVSLDNIBEN').AsString;
        pplfecha.Caption     := DM1.cdsQry3.FieldByName('HREG').AsString;
        ppbcDNIRUC.Data      := DM1.cdsQry3.FieldByName('DNIRUC').AsString;
        ppldes01.Caption     := 'Usted podrá cobrar su liquidación de Previsión Social Nº '+DM1.cdsQry3.FieldByName('NUMCHEGER').AsString+' por S/. '+FloatToStrF(DM1.cdsQry3.FieldByName('PVSLMONTO').AsFloat, ffNumber,10,2)+' a través de';
        ppldes02.Caption     := '2) Indicar en ventanilla su RUC de Recojo Nº : '+DM1.cdsQry3.FieldByName('DNIRUC').AsString;
        pprcarrec.Print;
        pprcarrec.Stop;
      End;
      End
    Else
    Begin
       MessageDlg('Solo disponible para el nivel de jefatura', mtError,[mbOk],0);
       Exit;
    End;

end;

procedure TFGenCheGerBen.btnExcelClick(Sender: TObject);
begin
  dtgData.DataSource := DM1.dsQry3;
  // Inicio: HPC_201709_PRE
  // Exportar a excel cheques impresos
  // DM1.HojaExcel('Resumen',DM1.dsQry3, dtgData);
  DM1.ExportaGridExcel(dbgdetimp, 'PRE_DETCHEIMP');
  // Fin: HPC_201709_PRE
end;

procedure TFGenCheGerBen.BitBtn4Click(Sender: TObject);
begin
  dtgData.DataSource := DM1.dsQry2;
   // Inicio: HPC_201709_PRE
   // Se modifica procedimiento para exportar a excel 
   // DM1.HojaExcel('Resumen',DM1.dsQry2, dtgData);
   DM1.ExportaGridExcel(dbgcheger, 'PRE_DETCHEXIMP');
   // Fin: HPC_201709_PRE
end;

procedure TFGenCheGerBen.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  DM1.cdsQry2.Close;
  DM1.cdsQry2.Filter := '';
  DM1.cdsQry2.IndexFieldNames := '';
  DM1.cdsQry2.Filtered := False;

  DM1.cdsQry3.Close;
  DM1.cdsQry3.Filter := '';
  DM1.cdsQry3.IndexFieldNames := '';
  DM1.cdsQry3.Filtered := False;

  DM1.cdsQry4.Close;
  DM1.cdsQry4.Filter := '';
  DM1.cdsQry4.IndexFieldNames := '';
  DM1.cdsQry4.Filtered := False;

  DM1.cdsQry8.Close;
  DM1.cdsQry8.Filter:='';
  DM1.cdsQry8.IndexFieldNames :='';
  DM1.cdsQry8.Filtered := False;

  DM1.cdsQry.Close;
  DM1.cdsQry.Filter:='';
  DM1.cdsQry.IndexFieldNames:='';
  DM1.cdsQry.Filtered := False;

  cdsDetCalLiq.Close;
  cdsDetCalLiq.Filter:='';
  cdsDetCalLiq.IndexFieldNames:='';
  cdsDetCalLiq.Filtered := False;

  cdsDetDev.Close;
  cdsDetDev.Filter:='';
  cdsDetDev.IndexFieldNames:='';
  cdsDetDev.Filtered := False;

  cdsDetDes.Close;
  cdsDetDes.Filter:='';
  cdsDetDes.IndexFieldNames:='';
  cdsDetDes.Filtered := False;

  cdsForPag.Close;
  cdsForPag.Filter:='';
  cdsForPag.IndexFieldNames:='';
  cdsForPag.Filtered := False;

  cdsRetJud.Close;
  cdsRetJud.Filter:='';
  cdsRetJud.IndexFieldNames:='';
  cdsRetJud.Filtered := False;

  cdsObs.Close;
  cdsObs.Filter:='';
  cdsObs.IndexFieldNames:='';
  cdsObs.Filtered := False;

  Action := caFree;
end;

procedure TFGenCheGerBen.btnLiquidacionClick(Sender: TObject);
Var xSql:String;
begin
  // Imprimir liquidación
  // Inicio: SPP_201306_PRE
  // xSql := 'SELECT IDIMAGE FROM APO201 WHERE ASOID = ' + QuotedStr(DM1.cdsQry2.FieldByName('ASOID').AsString);
  xSql := 'SELECT IDIMAGE, REGPENID, CODAFP FROM APO201 WHERE ASOID = ' + QuotedStr(DM1.cdsQry2.FieldByName('ASOID').AsString);
  // Fin: SPP_201306_PRE
  DM1.cdsQry4.Close;
  DM1.cdsQry4.DataRequest(xSql);
  DM1.cdsQry4.Open;

  // Inicio: SPP_201306_PRE
  xSql := 'SELECT A.PVSESTLIQ, A.PVSUSUANUL, A.PVSFANUL, A.PVSLTIPBE, A.PVSLBENNR, A.HREG, A.ASODNI, A.ASOTELF1, A.ASODIR, A.ASOCODMOD, A.ASODESLAB,'
  +' USEID, A.UPAGOID, A.UPROID, A.ASOFRESNOM, A.ASOFRESCESE, A.ASORESNOM, A.ASORESCESE, A.PVSLULAP, A.MONLIQBEN, A.MONDES, A.MONDEV, A.USUARIO,'
  +' A.ASOAPENOMDNI, A.ZIPID, A.ASODSTLABID, A.PVSLTAAP, B.FORSOLBEN'
  +' FROM PVS306 A, PVS301 B WHERE A.ASOID =  '+QuotedStr(DM1.cdsQry2.FieldByName('ASOID').AsString)
  +' AND A.PVSLBENNR = '+QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)
  +' AND A.ASOID = B.ASOID(+) AND A.PVSLBENNR = B.PVSLBENNR(+)';
  DM1.cdsQry8.Close;
  DM1.cdsQry8.DataRequest(xSql);
  DM1.cdsQry8.Open;
  // Fin: SPP_201306_PRE

  // Detalle de la liquidación
  // Inicio: HPC_201507_PRE
  // Se controla que en el detalle de la cuenta individual no ingrese el sub total de cuenta individual. 
  // xSql := 'SELECT PVSLCONCE, PVSLMONTO  FROM PVS307 WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)
  xSql := 'SELECT PVSLCONCE, PVSLMONTO, TIPDES  FROM PVS307 WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)
  + ' AND PVSLAGRID = ''DET'' ORDER BY PVSLSEC';
  // Fin: HPC_201507_PRE
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  DM1.cdsQry.First;
  cdsDetCalLiq.Close;
  cdsDetCalLiq.Open;
  cdsDetCalLiq.EmptyDataSet;
  // Inicio: HPC_201507_PRE
  // Se añade sumatoria total de beneficio a pagar
  DM1.liquidacionbeneficio := 0;
  While Not DM1.cdsQry.Eof Do
  Begin
    cdsDetCalLiq.Append;
    cdsDetCalLiq.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString;
    cdsDetCalLiq.FieldByName('MONTO').AsFloat := DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat;
    cdsDetCalLiq.FieldByName('TIPDES').AsString := DM1.cdsQry.FieldByName('TIPDES').AsString;
    cdsDetCalLiq.Post;
    If DM1.cdsQry.FieldByName('TIPDES').AsString <> 'TC' Then
       DM1.liquidacionbeneficio := DM1.liquidacionbeneficio + DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat;
    DM1.cdsQry.Next;
  End;
  ppTotbenAsi.Caption := FloatToStrF(DM1.liquidacionbeneficio,ffNumber,10,2);  
  // Fin: HPC_201507_PRE
  If cdsDetCalLiq.RecordCount = 0 Then
  Begin
    cdsDetCalLiq.Append;
    cdsDetCalLiq.FieldByName('DESC').AsString := 'Error no existe información de calculo de beneficio';
    cdsDetCalLiq.Post;
  End;

  // Detalle de Devoluciones
  xSql := 'SELECT PVSLCONCE, PVSLMONTO  FROM PVS307 WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)
  + ' AND PVSLAGRID = ''DEV'' ORDER BY PVSLSEC';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  DM1.cdsQry.First;
  cdsDetDev.Close;
  cdsDetDev.Open;
  cdsDetDev.EmptyDataSet;
  While Not DM1.cdsQry.Eof Do
  Begin
    cdsDetDev.Append;
    cdsDetDev.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString;
    cdsDetDev.FieldByName('MONTO').AsFloat := DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat;
    cdsDetDev.Post;
    DM1.cdsQry.Next;
  End;
  If cdsDetDev.RecordCount = 0 Then
  Begin
    cdsDetDev.Append;
    cdsDetDev.FieldByName('DESC').AsString := 'No existen conceptos por devolución';
    cdsDetDev.Post;
  End;

  // Detalle de Descuentos
  xSql := 'SELECT PVSLCONCE, PVSLMONTO, CREDID FROM PVS307 WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)
  + ' AND PVSLAGRID = ''DSC'' ORDER BY PVSLSEC';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  DM1.cdsQry.First;
  cdsDetDes.Close;
  cdsDetDes.Open;
  cdsDetDes.EmptyDataSet;
  While Not DM1.cdsQry.Eof Do
  Begin
    cdsDetDes.Append;
    cdsDetDes.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString;
    cdsDetDes.FieldByName('MONTO').AsFloat := DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat;
    cdsDetDes.FieldByName('CREDID').AsString := DM1.cdsQry.FieldByName('CREDID').AsString;
    cdsDetDes.Post;
    DM1.cdsQry.Next;
  End;
  If cdsDetDes.RecordCount = 0 Then
  Begin
    cdsDetDes.Append;
    cdsDetDes.FieldByName('DESC').AsString := 'No existen conceptos por descuentos';
    cdsDetDes.Post;
  End;
  TNumericField(cdsDetDes.FieldByName('MONTO')).DisplayFormat := '###,###,##0.00';

  // Formas de Pago
  xSql := 'SELECT PVSLCONCE, PVSLMONTO, PVSLNOFC, NROCHEQUE, PVSLNVOU FROM PVS307 WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)
  + ' AND PVSLAGRID = ''FPG'' ORDER BY PVSLSEC';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  DM1.cdsQry.First;
  cdsForPag.Close;
  cdsForPag.Open;
  cdsForPag.EmptyDataSet;
  While Not DM1.cdsQry.Eof Do
  Begin
    cdsForPag.Append;
    If Copy(DM1.cdsQry.FieldByName('PVSLCONCE').AsString, 1, 1) <> '*' Then
    Begin
      If DM1.cdsQry.FieldByName('PVSLNOFC').AsString <> '' Then
        cdsForPag.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString + '  [OFC:' + DM1.cdsQry.FieldByName('PVSLNOFC').AsString + ']'
      Else
        If DM1.cdsQry.FieldByName('NROCHEQUE').AsString <> '' Then
          cdsForPag.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString + '  [CHQ:' + DM1.cdsQry.FieldByName('NROCHEQUE').AsString + ']'
        Else
          cdsForPag.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString;
      End
    Else
      cdsForPag.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString + '  [VOUCHER N° ' + DM1.cdsQry.FieldByName('PVSLNVOU').AsString + ']';
    cdsForPag.FieldByName('MONTO').AsFloat := DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat;
    cdsForPag.Post;
    DM1.cdsQry.Next;
  End;
  If cdsForPag.RecordCount = 0 Then
  Begin
    cdsForPag.Append;
    // Inicio: HPC_201802_PRE
    // Se modifica el mensaje en la forma de pago
    // cdsForPag.FieldByName('DESC').AsString := 'Error no existen designatarios';
    cdsForPag.FieldByName('DESC').AsString := 'Sin información de desembolso';
    // Fin: HPC_201802_PRE
    cdsForPag.Post;
  End;
  TNumericField(cdsForPag.FieldByName('MONTO')).DisplayFormat := '###,###,##0.00';

  //Retenciones judiciales
  xSql := 'SELECT PVSLCONCE, PVSLMONTO  FROM PVS307 WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)
  + ' AND PVSLAGRID = ''RET'' ORDER BY PVSLSEC';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  cdsRetJud.Close;
  cdsRetJud.Open;
  cdsRetJud.EmptyDataSet;
  If DM1.cdsQry.RecordCount > 0 Then
  Begin
    While Not DM1.cdsQry.Eof Do
    Begin
      cdsRetJud.Append;
      cdsRetJud.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString;
      cdsRetJud.FieldByName('MONTO').AsFloat := DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat;
      cdsRetJud.Post;
      DM1.cdsQry.Next;
    End;
  End;

  // Observaciones
  xSql := 'SELECT PVSLCONCE, PVSLMONTO  FROM PVS307 WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsQry8.FieldByName('PVSLBENNR').AsString)
  + ' AND PVSLAGRID = ''OBS'' ORDER BY PVSLSEC';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  DM1.cdsQry.First;
  cdsObs.Close;
  cdsObs.Open;
  cdsObs.EmptyDataSet;
  While Not DM1.cdsQry.Eof Do
  Begin
    cdsObs.Append;
    cdsObs.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString;
    cdsObs.FieldByName('MONTO').AsFloat := DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat;
    cdsObs.Post;
    DM1.cdsQry.Next;
  End;
  If cdsObs.RecordCount = 0 Then
  Begin
    cdsObs.Append;
    cdsObs.FieldByName('DESC').AsString := 'No existen observaciones registradas';
    cdsObs.Post;
  End;

   dm1.CargaImagenes(DM1.cdsQry2.FieldByName('ASODNI').AsString);
   ImagAso.Picture.Assign(DM1.Jpg);

  If (DM1.cdsQry8.FieldByName('PVSESTLIQ').AsString = '04') Or (DM1.cdsQry8.FieldByName('PVSESTLIQ').AsString = '13') Then
  Begin
    ppanula.Visible := True;
    ppanula.Caption := 'LIQUIDACION ANULADA POR : ' +DM1.CrgDescrip('USERID='+QuotedStr(Trim(DM1.cdsQry8.FieldByName('PVSUSUANUL').AsString)),'TGE006','USERNOM')
    + ' EL : ' + DM1.cdsQry8.FieldByName('PVSFANUL').AsString;
  End
  Else
  ppanula.Visible   := False;
  ppldesben.Caption := DM1.CrgDescrip('TIPBENEF='+QuotedStr(DM1.cdsQry8.FieldByName('PVSLTIPBE').AsString), 'TGE186', 'BENEFDES');

  pplblLiqBen.Caption     := 'LIQUIDACION DE BENEFICIO Nº ' + Copy(DM1.cdsQry8.FieldByName('PVSLBENNR').AsString, 5, 7);
  pplfecliq.Caption       := 'FECHA : ' + DM1.cdsQry8.FieldByname('HREG').AsString;
  pplAsoApeNomDni.Caption := DM1.cdsQry8.FieldByname('ASOAPENOMDNI').AsString;
  pplAsoDni.Caption       := DM1.cdsQry8.FieldByname('ASODNI').AsString;
  pplasotelef.Caption     := DM1.cdsQry8.FieldByname('ASOTELF1').AsString;
  pplAsoDir.Caption       := DM1.cdsQry8.FieldByname('ASODIR').AsString;
  pplZipDes.Caption := DM1.CrgDescrip('DPTOID = '+QuotedStr(Copy(DM1.cdsQry8.FieldByName('ZIPID').AsString, 1, 2)), 'APO158', 'DPTODES') + '/'
      + DM1.CrgDescrip('CIUDID = '+QuotedStr(Copy(DM1.cdsQry8.FieldByName('ZIPID').AsString, 1, 4)),   'APO123', 'CIUDDES', ) + '/'
      + DM1.CrgDescrip('ZIPID = '+QuotedStr(DM1.cdsQry8.FieldByName('ZIPID').AsString), 'APO122', 'ZIPDES');
  pplAsoCodMod.Caption := DM1.cdsQry8.FieldByName('ASOCODMOD').AsString;
  pplCentroEducativo.Caption := DM1.cdsQry8.FieldByName('ASODESLAB').AsString;
  xSql := 'SELECT USENOM FROM APO101 WHERE USEID = ' + QuotedStr(DM1.cdsQry8.FieldByName('USEID').AsString)
  + ' AND UPAGOID = ' + QuotedStr(DM1.cdsQry8.FieldByName('UPAGOID').AsString) + ' AND UPROID = ' + QuotedStr(DM1.cdsQry8.FieldByName('UPROID').AsString);
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  pplUse.Caption := 'U.S.E. : ' + DM1.cdsQry.FieldByName('USENOM').AsString;
  pplUseZip.Caption := DM1.CrgDescrip('DPTOID = '+QuotedStr(Copy(DM1.cdsQry8.FieldByName('ASODSTLABID').AsString, 1, 2)), ' APO158', 'DPTODES') + '/'
    + DM1.CrgDescrip('CIUDID = '+QuotedStr(Copy(DM1.cdsQry8.FieldByName('ASODSTLABID').AsString, 1, 4)), 'APO123', 'CIUDDES' ) + '/'
    + DM1.CrgDescrip('ZIPID = '+QuotedStr(DM1.cdsQry8.FieldByName('ASODSTLABID').AsString), 'APO122', 'ZIPDES' );
  pplFecNom.Caption := DM1.cdsQry8.FieldByName('ASOFRESNOM').AsString;
  pplFecCes.Caption := DM1.cdsQry8.FieldByName('ASOFRESCESE').AsString;
  pplNumResNoM.Caption := DM1.cdsQry8.FieldByName('ASORESNOM').AsString;
  pplNumResCes.Caption := DM1.cdsQry8.FieldByName('ASORESCESE').AsString;
  pplUltApo.Caption := DM1.cdsQry8.FieldByName('PVSLULAP').AsString;
  pplAnoApo.Caption := DM1.cdsQry8.FieldByName('PVSLTAAP').AsString;
  pplSalDis.Caption := FloatToStrF((DM1.cdsQry8.FieldByName('MONLIQBEN').AsFloat+DM1.cdsQry8.FieldByName('MONDEV').AsFloat-DM1.cdsQry8.FieldByName('MONDES').AsFloat), ffNumber, 10, 2);
  pplblUsuario.Caption := UpperCase(DM1.CrgDescrip('USERID = '+QuotedStr(DM1.cdsQry8.FieldByName('USUARIO').AsString), 'USERTABLE', 'USERNOM'));
  pplimppor.Caption := 'IMPRESO POR : ' + UpperCase(DM1.CrgDescrip('USERID = '+QuotedStr(DM1.wUsuario), 'USERTABLE', 'USERNOM'));
  pplbenasoapenom.Caption := 'Beneficiario : '+Trim(DM1.cdsQry2.FieldByName('PVSNOMBRE').AsString);
  pplbendni.Caption       := 'DNI : '+Trim(DM1.cdsQry2.FieldByName('PVSLDNIBEN').AsString);

  // Inicio: SPP_201306_PRE
  If DM1.cdsQry8.FieldByName('FORSOLBEN').AsString = 'O' Then pploriexp.Caption := 'ORIGEN : OFICIO INTERNO';
  If DM1.cdsQry8.FieldByName('FORSOLBEN').AsString = 'S' Then pploriexp.Caption := 'ORIGEN : SOLICITUD DEL BENEFICIARIO';
  pplregpen.Caption := DM1.DevuelveValor('APO105', 'REGPENABR', 'REGPENID', Copy(DM1.cdsQry4.FieldByName('REGPENID').AsString,1,2));
  If DM1.cdsQry4.FieldByName('REGPENID').AsString = '03' Then
  Begin
     xSql := 'SELECT SUBSTR(PROV,4,2) CODAFP, PROVDES DESAFP  FROM TGE201 WHERE SUBSTR(PROV,1,1) = ''A'' AND CLAUXID = ''A'' AND SUBSTR(PROV,4,2) = '+QuotedStr(DM1.cdsQry4.FieldByName('CODAFP').AsString);
     DM1.cdsQry.Close;
     DM1.cdsQry.DataRequest(xSql);
     DM1.cdsQry.Open;
     pplregpen.Caption := pplregpen.Caption + ' - ' + DM1.cdsQry.FieldByName('DESAFP').AsString;
   End;
  // Fin: SPP_201306_PRE

  pprImprimePrevio.Print;
  pprImprimePrevio.Stop;
end;

// Inicio: SPP_201306_PRE // Se retira el procedimiento BorraFotos (Ya no se usa)
// inicio: HPP_200915_ASO
// Memorándum 0317-2009-DM-EPS - SAR-2009-0746 - DAD-IR-2009-0157
// procedure TFGenCheGerBen.BorraFotos;
// Var
//   search: TSearchRec;
//   nFiles: integer;
//Begin
//   nFiles := FindFirst('C:\SOLEXES\*.JPG', faAnyFile, search);
//   While nFiles = 0 Do
//   Begin
//      SysUtils.DeleteFile('C:\SOLEXES\' + Search.Name);
//      nFiles := FindNext(Search);
//   End;
//   FindClose(Search);
// End;
// fin: HPP_200915_ASO
// Fin: SPP_201306_PRE

// Inicio: HPC_201507_PRE
// Se controla la impresión de la linea del total de la cuenta individual
procedure TFGenCheGerBen.ppLine36Print(Sender: TObject);
begin
   If cdsDetCalLiq.FieldByName('TIPDES').AsString = 'TC' Then
      ppLine36.Visible := True
   Else
      ppLine36.Visible := False;
end;
// Se controla que se imprima o no los zeros en la glosa observación
procedure TFGenCheGerBen.ppDBText14Print(Sender: TObject);
begin
  If Copy(cdsObs.FieldByName('DESC').AsString,1,5) = 'SALDO' Then
     ppDBText14.BlankWhenZero := False
  Else
     ppDBText14.BlankWhenZero := True;
end;
// Fin: HPC_201507_PRE

// Inicio: HPC_201709_PRE
// Procedimiento para la impresión de la cuenta individual
procedure TFGenCheGerBen.btnimprimirimpresoClick(Sender: TObject);
var xSql:String;
begin
  xSql := 'SELECT IDIMAGE, REGPENID, CODAFP FROM APO201 WHERE ASOID = ' + QuotedStr(DM1.cdsQry3.FieldByName('ASOID').AsString);
  // Fin: SPP_201306_PRE
  DM1.cdsQry4.Close;
  DM1.cdsQry4.DataRequest(xSql);
  DM1.cdsQry4.Open;
  xSql := 'SELECT A.PVSESTLIQ, A.PVSUSUANUL, A.PVSFANUL, A.PVSLTIPBE, A.PVSLBENNR, A.HREG, A.ASODNI, A.ASOTELF1, A.ASODIR, A.ASOCODMOD, A.ASODESLAB,'
  +' USEID, A.UPAGOID, A.UPROID, A.ASOFRESNOM, A.ASOFRESCESE, A.ASORESNOM, A.ASORESCESE, A.PVSLULAP, A.MONLIQBEN, A.MONDES, A.MONDEV, A.USUARIO,'
  +' A.ASOAPENOMDNI, A.ZIPID, A.ASODSTLABID, A.PVSLTAAP, B.FORSOLBEN'
  +' FROM PVS306 A, PVS301 B WHERE A.ASOID =  '+QuotedStr(DM1.cdsQry3.FieldByName('ASOID').AsString)
  +' AND A.PVSLBENNR = '+QuotedStr(DM1.cdsQry3.FieldByName('PVSLBENNR').AsString)
  +' AND A.ASOID = B.ASOID(+) AND A.PVSLBENNR = B.PVSLBENNR(+)';
  DM1.cdsQry8.Close;
  DM1.cdsQry8.DataRequest(xSql);
  DM1.cdsQry8.Open;
  xSql := 'SELECT PVSLCONCE, PVSLMONTO, TIPDES  FROM PVS307 WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsQry3.FieldByName('PVSLBENNR').AsString)
  + ' AND PVSLAGRID = ''DET'' ORDER BY PVSLSEC';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  DM1.cdsQry.First;
  cdsDetCalLiq.Close;
  cdsDetCalLiq.Open;
  cdsDetCalLiq.EmptyDataSet;
  DM1.liquidacionbeneficio := 0;
  While Not DM1.cdsQry.Eof Do
  Begin
    cdsDetCalLiq.Append;
    cdsDetCalLiq.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString;
    cdsDetCalLiq.FieldByName('MONTO').AsFloat := DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat;
    cdsDetCalLiq.FieldByName('TIPDES').AsString := DM1.cdsQry.FieldByName('TIPDES').AsString;
    cdsDetCalLiq.Post;
    If DM1.cdsQry.FieldByName('TIPDES').AsString <> 'TC' Then
       DM1.liquidacionbeneficio := DM1.liquidacionbeneficio + DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat;
    DM1.cdsQry.Next;
  End;
  ppTotbenAsi.Caption := FloatToStrF(DM1.liquidacionbeneficio,ffNumber,10,2);
  If cdsDetCalLiq.RecordCount = 0 Then
  Begin
    cdsDetCalLiq.Append;
    cdsDetCalLiq.FieldByName('DESC').AsString := 'Error no existe información de calculo de beneficio';
    cdsDetCalLiq.Post;
  End;
  xSql := 'SELECT PVSLCONCE, PVSLMONTO  FROM PVS307 WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsQry3.FieldByName('PVSLBENNR').AsString)
  + ' AND PVSLAGRID = ''DEV'' ORDER BY PVSLSEC';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  DM1.cdsQry.First;
  cdsDetDev.Close;
  cdsDetDev.Open;
  cdsDetDev.EmptyDataSet;
  While Not DM1.cdsQry.Eof Do
  Begin
    cdsDetDev.Append;
    cdsDetDev.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString;
    cdsDetDev.FieldByName('MONTO').AsFloat := DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat;
    cdsDetDev.Post;
    DM1.cdsQry.Next;
  End;
  If cdsDetDev.RecordCount = 0 Then
  Begin
    cdsDetDev.Append;
    cdsDetDev.FieldByName('DESC').AsString := 'No existen conceptos por devolución';
    cdsDetDev.Post;
  End;
  xSql := 'SELECT PVSLCONCE, PVSLMONTO, CREDID FROM PVS307 WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsQry2.FieldByName('PVSLBENNR').AsString)
  + ' AND PVSLAGRID = ''DSC'' ORDER BY PVSLSEC';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  DM1.cdsQry.First;
  cdsDetDes.Close;
  cdsDetDes.Open;
  cdsDetDes.EmptyDataSet;
  While Not DM1.cdsQry.Eof Do
  Begin
    cdsDetDes.Append;
    cdsDetDes.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString;
    cdsDetDes.FieldByName('MONTO').AsFloat := DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat;
    cdsDetDes.FieldByName('CREDID').AsString := DM1.cdsQry.FieldByName('CREDID').AsString;
    cdsDetDes.Post;
    DM1.cdsQry.Next;
  End;
  If cdsDetDes.RecordCount = 0 Then
  Begin
    cdsDetDes.Append;
    cdsDetDes.FieldByName('DESC').AsString := 'No existen conceptos por descuentos';
    cdsDetDes.Post;
  End;
  TNumericField(cdsDetDes.FieldByName('MONTO')).DisplayFormat := '###,###,##0.00';
  xSql := 'SELECT PVSLCONCE, PVSLMONTO, PVSLNOFC, NROCHEQUE, PVSLNVOU FROM PVS307 WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsQry3.FieldByName('PVSLBENNR').AsString)
  + ' AND PVSLAGRID = ''FPG'' ORDER BY PVSLSEC';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  DM1.cdsQry.First;
  cdsForPag.Close;
  cdsForPag.Open;
  cdsForPag.EmptyDataSet;
  While Not DM1.cdsQry.Eof Do
  Begin
    cdsForPag.Append;
    If Copy(DM1.cdsQry.FieldByName('PVSLCONCE').AsString, 1, 1) <> '*' Then
    Begin
      If DM1.cdsQry.FieldByName('PVSLNOFC').AsString <> '' Then
        cdsForPag.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString + '  [OFC:' + DM1.cdsQry.FieldByName('PVSLNOFC').AsString + ']'
      Else
        If DM1.cdsQry.FieldByName('NROCHEQUE').AsString <> '' Then
          cdsForPag.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString + '  [CHQ:' + DM1.cdsQry.FieldByName('NROCHEQUE').AsString + ']'
        Else
          cdsForPag.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString;
      End
    Else
      cdsForPag.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString + '  [VOUCHER N° ' + DM1.cdsQry.FieldByName('PVSLNVOU').AsString + ']';
    cdsForPag.FieldByName('MONTO').AsFloat := DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat;
    cdsForPag.Post;
    DM1.cdsQry.Next;
  End;
  If cdsForPag.RecordCount = 0 Then
  Begin
    cdsForPag.Append;
    cdsForPag.FieldByName('DESC').AsString := 'Error no existen designatarios';
    cdsForPag.Post;
  End;
  TNumericField(cdsForPag.FieldByName('MONTO')).DisplayFormat := '###,###,##0.00';
  xSql := 'SELECT PVSLCONCE, PVSLMONTO  FROM PVS307 WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsQry3.FieldByName('PVSLBENNR').AsString)
  + ' AND PVSLAGRID = ''RET'' ORDER BY PVSLSEC';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  cdsRetJud.Close;
  cdsRetJud.Open;
  cdsRetJud.EmptyDataSet;
  If DM1.cdsQry.RecordCount > 0 Then
  Begin
    While Not DM1.cdsQry.Eof Do
    Begin
      cdsRetJud.Append;
      cdsRetJud.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString;
      cdsRetJud.FieldByName('MONTO').AsFloat := DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat;
      cdsRetJud.Post;
      DM1.cdsQry.Next;
    End;
  End;
  xSql := 'SELECT PVSLCONCE, PVSLMONTO  FROM PVS307 WHERE PVSLBENNR = ' + QuotedStr(DM1.cdsQry8.FieldByName('PVSLBENNR').AsString)
  + ' AND PVSLAGRID = ''OBS'' ORDER BY PVSLSEC';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  DM1.cdsQry.First;
  cdsObs.Close;
  cdsObs.Open;
  cdsObs.EmptyDataSet;
  While Not DM1.cdsQry.Eof Do
  Begin
    cdsObs.Append;
    cdsObs.FieldByName('DESC').AsString := DM1.cdsQry.FieldByName('PVSLCONCE').AsString;
    cdsObs.FieldByName('MONTO').AsFloat := DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat;
    cdsObs.Post;
    DM1.cdsQry.Next;
  End;
  If cdsObs.RecordCount = 0 Then
  Begin
    cdsObs.Append;
    cdsObs.FieldByName('DESC').AsString := 'No existen observaciones registradas';
    cdsObs.Post;
  End;
  dm1.CargaImagenes(DM1.cdsQry3.FieldByName('ASODNI').AsString);
  ImagAso.Picture.Assign(DM1.Jpg);
  If (DM1.cdsQry8.FieldByName('PVSESTLIQ').AsString = '04') Or (DM1.cdsQry8.FieldByName('PVSESTLIQ').AsString = '13') Then
  Begin
    ppanula.Visible := True;
    ppanula.Caption := 'LIQUIDACION ANULADA POR : ' +DM1.CrgDescrip('USERID='+QuotedStr(Trim(DM1.cdsQry8.FieldByName('PVSUSUANUL').AsString)),'TGE006','USERNOM')
    + ' EL : ' + DM1.cdsQry8.FieldByName('PVSFANUL').AsString;
  End
  Else
  ppanula.Visible   := False;
  ppldesben.Caption := DM1.CrgDescrip('TIPBENEF='+QuotedStr(DM1.cdsQry8.FieldByName('PVSLTIPBE').AsString), 'TGE186', 'BENEFDES');
  pplblLiqBen.Caption     := 'LIQUIDACION DE BENEFICIO Nº ' + Copy(DM1.cdsQry8.FieldByName('PVSLBENNR').AsString, 5, 7);
  pplfecliq.Caption       := 'FECHA : ' + DM1.cdsQry8.FieldByname('HREG').AsString;
  pplAsoApeNomDni.Caption := DM1.cdsQry8.FieldByname('ASOAPENOMDNI').AsString;
  pplAsoDni.Caption       := DM1.cdsQry8.FieldByname('ASODNI').AsString;
  pplasotelef.Caption     := DM1.cdsQry8.FieldByname('ASOTELF1').AsString;
  pplAsoDir.Caption       := DM1.cdsQry8.FieldByname('ASODIR').AsString;
  pplZipDes.Caption := DM1.CrgDescrip('DPTOID = '+QuotedStr(Copy(DM1.cdsQry8.FieldByName('ZIPID').AsString, 1, 2)), 'APO158', 'DPTODES') + '/'
      + DM1.CrgDescrip('CIUDID = '+QuotedStr(Copy(DM1.cdsQry8.FieldByName('ZIPID').AsString, 1, 4)),   'APO123', 'CIUDDES', ) + '/'
      + DM1.CrgDescrip('ZIPID = '+QuotedStr(DM1.cdsQry8.FieldByName('ZIPID').AsString), 'APO122', 'ZIPDES');
  pplAsoCodMod.Caption := DM1.cdsQry8.FieldByName('ASOCODMOD').AsString;
  pplCentroEducativo.Caption := DM1.cdsQry8.FieldByName('ASODESLAB').AsString;
  xSql := 'SELECT USENOM FROM APO101 WHERE USEID = ' + QuotedStr(DM1.cdsQry8.FieldByName('USEID').AsString)
  + ' AND UPAGOID = ' + QuotedStr(DM1.cdsQry8.FieldByName('UPAGOID').AsString) + ' AND UPROID = ' + QuotedStr(DM1.cdsQry8.FieldByName('UPROID').AsString);
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  pplUse.Caption := 'U.S.E. : ' + DM1.cdsQry.FieldByName('USENOM').AsString;
  pplUseZip.Caption := DM1.CrgDescrip('DPTOID = '+QuotedStr(Copy(DM1.cdsQry8.FieldByName('ASODSTLABID').AsString, 1, 2)), ' APO158', 'DPTODES') + '/'
    + DM1.CrgDescrip('CIUDID = '+QuotedStr(Copy(DM1.cdsQry8.FieldByName('ASODSTLABID').AsString, 1, 4)), 'APO123', 'CIUDDES' ) + '/'
    + DM1.CrgDescrip('ZIPID = '+QuotedStr(DM1.cdsQry8.FieldByName('ASODSTLABID').AsString), 'APO122', 'ZIPDES' );
  pplFecNom.Caption := DM1.cdsQry8.FieldByName('ASOFRESNOM').AsString;
  pplFecCes.Caption := DM1.cdsQry8.FieldByName('ASOFRESCESE').AsString;
  pplNumResNoM.Caption := DM1.cdsQry8.FieldByName('ASORESNOM').AsString;
  pplNumResCes.Caption := DM1.cdsQry8.FieldByName('ASORESCESE').AsString;
  pplUltApo.Caption := DM1.cdsQry8.FieldByName('PVSLULAP').AsString;
  pplAnoApo.Caption := DM1.cdsQry8.FieldByName('PVSLTAAP').AsString;
  pplSalDis.Caption := FloatToStrF((DM1.cdsQry8.FieldByName('MONLIQBEN').AsFloat+DM1.cdsQry8.FieldByName('MONDEV').AsFloat-DM1.cdsQry8.FieldByName('MONDES').AsFloat), ffNumber, 10, 2);
  pplblUsuario.Caption := UpperCase(DM1.CrgDescrip('USERID = '+QuotedStr(DM1.cdsQry8.FieldByName('USUARIO').AsString), 'USERTABLE', 'USERNOM'));
  pplimppor.Caption := 'IMPRESO POR : ' + UpperCase(DM1.CrgDescrip('USERID = '+QuotedStr(DM1.wUsuario), 'USERTABLE', 'USERNOM'));
  pplbenasoapenom.Caption := 'Beneficiario : '+Trim(DM1.cdsQry3.FieldByName('PVSNOMBRE').AsString);
  pplbendni.Caption       := 'DNI : '+Trim(DM1.cdsQry3.FieldByName('PVSLDNIBEN').AsString);
  If DM1.cdsQry8.FieldByName('FORSOLBEN').AsString = 'O' Then pploriexp.Caption := 'ORIGEN : OFICIO INTERNO';
  If DM1.cdsQry8.FieldByName('FORSOLBEN').AsString = 'S' Then pploriexp.Caption := 'ORIGEN : SOLICITUD DEL BENEFICIARIO';
  pplregpen.Caption := DM1.DevuelveValor('APO105', 'REGPENABR', 'REGPENID', Copy(DM1.cdsQry4.FieldByName('REGPENID').AsString,1,2));
  If DM1.cdsQry4.FieldByName('REGPENID').AsString = '03' Then
  Begin
     xSql := 'SELECT SUBSTR(PROV,4,2) CODAFP, PROVDES DESAFP  FROM TGE201 WHERE SUBSTR(PROV,1,1) = ''A'' AND CLAUXID = ''A'' AND SUBSTR(PROV,4,2) = '+QuotedStr(DM1.cdsQry4.FieldByName('CODAFP').AsString);
     DM1.cdsQry.Close;
     DM1.cdsQry.DataRequest(xSql);
     DM1.cdsQry.Open;
     pplregpen.Caption := pplregpen.Caption + ' - ' + DM1.cdsQry.FieldByName('DESAFP').AsString;
   End;
  pprImprimePrevio.Print;
  pprImprimePrevio.Stop;
end;
// Fin: HPC_201709_PRE

end.
