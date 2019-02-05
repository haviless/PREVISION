unit PRE921;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, wwdbedit, wwdblook, Wwdbdlg, fcButton, fcImgBtn, fcShapeBtn,
  StdCtrls, wwdbdatetimepicker, ExtCtrls, ppBands, ppCtrls, ppReport,
  ppStrtch, ppSubRpt, ppPrnabl, ppClass, ppProd, ppDB, ppComm, ppRelatv,
  ppTypes, ppCache, ppDBPipe, ppViewr, db, ppEndUsr, Wwdatsrc, DBTables, Wwquery;

type
  TFToolRepLiqxDpto = class(TForm)
    pnlRepLiq: TPanel;
    gbPeriodo: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    dbdtpDesde: TwwDBDateTimePicker;
    dbdtpHasta: TwwDBDateTimePicker;
    bbtnImprimir: TfcShapeBtn;
    bbtnRepLiqxDpto: TfcShapeBtn;
    GroupBox1: TGroupBox;
    dblcdDpto: TwwDBLookupComboDlg;
    dbeDescDpto: TwwDBEdit;
    ppdbRepLiqxDpto: TppDBPipeline;
    ppdbRepDctos: TppDBPipeline;
    ppdbFPago: TppDBPipeline;
    ppdbObserv: TppDBPipeline;
    ppDesigner1: TppDesigner;
    ppdbRepCalcBen: TppDBPipeline;
    ppRepLiquidacion: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLine1: TppLine;
    ppLabel8: TppLabel;
    pplblAso: TppLabel;
    ppLabel9: TppLabel;
    pplblDNI: TppLabel;
    pplblDir: TppLabel;
    pplblCiud: TppLabel;
    ppLabel7: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    pplblUSE: TppLabel;
    pplblDirLab: TppLabel;
    pplblCodMod: TppLabel;
    ppLabel16: TppLabel;
    ppLine6: TppLine;
    ppLine5: TppLine;
    pplblCE: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    pplblFNom: TppLabel;
    ppLabel18: TppLabel;
    pplblUltApo: TppLabel;
    ppLabel20: TppLabel;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    pplblFCes: TppLabel;
    pplblTAnosAp: TppLabel;
    ppLabel17: TppLabel;
    ppLabel19: TppLabel;
    pplblResCes: TppLabel;
    pplblResNom: TppLabel;
    ppLine7: TppLine;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel50: TppLabel;
    ppLabel97: TppLabel;
    ppLabel98: TppLabel;
    ppLabel99: TppLabel;
    ppLabel100: TppLabel;
    ppLabel101: TppLabel;
    ppLabel102: TppLabel;
    ppLabel40: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    ppLabel80: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLabel86: TppLabel;
    ppLabel87: TppLabel;
    ppLabel89: TppLabel;
    ppLabel81: TppLabel;
    ppLabel88: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppdbNroLiq: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText3: TppDBText;
    ppSubRepCalcBen: TppSubReport;
    ppTitleBand1: TppTitleBand;
    ppLabel22: TppLabel;
    ppLine13: TppLine;
    ppShape11: TppShape;
    ppShape12: TppShape;
    ppLine14: TppLine;
    ppDetailBand2: TppDetailBand;
    ppDBText1: TppDBText;
    ppShape7: TppShape;
    ppShape8: TppShape;
    ppDBText4: TppDBText;
    ppLabel31: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLine11: TppLine;
    ppLabel21: TppLabel;
    ppLine12: TppLine;
    ppLine15: TppLine;
    ppShape9: TppShape;
    ppShape10: TppShape;
    ppLine16: TppLine;
    ppLabel24: TppLabel;
    ppShape20: TppShape;
    ppShape21: TppShape;
    ppLabel30: TppLabel;
    ppSubRepDsctos: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppLabel23: TppLabel;
    ppLine17: TppLine;
    ppShape13: TppShape;
    ppShape14: TppShape;
    ppLine18: TppLine;
    ppDetailBand3: TppDetailBand;
    ppDBText2: TppDBText;
    ppShape16: TppShape;
    ppShape17: TppShape;
    ppDBText5: TppDBText;
    ppLabel35: TppLabel;
    ppDBText6: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    SubRepSaldo: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppLabel28: TppLabel;
    ppLine22: TppLine;
    ppShape18: TppShape;
    ppShape19: TppShape;
    ppLine23: TppLine;
    ppLabel29: TppLabel;
    ppLine24: TppLine;
    pplblSaldo: TppLabel;
    ppLabel34: TppLabel;
    ppDetailBand4: TppDetailBand;
    SubRepFPago: TppSubReport;
    ppChildReport4: TppChildReport;
    ppTitleBand5: TppTitleBand;
    ppLabel25: TppLabel;
    ppLine19: TppLine;
    ppShape15: TppShape;
    ppShape24: TppShape;
    ppLine20: TppLine;
    ppDetailBand6: TppDetailBand;
    ppDBText8: TppDBText;
    ppShape25: TppShape;
    ppShape32: TppShape;
    ppDBText10: TppDBText;
    ppLabel26: TppLabel;
    ppSummaryBand5: TppSummaryBand;
    SubRepObs: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand4: TppTitleBand;
    ppLabel42: TppLabel;
    ppLine28: TppLine;
    ppShape26: TppShape;
    ppLine29: TppLine;
    ppShape27: TppShape;
    ppDetailBand5: TppDetailBand;
    ppDBText7: TppDBText;
    ppShape28: TppShape;
    ppShape29: TppShape;
    ppDBText9: TppDBText;
    ppLabel43: TppLabel;
    ppLabel49: TppLabel;
    ppSummaryBand4: TppSummaryBand;
    ppLine30: TppLine;
    ppShape30: TppShape;
    ppShape31: TppShape;
    ppLine21: TppLine;
    ppShape33: TppShape;
    ppShape34: TppShape;
    ppLabel27: TppLabel;
    ppLine31: TppLine;
    ppLabel39: TppLabel;
    ppLine25: TppLine;
    ppShape22: TppShape;
    ppShape23: TppShape;
    ppLabel36: TppLabel;
    pplblTotDctos: TppLabel;
    ppLabel38: TppLabel;
    ppblbTotBenef: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    pplblTotDevol: TppLabel;
    pplblDevol: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppShape35: TppShape;
    ppLabel37: TppLabel;
    pplblAnalista: TppLabel;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppLabel41: TppLabel;
    pplblFecha: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel2: TppLabel;
    procedure FormCreate(Sender: TObject);
    procedure dblcdDptoExit(Sender: TObject);
    procedure bbtnRepLiqxDptoClick(Sender: TObject);
    procedure bbtnImprimirClick(Sender: TObject);
    procedure ppRepLiquidacionPreviewFormCreate(Sender: TObject);
    procedure ppHeaderBand1BeforePrint(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ppDetailBand3BeforePrint(Sender: TObject);
    procedure ppDetailBand6BeforePrint(Sender: TObject);
    procedure ppDetailBand5BeforePrint(Sender: TObject);
    procedure ppSummaryBand5BeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FToolRepLiqxDpto: TFToolRepLiqxDpto;
  xDptoRep, xProvRep, xCiudRep, xRepre, xDesRepre, xFecha : String;
  xTotObserv : Real;
  xContFPago : Integer;

implementation

uses PREDM, PRE001;

{$R *.DFM}

procedure TFToolRepLiqxDpto.FormCreate(Sender: TObject);
var
   Present : TDate;
begin
   Present := Date;
   dbdtpDesde.Date := Present;
   dbdtpHasta.Date := Present;
end;

procedure TFToolRepLiqxDpto.dblcdDptoExit(Sender: TObject);
var
   xWhere : String;
begin
   xWhere := 'DPTOID ='+QuotedStr(dblcdDpto.Text);
   dbeDescDpto.Text := DM1.DisplayDescrip('prvSQL', 'TGE158', 'DPTODES', xWhere, 'DPTODES');
end;

procedure TFToolRepLiqxDpto.bbtnRepLiqxDptoClick(Sender: TObject);
var
   xSQL : String;
begin
   If Length(dbdtpDesde.Text) = 0 Then
    begin
     Beep;
     MessageDlg('Ingrese la Fecha de Inicio', mtInformation, [mbOk], 0);
     dbdtpDesde.SetFocus;
     Exit;
    end;

   If Length(dbdtpHasta.Text) = 0 Then
    begin
     Beep;
     MessageDlg('Ingrese la Fecha de Fin', mtInformation, [mbOk], 0);
     dbdtpHasta.SetFocus;
     Exit;
    end;

   If (dbdtpDesde.DateTime) > (dbdtpHasta.DateTime) Then
    begin
     Beep;
     MessageDlg('La Fecha de Inicio es Mayor a la Fecha de Fin', mtInformation, [mbOk], 0);
     dbdtpDesde.SetFocus;
     Exit;
    end;

   If Length(dblcdDpto.Text) = 0 Then
    begin
     Beep;
     MessageDlg('Ingrese el Departamento', mtInformation, [mbOk], 0);
     dblcdDpto.SetFocus;
     Exit;
    end;

   Screen.Cursor := crHourGlass;
   xSQL := 'SELECT A.CIAID, SubStr(A.PVSLBENNR, 5, 7) PVSLBENNR, A.PVSEXPNRO, To_Date(To_Char(A.PVSLFECBE, ''DD/MM/YYYY'')) PVSLFECBE,'
          +' A.PVSLTIPBE, A.ASOID, A.ASOCODMOD, A.PVSLAPNOM, A.PVSESTLIQ,'
          +' B.PVSESTDES, C.BENEFDES, A.PVSLBENNR PVSLBENNR1'
          +' FROM PVS306 A, PVS102 B, TGE186 C, PVS301 D, APO201 E, APO101 F'
          +' WHERE A.PVSLTIPBE = C.TIPBENEF'
          +' And A.PVSESTLIQ = B.PVSESTDSG'
          +' And B.PVSDOC = '+QuotedStr('L')
          +' And A.ASOID = E.ASOID'
          +' And E.USEID = F.USEID AND E.UPAGOID = F.UPAGOID AND E.UPROID = F.UPROID'
          +' And To_Date(To_Char(A.FREG, ''DD/MM/YYYY'')) >= '+QuotedStr(DateToStr(dbdtpDesde.Date))
          +' And To_Date(To_Char(A.FREG, ''DD/MM/YYYY'')) <= '+QuotedStr(DateToStr(dbdtpHasta.Date))
          +' And A.PVSLBENNR = D.PVSLIQNRO'
          +' And D.PVSESTADO  ='+QuotedStr('02')
          +' And F.DPTOID ='+QuotedStr(dblcdDpto.Text)
          +' Order By PVSLBENNR';

   FPrincipal.MRefe.UsuarioSQL.Clear;
   FPrincipal.MRefe.FMant.wTabla := 'VWPRECABLIQ';
   FPrincipal.MRefe.UsuarioSQL.Add(xSQL);
   FPrincipal.MRefe.NewQuery;
   Screen.Cursor := crDefault;
end;

procedure TFToolRepLiqxDpto.bbtnImprimirClick(Sender: TObject);
var
   xSQL : String;
   x10 : Integer;
begin
   //Para el Detalle del Cálculo del Beneficio
   xSQL := 'Select Cast(''AAA'' As Varchar2(11)) PVSLBENNR1,'
          +' Cast(''AAAAA'' As Varchar2(80)) DESCRIP,'
          +' Cast(''9999'' As Decimal(15,2)) MONTO From TGE901';

   DM1.cdsQry2.Filter   := '';
   DM1.cdsQry2.Filtered := False;
   DM1.cdsQry2.IndexFieldNames := '';
   DM1.cdsQry2.Close;
   DM1.cdsQry2.DataRequest(xSQL);
   DM1.cdsQry2.Open;
   DM1.cdsQry2.Delete;

   xSQL := 'Select Cast(''AAAA'' As Varchar2(6)) TIPCREID,'
          +' Cast(''AAAA'' As Varchar2(30)) TIPOCRED,'
          +' Cast(''AAAA'' As Varchar2(15)) CREDID,'
          +' Cast(''AAAA'' As Varchar2(70)) DESCRIP,'
          +' Cast(''AAAA'' As Varchar2(50)) TIPCREABR,'
          +' Cast(''9999'' As Decimal(15,2)) MONTOPAG From TGE901';

   DM1.cdsQry8.Filter   := '';
   DM1.cdsQry8.Filtered := False;
   DM1.cdsQry8.IndexFieldNames := '';
   DM1.cdsQry8.Close;
   DM1.cdsQry8.DataRequest(xSQL);
   DM1.cdsQry8.Open;
   DM1.cdsQry8.Delete;

   xSQL := 'Select Cast(''AAAA'' As Varchar2(130)) DESCRIP,'
          +' Cast(''9999'' As Decimal(15,2)) MONTO,'
          +' Cast(''AAAA'' As Varchar(30)) FAMAPEPAT,'
          +' Cast(''AAAA'' As Varchar(30)) FAMAPEMAT,'
          +' Cast(''AAAA'' As Varchar(30)) FAMNOMBRE,'
          +' Cast(''AAAA'' As Varchar(10)) DNI,'
          +' Cast(''9999'' As Number(22,2)) PORC From TGE901';

   DM1.cdsQry12.Filter   := '';
   DM1.cdsQry12.Filtered := False;
   DM1.cdsQry12.IndexFieldNames := '';
   DM1.cdsQry12.Close;
   DM1.cdsQry12.DataRequest(xSQL);
   DM1.cdsQry12.Open;
   DM1.cdsQry12.Delete;

   xSQL := 'Select Cast(''AAAA'' As Varchar2(80)) OBSERV,'
          +' Cast(''9999'' As Decimal(15,2)) MONTO From TGE901';

   DM1.cdsQry9.Filter   := '';
   DM1.cdsQry9.Filtered := False;
   DM1.cdsQry9.IndexFieldNames := '';
   DM1.cdsQry9.Close;
   DM1.cdsQry9.DataRequest(xSQL);
   DM1.cdsQry9.Open;
   DM1.cdsQry9.Delete;

   If DM1.cdsReporte.RecordCount = 0 Then
    begin
     Beep;
     MessageDlg('No Existen Datos a Imprimir', mtInformation, [mbOk], 0);
     Screen.Cursor := crDefault;
     Exit;
    end;

   Screen.Cursor := crHourGlass;

   ppRepLiquidacion.Template.FileName := wRutaRpt +'\RepLiquidxDpto.rtm';
   ppRepLiquidacion.Template.LoadFromFile ;

   ppRepLiquidacion.AllowPrintToArchive := True;
   ppRepLiquidacion.AllowPrintToFile := True;

   ppRepLiquidacion.Print;
   ppRepLiquidacion.Stop;

   x10 := Self.ComponentCount - 1;
   While x10 > 0 do
    begin
     If Self.Components[x10].ClassName = 'TppGroup' Then
      begin
       Self.Components[x10].Free;
      end;
     x10 := x10 - 1;
    end;

   Screen.Cursor := crDefault;
end;

procedure TFToolRepLiqxDpto.ppRepLiquidacionPreviewFormCreate(
  Sender: TObject);
begin
   ppRepLiquidacion.PreviewForm.WindowState := wsMaximized;
   TppViewer(ppRepLiquidacion.PreviewForm.Viewer).ZoomSetting := zsPageWidth;
end;

procedure TFToolRepLiqxDpto.ppHeaderBand1BeforePrint(Sender: TObject);
var
   xSQL, xWhere, xDpto, xProv, xCiud, xDptoAso, xProvAso, xCiudAso,
   xDptoL, xProvL, xCiudL, xCeDpto, xCeProv, xCeDist, xDptoCe, xProvCe, xDistCe,
   xDptoLab, xProvLab, xCiudLab : String;
   xTotDetAp : Real;
begin
   xSQL := 'Select * From PVS306'
          +' Where PVSLBENNR = '+QuotedStr(DM1.cdsReporte.FieldByName('PVSLBENNR1').AsString);

   DM1.cdsCabLiq.Filter  := '';
   DM1.cdsCabLiq.Filtered := False;
   DM1.cdsCabLiq.IndexFieldNames := '';
   DM1.cdsCabLiq.Close;
   DM1.cdsCabLiq.DataRequest(xSQL);
   DM1.cdsCabLiq.Open;

   xSQL := 'Select * From PVS307'
          +' Where PVSLBENNR ='+QuotedStr(DM1.cdsReporte.FieldByName('PVSLBENNR1').AsString)
          +' Order By PVSLSEC';

   DM1.cdsDetLiq.Filter   := '';
   DM1.cdsDetLiq.Filtered := False;
   DM1.cdsDetLiq.IndexFieldNames := '';
   DM1.cdsDetLiq.Close;
   DM1.cdsDetLiq.DataRequest(xSQL);
   DM1.cdsDetLiq.Open;

//Para Colocar el Tipo de Beneficio el Monto Total del Beneficio
   If DM1.cdsReporte.FieldByName('PVSLTIPBE').AsString = '01' Then
    begin
     ppLabel4.Caption  := 'POR RETIRO';
     ppLabel30.Caption := 'TOTAL BENEFICIO ASIGNADO POR RETIRO';
    end;
   If DM1.cdsReporte.FieldByName('PVSLTIPBE').AsString = '02' Then
    begin
     ppLabel4.Caption := 'POR FALLECIMIENTO';
     ppLabel30.Caption := 'TOTAL BENEFICIO ASIGNADO POR FALLECIMIENTO';
    end;
   If DM1.cdsReporte.FieldByName('PVSLTIPBE').AsString = '03' Then
    begin
     ppLabel4.Caption := 'POR INVALIDEZ';
     ppLabel30.Caption := 'TOTAL BENEFICIO ASIGNADO POR INVALIDEZ';
    end;      

   xWhere := 'ASOID ='+QuotedStr(DM1.cdsReporte.FieldByName('ASOID').AsString)
            +' And PVSEXPNRO ='+QuotedStr(DM1.cdsReporte.FieldByName('PVSEXPNRO').AsString)
            +' And PVSLIQNRO ='+QuotedStr(DM1.cdsReporte.FieldByName('PVSLBENNR1').AsString);
   pplblFecha.Caption := DM1.DisplayDescrip('prvSQL', 'PVS301', 'PVSFLIQ, REPRID', xWhere, 'PVSFLIQ');

   //Para la Identificación Personal
   pplblAso.Caption := DM1.cdsCabLiq.FieldByName('PVSLAPNOM').AsString;
   pplblDNI.Caption := DM1.cdsCabLiq.FieldByName('PVSLDNI').AsString;
   pplblDir.Caption := DM1.cdsCabLiq.FieldByName('PVSLDIR').AsString;

   xDpto    := DM1.cdsCabLiq.FieldByName('PVSLDPTO').AsString;
   xProv    := DM1.cdsCabLiq.FieldByName('PVSLPROV').AsString;
   xCiud    := DM1.cdsCabLiq.FieldByName('PVSLDIST').AsString;

   xWhere   := 'DPTOID ='+QuotedStr(xDpto);
   xDptoAso := DM1.DisplayDescrip('prvSQL', 'TGE158', 'DPTODES', xWhere, 'DPTODES');

   xWhere   := 'DPTOID ='+QuotedStr(xDpto)
              +' And CIUDID ='+QuotedStr(xProv);
   xProvAso := DM1.DisplayDescrip('prvSQL', 'APO123', 'CIUDDES', xWhere, 'CIUDDES');

   xWhere    := 'DPTOID ='+QuotedStr(xDpto)
               +' And CIUDID ='+QuotedStr(xProv)
               +' And ZIPID ='+QuotedStr(xCiud);
   xCiudAso := DM1.DisplayDescrip('prvSQL', 'APO122', 'ZIPDES', xWhere, 'ZIPDES');
   pplblCiud.Caption := xDptoAso+'/'+xProvAso+'/'+xCiudAso;
   
   //Para la Identificación Laboral
   pplblCodMod.Caption := DM1.cdsCabLiq.FieldByName('ASOCODMOD').AsString;
   pplblUSE.Caption := DM1.cdsCabLiq.FieldByName('PVSLUSEI').AsString;
   xDptoL   := DM1.cdsCabLiq.FieldByName('PVSLCEDP').AsString;
   xProvL   := DM1.cdsCabLiq.FieldByName('PVSLCEPR').AsString;
   xCiudL   := DM1.cdsCabLiq.FieldByName('PVSLCEDI').AsString;
   pplblCE.Caption := DM1.cdsCabLiq.FieldByName('PVSLCEED').AsString;

   xCeDpto  := DM1.cdsCabLiq.FieldByName('PVSLCEDP').AsString;
   xCeProv  := DM1.cdsCabLiq.FieldByName('PVSLCEPR').AsString;
   xCeDist  := DM1.cdsCabLiq.FieldByName('PVSLCEDI').AsString;

   xWhere   := 'DPTOID ='+QuotedStr(xDptoL);
   xDptoCe  := DM1.DisplayDescrip('prvSQL', 'TGE158', 'DPTODES', xWhere, 'DPTODES');

   xWhere   := 'DPTOID ='+QuotedStr(xCeDpto)
              +' And CIUDID ='+QuotedStr(xCeProv);
   xProvCe  := DM1.DisplayDescrip('prvSQL', 'APO123', 'CIUDDES', xWhere, 'CIUDDES');

   xWhere   := 'DPTOID ='+QuotedStr(xCeDpto)
              +' And CIUDID ='+QuotedStr(xCeProv)
              +' And ZIPID ='+QuotedStr(xCeDist);
   xDistCe  := DM1.DisplayDescrip('prvSQL', 'APO122', 'ZIPDES', xWhere, 'ZIPDES');

   xWhere   := 'DPTOID ='+QuotedStr(xDptoL);
   xDptoLab := DM1.DisplayDescrip('prvSQL', 'TGE158', 'DPTODES', xWhere, 'DPTODES');

   xWhere   := 'DPTOID ='+QuotedStr(xDptoL)
              +' And CIUDID ='+QuotedStr(xProvL);
   xProvLab := DM1.DisplayDescrip('prvSQL', 'APO123', 'CIUDDES', xWhere, 'CIUDDES');

   xWhere   := 'DPTOID ='+QuotedStr(xDptoL)
              +' And CIUDID ='+QuotedStr(xProvL)
              +' And ZIPID ='+QuotedStr(xCiudL);
   xCiudLab := DM1.DisplayDescrip('prvSQL', 'APO122', 'ZIPDES', xWhere, 'ZIPDES');

   pplblDirLab.Caption := xDptoLab+'/'+xProvLab+'/'+xCiudLab;

   xWhere := 'ASOID ='+QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)
            +' And PVSEXPNRO ='+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSEXPNRO').AsString)
            +' And PVSLIQNRO ='+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString);
   xFecha := DM1.DisplayDescrip('prvSQL', 'PVS301', 'PVSFLIQ, REPRID', xWhere, 'PVSFLIQ');
   xRepre := DM1.cdsQry.FieldByName('REPRID').AsString;

   pplblAnalista.Caption := DM1.cdsCabLiq.FieldByName('USUARIO').AsString;

   If Length(DM1.DisplayDescrip('prvSQL', 'COB201', 'REPRID, REPRAPENOM, DPTOID, CIUDID, ZIPID', 'REPRID ='+QuotedStr(xRepre), 'REPRAPENOM')) > 0 Then
    begin
     xDptoRep  := DM1.cdsQry.FieldByName('DPTOID').AsString;
     xProvRep  := DM1.cdsQry.FieldByName('CIUDID').AsString;
     xCiudRep  := DM1.cdsQry.FieldByName('ZIPID').AsString;
     xDesRepre := DM1.cdsQry.FieldByName('REPRAPENOM').AsString+'/'
                 +DM1.DisplayDescrip('prvSQL', 'APO158', 'DPTOABR', 'DPTOID ='+QuotedStr(DM1.cdsQry.FieldByName('DPTOID').AsString), 'DPTOABR')+'/'
                 +DM1.DisplayDescrip('prvSQL', 'APO123', 'CIUDABR', 'DPTOID ='+QuotedStr(xDptoRep)+' And CIUDID ='+QuotedStr(xProvRep), 'CIUDABR')+'/'
                 +DM1.DisplayDescrip('prvSQL', 'APO122', 'ZIPABR', 'DPTOID ='+QuotedStr(xDptoRep)+' And CIUDID ='+QuotedStr(xProvRep)+' And ZIPID ='+QuotedStr(xCiudRep), 'ZIPABR');
    end;
    
   //Para los Datos Generales para el Cálculo del Beneficio
   pplblFNom.Caption    := DM1.cdsCabLiq.FieldByName('PVSLFRES').AsString;
   pplblResNom.Caption  := DM1.cdsCabLiq.FieldByName('PVSLNRES').AsString;
   pplblFCes.Caption    := DM1.cdsCabLiq.FieldByName('PVSLFCES').AsString;
   pplblResCes.Caption  := DM1.cdsCabLiq.FieldByName('PVSLNCES').AsString;
   pplblTAnosAp.Caption := DM1.cdsCabLiq.FieldByName('PVSLULAP').AsString;
   pplblUltApo.Caption  := DM1.cdsCabLiq.FieldByName('PVSLTAAP').AsString;

