object FCalculoLiquidacion: TFCalculoLiquidacion
  Left = 209
  Top = 205
  BorderStyle = bsDialog
  Caption = 'C'#225'lculo de la Liquidaci'#243'n'
  ClientHeight = 140
  ClientWidth = 591
  Color = 10207162
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 9
    Width = 91
    Height = 15
    Caption = 'C'#243'digo Asociado :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 116
    Top = 9
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
  object Label3: TLabel
    Left = 236
    Top = 9
    Width = 110
    Height = 15
    Caption = 'Apellidos y Nombres :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 12
    Top = 64
    Width = 99
    Height = 15
    Caption = 'Nro. Resol. Nombr.:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 120
    Top = 64
    Width = 106
    Height = 15
    Caption = 'Fecha Resol. Nombr.:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 239
    Top = 64
    Width = 89
    Height = 15
    Caption = 'Nro. Resol. Cese :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 373
    Top = 64
    Width = 96
    Height = 15
    Caption = 'Fecha Resol. Cese :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object meNumResNom: TMaskEdit
    Left = 12
    Top = 80
    Width = 97
    Height = 21
    Enabled = False
    TabOrder = 0
  end
  object meNumResCes: TMaskEdit
    Left = 238
    Top = 80
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object DBDTPFecResNom: TwwDBDateTimePicker
    Left = 120
    Top = 80
    Width = 105
    Height = 21
    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
    CalendarAttributes.Font.Color = clWindowText
    CalendarAttributes.Font.Height = -11
    CalendarAttributes.Font.Name = 'MS Sans Serif'
    CalendarAttributes.Font.Style = []
    Epoch = 1950
    Enabled = False
    ShowButton = True
    TabOrder = 1
  end
  object DBDTPFecResCes: TwwDBDateTimePicker
    Left = 372
    Top = 80
    Width = 97
    Height = 21
    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
    CalendarAttributes.Font.Color = clWindowText
    CalendarAttributes.Font.Height = -11
    CalendarAttributes.Font.Name = 'MS Sans Serif'
    CalendarAttributes.Font.Style = []
    Epoch = 1950
    ShowButton = True
    TabOrder = 3
  end
  object Panel2: TPanel
    Left = 12
    Top = 27
    Width = 98
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
    object measoid: TMaskEdit
      Left = 2
      Top = 2
      Width = 94
      Height = 21
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 119
    Top = 27
    Width = 106
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
    object measocodmod: TMaskEdit
      Left = 2
      Top = 2
      Width = 102
      Height = 21
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 236
    Top = 27
    Width = 341
    Height = 25
    Color = 13165023
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    object measoapenomdni: TMaskEdit
      Left = 2
      Top = 2
      Width = 336
      Height = 21
      TabOrder = 0
    end
  end
  object btncalliquidacion: TBitBtn
    Left = 503
    Top = 59
    Width = 74
    Height = 30
    Caption = 'Procesar'
    TabOrder = 7
    OnClick = btncalliquidacionClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
      73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
      0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
      0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
      0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
      0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
      0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
      0333337F777777737F333308888888880333337F333333337F33330888888888
      03333373FFFFFFFF733333700000000073333337777777773333}
    NumGlyphs = 2
  end
  object btncerrar: TBitBtn
    Left = 503
    Top = 98
    Width = 74
    Height = 30
    Caption = 'Cerrar'
    TabOrder = 8
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
