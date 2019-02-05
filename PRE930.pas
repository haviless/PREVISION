// HPC_201302_PRE  : Se valida el spinedit "seAnio" para que su maximo valor sea 2020
// SPP_201303_PRE  : El pase a producción se realiza a partir del HPC_201302_PRE
// HPC_201307_PRE  : Añade imagen del nuevo logo institucional
// SPP_201401_PRE  : Se realiza el pase a producción a partir del pase HPC_201307_PRE

unit PRE930;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXpress, DB, DBClient, SimpleDS, SqlExpr, Buttons, StdCtrls,
  ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppBands,
  ppCache, ppCtrls, ppPrnabl,ppVar, Wwdatsrc, ToolWin, ActnMan, ActnCtrls,
  Spin, jpeg;  // SPP_201401_PRE

type
  TFCuentaInd = class(TForm)
    ppDB1: TppDBPipeline;
    ppReport1: TppReport;
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLine3: TppLine;
    ppShape2: TppShape;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppDBText9: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppShape3: TppShape;
//Inicio: SPP_201401_PRE
    // ppLabel13: TppLabel; 
    // ppLabel14: TppLabel; 
//Fin: SPP_201401_PRE
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    SpeedButton2: TSpeedButton;
    ppReport2: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppShape4: TppShape;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLine6: TppLine;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
//Inicio: SPP_201401_PRE
    // ppLabel31: TppLabel;  
    // ppLabel32: TppLabel;  
//Fin: SPP_201401_PRE
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppFooterBand2: TppFooterBand;
    ppShape6: TppShape;
    ppDBText10: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText11: TppDBText;
    ppLine16: TppLine;
    ppShape5: TppShape;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBCalc7: TppDBCalc;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBCalc19: TppDBCalc;
    ppDBCalc20: TppDBCalc;
    ppDBCalc21: TppDBCalc;
    ppDBCalc22: TppDBCalc;
    SpeedButton3: TSpeedButton;
    ppReport3: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppDetailBand3: TppDetailBand;
    ppFooterBand3: TppFooterBand;
    ppShape7: TppShape;
    ppDBText18: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppShape8: TppShape;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppLabel41: TppLabel;
    ppShape9: TppShape;
    ppDBCalc16: TppDBCalc;
    ppDBCalc17: TppDBCalc;
    ppDBCalc18: TppDBCalc;
    ppLabel42: TppLabel;
//Inicio: SPP_201401_PRE
    // ppLabel43: TppLabel; 
    // ppLabel44: TppLabel; 
//Fin: SPP_201401_PRE
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppLabel49: TppLabel;
    ppSystemVariable8: TppSystemVariable;
    BitBtn1: TBitBtn;
    seAnio: TSpinEdit;
    seMes: TSpinEdit;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    Label2: TLabel;
    Label3: TLabel;
    Label13: TLabel;
//Inicio: SPP_201401_PRE
    ppImage1: TppImage;  
    ppImage2: TppImage;  
    ppImage3: TppImage;  
//Fin: SPP_201401_PRE
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCuentaInd: TFCuentaInd;

implementation

{$R *.dfm}
uses PREDM, PRE936;  //HPP_200906_PRE realizado por IREVILLA

procedure TFCuentaInd.SpeedButton1Click(Sender: TObject);

var xSql:String;
    xperiodo:String;
    xFecUlt : String;
