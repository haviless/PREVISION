// Inicio Uso Estándares: 01/08/2011
// Unidad : PRE271 (Créditos pendientes despúes del beneficio)
// Formulario : Frepcrepen
// Fecha de Creación : 15/12/2003
// Autor : Area de desarrollo de Sistemas
// Objetivo : Reporte de Creditos pendientes despues de beneficio
// Actualizaciones:
// HPC_200312_PRE 99/99/9999 (Creación del programa)
// HPC_201112_PRE - 27/09/2011 (Se añade las cuotas bloqueadas "19" al reporte, Se retira el estado reprogramado "31")
// HPP_201108_PRE - 28/11/2011 (a partir del HPC_201112_PRE)
// HPC_201307_PRE : Se añade logo logo institucional
// SPP_201401_PRE : Se realiza el pase a producción a partir del pase HPC_201307_PRE
// HPC_201503_PRE   : Se añade a la consulta lo recuperado por el FSC con saldo >0
// HPC_201709_PRE : Se modifica proceso de tal manera que la información se muestre por
//                  liquidación y no por numero de credito 

unit PRE271;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGrids, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons,
  wwdbdatetimepicker, db, Mask, ExtCtrls, wwdblook, Wwdbdlg, ppProd,
  ppClass, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppBands,
  // Inicio: HPC_201709_PRE 
  // Se añade unidad
  // ppCache, ppCtrls, ppVar, ppPrnabl, ppStrtch, ppSubRpt, jpeg;  // SPP_201401_PRE
  ppCache, ppCtrls, ppVar, ppPrnabl, ppStrtch, ppSubRpt, jpeg, ppParameter;  // SPP_201401_PRE
  // Fin: HPC_201709_PRE
  
type
  TFrepcrepen = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dbdtpInicial: TwwDBDateTimePicker;
    dbdtpFinal: TwwDBDateTimePicker;
    btnPrevio: TBitBtn;
    dbgcuonocob: TwwDBGrid;
    btnImprime: TBitBtn;
    btnaexcel: TBitBtn;
    btncerrar: TBitBtn;
    DBGrid: TDBGrid;
    Label3: TLabel;
    dblcdptoid: TwwDBLookupComboDlg;
    pnldesdep: TPanel;
    medesdep: TMaskEdit;
    bdepreporte: TppBDEPipeline;
    ppreporte: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
//Inicio: SPP_201401_PRE
    // ppImage1: TppImage; 
    // ppLabel121: TppLabel; 
    // ppLabel122: TppLabel; 
    // ppLabel123: TppLabel; 
