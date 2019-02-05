// Unidad            : Previsión Social
// Formulario        : FLiqxTipBen
// Fecha de Creación : 13/12/2013
// Autor             : irevilla
// Objetivo          : procesar información de tipo de beneficio desagregado por aportes, intereses, bonus y diferencial y
//                     detalle de liquidaciones que nos muestra la dirección, telefonos.
// HPC_201307_PRE    : Creación.
// SPP_201401_PRE    : Se realiza el pase a producción a partir del pase HPC_201307_PRE
// SPP_201402_PRE    : Se modifica los totales del reporte. Contenian componentes DbText. Se cambian por DBCalc.
// HPC_201402_PRE    : Se añade el campo de monto de liquidación por tabla.
// SPP_201403_PRE    : Se realiza el pase a producción a partir del pase HPC_201402_PRE.
// HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
// HPC_201610_PRE : CREAR Y MODIFICAR INDICADORES DE CALIDAD
// HPC_201706_PRE : Se modifica el Qry para que busque el expediente de beneficio por número de
//                  expediente y no por número de liquidación.
// HPC_201709_PRE : Se añade al beneficio de liquidación x tabla al monto de la liquidación.
// HPC_201805_PRE : Se añade columna de monto de liquidación x reliquidacion

unit PRE938;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, db,
  wwdbdatetimepicker, Buttons, ppBands, ppCache, ppClass, ppProd, ppReport,
  // INICIO HPC_201610_PRE
  // DECLARACION DE COMPONENTES
  ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppPrnabl, ppCtrls, jpeg, ppVar,
  // Inicio: HPC_201709_PRE
  // Se añade una nueva unidad
  // Mask, wwdblook, Wwdbdlg, Wwdatsrc, DBClient, wwclient;
  Mask, wwdblook, Wwdbdlg, Wwdatsrc, DBClient, wwclient, DBGrids;
  // Fin: HPC_201709_PRE
  // FIN HPC_201610_PRE
type
  TFLiqxTipBen = class(TForm)
    gbfiltros: TGroupBox;
    btnprocesar: TBitBtn;
    gbfechas: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtpfecinicio: TwwDBDateTimePicker;
    dtpfecfinal: TwwDBDateTimePicker;
    dbgreporte: TwwDBGrid;
    btnimprimir: TBitBtn;
    btnaexcel: TBitBtn;
    btncerrar: TBitBtn;
    rgtiprep: TRadioGroup;
    ppbdeResXTipBen: TppBDEPipeline;
    pprResxTipBen: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppShape8: TppShape;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel10: TppLabel;
    pplFechas: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLine1: TppLine;
    ppLabel9: TppLabel;
    ppLine2: TppLine;
    pplUsuario: TppLabel;
    ppImage1: TppImage;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
//Inicio: SPP_201402_PRE
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    // Inicio: SPP_201403_PRE
    ppShape9: TppShape;
    ppDBText9: TppDBText;
    ppDBCalc8: TppDBCalc;
    ppLabel14: TppLabel;
    // INICIO HPC_201610_PRE
    // DECLARACION DE VARIABLES
    // Inicio: HPC_201709_PRE 
    // Se añaden nuevas variables para la forma
    dbgAExcel: TDBGrid;
    GroupBox1: TGroupBox;
    cbDepartamento: TwwDBLookupCombo;
    // Fin: HPC_201709_PRE
    Label3: TLabel;
    Panel1: TPanel;
    edtDepartamento: TEdit;
    Label6: TLabel;
    cbOficina: TwwDBLookupCombo;
    Panel2: TPanel;
    edtOficina: TMaskEdit;
    // Inicio: HPC_201805_PRE
    // Se añade etiquetas para visualizar monto de la liquidación x reliquidación
    ppShape10: TppShape;
    ppLabel15: TppLabel;
    ppDBText10: TppDBText;
    ppDBCalc9: TppDBCalc;
    // Fin: HPC_201805_PRE
    // Inicio: HPC_201709_PRE
    // Se retiran client de la forma
    // cdsQry27: TwwClientDataSet;
    // dsQry27: TwwDataSource;
    // cbDepartamento: TwwDBLookupCombo;
    // Fin: HPC_201709_PRE

    // FIN HPC_201610_PRE
    // Fin: SPP_201403_PRE
//Fin: SPP_201402_PRE
    procedure btnprocesarClick(Sender: TObject);
    procedure btnaexcelClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure limpiagrid;
    procedure btnimprimirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dtpfecinicioClick(Sender: TObject);
    procedure dtpfecinicioChange(Sender: TObject);
    procedure dtpfecfinalChange(Sender: TObject);
    procedure rgtiprepClick(Sender: TObject);
    // INICIO HPC_201610_PRE
    // DECLARACION DE PROCEDURES
    procedure FormCreate(Sender: TObject);
    procedure cbDepartamentoChange(Sender: TObject);
    procedure cbOficinaChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    // FIN HPC_201610_PRE
  private
    // Inicio: HPC_201709_PRE
    // Nuevas variables para exportar a excel
    xSql, xSqlAExcel:String;
    // Fin: HPC_201709_PRE
    { Private declarations }
    // INICIO HPC_201610_PRE
    // DECLARACION DE VARIABLES
    xxCdsQryOficina : TwwClientDataSet;
     xxDsQryOficina : TwwDataSource;
    xxCdsQryDepartamento : TwwClientDataSet;
     xxDsQryDepartamento : TwwDataSource;
    // FIN HPC_201610_PRE
  public
    { Public declarations }
  end;

