program prjConceitoMobile;

uses
  System.StartUpCopy,
  FMX.Forms,
  uPrincipal_Menu in 'uPrincipal_Menu.pas' {FormPrincipal},
  uBaseLista in 'uBaseLista.pas' {FormBaseLyt},
  uLibary in 'uLibary.pas',
  uFormClientes in 'uFormClientes.pas' {FormClientes},
  uFormConfig in 'uFormConfig.pas' {FormConfig},
  UnitLogin in 'C:\Users\fefee\Videos\Conceito-mobile\UnitLogin.pas' {FormLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TFormClientes, FormClientes);
  Application.CreateForm(TFormConfig, FormConfig);
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TFormLogin, FormLogin);
  Application.Run;
end.
