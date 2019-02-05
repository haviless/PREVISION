// Inicio Uso Estándares : 01/08/2011
// Unidad                : Previsión Social
// Formulario            : Frepxtipdes
// Fecha de Creación     : 01/08/2011
// Autor                 : Equipo de desarrollo
// Objetivo              : Reporte por tipo de desembolso
// Actualizaciones
// HPC_201305_PRE        : Creación de reporte resumen de tipo de desembolso
// SPP_201306_PRE        : Se realiza el pase a producción a partir del HPC_201305_PRE
// HPC_201307_PRE        : Se añade imagen del nuevo logo institucional
// SPP_201401_PRE        : Se realiza el pase a producción a partir del pase HPC_201307_PRE
// HPC_201709_PRE        : Se añade al filtro departamento y oficina de origen del expediente
unit PRE286;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, wwdbdatetimepicker, Grids, Wwdbigrd, Wwdbgrid,
  ExtCtrls, wwdblook, Wwdbdlg,DB, ppDB, ppDBPipe, ppDBBDE, ppBands,
  ppCtrls, ppVar, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd,
  // Inicio: HPC_201709_PRE
  // Se añade fuente de configuración a la unidad
  // ppReport, jpeg; //  SPP_201401_PRE
  ppReport, jpeg, Mask, DBGrids; //  SPP_201401_PRE
  // Fin: HPC_201709_PRE

