object frmProdutos: TfrmProdutos
  Left = 0
  Top = 0
  Caption = 'Produtos'
  ClientHeight = 420
  ClientWidth = 729
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 8
    Top = 48
    Width = 82
    Height = 13
    Caption = 'C'#243'digo de barras'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 8
    Top = 91
    Width = 70
    Height = 13
    Caption = 'C'#243'digo interno'
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 208
    Top = 91
    Width = 56
    Height = 13
    Caption = 'Qauntidade'
    FocusControl = DBEdit5
  end
  object Label6: TLabel
    Left = 8
    Top = 134
    Width = 70
    Height = 13
    Caption = 'Valor de Custo'
    FocusControl = DBEdit6
  end
  object Label7: TLabel
    Left = 208
    Top = 134
    Width = 72
    Height = 13
    Caption = 'Valor de Venda'
    FocusControl = DBEdit7
  end
  object Label8: TLabel
    Left = 8
    Top = 216
    Width = 83
    Height = 13
    Caption = 'Codigo Categoria'
  end
  object Label9: TLabel
    Left = 153
    Top = 219
    Width = 77
    Height = 13
    Caption = 'Nome Categoria'
  end
  object SpeedButton2: TSpeedButton
    Left = 124
    Top = 234
    Width = 23
    Height = 22
    OnClick = SpeedButton2Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 729
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitLeft = 232
    ExplicitTop = 160
    ExplicitWidth = 185
    object Codigo: TLabel
      Left = 12
      Top = 0
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object SpeedButton1: TSpeedButton
      Left = 95
      Top = 13
      Width = 23
      Height = 22
      OnClick = SpeedButton1Click
    end
    object Label2: TLabel
      Left = 124
      Top = 0
      Width = 27
      Height = 13
      Caption = 'Nome'
      FocusControl = dbeNome
    end
    object dbeNome: TDBEdit
      Left = 124
      Top = 14
      Width = 524
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NOME_PRO'
      DataSource = dsProdutos
      TabOrder = 0
    end
    object edtCodigo: TEdit
      Left = 10
      Top = 14
      Width = 79
      Height = 20
      Color = clAqua
      TabOrder = 1
      OnExit = edtCodigoExit
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 376
    Width = 729
    Height = 44
    Align = alBottom
    TabOrder = 1
    object btnExcluir: TButton
      Left = 160
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 0
      OnClick = btnExcluirClick
    end
    object btnNovo: TButton
      Left = 56
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 1
      OnClick = btnNovoClick
    end
    object btnGravar: TButton
      Left = 249
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Gravar'
      TabOrder = 2
      OnClick = btnGravarClick
    end
    object btnCancelar: TButton
      Left = 336
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 3
      OnClick = btnCancelarClick
    end
  end
  object DBEdit3: TDBEdit
    Left = 8
    Top = 64
    Width = 394
    Height = 21
    DataField = 'COD_BARRAS'
    DataSource = dsProdutos
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 8
    Top = 107
    Width = 134
    Height = 21
    DataField = 'COD_INTERNO'
    DataSource = dsProdutos
    TabOrder = 3
  end
  object DBEdit5: TDBEdit
    Left = 208
    Top = 107
    Width = 134
    Height = 21
    DataField = 'QTDE_PRO'
    DataSource = dsProdutos
    TabOrder = 4
  end
  object DBEdit6: TDBEdit
    Left = 8
    Top = 150
    Width = 134
    Height = 21
    DataField = 'VLR_CUSTO'
    DataSource = dsProdutos
    TabOrder = 5
  end
  object DBEdit7: TDBEdit
    Left = 208
    Top = 150
    Width = 134
    Height = 21
    DataField = 'VLR_VENDA'
    DataSource = dsProdutos
    TabOrder = 6
  end
  object dbeCodCategoria: TDBEdit
    Left = 8
    Top = 234
    Width = 97
    Height = 21
    DataField = 'ID_CAT'
    DataSource = dsProdutos
    TabOrder = 7
  end
  object dbeNomeCat: TDBEdit
    Left = 153
    Top = 238
    Width = 394
    Height = 21
    DataField = 'NOME_CAT'
    DataSource = dsProdutos
    TabOrder = 8
  end
  object dsProdutos: TDataSource
    DataSet = DM.qryProduto
    OnStateChange = dsProdutosStateChange
    OnDataChange = dsProdutosDataChange
    Left = 672
    Top = 56
  end
end
