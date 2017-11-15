unit untProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Data.DB, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons;

type
  TfrmProdutos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnExcluir: TButton;
    btnNovo: TButton;
    btnGravar: TButton;
    btnCancelar: TButton;
    dsProdutos: TDataSource;
    Codigo: TLabel;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    dbeNome: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    edtCodigo: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    SpeedButton2: TSpeedButton;
    dbeCodCategoria: TDBEdit;
    dbeNomeCat: TDBEdit;
    procedure dsProdutosDataChange(Sender: TObject; Field: TField);
    procedure edtCodigoExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dsProdutosStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure dbeCodCategoriaExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdutos: TfrmProdutos;

implementation

{$R *.dfm}

uses untDM, untPescCliente, untPesqCategoria, untPesqProduto;

procedure TfrmProdutos.btnCancelarClick(Sender: TObject);
begin
  dm.qryProduto.Cancel;
end;

procedure TfrmProdutos.btnExcluirClick(Sender: TObject);
begin
  dm.qryProduto.Delete;
end;

procedure TfrmProdutos.btnGravarClick(Sender: TObject);
begin
  if (trim(dbeCodCategoria.Text) = '') then
  begin
    ShowMessage('Informe a categoria');
    dbeCodCategoria.SetFocus;
    exit; // para a procedure nesse ponto
  end;

  if (dm.qryProduto.State = dsInsert) then
  begin
    dm.qryUltimo.Close;
    dm.qryUltimo.SQL.Clear;
    dm.qryUltimo.SQL.Add('SELECT MAX(ID_PRO) AS ULTIMO FROM PRODUTO');
    dm.qryUltimo.Open;

    dm.qryProdutoID_PRO.AsInteger :=
    dm.qryUltimo.FieldByName('ULTIMO').AsInteger + 1;
  end;

  dm.qryProduto.Post;
end;

procedure TfrmProdutos.btnNovoClick(Sender: TObject);
begin
   dm.qryProduto.Insert;
    dbeNome.SetFocus;
end;

procedure TfrmProdutos.dbeCodCategoriaExit(Sender: TObject);
begin
    if (dbeCodCategoria.Text <> '') then
  begin
    dm.qryExecuta.Close;
    dm.qryExecuta.SQL.Clear;
    dm.qryExecuta.SQL.Add('SELECT * FROM CATEGORIA WHERE ID_CAT = :P1');
    dm.qryExecuta.ParamByName('P1').AsString := dbeCodCategoria.Text;
    dm.qryExecuta.Open;

    if not(dm.qryExecuta.IsEmpty) then
    begin

      dbeCodCategoria.Text := dm.qryExecuta.FieldByName('ID_CAT').AsString;
      dbeNomeCat.Text         := dm.qryExecuta.FieldByName('NOME_CAT').AsString;
    end
    else
    begin
      ShowMessage('Cidade não encontrada');
      dbeCodCategoria.SetFocus;
      dbeCodCategoria.Clear;
      dbeNomeCat.Clear;

    end;
  end;
end;

procedure TfrmProdutos.dsProdutosDataChange(Sender: TObject; Field: TField);
begin
  edtCodigo.Text := dm.qryProdutoID_PRO.AsString;
end;

procedure TfrmProdutos.dsProdutosStateChange(Sender: TObject);
begin
   if (dm.qryProduto.State in [dsInsert,dsEdit]) then
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

procedure TfrmProdutos.edtCodigoExit(Sender: TObject);
begin
    if (edtCodigo.Text <> '') then
  begin
    dm.qryProduto.Close;
    dm.qryProduto.ParamByName('P1').AsString :=
                                edtCodigo.Text;
    dm.qryProduto.Open;

    if (dm.qryProduto.IsEmpty) then
    begin
      ShowMessage('Código não encontrado.');
      edtCodigo.SetFocus;
      edtCodigo.Clear;
    end;
  end;
end;

procedure TfrmProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.qryProduto.Close;
end;

procedure TfrmProdutos.FormShow(Sender: TObject);
begin
  dm.qryProduto.Open();
end;

procedure TfrmProdutos.SpeedButton1Click(Sender: TObject);
begin
   try
    frmPesqProduto.ShowModal;
  finally
    if (frmPesqProduto.vRetorno > 0) then
    begin
      edtCodigo.Text := IntTostr(frmPesqProduto.vRetorno);
      edtCodigoExit(Sender);
    end;
  end;

end;

procedure TfrmProdutos.SpeedButton2Click(Sender: TObject);
begin
   try
    frmPesqCategoria.ShowModal;
  finally
    if (frmPesqCategoria.vRetorno > 0) then
    begin
      dbeCodCategoria.Text := IntTostr(frmPesqCategoria.vRetorno);
      dbeCodCategoriaExit(Sender);
    end;
  end;

end;

end.
