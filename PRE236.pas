// Inicio Uso Estándares: 01/08/2011
// Unidad : Previsión Social
// Formulario : TfMstCre
// Fecha de Creación : 08/08/2011
// Autor : Sistemas
// Objetivo : Mostrar el cronograma de créditos
// Actualizaciones
// HPP_201004_PRE - SAR-2009-0984 - se añade Total Cuotas en Proceso de Cobranza en pie de Cronograma
// HPC_201207_PRE : Se añade la columna Monto cobrado de desgravamen en el rrReport ppREstCta.
// DPP_201207_PRE : Se realiza el pase a producción a partir del HPC_201207
// HPC_201304_PRE : Se corrige error el momento de mostrar nombre de ugel en el reporte de asociados sin creditos
// SPP_201305_PRE : Se realiza el pase a producción a partir del HPC_201304_PRE
// HPC_201307_PRE : Se corrige error en el calculo de cuotas diferidas
//                  Se añade nuevo logo institucional  
// SPP_201401_PRE : Se realiza el pase a producción a partir del pase HPC_201307_PRE
// HPC_201606_PRE : Se adiciona opción para guardar un Log del Motivo de La Impresión del Cronograma

unit PRE236;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, ppDB, ppDBPipe,
  ppCtrls, ppBands, ppPrnabl, ppClass, ppVar, ppCache, ppComm, ppRelatv,
  ppProd, ppReport, ppParameter, ExtCtrls, ppDBBDE, ppEndUsr, db, jpeg;  // SPP_201401_PRE

type
  TfMstCre = class(TForm)
    dbgCreditos: TwwDBGrid;
    btnSalir: TBitBtn;
    BitBtn1: TBitBtn;
    ppREstCta: TppReport;
    ppDBEstCta: TppDBPipeline;
    pprsincredito: TppReport;
    ppParameterList1: TppParameterList;
    ppHeaderBand2: TppHeaderBand;
    ppLine8: TppLine;
    ppDetailBand2: TppDetailBand;
    ppLabel77: TppLabel;
    pplblTitulo1: TppLabel;
    pplblAnalista1: TppLabel;
//Inicio: SPP_201401_PRE
    // ppLabel59: TppLabel; 
    // ppLabel60: TppLabel; 
//Fin: SPP_201401_PRE
    ppLabel61: TppLabel;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    ppLabel70: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    pplasocodmod: TppLabel;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    pplasoapenomdni: TppLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    pplusenom: TppLabel;
    pplesrcuecre: TppLabel;
    ppLine11: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppParameterList3: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppSystemVariable2: TppSystemVariable;
    ppLine4: TppLine;
//Inicio: SPP_201401_PRE
    // ppLabel16: TppLabel; 
    // ppLabel17: TppLabel; 
//Fin: SPP_201401_PRE
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLblTitulo: TppLabel;
    ppLabel21: TppLabel;
    ppLblCodMod: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    pplblTipCre: TppLabel;
    pplblNomGen: TppLabel;
    pplblNumPre: TppLabel;
    ppLabel25: TppLabel;
    pplblFecPre: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    pplblUse: TppLabel;
    pplblMonto: TppLabel;
    ppLabel28: TppLabel;
    pplblNumCuo: TppLabel;
    ppLabel29: TppLabel;
    pplblTipCli: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppShpImg: TppShape;
    ppImage1: TppImage;
    ppLabel20: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLblInt: TppLabel;
    ppLblFlat: TppLabel;
    ppLine5: TppLine;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLblCuenta: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLblOriOto: TppLabel;
    pplblRotulo: TppLabel;
    pplblRot02: TppLabel;
    ppLblTipDes: TppLabel;
    ppLblEstado: TppLabel;
    ppLblCuotas: TppLabel;
    ppLabel76: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel58: TppLabel;
    ppLabel71: TppLabel;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel80: TppLabel;
    pplblTipCliOtorg: TppLabel;
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
    ppDBText16: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppLine6: TppLine;
    ppLine1: TppLine;
    ppLabel30: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLabel31: TppLabel;
    lblSalTot: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLblCuoVen: TppLabel;
    pplblCuoPen: TppLabel;
    ppLabel43: TppLabel;
    pplblMonPag: TppLabel;
    ppLNota1: TppLabel;
    ppLine7: TppLine;
    ppLabel44: TppLabel;
    ppLabel46: TppLabel;
    ppLabel45: TppLabel;
    ppLabel56: TppLabel;
    ppLblUser: TppLabel;
    ppDBCalc6: TppDBCalc;
    ppLblApro: TppLabel;
    ppLNota2: TppLabel;
    ppLabel57: TppLabel;
    lblVen: TppLabel;
    lblPen: TppLabel;
    lblTot: TppLabel;
    ppLabel69: TppLabel;
    ppLabel75: TppLabel;
    ppLabel74: TppLabel;
    ppLabel73: TppLabel;
    ppLabel72: TppLabel;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLblCuoDif: TppLabel;
    lblDif: TppLabel;

    ppLabel68: TppLabel;
    pplblCuoProCob: TppLabel;
    ppLabel107: TppLabel;
    lblProCob: TppLabel;
    ppLabel109: TppLabel;