type
  TFrepxtipdes = class(TForm)
    btncerrar: TBitBtn;
    btnaexcel: TBitBtn;
    btnimprimir: TBitBtn;
    // Inicio: HPC_201709_PRE
    // Se retiran componentes no usados
    // gbfiltros: TGroupBox;
    // btnprocesar: TBitBtn;
    // Fin: HPC_201709_PRE
    dbgtipdes: TwwDBGrid;
    ppBDEPipeline1: TppBDEPipeline;
    pprrepxtipdes: TppReport;
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
    ppDetailBand1: TppDetailBand;
    ppDBText3: TppDBText;
    ppDBText8: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    pplusuqueimp: TppLabel;
    pplhorqueimp: TppLabel;
    ppLine3: TppLine;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText9: TppDBText;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppLabel4: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppShape8: TppShape;
    ppShape9: TppShape;
    ppShape10: TppShape;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppShape11: TppShape;
    ppShape12: TppShape;
    ppShape13: TppShape;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLine1: TppLine;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppldepartamento: TppLabel;
    // Inicio: HPC_201709_PRE
    // Se añaden nuevos componentes para se usados en el cambio
    // gbfechas: TGroupBox;
    ppImage1: TppImage;
    btnprocesar: TBitBtn;
    gbdepofi: TGroupBox;
    Label4: TLabel;
    Label6: TLabel;
    dblcdptoid: TwwDBLookupCombo;
    dblcdofid: TwwDBLookupCombo;
    pnldesdpto: TPanel;
    medesdpto: TMaskEdit;
    Panel1: TPanel;
    edtOficina: TMaskEdit;
    gbfecha: TGroupBox;
    Label1: TLabel;
    // dtpfecinicio: TwwDBDateTimePicker;
    Label2: TLabel;
    dbdtpinicial: TwwDBDateTimePicker;
    dbdtpfinal: TwwDBDateTimePicker;
    dbgAExcel: TDBGrid;  // SPP_201401_PRE
    // Fin: HPC_201709_PRE
    procedure btncerrarClick(Sender: TObject);
    procedure btnprocesarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    // Inicio: HPC_201709_PRE
    // Se retira procedimiento no usado
    // procedure dblcdptoidExit(Sender: TObject);
    // Fin: HPC_201709_PRE
    procedure btnaexcelClick(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure limpiagrid;
    procedure dtpfecinicioChange(Sender: TObject);
    procedure dtpfecfinalChange(Sender: TObject);
    procedure dblcdptoidChange(Sender: TObject);
    // Inicio: HPC_201709_PRE
    // Se añaden nuevos procedimientos de control de busqueda de departamento y oficinas
    procedure dblcdptoidExit(Sender: TObject);
    procedure dblcdofidExit(Sender: TObject);
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
  Frepxtipdes: TFrepxtipdes;

implementation

uses PREDM;

{$R *.dfm}

procedure TFrepxtipdes.btncerrarClick(Sender: TObject);
begin
  Frepxtipdes.Close;
end;

procedure TFrepxtipdes.btnprocesarClick(Sender: TObject);
Var xSql:String;
    xcanret, xcanfal, xcaninv, xcantot : Double;
    xsumret, xsumfal, xsuminv, xsumtot : Double;
begin
   // Inicio: HPC_20709_PRE
   // Se añade nuevas variables para las fechas
   // If Trim(dtpfecinicio.Text) = '' Then
   If Trim(dbdtpinicial.Text) = '' Then
   Begin
      MessageDlg('Debe ingresar fecha inicial del proceso', mtCustom, [mbOk], 0);
      // dtpfecinicio.SetFocus;
      dbdtpinicial.SetFocus;
      Exit;
   End;
   // If Trim(dtpfecfinal.Text) = '' Then
   If Trim(dbdtpfinal.Text) = '' Then
   Begin
      MessageDlg('Debe ingresar fecha final del proceso', mtCustom, [mbOk], 0);
      // dtpfecfinal.SetFocus;
      dbdtpfinal.SetFocus;
      Exit;
   End;
   // Fin: HPC_20709_PRE
   xcanret := 0;
   xcanfal := 0;
   xcaninv := 0;
   xcantot := 0;
   xsumret := 0;
   xsumfal := 0;
   xsuminv := 0;
   xsumtot := 0;
   // Inicio: HPC_201709_PRE
   // Se añade modelo de cursor "reloj de arena"
   Screen.Cursor := crHourGlass;
   // Fin: HPC_201709
   xSql := ' SELECT TIPDESEDES, SUM(NVL(CAN_RET,0)) CAN_RET, SUM(NVL(MON_RET,0)) SUM_RET,'
   +                          'SUM(NVL(CAN_FAL,0)) CAN_FAL, SUM(NVL(MON_FAL,0)) SUM_FAL,'
   +                          'SUM(NVL(CAN_INV,0)) CAN_INV, SUM(NVL(MON_INV,0)) SUM_INV,'
   +' SUM(NVL(CAN_RET,0)+NVL(CAN_FAL,0)+NVL(CAN_INV,0)) CAN_TOT, SUM(NVL(MON_RET,0)+NVL(MON_FAL,0)+NVL(MON_INV,0)) SUM_TOT'
   +' FROM (SELECT E.TIPDESEDES, CASE WHEN A.PVSLTIPBE = ''01'' THEN 1 ELSE 0 END CAN_RET, CASE WHEN A.PVSLTIPBE = ''01'' THEN PVSLMONTO ELSE 0 END MON_RET,'
   +                            'CASE WHEN A.PVSLTIPBE = ''02'' THEN 1 ELSE 0 END CAN_FAL, CASE WHEN A.PVSLTIPBE = ''02'' THEN PVSLMONTO ELSE 0 END MON_FAL,'
   +                            'CASE WHEN A.PVSLTIPBE = ''03'' THEN 1 ELSE 0 END CAN_INV, CASE WHEN A.PVSLTIPBE = ''03'' THEN PVSLMONTO ELSE 0 END MON_INV'
   +' FROM PVS306 A, PVS307 B, PVS301 C, CRE104 E'
   // Inicio: HPC_201709
   // Se modifica las varible de las fechas
   // +' WHERE  A.PVSLFECBE  >= '+QuotedStr(dtpfecinicio.Text)+' AND A.PVSLFECBE  <= '+QuotedStr(dtpfecfinal.Text)
   +' WHERE  A.PVSLFECBE  >= '+QuotedStr(dbdtpinicial.Text)+' AND A.PVSLFECBE  <= '+QuotedStr(dbdtpfinal.Text)
   // Fin: HPC_201709_PRE
   +' AND A.PVSESTLIQ NOT IN (''04'',''13'') AND A.PVSLBENNR = B.PVSLBENNR AND B.PVSLAGRID IN (''FPG'',''RET'') AND B.FLGVOUCHER = ''N'''
   // +' AND NVL(B.PVSLMONTO,0) > 0 AND A.ASOID = C.ASOID AND A.PVSLBENNR = B.PVSLBENNR AND B.FORPAGOID = E.TIPDESEID';
   +' AND NVL(B.PVSLMONTO,0) > 0 AND A.ASOID = C.ASOID AND A.PVSEXPNRO = C.PVSEXPNRO AND B.FORPAGOID = E.TIPDESEID';
   // If Trim(dblcdptoid.Text) <> '' Then xSql := xSql + ' AND SUBSTR(C.DISORIEXP,1,2) = '+QuotedStr(dblcdptoid.Text);
   If Trim(dblcdptoid.Text) <> '' Then
   Begin
      xSql := xSql + ' AND C.DEPORIEXP = '+QuotedStr(dblcdptoid.Text);
         If Trim(dblcdofid.Text) <> '' Then
            xSql := xSql + ' AND C.OFIORIEXP = '+QuotedStr(dblcdofid.Text);
   End;
   xSql := xSql+ ') GROUP BY TIPDESEDES';
   xSqlAExcel := xSql;
   DM1.cdsQry10.Close;
   DM1.cdsQry10.DataRequest(xSql);
   DM1.cdsQry10.Open;
   Screen.Cursor := crDefault;
   // Fin: HPC_201709_PRE
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
   btnaexcel.Enabled   := True;
   DM1.cdsQry10.First;
   While Not DM1.cdsQry10.Eof Do
   Begin
      xcanret := xcanret + DM1.cdsQry10.FieldByName('CAN_RET').AsFloat;
      xcanfal := xcanfal + DM1.cdsQry10.FieldByName('CAN_FAL').AsFloat;
      xcaninv := xcaninv + DM1.cdsQry10.FieldByName('CAN_INV').AsFloat;
      xcantot := xcantot + DM1.cdsQry10.FieldByName('CAN_TOT').AsFloat;
      xsumret := xsumret + DM1.cdsQry10.FieldByName('SUM_RET').AsFloat;
      xsumfal := xsumfal + DM1.cdsQry10.FieldByName('SUM_FAL').AsFloat;
      xsuminv := xsuminv + DM1.cdsQry10.FieldByName('SUM_INV').AsFloat;
      xsumtot := xsumtot + DM1.cdsQry10.FieldByName('SUM_TOT').AsFloat;
      DM1.cdsQry10.Next;
   End;
   dbgtipdes.Selected.Clear;
   // Inicio: HPC_201709_PRE
   // Se modifica la columna de tamaño de tipo de desembolso
   // dbgtipdes.Selected.Add('TIPDESEDES'#9'35'#9'Tipo de desembolso'#9#9);
   dbgtipdes.Selected.Add('TIPDESEDES'#9'42'#9'Tipo de desembolso'#9#9);
   // Fin: HPC_201709_PRE
   dbgtipdes.Selected.Add('CAN_RET'#9'8'#9'Cantidad'#9'F'#9'Retiro');
   dbgtipdes.Selected.Add('SUM_RET'#9'12'#9'Monto'#9'F'#9'Retiro');
   dbgtipdes.Selected.Add('CAN_FAL'#9'8'#9'Cantidad'#9'F'#9'Fallecimiento');
   dbgtipdes.Selected.Add('SUM_FAL'#9'12'#9'Monto'#9'F'#9'Fallecimiento');
   dbgtipdes.Selected.Add('CAN_INV'#9'8'#9'Cantidad'#9'F'#9'Invalidez');
   dbgtipdes.Selected.Add('SUM_INV'#9'12'#9'Monto'#9'F'#9'Invalidez');
   dbgtipdes.Selected.Add('CAN_TOT'#9'8'#9'Cantidad'#9'F'#9'Total');
   dbgtipdes.Selected.Add('SUM_TOT'#9'12'#9'Monto'#9'F'#9'Total');
   dbgtipdes.ApplySelected;
   TNumericField(DM1.cdsQry10.FieldByName('CAN_RET')).DisplayFormat := '##,##0';
   TNumericField(DM1.cdsQry10.FieldByName('CAN_FAL')).DisplayFormat := '##,##0';
   TNumericField(DM1.cdsQry10.FieldByName('CAN_INV')).DisplayFormat := '##,##0';
   TNumericField(DM1.cdsQry10.FieldByName('CAN_TOT')).DisplayFormat := '##,##0';
   TNumericField(DM1.cdsQry10.FieldByName('SUM_RET')).DisplayFormat := '#,###,##0.00';
   TNumericField(DM1.cdsQry10.FieldByName('SUM_FAL')).DisplayFormat := '#,###,##0.00';
   TNumericField(DM1.cdsQry10.FieldByName('SUM_INV')).DisplayFormat := '#,###,##0.00';
   TNumericField(DM1.cdsQry10.FieldByName('SUM_TOT')).DisplayFormat := '#,###,##0.00';
   dbgtipdes.ColumnByName('CAN_RET').FooterValue := FormatFloat('##,##0',xcanret);
   dbgtipdes.ColumnByName('CAN_FAL').FooterValue := FormatFloat('##,##0',xcanfal);
   dbgtipdes.ColumnByName('CAN_INV').FooterValue := FormatFloat('##,##0',xcaninv);
   dbgtipdes.ColumnByName('CAN_TOT').FooterValue := FormatFloat('##,##0',xcantot);
   dbgtipdes.ColumnByName('SUM_RET').FooterValue := FormatFloat('#,###,##0.00',xsumret);
   dbgtipdes.ColumnByName('SUM_FAL').FooterValue := FormatFloat('#,###,##0.00',xsumfal);
   dbgtipdes.ColumnByName('SUM_INV').FooterValue := FormatFloat('#,###,##0.00',xsuminv);
   dbgtipdes.ColumnByName('SUM_TOT').FooterValue := FormatFloat('#,###,##0.00',xsumtot);

end;

procedure TFrepxtipdes.FormActivate(Sender: TObject);
Var xSql:String;
begin
   btnimprimir.Enabled := False;
   btnaexcel.Enabled   := False;
   DM1.cdsQry10.Close;
   dbgtipdes.Selected.Clear;
   
   xSql := 'SELECT DPTOID, DPTODES FROM APO158 ORDER BY DPTOID';
   DM1.cdsDpto.Close;
   DM1.cdsDpto.DataRequest(xSql);
   DM1.cdsDpto.Open;
   dblcdptoid.Selected.Clear;
   dblcdptoid.Selected.Add('DPTOID'#9'2'#9'Código'#9#9);
   dblcdptoid.Selected.Add('DPTODES'#9'25'#9'Nombre del departamento'#9#9);
   // Inicio: HPC_201709_PRE
   // Se envia el cursor para que inicie en la fecha inicial
   dblcdptoid.SetFocus;
   // Fin: HPC_201709_PRE

end;

// Inicio: HPC_201709_PRE
// Se retira procedimiento que muestra descripción de departamento
// procedure TFrepxtipdes.dblcdptoidExit(Sender: TObject);
// begin
//   If dblcdptoid.Text = '' Then
//   Begin
//    edtdepdes.Text := '';
//    Exit;
//   End;
//   If Length(dblcdptoid.Text) = 2 then
//   Begin
//     If DM1.cdsDpto.Locate('DPTOID', dblcdptoid.Text, []) Then
//     Begin
//       edtdepdes.Text := DM1.cdsDpto.FieldByName('DPTODES').AsString;
//     End
//     Else
//     Begin
//       MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
//       dblcdptoid.Text := '';
//       edtdepdes.Text := '';
//     End;
//   End;
// end;
// Fin: HPC_201709_PRE

procedure TFrepxtipdes.btnaexcelClick(Sender: TObject);
begin
   // Inicio: HPC_201709_PRE
   // Nuevo procedimiento para exportar a excel
   // DM1.ExportaGridExcel(dbgtipdes, 'PRE_RESXTIPDES');
   DM1.cdsReporte1.Close;
   DM1.cdsReporte1.DataRequest(xSqlAExcel);
   DM1.cdsReporte1.Open;
   DM1.HojaExcel('RESxTIPDES_BEN',DM1.dsReporte1, dbgAExcel);
   // Fin: HPC_201709_PRE
end;

procedure TFrepxtipdes.btnimprimirClick(Sender: TObject);
begin
   // Inicio: HPC_201709_PRE
   // Se modifican las variables para la impresión de los formatos
   // pplfechas.Caption := 'DEL '+dtpfecinicio.Text+' AL '+dtpfecfinal.Text;
   pplfechas.Caption := 'DEL '+dbdtpinicial.Text+' AL '+dbdtpfinal.Text;
   pplusuqueimp.Caption := 'USUARIO: '+DM1.wUsuario;
   pplhorqueimp.Caption := 'HORA DE IMPRESION: '+TimeToStr(Time);
   // If trim(edtdepdes.Text) <> '' Then ppldepartamento.Caption := 'LUGAR DE ORIGEN: '+edtdepdes.Text;
   pprrepxtipdes.Print;
   pprrepxtipdes.Stop;
   // Fin: HPC_201709_PRE
end;

procedure TFrepxtipdes.FormKeyPress(Sender: TObject; var Key: Char);
begin
 If Key = #13 Then
  begin
    Key := #0;
    Perform(CM_DIALOGKEY, VK_TAB, 0);
  end;
end;

procedure TFrepxtipdes.limpiagrid;
begin
  If DM1.cdsQry10.Active = True Then DM1.cdsQry10.Close;
  btnimprimir.Enabled := False;
  btnaexcel.Enabled   := False;
  dbgtipdes.Selected.Clear;
end;

procedure TFrepxtipdes.dtpfecinicioChange(Sender: TObject);
begin
   limpiagrid;
end;

procedure TFrepxtipdes.dtpfecfinalChange(Sender: TObject);
begin
   limpiagrid;
end;

procedure TFrepxtipdes.dblcdptoidChange(Sender: TObject);
begin
   limpiagrid;
end;

// Inicio: HPC_201709_PRE
// Se crean procedimientos para controlar el ingreso del codigo de departamento y oficina
procedure TFrepxtipdes.dblcdptoidExit(Sender: TObject);
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
  xSql := 'SELECT OFDESID, OFDESNOM FROM DB2ADMIN.APO110 WHERE DPTOID = '+QuotedStr(dblcdptoid.Text);
  DM1.cdsOfDes.Close;
  DM1.cdsOfDes.DataRequest(xSql);
  DM1.cdsOfDes.Open;
  dblcdofid.Selected.Clear;
  dblcdofid.Selected.Add('OFDESID'#9'2'#9'Oficina ID');
  dblcdofid.Selected.Add('OFDESNOM'#9'20'#9'Oficina');
end;

procedure TFrepxtipdes.dblcdofidExit(Sender: TObject);
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

end.