//Fin: SPP_201401_PRE
    ppltitdpt01: TppLabel;
    ppltitfec: TppLabel;
    ppLabel118: TppLabel;
    ppLabel79: TppLabel;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppLabel98: TppLabel;
    ppLabel97: TppLabel;
    ppLabel85: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    ppSystemVariable9: TppSystemVariable;
    ppltitdep: TppLabel;
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
    ppLabel7: TppLabel;
    ppShape7: TppShape;
    ppLabel8: TppLabel;
    ppShape8: TppShape;
    ppLabel9: TppLabel;
    ppShape9: TppShape;
    ppLabel10: TppLabel;
    ppShape10: TppShape;
    ppLabel11: TppLabel;
    ppShape11: TppShape;
    ppLabel12: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    // Inicio: HPC_201709_PRE
    // Se retiran variables no usadas 
    // ppDBText1: TppDBText;
    // ppGroup1: TppGroup;
    // ppGroupHeaderBand1: TppGroupHeaderBand;
    // ppGroupFooterBand1: TppGroupFooterBand;
    // ppDBCalc1: TppDBCalc;
    // ppDBCalc2: TppDBCalc;
    // ppDBCalc3: TppDBCalc;
    // ppLabel13: TppLabel;
    // ppLine1: TppLine;
    // ppDBCalc7: TppDBCalc;
    // ppLabel14: TppLabel;
    // Fin: HPC_201709_PRE
    ppLabel15: TppLabel;
    // Inicio: HPC_201709_PRE
    // Se retiran variables no usadas 
    // ppLine1: TppLine;
    // ppDBCalc7: TppDBCalc;
    // ppLabel14: TppLabel;
    // Fin: HPC_201709_PRE
    ppLine2: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    // Inicio: HPC_201709_PRE
    // Se retiran variables no usadas
    // ppShape12: TppShape;
    // ppLabel1: TppLabel;
    // ppLabel16: TppLabel;
    // ppLabel17: TppLabel;
    // ppLabel18: TppLabel;
    // ppLine3: TppLine;
    // ppShape13: TppShape;
    // ppShape14: TppShape;
    // ppLabel19: TppLabel;
    // ppLabel20: TppLabel;
    // ppLabel21: TppLabel;
    // ppLabel22: TppLabel;
    // ppLine4: TppLine;
    // ppLabel23: TppLabel;
    // pplimpresopor: TppLabel;
    // Se añade etiquetas para mostrar la información del filtro
    Label4: TLabel;
    dblctipben: TwwDBLookupComboDlg;
    Panel1: TPanel;
    metipbenef: TMaskEdit;
    Label5: TLabel;
    Panel2: TPanel;
    medesuse: TMaskEdit;
    dblcduseid: TwwDBLookupComboDlg;
    ppImage1: TppImage;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    dbgAExcel: TDBGrid;
    ppLabel66: TppLabel;
    ppDBCalc13: TppDBCalc;
    ppLine8: TppLine;
    ppLabel67: TppLabel;
    ppDBText24: TppDBText;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppDetailBand3: TppDetailBand;
    ppShape29: TppShape;
    ppShape30: TppShape;
    ppShape31: TppShape;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLine9: TppLine;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel75: TppLabel;
    ppLine10: TppLine;
    ppLabel76: TppLabel;
    // Fin: HPC_201709_PRE
    pplc19990: TppLabel;
    pplc20530: TppLabel;
    pplcafp: TppLabel;
    pplcotros: TppLabel;
    pplctotal: TppLabel;
    pplm19990: TppLabel;
    pplm20530: TppLabel;
    pplmafp: TppLabel;
    pplmotros: TppLabel;
    pplmtotal: TppLabel;

    // Inicio: HPC_201709_PRE
    // Se retiran variables no usadas
    // Label4: TLabel;
    // dblctipben: TwwDBLookupComboDlg;
    // Panel1: TPanel;
    // metipbenef: TMaskEdit;
    // Label5: TLabel;
    // Panel2: TPanel;
    // medesuse: TMaskEdit;
    // dblcduseid: TwwDBLookupComboDlg;
    // ppImage1: TppImage; // SPP_201401_PRE
    // Se añaden variables no usadas
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    pplimpresopor: TppLabel; // SPP_201401_PRE
    // Fin: HPC_201709_PRE
    procedure btnPrevioClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure dblcdptoidChange(Sender: TObject);
    procedure btnImprimeClick(Sender: TObject);
    procedure btnaexcelClick(Sender: TObject);
    procedure dblctipbenChange(Sender: TObject);
    procedure limpia;
    procedure dblcduseidChange(Sender: TObject);
  private
    // Inicio: HPC_201709_PRE
    // Variables para Qrys
    xSql, xSqlAExcel:String;
    // Fin: HPC_201709_PRE
   c19990, c20530, cafp, cotros :Double;
   m19990, m20530, mafp, motros :Double;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frepcrepen: TFrepcrepen;

implementation

uses PREDM;

{$R *.dfm}

Procedure TFrepcrepen.btnPrevioClick(Sender: TObject);
  // Inicio: HPC_201709_PRE 
  // Se crea la variable monantliq (monto antes del beneficio)
  // moncob, monfal, monnocob:Double;
