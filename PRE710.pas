unit PRE710;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fcButton, fcImgBtn, fcShapeBtn, wwdbdatetimepicker, wwdblook,
  Mask, wwdbedit, ExtCtrls, Buttons, Wwdbigrd, Grids, Wwdbgrid, fcLabel, db, Mant;

type
  TFDatosRetenciones = class(TForm)
    Panel1: TPanel;
    lblCodigo: TfcLabel;
    lblTitulo: TfcLabel;
    fcLabel1: TfcLabel;
    dbgDatosRetencion: TwwDBGrid;
    IBDatosRetencion: TwwIButton;
    dbgDetRetJudicial: TwwDBGrid;
    IBDetalleRet: TwwIButton;
    pnlRetencion: TPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbeNroCarta: TwwDBEdit;
    dblcEstRetJud: TwwDBLookupCombo;
    dbeEstRetJud: TwwDBEdit;
    dbdtpFecRecepcion: TwwDBDateTimePicker;
    dbdtpFecOperacion: TwwDBDateTimePicker;
    sbtnAceptar: TfcShapeBtn;
    sbtnCancelar: TfcShapeBtn;
    pnlDetRetJud: TPanel;
    Bevel2: TBevel;
    sbtnAceptarDetalle: TfcShapeBtn;
    sbtnCancelarDetalle: TfcShapeBtn;
    dbeApePatD: TwwDBEdit;
    dblcDpto: TwwDBLookupCombo;
    dbeDescDpto: TwwDBEdit;
    dbeApeMatD: TwwDBEdit;
    dbeDetNombD: TwwDBEdit;
    dbeNroOficio: TwwDBEdit;
    dbdtpFecRec: TwwDBDateTimePicker;
    rgTipo: TRadioGroup;
    dbeValor: TwwDBEdit;
    dbeEstado: TwwDBEdit;
    dbeObs: TwwDBEdit;
    dbeJuzgado: TwwDBEdit;
    pnlBuscar: TPanel;
    grpBuscar: TGroupBox;
    Label5: TLabel;
    dbeAsoApeNom: TwwDBEdit;
    Z1bbtnBuscar: TfcShapeBtn;
    chkBuscar: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure IBDatosRetencionClick(Sender: TObject);
    procedure dblcEstRetJudExit(Sender: TObject);
    procedure dblcEstRetJudKeyPress(Sender: TObject; var Key: Char);
    procedure dblcEstRetJudNotInList(Sender: TObject;
      LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
    procedure sbtnCancelarClick(Sender: TObject);
    procedure sbtnAceptarClick(Sender: TObject);
    procedure dbgDatosRetencionDblClick(Sender: TObject);
    procedure IBDetalleRetClick(Sender: TObject);
    procedure sbtnCancelarDetalleClick(Sender: TObject);
    procedure dblcDptoExit(Sender: TObject);
    procedure dbgDetRetJudicialDblClick(Sender: TObject);
    procedure sbtnAceptarDetalleClick(Sender: TObject);
    function ValidaDatosDetalle:Boolean;
    function Porcentaje : Integer;
    function NroRetenciones:Integer;
    function NroDetRetenciones:Integer;
    procedure rgTipoClick(Sender: TObject);
    procedure dbeValorExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure chkBuscarClick(Sender: TObject);
    procedure Z1bbtnBuscarClick(Sender: TObject);
    procedure LevantaFiltro(xCampo: String);
    procedure OnEditAso(Sender: TObject; MantFields: TFields);    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDatosRetenciones: TFDatosRetenciones;
  xPorcentaje : Integer;
  xNroRet, xNroDetRet : Integer;
  wModoC,xCodAso : String;

implementation

uses MsgDlgs, PREDM; //, PRE203

{$R *.DFM}

procedure TFDatosRetenciones.FormActivate(Sender: TObject);
var
   xSQL, xWhere : String;
begin
//Para Desactivar los Controles si ha sido Liquidado
   FDatosRetenciones.Left := 80;
   FDatosRetenciones.Top := 0;
   xWhere := 'ASOID ='+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)
            +' And PVSESTADO ='+QuotedStr('02');
   If Length(DM1.DisplayDescrip('prvSQL', 'PVS301', 'PVSESTADO', xWhere, 'PVSESTADO')) > 0 Then
    begin
     IBDatosRetencion.Enabled  := False;
     dbeNroCarta.Enabled       := False;
     dblcEstRetJud.Enabled     := False;
     dbdtpFecRecepcion.Enabled := False;
     dbdtpFecOperacion.Enabled := False;
     sbtnAceptar.Enabled  := False;
     sbtnCancelar.Enabled := True;
     IBDetalleRet.Enabled := False;
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
     dbeObs.Enabled    := False;
     sbtnAceptarDetalle.Enabled  := False;
     sbtnCancelarDetalle.Enabled := True;
    end
   Else
    begin
     IBDatosRetencion.Enabled  := True;
     dbeNroCarta.Enabled       := True;
     dblcEstRetJud.Enabled     := True;
     dbdtpFecRecepcion.Enabled := True;
     dbdtpFecOperacion.Enabled := True;
     sbtnAceptar.Enabled  := True;
     sbtnCancelar.Enabled := True;
     IBDetalleRet.Enabled := True;
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
     dbeObs.Enabled    := True;
     sbtnAceptarDetalle.Enabled  := True;
     sbtnCancelarDetalle.Enabled := True;
    end;