//**********************************************************************************************************
   xSQL := 'Select Cast(''AAAA'' As Varchar2(130)) DESCRIP,'
          +' Cast(''9999'' As Decimal(15,2)) MONTO,'
          +' Cast(''AAAA'' As Varchar(30)) FAMAPEPAT,'
          +' Cast(''AAAA'' As Varchar(30)) FAMAPEMAT,'
          +' Cast(''AAAA'' As Varchar(30)) FAMNOMBRE,'
          +' Cast(''AAAA'' As Varchar(10)) DNI,'
          +' Cast(''9999'' As Number(22,2)) PORC From TGE901';

   DM1.cdsQry12.Filter   := '';
   DM1.cdsQry12.Filtered := False;
   DM1.cdsQry12.IndexFieldNames := '';
   DM1.cdsQry12.Close;
   DM1.cdsQry12.DataRequest(xSQL);
   DM1.cdsQry12.Open;
   DM1.cdsQry12.Delete;

   TNumericField(DM1.cdsQry12.FieldByName('MONTO')).DisplayFormat := '###,###,##0.00';
   TNumericField(DM1.cdsQry12.FieldByName('MONTO')).EditFormat    := '########0.00';

   //Para Total de Beneficios
   If Length(FloatToStr(DM1.cdsCabLiq.FieldByName('PVSLTBEN').AsFloat)) > 0 Then
    ppblbTotBenef.Caption := FloatToStrF(DM1.cdsCabLiq.FieldByName('PVSLTBEN').AsFloat, ffNumber, 15, 2)
   Else
    ppblbTotBenef.Caption := '0.00';

   //Para Total de Devoluciones
   If (Length(FloatToStr(DM1.cdsCabLiq.FieldByName('PVSLTDEV').AsFloat)) > 0) And
      (DM1.cdsCabLiq.FieldByName('PVSLTDEV').AsFloat > 0) Then
    begin
     pplblDevol.Visible    := True;
     ppLabel44.Visible     := True;
     ppLabel45.Visible     := True;
     ppLabel45.Caption     := FloatToStrF(DM1.cdsCabLiq.FieldByName('PVSLTDEV').AsFloat, ffNumber, 15, 2);
     pplblTotDevol.Visible := True;
     pplblTotDevol.Caption := FloatToStrF(DM1.cdsCabLiq.FieldByName('PVSLTDEV').AsFloat, ffNumber, 15, 2);
    end
   Else
    begin
     pplblDevol.Visible    := False;
     ppLabel44.Visible     := False;
     ppLabel45.Visible     := False;
     pplblTotDevol.Visible := True;
     pplblTotDevol.Caption := '0.00';
    end;

   //Para el Total de Descuentos
   If Length(FloatToStr(DM1.cdsCabLiq.FieldByName('PVSLTDSC').AsFloat)) > 0 Then
    pplblTotDctos.Caption := FloatToStrF(DM1.cdsCabLiq.FieldByName('PVSLTDSC').AsFloat, ffNumber, 15, 2)
   Else
    pplblTotDctos.Caption := '0.00';

   If Length(FloatToStr(DM1.cdsCabLiq.FieldByName('PVSLSALD').AsFloat)) > 0 Then
    pplblSaldo.Caption := FloatToStrF(DM1.cdsCabLiq.FieldByName('PVSLSALD').AsFloat, ffNumber, 15, 2)
   Else
    pplblSaldo.Caption := '0.00';

   //Para el Detalle del Cálculo del Beneficio
   xSQL := 'Select Cast(''AAA'' As Varchar2(11)) PVSLBENNR1,'
          +' Cast(''AAAAA'' As Varchar2(80)) DESCRIP,'
          +' Cast(''9999'' As Decimal(15,2)) MONTO From TGE901';

   DM1.cdsQry2.Filter   := '';
   DM1.cdsQry2.Filtered := False;
   DM1.cdsQry2.IndexFieldNames := '';
   DM1.cdsQry2.Close;
   DM1.cdsQry2.DataRequest(xSQL);
   DM1.cdsQry2.Open;
   DM1.cdsQry2.Delete;

   TNumericField(DM1.cdsQry2.FieldByName('MONTO')).DisplayFormat := '###,###,##0.00';
   TNumericField(DM1.cdsQry2.FieldByName('MONTO')).EditFormat    := '########0.00';

   xSQL := 'Select * From PVS307'
          +' Where PVSLBENNR ='+QuotedStr(DM1.cdsReporte.FieldByName('PVSLBENNR1').AsString)
          +' Order By PVSLSEC';

   DM1.cdsQry3.Filter   := '';
   DM1.cdsQry3.Filtered := False;
   DM1.cdsQry3.IndexFieldNames := '';
   DM1.cdsQry3.Close;
   DM1.cdsQry3.DataRequest(xSQL);
   DM1.cdsQry3.Open;

