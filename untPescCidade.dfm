object frmPesqCidade: TfrmPesqCidade
  Left = 0
  Top = 0
  Caption = 'Pesquisa de Cidade'
  ClientHeight = 370
  ClientWidth = 686
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
    Width = 686
    Height = 65
    Align = alTop
    TabOrder = 0
    object edtPesquisa: TEdit
      Left = 120
      Top = 14
      Width = 377
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = edtPesquisaChange
    end
    object cbCampoPesq: TComboBox
      Left = 14
      Top = 14
      Width = 100
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 1
      Text = 'Cidade'
      OnClick = cbCampoPesqClick
      Items.Strings = (
        'Cidade'
        'UF')
    end
    object rgFiltro: TDBRadioGroup
      Left = 503
      Top = 2
      Width = 170
      Height = 60
      Caption = 'Filtros'
      DataField = 'SITUACAO'
      Items.Strings = (
        'Todos'
        'Ativo'
        'Inativo')
      TabOrder = 2
      Values.Strings = (
        '0'
        '1'
        '2')
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 65
    Width = 686
    Height = 305
    Align = alClient
    DataSource = dsPerquisa
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
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
        FieldName = 'COD_CIDADE'
        Title.Caption = 'C'#243'digo'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_CIDADE'
        Title.Caption = 'Nome da Cidade'
        Width = 573
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UF_CIDADE'
        Title.Caption = 'UF'
        Width = 29
        Visible = True
      end>
  end
  object qryPesquisa: TFDQuery
    Connection = DM.CONEXAO
    SQL.Strings = (
      'SELECT * FROM CIDADE')
    Left = 624
    Top = 88
    object qryPesquisaCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
      Origin = 'COD_CIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPesquisaNOME_CIDADE: TStringField
      FieldName = 'NOME_CIDADE'
      Origin = 'NOME_CIDADE'
      Size = 34
    end
    object qryPesquisaUF_CIDADE: TStringField
      FieldName = 'UF_CIDADE'
      Origin = 'UF_CIDADE'
      Required = True
      Size = 2
    end
  end
  object dsPerquisa: TDataSource
    DataSet = qryPesquisa
    Left = 624
    Top = 144
  end
  object tbPesquisa: TfrxDBDataset
    UserName = 'tbPesquisa'
    CloseDataSource = False
    DataSet = qryPesquisa
    BCDToCurrency = False
    Left = 336
    Top = 192
  end
  object frxReport1: TfrxReport
    Version = '5.1.8'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43004.889033784720000000
    ReportOptions.LastChange = 43004.889033784720000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 408
    Top = 176
    Datasets = <
      item
        DataSet = tbPesquisa
        DataSetName = 'tbPesquisa'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 45.354360000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 204.094620000000000000
          Top = 7.559060000000000000
          Width = 325.039580000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio de Cidade')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 34.015770000000000000
        Top = 124.724490000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          Left = 11.338590000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'C'#243'digo')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 120.944960000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Nome')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 472.441250000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'UF')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 3.779530000000000000
          Top = 30.236240000000000000
          Width = 714.331170000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 181.417440000000000000
        Width = 718.110700000000000000
        DataSet = tbPesquisa
        DataSetName = 'tbPesquisa'
        RowCount = 0
        object Memo2: TfrxMemoView
          Left = 7.559060000000000000
          Top = 7.559060000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[tbPesquisa."COD_CIDADE"]')
          ParentFont = False
        end
        object tbPesquisaNOME_CIDADE: TfrxMemoView
          Left = 128.504020000000000000
          Top = 7.559060000000000000
          Width = 272.126160000000000000
          Height = 18.897650000000000000
          DataField = 'NOME_CIDADE'
          DataSet = tbPesquisa
          DataSetName = 'tbPesquisa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[tbPesquisa."NOME_CIDADE"]')
          ParentFont = False
        end
        object tbPesquisaUF_CIDADE: TfrxMemoView
          Left = 476.220780000000000000
          Top = 7.559060000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'UF_CIDADE'
          DataSet = tbPesquisa
          DataSetName = 'tbPesquisa'
          Memo.UTF8W = (
            '[tbPesquisa."UF_CIDADE"]')
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 272.126160000000000000
        Width = 718.110700000000000000
      end
      object Memo6: TfrxMemoView
        Left = 11.338590000000000000
        Top = 268.346630000000000000
        Width = 166.299320000000000000
        Height = 18.897650000000000000
        Memo.UTF8W = (
          '[<Date> - ')
      end
      object Memo7: TfrxMemoView
        Left = 200.315090000000000000
        Top = 268.346630000000000000
        Width = 94.488250000000000000
        Height = 18.897650000000000000
        Memo.UTF8W = (
          '[Time]')
      end
    end
  end
end
