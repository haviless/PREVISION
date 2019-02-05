// Inicio Uso Estándares: 01/08/2011
// Unidad     : PRE290
// Formulario : FRptPagBenXTipo
// Fecha de Creación : 31/12/2009
// Autor : JUVER DE LA CRUZ
// Objetivo : REPORTE DE TIPOS DE BENEFICIO AGRUPADO POR DEPARTAMENTO Y UGEL
// HPC_200912_PRE 31/12/2009 REPORTE DE TIPOS DE BENEFICIO AGRUPADO POR DEPARTAMENTO Y UGEL
// HPC_201114_PRE 25/11/2011 Se añade reporte detalle   (ppPrevio1)
// DPP_201202_PRE : Se realiza el pase a produccion a partir del pase HPC_201114_PRE
// HPC_201307_PRE : Se añade imagen del nuevo logo institucional
// SPP_201401_PRE : Se realiza el pase a producción a partir del pase HPC_201307_PRE
// HPC_201709_PRE : Se añade la columnas pagos de beneficios x tabla.
// HPC_201805_PRE : Se modifica Qry para añadir columna de liquidaciones x reliquidación

unit PRE290;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ppEndUsr, ppDB, ppDBPipe,
  ppParameter, ppBands, ppClass, ppCtrls, ppVar, ppPrnabl, ppCache, ppComm,
  ppRelatv, ppProd, ppReport, ImgList, Wwdbigrd, Wwdbgrid, Grids, DBGrids,
  ComCtrls,DB,DBClient,StrUtils, wwdbdatetimepicker, jpeg;  // SPP_201401_PRE

type
  TFRptPagBenXTipo = class(TForm)
    pInferior: TPanel;
    lblNroRegEncontrados: TLabel;
    btnAExcel: TBitBtn;
    btnCerrar: TBitBtn;
    btnPrint: TBitBtn;
    Panel1: TPanel;
    dtgData: TDBGrid;
    dbgPrevio: TwwDBGrid;
    imgLstGrid: TImageList;
    btnProcesar: TBitBtn;
//  Inicio: DPP_201202_PRE
//  dtpInicio: TDateTimePicker;
//  Fin: DPP_201202_PRE
    Label1: TLabel;
//  Inicio: DPP_201202_PRE
//  dtpFin: TDateTimePicker;
//  Fin: DPP_201202_PRE
    Label2: TLabel;
    ppDesignerRun: TppDesigner;
    ppPrevio: TppReport;
    ppParameterList1: TppParameterList;
    ppDBConexion: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppShape9: TppShape;
    ppShape2: TppShape;
    ppShape1: TppShape;
//Inicio: SPP_201401_PRE
    // ppLabel11: TppLabel; 
    // ppLabel12: TppLabel; 
//Fin: SPP_201401_PRE
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppLblTitulo: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel10: TppLabel;
    ppLabel19: TppLabel;
    ppLblPeriodo: TppLabel;
    ppShape3: TppShape;
    ppLabel1: TppLabel;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppShape8: TppShape;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppShape10: TppShape;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel9: TppLabel;
    ppLabel16: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText9: TppDBText;
    ppDBText1: TppDBText;
    ppDBText8: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc2: TppDBCalc;
    ppLabel8: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppLine3: TppLine;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText7: TppDBText;
    ppLine2: TppLine;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel7: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppLine1: TppLine;
    ppLine4: TppLine;
//  Inicio: DPP_201202_PRE
    dtpInicio: TwwDBDateTimePicker;
    dtpFin: TwwDBDateTimePicker;
    rgtipo: TRadioGroup;
    Label3: TLabel;
    Label4: TLabel;
    ppPrevio1: TppReport;
    ppParameterList2: TppParameterList;
    ppHeaderBand2: TppHeaderBand;
    ppShape19: TppShape;
    ppShape16: TppShape;
    ppShape22: TppShape;
    ppShape21: TppShape;
    ppShape18: TppShape;
    ppShape23: TppShape;
    ppShape17: TppShape;
    ppShape14: TppShape;
    ppShape12: TppShape;
