unit Model.Dao.MyConection;

interface

Uses

  FireDAC.Comp.Client, FireDAC.stan.def,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Intf, FireDAC.Comp.UI;

Type

  TConnection = class
  strict private
    class var FInstance: TConnection;
    constructor CreatePrivate;
  private
    FConnection: TFDConnection;
    FConexao: TFDConnection;
    procedure SetConexao(const Value: TFDConnection);

  public
    constructor Create;
    class function GetInstance: TConnection;

    function Conectar(var Error: string): Boolean;
    function Execute(Const ACmd: string; var Error: string): Boolean;
    function ExecuteQuery(const ACmd: string): TFDQuery;

    procedure BeginTransaction;
    procedure Rollback;
    procedure Commit;

    property Conexao: TFDConnection read FConexao write SetConexao;

  end;


implementation

uses
  System.SysUtils;

{ TConnection }

procedure TConnection.BeginTransaction;
begin
  FConnection.StartTransaction;
end;

procedure TConnection.Commit;
begin
  FConnection.Commit;
end;

function TConnection.Conectar(var Error: string): Boolean;
begin
  Result := False;
  try
    FConnection.Connected := False;
    with FConnection.Params do
    begin

    end;
  except

  end;
end;

constructor TConnection.Create;
begin
  raise Exception.Create('Projeto Singleton');
end;

constructor TConnection.CreatePrivate;
begin

end;

function TConnection.Execute(const ACmd: string; var Error: string): Boolean;
begin

end;

function TConnection.ExecuteQuery(const ACmd: string): TFDQuery;
begin

end;

class function TConnection.GetInstance: TConnection;
begin

end;

procedure TConnection.Rollback;
begin

end;

procedure TConnection.SetConexao(const Value: TFDConnection);
begin
  FConexao := Value;
end;

end.
