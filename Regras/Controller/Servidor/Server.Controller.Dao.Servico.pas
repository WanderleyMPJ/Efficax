unit Server.Controller.Dao.Servico;

interface

uses
  Server.Controller.Interf, Server.Model.Conexao.Interf, System.JSON,
  ormbr.container.objectset.interfaces, Entidade.Servico;

Type
  TServerControllerDaoServico = class(TInterfacedObject,
    iServerControllerMetodos)
  private
//    FMaster: IContainerObjectSet<TServico>;
    FCon: iConexaoModel;
    FContainer: IContainerObjectSet<TServico>;
    FMasterKey: string;

  public
    constructor Create(const ACon: iConexaoModel);
    destructor Destroy; override;
    class function New(const ACon: iConexaoModel): iServerControllerMetodos;
    function Get(id: integer; var ResultJson: string): iServerControllerMetodos;
    function Post(const JSON: string): iServerControllerMetodos;
    function Lista(aFiltro: string; var ResultJson: string)
      : iServerControllerMetodos;
  end;

implementation

uses

  Servidor.Controller.Servico, System.Generics.Collections, ormbr.rest.JSON,
  System.SysUtils, Server.Sc, ormbr.container.objectset,
  ormbr.jsonutils.datasnap;

{ TServerControllerDaoServico }

constructor TServerControllerDaoServico.Create(const ACon: iConexaoModel);
begin
  FCon := ACon;
  FContainer := TContainerObjectSet<TServico>.Create(FCon.DB);
end;

destructor TServerControllerDaoServico.Destroy;
begin

  inherited;
end;

function TServerControllerDaoServico.Get(id: integer; var ResultJson: string)
  : iServerControllerMetodos;
var
  LMasterList: TObjectList<TServico>;
begin
  LMasterList := TObjectList<TServico>.Create;
  try
    try
      LMasterList := FContainer.FindWhere('Servico_id =' + IntToStr(id));
      ResultJson := TORMBrJson.ObjectToJsonString(LMasterList[0]);
      Result := self;
    except
      on E: Exception do
        raise Exception.Create('Erro Buscando no banco de dados. Erro: ' +
          E.message);
    end;
  finally
    LMasterList.Free;
  end;
end;

function TServerControllerDaoServico.Lista(aFiltro: string;
  var ResultJson: string): iServerControllerMetodos;
var
  LMasterList: TObjectList<TServico>;
begin
  LMasterList := TObjectList<TServico>.Create;
  try
    try
      if aFiltro = '' then
        LMasterList := FContainer.Find
      else
        LMasterList := FContainer.FindWhere(aFiltro);
      ResultJson := TORMBrJson.ObjectToJsonString(LMasterList);
      Result := self;
    except
      on E: Exception do
        raise Exception.Create('Erro Buscando no banco de dados. Erro: ' +
          E.message);
    end;
  finally
    LMasterList.Free;
  end;
end;

class function TServerControllerDaoServico.New(const ACon: iConexaoModel)
  : iServerControllerMetodos;
begin
  Result := self.Create(ACon);
end;

function TServerControllerDaoServico.Post(const JSON: string)
  : iServerControllerMetodos;
var
  oMasterNew, oMasterOld: TServico;
begin
  // try
  oMasterNew := TORMBrJson.JSONToObject<TServico>(JSON);

  if oMasterNew.Servico_id <= 0 then
    FContainer.Insert(oMasterNew)
  else
  begin
    OMasterOld := FContainer.Find(oMasternew.Servico_id);
    FContainer.Modify(oMasterOld);
    FContainer.Update(oMasterNew);
  end;
  // except
  // on E: exception do
  // raise exception.Create('Erro ao gravar no Banco de Dados. Erro: ' +
  // E.Message);
  // end;
end;

end.
