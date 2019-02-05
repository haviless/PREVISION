unit PRE020;

// Inicio Uso Estándares: 01/08/2011
// Unidad               : PRE020
// Formulario           : FCtrlAcceso
// Fecha de Creación    : 15/07/2014
// Autor                : Area de desarrollo de sistemas.
// Objetivo             : Control de Accesos al Sistema
//
// Actualizaciones      :
// SPP_201403_PRE       : Se realiza el pase a producción a partir del pase HPC_201402_PRE

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, wwdbedit, Qt, MConnect, SConnect, winsock,
  fcLabel, fcButton, fcImgBtn, ExtCtrls, fcClearPanel, fcButtonGroup;

type
  TFCtrlAcceso = class(TForm)
    Label2: TLabel;
    fcLabel1: TfcLabel;
    lblUsuario: TLabel;
    lblContrasena: TLabel;
    dbePassword: TwwDBEdit;
    dbeUsuario: TwwDBEdit;
    bbtnOkIngreso: TBitBtn;
    bbtnCancelaIngreso: TBitBtn;
    fcBtnEntrar: TfcButtonGroup;
    bbtnIn: TfcImageBtn;
    fcBtnSalir: TfcButtonGroup;
    bbtnOut: TfcImageBtn;
    procedure bbtnOkIngresoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbePasswordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbtnCancelaIngresoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnInClick(Sender: TObject);
    procedure bbtnOutClick(Sender: TObject);
  private
    { Private declarations }
  public
    wDCOM1: TSocketConnection;
    { Public declarations }
    xdiasduracpass:Integer;
    cAccesoSistema : String;
    nCont : Integer;
    //
    function DesEncripta( sPass : String) : String;
    function Encripta( sPass : String) : String;
  end;

var
  FCtrlAcceso: TFCtrlAcceso;
  xSQL : String;

implementation

uses PREDM;


{$R *.dfm}

procedure TFCtrlAcceso.bbtnOkIngresoClick(Sender: TObject);
Var
   xfecfin :TDate;
   xdiasexppass:Integer;
   xdiasfaltantes:Integer;
   xpassact, xctrl_ip, xingresa :String;
begin
   // Usuario se conecta a la base de datos
   inc(nCont);
   cAccesoSistema:='N';
   Try
      DM1.DCOM1.AppServer.Conectate('xxxxxx', dbeUsuario.Text, dbePassword.Text, cAccesoSistema);
      if cAccesoSistema='N' then
      begin
         Showmessage('Usuario y/o contraseña no reconocido por la Base de Datos');
         if nCont>=3 then
         begin
            ShowMessage('Tres intentos fallidos de conexión, se bloqueara su Usuario. Avise a Sistemas para volver a intentar.');
            Application.Terminate;
         end;
         Exit;
      end;
   Except
      Showmessage('Usuario y/o contraseña no reconocido por la Base de Datos');
      if nCont>3 then
      begin
         ShowMessage('Tres intentos fallidos de conexión, se bloqueara su Usuario. Avise a Sistemas para volver a intentar.');
         Application.Terminate;
      end;
      Exit;
   End;
   Close;
End;

Procedure TFCtrlAcceso.FormShow(Sender: TObject);
Begin
  dbeUsuario.SetFocus;
End;

Procedure TFCtrlAcceso.FormKeyPress(Sender: TObject; var Key: Char);
Begin
  If Key = #13 then
  Begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  End;
End;


procedure TFCtrlAcceso.dbePasswordKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key =  13 then
      bbtnOkIngreso.OnClick(bbtnOkIngreso);
end;

procedure TFCtrlAcceso.bbtnCancelaIngresoClick(Sender: TObject);
begin
   Close;
end;

procedure TFCtrlAcceso.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//   if cAccesoSistema:='N';
   Close;
end;


function TFCtrlAcceso.Encripta( sPass : String ) : String;
var
   xLargoPal,i,j : integer;
   xReal,xEncriptado1,xEncriptado2,xEncriptado3,xEncriptado4,
   xEncriptado5,xNuevaPal,xEncriptado : string;
   xTiene : boolean;
