// HPP_201004_PRE - SAR-2009-0984
// Se desarrolla nuevo visor del Deudas al FSC
// HPC_201307_PRE   : Se añade logo institucional
// SPP_201401_PRE   : Se realiza el pase a producción a partir del pase HPC_201307_PRE

Unit PRE276;

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, db, Mask, ExtCtrls,
   ToolEdit, CurrEdit, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE, ppParameter, ppVar, ppBands, ppStrtch, ppSubRpt,
   ppCtrls, ppPrnabl, ppCache, jpeg; // SPP_201401_PRE

Type
   TFcuocanfonsol = Class(TForm)
      dbgfonsol: TwwDBGrid;
      btncerrar: TBitBtn;
// inicio HPC_201003_PRE
//      btnImprimir: TBitBtn;
      btnDetFSC: TBitBtn;
// fin HPC_201003_PRE
      ppRepDetCob: TppReport;
      ppHeaderBand1: TppHeaderBand;
//Inicio: SPP_201401_PRE
      // ppLabel21: TppLabel; 
      // ppLabel22: TppLabel; 
//Fin: SPP_201401_PRE
      ppLabel23: TppLabel;
      LblCodMod5: TppLabel;
      ppLabel25: TppLabel;
      ppLabel26: TppLabel;
      lblTipCre2: TppLabel;
      lblNomGen3: TppLabel;
      lblNumPre2: TppLabel;
      ppLabel30: TppLabel;
      lblFecPre2: TppLabel;
      ppLabel32: TppLabel;
      lblUse2: TppLabel;
      ppLabel34: TppLabel;
      ppLabel35: TppLabel;
      ppLabel36: TppLabel;
      ppLabel37: TppLabel;
      ppLabel38: TppLabel;
      ppLabel39: TppLabel;
      ppLabel40: TppLabel;
      ppLabel41: TppLabel;
      lblLugarGenera: TppLabel;
      ppSystemVariable2: TppSystemVariable;
      ppLabel43: TppLabel;
      ppLabel44: TppLabel;
      ppSystemVariable5: TppSystemVariable;
      ppLabel45: TppLabel;
      ppLabel46: TppLabel;
      ppLabel47: TppLabel;
      ppLabel48: TppLabel;
      ppLabel49: TppLabel;
      ppSystemVariable6: TppSystemVariable;
      ppLabel51: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppSubReport1: TppSubReport;
      ppChildReport1: TppChildReport;
      ppTitleBand1: TppTitleBand;
      ppLabel7: TppLabel;
      ppDetailBand2: TppDetailBand;
      ppSummaryBand2: TppSummaryBand;
      ppShape4: TppShape;
      ppLabel29: TppLabel;
      ppLabel31: TppLabel;
      ppLabel33: TppLabel;
      ppLabel42: TppLabel;
      ppLabel53: TppLabel;
      ppLabel56: TppLabel;
      ppLine7: TppLine;
      ppLine8: TppLine;
      ppParameterList2: TppParameterList;
      ppBDE1: TppBDEPipeline;
      ppSubReport2: TppSubReport;
      ppChildReport2: TppChildReport;
      ppDetailBand3: TppDetailBand;
      ppDBText1: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppLabel55: TppLabel;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppDBText13: TppDBText;
      ppDBText2: TppDBText;
      ppDBText14: TppDBText;
      ppSummaryBand3: TppSummaryBand;
      ppShape3: TppShape;
      ppDBCalc1: TppDBCalc;
      ppDBCalc2: TppDBCalc;
      ppDBCalc3: TppDBCalc;
      ppLabel3: TppLabel;
      ppShape2: TppShape;
      ppLabel8: TppLabel;
      ppLabel15: TppLabel;
      ppLabel24: TppLabel;
      ppLabel27: TppLabel;
      ppLabel28: TppLabel;
      ppLabel57: TppLabel;
      ppLabel58: TppLabel;
      ppLabel59: TppLabel;
      ppLabel60: TppLabel;
      ppLabel61: TppLabel;
      ppLabel62: TppLabel;
      ppLabel63: TppLabel;
      ppLabel64: TppLabel;
      ppLine2: TppLine;
      ppLine3: TppLine;
      ppLine9: TppLine;
      ppLine11: TppLine;
      ppLine12: TppLine;
      ppLine14: TppLine;
      ppLabel65: TppLabel;
      ppLabel66: TppLabel;
      ppLabel67: TppLabel;
      ppLabel68: TppLabel;
      ppLabel69: TppLabel;
      ppLabel70: TppLabel;
      ppLine1: TppLine;
      ppSummaryBand1: TppSummaryBand;
      lblUser: TppLabel;
      ppLine4: TppLine;
      ppldeufonsol: TppLabel;
      ppldevfonsol: TppLabel;
      pplsalfonsol: TppLabel;
      pplimpdevfscexc: TppLabel;
      pplexcdev: TppLabel;
      pplexcxdev: TppLabel;
