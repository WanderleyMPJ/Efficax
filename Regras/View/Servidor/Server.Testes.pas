unit Server.Testes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,

  FireDAC.Comp.Client, Vcl.StdCtrls, ormbr.factory.interfaces,
  ormbr.factory.FireDAC, ormbr.types.database, ormbr.ddl.commands,
  ormbr.database.interfaces, ormbr.modeldb.compare,
  Server.Controller.Conexao.Strategy, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, TypInfo;

type

  TfrmTestes = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    FDConnection1: TFDConnection;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
  private
    fdb: TFDConnection;
    oConnection: IDBCONNECTION;
    oManager: IDatabaseCompare;
    function MapeiaTipo(tipoDelphi: string): string;
    function FormataPropriedade(Instancia: TObject;
      const PropInfo: TPropInfo): string;
    procedure Build;
    procedure CriarFd;
    procedure CriarConection;
  public
    { Public declarations }
  end;

var
  frmTestes: TfrmTestes;

implementation

{$R *.dfm}

uses Entidade.Pessoas, rtti, System.Generics.Collections, Entidade.Servico;
{ TfrmTestes }

procedure TfrmTestes.Build;
var
  cDDL: TDDLCommand;
begin
  oManager := TModelDbCompare.Create(oConnection);
  // oManager := TDatabaseCompare.Create(oConnection, oConnection);
  oManager.CommandsAutoExecute := True;
  oManager.BuildDatabase;
  for cDDL in oManager.GetCommandList do
    Memo1.Lines.Add(cDDL.Command);
end;

procedure TfrmTestes.Button2Click(Sender: TObject);
var
  obj: TServico;
  infoProps: TPropInfo; // informações sobre a propriedade
  plistaProps: PPropList;
  // ponteiro para array de ponteiros sobre informações da propriedade
  listaProps: TPropList; // array de ponteiros para informações da propriedade
  i: integer;
  totalProps: integer;
begin

  // sempre inicialize o ponteiro como nil
  plistaProps := nil;

  // setando algumas propriedades do nosso objeto
  obj := TServico.Create;
  obj.Servico_ID := 1;
  obj.Descricao := 'Clube Delphi';
  try
    Memo1.Lines.Add('Propriedade:' + #9#9#9 + 'Tipo:' + #9#9#9 + 'Valor');

    // a função  GetPropList seta o ponteiro para lista de propriedades e também retorna o total de propriedades
    totalProps := GetPropList(obj, plistaProps);
    listaProps := plistaProps^;
    // atribuindo a  listaProps o valor armazenado no endereço plistaProps
    for i := 0 to totalProps - 1 do
    begin
      infoProps := listaProps[i]^;
      // atribuindo a infoProps o valor contido no endereço da posição i do vetor listaProps

      // adiciona no memo o nome, tipo e valor da propriedade, separado por 3 tabs, formatado
      Memo1.Lines.Add(infoProps.Name + #9#9#9 + infoProps.PropType^.Name
        + #9#9#9 +

        FormataPropriedade(obj, infoProps));
    end;
  finally
    obj.Free;
    // não podemos esquecer de liberar a memoria do ponteiro
    FreeMem(plistaProps);
  end;
end;

procedure TfrmTestes.CriarConection;
begin
  oConnection := TFactoryFireDAC.Create(fdb, dnFirebird);
end;

procedure TfrmTestes.CriarFd;
var
  database: string;
begin
  database := ExtractFilePath(application.ExeName) + 'DataBase\' +
    'efficax.fdb';

  fdb := TFDConnection.Create(nil);
  fdb.Params.Add('User_Name=SYSDBA');
  fdb.Params.Add('Password=masterkey');
  fdb.Params.Add('Database=' + database);
  fdb.Params.Add('DriverID=FB');
end;

function TfrmTestes.FormataPropriedade(Instancia: TObject;
  const PropInfo: TPropInfo): string;
begin
  if (PropInfo.PropType^.Kind = tkFloat) and (PropInfo.PropType^.Name = 'TDate')
  then
    Result := QuotedStr(FormatDateTime('yyyy-mm-dd', GetPropValue(Instancia,
      PropInfo.Name)))
  else if (PropInfo.PropType^.Kind = tkFloat) and
    (PropInfo.PropType^.Name = 'TTime') then
    Result := QuotedStr(FormatDateTime('hh:nn:ss', GetPropValue(Instancia,
      PropInfo.Name)))
  else if (PropInfo.PropType^.Kind = tkFloat) and
    (PropInfo.PropType^.Name = 'TDateTime') then
    Result := QuotedStr(FormatDateTime('yyyy-mm-dd hh:nn:ss',
      GetPropValue(Instancia, PropInfo.Name)))
  else if (PropInfo.PropType^.Kind in [tkString, tkLString, tkWString,
    tkUString]) and (trim(lowercase(PropInfo.PropType^.Name)) = 'string') then
    Result := QuotedStr(VarToStr(GetPropValue(Instancia, PropInfo.Name)))
  else
    Result := VarToStr(GetPropValue(Instancia, PropInfo.Name));
end;

function TfrmTestes.MapeiaTipo(tipoDelphi: string): string;
begin
  if lowercase(tipoDelphi) = 'string' then
    Result := 'varchar(255)'
  else if lowercase(tipoDelphi) = 'tdatetime' then
    Result := 'datetime'
  else
    Result := tipoDelphi;
end;

end.