//Inicio: DPP_201207_PRE
    ppLabel83: TppLabel;
    ppDBText10: TppDBText;
    ppDBCalc7: TppDBCalc;
    ppLabel86: TppLabel;
    ppLblDesgravamen: TppLabel;
//Inicio: SPP_201401_PRE
    ppImage2: TppImage; 
    ppImage3: TppImage; 
//Fin: SPP_201401_PRE
//Fin: DPP_201207_PRE

    procedure btnSalirClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    sincredito :String;
    { Public declarations }
  end;

var
  fMstCre: TfMstCre;

implementation

//Inicio HPC_201606_PRE --Se adiciona opción para guardar un Log del Motivo de La Impresión del Cronograma
uses PREDM, COB903B;
//Final HPC_201606_PRE

{$R *.dfm}

procedure TfMstCre.btnSalirClick(Sender: TObject);
begin
  fMstCre.Close;
end;

procedure TfMstCre.BitBtn1Click(Sender: TObject);
Var xSql, xfCalc, xfVenc :String;
   xSalDif, xCuoDif, xSalAnt,xSalVen,xCuoVen,xCuoPen: Double;
   xSalProCob, xCuoProCob:Double; // SE CREA LAS VARIABLES PARA SALDO Y CUOTA EN PROCESO DE COBRANZA