//Detalle para el Cálculo de los Descuentos
   xSQL := 'Select Cast(''AAAA'' As Varchar2(6)) TIPCREID,'
          +' Cast(''AAAA'' As Varchar2(30)) TIPOCRED,'
          +' Cast(''AAAA'' As Varchar2(15)) CREDID,'
          +' Cast(''AAAA'' As Varchar2(70)) DESCRIP,'
          +' Cast(''AAAA'' As Varchar2(50)) TIPCREABR,'
          +' Cast(''9999'' As Decimal(15,2)) MONTOPAG From TGE901';

   DM1.cdsQry8.Filter   := '';
   DM1.cdsQry8.Filtered := False;
   DM1.cdsQry8.IndexFieldNames := '';
   DM1.cdsQry8.Close;
   DM1.cdsQry8.DataRequest(xSQL);
   DM1.cdsQry8.Open;
   DM1.cdsQry8.Delete;

   TNumericField(DM1.cdsQry8.FieldByName('MONTOPAG')).DisplayFormat := '###,###,##0.00';
   TNumericField(DM1.cdsQry8.FieldByName('MONTOPAG')).EditFormat    := '########0.00';

   xSQL := 'Select Cast(''AAAA'' As Varchar2(80)) OBSERV,'
          +' Cast(''9999'' As Decimal(15,2)) MONTO From TGE901';

   DM1.cdsQry9.Filter   := '';
   DM1.cdsQry9.Filtered := False;
   DM1.cdsQry9.IndexFieldNames := '';
   DM1.cdsQry9.Close;
   DM1.cdsQry9.DataRequest(xSQL);
   DM1.cdsQry9.Open;
   DM1.cdsQry9.Delete;

   TNumericField(DM1.cdsQry9.FieldByName('MONTO')).DisplayFormat := '###,###,##0.00';
   TNumericField(DM1.cdsQry9.FieldByName('MONTO')).EditFormat    := '########0.00';

