// Inicio Uso Estándares: 01/08/2011
// Unidad               : PRE939
// Formulario           : FresliqconCADAPS
// Fecha de Creación    : 16/07/2014
// Autor                : Area de desarrollo de sistemas.
// Objetivo             : Resumen de liquidaciones con CADAPS
//
// Actualizaciones      :
// HPC_201402           : Nueva opción (Reporte resumen de liquidaciones con/sin cadap)
// Autor                : Isaac Revilla C.
// Fecha                : 09/07/2014
// SPP_201403_PRE       : Se realiza el pase a producción a partir del pase HPC_201402_PRE.


unit PRE939;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Wwdbigrd, Wwdbgrid, ppDB, ppDBPipe, ppDBBDE, ppParameter,
  ppCtrls, ppBands, jpeg, ppVar, ppPrnabl, ppClass, ppCache, ppComm,
  ppRelatv, ppProd, ppReport, Grids, DBGrids, StdCtrls, Buttons,
  wwdbdatetimepicker, db;

type
  TFresliqconCADAPS = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dbdtpinicial: TwwDBDateTimePicker;
    dbdtpfinal: TwwDBDateTimePicker;
    btnprocesar: TBitBtn;
    pprreporte: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppShape3: TppShape;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppShape2: TppShape;
    ppLabel4: TppLabel;
    ppShape13: TppShape;
    ppLabel14: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppLabel22: TppLabel;
    ppltitulo02: TppLabel;
    ppImage1: TppImage;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel23: TppLabel;
    pplimpresopor: TppLabel;
    ppParameterList1: TppParameterList;
    ppbdereporte: TppBDEPipeline;
    dbgPrevio: TwwDBGrid;
    btnimprimir: TBitBtn;
    btnaexcel: TBitBtn;
    btnsalir: TBitBtn;
    ppShape14: TppShape;
    ppLabel13: TppLabel;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppLabel2: TppLabel;
    ppLabel5: TppLabel;
    ppShape6: TppShape;
    ppLabel6: TppLabel;
    ppShape7: TppShape;
    ppLabel7: TppLabel;
    ppShape8: TppShape;
    ppShape9: TppShape;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppShape10: TppShape;
    ppLabel10: TppLabel;
    ppShape11: TppShape;
    ppLabel11: TppLabel;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppShape12: TppShape;
    ppLabel12: TppLabel;
    ppDBText8: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    procedure btnprocesarClick(Sender: TObject);
    procedure btnaexcelClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnsalirClick(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
  procedure limpiagrid;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FresliqconCADAPS: TFresliqconCADAPS;

implementation

uses PREDM;

{$R *.dfm}

procedure TFresliqconCADAPS.btnprocesarClick(Sender: TObject);
Var xSql:String;
    xRetConAut, xRetSinAut, xRetTotal:Double;
    xFalConAut, xFalSinAut, xFalTotal:Double;
    xInvConAut, xInvSinAut, xInvTotal:Double;
    xTotal: Double;
begin
   xSql := 'SELECT ANOMES, MES, SUM(NVL(RET_CON_AUT,0)) RET_CON_AUT, SUM(NVL(RET_SIN_AUT,0)) RET_SIN_AUT, SUM(NVL(RET_CON_AUT,0)+NVL(RET_SIN_AUT,0)) RETIRO,'
   +' SUM(NVL(FAL_CON_AUT,0)) FAL_CON_AUT, SUM(NVL(FAL_SIN_AUT,0)) FAL_SIN_AUT, SUM(NVL(FAL_CON_AUT,0)+NVL(FAL_SIN_AUT,0)) FALLECIMIENTO, SUM(NVL(INV_CON_AUT,0)) INV_CON_AUT,'
   +' SUM(NVL(INV_SIN_AUT,0)) INV_SIN_AUT, SUM(NVL(INV_CON_AUT,0)+NVL(INV_SIN_AUT,0)) INVALIDEZ,'
   +' SUM(NVL(RET_CON_AUT,0)+NVL(RET_SIN_AUT,0)+NVL(FAL_CON_AUT,0)+NVL(FAL_SIN_AUT,0)+NVL(INV_CON_AUT,0)+NVL(INV_SIN_AUT,0)) TOTAL'
   +' FROM (SELECT TO_CHAR(PVSLFECBE,''YYYYMM'') ANOMES, TO_CHAR(PVSLFECBE,''MONTH'') MES,'
   +' CASE WHEN PVSLTIPBE = ''01'' AND NVL(AUTDESAPO,''N'') = ''S'' THEN 1 ELSE 0 END RET_CON_AUT,'
   +' CASE WHEN PVSLTIPBE = ''01'' AND NVL(AUTDESAPO,''N'') = ''N'' THEN 1 ELSE 0 END RET_SIN_AUT,'
   +' CASE WHEN PVSLTIPBE IN (''02'',''04'',''05'') AND NVL(AUTDESAPO,''N'') = ''S'' THEN 1 ELSE 0 END FAL_CON_AUT,'
   +' CASE WHEN PVSLTIPBE IN (''02'',''04'',''05'') AND NVL(AUTDESAPO,''N'') = ''N'' THEN 1 ELSE 0 END FAL_SIN_AUT,'
   +' CASE WHEN PVSLTIPBE = ''03'' AND NVL(AUTDESAPO,''N'') = ''S'' THEN 1 ELSE 0 END INV_CON_AUT,'
   +' CASE WHEN PVSLTIPBE = ''03'' AND NVL(AUTDESAPO,''N'') = ''N'' THEN 1 ELSE 0 END INV_SIN_AUT'
   +' FROM PVS306 WHERE PVSLFECBE >= '+QuotedStr(dbdtpinicial.Text)+' AND PVSLFECBE <= '+QuotedStr(dbdtpfinal.Text)
   +' AND PVSESTLIQ NOT IN (''04'',''13'')) GROUP BY ANOMES, MES ORDER BY ANOMES, MES';
   DM1.cdsReporte.Close;
   DM1.cdsReporte.DataRequest(xSql);
   DM1.cdsReporte.Open;
   If DM1.cdsReporte.RecordCount = 0 Then
   Begin
      limpiagrid;
      MessageDlg('No existe información para mostrar', mtCustom, [mbOk], 0);
      btnprocesar.SetFocus;
      Exit;
   End;
   xRetConAut := 0; xRetSinAut := 0; xRetTotal  := 0;
   xFalConAut := 0; xFalSinAut := 0; xFalTotal  := 0;
   xInvConAut := 0; xInvSinAut := 0; xInvTotal  := 0;
   xTotal     := 0;
   DM1.cdsReporte.First;
   While Not DM1.cdsReporte.Eof Do
   Begin
     xRetConAut := xRetConAut + DM1.cdsReporte.FieldByName('RET_CON_AUT').AsFloat;
     xRetSinAut := xRetSinAut + DM1.cdsReporte.FieldByName('RET_SIN_AUT').AsFloat;
     xRetTotal  := xRetTotal  + DM1.cdsReporte.FieldByName('RETIRO').AsFloat;
     xFalConAut := xFalConAut + DM1.cdsReporte.FieldByName('FAL_CON_AUT').AsFloat;
     xFalSinAut := xFalSinAut + DM1.cdsReporte.FieldByName('FAL_SIN_AUT').AsFloat;
     xFalTotal  := xFalTotal  + DM1.cdsReporte.FieldByName('FALLECIMIENTO').AsFloat;
     xInvConAut := xInvConAut + DM1.cdsReporte.FieldByName('INV_CON_AUT').AsFloat;
     xInvSinAut := xInvSinAut + DM1.cdsReporte.FieldByName('INV_CON_AUT').AsFloat;
     xInvTotal  := xInvTotal  + DM1.cdsReporte.FieldByName('INVALIDEZ').AsFloat;
     xTotal     := xTotal     + DM1.cdsReporte.FieldByName('TOTAL').AsFloat;
     DM1.cdsReporte.Next;
   End;

   btnaexcel.Enabled   := True;
   btnimprimir.Enabled := True;

   dbgPrevio.Selected.Clear;
   dbgPrevio.Selected.Add('MES'#9'10'#9'Mes'#9#9);
   dbgPrevio.Selected.Add('RET_CON_AUT'#9'8'#9'Con~Autorización'#9'F'#9'Retiro');
   dbgPrevio.Selected.Add('RET_SIN_AUT'#9'8'#9'Sin~Autorización'#9'F'#9'Retiro');
   dbgPrevio.Selected.Add('RETIRO'#9'8'#9'Total'#9'F'#9'Retiro');
   dbgPrevio.Selected.Add('FAL_CON_AUT'#9'8'#9'Con~Autorización'#9'F'#9'Fallecimiento');
   dbgPrevio.Selected.Add('FAL_SIN_AUT'#9'8'#9'Sin~Autorización'#9'F'#9'Fallecimiento');
   dbgPrevio.Selected.Add('FALLECIMIENTO'#9'8'#9'Total'#9'F'#9'Fallecimiento');
   dbgPrevio.Selected.Add('INV_CON_AUT'#9'8'#9'Con~Autorización'#9'F'#9'Invalidez');
   dbgPrevio.Selected.Add('INV_SIN_AUT'#9'8'#9'Sin~Autorización'#9'F'#9'Invalidez');
   dbgPrevio.Selected.Add('INVALIDEZ'#9'8'#9'Total'#9'F'#9'Invalidez');
   dbgPrevio.Selected.Add('TOTAL'#9'12'#9'Total'#9#9);
   dbgPrevio.ApplySelected;
   TNumericField(DM1.cdsReporte.FieldByName('RET_CON_AUT')).DisplayFormat   := '###,##0';
   TNumericField(DM1.cdsReporte.FieldByName('RET_SIN_AUT')).DisplayFormat   := '###,##0';
   TNumericField(DM1.cdsReporte.FieldByName('RETIRO')).DisplayFormat        := '###,##0';
   TNumericField(DM1.cdsReporte.FieldByName('FAL_CON_AUT')).DisplayFormat   := '###,##0';
   TNumericField(DM1.cdsReporte.FieldByName('FAL_SIN_AUT')).DisplayFormat   := '###,##0';
   TNumericField(DM1.cdsReporte.FieldByName('FALLECIMIENTO')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsReporte.FieldByName('INV_CON_AUT')).DisplayFormat   := '###,##0';
   TNumericField(DM1.cdsReporte.FieldByName('INV_SIN_AUT')).DisplayFormat   := '###,##0';
   TNumericField(DM1.cdsReporte.FieldByName('INVALIDEZ')).DisplayFormat     := '###,##0';
   TNumericField(DM1.cdsReporte.FieldByName('TOTAL')).DisplayFormat         := '###,##0';
   dbgPrevio.ColumnByName('MES').FooterValue := 'Total S/.';
   dbgPrevio.ColumnByName('RET_CON_AUT').FooterValue := FormatFloat('###,##0',xRetConAut);
   dbgPrevio.ColumnByName('RET_SIN_AUT').FooterValue := FormatFloat('###,##0',xRetSinAut);
   dbgPrevio.ColumnByName('RETIRO').FooterValue := FormatFloat('###,##0',xRetTotal);
   dbgPrevio.ColumnByName('FAL_CON_AUT').FooterValue := FormatFloat('###,##0',xFalConAut);
   dbgPrevio.ColumnByName('FAL_SIN_AUT').FooterValue := FormatFloat('###,##0',xFalSinAut);
   dbgPrevio.ColumnByName('FALLECIMIENTO').FooterValue := FormatFloat('###,##0',xFalTotal);
   dbgPrevio.ColumnByName('INV_CON_AUT').FooterValue := FormatFloat('###,##0',xInvConAut);
   dbgPrevio.ColumnByName('INV_SIN_AUT').FooterValue := FormatFloat('###,##0',xInvSinAut);
   dbgPrevio.ColumnByName('INVALIDEZ').FooterValue := FormatFloat('###,##0',xInvTotal);
   dbgPrevio.ColumnByName('TOTAL').FooterValue := FormatFloat('###,##0',xTotal);
end;   

procedure TFresliqconCADAPS.limpiagrid;
begin
  If DM1.cdsReporte.Active = True Then DM1.cdsReporte.Close;
  btnimprimir.Enabled := False;
  btnaexcel.Enabled   := False;
  dbgPrevio.Selected.Clear;
end;

procedure TFresliqconCADAPS.btnaexcelClick(Sender: TObject);
begin
  DM1.ExportaGridExcel(dbgPrevio, 'PRE_RESLIQ_CADAPS');
end;

procedure TFresliqconCADAPS.FormKeyPress(Sender: TObject; var Key: Char);
begin
 If Key = #13 Then
  begin
    Key := #0;
    Perform(CM_DIALOGKEY, VK_TAB, 0);
  end;
end;

procedure TFresliqconCADAPS.btnsalirClick(Sender: TObject);
begin
   FresliqconCADAPS.Close;
end;

procedure TFresliqconCADAPS.btnimprimirClick(Sender: TObject);
begin
   ppltitulo02.Caption := 'DEL '+dbdtpinicial.Text+' AL '+dbdtpfinal.Text;
   pplimpresopor.Caption := 'Usuario : '+DM1.wUsuario;
   pprreporte.Print;
end;

procedure TFresliqconCADAPS.FormActivate(Sender: TObject);
begin
   btnimprimir.Enabled := False;
   btnaexcel.Enabled   := False;
   DM1.cdsReporte.Close;
   dbgPrevio.Selected.Clear;
end;

end.
