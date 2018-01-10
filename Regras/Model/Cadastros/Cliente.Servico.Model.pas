unit Cliente.Servico.Model;

interface

uses
  Cliente.Conection.Model.Interf, MVCBr.Interf, Cliente.Rest,
  Datasnap.DSClientRest, Entidade.Servico, Entidade.Interf, FMX.Grid,
  System.Generics.Collections, System.Classes, entidade.model;

Type
  TServicoModel = class(TInterfacedObject, iOperacoes)
  private
    FRestCon : TDSRestConnection;
    FRestCli : TSMCadastrosClient;
    FLista : TObjectList<TServico>;
  public
    constructor Create(RestCon: TDSRestConnection);
    destructor Destroy; override;

    class function New(RestCon: TDSRestConnection): iOperacoes; overload;
    class function New(RestCon: TDSRestConnection; aEntidade: TServico; aLista : TObjectList<TServico> ): iOperacoes; overload;
    class function New(RestCon: TDSRestConnection; aLista : TObjectList<TServico> ): iOperacoes; overload;

    function Lista(Filtro: string): iOperacoes;

    function Post(var AValue: iEntidade): iOperacoes;
    function ToObjectList: TObjectList<TServico>;
  end;
implementation

uses
  json, ormbr.rest.json,ormbr.jsonutils.datasnap;
{ TServicoModel }

constructor TServicoModel.Create(RestCon: TDSRestConnection);
begin
  FRestCon := RestCon;
  FRestCli := TSMCadastrosClient.Create(FRestCon);
end;

destructor TServicoModel.Destroy;
begin
    inherited;
end;



function TServicoModel.Lista(Filtro: string): iOperacoes;
var
  LJson : string;
  v     : TList;
begin
  LJSON   :=  FRestCli.ServicoLista(Filtro);
  flista  := TORMBrJson.JsonToObjectList<TServico>(LJson);
  Result  := self;
end;

class function TServicoModel.New(RestCon: TDSRestConnection;
  aEntidade: TServico; aLista: TObjectList<TServico>): iOperacoes;
begin

end;

class function TServicoModel.New(RestCon: TDSRestConnection;
  aLista: TObjectList<TServico>): iOperacoes;
begin

end;

class function TServicoModel.New(RestCon: TDSRestConnection): iOperacoes;
begin
  Result := self.Create(RestCon);
end;

function TServicoModel.Post(var AValue: iEntidade): iOperacoes;
var
  LMaster: TServico;
  Json : string;
begin
  LMaster := AValue as TServico;
  JSon := TORMBrJson.ObjectToJsonString(LMaster);
  FRestCli.ServicoPut(Json);
  Result := self;
end;

function TServicoModel.ToObjectList: TObjectList<TServico>;
begin
  Result := FLista;
end;

end.
