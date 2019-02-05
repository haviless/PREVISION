// Inicio Uso Estándares: 01/08/2011
// Unidad               : PRE274
// Formulario           : frepliqanu
// Fecha de Creación    : 16/07/2014
// Autor                : Area de desarrollo de sistemas.
// Objetivo             : Liquidaciones de beneficios
//
// Actualizaciones      :
// HPC_201307_PRE : Se añade nuevo logo institucional
// SPP_201401_PRE : Se realiza el pase a producción a partir del pase HPC_201307_PRE
// HPC_201402_PRE : Se modifica reporte de liquidaciones anuladas. Se añade el campo origen del expediente de la liquidación.
// SPP_201403_PRE : Se realiza el pase a producción a partir del pase HPC_201402_PRE.
// HPC_201506_PRE : Modificacion del reporte de liquidaciones anuladas. Se desarrolla quiebres por departamento y se adiciona un reporte resumen por departamento.
// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
// HPC_201610_PRE : CREAR Y MODIFICAR INDICADORES DE CALIDAD
// HPC_201705_PRE : Se modifica reporte de liquidaciones anuladas.
//                  Se modifica el reportes para que no haga salto de pagina cada
//                  vez que se cambia de grupo.
// HPC_201709_PRE : Se añade columna donde se especifica si la liquidación es anulada o extornada.

unit PRE274;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, wwdblook, wwdbdatetimepicker,
  ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE,
  DBGrids, Grids, Wwdbigrd, Wwdbgrid, ppBands, ppCtrls, ppVar, ppPrnabl,
  // Inicio: HPC_201506_PRE
  // Se añade automaticamente controles para los sub reportes
  // ppCache, ppParameter,db, jpeg, Wwdbdlg;  // SPP_201403_PRE
  // INICIO HPC_201610_PRE
  // DECLARACION DE PAQUETES
  ppCache, ppParameter,db, jpeg, Wwdbdlg, ppStrtch, ppSubRpt, Wwdatsrc,
  DBClient, wwclient;  // SPP_201403_PRE
  // FIN HPC_201610_PRE
  // Fin: HPC_201506_PRE

type
  Tfrepliqanu = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dbdtpinicial: TwwDBDateTimePicker;
    dbdtpfinal: TwwDBDateTimePicker;
    btnImprimePrevio: TBitBtn;
    dbgreporte: TwwDBGrid;
    btnimprimir: TBitBtn;
    btnaexcel: TBitBtn;
    btncerrar: TBitBtn;
    // Inicio: HPC_201506_PRE
    // Para controlar Qry del reporte detalle
    // bdepreporte: TppBDEPipeline;
    bdedetalle: TppBDEPipeline;
    // Fin: HPC_201506_PRE
    ppreporte: TppReport;
    ppParameterList1: TppParameterList;
    ppHeaderBand3: TppHeaderBand;
    ppShape31: TppShape;
    ppShape32: TppShape;
    ppShape33: TppShape;
    ppShape34: TppShape;
    ppShape35: TppShape;
    ppShape36: TppShape;
    ppShape38: TppShape;
    ppShape39: TppShape;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel76: TppLabel;
    ppltitdpt01: TppLabel;
    ppltitdpt02: TppLabel;
    ppLabel99: TppLabel;
    ppLabel118: TppLabel;
//Inicio: SPP_201401_PRE
    // ppLabel121: TppLabel; 
    // ppLabel122: TppLabel; 
    // ppLabel123: TppLabel; 
    // ppImage1: TppImage; 
