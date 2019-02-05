Unit PRE602;
// Inicio Uso Estándares         : 01/08/2011
// Unidad                        : PRE602
// Formulario                    : ReportesCesaSinLiqui
// Fecha de Creación             : 12/01/2018
// Autor                         : Jesús Castillo Pampas.
// Objetivo                      : Formulario para visualizar los reportes de cesantes sin liquidación
// HPC_201801_PRE                : Generación de Reporte de Cesantes sin Liquidación

// Inicio HPC_201801_PRE
// Generación de Reporte de Cesantes sin Liquidación
//HPC_201803_PRE  : Se corrigio un error que se presentaba al hacer clic sobre la opcion "A Excel"


Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Grids, Wwdbigrd, Wwdbgrid, wwdbedit, Wwdbspin, Mask, Wwdbdlg,
   StdCtrls, ExtCtrls, wwdblook, fcButton, fcImgBtn, fcShapeBtn, DB,
   wwdbdatetimepicker, Buttons, ComCtrls, DBGrids;

Type
   TReportesCesaSinLiqui = Class(TForm)
    gbfiltra: TGroupBox;
    gbProgramacion: TGroupBox;
    Label3: TLabel;
    rdbCeInterinos: TRadioButton;
    rdbCe65: TRadioButton;
    rdbCeFallecidos: TRadioButton;
    pnlFecha: TPanel;
    dtpFecha: TDateTimePicker;
    btnExcel: TBitBtn;
    btnFiltro: TfcShapeBtn;
    dbgReporte: TwwDBGrid;
    dtgData: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure btnFiltroClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   ReportesCesaSinLiqui: TReportesCesaSinLiqui;

Implementation

Uses PREDM;

{$R *.dfm}

procedure TReportesCesaSinLiqui.FormCreate(Sender: TObject);
Var
   xsql: String;
begin

   xSQL := 'SELECT MAX(FECPRO) FECPRO FROM PRE_PRO_REP_CES_SLI_DET WHERE ESTADO=''1''';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(XSQL);
   DM1.cdsQry.Open;
   dtpFecha.Date := DM1.cdsQry.FieldByname('FECPRO').AsDateTime;
   pnlFecha.Enabled:= False;
end;

procedure TReportesCesaSinLiqui.btnFiltroClick(Sender: TObject);
Var
   xsql: String;
begin

   If rdbCeInterinos.Checked Then
      xsql := 'SELECT NOMBRES_APE, DNI, EDAD, DIRECCION, DPTO, PROVINCIA, DISTRITO, TELEFONOS, EMAIL, TIPO_ASO, '+
              'FEC_NOMB, FEC_FALLECI, BENEF_PAGAR, FEC_LIQUI, RES_CESE, FEC_CESE, NOMB_UGEL, DTO_UGEL, ULT_PER_APO, '+
              'MES_ULT_ACT_PAD, EXPEDIENTE, LIQUIDACION, EST_LIQUIDACION, SALDO_VENCIDO_A_FECHA, SALDO_TOTAL_A_FECHA, '+
              'SALDO_FSC, CTA_INDIV, CCI, NOM_COLE, CARGO, DIREC_COLE, DPTO_COLE, PROV_COLE, DIST_COLE '+
              'FROM PRE_DOCINTERINOS_DET';
   If rdbCeFallecidos.Checked Then
      xsql := 'SELECT ASOID, NOMBRES_APE, DNI, EDAD, DIRECCION, DPTO, PROVINCIA, DISTRITO, TELEFONOS, EMAIL, TIPO_ASO, '+
              'FEC_NOMB, FEC_FALLECI, CARTA_BENEF, RES_CESE, FEC_CESE, NOMB_UGEL, DTO_UGEL, ULT_PER_APO, MES_ULT_ACT_PAD, EXPEDIENTE, '+
              'EST_LIQUIDACION, SALDO_VENCIDO_A_FECHA, SALDO_TOTAL_A_FECHA, SALDO_FSC, CTA_INDIV, NOM_COLE, CARGO, DIREC_COLE, DPTO_COLE, '+
              'PROV_COLE, DIST_COLE '+
              'FROM PRE_DOCFALLECIDOS_DET';
   If rdbCe65.Checked Then
      xsql := 'SELECT ASOID, NOMBRES_APE, DNI, EDAD, DIRECCION, DPTO, PROVINCIA, DISTRITO, TELEFONOS, EMAIL, TIPO_ASO, '+
              'FEC_NOMB, RES_CESE, FEC_CESE, NOMB_UGEL, DTO_UGEL, ULT_PER_APO, MES_ULT_ACT_PAD, EXPEDIENTE, '+
              'EST_LIQUIDACION, SALDO_VENCIDO_A_FECHA, SALDO_TOTAL_A_FECHA, SALDO_FSC, CTA_INDIV, CCI, NOM_COLE, CARGO, '+
              'DIREC_COLE, DPTO_COLE, PROV_COLE, DIST_COLE '+
              'FROM PRE_MAYORES65_DET';

   If trim(xsql)<>'' Then
   Begin
      Screen.Cursor := crHourglass;
      DM1.cdsQry20.Close;
      DM1.cdsQry20.DataRequest(xsql);
      DM1.cdsQry20.Open;
      dbgReporte.DataSource := DM1.dsQry20;
      btnExcel.Enabled:=True;
      Screen.Cursor := crDefault;
   End
   Else
   Begin
     btnExcel.Enabled:=False;
     ShowMessage('Seleccione un Tipo de Reporte');
     exit;
   End;

end;

procedure TReportesCesaSinLiqui.btnExcelClick(Sender: TObject);
var
  TipoReporte : String;
begin
   //Inicio HPC_201803_PRE: se modifico para usar el client data correcto.
   If DM1.cdsQry20.RecordCount > 0 Then
   //Fin HPC_201803_PRE
   Begin
       If rdbCeInterinos.Checked Then
          TipoReporte := 'ReporteInterinos';
       If rdbCeFallecidos.Checked Then
          TipoReporte := 'ReporteFallecidos';
       If rdbCe65.Checked Then
          TipoReporte := 'ReporteDocentesMayores65';

       Screen.Cursor := crHourglass;
       dtgData.DataSource := DM1.dsQry20;
       DM1.HojaExcelCesantesSinLiqui(TipoReporte,DM1.dsQry20, dtgData);
       Screen.Cursor := crDefault;
   End
   Else
   Begin
       ShowMessage('No hay Información por Exportar a Excel');
       exit;
   End;

end;

procedure TReportesCesaSinLiqui.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     DM1.cdsQry.Close;
     DM1.cdsQry20.Close;
end;

End.
// Fin HPC_201801_PRE
