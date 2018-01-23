unit Server.SM.Cadastros;

interface

uses System.SysUtils, System.Classes, System.Json, REST.JSON,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth, Server.Controller.Cadastros.Strategy;

type

  TSMCadastros = class(TDSServerModule)
  private
    { Private declarations }
  public
    { Public declarations }
    function PessoasGet(id: integer): string;
    function PessoasLista(aFiltro: string) : String;
    function PessoasPut(oldId: integer; const AJson: TJSONArray): string;

    function ServicoGet(id: integer) : String;
    function ServicoLista(aFiltro: string) : String;
    function ServicoPut(oldId: integer; const  AJson: TJSONArray): string;

    function ServicoGrupoGet(id: integer) : String;
    function ServicoGrupoLista(aFiltro: string) : String;
    function ServicoGrupoPut(oldId: integer; const AJson: TJSONArray): string;

  end;

implementation


{$R *.dfm}


uses System.StrUtils, Server.Controller, Server.Controller.Conexao.Strategy;

function TSMCadastros.PessoasGet(id: integer): string;
begin
  Pessoas.Dao.Get(ID, Result);
end;

function TSMCadastros.PessoasLista(aFiltro: string): String;
begin
  Pessoas.Dao.Lista(aFiltro, Result);
end;

function TSMCadastros.PessoasPut(oldId: integer; const AJson: TJSONArray): string;
begin
  Pessoas.Dao.Post(oldid, AJson);
end;

function TSMCadastros.ServicoGet(id: integer) : String;
begin
  Servicos.Dao.Get(ID, Result);
end;

function TSMCadastros.ServicoGrupoGet(id: integer): String;
begin
  ServicosGrupo.Dao.Get(ID, Result);
end;

function TSMCadastros.ServicoGrupoLista(aFiltro: string): String;
begin
  ServicosGrupo.Dao.Lista(aFiltro, Result);
end;

function TSMCadastros.ServicoGrupoPut(oldId: integer; const AJson: TJSONArray): string;
begin
  ServicosGrupo.Dao.Post(oldid, AJson);
end;

function TSMCadastros.ServicoLista(aFiltro: string): String;
begin
  Servicos.Dao.Lista(aFiltro, Result);
end;

function TSMCadastros.ServicoPut(oldId: integer; const  AJson: TJSONArray): string;
begin
  Servicos.Dao.Post(oldid, AJson);
end;

end.