begin
   xReal       := 'abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZ0123456789';
   xEncriptado1:= '¶°ªº¾§¦¥¼»½·¸¹³.µ´±®¯«¬­¨©²¿Ô Ö×ÕÙ¡ÚÛÜ¿Ş¤¿¿¢ÅÄİ£ÃÁÀÓÑĞÆÇÎÍÉÊÌË';
   xEncriptado2:= '§¦¥¼»½·¸¹³.µ´±®¯«¬­¨©²¿Ô Ö×ÕÙ¡ÚÛÜ¿Ş¤¿¿¢ÅÄİ£ÃÁÀÓÑĞÆÇÎÍÉÊÌË¶°ªº¾';
   xEncriptado3:= '½·¸¹³.µ´±®¯«¬­¨©²¿Ô Ö×ÕÙ¡ÚÛÜ¿Ş¤¿¿¢ÅÄİ£ÃÁÀÓÑĞÆÇÎÍÉÊÌË¶°ªº¾§¦¥¼»';
   xEncriptado4:= '.µ´±®¯«¬­¨©²¿Ô Ö×ÕÙ¡ÚÛÜ¿Ş¤¿¿¢ÅÄİ£ÃÁÀÓÑĞÆÇÎÍÉÊÌË¶°ªº¾§¦¥¼»½·¸¹³';
   xEncriptado5:= '¯«¬­¨©²¿Ô Ö×ÕÙ¡ÚÛÜ¿Ş¤¿¿¢ÅÄİ£ÃÁÀÓÑĞÆÇÎÍÉÊÌË¶°ªº¾§¦¥¼»½·¸¹³.µ´±®';
   xLargoPal   := length(sPass);
   xNuevaPal   := '';
   i := 1;
   while i<=xLargoPal do begin
      j := 1;
      xTiene := False;
      if (i=1) or (i=11)or (i=21) or (i=31) then xEncriptado:=xEncriptado1;
      if (i=2) or (i=12)or (i=22) or (i=32) then xEncriptado:=xEncriptado2;
      if (i=3) or (i=13)or (i=23) or (i=33) then xEncriptado:=xEncriptado3;
      if (i=4) or (i=14)or (i=24) or (i=34) then xEncriptado:=xEncriptado4;
      if (i=5) or (i=15)or (i=25) or (i=35) then xEncriptado:=xEncriptado5;
      if (i=6) or (i=16)or (i=26) or (i=36) then xEncriptado:=xEncriptado1;
      if (i=7) or (i=17)or (i=27) or (i=37) then xEncriptado:=xEncriptado2;
      if (i=8) or (i=18)or (i=28) or (i=38) then xEncriptado:=xEncriptado3;
      if (i=9) or (i=19)or (i=29) or (i=39) then xEncriptado:=xEncriptado4;
      if (i=10)or (i=20)or (i=30) or (i=40) then xEncriptado:=xEncriptado5;
      while j<=length(xReal) do begin
         if copy(sPass,i,1)=copy(xReal,j,1) then begin
            xNuevaPal := xNuevaPal+copy(xEncriptado,j,1);
            xTiene := True;
         end;
         j := j+1;
      end;
      if not xTiene then xNuevaPal:=xNuevaPal+copy(sPass,i,1);
      i := i+1;
   end;
   result:=xNuevaPal;
end;


function TFCtrlAcceso.DesEncripta( sPass : String ) : String;
var
   xLargoPal,i,j : integer;
   xReal,xEncriptado1,xEncriptado2,xEncriptado3,xEncriptado4,
   xEncriptado5,xNuevaPal,xEncriptado : string;
   xTiene : boolean;
