// HPC_201307_PRE   : Añade imagen del nuevo logo institucional
// SPP_201401_PRE   : Se realiza el pase a producción a partir del pase HPC_201307_PRE

unit PRE928;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, wwdbdatetimepicker, ppCtrls, ppBands,
  ppClass, ppVar, ppPrnabl, ppCache, ppProd, ppReport, ppDB, ppComm,
  ppRelatv, ppDBPipe, ExtCtrls, ppParameter, Grids, Wwdbigrd, Wwdbgrid, DBGrids, DB, jpeg;  // SPP_201401_PRE

type
  TFNivApo = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dbdtpInicial: TwwDBDateTimePicker;
    dbdtpFinal: TwwDBDateTimePicker;
    ppdbRepNivelaciones: TppDBPipeline;
    ppRepNivelaciones: TppReport;
    ppTitleBand1: TppTitleBand;
    pplblTitulo: TppLabel;
    ppShape9: TppShape;
    ppShape8: TppShape;
    ppShape6: TppShape;
    ppShape5: TppShape;
    ppShape4: TppShape;
    ppShape3: TppShape;
    ppShape2: TppShape;
    ppShape1: TppShape;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel1: TppLabel;
    ppShape7: TppShape;
    ppLabel2: TppLabel;
    ppDetailBand11: TppDetailBand;
    ppdbAsoCodMod: TppDBText;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc1: TppDBCalc;
    ppLabel6: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine12: TppLine;
    ppltitulo02: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel22: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    pplimppor: TppLabel;
    ppltotal: TppLabel;
    rgtipo: TRadioGroup;
    ppdbRepDevol: TppDBPipeline;
    ppRepDevoluciones: TppReport;
    ppParameterList1: TppParameterList;
    ppTitleBand2: TppTitleBand;
    ppLabel3: TppLabel;
    ppShape10: TppShape;
    ppShape11: TppShape;
    ppShape12: TppShape;
    ppShape13: TppShape;
    ppShape14: TppShape;
    ppShape15: TppShape;
    ppShape16: TppShape;
    ppShape17: TppShape;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppShape18: TppShape;
    ppLabel15: TppLabel;
    ppltitulo03: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppDetailBand2: TppDetailBand;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppDBCalc2: TppDBCalc;
    ppLabel29: TppLabel;
    pplimppor01: TppLabel;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppldevmto: TppLabel;
    ppLine1: TppLine;
    dbgnivapo: TwwDBGrid;
    btnimprimir: TBitBtn;
    btnaexcel: TBitBtn;
    btncerrar: TBitBtn;
    BitBtn1: TBitBtn;
    dtgData: TDBGrid;
//Inicio: SPP_201401_PRE
    // ppLabel121: TppLabel;  
    // ppLabel122: TppLabel;  
    // ppLabel123: TppLabel;  
//Fin: SPP_201401_PRE
    ppImage1: TppImage;
//Inicio: SPP_201401_PRE
    // ppLabel16: TppLabel;  
    // ppLabel17: TppLabel;  
    // ppLabel18: TppLabel;  
