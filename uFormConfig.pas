unit uFormConfig;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uBaseLista, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts,
  FMX.MultiView,
  FMX.Edit, System.IOUtils;

type
  TFormConfig = class(TFormBaseLyt)
    Label1: TLabel;
    Layout1: TLayout;
    Rectangle4: TRectangle;
    LabelHost: TLabel;
    Label3: TLabel;
    edtPorta: TEdit;
    edtHost: TEdit;
    Switch1: TSwitch;
    Label4: TLabel;
    Rectangle5: TRectangle;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Rectangle2Click(Sender: TObject);
    procedure Rectangle3Click(Sender: TObject);
    procedure Rectangle5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function CarregarConfig(): String;
    procedure GravarConfig;

  end;

var
  FormConfig: TFormConfig;

implementation

{$R *.fmx}

{ TFormConfig }
uses
  System.IniFiles,
  uFormClientes, uLibary, uPrincipal_Menu;

procedure TFormConfig.Button1Click(Sender: TObject);
begin
  inherited;
  GravarConfig;
end;

function TFormConfig.CarregarConfig: String;
var
  arq_ini, Host, Porta: String;
  ini: TIniFile;
begin
  try
    arq_ini := Tpath.Combine(Tpath.GetDocumentsPath, 'servidor.ini');
    if not FileExists(arq_ini) then
    begin
      Result := 'Arquivo INI n�o encontrado: ' + arq_ini;
      exit
    end;

    ini := TIniFile.Create(arq_ini);

    Host := ini.ReadString('CONFIGURACAO', 'HOST', Host);
    Porta := ini.ReadString('CONFIGURACAO', 'PORTA', Porta);

    edtHost.Text := Host;
    edtPorta.Text := Porta;
    try
      if edtPorta.Text = '' then
        Result := 'OK'
    Except
      on ex: Exception do
        Result := 'Erro ao Conectar ao banco de Dados'
    end;

  finally
    ini.DisposeOf;
  end;
end;

procedure TFormConfig.FormCreate(Sender: TObject);
begin
  inherited;
  CarregarConfig;
end;

procedure TFormConfig.GravarConfig;
var
  ini: TIniFile;
begin
  try
    ini := TIniFile.Create(Tpath.Combine(Tpath.GetDocumentsPath,
      'servidor.ini'));
    ini.Writestring('CONFIGURACAO', 'HOST', edtHost.Text);
    ini.Writestring('CONFIGURACAO', 'PORTA', edtPorta.Text);
    ShowMessage('.: GRAVADO COM SUCESSO :.');
  finally
    ini.DisposeOf
  end;

end;

procedure TFormConfig.Rectangle2Click(Sender: TObject);
begin
  inherited;
  TCriacaoForm.OpenForm(TFormClientes, nil);
  mtvMenu.Visible := False;
end;

procedure TFormConfig.Rectangle3Click(Sender: TObject);
begin
  inherited;
  TCriacaoForm.OpenForm(TFormConfig, nil);
  mtvMenu.Visible := False;
end;

procedure TFormConfig.Rectangle5Click(Sender: TObject);
begin
  inherited;
  GravarConfig;
end;

end.
