unit Server.Controller;

interface

uses
  Server.Controller.Interf, Server.Model.Conexao.Interf;

Type
  TServerController = class(TInterfacedObject, iServerController)
  private
    FCon: iConexaoModel;
  public
    constructor Create(const ACon: iConexaoModel);
    destructor Destroy; override;
    class function New(const ACon: iConexaoModel): iServerController;
    function Dao: iServerControllerDao;
  end;
implementation

uses
  Server.Controller.Dao;

{ TServerControllerFactory }

constructor TServerController.Create(const ACon: iConexaoModel);
begin
  Fcon := ACon;
end;

function TServerController.Dao: iServerControllerDao;
begin
  Result := TControllerDao.New(FCon);
end;

destructor TServerController.Destroy;
begin
    inherited;
end;

class function TServerController.New(const ACon: iConexaoModel): iServerController;
begin
  Result := self.Create(ACon);
end;

end.