//Para el Total de la Forma de Pago
   If Length(FloatToStr(DM1.cdsCabLiq.FieldByName('PVSLFPAGO').AsFloat)) > 0 Then
    ppLabel39.Caption := FloatToStrF(DM1.cdsCabLiq.FieldByName('PVSLFPAGO').AsFloat, ffNumber, 15, 2)
   Else
    ppLabel39.Caption := '0.00';


//Para el Total de las Observaciones
   If Length(FloatToStr(DM1.cdsCabLiq.FieldByName('PVSTPRAN').AsFloat)) > 0 Then
    begin
     xTotObserv := DM1.cdsCabLiq.FieldByName('PVSTPRAN').AsFloat;
     ppLabel49.Caption := '['+FloatToStrF(DM1.cdsCabLiq.FieldByName('PVSTPRAN').AsFloat, ffNumber, 15, 2)+']';
    end
   Else
    ppLabel49.Caption := '0.00';

//Para la Forma de Pago
     xContFPago := 0;
     DM1.cdsDetLiq.First;
     While Not DM1.cdsDetLiq.EOF do
      begin
       If DM1.cdsDetLiq.FieldByName('PVSLAGRID').AsString = 'FPG' Then
        begin
         DM1.cdsQry12.Append;
         If (DM1.cdsDetLiq.FieldByName('FORPAGOID').AsString = '05') And (DM1.cdsDetLiq.FieldByName('FLGVOUCHER').AsString = 'S') Then //Si es un Giro
          begin
           If Length(DM1.cdsDetLiq.FieldByName('PVSLNOFC').AsString) > 0 Then
            DM1.cdsQry12.FieldByName('DESCRIP').AsString := DM1.cdsDetLiq.FieldByName('PVSLCONCE').AsString+' '+'OFICIO '+DM1.cdsDetLiq.FieldByName('PVSLNOFC').AsString
           Else
            DM1.cdsQry12.FieldByName('DESCRIP').AsString := DM1.cdsDetLiq.FieldByName('PVSLCONCE').AsString;
          end
         Else
          If (DM1.cdsDetLiq.FieldByName('FORPAGOID').AsString = '01') And (DM1.cdsDetLiq.FieldByName('FLGVOUCHER').AsString = 'S') Then //Si es Un Cheque
           begin
            If Length(DM1.cdsDetLiq.FieldByName('NROCHEQUE').AsString) > 0 Then
             DM1.cdsQry12.FieldByName('DESCRIP').AsString := DM1.cdsDetLiq.FieldByName('PVSLCONCE').AsString+' '+'CHEQUE '+DM1.cdsDetLiq.FieldByName('NROCHEQUE').AsString
            Else
             DM1.cdsQry12.FieldByName('DESCRIP').AsString := DM1.cdsDetLiq.FieldByName('PVSLCONCE').AsString;
           end
          Else
           DM1.cdsQry12.FieldByName('DESCRIP').AsString := DM1.cdsDetLiq.FieldByName('PVSLCONCE').AsString;
         If (Length(FloatToStr(DM1.cdsDetLiq.FieldByName('PVSLMONTO').AsFloat)) > 0) And
            (DM1.cdsDetLiq.FieldByName('PVSLMONTO').AsFloat > 0) Then
          DM1.cdsQry12.FieldByName('MONTO').AsFloat  := DM1.cdsDetLiq.FieldByName('PVSLMONTO').AsFloat
         Else
          DM1.cdsQry12.FieldByName('MONTO').Clear;
         xContFPago := xContFPago + 1;
        end;
       DM1.cdsDetLiq.Next;
      end;

