unit view.frm.Servicos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  view.frm.CadPadrao, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ActnList, System.Actions, FMX.TabControl,
  FMX.Objects, FMX.ListView, FMX.Edit, FMX.ListBox, FMX.Controls.Presentation,
  FMX.Layouts, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  System.Rtti, FMX.Grid.Style, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, FMX.ScrollBox,
  FMX.Grid, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmServicos = class(TfrmCadPadrao)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
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
  lblTitulo.Text := 'Cadastro de Serviços';
end;

end.
