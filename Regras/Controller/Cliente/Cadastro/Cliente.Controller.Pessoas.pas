unit Cliente.Controller.Pessoas;

interface

uses
  Client.Controller.Interf, Data.DB, Cliente.Rest, Datasnap.DSClientRest,
  FMX.Forms, System.Classes, View.Base, FMX.Grid,
  Entidade.Interf, Entidade.Pessoas;


Type
  TControllerPessoas = class(TInterfacedObject, iMetodos)
  private
    FEntidade : TPessoas;

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
  ormbr.rest.json, Client.frm.ServicosGrupo, Cliente.Frm.Pessoas;

{ TControllerPessoas }

constructor TControllerPessoas.Create;
begin
  if not Assigned(FRestCli) then
    FRestCli := TSMCadastrosClient.Create(RestCon);
end;

destructor TControllerPessoas.Destroy;
begin
  inherited;
end;


procedure TControllerPessoas.FormatarGrid(aGrid: TStringGrid);
begin
  aGrid.Columns[0].Width := 60;
  aGrid.Columns[1].Width := 250;
end;

function TControllerPessoas.getRestCon: TDSRestConnection;
begin
  Result := TConectionModel.New.RestCon;
end;

procedure TControllerPessoas.HandleRESTException(const APrefix: string;
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

function TControllerPessoas.Listar(aDataset: TDataSet; Filtro: string; aGrid: TStringGrid)
  : iMetodos;
var
  LJson: string;
begin
  try
    LJson := FRestCli.PessoasLista(Filtro);
    TUtil.JsonToDataset(aDataset, LJson);
    Result := self;
    if aDataset.RecordCount > 0 then
      FormatarGrid(aGrid);
  except
    on E: TDSRestProtocolException do
      HandleRestException('Erro Buscando Serviços: ', E)
    else
      raise;
  end;
end;

class function TControllerPessoas.New: iMetodos;
begin
  Result := self.Create;
end;

function TControllerPessoas.Novo: iMetodos;
begin
  Result := self;
end;

function TControllerPessoas.Open(id: integer; var getValue: iEntidade): iMetodos;
var
  LJson: string;
begin
  try
    LJson     := FRestCli.PessoasGet(id);
    FEntidade := TORMBrJson.JsonToObject<TPessoas>(LJson);
    getValue := fEntidade as TPessoas;
    Result    := self;
  except
    on E: TDSRestProtocolException do
      HandleRestException('Erro Buscando Serviços: ', E)
    else
      raise;
  end;
end;

function TControllerPessoas.Post(const SetValue: iEntidade): iMetodos;
var
  LJson: string;
begin
  try
    LJson := TORMBrJson.ObjectToJsonString(TPessoas(SetValue));
    FRestCli.PessoasPut(TPessoas(setvalue).Pessoas_ID, LJson);
    ShowMessage('Dados Gravados Com Sucesso...');
    Result    := self;
  except
    on E: TDSRestProtocolException do
      HandleRestException('Erro Gravando Serviço: ', E)
    else
      raise;
  end;
end;

function TControllerPessoas.Show: TForm;
begin
  Result := TFrmPessoas.Create(nil, self);
end;

end.
