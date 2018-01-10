unit Client.Controller.Factory.Show;

interface

uses
  Client.Controller.Interf, System.Classes, Vcl.Forms;

Type
  TControllerFactoryShow = class(TInterfacedObject, iShowForm)
  private
    FActiveForm : TForm;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iShowForm;
    function Form(AFormView: TComponentClass): iShowForm;
  end;
implementation

uses
  view.frm.Main, FMX.Layouts, fmx.Controls;

{ TControllerFactoryShow }

constructor TControllerFactoryShow.Create;
begin

end;

destructor TControllerFactoryShow.Destroy;
begin
    inherited;
end;

function TControllerFactoryShow.Form(AFormView: TComponentClass): iShowForm;
var
  lytBase, spbBack: TComponent;
begin
  if Assigned(FActiveForm) then
  begin
    if FActiveForm.ClassType = AFormView then
      exit
    else
    begin
      FActiveForm.DisposeOf;
      FActiveForm := nil;
    end;
  end;
  Application.CreateForm(AFormView, FActiveForm);
  lytBase := FActiveForm.FindComponent('lytBase');
  if Assigned(lytBase) then
    frmMain.lytConteiner.AddObject(TLayout(lytBase));

  spbBack := FActiveForm.FindComponent('spbMenu');
  if Assigned(spbBack) then
    frmMain.MultiView1.MasterButton := TControl(spbBack);

  frmMain.tbMenu.Visible := False;
  frmMain.MultiView1.HideMaster;
end;

class function TControllerFactoryShow.New: iShowForm;
begin
  Result := self.Create;
end;

end.

