Unit PRE600;
// Inicio Uso Estándares         : 01/08/2011
// Unidad                        : PRE600
// Formulario                    : VisorProgCesaSinLiqui
// Fecha de Creación             : 12/01/2018
// Autor                         : Jesús Castillo Pampas.
// Objetivo                      : Formulario para programar la ejecución de los reportes de cesantes sin liquidación
// HPC_201801_PRE                : Generación de Reporte de Cesantes sin Liquidación

// Inicio HPC_201801_PRE
// Generación de Reporte de Cesantes sin Liquidación
Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Grids, Wwdbigrd, Wwdbgrid, wwdbedit, Wwdbspin, Mask, Wwdbdlg,
   StdCtrls, ExtCtrls, wwdblook, fcButton, fcImgBtn, fcShapeBtn, DB,
   wwdbdatetimepicker;

Type
   TVisorProgCesaSinLiqui = Class(TForm)
      gbfiltra: TGroupBox;
      gbProgramacion: TGroupBox;
      dbgProgramacion: TwwDBGrid;
      fcSFiltra: TfcShapeBtn;
      Shape1: TShape;
      Label5: TLabel;
      Shape2: TShape;
      Label6: TLabel;
      Shape4: TShape;
      Label8: TLabel;
      Shape6: TShape;
      Label10: TLabel;
      fcSAnula: TfcShapeBtn;
      pnlanulacion: TPanel;
      Shape7: TShape;
      Label11: TLabel;
      Button1: TButton;
      fcShapeBtn1: TfcShapeBtn;
      Panel4: TPanel;
      edtUsuario: TEdit;
      edtFecha: TEdit;
      rdbTodos: TRadioButton;
      rdbProcesados: TRadioButton;
      rdbEnProceso: TRadioButton;
      rdbNoProcesados: TRadioButton;
      rdbAnulados: TRadioButton;
      Panel1: TPanel;
     edtanulacion: TEdit;
      Procedure FormActivate(Sender: TObject);
      Procedure fcSFiltraClick(Sender: TObject);
      Procedure fcSAnulaClick(Sender: TObject);
      Procedure fcShapeBtn1Click(Sender: TObject);
      Procedure Button1Click(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure dbgProgramacionCalcCellColors(Sender: TObject; Field: TField;
        State: TGridDrawState; Highlight: Boolean; AFont: TFont;
        ABrush: TBrush);
      procedure dbgProgramacionDblClick(Sender: TObject);
    procedure edtanulacionKeyPress(Sender: TObject; var Key: Char);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   VisorProgCesaSinLiqui: TVisorProgCesaSinLiqui;

Implementation

Uses PREDM;

{$R *.dfm}

Procedure TVisorProgCesaSinLiqui.FormActivate(Sender: TObject);

Begin

   fcSFiltraClick(Self);
   dbgProgramacion.Selected.Clear;
   dbgProgramacion.Selected.Add('ESTADOD'#9'17'#9'Estado');
   dbgProgramacion.Selected.Add('USUREG'#9'10'#9'Usuario Reg.');
   dbgProgramacion.Selected.Add('FECREG'#9'16'#9'Fecha Reg.');
   dbgProgramacion.Selected.Add('FECPRO'#9'10'#9'Fecha Progra.');
   dbgProgramacion.Selected.Add('USUANU'#9'10'#9'Usuario Anula.');
   dbgProgramacion.Selected.Add('FECANU'#9'10'#9'Fecha Anula.');
   dbgProgramacion.DataSource := dm1.dsQry2;
End;

Procedure TVisorProgCesaSinLiqui.fcSFiltraClick(Sender: TObject);
Var
   xwhere, xsql: String;

Begin
   xWhere := '';

   If rdbProcesados.Checked Then
      xWhere := XWhere + ' ESTADO = '+QuotedStr('1');

   If rdbNoProcesados.Checked Then
      xWhere := XWhere + ' ESTADO = '+QuotedStr('2');

   If rdbEnProceso.Checked Then
      xWhere := XWhere + ' ESTADO = '+QuotedStr('0');

   If rdbAnulados.Checked Then
      xWhere := XWhere + ' ESTADO = '+QuotedStr('3');


   If trim(xWhere)<>'' Then
   Begin
      xSQL := 'SELECT USUREG,FECREG,FECPRO,USUANU,FECANU,ESTADO,MOTANU, '
          +'CASE WHEN ESTADO=''0'' THEN ''En Proceso'' WHEN ESTADO=''1'' THEN ''Procesado'' '
          +'WHEN ESTADO=''2'' THEN ''Procesado con Errores'' WHEN ESTADO=''3'' THEN ''Anulado'' END ESTADOD '
          +'FROM PRE_PRO_REP_CES_SLI_DET WHERE '
          + xWhere;
   End
   Else
   Begin
       xSQL := 'SELECT USUREG,FECREG,FECPRO,USUANU,FECANU,ESTADO,MOTANU, '
          +'CASE WHEN ESTADO=''0'' THEN ''En Proceso'' WHEN ESTADO=''1'' THEN ''Procesado'' '
          +'WHEN ESTADO=''2'' THEN ''Procesado con Errores'' WHEN ESTADO=''3'' THEN ''Anulado'' END ESTADOD '
          +'FROM PRE_PRO_REP_CES_SLI_DET ';
   End;
   
   DM1.cdsQry2.Close;
   DM1.cdsQry2.DataRequest(XSQL);
   DM1.cdsQry2.Open;
   dbgProgramacion.DataSource := DM1.dsQry2;
End;

Procedure TVisorProgCesaSinLiqui.fcSAnulaClick(Sender: TObject);
Begin

   If Dm1.cdsQry2.RecordCount = 0 Then
   Begin
      MessageDlg('No Existe Información para Anular, Anulación no Procede', mtInformation, [mbOk], 0);
      Exit;
   End;

   If (DM1.cdsQry2.FieldByName('ESTADO').AsString = '3') Then
   begin
     ShowMessage('La programación ya se encuentra Anulada');
     exit;
   End;
   If (DM1.cdsQry2.FieldByName('ESTADO').AsString = '1') Then
   begin
     ShowMessage('No se puede anular una programación Procesada');
     exit;
   End;
   If (DM1.cdsQry2.FieldByName('ESTADO').AsString = '2') Then
   begin
     ShowMessage('No se puede anular una programación Procesada con Errores');
     exit;
   End;

   pnlanulacion.Top := 127;
   pnlanulacion.Left := 105;
   pnlanulacion.Visible := True;
   gbfiltra.Enabled := False;
   gbProgramacion.Enabled := False;
   Panel1.Enabled := True;
   fcShapeBtn1.Enabled := True;
   edtUsuario.Text := DM1.cdsQry2.FieldByName('USUREG').AsString;
   edtFecha.Text := DM1.cdsQry2.FieldByName('FECPRO').AsString;
   edtanulacion.Text := DM1.cdsQry2.FieldByName('MOTANU').AsString;
   edtanulacion.SetFocus;
End;

Procedure TVisorProgCesaSinLiqui.fcShapeBtn1Click(Sender: TObject);

Var
   xsql: String;

Begin
   If Length(Trim(edtanulacion.Text)) = 0 Then
   Begin
      MessageDlg('Debe ingresar observación de la Anulación ', mtInformation, [mbOk], 0);
      edtanulacion.SetFocus;
      Exit;
   End;

   Xsql := 'UPDATE PRE_PRO_REP_CES_SLI_DET '
          +'SET ESTADO=''3'', fecanu=trunc(sysdate), MOTANU=''' + trim(edtanulacion.Text) + ''','
          +'    USUANU=''' + dm1.wUsuario + ''' '
          +'Where USUREG=''' + Dm1.cdsQry2.FieldByName('USUREG').AsString + ''' '
          +'  and FECPRO=''' + Dm1.cdsQry2.FieldByName('FECPRO').AsString + ''' ';
   Screen.Cursor := crHourglass;
   DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
   fcSFiltraClick(SELF);
   MessageDlg('Anulación procesada,', mtInformation, [mbOk], 0);
   edtanulacion.Text := '';
   Button1Click(Self);
   Screen.Cursor := crDefault;
End;

Procedure TVisorProgCesaSinLiqui.Button1Click(Sender: TObject);
Begin

   pnlanulacion.Visible := False;
   gbfiltra.Enabled := True;
   gbProgramacion.Enabled := True;

End;

procedure TVisorProgCesaSinLiqui.FormCreate(Sender: TObject);
begin
   rdbTodos.Checked:= True;
end;

procedure TVisorProgCesaSinLiqui.dbgProgramacionCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
    If Trim(DM1.cdsQry2.FieldByName('ESTADO').AsString) = '0' Then
   Begin
      ABrush.Color := clInfoBk;
      AFont.Color := clBlack;
   End;
   If Trim(DM1.cdsQry2.FieldByName('ESTADO').AsString) = '1' Then
   Begin
      ABrush.Color := clActiveCaption;
      AFont.Color := clBlack;
   End;
   If Trim(DM1.cdsQry2.FieldByName('ESTADO').AsString) = '2' Then
   Begin
      ABrush.Color := clMoneyGreen;
      AFont.Color := clBlack;
   End;
   If Trim(DM1.cdsQry2.FieldByName('ESTADO').AsString) = '3' Then
   Begin
      ABrush.Color := $006FB7FF;
      AFont.Color := clBlack;
   End;

end;

procedure TVisorProgCesaSinLiqui.dbgProgramacionDblClick(Sender: TObject);
begin
   If Trim(DM1.cdsQry2.FieldByName('ESTADO').AsString) = '3' Then
   Begin
     pnlanulacion.Top := 127;
     pnlanulacion.Left := 105;
     pnlanulacion.Visible := True;
     gbfiltra.Enabled := False;
     gbProgramacion.Enabled := False;
     edtUsuario.Text := DM1.cdsQry2.FieldByName('USUREG').AsString;
     edtFecha.Text := DM1.cdsQry2.FieldByName('FECPRO').AsString;
     edtanulacion.Text := DM1.cdsQry2.FieldByName('MOTANU').AsString;
     Panel1.Enabled := False;
     fcShapeBtn1.Enabled := False;
   End;
end;

procedure TVisorProgCesaSinLiqui.edtanulacionKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key In [ '°', '|', '¬', '!', '"', '#', '$', '%', '&', '/',
                '=', '?', '\', '¡', '¿', '@', '¨', '´', '*', '+', '~', '[',
                ']', '{', '}', '^', '`', '<', '>', ';', ':', '''',
                '_'] Then
      Key := #0;
end;

End.
// Fin HPC_201801_PRE
