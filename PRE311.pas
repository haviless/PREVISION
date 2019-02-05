// HPC_201307_PRE   : Se añade imagen del logo institucional
// SPP_201401_PRE   : Se realiza el pase a producción a partir del pase HPC_201307_PRE

Unit PRE311;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Mask, wwdbedit, fcButton,
  fcImgBtn, fcShapeBtn, Buttons, wwdblook, Wwdbdlg, ExtCtrls,
  wwdbdatetimepicker, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd,
  ppClass, ppReport, ppPrnabl, ppCtrls, ppBands, ppCache, ppVar, ppStrtch,
  ppSubRpt, ppChrt, ppParameter, ComCtrls, jpeg; // SPP_201401_PRE

Type
  TFManReclamos = class(TForm)
    dbgReclamos: TwwDBGrid;
    dbgReclamosIButton: TwwIButton;
    PnlAnadeReclamo: TPanel;
    dbeRecDni: TwwDBEdit;
    dbeRecApeNom: TwwDBEdit;
    dblcdTipDecIde: TwwDBLookupComboDlg;
    StaticText2: TStaticText;
    memDescription: TMemo;
    lblMonto: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtRecDes: TEdit;
    dbdtpFecRec: TwwDBDateTimePicker;
    Label4: TLabel;
    pnlResReclamo: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    StaticText3: TStaticText;
    edtDni: TEdit;
    edtApeNom: TEdit;
    edtTipRec: TEdit;
    edtFecRec: TEdit;
    Label8: TLabel;
    edtUsuRecRec: TEdit;
    dbddtpConclusion: TwwDBDateTimePicker;
    dblcdConclusion: TwwDBLookupComboDlg;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    memConclusion: TMemo;
    edtDesConRec: TEdit;
    pnlSeguimiento: TPanel;
    StaticText4: TStaticText;
    dbgsegrec: TwwDBGrid;
    wwDBGrid1IButton: TwwIButton;
    gbDetalle: TGroupBox;
    Label20: TLabel;
    memDetalle: TMemo;
    pnlImpresion: TPanel;
    StaticText5: TStaticText;
    bdeReportes: TppBDEPipeline;
    pprRecRec: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppShape3: TppShape;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    // ppLabel21: TppLabel; SPP_201401_PRE
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppLabel24: TppLabel;
    ppFechas: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppDBCalc8: TppDBCalc;
    pprRecPen: TppReport;
    pprRecCon: TppReport;
    ppHeaderBand1: TppHeaderBand;
    // ppLabel1: TppLabel; SPP_201401_PRE
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel8: TppLabel;
    ppLabel10: TppLabel;
    pplblFechas: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppHeaderBand3: TppHeaderBand;
    ppDetailBand3: TppDetailBand;
    ppShape6: TppShape;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    // ppLabel35: TppLabel; SPP_201401_PRE
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppSummaryBand3: TppSummaryBand;
    Label15: TLabel;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand4: TppDetailBand;
    ppLabel40: TppLabel;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    bdepTipRec: TppBDEPipeline;
    ppLine7: TppLine;
    ppSummaryBand4: TppSummaryBand;
    ppLine8: TppLine;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppDetailBand5: TppDetailBand;
    ppSummaryBand5: TppSummaryBand;
    ppLabel41: TppLabel;
    ppLine9: TppLine;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppLine10: TppLine;
    btnseguimiento: TBitBtn;
    btnimprime: TBitBtn;
    btncierracheque: TBitBtn;
    btncerrar04: TBitBtn;
    btncerrar03: TBitBtn;
    btngrabar: TBitBtn;
    GroupBox1: TGroupBox;
    Label13: TLabel;
    dbdtpInicio: TwwDBDateTimePicker;
    Label14: TLabel;
    dbdtpFinal: TwwDBDateTimePicker;
    btnimprime02: TBitBtn;
    btncerrar02: TBitBtn;
    rgTipRep: TRadioGroup;
    btngrabar02: TBitBtn;
    btncerrar05: TBitBtn;
    btngraba05: TBitBtn;
    btncerrar06: TBitBtn;
    pprrecsd: TppReport;
    ppParameterList1: TppParameterList;
    ppHeaderBand4: TppHeaderBand;
    ppltitulo01: TppLabel;
    ppltitulofecha: TppLabel;
    ppDetailBand6: TppDetailBand;
    ppLabel42: TppLabel;
    ppLine11: TppLine;
    ppLabel43: TppLabel;
    ppLine12: TppLine;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    ppSystemVariable9: TppSystemVariable;
