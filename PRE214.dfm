object Fanucardesignatario: TFanucardesignatario
  Left = 311
  Top = 184
  BorderStyle = bsDialog
  Caption = 'Anulaci'#243'n de carta de designatario'
  ClientHeight = 376
  ClientWidth = 483
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
  object Label10: TLabel
    Left = 8
    Top = 258
    Width = 111
    Height = 13
    Caption = 'Motivo de la Anulaci'#243'n:'
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 467
    Height = 246
    Caption = ' Datos de la Carta '
    Enabled = False
    TabOrder = 0
    object Label1: TLabel
      Left = 6
      Top = 19
      Width = 31
      Height = 13
      Caption = 'D.N.I.:'
    end
    object Label2: TLabel
      Left = 6
      Top = 44
      Width = 105
      Height = 13
      Caption = 'Apellidos y nombre(s) :'
    end
    object Label3: TLabel
      Left = 6
      Top = 69
      Width = 54
      Height = 13
      Caption = 'Nro. Carta :'
    end
    object Label4: TLabel
      Left = 6
      Top = 94
      Width = 86
      Height = 13
      Caption = 'Fecha recepci'#243'n :'
    end
    object Label5: TLabel
      Left = 6
      Top = 119
      Width = 42
      Height = 13
      Caption = 'Usuario :'
    end
    object Label6: TLabel
      Left = 6
      Top = 144
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    object Label7: TLabel
      Left = 6
      Top = 169
      Width = 90
      Height = 13
      Caption = 'Fecha de apertura:'
    end
    object Label8: TLabel
      Left = 6
      Top = 194
      Width = 102
      Height = 13
      Caption = 'Usuario que apertura:'
    end
    object Label9: TLabel
      Left = 6
      Top = 219
      Width = 104
      Height = 13
      Caption = 'N'#250'mero de beneficio :'
    end
    object measodni: TMaskEdit
      Left = 118
      Top = 15
      Width = 89
      Height = 21
      TabOrder = 0
    end
    object measoapenomdni: TMaskEdit
      Left = 118
      Top = 40
      Width = 334
      Height = 21
      TabOrder = 1
    end
    object medsgnro: TMaskEdit
      Left = 118
      Top = 65
      Width = 89
      Height = 21
      TabOrder = 2
    end
    object medsgfrec: TMaskEdit
      Left = 118
      Top = 90
      Width = 89
      Height = 21
      TabOrder = 3
    end
    object meusuario: TMaskEdit
      Left = 118
      Top = 115
      Width = 89
      Height = 21
      TabOrder = 4
    end
    object meestado: TMaskEdit
      Left = 118
      Top = 140
      Width = 89
      Height = 21
      TabOrder = 5
    end
    object medsgfecape: TMaskEdit
      Left = 118
      Top = 165
      Width = 89
      Height = 21
      TabOrder = 6
    end
    object meusuape: TMaskEdit
      Left = 118
      Top = 190
      Width = 89
      Height = 21
      TabOrder = 7
    end
    object mepvslbennr: TMaskEdit
      Left = 118
      Top = 215
      Width = 89
      Height = 21
      TabOrder = 8
    end
  end
  object btnanular: TBitBtn
    Left = 289
    Top = 339
    Width = 89
    Height = 30
    Caption = 'Anular'
    TabOrder = 1
    OnClick = btnanularClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
      555557777F777555F55500000000555055557777777755F75555005500055055
      555577F5777F57555555005550055555555577FF577F5FF55555500550050055
      5555577FF77577FF555555005050110555555577F757777FF555555505099910
      555555FF75777777FF555005550999910555577F5F77777775F5500505509990
      3055577F75F77777575F55005055090B030555775755777575755555555550B0
      B03055555F555757575755550555550B0B335555755555757555555555555550
      BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
      50BB555555555555575F555555555555550B5555555555555575}
    NumGlyphs = 2
  end
  object btnsalir: TBitBtn
    Left = 385
    Top = 339
    Width = 89
    Height = 30
    Caption = 'Salir'
    TabOrder = 2
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
  object memotanu: TMemo
    Left = 8
    Top = 277
    Width = 466
    Height = 57
    MaxLength = 200
    TabOrder = 3
  end
end
