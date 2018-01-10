unit Cliente.Controller.Servico;

interface

uses
  System.Generics.Collections;


Type
  iController = interface
    ['{8C6A2771-69A9-45C0-ACB0-E86448F5C3D2}']
    function Listar(filtro: string): iController;
  end;

  TUsuario = class
  private
    Fid: integer;
    FNome: string;
    procedure Setid(const Value: integer);
    procedure SetNome(const Value: string);

  public
    property id: integer read Fid write Setid;
    property Nome : string read FNome write SetNome;

  end;

  TControllerServico = class(TInterfacedObject, iController)
  private

  public
    class function New: iController;
    function Listar(filtro: string): iController;
  end;


implementation

{ TUsuario }

procedure TUsuario.Setid(const Value: integer);
begin
  Fid := Value;
end;

procedure TUsuario.SetNome(const Value: string);
begin
  FNome := Value;
end;

{ TControllerServico }

function TControllerServico.Listar(filtro: string): iController;
begin

end;

class function TControllerServico.New: iController;
begin

end;

end.