//Inicio: SPP_201401_PRE
    // ppLabel47: TppLabel; 
    // ppLabel48: TppLabel; 
//Fin: SPP_201401_PRE
    pplimpresopor01: TppLabel;
    pnlobservacion: TPanel;
    StaticText1: TStaticText;
    redit: TRichEdit;
    GroupBox2: TGroupBox;
    rgbusca: TRadioGroup;
    mebusca: TMaskEdit;
    btnBuscar: TBitBtn;
    ppShape8: TppShape;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppShape5: TppShape;
    pplimpresopor: TppLabel;
    ppLabel7: TppLabel;
    ppLabel9: TppLabel;
    ppDBText22: TppDBText;
    ppDBCalc15: TppDBCalc;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppDBText23: TppDBText;
    ppDBCalc16: TppDBCalc;
//Inicio: SPP_201401_PRE
    ppImage1: TppImage;  
    ppImage2: TppImage;  
    ppImage3: TppImage;  
    ppImage4: TppImage;  
//Fin: SPP_201401_PRE
    procedure FormActivate(Sender: TObject);
    procedure dbgReclamosIButtonClick(Sender: TObject);
    procedure dblcdTipDecIdeExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbgReclamosDblClick(Sender: TObject);
    procedure dblcdConclusionExit(Sender: TObject);
    procedure wwDBGrid1IButtonClick(Sender: TObject);
    procedure dbeRecDniExit(Sender: TObject);
    procedure btncierrachequeClick(Sender: TObject);
    procedure btnimprimeClick(Sender: TObject);
    procedure btnseguimientoClick(Sender: TObject);
    procedure btnimprime02Click(Sender: TObject);
    procedure btncerrar02Click(Sender: TObject);
    procedure btncerrar04Click(Sender: TObject);
    procedure btncerrar03Click(Sender: TObject);
    procedure btngrabarClick(Sender: TObject);
    procedure btngrabar02Click(Sender: TObject);
    procedure btncerrar05Click(Sender: TObject);
    procedure btngraba05Click(Sender: TObject);
    procedure btncerrar06Click(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Var
  FManReclamos: TFManReclamos;

Implementation

Uses PREDM;

{$R *.dfm}

Procedure TFManReclamos.FormActivate(Sender: TObject);
Var
  xSql:String;
Begin
  xSql := 'SELECT ID_TIPCON, DES_TIPCON FROM TGE312 WHERE VISUALIZA = ''S''';
  DM1.cdsQry7.Close;
  DM1.cdsQry7.DataRequest(xSql);
  DM1.cdsQry7.Open;

  xSql := ' SELECT A.RECIDE, A.RECDNI, A.RECAPENOM, B.REC_BRE, B.REC_DESC, A.RECDESC, A.RECFECREC, A.RECRECUSU,'
  +' A.RECCONC, C.DES_TIPCON, A.RECAREA FROM TGE310 A, TGE311 B, TGE312 C'
  +' WHERE A.RECAREA = '+QuotedStr(DM1.wModulo)+' AND A.RECAREA = B.ID_AREA AND A.RECTIPIDE = B.ID_RECLAMO'
  +' AND A.RECCONC = C.ID_TIPCON(+) ORDER BY A.RECIDE';
  DM1.cdsReclamos.Close;
  DM1.cdsReclamos.DataRequest(xSql);
  DM1.cdsReclamos.Open;
  dbgReclamos.ColumnByName('RECIDE').FooterValue := IntToStr(DM1.cdsReclamos.RecordCount);

  xSql := 'SELECT ID_RECLAMO, REC_DESC, REC_BRE FROM TGE311 WHERE ID_AREA = '+QuotedStr(DM1.wModulo);
  DM1.cdsQry2.Close;
  DM1.cdsQry2.DataRequest(xSql);
  DM1.cdsQry2.Open;

  pnlAnadeReclamo.Visible := False;
  pnlResReclamo.Visible := False;
  pnlSeguimiento.Visible := False;
  pnlImpresion.Visible := False;
  dbgReclamos.Enabled := True;
  dbdtpFecRec.Date := Date;
  dbgReclamos.Selected.Clear;
  dbgReclamos.Selected.Add('RECIDE'#9'8'#9'Número~de reclamo');
  dbgReclamos.Selected.Add('RECDNI'#9'8'#9'DNI del~reclamante');
  dbgReclamos.Selected.Add('RECAPENOM'#9'54'#9'Apellidos y nombre(s)~del reclamante');
  dbgReclamos.Selected.Add('REC_BRE'#9'25'#9'Tipo~de reclamo');
  dbgReclamos.Selected.Add('DES_TIPCON'#9'20'#9'Estado del~reclamo');
  dbgReclamos.Selected.Add('RECFECREC'#9'10'#9'Fecha de~recepción');
  dbgReclamos.Selected.Add('RECDESC'#9'70'#9'Detalle del~reclamo');
  dbgReclamos.ApplySelected;
End;

Procedure TFManReclamos.dbgReclamosIButtonClick(Sender: TObject);
Begin
  PnlAnadeReclamo.Visible := True;
  dbeRecDni.Text := '';
  dbeRecApeNom.Text := '';
  memDescription.Text := '';
  dblcdTipDecIde.Text := '';
  dbeRecDni.SetFocus;
  PnlAnadeReclamo.Top    := 88;
  PnlAnadeReclamo.Left   := 40;
  dbgReclamos.Enabled := False;
  dblcdTipDecIde.LookupTable := DM1.cdsQry2;
  dblcdTipDecIde.LookupField := 'ID_RECLAMO';
  dblcdTipDecIde.Selected.Clear;
  dblcdTipDecIde.Selected.Add('ID_RECLAMO'#9'3'#9'Código'#9#9);
  dblcdTipDecIde.Selected.Add('REC_DESC'#9'35'#9'Descripción'#9#9);
End;

Procedure TFManReclamos.dblcdTipDecIdeExit(Sender: TObject);
Var xWhere:String;
Begin
  xWhere := 'ID_RECLAMO ='+QuotedStr(dblcdTipDecIde.Text)+' AND ID_AREA = '+QuotedStr(DM1.wModulo);
  edtRecDes.Text := DM1.DisplayDescrip('prvSQL', 'TGE311', 'REC_DESC', xWhere, 'REC_DESC');
  If (edtRecDes.Text = '') And (dblcdTipDecIde.Text <> '') Then
  Begin
    MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
    dblcdTipDecIde.SetFocus;
  End;
End;

Procedure TFManReclamos.FormKeyPress(Sender: TObject; var Key: Char);
Begin
   If Key = #13 Then
    begin
     Key := #0;
     Perform(CM_DIALOGKEY, VK_TAB, 0);
    end;
End;

Procedure TFManReclamos.dbgReclamosDblClick(Sender: TObject);
Begin
  If DM1.cdsReclamos.RecordCount = 0 Then
     MessageDlg(' No Existen Registros ', mtInformation, [mbOk], 0)
  Else
  Begin
     If DM1.cdsReclamos.FieldByName('RECCONC').AsString = '04' Then
     Begin
       dblcdConclusion.Text := '';
       dbddtpConclusion.Text := '';
       memConclusion.Lines.Text := '';
       edtDesConRec.Text := '';
       pnlResReclamo.Top    := 88;
       pnlResReclamo.Left   := 40;
       pnlResReclamo.Visible  := True;
       dbgReclamos.Enabled := False;
       edtDni.Text    := DM1.cdsReclamos.FieldByName('RECDNI').AsString;
       edtApeNom.Text := DM1.cdsReclamos.FieldByName('RECAPENOM').AsString;
       edtTipRec.Text := DM1.cdsReclamos.FieldByName('REC_DESC').AsString;
       edtFecRec.Text := DM1.cdsReclamos.FieldByName('RECFECREC').AsString;
       edtUsuRecRec.Text := DM1.cdsReclamos.FieldByName('RECRECUSU').AsString;
       dbddtpConclusion.Date := Date;
       dblcdConclusion.SetFocus;
     End
     Else
     Begin
       MessageDlg('Reclamo ya conluido', mtInformation, [mbOk], 0);
       Exit;
     End;
  End;
End;

Procedure TFManReclamos.dblcdConclusionExit(Sender: TObject);
Var xWhere:String;
Begin
  xWhere := 'ID_TIPCON ='+QuotedStr(dblcdConclusion.Text);
  edtDesConRec.Text := DM1.DisplayDescrip('prvSQL', 'TGE312', 'DES_TIPCON', xWhere, 'DES_TIPCON');
  If (edtDesConRec.Text = '') And (dblcdConclusion.Text <> '') Then
  Begin
    MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
    dblcdConclusion.SetFocus;
  End;
End;

Procedure TFManReclamos.wwDBGrid1IButtonClick(Sender: TObject);
Begin
  If DM1.cdsReclamos.FieldByName('RECCONC').AsString <> '04' Then
     MessageDlg(' Reclamo ya Concluido ', mtInformation, [mbOk], 0)
  Else
  Begin
     gbDetalle.Visible := True;
     memDetalle.Lines.Text := '';
     memDetalle.SetFocus;
  End;
End;

procedure TFManReclamos.dbeRecDniExit(Sender: TObject);
Var xSql:String;
begin
  xSql := 'SELECT * FROM APO201 WHERE ASODNI = '+QuotedStr(dbeRecDni.text);
  DM1.cdsQry4.Close;
  DM1.cdsQry4.DataRequest(xSql);
  DM1.cdsQry4.Open;
  If DM1.cdsQry4.RecordCount <> 0 Then
  Begin
    dbeRecApeNom.Text := DM1.cdsQry4.FieldByName('ASOAPENOM').AsString;
    dbeRecApeNom.Enabled := False;
    dblcdTipDecIde.SetFocus;
  End
  Else
  Begin
    dbeRecApeNom.Text := '';
    dbeRecApeNom.Enabled := True;
    dbeRecApeNom.SetFocus;
  End;
End;


procedure TFManReclamos.btncierrachequeClick(Sender: TObject);
begin
  FManReclamos.Close;
end;


procedure TFManReclamos.btnimprimeClick(Sender: TObject);
begin
  dbgReclamos.Enabled := False;
  pnlImpresion.Visible := True;
  pnlImpresion.Top := 88;
  pnlImpresion.Left := 40;
  dbdtpInicio.SetFocus;
end;

procedure TFManReclamos.btnseguimientoClick(Sender: TObject);
Var xSql:String;
begin
  dbgsegrec.Selected.Clear;
  dbgsegrec.Selected.Add('SEGDESC'#9'76'#9'Descipción del~seguimiento'#9#9);
  dbgsegrec.Selected.Add('SEGUSU'#9'10'#9'Usuario que~registro'#9#9);
  dbgsegrec.Selected.Add('SEGFREG'#9'10'#9'Fecha de~registro'#9#9);
  dbgsegrec.ApplySelected;
  xSql := ' SELECT SUBSTR(SEGDESC,1,70) SEGDESC, SEGUSU, SEGFREG, RECAREA, RECIDE'
  +' FROM TGE313 WHERE RECAREA = '+QuotedStr(DM1.cdsReclamos.FieldByName('RECAREA').AsString)
  +' AND RECIDE = '+QuotedStr(DM1.cdsReclamos.FieldByName('RECIDE').AsString);
  DM1.cdsQry4.Close;
  DM1.cdsQry4.DataRequest(xSql);
  DM1.cdsQry4.Open;
  pnlSeguimiento.Top := 88;
  pnlSeguimiento.Left := 40;
  pnlSeguimiento.Visible := True;
  gbDetalle.Visible := False;
  // Llenando la caja de seguimiento
  redit.Lines.Clear;
  DM1.cdsQry4.First;
  While Not DM1.cdsQry4.Eof Do
  Begin
    redit.Lines.Text := redit.Lines.Text + DM1.cdsQry4.FieldByName('SEGDESC').AsString+#13#13;
    DM1.cdsQry4.Next;
  End;

end;

Procedure TFManReclamos.btnimprime02Click(Sender: TObject);
Var xSql:String;
Begin
Case  rgTipRep.ItemIndex Of
  0:
  Begin
    xSql := ' SELECT RECFECREC, SUM(DECODE(RECTIPIDE, ''001'',1,0)) R_001,'
           +' SUM(DECODE(RECTIPIDE, ''002'',1,0)) R_002, SUM(DECODE(RECTIPIDE, ''003'',1,0)) R_003, SUM(DECODE(RECTIPIDE, ''004'',1,0)) R_004,'
           +' SUM(DECODE(RECTIPIDE, ''005'',1,0)) R_005,'
           +' SUM(DECODE(RECTIPIDE, ''001'',1,0)+DECODE(RECTIPIDE, ''002'',1,0)+DECODE(RECTIPIDE, ''003'',1,0)+DECODE(RECTIPIDE, ''004'',1,0)+DECODE(RECTIPIDE, ''005'',1,0)) TOTAL'
           +' FROM TGE310'
           +' WHERE RECFECREC >= '+QuotedStr(dbdtpInicio.Text)
           +' AND RECFECREC <= '+QuotedStr(dbdtpFinal.Text)
           +' GROUP BY RECFECREC';
    DM1.cdsQry10.Close;
    DM1.cdsQry10.DataRequest(xSql);
    DM1.cdsQry10.Open;
    If DM1.cdsQry10.RecordCount = 0 Then
    Begin
      DM1.cdsQry10.Edit;
      DM1.cdsQry10.FieldByName('R_001').AsString := '';
      DM1.cdsQry10.Post;
      ppltitulo01.Caption     := 'NUMERO DE RECLAMOS RECIBIDOS SEGUN FECHA DE RECLAMO';
      ppltitulofecha.Caption  := ' DEL '+dbdtpInicio.Text+' AL '+dbdtpFinal.Text;
      pplimpresopor01.Caption := 'Impreso por : '+DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
      pprrecsd.Print;
      pprrecsd.Stop;
    End
    Else
    Begin
      ppFechas.Caption := ' DEL '+dbdtpInicio.Text+' AL '+dbdtpFinal.Text;
      pprRecRec.Print;
      pprRecRec.Stop;
    End;
  End;
  1:
  Begin
    DM1.cdsQry10.Close;
    xSql := ' SELECT RECFECREC, SUM(DECODE(RECTIPIDE, ''001'',1,0)) R_001,'
             +' SUM(DECODE(RECTIPIDE, ''002'',1,0)) R_002, SUM(DECODE(RECTIPIDE, ''003'',1,0)) R_003,  SUM(DECODE(RECTIPIDE, ''004'',1,0)) R_004,'
             +' SUM(DECODE(RECTIPIDE, ''005'',1,0)) R_005,'
             +' SUM(DECODE(RECTIPIDE, ''001'',1,0)+DECODE(RECTIPIDE, ''002'',1,0)+DECODE(RECTIPIDE, ''003'',1,0)+DECODE(RECTIPIDE, ''004'',1,0)+DECODE(RECTIPIDE, ''005'',1,0)) TOTAL'
             +' FROM TGE310'
             +' WHERE RECFECREC >= '+QuotedStr(dbdtpInicio.Text)
             +' AND RECFECREC <= '+QuotedStr(dbdtpFinal.Text)
             +' AND RECCONC = '+QuotedStr('04')
             +' GROUP BY RECFECREC';
    DM1.cdsQry10.DataRequest(xSql);
    DM1.cdsQry10.Open;
    If DM1.cdsQry10.RecordCount = 0 Then
    Begin
      DM1.cdsQry10.Edit;
      DM1.cdsQry10.FieldByName('R_001').AsString := '';
      DM1.cdsQry10.Post;
      ppltitulo01.Caption     := 'NUMERO DE RECLAMOS PENDIENTES SEGUN FECHA DE RECLAMO';
      ppltitulofecha.Caption  := ' DEL '+dbdtpInicio.Text+' AL '+dbdtpFinal.Text;
      pplimpresopor01.Caption := 'Impreso por : '+DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
      pprrecsd.Print;
      pprrecsd.Stop;
    End
    Else
    Begin
      ppLabel39.Caption := 'DEL '+dbdtpInicio.Text+' AL '+dbdtpFinal.Text;
      pprRecPen.Print;
      pprRecPen.Stop;
    End;
  End;
  2: // RECLAMOS CONCLUÍDOS
  Begin
    DM1.cdsQry10.Close;
    xSql := 'SELECT FRECFECCON-RECFECREC DIAS, SUM(DECODE(RECCONC,''01'',1,0)) FAVOR, SUM(DECODE(RECCONC,''02'',1,0)+DECODE(RECCONC,''03'',1,0)) CONTRA,'
    +' SUM(DECODE(RECCONC,''01'',1,0)+DECODE(RECCONC,''02'',1,0)+DECODE(RECCONC,''03'',1,0)) TOTAL'
    +' FROM TGE310 WHERE  NVL(RECCONC,''00'') IN (''01'',''02'',''03'') AND FRECFECCON >= '+QuotedStr(dbdtpInicio.Text)
    +' AND FRECFECCON <= '+QuotedStr(dbdtpFinal.Text)+' GROUP BY FRECFECCON-RECFECREC';
    DM1.cdsQry10.DataRequest(xSql);
    DM1.cdsQry10.Open;
    If DM1.cdsQry10.RecordCount = 0 Then
    Begin
      DM1.cdsQry10.Edit;
      DM1.cdsQry10.FieldByName('FAVOR').AsString := '';
      DM1.cdsQry10.Post;
      ppltitulo01.Caption     := 'NUMERO DE RECLAMOS CONCLUIDOS SEGUN FECHA DE CONCLUSION';
      ppltitulofecha.Caption  := 'DEL '+dbdtpInicio.Text+' AL '+dbdtpFinal.Text;
      pplimpresopor.Caption   := 'Impreso por : '+DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
      pprrecsd.Print;
      pprrecsd.Stop;
    End
    Else
    {
    Begin
      If DM1.cdsQry10.FieldByName('TOTAL').AsFloat = 0 Then
      Begin
        DM1.cdsQry10.Edit;
        DM1.cdsQry10.FieldByName('FAVOR').AsString := '';
        DM1.cdsQry10.Post;
        ppltitulo01.Caption     := 'NUMERO DE RECLAMOS CONCLUIDOS SEGUN FECHA DE CONCLUSION';
        ppltitulofecha.Caption  := ' DEL '+dbdtpInicio.Text+' AL '+dbdtpFinal.Text;
        pplimpresopor01.Caption := 'Impreso por : '+DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
        pprrecsd.Print;
        pprrecsd.Stop;
      End
      Else
     }
    Begin
      pplblFechas.Caption := 'DEL '+dbdtpInicio.Text+' AL '+dbdtpFinal.Text;
      pprRecCon.Print;
      pprRecCon.Stop;
    End;
  End;
End;
end;

procedure TFManReclamos.btncerrar02Click(Sender: TObject);
begin
  pnlImpresion.Visible := False;
  dbgReclamos.Enabled := True;
end;

procedure TFManReclamos.btncerrar04Click(Sender: TObject);
begin
  gbDetalle.Visible := False;
end;

procedure TFManReclamos.btncerrar03Click(Sender: TObject);
begin
   pnlSeguimiento.Visible := False;
end;

procedure TFManReclamos.btngrabarClick(Sender: TObject);
begin
  If Trim(memDetalle.Text) = '' Then
  Begin
    MessageDlg('Ingrese un comentario al seguimiento', mtInformation, [mbOk], 0);
    memDetalle.SetFocus;
    Exit;
  End;
  If MessageDlg('¿ Añadir detalle ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
  Begin
    gbDetalle.Visible := False;
    DM1.cdsQry4.Append;
    DM1.cdsQry4.FieldByName('RECAREA').AsString := DM1.cdsReclamos.FieldByName('RECAREA').AsString;
    DM1.cdsQry4.FieldByName('RECIDE').AsString := DM1.cdsReclamos.FieldByName('RECIDE').AsString;
    DM1.cdsQry4.FieldByName('SEGDESC').AsString := memDetalle.Lines.Text;
    DM1.cdsQry4.FieldByName('SEGUSU').AsString  := DM1.wUsuario;
    DM1.cdsQry4.FieldByName('SEGFREG').AsString := datetostr(Date)+TimeToStr(time);
    DM1.cdsQry4.ApplyUpdates(0);
  End;
  // Llenando la caja de seguimiento
  redit.Lines.Clear;
  DM1.cdsQry4.First;
  While Not DM1.cdsQry4.Eof Do
  Begin
    redit.Lines.Text := redit.Lines.Text + DM1.cdsQry4.FieldByName('SEGDESC').AsString+#13#13;
    DM1.cdsQry4.Next;
  End;
end;

procedure TFManReclamos.btngrabar02Click(Sender: TObject);
Var xSql, xIde :String;
begin
  If Trim(dbeRecDni.Text) = '' Then
  Begin
    MessageDlg('Registre el D.N.I.', mtInformation, [mbOk], 0);
    dbeRecDni.SetFocus;
    Exit;
  End;
  If Trim(dbeRecApeNom.Text) = '' Then
  Begin
    MessageDlg('Registre el Nombre de la Persona que Reclama', mtInformation, [mbOk], 0);
    dbeRecApeNom.SetFocus;
    exit;
  End;
  If Trim(dblcdTipDecIde.Text) = '' Then
  Begin
    MessageDlg('Registre el Tipo de Reclamo', mtInformation, [mbOk], 0);
    dblcdTipDecIde.SetFocus;
    Exit;
  End;
  If Trim(dbdtpFecRec.Text) = '' Then
  Begin
    MessageDlg('Registre Fecha de Recepción del Reclamo', mtInformation, [mbOk], 0);
    dbdtpFecRec.SetFocus;
    Exit;
  End;
  If Trim(memDescription.Text) = '' Then
  Begin
    MessageDlg('Ingrese un comentario del reclamo', mtInformation, [mbOk], 0);
    memDescription.SetFocus;
    Exit;
  End;
  If MessageDlg('¿ Desea Añadir Reclamo ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
  Begin
    PnlAnadeReclamo.Visible := False;
    DM1.cdsQry.Close;
    xSql := 'SELECT LPAD(MAX(RECIDE)+1,6,''0'') IDE FROM TGE310 WHERE RECAREA = '+QuotedStr(DM1.wModulo);
    DM1.cdsQry.DataRequest(xSql);
    DM1.cdsQry.Open;
    If DM1.cdsQry.FieldByName('IDE').AsString = '' Then xIde := '000001' Else xIde := DM1.cdsQry.FieldByName('IDE').AsString;
    xSql := ' SELECT * FROM TGE310';
    DM1.cdsReporte.Close;
    DM1.cdsReporte.DataRequest(xSql);
    DM1.cdsReporte.Open;
    DM1.cdsReporte.Insert;
    DM1.cdsReporte.FieldByName('RECIDE').AsString    := xIde;
    DM1.cdsReporte.FieldByName('RECAREA').AsString   := DM1.wModulo;
    DM1.cdsReporte.FieldByName('RECDNI').AsString    := dbeRecDni.Text;
    DM1.cdsReporte.FieldByName('RECAPENOM').AsString := dbeRecApeNom.Text;
    DM1.cdsReporte.FieldByName('RECTIPIDE').AsString := dblcdTipDecIde.Text;
    DM1.cdsReporte.FieldByName('RECDESC').AsString   := Copy(Trim(memDescription.Lines.Text),1,100);
    DM1.cdsReporte.FieldByName('RECRECUSU').AsString := DM1.wUsuario;
    DM1.cdsReporte.FieldByName('RECFECREC').AsString := dbdtpFecRec.Text;
    DM1.cdsReporte.FieldByName('FREGREC').AsString := datetostr(Date)+TimeToStr(time);
    DM1.cdsReporte.FieldByName('RECCONC').AsString := '04';
    DM1.cdsReporte.ApplyUpdates(0);
    xSql :=  ' SELECT A.RECIDE, A.RECDNI, A.RECAPENOM, B.REC_BRE, B.REC_DESC, A.RECDESC, A.RECFECREC, A.RECRECUSU,'
    +' A.RECCONC,  C.DES_TIPCON, A.RECAREA '
    +' FROM TGE310 A, TGE311 B, TGE312 C'
    +' WHERE RECAREA = '+QuotedStr(DM1.wModulo)
    +' AND A.RECAREA = B.ID_AREA AND A.RECTIPIDE = B.ID_RECLAMO'
    +' AND A.RECCONC = C.ID_TIPCON(+)'
    +' ORDER BY A.RECIDE';
    DM1.cdsReclamos.Close;
    DM1.cdsReclamos.DataRequest(xSql);
    DM1.cdsReclamos.Open;
  End;
  dbgReclamos.Enabled := True;
End;


procedure TFManReclamos.btncerrar05Click(Sender: TObject);
begin
  dbgReclamos.Enabled := True;
  PnlAnadeReclamo.Visible := False;
end;

procedure TFManReclamos.btngraba05Click(Sender: TObject);
Var xSql:String;
begin
  If Trim(dblcdConclusion.Text) = '' Then
  Begin
    MessageDlg('Registre la Conclusión', mtInformation, [mbOk], 0);
    dblcdConclusion.SetFocus;
    Exit;
  End;
  If Trim(dbddtpConclusion.Text) = '' Then
  Begin
    MessageDlg('Registre la Fecha de Conclusión', mtInformation, [mbOk], 0);
    dbddtpConclusion.SetFocus;
    Exit;
  End;
  If Trim(memConclusion.Text) = '' Then
  Begin
    MessageDlg('Ingrese un comentario a la conclusión', mtInformation, [mbOk], 0);
    memConclusion.SetFocus;
    Exit;
  End;

  If DM1.cdsReclamos.FieldByName('RECFECREC').AsDateTime > dbddtpConclusion.DateTime Then
  Begin
    MessageDlg('Fecha de conclusión menor a la fecha de recepción', mtInformation, [mbOk], 0);
    dbddtpConclusion.SetFocus;
    Exit;
  End;

  If MessageDlg('¿ Desea Confirmar la Conclusión ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
  Begin
    xSql :=   ' UPDATE TGE310 SET RECCONC = '+QuotedStr(dblcdConclusion.Text)
    +' , FRECFECCON  = '+QuotedStr(dbddtpConclusion.Text)
    +' , RECUSUCON = '+QuotedStr(DM1.wUsuario)
    +' , RECDESCCON = '+QuotedStr(memConclusion.Lines.Text)
    +' , FREGCON = SYSDATE'
    +' WHERE RECAREA = '+QuotedStr(DM1.cdsReclamos.FieldByName('RECAREA').AsString)
    +' AND RECIDE = '+QuotedStr(DM1.cdsReclamos.FieldByName('RECIDE').AsString);
    DM1.cdsReporte.Close;
    DM1.cdsReporte.DataRequest(xSql);
    DM1.cdsReporte.Execute;
    xSql :=  ' SELECT A.RECIDE, A.RECDNI, A.RECAPENOM, B.REC_BRE, B.REC_DESC, A.RECDESC, A.RECFECREC, A.RECRECUSU,'
    +' A.RECCONC, C.DES_TIPCON, A.RECAREA'
    +' FROM TGE310 A, TGE311 B, TGE312 C'
    +' WHERE A.RECAREA = '+QuotedStr(DM1.wModulo)
    +' AND A.RECAREA = B.ID_AREA AND A.RECTIPIDE = B.ID_RECLAMO'
    +' AND A.RECCONC = C.ID_TIPCON(+)'
    +' ORDER BY A.RECIDE';
    DM1.cdsReclamos.Close;
    DM1.cdsReclamos.DataRequest(xSql);
    DM1.cdsReclamos.Open;
  End;
  pnlResReclamo.Visible := False;
  dbgReclamos.Enabled := True;
End;

procedure TFManReclamos.btncerrar06Click(Sender: TObject);
begin
  pnlResReclamo.Visible := False;
  dbgReclamos.Enabled := True;
end;

procedure TFManReclamos.btnBuscarClick(Sender: TObject);
Var xSql :String;
begin

  If rgbusca.ItemIndex = -1 Then
  Begin
    MessageDlg('Seleccione el tipo de busqueda', mtInformation, [mbOk], 0);
    rgbusca.SetFocus;
    Exit;
  End;

  If rgbusca.ItemIndex = 0 Then
  Begin
    If Trim(mebusca.Text) = '' Then
    Begin
      MessageDlg('Ingrese los datos del asociado a buscar', mtInformation, [mbOk], 0);
      mebusca.SetFocus;
      Exit;
    End;
    xSql := ' SELECT A.RECIDE, A.RECDNI, A.RECAPENOM, B.REC_BRE, B.REC_DESC, A.RECDESC, A.RECFECREC, A.RECRECUSU,'
    +' A.RECCONC, C.DES_TIPCON, A.RECAREA FROM TGE310 A, TGE311 B, TGE312 C'
    +' WHERE A.RECAPENOM LIKE '+QuotedStr(Trim(mebusca.Text)+'%')
    +' AND A.RECAREA = '+QuotedStr(DM1.wModulo)+' AND A.RECAREA = B.ID_AREA AND A.RECTIPIDE = B.ID_RECLAMO AND A.RECCONC = C.ID_TIPCON(+) ORDER BY A.RECIDE'
  End
  Else
  Begin
    If Trim(mebusca.Text) = '' Then
    Begin
      MessageDlg('Ingrese el DNI del asociado a buscar', mtInformation, [mbOk], 0);
      mebusca.SetFocus;
      Exit;
    End;
    xSql := ' SELECT A.RECIDE, A.RECDNI, A.RECAPENOM, B.REC_BRE, B.REC_DESC, A.RECDESC, A.RECFECREC, A.RECRECUSU,'
    +' A.RECCONC, C.DES_TIPCON, A.RECAREA FROM TGE310 A, TGE311 B, TGE312 C'
    +' WHERE A.RECDNI = '+QuotedStr(Trim(mebusca.Text))
    +' AND A.RECAREA = '+QuotedStr(DM1.wModulo)+' AND A.RECAREA = B.ID_AREA AND A.RECTIPIDE = B.ID_RECLAMO AND A.RECCONC = C.ID_TIPCON(+) ORDER BY A.RECIDE';
  End;
  DM1.cdsReclamos.Close;
  DM1.cdsReclamos.DataRequest(xSql);
  DM1.cdsReclamos.Open;
  dbgReclamos.ColumnByName('RECIDE').FooterValue := IntToStr(DM1.cdsReclamos.RecordCount);
end;

End.
