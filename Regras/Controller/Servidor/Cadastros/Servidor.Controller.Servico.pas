unit Servidor.Controller.Servico;

interface

uses
  Server.Controller.Interf, Entidade.Interf, System.JSON,
  System.Generics.Collections, ormbr.container.objectset.interfaces,
  Entidade.Servico, Server.Model.Conexao.Interf;

Type
  TServidorControllerServicoGet = class(TInterfacedObject, iServerControllerMetodosGet)
  private
    FCon : iConexaoModel;
    FFiltro: string;
    FMasterKey : string;

    FContainerMaster: IContainerObjectSet<TServico>;


  public
    constructor Create(Const AFiltro: string; Const Con : iConexaoModel);
    destructor Destroy; override;
    class function New(Const AFiltro: string; Const Con : iConexaoModel): iServerControllerMetodosGet;
    function ToEntidade: iEntidade;
    function ToJson: String;

  end;
implementation

uses
  ormbr.jsonutils.datasnap, ormbr.container.objectset, Server.Sc,
  ormbr.rest.json, System.SysUtils;


{ TServidorControllerSerivco }

constructor TServidorControllerServicoGet.Create(Const AFiltro: string; Const Con : iConexaoModel);
begin
  FCon := Con;
  FFiltro := AFiltro;
  FContainerMaster := TContainerObjectSet<TServico>.Create(FCon.DB);
end;

destructor TServidorControllerServicoGet.Destroy;
begin
    inherited;
end;

class function TServidorControllerServicoGet.New(Const AFiltro: string; Const Con : iConexaoModel): iServerControllerMetodosGet;
begin
  Result := self.Create(Afiltro, Con);
end;

function TServidorControllerServicoGet.ToEntidade: iEntidade;
bEgin
end;

function TServidorControllerServicoGet.ToJson: String;
var
  LMasterList: TObjectList<TServico>;
begin
  LMasterList := TObjectList<TServico>.Create;
  try
    try
    if FFiltro = '' then
      LMasterList := FContainerMaster.Find
    else
      LMasterList := FContainerMaster.FindWhere(FFiltro);
    Result := TORMBrJson.ObjectToJsonString(lmasterlist);
    except
      on E: Exception do
        raise Exception.Create('Erro Buscando no banco de dados. Erro: '+e.message);
    end;
  finally
    LMasterList.Free;
  end;
end;

end.
