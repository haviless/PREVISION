// Inicio Uso Estándares: 01/08/2011
// Unidad : Previsión Social
// Formulario : TFExpedientebeneficio
// Fecha de Creación : 08/08/2011
// Autor : Sistemas
// Objetivo : Expediente de beneficios
// Actualizaciones
// HPC_201211_PRE  : Se Controla que la fecha de autorización de descuento de aportes sea menor que la fecha de cese.
//                      * Para los casos de Fallecimiento e Invalidez. Si la fecha de autorización de descuento de aportes es mayor a la fecha de cese
//                      * solo se pagara cuenta invididual (Tambien tomar en cuenta que para estos casos ya no se cobrara nivelación de Aportes
// DPP_201209_PRE  : Se realiza el pase a produccion a partir del HPC_201211_PRE
// HPC_201304_PRE  : Anulación del expediente (refresca el grid)
// SPP_201305_PRE  : Se realiza el pase a producción a partir del HPC_201304_PRE
// HPC_201305_PRE  : Se añade boton para la impresión de expedientes
// SPP_201306_PRE  : Se realiza el pase a producción a partir del HPC_201305_PRE
// HPC_201307_PRE  : Se añade flag para no mostrar registros que no han sido verificados por ofide.
// SPP_201401_PRE  : Se realiza el pase a producción a partir del pase HPC_201307_PRE
// HPC_201402_PRE  : Se retira los expedientes anulados de la busqueda.
// SPP_201403_PRE  : Se realiza el pase a producción a partir del pase HPC_201402_PRE
// HPC_201709_PRE  : Se modifica la cabecera el grid de la cabecera el expediente 
// HPC_201809_PRE  : Se añaden campos telefono, dirección y email del solicitante

unit PRE232;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Mask, ExtCtrls, Buttons, Msgdlgs;

type
  TFExpedientebeneficio = class(TForm)
    dbgExpBen: TwwDBGrid;
    dbgExpBenIButton: TwwIButton;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    rgbusca: TRadioGroup;
    mebusca: TMaskEdit;
    btnBuscar: TBitBtn;
    btnimprimir: TBitBtn;  // SPP_201306_PRE SE AÑADE BOTON PARA LA IMPRESION DE EXPEDIENTES
    // RadioButton1: TRadioButton; SPP_201305_PRE Se retira boton oculto en fuente que no tenia uso.
    procedure FormActivate(Sender: TObject);
    procedure dbgExpBenIButtonClick(Sender: TObject);
    procedure rgbuscaClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbgExpBenDblClick(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);  // SPP_201306_PRE PROCEDIMIENTO QUE LLAMA AL FORMULARIO DE IMPRESION DE EXPEDIENTE
    // Inicio: HPC_201809_PRE
    // Se crea proce para controlar si se ingresa valor de busqueda 
    procedure mebuscaChange(Sender: TObject);
    // Fin: HPC_201809_PRE
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FExpedientebeneficio: TFExpedientebeneficio;

implementation

uses PREDM, PRE233, PRE235, PRE287; //, PRE243 // SPP_201306_PRE SE AÑADE FORMA PARA IMPRESION DE EXPEDIENTES DE BENEFICIOS

{$R *.dfm}

