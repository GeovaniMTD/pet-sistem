object frmPesqProduto: TfrmPesqProduto
  Left = 0
  Top = 0
  Caption = 'Pesquisa de Produto'
  ClientHeight = 516
  ClientWidth = 796
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 796
    Height = 65
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 6
      Top = 4
      Width = 65
      Height = 13
      Caption = 'Pesquisar por'
    end
    object edtPesqPro: TEdit
      Left = 132
      Top = 23
      Width = 473
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = edtPesqProChange
    end
    object cbFiltro: TComboBox
      Left = 11
      Top = 23
      Width = 115
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 1
      Text = 'Nome'
      Items.Strings = (
        'Nome')
    end
    object rbTodas: TRadioButton
      Left = 645
      Top = 13
      Width = 51
      Height = 14
      Caption = 'Todas'
      Checked = True
      TabOrder = 2
      TabStop = True
      OnClick = rbTodasClick
    end
    object rbInativo: TRadioButton
      Left = 645
      Top = 29
      Width = 69
      Height = 14
      Caption = 'Inativo'
      TabOrder = 3
      OnClick = rbInativoClick
      OnExit = rbInativoExit
    end
    object rbAtivo: TRadioButton
      Left = 645
      Top = 45
      Width = 69
      Height = 14
      Caption = 'Ativo'
      TabOrder = 4
      OnClick = rbAtivoClick
      OnExit = rbInativoExit
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 468
    Width = 796
    Height = 48
    Align = alBottom
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 65
    Width = 796
    Height = 403
    Align = alClient
    DataSource = dsPesquisa
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_PRO'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_PRO'
        Title.Caption = 'Nome'
        Width = 497
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_CUSTO'
        Title.Caption = 'Valor Custo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_VENDA'
        Title.Caption = 'Valor Venda'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SITUACAOF'
        Title.Caption = 'Situa'#231#227'o'
        Width = 81
        Visible = True
      end>
  end
  object dsPesquisa: TDataSource
    DataSet = qryPesquisa
    Left = 480
    Top = 112
  end
  object qryPesquisa: TFDQuery
    Connection = DM.CONEXAO
    SQL.Strings = (
      'SELECT PRODUTO.* ,'
      'CASE PRODUTO.SITUACAO'
      ' WHEN '#39'0'#39' THEN '#39'INATIVO'#39
      'WHEN '#39'1'#39' THEN '#39'ATIVO'#39
      'END AS SITUACAOF'
      'FROM PRODUTO')
    Left = 480
    Top = 168
    object qryPesquisaID_PRO: TIntegerField
      FieldName = 'ID_PRO'
      Origin = 'ID_PRO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPesquisaNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = 'NOME_PRO'
      Required = True
      Size = 40
    end
    object qryPesquisaQTDE_PRO: TBCDField
      FieldName = 'QTDE_PRO'
      Origin = 'QTDE_PRO'
      Precision = 18
      Size = 2
    end
    object qryPesquisaVLR_CUSTO: TCurrencyField
      FieldName = 'VLR_CUSTO'
      Origin = 'VLR_CUSTO'
    end
    object qryPesquisaVLR_VENDA: TCurrencyField
      FieldName = 'VLR_VENDA'
      Origin = 'VLR_VENDA'
      Required = True
    end
    object qryPesquisaID_CAT: TIntegerField
      FieldName = 'ID_CAT'
      Origin = 'ID_CAT'
    end
    object qryPesquisaSITUACAO: TIntegerField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
    end
    object qryPesquisaSITUACAOF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'SITUACAOF'
      Origin = 'SITUACAOF'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 7
    end
  end
end
