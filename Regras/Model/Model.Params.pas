unit Model.Params;

interface

uses
  Model.Params.DataBase;

Type


  TParamsServer = class
  private
    FDataBase: TParamsDatabase;
    procedure SetDataBase(const Value: TParamsDatabase);

  public
    constructor Create;
    destructor destroy; override;

    property DataBase: TParamsDatabase read FDataBase write SetDataBase;
  end;

  TParamsCliente = class
  private

  public

  end;


implementation

{ TParamsServer }

constructor TParamsServer.Create;
begin
  if not Assigned(FDataBase) then
    FDataBase := TParamsDatabase.Create;
end;


destructor TParamsServer.destroy;
begin
  FDataBase.Free;
  inherited;
end;

procedure TParamsServer.SetDataBase(const Value: TParamsDatabase);
begin
  FDataBase := Value;
end;

end.
