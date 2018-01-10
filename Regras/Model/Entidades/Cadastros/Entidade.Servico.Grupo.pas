unit Entidade.Servico.Grupo;

interface

uses
  Classes,
  DB,
  SysUtils,
  Generics.Collections,
  /// orm
  ormbr.mapping.attributes,
  ormbr.types.nullable,
  ormbr.types.mapping,
  ormbr.mapping.register,
  ormbr.types.blob, Entidade.Interf;

type

  [Entity]
  [Table('ServicoGrupo', '')]
  [PrimaryKey('ServicoGrupo_id', AutoInc, NoSort, True, 'Chave primária')]
  [Sequence('seq_ServicoGrupo')]
  [Indexe('idx_servicoGrupo_descricao', 'descricao')]
  TServicoGrupo = class(TInterfacedObject, iEntidade)
  private
    { Private declarations }
    FServicoGrupo_id: Integer;
    FDescricao: String;
  public
    Constructor Create;
    Destructor Destroy; override;
    { Public declarations }
    [Restrictions([NoUpdate, NotNull])]
    [Column('ServicoGrupo_id', ftInteger)]
    [Dictionary('ServicoGrupo_Id','Mensagem de validação','0','','',taCenter)]
    property ServicoGrupo_id: Integer read FServicoGrupo_id write FServicoGrupo_id;

    [Column('Descricao', ftString, 180)]
    [Dictionary('Descrição', 'Mensagem de validação', '', '', '',
      taLeftJustify)]
    property Descricao: String read FDescricao write FDescricao;

  end;

implementation

{ TServicoGrupo }

constructor TServicoGrupo.Create;
begin

end;

destructor TServicoGrupo.Destroy;
begin

  inherited;
end;


initialization

TRegisterClass.RegisterEntity(TServicoGrupo);

end.

