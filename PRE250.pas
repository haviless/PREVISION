unit PRE250;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, fcButton, fcImgBtn, fcShapeBtn;

type
  TFToolCarta = class(TForm)
    pnlCarta: TPanel;
    Label1: TLabel;
    edtAsociado: TEdit;
    sbtnAceptar: TfcShapeBtn;
    procedure sbtnAceptarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FToolCarta: TFToolCarta;

implementation

uses PREDM, PRE001;

{$R *.DFM}

{
procedure TFToolCarta.sbtnAceptarClick(Sender: TObject);
var
  xSQL: String;
begin
   Screen.Cursor := crHourGlass;
   If Length(Trim(edtAsociado.Text)) > 0 Then
    begin
     xSQL := 'Select A.CIAID, A.ASOID, A.DSGNRO, A.DSGAPEPAT,'
            +' A.DSGAPEMAT, A.DSGNOMBR, A.DSGFREC,'
            +' A.DSGNOMBRT, B.ASOCODMOD, C.PVSESTDES'
            +' From APO201 B, PVS302 A, PVS102 C'
            +' Where A.ASOID = B.ASOID'
            +' And A.DSGNOMBRT LIKE '+QuotedStr(Trim(edtAsociado.Text+'%'))
            +' And A.DSGESTAD = C.PVSESTDSG And C.PVSDOC ='+QuotedStr('C');

     FPrincipal.MRefe.UsuarioSQL.Clear;
     FPrincipal.MRefe.FMant.wTabla := 'VWPRECARTADESIG';
     FPrincipal.MRefe.UsuarioSQL.Add(xSQL);
     FPrincipal.MRefe.NewQuery;

     If DM1.cdsSQL.RecordCount = 0 Then
      begin
       xSQL := 'Select A.CIAID, A.ASOID, A.DSGNRO, A.DSGAPEPAT,'
              +' A.DSGAPEMAT, A.DSGNOMBR, A.DSGFREC,'
              +' A.DSGNOMBRT, B.ASOCODMOD, C.PVSESTDES'
              +' From APO201 B, PVS302 A, PVS102 C'
              +' Where A.ASOID = B.ASOID'
              +' And A.DSGESTAD = C.PVSESTDSG And C.PVSDOC ='+QuotedStr('C');

       FPrincipal.MRefe.UsuarioSQL.Clear;
       FPrincipal.MRefe.FMant.wTabla := 'VWPRECARTADESIG';
       FPrincipal.MRefe.UsuarioSQL.Add(xSQL);
       FPrincipal.MRefe.NewQuery;
       edtAsociado.Clear;
       edtAsociado.SetFocus;
       Beep;
       MessageDlg('No Existen Registros que Cumplan la Condición ', mtInformation, [mbOk], 0);
      end;
    end
   Else
    begin
     xSQL := 'Select A.CIAID, A.ASOID, A.DSGNRO, A.DSGAPEPAT,'
            +' A.DSGAPEMAT, A.DSGNOMBR, A.DSGFREC,'
            +' A.DSGNOMBRT, B.ASOCODMOD, C.PVSESTDES'
            +' From APO201 B, PVS302 A, PVS102 C'
            +' Where A.ASOID = B.ASOID'
            +' And A.DSGESTAD = C.PVSESTDSG And C.PVSDOC ='+QuotedStr('C');

     FPrincipal.MRefe.UsuarioSQL.Clear;
     FPrincipal.MRefe.FMant.wTabla := 'VWPRECARTADESIG';
     FPrincipal.MRefe.UsuarioSQL.Add(xSQL);
     FPrincipal.MRefe.NewQuery;
    end;
   Screen.Cursor := crDefault;
end;
}

end.
