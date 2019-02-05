// Inicio Uso Estándares: 01/08/2011
// Unidad               : Previsión Social
// Formulario           : Fliqxofiint
// Fecha de Creación    : 22/01/2018
// Autor                : Sistemas
// Objetivo             : Liquidaciones por oficio interno
// Actualizaciones:
// HPC_201802_PRE       : Creación

unit PRE303;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, wwdbdatetimepicker, ExtCtrls, Buttons, Grids,
  Wwdbigrd, Wwdbgrid, DBGrids, ppCtrls, ppBands, ppVar, jpeg, ppPrnabl,
  ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe,
  ppDBBDE,DB;

type
  TFliqxofiint = class(TForm)
    GroupBox1: TGroupBox;
    btnImprimePrevio: TBitBtn;
    gbFecha: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dbdtpinicial: TwwDBDateTimePicker;
    rgorisol: TRadioGroup;
    dbgliqbenxofiint: TwwDBGrid;
    btntodas: TBitBtn;
    btncerrar: TBitBtn;
    btnaexcel: TBitBtn;
    dbgAExcel: TDBGrid;
    bdeliqxofiint: TppBDEPipeline;
    pprliqxofi: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppShape9: TppShape;
    ppLabel9: TppLabel;
    ppShape10: TppShape;
    ppLabel10: TppLabel;
    ppShape11: TppShape;
    ppLabel11: TppLabel;
    ppShape12: TppShape;
    ppLabel12: TppLabel;
    ppShape13: TppShape;
    ppLabel13: TppLabel;
    ppImage1: TppImage;
    ppLabel16: TppLabel;
    ppltituloExtorno: TppLabel;
    pplfechas: TppLabel;
    ppLabel19: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppShape14: TppShape;
    ppLabel14: TppLabel;
    ppShape15: TppShape;
    ppLabel31: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLine3: TppLine;
    pplimpresopor: TppLabel;
    ppltiporeporte: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppShape1: TppShape;
    ppLabel2: TppLabel;
    ppShape2: TppShape;
    ppLabel3: TppLabel;
    ppShape3: TppShape;
    ppLabel4: TppLabel;
    ppShape4: TppShape;
    ppLabel5: TppLabel;
    ppDBText5: TppDBText;
    ppShape5: TppShape;
    ppLabel6: TppLabel;
    ppShape6: TppShape;
    ppLabel1: TppLabel;
    ppDBText6: TppDBText;
    dbdtpFinal: TwwDBDateTimePicker;
    procedure btnImprimePrevioClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnaexcelClick(Sender: TObject);
    procedure btntodasClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure limpia;
    procedure rgorisolClick(Sender: TObject);
  private
    xSql:String;
    { Private declarations }
  public

    { Public declarations }
  end;

var
  Fliqxofiint: TFliqxofiint;

implementation

uses PREDM;

{$R *.dfm}