var
  FLiqxTipBen: TFLiqxTipBen;

implementation

uses PREDM;

{$R *.dfm}

procedure TFLiqxTipBen.btnprocesarClick(Sender: TObject);
// Inicio: HPC_201709_PRE
// Se inicializan las nuevas variables
// Var xSql:String;
// xaporte, xinteres, xbonus, xdiferencial, xmonliqben, xdescuento, xmonpag :Double;
Var xaporte, xinteres, xbonus, xdiferencial, xmonliqben, xdescuento, xmonpag :Double;
    // Inicio: HPC_201805_PRE
    // Se añade variable para contabilizar monto de la reliquidación
    xmonliqrel:Double;
    // Fin: HPC_201805_PRE
// Fin: HPC_201709_PRE
    xTabla : Double; // SPP_201403_PRE
begin
   If Trim(dtpfecinicio.Text) = '' Then
   Begin
     MessageDlg('Ingrese la fecha de inicio antes de dar clic en procesar', mtCustom, [mbOk], 0);
     dtpfecinicio.SetFocus;
   End;
   If Trim(dtpfecfinal.Text) = '' Then
   Begin
     MessageDlg('Ingrese la fecha de fin antes de dar clic en procesar', mtCustom, [mbOk], 0);
     dtpfecfinal.SetFocus;
   End;
   If rgtiprep.ItemIndex = -1 Then
   Begin
     MessageDlg('Seleccione el tipo de reporte', mtCustom, [mbOk], 0);
     rgtiprep.SetFocus;
   End;

   // INICIO HPC_201610_PRE
   // VALIDACION DE PARAMETROS
   If Trim(cbDepartamento.Text) = '' Then Begin
     MessageDlg('SELECCIONE EL DEPARTAMENTO', mtCustom, [mbOk], 0);
     cbDepartamento.SetFocus;
   End;

   If Trim(cbOficina.Text) = '' Then Begin
     MessageDlg('SELECCIONE LA OFICINA', mtCustom, [mbOk], 0);
     cbOficina.SetFocus;
   End;
   // FIN HPC_201610_PRE
   If rgtiprep.ItemIndex = 0 Then
   Begin
     // Inicio: HPC_201805_PRE
     // Nuevo Qry para controlar el monto de la liquidación x reliquidación
     // // Inicio: SPP_201403_PRE
     // // xSql := 'SELECT C.BENEFDES, SUM(NVL(A.APORTE,0)) APORTE, SUM(NVL(A.INTERES,0)) INTERES, SUM(NVL(A.BONUS,0)) BONUS, SUM(NVL(A.DIFERENCIAL,0)) DIFERENCIAL,'
     // // +' SUM(NVL(A.MONLIQBEN,0)) MONLIQBEN, SUM(NVL(A.DESCUENTO,0)) DESCUENTO, SUM(NVL(A.MONPAG,0)) MONPAG FROM'
     // // +' (SELECT A.PVSLBENNR, SUM(CASE WHEN TIPDES = ''FA'' THEN B.PVSLMONTO ELSE 0 END) APORTE, SUM(CASE WHEN TIPDES = ''FI'' THEN B.PVSLMONTO ELSE 0 END) INTERES,'
     // // +' SUM(CASE WHEN TIPDES = ''FB'' THEN B.PVSLMONTO ELSE 0 END) BONUS, SUM(CASE WHEN TIPDES = ''MD'' THEN B.PVSLMONTO ELSE 0 END) DIFERENCIAL, MAX(NVL(A.MONLIQBEN,0)) MONLIQBEN,'
     // // +' MAX(NVL(MONDES,0)-NVL(MONDEV,0)) DESCUENTO, MAX(NVL(A.MONPAG,0)) MONPAG FROM PVS306 A, PVS307 B'
     // // +' WHERE A.PVSLFECBE >= '+QuotedStr(dtpfecinicio.Text)+' AND A.PVSLFECBE <= '+QuotedStr(dtpfecfinal.Text)
     // // +' AND A.PVSLBENNR = B.PVSLBENNR AND B.PVSLAGRID = ''DET'' AND A.PVSESTLIQ NOT IN (''04'',''13'')'
     // // +' GROUP BY A.PVSLBENNR) A, PVS306 B, TGE186 C'
     // // +' WHERE A.PVSLBENNR = B.PVSLBENNR AND B.PVSLTIPBE = C.TIPBENEF GROUP BY C.BENEFDES';
     // // Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
     // // INICIO HPC_201610_PRE
     // // MEJORA DE CONSULTA PARA ACEPTAR PARAMETROS OPCIONALES
     // xSql :=
     //    ' SELECT C.BENEFDES, SUM(NVL(A.TABLA,0)) TABLA, SUM(NVL(A.APORTE,0)) APORTE, '
     //  + '        SUM(NVL(A.INTERES,0)) INTERES, SUM(NVL(A.BONUS,0)) BONUS, '
     //  // Inicio: HPC_201709_PRE
     //  // Se añade al beneficio de liquidación x tabla al monto de la liquidación
     //  // + '        SUM(NVL(A.DIFERENCIAL,0)) DIFERENCIAL, SUM(NVL(A.MONLIQBEN,0)) + SUM(NVL(A.TABLA,0)) MONLIQBEN, '
     //  + '        SUM(NVL(A.DIFERENCIAL,0)) DIFERENCIAL, SUM(NVL(A.MONLIQBEN,0)) MONLIQBEN, '
     //  // Fin: HPC_201709_PRE
     //  + '        SUM(NVL(A.DESCUENTO,0)) DESCUENTO, SUM(NVL(A.MONPAG,0)) MONPAG '
     //  + '   FROM (SELECT A.PVSLBENNR,'
     //  + '                SUM(CASE WHEN TIPDES IN(''BR'',''BF'',''BI'') THEN B.PVSLMONTO ELSE 0 END) TABLA, '
     //  + '                SUM(CASE WHEN TIPDES = ''FA'' THEN B.PVSLMONTO ELSE 0 END) APORTE, '
     //  + '                SUM(CASE WHEN TIPDES = ''FI'' THEN B.PVSLMONTO ELSE 0 END) INTERES, '
     //  + '                SUM(CASE WHEN TIPDES = ''FB'' THEN B.PVSLMONTO ELSE 0 END) BONUS, '
     //  + '                SUM(CASE WHEN TIPDES = ''MD'' THEN B.PVSLMONTO ELSE 0 END) DIFERENCIAL, '
     //  + '                MAX(NVL(A.MONLIQBEN,0)) MONLIQBEN, '
     //  + '                MAX(NVL(MONDES,0)-NVL(MONDEV,0)) DESCUENTO, '
     //  + '                MAX(NVL(A.MONPAG,0)) MONPAG '
     //  + '           FROM PVS306 A, PVS307 B '
     //  + '          WHERE A.PVSLFECBE >= '+QuotedStr(dtpfecinicio.Text)
     //  + '            AND A.PVSLFECBE <= '+QuotedStr(dtpfecfinal.Text)
     //  + '            AND A.PVSLBENNR = B.PVSLBENNR '
     //  + '            AND B.PVSLAGRID = ''DET'' '
     //  + '            AND A.PVSESTLIQ NOT IN (''04'',''13'') '
     //  + '            AND EXISTS (SELECT AA.ASOID '
     //  + '                          FROM PVS301 AA '
     //  + '                         WHERE NVL(AA.DEPORIEXP,''XX'') = NVL((CASE WHEN ' + QuotedStr(cbDepartamento.Text) + '= ''00'' THEN AA.DEPORIEXP ELSE ' + QuotedStr(cbDepartamento.Text) + ' END),''XX'') '
     //  + '                           AND NVL(AA.OFIORIEXP,''XX'') = NVL((CASE WHEN ' + QuotedStr(cbOficina.Text)      + '= ''00'' THEN AA.OFIORIEXP ELSE ' + QuotedStr(cbOficina.Text)      + ' END),''XX'') '
     //  + '                           AND AA.ASOID = A.ASOID '
     //  // Inicio: HPC_201706_PRE
     //  // Se cambia la busqueda del expediente de beneficio
     //  // + '                           AND AA.PVSLBENNR = A.PVSLBENNR) '
     //  + '                           AND AA.PVSEXPNRO = A.PVSEXPNRO) '
     //  // Fin: HPC_201706_PRE
     //  + '          GROUP BY A.PVSLBENNR '
     //  + '        ) A, PVS306 B, TGE186 C'
     //  + '  WHERE A.PVSLBENNR = B.PVSLBENNR '
     //  + '    AND B.PVSLTIPBE = C.TIPBENEF '
     //  + '  GROUP BY C.BENEFDES ';
     // // FIN HPC_201610_PRE
     // // Fin   HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
     // // Fin: SPP_201403_PRE
     // // Inicio: HPC_201709_PRE
     // // Nuevas variables para el control de la exportación a excel
     xSql := 'SELECT C.BENEFDES, SUM(NVL(A.TABLA,0)) TABLA, SUM(NVL(A.MONLIQREL,0)) MONLIQREL, SUM(NVL(A.APORTE,0)) APORTE,'
     +' SUM(NVL(A.INTERES,0)) INTERES, SUM(NVL(A.BONUS,0)) BONUS, SUM(NVL(A.DIFERENCIAL,0)) DIFERENCIAL, SUM(NVL(A.MONLIQBEN,0)) MONLIQBEN,'
     +' SUM(NVL(A.DESCUENTO,0)) DESCUENTO, SUM(NVL(A.MONPAG,0)) MONPAG FROM ('
     +' SELECT A.PVSLBENNR, SUM(CASE WHEN TIPDES IN(''BR'',''BF'',''BI'') AND A.PVSESTLIQ <> ''05'' THEN B.PVSLMONTO ELSE 0 END) TABLA,'
     +' MAX(CASE WHEN A.PVSESTLIQ = ''05'' THEN NVL(A.MONLIQBEN,0) ELSE 0 END) MONLIQREL, SUM(CASE WHEN TIPDES = ''FA'' AND A.PVSESTLIQ <> ''05'' THEN B.PVSLMONTO ELSE 0 END) APORTE,'
     +' SUM(CASE WHEN TIPDES = ''FI'' AND A.PVSESTLIQ <> ''05'' THEN B.PVSLMONTO ELSE 0 END) INTERES, SUM(CASE WHEN TIPDES = ''FB'' AND A.PVSESTLIQ <> ''05'' THEN B.PVSLMONTO ELSE 0 END) BONUS,'
     +' SUM(CASE WHEN TIPDES = ''MD'' AND A.PVSESTLIQ <> ''05'' THEN B.PVSLMONTO ELSE 0 END) DIFERENCIAL, MAX(NVL(A.MONLIQBEN,0)) MONLIQBEN,'
     +' MAX(NVL(MONDES,0)-NVL(MONDEV,0)) DESCUENTO, MAX(NVL(A.MONPAG,0)) MONPAG FROM PVS306 A, PVS307 B'
     +' WHERE A.PVSLFECBE >= '+QuotedStr(dtpfecinicio.Text)+' AND A.PVSLFECBE <= '+QuotedStr(dtpfecfinal.Text)
     +' AND A.PVSLBENNR = B.PVSLBENNR AND B.PVSLAGRID = ''DET'''
     +' AND A.PVSESTLIQ NOT IN (''04'',''13'') AND EXISTS (SELECT AA.ASOID FROM PVS301 AA'
     +' WHERE NVL(AA.DEPORIEXP,''XX'') = NVL((CASE WHEN '+QuotedStr(cbDepartamento.Text)+'= ''00'' THEN AA.DEPORIEXP ELSE '+ QuotedStr(cbDepartamento.Text) +' END),''XX'')'
     +' AND NVL(AA.OFIORIEXP,''XX'') = NVL((CASE WHEN '+ QuotedStr(cbOficina.Text)      +'= ''00'' THEN AA.OFIORIEXP ELSE '+ QuotedStr(cbOficina.Text)      +' END),''XX'')'
     +' AND AA.ASOID = A.ASOID AND AA.PVSEXPNRO = A.PVSEXPNRO) GROUP BY A.PVSLBENNR) A, PVS306 B, TGE186 C'
     +' WHERE A.PVSLBENNR = B.PVSLBENNR AND B.PVSLTIPBE = C.TIPBENEF   GROUP BY C.BENEFDES';
     // Fin: HPC_201805_PRE
     xSqlAExcel := xSql;
     Screen.Cursor := crHourGlass;
     DM1.cdsReporte.Close;
     DM1.cdsReporte.DataRequest(xSql);
     DM1.cdsReporte.Open;
     Screen.Cursor := CrDefault;
     // Fin: HPC_201709_PRE
     If DM1.cdsReporte.RecordCount = 0 Then
     Begin
        limpiagrid;
        MessageDlg('No existe información para mostrar', mtCustom, [mbOk], 0);
        btnprocesar.SetFocus;
        Exit;
     End;
     btnimprimir.Enabled := True;
     btnaexcel.Enabled   := True;
     // Inicio: HPC_201805_PRE 
     // Inicializa variables para totalizar los montos para el grid
     xTabla := 0;
     xmonliqrel := 0;
     xaporte := 0;
     xinteres := 0;
     xbonus := 0;
     xdiferencial := 0;
     xmonliqben := 0;
     xdescuento := 0;
     xmonpag := 0;
     // Fin: HPC_201805_PRE

     DM1.cdsReporte.First;
     While Not DM1.cdsReporte.Eof Do
     Begin
        xTabla       := xTabla       + DM1.cdsReporte.FieldByName('TABLA').AsFloat;  // SPP_201403_PRE
        // Inicio: HPC_201805_PRE
        // Se totaliza el monto de la liquidación x reliquidación
        xmonliqrel   := xmonliqrel   + DM1.cdsReporte.FieldByName('MONLIQREL').AsFloat;
        // Fin: HPC_201805_PRE
        xaporte      := xaporte      + DM1.cdsReporte.FieldByName('APORTE').AsFloat;
        xinteres     := xinteres     + DM1.cdsReporte.FieldByName('INTERES').AsFloat;
        xbonus       := xbonus       + DM1.cdsReporte.FieldByName('BONUS').AsFloat;
        xdiferencial := xdiferencial + DM1.cdsReporte.FieldByName('DIFERENCIAL').AsFloat;
        xmonliqben   := xmonliqben   + DM1.cdsReporte.FieldByName('MONLIQBEN').AsFloat;
        xdescuento   := xdescuento   + DM1.cdsReporte.FieldByName('DESCUENTO').AsFloat;
        xmonpag      := xmonpag      + DM1.cdsReporte.FieldByName('MONPAG').AsFloat;
        DM1.cdsReporte.Next;
     End;
     dbgreporte.Selected.Clear;
     dbgreporte.Selected.Add('BENEFDES'#9'35'#9'Tipo de Beneficio'#9#9);
     dbgreporte.Selected.Add('TABLA'#9'12'#9'Beneficio~x Tabla'#9#9);     // SPP_201403_PRE
     // Inicio: HPC_201805_PRE
     // Se añade columna de monto de liquidacion x reliquidación al grid
     dbgreporte.Selected.Add('MONLIQREL'#9'12'#9'Beneficio~x reliquidación'#9#9);
     // Fin: HPC_201805_PRE
     dbgreporte.Selected.Add('APORTE'#9'12'#9'Aporte'#9#9);
     dbgreporte.Selected.Add('INTERES'#9'12'#9'Interes'#9#9);
     dbgreporte.Selected.Add('BONUS'#9'12'#9'Bonus'#9#9);
     dbgreporte.Selected.Add('DIFERENCIAL'#9'12'#9'Diferencial'#9#9);
     dbgreporte.Selected.Add('MONLIQBEN'#9'12'#9'Monto de las~Liquidaciones'#9#9);
     dbgreporte.Selected.Add('DESCUENTO'#9'12'#9'Descuentos~Efectuados'#9#9);
     dbgreporte.Selected.Add('MONPAG'#9'12'#9'Monto~Desembolsado'#9#9);
     dbgreporte.ApplySelected;
     TNumericField(DM1.cdsReporte.FieldByName('TABLA')).DisplayFormat      := '#,###,##0.00'; // SPP_201403_PRE
     // Inicio: HPC_201805_PRE
     // Se añade formato a la columna de totales de monto de liquidacion x reliquidación
     TNumericField(DM1.cdsReporte.FieldByName('MONLIQREL')).DisplayFormat  := '#,###,##0.00';
     // Fin: HPC_201805_PRE
     TNumericField(DM1.cdsReporte.FieldByName('APORTE')).DisplayFormat      := '#,###,##0.00';
     TNumericField(DM1.cdsReporte.FieldByName('INTERES')).DisplayFormat     := '#,###,##0.00';
     TNumericField(DM1.cdsReporte.FieldByName('BONUS')).DisplayFormat       := '#,###,##0.00';
     TNumericField(DM1.cdsReporte.FieldByName('DIFERENCIAL')).DisplayFormat := '#,###,##0.00';
     TNumericField(DM1.cdsReporte.FieldByName('MONLIQBEN')).DisplayFormat   := '#,###,##0.00';
     TNumericField(DM1.cdsReporte.FieldByName('DESCUENTO')).DisplayFormat   := '#,###,##0.00';
     TNumericField(DM1.cdsReporte.FieldByName('MONPAG')).DisplayFormat      := '#,###,##0.00';
     dbgreporte.ColumnByName('BENEFDES').FooterValue := 'Total S/.';
     dbgreporte.ColumnByName('TABLA').FooterValue := FormatFloat('#,###,##0.00',xTabla);  // SPP_201403_PRE
     // Inicio: HPC_201805_PRE
     // Se asigna el valor de del total de liquidaciones x reliquidacion
     dbgreporte.ColumnByName('MONLIQREL').FooterValue := FormatFloat('#,###,##0.00',xmonliqrel);
     // Fin: HPC_201805_PRE
     dbgreporte.ColumnByName('APORTE').FooterValue := FormatFloat('#,###,##0.00',xaporte);
     dbgreporte.ColumnByName('INTERES').FooterValue := FormatFloat('#,###,##0.00',xinteres);
     dbgreporte.ColumnByName('BONUS').FooterValue := FormatFloat('#,###,##0.00',xbonus);
     dbgreporte.ColumnByName('DIFERENCIAL').FooterValue := FormatFloat('#,###,##0.00',xdiferencial);
     dbgreporte.ColumnByName('MONLIQBEN').FooterValue := FormatFloat('#,###,##0.00',xmonliqben);
     dbgreporte.ColumnByName('DESCUENTO').FooterValue := FormatFloat('#,###,##0.00',xdescuento);
     dbgreporte.ColumnByName('MONPAG').FooterValue := FormatFloat('#,###,##0.00',xmonpag);
   End;
   If rgtiprep.ItemIndex = 1 Then
   Begin
      // INICIO HPC_201610_PRE
      // MEJORA DE CONSULTA PARA ACEPTAR PARAMETROS OPCIONALES
      xSql :=
        ' SELECT A.ASOID,D.ASODNI,TO_DATE(PVSLFECBE) FECBEN, A.PVSLBENNR, '
      // Inicio: HPC_201805_PRE
      // Se añade el valor "(RE)" al de liquidación para los casos que sean reliquidacion
      // + '        A.ASOAPENOMDNI NOMASO, BENEFDES TIPO_BENEFICIO,MONLIQBEN MONLIQ,MONDES,MONPAG,NOMBEN,PVSLMONTO MONCOBBEN, '
      + '        A.ASOAPENOMDNI NOMASO, BENEFABR||CASE WHEN A.PVSESTLIQ = ''05'' THEN '' (RE)'' END TIPO_BENEFICIO, MONLIQBEN MONLIQ,MONDES,MONPAG,NOMBEN,PVSLMONTO MONCOBBEN, '
      // Fin: HPC_201805_PRE
      + '        ASOFECNAC, EXTRACT(YEAR FROM NUMTOYMINTERVAL(MONTHS_BETWEEN(TO_DATE(PVSLFECBE),ASOFECNAC),''month'')) EDAD, '
      + '        ASOSEXO SEXO,D.ASODIR DIRECCION, '
      + '        E.DPTODES DPTDOM,F.CIUDDES PRVDOM,G.ZIPDES DSTDOM ,D.ASOTELF1||'' ''||D.ASOTELF2 TELEFONOS, '
      + '        NOMBRE_COLEGIO, DIRECCION_COLEGIO, DEPARTAMENTO_COLEGIO, PROVINCIA_COLEGIO, DISTRITO_COLEGIO '
      + '   FROM PVS306 A, '
      + '        (SELECT PVSLBENNR,APEPATCOB||'' ''||APEMATCOB||'' ''||NOMCOB NOMBEN,PVSLMONTO '
      + '           FROM PVS307 '
      + '          WHERE PVSLAGRID = ''FPG'' AND FLGVOUCHER=''N'') B, TGE186 C,APO201 D,'
      + '        APO158 E,TGE121 F, TGE122 G, '
      + '      (SELECT A.ASOID, B.NOMCENEDU NOMBRE_COLEGIO '
      + '             ,B.DIREC   DIRECCION_COLEGIO, C.DPTODES DEPARTAMENTO_COLEGIO '
			+ '             ,D.CIUDDES PROVINCIA_COLEGIO, E.ZIPDES  DISTRITO_COLEGIO '
     	+ '         FROM APO201 A, ASO_CEN_EDU B, APO158 C, APO123 D, APO122 E '
      + '        WHERE A.CENEDUID = B.CENEDUID '
      + '          AND SUBSTR(B.UBIGEO_DIR, 1, 2) = C.DPTOID '
      + '	         AND SUBSTR(B.UBIGEO_DIR, 1, 4) = D.CIUDID '
      + '	         AND B.UBIGEO_DIR = E.ZIPID) H '
      + '  WHERE TO_DATE(PVSLFECBE) BETWEEN '+QuotedStr(dtpfecinicio.Text)+' AND '+QuotedStr(dtpfecfinal.Text)
      + '    AND PVSESTLIQ NOT IN (''04'',''13'') '
      + '    AND A.PVSLBENNR=B.PVSLBENNR(+) '
      + '    AND A.PVSLTIPBE=C.TIPBENEF(+) '
      + '    AND A.ASOID=D.ASOID(+) '
      + '    AND SUBSTR(D.ZIPID,1,2)=E.DPTOID(+) '
      + '    AND SUBSTR(D.ZIPID,1,2)=F.DPTOID(+) '
      + '    AND SUBSTR(D.ZIPID,3,2)=F.CIUDID(+) '
      + '    AND SUBSTR(D.ZIPID,1,2)=G.DPTOID(+) '
      + '    AND SUBSTR(D.ZIPID,3,2)=G.CIUDID(+) '
      + '    AND SUBSTR(D.ZIPID,5,2)=G.ZIPID(+) '
      + '    AND A.ASOID = H.ASOID(+) '
      + '    AND EXISTS (SELECT AA.ASOID '
      + '                  FROM PVS301 AA '
      + '                 WHERE NVL(AA.DEPORIEXP,''XX'') = NVL((CASE WHEN ' + QuotedStr(cbDepartamento.Text) + '= ''00'' THEN AA.DEPORIEXP ELSE ' + QuotedStr(cbDepartamento.Text) + ' END),''XX'') '
      + '                   AND NVL(AA.OFIORIEXP,''XX'') = NVL((CASE WHEN ' + QuotedStr(cbOficina.Text)      + '= ''00'' THEN AA.OFIORIEXP ELSE ' + QuotedStr(cbOficina.Text)      + ' END),''XX'') '
      + '                   AND AA.ASOID = A.ASOID '
      // Inicio: HPC_201706_PRE
      // Se cambia la busqueda del expediente de beneficio
      // + '                AND AA.PVSLBENNR = A.PVSLBENNR) '
      + '                   AND AA.PVSEXPNRO = A.PVSEXPNRO) '
      // Fin: HPC_201706_PRE

      + '  ORDER BY PVSLBENNR ';
      // FIN HPC_201610_PRE
      // Inicio: HPC_201709_PRE
      // Se adiciona el Qry a la variable para la exportación a excel
      xSqlAExcel := xSql;
      Screen.Cursor := crHourGlass;
      DM1.cdsReporte.Close;
      DM1.cdsReporte.DataRequest(xSql);
      DM1.cdsReporte.Open;
      Screen.Cursor := crDefault;
      // Fin: HPC_201709_PRE


      If DM1.cdsReporte.RecordCount = 0 Then
      Begin
        limpiagrid;
        MessageDlg('No existe información para mostrar', mtCustom, [mbOk], 0);
        btnprocesar.SetFocus;
        Exit;
      End;
      btnaexcel.Enabled   := True;
      dbgreporte.Selected.Clear;
      dbgreporte.GroupFieldName := 'PVSLBENNR';
      // INICIO HPC_201610_PRE
      // AGREGA CAMPOS AL GRID
      dbgreporte.Selected.Add('ASODNI'#9'11'#9'DNI'#9#9);
      dbgreporte.Selected.Add('PVSLBENNR'#9'11'#9'Número de~Liquidación'#9#9);
      dbgreporte.Selected.Add('FECBEN'#9'10'#9'Fecha del~Beneficio'#9#9);
      dbgreporte.Selected.Add('NOMBEN'#9'45'#9'Apellidos y nombre(s)~del Beneficiario'#9#9);
      dbgreporte.Selected.Add('TIPO_BENEFICIO'#9'18'#9'Tipo de~Beneficio'#9#9);
      dbgreporte.Selected.Add('MONLIQ'#9'12'#9'Monto de la~liquidación'#9#9);
      dbgreporte.Selected.Add('MONDES'#9'12'#9'Monto descontado~de la liquidación'#9#9);
      dbgreporte.Selected.Add('MONCOBBEN'#9'12'#9'Monto Pagado~de la liquidación'#9#9);
      dbgreporte.Selected.Add('EDAD'#9'2'#9'Edad~del asociado'#9#9);
      dbgreporte.Selected.Add('SEXO'#9'1'#9'Sexo del~asociado'#9#9);
      dbgreporte.Selected.Add('DIRECCION'#9'60'#9'Dirección del~domicilio'#9#9);
      dbgreporte.Selected.Add('DPTDOM'#9'15'#9'Departamento~domiciliario'#9#9);
      dbgreporte.Selected.Add('PRVDOM'#9'15'#9'Provincia~domiciliario'#9#9);
      dbgreporte.Selected.Add('DSTDOM'#9'25'#9'Distrito~domiciliario'#9#9);
      dbgreporte.Selected.Add('TELEFONOS'#9'25'#9'Telefonos'#9#9);
      dbgreporte.Selected.Add('NOMBRE_COLEGIO'#9'25'#9'Nombre de colegio'#9#9);
      dbgreporte.Selected.Add('DIRECCION_COLEGIO'#9'25'#9'Direccion de colegio'#9#9);
      dbgreporte.Selected.Add('DEPARTAMENTO_COLEGIO'#9'25'#9'Departamento de colegio'#9#9);
      dbgreporte.Selected.Add('PROVINCIA_COLEGIO'#9'25'#9'Provincia de colegio'#9#9);
      dbgreporte.Selected.Add('DISTRITO_COLEGIO'#9'25'#9'Distrito de colegio'#9#9);
      // FIN HPC_201610_PRE
      dbgreporte.ApplySelected;
   End;
end;

// Inicio: HPC_201709_PRE
// Opción para exportar a excel la información a excel
procedure TFLiqxTipBen.btnaexcelClick(Sender: TObject);
begin
   // DM1.ExportaGridExcel(dbgreporte, 'PRE_REPXTIPBEN');
   DM1.cdsReporte1.Close;
   DM1.cdsReporte1.DataRequest(xSqlAExcel);
   DM1.cdsReporte1.Open;
   If rgtiprep.ItemIndex = 0 Then
      DM1.HojaExcel('LIQxTIPO_BEN',DM1.dsReporte1, dbgAExcel)
   Else
      DM1.HojaExcel('LIQ_DETxDAT_UBI',DM1.dsReporte1, dbgAExcel);
end;
// Fin: HPC_201709_PRE

procedure TFLiqxTipBen.btncerrarClick(Sender: TObject);
begin
   FLiqxTipBen.Close;
end;

procedure TFLiqxTipBen.limpiagrid;
begin
  If DM1.cdsReporte.Active = True Then DM1.cdsReporte.Close;
  btnimprimir.Enabled := False;
  btnaexcel.Enabled   := False;
  dbgreporte.Selected.Clear;
end;

procedure TFLiqxTipBen.btnimprimirClick(Sender: TObject);
begin
   pplFechas.Caption := 'DEL '+dtpfecinicio.Text+' AL '+dtpfecfinal.Text;
   pplUsuario.Caption := 'Usuario : '+DM1.wUsuario;
   // pplfechahora.Caption := 'Fecha y hora de impresiòn : '+DateToStr(Date)+' - '+TimeToStr(Time);
   pprResxTipBen.Print;
end;

procedure TFLiqxTipBen.FormKeyPress(Sender: TObject; var Key: Char);
begin
 If Key = #13 Then
  begin
    Key := #0;
    Perform(CM_DIALOGKEY, VK_TAB, 0);
  end;
end;




procedure TFLiqxTipBen.dtpfecinicioClick(Sender: TObject);
begin
   limpiagrid;
end;

procedure TFLiqxTipBen.dtpfecinicioChange(Sender: TObject);
begin
   limpiagrid;
end;

procedure TFLiqxTipBen.dtpfecfinalChange(Sender: TObject);
begin
   limpiagrid;
end;

procedure TFLiqxTipBen.rgtiprepClick(Sender: TObject);
begin
   limpiagrid;
   If rgtiprep.ItemIndex = 0 Then
      btnimprimir.Visible :=  True
   Else
      btnimprimir.Visible :=  False;
end;

// INICIO HPC_201610_PRE
// PARAMETROS DE INICIO
(******************************************************************************)
procedure TFLiqxTipBen.FormCreate(Sender: TObject);
Var xsSQL:String;
begin 
  // Inicio: HPC_201709_PRE 
  // Limpia las variables para un nuevo filtro
  limpiagrid;
  // Fin: HPC_201709_PRE
  DM1.FG_CONECTA_CDS(xxCdsQryDepartamento, xxDsQryDepartamento);
  DM1.FG_CONECTA_CDS(xxCdsQryOficina, xxDsQryOficina);
  xsSQL :=
     ' SELECT ''00'' DPTOID, ''TODOS LOS DEPARTAMENTOS'' DPTODES FROM DUAL '
   + ' UNION ALL '
   + ' SELECT DPTOID, DPTODES FROM APO158 ORDER BY DPTOID';
  xxCdsQryDepartamento.Close;
  xxCdsQryDepartamento.DataRequest(xsSQL);
  xxCdsQryDepartamento.Open;
  cbDepartamento.LookupTable := xxCdsQryDepartamento;
  cbDepartamento.LookupField := 'DPTOID';
  cbDepartamento.Selected.Clear;
  cbDepartamento.Selected.Add('DPTOID'#9'2'#9'Código'#9#9);
  cbDepartamento.Selected.Add('DPTODES'#9'25'#9'Nombre del departamento'#9#9);
  cbDepartamento.LookupValue := xxCdsQryDepartamento.fieldbyname('DPTOID').AsString;
  cbDepartamentoChange(nil);
end;
// FIN HPC_201610_PRE

// INICIO HPC_201610_PRE
// CAMBIO DE DEPARTAMENTO
(******************************************************************************)
procedure TFLiqxTipBen.cbDepartamentoChange(Sender: TObject);
var xsSQL : String;
begin
   xsSQL :=
      ' SELECT ''00'' OFDESID, ''TODAS LAS OFICINAS'' OFDESNOM FROM DUAL '
    + '  UNION ALL '
    + ' SELECT OFDESID, OFDESNOM '
    + '   FROM DB2ADMIN.APO110 '
    + '  WHERE DPTOID = ' + QuotedStr(cbDepartamento.Text)
    + '    AND DISTID IS NOT NULL '
    + '    AND OFDESNOM NOT LIKE ''BAZAR%'' '
    + '  ORDER BY OFDESID ';
   xxCdsQryOficina.Close;
   xxCdsQryOficina.DataRequest(xsSQL);
   xxCdsQryOficina.Open;
   cbOficina.LookupTable := xxCdsQryOficina;
   cbOficina.LookupField := 'OFDESID';
   cbOficina.Selected.Clear;
   cbOficina.Selected.Add('OFDESID'#9'2'#9'Oficina ID');
   cbOficina.Selected.Add('OFDESNOM'#9'20'#9'Oficina');
   cbOficina.LookupValue := xxCdsQryOficina.fieldbyname('OFDESID').AsString;

   If cbDepartamento.Text = '' Then edtDepartamento.Text := '';
   If Length(cbDepartamento.Text) = 2 then Begin
      If xxCdsQryDepartamento.Locate('DPTOID', cbDepartamento.Text, []) Then Begin
            edtDepartamento.Text := xxCdsQryDepartamento.FieldByName('DPTODES').AsString;
      End Else Begin
         MessageDlg('Departamento no válido', mtInformation, [mbOk], 0);
         cbDepartamento.Text := '';
         edtDepartamento.Text := '';
         cbDepartamento.SetFocus;
      End;
   End;
end;
// FIN HPC_201610_PRE

// INICIO HPC_201610_PRE
// CAMBIO DE OFICINA
(******************************************************************************)
procedure TFLiqxTipBen.cbOficinaChange(Sender: TObject);
begin
  If cbOficina.Text = '' Then edtOficina.Text := '';
  If Length(cbOficina.Text) = 2 then Begin
    If xxCdsQryOficina.Locate('OFDESID', cbOficina.Text, []) Then Begin
      edtOficina.Text := xxCdsQryOficina.FieldByName('OFDESNOM').AsString;
    End Else Begin
      MessageDlg('SELECCIONE UNA OFICINA', mtInformation, [mbOk], 0);
      edtOficina.Text := '';
      cbOficina.SetFocus;
    End;
  End;
end;
// FIN HPC_201610_PRE

// INICIO HPC_201610_PRE
// CIERRE DE FORMULARIO
(******************************************************************************)
procedure TFLiqxTipBen.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM1.cdsReporte.Close;
  Action := caFree
end;
// FIN HPC_201610_PRE

end.
