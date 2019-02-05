// Inicio Uso Estándares : 01/08/2013
// Unidad                : PRE934.pas
// Formulario            : FrmListaCtaIndBloque
// Fecha de Creación     : 
// Autor                 : Equipo de Desarrollo de Sistemas DM
// Objetivo              : Procesar cuenta individual en lotes

// Actualizaciones:
// HPC_201301_PRE : Modificacion del tamaño de ventana y se seleccionan las columnas específicas de APO201
// SPP_201302_PRE : Se realiza el pase a producción a partir del HPC_201301_PRE
// HPC_201704_PRE : Se añaden campos al client de asociados
// HPC_201706_PRE : Se añade radio group para selecionar que tipo de reporte
//                  de cuenta individual desea imprimir.


Unit PRE934;

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Buttons, Grids, ValEdit, StdCtrls, ComObj, StrUtils,
   // Inicio: HPC_201706_PRE
   // Se añade el uses "ExtCtrls" 
   // Printers; // HPP_200902_PRE
   Printers, ExtCtrls; // HPP_200902_PRE
   // Fin: HPC_201706_PRE

Type
   TFrmListaCtaIndBloque = Class(TForm)
      edFind: TEdit;
      btnFind: TButton;
      vleDNI: TValueListEditor;
      btnCargarExcel: TButton;
      btnBloque: TBitBtn;
      btncerrar: TBitBtn;
      open: TOpenDialog;
      // Inicio: HPC_201706_PRE
      // Se añade un radio group para seleccionar el tipo de reporte
      rgtipfor: TRadioGroup;
      // Fin: HPC_201706_PRE

      Procedure btnFindClick(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure btnCargarExcelClick(Sender: TObject);
      Procedure btncerrarClick(Sender: TObject);
      Procedure btnBloqueClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
// Inicio: HPP_200909_PRE por JDCRUZ
// Memorándum 308-2009-DM-EPS - SAR-2009-0726 - DAD-JD-2009-0140
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
// Fin: HPP_200909_PRE
   Private
      vArchivoXLS: String;
      Function crearReporte(ICont: integer): String;
      Function isSeleccionado(): boolean;
      Procedure log(Mensaje: String; IArchivoPadre: String = '');
   Public
   End;

Var
   FrmListaCtaIndBloque: TFrmListaCtaIndBloque;

Const
   xlUp = $FFFFEFBE; // (-4162) [Ctrl]+[Shift] + [flecha arriba]
   xlDown = $FFFFEFE7; // (-4121) [Ctrl]+[Shift] + [flecha abajo]

Implementation

Uses PREDM, PRE935;

{$R *.dfm}

(******************************************************************************)

Procedure TFrmListaCtaIndBloque.btnFindClick(Sender: TObject);
Var
   row: integer;
Begin
   vleDNI.FindRow(self.edFind.text, row);
   If row > 0 Then
      vleDNI.Row := row
   Else
      showmessage('DNI no encontrado');
End;

(******************************************************************************)

Procedure TFrmListaCtaIndBloque.FormKeyPress(Sender: TObject;
   Var Key: Char);
Begin
   If Key = #13 Then
   Begin
      Key := #0;
      btnFindClick(Nil);
   End;
End;

(******************************************************************************)

Procedure TFrmListaCtaIndBloque.btnCargarExcelClick(Sender: TObject);
Var
   Excel: Variant;
   i: integer;
   filename: String;
   lineas: integer;

   Procedure limpiarLista();
   Begin
      While (isSeleccionado) Do
         vleDNI.DeleteRow(vleDNI.Row);
   End;
Begin
   open.FileName := '';
   open.Execute;
   filename := open.FileName;
   vArchivoXLS := open.FileName;
   If filename <> '' Then
   Begin
      Screen.Cursor := crHourGlass;
      Try
         Excel := CreateOleObject('Excel.Application');
      Except
         Excel.Quit;
         showmessage('No se pudo crear el Objecto Excel o se produjo algún error.');
         Raise;
      End;

      Excel.Workbooks.Open(filename);
      limpiarLista();
      i := 1;
      Excel.Selection.End[xlUp].Select; (* se posisiona en la primera linea*)
      While (Excel.Cells[i, 1].Value > 0) Do
      Begin
         vleDNI.InsertRow(RightStr('0000000000' + inttostr(Excel.Cells[i, 2].value), 8), Excel.Cells[i, 1].value, True);
         i := i + 1;
      End;
      Excel.quit;
      Screen.Cursor := crDefault;
   End;
End;

(******************************************************************************)

Procedure TFrmListaCtaIndBloque.btncerrarClick(Sender: TObject);
Begin
   self.close();
End;

(******************************************************************************)

Function TFrmListaCtaIndBloque.isSeleccionado(): boolean;
Begin
   isSeleccionado := ((vleDNI.RowCount > 1) And (vleDNI.Keys[1] <> ''));
End;

(******************************************************************************)

Procedure TFrmListaCtaIndBloque.log(Mensaje: String; IArchivoPadre: String);
Var
   F: TextFile;
   Filename: String;
   Mutex: THandle;
   SearchRec: TSearchRec;
   INombreArchivo: String;
Begin
   If IArchivoPadre = '' Then
      INombreArchivo := ParamStr(0)
   Else
      INombreArchivo := IArchivoPadre;
  // Insertamos la fecha y la hora
   Mensaje := FormatDateTime('[ddd dd mmm, hh:nn] ', Now) + Mensaje;
  // El nombre del archivo es igual al del ejecutable, pero con la extension .log
   Filename := ChangeFileExt(INombreArchivo, '.log');
  // Creamos un mutex, usando como identificador unico la ruta completa del ejecutable
   Mutex := CreateMutex(Nil, TRUE,
      PChar(StringReplace(INombreArchivo, '\', '/', [rfReplaceAll])));
   If Mutex <> 0 Then
   Begin
    // Esperamos nuestro turno para escribir
      WaitForSingleObject(Mutex, INFINITE);
      Try
      // Comprobamos el tamaño del archivo
         If FindFirst(Filename, faAnyFile, SearchRec) = 0 Then
         Begin
        // Si es mayor de un mega lo copiamos a (nombre).log.1
            If SearchRec.Size > (1024 * 1024) Then
               MoveFileEx(PChar(Filename), PChar(Filename + '.1'),
                  MOVEFILE_REPLACE_EXISTING);
            FindClose(SearchRec);
         End;
         Try
            AssignFile(F, Filename);
{$I-}
            Append(F);
            If IOResult <> 0 Then
               Rewrite(F);
{$I+}
            If IOResult = 0 Then
            Begin
          // Escribimos el mensaje
               Writeln(F, Mensaje);
               CloseFile(F);
            End;
         Except
        //
         End;
      Finally
         ReleaseMutex(Mutex);
         CloseHandle(Mutex);
      End;
   End;
End;

(******************************************************************************)
// Inicio: HPC_201706_PRE
// Se valida el registro antes de empezar con la impresión
Procedure TFrmListaCtaIndBloque.btnBloqueClick(Sender: TObject);
Var
   xSql, cadena: String;
   row: integer;
   vCadError: String;
Begin
      If (Not isSeleccionado) Then
      Begin
         showmessage('Seleccione un DNI');
         exit;
      End;
      Screen.Cursor := crHourGlass;
      vleDNI.Row := 1;
      While (isseleccionado) Do
      Begin
         // Inicio: SPP_201302_PRE
         xSql := 'SELECT A.ASOID, A.ASOTIPID, A.ASOFRESNOM, NVL(TRIM(A.AUTDESAPO),''N'') AUTDESAPO,'
            + ' A.ASOAPENOMDNI, A.ASODIR, A.ASODNI, A.ZIPID, A.ASOTELF1, A.ASOCODMOD, A.UPROID, A.UPAGOID, A.USEID,'
            // Inicio: HPC_201704_PRE
            // Se añaden campo ASOTELF2 para ser mostrado en el reporte estadistico de cuenta individual
            // + ' A.ASOTELF1, A.ASOCODMOD, A.CENEDUID, A.ASODESLAB, A.ASODIRLAB, A.ASODSTLABID, A.ASORESNOM,'
            + ' A.ASOTELF1, A.ASOTELF2, A.ASOCODMOD, A.CENEDUID, A.ASODESLAB, A.ASODIRLAB, A.ASODSTLABID, A.ASORESNOM, A.FECAUTDESAPO,'
            // Fin: HPC_201704_PRE
            + ' C.ASOTIPDES, C.ASOTIPABR, B.USENOM FROM APO201 A, APO101 B, APO107 C'
            + ' WHERE A.ASODNI = ''' + vleDNI.Keys[vleDNI.Row] + ''' AND A.USEID = B.USEID'
            + ' AND A.UPAGOID = B.UPAGOID AND A.UPROID = B.UPROID AND A.ASOTIPID = C.ASOTIPID';
         // Fin: SPP_201302_PRE
         DM1.cdsAsociado.Close;
         DM1.cdsAsociado.DataRequest(xSql);
         DM1.cdsAsociado.Open;
         If DM1.cdsAsociado.RecordCount = 0 Then
            Log('No existe el asociado numero : ' + DM1.StrSpace(vleDNI.Values[vleDNI.Keys[vleDNI.Row]], 10) + '    con DNI: ' + vleDNI.Keys[vleDNI.Row], vArchivoXLS)
         Else
         Begin
            vCadError := crearReporte(strtoint(vleDNI.Values[vleDNI.Keys[vleDNI.Row]]));
            If Not (trim(vCadError) = '') Then (* order *)
               Log('No se pudo crear el reporte para el asociado numero : ' + DM1.StrSpace(vleDNI.Values[vleDNI.Keys[vleDNI.Row]], 10) + '    con DNI: ' + vleDNI.Keys[vleDNI.Row] + ' ( ' + vCadError + ' )', vArchivoXLS);
         End;
         vleDNI.DeleteRow(vleDNI.Row)
      End;
      Screen.Cursor := crDefault;
      showmessage('Termino el Proceso');
   End;

// Fin: HPC_201706_PRE

(******************************************************************************)

Function TFrmListaCtaIndBloque.crearReporte(ICont: integer): String;
Var
   xSql: String;
   frm: TFrmGeneraCtaIndividualPDF;
   msg: String;
Begin
   crearReporte := '';
   Try
      // HPP_200903_PRE - SAR2009-0199 - realizado por JDCRUZ
      If DM1.cdsAsociado.FieldByName('ASOTIPID').AsString <> 'DO' Then
      Begin
         crearReporte := 'Asociado cuenta con FLAG de : ' + DM1.cdsAsociado.FieldByName('ASOTIPID').AsString;
         Exit;
      End;
      // Inicio: HPC_201704_PRE
      // Se envia mensaje de error si el asociado ya esta liquidado
      // o cuenta con expediente de beneficio
      xSql := 'SELECT PVSEXPNRO, PVSLBENNR FROM PVS301 WHERE ASOID = '+QuotedStr(DM1.cdsAsociado.FieldByName('ASOID').AsString)+' AND PVSESTADO NOT IN (''04'',''13'')';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      If DM1.cdsQry.RecordCount > 0 Then
      Begin
         If Trim(DM1.cdsQry.FieldByName('PVSLBENNR').AsString) = '' Then
         Begin
            crearReporte := 'Asociado cuenta con expediente de beneficio Nº : ' + DM1.cdsQry.FieldByName('PVSEXPNRO').AsString;
            Exit;
         End
         Else
         Begin
            crearReporte := 'Asociado cuenta con Liquidación de beneficio Nº : ' + DM1.cdsQry.FieldByName('PVSLBENNR').AsString;
            Exit;
         End;
      End;
      // Fin: HPC_201704_PRE
      If DM1.cdsAsociado.FieldByName('ASOFRESNOM').AsString = '' Then
      Begin
         crearReporte := 'Asociado no cuenta con resolución de nombramiento';
         Exit;
      End;
      Try
         frm := TFrmGeneraCtaIndividualPDF.create(Self);
         msg := frm.generarData();
         //HPP_200903_PRE - JDCRUZ - INICIO
         If msg = '' Then
            // Inicio: HPC_201706_PRE
            // Se controla que tipo de reporte se generará.
            If rgtipfor.ItemIndex = 0 Then
               frm.generarReporte(ICont)
            Else
               frm.generarReportesinfor(ICont)
            // Fin: HPC_201706_PRE
         else
             crearReporte := msg;
         //HPP_200903_PRE - JDCRUZ - FIN
      Finally
         frm := Nil;

      End;
   Except
      If (msg = '') Then
         crearReporte := 'Error Desconocido'
      Else
         crearReporte := msg;
   End;
End;

Procedure TFrmListaCtaIndBloque.FormCreate(Sender: TObject);
Begin
// Inicio: HPP_200909_PRE por JDCRUZ
// Memorándum 308-2009-DM-EPS - SAR-2009-0726 - DAD-JD-2009-0140
// COLOCAR FECHA DE ULTIMO APORTE
  DM1.cdsCueInd.open();
// Fin: HPP_200909_PRE

End;

// Inicio: HPP_200909_PRE por JDCRUZ
// Memorándum 308-2009-DM-EPS - SAR-2009-0726 - DAD-JD-2009-0140
// COLOCAR FECHA DE ULTIMO APORTE
procedure TFrmListaCtaIndBloque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM1.cdsAsociado.Close;
  DM1.cdsAsociado.Filter:='';
  DM1.cdsAsociado.IndexFieldNames:='';

  DM1.cdsCueInd.Close;
  DM1.cdsCueInd.Filter:='';
  DM1.cdsCueInd.IndexFieldNames:='';

  Action := caFree;
end;
// Fin: HPP_200909_PRE 

End.

