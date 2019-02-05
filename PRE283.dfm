object fmstdatrec: Tfmstdatrec
  Left = 88
  Top = 41
  BorderStyle = bsDialog
  Caption = 'Datos capturados de RENIEC'
  ClientHeight = 440
  ClientWidth = 636
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
  object pnlDatCapRen: TPanel
    Left = 0
    Top = 0
    Width = 634
    Height = 437
    Color = 13165023
    TabOrder = 0
    object imgFoto: TImage
      Left = 410
      Top = 5
      Width = 211
      Height = 254
      Stretch = True
    end
    object imgfirma2: TImage
      Left = 404
      Top = 263
      Width = 223
      Height = 76
      Stretch = True
    end
    object lblMsgUltimaAct2: TLabel
      Left = 401
      Top = 379
      Width = 224
      Height = 13
      AutoSize = False
      Caption = 'Fecha y Hora'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblMsgUltimaAct1: TLabel
      Left = 401
      Top = 344
      Width = 88
      Height = 13
      Caption = 'Ultima Captura:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblusuario: TLabel
      Left = 401
      Top = 362
      Width = 224
      Height = 13
      AutoSize = False
      Caption = 'Usuario'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object vallis: TValueListEditor
      Left = 4
      Top = 5
      Width = 390
      Height = 417
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TitleCaptions.Strings = (
        'Informaci'#243'n'
        'Datos')
      ColWidths = (
        150
        234)
    end
    object btncerrar: TBitBtn
      Left = 558
      Top = 402
      Width = 70
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
  end
end
