program pet;

uses
  Vcl.Forms,
  untPrincipal in '..\untPrincipal.pas' {frmPrincipal},
  untDM in '..\untDM.pas' {DM: TDataModule},
  untLogin in '..\untLogin.pas' {frmLogin},
  untProduto in '..\untProduto.pas' {frmProduto},
  untCliente in 'untCliente.pas' {frmClientes},
  untFuncionario in '..\untFuncionario.pas' {frmFuncionario};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmProduto, frmProduto);
  Application.CreateForm(TfrmClientes, frmClientes);
  Application.CreateForm(TfrmFuncionario, frmFuncionario);
  Application.Run;
end.