procedure TFExpedientebeneficio.FormActivate(Sender: TObject);
Var xSql:String;
begin
        dbgExpBen.Selected.Clear;
        // Inicio: HPC_201709_PRE
        // Se cambia la fecha de registro por fecha de creación del expediente
        // dbgExpBen.Selected.Add('FREG'#9'10'#9'Fecha de~registro'#9#9);
        dbgExpBen.Selected.Add('PVSFECEXP'#9'10'#9'Fecha creación~expediente'#9#9);
        // Fin: HPC_201709_PRE
        dbgExpBen.Selected.Add('PVSEXPNRO'#9'11'#9'Número de~Expediente'#9#9);
        dbgExpBen.Selected.Add('PVSESTDES'#9'20'#9'Estado de la~Liquidación'#9#9);
        dbgExpBen.Selected.Add('BENEFDES'#9'20'#9'Tipo de~Beneficio'#9#9);
        dbgExpBen.Selected.Add('ASOID'#9'10'#9'Identificación~del asociado'#9#9);
        dbgExpBen.Selected.Add('ASOCODMOD'#9'10'#9'Código~modular'#9#9);
        dbgExpBen.Selected.Add('ASOAPENOMDNI'#9'40'#9'Apellido(s) y~Nombre(s)'#9#9);
        // Inicio: HPC_201709_PRE
        // Se modifica el valor de la columna de numero de documento.
        // Se coloca el DNI
        // dbgExpBen.Selected.Add('TIPDOCDES'#9'6'#9'Tipo~de doc.'#9#9);
        // dbgExpBen.Selected.Add('ASODOCNUM'#9'10'#9'Número de~Documento'#9#9);
        dbgExpBen.Selected.Add('ASODNI'#9'10'#9'Número~DNI'#9#9);
        // Fin: HPC_201709_PRE
        dbgExpBen.Selected.Add('REPRAPENOM'#9'25'#9'Origen del~Expediente'#9#9);
        dbgExpBen.ApplySelected;
        // Inicio: DPP_201209_PRE
        //xSql := 'SELECT  A.*, F.TIPDOCDES, D.BENEFDES, C.PVSESTDES, DECODE(E.REPRAPENOM, NULL, ''SEDE CENTRAL'', E.REPRAPENOM) REPRAPENOM'
        xSql := 'SELECT  A.*, F.TIPDOCDES, D.BENEFDES, C.PVSESTDES, DECODE(E.REPRAPENOM, NULL, ''SEDE CENTRAL'', E.REPRAPENOM) REPRAPENOM, B.AUTDESAPO, B.FECAUTDESAPO'
        // Fin: DPP_201209_PRE
        +' FROM APO201 B, PVS301 A, PVS102 C, TGE186 D, COB201 E, TGE159 F'
        // Inicio: SPP_201305_PRE
        // +' WHERE A.ASOID = '''' AND A.PVSESTADO NOT IN (''04'',''13'') AND A.ASOID = B.ASOID And A.PVSESTADO = C.PVSESTDSG AND A.PVSTIPBEN = D.TIPBENEF  AND A.TIPDOCCOD = F.TIPDOCCOD(+)'
        +' WHERE A.ASOID = '''' AND A.ASOID = B.ASOID And A.PVSESTADO = C.PVSESTDSG AND A.PVSTIPBEN = D.TIPBENEF  AND A.TIPDOCCOD = F.TIPDOCCOD(+)'
        // Fin: SPP_201305_PRE
        +' AND A.REPRID = E.REPRID(+) And C.PVSDOC = ''E''  ORDER BY A.FREG DESC';
        DM1.cdsExpLiq.Close;
        DM1.cdsExpLiq.DataRequest(xSql);
        DM1.cdsExpLiq.Open;
        rgbusca.ItemIndex := 0;
        mebusca.Width := 300;
        mebusca.SetFocus;
end;

procedure TFExpedientebeneficio.dbgExpBenIButtonClick(Sender: TObject);
begin
  Try
    FNueExpben := TFNueExpben.create(Self);
    FNueExpben.ShowModal;
  Finally
    FNueExpben.Free;
  end;
  // Inicio: HPC_201809_PRE
  // Se modificar el valor de la variable para controlar las modificaciones
  // If DM1.xCnd = 'S' Then
  If DM1.xCnd = 'I' Then
  // Fin: HPC_201809_PRE
  Begin
    Try
      FModExpben := TFModExpben.create(Self);
      FModExpben.ShowModal;
    Finally
      FModExpben.Free;
    End;
    // Inicio: HPC_201809_PRE
    // Ejecutar refrescar los valores
    btnBuscar.OnClick(btnBuscar);
    // Fin: HPC_201809_PRE
  End;
end;

procedure TFExpedientebeneficio.rgbuscaClick(Sender: TObject);
begin
  If rgbusca.ItemIndex = 0 Then
  Begin
    mebusca.Width := 300;
    mebusca.MaxLength := 40;
  End
  Else If rgbusca.ItemIndex = 1 Then
  Begin
   mebusca.Width := 100;
   mebusca.MaxLength := 10;
  End
  Else If rgbusca.ItemIndex = 2 Then
  Begin
   mebusca.Width := 80;
   mebusca.MaxLength := 8;
  End;
  mebusca.SetFocus;
  mebusca.Text := '';
end;

// Inicio: HPC_201709_PRE
// Se valida la busqueda por apellidos y nombres, código modular, DNI
procedure TFExpedientebeneficio.btnBuscarClick(Sender: TObject);
// Var xSql:String;
// Se añade la variable xBusca
Var xSql, xBusca:String;
begin
  If rgbusca.ItemIndex = -1  Then
  Begin
     MessageDlg('Debe seleccionar un tipo de busqueda.', mtInformation, [mbOk], 0);
     rgbusca.SetFocus;
     Exit;
  End;
  // Inicio: HPC_201809_PRE
  // Se modifica los filtros de busqueda
  // If Trim(mebusca.Text) = '' Then
  If ((DM1.xCnd = 'I') Or (DM1.xCnd = 'M')) Then
     xBusca := ' A.PVSEXPNRO = '+QuotedStr(DM1.cdsExpLiq.FieldByname('PVSEXPNRO').AsString)
  Else
  Begin
     If DM1.xCnd = 'B' Then
     Begin
        If Trim(mebusca.Text) = '' Then
        Begin
           MessageDlg('Debe ingresar un dato de búsqueda según el criterio.', mtInformation, [mbOk], 0);
           mebusca.SetFocus;
           Exit;
        End;
     End;
     If rgbusca.ItemIndex = 0 Then
        xBusca := ' A.ASOAPENOMDNI LIKE '+QuotedStr(Trim(mebusca.Text)+'%');
     If rgbusca.ItemIndex = 1 Then
        xBusca := ' A.ASOCODMOD =  '+QuotedStr(Trim(mebusca.Text));
     If rgbusca.ItemIndex = 2 Then
        xBusca := ' A.ASODNI =  '+QuotedStr(Trim(mebusca.Text));
  End;
  // Se añaden los campos telefono, dirección y email del solicitante
  xSql := 'SELECT A.pvsexpnro, A.pvstipben, A.asoid, A.asocodmod, A.asocodaux, A.pvsestado, A.pvscausa, A.forpagoid, A.bancoid, A.pvsultapo, A.usuario,'
  +' A.freg, A.hreg, A.agenbcoid, A.reprid, A.pvscobaso, A.asoapenomdni, A.asoncta, A.pvslbennr, A.pvslfecbe, A.asoresnom, A.asofresnom, A.asorescese,'
  +' A.asofrescese, A.asofecnac, A.tipdoccod, A.asodocnum, A.asodni, A.asofecinv, A.asofecfal, A.ofdesidori, A.disoriexp, A.usu_anu, A.fec_anu, A.com_anu,'
  +' A.codotrdocide, A.numotrdocide, TO_DATE(A.pvsfecexp) pvsfecexp, A.usucreexp, A.apenomsol, A.dnisol, A.vinparsol, A.forsolben, A.pvstipret, A.genporweb, A.versede,'
  +' A.conofide, A.cod_err_dni, A.obs_memo_actual, A.tipbenef, A.codcauces, A.deporiexp, A.ofioriexp, A.fecrecexp, A.codcarexp, F.TIPDOCDES, D.BENEFDES, C.PVSESTDES,'
  // +' DECODE(E.REPRAPENOM, NULL, ''SEDE CENTRAL'', E.REPRAPENOM) REPRAPENOM, B.AUTDESAPO, B.FECAUTDESAPO'
  +' DECODE(E.REPRAPENOM, NULL, ''SEDE CENTRAL'', E.REPRAPENOM) REPRAPENOM, B.AUTDESAPO, B.FECAUTDESAPO, A.TELEFONOSOL, A.DIRSOL, A.EMAILSOL, A.ZIPIDSOL'
  +' FROM APO201 B, PVS301 A, PVS102 C, TGE186 D, COB201 E, TGE159 F'
  +' WHERE '+xBusca
  +' AND ((NVL(GENPORWEB,''N'') = ''S'' AND NVL(CONOFIDE,''N'') = ''S'')  OR (NVL(GENPORWEB,''N'') = ''N''))'
  +' AND A.ASOID = B.ASOID And A.PVSESTADO = C.PVSESTDSG AND A.PVSTIPBEN = D.TIPBENEF  AND A.TIPDOCCOD = F.TIPDOCCOD(+)'
  +' AND A.REPRID = E.REPRID(+) And C.PVSDOC = ''E''  ORDER BY A.FREG DESC';
  DM1.cdsExpLiq.Close;
  DM1.cdsExpLiq.DataRequest(xSql);
  DM1.cdsExpLiq.Open;
  DM1.xCnd := '';
  // Fin: HPC_201809_PRE
end;
// Fin: HPC_201709_PRE

procedure TFExpedientebeneficio.BitBtn2Click(Sender: TObject);
begin
FExpedientebeneficio.Close;
end;

procedure TFExpedientebeneficio.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
    begin
     Key := #0;
     Perform(CM_DIALOGKEY, VK_TAB, 0);
    end;
end;
Procedure TFExpedientebeneficio.dbgExpBenDblClick(Sender: TObject);
// Inicio: HPC_201809_PRE
// Se añade la variable xBusca, xPvsNroExp
// Var xSql:String;
Var xSql, xBusca, xPvsNroExp: String;
    xMarcaPRE2 : boolean;
Begin
   DM1.xSgr := 'N';
// Fin: HPC_201809_PRE
   xMarcaPRE2 := False;
   if DM1.IndicaAsociadoEnAct(DM1.cdsExpLiq.FieldByName('ASOID').AsString) then
   begin
      ErrorMsg('Módulo de Previsión', 'Existe otra opción que puede estar actualizando datos del Asociado'+chr(13)
                                            +'no se puede ejecutar en simultáneo con esta Opción');
      exit;
   end;
// marca el registro del Asociado en Maestro de Asociados, para que no pueda sea actualizado por otro lado
   xSQL := 'begin '
          +'  SP_ACT_PROC_ACT_MAE('+quotedstr(DM1.cdsExpLiq.FieldByName('ASOID').AsString)+','
                                   +quotedstr(DM1.wModulo)+', ' + QuotedStr(DM1.wUsuario) + '); '
          +'end; ';
   DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
   xMarcaPRE2 := True;
  If (DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString = '01') Or (DM1.cdsExpLiq.FieldByName('PVSESTADO').AsString = '05') Then
    DM1.actualizapvs301(DM1.cdsExpLiq.FieldByName('ASOID').AsString, DM1.cdsExpLiq.FieldByName('PVSEXPNRO').AsString);
   // Inicio: HPC_201809_PRE
   // Guarda numero de expediente para colocarse en ese mismo lugar
   xPvsNroExp := DM1.cdsExpLiq.FieldByName('PVSEXPNRO').AsString;
   // Fin: HPC_201809_PRE
  Try
    FModExpben := TFModExpben.create(Self);
    FModExpben.ShowModal;
  Finally
    FModExpben.Free;
  // libera el registro del Asociado en Maestro de Asociados, para que pueda sea actualizado
    if xMarcaPRE2 then
    begin
       xSQL := 'begin '
              +'  SP_ACT_PROC_ACT_MAE('+quotedstr(DM1.cdsExpLiq.FieldByName('ASOID').AsString)+','
                                       +quotedstr('XXX')+', ' + QuotedStr(DM1.wUsuario) + '); '
              +'end; ';
       DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
    end;
  End;
  // Inicio: HPC_201809_PRE
  // Se ejecuta el boton buscar al momento de salir
   btnBuscar.OnClick(btnBuscar);
   DM1.cdsExpLiq.Locate('PVSEXPNRO', xPvsNroExp, []);
   // Direccionar la busqueda del registro por la selección
   If rgbusca.ItemIndex = 0 Then
   // Fin: HPC_201809_PRE

     xBusca := ' A.ASOAPENOMDNI LIKE '+QuotedStr(Trim(mebusca.Text)+'%');
  If rgbusca.ItemIndex = 1 Then
     xBusca := ' A.ASOCODMOD =  '+QuotedStr(Trim(mebusca.Text));
  If rgbusca.ItemIndex = 2 Then
     xBusca := ' A.ASODNI =  '+QuotedStr(Trim(mebusca.Text));
  // Inicio: HPC_201809_PRE
  If DM1.xSgr = 'G' Then
  Begin
    xSql := 'SELECT  A.*, F.TIPDOCDES, D.BENEFDES, C.PVSESTDES, DECODE(E.REPRAPENOM, NULL, ''SEDE CENTRAL'', E.REPRAPENOM) REPRAPENOM, B.AUTDESAPO, B.FECAUTDESAPO'
    +' FROM APO201 B, PVS301 A, PVS102 C, TGE186 D, COB201 E, TGE159 F'
    // Inicio: HPC_201809_PRE
    // Se modifica la busqueda del registro de acuerdo a la selección
    //+' WHERE A.ASOAPENOMDNI LIKE '+QuotedStr(Trim(mebusca.Text)+'%')
    +' WHERE '+xBusca
    // Fin: HPC_201809_PRE
    +' AND A.PVSESTADO NOT IN (''04'',''13'') AND A.ASOID = B.ASOID And A.PVSESTADO = C.PVSESTDSG AND A.PVSTIPBEN = D.TIPBENEF  AND A.TIPDOCCOD = F.TIPDOCCOD(+)'
    +' AND A.REPRID = E.REPRID(+) And C.PVSDOC = ''E''  ORDER BY A.FREG DESC';
    DM1.cdsExpLiq.Close;
    DM1.cdsExpLiq.DataRequest(xSql);
    DM1.cdsExpLiq.Open;
    DM1.cdsExpLiq.GotoBookmark(DM1.bmk);
  End;
End;

// Inicio: SPP_201306_PRE
procedure TFExpedientebeneficio.btnimprimirClick(Sender: TObject);
begin
   Try
      Frepexpben := TFrepexpben.create(Self);
      Frepexpben.ShowModal;
   Finally
      Frepexpben.Free;
   End;
end;
// Fin: SPP_201306_PRE

// Inicio: HPC_201809_PRE
// Se actualiza variable flag
procedure TFExpedientebeneficio.mebuscaChange(Sender: TObject);
begin
 DM1.xCnd := 'B';
end;
// Fin: HPC_201809_PRE

End.
