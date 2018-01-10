unit Server.Controller.Cadastros.Strategy;

interface

uses
  Server.Controller.Interf;

Type

  TCadastroStrategy = (Pessoa, Telefone, Servicos);

  TCadastroStrategyHelper = record helper for TCadastroStrategy
  public
    function Lista(Filtro: string): iServerControllerMetodosGet;
  end;

implementation

uses
  Server.Controller, Server.Controller.Conexao.Strategy;


{ TCadastroStrategyHelper }

function TCadastroStrategyHelper.Lista(Filtro: string): iServerControllerMetodosGet;
begin
  case self of
    Pessoa:
//      TServerController.New(db.CriarBanco).Dao.Pessoa.Lista(Filtro, Result)
      ;
    Telefone:
      ;
    Servicos:
//      TServerController.New(db.CriarBanco).Dao.Servico.Lista(Filtro, Result)
      ;
  end;
end;

end.
