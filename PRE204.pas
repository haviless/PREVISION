unit PRE204;

interface           

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwdbdatetimepicker, StdCtrls, Buttons, Wwdbigrd, Grids, Wwdbgrid,
  wwdblook, Mask, wwdbedit, fcButton, fcImgBtn, fcShapeBtn, ExtCtrls,
  ComCtrls, wwriched, Wwdbdlg, GridControl, fcLabel, db;

type
  TFCartaDesignacion = class(TForm)
    pnlCabecera: TPanel;
    Panel2: TPanel;
    dbeDescripCia: TwwDBEdit;
    Panel1: TPanel;
    dblcEstCarta: TwwDBLookupCombo;
    dbeEstCarta: TwwDBEdit;
    dbeCodModular: TwwDBEdit;
    dblcEstAsociado: TwwDBLookupCombo;
    dbeEstAsoc: TwwDBEdit;
    dbreObs: TwwDBRichEdit;
    dbeDNI: TwwDBEdit;
    dblcCia: TwwDBLookupCombo;
    pnlDatosBenef: TPanel;
    Bevel1: TBevel;
    fcLabel1: TfcLabel;
    dbgDetalleCarta: TwwDBGrid;
    dbeNroCarta: TwwDBEdit;
    dbdtpFecRecepcion: TwwDBDateTimePicker;
    dbeUProceso: TwwDBEdit;
    dbeUPago: TwwDBEdit;
    dbeUSE: TwwDBEdit;
    dbdtpFecOper: TwwDBDateTimePicker;
    pnlDetCarta: TPanel;
    Bevel2: TBevel;
    dbeApePatBenef: TwwDBEdit;
    dbeApeMatBenef: TwwDBEdit;
    dbeDetNombBenef: TwwDBEdit;
    dblcTipoRelacBenef: TwwDBLookupCombo;
    dbeDescTipoRelacBenef: TwwDBEdit;
    dbdtpFecNacBenef: TwwDBDateTimePicker;
    sbtnAceptarDetalle: TfcShapeBtn;
    sbtnCancelarDetalle: TfcShapeBtn;
    sbtnAceptar: TfcShapeBtn;
    sbtnCancelar: TfcShapeBtn;
    Bevel3: TBevel;
    dblcSexoBenef: TwwDBLookupCombo;
    dbeDescSexoBenef: TwwDBEdit;
    dbeDNIBenef: TwwDBEdit;
    dbePorcBenef: TwwDBEdit;
    dbeApePatT: TwwDBEdit;
    dbeApeMatT: TwwDBEdit;
    dbeNombT: TwwDBEdit;
    dbeDNITutor: TwwDBEdit;
    dbeCodAsociado: TwwDBEdit;
    dbdtpFecApertura: TwwDBDateTimePicker;
    sbtnAnular: TfcShapeBtn;
    dbdtpFecAnul: TwwDBDateTimePicker;
    lblFecAnul: TLabel;
    dbeApeNom: TwwDBEdit;
    Label1: TLabel;
    bbtnAdicionar: TfcShapeBtn;
    dbgIbDetalleCartaIButton: TwwIButton;
    Label24: TLabel;
    dblcFPago: TwwDBLookupCombo;
    dbeFPago: TwwDBEdit;
    dblcBanco: TwwDBLookupCombo;
    Label15: TLabel;
    dbeBanco: TwwDBEdit;
    dblcdLugGiro: TwwDBLookupComboDlg;
    Label13: TLabel;
    dbeLugGiro: TwwDBEdit;
    Label4: TLabel;
    dblcdDptoBco: TwwDBLookupComboDlg;
    dbeDptoBco: TwwDBEdit;
    procedure sbtnCancelarClick(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dblcCiaKeyPress(Sender: TObject; var Key: Char);
    procedure sbtnAceptarClick(Sender: TObject);
    procedure dblcSexoBenefExit(Sender: TObject);
    procedure dbgIbDetalleCartaIButtonClick(Sender: TObject);
    procedure dbgDetalleCartaDblClick(Sender: TObject);
    procedure sbtnAceptarDetalleClick(Sender: TObject);
    procedure dblcSexoBenefKeyPress(Sender: TObject; var Key: Char);
    procedure dbdtpFecNacBenefExit(Sender: TObject);
    procedure dblcEstAsociadoExit(Sender: TObject);
    procedure dblcEstCartaExit(Sender: TObject);
    procedure dblcTipoRelacBenefExit(Sender: TObject);
    procedure sbtnCancelarDetalleClick(Sender: TObject);
    procedure dbePorcBenefExit(Sender: TObject);
    procedure bbtnBuscarClick(Sender: TObject);
    procedure dbeApeNomExit(Sender: TObject);
    procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
    function ValidaDatosCarta:Boolean;
    function ValidaDatosDetalleCarta:Boolean;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnAnularClick(Sender: TObject);
    procedure LlenaDatos(xCodAso: String);
    procedure ValidaDatos(xCodAso : String);
    procedure bbtnAdicionarClick(Sender: TObject);
    procedure dblcFPagoExit(Sender: TObject);
    procedure dblcFPagoNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
    procedure dblcBancoExit(Sender: TObject);
    procedure dblcBancoNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
    procedure dblcdLugGiroExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbdtpFecAperturaExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbgDetalleCartaKeyDown(Sender: TObject; var Key: Word;    Shift: TShiftState);
    procedure dblcdDptoBcoExit(Sender: TObject);

  private
    { Private declarations }
   xTabla, xCorre, xCorreCampo, xCorreCadena, xNroCarta : String;
   xCeros : Integer;
   xPaso : Boolean; //** True = el correlativo es valido
   xTipoCorre, xArea, xCorreWhere, xCorreWherex, xCorreWherey : String;
   Year, Month, Day : Word;
   procedure Correlativo; //** llama a CorreCred y BuscaCorre
   procedure CorreCred(pCorre : String); //** para el correlativo del numero del crédito
   procedure BuscaCorre; //** para constatar que nop exista el numero del crédito
  public
    { Public declarations }
  end;

var
  FCartaDesignacion: TFCartaDesignacion;
  xUseId, xUProId, xUPagoId : String;
  xPorcentaje, xEdiPorc : Real;
  Ano, Mes, Dia : Integer;
  wModoDet, xFecha : String;

implementation

uses MsgDlgs, PREDM, PRE001, PRE261;

{$R *.DFM}

procedure TFCartaDesignacion.sbtnCancelarClick(Sender: TObject);
begin
   DM1.cdsMaestCartas.CancelUpdates;
   Close;
end;

procedure TFCartaDesignacion.dblcCiaExit(Sender: TObject);
var
   xWhere : String;
begin
   If length(dblcCia.Text) = 0 Then
    begin
     Beep;
     MessageDlg('Ingrese el Código de la Compañía', mtInformation, [mbOk], 0);
     dblcCia.SetFocus;
     Exit;
    end;

   If length(DM1.cdsMaestCartas.FieldByName('CIAID').AsString) = 0 Then
    begin
     Beep;
     MessageDlg('Ingrese el Código de la Compañía', mtInformation, [mbOk], 0);
     dblcCia.SetFocus;
     Exit;
    end;

   xWhere := 'CIAID ='+QuotedStr(DM1.cdsMaestCartas.FieldByName('CIAID').AsString); //dblcCia.Text);
   If length(DM1.DisplayDescrip('prvSQL', 'TGE101', 'CIAID, CIADES', xWhere, 'CIAID')) = 0 Then
    begin
     Beep;
     MessageDlg('El Código de la Compañía No Existe', mtInformation, [mbOk], 0);
     dblcCia.SetFocus;
     Exit;
    end
   Else
    begin
     DM1.cdsMaestCartas.Edit;
     DM1.cdsMaestCartas.FieldByName('CIAID').AsString := DM1.cdsQry.FieldByName('CIAID').AsString;
     dbeDescripCia.Text := DM1.cdsQry.FieldByName('CIADES').AsString;
    end;
end;

procedure TFCartaDesignacion.FormActivate(Sender: TObject);
var
   xSql, xWhere : String;
begin
  If DM1.wModo = 'M' Then
  Begin
    xSql := 'SELECT * FROM PVS306 WHERE ASOID = '+QuotedStr(DM1.cdsSQL.FieldByName('ASOID').AsString)
    +' AND PVSESTLIQ IN (''02'',''05'')';
    DM1.cdsCabLiq.Close;
    DM1.cdsCabLiq.DataRequest(xSql);
    DM1.cdsCabLiq.Open;
    If DM1.cdsCabLiq.RecordCount > 0 Then
    Begin
      sbtnAnular.Enabled := False;
      sbtnAceptar.Enabled := False;
      bbtnAdicionar.Enabled := False;
      sbtnAceptarDetalle.Enabled := False;
      dbgIbDetalleCartaIButton.Enabled := Enabled;
    End;
  End;

   dbdtpFecAnul.Enabled := False;
   xWhere := 'Select '+wRepFuncChar+DM1.wRepFecServi+', '+QuotedStr(DM1.wFormatFecha)+') "FECHA", '+DM1.wRepFecServi+' HORA From DUAL';
   DM1.cdsReporte.Close;
   DM1.cdsReporte.DataRequest(xWhere);
   DM1.cdsReporte.Open;
   xFec_Sis := DM1.cdsReporte.FieldByName('FECHA').AsString;
   xHor_Sis := DM1.cdsReporte.FieldByName('HORA').AsString;

   xSQL := 'Select PVSESTDSG, PVSESTDES, PVSDOC From PVS102'
          +' Where PVSDOC='+QuotedStr('C');

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
     DM1.cdsMaestCartas.IndexFieldNames := 'DSGNRO; ASOID';

     DM1.cdsMaestCartas.Append;
     xWhere := '';
     DM1.cdsMaestCartas.FieldByName('DSGNRO').AsString     := DM1.StrZero(DM1.UltimoNum('prvSQL', 'PVS302', 'DSGNRO', xWhere), 7);
     DM1.cdsMaestCartas.FieldByName('DSGFREC').AsDateTime  := Date;
     DM1.cdsMaestCartas.FieldByName('DSGFAPER').AsDateTime := Date;
     DM1.cdsMaestCartas.FieldByName('DSGVIG').AsString     := 'N';
     DM1.cdsMaestCartas.FieldByName('DSGESTAD').AsString   := '01';
     DM1.cdsMaestCartas.FieldByName('CIAID').AsString      := '02';
     dblcEstCartaExit(Sender);
     dblcCiaExit(Sender);
     dbdtpFecAperturaExit(Sender);

     xSQL := 'SELECT * FROM PVS303 WHERE ASOID =''''';
     DM1.cdsDetCartas.Filter   := '';
     DM1.cdsDetCartas.Filtered := False;
     DM1.cdsDetCartas.IndexFieldNames := '';
     DM1.cdsDetCartas.Close;
     DM1.cdsDetCartas.DataRequest(xSQL);
     DM1.cdsDetCartas.Open;

     pnlDetCarta.Visible := False;
     dbgIbDetalleCartaIButton.Enabled := False;

     dbgDetalleCarta.Selected.Clear;
     dbgDetalleCarta.Selected.Add('DSGTREL'#9'2'#9'Tipo~Relación'#9'T');
     dbgDetalleCarta.Selected.Add('DSGAPEPAT'#9'20'#9'Apellido~Paterno'#9'T');
     dbgDetalleCarta.Selected.Add('DSGAPEMAT'#9'20'#9'Apellido~Materno'#9'T');
     dbgDetalleCarta.Selected.Add('DSGNOMBR'#9'20'#9'Nombres'#9'T');
     dbgDetalleCarta.Selected.Add('DSGFNAC'#9'10'#9'Fecha~Nacimiento'#9'T');
     dbgDetalleCarta.Selected.Add('DSGSEX'#9'1'#9'Sexo'#9'T');
     dbgDetalleCarta.Selected.Add('DSGPORC'#9'5'#9'Porcentaje'#9'T');
     dbgDetalleCarta.ApplySelected;
     DM1.cdsDetCartas.First;

     dbeCodModular.Clear;
     dblcEstAsociado.Clear;   dbeEstAsoc.Clear;
     dbeUProceso.Clear;       dbeUPago.Clear;
     dbeUSE.Clear;            dbeDNI.Clear;
     dbreObs.Clear;           dbeApeNom.Enabled := True;
     dblcCia.Enabled           := True;
     dbdtpFecRecepcion.Enabled := True;
     dbdtpFecOper.Enabled      := True;
     dbreObs.Enabled           := True;
     bbtnAdicionar.Enabled     := True;
     dblcCia.SetFocus;
     dbeFPago.Clear;          dbeBanco.Clear;
     dbeDptoBco.Clear;        dbeLugGiro.Clear;
     sbtnAnular.Enabled := False;
    end;

  //Si se encuentra en Modo Edición
   If DM1.wModo = 'M' Then
    begin
     DM1.cdsMaestCartas.IndexFieldNames := 'CIAID; DSGNRO; ASOID';
     DM1.cdsMaestCartas.SetKey;
     DM1.cdsMaestCartas.FieldByName('CIAID').AsString  := DM1.cdsSQL.FieldByName('CIAID').AsString;
     DM1.cdsMaestCartas.FieldByName('DSGNRO').AsString := DM1.cdsSQL.FieldByName('DSGNRO').AsString;
     DM1.cdsMaestCartas.FieldByName('ASOID').AsString  := DM1.cdsSQL.FieldByName('ASOID').AsString;
     If DM1.cdsMaestCartas.GotoKey Then
      begin
       DM1.cdsMaestCartas.Edit;
       DM1.cdsMaestCartas.FieldByName('CIAID').AsString  := DM1.cdsSQL.FieldByName('CIAID').AsString;
       DM1.cdsMaestCartas.FieldByName('DSGNRO').AsString := DM1.cdsSQL.FieldByName('DSGNRO').AsString;
       DM1.cdsMaestCartas.FieldByName('ASOID').AsString  := DM1.cdsSQL.FieldByName('ASOID').AsString;
       dbeApeNom.Enabled  := False;
       If DM1.cdsCabLiq.RecordCount = 0 Then sbtnAnular.Enabled := True;
       dblcCiaExit(Sender);
       dbdtpFecAperturaExit(Sender);
       DM1.cdsMaestCartas.FieldByName('ASOID').AsString  := DM1.cdsSQL.FieldByName('ASOID').AsString;
       LlenaDatos(DM1.cdsSQL.FieldByName('ASOID').AsString);
       dblcEstCartaExit(Sender);
      end;
     xSQL := 'SELECT * FROM PVS303'
            +' Where DSGNRO ='+QuotedStr(DM1.cdsSQL.FieldByName('DSGNRO').AsString)
            +' And ASOID ='+QuotedStr(DM1.cdsSQL.FieldByName('ASOID').AsString);
     DM1.cdsDetCartas.Filtered := False;
     DM1.cdsDetCartas.Filter   := '';
     DM1.cdsDetCartas.Filtered := True;
     DM1.cdsDetCartas.IndexFieldNames := '';
     DM1.cdsDetCartas.Close;
     DM1.cdsDetCartas.DataRequest(xSQL);
     DM1.cdsDetCartas.Open;
     DM1.cdsDetCartas.IndexFieldNames := 'DSGTREL';
     pnlDetCarta.Visible := False;
     dbgIbDetalleCartaIButton.Enabled := False;

     dbgDetalleCarta.Selected.Clear;
     dbgDetalleCarta.Selected.Add('DSGTREL'#9'2'#9'Tipo~Relación'#9'T');
     dbgDetalleCarta.Selected.Add('DSGAPEPAT'#9'20'#9'Apellido~Paterno'#9'T');
     dbgDetalleCarta.Selected.Add('DSGAPEMAT'#9'20'#9'Apellido~Materno'#9'T');
     dbgDetalleCarta.Selected.Add('DSGNOMBR'#9'20'#9'Nombres'#9'T');
     dbgDetalleCarta.Selected.Add('DSGFNAC'#9'10'#9'Fecha~Nacimiento'#9'T');
     dbgDetalleCarta.Selected.Add('DSGSEX'#9'1'#9'Sexo'#9'T');
     dbgDetalleCarta.Selected.Add('DSGPORC'#9'5'#9'Porcentaje'#9'T');
     dbgDetalleCarta.ApplySelected;
     DM1.cdsDetCartas.First;

     xWhere := 'DSGNRO='+QuotedStr(DM1.cdsMaestCartas.FieldByName('DSGNRO').AsString)
              +' And ASOID='+QuotedStr(DM1.cdsMaestCartas.FieldByName('ASOID').AsString);

     If Length(DM1.DisplayDescrip('prvSQL', 'PVS303', 'SUM(DSGPORC) DSGPORC', xWhere, 'DSGPORC')) = 0 Then
      xPorcentaje := 0
     Else
      xPorcentaje := StrToFloat(DM1.DisplayDescrip('prvSQL', 'PVS303', 'SUM(DSGPORC) DSGPORC', xWhere, 'DSGPORC'));

     dbgDetalleCarta.ColumnByName('DSGPORC').FooterValue := FloatToStr(xPorcentaje);
     If xPorcentaje = 100 Then
      bbtnAdicionar.Enabled := False
     Else
      bbtnAdicionar.Enabled := True;
    end;
end;

procedure TFCartaDesignacion.sbtnAceptarClick(Sender: TObject);
Var xSql:String;
begin
   If Not ValidaDatosCarta Then
    Exit;

   Screen.Cursor := crHourGlass;
   DM1.cdsMaestCartas.DisableControls;
   DM1.cdsMaestCartas.Edit;
   If DM1.wModo = 'A' Then
    begin
//Para el Correlativo del Número de Carta
     DecodeDate(Date, Year, Month, Day);
     xTipoCorre := 'D';
     xArea := DM1.DisplayDescrip('prvSQL', 'CRE117', 'MODULOID', 'AREAID ='+QuotedStr('001'), 'MODULOID');
     xCorreWhere :=  ' CREAREA = '+QuotedStr(xArea)+' And CORREANO = '+QuotedStr(CurrToStr(Year))
                    +' And TIPO ='+QuotedStr(xTipoCorre)+' And ';
     xCorreWherex :=  ' x.CREAREA = '+QuotedStr(xArea)+' And x.CORREANO = '+QuotedStr(CurrToStr(Year))+
                      ' And x.TIPO ='+QuotedStr(xTipoCorre)+' And ';
     xCorreWherey := ' y.CREAREA = '+QuotedStr(xArea)+' And y.CORREANO = '+QuotedStr(CurrToStr(Year))+
                      ' And y.TIPO ='+QuotedStr(xTipoCorre)+' And ';

     xTabla := 'PVS201';
     xCeros := 7;
     xCorreCampo  := 'VARIOS';
     Correlativo;
     xNroCarta := xCorre;
     xFecha    := DateToStr(Date);
     DM1.cdsMaestCartas.FieldByName('DSGNRO').AsString  := xNroCarta;
    end;
   DM1.cdsMaestCartas.FieldByName('FREG').AsDateTime  := Date;
   DM1.cdsMaestCartas.FieldByName('HREG').AsDateTime  := Date+Time;
   DM1.cdsMaestCartas.FieldByName('USUARIO').AsString := DM1.wUsuario;
   DM1.cdsPost( DM1.cdsMaestCartas );
   DM1.AplicaDatos(DM1.cdsMaestCartas, 'CARTASPREV');
   FPrincipal.MRefe.RefreshFilter;

   // Verificando si hay liquidaciones para que no puedan anular
   xSql := 'SELECT * FROM PVS306 WHERE ASOID = '+QuotedStr(DM1.cdsMaestCartas.FieldByName('ASOID').AsString)
   +' AND PVSESTLIQ IN (''02'',''05'')';
   DM1.cdsCabLiq.Close;
   DM1.cdsCabLiq.DataRequest(xSql);
   DM1.cdsCabLiq.Open;
   If DM1.cdsCabLiq.RecordCount = 0 Then sbtnAnular.Enabled := True;

   Beep;
   MessageDlg('Datos Actualizados', mtCustom, [mbOk], 0);
   DM1.cdsMaestCartas.EnableControls;
   Screen.Cursor := crDefault;
end;

procedure TFCartaDesignacion.dblcSexoBenefExit(Sender: TObject);
begin
   If dblcSexoBenef.Text = 'M' Then
    dbeDescSexoBenef.Text := 'MASCULINO'
   Else
    begin
     If dblcSexoBenef.Text = 'F' Then
      dbeDescSexoBenef.Text := 'FEMENINO';
    end;
end;

procedure TFCartaDesignacion.dbgIbDetalleCartaIButtonClick(Sender: TObject);
var
   xWhere : String;
begin
   wModoDet := 'A';

   xWhere := 'ASOID ='+QuotedStr(dbeCodAsociado.Text);
   If Length(DM1.DisplayDescrip('prvSQL', 'PVS303', 'ASOID, DSGPORC', xWhere, 'ASOID')) = 0 Then
    begin
     DM1.cdsDetCartas.Append;
     pnlDetCarta.Visible := True;
     dbeDescTipoRelacBenef.Clear; dbeDescSexoBenef.Clear;
     dbeFPago.Clear;              dbeBanco.Clear;       dbeDptoBco.Clear;     dbeLugGiro.Clear;
     DM1.cdsDetCartas.Edit;
     DM1.cdsDetCartas.FieldByName('DSGPORC').AsFloat := StrToFloat('100');
     xPorcentaje := 100;
     dbeApePatBenef.SetFocus;
    end
   Else
    begin
     xPorcentaje := StrToFloat(DM1.DisplayDescrip('prvSQL', 'PVS303', 'SUM(DSGPORC) DSGPORC', xWhere, 'DSGPORC'));
     If xPorcentaje < 100 Then
      begin
       DM1.cdsDetCartas.Append;
       pnlDetCarta.Visible := True;
       dbeDescTipoRelacBenef.Clear; dbeDescSexoBenef.Clear;
       dbeFPago.Clear;              dbeBanco.Clear;         dbeLugGiro.Clear;
       xPorcentaje := 100 - xPorcentaje;
       DM1.cdsDetCartas.Edit;
       DM1.cdsDetCartas.FieldByName('DSGPORC').AsFloat := xPorcentaje;
       dbeApePatBenef.SetFocus;
      end
     Else
      If xPorcentaje = 100 Then
       begin
        Beep;
        MessageDlg('No se Puede Adicionar más Beneficiarios!!! Máximo Porcentaje Alcanzado', mtWarning, [mbOk], 0);
        pnlDetCarta.Visible := False;
        DM1.cdsDetCartas.CancelUpdates;
        DM1.cdsDetCartas.First;
        Exit;
       end;
    end;
end;

procedure TFCartaDesignacion.dbgDetalleCartaDblClick(Sender: TObject);
begin
   wModoDet := 'M';

   If DM1.cdsDetCartas.RecordCount = 0 Then
    begin
     ErrorMsg('Error', 'No Existen Datos a Editar');
     pnlDetCarta.Visible := False;
     Exit;
    end
   Else
    begin
     pnlDetCarta.Visible := True;
     dblcSexoBenefExit(Sender);
     dblcTipoRelacBenefExit(Sender);
     dblcFPagoExit(Sender);
     dblcBancoExit(Sender);
     dblcdDptoBcoExit(Sender);     
     dblcdLugGiroExit(Sender);
     dbdtpFecNacBenefExit(Sender);
     xEdiPorc := DM1.cdsDetCartas.FieldByName('DSGPORC').AsFloat;// xPorcentaje then
    end;
end;

procedure TFCartaDesignacion.sbtnAceptarDetalleClick(Sender: TObject);
begin
   If Not ValidaDatosDetalleCarta Then
    Exit;

   Screen.Cursor := crHourGlass;
   DM1.cdsDetCartas.Edit;
   DM1.cdsDetCartas.FieldByName('CIAID').AsString   := DM1.cdsMaestCartas.FieldByName('CIAID').AsString;
   DM1.cdsDetCartas.FieldByName('DSGNRO').AsString  := DM1.cdsMaestCartas.FieldByName('DSGNRO').AsString;
   DM1.cdsDetCartas.FieldByName('ASOID').AsString   := DM1.cdsMaestCartas.FieldByName('ASOID').AsString;
   DM1.cdsDetCartas.FieldByName('FREG').AsDateTime  := Date;
   DM1.cdsDetCartas.FieldByName('HREG').AsDateTime  := Date+Time;
   DM1.cdsDetCartas.FieldByName('USUARIO').AsString := DM1.wUsuario;
   DM1.cdsPost( DM1.cdsDetCartas );
   DM1.AplicaDatos(DM1.cdsDetCartas, 'DETCARTASPREV');

   dbgDetalleCarta.ColumnByName('DSGPORC').FooterValue := FloatToStr(DM1.OperClientDataSet(DM1.cdsDetCartas, 'SUM(DSGPORC)', ''));
   xPorcentaje := StrtoFloat(dbgDetalleCarta.ColumnByName('DSGPORC').FooterValue);//dbgDetalleCarta.ColumnByName('DSGPORC').FooterValue := FloatToStr(xPorcentaje);
   If xPorcentaje = 100 Then
    dbgIbDetalleCartaIButton.Enabled := False
   Else
    dbgIbDetalleCartaIButton.Enabled := True;

  //DM1.cdsDetCartas.First;

  //Para Actualizar el Maestro de las Cartas de Designación
  //CIM 25/09/2002 AGREGAR EVENTO ON DATAREQUEST AL PROVIDER DE ESTE CDS

   DM1.cdsMaestCartas.Edit;
   DM1.cdsMaestCartas.FieldByName('DSGESTAD').AsString  := '02';
   DM1.cdsMaestCartas.FieldByName('FECAPER').AsDateTime := Date+Time;
   DM1.cdsMaestCartas.FieldByName('FREG').AsDateTime    := Date;
   DM1.cdsMaestCartas.FieldByName('HREG').AsDateTime    := Date+Time;
   DM1.cdsMaestCartas.FieldByName('USUARIO').AsString   := DM1.wUsuario;
   DM1.AplicaDatos(DM1.cdsMaestCartas, 'CARTASPREV');
   //FPrincipal.MRefe.RefreshFilter;
   Beep;
   MessageDlg('Datos Actualizados', mtCustom, [mbOk], 0);
   dbdtpFecAperturaExit(Sender);
   pnlDetCarta.Visible := False;
   Screen.Cursor := crDefault;
end;

procedure TFCartaDesignacion.dbdtpFecNacBenefExit(Sender: TObject);
begin
   If sbtnCancelarDetalle.Focused then
    Exit;

   If dbdtpFecNacBenef.Date >= StrtoDate(xFec_Sis) then
    begin
     ErrorMsg(Caption,'La Fecha de Nacimiento No Puede ser Mayor a la Fecha Actual');
     dbdtpFecNacBenef.SetFocus;
     Exit;
    end;

   DM1.Tiempo(dbdtpFecNacBenef.Date, StrtoDate(xFec_Sis), Ano, Mes, Dia);

   If length(dbdtpFecNacBenef.Text) = 0 Then
    Exit
   Else
    begin
     If Ano < 18 then //Si el Beneficiario es Menor de Edad
      begin
       dbeDNIBenef.Enabled := False;
       dbeApePatT.Enabled  := True;
       dbeApeMatT.Enabled  := True;
       dbeNombT.Enabled    := True;
       dbeDNITutor.Enabled := True;
      end
     Else
      begin
       dbeDNIBenef.Enabled := True;
       dbeApePatT.Enabled  := False;
       dbeApeMatT.Enabled  := False;
       dbeNombT.Enabled    := False;
       dbeDNITutor.Enabled := False;
      end;
    end;
end;

procedure TFCartaDesignacion.dblcEstAsociadoExit(Sender: TObject);
var
   xWhere : String;
begin
   xWhere := 'ASOSITID ='+QuotedStr(dblcEstAsociado.Text);
   dbeEstAsoc.Text := DM1.DisplayDescrip('prvSQL', 'APO106', 'ASOSITID, ASOSITDES', xWhere, 'ASOSITDES');
end;

procedure TFCartaDesignacion.dblcEstCartaExit(Sender: TObject);
var
   xWhere : String;
begin
   xWhere := 'PVSESTDSG ='+QuotedStr(dblcEstCarta.Text)
            +' And PVSDOC ='+QuotedStr('C');

   dbeEstCarta.Text := DM1.DisplayDescrip('prvSQL', 'PVS102', 'PVSESTDSG, PVSESTDES', xWhere, 'PVSESTDES');
end;

procedure TFCartaDesignacion.dblcTipoRelacBenefExit(Sender: TObject);
var
   xWhere : String;
begin
   xWhere := 'PARENID ='+QuotedStr(dblcTipoRelacBenef.Text);
   dbeDescTipoRelacBenef.Text := DM1.DisplayDescrip('prvSQL', 'TGE149', 'PARENID, PARENDES', xWhere, 'PARENDES');
   DM1.cdsDetCartas.Edit;
   DM1.cdsDetCartas.FieldByName('DSGTREL').AsString := DM1.cdsQry.FieldByName('PARENID').AsString;
end;

procedure TFCartaDesignacion.sbtnCancelarDetalleClick(Sender: TObject);
begin
   DM1.cdsDetCartas.CancelUpdates;
   pnlDetCarta.Visible := False;
end;

procedure TFCartaDesignacion.dbePorcBenefExit(Sender: TObject);
var
   xxTemp : Double;
begin
   If sbtnCancelarDetalle.Focused then Exit;

   If wModoDet = 'A' then
    begin
     //If DM1.OperClientDataSet(DM1.cdsDetCartas, 'SUM(DSGPORC)', '') > xPorcentaje then
     If DM1.cdsDetCartas.FieldByName('DSGPORC').AsFloat > xPorcentaje Then
      begin
       Beep;
       MessageDlg('El Porcentaje Máximo a Asignar Debe Ser '+FloatToStr(xPorcentaje), mtInformation, [mbOk], 0);
       DM1.cdsDetCartas.Edit;
       DM1.cdsDetCartas.FieldByName('DSGPORC').AsFloat := xPorcentaje;
       dbePorcBenef.SetFocus;
      end;
    end
   Else
    If wModoDet = 'M' then
     begin
      xPorcentaje := 100 - xPorcentaje;
      //xxTemp := xPorcentaje - 100;
      //If xEdiPorc + xPorcentaje  > Then
      xxTemp:= DM1.cdsDetCartas.FieldByName('DSGPORC').AsFloat - xEdiPorc;
      {If xxTemp < 0 then
      xxTemp := xxTemp * -1;}
      If xxTemp  > xPorcentaje then
       begin
        Beep;
        MessageDlg('El Porcentaje Máximo a Asignar Debe Ser '+FloatToStr(xEdiPorc+xPorcentaje), mtInformation, [mbOk], 0);
        DM1.cdsDetCartas.Edit;
        DM1.cdsDetCartas.FieldByName('DSGPORC').AsFloat := xEdiPorc+xPorcentaje;
        dbePorcBenef.SetFocus;
       end
     end;

   If DM1.OperClientDataSet(DM1.cdsDetCartas, 'SUM(DSGPORC)', '') > 100 then
   //If DM1.cdsDetCartas.FieldByName('DSGPORC').AsFloat > 100 Then
    begin
     Beep;
     MessageDlg('El Porcentaje debe ser Menor a 100', mtError, [mbOk], 0);
     dbePorcBenef.SetFocus;
     Exit;
    end;
end;

procedure TFCartaDesignacion.bbtnBuscarClick(Sender: TObject);
begin
   FBuscaAsociado := TFBuscaAsociado.Create(Self);
   With FBuscaAsociado do
    Try
     ShowModal;
    Finally
     Free;
   end;
end;

procedure TFCartaDesignacion.dbeApeNomExit(Sender: TObject);
var
   xSQL : String;
begin
  Screen.Cursor := crHourGlass;
  If dbeApeNom.Text <> '' Then
  begin
    xSQL := 'SELECT * FROM APO201 WHERE ASOAPENOM LIKE '+QuotedStr(Trim(dbeApeNom.Text+'%'));
    DM1.cdsAsoX.Close;
    DM1.cdsAsoX.DataRequest(xSQL);
    DM1.cdsAsoX.Open;
    If DM1.cdsAsoX.RecordCount = 0 Then
    Begin
      Beep;
      MessageDlg('.. NO EXISTE UN ASOCIADO CON EL NOMBRE : '+Trim(dbeApeNom.Text)+' ..', mtInformation, [mbOk], 0);
      DM1.cdsMaestCartas.FieldByName('DSGNOMBRT').Clear;
      dbeApeNom.SetFocus;
      Screen.Cursor := crDefault;
      Exit;
    end
    Else
    begin
      If DM1.cdsAsoX.RecordCount = 1 Then
         ValidaDatos(DM1.cdsAsoX.FieldByName('ASOID').AsString)
      Else
      begin
        FBuscaAsociado := TFBuscaAsociado.Create(Self);
        With FBuscaAsociado do
        Try
          ShowModal;
        Finally
          Free;
        end;
        xSql := 'SELECT ROWID, A.* FROM PVS302 A WHERE ASOID = '+QuotedStr(DM1.cdsMaestCartas.FieldByName('ASOID').AsString);
        DM1.cdsQry.Close;
        DM1.cdsQry.DataRequest(xSql);
        DM1.cdsQry.Open;
        If DM1.cdsQry.RecordCount > 0 Then
        Begin
          If MessageDlg('Ya Existe una Carta CERRADA!!! Desea Reemplazarla?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
          Begin
            dbeApeNom.Text := '';
            dbeApeNom.SetFocus;
          End;
        End;
      end;
    end;
    xSql := 'SELECT * FROM PVS306 WHERE ASOID = '+QuotedStr(dbeCodAsociado.Text)+' AND PVSESTLIQ IN (''02'',''05'')';
    DM1.cdsQry.Close;
    DM1.cdsQry.DataRequest(xSql);
    DM1.cdsQry.Open;
    If DM1.cdsQry.RecordCount > 0 Then
    Begin
      MessageDlg('El asociado que deseas añadir ya fue liquidado', mtInformation, [mbOk], 0);
      dbeApeNom.Text := '';
      dbeApeNom.SetFocus;
      Screen.Cursor := crDefault;
      Exit;
    End;

  end;
  Screen.Cursor := crDefault;
End;


procedure TFCartaDesignacion.dblcCiaNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

function TFCartaDesignacion.ValidaDatosCarta:Boolean;
begin
   Result := False;

   If Length(dbeCodAsociado.Text) = 0 Then
    begin
     ErrorMsg('Error', 'El Asociado No Es Válido');
     dbeApeNom.SetFocus;
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
     MessageDlg('Ingrese el Nombre del Asociado', mtInformation, [mbOk], 0);
     dbeApeNom.SetFocus;
     Screen.Cursor := crDefault;
     Exit;
    end;

   If dbdtpFecApertura.Enabled Then
    begin
     If Length(Trim(dbdtpFecApertura.Text)) = 0 Then
      begin
       Beep;
       MessageDlg('Ingrese la Fecha de Apertura de la Carta', mtInformation, [mbOK], 0);
       dbdtpFecApertura.SetFocus;
       Exit;
      end;
    end;

   If dbdtpFecAnul.Enabled Then
    begin
     If Length(Trim(dbdtpFecAnul.Text)) = 0 Then
      begin
       Beep;
       MessageDlg('Ingrese la Fecha de Anulación de la Carta', mtInformation, [mbOk], 0);
       dbdtpFecAnul.SetFocus;
       Exit;
      end;
    end;

   Result := True;
end;

function TFCartaDesignacion.ValidaDatosDetalleCarta:Boolean;
begin
   Result := False;

   If Length(dbeApePatBenef.Text) = 0 Then
    begin
     Beep;
     MessageDlg('Ingrese el Apellido Paterno del Beneficiario', mtInformation, [mbOk], 0);
     dbeApePatBenef.SetFocus;
     Exit;
    end;

   If Length(dbeApeMatBenef.Text) = 0 Then
    begin
     Beep;
     MessageDlg('Ingrese el Apellido Materno del Beneficiario', mtInformation, [mbOk], 0);
     dbeApeMatBenef.SetFocus;
     Exit;
    end;

   If Length(dbeDetNombBenef.Text) = 0 Then
    begin
     Beep;
     MessageDlg('Ingrese el Nombre del Beneficiario', mtInformation, [mbOk], 0);
     dbeDetNombBenef.SetFocus;
     Exit;
    end;

   If Length(dblcTipoRelacBenef.Text) = 0 Then
    begin
     Beep;
     MessageDlg('Ingrese la Relación con el Asociado', mtInformation, [mbOk], 0);
     dblcTipoRelacBenef.SetFocus;
     Exit;
    end;

   If Length(dbdtpFecNacBenef.Text) = 0 Then
    begin
     Beep;
     MessageDlg('Ingrese la Fecha de Nacimiento', mtInformation, [mbOk], 0);
     dbdtpFecNacBenef.SetFocus;
     Exit;
    end;

   If Length(dblcSexoBenef.Text) = 0 Then
    begin
     Beep;
     MessageDlg('Ingrese el Sexo', mtInformation, [mbOk], 0);
     dblcSexoBenef.SetFocus;
     Exit;
    end;

   If (Ano > 0) And (Ano < 18) Then
    begin
     If Length(Trim(dbeApePatT.Text)) = 0 Then
      begin
       Beep;
       MessageDlg('Ingrese el Apellido Paterno del Tutor', mtInformation, [mbOk], 0);
       dbeApePatT.SetFocus;
       Exit;
      end;
     If Length(Trim(dbeApeMatT.Text)) = 0 Then
      begin
       Beep;
       MessageDlg('Ingrese el Apellido Materno del Tutor', mtInformation, [mbOk], 0);
       dbeApeMatT.SetFocus;
       Exit;
      end;
     If Length(Trim(dbeNombT.Text)) = 0 Then
      begin
       Beep;
       MessageDlg('Ingrese el Nombre del Tutor', mtInformation, [mbOk], 0);
       dbeNombT.SetFocus;
       Exit;
      end;
    end;

   If dbeDNIBenef.Enabled Then
    begin
     If Length(dbeDNIBenef.Text) = 0 Then
      begin
       Beep;
       MessageDlg('Ingrese el DNI del Beneficiario', mtInformation, [mbOk], 0);
       dbeDNIBenef.SetFocus;
       Exit;
      end;
    end;

   If Length(dbePorcBenef.Text) = 0 Then
    begin
     Beep;
     MessageDlg('Ingrese el Porcentaje', mtInformation, [mbOk], 0);
     dbePorcBenef.SetFocus;
     Exit;
    end
   Else
    begin
     If StrToFloat(dbePorcBenef.Text) = 0 Then
      begin
       Beep;
       MessageDlg('El Porcentaje a Asignar debe ser Mayor a Cero', mtInformation, [mbOk], 0);
       dbePorcBenef.SetFocus;
       Exit;
      end;
    end;

   If dbeApePatT.Enabled Then
    begin
     If Length(dbeApePatT.Text) = 0 Then
      begin
       Beep;
       MessageDlg('Ingrese el Apellido Paterno del Tutor', mtInformation, [mbOk], 0);
       dbeApePatT.SetFocus;
       Exit;
      end;
    end;

   If dbeApeMatT.Enabled Then
    begin
     If Length(dbeApeMatT.Text) = 0 Then
      begin
       Beep;
       MessageDlg('Ingrese el Apellido Materno del Tutor', mtInformation, [mbOk], 0);
       dbeApeMatT.SetFocus;
       Exit;
      end;
    end;

   If dbeNombT.Enabled Then
    begin
     If Length(dbeNombT.Text) = 0 Then
      begin
       Beep;
       MessageDlg('Ingrese el Nombre del Tutor', mtInformation, [mbOk], 0);
       dbeNombT.SetFocus;
       Exit;
      end;
    end;

   If dbeDNITutor.Enabled Then
    begin
     If Length(dbeDNITutor.Text) = 0 Then
      begin
       Beep;
       MessageDlg('Ingrese el Documento de Identidad del Tutor', mtInformation, [mbOk], 0);
       dbeDNITutor.SetFocus;
       Exit;
      end;
    end;

   Result := True;
end;

procedure TFCartaDesignacion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DM1.cdsMaestCartas.CancelUpdates;
   DM1.cdsDetCartas.CancelUpdates;
   DM1.cdsEstCarta.Filter          := '';
   DM1.cdsEstCarta.Filtered        := False;
   DM1.cdsEstCarta.IndexFieldNames := '';
   DM1.cdsEstCarta.Close;
   DM1.cdsAsoX.Filter   := '';
   DM1.cdsAsoX.Filtered := False;
   DM1.cdsAsoX.IndexFieldNames := '';
   DM1.cdsAsoX.Close;
end;

procedure TFCartaDesignacion.sbtnAnularClick(Sender: TObject);
begin
   If MessageDlg('Desea Anular la Carta ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
    begin
     DM1.cdsMaestCartas.Edit;
     DM1.cdsMaestCartas.FieldByName('DSGESTAD').AsString := '04';
     dblcEstCartaExit(Sender);
     dbdtpFecAnul.Enabled := True;
     dbdtpFecAnul.SetFocus;
    end;
end;

procedure TFCartaDesignacion.LlenaDatos(xCodAso:String);
var
   xWhere, xCampos : String;
begin
   xWhere  := 'ASOID ='+QuotedStr(xCodAso);
   xCampos := 'ASOID, ASOCODMOD, ASOAPEPAT, ASOAPEMAT, ASONOMBRES, ASOAPENOM,'
             +' ASODNI, ASOSITID, ASOTIPID, USEID, UPROID, UPAGOID';

   If length(DM1.DisplayDescrip('prvSQL', 'APO201', xCampos, xWhere, 'ASOID')) > 0 Then
    begin
     dbeCodModular.Text   := DM1.cdsQry.FieldByName('ASOCODMOD').AsString;
     dbeDNI.Text          := DM1.cdsQry.FieldByName('ASODNI').AsString;
     xUseId   := DM1.cdsQry.FieldByName('USEID').AsString; //Para la USE
     xUPagoId := DM1.cdsQry.FieldByName('UPAGOID').AsString; //Para la Unidad de Pago
     xUProId  := DM1.cdsQry.FieldByName('UPROID').AsString; //Para la Unidad de Proceso
     dblcEstAsociado.Text := DM1.cdsQry.FieldByName('ASOSITID').AsString;
     DM1.cdsMaestCartas.FieldByName('ASOID').AsString     := DM1.cdsQry.FieldByName('ASOID').AsString;
     DM1.cdsMaestCartas.FieldByName('DSGAPEPAT').AsString := DM1.cdsQry.FieldByName('ASOAPEPAT').AsString;
     DM1.cdsMaestCartas.FieldByName('DSGAPEMAT').AsString := DM1.cdsQry.FieldByName('ASOAPEMAT').AsString;
     DM1.cdsMaestCartas.FieldByName('DSGNOMBR').AsString  := DM1.cdsQry.FieldByName('ASONOMBRES').AsString;
     DM1.cdsMaestCartas.FieldByName('DSGNOMBRT').AsString := DM1.cdsQry.FieldByName('ASOAPEPAT').AsString+' '
                                                            +DM1.cdsQry.FieldByName('ASOAPEMAT').AsString+' '
                                                            +DM1.cdsQry.FieldByName('ASONOMBRES').AsString;
     xWhere   := 'UPROID ='+QuotedStr(xUProId);
     dbeUProceso.Text := DM1.DisplayDescrip('prvSQL', 'APO102', 'UPROID, UPRONOM', xWhere, 'UPRONOM');
     xWhere   := 'UPROID ='+QuotedStr(xUProId)
                +' And UPAGOID ='+QuotedStr(xUPagoId);
     dbeUPago.Text := DM1.DisplayDescrip('prvSQL', 'APO103', 'UPROID, UPAGOID, UPAGONOM', xWhere, 'UPAGONOM');
     xWhere   := 'UPROID ='+QuotedStr(xUProId)
                +' And UPAGOID ='+QuotedStr(xUPagoId)
                +' And USEID ='+QuotedStr(xUseId);
     dbeUSE.Text := DM1.DisplayDescrip('prvSQL', 'APO101', 'UPROID, USEID, USENOM', xWhere, 'USENOM');
     dblcEstAsociadoExit(nil);
     dbdtpFecOper.SetFocus;
    end;
end;

procedure TFCartaDesignacion.ValidaDatos(xCodAso: String);
var
   xWhere, xEstado : String;
begin
//   xAso := DM1.cdsQry.FieldByName('ASOID').AsString;
//   xWhere := 'ASOID ='+QuotedStr(DM1.cdsQry.FieldByName('ASOID').AsString);
   xWhere := 'ASOID ='+QuotedStr(xCodAso);
   If Length(DM1.DisplayDescrip('prvSQL', 'PVS302', 'ASOID', xWhere, 'ASOID')) = 0 Then
    LlenaDatos(xCodAso)
   Else
    begin
     xWhere  := 'ASOID ='+Quotedstr(xCodAso);
     xEstado := DM1.DisplayDescrip('prvSQL', 'PVS302', 'ASOID, DSGESTAD, DSGNRO, DSGNOMBRT', xWhere, 'DSGESTAD');
     xCodAso := DM1.cdsQry.FieldByName('ASOID').AsString;
     Case StrToInt(xEstado) Of
      1 : begin
           If MessageDlg('Ya Existe una Carta CERRADA!!! Desea Reemplazarla?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
            begin
            DM1.cdsCartas2.Edit;
          //  DM1.cdsCartas2.IndexFieldNames := 'ASOID';
            DM1.cdsCartas2.SetKey;

             DM1.cdsCartas2.FieldByName('ASOID').AsString    := DM1.cdsQry.FieldByName('ASOID').AsString;
             DM1.cdsCartas2.FieldByName('DSGNRO').AsString   := DM1.cdsQry.FieldByName('DSGNRO').AsString;
             DM1.cdsCartas2.FieldByName('DSGESTAD').AsString := DM1.cdsQry.FieldByName('DSGESTAD').AsString;
             If DM1.cdsCartas2.GotoKey Then
              begin

               DM1.cdsCartas2.FieldByName('DSGESTAD').AsString := '03';
              end;
             LlenaDatos(DM1.cdsQry.FieldByName('ASOID').AsString);
            end
           Else
            begin
             dbeApeNom.SetFocus;
             Exit;
            end;
          end;
      2 : begin //Si la Carta se encuentra A B I E R T A
           Beep;
           MessageDlg('La Carta para '+DM1.cdsQry.FieldByName('DSGNOMBRT').AsString+' Ya ha sido ABIERTA', mtWarning, [mbOk], 0);
           DM1.cdsMaestCartas.FieldByName('DSGNOMBRT').Clear;
           DM1.cdsMaestCartas.FieldByName('ASOID').Clear;
           dbeApeNom.SetFocus;
           Exit;
          end;
      3 : begin //Si la Carta se encuentra R E E M P L A Z A D A
           LlenaDatos(DM1.cdsQry.FieldByName('ASOID').AsString);
           Exit;
          end;
      4 : begin //Si la Carta se encuentra A N U L A D A
           LlenaDatos(DM1.cdsQry.FieldByName('ASOID').AsString);
           Exit;
          end;
      5 : begin //Si la Carta se encuentra A P L I C A D A
           Beep;
           MessageDlg('La Carta para '+DM1.cdsQry.FieldByName('DSGNOMBRT').AsString+' se encuentra APLICADA', mtWarning, [mbOk], 0);
           DM1.cdsMaestCartas.FieldByName('DSGNOMBRT').Clear;
           DM1.cdsMaestCartas.FieldByName('ASOID').Clear;
           dbeApeNom.SetFocus;
           Exit;
          end;
     end;
   end;
end;

procedure TFCartaDesignacion.bbtnAdicionarClick(Sender: TObject);
begin
   xPorcentaje := StrtoFloat(dbgDetalleCarta.ColumnByName('DSGPORC').FooterValue);//dbgDetalleCarta.ColumnByName('DSGPORC').FooterValue := FloatToStr(xPorcentaje);
   If xPorcentaje = 100 then
    dbgIbDetalleCartaIButton.Enabled := False
   Else
    dbgIbDetalleCartaIButton.Enabled := True;
  //dbgIbDetalleCartaIButton.Enabled := True;
end;

procedure TFCartaDesignacion.dblcFPagoExit(Sender: TObject);
var
   xWhere : String;
begin
   xWhere := 'TIPDESEID ='+QuotedStr(dblcFPago.Text);
   dbeFPago.Text := DM1.DisplayDescrip('prvSQL', 'CRE104', 'TIPDESEABR', xWhere, 'TIPDESEABR');
end;

procedure TFCartaDesignacion.dblcFPagoNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFCartaDesignacion.dblcBancoExit(Sender: TObject);
var
   xSQL, xWhere : String;
begin
   xWhere := 'BANCOID ='+QuotedStr(dblcBanco.Text);
   dbeBanco.Text := DM1.DisplayDescrip('prvSQL', 'TGE105', 'BANCONOM', xWhere, 'BANCONOM');
   xSQL := 'Select * From COB102'
          +' Where BANCOID ='+QuotedStr(dblcBanco.Text);

   DM1.cdsAgBco.Filter   := '';
   DM1.cdsAgBco.Filtered := False;
   DM1.cdsAgBco.IndexFieldNames := '';
   DM1.cdsAgBco.Close;
   DM1.cdsAgBco.DataRequest(xSQL);
   DM1.cdsAgBco.Open;
   DM1.cdsAgBco.IndexFieldNames := 'AGENBCODES';
end;

procedure TFCartaDesignacion.dblcBancoNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFCartaDesignacion.dblcdLugGiroExit(Sender: TObject);
var
   xWhere : String;
begin
   xWhere := 'BANCOID ='+QuotedStr(dblcBanco.Text)
            +' And AGENBCOID ='+QuotedStr(dblcdLugGiro.Text);

   dbeLugGiro.Text := DM1.DisplayDescrip('prvSQL', 'COB102', 'AGENBCODES', xWhere, 'AGENBCODES');
end;

procedure TFCartaDesignacion.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   If (DM1.cdsMaestCartas.State = dsInsert) Or
      (DM1.cdsDetCartas.State = dsInsert) Then
    If Application.MessageBox(' Tiene Datos No Actualizados '+#13+
                              '¿Desea Salir y Cancelar sus Actualizaciones?',
                              'Grabaciones Pendientes',
                              MB_YESNO + MB_DEFBUTTON1) <> IDYES Then
      CanClose := False
    Else
     DM1.cdsMaestCartas.CancelUpdates;
end;

procedure TFCartaDesignacion.dblcCiaKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key In [' ', 'A'..'Z', 'a'..'z',
              '°', '|', '¬', '!', '"', '#', '$', '%', '&', '/', '(', ')',
              '=', '?', '\', '¡', '¿', '@', '¨', '´', '*', '+', '~', '[',
              ']', '{', '}', '^', '`', '<', '>', ';', ',', ':', '''',
              '.', '-', '_'] Then
    Key := #0;
