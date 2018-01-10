unit frm.Testes02;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.StdCtrls, FMX.TabControl, FMX.Controls.Presentation, FMX.Edit,
  frm.Pesquisar, System.Generics.Collections, System.Rtti, FMX.Grid.Style,
  Data.Bind.Components, Data.Bind.ObjectScope, FMX.ScrollBox, FMX.Grid,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Controls, Fmx.Bind.Navigator, Data.Bind.Grid,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, Data.Bind.GenData, Client.Controller.Factory,
  Client.Controller.Interf, Entidade.Servico, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type

  TProduto = class
  private
    FDescricao: string;
    Fid: integer;
    procedure SetDescricao(const Value: string);
    procedure Setid(const Value: integer);
  public
    Constructor Create(vId: integer; vDescricao: string);
    property id : integer read Fid write Setid;
    property Descricao: string read FDescricao write SetDescricao;
  end;

  TfrmTestes2 = class(TForm)
    Layout2: TLayout;
    Edit1: TEdit;
    TabControl1: TTabControl;
    tbPesquisar: TTabItem;
    TabItem2: TTabItem;
    lytPesquisar: TLayout;
    Button1: TButton;
    StringGrid1: TStringGrid;
    Edit2: TEdit;
    AdapterBindSource1: TAdapterBindSource;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceAdapterBindSource1: TLinkGridToDataSource;
    NavigatorAdapterBindSource1: TBindNavigator;
    ListView1: TListView;
    LinkListControlToField1: TLinkListControlToField;
    DataGeneratorAdapter1: TDataGeneratorAdapter;
    LinkControlToField1: TLinkControlToField;
    FDMemTable1: TFDMemTable;
    procedure Button1Click(Sender: TObject);
    procedure AdapterBindSource1CreateAdapter(Sender: TObject;
      var ABindSourceAdapter: TBindSourceAdapter);
  private
    fLista: tobjectlist<TServico>;

    Controller: iController;

    FFrmPesquisar: TForm;

  public
    function CarregarLista: TList<TProduto>;
  end;

var
  frmTestes2: TfrmTestes2;

implementation

{$R *.fmx}

procedure TfrmTestes2.AdapterBindSource1CreateAdapter(Sender: TObject;
  var ABindSourceAdapter: TBindSourceAdapter);
begin
  Controller := TControllerFactory.new;

//  ABindSourceAdapter := TListBindSourceAdapter<TProduto>.create(self, CarregarLista);
  ABindSourceAdapter :=  TListBindSourceAdapter<TServico>.Create(self, fLista, true);
end;

procedure TfrmTestes2.Button1Click(Sender: TObject);
var
  LytBase : Tcomponent;
begin
//  if not Assigned(FFrmPesquisar) then
//  Begin
//    FFrmPesquisar.DisposeOf;
//    FFrmPesquisar.Free;
//  End;
//
//  FFrmPesquisar := TFRMPESQUISAR.CREATE(SELF);
////  LytBase := FFrmPesquisar.FindComponent('lytBase');
//  Self.lytPesquisar.AddObject(TLayout(FFrmPesquisar.FindComponent('lytBase')));
  ShowMessage(IntToStr(fLista.Count));

end;

{ TProduto }

constructor TProduto.Create(vId: integer; vDescricao: string);
begin
  Fid := vId;
  FDescricao := vDescricao;
end;

procedure TProduto.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TProduto.Setid(const Value: integer);
begin
  Fid := Value;
end;


function TfrmTestes2.CarregarLista: TList<TProduto>;
var
  I: Integer;
begin
  Result := TList<TProduto>.create;
  for I := 1 to 5 do
  begin
    Result.Add(TProduto.Create(i, 'Produto ' + IntToStr(i)));
  end;
end;

end.
