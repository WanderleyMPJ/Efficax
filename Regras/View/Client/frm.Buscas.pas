unit frm.Buscas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  System.Generics.Collections, Entidade.Servico, FMX.Layouts, FMX.ListBox,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.ObjectScope;

type
  iView = interface
    ['{29FAD6FC-60D1-45A3-BDD1-D99B60E0E390}']

  end;

  TfrmBuscas = class(TForm)
    ListBox1: TListBox;
    AdapterBindSource1: TAdapterBindSource;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    procedure AdapterBindSource1CreateAdapter(Sender: TObject;
      var ABindSourceAdapter: TBindSourceAdapter);
  private
    fLista: tobjectlist<TServico>;
    { Private declarations }
  public
    constructor create(vLista: tobjectlist<TServico>);
    class function new(vLista: tobjectlist<TServico>) : TFrmBuscas;
  end;


implementation

{$R *.fmx}

{ TfrmBuscas }


procedure TfrmBuscas.AdapterBindSource1CreateAdapter(Sender: TObject;
  var ABindSourceAdapter: TBindSourceAdapter);
begin
  ABindSourceAdapter :=  TListBindSourceAdapter<TServico>.Create(self, fLista, true);
end;

constructor TfrmBuscas.create(vLista: tobjectlist<TServico>);
begin
  fLista := vLista;
end;

class function TfrmBuscas.new(vLista: tobjectlist<TServico>) : TFrmBuscas;
begin
  Result := SELF.create(vLista);
end;

end.
