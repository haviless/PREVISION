unit PRE570;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppCtrls, ppBands, jpeg, ppVar, ppPrnabl, ppClass, ppCache, ppComm,
  ppTypes, ppRelatv, ppProd, ppReport, wwdbdatetimepicker, StdCtrls, Wwdotdot,
  ExtCtrls, Mask, wwdbedit, wwdblook, Wwdbdlg, fcButton, fcImgBtn,
  fcShapeBtn, ppViewr;

type
  TFRepLibAhorro = class(TForm)
    pnl112: TPanel;
    bbtnCancelar: TfcShapeBtn;
    bbtnImprimir: TfcShapeBtn;
    panel113: TPanel;
    dblcdUProc: TwwDBLookupComboDlg;
    dblcdUSE: TwwDBLookupComboDlg;
    dbeDescUProc: TwwDBEdit;
    dbeDescUSE: TwwDBEdit;
    dblcdProv: TwwDBLookupComboDlg;
    RadioGroup1: TRadioGroup;
    dblcdDpto: TwwDBLookupComboDlg;
    dbeDescProv: TwwDBEdit;
    dbeDescDpto: TwwDBEdit;
    dblcdCodAso: TwwDBComboDlg;
    dbeApePat: TwwDBEdit;
    dbeApeMat: TwwDBEdit;
    dbeNombre: TwwDBEdit;
    GroupBox1: TGroupBox;
    dbdtpDesde: TwwDBDateTimePicker;
    dbdtpHasta: TwwDBDateTimePicker;
    ppRepLibAhorro: TppReport;
    ppTitleBand1: TppTitleBand;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppLabel12: TppLabel;
    ppLabel14: TppLabel;
    ppImage1: TppImage;
    ppLabel26: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLabel11: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLabel31: TppLabel;
    ppDBText8: TppDBText;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppLine4: TppLine;
    ppLabel36: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLabel2: TppLabel;
    ppLabel9: TppLabel;
    ppLine5: TppLine;
    ppLine6: TppLine;
    procedure bbtnImprimirClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure ppRepLibAhorroPreviewFormCreate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblcdUProcExit(Sender: TObject);
    procedure dblcdDptoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRepLibAhorro: TFRepLibAhorro;

implementation

uses PREDM;

{$R *.DFM}

procedure TFRepLibAhorro.bbtnImprimirClick(Sender: TObject);
begin
   ppRepLibAhorro.Print;
end;

procedure TFRepLibAhorro.bbtnCancelarClick(Sender: TObject);
begin
   Close;
end;

procedure TFRepLibAhorro.ppRepLibAhorroPreviewFormCreate(Sender: TObject);
begin
   TppReport(Sender).PreviewForm.WindowState := WsMaximized;
   TppViewer(TppReport(Sender).PreviewForm.Viewer).ZoomSetting := zsPageWidth;
end;

procedure TFRepLibAhorro.FormCreate(Sender: TObject);
var
   Present : TDate;
begin
   Present := Date;
   dbdtpHasta.Date := Present;
end;

procedure TFRepLibAhorro.dblcdUProcExit(Sender: TObject);
var
   xWhere : String;
begin
   xWhere := 'UPROID ='+QuotedStr(dblcdUProc.Text);
   dbeDescUProc.Text := DM1.DisplayDescrip('prvSQL', 'APO102', 'UPRONOM', xWhere, 'UPRONOM');
end;

procedure TFRepLibAhorro.dblcdDptoExit(Sender: TObject);
var
   xWhere : String;
begin
   xWhere := 'DPTOID ='+QuotedStr(dblcdDpto.Text);
   dbeDescDpto.Text := DM1.DisplayDescrip('prvSQL', 'APO158', 'DPTODES', xWhere, 'DPTODES');
end;

end.
