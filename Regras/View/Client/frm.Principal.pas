unit frm.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, frm.Testes02;

type
  TfrmPrincipal = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

uses frm.Testes;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  try
    frmTestes := TfrmTestes.Create(self);
    frmTestes.ShowModal;
  finally
    FreeAndNil(frmTestes);
  end;
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
begin
  try
    frmTestes2 := TfrmTestes2.Create(self);
    frmTestes2.ShowModal;
  finally
    FreeAndNil(frmTestes2);
  end;
end;

end.
