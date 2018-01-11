unit Server.Controller.Dao;

interface

uses
  Server.Controller.Interf, Server.Model.Conexao.Interf;

Type
  TControllerDao = class(TInterfacedObject, iServerControllerDao)
  private
    FCon: iConexaoModel;
  public
    constructor Create(const ACon: iConexaoModel);
    destructor Destroy; override;
    class function New(const ACon: iConexaoModel): iServerControllerDao;
    function Pessoas: iServerControllerMetodos;
    function Servico: iServerControllerMetodos;
    function ServicoGrupo: iServerControllerMetodos;

  end;

implementation

uses
  Server.Controller.Dao.Servico, Servidor.Controller.Servico.Grupo,
  Servidor.Controller.Pessoas;

{ TControllerDao }

constructor TControllerDao.Create(const ACon: iConexaoModel);
begin
  Fcon := ACon;
end;

destructor TControllerDao.Destroy;
begin
    inherited;
end;


class function TControllerDao.New(const ACon: iConexaoModel): iServerControllerDao;
begin
  Result := self.Create(ACon);
end;

function TControllerDao.Pessoas: iServerControllerMetodos;
begin
  Result := TServerControllerDaoPessoas.New(FCon);
end;

function TControllerDao.Servico: iServerControllerMetodos;
begin
  Result := TServerControllerDaoServico.New(FCon);
end;

function TControllerDao.ServicoGrupo: iServerControllerMetodos;
begin
  Result := TServerControllerDaoServicoGrupo.New(FCon);
end;

end.
