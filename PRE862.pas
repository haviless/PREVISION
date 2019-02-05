// HPC_201307_PRE   : Añade imagen de nuevo logo institucional
// SPP_201401_PRE   : Se realiza el pase a producción a partir del pase HPC_201307_PRE

unit PRE862;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, wwdbdatetimepicker,
  ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, DB,
  ppBands, ppCache, ppCtrls, ppVar, ppPrnabl, DBGrids, ExtCtrls, jpeg; // SPP_201401_PRE

type
  TFRepResSex = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dbdtpinicial: TwwDBDateTimePicker;
    dbdtpfinal: TwwDBDateTimePicker;
    btnImprimePrevio: TBitBtn;
    dbgresumen: TwwDBGrid;
    btnimprimir: TBitBtn;
    btnaexcel: TBitBtn;
    btncerrar: TBitBtn;
    ppdbResExpAtxSexo: TppDBPipeline;
    ppRepResExpAtxSexo: TppReport;
    ppHeaderBand2: TppHeaderBand;
    pplblTitulo: TppLabel;
    ppShape1: TppShape;
    ppLabel3: TppLabel;
    ppShape2: TppShape;
    ppLabel4: TppLabel;
    ppShape3: TppShape;
    ppLabel5: TppLabel;
    ppShape4: TppShape;
    ppLabel6: TppLabel;
    ppShape5: TppShape;
    ppLabel7: TppLabel;
    ppShape6: TppShape;
    ppLabel8: TppLabel;
    ppShape7: TppShape;
    ppLabel9: TppLabel;
    ppShape8: TppShape;
    ppLabel10: TppLabel;
    ppShape9: TppShape;
    ppLabel11: TppLabel;
    ppShape10: TppShape;
    ppLabel12: TppLabel;
    ppShape11: TppShape;
    ppLabel14: TppLabel;
    ppShape12: TppShape;
    ppLabel15: TppLabel;
    ppShape13: TppShape;
    ppLabel17: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLabel18: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppltitulofechas: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
//Inicio: SPP_201401_PRE
    // ppLabel34: TppLabel; 
    // ppLabel35: TppLabel; 
    // ppLabel77: TppLabel; 
    // ppImage2: TppImage; 
//Fin: SPP_201401_PRE
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppLine1: TppLine;
    ppDBCalc1: TppDBCalc;
    ppLine2: TppLine;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    pplimpresopor: TppLabel;
    dtgData: TDBGrid;
    rgseleccion: TRadioGroup;
    pprresbenxdep: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppShape14: TppShape;
    ppLabel2: TppLabel;
    ppShape15: TppShape;
    ppLabel13: TppLabel;
    ppShape16: TppShape;
    ppLabel16: TppLabel;
    ppShape17: TppShape;
    ppLabel19: TppLabel;
    ppShape18: TppShape;
    ppLabel20: TppLabel;
    ppShape19: TppShape;
    ppShape20: TppShape;
    ppShape21: TppShape;
    ppLabel23: TppLabel;
    ppShape22: TppShape;
    ppShape23: TppShape;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
//Inicio: SPP_201401_PRE
    // ppLabel41: TppLabel;  
    // ppLabel42: TppLabel;  
    // ppLabel43: TppLabel;  
    // ppImage1: TppImage;  
//Fin: SPP_201401_PRE
    ppDetailBand1: TppDetailBand;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppLabel44: TppLabel;
    ppLine3: TppLine;
    ppDBCalc9: TppDBCalc;
    ppLine4: TppLine;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppLabel45: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    pprresbenxeda: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel26: TppLabel;
    ppShape24: TppShape;
    ppLabel27: TppLabel;
    ppShape25: TppShape;
    ppLabel28: TppLabel;
    ppShape26: TppShape;
    ppLabel46: TppLabel;
    ppShape27: TppShape;
    ppLabel47: TppLabel;
    ppShape28: TppShape;
    ppLabel48: TppLabel;
    ppShape29: TppShape;
    ppShape30: TppShape;
    ppShape31: TppShape;
    ppLabel49: TppLabel;
    ppShape32: TppShape;
    ppShape33: TppShape;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    ppSystemVariable9: TppSystemVariable;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
