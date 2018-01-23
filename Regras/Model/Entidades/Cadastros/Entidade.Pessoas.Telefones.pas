unit Entidade.Pessoas.Telefones;

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
  ormbr.mapping.register, Entidade.Interf;

type

  [Entity]
  [Table('Pessoas_Telefones', '')]
  [PrimaryKey('Telefones_id; Pessoas_id', AutoInc, NoSort, True, 'Chave primária')]
  [Sequence('seq_Telefones')]
  [Indexe('idx_Telefones_Numero', 'Numero')]
  TTelefones = class(TInterfacedObject, iEntidade)
  private
    FPessoas_ID: integer;
    FDDD: integer;
    FNumero: String;
    FTelefones_id: Integer;
    procedure SetDDD(const Value: integer);
    procedure SetNumero(const Value: String);
    procedure SetPessoas_ID(const Value: integer);
    procedure SetTelefones_id(const Value: Integer);
    { Private declarations }
  public
    Constructor Create;
    Destructor Destroy; override;

    { Public declarations }
    [Restrictions([NoUpdate, NotNull])]
    [Column('Telefones_id', ftInteger)]
    [Dictionary('Telefone Id','Mensagem de validação','0','','',taCenter)]
    property Telefones_id: Integer read FTelefones_id write SetTelefones_id;

    [Column('Numero', ftString, 10)]
    [Dictionary('Número', 'Mensagem de validação', '', '', '',
      taLeftJustify)]
    property Numero: String read FNumero write SetNumero;

    [Column('DDD', ftInteger)]
    [Dictionary('DDD', 'Mensagem de validação', '', '', '',
      taLeftJustify)]
    property DDD : integer read FDDD write SetDDD;

    [Restrictions([NotNull])]
    [Column('Pessoas_id', ftInteger)]
    [ForeignKey('FK_Telefone_Pessoas', 'Pessoas_id', 'Pessoas', 'Pessoas_id', Cascade, Cascade)]
    [Dictionary('ID Pessoas','Mensagem de validação','0','','',taCenter)]
    property Pessoas_ID : integer read FPessoas_ID write FPessoas_ID;
  end;

implementation

{ TPessoasTelefones }


{ TPessoasTelefones }

constructor TTelefones.Create;
begin

end;

destructor TTelefones.Destroy;
begin

  inherited;
end;

procedure TTelefones.SetDDD(const Value: integer);
begin
  FDDD := Value;
end;

procedure TTelefones.SetNumero(const Value: String);
begin
  FNumero := Value;
end;

procedure TTelefones.SetPessoas_ID(const Value: integer);
begin
  FPessoas_ID := Value;
end;

procedure TTelefones.SetTelefones_id(const Value: Integer);
begin
  FTelefones_id := Value;
end;

initialization

TRegisterClass.RegisterEntity(TTelefones);

end.
