unit frm.View.Model;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  System.Rtti, FMX.Grid.Style,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Grid, Data.Bind.GenData,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Fmx.Bind.Grid, Data.Bind.Grid, Data.Bind.Components,
  Data.Bind.ObjectScope, FMX.StdCtrls, FMX.Edit, Client.Controller.Interf;

type
  TForm1 = class(TForm, iView)
    StringGrid1: TStringGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    edtPesquisar: TEdit;
    Button1: TButton;
    Button2: TButton;
    DataGeneratorAdapter1: TDataGeneratorAdapter;
    AdapterBindSource1: TAdapterBindSource;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkGridToDataSourceAdapterBindSource1: TLinkGridToDataSource;
    LinkControlToField2: TLinkControlToField;
  private
    { Private declarations }
  public
    function StringGridMaster: TStringGrid;
  end;

var
  Form1: TForm1;

implementation

{ TForm1 }


{ TForm1 }

function TForm1.StringGridMaster: TStringGrid;
begin

end;

end.
