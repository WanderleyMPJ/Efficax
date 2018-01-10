unit Server.Sc;

interface

uses System.SysUtils, System.Classes,
  Datasnap.DSServer, Datasnap.DSCommonServer,
  IPPeerServer, IPPeerAPI, Datasnap.DSAuth, System.Generics.Collections;

type
  TSc = class(TDataModule)
    DSServer1: TDSServer;
    DSAuthenticationManager1: TDSAuthenticationManager;
    DSServerClass1: TDSServerClass;
    procedure DSServerClass1GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSAuthenticationManager1UserAuthorize(Sender: TObject;
      EventObject: TDSAuthorizeEventObject; var valid: Boolean);
    procedure DSAuthenticationManager1UserAuthenticate(Sender: TObject;
      const Protocol, Context, User, Password: string; var valid: Boolean;
      UserRoles: TStrings);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    class var FSession: TDictionary<string, TObject>;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    class function GetDictionary: TDictionary<string, TObject>;

  end;

function DSServer: TDSServer;
function DSAuthenticationManager: TDSAuthenticationManager;

implementation


{$R *.dfm}

uses Server.SM.Cadastros;

var
  FModule: TComponent;
  FDSServer: TDSServer;
  FDSAuthenticationManager: TDSAuthenticationManager;

function DSServer: TDSServer;
begin
  Result := FDSServer;
end;

function DSAuthenticationManager: TDSAuthenticationManager;
begin
  Result := FDSAuthenticationManager;
end;

constructor TSc.Create(AOwner: TComponent);
begin
  inherited;
  FDSServer := DSServer1;
  FDSAuthenticationManager := DSAuthenticationManager1;
end;

procedure TSc.DataModuleCreate(Sender: TObject);
begin
  FSession := TDictionary<string, TObject>.Create;
end;

procedure TSc.DataModuleDestroy(Sender: TObject);
begin
  FSession.Clear;
  FSession.Free;
end;

destructor TSc.Destroy;
begin
  inherited;
  FDSServer := nil;
  FDSAuthenticationManager := nil;
end;

procedure TSc.DSServerClass1GetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := Server.SM.Cadastros.TSMCadastros;
end;

class function TSc.GetDictionary: TDictionary<string, TObject>;
begin
  Result := FSession;
end;

procedure TSc.DSAuthenticationManager1UserAuthenticate(
  Sender: TObject; const Protocol, Context, User, Password: string;
  var valid: Boolean; UserRoles: TStrings);
begin
  { TODO : Validate the client user and password.
    If role-based authorization is needed, add role names to the UserRoles parameter  }
  valid := True;
end;

procedure TSc.DSAuthenticationManager1UserAuthorize(
  Sender: TObject; EventObject: TDSAuthorizeEventObject;
  var valid: Boolean);
begin
  { TODO : Authorize a user to execute a method.
    Use values from EventObject such as UserName, UserRoles, AuthorizedRoles and DeniedRoles.
    Use DSAuthenticationManager1.Roles to define Authorized and Denied roles
    for particular server methods. }
  valid := True;
end;

initialization
  FModule := TSc.Create(nil);
finalization
  FModule.Free;
end.

