// HPC_201307_PRE  : Se añade imagen del nuevo logo institucional
// SPP_201401_PRE  : Se realiza el pase a producción a partir del pase HPC_201307_PRE

unit PRE321;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Spin, ppDB, ppDBPipe, ppParameter, ppBands,
  ppVar, ppCtrls, ppPrnabl, ppClass, ppCache, ppRelatv, ppProd, ppReport,
  ppComm, ppEndUsr, jpeg;  // SPP_201401_PRE

type
  TFImpResTec = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    speAno: TSpinEdit;
    speMes: TSpinEdit;
    speMesIni: TSpinEdit;
    btnimprimir: TBitBtn;
    bbtnCerrar: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    ppd1: TppDesigner;
    ppr1: TppReport;
    ppParameterList1: TppParameterList;
    ppdb1: TppDBPipeline;
    ppr2: TppReport;
    ppParameterList2: TppParameterList;
    ppdb2: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppDBText2: TppDBText;
    // ppLabel30: TppLabel; SPP_201401_PRE
    ppLine6: TppLine;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppDBText22: TppDBText;
    ppLabel33: TppLabel;
    ppDBText23: TppDBText;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppDBText24: TppDBText;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLabel38: TppLabel;
    // ppImage1: TppImage; SPP_201401_PRE
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppDetailBand1: TppDetailBand;
    ppShape2: TppShape;
    ppShape4: TppShape;
    ppShape3: TppShape;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLine1: TppLine;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLabel10: TppLabel;
    ppDBText5: TppDBText;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLine2: TppLine;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText25: TppDBText;
    ppDBText27: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine13: TppLine;
    ppLabel39: TppLabel;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppDBText26: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText34: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppHeaderBand2: TppHeaderBand;
    ppShape5: TppShape;
    ppLabel40: TppLabel;
    ppDBText46: TppDBText;
    // ppLabel41: TppLabel; SPP_201401_PRE
    ppLine18: TppLine;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppDBText47: TppDBText;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppDBText49: TppDBText;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppLabel49: TppLabel;
    // ppImage2: TppImage; SPP_201401_PRE
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppLine36: TppLine;
    ppLabel79: TppLabel;
    ppLabel80: TppLabel;
    ppLine37: TppLine;
    ppLine38: TppLine;
    ppLine39: TppLine;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppDBText53: TppDBText;
    ppDBText78: TppDBText;
    ppDBText111: TppDBText;
    ppDBText112: TppDBText;
    ppDetailBand2: TppDetailBand;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppShape8: TppShape;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLine23: TppLine;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLine24: TppLine;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppDBText65: TppDBText;
    ppDBText66: TppDBText;
    ppDBText67: TppDBText;
    ppDBText68: TppDBText;
    ppDBText69: TppDBText;
    ppLine28: TppLine;
    ppLine29: TppLine;
    ppLine30: TppLine;
    ppLabel78: TppLabel;
    ppLine31: TppLine;
    ppLine32: TppLine;
    ppLine33: TppLine;
    ppLine34: TppLine;
    ppLine35: TppLine;
    ppDBText91: TppDBText;
    ppDBText92: TppDBText;
    ppDBText93: TppDBText;
    ppDBText94: TppDBText;
    ppDBText50: TppDBText;
    ppDBText70: TppDBText;
    ppDBText76: TppDBText;
    ppDBText51: TppDBText;
    ppDBText77: TppDBText;
    ppDBText95: TppDBText;
    ppDBText96: TppDBText;
    ppDBText97: TppDBText;
    ppDBText98: TppDBText;
    ppDBText99: TppDBText;
    ppDBText52: TppDBText;
    ppDBText71: TppDBText;
    ppDBText82: TppDBText;
    ppDBText100: TppDBText;
    ppDBText101: TppDBText;
    ppDBText102: TppDBText;
    ppDBText103: TppDBText;
    ppLine40: TppLine;
    ppLine41: TppLine;
    ppLine42: TppLine;
    ppDBText104: TppDBText;
    ppDBText105: TppDBText;
    ppDBText106: TppDBText;
    ppDBText107: TppDBText;
    ppDBText108: TppDBText;
    ppDBText109: TppDBText;
    ppDBText110: TppDBText;
    ppDBText48: TppDBText;
    ppDBText54: TppDBText;
    ppDBText113: TppDBText;
    ppDBText114: TppDBText;
    ppDBText115: TppDBText;
    ppDBText116: TppDBText;
    ppDBText117: TppDBText;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    ppDBText79: TppDBText;
    ppDBText80: TppDBText;
    ppDBText81: TppDBText;
    ppDBText118: TppDBText;
    ppDBText119: TppDBText;
    ppDBText120: TppDBText;
    ppDBText121: TppDBText;
    ppDBText122: TppDBText;
    ppDBText123: TppDBText;
    ppDBText124: TppDBText;
    ppDBText125: TppDBText;
    ppDBText126: TppDBText;
    ppDBText57: TppDBText;
    ppDBText58: TppDBText;
    ppDBText72: TppDBText;
    ppDBText73: TppDBText;
    ppDBText83: TppDBText;
    ppDBText84: TppDBText;
    ppDBText127: TppDBText;
    ppDBText128: TppDBText;
    ppDBText129: TppDBText;
    ppDBText130: TppDBText;
    ppDBText131: TppDBText;
    ppDBText132: TppDBText;
    ppDBText133: TppDBText;
    ppDBText134: TppDBText;
    ppDBText59: TppDBText;
    ppDBText90: TppDBText;
    ppDBText135: TppDBText;
    ppDBText136: TppDBText;
    ppDBText137: TppDBText;
    ppDBText138: TppDBText;
    ppDBText139: TppDBText;
    ppDBText60: TppDBText;
    ppDBText74: TppDBText;
    ppDBText85: TppDBText;
    ppDBText140: TppDBText;
    ppDBText141: TppDBText;
    ppDBText142: TppDBText;
    ppDBText143: TppDBText;
    ppDBText61: TppDBText;
    ppDBText75: TppDBText;
    ppDBText86: TppDBText;
    ppDBText144: TppDBText;
    ppDBText145: TppDBText;
    ppDBText146: TppDBText;
    ppDBText147: TppDBText;
    ppDBText62: TppDBText;
    ppDBText87: TppDBText;
    ppDBText148: TppDBText;
    ppDBText149: TppDBText;
    ppDBText150: TppDBText;
    ppDBText151: TppDBText;
    ppDBText152: TppDBText;
    ppDBText63: TppDBText;
    ppDBText88: TppDBText;
    ppDBText153: TppDBText;
    ppDBText154: TppDBText;
    ppDBText155: TppDBText;
    ppDBText156: TppDBText;
    ppDBText157: TppDBText;
    ppDBText64: TppDBText;
    ppDBText89: TppDBText;
    ppDBText158: TppDBText;
    ppDBText159: TppDBText;
    ppDBText160: TppDBText;
    ppDBText161: TppDBText;
    ppDBText162: TppDBText;
    ppFooterBand2: TppFooterBand;
    Label5: TLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLabel86: TppLabel;
    ppLabel87: TppLabel;
