unit Cliente.Controller.Servicos.Grupo;

interface

uses
  Client.Controller.Interf, Data.DB, Cliente.Rest, Datasnap.DSClientRest,
  FMX.Forms, System.Classes, View.Base, FMX.Grid, Entidade.Servico.Grupo,
  Entidade.Interf;

Type
  TControllerServicosGrupo = class(TInterfacedObject, iMetodos)
  private
    FEntidade: TServicoGrupo;

    FRestCli: TSMCadastrosClient;
    function getRestCon: TDSRestConnection;

    procedure FormatarGrid(aGrid: TStringGrid);
    procedure HandleRESTException(const APrefix: string;
      const E: TDSRestProtocolException);

    property RestCon: TDSRestConnection read getRestCon;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iMetodos;
    function Open(id: integer; var getValue: iEntidade): iMetodos;
    function Listar(aDataset: TDataSet; Filtro: string; aGrid: TStringGrid)
      : iMetodos;
    function Novo: iMetodos;
    function Post(const SetValue: iEntidade): iMetodos;
    function Show: TForm;

  end;

implementation

uses
  Model.Util, Cliente.Conection.Model,
  Client.frm.Servicos, System.JSON, System.SysUtils, FMX.Dialogs,
  ormbr.Rest.JSON, Client.frm.ServicosGrupo, System.Generics.Collections;

{ TControllerServicosGrupo }

constructor TControllerServicosGrupo.Create;
begin
  if not Assigned(FRestCli) then
    FRestCli := TSMCadastrosClient.Create(RestCon);
end;

destructor TControllerServicosGrupo.Destroy;
begin
  inherited;
end;

procedure TControllerServicosGrupo.FormatarGrid(aGrid: TStringGrid);
begin
  aGrid.Columns[0].Width := 60;
  aGrid.Columns[1].Width := 250;
end;

function TControllerServicosGrupo.getRestCon: TDSRestConnection;
begin
  Result := TConectionModel.New.RestCon;
end;

procedure TControllerServicosGrupo.HandleRESTException(const APrefix: string;
  const E: TDSRestProtocolException);
var
  LJSONValue: TJSONValue;
  LMessage: string;
  LPair: TJSONPair;
begin
  LJSONValue := TJSONObject.ParseJSONValue(BytesOf(E.ResponseText), 0);
  try
    if LJSONValue is TJSONObject then
    begin
      LPair := TJSONObject(LJSONValue).Get(0);
      if LPair.JsonString.Value = 'SessionExpired' then
        // Clear session id because it is no good
        RestCon.SessionID := '';
      // Extract error message
      LMessage := LPair.JSONValue.Value;
    end
    else
      LMessage := E.ResponseText;
  finally
    LJSONValue.Free;
  end;
  ShowMessageFmt('%s: %s', [APrefix, LMessage]);
end;

function TControllerServicosGrupo.Listar(aDataset: TDataSet; Filtro: string;
  aGrid: TStringGrid): iMetodos;
var
  LJson: string;
begin
  try
    LJson := FRestCli.ServicoGrupoLista(Filtro);
    TUtil.JsonToDataset(aDataset, LJson);
    // FLista := TORMBrJson.JsonToObjectList<TServicoGrupo>(LJson);
    Result := self;
    if aDataset.RecordCount > 0 then
      FormatarGrid(aGrid);
  except
    on E: TDSRestProtocolException do
      HandleRESTException('Erro Buscando Serviços: ', E)
    else
      raise;
  end;
end;

class function TControllerServicosGrupo.New: iMetodos;
begin
  Result := self.Create;
end;

function TControllerServicosGrupo.Novo: iMetodos;
begin
  Result := self;
end;

function TControllerServicosGrupo.Open(id: integer; var getValue: iEntidade)
  : iMetodos;
var
  LJson: string;
begin
  try
    LJson := FRestCli.ServicoGrupoGet(id);
    FEntidade := TORMBrJson.JsonToObject<TServicoGrupo>(LJson);
    getValue := FEntidade as TServicoGrupo;
    Result := self;
  except
    on E: TDSRestProtocolException do
      HandleRESTException('Erro Buscando Serviços: ', E)
    else
      raise;
  end;
end;

function TControllerServicosGrupo.Post(const SetValue: iEntidade): iMetodos;
var
  LList: TObjectList<TServicoGrupo>;
  LMaster: TServicoGrupo;
  JSON: TJSONArray;
begin
  try
    LList := TObjectList<TServicoGrupo>.Create;
    LMaster := SetValue as TServicoGrupo;
    LList.Add(LMaster);
    FRestCli.ServicoGrupoPut(TServicoGrupo(SetValue).ServicoGrupo_id, JSON);
    ShowMessage('Dados Gravados Com Sucesso...');
    Result := self;
  except
    on E: TDSRestProtocolException do
      HandleRESTException('Erro Gravando Serviço: ', E)
    else
      raise;
  end;
end;

function TControllerServicosGrupo.Show: TForm;
begin
  Result := TFrmservicosGrupo.Create(nil, self);
end;

end.
