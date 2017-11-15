program pet;

uses
  Vcl.Forms,
  untPrincipal in 'untPrincipal.pas' {frmPrincipal},
  untDM in 'untDM.pas' {DM: TDataModule},
  untProduto in 'untProduto.pas' {frmProduto},
  untCliente in 'untCliente.pas' {frmClientes},
  untCategoria in 'untCategoria.pas' {frmCategoria},
  untPescCliente in 'untPescCliente.pas' {frmPesqCliente},
  untPescCidade in 'untPescCidade.pas' {frmPesqCidade},
  untPesqProduto in 'untPesqProduto.pas' {frmPesqProduto},
  untPesqCategoria in 'untPesqCategoria.pas' {frmPesqCategoria},
  untUsuario in 'untUsuario.pas' {frmUsuario},
  untFuncoes in 'untFuncoes.pas',
  untLogin in 'untLogin.pas' {frmLogin},
  untFuncionarios in 'untFuncionarios.pas' {frmFuncionarios},
  untPesqFuncionarios in 'untPesqFuncionarios.pas' {frmPesqFuncionarios},
  untCadCat in 'untCadCat.pas' {frmCadCat},
  untVenda in 'untVenda.pas' {frmVenda},
  untItens in 'untItens.pas' {frmItensVenda},
  untPesqLogin in 'untPesqLogin.pas' {frmPesqLogin},
  untPgt in 'untPgt.pas' {frmPagamento},
  untPesqVen in 'untPesqVen.pas' {frmPesqVen};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmProduto, frmProduto);
  Application.CreateForm(TfrmClientes, frmClientes);
  Application.CreateForm(TfrmCategoria, frmCategoria);
  Application.CreateForm(TfrmPesqCliente, frmPesqCliente);
  Application.CreateForm(TfrmPesqCidade, frmPesqCidade);
  Application.CreateForm(TfrmPesqProduto, frmPesqProduto);
  Application.CreateForm(TfrmPesqCategoria, frmPesqCategoria);
  Application.CreateForm(TfrmUsuario, frmUsuario);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmFuncionarios, frmFuncionarios);
  Application.CreateForm(TfrmPesqFuncionarios, frmPesqFuncionarios);
  Application.CreateForm(TfrmCadCat, frmCadCat);
  Application.CreateForm(TfrmVenda, frmVenda);
  Application.CreateForm(TfrmItensVenda, frmItensVenda);
  Application.CreateForm(TfrmPesqLogin, frmPesqLogin);
  Application.CreateForm(TfrmPagamento, frmPagamento);
  Application.CreateForm(TfrmPesqVen, frmPesqVen);
  Application.Run;
end.
