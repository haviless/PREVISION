// HPC_201307_PRE   : Se añade imagen del nuevo logo institucional.
// SPP_201401_PRE   : Se realiza el pase a producción a partir del pase HPC_201307_PRE

unit PRE291;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ppEndUsr, ppDB, ppDBPipe,
  ppParameter, ppBands, ppClass, ppCtrls, ppVar, ppPrnabl, ppCache, ppComm,
  ppRelatv, ppProd, ppReport, ImgList, Wwdbigrd, Wwdbgrid, Grids, DBGrids,
  ComCtrls,DB,DBClient,StrUtils, Spin, Mask, wwdblook, Wwdbdlg, jpeg;  // SPP_201401_PRE

type
  TFRptCartaDesignatario = class(TForm)
    pInferior: TPanel;
    lblNroRegEncontrados: TLabel;
    btnAExcel: TBitBtn;
    btnCerrar: TBitBtn;
    btnPrint: TBitBtn;
    Panel1: TPanel;
    imgLstGrid: TImageList;
    btnProcesar: TBitBtn;
    ppDesignerRun: TppDesigner;
    ppPrevio: TppReport;
    ppParameterList1: TppParameterList;
    ppDBConexion: TppDBPipeline;
    rgEstado: TRadioGroup;
    gbPeriodo: TGroupBox;
    gbUbigeo: TGroupBox;
    Label3: TLabel;
    dblcddpto: TwwDBLookupComboDlg;
    medpto: TMaskEdit;
    GroupBox1: TGroupBox;
    dbgPrevio: TwwDBGrid;
    Panel2: TPanel;
    Label4: TLabel;
    cmbAgrupar: TComboBox;
    dtgData: TDBGrid;
    ppHeaderBand1: TppHeaderBand;
    ppShape2: TppShape;
    ppShape1: TppShape;
//Inicio: SPP_201401_PRE
    // ppLabel11: TppLabel; 
    // ppLabel12: TppLabel; 
//Fin: SPP_201401_PRE
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppLblTitulo: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel_1: TppLabel;
    ppLabel_2: TppLabel;
    ppLblPeriodo: TppLabel;
    ppShape3: TppShape;
    ppLabel_3: TppLabel;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppLabel_4: TppLabel;
    ppLabel_5: TppLabel;
    ppLabel_6: TppLabel;
    ppLabel_7: TppLabel;
    ppLblUbigeo: TppLabel;
    ppLblEstado: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText_2: TppDBText;
    ppDBText_4: TppDBText;
    ppDBText_3: TppDBText;
    ppDBText_6: TppDBText;
    ppDBText_5: TppDBText;
    ppDBText_7: TppDBText;
    ppDBText_8: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText_1: TppDBText;
    ppLine2: TppLine;
    ppLine4: TppLine;
    ppGroupFooterBand1: TppGroupFooterBand;
    Label5: TLabel;
    dtpInicio: TDateTimePicker;
    Label6: TLabel;
    dtpFin: TDateTimePicker;
    ppImage1: TppImage;  // SPP_201401_PRE
    procedure btnAExcelClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
    procedure dbgPrevioCalcTitleImage(Sender: TObject;
      Field: TField; var TitleImageAttributes: TwwTitleImageAttributes);
    procedure dbgPrevioTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure dblcddptoChange(Sender: TObject);
    procedure dblcddptoExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cmbAgruparChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    xFInicio,xFFin: string;
    xDpto:string;
    xSituacion : string;
    procedure DoSorting(cdsName: TClientDataset; AFieldName: String);
    procedure agrupar(Sender: TObject; IField: string);
    procedure asignarColumnas;

  public
    { Public declarations }
  end;

var
  FRptCartaDesignatario: TFRptCartaDesignatario;

implementation

uses PREDM;

{$R *.dfm}

(******************************************************************************)
procedure TFRptCartaDesignatario.FormActivate(Sender: TObject);
var xSql:string;
    cadFecha:Double;