//Fin: SPP_201401_PRE
    ppImage2: TppImage;
    procedure btnImprimePrevioClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ppDetailBand11BeforePrint(Sender: TObject);
    procedure ppGroupFooterBand1BeforePrint(Sender: TObject);
    procedure ppDetailBand2BeforePrint(Sender: TObject);
    procedure ppGroupFooterBand2BeforePrint(Sender: TObject);
    procedure ppGroupFooterBand3BeforePrint(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure rgtipoClick(Sender: TObject);
    procedure btnaexcelClick(Sender: TObject);
    procedure dbdtpInicialChange(Sender: TObject);
    procedure dbdtpFinalChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    monniv, mondev :Double;
    procedure limpia;
  public
    { Public declarations }
    xtotniv :real;
  end;

var
  FNivApo: TFNivApo;

implementation

uses PREDM;

{$R *.dfm}

procedure TFNivApo.btnImprimePrevioClick(Sender: TObject);
Var xSql :String;
begin
  xtotniv := 0;
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
  If rgtipo.ItemIndex = -1 Then
  Begin
    MessageDlg('Seleccione el tipo de reporte', mtInformation, [mbOk], 0);
    dbdtpInicial.SetFocus;
    Exit;
  End;
  If rgtipo.ItemIndex = 0 Then
  Begin
    Screen.Cursor := crHourGlass;
    xSql := 'SELECT A.PVSLFECBE, A.ASOCODMOD, E.DPTODES, A.ASOAPENOMDNI, A.PVSLBENNR, A.PVSLFECBE, B.TRANSANO, B.TRANSMES, B.TRANSMTO, 0.00 TOTAL'
    +' FROM PVS306 A, APO301 B, APO201 C, APO101 D, APO158 E'
    +' WHERE   A.PVSESTLIQ IN (''02'',''05'', ''06'')'
    +' AND TO_DATE(A.PVSLFECBE) >= '+QuotedStr(dbdtpInicial.Text)+' AND TO_DATE(A.PVSLFECBE) <= '+QuotedStr(dbdtpFinal.Text)
    +' AND  A.ASOID = C.ASOID'
    +' AND C.USEID =  D.USEID(+) AND C.UPAGOID = D.UPAGOID(+) AND C.UPROID = D.UPROID(+)'
    +' AND D.DPTOID = E.DPTOID(+) AND A.ASOID = B.ASOID AND A.PVSLBENNR = B.TRANSNOPE  AND A.PVSLFECBE = B.TRANSFOPE'
    +' ORDER BY A.PVSLFECBE, A.ASOAPENOMDNI, B.TRANSANO, B.TRANSMES';
    DM1.cdsReporte.Close;
    DM1.cdsReporte.DataRequest(xSql);
    DM1.cdsReporte.Open;
    xSql := 'SELECT A.PVSLBENNR, A.PVSLFECBE, E.DPTODES,  A.ASOCODMOD, A.ASOAPENOMDNI, SUM(NVL(B.TRANSMTO,0)) TRANSMTO'
    +' FROM PVS306 A, APO301 B, APO201 C, APO101 D, APO158 E WHERE A.PVSESTLIQ IN (''02'',''05'', ''06'')'
    +' AND TO_DATE(A.PVSLFECBE) >= '+QuotedStr(dbdtpInicial.Text)+' AND TO_DATE(A.PVSLFECBE) <= '+QuotedStr(dbdtpFinal.Text)
    +' AND A.ASOID = C.ASOID(+) AND C.USEID =  D.USEID(+) AND C.UPAGOID = D.UPAGOID(+) AND C.UPROID = D.UPROID(+) AND D.DPTOID = E.DPTOID(+)'
    +' AND A.ASOID = B.ASOID(+) AND A.PVSLBENNR = B.TRANSNOPE AND A.PVSLFECBE = B.TRANSFOPE'
    +' GROUP BY A.PVSLBENNR, A.PVSLFECBE, A.ASOCODMOD, E.DPTODES, A.ASOAPENOMDNI, A.PVSLBENNR, A.PVSLFECBE'
    +' ORDER BY A.PVSLFECBE, A.ASOAPENOMDNI';
    DM1.cdsQry2.Close;
    DM1.cdsQry2.DataRequest(xSql);
    DM1.cdsQry2.Open;
    DM1.cdsQry2.First;
    monniv := 0;
    While Not DM1.cdsQry2.Eof Do
    Begin
      monniv := monniv + DM1.cdsQry2.FieldByname('TRANSMTO').AsFloat;
      DM1.cdsQry2.Next;
    End;
    dbgnivapo.DataSource := DM1.dsReporte;
    dbgnivapo.Selected.Clear;
    dbgnivapo.Selected.Add('PVSLBENNR'#9'11'#9'Número de la~Liquidación'#9#9);
    dbgnivapo.Selected.Add('PVSLFECBE'#9'10'#9'Fecha de la~Liquidación'#9#9);
    dbgnivapo.Selected.Add('DPTODES'#9'18'#9'Departamento~de Origen'#9#9);
    dbgnivapo.Selected.Add('ASOCODMOD'#9'10'#9'Código~Modular'#9#9);
    dbgnivapo.Selected.Add('ASOAPENOMDNI'#9'50'#9'Apellidos~y Nombre(s)'#9#9);
    dbgnivapo.Selected.Add('TRANSMTO'#9'10'#9'Monto de~la Nivelación'#9#9);
    dbgnivapo.ApplySelected;
    TNumericField(DM1.cdsQry2.FieldByName('TRANSMTO')).DisplayFormat := '###,###,##0.00';
    dbgnivapo.ColumnByName('ASOAPENOMDNI').FooterValue := 'TOTAL NIVELACION :';
    dbgnivapo.ColumnByName('TRANSMTO').FooterValue := FormatFloat('###,###.#0',monniv);
    Screen.Cursor := crDefault;
  End;
  If rgtipo.ItemIndex = 1 Then
  Begin
    Screen.Cursor := crHourGlass;
    xSql := 'SELECT A.PVSLFECBE, A.ASOCODMOD, E.DPTODES, A.ASOAPENOMDNI, A.PVSLBENNR, A.PVSLFECBE,'
    +' B.APOANO , B.APOMES , B.DEVMTO , 0.00 TOTAL'
    +' FROM PVS306 A, APO305 B, APO201 C, APO101 D, APO158 E'
    +' WHERE   A.PVSESTLIQ IN (''02'',''05'', ''06'') AND TO_DATE(A.PVSLFECBE) >= '+QuotedStr(dbdtpInicial.Text)+' AND TO_DATE(A.PVSLFECBE) <= '+QuotedStr(dbdtpFinal.Text)+' AND  A.ASOID = C.ASOID AND C.USEID =  D.USEID(+)'
    +' AND C.UPAGOID = D.UPAGOID(+) AND C.UPROID = D.UPROID(+) AND D.DPTOID = E.DPTOID(+)'
    +' AND A.ASOID = B.ASOID AND A.PVSLBENNR = B.TRANSNOPE  AND A.PVSLFECBE = B.TRANSFOPE'
    +' ORDER BY A.PVSLFECBE, A.ASOAPENOMDNI, B.APOANO, B.APOMES';
    DM1.cdsReporte.Close;
    DM1.cdsReporte.DataRequest(xSql);
    DM1.cdsReporte.Open;

    xSql := 'SELECT A.PVSLBENNR, A.PVSLFECBE, E.DPTODES, A.ASOCODMOD, A.ASOAPENOMDNI,  SUM(NVL(B.DEVMTO,0)) DEVMTO'
    +' FROM PVS306 A, APO305 B, APO201 C, APO101 D, APO158 E WHERE A.PVSESTLIQ IN (''02'',''05'', ''06'')'
    +' AND TO_DATE(A.PVSLFECBE) >= '+QuotedStr(dbdtpInicial.Text)+' AND TO_DATE(A.PVSLFECBE) <= '+QuotedStr(dbdtpFinal.Text)+' AND  A.ASOID = C.ASOID(+)'
    +' AND C.USEID =  D.USEID(+) AND C.UPAGOID = D.UPAGOID(+) AND C.UPROID = D.UPROID(+)'
    +' AND D.DPTOID = E.DPTOID(+) AND A.ASOID = B.ASOID AND A.PVSLBENNR = B.TRANSNOPE  AND A.PVSLFECBE = B.TRANSFOPE'
    +' GROUP BY A.PVSLBENNR, A.PVSLFECBE, E.DPTODES, A.ASOCODMOD, A.ASOAPENOMDNI'
    +' ORDER BY A.PVSLFECBE, A.ASOAPENOMDNI';
    DM1.cdsQry2.Close;
    DM1.cdsQry2.DataRequest(xSql);
    DM1.cdsQry2.Open;
    DM1.cdsQry2.First;
    mondev := 0;
    While Not DM1.cdsQry2.Eof Do
    Begin
      mondev := mondev + DM1.cdsQry2.FieldByname('DEVMTO').AsFloat;
      DM1.cdsQry2.Next;
    End;
    dbgnivapo.DataSource := DM1.dsReporte;
    dbgnivapo.Selected.Clear;
    dbgnivapo.Selected.Add('PVSLBENNR'#9'11'#9'Número de la~Liquidación'#9#9);
    dbgnivapo.Selected.Add('PVSLFECBE'#9'10'#9'Fecha de la~Liquidación'#9#9);
    dbgnivapo.Selected.Add('DPTODES'#9'18'#9'Departamento~de Origen'#9#9);
    dbgnivapo.Selected.Add('ASOCODMOD'#9'10'#9'Código~Modular'#9#9);
    dbgnivapo.Selected.Add('ASOAPENOMDNI'#9'50'#9'Apellidos~y Nombre(s)'#9#9);
    dbgnivapo.Selected.Add('DEVMTO'#9'10'#9'Monto de~la Devolución'#9#9);
    dbgnivapo.ApplySelected;
    TNumericField(DM1.cdsQry2.FieldByName('DEVMTO')).DisplayFormat := '###,###,##0.00';
    dbgnivapo.ColumnByName('ASOAPENOMDNI').FooterValue := 'TOTAL DEVOLUCION :';
    dbgnivapo.ColumnByName('DEVMTO').FooterValue := FormatFloat('###,###.#0',mondev);
    Screen.Cursor := crDefault;
  End;
end;

procedure TFNivApo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  begin
    Key := #0;
    Perform(CM_DIALOGKEY, VK_TAB, 0);
  end;
end;

procedure TFNivApo.ppDetailBand11BeforePrint(Sender: TObject);
begin
  xtotniv:= xtotniv + DM1.cdsReporte.FieldByName('TRANSMTO').AsFloat;
end;

procedure TFNivApo.ppGroupFooterBand1BeforePrint(Sender: TObject);
begin
  ppltotal.Caption :=  FloatToStrF(xtotniv, ffNumber,15,2);
  xtotniv := 0;
end;

procedure TFNivApo.ppDetailBand2BeforePrint(Sender: TObject);
begin
  xtotniv:= xtotniv + DM1.cdsReporte.FieldByName('DEVMTO').AsFloat;
end;

procedure TFNivApo.ppGroupFooterBand2BeforePrint(Sender: TObject);
begin
  xtotniv := 0;
end;

procedure TFNivApo.ppGroupFooterBand3BeforePrint(Sender: TObject);
begin
  ppldevmto.Caption := FloatToStrF(xtotniv, ffNumber,15,2);
  xtotniv := 0;
end;

procedure TFNivApo.btncerrarClick(Sender: TObject);
begin
  FNivApo.Close;
end;

Procedure TFNivApo.btnimprimirClick(Sender: TObject);
Begin
  If rgtipo.ItemIndex = 0 Then
  Begin
    pplimppor.Caption := 'IMPRESO POR : '+ UpperCase(DM1.DevuelveValor('USERTABLE', 'USERNOM', 'USERID', DM1.wUsuario ));
    ppltitulo02.Caption := 'DEL '+dbdtpInicial.Text+' AL '+dbdtpFinal.Text;
    ppRepNivelaciones.Print
  End
  Else
  Begin
    pplimppor01.Caption := 'IMPRESO POR : '+ UpperCase(DM1.DevuelveValor('USERTABLE', 'USERNOM', 'USERID', DM1.wUsuario ));
    ppltitulo03.Caption := 'DEL '+dbdtpInicial.Text+' AL '+dbdtpFinal.Text;
    ppRepDevoluciones.Print;
  End;
End;

procedure TFNivApo.rgtipoClick(Sender: TObject);
begin
  limpia;
  If rgtipo.ItemIndex = 0 Then
  Begin
    FNivApo.Caption := 'NIVELACIONES DE APORTES';
    dbgnivapo.ColumnByName('ASOAPENOMDNI').FooterValue := 'TOTAL NIVELACION :';
  End
  Else
  Begin
    FNivApo.Caption := 'DEVOLUCIONES DE APORTES';
    dbgnivapo.ColumnByName('ASOAPENOMDNI').FooterValue := 'TOTAL DEVOLUCIONES :';
  End;
end;

procedure TFNivApo.btnaexcelClick(Sender: TObject);
begin
  dtgData.DataSource := DM1.dsQry2;
  If rgtipo.ItemIndex = 0 Then
    DM1.HojaExcel('REPORTE', DM1.dsQry2 , dtgData)
  Else
    DM1.HojaExcel('REPORTE', DM1.dsQry2, dtgData)
end;

procedure TFNivApo.dbdtpInicialChange(Sender: TObject);
begin
  limpia;
end;

procedure TFNivApo.dbdtpFinalChange(Sender: TObject);
begin
  limpia;
end;

procedure TFNivApo.limpia;
begin
  If DM1.cdsQry2.Active = True    Then DM1.cdsQry2.EmptyDataSet;
  If DM1.cdsReporte.Active = True Then DM1.cdsReporte.EmptyDataSet;
  dbgnivapo.ColumnByName('DEVMTO').FooterValue := FormatFloat('###,###.#0',0);
  dbgnivapo.ColumnByName('TRANSMTO').FooterValue := FormatFloat('###,###.#0',0);
  //dbgnivapo.Selected.Clear;
  //dbgnivapo.ApplySelected;
  dbgnivapo.Refresh;
end;

procedure TFNivApo.FormActivate(Sender: TObject);
begin
  If DM1.cdsQry2.Active = True Then DM1.cdsQry2.EmptyDataSet;
end;

end.
