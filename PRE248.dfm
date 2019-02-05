object Fnueretjud: TFnueretjud
  Left = 273
  Top = 165
  BorderStyle = bsDialog
  Caption = 'Ingreso de una nueva retenci'#243'n Judicial'
  ClientHeight = 450
  ClientWidth = 668
  Color = 13165023
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 2
    Top = 0
    Width = 663
    Height = 65
    Caption = ' Datos del asociado '
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 16
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
      Left = 115
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
      OnClick = sbBuscarClick
    end
    object Label7: TLabel
      Left = 147
      Top = 16
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
      Left = 278
      Top = 16
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
    object pnlasocodmod: TPanel
      Left = 7
      Top = 33
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
    object pnlasodocnum: TPanel
      Left = 144
      Top = 33
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
      end
    end
    object pnlasoapenomDni: TPanel
      Left = 275
      Top = 33
      Width = 378
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
        Left = 1
        Top = 1
        Width = 376
        Height = 21
        TabOrder = 0
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 2
    Top = 65
    Width = 663
    Height = 344
    Caption = ' Datos de la retenci'#243'n '
    TabOrder = 1
    object Label2: TLabel
      Left = 12
      Top = 16
      Width = 185
      Height = 15
      Caption = 'Apellidos y nombres del demandante:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 376
      Top = 16
      Width = 128
      Height = 15
      Caption = 'Documento de identidad :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 11
      Top = 58
      Width = 147
      Height = 15
      Caption = 'Observaci'#243'n de la retenci'#243'n:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 563
      Top = 16
      Width = 43
      Height = 15
      Caption = 'N'#250'mero:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object lbltipret: TLabel
      Left = 544
      Top = 60
      Width = 3
      Height = 13
    end
    object Label8: TLabel
      Left = 11
      Top = 140
      Width = 78
      Height = 15
      Caption = 'N'#250'mero Oficio'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 274
      Top = 140
      Width = 80
      Height = 15
      Caption = 'Fecha de recep.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 11
      Top = 186
      Width = 41
      Height = 15
      Caption = 'Pagar a:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 11
      Top = 99
      Width = 104
      Height = 15
      Caption = 'Nombre del Juzgado'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object lblporcentaje2: TLabel
      Left = 559
      Top = 82
      Width = 32
      Height = 15
      Caption = 'Monto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object pnlbenret: TPanel
      Left = 12
      Top = 33
      Width = 361
      Height = 23
      Color = 13165023
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object mebenret: TMaskEdit
        Left = 1
        Top = 1
        Width = 359
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 60
        TabOrder = 0
      end
    end
    object pnldesdocide: TPanel
      Left = 427
      Top = 33
      Width = 122
      Height = 23
      Color = 13165023
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      object medesdocide: TMaskEdit
        Left = 1
        Top = 1
        Width = 120
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
      end
    end
    object pnlobsret: TPanel
      Left = 12
      Top = 76
      Width = 412
      Height = 23
      Color = 13165023
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object meobsret: TMaskEdit
        Left = 1
        Top = 1
        Width = 409
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 50
        TabOrder = 0
      end
    end
    object pnlnumdocide: TPanel
      Left = 553
      Top = 33
      Width = 103
      Height = 23
      Color = 13165023
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object menumdocide: TMaskEdit
        Left = 1
        Top = 1
        Width = 101
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 10
        TabOrder = 0
      end
    end
    object pnlnumofi: TPanel
      Left = 11
      Top = 157
      Width = 256
      Height = 23
      Color = 13165023
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      object menumofi: TMaskEdit
        Left = 1
        Top = 1
        Width = 253
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 35
        TabOrder = 0
      end
    end
    object dbdtpfecofi: TwwDBDateTimePicker
      Left = 273
      Top = 157
      Width = 96
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 6
    end
    object pnlpagara: TPanel
      Left = 63
      Top = 183
      Width = 402
      Height = 23
      Color = 13165023
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      object mepagara: TMaskEdit
        Left = 1
        Top = 1
        Width = 400
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 55
        TabOrder = 0
        OnExit = mepagaraExit
      end
    end
    object gbforpag: TGroupBox
      Left = 12
      Top = 211
      Width = 557
      Height = 123
      Caption = ' Forma de Pago '
      TabOrder = 8
      object lblforpag: TLabel
        Left = 14
        Top = 20
        Width = 79
        Height = 15
        Caption = 'Forma de Pago :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object lblbanco: TLabel
        Left = 14
        Top = 47
        Width = 37
        Height = 15
        Caption = 'Banco :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object lblagegir: TLabel
        Left = 14
        Top = 74
        Width = 88
        Height = 15
        Caption = 'Agencia a Girar :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object lblasoncta: TLabel
        Left = 14
        Top = 101
        Width = 96
        Height = 15
        Caption = 'N'#250'mero de Cuenta:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object dblcforpag: TwwDBLookupCombo
        Left = 120
        Top = 18
        Width = 47
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TIPDESEID'#9'2'#9'C'#243'digo de la~Forma de pago'#9#9
          'TIPDESEDES'#9'25'#9'Descripci'#243'n de la~Forma de Pago'#9#9)
        LookupTable = DM1.cdsFPago
        LookupField = 'TIPDESEID'
        MaxLength = 2
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnChange = dblcforpagChange
        OnExit = dblcforpagExit
      end
      object dblcBanco: TwwDBLookupCombo
        Left = 120
        Top = 44
        Width = 47
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'BANCOID'#9'2'#9'C'#243'digo de~Banco'#9#9
          'BANCONOM'#9'25'#9'Descripci'#243'n del~banco'#9#9)
        LookupTable = DM1.cdsBanco
        LookupField = 'BANCOID'
        MaxLength = 2
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnChange = dblcBancoChange
        OnExit = dblcBancoExit
      end
      object pnlasoncta: TPanel
        Left = 210
        Top = 95
        Width = 142
        Height = 23
        Color = 13165023
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        Visible = False
        object measoncta: TMaskEdit
          Left = 1
          Top = 1
          Width = 140
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
      object pnlagegir: TPanel
        Left = 210
        Top = 70
        Width = 263
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
        Visible = False
        object meagengir: TMaskEdit
          Left = 1
          Top = 1
          Width = 261
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
      object pnlbanco: TPanel
        Left = 210
        Top = 44
        Width = 263
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
        object mebancodes: TMaskEdit
          Left = 1
          Top = 1
          Width = 261
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
      object pnlforpag: TPanel
        Left = 210
        Top = 18
        Width = 263
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
        object meforpagodes: TMaskEdit
          Left = 1
          Top = 1
          Width = 261
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
      object dblcagegir: TwwDBLookupComboDlg
        Left = 120
        Top = 70
        Width = 76
        Height = 21
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Lookup'
        MaxWidth = 0
        MaxHeight = 209
        LookupTable = DM1.cdsAgBco
        LookupField = 'AGENBCOID'
        TabOrder = 6
        Visible = False
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnChange = dblcagegirChange
        OnExit = dblcagegirExit
      end
    end
    object dblctipdoc: TwwDBLookupCombo
      Left = 376
      Top = 33
      Width = 47
      Height = 21
      CharCase = ecUpperCase
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TIPDESEID'#9'2'#9'C'#243'digo de la~Forma de pago'#9#9
        'TIPDESEDES'#9'25'#9'Descripci'#243'n de la~Forma de Pago'#9#9)
      LookupTable = DM1.cdsTDoc
      LookupField = 'TIPDOCCOD'
      MaxLength = 2
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnChange = dblctipdocChange
      OnExit = dblctipdocExit
    end
    object pnlnomjuz: TPanel
      Left = 12
      Top = 115
      Width = 412
      Height = 23
      Color = 13165023
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      object menomjuz: TMaskEdit
        Left = 1
        Top = 1
        Width = 409
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 50
        TabOrder = 0
      end
    end
    object rgporcentaje: TRadioGroup
      Left = 432
      Top = 72
      Width = 113
      Height = 65
      Caption = 'Forma de retenci'#243'n '
      ItemIndex = 0
      Items.Strings = (
        'En monto'
        'En porcencatje')
      TabOrder = 10
      OnClick = rgporcentajeClick
    end
    object pnlmonret: TPanel
      Left = 556
      Top = 101
      Width = 98
      Height = 23
      Color = 13165023
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
      DesignSize = (
        98
        23)
      object lblporcentaje: TLabel
        Left = 3
        Top = 3
        Width = 5
        Height = 13
        Anchors = []
        Layout = tlBottom
      end
      object meporcentaje: TMaskEdit
        Left = 47
        Top = 1
        Width = 49
        Height = 21
        TabOrder = 0
        OnExit = meporcentajeExit
        OnKeyPress = meporcentajeKeyPress
      end
    end
  end
  object btngrabar: TBitBtn
    Left = 83
    Top = 416
    Width = 73
    Height = 30
    Caption = 'Grabar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btngrabarClick
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
  object btnsalir: TBitBtn
    Left = 162
    Top = 416
    Width = 73
    Height = 30
    Caption = 'Cerrar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Century Gothic'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
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
  object btnedita: TBitBtn
    Left = 3
    Top = 416
    Width = 73
    Height = 30
    Caption = 'Editar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btneditaClick
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
end
