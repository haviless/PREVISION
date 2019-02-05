object FModificaformadepago: TFModificaformadepago
  Left = 131
  Top = 193
  BorderStyle = bsDialog
  Caption = 'Modificaci'#243'n de la forma de pago al asociado'
  ClientHeight = 192
  ClientWidth = 550
  Color = 13165023
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object gbforpag: TGroupBox
    Left = 0
    Top = 0
    Width = 548
    Height = 191
    Caption = ' Forma de Pago del Asociado '
    TabOrder = 0
    object GroupBox2: TGroupBox
      Left = 9
      Top = 20
      Width = 529
      Height = 132
      Caption = ' Forma de Pago '
      TabOrder = 0
      object lblforpag: TLabel
        Left = 20
        Top = 22
        Width = 79
        Height = 15
        Caption = 'Forma de Pago :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object lblbanco: TLabel
        Left = 20
        Top = 48
        Width = 37
        Height = 15
        Caption = 'Banco :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object lblagegir: TLabel
        Left = 16
        Top = 74
        Width = 88
        Height = 15
        Caption = 'Agencia a Girar :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object lblasoncta: TLabel
        Left = 16
        Top = 103
        Width = 96
        Height = 15
        Caption = 'N'#250'mero de Cuenta:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object dblcforpag: TwwDBLookupCombo
        Left = 118
        Top = 19
        Width = 47
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TIPDESEID'#9'2'#9'C'#243'digo de la~Forma de pago'#9#9
          'TIPDESEDES'#9'25'#9'Descripci'#243'n de la~Forma de Pago'#9#9)
        LookupTable = DM1.cdsFPago
        LookupField = 'TIPDESEID'
        MaxLength = 2
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnChange = dblcforpagChange
        OnExit = dblcforpagExit
      end
      object pnlforpag: TPanel
        Left = 170
        Top = 19
        Width = 201
        Height = 23
        Color = 13165023
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object meforpagodes: TMaskEdit
          Left = 2
          Top = 1
          Width = 198
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 10
          ParentFont = False
          TabOrder = 0
        end
      end
      object dblcBanco: TwwDBLookupCombo
        Left = 118
        Top = 45
        Width = 47
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'BANCOID'#9'2'#9'C'#243'digo de~Banco'#9#9
          'BANCONOM'#9'25'#9'Descripci'#243'n del~banco'#9#9)
        LookupTable = DM1.cdsBanco
        LookupField = 'BANCOID'
        MaxLength = 2
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnChange = dblcBancoChange
        OnExit = dblcBancoExit
      end
      object pnlbanco: TPanel
        Left = 170
        Top = 45
        Width = 200
        Height = 23
        Color = 13165023
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        object mebancodes: TMaskEdit
          Left = 2
          Top = 1
          Width = 197
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 10
          ParentFont = False
          TabOrder = 0
        end
      end
      object pnlagegir: TPanel
        Left = 202
        Top = 72
        Width = 224
        Height = 23
        Color = 13165023
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        object meagengir: TMaskEdit
          Left = 2
          Top = 1
          Width = 220
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 10
          ParentFont = False
          TabOrder = 0
        end
      end
      object pnlasoncta: TPanel
        Left = 118
        Top = 100
        Width = 143
        Height = 23
        Color = 13165023
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        object measoncta: TMaskEdit
          Left = 2
          Top = 1
          Width = 140
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 10
          ParentFont = False
          TabOrder = 0
        end
      end
      object dblcagegir: TwwDBLookupComboDlg
        Left = 118
        Top = 72
        Width = 76
        Height = 21
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Lookup'
        MaxWidth = 0
        MaxHeight = 209
        LookupTable = DM1.cdsAgBco
        LookupField = 'AGENBCOID'
        TabOrder = 6
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnChange = dblcagegirChange
        OnExit = dblcagegirExit
      end
    end
    object btncerrar: TBitBtn
      Left = 470
      Top = 156
      Width = 67
      Height = 29
      Caption = 'Cerrar'
      TabOrder = 1
      OnClick = btncerrarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301111111110333337F333333337F33330111111111
        0333337F333333337F333301111111110333337F333333337F33330111111111
        0333337F333333337F333301111111110333337F333333337F33330111111111
        0333337F3333333F7F333301111111B10333337F333333737F33330111111111
        0333337F333333337F333301111111110333337F33FFFFF37F3333011EEEEE11
        0333337F377777F37F3333011EEEEE110333337F37FFF7F37F3333011EEEEE11
        0333337F377777337F333301111111110333337F333333337F33330111111111
        0333337FFFFFFFFF7F3333000000000003333377777777777333}
      NumGlyphs = 2
    end
    object btnGeneraLiquidacion: TBitBtn
      Left = 390
      Top = 156
      Width = 73
      Height = 29
      Caption = 'Actualizar'
      TabOrder = 2
      OnClick = btnGeneraLiquidacionClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
        7700333333337777777733333333008088003333333377F73377333333330088
        88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
        000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
        FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
        99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      NumGlyphs = 2
    end
  end
end
