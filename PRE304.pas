// Inicio Uso Estándares: 01/08/2011
// Unidad               : Previsión Social
// Formulario           : Fliqxofiint
// Fecha de Creación    : 20/02/2018
// Autor                : Sistemas
// Objetivo             : Reporte de liquidaciones RG
// Actualizaciones:
// HPC_201804_PRE       : Creación
// HPC_201805_PRE       : Para los casos de reliquidaciones de colocal como CI en monto disponible del beneficio y monto diferencial va en cero

unit PRE304;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, wwdbdatetimepicker,
  ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppBands, ppVar, jpeg, ppPrnabl,
  ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, DBGrids, db;

type
  TFRepLiqRG = class(TForm)
    gbfechas: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtpfecinicio: TwwDBDateTimePicker;
    dtpfecfinal: TwwDBDateTimePicker;
    btnprocesar: TBitBtn;
    btnimprimir: TBitBtn;
    btnaexcel: TBitBtn;
    btncerrar: TBitBtn;
    dbgreporte: TwwDBGrid;
    dbgAExcel: TDBGrid;
    pprLiqRG: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppShape9: TppShape;
    ppLabel9: TppLabel;
    ppShape10: TppShape;
    ppLabel10: TppLabel;
    ppShape11: TppShape;
    ppLabel11: TppLabel;
    ppShape12: TppShape;
    ppLabel12: TppLabel;
    ppShape13: TppShape;
    ppLabel13: TppLabel;
    ppImage1: TppImage;
    ppLabel16: TppLabel;
    ppltituloExtorno: TppLabel;
    pplfechas: TppLabel;
    ppLabel19: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppShape14: TppShape;
    ppLabel14: TppLabel;
    ppShape15: TppShape;
    ppLabel31: TppLabel;
    ppShape1: TppShape;
    ppLabel2: TppLabel;
    ppShape2: TppShape;
    ppLabel3: TppLabel;
    ppShape3: TppShape;
    ppLabel4: TppLabel;
    ppShape4: TppShape;
    ppLabel5: TppLabel;
    ppShape5: TppShape;
    ppLabel6: TppLabel;
    ppShape6: TppShape;
    ppLabel1: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLine3: TppLine;
    pplimpresopor: TppLabel;
    bdeliqRG: TppBDEPipeline;
    ppDBText7: TppDBText;
    ppDBText15: TppDBText;
    ppShape7: TppShape;
    ppLabel7: TppLabel;
    ppShape8: TppShape;
    ppLabel8: TppLabel;
    procedure btnprocesarClick(Sender: TObject);
    procedure limpia;
    procedure btnaexcelClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
  private
    xSqlAExcel:String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRepLiqRG: TFRepLiqRG;

implementation

uses PREDM;

{$R *.dfm}

