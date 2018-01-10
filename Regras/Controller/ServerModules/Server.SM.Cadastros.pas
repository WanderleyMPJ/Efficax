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
    function PessoaGet: string;

    function ServicoGet(id: integer) : String;
    function ServicoLista(aFiltro: string) : String;
    function ServicoPut(const  AJson: String): string;

    function ServicoGrupoGet(id: integer) : String;
    function ServicoGrupoLista(aFiltro: string) : String;
    function ServicoGrupoPut(const  AJson: String): string;

  end;

implementation


{$R *.dfm}


uses System.StrUtils, Server.Controller, Server.Controller.Conexao.Strategy;

function TSMCadastros.PessoaGet: string;
begin
//  Result := TJson.ObjectToJsonString(TObject(Pessoa.Get('').ToEntidade));
end;

function TSMCadastros.ServicoGet(id: integer) : String;
begin
  TServerController.New(db.Conection).Dao.Servico.Get(ID, Result);
end;

function TSMCadastros.ServicoGrupoGet(id: integer): String;
begin
  TServerController.New(db.Conection).Dao.ServicoGrupo.Get(ID, Result);
end;

function TSMCadastros.ServicoGrupoLista(aFiltro: string): String;
var
  s: string;
begin
  TServerController.New(db.Conection).Dao.ServicoGrupo.Lista(aFiltro, s);
  Result := s;
end;

function TSMCadastros.ServicoGrupoPut(const AJson: String): string;
begin
  TServerController.New(db.Conection).Dao.ServicoGrupo.Post(AJson);
end;

function TSMCadastros.ServicoLista(aFiltro: string): String;
var
  s: string;
begin
  TServerController.New(db.Conection).Dao.Servico.Lista(aFiltro, s);
  Result := s;
end;

function TSMCadastros.ServicoPut(const  AJson: String): string;
begin
  TServerController.New(db.Conection).Dao.Servico.Post(AJson);
end;

end.

