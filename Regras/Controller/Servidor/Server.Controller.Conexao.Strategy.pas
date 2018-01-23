unit Server.Controller.Conexao.Strategy;

interface

uses
  Server.Model.Conexao.Interf, Server.Controller.Interf;

Type

  TConexaoDBStrategy = (DB);

  TConexaoStrategy = (Pessoas, Servicos, ServicosGrupo);

  TConexaoDBStrategyHelper = record helper for TConexaoDBStrategy
  private
    class var FConection: iConexaoModel;
    function Conectar: iConexaoModel;

  public
    function GetConection: iConexaoModel;
  end;

  TConexaoStrategyHelper = record helper for TConexaoStrategy
  private

  public
    function Dao: iServerControllerMetodos;
  end;

implementation

uses
  Server.Model.Conexao.Factory, Server.Controller;

{ TConexaoStrategyHelper }

function TConexaoStrategyHelper.Dao: iServerControllerMetodos;
begin
  case self of
    Pessoas:
      Result := TServerController.New(DB.GetConection).Dao.Pessoas;
    Servicos:
      Result := TServerController.New(DB.GetConection).Dao.Servico;
    ServicosGrupo:
      Result := TServerController.New(DB.GetConection).Dao.ServicoGrupo;
  end;
end;

{ TConexaoDBStrategyHelper }

function TConexaoDBStrategyHelper.Conectar: iConexaoModel;
begin
  TConexaoModel.New().Firebird.BuildDatabase;
  FConection := TConexaoModel.New().ThisAs;
  Result := FConection;
end;

function TConexaoDBStrategyHelper.GetConection: iConexaoModel;
begin
  if not Assigned(FConection) then
    Conectar;
  Result := FConection;
end;

end.
