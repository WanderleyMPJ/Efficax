unit Model.Dao.OrmBr;

interface

uses
  Server.Model.Conexao.Interf, ormbr.container.objectset.interfaces, Model.Dao.Interf;


Type


  TModelDaoOrmBr<M: class, constructor> = class(TInterfacedObject, iModelEntidadeDao<M>)
  private
    FCon: iConexaoModel;
    FContainer: IContainerObjectSet<M>;
  public
    Constructor Create(aCon: iConexaoModel);
    Destructor Destroy; override;
    class function New(aCon: iConexaoModel): iModelEntidadeDao<M>;
    function Get(Filtro: string; var ResultJson: string): iModelEntidadeDao<M>;
    function Post(const JSON: string): iModelEntidadeDao<M>;
    function Lista(aFiltro: string; var ResultJson: string)
      : iModelEntidadeDao<M>;
  end;



implementation

uses
  ormbr.container.objectset, System.Generics.Collections, ormbr.rest.json;


{ TModelDaoOrmBr<M> }

constructor TModelDaoOrmBr<M>.Create(aCon: iConexaoModel);
begin
  FCon := ACon;
  FContainer := TContainerObjectSet<M>.Create(FCon.DB);
end;

destructor TModelDaoOrmBr<M>.Destroy;
begin

  inherited;
end;

function TModelDaoOrmBr<M>.Get(Filtro: string;
  var ResultJson: string): iModelEntidadeDao<M>;
var
  LMasterList: TObjectList<M>;
begin
  LMasterList := TObjectList<M>.Create;
  try
      LMasterList := FContainer.FindWhere(filtro);
      ResultJson := TORMBrJson.ObjectToJsonString(LMasterList[0]);
      Result := self;
  finally
    LMasterList.Free;
  end;
end;

function TModelDaoOrmBr<M>.Lista(aFiltro: string;
  var ResultJson: string): iModelEntidadeDao<M>;
begin

end;

class function TModelDaoOrmBr<M>.New(aCon: iConexaoModel): iModelEntidadeDao<M>;
begin
  Result := self.Create(aCon);
end;

function TModelDaoOrmBr<M>.Post(const JSON: string): iModelEntidadeDao<M>;
begin

end;

end.
