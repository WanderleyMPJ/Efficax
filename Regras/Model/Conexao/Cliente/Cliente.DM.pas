unit Cliente.DM;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSClientRest;

type
  TDM = class(TDataModule)
    DSRestConnection1: TDSRestConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
