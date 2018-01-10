unit cliente.Model;

interface

uses
  cliente.Conection.Model.Interf;

Type
  TModel = class(TInterfacedObject, iModelConection)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelConection;
    function Servico: iModelConection;
  end;

implementation

{ TModel }

constructor TModel.Create;
begin

end;

destructor TModel.Destroy;
begin
  inherited;
end;

class function TModel.New: iModelConection;
begin
  Result := self.Create;
end;

function TModel.Servico: iModelConection;
begin

end;

end.
