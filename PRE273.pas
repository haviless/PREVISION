unit PRE273;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, DB, DBClient,
  ppBands, ppClass, ppCtrls, ppVar, ppPrnabl, ppCache, ppProd, ppReport,
  ppComm, ppRelatv, ppDB, ppDBPipe, ExtCtrls, ppParameter, ppStrtch,
  ppSubRpt, ppDBBDE, dateutils;

type
  Tfmstcueind = class(TForm)
    dbgcueind: TwwDBGrid;
    btnimprime: TBitBtn;
    btnSalir: TBitBtn;
    pprcueindres: TppReport;
    ppParameterList1: TppParameterList;
    ppdbRepLiqxFallec: TppDBPipeline;
    ppHeaderBand4: TppHeaderBand;
    ppLine18: TppLine;
    ppSystemVariable10: TppSystemVariable;
    ppLabel70: TppLabel;
    ppLabel73: TppLabel;
    ppLabel77: TppLabel;
    ppLabel80: TppLabel;
    ppSystemVariable11: TppSystemVariable;
    ppLabel85: TppLabel;
    ppLabel89: TppLabel;
    ppLabel96: TppLabel;
    ppLabel102: TppLabel;
    ppLabel103: TppLabel;
    pplasocodmod: TppLabel;
    pplasoapenomdni: TppLabel;
    ppLabel117: TppLabel;
    ppLabel118: TppLabel;
    pplusenom: TppLabel;
    ppLabel122: TppLabel;
    ppLabel123: TppLabel;
    pplupagonom: TppLabel;
    ppLabel125: TppLabel;
    ppLabel126: TppLabel;
    pplupronom: TppLabel;
    ppLabel128: TppLabel;
    ppLabel129: TppLabel;
    pplregpendes: TppLabel;
    ppLabel131: TppLabel;
    ppLabel132: TppLabel;
    ppLabel133: TppLabel;
    ppLabel134: TppLabel;
    pplnumresnom: TppLabel;
    pplfecresnom: TppLabel;
    pplnumresces: TppLabel;
    pplfecresces: TppLabel;
    ppLine19: TppLine;
    ppLabel139: TppLabel;
    ppLabel140: TppLabel;
    pplanoapo: TppLabel;
    ppLabel142: TppLabel;
    ppLabel143: TppLabel;
    pplmonapo: TppLabel;
    ppLine20: TppLine;
    ppLabel145: TppLabel;
    ppLine21: TppLine;
    ppLabel158: TppLabel;
    ppLabel159: TppLabel;
    ppSystemVariable12: TppSystemVariable;
    ppDetailBand8: TppDetailBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLine1: TppLine;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLine2: TppLine;
    ppLabel18: TppLabel;
    ppLine3: TppLine;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLine4: TppLine;
    ppDBText1: TppDBText;
    ppBDEPipeline1: TppBDEPipeline;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLine5: TppLine;
    ppLabel27: TppLabel;
    procedure FormActivate(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
//    procedure pplblNombreMesPrint(Sender: TObject);
//    procedure pplusuarioPrint(Sender: TObject);
    procedure btnimprimeClick(Sender: TObject);
  private
    { Private declarations }
  public
    xanomescese, xSql : String;
    { Public declarations }
  end;

var
  fmstcueind: Tfmstcueind;

implementation

uses PREDM;
{$R *.dfm}

procedure Tfmstcueind.FormActivate(Sender: TObject);
Var xSql:String;
begin
  DM1.cdsCueInd.EmptyDataSet;
  DM1.asofrescese := DateToStr(DM1.FechaSys);
  DM1.asofresnom  := DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString;
  xSql := 'DELETE T_CTAIND1';
  DM1.DCOM1.AppServer.EjecutaSQL(xSql);
// Inicio: HPP_201004_PRE - SAR-2009-0984
// SE AÑADE NUEVO PARAMETRO AL PROCEDIMIENTO
  xSql :=  'BEGIN P_CUENTA_INDIVIDUAL('+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)
{
  +','+QuotedStr(DM1.asofresnom)+','+QuotedStr(DM1.asofrescese)+', ''''); END;';
}
  +','+QuotedStr(DM1.asofresnom)+','+QuotedStr(DM1.asofrescese)+', '''', ''N''); END;';
// Fin: HPP_201004_PRE
  DM1.DCOM1.AppServer.EjecutaSQL(xSql);
  xSql := 'SELECT * FROM T_CTAIND1 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' ORDER BY ANO,MES';
  DM1.cdsCuentas.Close;
  DM1.cdsCuentas.DataRequest(xSql);
  DM1.cdsCuentas.Open;
  TNumericField(DM1.cdsCueInd.FieldByName('CAPACU')).DisplayFormat := '###,###,##0.00';
  TNumericField(DM1.cdsCueInd.FieldByName('INTERES')).DisplayFormat := '###,###,##0.00';
  TNumericField(DM1.cdsCueInd.FieldByName('BONUS')).DisplayFormat := '###,###,##0.00';
  TNumericField(DM1.cdsCueInd.FieldByName('APORTE')).DisplayFormat := '###,###,##0.00';
  TNumericField(DM1.cdsCueInd.FieldByName('DEVOLUC')).DisplayFormat := '###,###,##0.00';
  TNumericField(DM1.cdsCueInd.FieldByName('TOTACU')).DisplayFormat := '###,###,##0.00';
  DM1.cdsCuentas.First;
  While Not DM1.cdsCuentas.Eof Do
  Begin
    DM1.cdsCueInd.Append;
    DM1.cdsCueInd.FieldByName('MES').AsString := DM1.NombreMes(DM1.cdsCuentas.FieldByName('MES').AsString);
    DM1.cdsCueInd.FieldByName('ANO').AsString := DM1.cdsCuentas.FieldByName('ANO').AsString;
    xSql := 'SELECT MAX(USEABR) USEABR FROM APO301 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)
    +' AND TRANSANO = '+QuotedStr(DM1.cdsCuentas.FieldByName('ANO').AsString)+' AND TRANSMES = '+QuotedStr(DM1.cdsCuentas.FieldByName('MES').AsString);
    DM1.cdsQry.Close;
    DM1.cdsQry.DataRequest(xSql);
    DM1.cdsQry.Open;
    DM1.cdsCueInd.FieldByName('USENOM').AsString := DM1.cdsQry.FieldByName('USEABR').AsString;
    DM1.cdsCueInd.FieldByName('CAPACU').AsFloat :=  DM1.cdsCuentas.FieldByName('ACUMESANT').AsFloat;
    DM1.cdsCueInd.FieldByName('INTERES').AsFloat := DM1.cdsCuentas.FieldByName('INTCAPACU').AsFloat;
    DM1.cdsCueInd.FieldByName('BONUS').AsFloat :=   DM1.cdsCuentas.FieldByName('BONOS').AsFloat;
    DM1.cdsCueInd.FieldByName('APORTE').AsFloat :=  DM1.cdsCuentas.FieldByName('CAPITAL').AsFloat;
    DM1.cdsCueInd.FieldByName('DEVOLUC').AsFloat := DM1.cdsCuentas.FieldByName('TRANSMTODEV').AsFloat;
    DM1.cdsCueInd.FieldByName('TOTACU').AsFloat := DM1.cdsCuentas.FieldByName('ACUMULADO').AsFloat;
    DM1.cdsCuentas.Next;
  End;
End;


procedure Tfmstcueind.btnSalirClick(Sender: TObject);
begin
  fmstcueind.Close;
end;

{
procedure Tfmstcueind.btnimprimeClick(Sender: TObject);
Var xultano : String;
fecces:TDate;
begin
  If DM1.asofrescese = '' Then fecces := date Else fecces := StrToDate(DM1.asofrescese);

  If rgtiprep.ItemIndex = 0 Then
  Begin
    If (xanomescese < '199701') Then
    Begin
      pplbltitulo_b.Caption := 'ESTADO DE APORTES RECAUDADOS AL '+DateToStr(DM1.FechaSys);
      pplblasocodmod_b.Caption  := DM1.cdsAsociado.FieldByName('ASOCODMOD').AsString;
      pplblasoapenomdni_b.Caption := DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString;
      pplblasoresces_b.Caption  := DM1.asorescese;
      pplblasofresnom_b.Caption := DM1.asofresnom;
      pplblasofresces_b.Caption := DM1.asofrescese;
      pplblregpen_b.Caption  :=   DM1.DevuelveValor('APO105', 'REGPENDES', 'REGPENID', DM1.cdsAsociado.FieldByName('REGPENID').AsString);
      xSql := 'SELECT USENOM FROM APO101 WHERE USEID = '+QuotedStr(DM1.cdsAsociado.FieldByName('USEID').AsString)
      +' AND UPAGOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString)+' AND UPROID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      pplblusenom_b.Caption := Copy(DM1.cdsQry.FieldByName('USENOM').AsString,1,29);
      xSql := 'SELECT UPAGONOM FROM APO103 WHERE UPAGOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString)+' AND UPROID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      pplblupagonom_b.Caption := Copy(DM1.cdsQry.FieldByName('UPAGONOM').AsString,1,29);
      xSql := 'SELECT UPRONOM FROM APO102 WHERE UPROID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      pplblupronom_b.Caption := Copy(DM1.cdsQry.FieldByName('UPRONOM').AsString,1,29);
      pplbluser_b.Caption := 'Impreso por   : '+DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
      xSql := 'SELECT BENEFDES FROM TGE186 WHERE TIPBENEF = '+QuotedStr(DM1.tipben);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      pplblbeneficio_b.Caption := 'BENEFICIO ASIGNADO '+DM1.cdsQry.FieldByName('BENEFDES').AsString;
      pplblmonben_b.Caption :=  FormatFloat('###,###.00', DM1.calculamontodecese(DM1.asofresnom, DM1.asofrescese, DM1.tipben));
      pprantes1997.Print;
    End
    Else
    Begin
      pplbltitulo_a.Caption := 'ESTADO DE APORTES RECAUDADOS AL '+DateToStr(DM1.FechaSys);
      pplblmonben_a.Caption :=  FormatFloat('###,###.00', DM1.calculamontodecese(DM1.asofresnom, DM1.asofrescese, DM1.tipben));
      pplblregpen_a.Caption :=   DM1.DevuelveValor('APO105', 'REGPENDES', 'REGPENID', DM1.cdsAsociado.FieldByName('REGPENID').AsString);
      pplasocodmod_a.Caption := DM1.cdsAsociado.FieldByName('ASOCODMOD').AsString;
      pplasoapenomdni_a.Caption := DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString;
      xSql := 'SELECT USENOM FROM APO101 WHERE USEID = '+QuotedStr(DM1.cdsAsociado.FieldByName('USEID').AsString)
      +' AND UPAGOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString)+' AND UPROID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      pplblusenom_a.Caption := Copy(DM1.cdsQry.FieldByName('USENOM').AsString,1,29);
      xSql := 'SELECT UPAGONOM FROM APO103 WHERE UPAGOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString)+' AND UPROID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      pplblupagonom_a.Caption := Copy(DM1.cdsQry.FieldByName('UPAGONOM').AsString,1,29);
      xSql := 'SELECT UPRONOM FROM APO102 WHERE UPROID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      pplblupronom_a.Caption := Copy(DM1.cdsQry.FieldByName('UPRONOM').AsString,1,29);
      pplblasoresnom_a.Caption  := DM1.asoresnom;
      pplblasoresces_a.Caption  := DM1.asorescese;
      pplblasofresnom_a.Caption := DM1.asofresnom;
      pplblasofresces_a.Caption := DM1.asofrescese;
      pplblasocodmod.Caption := DM1.cdsAsociado.FieldByName('ASOCODMOD').AsString;
      pplblasoapenomdni.Caption := DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString;
      pplbluser_a.Caption := 'Impreso por   : '+DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
      ppLabel162.Caption := 'Impreso por   : '+DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
      ppraportes.Print;
    End;
  End
  Else
  Begin
    If fecces < StrToDate('01/12/1999') Then
    Begin
      MessageDlg('Fecha de cese menor a Diciembre de 1999', mtInformation, [mbOk], 0);
      Exit;
    End;
    If rgmodcueind.ItemIndex = 0 Then
    Begin
      xultano := Copy(DM1.asofrescese,7,4);

      xSql := 'SELECT MIN(NVL(ACUMESANT,0)) ACUMESANT, MAX(NVL(ACUMULADO,0)) ACUMULADO,'
      +' SUM(NVL(CAPITAL,0)) CAPITAL, SUM(NVL(INTCAPACU,0)) INTCAPACU, SUM(NVL(BONOS,0)) BONOS'
      +' FROM T_CTAIND1 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND ANO < ''2000''';

      DM1.cdsQry20.Close;
      DM1.cdsQry20.DataRequest(xSql);
      DM1.cdsQry20.Open;


      xSql := 'SELECT ANO, MIN(NVL(ACUMESANT,0)) ACUMESANT, SUM(NVL(CAPITAL,0)) CAPITAL, SUM(NVL(INTCAPACU,0)) INTCAPACU, SUM(NVL(BONOS,0)) BONOS,'
      +' MAX(NVL(ACUMULADO,0)) ACUMULADO FROM T_CTAIND1 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)
      +' AND ANO > ''1999'' AND ANO < '+QuotedStr(IntToStr(StrToInt(xultano)))
      +' GROUP BY ANO ORDER BY ANO';

      pplblres20002004.Caption := 'RESUMEN CUENTA INDIVIDUAL 2000 - '+IntToStr(StrToInt(xultano)-1);

      DM1.cdsQry21.Close;
      DM1.cdsQry21.DataRequest(xSql);
      DM1.cdsQry21.Open;

      xSql := 'SELECT ANO, MES, NVL(ACUMESANT,0) ACUMESANT, NVL(CAPITAL,0) CAPITAL, NVL(INTCAPACU,0) INTCAPACU, NVL(BONOS,0) BONOS,'
      +' NVL(ACUMULADO,0) ACUMULADO FROM T_CTAIND1 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)
      +' AND ANO = '+QuotedStr(xultano)+' ORDER BY ANO,MES';

      DM1.cdsQry22.Close;
      DM1.cdsQry22.DataRequest(xSql);
      DM1.cdsQry22.Open;
      // Impresion de datos generales del asociado
      pplasocodmod.Caption    := DM1.cdsAsociado.FieldByName('ASOCODMOD').AsString;
      pplasoapenomdni.Caption := DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString;
      pplnumresnom.Caption    := DM1.asoresnom;
      pplnumresces.Caption    := DM1.asorescese;
      pplfecresnom.Caption    := DM1.asofresnom;
      pplfecresces.Caption    := DM1.asofrescese;
      xSql := 'SELECT REGPENDES FROM APO105 WHERE REGPENID = '+QuotedStr(DM1.cdsAsociado.FieldByName('REGPENID').AsString);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      pplregpendes.Caption := DM1.cdsQry.FieldByName('REGPENDES').AsString;
      xSql := 'SELECT USENOM FROM APO101 WHERE USEID = '+QuotedStr(DM1.cdsAsociado.FieldByName('USEID').AsString)
      +' AND UPAGOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString)+' AND UPROID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      pplusenom.Caption := Copy(DM1.cdsQry.FieldByName('USENOM').AsString,1,29);
      xSql := 'SELECT UPAGONOM FROM APO103 WHERE UPAGOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString)+' AND UPROID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      pplupagonom.Caption := Copy(DM1.cdsQry.FieldByName('UPAGONOM').AsString,1,29);
      xSql := 'SELECT UPRONOM FROM APO102 WHERE UPROID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      pplupronom.Caption := Copy(DM1.cdsQry.FieldByName('UPRONOM').AsString,1,29);
      xSql := 'SELECT REGPENDES FROM APO105 WHERE REGPENID = '+QuotedStr(DM1.cdsAsociado.FieldByName('REGPENID').AsString);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      // Etapa saldo a 1997
      DM1.cdsCuentas.First;
      pplanoapo.Caption := DM1.cdsCuentas.FieldByName('ANOSER').AsString+' AÑOS';
      pplmonapo.Caption := FormatFloat('###,###.00',DM1.cdsCuentas.FieldByName('ACUMESANT').AsFloat);
      // Etapa 1997 a 1999
      xSql := 'SELECT MAX(NVL(ACUMULADO,0)) ACUMULADO FROM T_CTAIND1';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;

      ppltitdet.Caption := 'DETALLE DE CUENTA INDIVIDUAL AÑO : '+xultano;
      pplsalacu.Caption := 'CAPITAL ACUMULADO A LA EMISION DE ESTE REPORTE : S/. '+FormatFloat('###,###.00',DM1.cdsQry.FieldByName('ACUMULADO').AsFloat);
      pplusuario.Caption := 'Impreso por   : '+DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
      ppLabel87.Caption  := 'Impreso por   : '+DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
      pprcueindres.Print;

      pprcueindres.Stop;
    End
    Else
    Begin
      DM1.cdsCuentas.First;
      pplblcapacu.Caption :=  FormatFloat('###,###.00',DM1.cdsCuentas.FieldByName('ACUMESANT').AsFloat);
      pplblanoapo.Caption := DM1.cdsCuentas.FieldByName('ANOSER').AsString+' AÑOS';
      pplblTitCueInd.Caption := 'ESTADO DE CUENTA INDIVIDUAL DE APORTES AL '+DateToStr(DM1.FechaSys);
      xSql := 'SELECT REGPENDES FROM APO105 WHERE REGPENID = '+QuotedStr(DM1.cdsAsociado.FieldByName('REGPENID').AsString);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      pplblregpen.Caption := DM1.cdsQry.FieldByName('REGPENDES').AsString;
      xSql := 'SELECT USENOM FROM APO101 WHERE USEID = '+QuotedStr(DM1.cdsAsociado.FieldByName('USEID').AsString)
      +' AND UPAGOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString)+' AND UPROID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      pplblusenom.Caption := Copy(DM1.cdsQry.FieldByName('USENOM').AsString,1,29);
      xSql := 'SELECT UPAGONOM FROM APO103 WHERE UPAGOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString)+' AND UPROID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      pplblupagonom.Caption := Copy(DM1.cdsQry.FieldByName('UPAGONOM').AsString,1,29);
      xSql := 'SELECT UPRONOM FROM APO102 WHERE UPROID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      pplblupronom.Caption := Copy(DM1.cdsQry.FieldByName('UPRONOM').AsString,1,29);
      pplblasoresnom.Caption   := DM1.asoresnom;
      pplblasofresnom.Caption  := DM1.asofresnom;
      pplblasorescese.Caption  := DM1.asorescese;
      pplblasofrescese.Caption := DM1.asofrescese;
      pplblasocodmod.Caption := DM1.cdsAsociado.FieldByName('ASOCODMOD').AsString;
      pplblasoapenomdni.Caption := DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString;
      ppLblUser.Caption:='Impreso por   : '+DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
      ppLabel191.Caption := 'Impreso por   : '+DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
      pprccueind.Print;
    End;
  End;
End;
}

{
procedure Tfmstcueind.rgtiprepClick(Sender: TObject);
begin
  If rgtiprep.ItemIndex = 0 Then
  Begin
    rgmodcueind.Visible := False;
    If (xanomescese < '199701')   Then
    Begin
      dbgaportes.Visible := False;
      dbgcueind.Visible := False;
      lblnoaportes.Visible := True;
      lblnoaportes.Top := 88;
      lblnoaportes.Left := 72;
    End
    Else
    Begin
      DM1.cdsestapo.EmptyDataSet;
      dbgaportes.Visible := True;
      dbgaportes.Top := 61;
      dbgaportes.Left := 8;
      dbgcueind.Visible := False;
      lblnoaportes.Visible := False;
      DM1.cdsCuentas.First;
      While Not DM1.cdsCuentas.Eof Do
      Begin
        DM1.cdsestapo.Append;
        xSql := 'SELECT MAX(USEABR) USEABR FROM APO301 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)
        +' AND TRANSANO = '+QuotedStr(DM1.cdsCuentas.FieldByName('ANO').AsString)+' AND TRANSMES = '+QuotedStr(DM1.cdsCuentas.FieldByName('MES').AsString);
        DM1.cdsQry.Close;
        DM1.cdsQry.DataRequest(xSql);
        DM1.cdsQry.Open;
        DM1.cdsestapo.FieldByName('USENOM').AsString := DM1.cdsQry.FieldByName('USEABR').AsString;
        DM1.cdsestapo.FieldByName('MES').AsString := DM1.NombreMes(DM1.cdsCuentas.FieldByName('MES').AsString);
        DM1.cdsestapo.FieldByName('ANO').AsString := DM1.cdsCuentas.FieldByName('ANO').AsString;
        DM1.cdsestapo.FieldByName('APORTE').AsFloat :=  DM1.cdsCuentas.FieldByName('CAPITAL').AsFloat;
        xSql := 'SELECT APOVALOR FROM APO117 WHERE APOANO = '+QuotedStr(DM1.cdsCuentas.FieldByName('ANO').AsString)
        +' AND APOMES = '+QuotedStr(DM1.cdsCuentas.FieldByName('MES').AsString);
        DM1.cdsQry.Close;
        DM1.cdsQry.DataRequest(xSql);
        DM1.cdsQry.Open;
        DM1.cdsestapo.FieldByName('APOOFI').AsFloat :=  DM1.cdsQry.FieldByName('APOVALOR').AsFloat;
        If DM1.cdsQry.FieldByName('APOVALOR').AsFloat > DM1.cdsCuentas.FieldByName('CAPITAL').AsFloat Then
          DM1.cdsestapo.FieldByName('NIV').AsFloat := DM1.cdsQry.FieldByName('APOVALOR').AsFloat - DM1.cdsCuentas.FieldByName('CAPITAL').AsFloat;
        If DM1.cdsQry.FieldByName('APOVALOR').AsFloat < DM1.cdsCuentas.FieldByName('CAPITAL').AsFloat Then
          DM1.cdsestapo.FieldByName('DEV').AsFloat := DM1.cdsCuentas.FieldByName('CAPITAL').AsFloat - DM1.cdsQry.FieldByName('APOVALOR').AsFloat;
        DM1.cdsCuentas.Next;
      End;
    End;
  End
  Else
  Begin
    rgmodcueind.Visible := True;
    DM1.cdsCueInd.EmptyDataSet;
    dbgcueind.Visible := True;
    dbgcueind.Top := 61;
    dbgcueind.Left := 8;
    dbgaportes.Visible := False;
    lblnoaportes.Visible := False;
    TNumericField(DM1.cdsCueInd.FieldByName('CAPACU')).DisplayFormat := '###,###,##0.00';
    TNumericField(DM1.cdsCueInd.FieldByName('INTERES')).DisplayFormat := '###,###,##0.00';
    TNumericField(DM1.cdsCueInd.FieldByName('BONUS')).DisplayFormat := '###,###,##0.00';
    TNumericField(DM1.cdsCueInd.FieldByName('APORTE')).DisplayFormat := '###,###,##0.00';
    TNumericField(DM1.cdsCueInd.FieldByName('DEVOLUC')).DisplayFormat := '###,###,##0.00';
    TNumericField(DM1.cdsCueInd.FieldByName('TOTACU')).DisplayFormat := '###,###,##0.00';
    DM1.cdsCuentas.First;
    While Not DM1.cdsCuentas.Eof Do
    Begin
      DM1.cdsCueInd.Append;
      DM1.cdsCueInd.FieldByName('MES').AsString := DM1.NombreMes(DM1.cdsCuentas.FieldByName('MES').AsString);
      DM1.cdsCueInd.FieldByName('ANO').AsString := DM1.cdsCuentas.FieldByName('ANO').AsString;
      xSql := 'SELECT MAX(USEABR) USEABR FROM APO301 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)
      +' AND TRANSANO = '+QuotedStr(DM1.cdsCuentas.FieldByName('ANO').AsString)+' AND TRANSMES = '+QuotedStr(DM1.cdsCuentas.FieldByName('MES').AsString);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      DM1.cdsCueInd.FieldByName('USENOM').AsString := DM1.cdsQry.FieldByName('USEABR').AsString;
      DM1.cdsCueInd.FieldByName('CAPACU').AsFloat :=  DM1.cdsCuentas.FieldByName('ACUMESANT').AsFloat;
      DM1.cdsCueInd.FieldByName('INTERES').AsFloat := DM1.cdsCuentas.FieldByName('INTCAPACU').AsFloat;
      DM1.cdsCueInd.FieldByName('BONUS').AsFloat :=   DM1.cdsCuentas.FieldByName('BONOS').AsFloat;
      DM1.cdsCueInd.FieldByName('APORTE').AsFloat :=  DM1.cdsCuentas.FieldByName('CAPITAL').AsFloat;
      DM1.cdsCueInd.FieldByName('DEVOLUC').AsFloat := DM1.cdsCuentas.FieldByName('TRANSMTODEV').AsFloat;
      DM1.cdsCueInd.FieldByName('TOTACU').AsFloat := DM1.cdsCuentas.FieldByName('ACUMULADO').AsFloat;
      ppltotacum.Caption :=   FormatFloat('###,###.00',DM1.cdsCueInd.FieldByName('TOTACU').AsFloat);
      DM1.cdsCuentas.Next;
    End;
  End;
End;
}

{
procedure Tfmstcueind.pplblNombreMesPrint(Sender: TObject);
begin
 pplnommes.Caption := DM1.NombreMes(DM1.cdsQry22.FieldByName('MES').AsString);
end;
}

{
procedure Tfmstcueind.pplbluser_aPrint(Sender: TObject);
begin
If DM1.cdsQry25.RecordCount > 0 Then pplbluser_a.Visible := False;
end;
}

{
procedure Tfmstcueind.ppLabel95Print(Sender: TObject);
begin
  If DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsDateTime > StrToDate('30/11/1999') Then
  Begin
    ppLabel185.Visible := False;
    ppLabel188.Visible := False;
    pplblmonben_a.Visible := False;
  End
  Else
  Begin
    ppLabel185.Visible := True;
    ppLabel188.Visible := True;
    pplblmonben_a.Visible := True;
  End;
end;
}




{procedure Tfmstcueind.pplusuarioPrint(Sender: TObject);
begin
  If DM1.cdsQry25.RecordCount > 0 Then pplusuario.Visible := False;
end;
}

{
procedure Tfmstcueind.ppLabel180Print(Sender: TObject);
begin
  ppLabel191.Visible := True;
end;
}

{
procedure Tfmstcueind.ppLblUserPrint(Sender: TObject);
begin
  If DM1.cdsQry25.RecordCount > 0 Then ppLblUser.Visible := False Else ppLblUser.Visible := True;
end;
}

Procedure Tfmstcueind.btnimprimeClick(Sender: TObject);
Var Anoactual, ano_1, ano_2, anonombramiento, anoaportado:Integer;
   montoinicial_1, montofinal_1, apoacu_1, intacu_1, bonacu_1 :Double;
Begin

  ppLabel96.Caption := 'ESTADO DE CUENTA INDIVIDUAL DE APORTES AL '+DateToStr(DM1.FechaSys);
  Anoactual := StrToInt(Copy(datetostr(DM1.fechasys),7,4));
  ano_1 := Anoactual - 1;
  ano_2 := Anoactual - 2;
  ppLabel139.Caption      := 'Años Aportados a '+Trim(IntToStr(ano_2));

  anonombramiento := StrToInt(Copy(DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString,7,4));
  anoaportado := (Anoactual - 2 ) - anonombramiento;
  If anoaportado < 0 Then anoaportado := 0;

  pplanoapo.Caption       :=  IntToStr(anoaportado)+' AÑOS';

  xSql := 'SELECT ACUMULADO FROM T_CTAIND1 WHERE ANO = '+IntToStr(ano_2)+' AND MES = ''12''';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  ppLabel142.Caption      := 'Capital Acumulado a Dic. '+Trim(IntToStr(ano_2));
  pplmonapo.Caption       := FormatFloat('###,###.00',DM1.cdsQry.FieldByName('ACUMULADO').AsFloat);
  pplasocodmod.Caption    := DM1.cdsAsociado.FieldByName('ASOCODMOD').AsString;
  pplasoapenomdni.Caption := DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString;
  xSql := 'SELECT USENOM FROM APO101 WHERE USEID = '+QuotedStr(DM1.cdsAsociado.FieldByName('USEID').AsString)
  +' AND UPAGOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString)+' AND UPROID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  pplusenom.Caption := Copy(DM1.cdsQry.FieldByName('USENOM').AsString,1,29);
  xSql := 'SELECT UPAGONOM FROM APO103 WHERE UPAGOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString)+' AND UPROID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  pplupagonom.Caption := Copy(DM1.cdsQry.FieldByName('UPAGONOM').AsString,1,29);
  xSql := 'SELECT UPRONOM FROM APO102 WHERE UPROID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  pplupronom.Caption := Copy(DM1.cdsQry.FieldByName('UPRONOM').AsString,1,29);
  xSql := 'SELECT REGPENDES FROM APO105 WHERE REGPENID = '+QuotedStr(DM1.cdsAsociado.FieldByName('REGPENID').AsString);
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  pplregpendes.Caption := DM1.cdsQry.FieldByName('REGPENDES').AsString;
  pplnumresnom.Caption    := DM1.cdsAsociado.FieldByName('ASORESNOM').AsString;
  pplfecresnom.Caption    := DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString;
  ppLabel145.Caption := 'RESUMEN CUENTA INDIVIDUAL '+ IntToStr(ano_1);

  xSql := 'SELECT * FROM T_CTAIND1 WHERE ANO = '+QuotedStr(IntToStr(ano_1))+' ORDER BY ANO, MES';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  DM1.cdsQry.First;
  montoinicial_1 := DM1.cdsQry.FieldByName('ACUMESANT').AsFloat;
  DM1.cdsQry.Last;
  montofinal_1 := DM1.cdsQry.FieldByName('ACUMULADO').AsFloat;

  xSql := 'SELECT SUM(NVL(CAPITAL,0)) CAPITAL, SUM(NVL(INTCAPACU,0)) INTCAPACU, SUM(NVL(BONOS,0)) BONOS  FROM T_CTAIND1 WHERE ANO = '+QuotedStr(IntToStr(ano_1));
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  apoacu_1 := DM1.cdsQry.FieldByName('CAPITAL').AsFloat;
  intacu_1 := DM1.cdsQry.FieldByName('INTCAPACU').AsFloat;
  bonacu_1 := DM1.cdsQry.FieldByName('BONOS').AsFloat;
  ppLabel17.Caption := IntToStr(ano_1);
  ppLabel12.Caption := FormatFloat('###,###.00',montoinicial_1);
  ppLabel13.Caption := FormatFloat('###,###.00',apoacu_1);
  ppLabel14.Caption := FormatFloat('###,###.00',intacu_1);
  ppLabel15.Caption := FormatFloat('###,###.00',bonacu_1);
  ppLabel16.Caption := FormatFloat('###,###.00',montofinal_1);
  ppLabel18.Caption := 'DETALLE DE CUENTA INDIVIDUAL AÑO '+IntToStr(Anoactual);
  xSql := 'SELECT ANO||''  ''||TO_CHAR(TO_DATE(''15''||''/''||MES||''/''||ANO), ''MONTH'') ANOMES,'
  +' NVL(ACUMESANT,0) ACUMESANT,  NVL(CAPITAL,0) CAPITAL, NVL(INTCAPACU,0) INTCAPACU, NVL(BONOS,0) BONOS,'
  +' NVL(ACUMULADO,0) ACUMULADO FROM T_CTAIND1 A WHERE ANO = '+IntToStr(Anoactual)
  +' ORDER BY MES';
  DM1.cdsQry22.Close;
  DM1.cdsQry22.DataRequest(xSql);
  DM1.cdsQry22.Open;
  DM1.cdsQry22.Last;
  ppLabel27.Caption := 'CAPITAL ACUMULADO A LA EMISION DE ESTE REPORTE S/.   '+FormatFloat('###,###.00',DM1.cdsQry22.FieldByName('ACUMULADO').AsFloat);
  DM1.cdsQry22.First;
  pprcueindres.Print;
end;

End.
