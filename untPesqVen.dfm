object frmPesqVen: TfrmPesqVen
  Left = 0
  Top = 0
  Caption = 'Pesquisa de venda'
  ClientHeight = 389
  ClientWidth = 684
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 684
    Height = 49
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 2
      Width = 65
      Height = 13
      Caption = 'Pesquisar Por'
    end
    object Edit1: TEdit
      Left = 144
      Top = 16
      Width = 409
      Height = 21
      TabOrder = 0
    end
    object cbFiltro: TComboBox
      Left = 11
      Top = 16
      Width = 115
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 1
      Text = 'Nome'
      Items.Strings = (
        'Nome')
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 49
    Width = 684
    Height = 340
    Align = alClient
    DataSource = dsPesquisa
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_VEN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_CLI'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_VEN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_VEN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SITUACAO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_FUN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUB_TOTAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTIDADE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_UNIT'
        Visible = True
      end>
  end
  object qryPesquisa: TFDQuery
    Connection = DM.CONEXAO
    SQL.Strings = (
      'SELECT * FROM VENDA')
    Left = 448
    Top = 224
    object qryPesquisaID_VEN: TIntegerField
      FieldName = 'ID_VEN'
      Origin = 'ID_VEN'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPesquisaID_CLI: TIntegerField
      FieldName = 'ID_CLI'
      Origin = 'ID_CLI'
      Required = True
    end
    object qryPesquisaVALOR_VEN: TBCDField
      FieldName = 'VALOR_VEN'
      Origin = 'VALOR_VEN'
      Precision = 18
      Size = 2
    end
    object qryPesquisaDATA_VEN: TDateField
      FieldName = 'DATA_VEN'
      Origin = 'DATA_VEN'
    end
    object qryPesquisaSITUACAO: TIntegerField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
    end
    object qryPesquisaID_FUN: TIntegerField
      FieldName = 'ID_FUN'
      Origin = 'ID_FUN'
    end
    object qryPesquisaTOTAL: TCurrencyField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
    end
    object qryPesquisaSUB_TOTAL: TCurrencyField
      FieldName = 'SUB_TOTAL'
      Origin = 'SUB_TOTAL'
    end
    object qryPesquisaQUANTIDADE: TCurrencyField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
    end
    object qryPesquisaVLR_UNIT: TCurrencyField
      FieldName = 'VLR_UNIT'
      Origin = 'VLR_UNIT'
    end
  end
  object dsPesquisa: TDataSource
    DataSet = qryPesquisa
    Left = 384
    Top = 160
  end
end
