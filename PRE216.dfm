object FExtRepDes: TFExtRepDes
  Left = 229
  Top = 257
  BorderStyle = bsDialog
  Caption = 'Extorno y reprog. de desembolso'
  ClientHeight = 412
  ClientWidth = 845
  Color = 13165023
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 4
    Top = 94
    Width = 834
    Height = 92
    Caption = ' Datos de la liquidaci'#243'n '
    Color = 10207162
    ParentColor = False
    TabOrder = 0
    object Label1: TLabel
      Left = 9
      Top = 18
      Width = 37
      Height = 13
      Caption = 'N'#250'mero'
    end
    object Label2: TLabel
      Left = 9
      Top = 43
      Width = 93
      Height = 13
      Caption = 'Apellidos y nombres'
    end
    object Label3: TLabel
      Left = 9
      Top = 69
      Width = 21
      Height = 13
      Caption = 'Tipo'
    end
    object Label4: TLabel
      Left = 112
      Top = 18
      Width = 3
      Height = 13
      Caption = ':'
    end
    object Label5: TLabel
      Left = 112
      Top = 69
      Width = 3
      Height = 13
      Caption = ':'
    end
    object Label6: TLabel
      Left = 112
      Top = 43
      Width = 3
      Height = 13
      Caption = ':'
    end
    object Label7: TLabel
      Left = 234
      Top = 18
      Width = 33
      Height = 13
      Caption = 'Fecha '
    end
    object Label8: TLabel
      Left = 272
      Top = 18
      Width = 3
      Height = 13
      Caption = ':'
    end
    object Panel1: TPanel
      Left = 120
      Top = 14
      Width = 108
      Height = 23
      Caption = 'Panel1'
      Enabled = False
      TabOrder = 0
      object edtNunBen: TEdit
        Left = 1
        Top = 1
        Width = 106
        Height = 21
        TabOrder = 0
      end
    end
    object Panel2: TPanel
      Left = 120
      Top = 39
      Width = 286
      Height = 23
      Caption = 'Panel1'
      Enabled = False
      TabOrder = 1
      object edtApeNom: TEdit
        Left = 1
        Top = 1
        Width = 284
        Height = 21
        TabOrder = 0
      end
    end
    object Panel3: TPanel
      Left = 120
      Top = 64
      Width = 193
      Height = 23
      Caption = 'Panel1'
      Enabled = False
      TabOrder = 2
      object edtTipBen: TEdit
        Left = 1
        Top = 1
        Width = 191
        Height = 21
        TabOrder = 0
      end
    end
    object Panel4: TPanel
      Left = 280
      Top = 14
      Width = 126
      Height = 23
      Caption = 'Panel1'
      Enabled = False
      TabOrder = 3
      object edtFecben: TEdit
        Left = 1
        Top = 1
        Width = 124
        Height = 21
        TabOrder = 0
      end
    end
  end
  object GroupBox3: TGroupBox
    Left = 4
    Top = 1
    Width = 834
    Height = 93
    Caption = ' Buscando liquidaci'#243'n '
    Color = 10207162
    ParentColor = False
    TabOrder = 1
    object rgbusca: TRadioGroup
      Left = 4
      Top = 11
      Width = 147
      Height = 75
      Color = 10207162
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Apellidos y nombre'
        'N'#250'mero de Beneficio'
        'C'#243'digo Modular')
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      OnClick = rgbuscaClick
    end
    object mebusca: TMaskEdit
      Left = 160
      Top = 35
      Width = 353
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 42
      ParentFont = False
      TabOrder = 1
    end
    object btnBuscar: TBitBtn
      Left = 520
      Top = 33
      Width = 75
      Height = 28
      Caption = 'Buscar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnBuscarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
        300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
        330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
        333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
        339977FF777777773377000BFB03333333337773FF733333333F333000333333
        3300333777333333337733333333333333003333333333333377333333333333
        333333333333333333FF33333333333330003333333333333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
    end
  end
  object gbtitdesgenxliq: TGroupBox
    Left = 4
    Top = 190
    Width = 835
    Height = 185
    Caption = ' Desembolso generado por liquidaci'#243'n '
    TabOrder = 2
    object dbgdesembolsos: TwwDBGrid
      Left = 7
      Top = 17
      Width = 819
      Height = 164
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = DM1.dsEstCarta
      Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = False
      OnDrawDataCell = dbgdesembolsosDrawDataCell
    end
  end
  object btnextorna: TBitBtn
    Left = 4
    Top = 379
    Width = 145
    Height = 28
    Caption = 'Extornar desembolso'
    Enabled = False
    TabOrder = 3
    OnClick = btnextornaClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333FF33333333333330003333333333333777333333333333
      300033FFFFFF3333377739999993333333333777777F3333333F399999933333
      3300377777733333337733333333333333003333333333333377333333333333
      3333333333333333333F333333333333330033333F33333333773333C3333333
      330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
      993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
      333333377F33333333FF3333C333333330003333733333333777333333333333
      3000333333333333377733333333333333333333333333333333}
    NumGlyphs = 2
  end
  object btnrepdepagoext: TBitBtn
    Left = 155
    Top = 379
    Width = 186
    Height = 28
    Caption = 'Reprogramaci'#243'n de desembolso'
    Enabled = False
    TabOrder = 4
    OnClick = btnrepdepagoextClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000000
      000055555F77777777775555000FFFFFFFF0555F777F5FFFF55755000F0F0000
      FFF05F777F7F77775557000F0F0FFFFFFFF0777F7F7F5FFFFFF70F0F0F0F0000
      00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFFFFF70F0F0F0F0000
      00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFF55570F0F0F0F000F
      FFF07F7F7F7F77755FF70F0F0F0FFFFF00007F7F7F7F5FF577770F0F0F0F00FF
      0F057F7F7F7F77557F750F0F0F0FFFFF00557F7F7F7FFFFF77550F0F0F000000
      05557F7F7F77777775550F0F0000000555557F7F7777777555550F0000000555
      55557F7777777555555500000005555555557777777555555555}
    NumGlyphs = 2
  end
  object btnimprimeliq: TBitBtn
    Left = 347
    Top = 379
    Width = 93
    Height = 28
    Caption = '&Liquidaci'#243'n'
    Enabled = False
    TabOrder = 5
    OnClick = btnimprimeliqClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
      8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
      8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
      8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
      03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
      03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
      33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
      33333337FFFF7733333333300000033333333337777773333333}
    NumGlyphs = 2
  end
  object btnsalir: TBitBtn
    Left = 448
    Top = 379
    Width = 80
    Height = 28
    Caption = '&Salir'
    TabOrder = 6
    OnClick = btnsalirClick
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
end
