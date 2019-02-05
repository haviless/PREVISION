unit PRE281;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, wwdbdatetimepicker, StdCtrls, Mask, Buttons, ExtCtrls, wwdblook,
  Wwdbdlg;

type
  TFManuit = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    meMonuit: TMaskEdit;
    dbdtpfecfin: TwwDBDateTimePicker;
    dbdtpfecini: TwwDBDateTimePicker;
    dblcdTipBen: TwwDBLookupComboDlg;
    meanopro: TMaskEdit;
    Panel1: TPanel;
    metipbendes: TMaskEdit;
    meveces: TMaskEdit;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure dblcdTipBenChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure meanoproExit(Sender: TObject);
    procedure mevecesExit(Sender: TObject);
    procedure meMonuitExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FManuit: TFManuit;

implementation
uses PREDM;

{$R *.dfm}

Procedure TFManuit.FormActivate(Sender: TObject);
Var xSql:String;
Begin
  xSql := 'SELECT TB, BENEFABR FROM TGE186 WHERE TIPBENEF IN (''02'', ''03'')';
  DM1.cdsTipBenef.Close;
  DM1.cdsTipBenef.DataRequest(xSql);
  DM1.cdsTipBenef.Open;

  dblcdTipBen.Selected.Clear;
  dblcdTipBen.Selected.Add('TB'#9'1'#9'Código'#9#9);
  dblcdTipBen.Selected.Add('BENEFABR'#9'15'#9'Descripción'#9#9);
  meanopro.SetFocus;
  
End;



procedure TFManuit.BitBtn2Click(Sender: TObject);
begin
  FManuit.Close;
end;

Procedure TFManuit.dblcdTipBenChange(Sender: TObject);
Begin
  If dblcdTipBen.Text = '' Then metipbendes.Text := '';
  If Length(dblcdTipBen.Text) = 1 Then
  Begin
    If DM1.cdsTipBenef.Locate('TB', dblcdTipBen.Text, []) Then
    Begin
      metipbendes.Text := DM1.cdsTipBenef.FieldByName('BENEFABR').AsString;
    End
    Else
    Begin
      MessageDlg('Código no Valido', mtInformation, [mbOk], 0);
      dblcdTipBen.Text := '';
      metipbendes.Text := '';
      dblcdTipBen.SetFocus;
    End;
  End;
End;

procedure TFManuit.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  begin
    Key := #0;
    Perform(CM_DIALOGKEY, VK_TAB, 0);
  end;
end;

Procedure TFManuit.BitBtn1Click(Sender: TObject);
Var xSql:String;
Begin
  xSql := 'INSERT INTO TGE188 (UITANO, UITFCINI, UITFCFIN, UITTIPBE, UITNUMER, UITMONTO)'
  +' VALUES('+QuotedStr(meanopro.Text)+','+QuotedStr(dbdtpfecini.Text)+','+QuotedStr(dbdtpfecfin.Text)
  +','+QuotedStr(dblcdTipBen.Text)+','+meveces.Text+','+meMonuit.Text+')';
  DM1.DCOM1.AppServer.EjecutaSql(xSql);
  MessageDlg('Grabación Ok', mtInformation, [mbOk], 0);
End;

procedure TFManuit.meanoproExit(Sender: TObject);
begin
 If Trim(meanopro.Text) <> '' Then
   If Not DM1.IsStrANumber(meanopro.Text) Then
   Begin
     MessageDlg('Número no Valido', mtError, [mbOK], 0);
     meanopro.Text := '';
     meanopro.SetFocus;
   End;
end;

procedure TFManuit.mevecesExit(Sender: TObject);
begin
 If Trim(meveces.Text) <> '' Then
   If Not DM1.IsStrANumber(meveces.Text) Then
   Begin
     MessageDlg('Número no Valido', mtError, [mbOK], 0);
     meveces.Text := '';
     meveces.SetFocus;
   End;
end;

procedure TFManuit.meMonuitExit(Sender: TObject);
begin
 If Trim(meMonuit.Text) <> '' Then
   If Not DM1.IsStrANumber(meMonuit.Text) Then
   Begin
     MessageDlg('Número no Valido', mtError, [mbOK], 0);
     meMonuit.Text := '';
     meMonuit.SetFocus;
   End;
end;

procedure TFManuit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM1.cdsTipBenef.Close;
  Action := caFree;
end;

end.
