// Inicio Uso Estándares: 01/08/2011
// Unidad : Previsión Social
// Formulario : FrmAgregaCausaCese
// Fecha de Creación : 03/12/2015
// Autor : Juver De la Cruz
// Objetivo : Agregar Causa de Cese
// Actualizaciones:
// HPC_201509_PRE : Categorizar Causas de Cese

unit PRE215a;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFrmMantCausaCese = class(TForm)
    Panel1: TPanel;
    btnGrabar: TBitBtn;
    btnSalir: TBitBtn;
    edtCausaCese: TEdit;
    Label1: TLabel;
    procedure btnSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGrabarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    xsTIPBENEF : String;
    xsCODCAUCES : STRING;
  end;

var
  FrmMantCausaCese: TFrmMantCausaCese;

implementation

uses PREDM;

{$R *.dfm}
(******************************************************************************)
procedure TFrmMantCausaCese.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

(******************************************************************************)
procedure TFrmMantCausaCese.btnSalirClick(Sender: TObject);
begin
  self.ModalResult := mrCancel;
end;

(******************************************************************************)
procedure TFrmMantCausaCese.btnGrabarClick(Sender: TObject);
var xsSQL : String;
begin
  if trim(edtCausaCese.Text) = '' then begin
    MessageDlg(AnsiUpperCase('Ingrese una causa de cese'), mtInformation, [mbOk], 0);
    exit;
  end;

  if xsCODCAUCES = '0' then begin
    try
      xsSQL :=
            ' BEGIN '
          + '    INSERT INTO PRE_CAUSA_CESE_CAB (TIPBENEF, CODCAUCES, DESCAUCES) '
          + '      SELECT ' + QuotedStr(xsTIPBENEF) + ', LPAD(NVL(MAX(CODCAUCES) ,0) + 1 ,4 ,''0''), ' + QuotedStr(edtCausaCese.Text)
          + '        FROM PRE_CAUSA_CESE_CAB '
          + '       WHERE TIPBENEF = ' + QuotedStr(xsTIPBENEF) + '; '
          + '      COMMIT; '
          + ' EXCEPTION '
          + '     WHEN OTHERS THEN BEGIN '
          + '        ROLLBACK; '
          + '        RAISE_APPLICATION_ERROR(-20000, ''~COMPRUEBE QUE EL REGISTRO NO EXISTE!~''); '
          + '     END; '
          + ' END;';
      DM1.DCOM1.AppServer.EjecutaSQL(xsSQL);
      self.ModalResult := mrOk;
    except
      on e : exception do
        begin
          MessageDlg(AnsiUpperCase(DM1.FG_OBTIENE_MENSAJE_ERROR_ORACLE(e.Message)), mtInformation, [mbOk], 0);
          exit;
        end;
    end;
  end else begin
    try
      xsSQL :=
            ' BEGIN '
          + '    UPDATE PRE_CAUSA_CESE_CAB '
          + '       SET DESCAUCES = ' + QuotedStr(edtCausaCese.Text)
          + '     WHERE TIPBENEF  = ' + QuotedStr(xsTIPBENEF)
          + '       AND CODCAUCES = ' + QuotedStr(xsCODCAUCES) + ';'
          + '      COMMIT; '
          + ' EXCEPTION '
          + '     WHEN OTHERS THEN BEGIN '
          + '        ROLLBACK; '
          + '        RAISE_APPLICATION_ERROR(-20000, ''~COMPRUEBE QUE EL REGISTRO NO EXISTE!~''); '
          + '     END; '
          + ' END;';
      DM1.DCOM1.AppServer.EjecutaSQL(xsSQL);
      self.ModalResult := mrOk;
    except
      on e : exception do
        begin
          MessageDlg(AnsiUpperCase(DM1.FG_OBTIENE_MENSAJE_ERROR_ORACLE(e.Message)), mtInformation, [mbOk], 0);
          exit;
        end;
    end;
  end;

end;

(******************************************************************************)

end.
