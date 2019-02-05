// HPC_201307_PRE   : Se añade imagen del nuevo logo institucional
// SPP_201401_PRE   : Se realiza el pase a producción a partir del pase HPC_201307_PRE
// HPC_201709_PRE   : Se añade al filtro para mostrar información el departamento y
//                    oficina de origen

unit PRE932;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, wwdbdatetimepicker, Grids, Wwdbigrd, Wwdbgrid, DB,
  DBGrids, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe,
  ppDBBDE, ppCtrls, ppPrnabl, ppBands, ppCache, ppVar, ppParameter, jpeg,
  // Inicio: HPC_201709_PRE
  // Se añaden unidades para el manejo de los componentes
  Mask, ExtCtrls, wwdblook;  // SPP_201401_PRE
  // Fin: HPC_201709_PRE

type
  TFresliqben = class(TForm)
    dbgPrevio: TwwDBGrid;
    // Inicio: HPC_201709_PRE
    // Se modifica el nombre del grupo
    // GroupBox1: TGroupBox;
    gbfecha: TGroupBox;
    // Fin: HPC_201709_PRE
    Label1: TLabel;
    Label2: TLabel;
    dbdtpinicial: TwwDBDateTimePicker;
    dbdtpfinal: TwwDBDateTimePicker;
    // Inicio: HPC_201709_PRE
    // Se retira boton para procedar los datos
    // btnprocesar: TBitBtn;
    // Fin: HPC_201709_PRE
    btnaexcel: TBitBtn;
    btnimprimir: TBitBtn;
    btnsalir: TBitBtn;
    // Inicio: HPC_201709_PRE
    // Se retira grid no usado
    // DBGrid: TDBGrid;
    // Fin: HPC_201709_PRE
    ppbdereporte: TppBDEPipeline;
    pprreporte: TppReport;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppShape3: TppShape;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppShape2: TppShape;
    ppLabel4: TppLabel;
    ppShape4: TppShape;
    ppLabel2: TppLabel;
    ppShape7: TppShape;
    ppLabel7: TppLabel;
    ppShape10: TppShape;
    ppLabel10: TppLabel;
    ppShape13: TppShape;
    ppLabel14: TppLabel;
//Inicio: SPP_201401_PRE
    // ppLabel13: TppLabel; 
    // ppLabel15: TppLabel; 
