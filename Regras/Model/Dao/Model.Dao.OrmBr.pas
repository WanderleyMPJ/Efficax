unit Model.Dao.OrmBr;

interface

uses
  Server.Model.Conexao.Interf, OrmBr.container.objectset.interfaces,
  Model.Dao.Interf, System.JSON;

Type

  TModelDaoOrmBr<M: class, constructor> = class(TInterfacedObject,
    iModelEntidadeDao<M>)
  private
    FCon: iConexaoModel;
    FContainer: IContainerObjectSet<M>;
  public
    Constructor Create(aCon: iConexaoModel);
    Destructor Destroy; override;
    class function New(aCon: iConexaoModel): iModelEntidadeDao<M>;
    function Get(Filtro: string; var ResultJson: string): iModelEntidadeDao<M>;
    function Post(oldId: integer; const JSON: TJSONArray): iModelEntidadeDao<M>;
    function Lista(aFiltro: string; var ResultJson: string)
      : iModelEntidadeDao<M>;
  end;

implementation

uses
  OrmBr.container.objectset, System.Generics.Collections, OrmBr.rest.JSON;

{ TModelDaoOrmBr<M> }

constructor TModelDaoOrmBr<M>.Create(aCon: iConexaoModel);
begin
  FCon := aCon;
  FContainer := TContainerObjectSet<M>.Create(FCon.DB);
end;

destructor TModelDaoOrmBr<M>.Destroy;
begin

  inherited;
end;

function TModelDaoOrmBr<M>.Get(Filtro: string; var ResultJson: string)
  : iModelEntidadeDao<M>;
var
  LMasterList: TObjectList<M>;
begin
  LMasterList := TObjectList<M>.Create;
  try
    LMasterList := FContainer.FindWhere(Filtro);
    ResultJson := TORMBrJson.ObjectToJsonString(LMasterList[0]);
    Result := self;
  finally
    LMasterList.Free;
  end;
end;

function TModelDaoOrmBr<M>.Lista(aFiltro: string; var ResultJson: string)
  : iModelEntidadeDao<M>;
var
  LMasterList: TObjectList<M>;
begin
  LMasterList := TObjectList<M>.Create;
  try
    if aFiltro = '' then
      LMasterList := FContainer.Find
    else
      LMasterList := FContainer.FindWhere(aFiltro);
    ResultJson := TORMBrJson.ObjectToJsonString(LMasterList);
    Result := self;
  finally
    LMasterList.Free;
  end;
end;

class function TModelDaoOrmBr<M>.New(aCon: iConexaoModel): iModelEntidadeDao<M>;
begin
  Result := self.Create(aCon);
end;

function TModelDaoOrmBr<M>.Post(oldId: integer; const JSON: TJSONArray)
  : iModelEntidadeDao<M>;
var
  LMasterList: TObjectList<M>;
  LMasterUpdate: M;
  LFor: integer;
begin
  LMasterList := TORMBrJson.JsonToObjectList<M>(JSON.ToJSON);
  try
    for LFor := 0 to LMasterList.Count - 1 do
    begin
      LMasterUpdate := FContainer.Find(oldId);
      FContainer.Modify(LMasterUpdate);
      FContainer.Update(LMasterList.Items[LFor]);
    end;
  finally
    LMasterList.Clear;
    LMasterList.Free;
  end;
end;

end.
