// Unidad            : Previsión Social
// Formulario        : FNueSegExp
// Fecha de Creación : 08/01/2014
// Autor             : irevilla
// Objetivo          : Registras estados de los expedientes de beneficios (Pantalla principal)
// HPC_201307_PRE    : Creación
// SPP_201401_PRE    : Se realiza el pase a producción a partir del pase HPC_201307_PRE
// SPP_201402_PRE    : Se añade al grid el campo "COMOBS".
// HPC_201709_PRE    : Se deshabilita el boton de insertar nuevo seguimiento
//                     si el expediente esta anulado  
// HPC_201809_PRE    : Se modifica los campos de ingreso de datos para el seguimiento de expediente

unit PRE292;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, wwriched, wwdbdatetimepicker, ExtCtrls,
  // Inicio: HPC_201809_PRE
  // Se añade la unidad Mask
  // fcButton, fcImgBtn, fcShapeBtn, Buttons, Wwdbigrd, Grids, Wwdbgrid;
  fcButton, fcImgBtn, fcShapeBtn, Buttons, Wwdbigrd, Grids, Wwdbgrid, Mask;
  // Fin: HPC_201809_PRE

type
  TFNueSegExp = class(TForm)
    dbgSegExp: TwwDBGrid;
    dbgExpBenIButton: TwwIButton;
    btncerrar: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    stNumExp: TStaticText;
    stFecreg: TStaticText;
    stUsuReg: TStaticText;
    Label4: TLabel;
    stasoapenom: TStaticText;
    // Inicio: HPC_201809_PRE
    // Nueva cajas de texto y etiquetas al modificar el seguimiento de expediente
    pnlmostrar: TPanel;
    gbmostrar: TGroupBox;
    btncerrarpanel: TBitBtn;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    mefecreg: TMaskEdit;
    meusureg: TMaskEdit;
    meespexp: TMaskEdit;
    mesitexp: TMaskEdit;
    memoobservacion: TMemo;
    // Fin: HPC_201809_PRE
    procedure FormActivate(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure dbgExpBenIButtonClick(Sender: TObject);
    // Inicio: HPC_201809_PRE
    // Se añaden procedimiento para controlar las caja de seleccion 
    procedure dbgSegExpDblClick(Sender: TObject);
    procedure btncerrarpanelClick(Sender: TObject);
    // Fin: HPC_201809_PRE
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNueSegExp: TFNueSegExp;

implementation

uses PREDM, PRE235, PRE279, PRE253;

{$R *.dfm}

procedure TFNueSegExp.FormActivate(Sender: TObject);
Var xSql:String;
begin
   // Inicio: HPC_201709_PRE
   // Se actualiza deshabilita el boton de insertar seguimiento si es expediente anulado
   // If (DM1.cdsExpLiq.FieldByName('PVSLBENNR').AsString <> '') Then dbgExpBenIButton.Enabled := False;
   If (DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString = '02') Or (DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString = '06') Or
      (DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString = '13') Then
      dbgExpBenIButton.Enabled := False;
   // Fin: HPC_201709_PRE
   stNumExp.Caption := DM1.cdsExpLiq.FieldByName('PVSEXPNRO').AsString;
   stFecreg.Caption := DM1.cdsExpLiq.FieldByName('PVSFECEXP').AsString;
   stUsuReg.Caption := DM1.cdsExpLiq.FieldByName('USUARIO').AsString;
   stasoapenom.Caption := DM1.cdsAsociado.FieldByName('ASOAPENOMDNI').AsString;
   // Inicio: HPC_201809_PRE
   // xSql := 'SELECT  E.OFDESNOM, F.DPTODES, A.ASOAPENOM, A.NUMEXP, A.FEC_HOR_CRE, A.USU_CRE, B.ITEM, B.CODESTEXP, C.DESESPEXP, B.CODSITEXP, B.USUARIO, B.FECSITEXP,'
   // // Inicio: SPP_201402_PRE
   // // +' D.DESSITEXP, B.USUARIO, B.FECSITEXP'
   // +' D.DESSITEXP, B.USUARIO, B.FECSITEXP, B.COMOBS'
   // // Fin: SPP_201402_PRE
   // +' FROM PVSSEGEXPCAB A, PVSSEGEXPDET B, PVSSEGESTREF C,  PVSSEGSITREF D, APO110 E, APO158 F'
   // +' WHERE A.ASOID = '+QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString)+' AND A.NUMEXP = '+QuotedStr(DM1.cdsExpLiq.FieldByName('PVSEXPNRO').AsString)
   // +' AND A.ASOID = B.ASOID AND A.NUMEXP = B.NUMEXP'
   // +' AND B.CODESTEXP = C.CODESTEXP'
   // +' AND B.CODESTEXP = D.CODESTEXP AND B.CODSITEXP = D.CODSITEXP'
   // +' AND A.OFDESID = E.OFDESID'
   // +' AND A.DPTOID = F.DPTOID'
   // +' ORDER BY A.ITEM';
   xSql := 'SELECT E.OFDESNOM, F.DPTODES, A.ASOAPENOM, A.NUMEXP, A.FEC_HOR_CRE, A.USU_CRE, B.ITEM, B.CODESTEXP, C.DESESPEXP, B.CODSITEXP, B.USUARIO, G.USERNOM, B.FECSITEXP, D.DESSITEXP, B.COMOBS'
   +' FROM PVSSEGEXPCAB A, PVSSEGEXPDET B, PVSSEGESTREF C,  PVSSEGSITREF D, APO110 E, APO158 F, TGE006 G'
   +' WHERE A.ASOID = '+QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString)+' AND A.NUMEXP = '+QuotedStr(DM1.cdsExpLiq.FieldByName('PVSEXPNRO').AsString)
   +' AND A.ASOID = B.ASOID AND A.NUMEXP = B.NUMEXP AND B.CODESTEXP = C.CODESTEXP AND B.CODESTEXP = D.CODESTEXP AND B.CODSITEXP = D.CODSITEXP AND A.OFDESID = E.OFDESID'
   +' AND A.DPTOID = F.DPTOID AND B.USUARIO = G.USERID ORDER BY A.ITEM';
   // Fin: HPC_201809_PRE
   DM1.cdsFonSolDet.Close;
   DM1.cdsFonSolDet.DataRequest(xSql);
   DM1.cdsFonSolDet.Open;
   dbgSegExp.Selected.Clear;
   dbgSegExp.Selected.Add('ITEM'#9'2'#9'Item'#9#9);
   dbgSegExp.Selected.Add('DPTODES'#9'18'#9'Departamento~que registra'#9#9);
   dbgSegExp.Selected.Add('OFDESNOM'#9'25'#9'Oficina que~registra'#9#9);
   dbgSegExp.Selected.Add('CODESTEXP'#9'2'#9'Código de~estado'#9#9);
   dbgSegExp.Selected.Add('DESESPEXP'#9'20'#9'Descripción~de estado'#9#9);
   dbgSegExp.Selected.Add('CODSITEXP'#9'2'#9'Código de~Situación'#9#9);
   dbgSegExp.Selected.Add('DESSITEXP'#9'20'#9'Descripción de~Situación'#9#9);
   // Inicio: SPP_201402_PRE
   dbgSegExp.Selected.Add('COMOBS'#9'30'#9'Observación'#9#9);
   // Fin: SPP_201402_PRE
   dbgSegExp.Selected.Add('USUARIO'#9'15'#9'Usuario que~registra'#9#9);
   dbgSegExp.Selected.Add('FECSITEXP'#9'10'#9'Fecha que~registra'#9#9);
   dbgSegExp.ApplySelected;
end;

procedure TFNueSegExp.btncerrarClick(Sender: TObject);
begin
   FnueSegExp.Close;
end;

procedure TFNueSegExp.dbgExpBenIButtonClick(Sender: TObject);
Var xSql: String;
begin
   // Se verifica si se puede insertar registros.
   // 1. Si esta liquidado no se puede insertar registros
   xSql := 'SELECT MAX(CODSITEXP) CODSITEXP FROM PVSSEGEXPDET WHERE ASOID = '+QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString)+' AND NUMEXP = '+QuotedStr(DM1.cdsExpLiq.FieldByName('PVSEXPNRO').AsString)+' AND CODESTEXP = ''03''';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   If DM1.cdsQry.FieldByName('CODSITEXP').AsString = '20' Then
   Begin
      MessageDlg('Expediente ya liquidado', mtInformation, [mbOk], 0);
      Exit;
   End;
   Try
      Fnueseg := TFnueseg.create(Self);
      Fnueseg.ShowModal;
   Finally
      Fnueseg.Free;
   End;
   FNueSegExp.FormActivate(Self);
end;

// Inicio: HPC_201809_PRE
// Nuevos procedimiento para controlar el panel de información registrada
procedure TFNueSegExp.dbgSegExpDblClick(Sender: TObject);
begin
   gbmostrar.Enabled := True;
   mefecreg.Text := DM1.cdsFonSolDet.FieldByName('FECSITEXP').AsString;
   meusureg.Text := DM1.cdsFonSolDet.FieldByName('USERNOM').AsString;
   meespexp.Text := DM1.cdsFonSolDet.FieldByName('DESESPEXP').AsString;
   mesitexp.Text := DM1.cdsFonSolDet.FieldByName('DESSITEXP').AsString;
   memoobservacion.Text := DM1.cdsFonSolDet.FieldByName('COMOBS').AsString;
   pnlmostrar.Top := 106;
   pnlmostrar.Left := 184;
   pnlmostrar.Visible := True;
   gbmostrar.Enabled := False;
end;

procedure TFNueSegExp.btncerrarpanelClick(Sender: TObject);
begin
   pnlmostrar.Visible := False;
end;
// Fin: HPC_201809_PRE


end.
