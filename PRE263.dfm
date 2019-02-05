object Fnuecardes: TFnuecardes
  Left = 277
  Top = 196
  BorderStyle = bsDialog
  Caption = 'Nueva carta de beneficiario'
  ClientHeight = 259
  ClientWidth = 897
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
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 5
    Top = 16
    Width = 884
    Height = 202
    Caption = ' A'#241'adir Carta de beneficiario '
    TabOrder = 0
    object Label1: TLabel
      Left = 5
      Top = 19
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
      Left = 223
      Top = 16
      Width = 25
      Height = 23
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
      Left = 267
      Top = 19
      Width = 127
      Height = 15
      Caption = 'Documento de Identidad:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 7
      Top = 49
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
      Left = 528
      Top = 77
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
      Left = 527
      Top = 49
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
      Left = 527
      Top = 19
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
    object Label2: TLabel
      Left = 8
      Top = 146
      Width = 102
      Height = 15
      Caption = 'Fecha de recepci'#243'n:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 5
      Top = 170
      Width = 68
      Height = 15
      Caption = 'Observaci'#243'n:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object pnlasocodmod: TPanel
      Left = 127
      Top = 16
      Width = 92
      Height = 23
      Color = 13165023
      TabOrder = 0
      object meAsocodmod: TMaskEdit
        Tag = 6
        Left = 1
        Top = 1
        Width = 90
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        TabOrder = 0
        OnExit = meAsocodmodExit
      end
    end
    object Panel2: TPanel
      Left = 401
      Top = 16
      Width = 98
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
      object meAsoDocNum: TMaskEdit
        Left = 1
        Top = 1
        Width = 96
        Height = 21
        Color = clMoneyGreen
        TabOrder = 0
      end
    end
    object Panel1: TPanel
      Left = 127
      Top = 45
      Width = 373
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
      object meAsoApeNomDni: TMaskEdit
        Left = 1
        Top = 1
        Width = 371
        Height = 21
        Color = clMoneyGreen
        TabOrder = 0
      end
    end
    object Panel3: TPanel
      Left = 630
      Top = 72
      Width = 247
      Height = 23
      Color = 13165023
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      object meUsenom: TMaskEdit
        Left = 40
        Top = 1
        Width = 206
        Height = 21
        Color = clMoneyGreen
        TabOrder = 0
      end
      object meUseid: TMaskEdit
        Left = 1
        Top = 1
        Width = 40
        Height = 21
        Color = clMoneyGreen
        TabOrder = 1
      end
    end
    object Panel4: TPanel
      Left = 630
      Top = 45
      Width = 247
      Height = 23
      Color = 13165023
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      object meUpagonom: TMaskEdit
        Left = 40
        Top = 1
        Width = 206
        Height = 21
        Color = clMoneyGreen
        TabOrder = 0
      end
      object meUpagoid: TMaskEdit
        Left = 1
        Top = 1
        Width = 40
        Height = 21
        Color = clMoneyGreen
        TabOrder = 1
      end
    end
    object Panel5: TPanel
      Left = 630
      Top = 16
      Width = 247
      Height = 23
      Color = 13165023
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      object meUpronom: TMaskEdit
        Left = 40
        Top = 1
        Width = 206
        Height = 21
        Color = clMoneyGreen
        TabOrder = 0
      end
      object meUproid: TMaskEdit
        Left = 1
        Top = 1
        Width = 40
        Height = 21
        Color = clMoneyGreen
        TabOrder = 1
      end
    end
    object dbdtpfecrec: TwwDBDateTimePicker
      Left = 117
      Top = 143
      Width = 90
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 2
      OnExit = dbdtpfecrecExit
    end
    object meobs: TMaskEdit
      Left = 117
      Top = 167
      Width = 454
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 3
    end
    object gborigen: TGroupBox
      Left = 7
      Top = 71
      Width = 351
      Height = 64
      Caption = ' Origen de la carta de designatario '
      TabOrder = 1
      object Label20: TLabel
        Left = 6
        Top = 16
        Width = 33
        Height = 15
        Caption = 'Dpto. :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object Label16: TLabel
        Left = 6
        Top = 38
        Width = 44
        Height = 15
        Caption = 'Oficina:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object dblcdptoid: TwwDBLookupCombo
        Left = 84
        Top = 14
        Width = 42
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        LookupTable = DM1.cdsDpto
        LookupField = 'DPTOID'
        MaxLength = 2
        ParentFont = False
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcdptoidExit
      end
      object dblcdofid: TwwDBLookupCombo
        Left = 84
        Top = 36
        Width = 42
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        LookupTable = DM1.cdsOfDes
        LookupField = 'OFDESID'
        MaxLength = 4
        ParentFont = False
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcdofidExit
      end
      object Panel12: TPanel
        Left = 143
        Top = 36
        Width = 200
        Height = 21
        Color = 13165023
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object edtOficina: TMaskEdit
          Left = 1
          Top = 1
          Width = 198
          Height = 19
          AutoSize = False
          Color = clMoneyGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 0
        end
      end
      object Panel13: TPanel
        Left = 143
        Top = 14
        Width = 200
        Height = 21
        Color = 13165023
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        object medesdpto: TMaskEdit
          Left = 1
          Top = 1
          Width = 198
          Height = 19
          AutoSize = False
          Color = clMoneyGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 0
        end
      end
    end
  end
  object btngrabar: TBitBtn
    Left = 736
    Top = 223
    Width = 73
    Height = 30
    Caption = 'Grabar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
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
  object btncerrar: TBitBtn
    Left = 817
    Top = 223
    Width = 73
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