//Inicio: SPP_201401_PRE
    // ppLabel17: TppLabel; 
    // ppLabel18: TppLabel; 
//Fin: SPP_201401_PRE
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel32: TppLabel;
    ppShape20: TppShape;
    ppShape13: TppShape;
    ppShape15: TppShape;
    ppLabel31: TppLabel;
    ppLabel33: TppLabel;
    ppShape11: TppShape;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppShape24: TppShape;
    ppLabel44: TppLabel;
    ppShape25: TppShape;
    ppLabel45: TppLabel;
    ppLabel43: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText6: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppSummaryBand2: TppSummaryBand;
    ppDBCalc20: TppDBCalc;
    ppLabel47: TppLabel;
    ppDBCalc21: TppDBCalc;
    ppDBCalc22: TppDBCalc;
    ppDBCalc23: TppDBCalc;
    ppDBCalc24: TppDBCalc;
    ppDBCalc25: TppDBCalc;
    ppDBCalc26: TppDBCalc;
    ppLine8: TppLine;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText16: TppDBText;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBCalc13: TppDBCalc;
    ppLabel46: TppLabel;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppDBCalc17: TppDBCalc;
    ppDBCalc18: TppDBCalc;
    ppDBCalc19: TppDBCalc;
    ppLine5: TppLine;
//Inicio: SPP_201401_PRE
    ppImage1: TppImage; 
    ppImage2: TppImage; 
//Fin: SPP_201401_PRE
//  Fin: DPP_201202_PRE
//
    procedure btnAExcelClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
    procedure dbgPrevioCalcTitleImage(Sender: TObject;
      Field: TField; var TitleImageAttributes: TwwTitleImageAttributes);
    procedure dbgPrevioTitleButtonClick(Sender: TObject;
      AFieldName: String);

//  Inicio: DPP_201202_PRE
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure rgtipoClick(Sender: TObject);
//  Fin: DPP_201202_PRE

  private
    xFInicio,xFFin: string;
    procedure DoSorting(cdsName: TClientDataset; AFieldName: String);
//  Inicio: DPP_201202_PRE
{
    procedure FormActivate(Sender: TObject);
}
//  Fin: DPP_201202_PRE

  public
    { Public declarations }
  end;

var
  FRptPagBenXTipo: TFRptPagBenXTipo;

implementation

uses PREDM;

{$R *.dfm}

(**************************** JUVER DE LA CRUZ ********************************)
(******************************************************************************)
procedure TFRptPagBenXTipo.btnProcesarClick(Sender: TObject);
  {----------------------------------------------------}
  function isFechasValidas():boolean;
    begin
      result:= not ((trim(datetostr(dtpInicio.Date))='') or (trim(datetostr(dtpFin.Date))=''));
    end;
  {----------------------------------------------------}
  procedure calcularTotales;
  var xTotCantRet,xTotMontoRet,
      xTotCantFal,xTotMontoFal,
      xTotCantInv,xTotMontoInv,
      xNroRegistros:Double;
// Inicio: DPP_201202_PRE
      // Inicio: HPC_201709_PRE
      // Se añade la variable "xTotMonTab" (calculo de liquidación por tabla)
      // xMonLiqBen, xMonPag, xAportes, xInteres, xBonus, xMonDif:Double;
      xMonLiqBen, xMonPag, xTotMonTab, xAportes, xInteres, xBonus, xMonDif:Double;
      // Fin: HPC_201709_PRE
// Fin: DPP_201202_PRE
  begin
// Inicio: DPP_201202_PRE
   If rgtipo.ItemIndex = 0 Then
   Begin
