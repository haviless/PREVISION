// Inicio Uso Estándares : 01/08/2011
// Unidad                : Previsión Social
// Formulario            : Frepcardes
// Fecha de Creación     : 01/08/2011
// Autor                 : Equipo de desarrollo
// Objetivo              : Reporte de cartas de designación
// Actualizaciones
// HPC_201305_PRE        : Creación de formulario para la impresión de cartas de designación
// SPP_201306_PRE        : Se realiza el pase a producción a partir del HPC_201305_PRE
// HPC_201307_PRE        : Se añade imagen del nuevo logo institucional
// SPP_201401_PRE        : Se realiza el pase a producción a partir del pase HPC_201307_PRE
// HPC_201709_PRE        : Se modifica filtro para elejir las carta de beneficiario por
//                         departamento y oficina de origen

unit PRE289;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppBands, ppVar, ppPrnabl,
  ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, ExtCtrls, StdCtrls,
  // Inicio: HPC_201709
  // Se añade la unidad "Mask"
  wwdblook, Wwdbdlg, wwdbdatetimepicker, Buttons, Grids, Wwdbigrd, Wwdbgrid, jpeg,
  Mask, db, DBGrids; // SPP_201401_PRE
  // Fin: HPC_201709_PRE

type
  TFrepcardes = class(TForm)
    dbgcardes: TwwDBGrid;
    btnimprimir: TBitBtn;
    btnaexcel: TBitBtn;
    btncerrar: TBitBtn;
    // Inicio: HPC_201709_PRE
    // Se añaden nuevos grupos para el proceso de filtros de la
    // información
    // gbfiltro: TGroupBox;
    // rgsituacion: TRadioGroup;
    // pprrepCARDES: TppReport;
    pprrepCARBENDET: TppReport;
    // Fin: HPC_201709_PRE
    ppHeaderBand1: TppHeaderBand;
//Inicio: SPP_201401_PRE
    // ppLabel1: TppLabel; 
    // ppLabel2: TppLabel; 
