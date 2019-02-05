// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://10.14.10.32/SeguridadWeb/WSAutenticacion.asmx?Wsdl
// Encoding : utf-8
// Version  : 1.0
// (14/02/2018 11:08:58 - 1.33.2.5)
// ************************************************************************ //
//------------------------------------------------------------------------------------
// Unidad                   : WSAutenticacion
// Formulario               :
// Fecha de Creación        : 14/02/2018
// Autor                    : Equipo de Desarrollo.
// Objetivo                 : Servicios Web
// Fecha de Actualización   :
//------------------------------------------------------------------------------------
// HPC_201808_PRE : Jerarquía del módulo del Control de Ticket

//Inicio HPC_201808_PRE
//Jerarquía del módulo del Control de Ticket
unit WSAutenticacion;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:boolean         - "http://www.w3.org/2001/XMLSchema"
  // !:int             - "http://www.w3.org/2001/XMLSchema"
  // !:dateTime        - "http://www.w3.org/2001/XMLSchema"

  TGE006               = class;                 { "http://www.derrama.org.pe/webservices/" }
  TGE003               = class;                 { "http://www.derrama.org.pe/webservices/" }
  TGE001_2             = class;                 { "http://www.derrama.org.pe/webservices/" }



  // ************************************************************************ //
  // Namespace : http://www.derrama.org.pe/webservices/
  // ************************************************************************ //
  TGE006 = class(TRemotable)
  private
    FDIASEXP_PWD: Integer;
    FOFDESID: WideString;
    FFECFIN_PWD: TXSDateTime;
    FUSERID: WideString;
    FFECINI_PWD: TXSDateTime;
    FDIASDURAC_PWD: Integer;
    FUSERNOM: WideString;
    FCTRL_IP: WideString;
    FFECEXP: TXSDateTime;
  public
    destructor Destroy; override;
  published
    property DIASEXP_PWD: Integer read FDIASEXP_PWD write FDIASEXP_PWD;
    property OFDESID: WideString read FOFDESID write FOFDESID;
    property FECFIN_PWD: TXSDateTime read FFECFIN_PWD write FFECFIN_PWD;
    property USERID: WideString read FUSERID write FUSERID;
    property FECINI_PWD: TXSDateTime read FFECINI_PWD write FFECINI_PWD;
    property DIASDURAC_PWD: Integer read FDIASDURAC_PWD write FDIASDURAC_PWD;
    property USERNOM: WideString read FUSERNOM write FUSERNOM;
    property CTRL_IP: WideString read FCTRL_IP write FCTRL_IP;
    property FECEXP: TXSDateTime read FFECEXP write FFECEXP;
  end;

  ArrayOfTGE006 = array of TGE006;              { "http://www.derrama.org.pe/webservices/" }


  // ************************************************************************ //
  // Namespace : http://www.derrama.org.pe/webservices/
  // ************************************************************************ //
  TGE003 = class(TRemotable)
  private
    FGRUPOADM: WideString;
    FGRUPOID: WideString;
    FGRUPODES: WideString;
  published
    property GRUPOADM: WideString read FGRUPOADM write FGRUPOADM;
    property GRUPOID: WideString read FGRUPOID write FGRUPOID;
    property GRUPODES: WideString read FGRUPODES write FGRUPODES;
  end;

  ArrayOfTGE003 = array of TGE003;              { "http://www.derrama.org.pe/webservices/" }


  // ************************************************************************ //
  // Namespace : http://www.derrama.org.pe/webservices/
  // ************************************************************************ //
  TGE001_2 = class(TRemotable)
  private
    FOBJETO: WideString;
    FDESCRIPTIVO: WideString;
  published
    property OBJETO: WideString read FOBJETO write FOBJETO;
    property DESCRIPTIVO: WideString read FDESCRIPTIVO write FDESCRIPTIVO;
  end;

  ArrayOfTGE001_2 = array of TGE001_2;          { "http://www.derrama.org.pe/webservices/" }

  // ************************************************************************ //
  // Namespace : http://www.derrama.org.pe/webservices/
  // soapAction: http://www.derrama.org.pe/webservices/%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // binding   : WSAutenticacionSoap
  // service   : WSAutenticacion
  // port      : WSAutenticacionSoap
  // URL       : http://10.14.10.32/SeguridadWeb/WSAutenticacion.asmx
  // ************************************************************************ //
  WSAutenticacionSoap = interface(IInvokable)
  ['{88D400AB-B03C-B932-5608-37B017C6918A}']
    procedure AutenticarIntranet(const p_usuario: WideString; const p_clave: WideString; const p_modulo: WideString; const p_ip: WideString; out AutenticarIntranetResult: Boolean; out p_mensaje: WideString; out idreg: WideString); stdcall;
    procedure Autenticar(const p_usuario: WideString; const p_clave: WideString; const p_modulo: WideString; out AutenticarResult: Boolean; out p_mensaje: WideString); stdcall;
    procedure AutenticarInternetAsociado(const p_dni: WideString; const p_clave: WideString; out AutenticarInternetAsociadoResult: Boolean; out p_asoid: WideString; out p_mensaje: WideString); stdcall;
    procedure Registrar_Salida(const p_usuario: WideString; const p_idreg: WideString; out Registrar_SalidaResult: Boolean; out p_mensaje: WideString); stdcall;
    function  AccesosOpcion(const P_USUARIO: WideString; const P_MODULOID: WideString; const P_TIPO: WideString; const P_OBJETO: WideString): Boolean; stdcall;
    function  Get_Usuario(const P_USERID: WideString): TGE006; stdcall;
    function  Get_Usuarios(const P_USERID: WideString): ArrayOfTGE006; stdcall;
    function  Get_Grupos_Por_Usuario(const P_MODULOID: WideString; const P_USERID: WideString): ArrayOfTGE003; stdcall;
    function  Tiene_Acceso_a_Opcion(const P_MODULOID: WideString; const P_USERID: WideString; const P_OBJETO: WideString): Boolean; stdcall;
    function  Get_Accesos_por_Usuario(const P_MODULOID: WideString; const P_USERID: WideString): ArrayOfTGE001_2; stdcall;
  end;

