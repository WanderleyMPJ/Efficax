unit Server.Model.Conexao.Metadata.Database;

interface

uses
  ormbr.modeldb.compare, FireDAC.Comp.Client,
  ormbr.factory.interfaces, ormbr.metadata.mysql, ormbr.metadata.firebird,
  Server.Model.Conexao.Interf;

Type
  TConexaoMetadataDatabaseModel = class(TInterfacedObject, iConexaoMetadata)
  private
    FParent   : iConexaoModel;
    FMetadata : TModelDbCompare;
  public
    constructor Create(Parent: iConexaoModel);
    destructor Destroy; override;
    class function New(Parent: iConexaoModel): iConexaoMetadata;
    function BuildDatabase: iConexaoMetadata;

  end;

implementation

{ TConexaoMetadataDatabaseModel }

function TConexaoMetadataDatabaseModel.BuildDatabase: iConexaoMetadata;
begin
  Result := Self;
  FMetadata.BuildDatabase;
end;

constructor TConexaoMetadataDatabaseModel.Create(Parent: iConexaoModel);
begin
  FMetadata := TModelDbCompare.Create(FParent.Con);
  FMetadata.CommandsAutoExecute := true;
end;

destructor TConexaoMetadataDatabaseModel.Destroy;
begin
  inherited;
end;

class function TConexaoMetadataDatabaseModel.New(Parent: iConexaoModel): iConexaoMetadata;
begin
  Result := Self.Create(Parent);
end;

end.