//Fin: SPP_201401_PRE
    ppLabel3: TppLabel;
    ppLabel5: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppLabel6: TppLabel;
    pplfechas: TppLabel;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppShape8: TppShape;
    ppShape10: TppShape;
    ppShape9: TppShape;
    ppLabel4: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText3: TppDBText;
    ppDBText8: TppDBText;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    // Inicio: HPC_201709_PRE
    // Se retiran variables no usadas
    // ppDBText7: TppDBText;
    // pplusuqueimp: TppLabel;
    // pplhorqueimp: TppLabel;
    // ppBDEPipeline1: TppBDEPipeline;
    // Fin: HPC_201709_PRE

    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    
    ppLine1: TppLine;
    // Inicio: HPC_201709_PRE
    // Se añaden y retiran nuevas variables a ser usadas en la modificación
    // del reporte
    // pplusuqueimp: TppLabel;
    // pplhorqueimp: TppLabel;
    // ppBDEPipeline1: TppBDEPipeline;
    ppBDEPCarBenDet: TppBDEPipeline;
    pplimpresopordet: TppLabel;
    // ppDBText7: TppDBText;
    ppDBText11: TppDBText;
    ppLabel16: TppLabel;
    ppShape11: TppShape;
    ppLabel17: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppImage1: TppImage;
    rgsituacion: TRadioGroup;
    gbfechas: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtpfecinicio: TwwDBDateTimePicker;
    dtpfecfinal: TwwDBDateTimePicker;
    // Label4: TLabel;
    gbusuario: TGroupBox;
    dblcdusuario: TwwDBLookupComboDlg;
    edtnomusu: TEdit;
    // gbdepartamento: TGroupBox;
    // dblcddepartamento: TwwDBLookupComboDlg;
    // edtdesdep: TEdit;
    gborigen: TGroupBox;
    Label20: TLabel;
    Label16: TLabel;
    dblcdptoid: TwwDBLookupCombo;
    dblcdofid: TwwDBLookupCombo;
    Panel12: TPanel;
    edtOficina: TMaskEdit;
    Panel13: TPanel;
    medesdpto: TMaskEdit;
    btnprocesar: TBitBtn;
    rgtiprep: TRadioGroup;
    ppShape12: TppShape;
    ppLabel1: TppLabel;
    ppDBText7: TppDBText;
    ppDBText12: TppDBText;
    pprrepCARBENRES: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel19: TppLabel;
    pplfechasresumen: TppLabel;
    ppShape14: TppShape;
    ppShape16: TppShape;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppImage2: TppImage;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    pplimpresoporres: TppLabel;
    ppLine2: TppLine;
    ppLabel35: TppLabel;
    ppBDEPCarBenRes: TppBDEPipeline;
    ppShape13: TppShape;
    ppLabel2: TppLabel;
    ppShape15: TppShape;
    ppShape17: TppShape;
    ppLabel18: TppLabel;
    ppLabel23: TppLabel;
    ppShape18: TppShape;
    ppLabel24: TppLabel;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppShape19: TppShape;
    ppShape20: TppShape;
    ppShape21: TppShape;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppLine3: TppLine;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    dbgAExcel: TDBGrid; // SPP_201401_PRE
    // ppDBText11: TppDBText;
    // ppLabel16: TppLabel;
    // ppShape11: TppShape;
    // ppLabel17: TppLabel;
    // ppDBCalc1: TppDBCalc;
    // ppImage1: TppImage; // SPP_201401_PRE
    // Fin: HPC_201709_PRE
    procedure btnprocesarClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dblcdusuarioExit(Sender: TObject);
    procedure btnaexcelClick(Sender: TObject);
    // Inicio: HPC_201709_PRE
    // Se retira procedimiento que valida el codigo de departamento
    // procedure dblcddepartamentoExit(Sender: TObject);
    // Fin: HPC_201709_PRE
    procedure btnimprimirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure limpiagrid;
    procedure dtpfecinicioChange(Sender: TObject);
    procedure dtpfecfinalChange(Sender: TObject);
    procedure dblcdusuarioChange(Sender: TObject);
    procedure dblcddepartamentoChange(Sender: TObject);
    procedure rgsituacionClick(Sender: TObject);
    // Inicio: HPC_201709_PRE
    // Se crean nuevos procedimientos para el ingreso de departamento y
    // oficina de origen
    procedure dblcdptoidExit(Sender: TObject);
    procedure dblcdofidExit(Sender: TObject);
    procedure rgtiprepClick(Sender: TObject);
    // Fin: HPC_201709_PRE
  private
    // Inicio: HPC_201709_PRE
    // Se crean variables para ser usadas en los Qrys de grid y exportación a excel
    xSql, xSqlAExcel:String;
    // Fin: HPC_201709_PRE
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frepcardes: TFrepcardes;

implementation

uses PREDM;

{$R *.dfm}


