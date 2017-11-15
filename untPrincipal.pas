unit untPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.Imaging.pngimage;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Clientes1: TMenuItem;
    Usuario1: TMenuItem;
    Panel1: TPanel;
    qryLogin: TFDQuery;
    Produtos1: TMenuItem;
    frmFuncionario: TMenuItem;
    Categoria1: TMenuItem;
    Panel2: TPanel;
    Image2: TImage;
    Image1: TImage;
    Image3: TImage;
    Image4: TImage;
    StatusBar1: TStatusBar;
    Ajuda1: TMenuItem;
    SobreoSistema1: TMenuItem;
    Image6: TImage;
    Image7: TImage;
    Timer1: TTimer;
    BalloonHint1: TBalloonHint;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Image8: TImage;
    procedure Clientes1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Categoria1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Image3Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure Usuario1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure frmFuncionarioClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Image6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses untCadastro, untDM, untCliente, untProduto,
  untCategoria, untProdutos, untPescCliente, untPesqCategoria,ShellApi,
  untUsuario, untLogin, untFuncoes, untFuncionarios, untVenda;

procedure TfrmPrincipal.Categoria1Click(Sender: TObject);
begin
  frmPesqCategoria.ShowModal;
end;

procedure TfrmPrincipal.Clientes1Click(Sender: TObject);
begin
  frmClientes.ShowModal;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if Application.MessageBox('Deseja Realmente Sair', 'Informação',
  MB_YESNO+MB_ICONQUESTION) = mrYes then

  Application.Terminate
  else
  Abort;
end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF Key = Vk_Escape then frmPrincipal.Close;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  try
    frmLogin.ShowModal;
  finally
    if (frmLogin.ModalResult <> mrOk) then
    begin
      Application.Terminate;
    end;
  end;
end;

procedure TfrmPrincipal.frmFuncionarioClick(Sender: TObject);
begin
  frmFuncionarios.ShowModal;
end;

procedure TfrmPrincipal.Image3Click(Sender: TObject);
begin
  frmClientes.ShowModal;
end;

procedure TfrmPrincipal.Image4Click(Sender: TObject);
begin
    shellexecute(handle,'open','D:\Projetos\pet sistem\Suporte\TeamViewerPortable.exe',nil,nil,sw_shownormal);

end;

procedure TfrmPrincipal.Image6Click(Sender: TObject);
begin
  frmVenda.ShowModal;
end;

procedure TfrmPrincipal.Image7Click(Sender: TObject);
begin
  frmProduto.ShowModal;
end;

procedure TfrmPrincipal.Image8Click(Sender: TObject);
begin
     if Application.MessageBox('Deseja Realmente Sair', 'Informação',
  MB_YESNO+MB_ICONQUESTION) = mrYes then

  Application.Terminate
  else
  Abort;
end;

procedure TfrmPrincipal.Produtos1Click(Sender: TObject);
begin
  frmProduto.ShowModal;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
   //StatusBar1.Panels.Items[0].Text := DateTimeToStr(now);
end;

procedure TfrmPrincipal.Usuario1Click(Sender: TObject);
begin
  frmUsuario.ShowModal;
end;

end.
