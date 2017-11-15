unit untCadCat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Mask,
  Vcl.DBCtrls;

type
  TfrmCadCat = class(TForm)
    Label1: TLabel;
    dbeNome: TDBEdit;
    dsPesquisa: TDataSource;
    btnGravar: TButton;
    edtCodigo: TEdit;
    Label2: TLabel;
    procedure btnGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCodigoExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    vRetorno3: String;
    Retorno2: String;
  end;

var
  frmCadCat: TfrmCadCat;

implementation

{$R *.dfm}

uses untDM, untPesqCategoria;

procedure TfrmCadCat.edtCodigoExit(Sender: TObject);
begin
    if (edtCodigo.Text <> '') then
  begin
    dm.qryCategoria.Close;
    dm.qryCategoria.ParamByName('P1').AsString :=
                                edtCodigo.Text;
    dm.qryCategoria.Open;

    if (dm.qryCategoria.IsEmpty) then
    begin
      ShowMessage('C�digo n�o encontrado.');
      edtCodigo.SetFocus;
      edtCodigo.Clear;
    end
  end;
end;

procedure TfrmCadCat.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPesqCategoria.edtpesquisaChange(Sender);
  dm.qryCategoria.Close;

end;

procedure TfrmCadCat.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   IF Key = Vk_Escape then frmCadCat.Close;
end;

procedure TfrmCadCat.FormShow(Sender: TObject);
begin

      edtCodigo.Text := (frmPesqCategoria.vRetorno2);
      edtCodigoExit(Sender);
  end;

procedure TfrmCadCat.btnGravarClick(Sender: TObject);
begin
  if (dm.qryCategoria.State = dsInsert) then
  begin
    dm.qryUltimo.Close;
    dm.qryUltimo.SQL.Clear;
    dm.qryUltimo.SQL.Add('SELECT MAX(ID_CAT) AS ULTIMO FROM CATEGORIA');
    dm.qryUltimo.Open;

    dm.qryCategoriaID_CAT.AsInteger :=
    dm.qryUltimo.FieldByName('ULTIMO').AsInteger + 1;
  end;

  dm.qryCategoria.Post;
  ShowMessage('Salvo com Sucesso:');
end;

end.