procedure TFliqxofiint.btnImprimePrevioClick(Sender: TObject);
Var xwherefechas:String;
begin
   If rgorisol.ItemIndex <> 0 Then
   Begin
      If Trim(dbdtpInicial.Text) = '' Then
      Begin
         MessageDlg('Ingrese la fecha inicial', mtInformation, [mbOk], 0);
         dbdtpInicial.SetFocus;
         Exit;
      End;
      If Trim(dbdtpFinal.Text) = '' Then
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
   End;
   If rgorisol.ItemIndex = -1 Then
   Begin
      MessageDlg('Seleccione el tipo de reporte', mtInformation, [mbOk], 0);
      dbdtpInicial.SetFocus;
      Exit;
   End;
   xwherefechas := ' AND A.PVSLFECBE >= '+QuotedStr(dbdtpinicial.Text)+' AND A.PVSLFECBE <= '+QuotedStr(dbdtpfinal.Text);
   xSql := 'SELECT A.PVSLBENNR NUMERO_LIQUIDACION, A.PVSLFECBE FECHA_LIQUIDACION, G.DPTODES DEPARTAMENTO_UGEL, C.BENEFDES TIPO_BENEFICIO,'
   +' NVL(A.MONLIQBEN,0) MONTO_LIQUIDACION, NVL(A.MONDES,0) DESCUENTO_LIQUIDACION, NVL(A.MONDEV,0) DEVOLUCION_LIQUIDACION, NVL(A.MONDES,0)-NVL(A.MONDEV,0) DESC_DEV_LIQUI,'
   +' CASE WHEN FLADES IS NULL THEN NVL(A.MONLIQBEN,0)+NVL(A.MONDEV,0)-NVL(A.MONDES,0) ELSE 0 END MONTO_A_PAGAR,'
   +' CASE WHEN FLADES IS NOT NULL THEN NVL(A.MONLIQBEN,0)+NVL(A.MONDEV,0)-NVL(A.MONDES,0) ELSE 0 END MONTO_PAGADO,'
   +' B.PVSNOMBRE APENOM_BENEFICIARIO, B.PVSLDNIBEN DNI_BENEFICIARIO,'
   +' D.TIPDESEDES TIPO_DESEMBOLSO, E.BANCONOM BANCO_DESEMBOLSO,'
   +' B.PVSLMONTO MONTO_DESEMBOLSO, B.PVSLNOFC NUMERO_OFICIO, B.FECPAG FECHA_PAGO, A.USUARIO USUARIO_LIQUIDA'
   +' FROM PVS306 A, PVS307 B,  TGE186 C, CRE104 D, TGE105 E, APO101 F, APO158 G'
   +' WHERE A.FORSOLBEN = ''O''';
   If rgorisol.ItemIndex <> 0 Then
      xSql := xSql + xwherefechas;
   xSql := xSql + ' AND A.PVSESTLIQ NOT IN (''04'',''13'') AND A.PVSLBENNR =  B.PVSLBENNR(+) AND B.PVSLAGRID(+) = ''FPG''  AND B.FLGVOUCHER(+) = ''N'''
   +' AND A.PVSLTIPBE = C.TIPBENEF(+)'
   +' AND B.FORPAGOID = D.TIPDESEID(+)'
   +' AND B.BANCOID = E.BANCOID(+)'
   +' AND A.UPROID = F.UPROID(+) AND A.UPAGOID = F.UPAGOID(+) AND A.USEID = F.USEID(+) AND F.DPTOID = G.DPTOID(+)';
   If rgorisol.ItemIndex = 0 Then
      xSql := xSql + ' AND A.FLADES IS NULL';
   If rgorisol.ItemIndex = 1 Then
      xSql := xSql + ' AND A.FLADES IS NOT NULL';
   xSql := xSql + ' ORDER BY A.PVSLBENNR';
   Screen.Cursor := crHourGlass;
   DM1.cdsReporte.Close;
   DM1.cdsReporte.DataRequest(xSql);
   DM1.cdsReporte.Open;
   Screen.Cursor := crDefault;
   If DM1.cdsReporte.RecordCount = 0 Then
   Begin
      limpia;
      MessageDlg('No existe información para mostrar', mtCustom, [mbOk], 0);
      Exit;
   End;
   dbgliqbenxofiint.Selected.Clear;
   dbgliqbenxofiint.Selected.Add('NUMERO_LIQUIDACION'#9'11'#9'Número~liquidación'#9#9);
   dbgliqbenxofiint.Selected.Add('FECHA_LIQUIDACION'#9'10'#9'Fecha~liquidación'#9#9);
   dbgliqbenxofiint.Selected.Add('DEPARTAMENTO_UGEL'#9'15'#9'Departamento~UGEL'#9#9);
   dbgliqbenxofiint.Selected.Add('TIPO_BENEFICIO'#9'12'#9'Tipo~beneficio'#9#9);
   dbgliqbenxofiint.Selected.Add('MONTO_LIQUIDACION'#9'9'#9'Monto~liquidación'#9#9);
   dbgliqbenxofiint.Selected.Add('DESCUENTO_LIQUIDACION'#9'9'#9'Descuento~liquidación'#9#9);
   dbgliqbenxofiint.Selected.Add('DEVOLUCION_LIQUIDACION'#9'9'#9'Devolución~liquidación'#9#9);
   dbgliqbenxofiint.Selected.Add('MONTO_A_PAGAR'#9'9'#9'Monto a~pagar'#9#9);
   dbgliqbenxofiint.Selected.Add('MONTO_PAGADO'#9'9'#9'Monto~pagado'#9#9);
   dbgliqbenxofiint.Selected.Add('APENOM_BENEFICIARIO'#9'32'#9'Apellidos y nombre(s) del beneficiario'#9#9);
   dbgliqbenxofiint.Selected.Add('DNI_BENEFICIARIO'#9'8'#9'DNI del~beneficiario'#9#9);
   dbgliqbenxofiint.Selected.Add('TIPO_DESEMBOLSO'#9'15'#9'Tipo~desembolso'#9#9);
   dbgliqbenxofiint.Selected.Add('BANCO_DESEMBOLSO'#9'12'#9'Banco~desembolso'#9#9);
   dbgliqbenxofiint.Selected.Add('MONTO_DESEMBOLSO'#9'8'#9'Monto~desembolso'#9#9);
   dbgliqbenxofiint.Selected.Add('NUMERO_OFICIO'#9'11'#9'Númerp~oficio'#9#9);
   dbgliqbenxofiint.Selected.Add('FECHA_PAGO'#9'10'#9'Fecha~pago'#9#9);
   dbgliqbenxofiint.Selected.Add('USUARIO_LIQUIDA'#9'15'#9'Usuario~liquida'#9#9);
   TNumericField(DM1.cdsReporte.FieldByName('MONTO_LIQUIDACION')).DisplayFormat := '##,##0.00';
   TNumericField(DM1.cdsReporte.FieldByName('DESCUENTO_LIQUIDACION')).DisplayFormat := '##,##0.00';
   TNumericField(DM1.cdsReporte.FieldByName('DEVOLUCION_LIQUIDACION')).DisplayFormat := '##,##0.00';
   TNumericField(DM1.cdsReporte.FieldByName('MONTO_A_PAGAR')).DisplayFormat := '##,##0.00';
   TNumericField(DM1.cdsReporte.FieldByName('MONTO_PAGADO')).DisplayFormat := '##,##0.00';
   TNumericField(DM1.cdsReporte.FieldByName('MONTO_DESEMBOLSO')).DisplayFormat := '##,##0.00';
   dbgliqbenxofiint.ApplySelected;
End;

procedure TFliqxofiint.btncerrarClick(Sender: TObject);
begin
   Close;
end;

procedure TFliqxofiint.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  begin
    Key := #0;
    Perform(CM_DIALOGKEY, VK_TAB, 0);
  end;
end;

procedure TFliqxofiint.btnaexcelClick(Sender: TObject);
begin
   DM1.cdsReporte1.Close;
   DM1.cdsReporte1.DataRequest(xSql);
   DM1.cdsReporte1.Open;
   DM1.HojaExcel('PRE_LIQXOFICIO',DM1.dsReporte1, dbgAExcel);
end;

procedure TFliqxofiint.btntodasClick(Sender: TObject);
begin
   If rgorisol.ItemIndex = 0 Then ppltiporeporte.Caption := 'TIPO DE REPORTE: PENDIENTES DE PAGO';
   If rgorisol.ItemIndex = 1 Then ppltiporeporte.Caption := 'TIPO DE REPORTE: PAGADOS';
   If rgorisol.ItemIndex = 2 Then ppltiporeporte.Caption := 'TIPO DE REPORTE: TODOS';
   pplfechas.Caption := 'DEL '+dbdtpinicial.Text+' AL '+dbdtpfinal.Text;
   pplimpresopor.Caption:='Impreso por   : '+DM1.CrgDescrip('USERID='+QuotedStr(Trim(DM1.wUsuario)),'TGE006','USERNOM');
   pprliqxofi.Print;
end;

procedure TFliqxofiint.FormActivate(Sender: TObject);
begin
   If DM1.cdsReporte.Active Then DM1.cdsReporte.Close;
   gbFecha.Visible := False;
end;

procedure TFliqxofiint.limpia;
begin
   If DM1.cdsReporte.Active Then DM1.cdsReporte.Close;
end;

procedure TFliqxofiint.rgorisolClick(Sender: TObject);
begin
   If rgorisol.ItemIndex = 0 Then
      gbFecha.Visible := False
   Else
   Begin
      gbFecha.Visible := True;
      dbdtpinicial.SetFocus;
   end;
End;

end.
