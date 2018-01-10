unit Server.Controller.Conexao.Strategy;

interface

uses
  Server.Model.Conexao.Interf;

Type

  TConexaoStrategy = (Db);

  TConexaoStrategyHelper = record helper for TConexaoStrategy
  private
    function Conectar : iConexaoModel;
  public
    function CriarBanco : iConexaoModel;
    function Conection : iConexaoModel;
//    function New: ;
  end;

implementation

uses
  Server.Model.Conexao.Factory;

{ TConexaoStrategyHelper }

function TConexaoStrategyHelper.Conectar: iConexaoModel;
begin
  TConexaoModel.New().Firebird.BuildDatabase;
  Result := TConexaoModel.New().ThisAs;
end;

function TConexaoStrategyHelper.Conection: iConexaoModel;
begin
  Result := Conectar;
end;

function TConexaoStrategyHelper.CriarBanco: iConexaoModel;
begin
  Result := Conectar;
end;

end.