//Para las Observaciones
     DM1.cdsDetLiq.First;
     While Not DM1.cdsDetLiq.EOF do
      begin
       If DM1.cdsDetLiq.FieldByName('PVSLAGRID').AsString = 'OBS' Then
        begin
         DM1.cdsQry9.Append;
         DM1.cdsQry9.FieldByName('OBSERV').AsString := DM1.cdsDetLiq.FieldByName('PVSLCONCE').AsString;
         If Copy(DM1.cdsDetLiq.FieldByName('PVSLCONCE').AsString, 1, 6) <> 'Origen' Then
          begin
           If DM1.cdsDetLiq.FieldByName('PVSLMONTO').AsFloat >= 0 Then
            DM1.cdsQry9.FieldByName('MONTO').AsFloat   := DM1.cdsDetLiq.FieldByName('PVSLMONTO').AsFloat;
          end
         Else
          begin
           DM1.cdsDetLiq.Edit;
           DM1.cdsDetLiq.FieldByName('PVSLMONTO').Clear;
           DM1.cdsQry9.FieldByName('MONTO').AsString := DM1.cdsDetLiq.FieldByName('PVSLMONTO').AsString;
          end;
        end;
       DM1.cdsDetLiq.Next;
      end;

//************************************
//Para el Detalle del Cálculo del Beneficio
   If DM1.cdsQry3.RecordCount > 0 Then
    begin
     xTotDetAp := 0;
     While Not DM1.cdsQry3.EOF do
      begin
       If DM1.cdsQry3.FieldByName('PVSLAGRID').AsString = 'DET' Then
        begin
         DM1.cdsQry2.Append;
         DM1.cdsQry2.FieldByName('PVSLBENNR1').AsString := DM1.cdsQry3.FieldByName('PVSLBENNR').AsString;
         DM1.cdsQry2.FieldByName('DESCRIP').AsString    := DM1.cdsQry3.FieldByName('PVSLCONCE').AsString;
         DM1.cdsQry2.FieldByName('MONTO').AsFloat       := DM1.cdsQry3.FieldByName('PVSLMONTO').AsFloat;
         xTotDetAp := xTotDetAp + DM1.cdsQry3.FieldByName('PVSLMONTO').AsFloat;
        end;
       DM1.cdsQry3.Next;
      end;
