unit PRE320;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, wwdbdatetimepicker, StdCtrls, Buttons, Spin, ppDB, ppDBPipe,
  ppEndUsr, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppBands, ppCache,
  ppVar, ppCtrls, ppPrnabl, ppParameter;

type
  TFMatResTec = class(TForm)
    Label1: TLabel;
    speAno: TSpinEdit;
    speMes: TSpinEdit;
    Label2: TLabel;
    btnprocesar: TBitBtn;
    btnimprimir: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox2: TGroupBox;
    dbdtpFInicio: TwwDBDateTimePicker;
    dbdtpFFin: TwwDBDateTimePicker;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnprocesarClick(Sender: TObject);
    procedure speAnoExit(Sender: TObject);
    procedure speMesExit(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
  private
    { Private declarations }
    sLink : String;
    procedure FechaDatos;
  public
    { Public declarations }
  end;

var
  FMatResTec: TFMatResTec;

implementation

uses PREDM, DB, PRE321;

{$R *.dfm}

procedure TFMatResTec.BitBtn2Click(Sender: TObject);
begin
   Close;
end;

procedure TFMatResTec.FormActivate(Sender: TObject);
var
   xAnoSig, xMesSig : String;
begin
  speAno.Text:=Copy(DateTimeToStr(Date),7,4);
  speMes.Text:=Copy(DateTimeToStr(Date),4,2);

  if StrToInt(spemes.Text)>=12 then
  begin
     xAnoSig:=IntToStr( StrToInt(speano.Text)+1 );
     xMesSig:='01';
  end
  else
  begin
     xAnoSig:=speano.Text;
     xMesSig:=DM1.StrZero( IntToStr( StrToInt(speMes.Text)+1 ), 2 ) ;
  end;

  sLink:='';

  dbdtpFInicio.Date:=StrToDate('01/'+speMEs.Text+'/'+speAno.Text );
  dbdtpFFin.Date   :=StrToDate('01/'+xMesSig    +'/'+xAnoSig     )-1;
end;

procedure TFMatResTec.btnprocesarClick(Sender: TObject);
var
  sCia, sSQL, sAno, sMes, sIns, sNum, sMesAnt, sAnoAnt : String;
  nConApo, nConInt, nConBon, nTotal : Double;
begin
  sAno:=speAno.Text;
  sMes:=DM1.StrZero( speMes.Text, 2);

  Screen.Cursor:=crSQLWait;

  sAnoAnt:=IntToStr(speAno.Value-1);
  // Fecha de Fin de Mes
  if strtoint(sMes)=1 then
  begin
      sMesAnt := '12';
    //  sAAMMAnt:= sAnoAnt+'12';
    //  sFecAnt:= '31/12/'+sAnoAnt;
  end
  else
  begin
      sMesAnt := DM1.StrZero( IntToStr(speMes.Value-1), 2);
      //sAAMMAnt:= sAno+DM1.StrZero( IntToStr(speMes.Value-1), 2);
      //sFecAnt:= datetostr(strtodate('01/'+sMes+'/'+sAno)-1)
  end;

  sCia:='01';

  sSQL:='Select PERGEN from PVS_MAT_RES where PERGEN='''+sAno+sMes+'''';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(sSQL);
  try
     DM1.cdsQry.Open;
  except
     ShowMessage( 'Error : En Tabla de Resultados...' );
     Screen.Cursor:=crDefault;
     Exit;
  end;

  sIns:='N';
  if DM1.cdsQry.RecordCount<=0 then
  begin
     sIns:='S';
     sSQL:='Select nvl(max( CODID ),''000000'') CODID from PVS_MAT_RES'; //where PERGEN='''+sAno+sMes+'''';
     DM1.cdsQry.Close;
     DM1.cdsQry.DataRequest(sSQL);
     DM1.cdsQry.Open;
     sNum:=DM1.StrZero( IntToStr(DM1.cdsQry.FieldByname('CODID').AsInteger+1) ,6);
  end;


  Screen.Cursor:=crDefault;
  if sIns='N' then
  begin
     if MessageDlg('¿ Periodo ya fue generado, ¿ Esta seguro de procesar nuevamente ?',mtconfirmation,[mbYes,MbNo],0)=mrNo then
      Begin
         Screen.Cursor:=crDefault;
         Exit;
      end;
  end;

  // APORTES
  sSQL:='Select ''S1'' SUMA,  INDCTAMAT, B.CUENTAID, B.HABEMN'+sMes+', B.DEBEMN'+sMes+', '
       +  'ROUND(B.HABEMN'+sMes+'-B.DEBEMN'+sMes+'-C.DEBEMN'+sMes+'+C.HABEMN'+sMes+',0) RESULTADO '
       +'From PVS_CTA_MAT A, CNT401'+sLink+' B, '
       +  '( Select CUENTAID, ANO, nvl(HABEMN'+sMes+',0) HABEMN'+sMes+', nvl(DEBEMN'+sMes+',0) DEBEMN'+sMes+' '
       +    'from CNT401'+sLink+' B '
       +    'Where CIAID='''+sCia+''' AND B.ANO='''+sAno+''' AND TIPREG=''1'' '
       +      'AND B.CUENTAID=''4840001'') C '
       +'Where CIAID='''+sCia+''' AND B.ANO='''+sAno+''' AND TIPREG=''1'' '
       +  'and INDCTAMAT=''AP'' AND A.CODCTA=B.CUENTAID';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(sSQL);
  try
     DM1.cdsQry.Open;
  except
     ShowMessage( 'Error S1 : Calculando Aportes...' );
     Screen.Cursor:=crDefault;
     Exit;
  end;

  nTotal:=DM1.cdsQry.FieldByname('RESULTADO').AsFloat;

  if sIns='S' then
  sSQL:='Insert Into PVS_MAT_RES( CODID, MONAPO, PERGEN, ESTGEN, USUCRE, FECREG, HREG ) '
       +'Values( '''+sNum+''', '+DM1.cdsQry.FieldByname('RESULTADO').AsString+', '
       +         ''''+sAno+sMes+''', ''P'', '''+DM1.wUsuario+''', sysdate, sysdate )'
  else
  sSQL:='Update PVS_MAT_RES Set MONAPO='+DM1.cdsQry.FieldByname('RESULTADO').AsString+', '
       +  'ESTGEN=''R'', USUCRE='''+DM1.wUsuario+''', FECREG=SYSDATE, HREG=SYSDATE '
       +'Where PERGEN='''+sAno+sMes+'''';
  try
     DM1.DCOM1.AppServer.EjecutaSQL(sSQL);
  except
     ShowMessage('Error al Generar Tabla de Trabajo 1');
     Screen.Cursor:=crDefault;
     Exit;
  end;


  // DESCUENTOS INDEBIDOS APORTES
  sSQL:='Select ''S1'' SUMA,  INDCTAMAT, B.CUENTAID, B.HABEMN'+sMes+', B.DEBEMN'+sMes+', '
       +  'ROUND( nvl(B.DEBEMN'+sMes+',0) - nvl(B.HABEMN'+sMes+',0) , 0 ) RESULTADO '
       +'From PVS_CTA_MAT A, CNT401'+sLink+' B '
       +'Where CIAID='''+sCia+''' AND B.ANO='''+sAno+''' AND TIPREG=''1'' '
       +  'and INDCTAMAT=''DI'' AND A.CODCTA=B.CUENTAID';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(sSQL);
  try
     DM1.cdsQry.Open;
  except
     ShowMessage( 'Error S1 : Calculando Aportes...' );
     Screen.Cursor:=crDefault;
     Exit;
  end;
  nTotal:=nTotal-DM1.cdsQry.FieldByname('RESULTADO').AsFloat;
  sSQL:='Update PVS_MAT_RES Set MONDESAPO='+DM1.cdsQry.FieldByname('RESULTADO').AsString+', '
       +  'ESTGEN=''R'', FECREG=SYSDATE, HREG=SYSDATE '
       +'Where PERGEN='''+sAno+sMes+'''';
  try
     DM1.DCOM1.AppServer.EjecutaSQL(sSQL);
  except
     ShowMessage('Error al Generar Tabla de Trabajo 1');
     Screen.Cursor:=crDefault;
     Exit;
  end;


  // APORTE NETO
  sSQL:='Update PVS_MAT_RES Set MONNETAPO='+FloatToStr(nTotal)+', '
       +  'ESTGEN=''R'', FECREG=SYSDATE, HREG=SYSDATE '
       +'Where PERGEN='''+sAno+sMes+'''';
  try
     DM1.DCOM1.AppServer.EjecutaSQL(sSQL);
  except
     ShowMessage('Error al Generar Tabla de Trabajo 1');
     Screen.Cursor:=crDefault;
     Exit;
  end;


  // PAGO DE BENEFICIOS - RETIRO
  sSQL:='Select ''S2'' SUMA, INDCTAMAT, B.CUENTAID, B.HABEMN'+sMes+', B.DEBEMN'+sMes+', '
       +  'ROUND( nvl(B.DEBEMN'+sMes+',0) - nvl(B.HABEMN'+sMes+',0), 0 ) RESULTADO '
       +'From PVS_CTA_MAT A, CNT401'+sLink+' B '
       +'Where CIAID='''+sCia+''' AND B.ANO='''+sAno+''' AND TIPREG=''1'' '
       +  'and INDCTAMAT=''RE'' AND A.CODCTA=B.CUENTAID';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(sSQL);
  try
     DM1.cdsQry.Open;
  except
     ShowMessage( 'Error S1 : Calculando Aportes...' );
     Screen.Cursor:=crDefault;
     Exit;
  end;
  sSQL:='Update PVS_MAT_RES Set MONBENRET='+DM1.cdsQry.FieldByname('RESULTADO').AsString+', '
       +  'ESTGEN=''R'', FECREG=SYSDATE, HREG=SYSDATE '
       +'Where PERGEN='''+sAno+sMes+'''';
  nTotal:=DM1.cdsQry.FieldByname('RESULTADO').AsFloat;
  try
     DM1.DCOM1.AppServer.EjecutaSQL(sSQL);
  except
     ShowMessage('Error al Generar Tabla de Trabajo 1');
     Screen.Cursor:=crDefault;
     Exit;
  end;

  // PAGO DE BENEFICIOS - INVALIDEZ
  sSQL:='Select ''S2'' SUMA, INDCTAMAT, B.CUENTAID, B.HABEMN'+sMes+', B.DEBEMN'+sMes+', '
       +  'ROUND(nvl(B.DEBEMN'+sMes+',0) - nvl(B.HABEMN'+sMes+',0) ,0) RESULTADO '
       +'From PVS_CTA_MAT A, CNT401'+sLink+' B '
       +'Where CIAID='''+sCia+''' AND B.ANO='''+sAno+''' AND TIPREG=''1'' '
       +  'and INDCTAMAT=''IN'' AND A.CODCTA=B.CUENTAID';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(sSQL);
  try
     DM1.cdsQry.Open;
  except
     ShowMessage( 'Error S1 : Calculando Aportes...' );
     Screen.Cursor:=crDefault;
     Exit;
  end;
  nTotal:=nTotal+DM1.cdsQry.FieldByname('RESULTADO').AsFloat;
  sSQL:='Update PVS_MAT_RES Set MONBENINV='+DM1.cdsQry.FieldByname('RESULTADO').AsString+', '
       +  'ESTGEN=''R'', FECREG=SYSDATE, HREG=SYSDATE '
       +'Where PERGEN='''+sAno+sMes+'''';
  try
     DM1.DCOM1.AppServer.EjecutaSQL(sSQL);
  except
     ShowMessage('Error al Generar Tabla de Trabajo 1');
     Screen.Cursor:=crDefault;
     Exit;
  end;

  // PAGO DE BENEFICIOS - FALLECIMIENTO
  sSQL:='Select ''S2'' SUMA, INDCTAMAT, B.CUENTAID, B.HABEMN'+sMes+', B.DEBEMN'+sMes+', '
       +  'ROUND(nvl(B.DEBEMN'+sMes+',0) - nvl(B.HABEMN'+sMes+',0),0) RESULTADO '
       +'From PVS_CTA_MAT A, CNT401'+sLink+' B '
       +'Where CIAID='''+sCia+''' AND B.ANO='''+sAno+''' AND TIPREG=''1'' '
       +  'and INDCTAMAT=''FA'' AND A.CODCTA=B.CUENTAID';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(sSQL);
  try
     DM1.cdsQry.Open;
  except
     ShowMessage( 'Error S1 : Calculando Aportes...' );
     Screen.Cursor:=crDefault;
     Exit;
  end;
  nTotal:=nTotal+DM1.cdsQry.FieldByname('RESULTADO').AsFloat;
  sSQL:='Update PVS_MAT_RES Set MONBENFALL='+DM1.cdsQry.FieldByname('RESULTADO').AsString+', '
       +  'ESTGEN=''R'', FECREG=SYSDATE, HREG=SYSDATE '
       +'Where PERGEN='''+sAno+sMes+'''';
  try
     DM1.DCOM1.AppServer.EjecutaSQL(sSQL);
  except
     ShowMessage('Error al Generar Tabla de Trabajo 1');
     Screen.Cursor:=crDefault;
     Exit;
  end;

  // PAGO DE BENEFICIOS
  sSQL:='Update PVS_MAT_RES Set MONPAGBEN='+FloatToStr(nTotal)+', '
       +  'ESTGEN=''R'', FECREG=SYSDATE, HREG=SYSDATE '
       +'Where PERGEN='''+sAno+sMes+'''';
  try
     DM1.DCOM1.AppServer.EjecutaSQL(sSQL);
  except
     ShowMessage('Error al Generar Tabla de Trabajo 1');
     Screen.Cursor:=crDefault;
     Exit;
  end;

  // INTERES DE FONDOS INDIVIDUALES - solo haber
  sSQL:='Select ''S3'' SUMA, INDCTAMAT, B.CUENTAID, B.HABEMN'+sMes+', B.DEBEMN'+sMes+', '
       //+  'ROUND(nvl(B.HABEMN'+sMes+',0) - nvl(B.DEBEMN'+sMes+',0), 0) RESULTADO '
       +  'ROUND(nvl(B.HABEMN'+sMes+',0), 0) RESULTADO '
       +'From PVS_CTA_MAT A, CNT401'+sLink+' B '
       +'Where CIAID='''+sCia+''' AND B.ANO='''+sAno+''' AND TIPREG=''1'' '
       +  'and INDCTAMAT=''IF'' AND A.CODCTA=B.CUENTAID';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(sSQL);
  try
     DM1.cdsQry.Open;
  except
     ShowMessage( 'Error S1 : Calculando Aportes...' );
     Screen.Cursor:=crDefault;
     Exit;
  end;
  sSQL:='Update PVS_MAT_RES Set MONINTFONIND='+DM1.cdsQry.FieldByname('RESULTADO').AsString+', '
       +  'ESTGEN=''R'', FECREG=SYSDATE, HREG=SYSDATE '
       +'Where PERGEN='''+sAno+sMes+'''';
  try
     DM1.DCOM1.AppServer.EjecutaSQL(sSQL);
  except
     ShowMessage('Error al Generar Tabla de Trabajo 1');
     Screen.Cursor:=crDefault;
     Exit;
  end;

  // BONUS FONDOS INDIVIDUALES - solo haber
  sSQL:='Select ''S3'' SUMA, INDCTAMAT, B.CUENTAID, B.HABEMN'+sMes+', B.DEBEMN'+sMes+', '
       //+  'ROUND(nvl(B.HABEMN'+sMes+',0) - nvl(B.DEBEMN'+sMes+',0),0) RESULTADO '
       +  'ROUND(nvl(B.HABEMN'+sMes+',0), 0) RESULTADO '
       +'From PVS_CTA_MAT A, CNT401'+sLink+' B '
       +'Where CIAID='''+sCia+''' AND B.ANO='''+sAno+''' AND TIPREG=''1'' '
       +  'and INDCTAMAT=''BF'' AND A.CODCTA=B.CUENTAID';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(sSQL);
  try
     DM1.cdsQry.Open;
  except
     ShowMessage( 'Error S1 : Calculando Aportes...' );
     Screen.Cursor:=crDefault;
     Exit;
  end;
  sSQL:='Update PVS_MAT_RES Set MONBONFONIND='+DM1.cdsQry.FieldByname('RESULTADO').AsString+', '
       +  'ESTGEN=''R'', FECREG=SYSDATE, HREG=SYSDATE '
       +'Where PERGEN='''+sAno+sMes+'''';
  try
     DM1.DCOM1.AppServer.EjecutaSQL(sSQL);
  except
     ShowMessage('Error al Generar Tabla de Trabajo 1');
     Screen.Cursor:=crDefault;
     Exit;
  end;

  // INCREMENTO RESERVAS TECNICAS
  sSQL:='Select ''S3'' SUMA, INDCTAMAT, B.CUENTAID, B.HABEMN'+sMes+', B.DEBEMN'+sMes+', '
       +  'ROUND(nvl(B.HABEMN'+sMes+',0) - nvl(B.DEBEMN'+sMes+',0),0) RESULTADO '
       +'From PVS_CTA_MAT A, CNT401'+sLink+' B '
       +'Where CIAID='''+sCia+''' AND B.ANO='''+sAno+''' AND TIPREG=''1'' '
       +  'and INDCTAMAT=''RT'' AND A.CODCTA=B.CUENTAID';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(sSQL);
  try
     DM1.cdsQry.Open;
  except
     ShowMessage( 'Error S1 : Calculando Aportes...' );
     Screen.Cursor:=crDefault;
     Exit;
  end;
  sSQL:='Update PVS_MAT_RES Set MONINCRESTEC='+DM1.cdsQry.FieldByname('RESULTADO').AsString+', '
       +  'ESTGEN=''R'', FECREG=SYSDATE, HREG=SYSDATE '
       +'Where PERGEN='''+sAno+sMes+'''';
  try
     DM1.DCOM1.AppServer.EjecutaSQL(sSQL);
  except
     ShowMessage('Error al Generar Tabla de Trabajo 1');
     Screen.Cursor:=crDefault;
     Exit;
  end;

  // FONDOS INDIVIDUALES
  sSQL:='select ''S4'' SUMA, ''FI'', B.CUENTAID, B.ANO, B.SALDMN'+sMes+', C.SALDMN'+sMes+', '
       +  'ROUND( nvl(B.SALDMN'+sMes+',0) + nvl(C.SALDMN'+sMes+',0),0)*(-1) RESULTADO '
       +'from CNT401'+sLink+' B, '
       +  '( select CUENTAID, ANO, SALDMN'+sMes+' from CNT401'+sLink+' B '
       +    'Where CIAID='''+sCia+''' AND B.ANO='''+sAno+''' AND TIPREG=''1'' '
       +     ' and B.CUENTAID=''4840001'') C '
       +'Where CIAID='''+sCia+''' AND B.ANO='''+sAno+''' AND TIPREG=''1'' AND B.CUENTAID=''481''';

  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(sSQL);
  try
     DM1.cdsQry.Open;
  except
     ShowMessage( 'Error S1 : Calculando Aportes...' );
     Screen.Cursor:=crDefault;
     Exit;
  end;
  sSQL:='Update PVS_MAT_RES Set MONFONIND='+DM1.cdsQry.FieldByname('RESULTADO').AsString+', '
       +  'ESTGEN=''R'', FECREG=SYSDATE, HREG=SYSDATE '
       +'Where PERGEN='''+sAno+sMes+'''';
  try
     DM1.DCOM1.AppServer.EjecutaSQL(sSQL);
  except
     ShowMessage('Error al Generar Tabla de Trabajo 1');
     Screen.Cursor:=crDefault;
     Exit;
  end;

  // FONDO BONUS
  sSQL:='select ''S5'' SUMA, ''FB'', B.CUENTAID, B.ANO, B.SALDMN'+sMes+', '
       +  'ROUND( nvl(B.SALDMN'+sMes+',0),0)*(-1) RESULTADO '
       +'from CNT401'+sLink+' B '
       +'Where CIAID='''+sCia+''' AND B.ANO='''+sAno+''' AND TIPREG=''1'' AND B.CUENTAID=''4830001''';

  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(sSQL);
  try
     DM1.cdsQry.Open;
  except
     ShowMessage( 'Error S1 : Calculando Aportes...' );
     Screen.Cursor:=crDefault;
     Exit;
  end;
  sSQL:='Update PVS_MAT_RES Set MONFONBON='+DM1.cdsQry.FieldByname('RESULTADO').AsString+', '
       +  'ESTGEN=''R'', FECREG=SYSDATE, HREG=SYSDATE '
       +'Where PERGEN='''+sAno+sMes+'''';
  try
     DM1.DCOM1.AppServer.EjecutaSQL(sSQL);
  except
     ShowMessage('Error al Generar Tabla de Trabajo 1');
     Screen.Cursor:=crDefault;
     Exit;
  end;

  // RESERVAS TECNICAS DE MUERTE E INVALIDEZ
  sSQL:='select ''S6'' SUMA, ''RT'', B.CUENTAID, B.ANO, B.SALDMN'+sMes+', '
       +  'ROUND( nvl(B.SALDMN'+sMes+',0),0)*(-1) RESULTADO '
       +'from CNT401'+sLink+' B '
       +'Where CIAID='''+sCia+''' AND B.ANO='''+sAno+''' AND TIPREG=''1'' AND B.CUENTAID=''482''';

  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(sSQL);
  try
     DM1.cdsQry.Open;
  except
     ShowMessage( 'Error S1 : Calculando Aportes...' );
     Screen.Cursor:=crDefault;
     Exit;
  end;
  sSQL:='Update PVS_MAT_RES Set MONRESTEC='+DM1.cdsQry.FieldByname('RESULTADO').AsString+', '
       +  'ESTGEN=''R'', FECREG=SYSDATE, HREG=SYSDATE '
       +'Where PERGEN='''+sAno+sMes+'''';
  try
     DM1.DCOM1.AppServer.EjecutaSQL(sSQL);
  except
     ShowMessage('Error al Generar Tabla de Trabajo 1');
     Screen.Cursor:=crDefault;
     Exit;
  end;

  // TOTAL DE CUENTAS POR PAGAR TECNICAS
  sSQL:='select ''S7'' SUMA, ''TC'', B.CUENTAID, B.ANO, B.SALDMN'+sMes+', '
       +  'ROUND( nvl(B.SALDMN'+sMes+',0),0)*(-1) RESULTADO '
       +'from CNT401'+sLink+' B '
       +'Where CIAID='''+sCia+''' AND B.ANO='''+sAno+''' AND TIPREG=''1'' AND B.CUENTAID=''48''';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(sSQL);
  try
     DM1.cdsQry.Open;
  except
     ShowMessage( 'Error S1 : Calculando Aportes...' );
     Screen.Cursor:=crDefault;
     Exit;
  end;
  sSQL:='Update PVS_MAT_RES Set MONCUEPAG='+DM1.cdsQry.FieldByname('RESULTADO').AsString+', '
       +  'ESTGEN=''R'', FECREG=SYSDATE, HREG=SYSDATE '
       +'Where PERGEN='''+sAno+sMes+'''';
  try
     DM1.DCOM1.AppServer.EjecutaSQL(sSQL);
  except
     ShowMessage('Error al Generar Tabla de Trabajo 1');
     Screen.Cursor:=crDefault;
     Exit;
  end;

  // TOTAL DE RESERVA LEGAL
  sSQL:='select ''S8'' SUMA, ''RL'', B.CUENTAID, B.ANO, B.SALDMN12, B.SALDMN'+sMesAnt+', '
       +  'ROUND( B.SALDMN12 - SALANT * 0.1,0)*(-1) RESULTADO '
       +'From CNT401'+sLink+' B, '
       +  '( SELECT SUM(nvl(SALDMN12,0)*(-1)) SALANT FROM TGE202 A, CNT401'+sLink+' B '
       +    'Where A.CIAID='''+sCia+''' AND A.CTANIV=''1'' AND A.CTA_TIPO=''R'' '
       +      'and A.CIAID=B.CIAID AND B.ANO='''+sAnoAnt+''' AND A.CUENTAID=B.CUENTAID ) C '
       +'Where CIAID='''+sCia+''' AND B.ANO='''+sAnoAnt+''' AND TIPREG=''1'' AND B.CUENTAID=''58'' ';

  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(sSQL);
  try
     DM1.cdsQry.Open;
  except
     ShowMessage( 'Error S1 : Calculando Aportes...' );
     Screen.Cursor:=crDefault;
     Exit;
  end;
  sSQL:='Update PVS_MAT_RES Set MONRESLEG='+DM1.cdsQry.FieldByname('RESULTADO').AsString+', '
       +  'ESTGEN=''R'', FECREG=SYSDATE, HREG=SYSDATE '
       +'Where PERGEN='''+sAno+sMes+'''';
  try
     DM1.DCOM1.AppServer.EjecutaSQL(sSQL);
  except
     ShowMessage('Error al Generar Tabla de Trabajo 1');
     Screen.Cursor:=crDefault;
     Exit;
  end;



  // CONCILIACION DE MATRIZ

  // CONCILIACION DE APORTES
  sSQL:='SELECT SUM( round(IMPORTE,0) ) RESULTADO FROM ( '
       +   'SELECT ''CNT401'' TABLA,  SUM( SUM1) IMPORTE FROM ( '
       +      'Select SUM(NVL(B.SALDMN'+sMes+',0))*(-1) SUM1 '
       +      'From CNT401'+sLink+' B '
       +      'Where CIAID='''+sCia+''' AND B.ANO='''+sAno+''' AND TIPREG=''1'' '
       +        'and B.CUENTAID IN (''484'',''4810001'',''4810006'' ) '
       +      'UNION ALL '
       +      'Select SUM(NVL(B.SALDMN'+sMes+',0))*(-1) SUM1 '
       +      'From CNT401'+sLink+' B '
       +      'Where CIAID='''+sCia+''' AND B.ANO='''+sAno+''' AND TIPREG=''1'' '
       +        'AND B.CUENTAID IN (''4810002'',''4810003'' ) '
       +   ' ) A '
       +   'UNION ALL '
       +   'SELECT ''TEC'' TABLA, SUM( TEC )*(-1) IMPORTE FROM ( '
       +      'SELECT SUM(NVL(ACUMESANT,0) + NVL(CAPITAL,0) ) TEC FROM RES_TEC_1'+sLink+' '
       +      'WHERE PERIODO='''+sAno+sMes+''' '
       +      'UNION ALL '
       +      'SELECT SUM(NVL(CAPITAL,0)) TEC  FROM RES_TEC_2'+sLink+' '
       +      'WHERE PERIODO='''+sAno+sMes+''' '
       +   ' ) B '
       +') C';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(sSQL);
  try
     DM1.cdsQry.Open;
  except
     ShowMessage( 'Error S1 : Calculando Aportes...' );
     Screen.Cursor:=crDefault;
     Exit;
  end;
  nConApo:=DM1.cdsQry.FieldByname('RESULTADO').AsFloat;
  sSQL:='Update PVS_MAT_RES Set MONCONAPO='+DM1.cdsQry.FieldByname('RESULTADO').AsString+', '
       +  'ESTGEN=''R'', FECREG=SYSDATE, HREG=SYSDATE '
       +'Where PERGEN='''+sAno+sMes+'''';
  try
     DM1.DCOM1.AppServer.EjecutaSQL(sSQL);
  except
     ShowMessage('Error al Generar Tabla de Trabajo 1');
     Screen.Cursor:=crDefault;
     Exit;
  end;

  // CONCIALICION DE INTERESES DE FONDO INDIVIDUAL

   sSQL:='SELECT SUM( round(IMPORTE,0) ) RESULTADO FROM ( '
        +  'SELECT ''CNT401'' TABLA, SUM( SUM1) IMPORTE FROM ( '
        +    'select SUM(NVL(B.SALDMN'+sMesAnt+',0))*(-1) SUM1 '
        +    'From CNT401'+sLink+' B '
        +    'Where CIAID='''+sCia+''' AND B.ANO='''+sAno+''' AND TIPREG=''1'' '
        +      'and B.CUENTAID IN (''4810004'') '
        +  ') A '
        +  'UNION ALL '
        +  'SELECT ''TEC'' TABLA, SUM( TEC )*(-1) IMPORTE FROM ( '
        +    'SELECT SUM(NVL(INTCAPACU,0)) TEC FROM RES_TEC_1 WHERE PERIODO='''+sAno+sMes+''' '
        +    'UNION ALL '
        +    'SELECT SUM(NVL(INTCAPACU,0)) TEC  FROM RES_TEC_2 WHERE PERIODO='''+sAno+sMes+''' '
        +  ') B '
        +') C ';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(sSQL);
  try
     DM1.cdsQry.Open;
  except
     ShowMessage( 'Error S1 : Calculando Aportes...' );
     Screen.Cursor:=crDefault;
     Exit;
  end;
  nConInt:=DM1.cdsQry.FieldByname('RESULTADO').AsFloat;
  sSQL:='Update PVS_MAT_RES Set MONCONINT='+DM1.cdsQry.FieldByname('RESULTADO').AsString+', '
       +  'ESTGEN=''R'', FECREG=SYSDATE, HREG=SYSDATE '
       +'Where PERGEN='''+sAno+sMes+'''';
  try
     DM1.DCOM1.AppServer.EjecutaSQL(sSQL);
  except
     ShowMessage('Error al Generar Tabla de Trabajo 1');
     Screen.Cursor:=crDefault;
     Exit;
  end;


  // CONCILIACION BONUS FONDO
   sSQL:='SELECT SUM( round(IMPORTE,0) ) RESULTADO FROM ( '
        +  'SELECT ''CNT401'' TABLA,  SUM( SUM1) IMPORTE FROM ( '
        +    'select SUM(NVL(B.SALDMN'+sMesAnt+',0))*(-1) SUM1 '
        +    'From CNT401 B '
        +    'Where CIAID='''+sCia+''' AND B.ANO='''+sAno+''' AND TIPREG=''1'' '
        +      'and B.CUENTAID IN (''4810005'') '
        +  ') A '
        +  'UNION ALL '
        +  'SELECT ''TEC'' TABLA, SUM( TEC )*(-1) IMPORTE FROM ( '
        +     'SELECT SUM(NVL(BONOS,0)) TEC FROM RES_TEC_1 WHERE PERIODO='''+sAno+sMes+''' '
        +     'UNION ALL '
        +     'SELECT SUM(NVL(BONOS,0)) TEC  FROM RES_TEC_2 WHERE PERIODO='''+sAno+sMes+''' '
        +  ') B '
        +') C';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(sSQL);
  try
     DM1.cdsQry.Open;
  except
     ShowMessage( 'Error S1 : Calculando Aportes...' );
     Screen.Cursor:=crDefault;
     Exit;
  end;
  nConBon:=DM1.cdsQry.FieldByname('RESULTADO').AsFloat;
  sSQL:='Update PVS_MAT_RES Set MONCONBONFONIND='+DM1.cdsQry.FieldByname('RESULTADO').AsString+', '
       +  'ESTGEN=''R'', FECREG=SYSDATE, HREG=SYSDATE '
       +'Where PERGEN='''+sAno+sMes+'''';
  try
     DM1.DCOM1.AppServer.EjecutaSQL(sSQL);
  except
     ShowMessage('Error al Generar Tabla de Trabajo 1');
     Screen.Cursor:=crDefault;
     Exit;
  end;

  sSQL:='Update PVS_MAT_RES Set MONCONBONFONIND='+DM1.cdsQry.FieldByname('RESULTADO').AsString+', '
       +  'ESTGEN=''R'', FECREG=SYSDATE, HREG=SYSDATE '
       +'Where PERGEN='''+sAno+sMes+'''';
  try
     DM1.DCOM1.AppServer.EjecutaSQL(sSQL);
  except
     ShowMessage('Error al Generar Tabla de Trabajo 1');
     Screen.Cursor:=crDefault;
     Exit;
  end;


  // CONCILIACION FONDOS INDIVIDUALES
  //SUM( 1 + 2 + 3 )

  // CONCILIACION FONDOS BONUS
  //SUM( 1 + 2 + 3 ) * (-1)

  nTotal:=nConApo+nConInt+nConBon;

  sSQL:='Update PVS_MAT_RES Set MONCONFONIND='+FloatToStr(nTotal)+', '
       +  'MONCONFONBON='+FloatToStr(nTotal*(-1))+', '
       +  'ESTGEN=''R'', FECREG=SYSDATE, HREG=SYSDATE '
       +'Where PERGEN='''+sAno+sMes+'''';
  try
     DM1.DCOM1.AppServer.EjecutaSQL(sSQL);
  except
     ShowMessage('Error al Generar Tabla de Trabajo 1');
     Screen.Cursor:=crDefault;
     Exit;
  end;

  Screen.Cursor:=crDefault;
  ShowMessage('Proceso OK');
end;

procedure TFMatResTec.FechaDatos;
var
   xAnoSig, xMesSig : String;
begin
  if StrToInt(spemes.Text)>=12 then
  begin
     xAnoSig:=IntToStr( StrToInt(speano.Text)+1 );
     xMesSig:='01';
  end
  else
  begin
     xAnoSig:=speano.Text;
     xMesSig:=DM1.StrZero( IntToStr( StrToInt(speMes.Text)+1 ), 2 ) ;
  end;

  dbdtpFInicio.Date:=StrToDate('01/'+speMEs.Text+'/'+speAno.Text );
  dbdtpFFin.Date   :=StrToDate('01/'+xMesSig    +'/'+xAnoSig     )-1;
end;

procedure TFMatResTec.speAnoExit(Sender: TObject);
begin
  FechaDatos;
end;

procedure TFMatResTec.speMesExit(Sender: TObject);
begin
  FechaDatos;
end;

procedure TFMatResTec.btnimprimirClick(Sender: TObject);
begin
  Try
    FImpResTec := TFImpResTec.Create(Self);
    FImpResTec.showmodal;
  Finally
    FImpResTec.free;
 end;

end;

end.
