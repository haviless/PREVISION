// HPC_201307_PRE   : Se añade nuevo logo institucional
// SPP_201401_PRE   : Se realiza el pase a producción a partir del pase HPC_201307_PRE

unit PRE282;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, wwdblook, wwdbdatetimepicker, Mask, ExtCtrls,
  Grids, Wwdbigrd, Wwdbgrid, ppProd, ppClass, ppReport, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE, ppBands, ppCache, DB, DBClient, ppCtrls, ppVar,
  ppPrnabl, DBGrids, ppParameter, jpeg; // SPP_201401_PRE

type
  TFrepxtipbenxocu = class(TForm)
    GroupBox1: TGroupBox;
    dbdtpinicial: TwwDBDateTimePicker;
    dbdtpfinal: TwwDBDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    btnimprimir: TBitBtn;
    btnaexcel: TBitBtn;
    btncerrar: TBitBtn;
    btnImprimePrevio: TBitBtn;
    dbgliqben: TwwDBGrid;
    ppdbpocuben: TppDBPipeline;
    pprbenocu: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
//Inicio: SPP_201401_PRE
    // ppImage1: TppImage; 
    // ppLabel121: TppLabel; 
    // ppLabel122: TppLabel; 
    // ppLabel123: TppLabel; 
//Fin: SPP_201401_PRE
    ppltitdpt01: TppLabel;
    pplfechas: TppLabel;
    ppLabel118: TppLabel;
    ppLabel79: TppLabel;
    ppLabel81: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppShape39: TppShape;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppLabel1: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppShape7: TppShape;
    ppShape8: TppShape;
    ppShape9: TppShape;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppShape10: TppShape;
    ppShape11: TppShape;
    ppShape12: TppShape;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppLabel14: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    DBGrid: TDBGrid;
    ppImage1: TppImage;  // SPP_201401_PRE
    procedure FormActivate(Sender: TObject);
    procedure dblctipbenChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btncerrarClick(Sender: TObject);
    procedure btnImprimePrevioClick(Sender: TObject);
