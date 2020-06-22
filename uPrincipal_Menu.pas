unit uPrincipal_Menu;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Objects,
  FMX.StdCtrls,
  FMX.Layouts,
  FMX.Controls.Presentation,
  FMX.MultiView,
  FMX.TabControl,
  IniFiles,
  System.IOUtils,
  FMX.Edit,
  FMX.Ani;

type
  TFormPrincipal = class(TForm)
    mtvMenu: TMultiView;
    Layout1: TLayout;
    ToolBarMenu: TToolBar;
    sp_menu: TSpeedButton;
    Rec_MenuTop: TRectangle;
    VertScrollBox1: TVertScrollBox;
    Rectangle2: TRectangle;
    Image1: TImage;
    LabelClientes: TLabel;
    Rectangle3: TRectangle;
    Image2: TImage;
    Label2: TLabel;
    Rectangle1: TRectangle;
    ToolBar: TBrushObject;
    TabControl1: TTabControl;
    Rectangle5: TRectangle;
    TabLogin: TTabItem;
    TabMain: TTabItem;
    lylNavegacao: TLayout;
    SpeedButton1: TSpeedButton;
    Image3: TImage;
    Image4: TImage;
    FloatAnimation2: TFloatAnimation;
    LayoutCampos: TLayout;
    Layout5: TLayout;
    Image5: TImage;
    Layout2: TLayout;
    Rectangle4: TRectangle;
    Image6: TImage;
    EditSenha: TEdit;
    Layout4: TLayout;
    rect_Login: TRectangle;
    Label1: TLabel;
    Layout3: TLayout;
    Rectangle6: TRectangle;
    Image7: TImage;
    EditUsuario: TEdit;
    FloatAnimation1: TFloatAnimation;
    FloatAnimation3: TFloatAnimation;
    StyleBook1: TStyleBook;
    procedure FormCreate(Sender: TObject);
    procedure Rectangle3Click(Sender: TObject);
    procedure Rectangle2Click(Sender: TObject);
    procedure FloatAnimation1Finish(Sender: TObject);
    procedure rect_LoginClick(Sender: TObject);
    procedure rect_LoginMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure rect_LoginMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.fmx}

uses uLibary,uFormClientes, uFormConfig;

{ TForm1 }

procedure TFormPrincipal.FloatAnimation1Finish(Sender: TObject);
begin
  image4.Visible := True;
  LayoutCampos.Visible := False;
  FloatAnimation2.Start;
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin

  TabControl1.TabPosition := TTabPosition.None;
  TabControl1.ActiveTab := TabLogin;

  TCriacaoForm.ActiveForm := nil;
  TCriacaoForm.MainMenu := mtvMenu;
  TCriacaoForm.LayoutMain := lylNavegacao;

  MtvMenu.HideMaster;

end;

procedure TFormPrincipal.Rectangle2Click(Sender: TObject);
begin
  TCriacaoForm.OpenForm(TFormClientes,nil);
  TabControl1.Next();
  mtvMenu.Visible := False;

  ToolBarMenu.DisposeOf;
  ToolBarMenu := nil;
end;

procedure TFormPrincipal.Rectangle3Click(Sender: TObject);
begin
  TCriacaoForm.OpenForm(TFormConfig,nil);
  TabControl1.Next();
  mtvMenu.Visible := False;

  ToolBarMenu.DisposeOf;
  ToolBarMenu := nil;
end;

procedure TFormPrincipal.rect_LoginClick(Sender: TObject);
begin
  FloatAnimation1.Start;
end;

procedure TFormPrincipal.rect_LoginMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
   TRectangle(Sender).Opacity := 0.8;
end;

procedure TFormPrincipal.rect_LoginMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  TRectangle(Sender).Opacity := 1;
end;

end.
