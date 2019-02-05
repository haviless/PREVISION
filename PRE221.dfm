object FProgDesembolso: TFProgDesembolso
  Left = 235
  Top = 141
  BorderStyle = bsDialog
  Caption = 'Programaci'#243'n de desembolso'
  ClientHeight = 393
  ClientWidth = 868
  Color = 10207162
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 84
    Width = 865
    Height = 261
    Caption = ' Liquidaciones por desembolsar '
    Color = 10207162
    ParentColor = False
    TabOrder = 0
    object dbgliquidaciones: TwwDBGrid
      Left = 5
      Top = 15
      Width = 852
      Height = 237
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = DM1.dsCabLiq
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
      OnDblClick = dbgliquidacionesDblClick
    end
  end
  object rgestliq: TRadioGroup
    Left = 0
    Top = 7
    Width = 135
    Height = 73
    Caption = ' Estado de la liquidaci'#243'n '
    Color = 10207162
    ItemIndex = 0
    Items.Strings = (
      'Por desembolsar'
      'Desembolsado'
      'Todos')
    ParentColor = False
    TabOrder = 1
    OnClick = rgestliqClick
  end
  object pnlbuscar: TGroupBox
    Left = 284
    Top = 7
    Width = 399
    Height = 74
    Caption = ' Buscar por Apellidos y Nombres'
    Color = 10207162
    ParentColor = False
    TabOrder = 2
    object pnlasoapenomdni: TPanel
      Left = 11
      Top = 27
      Width = 376
      Height = 23
      TabOrder = 0
      object edtBuscarDet: TEdit
        Left = 1
        Top = 1
        Width = 373
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 45
        ParentFont = False
        TabOrder = 0
        OnChange = edtBuscarDetChange
        OnKeyPress = edtBuscarDetKeyPress
      end
    end
  end
  object btnSalir: TBitBtn
    Left = 776
    Top = 352
    Width = 89
    Height = 30
    Caption = 'Salir'
    TabOrder = 3
    OnClick = btnSalirClick
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
  object btnliqben: TBitBtn
    Left = 679
    Top = 352
    Width = 89
    Height = 30
    Caption = 'Liq.Ben.'
    TabOrder = 4
    OnClick = btnliqbenClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000000
      000557777777777777750BBBBBBBBBBBBBB07F5555FFFFFFF5570BBBB0000000
      BBB07F5557777777FF570BBB077BBB770BB07F557755555775570BBBBBBBBBBB
      BBB07F5555FFFFFFF5570BBBB0000000BBB07F5557777777F5570BBBB0FFFFF0
      BBB07F5557FFFFF7F5570BBBB0000000BBB07F555777777755570BBBBBBBBBBB
      BBB07FFFFFFFFFFFFFF700000000000000007777777777777777500FFFFFFFFF
      F005577FF555FFFFF7755500FFF00000005555775FF7777777F5550F777FFFFF
      F055557F777FFF5557F5550000000FFF00555577777775FF77F5550777777000
      7055557FFFFFF777F7F555000000000000555577777777777755}
    NumGlyphs = 2
  end
  object rgbuscar: TRadioGroup
    Left = 140
    Top = 6
    Width = 139
    Height = 73
    Caption = ' Buscar por '
    ItemIndex = 0
    Items.Strings = (
      'Apellidos y nombre(s)'
      'C'#243'digo modular'
      'N'#250'mero de beneficio')
    TabOrder = 5
    OnClick = bubuscarClick
  end
end
