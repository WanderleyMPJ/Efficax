unit Model.Util;

interface

uses
  Data.DB;

Type

  TUtil = class
  public
    class procedure JsonToDataset(const aDataset: TDataSet; aJSON: string);
  end;
implementation

uses
  System.JSON, REST.Response.Adapter, System.SysUtils;

{ TUtil }

class procedure TUtil.JsonToDataset(const aDataset: TDataSet; aJSON: string);
var
  JObj: TJSONArray;
  vConv : TCustomJSONDataSetAdapter;
begin
  if (aJSON = EmptyStr) then
  begin
    Exit;
  end;

  JObj := TJSONObject.ParseJSONValue(aJSON) as TJSONArray;
  vConv := TCustomJSONDataSetAdapter.Create(Nil);

  try
    vConv.Dataset := aDataset;
    vConv.UpdateDataSet(JObj);
  finally
    vConv.Free;
    JObj.Free;
  end;
end;

end.
