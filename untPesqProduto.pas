unit untPesqProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls;

type
  TfrmPesqProduto = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    edtPesqPro: TEdit;
    DBGrid1: TDBGrid;
    dsPesquisa: TDataSource;
    qryPesquisa: TFDQuery;
    cbFiltro: TComboBox;
    Label1: TLabel;
    rbTodas: TRadioButton;
    rbInativo: TRadioButton;
    rbAtivo: TRadioButton;
    qryPesquisaID_PRO: TIntegerField;
    qryPesquisaNOME_PRO: TStringField;
    qryPesquisaQTDE_PRO: TBCDField;
    qryPesquisaVLR_CUSTO: TCurrencyField;
    qryPesquisaVLR_VENDA: TCurrencyField;
    qryPesquisaID_CAT: TIntegerField;
    qryPesquisaSITUACAO: TIntegerField;
    qryPesquisaSITUACAOF: TStringField;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtPesqProChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rbInativoExit(Sender: TObject);
    procedure rbTodasClick(Sender: TObject);
    procedure rbInativoClick(Sender: TObject);
    procedure rbAtivoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vRetorno: integer;
  end;

var
  frmPesqProduto: TfrmPesqProduto;

implementation

{$R *.dfm}

uses untDM, untProduto;

procedure TfrmPesqProduto.DBGrid1DblClick(Sender: TObject);
begin
   vRetorno := qryPesquisaID_PRO.Value;
  Close;
end;

procedure TfrmPesqProduto.edtPesqProChange(Sender: TObject);
begin
  if(cbFiltro.ItemIndex = 0) then
  begin
    if (edtPesqPro.Text <> '') then
    begin
     qryPesquisa.Close;
     qryPesquisa.SQL.Clear;
     qryPesquisa.SQL.Add('SELECT PRODUTO.* ,CASE PRODUTO.SITUACAO');
     qryPesquisa.SQL.Add('WHEN 1 THEN ''ATIVO'' WHEN 0 THEN ''INATIVO'' END AS SITUACAOF FROM PRODUTO ');
     qryPesquisa.SQL.Add('WHERE NOME_PRO LIKE :P1');
     qryPesquisa.ParamByName('P1').AsString :=
                        '%' + edtPesqPro.Text + '%';
     if (rbInativo.Checked) then
      begin
       qryPesquisa.SQL.Add('AND SITUACAO = 0');
      end
     else if (rbAtivo.Checked) then
      begin
        qryPesquisa.SQL.Add('AND SITUACAO = 1');
      end;
     qryPesquisa.Open;
    end;
  end;
end;
  {  else
    begin
     qryPesquisa.Close;
    qryPesquisa.SQL.Clear;
    qryPesquisa.SQL.Add('SELECT PRODUTO.* ,CASE PRODUTO.SITUACAO');
    qryPesquisa.SQL.Add('WHEN 1 THEN ''ATIVO'' WHEN 0 THEN ''INATIVO'' END AS SITUACAOF FROM PRODUTO');
    qryPesquisa.Open;
     if (rbInativo.Checked) then
      begin
       qryPesquisa.SQL.Add('WHERE SITUACAO = 0');
      end
     else if (rbAtivo.Checked) then
      begin
       qryPesquisa.SQL.Add('WHERE SITUACAO = 1');
      end
      else if (rbTodas.Checked) then
      begin
       qryPesquisa.SQL.Add('WHERE ID_FUN < 100000000');
      end;
      qryPesquisa.Open;
    end;
  end;
end;    }

procedure TfrmPesqProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryPesquisa.Close
end;

procedure TfrmPesqProduto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF Key = Vk_Escape then frmPesqProduto.Close;
end;

procedure TfrmPesqProduto.FormShow(Sender: TObject);
begin
  qryPesquisa.Open();
  vRetorno := 0;
  edtPesqPro.SetFocus;
end;

procedure TfrmPesqProduto.rbAtivoClick(Sender: TObject);
begin
  edtPesqPro.Clear;
  edtPesqPro.SetFocus;
  begin
    qryPesquisa.Close;
    qryPesquisa.SQL.Clear;
    qryPesquisa.SQL.Add('SELECT PRODUTO.* ,CASE PRODUTO.SITUACAO');
    qryPesquisa.SQL.Add('WHEN 1 THEN ''ATIVO'' END AS SITUACAOF FROM PRODUTO');
    qryPesquisa.SQL.Add('WHERE SITUACAO = 1');
    qryPesquisa.Open;

  end;
end;

procedure TfrmPesqProduto.rbInativoClick(Sender: TObject);
begin
  edtPesqPro.Clear;
    edtPesqPro.SetFocus;
   begin
    qryPesquisa.Close;
    qryPesquisa.SQL.Clear;
    qryPesquisa.SQL.Add('SELECT PRODUTO.* ,CASE PRODUTO.SITUACAO');
    qryPesquisa.SQL.Add('WHEN 0 THEN ''INATIVO'' END AS SITUACAOF FROM PRODUTO');
    qryPesquisa.SQL.Add('WHERE SITUACAO = 0');
    qryPesquisa.Open;
  end;


end;

procedure TfrmPesqProduto.rbInativoExit(Sender: TObject);
begin
//  qryPesquisa.Close;
end;

procedure TfrmPesqProduto.rbTodasClick(Sender: TObject);
begin
    if (rbTodas.Checked) then
    edtPesqPro.Clear;
    edtPesqPro.SetFocus;
  begin
    qryPesquisa.Close;
    qryPesquisa.SQL.Clear;
    qryPesquisa.SQL.Add('SELECT PRODUTO.* ,CASE PRODUTO.SITUACAO');
    qryPesquisa.SQL.Add('WHEN 0 THEN ''INATIVO'' WHEN 1 THEN ''ATIVO'' END AS SITUACAOF FROM PRODUTO');
   
  qryPesquisa.Open;
  end;

end;

end.