begin
   If DM1.cdsCreditos.RecordCount = 0 Then
   Begin
      pplesrcuecre.Caption    := 'ESTADO DE CUENTA DE CREDITOS AL : '+DateToStr(date);
      pplasocodmod.Caption    := DM1.cdsAsociado.FieldByName('ASOCODMOD').AsString;
      pplasoapenomdni.Caption := DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString;
      // Inicio: SPP_201305_PRE // Se corrige error al momento de mostrar la descripción de Ugel. Cuando el código de ugel es repetido se muestra el primero.
      // pplusenom.Caption       := DM1.DevuelveValor('APO101', 'USENOM', 'USEID', DM1.cdsAsociado.FieldByName('USEID').AsString);
      xSql := 'SELECT USENOM FROM APO101 WHERE UPROID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString)
                                        +' AND UPAGOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString)
                                        +' AND USEID = '+QuotedStr(DM1.cdsAsociado.FieldByName('USEID').AsString);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      pplusenom.Caption := DM1.cdsQry.FieldByName('USENOM').AsString;
      // Fin: SPP_201305_PRE


      pprsincredito.Print;
      pprsincredito.Stop;
   End
   Else
   Begin
     xSql := 'SELECT ASOID, ASOCODMOD, ASOCODPAGO, TIPCREID, TMONID, CREANO, CREMES, '
            +'       CRESALDO, CRECUOTA, CREMTO, CREAMORT, CREINTERES, CREFLAT, CREFVEN, '
            +'       CREFPAG, USEID, UPROID, DPTOID, UPAGOID, BANCOID, CCBCOID, NROOPE, '
            +'       FOPERAC, TCAMBIO, CREMTOCOB, CREMONLOC, CREMONEXT, USUARIO, FREG, '
            +'       HREG, FORPAGOID, CREFDEV, CREFRECL, ASOAPENOM, AGENBCOID, CRECAPITAL, '
            +'       CREMTOINT, CREMTOFLAT, CRENEWID, FNABONO, CREDID, CRETCALID, '
            +'       TIPDESEID, TMONABR, CRETCALABR, TIPDESABR, TIPCREABR, FORPAGOABR, '
            +'       LISTAABR, CIAID, CREESTID, CREESTADO, CRECOM, CRESEG, CREPOR, CREGADM, '
            +'       CRECOMP, CREMORA, CREMTOCOM, CREMTOSEG, CREMTOPOR, CREMTOGADM, '
            +'       CREMTOCOMP, CREMTOMORA, LISTAID, ASOCODAUX, NRONABO, CIUDID, FLGPAG, '
            +'       ARCHIVOFTP, CREBLOQ, CREBLOQFEC, CREBLOQOBS, CREDIDNABO, CREINFO, '
            +'       CREMTOEXC, AREAID, CREDOCPAG, FLAGVAR, CRECAPCRON, CREINTCRON, '
            +'       CREFLACRON, CREMTOAN, CREAMORTAN, CREINTERESAN, CREFLATAN, FLAGNVINT, '
            +'       DESBLOFEC, USUBLOQ, USUDESBLOQ, NROREFINAN, CREFLGEXC, CREFECEXC, '
            +'       FLGINT, NROOPETMP, FOPERACTMP, FLGDESMAR, USUDESMAR, FECDESMAR, '
            +'       OBSDESMAR, CREMTODEV, CRECAPCON, FLGINCONSIS, CREAPLEXC, TIPNABO, '
            +'       PERPROC, FECPROC, FLGPROC, PERCOB, CREESTIDANT, SALDOSBS, CREANOINI, '
            +'       CREMESINI, CRECUOTAINI, CREFVENINI, CRECUOTAINI2, CREFVENINI2, '
            // Inicio: HPC_201207
            // +'       CRECUOTAINI3, CREFVENINI3, FLAREP, '
            +'       CRECUOTAINI3, CREFVENINI3, FLAREP, MONPACDESGRAV  '
            // Fin: HPC_201207
            +'FROM CRE302 WHERE ASOID = '+QuotedStr(DM1.cdsCreditos.FieldByName('ASOID').AsString)
            +' AND CREDID = '+QuotedStr(DM1.cdsCreditos.FieldByName('CREDID').AsString)+' ORDER BY CRECUOTA';
     DM1.cdsCuentas.Close;
     DM1.cdsCuentas.DataRequest(xSql);
     DM1.cdsCuentas.Open;
     ppLblTitulo.Caption := 'CRONOGRAMA DE PAGOS Nº : '
           +DM1.cdsCreditos.FieldByName('CREDID').AsString+' AL '+ DateToStr(date);

     // Inicio: HPC_201207
     ppLblOriOto.Caption := DM1.cdsCreditos.FieldByName('OFDESID').AsString+' - '+DM1.DevuelveValor('APO110', 'OFDESNOM', 'OFDESID', DM1.cdsCreditos.FieldByName('OFDESID').AsString);
     xSql := 'SELECT USENOM FROM APO101 WHERE UPROID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString)+' AND UPAGOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString)+' AND USEID = '+QuotedStr(DM1.cdsAsociado.FieldByName('USEID').AsString);
     DM1.cdsQry.Close;
     DM1.cdsQry.DataRequest(xSql);
     DM1.cdsQry.Open;
     pplblUse.Caption := DM1.cdsAsociado.FieldByName('USEID').AsString+' - '+DM1.cdsQry.FieldByName('USENOM').AsString;
     // Fin: HPC_201207

     ppLblCodMod.Caption := DM1.cdsAsociado.FieldByName('ASOCODMOD').AsString;
     ppLblEstado.Caption := DM1.cdsCreditos.FieldByName('CREESTADO').AsString;
     pplblFecPre.Caption := DM1.cdsCreditos.FieldByName('CREFOTORG').AsString;
     pplblNomGen.Caption := DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString;
     pplblNumPre.Caption := DM1.cdsCreditos.FieldByName('CREDID').AsString;
     ppLblInt.Caption := DM1.cdsCreditos.FieldByName('CREINTERES').AsString;
     ppLblFlat.Caption := DM1.cdsCreditos.FieldByName('CREDFLAT').AsString;
     pplblTipCliOtorg.Caption := DM1.cdsCreditos.FieldByName('ASOTIPID').AsString + ' - ' + DM1.RecuperaDatos('APO107','ASOTIPID',DM1.cdsCreditos.FieldByName('ASOTIPID').AsString,'ASOTIPDES');
     pplblTipCli.Caption := DM1.cdsAsociado.FieldByName('ASOTIPID').AsString+' - '+DM1.DevuelveValor('APO107', 'ASOTIPDES', 'ASOTIPID', DM1.cdsAsociado.FieldByName('ASOTIPID').AsString);
     ppLblTipDes.Caption := DM1.cdsCreditos.FieldByName('TIPDESEID').AsString+' - '+DM1.DevuelveValor('CRE104', 'TIPDESEABR', 'TIPDESEID', DM1.cdsCreditos.FieldByName('TIPDESEID').AsString);
     pplblTipCre.Caption := DM1.cdsCreditos.FieldByName('TIPCREID').AsString+' - '
     +DM1.DevuelveValor('CRE110', 'TIPCREDES', 'TIPCREID', DM1.cdsCreditos.FieldByName('TIPCREID').AsString);
     ppLblUser.Caption:='Impreso por   : '+DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
     ppLblApro.Caption:='Otorgado por  : '+DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.cdsCreditos.FieldByName('USUARIO').AsString);
     If DM1.cdsCreditos.FieldByName('TIPDESEID').AsString <> '10' Then pplblTipCre.Caption := pplblTipCre.Caption + '  [NORMAL]'
     Else pplblTipCre.Caption := pplblTipCre.Caption + '  [REFINANCIADO]';
     ppLblCuenta.Caption := DM1.cdsAsociado.FieldByName('ASONCTA').AsString+' - ['+DM1.cdsAsociado.FieldByName('SITCTA').AsString+']';
     pplblMonto.Caption :=  FormatFloat('###,###.00',DM1.cdsCreditos.FieldByName('CREMTOOTOR').AsFloat);

  //Inicio: DPP_201207_PRE
     ppLblDesgravamen.Caption := FormatFloat('##0.000%', DM1.cdsCreditos.FieldByName('TASFONDES').AsFloat);
  //Fin: DPP_201207_PRE

     xSql := 'SELECT ASOID, ASOCODMOD, ASOCODPAGO, TIPCREID, TMONID, CREANO, CREMES, '
            +'       CRESALDO, CRECUOTA, CREMTO, CREAMORT, CREINTERES, CREFLAT, CREFVEN, '
            +'       CREFPAG, USEID, UPROID, DPTOID, UPAGOID, BANCOID, CCBCOID, NROOPE, '
            +'       FOPERAC, TCAMBIO, CREMTOCOB, CREMONLOC, CREMONEXT, USUARIO, FREG, '
            +'       HREG, FORPAGOID, CREFDEV, CREFRECL, ASOAPENOM, AGENBCOID, CRECAPITAL, '
            +'       CREMTOINT, CREMTOFLAT, CRENEWID, FNABONO, CREDID, CRETCALID, '
            +'       TIPDESEID, TMONABR, CRETCALABR, TIPDESABR, TIPCREABR, FORPAGOABR, '
            +'       LISTAABR, CIAID, CREESTID, CREESTADO, CRECOM, CRESEG, CREPOR, CREGADM, '
            +'       CRECOMP, CREMORA, CREMTOCOM, CREMTOSEG, CREMTOPOR, CREMTOGADM, '
            +'       CREMTOCOMP, CREMTOMORA, LISTAID, ASOCODAUX, NRONABO, CIUDID, FLGPAG, '
            +'       ARCHIVOFTP, CREBLOQ, CREBLOQFEC, CREBLOQOBS, CREDIDNABO, CREINFO, '
            +'       CREMTOEXC, AREAID, CREDOCPAG, FLAGVAR, CRECAPCRON, CREINTCRON, '
            +'       CREFLACRON, CREMTOAN, CREAMORTAN, CREINTERESAN, CREFLATAN, FLAGNVINT, '
            +'       DESBLOFEC, USUBLOQ, USUDESBLOQ, NROREFINAN, CREFLGEXC, CREFECEXC, '
            +'       FLGINT, NROOPETMP, FOPERACTMP, FLGDESMAR, USUDESMAR, FECDESMAR, '
            +'       OBSDESMAR, CREMTODEV, CRECAPCON, FLGINCONSIS, CREAPLEXC, TIPNABO, '
            +'       PERPROC, FECPROC, FLGPROC, PERCOB, CREESTIDANT, SALDOSBS, CREANOINI, '
            +'       CREMESINI, CRECUOTAINI, CREFVENINI, CRECUOTAINI2, CREFVENINI2, '
            // Inicio: HPC_201207
            //   +'       CRECUOTAINI3, CREFVENINI3, FLAREP, MONPACDESGRAV '
            +'       CRECUOTAINI3, CREFVENINI3, FLAREP, MONPACDESGRAV '
            // Fin: HPC_201207
            +'  FROM CRE302 '
            +' WHERE ASOID = '+QuotedStr(Trim(DM1.cdsCreditos.FieldByName('ASOID').AsString))
            +'   AND CREDID='+QuotedStr(DM1.cdsCreditos.FieldByName('CREDID').AsString);
     DM1.cdsCuotas.Close;
     DM1.cdsCuotas.DataRequest(xSql);
     DM1.cdsCuotas.Open;
     DM1.cdsCuotas.First;
     xSalAnt:= 0; xSalVen := 0; xCuoVen := 0; xCuoPen := 0;
     xSalDif := 0; xCuoDif := 0;
     xCuoProCob := 0;  xSalProCob := 0; // SE INICIALIZO LAS VARIABLES EN CERO
     xfCalc  := Trim(Copy(DateToStr(DM1.FechaSys),7,4)+Copy(DateToStr(DM1.FechaSys),4,2));
     While Not DM1.cdsCuotas.Eof Do
     Begin
       If (DM1.cdsCuotas.fieldbyname('CREESTID').AsString='02') Or (DM1.cdsCuotas.fieldbyname('CREESTID').AsString='11') Or (DM1.cdsCuotas.fieldbyname('CREESTID').AsString='27') Then
       Begin
         xfVenc:= Trim(DM1.cdsCuotas.fieldbyname('CREANO').AsString + DM1.cdsCuotas.fieldbyname('CREMES').AsString);
         If xfVenc > xfCalc Then
         Begin
           If (Trim(DM1.cdsCuotas.FieldByName('CREFVENINI').AsString) <> '') And (DM1.cdsCuotas.FieldByName('CREFVEN').AsString = DM1.cdsCuotas.FieldByName('CREFVENINI').AsString) Then
           Begin
              // Inicio: HPC_201207
              xSalAnt := xSalAnt + (DM1.cdsCuotas.fieldbyname('CREAMORT').AsCurrency + DM1.cdsCuotas.fieldbyname('CREFLAT').AsCurrency + DM1.cdsCuotas.fieldbyname('MONPACDESGRAV').AsCurrency) - DM1.cdsCuotas.fieldbyname('CREMTOCOB').AsCurrency;
              // xSalAnt := xSalAnt + (DM1.cdsCuotas.fieldbyname('CREAMORT').AsCurrency + DM1.cdsCuotas.fieldbyname('CREFLAT').AsCurrency) - DM1.cdsCuotas.fieldbyname('CREMTOCOB').AsCurrency;
              // Fin: HPC_201207
            xCuoPen := xCuoPen + 1 ;
           End;
         End
         Else
         Begin
           If (Trim(DM1.cdsCuotas.FieldByName('CREFVENINI').AsString) <> '') And (DM1.cdsCuotas.FieldByName('CREFVEN').AsString = DM1.cdsCuotas.FieldByName('CREFVENINI').AsString) Then
           Begin
             xSalVen := xSalVen + (DM1.cdsCuotas.fieldbyname('CREMTO').AsCurrency - DM1.cdsCuotas.fieldbyname('CREMTOCOB').AsCurrency);
             xCuoVen := xCuoVen + 1;
           End;
         End;
       End;
       // Calculando cuotas reprogramadas
       //Inicio: SPP_201401_PRE
       If (DM1.cdsCuotas.FieldByName('CREESTID').AsString = '02') Or (DM1.cdsCuotas.FieldByName('CREESTID').AsString = '11')
       Or (DM1.cdsCuotas.FieldByName('CREESTID').AsString = '14') Or (DM1.cdsCuotas.FieldByName('CREESTID').AsString = '19')
       Or (DM1.cdsCuotas.FieldByName('CREESTID').AsString = '27') Then
          If (Trim(DM1.cdsCuotas.FieldByName('CREFVENINI').AsString) <> '') And (DM1.cdsCuotas.FieldByName('CREFVEN').AsString <> DM1.cdsCuotas.FieldByName('CREFVENINI').AsString) Then
          Begin
             xSalDif := xSalDif + (DM1.cdsCuotas.fieldbyname('CREMTO').AsCurrency - DM1.cdsCuotas.fieldbyname('CREMTOCOB').AsCurrency);
             If DM1.cdsCuotas.fieldbyname('CREMTO').AsCurrency - DM1.cdsCuotas.fieldbyname('CREMTOCOB').AsCurrency > 0 Then xCuoDif := xCuoDif + 1;
          End;
       //Fin: SPP_201401_PRE


       // Inserta Cuotas en Proceso de Cobranza
       // Calculando cuotas en proceso de cobranza
       If (DM1.cdsCuotas.fieldbyname('CREESTID').AsString = '14') Then
       Begin
         xfVenc:= Trim(DM1.cdsCuotas.fieldbyname('CREANO').AsString + DM1.cdsCuotas.fieldbyname('CREMES').AsString);
         If xfVenc > xfCalc Then
         Begin
           If (Trim(DM1.cdsCuotas.FieldByName('CREFVENINI').AsString) <> '') And (DM1.cdsCuotas.FieldByName('CREFVEN').AsString = DM1.cdsCuotas.FieldByName('CREFVENINI').AsString) Then
           Begin
             // Inicio: HPC_201207
             xSalProCob := xSalProCob + (DM1.cdsCuotas.fieldbyname('CREAMORT').AsCurrency + DM1.cdsCuotas.fieldbyname('CREFLAT').AsCurrency + DM1.cdsCuotas.fieldbyname('MONPACDESGRAV').AsCurrency)-DM1.cdsCuotas.fieldbyname('CREMTOCOB').AsCurrency;
             //xSalProCob := xSalProCob + (DM1.cdsCuotas.fieldbyname('CREAMORT').AsCurrency + DM1.cdsCuotas.fieldbyname('CREFLAT').AsCurrency)-DM1.cdsCuotas.fieldbyname('CREMTOCOB').AsCurrency;
             // Fin: HPC_201207
             xCuoProCob := xCuoProCob + 1 ;
           End;
         End
         Else
         Begin
           If (Trim(DM1.cdsCuotas.FieldByName('CREFVENINI').AsString) <> '') And (DM1.cdsCuotas.FieldByName('CREFVEN').AsString = DM1.cdsCuotas.FieldByName('CREFVENINI').AsString) Then
           Begin
             xSalProCob := xSalProCob + (DM1.cdsCuotas.fieldbyname('CREMTO').AsCurrency - DM1.cdsCuotas.fieldbyname('CREMTOCOB').AsCurrency);
             xCuoProCob := xCuoProCob + 1;
           End;
         End;
       End;
       DM1.cdsCuotas.Next;
     End;
     lblSalTot.Caption:= FormatFloat('###,###.00',DM1.SaldoActual(DM1.cdsCreditos.FieldByName('ASOID').AsString,DM1.cdsCreditos.FieldByName('CREDID').AsString ,'0'));
     lblVen.Caption:='('+FormatFloat('###,##0',xCuoVen)+')';
     lblDif.Caption:='('+FormatFloat('###,##0',xCuoDif)+')';
     lblPen.Caption:='('+FormatFloat('###,##0',xCuoPen)+')';
     lblProCob.Caption:='('+FormatFloat('###,##0',xCuoProCob)+')'; // HPC_201004_PRE
     lblTot.Caption:='('+FormatFloat('###,##0',xCuoVen+xCuoPen+xCuoDif+xCuoProCob)+')';
     If DM1.cdsCreditos.FieldByName('FORPAGOID').AsString = '18' Then ppLNota2.Caption := 'POR EL "BANCO DE LA NACION"' Else ppLNota2.Caption := 'POR "PLANILLA DE HABERES"';
     ppLblCuoVen.Caption:=FormatFloat('###,###.00',xSalVen);
     pplblCuoPen.Caption:=FormatFloat('###,###.00',xSalAnt);
     ppLblCuoDif.Caption:=FormatFloat('###,###.00',xSalDif);
     pplblCuoProCob.Caption:=FormatFloat('###,###.00',xSalProCob); // HPC_201004_PRE
     pplblMonPag.Caption:=FormatFloat('###,###.00',xSalVen+xSalAnt+xSalDif+xSalProCob);

     pplblNumCuo.Caption := DM1.cdsCreditos.FieldByName('CRENUMCUO').AsString;

     ppLblCuotas.Caption := '('+CurrToStr(xCuoVen+xCuoPen+xCuoDif+xCuoProCob)+'-Cuotas por Pagar)';

