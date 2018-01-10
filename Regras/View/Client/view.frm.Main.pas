unit view.frm.Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.MultiView, FMX.Layouts, FMX.ListBox,
  Client.Controller.Strategy, view.Base, FMX.Objects, System.Actions,
  FMX.ActnList;

type
  TfrmMain = class(TForm)
    lytConteiner: TLayout;
    MultiView1: TMultiView;
    tbMenu: TToolBar;
    spbMenu: TSpeedButton;
    spbExit: TSpeedButton;
    ListBox1: TListBox;
    ListBoxHeader1: TListBoxHeader;
    lbxPessoas: TListBoxItem;
    Menu: TLabel;
    StyleBook1: TStyleBook;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    lbiOs: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    ListBoxItem5: TListBoxItem;
    lbxServicos: TListBoxItem;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    ListBoxGroupHeader2: TListBoxGroupHeader;
    ListBoxGroupHeader3: TListBoxGroupHeader;
    ActionList1: TActionList;
    actServicos: TAction;
    lbxServicosGrupo: TListBoxItem;
    actServicosGrupo: TAction;
    procedure spbExitClick(Sender: TObject);
    procedure ListBoxItem2Click(Sender: TObject);
    procedure ListBoxItem4Click(Sender: TObject);
    procedure actServicosExecute(Sender: TObject);
    procedure lbxServicosClick(Sender: TObject);
    procedure actServicosGrupoExecute(Sender: TObject);
    procedure lbxServicosGrupoClick(Sender: TObject);
  private
    { Private declarations }
    FActiveForm: TForm;
    procedure AbreForm(AFormClass: TComponentClass);
    procedure AbreForm2(const AForm: TForm);

    // procedure AbrirHome;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses Client.frm.Pai;

{ TfrmMain }

procedure TfrmMain.AbreForm(AFormClass: TComponentClass);
var
  lytBase, spbBack: TComponent;
begin
  if Assigned(FActiveForm) then
  begin
    if FActiveForm.ClassType = AFormClass then
      exit
    else
    begin
      FActiveForm.DisposeOf;
      FActiveForm := nil;
    end;
  end;
  Application.CreateForm(AFormClass, FActiveForm);
  lytBase := FActiveForm.FindComponent('lytBase');
  if Assigned(lytBase) then
    frmMain.lytConteiner.AddObject(TLayout(lytBase));

  spbBack := FActiveForm.FindComponent('spbMenu');
  if Assigned(spbBack) then
    frmMain.MultiView1.MasterButton := TControl(spbBack);

  frmMain.tbMenu.Visible := False;
  frmMain.MultiView1.HideMaster;

end;

procedure TfrmMain.AbreForm2(const AForm: TForm);
var
  lytBase, spbBack: TComponent;
begin
  if Assigned(FActiveForm) then
  begin
    if FActiveForm = AForm then
      exit
    else
    begin
      FActiveForm.DisposeOf;
      FActiveForm := nil;
    end;
  end;
  FActiveForm := AForm;

  lytBase := FActiveForm.FindComponent('lytBase');
  if Assigned(lytBase) then
    frmMain.lytConteiner.AddObject(TLayout(lytBase));

  spbBack := FActiveForm.FindComponent('spbMenu');
  if Assigned(spbBack) then
    frmMain.MultiView1.MasterButton := TControl(spbBack);

  frmMain.tbMenu.Visible := False;
  frmMain.MultiView1.HideMaster;
end;

procedure TfrmMain.actServicosExecute(Sender: TObject);
begin
  AbreForm2(Servicos.Show);
end;

procedure TfrmMain.actServicosGrupoExecute(Sender: TObject);
begin
  AbreForm2(ServicosGrupo.Show);
end;

procedure TfrmMain.lbxServicosClick(Sender: TObject);
begin
  actServicosExecute(self);
end;

procedure TfrmMain.lbxServicosGrupoClick(Sender: TObject);
begin
  actServicosGrupoExecute(self);
end;

procedure TfrmMain.ListBoxItem2Click(Sender: TObject);
begin
  close;
  free;
end;

procedure TfrmMain.ListBoxItem4Click(Sender: TObject);
begin
  AbreForm2(frmMain);
end;

procedure TfrmMain.spbExitClick(Sender: TObject);
begin
  close;
  free;
end;

end.