begin
// Inicio: HPP_200906_PRE realizado por IREVILLA
  Try
    Fctaindres := TFctaindres.create(Self);
    Fctaindres.ShowModal;
  Finally
    Fctaindres.Free;
  End;
{
   if seMes.Value=12 then
      xFecUlt:= DateToStr(StrToDate('01/01/'+ DM1.StrZero( IntToStr(seAnio.value+1),4 ))-1)
   else
   begin
      xFecUlt:= DateToStr(StrToDate('01/'+ DM1.StrZero( IntToStr(seMes.value+1),2 )+'/'+seAnio.Text)-1);
   end;

   xperiodo:= seAnio.Text + DM1.StrZero(seMes.Text,2);
   xSql:='SELECT  * FROM (SELECT FLAG,'+
                               'ANOSER, '+''''+xFecUlt+''' FECULT,'+
                               'COUNT(ASOID) as NRODOCEN,'+
                               'SUM(NVL(ACUMESANT,0)) as ACUMESANT,'+
                               'ANOSERF,SUM(NVL(CAPITAL,0)) AS CAPITAL,'+
                               'SUM(NVL(INTCAPACU,0)) AS INTCAPACU,'+
                               'SUM(NVL(BONOS,0)) AS BONOS,'+
                               'SUM(NVL(ACUMULADO,0)) AS ACUMULADO '+
                        'FROM RES_TEC_1 WHERE PERIODO = '''+ xperiodo + ''' '+
                        'GROUP BY FLAG,ANOSER,ANOSERF ) A,APO121 B '+
         'WHERE A.ANOSER = B.APOANO(+) '+
         'ORDER BY  TO_NUMBER(ANOSER),TO_NUMBER(ANOSERF) ';

   dm1.cdsReporte.Close;
   dm1.cdsReporte.DataRequest(xSql);
   dm1.cdsReporte.Open;

   ppDB1.DataSource:= DM1.dsReporte;
   ppReport1.Print;
}
// FIN: HPP_200906_PRE
end;

procedure TFCuentaInd.SpeedButton2Click(Sender: TObject);
VAR
   xSql:string;
   xperiodo,xFecUlt:String;
begin
   if seMes.Value=12 then
      xFecUlt:= DateToStr(StrToDate('01/01/'+ DM1.StrZero( IntToStr(seAnio.value+1),4 ))-1)
   else
   begin
      xFecUlt:= DateToStr(StrToDate('01/'+ DM1.StrZero( IntToStr(seMes.value+1),2 )+'/'+seAnio.Text)-1);
   end;
   //Inicio: HPP_200906_PRE realizado por IREVILLA
   xperiodo:= seAnio.Text + DM1.StrZero(seMes.Text,2);
   xSql:='SELECT UPROID,UPRONOM,USEID,USENOM,COUNT(*) AS APORTAN, '
        +'       SUM(NVL(CAPITAL,0)) AS CAPITAL,SUM(NVL(INTCAPACU,0)) AS INTCAPACU, '
        +'       SUM(NVL(BONOS,0)) AS BONOS,SUM(NVL(ACUMULADO,0)) AS ACUMULADO, '
        +''''+xFecUlt+''' FECULT '
        +' FROM RES_TEC_2 '
        +' WHERE PERIODO = '''+ xperiodo + ''' '
        +' GROUP BY UPROID,UPRONOM,USEID,USENOM ORDER BY UPROID,UPRONOM,USEID,USENOM';

   //Fin: HPP_200906_PRE realizado por IREVILLA
   dm1.cdsReporte.Close;
   dm1.cdsReporte.DataRequest(xSql);
   dm1.cdsReporte.Open;

   ppDB1.DataSource:= DM1.dsReporte;
   ppReport2.Print;
end;

procedure TFCuentaInd.SpeedButton3Click(Sender: TObject);
var xSql:string;
    xperiodo,xFecUlt:String;
begin
   xperiodo:= seAnio.Text + DM1.StrZero(seMes.Text,2);
   if seMes.Value=12 then
      xFecUlt:= DateToStr(StrToDate('01/01/'+ DM1.StrZero( IntToStr(seAnio.value+1),4 ))-1)
   else
   begin
      xFecUlt:= DateToStr(StrToDate('01/'+ DM1.StrZero( IntToStr(seMes.value+1),2 )+'/'+seAnio.Text)-1);
   end;
   
   xSql:= 'SELECT A.DPTOID,MIN(A.DPTODES) AS DPTODES,'+''''+xFecUlt+''' FECULT,'+
                  'A.USEID,MIN(A.USENOM) AS USENOM,SUM(NVL(A.CONFRES,0)) AS CONFRES,'+
                  'SUM(NVL(A.SINFRES,0)) AS SINFRES, SUM(NVL(A.CONFRES,0))+SUM(NVL(A.SINFRES,0)) AS TOTALES '+
          '  FROM ((select DPTOID,MAX(DPTODES) AS DPTODES,USEID,MAX(USENOM) AS USENOM,COUNT(*) AS CONFRES,TO_NUMBER('''') AS SINFRES FROM RES_TEC_1 '+
          //se retiro años de servicio 'WHERE CAPITAL<>0 AND FECCESE IS NULL AND ANOSERF<=39 GROUP BY  DPTOID,USEID) UNION '+
          ' WHERE PERIODO= '''+ xperiodo + ''' GROUP BY  DPTOID,USEID) UNION '+
                  '(select DPTOID,MIN(DPTODES)AS DPTODES,USEID,MIN(USENOM)AS USENOM,TO_NUMBER('''') AS CONFRES,COUNT(*) AS SINFRES FROM RES_TEC_2 '+
                  'WHERE PERIODO = '''+ xperiodo + ''' GROUP BY  DPTOID,USEID)) A '+
          ' GROUP BY DPTOID,USEID ORDER BY DPTOID,USEID'  ;

   dm1.cdsReporte.Close;
   dm1.cdsReporte.DataRequest(xSql);
   dm1.cdsReporte.Open;

   ppDB1.DataSource:= DM1.dsReporte;
   ppReport3.Print;
end;

procedure TFCuentaInd.BitBtn1Click(Sender: TObject);
begin
  FCuentaInd.Close;
end;

end.
