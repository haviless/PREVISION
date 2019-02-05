unit PRE523;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppVar, ppCtrls, jpeg, ppPrnabl, ppClass, ppCache, ppComm,
  ppTypes, ppRelatv, ppProd, ppReport, fcButton, fcImgBtn, fcShapeBtn, Mask,
  wwdbedit, wwdblook, StdCtrls, wwdbdatetimepicker, ExtCtrls, ppStrtch,
  ppRegion, Wwdbdlg, ppViewr;

type
  TFRepExpObservados = class(TForm)
    ppRepExpObservados: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppImage2: TppImage;
    ppLabel18: TppLabel;
    ppLabel22: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLine14: TppLine;
    ppLine16: TppLine;
    ppLabel41: TppLabel;
    ppLine17: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLabel36: TppLabel;
    ppLabel46: TppLabel;
    ppLine15: TppLine;
    ppLine24: TppLine;
    ppLine27: TppLine;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel47: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLine8: TppLine;
    ppDetailBand2: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    Panel1: TPanel;
    zzzzz: TPanel;
    RadioGroup1: TRadioGroup;
    dbeOfDesc: TwwDBEdit;
    dbeDpto: TwwDBEdit;
    dbeRepres: TwwDBEdit;
    bbtnCancelar: TfcShapeBtn;
    bbtnAceptar: TfcShapeBtn;
    dblcdDpto: TwwDBLookupComboDlg;
    dblcdRepres: TwwDBLookupComboDlg;
    dblcdOfDesc: TwwDBLookupComboDlg;
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnAceptarClick(Sender: TObject);
    procedure ppRepExpObservadosPreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRepExpObservados: TFRepExpObservados;

implementation

{$R *.DFM}

procedure TFRepExpObservados.bbtnCancelarClick(Sender: TObject);
begin
   Close;
end;

procedure TFRepExpObservados.bbtnAceptarClick(Sender: TObject);
begin
   ppRepExpObservados.Print;
end;

procedure TFRepExpObservados.ppRepExpObservadosPreviewFormCreate(
  Sender: TObject);
begin
// , ppViewr
   TppReport(Sender).PreviewForm.WindowState := WsMaximized;
   TppViewer(TppReport(Sender).PreviewForm.Viewer).ZoomSetting := zsPageWidth;
end;

end.
