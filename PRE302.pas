// Inicio Uso Estándares: 01/08/2011
// Unidad               : PRE302
// Formulario           : Frephojcar
// Fecha de Creación    : 13/11/2017
// Autor                : Isaac Revilla
// Objetivo             : Reporte hojas de cargo
// HPC_201709_PRE : Creación
// HPC_201810_PRE : Se modifica el boton procesar. La busqueda de la fecha debe ser solo por fecha sin 
// incluir la hora. 
unit PRE302;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, Wwdbdlg, ExtCtrls,
  Mask, wwdblook, wwdbdatetimepicker, db, DBGrids;

type
  TFrephojcar = class(TForm)
    gbfecha: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtpfecinicio: TwwDBDateTimePicker;
    dtpfecfinal: TwwDBDateTimePicker;
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
    btnprocesar: TBitBtn;
    dbghojcar: TwwDBGrid;
    btnimprimir: TBitBtn;
    btnaexcel: TBitBtn;
    btncerrar: TBitBtn;
    dbgAExcel: TDBGrid;
    procedure FormActivate(Sender: TObject);
    procedure dblcdptoidExit(Sender: TObject);
    procedure dblcdofidExit(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnprocesarClick(Sender: TObject);
    procedure dblcdusuarioExit(Sender: TObject);
    procedure rgtipexpClick(Sender: TObject);
    procedure rgestexpClick(Sender: TObject);
    procedure rgforsolbenClick(Sender: TObject);
    procedure dblcdusuarioChange(Sender: TObject);
    procedure dtpfecfinalChange(Sender: TObject);
    procedure btnaexcelClick(Sender: TObject);
  private
    xSql, xSqlAExcel:String;
    procedure limpia;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frephojcar: TFrephojcar;

implementation

uses PREDM;

{$R *.dfm}

procedure TFrephojcar.FormActivate(Sender: TObject);
Var xSql:String;
begin
   limpia;
   xSql := 'SELECT DPTOID, DPTODES FROM APO158 WHERE DPTOID IS NOT NULL ORDER BY DPTOID';
   DM1.cdsDpto.Close;
   DM1.cdsDpto.DataRequest(xSql);
   DM1.cdsDpto.Open;
   dblcdptoid.Selected.Clear;
   dblcdptoid.Selected.Add('DPTOID'#9'2'#9'Código'#9#9);
   dblcdptoid.Selected.Add('DPTODES'#9'25'#9'Nombre del departamento'#9#9);

   btnaexcel.Enabled := False;
   btnimprimir.Enabled := False;
   dtpfecinicio.SetFocus;
end;

procedure TFrephojcar.dblcdptoidExit(Sender: TObject);
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

procedure TFrephojcar.dblcdofidExit(Sender: TObject);
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

procedure TFrephojcar.btncerrarClick(Sender: TObject);
begin
   Close;
end;

procedure TFrephojcar.FormKeyPress(Sender: TObject; var Key: Char);
begin
   If Key = #13 Then
   begin
      Key := #0;
      Perform(CM_DIALOGKEY, VK_TAB, 0);
   end;
end;

procedure TFrephojcar.btnprocesarClick(Sender: TObject);
Var xSql:String;
begin
   If Trim(dtpfecinicio.Text) = '' Then
   Begin
     MessageDlg('Ingrese la fecha inicial', mtInformation, [mbOk], 0);
     dtpfecinicio.SetFocus;
     Exit;
   End;
   If Trim(dtpfecfinal.Text) = '' Then
   Begin
     MessageDlg('Ingrese la fecha final', mtInformation, [mbOk], 0);
     dtpfecfinal.SetFocus;
     Exit;
   End;
   If dtpfecinicio.Date > dtpfecfinal.Date Then
   Begin
     MessageDlg('Ingrese una fecha inicial menor o igual a la fecha final', mtInformation, [mbOk], 0);
     dtpfecinicio.SetFocus;
     Exit;
   End;
   If rgtipexp.ItemIndex = -1 Then
   Begin
     MessageDlg('Seleccione el tipo de reporte', mtInformation, [mbOk], 0);
     dtpfecinicio.SetFocus;
     Exit;
   End;
   If (Trim(dblcdptoid.Text) <> '') And (Trim(dblcdofid.Text) = '') Then
   Begin
      MessageDlg('Debe seleccionar la oficina de origen', mtInformation, [mbOk], 0);
      dblcdofid.SetFocus;
      Exit;
   End;
   If rgtipexp.ItemIndex = 0 Then
   Begin
      // Inicio: HPC_201810_PRE
      // Se modifica el proceso para mostrar las hojas de cargo
      xSql := 'SELECT ROWNUM NUMERO_REGISTRO, B.CODCAREXP NUMERO_CARGO_EXPED, TRUNC(B.FECHA) FECHA_CARGO_EXPED, B.USERID USUARIO_CARGO_EXPED,'
      +' E.OFDESNOM DESC_OFICINA_HOJA_CARGO, C.FECRECEXP FECHA_RECEP_EXPEDIENTE, D.BENEFDES DESC_BENEFICIO,'
      // +' CASE WHEN C.PVSESTADO  = ''01'' THEN ''EN TRAMITE'' WHEN C.PVSESTADO  = ''02'' THEN ''LIQUIDADO'' END ESTADO_EXPEDIENTE,'
      +' H.PVSESTDES ESTADO_EXPEDIENTE,'
      +' CASE WHEN C.FORSOLBEN = ''S'' THEN ''SOLICITUD'' WHEN C.FORSOLBEN = ''O'' THEN ''OFICIO'' END ORIGEN_EXPEDIENTE,'
      +' C.USUARIO USUARIO_EXPEDIENTE, F.ASODNI DNI_ASOCIADO, F.ASOAPENOMDNI APELLIDOS_Y_NOMBRE_ASOCIADO, C.PVSLBENNR NUMERO_BENEFICIO,'
      +' G.PVSLFECBE FECHA_LIQUIDACION, G.USUARIO USUARIO_QUE_LIQUIDA'
      // +' FROM PRE_CARGO_EXPEDIENTE_MOV A, PRE_CARGO_EXPEDIENTE_EST_MOV B, PVS301 C, TGE186 D, APO110 E, APO201 F, PVS306 G'
      // +' WHERE A.FECREG >= '+QuotedStr(dtpfecinicio.Text)+' AND A.FECREG <= '+QuotedStr(dtpfecfinal.Text);
      +' FROM PRE_CARGO_EXPEDIENTE_MOV A, PRE_CARGO_EXPEDIENTE_EST_MOV B, PVS301 C, TGE186 D, APO110 E, APO201 F,'
      +' (SELECT ASOID, PVSLBENNR, PVSLFECBE, USUARIO FROM PVS306 WHERE PVSESTLIQ NOT IN (''04'',''13'')) G, PVS102 H'
      +' WHERE TRUNC(A.FECREG) >= '+QuotedStr(dtpfecinicio.Text)+' AND TRUNC(A.FECREG) <= '+QuotedStr(dtpfecfinal.Text);
      If dblcdusuario.Text <> '' Then
         xSql := xSql + ' AND A.USUREG = '+QuotedStr(dblcdusuario.Text);
      If Trim(dblcdofid.Text) <> '' Then
         xSql := xSql + ' AND A.OFDESID = '+QuotedStr(dblcdofid.Text);
      xSql := xSql + ' AND A.CODCAREXP = B.CODCAREXP AND B.CODCAREXPEST <> ''ANULADA'''
      +' AND B.CODCAREXP = C.CODCAREXP(+)'
      +' AND C.PVSTIPBEN = D.TIPBENEF(+)'
      +' AND A.OFDESID = E.OFDESID(+)'
      +' AND A.ASOID = F.ASOID(+)'
      // +' AND C.ASOID = G.ASOID(+) AND C.PVSLBENNR = G.PVSLBENNR(+)';
      +' AND C.ASOID = G.ASOID(+) AND C.PVSLBENNR = G.PVSLBENNR(+)'
      +' AND C.PVSESTADO = H.PVSESTDSG(+) AND H.PVSDOC(+) = ''E''';
      // Fin: HPC_201810_PRE
      xSqlAExcel := xSql;
      DM1.cdsReporte.Close;
      DM1.cdsReporte.DataRequest(xSql);
      DM1.cdsReporte.Open;
      If DM1.cdsReporte.RecordCount = 0 Then
      Begin
         limpia;
         MessageDlg('No existe información para mostrar', mtCustom, [mbOk], 0);
         Exit;
      End;
      dbghojcar.Selected.Clear;
      dbghojcar.Selected.Add('NUMERO_REGISTRO'#9'6'#9'Número'#9#9);
      dbghojcar.Selected.Add('NUMERO_CARGO_EXPED'#9'11'#9'Número~hoja de cargo'#9#9);
      dbghojcar.Selected.Add('FECHA_CARGO_EXPED'#9'10'#9'Fecha~hoja de cargo'#9#9);
      dbghojcar.Selected.Add('USUARIO_CARGO_EXPED'#9'10'#9'Usuario~hoja de cargo'#9#9);
      dbghojcar.Selected.Add('DESC_OFICINA_HOJA_CARGO'#9'15'#9'Oficina~hoja de cargo'#9#9);
      dbghojcar.Selected.Add('FECHA_RECEP_EXPEDIENTE'#9'10'#9'Fecha rececepción~expediente'#9#9);
      dbghojcar.Selected.Add('DESC_BENEFICIO'#9'15'#9'Tipo~expediente'#9#9);
      dbghojcar.Selected.Add('ESTADO_EXPEDIENTE'#9'15'#9'Estado~expediente'#9#9);
      dbghojcar.Selected.Add('ORIGEN_EXPEDIENTE'#9'15'#9'Origen~expediente'#9#9);
      dbghojcar.Selected.Add('USUARIO_EXPEDIENTE'#9'15'#9'Usuario~expediente'#9#9);
      dbghojcar.Selected.Add('DNI_ASOCIADO'#9'5'#9'DNI~asociado'#9#9);
      dbghojcar.Selected.Add('APELLIDOS_Y_NOMBRE_ASOCIADO'#9'35'#9'Apellidos y nombre(s) del asociado'#9#9);
      dbghojcar.Selected.Add('NUMERO_BENEFICIO'#9'11'#9'Número~liquidación'#9#9);
      dbghojcar.Selected.Add('FECHA_LIQUIDACION'#9'10'#9'Fecha~liquidación'#9#9);
      dbghojcar.Selected.Add('USUARIO_QUE_LIQUIDA'#9'15'#9'Usuario~liquidación'#9#9);
      dbghojcar.ApplySelected;
   End;
   If rgtipexp.ItemIndex = 1 Then
   Begin
      xSql := 'SELECT DPTODES DESC_DEPART_ORIGEN , OFDESNOM  DESC_OFICINA_ORIGEN,'
      +' SUM(NVL(CANT_HOJ_CAR_ACT,0)) CANT_HOJ_CAR_ACT, SUM(NVL(CANT_HOJ_CAR_SIN_EXP,0)) CANT_HOJ_CAR_SIN_EXP,'
      +' SUM(NVL(CANT_HOJCAR_C_EXPSLIQ,0)) CANT_HOJCAR_C_EXPSLIQ, SUM(NVL(CANT_HOJCAR_C_EXPCLIQ,0)) CANT_HOJCAR_C_EXPCLIQ,'
      +' SUM(NVL(CANT_HOJ_CAR_ANU,0)) CANT_HOJ_CAR_ANU FROM (SELECT H.DPTOID, H.DPTODES, E.OFDESID, E.OFDESNOM,'
      +' CASE WHEN A.CODCAREXPEST = ''PENDIENTE'' THEN 1 ELSE 0 END CANT_HOJ_CAR_ACT,'
      +' CASE WHEN A.CODCAREXPEST = ''PENDIENTE'' AND C.PVSEXPNRO IS NULL THEN 1 ELSE 0 END CANT_HOJ_CAR_SIN_EXP,'
      +' CASE WHEN A.CODCAREXPEST = ''PENDIENTE'' AND C.PVSEXPNRO IS NOT NULL AND C.PVSLBENNR IS NULL THEN 1 ELSE 0 END CANT_HOJCAR_C_EXPSLIQ,'
      +' CASE WHEN A.CODCAREXPEST = ''PENDIENTE'' AND C.PVSEXPNRO IS NOT NULL AND C.PVSLBENNR IS NOT NULL THEN 1 ELSE 0 END CANT_HOJCAR_C_EXPCLIQ,'
      +' CASE WHEN A.CODCAREXPEST = ''ANULADA'' THEN 1 ELSE 0 END CANT_HOJ_CAR_ANU'
      // Inicio: HPC_201810_PRE
      // Se modifica el proceso para mostrar las hojas de cargo
      // +' FROM PRE_CARGO_EXPEDIENTE_MOV A, PRE_CARGO_EXPEDIENTE_EST_MOV B, PVS301 C, TGE186 D, APO110 E, APO201 F, PVS306 G, APO158 H'
      // +' WHERE A.FECREG >= '+QuotedStr(dtpfecinicio.Text)+' AND A.FECREG <= '+QuotedStr(dtpfecfinal.Text);
      +' FROM PRE_CARGO_EXPEDIENTE_MOV A, PRE_CARGO_EXPEDIENTE_EST_MOV B, PVS301 C, TGE186 D, APO110 E, APO201 F,'
      +' (SELECT ASOID, PVSLBENNR, PVSLFECBE, USUARIO FROM PVS306 WHERE PVSESTLIQ NOT IN (''04'',''13'')) G, APO158 H, PVS102 I'
      +' WHERE TRUNC(A.FECREG) >= '+QuotedStr(dtpfecinicio.Text)+' AND TRUNC(A.FECREG) <= '+QuotedStr(dtpfecfinal.Text);
      If dblcdusuario.Text <> '' Then
         xSql := xSql + ' AND A.USUREG = '+QuotedStr(dblcdusuario.Text);
      If Trim(dblcdofid.Text) <> '' Then
         xSql := xSql + ' AND A.OFDESID = '+QuotedStr(dblcdofid.Text);
      xSql := xSql + 'AND A.CODCAREXP = B.CODCAREXP AND B.CODCAREXPEST <> ''ANULADA'' AND B.CODCAREXP = C.CODCAREXP(+) AND C.PVSTIPBEN = D.TIPBENEF(+)'
      // +' AND A.OFDESID = E.OFDESID(+) AND A.ASOID = F.ASOID(+) AND C.ASOID = G.ASOID(+)'
      // +' AND C.PVSLBENNR = G.PVSLBENNR(+) AND E.DPTOID = H.DPTOID(+)) GROUP BY DPTOID, DPTODES, OFDESID, OFDESNOM ORDER BY DPTOID, OFDESID';
      +' AND A.OFDESID = E.OFDESID(+) AND A.ASOID = F.ASOID(+)'
      +' AND C.ASOID = G.ASOID(+)'
      +' AND C.PVSLBENNR = G.PVSLBENNR(+) AND E.DPTOID = H.DPTOID(+)'
      +' AND C.PVSESTADO = I.PVSESTDSG(+) AND I.PVSDOC(+) = ''E'')'
      +' GROUP BY DPTODES, OFDESNOM ORDER BY DPTODES, OFDESNOM';
      // Fin: HPC_201810_PRE


      xSqlAExcel := xSql;
      DM1.cdsReporte.Close;
      DM1.cdsReporte.DataRequest(xSql);
      DM1.cdsReporte.Open;
      If DM1.cdsReporte.RecordCount = 0 Then
      Begin
         limpia;
         MessageDlg('No existe información para mostrar', mtCustom, [mbOk], 0);
         Exit;
      End;
      dbghojcar.Selected.Clear;
      dbghojcar.Selected.Add('DESC_DEPART_ORIGEN'#9'10'#9'Departamento~origen'#9#9);
      dbghojcar.Selected.Add('DESC_OFICINA_ORIGEN'#9'15'#9'Oficina~origen'#9#9);
      dbghojcar.Selected.Add('CANT_HOJ_CAR_ACT'#9'10'#9'Cantidad hojas~cargo activas'#9#9);
      dbghojcar.Selected.Add('CANT_HOJ_CAR_SIN_EXP'#9'10'#9'Cantidad hojas cargo~sin expediente'#9#9);
      dbghojcar.Selected.Add('CANT_HOJCAR_C_EXPSLIQ'#9'10'#9'Cantidad hojas cargo~con expediente'#9#9);
      dbghojcar.Selected.Add('CANT_HOJCAR_C_EXPCLIQ'#9'10'#9'Cantidad hojas cargo~con liquidación'#9#9);
      dbghojcar.Selected.Add('CANT_HOJ_CAR_ANU'#9'10'#9'Cantidad hojas~cargo anuladas'#9#9);
      TNumericField(DM1.cdsReporte.FieldByName('CANT_HOJ_CAR_ACT')).DisplayFormat := '##,##0';
      TNumericField(DM1.cdsReporte.FieldByName('CANT_HOJ_CAR_SIN_EXP')).DisplayFormat := '##,##0';
      TNumericField(DM1.cdsReporte.FieldByName('CANT_HOJCAR_C_EXPSLIQ')).DisplayFormat := '##,##0';
      TNumericField(DM1.cdsReporte.FieldByName('CANT_HOJCAR_C_EXPCLIQ')).DisplayFormat := '##,##0';
      TNumericField(DM1.cdsReporte.FieldByName('CANT_HOJ_CAR_ANU')).DisplayFormat := '##,##0';
      dbghojcar.ApplySelected;
   End;

   If DM1.cdsReporte.RecordCount > 0 Then
   Begin
      btnaexcel.Enabled := True;
      If rgtipexp.ItemIndex = 1 Then btnimprimir.Enabled := True;
   End
   Else
   Begin
      btnaexcel.Enabled := True;
      btnimprimir.Enabled :=  True;
   End;
end;

procedure TFrephojcar.limpia;
begin
   dblcdptoid.Text := '';
   dblcdofid.Text := '';
   medesdpto.Text := '';
   edtOficina.Text := '';
   edtnomusu.Text := '';
   btnimprimir.Enabled := False;
   btnaexcel.Enabled := False;
   DM1.cdsReporte.Close;
end;

procedure TFrephojcar.dblcdusuarioExit(Sender: TObject);
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

procedure TFrephojcar.rgtipexpClick(Sender: TObject);
begin
  limpia;
end;

procedure TFrephojcar.rgestexpClick(Sender: TObject);
begin
   limpia;
end;

procedure TFrephojcar.rgforsolbenClick(Sender: TObject);
begin
   limpia;
end;

procedure TFrephojcar.dblcdusuarioChange(Sender: TObject);
begin
   limpia;
end;



procedure TFrephojcar.dtpfecfinalChange(Sender: TObject);
begin
   limpia;
end;



procedure TFrephojcar.btnaexcelClick(Sender: TObject);
begin
   // DM1.ExportaGridExcel(dbghojcar, 'PRE_REPHOJCARGO');
   DM1.cdsReporte1.Close;
   DM1.cdsReporte1.DataRequest(xSqlAExcel);
   DM1.cdsReporte1.Open;
   If rgtipexp.ItemIndex = 0 Then
      DM1.HojaExcel('PRE_DET_REPHOJCARGO',DM1.dsReporte1, dbgAExcel)
   Else
      DM1.HojaExcel('PRE_RES_REPHOJCARGO',DM1.dsReporte1, dbgAExcel);
end;

end.