//     Label22.Caption := FloatToStrF(xTotDetAp, ffNumber, 15, 2);
     DM1.cdsQry2.First;
    end;

   DM1.cdsQry2.IndexFieldNames := '';
//   DM1.cdsQry2.IndexFieldNames := 'PVSLBENNR1';
//   DM1.cdsQry2.MasterSource    := DM1.dsReporte;
//   DM1.cdsQry2.MasterFields    := 'PVSLBENNR1';

//    end;
//   ppSubRepCalcBen.DataPipeline := ppdbRepCalcBen;
 //************************************
 //Para los Descuentos
   If DM1.cdsQry3.RecordCount > 0 Then
    begin
     DM1.cdsQry3.First;
     While Not DM1.cdsQry3.EOF do
      begin
       If DM1.cdsQry3.FieldByName('PVSLAGRID').AsString = 'DSC' Then
        begin
         DM1.cdsQry8.Append;
         DM1.cdsQry8.FieldByName('TIPCREID').AsString := DM1.cdsQry3.FieldByName('TIPCREID').AsString;
         DM1.cdsQry8.FieldByName('CREDID').AsString   := DM1.cdsQry3.FieldByName('CREDID').AsString;
         DM1.cdsQry8.FieldByName('DESCRIP').AsString  := DM1.cdsQry3.FieldByName('PVSLCONCE').AsString;
         DM1.cdsQry8.FieldByName('MONTOPAG').AsFloat  := DM1.cdsQry3.FieldByName('PVSLMONTO').AsFloat;
         DM1.cdsQry8.Post;
        end;
       DM1.cdsQry3.Next;
      end;
    end;

   If DM1.cdsQry8.RecordCount = 0 Then
    begin
     DM1.cdsQry8.Append;
     DM1.cdsQry8.FieldByName('MONTOPAG').AsString := '';
    end;
                                                                                  
   If DM1.cdsQry9.RecordCount = 0 Then
    begin
     DM1.cdsQry9.Append;
     DM1.cdsQry9.FieldByName('MONTO').AsString := '';
    end;

   If DM1.cdsQry12.RecordCount = 0 Then
    begin
     DM1.cdsQry12.Append;
     DM1.cdsQry12.FieldByName('MONTO').AsString := '';
    end;

   Screen.Cursor := crDefault;
