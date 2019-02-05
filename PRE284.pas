unit PRE284;

// Actualizaciones
// HPC_201202_PRE 10/02/20002 Desactiva lectura de Foto y Firma de FTP, lee de archivo RENIEC
// DPP_201201_PRE   : Se realiza el pase a producción de acuerdo al HPC_201202_PRE
// HPC_201809_PRE   : Se retira procedimiento de borra fotos del disco duro

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdFTP,IniFiles;

type
  TFmstfotder = class(TForm)
    pnlfotfir: TPanel;
    GroupBox1: TGroupBox;
    ImagAso: TImage;
    ImaFirma: TImage;
    BitBtn1: TBitBtn;
    IdFTP1: TIdFTP;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
   //INICIO: DPP_201201_PRE
   //SE RETIRA LA CARGA DE FOTO Y FIRMA POR FTP
   // procedure CargaFoto(IdFoto:String);
   // procedure CargaFirma(IdFoto:String);
   //FINAL: DPP_201201_PRE
    // Inicio: HPC_201809_PRE
    // Se retira procedimiento de borrar foto del disco duro
    // procedure borrafotos;
    // Fin: HPC_201809_PRE
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fmstfotder: TFmstfotder;

implementation

uses PREDM;

{$R *.dfm}

procedure TFmstfotder.BitBtn1Click(Sender: TObject);
begin
  Fmstfotder.Close;
end;

// Inicio: HPC_201809_PRE
// Se retira procedimiento para borrar fotos
// procedure TFmstfotder.borrafotos;
// Var search: TSearchRec;
//      nFiles: integer;
// begin
//   nFiles:=FindFirst('C:\SOLEXES\*.JPG', faAnyFile,  search );
//   while nFiles=0 do
//   begin
//     SysUtils.DeleteFile('C:\SOLEXES\'+ Search.Name);
//     nFiles:=FindNext( Search );
//   end;
//   FindClose(Search);
// end;
// Fin: HPC_201809_PRE


//INICIO: DPP_201201_PRE
//SE RETIRA LA CARGA DE FOTO Y FIRMA POR FTP
{procedure TFmstfotder.CargaFirma(IdFoto: String);
Var RemoteTxt, LocalTxt, xFtp :String;
    IniFile : TIniFile;
Begin
  BorraFotos;
  ImaFirma.Visible := True;
  IniFile:=TIniFile.Create('C:\SOLExes\SOLConf.ini'); xFtp:=IniFile.ReadString('FOTOS','FTP','');
  IDFTP1.Host := xFtp; IDFTP1.Port := 21; IDFTP1.ReadTimeout := 5000; IDFTP1.UserName := 'imagen'; IDFTP1.Password := 'imagen';
  IDFTP1.Connect;
  Try
    If Trim(IdFoto) <> '' then
    Begin
      Try
        RemoteTxt := '/data04/imagen/FPEG'+copy(IdFoto,1,1)+'/'+IdFoto+'.jpg';
        LocalTxt  :=  'C:\SolExes\'+IdFoto+'.jpg';
        IdFTP1.Get(RemoteTxt, LocalTxt, False);
        ImaFirma.Picture.LoadFromFile(LocalTxt);
        BorraFotos;
      Except
        RemoteTxt := '/data04/imagen/SINFIRMA.jpg';
        LocalTxt  :=  'C:\SolExes\SINFIRMA.Jpg';
        IdFTP1.Get(RemoteTxt, LocalTxt, False);
        ImaFirma.Picture.LoadFromFile(LocalTxt);
      End ;
    End
    Else
    Begin
      Try
        RemoteTxt := '/data04/imagen/SINFIRMA.jpg';
        LocalTxt  :=  'C:\SolExes\SINFIRMA.Jpg';
        IdFTP1.Get(RemoteTxt, LocalTxt, False);
        ImaFirma.Picture.LoadFromFile(LocalTxt);
        deletefile(LocalTxt);
        BorraFotos;
      Except
      End;
    End;
 Except
 End;
 idFTP1.Disconnect;
end;}
//FINAL: DPP_201201_PRE


//INICIO: DPP_201201_PRE
//SE RETIRA LA CARGA DE FOTO Y FIRMA POR FTP
{procedure TFmstfotder.CargaFoto(IdFoto: String);
Var RemoteTxt, LocalTxt, xFtp :String;
    IniFile : TIniFile;
begin
  ImagAso.Visible := True;
  BorraFotos;
  IniFile:=TIniFile.Create('C:\SOLExes\SOLConf.ini'); xFtp:=IniFile.ReadString('FOTOS','FTP','');
  IDFTP1.Host := xFtp; IDFTP1.Port := 21; IDFTP1.ReadTimeout := 5000; IDFTP1.UserName := 'imagen'; IDFTP1.Password := 'imagen';
  IDFTP1.Connect;
  Try
    If Trim(IdFoto) <> '' then
    Begin
      Try
        RemoteTxt := '/data02/imagen/jpeg/JPEG'+copy(IdFoto,1,1)+'/'+IdFoto+'.jpg';
        LocalTxt  :=  'C:\SolExes\'+IdFoto+'.jpg';
        IdFTP1.Get(RemoteTxt, LocalTxt, False);
        ImagAso.Picture.LoadFromFile(LocalTxt);
        deletefile(LocalTxt);
        BorraFotos;
      Except
      End;
    End
    Else
    Begin
      Try
        RemoteTxt := '/data02/imagen/jpeg/SINFOTO.jpg';
        LocalTxt  :=  'C:\SolExes\SINFOTO.Jpg';
        IdFTP1.Get(RemoteTxt, LocalTxt, False);
        ImagAso.Picture.LoadFromFile(LocalTxt);
        deletefile(LocalTxt);
        BorraFotos;
      Except
      End;
    End;
  Except
  End;
  idFTP1.Disconnect;
end;}
//FINAL: DPP_201201_PRE


procedure TFmstfotder.FormActivate(Sender: TObject);
begin
 //INICIO: DPP_201201_PRE
 //SE RETIRA LA CARGA DE FOTO Y FIRMA POR FTP
 {CargaFoto(DM1.cdsAsociado.FieldByName('IDIMAGE').AsString);
 CargaFirma(DM1.cdsAsociado.FieldByName('IDIMAGE').AsString);}
  dm1.CargaImagenes(DM1.cdsAsociado.FieldByName('ASODNI').AsString);
  ImagAso.Picture.Assign(DM1.Jpg);
  ImaFirma.Picture.Assign(dm1.jpgFirma);
 //FINAL: DPP_201201_PRE

end;

end.
