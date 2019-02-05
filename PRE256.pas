unit PRE256;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Mask, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid;

type
  TFFamiliares = class(TForm)
    gbdatoasociadio: TGroupBox;
    Label1: TLabel;
    pnlasocodmod: TPanel;
    meAsocodmod: TMaskEdit;
    sbBuscar: TSpeedButton;
    Label7: TLabel;
    Panel2: TPanel;
    meAsoDocNum: TMaskEdit;
    Label3: TLabel;
    Panel1: TPanel;
    meAsoApeNomDni: TMaskEdit;
    Label4: TLabel;
    Panel3: TPanel;
    meUsenom: TMaskEdit;
    meUseid: TMaskEdit;
    Label5: TLabel;
    Panel4: TPanel;
    meUpagonom: TMaskEdit;
    meUpagoid: TMaskEdit;
    Label6: TLabel;
    Panel5: TPanel;
    meUpronom: TMaskEdit;
    meUproid: TMaskEdit;
    btncerrar: TBitBtn;
    wwDBGrid2: TwwDBGrid;
    wwDBGrid2IButton: TwwIButton;
    procedure FormActivate(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
  private
    procedure llenaasociados;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFamiliares: TFFamiliares;

implementation

uses PREDM;

{$R *.dfm}

procedure TFFamiliares.FormActivate(Sender: TObject);
begin
  If DM1.xCnd = 'E' Then
  Begin
    pnlasocodmod.Enabled := False;
    sbBuscar.Enabled := False;
    llenaasociados;
  End;
end;

procedure TFFamiliares.llenaasociados;
Var xSql:String;
begin
  meAsocodmod.Text    := DM1.cdsAsociado.FieldByName('ASOID').AsString;
  meAsoApeNomDni.Text := DM1.cdsAsociado.FieldByname('ASOAPENOMDNI').AsString;
  meUseid.Text        := DM1.cdsAsociado.FieldByName('USEID').AsString;
  meUpagoid.Text      := DM1.cdsAsociado.FieldByName('UPAGOID').AsString;
  meUproid.Text       := DM1.cdsAsociado.FieldByName('UPROID').AsString;
  If DM1.cdsAsociado.FieldByName('ASODNI').AsString = '' Then
  Begin
    xSql := 'SELECT TIPDOCABR FROM TGE159 WHERE TIPDOCCOD = '+QuotedStr(DM1.cdsAsociado.FieldByName('TIPDOCCOD').AsString);
    DM1.cdsQry.Close;
    DM1.cdsQry.DataRequest(xSql);
    DM1.cdsQry.Open;
    meAsoDocNum.Text :=  DM1.cdsQry.FieldByName('TIPDOCABR').AsString+'-'+DM1.cdsAsociado.FieldByName('ASODOCNUM').AsString;
  End
  Else
  Begin
    xSql := 'SELECT TIPDOCABR FROM TGE159 WHERE TIPDOCCOD = '+QuotedStr('10');
    DM1.cdsQry.Close;
    DM1.cdsQry.DataRequest(xSql);
    DM1.cdsQry.Open;
    meAsoDocNum.Text :=  DM1.cdsQry.FieldByName('TIPDOCABR').AsString+'-'+DM1.cdsAsociado.FieldByName('ASODNI').AsString;
  End;
    xSql := 'SELECT USENOM FROM APO101 WHERE USEID = '+QuotedStr(DM1.cdsAsociado.FieldByName('USEID').AsString)+' AND UPAGOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString)+' AND UPROID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  meUsenom.Text   := DM1.cdsQry.FieldByName('USENOM').AsString;
  xSql := 'SELECT UPAGONOM FROM APO103 WHERE UPAGOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPAGOID').AsString)+' AND UPROID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  meUpagonom.Text  := DM1.cdsQry.FieldByName('UPAGONOM').AsString;
  xSql := 'SELECT UPRONOM FROM APO102 WHERE UPROID = '+QuotedStr(DM1.cdsAsociado.FieldByName('UPROID').AsString);
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSql);
  DM1.cdsQry.Open;
  meUpronom.Text  := DM1.cdsQry.FieldByName('UPRONOM').AsString;
  xSql := 'SELECT * FROM APO203 WHERE ASOID = '+QuotedStr(DM1.asoid);
  DM1.cdsDFam.Close;
  DM1.cdsDFam.DataRequest(xSql);
  DM1.cdsDFam.Open;
end;

procedure TFFamiliares.btncerrarClick(Sender: TObject);
begin
  FFamiliares.Close;
end;

end.
