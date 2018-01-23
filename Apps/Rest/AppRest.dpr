program AppRest;
{$APPTYPE GUI}



uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  Server.Frm.Principal in '..\..\Regras\View\Server.Frm.Principal.pas' {frmPrincipal},
  Server.SM.Cadastros in '..\..\Regras\Controller\ServerModules\Server.SM.Cadastros.pas' {SMCadastros: TDSServerModule},
  Server.Sc in '..\..\Regras\Controller\Server.Sc.pas' {Sc: TDataModule},
  Server in '..\..\Regras\Controller\Server.WM' {WebModule1: TWebModule},
  Entidade.Interf in '..\..\Regras\Model\Entidades\Entidade.Interf.pas',
  Server.Controller.Interf in '..\..\Regras\Controller\Servidor\Server.Controller.Interf.pas',
  Server.Controller in '..\..\Regras\Controller\Servidor\Server.Controller.pas',
  Server.Controller.Cadastros.Strategy in '..\..\Regras\Controller\Servidor\Server.Controller.Cadastros.Strategy.pas',
  Server.Controller.Conexao.Strategy in '..\..\Regras\Controller\Servidor\Server.Controller.Conexao.Strategy.pas',
  Server.Model.Conexao.Interf in '..\..\Regras\Model\Conexao\Server.Model.Conexao.Interf.pas',
  Server.Model.Conexao.Factory in '..\..\Regras\Model\Conexao\Server.Model.Conexao.Factory.pas',
  Server.Model.Conexao.Metadata in '..\..\Regras\Model\Conexao\Server.Model.Conexao.Metadata.pas',
  Entidade.Servico in '..\..\Regras\Model\Entidades\Cadastros\Entidade.Servico.pas',
  Server.Testes in '..\..\Regras\View\Servidor\Server.Testes.pas' {frmTestes},
  Server.Controller.Dao in '..\..\Regras\Controller\Servidor\Server.Controller.Dao.pas',
  Server.Controller.Dao.Servico in '..\..\Regras\Controller\Servidor\Server.Controller.Dao.Servico.pas',
  Servidor.Controller.Servico in '..\..\Regras\Controller\Servidor\Cadastros\Servidor.Controller.Servico.pas',
  Entidade.Servico.Grupo in '..\..\Regras\Model\Entidades\Cadastros\Entidade.Servico.Grupo.pas',
  Servidor.Controller.Servico.Grupo in '..\..\Regras\Controller\Servidor\Cadastros\Servidor.Controller.Servico.Grupo.pas',
  Entidade.Pessoas in '..\..\Regras\Model\Entidades\Cadastros\Entidade.Pessoas.pas',
  Entidade.Pessoas.Telefones in '..\..\Regras\Model\Entidades\Cadastros\Entidade.Pessoas.Telefones.pas',
  Model.Dao.OrmBr in '..\..\Regras\Model\Dao\Model.Dao.OrmBr.pas',
  Model.Dao.Interf in '..\..\Regras\Model\Dao\Model.Dao.Interf.pas',
  Servidor.Controller.Pessoas in '..\..\Regras\Controller\Servidor\Cadastros\Servidor.Controller.Pessoas.pas',
  Model.Dao.Attribute in '..\..\Regras\Model\Dao\Model.Dao.Attribute.pas',
  Model.Dao.MyConection in '..\..\Regras\Model\Dao\Model.Dao.MyConection.pas',
  Model.Params in '..\..\Regras\Model\Model.Params.pas',
  Model.Params.DataBase in '..\..\Regras\Model\Model.Params.DataBase.pas',
  Model.Params.Interf in '..\..\Regras\Model\Model.Params.Interf.pas';

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