// inicio HPC_201003_PRE
    btnResFSC: TBitBtn;
    ppBDEResFonSol: TppBDEPipeline;
    pprFonSolRes: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand4: TppDetailBand;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
//Inicio: SPP_201401_PRE
    // ppLabel1: TppLabel; 
    // ppLabel2: TppLabel; 
//Fin: SPP_201401_PRE
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppShape1: TppShape;
    ppLabel11: TppLabel;
    ppLabel14: TppLabel;
    ppShape5: TppShape;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppShape6: TppShape;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppShape7: TppShape;
    ppLabel20: TppLabel;
    ppLabel50: TppLabel;
    ppShape8: TppShape;
    ppLabel52: TppLabel;
    ppLabel54: TppLabel;
    ppShape9: TppShape;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppShape10: TppShape;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppShape11: TppShape;
    ppLabel75: TppLabel;
    ppDBText22: TppDBText;
    ppShape12: TppShape;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppLabel76: TppLabel;
    pplimpresopor: TppLabel;
    ppSummaryBand4: TppSummaryBand;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    pplasocodmod: TppLabel;
    pplasoapenomdni: TppLabel;
    pplasotipid: TppLabel;
    ppluseid: TppLabel;
//Inicio: SPP_201401_PRE
    ppImage1: TppImage; 
    ppImage2: TppImage; 
//Fin: SPP_201401_PRE
// fin HPC_201003_PRE
//
      Procedure FormActivate(Sender: TObject);
      Procedure btncerrarClick(Sender: TObject);

// inicio HPC_201003_PRE
{
      Procedure btnImprimirClick(Sender: TObject);
}
      Procedure btnDetFSCClick(Sender: TObject);
    procedure btnResFSCClick(Sender: TObject);
// fin HPC_201003_PRE
   Private
    { Private declarations }
   Public
      xtotcremtocob, xtotcreinteres, xtotcreflat, xtotcreamort: Double;
      monmaxdev: Double;
    { Public declarations }
   End;

Var
   Fcuocanfonsol: TFcuocanfonsol;

Implementation

Uses PREDM;

{$R *.dfm}

Procedure TFcuocanfonsol.FormActivate(Sender: TObject);
Var
   xSql: String;
   xImpAplFsc, xImpCobFsc, xImpSalFsc: Double;
