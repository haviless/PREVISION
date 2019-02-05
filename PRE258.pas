// Actualizaciones
// SAR-2009-0984   : SE AÑADE EL CAMPO AUTDESAPO
// HPC_201211_PRE  : Se Controla que la fecha de autorización de descuento de aportes sea menor que la fecha de cese.
//                      * Para los casos de Fallecimiento e Invalidez. Si la fecha de autorización de descuento de aportes es mayor a la fecha de cese
//                      * solo se pagara cuenta invididual (Tambien tomar en cuenta que para estos casos ya no se cobrara nivelación de Aportes
// DPP_201209_PRE  : Se realiza el pase a produccion a partir del HPC_201211_PRE
// HPC_201307_PRE  : Se añaden campos al client cdsExpLiq
// SPP_201401_PRE  : Se realiza el pase a producción a partir del pase HPC_201307_PRE
// HPC_201609_PRE  : Se añade campo forma de solicitud del expediente
// HPC_201858_PRE  : Se modifica el formulario dfm
// HPC_201809_PRE  : Se añade el campo oficina de origen
unit PRE258;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fcButton, fcImgBtn, fcShapeBtn, Grids, Wwdbigrd, Wwdbgrid,
  StdCtrls, Buttons, ExtCtrls, Mask;

type
  TFbuscareliquidacion = class(TForm)
    dbgLiquidacionBeneficios: TwwDBGrid;
    GroupBox1: TGroupBox;
    rgbusca: TRadioGroup;
    mebusca: TMaskEdit;
    btnBuscar: TBitBtn;
    btncerrar: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnBuscarClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure rgbuscaClick(Sender: TObject);
    procedure dbgLiquidacionBeneficiosDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    xWhere:String;
    { Public declarations }
  end;

var
  Fbuscareliquidacion: TFbuscareliquidacion;

implementation

uses PREDM, PRE228, PRE241, PRE227, PRE244;

{$R *.dfm}