procedure TFrepcardes.btnprocesarClick(Sender: TObject);
// Inicio: HPC_201709_PRE
// Se retira la varible del Qry. Se le envia al private 
// Var xSql:String;
Var xtotcarabi, xtotcarcer:Integer;
// Fin: HPC_201709_PRE
begin
   // Inicio: HPC_201709_PRE
   // Se valida las fechas iniciales y finales del reporte
   If Trim(dtpfecinicio.Text) = '' Then
   Begin
      // MessageDlg('Debe ingresar fecha inicial del proceso', mtCustom, [mbOk], 0);
      MessageDlg('Debe ingresar fecha inicio de recepción', mtCustom, [mbOk], 0);
      dtpfecinicio.SetFocus;
      Exit;
   End;
   If Trim(dtpfecfinal.Text) = '' Then
   Begin
      // MessageDlg('Debe ingresar fecha final del proceso', mtCustom, [mbOk], 0);
      MessageDlg('Debe ingresar fecha fin de recepción', mtCustom, [mbOk], 0);
      dtpfecfinal.SetFocus;
      Exit;
   End;
   If dtpfecinicio.Date >  dtpfecfinal.Date Then
   Begin
      MessageDlg('Fecha inicio debe ser menor o igual a la fecha fin de recepción', mtCustom, [mbOk], 0);
      dtpfecinicio.SetFocus;
      Exit;
   End;
   // Fin: HPC_201709_PRE
   
   If rgsituacion.ItemIndex = - 1 Then
   Begin
      MessageDlg('Debe seleccionar una opción el sotuación', mtCustom, [mbOk], 0);
      rgsituacion.SetFocus;
      Exit;
   End;

   // Inicio: HPC_201709_PRE
   // Nuevos reportes de cartas de designación
   // Se añade reporte por resumen y detalle
   If rgtiprep.ItemIndex = - 1 Then
   Begin
      MessageDlg('Debe seleccionar un tipo de reporte valido', mtCustom, [mbOk], 0);
      rgtiprep.SetFocus;
      Exit;
   End;
   If rgtiprep.ItemIndex = 0 Then
   Begin
      // xSql := 'SELECT A.DSGFREC, A.USUARIO, A.ASOCODMOD, A.ASODNI, A.ASOAPENOMDNI,'
      // +' CASE WHEN A.FECAPER IS NULL THEN ''CERRADA'' ELSE ''ABIERTA'' END SITUACION_CARTA, NVL(C.DPTODES,''NO IDENTIFICADO'') DPTODES,'
      // +' A.USUAPE, D.PVSLFECBE, D.PVSLBENNR, E.BENEFDES'
      // +' FROM PVS302 A, APO201 B, APO158 C, PVS306 D, TGE186 E'
      // +' WHERE A.DSGFREC >= '+QuotedStr(dtpfecinicio.Text)+' AND A.DSGFREC <= '+QuotedStr(dtpfecfinal.Text);
      // If Trim(dblcdusuario.Text) <> ''      Then xSql := xSql + ' AND A.USUARIO = '+QuotedStr(dblcdusuario.Text);
      // If Trim(dblcddepartamento.Text) <> '' Then xSql := xSql + ' AND SUBSTR(B.ZIPID,1,2) = '+QuotedStr(dblcddepartamento.Text);
      // If rgsituacion.ItemIndex = 1          Then xSql := xSql + ' AND A.FECAPER IS NOT NULL';
      // If rgsituacion.ItemIndex = 2          Then xSql := xSql + ' AND A.FECAPER IS NULL';
      // xSql := xSql +' AND SUBSTR(B.ZIPID,1,2) = C.DPTOID(+) AND A.ASOID = B.ASOID(+)'
      // +' AND A.PVSLBENNR = D.PVSLBENNR(+) AND D.PVSLTIPBE = E.TIPBENEF(+) ORDER BY A.DSGFREC';
      xSql := 'SELECT A.DSGFREC FECHA_RECEPCION, A.FREG FECHA_REGISTRO, A.USUARIO USUARIO_CREA, A.ASOCODMOD CODIDO_MODULAR, A.ASODNI DNI_ASOCIADO, A.ASOAPENOMDNI APELLIDOS_Y_NOMBRES,'
      +' CASE WHEN A.FECAPER IS NULL THEN ''CERRADA'' ELSE ''ABIERTA'' END SITUACION_CARTA,'
      +' A.USUAPE USUARIO_APERTURA, D.PVSLFECBE FECHA_BENEFICIO, D.PVSLBENNR NUMERO_BENEFICIO, E.BENEFDES DESCRIPCION_BENEFICIO, C.DPTODES DEPARTAMENTO_ORIGEN, F.OFDESNOM OFICINA_ORIGEN'
      +' FROM PVS302 A, APO201 B, APO158 C, PVS306 D, TGE186 E, APO110 F'
      // Inicio: HPC_201709_PRE
      // Se modifica la fecha de busqueda. La nueva busqueda es por fecha de registro y no fecha de recepción
      // +' WHERE A.DSGFREC >= '+QuotedStr(dtpfecinicio.Text)+' AND A.DSGFREC <= '+QuotedStr(dtpfecfinal.Text);
      +' WHERE A.DSGESTAD <> ''13'' AND  A.FREG >= '+QuotedStr(dtpfecinicio.Text)+' AND A.FREG <= '+QuotedStr(dtpfecfinal.Text);
      // Fin: HPC_201709_PRE
      If rgsituacion.ItemIndex = 1 Then
         xSql := xSql + ' AND A.FECAPER IS NOT NULL';
      If rgsituacion.ItemIndex = 2 Then
         xSql := xSql + ' AND A.FECAPER IS NULL';
      If Trim(dblcdptoid.Text) <> '' Then
      Begin
         xSql := xSql + ' AND A.DEPORICARDES = '+QuotedStr(dblcdptoid.Text);
         If Trim(dblcdofid.Text) <> '' Then
            xSql := xSql + ' AND A.OFIORICARDES = '+QuotedStr(dblcdofid.Text);
      End;
      If Trim(dblcdusuario.Text) <> '' Then
         xSql := xSql + ' AND A.USUARIO = '+QuotedStr(dblcdusuario.Text);
      xSql := xSql + ' AND A.ASOID = B.ASOID AND A.DEPORICARDES = C.DPTOID(+) AND A.OFIORICARDES = F.OFDESID(+)'
      +' AND A.PVSLBENNR = D.PVSLBENNR(+) AND D.PVSLTIPBE = E.TIPBENEF(+) ORDER BY A.DSGFREC';
      Screen.Cursor := crHourGlass;
      xSqlAExcel := xSql;
      DM1.cdsQry10.Close;
      DM1.cdsQry10.DataRequest(xSql);
      DM1.cdsQry10.Open;
      Screen.Cursor := crDefault;
      If DM1.cdsQry10.RecordCount = 0 Then
      Begin
        limpiagrid;
        MessageDlg('No existe información para mostrar', mtCustom, [mbOk], 0);
        btnprocesar.SetFocus;
        btnimprimir.Enabled := False;
        btnaexcel.Enabled := False;
        Exit;
      End;
      btnimprimir.Enabled := True;
      btnaexcel.Enabled := True;
      dbgcardes.Selected.Clear;
      dbgcardes.Selected.Add('FECHA_RECEPCION'#9'10'#9'Fecha de~recepción'#9#9);
      dbgcardes.Selected.Add('FECHA_REGISTRO'#9'10'#9'Fecha de~registro'#9#9);
      dbgcardes.Selected.Add('USUARIO_CREA'#9'15'#9'Usuario que~registra'#9#9);
      dbgcardes.Selected.Add('CODIDO_MODULAR'#9'10'#9'Código~modular'#9#9);
      dbgcardes.Selected.Add('DNI_ASOCIADO'#9'8'#9'DNI del~asociado'#9#9);
      dbgcardes.Selected.Add('APELLIDOS_Y_NOMBRES'#9'60'#9'Apellidos y nombre(s)~del asociado'#9#9);
      dbgcardes.Selected.Add('SITUACION_CARTA'#9'7'#9'Situación de~la carta'#9#9);
      // Inicio: HPC_201709_PRE
      // Se retira columna 
      // dbgcardes.Selected.Add('DPTODES'#9'15'#9'Departamento~domiciliario'#9#9);
      // Fin: HPC_201709_PRE
      dbgcardes.Selected.Add('USUARIO_APERTURA'#9'15'#9'Usuario que~apertura'#9#9);
      dbgcardes.Selected.Add('FECHA_BENEFICIO'#9'15'#9'Fecha de~liquidación'#9#9);
      dbgcardes.Selected.Add('NUMERO_BENEFICIO'#9'12'#9'Número de~liquidación'#9#9);
      dbgcardes.Selected.Add('DESCRIPCION_BENEFICIO'#9'20'#9'Tipo de~beneficio'#9#9);
      dbgcardes.Selected.Add('DEPARTAMENTO_ORIGEN'#9'15'#9'Departamento~de origen'#9#9);
      dbgcardes.Selected.Add('OFICINA_ORIGEN'#9'25'#9'Oficina~de origen'#9#9);
      dbgcardes.ApplySelected;
      dbgcardes.ColumnByName('DSGFREC').FooterValue := 'Total registros : ';
      dbgcardes.ColumnByName('USUARIO').FooterValue := IntToStr(DM1.cdsQry10.RecordCount);
   End;
   If rgtiprep.ItemIndex = 1 Then
   Begin
      xSql := 'SELECT B.DPTOID COD_DEP_ORIGEN, B.DPTODES DEPARTAMENTO_ORIGEN, C.OFDESID COD_OFI_ORIGEN, C.OFDESNOM OFICINA_ORIGEN,'
      +' SUM(CASE WHEN A.FECAPER IS NULL THEN 1 ELSE 0 END) CARTAS_CERRADAS,'
      +' SUM(CASE WHEN A.FECAPER IS NOT NULL THEN 1 ELSE 0 END) CARTAS_ABIERTAS, SUM(1) TOTAL_CARTAS'
      +' FROM PVS302 A, APO158 B, APO110 C'
      // +' WHERE A.DSGESTAD <> ''13'' AND A.DSGFREC >= '+QuotedStr(dtpfecinicio.Text)+' AND A.DSGFREC <= '+QuotedStr(dtpfecfinal.Text)
      +' WHERE A.DSGESTAD <> ''13'' AND  A.FREG >= '+QuotedStr(dtpfecinicio.Text)+' AND A.FREG <= '+QuotedStr(dtpfecfinal.Text)
      +' AND A.DEPORICARDES = B.DPTOID AND A.OFIORICARDES = C.OFDESID';
      If rgsituacion.ItemIndex = 1 Then
         xSql := xSql + ' AND A.FECAPER IS NOT NULL';
      If rgsituacion.ItemIndex = 2 Then
         xSql := xSql + ' AND A.FECAPER IS NULL';
      If Trim(dblcdptoid.Text) <> '' Then
      Begin
         xSql := xSql + ' AND A.DEPORICARDES = '+QuotedStr(dblcdptoid.Text);
         If Trim(dblcdofid.Text) <> '' Then
            xSql := xSql + ' AND A.OFIORICARDES = '+QuotedStr(dblcdofid.Text);
      End;
      If Trim(dblcdusuario.Text) <> '' Then
         xSql := xSql + ' AND A.USUARIO = '+QuotedStr(dblcdusuario.Text);
      xSql := xSql +' AND A.DEPORICARDES = B.DPTOID AND A.OFIORICARDES = C.OFDESID'
      +' GROUP BY B.DPTOID, B.DPTODES, C.OFDESID, C.OFDESNOM'
      +' ORDER BY B.DPTOID, C.OFDESID';
      Screen.Cursor := crHourGlass;
      xSqlAExcel := xSql;
      DM1.cdsQry10.Close;
      DM1.cdsQry10.DataRequest(xSql);
      DM1.cdsQry10.Open;
      While Not DM1.cdsQry10.Eof Do
      Begin
         xtotcarabi := xtotcarabi + DM1.cdsQry10.FieldByName('CARTAS_ABIERTAS').AsInteger;
         xtotcarcer := xtotcarcer + DM1.cdsQry10.FieldByName('CARTAS_CERRADAS').AsInteger;
         DM1.cdsQry10.Next;
      End;
      DM1.cdsQry10.First;
      Screen.Cursor := crDefault;
      If DM1.cdsQry10.RecordCount = 0 Then
      Begin
        limpiagrid;
        MessageDlg('No existe información para mostrar', mtCustom, [mbOk], 0);
        btnprocesar.SetFocus;
        btnimprimir.Enabled := False;
        btnaexcel.Enabled := False;
        Exit;
      End;
      btnimprimir.Enabled := True;
      btnaexcel.Enabled := True;
      dbgcardes.Selected.Clear;
      dbgcardes.Selected.Add('COD_DEP_ORIGEN'#9'2'#9'Código depart.~origen'#9#9);
      dbgcardes.Selected.Add('DEPARTAMENTO_ORIGEN'#9'15'#9'Descripción depart.~origen'#9#9);
      dbgcardes.Selected.Add('COD_OFI_ORIGEN'#9'2'#9'Código oficina~origen'#9#9);
      dbgcardes.Selected.Add('OFICINA_ORIGEN'#9'25'#9'Descripción oficina~origen'#9#9);
      dbgcardes.Selected.Add('CARTAS_ABIERTAS'#9'6'#9'# cartas~beneficiarios abiertas'#9#9);
      dbgcardes.Selected.Add('CARTAS_CERRADAS'#9'6'#9'# cartas~beneficiario cerradas'#9#9);
      dbgcardes.Selected.Add('TOTAL_CARTAS'#9'6'#9'# cartas~beneficiario'#9#9);
      dbgcardes.ApplySelected;
      TNumericField(DM1.cdsQry10.FieldByName('CARTAS_ABIERTAS')).DisplayFormat := '###,##0';
      TNumericField(DM1.cdsQry10.FieldByName('CARTAS_CERRADAS')).DisplayFormat := '###,##0';
      TNumericField(DM1.cdsQry10.FieldByName('TOTAL_CARTAS')).DisplayFormat   := '###,##0';
      dbgcardes.ColumnByName('CARTAS_ABIERTAS').FooterValue := FormatFloat('###,##0',xtotcarabi);
      dbgcardes.ColumnByName('CARTAS_CERRADAS').FooterValue := FormatFloat('###,##0',xtotcarcer);
      dbgcardes.ColumnByName('TOTAL_CARTAS').FooterValue :=   FormatFloat('###,##0',xtotcarabi+xtotcarcer);
   End;
   // btnimprimir.Enabled := True;
   // btnaexcel.Enabled := True;
   // dbgcardes.Selected.Clear;
   // dbgcardes.Selected.Add('DSGFREC'#9'10'#9'Fecha de~recepción'#9#9);
   // dbgcardes.Selected.Add('USUARIO'#9'15'#9'Usuario que~registra'#9#9);
   // dbgcardes.Selected.Add('ASOCODMOD'#9'10'#9'Código~modular'#9#9);
   // dbgcardes.Selected.Add('ASODNI'#9'8'#9'DNI del~asociado'#9#9);
   // dbgcardes.Selected.Add('ASOAPENOMDNI'#9'60'#9'Apellidos y nombre(s)~del asociado'#9#9);
   // dbgcardes.Selected.Add('SIT_CARTA'#9'7'#9'Situación de~la carta'#9#9);
   // dbgcardes.Selected.Add('DPTODES'#9'15'#9'Departamento~domiciliario'#9#9);
   // dbgcardes.Selected.Add('USUAPE'#9'15'#9'Usuario que~apertura'#9#9);
   // dbgcardes.Selected.Add('PVSLFECBE'#9'15'#9'Fecha de~liquidación'#9#9);
   // dbgcardes.Selected.Add('PVSLBENNR'#9'12'#9'Número de~liquidación'#9#9);
   // dbgcardes.Selected.Add('BENEFDES'#9'20'#9'Tipo de~beneficio'#9#9);
   // dbgcardes.ApplySelected;
   //
   // dbgcardes.ColumnByName('DSGFREC').FooterValue := 'Total registros : ';
   // dbgcardes.ColumnByName('USUARIO').FooterValue := IntToStr(DM1.cdsQry10.RecordCount);
   // Fin: HPC_201709_PRE


end;

procedure TFrepcardes.btncerrarClick(Sender: TObject);
begin
   Frepcardes.Close;
end;

procedure TFrepcardes.FormActivate(Sender: TObject);
// Inicio: HPC_201709_PRE
// Se retira variable local. Se envia al private  
// Var xSql:String;
// Fin: HPC_201709_PRE
begin
   limpiagrid;
   xSql := 'SELECT USERID, USERNOM FROM TGE006 WHERE USERID IN (SELECT USUARIO FROM PVS302 GROUP BY USUARIO) ORDER BY USERID';
   DM1.cdsUsuarios.Close;
   DM1.cdsUsuarios.DataRequest(xSql);
   DM1.cdsUsuarios.Open;
   dblcdusuario.Selected.Clear;
   dblcdusuario.Selected.Add('USERID'#9'15'#9'Usuario'#9#9);
   dblcdusuario.Selected.Add('USERNOM'#9'25'#9'Nombre del Usuario'#9#9);

   xSql := 'SELECT DPTOID, DPTODES FROM APO158 ORDER BY DPTOID';
   DM1.cdsDpto.Close;
   DM1.cdsDpto.DataRequest(xSql);
   DM1.cdsDpto.Open;

   // Inicio: HPC_201709_PRE
   // Se modifica el nombre del combo que muestra los departamentos de origen  
   // dblcddepartamento.Selected.Clear;
   // dblcddepartamento.Selected.Add('DPTOID'#9'2'#9'Código'#9#9);
   // dblcddepartamento.Selected.Add('DPTODES'#9'25'#9'Descripción'#9#9);
   dblcdptoid.Selected.Clear;
   dblcdptoid.Selected.Add('DPTOID'#9'2'#9'Código'#9#9);
   dblcdptoid.Selected.Add('DPTODES'#9'25'#9'Descripción'#9#9);
   dtpfecinicio.SetFocus;
   // Fin: HPC_201709_PRE

end;

procedure TFrepcardes.dblcdusuarioExit(Sender: TObject);
begin
  If dblcdusuario.Text = '' Then
  Begin
     edtnomusu.Text := '';
     Exit;
  End;
  If DM1.cdsUsuarios.Locate('USERID', dblcdusuario.Text, []) Then
     edtnomusu.Text := DM1.cdsUsuarios.FieldByName('USERNOM').AsString
  Else
  Begin
     MessageDlg('Usuario no valido', mtInformation, [mbOk], 0);
     dblcdusuario.Text := '';
     edtnomusu.Text := '';
  End;
end;


// Inicio: HPC_201709_PRE
// Nuevo procedimiento para exportar e excel
procedure TFrepcardes.btnaexcelClick(Sender: TObject);
begin
   DM1.cdsReporte1.Close;
   DM1.cdsReporte1.DataRequest(xSqlAExcel);
   DM1.cdsReporte1.Open;
   If rgtiprep.ItemIndex = 0 Then
      // DM1.ExportaGridExcel(dbgcardes, 'PRE_DETCARDES')
      DM1.HojaExcel('PRE_DETCARDES',DM1.dsReporte1, dbgAExcel)
   Else
      // DM1.ExportaGridExcel(dbgcardes, 'PRE_RESCARDES');
      DM1.HojaExcel('PRE_RESCARDES',DM1.dsReporte1, dbgAExcel);
end;
// Fin: HPC_201709_PRE


// Inicio: HPC_201709_PRE
// Se retira procedimiento para validar el codigo del departamento de origen
// procedure TFrepcardes.dblcddepartamentoExit(Sender: TObject);
// begin
//    If dblcddepartamento.Text = '' Then
//    Begin
//      edtdesdep.Text := '';
//      Exit;
//    End;
//   If DM1.cdsDpto.Locate('DPTOID', dblcddepartamento.Text, []) Then
//      edtdesdep.Text := DM1.cdsDpto.FieldByName('DPTODES').AsString
//   Else
//   Begin
//      MessageDlg('Usuario no valido', mtInformation, [mbOk], 0);
//      dblcddepartamento.Text := '';
//      edtdesdep.Text := '';
//   End;
// end;
// Fin: HPC_201709_PRE

// Inicio: HPC_201709_PRE
// Se modifica las variables para mostrar las fechas, usuario y hora del impresión
// en los reportes
procedure TFrepcardes.btnimprimirClick(Sender: TObject);
begin
   // pplfechas.Caption := 'DEL '+dtpfecinicio.Text+' AL '+dtpfecfinal.Text;
   // pplusuqueimp.Caption := 'USUARIO: '+DM1.wUsuario;
   // pplhorqueimp.Caption := 'HORA DE IMPRESION: '+TimeToStr(Time);
   // pprrepCARDES.Print;
   // pprrepCARDES.Stop;
   If rgtiprep.ItemIndex = 0 Then
   Begin
      pplfechas.Caption := 'DEL '+dtpfecinicio.Text+' AL '+dtpfecfinal.Text;
      pplimpresopordet.Caption:='Impreso por   : '+DM1.CrgDescrip('USERID='+QuotedStr(Trim(DM1.wUsuario)),'TGE006','USERNOM');
      pprrepCARBENDET.Print;
      pprrepCARBENDET.Stop;
   End
   Else
   Begin
      pplfechasresumen.Caption := 'DEL '+dtpfecinicio.Text+' AL '+dtpfecfinal.Text;
      pplimpresoporres.Caption:='Impreso por   : '+DM1.CrgDescrip('USERID='+QuotedStr(Trim(DM1.wUsuario)),'TGE006','USERNOM');
      pprrepCARBENRES.Print;
      pprrepCARBENRES.Stop;
   End;
end;
// Fin: HPC_201709_PRE

procedure TFrepcardes.FormKeyPress(Sender: TObject; var Key: Char);
begin
 If Key = #13 Then
  begin
    Key := #0;
    Perform(CM_DIALOGKEY, VK_TAB, 0);
  end;
end;

procedure TFrepcardes.limpiagrid;
begin
  If DM1.cdsQry10.Active = True Then DM1.cdsQry10.Close;
  btnimprimir.Enabled := False;
  btnaexcel.Enabled := False;
  dbgcardes.Selected.Clear;
end;

procedure TFrepcardes.dtpfecinicioChange(Sender: TObject);
begin
   limpiagrid;
end;

procedure TFrepcardes.dtpfecfinalChange(Sender: TObject);
begin
  limpiagrid;
end;

procedure TFrepcardes.dblcdusuarioChange(Sender: TObject);
begin
   limpiagrid;
end;

procedure TFrepcardes.dblcddepartamentoChange(Sender: TObject);
begin
   limpiagrid;
end;

procedure TFrepcardes.rgsituacionClick(Sender: TObject);
begin
   btnimprimir.Enabled := False;
   btnaexcel.Enabled   := False;
   // Inicio: HPC_201709_PRE 
   // Se iniciliza el grid
   limpiagrid;
   // Fin: HPC_201709_PRE
end;

// Inicio: HPC_201709_PRE
// Nuevos procedimientos para validar el departamento y oficina de origen
procedure TFrepcardes.dblcdptoidExit(Sender: TObject);
begin
   If dblcdptoid.Text = '' Then
   Begin
      medesdpto.Text := '';
      dblcdofid.Text := '';
      edtOficina.Text := '';
   End;
   If Length(dblcdptoid.Text) = 2 then
   Begin
      If DM1.cdsDpto.Locate('DPTOID', dblcdptoid.Text, []) Then
      Begin
         medesdpto.Text := DM1.cdsDpto.FieldByName('DPTODES').AsString;
         dblcdofid.Text := '';
         edtOficina.Text := '';
      End
      Else
      Begin
         MessageDlg('Código de departamento no valido', mtInformation, [mbOk], 0);
         dblcdptoid.Text := '';
         medesdpto.Text := '';
         dblcdofid.Text := '';
         edtOficina.Text := '';
         dblcdptoid.SetFocus;
         Exit;
      End;
   End;
   xSql := 'SELECT OFDESID, OFDESNOM FROM APO110 WHERE DPTOID = '+QuotedStr(dblcdptoid.Text);
   DM1.cdsOfDes.Close;
   DM1.cdsOfDes.DataRequest(xSql);
   DM1.cdsOfDes.Open;
   dblcdofid.Selected.Clear;
   dblcdofid.Selected.Add('OFDESID'#9'2'#9'Código oficina');
   dblcdofid.Selected.Add('OFDESNOM'#9'20'#9'Descripción oficina');
end;

procedure TFrepcardes.dblcdofidExit(Sender: TObject);
begin
  If dblcdofid.Text = '' Then
     edtOficina.Text := '';
  If Length(dblcdofid.Text) = 2 Then
  Begin
     If DM1.cdsOfDes.Locate('OFDESID', dblcdofid.Text, []) Then
     Begin
        edtOficina.Text := DM1.cdsOfDes.FieldByName('OFDESNOM').AsString;
     End
     Else
     Begin
      MessageDlg('Código de oficina no valido', mtInformation, [mbOk], 0);
      dblcdofid.Text := '';
      edtOficina.Text := '';
      dblcdofid.SetFocus;
     End;
  End;
end;
// Fin: HPC_201709_PRE

// Inicio: HPC_201709_PRE
// Se inicializa las variables del filtro 
procedure TFrepcardes.rgtiprepClick(Sender: TObject);
begin
   limpiagrid;
end;
// Fin: HPC_201709_PRE

end.
