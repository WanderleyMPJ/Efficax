unit Entidade.Pessoas;

interface

uses

  Classes,
  DB,
  SysUtils,
  Generics.Collections,
  /// orm
  ormbr.mapping.attributes,
  ormbr.types.mapping,
  ormbr.types.lazy,
  ormbr.types.nullable,
  ormbr.mapping.register,

  Entidade.Interf

  //efficax
  , Entidade.Pessoas.Telefones;

Type
  [Entity]
  [Table('Pessoas', '')]
  [PrimaryKey('Pessoas_id', AutoInc, NoSort, True, 'Chave primária')]
  [Sequence('seq_Pessoas')]
  [Indexe('idx_Pessoas_Nome', 'Nome')]
  TPessoas = class(TInterfacedObject, iEntidade)
  private
    FFantasia: string;
    FTelefones: TObjectList<TTelefones>;
    FNome: string;
    FData_Nasc: TDateTime;
    FPessoas_ID: integer;
    procedure SetData_Nasc(const Value: TDateTime);
    procedure SetFantasia(const Value: string);
    procedure SetNome(const Value: string);
    procedure SetTelefones(const Value: TObjectList<TTelefones>);
    procedure SetPessoas_ID(const Value: integer);

  public
    constructor Create;
    destructor Destroy; override;

    [Restrictions([NoUpdate, NotNull])]
    [Column('Pessoas_id', ftInteger)]
    [Dictionary('ID', 'Mensagem de validação', '0', '', '', taCenter)]
    property Pessoas_ID: integer read FPessoas_ID write SetPessoas_ID;

    [Column('Nome', ftString, 100)]
    [Restrictions([NotNull])]
    [Dictionary('Nome', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property Nome: string read FNome write SetNome;

    [Column('Fantasia', ftString, 100)]
    [Dictionary('Nome de Fantasia', 'Mensagem de validação', '', '', '',
      taLeftJustify)]
    property Fantasia: string read FFantasia write SetFantasia;

    [Column('Data_Nasc', ftDate, 18)]
    [Dictionary('Data de Nascimento', 'Mensagem de validação', '', '', '',
      taLeftJustify)]
    property Data_Nasc: TDateTime read FData_Nasc write SetData_Nasc;


    [Association(OneToMany, 'Pessoas_id', 'Pessoas_Telefones', 'Pessoas_id')]
    [CascadeActions([CascadeAutoInc, CascadeInsert, CascadeUpdate, CascadeDelete])]
    property Telefones: TObjectList<TTelefones> read FTelefones write SetTelefones;

  end;

implementation

{ TPessoasModel }

constructor TPessoas.Create;
begin
  FTelefones := TObjectList<TTelefones>.create;
end;

destructor TPessoas.Destroy;
begin
  FTelefones.Free;
  inherited;
end;



procedure TPessoas.SetData_Nasc(const Value: TDateTime);
begin
  FData_Nasc := Value;
end;

procedure TPessoas.SetFantasia(const Value: string);
begin
  FFantasia := Value;
end;

procedure TPessoas.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TPessoas.SetPessoas_ID(const Value: integer);
begin
  FPessoas_ID := Value;
end;

procedure TPessoas.SetTelefones(const Value: TObjectList<TTelefones>);
begin
  FTelefones := Value;
end;

initialization

TRegisterClass.RegisterEntity(TPessoas);

end.