//Inicio: DPP_201207_PRE
     xSql := 'SELECT ASOID,CREDID,CRECUOTA,CREFVEN,CREMTO, CASE WHEN CREFVEN<>CREFVENINI THEN ''(D)'' ELSE NULL END AS REPRO, CREESTID, CREANO, CREMES, '
            +'CASE WHEN NVL(CREMTOCOB,0)=0 THEN NVL(CREAMORT,0)         ELSE NVL(CRECAPITAL,0)     END AS AMORT, '
            +'CASE WHEN NVL(CREMTOCOB,0)=0 THEN NVL(CREINTERES,0)       ELSE NVL(CREMTOINT,0)      END AS INTER, '
            +'CASE WHEN NVL(CREMTOCOB,0)=0 THEN NVL(CREFLAT,0)          ELSE NVL(CREMTOFLAT,0)     END AS GASTO, '
            +'CASE WHEN NVL(CREMTOCOB,0)=0 THEN NVL(MONPACDESGRAV,0)    ELSE NVL(MONCOBDESGRAV,0)  END AS DESGR, '
            +'NVL(CREMTOCOB,0) CREMTOCOB, NVL(CREMTOEXC,0)-NVL(CREAPLEXC,0) CREMTOEXC,CREESTADO, CREFVENINI FROM CRE302 WHERE ASOID='
            +QuotedStr(Trim(DM1.cdsCreditos.FieldByName('ASOID').AsString))+' AND CREDID='+QuotedStr(DM1.cdsCreditos.FieldByName('CREDID').AsString)+' ORDER BY CREDID,CRECUOTA';