//Fin: SPP_201401_PRE
    ppDetailBand3: TppDetailBand;
    ppDBText21: TppDBText;
    ppDBText24: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    // Inicio: HPC_201506_PRE
    // Modificación del reporte detalle
    // ppSummaryBand3: TppSummaryBand;
    // Fin: HPC_201506_PRE
    pplimpresopor01: TppLabel;
    ppLabel87: TppLabel;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppLabel79: TppLabel;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    ppSystemVariable9: TppSystemVariable;
    ppLabel85: TppLabel;
    ppLabel97: TppLabel;
    ppLabel98: TppLabel;
    ppDBText1: TppDBText;
    DBGrid1: TDBGrid;
    ppDBText2: TppDBText;
    ppImage1: TppImage; // SPP_201401_PRE
    // Inicio: SPP_201403_PRE
    Label3: TLabel;
    dblcdptoid: TwwDBLookupComboDlg;
    Panel1: TPanel;
    medesdpto: TEdit;
    // Inicio: HPC_201709_PRE
    // Se retira variable no usada
    // ppDBText3: TppDBText;
    // Fin: HPC_201709_PRE

    // Inicio: HPC_201705_PRE
    // Se retiran variables del reporte
    // // Inicio: HPC_201506_PRE
    // // Nuevas variables creadas automaticamente para los reportes
    // ppGroup1: TppGroup;
    // ppGroupHeaderBand1: TppGroupHeaderBand;
    // ppGroupFooterBand1: TppGroupFooterBand;
    // ppLabel3: TppLabel;
    // Fin: HPC_201705_PRE

    // Inicio: HPC_201705_PRE    
    // Se añaden nuevas variables del reporte
    rgtiprep: TRadioGroup;
    ppLabel2: TppLabel;
    ppLine2: TppLine;
    // Inicio: HPC_201709_PRE
    // Se retira variable no usada
    // ppDBText4: TppDBText;
    // ppGroup2: TppGroup;
    // ppGroupHeaderBand2: TppGroupHeaderBand;
    // ppGroupFooterBand2: TppGroupFooterBand;
    // ppDBCalc3: TppDBCalc;
    // ppDBCalc4: TppDBCalc;
    // ppLine3: TppLine;
    // pplpiegrupo: TppLabel;
    // Fin: HPC_201709_PRE
    ppShape2: TppShape;
    ppLabel4: TppLabel;
    // Inicio: HPC_201705_PRE
    // Se retiran variables del reporte
    // ppLabel4: TppLabel;
    // ppShape2: TppShape;
    // ppDBText4: TppDBText;
    // ppLine2: TppLine;
    // Fin: HPC_201705_PRE

    // Inicio: HPC_201705_PRE
    // Se retira variable del reporte
    // ppLabel2: TppLabel;
    // Fin: HPC_201705_PRE

    bderesumen: TppBDEPipeline;
    ppSummaryBand2: TppSummaryBand;
    rgtipo: TRadioGroup;
    pprResumen: TppReport;
    ppDetailBand1: TppDetailBand;
    ppParameterList2: TppParameterList;
    ppTitleBand1: TppTitleBand;
    ppSummaryBand1: TppSummaryBand;
    ppltitres01: TppLabel;
    ppltitres02: TppLabel;
    ppLabel7: TppLabel;
    ppImage2: TppImage;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel11: TppLabel;
    ppShape1: TppShape;
    // ppLabel2: TppLabel; 
    ppShape3: TppShape;
    ppLabel14: TppLabel;
    ppShape4: TppShape;
    ppLabel15: TppLabel;
    ppShape5: TppShape;
    ppLabel16: TppLabel;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppLabel17: TppLabel;
    ppLine4: TppLine;
    ppLine5: TppLine;
    pplusuariores: TppLabel;
    // Fin: HPC_201506_PRE
    // Fin: SPP_201403_PRE
// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel18: TppLabel;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    // INICIO HPC_201610_PRE
    // DECLARACION DE VARIABLES
    Panel2: TPanel;
    edtOficina: TMaskEdit;
    cbOficina: TwwDBLookupCombo;
    Label6: TLabel;
    // Inicio: HPC_201709_PRE
    // Nuevas variables a mostrar en el reporte de liquidaciones anuladas
    ppShape6: TppShape;
    ppLabel3: TppLabel;
    ppLabel19: TppLabel;
    ppDBText11: TppDBText;
    dbgAExcel: TDBGrid;
    ppDBText12: TppDBText;
    ppLine3: TppLine;
    pplpiegrupo: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText3: TppDBText;
    // Fin: HPC_201709_PRE
    // FIN HPC_201610_PRE
