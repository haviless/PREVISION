// Inicio: HPP_200906_PRE realizado por IREVILLA
// HPC_201307_PRE : Se añade imagen del nuevo logo institucional
// SPP_201401_PRE : Se realiza el pase a producción a partir del pase HPC_201307_PRE
// HPC_201508_PRE : Se añade campo para mostrar valor CCI.

unit PRE937;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ppCtrls, ppBands,
  ppVar, ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv,
  ppDB, ppDBPipe, DB, jpeg, ppParameter, ppDBBDE;  // SPP_201401_PRE

type
  TFctainddet = class(TForm)
    dbgdetalle: TwwDBGrid;
    btncerrar: TBitBtn;
    btnimprimir: TBitBtn;
    // ppDB1: TppDBPipeline; SPP_201401_PRE
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    //Inicio: SPP_201401_PRE
    // ppLabel2: TppLabel;
    // ppLabel3: TppLabel;
    // ppLabel13: TppLabel;
    // ppLabel14: TppLabel;
    // ppLabel15: TppLabel;
    // ppLabel16: TppLabel;
    // ppSystemVariable1: TppSystemVariable;
    // ppSystemVariable2: TppSystemVariable;
    ppDetailBand1: TppDetailBand;
    ppShape12: TppShape;
    ppShape11: TppShape;
    ppShape10: TppShape;
    ppShape9: TppShape;
    ppShape8: TppShape;
    ppShape7: TppShape;
    ppShape6: TppShape;
    ppShape5: TppShape;
    ppShape4: TppShape;
    // ppDetailBand1: TppDetailBand;
    // ppDBText2: TppDBText;
    // ppDBText3: TppDBText;
    ppShape1: TppShape;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    //Fin: SPP_201401_PRE
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    //Inicio: SPP_201401_PRE
    // ppDetailBand1: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    // ppShape1: TppShape;
    //Fin: SPP_201401_PRE
    ppLabel1: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    // Inicio: HPC_201508_PRE
    //Inicio: SPP_201401_PRE
    // ppImage2: TppImage;
    // ppLine8: TppLine;
    // ppLabel28: TppLabel;
    // Fin: HPC_201508_PRE

    ppBDEReporte1: TppBDEPipeline;
    // ppShape8: TppShape;
    // ppShape9: TppShape;
    // ppShape10: TppShape;
    // ppShape11: TppShape;
    // ppShape12: TppShape;
    //Fin: SPP_201401_PRE
    ppDBText1: TppDBText;
    // ppDBText2: TppDBText; // SPP_201401_PRE
    // ppDBText3: TppDBText; // SPP_201401_PRE
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    // ppLabel11: TppLabel; SPP_201401_PRE
    ppLine1: TppLine;
    ppSummaryBand1: TppSummaryBand;
//Inicio: SPP_201401_PRE
    // ppLabel12: TppLabel; 
    // ppLabel19: TppLabel; 
    pplUsuario1: TppLabel; 
    pplFecha1: TppLabel; 
    // Inicio: HPC_201508_PRE
    ppShape2: TppShape;
    ppLabel11: TppLabel;
    ppDBText11: TppDBText;
    ppImage4: TppImage;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppLabel33: TppLabel;
    // Fin: HPC_201508_PRE
//Fin: SPP_201401_PRE
    procedure btncerrarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fctainddet: TFctainddet;

implementation

uses PREDM;

{$R *.dfm}

procedure TFctainddet.btncerrarClick(Sender: TObject);
begin
  Fctainddet.Close;
end;

