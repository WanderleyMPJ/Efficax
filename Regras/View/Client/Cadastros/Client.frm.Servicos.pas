unit Client.frm.Servicos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  Client.Frm.Pai, System.Rtti, FMX.Grid.Style, System.Actions, FMX.ActnList,
  FMX.ScrollBox, FMX.Grid, FMX.ListBox, FMX.Edit, FMX.TabControl,
  FMX.Controls.Presentation, FMX.Layouts, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, Entidade.Servico, Data.Bind.GenData,
  Data.Bind.ObjectScope;

type
  TfrmServicos = class(TfrmPai)
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
  frmServicos: TfrmServicos;

implementation


{$R *.fmx}

procedure TfrmServicos.FormCreate(Sender: TObject);
begin
  inherited;
  FEntidade := TServico.Create;
  lblTitulo.Text := 'Cadastro de Serviços';
end;

procedure TfrmServicos.GetDados;
begin
  edtId.Text := IntToStr(TServico(FEntidade).Servico_id);
  edtDescricao.Text := TServico(FEntidade).Descricao;
end;

procedure TfrmServicos.LimparDados;
begin
  edtId.Text          := '';
  edtDescricao.Text   := '';
  inherited;
end;

procedure TfrmServicos.SetDados;
begin
  if edtId.Text <> '' then
    TServico(FEntidade).Servico_id := StrToInt(edtId.Text);
  TServico(FEntidade).Descricao := edtDescricao.Text;
end;

end.
