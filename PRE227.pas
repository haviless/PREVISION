// Actualizaciones:
// HPP_200903_PRE - realizado por IREVILLA : SE QUITA EL XWHERE Y SE COLOCA EN DURA QUE BUSQUE A LA LIQUIDACION RECIEN GENERADA.
// SAR-2009-0984   : SE AÑADE EL CAMPO AUTDESAPO
// HCP_201211_PRE  : Se Controla que la fecha de autorización de descuento de aportes sea menor que la fecha de cese.
//                      * Para los casos de Fallecimiento e Invalidez. Si la fecha de autorización de descuento de aportes es mayor a la fecha de cese
//                      * solo se pagara cuenta invididual (Tambien tomar en cuenta que para estos casos ya no se cobrara nivelación de Aportes
// DPP_201209_PRE  : Se realiza el pase a produccion a partir del HPC_201211_PRE
// HPC_201305_PRE  : Se añade campo FORSOLBEN en el Client cdsExpLiq.
// SPP_201306_PRE  : Se realiza el pase a producción a partir del HPC_201305_PRE
// HPC_201306_PRE  : Se modifica el client cdsExpLiq. Se añade campo que maneja el tipo de liquidación de retiro (PVSTIPRET)
// SPP_201307_PRE  : Se realiza el pase a producción a partir del HPC_201306_PRE.
// HPC_201307_PRE  : Se modifica el client cdsCabLiq que muestra los datos de la liquidación. (se añade nuevos campos)
// SPP_201401_PRE  : Se realiza el pase a producción a partir del pase HPC_201307_PRE
// SPP_201402_PRE  : Se modifica la busqueda de liquidaciones de beneficio, con la finalidad que tambien se muestren las liquidaciones anuladas.
// HPC_201607_PRE  : Se añaden los campos departamento de origen del expediente, oficina de origen del expediente (DEPORIEXP, OFIORIEXP)
// HPC_201609_PRE  : Se añaden los campos forma de solicitud del expediente
// HPC_201802_PRE  : Se modifica Qry de busqueda del expediente de liquidación
// HPC_201809_PRE  : Se añade el campo oficina del expediente
// HPC_201810_PRE  :  Se añade el campo oficina del expediente cuando el la liquidacion es anulada


unit PRE227;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fcButton, fcImgBtn, fcShapeBtn, Grids, Wwdbigrd, Wwdbgrid,
  StdCtrls, Buttons, ExtCtrls, Mask;

type
  TFBuscaLiqBeneficios = class(TForm)
    dbgLiquidacionBeneficios: TwwDBGrid;
    dbgExpLiquidacionIButton: TwwIButton;
    GroupBox1: TGroupBox;
    rgbusca: TRadioGroup;
    mebusca: TMaskEdit;
    btnBuscar: TBitBtn;
    btncerrar: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure dbgExpLiquidacionIButtonClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbgLiquidacionBeneficiosDblClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure rgbuscaClick(Sender: TObject);
  private
    { Private declarations }
  public
     xWhere:String;
    { Public declarations }
  end;

var
  FBuscaLiqBeneficios: TFBuscaLiqBeneficios;

implementation

uses PREDM, PRE228, PRE241;

{$R *.dfm}