Var  monantliq, moncob, monnocob:Double;
  // Fin: HPC_201709_PRE
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
  // Inicio: HPC_201709_PRE
  // Se modifica Qry que procesar información de de creditos pendientes de pago despues de la liquidación
  // xSql := 'SELECT C.BENEFABR, A.PVSLFECBE, SUBSTR(A.PVSLBENNR,5,7) PVSLBENNR, A.ASOCODMOD, F.USENOM,  A.ASODNI,'
  // +' A.ASOAPENOMDNI, H.REGPENABR, B.CREDID, B.PVSLMONTO, I.PVSLMONTO NOCOB,'
  // +' SUM(NVL(E.CREMTO,0)-NVL(E.CREMTOCOB,0)) FALTA'
  // +' FROM PVS306 A, PVS307 B, TGE186 C, CRE301 D, CRE302 E, APO101 F, APO201 G, APO105 H, PVS307 I'
  // +' WHERE A.PVSLFECBE >= '+QuotedStr(dbdtpInicial.Text)+' AND A.PVSLFECBE <= '+QuotedStr(dbdtpFinal.Text)
  // +' AND A.PVSESTLIQ IN (''02'',''05'', ''06'') AND A.PVSLBENNR = B.PVSLBENNR AND A.ASOID = G.ASOID AND B.CREDID IS NOT NULL AND A.PVSLTIPBE = C.TIPBENEF AND A.ASOID = D.ASOID'
  // // Inicio: HPP_201108_PRE
  // //+' AND B.CREDID = D.CREDID AND D.CREESTID = ''02'' AND A.ASOID = E.ASOID AND G.REGPENID = H.REGPENID(+) AND B.CREDID = E.CREDID AND E.CREESTID IN (''02'', ''11'', ''27'', ''31'')'
  // +' AND B.CREDID = D.CREDID AND D.CREESTID = ''02'' AND A.ASOID = E.ASOID AND G.REGPENID = H.REGPENID(+) AND B.CREDID = E.CREDID AND E.CREESTID IN (''02'', ''11'', ''19'', ''27'')'
  // // Fin: HPP_201108_PRE
  // +' AND A.UPROID = F.UPROID AND A.UPAGOID = F.UPAGOID AND A.USEID = F.USEID AND A.PVSLBENNR = I.PVSLBENNR AND SUBSTR(I.PVSLCONCE,1,5) = ''SALDO'' AND NVL(I.PVSLMONTO,0) > 0';
  // If dblcdptoid.Text <> '' Then xSql := xSql +' AND F.DPTOID = '+QuotedStr(dblcdptoid.Text);
  // If dblcduseid.Text <> '' Then xSql := xSql +' AND F.USEID = '+QuotedStr(dblcduseid.Text);
  // If dblctipben.Text <> '' Then xSql := xSql +' AND A.PVSLTIPBE = '+QuotedStr(dblctipben.Text);
  // // Inicio HPC_201503_PRE   : Se añade a la consulta lo recuperado por el FSC con saldo >0
  // //xSql := xSql  + ' GROUP BY C.BENEFABR, A.PVSLFECBE, SUBSTR(A.PVSLBENNR,5,7), A.ASOCODMOD, F.USENOM,  A.ASODNI, A.ASOAPENOMDNI, H.REGPENABR, B.CREDID, B.PVSLMONTO, I.PVSLMONTO ORDER BY C.BENEFABR';
  // xSql := xSql  + ' GROUP BY C.BENEFABR, A.PVSLFECBE, SUBSTR(A.PVSLBENNR,5,7), A.ASOCODMOD, F.USENOM,  A.ASODNI, A.ASOAPENOMDNI, H.REGPENABR, B.CREDID, B.PVSLMONTO, I.PVSLMONTO';
  // xSql:=xSql  + ' union all '
  // +'SELECT C.BENEFABR, A.PVSLFECBE, SUBSTR(A.PVSLBENNR, 5, 7) PVSLBENNR, A.ASOCODMOD, F.USENOM, A.ASODNI, A.ASOAPENOMDNI, H.REGPENABR, '
  // +     '''FSC-''||A.PVSLBENNR CREDID, '
  // +     'B.PVSLMONTO, 0 NOCOB, MAX(IMP_SAL_FSC) FALTA '
  // +  'FROM PVS306 A, PVS307 B, TGE186 C, '
  // +      ' cob_fsc_pagos_al_fsc d, cob_fsc_deuda_fsc_cab e, '
  // +      ' APO101 F, APO201 G, APO105 H '
  // + 'WHERE A.PVSLFECBE >= '+QuotedStr(dbdtpInicial.Text)+' AND A.PVSLFECBE <= '+QuotedStr(dbdtpFinal.Text)
  // +  ' AND A.PVSESTLIQ IN (''02'', ''05'', ''06'') '
  // +  ' AND A.PVSLBENNR = B.PVSLBENNR and B.pvslagrid=''DSC'' AND B.TIPDES=''F''  AND B.CREDID IS NULL '
  // +  ' AND A.PVSLTIPBE = C.TIPBENEF '
  // +  ' and A.ASOID=d.ASOID and a.PVSLBENNR=d.NROOPE and a.PVSLFECBE=d.FOPERAC '
  // +  ' and d.num_deu=e.num_deu(+) '
  // +  ' AND A.UPROID = F.UPROID   AND A.UPAGOID = F.UPAGOID   AND A.USEID = F.USEID '
  // +  ' AND A.ASOID = G.ASOID '
  // +  ' AND G.REGPENID = H.REGPENID(+) '
  // +  ' and IMP_SAL_FSC>0 ';
  Screen.Cursor := crHourGlass;
  xSql := 'SELECT C.BENEFDES DESCRIP_BENEFICIO, A.PVSLFECBE FECHA_BENEFICIO, A.PVSLBENNR NUMERO_LIQUIDACION, A.ASOCODMOD CODIGO_MODULAR,'
  +' E.USENOM UNIDAD_GESTION_ASOCIADO, D.ASODNI DNI_ASOCIADO, D.ASOAPENOMDNI APELLIDOS_Y_NOMBRES_ASOCIADO, B.CREDID NUMERO_CREDITO,'
  +' NVL(B.SALCREANTLIQ,0) SALDO_CREDITO_ANTES_LIQUID, NVL(B.PVSLSALDO,0) MONTO_DESC_CREDITO, NVL(B.SALCREANTLIQ,0)-NVL(B.PVSLSALDO,0) MONTO_NO_COBRADO_CREDITO, F.REGPENABR REGIMEN_PENSION'
  +' FROM PVS306 A, PVS307 B, TGE186 C, APO201 D, APO101 E, APO105 F'
  +' WHERE A.PVSLFECBE >= '+QuotedStr(dbdtpInicial.Text)+' AND A.PVSLFECBE <= '+QuotedStr(dbdtpFinal.Text)
  +' AND A.PVSESTLIQ NOT IN (''04'',''13'') AND A.PVSLTIPBE = C.TIPBENEF AND A.PVSLBENNR = B.PVSLBENNR AND B.CREDID IS NOT NULL'
  +' AND A.ASOID = D.ASOID AND D.UPROID = E.UPROID AND D.UPAGOID = E.UPAGOID AND D.USEID = E.USEID'
  +' AND NVL(B.SALCREANTLIQ,0)-NVL(B.PVSLSALDO,0) > 0 AND D.REGPENID = F.REGPENID';
  If dblcdptoid.Text <> '' Then xSql := xSql +' AND E.DPTOID = '+QuotedStr(dblcdptoid.Text);
  If dblcduseid.Text <> '' Then xSql := xSql +' AND E.USEID = '+QuotedStr(dblcduseid.Text);
  If dblctipben.Text <> '' Then xSql := xSql +' AND A.PVSLTIPBE = '+QuotedStr(dblctipben.Text);
  xSql := xSql + ' ORDER BY C.BENEFDES';
  // xSql := xSql
  // + 'GROUP BY a.asoid, C.BENEFABR, A.PVSLFECBE, A.PVSLBENNR, A.ASOCODMOD, F.USENOM, A.ASODNI, '
  // +          'A.ASOAPENOMDNI, H.REGPENABR, B.PVSLMONTO '
  // + 'ORDER BY BENEFABR, CREDID ';
  // // Fin  HPC_201503_PRE   : Se añade a la consulta lo recuperado por el FSC con saldo >0
  xSqlAExcel := xSql;
  // Fin: HPC_201709_PRE
  DM1.cdsReporte.Close;
  DM1.cdsReporte.DataRequest(xSql);
  DM1.cdsReporte.Open;
  DM1.cdsReporte.First;
  // Inicio: HPC_201709_PRE
  // Se inicializa la variable monto antes de la liquidación
  monantliq := 0;
  // moncob   := 0; monfal   := 0; monnocob := 0; c19990   := 0; c20530   := 0; cafp     := 0;
  moncob   := 0; monnocob := 0; c19990   := 0; c20530   := 0; cafp     := 0;
  // Fin: HPC_201709_PRE
  cotros   := 0; m19990   := 0; m20530   := 0; mafp     := 0; motros   := 0;
  While Not DM1.cdsReporte.Eof Do
  Begin
    // Inicio: HPC_201709_PRE
    // Calcula los nuevos montos para los totales del reporte
    // moncob   := moncob   + DM1.cdsReporte.FieldByName('PVSLMONTO').AsFloat;
    // monfal   := monfal   + DM1.cdsReporte.FieldByName('FALTA').AsFloat;
    monantliq := monantliq + DM1.cdsReporte.FieldByName('SALDO_CREDITO_ANTES_LIQUID').AsFloat;
    moncob    := moncob    + DM1.cdsReporte.FieldByName('MONTO_DESC_CREDITO').AsFloat;
    monnocob := monnocob + DM1.cdsReporte.FieldByName('MONTO_NO_COBRADO_CREDITO').AsFloat;
    // monfal   := monfal   + DM1.cdsReporte.FieldByName('NOCOB').AsFloat;
    If Trim(DM1.cdsReporte.FieldByName('REGIMEN_PENSION').AsString) = '20530' Then
    Begin
      // m20530 := m20530 + DM1.cdsReporte.FieldByName('FALTA').AsFloat;
      m20530 := m20530 + DM1.cdsReporte.FieldByName('MONTO_NO_COBRADO_CREDITO').AsFloat;
      c20530 := c20530 + 1;
    End;
    If Trim(DM1.cdsReporte.FieldByName('REGIMEN_PENSION').AsString) = '19990' Then
    Begin
      // m19990 := m19990 + DM1.cdsReporte.FieldByName('FALTA').AsFloat;
      m19990 := m19990 + DM1.cdsReporte.FieldByName('MONTO_NO_COBRADO_CREDITO').AsFloat;
      c19990 := c19990 + 1;
    End;
    If Trim(DM1.cdsReporte.FieldByName('REGIMEN_PENSION').AsString) = 'AFP' Then
    Begin
      // mafp := mafp + DM1.cdsReporte.FieldByName('FALTA').AsFloat;
      mafp := mafp + DM1.cdsReporte.FieldByName('MONTO_NO_COBRADO_CREDITO').AsFloat;
      cafp := cafp + 1;
    End;
    If (Trim(DM1.cdsReporte.FieldByName('REGIMEN_PENSION').AsString) <> 'AFP') And
       (Trim(DM1.cdsReporte.FieldByName('REGIMEN_PENSION').AsString) <> '20530') And
       (Trim(DM1.cdsReporte.FieldByName('REGIMEN_PENSION').AsString) <> '19990') Then
    Begin
      motros := motros + DM1.cdsReporte.FieldByName('MONTO_NO_COBRADO_CREDITO').AsFloat;
      cotros := cotros + 1;
    End;
    DM1.cdsReporte.Next;
  End;
  Screen.Cursor := crDefault;
  // Fin: HPC_201709_PRE
  DM1.cdsReporte.First;
