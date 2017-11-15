unit untCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Data.DB, Vcl.Buttons;

type
  TfrmCategoria = class(TForm)
    Label1: TLabel;
    dsCategoria: TDataSource;
    Label2: TLabel;
    dbDescricao: TDBEdit;
    edtCodigo: TEdit;
    btnNovo: TButton;
    btnGravar: TButton;
    btnCancelar: TButton;
    SpeedButton1: TSpeedButton;
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure dsCategoriaStateChange(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure dsCategoriaDataChange(Sender: TObject; Field: TField);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCategoria: TfrmCategoria;

implementation

{$R *.dfm}

uses untDM, untPesqCategoria;

procedure TfrmCategoria.btnGravarClick(Sender: TObject);
begin
  if (dm.qryCategoria.State = dsInsert) then
  begin
    dm.qryUltimo.Close;
    dm.qryUltimo.SQL.Clear;
    dm.qryUltimo.SQL.Add('SELECT MAX(ID_CAT) AS ULTIMO FROM CATEGORIA');
    dm.qryUltimo.Open;

    dm.qryCATEGORIAID_CAT.AsInteger :=
    dm.qryUltimo.FieldByName('ULTIMO').AsInteger + 1;
  end;

  dm.qryCategoria.Post;
end;

procedure TfrmCategoria.btnExcluirClick(Sender: TObject);
begin
  dm.qryCategoria.Delete;
end;

procedure TfrmCategoria.btnNovoClick(Sender: TObject);
begin
  dm.qryCategoria.Insert;
  dbDescricao.SetFocus;
  edtCodigo.Visible := False;
end;

procedure TfrmCategoria.dsCategoriaDataChange(Sender: TObject; Field: TField);
begin
  edtCodigo.Text := dm.qryCategoriaID_cat.AsString;
end;

procedure TfrmCategoria.dsCategoriaStateChange(Sender: TObject);
begin
    if (dm.qryCategoria.State in [dsInsert,dsEdit]) then
  begin
    btnNovo.Visible    := False;
    btnGravar.Visible  := True;
    btnCancelar.Visible:= True;
  end
  else
  begin
    btnNovo.Visible    := True;
    btnGravar.Visible  := False;
    btnCancelar.Visible:= False;
  end;
end;

procedure TfrmCategoria.edtCodigoExit(Sender: TObject);
begin
  if (edtCodigo.Text <> '') then
  begin
    dm.qryExecuta.Close;
    dm.qryExecuta.SQL.Clear;
    dm.qryExecuta.SQL.Add('SELECT * FROM CATEGORIA WHERE ID_CAT = :P1');
    dm.qryExecuta.ParamByName('P1').AsString := edtCodigo.Text;
    dm.qryExecuta.Open;

    if not(dm.qryExecuta.IsEmpty) then
    begin
      dbDescricao.Text := dm.qryExecuta.FieldByName('NOME_CAT').AsString;
    end
    else
    begin
      ShowMessage('Categoria n�o encontrada');
      edtCodigo.SetFocus;
      edtCodigo.Clear;
      dbDescricao.Clear;
    end;
  end;
end;

procedure TfrmCategoria.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF Key = Vk_Escape then frmCategoria.Close;
end;

procedure TfrmCategoria.FormShow(Sender: TObject);
begin
  dm.qryCategoria.Open();
end;

procedure TfrmCategoria.SpeedButton1Click(Sender: TObject);
begin
  try
    frmPesqCategoria.ShowModal;
  finally
    if (frmPesqCategoria.vRetorno > 0) then
    begin
      edtCodigo.Text := IntTostr(frmPesqCategoria.vRetorno);
      edtCodigoExit(Sender);
    end;
  end;
end;

end.
