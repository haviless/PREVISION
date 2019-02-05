// Inicio Uso Estándares : 01/08/2011
// Unidad                : Previsión Social
// Formulario            : Fimpretjud
// Fecha de Creación     : 07/08/2011
// Autor                 : Equipo de desarrollo
// Objetivo              : Impresión de retenciones judiciales
// Actualizaciones
// HPC_201305_PRE        : Creación de reporte detallado de retenciones judiciales repcepcionadad por el equipo de previsión social
// SPP_201306_PRE        : Se realiza el pase a producción a partir del HPC_201305_PRE
// HPC_201307_PRE        : Se añade imagen de nuevo logo institucional
// SPP_201401_PRE        : Se realiza el pase a producción a partir del pase HPC_201307_PRE


unit PRE285;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, ComCtrls,
  wwdbdatetimepicker, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd,
  ppClass, ppReport, ppBands, ppCache, ppPrnabl, ppCtrls, ppVar, jpeg;  // SPP_201401_PRE

type
  TFimpretjud = class(TForm)
    gbfecha: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    btncerrar: TBitBtn;
    btnaexcel: TBitBtn;
    btnprocesar: TBitBtn;
    dbgrepretjud: TwwDBGrid;
    btnimprimir: TBitBtn;
    dtpfecinicio: TwwDBDateTimePicker;
    dtpfecfinal: TwwDBDateTimePicker;
    pprepretjud: TppReport;
    ppBDEPipeline1: TppBDEPipeline;
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
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
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
    ppLine1: TppLine;
    pplusuqueimp: TppLabel;
    pplhorqueimp: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppLabel4: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel11: TppLabel;
    ppLabel15: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppImage1: TppImage; // SPP_201401_PRE
    procedure btnprocesarClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure btnaexcelClick(Sender: TObject);
    procedure limpiagrid;
    procedure dtpfecinicioChange(Sender: TObject);
    procedure dtpfecfinalChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fimpretjud: TFimpretjud;

implementation

uses PREDM;

{$R *.dfm}

procedure TFimpretjud.btnprocesarClick(Sender: TObject);
Var xSql:String;
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

   Screen.Cursor := crHourGlass;
   xSql := 'SELECT B.ASODNI, B.ASOAPENOMDNI, C.DPTODES, A.FREG, A.USUARIO, A.PVSLBENNR, RTJPORC, RTJIMPOR, RTJJUZG, RTJFREC, RTJNOFIC FROM PVS305 A, APO201 B, APO158 C'
   +' WHERE A.FREG >= '+QuotedStr(dtpfecinicio.Text)+' AND A.FREG <= '+QuotedStr(dtpfecfinal.Text)+' AND A.ASOID = B.ASOID(+) AND SUBSTR(B.ZIPID,1,2) = C.DPTOID(+) ORDER BY A.FREG';
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

   dbgrepretjud.Selected.Clear;
   dbgrepretjud.Selected.Add('DPTODES'#9'15'#9'Departamento~de residencia'#9#9);
   dbgrepretjud.Selected.Add('ASODNI'#9'8'#9'DNI del~Asociado'#9#9);
   dbgrepretjud.Selected.Add('ASOAPENOMDNI'#9'60'#9'Apellidos~y Nombre(s)'#9#9);
   dbgrepretjud.Selected.Add('USUARIO'#9'15'#9'Usuario que~registra'#9#9);
   dbgrepretjud.Selected.Add('FREG'#9'15'#9'Fecha de~registro'#9#9);
   dbgrepretjud.Selected.Add('PVSLBENNR'#9'10'#9'Liquidación de~beneficio'#9#9);
   dbgrepretjud.Selected.Add('RTJPORC'#9'10'#9'Porcentaje a~retener'#9#9);
   dbgrepretjud.Selected.Add('RTJIMPOR'#9'10'#9'Importe a~retener'#9#9);
   dbgrepretjud.Selected.Add('RTJJUZG'#9'45'#9'Juzgado~que retiene'#9#9);
   dbgrepretjud.Selected.Add('RTJNOFIC'#9'25'#9'Número de~oficio'#9#9);
   dbgrepretjud.Selected.Add('RTJFREC'#9'10'#9'Fecha del~oficio'#9#9);
   dbgrepretjud.ApplySelected;
   dbgrepretjud.ColumnByName('DPTODES').FooterValue := 'Total registros : ';
   dbgrepretjud.ColumnByName('ASODNI').FooterValue := IntToStr(DM1.cdsQry10.RecordCount);

end;


procedure TFimpretjud.btncerrarClick(Sender: TObject);
begin
   Fimpretjud.Close;
end;

procedure TFimpretjud.btnimprimirClick(Sender: TObject);
begin
   pplfechas.Caption := 'DEL '+dtpfecinicio.Text+' AL '+dtpfecfinal.Text;
   pplusuqueimp.Caption := 'USUARIO: '+DM1.wUsuario;
   pplhorqueimp.Caption := 'HORA DE IMPRESION: '+TimeToStr(Time);
   pprepretjud.Print;
   pprepretjud.Stop;
end;

procedure TFimpretjud.FormKeyPress(Sender: TObject; var Key: Char);
begin
 If Key = #13 Then
  begin
    Key := #0;
    Perform(CM_DIALOGKEY, VK_TAB, 0);
  end;
end;

procedure TFimpretjud.FormActivate(Sender: TObject);
begin
   btnimprimir.Enabled := False;
   btnaexcel.Enabled   := False;
   DM1.cdsQry10.Close;
   dbgrepretjud.Selected.Clear;
end;

procedure TFimpretjud.btnaexcelClick(Sender: TObject);
begin
  DM1.ExportaGridExcel(dbgrepretjud, 'PRE_DETRETJUD');
end;

procedure TFimpretjud.limpiagrid;
begin
   If DM1.cdsQry10.Active = True Then DM1.cdsQry10.Close;
   btnimprimir.Enabled := False;
   btnaexcel.Enabled := False;
   dbgrepretjud.Selected.Clear;
end;

procedure TFimpretjud.dtpfecinicioChange(Sender: TObject);
begin
   limpiagrid;
end;

procedure TFimpretjud.dtpfecfinalChange(Sender: TObject);
begin
   limpiagrid;
end;

end.
