unit Cliente.Frm.Pessoas;

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
  TfrmPessoas = class(TfrmPai)
    edtRazao: TEdit;
    Label4: TLabel;
    edtId: TEdit;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    procedure GetDados; override;
    procedure SetDados; override;
    procedure LimparDados; override;
  public
    { Public declarations }
  end;

var
  frmPessoas: TfrmPessoas;

implementation

uses
  Entidade.Pessoas;

{$R *.fmx}

procedure TfrmPessoas.FormCreate(Sender: TObject);
begin
  inherited;
  FEntidade := TPessoas.Create;
  lblTitulo.Text := 'Cadastro de Pessoas';
end;

procedure TfrmPessoas.GetDados;
begin
  inherited;
  edtId.Text    := IntToStr(TPessoas(FEntidade).Pessoas_ID);
  edtrazao.Text := TPessoas(FEntidade).Nome;
end;

procedure TfrmPessoas.LimparDados;
begin
  inherited;
  edtId.Text          := '';
  edtRazao.Text   := '';
end;

procedure TfrmPessoas.SetDados;
begin
  if edtId.Text <> '' then
    TPessoas(FEntidade).Pessoas_id := StrToInt(edtId.Text);
  TPessoas(FEntidade).Nome := edtRazao.Text;
  inherited;
end;

end.