// Inicio   HPC_201503_PRE   : Se añade a la consulta lo recuperado por el FSC con saldo >0
  dbgcuonocob.Selected.Clear;
  dbgcuonocob.Selected.Add('DESCRIP_BENEFICIO'#9'13'#9'Tipo de~beneficio'#9#9);
  dbgcuonocob.Selected.Add('FECHA_BENEFICIO'#9'10'#9'Fecha de~Beneficio'#9#9);
  dbgcuonocob.Selected.Add('NUMERO_LIQUIDACION'#9'11'#9'Número de~Beneficio'#9#9);
  dbgcuonocob.Selected.Add('CODIGO_MODULAR'#9'10'#9'Código~Modular'#9#9);
  dbgcuonocob.Selected.Add('UNIDAD_GESTION_ASOCIADO'#9'30'#9'Descripción de UGEL'#9#9);
  dbgcuonocob.Selected.Add('DNI_ASOCIADO'#9'10'#9'DNI del~Asociado'#9#9);
  dbgcuonocob.Selected.Add('APELLIDOS_Y_NOMBRES_ASOCIADO'#9'45'#9'Apellidos y Nombre(s)~del asociado'#9#9);
  dbgcuonocob.Selected.Add('REGIMEN_PENSION'#9'15'#9'Regimen de~pensión'#9#9);
  dbgcuonocob.Selected.Add('NUMERO_CREDITO'#9'15'#9'Número del~Crédito'#9#9);
  // Inicio: HPC_201709_PRE
  // Se modifican las columnas a mostrar en el grid
  // dbgcuonocob.Selected.Add('PVSLMONTO'#9'12'#9'Monto~aplicado'#9#9);
  // dbgcuonocob.Selected.Add('NOCOB'#9'12'#9'Monto~no aplicado'#9#9);
  // dbgcuonocob.Selected.Add('FALTA'#9'12'#9'Saldo~actual'#9#9);
  dbgcuonocob.Selected.Add('SALDO_CREDITO_ANTES_LIQUID'#9'12'#9'Saldo antes~liquidación'#9#9);
  dbgcuonocob.Selected.Add('MONTO_DESC_CREDITO'#9'12'#9'Monto~aplicado'#9#9);
  dbgcuonocob.Selected.Add('MONTO_NO_COBRADO_CREDITO'#9'12'#9'Saldo después~de la liquidación'#9#9);
  dbgcuonocob.ApplySelected;
  // TNumericField(DM1.cdsReporte.FieldByName('PVSLMONTO')).DisplayFormat := '###,###,##0.00';
  TNumericField(DM1.cdsReporte.FieldByName('SALDO_CREDITO_ANTES_LIQUID')).DisplayFormat := '###,###,##0.00';
  TNumericField(DM1.cdsReporte.FieldByName('MONTO_DESC_CREDITO')).DisplayFormat := '###,###,##0.00';
  TNumericField(DM1.cdsReporte.FieldByName('MONTO_NO_COBRADO_CREDITO')).DisplayFormat := '###,###,##0.00';
  // TNumericField(DM1.cdsReporte.FieldByName('FALTA')).DisplayFormat := '###,###,##0.00';
  // dbgcuonocob.ColumnByName('PVSLMONTO').FooterValue := FormatFloat('###,###.#0', moncob) ;
  dbgcuonocob.ColumnByName('SALDO_CREDITO_ANTES_LIQUID').FooterValue := FormatFloat('###,###.#0', monantliq);
  dbgcuonocob.ColumnByName('MONTO_DESC_CREDITO').FooterValue := FormatFloat('###,###.#0', moncob);
  dbgcuonocob.ColumnByName('MONTO_NO_COBRADO_CREDITO').FooterValue := FormatFloat('###,###.#0', monnocob);
  // dbgcuonocob.ColumnByName('FALTA').FooterValue := FormatFloat('###,###.#0', monfal);
  dbgcuonocob.ColumnByName('NUMERO_CREDITO').FooterValue := 'Total : S/.';
  // Fin: HPC_201709_PRE
// Fin  HPC_201503_PRE   : Se añade a la consulta lo recuperado por el FSC con saldo >0

  If DM1.cdsReporte.RecordCount > 0 Then
  Begin
    btnImprime.Enabled := True;
    btnaexcel.Enabled := True;
  End
  Else
  Begin
    btnImprime.Enabled := False;
    btnaexcel.Enabled := False;
  End;
End;

procedure TFrepcrepen.btncerrarClick(Sender: TObject);
begin
  Frepcrepen.Close;
end;

procedure TFrepcrepen.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  begin
    Key := #0;
    Perform(CM_DIALOGKEY, VK_TAB, 0);
  end;
end;

procedure TFrepcrepen.FormActivate(Sender: TObject);
// Inicio: HPC_201709_PRE
// Se retira variable local. Se envia al private  
// Var xSql:String;
// Fin: HPC_201709_PRE
begin
  dblcduseid.Enabled := False;
  btnImprime.Enabled  := False;
  btnaexcel.Enabled  := False;

  If DM1.cdsReporte.Active = True Then
  Begin
   DM1.cdsReporte.Close;
   dbgcuonocob.Refresh;
  End;

  xSql := 'SELECT DPTOID, DPTODES FROM APO158';
  DM1.cdsDpto.Close;
  DM1.cdsDpto.DataRequest(xSql);
  DM1.cdsDpto.Open;
  dblcdptoid.Selected.Clear;
  dblcdptoid.Selected.Add('DPTOID'#9'2'#9'Código'#9#9);
  dblcdptoid.Selected.Add('DPTODES'#9'25'#9'Descripción'#9#9);

  xSql := 'SELECT TIPBENEF, BENEFDES FROM TGE186 WHERE TIPBENEF IN (''01'',''02'',''03'')';
  DM1.cdsTipBenef.Close;
  DM1.cdsTipBenef.DataRequest(xSql);
  DM1.cdsTipBenef.Open;
  dblctipben.Selected.Clear;
  dblctipben.Selected.Add('TIPBENEF'#9'2'#9'Código'#9#9);
  dblctipben.Selected.Add('BENEFDES'#9'25'#9'Tipo de beneficio'#9#9);

end;

procedure TFrepcrepen.dblcdptoidChange(Sender: TObject);
// Inicio: HPC_201709_PRE
// Se retira variable local. Se envia al private  
// Var xSql:String;
// Fin: HPC_201709_PRE
begin
  If dblcdptoid.Text = '' Then
  Begin
    medesdep.Text := '';
    dblcduseid.Text := '';
    medesuse.Text := '';
    dblcduseid.Enabled := False;
  End;
  If Length(dblcdptoid.Text) = 2 then
  Begin
    If DM1.cdsDpto.Locate('DPTOID', dblcdptoid.Text, []) Then
    Begin
      medesdep.Text := DM1.cdsDpto.FieldByName('DPTODES').AsString;
      dblcduseid.Enabled := True;
      xSql := 'SELECT USEID, USENOM FROM APO101 WHERE DPTOID = '+QuotedStr(dblcdptoid.Text);
      DM1.cdsUse.Close;
// Inicio  HPC_201503_PRE   : Se añade a la consulta lo recuperado por el FSC con saldo >0
      DM1.cdsUse.ProviderName:='prvReporte3';
// Fin  HPC_201503_PRE   : Se añade a la consulta lo recuperado por el FSC con saldo >0
      DM1.cdsUse.DataRequest(xSql);
      DM1.cdsUse.Open;
      dblcduseid.Selected.Clear;
      dblcduseid.Selected.Add('USEID'#9'2'#9'Código'#9#9);
      dblcduseid.Selected.Add('USENOM'#9'25'#9'Descripción'#9#9);
    End
    Else
    Begin
      MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
      dblcduseid.Enabled := False;
      dblcdptoid.Text := '';
      medesdep.Text := '';
      btnPrevio.SetFocus;
    End;
  End;
  limpia;
end;

procedure TFrepcrepen.btnImprimeClick(Sender: TObject);
begin
  ppltitfec.Caption := 'DEL '+dbdtpInicial.Text+' AL '+dbdtpFinal.Text;
  If Trim(medesdep.Text) = '' Then ppltitdep.Visible := False
  Else
  Begin
    ppltitdep.Visible := True;
    ppltitdep.Caption := 'DEPARTAMENTO : '+trim(medesdep.Text);
  End;
  pplc19990.Caption := FloatToStrF(c19990, ffNumber,10,0);
  pplc20530.Caption := FloatToStrF(c20530, ffNumber,10,0);
  pplcafp.Caption   := FloatToStrF(cafp, ffNumber,10,0);
  pplcotros.Caption := FloatToStrF(cotros, ffNumber,10,0);
  pplctotal.Caption := FloatToStrF(c19990+c20530+cafp+cotros, ffNumber,10,0);
  pplm19990.Caption := FloatToStrF(m19990, ffNumber,10,2);
  pplm20530.Caption := FloatToStrF(m20530, ffNumber,10,2);
  pplmafp.Caption   := FloatToStrF(mafp, ffNumber,10,2);
  pplmotros.Caption := FloatToStrF(motros, ffNumber,10,2);
  pplmtotal.Caption := FloatToStrF(m19990+m20530+mafp+motros, ffNumber,10,2);
  pplimpresopor.Caption := 'Impreso por : '+DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
  ppreporte.Print;
  ppreporte.Stop;
end;


procedure TFrepcrepen.btnaexcelClick(Sender: TObject);
begin
  // Inicio: HPC_201709_PRE
  // Se cambia de procedimiento para exportar a excel
  // DBGrid.DataSource := DM1.dsReporte;
  // DM1.HojaExcel('REPORTE', DM1.dsReporte, DBGrid);
  // DM1.ExportaGridExcel(dbgcuonocob, 'DET_REPCREDESBEN');
  DM1.cdsReporte1.Close;
  DM1.cdsReporte1.DataRequest(xSqlAExcel);
  DM1.cdsReporte1.Open;
  DM1.HojaExcel('DET_REPCREDESBEN',DM1.dsReporte1, dbgAExcel);
  // Fin: HPC_201709_PRE
end;


procedure TFrepcrepen.dblctipbenChange(Sender: TObject);
begin
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
  limpia;
end;

procedure TFrepcrepen.limpia;
begin
  DM1.cdsReporte.Close;
end;

procedure TFrepcrepen.dblcduseidChange(Sender: TObject);
begin
  If dblcduseid.Text = '' Then medesuse.Text := '';
  If Length(dblcduseid.Text) = 2 then
  Begin
    If DM1.cdsUse.Locate('USEID', dblcduseid.Text, []) Then
    Begin
      medesuse.Text := DM1.cdsUse.FieldByName('USENOM').AsString;
    End
    Else
    Begin
      MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
      dblcduseid.Text := '';
      medesuse.Text := '';
      dblcduseid.SetFocus;
    End;
  End;
  limpia;
end;

end.
