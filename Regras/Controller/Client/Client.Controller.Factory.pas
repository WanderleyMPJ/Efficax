unit Client.Controller.Factory;

interface

uses
  Client.Controller.Interf;

Type
  TControllerFactory = class(TInterfacedObject, iController)
  private

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iController;

    function Pessoas        : iMetodos;
    function Servico        : iMetodos;
    function ServicosGrupo  : iMetodos;
  end;
implementation

{ TControllerFactory }

uses Client.Controller.Servicos, Cliente.Controller.Servicos.Grupo,
  Cliente.Controller.Pessoas;


constructor TControllerFactory.Create;
begin

end;

destructor TControllerFactory.Destroy;
begin
    inherited;
end;

class function TControllerFactory.New: iController;
begin
  Result := self.Create;
end;

function TControllerFactory.Pessoas: iMetodos;
begin
  Result := TControllerPessoas.New;
end;

function TControllerFactory.Servico: iMetodos;
begin
  Result := TControllerServicos.New;
end;

function TControllerFactory.ServicosGrupo: iMetodos;
begin
  Result := TControllerServicosGrupo.New;
end;

end.
