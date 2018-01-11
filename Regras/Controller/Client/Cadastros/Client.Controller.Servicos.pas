unit Client.Controller.Servicos;

interface

uses
  Client.Controller.Interf, Data.DB, Cliente.Rest, Datasnap.DSClientRest,
  FMX.Forms, System.Classes, View.Base, FMX.Grid, Entidade.Servico,
  Entidade.Interf;

Type
  TControllerServicos = class(TInterfacedObject, iMetodos)
  private
    FEntidade : TServico;

    FRestCli: TSMCadastrosClient;
    function getRestCon: TDSRestConnection;

    procedure FormatarGrid(aGrid: TStringGrid);
    procedure HandleRESTException(const APrefix: string; const E: TDSRestProtocolException);

    property RestCon: TDSRestConnection read getRestCon;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iMetodos;
    function Open(id: integer; var getValue: iEntidade): iMetodos;
    function Listar(aDataset: TDataSet; Filtro: string; aGrid: TStringGrid) : iMetodos;
    function Novo : iMetodos;
    function Post(const SetValue: iEntidade): iMetodos;
    function Show: TForm;

  end;

implementation

uses
  Model.Util, Cliente.Conection.Model,
  Client.frm.Servicos, System.JSON, System.SysUtils, FMX.Dialogs,
  ormbr.rest.json;

{ TControllerServicos }

constructor TControllerServicos.Create;
begin
  if not Assigned(FRestCli) then
    FRestCli := TSMCadastrosClient.Create(RestCon);
end;

destructor TControllerServicos.Destroy;
begin
  inherited;
end;


procedure TControllerServicos.FormatarGrid(aGrid: TStringGrid);
begin
  aGrid.Columns[0].Width := 60;
  aGrid.Columns[1].Width := 250;
end;

function TControllerServicos.getRestCon: TDSRestConnection;
begin
  Result := TConectionModel.New.RestCon;
end;

procedure TControllerServicos.HandleRESTException(const APrefix: string;
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
      LMessage :=  E.ResponseText;
  finally
    LJSONValue.Free;
  end;
  ShowMessageFmt('%s: %s', [APrefix, LMessage]);
end;

function TControllerServicos.Listar(aDataset: TDataSet; Filtro: string; aGrid: TStringGrid)
  : iMetodos;
var
  LJson: string;
begin
  try
    LJson := FRestCli.ServicoLista(Filtro);
    TUtil.JsonToDataset(aDataset, LJson);
    // FLista := TORMBrJson.JsonToObjectList<TServico>(LJson);
    Result := self;
    FormatarGrid(aGrid);
  except
    on E: TDSRestProtocolException do
      HandleRestException('Erro Buscando Serviços: ', E)
    else
      raise;
  end;
end;

class function TControllerServicos.New: iMetodos;
begin
  Result := self.Create;
end;

function TControllerServicos.Novo: iMetodos;
begin
  Result := self;
end;

function TControllerServicos.Open(id: integer; var getValue: iEntidade): iMetodos;
var
  LJson: string;
begin
  try
    LJson     := FRestCli.ServicoGet(id);
    FEntidade := TORMBrJson.JsonToObject<TServico>(LJson);
    getValue := fEntidade as TServico;
    Result    := self;
  except
    on E: TDSRestProtocolException do
      HandleRestException('Erro Buscando Serviços: ', E)
    else
      raise;
  end;
end;

function TControllerServicos.Post(const SetValue: iEntidade): iMetodos;
var
  LJson: string;
begin
  try
    LJson := TORMBrJson.ObjectToJsonString(TServico(SetValue));
    FRestCli.ServicoPut(TServico(setvalue).Servico_id,  LJson);
    ShowMessage('Dados Gravados Com Sucesso...');
    Result    := self;
  except
    on E: TDSRestProtocolException do
      HandleRestException('Erro Gravando Serviço: ', E)
    else
      raise;
  end;
end;

function TControllerServicos.Show: TForm;
begin
  Result := TFrmservicos.Create(nil, self);
end;

end.
