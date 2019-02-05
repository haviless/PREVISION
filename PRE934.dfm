object FrmListaCtaIndBloque: TFrmListaCtaIndBloque
  Left = 419
  Top = 199
  BorderStyle = bsDialog
  Caption = 'Cuenta individual en Lote'
  ClientHeight = 387
  ClientWidth = 416
  Color = 10207162
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object edFind: TEdit
    Left = 8
    Top = 8
    Width = 177
    Height = 21
    MaxLength = 8
    TabOrder = 0
  end
  object btnFind: TButton
    Left = 198
    Top = 6
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 1
    OnClick = btnFindClick
  end
  object vleDNI: TValueListEditor
    Left = 8
    Top = 48
    Width = 265
    Height = 321
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect, goThumbTracking]
    TabOrder = 2
    TitleCaptions.Strings = (
      'DNI'
      'ORDEN ASIGNADO')
    ColWidths = (
      135
      124)
  end
  object btnCargarExcel: TButton
    Left = 288
    Top = 48
    Width = 89
    Height = 25
    Caption = 'Cargar Excel'
    TabOrder = 3
    OnClick = btnCargarExcelClick
  end
  object btnBloque: TBitBtn
    Left = 288
    Top = 144
    Width = 118
    Height = 30
    Caption = 'Impresi'#243'n Bloque'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btnBloqueClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
      300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
      330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
      333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
      339977FF777777773377000BFB03333333337773FF733333333F333000333333
      3300333777333333337733333333333333003333333333333377333333333333
      333333333333333333FF33333333333330003333333333333777333333333333
      3000333333333333377733333333333333333333333333333333}
    NumGlyphs = 2
  end
  object btncerrar: TBitBtn
    Left = 288
    Top = 340
    Width = 78
    Height = 30
    Caption = 'Cerrar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
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
  object rgtipfor: TRadioGroup
    Left = 288
    Top = 80
    Width = 105
    Height = 56
    Caption = #191' Con formato ? '
    ItemIndex = 0
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 6
  end
  object open: TOpenDialog
    Left = 320
  end
end
