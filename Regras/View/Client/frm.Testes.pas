unit frm.Testes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, System.Rtti,
  FMX.Grid.Style, FMX.ScrollBox, FMX.Grid, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView, Data.Bind.ObjectScope, Cliente.Servico.Controller,
  Data.Bind.GenData, Data.Bind.EngExt, FMX.Bind.DBEngExt, FMX.Bind.Editors, Client.Controller.Interf,
  System.Generics.Collections, Entidade.Servico, System.Bindings.Outputs,
  Data.Bind.Components, FMX.Memo, FMX.Layouts, FMX.ListBox, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Data.Bind.DBScope, Fmx.Bind.Grid, Data.Bind.Grid;

type
  TfrmTestes = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Edit2: TEdit;
    Button6: TButton;
    StringGrid1: TStringGrid;
    ListView1: TListView;
    FDMemTable1: TFDMemTable;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    LinkListControlToField1: TLinkListControlToField;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Adpt(Sender: TObject; var ABindSourceAdapter: TBindSourceAdapter);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure PrototypeBindSource1CreateAdapter(Sender: TObject;
      var ABindSourceAdapter: TBindSourceAdapter);
    procedure FormCreate(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private

    fLista: tobjectlist<TServico>;

    Controller: iController;

    procedure criaritens(q: integer);
    procedure LoadListview;

  public
    { Public declarations }
  end;

var
  frmTestes: TfrmTestes;

implementation

{$R *.fmx}

uses Cliente.Conection.Model, Entidade.Interf,
  Entidade.Model, Client.Controller.Factory;

procedure TfrmTestes.Adpt(Sender: TObject;
  var ABindSourceAdapter: TBindSourceAdapter);
begin
  if not Assigned(Controller) then
  begin
    Controller := TControllerFactory.new;
  end;
  // Controller.Servico.setAdapter(AdapterBindSource1);
  //
  // ABindSourceAdapter := TListBindSourceAdapter<TServico>.Create(self, Controller.Servico.getList, True);
  //
  /// //  Controller.Servico.FAdapterBindSourceCreateAdapter(sender, ABindSourceAdapter);
//  S := TServico.Create;
//  fLista := tobjectlist<TServico>.Create;
//
//  S.Servico_id := 1;
//  S.Descricao := 'Teste';
//
//  fLista.Add(S);
//
//  S.Servico_id := 2;
//  S.Descricao := 'Teste2';
//
//  fLista.Add(S);

//  flista := Controller.Servico.Listar('servico_id=-989');

//  criaritens(2);

  ABindSourceAdapter := TListBindSourceAdapter<TServico>.Create(self,
    fLista, True);
end;

procedure TfrmTestes.Button1Click(Sender: TObject);
var
  Servico: TEntidadeModel;
begin
  // Servico := TServico.Create;
  // TConectionModel.new.Servico.Lista('', Servico);
  // ShowMessage(TServico(servico).Descricao);
end;

procedure TfrmTestes.Button2Click(Sender: TObject);
var
  Servico: iEntidade;
begin
  // Servico := TServico.Create;
  // TServico(servico).Servico_id := StrToInt(Edit2.Text);
  TServico(Servico).Descricao := Edit1.Text;
  // TConectionModel.new.Servico.Post(Servico);
  ShowMessage('ok');
end;

procedure TfrmTestes.Button3Click(Sender: TObject);
var
  S: TServico;
  i: integer;

begin
//  criaritens(4);

//  S := TServico.Create;
//
//  i := fLista.Count;
//  fLista.Add(TServico.Create);
//  S.Servico_id := i;
//  S.Descricao := 'Teste' + IntToStr(i);
//  fLista[i] := S;
//
//  i := fLista.Count;
//  fLista.Add(TServico.Create);
//  S.Servico_id := i;
//  S.Descricao := 'Teste' + IntToStr(i);
//  fLista[i] := S;
//
//  i := fLista.Count;
//  fLista.Add(TServico.Create);
//  S.Servico_id := i;
//  S.Descricao := 'Teste' + IntToStr(i);
//  fLista[i] := S;


//  ShowMessage(fLista[fLista.Count - 1].Descricao);

end;

procedure TfrmTestes.Button4Click(Sender: TObject);
begin
  // TServicoController.New(AdapterBindSource1);
end;

procedure TfrmTestes.Button5Click(Sender: TObject);
var
  ADataset:TDataset;
begin
//  fLista := Controller.Servico.Listar('');
end;

procedure TfrmTestes.Button6Click(Sender: TObject);
var
  filtro: string;
begin
  if Edit2.Text <> '' then
    filtro := 'descricao = ' + QuotedStr( Edit2.Text)
  else
    filtro := '';
end;

procedure TfrmTestes.criaritens(q: integer);
var
  i, j: integer;
begin
  for j := 1 to q do
  begin
    i := fLista.Count;
    fLista.Add(TServico.Create);
    fLista[i].Servico_id := i;
    fLista[i].Descricao := 'Teste' + IntToStr(i);
  end;
end;

procedure TfrmTestes.FormCreate(Sender: TObject);
begin
  Controller := TControllerFactory.new;

//  fLista := TObjectList<TServico>.create;
end;

procedure TfrmTestes.LoadListview;
var
  I: Integer;
begin
  for I := 0 to fLista.Count - 1 do
  begin
//    ListBox1.AddObject(Flista);
  end;
end;

procedure TfrmTestes.PrototypeBindSource1CreateAdapter(Sender: TObject;
  var ABindSourceAdapter: TBindSourceAdapter);
begin
  ABindSourceAdapter :=  TListBindSourceAdapter<TServico>.Create(self, fLista, true);
end;

end.
