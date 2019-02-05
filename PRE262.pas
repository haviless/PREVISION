unit PRE262;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, fcButton, fcImgBtn, fcShapeBtn, StdCtrls,
  ExtCtrls, fcLabel;

type
  TFBuscarAsocRetJud = class(TForm)
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
  FBuscarAsocRetJud: TFBuscarAsocRetJud;

implementation

uses  PREDM; //PRE202,

{$R *.DFM}

{
procedure TFBuscarAsocRetJud.sbtnAceptarClick(Sender: TObject);
var
   xSQL : String;
begin
   Screen.Cursor := crHourGlass;
   xSQL := 'Select ASOID, ASOAPEPAT, ASOAPEMAT, ASONOMBRES,'
          +' ASOAPENOM, ASOCODMOD, ASOSEXO, ASOSITID, ASOTIPID From APO201'
          +' Where ASOAPENOM LIKE '+QuotedStr(Trim(edtAsociado.Text+'%'))
          +' And CIAID ='+QuotedStr(FRetencionesJudiciales.dblcCia.Text);

   DM1.cdsAsociado.Filter   := '';
   DM1.cdsAsociado.Filtered := False;
   DM1.cdsAsociado.IndexFieldNames := '';
   DM1.cdsAsociado.Close;
   DM1.cdsAsociado.DataRequest(xSQL);
   DM1.cdsAsociado.Open;
   DM1.cdsAsociado.IndexFieldNames := 'ASOAPEPAT; ASOAPEMAT; ASONOMBRES';

   dbgAsociado.Selected.Clear;
   dbgAsociado.Selected.Add('ASOID'#9'12'#9'Id~Asociado'#9'T');
   dbgAsociado.Selected.Add('ASOAPEPAT'#9'20'#9'Apellido~Paterno'#9'T');
   dbgAsociado.Selected.Add('ASOAPEMAT'#9'20'#9'Apellido~Materno'#9'T');
   dbgAsociado.Selected.Add('ASONOMBRES'#9'20'#9'Nombres'#9'T');
   dbgAsociado.Selected.Add('ASOCODMOD'#9'12'#9'Código~Modular'#9'T');
   dbgAsociado.Selected.Add('ASOSEXO'#9'1'#9'Sexo'#9'T');
   dbgAsociado.Selected.Add('ASOTIPID'#9'5'#9'Tipo~Asociado'#9'T');
   dbgAsociado.Selected.Add('ASOSITID'#9'5'#9'Situación~Asociado'#9'T');
   dbgAsociado.ApplySelected;
   Beep;
   If DM1.cdsAsociado.RecordCount = 0 Then
    begin
     MessageDlg('No Existen Asociados con el Nombre '+edtAsociado.Text, mtInformation, [mbOk], 0);
     edtAsociado.Clear;
     edtAsociado.SetFocus;
    end
   Else
    begin
     MessageDlg(IntToStr(DM1.cdsAsociado.RecordCount)+' Registros Encontrados', mtInformation, [mbOk], 0);
     DM1.cdsAsociado.First;
    end;
   Screen.Cursor := crDefault;
end;
}

procedure TFBuscarAsocRetJud.sbtnSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TFBuscarAsocRetJud.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DM1.cdsAsociado.Close;
end;

procedure TFBuscarAsocRetJud.dbgAsociadoDblClick(Sender: TObject);
var
   xWhere : String;
begin
   xWhere := 'ASOID ='+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)
            +' And ASOTIPID ='+QuotedStr('DO')
            +' And ASOSITID ='+QuotedStr('AC');

   If Length(DM1.DisplayDescrip('prvSQL', 'APO201', 'ASOID, ASOAPENOM', xWhere, 'ASOID')) = 0 Then
    begin
     Beep;
     MessageDlg('El Asociado No es Docente o No está Activo', mtInformation, [mbOk], 0);
     dbgAsociado.SetFocus;
     Exit;
    end
   Else
    begin
     DM1.cdsMaestRetJud.Edit;
     DM1.cdsMaestRetJud.FieldByName('ASOID').AsString     := DM1.cdsAsociado.FieldByName('ASOID').AsString;
     DM1.cdsMaestRetJud.FieldByName('RTJNOMBRT').AsString := DM1.cdsAsociado.FieldByName('ASOAPENOM').AsString;
     FRetencionesJudiciales.LlenaDatos(DM1.cdsAsociado.FieldByName('ASOID').AsString);
//     FRetencionesJudiciales.dbeCodAsociadoExit(Sender);
//     FRetencionesJudiciales.LlenaCampos;
//     DM1.cdsMaestRetJud.FieldByName('RTJNOMBRT').AsString := DM1.cdsAsociado.FieldByName('ASOAPENOM').AsString;
//     DM1.cdsMaestRetJud.FieldByName('RTJCODMOD').AsString := DM1.cdsAsociado.FieldByName('ASOCODMOD').AsString;
     Close;
    end;
end;

procedure TFBuscarAsocRetJud.FormActivate(Sender: TObject);
var
   xSQL : String;
begin
   Screen.Cursor := crHourGlass;
   xSQL := 'Select ASOID, ASOAPEPAT, ASOAPEMAT, ASONOMBRES, ASODNI,'
          +' ASOAPENOM, ASOCODMOD, ASOSEXO, ASOTIPID, ASOSITID From APO201'
          +' Where ASOAPENOM LIKE '+QuotedStr(Trim(FRetencionesJudiciales.dbeApeNom.Text+'%'));

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
   If DM1.cdsAsociado.RecordCount = 0 Then
    begin
     MessageDlg('No Existen Asociados con el Nombre '+edtAsociado.Text, mtInformation, [mbOk], 0);
     edtAsociado.Clear;
     edtAsociado.SetFocus;
    end
   Else
    begin
     MessageDlg(IntToStr(DM1.cdsAsociado.RecordCount)+' Registros Encontrados', mtInformation, [mbOk], 0);
    end;
   Screen.Cursor := crDefault;
end;

end.
