object frmClientes: TfrmClientes
  Left = 0
  Top = 0
  Caption = 'Clientes'
  ClientHeight = 308
  ClientWidth = 589
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 33
    Height = 13
    Caption = 'ID_CLI'
    FocusControl = edtCodigo
  end
  object Label2: TLabel
    Left = 100
    Top = 5
    Width = 51
    Height = 13
    Caption = 'NOME_CLI'
    FocusControl = edtNome
  end
  object SpeedButton1: TSpeedButton
    Left = 71
    Top = 24
    Width = 23
    Height = 22
  end
  object Label3: TLabel
    Left = 8
    Top = 56
    Width = 42
    Height = 13
    Caption = 'END_CLI'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 224
    Top = 98
    Width = 49
    Height = 13
    Caption = 'FONE_CLI'
    FocusControl = dbeFone
  end
  object Label5: TLabel
    Left = 8
    Top = 98
    Width = 66
    Height = 13
    Caption = 'COD_CIDADE'
    FocusControl = dbeCodCidade
  end
  object Label6: TLabel
    Left = 224
    Top = 56
    Width = 48
    Height = 13
    Caption = 'CPF/CNPJ'
    FocusControl = dbeCpfCnpj
  end
  object Label7: TLabel
    Left = 8
    Top = 141
    Width = 41
    Height = 13
    Caption = 'CEP_CLI'
    FocusControl = dbeCep
  end
  object Label8: TLabel
    Left = 223
    Top = 141
    Width = 61
    Height = 13
    Caption = 'BAIRRO_CLI'
    FocusControl = dbeBairro
  end
  object Label9: TLabel
    Left = 8
    Top = 184
    Width = 99
    Height = 13
    Caption = 'DATA_NASCIMENTO'
  end
  object edtCodigo: TDBEdit
    Left = 8
    Top = 24
    Width = 57
    Height = 21
    DataField = 'ID_CLI'
    DataSource = dsCliente
    TabOrder = 0
    OnExit = edtCodigoExit
  end
  object edtNome: TDBEdit
    Left = 100
    Top = 24
    Width = 350
    Height = 21
    DataField = 'NOME_CLI'
    DataSource = dsCliente
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 8
    Top = 72
    Width = 193
    Height = 21
    DataField = 'END_CLI'
    DataSource = dsCliente
    TabOrder = 2
  end
  object dbeFone: TDBEdit
    Left = 224
    Top = 114
    Width = 257
    Height = 21
    DataField = 'FONE_CLI'
    DataSource = dsCliente
    TabOrder = 5
  end
  object dbeCodCidade: TDBEdit
    Left = 8
    Top = 114
    Width = 134
    Height = 21
    DataField = 'COD_CIDADE'
    DataSource = dsCliente
    TabOrder = 4
  end
  object btnNovo: TButton
    Left = 48
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Novo'
    TabOrder = 8
    OnClick = btnNovoClick
  end
  object btnGravar: TButton
    Left = 169
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 9
    OnClick = btnGravarClick
  end
  object btnCancelar: TButton
    Left = 311
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 10
    OnClick = btnCancelarClick
  end
  object dbeCpfCnpj: TDBEdit
    Left = 224
    Top = 72
    Width = 134
    Height = 21
    DataField = 'RG_CLI'
    DataSource = dsCliente
    TabOrder = 3
  end
  object dbeCep: TDBEdit
    Left = 8
    Top = 157
    Width = 193
    Height = 21
    DataField = 'CEP_CLI'
    DataSource = dsCliente
    TabOrder = 6
  end
  object dbeBairro: TDBEdit
    Left = 223
    Top = 157
    Width = 264
    Height = 21
    DataField = 'BAIRRO_CLI'
    DataSource = dsCliente
    TabOrder = 7
  end
  object RadioButton1: TRadioButton
    Left = 265
    Top = 202
    Width = 60
    Height = 17
    Caption = 'Ativo'
    TabOrder = 11
  end
  object RadioButton2: TRadioButton
    Left = 351
    Top = 202
    Width = 113
    Height = 17
    Caption = 'Inativo'
    TabOrder = 12
  end
  object btnExcluir: TButton
    Left = 474
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 13
    OnClick = btnExcluirClick
  end
  object mkDataNasci: TMaskEdit
    Left = 8
    Top = 203
    Width = 120
    Height = 21
    EditMask = '99/99/9999'
    MaxLength = 10
    TabOrder = 14
    Text = '  /  /    '
  end
  object dsCliente: TDataSource
    DataSet = DM.qryCliente
    OnStateChange = dsClienteStateChange
    Left = 520
    Top = 176
  end
end
