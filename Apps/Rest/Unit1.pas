unit Unit1;

interface

uses
  Server.Controller.Interf;

Type
  TControllerDao = class(TInterfacedObject, iControllerDao)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iControllerDao;
  end;
implementation

{ TControllerDao }

constructor TControllerDao.Create;
begin

end;

destructor TControllerDao.Destroy;
begin
    inherited;
end;

class function TControllerDao.New: iControllerDao;
begin
  Result := self.Create;
end;

end.
