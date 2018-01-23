unit Model.Params.DataBase;

interface

Type
  TParamsDatabase = class
  private
    FDataBase: string;
    FPassword: string;
    FUser: string;
    FServer: string;
    procedure SetDataBase(const Value: string);
    procedure SetPassword(const Value: string);
    procedure SetServer(const Value: string);
    procedure SetUser(const Value: string);

  public
    property Server: string read FServer write SetServer;
    property DataBase: string read FDataBase write SetDataBase;
    property User: string read FUser write SetUser;
    property Password: string read FPassword write SetPassword;
  end;
implementation

{ TParamsDatabase }

procedure TParamsDatabase.SetDataBase(const Value: string);
begin
  FDataBase := Value;
end;

procedure TParamsDatabase.SetPassword(const Value: string);
begin
  FPassword := Value;
end;

procedure TParamsDatabase.SetServer(const Value: string);
begin
  FServer := Value;
end;

procedure TParamsDatabase.SetUser(const Value: string);
begin
  FUser := Value;
end;

end.
