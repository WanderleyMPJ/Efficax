program AppClient;

uses
  System.StartUpCopy,
  FMX.Forms,
  Cliente.Conection.Model in '..\..\Regras\Model\Conexao\Cliente\Cliente.Conection.Model.pas',
  Cliente.Conection.Model.Interf in '..\..\Regras\Model\Conexao\Cliente\Cliente.Conection.Model.Interf.pas',
  Cliente.DM in '..\..\Regras\Model\Conexao\Cliente\Cliente.DM.pas' {DM: TDataModule},
  Cliente.Rest in '..\..\Regras\Model\Conexao\Cliente\Cliente.Rest.pas',
  Cliente.Servico.Model in '..\..\Regras\Model\Cadastros\Cliente.Servico.Model.pas',
  Entidade.Servico in '..\..\Regras\Model\Entidades\Cadastros\Entidade.Servico.pas',
  Entidade.Interf in '..\..\Regras\Model\Entidades\Entidade.Interf.pas',
  Client.Controller.Interf in '..\..\Regras\Controller\Client\Client.Controller.Interf.pas',
  Client.Controller.Factory in '..\..\Regras\Controller\Client\Client.Controller.Factory.pas',
  Entidade.Model in '..\..\Regras\Model\Entidades\Entidade.Model.pas',
  Pessoa.Controller.Interf in 'Controllers\Pessoa.Controller.Interf.pas',
  Pessoa.Controller in 'Controllers\Pessoa.Controller.pas',
  Pessoa.Model in 'Models\Pessoa.Model.pas',
  Pessoa.Model.Interf in 'Models\Pessoa.Model.Interf.pas',
  Model.Util in '..\..\Regras\Model\Model.Util.pas',
  Client.Controller.Strategy in '..\..\Regras\Controller\Client\Client.Controller.Strategy.pas',
  view.frm.Main in '..\..\Regras\View\Client\view.frm.Main.pas' {frmMain},
  Client.Controller.Servicos in '..\..\Regras\Controller\Client\Cadastros\Client.Controller.Servicos.pas',
  view.frm.CadPadrao in '..\..\Regras\View\Client\view.frm.CadPadrao.pas' {frmCadPadrao},
  Client.Controller.Factory.Show in '..\..\Regras\Controller\Client\Client.Controller.Factory.Show.pas',
  View.Base in '..\..\Regras\View\Client\Cadastros\View.Base.pas',
  Client.Frm.Pai in '..\..\Regras\View\Client\Client.Frm.Pai.pas' {frmPai},
  Client.frm.Servicos in '..\..\Regras\View\Client\Cadastros\Client.frm.Servicos.pas' {frmServicos},
  Entidade.Servico.Grupo in '..\..\Regras\Model\Entidades\Cadastros\Entidade.Servico.Grupo.pas',
  Cliente.Controller.Servicos.Grupo in '..\..\Regras\Controller\Cliente\Cadastro\Cliente.Controller.Servicos.Grupo.pas',
  Client.frm.ServicosGrupo in '..\..\Regras\View\Client\Cadastros\Client.frm.ServicosGrupo.pas' {frmServicosGrupo};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
