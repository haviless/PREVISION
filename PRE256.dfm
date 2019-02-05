object FFamiliares: TFFamiliares
  Left = 6
  Top = 112
  BorderStyle = bsDialog
  Caption = 'Mantenimiento de los deudos'
  ClientHeight = 351
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object gbdatoasociadio: TGroupBox
    Left = 2
    Top = 3
    Width = 777
    Height = 110
    Caption = ' Datos del Asociado '
    TabOrder = 0
    object Label1: TLabel
      Left = 7
      Top = 15
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
      Left = 116
      Top = 33
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentFont = False
    end
    object Label7: TLabel
      Left = 146
      Top = 15
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
      Left = 280
      Top = 15
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
      Left = 7
      Top = 61
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
      Left = 262
      Top = 61
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
      Left = 518
      Top = 61
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
      Left = 7
      Top = 33
      Width = 105
      Height = 25
      Color = 13165023
      TabOrder = 0
      object meAsocodmod: TMaskEdit
        Tag = 6
        Left = 2
        Top = 2
        Width = 101
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
    object Panel2: TPanel
      Left = 146
      Top = 33
      Width = 127
      Height = 25
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
        Left = 2
        Top = 2
        Width = 122
        Height = 21
        TabOrder = 0
      end
    end
    object Panel1: TPanel
      Left = 280
      Top = 33
      Width = 489
      Height = 25
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
        Left = 1
        Top = 2
        Width = 487
        Height = 21
        TabOrder = 0
      end
    end
    object Panel3: TPanel
      Left = 7
      Top = 78
      Width = 251
      Height = 25
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
        Left = 42
        Top = 2
        Width = 206
        Height = 21
        TabOrder = 0
      end
      object meUseid: TMaskEdit
        Left = 2
        Top = 2
        Width = 40
        Height = 21
        TabOrder = 1
      end
    end
    object Panel4: TPanel
      Left = 262
      Top = 78
      Width = 251
      Height = 25
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
        Left = 42
        Top = 2
        Width = 206
        Height = 21
        TabOrder = 0
      end
      object meUpagoid: TMaskEdit
        Left = 2
        Top = 2
        Width = 40
        Height = 21
        TabOrder = 1
      end
    end
    object Panel5: TPanel
      Left = 518
      Top = 78
      Width = 251
      Height = 25
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
        Left = 42
        Top = 2
        Width = 206
        Height = 21
        TabOrder = 0
      end
      object meUproid: TMaskEdit
        Left = 2
        Top = 2
        Width = 40
        Height = 21
        TabOrder = 1
      end
    end
  end
  object btncerrar: TBitBtn
    Left = 702
    Top = 312
    Width = 75
    Height = 30
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
  object wwDBGrid2: TwwDBGrid
    Left = 8
    Top = 120
    Width = 769
    Height = 185
    DisableThemesInTitle = False
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = DM1.dsDFam
    TabOrder = 2
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = False
    object wwDBGrid2IButton: TwwIButton
      Left = 0
      Top = 0
      Width = 30
      Height = 30
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
    end
  end
end
