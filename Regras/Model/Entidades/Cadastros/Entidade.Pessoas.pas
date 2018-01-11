unit Entidade.Pessoas;

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
  ormbr.types.blob, Entidade.Interf

  //efficax
  , Entidade.Pessoas.Telefones;

Type
  [Entity]
  [Table('Pessoas', '')]
  [PrimaryKey('Pessoas_Id', AutoInc, NoSort, True, 'Chave primária')]
  [Sequence('seq_PESSOAS')]
  [Indexe('idx_Pessoas_Nome','Nome')]
  TPessoas = class(TInterfacedObject, iEntidade)
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
    [Dictionary('Pessoas_ID', 'Mensagem de validação', '', '', '', taCenter)]
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

constructor TPessoas.Create;
begin
  FTelefones := TObjectList<TTelefone>.create;
end;

destructor TPessoas.Destroy;
var
  i: Integer;
begin
  for i := 0 to FTelefones.Count - 1 do
    FTelefones[i].Free;
  inherited;
end;

procedure TPessoas.SetTelefones(const Value: TObjectList<TTelefone>);
begin
  FTelefones := Value;
end;

initialization

TRegisterClass.RegisterEntity(TPessoas);

end.
