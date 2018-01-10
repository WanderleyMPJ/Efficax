unit Client.frm.ServicosGrupo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  Client.Frm.Pai, System.Rtti, FMX.Grid.Style, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Actions, FMX.ActnList,
  FMX.ScrollBox, FMX.Grid, FMX.ListBox, FMX.Edit, FMX.TabControl,
  FMX.Controls.Presentation, FMX.Layouts;

type
  TfrmServicosGrupo = class(TfrmPai)
    edtId: TEdit;
    Label3: TLabel;
    edtDescricao: TEdit;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    procedure GetDados; override;
    procedure SetDados; override;
    procedure LimparDados; override;
  public
    { Public declarations }
  end;

var
  frmServicosGrupo: TfrmServicosGrupo;

implementation

uses
  Entidade.Servico.Grupo;

{$R *.fmx}

procedure TfrmServicosGrupo.FormCreate(Sender: TObject);
begin
  inherited;
  FEntidade := TServicoGrupo.Create;
  lblTitulo.Text := 'Cadastro de Serviços';
end;

procedure TfrmServicosGrupo.GetDados;
begin
  inherited;
  edtId.Text := IntToStr(TServicoGrupo(FEntidade).ServicoGrupo_id);
  edtDescricao.Text := TServicoGrupo(FEntidade).Descricao;
end;

procedure TfrmServicosGrupo.LimparDados;
begin
  inherited;
  edtId.Text          := '';
  edtDescricao.Text   := '';
end;

procedure TfrmServicosGrupo.SetDados;
begin
  inherited;
  if edtId.Text <> '' then
    TServicoGrupo(FEntidade).ServicoGrupo_id := StrToInt(edtId.Text);
  TServicoGrupo(FEntidade).Descricao := edtDescricao.Text;
end;

end.
