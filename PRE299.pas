unit PRE299;
// Inicio Uso Estándares : 01/08/2011
// Unidad                : Previsión Social
// Formulario            : FFecCargo
// Fecha de Creación     : 20/09/2011
// Autor                 : Hugo Noriega
// Objetivo              : Mantenimiento de Hoja de Cargo
// Actualizaciones
// HPC_201607_PRE        : Creación del Formulario
// HPC_201810_PRE        : Se añade pregunta de grabación en la hoja de cargo y modificación del evento en la
//                         impresión de hoja de cargo

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ExtCtrls, wwdbdatetimepicker, wwdblook,
  Wwdbdlg, ppBands, ppCtrls, jpeg, ppPrnabl, ppClass, ppCache, ppComm,
  ppRelatv, ppProd, ppReport;

type
  TFFecCargo = class(TForm)
    btnCerrar: TBitBtn;
    btnGrabar: TBitBtn;
    Label4: TLabel;
    pprHojaCargoExp: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppImage3: TppImage;
    ppLabel190: TppLabel;
    ppLblCodCarExp: TppLabel;
    ppLblTitular: TppLabel;
    pplblDNI: TppLabel;
    pplblTelefonos: TppLabel;
    pplblCorreo: TppLabel;
    pplblFechaHora: TppLabel;
    pplblUsuario: TppLabel;
    pplblOficina: TppLabel;
    ppLabel208: TppLabel;
    ppLabel167: TppLabel;
    ppLabel168: TppLabel;
    ppLabel169: TppLabel;
    ppLabel184: TppLabel;
    ppLabel188: TppLabel;
    ppLabel189: TppLabel;
    ppLabel191: TppLabel;
    ppLabel192: TppLabel;
    ppLine14: TppLine;
    ppLabel195: TppLabel;
    ppLabel202: TppLabel;
    pplfechahoraimpresion: TppLabel;
    ppDetailBand6: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    pnlCab: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dblcdUsuario: TwwDBLookupComboDlg;
    dtpFecha: TwwDBDateTimePicker;
    PanelAso: TPanel;
    meAsociado: TMaskEdit;
    Label5: TLabel;
    PanelOfi: TPanel;
    meOficina: TMaskEdit;
    PanelUsu: TPanel;
    meUsuario: TMaskEdit;
    btnAnular: TBitBtn;
    Label6: TLabel;
    Panel1: TPanel;
    meCargo: TMaskEdit;
    lblFechaHora: TLabel;
    ppLabel1: TppLabel;
    pplFCargo: TppLabel;
    procedure btnGrabarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblcdUsuarioChange(Sender: TObject);
    procedure btnAnularClick(Sender: TObject);
 //Inicio HPC_201810_PRE
 //Se añade pregunta de grabación en la hoja de cargo y modificación del evento en laimpresión de hoja de cargo
 // procedure pprHojaCargoExpPreviewFormCreate(Sender: TObject);
    procedure pprHojaCargoExpPrintingComplete(Sender: TObject);
 //Final HPC_201810_PRE
  private
    { Private declarations }
    procedure fn_muestra_msj_hoja_cargo_exp(psAsoid : string);
  public
    { Public declarations }
    sExpedienteBen : String;
    Flag_Anular : String;
    dFechaExp : tDate ;
  end;

var
  FFecCargo: TFFecCargo;

implementation

uses PREDM, DB, PRE235;

{$R *.dfm}

procedure TFFecCargo.btnGrabarClick(Sender: TObject);
var
   xsSql : String;
   xsCODCAREXP : String;
