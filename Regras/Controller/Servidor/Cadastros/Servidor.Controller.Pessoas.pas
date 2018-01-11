unit Servidor.Controller.Pessoas;

interface

uses
  Server.Controller.Interf, Server.Model.Conexao.Interf, System.JSON,
  ormbr.container.objectset.interfaces,

  Entidade.Pessoas, Model.Dao.Interf, Model.Dao.OrmBr;

Type
  TServerControllerDaoPessoas = class(TInterfacedObject,
    iServerControllerMetodos)
  private
    Dao : iModelEntidadeDao<TPessoas>;
    FCon: iConexaoModel;
  public
    constructor Create(const ACon: iConexaoModel);
    destructor Destroy; override;
    class function New(const ACon: iConexaoModel): iServerControllerMetodos;
    function Get(id: integer; var ResultJson: string): iServerControllerMetodos;
    function Post(oldId: integer; const JSON: string)
  : iServerControllerMetodos;
    function Lista(aFiltro: string; var ResultJson: string)
      : iServerControllerMetodos;
  end;

implementation

uses
  System.SysUtils;

{ TServerControllerDaoPessoas }

constructor TServerControllerDaoPessoas.Create(const ACon: iConexaoModel);
begin
  FCon := ACon;
  Dao := TModelDaoOrmBr<TPessoas>.New(fcon);
end;

destructor TServerControllerDaoPessoas.Destroy;
begin

  inherited;
end;

function TServerControllerDaoPessoas.Get(id: integer; var ResultJson: string)
  : iServerControllerMetodos;
begin
  dao.Get('Pessoas_id=' + inttostr(id), ResultJson);
end;

function TServerControllerDaoPessoas.Lista(aFiltro: string;
  var ResultJson: string): iServerControllerMetodos;
begin
  Dao.Lista(aFiltro, ResultJson);
end;

class function TServerControllerDaoPessoas.New(const ACon: iConexaoModel)
  : iServerControllerMetodos;
begin
  Result := self.Create(ACon);
end;

function TServerControllerDaoPessoas.Post(oldId: integer; const JSON: string)
  : iServerControllerMetodos;
begin
  Dao.Post(OldID, JSON) ;
end;

end.