//******************************************************************************************************************
end;

procedure TFToolRepLiqxDpto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DM1.cdsQry2.Filter   := '';
   DM1.cdsQry2.Filtered := False;
   DM1.cdsQry2.IndexFieldNames := '';
   DM1.cdsQry2.Close;
end;

procedure TFToolRepLiqxDpto.ppDetailBand3BeforePrint(Sender: TObject);
begin
   If DM1.cdsQry8.FieldByName('MONTOPAG').AsFloat > 0 Then
    ppLabel35.Visible := True
   Else
    ppLabel35.Visible := False;
end;

procedure TFToolRepLiqxDpto.ppDetailBand6BeforePrint(Sender: TObject);
begin
   If DM1.cdsQry12.FieldByName('MONTO').AsFloat > 0 Then
    ppLabel26.Visible := True
   Else
    ppLabel26.Visible := False;
end;

procedure TFToolRepLiqxDpto.ppDetailBand5BeforePrint(Sender: TObject);
var
   xNro : Integer;
begin
   If (DM1.cdsQry9.FieldByName('MONTO').AsFloat >= 0) And (Length(DM1.cdsQry9.FieldByName('OBSERV').AsString) > 0) Then
    ppLabel43.Visible := True
   Else
    ppLabel43.Visible := False;

   If Length(xRepre) > 0 Then
    ppLabel43.Visible := False;

   xNro := DM1.cdsQry9.RecordCount;
   If Length(xRepre) > 0 Then
    begin
     If (xTotObserv > 0) And (xNro -1 = DM1.cdsQry9.RecNo) Then
      begin
       ppLabel49.Visible := True;
//=====>       ppLabel49.Caption := Label32.Caption;
      end
     Else
      ppLabel49.Visible   := False;
    end
   Else
    begin
     If (xTotObserv > 0) And (xNro = DM1.cdsQry9.RecNo) Then
      begin
       ppLabel49.Visible := True;
//======>       ppLabel49.Caption := Label32.Caption;
      end
     Else
      ppLabel49.Visible   := False;
    end;
end;

procedure TFToolRepLiqxDpto.ppSummaryBand5BeforePrint(Sender: TObject);
begin
   If StrToFloat(StringReplace(ppLabel39.Caption, ',', '', [rfReplaceAll])) > 0 Then
    begin
     If xContFPago > 2 Then
      begin
       ppLabel39.Visible := True;
       ppLabel27.Visible := True;
       ppLine31.Visible  := True;
//       ppLabel39.Caption := Label20.Caption;
      end
     Else
      begin
       ppLabel27.Visible := False;
       ppLine31.Visible  := False;
       ppLabel39.Visible := False;
      end;
    end
   Else
    begin
     ppLabel39.Visible := False;
     ppLabel27.Visible := False;
     ppLine31.Visible  := False;
    end;
end;

end.