//Inicio: SPP_201401_PRE
    // ppLabel57: TppLabel;  
    // ppLabel58: TppLabel;  
    // ppLabel59: TppLabel;  
    // ppImage3: TppImage;  
//Fin: SPP_201401_PRE
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppSummaryBand3: TppSummaryBand;
    ppLabel64: TppLabel;
    ppLine5: TppLine;
    ppDBCalc15: TppDBCalc;
    ppLine6: TppLine;
    ppDBCalc16: TppDBCalc;
    ppDBCalc17: TppDBCalc;
    ppDBCalc18: TppDBCalc;
    ppDBCalc19: TppDBCalc;
    ppDBCalc20: TppDBCalc;
    ppLabel65: TppLabel;
//Inicio: SPP_201401_PRE
    ppImage2: TppImage;  
    ppImage1: TppImage;  
    ppImage3: TppImage;  
//Fin: SPP_201401_PRE
    procedure btnImprimePrevioClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbdtpfinalChange(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure btnaexcelClick(Sender: TObject);
    procedure limpiagrid;
    procedure dbdtpinicialChange(Sender: TObject);
    procedure rgseleccionClick(Sender: TObject);
  private
  public
    mascr, masci, mascf, masct, femer, femei, femef, femet :Integer;
    retcan, invcan, falcan :Integer;
    retmon, invmon, falmon :Double;

  end;

var
  FRepResSex: TFRepResSex;

implementation

uses PREDM;

{$R *.dfm}

procedure TFRepResSex.btnImprimePrevioClick(Sender: TObject);
Var xSql:String;
begin
  if trim(dbdtpinicial.text)='' then
    begin
      showmessage('Debe seleccionar la Fecha de Inicio');
      exit;
    end;
  if trim(dbdtpfinal.text)='' then
    begin
      showmessage('Debe seleccionar la Fecha de Fin');
      exit;
    end;

  Screen.Cursor := crHourGlass;
  If rgseleccion.ItemIndex = 0 Then
  Begin
    xSql := 'SELECT DPTOID, DPTODES, SUM(MASCR) MASCR,  SUM(FEMER) FEMER, SUM(MASCI) MASCI,  SUM(FEMEI) FEMEI,'
    +' SUM(MASCF) MASCF,  SUM(FEMEF) FEMEF, SUM(MASCR+MASCI+MASCF) MASCT,  SUM(FEMER+FEMEI+FEMEF) FEMET'
    +' FROM (SELECT C.DPTOID, C.DPTODES,'
    +' CASE WHEN A.PVSLTIPBE = ''01'' And B.ASOSEXO = ''M'' THEN 1 ELSE 0 END MASCR, CASE WHEN A.PVSLTIPBE = ''01'' And B.ASOSEXO = ''F'' THEN 1 ELSE 0 END FEMER,'
    +' CASE WHEN A.PVSLTIPBE = ''03'' And B.ASOSEXO = ''M'' THEN 1 ELSE 0 END MASCI, CASE WHEN A.PVSLTIPBE = ''03'' And B.ASOSEXO = ''F'' THEN 1 ELSE 0 END FEMEI,'
    +' CASE WHEN A.PVSLTIPBE = ''02'' And B.ASOSEXO = ''M'' THEN 1 ELSE 0 END MASCF, CASE WHEN A.PVSLTIPBE = ''02'' And B.ASOSEXO = ''F'' THEN 1 ELSE 0 END FEMEF'
    +' FROM PVS306 A, APO201 B, APO158 C WHERE TO_DATE(A.PVSLFECBE) >= '+QuotedStr(dbdtpinicial.Text)+' AND TO_DATE(A.PVSLFECBE) <= '+QuotedStr(dbdtpfinal.Text)
    +'AND A.PVSESTLIQ IN (''02'', ''05'', ''06'') AND A.ASOID = B.ASOID AND SUBSTR(A.ZIPID,1,2) = C.DPTOID(+)) GROUP BY DPTOID, DPTODES ORDER BY DPTODES';
    DM1.cdsReporte.Close;
    DM1.cdsReporte.DataRequest(xSql);
    DM1.cdsReporte.Open;
    dbgresumen.Selected.Clear;
    dbgresumen.Selected.Add('DPTOID'#9'6'#9'Código'#9#9);
    dbgresumen.Selected.Add('DPTODES'#9'21'#9'Descripción'#9#9);
    dbgresumen.Selected.Add('MASCR'#9'8'#9'Cant.~Ret.Mas.'#9#9);
    dbgresumen.Selected.Add('FEMER'#9'8'#9'Cant.~Ret.Fem.'#9#9);
    dbgresumen.Selected.Add('MASCI'#9'8'#9'Cant.~Inv.Mas.'#9#9);
    dbgresumen.Selected.Add('FEMEI'#9'8'#9'Cant.~Inv.Fem.'#9#9);
    dbgresumen.Selected.Add('MASCF'#9'8'#9'Cant.~Fal.Mas.'#9#9);
    dbgresumen.Selected.Add('FEMEF'#9'8'#9'Cant.~Fal.Fem.'#9#9);
    dbgresumen.Selected.Add('MASCT'#9'8'#9'Cant.~Tot.Mas.'#9#9);
    dbgresumen.Selected.Add('FEMET'#9'8'#9'Cant.~Tot.Fem.'#9#9);
    dbgresumen.ApplySelected;
    dbgresumen.DataSource := DM1.dsReporte;
    DM1.cdsReporte.First;
    mascr := 0; masci := 0; mascf := 0; masct := 0;
    femer := 0; femei := 0; femef := 0; femet := 0;
    While Not DM1.cdsReporte.Eof Do
    Begin
      mascr := mascr + DM1.cdsReporte.FieldByName('MASCR').AsInteger;
      masci := masci + DM1.cdsReporte.FieldByName('MASCI').AsInteger;
      mascf := mascf + DM1.cdsReporte.FieldByName('MASCF').AsInteger;
      masct := masct + DM1.cdsReporte.FieldByName('MASCT').AsInteger;
      femer := femer + DM1.cdsReporte.FieldByName('FEMER').AsInteger;
      femei := femei + DM1.cdsReporte.FieldByName('FEMEI').AsInteger;
      femef := femef + DM1.cdsReporte.FieldByName('FEMEF').AsInteger;
      femet := femet + DM1.cdsReporte.FieldByName('FEMET').AsInteger;
      DM1.cdsReporte.Next;
    End;
    TNumericField(DM1.cdsReporte.FieldByName('MASCR')).DisplayFormat := '##,###';
    TNumericField(DM1.cdsReporte.FieldByName('MASCI')).DisplayFormat := '##,###';
    TNumericField(DM1.cdsReporte.FieldByName('MASCF')).DisplayFormat := '##,###';
    TNumericField(DM1.cdsReporte.FieldByName('MASCT')).DisplayFormat := '##,###';
    TNumericField(DM1.cdsReporte.FieldByName('FEMER')).DisplayFormat := '##,###';
    TNumericField(DM1.cdsReporte.FieldByName('FEMEI')).DisplayFormat := '##,###';
    TNumericField(DM1.cdsReporte.FieldByName('FEMEF')).DisplayFormat := '##,###';
    TNumericField(DM1.cdsReporte.FieldByName('FEMET')).DisplayFormat := '##,###';
    dbgresumen.ColumnByName('CIUGIR').FooterValue := 'TOTALES : ';
    dbgresumen.ColumnByName('MASCR').FooterValue := FormatFloat('##,###',mascr);
    dbgresumen.ColumnByName('MASCI').FooterValue := FormatFloat('##,###',masci);
    dbgresumen.ColumnByName('MASCF').FooterValue := FormatFloat('##,###',mascf);
    dbgresumen.ColumnByName('MASCT').FooterValue := FormatFloat('##,###',masct);
    dbgresumen.ColumnByName('FEMER').FooterValue := FormatFloat('##,###',femer);
    dbgresumen.ColumnByName('FEMEI').FooterValue := FormatFloat('##,###',femei);
    dbgresumen.ColumnByName('FEMEF').FooterValue := FormatFloat('##,###',femef);
    dbgresumen.ColumnByName('FEMET').FooterValue := FormatFloat('##,###',femet);
  End;

  If rgseleccion.ItemIndex = 1 Then
  Begin
    xSql := 'SELECT CASE WHEN DPTOID  IS NULL THEN ''99'' ELSE DPTOID END DPTOID,'
    +' CASE WHEN DPTODES IS NULL THEN ''POR IDENTIFICAR'' ELSE DPTODES END DPTODES,'
    +' SUM(CAN_RET) CAN_RET, SUM(MON_RET) MON_RET, SUM(CAN_FAL) CAN_FAL, SUM(MON_FAL) MON_FAL, SUM(CAN_INV) CAN_INV, SUM(MON_INV) MON_INV FROM ('
    +' SELECT C.DPTOID, C.DPTODES,'
    +' CASE WHEN A.PVSLTIPBE = ''01'' THEN 1 ELSE 0 END CAN_RET, CASE WHEN A.PVSLTIPBE = ''01'' THEN NVL(A.MONLIQBEN,0) ELSE 0 END MON_RET,'
    +' CASE WHEN A.PVSLTIPBE = ''02'' THEN 1 ELSE 0 END CAN_FAL, CASE WHEN A.PVSLTIPBE = ''02'' THEN NVL(A.MONLIQBEN,0) ELSE 0 END MON_FAL,'
    +' CASE WHEN A.PVSLTIPBE = ''03'' THEN 1 ELSE 0 END CAN_INV, CASE WHEN A.PVSLTIPBE = ''03'' THEN NVL(A.MONLIQBEN,0) ELSE 0 END MON_INV'
    +' FROM PVS306 A, APO101 B, APO158 C'
    +' WHERE TO_DATE(A.PVSLFECBE) >= '+QuotedStr(dbdtpinicial.Text)+' AND TO_DATE(A.PVSLFECBE) <= '+QuotedStr(dbdtpfinal.Text)
    +' AND PVSESTLIQ IN (''02'', ''05'', ''06'') AND A.UPROID = B.UPROID(+) AND A.UPAGOID = B.UPAGOID(+) AND A.USEID = B.USEID(+)'
    +' AND B.DPTOID = C.DPTOID(+)) GROUP BY DPTOID, DPTODES ORDER BY DPTOID, DPTODES';
    DM1.cdsReporte.Close;
    DM1.cdsReporte.DataRequest(xSql);
    DM1.cdsReporte.Open;

    dbgresumen.Selected.Clear;
    dbgresumen.Selected.Add('DPTOID'#9'6'#9'Código'#9#9);
    dbgresumen.Selected.Add('DPTODES'#9'21'#9'Descripción'#9#9);
    dbgresumen.Selected.Add('CAN_RET'#9'8'#9'Cantidad~Retiro'#9#9);
    dbgresumen.Selected.Add('MON_RET'#9'12'#9'Monto~Retiro'#9#9);
    dbgresumen.Selected.Add('CAN_FAL'#9'8'#9'Cantidad~Fallecimiento'#9#9);
    dbgresumen.Selected.Add('MON_FAL'#9'12'#9'Monto~Fallecimiento'#9#9);
    dbgresumen.Selected.Add('CAN_INV'#9'8'#9'Cantidad~Invalidez'#9#9);
    dbgresumen.Selected.Add('MON_INV'#9'12'#9'Monto~Invalidez'#9#9);
    dbgresumen.ApplySelected;

    retcan := 0; retmon := 0; falcan := 0; falmon := 0; invcan := 0; invmon := 0;
    DM1.cdsReporte.First;
    While Not DM1.cdsReporte.Eof Do
    Begin
      retcan := retcan + DM1.cdsReporte.FieldByName('CAN_RET').AsInteger;
      falcan := falcan + DM1.cdsReporte.FieldByName('CAN_FAL').AsInteger;
      invcan := invcan + DM1.cdsReporte.FieldByName('CAN_INV').AsInteger;
      retmon := retmon + DM1.cdsReporte.FieldByName('MON_RET').AsFloat;
      falmon := falmon + DM1.cdsReporte.FieldByName('MON_FAL').AsFloat;
      invmon := invmon + DM1.cdsReporte.FieldByName('MON_INV').AsFloat;
      DM1.cdsReporte.Next;
    End;
    TNumericField(DM1.cdsReporte.FieldByName('CAN_RET')).DisplayFormat := '##,###';
    TNumericField(DM1.cdsReporte.FieldByName('CAN_FAL')).DisplayFormat := '##,###';
    TNumericField(DM1.cdsReporte.FieldByName('CAN_INV')).DisplayFormat := '##,###';
    TNumericField(DM1.cdsReporte.FieldByName('MON_RET')).DisplayFormat := '#,###,###.#0';
    TNumericField(DM1.cdsReporte.FieldByName('MON_FAL')).DisplayFormat := '#,###,###.#0';
    TNumericField(DM1.cdsReporte.FieldByName('MON_INV')).DisplayFormat := '#,###,###.#0';
    dbgresumen.ColumnByName('CAN_RET').FooterValue := FormatFloat('##,###',retcan);
    dbgresumen.ColumnByName('CAN_FAL').FooterValue := FormatFloat('##,###',falcan);
    dbgresumen.ColumnByName('CAN_INV').FooterValue := FormatFloat('##,###',invcan);
    dbgresumen.ColumnByName('MON_RET').FooterValue := FormatFloat('#,###,###.#0',retmon);
    dbgresumen.ColumnByName('MON_FAL').FooterValue := FormatFloat('#,###,###.#0',falmon);
    dbgresumen.ColumnByName('MON_INV').FooterValue := FormatFloat('#,###,###.#0',invmon);
  End;

  If rgseleccion.ItemIndex = 2 Then
  Begin
    xSql := 'SELECT CASE WHEN EDAD IS NULL THEN 0 ELSE EDAD END EDAD, SUM(CAN_RET) CAN_RET, SUM(MON_RET) MON_RET, SUM(CAN_FAL) CAN_FAL, SUM(MON_FAL) MON_FAL, SUM(CAN_INV) CAN_INV, SUM(MON_INV) MON_INV FROM'
    +' (SELECT TO_CHAR(A.ASOFRESCESE,''YYYY'')-TO_CHAR(B.ASOFECNAC,''YYYY'') EDAD,'
    +' CASE WHEN A.PVSLTIPBE = ''01'' THEN 1 ELSE 0 END CAN_RET, CASE WHEN A.PVSLTIPBE = ''01'' THEN NVL(A.MONLIQBEN,0) ELSE 0 END MON_RET,'
    +' CASE WHEN A.PVSLTIPBE = ''02'' THEN 1 ELSE 0 END CAN_FAL, CASE WHEN A.PVSLTIPBE = ''02'' THEN NVL(A.MONLIQBEN,0) ELSE 0 END MON_FAL,'
    +' CASE WHEN A.PVSLTIPBE = ''03'' THEN 1 ELSE 0 END CAN_INV, CASE WHEN A.PVSLTIPBE = ''03'' THEN NVL(A.MONLIQBEN,0) ELSE 0 END MON_INV'
    +' FROM PVS306 A, APO201 B WHERE TO_DATE(A.PVSLFECBE) >= '+QuotedStr(dbdtpinicial.Text)+' AND TO_DATE(A.PVSLFECBE) <= '+QuotedStr(dbdtpfinal.Text)
    +' AND PVSESTLIQ IN (''02'', ''05'', ''06'') AND A.ASOID = B.ASOID(+)) GROUP BY EDAD ORDER BY EDAD';
    DM1.cdsReporte.Close;
    DM1.cdsReporte.DataRequest(xSql);
    DM1.cdsReporte.Open;

    dbgresumen.Selected.Clear;
    dbgresumen.Selected.Add('EDAD'#9'7'#9'Edad'#9#9);
    dbgresumen.Selected.Add('CAN_RET'#9'8'#9'Cantidad~Retiro'#9#9);
    dbgresumen.Selected.Add('MON_RET'#9'12'#9'Monto~Retiro'#9#9);
    dbgresumen.Selected.Add('CAN_FAL'#9'8'#9'Cantidad~Fallecimiento'#9#9);
    dbgresumen.Selected.Add('MON_FAL'#9'12'#9'Monto~Fallecimiento'#9#9);
    dbgresumen.Selected.Add('CAN_INV'#9'8'#9'Cantidad~Invalidez'#9#9);
    dbgresumen.Selected.Add('MON_INV'#9'12'#9'Monto~Invalidez'#9#9);
    dbgresumen.ApplySelected;

    retcan := 0; retmon := 0; falcan := 0; falmon := 0; invcan := 0; invmon := 0;
    DM1.cdsReporte.First;
    While Not DM1.cdsReporte.Eof Do
    Begin
      retcan := retcan + DM1.cdsReporte.FieldByName('CAN_RET').AsInteger;
      falcan := falcan + DM1.cdsReporte.FieldByName('CAN_FAL').AsInteger;
      invcan := invcan + DM1.cdsReporte.FieldByName('CAN_INV').AsInteger;
      retmon := retmon + DM1.cdsReporte.FieldByName('MON_RET').AsFloat;
      falmon := falmon + DM1.cdsReporte.FieldByName('MON_FAL').AsFloat;
      invmon := invmon + DM1.cdsReporte.FieldByName('MON_INV').AsFloat;
      DM1.cdsReporte.Next;
    End;
    TNumericField(DM1.cdsReporte.FieldByName('CAN_RET')).DisplayFormat := '##,###';
    TNumericField(DM1.cdsReporte.FieldByName('CAN_FAL')).DisplayFormat := '##,###';
    TNumericField(DM1.cdsReporte.FieldByName('CAN_INV')).DisplayFormat := '##,###';
    TNumericField(DM1.cdsReporte.FieldByName('MON_RET')).DisplayFormat := '#,###,###.#0';
    TNumericField(DM1.cdsReporte.FieldByName('MON_FAL')).DisplayFormat := '#,###,###.#0';
    TNumericField(DM1.cdsReporte.FieldByName('MON_INV')).DisplayFormat := '#,###,###.#0';
    dbgresumen.ColumnByName('CAN_RET').FooterValue := FormatFloat('##,###',retcan);
    dbgresumen.ColumnByName('CAN_FAL').FooterValue := FormatFloat('##,###',falcan);
    dbgresumen.ColumnByName('CAN_INV').FooterValue := FormatFloat('##,###',invcan);
    dbgresumen.ColumnByName('MON_RET').FooterValue := FormatFloat('#,###,###.#0',retmon);
    dbgresumen.ColumnByName('MON_FAL').FooterValue := FormatFloat('#,###,###.#0',falmon);
    dbgresumen.ColumnByName('MON_INV').FooterValue := FormatFloat('#,###,###.#0',invmon);
  End;
  Screen.Cursor := crDefault;
End;

procedure TFRepResSex.btncerrarClick(Sender: TObject);
begin
  FRepResSex.Close;
end;

procedure TFRepResSex.FormActivate(Sender: TObject);
begin
  limpiagrid;
end;

procedure TFRepResSex.FormKeyPress(Sender: TObject; var Key: Char);
begin
 If Key = #13 Then
  begin
    Key := #0;
    Perform(CM_DIALOGKEY, VK_TAB, 0);
  end;
end;

procedure TFRepResSex.dbdtpfinalChange(Sender: TObject);
begin
  limpiagrid;
end;

procedure TFRepResSex.btnimprimirClick(Sender: TObject);
begin

  If rgseleccion.ItemIndex = 0 Then
  Begin
    ppltitulofechas.Caption := 'DEL '+dbdtpinicial.Text+' AL '+dbdtpfinal.Text;
    pplimpresopor.Caption := 'Impreso por : '+DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
    ppRepResExpAtxSexo.Print;
    ppRepResExpAtxSexo.Stop;
  End;

  If rgseleccion.ItemIndex = 1 Then
  Begin
    ppLabel32.Caption := 'DEL '+dbdtpinicial.Text+' AL '+dbdtpfinal.Text;
    ppLabel45.Caption := 'Impreso por : '+DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
    pprresbenxdep.Print;
    pprresbenxdep.Stop;
  End;

  If rgseleccion.ItemIndex = 2 Then
  Begin
    ppLabel53.Caption := 'DEL '+dbdtpinicial.Text+' AL '+dbdtpfinal.Text;
    ppLabel65.Caption := 'Impreso por : '+DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
    pprresbenxeda.Print;
    pprresbenxeda.Stop;
  End;

end;

procedure TFRepResSex.btnaexcelClick(Sender: TObject);
begin
  dtgData.DataSource := DM1.dsReporte;
  DM1.HojaExcel('REPORTE', DM1.dsReporte, dtgData)
end;

procedure TFRepResSex.limpiagrid;
begin
  If DM1.cdsReporte.Active Then DM1.cdsReporte.Close;
  dbgresumen.DataSource := DM1.dsReporte;
  dbgresumen.Selected.Clear;
  dbgresumen.ColumnByName('MASCR').FooterValue := FormatFloat('##,###',0);
  dbgresumen.ColumnByName('MASCI').FooterValue := FormatFloat('##,###',0);
  dbgresumen.ColumnByName('MASCF').FooterValue := FormatFloat('##,###',0);
  dbgresumen.ColumnByName('MASCT').FooterValue := FormatFloat('##,###',0);
  dbgresumen.ColumnByName('FEMER').FooterValue := FormatFloat('##,###',0);
  dbgresumen.ColumnByName('FEMEI').FooterValue := FormatFloat('##,###',0);
  dbgresumen.ColumnByName('FEMEF').FooterValue := FormatFloat('##,###',0);
  dbgresumen.ColumnByName('FEMET').FooterValue := FormatFloat('##,###',0);
  dbgresumen.ColumnByName('CAN_RET').FooterValue := FormatFloat('##,###',0);
  dbgresumen.ColumnByName('CAN_FAL').FooterValue := FormatFloat('##,###',0);
  dbgresumen.ColumnByName('CAN_INV').FooterValue := FormatFloat('##,###',0);
  dbgresumen.ColumnByName('MON_RET').FooterValue := FormatFloat('#,###,###.#0',0);
  dbgresumen.ColumnByName('MON_FAL').FooterValue := FormatFloat('#,###,###.#0',0);
  dbgresumen.ColumnByName('MON_INV').FooterValue := FormatFloat('#,###,###.#0',0);
end;

procedure TFRepResSex.dbdtpinicialChange(Sender: TObject);
begin
  limpiagrid;
end;

procedure TFRepResSex.rgseleccionClick(Sender: TObject);
begin
  limpiagrid;
end;

end.