end;

procedure TFCartaDesignacion.dblcSexoBenefKeyPress(Sender: TObject; var Key: Char);
begin
  If Key In [' ', '0'..'9',
              'a', 'b', 'c', 'd', 'e', 'g', 'h', 'i', 'j', 'k', 'l', 'n',
              'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
              'A', 'B', 'C', 'D', 'E', 'G', 'H', 'I', 'J', 'K', 'L', 'N',
              'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
              '°', '|', '¬', '!', '"', '#', '$', '%', '&', '/', '(', ')',
              '=', '?', '\', '¡', '¿', '@', '¨', '´', '*', '+', '~', '[',
              ']', '{', '}', '^', '`', '<', '>', ';', ',', ':', '''',
              '.', '-', '_'] Then
    Key := #0;
end;

procedure TFCartaDesignacion.dbdtpFecAperturaExit(Sender: TObject);
begin
   If DM1.cdsMaestCartas.FieldByName('DSGESTAD').AsString = '02' Then
    dbdtpFecApertura.Enabled := True
   Else
    dbdtpFecApertura.Enabled := False;
end;

procedure TFCartaDesignacion.FormKeyPress(Sender: TObject; var Key: Char);
begin
   If Key = #13 Then
    begin
     Key := #0;
     Perform(CM_DialogKey, VK_TAB, 0);
    end;
end;

procedure TFCartaDesignacion.dbgDetalleCartaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   If (Key = VK_DELETE) And (ssCtrl in Shift)  Then
    begin
     If DM1.cdsDetCartas.RecordCount > 0 Then
      begin
       If Question(Caption, 'Esta Seguro de Eliminar ?'+#13+#13+'Desea Continuar ? ') Then
        begin
         DM1.cdsDetCartas.Delete;
         //DM1.AplicaDatos(DM1.cdsDetCartas, 'DFAM');
         DM1.AplicaDatos(DM1.cdsDetCartas, 'DETCARTASPREV');
         dbgDetalleCarta.ColumnByName('DSGPORC').FooterValue := FloatToStr(DM1.OperClientDataSet(DM1.cdsDetCartas, 'SUM(DSGPORC)', ''));
         xPorcentaje := StrToFloat(dbgDetalleCarta.ColumnByName('DSGPORC').FooterValue);
         If xPorcentaje = 100 then
          dbgIbDetalleCartaIButton.Enabled := False
         Else
          dbgIbDetalleCartaIButton.Enabled := True;

         Beep;
         MessageDlg('Registro Eliminado', mtInformation, [mbOk], 0);
        end;
      end
     Else
      ErrorMsg(Caption, ' No Existen Registros a Eliminar ');
    end;
   dbgDetalleCarta.RefreshDisplay;
end;

procedure TFCartaDesignacion.dblcdDptoBcoExit(Sender: TObject);
var
   xSQL : String;
begin
   dbeDptoBco.Text := DM1.DisplayDescrip('prvSQL', 'APO158', 'DPTODES', 'DPTOID ='+QuotedStr(dblcdDptoBco.Text), 'DPTODES');
   xSQL := 'Select * From COB102'
          +' Where BANCOID ='+QuotedStr(dblcBanco.Text)
          +' And DPTOID ='+QuotedStr(dblcdDptoBco.Text);

   DM1.cdsAgBco.Filter   := '';
   DM1.cdsAgBco.Filtered := False;
   DM1.cdsAgBco.IndexFieldNames := '';
   DM1.cdsAgBco.Close;
   DM1.cdsAgBco.DataRequest(xSQL);
   DM1.cdsAgBco.Open;
   DM1.cdsAgBco.IndexFieldNames := 'AGENBCODES';
end;

procedure TFCartaDesignacion.Correlativo;
begin
   //** cuando es primera vez, se pasa el nombre del campo del cual se sacara el correlativo
   xCorre := xCorreCampo;
   Repeat
    //** si esto se repitiera más de una vez, xCorre será igual al correlativo que se
    //** encontro más 1
    CorreCred(xCorre);
    //** verifica en la tabla auxiliar que el correlativo no este tomado por otro usuario
    BuscaCorre;
    //** esta busqueda se repitirá hasta que se encuentra un correlativo que no haya
    //** sido tomado
   until xPaso = True;
end;

procedure TFCartaDesignacion.CorreCred(pCorre : String);
var
   xCadena, xSQL : String;
begin
   //** dependiendo del pCorre, lleno xCadena para el Sql
   If pCorre = 'CREDID' Then
    xCadena := 'substr(CREDID,9,7)'
   Else
    xCadena := pCorre;

   //** busco el minimo y le agrego uno para que no hayan huecos, OJO por el día activo
   xSQL := 'Select MIN('+xCadena+' +1) NUMCRED From CRE206 '
          +' Where '+ xCorreWhere +
          xCorreCampo+' not in (Select x.'+xCorreCampo+' From CRE206 x, CRE206 y'+
          ' Where '+ xCorreWherex + xCorreWherey +
          'x.'+xCorreCampo+' = y.'+xCorreCampo+' +1)';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSQL);
   DM1.cdsQry.Open;
   //** si devuelve vacio, busco el ultimo correlativo que hubiera, no interesa el día
   If DM1.cdsQry.FieldByName('NUMCRED').AsString = '' Then
    begin
     xSQL := 'Select MAX('+xCadena+' +1) NUMCRED From CRE206 '+
             'Where '+ xCorreWhere +
             xCorreCampo+' IN (Select x.'+xCorreCampo+' From CRE206 x, CRE206 y '+
            ' Where '+ xCorreWherex + xCorreWherey +
            'x.'+xCorreCampo+' = y.'+xCorreCampo+' +1)';
//           'Where x.'+xCorreCampo+' = y.'+xCorreCampo+' +1) AND CREAREA = '+QuotedStr(xArea);
     DM1.cdsQry.Close;
     DM1.cdsQry.DataRequest(xSql);
     DM1.cdsQry.Open;
     //** asigno el nuevo correlativo
     xCorre := DM1.StrZero(IntToStr(DM1.cdsQry.FieldByName('NUMCRED').AsInteger + 1), xCeros);
    end
   Else
    //** asigno el nuevo correlativo
    xCorre := DM1.StrZero(DM1.cdsQry.FieldByName('NUMCRED').AsString, xCeros);
end;

Procedure TFCartaDesignacion.BuscaCorre;
var
   xSQL : String;
begin
   //** por defecto
   xPaso := True;
   //** busco en la tabla auxiliar de correlativos si en xcorre ya existe,
   //** ejemplo : en CRE303 puede ser que este en el 1000 si más de un usuario toma
   //** este mas uno van a tener el 1001, lo cual es verdad, para evitar esto grabo
   //** en CRE201 y verifico que el 1001 no exista en este sino sigue buscando
   xSQL := 'Select COUNT(NUMERO) TOTAL FROM '+xTabla+' Where NUMERO ='+QuotedStr(xCorre);

   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSQL);
   DM1.cdsQry.Open;
   //** False = para que siga repitiendo la busqueda
   If DM1.cdsQry.FieldByName('TOTAL').AsFloat > 0 Then
    xPaso := False
   Else
   //** sino graba en la tabla auxiliar (cre201)
    begin
     xSQL := 'INSERT INTO '+xTabla+' (NUMERO) VALUES (';
     If xCorreCampo = 'CREDID' Then
      xSQL := xSQL + QuotedStr(xCorreCadena+xCorre)+')'
     Else
      xSQL := xSQL + QuotedStr(xCorre)+')';
     DM1.DCOM1.AppServer.EjecutaSQL(xSQL);

     If StrToInt(xCorre) = 1 Then
      begin
       If xCorreCampo = 'CREDID' Then
        xSQL := 'INSERT INTO CRE206 ('+xCorreCampo+', CREAREA, CORREANO, TIPO) VALUES ('+QuotedStr(xCorreCadena+xCorre)+
                ','+QuotedStr(xArea)+','+QuotedStr(FloatToStr(Year))+','+QuotedStr(xTipoCorre)+')'
       Else
        xSQL := 'INSERT INTO CRE206 ('+xCorreCampo+',CREAREA, CORREANO, TIPO) VALUES ('+QuotedStr(xCorre)+
                ','+QuotedStr(xArea)+','+QuotedStr(FloatToStr(Year))+','+QuotedStr(xTipocorre)+')';
      end
     Else
      begin
       If xCorreCampo = 'CREDID' Then
        xSQL := 'UPDATE CRE206 SET '+xCorreCampo+' ='+QuotedStr(xCorreCadena+xCorre)+
                ' WHERE CREAREA ='+QuotedStr(xArea)+' AND CORREANO ='+QuotedStr(FloatToStr(Year))+
                ' AND SUBSTR(CREDID,1,2)='+QuotedStr(Copy(xCorreCadena, 1, 2))+
                ' AND SUBSTR(CREDID,3,4)='+QuotedStr(Copy(xCorreCadena, 3, 4))+
                ' AND SUBSTR(CREDID,7,2)='+QuotedStr(Copy(xCorreCadena, 7, 2))+
                ' AND TIPO ='+QuotedStr(xTipoCorre)
       Else
        xSQL := 'UPDATE CRE206 SET '+xCorreCampo+' ='+QuotedStr(xCorre)+
                ' WHERE CREAREA ='+QuotedStr(xArea)+' AND CORREANO ='+QuotedStr(FloatToStr(Year))+
                ' AND TIPO ='+QuotedStr(xTipoCorre);
//                ' WHERE CREAREA ='+QuotedStr(xArea);
      end;
     DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
    end;
end;

end.
