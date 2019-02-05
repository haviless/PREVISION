object FDatFam: TFDatFam
  Left = 254
  Top = 200
  BorderStyle = bsDialog
  Caption = 'Datos de beneficiarios'
  ClientHeight = 329
  ClientWidth = 762
  Color = 13165023
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
    Left = 4
    Top = 6
    Width = 754
    Height = 108
    Caption = 'Datos del Asociado '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 17
      Width = 86
      Height = 15
      Caption = 'C'#243'digo Modular :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object sbBuscar: TSpeedButton
      Left = 119
      Top = 34
      Width = 34
      Height = 25
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentFont = False
      OnClick = sbBuscarClick
    end
    object Label7: TLabel
      Left = 163
      Top = 17
      Width = 124
      Height = 15
      Caption = 'Documento de Identidad'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 298
      Top = 17
      Width = 115
      Height = 15
      Caption = 'Apellidos y Nombre(s):'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 62
      Width = 96
      Height = 15
      Caption = 'Unidad de Gesti'#243'n:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 251
      Top = 62
      Width = 81
      Height = 15
      Caption = 'Unidad de Pago:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 503
      Top = 62
      Width = 97
      Height = 15
      Caption = 'Unidad de Proceso:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object pnlasocodmod: TPanel
      Left = 8
      Top = 35
      Width = 105
      Height = 23
      Color = 13165023
      TabOrder = 0
      object meAsocodmod: TMaskEdit
        Tag = 6
        Left = 1
        Top = 1
        Width = 103
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        TabOrder = 0
        OnChange = meAsocodmodChange
        OnExit = meAsocodmodExit
      end
    end
    object pnlAsoDocNum: TPanel
      Left = 163
      Top = 36
      Width = 127
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
      object meAsoDocNum: TMaskEdit
        Left = 1
        Top = 1
        Width = 125
        Height = 21
        TabOrder = 0
        OnChange = meAsoDocNumChange
      end
    end
    object pnlAsoApeNomDni: TPanel
      Left = 298
      Top = 36
      Width = 450
      Height = 23
      Color = 13165023
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object meAsoApeNomDni: TMaskEdit
        Left = 2
        Top = 1
        Width = 447
        Height = 21
        TabOrder = 0
        OnChange = meAsoApeNomDniChange
      end
    end
    object Panel3: TPanel
      Left = 8
      Top = 78
      Width = 239
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
      object meUsenom: TMaskEdit
        Left = 41
        Top = 1
        Width = 196
        Height = 21
        TabOrder = 0
      end
      object meUseid: TMaskEdit
        Left = 1
        Top = 1
        Width = 41
        Height = 21
        TabOrder = 1
      end
    end
    object Panel4: TPanel
      Left = 250
      Top = 78
      Width = 248
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
      object meUpagonom: TMaskEdit
        Left = 41
        Top = 1
        Width = 206
        Height = 21
        TabOrder = 0
      end
      object meUpagoid: TMaskEdit
        Left = 1
        Top = 1
        Width = 40
        Height = 21
        TabOrder = 1
      end
    end
    object Panel5: TPanel
      Left = 501
      Top = 78
      Width = 247
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
      object meUpronom: TMaskEdit
        Left = 40
        Top = 1
        Width = 206
        Height = 21
        TabOrder = 0
      end
      object meUproid: TMaskEdit
        Left = 1
        Top = 1
        Width = 40
        Height = 21
        TabOrder = 1
      end
    end
  end
  object dbgfamiliares: TwwDBGrid
    Left = 4
    Top = 120
    Width = 753
    Height = 161
    DisableThemesInTitle = False
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = DM1.dsDFam
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    TabOrder = 1
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = False
    OnDblClick = dbgfamiliaresDblClick
    object dbgbInserta: TwwIButton
      Left = 0
      Top = 0
      Width = 29
      Height = 29
      AllowAllUp = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333FF33333333FF333993333333300033377F3333333777333993333333
        300033F77FFF3333377739999993333333333777777F3333333F399999933333
        33003777777333333377333993333333330033377F3333333377333993333333
        3333333773333333333F333333333333330033333333F33333773333333C3333
        330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
        993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
        333333333337733333FF3333333C333330003333333733333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
      OnClick = dbgbInsertaClick
    end
  end
  object btncerrar: TBitBtn
    Left = 682
    Top = 289
    Width = 73
    Height = 30
    Caption = 'Cerrar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
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
end
