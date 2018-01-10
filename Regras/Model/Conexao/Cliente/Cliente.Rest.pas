//
// Created by the DataSnap proxy generator.
// 08/01/2018 17:27:47
//

unit Cliente.Rest;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TSMCadastrosClient = class(TDSAdminRestClient)
  private
    FPessoaGetCommand: TDSRestCommand;
    FServicoGetCommand: TDSRestCommand;
    FServicoListaCommand: TDSRestCommand;
    FServicoPutCommand: TDSRestCommand;
    FServicoGrupoGetCommand: TDSRestCommand;
    FServicoGrupoListaCommand: TDSRestCommand;
    FServicoGrupoPutCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function PessoaGet(const ARequestFilter: string = ''): string;
    function ServicoGet(id: Integer; const ARequestFilter: string = ''): string;
    function ServicoLista(aFiltro: string; const ARequestFilter: string = ''): string;
    function ServicoPut(AJson: string; const ARequestFilter: string = ''): string;
    function ServicoGrupoGet(id: Integer; const ARequestFilter: string = ''): string;
    function ServicoGrupoLista(aFiltro: string; const ARequestFilter: string = ''): string;
    function ServicoGrupoPut(AJson: string; const ARequestFilter: string = ''): string;
  end;

const
  TSMCadastros_PessoaGet: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TSMCadastros_ServicoGet: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'id'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TSMCadastros_ServicoLista: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'aFiltro'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TSMCadastros_ServicoPut: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AJson'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TSMCadastros_ServicoGrupoGet: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'id'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TSMCadastros_ServicoGrupoLista: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'aFiltro'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TSMCadastros_ServicoGrupoPut: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AJson'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

implementation

function TSMCadastrosClient.PessoaGet(const ARequestFilter: string): string;
begin
  if FPessoaGetCommand = nil then
  begin
    FPessoaGetCommand := FConnection.CreateCommand;
    FPessoaGetCommand.RequestType := 'GET';
    FPessoaGetCommand.Text := 'TSMCadastros.PessoaGet';
    FPessoaGetCommand.Prepare(TSMCadastros_PessoaGet);
  end;
  FPessoaGetCommand.Execute(ARequestFilter);
  Result := FPessoaGetCommand.Parameters[0].Value.GetWideString;
end;

function TSMCadastrosClient.ServicoGet(id: Integer; const ARequestFilter: string): string;
begin
  if FServicoGetCommand = nil then
  begin
    FServicoGetCommand := FConnection.CreateCommand;
    FServicoGetCommand.RequestType := 'GET';
    FServicoGetCommand.Text := 'TSMCadastros.ServicoGet';
    FServicoGetCommand.Prepare(TSMCadastros_ServicoGet);
  end;
  FServicoGetCommand.Parameters[0].Value.SetInt32(id);
  FServicoGetCommand.Execute(ARequestFilter);
  Result := FServicoGetCommand.Parameters[1].Value.GetWideString;
end;

function TSMCadastrosClient.ServicoLista(aFiltro: string; const ARequestFilter: string): string;
begin
  if FServicoListaCommand = nil then
  begin
    FServicoListaCommand := FConnection.CreateCommand;
    FServicoListaCommand.RequestType := 'GET';
    FServicoListaCommand.Text := 'TSMCadastros.ServicoLista';
    FServicoListaCommand.Prepare(TSMCadastros_ServicoLista);
  end;
  FServicoListaCommand.Parameters[0].Value.SetWideString(aFiltro);
  FServicoListaCommand.Execute(ARequestFilter);
  Result := FServicoListaCommand.Parameters[1].Value.GetWideString;
end;

function TSMCadastrosClient.ServicoPut(AJson: string; const ARequestFilter: string): string;
begin
  if FServicoPutCommand = nil then
  begin
    FServicoPutCommand := FConnection.CreateCommand;
    FServicoPutCommand.RequestType := 'GET';
    FServicoPutCommand.Text := 'TSMCadastros.ServicoPut';
    FServicoPutCommand.Prepare(TSMCadastros_ServicoPut);
  end;
  FServicoPutCommand.Parameters[0].Value.SetWideString(AJson);
  FServicoPutCommand.Execute(ARequestFilter);
  Result := FServicoPutCommand.Parameters[1].Value.GetWideString;
end;

function TSMCadastrosClient.ServicoGrupoGet(id: Integer; const ARequestFilter: string): string;
begin
  if FServicoGrupoGetCommand = nil then
  begin
    FServicoGrupoGetCommand := FConnection.CreateCommand;
    FServicoGrupoGetCommand.RequestType := 'GET';
    FServicoGrupoGetCommand.Text := 'TSMCadastros.ServicoGrupoGet';
    FServicoGrupoGetCommand.Prepare(TSMCadastros_ServicoGrupoGet);
  end;
  FServicoGrupoGetCommand.Parameters[0].Value.SetInt32(id);
  FServicoGrupoGetCommand.Execute(ARequestFilter);
  Result := FServicoGrupoGetCommand.Parameters[1].Value.GetWideString;
end;

function TSMCadastrosClient.ServicoGrupoLista(aFiltro: string; const ARequestFilter: string): string;
begin
  if FServicoGrupoListaCommand = nil then
  begin
    FServicoGrupoListaCommand := FConnection.CreateCommand;
    FServicoGrupoListaCommand.RequestType := 'GET';
    FServicoGrupoListaCommand.Text := 'TSMCadastros.ServicoGrupoLista';
    FServicoGrupoListaCommand.Prepare(TSMCadastros_ServicoGrupoLista);
  end;
  FServicoGrupoListaCommand.Parameters[0].Value.SetWideString(aFiltro);
  FServicoGrupoListaCommand.Execute(ARequestFilter);
  Result := FServicoGrupoListaCommand.Parameters[1].Value.GetWideString;
end;

function TSMCadastrosClient.ServicoGrupoPut(AJson: string; const ARequestFilter: string): string;
begin
  if FServicoGrupoPutCommand = nil then
  begin
    FServicoGrupoPutCommand := FConnection.CreateCommand;
    FServicoGrupoPutCommand.RequestType := 'GET';
    FServicoGrupoPutCommand.Text := 'TSMCadastros.ServicoGrupoPut';
    FServicoGrupoPutCommand.Prepare(TSMCadastros_ServicoGrupoPut);
  end;
  FServicoGrupoPutCommand.Parameters[0].Value.SetWideString(AJson);
  FServicoGrupoPutCommand.Execute(ARequestFilter);
  Result := FServicoGrupoPutCommand.Parameters[1].Value.GetWideString;
end;

constructor TSMCadastrosClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TSMCadastrosClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TSMCadastrosClient.Destroy;
begin
  FPessoaGetCommand.DisposeOf;
  FServicoGetCommand.DisposeOf;
  FServicoListaCommand.DisposeOf;
  FServicoPutCommand.DisposeOf;
  FServicoGrupoGetCommand.DisposeOf;
  FServicoGrupoListaCommand.DisposeOf;
  FServicoGrupoPutCommand.DisposeOf;
  inherited;
end;

end.