Begin
   dbgfonsol.Selected.clear;
   dbgfonsol.Selected.Add('NUM_DEU'#9'11'#9'Número~Deuda'#9#9);
   dbgfonsol.Selected.Add('NRO_REF_FSC'#9'10'#9'Número~de Acta'#9#9);
   dbgfonsol.Selected.Add('FORPAGODES'#9'30'#9'Forma de~Pago'#9#9);
   dbgfonsol.Selected.Add('FEC_APL_FSC'#9'10'#9'Fecha de~Aplica'#9#9);
   dbgfonsol.Selected.Add('IMP_APL_FSC'#9'10'#9'Importe~Aplicado'#9#9);
   dbgfonsol.Selected.Add('ESTDES'#9'13'#9'Estado'#9#9);
   dbgfonsol.Selected.Add('USU_APL_FSC'#9'15'#9'Usuario que~Aplico'#9#9);
   dbgfonsol.Selected.Add('IMP_COB_FSC'#9'10'#9'Importe~Cobrado'#9#9);
   dbgfonsol.Selected.Add('ULT_FEC_COB'#9'10'#9'Ultima Fecha~Cobranza'#9#9);
   dbgfonsol.Selected.Add('IMP_SAL_FSC'#9'10'#9'Saldo~pendiente'#9#9);
   dbgfonsol.ApplySelected;
   TNumericField(DM1.cdsFonSolCab.Fieldbyname('IMP_APL_FSC')).DisplayFormat := '###,###.#0';
   TNumericField(DM1.cdsFonSolCab.Fieldbyname('IMP_COB_FSC')).DisplayFormat := '###,###.#0';
   TNumericField(DM1.cdsFonSolCab.Fieldbyname('IMP_SAL_FSC')).DisplayFormat := '###,###.#0';
   xImpAplFsc := 0;
   xImpCobFsc := 0;
   xImpSalFsc := 0;
   While Not DM1.cdsFonSolCab.Eof Do
   Begin
      xImpAplFsc := xImpAplFsc + DM1.cdsFonSolCab.FieldByName('IMP_APL_FSC').AsFloat;
      xImpCobFsc := xImpCobFsc + DM1.cdsFonSolCab.FieldByName('IMP_COB_FSC').AsFloat;
      xImpSalFsc := xImpSalFsc + DM1.cdsFonSolCab.FieldByName('IMP_SAL_FSC').AsFloat;
      DM1.cdsFonSolCab.Next;
   End;
   DM1.cdsFonSolCab.First;
   dbgfonsol.ColumnByName('FORPAGODES').FooterValue := 'Totales';
   dbgfonsol.ColumnByName('FEC_APL_FSC').FooterValue := 'S/.';
   dbgfonsol.ColumnByName('IMP_APL_FSC').FooterValue := FloatToStrF(xImpAplFsc, ffNumber, 10, 2);
   dbgfonsol.ColumnByName('IMP_COB_FSC').FooterValue := FloatToStrF(xImpCobFsc, ffNumber, 10, 2);
   dbgfonsol.ColumnByName('IMP_SAL_FSC').FooterValue := FloatToStrF(xImpSalFsc, ffNumber, 10, 2);
End;

Procedure TFcuocanfonsol.btncerrarClick(Sender: TObject);
Begin
   Fcuocanfonsol.Close;
End;

// inicio HPC_201003_PRE
//Procedure TFcuocanfonsol.btnImprimirClick(Sender: TObject);
// fin HPC_201003_PRE
Procedure TFcuocanfonsol.btnDetFSCClick(Sender: TObject);
Var
   xSql: String;
Begin
   xSql := 'SELECT ASOID, NUM_DEU, COR_COB_DEU, TIP_MOV_DEU, IMP_COB_DEU, USU_COB_DEU, FEC_COB_DEU, HOR_COB_DEU, '
          +'       BANCOID, CCBCOID, '
          +'       CASE WHEN NVL(IMP_EXC_DEV,0)>0 THEN IMP_EXC_DEV END DEVOLUCION, '
          +'       CASE WHEN NVL(IMP_EXC_APL,0)>0 THEN IMP_EXC_APL END APLICACION, '
          +'       CASE WHEN NVL(IMP_EXC_DEV,0)=0 THEN IMP_COB_DEU END COBRADO, '
          +'       NROOPE, FOPERAC, AREAID, FORPAGID, FORPAGABR, EST_COB_COD, EST_COB_DES, '
          +'       OFI_CREACION, ANO_COB, MES_COB, FEC_CRE_COB_FSC, '
          +'       IMP_EXC_DEV, IMP_EXC_APL, IMP_EXC_DEV, NUM_DEV_EXC, OBS_COB_DEU, OFDESNOM '
          +'FROM COB_FSC_PAGOS_AL_FSC A, APO110 B '
          +'WHERE ASOID = ' + QuotedStr(DM1.cdsFonSolCab.FieldByName('ASOID').AsString)
          +'  AND NUM_DEU = ' + QuotedStr(DM1.cdsFonSolCab.FieldByName('NUM_DEU').AsString)
          +'  AND OFI_CREACION = OFDESID(+) '
// inicio HPP_201005_PRE
// no se muestran los anulados
          +'  AND EST_COB_COD NOT IN (''04'',''13'') '
// fin HPP_201005_PRE
          +'ORDER BY COR_COB_DEU';
   DM1.cdsFonSolDet.Close;
   DM1.cdsFonSolDet.DataRequest(xsql);
   DM1.cdsFonSolDet.Open;
   lblNumPre2.Caption := DM1.cdsFonSolCab.FieldByname('NUM_DEU').AsString;
   lblFecPre2.Caption := DM1.cdsFonSolCab.FieldByname('FEC_APL_FSC').AsString;
   xSql := 'SELECT NUM_DEU, FEC_APL_FSC, FORPAGID, OFI_CREACION, IMP_APL_FSC, IMP_COB_FSC, IMP_EXC_DEU, IMP_EXC_DEV '
          +'FROM COB_FSC_DEUDA_FSC_CAB '
          +'WHERE ASOID = ' + QuotedStr(DM1.cdsFonSolCab.FieldByName('ASOID').AsString)
          +'  AND NUM_DEU = ' + QuotedStr(DM1.cdsFonSolCab.FieldByName('NUM_DEU').AsString);
   DM1.cdsQry2.Close;
   DM1.cdsQry2.DataRequest(xSql);
   DM1.cdsQry2.Open;
   ppldeufonsol.Caption := FloatToStrF(DM1.cdsQry2.FieldByName('IMP_APL_FSC').AsFloat, ffNumber, 10, 2);
   ppldevfonsol.Caption := FloatToStrF(DM1.cdsQry2.FieldByName('IMP_COB_FSC').AsFloat, ffNumber, 10, 2);
   pplsalfonsol.Caption := FloatToStrF(DM1.cdsQry2.FieldByName('IMP_APL_FSC').AsFloat
                                    - DM1.cdsQry2.FieldByName('IMP_COB_FSC').AsFloat, ffNumber, 10, 2);
   pplimpdevfscexc.Caption := FloatToStrF(DM1.cdsQry2.FieldByName('IMP_EXC_DEU').AsFloat, ffNumber, 10, 2);
   pplexcdev.Caption := FloatToStrF(DM1.cdsQry2.FieldByName('IMP_EXC_DEV').AsFloat, ffNumber, 10, 2);
   pplexcxdev.Caption := FloatToStrF(DM1.cdsQry2.FieldByName('IMP_EXC_DEU').AsFloat
                                    - DM1.cdsQry2.FieldByName('IMP_EXC_DEV').AsFloat, ffNumber, 10, 2);
   lblUser.Caption := 'Impreso por : ' + DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
   LblCodMod5.Caption := DM1.cdsAsociado.FieldByName('ASOCODMOD').AsString;
   lblNomGen3.Caption := DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString;
   lblNumPre2.Caption := DM1.cdsFonSolCab.FieldByName('NUM_DEU').AsString;
   lblFecPre2.Caption := DM1.cdsFonSolCab.FieldByName('FEC_APL_FSC').AsString;
   lblTipCre2.Caption := DM1.cdsFonSolCab.FieldByName('FORPAGODES').AsString;
   lblLugarGenera.Caption := DM1.DevuelveValor('APO110', 'OFDESNOM', 'OFDESID',
                                                DM1.cdsFonSolCab.FieldByName('OFI_CREACION').AsString);
   lblUse2.Caption := DM1.cdsAsociado.FieldByName('USEID').AsString;
   ppRepDetCob.Print;
End;

// inicio HPC_201003_PRE
// INICIO: HTC_SAR-984_EPS II
// REPORTE DE RESUMEN DE PAGOS AL FSC
procedure TFcuocanfonsol.btnResFSCClick(Sender: TObject);
begin
   pplasocodmod.Caption   := DM1.cdsAsociado.FieldByName('ASOCODMOD').AsString;
   pplasoapenomdni.Caption := DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString;
   pplasotipid.Caption     := DM1.cdsAsociado.FieldByName('ASOTIPID').AsString;
   ppluseid.Caption         := DM1.cdsAsociado.FieldByName('USEID').AsString;
   pplimpresopor.Caption :=  'Impreso por : '+DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
   pprFonSolRes.Print;
end;
// SE CREA EL COMPONTE REPORT (pprFonSolRes)
// SE AÑADE EL BOTON Resumen FSC
// FIN: HTC_SAR-984_EPS II
// fin HPC_201003_PRE

End.

