// Inicio Uso Estándares: 01/08/2011
// Unidad               : PRE940
// Formulario           : FbAsoAplCCI
// Fecha de Creación    : 17/11/2015
// Autor                : Isaac Revilla
// Objetivo             : Pagos realizados a creditos con aplicación CCI
// HPC_201508_PRE       : Creación

unit PRE940;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, wwdbdatetimepicker, Buttons,
  ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppBands, jpeg, ppVar, ppPrnabl,
  ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport;

type
  TFbAsoAplCCI = class(TForm)
    gbFecha: TGroupBox;
    btnImprimePrevio: TBitBtn;
    btnimprimir: TBitBtn;
    btnaexcel: TBitBtn;
    btncerrar: TBitBtn;
    dbgreporte: TwwDBGrid;
    Label1: TLabel;
    dbdtpinicial: TwwDBDateTimePicker;
    Label2: TLabel;
    dbdtpfinal: TwwDBDateTimePicker;
    pprRepCCI: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppShape17: TppShape;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppLabel39: TppLabel;
    pplfechas: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppImage2: TppImage;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    ppLine4: TppLine;
    ppLine5: TppLine;
    pplimpresopor03: TppLabel;
    dbeRepCCI: TppBDEPipeline;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
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
    ppLabel7: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppLabel8: TppLabel;
    procedure btncerrarClick(Sender: TObject);
    procedure btnImprimePrevioClick(Sender: TObject);
    procedure btnaexcelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnimprimirClick(Sender: TObject);
    procedure limpia;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FbAsoAplCCI: TFbAsoAplCCI;




implementation

uses PREDM;

{$R *.dfm}

procedure TFbAsoAplCCI.btncerrarClick(Sender: TObject);
begin
   Close;
end;

procedure TFbAsoAplCCI.btnImprimePrevioClick(Sender: TObject);
Var xSql:String;
begin
   If Trim(dbdtpInicial.Text) = '' Then
   Begin
      MessageDlg('Ingrese la fecha inicial', mtInformation, [mbOk], 0);
      dbdtpInicial.SetFocus;
      Exit;
   End;
   If Trim(dbdtpFinal.Text) = '' Then
   Begin
      MessageDlg('Ingrese la fecha final', mtInformation, [mbOk], 0);
      dbdtpFinal.SetFocus;
      Exit;
   End;
   If dbdtpInicial.Date > dbdtpFinal.Date Then
   Begin
      MessageDlg('Ingrese una fecha inicial menor o igual a la fecha final', mtInformation, [mbOk], 0);
      dbdtpInicial.SetFocus;
      Exit;
   End;
   Screen.Cursor := crHourGlass;
   xSql := 'SELECT B.ASODNI, A.ASOCODMOD, B.ASOAPENOMDNI, C.NRO_PER, CASE WHEN D.ASOID IS NOT NULL THEN ''SI'' ELSE ''NO'' END LIQUIDADO,'
   +' COUNT(*) CUOTAS_PAGADAS,  SUM(NVL(A.CREMTOCOB,0)) MONTO_PAGADO FROM CRE310 A, APO201 B,'
   +' (SELECT ASOID, COUNT(*) NRO_PER FROM (SELECT A.ASOID, A.NROOPE FROM CRE310 A WHERE A.FORPAGID = ''99'' AND A.FOPERAC >= '+QuotedStr(dbdtpinicial.Text)+' AND A.FOPERAC <= '+QuotedStr(dbdtpfinal.Text)
   +' AND A.CREESTID NOT IN (''04'',''13'',''99'') AND A.NUMDEV IS NULL GROUP BY A.ASOID, A.NROOPE) GROUP BY ASOID) C, PVS306 D'
   +' WHERE A.FORPAGID = ''99'' AND A.FOPERAC >= '+QuotedStr(dbdtpinicial.Text)+' AND A.FOPERAC <= '+QuotedStr(dbdtpfinal.Text)
   +' AND A.CREESTID NOT IN (''04'',''13'',''99'') AND A.NUMDEV IS NULL AND A.ASOID = B.ASOID(+) AND A.ASOID = C.ASOID(+)'
   +' AND A.ASOID = D.ASOID(+) AND D.PVSESTLIQ(+) NOT IN (''04'',''13'') GROUP BY B.ASODNI, A.ASOCODMOD, B.ASOAPENOMDNI, C.NRO_PER,'
   +' CASE WHEN D.ASOID IS NOT NULL THEN ''SI'' ELSE ''NO'' END ORDER BY B.ASODNI, A.ASOCODMOD, B.ASOAPENOMDNI, C.NRO_PER';
   DM1.cdsReporte.Close;
   DM1.cdsReporte.DataRequest(xSql);
   DM1.cdsReporte.Open;
   Screen.Cursor := crDefault;   

   dbgreporte.DataSource := DM1.dsReporte;
   dbgreporte.Selected.Clear;
   dbgreporte.Selected.Add('ASODNI'#9'10'#9'DNI'#9#9);
   dbgreporte.Selected.Add('ASOCODMOD'#9'12'#9'Código~Modular'#9#9);
   dbgreporte.Selected.Add('ASOAPENOMDNI'#9'42'#9'Apellidos~y Nombres'#9#9);
   dbgreporte.Selected.Add('ASOAPENOMDNI'#9'42'#9'Apellidos~y Nombres'#9#9);
   dbgreporte.Selected.Add('NRO_PER'#9'10'#9'Número de~Periodos'#9#9);
   dbgreporte.Selected.Add('CUOTAS_PAGADAS'#9'10'#9'Cuotas~Pagadas'#9#9);
   dbgreporte.Selected.Add('MONTO_PAGADO'#9'12'#9'Monto~Pagado'#9#9);
   dbgreporte.Selected.Add('LIQUIDADO'#9'12'#9'Beneficio'#9#9);
   dbgreporte.ApplySelected;

   If DM1.cdsReporte.RecordCount = 0 Then
   Begin
      MessageDlg('No existe información para mostrar', mtInformation, [mbOk], 0);
      limpia;
      dbdtpinicial.SetFocus;
   End;


   If DM1.cdsReporte.RecordCount > 0 Then
   Begin
    btnimprimir.Enabled := True;
    btnaexcel.Enabled := True;
   End
   Else
   Begin
    btnimprimir.Enabled := False;
    btnaexcel.Enabled := False;
   End;

   Screen.Cursor := crDefault;

end;

procedure TFbAsoAplCCI.btnaexcelClick(Sender: TObject);
begin
   DM1.ExportaGridExcel(dbgreporte, 'PRE_DETXPAGCCI');
end;

procedure TFbAsoAplCCI.FormActivate(Sender: TObject);
begin
    btnimprimir.Enabled := False;
    btnaexcel.Enabled := False;
end;

procedure TFbAsoAplCCI.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  begin
    Key := #0;
    Perform(CM_DIALOGKEY, VK_TAB, 0);
  end;
end;

procedure TFbAsoAplCCI.btnimprimirClick(Sender: TObject);
begin

   pplfechas.Caption :=  'DEL '+dbdtpinicial.Text+' AL '+dbdtpfinal.Text;

   pplimpresopor03.Caption := 'Impreso por : '+DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
   pprRepCCI.Print;
end;

procedure TFbAsoAplCCI.limpia;
begin
  If DM1.cdsReporte.Active = True Then    DM1.cdsReporte.EmptyDataSet;
end;

end.
