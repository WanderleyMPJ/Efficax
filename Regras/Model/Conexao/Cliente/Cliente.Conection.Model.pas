Unit Cliente.Conection.Model;

interface

{ .$I ..\inc\mvcbr.inc }
uses System.SysUtils, {$IFDEF FMX} FMX.Forms, {$ELSE} VCL.Forms, {$ENDIF} System.Classes, MVCBr.Interf, MVCBr.Model,
  cliente.Conection.Model.Interf, // %Interf,
  MVCBr.Controller, Datasnap.DSClientRest, Entidade.Servico,
  System.Generics.Collections;

Type

  TConectionModel = class(TModelFactory, IConectionModel,
    IThisAs<TConectionModel>)
  protected
    FRestCon: TDSRestConnection;
  public
    Constructor Create;
    Destructor Destroy; override;
    class function new(): IConectionModel; overload;
    class function new(const AController: IController)
      : IConectionModel; overload;
    function ThisAs: TConectionModel;

    function RestCon: TDSRestConnection;
    function Servico(RestCon: TDSRestConnection): iServicoModel;
  end;

Implementation

uses
  Cliente.Servico.Model;

constructor TConectionModel.Create;
begin
  inherited;
  ModelTypes := [mtCommon];
  if not Assigned(FRestCon)  then
  begin
    FRestCon := TDSRestConnection.Create(nil);
    FRestCon.LoginPrompt := false;
    FRestCon.Host := 'localhost';
    FRestCon.Port := 8586;
  end;
end;

destructor TConectionModel.Destroy;
begin
  inherited;
end;

function TConectionModel.ThisAs: TConectionModel;
begin
  result := self;
end;

class function TConectionModel.new(): IConectionModel;
begin
  result := self.Create;
end;

class function TConectionModel.new(const AController: IController)
  : IConectionModel;
begin
  result := TConectionModel.Create;
  result.Controller(AController);
end;

function TConectionModel.RestCon: TDSRestConnection;
begin
  Result := FRestCon;
end;

function TConectionModel.Servico(RestCon: TDSRestConnection): iServicoModel;
begin
//  Result := TServicoModel.New(FRestCon, nil, nil);
end;

Initialization

TMVCRegister.RegisterType<IConectionModel, TConectionModel>
  (TConectionModel.classname, true);

end.
