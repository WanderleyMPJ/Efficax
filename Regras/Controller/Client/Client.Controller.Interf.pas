unit Client.Controller.Interf;

interface

uses
  Data.DB, System.Classes, FMX.Forms, FMX.Grid, Entidade.Interf;

type


  iForm = interface
    ['{5F41A86F-2167-4607-B5CA-EA9F282AD18F}']
  end;

  iShowForm = interface
    ['{66AB5EDA-977E-4666-B016-06C74E428953}']
    function Form(AFormView: TComponentClass): iShowForm;
  end;

  iMetodos = interface
    ['{A4333C71-56BC-4D6F-A960-3B35E118158B}']
    function Open(id: integer; var getValue: iEntidade): iMetodos;
    function Listar(aDataset: TDataSet; Filtro: string; aGrid: TStringGrid) : iMetodos;
    function Novo : iMetodos;
    function Post(Const SetValue: iEntidade): iMetodos;
    function Show: TForm;
  end;

  iController = interface
    ['{9602B73D-A490-4643-8AE9-0AF22B0B868F}']

    function Servico : iMetodos;
    function ServicosGrupo : iMetodos;

  end;

implementation

end.
