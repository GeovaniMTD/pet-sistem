object frmCadastro: TfrmCadastro
  Left = 0
  Top = 0
  Align = alRight
  Caption = 'frmCadastro'
  ClientHeight = 201
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 8
    object Cadastro1: TMenuItem
      Caption = 'Cadastros'
      object Clientes1: TMenuItem
        Caption = 'Clientes'
      end
      object Produtos1: TMenuItem
        Caption = 'Produtos'
      end
      object Fornede1: TMenuItem
        Caption = 'Fornecedor'
      end
    end
    object Produtos2: TMenuItem
      Caption = 'Produtos'
    end
  end
end
