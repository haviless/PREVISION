// Inicio Uso Estándares   :	01/08/2011
// Unidad		               :	COB903B.pas
// Formulario		           :	fMotivoImpresion
// Fecha de Creación	     :	21/06/2016
// Autor			             :	Ricardo Medina
// Objetivo		             :  Guardar un Log del Motivo de La Impresión del Cronograma o Estado de Cuenta
// Actualizaciones:
// HPC_201606_PRE 	       : 21/06/2016  RMEDINA / Creación del formulario

//Inicio HPC_201606_PRE  Creación del formulario
unit COB903B;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, wwdblook, Buttons;

type
  TfMotivoImpresion = class(TForm)
    GroupBox1: TGroupBox;
    DBMOTIVO: TwwDBLookupCombo;
    edtMotivo: TEdit;
    btnGraba: TBitBtn;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnGrabaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBMOTIVOChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMotivoImpresion: TfMotivoImpresion;

implementation

uses PREDM;

{$R *.dfm}

procedure TfMotivoImpresion.FormCreate(Sender: TObject);
var xsql:String;
begin
  XSQL:='SELECT CODMOT,DESMOT FROM COB_MOT_IMP_CRO WHERE 1=1 ORDER BY CODMOT';
  DM1.cdsQry27.Close;
  DM1.cdsQry27.DataRequest(XSQL);
  DM1.cdsQry27.Open;
  DBMOTIVO.LookupTable := DM1.cdsQry27;
  DBMOTIVO.LookupField := 'DESMOT';
  DBMOTIVO.Selected.Add('CODMOT'#9'04'#9'Código'#9#9);
  DBMOTIVO.Selected.Add('DESMOT'#9'30'#9'Descripción'#9#9);
end;

procedure TfMotivoImpresion.btnGrabaClick(Sender: TObject);
Var xsql:String;
begin
    Dm1.xopc1 := 'S';
    If Length(Trim(DBMOTIVO.Text))=0 Then
    Begin
      ShowMessage('Debe Ingresar un Motivo de Impresión');
      exit;
    end;

    Xsql:='SELECT A.ASOID,B.ASODNI,B.ASOAPENOM,CREDID,NUM_CUOTAS,NVL(CUO_VEN,0)+NVL(TOT_PEN,0)+NVL(TOT_DIF,0) TOT_AHORA, TOT_NORMAL,'+
          ' TOT_NORMAL-(NVL(CUO_VEN,0)+NVL(TOT_PEN,0)+NVL(TOT_DIF,0)) INT_DEJ_PAGAR,CAP_PAG_CAN '+
          'FROM '+
          ' ( '+
          ' SELECT ASOID,CREDID, '+
          ' SUM(CASE WHEN (TO_CHAR(B.CREFVEN,''YYYYMM'')<=TO_CHAR(SYSDATE,''YYYYMM'')) AND (B.CREFVEN=B.CREFVENINI OR B.CREFVENINI IS NULL) '+
          '    THEN NVL(B.CREMTO,0)-NVL(B.CREMTOCOB,0)  END) CUO_VEN, '+
          ' SUM(CASE WHEN (TO_CHAR(B.CREFVEN,''YYYYMM'')>TO_CHAR(SYSDATE,''YYYYMM''))  AND (B.CREFVEN=B.CREFVENINI OR B.CREFVENINI IS NULL) '+
          '    THEN (NVL(B.CREAMORT,0)+NVL(B.CREFLAT,0)+NVL(B.MONPACDESGRAV,0))-NVL(B.CREMTOCOB,0) END) TOT_PEN, '+
          ' SUM(CASE WHEN (B.CREFVENINI IS NOT NULL) AND (B.CREFVEN<>CREFVENINI) '+
          '   THEN NVL(B.CREMTO,0)-NVL(B.CREMTOCOB,0)  END) TOT_DIF,'+
          ' SUM(NVL(B.CREMTO,0)-NVL(B.CREMTOCOB,0)) TOT_NORMAL,'+
          ' COUNT(1) NUM_CUOTAS, '+
          ' SUM(NVL(B.CREAMORT,0)-NVL(B.CRECAPITAL,0)) CAP_PAG_CAN, '+
          ' SUM(CASE WHEN (TO_CHAR(B.CREFVEN,''YYYYMM'')>TO_CHAR(SYSDATE,''YYYYMM''))  AND (B.CREFVEN=B.CREFVENINI OR B.CREFVENINI IS NULL) '+
          '   THEN (NVL(B.CREINTERES,0)-NVL(B.CREMTOINT,0))END) INT_DEJ_PAGAR2 '+
          ' FROM CRE302 B '+
          ' WHERE B.ASOID='''+DM1.CdsCuotas.FieldByName('ASOID').asString+''' AND CREDID='''+DM1.CdsCuotas.FieldByName('CREDID').asString+''' '+
          '   AND CREESTID IN (''14'',''02'',''27'',''11'',''19'') '+
          'GROUP BY ASOID,CREDID) A,APO201 B '+
          ' WHERE A.ASOID=B.ASOID ';
    Dm1.cdsqry25  .Close;
    Dm1.cdsqry25.DataRequest(xsql);
    Dm1.cdsqry25.Open;

    If Dm1.cdsqry25.RecordCount=0 Then
    Begin
      XSQL:='SELECT A.ASOID,B.ASODNI,B.ASOAPENOM,CREDID,0 NUM_CUOTAS,0 TOT_AHORA, 0 TOT_NORMAL,0 INT_DEJ_PAGAR, 0 CAP_PAG_CAN '+
            'FROM CRE301 A, APO201 B '+
            'WHERE A.ASOID='''+DM1.CdsCuotas.FieldByName('ASOID').asString+''' AND A.CREDID='''+DM1.CdsCuotas.FieldByName('CREDID').asString+''' '+
            '  AND B.ASOID=A.ASOID ';
      Dm1.cdsqry25  .Close;
      Dm1.cdsqry25.DataRequest(xsql);
      Dm1.cdsqry25.Open;
    End;

    xsql:='Select ASOID,ASODNI,ASOAPENOM,CREDID,NUMCUOPEN,MONPAGCAN,INTDEJPAG,INGIMPCRO,AREA,OFDESID,MOTIVO,USUIMP,FECIMP,HORIMP,USUREG,FECREG '+
          'From   COB_REQ_IMP_CRO '+
          'Where  Asoid='''+DM1.CdsCuotas.FieldByName('ASOID').asString+''' And '+
          '       Credid='''+DM1.CdsCuotas.FieldByName('CREDID').asString+''' And '+
          '       USUIMP='''+DM1.wUsuario+''' And '+
          '       FecImp=Trunc(Sysdate) And '+
          '       Motivo='''+DBMOTIVO.Text+''' ';
    Dm1.cdsqry23.Close;
    Dm1.cdsqry23.DataRequest(xsql);
    Dm1.cdsqry23.Open;
    If Dm1.cdsqry23.RecordCount>0 Then
    Begin
    Xsql:='Update COB_REQ_IMP_CRO Set '+
          ' NUMCUOPEN ='+DM1.cdsqry25.FieldByname('NUM_CUOTAS').AsString+','+
          ' MONPAGCAN ='+DM1.cdsqry25.FieldByname('TOT_AHORA').AsString+','+
          ' INTDEJPAG ='+DM1.cdsqry25.FieldByname('INT_DEJ_PAGAR').AsString+','+
          ' INGIMPCRO =NVL(INGIMPCRO,0)+1,'+
          ' CAPPAGCAN ='+DM1.cdsqry25.FieldByname('CAP_PAG_CAN').AsString+','+
          ' USUMOD    ='''+DM1.wUsuario+''','+
          ' FECMOD    = SYSDATE '+
          'Where  Asoid='''+DM1.CdsCuotas.FieldByName('ASOID').asString+''' And '+
          '       Credid='''+DM1.CdsCuotas.FieldByName('CREDID').asString+''' And '+
          '       USUIMP='''+DM1.wUsuario+''' And '+
          '       FecImp=Trunc(Sysdate) And '+
          '       Motivo='''+DBMOTIVO.Text+''' ';
    End
    Else
    Begin
    Xsql:='Insert Into COB_REQ_IMP_CRO(ASOID,ASODNI,ASOAPENOM,CREDID,NUMCUOPEN,MONPAGCAN,INTDEJPAG,CAPPAGCAN,INGIMPCRO,AREA,OFDESID,MOTIVO,USUIMP,FECIMP,HORIMP,USUREG,FECREG) '+
          ' VALUES('+
          ''''+DM1.cdsqry25.FieldByname('ASOID').AsString+''','+
          ''''+DM1.cdsqry25.FieldByname('ASODNI').AsString+''','+
          ''''+DM1.cdsqry25.FieldByname('ASOAPENOM').AsString+''','+
          ''''+DM1.cdsqry25.FieldByname('CREDID').AsString+''','+
               DM1.cdsqry25.FieldByname('NUM_CUOTAS').AsString+','+
               DM1.cdsqry25.FieldByname('TOT_AHORA').AsString+','+
               DM1.cdsqry25.FieldByname('INT_DEJ_PAGAR').AsString+','+
               DM1.cdsqry25.FieldByname('CAP_PAG_CAN').AsString+',1,'+
          ''''+Copy(DM1.CrgArea(DM1.wUsuario),1, 3)+''','+
          ''''+DM1.xOfiDes+''','+
          ''''+DBMOTIVO.Text+''','+
          ''''+DM1.wUsuario+''',TRUNC(SYSDATE),SYSDATE,'+
          ''''+DM1.wUsuario+''',SYSDATE)';
    End;
    Try
     DM1.DCOM1.AppServer.EjecutaSql(xSQL);
    Except
      ShowMessage('Se ha Producido un Error al Realizar la Actualización del Motivo de Impresión');
      exit;
   End;

close;
end;

procedure TfMotivoImpresion.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if ((ssAlt in Shift) and (Key = VK_F4)) then Key := 0;
end;

procedure TfMotivoImpresion.DBMOTIVOChange(Sender: TObject);
begin
 edtMotivo.Text := Dm1.cdsQry27.FieldByname('DESMOT').AsString
end;

procedure TfMotivoImpresion.BitBtn1Click(Sender: TObject);
begin
    Dm1.xopc1 := 'N';
    Close;
end;

end.
//Final HPC_201606_PRE  Creación del formulario
