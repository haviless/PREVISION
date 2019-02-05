object FMueNoTieAutDesApo: TFMueNoTieAutDesApo
  Left = 442
  Top = 215
  BorderStyle = bsDialog
  Caption = 'Sin autorizaci'#243'n (desc. de aportes)'
  ClientHeight = 161
  ClientWidth = 254
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object StaticText1: TStaticText
    Left = 0
    Top = 0
    Width = 254
    Height = 19
    Align = alTop
    Alignment = taCenter
    Caption = 'AUTORIZACION  DE  DESCUENTO'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 0
  end
  object GroupBox3: TGroupBox
    Left = 4
    Top = 25
    Width = 244
    Height = 96
    Color = clMoneyGreen
    ParentColor = False
    TabOrder = 1
    object fcLabel1: TfcLabel
      Left = 32
      Top = 24
      Width = 185
      Height = 50
      AutoSize = False
      Caption = 'Asociado no cuenta con autorizaci'#243'n de descuento de aportes.'
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaTop
      TextOptions.WordWrap = True
    end
  end
  object btncerrar: TBitBtn
    Left = 164
    Top = 125
    Width = 83
    Height = 30
    Caption = 'Cerrar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Century Gothic'
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
