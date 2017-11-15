unit untLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TfrmLogin = class(TForm)
    Image1: TImage;
    edtLogin: TEdit;
    edtSenha: TEdit;
    btnOk: TButton;
    btnCancelar: TButton;
    qryLogin: TFDQuery;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses untDM, untFuncoes;

procedure TfrmLogin.btnCancelarClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmLogin.btnOkClick(Sender: TObject);
begin
   ModalResult := MROK;

  if (edtLogin.Text = '') then
  begin
    ShowMessage('Informe o usuário');
    edtLogin.SetFocus;
    exit;
  end;

  if (edtSenha.Text = '') then
  begin
    ShowMessage('Informe a senha.');
    edtSenha.SetFocus;
    exit;
  end;

  qryLogin.Close;
  qryLogin.ParamByName('LOGIN_FUN').AsString := edtLogin.Text;
  qryLogin.ParamByName('SENHA_FUN').AsString := Criptografar(edtSenha.Text);
  qryLogin.Open;

  if (qryLogin.IsEmpty) then
  begin
    ShowMessage('Usuário ou senha incorretos.');
    edtLogin.SetFocus;
    exit;
  end;

  ModalResult := mrOk;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
   ModalResult := mrNone;

  edtlogin.SetFocus;
end;

end.
