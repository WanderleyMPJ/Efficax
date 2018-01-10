unit Server.Model.Conexao.Metadata;

interface

uses
  Server.Model.Conexao.Interf,
  ormbr.factory.interfaces,
  ormbr.factory.firedac,
  ormbr.factory.dbexpress,
  ormbr.ddl.commands,
  ormbr.ddl.generator.mysql,
  ormbr.ddl.generator.firebird,
  ormbr.ddl.generator.sqlite,
  ormbr.database.abstract,
  ormbr.modeldb.compare,
  ormbr.database.compare,
  ormbr.database.interfaces,
  ormbr.types.database,
  ormbr.metadata.firebird, ormbr.metadata.mysql,
  ormbr.metadata.sqlite,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.Phys.MongoDBDataSet, FireDAC.Comp.DataSet, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteDef,
  FireDAC.Phys.IBDef, FireDAC.Phys.IB, FireDAC.Phys.SQLite, FireDAC.Phys.IBBase,
  Data.DBXMSSQL, Data.FMTBcd, Data.SqlExpr, FireDAC.Comp.ScriptCommands,
  FireDAC.Stan.Util, FireDAC.Comp.Script, FireDAC.Phys.Oracle,
  FireDAC.Phys.OracleDef;

Type
  TConexaoMetadataModel = class(TInterfacedObject, iConexaoMetadata)
  private
    FCon: idbconnection;
    FMetadata: TModelDbCompare;
  public
    constructor Create(const Con: idbconnection);
    destructor Destroy; override;
    class function New(const FCon: idbconnection): iConexaoMetadata;
    function BuildDatabase: iConexaoMetadata;
    function Sql: iConexaoMetadata;
    function ThisAs: iConexaoMetadata;
  end;

implementation

{ TConexaoMetadataModel }

constructor TConexaoMetadataModel.Create(const Con: idbconnection);
begin
  Fcon := Con;
  FMetadata := TModelDbCompare.Create(FCon);
  FMetadata.CommandsAutoExecute := true;
end;

function TConexaoMetadataModel.BuildDatabase: iConexaoMetadata;
begin
  Result := Self;
  FMetadata.BuildDatabase;
end;

destructor TConexaoMetadataModel.Destroy;
begin

  inherited;
end;

class function TConexaoMetadataModel.New(const FCon: idbconnection): iConexaoMetadata;
begin
  Result := Self.Create(FCon);
end;

function TConexaoMetadataModel.Sql: iConexaoMetadata;
begin

end;

function TConexaoMetadataModel.ThisAs: iConexaoMetadata;
begin
  Result := Self;
end;

end.