function GetWSAutenticacionSoap(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): WSAutenticacionSoap;


implementation

function GetWSAutenticacionSoap(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): WSAutenticacionSoap;
const
  defWSDL = 'http://10.14.10.32/SeguridadWeb/WSAutenticacion.asmx?Wsdl';
  defURL  = 'http://10.14.10.32/SeguridadWeb/WSAutenticacion.asmx';
  defSvc  = 'WSAutenticacion';
  defPrt  = 'WSAutenticacionSoap';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as WSAutenticacionSoap);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


destructor TGE006.Destroy;
begin
  if Assigned(FFECFIN_PWD) then
    FFECFIN_PWD.Free;
  if Assigned(FFECINI_PWD) then
    FFECINI_PWD.Free;
  if Assigned(FFECEXP) then
    FFECEXP.Free;
  inherited Destroy;
end;

initialization
  InvRegistry.RegisterInterface(TypeInfo(WSAutenticacionSoap), 'http://www.derrama.org.pe/webservices/', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(WSAutenticacionSoap), 'http://www.derrama.org.pe/webservices/%operationName%');
  RemClassRegistry.RegisterXSClass(TGE006, 'http://www.derrama.org.pe/webservices/', 'TGE006');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfTGE006), 'http://www.derrama.org.pe/webservices/', 'ArrayOfTGE006');
  RemClassRegistry.RegisterXSClass(TGE003, 'http://www.derrama.org.pe/webservices/', 'TGE003');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfTGE003), 'http://www.derrama.org.pe/webservices/', 'ArrayOfTGE003');
  RemClassRegistry.RegisterXSClass(TGE001_2, 'http://www.derrama.org.pe/webservices/', 'TGE001_2');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfTGE001_2), 'http://www.derrama.org.pe/webservices/', 'ArrayOfTGE001_2');
  InvRegistry.RegisterInvokeOptions(TypeInfo(WSAutenticacionSoap), ioDocument);
end.

//Fin HPC_201808_PRE
