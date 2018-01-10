unit Server.Controller.Dao.Metodos.Get;

interface

uses
  Server.Controller.Interf, Entidade.Interf, System.JSON,
  System.Generics.Collections, ormbr.container.objectset.interfaces;

Type
  TServerControllerDaoMetodosGet<M: class, constructor> = class(TInterfacedObject, iServerControllerMetodosGet)
  private
    FFiltro : string;
    FContainerMaster: IContainerObjectSet<M>;

  public

    constructor Create(AFiltro: string = '');
    destructor Destroy; override;
    class function New(AFiltro: string = ''): iServerControllerMetodosGet;
    function ToEntidade: iEntidade;
    function ToJson: String;

  end;
implementation

uses
  ormbr.jsonutils.datasnap;

{ TServerControllerDaoMetodosGet<M> }

constructor TServerControllerDaoMetodosGet<M>.Create(AFiltro: string);
begin
  FFiltro := AFiltro;
end;

destructor TServerControllerDaoMetodosGet<M>.Destroy;
begin

  inherited;
end;

class function TServerControllerDaoMetodosGet<M>.New(
  AFiltro: string): iServerControllerMetodosGet;
begin
  Self.Create(AFiltro);
end;

function TServerControllerDaoMetodosGet<M>.ToEntidade: iEntidade;
var
  LMasterList: TObjectList<M>;
begin
//  ControleDeSessao;

  LMasterList := TObjectList<M>.Create;
  try
    if FFiltro = '' then
      LMasterList := FContainerMaster.Find
    else
      LMasterList := FContainerMaster.FindWhere(FFiltro);
//    Result := TORMBrJSONUtil.JSONStringToJSONArray<M>(LMasterList);
    Result := iEntidade(Lmasterlist.Items[0]);
  finally
    LMasterList.Free;
  end;
end;

function TServerControllerDaoMetodosGet<M>.ToJson: TJSONArray;
begin

end;

end.