procedure TFRepLiqRG.btnprocesarClick(Sender: TObject);
Var xSql:String;
begin
   If Trim(dtpfecinicio.Text) = '' Then
   Begin
      MessageDlg('Ingrese la fecha inicial', mtInformation, [mbOk], 0);
      dtpfecinicio.SetFocus;
      Exit;
   End;
   If Trim(dtpfecfinal.Text) = '' Then
   Begin
      MessageDlg('Ingrese la fecha final', mtInformation, [mbOk], 0);
      dtpfecfinal.SetFocus;
      Exit;
   End;
   If dtpfecinicio.Date > dtpfecfinal.Date Then
   Begin
      MessageDlg('Ingrese una fecha inicial menor o igual a la fecha final', mtInformation, [mbOk], 0);
      dtpfecinicio.SetFocus;
      Exit;
   End;
   // Inicio: HPC_201805_PRE
   // Para los casos de reliquidaciones de colocal como CI en monto disponible del beneficio y monto diferencial va en cero   
   // xSql := 'SELECT A.ASOID CCL, A.ASODNI NID, A.ASOAPENOMDNI NCL, B.ASOFECNAC FNAC, TO_DATE(B.FECAUTDESAPO) FCADAPS, D.DPTODES DPTO,'
   // +' TRUNC(MONTHS_BETWEEN(A.ASOFRESCESE,B.ASOFECNAC)/12) EDAD, A.ASOFRESCESE FCES,'
   // +' CASE WHEN A.PVSLTIPBE = ''01'' THEN ''RE'' WHEN A.PVSLTIPBE = ''02'' THEN ''IN'' WHEN A.PVSLTIPBE = ''03'' THEN ''FA'' END TLIQ, A.PVSLFECBE FLIQ,'
   // +' NVL(A.MONDES,0)+ NVL(A.MONDEV,0) TDESC,'
   // +' (SELECT SUM(NVL(PVSLMONTO,0)) FROM PVS307 WHERE PVSLBENNR = A.PVSLBENNR AND PVSLAGRID IN (''FPG'', ''RET'') AND FLGVOUCHER  = ''N'') BEN,'
   // +' NVL((SELECT SUM(NVL(PVSLMONTO,0)) FROM PVS307 WHERE PVSLBENNR = A.PVSLBENNR AND PVSLAGRID = ''OBS'' AND SUBSTR(PVSLCONCE,1,17) = ''SALDO DE LA DEUDA''),0) SPL,'
   // +' NVL((SELECT SUM(NVL(PVSLMONTO,0)) FROM PVS307 WHERE A.PVSLBENNR = PVSLBENNR AND PVSLAGRID = ''DET'' AND TIPDES = ''MD''),0) MDIF'
   // +' FROM PVS306 A, APO201 B, APO101 C, APO158 D'
   // +' WHERE A.PVSLFECBE >= '+QuotedStr(dtpfecinicio.Text)+' AND A.PVSLFECBE <= '+QuotedStr(dtpfecfinal.Text)
   // +' AND A.PVSESTLIQ NOT IN (''04'',''13'')'
   // +' AND A.ASOID = B.ASOID'
   // +' AND B.UPROID = C.UPROID AND B.UPAGOID = C.UPAGOID AND B.USEID = C.USEID'
   // +' AND C.DPTOID = D.DPTOID';
   xSql := 'SELECT CCL, NID, NCL, FNAC, FCADAPS, DPTO, EDAD, FCES, TLIQ, FLIQ, MAX(CI) CI, MAX(TDESC) TDESC, MAX(BEN) BEN, MAX(SPL) SPL, MAX(MDIF) MDIF'
   +' FROM (SELECT A.ASOID CCL, A.ASODNI NID,  A.ASOAPENOMDNI NCL,  D.ASOFECNAC FNAC, TO_DATE(D.FECAUTDESAPO) FCADAPS, F.DPTODES DPTO,'
   +' TRUNC(MONTHS_BETWEEN(A.ASOFRESCESE,D.ASOFECNAC)/12) EDAD, A.ASOFRESCESE FCES,'
   +' CASE WHEN A.PVSLTIPBE = ''01'' THEN ''RE'' WHEN A.PVSLTIPBE = ''02'' THEN ''FA'' WHEN A.PVSLTIPBE = ''03'' THEN ''IN'' END TLIQ,'
   +' TO_DATE(A.PVSLFECBE) FLIQ, NVL(C.MONLIBEN,0)+NVL(C.CI,0) CI, NVL(A.MONDES,0)- NVL(A.MONDEV,0) TDESC, NVL(A.MONPAG,0) BEN,NVL(H.SPL,0) SPL, G.MDIF'
   +' FROM PVS306 A, PVS307 B, (SELECT A.PVSLBENNR, MAX(CASE WHEN A.PVSESTLIQ = ''05'' THEN A.MONLIQBEN ELSE 0 END) MONLIBEN,'
   +' SUM(CASE WHEN A.PVSESTLIQ <> ''05'' THEN B.PVSLMONTO ELSE 0 END) CI FROM PVS306 A, PVS307 B WHERE A.PVSLBENNR = B.PVSLBENNR AND B.PVSLAGRID = ''DET'''
   +' AND B.TIPDES IN (''FA'',''FI'',''FB'') GROUP BY A.PVSLBENNR) C,'
   +' APO201 D, APO101 E, APO158 F,'
   +' (SELECT A.PVSLBENNR, B.PVSLMONTO MDIF FROM PVS306 A, PVS307 B WHERE A.PVSESTLIQ IN (''02'',''06'') AND A.PVSLBENNR = B.PVSLBENNR AND TIPDES = ''MD'') G,'
   +' (SELECT PVSLBENNR, SUM(NVL(PVSLMONTO,0)) SPL FROM PVS307 WHERE PVSLAGRID = ''OBS'' AND SUBSTR(PVSLCONCE,1,17) = ''SALDO DE LA DEUDA'' GROUP BY PVSLBENNR) H'
   +' WHERE A.PVSLFECBE >= '+QuotedStr(dtpfecinicio.Text)+' AND A.PVSLFECBE <= '+QuotedStr(dtpfecfinal.Text)+' AND A.PVSESTLIQ NOT IN (''04'',''13'')'
   +' AND A.PVSLBENNR = B.PVSLBENNR AND A.ASOID = D.ASOID AND D.UPROID = E.UPROID AND D.UPAGOID = E.UPAGOID AND D.USEID = E.USEID'
   +' AND E.DPTOID = F.DPTOID AND A.PVSLBENNR = C.PVSLBENNR(+) AND A.PVSLBENNR = G.PVSLBENNR(+) AND A.PVSLBENNR = H.PVSLBENNR(+))'
   +' GROUP BY CCL, NID, NCL, FNAC, FCADAPS, DPTO, EDAD, FCES, TLIQ, FLIQ';
   // Fin: HPC_201805_PRE
   xSqlAExcel := xSql;
   Screen.Cursor := crHourGlass;
   DM1.cdsReporte.Close;
   DM1.cdsReporte.DataRequest(xSql);
   DM1.cdsReporte.Open;
   Screen.Cursor := crDefault;
   If DM1.cdsReporte.RecordCount = 0 Then
   Begin
      limpia;
      MessageDlg('No existe información para mostrar', mtCustom, [mbOk], 0);
      Exit;
   End;
   dbgreporte.Selected.Clear;
   dbgreporte.Selected.Add('CCL'#9'10'#9'Código interno~del asociado'#9#9);
   dbgreporte.Selected.Add('NID'#9'8'#9'Nº de~documento'#9#9);
   dbgreporte.Selected.Add('NCL'#9'42'#9'Nombre del~asociado'#9#9);
   dbgreporte.Selected.Add('FNAC'#9'10'#9'Fecha de nacimiento~del asociado'#9#9);
   dbgreporte.Selected.Add('FCADAPS'#9'10'#9'Fecha de~CADAPS'#9#9);
   dbgreporte.Selected.Add('DPTO'#9'15'#9'Departamento'#9#9);
   dbgreporte.Selected.Add('EDAD'#9'10'#9'Edad'#9#9);
   dbgreporte.Selected.Add('FCES'#9'10'#9'Fecha de~cese'#9#9);
   dbgreporte.Selected.Add('TLIQ'#9'15'#9'Tipo~Liquidación'#9#9);
   dbgreporte.Selected.Add('FLIQ'#9'10'#9'Fecha de~Liquidación'#9#9);
   dbgreporte.Selected.Add('CI'#9'12'#9'Cuenta Individual~acumulada'#9#9);
   dbgreporte.Selected.Add('TDESC'#9'12'#9'Total~descuentos'#9#9);
   dbgreporte.Selected.Add('BEN'#9'12'#9'Saldo del~Beneficio'#9#9);
   dbgreporte.Selected.Add('SPL'#9'12'#9'Saldo posterior~a la liquidación'#9#9);
   dbgreporte.Selected.Add('MDIF'#9'12'#9'Monto~diferencial'#9#9);
   TNumericField(DM1.cdsReporte.FieldByName('CI')).DisplayFormat := '##,##0.00';
   TNumericField(DM1.cdsReporte.FieldByName('TDESC')).DisplayFormat := '##,##0.00';
   TNumericField(DM1.cdsReporte.FieldByName('BEN')).DisplayFormat := '##,##0.00';
   TNumericField(DM1.cdsReporte.FieldByName('SPL')).DisplayFormat := '##,##0.00';
   TNumericField(DM1.cdsReporte.FieldByName('MDIF')).DisplayFormat := '##,##0.00';
   dbgreporte.ApplySelected;
end;

procedure TFRepLiqRG.limpia;
begin
   If DM1.cdsReporte.Active Then DM1.cdsReporte.Close;
end;

procedure TFRepLiqRG.btnaexcelClick(Sender: TObject);
begin
   DM1.cdsReporte1.Close;
   DM1.cdsReporte1.DataRequest(xSqlAExcel);
   DM1.cdsReporte1.Open;
   DM1.HojaExcel('PRE_LIQXRG',DM1.dsReporte1, dbgAExcel);
end;

procedure TFRepLiqRG.btncerrarClick(Sender: TObject);
begin
   Close;
end;

procedure TFRepLiqRG.FormKeyPress(Sender: TObject; var Key: Char);
begin
   If Key = #13 Then
   begin
      Key := #0;
      Perform(CM_DIALOGKEY, VK_TAB, 0);
   end;
end;


procedure TFRepLiqRG.FormActivate(Sender: TObject);
begin
  limpia;
end;

procedure TFRepLiqRG.btnimprimirClick(Sender: TObject);
begin
   pplfechas.Caption := 'DEL '+dtpfecinicio.Text+' AL '+dtpfecfinal.Text;
   pplimpresopor.Caption:='Impreso por   : '+DM1.CrgDescrip('USERID='+QuotedStr(Trim(DM1.wUsuario)),'TGE006','USERNOM');
   pprLiqRG.Print;
end;

end.
