unit PRE254;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons;

type
  TFModdeudos = class(TForm)
    dbgdeudos: TwwDBGrid;
    btncerrar: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure dbgdeudosDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FModdeudos: TFModdeudos;

implementation

uses PREDM, PRE255;

{$R *.dfm}

procedure TFModdeudos.FormActivate(Sender: TObject);
Var xSql:String;
begin
  FModdeudos.Top := 185;
  FModdeudos.Left := 89;
  dbgdeudos.Selected.Clear;
  dbgdeudos.Selected.Add('PVSNOMBRE'#9'35'#9'Apellido y nombre(s)~del beneficiario'#9);
  dbgdeudos.Selected.Add('PVSLDNIBEN'#9'8'#9'D.N.I.'#9);
  dbgdeudos.Selected.Add('BANCONOM'#9'18'#9'Nombre del~banco'#9);
  dbgdeudos.Selected.Add('TIPDESEDES'#9'18'#9'Tipo de~desembolso'#9);
  dbgdeudos.Selected.Add('AGENBCODES'#9'18'#9'Nombre de~la agencia'#9);
  dbgdeudos.ApplySelected;
  xSql := 'SELECT A.PVSNOMBRE, A.PVSLDNIBEN, A.PVSLMONTO, A.PVSLNVOU, B.BANCONOM, A.PVSLNOFC, A.NROCHEQUE,'
  +' C.TIPDESEDES, D.AGENBCODES, A.FORPAGOID, A.BANCOID, A.AGENBCOID, A.PVSLNCTA,'
  +' A.PORDES, A.PVSLNVOU, A.CODRELCOB, A.APEPATTUT, A.APEMATTUT, A.NOMTUT, APEPATCOB,'
  +' APEMATCOB, NOMCOB, DOCIDETUT FROM PVS307 A, TGE105 B, CRE104 C, COB102 D'
  +' WHERE PVSLBENNR = '+QuotedStr(DM1.numeroLiquidacion)+' AND PVSLAGRID = ''FPG'' AND FLGVOUCHER = ''N'' AND A.BANCOID = B.BANCOID(+) AND A.FORPAGOID = C.TIPDESEID(+)'
  +' AND A.AGENBCOID = D.AGENBCOID(+) AND (A.PVSLNOFC IS NULL AND A.NROCHEQUE IS NULL)';
  DM1.cdsDFam.Close;
  DM1.cdsDFam.DataRequest(xSql);
  DM1.cdsDFam.Open;
  If DM1.cdsDFam.RecordCount = 0 Then
    MessageDlg(' No se han encontrado deudos a modificar ', mtCustom, [mbOk], 0);
end;

procedure TFModdeudos.btncerrarClick(Sender: TObject);
begin
  FModdeudos.Close;
end;

procedure TFModdeudos.dbgdeudosDblClick(Sender: TObject);
begin
  If DM1.cdsDFam.RecordCount > 0 Then
  Begin
    Try
      Fmodforpagdeu := TFmodforpagdeu.Create(Self);
      Fmodforpagdeu.ShowModal;
    Finally
      Fmodforpagdeu.Free;
    End;
  End;
end;

procedure TFModdeudos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
