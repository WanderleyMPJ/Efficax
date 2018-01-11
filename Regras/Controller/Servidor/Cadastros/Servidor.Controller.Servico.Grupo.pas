unit Servidor.Controller.Servico.Grupo;

interface

uses
  Server.Controller.Interf, Server.Model.Conexao.Interf, System.JSON,
  ormbr.container.objectset.interfaces,

  Entidade.Servico.Grupo, Model.Dao.Interf, Model.Dao.OrmBr;

Type
  TServerControllerDaoServicoGrupo = class(TInterfacedObject,
    iServerControllerMetodos)
  private
    Dao : iModelEntidadeDao<TServicoGrupo>;
    FCon: iConexaoModel;
  public
    constructor Create(const ACon: iConexaoModel);
    destructor Destroy; override;
    class function New(const ACon: iConexaoModel): iServerControllerMetodos;
    function Get(id: integer; var ResultJson: string): iServerControllerMetodos;
    function Post(oldId: integer; const JSON: string): iServerControllerMetodos;
    function Lista(aFiltro: string; var ResultJson: string)
      : iServerControllerMetodos;
  end;

implementation

uses

  System.Generics.Collections, ormbr.rest.JSON,
  System.SysUtils, Server.Sc, ormbr.container.objectset,
  ormbr.jsonutils.datasnap  ;

{ TServerControllerDaoServicoGrupo }

constructor TServerControllerDaoServicoGrupo.Create(const ACon: iConexaoModel);
begin
  FCon := ACon;
  Dao := TModelDaoOrmBr<TServicoGrupo>.New(fcon);
end;

destructor TServerControllerDaoServicoGrupo.Destroy;
begin

  inherited;
end;

function TServerControllerDaoServicoGrupo.Get(id: integer; var ResultJson: string)
  : iServerControllerMetodos;
begin
  dao.Get('ServicoGrupo_id=' + inttostr(id), ResultJson);
end;

function TServerControllerDaoServicoGrupo.Lista(aFiltro: string;
  var ResultJson: string): iServerControllerMetodos;
begin
  Dao.Lista(aFiltro, ResultJson);
end;

class function TServerControllerDaoServicoGrupo.New(const ACon: iConexaoModel)
  : iServerControllerMetodos;
begin
  Result := self.Create(ACon);
end;

function TServerControllerDaoServicoGrupo.Post(oldId: integer; const JSON: string): iServerControllerMetodos;
begin
  Dao.Post(oldid, JSON) ;
end;

end.
