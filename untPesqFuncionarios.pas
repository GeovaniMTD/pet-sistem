unit untPesqFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmPesqFuncionarios = class(TForm)
    Panel1: TPanel;
    edtNome: TEdit;
    DBGrid1: TDBGrid;
    dsPesquisa: TDataSource;
    qryPesquisa: TFDQuery;
    cbFiltro: TComboBox;
    rbTodas: TRadioButton;
    rbInativo: TRadioButton;
    rbAtivo: TRadioButton;
    qryPesquisaID_FUN: TIntegerField;
    qryPesquisaNOME_FUN: TStringField;
    qryPesquisaEND_FUN: TStringField;
    qryPesquisaCPF_FUN: TStringField;
    qryPesquisaFONE_FUN: TStringField;
    qryPesquisaDATA_NASIMENTO_FUN: TDateField;
    qryPesquisaLOGIN_FUN: TStringField;
    qryPesquisaSENHA_FUN: TStringField;
    qryPesquisaSITUACAO: TIntegerField;
    qryPesquisaBAIRRO_FUN: TStringField;
    qryPesquisaCEP_FUN: TStringField;
    qryPesquisaDATA_ADMISSAO_FUN: TDateField;
    qryPesquisaDATA_DEMISSAO_FUN: TDateField;
    qryPesquisaCARGO_FUN: TStringField;
    qryPesquisaNUMERO_END_FUN: TStringField;
    qryPesquisaSITUACAOF: TStringField;
    procedure FormShow(Sender: TObject);
    procedure edtNomeChange(Sender: TObject);
    procedure cbFiltroChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure rbInativoClick(Sender: TObject);
    procedure rbAtivoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vRetorno: integer;
  end;

var
  frmPesqFuncionarios: TfrmPesqFuncionarios;

implementation

{$R *.dfm}

uses untDM;

procedure TfrmPesqFuncionarios.cbFiltroChange(Sender: TObject);
begin
  edtNomeChange(Sender);

end;

procedure TfrmPesqFuncionarios.DBGrid1DblClick(Sender: TObject);
begin
    vRetorno := qryPesquisaID_FUN.Value;
  Close;
end;

procedure TfrmPesqFuncionarios.edtNomeChange(Sender: TObject);
begin
begin
  if(cbFiltro.ItemIndex = 0) then
  begin
    if (edtNome.Text <> '') then
    begin
     qryPesquisa.Close;
     qryPesquisa.SQL.Clear;
     qryPesquisa.SQL.Add('SELECT FUNCIONARIO.* ,CASE FUNCIONARIO.SITUACAO');
     qryPesquisa.SQL.Add('WHEN 1 THEN ''ATIVO'' WHEN 0 THEN ''INATIVO'' END AS SITUACAOF FROM FUNCIONARIO ');
     qryPesquisa.SQL.Add('WHERE NOME_FUN LIKE :P1');
     qryPesquisa.ParamByName('P1').AsString :=
                        '%' + edtNome.Text + '%';
     if (rbInativo.Checked) then
      begin
       qryPesquisa.SQL.Add('AND SITUACAO = 0');
      end
     else if (rbAtivo.Checked) then
      begin
        qryPesquisa.SQL.Add('AND SITUACAO = 1');
      end;

     qryPesquisa.Open;
    end
    else
    begin
     qryPesquisa.Close;
    qryPesquisa.SQL.Clear;
    qryPesquisa.SQL.Add('SELECT FUNCIONARIO.* ,CASE FUNCIONARIO.SITUACAO');
    qryPesquisa.SQL.Add('WHEN 1 THEN ''ATIVO'' WHEN 0 THEN ''INATIVO'' END AS SITUACAOF FROM FUNCIONARIO');
    qryPesquisa.Open;
     if (rbInativo.Checked) then
      begin
       qryPesquisa.SQL.Add('WHERE SITUACAO = 0');
      end
     else if (rbAtivo.Checked) then
      begin
       qryPesquisa.SQL.Add('WHERE SITUACAO = 1');
      end;
      qryPesquisa.Open;
    end;
  end;
end;
end;
procedure TfrmPesqFuncionarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryPesquisa.Close;
end;

procedure TfrmPesqFuncionarios.FormShow(Sender: TObject);
begin
  qryPesquisa.Open();
end;

procedure TfrmPesqFuncionarios.rbAtivoClick(Sender: TObject);
begin
    qryPesquisa.Close;
    qryPesquisa.SQL.Clear;
    qryPesquisa.SQL.Add('SELECT FUNCIONARIO.* ,CASE FUNCIONARIO.SITUACAO');
    qryPesquisa.SQL.Add('WHEN 1 THEN ''ATIVO'' END AS SITUACAOF FROM FUNCIONARIO');
    qryPesquisa.SQL.Add('WHERE SITUACAO = 1');
    qryPesquisa.Open;
end;

procedure TfrmPesqFuncionarios.rbInativoClick(Sender: TObject);
begin
   begin
    qryPesquisa.Close;
    qryPesquisa.SQL.Clear;
    qryPesquisa.SQL.Add('SELECT FUNCIONARIO.* ,CASE FUNCIONARIO.SITUACAO');
    qryPesquisa.SQL.Add('WHEN 0 THEN ''INATIVO'' END AS SITUACAOF FROM FUNCIONARIO');
    qryPesquisa.SQL.Add('WHERE SITUACAO = 0');
    qryPesquisa.Open;
  end;


end;

end.
