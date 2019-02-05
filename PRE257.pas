unit PRE257;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fcButton, fcImgBtn, fcShapeBtn, Wwdbdlg, StdCtrls, Mask,
  wwdbedit, wwdbdatetimepicker, wwdblook, ExtCtrls;

type
  TFmanfam = class(TForm)
    Panel1: TPanel;
    meAsoApeNomDni: TMaskEdit;
    lblforpag: TLabel;
    dblcforpag: TwwDBLookupCombo;
    pnlforpag: TPanel;
    meforpagodes: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    MaskEdit1: TMaskEdit;
    Label5: TLabel;
    Panel3: TPanel;
    MaskEdit2: TMaskEdit;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    GroupBox1: TGroupBox;
    Label15: TLabel;
    Label24: TLabel;
    Label13: TLabel;
    Label4: TLabel;
    dblcBanco: TwwDBLookupCombo;
    dbeBanco: TwwDBEdit;
    dblcFPago: TwwDBLookupCombo;
    dbeFPago: TwwDBEdit;
    dblcdLugGiro: TwwDBLookupComboDlg;
    dbeLugGiro: TwwDBEdit;
    dblcdDptoBco: TwwDBLookupComboDlg;
    dbeDptoBco: TwwDBEdit;
    gbDatosTutor: TGroupBox;
    dbeApeNomT: TwwDBEdit;
    dblcTipDocT: TwwDBLookupCombo;
    dbeDescTipDocT: TwwDBEdit;
    dbeNumDocT: TwwDBEdit;
    dbdtpfacinv: TwwDBDateTimePicker;
    wwDBLookupCombo1: TwwDBLookupCombo;
    Panel4: TPanel;
    MaskEdit3: TMaskEdit;
    Label16: TLabel;
    wwDBLookupCombo2: TwwDBLookupCombo;
    Panel5: TPanel;
    MaskEdit4: TMaskEdit;
    wwDBLookupCombo3: TwwDBLookupCombo;
    Panel6: TPanel;
    MaskEdit5: TMaskEdit;
    Panel7: TPanel;
    MaskEdit6: TMaskEdit;
    Panel8: TPanel;
    MaskEdit7: TMaskEdit;
    Panel9: TPanel;
    MaskEdit8: TMaskEdit;
    Panel10: TPanel;
    MaskEdit9: TMaskEdit;
    wwDBLookupComboDlg1: TwwDBLookupComboDlg;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fmanfam: TFmanfam;

implementation

{$R *.dfm}

end.