// Fin: DPP_201202_PRE
     xTotCantRet:=0;
     xTotMontoRet:=0;
     xTotCantFal:=0;
     xTotMontoFal:=0;
     xTotCantInv:=0;
     xTotMontoInv:=0;
     xNroRegistros:=0;
     if DM1.cdsQry6.Active then
       begin
       DM1.cdsQry6.First;
         While not DM1.cdsQry6.Eof Do
           Begin
             xTotCantRet:=xTotCantRet+DM1.cdsQry6.FieldByName('CAN_RET').AsFloat;
             xTotMontoRet:=xTotMontoRet+DM1.cdsQry6.FieldByName('MON_RET').AsFloat;
             xTotCantFal:=xTotCantFal+DM1.cdsQry6.FieldByName('CAN_FAL').AsFloat;
             xTotMontoFal:=xTotMontoFal+DM1.cdsQry6.FieldByName('MON_FAL').AsFloat;
             xTotCantInv:=xTotCantInv+DM1.cdsQry6.FieldByName('CAN_INV').AsFloat;
             xTotMontoInv:=xTotMontoInv+DM1.cdsQry6.FieldByName('MON_INV').AsFloat;
             xNroRegistros:=xNroRegistros+1;
             DM1.cdsQry6.Next;
           End;
         self.lblNroRegEncontrados.Caption:=FloatToStr(xNroRegistros)+' Registros encontrados '
                                            + 'del '+datetostr(dtpInicio.Date)+' a '+ datetostr(dtpFin.Date);
         dbgPrevio.Selected.Clear;
         dbgPrevio.Selected.Add('DPTODES'#9'18'#9'Departamento'#9);
         dbgPrevio.Selected.Add('USENOM'#9'32'#9'UGEL'#9);
         dbgPrevio.Selected.Add('CAN_RET'#9'12'#9'Cant'#9'F'#9'Retiro');
         dbgPrevio.Selected.Add('MON_RET'#9'10'#9'Beneficio'#9'F'#9'Retiro');
         dbgPrevio.Selected.Add('CAN_FAL'#9'12'#9'Cant'#9'F'#9'Fallecimiento');
         dbgPrevio.Selected.Add('MON_FAL'#9'10'#9'Beneficio'#9'F'#9'Fallecimiento');
         dbgPrevio.Selected.Add('CAN_INV'#9'12'#9'Cant'#9'F'#9'Invalidez');
         dbgPrevio.Selected.Add('MON_INV'#9'10'#9'Beneficio'#9'F'#9'Invalidez');

         dbgPrevio.ApplySelected;
         TNumericField(DM1.cdsQry6.FieldByName('CAN_RET')).DisplayFormat := '###,###,##0';
         TNumericField(DM1.cdsQry6.FieldByName('MON_RET')).DisplayFormat := '###,###,##0.00';
         TNumericField(DM1.cdsQry6.FieldByName('CAN_FAL')).DisplayFormat := '###,###,##0';
         TNumericField(DM1.cdsQry6.FieldByName('MON_FAL')).DisplayFormat := '###,###,##0.00';
         TNumericField(DM1.cdsQry6.FieldByName('CAN_INV')).DisplayFormat := '###,###,##0';
         TNumericField(DM1.cdsQry6.FieldByName('MON_INV')).DisplayFormat := '###,###,##0.00';

         dbgPrevio.ColumnByName('DPTODES').FooterValue := 'TOTAL';
         dbgPrevio.ColumnByName('CAN_RET').FooterValue := FloatTostrf(xTotCantRet,ffnumber,15,0);
         dbgPrevio.ColumnByName('MON_RET').FooterValue := FloatTostrf(xTotMontoRet,ffnumber,15,2);
         dbgPrevio.ColumnByName('CAN_FAL').FooterValue := FloatTostrf(xTotCantFal,ffnumber,15,0);
         dbgPrevio.ColumnByName('MON_FAL').FooterValue := FloatTostrf(xTotMontoFal,ffnumber,15,2);
         dbgPrevio.ColumnByName('CAN_INV').FooterValue := FloatTostrf(xTotCantInv,ffnumber,15,0);
         dbgPrevio.ColumnByName('MON_INV').FooterValue := FloatTostrf(xTotMontoInv,ffnumber,15,2);

         dbgPrevio.RefreshDisplay;
         DM1.cdsQry6.First;
       end;
// Inicio: DPP_201202_PRE
   End;

   If rgtipo.ItemIndex = 1 Then
   Begin
      xMonLiqBen    := 0;
      xMonPag       := 0;
      xAportes      := 0;
      xInteres      := 0;
      xBonus        := 0;
      xMonDif       := 0;
      xNroRegistros := 0;
      // Inicio: HPC_201709_PRE
      // Se inicializa la variable para guardar el monto de la liquidación por tabla
      xTotMonTab    := 0;
      // Fin: HPC_201709_PRE
      If DM1.cdsQry6.Active then
      begin
         DM1.cdsQry6.First;
         While not DM1.cdsQry6.Eof Do
         Begin
            xMonLiqBen    := xMonLiqBen + DM1.cdsQry6.FieldByName('MONLIQBEN').AsFloat;
            // Inicio: HPC_201709_PRE
            // Se actualiza la variable de liquidación por tabla
            xTotMonTab    := xTotMonTab + DM1.cdsQry6.FieldByName('MONTOXTABLA').AsFloat;
            // Fin: HPC_201709_PRE
            xMonPag       := xMonPag    + DM1.cdsQry6.FieldByName('MONPAG').AsFloat;
            xAportes      := xAportes   + DM1.cdsQry6.FieldByName('APORTES').AsFloat;
            xInteres      := xInteres   + DM1.cdsQry6.FieldByName('INTERES').AsFloat;
            xBonus        := xBonus     + DM1.cdsQry6.FieldByName('BONUS').AsFloat;
            xMonDif       := xMonDif    + DM1.cdsQry6.FieldByName('MONDIF').AsFloat;
            xNroRegistros := xNroRegistros + 1;
            DM1.cdsQry6.Next;
         End;
         self.lblNroRegEncontrados.Caption:=FloatToStr(xNroRegistros)+' Registros encontrados '
                                            + 'del '+datetostr(dtpInicio.Date)+' a '+ datetostr(dtpFin.Date);
         dbgPrevio.Selected.Clear;
         dbgPrevio.Selected.Add('DPTODES'#9'18'#9'Departamento'#9);
         dbgPrevio.Selected.Add('USENOM'#9'32'#9'UGEL'#9);
         dbgPrevio.Selected.Add('PVSLBENNR'#9'11'#9'NUMERO.LIQ.'#9);
         dbgPrevio.Selected.Add('BENEFDES'#9'15'#9'TIPO.BENEFICIO'#9);
         dbgPrevio.Selected.Add('PVSLFECBE'#9'10'#9'FECHA.BEN.'#9);
         dbgPrevio.Selected.Add('ASODNI'#9'8'#9'D.N.I.'#9);
         dbgPrevio.Selected.Add('ASOAPENOMDNI'#9'60'#9'APELLIDOS Y NOMBRE(S)'#9);
         dbgPrevio.Selected.Add('MONLIQBEN'#9'12'#9'MONTO.LIQ'#9);
         // Inicio: HPC_201709_PRE   
         // Se añade la columna monto de liquidación por tabla
         dbgPrevio.Selected.Add('MONTOXTABLA'#9'12'#9'BEN.~SEG.TABLA'#9);
         // Fin: HPC_201709_PRE
         dbgPrevio.Selected.Add('APORTES'#9'12'#9'APORTES'#9);
         dbgPrevio.Selected.Add('INTERES'#9'12'#9'INTERES'#9);
         dbgPrevio.Selected.Add('BONUS'#9'12'#9'BONUS'#9);
         dbgPrevio.Selected.Add('MONDIF'#9'12'#9'DIFERENCIAL'#9);
         dbgPrevio.Selected.Add('MONPAG'#9'12'#9'MONTO.PAG.'#9);
         dbgPrevio.ApplySelected;
         TNumericField(DM1.cdsQry6.FieldByName('MONLIQBEN')).DisplayFormat := '###,###,##0';
         // Inicio: HPC_201709_PRE
         // Se formatea la columna del monto de liquidación por tabla
         TNumericField(DM1.cdsQry6.FieldByName('MONTOXTABLA')).DisplayFormat := '###,###,##0';
         // Fin: HPC_201709_PRE
         TNumericField(DM1.cdsQry6.FieldByName('APORTES')).DisplayFormat := '###,###,##0';
         TNumericField(DM1.cdsQry6.FieldByName('INTERES')).DisplayFormat := '###,###,##0';
         TNumericField(DM1.cdsQry6.FieldByName('BONUS')).DisplayFormat := '###,###,##0';
         TNumericField(DM1.cdsQry6.FieldByName('MONDIF')).DisplayFormat := '###,###,##0';
         TNumericField(DM1.cdsQry6.FieldByName('MONPAG')).DisplayFormat := '###,###,##0';

         dbgPrevio.ColumnByName('DPTODES').FooterValue := 'TOTAL';
         dbgPrevio.ColumnByName('MONLIQBEN').FooterValue := FloatTostrf(xMonLiqBen,ffnumber,15,2);
         // Inicio: HPC_201709_PRE   
         // Se actualiza la columna de totales con el valor de la liquidación por tabla 
         dbgPrevio.ColumnByName('MONTOXTABLA').FooterValue := FloatTostrf(xTotMonTab,ffnumber,15,2);
         // Fin: HPC_201709_PRE
         dbgPrevio.ColumnByName('APORTES').FooterValue := FloatTostrf(xAportes,ffnumber,15,2);
         dbgPrevio.ColumnByName('INTERES').FooterValue := FloatTostrf(xInteres,ffnumber,15,2);
         dbgPrevio.ColumnByName('BONUS').FooterValue := FloatTostrf(xBonus,ffnumber,15,2);
         dbgPrevio.ColumnByName('MONDIF').FooterValue := FloatTostrf(xMonDif,ffnumber,15,2);
         dbgPrevio.ColumnByName('MONPAG').FooterValue := FloatTostrf(xMonPag,ffnumber,15,2);
         dbgPrevio.RefreshDisplay;
         DM1.cdsQry6.First;
      end;
   End;
// Fin: DPP_201202_PRE

  end;
  {----------------------------------------------------}
  procedure generarDxs();
  var xSQL: String;
  begin
      xFInicio:=datetostr(dtpInicio.Date);
      xFFin:=datetostr(dtpFin.Date);
   // Inicio: DPP_201202_PRE
      If rgtipo.ItemIndex = 0 Then
         XSQL:='SELECT CASE WHEN DPTOID  IS NULL THEN ''99'' ELSE DPTOID END DPTOID, '
           +'       CASE WHEN DPTODES IS NULL THEN ''POR IDENTIFICAR'' ELSE DPTODES END DPTODES, '
           +'       CASE WHEN USEID   IS NULL THEN ''99'' ELSE USEID END USEID, '
           +'       CASE WHEN USENOM  IS NULL THEN ''POR IDENTIFICAR'' ELSE USENOM END USENOM, '
           +'       SUM(NVL(CAN_RET,0)) CAN_RET, SUM(NVL(MON_RET,0)) MON_RET, '
           +'       SUM(NVL(CAN_FAL,0)) CAN_FAL, SUM(NVL(MON_FAL,0)) MON_FAL,'
           +'       SUM(NVL(CAN_INV,0)) CAN_INV, SUM(NVL(MON_INV,0)) MON_INV '
           +'FROM ( SELECT C.DPTOID, C.DPTODES, '
           +'              B.USEID, B.USENOM, '
           +'              CASE WHEN A.PVSLTIPBE = ''01'' THEN 1 ELSE 0 END CAN_RET, '
           +'              CASE WHEN A.PVSLTIPBE = ''01'' THEN NVL(A.MONLIQBEN,0) ELSE 0 END MON_RET, '
           +'              CASE WHEN A.PVSLTIPBE = ''02'' THEN 1 ELSE 0 END CAN_FAL, '
           +'              CASE WHEN A.PVSLTIPBE = ''02'' THEN NVL(A.MONLIQBEN,0) ELSE 0 END MON_FAL, '
           +'              CASE WHEN A.PVSLTIPBE = ''03'' THEN 1 ELSE 0 END CAN_INV, '
           +'              CASE WHEN A.PVSLTIPBE = ''03'' THEN NVL(A.MONLIQBEN,0) ELSE 0 END MON_INV '
           +'       FROM PVS306 A, APO101 B, APO158 C '
           +'       WHERE TO_DATE(A.PVSLFECBE) >= '+QuotedStr(xFInicio)
           +'         AND TO_DATE(A.PVSLFECBE) <= '+QuotedStr(xFFin)
           +'         AND PVSESTLIQ IN (''02'', ''05'', ''06'') AND A.UPROID = B.UPROID(+) AND A.UPAGOID = B.UPAGOID(+) '
           +'         AND A.USEID = B.USEID(+) AND B.DPTOID = C.DPTOID(+) '
           +'      ) '
           +'GROUP BY DPTOID, DPTODES, USEID, USENOM '
           +'ORDER BY DPTOID, USEID'
      Else
        // Inicio: HPC_201805_PRE
        // Se modifica Qry para añadir columna de liquidaciones x reliquidación
        // XSQL := 'SELECT C.ASOCODMOD, E.DPTOID, E.DPTODES, D.USEID, D.USENOM, SUBSTR(A.PVSLBENNR,7,5) PVSLBENNR, F.BENEFDES, A.PVSLFECBE, C.ASODNI, C.ASOAPENOMDNI,  A.MONLIQBEN, A.MONPAG,'
        //  // Inicio: HPC_201709_PRE
        //  // Se añade al Qry el calculo de la liquidación por tabla
        //  +' SUM(CASE WHEN B.TIPDES IN (''BF'',''BI'',''BR'') THEN B.PVSLMONTO ELSE 0 END) MONTOXTABLA,'
        //  // Fin: HPC_201709_PRE
        //  +' SUM(CASE WHEN B.TIPDES = ''FA'' THEN B.PVSLMONTO ELSE 0 END) APORTES,'
        //  +' SUM(CASE WHEN B.TIPDES = ''FI'' THEN B.PVSLMONTO ELSE 0 END) INTERES,'
        //  +' SUM(CASE WHEN B.TIPDES = ''FB'' THEN B.PVSLMONTO ELSE 0 END) BONUS,'
        //  +' SUM(CASE WHEN B.TIPDES = ''MD'' THEN B.PVSLMONTO ELSE 0 END) MONDIF'
        //  +' FROM PVS306 A, PVS307 B, APO201 C, APO101 D, APO158 E, TGE186 F'
        //  +' WHERE A.PVSLFECBE >= '+QuotedStr(xFInicio)
        //  +' AND A.PVSLFECBE <= '+QuotedStr(xFFin)
        //  +' AND A.PVSESTLIQ IN (''02'', ''05'', ''06'')'
        //  +' AND A.PVSLBENNR = B.PVSLBENNR AND B.PVSLAGRID = ''DET'''
        //  +' AND A.ASOID = C.ASOID'
        //  +' AND C.UPROID = D.UPROID(+) AND C.UPAGOID = D.UPAGOID(+) AND C.USEID = D.USEID(+)'
        //  +' AND D.DPTOID = E.DPTOID(+)'
        //  +' AND A.PVSLTIPBE = F.TIPBENEF(+)'
        //  +' GROUP BY C.ASOCODMOD, E.DPTOID, E.DPTODES, D.USEID, D.USENOM, SUBSTR(A.PVSLBENNR,7,5), F.BENEFDES, A.PVSLFECBE, C.ASODNI, C.ASOAPENOMDNI,  A.MONLIQBEN, A.MONPAG'
        //  +' ORDER BY E.DPTOID, D.USEID, SUBSTR(A.PVSLBENNR,7,5)';
        //  // Fin: DPP_201202_PRE
        XSQL := 'SELECT C.ASOCODMOD, E.DPTOID, E.DPTODES, D.USEID, D.USENOM, SUBSTR(A.PVSLBENNR,7,5) PVSLBENNR, F.BENEFABR||CASE WHEN A.PVSESTLIQ = ''05'' THEN '' (RE)''  ELSE NULL END BENEFDES, A.PVSLFECBE, C.ASODNI,'
        +' C.ASOAPENOMDNI,  A.MONLIQBEN, A.MONPAG, SUM(CASE WHEN B.TIPDES IN (''BF'',''BI'',''BR'') THEN B.PVSLMONTO ELSE 0 END) MONTOXTABLA,'
        +' SUM(CASE WHEN B.TIPDES = ''FA'' AND A.PVSESTLIQ <> ''05'' THEN B.PVSLMONTO ELSE 0 END) APORTES,'
        +' SUM(CASE WHEN B.TIPDES = ''FI'' AND A.PVSESTLIQ <> ''05'' THEN B.PVSLMONTO ELSE 0 END) INTERES,'
        +' SUM(CASE WHEN B.TIPDES = ''FB'' AND A.PVSESTLIQ <> ''05'' THEN B.PVSLMONTO ELSE 0 END) BONUS,'
        +' SUM(CASE WHEN B.TIPDES = ''MD'' AND A.PVSESTLIQ <> ''05'' THEN B.PVSLMONTO ELSE 0 END) MONDIF'
        +' FROM PVS306 A, PVS307 B, APO201 C, APO101 D, APO158 E, TGE186 F'
        +' WHERE A.PVSLFECBE >= '+QuotedStr(xFInicio)+' AND A.PVSLFECBE <= '+QuotedStr(xFFin)
        +' AND A.PVSESTLIQ IN (''02'', ''05'', ''06'') AND A.PVSLBENNR = B.PVSLBENNR AND B.PVSLAGRID = ''DET'''
        +' AND A.ASOID = C.ASOID AND C.UPROID = D.UPROID(+) AND C.UPAGOID = D.UPAGOID(+) AND C.USEID = D.USEID(+) AND D.DPTOID = E.DPTOID(+) AND A.PVSLTIPBE = F.TIPBENEF(+)'
        +' GROUP BY C.ASOCODMOD, E.DPTOID, E.DPTODES, D.USEID, D.USENOM, '
        +' SUBSTR(A.PVSLBENNR,7,5), F.BENEFABR||CASE WHEN A.PVSESTLIQ = ''05'' THEN '' (RE)''  ELSE NULL END,'
        +' A.PVSLFECBE, C.ASODNI, C.ASOAPENOMDNI,  A.MONLIQBEN, A.MONPAG'
        +' ORDER BY E.DPTOID, D.USEID, SUBSTR(A.PVSLBENNR,7,5)';
        // Fin: HPC_201805_PRE
      DM1.cdsQry6.Close;
      DM1.cdsQry6.DataRequest(xSql);
      DM1.cdsQry6.Open;
      //excel
      DM1.cdsQry5.Close;
      DM1.cdsQry5.DataRequest(XSQL);
      DM1.cdsQry5.Open;
  end;
  {----------------------------------------------------}
  procedure agrupar(Sender: TObject;IField:string);
    begin
      (Sender as TwwDBGrid).GroupFieldName:= IField;
      (Sender as TwwDBGrid).Datasource.Dataset.FieldByName(IField).Index := 0;
      DoSorting(TClientDataset((Sender as TwwDBGrid).Datasource.Dataset), IField);
      (Sender as TwwDBGrid).Invalidate;
    end;
  {----------------------------------------------------}
begin
  if isFechasValidas() then
    begin
   // Inicio: DPP_201202_PRE
      If rgtipo.ItemIndex = -1 Then Exit;
   // Fin: DPP_201202_PRE
      Screen.Cursor:= crHourGlass;
      generarDxs();
      calcularTotales();
   // Inicio: DPP_201202_PRE
      If rgtipo.ItemIndex = 0 Then
      Begin
         agrupar(dbgPrevio,'DPTODES');
      End;
   // Fin: DPP_201202_PRE
      btnAExcel.Enabled:=true;
      btnPrint.Enabled:=true;
      Screen.Cursor:= crDefault;
    end
  else
    showmessage('Por favor seleccione fechas validas');
end;

(******************************************************************************)

procedure TFRptPagBenXTipo.DoSorting(cdsName:TClientDataset; AFieldName: String);
const
  NONSORTABLE: Set of TFieldType=[ftBlob,ftMemo,ftOraBlob,ftOraCLob];
begin
  with cdsName do
  begin
    if IsEmpty or (FieldByName(AFieldName).DataType in NONSORTABLE) then
      Exit;

    if (IndexFieldNames=AFieldName) then
    begin
       IndexDefs.Update;
       if IndexDefs.IndexOf('w2wTempIndex')>-1  then
       begin
         DeleteIndex('w2wTempIndex');
         IndexDefs.Update;
       end;
       AddIndex('w2wTempIndex',AFieldName,[ixDescending,ixCaseInsensitive],'','',0);
       IndexName:='w2wTempIndex';
    end
    else
    begin
       IndexFieldNames := AFieldName;
    end;
  end;
end;

(******************************************************************************)

procedure TFRptPagBenXTipo.dbgPrevioTitleButtonClick(
  Sender: TObject; AFieldName: String);
begin
  DoSorting(TClientDataset((Sender as TwwDBGrid).Datasource.Dataset),AFieldName);
end;

(******************************************************************************)

procedure TFRptPagBenXTipo.FormActivate(Sender: TObject);
var 
   cadFecha:Double; // DPP_201202_PRE
begin
// Inicio: DPP_201202_PRE
   cadFecha := DM1.FechaSys;
   dtpInicio.date := cadFecha;
   dtpFin.date    := cadFecha;
   DM1.cdsQry5.Close;
   DM1.cdsQry6.Close;
   dtpInicio.SetFocus;
// Fin: DPP_201202_PRE
end;

(******************************************************************************)

procedure TFRptPagBenXTipo.dbgPrevioCalcTitleImage(Sender: TObject;
  Field: TField; var TitleImageAttributes: TwwTitleImageAttributes);
begin
  with (Sender as TwwDBGrid) do
  if Field.FieldName=TClientDataset(Datasource.Dataset).indexfieldnames then
  begin
    TitleImageAttributes.ImageIndex := 0;
  end
  else if TClientDataset(Datasource.Dataset).indexname = 'w2wTempIndex' then
  begin
     TClientDataset(Datasource.Dataset).indexdefs.Update;
     if TClientDataset(Datasource.Dataset).indexdefs.Find('w2wTempIndex').Fields = Field.Fieldname then
       TitleImageAttributes.ImageIndex := 1;
  end;
end;

(******************************************************************************)

procedure TFRptPagBenXTipo.btnAExcelClick(Sender: TObject);
  function fechaCadena(cad:string):string;
  begin
    result:= MidStr(cad,7,4)+MidStr(cad,4,2)+MidStr(cad,1,2)
  end;
begin
   DM1.HojaExcel(fechaCadena(xFInicio)+'-'+fechaCadena(xFFin),dtgData.DataSource, dtgData);
end;

(******************************************************************************)

procedure TFRptPagBenXTipo.btnPrintClick(Sender: TObject);
begin
// Inicio: DPP_201202_PRE
   If rgtipo.ItemIndex = 0 Then
   Begin
      ppLblPeriodo.Caption:='( '+xFInicio+' A '+xFFin+' )';
      If DM1.cdsQry5.RecordCount > 0 Then
      Begin
         // para diseñar en tiempo de ejecucion
         //  ppdesignerRun.Report := ppPrevio;
         //  ppdesignerRun.Show;
         // para presentar
         ppPrevio.Print;
         ppPrevio.stop;
      End;
   End;

   If rgtipo.ItemIndex = 1 Then
   Begin
      ppLblPeriodo.Caption:='( '+xFInicio+' A '+xFFin+' )';
      If DM1.cdsQry5.RecordCount > 0 Then
      Begin
         // para diseñar en tiempo de ejecucion
         //  ppdesignerRun.Report := ppPrevio1;
         //  ppdesignerRun.Show;
         // para presentar
         ppPrevio1.Print;
         ppPrevio1.stop;
      End;
   End;
// Fin: DPP_201202_PRE
end;

(******************************************************************************)
//Inicio: DPP_201202_PRE
procedure TFRptPagBenXTipo.FormKeyPress(Sender: TObject; var Key: Char);
begin
   If Key = #13 Then
   begin
      Key := #0;
      Perform(CM_DIALOGKEY, VK_TAB, 0);
   end;
end;
//Fin: DPP_201202_PRE

procedure TFRptPagBenXTipo.rgtipoClick(Sender: TObject);
begin
//Inicio: DPP_201202_PRE
   DM1.cdsQry6.Close;
   DM1.cdsQry5.Close;
//Fin: DPP_201202_PRE
end;

end.