Procedure TFBuscaLiqBeneficios.FormActivate(Sender: TObject);
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
  // Inicio: HPC_201810_PRE
  // xSql := 'SELECT a.ciaid, a.pvslbennr, a.pvsltipbe, a.asoid, a.asocodmod, a.asocodaux, a.pvslulap, a.pvsltaap, a.pvslestad, a.pvsexpnro,'
  // +' a.usuario, a.freg, a.hreg, a.pvsestliq, a.pvsfanul, a.pvsusuanul, a.pvsmotanul, a.cntanomm, a.tipocont, a.cntflag, a.pvscobaso, a.asoapenomdni,'
  // +' a.tipdoccod, a.asodocnum, a.useid, a.upagoid, a.uproid, a.asodir, a.zipid, a.asodeslab, a.asodirlab, a.asodstlabid, a.asoresnom, a.asofresnom,'
  // +' a.asorescese, a.asofrescese, a.asoncta, a.monliqben, a.mondes, a.mondev, a.monpag, a.asodni, a.asotelf1, a.codotrdocide, a.numotrdocide, a.autdesapo,'
  // +' a.fecautdesapo, a.pvstipret, a.numopeban, a.fecopeban, a.numbenori, a.diferido, a.fecdifliq, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'') PVSLFECBE,  B.BENEFDES, C.PVSESTDES, D.FORSOLBEN'
  xSql := 'select a.ciaid, a.pvslbennr, a.pvsltipbe, a.asoid, a.asocodmod, a.asocodaux, a.pvslulap, a.pvsltaap, a.pvslestad, a.pvsexpnro,'
  +' a.usuario, a.freg, a.hreg, a.pvsestliq, a.pvsfanul, a.pvsusuanul, a.pvsmotanul, a.cntanomm, a.tipocont, a.cntflag, a.pvscobaso, a.asoapenomdni,'
  +' a.tipdoccod, a.asodocnum, a.useid, a.upagoid, a.uproid, a.asodir, a.zipid, a.asodeslab, a.asodirlab, a.asodstlabid, a.asoresnom, a.asofresnom,'
  +' a.asorescese, a.asofrescese, a.asoncta, a.monliqben, a.mondes, a.mondev, a.monpag, a.asodni, a.asotelf1, a.codotrdocide, a.numotrdocide, a.autdesapo,'
  +' a.fecautdesapo, a.pvstipret, a.numopeban, a.fecopeban, a.numbenori, a.diferido, a.fecdifliq, TO_CHAR(a.pvslfecbe, ''DD/MM/YYYY'') pvslfecbe,'
  +' b.benefdes, c.pvsestdes, d.forsolben, d.ofioriexp'
  +' FROM PVS306 A, TGE186 B, PVS102 C, PVS301 D'
  +' WHERE A.PVSLBENNR = '''' AND'
  +'       A.PVSLTIPBE = B.TIPBENEF AND '
  +'       A.PVSESTLIQ = C.PVSESTDSG AND '
  +'       A.ASOID = D.ASOID AND A.PVSEXPNRO = D.PVSEXPNRO AND '
  +'       C.PVSDOC    = ''L''';
  // Fin: HPC_201810_PRE
  DM1.cdsCabLiq.Close;
  DM1.cdsCabLiq.DataRequest(xSql);
  DM1.cdsCabLiq.Open;
End;

procedure TFBuscaLiqBeneficios.dbgExpLiquidacionIButtonClick(
  Sender: TObject);
