Unit Cliente.Conection.Model.Interf;

interface

uses System.SysUtils, {$IFDEF FMX} FMX.Forms, {$ELSE} VCL.Forms, {$ENDIF} System.Classes, MVCBr.Interf, MVCBr.Model,
  // %Interf,
  MVCBr.Controller, Datasnap.DSClientRest, Entidade.Interf,
  System.Generics.Collections, Entidade.Model, Entidade.Servico;

Type
  iOperacoes = interface;
  iServicoModel = interface;

  iModelConection = interface
    ['{BF6A9C82-5DB0-4F2A-8399-4E3D8159E1E6}']
    function RestCon: TDSRestConnection;

//    function Servico: iModelConection;
  end;

  IConectionModel = interface(IModel)
    ['{BADFB0B0-66EC-45FA-A2A4-FBD6807625CC}']
    function RestCon: TDSRestConnection;

    function Servico(RestCon: TDSRestConnection): iServicoModel;
  end;

  iOperacoes = interface
    ['{0D9FC25B-68F5-4DA0-8889-390E1E7CE513}']
    function Lista(Filtro: string): iOperacoes;
    function Post(var AValue: iEntidade): iOperacoes;
  end;

  iServicoModel = interface
    ['{58F8ED34-1FEB-4047-9E9D-980AA3256F7A}']
    function Get(id: integer): iServicoModel;
    function Lista(Filtro: string; setLista: TObjectList<TServico>)
      : iServicoModel;
    function Post(var AValue: iEntidade): iOperacoes;
  end;

Implementation

end.