begin
   If dtpFecha.Date > DM1.FechaSys Then
   Begin
      MessageDlg('Fecha de recepción no puede ser mayor al día de hoy.', mtError, [mbOk], 0);
      dtpFecha.Text := '';
      dtpFecha.SetFocus;
      Exit;
   End;

   If Length((meUsuario.Text)) <= 0 Then
   Begin
      MessageDlg('Debe Registra el Usuario que registro la Hoja de Cargo', mtError, [mbOk], 0);
      dblcdUsuario.SetFocus;
      Exit;
   End;

   If Length((meOficina.Text)) <= 0 Then
   Begin
      MessageDlg('El Usuario no esta asignado a una Oficina', mtError, [mbOk], 0);
      dblcdUsuario.SetFocus;
      Exit;
   End;

  if dFechaExp>0then
  If dFechaExp < dtpFecha.Date Then
  Begin
     MessageDlg('Fecha de recepción no puede ser menor a la fecha de la Hoja de Cargo ('
                 +dtpFecha.Text+').' , mtError, [mbOk], 0);
     Exit;
  end;

   // Inicio: HPC_201810_PRE
   // Se confirma la grabación de la hoja de cargo
   If MessageDlg('¿Confirmar grabación de hoja de Cargo?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
      xsSql:='SELECT DB2ADMIN.PCK_PRE_CARGO_EXPEDIENTE.SF_PRE_OBTIENE_CODIGO_PENDIENT '
        + ' (' + QuotedStr(DM1.cdsQry27.FieldByName('OFDESID').AsString) + ', ' + QuotedStr(dblcdUsuario.Text) + ', '
        +        QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString) + ', '
        +       'TO_DATE(' + QuotedStr(dtpFecha.Text) + ',''DD/MM/YYYY'') ) CODCAREXP '
        + '  FROM DUAL ';
      DM1.cdsQry5.Close;
      DM1.cdsQry5.DataRequest(xsSql);
      DM1.cdsQry5.Open;
      If DM1.cdsQry5.FieldByName('CODCAREXP').AsString = 'NULL' Then
      Begin
         MessageDlg('Solo se pueden crear Hojas de Cargo para asociado del tipo ''DO'' y ''CE'' ', mtError, [mbOk], 0);
         Exit;
      End;
      if sExpedienteBen<>'' then
      begin
         xsCODCAREXP := DM1.cdsQry5.fieldbyname('CODCAREXP').AsString;
         xsSql:='UPDATE DB2ADMIN.PVS301 SET CODCAREXP='''+xsCODCAREXP+''' '
           + 'WHERE ASOID='''+DM1.cdsAsociado.FieldByName('ASOID').AsString+''' '
           +  ' and PVSEXPNRO='''+sExpedienteBen+'''';
         DM1.DCOM1.AppServer.EjecutaSQL(xsSql);
      end;

      xsSql := 'SELECT A.CODCAREXP, SUBSTR(A.CODCAREXP, 1, 4) ANHO, SUBSTR(A.CODCAREXP,5,8) CORRELATIVO, C.ASOAPENOM,'
      +' C.ASODNI, C.ASOTELF1||'' / ''||C.ASOTELF2 TELEFONOS,'
      +' C.ASOEMAIL, TO_CHAR(A.FECREG,''DD/MM/YYYY HH24:MI:SS'') FECHA_HORA,'
      +' UPPER(NVL(G.USERNOM ,A.USERID)) USUARIO, E.OFDESNOM'
      +' FROM PRE_CARGO_EXPEDIENTE_MOV A, APO201 C, APO110 E, TGE006 G'
      +' WHERE A.CODCAREXP = '+QuotedStr(DM1.cdsQry5.FieldByName('CODCAREXP').AsString)
      +' AND A.CODCAREXPEST = ''PENDIENTE'' AND A.ASOID = C.ASOID AND A.OFDESID = E.OFDESID AND A.USERID = G.USERID(+)';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xsSql);
      DM1.cdsQry.Open;
      IF DM1.cdsQry.RecordCount = 1 THEN
      BEGIN
         ppLblCodCarExp.Text := 'N° '+DM1.cdsQry.FieldByName('ANHO').AsString+'-'+DM1.cdsQry.FieldByName('CORRELATIVO').AsString+'-PS';
         ppLblTitular.Text   := DM1.cdsQry.FieldByName('ASOAPENOM').AsString;
         pplblDNI.Text       := DM1.cdsQry.FieldByName('ASODNI').AsString;
         pplblTelefonos.Text := DM1.cdsQry.FieldByName('TELEFONOS').AsString;
         pplblCorreo.Text    := DM1.cdsQry.FieldByName('ASOEMAIL').AsString;
         pplFCargo.Text      := dtpFecha.Text;
         pplblFechaHora.Text := DM1.cdsQry.FieldByName('FECHA_HORA').AsString;
         pplblUsuario.Text   := DM1.cdsQry.FieldByName('USUARIO').AsString;
         pplblOficina.Text   := DM1.cdsQry.FieldByName('OFDESNOM').AsString;
         xsSql := 'SELECT FECHA, USERID FROM (SELECT B.FECHA, B.USERID ,DENSE_RANK() OVER(PARTITION BY A.CODCAREXP ORDER BY B.NUMIMP DESC) DNRK'
         +' FROM PRE_CARGO_EXPEDIENTE_MOV A, PRE_CARGO_EXPEDIENTE_IMP_MAE B'
         +' WHERE A.ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND A.CODCAREXPEST = ''PENDIENTE'' AND A.CODCAREXP = B.CODCAREXP)'
         +' WHERE DNRK = 1';
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xsSql);
         DM1.cdsQry.Open;
         pplfechahoraimpresion.Caption := DM1.cdsQry.FieldByName('FECHA').AsString;
         pprHojaCargoExp.Print;
      END
      ELSE
      BEGIN
         MessageDlg('No existe un registro de la hoja de cargo en la base de datos!', mtInformation, [mbOk], 0);
      END;
      fn_muestra_msj_hoja_cargo_exp(DM1.cdsAsociado.FieldByName('ASOID').AsString);
      meCargo.Text:= DM1.cdsQry5.FieldByName('CODCAREXP').AsString;
      btnGrabar.Enabled:=False;
      pnlCab.Enabled:=False;
   End;
   // Fin: HPC_201810_PRE
end;

// MUESTRA MENSAJE DE HOJA DE CARGO DE EXPEDIENTE
procedure TFFecCargo.fn_muestra_msj_hoja_cargo_exp(psAsoid : string);
var xsSql : string;
begin
   xsSql := 'SELECT A.FECHA FECHA_HORA, NVL(B.USERNOM, A.USERID) USUARIO FROM'
   +' (SELECT B.FECHA, B.USERID ,DENSE_RANK() OVER(PARTITION BY A.CODCAREXP ORDER BY B.NUMIMP DESC) DNRK'
   +' FROM PRE_CARGO_EXPEDIENTE_MOV A, PRE_CARGO_EXPEDIENTE_IMP_MAE B'
   +' WHERE A.ASOID = '+QuotedStr(psAsoid)+' AND A.CODCAREXPEST = ''PENDIENTE'' AND A.CODCAREXP = B.CODCAREXP) A, TGE006 B'
   +' WHERE A.USERID = B.USERID AND A.DNRK = 1';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xsSql);
   DM1.cdsQry.Open;
end;


procedure TFFecCargo.FormActivate(Sender: TObject);
var
  xSQL : String;
begin
  meAsociado.Text := DM1.cdsAsociado.FieldByName('ASOAPENOM').AsString;
  xSQL:= 'SELECT distinct B.USERID, C.USERNOM, C.OFDESID, D.OFDESNOM '
       +  ' FROM TGE001 A, '
       +       ' TGE007 B, '
       +       ' TGE006 C, '
       +       ' APO110 D  '
       + ' WHERE A.MODULOID IN (''PRE'',''ASO'') AND A.TIPO=''0'' '
       +   ' AND A.GRUPOID=B.GRUPOID '
       +   ' AND B.USERID=C.USERID '
       +   ' AND C.OFDESID=D.OFDESID ';
  DM1.cdsQry27.Close;
  DM1.cdsQry27.DataRequest( xSQL );
  DM1.cdsQry27.Open;

  dblcdUsuario.LookupTable:=DM1.cdsQry27;
  dblcdUsuario.LookupField:='USERID';


  dblcdUsuario.Selected.Clear;
  dblcdUsuario.Selected.Add('USERID'#9'15'#9'Usuario'#9#9);
  dblcdUsuario.Selected.Add('USERNOM'#9'30'#9'Nombre de usuario'#9#9);
  dblcdUsuario.Selected.Add('OFDESID'#9'08'#9'Oficina'#9#9);
  dblcdUsuario.Selected.Add('OFDESNOM'#9'25'#9'Nombre de Oficina'#9#9);

  pnlCab.Enabled:=True;

  xSQL:='SELECT A.CODCAREXP, B.USERID, B.FECHA '
       + ' FROM PRE_CARGO_EXPEDIENTE_MOV A, PRE_CARGO_EXPEDIENTE_EST_MOV B '
       +' WHERE A.ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)
       +  ' AND A.CODCAREXPEST = ''PENDIENTE'' '
       +  ' AND A.CODCAREXP=B.CODCAREXP(+) '
       + ' order by B.FECREG';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest( xSQL );
  DM1.cdsQry.Open;
  if DM1.cdsQry.RecordCount>0 then
  begin
     dtpFecha.Date :=  StrToDate(Copy(DM1.cdsQry.FieldByName('FECHA').AsString,1,10));
     if Length(trim(DM1.cdsQry.FieldByName('FECHA').AsString))>10 then
        lblFechaHora.Caption:=DM1.cdsQry.FieldByName('FECHA').AsString
     else
        lblFechaHora.Caption:='';
     DM1.cdsQry27.Locate('UserId',DM1.cdsQry.FieldByName('USERID').AsString,[]);
     dblcdUsuario.Text := DM1.cdsQry.FieldByName('USERID').AsString;
     meCargo.Text := DM1.cdsQry.FieldByName('CODCAREXP').AsString;
     btnGrabar.Visible:=False;
     if Flag_Anular='S'then
        btnAnular.Visible:=True
     else
        btnAnular.Visible:=False;
     pnlCab.Enabled:=False;
  end
  else
  begin
     pnlCab.Enabled:=True;
     lblFechaHora.Caption:='';
     btnGrabar.Visible:=True;
     btnAnular.Visible:=False;
     dtpFecha.Date := Date;
  end;
end;

procedure TFFecCargo.btnCerrarClick(Sender: TObject);
begin
   Close;
end;

procedure TFFecCargo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM1.cdsQry27.Close;
end;

procedure TFFecCargo.dblcdUsuarioChange(Sender: TObject);
begin
   meUsuario.Text := DM1.cdsQry27.FieldByName('USERNOM').AsString;
   meOficina.Text := DM1.cdsQry27.FieldByName('OFDESNOM').AsString;
end;

procedure TFFecCargo.btnAnularClick(Sender: TObject);
var
  xSQL, sCODCAREXP : String;
begin
  If MessageDlg('¿ Seguro de Anular la Hoja de Cargo ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
  Begin
    sCODCAREXP:=meCargo.Text;

    xSQL:='delete FROM PRE_CARGO_EXPEDIENTE_EST_MOV A WHERE CODCAREXP='''+sCODCAREXP+'''';
    xSQL:='update PRE_CARGO_EXPEDIENTE_EST_MOV '
         +  ' set CODCAREXPEST = ''ANULADA'' '
         + 'WHERE CODCAREXP='''+sCODCAREXP+'''';
    DM1.cdsQry.Close;
    DM1.cdsQry.DataRequest(xSql);
    DM1.cdsQry.Execute;

    xSQL:='delete FROM PRE_CARGO_EXPEDIENTE_IMP_MAE A WHERE CODCAREXP='''+sCODCAREXP+'''';
    DM1.cdsQry.Close;
    DM1.cdsQry.DataRequest(xSql);
    DM1.cdsQry.Execute;

    xSQL:='delete FROM PRE_CARGO_EXPEDIENTE_MOV '
         + 'where asoid='+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString);
    xSQL:='update PRE_CARGO_EXPEDIENTE_MOV '
         +  ' set CODCAREXPEST = ''ANULADA'' '
         + 'where asoid='+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString);
    DM1.cdsQry.Close;
    DM1.cdsQry.DataRequest(xSql);
    DM1.cdsQry.Execute;
    MessageDlg('Fecha de Cargo Anulada', mtInformation, [mbOk], 0);
    Close;
  End;
end;

//Inicio HPC_201810_PRE
//Se pasa en eventa  CargoExpPrintingComplete
//procedure TFFecCargo.pprHojaCargoExpPreviewFormCreate(Sender: TObject);
//Var
//   xsSql:String;
//begin
//   xsSql :=
//      'BEGIN DB2ADMIN.PCK_PRE_CARGO_EXPEDIENTE.SP_PRE_GUARDA_IMPRESION(''S'', ' + QuotedStr(DM1.cdsQry5.FieldByName('CODCAREXP').AsString) + ', ' + QuotedStr(DM1.wUsuario) + '); END;';
//   DM1.DCOM1.AppServer.EjecutaSql(xsSQL);
//   xsSql := 'SELECT FECHA, USERID FROM (SELECT B.FECHA, B.USERID ,DENSE_RANK() OVER(PARTITION BY A.CODCAREXP ORDER BY B.NUMIMP DESC) DNRK'
//   +' FROM PRE_CARGO_EXPEDIENTE_MOV A, PRE_CARGO_EXPEDIENTE_IMP_MAE B'
//   +' WHERE A.ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND A.CODCAREXPEST = ''PENDIENTE'' AND A.CODCAREXP = B.CODCAREXP)'
//   +' WHERE DNRK = 1';
//   DM1.cdsQry.Close;
//   DM1.cdsQry.DataRequest(xsSql);
//   DM1.cdsQry.Open;
//   pplfechahoraimpresion.Caption := DM1.cdsQry.FieldByName('FECHA').AsString;
//end;

procedure TFFecCargo.pprHojaCargoExpPrintingComplete(Sender: TObject);
Var
   xsSql:String;
begin
   xsSql :=
      'BEGIN DB2ADMIN.PCK_PRE_CARGO_EXPEDIENTE.SP_PRE_GUARDA_IMPRESION(''S'', ' + QuotedStr(DM1.cdsQry5.FieldByName('CODCAREXP').AsString) + ', ' + QuotedStr(DM1.wUsuario) + '); END;';
   DM1.DCOM1.AppServer.EjecutaSql(xsSQL);
   xsSql := 'SELECT FECHA, USERID FROM (SELECT B.FECHA, B.USERID ,DENSE_RANK() OVER(PARTITION BY A.CODCAREXP ORDER BY B.NUMIMP DESC) DNRK'
   +' FROM PRE_CARGO_EXPEDIENTE_MOV A, PRE_CARGO_EXPEDIENTE_IMP_MAE B'
   +' WHERE A.ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND A.CODCAREXPEST = ''PENDIENTE'' AND A.CODCAREXP = B.CODCAREXP)'
   +' WHERE DNRK = 1';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xsSql);
   DM1.cdsQry.Open;
   pplfechahoraimpresion.Caption := DM1.cdsQry.FieldByName('FECHA').AsString;
end;
//Final HPC_201810_PRE
end.
