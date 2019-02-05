// Inicio Uso Estándares: 01/08/2011
// Unidad               : Previsión Social
// Formulario           : FProgramacionDesembolso
// Fecha de Creación    : 22/01/2018
// Autor                : Sistemas
// Objetivo             : Programación de desembolso
// Actualizaciones:
// HPC_201802_PRE       : Creación
// HPC_201805_PRE       : Se corrige inconsistencia al momento de seleccionar tipo de desembolso 

unit PRE222;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ExtCtrls, wwdblook, Wwdbigrd, Grids,
  Wwdbgrid;

type
  TFProgramacionDesembolso = class(TForm)
    rgCobAso: TRadioGroup;
    gbCobAso: TGroupBox;
    lblforpag: TLabel;
    lblbanco: TLabel;
    Label25: TLabel;
    Label19: TLabel;
    lblasoncta: TLabel;
    lbldospun04: TLabel;
    dblcforpag: TwwDBLookupCombo;
    dblcBanco: TwwDBLookupCombo;
    pnlbanco: TPanel;
    mebancodes: TMaskEdit;
    pnlforpag: TPanel;
    meforpagodes: TMaskEdit;
    pnlasoncta: TPanel;
    meASONCTA: TMaskEdit;
    btnbeneficiarios: TBitBtn;
    Label1: TLabel;
    Panel1: TPanel;
    meASODNI: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel2: TPanel;
    meASOAPENOMDNI: TMaskEdit;
    gbProgramacion: TGroupBox;
    btnGenerar: TBitBtn;
    dbgPrevioDesembolso: TwwDBGrid;
    Button2: TButton;
    btncerrar: TButton;
    btnSalir: TBitBtn;
    Panel3: TPanel;
    meMONAPAG: TMaskEdit;
    Label6: TLabel;
    Label7: TLabel;
    procedure btnbeneficiariosClick(Sender: TObject);
    procedure rgCobAsoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dblcforpagChange(Sender: TObject);
    procedure dblcforpagExit(Sender: TObject);
    procedure dblcBancoChange(Sender: TObject);
    procedure dblcBancoExit(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure btnGenerarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProgramacionDesembolso: TFProgramacionDesembolso;

implementation

uses PREDM, PRE264, PRE216, PRE239;

{$R *.dfm}

procedure TFProgramacionDesembolso.btnbeneficiariosClick(Sender: TObject);
Var xSql:String;
begin

   xSql := 'SELECT ASOID, ASODNI, ASOCODMOD, ASOAPENOMDNI, ASOAPEPATDNI, ASOAPEMATDNI, ASOAPECASDNI, ASONOMDNI, ASOTELF1, UPROID, UPAGOID, USEID FROM APO201 WHERE ASOID = '+DM1.cdsCabLiq.FieldByName('ASOID').AsString;
   DM1.cdsAsociado.Close;
   DM1.cdsAsociado.DataRequest(xSql);
   DM1.cdsAsociado.Open;

   xSql := 'SELECT ASOID, PVSESTADO, PVSCOBASO FROM PVS301 WHERE ASOID = '+QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)+ ' AND PVSLBENNR = '+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString);
   DM1.cdsExpLiq.Close;
   DM1.cdsExpLiq.DataRequest(xSql);
   DM1.cdsExpLiq.Open;

   xSql := 'SELECT DSGFAPER, USUAPE, PVSLBENNR, A.DSGESTAD, A.ASOID, A.DSGNRO, A.ASOCODMOD, A.DSGFREC, A.ASOAPENOMDNI, B.PVSESTDES, A.USUARIO, A.FREG, A.ASODNI, A.PVSLBENNR, A.DSGOBS  FROM PVS302 A, PVS102 B'
   +' WHERE A.DSGESTAD NOT IN ''13''  AND A.DSGESTAD = B.PVSESTDSG AND B.PVSDOC = ''C'' AND A.ASOID = '+QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString);
   DM1.cdsMaestCartas.Close;
   DM1.cdsMaestCartas.DataRequest(xSql);
   DM1.cdsMaestCartas.Open;
   If DM1.cdsMaestCartas.RecordCount > 0 Then
   Begin
      Try
         Fapecardes := TFapecardes.create(Self);
         Fapecardes.ShowModal;
      Finally
         Fapecardes.Free;
      End;
   End
   Else
   Begin
      Try
         FDatFam := TFDatFam.create(Self);
         FDatFam.ShowModal;
      Finally
         FDatFam.Free;
      End;
   End;
   DM1.cdsExpLiq.Edit;
   DM1.cdsExpLiq.FieldByName('PVSCOBASO').AsString := 'N';
   DM1.cdsExpLiq.Post;
   DM1.liquidacionbeneficio := DM1.cdsCabLiq.FieldByName('MONLIQBEN').AsFloat;
   DM1.totalMontoDescuento  := DM1.cdsCabLiq.FieldByName('MONDES').AsFloat;
   DM1.totalMontoDevolucion := DM1.cdsCabLiq.FieldByName('MONDEV').AsFloat;
   DM1.montoTransferencia   := 0;
   DM1.formadepago(DM1.cdsCabLiq.FieldByName('ASOID').AsString);
   gbProgramacion.Top  := 58;
   gbProgramacion.Left :=  7;
   gbProgramacion.Visible := True;
