unit untCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Vcl.Mask, Vcl.DBCtrls;

type
  TfrmClientes = class(TForm)
    Label1: TLabel;
    edtCodigo: TDBEdit;
    dsCliente: TDataSource;
    Label2: TLabel;
    edtNome: TDBEdit;
    SpeedButton1: TSpeedButton;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    dbeFone: TDBEdit;
    Label5: TLabel;
    dbeCodCidade: TDBEdit;
    btnNovo: TButton;
    btnGravar: TButton;
    btnCancelar: TButton;
    Label6: TLabel;
    dbeCpfCnpj: TDBEdit;
    Label7: TLabel;
    dbeCep: TDBEdit;
    Label8: TLabel;
    dbeBairro: TDBEdit;
    Label9: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    btnExcluir: TButton;
    mkDataNasci: TMaskEdit;
    procedure btnNovoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dsClienteStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientes: TfrmClientes;

implementation

{$R *.dfm}

uses untDM;

procedure TfrmClientes.btnCancelarClick(Sender: TObject);
begin
  dm.qryCliente.Cancel;
end;

procedure TfrmClientes.btnExcluirClick(Sender: TObject);
begin
  dm.qryCliente.Delete;
end;

procedure TfrmClientes.btnNovoClick(Sender: TObject);
begin
  dm.qryCliente.Insert;
  edtCodigo.SetFocus;
end;

procedure TfrmClientes.edtCodigoExit(Sender: TObject);
begin
    if (edtCodigo.Text <> '') then
  begin
    dm.qryCliente.Close;
    dm.qryCliente.ParamByName('P1').AsString :=
                                edtCodigo.Text;
    dm.qryCliente.Open;

    if (dm.qryCliente.IsEmpty) then
    begin
      ShowMessage('Código não encontrado.');
      edtCodigo.SetFocus;
      edtCodigo.Clear;
    end;
  end;
end;

procedure TfrmClientes.btnGravarClick(Sender: TObject);
begin
  if (trim(dbeCodCidade.Text) = '') then
  begin
    ShowMessage('Informe a cidade');
    dbeCodCidade.SetFocus;
    exit; // para a procedure nesse ponto
  end;

  if (dm.qryCliente.State = dsInsert) then
  begin
    dm.qryUltimo.Close;
    dm.qryUltimo.SQL.Clear;
    dm.qryUltimo.SQL.Add('SELECT MAX(ID_CLI) AS ULTIMO FROM CLIENTE');
    dm.qryUltimo.Open;

    dm.qryClienteID_CLI.AsInteger :=
    dm.qryUltimo.FieldByName('ULTIMO').AsInteger + 1;
  end;

  dm.qryCliente.Post;
end;

procedure TfrmClientes.dsClienteStateChange(Sender: TObject);
begin
    if (dm.qryCliente.State in [dsInsert,dsEdit]) then
  begin
    btnNovo.Visible    := False;
    btnExcluir.Visible := False;
    btnGravar.Visible  := True;
    btnCancelar.Visible:= True;
  end
  else
  begin
    btnNovo.Visible    := True;
    btnExcluir.Visible := True;
    btnGravar.Visible  := False;
    btnCancelar.Visible:= False;
  end;
end;

procedure TfrmClientes.FormShow(Sender: TObject);
begin
  dm.qryCliente.Open();
end;

end.
