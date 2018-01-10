unit Entidade.Pessoa;

interface

uses

  Generics.Collections, db,
  /// orm
  ormbr.mapping.attributes,
  ormbr.types.mapping,
  ormbr.types.lazy,
  ormbr.types.nullable,
  ormbr.mapping.register, System.Classes, System.Generics.Collections,
  Entidade.Interf, Entidade.Pessoa.Telefone;

Type

  [Entity]
  [Table('Pessoas', 'Tabela de Pessoas')]
  [PrimaryKey('Pessoas_Id', AutoInc, NoSort, False, 'Chave primária')]
  [Indexe('IDX_Nome','Nome', NoSort, True, 'Indexe por nome')]
  [Sequence('PESSOAS_SEQ')]
  TPessoa = class(TInterfacedObject, iEntidade)
  private
    FPessoas_ID: integer;
    FNome: string;
    FFantasia : string;
    FTelefones: TObjectList<TTelefone>;

    procedure SetTelefones(const Value: TObjectList<TTelefone>);
  public
    constructor Create;
    destructor Destroy; override;

    [Restrictions([NoUpdate, NotNull])]
    [Column('Pessoas_Id', ftInteger)]
    [Dictionary('Código ID', 'Mensagem de validação', '0', '', '', taCenter)]
    property Pessoas_ID: integer index 0 read FPessoas_ID write FPessoas_ID;

    [Column('Nome', ftString, 100)]
    [Restrictions([NotNull])]
    [Dictionary('Nome', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property Nome: string index 1 read FNome write FNome;

    [Column('Fantasia', ftString, 100)]
    [Dictionary('Nome de Fantasia', 'Mensagem de validação', '', '', '',
      taLeftJustify)]
    property Fantasia: string index 2 read FFantasia write FFantasia;

    [Association(OneToMany, 'Pessoas_id', 'Pessoas_Telefone', 'Pessoas_id')]
    [CascadeActions([CascadeAutoInc, CascadeInsert, CascadeUpdate, CascadeDelete])]
    property Telefones: TObjectList<TTelefone> read FTelefones write SetTelefones;

  end;

implementation

{ TPessoasModel }

constructor TPessoa.Create;
begin

end;

destructor TPessoa.Destroy;
begin

  inherited;
end;

procedure TPessoa.SetTelefones(const Value: TObjectList<TTelefone>);
begin
  FTelefones := Value;
end;

initialization

TRegisterClass.RegisterEntity(TPessoa);

end.
