unit Entidade.Servico;

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
  [Table('Servico', '')]
  [PrimaryKey('Servico_id', AutoInc, NoSort, True, 'Chave primária')]
  [Sequence('seq_Servico')]
  [Indexe('idx_servico_descricao', 'descricao')]
  TServico = class(TInterfacedObject, iEntidade)
  private
    { Private declarations }
    FServico_id: Integer;
    FDescricao: String;
    FGrupo_id: integer;
  public
    Constructor Create;
    Destructor Destroy; override;
    { Public declarations }
    [Restrictions([NoUpdate, NotNull])]
    [Column('Servico_id', ftInteger)]
    [Dictionary('Servico_Id','Mensagem de validação','0','','',taCenter)]
    property Servico_id: Integer read FServico_id write FServico_id;

    [Column('Descricao', ftString, 180)]
    [Dictionary('Descrição', 'Mensagem de validação', '', '', '',
      taLeftJustify)]
    property Descricao: String read FDescricao write FDescricao;

    [Column('Grupo_ID', ftInteger)]
    [Dictionary('Grupo', 'Mensagem de validação', '', '', '',
      taLeftJustify)]
    property Grupo_id : integer read FGrupo_id write FGrupo_id;
  end;

implementation

{ TServico }


{ TServico }

constructor TServico.Create;
begin

end;

destructor TServico.Destroy;
begin

  inherited;
end;

initialization

TRegisterClass.RegisterEntity(TServico);

end.
