unit PRE202;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Wwdotdot, Wwdbcomb, Wwdbdlg, StdCtrls, wwdblook, Mask, wwdbedit, Buttons,
  ExtCtrls, wwdbdatetimepicker, DBCtrls, ComCtrls, Grids, Wwdbigrd,
  Wwdbgrid,DB, Wwdbspin, wwriched, fcButton, fcImgBtn, fcShapeBtn, fcLabel;

type
  TFRetencionesJudiciales = class(TForm)
    pnlCabecera: TPanel;
    Panel2: TPanel;
    dbeDescripCia: TwwDBEdit;
    dblcCia: TwwDBLookupCombo;
    dbeNroCarta: TwwDBEdit;
    dbdtpFecRecepcion: TwwDBDateTimePicker;                                                 
    Panel3: TPanel;
    Bevel3: TBevel;
    dblcEstRetJud: TwwDBLookupCombo;
    dbeEstRetJud: TwwDBEdit;
    dbeCodModular: TwwDBEdit;
    dbeEstAsoc: TwwDBEdit;
    dbeDNI: TwwDBEdit;
    dbeUProceso: TwwDBEdit;
    dbeUPago: TwwDBEdit;
    dbeUSE: TwwDBEdit;
    chkVigente: TCheckBox;
    dbeCodAsociado: TwwDBEdit;
    sbtnAceptar: TfcShapeBtn;
    sbtnCancelar: TfcShapeBtn;
    pnlDetRetJudicial: TPanel;
    Bevel1: TBevel;
    fcLabel1: TfcLabel;
    dbgDetRetJudicial: TwwDBGrid;
    IbDetalleCarta: TwwIButton;
    pnlDetRetJud: TPanel;
    Bevel2: TBevel;
    dbeApePatD: TwwDBEdit;
    dbeApeMatD: TwwDBEdit;
    dbeDetNombD: TwwDBEdit;
    dblcDpto: TwwDBLookupCombo;
    dbeDescDpto: TwwDBEdit;
    dbdtpFecRec: TwwDBDateTimePicker;
    sbtnAceptarDetalle: TfcShapeBtn;
    sbtnCancelarDetalle: TfcShapeBtn;
    dbeNroOficio: TwwDBEdit;
    dbeValor: TwwDBEdit;
    dbeEstado: TwwDBEdit;
    rgTipo: TRadioGroup;
    dbdtpFecOper: TwwDBDateTimePicker;
    dbreObs: TwwDBRichEdit;
    dbeApeNom: TwwDBEdit;
    Label1: TLabel;
    dbeJuzgado: TwwDBEdit;
    dbeNroExped: TwwDBEdit;
    procedure sbtnCancelarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbeCodAsociadoExit(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure sbtnAceptarClick(Sender: TObject);
    procedure chkVigenteClick(Sender: TObject);
    procedure dblcEstRetJudExit(Sender: TObject);
    procedure sbtnCancelarDetalleClick(Sender: TObject);
    procedure sbtnAceptarDetalleClick(Sender: TObject);
    procedure bbtnBuscarClick(Sender: TObject);
    procedure dbgDetRetJudicialDblClick(Sender: TObject);
    procedure IbDetalleCartaClick(Sender: TObject);
    procedure dblcDptoExit(Sender: TObject);
    procedure dbeValorExit(Sender: TObject);
    procedure dbeValorKeyPress(Sender: TObject; var Key: Char);
    procedure dblcCiaKeyPress(Sender: TObject; var Key: Char);
    procedure rgTipoExit(Sender: TObject);
    procedure dbeApeNomExit(Sender: TObject);
    procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    function NroRetenciones:Integer;
    function NroDetRetenciones:Integer;
    function ValidaDatosRetencion:Boolean;
    function ValidaDatosDetalleRetencion:Boolean;
    procedure LlenaDetalleRetencion;
    function Porcentaje : Integer;    
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rgTipoClick(Sender: TObject);
//    function Porcentaje : Integer;
    procedure LlenaDatos(xCodAso: String);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  FRetencionesJudiciales: TFRetencionesJudiciales;
  xAsoId, xUseId, xUProId, xUPagoId, xSitAso : String;
  xPorcentaje : Integer;
  xNroRet, xNroDetRet : Integer;
  xGraba : Boolean;

implementation

uses MsgDlgs, PREDM, PRE001, PRE262;

//USES ;
{$R *.DFM}

procedure TFRetencionesJudiciales.sbtnCancelarClick(Sender: TObject);
begin
   DM1.cdsMaestRetJud.CancelUpdates;
   Close;
end;

procedure TFRetencionesJudiciales.FormActivate(Sender: TObject);
var
   xSQL, xWhere : String;
begin
   xGraba := False;
   xSQL := 'Select PVSESTDSG, PVSESTDES, PVSDOC From PVS102'
          +' Where PVSDOC ='+QuotedStr('R');

   DM1.cdsEstCarta.Filter   := '';
   DM1.cdsEstCarta.Filtered := False;
   DM1.cdsEstCarta.IndexFieldNames := '';
   DM1.cdsEstCarta.Close;
   DM1.cdsEstCarta.DataRequest(xSQL);
   DM1.cdsEstCarta.Open;
   DM1.cdsEstCarta.IndexFieldNames := 'PVSESTDSG';

//Si se encuentra en Modo Inserción
   If DM1.wModo = 'A' Then
    begin
//Para Activar los Controles
     Panel2.Enabled := True;
     Panel3.Enabled := True;
     IbDetalleCarta.Enabled := True;
     sbtnAceptarDetalle.Enabled  := True;
     sbtnCancelarDetalle.Enabled := True;
     dbeJuzgado.Enabled   := True;
     dbeApePatD.Enabled   := True;
     dbeApeMatD.Enabled   := True;
     dbeDetNombD.Enabled  := True;
     dblcDpto.Enabled     := True;
     dbdtpFecRec.Enabled  := True;
     dbeNroOficio.Enabled := True;
     rgTipo.Enabled    := True;
     dbeValor.Enabled  := True;
     dbeEstado.Enabled := True;
     dbreObs.Enabled   := True;
//
     DM1.cdsMaestRetJud.IndexFieldNames := 'RTJNRO; ASOID';

     DM1.cdsMaestRetJud.Append;
     xWhere := '';
     DM1.cdsMaestRetJud.FieldByName('RTJNRO').AsString    := DM1.StrZero(DM1.UltimoNum('prvSQL', 'PVS304', 'RTJNRO', xWhere), 7);
     DM1.cdsMaestRetJud.FieldByName('RTJFREC').AsDateTime := Date;
     DM1.cdsMaestRetJud.FieldByName('RTJFEST').AsDateTime := Date;
     DM1.cdsMaestRetJud.FieldByName('RTJESTAD').AsString  := '01';
     DM1.cdsMaestRetJud.FieldByName('CIAID').AsString     := '02';
     dblcEstRetJudExit(Sender);
     dblcCiaExit(Sender);

     xSQL := 'Select * From PVS305'
            +' Where ASOID ='+QuotedStr('');

     DM1.cdsDetRetJud.Filter   := '';
     DM1.cdsDetRetJud.Filtered := False;
     DM1.cdsDetRetJud.IndexFieldNames := '';
     DM1.cdsDetRetJud.Close;
     DM1.cdsDetRetJud.DataRequest(xSQL);
     DM1.cdsDetRetJud.Open;
     pnlDetRetJud.Visible := False;

     dbgDetRetJudicial.Selected.Clear;
     dbgDetRetJudicial.Selected.Add('RTJCORR'#9'8'#9'Nro~Retención'#9'T');
     dbgDetRetJudicial.Selected.Add('RTJJUZG'#9'60'#9'Juzgado'#9'T');
     dbgDetRetJudicial.Selected.Add('RTJAPEPAT'#9'25'#9'Apellido~Paterno'#9'T');
     dbgDetRetJudicial.Selected.Add('RTJAPEMAT'#9'25'#9'Apellido~Materno'#9'T');
     dbgDetRetJudicial.Selected.Add('RTJNOMBR'#9'25'#9'Nombres'#9'T');
     dbgDetRetJudicial.Selected.Add('RTJDPTOID'#9'2'#9'Dpto~Id'#9'T');
     dbgDetRetJudicial.Selected.Add('RTJFREC'#9'10'#9'Fecha~Recepción'#9'T');
     dbgDetRetJudicial.Selected.Add('RTJNOFIC'#9'12'#9'Nro~Oficio'#9'T');
     dbgDetRetJudicial.Selected.Add('RTJPORC'#9'5'#9'Porcentaje'#9'T');
     dbgDetRetJudicial.Selected.Add('RTJIMPOR'#9'15'#9'Importe'#9'T');
     dbgDetRetJudicial.Selected.Add('RTJOBS'#9'50'#9'Observaciones'#9'T');
     dbgDetRetJudicial.ApplySelected;
     DM1.cdsDetRetJud.First;

     dbeCodModular.Clear;         dbeUProceso.Clear;
     dbeUPago.Clear;              dbeUSE.Clear;
     dbeDNI.Clear;                dbeEstAsoc.Clear;
     dblcCia.Enabled := True;     dbeApeNom.Enabled := True;
     dblcCia.SetFocus;
    end;
//Si se encuentra en Modo Edición
   If DM1.wModo = 'M' Then
    begin
     //Para Verificar si el Asociado ha sido LIQUIDADO
     xWhere := ' ASOID ='+QuotedStr(DM1.cdsSQL.FieldByName('ASOID').AsString)
              +' And PVSESTADO ='+QuotedStr('02');
     If Length(DM1.DisplayDescrip('prvSQL', 'PVS301', 'PVSESTADO', xWhere, 'PVSESTADO')) > 0 Then
      begin
       Panel2.Enabled := False;
       Panel3.Enabled := False;
       IbDetalleCarta.Enabled := False;
       sbtnAceptarDetalle.Enabled  := False;
       sbtnCancelarDetalle.Enabled := True;
       dbeJuzgado.Enabled   := False;
       dbeApePatD.Enabled   := False;
       dbeApeMatD.Enabled   := False;
       dbeDetNombD.Enabled  := False;
       dblcDpto.Enabled     := False;
       dbdtpFecRec.Enabled  := False;
       dbeNroOficio.Enabled := False;
       rgTipo.Enabled    := False;
       dbeValor.Enabled  := False;
       dbeEstado.Enabled := False;
       dbreObs.Enabled   := False;
      end
     Else
      begin
       Panel2.Enabled := True;
       Panel3.Enabled := True;
       pnlDetRetJud.Enabled   := True;
       IbDetalleCarta.Enabled := True;
       sbtnAceptarDetalle.Enabled  := True;
       sbtnCancelarDetalle.Enabled := True;
       dbeJuzgado.Enabled   := True;
       dbeApePatD.Enabled   := True;
       dbeApeMatD.Enabled   := True;
       dbeDetNombD.Enabled  := True;
       dblcDpto.Enabled     := True;
       dbdtpFecRec.Enabled  := True;
       dbeNroOficio.Enabled := True;
       rgTipo.Enabled    := True;
       dbeValor.Enabled  := True;
       dbeEstado.Enabled := True;
       dbreObs.Enabled   := True;
      end;

     dblcCia.Enabled   := False;
     dbeApeNom.Enabled := False;
     DM1.cdsMaestRetJud.IndexFieldNames := 'RTJNRO; ASOID';
     DM1.cdsMaestRetJud.SetKey;
     DM1.cdsMaestRetJud.FieldByName('RTJNRO').AsString := DM1.cdsSQL.FieldByName('RTJNRO').AsString;
     DM1.cdsMaestRetJud.FieldByName('ASOID').AsString  := DM1.cdsSQL.FieldByName('ASOID').AsString;
     If DM1.cdsMaestRetJud.GotoKey Then
      begin
       DM1.cdsMaestRetJud.Edit;
       DM1.cdsMaestRetJud.FieldByName('CIAID').AsString  := DM1.cdsSQL.FieldByName('CIAID').AsString;
//       DM1.cdsMaestRetJud.FieldByName('DSGNRO').AsString := DM1.cdsSQL.FieldByName('DSGNRO').AsString;
       dblcCiaExit(Sender);
       DM1.cdsMaestRetJud.FieldByName('ASOID').AsString  := DM1.cdsSQL.FieldByName('ASOID').AsString;
//       dbeCodAsociadoExit(Sender);
//       LlenaCampos(DM1.cdsMaestRetJud.FieldByName('ASOID').AsString);
       LlenaDatos(DM1.cdsSQL.FieldByName('ASOID').AsString);
       dblcEstRetJudExit(Sender);
      end;

     LlenaDetalleRetencion;

     TNumericField(DM1.cdsDetRetJud.FieldByName('RTJIMPOR')).DisplayFormat := '###,###,##0.00';
     TNumericField(DM1.cdsDetRetJud.FieldByName('RTJIMPOR')).EditFormat    := '########0.00';

     dbgDetRetJudicial.ColumnByName('RTJIMPOR').FooterValue := FloatToStrF(DM1.OperClientDataSet(DM1.cdsDetRetJud, 'SUM(RTJIMPOR)', ''), ffNumber, 15, 2);
     dbgDetRetJudicial.ColumnByName('RTJPORC').FooterValue  := FloatToStr(DM1.OperClientDataSet(DM1.cdsDetRetJud, 'SUM(RTJPORC)', ''));
   end;
end;

procedure TFRetencionesJudiciales.dbeCodAsociadoExit(Sender: TObject);
begin
   If DM1.wModo = 'A' Then  // Si se encuentra en Modo Adición
    begin
     DM1.cdsMaestRetJud.IndexFieldNames := 'ASOID';
     DM1.cdsMaestRetJud.SetKey;
//     DM1.cdsMaestRetJud.FieldByName('RTJNRO').AsString := DM1.cdsSQL.FieldByName('RTJNRO').AsString;
//        DM1.cdsMaestRetJud.FieldByName('ASOID').AsString  := DM1.cdsAsociado.FieldByName('ASOID').AsString;
     If DM1.cdsMaestRetJud.GotoKey Then
      begin
       DM1.cdsMaestRetJud.Edit;
       DM1.cdsMaestRetJud.FieldByName('ASOID').AsString  := DM1.cdsAsociado.FieldByName('ASOID').AsString;
//       LlenaCampos;
      end
//       LlenaCampos;
    end;
end;

procedure TFRetencionesJudiciales.dblcCiaExit(Sender: TObject);
var
   xWhere : String;
begin
   If Length(dblcCia.Text) = 0 Then
    begin
     Beep;
     MessageDlg('Ingrese el Código de la Compañía', mtInformation, [mbOk], 0);
     dblcCia.SetFocus;
     Exit;
    end
   Else
    begin
     If (Length(dblcCia.Text) < 2) and (StrToInt(dblcCia.Text) < 10) Then
      dblcCia.Text := '0'+dblcCia.Text;

     xWhere := 'CIAID ='+QuotedStr(dblcCia.Text);

     If Length(DM1.DisplayDescrip('prvSQL', 'TGE101', 'CIAID, CIAABR', xWhere, 'CIAID')) = 0 Then
      begin
       Beep;
       Messagedlg('El Código de la Compañía No Existe', mtInformation, [mbOk], 0);
       dblcCia.SetFocus;
       Exit;
      end
     Else
      dbeDescripCia.Text := DM1.cdsQry.FieldByName('CIAABR').AsString;
    end;
end;

procedure TFRetencionesJudiciales.sbtnAceptarClick(Sender: TObject);
begin
   If Not ValidaDatosRetencion Then
    Exit;

   Screen.Cursor := crHourGlass;
   NroDetRetenciones;
   If xNroDetRet = 0 Then
    begin
     ErrorMsg('Error', 'No se Puede Grabar!!! No se ha Ingresado el Detalle de la Retención');
     Screen.Cursor := crDefault;
     Exit;
    end
   Else
    begin
     DM1.cdsMaestRetJud.Edit;
     If DM1.wModo = 'M' Then
      chkVigenteClick(Sender);
     DM1.cdsMaestRetJud.FieldByName('FREG').AsDateTime  := Date;
     DM1.cdsMaestRetJud.FieldByName('HREG').AsDateTime  := Date+Time;
     DM1.cdsMaestRetJud.FieldByName('USUARIO').AsString := DM1.wUsuario;
     DM1.cdsPost( DM1.cdsMaestRetJud );
     xGraba := True;
     DM1.AplicaDatos(DM1.cdsMaestRetJud, 'RETJUDPREV');
     FPrincipal.MRefe.RefreshFilter;
     Beep;
     MessageDlg('Datos Actualizados', mtCustom, [mbOk], 0);
     Screen.Cursor := crDefault;
    end;
end;

procedure TFRetencionesJudiciales.chkVigenteClick(Sender: TObject);
begin
   If chkVigente.Checked Then
    begin
     DM1.cdsMaestRetJud.Edit;
//     DM1.cdsMaestCartas.FieldByName('DSGVIG').AsString   := 'S';
//     DM1.cdsMaestCartas.FieldByName('DSGESTAD').AsString := '03';
//     dblcEstCartaExit(Sender);
    end
   Else
    begin
     DM1.cdsMaestRetJud.Edit;
//     DM1.cdsMaestCartas.FieldByName('DSGVIG').AsString := 'N'
    end;
end;

procedure TFRetencionesJudiciales.dblcEstRetJudExit(Sender: TObject);
var
   xWhere : String;
begin
   xWhere := 'PVSESTDSG ='+QuotedStr(dblcEstRetJud.Text)
            +' And PVSDOC ='+QuotedStr('R');

   dbeEstRetJud.Text := DM1.DisplayDescrip('prvSQL', 'PVS102', 'PVSESTDSG, PVSESTDES', xWhere, 'PVSESTDES');
end;

procedure TFRetencionesJudiciales.sbtnCancelarDetalleClick(
  Sender: TObject);
begin
   pnlDetRetJud.Visible := False;
   DM1.cdsDetRetJud.CancelUpdates;
end;

procedure TFRetencionesJudiciales.sbtnAceptarDetalleClick(Sender: TObject);
var
   xWhere : String;
begin
   If Not ValidaDatosDetalleRetencion Then
    Exit;

   Screen.Cursor := crHourGlass;
   DM1.cdsDetRetJud.Edit;
   If DM1.wModo = 'A' Then
    begin
     xWhere := 'RTJNRO ='+QuotedStr(DM1.cdsMaestRetJud.FieldByName('RTJNRO').AsString);
     DM1.cdsDetRetJud.FieldByName('RTJCORR').AsString   := DM1.StrZero(DM1.UltimoNum('prvSQL', 'PVS305', 'RTJCORR', xWhere), 2);
    end;
   If rgTipo.ItemIndex = 0 Then
    DM1.cdsDetRetJud.FieldByName('RTJFPOIM').AsString := 'P'
   Else
    DM1.cdsDetRetJud.FieldByName('RTJFPOIM').AsString := 'I';
   DM1.cdsDetRetJud.FieldByName('RTJESTAD').AsString := dblcEstRetJud.Text;
   DM1.cdsDetRetJud.FieldByName('FREG').AsDateTime   := Date;
   DM1.cdsDetRetJud.FieldByName('HREG').AsDateTime   := Date+Time;
   DM1.cdsDetRetJud.FieldByName('USUARIO').AsString  := DM1.wUsuario;
   DM1.cdsPost( DM1.cdsDetRetJud );
   DM1.AplicaDatos(DM1.cdsDetRetJud, 'DETRETJUDPREV');
   dbgDetRetJudicial.ColumnByName('RTJIMPOR').FooterValue := FloatToStrF(DM1.OperClientDataSet(DM1.cdsDetRetJud, 'SUM(RTJIMPOR)', ''), ffNumber, 15, 2);
   dbgDetRetJudicial.ColumnByName('RTJPORC').FooterValue  := FloatToStr(DM1.OperClientDataSet(DM1.cdsDetRetJud, 'SUM(RTJPORC)', ''));
   DM1.cdsDetRetJud.First;
   Beep;
   MessageDlg('Datos del Detalle de la Retención Actualizados', mtCustom, [mbOk], 0);
   pnlDetRetJud.Visible := False;
//Para Grabar la Retención
   If DM1.wModo = 'M' Then
    chkVigenteClick(Sender)
   Else
    begin
     DM1.cdsMaestRetJud.Edit;
     DM1.cdsMaestRetJud.FieldByName('FREG').AsDateTime  := Date;
     DM1.cdsMaestRetJud.FieldByName('HREG').AsDateTime  := Date+Time;
     DM1.cdsMaestRetJud.FieldByName('USUARIO').AsString := DM1.wUsuario;
     DM1.cdsPost( DM1.cdsMaestRetJud );
     DM1.AplicaDatos(DM1.cdsMaestRetJud, 'RETJUDPREV');
     FPrincipal.MRefe.RefreshFilter;
    end;
//****************************************************************************************************
   Screen.Cursor := crDefault;

{   If rgTipo.ItemIndex = 0 Then
    begin
     DM1.cdsDetRetJud.Edit;
     DM1.cdsDetRetJud.FieldByName('RTJPORC').AsFloat   := StrToFloat(dbeValor.Text);
     DM1.cdsDetRetJud.FieldByName('RTJFPOIM').AsString := 'P';
    end
   Else
    begin
     DM1.cdsDetRetJud.Edit;
     DM1.cdsDetRetJud.FieldByName('RTJIMPOR').AsFloat  := StrToFloat(dbeValor.Text);
     DM1.cdsDetRetJud.FieldByName('RTJFPOIM').AsString := 'I';
    end;

   DM1.cdsDetRetJud.Edit;
   DM1.cdsDetRetJud.FieldByName('CIAID').AsString   := DM1.cdsMaestRetJud.FieldByName('CIAID').AsString;
   DM1.cdsDetRetJud.FieldByName('ASOID').AsString   := DM1.cdsMaestRetJud.FieldByName('ASOID').AsString;
   DM1.cdsDetRetJud.FieldByName('RTJNRO').AsString  := DM1.cdsMaestRetJud.FieldByName('RTJNRO').AsString;
   DM1.cdsDetRetJud.FieldByName('FREG').AsDateTime  := Date;
   DM1.cdsDetRetJud.FieldByName('HREG').AsDateTime  := Date+Time;
   DM1.cdsDetRetJud.FieldByName('USUARIO').AsString := DM1.wUsuario;
   DM1.cdsPost( DM1.cdsDetRetJud );
   DM1.AplicaDatos(DM1.cdsDetRetJud, 'DETRETJUDPREV');
   dbgDetRetJudicial.ColumnByName('RTJIMPOR').FooterValue := FloatToStrF(DM1.OperClientDataSet(DM1.cdsDetRetJud, 'SUM(RTJIMPOR)', ''), ffNumber, 15, 2);
   dbgDetRetJudicial.ColumnByName('RTJPORC').FooterValue  := FloatToStr(DM1.OperClientDataSet(DM1.cdsDetRetJud, 'SUM(RTJPORC)', ''));
   DM1.cdsDetRetJud.First;
   Beep;
   MessageDlg('Datos Actualizados', mtCustom, [mbOk], 0);
   pnlDetRetJud.Visible := False;}
end;

procedure TFRetencionesJudiciales.bbtnBuscarClick(Sender: TObject);
begin
   FBuscarAsocRetJud := TFBuscarAsocRetJud.Create(Self);
   With FBuscarAsocRetJud do
    Try
     ShowModal;
    Finally
     Free;
   end;
end;

procedure TFRetencionesJudiciales.dbgDetRetJudicialDblClick(
  Sender: TObject);
begin
   If DM1.cdsDetRetJud.RecordCount = 0 Then
    begin
     ErrorMsg('Error', 'No Existen Datos a Editar');
     pnlDetRetJud.Visible := False;
     Exit;
    end
   Else
    begin
     pnlDetRetJud.Visible := True;
     dblcDptoExit(Sender);
     If DM1.cdsDetRetJud.FieldByName('RTJFPOIM').AsString = 'I' Then
      begin
       DM1.cdsDetRetJud.Edit;
       dbeValor.DataField := 'RTJIMPOR';
       rgTipo.ItemIndex := 1;
      end
     Else
      begin
       dbeValor.DataField := 'RTJPORC';
       rgTipo.ItemIndex := 0;
      end;
    end;
{   If DM1.cdsDetRetJud.RecordCount = 0 Then
    begin
     ErrorMsg('Error', 'No Existen Datos a Editar');
     pnlDetRetJud.Visible := False;
     Exit;
    end
   Else
    begin
     pnlDetRetJud.Visible := True;
     dbeNroOficio.Enabled := False;
     dbeJuzgado.SetFocus;
     dblcDptoExit(Sender);

     If DM1.cdsDetRetJud.FieldByName('RTJFPOIM').AsString = 'I' Then
      begin
       dbeValor.Text := FloatToStr(DM1.cdsDetRetJud.FieldByName('RTJIMPOR').AsFloat);
       rgTipo.ItemIndex := 1;
      end
     Else
      begin
       dbeValor.Text := FloatToStr(DM1.cdsDetRetJud.FieldByName('RTJPORC').AsFloat);
       rgTipo.ItemIndex := 0;
      end;
    end;}
end;

procedure TFRetencionesJudiciales.IbDetalleCartaClick(Sender: TObject);
var
//   xWhere, xNroCorr : String;
   xWhere : String;
begin
   xWhere := '';
   If DM1.cdsMaestRetJud.FieldByName('ASOID').AsString = '' Then
    begin
     ErrorMsg('Error', 'No Existe Retención Judicial para Adcicionar');
     Exit;
    end
   Else
    begin
     Porcentaje;
     If xPorcentaje = 100 Then
      begin
       pnlDetRetJud.Visible := False;
       ErrorMsg('Error', 'No se puede Adicionar Detalle de la Retención, Cien Por Ciento Alcanzado');
       Exit;
      end
     Else
      begin
       If xPorcentaje = 0 Then
        begin
         pnlDetRetJud.Visible := True;
         DM1.cdsDetRetJud.Append;
         dbeValor.DataField := 'RTJPORC';
         DM1.cdsDetRetJud.FieldByName('RTJPORC').AsInteger := StrToInt('100');
         xPorcentaje   := 100;
        end
       Else
        begin
         pnlDetRetJud.Visible := True;
         DM1.cdsDetRetJud.Append;
         dbeValor.DataField := 'RTJPORC';
         DM1.cdsDetRetJud.FieldByName('RTJPORC').AsInteger := 100 - xPorcentaje;
         xPorcentaje   := 100 - xPorcentaje;
        end;
      end;

     DM1.cdsDetRetJud.FieldByName('CIAID').AsString     := DM1.cdsMaestRetJud.FieldByName('CIAID').AsString;
     xWhere := 'RTJNRO ='+QuotedStr(DM1.cdsMaestRetJud.FieldByName('RTJNRO').AsString);
     DM1.cdsDetRetJud.FieldByName('RTJCORR').AsString   := DM1.StrZero(DM1.UltimoNum('prvSQL', 'PVS305', 'RTJCORR', xWhere), 2);
     DM1.cdsDetRetJud.FieldByName('ASOID').AsString     := DM1.cdsMaestRetJud.FieldByName('ASOID').AsString;
     DM1.cdsDetRetJud.FieldByName('RTJNRO').AsString    := DM1.cdsMaestRetJud.FieldByName('RTJNRO').AsString;
     DM1.cdsDetRetJud.FieldByName('RTJFREC').AsDateTime := Date;
     dbeDescDpto.Clear;
     dbeJuzgado.SetFocus;
    end;
{   If DM1.cdsDetRetJud.RecordCount = 0 Then
    begin
     DM1.cdsDetRetJud.Append;
     DM1.cdsDetRetJud.FieldByName('RTJFREC').AsDateTime := Date;
     DM1.cdsDetRetJud.FieldByName('RTJCORR').AsString   := DM1.StrZero(DM1.UltimoNum('prvSQL', 'PVS305', 'RTJCORR', xWhere), 2);
     pnlDetRetJud.Visible := True;
     dbeDescDpto.Clear;     dbeNroOficio.Clear;
     dbeValor.Clear;        dbeJuzgado.SetFocus;
     dbeNroOficio.Enabled := True;
    end
   Else
    begin
     DM1.cdsDetRetJud.Last;
     xNroCorr := IntToStr(StrToInt(DM1.cdsDetRetJud.FieldByName('RTJCORR').AsString) + 1);
     xWhere := 'ASOID ='+QuotedStr(DM1.cdsMaestRetJud.FieldByName('ASOID').AsString)
              +' And CIAID ='+QuotedStr(DM1.cdsMaestRetJud.FieldByName('CIAID').AsString);

     xPorcentaje := StrToInt(DM1.DisplayDescrip('prvSQL', 'PVS305', 'SUM(RTJPORC) RTJPORC', xWhere, 'RTJPORC'));
     If xPorcentaje < 100 Then
      begin
       DM1.cdsDetRetJud.Append;
       DM1.cdsDetRetJud.FieldByName('RTJFREC').AsDateTime := Date;
       DM1.cdsDetRetJud.FieldByName('RTJCORR').AsString   := DM1.StrZero(DM1.UltimoNum('prvSQL', 'PVS305', 'RTJCORR', xWhere), 2);
       pnlDetRetJud.Visible := True;
       dbeDescDpto.Clear;   dbeNroOficio.Clear;
       dbeValor.Clear;      dbeJuzgado.SetFocus;
       dbeNroOficio.Enabled := True;
      end
     Else
      begin
       If xPorcentaje = 100 Then
        begin
         Beep;
         MessageDlg('No se Puede Adicionar !!! Máximo Porcentaje Alcanzado', mtWarning, [mbOk], 0);
         pnlDetRetJud.Visible := False;
         DM1.cdsDetRetJud.CancelUpdates;
         DM1.cdsDetRetJud.First;
         Exit;
        end;
      end;
    end;}
end;

procedure TFRetencionesJudiciales.dblcDptoExit(Sender: TObject);
var
   xWhere : String;
begin
   If Length(dblcDpto.Text) > 0 Then
    begin
     If (Length(dblcDpto.Text) < 2) And (StrToInt(dblcDpto.Text) < 10) Then
      dblcDpto.Text := '0'+dblcDpto.Text;

     xWhere := 'DPTOID ='+QuotedStr(dblcDpto.Text);

     If Length(DM1.DisplayDescrip('prvSQL', 'TGE158', 'DPTOID, DPTODES', xWhere, 'DPTOID')) = 0 Then
      begin
       Beep;
       MessageDlg('El Código del Departamento No Existe', mtInformation, [mbOk], 0);
       dblcDpto.SetFocus;
       Exit;
      end
     Else
      dbeDescDpto.Text := DM1.cdsQry.FieldByName('DPTODES').AsString;
    end;
end;

procedure TFRetencionesJudiciales.dbeValorExit(Sender: TObject);
begin
   If sbtnCancelarDetalle.Focused Then Exit;

   If Length(dbeValor.Text) = 0 Then
    begin
     Beep;
     If rgTipo.ItemIndex = 0 Then
      MessageDlg('Ingrese el Valor del Porcentaje', mtInformation, [mbOk], 0)
     Else
      MessageDlg('Ingrese el Monto', mtInformation, [mbOk], 0);
     dbeValor.SetFocus;
     Exit;
    end;

   If rgTipo.ItemIndex = 0 Then
    begin
     If xPorcentaje = 0 Then
      Exit
     Else
      begin
       If StrToInt(dbeValor.Text) > 100 Then
        begin
         Beep;
         MessageDlg('EL Porcentaje es Mayor que 100', mtError, [mbOk], 0);
         dbeValor.Text := FloatToStr(xPorcentaje);
         dbeValor.SetFocus;
        end
       Else
        begin
         If StrToInt(dbeValor.Text) > xPorcentaje Then
          begin
           Beep;
           MessageDlg('El Porcentaje Sobrepasa el Cien Por Ciento!!!', mtWarning, [mbOk], 0);
           dbeValor.Text := FloatToStr(xPorcentaje);
           dbeValor.SetFocus;
           Exit;
          end;
        end;
      end;
    end;
end;

procedure TFRetencionesJudiciales.rgTipoExit(Sender: TObject);
{var
   xWhere : String;}
begin
{   If rgTipo.ItemIndex = 0 Then
    begin
     xWhere := 'ASOID ='+QuotedStr(DM1.cdsMaestRetJud.FieldByName('ASOID').AsString)
              +' And CIAID ='+QuotedStr(DM1.cdsMaestRetJud.FieldByName('CIAID').AsString);

     If Length(DM1.DisplayDescrip('prvSQL', 'PVS305', 'ASOID, RTJPORC', xWhere, 'ASOID')) = 0 Then
      begin
       dbeValor.Text := '100';
       xPorcentaje   := 100;
      end
     Else
      begin
       xPorcentaje := StrToInt(DM1.DisplayDescrip('prvSQL', 'PVS305', 'SUM(RTJPORC) RTJPORC', xWhere, 'RTJPORC'));
       If xPorcentaje < 100 Then
        begin
         xPorcentaje   := 100 - xPorcentaje;
         dbeValor.Text := FloatToStr(xPorcentaje);
        end
       Else
        begin
         If xPorcentaje = 100 Then
          begin
           Beep;
           MessageDlg('No se Puede Adicionar!!! Máximo Porcentaje Alcanzado', mtWarning, [mbOk], 0);
           pnlDetRetJud.Visible := False;
           DM1.cdsDetRetJud.CancelUpdates;
           Exit;
          end;
        end;
      end;
    end;}
end;

procedure TFRetencionesJudiciales.dbeApeNomExit(Sender: TObject);
var
   xSQL : String;
begin
   Screen.Cursor := crHourGlass;
   If Length(dbeApeNom.Text) > 0 Then
    begin
     xSQL := 'Select * From APO201 '
            +' Where ASOAPENOM LIKE '+QuotedStr(Trim(dbeApeNom.Text+'%'));

     DM1.cdsAsoX.Close;
     DM1.cdsAsoX.DataRequest(xSQL);
     DM1.cdsAsoX.Open;

     If DM1.cdsAsoX.RecordCount = 0 Then
      begin
       Beep;
       MessageDlg('No Existe un Asociado con el Nombre '+dbeApeNom.Text, mtInformation, [mbOk], 0);
       DM1.cdsMaestRetJud.FieldByName('RTJNOMBRT').Clear;
       dbeApeNom.SetFocus;
       Screen.Cursor := crDefault;
       Exit;
      end
     Else
      begin
       If DM1.cdsAsoX.RecordCount = 1 Then
        begin
         DM1.cdsMaestRetJud.IndexFieldNames := '';
         DM1.cdsMaestRetJud.IndexFieldNames := 'ASOID';
         DM1.cdsMaestRetJud.SetKey;
         DM1.cdsMaestRetJud.FieldByName('ASOID').AsString := DM1.cdsAsoX.FieldByName('ASOID').AsString;
         If DM1.cdsMaestRetJud.GotoKey Then //Si encuentra al Asociado en la Tabla de Retenciones
          begin
           DM1.cdsMaestRetJud.Edit;
           DM1.cdsMaestRetJud.FieldByName('ASOID').AsString := DM1.cdsAsoX.FieldByName('ASOID').AsString;
           LlenaDatos(DM1.cdsAsoX.FieldByName('ASOID').AsString);
           DM1.cdsMaestRetJud.CancelUpdates;
//           LlenaDetalleRetencion;
          end
         Else //Si No encuentra al Asociado en la Tabla de Retenciones
          begin
           LlenaDatos(DM1.cdsAsoX.FieldByName('ASOID').AsString);
          end;
        end
       Else
        begin
         FBuscarAsocRetJud := TFBuscarAsocRetJud.Create(Self);
         With FBuscarAsocRetJud do
          Try
           ShowModal;
          Finally
           Free;
          end;
        end;
      end;
    end;
   Screen.Cursor := crDefault;
end;

procedure TFRetencionesJudiciales.dblcCiaNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

function TFRetencionesJudiciales.ValidaDatosRetencion:Boolean;
begin
   Result := False;
   If Length(dblcCia.Text) = 0 Then
    begin
     Beep;
     MessageDlg('Ingrese la Compañía', mtInformation, [mbOk], 0);
     dblcCia.SetFocus;
     Exit;
    end;

   If Length(dbdtpFecRecepcion.Text) = 0 Then
    begin
     Beep;
     MessageDlg('Ingrese la Fecha de Recepción', mtInformation, [mbOk], 0);
     dbdtpFecRecepcion.SetFocus;
     Exit;
    end;

   If Length(dbeApeNom.Text) = 0 Then
    begin
     Beep;
     MessageDlg('Ingrese Nombre del Asociado', mtInformation, [mbOk], 0);
     dbeApeNom.SetFocus;
     Exit;
    end;

   If Length(dbdtpFecOper.Text) = 0 Then
    begin
     Beep;
     MessageDlg('Ingrese la Fecha de Operación', mtInformation, [mbOk], 0);
     dbdtpFecOper.SetFocus;
     Exit;
    end;

   Result := True;
end;

function TFRetencionesJudiciales.ValidaDatosDetalleRetencion:Boolean;
begin
   Result := False;

   If Length(dbeJuzgado.Text) = 0 Then
    begin
     Beep;
     MessageDlg('Ingrese el Nombre del Juzgado', mtInformation, [mbOk], 0);
     dbeJuzgado.SetFocus;
     Exit;
    end;

   If Length(dbeApePatD.Text) = 0 Then
    begin
     Beep;
     MessageDlg('Ingrese el Apellido Paterno', mtInformation, [mbOk], 0);
     dbeApePatD.SetFocus;
     Exit;
    end;

   If Length(dbeApeMatD.Text) = 0 Then
    begin
     Beep;
     MessageDlg('Ingrese el Apellido Paterno', mtInformation, [mbOk], 0);
     dbeApeMatD.SetFocus;
     Exit;
    end;

   If Length(dbeDetNombD.Text) = 0 Then
    begin
     Beep;
     MessageDlg('Ingrese el Nombre', mtInformation, [mbOk], 0);
     dbeDetNombD.SetFocus;
     Exit;
    end;

   If Length(dblcDpto.Text) = 0 Then
    begin
     Beep;
     MessageDlg('Ingrese el Departamento de Origen', mtInformation, [mbOk], 0);
     dblcDpto.SetFocus;
     Exit;
    end;

   If Length(dbdtpFecRec.Text) = 0 Then
    begin
     Beep;
     MessageDlg('Ingrese la Fecha de Recepción', mtInformation, [mbOk], 0);
     dbdtpFecRec.SetFocus;
     Exit;
    end;

   If Length(dbeNroOficio.Text) = 0 Then
    begin
     Beep;
     MessageDlg('Ingrese el Número de Oficio', mtInformation, [mbOk], 0);
     dbeNroOficio.SetFocus;
     Exit;
    end;

   If Length(dbeValor.Text) = 0 Then
    begin
     Beep;
     If rgTipo.ItemIndex = 0 Then
      MessageDlg('Ingrese el Valor del Porcentaje', mtInformation, [mbOk], 0)
     Else
      MessageDlg('Ingrese el Valor del Monto', mtInformation, [mbOk], 0);
     dbeNroOficio.SetFocus;
     Exit;
    end;

   Result := True;
end;

procedure TFRetencionesJudiciales.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DM1.cdsMaestRetJud.CancelUpdates;
   DM1.cdsDetRetJud.CancelUpdates;
   DM1.cdsEstCarta.Filter          := '';
   DM1.cdsEstCarta.Filtered        := False;
   DM1.cdsEstCarta.IndexFieldNames := '';
   DM1.cdsEstCarta.Close;
   DM1.cdsAsoX.Filter   := '';
   DM1.cdsAsoX.Filtered := False;
   DM1.cdsAsoX.IndexFieldNames := '';
   DM1.cdsAsoX.Close;
end;

function TFRetencionesJudiciales.NroRetenciones:Integer;
var
   xWhere : String;                              
begin
   xWhere := 'ASOID ='+QuotedStr(DM1.cdsMaestRetJud.FieldByName('ASOID').AsString);
   xNroRet := StrToInt(DM1.DisplayDescrip('prvSQL', 'PVS304', 'COUNT(ASOID) ASOID', xWhere, 'ASOID'));
end;

function TFRetencionesJudiciales.NroDetRetenciones:Integer;
var
   xWhere : String;
begin
   xWhere := 'ASOID ='+QuotedStr(DM1.cdsMaestRetJud.FieldByName('ASOID').AsString);
   xNroDetRet := StrToInt(DM1.DisplayDescrip('prvSQL', 'PVS305', 'COUNT(ASOID) ASOID', xWhere, 'ASOID'));
end;

procedure TFRetencionesJudiciales.LlenaDatos(xCodAso : String);
var
   xCampos, xWhere : String;
begin
   xCampos := 'ASOID, ASOCODMOD, ASOAPEPAT, ASOAPEMAT, ASONOMBRES,'
             +' ASODNI, ASOSITID, USEID, UPROID, UPAGOID';

   xWhere := 'ASOID ='+QuotedStr(xCodAso);
   If length(DM1.DisplayDescrip('prvSQL', 'APO201', xCampos, xWhere, 'ASOID')) = 0 Then
    begin
     Beep;
     MessageDlg('El Asociado No Existe o No es Docente', mtWarning, [mbOk], 0);
     dbeApeNom.SetFocus;
     Exit;
    end
   Else
    begin
     dbeDNI.Text := DM1.cdsQry.FieldByName('ASODNI').AsString;
     xUseId      := DM1.cdsQry.FieldByName('USEID').AsString;    //Para la USE
     xUPagoId    := DM1.cdsQry.FieldByName('UPAGOID').AsString;  //Para la Unidad de Pago
     xUProId     := DM1.cdsQry.FieldByName('UPROID').AsString;   //Para la Unidad de Proceso
     xSitAso     := DM1.cdsQry.FieldByName('ASOSITID').AsString; //Estado del Asociado
     DM1.cdsMaestRetJud.Edit;
     DM1.cdsMaestRetJud.FieldByName('ASOID').AsString     := DM1.cdsQry.FieldByName('ASOID').AsString;
     DM1.cdsMaestRetJud.FieldByName('RTJCODMOD').AsString := DM1.cdsQry.FieldByName('ASOCODMOD').AsString;
     DM1.cdsMaestRetJud.FieldByName('RTJAPEPAT').AsString := DM1.cdsQry.FieldByName('ASOAPEPAT').AsString;
     DM1.cdsMaestRetJud.FieldByName('RTJAPEMAT').AsString := DM1.cdsQry.FieldByName('ASOAPEMAT').AsString;
     DM1.cdsMaestRetJud.FieldByName('RTJNOMBR').AsString  := DM1.cdsQry.FieldByName('ASONOMBRES').AsString;
     DM1.cdsMaestRetJud.FieldByName('RTJNOMBRT').AsString := DM1.cdsMaestRetJud.FieldByName('RTJAPEPAT').AsString+' '
                                                            +DM1.cdsMaestRetJud.FieldByName('RTJAPEMAT').AsString+' '
                                                            +DM1.cdsMaestRetJud.FieldByName('RTJNOMBR').AsString;

     xWhere   := 'UPROID ='+QuotedStr(xUProId);
     dbeUProceso.Text := DM1.DisplayDescrip('prvSQL', 'APO102', 'UPROID, UPRONOM', xWhere , 'UPRONOM');
     xWhere   := 'UPROID ='+QuotedStr(xUProId)
                +' And UPAGOID ='+QuotedStr(xUPagoId);
     dbeUPago.Text := DM1.DisplayDescrip('prvSQL', 'APO103', 'UPROID, UPAGOID, UPAGONOM', xWhere, 'UPAGONOM');
     xWhere   := 'UPROID ='+QuotedStr(xUProId)
                +' And UPAGOID ='+QuotedStr(xUPagoId)
                +' And USEID ='+QuotedStr(xUseId);
     dbeUSE.Text := DM1.DisplayDescrip('prvSQL', 'APO101', 'UPROID, UPROID, USEID, USENOM', xWhere, 'USENOM');
     xWhere := 'ASOSITID ='+QuotedStr(xSitAso);
     dbeEstAsoc.Text := DM1.DisplayDescrip('prvSQL', 'APO106', 'ASOSITID, ASOSITDES', xWhere, 'ASOSITDES');
    end;
   LlenaDetalleRetencion;
end;

procedure TFRetencionesJudiciales.LlenaDetalleRetencion;
var
   xSQL : String;
begin
   xSQL := 'Select * From PVS305'
          +' Where RTJNRO ='+QuotedStr(DM1.cdsMaestRetJud.FieldByName('RTJNRO').AsString)
          +' And ASOID ='+QuotedStr(DM1.cdsMaestRetJud.FieldByName('ASOID').AsString);

   DM1.cdsDetRetJud.Filter   := '';
   DM1.cdsDetRetJud.Filtered := False;
   DM1.cdsDetRetJud.IndexFieldNames := '';
   DM1.cdsDetRetJud.Close;
   DM1.cdsDetRetJud.DataRequest(xSQL);
   DM1.cdsDetRetJud.Open;
   pnlDetRetJud.Visible := False;

   dbgDetRetJudicial.Selected.Clear;
   dbgDetRetJudicial.Selected.Add('RTJCORR'#9'8'#9'Nro~Retención'#9'T');
   dbgDetRetJudicial.Selected.Add('RTJJUZG'#9'60'#9'Juzgado'#9'T');
   dbgDetRetJudicial.Selected.Add('RTJAPEPAT'#9'25'#9'Apellido~Paterno'#9'T');
   dbgDetRetJudicial.Selected.Add('RTJAPEMAT'#9'25'#9'Apellido~Materno'#9'T');
   dbgDetRetJudicial.Selected.Add('RTJNOMBR'#9'25'#9'Nombres'#9'T');
   dbgDetRetJudicial.Selected.Add('RTJDPTOID'#9'2'#9'Dpto~Id'#9'T');
   dbgDetRetJudicial.Selected.Add('RTJFREC'#9'10'#9'Fecha~Recepción'#9'T');
   dbgDetRetJudicial.Selected.Add('RTJNOFIC'#9'12'#9'Nro~Oficio'#9'T');
   dbgDetRetJudicial.Selected.Add('RTJPORC'#9'5'#9'Porcentaje'#9'T');
   dbgDetRetJudicial.Selected.Add('RTJIMPOR'#9'15'#9'Importe'#9'T');
   dbgDetRetJudicial.Selected.Add('RTJOBS'#9'50'#9'Observaciones'#9'T');
   dbgDetRetJudicial.ApplySelected;
   DM1.cdsDetRetJud.First;
end;

function TFRetencionesJudiciales.Porcentaje : Integer;
var
   xWhere : String;
begin
   xWhere := 'ASOID ='+QuotedStr(DM1.cdsMaestRetJud.FieldByName('ASOID').AsString);

   If Length(DM1.DisplayDescrip('prvSQL', 'PVS305', 'SUM(RTJPORC) RTJPORC', xWhere, 'RTJPORC')) = 0 Then
    xPorcentaje := 0
   Else
    xPorcentaje := StrToInt(DM1.DisplayDescrip('prvSQL', 'PVS305', 'SUM(RTJPORC) RTJPORC', xWhere, 'RTJPORC'));

   Result := xPorcentaje;
end;

procedure TFRetencionesJudiciales.dbeValorKeyPress(Sender: TObject;
  var Key: Char);
begin
   If rgTipo.ItemIndex = 0 Then
    begin
     If Key In [' ', 'A'..'Z', 'a'..'z',
                '°', '|', '¬', '!', '"', '#', '$', '%', '&', '/', '(', ')',
                '=', '?', '\', '¡', '¿', '@', '¨', '´', '*', '+', '~', '[',
                ']', '{', '}', '^', '`', '<', '>', ';', ',', ':', '''',
                '.', '-', '_'] Then
      Key := #0;
    end
   Else
    begin
     If Key In [' ', 'A'..'Z', 'a'..'z',
                '°', '|', '¬', '!', '"', '#', '$', '%', '&', '/', '(', ')',
                '=', '?', '\', '¡', '¿', '@', '¨', '´', '*', '+', '~', '[',
                ']', '{', '}', '^', '`', '<', '>', ';', ',', ':', '''',
                '-', '_'] Then
      Key := #0;
    end;
end;

procedure TFRetencionesJudiciales.dblcCiaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key In [' ', 'A'..'Z', 'a'..'z',
                '°', '|', '¬', '!', '"', '#', '$', '%', '&', '/', '(', ')',
                '=', '?', '\', '¡', '¿', '@', '¨', '´', '*', '+', '~', '[',
                ']', '{', '}', '^', '`', '<', '>', ';', ',', ':', '''',
                '.', '-', '_'] Then
      Key := #0;
end;

procedure TFRetencionesJudiciales.rgTipoClick(Sender: TObject);
begin
   If rgTipo.ItemIndex = 0 Then
    begin
     DM1.cdsDetRetJud.FieldByName('RTJIMPOR').Clear;
     Porcentaje;
     dbeValor.DataField := 'RTJPORC';
     If xPorcentaje = 100 Then
      begin
       pnlDetRetJud.Visible := False;
       ErrorMsg('Error', 'No se puede Adicionar Detalle de la Retención, Cien Por Ciento Alcanzado');
       Exit;
      end
     Else
      begin
       If xPorcentaje = 0 Then
        begin
         DM1.cdsDetRetJud.FieldByName('RTJPORC').AsInteger := StrToInt('100');
         xPorcentaje   := 100;
        end
       Else
        begin
         DM1.cdsDetRetJud.FieldByName('RTJPORC').AsInteger := 100 - xPorcentaje;
         xPorcentaje   := 100 - xPorcentaje;
        end;
      end;
    end
   Else
    begin
     DM1.cdsDetRetJud.FieldByName('RTJPORC').Clear;
     dbeValor.DataField := 'RTJIMPOR';
     TNumericField(DM1.cdsDetRetJud.FieldByName('RTJIMPOR')).DisplayFormat := '###,###,##0.00';
     TNumericField(DM1.cdsDetRetJud.FieldByName('RTJIMPOR')).EditFormat    := '########0.00';
    end;
end;

procedure TFRetencionesJudiciales.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   If (DM1.cdsMaestRetJud.State = dsInsert) Or
      (DM1.cdsDetRetJud.State = dsInsert) Then
    If Application.MessageBox(' Tiene Datos No Actualizados '+#13+
                              '¿Desea Salir y Cancelar sus Actualizaciones?',
                              'Grabaciones Pendientes',
                              MB_YESNO + MB_DEFBUTTON1) <> IDYES Then
      CanClose := False
    Else
     DM1.cdsMaestRetJud.CancelUpdates;
end;

procedure TFRetencionesJudiciales.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key = #13 Then
    begin
     Key := #0;
     Perform(CM_DialogKey, VK_TAB, 0);
    end;
end;

end.

