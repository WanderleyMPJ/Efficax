unit Model.Dao.Attribute;

interface

Type
  TableName = class(TCustomAttribute)
  private
    FName: string;
    procedure SetName(const Value: string);

  public
    constructor Create(Const AValue: string);
    property Name: string read FName write SetName;
  end;

  FileldName = class(TCustomAttribute)
  private
    FName: string;
    FFK: Boolean;
    FAutoInc: Boolean;
    FPK: Boolean;
    procedure SetAutoInc(const Value: Boolean);
    procedure SetFK(const Value: Boolean);
    procedure SetName(const Value: string);
    procedure SetPK(const Value: Boolean);

  public
    constructor Create(const AValeu: string; const APK: Boolean = False;
      Const AAutoInc: Boolean = False; Const AFK: Boolean = False);

    property Name: string read FName write SetName;
    property FK: Boolean read FFK write SetFK;
    property PK: Boolean read FPK write SetPK;
    property AutoInc: Boolean read FAutoInc write SetAutoInc;
  end;

implementation

{ TableName }

constructor TableName.Create(const AValue: string);
begin
  FName := AValue;
end;

procedure TableName.SetName(const Value: string);
begin
  FName := Value;
end;

{ FileldName }

constructor FileldName.Create(const AValeu: string;
  const APK, AAutoInc, AFK: Boolean);
begin
  FName     := AValeu;
  FPK       := APK;
  FFK       := AFK;
  FAutoInc  := AAutoInc;
end;

procedure FileldName.SetAutoInc(const Value: Boolean);
begin
  FAutoInc := Value;
end;

procedure FileldName.SetFK(const Value: Boolean);
begin
  FFK := Value;
end;

procedure FileldName.SetName(const Value: string);
begin
  FName := Value;
end;

procedure FileldName.SetPK(const Value: Boolean);
begin
  FPK := Value;
end;

end.
