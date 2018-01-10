unit Cliente.Servico.Controller;

interface

uses
  FMX.ListView, System.Generics.Collections, entidade.Servico,
  Data.Bind.Components, Data.Bind.ObjectScope, Datasnap.DSClientRest,
  Cliente.Rest, Data.DB, Model.Util;

Type

  IListModel<T: class> = interface
    ['{F4D37AD4-3F22-464B-B407-7958F425AD1C}']
    function getList: TObjectList<T>;
  end;

  iServicoController = interface
    ['{404C0DA7-31D5-487D-94F1-0083E837CC4F}']
    function Listar(Filtro: string): TObjectList<TServico>;
    function FAdapterBindSourceCreateAdapter(Sender: TObject;
      var ABindSourceAdapter: TBindSourceAdapter): iServicoController;
    function setAdapter(var adpter: TAdapterBindSource): iServicoController;
    function setMem(aDataset: TDataSet; Filtro: string): iServicoController;
  end;

  TServicoController = class(TInterfacedObject, iServicoController,
    IListModel<TServico>)
  private
    AdapterBindSource1: TAdapterBindSource;

    FRestCli: TSMCadastrosClient;

    FLista: TObjectList<TServico>;

    function getRestCon: TDSRestConnection;

    procedure AdapterBindSource1CreateAdapter(Sender: TObject;
      var ABindSourceAdapter: TBindSourceAdapter);

    property RestCon: TDSRestConnection read getRestCon;

  public
    Constructor Create;
    Destructor Destroy; override;

    class function New: iServicoController;
    function setAdapter(var adpter: TAdapterBindSource): iServicoController;
    function Listar(Filtro: string): TObjectList<TServico>;
    function FAdapterBindSourceCreateAdapter(Sender: TObject;
      var ABindSourceAdapter: TBindSourceAdapter): iServicoController;
    function getList: TObjectList<TServico>;
    function setMem(aDataset: TDataSet; Filtro: string): iServicoController;
  end;

implementation

uses
  FMX.ListView.Types, System.Rtti, Cliente.Servico.Model,
  Cliente.Conection.Model, entidade.Model, System.Classes, ormbr.Rest.json;

{ TServicoController }

procedure TServicoController.AdapterBindSource1CreateAdapter(Sender: TObject;
  var ABindSourceAdapter: TBindSourceAdapter);
begin
  if not Assigned(FLista) then
    FLista := TObjectList<TServico>.Create(True);
  ABindSourceAdapter := TListBindSourceAdapter<TServico>.Create(nil,
    FLista, True);
end;

Constructor TServicoController.Create;
begin
  FRestCli := TSMCadastrosClient.Create(RestCon);
end;

destructor TServicoController.Destroy;
begin

  inherited;
end;

function TServicoController.FAdapterBindSourceCreateAdapter(Sender: TObject;
  var ABindSourceAdapter: TBindSourceAdapter): iServicoController;
begin
  if not Assigned(FLista) then
    FLista := TObjectList<TServico>.Create(True);
  ABindSourceAdapter := TListBindSourceAdapter<TServico>.Create(nil,
    FLista, True);
end;

function TServicoController.getList: TObjectList<TServico>;
begin
  if not Assigned(FLista) then
    FLista := Listar('where id = -989');
  Result := FLista;
end;

function TServicoController.getRestCon: TDSRestConnection;
begin
  Result := TConectionModel.New.RestCon;
end;

function TServicoController.Listar(Filtro: string): TObjectList<TServico>;
var
  LJson: string;
begin
  LJson := FRestCli.ServicoGet(Filtro);
  FLista := TORMBrJson.JsonToObjectList<TServico>(LJson);
  Result := FLista;
end;

class function TServicoController.New: iServicoController;
begin
  Result := self.Create;
end;

function TServicoController.setAdapter(var adpter: TAdapterBindSource)
  : iServicoController;
begin
  AdapterBindSource1 := adpter;
end;

function TServicoController.setMem(aDataset: TDataSet; Filtro: string)
  : iServicoController;
var
  LJson: string;
begin
  LJson := FRestCli.ServicoGet(Filtro);
  TUtil.JsonToDataset(aDataset, LJson);
  // FLista := TORMBrJson.JsonToObjectList<TServico>(LJson);
  // Result := FLista;
  Result := self;
end;

end.