Var xSql:String;
begin
  xSql := 'SELECT A.ASOID, A.PVSEXPNRO, A.ASORESNOM, A.ASOFRESNOM, A.ASORESCESE, A.ASOFRESCESE,'
         // Inicio: HPC_201607_PRE --Se añaden los campos departamento de origen del expediente, oficina de origen del expediente 
         // +'       A.PVSCOBASO, F.TIPDOCDES, D.BENEFDES, C.PVSESTDES, '
         +'       A.PVSCOBASO, F.TIPDOCDES, D.BENEFDES, C.PVSESTDES, A.OFIORIEXP, A.FECRECEXP, A.FECRECEXP, '
         // Fin: HPC_201607_PRE
         // Inicio: SPP_201307_PRE
         // +'       DECODE(E.REPRAPENOM, NULL, ''SEDE CENTRAL'', E.REPRAPENOM) REPRAPENOM, B.ASOAPENOMDNI, B.AUTDESAPO, B.FECAUTDESAPO,'
         +'       DECODE(E.REPRAPENOM, NULL, ''SEDE CENTRAL'', E.REPRAPENOM) REPRAPENOM, B.ASOAPENOMDNI, B.AUTDESAPO, B.FECAUTDESAPO, A.PVSTIPRET,'
         // Fin: SPP_201307_PRE
         // Inicio: SPP_201306_PRE
         // +' B.ASOCODMOD, B.USEID, B.UPAGOID, B.UPROID, B.ASODIR, B.ZIPID, B.ASOTELF1'
         +'       B.ASOCODMOD, B.USEID, B.UPAGOID, B.UPROID, B.ASODIR, B.ZIPID, B.ASOTELF1, A.FORSOLBEN'
         // Fin: SPP_201306_PRE

         +'  FROM PVS301 A, APO201 B,  PVS102 C, TGE186 D, COB201 E, TGE159 F'
         +' WHERE A.ASOID     = '''' AND '
         +'       A.PVSESTADO IN (''01'', ''05'') AND '
         +'       A.ASOID     = B.ASOID AND '
         +'       A.ASOID     = B.ASOID AND '
         +'       A.PVSESTADO = C.PVSESTDSG AND'
         +'       C.PVSDOC    = ''E'' AND '
         +'       A.PVSTIPBEN = D.TIPBENEF AND '
         +'       A.TIPDOCCOD = F.TIPDOCCOD(+) AND '
         +'       A.REPRID    = E.REPRID(+) '
         +'  ORDER BY PVSEXPNRO';
  DM1.cdsExpLiq.Close;
  DM1.cdsExpLiq.DataRequest(xSql);
  DM1.cdsExpLiq.Open;
  Try
    FBuscaExpediente := TFBuscaExpediente.Create(Self);
    FBuscaExpediente.Top := 210;
    FBuscaExpediente.Left := 40;
    FBuscaExpediente.ShowModal;
  Finally
    FBuscaExpediente.Free;
  End;
  If DM1.xSgr = 'G' Then
  Begin
    // Inicio: HPC_201810_PRE
    // xSql := 'SELECT '
    // +'       A.ciaid, A.pvslbennr, A.pvsltipbe, A.pvslfecbe, A.asoid, A.asocodmod, A.asocodaux, A.pvslapnom_xx, A.pvsldni_xx, A.pvsldir_xx, A.pvsldpto_xx, A.pvslprov_xx, A.pvsldist_xx,'
    // +'       A.pvslceed_xx, A.pvslcedp_xx, A.pvslcepr_xx, A.pvslcedi_xx, A.pvslupri_xx, A.pvsluprn_xx, A.pvslupai_xx, A.pvslupan_xx, A.pvslusei_xx, A.pvslusen_xx, A.pvslnres_xx, A.pvslfres_xx,'
    // +'       A.pvslnces_xx, A.pvslfces_xx, A.pvslulap, A.pvsltaap, A.pvslnvou_xx, A.pvslestad, A.forpagoid_xx, A.bancoid_xx, A.pvslncta_xx, A.pvsexpnro, A.pvsldesnm_xx, A.pvsltben_xx, A.pvsltdev_xx,'
    // +'       A.pvsltdsc_xx, A.pvslsald_xx, A.pvsltpre_xx, A.pvslsldp_xx, A.pvstinnc_xx, A.pvstpran_xx, A.pvslobs_xx, A.usuario, A.freg, A.hreg, A.pvslnofc_xx, A.pvsestliq, A.pvslfpago_xx, A.agenbcoid_xx,'
    // +'       A.pvsltcre_xx, A.pvsfanul, A.pvsusuanul, A.pvsmotanul, A.cntanomm, A.tipocont, A.cntflag, A.pvslliqant_xx, A.pvscobaso, A.asoapenomdni, A.tipdoccod, A.asodocnum, A.useid, A.upagoid, A.uproid,'
    // +'       A.asodir, A.zipid, A.asodeslab, A.asodirlab, A.asodstlabid, A.asoresnom, A.asofresnom, A.asorescese, A.asofrescese, A.pvsultapo_xx, A.asoncta, A.monliqben, A.mondes, A.mondev, A.monpag, A.asodni,'
    // +'       A.asotelf1, A.codotrdocide, A.numotrdocide, A.autdesapo, A.fecautdesapo, A.pvstipret, A.numopeban, A.fecopeban, A.numbenori, A.diferido, A.fecdifliq, A.forsolben, A.flades, A.usudes, A.fecdes,'
    // +'       D.FORSOLBEN, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'') PVSLFECBE,  B.BENEFDES, C.PVSESTDES, D.OFIORIEXP FROM PVS306 A, TGE186 B, PVS102 C, PVS301 D'
    xSql := 'a.ciaid, a.pvslbennr, a.pvsltipbe, a.asoid, a.asocodmod, a.asocodaux, a.pvslulap, a.pvsltaap, a.pvslestad, a.pvsexpnro,'
    +' a.usuario, a.freg, a.hreg, a.pvsestliq, a.pvsfanul, a.pvsusuanul, a.pvsmotanul, a.cntanomm, a.tipocont, a.cntflag, a.pvscobaso, a.asoapenomdni,'
    +' a.tipdoccod, a.asodocnum, a.useid, a.upagoid, a.uproid, a.asodir, a.zipid, a.asodeslab, a.asodirlab, a.asodstlabid, a.asoresnom, a.asofresnom,'
    +' a.asorescese, a.asofrescese, a.asoncta, a.monliqben, a.mondes, a.mondev, a.monpag, a.asodni, a.asotelf1, a.codotrdocide, a.numotrdocide, a.autdesapo,'
    +' a.fecautdesapo, a.pvstipret, a.numopeban, a.fecopeban, a.numbenori, a.diferido, a.fecdifliq, TO_CHAR(a.pvslfecbe, ''DD/MM/YYYY'') pvslfecbe,'
    +' b.benefdes, c.pvsestdes, d.forsolben, d.ofioriexp'
    +' FROM PVS306 A, TGE186 B, PVS102 C, PVS301 D'
    +' WHERE A.PVSLBENNR = '+QuotedStr(DM1.numeroLiquidacion)+' AND A.PVSLTIPBE = B.TIPBENEF AND A.PVSESTLIQ = C.PVSESTDSG AND '
    +' C.PVSDOC = ''L'' AND A.ASOID = D.ASOID AND A.PVSEXPNRO = D.PVSEXPNRO';
    // Fin: HPC_201810_PRE
    DM1.cdsCabLiq.Close;
    DM1.cdsCabLiq.DataRequest(xSql);
    DM1.cdsCabLiq.Open;
    Try
      FLiquidacionBeneficio := TFLiquidacionBeneficio.create(Self);
      FLiquidacionBeneficio.ShowModal;
    Finally
      FLiquidacionBeneficio.Free;
    End;
  End;
End;

procedure TFBuscaLiqBeneficios.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
 If Key = #13 Then
    begin
     Key := #0;
     Perform(CM_DIALOGKEY, VK_TAB, 0);
    end;
end;

Procedure TFBuscaLiqBeneficios.dbgLiquidacionBeneficiosDblClick(Sender: TObject);
Var xSql:String;
Begin
  If DM1.cdsCabLiq.RecordCount = 0 Then
  Begin
   MessageDlg('No existe ninguna liquidación para mostrar', mtInformation, [mbOk], 0);
   Exit;
  End;
  Try
    FLiquidacionBeneficio := TFLiquidacionBeneficio.create(Self);
    FLiquidacionBeneficio.ShowModal;
  Finally
    FLiquidacionBeneficio.Free;
  End;
  If DM1.xSgr = 'G' Then
  Begin
    // Inicio: HPC_201810_PRE
    // xSql := 'SELECT A.*, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'') PVSLFECBE,  B.BENEFDES, C.PVSESTDES, D.FORSOLBEN, D.PVSTIPRET'
    xSql := 'select a.ciaid, a.pvslbennr, a.pvsltipbe, a.asoid, a.asocodmod, a.asocodaux, a.pvslulap, a.pvsltaap, a.pvslestad, a.pvsexpnro,'
    +' a.usuario, a.freg, a.hreg, a.pvsestliq, a.pvsfanul, a.pvsusuanul, a.pvsmotanul, a.cntanomm, a.tipocont, a.cntflag, a.pvscobaso, a.asoapenomdni,'
    +' a.tipdoccod, a.asodocnum, a.useid, a.upagoid, a.uproid, a.asodir, a.zipid, a.asodeslab, a.asodirlab, a.asodstlabid, a.asoresnom, a.asofresnom,'
    +' a.asorescese, a.asofrescese, a.asoncta, a.monliqben, a.mondes, a.mondev, a.monpag, a.asodni, a.asotelf1, a.codotrdocide, a.numotrdocide, a.autdesapo,'
    +' a.fecautdesapo, a.pvstipret, a.numopeban, a.fecopeban, a.numbenori, a.diferido, a.fecdifliq, TO_CHAR(a.pvslfecbe, ''DD/MM/YYYY'') pvslfecbe,'
    +' b.benefdes, c.pvsestdes, d.forsolben, d.ofioriexp'
    +' FROM PVS306 A, TGE186 B, PVS102 C, PVS301 D'
    +' WHERE A.PVSLBENNR = '+QuotedStr(DM1.numeroLiquidacion)+' AND A.PVSLTIPBE  = B.TIPBENEF'
    +' AND A.ASOID = D.ASOID AND A.PVSEXPNRO = D.PVSEXPNRO'
    +' AND A.PVSESTLIQ = C.PVSESTDSG'
    +' AND C.PVSDOC    = ''L'''
    +' ORDER BY A.PVSLFECBE DESC';
    // Fin: HPC_201810_PRE
    DM1.cdsCabLiq.Close;
    DM1.cdsCabLiq.DataRequest(xSql);
    DM1.cdsCabLiq.Open;
    dbgLiquidacionBeneficios.Refresh;
    If DM1.xanula = 'S' Then
    Begin
      // Inicio: HPC_201810_PRE
      // xSql := 'SELECT A.*, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'') PVSLFECBE,  B.BENEFDES, C.PVSESTDES, D.FORSOLBEN, D.PVSTIPRET'
      xSql := 'select a.ciaid, a.pvslbennr, a.pvsltipbe, a.asoid, a.asocodmod, a.asocodaux, a.pvslulap, a.pvsltaap, a.pvslestad, a.pvsexpnro,'
      +' a.usuario, a.freg, a.hreg, a.pvsestliq, a.pvsfanul, a.pvsusuanul, a.pvsmotanul, a.cntanomm, a.tipocont, a.cntflag, a.pvscobaso, a.asoapenomdni,'
      +' a.tipdoccod, a.asodocnum, a.useid, a.upagoid, a.uproid, a.asodir, a.zipid, a.asodeslab, a.asodirlab, a.asodstlabid, a.asoresnom, a.asofresnom,'
      +' a.asorescese, a.asofrescese, a.asoncta, a.monliqben, a.mondes, a.mondev, a.monpag, a.asodni, a.asotelf1, a.codotrdocide, a.numotrdocide, a.autdesapo,'
      +' a.fecautdesapo, a.pvstipret, a.numopeban, a.fecopeban, a.numbenori, a.diferido, a.fecdifliq, TO_CHAR(a.pvslfecbe, ''DD/MM/YYYY'') pvslfecbe,'
      +' b.benefdes, c.pvsestdes, d.forsolben, d.ofioriexp'
      // Inicio: HPC_201810_PRE
      +'  FROM PVS306 A, TGE186 B, PVS102 C, PVS301 D'
      +' WHERE A.PVSLBENNR = '+QuotedStr(DM1.numeroLiquidacion)+' AND '
      +' A.ASOID = D.ASOID AND A.PVSEXPNRO = D.PVSEXPNRO AND '
      +'       A.PVSLTIPBE = B.TIPBENEF AND '
      +'       A.PVSESTLIQ = C.PVSESTDSG AND '
      +'       C.PVSDOC    = ''L'' ';
      // Fin: HPC_201810_PRE
      DM1.cdsCabLiq.Close;
      DM1.cdsCabLiq.DataRequest(xSql);
      DM1.cdsCabLiq.Open;
      Try
        FLiquidacionBeneficio := TFLiquidacionBeneficio.create(Self);
        FLiquidacionBeneficio.ShowModal;
      Finally
        FLiquidacionBeneficio.Free;
      End;
      DM1.xanula := 'N';
    End;
    //Fin: SPP_201401_PRE
  End;
