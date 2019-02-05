object FManuit: TFManuit
  Left = 183
  Top = 194
  Width = 453
  Height = 259
  Caption = 'FManuit'
  Color = 10207162
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 270
    Top = 192
    Width = 81
    Height = 31
    Caption = 'Grabar'
    TabOrder = 0
    OnClick = BitBtn1Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
      7700333333337777777733333333008088003333333377F73377333333330088
      88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
      000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
      FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
      99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
      99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
      99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
      93337FFFF7737777733300000033333333337777773333333333}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 358
    Top = 192
    Width = 81
    Height = 31
    Caption = 'Cerrar'
    TabOrder = 1
    OnClick = BitBtn2Click
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
  object BitBtn3: TBitBtn
    Left = 182
    Top = 192
    Width = 81
    Height = 31
    Caption = 'Editar'
    TabOrder = 2
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
      000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
      00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
      F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
      0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
      FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
      FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
      0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
      00333377737FFFFF773333303300000003333337337777777333}
    NumGlyphs = 2
  end
  object GroupBox1: TGroupBox
    Left = 6
    Top = 1
    Width = 433
    Height = 181
    Caption = 'Ingreso de nuevo registro '
    Color = 10207162
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 3
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 82
      Height = 13
      Caption = 'A'#241'o de Proceso :'
    end
    object Label5: TLabel
      Left = 16
      Top = 44
      Width = 97
      Height = 13
      Caption = 'Tipo de Beneficios  :'
    end
    object Label2: TLabel
      Left = 16
      Top = 72
      Width = 136
      Height = 13
      Caption = 'Fecha de Inicio de Proceso :'
    end
    object Label3: TLabel
      Left = 16
      Top = 96
      Width = 120
      Height = 13
      Caption = 'Fecha Final del Proceso :'
    end
    object Label6: TLabel
      Left = 16
      Top = 128
      Width = 92
      Height = 13
      Caption = 'Cantidad de veces:'
    end
    object Label4: TLabel
      Left = 16
      Top = 156
      Width = 74
      Height = 13
      Caption = 'Monto del UIT :'
      Color = 10207162
      ParentColor = False
    end
    object meMonuit: TMaskEdit
      Left = 160
      Top = 152
      Width = 49
      Height = 21
      MaxLength = 4
      TabOrder = 5
      OnExit = meMonuitExit
    end
    object dbdtpfecfin: TwwDBDateTimePicker
      Left = 160
      Top = 96
      Width = 89
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
    object dbdtpfecini: TwwDBDateTimePicker
      Left = 161
      Top = 72
      Width = 89
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 2
    end
    object dblcdTipBen: TwwDBLookupComboDlg
      Left = 159
      Top = 44
      Width = 49
      Height = 21
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      LookupTable = DM1.cdsTipBenef
      LookupField = 'TB'
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnChange = dblcdTipBenChange
    end
    object meanopro: TMaskEdit
      Left = 158
      Top = 16
      Width = 43
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 4
      TabOrder = 0
      OnExit = meanoproExit
    end
    object Panel1: TPanel
      Left = 224
      Top = 44
      Width = 185
      Height = 23
      Caption = 'Panel1'
      Enabled = False
      TabOrder = 6
      object metipbendes: TMaskEdit
        Left = 1
        Top = 1
        Width = 183
        Height = 21
        TabOrder = 0
      end
    end
    object meveces: TMaskEdit
      Left = 160
      Top = 120
      Width = 25
      Height = 21
      MaxLength = 1
      TabOrder = 4
      OnExit = mevecesExit
    end
  end
end
