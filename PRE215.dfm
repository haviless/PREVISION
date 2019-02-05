object FrmMantenimientoCausaCese: TFrmMantenimientoCausaCese
  Left = 439
  Top = 239
  Width = 626
  Height = 477
  BorderWidth = 3
  Caption = 'Mantenimiento de Causas de Cese'
  Color = 10207162
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPie: TPanel
    Left = 0
    Top = 399
    Width = 604
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 0
    DesignSize = (
      604
      34)
    object Label1: TLabel
      Left = 4
      Top = 10
      Width = 194
      Height = 15
      Caption = 'Doble clic para modificar el registro'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object btnSalir: TBitBtn
      Left = 493
      Top = 4
      Width = 110
      Height = 30
      Cursor = crHandPoint
      Hint = 'Salir'
      Anchors = [akRight, akBottom]
      Caption = '&Salir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial Rounded MT Bold'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnSalirClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 604
    Height = 45
    Align = alTop
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 1
    inline CboTipoBeneficio: TFCboTipoBeneficio
      Left = -1
      Top = 0
      Width = 234
      Height = 41
      TabOrder = 0
      inherited cbListaDatos: TwwDBLookupCombo
        OnChange = CboTipoBeneficiocbListaDatosChange
      end
    end
  end
  object dbgUniverso: TwwDBGrid
    Left = 0
    Top = 45
    Width = 604
    Height = 354
    DisableThemesInTitle = False
    Selected.Strings = (
      'IDENTEXT'#9'5'#9'Id Entidad '
      'DESENTEXT'#9'53'#9'Descripci'#243'n'
      'REGACT'#9'1'#9'Activo'#9'F')
    IniAttributes.Delimiter = ';;'
    TitleColor = 16053492
    FixedCols = 0
    ShowHorzScrollBar = True
    Align = alClient
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    ParentFont = False
    TabOrder = 2
    TitleAlignment = taCenter
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -13
    TitleFont.Name = 'Arial Rounded MT Bold'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = False
    OnDblClick = dbgUniversoDblClick
    PaintOptions.AlternatingRowColor = 16053492
    object btnAgregarCausaCese: TwwIButton
      Left = 0
      Top = 0
      Width = 25
      Height = 36
      AllowAllUp = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
        0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
        33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
      OnClick = btnAgregarCausaCeseClick
    end
  end
  object cdsQry26: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvReporte3'
    ValidateWithMask = True
    Left = 879
    Top = 558
  end
  object dsQry26: TwwDataSource
    DataSet = cdsQry26
    Left = 879
    Top = 576
  end
end
