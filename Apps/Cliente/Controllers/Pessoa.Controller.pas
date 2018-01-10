{//************************************************************//}
{//                                                            //}
{//         Código gerado pelo assistente                      //}
{//                                                            //}
{//         Projeto MVCBr                                      //}
{//         tireideletra.com.br  / amarildo lacerda            //}
{//************************************************************//}
{// Data: 15/12/2017 09:10:51                                  //}
{//************************************************************//}

unit Pessoa.Controller;

interface
{.$I ..\inc\mvcbr.inc}
uses

System.SysUtils,{$ifdef LINUX} {$else}{$ifdef FMX} FMX.Forms,{$else} VCL.Forms,{$endif}{$endif} System.Classes,MVCBr.Interf,
MVCBr.Model, MVCBr.Controller, MVCBr.ApplicationController,
Pessoa.Controller.interf,
System.RTTI;

type

  TPessoaController = class(TControllerFactory,
    IPessoaController,
    IThisAs<TPessoaController>)
  protected
  public
    // inicializar os módulos personalizados em CreateModules
    Procedure CreateModules;virtual;
    Constructor Create;override;
    Destructor Destroy; override;
    class function New(): IController; overload;
    class function New(const AView: IView; const AModel: IModel)
      : IController; overload;
    class function New(const AModel: IModel): IController; overload;
    function ThisAs: TPessoaController;
    procedure init;override;
    //function ModelAs: IPessoaViewModel;
  end;

implementation

Constructor TPessoaController.Create;
begin
 inherited;
// add(TPessoaViewModel.New(self).ID('{Pessoa.ViewModel}'));
end;

Destructor TPessoaController.destroy;
begin
  inherited;
end;

class function TPessoaController.New(): IController;
begin
 result := new(nil,nil);
end;

class function TPessoaController.New(const AView: IView;
   const AModel: IModel) : IController;
var
  vm: IViewModel;
begin
  result := TPessoaController.create as IController;
  result.View(AView).Add(AModel);
  if assigned(AModel) then
    if supports(AModel.This, IViewModel, vm) then
      begin
        vm.View(AView).Controller( result );
      end;
end;

class function TPessoaController.New(
   const AModel: IModel): IController;
begin
  result := new(nil,AModel);
end;

function TPessoaController.ThisAs: TPessoaController;
begin
   result := self;
end;


procedure TPessoaController.init;
//var ref:TPessoaView;
begin
  inherited;
{ if not assigned(FView) then
 begin
   Application.CreateForm( TPessoaView, ref );
   supports(ref,IView,FView);
 end;}
 CreateModules; //< criar os modulos persolnizados
 AfterInit;
end;
 // Adicionar os modulos e MODELs personalizados
Procedure TPessoaController.CreateModules;
begin
   // adicionar os mudulos aqui
   // exemplo: add( MeuModel.new(self) );
end;

initialization
//TPessoaController.New(TPessoaView.New,TPessoaViewModel.New)).init();

  RegisterInterfacedClass(TPessoaController.ClassName,IPessoaController,TPessoaController);

finalization

  unRegisterInterfacedClass(TPessoaController.ClassName);

end.