Procedure TFbuscareliquidacion.FormActivate(Sender: TObject);
Var xSql:String;
Begin
  dbgLiquidacionBeneficios.Selected.Clear;
  dbgLiquidacionBeneficios.Selected.Add('PVSLBENNR'#9'11'#9'Número de~Liquidación'#9);
  dbgLiquidacionBeneficios.Selected.Add('ASOAPENOMDNI'#9'42'#9'Apellidos y~Nombres'#9);
  dbgLiquidacionBeneficios.Selected.Add('ASOCODMOD'#9'10'#9'Código~Modular'#9);
  dbgLiquidacionBeneficios.Selected.Add('PVSLFECBE'#9'10'#9'Fecha de~Beneficio'#9);
  dbgLiquidacionBeneficios.Selected.Add('BENEFDES'#9'18'#9'Tipo de~Liquidación'#9);
  dbgLiquidacionBeneficios.Selected.Add('PVSESTDES'#9'18'#9'Estado de la~Liquidación'#9);
  dbgLiquidacionBeneficios.ApplySelected;
  rgbusca.ItemIndex := 0;
  mebusca.Width := 353;
  mebusca.MaxLength := 42;
  mebusca.SetFocus;
  btnBuscar.Left := 520;
  // Inicio: HPC_201609_PRE
  // Se añade el campo forma de solicitud del beneficiario
  // xSql := 'SELECT A.*, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'') PVSLFECBE,  B.BENEFDES, C.PVSESTDES FROM PVS306 A, TGE186 B, PVS102 C'
  // +' WHERE  A.PVSLBENNR = '''' AND A.PVSLTIPBE  = B.TIPBENEF(+) AND A.PVSESTLIQ = C.PVSESTDSG(+) AND C.PVSDOC = ''L'' ';
  xSql := 'SELECT a.ciaid, a.pvslbennr, a.pvsltipbe, a.asoid, a.asocodmod, a.asocodaux, a.pvslulap, a.pvsltaap, a.pvslestad,'
  +' a.pvsexpnro,  a.usuario, a.freg, a.hreg, a.pvsestliq, a.pvsfanul, a.pvsusuanul, a.pvsmotanul, a.cntanomm, a.tipocont, a.cntflag,'
  +' a.pvscobaso, a.asoapenomdni, a.tipdoccod, a.asodocnum, a.useid, a.upagoid, a.uproid, a.asodir, a.zipid, a.asodeslab, a.asodirlab,'
  +' a.asodstlabid, a.asoresnom, a.asofresnom, a.asorescese, a.asofrescese, a.asoncta, a.monliqben, a.mondes, a.mondev, a.monpag, a.asodni,'
  +' a.asotelf1, a.codotrdocide, a.numotrdocide, a.autdesapo, a.fecautdesapo, a.pvstipret, a.numopeban, a.fecopeban, a.numbenori, a.diferido,'
  +' a.fecdifliq, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'') PVSLFECBE, B.BENEFDES, C.PVSESTDES, D.FORSOLBEN FROM PVS306 A, TGE186 B, PVS102 C, PVS301 D'
  +' WHERE  A.PVSLBENNR = ''99999999999'' AND A.PVSLTIPBE  = B.TIPBENEF(+) AND A.PVSESTLIQ = C.PVSESTDSG(+) AND A.ASOID = D.ASOID AND C.PVSDOC = ''L''';
  // Fin: HPC_201609_PRE
  DM1.cdsCabLiq.Close;
  DM1.cdsCabLiq.DataRequest(xSql);
  DM1.cdsCabLiq.Open;
End;

procedure TFbuscareliquidacion.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
 If Key = #13 Then
    begin
     Key := #0;
     Perform(CM_DIALOGKEY, VK_TAB, 0);
    end;
end;

Procedure TFbuscareliquidacion.btnBuscarClick(Sender: TObject);
Var xSql :String;
Begin
  // Inicio: HPC_201609_PRE
  // Se añade el campo forma de solicitud del beneficiario
  If rgbusca.ItemIndex = 0 Then xWhere := ' WHERE A.ASOAPENOMDNI LIKE '+QuotedStr(Trim(mebusca.Text)+'%');
  If rgbusca.ItemIndex = 1 Then xWhere := ' WHERE A.PVSLBENNR = '+QuotedStr(Trim(mebusca.Text));
  If rgbusca.ItemIndex = 2 Then xWhere := ' WHERE A.ASOCODMOD = '+QuotedStr(Trim(mebusca.Text));
  xSql := 'SELECT A.*, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'') PVSLFECBE,  B.BENEFDES, C.PVSESTDES, D.FORSOLBEN, D.PVSTIPRET'
  +' FROM PVS306 A, TGE186 B, PVS102 C, PVS301 D'+xWhere
  +' AND A.ASOID = D.ASOID AND A.PVSLTIPBE  = B.TIPBENEF(+) AND A.PVSESTLIQ = C.PVSESTDSG(+) AND C.PVSDOC = ''L'' ORDER BY A.PVSLFECBE DESC';
  // Fin: HPC_201609_PRE
  DM1.cdsCabLiq.Close;
  DM1.cdsCabLiq.DataRequest(xSql);
  DM1.cdsCabLiq.Open;
End;

procedure TFbuscareliquidacion.btncerrarClick(Sender: TObject);
begin
  Fbuscareliquidacion.Close;
end;

procedure TFbuscareliquidacion.rgbuscaClick(Sender: TObject);
begin
  If rgbusca.ItemIndex = 0 Then
  Begin
    mebusca.Width := 353;
    mebusca.MaxLength := 42;
    mebusca.SetFocus;
    btnBuscar.Left := 520;
    mebusca.Text := '';
  End;
  If rgbusca.ItemIndex = 1 Then
  Begin
    mebusca.Width := 89;
    mebusca.MaxLength := 11;
    mebusca.SetFocus;
    btnBuscar.Left := 256;
    mebusca.Text := '';
  End;
  If rgbusca.ItemIndex = 2 Then
  Begin
    mebusca.Width := 78;
    mebusca.MaxLength := 10;
    mebusca.SetFocus;
    btnBuscar.Left := 247;
    mebusca.Text := '';
  End;
End;

procedure TFbuscareliquidacion.dbgLiquidacionBeneficiosDblClick(Sender: TObject);
Var xTipo, xSql:String;
begin
  //Chequear si este asociado ya tiene una reliquidación o si esta
  //liquidación es una reliquidación
  If DM1.cdsCabLiq.FieldByName('PVSESTLIQ').AsString = '05' Then
  Begin
    MessageDlg('Este es una Re-Liquidación'+#13+'No puede volver a ser liquidada',mtCustom,[mbOk],0);
    Exit;
  End;
  If (DM1.cdsCabLiq.FieldByName('PVSESTLIQ').AsString = '13') Or (DM1.cdsCabLiq.FieldByName('PVSESTLIQ').AsString = '04') Then
  Begin
    If (DM1.cdsCabLiq.FieldByName('PVSESTLIQ').AsString = '13') Then xTipo := 'Anulada';
    If (DM1.cdsCabLiq.FieldByName('PVSESTLIQ').AsString = '04') Then xTipo := 'Extornada';
    MessageDlg('Esta liquidación ya fue '+xTipo+#13+'No puede ser Re-Liquidada',mtCustom,[mbOk],0);
    Exit;
  End;
  If DM1.cdsCabLiq.FieldByName('PVSESTLIQ').AsString = '02' Then
  Begin
    // Verificando si tiene una reliquidación
    xSql := 'SELECT * FROM PVS306 WHERE ASOID = '+QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)
    +' AND PVSESTLIQ = ''05''';
    DM1.cdsInt.Close;
    DM1.cdsInt.DataRequest(xSql);
    DM1.cdsInt.Open;
    If DM1.cdsInt.RecordCount > 0 Then
    Begin
      MessageDlg('Esta liquidación ya tiene una reliquidación'+#13+'No puede volver a ser Re-Liquidada', mtCustom, [mbOk], 0);
      Exit;
    End;
  End;
  xSql := 'SELECT  A.ASOID, A.PVSEXPNRO, A.ASORESNOM, A.ASOFRESNOM, A.ASORESCESE, A.ASOFRESCESE, A.PVSCOBASO, A.PVSTIPBEN, A.PVSULTAPO,'
  +' A.FORPAGOID, A.BANCOID, A.AGENBCOID, A.ASONCTA, A.REPRID, A.FREG,'
  +' B.ASOAPENOMDNI, B.ASOCODMOD, B.USEID, B.UPAGOID, B.UPROID, B.ASODIR, B.ZIPID, B.ASODNI, A.PVSESTADO,'
  // Inicio: DPP_201209_PRE
  //+' F.TIPDOCDES, D.BENEFDES, C.PVSESTDES, DECODE(E.REPRAPENOM, NULL, ''SEDE CENTRAL'', E.REPRAPENOM) REPRAPENOM, B.AUTDESAPO'
  //Inicio: SPP_201401_PRE
  // +' F.TIPDOCDES, D.BENEFDES, C.PVSESTDES, DECODE(E.REPRAPENOM, NULL, ''SEDE CENTRAL'', E.REPRAPENOM) REPRAPENOM, B.AUTDESAPO, B.FECAUTDESAPO'
  // Inicio: HPC_201609_PRE
  // Se añaden los campos PVSTIPRET, DEPORIEXP, OFIORIEXP de la tabla de expediente de beneficio
  // +' F.TIPDOCDES, D.BENEFDES, C.PVSESTDES, DECODE(E.REPRAPENOM, NULL, ''SEDE CENTRAL'', E.REPRAPENOM) REPRAPENOM, B.AUTDESAPO, B.FECAUTDESAPO, FORSOLBEN, PVSTIPRET'
  +' F.TIPDOCDES, D.BENEFDES, C.PVSESTDES, DECODE(E.REPRAPENOM, NULL, ''SEDE CENTRAL'', E.REPRAPENOM) REPRAPENOM, B.AUTDESAPO, B.FECAUTDESAPO, A.FORSOLBEN, A.PVSTIPRET, A.DEPORIEXP, A.OFIORIEXP'
  // Fin: HPC_201609_PRE
    //Fin: SPP_201401_PRE
  // Fin: DPP_201209_PRE
  +' FROM PVS301 A, APO201 B,  PVS102 C, TGE186 D, COB201 E, TGE159 F'
  +' WHERE A.ASOID = '+QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)
  +' AND A.PVSESTADO IN (''02'', ''06'') AND A.ASOID = B.ASOID AND A.ASOID = B.ASOID'
  +' And A.PVSESTADO = C.PVSESTDSG AND C.PVSDOC = ''E'' AND A.PVSTIPBEN = D.TIPBENEF'
  +' AND A.TIPDOCCOD = F.TIPDOCCOD(+) AND A.REPRID = E.REPRID(+) ORDER BY PVSEXPNRO';
  DM1.cdsExpLiq.Close;
  DM1.cdsExpLiq.DataRequest(xSql);
  DM1.cdsExpLiq.Open;
  Try
    FReliquidacionBeneficios := TFReliquidacionBeneficios.Create(Self);
    FReliquidacionBeneficios.ShowModal;
  Finally
    FReliquidacionBeneficios.Free;
  End;
  If DM1.xSgr = 'G' Then
  Begin
    // Inicio: HPC_201609_PRE
    // Se añade campo FORSOLBEN del expediente de beneficio
    // Inicio: HPC_201809_PRE
    // Se añade el campo OFICINA DE ORIGEN
    // xSql := 'SELECT A.*, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'') PVSLFECBE,  B.BENEFDES, C.PVSESTDES, D.FORSOLBEN FROM PVS306 A, TGE186 B, PVS102 C, PVS301 D'
       xSql := 'SELECT '
    +'          A.ciaid, A.pvslbennr, A.pvsltipbe, A.pvslfecbe, A.asoid, A.asocodmod, A.asocodaux, A.pvslapnom_xx, A.pvsldni_xx, A.pvsldir_xx, A.pvsldpto_xx, A.pvslprov_xx, A.pvsldist_xx,' 
    +'          A.pvslceed_xx, A.pvslcedp_xx, A.pvslcepr_xx, A.pvslcedi_xx, A.pvslupri_xx, A.pvsluprn_xx, A.pvslupai_xx, A.pvslupan_xx, A.pvslusei_xx, A.pvslusen_xx, A.pvslnres_xx, A.pvslfres_xx,' 
    +'          A.pvslnces_xx, A.pvslfces_xx, A.pvslulap, A.pvsltaap, A.pvslnvou_xx, A.pvslestad, A.forpagoid_xx, A.bancoid_xx, A.pvslncta_xx, A.pvsexpnro, A.pvsldesnm_xx, A.pvsltben_xx, A.pvsltdev_xx,' 
    +'          A.pvsltdsc_xx, A.pvslsald_xx, A.pvsltpre_xx, A.pvslsldp_xx, A.pvstinnc_xx, A.pvstpran_xx, A.pvslobs_xx, A.usuario, A.freg, A.hreg, A.pvslnofc_xx, A.pvsestliq, A.pvslfpago_xx, A.agenbcoid_xx,' 
    +'          A.pvsltcre_xx, A.pvsfanul, A.pvsusuanul, A.pvsmotanul, A.cntanomm, A.tipocont, A.cntflag, A.pvslliqant_xx, A.pvscobaso, A.asoapenomdni, A.tipdoccod, A.asodocnum, A.useid, A.upagoid, A.uproid,' 
    +'          A.asodir, A.zipid, A.asodeslab, A.asodirlab, A.asodstlabid, A.asoresnom, A.asofresnom, A.asorescese, A.asofrescese, A.pvsultapo_xx, A.asoncta, A.monliqben, A.mondes, A.mondev, A.monpag, A.asodni,' 
    +'          A.asotelf1, A.codotrdocide, A.numotrdocide, A.autdesapo, A.fecautdesapo, A.pvstipret, A.numopeban, A.fecopeban, A.numbenori, A.diferido, A.fecdifliq, A.forsolben, A.flades, A.usudes, A.fecdes,'
    +'          TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'') PVSLFECBE,  B.BENEFDES, C.PVSESTDES, D.FORSOLBEN, D.OFIORIEXP FROM PVS306 A, TGE186 B, PVS102 C, PVS301 D'
    // Fin: HPC_201809_PRE
    +' WHERE  A.PVSLBENNR = '+QuotedStr(DM1.numeroLiquidacion)+' AND A.PVSLTIPBE  = B.TIPBENEF(+) AND A.PVSESTLIQ = C.PVSESTDSG(+) AND A.ASOID = D.ASOID AND C.PVSDOC = ''L''';
    // Fin: HPC_201609_PRE
    DM1.cdsCabLiq.Close;
    DM1.cdsCabLiq.DataRequest(xSql);
    DM1.cdsCabLiq.Open;
    Try
      FLiquidacionBeneficio := TFLiquidacionBeneficio.create(Self);
      FLiquidacionBeneficio.ShowModal;
    Finally
      FLiquidacionBeneficio.Free;
    End;
    // refrescando el grid de liquidaciones
    // Inicio: HPC_201609_PRE
    // Se añade campo FORSOLBEN del expediente de beneficio    
    xSql := 'SELECT A.*, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'') PVSLFECBE,  B.BENEFDES, C.PVSESTDES, D.FORSOLBEN'
    +' FROM PVS306 A, TGE186 B, PVS102 C, PVS301 D'+xWhere
    +' AND A.PVSLTIPBE  = B.TIPBENEF(+) AND A.PVSESTLIQ = C.PVSESTDSG(+) AND C.PVSDOC = ''L'' AND A.ASOID = D.ASOID ORDER BY A.PVSLFECBE DESC';
    // Inicio: HPC_201609_PRE
    DM1.cdsCabLiq.Close;
    DM1.cdsCabLiq.DataRequest(xSql);
    DM1.cdsCabLiq.Open;
    dbgLiquidacionBeneficios.Refresh;
  End;
End;

End.
