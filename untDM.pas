unit untDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TDM = class(TDataModule)
    CONEXAO: TFDConnection;
    qryProduto: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    qryCliente: TFDQuery;
    qryUltimo: TFDQuery;
    qryFuncionario: TFDQuery;
    qryCategoria: TFDQuery;
    qryCidade: TFDQuery;
    qryExecuta: TFDQuery;
    qryCidadeCOD_CIDADE: TIntegerField;
    qryCidadeNOME_CIDADE: TStringField;
    qryCidadeUF_CIDADE: TStringField;
    qryUsuario: TFDQuery;
    qryUsuarioID_FUN: TIntegerField;
    qryUsuarioSENHA_FUN: TStringField;
    qryClienteID_CLI: TIntegerField;
    qryClienteNOME_CLI: TStringField;
    qryClienteEND_CLI: TStringField;
    qryClienteFONE_CLI: TStringField;
    qryClienteCOD_CIDADE: TIntegerField;
    qryClienteCPF: TStringField;
    qryClienteCEP_CLI: TStringField;
    qryClienteBAIRRO_CLI: TStringField;
    qryClienteDATA_NASCIMENTO: TDateField;
    qryClienteSITUACAO: TIntegerField;
    qryClienteNUMERO_END: TStringField;
    qryClienteSEXO: TIntegerField;
    qryClienteNOME_CIDADE: TStringField;
    qryClienteUF_CIDADE: TStringField;
    qryFuncionarioID_FUN: TIntegerField;
    qryFuncionarioNOME_FUN: TStringField;
    qryFuncionarioEND_FUN: TStringField;
    qryFuncionarioCPF_FUN: TStringField;
    qryFuncionarioFONE_FUN: TStringField;
    qryFuncionarioDATA_NASIMENTO_FUN: TDateField;
    qryFuncionarioLOGIN_FUN: TStringField;
    qryFuncionarioSENHA_FUN: TStringField;
    qryFuncionarioSITUACAO: TIntegerField;
    qryFuncionarioBAIRRO_FUN: TStringField;
    qryFuncionarioCEP_FUN: TStringField;
    qryFuncionarioDATA_ADMISSAO_FUN: TDateField;
    qryFuncionarioDATA_DEMISSAO_FUN: TDateField;
    qryFuncionarioCARGO_FUN: TStringField;
    qryFuncionarioNUMERO_END_FUN: TStringField;
    qryCategoriaID_CAT: TIntegerField;
    qryCategoriaNOME_CAT: TStringField;
    qryItemVenda: TFDQuery;
    qryVenda: TFDQuery;
    qryProdutoID_PRO: TIntegerField;
    qryProdutoNOME_PRO: TStringField;
    qryProdutoQTDE_PRO: TBCDField;
    qryProdutoVLR_CUSTO: TCurrencyField;
    qryProdutoVLR_VENDA: TCurrencyField;
    qryProdutoID_CAT: TIntegerField;
    qryProdutoSITUACAO: TIntegerField;
    qryProdutoNOME_CAT: TStringField;
    qryProdutoSITUACAO_1: TStringField;
    qryVendaID_VEN: TIntegerField;
    qryVendaID_CLI: TIntegerField;
    qryVendaVALOR_VEN: TBCDField;
    qryVendaDATA_VEN: TDateField;
    qryVendaSITUACAO: TIntegerField;
    qryVendaID_FUN: TIntegerField;
    qryVendaTOTAL: TCurrencyField;
    qryVendaSUB_TOTAL: TCurrencyField;
    qryVendaQUANTIDADE: TCurrencyField;
    qryVendaVLR_UNIT: TCurrencyField;
    qryItemVendaID_PRO: TIntegerField;
    qryItemVendaID_VEN: TIntegerField;
    qryItemVendaQUANTIDADE: TCurrencyField;
    qryItemVendaVLR_UNIT: TCurrencyField;
    qryItemVendaTOTAL: TCurrencyField;
    qryItemVendaCOD_ITEN: TIntegerField;
    qryItemVendaNOME_PRO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses untCadastro, untCliente, untPrincipal;

{$R *.dfm}

end.