//Fin: DPP_201207_PRE
     DM1.cdsCuentas.Close;
     DM1.cdsCuentas.DataRequest(xSql);
     DM1.cdsCuentas.Open;

//Inicio HPC_201606_PRE
//Motivos de Impresión
     FMotivoImpresion := TFMotivoImpresion.Create(Self);
     FMotivoImpresion.ShowModal;
     If Dm1.xopc1='N' Then Exit;
//Final HPC_201606_PRE

     ppREstCta.Print;
     ppREstCta.Stop;
   End;
End;

procedure TfMstCre.FormActivate(Sender: TObject);
Var xCreSdoAct, xCremtoOtor:Double;
begin
  dbgCreditos.Selected.Clear;
  dbgCreditos.Selected.Add('NUMERO'#9'6'#9'Número~Crédito'#9#9);
  dbgCreditos.Selected.Add('CRENUMCUO'#9'3'#9'Número~Cuotas'#9#9);
  dbgCreditos.Selected.Add('CREFOTORG'#9'10'#9'Fecha~Otorgamiento'#9#9);
  dbgCreditos.Selected.Add('TMONABR'#9'3'#9'Moneda'#9#9);
  dbgCreditos.Selected.Add('CREMTOOTOR'#9'9'#9'Monto~Otorgado'#9#9);
  dbgCreditos.Selected.Add('CRESDOACT'#9'9'#9'Saldo~Actual'#9#9);
  dbgCreditos.Selected.Add('TIPCREDES'#9'28'#9'Tipo de~Crédito'#9#9);
  dbgCreditos.Selected.Add('CREESTADO'#9'15'#9'Estado del~Crédito'#9#9);
  dbgCreditos.ApplySelected;
  TNumericField(DM1.cdsCreditos.FieldByName('CREMTOOTOR')).DisplayFormat := '##,##0.00';
  TNumericField(DM1.cdsCreditos.FieldByName('CRESDOACT')).DisplayFormat := '##,##0.00';
  xCreSdoAct := 0;
  xCremtoOtor := 0;
  DM1.cdsCreditos.First;
  While Not DM1.cdsCreditos.Eof Do
  Begin
    xCreSdoAct  := xCreSdoAct  + DM1.cdsCreditos.FieldByName('CRESDOACT').AsFloat;
    xCremtoOtor := xCremtoOtor + DM1.cdsCreditos.FieldByName('CREMTOOTOR').AsFloat;
    DM1.cdsCreditos.Next;
  End;
  DM1.cdsCreditos.First;
  dbgCreditos.ColumnByName('CREFOTORG').FooterValue := 'Totales';
  dbgCreditos.ColumnByName('TMONABR').FooterValue := 'S/.';
  dbgCreditos.ColumnByName('CRESDOACT').FooterValue := FloatToStrF(xCreSdoAct,ffNumber, 10, 2);
  dbgCreditos.ColumnByName('CREMTOOTOR').FooterValue := FloatToStrF(xCremtoOtor,ffNumber, 10, 2);
end;

end.