//    procedure dblcdptoidChange(Sender: TObject);
    procedure btnaexcelClick(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure dbdtpinicialChange(Sender: TObject);
    procedure dbdtpfinalChange(Sender: TObject);
    procedure dbdtpinicialExit(Sender: TObject);
    procedure dbdtpfinalExit(Sender: TObject);
  private
    xSql, xfecini, xfecfin :String;
    monben, ajuben, imppag: Double;
    canret, monret, canfal, monfal, caninv, moninv, cantot, montot : Double;
    { Private declarations }
  public
    procedure limpia;
    { Public declarations }
  end;

var
  Frepxtipbenxocu: TFrepxtipbenxocu;

implementation

uses PREDM, PRE238;

{$R *.dfm}

procedure TFrepxtipbenxocu.FormActivate(Sender: TObject);
Var xSql:String;
begin
  {
  xSql := 'SELECT DPTOID, DPTODES FROM APO158';
  DM1.cdsDpto.Close;
  DM1.cdsDpto.DataRequest(xSql);
  DM1.cdsDpto.Open;
  dblcdptoid.Selected.Clear;
  dblcdptoid.Selected.Add('DPTOID'#9'2'#9'Código'#9#9);
  dblcdptoid.Selected.Add('DPTODES'#9'25'#9'Nombre del departamento'#9#9);
  }


  {
  xSql := 'SELECT TIPBENEF, BENEFDES FROM TGE186 WHERE TIPBENEF IN (''01'',''02'',''03'')';
  DM1.cdsTipBenef.Close;
  DM1.cdsTipBenef.DataRequest(xSql);
  DM1.cdsTipBenef.Open;
  dblctipben.Selected.Clear;
  dblctipben.Selected.Add('TIPBENEF'#9'2'#9'Código'#9#9);
  dblctipben.Selected.Add('BENEFDES'#9'25'#9'Tipo de beneficio'#9#9);
  dbdtpinicial.Date := DM1.FechaSys;
  dbdtpfinal.Date   := DM1.FechaSys;

  }

  dbdtpinicial.SetFocus;

end;

procedure TFrepxtipbenxocu.dblctipbenChange(Sender: TObject);
begin
  {
  limpia;
  If dblctipben.Text = '' Then metipbenef.Text := '';
  If Length(dblctipben.Text) = 2 then
  Begin
    If DM1.cdsTipBenef.Locate('TIPBENEF', dblctipben.Text, []) Then
    Begin
      metipbenef.Text := DM1.cdsTipBenef.FieldByName('BENEFDES').AsString;
    End
    Else
    Begin
      MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
      dblctipben.Text := '';
      metipbenef.Text := '';
      dblctipben.SetFocus;
    End;
  End;
  }
end;

procedure TFrepxtipbenxocu.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  begin
    Key := #0;
    Perform(CM_DIALOGKEY, VK_TAB, 0);
  end;
end;

procedure TFrepxtipbenxocu.btncerrarClick(Sender: TObject);
begin
  Frepxtipbenxocu.Close;
end;

Procedure TFrepxtipbenxocu.btnImprimePrevioClick(Sender: TObject);
Begin
  If dbdtpInicial.Text = '' Then
  Begin
    MessageDlg('Ingrese la fecha inicial', mtInformation, [mbOk], 0);
    dbdtpInicial.SetFocus;
    Exit;
  End;
  If dbdtpFinal.Text = '' Then
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

  xSql := 'SELECT ANOCESE, SUM(NVL(CANRET,0)) CANRET, SUM(NVL(SUMRET,0)) SUMRET, SUM(NVL(CANFAL,0)) CANFAL, SUM(NVL(SUMFAL,0)) SUMFAL, SUM(NVL(CANINV,0)) CANINV,'
  +' SUM(NVL(SUMINV,0)) SUMINV, SUM(NVL(CANTOT,0)) CANTOT, SUM(NVL(SUMTOT,0)) SUMTOT FROM (SELECT ANOCESE, SUM(NVL(CANRET,0)) CANRET,  SUM(NVL(MONRET,0)) SUMRET,'
  +' SUM(NVL(CANFAL,0)) CANFAL,  SUM(NVL(MONFAL,0)) SUMFAL, SUM(NVL(CANINV,0)) CANINV,  SUM(NVL(MONINV,0)) SUMINV, SUM(NVL(CANRET,0)+NVL(CANINV,0)+NVL(CANFAL,0)) CANTOT,'
  +' SUM(NVL(MONRET,0)+NVL(MONINV,0)+NVL(MONFAL,0)) SUMTOT  FROM (SELECT TO_CHAR(ASOFRESCESE, ''YYYY'') ANOCESE, CASE WHEN PVSLTIPBE = ''01'' THEN 1 ELSE 0 END CANRET,'
  +' CASE WHEN PVSLTIPBE = ''01'' THEN MONLIQBEN ELSE 0 END MONRET, CASE WHEN PVSLTIPBE = ''02'' THEN 1 ELSE 0 END CANFAL, CASE WHEN PVSLTIPBE = ''02'' THEN MONLIQBEN ELSE 0 END MONFAL,'
  +' CASE WHEN PVSLTIPBE = ''03'' THEN 1 ELSE 0 END CANINV, CASE WHEN PVSLTIPBE = ''03'' THEN MONLIQBEN ELSE 0 END MONINV FROM PVS306 WHERE PVSESTLIQ IN (''02'', ''05'', ''06'') AND'
  +' PVSLFECBE >= '+QuotedStr(dbdtpinicial.Text)+' AND PVSLFECBE <= '+QuotedStr(dbdtpfinal.Text)+') GROUP BY ANOCESE';
  xSql := xSql + ' UNION ALL';
  xSql := xSql + ' SELECT ANOCESE, SUM(NVL(CANRET,0)) CANRET, SUM(NVL(MONRET,0)) SUMRET, SUM(NVL(CANFAL,0)) CANFAL, SUM(NVL(MONFAL,0)) SUMFAL, SUM(NVL(CANINV,0)) CANINV,'
  +' SUM(NVL(MONINV,0)) SUMINV, SUM(NVL(CANRET,0)+NVL(CANINV,0)+NVL(CANFAL,0)) CANTOT, SUM(NVL(MONRET,0)+NVL(MONINV,0)+NVL(MONFAL,0)) SUMTOT FROM (SELECT TO_CHAR(FEC_CAL, ''YYYY'')'
  +' ANOCESE, CASE WHEN COD_BEN = ''01'' THEN 1 ELSE 0 END CANRET, CASE WHEN COD_BEN = ''01'' THEN TO_NUMBER(BENEFIC,''99999.99'') ELSE 0 END MONRET, CASE WHEN COD_BEN = ''02'''
  +' THEN 1 ELSE 0 END CANFAL, CASE WHEN COD_BEN = ''02'' THEN TO_NUMBER(BENEFIC,''99999.99'') ELSE 0 END MONFAL, CASE WHEN COD_BEN = ''03'' THEN 1 ELSE 0 END CANINV, CASE WHEN COD_BEN = ''03'''
  //Inicio: SPP_201401_PRE
  // +' THEN TO_NUMBER(BENEFIC,''99999.99'') ELSE 0 END MONINV FROM PRE_CAB_BEN_2000 WHERE NVL(ANULADO, ''X'') <> ''T'' AND FEC_EXP >= '+QuotedStr(dbdtpinicial.Text)+' AND FEC_EXP <= '+QuotedStr(dbdtpfinal.Text)+')' // SPP_201401_PRE
  +' THEN TO_NUMBER(BENEFIC,''99999.99'') ELSE 0 END MONINV FROM PVS315 WHERE NVL(ANULADO, ''X'') <> ''T'' AND FEC_EXP >= '+QuotedStr(dbdtpinicial.Text)+' AND FEC_EXP <= '+QuotedStr(dbdtpfinal.Text)+')'
  //Fin: SPP_201401_PRE
  +' GROUP BY ANOCESE) GROUP BY ANOCESE ORDER BY ANOCESE';
  DM1.cdsReporte.Close;
  DM1.cdsReporte.DataRequest(xSql);
  DM1.cdsReporte.Open;

  DM1.cdsReporte.First;
  canret := 0; monret := 0; caninv := 0; moninv := 0;
  monben := 0; ajuben := 0; imppag := 0; canfal := 0; monfal := 0;
  cantot := 0; montot := 0;
  While Not DM1.cdsReporte.Eof Do
  Begin
    canret := canret + DM1.cdsReporte.FieldByName('CANRET').AsFloat;
    monret := monret + DM1.cdsReporte.FieldByName('SUMRET').AsFloat;
    canfal := canfal + DM1.cdsReporte.FieldByName('CANFAL').AsFloat;
    monfal := monfal + DM1.cdsReporte.FieldByName('SUMFAL').AsFloat;
    caninv := caninv + DM1.cdsReporte.FieldByName('CANINV').AsFloat;
    moninv := moninv + DM1.cdsReporte.FieldByName('SUMINV').AsFloat;
    cantot := cantot + DM1.cdsReporte.FieldByName('CANTOT').AsFloat;
    montot := montot + DM1.cdsReporte.FieldByName('SUMTOT').AsFloat;
    DM1.cdsReporte.Next;
  End;
  dbgliqben.Selected.Clear;
  dbgliqben.Selected.Add('ANOCESE'#9'8'#9'Año de~Cese'#9#9);
  dbgliqben.Selected.Add('CANRET'#9'9'#9'Cant.Exp~Retiro'#9#9);
  dbgliqben.Selected.Add('SUMRET'#9'13'#9'Mont.Exp~Retiro'#9#9);
  dbgliqben.Selected.Add('CANINV'#9'9'#9'Cant.Exp.~Invalidez'#9#9);
  dbgliqben.Selected.Add('SUMINV'#9'13'#9'Mont.Exp.~Invalidez'#9#9);
  dbgliqben.Selected.Add('CANFAL'#9'9'#9'Cant.Exp.~Fallecimiento'#9#9);
  dbgliqben.Selected.Add('SUMFAL'#9'13'#9'Mont.Exp.~Fallecimiento'#9#9);
  dbgliqben.Selected.Add('CANTOT'#9'9'#9'Cantidad~Total'#9#9);
  dbgliqben.Selected.Add('SUMTOT'#9'13'#9'Monto~Total'#9#9);
  dbgliqben.ApplySelected;
  TNumericField(DM1.cdsReporte.FieldByName('CANRET')).DisplayFormat := '###,##0';
  TNumericField(DM1.cdsReporte.FieldByName('SUMRET')).DisplayFormat := '###,###,##0.00';
  TNumericField(DM1.cdsReporte.FieldByName('CANINV')).DisplayFormat := '###,##0';
  TNumericField(DM1.cdsReporte.FieldByName('SUMINV')).DisplayFormat := '###,###,##0.00';
  TNumericField(DM1.cdsReporte.FieldByName('CANFAL')).DisplayFormat := '###,##0';
  TNumericField(DM1.cdsReporte.FieldByName('SUMFAL')).DisplayFormat := '###,###,##0.00';
  TNumericField(DM1.cdsReporte.FieldByName('CANTOT')).DisplayFormat := '###,##0';
  TNumericField(DM1.cdsReporte.FieldByName('SUMTOT')).DisplayFormat := '###,###,##0.00';
  dbgliqben.ColumnByName('ANOCESE').FooterValue := 'TOTALES : ';
  dbgliqben.ColumnByName('CANRET').FooterValue := FormatFloat('###,###0',canret);
  dbgliqben.ColumnByName('SUMRET').FooterValue := FormatFloat('###,###.#0',monret);
  dbgliqben.ColumnByName('CANINV').FooterValue := FormatFloat('###,###0',caninv);
  dbgliqben.ColumnByName('SUMINV').FooterValue := FormatFloat('###,###.#0',moninv);
  dbgliqben.ColumnByName('CANFAL').FooterValue := FormatFloat('###,###0',canfal);
  dbgliqben.ColumnByName('SUMFAL').FooterValue := FormatFloat('###,###.#0',monfal);
  dbgliqben.ColumnByName('CANTOT').FooterValue := FormatFloat('###,###0',cantot);
  dbgliqben.ColumnByName('SUMTOT').FooterValue := FormatFloat('###,###.#0',montot);
  Screen.Cursor := crDefault;
End;

{
procedure TFrepxtipbenxocu.dblcdptoidChange(Sender: TObject);
begin
  limpia;
  If dblcdptoid.Text = '' Then medesdpto.Text := '';
  If Length(dblcdptoid.Text) = 2 then
  Begin
    If DM1.cdsDpto.Locate('DPTOID', dblcdptoid.Text, []) Then
    Begin
      medesdpto.Text := DM1.cdsDpto.FieldByName('DPTODES').AsString;
    End
    Else
    Begin
      MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
      dblcdptoid.Text := '';
      medesdpto.Text := '';
      dblctipben.SetFocus;
    End;
  End;
end;
}

procedure TFrepxtipbenxocu.btnaexcelClick(Sender: TObject);
begin
  DM1.HojaExcel('REPORTE', DM1.dsReporte, DBGrid);
end;

procedure TFrepxtipbenxocu.btnimprimirClick(Sender: TObject);
begin
  pplfechas.Caption := 'EXPEDIENTES GENERADOS DEL '+dbdtpinicial.Text+' AL '+dbdtpfinal.Text;
  ppLabel15.Caption := 'Impreso por : '+DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
  pprbenocu.Print;
  pprbenocu.Stop;
end;

procedure TFrepxtipbenxocu.limpia;
begin
  If DM1.cdsReporte.Active = True Then
  Begin
    dbgliqben.ColumnByName('CANRET').FooterValue := FormatFloat('###,###0',0);
    dbgliqben.ColumnByName('SUMRET').FooterValue := FormatFloat('###,###.#0',0);
    dbgliqben.ColumnByName('CANINV').FooterValue := FormatFloat('###,###0',0);
    dbgliqben.ColumnByName('SUMINV').FooterValue := FormatFloat('###,###.#0',0);
    dbgliqben.ColumnByName('CANFAL').FooterValue := FormatFloat('###,###0',0);
    dbgliqben.ColumnByName('SUMFAL').FooterValue := FormatFloat('###,###.#0',0);
    dbgliqben.ColumnByName('CANTOT').FooterValue := FormatFloat('###,###0',0);
    dbgliqben.ColumnByName('SUMTOT').FooterValue := FormatFloat('###,###.#0',0);
    DM1.cdsReporte.EmptyDataSet;
  End;
end;

procedure TFrepxtipbenxocu.dbdtpinicialChange(Sender: TObject);
begin
  limpia;
end;

procedure TFrepxtipbenxocu.dbdtpfinalChange(Sender: TObject);
begin
 limpia;
end;

procedure TFrepxtipbenxocu.dbdtpinicialExit(Sender: TObject);
begin
 If (dbdtpinicial.Date < StrToDate('01/01/2000')) And (Trim(dbdtpinicial.Text) <> '') Then
 Begin
   MessageDlg('La fecha inicial no puede ser menor al 01/01/2000', mtInformation, [mbOk], 0);
   dbdtpinicial.SetFocus;
   Exit;
 End;
end;

procedure TFrepxtipbenxocu.dbdtpfinalExit(Sender: TObject);
begin
 If dbdtpfinal.Date > date Then
 Begin
   MessageDlg('La fecha final no puede ser mayor a la actual', mtInformation, [mbOk], 0);
   dbdtpfinal.SetFocus;
   Exit;
 End;
end;

end.
