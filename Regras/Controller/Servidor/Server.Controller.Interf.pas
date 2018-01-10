unit Server.Controller.Interf;

interface

uses
  Entidade.Interf, System.JSON;

Type
  iServerControllerDao = interface;
  iServerControllerMetodos = interface;
//  iServerControllerMetodosGet = interface;
  iServerControllerMetodosGet = interface;

  iServerController = interface
    ['{E788B3F9-B1C0-4E5B-9632-7798242375AC}']
    function Dao: iServerControllerDao;
  end;

  iServerControllerDao = interface
    ['{CC07F1EA-1743-4E53-8775-2F452EBEAC77}']
    function Pessoa: iServerControllerMetodos;
    function Servico: iServerControllerMetodos;
    function ServicoGrupo: iServerControllerMetodos;
  end;

  iServerControllerMetodos = interface
    ['{E20120F5-8E15-44EE-9A4F-E1BB21E48495}']
    function Get(id: integer; var ResultJson: string): iServerControllerMetodos;
    function Post(const JSON: string): iServerControllerMetodos;
    function Lista(aFiltro: string; var ResultJson: string): iServerControllerMetodos;
  end;

  iServerControllerMetodosGet = interface
    ['{ADEB0BF3-0742-4DCF-8185-7A97D75E37F1}']
    function ToJson: String;
    function ToEntidade: iEntidade;
  end;


implementation

end.
