unit Client.Controller.Interf;

interface

uses
  vcl.grids;

type

  iView = interface
    ['{5F41A86F-2167-4607-B5CA-EA9F282AD18F}']
  end;

  iController = interface
    ['{9602B73D-A490-4643-8AE9-0AF22B0B868F}']

    function Servico : iServicoController;

  end;

implementation

end.
