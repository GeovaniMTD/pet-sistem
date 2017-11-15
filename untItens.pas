unit untItens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls;

type
  TfrmItensVenda = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    dsItems: TDataSource;
    edtPesqItens: TEdit;
    Label1: TLabel;
    cbCampoPesq: TComboBox;
    qryItens: TFDQuery;
    qryItensID_PRO: TIntegerField;
    qryItensNOME_PRO: TStringField;
    qryItensQTDE_PRO: TBCDField;
    qryItensVLR_CUSTO: TFloatField;
    qryItensVLR_VENDA: TFloatField;
    qryItensCOD_BARRAS: TStringField;
    qryItensID_CAT: TIntegerField;
    qryItensSITUACAO: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edtPesqItensChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmItensVenda: TfrmItensVenda;

implementation

{$R *.dfm}

uses untDM;

procedure TfrmItensVenda.edtPesqItensChange(Sender: TObject);
begin
    if (cbCampoPesq.ItemIndex = 0) then
  begin
        if (edtPesqItens.Text <> '') then
  begin
    qryItens.Close;
    qryItens.SQL.Clear;
    qryItens.SQL.Add('SELECT * FROM PRODUTO');
    qryItens.SQL.Add('WHERE NOME_PRO LIKE :P1');
    qryItens.ParamByName('P1').AsString :=
                        '%' + edtPesqItens.Text + '%';
    qryItens.Open;
  end
  else
  begin
    qryItens.Close;
    qryItens.SQL.Clear;
    qryItens.SQL.Add('SELECT * FROM PRODUTO');
    qryItens.Open;
  end;
end;

    if (cbCampoPesq.ItemIndex = 1) then
    begin
      if (qryItens.Text <> '') then
  begin
    qryItens.Close;
    qryItens.SQL.Clear;
    qryItens.SQL.Add('SELECT * FROM PRODUTO');
    qryItens.SQL.Add('WHERE COD_BARRAS LIKE :P1');
    qryItens.ParamByName('P1').AsString :=
                        '%' + edtPesqItens.Text + '%';
    qryItens.Open;
  end
  else
  begin
    qryItens.Close;
    qryItens.SQL.Clear;
    qryItens.SQL.Add('SELECT * FROM PRODUTO');
    qryItens.Open;
  end;

end;

end;

procedure TfrmItensVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryItens.Close;
end;

procedure TfrmItensVenda.FormShow(Sender: TObject);
begin
  qryItens.Open();
end;

end.
