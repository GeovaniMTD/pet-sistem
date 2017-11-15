unit untUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Data.DB;

type
  TfrmUsuario = class(TForm)
    Label1: TLabel;
    dsUsuario: TDataSource;
    Label2: TLabel;
    Senha: TLabel;
    btnNovo: TButton;
    edtCodigo: TEdit;
    btnSalvar: TButton;
    btnCancelar: TButton;
    SpeedButton1: TSpeedButton;
    edtConfirmarSenha: TEdit;
    Label3: TLabel;
    dbLogin: TDBEdit;
    dbSenha: TDBEdit;
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure dsUsuarioStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUsuario: TfrmUsuario;

implementation

{$R *.dfm}

uses untDM, untFuncoes;

procedure TfrmUsuario.btnCancelarClick(Sender: TObject);
begin
  dm.qryUsuario.Cancel;
end;

procedure TfrmUsuario.btnExcluirClick(Sender: TObject);
begin
  dm.qryUsuario.Delete;
end;

procedure TfrmUsuario.btnNovoClick(Sender: TObject);
begin
  dm.qryUsuario.Insert;
end;

procedure TfrmUsuario.btnSalvarClick(Sender: TObject);
begin

  if (dbSenha.Text <> edtConfirmarSenha.Text) then
    begin
      ShowMessage('Senhas n�o comferem.');
      dbSenha.SetFocus;
      edtConfirmarSenha.Clear;
      exit;
    end;

  if (dm.qryUsuario.State = dsInsert) then
  begin
    dm.qryExecuta.Close;
    dm.qryExecuta.SQL.Clear;
    dm.qryExecuta.SQL.Add('SELECT * FROM FUNCIONARIO');
    dm.qryExecuta.SQL.Add('WHERE LOGIN_FUN = :LOGIN_FUN');
    dm.qryExecuta.ParamByName('LOGIN_FUN').Text := dbLogin.Text;
    dm.qryExecuta.Open;

     if not (dm.qryExecuta.IsEmpty) then
    begin
      ShowMessage('Login j� esta em uso.');
      dbLogin.SetFocus;
      exit;
    end;

    dm.qryUltimo.Close;
    dm.qryUltimo.SQL.Clear;
    dm.qryUltimo.SQL.Add('SELECT MAX(ID_FUN) AS ULTIMO FROM FUNCIONARIO');
    dm.qryUltimo.Open;

    dm.qryUsuarioID_FUN.AsInteger :=
    dm.qryUltimo.FieldByName('ULTIMO').AsInteger + 1;

    edtCodigo.Text :=
                    dm.qryUsuarioID_FUN.AsString;
    dm.qryUsuarioSENHA_FUN.AsString := Criptografar(dbSenha.Text);
  end
  else
  begin
    dm.qryExecuta.Close;
    dm.qryExecuta.SQL.Clear;
    dm.qryExecuta.SQL.Add('SELECT * FROM FUNCIONARIO');
    dm.qryExecuta.SQL.Add('WHERE LOGIN_FUN = :LOGIN_FUN AND ID_FUN <> :ID_FUN');
    dm.qryExecuta.ParamByName('LOGIN_FUN').Text       := dbLogin.Text;
    dm.qryExecuta.ParamByName('ID_FUN').Text := edtCodigo.Text;
    dm.qryExecuta.Open;

    if not (dm.qryExecuta.IsEmpty) then
    begin
      ShowMessage('Login j� esta em uso.');
      dbLogin.SetFocus;
      exit;
    end;
  end;

  dm.qryUsuario.Post;
end;

procedure TfrmUsuario.dsUsuarioStateChange(Sender: TObject);
begin
    if (dm.qryUsuario.State in [dsInsert,dsEdit]) then
  begin
    btnNovo.Visible    := False;

    btnSalvar.Visible  := True;
    btnCancelar.Visible:= True;
  end
  else
  begin
    btnNovo.Visible    := True;

    btnSalvar.Visible  := False;
    btnCancelar.Visible:= False;
  end;
end;

procedure TfrmUsuario.edtCodigoExit(Sender: TObject);
begin
   if (edtCodigo.Text <> '') then
  begin
    dm.qryUsuario.Close;
    dm.qryUsuario.ParamByName('P1').AsString :=
                                edtCodigo.Text;
    dm.qryUsuario.Open;

    if (dm.qryUsuario.IsEmpty) then
    begin
      ShowMessage('C�digo n�o encontrado.');
      edtCodigo.SetFocus;
      edtCodigo.Clear;
    end;

  end;
end;

procedure TfrmUsuario.FormShow(Sender: TObject);
begin
  dm.qryUsuario.Open();
end;

end.
