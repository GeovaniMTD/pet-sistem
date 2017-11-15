unit untPesqVen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls;

type
  TfrmPesqVen = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    cbFiltro: TComboBox;
    Label1: TLabel;
    qryPesquisa: TFDQuery;
    dsPesquisa: TDataSource;
    qryPesquisaID_VEN: TIntegerField;
    qryPesquisaID_CLI: TIntegerField;
    qryPesquisaVALOR_VEN: TBCDField;
    qryPesquisaDATA_VEN: TDateField;
    qryPesquisaSITUACAO: TIntegerField;
    qryPesquisaID_FUN: TIntegerField;
    qryPesquisaTOTAL: TCurrencyField;
    qryPesquisaSUB_TOTAL: TCurrencyField;
    qryPesquisaQUANTIDADE: TCurrencyField;
    qryPesquisaVLR_UNIT: TCurrencyField;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesqVen: TfrmPesqVen;

implementation

{$R *.dfm}

uses untDM;

procedure TfrmPesqVen.FormShow(Sender: TObject);
begin
  qryPesquisa.Open();
end;

end.
