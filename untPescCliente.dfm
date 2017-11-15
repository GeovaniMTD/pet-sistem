object frmPesqCliente: TfrmPesqCliente
  Left = 0
  Top = 0
  Caption = 'Pesquisa de Cliente'
  ClientHeight = 530
  ClientWidth = 795
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
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
    Width = 795
    Height = 49
    Align = alTop
    Caption = ' '
    TabOrder = 0
    ExplicitWidth = 698
    object edtPesquisa: TEdit
      Left = 111
      Top = 14
      Width = 442
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = edtPesquisaChange
    end
    object cbCampoPesq: TComboBox
      Left = 5
      Top = 14
      Width = 100
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 1
      Text = 'Nome'
      OnClick = cbCampoPesqClick
      Items.Strings = (
        'Nome'
        'Endere'#231'o'
        'CPF')
    end
    object rbTodas: TRadioButton
      Left = 574
      Top = -2
      Width = 51
      Height = 22
      Caption = 'Todas'
      Checked = True
      TabOrder = 2
      TabStop = True
      OnClick = rbTodasClick
    end
    object rbInativo: TRadioButton
      Left = 574
      Top = 18
      Width = 69
      Height = 14
      Caption = 'Inativo'
      TabOrder = 3
      OnClick = rbInativoClick
    end
    object rbAtivo: TRadioButton
      Left = 574
      Top = 32
      Width = 69
      Height = 14
      Caption = 'Ativo'
      TabOrder = 4
      OnClick = rbAtivoClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 49
    Width = 795
    Height = 481
    Align = alClient
    DataSource = dsPesquisa
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_CLI'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_CLI'
        Title.Caption = 'Nome'
        Width = 278
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'END_CLI'
        Title.Caption = 'Endere'#231'o'
        Width = 213
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SITUACAOF'
        Title.Caption = 'Situa'#231#227'o'
        Width = 69
        Visible = True
      end>
  end
  object qryPesquisa: TFDQuery
    Connection = DM.CONEXAO
    SQL.Strings = (
      'SELECT CLIENTE.*,'
      'CASE CLIENTE.SITUACAO'
      'WHEN '#39'0'#39' THEN '#39'INATIVO'#39
      'WHEN '#39'1'#39' THEN '#39'ATIVO'#39
      'END AS SITUACAOF'
      'FROM CLIENTE')
    Left = 592
    Top = 168
    object qryPesquisaID_CLI: TIntegerField
      FieldName = 'ID_CLI'
      Origin = 'ID_CLI'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPesquisaNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'NOME_CLI'
      Required = True
      Size = 50
    end
    object qryPesquisaEND_CLI: TStringField
      FieldName = 'END_CLI'
      Origin = 'END_CLI'
      Size = 30
    end
    object qryPesquisaFONE_CLI: TStringField
      FieldName = 'FONE_CLI'
      Origin = 'FONE_CLI'
    end
    object qryPesquisaCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
      Origin = 'COD_CIDADE'
      Required = True
    end
    object qryPesquisaCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      Size = 22
    end
    object qryPesquisaCEP_CLI: TStringField
      FieldName = 'CEP_CLI'
      Origin = 'CEP_CLI'
    end
    object qryPesquisaBAIRRO_CLI: TStringField
      FieldName = 'BAIRRO_CLI'
      Origin = 'BAIRRO_CLI'
    end
    object qryPesquisaDATA_NASCIMENTO: TDateField
      FieldName = 'DATA_NASCIMENTO'
      Origin = 'DATA_NASCIMENTO'
    end
    object qryPesquisaSITUACAO: TIntegerField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
    end
    object qryPesquisaNUMERO_END: TStringField
      FieldName = 'NUMERO_END'
      Origin = 'NUMERO_END'
      Size = 10
    end
    object qryPesquisaSEXO: TIntegerField
      FieldName = 'SEXO'
      Origin = 'SEXO'
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
  object dsPesquisa: TDataSource
    DataSet = qryPesquisa
    Left = 592
    Top = 120
  end
end
