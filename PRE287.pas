// Inicio Uso Estándares : 01/08/2011
// Unidad                : Previsión Social
// Formulario            : Frepexpben
// Fecha de Creación     : 25/07/2011
// Autor                 : Equipo de desarrollo
// Objetivo              : Reporte de expedientes de beneficios
// Actualizaciones
// HPC_201305_PRE        : Creación del reporte de impresión de expediente de beneficios
// SPP_201306_PRE        : Se realiza el pase a producción a partir del HPC_201305_PRE
// HPC_201709_PRE        : Se modifican los filtros para el reporte de expedientes de beneficios
//                         se añade estado "anulado", departamento y oficina de origen

unit PRE287;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, StdCtrls, wwdblook,
  Wwdbdlg, wwdbdatetimepicker, Buttons, ppDB, ppDBPipe, ppDBBDE, ppCtrls,
  // Inicio: HPC_201709_PRE
  // Se añaden unidades que son usadas en las modificaciones del los filtros
  // ppBands, ppVar, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd,
  ppBands, ppVar, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, db,
  // ppReport;
  ppReport, Mask, jpeg, DBGrids;
  // Fin: HPC_201709_PRE
type
  TFrepexpben = class(TForm)
    dbgexpben: TwwDBGrid;
    btnimprimir: TBitBtn;
    btnaexcel: TBitBtn;
    btncerrar: TBitBtn;
    gbfecha: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    // Inicio: HPC_201709_PRE
    // Label3: TLabel;
    // Se retiran y se añaden variables usadas en el cambio
    // btnprocesar: TBitBtn;
    dtpfecinicio: TwwDBDateTimePicker;
    dtpfecfinal: TwwDBDateTimePicker;
    pprrepdet: TppReport;
    // dblcdusuario: TwwDBLookupComboDlg;
    // edtnomusu: TEdit;
    // rgestexp: TRadioGroup;
    // rgforsolben: TRadioGroup;
    // pprrepexpben: TppReport;
    // Fin: HPC_201709_PRE

    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel5: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppLabel6: TppLabel;
    // Inicio: HPC_201709_PRE
    // Se retiran y se añaden variables usadas en el cambio
    // pplfechas: TppLabel;
    pplfechasdetalle: TppLabel;
    // Fin: HPC_201709_PRE
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppDetailBand1: TppDetailBand;
    ppDBText3: TppDBText;
    ppDBText8: TppDBText;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText9: TppDBText;
    ppSummaryBand1: TppSummaryBand;

    // Inicio: HPC_201709_PRE
    // Se retiran y se añaden variables usadas en el cambio
    // pplusuqueimp: TppLabel;
    // pplhorqueimp: TppLabel;
    // ppBDEPipeline1: TppBDEPipeline;
    pplimpresopordetalle: TppLabel;
    ppbderepdet: TppBDEPipeline;
    // Fin: HPC_201709_PRE
    ppDBText10: TppDBText;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppShape8: TppShape;
    ppShape10: TppShape;
    ppShape9: TppShape;
    ppLine1: TppLine;
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
    ppLabel16: TppLabel;
    ppDBCalc1: TppDBCalc;
    // Inicio: HPC_201709_PRE
    // Se se añaden variables usadas en el cambio
    btnprocesar: TBitBtn;
    rgforsolben: TRadioGroup;
    rgestexp: TRadioGroup;
    gbdepofi: TGroupBox;
    Label4: TLabel;
    Label6: TLabel;
    dblcdptoid: TwwDBLookupCombo;
    dblcdofid: TwwDBLookupCombo;
    pnldesdpto: TPanel;
    medesdpto: TMaskEdit;
    Panel1: TPanel;
    edtOficina: TMaskEdit;
    gbusuario: TGroupBox;
    Label3: TLabel;
    dblcdusuario: TwwDBLookupComboDlg;
    edtnomusu: TEdit;
    rgtipexp: TRadioGroup;
    pprrepres: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel21: TppLabel;
    pplfechasresumen: TppLabel;
    ppShape11: TppShape;
    ppShape13: TppShape;
    ppShape17: TppShape;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel29: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText16: TppDBText;
    ppDBText18: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    pplimpresoporresumen: TppLabel;
    ppLine2: TppLine;
    ppbderepres: TppBDEPipeline;
    ppShape12: TppShape;
    ppLabel19: TppLabel;
    ppShape15: TppShape;
    ppLabel20: TppLabel;
    ppShape16: TppShape;
    ppLabel26: TppLabel;
    ppImage2: TppImage;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel30: TppLabel;
    ppSystemVariable6: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel31: TppLabel;
    ppLine3: TppLine;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppLabel32: TppLabel;
    ppLabel22: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppldeporidet: TppLabel;
    pplofioridet: TppLabel;
    ppShape18: TppShape;
    ppLabel25: TppLabel;
    ppShape19: TppShape;
    ppLabel36: TppLabel;
    ppShape20: TppShape;
    ppLabel37: TppLabel;
    ppShape21: TppShape;
    ppLabel38: TppLabel;
    ppShape22: TppShape;
    ppLabel39: TppLabel;
    ppDBText15: TppDBText;
    ppDBText17: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    dbgAExcel: TDBGrid;
    // Fin: HPC_201709_PRE
    procedure btnprocesarClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dblcdusuarioExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnaexcelClick(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure limpiagrid;
    procedure dtpfecinicioChange(Sender: TObject);
    procedure dtpfecfinalChange(Sender: TObject);
    procedure dblcdusuarioChange(Sender: TObject);
    procedure rgestexpClick(Sender: TObject);
    procedure rgforsolbenClick(Sender: TObject);

    // Inicio: HPC_201709_PRE
    // Se se añaden nuevos procedimiento usadas en el cambio
    procedure dblcdptoidExit(Sender: TObject);
    procedure dblcdofidExit(Sender: TObject);
    procedure dblcdptoidChange(Sender: TObject);
    procedure dblcdofidChange(Sender: TObject);
    procedure rgtipexpClick(Sender: TObject);
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
  Frepexpben: TFrepexpben;

implementation

uses PREDM;

{$R *.dfm}


// Inicio: HPC_201709_PRE
// Se modifica los Qrys para procesar información que se debe mostrar en los reportes
// y esportables a excel de expedientes de beneficios. 
procedure TFrepexpben.btnprocesarClick(Sender: TObject);
// Var xSql:String;
Var  xcanret, xcaninv, xcanfal:Integer;
    xcantra, xcanliq, xcananu:Integer;
    xcansolben, xcanofiint:Integer;
    // Fin: HPC_201709_PRE
begin
   If Trim(dtpfecinicio.Text) = '' Then
   Begin
      MessageDlg('Debe ingresar fecha inicial del proceso', mtCustom, [mbOk], 0);
      dtpfecinicio.SetFocus;
      Exit;
   End;
   If Trim(dtpfecfinal.Text) = '' Then
   Begin
      MessageDlg('Debe ingresar fecha final del proceso', mtCustom, [mbOk], 0);
      dtpfecfinal.SetFocus;
      Exit;
   End;
   // Se valida que fecha incial no sea mayor a la final
   If dtpfecinicio.Date > dtpfecfinal.Date Then
   Begin
      MessageDlg('La fecha inicial debe ser igual o menor a la fecha final', mtCustom, [mbOk], 0);
      dtpfecinicio.SetFocus;
      Exit;
   End;
   // xSql := 'SELECT D.PVSESTDES, TO_CHAR(A.FREG,''DD/MM/YYYY'') PVSFECEXP, CASE WHEN A.FORSOLBEN = ''O'' THEN ''OFICIO'' ELSE ''SOLICITUD'' END FORMA,'
   // +' A.PVSEXPNRO, B.BENEFABR, A.ASODNI, A.ASOAPENOMDNI, A.USUARIO USU_EXP, A.PVSLBENNR, C.USUARIO USU_LIQ'
   // +' FROM PVS301 A, TGE186 B, PVS306 C, (SELECT PVSESTDSG, PVSESTDES FROM PVS102 WHERE PVSDOC = ''E'') D'
   // +' WHERE A.PVSESTADO <> ''13'' AND A.FREG >= '+QuotedStr(dtpfecinicio.Text)+' AND A.FREG <= '+QuotedStr(dtpfecfinal.Text)
   // +' AND A.PVSTIPBEN = B.TIPBENEF(+) AND A.ASOID = C.ASOID(+) AND A.PVSLBENNR = C.PVSLBENNR(+) AND A.PVSESTADO = D.PVSESTDSG(+)';
   // If Trim(dblcdusuario.Text) <> '' Then xSql := xSql + 'AND A.USUARIO = '+QuotedStr(dblcdusuario.Text);
   // If rgestexp.ItemIndex = 1 Then        xSql := xSql + ' AND A.PVSESTADO IN (''01'', ''05'')';
   // If rgestexp.ItemIndex = 2 Then        xSql := xSql + ' AND A.PVSESTADO IN (''02'', ''06'')';
   // If rgforsolben.ItemIndex = 1 Then     xSql := xSql + ' AND A.FORSOLBEN = ''S''';
   // If rgforsolben.ItemIndex = 2 Then     xSql := xSql + ' AND A.FORSOLBEN = ''O''';
   // xSql := xSql + 'ORDER BY A.PVSEXPNRO';
   // DM1.cdsQry10.Close;
   // DM1.cdsQry10.DataRequest(xSql);
   // DM1.cdsQry10.Open;
   // If DM1.cdsQry10.RecordCount = 0 Then
   // Begin
   //   limpiagrid;
   //   MessageDlg('No existe información para mostrar', mtCustom, [mbOk], 0);
   //   btnprocesar.SetFocus;
   //   Exit;
   // Se modifica reporte detalle y se añade reporte resumen de expedientes de beneficio 
   If rgtipexp.ItemIndex = 0 Then
   Begin
      xSql := 'SELECT D.PVSESTDES ESTADO_EXPEDIENTE, A.COM_ANU DESCRIPCION_ANULACION, TO_DATE(A.PVSFECEXP,''DD/MM/YYYY'') FECHA_EXPEDIENTE, CASE WHEN A.FORSOLBEN = ''O'' THEN ''OFICIO'' ELSE ''SOLICITUD'' END ORIGEN_EXPEDIENTE,'
      +' A.PVSEXPNRO NUMERO_EXPEDIENTE, B.BENEFABR TIPO_EXPEDIENTE, A.ASODNI NUMERO_DNI, A.ASOAPENOMDNI APELLIDOS_Y_NOMBRES, A.USUARIO USUARIO_CREACION, A.PVSLBENNR NUMERO_LIQUIDACION,'
      +' C.USUARIO USUARIO_LIQUIDA, E.DPTODES DEPARTAMENTO_ORIGEN, F.OFDESNOM OFICINA_ORIGEN'
      +' FROM PVS301 A, TGE186 B, PVS306 C, (SELECT PVSESTDSG, PVSESTDES FROM PVS102 WHERE PVSDOC = ''E'') D, APO158 E, APO110 F'
      // +' WHERE A.PVSESTADO <> ''13'' AND A.FREG >= '+QuotedStr(dtpfecinicio.Text)+' AND A.FREG <= '+QuotedStr(dtpfecfinal.Text)
      +' WHERE TO_DATE(A.PVSFECEXP) >= '+QuotedStr(dtpfecinicio.Text)+' AND TO_DATE(A.PVSFECEXP) <= '+QuotedStr(dtpfecfinal.Text)
      +' AND A.PVSTIPBEN = B.TIPBENEF(+) AND A.ASOID = C.ASOID(+) AND A.PVSLBENNR = C.PVSLBENNR(+) AND A.PVSESTADO = D.PVSESTDSG(+)'
      +' AND A.DEPORIEXP = E.DPTOID AND A.OFIORIEXP = F.OFDESID';
      If Trim(dblcdusuario.Text) <> '' Then xSql := xSql + ' AND A.USUARIO = '+QuotedStr(dblcdusuario.Text);
      If rgestexp.ItemIndex = 1        Then xSql := xSql + ' AND A.PVSESTADO IN (''01'', ''05'')';
      If rgestexp.ItemIndex = 2        Then xSql := xSql + ' AND A.PVSESTADO IN (''02'', ''06'')';
      If rgestexp.ItemIndex = 3        Then xSql := xSql + ' AND A.PVSESTADO IN (''13'')';
      If rgforsolben.ItemIndex = 1     Then xSql := xSql + ' AND A.FORSOLBEN = ''S''';
      If rgforsolben.ItemIndex = 2     Then xSql := xSql + ' AND A.FORSOLBEN = ''O''';
      If Trim(dblcdptoid.Text) <> ''   Then
      Begin
         xSql := xSql + ' AND A.DEPORIEXP = '+QuotedStr(dblcdptoid.Text);
         If Trim(dblcdofid.Text) <> '' Then
            xSql := xSql + ' AND A.OFIORIEXP = '+QuotedStr(dblcdofid.Text);
      End;
      xSql := xSql + ' ORDER BY A.PVSEXPNRO';
      xSqlAExcel := xSql;
      DM1.cdsQry10.Close;
      DM1.cdsQry10.DataRequest(xSql);
      DM1.cdsQry10.Open;
      If DM1.cdsQry10.RecordCount = 0 Then
      Begin
        limpiagrid;
        MessageDlg('No existe información para mostrar', mtCustom, [mbOk], 0);
        btnprocesar.SetFocus;
        Exit;
      End;
      btnimprimir.Enabled := True;
      btnaexcel.Enabled   := True;
      DM1.cdsQry10.First;
      dbgexpben.Selected.Clear;
      dbgexpben.Selected.Add('NUMERO_EXPEDIENTE'#9'12'#9'Número del~expediente'#9#9);
      dbgexpben.Selected.Add('FECHA_EXPEDIENTE'#9'10'#9'Fecha del~expediente'#9#9);
      dbgexpben.Selected.Add('TIPO_EXPEDIENTE'#9'12'#9'Tipo de expediente'#9#9);
      dbgexpben.Selected.Add('ESTADO_EXPEDIENTE'#9'12'#9'Estado del~expediente'#9#9);
      dbgexpben.Selected.Add('ORIGEN_EXPEDIENTE'#9'10'#9'Origen del~expediente'#9#9);
      dbgexpben.Selected.Add('NUMERO_DNI'#9'8'#9'DNI~del asociado'#9#9);
      dbgexpben.Selected.Add('APELLIDOS_Y_NOMBRES'#9'42'#9'Apellidos y nombre(s)'#9#9);
      dbgexpben.Selected.Add('USUARIO_CREACION'#9'15'#9'Usuario~del expediente'#9#9);
      dbgexpben.Selected.Add('NUMERO_LIQUIDACION'#9'12'#9'Número de~liquidación'#9#9);
      dbgexpben.Selected.Add('USUARIO_LIQUIDA'#9'15'#9'Usuario que~liquida'#9#9);
      dbgexpben.Selected.Add('DEPARTAMENTO_ORIGEN'#9'15'#9'Departamento~origen'#9#9);
      dbgexpben.Selected.Add('OFICINA_ORIGEN'#9'32'#9'Oficina~origen'#9#9);
      dbgexpben.Selected.Add('DESCRIPCION_ANULACION'#9'42'#9'Motivo~anulación'#9#9);
      dbgexpben.ApplySelected;
      dbgexpben.ColumnByName('NUMERO_EXPEDIENTE').FooterValue := 'Total registros : ';
      dbgexpben.ColumnByName('FECHA_EXPEDIENTE').FooterValue := IntToStr(DM1.cdsQry10.RecordCount);
   End;
   If rgtipexp.ItemIndex = 1 Then
   Begin
      xSql := 'SELECT DPTOID COD_DEP_ORIGEN, DPTODES DESC_DEP_ORIGEN, OFDESID COD_OFI_ORIGEN, OFDESNOM DESC_OFI_ORIGEN,'
      +' SUM(NVL(CANRET,0)) CANTXRET, SUM(NVL(CANFAL,0)) CANTXFAL, SUM(NVL(CANINV,0)) CANTXINV,'
      +' SUM(NVL(ENTRAMITE,0)) CANT_EN_TRAMITE, SUM(NVL(LIQUIDADO,0)) CANT_LIQUIDADO, SUM(NVL(ANULADO,0)) CANT_ANULADO,'
      +' SUM(NVL(SOLBEN,0)) CANXSOL_BEN, SUM(NVL(OFIINT,0)) CANX_OFI_INT,'
      +' SUM(NVL(CANRET,0)+NVL(CANFAL,0)+NVL(CANINV,0)) CANT_TOT_EXP'
      +' FROM'
      +' (SELECT C.DPTOID, C.DPTODES, D.OFDESID, D.OFDESNOM,'
      +' CASE WHEN A.PVSTIPBEN = ''01'' THEN 1 ELSE 0 END CANRET,'
      +' CASE WHEN A.PVSTIPBEN = ''02'' THEN 1 ELSE 0 END CANFAL,'
      +' CASE WHEN A.PVSTIPBEN = ''03'' THEN 1 ELSE 0 END CANINV,'
      +' CASE WHEN A.PVSESTADO IN(''01'',''05'') THEN 1 ELSE 0 END ENTRAMITE,'
      +' CASE WHEN A.PVSESTADO IN(''02'',''06'') THEN 1 ELSE 0 END LIQUIDADO,'
      +' CASE WHEN A.PVSESTADO = ''13'' THEN 1 ELSE 0 END ANULADO,'
      +' CASE WHEN A.FORSOLBEN = ''S'' THEN 1 ELSE 0 END SOLBEN,'
      +' CASE WHEN A.FORSOLBEN = ''O'' THEN 1 ELSE 0 END OFIINT'
      +' FROM PVS301 A, (SELECT PVSESTDSG, PVSESTDES FROM PVS102 WHERE PVSDOC = ''E'') B, APO158 C, APO110 D'
      +' WHERE TO_DATE(A.PVSFECEXP) >= '+QuotedStr(dtpfecinicio.Text)+' AND TO_DATE(A.PVSFECEXP) <= '+QuotedStr(dtpfecfinal.Text);
      If Trim(dblcdusuario.Text) <> '' Then xSql := xSql + ' AND A.USUARIO = '+QuotedStr(dblcdusuario.Text);
      If rgestexp.ItemIndex = 1        Then xSql := xSql + ' AND A.PVSESTADO IN (''01'', ''05'')';
      If rgestexp.ItemIndex = 2        Then xSql := xSql + ' AND A.PVSESTADO IN (''02'', ''06'')';
      If rgestexp.ItemIndex = 3        Then xSql := xSql + ' AND A.PVSESTADO IN (''13'')';
      If Trim(dblcdptoid.Text) <> ''   Then
      Begin
         xSql := xSql + ' AND A.DEPORIEXP = '+QuotedStr(dblcdptoid.Text);
         If Trim(dblcdofid.Text) <> '' Then
            xSql := xSql + ' AND A.OFIORIEXP = '+QuotedStr(dblcdofid.Text);
      End;
      xSql := xSql +' AND A.PVSESTADO = B.PVSESTDSG'
      +' AND A.DEPORIEXP = C.DPTOID'
      +' AND A.OFIORIEXP = D.OFDESID)'
      +' GROUP BY DPTOID, DPTODES, OFDESID, OFDESNOM'
      +' ORDER BY DPTOID, OFDESID';
      xSqlAExcel := xSql;
      DM1.cdsQry10.Close;
      DM1.cdsQry10.DataRequest(xSql);
      DM1.cdsQry10.Open;
      If DM1.cdsQry10.RecordCount = 0 Then
      Begin
        limpiagrid;
        MessageDlg('No existe información para mostrar', mtCustom, [mbOk], 0);
        btnprocesar.SetFocus;
        Exit;
      End;
      xcanret := 0;
      xcaninv := 0;
      xcanfal := 0;
      xcantra    := 0;
      xcanliq    := 0;
      xcananu    := 0;
      xcansolben := 0;
      xcanofiint := 0;
      While Not DM1.cdsQry10.Eof Do
      Begin
         xcanret := xcanret + DM1.cdsQry10.FieldByName('CANTXRET').AsInteger;
         xcaninv := xcaninv + DM1.cdsQry10.FieldByName('CANTXINV').AsInteger;
         xcanfal := xcanfal + DM1.cdsQry10.FieldByName('CANTXFAL').AsInteger;
         xcantra    := xcantra + DM1.cdsQry10.FieldByName('CANT_EN_TRAMITE').AsInteger;
         xcanliq    := xcanliq + DM1.cdsQry10.FieldByName('CANT_LIQUIDADO').AsInteger;
         xcananu    := xcananu + DM1.cdsQry10.FieldByName('CANT_ANULADO').AsInteger;
         xcansolben := xcansolben + DM1.cdsQry10.FieldByName('CANXSOL_BEN').AsInteger;
         xcanofiint := xcanofiint + DM1.cdsQry10.FieldByName('CANX_OFI_INT').AsInteger;
         DM1.cdsQry10.Next;
      End;
      btnimprimir.Enabled := True;
      btnaexcel.Enabled   := True;
      dbgexpben.Selected.Clear;
      dbgexpben.Selected.Add('DESC_DEP_ORIGEN'#9'13'#9'Departamento del~expediente'#9#9);
      dbgexpben.Selected.Add('DESC_OFI_ORIGEN'#9'38'#9'Oficina del~expediente'#9#9);
      dbgexpben.Selected.Add('CANTXRET'#9'10'#9'# expediente~por retiro'#9#9);
      dbgexpben.Selected.Add('CANTXFAL'#9'10'#9'# expediente~por fallecimiento'#9#9);
      dbgexpben.Selected.Add('CANTXINV'#9'10'#9'# expediente~por invalidez'#9#9);
      dbgexpben.Selected.Add('CANT_EN_TRAMITE'#9'10'#9'# expediente~en trámite'#9#9);
      dbgexpben.Selected.Add('CANT_LIQUIDADO'#9'10'#9'# expediente~liquidado'#9#9);
      dbgexpben.Selected.Add('CANT_ANULADO'#9'10'#9'# expediente~anulado'#9#9);
      dbgexpben.Selected.Add('CANXSOL_BEN'#9'10'#9'# expediente~por solicitud del asociado'#9#9);
      dbgexpben.Selected.Add('CANX_OFI_INT'#9'10'#9'# expediente~por oficio interno'#9#9);
      dbgexpben.Selected.Add('CANT_TOT_EXP'#9'10'#9'Cant. exp.~total'#9#9);
      dbgexpben.ApplySelected;
      TNumericField(DM1.cdsQry10.FieldByName('CANTXRET')).DisplayFormat := '###,##0';
      TNumericField(DM1.cdsQry10.FieldByName('CANTXFAL')).DisplayFormat := '###,##0';
      TNumericField(DM1.cdsQry10.FieldByName('CANTXINV')).DisplayFormat := '###,##0';
      TNumericField(DM1.cdsQry10.FieldByName('CANT_EN_TRAMITE')).DisplayFormat := '###,##0';
      TNumericField(DM1.cdsQry10.FieldByName('CANT_LIQUIDADO')).DisplayFormat := '###,##0';
      TNumericField(DM1.cdsQry10.FieldByName('CANT_ANULADO')).DisplayFormat := '###,##0';
      TNumericField(DM1.cdsQry10.FieldByName('CANXSOL_BEN')).DisplayFormat := '###,##0';
      TNumericField(DM1.cdsQry10.FieldByName('CANX_OFI_INT')).DisplayFormat := '###,##0';
      TNumericField(DM1.cdsQry10.FieldByName('CANT_TOT_EXP')).DisplayFormat := '###,##0';
      dbgexpben.ColumnByName('CANTXRET').FooterValue := FormatFloat('###,##0',xcanret);
      dbgexpben.ColumnByName('CANTXFAL').FooterValue := FormatFloat('###,##0',xcanfal);
      dbgexpben.ColumnByName('CANTXINV').FooterValue := FormatFloat('###,##0',xcaninv);
      dbgexpben.ColumnByName('CANT_EN_TRAMITE').FooterValue := FormatFloat('###,##0',xcantra);
      dbgexpben.ColumnByName('CANT_LIQUIDADO').FooterValue := FormatFloat('###,##0',xcanliq);
      dbgexpben.ColumnByName('CANT_ANULADO').FooterValue := FormatFloat('###,##0',xcananu);
      dbgexpben.ColumnByName('CANXSOL_BEN').FooterValue := FormatFloat('###,##0',xcansolben);
      dbgexpben.ColumnByName('CANX_OFI_INT').FooterValue := FormatFloat('###,##0',xcanofiint);
      dbgexpben.ColumnByName('CANT_TOT_EXP').FooterValue := FormatFloat('###,##0',xcanret+xcanfal+xcaninv);
   End;
   // btnimprimir.Enabled := True;
   // btnaexcel.Enabled   := True;
   // DM1.cdsQry10.First;
   // dbgexpben.Selected.Clear;
   // dbgexpben.Selected.Add('PVSEXPNRO'#9'12'#9'Número del~expediente'#9#9);
   // dbgexpben.Selected.Add('PVSFECEXP'#9'10'#9'Fecha del~expediente'#9#9);
   // dbgexpben.Selected.Add('BENEFABR'#9'12'#9'Tipo de expediente'#9#9);
   // dbgexpben.Selected.Add('PVSESTDES'#9'12'#9'Estado del~expediente'#9#9);
   // dbgexpben.Selected.Add('FORMA'#9'10'#9'Origen del~expediente'#9#9);
   // dbgexpben.Selected.Add('ASODNI'#9'8'#9'DNI~del asociado'#9#9);
   // dbgexpben.Selected.Add('ASOAPENOMDNI'#9'42'#9'Apellidos y nombre(s)'#9#9);
   // dbgexpben.Selected.Add('USU_EXP'#9'15'#9'Usuario~del expediente'#9#9);
   // dbgexpben.Selected.Add('PVSLBENNR'#9'12'#9'Número de~liquidación'#9#9);
   // dbgexpben.Selected.Add('USU_LIQ'#9'15'#9'Usuario que~liquida'#9#9);
   // dbgexpben.ApplySelected;
   // dbgexpben.ColumnByName('PVSEXPNRO').FooterValue := 'Total registros : ';
   // dbgexpben.ColumnByName('PVSFECEXP').FooterValue := IntToStr(DM1.cdsQry10.RecordCount);
end;
// Fin: HPC_201709_PRE

procedure TFrepexpben.btncerrarClick(Sender: TObject);
begin
   Frepexpben.Close;
end;

procedure TFrepexpben.FormActivate(Sender: TObject);
Var xSql:String;
begin
   // Inicio: HPC_201709_PRE
   // Se añade Qry para seleccionar el departamento de origen del expediente
   xSql := 'SELECT DPTOID, DPTODES FROM APO158 WHERE DPTOID IS NOT NULL ORDER BY DPTOID';
   DM1.cdsDpto.Close;
   DM1.cdsDpto.DataRequest(xSql);
   DM1.cdsDpto.Open;
   dblcdptoid.Selected.Clear;
   dblcdptoid.Selected.Add('DPTOID'#9'2'#9'Código'#9#9);
   dblcdptoid.Selected.Add('DPTODES'#9'25'#9'Nombre del departamento'#9#9);
   // Fin: HPC_201709_PRE

  btnimprimir.Enabled := False;
  btnaexcel.Enabled := False;
  DM1.cdsQry10.Close;
  dbgexpben.Selected.Clear;

  xSql := 'SELECT USERID, USERNOM FROM TGE006 WHERE USERID IN (SELECT USUARIO FROM PVS301 GROUP BY USUARIO)';
  DM1.cdsUsuarios.Close;
  DM1.cdsUsuarios.DataRequest(xSql);
  DM1.cdsUsuarios.Open;
  dblcdusuario.Selected.Clear;
  dblcdusuario.Selected.Add('USERID'#9'15'#9'Usuario'#9#9);
  dblcdusuario.Selected.Add('USERNOM'#9'25'#9'Nombre del Usuario'#9#9);
end;

procedure TFrepexpben.dblcdusuarioExit(Sender: TObject);
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
procedure TFrepexpben.FormKeyPress(Sender: TObject; var Key: Char);
begin
 If Key = #13 Then
  begin
    Key := #0;
    Perform(CM_DIALOGKEY, VK_TAB, 0);
  end;
end;

// Inicio: HPC_201709_PRE
// Nuevo proceso de exportación a excel.
procedure TFrepexpben.btnaexcelClick(Sender: TObject);
begin
   // DM1.ExportaGridExcel(dbgexpben, 'PRE_DETEXPBEN');
   DM1.cdsReporte1.Close;
   DM1.cdsReporte1.DataRequest(xSqlAExcel);
   DM1.cdsReporte1.Open;
   If rgtipexp.ItemIndex = 0 Then
      DM1.HojaExcel('PRE_DETEXPBEN',DM1.dsReporte1, dbgAExcel)
   Else
      DM1.HojaExcel('PRE_RESEXPBEN',DM1.dsReporte1, dbgAExcel);
end;
// Fin: HPC_201709_PRE

procedure TFrepexpben.btnimprimirClick(Sender: TObject);
begin
   // Inicio: HPC_201709_PRE
   // Se cargan variables que seran usadas al momento de realizar la impresión
   // de los reportes
   // pplfechas.Caption := 'DEL '+dtpfecinicio.Text+' AL '+dtpfecfinal.Text;
   // pplusuqueimp.Caption := 'USUARIO: '+DM1.wUsuario;
   // pplhorqueimp.Caption := 'HORA DE IMPRESION: '+TimeToStr(Time);
   // pprrepexpben.Print;
   // pprrepexpben.Stop;
   If rgtipexp.ItemIndex = 0 Then
   Begin
      pplfechasdetalle.Caption := 'DEL '+dtpfecinicio.Text+' AL '+dtpfecfinal.Text;
      pplimpresopordetalle.Caption := 'Impreso por   : ' + DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
      If Trim(medesdpto.Text) = '' Then
         ppldeporidet.Caption := 'TODOS'
      Else
         ppldeporidet.Caption := medesdpto.Text;

      If Trim(edtOficina.Text) = '' Then
         pplofioridet.Caption := 'TODOS'
      Else
         pplofioridet.Caption := edtOficina.Text;
      pprrepdet.Print;
      pprrepdet.Stop;
   End;
   If rgtipexp.ItemIndex = 1 Then
   Begin
      pplfechasresumen.Caption := 'DEL '+dtpfecinicio.Text+' AL '+dtpfecfinal.Text;
      pplimpresoporresumen.Caption := 'Impreso por   : ' + DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
      pprrepres.Print;
      pprrepres.Stop;
   End;
   // Fin: HPC_201709_PRE
end;

procedure TFrepexpben.limpiagrid;
begin
  If DM1.cdsQry10.Active = True Then DM1.cdsQry10.Close;
  dbgexpben.Selected.Clear;
  btnimprimir.Enabled := False;
  btnaexcel.Enabled   := False;
end;

procedure TFrepexpben.dtpfecinicioChange(Sender: TObject);
begin
  limpiagrid;
end;

procedure TFrepexpben.dtpfecfinalChange(Sender: TObject);
begin
  limpiagrid;
end;

procedure TFrepexpben.dblcdusuarioChange(Sender: TObject);
begin
limpiagrid;
end;

procedure TFrepexpben.rgestexpClick(Sender: TObject);
begin
limpiagrid;
end;

procedure TFrepexpben.rgforsolbenClick(Sender: TObject);
begin
limpiagrid;
end;

// Inicio: HPC_201709_PRE
// Se crean procedimientos para ser usados al momento de registrar departamento
// y oficina de origen 
procedure TFrepexpben.dblcdptoidExit(Sender: TObject);
Var xSql:String;
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

procedure TFrepexpben.dblcdofidExit(Sender: TObject);
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

procedure TFrepexpben.dblcdptoidChange(Sender: TObject);
begin
   limpiagrid;
end;

procedure TFrepexpben.dblcdofidChange(Sender: TObject);
begin
   limpiagrid;
end;

procedure TFrepexpben.rgtipexpClick(Sender: TObject);
begin
   limpiagrid;
   If rgtipexp.ItemIndex = 0 Then
   Begin
      rgforsolben.Enabled := True;
      rgestexp.Enabled    := True;
   End;
   If rgtipexp.ItemIndex = 1 Then
   Begin
      rgforsolben.ItemIndex := 0;
      rgforsolben.Enabled   := False;
      rgestexp.ItemIndex    := 0;
      rgestexp.Enabled      := False;
   End;
end;
// Fin: HPC_201709_PRE


end.