begin
     cadFecha:=DM1.FechaSys;
     dtpInicio.date:=cadFecha;
     dtpFin.date:=cadFecha;

     xSql := 'select * from apo158';
     DM1.cdsDpto.Close;
     DM1.cdsDpto.DataRequest(xSql);
     DM1.cdsDpto.Open;
     dblcddpto.Selected.Clear;
     dblcddpto.Selected.Add('DPTOID'#9'4'#9'Código'#9#9);
     dblcddpto.Selected.Add('DPTODES'#9'20'#9'Descripción'#9#9);
     dblcddpto.SetFocus;

     DM1.cdsQry5.Close;
     DM1.cdsQry6.Close;
     medpto.Text := 'Todos los Departamentos';
end;

(******************************************************************************)

procedure TFRptCartaDesignatario.DoSorting(cdsName:TClientDataset; AFieldName: String);
const
  NONSORTABLE: Set of TFieldType=[ftBlob,ftMemo,ftOraBlob,ftOraCLob];
begin
  with cdsName do
  begin
    if IsEmpty or (FieldByName(AFieldName).DataType in NONSORTABLE) then
      Exit;

    if (IndexFieldNames=AFieldName) then
    begin
       IndexDefs.Update;
       if IndexDefs.IndexOf('w2wTempIndex')>-1  then
       begin
         DeleteIndex('w2wTempIndex');
         IndexDefs.Update;
       end;
       AddIndex('w2wTempIndex',AFieldName,[ixDescending,ixCaseInsensitive],'','',0);
       IndexName:='w2wTempIndex';
    end
    else
    begin
       IndexFieldNames := AFieldName;
    end;
  end;
end;

(******************************************************************************)

procedure TFRptCartaDesignatario.dbgPrevioTitleButtonClick(
  Sender: TObject; AFieldName: String);
begin
  DoSorting(TClientDataset((Sender as TwwDBGrid).Datasource.Dataset),AFieldName);
end;

(******************************************************************************)

procedure TFRptCartaDesignatario.dbgPrevioCalcTitleImage(Sender: TObject;
  Field: TField; var TitleImageAttributes: TwwTitleImageAttributes);
begin
  with (Sender as TwwDBGrid) do
  if Field.FieldName=TClientDataset(Datasource.Dataset).indexfieldnames then
  begin
    TitleImageAttributes.ImageIndex := 0;
  end
  else if TClientDataset(Datasource.Dataset).indexname = 'w2wTempIndex' then
  begin
     TClientDataset(Datasource.Dataset).indexdefs.Update;
     if TClientDataset(Datasource.Dataset).indexdefs.Find('w2wTempIndex').Fields = Field.Fieldname then
       TitleImageAttributes.ImageIndex := 1;
  end;
end;

(******************************************************************************)

procedure TFRptCartaDesignatario.btnAExcelClick(Sender: TObject);
begin
   DM1.HojaExcel('Reporte',dtgData.DataSource, dtgData);
end;

(******************************************************************************)

procedure TFRptCartaDesignatario.dblcddptoChange(Sender: TObject);
begin
  If DM1.cdsDpto.Locate('DPTOID',dblcddpto.Text,[]) Then
  Begin
      medpto.Text := DM1.cdsDpto.FieldByName('DPTODES').AsString;
  End
  Else
    Begin
      if not dblcddpto.Focused then dblcddpto.Text  := '';
      medpto.Text := 'Todos los Departamentos';
    End;
end;

(******************************************************************************)

procedure TFRptCartaDesignatario.dblcddptoExit(Sender: TObject);
begin
  dblcddptoChange(dblcddpto);
end;

(******************************************************************************)
procedure TFRptCartaDesignatario.agrupar(Sender: TObject;IField:string);
begin
      (Sender as TwwDBGrid).GroupFieldName:= IField;
      (Sender as TwwDBGrid).Datasource.Dataset.FieldByName(IField).Index := 0;
      DoSorting(TClientDataset((Sender as TwwDBGrid).Datasource.Dataset), IField);
      (Sender as TwwDBGrid).Invalidate;
end;

(******************************************************************************)
procedure TFRptCartaDesignatario.asignarColumnas();
begin
   dbgPrevio.Selected.Clear;
   dbgPrevio.Selected.Add('DSGFREC'#9'16'#9'FECHA DE~INGRESO');
   dbgPrevio.Selected.Add('ASOAPENOM'#9'35'#9'NOMBRES Y APELLIDOS~DEL ASOCIADO');
   dbgPrevio.Selected.Add('SITUACION'#9'12'#9'SITUACION~DE LA CARTA');
   dbgPrevio.Selected.Add('DPTO'#9'12'#9'DEPARTAMENTO');
   dbgPrevio.Selected.Add('USUAPE'#9'10'#9'USUARIO');
   dbgPrevio.Selected.Add('FLIQ'#9'10'#9'FECHA~LIQUIDACION');
   dbgPrevio.Selected.Add('NLIQ'#9'12'#9'NUMERO~LIQUIDACION');
   dbgPrevio.Selected.Add('BENEFDES'#9'14'#9'TIPO~BENEFICIO');
   dbgPrevio.ApplySelected;
   dbgPrevio.RefreshDisplay;
end;
(******************************************************************************)
procedure TFRptCartaDesignatario.btnProcesarClick(Sender: TObject);
  {----------------------------------------------------}
  function getSQL(IAlias:boolean): string;
  var xSQL: string;
  begin
      if IAlias then
        xSQL:='SELECT CARTA_APO.ASOID ID, TO_CHAR(CARTA_APO.DSGFREC,''DD/MM/YYYY'') FECHA_INGRESO, '
             +'       CARTA_APO.ASOAPENOM APELLIDOS_NOMBRES, '
             +'       CARTA_APO.SITUACION SITUACION, NVL(DPTO.DPTODES, ''ZZZ'') DEPARTAMENTO, CARTA_APO.USUAPE USUARIO, '
             +'       LIQ.PVSLFECBE FECHA_LIQUIDACION, LIQ.PVSLBENNR NUMERO_LIQUIDACION, TLIQ.BENEFDES TIPO_BENEFICIO'
      else
        xSQL:='SELECT CARTA_APO.ASOID, TO_CHAR(CARTA_APO.DSGFREC,''DD/MM/YYYY'') DSGFREC, '
             +'       CARTA_APO.ASOAPENOM, '
             +'       CARTA_APO.SITUACION, NVL(DPTO.DPTODES, ''ZZZ'') DPTO, CARTA_APO.USUAPE, '
             +'       LIQ.PVSLFECBE FLIQ, LIQ.PVSLBENNR NLIQ, TLIQ.BENEFDES ';


      xSQL:=xSQL
           +'  FROM (SELECT CARTA.ASOID, CARTA.DSGFREC, '
           +'                CASE '
           +'                   WHEN APO.ASOAPENOM IS NOT NULL THEN '
           +'                    APO.ASOAPENOM '
           +'                   ELSE '
           +'                    CARTA.ASOAPENOMDNI '
           +'                 END ASOAPENOM, '
           +'                CASE '
           +'                   WHEN CARTA.USUAPE IS NOT NULL '
           +'                        AND CARTA.PVSLBENNR IS NOT NULL THEN '
           +'                    ''ABIERTA'' '
           +'                   ELSE '
           +'                    ''CERRADA'' '
           +'                 END SITUACION, CARTA.USUAPE, APO.ZIPID '
           +'           FROM (SELECT DISTINCT ASOID, DSGFREC, ASOAPENOMDNI, USUAPE, '
           +'                                  PVSLBENNR '
           +'                    FROM PVS302 '
           +'                   WHERE (ASOID, DSGFREC) IN '
           +'                         (SELECT ASOID, MAX(DSGFREC) DSGFREC '
           +'                            FROM PVS302 '
           +'                           WHERE DSGFREC '
           +'                                    BETWEEN TO_DATE('+QuotedStr(xFInicio)+',''DD/MM/YYYY'') '
           +'                                        AND TO_DATE('+QuotedStr(xFFin)+',''DD/MM/YYYY'') '
           +'                           GROUP BY ASOID)) CARTA, APO201 APO '
           +'          WHERE CARTA.ASOID = APO.ASOID(+) ';
     if trim(dblcddpto.Text)<>'' then
      xSQL:=xSQL+' AND SUBSTR(APO.ZIPID, 1, 2) = '+QuotedStr(trim(dblcddpto.Text));

     if rgEstado.ItemIndex>0 then
      xSQL:=xSQL+' AND (CASE WHEN CARTA.USUAPE IS NOT NULL '
                +'               AND CARTA.PVSLBENNR IS NOT NULL THEN '
                +'               ''ABIERTA'' ELSE ''CERRADA'' END) = '+QuotedStr(xSituacion);

     xSQL:=xSQL+'              ) CARTA_APO, '
           +'       (SELECT * '
           +'           FROM PVS306 '
           +'          WHERE PVSESTLIQ NOT IN (''13'', ''04'')) LIQ, TGE186 TLIQ, APO158 DPTO '
           +' WHERE CARTA_APO.ASOID = LIQ.ASOID(+) '
           +'   AND LIQ.PVSLTIPBE = TLIQ.TIPBENEF(+) '
           +'   AND SUBSTR(CARTA_APO.ZIPID, 1, 2) = DPTO.DPTOID(+) '
           +' ORDER BY CARTA_APO.DSGFREC, NVL(DPTO.DPTODES, ''ZZZ''), SITUACION ';
     result := xSQL;
  end;
  {----------------------------------------------------}
  function isFechasValidas():boolean;
    begin
      result:= not ((trim(datetostr(dtpInicio.Date))='') or (trim(datetostr(dtpFin.Date))=''));
    end;
  {----------------------------------------------------}
  procedure generarDxs();
  var xSQL: String;
  begin
      xSQL:=getSQL(false);
      DM1.cdsQry6.Close;
      DM1.cdsQry6.DataRequest(xSql);
      DM1.cdsQry6.Open;
      //excel
      xSQL:=getSQL(true);
      DM1.cdsQry5.Close;
      DM1.cdsQry5.DataRequest(XSQL);
      DM1.cdsQry5.Open;

  end;
  {----------------------------------------------------}
begin
  if not isFechasValidas() then
    begin
      showmessage('Por favor seleccione años validos (Año de Inicio menor al Año de Fin) ');
      exit;
    end;
  xFInicio:=datetostr(dtpInicio.Date);
  xFFin:=datetostr(dtpFin.Date);

   if trim(medpto.text)='' then
    begin
      showmessage('Por favor seleccione un Departamento');
      exit;
    end;
   xDpto:=medpto.text;


   case rgEstado.ItemIndex of
     0 : xSituacion:= 'TODOS';
     1 : xSituacion:= 'ABIERTA';
     2 : xSituacion:= 'CERRADA';
   else
      showmessage('Por favor seleccione un estado (Situacion)');
      exit;
   end;      

   Screen.Cursor:= crHourGlass;
   generarDxs();
   asignarColumnas();
   cmbAgrupar.ItemIndex:=0;
   agrupar(dbgPrevio,'DSGFREC');
   self.lblNroRegEncontrados.Caption:=FloatToStr(DM1.cdsQry6.RecordCount)+' Registros encontrados ';


   btnAExcel.Enabled:= (DM1.cdsQry6.RecordCount>0);
   btnPrint.Enabled:=(DM1.cdsQry6.RecordCount>0);
   Screen.Cursor:= crDefault;
end;

(******************************************************************************)

procedure TFRptCartaDesignatario.btnPrintClick(Sender: TObject);
begin
   ppLblPeriodo.Caption:='Rango de Fechas : '+xFInicio+' A '+xFFin;
   ppLblUbigeo.Caption:='Departamento : '+xDpto;
   ppLblEstado.Caption:='Situacion : '+xSituacion;
   if cmbAgrupar.Text = 'FECHA DE INGRESO' then
      begin
        ppLabel_1.caption:='F.INGRESO/ASOCIADO';
        ppLabel_2.caption:='SIT.CARTA';
        ppLabel_3.caption:='DPTO';
        ppLabel_4.caption:='USUARIO';
        ppLabel_5.caption:='F. LIQ';
        ppLabel_6.caption:='NRO LIQ';
        ppLabel_7.caption:='BENEFICIO';

        ppDBText_1.DataField:='DSGFREC';
        ppDBText_2.DataField:='ASOAPENOM';
        ppDBText_3.DataField:='SITUACION';
        ppDBText_4.DataField:='DPTO';
        ppDBText_5.DataField:='USUAPE';
        ppDBText_6.DataField:='FLIQ';
        ppDBText_7.DataField:='NLIQ';
        ppDBText_8.DataField:='BENEFDES';

      end
   else if cmbAgrupar.Text = 'DEPARTAMENTO' then
      begin
        ppLabel_1.caption:='DPTO/ASOCIADO';
        ppLabel_2.caption:='SIT.CARTA';
        ppLabel_3.caption:='F.INGRESO';
        ppLabel_4.caption:='USUARIO';
        ppLabel_5.caption:='F. LIQ';
        ppLabel_6.caption:='NRO LIQ';
        ppLabel_7.caption:='BENEFICIO';

        ppDBText_1.DataField:='DPTO';
        ppDBText_2.DataField:='ASOAPENOM';
        ppDBText_3.DataField:='SITUACION';
        ppDBText_4.DataField:='DSGFREC';
        ppDBText_5.DataField:='USUAPE';
        ppDBText_6.DataField:='FLIQ';
        ppDBText_7.DataField:='NLIQ';
        ppDBText_8.DataField:='BENEFDES';

      end
   else if cmbAgrupar.Text = 'SITUACION DE LA CARTA' then
      begin
        ppLabel_1.caption:='SIT.CARTA/ASOCIADO';
        ppLabel_2.caption:='F.INGRESO';
        ppLabel_3.caption:='DPTO';
        ppLabel_4.caption:='USUARIO';
        ppLabel_5.caption:='F. LIQ';
        ppLabel_6.caption:='NRO LIQ';
        ppLabel_7.caption:='BENEFICIO';

        ppDBText_1.DataField:='SITUACION';
        ppDBText_2.DataField:='ASOAPENOM';
        ppDBText_3.DataField:='DSGFREC';
        ppDBText_4.DataField:='DPTO';
        ppDBText_5.DataField:='USUAPE';
        ppDBText_6.DataField:='FLIQ';
        ppDBText_7.DataField:='NLIQ';
        ppDBText_8.DataField:='BENEFDES';


      end
    (* else if cmbAgrupar.Text = 'FECHA DE LIQUIDACION' then
        begin
        ppLabel_1.caption:='';
      end *)
   else if cmbAgrupar.Text = 'TIPO DE BENEFICIO' then
      begin
        ppLabel_1.caption:='T.BENEFICIO/ASOCIADO';
        ppLabel_2.caption:='SIT.CARTA';
        ppLabel_3.caption:='DPTO';
        ppLabel_4.caption:='USUARIO';
        ppLabel_5.caption:='F. LIQ';
        ppLabel_6.caption:='NRO LIQ';
        ppLabel_7.caption:='F.INGRESO';

        ppDBText_1.DataField:='BENEFDES';
        ppDBText_2.DataField:='ASOAPENOM';
        ppDBText_3.DataField:='SITUACION';
        ppDBText_4.DataField:='DPTO';
        ppDBText_5.DataField:='USUAPE';
        ppDBText_6.DataField:='FLIQ';
        ppDBText_7.DataField:='NLIQ';
        ppDBText_8.DataField:='DSGFREC';


      end;

   ppGroup1.BreakName:=ppDBText_1.DataField;

   If DM1.cdsQry5.RecordCount > 0 Then
      Begin
        // para diseñar en tiempo de ejecucion
        // ppdesignerRun.Report := ppPrevio;
        // ppdesignerRun.Show;

        // para presentar
        ppPrevio.Print;
        ppPrevio.stop;
      End;
end;

(******************************************************************************)

procedure TFRptCartaDesignatario.cmbAgruparChange(Sender: TObject);
begin
   if DM1.cdsQry6.State=dsInactive then
     begin
        showmessage('No hay datos para agrupar');
        exit;
     end;
   if cmbAgrupar.Text = 'FECHA DE INGRESO' then
      agrupar(dbgPrevio,'DSGFREC')
   else if cmbAgrupar.Text = 'DEPARTAMENTO' then
      agrupar(dbgPrevio,'DPTO')
   else if cmbAgrupar.Text = 'SITUACION DE LA CARTA' then
      agrupar(dbgPrevio,'SITUACION')
   (* else if cmbAgrupar.Text = 'FECHA DE LIQUIDACION' then
      agrupar(dbgPrevio,'FLIQ') *)
   else if cmbAgrupar.Text = 'TIPO DE BENEFICIO' then
      agrupar(dbgPrevio,'BENEFDES');
end;

(******************************************************************************)

procedure TFRptCartaDesignatario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    try
      if not (DM1.cdsQry6.State=dsInactive) then
        begin
          DM1.cdsQry6.Filtered:=false;
          DM1.cdsQry5.Filtered:=false;
        end;
    finally
      Action:=caFree;
    end;
end;

(******************************************************************************)

end.
