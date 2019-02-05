object Fanulacionexpediente: TFanulacionexpediente
  Left = 426
  Top = 199
  BorderStyle = bsDialog
  Caption = 'Anulaci'#243'n de expediente'
  ClientHeight = 290
  ClientWidth = 537
  Color = 13165023
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel
    Left = 8
    Top = 169
    Width = 110
    Height = 13
    Caption = 'Motivo de la anulaci'#243'n:'
  end
  object btnanular: TBitBtn
    Left = 338
    Top = 251
    Width = 89
    Height = 30
    Caption = 'Anular'
    TabOrder = 0
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
    Left = 432
    Top = 251
    Width = 89
    Height = 30
    Caption = 'Salir'
    TabOrder = 1
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
  object memmotanu: TMemo
    Left = 8
    Top = 186
    Width = 514
    Height = 57
    MaxLength = 200
    TabOrder = 2
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 7
    Width = 513
    Height = 154
    Caption = ' Datos del expediente a anular '
    Enabled = False
    TabOrder = 3
    object Label1: TLabel
      Left = 5
      Top = 23
      Width = 43
      Height = 13
      Caption = 'N'#250'mero: '
    end
    object Label2: TLabel
      Left = 5
      Top = 69
      Width = 33
      Height = 13
      Caption = 'Fecha:'
    end
    object Label3: TLabel
      Left = 5
      Top = 46
      Width = 97
      Height = 13
      Caption = 'Tipo de expediente :'
    end
    object Label4: TLabel
      Left = 5
      Top = 115
      Width = 102
      Height = 13
      Caption = 'Apellidos y nombre(s):'
    end
    object Label5: TLabel
      Left = 5
      Top = 92
      Width = 84
      Height = 13
      Caption = 'Usuario que crea:'
    end
    object edtnumexp: TEdit
      Left = 109
      Top = 23
      Width = 81
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object edtusucreexp: TEdit
      Left = 109
      Top = 92
      Width = 292
      Height = 21
      TabOrder = 1
    end
    object edttipobeneficio: TEdit
      Left = 109
      Top = 46
      Width = 126
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
    end
    object edtasoapenomdni: TEdit
      Left = 109
      Top = 115
      Width = 400
      Height = 21
      TabOrder = 3
    end
    object edtfecexp: TEdit
      Left = 109
      Top = 69
      Width = 70
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 4
    end
  end
end
