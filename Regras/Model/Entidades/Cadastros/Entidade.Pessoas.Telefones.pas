unit Entidade.Pessoas.Telefones;

interface

uses
  entidade.Interf,
  Generics.Collections, db,
  /// orm
  ormbr.mapping.attributes,
  ormbr.types.mapping,
  ormbr.types.lazy,
  ormbr.types.nullable,
  ormbr.mapping.register,
    System.Classes;

Type
  [Entity]
  [Table('Pessoas_Telefone', 'Tabela de Telefones')]
  [PrimaryKey('Telefone_Id', AutoInc, NoSort, False, 'Chave primária')]
  [Indexe('IDX_Numero','Numero', NoSort, True, 'Indexe por Telefone')]
  [Sequence('Telefone_SEQ')]

  TTelefone = class(TInterfacedObject, iEntidade)
  private
    FTelefone_ID: integer;
    FDDD: integer;
    FNumero: string;
    FPessoas_id: Integer;
    procedure SetDDD(const Value: integer);
    procedure SetNumero(const Value: string);
    procedure SetTelefone_ID(const Value: integer);
    procedure SetPessoas_id(const Value: Integer);

  public
    constructor Create;
    destructor Destroy; override;

    [Restrictions([NoUpdate, NotNull])]
    [Column('Telefone_id', ftInteger)]
    [Dictionary('Código', 'Mensagem de validação', '', '', '', taCenter)]
    property Telefone_ID: integer read FTelefone_ID write SetTelefone_ID;

    [Restrictions([NotNull])]
    [Column('Pessoas_id', ftInteger)]
    [ForeignKey('FK_Telefone_Pessoas', 'Pessoas_id', 'Pessoas', 'Pessoas_id', Cascade, Cascade)]
    [Dictionary('ID Pessoas','Mensagem de validação','','','',taCenter)]
    property Pessoas_id: Integer read FPessoas_id write SetPessoas_id;

    [Restrictions([NotNull])]
    [Column('Numero', ftString, 12)]
    [Dictionary('Número', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property Numero: string read FNumero write SetNumero;

    [Column('DDD', ftinteger, 2)]
    [Dictionary('Numero', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property DDD: integer read FDDD write SetDDD;

  end;

implementation

{ TTelefone }

constructor TTelefone.Create;
begin

end;

destructor TTelefone.Destroy;
begin

  inherited;
end;

procedure TTelefone.SetDDD(const Value: integer);
begin
  FDDD := Value;
end;

procedure TTelefone.SetNumero(const Value: string);
begin
  FNumero := Value;
end;

procedure TTelefone.SetPessoas_id(const Value: Integer);
begin
  FPessoas_id := Value;
end;

procedure TTelefone.SetTelefone_ID(const Value: integer);
begin
  FTelefone_ID := Value;
end;

initialization
  TRegisterClass.RegisterEntity(TTelefone);

end.
