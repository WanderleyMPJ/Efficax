unit Server.Testes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,

  FireDAC.Comp.Client, Vcl.StdCtrls, ormbr.factory.interfaces,
  ormbr.factory.firedac, ormbr.types.database, ormbr.ddl.commands,
  ormbr.database.interfaces, ormbr.modeldb.compare,
  Server.Controller.Conexao.Strategy, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs;

type
  TfrmTestes = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    FDConnection1: TFDConnection;
  private
    fdb: TFDConnection;
    oConnection: IDBCONNECTION;
    oManager: IDatabaseCompare;

    procedure Build;
    procedure CriarFd;
    procedure CriarConection;
  public
    { Public declarations }
  end;

var
  frmTestes: TfrmTestes;

implementation

{$R *.dfm}
{ TfrmTestes }

procedure TfrmTestes.Build;
var
  cDDL: TDDLCommand;
begin
  oManager := TModelDbCompare.Create(oConnection);
//  oManager := TDatabaseCompare.Create(oConnection, oConnection);
  oManager.CommandsAutoExecute := True;
  oManager.BuildDatabase;
  for cDDL in oManager.GetCommandList do
      Memo1.Lines.Add(cDDL.Command);
end;

procedure TfrmTestes.CriarConection;
begin
  oConnection := TFactoryFireDAC.Create(FDB, dnFirebird);
end;

procedure TfrmTestes.CriarFd;
var
  database : string;
begin
  database := ExtractFilePath(application.ExeName) + 'DataBase\' +
    'efficax.fdb';

  fdb := TFDConnection.Create(nil);
  fdb.Params.Add('User_Name=SYSDBA');
  fdb.Params.Add('Password=masterkey');
  fdb.Params.Add('Database=' + database);
  fdb.Params.Add('DriverID=FB');
end;

end.
