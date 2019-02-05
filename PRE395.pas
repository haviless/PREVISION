unit PRE395;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, wwdbedit, Buttons, fcLabel, Grids, DBGrids,
  ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, fcButton, fcImgBtn, fcShapeBtn,
  Wwdbigrd, Wwdbgrid;

type
  TFLiqAnteriores = class(TForm)
    GroupBox1: TGroupBox;
    lblCodigo: TfcLabel;
    dbeAsoApeNom: TwwDBEdit;
    ppRepLiqAnt: TppReport;
    ppTipLiq: TppLabel;
    ppFecLiq: TppLabel;
    ppNumLiq: TppLabel;
    ppLabel1: TppLabel;
    ppApeNom: TppLabel;
    ppDni: TppLabel;
    ppLine2: TppLine;
    ppLabel2: TppLabel;
    ppFecNom: TppLabel;
    ppFecCes: TppLabel;
    ppNumRes: TppLabel;
    ppNumCes: TppLabel;
    ppLine3: TppLine;
    ppLabel6: TppLabel;
    wwDBGrid1: TwwDBGrid;
    btnbuscar: TBitBtn;
    btnimprimir: TBitBtn;
    btncerrar: TBitBtn;
    procedure btnBuscarClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnimprimirClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLiqAnteriores: TFLiqAnteriores;

implementation

uses PREDM;

{$R *.dfm}

procedure TFLiqAnteriores.btnBuscarClick(Sender: TObject);
Var xSQL:String;
begin
   xSQL := 'SELECT A.COD_USE, B.USEABRE, A.ANO, A.NUM_EXP, A.FEC_EXP, A.NOM_GEN, A.LIB_ELE,A.BENEFIC, A.MON_PAG, A.COD_BEN, '
          +' A.FEC_NOM, A.FEC_CES, A.NUM_RES, A.NUM_CES'
          +' FROM PVS314 A, APO101 B'
          +' WHERE NOM_GEN LIKE '+QuotedStr(dbeAsoApeNom.Text+'%')
          +' AND A.COD_USE = B.USEID(+)';
   DM1.cdsQry2.Filter   := '';
   DM1.cdsQry2.Filtered := False;
   DM1.cdsQry2.IndexFieldNames := '';
   DM1.cdsQry2.Close;
   DM1.cdsQry2.DataRequest(xSQL);
   DM1.cdsQry2.Open;
end;

procedure TFLiqAnteriores.btnSalirClick(Sender: TObject);
begin
FLiqAnteriores.Close;
end;

procedure TFLiqAnteriores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
DM1.cdsQry2.Close;
end;

Procedure TFLiqAnteriores.btnimprimirClick(Sender: TObject);
Begin
  ppNumLiq.Caption := 'LIQUIDACION DE BENEFICIO Nº '+DM1.cdsQry2.FieldByName('NUM_EXP').AsString;
  ppFecLiq.Caption := 'FECHA : '+DM1.cdsQry2.FieldByName('FEC_EXP').AsString;
  Case DM1.cdsQry2.FieldByName('COD_BEN').AsInteger  Of
    1: ppTipLiq.Caption := 'POR : RETIRO';
    2: ppTipLiq.Caption := 'POR : INVALIDEZ';
    3: ppTipLiq.Caption := 'POR : SEPELIO';
    4: ppTipLiq.Caption := 'POR : CAPITAL DE DEUDOS';
    5: ppTipLiq.Caption := 'POR : FALLECIMIENTO';
    6: ppTipLiq.Caption := 'POR : FALLECIMIENTO';
  Else
    ppTipLiq.Caption := 'POR : TIPO NO ESPECIFICADO';
  End;
  ppApeNom.Caption  := 'PROFESOR(A) : '+DM1.cdsQry2.FieldByName('NOM_GEN').AsString;
  ppDni.Caption     := 'D.N.I. : '+DM1.cdsQry2.FieldByName('LIB_ELE').AsString;
  ppFecNom.Caption  := 'FECHA DE NOMBRAMIENTO : '+DM1.cdsQry2.FieldByName('FEC_NOM').AsString;
  ppFecCes.Caption  := 'FECHA DE CESE         : '+DM1.cdsQry2.FieldByName('FEC_CES').AsString;
  ppNumRes.Caption  := 'RESOLUCION : '+DM1.cdsQry2.FieldByName('NUM_RES').AsString;
  ppNumCes.Caption  := 'RESOLUCION : '+DM1.cdsQry2.FieldByName('NUM_CES').AsString;
  ppRepLiqAnt.Print;
  ppRepLiqAnt.Stop;
End;

procedure TFLiqAnteriores.btncerrarClick(Sender: TObject);
begin
  FLiqAnteriores.Close;
end;

end.
