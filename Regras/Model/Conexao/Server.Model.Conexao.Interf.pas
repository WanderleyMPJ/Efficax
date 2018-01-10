unit Server.Model.Conexao.Interf;

interface

uses
  ormbr.factory.interfaces;

Type

  iConexaoMetadata = interface;

  iConexaoModel = interface
    ['{6E8A31AE-52F2-4970-B9A3-95F2961694D3}']
    function MySql: iConexaoMetadata;
    function Firebird: iConexaoMetadata;
    function SqLite : iConexaoMetadata;
    function DB : IDBConnection;
    function ControleDeSessao: iConexaoModel ;
    function Mastekey(setMaster: string) : iConexaoModel;

    function ThisAs : iConexaoModel;
  end;

  iConexaoMetadata = interface
    function BuildDatabase: iConexaoMetadata;
    function Sql: iConexaoMetadata;
  end;

implementation

end.
