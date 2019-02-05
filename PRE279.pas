// Unidad            : Previsión Social
// Formulario        : Fnueseg
// Fecha de Creación : 09/01/2014
// Autor             : irevilla
// Objetivo          : Ingreso de los estados y situaciones del expediente.
// HPC_201307_PRE    : Creación.
// SPP_201401_PRE    : Se realiza el pase a producción a partir del pase HPC_201307_PRE
// HPC_201610_PRE : CREAR Y MODIFICAR INDICADORES DE CALIDAD
// HPC_201809_PRE : Se pasa campo caja de texto a tipo memo para que acepte mas caracteres

unit PRE279;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, wwdblook, Wwdbdlg, Mask;

type
  TFnueseg = class(TForm)
    btngraba: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dblgEstExp: TwwDBLookupComboDlg;
    dbgSitEst: TwwDBLookupComboDlg;
    stDesSegExp: TStaticText;
    stDesSitExp: TStaticText;
    // Inicio: HPC_201809_PRE
    // Se retira caja de texto
    // mecomobs: TMaskEdit;
    // Fin: HPC_201809_PRE
    lbltitobs: TLabel;
    btncerrar: TBitBtn;
    // Inicio: HPC_201809_PRE 
    // Se añade variable memo
    mecomobs: TMemo;
    // Fin: HPC_201809_PRE 
    procedure btngrabaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgSitEstChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btncerrarClick(Sender: TObject);
    procedure dblgEstExpExit(Sender: TObject);
    procedure dbgSitEstExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fnueseg: TFnueseg;

implementation

uses PREDM;

{$R *.dfm}

procedure TFnueseg.btngrabaClick(Sender: TObject);
Var xSql:String;
begin
   If (dblgEstExp.Text <> '03') And (dbgSitEst.Text <> '01') Then
      mecomobs.Text := '';

   If Trim(dblgEstExp.Text) = '' Then
   Begin
     MessageDlg('Debe ingresar Estado del expediente.', mtInformation, [mbOk], 0);
     dblgEstExp.SetFocus;
     Exit;
   End;
   If Trim(dbgSitEst.Text) = '' Then
   Begin
     MessageDlg('Debe ingresar Situación del expediente.', mtInformation, [mbOk], 0);
     dbgSitEst.SetFocus;
     Exit;
   End;
   If (dblgEstExp.Text = '03') And (dbgSitEst.Text = '01') And (Trim(mecomobs.Text) = '') Then
   Begin
      MessageDlg('Ingrese comentario de la observación', mtInformation, [mbOk], 0);
      mecomobs.SetFocus;
      Exit;
   End;

   If MessageDlg('¿Registrar seguimiento?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
      // SEGUIMIENTO (SE ELIJE LA SITUACION)
      xSql := 'Begin SP_PVS_SEG_EXP('+QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString)+', '+QuotedStr(DM1.cdsExpLiq.FieldByName('PVSEXPNRO').AsString)
      +', '+QuotedStr(dblgEstExp.Text)+', '+QuotedStr(dbgSitEst.Text) +', TO_DATE(SYSDATE,''DD/MM/YYYY''), '+QuotedStr(DM1.wUsuario)+','+QuotedStr(mecomobs.Text)+'); End;';
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
   End;
   Fnueseg.Close;
end;

procedure TFnueseg.FormActivate(Sender: TObject);
Var xSql:String;
begin
   lbltitobs.Visible := False;
   mecomobs.Visible := False;
   xSql := 'SELECT CODESTEXP, DESESPEXP FROM PVSSEGESTREF WHERE NVL(FLGMAN,''N'') = ''S''';
   DM1.cdsSegEstExp.Close;
   DM1.cdsSegEstExp.DataRequest(xSql);
   DM1.cdsSegEstExp.Open;
   dblgEstExp.Selected.Clear;
   dblgEstExp.Selected.Add('CODESTEXP'#9'8'#9'Código'#9#9);
   dblgEstExp.Selected.Add('DESESPEXP'#9'25'#9'Descripicón'#9#9);
   dblgEstExp.SetFocus;
   // INICIO HPC_201610_PRE
   // AMPLIA CANTIDAD DE CARACTERES
   mecomobs.MaxLength := 200;
   // FIN HPC_201610_PRE
end;

procedure TFnueseg.dbgSitEstChange(Sender: TObject);
begin
   If (dblgEstExp.Text = '03') And (dbgSitEst.Text = '01') Then
   Begin
     lbltitobs.Visible := True;
     mecomobs.Visible := True;
   End
   Else
   Begin
     lbltitobs.Visible := False;
     mecomobs.Visible := False;
   End;
end;


procedure TFnueseg.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  begin
    Key := #0;
    Perform(CM_DIALOGKEY, VK_TAB, 0);
  end;
end;

procedure TFnueseg.btncerrarClick(Sender: TObject);
begin
   Fnueseg.Close;
end;

procedure TFnueseg.dblgEstExpExit(Sender: TObject);
Var xSql:String;
begin
   // Inicio: HPC_201809_PRE
   // Controla salir de la caja si esta vacia
   If Trim(dblgEstExp.Text) = '' Then Exit;
   // Fin: HPC_201809_PRE
   If DM1.cdsSegEstExp.Locate('CODESTEXP',VarArrayof([dblgEstExp.text]),[]) Then
   Begin
      stDesSegExp.Caption := DM1.cdsSegEstExp.FieldByName('DESESPEXP').AsString;
      If DM1.wofides = '01' Then
         xSql := 'SELECT CODSITEXP, DESSITEXP FROM PVSSEGSITREF WHERE CODESTEXP = '+QuotedStr(DM1.cdsSegEstExp.FieldByName('CODESTEXP').AsString)+' AND NVL(FLGMAN,''N'') = ''S'' AND NVL(SEDE,''X'') = ''S'' ORDER BY CODSITEXP'
      Else
         xSql := 'SELECT CODSITEXP, DESSITEXP FROM PVSSEGSITREF WHERE CODESTEXP = '+QuotedStr(DM1.cdsSegEstExp.FieldByName('CODESTEXP').AsString)+' AND NVL(FLGMAN,''N'') = ''S'' AND NVL(OFICINAS,''X'') = ''S'' ORDER BY CODSITEXP';
      DM1.cdsSegSitExp.Close;
      DM1.cdsSegSitExp.DataRequest(xSql);
      DM1.cdsSegSitExp.Open;
      dbgSitEst.Selected.Clear;
      dbgSitEst.Selected.Add('CODSITEXP'#9'8'#9'Código'#9#9);
      dbgSitEst.Selected.Add('DESSITEXP'#9'25'#9'Descripicón'#9#9);
   End
   Else
   Begin
      MessageDlg('Código de estado no valido', mtInformation, [mbOk], 0);
      dblgEstExp.SetFocus;
      Exit;
   End;
end;

procedure TFnueseg.dbgSitEstExit(Sender: TObject);
begin
   // Inicio: HPC_201809_PRE
   // Controla salir de la caja si esta vacia
   If Trim(dbgSitEst.Text) = '' Then Exit;
   // Fin: HPC_201809_PRE
   If DM1.cdsSegSitExp.Locate('CODSITEXP',VarArrayof([dbgSitEst.text]),[]) Then
      stDesSitExp.Caption := DM1.cdsSegSitExp.FieldByName('DESSITEXP').AsString
   Else
   Begin
      MessageDlg('Código de situación no valido', mtInformation, [mbOk], 0);
      dbgSitEst.SetFocus;
      Exit;
   End;
end;

end.
