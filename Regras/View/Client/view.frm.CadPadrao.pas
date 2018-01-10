unit view.frm.CadPadrao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Edit, FMX.ListBox, FMX.StdCtrls, FMX.ListView, FMX.TabControl,
  FMX.Controls.Presentation, FMX.Layouts, System.Actions, FMX.ActnList,
  FMX.Objects, Client.Controller.Interf, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, System.Rtti, FMX.Grid.Style, FMX.ScrollBox, FMX.Grid,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  View.Base;

type

  iEntidade = interface
    ['{F3320AA5-681B-41EE-9715-A2539084E28E}']

  end;


  TTeste = class(Tinterfacedobject, iEntidade)

  end;


  TfrmCadPadrao = class(TFormBase)
    lytBase: TLayout;
    tblTitulo: TToolBar;
    spbMenu: TSpeedButton;
    spbAdd: TSpeedButton;
    spbEdt: TSpeedButton;
    spbCanc: TSpeedButton;
    spbBack: TSpeedButton;
    spbExc: TSpeedButton;
    tbcOperacao: TTabControl;
    tbiLista: TTabItem;
    tbiDados: TTabItem;
    ToolBar2: TToolBar;
    StyleBook1: TStyleBook;
    lblTitulo: TLabel;
    spbSalv: TSpeedButton;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    edtBuscar: TEdit;
    SpeedButton7: TSpeedButton;
    act: TActionList;
    tcaDados: TChangeTabAction;
    TcaListar: TChangeTabAction;
    lytFormulario: TLayout;
    actEditar: TAction;
    actListar: TAction;
    actSalvar: TAction;
    fdmListar: TFDMemTable;
    stgListar: TStringGrid;
    bsDBListar: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    actExcluir: TAction;
    actNovo: TAction;
    StringColumn1: TStringColumn;
    StringColumn2: TStringColumn;
    procedure actListarExecute(Sender: TObject);
  protected
    procedure SetOperacao; override;
  private

  public

  end;

var
  frmCadPadrao: TfrmCadPadrao;

implementation

uses
  Winapi.Windows;

{$R *.fmx}
{ TForm1 }

procedure TfrmCadPadrao.actListarExecute(Sender: TObject);
begin
  FMetodos.Listar(fdmListar, edtBuscar.Text, stgListar);
end;

procedure TfrmCadPadrao.SetOperacao;
begin
  inherited;
  if FOperacao = oListando then
  begin
    tbcOperacao.ActiveTab := tbiLista;
    TcaListar.Execute;
    edtBuscar.SetFocus;
  end
  else
    tbcOperacao.ActiveTab := tbiDados;

  actNovo.Enabled     := FOperacao = oListando;
  actSalvar.Enabled   := FOperacao = oEditando;
  actEditar.Enabled   := FOperacao = oListando;
  actExcluir.Enabled  := fdmListar.RecordCount > 0;
end;





end.