// Fin    HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
    procedure btnImprimePrevioClick(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btncerrarClick(Sender: TObject);
    procedure btnaexcelClick(Sender: TObject);
    // Inicio: SPP_201403_PRE
    procedure FormActivate(Sender: TObject); 
    procedure dblcdptoidChange(Sender: TObject);
    // Inicio: HPC_201506_PRE
    // Control del radio group
    procedure rgtipoClick(Sender: TObject);
    // INICIO HPC_201610_PRE
    // DECLARACION DE PROCEDIMIENTOS
    procedure cbOficinaChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    // Inicio: HPC_201705_PRE
    // Imprime el nombre del departamento al final del grupo.
    procedure pplpiegrupoPrint(Sender: TObject);
    // Fin: HPC_201705_PRE
    // FIN HPC_201610_PRE
    // Fin: HPC_201506_PRE
    // Fin: SPP_201403_PRE
  private
    // Inicio: HPC_201709_PRE
    // Se crean variables para ser usadas en los Qrys de grid y exportación a excel
    xSql, xSqlAExcel:String;
    // Fin: HPC_201709_PRE
    { Private declarations }
    // INICIO HPC_201610_PRE
    // DECLARACION DE VARIABLES
    xxCdsQryOficina : TwwClientDataSet;
     xxDsQryOficina : TwwDataSource;
    // FIN HPC_201610_PRE
  public
    { Public declarations }
  end;

var
  frepliqanu: Tfrepliqanu;

implementation

uses PREDM;

{$R *.dfm}

procedure Tfrepliqanu.btnImprimePrevioClick(Sender: TObject);
// Inicio: HPC_201705_PRE
// Se añade variable para controlar el tipo de liquidación a mostrar 
// Var xSql:String;
// Inicio: HPC_201709_PRE
// Se retira variable local. Se envia al private  
// Var xSql, xtipoliq:String;
Var xtipoliq:String;
// Fin: HPC_201709_PRE

// Fin: HPC_201705_PRE
    // Inicio: HPC_201506_PRE
    // Se crean variables para controlar los totales en el reporte resumen.
    xncantidad, xnmonto: Double;
    // Fin: HPC_201506_PRE
begin
   // Inicio: HPC_201506_PRE
   If Trim(dbdtpinicial.Text) = '' Then
   Begin
      MessageDlg('Error!! Debe ingresar la fecha inicial. Verifique', mtInformation, [mbOk], 0);
      dbdtpinicial.SetFocus;
      Exit;
   End;

   If Trim(dbdtpfinal.Text) = '' Then
   Begin
      MessageDlg('Error!! Debe ingresar la fecha final. Verifique', mtInformation, [mbOk], 0);
      dbdtpfinal.SetFocus;
      Exit;
   End;

   // INICIO HPC_201610_PRE
   // VALIDA INGRESO DE PARAMETROS
   If (dblcdptoid.Enabled = True) AND (Trim(dblcdptoid.Text) = '') Then Begin
      MessageDlg('SELECCIONE EL DEPARTAMENTO', mtInformation, [mbOk], 0);
      dblcdptoid.SetFocus;
      Exit;
   End;

   If (cbOficina.Enabled = True) AND (Trim(cbOficina.Text) = '') Then Begin
      MessageDlg('SELECCIONE LA OFICINA', mtInformation, [mbOk], 0);
      cbOficina.SetFocus;
      Exit;
   End;
   // FIN HPC_201610_PRE
   // Inicio: HPC_201705_PRE
   // Se llena la variable con el tipo de liquidación a mostrar
   If rgtiprep.ItemIndex = 0 Then xtipoliq := ' AND A.PVSESTLIQ IN (''04'',''13'')';
   If rgtiprep.ItemIndex = 1 Then xtipoliq := ' AND A.PVSESTLIQ IN (''13'')';
   If rgtiprep.ItemIndex = 2 Then xtipoliq := ' AND A.PVSESTLIQ IN (''04'')';
   // Fin: HPC_201705_PRE

   If rgtipo.ItemIndex = 0 Then
   Begin
      // INICIO HPC_201610_PRE
      // MEJORA DE CONSULTA PARA PARAMETROS OPCIONALES

      // Inicio: HPC_201705_PRE
      // Se modifica el Qry en el cual solo se tomara información del detalle
      // xSql :=
      //    ' SELECT SUBSTR(A.PVSLBENNR,5,7) PVSLBENNR, TO_DATE(A.PVSLFECBE) PVSLFECBE, A.USUARIO, B.BENEFABR BENEFDES'
      //  + '       ,SUBSTR(A.ASOAPENOMDNI,1,45) ASOAPENOMDNI, A.MONLIQBEN, TO_DATE(A.PVSFANUL) PVSFANUL '
      //  + '       ,A.PVSUSUANUL, A.PVSMOTANUL, NVL(D.DPTODES,''NO IDENTIFICADO'') DPTODES, NUMOPEBAN, FECOPEBAN, '
      //  + ' CASE WHEN A.PVSESTLIQ = ''04'' THEN ''EXTORNADO'' WHEN A.PVSESTLIQ = ''13'' THEN ''ANULADO'' END ESTADLIQ '
      //  + '   FROM PVS306 A, TGE186 B '
      //  + '       ,(SELECT ASOID, MAX(SUBSTR(DISORIEXP,1,2)) DPTOID '
      //  + '           FROM PVS301 '
      //  + '          WHERE PVSESTADO NOT IN (''04'',''13'') '
      //  + '            AND NVL(OFIORIEXP,''XX'') = NVL((CASE WHEN ' + QuotedStr(cbOficina.Text) + '= ''00'' THEN OFIORIEXP ELSE ' + QuotedStr(cbOficina.Text) + ' END),''XX'') '
      //  + '            AND DISORIEXP IS NOT NULL '
      //  + '          GROUP BY ASOID) C, APO158 D'
      //  + ' WHERE A.PVSFANUL >= '+QuotedStr(dbdtpinicial.Text)
      //  + '   AND A.PVSFANUL <= '+QuotedStr(dbdtpfinal.Text)
      //  // + '   AND PVSESTLIQ IN (''04'',''13'') '
      //  + xtipoliq
      //  + '   AND A.PVSLTIPBE = B.TIPBENEF'
      //  + '   AND A.ASOID = C.ASOID(+) '
      //  + '   AND NVL(C.DPTOID,''XX'') = NVL((CASE WHEN ' + QuotedStr(dblcdptoid.Text) + '= ''00'' THEN C.DPTOID ELSE ' + QuotedStr(dblcdptoid.Text) + ' END),''XX'') '
      //  + '   AND C.DPTOID=D.DPTOID(+) '
      //  + ' ORDER BY DPTODES ';

      // Inicio: HPC_201709_PRE
      // Se añade columna especificando el estado de la liquidación, se modifican nombres del columnas
      // xSql := 'SELECT SUBSTR(A.PVSLBENNR,5,7) PVSLBENNR, TO_DATE(A.PVSLFECBE) PVSLFECBE, A.USUARIO, B.BENEFABR BENEFDES,'
      // +' SUBSTR(A.ASOAPENOMDNI,1,45) ASOAPENOMDNI, A.MONLIQBEN, TO_DATE(A.PVSFANUL) PVSFANUL ,A.PVSUSUANUL,'
      // +' A.PVSMOTANUL, NVL(D.DPTODES,''NO IDENTIFICADO'') DPTODES, NUMOPEBAN, FECOPEBAN,'
      // +' CASE WHEN A.PVSESTLIQ = ''04'' THEN ''EXTORNADO'' WHEN A.PVSESTLIQ = ''13'' THEN ''ANULADO'' END ESTADLIQ, E.OFDESNOM'
      xSql := 'SELECT SUBSTR(A.PVSLBENNR,5,7) NUMERO_LIQUIDACION, TO_DATE(A.PVSLFECBE) FECHA_LIQUIDACION, A.USUARIO USUARIO_QUE_LIQUIDA,'
      +' B.BENEFABR DESC_BENEFICIO, SUBSTR(A.ASOAPENOMDNI,1,45) APELLIDOS_Y_NOMBRES_ASOCIADO, A.MONLIQBEN MONTO_LIQUIDACION,'
      +' TO_DATE(A.PVSFANUL) FECHA_ANULACION, A.PVSUSUANUL USUARIO_ANULACION, A.PVSMOTANUL MOTIVO_ANULACION, NVL(D.DPTODES,''NO IDENTIFICADO'') DEPART_ORIGEN,'
      +' NUMOPEBAN NUM_OPER_EXTORNO, FECOPEBAN FEC_OPER_EXTORNO,'
      // +' CASE WHEN A.PVSESTLIQ = ''04'' THEN ''EXTORNADO'' WHEN A.PVSESTLIQ = ''13'' THEN ''ANULADO'' END ESTADLIQ, E.OFDESNOM'
      +' CASE WHEN A.PVSESTLIQ = ''04'' THEN ''EXT'' WHEN A.PVSESTLIQ = ''13'' THEN ''ANU'' END ESTADO_LIQUIDACION, E.OFDESNOM OFICINA_ORIGEN_EXPEDIENTE'
      // Fin: HPC_201709_PRE
      +' FROM PVS306 A, TGE186 B, PVS301 C, APO158 D, APO110 E'
      + ' WHERE A.PVSFANUL >= '+QuotedStr(dbdtpinicial.Text)+' AND A.PVSFANUL <= '+QuotedStr(dbdtpfinal.Text)
      + xtipoliq
      + ' AND A.PVSLTIPBE = B.TIPBENEF'
      +' AND A.ASOID = C.ASOID AND  A.PVSEXPNRO = C.PVSEXPNRO';
      If cbOficina.Text <> '00' Then
          xSql := xSql + ' AND C.DEPORIEXP = '+QuotedStr(dblcdptoid.Text)+' AND C.OFIORIEXP = '+QuotedStr(cbOficina.Text);
      If (dblcdptoid.Text <> '00') And (cbOficina.Text = '00') Then
          xSql := xSql + ' AND C.DEPORIEXP = '+QuotedStr(dblcdptoid.Text);
      xSql := xSql + ' AND C.DEPORIEXP = D.DPTOID AND C.OFIORIEXP = E.OFDESID(+) ORDER BY DPTODES';
      // Fin: HPC_201705_PRE
   End
   Else
   Begin
      // Inicio: HPC_201705_PRE
      // Se modifica el Qry en el cual solo se tomara información del detalle
      // xSql := 'SELECT ROWNUM NUMERO, DPTODES, MONLIQBEN, CANTIDAD FROM ('
      // +' SELECT D.DPTOID, NVL(D.DPTODES,''NO IDENTIFICADO'') DPTODES, SUM(NVL(A.MONLIQBEN,0)) MONLIQBEN, COUNT(*) CANTIDAD'
      // +' FROM PVS306 A, TGE186 B, (SELECT ASOID, MAX(SUBSTR(DISORIEXP,1,2)) DPTOID FROM PVS301 WHERE PVSESTADO NOT IN (''04'',''13'')'
      // +' AND DISORIEXP IS NOT NULL GROUP BY ASOID) C, APO158 D WHERE A.PVSFANUL >= '+QuotedStr(dbdtpinicial.Text)+' AND A.PVSFANUL <= '+QuotedStr(dbdtpfinal.Text)
      // +' AND PVSESTLIQ IN (''04'',''13'') AND A.PVSLTIPBE = B.TIPBENEF AND A.ASOID = C.ASOID(+) AND C.DPTOID=D.DPTOID(+)'
      // +' GROUP BY D.DPTOID, NVL(D.DPTODES,''NO IDENTIFICADO'')'
      // +' ORDER BY D.DPTOID, NVL(D.DPTODES,''NO IDENTIFICADO''))';
      // Inicio: HPC_201709_PRE
      // Se modifican los nombres de las columnas
      // xSql := 'SELECT ROWNUM NUMERO, DPTODES, MONLIQBEN, CANTIDAD FROM ('
      xSql := 'SELECT ROWNUM NUMERO_REGISTRO, DPTODES DESC_DEPAR_ORIGEN, MONLIQBEN MONTO_LIQUIDACION, CANTIDAD CANTIDAD_LIQUIDACION FROM ('
      // Fin: HPC_201709_PRE
      +' SELECT D.DPTOID, NVL(D.DPTODES,''NO IDENTIFICADO'') DPTODES, SUM(NVL(A.MONLIQBEN,0)) MONLIQBEN, COUNT(*) CANTIDAD'
      +' FROM PVS306 A, TGE186 B, PVS301 C, APO158 D'
      +' WHERE A.PVSFANUL >= '+QuotedStr(dbdtpinicial.Text)+' AND A.PVSFANUL <= '+QuotedStr(dbdtpfinal.Text)+' AND A.PVSESTLIQ IN (''04'',''13'')'
      + xtipoliq
      +' AND A.PVSLTIPBE = B.TIPBENEF'
      +' AND A.ASOID = C.ASOID AND A.PVSEXPNRO = C.PVSEXPNRO'
      +' AND C.DEPORIEXP = D.DPTOID(+) GROUP BY D.DPTOID, NVL(D.DPTODES,''NO IDENTIFICADO'') ORDER BY D.DPTOID, NVL(D.DPTODES,''NO IDENTIFICADO''))';
      // Fin: HPC_201705_PRE
   End;
   // Inicio: HPC_201709_PRE
   // Se actualizan variables para su exportación a Excel
   xSqlAExcel := xSql;
   // Fin: HPC_201709_PRE
   DM1.cdsReporte.Close;
   DM1.cdsReporte.DataRequest(xSql);
   DM1.cdsReporte.Open;
   // Inicio: HPC_201709_PRE
   // Se actualizan variables con la finalidad de sumarizar los totales
   xncantidad := 0;
   xnmonto := 0;
   While Not DM1.cdsReporte.Eof Do
   Begin
      If rgtipo.ItemIndex = 1 Then
         xncantidad := xncantidad + DM1.cdsReporte.FieldByName('CANTIDAD_LIQUIDACION').AsFloat
      Else
         xncantidad := xncantidad  + 1;
      xnmonto:= xnmonto + DM1.cdsReporte.FieldByName('MONTO_LIQUIDACION').AsFloat;
      DM1.cdsReporte.Next;
   End;
   If rgtipo.ItemIndex = 0 Then
   Begin
      dbgreporte.Selected.Clear;
      // Inicio: HPC_201705_PRE
      // Se añade columna al grid "Estado de la liquidación"
      dbgreporte.Selected.Add('ESTADO_LIQUIDACION'#9'12'#9'Estado de~ la liquidación'#9#9);
      // Fin: HPC_201705_PRE
      dbgreporte.Selected.Add('NUMERO_LIQUIDACION'#9'11'#9'Número de~la liquidación'#9#9);
      dbgreporte.Selected.Add('FECHA_LIQUIDACION'#9'10'#9'Fecha de~la liquidación'#9#9);
      // Inicio: HPC_201705_PRE
      // Se añade columna al grid "Usuario que liquida."
      dbgreporte.Selected.Add('USUARIO_QUE_LIQUIDA'#9'13'#9'Usuario~creación'#9#9);
      // Fin: HPC_201705_PRE
      dbgreporte.Selected.Add('DESC_BENEFICIO'#9'13'#9'Tipo de~beneficio'#9#9);
      dbgreporte.Selected.Add('APELLIDOS_Y_NOMBRES_ASOCIADO'#9'35'#9'Apellidos y nombre(s)~del beneficiario'#9#9);
      dbgreporte.Selected.Add('MONTO_LIQUIDACION'#9'15'#9'Monto~liquidación'#9#9);
      // Inicio: HPC_201705_PRE
      // Se añade columna al grid "Fecha de anulación."
      dbgreporte.Selected.Add('FECHA_ANULACION'#9'10'#9'Fecha~Anu./Ext.'#9#9);
      // Se modifica descripción de las columnas en el grid
      // dbgreporte.Selected.Add('PVSUSUANUL'#9'13'#9'Usuario~anulación'#9#9);
      dbgreporte.Selected.Add('USUARIO_ANULACION'#9'13'#9'Usuario~Anu./Ext.'#9#9);
      //dbgreporte.Selected.Add('PVSMOTANUL'#9'47'#9'Motivo de la anulación'#9#9);
      dbgreporte.Selected.Add('MOTIVO_ANULACION'#9'47'#9'Motivo de la Anu./Ext.'#9#9);
      // Fin: HPC_201705_PRE
      dbgreporte.Selected.Add('DEPART_ORIGEN'#9'15'#9'Departamento~Origen Expediente'#9#9); //SPP_201403_PRE
      // Inicio: HPC_201705_PRE
      // Se añade columna al grid "Fecha de anulación."
      dbgreporte.Selected.Add('OFICINA_ORIGEN_EXPEDIENTE'#9'25'#9'Oficina~Origen Expediente'#9#9); //SPP_201403_PRE
      // Fin: HPC_201705_PRE
// Inicio HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
      dbgreporte.Selected.Add('NUM_OPER_EXTORNO'#9'11'#9'Número~Operación'#9#9);
      dbgreporte.Selected.Add('FEC_OPER_EXTORNO'#9'11'#9'Fecha~Operación'#9#9);
// Fin    HPC_201604_PRE : Contabilizar Extornos y Modificar forma de pago y Beneficios
      dbgreporte.ApplySelected;
      dbgreporte.ColumnByName('PVSLBENNR').FooterValue := FormatFloat('###,###,##0', xncantidad) ;
      TNumericField(DM1.cdsReporte.FieldByName('MONTO_LIQUIDACION')).DisplayFormat := '###,###,##0.00';
      dbgreporte.ColumnByName('MONTO_LIQUIDACION').FooterValue := FormatFloat('###,###,##0.00', xnmonto) ;

   End
   Else
   Begin
      dbgreporte.Selected.Clear;
      dbgreporte.Selected.Add('NUMERO_REGISTRO'#9'5'#9'Item'#9#9);
      dbgreporte.Selected.Add('DESC_DEPAR_ORIGEN'#9'25'#9'Departamento'#9#9);
      dbgreporte.Selected.Add('MONTO_LIQUIDACION'#9'13'#9'Total Liquidación'#9#9);
      dbgreporte.Selected.Add('CANTIDAD_LIQUIDACION'#9'6'#9'Cantidad'#9#9);
      dbgreporte.ApplySelected;
      TNumericField(DM1.cdsReporte.FieldByName('MONTO_LIQUIDACION')).DisplayFormat := '###,###,##0.00';
      TNumericField(DM1.cdsReporte.FieldByName('CANTIDAD_LIQUIDACION')).DisplayFormat := '###,###,##0';
      dbgreporte.ColumnByName('MONTO_LIQUIDACION').FooterValue := FormatFloat('###,###,##0.00', xnmonto) ;
      dbgreporte.ColumnByName('CANTIDAD_LIQUIDACION').FooterValue := FormatFloat('###,###,##0', xncantidad) ;
   End;
   // Fin: HPC_201506_PRE
   // Fin: HPC_201709_PRE
end;

procedure Tfrepliqanu.btnimprimirClick(Sender: TObject);
begin
  // Inicio: HPC_201506_PRE
  If rgtipo.ItemIndex = 0 Then
  Begin
     ppltitdpt01.Caption := 'LIQUIDACIONES ANULADAS DE BENEFICIOS (DETALLE)';
     ppltitdpt02.Caption := 'DEL '+dbdtpinicial.Text+' AL '+dbdtpfinal.Text;
     pplimpresopor01.Caption := 'Impreso por : '+DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
     ppreporte.Print;
     ppreporte.Stop;
  End
  Else
  Begin
     ppltitres01.Caption := 'LIQUIDACIONES ANULADAS DE BENEFICIOS (RESUMEN)';
     ppltitres02.Caption := 'DEL '+dbdtpinicial.Text+' AL '+dbdtpfinal.Text;
     pplusuariores.Caption :=  'Impreso por : '+DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
     pprResumen.Print;
     pprResumen.Stop;
  End;
  // Fin: HPC_201506_PRE
end;

procedure Tfrepliqanu.FormKeyPress(Sender: TObject; var Key: Char);
begin
 If Key = #13 Then
  begin
    Key := #0;
    Perform(CM_DIALOGKEY, VK_TAB, 0);
  end;
end;

procedure Tfrepliqanu.btncerrarClick(Sender: TObject);
begin
  frepliqanu.Close;
end;

procedure Tfrepliqanu.btnaexcelClick(Sender: TObject);
begin
   // Inicio: HPC_201705_PRE
   // Se modifica procedimiento para la exportación a excel
   // DM1.HojaExcel('REPORTE',DM1.dsReporte,DBGrid1);
   // Inicio: HPC_201709_PRE
   // Nuevos procedimientos para exportar a excel
   // DM1.ExportaGridExcel(dbgreporte, 'PRE_LIQANUEXT');
   // Fin: HPC_201705_PRE
   DM1.cdsReporte1.Close;
   DM1.cdsReporte1.DataRequest(xSqlAExcel);
   DM1.cdsReporte1.Open;
   If rgtiprep.ItemIndex = 0 Then
      DM1.HojaExcel('PRE_DET_LIQANU',DM1.dsReporte1, dbgAExcel)
   Else
      DM1.HojaExcel('PRE_RES_LIQANU',DM1.dsReporte1, dbgAExcel);
   // Fin: HPC_201709_PRE

end;

// Inicio: SPP_201403_PRE
procedure Tfrepliqanu.FormActivate(Sender: TObject);
Var xSql:String;
begin
  // INICIO HPC_201610_PRE
  // INICIALIZA PARAMETROS POR DEFECTO
  DM1.FG_CONECTA_CDS(xxCdsQryOficina, xxDsQryOficina);
  DM1.cdsReporte.Close;

  xSql :=
     ' SELECT ''00'' DPTOID, ''TODOS LOS DEPARTAMENTOS'' DPTODES FROM DUAL '
   + ' UNION ALL '
   + ' SELECT DPTOID, DPTODES FROM APO158 ORDER BY DPTOID';
  DM1.cdsDpto.Close;
  DM1.cdsDpto.DataRequest(xSql);
  DM1.cdsDpto.Open;
  dblcdptoid.Selected.Clear;
  dblcdptoid.Selected.Add('DPTOID'#9'2'#9'Código'#9#9);
  dblcdptoid.Selected.Add('DPTODES'#9'25'#9'Nombre del departamento'#9#9);
  dblcdptoid.LookupValue := DM1.cdsDpto.fieldbyname('DPTOID').AsString;  
  dblcdptoidChange(nil);
  // FIN HPC_201610_PRE
end;

// INICIO HPC_201610_PRE
// CAMBIO DE DEPARTAMENTO
procedure Tfrepliqanu.dblcdptoidChange(Sender: TObject);
var xsSQL : String;
begin
   xsSQL :=
      ' SELECT ''00'' OFDESID, ''TODAS LAS OFICINAS'' OFDESNOM FROM DUAL '
    + '  UNION ALL '
    + ' SELECT OFDESID, OFDESNOM '
    + '   FROM DB2ADMIN.APO110 '
    + '  WHERE DPTOID = ' + QuotedStr(dblcdptoid.Text)
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
         dblcdptoid.SetFocus;
      End;
   End;
end;
// FIN HPC_201610_PRE
// Fin: SPP_201403_PRE

// Inicio: HPC_201506_PRE
// INICIO HPC_201610_PRE
// CAMBIO DE TIPO DE REPORTE
procedure Tfrepliqanu.rgtipoClick(Sender: TObject);
begin
 If rgtipo.ItemIndex = 1 Then
 Begin
    dblcdptoid.Enabled := False;
    dblcdptoid.Text := '';
    dblcdptoid.Color := clScrollBar;
    medesdpto.Color := clScrollBar;
    cbOficina.Enabled := False;
    cbOficina.Text := '';
    cbOficina.Color := clScrollBar;
    edtOficina.Color := clScrollBar;

 End
 Else
 Begin
    dblcdptoid.Enabled := True;
    dblcdptoid.Color := clWindow;
    medesdpto.Color := clWindow;
    cbOficina.Enabled := True;
    cbOficina.Color := clWindow;
    edtOficina.Color := clWindow;
 End;
 DM1.cdsReporte.Close;
end;
// FIN HPC_201610_PRE
// Fin: HPC_201506_PRE

// INICIO HPC_201610_PRE
// CAMBIO DE OFICINA
procedure Tfrepliqanu.cbOficinaChange(Sender: TObject);
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
procedure Tfrepliqanu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM1.cdsReporte.Close;
  Action := caFree
end;
// FIN HPC_201610_PRE
// Inicio: HPC_201705_PRE
// Procedimiento que imprime en el pie de grupo la descripción del departamento.
procedure Tfrepliqanu.pplpiegrupoPrint(Sender: TObject);
begin
   // Inicio: HPC_201709_PRE
   // Se actualiza el nombre del campo en el client
   // pplpiegrupo.Caption := 'TOTAL DEPARTAMENTO : '+DM1.cdsReporte.FieldByName('DPTODES').AsString;
   pplpiegrupo.Caption := 'TOTAL DEPARTAMENTO : '+DM1.cdsReporte.FieldByName('DEPART_ORIGEN').AsString;
   // Fin: HPC_201709_PRE
end;
// Fin: HPC_201705_PRE

end.
