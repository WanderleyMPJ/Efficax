unit Servidor.Controller.Servico.Grupo;

interface

uses
  Server.Controller.Interf, Server.Model.Conexao.Interf, System.JSON,
  ormbr.container.objectset.interfaces,

  Entidade.Servico.Grupo;

Type
  TServerControllerDaoServicoGrupo = class(TInterfacedObject,
    iServerControllerMetodos)
  private
//    FMaster: IContainerObjectSet<TServicoGrupo>;
    FCon: iConexaoModel;
    FContainer: IContainerObjectSet<TServicoGrupo>;
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

  System.Generics.Collections, ormbr.rest.JSON,
  System.SysUtils, Server.Sc, ormbr.container.objectset,
  ormbr.jsonutils.datasnap;

{ TServerControllerDaoServicoGrupo }

constructor TServerControllerDaoServicoGrupo.Create(const ACon: iConexaoModel);
begin
  FCon := ACon;
  FContainer := TContainerObjectSet<TServicoGrupo>.Create(FCon.DB);
end;

destructor TServerControllerDaoServicoGrupo.Destroy;
begin

  inherited;
end;

function TServerControllerDaoServicoGrupo.Get(id: integer; var ResultJson: string)
  : iServerControllerMetodos;
var
  LMasterList: TObjectList<TServicoGrupo>;
begin
  LMasterList := TObjectList<TServicoGrupo>.Create;
  try
    try
      LMasterList := FContainer.FindWhere('ServicoGrupo_id =' + IntToStr(id));
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

function TServerControllerDaoServicoGrupo.Lista(aFiltro: string;
  var ResultJson: string): iServerControllerMetodos;
var
  LMasterList: TObjectList<TServicoGrupo>;
begin
  LMasterList := TObjectList<TServicoGrupo>.Create;
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

class function TServerControllerDaoServicoGrupo.New(const ACon: iConexaoModel)
  : iServerControllerMetodos;
begin
  Result := self.Create(ACon);
end;

function TServerControllerDaoServicoGrupo.Post(const JSON: string)
  : iServerControllerMetodos;
var
  oMasterNew, oMasterOld: TServicoGrupo;
begin
  // try
  oMasterNew := TORMBrJson.JSONToObject<TServicoGrupo>(JSON);

  if oMasterNew.ServicoGrupo_id <= 0 then
    FContainer.Insert(oMasterNew)
  else
  begin
    OMasterOld := FContainer.Find(oMasternew.ServicoGrupo_id);
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