end;

procedure TFProgramacionDesembolso.rgCobAsoClick(Sender: TObject);
begin
   gbProgramacion.Visible := False;
   If rgCobAso.ItemIndex = 0 Then
   Begin
      gbCobAso.Left := 105;
      gbCobAso.Top  := 11;
      gbCobAso.Visible := True;
      btnbeneficiarios.Visible := False;
   End
   Else
   Begin
      gbCobAso.Visible := False;
      btnbeneficiarios.Visible := True;
   End;
end;

procedure TFProgramacionDesembolso.FormActivate(Sender: TObject);
Var xSql:String;
begin
   DM1.xprodes := 'S';
   gbProgramacion.Visible := False;
   DM1.cdsForPag.EmptyDataSet;
   dblcforpag.Text := '';
   dblcBanco.Text  := '';
   rgCobAso.ItemIndex := 0;
   gbCobAso.Visible := True;
   btnbeneficiarios.Visible := False;
   meASODNI.Text        := DM1.cdsCabLiq.FieldByName('ASODNI').AsString;
   meASOAPENOMDNI.Text  := DM1.cdsCabLiq.FieldByName('ASOAPENOMDNI').AsString;
   meASONCTA.Text       := DM1.cdsCabLiq.FieldByName('ASONCTA').AsString;
   meMONAPAG.Text       := FloatToStrF(DM1.cdsCabLiq.FieldByName('MONAPAG').AsFloat,ffNumber,9,2);
   xSql := 'SELECT TIPDESEID, TIPDESEDES, FLACOBPRE FROM CRE104 WHERE NVL(FLAVIGPRE, ''X'') = ''S'' AND TIPDESEID<>''18''  ORDER BY TIPDESEID';
   DM1.cdsFPago.Close;
   DM1.cdsFPago.DataRequest(xSql);
   DM1.cdsFPago.Open;
   dblcforpag.Selected.Clear;
   dblcforpag.Selected.Add('TIPDESEID'#9'2'#9'Código'#9#9);
   dblcforpag.Selected.Add('TIPDESEDES'#9'25'#9'Descripción'#9#9);
   xSql := 'SELECT BANCOID, BANCONOM FROM TGE105 WHERE BANCOID IN (''04'', ''03'')';
   DM1.cdsBanco.Close;
   DM1.cdsBanco.DataRequest(xSql);
   DM1.cdsBanco.Open;
   dblcBanco.Selected.Clear;
   dblcBanco.Selected.Add('BANCOID'#9'2'#9'Código'#9#9);
   dblcBanco.Selected.Add('BANCONOM'#9'25'#9'Descripción'#9#9);
   measoncta.Text := DM1.cdsCabLiq.FieldByName('ASONCTA').AsString;
end;

procedure TFProgramacionDesembolso.dblcforpagChange(Sender: TObject);
begin
   If DM1.cdsFPago.Locate('TIPDESEID', dblcforpag.Text, []) Then
      meforpagodes.Text := DM1.cdsFPago.FieldByName('TIPDESEDES').AsString;
end;

procedure TFProgramacionDesembolso.dblcforpagExit(Sender: TObject);
Var xSql:String;
begin
  If DM1.cdsFPago.Locate('TIPDESEID', dblcforpag.Text, []) Then
  Begin
    meforpagodes.Text := DM1.cdsFPago.FieldByName('TIPDESEDES').AsString;
    If DM1.cdsFPago.FieldByName('FLACOBPRE').AsString = 'B' Then
      xSql := 'SELECT BANCOID, BANCONOM FROM TGE105 WHERE FLAVIGPRE = ''S'' AND CLAUXID = ''B'''
    Else
      xSql := 'SELECT BANCOID, BANCONOM FROM TGE105 WHERE FLAVIGPRE = ''S'' AND CLAUXID = ''C''';
    DM1.cdsBanco.Close;
    DM1.cdsBanco.DataRequest(xSql);
    DM1.cdsBanco.Open;
    If (dblcforpag.Text = '01') Or (dblcforpag.Text = '11') Or (dblcforpag.Text = '16') Then
    Begin
       lblasoncta.Visible := False;
       pnlasoncta.Visible := False;
       lbldospun04.Visible := False;
       meAsoncta.Text := '';
       dblcBanco.Text := '03';
    End;
    If (dblcforpag.Text = '19') Or (dblcforpag.Text = '18') Then
    Begin
       // Inicio: HPC_201805_PRE
       // Se asigna por defecto el banco al tipo de desembolso
       // If dblcforpag.Text = '18' Then dblcBanco.Text := '15'
       // Else dblcBanco.Text := '04';
       If dblcforpag.Text = '19' Then dblcBanco.Text := '15'
       Else dblcBanco.Text := '04';
       // Fin: HPC_201805_PRE
       lblasoncta.Visible := True;
       lbldospun04.Visible := True;
       pnlasoncta.Visible := True;
       measoncta.Text := DM1.cdsCabLiq.FieldByName('ASONCTA').AsString;
    End;
    If dblcforpag.Text = '05' Then
    Begin
      dblcBanco.Text := '04';
      xSql := 'SELECT A.AGENBCOID, A.AGENBCODES, B.DPTODES FROM COB102 A, APO158 B WHERE A.DPTOID = B.DPTOID(+) AND A.BANCOID = '+QuotedStr(dblcBanco.Text)
      +' ORDER BY DPTODES, AGENBCODES';
      DM1.cdsAgBco.Close;
      DM1.cdsAgBco.DataRequest(xSql);
      DM1.cdsAgBco.Open;
      lblasoncta.Visible := False;
      pnlasoncta.Visible := False;
      meAsoncta.Text := '';
    End;
    If dblcforpag.Text = '06' Then
    Begin
      lblasoncta.Visible := True;
      pnlasoncta.Visible := True;
      lbldospun04.Visible := False;
    End;
  End
  Else
  Begin
    MessageDlg('Forma de pago no válida', mtInformation, [mbOk], 0);
    dblcforpag.Text := '';
    Exit;
  End;
end;

procedure TFProgramacionDesembolso.dblcBancoChange(Sender: TObject);
begin
   If Trim(dblcBanco.Text) = '' Then
   Begin
      dblcBanco.Text := '';
      mebancodes.Text := '';
   End;
   If Length(dblcBanco.Text) = 2 Then
   Begin
      If DM1.cdsBanco.Locate('BANCOID', dblcBanco.Text, []) Then
      Begin
         mebancodes.Text := DM1.cdsBanco.FieldByName('BANCONOM').AsString;
      End
      Else
      Begin
         MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
         dblcBanco.Text := '';
         mebancodes.Text := '';
      End;
   End;
end;

procedure TFProgramacionDesembolso.dblcBancoExit(Sender: TObject);
Var xSql:String;
begin
  If Trim(dblcBanco.Text) <> '' Then
  Begin
    xSql := 'SELECT BANCOID FROM TGE105 WHERE BANCOID = '+QuotedStr(dblcBanco.Text);
    If DM1.verificaexiste(xSql) = False Then
    Begin
      MessageDlg('Código de banco no valido', mtInformation, [mbOk], 0);
      dblcBanco.Text := '';
      Exit;
    End;
  End;
end;

procedure TFProgramacionDesembolso.Button2Click(Sender: TObject);
Var xVoucher, texto, xSql:String;
item:Integer;
xValor:Double;
begin
   If rgCobAso.ItemIndex = 0 Then
   Begin
      If dblcforpag.Text = '' Then
      Begin
         MessageDlg('Debe seleccionar la forma de pago para generar el desembolso.', mtConfirmation,[mbOK], 0 );
         dblcforpag.SetFocus;
         Exit;
      End;
      If dblcBanco.Text = '' Then
      Begin
         MessageDlg('Debe seleccionar el banco para generar el desembolso.', mtConfirmation,[mbOK], 0 );
         dblcBanco.SetFocus;
         Exit;
      End;
      If MessageDlg('¿Seguro de insertar la forma de pago?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         If dblcforpag.Text = '01' Then
            texto := '* CHEQUE DEL ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', dblcBanco.Text);
         If dblcforpag.Text = '11' Then
            texto := '* LIBRETA DE AHORRO DEL ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', dblcBanco.Text);
         If dblcforpag.Text = '16' Then
            texto := '* CHEQUE DE GERENCIA ' + measoncta.Text + ' DEL ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', dblcBanco.Text);
         If dblcforpag.Text = '19' Then
            texto := '* DEPOSITO EN CUENTA DEL BANCO DE LA NACION  - ' + DM1.DevuelveValor('TGE105', 'BANCONOM', 'BANCOID', dblcBanco.Text);
         DM1.cdsForPag.Append;
         DM1.cdsForPag.FieldByName('DESC').AsString := texto;
         DM1.cdsForPag.FieldByName('FORPAGID').AsString := dblcforpag.Text;
         DM1.cdsForPag.FieldByName('BANCOID').AsString := dblcBanco.Text;
         DM1.cdsForPag.FieldByName('PVSLNCTA').AsString := measoncta.Text;
         DM1.cdsForPag.FieldByName('PVSLDNIBEN').AsString := DM1.cdsCabLiq.FieldByName('ASODNI').AsString;
         DM1.cdsForPag.FieldByName('PVSNOMBRE').AsString := DM1.cdsCabLiq.FieldByName('ASOAPENOMDNI').AsString;
         DM1.cdsForPag.FieldByName('APEPATCOB').AsString := DM1.cdsCabLiq.FieldByName('ASOAPEPATDNI').AsString;
         DM1.cdsForPag.FieldByName('APEMATCOB').AsString := DM1.cdsCabLiq.FieldByName('ASOAPEMATDNI').AsString;
         DM1.cdsForPag.FieldByName('APECASCOB').AsString := DM1.cdsCabLiq.FieldByName('ASOAPECASDNI').AsString;
         DM1.cdsForPag.FieldByName('NOMCOB').AsString := DM1.cdsCabLiq.FieldByName('ASONOMDNI').AsString;
         DM1.cdsForPag.Post;
         DM1.cdsForPag.Append;
         DM1.cdsForPag.FieldByName('DESC').AsString := '  A : ' + DM1.cdsCabLiq.FieldByName('ASOAPENOMDNI').AsString;
         If dblcforpag.Text = '01' Then
            DM1.cdsForPag.FieldByName('DESC').AsString    := DM1.cdsForPag.FieldByName('DESC').AsString + ' [CUENTA Nº ' + measoncta.Text +']';
         DM1.cdsForPag.FieldByName('DESC').AsString       := DM1.cdsForPag.FieldByName('DESC').AsString + ' [D.N.I. : ' + DM1.cdsCabLiq.FieldByName('ASODNI').AsString + ']';
         DM1.cdsForPag.FieldByName('MONTO').AsCurrency    := DM1.cdsCabLiq.FieldByName('MONAPAG').AsFloat;
         DM1.cdsForPag.FieldByName('FORPAGID').AsString   := dblcforpag.Text;
         DM1.cdsForPag.FieldByName('BANCOID').AsString    := dblcBanco.Text;
         DM1.cdsForPag.FieldByName('PVSLNCTA').AsString   := measoncta.Text;
         DM1.cdsForPag.FieldByName('PVSLDNIBEN').AsString := DM1.cdsCabLiq.FieldByName('ASODNI').AsString;
         DM1.cdsForPag.FieldByName('PVSNOMBRE').AsString  := DM1.cdsCabLiq.FieldByName('ASOAPENOMDNI').AsString;
         DM1.cdsForPag.FieldByName('APEPATCOB').AsString  := DM1.cdsCabLiq.FieldByName('ASOAPEPATDNI').AsString;
         DM1.cdsForPag.FieldByName('APEMATCOB').AsString  := DM1.cdsCabLiq.FieldByName('ASOAPEMATDNI').AsString;
         DM1.cdsForPag.FieldByName('APECASCOB').AsString  := DM1.cdsCabLiq.FieldByName('ASOAPECASDNI').AsString;
         DM1.cdsForPag.FieldByName('NOMCOB').AsString     := DM1.cdsCabLiq.FieldByName('ASONOMDNI').AsString;
         DM1.cdsForPag.FieldByName('PORCENTAJE').AsFloat  := 100;
         DM1.cdsForPag.FieldByName('MOVCOB').AsString     := DM1.cdsCabLiq.FieldByName('ASOTELF1').AsString;
         DM1.cdsForPag.Post;
         MessageDlg('Se ha añadido la forma de pago de la liquidación. Revise y puede proceder a generar el desembolso.', mtConfirmation,[mbOK], 0 );
         gbCobAso.Enabled := False;
         gbProgramacion.Visible := True;
         gbProgramacion.Left    := 5;
         gbProgramacion.Top     := 58;
      End;
   End;
End;


procedure TFProgramacionDesembolso.btncerrarClick(Sender: TObject);
begin
   Close;
end;

procedure TFProgramacionDesembolso.btnSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TFProgramacionDesembolso.btnGenerarClick(Sender: TObject);
Var item: integer;
    xValor: Double;
    xcobaso, xSql, xVoucher: String;
begin
   If MessageDlg('¿Seguro de proceder a generar el desembolso de esta liquidación?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
      DM1.numeroVoucherLib := '';
      DM1.numeroVoucher := '';
      xSql := 'SELECT MAX(PVSLSEC) ITEMINICIAL  FROM PVS307 WHERE PVSLBENNR = '+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      item := DM1.cdsQry.FieldByName('ITEMINICIAL').AsInteger;
      DM1.cdsForPag.First;
      While Not DM1.cdsForPag.Eof Do
      Begin
         item := item + 1;
         // Tomando voucher para las libretas de ahorros y otras formas de pago
         If (DM1.cdsForPag.FieldByName('FORPAGID').AsString = '11') And (DM1.numeroVoucherLib = '') Then DM1.numeroVoucherLib := DM1.Gennumvou;
         If (DM1.cdsForPag.FieldByName('FORPAGID').AsString <> '11') Then DM1.numeroVoucher := DM1.Gennumvou;
         If DM1.cdsForPag.FieldByName('FORPAGID').AsString = '11' Then
            xVoucher := DM1.numeroVoucherLib
         Else
            xVoucher := DM1.numeroVoucher;
         If DM1.cdsForPag.FieldByName('PORCENTAJE').AsFloat = 0 Then
            xValor := 0
         Else
            xValor := DM1.cdsForPag.FieldByName('PORCENTAJE').AsFloat;
         xSql := 'INSERT INTO PVS307 (CIAID, PVSLBENNR, PVSLTIPBE,PVSLAGRID,PVSLSEC,PVSLCONCE,PVSLMONTO,USUARIO,FREG,'
            + ' HREG,PVSLNVOU,BANCOID, FORPAGOID, PVSLSALDO, PVSNOMBRE,FLGVOUCHER, AGENBCOID, PVSLDNIBEN, PVSLNCTA, APENOMTUT,'
            + ' DOCIDETUT, FECNACMEN, PORDES, APEPATTUT, APEMATTUT, NOMTUT, APEPATCOB, APEMATCOB, NOMCOB, CODRELCOB, DIRDOMCOB, CODZIPCOB, TELFIJCOB, TELMOVCOB, APECASCOB, EMAILCOB)'
            + ' VALUES (' + QuotedStr('02') + ',' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString) + ',' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLTIPBE').AsString)
            + ',' + QuotedStr('FPG') + ',' + IntToStr(item) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('DESC').AsString) + ',' + FloatToStr(DM1.cdsForPag.FieldByName('MONTO').AsFloat)
            + ',' + QuotedStr(DM1.wUsuario) + ', TO_CHAR(SYSDATE, ''DD/MM/YYYY''), SYSDATE, ' + QuotedStr(xVoucher) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('BANCOID').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('FORPAGID').AsString)
            + ',' + FloatToStr(DM1.cdsForPag.FieldByName('MONTO').AsFloat) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('PVSNOMBRE').AsString)
            + ',' + QuotedStr('S') + ',' + QuotedStr(DM1.cdsForPag.FieldByName('AGENBCOID').AsString) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('PVSLDNIBEN').AsString) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('PVSLNCTA').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('APENOMTUT').AsString) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('DOCIDETUT').AsString) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('FECNACMEN').AsString)
            + ',' + FloatToStr(xValor)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('APEPATTUT').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('APEMATTUT').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('NOMTUT').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('APEPATCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('APEMATCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('NOMCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('CODRELCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('DIRDOMCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('CODZIPCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('TELFIJCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('TELMOVCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('APECASCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('EMAILCOB').AsString)
            + ')';
         DM1.DCOM1.AppServer.EjecutaSQL(xSql);
         DM1.cdsForPag.Next;
         item := item + 1;
         If DM1.cdsForPag.FieldByName('PORCENTAJE').AsFloat = 0 Then
            xValor := 0
         Else
            xValor := DM1.cdsForPag.FieldByName('PORCENTAJE').AsFloat;
         xSql := 'INSERT INTO PVS307 (CIAID, PVSLBENNR, PVSLTIPBE,PVSLAGRID,PVSLSEC,PVSLCONCE,PVSLMONTO,USUARIO,FREG,'
            + ' HREG,PVSLNVOU,BANCOID, FORPAGOID, PVSLSALDO, PVSNOMBRE,FLGVOUCHER, AGENBCOID, PVSLDNIBEN, PVSLNCTA, APENOMTUT, DOCIDETUT, FECNACMEN, PORDES,'
            + ' APEPATTUT, APEMATTUT, NOMTUT, APEPATCOB, APEMATCOB, NOMCOB, CODRELCOB, DIRDOMCOB, CODZIPCOB, TELFIJCOB, TELMOVCOB, APECASCOB, EMAILCOB)'
            + ' VALUES (' + QuotedStr('02') + ',' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString) + ',' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLTIPBE').AsString)
            + ',' + QuotedStr('FPG') + ',' + IntToStr(item) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('DESC').AsString) + ',' + FloatToStr(DM1.cdsForPag.FieldByName('MONTO').AsFloat)
            + ',' + QuotedStr(DM1.wUsuario) + ', TO_CHAR(SYSDATE, ''DD/MM/YYYY''), SYSDATE, ' + QuotedStr(xVoucher) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('BANCOID').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('FORPAGID').AsString)
            + ',' + FloatToStr(DM1.cdsForPag.FieldByName('MONTO').AsFloat) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('PVSNOMBRE').AsString)
            + ',' + QuotedStr('N') + ',' + QuotedStr(DM1.cdsForPag.FieldByName('AGENBCOID').AsString) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('PVSLDNIBEN').AsString) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('PVSLNCTA').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('APENOMTUT').AsString) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('DOCIDETUT').AsString) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('FECNACMEN').AsString)
            + ',' + FloatToStr(xValor)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('APEPATTUT').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('APEMATTUT').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('NOMTUT').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('APEPATCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('APEMATCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('NOMCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('CODRELCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('DIRDOMCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('CODZIPCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('TELFIJCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('TELMOVCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('APECASCOB').AsString)
            + ',' + QuotedStr(DM1.cdsForPag.FieldByName('EMAILCOB').AsString)
            + ')';
         DM1.DCOM1.AppServer.EjecutaSQL(xSql);
         If (DM1.cdsForPag.FieldByName('MONTO').AsFloat > 0) And (DM1.cdsForPag.FieldByName('FORPAGID').AsString = '01') Then
         Begin
            xSql := 'INSERT INTO PVS_CHE_GEN_CAB(ASOID, PVSLBENNR, APENOMBEN, DOCIDEBEN, MONCHE, ESTCHE, PORDES, PVSNVOU, PVSLTIPBE, PVSLFECBE, BANCOID)'
               + ' VALUES (' + QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString) + ',' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString) + ',' + QuotedStr(DM1.cdsForPag.FieldByName('PVSNOMBRE').AsString)
               + ',' + QuotedStr(DM1.cdsForPag.FieldByName('PVSLDNIBEN').AsString) + ',' + FloatToStr(DM1.cdsForPag.FieldByName('MONTO').AsFloat) + ',' + QuotedStr('01') + ',' + FloatToStr(xValor)
               + ',' + QuotedStr(DM1.numeroVoucher) + ',' + QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLTIPBE').AsString) + ', TO_CHAR(SYSDATE, ''DD/MM/YYYY''),' + QuotedStr(DM1.cdsForPag.FieldByName('BANCOID').AsString) + ')';
            DM1.DCOM1.AppServer.EjecutaSQL(xSql);
         End;
         DM1.cdsForPag.Next;
      End;
      xSql := 'UPDATE PVS306 SET FLADES = ''S'', USUDES = '+QuotedStr(DM1.wUsuario)+', FECDES = SYSDATE WHERE ASOID = '+QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)
      +' AND PVSLBENNR = '+QuotedStr(DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString);
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      If rgCobAso.ItemIndex = 0 Then xcobaso := 'S';
      If rgCobAso.ItemIndex = 1 Then xcobaso := 'N';
      xSql := 'UPDATE PVS301 SET PVSCOBASO = '+QuotedStr(xcobaso)+' WHERE ASOID = '+QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)+' AND PVSLBENNR = '+ DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString;
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      xSql := 'UPDATE PVS306 SET PVSCOBASO = '+QuotedStr(xcobaso)+' WHERE ASOID = '+QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString)+' AND PVSLBENNR = '+ DM1.cdsCabLiq.FieldByName('PVSLBENNR').AsString;
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      MessageDlg('Información de desembolso fue generado satisfactoriamente.', mtConfirmation,[mbOK], 0 );
      btnSalir.OnClick(btnSalir);
   End;
End;   
end.
