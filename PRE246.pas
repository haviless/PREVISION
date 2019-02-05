// Actualizaciones
// SAR-2009-0984   : SE AÑADE EL CAMPO AUTDESAPO
// HPC_201211_PRE  : Se Controla que la fecha de autorización de descuento de aportes sea menor que la fecha de cese.
//                      * Para los casos de Fallecimiento e Invalidez. Si la fecha de autorización de descuento de aportes es mayor a la fecha de cese
//                      * solo se pagara cuenta invididual (Tambien tomar en cuenta que para estos casos ya no se cobrara nivelación de Aportes
// DPP_201209_PRE  : Se realiza el pase a produccion a partir del HPC_201211_PRE

unit PRE246;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, Buttons, wwdbdatetimepicker, Grids,
  Wwdbigrd, Wwdbgrid;

type
  TFmodificacionresolucion = class(TForm)
    GroupBox1: TGroupBox;
    pnlnumresnom: TPanel;
    menumresnom: TMaskEdit;
    btncalculaliquidacion: TBitBtn;
    btncerrar: TBitBtn;
    lblbanco: TLabel;
    Label1: TLabel;
    dbdtpfecnom: TwwDBDateTimePicker;
    dbdtpfecces: TwwDBDateTimePicker;
    pnlnumresces: TPanel;
    menumresces: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    dbgcalben: TwwDBGrid;
    btnactualiza: TBitBtn;
    procedure btncalculaliquidacionClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure btnactualizaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fmodificacionresolucion: TFmodificacionresolucion;

implementation

uses PREDM;

{$R *.dfm}


procedure TFmodificacionresolucion.btncalculaliquidacionClick(Sender: TObject);
Var xSql:String;
begin
    xSql := ' SELECT  A.ASOID, A.PVSEXPNRO, A.ASORESNOM, A.ASOFRESNOM, A.ASORESCESE, A.ASOFRESCESE, A.PVSCOBASO, A.PVSTIPBEN, A.PVSULTAPO,'
    +' A.FORPAGOID, A.BANCOID, A.AGENBCOID, A.ASONCTA, A.REPRID, B.ASOAPENOMDNI, B.ASOCODMOD, B.USEID, B.UPAGOID, B.UPROID, B.ASODIR,'
    // Inicio: DPP_201209_PRE
    //+' B.ZIPID, B.ASODNI, F.TIPDOCDES, D.BENEFDES, C.PVSESTDES, DECODE(E.REPRAPENOM, NULL, ''SEDE CENTRAL'', E.REPRAPENOM) REPRAPENOM, B.AUTDESAPO'
    +' B.ZIPID, B.ASODNI, F.TIPDOCDES, D.BENEFDES, C.PVSESTDES, DECODE(E.REPRAPENOM, NULL, ''SEDE CENTRAL'', E.REPRAPENOM) REPRAPENOM, B.AUTDESAPO, B.FECAUTDESAPO'
    // Fin: DPP_201209_PRE
    +' FROM PVS301 A, APO201 B,  PVS102 C, TGE186 D, COB201 E, TGE159 F'
    +' WHERE A.ASOID = '+QuotedStr(DM1.cdsCabLiq.FieldByname('ASOID').AsString)
    +' AND A.PVSESTADO NOT IN (''04'',''13'') AND A.ASOID = B.ASOID AND A.ASOID = B.ASOID And A.PVSESTADO = C.PVSESTDSG AND C.PVSDOC = ''E'' AND A.PVSTIPBEN = D.TIPBENEF'
    +' AND A.TIPDOCCOD = F.TIPDOCCOD(+) AND A.REPRID = E.REPRID(+) ORDER BY PVSEXPNRO';
    DM1.cdsExpLiq.Close;
    DM1.cdsExpLiq.DataRequest(xSql);
    DM1.cdsExpLiq.Open;
    DM1.cdsExpLiq.Edit;
    DM1.cdsExpLiq.FieldByName('ASORESNOM').AsString := menumresnom.Text;
    DM1.cdsExpLiq.FieldByName('ASORESCESE').AsString  := menumresces.Text;
    DM1.cdsExpLiq.FieldByName('ASOFRESCESE').AsString := dbdtpfecces.Text;
    DM1.calculaliquidacion;
//    DM1.dsDetCalLiqMod.DataSet := DM1.dsCalLiq.DataSet;
    dbgcalben.Visible := True;
    dbgcalben.ColumnByName('DESC').FooterValue := 'TOTAL BENEFICIO ASIGNADO '
    +DM1.DevuelveValor('TGE186', 'BENEFDES', 'TIPBENEF', DM1.cdsCabLiq.FieldByName('PVSLTIPBE').AsString);
    dbgcalben.ColumnByName('MONTO').FooterValue := FormatFloat('###,###.#0',DM1.liquidacionbeneficio);
    btnactualiza.Enabled := True;
end;

procedure TFmodificacionresolucion.btncerrarClick(Sender: TObject);
begin
  Fmodificacionresolucion.Close;
end;

procedure TFmodificacionresolucion.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
  begin
    Key := #0;
    Perform(CM_DIALOGKEY, VK_TAB, 0);
  end;
end;

procedure TFmodificacionresolucion.FormActivate(Sender: TObject);
Var xSql:String;
begin
  Fmodificacionresolucion.Top  := 113;
  Fmodificacionresolucion.Left := 153;
  xSql := 'SELECT ASORESNOM, ASOFRESNOM FROM APO201 WHERE ASOID = '+QuotedStr(DM1.cdsCabLiq.FieldByName('ASOID').AsString);
  DM1.cdsAsociado.Close;
  DM1.cdsAsociado.DataRequest(xSql);
  DM1.cdsAsociado.Open;
  menumresnom.Text := DM1.cdsAsociado.fieldByName('ASORESNOM').AsString;
  dbdtpfecnom.DateTime := DM1.cdsAsociado.fieldByName('ASOFRESNOM').AsDateTime;
  menumresces.Text := DM1.cdsCabLiq.FieldByName('ASORESCESE').AsString;
  dbdtpfecces.DateTime := DM1.cdsCabLiq.FieldByName('ASOFRESCESE').AsDateTime;
end;

procedure TFmodificacionresolucion.btnactualizaClick(Sender: TObject);
Var xSql:String;
begin
// Actualiza infomación de beneficios
// Para poder modificar los montos de la liquidación se tiene que tomar en cuenta
// lo siguiente:
// ((((1))))
// Primero se verifica que el docente o cualquiera de los beneficiarios no
// haya(n) cobrado la liquidación
  xSql := 'SELECT * FROM PVS307 WHERE PVSLBENNR = '+QuotedStr(DM1.cdsCabLiq.FieldByname('PVSLBENNR').AsString)+' AND PVSLAGRID = ''FPG'' AND FLGVOUCHER = ''N'' ';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  DM1.cdsQry.First;
  While Not DM1.cdsQry.Eof Do
  Begin
    If ((DM1.cdsQry.FieldByName('NROCHEQUE').AsString <> '') Or (DM1.cdsQry.FieldByName('PVSLNOFC').AsString <> ''))
    And (DM1.cdsQry.FieldByName('PVSLMONTO').AsFloat > 0) Then
    Begin
      MessageDlg('Ya existe un desembolso en la liquidación', mtInformation, [mbOk], 0);
      Exit;
    End;
    DM1.cdsQry.Next;
  End;
// (((2)))
// Verificar que el monto de la liquidación no afecte al prestamo ya descontado y a las
// Devoluciones y nivelaciones de aportes






end;

end.