procedure TFctainddet.FormActivate(Sender: TObject);
begin
  dbgdetalle.Selected.Clear;
  dbgdetalle.Selected.Add('ASOCODMOD'#9'10'#9'Código~modular'#9#9);
  dbgdetalle.Selected.Add('ASOAPENOM'#9'37'#9'Apellidos y nombre(s)'#9#9);
  // Inicio: HPC_201508_PRE
  // dbgdetalle.Selected.Add('FECRES'#9'10'#9'F.Res.~Nombramiento'#9#9);
  dbgdetalle.Selected.Add('FECRES'#9'10'#9'F.Res.~Nomb.'#9#9);
  // Fin: HPC_201508_PRE
  dbgdetalle.Selected.Add('ANOSER'#9'2'#9'Año Servicio~1996'#9#9);
  dbgdetalle.Selected.Add('ACUMESANT'#9'8'#9'Monto a~1996'#9#9);
  // Inicio: HPC_201508_PRE
  // dbgdetalle.Selected.Add('ANOSERF'#9'8'#9'Años de servicio~'+DM1.cdsReporte.FieldByName('FECULT').AsString+#9#9);
  dbgdetalle.Selected.Add('ANOSERF'#9'8'#9'Años~al'+DM1.cdsReporte.FieldByName('FECULT').AsString+#9#9);
  // Fin: HPC_201508_PRE
  dbgdetalle.Selected.Add('CAPITAL'#9'8'#9'Aportes'#9#9);
  dbgdetalle.Selected.Add('INTCAPACU'#9'8'#9'Intereses'#9#9);
  dbgdetalle.Selected.Add('BONOS'#9'8'#9'Bonos'#9#9);
  // Inicio: HPC_201508_PRE
  dbgdetalle.Selected.Add('MONCCI'#9'8'#9'CCI~Desc.(-)'#9#9);
  // Fin: HPC_201508_PRE
  dbgdetalle.Selected.Add('ACUMULADO'#9'8'#9'Total~acumulado'#9#9);
  //Inicio: SPP_201401_PRE
  // TNumericField(DM1.cdsQry.FieldByName('ACUMESANT')).DisplayFormat  := '##,##0.00';
  // TNumericField(DM1.cdsQry.FieldByName('CAPITAL')).DisplayFormat    := '##,##0.00';
  // TNumericField(DM1.cdsQry.FieldByName('INTCAPACU')).DisplayFormat  := '##,##0.00';
  // TNumericField(DM1.cdsQry.FieldByName('BONOS')).DisplayFormat      := '##,##0.00';
  // TNumericField(DM1.cdsQry.FieldByName('ACUMULADO')).DisplayFormat  := '##,##0.00';
  TNumericField(DM1.cdsCuentas.FieldByName('ACUMESANT')).DisplayFormat  := '##,##0.00';
  TNumericField(DM1.cdsCuentas.FieldByName('CAPITAL')).DisplayFormat    := '##,##0.00';
  TNumericField(DM1.cdsCuentas.FieldByName('INTCAPACU')).DisplayFormat  := '##,##0.00';
  TNumericField(DM1.cdsCuentas.FieldByName('BONOS')).DisplayFormat      := '##,##0.00';
  // Inicio: HPC_201508_PRE
  TNumericField(DM1.cdsCuentas.FieldByName('MONCCI')).DisplayFormat      := '##,##0.00';
  // Fin: HPC_201508_PRE
  TNumericField(DM1.cdsCuentas.FieldByName('ACUMULADO')).DisplayFormat  := '##,##0.00';
  //Fin: SPP_201401_PRE
  dbgdetalle.ApplySelected;
end;

procedure TFctainddet.btnimprimirClick(Sender: TObject);
begin
  //Inicio: SPP_201401_PRE
  // ppLabel11.Caption := DM1.cdsReporte.FieldByName('FECULT').AsString;
  ppLabel17.Caption := 'DETALLE DE SALDOS DE CUENTAS INDIVIDUALES DE APORTES AL '+DM1.cdsReporte.FieldByName('FECULT').AsString;
  pplUsuario1.Caption := 'Usuario : ' + DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
  pplFecha1.Caption := 'Fecha y hora de impresiòn : '+DateToStr(Date)+' - '+TimeToStr(Time);  
  ppReport1.Print;
  //Fin: SPP_201401_PRE
end;
// Fin: HPP_200906_PRE realizado por IREVILLA
end.