//Inicio: SPP_201401_PRE
    ppImage1: TppImage;  
    ppImage2: TppImage;  
//Fin: SPP_201401_PRE
    procedure btnimprimirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbtnCerrarClick(Sender: TObject);
  private
    { Private declarations }
    sLink : String;
    function Busca_Mes_Nombre( sMesT : String ) : String;
  public
    { Public declarations }
  end;

var
  FImpResTec: TFImpResTec;

implementation

uses PREDM;

{$R *.dfm}

procedure TFImpResTec.btnimprimirClick(Sender: TObject);
var
   sCia, sMesAnt, sFecAnt, sSQL, sAno, sMes, sMesSig, sAnoAnt, sMesDes : String;
   sMesI, sDiaFinL, sDiaFinN, sAAMMAnt, sPerVar1, sPerVar2, sPerVar3, sPerVar4 : String;
   sMesDes1, sMesDes2, sMesDes3, sMesDes4, sPerFin : String;
begin

  if speMesIni.Value>speMes.Value then
  begin
     ShowMessage('Mes inicial no puede ser mayor a mes final');
     Exit;
  end;


  if speMes.Value-speMesIni.Value>3 then
  begin
     ShowMessage('Solo se puede generar reporte de máximo cuatro (4) Meses');
     Exit;
  end;

  sAnoAnt:=IntToStr(speAno.Value-1);
  sCia:='01';

  Screen.Cursor:=crSQLWait;

  // mas Actual
  sAno :=speAno.Text;
  sMes :=DM1.StrZero( speMes.Text, 2);
  sMesI:=DM1.StrZero( speMesIni.Text, 2);

  sMesDes:=Busca_Mes_Nombre( sMes );

  // Fecha de Fin de Mes
  sMesSig:=DM1.strZero(inttostr(strtoint(sMes)+1),2);
  if strtoint(sMesSig)>12 then
  begin
      sDiaFinL:= 'Al 31 de Diciembre de '+sAno;
      sDiaFinN:= '31/12/'+sAno;
  end
  else
  begin
      sDiaFinN := datetostr(strtodate('01/'+sMesSig+'/'+sAno)-1);
      sDiaFinL := 'Al '+Copy(sDiaFinN,1,2)+' de '+sMesDes+' de '+sAno;
  end;

  // Mes anterior

  // Fecha de Fin de Mes
  if strtoint(sMes)=1 then
  begin
      sMesAnt := '12';
      sAAMMAnt:= sAnoAnt+'12';
      sFecAnt:= '31/12/'+sAnoAnt;
  end
  else
  begin
      sMesAnt := DM1.StrZero( IntToStr(speMes.Value-1), 2);
      sAAMMAnt:= sAno+DM1.StrZero( IntToStr(speMes.Value-1), 2);
      sFecAnt:= datetostr(strtodate('01/'+sMes+'/'+sAno)-1);
      sAnoAnt:=sAno;
  end;

  if speMesIni.Value=speMes.Value then
  begin

  sSQL:='Select A.*, MONBENRET + MONBENINV + MONBENFALL PAGBEN, '
       +  ''''+sFecAnt +''' TITSALANT, '
       +  ''''+sDiaFinL+''' TITFECMESL, '
       +  ''''+sDiaFinN+''' TITFECMESN, '
       +  ''''+sMesDes +''' TITMESDES, B.*, '
       +  'MONAPO + MONCONAPO TOT_APO, '
       +  'MONNETAPO + MONCONAPO TOT_NET, '
       +  'MONINTFONIND + MONCONINT TOT_INT, '
       +  'MONBONFONIND + MONCONBONFONIND TOT_BON, '
       +  'MONFONIND + MONCONFONIND TOT_FIN, '
       +  'MONFONBON + MONCONFONBON TOT_FBO '
       +'From PVS_MAT_RES A, ('
       +   'SELECT '''+sAno+sMes+''' ANOMES, SUM(TOT_FI) TOT_FI, SUM(TOT_FB) TOT_FB, '
       +      'SUM(TOT_RT) TOT_RT, SUM(TOT_CP) TOT_CP, SUM(TOT_RL) TOT_RL '
       +   'FROM ( '
       +   'select ROUND(SUM(SALDMN'+sMesAnt+')*(-1),0) TOT_FI, 0 TOT_FB, 0 TOT_RT, 0 TOT_CP, 0 TOT_RL '
       +   'from CNT401'+sLink+' '
       +   'WHERE CIAID='''+sCia+''' AND ANO='''+sAnoAnt+''' '
       +   '  AND CUENTAID IN (''481'',''4840001'') '
       +   'UNION ALL '
       +   'select 0, ROUND(SUM(SALDMN'+sMesAnt+')*(-1),0) TOT_FB, 0, 0, 0 from CNT401'+sLink+' '
       +   'WHERE CIAID='''+sCia+''' AND ANO='''+sAnoAnt+''' '
       +   '  AND CUENTAID IN (''483'') '
       +   'UNION ALL '
       +   'select 0, 0, ROUND(SUM(SALDMN'+sMesAnt+')*(-1),0) TOT_RT, 0, 0 from CNT401'+sLink+' '
       +   'WHERE CIAID='''+sCia+''' AND ANO='''+sAnoAnt+''' '
       +   '  AND CUENTAID IN (''482'') '
       +   'UNION ALL '
       +   'select 0, 0, 0, ROUND(SUM(SALDMN'+sMesAnt+')*(-1),0) TOT_CP, 0 from CNT401'+sLink+' '
       +   'WHERE CIAID='''+sCia+''' AND ANO='''+sAnoAnt+''' '
       +   '  AND CUENTAID IN (''48'') '
       +   'UNION ALL '
       +   'select 0, 0, 0, 0, ROUND(SUM(SALDMN'+sMesAnt+')*(-1),0) TOT_RL from CNT401'+sLink+' '
       +   'WHERE CIAID='''+sCia+''' AND ANO='''+sAnoAnt+''' '
       +   '  AND CUENTAID IN (''58'') '
       +   ') B ) B '
       +'where PERGEN='''+sAno+sMes+''' '
       +  'and PERGEN=ANOMES';
  DM1.cdsQry1.Close;
  DM1.cdsQry1.DataRequest( sSQL );
  try
     DM1.cdsQry1.Open;
  except
     ShowMessage( 'Error : En Tabla de Resultados...' );
     Screen.Cursor:=crDefault;
     Exit;
  end;
  ppdb1.DataSource:=DM1.dsQry1;

  //ppd1.Report:=ppr1;
  //  ppr1.Template.FileName:='xx.rtm';
  //  ppr1.Template.LoadFromFile;
  Screen.Cursor:=crDefault;
  ppr1.Print;

  end
  else
  begin

  // Fecha de Fin de Mes
  if speMesIni.Value=1 then
  begin
      sMesAnt := '12';
      sAAMMAnt:= sAnoAnt+'12';
      sFecAnt:= '31/12/'+sAnoAnt;
  end
  else
  begin
      sMesAnt := DM1.StrZero( IntToStr(speMesIni.Value), 2);
      sAAMMAnt:= sAno+DM1.StrZero( IntToStr(speMesIni.Value), 2);
      sFecAnt:= datetostr(strtodate('01/'+sMesAnt+'/'+sAno)-1);
      sMesAnt := DM1.StrZero( IntToStr(speMesIni.Value-1), 2);
      sAnoAnt:=sAno;
  end;

  sSQL:='SELECT PERGEN From PVS_MAT_RES WHERE PERGEN='''+sAno+sMes+'''';
  DM1.cdsQry1.Close;
  DM1.cdsQry1.DataRequest( sSQL );
  DM1.cdsQry1.Open;
  IF DM1.cdsQry1.RecordCount<=0 then
  begin
     Screen.Cursor:=crDefault;
     ShowMessage('Error : El Periodo máximo ingresado NO fue generado. Consultar');
     Exit;
  end;

  sSQL:='Select A.*, MONBENRET + MONBENINV + MONBENFALL PAGBEN, '
       +  ''''+sFecAnt +''' TITSALANT, '
       +  ''''+sDiaFinL+''' TITFECMESL, '
       +  ''''+sDiaFinN+''' TITFECMESN, '
       +  ''''+sMesDes +''' TITMESDES, B.*, '
       +  'MONAPO + MONCONAPO TOT_APO, '
       +  'MONNETAPO + MONCONAPO TOT_NET, '
       +  'MONINTFONIND + MONCONINT TOT_INT, '
       +  'MONBONFONIND + MONCONBONFONIND TOT_BON, '
       +  'MONFONIND + MONCONFONIND TOT_FIN, '
       +  'MONFONBON + MONCONFONBON TOT_FBO '
       +'From PVS_MAT_RES A, ('
       +   'SELECT '''+sAno+sMes+''' ANOMES, SUM(TOT_FI) TOT_FI, SUM(TOT_FB) TOT_FB, '
       +      'SUM(TOT_RT) TOT_RT, SUM(TOT_CP) TOT_CP, SUM(TOT_RL) TOT_RL '
       +   'FROM ( '
       +   'select ROUND(SUM(SALDMN'+sMesAnt+')*(-1),0) TOT_FI, 0 TOT_FB, 0 TOT_RT, 0 TOT_CP, 0 TOT_RL '
       +   'from CNT401'+sLink+' '
       +   'WHERE CIAID='''+sCia+''' AND ANO='''+sAnoAnt+''' '
       +   '  AND CUENTAID IN (''481'',''4840001'') '
       +   'UNION ALL '
       +   'select 0, ROUND(SUM(SALDMN'+sMesAnt+')*(-1),0) TOT_FB, 0, 0, 0 from CNT401'+sLink+' '
       +   'WHERE CIAID='''+sCia+''' AND ANO='''+sAnoAnt+''' '
       +   '  AND CUENTAID IN (''483'') '
       +   'UNION ALL '
       +   'select 0, 0, ROUND(SUM(SALDMN'+sMesAnt+')*(-1),0) TOT_RT, 0, 0 from CNT401'+sLink+' '
       +   'WHERE CIAID='''+sCia+''' AND ANO='''+sAnoAnt+''' '
       +   '  AND CUENTAID IN (''482'') '
       +   'UNION ALL '
       +   'select 0, 0, 0, ROUND(SUM(SALDMN'+sMesAnt+')*(-1),0) TOT_CP, 0 from CNT401'+sLink+' '
       +   'WHERE CIAID='''+sCia+''' AND ANO='''+sAnoAnt+''' '
       +   '  AND CUENTAID IN (''48'') '
       +   'UNION ALL '
       +   'select 0, 0, 0, 0, ROUND(SUM(SALDMN'+sMesAnt+')*(-1),0) TOT_RL from CNT401'+sLink+' '
       +   'WHERE CIAID='''+sCia+''' AND ANO='''+sAnoAnt+''' '
       +   '  AND CUENTAID IN (''58'') '
       +   ') B ) B '
       +'where PERGEN='''+sAno+sMes+''' '
       +  'and PERGEN=ANOMES';
  DM1.cdsQry1.Close;
  DM1.cdsQry1.DataRequest( sSQL );
  try
     DM1.cdsQry1.Open;
  except
     ShowMessage( 'Error : En Tabla de Resultados...' );
     Screen.Cursor:=crDefault;
     Exit;
  end;

  ppdb1.DataSource:=DM1.dsQry1;

  sPerVar1:=DM1.StrZero( IntToStr( StrToInt(sAno+sMesI) ), 6);
  sPerVar2:=DM1.StrZero( IntToStr( StrToInt(sPerVar1)+1 ), 6);
  sPerFin :=sPerVar2;
  if sPerVar2<sAno+sMes then
  begin
     sPerVar3:=DM1.StrZero( IntToStr( StrToInt(sPerVar2)+1 ), 6);
     sPerFin :=sPerVar3;
  end
  else
     sPerVar3:='YYYYYYY';

  if sPerVar3<sAno+sMes then
  begin
     sPerVar4:=DM1.StrZero( IntToStr( StrToInt(sPerVar3)+1 ), 6);
     sPerFin :=sPerVar4;
  end
  else
     sPerVar4:='YYYYYYY';

  sMesDes1:=Busca_Mes_Nombre( Copy(sPerVar1,5,2) );
  sMesDes2:=Busca_Mes_Nombre( Copy(sPerVar2,5,2) );
  sMesDes3:=Busca_Mes_Nombre( Copy(sPerVar3,5,2) );
  sMesDes4:=Busca_Mes_Nombre( Copy(sPerVar4,5,2) );

  sSQL:='select ''APORTES'' CPTO2, '

       +  ''''+sMesDes1+''' MES01, '''+sMesDes2+''' MES02, '
       +  ''''+sMesDes3+''' MES03, '''+sMesDes4+''' MES04, '

       +  'sum(case when pergen='''+sPerVar1+''' then monapo else 0 end) apo_01, '
       +  'sum(case when pergen='''+sPerVar2+''' then monapo else 0 end) apo_02, '
       +  'sum(case when pergen='''+sPerVar3+''' then monapo else 0 end) apo_03, '
       +  'sum(case when pergen='''+sPerVar4+''' then monapo else 0 end) apo_04, '
       +  'sum(monapo) apo_tot, '
       +  'sum(case when pergen='''+sPerFin+''' then monconapo else 0 end) apo_cde, '
       +  'sum(monapo) + sum(case when pergen='''+sPerFin+''' then monconapo else 0 end) apo_total, '

       +  'sum(case when pergen='''+sPerVar1+''' then mondesapo else 0 end) apodes_01, '
       +  'sum(case when pergen='''+sPerVar2+''' then mondesapo else 0 end) apodes_02, '
       +  'sum(case when pergen='''+sPerVar3+''' then mondesapo else 0 end) apodes_03, '
       +  'sum(case when pergen='''+sPerVar4+''' then mondesapo else 0 end) apodes_04, '
       +  'sum(mondesapo) apodes_tot, '
       +  '0 apodes_cde, '
       +  'sum(mondesapo) apodes_total, '

       +  'sum(case when pergen='''+sPerVar1+''' then monnetapo else 0 end) aponet_01, '
       +  'sum(case when pergen='''+sPerVar2+''' then monnetapo else 0 end) aponet_02, '
       +  'sum(case when pergen='''+sPerVar3+''' then monnetapo else 0 end) aponet_03, '
       +  'sum(case when pergen='''+sPerVar4+''' then monnetapo else 0 end) aponet_04, '
       +  'sum(monnetapo) aponet_tot, '
       +  'sum(case when pergen='''+sPerFin+''' then monconapo else 0 end) aponet_cde, '
       +  'sum(monnetapo) + sum(case when pergen='''+sPerFin+''' then monconapo else 0 end) aponet_total, '

       +  'sum(case when pergen='''+sPerVar1+''' then monpagben else 0 end) apoben_01, '
       +  'sum(case when pergen='''+sPerVar2+''' then monpagben else 0 end) apoben_02, '
       +  'sum(case when pergen='''+sPerVar3+''' then monpagben else 0 end) apoben_03, '
       +  'sum(case when pergen='''+sPerVar4+''' then monpagben else 0 end) apoben_04, '
       +  'sum(monpagben) apoben_tot, '
       +  '0 apoben_cde, '
       +  'sum(monpagben) apoben_total, '

       +  'sum(case when pergen='''+sPerVar1+''' then monbenret else 0 end) benret_01, '
       +  'sum(case when pergen='''+sPerVar2+''' then monbenret else 0 end) benret_02, '
       +  'sum(case when pergen='''+sPerVar3+''' then monbenret else 0 end) benret_03, '
       +  'sum(case when pergen='''+sPerVar4+''' then monbenret else 0 end) benret_04, '
       +  'sum(monbenret) benret_tot, '
       +  '0 benret_cde, '
       +  'sum(monbenret) benret_total, '

       +  'sum(case when pergen='''+sPerVar1+''' then monbeninv else 0 end) beninv_01, '
       +  'sum(case when pergen='''+sPerVar2+''' then monbeninv else 0 end) beninv_02, '
       +  'sum(case when pergen='''+sPerVar3+''' then monbeninv else 0 end) beninv_03, '
       +  'sum(case when pergen='''+sPerVar4+''' then monbeninv else 0 end) beninv_04, '
       +  'sum(monbeninv) beninv_tot, '
       +  '0 beninv_cde, '
       +  'sum(monbeninv) beninv_total, '

       +  'sum(case when pergen='''+sPerVar1+''' then monbenfall else 0 end) benfal_01, '
       +  'sum(case when pergen='''+sPerVar2+''' then monbenfall else 0 end) benfal_02, '
       +  'sum(case when pergen='''+sPerVar3+''' then monbenfall else 0 end) benfal_03, '
       +  'sum(case when pergen='''+sPerVar4+''' then monbenfall else 0 end) benfal_04, '
       +  'sum(monbenfall) benfal_tot, '
       +  '0 benfal_cde, '
       +  'sum(monbenfall) benfal_total, '

       +  'sum(case when pergen='''+sPerVar1+''' then monintfonind else 0 end) intfon_01, '
       +  'sum(case when pergen='''+sPerVar2+''' then monintfonind else 0 end) intfon_02, '
       +  'sum(case when pergen='''+sPerVar3+''' then monintfonind else 0 end) intfon_03, '
       +  'sum(case when pergen='''+sPerVar4+''' then monintfonind else 0 end) intfon_04, '
       +  'sum(monintfonind) intfon_tot, '
       +  'sum(case when pergen='''+sPerFin+''' then monconint else 0 end) intfon_cde, '
       +  'sum(monintfonind) + sum(case when pergen='''+sPerFin+''' then monconint else 0 end) intfon_total, '

       +  'sum(case when pergen='''+sPerVar1+''' then monbonfonind else 0 end) bonfon_01, '
       +  'sum(case when pergen='''+sPerVar2+''' then monbonfonind else 0 end) bonfon_02, '
       +  'sum(case when pergen='''+sPerVar3+''' then monbonfonind else 0 end) bonfon_03, '
       +  'sum(case when pergen='''+sPerVar4+''' then monbonfonind else 0 end) bonfon_04, '
       +  'sum(monbonfonind) bonfon_tot, '
       +  'sum(case when pergen='''+sPerFin+''' then monconbonfonind else 0 end) bonfon_cde, '
       +  'sum(monbonfonind) + sum(case when pergen='''+sPerFin+''' then monconbonfonind else 0 end) bonfon_total, '

       +  'sum(case when pergen='''+sPerVar1+''' then monincrestec else 0 end) incres_01, '
       +  'sum(case when pergen='''+sPerVar2+''' then monincrestec else 0 end) incres_02, '
       +  'sum(case when pergen='''+sPerVar3+''' then monincrestec else 0 end) incres_03, '
       +  'sum(case when pergen='''+sPerVar4+''' then monincrestec else 0 end) incres_04, '
       +  'sum(monincrestec) incres_tot, '
       +  '0 incres_cde, '
       +  'sum(monincrestec)  incres_total, '

       +  'sum(case when pergen='''+sPerVar1+''' then monfonind else 0 end) fonind_01, '
       +  'sum(case when pergen='''+sPerVar2+''' then monfonind else 0 end) fonind_02, '
       +  'sum(case when pergen='''+sPerVar3+''' then monfonind else 0 end) fonind_03, '
       +  'sum(case when pergen='''+sPerVar4+''' then monfonind else 0 end) fonind_04, '
       +  'sum(monfonind) fonind_tot, '
       +  'sum(case when pergen='''+sPerFin+''' then monconfonind else 0 end) fonind_cde, '
       +  'sum(monfonind) + sum(case when pergen='''+sPerFin+''' then monconfonind else 0 end) fonind_total, '

       +  'sum(case when pergen='''+sPerVar1+''' then monfonbon else 0 end) fonbon_01, '
       +  'sum(case when pergen='''+sPerVar2+''' then monfonbon else 0 end) fonbon_02, '
       +  'sum(case when pergen='''+sPerVar3+''' then monfonbon else 0 end) fonbon_03, '
       +  'sum(case when pergen='''+sPerVar4+''' then monfonbon else 0 end) fonbon_04, '
       +  'sum(monfonbon) fonbon_tot, '
       +  'sum(case when pergen='''+sPerFin+''' then monconfonbon else 0 end) fonbon_cde, '
       +  'sum(monfonbon) + sum(case when pergen='''+sPerFin+''' then monconfonbon else 0 end) fonbon_total, '

       +  'sum(case when pergen='''+sPerVar1+''' then monrestec else 0 end) restec_01, '
       +  'sum(case when pergen='''+sPerVar2+''' then monrestec else 0 end) restec_02, '
       +  'sum(case when pergen='''+sPerVar3+''' then monrestec else 0 end) restec_03, '
       +  'sum(case when pergen='''+sPerVar4+''' then monrestec else 0 end) restec_04, '
       +  'sum(monrestec) restec_tot, '
       +  '0 restec_cde, '
       +  'sum(monrestec) restec_total, '

       +  'sum(case when pergen='''+sPerVar1+''' then moncuepag else 0 end) cuepag_01, '
       +  'sum(case when pergen='''+sPerVar2+''' then moncuepag else 0 end) cuepag_02, '
       +  'sum(case when pergen='''+sPerVar3+''' then moncuepag else 0 end) cuepag_03, '
       +  'sum(case when pergen='''+sPerVar4+''' then moncuepag else 0 end) cuepag_04, '
       +  'sum(moncuepag) cuepag_tot, '
       +  '0 cuepag_cde, '
       +  'sum(moncuepag) cuepag_total, '

       +  'sum(case when pergen='''+sPerVar1+''' then monresleg else 0 end) resleg_01, '
       +  'sum(case when pergen='''+sPerVar2+''' then monresleg else 0 end) resleg_02, '
       +  'sum(case when pergen='''+sPerVar3+''' then monresleg else 0 end) resleg_03, '
       +  'sum(case when pergen='''+sPerVar4+''' then monresleg else 0 end) resleg_04, '
       +  'sum(monresleg) resleg_tot, '
       +  '0 resleg_cde, '
       +  'sum(monresleg) resleg_total '

       +'From PVS_MAT_RES '
       +'where pergen>='''+sPerVar1+''' and pergen<='''+sPerVar4+'''';
  DM1.cdsQry2.Close;
  DM1.cdsQry2.DataRequest( sSQL );
  try
     DM1.cdsQry2.Open;
  except
     ShowMessage( 'Error : En Tabla de Resultados...' );
     Screen.Cursor:=crDefault;
     Exit;
  end;

  ppdb2.DataSource:=DM1.dsqry2;
  //ppd1.Report:=ppr2;
  //ppr2.Template.FileName:='yy.rtm';
  //ppr2.Template.LoadFromFile;
  Screen.Cursor:=crDefault;
  ppr2.Print;
  end;

  //ppd1.ShowModal;
end;

procedure TFImpResTec.FormActivate(Sender: TObject);
begin
  speAno.Text:=Copy(DateTimeToStr(Date),7,4);
  speMes.Text:=Copy(DateTimeToStr(Date),4,2);
  speMesIni.Text:=Copy(DateTimeToStr(Date),4,2);
  sLink:='';
end;


function TFImpResTec.Busca_Mes_Nombre( sMesT : String ) : String;
var
  sMesDes : String;
begin
  sMesDes:=' ';
  if sMesT='01' then sMesDes:='ENERO';
  if sMesT='02' then sMesDes:='FEBRERO';
  if sMesT='03' then sMesDes:='MARZO';
  if sMesT='04' then sMesDes:='ABRIL';
  if sMesT='05' then sMesDes:='MAYO';
  if sMesT='06' then sMesDes:='JUNIO';
  if sMesT='07' then sMesDes:='JULIO';
  if sMesT='08' then sMesDes:='AGOSTO';
  if sMesT='09' then sMesDes:='SETIEMBRE';
  if sMesT='10' then sMesDes:='OCTUBRE';
  if sMesT='11' then sMesDes:='NOVIEMBRE';
  if sMesT='12' then sMesDes:='DICIEMBRE';
  Result:=sMesDes;
end;

procedure TFImpResTec.bbtnCerrarClick(Sender: TObject);
begin
   Close;
end;

end.