End;

Procedure TFBuscaLiqBeneficios.btnBuscarClick(Sender: TObject);
Var xSql :String;
Begin
  // Inicio: SPP_201306_PRE Se añade el campo que guarda el origen de la forma de solicitud del expediente
  // If rgbusca.ItemIndex = 0 Then xWhere := ' AND ASOAPENOMDNI LIKE '+QuotedStr(Trim(mebusca.Text)+'%');
  // If rgbusca.ItemIndex = 1 Then xWhere := ' AND PVSLBENNR = '+QuotedStr(Trim(mebusca.Text));
  // If rgbusca.ItemIndex = 2 Then xWhere := ' AND ASOCODMOD = '+QuotedStr(Trim(mebusca.Text));
  //Cambio de performance en query - HPP_200903_PRE
  // xSql := 'SELECT A.*, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'') PVSLFECBE,  B.BENEFDES, C.PVSESTDES FROM PVS306 A, TGE186 B, PVS102 C'
  //       +' WHERE A.PVSLTIPBE = B.TIPBENEF(+) AND A.PVSESTLIQ = C.PVSESTDSG(+) ANDC.PVSDOC    = '+QuotedStr('L')
  //       +xWhere+' ORDER BY A.PVSLFECBE DESC';
  If rgbusca.ItemIndex = 0 Then xWhere := ' AND A.ASOAPENOMDNI LIKE '+QuotedStr(Trim(mebusca.Text)+'%');
  If rgbusca.ItemIndex = 1 Then xWhere := ' AND A.PVSLBENNR = '+QuotedStr(Trim(mebusca.Text));
  If rgbusca.ItemIndex = 2 Then xWhere := ' AND A.ASOCODMOD = '+QuotedStr(Trim(mebusca.Text));

   // Inicio: HPC_201810_PRE
   // Se añade el campo ofidina del expediente
   // xSql := 'SELECT A.*, TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'') PVSLFECBE,  B.BENEFDES, C.PVSESTDES, D.FORSOLBEN FROM PVS306 A, TGE186 B, PVS102 C, PVS301 D'
   xSql := 'SELECT '
   +'       A.ciaid, A.pvslbennr, A.pvsltipbe, A.pvslfecbe, A.asoid, A.asocodmod, A.asocodaux, A.pvslapnom_xx, A.pvsldni_xx, A.pvsldir_xx, A.pvsldpto_xx, A.pvslprov_xx, A.pvsldist_xx,'
   +'       A.pvslceed_xx, A.pvslcedp_xx, A.pvslcepr_xx, A.pvslcedi_xx, A.pvslupri_xx, A.pvsluprn_xx, A.pvslupai_xx, A.pvslupan_xx, A.pvslusei_xx, A.pvslusen_xx, A.pvslnres_xx, A.pvslfres_xx,'
   +'       A.pvslnces_xx, A.pvslfces_xx, A.pvslulap, A.pvsltaap, A.pvslnvou_xx, A.pvslestad, A.forpagoid_xx, A.bancoid_xx, A.pvslncta_xx, A.pvsexpnro, A.pvsldesnm_xx, A.pvsltben_xx, A.pvsltdev_xx,'
   +'       A.pvsltdsc_xx, A.pvslsald_xx, A.pvsltpre_xx, A.pvslsldp_xx, A.pvstinnc_xx, A.pvstpran_xx, A.pvslobs_xx, A.usuario, A.freg, A.hreg, A.pvslnofc_xx, A.pvsestliq, A.pvslfpago_xx, A.agenbcoid_xx,'
   +'       A.pvsltcre_xx, A.pvsfanul, A.pvsusuanul, A.pvsmotanul, A.cntanomm, A.tipocont, A.cntflag, A.pvslliqant_xx, A.pvscobaso, A.asoapenomdni, A.tipdoccod, A.asodocnum, A.useid, A.upagoid, A.uproid,'
   +'       A.asodir, A.zipid, A.asodeslab, A.asodirlab, A.asodstlabid, A.asoresnom, A.asofresnom, A.asorescese, A.asofrescese, A.pvsultapo_xx, A.asoncta, A.monliqben, A.mondes, A.mondev, A.monpag, A.asodni,'
   +'       A.asotelf1, A.codotrdocide, A.numotrdocide, A.autdesapo, A.fecautdesapo, A.pvstipret, A.numopeban, A.fecopeban, A.numbenori, A.diferido, A.fecdifliq, A.forsolben, A.flades, A.usudes, A.fecdes,'
   +'       TO_CHAR(A.PVSLFECBE, ''DD/MM/YYYY'') PVSLFECBE,  B.BENEFDES, C.PVSESTDES, D.FORSOLBEN, D.OFIORIEXP FROM PVS306 A, TGE186 B, PVS102 C, PVS301 D'
   +' WHERE A.PVSLTIPBE = B.TIPBENEF AND A.PVSESTLIQ = C.PVSESTDSG AND C.PVSDOC = '+QuotedStr('L')
   +xWhere
   // Inicio: HPC_201802_PRE
   // Se modifica el Qry de busqueda
   // +' AND A.ASOID = D.ASOID(+) AND A.PVSLBENNR = D.PVSLBENNR(+) ORDER BY A.PVSLFECBE DESC';
   +' AND A.ASOID = D.ASOID(+) AND A.PVSEXPNRO = D.PVSEXPNRO(+) ORDER BY A.PVSLFECBE DESC';
   // Fin: HPC_201802_PRE
   // Fin: HPC_201810_PRE
   DM1.cdsCabLiq.Close;
   DM1.cdsCabLiq.DataRequest(xSql);
   DM1.cdsCabLiq.Open;
End;

procedure TFBuscaLiqBeneficios.btncerrarClick(Sender: TObject);
begin
  FBuscaLiqBeneficios.Close;
end;

procedure TFBuscaLiqBeneficios.rgbuscaClick(Sender: TObject);
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

End.
