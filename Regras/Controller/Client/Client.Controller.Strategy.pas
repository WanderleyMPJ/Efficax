unit Client.Controller.Strategy;

interface

uses
  Client.Controller.Interf, System.Classes, FMX.Forms;

Type

  TControllerStrategy = (Pessoas, Servicos, ServicosGrupo);

  TControllerStrategyHelper = record helper for TControllerStrategy
  public
    function Show : TForm;
  end;


implementation

uses
  Client.Controller.Factory;

{ TControllerStrategyHelper }


{ TControllerStrategyHelper }

function TControllerStrategyHelper.Show: TForm;
begin
  case self of
    Pessoas:
      Result := TControllerFactory.New.Pessoas.Show;
   Servicos:
      Result := TControllerFactory.New.Servico.Show;

    Servicosgrupo:
      Result := TControllerFactory.New.ServicosGrupo.Show;
  end;
end;

end.
