unit PRE261;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fcButton, fcImgBtn, fcShapeBtn, StdCtrls, ExtCtrls, Grids, Wwdbigrd,
  Wwdbgrid, fcLabel;

type
  TFBuscaAsociado = class(TForm)
    pnlCarta: TPanel;
    Label1: TLabel;
    edtAsociado: TEdit;
    sbtnAceptar: TfcShapeBtn;
    Panel1: TPanel;
    dbgAsociado: TwwDBGrid;
    sbtnSalir: TfcShapeBtn;
    fcLabel1: TfcLabel;
    procedure sbtnAceptarClick(Sender: TObject);
    procedure sbtnSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgAsociadoDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBuscaAsociado: TFBuscaAsociado;

implementation

uses  PREDM; //PRE204,

{$R *.DFM}

procedure TFBuscaAsociado.sbtnAceptarClick(Sender: TObject);
var
   xSQL : String;
begin
   xSQL := 'Select ASOID, ASOAPEPAT, ASOAPEMAT, ASONOMBRES,'
          +' ASOAPENOM, ASOCODMOD, ASOSEXO From APO201'
          +' Where ASOAPENOM LIKE '+QuotedStr(Trim(edtAsociado.Text+'%'))
          +' And ASOTIPID ='+QuotedStr('DO');

   DM1.cdsAsociado.Filter   := '';
   DM1.cdsAsociado.Filtered := False;
   DM1.cdsAsociado.IndexFieldNames := '';
   DM1.cdsAsociado.Close;
   DM1.cdsAsociado.DataRequest(xSQL);
   DM1.cdsAsociado.Open;

   dbgAsociado.Selected.Clear;
   dbgAsociado.Selected.Add('ASOID'#9'12'#9'Id~Asociado'#9'T');
   dbgAsociado.Selected.Add('ASOAPEPAT'#9'20'#9'Apellido~Paterno'#9'T');
   dbgAsociado.Selected.Add('ASOAPEMAT'#9'20'#9'Apellido~Materno'#9'T');
   dbgAsociado.Selected.Add('ASONOMBRES'#9'20'#9'Nombres'#9'T');
   dbgAsociado.Selected.Add('ASOCODMOD'#9'12'#9'Código~Modular'#9'T');
   dbgAsociado.Selected.Add('ASOSEXO'#9'1'#9'Sexo'#9'T');
   dbgAsociado.ApplySelected;
   Beep;
   MessageDlg(IntToStr(DM1.cdsAsociado.RecordCount)+' Registros Encontrados', mtInformation, [mbOk], 0);
   DM1.cdsAsociado.First;
end;

procedure TFBuscaAsociado.sbtnSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TFBuscaAsociado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DM1.cdsAsociado.Close;
end;

{
procedure TFBuscaAsociado.dbgAsociadoDblClick(Sender: TObject);
var
  xWhere : String;
  xEstAso, xTipAso : String;
begin
  xWhere := 'ASOID ='+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString);
  xEstAso := DM1.DisplayDescrip('prvSQL', 'APO201', 'ASOID, ASOSITID', xWhere, 'ASOSITID');
  xTipAso := DM1.DisplayDescrip('prvSQL', 'APO201', 'ASOID, ASOTIPID', xWhere, 'ASOTIPID');
  If (xEstAso = 'AC') And (xTipAso <> 'DO') Then
  begin
    Beep;
    MessageDlg('El Asociado NO es DOCENTE', mtInformation, [mbOk], 0);
    Exit;
  end
  Else
  begin
    If (xEstAso <> 'AC') And (xTipAso = 'DO') Then
    begin
      Beep;
      MessageDlg('El Asociado NO se encuentra ACTIVO', mtInformation, [mbOk], 0);
      Exit;
    end
  Else
  begin
    If (xEstAso <> 'AC') And (xTipAso <> 'DO') Then
    begin
      Beep;
      MessageDlg('El Asociado NO se encuentra ACTIVO y NO es DOCENTE', mtInformation, [mbOk], 0);
      Exit;
    end
    Else
    begin
      DM1.cdsMaestCartas.Edit;
      DM1.cdsMaestCartas.FieldByName('DSGNOMBRT').AsString := DM1.cdsAsociado.FieldByName('ASOAPENOM').AsString;
      DM1.cdsMaestCartas.FieldByName('ASOID').AsString     := DM1.cdsAsociado.FieldByName('ASOID').AsString;
      FCartaDesignacion.LlenaDatos(DM1.cdsAsociado.FieldByName('ASOID').AsString);
      Close;
    end;
  end;
 end;
end;
}

{
procedure TFBuscaAsociado.FormActivate(Sender: TObject);
var
   xSQL : String;
begin
   Screen.Cursor := crHourGlass;
   xSQL := 'Select ASOID, ASOAPEPAT, ASOAPEMAT, ASONOMBRES, ASODNI,'
          +' ASOAPENOM, ASOCODMOD, ASOSEXO, ASOTIPID, ASOSITID From APO201'
          +' Where ASOAPENOM LIKE '+QuotedStr(Trim(FCartaDesignacion.dbeApeNom.Text+'%'));
   DM1.cdsAsociado.Filter   := '';
   DM1.cdsAsociado.Filtered := False;
   DM1.cdsAsociado.Close;
   DM1.cdsAsociado.DataRequest(xSQL);
   DM1.cdsAsociado.Open;
   dbgAsociado.Selected.Clear;
   dbgAsociado.Selected.Add('ASOID'#9'12'#9'Id~Asociado'#9'T');
   dbgAsociado.Selected.Add('ASOAPEPAT'#9'20'#9'Apellido~Paterno'#9'T');
   dbgAsociado.Selected.Add('ASOAPEMAT'#9'20'#9'Apellido~Materno'#9'T');
   dbgAsociado.Selected.Add('ASONOMBRES'#9'20'#9'Nombres'#9'T');
   dbgAsociado.Selected.Add('ASOCODMOD'#9'12'#9'Código~Modular'#9'T');
   dbgAsociado.Selected.Add('ASODNI'#9'10'#9'DNI/LE'#9'T');
   dbgAsociado.Selected.Add('ASOSEXO'#9'1'#9'Sexo'#9'T');
   dbgAsociado.Selected.Add('ASOTIPID'#9'5'#9'Tipo~Asociado'#9'T');
   dbgAsociado.Selected.Add('ASOSITID'#9'5'#9'Situación~Asociado'#9'T');
   dbgAsociado.ApplySelected;
   DM1.cdsAsociado.First;
   Beep;
   MessageDlg(IntToStr(DM1.cdsAsociado.RecordCount)+' Registros Encontrados', mtInformation, [mbOk], 0);
   Screen.Cursor := crDefault;
end;
}

end.
