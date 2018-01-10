{//************************************************************//}
{//                                                            //}
{//         Código gerado pelo assistente                      //}
{//                                                            //}
{//         Projeto MVCBr                                      //}
{//         tireideletra.com.br  / amarildo lacerda            //}
{//************************************************************//}
{// Data: 15/12/2017 09:10:52                                  //}
{//************************************************************//}

unit Pessoa.Model;

{ MVCBr
  www.tireideletra.com.br
  amarildo lacerda
}
{.$I ..\inc\mvcbr.inc}
interface

uses System.SysUtils,{$ifdef LINUX} {$else}{$ifdef FMX} FMX.Forms,{$else} VCL.Forms,{$endif}{$endif} System.Classes,MVCBr.Interf, MVCBr.Model,
     Pessoa.Model.interf, MVCBr.Controller;

type


  TPessoaModel = class(TModelFactory,IPessoaModel,    IThisAs<TPessoaModel>)
  protected
  public
    Constructor Create; override;
    Destructor Destroy; override;
    class function new:IPessoaModel;overload;
    class function new(
      const AController:IController):IPessoaModel;overload;
    function ThisAs:TPessoaModel;
    procedure AfterInit;override;
  end;


implementation


Constructor TPessoaModel.Create;
begin
 inherited create;
end;

Destructor TPessoaModel.Destroy;
begin
  inherited;
end;

function TPessoaModel.ThisAs: TPessoaModel;
begin
  result := self;
end;

class function TPessoaModel.new:IPessoaModel;
begin
   result := new(nil);
end;

procedure TPessoaModel.AfterInit;
begin
    // executado apos concluido o controller
end;
class function TPessoaModel.new(const AController:IController):IPessoaModel;
begin
  result := TPessoaModel.create;
  result.Controller(AController);
end;

                                                              Initialization
TMVCBr.RegisterType<IPessoaModel,TPessoaModel>(TPessoaModel.classname,true);

end.
