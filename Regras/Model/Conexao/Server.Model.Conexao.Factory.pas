unit Server.Model.Conexao.Factory;

interface

uses
  Server.Model.Conexao.Interf, FireDAC.Comp.Client, FireDAC.stan.def,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Intf, FireDAC.Comp.UI,
  ormbr.Factory.interfaces,
  ormbr.Factory.FireDAC, ormbr.types.database, Server.Sc, Datasnap.DSSession
  ;

Type
  TConexaoModel = class(TInterfacedObject, iConexaoModel)
  private
  class var
    fDB: TFDConnection;
    FCon: IDBConnection;
    FConnectionKey: string;
    Fdrive: TDriverName;
    FServer: string;
    FDataBase: string;
    FMasterKey: string;
    FSession: TDSSession;


    procedure Conectar;


    procedure AddKeys;
    procedure DeleteKeys;
    procedure GeneratorKeys;
    procedure RecoversKeys;
  public
    constructor Create(DataBaseName: string = 'efficax';
      Server: string = 'localhost');
    destructor Destroy; override;
    class function New(DataBaseName: string = 'efficax';
      Server: string = 'localhost'): iConexaoModel;
    function Firebird: iConexaoMetadata;
    function MySql: iConexaoMetadata;
    function SqLite : iConexaoMetadata;
    function MSSql : iConexaoMetadata;
    function DB: IDBConnection;
    function ControleDeSessao: iConexaoModel ;
    function Mastekey(setMaster: string) : iConexaoModel;
    function ThisAs: iConexaoModel;
  end;

implementation

uses
  System.SysUtils, Vcl.Forms, Server.Model.Conexao.Metadata,
  ormbr.container.objectset,ormbr.dml.generator.firebird, ormbr.dml.generator.Mysql,ormbr.dml.generator.sqlite;

{ TConexaoModel }

procedure TConexaoModel.AddKeys;
begin
  GeneratorKeys;
  TSc.GetDictionary.Add(FConnectionKey, TFactoryFireDAC.Create(fDB, Fdrive));
  FCon := TSc.GetDictionary.Items[FConnectionKey] as TFactoryFireDAC;
//  TSc.GetDictionary.Add(FMasterKey, TContainerObjectSet<Tmaster>.Create(FConnection, 10));
end;

procedure TConexaoModel.Conectar;
begin
  ControleDeSessao;
//  FCon := TFactoryFireDAC.Create(FDB, dnFirebird);
//  AddKeys;
//  TSC.GetDictionary.Add(FConnectionKey, TFactoryFireDAC.Create(fDB, value));
//  FCon := TSC.GetDictionary.Items[FConnectionKey] as TFactoryFireDAC;
end;

function TConexaoModel.ControleDeSessao: iConexaoModel ;
begin
  DeleteKeys;
  AddKeys;
  RecoversKeys;
end;

constructor TConexaoModel.Create(DataBaseName: string = 'efficax';
  Server: string = 'localhost');
begin
  FDataBase := DataBaseName;
  FServer := Server;
end;

function TConexaoModel.DB: IDBConnection;
begin
  Result := FCon;
end;

procedure TConexaoModel.DeleteKeys;
begin
  GeneratorKeys;
  if TSc.GetDictionary.ContainsKey(FConnectionKey) then
    TSc.GetDictionary.Remove(FConnectionKey);
  if TSc.GetDictionary.ContainsKey(FMasterKey) then
    TSc.GetDictionary.Remove(FMasterKey);
end;

destructor TConexaoModel.Destroy;
begin
  inherited;
end;

function TConexaoModel.Firebird: iConexaoMetadata;
var
  database: string;
  SqlCriarBanco: string;
begin
  if not FileExists(ExtractFilePath(application.ExeName) + 'DataBase\') then
    ForceDirectories(ExtractFilePath(application.ExeName) + 'DataBase\');
  database := ExtractFilePath(application.ExeName) + 'DataBase\' +
    FDataBase + '.fdb';
  if not Assigned(fDB) then
  begin
    fDB := TFDConnection.Create(nil);
    fDB.Params.Add('User_Name=SYSDBA');
    fDB.Params.Add('Password=masterkey');
    fDB.Params.Add('Database=' + database);
    fDB.Params.Add('DriverID=FB');
    fDB.Params.Add('Server=' + FServer);
    Fdrive := dnFirebird;
  end;
  Conectar;
  Result := TConexaoMetadataModel.New(FCon);
end;

procedure TConexaoModel.GeneratorKeys;
begin
  FSession := TDSSessionManager.GetThreadSession;
  FConnectionKey := 'Connection_' + IntToStr(FSession.Id);
  FMasterKey := 'Master_' + IntToStr(FSession.Id);
end;

function TConexaoModel.Mastekey(setMaster: string): iConexaoModel;
begin
  setMaster := FMasterKey;
  Result := self;
end;

function TConexaoModel.MSSql: iConexaoMetadata;
begin

end;

function TConexaoModel.MySql: iConexaoMetadata;
var
  database: string;
  SqlCriarBanco: string;
begin
  database := 'efficax';
  if not Assigned(fDB) then
  begin
    fDB := TFDConnection.Create(nil);
    fDB.Params.Add('User_Name=root');
    fDB.Params.Add('Password=1234');
    fDB.Params.Add('Database=' + database);
    fDB.Params.Add('DriverID=MySQL');
    fDB.Params.Add('Server=' + FServer);
    Fdrive := dnMySql;
  end;
  Conectar;
  Result := TConexaoMetadataModel.New(FCon);
end;

class function TConexaoModel.New(DataBaseName: string = 'efficax';
  Server: string = 'localhost'): iConexaoModel;
begin
  Result := self.Create(DataBaseName, Server);
end;

procedure TConexaoModel.RecoversKeys;
begin
  GeneratorKeys;
  FCon := TSc.GetDictionary.Items[FConnectionKey] as TFactoryFireDAC;
//  FContainerMaster := TServerContainer1.GetDictionary.Items[FMasterKey] as TContainerObjectSet<Tmaster>;
end;

function TConexaoModel.SqLite: iConexaoMetadata;
var
  database: string;
  SqlCriarBanco: string;
begin
  if not FileExists(ExtractFilePath(application.ExeName) + 'DataBase\') then
    ForceDirectories(ExtractFilePath(application.ExeName) + 'DataBase\');
  database := ExtractFilePath(application.ExeName) + 'DataBase\' +
    FDataBase + '.db';
  if not Assigned(fDB) then
  begin
    fDB := TFDConnection.Create(nil);
    fDB.Params.Add('User_Name=SYSDBA');
    fDB.Params.Add('Password=masterkey');
    fDB.Params.Add('Database=' + database);
    fDB.Params.Add('DriverID=SQLite');
    fDB.Params.Add('Server=' + FServer);
    fdb.loginprompt := false;
    Fdrive := dnSQLite;
  end;
  Conectar;
  Result := TConexaoMetadataModel.New(FCon);
end;

function TConexaoModel.ThisAs: iConexaoModel;
begin
  Result := self;
end;

end.
