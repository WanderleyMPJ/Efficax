unit Client.Frm.Pai;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, View.Base,
  FMX.Layouts, FMX.StdCtrls, FMX.Controls.Presentation, FMX.TabControl,
  FMX.Edit, FMX.ListBox, System.Actions, FMX.ActnList, System.Rtti,
  FMX.Grid.Style, FMX.ScrollBox, FMX.Grid, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, Entidade.Interf, Data.Bind.ObjectScope;

type
  TfrmPai = class(TFormBase)
    lytBase: TLayout;
    StyleBook1: TStyleBook;
    ToolBar1: TToolBar;
    spbMenu: TSpeedButton;
    tbcGeral: TTabControl;
    tbiListar: TTabItem;
    tbiDados: TTabItem;
    Panel1: TPanel;
    edtBusca: TEdit;
    cbxCampo: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    Panel2: TPanel;
    sbtSalvar: TSpeedButton;
    sbtListar: TSpeedButton;
    sbtEditar: TSpeedButton;
    sbtExcluir: TSpeedButton;
    actGeral: TActionList;
    actNovo: TAction;
    actExcluir: TAction;
    actEditar: TAction;
    actSalvar: TAction;
    sbtNovo: TSpeedButton;
    actListar: TAction;
    stgLista: TStringGrid;
    lblTitulo: TLabel;
    fdmLista: TFDMemTable;
    actPesquisar: TAction;
    bsdLista: TBindSourceDB;
    bglLista: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    Panel3: TPanel;
    procedure actNovoExecute(Sender: TObject);
    procedure actListarExecute(Sender: TObject);
    procedure actPesquisarExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure stgListaCellDblClick(const Column: TColumn; const Row: Integer);
  private
    procedure setOperacao; override;

  protected
  public
    { Public declarations }
  end;

var
  frmPai: TfrmPai;

implementation

{$R *.fmx}

{ TfrmPai }

procedure TfrmPai.actEditarExecute(Sender: TObject);
begin
  LimparDados;
  FMetodos.Open(fdmLista.Fields[0].AsInteger, fEntidade);
  GetDados;
  FOperacao := oEditando;
  SetOperacao;
end;

procedure TfrmPai.actListarExecute(Sender: TObject);
begin
  FOperacao := oListando;
  SetOperacao;
end;

procedure TfrmPai.actNovoExecute(Sender: TObject);
begin
  LimparDados;
  FOperacao := oInserindo;
  SetOperacao;
end;

procedure TfrmPai.actPesquisarExecute(Sender: TObject);
begin
  FMetodos.Listar(fdmLista, edtBusca.Text, stgLista);
  SetOperacao;
end;

procedure TfrmPai.actSalvarExecute(Sender: TObject);
begin
  SetDados;
  FMetodos.Post(fentidade);
  LimparDados;
end;

procedure TfrmPai.SetOperacao;
begin
  inherited;
  if FOperacao = oListando then
    tbcGeral.ActiveTab := tbiListar
  else
    tbcGeral.ActiveTab := tbiDados;

  actNovo.Enabled     := FOperacao = oListando;
  actEditar.Enabled   := (FOperacao = oListando) and (fdmLista.RecordCount > 0);
  actExcluir.Enabled  := FOperacao = oEditando;
  actSalvar.Enabled   := (FOperacao = oEditando) or (FOperacao = oinserindo);
  actListar.Enabled   := (FOperacao = oEditando) or (FOperacao = oinserindo);

  sbtNovo.Visible     := actNovo.Enabled;
  sbtEditar.Visible   := actEditar.Enabled;
  sbtExcluir.Visible  := actExcluir.Enabled;
  sbtSalvar.Visible   := actSalvar.Enabled;
  sbtListar.Visible   := actListar.Enabled;
end;

procedure TfrmPai.stgListaCellDblClick(const Column: TColumn;
  const Row: Integer);
begin
  actEditarExecute(self);
end;

end.
