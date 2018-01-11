unit Server.Controller.Conexao.Strategy;

interface

uses
  Server.Model.Conexao.Interf, Server.Controller.Interf;

Type



  TConexaoStrategy = (Pessoas, Servicos, ServicosGrupo);

  TConexaoStrategyHelper = record helper for TConexaoStrategy
  private
    class var FConection: iConexaoModel;
    function Conectar : iConexaoModel;
    function GetConection: iConexaoModel;

  public
    function CriarBanco : iConexaoModel;
    function Dao : iServerControllerMetodos;
  end;

implementation

uses
  Server.Model.Conexao.Factory, Server.Controller;

{ TConexaoStrategyHelper }

function TConexaoStrategyHelper.Conectar: iConexaoModel;
begin
  TConexaoModel.New().Firebird.BuildDatabase;
  fconection := tconexaomodel.New().ThisAs;
  Result      := FConection;
end;

function TConexaoStrategyHelper.CriarBanco: iConexaoModel;
begin
  Result := Conectar;
end;

function TConexaoStrategyHelper.Dao: iServerControllerMetodos;
begin
  case self of
    Pessoas:
     Result := TServerController.New(GetConection).Dao.Pessoas;
    Servicos:
      Result := TServerController.New(GetConection).Dao.Servico;
    ServicosGrupo:
      Result := TServerController.New(GetConection).Dao.ServicoGrupo;
  end;
end;

function TConexaoStrategyHelper.GetConection: iConexaoModel;
begin
  if not Assigned(Fconection) then
    conectar;
  Result := fconection;
end;

end.
