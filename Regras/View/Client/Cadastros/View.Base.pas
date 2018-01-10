unit View.Base;

interface

uses
  FMX.Forms, System.Classes, Client.Controller.Interf, Entidade.Interf;

Type

  TOperacao = (oListando, oEditando, oInserindo);


  TFormBase = class(TForm)
  protected
    FMetodos: iMetodos;
    FOperacao: TOperacao;
    FEntidade : iEntidade;

    procedure GetDados; virtual; abstract;
    procedure SetDados; virtual; abstract;
    procedure LimparDados; virtual; abstract;
    procedure SetOperacao; virtual; abstract;

  public
    constructor Create(AOwner: TComponent; Metodos: iMetodos);  reintroduce;
  end;

implementation

{ TFormBase }

constructor TFormBase.Create(AOwner: TComponent; Metodos: iMetodos);
begin
  inherited Create(AOwner) ;
  FMetodos := metodos;
  FOperacao := oListando;
  SetOperacao;
end;

end.
