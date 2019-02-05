object Fmstfotder: TFmstfotder
  Left = 201
  Top = 179
  BorderStyle = bsDialog
  Caption = 'Foto y Firma (Derrama)'
  ClientHeight = 220
  ClientWidth = 424
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
  object pnlfotfir: TPanel
    Left = 2
    Top = 1
    Width = 417
    Height = 215
    Color = 13165023
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 7
      Top = 1
      Width = 404
      Height = 175
      TabOrder = 0
      object TBevel
        Left = 9
        Top = 14
        Width = 150
        Height = 153
      end
      object ImagAso: TImage
        Left = 11
        Top = 17
        Width = 145
        Height = 147
        ParentShowHint = False
        ShowHint = True
        Stretch = True
      end
      object TBevel
        Left = 186
        Top = 62
        Width = 186
        Height = 81
      end
      object ImaFirma: TImage
        Left = 189
        Top = 65
        Width = 180
        Height = 74
        ParentShowHint = False
        ShowHint = True
        Stretch = True
      end
    end
    object BitBtn1: TBitBtn
      Left = 332
      Top = 179
      Width = 78
      Height = 30
      Caption = 'Cerrar'
      TabOrder = 1
      OnClick = BitBtn1Click
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
  object IdFTP1: TIdFTP
    MaxLineAction = maException
    ReadTimeout = 0
    Host = '10.10.10.41'
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 376
    Top = 22
  end
end