//
   xSQL := 'Select * From PVS102'
          +' Where PVSDOC ='+QuotedStr('R');

   DM1.cdsEstCarta.Filter   := '';
   DM1.cdsEstCarta.Filtered := False;
   DM1.cdsEstCarta.IndexFieldNames := '';
   DM1.cdsEstCarta.Close;
   DM1.cdsEstCarta.DataRequest(xSQL);
   DM1.cdsEstCarta.Open;
   DM1.cdsEstCarta.IndexFieldNames := 'PVSESTDSG';
   xSQL := 'SELECT * FROM PVS304 WHERE ASOID ='+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString);
   DM1.cdsMaestRetJud.Filter   := '';
   DM1.cdsMaestRetJud.Filtered := False;
   DM1.cdsMaestRetJud.IndexFieldNames := '';
   DM1.cdsMaestRetJud.Close;
   DM1.cdsMaestRetJud.DataRequest(xSQL);
   DM1.cdsMaestRetJud.Open;
   DM1.cdsMaestRetJud.IndexFieldNames := 'RTJNRO';
   dbgDatosRetencion.Selected.Clear;
   dbgDatosRetencion.Selected.Add('RTJNRO'#9'10'#9'Nro~Retención'#9'T');
   dbgDatosRetencion.Selected.Add('CIAID'#9'5'#9'Id~Compañía'#9'T');
   dbgDatosRetencion.Selected.Add('RTJAPEPAT'#9'20'#9'Apellido~Paterno'#9'T');
   dbgDatosRetencion.Selected.Add('RTJAPEMAT'#9'20'#9'Apellido~Materno'#9'T');
   dbgDatosRetencion.Selected.Add('RTJNOMBR'#9'20'#9'Nombres'#9'T');
   dbgDatosRetencion.Selected.Add('RTJFREC'#9'10'#9'Fecha~Recepción');
   dbgDatosRetencion.Selected.Add('RTJESTAD'#9'5'#9'Estado~Retención');
   dbgDatosRetencion.ApplySelected;
   If DM1.cdsMaestRetJud.RecordCount = 0 Then
    IBDatosRetencion.Enabled := True
   Else
    IBDatosRetencion.Enabled := False;
   xSQL := 'SELECT * FROM PVS305 WHERE ASOID ='+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString);
   DM1.cdsDetRetJud.Filter   := '';
   DM1.cdsDetRetJud.Filtered := False;
   DM1.cdsDetRetJud.IndexFieldNames := '';
   DM1.cdsDetRetJud.Close;
   DM1.cdsDetRetJud.DataRequest(xSQL);
   DM1.cdsDetRetJud.Open;
   DM1.cdsDetRetJud.IndexFieldNames := 'RTJCORR';
   pnlDetRetJud.Visible := False;
   dbgDetRetJudicial.Selected.Clear;
   dbgDetRetJudicial.Selected.Add('RTJCORR'#9'8'#9'Nro~Retención'#9'T');
   dbgDetRetJudicial.Selected.Add('RTJJUZG'#9'35'#9'Juzgado'#9'T');
   dbgDetRetJudicial.Selected.Add('RTJAPEPAT'#9'20'#9'Apellido~Paterno'#9'T');
   dbgDetRetJudicial.Selected.Add('RTJAPEMAT'#9'20'#9'Apellido~Materno'#9'T');
   dbgDetRetJudicial.Selected.Add('RTJNOMBR'#9'20'#9'Nombres'#9'T');
   dbgDetRetJudicial.Selected.Add('RTJDPTOID'#9'2'#9'Dpto~Id'#9'T');
   dbgDetRetJudicial.Selected.Add('RTJFREC'#9'10'#9'Fecha~Recepción'#9'T');
   dbgDetRetJudicial.Selected.Add('RTJNOFIC'#9'12'#9'Nro~Oficio'#9'T');
   dbgDetRetJudicial.Selected.Add('RTJPORC'#9'5'#9'Porcentaje'#9'T');
   dbgDetRetJudicial.Selected.Add('RTJIMPOR'#9'15'#9'Importe'#9'T');
   dbgDetRetJudicial.Selected.Add('RTJOBS'#9'50'#9'Observaciones'#9'T');
   dbgDetRetJudicial.ApplySelected;
   DM1.cdsDetRetJud.First;
   Porcentaje;
   TNumericField(DM1.cdsDetRetJud.FieldByName('RTJIMPOR')).DisplayFormat := '###,###,##0.00';
   TNumericField(DM1.cdsDetRetJud.FieldByName('RTJIMPOR')).EditFormat    := '########0.00';
   dbgDetRetJudicial.ColumnByName('RTJIMPOR').FooterValue := FloatToStrF(DM1.OperClientDataSet(DM1.cdsDetRetJud, 'SUM(RTJIMPOR)', ''), ffNumber, 15, 2);
   dbgDetRetJudicial.ColumnByName('RTJPORC').FooterValue  := FloatToStr(DM1.OperClientDataSet(DM1.cdsDetRetJud, 'SUM(RTJPORC)', ''));
//   FDatosRetenciones.lblTitulo.Caption := 'Asociado : '+FExpedienteLiquidacion.dbeApeNom.Text;
//   FDatosRetenciones.lblCodigo.Caption := 'Código Modular : '+DM1.cdsExpLiq.FieldByName('ASOCODMOD').AsString;
   dbgDatosRetencion.RefreshDisplay;
end;

procedure TFDatosRetenciones.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DM1.cdsMaestRetJud.Filter          := '';
   DM1.cdsMaestRetJud.Filtered        := False;
   DM1.cdsMaestRetJud.IndexFieldNames := '';
   DM1.cdsMaestRetJud.Close;
   DM1.cdsDetRetJud.Filter            := '';
   DM1.cdsDetRetJud.Filtered          := False;
   DM1.cdsDetRetJud.IndexFieldNames   := '';
   DM1.cdsDetRetJud.Close;
   xCodAso := DM1.cdsExpLiq.FieldByName('ASOID').AsString;
end;

procedure TFDatosRetenciones.IBDatosRetencionClick(Sender: TObject);
var
   xWhere : String;
begin
//   If Length(DM1.cdsExpLiq.FieldByName('ASOID').AsString) = 0 Then
   If Length(xCodAso) = 0 Then
    begin
     ErrorMsg('Error', 'No se Puede Adicionar!!! No se ha Ingresado Asociado');
     Exit;
    end
   Else
    begin
     DM1.cdsMaestRetJud.Append;
     pnlRetencion.Visible := True;
     wModoC := 'A';
     xWhere := '';

     DM1.cdsMaestRetJud.FieldByName('RTJNRO').AsString    := DM1.StrZero(DM1.UltimoNum('prvSQL', 'PVS304', 'RTJNRO', xWhere), 7);
//     DM1.cdsMaestRetJud.FieldByName('CIAID').AsString     := FExpedienteLiquidacion.dblcCia.Text;
     DM1.cdsMaestRetJud.FieldByName('ASOID').AsString     := xCodAso;//FExpedienteLiquidacion.dbeCodAsociado.Text;
     xWhere := 'ASOID ='+QuotedStr(DM1.cdsMaestRetJud.FieldByName('ASOID').AsString);
     DM1.cdsMaestRetJud.FieldByName('RTJAPEPAT').AsString := DM1.DisplayDescrip('prvSQL', 'APO201', 'ASOAPEPAT', xWhere, 'ASOAPEPAT');
     DM1.cdsMaestRetJud.FieldByName('RTJAPEMAT').AsString := DM1.DisplayDescrip('prvSQL', 'APO201', 'ASOAPEMAT', xWhere, 'ASOAPEMAT');
     DM1.cdsMaestRetJud.FieldByName('RTJNOMBR').AsString  := DM1.DisplayDescrip('prvSQL', 'APO201', 'ASONOMBRES', xWhere, 'ASONOMBRES');
     DM1.cdsMaestRetJud.FieldByName('RTJNOMBRT').AsString := DM1.DisplayDescrip('prvSQL', 'APO201', 'ASOAPENOM', xWhere, 'ASOAPENOM');
     DM1.cdsMaestRetJud.FieldByName('RTJCODMOD').AsString := DM1.cdsExpLiq.FieldByName('ASOCODMOD').AsString;
     DM1.cdsMaestRetJud.FieldByName('RTJFREC').AsDateTime := Date;
     DM1.cdsMaestRetJud.FieldByName('RTJFEST').AsDateTime := Date;
     DM1.cdsMaestRetJud.FieldByName('RTJESTAD').AsString  := '01';
     dblcEstRetJudExit(Sender);
     dblcEstRetJud.SetFocus;
    end;
end;

procedure TFDatosRetenciones.dblcEstRetJudExit(Sender: TObject);
var
   xWhere : String;
begin
   xWhere := 'PVSESTDSG ='+QuotedStr(dblcEstRetJud.Text)
            +' And PVSDOC ='+QuotedStr('R');
   dbeEstRetJud.Text := DM1.DisplayDescrip('prvSQL', 'PVS102', 'PVSESTDES', xWhere, 'PVSESTDES');
end;

procedure TFDatosRetenciones.dblcEstRetJudNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFDatosRetenciones.sbtnCancelarClick(Sender: TObject);
begin
   DM1.cdsMaestRetJud.CancelUpdates;
   pnlRetencion.Visible := False;
end;

procedure TFDatosRetenciones.sbtnAceptarClick(Sender: TObject);
begin
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
//     DM1.cdsMaestRetJud.FieldByName('PVSEXPNRO').AsString := FExpedienteLiquidacion.dbeNroExped.Text;
     DM1.cdsMaestRetJud.FieldByName('PVSEXPNRO').AsString := DM1.DisplayDescrip('prvSQL', 'PVS301', 'PVSEXPNRO', 'ASOID ='+QuotedStr(xCodAso), 'PVSEXPNRO');// FExpedienteLiquidacion.dbeNroExped.Text;
     If Length(DM1.cdsQry.FieldByName('PVSEXPNRO').AsString) = 0 Then
      begin
       Beep;
       MessageDlg('El Asociado NO tiene Expediente Ingresado', mtInformation, [mbOk], 0);
       pnlRetencion.Visible := False;
       DM1.cdsMaestRetJud.CancelUpdates;       
//       FExpedienteLiquidacion.DatosRetenciones(Sender);
       Screen.Cursor := crDefault;
       Exit;
      end;
     DM1.cdsMaestRetJud.FieldByName('FREG').AsDateTime    := Date;
     DM1.cdsMaestRetJud.FieldByName('HREG').AsDateTime    := Date+Time;
     DM1.cdsMaestRetJud.FieldByName('USUARIO').AsString   := DM1.wUsuario;
     DM1.cdsPost( DM1.cdsMaestRetJud );
     DM1.AplicaDatos(DM1.cdsMaestRetJud, 'RETJUDPREV');
     Beep;
     MessageDlg('Datos Actualizados', mtCustom, [mbOk], 0);
     pnlRetencion.Visible := False;
//     FExpedienteLiquidacion.DatosRetenciones(Sender);
    end;
   Screen.Cursor := crDefault;
end;

procedure TFDatosRetenciones.dbgDatosRetencionDblClick(Sender: TObject);
begin
   If DM1.cdsMaestRetJud.RecordCount = 0 Then
    begin
     ErrorMsg('Error', 'No Existen Datos a Editar');
     pnlRetencion.Visible := False;
     Exit;
    end
   Else
    begin
     pnlRetencion.Visible := True;
     dblcEstRetJudExit(Sender);
     wModoC := 'M';
    end;
end;

procedure TFDatosRetenciones.IBDetalleRetClick(Sender: TObject);
var
   xWhere : String;
begin
   wModoC := 'A';
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
     DM1.cdsDEtRetJud.FieldByName('RTJNRO').AsString    := DM1.cdsMaestRetJud.FieldByName('RTJNRO').AsString;
     DM1.cdsDetRetJud.FieldByName('RTJFREC').AsDateTime := Date;
     dbeDescDpto.Clear;
     dbeJuzgado.SetFocus;
    end;
{
   If DM1.cdsMaestRetJud.RecordCount = 0 Then
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
     DM1.cdsDetRetJud.FieldByName('RTJCORR').AsString   := DM1.StrZero(DM1.UltimoNum('prvSQL', 'PVS305', 'RTJCORR', xWhere), 2);
     DM1.cdsDetRetJud.FieldByName('ASOID').AsString     := DM1.cdsMaestRetJud.FieldByName('ASOID').AsString;
     DM1.cdsDEtRetJud.FieldByName('RTJNRO').AsString    := DM1.cdsMaestRetJud.FieldByName('RTJNRO').AsString;
     DM1.cdsDetRetJud.FieldByName('RTJFREC').AsDateTime := Date;
     dbeDescDpto.Clear;
     dbeJuzgado.SetFocus;
    end;}
end;

procedure TFDatosRetenciones.sbtnCancelarDetalleClick(Sender: TObject);
begin
   DM1.cdsDetRetJud.CancelUpdates;
   pnlDetRetJud.Visible := False;
end;

procedure TFDatosRetenciones.dblcDptoExit(Sender: TObject);
var
   xWhere : String;
begin
   xWhere := 'DPTOID ='+QuotedStr(dblcDpto.Text);
   dbeDescDpto.Text := DM1.DisplayDescrip('prvSQL', 'TGE158', 'DPTOID, DPTODES', xWhere, 'DPTODES')
end;

procedure TFDatosRetenciones.dbgDetRetJudicialDblClick(Sender: TObject);
begin
   wModoC := 'M';
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
end;

procedure TFDatosRetenciones.sbtnAceptarDetalleClick(Sender: TObject);
begin
   If Not ValidaDatosDetalle Then
    Exit;

   Screen.Cursor := crHourGlass;
   DM1.cdsDetRetJud.Edit;
   If rgTipo.ItemIndex = 0 Then
    DM1.cdsDetRetJud.FieldByName('RTJFPOIM').AsString := 'P'
   Else
    DM1.cdsDetRetJud.FieldByName('RTJFPOIM').AsString := 'I';
   DM1.cdsDetRetJud.FieldByName('FREG').AsDateTime  := Date;
   DM1.cdsDetRetJud.FieldByName('HREG').AsDateTime  := Date+Time;
   DM1.cdsDetRetJud.FieldByName('USUARIO').AsString := DM1.wUsuario;
   DM1.cdsPost( DM1.cdsDetRetJud );
   DM1.AplicaDatos(DM1.cdsDetRetJud, 'DETRETJUDPREV');
   dbgDetRetJudicial.ColumnByName('RTJIMPOR').FooterValue := FloatToStrF(DM1.OperClientDataSet(DM1.cdsDetRetJud, 'SUM(RTJIMPOR)', ''), ffNumber, 15, 2);
   dbgDetRetJudicial.ColumnByName('RTJPORC').FooterValue  := FloatToStr(DM1.OperClientDataSet(DM1.cdsDetRetJud, 'SUM(RTJPORC)', ''));
   DM1.cdsDetRetJud.First;

//Para Grabar en la Tabla de Retenciones
   If wModoC = 'A' Then
    begin
     DM1.cdsMaestRetJud.Edit;
     DM1.cdsMaestRetJud.FieldByName('FREG').AsDateTime  := Date;
     DM1.cdsMaestRetJud.FieldByName('HREG').AsDateTime  := Date+Time;
     DM1.cdsMaestRetJud.FieldByName('USUARIO').AsString := DM1.wUsuario;
     DM1.cdsPost( DM1.cdsMaestRetJud );
     DM1.AplicaDatos(DM1.cdsMaestRetJud, 'RETJUDPREV');
    end;
//*********

   Beep;
   MessageDlg('Datos del Detalle de la Retención Actualizados', mtCustom, [mbOk], 0);
   pnlDetRetJud.Visible := False;
   Screen.Cursor := crDefault;
end;

function TFDatosRetenciones.ValidaDatosDetalle:Boolean;
begin
   Result := False;
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
     MessageDlg('Ingrese el Apellido Materno', mtInformation, [mbOk], 0);
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
     dbeValor.SetFocus;
     Exit;
    end;

   Result := True;
end;

function TFDatosRetenciones.Porcentaje : Integer;
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

procedure TFDatosRetenciones.rgTipoClick(Sender: TObject);
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

procedure TFDatosRetenciones.dbeValorExit(Sender: TObject);
begin
   If rgTipo.ItemIndex = 0 Then
    begin
     If Length(dbeValor.Text) = 0 Then
      Exit;
//     Porcentaje;
     If StrToInt(dbeValor.Text) > xPorcentaje Then
      begin
       ErrorMsg('Error', 'El Porcentaje Máximo a asignar debe ser '+IntToStr(xPorcentaje));
       DM1.cdsDetRetJud.FieldByName('RTJPORC').AsInteger := xPorcentaje;
       dbeValor.SetFocus;
      end;

     If StrToInt(dbeValor.Text) > 100 Then
      begin
       Beep;
       MessageDlg('El Porcentaje debe ser Menor a 100', mtError, [mbOk], 0);
       dbeValor.SetFocus;
       Exit;
      end;
    end
   Else
    begin
     If Length(dbeValor.Text) = 0 Then
      Exit;
     TNumericField(DM1.cdsDetRetJud.FieldByName('RTJIMPOR')).DisplayFormat := '###,###,##0.00';
     TNumericField(DM1.cdsDetRetJud.FieldByName('RTJIMPOR')).EditFormat    := '########0.00';
    end;
end;

function TFDatosRetenciones.NroRetenciones:Integer;
var
   xWhere : String;
begin
   xWhere := 'ASOID ='+QuotedStr(DM1.cdsMaestRetJud.FieldByName('ASOID').AsString);
   xNroRet := StrToInt(DM1.DisplayDescrip('prvSQL', 'PVS304', 'COUNT(ASOID) ASOID', xWhere, 'ASOID'));
end;

function TFDatosRetenciones.NroDetRetenciones:Integer;
var
   xWhere : String;
begin
   xWhere := 'ASOID ='+QuotedStr(DM1.cdsMaestRetJud.FieldByName('ASOID').AsString);
   xNroDetRet := StrToInt(DM1.DisplayDescrip('prvSQL', 'PVS305', 'COUNT(ASOID) ASOID', xWhere, 'ASOID'));
end;

procedure TFDatosRetenciones.dblcEstRetJudKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key In [' ', 'A'..'Z', 'a'..'z',
              '°', '|', '¬', '!', '"', '#', '$', '%', '&', '/', '(', ')',
              '=', '?', '\', '¡', '¿', '@', '¨', '´', '*', '+', '~', '[',
              ']', '{', '}', '^', '`', '<', '>', ';', ',', ':', '''',
              '.', '-', '_'] Then
    Key := #0;
end;

procedure TFDatosRetenciones.FormKeyPress(Sender: TObject; var Key: Char);
begin
   If Key = #13 Then
    begin
     Key := #0;
     Perform(CM_DialogKey, VK_TAB, 0);
    end;
end;

procedure TFDatosRetenciones.chkBuscarClick(Sender: TObject);
begin
   If chkBuscar.Checked Then
    begin
     grpBuscar.Enabled := True;
     dbeAsoApeNom.SetFocus;     
    end
   Else
    grpBuscar.Enabled := False;
end;

procedure TFDatosRetenciones.Z1bbtnBuscarClick(Sender: TObject);
var
   xSQL : String;
begin
   Screen.Cursor := crHourGlass;
   If Length(Trim(dbeAsoApeNom.Text)) > 0 Then
    begin
     xSQL := 'Select ASOID, ASOCODMOD, ASOAPENOM From APO201'
            +' Where ASOAPENOM LIKE '+QuotedStr(Trim(dbeAsoApeNom.Text+'%'));

     DM1.cdsQry2.IndexFieldNames :='';
     DM1.cdsQry2.Filter   :='';
     DM1.cdsQry2.Filtered := False;
     DM1.cdsQry2.Close;
     DM1.cdsQry2.DataRequest(xSQL);
     DM1.cdsQry2.Open;

     //** CARGA LOS DATOS DEL ASOCIADO
     If DM1.cdsQry2.RecordCount = 0 Then
      begin
       Beep;
       MessageDlg('No Existen Asociados con el Nombre '+dbeAsoApeNom.Text, mtInformation, [mbOk], 0);
       dbeAsoApeNom.SetFocus;
       Screen.Cursor := crDefault;
       Exit;
      end
     Else
      begin
       If DM1.cdsQry2.RecordCount = 1 Then
        begin
         xCodAso := DM1.cdsQry2.FieldByName('ASOID').AsString;
         
         xSQL := 'Select * From PVS102'
                +' Where PVSDOC ='+QuotedStr('R');

         DM1.cdsEstCarta.Filter   := '';
         DM1.cdsEstCarta.Filtered := False;
         DM1.cdsEstCarta.IndexFieldNames := '';
         DM1.cdsEstCarta.Close;
         DM1.cdsEstCarta.DataRequest(xSQL);
         DM1.cdsEstCarta.Open;
         DM1.cdsEstCarta.IndexFieldNames := 'PVSESTDSG';

         xSQL := 'Select * From PVS304'
                +' Where ASOID ='+QuotedStr(xCodAso);

         DM1.cdsMaestRetJud.Filter   := '';
         DM1.cdsMaestRetJud.Filtered := False;
         DM1.cdsMaestRetJud.IndexFieldNames := '';
         DM1.cdsMaestRetJud.Close;
         DM1.cdsMaestRetJud.DataRequest(xSQL);
         DM1.cdsMaestRetJud.Open;
         DM1.cdsMaestRetJud.IndexFieldNames := 'RTJNRO';

         dbgDatosRetencion.Selected.Clear;
         dbgDatosRetencion.Selected.Add('RTJNRO'#9'10'#9'Nro~Retención'#9'T');
         dbgDatosRetencion.Selected.Add('CIAID'#9'5'#9'Id~Compañía'#9'T');
         dbgDatosRetencion.Selected.Add('RTJAPEPAT'#9'20'#9'Apellido~Paterno'#9'T');
         dbgDatosRetencion.Selected.Add('RTJAPEMAT'#9'20'#9'Apellido~Materno'#9'T');
         dbgDatosRetencion.Selected.Add('RTJNOMBR'#9'20'#9'Nombres'#9'T');
         dbgDatosRetencion.Selected.Add('RTJFREC'#9'10'#9'Fecha~Recepción');
         dbgDatosRetencion.Selected.Add('RTJESTAD'#9'5'#9'Estado~Retención');
         dbgDatosRetencion.ApplySelected;

         If DM1.cdsMaestRetJud.RecordCount = 0 Then
          IBDatosRetencion.Enabled := True
         Else
          IBDatosRetencion.Enabled := False;

         xSQL := 'Select * From PVS305'
                +' Where ASOID ='+QuotedStr(xCodAso);

         DM1.cdsDetRetJud.Filter   := '';
         DM1.cdsDetRetJud.Filtered := False;
         DM1.cdsDetRetJud.IndexFieldNames := '';
         DM1.cdsDetRetJud.Close;
         DM1.cdsDetRetJud.DataRequest(xSQL);
         DM1.cdsDetRetJud.Open;
         DM1.cdsDetRetJud.IndexFieldNames := 'RTJCORR';
         pnlDetRetJud.Visible := False;

         dbgDetRetJudicial.Selected.Clear;
         dbgDetRetJudicial.Selected.Add('RTJCORR'#9'8'#9'Nro~Retención'#9'T');
         dbgDetRetJudicial.Selected.Add('RTJJUZG'#9'35'#9'Juzgado'#9'T');
         dbgDetRetJudicial.Selected.Add('RTJAPEPAT'#9'20'#9'Apellido~Paterno'#9'T');
         dbgDetRetJudicial.Selected.Add('RTJAPEMAT'#9'20'#9'Apellido~Materno'#9'T');
         dbgDetRetJudicial.Selected.Add('RTJNOMBR'#9'20'#9'Nombres'#9'T');
         dbgDetRetJudicial.Selected.Add('RTJDPTOID'#9'2'#9'Dpto~Id'#9'T');
         dbgDetRetJudicial.Selected.Add('RTJFREC'#9'10'#9'Fecha~Recepción'#9'T');
         dbgDetRetJudicial.Selected.Add('RTJNOFIC'#9'12'#9'Nro~Oficio'#9'T');
         dbgDetRetJudicial.Selected.Add('RTJPORC'#9'5'#9'Porcentaje'#9'T');
         dbgDetRetJudicial.Selected.Add('RTJIMPOR'#9'15'#9'Importe'#9'T');
         dbgDetRetJudicial.Selected.Add('RTJOBS'#9'50'#9'Observaciones'#9'T');
         dbgDetRetJudicial.ApplySelected;
         DM1.cdsDetRetJud.First;

         Porcentaje;

         TNumericField(DM1.cdsDetRetJud.FieldByName('RTJIMPOR')).DisplayFormat := '###,###,##0.00';
         TNumericField(DM1.cdsDetRetJud.FieldByName('RTJIMPOR')).EditFormat    := '########0.00';

         dbgDetRetJudicial.ColumnByName('RTJIMPOR').FooterValue := FloatToStrF(DM1.OperClientDataSet(DM1.cdsDetRetJud, 'SUM(RTJIMPOR)', ''), ffNumber, 15, 2);
         dbgDetRetJudicial.ColumnByName('RTJPORC').FooterValue  := FloatToStr(DM1.OperClientDataSet(DM1.cdsDetRetJud, 'SUM(RTJPORC)', ''));

         FDatosRetenciones.lblTitulo.Caption := 'Asociado : '+DM1.cdsQry2.FieldByName('ASOAPENOM').AsString;
         FDatosRetenciones.lblCodigo.Caption := 'Código Modular : '+DM1.cdsQry2.FieldByName('ASOCODMOD').AsString;

         dbgDatosRetencion.RefreshDisplay;
        end
       Else
        LevantaFiltro('ASOAPENOM LIKE '+QuotedStr(Trim(dbeAsoApeNom.Text+'%')));
      end;
    end;
   Screen.Cursor := crDefault;
end;

procedure TFDatosRetenciones.LevantaFiltro(xCampo: String);
var
   Mtx : TMant;
begin
   DM1.cdsAsoX.Close;
   Mtx  := TMant.Create(Self);
   Try
    Mtx.Admin           := DM1.wAdmin;
    Mtx.User            := DM1.wUsuario;
    Mtx.TableName       := 'APO201';
    Mtx.Registros       := 30;
    Mtx.ClientDataSet   := DM1.cdsAsoX;
    Mtx.Filter          := xCampo;
    Mtx.DComC           := DM1.DCOM1;
    Mtx.Module          := DM1.wModulo;
    Mtx.Titulo 	        := 'Asociados';
    Mtx.SectionName     := 'AsociaX';
    Mtx.FileNameIni     := '\SOLAPO.INI';
    Mtx.OnEdit          := OnEditAso;
    Mtx. Execute;
   Finally
    DM1.cdsAsoX.Close;
    Mtx.Free;
   end;
   DM1.cdsAsoX.Filter   := '';
   DM1.cdsAsoX.Filtered := False;
   DM1.cdsAsoX.IndexFieldNames := '';
   DM1.cdsAsoX.Close;
end;

procedure TFDatosRetenciones.OnEditAso(Sender: TObject; MantFields: TFields);
var
   xSQL : String;
begin
   Screen.Cursor := crHourGlass;
   dbeAsoApeNom.Text := DM1.cdsAsoX.FieldByName('ASOAPENOM').AsString;
   xCodAso := DM1.cdsAsoX.FieldByName('ASOID').AsString;

   xSQL := 'Select * From PVS102'
          +' Where PVSDOC ='+QuotedStr('R');

   DM1.cdsEstCarta.Filter   := '';
   DM1.cdsEstCarta.Filtered := False;
   DM1.cdsEstCarta.IndexFieldNames := '';
   DM1.cdsEstCarta.Close;
   DM1.cdsEstCarta.DataRequest(xSQL);
   DM1.cdsEstCarta.Open;
   DM1.cdsEstCarta.IndexFieldNames := 'PVSESTDSG';

   xSQL := 'Select * From PVS304'
//          +' Where ASOID ='+QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString);
          +' Where ASOID ='+QuotedStr(xCodAso);

   DM1.cdsMaestRetJud.Filter   := '';
   DM1.cdsMaestRetJud.Filtered := False;
   DM1.cdsMaestRetJud.IndexFieldNames := '';
   DM1.cdsMaestRetJud.Close;
   DM1.cdsMaestRetJud.DataRequest(xSQL);
   DM1.cdsMaestRetJud.Open;
   DM1.cdsMaestRetJud.IndexFieldNames := 'RTJNRO';

   dbgDatosRetencion.Selected.Clear;
   dbgDatosRetencion.Selected.Add('RTJNRO'#9'10'#9'Nro~Retención'#9'T');
   dbgDatosRetencion.Selected.Add('CIAID'#9'5'#9'Id~Compañía'#9'T');
   dbgDatosRetencion.Selected.Add('RTJAPEPAT'#9'20'#9'Apellido~Paterno'#9'T');
   dbgDatosRetencion.Selected.Add('RTJAPEMAT'#9'20'#9'Apellido~Materno'#9'T');
   dbgDatosRetencion.Selected.Add('RTJNOMBR'#9'20'#9'Nombres'#9'T');
   dbgDatosRetencion.Selected.Add('RTJFREC'#9'10'#9'Fecha~Recepción');
   dbgDatosRetencion.Selected.Add('RTJESTAD'#9'5'#9'Estado~Retención');
//   dbgDatosRetencion.Selected.Add('DSGOBS'#9'25'#9'Observaciones');
   dbgDatosRetencion.ApplySelected;

   If DM1.cdsMaestRetJud.RecordCount = 0 Then
    IBDatosRetencion.Enabled := True
   Else
    IBDatosRetencion.Enabled := False;

   xSQL := 'Select * From PVS305'
//          +' Where ASOID ='+QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString);
          +' Where ASOID ='+QuotedStr(xCodAso);

   DM1.cdsDetRetJud.Filter   := '';
   DM1.cdsDetRetJud.Filtered := False;
   DM1.cdsDetRetJud.IndexFieldNames := '';
   DM1.cdsDetRetJud.Close;
   DM1.cdsDetRetJud.DataRequest(xSQL);
   DM1.cdsDetRetJud.Open;
   DM1.cdsDetRetJud.IndexFieldNames := 'RTJCORR';
   pnlDetRetJud.Visible := False;

   dbgDetRetJudicial.Selected.Clear;
   dbgDetRetJudicial.Selected.Add('RTJCORR'#9'8'#9'Nro~Retención'#9'T');
   dbgDetRetJudicial.Selected.Add('RTJJUZG'#9'35'#9'Juzgado'#9'T');
   dbgDetRetJudicial.Selected.Add('RTJAPEPAT'#9'20'#9'Apellido~Paterno'#9'T');
   dbgDetRetJudicial.Selected.Add('RTJAPEMAT'#9'20'#9'Apellido~Materno'#9'T');
   dbgDetRetJudicial.Selected.Add('RTJNOMBR'#9'20'#9'Nombres'#9'T');
   dbgDetRetJudicial.Selected.Add('RTJDPTOID'#9'2'#9'Dpto~Id'#9'T');
   dbgDetRetJudicial.Selected.Add('RTJFREC'#9'10'#9'Fecha~Recepción'#9'T');
   dbgDetRetJudicial.Selected.Add('RTJNOFIC'#9'12'#9'Nro~Oficio'#9'T');
   dbgDetRetJudicial.Selected.Add('RTJPORC'#9'5'#9'Porcentaje'#9'T');
   dbgDetRetJudicial.Selected.Add('RTJIMPOR'#9'15'#9'Importe'#9'T');
   dbgDetRetJudicial.Selected.Add('RTJOBS'#9'50'#9'Observaciones'#9'T');
   dbgDetRetJudicial.ApplySelected;
   DM1.cdsDetRetJud.First;

   Porcentaje;

   TNumericField(DM1.cdsDetRetJud.FieldByName('RTJIMPOR')).DisplayFormat := '###,###,##0.00';
   TNumericField(DM1.cdsDetRetJud.FieldByName('RTJIMPOR')).EditFormat    := '########0.00';

   dbgDetRetJudicial.ColumnByName('RTJIMPOR').FooterValue := FloatToStrF(DM1.OperClientDataSet(DM1.cdsDetRetJud, 'SUM(RTJIMPOR)', ''), ffNumber, 15, 2);
   dbgDetRetJudicial.ColumnByName('RTJPORC').FooterValue  := FloatToStr(DM1.OperClientDataSet(DM1.cdsDetRetJud, 'SUM(RTJPORC)', ''));

   dbgDatosRetencion.RefreshDisplay;

   lblTitulo.Caption := 'Asociado : '+DM1.cdsAsoX.FieldByName('ASOAPENOM').AsString;
   lblCodigo.Caption := 'Código Modular : '+DM1.cdsAsoX.FieldByName('ASOCODMOD').AsString;

   TMant(Sender).FMant.Close;
   Screen.Cursor := crDefault;
end;


end.