//Fin: SPP_201401_PRE
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppLabel22: TppLabel;
    ppltitulo02: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLine1: TppLine;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppLine2: TppLine;
    ppLabel23: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    pplimpresopor: TppLabel;
    ppShape5: TppShape;
    ppLabel5: TppLabel;
    ppShape6: TppShape;
    ppLabel6: TppLabel;
    ppShape8: TppShape;
    ppLabel8: TppLabel;
    ppShape9: TppShape;
    ppLabel9: TppLabel;
    ppShape11: TppShape;
    ppLabel11: TppLabel;
    ppShape12: TppShape;
    ppLabel12: TppLabel;
    ppShape14: TppShape;
    ppLabel24: TppLabel;
    ppDBText10: TppDBText;
    ppImage1: TppImage;  // SPP_201401_PRE
    // Inicio: HPC_201709_PRE
    // Se añaden variables para ser usadas en el nuevo reporte
    gbdepofi: TGroupBox;
    Label4: TLabel;
    Label6: TLabel;
    dblcdptoid: TwwDBLookupCombo;
    dblcdofid: TwwDBLookupCombo;
    pnldesdpto: TPanel;
    medesdpto: TMaskEdit;
    Panel1: TPanel;
    edtOficina: TMaskEdit;
    btnprocesar: TBitBtn;
    ppShape15: TppShape;
    ppLabel13: TppLabel;
    ppDBText11: TppDBText;
    dbgAExcel: TDBGrid;
    // Fin: HPC_201709_PRE
    procedure btnprocesarClick(Sender: TObject);
    procedure btnsalirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnaexcelClick(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    // Inicio: HPC_201709_PRE
    // Nuevos procedimiento para validar el ingreso de los datos
    procedure dblcdptoidExit(Sender: TObject);
    procedure dblcdofidExit(Sender: TObject);
    procedure dbdtpinicialExit(Sender: TObject);
    procedure dbdtpinicialChange(Sender: TObject);
    procedure dbdtpfinalChange(Sender: TObject);
    procedure dblcdptoidChange(Sender: TObject);
    procedure dblcdofidChange(Sender: TObject);
  private
    xSql, xSqlAExcel:String;  
    Procedure limpia;
    // Fin: HPC_201709_PRE
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fresliqben: TFresliqben;

implementation

uses PREDM;

{$R *.dfm}


// Inicio: HPC_201709_PRE
// Se modifica el procedimiento para procesar la información del grid
procedure TFresliqben.btnprocesarClick(Sender: TObject);
// Se envia la variable a la zona de privados
// Var xSql:String;
  Var canret, sumret, canfal, sumfal, caninv, suminv, cantot, sumtot:Double;
begin
   // Se valida el ingreso de las fechas del proceso
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
   Screen.Cursor:=crHourGlass;
   // Se modifica el Qry que muestra la información de las liquidaciones de beneficio
   xSql := 'SELECT ROWNUM NUMERO, DPTODES, OFDESNOM,  RETIRO, CAN_RET, FALLECIMIENTO, CAN_FAL, INVALIDEZ, CAN_INV, SUM_TOT, CAN_TOT'
   +' FROM (SELECT DPTODES, OFDESNOM, SUM(NVL(RETIRO,0)) RETIRO, SUM(NVL(CAN_RET,0)) CAN_RET, SUM(NVL(FALLECIMIENTO,0)) FALLECIMIENTO, SUM(NVL(CAN_FAL,0)) CAN_FAL,'
   +' SUM(NVL(INVALIDEZ,0)) INVALIDEZ, SUM(NVL(CAN_INV,0)) CAN_INV, SUM(NVL(RETIRO,0)+NVL(FALLECIMIENTO,0)+NVL(INVALIDEZ,0)) SUM_TOT,'
   +' SUM(NVL(CAN_RET,0)+NVL(CAN_FAL,0)+NVL(CAN_INV,0)) CAN_TOT FROM ('
   +' SELECT C.DPTODES, E.OFDESNOM,'
   +' CASE WHEN A.PVSLTIPBE = ''01'' THEN A.MONLIQBEN END RETIRO,        CASE WHEN A.PVSLTIPBE = ''01'' THEN 1 ELSE 0 END CAN_RET,'
   +' CASE WHEN A.PVSLTIPBE = ''02'' THEN A.MONLIQBEN END FALLECIMIENTO, CASE WHEN A.PVSLTIPBE = ''02'' THEN 1 ELSE 0 END CAN_FAL,'
   +' CASE WHEN A.PVSLTIPBE = ''03'' THEN A.MONLIQBEN END INVALIDEZ,     CASE WHEN A.PVSLTIPBE = ''03'' THEN 1 ELSE 0 END CAN_INV'
   +' FROM PVS306 A, APO201 B, APO158 C, PVS301 D, APO110 E'
   +' WHERE TO_DATE(A.PVSLFECBE) >= '+QuotedStr(dbdtpinicial.Text)+' AND TO_DATE(A.PVSLFECBE) <= '+QuotedStr(dbdtpfinal.Text)
   +' AND A.PVSESTLIQ IN (''02'',''05'',''06'') AND A.ASOID = B.ASOID'
   +' AND A.ASOID = D.ASOID AND A.PVSEXPNRO = D.PVSEXPNRO';
   If Trim(dblcdptoid.Text) <> '' Then
   Begin
      xSql := xSql + ' AND D.DEPORIEXP = '+QuotedStr(dblcdptoid.Text);
      If Trim(dblcdofid.Text) <> '' Then
         xSql := xSql + ' AND D.OFIORIEXP = '+QuotedStr(dblcdofid.Text);
   End;
   xSql := xSql + ' AND D.DEPORIEXP = C.DPTOID AND D.DEPORIEXP = E.DPTOID AND D.OFIORIEXP = E.OFDESID)'
   +' GROUP BY DPTODES, OFDESNOM) ORDER BY NUMERO';
   xSqlAExcel := xSql;
   DM1.cdsReporte.Close;
   DM1.cdsReporte.DataRequest(xSql);
   DM1.cdsReporte.Open;
   DM1.cdsReporte.First;
   canret := 0;
   sumret := 0;
   canfal := 0;
   sumfal := 0;
   caninv := 0;
   suminv := 0;
   cantot := 0;
   sumtot := 0;
   While Not DM1.cdsReporte.Eof Do
   Begin
     canret := canret + DM1.cdsReporte.FieldByName('CAN_RET').AsFloat;
     sumret := sumret + DM1.cdsReporte.FieldByName('RETIRO').AsFloat;
     canfal := canfal + DM1.cdsReporte.FieldByName('CAN_FAL').AsFloat;
     sumfal := sumfal + DM1.cdsReporte.FieldByName('FALLECIMIENTO').AsFloat;
     caninv := caninv + DM1.cdsReporte.FieldByName('CAN_INV').AsFloat;
     suminv := suminv + DM1.cdsReporte.FieldByName('INVALIDEZ').AsFloat;
     cantot := cantot + DM1.cdsReporte.FieldByName('CAN_TOT').AsFloat;
     sumtot := sumtot + DM1.cdsReporte.FieldByName('SUM_TOT').AsFloat;
     DM1.cdsReporte.Next;
   End;
   DM1.cdsReporte.First;
   dbgprevio.Selected.Clear;
   dbgprevio.Selected.Add('DPTODES'#9'13'#9'Descripción~de departamento'#9#9);
   dbgprevio.Selected.Add('OFDESNOM'#9'35'#9'Descripción~de oficina'#9#9);
   dbgprevio.Selected.Add('CAN_RET'#9'10'#9'Retiro~cantidad'#9#9);
   dbgprevio.Selected.Add('RETIRO'#9'12'#9'Retiro~monto'#9#9);
   dbgprevio.Selected.Add('CAN_FAL'#9'10'#9'Fallecimiento~cantidad'#9#9);
   dbgprevio.Selected.Add('FALLECIMIENTO'#9'12'#9'Fallecimiento~monto'#9#9);
   dbgprevio.Selected.Add('CAN_INV'#9'10'#9'Invalidez~cantidad'#9#9);
   dbgprevio.Selected.Add('INVALIDEZ'#9'12'#9'Invalidez~monto'#9#9);
   dbgprevio.Selected.Add('CAN_TOT'#9'10'#9'Total~cantidad'#9#9);
   dbgprevio.Selected.Add('SUM_TOT'#9'12'#9'Total~monto'#9#9);
   dbgprevio.ApplySelected;
   Screen.Cursor:=crDefault;
   TNumericField(DM1.cdsReporte.FieldByName('CAN_RET')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsReporte.FieldByName('CAN_INV')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsReporte.FieldByName('CAN_FAL')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsReporte.FieldByName('CAN_TOT')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsReporte.FieldByName('RETIRO')).DisplayFormat := '###,###,##0.00';
   TNumericField(DM1.cdsReporte.FieldByName('FALLECIMIENTO')).DisplayFormat := '###,###,##0.00';
   TNumericField(DM1.cdsReporte.FieldByName('INVALIDEZ')).DisplayFormat := '###,###,##0.00';
   TNumericField(DM1.cdsReporte.FieldByName('SUM_TOT')).DisplayFormat := '###,###,##0.00';
   dbgprevio.ColumnByName('CAN_RET').FooterValue := FormatFloat('###,##0',canret);
   dbgprevio.ColumnByName('CAN_FAL').FooterValue := FormatFloat('###,##0',canfal);
   dbgprevio.ColumnByName('CAN_INV').FooterValue := FormatFloat('###,##0',caninv);
   dbgprevio.ColumnByName('CAN_TOT').FooterValue := FormatFloat('###,##0',cantot);
   dbgprevio.ColumnByName('RETIRO').FooterValue := FormatFloat('###,###,##0.00',sumret);
   dbgprevio.ColumnByName('FALLECIMIENTO').FooterValue := FormatFloat('###,###,##0.00',sumfal);
   dbgprevio.ColumnByName('INVALIDEZ').FooterValue := FormatFloat('###,###,##0.00',suminv);
   dbgprevio.ColumnByName('SUM_TOT').FooterValue := FormatFloat('###,###,##0.00',sumtot);
end;
// Fin: HPC_201709_PRE

procedure TFresliqben.btnsalirClick(Sender: TObject);
begin
  Fresliqben.Close;
end;

procedure TFresliqben.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key = #13 Then
    begin
     Key := #0;
     Perform(CM_DIALOGKEY, VK_TAB, 0);
    end;
end;

// Inicio: HPC_201709_PRE
// Nuevo proceso para exportar información a excel      
procedure TFresliqben.btnaexcelClick(Sender: TObject);
begin
   // DM1.HojaExcel('REPORTE', DM1.dsReporte, DBGrid);
   DM1.cdsReporte1.Close;
   DM1.cdsReporte1.DataRequest(xSqlAExcel);
   DM1.cdsReporte1.Open;
   DM1.HojaExcel('RES_LIQBEN',DM1.dsReporte1, dbgAExcel);
end;
// Fin: HPC_201709_PRE

procedure TFresliqben.btnimprimirClick(Sender: TObject);
begin
  ppltitulo02.Caption := 'DEL '+dbdtpinicial.Text+' AL '+dbdtpfinal.Text;
  pplimpresopor.Caption := 'Impreso por : '+DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
  pprreporte.Print;
end;

// Inicio: HPC_201709_PRE
// Se carga combo con información del departamento de origen
procedure TFresliqben.FormActivate(Sender: TObject);
// Se retira la varible, se envia a la zona de privados 
// Var xSql:String;
begin
  dblcdptoid.SetFocus;
  If DM1.cdsReporte.Active = True Then DM1.cdsReporte.Close;
  xSql := 'SELECT DPTOID, DPTODES FROM APO158 WHERE DPTOID IS NOT NULL';
  DM1.cdsDpto.Close;
  DM1.cdsDpto.DataRequest(xSql);
  DM1.cdsDpto.Open;
  dblcdptoid.Selected.Clear;
  dblcdptoid.Selected.Add('DPTOID'#9'2'#9'Código'#9#9);
  dblcdptoid.Selected.Add('DPTODES'#9'25'#9'Nombre del departamento'#9#9);
end;


// Inicio: HPC_201709_PRE
// Se valida los datos de las variables a usar para el filtro de la información a mostrar 
procedure TFresliqben.dblcdptoidExit(Sender: TObject);
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
      MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
      dblcdptoid.Text := '';
      medesdpto.Text := '';
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
// Fin: HPC_201709_PRE

// Inicio: HPC_201709_PRE
// Se valida los datos de las variables a usar para el filtro de la información a mostrar 
procedure TFresliqben.dblcdofidExit(Sender: TObject);
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
      dblcdofid.Text := '';
      edtOficina.Text := '';
     End;
  End;
End;
// Fin: HPC_201709_PRE


// Inicio: HPC_201709_PRE
// Se incializa los datos cada vez que se modifique las datos del filtro
procedure TFresliqben.limpia;
begin
  If DM1.cdsReporte.Active = True Then
     DM1.cdsReporte.Close;
end;

procedure TFresliqben.dbdtpinicialExit(Sender: TObject);
begin
  limpia;
end;

procedure TFresliqben.dbdtpinicialChange(Sender: TObject);
begin
  limpia;
end;

procedure TFresliqben.dbdtpfinalChange(Sender: TObject);
begin
  limpia;
end;

procedure TFresliqben.dblcdptoidChange(Sender: TObject);
begin
  limpia;
end;

procedure TFresliqben.dblcdofidChange(Sender: TObject);
begin
  limpia;
end;
// Fin: HPC_201709_PRE

end.
