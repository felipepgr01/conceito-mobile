unit uBaseLista;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Layouts, uLibary, FMX.MultiView;

type
  TFormBaseLyt = class(TForm)
    lylGeral: TLayout;
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    Rectangle1: TRectangle;
    sp_menu: TSpeedButton;
    mtvMenu: TMultiView;
    Rec_MenuTop: TRectangle;
    VertScrollBox1: TVertScrollBox;
    Rectangle2: TRectangle;
    Image1: TImage;
    LabelClientes: TLabel;
    Rectangle3: TRectangle;
    Image2: TImage;
    Label2: TLabel;
    Image3: TImage;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormBaseLyt: TFormBaseLyt;

implementation

uses
  uFormClientes, uPrincipal_Menu, FMX.TabControl;

{$R *.fmx}

procedure TFormBaseLyt.SpeedButton1Click(Sender: TObject);
begin
  TCriacaoForm.OpenForm(TFormPrincipal,nil);
  FormPrincipal.TabControl1.Next();
  mtvMenu.Visible := False;
  FormPrincipal.ToolBarMenu.DisposeOf;
  FormPrincipal.ToolBarMenu := nil;
  MtvMenu.HideMaster;
end;

end.
