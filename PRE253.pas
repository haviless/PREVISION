// HPC_201307_PRE : Se adiciona marca para que no pueda ser modificado una vez que el expediente cuente con liquidación.
// SPP_201401_PRE : Se realiza el pase a producción a partir del pase HPC_201307_PRE

unit PRE253;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, wwriched, wwdbdatetimepicker, ExtCtrls,
  fcButton, fcImgBtn, fcShapeBtn, Buttons, Wwdbigrd, Grids, Wwdbgrid;

type
  TFSeguimiento = class(TForm)
    GroupBox1: TGroupBox;
    pnlObservacion: TPanel;
    Label34: TLabel;
    dbgObserv: TwwDBGrid;
    gbanade: TGroupBox;
    Label35: TLabel;
    Label36: TLabel;
//Inicio: SPP_201401_PRE
    // dbdtpfecha: TwwDBDateTimePicker;
    dbeObs: TwwDBRichEdit;
    // btngraba: TBitBtn;
//Fin: SPP_201401_PRE 
    BitBtn1: TBitBtn;
    btncerrar: TBitBtn;
    //Inicio: SPP_201401_PRE
    stFecIng: TStaticText;
    Label1: TLabel;
    stUsuReg: TStaticText;
    //Fin: SPP_201401_PRE    
    procedure FormActivate(Sender: TObject);
//    procedure dbgObservIButtonClick(Sender: TObject); // SPP_201401_PRE
    procedure BitBtn1Click(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
//    procedure btngrabaClick(Sender: TObject);         // SPP_201401_PRE
    procedure dbgObservDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSeguimiento: TFSeguimiento;

implementation

uses PREDM, PRE235;

{$R *.dfm}

procedure TFSeguimiento.FormActivate(Sender: TObject);
var xSql:String;
begin
  //Inicio: SPP_201401_PRE
  // FSeguimiento.Top := 60;
  // FSeguimiento.Left := 0;
  // If (DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString = '02') Or (DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString = '06') Then dbgObservIButton.Enabled := False;
  //Fin: SPP_201401_PRE
  xSql := 'SELECT PVSEXPNRO, PVSTIPBEN, ASOID, ASOCODMOD, ASOCODAUX, PVSLBENNR, PVSOBS, FREG, HREG, USUARIO, FECING '
  +' FROM PVS312 WHERE ASOID = '+QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString)
  +' AND PVSEXPNRO = '+QuotedStr(DM1.cdsExpLiq.FieldByName('PVSEXPNRO').AsString)
  +' ORDER BY FECING DESC';
  DM1.cdsQry20.Close;
  DM1.cdsQry20.DataRequest(xSql);
  DM1.cdsQry20.Open;
  gbanade.Visible := False;
  dbgObserv.Selected.Clear;
  dbgObserv.Selected.Add('FECING'#9'10'#9'Fecha de~ingreso'#9'T');
  dbgObserv.Selected.Add('PVSOBS'#9'80'#9'Observación'#9'T');
  dbgObserv.Selected.Add('FREG'#9'10'#9'Fecha de~registro'#9'T');
  dbgObserv.Selected.Add('USUARIO'#9'10'#9'Usuario que~registro'#9'T');
  dbgObserv.ApplySelected;
end;

//Inicio: SPP_201401_PRE
// procedure TFSeguimiento.dbgObservIButtonClick(Sender: TObject);
// begin
//    gbanade.Visible := True;
//    gbanade.Left := 46;
//    gbanade.Top  := 56;
//    dbdtpfecha.Text := '';
//    dbeObs.Text :=  '';
//    btngraba.Enabled := True;
//    dbdtpfecha.SetFocus;
// end;
//Fin: SPP_201401_PRE

procedure TFSeguimiento.BitBtn1Click(Sender: TObject);
begin
  gbanade.Visible := False;
end;

procedure TFSeguimiento.btncerrarClick(Sender: TObject);
begin
  FSeguimiento.Close;
end;

procedure TFSeguimiento.FormKeyPress(Sender: TObject; var Key: Char);
begin
 If Key = #13 Then
 begin
    Key := #0;
    Perform(CM_DIALOGKEY, VK_TAB, 0);
 end;
end;

//Inicio: SPP_201401_PRE
// procedure TFSeguimiento.btngrabaClick(Sender: TObject);
// Var xSql:String;
// Begin
//  If MessageDlg('¿ Confirme la grabación ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
//  Begin
//    xSql := 'INSERT INTO PVS312 (PVSEXPNRO, PVSTIPBEN, ASOID, ASOCODMOD, ASOCODAUX, PVSLBENNR,  PVSOBS, FREG, HREG, USUARIO, FECING)'
//    +' VALUES ('
//    +QuotedStr(DM1.cdsExpLiq.FieldByName('PVSEXPNRO').AsString)
//    +','+QuotedStr(DM1.cdsExpLiq.FieldByName('PVSTIPBEN').AsString)
//    +','+QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString)
//    +','+QuotedStr(DM1.cdsExpLiq.FieldByName('ASOCODMOD').AsString)
//    +','+QuotedStr(DM1.cdsExpLiq.FieldByName('ASOCODAUX').AsString)
//    +','+QuotedStr(DM1.cdsExpLiq.FieldByName('PVSLBENNR').AsString)
//    +','+QuotedStr(trim(dbeObs.Text))
//    +', TO_DATE(SYSDATE,''DD/MM/YYYY''), SYSDATE'
//    +','+QuotedStr(DM1.wUsuario)
//    +','+QuotedStr(dbdtpfecha.Text)+')';
//    DM1.DCOM1.AppServer.EjecutaSQL(xSql);
//    xSql := 'SELECT PVSEXPNRO, PVSTIPBEN, ASOID, ASOCODMOD, ASOCODAUX, PVSLBENNR, PVSOBS, FREG, HREG, USUARIO, FECING'
//    +' FROM PVS312 WHERE ASOID = '+QuotedStr(DM1.cdsExpLiq.FieldByName('ASOID').AsString)
//    +' AND PVSEXPNRO = '+QuotedStr(DM1.cdsExpLiq.FieldByName('PVSEXPNRO').AsString)
//    +' ORDER BY FECING DESC';
//    DM1.cdsQry20.Close;
//    DM1.cdsQry20.DataRequest(xSql);
//    DM1.cdsQry20.Open;
//    dbgObserv.Refresh;
//    MessageDlg('Grabación Ok', mtInformation, [mbOk], 0);
//  End;
//  FModExpben.llenaredit;
//  gbanade.Visible := False;
//end;
//Fin: SPP_201401_PRE

//Inicio: SPP_201401_PRE
procedure TFSeguimiento.dbgObservDblClick(Sender: TObject);
begin
  gbanade.Visible := True;
  stFecIng.Caption := DM1.cdsQry20.FieldByName('FECING').AsString;
  stUsuReg.Caption := DM1.cdsQry20.FieldByName('USUARIO').AsString;
  dbeObs.Text := DM1.cdsQry20.FieldByName('PVSOBS').AsString;
  // dbdtpfecha.Date := DM1.cdsQry20.FieldByName('FECING').AsDateTime;
  // btngraba.Enabled := False; SPP_201401_PRE
end;
//Fin: SPP_201401_PRE

end.
