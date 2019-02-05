// Inicio Uso Estándares: 01/08/2011
// Unidad               : PRE300
// Formulario           : Frepcausacese
// Fecha de Creación    : 13/11/2017
// Autor                : Isaac Revilla
// Objetivo             : Reporte por causas de cese
// HPC_201709_PRE : Creación
// HPC_201805_PRE : Se añade al campo tipo de beneficio
//                  un valor RE para el caso de la liquidacion sea x reliquidacion             
unit PRE300;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Wwdbdlg, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons,
  wwdbdatetimepicker, Mask, wwdblook, ppDB, ppDBPipe, ppDBBDE, ppCtrls,
  ppBands, ppVar, jpeg, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv,
  ppProd, ppReport, db, DBGrids;

type
  TFrepcausacese = class(TForm)
    gbdepofi: TGroupBox;
    Label4: TLabel;
    Label6: TLabel;
    dblcdptoid: TwwDBLookupCombo;
    dblcdofid: TwwDBLookupCombo;
    pnldesdpto: TPanel;
    medesdpto: TMaskEdit;
    Panel1: TPanel;
    edtOficina: TMaskEdit;
    gbfecha: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dbdtpinicial: TwwDBDateTimePicker;
    dbdtpfinal: TwwDBDateTimePicker;
    btnprocesar: TBitBtn;
    dbgcausasdecese: TwwDBGrid;
    rgtiprep: TRadioGroup;
    gbtipben: TGroupBox;
    dblcdtipben: TwwDBLookupComboDlg;
    btnimprimir: TBitBtn;
    btnaexcel: TBitBtn;
    btncerrar: TBitBtn;
    stdesben: TStaticText;
    pprdetalle: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppShape9: TppShape;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppShape8: TppShape;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel10: TppLabel;
    pplFechas: TppLabel;
    ppImage1: TppImage;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppLabel14: TppLabel;
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
    ppLabel9: TppLabel;
    ppLine2: TppLine;
    pplUsuario: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppbdedetalle: TppBDEPipeline;
    ppbderesumen: TppBDEPipeline;
    pprresumen: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppShape10: TppShape;
    ppShape11: TppShape;
    ppShape12: TppShape;
    ppShape18: TppShape;
    ppLabel15: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    pplfecharesumen: TppLabel;
    ppImage2: TppImage;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppLabel28: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText10: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText17: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppLine3: TppLine;
    ppLabel29: TppLabel;
    ppLine4: TppLine;
    ppLabel30: TppLabel;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppShape19: TppShape;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppShape20: TppShape;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppldptores: TppLabel;
    pplofires: TppLabel;
    ppltipliqres: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    dbgAExcel: TDBGrid;
    procedure FormActivate(Sender: TObject);
    procedure btnprocesarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dblcdtipbenExit(Sender: TObject);
    procedure dblcdptoidExit(Sender: TObject);
    procedure dblcdofidExit(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure btnaexcelClick(Sender: TObject);
    procedure dblcdtipbenChange(Sender: TObject);
    procedure dbdtpinicialChange(Sender: TObject);
    procedure dbdtpfinalChange(Sender: TObject);
    procedure rgtiprepClick(Sender: TObject);
  private
     xSql, xSqlAExcel:String;
     procedure limpia;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frepcausacese: TFrepcausacese;

implementation

uses PREDM;

{$R *.dfm}

procedure TFrepcausacese.FormActivate(Sender: TObject);
begin
   limpia;

   xSql := 'SELECT DPTOID, DPTODES FROM APO158 WHERE DPTOID IS NOT NULL ORDER BY DPTOID';
   DM1.cdsDpto.Close;
   DM1.cdsDpto.DataRequest(xSql);
   DM1.cdsDpto.Open;
   dblcdptoid.Selected.Clear;
   dblcdptoid.Selected.Add('DPTOID'#9'2'#9'Código'#9#9);
   dblcdptoid.Selected.Add('DPTODES'#9'25'#9'Nombre del departamento'#9#9);

   xSql := 'SELECT TIPBENEF, BENEFABR FROM TGE186 WHERE TIPBENEF IN (''01'',''02'',''03'')';
   DM1.cdsTipBenef.Close;
   DM1.cdsTipBenef.DataRequest(xSql);
   DM1.cdsTipBenef.Open;
   dblcdtipben.Selected.Clear;
   dblcdtipben.Selected.Add('TIPBENEF'#9'2'#9'Código'#9#9);
   dblcdtipben.Selected.Add('BENEFABR'#9'15'#9'Descripción'#9#9);
   dbdtpinicial.SetFocus;
end;

procedure TFrepcausacese.btnprocesarClick(Sender: TObject);
begin
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
   If rgtiprep.ItemIndex = -1 Then
   Begin
     MessageDlg('Seleccione el tipo de reporte', mtInformation, [mbOk], 0);
     dbdtpInicial.SetFocus;
     Exit;
   End;
   If rgtiprep.ItemIndex = 0 Then
   Begin
      Screen.Cursor := crHourGlass;
      xSql := 'SELECT A.ASODNI DNI_ASOCIADO, A.PVSLBENNR NUMERO_LIQUIDACION, A.PVSLFECBE FECHA_LIQUIDACION, A.ASOAPENOMDNI APELLIDO_Y_NOMBRE_TITULAR,'
      +' NVL(A.MONLIQBEN,0) MONT_LIQUID, NVL(A.MONDES,0) MONT_DESC_LIQUID, NVL(A.MONDEV,0) MONT_DEVUEL_LIQUID,'
      // Inicio: HPC_201805_PRE  
      // Se añade al tipo de beneficio la expresión "RE" para el caso de reliquidaciones
      // +' NVL(A.MONPAG,0) MONT_PAGADO_LIQUID, H.BENEFABR DESC_TIPO_LIQUIDACION, G.CODCAUCES CODIGO_CAUSA, G.DESCAUCES DESCRIPCION_CAUSA,'
      +' NVL(A.MONPAG,0) MONT_PAGADO_LIQUID, H.BENEFABR||CASE WHEN A.PVSESTLIQ = ''05'' THEN '' (RE)'' END DESC_TIPO_LIQUIDACION, G.CODCAUCES CODIGO_CAUSA, G.DESCAUCES DESCRIPCION_CAUSA,'
      // Fin: HPC_201805_PRE
      +' D.DPTODES DESC_DEPART_ORIGEN, E.OFDESNOM DESC_OFICINA_ORIGEN'
      +' FROM PVS306 A, PVS301 B, PVS301 C, APO158 D, APO110 E, APO201 F, PRE_CAUSA_CESE_CAB G, TGE186 H'
      +' WHERE A.PVSLFECBE >= '+QuotedStr(dbdtpinicial.Text)+' AND A.PVSLFECBE <= '+QuotedStr(dbdtpfinal.Text);
      If Trim(dblcdptoid.Text) <> '' Then
      Begin
         xSql := xSql + ' AND C.DEPORIEXP = '+QuotedStr(dblcdptoid.Text);
         If Trim(dblcdofid.Text) <> '' Then
            xSql := xSql + ' AND C.OFIORIEXP = '+QuotedStr(dblcdofid.Text);
      End;
      If Trim(dblcdtipben.Text) <> '' Then
         xSql := xSql + ' AND B.PVSTIPBEN = '+QuotedStr(dblcdtipben.Text);
      xSql := xSql
      +' AND A.PVSESTLIQ IN (''02'',''05'',''06'') AND A.PVSLBENNR = B.PVSLBENNR'
      +' AND A.ASOID = C.ASOID AND A.PVSEXPNRO = C.PVSEXPNRO'
      +' AND C.DEPORIEXP = D.DPTOID'
      +' AND C.OFIORIEXP = E.OFDESID'
      +' AND A.ASOID = F.ASOID'
      +' AND B.PVSTIPBEN = G.TIPBENEF AND B.CODCAUCES = G.CODCAUCES'
      +' AND A.PVSLTIPBE = H.TIPBENEF'
      +' ORDER BY A.PVSLBENNR';
      xSqlAExcel := xSql;      
      DM1.cdsReporte.Close;
      DM1.cdsReporte.DataRequest(xSql);
      DM1.cdsReporte.Open;
      Screen.Cursor := crDefault;
      If DM1.cdsReporte.RecordCount = 0 Then
      Begin
         limpia;      
         MessageDlg('No existe información para mostrar', mtCustom, [mbOk], 0);
         Exit;
      End;
      dbgcausasdecese.Selected.Clear;
      dbgcausasdecese.Selected.Add('DNI_ASOCIADO'#9'8'#9'DNI del~beneficiario'#9#9);
      dbgcausasdecese.Selected.Add('NUMERO_LIQUIDACION'#9'11'#9'Número de~liquidación'#9#9);
      dbgcausasdecese.Selected.Add('FECHA_LIQUIDACION'#9'10'#9'Fecha de~liquidación'#9#9);
      dbgcausasdecese.Selected.Add('APELLIDO_Y_NOMBRE_TITULAR'#9'42'#9'Apellidos y nombre(s) del titular'#9#9);
      dbgcausasdecese.Selected.Add('MONT_LIQUID'#9'15'#9'Monto de~liquidación'#9#9);
      dbgcausasdecese.Selected.Add('MONT_DESC_LIQUID'#9'15'#9'Monto~descontado'#9#9);
      dbgcausasdecese.Selected.Add('MONT_DEVUEL_LIQUID'#9'15'#9'Monto~devuelto'#9#9);
      dbgcausasdecese.Selected.Add('MONT_PAGADO_LIQUID'#9'15'#9'Monto~pagado'#9#9);
      dbgcausasdecese.Selected.Add('DESC_TIPO_LIQUIDACION'#9'15'#9'Tipo~beneficio'#9#9);
      dbgcausasdecese.Selected.Add('CODIGO_CAUSA'#9'5'#9'Código~causa cese'#9#9);
      dbgcausasdecese.Selected.Add('DESCRIPCION_CAUSA'#9'35'#9'Descripción~causa de cese'#9#9);
      dbgcausasdecese.Selected.Add('DESC_DEPART_ORIGEN'#9'15'#9'Departamento~origen'#9#9);
      dbgcausasdecese.Selected.Add('DESC_OFICINA_ORIGEN'#9'32'#9'Oficina~origen'#9#9);
      TNumericField(DM1.cdsReporte.FieldByName('MONT_LIQUID')).DisplayFormat := '###,###,##0.00';
      TNumericField(DM1.cdsReporte.FieldByName('MONT_DESC_LIQUID')).DisplayFormat := '###,###,##0.00';
      TNumericField(DM1.cdsReporte.FieldByName('MONT_DEVUEL_LIQUID')).DisplayFormat := '###,###,##0.00';
      TNumericField(DM1.cdsReporte.FieldByName('MONT_PAGADO_LIQUID')).DisplayFormat := '###,###,##0.00';
      dbgcausasdecese.ApplySelected;
      Screen.Cursor := crDefault;
   End;
   If rgtiprep.ItemIndex = 1 Then
   Begin
      Screen.Cursor := crHourGlass;
      xSql := 'SELECT G.CODCAUCES CODIGO_CAUSA_CESE, G.DESCAUCES DESC_CAUSA_CESE, COUNT(*) CANT_LIQUIDACION, SUM(NVL(A.MONLIQBEN,0)) MONTO_LIQUIDACION'
      +' FROM PVS306 A, PVS301 B, PVS301 C, APO158 D, APO110 E, APO201 F, PRE_CAUSA_CESE_CAB G, TGE186 H'
      +' WHERE A.PVSLFECBE >= '+QuotedStr(dbdtpinicial.Text)+' AND A.PVSLFECBE <= '+QuotedStr(dbdtpfinal.Text);
      If Trim(dblcdptoid.Text) <> '' Then
      Begin
         xSql := xSql + ' AND C.DEPORIEXP = '+QuotedStr(dblcdptoid.Text);
         If Trim(dblcdofid.Text) <> '' Then
            xSql := xSql + ' AND C.OFIORIEXP = '+QuotedStr(dblcdofid.Text);
      End;
      If Trim(dblcdtipben.Text) <> '' Then
         xSql := xSql + ' AND B.PVSTIPBEN = '+QuotedStr(dblcdtipben.Text);
      xSql := xSql + ' AND A.PVSESTLIQ IN (''02'',''05'',''06'') AND A.PVSLBENNR = B.PVSLBENNR AND A.ASOID = C.ASOID'
      +' AND A.PVSEXPNRO = C.PVSEXPNRO AND C.DEPORIEXP = D.DPTOID AND C.OFIORIEXP = E.OFDESID AND A.ASOID = F.ASOID'
      +' AND B.PVSTIPBEN = G.TIPBENEF AND B.CODCAUCES = G.CODCAUCES AND A.PVSLTIPBE = H.TIPBENEF'
      +' GROUP BY G.CODCAUCES, G.DESCAUCES ORDER BY G.CODCAUCES, G.DESCAUCES';
      xSqlAExcel := xSql;
      DM1.cdsReporte.Close;
      DM1.cdsReporte.DataRequest(xSql);
      DM1.cdsReporte.Open;
      Screen.Cursor := crDefault;
      If DM1.cdsReporte.RecordCount = 0 Then
      Begin
         limpia;
         MessageDlg('No existe información para mostrar', mtCustom, [mbOk], 0);
         Exit;
      End;
      dbgcausasdecese.Selected.Clear;
      dbgcausasdecese.Selected.Add('CODIGO_CAUSA_CESE'#9'8'#9'Código causa~de cese'#9#9);
      dbgcausasdecese.Selected.Add('DESC_CAUSA_CESE'#9'90'#9'Descripción~de causa de cese'#9#9);
      dbgcausasdecese.Selected.Add('CANT_LIQUIDACION'#9'10'#9'Cantidad de~beneficio'#9#9);
      dbgcausasdecese.Selected.Add('MONTO_LIQUIDACION'#9'15'#9'Monto~beneficio'#9#9);
      TNumericField(DM1.cdsReporte.FieldByName('CANT_LIQUIDACION')).DisplayFormat := '###,###,##0';
      TNumericField(DM1.cdsReporte.FieldByName('MONTO_LIQUIDACION')).DisplayFormat := '###,###,##0.00';
      dbgcausasdecese.ApplySelected;
      Screen.Cursor := crDefault;
   End;
   If DM1.cdsReporte.RecordCount > 0 Then
   Begin
    If rgtiprep.ItemIndex = 1 Then btnimprimir.Enabled := True;
    btnaexcel.Enabled := True;
   End
   Else
   Begin
      btnimprimir.Enabled := False;
      btnaexcel.Enabled := False;
   End;
end;

procedure TFrepcausacese.FormKeyPress(Sender: TObject; var Key: Char);
begin
   If Key = #13 Then
   begin
      Key := #0;
      Perform(CM_DIALOGKEY, VK_TAB, 0);
   end;
end;

procedure TFrepcausacese.dblcdtipbenExit(Sender: TObject);
begin
  If dblcdtipben.Text = '' Then stdesben.Caption := '';
  If Length(dblcdtipben.Text) = 2 then
  Begin
    If DM1.cdsTipBenef.Locate('TIPBENEF', dblcdtipben.Text, []) Then
    Begin
      stdesben.Caption := DM1.cdsTipBenef.FieldByName('BENEFABR').AsString;
    End
    Else
    Begin
      MessageDlg('Tipo de beneficio no valido', mtInformation, [mbOk], 0);
      dblcdtipben.Text := '';
      stdesben.Caption := '';
      dblcdtipben.SetFocus;
    End;
  End;
end;

procedure TFrepcausacese.dblcdptoidExit(Sender: TObject);
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
         MessageDlg('Código de departamento no valido', mtInformation, [mbOk], 0);
         dblcdptoid.Text := '';
         medesdpto.Text := '';
         dblcdofid.Text := '';
         edtOficina.Text := '';
         dblcdptoid.SetFocus;
         Exit;
      End;
   End;
   xSql := 'SELECT OFDESID, OFDESNOM FROM APO110 WHERE DPTOID = '+QuotedStr(dblcdptoid.Text);
   DM1.cdsOfDes.Close;
   DM1.cdsOfDes.DataRequest(xSql);
   DM1.cdsOfDes.Open;
   dblcdofid.Selected.Clear;
   dblcdofid.Selected.Add('OFDESID'#9'2'#9'Código oficina');
   dblcdofid.Selected.Add('OFDESNOM'#9'20'#9'Descripción oficina');
end;

procedure TFrepcausacese.dblcdofidExit(Sender: TObject);
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
      MessageDlg('Código de oficina no valido', mtInformation, [mbOk], 0);
      dblcdofid.Text := '';
      edtOficina.Text := '';
      dblcdofid.SetFocus;
     End;
  End;
end;

procedure TFrepcausacese.btncerrarClick(Sender: TObject);
begin
   Close;
end;

procedure TFrepcausacese.limpia;
begin
   If DM1.cdsReporte.Active = True Then
      DM1.cdsReporte.Close;
   If btnimprimir.Enabled = True Then
      btnimprimir.Enabled := False;
   If btnaexcel.Enabled = True Then
      btnaexcel.Enabled := False;
end;

procedure TFrepcausacese.btnimprimirClick(Sender: TObject);
begin
   If rgtiprep.ItemIndex = 0 Then
   Begin
      pprdetalle.Print;
   End
   Else
   Begin
      If Trim(medesdpto.Text) = '' Then  ppldptores.Caption := 'Todos'
      Else ppldptores.Caption := medesdpto.Text;
      If Trim(edtOficina.Text) = '' Then  pplofires.Caption := 'Todos'
      Else pplofires.Caption := edtOficina.Text;
      If Trim(stdesben.Caption) = '' Then  ppltipliqres.Caption := 'Todos'
      Else ppltipliqres.Caption := stdesben.Caption;
      pplfecharesumen.Caption := 'DEL '+dbdtpinicial.Text+' AL '+dbdtpfinal.Text;
      pprresumen.Print;
   End;
end;

procedure TFrepcausacese.btnaexcelClick(Sender: TObject);
begin
   DM1.cdsReporte1.Close;
   DM1.cdsReporte1.DataRequest(xSqlAExcel);
   DM1.cdsReporte1.Open;
   If rgtiprep.ItemIndex = 0 Then
      DM1.HojaExcel('PRE_REPDETALLE',DM1.dsReporte1, dbgAExcel)
   Else
      DM1.HojaExcel('PRE_RESUMEN',DM1.dsReporte1, dbgAExcel);
end;

procedure TFrepcausacese.dblcdtipbenChange(Sender: TObject);
begin
   limpia;
end;

procedure TFrepcausacese.dbdtpinicialChange(Sender: TObject);
begin
   limpia;
end;

procedure TFrepcausacese.dbdtpfinalChange(Sender: TObject);
begin
   limpia;
end;



procedure TFrepcausacese.rgtiprepClick(Sender: TObject);
begin
   limpia;
end;

end.