begin
   xReal       := 'abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZ0123456789';
   xEncriptado1:= '¶°ªº¾§¦¥¼»½·¸¹³.µ´±®¯«¬­¨©²¿Ô Ö×ÕÙ¡ÚÛÜ¿Ş¤¿¿¢ÅÄİ£ÃÁÀÓÑĞÆÇÎÍÉÊÌË';
   xEncriptado2:= '§¦¥¼»½·¸¹³.µ´±®¯«¬­¨©²¿Ô Ö×ÕÙ¡ÚÛÜ¿Ş¤¿¿¢ÅÄİ£ÃÁÀÓÑĞÆÇÎÍÉÊÌË¶°ªº¾';
   xEncriptado3:= '½·¸¹³.µ´±®¯«¬­¨©²¿Ô Ö×ÕÙ¡ÚÛÜ¿Ş¤¿¿¢ÅÄİ£ÃÁÀÓÑĞÆÇÎÍÉÊÌË¶°ªº¾§¦¥¼»';
   xEncriptado4:= '.µ´±®¯«¬­¨©²¿Ô Ö×ÕÙ¡ÚÛÜ¿Ş¤¿¿¢ÅÄİ£ÃÁÀÓÑĞÆÇÎÍÉÊÌË¶°ªº¾§¦¥¼»½·¸¹³';
   xEncriptado5:= '¯«¬­¨©²¿Ô Ö×ÕÙ¡ÚÛÜ¿Ş¤¿¿¢ÅÄİ£ÃÁÀÓÑĞÆÇÎÍÉÊÌË¶°ªº¾§¦¥¼»½·¸¹³.µ´±®';
   xLargoPal   := length(sPass);
   xNuevaPal   := '';
   i := 1;
   while i<=xLargoPal do begin
      j := 1;
      xTiene := False;
      if (i=1) or (i=6) or (i=11) or (i=16) then xEncriptado:=xEncriptado1;
      if (i=2) or (i=7) or (i=12) or (i=17) then xEncriptado:=xEncriptado2;
      if (i=3) or (i=8) or (i=13) or (i=18) then xEncriptado:=xEncriptado3;
      if (i=4) or (i=9) or (i=14) or (i=19) then xEncriptado:=xEncriptado4;
      if (i=5) or (i=10)or (i=15) or (i=20) then xEncriptado:=xEncriptado5;
      while j<=length(xReal) do begin
         if copy(sPass,i,1)=copy(xEncriptado,j,1) then begin
            xNuevaPal := xNuevaPal+copy(xReal,j,1);
            xTiene := True;
            break;
         end;
         j := j+1;
      end;
      if not xTiene then xNuevaPal:=xNuevaPal+copy(sPass,i,1);
      i := i+1;
   end;
   result:=xNuevaPal;
end;


procedure TFCtrlAcceso.bbtnInClick(Sender: TObject);
Var
   xfecfin :TDate;
   xdiasexppass:Integer;
   xdiasfaltantes:Integer;
   xpassact, xctrl_ip, xingresa :String;
begin
   // Usuario se conecta a la base de datos
   inc(nCont);
   cAccesoSistema:='N';
   Try
      DM1.DCOM1.AppServer.Conectate('xxxxxx', dbeUsuario.Text, dbePassword.Text, cAccesoSistema);
      if cAccesoSistema='N' then
      begin
         Showmessage('Usuario y/o contraseña no reconocido por la Base de Datos');
         if nCont>=3 then
         begin
            ShowMessage('Tres intentos fallidos de conexión, se bloqueara su Usuario. Avise a Sistemas para volver a intentar.');
            Application.Terminate;
         end;
         Exit;
      end;
   Except
      Showmessage('Usuario y/o contraseña no reconocido por la Base de Datos');
      if nCont>3 then
      begin
         ShowMessage('Tres intentos fallidos de conexión, se bloqueara su Usuario. Avise a Sistemas para volver a intentar.');
         Application.Terminate;
      end;
      Exit;
   End;
   Close;

end;

procedure TFCtrlAcceso.bbtnOutClick(Sender: TObject);
begin
   Close;
end;

end.
