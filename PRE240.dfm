object FManFami: TFManFami
  Left = 227
  Top = 36
  BorderStyle = bsDialog
  Caption = 'Mantenimiento de beneficiarios'
  ClientHeight = 637
  ClientWidth = 906
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
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object btnCerrar: TBitBtn
    Left = 830
    Top = 601
    Width = 73
    Height = 30
    Caption = 'Cerrar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnCerrarClick
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
  object btnGrabar: TBitBtn
    Left = 752
    Top = 601
    Width = 73
    Height = 30
    Caption = 'Grabar'
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btnGrabarClick
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
  object btneditar: TBitBtn
    Left = 592
    Top = 601
    Width = 73
    Height = 30
    Caption = 'Editar'
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btneditarClick
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
  object btnElimina: TBitBtn
    Left = 672
    Top = 601
    Width = 73
    Height = 30
    Caption = 'Eliminar'
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnEliminaClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333FF33333333333330003333333333333777333333333333
      300033FFFFFF3333377739999993333333333777777F3333333F399999933333
      3300377777733333337733333333333333003333333333333377333333333333
      3333333333333333333F333333333333330033333F33333333773333C3333333
      330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
      993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
      333333377F33333333FF3333C333333330003333733333333777333333333333
      3000333333333333377733333333333333333333333333333333}
    NumGlyphs = 2
  end
  object gbtutor: TGroupBox
    Left = 4
    Top = 425
    Width = 899
    Height = 168
    Caption = 'Datos del Tutor '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object Label18: TLabel
      Left = 16
      Top = 18
      Width = 69
      Height = 15
      Caption = 'Ingrese DNI:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 15
      Top = 64
      Width = 136
      Height = 15
      Caption = 'Apellido Paterno del Tutor:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 214
      Top = 64
      Width = 140
      Height = 15
      Caption = 'Apellido Materno del Tutor:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 414
      Top = 64
      Width = 105
      Height = 15
      Caption = 'Nombre(s) del Tutor:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object pnldnitut: TPanel
      Left = 15
      Top = 36
      Width = 88
      Height = 23
      TabOrder = 0
      object mednitut: TMaskEdit
        Left = 1
        Top = 1
        Width = 86
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 8
        TabOrder = 0
      end
    end
    object btnbuscarentut: TBitBtn
      Left = 108
      Top = 35
      Width = 75
      Height = 25
      Caption = 'RENIEC'
      TabOrder = 1
      OnClick = btnbuscarentutClick
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
    object pnlapepattut: TPanel
      Left = 15
      Top = 84
      Width = 194
      Height = 23
      TabOrder = 2
      object meapepattut: TMaskEdit
        Left = 1
        Top = 1
        Width = 192
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 30
        TabOrder = 0
      end
    end
    object pnlapemattut: TPanel
      Left = 214
      Top = 84
      Width = 194
      Height = 23
      TabOrder = 3
      object meapemattut: TMaskEdit
        Left = 1
        Top = 1
        Width = 192
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 30
        TabOrder = 0
      end
    end
    object pnlnomtut: TPanel
      Left = 412
      Top = 84
      Width = 194
      Height = 23
      TabOrder = 4
      object menomtut: TMaskEdit
        Left = 1
        Top = 1
        Width = 192
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 30
        TabOrder = 0
      end
    end
    object GroupBox4: TGroupBox
      Left = 613
      Top = 9
      Width = 279
      Height = 153
      Caption = ' RENIEC'
      TabOrder = 5
      object ImagenTut: TImage
        Left = 7
        Top = 15
        Width = 132
        Height = 109
        Cursor = crHandPoint
        ParentShowHint = False
        ShowHint = True
        Stretch = True
      end
      object FirmaTut: TImage
        Left = 142
        Top = 94
        Width = 132
        Height = 29
        Cursor = crHandPoint
        ParentShowHint = False
        ShowHint = True
        Stretch = True
      end
      object btnRENIECTut: TBitBtn
        Left = 72
        Top = 127
        Width = 142
        Height = 22
        Caption = 'Informaci'#243'n RENIEC'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnRENIECTutClick
      end
    end
  end
  object gbbeneficiario: TGroupBox
    Left = 4
    Top = 50
    Width = 899
    Height = 369
    Caption = ' Datos del beneficiario '
    TabOrder = 5
    object Label4: TLabel
      Left = 200
      Top = 16
      Width = 88
      Height = 15
      Caption = 'Tipo de Relaci'#243'n:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 383
      Top = 16
      Width = 144
      Height = 15
      Caption = '(Tipo de relaci'#243'n "OTROS")'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label17: TLabel
      Left = 7
      Top = 16
      Width = 69
      Height = 15
      Caption = 'Ingrese DNI:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 7
      Top = 65
      Width = 87
      Height = 15
      Caption = 'Apellido Paterno:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 260
      Top = 65
      Width = 91
      Height = 15
      Caption = 'Apellido Materno:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 509
      Top = 65
      Width = 96
      Height = 15
      Caption = 'Apellido de Casada'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 7
      Top = 112
      Width = 56
      Height = 15
      Caption = 'Nombre(s):'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 241
      Top = 112
      Width = 107
      Height = 15
      Caption = 'Fecha de Nacimiento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 358
      Top = 112
      Width = 27
      Height = 15
      Caption = 'Sexo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object lblporcentaje: TLabel
      Left = 496
      Top = 112
      Width = 61
      Height = 15
      Caption = 'Porcentaje :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 7
      Top = 158
      Width = 54
      Height = 15
      Caption = 'Direcci'#243'n:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label21: TLabel
      Left = 7
      Top = 198
      Width = 71
      Height = 15
      Caption = 'Departamento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label22: TLabel
      Left = 207
      Top = 198
      Width = 49
      Height = 15
      Caption = 'Provincia'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label23: TLabel
      Left = 457
      Top = 198
      Width = 40
      Height = 15
      Caption = 'Distrito'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label19: TLabel
      Left = 7
      Top = 246
      Width = 69
      Height = 15
      Caption = 'Telefono Fijo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label20: TLabel
      Left = 155
      Top = 246
      Width = 29
      Height = 15
      Caption = 'Movil'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label16: TLabel
      Left = 303
      Top = 246
      Width = 31
      Height = 15
      Caption = 'Email:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 7
      Top = 294
      Width = 76
      Height = 15
      Caption = 'Forma de Pago:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object lblbanco: TLabel
      Left = 217
      Top = 294
      Width = 34
      Height = 15
      Caption = 'Banco:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object lblagegir: TLabel
      Left = 425
      Top = 294
      Width = 86
      Height = 15
      Caption = 'Agencia de Giro:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object dblctiprel: TwwDBLookupCombo
      Left = 200
      Top = 35
      Width = 49
      Height = 21
      CharCase = ecUpperCase
      DropDownAlignment = taLeftJustify
      LookupTable = DM1.cdsTRelacion
      LookupField = 'PARENID'
      MaxLength = 2
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnChange = dblctiprelChange
    end
    object pnldestiprel: TPanel
      Left = 251
      Top = 35
      Width = 123
      Height = 23
      TabOrder = 3
      object medestiprel: TMaskEdit
        Left = 1
        Top = 1
        Width = 121
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        MaxLength = 30
        TabOrder = 0
      end
    end
    object pnlfamotrtiprel: TPanel
      Left = 381
      Top = 35
      Width = 154
      Height = 23
      TabOrder = 4
      object mefamotrtiprel: TMaskEdit
        Left = 1
        Top = 1
        Width = 152
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 15
        TabOrder = 0
      end
    end
    object pnldni: TPanel
      Left = 7
      Top = 35
      Width = 88
      Height = 23
      TabOrder = 0
      object medni: TMaskEdit
        Left = 1
        Top = 1
        Width = 86
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 8
        TabOrder = 0
        OnKeyPress = medniKeyPress
      end
    end
    object btnbuscarenben: TBitBtn
      Left = 103
      Top = 35
      Width = 74
      Height = 25
      Caption = 'RENIEC'
      TabOrder = 1
      OnClick = btnbuscarenbenClick
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
    object pnlapepatben: TPanel
      Left = 7
      Top = 84
      Width = 244
      Height = 23
      TabOrder = 5
      object meapepatben: TMaskEdit
        Left = 1
        Top = 1
        Width = 242
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 30
        TabOrder = 0
      end
    end
    object pnlapematben: TPanel
      Left = 260
      Top = 84
      Width = 244
      Height = 23
      TabOrder = 6
      object meapematben: TMaskEdit
        Left = 1
        Top = 1
        Width = 242
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 30
        TabOrder = 0
      end
    end
    object pnlApeCas: TPanel
      Left = 509
      Top = 84
      Width = 227
      Height = 23
      TabOrder = 7
      object meapecas: TMaskEdit
        Left = 1
        Top = 1
        Width = 225
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 30
        TabOrder = 0
      end
    end
    object pnlnomben: TPanel
      Left = 7
      Top = 130
      Width = 227
      Height = 23
      TabOrder = 8
      object menomben: TMaskEdit
        Left = 1
        Top = 1
        Width = 225
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 30
        TabOrder = 0
      end
    end
    object dbdtpfecnac: TwwDBDateTimePicker
      Left = 239
      Top = 130
      Width = 105
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 9
      UnboundDataType = wwDTEdtDate
      OnExit = dbdtpfecnacExit
    end
    object dblcidesex: TwwDBLookupCombo
      Left = 356
      Top = 130
      Width = 43
      Height = 21
      CharCase = ecUpperCase
      DropDownAlignment = taLeftJustify
      LookupTable = DM1.cdsSexo
      LookupField = 'ID'
      MaxLength = 1
      TabOrder = 10
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnChange = dblcidesexChange
    end
    object pnldessex: TPanel
      Left = 400
      Top = 130
      Width = 88
      Height = 23
      TabOrder = 11
      object medessex: TMaskEdit
        Left = 1
        Top = 1
        Width = 86
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        MaxLength = 30
        TabOrder = 0
      end
    end
    object pnlporcentaje: TPanel
      Left = 496
      Top = 130
      Width = 61
      Height = 23
      TabOrder = 12
      object meporcentaje: TMaskEdit
        Left = 1
        Top = 1
        Width = 59
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 30
        TabOrder = 0
      end
    end
    object pnldireccionfam: TPanel
      Left = 7
      Top = 176
      Width = 688
      Height = 23
      TabOrder = 13
      object medireccionfam: TMaskEdit
        Left = 1
        Top = 1
        Width = 686
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 250
        TabOrder = 0
      end
    end
    object dblcddptoid: TwwDBLookupComboDlg
      Left = 7
      Top = 219
      Width = 41
      Height = 21
      CharCase = ecUpperCase
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      LookupTable = DM1.cdsDpto
      LookupField = 'DPTOID'
      MaxLength = 2
      TabOrder = 14
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnChange = dblcddptoidChange
      OnExit = dblcddptoidExit
    end
    object pnldesdptoben: TPanel
      Left = 55
      Top = 217
      Width = 148
      Height = 23
      Enabled = False
      TabOrder = 15
      object medptodes: TMaskEdit
        Left = 1
        Top = 1
        Width = 145
        Height = 21
        CharCase = ecUpperCase
        Color = 15132390
        Enabled = False
        TabOrder = 0
      end
    end
    object dblcdProvincia: TwwDBLookupComboDlg
      Left = 207
      Top = 219
      Width = 50
      Height = 21
      CharCase = ecUpperCase
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      LookupTable = DM1.cdsProvincia
      LookupField = 'CIUDID'
      Color = clWhite
      MaxLength = 4
      TabOrder = 16
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnChange = dblcdProvinciaChange
      OnExit = dblcdProvinciaExit
    end
    object pnldesproben: TPanel
      Left = 262
      Top = 217
      Width = 192
      Height = 23
      Enabled = False
      TabOrder = 17
      object meprovinciades: TMaskEdit
        Left = 1
        Top = 1
        Width = 190
        Height = 21
        CharCase = ecUpperCase
        Color = 15132390
        Enabled = False
        TabOrder = 0
      end
    end
    object dblcdDistrito: TwwDBLookupComboDlg
      Left = 457
      Top = 219
      Width = 66
      Height = 21
      CharCase = ecUpperCase
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      LookupTable = DM1.cdsDist
      LookupField = 'ZIPID'
      Color = clWhite
      MaxLength = 6
      TabOrder = 18
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnExit = dblcdDistritoExit
    end
    object pnldesdisben: TPanel
      Left = 523
      Top = 217
      Width = 174
      Height = 23
      Enabled = False
      TabOrder = 19
      object medistritodes: TMaskEdit
        Left = 1
        Top = 1
        Width = 171
        Height = 21
        CharCase = ecUpperCase
        Color = 15132390
        Enabled = False
        TabOrder = 0
      end
    end
    object pnltelefonofijo: TPanel
      Left = 7
      Top = 265
      Width = 133
      Height = 23
      TabOrder = 20
      object metelefonofijo: TMaskEdit
        Left = 1
        Top = 1
        Width = 131
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 15
        TabOrder = 0
      end
    end
    object pnlmovil: TPanel
      Left = 155
      Top = 265
      Width = 133
      Height = 23
      TabOrder = 21
      object memovil: TMaskEdit
        Left = 1
        Top = 1
        Width = 131
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 9
        TabOrder = 0
        OnExit = memovilExit
        OnKeyPress = memovilKeyPress
      end
    end
    object pnlemail: TPanel
      Left = 303
      Top = 265
      Width = 263
      Height = 23
      TabOrder = 22
      object meemail: TMaskEdit
        Left = 1
        Top = 1
        Width = 261
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 60
        TabOrder = 0
        OnExit = meemailExit
      end
    end
    object dblcforpag: TwwDBLookupCombo
      Left = 7
      Top = 319
      Width = 50
      Height = 21
      CharCase = ecUpperCase
      DropDownAlignment = taLeftJustify
      LookupTable = DM1.cdsFPago
      LookupField = 'TIPDESEID'
      MaxLength = 2
      TabOrder = 23
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnChange = dblcforpagChange
      OnExit = dblcforpagExit
    end
    object pnlforpagodes: TPanel
      Left = 63
      Top = 319
      Width = 151
      Height = 23
      TabOrder = 24
      object meforpagodes: TMaskEdit
        Left = 1
        Top = 1
        Width = 148
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        MaxLength = 30
        TabOrder = 0
      end
    end
    object dblcBanco: TwwDBLookupCombo
      Left = 217
      Top = 319
      Width = 50
      Height = 21
      CharCase = ecUpperCase
      DropDownAlignment = taLeftJustify
      LookupTable = DM1.cdsBanco
      LookupField = 'BANCOID'
      MaxLength = 2
      TabOrder = 25
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnChange = dblcBancoChange
    end
    object pnldesban: TPanel
      Left = 271
      Top = 319
      Width = 151
      Height = 23
      TabOrder = 26
      object mebancodes: TMaskEdit
        Left = 1
        Top = 1
        Width = 148
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        MaxLength = 30
        TabOrder = 0
      end
    end
    object dblcagegir: TwwDBLookupComboDlg
      Left = 425
      Top = 319
      Width = 77
      Height = 21
      CharCase = ecUpperCase
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      LookupTable = DM1.cdsAgBco
      LookupField = 'AGENBCOID'
      MaxLength = 8
      TabOrder = 27
      Visible = False
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnChange = dblcagegirChange
    end
    object pnlagegir: TPanel
      Left = 507
      Top = 319
      Width = 190
      Height = 23
      TabOrder = 28
      Visible = False
      object meagegir: TMaskEdit
        Left = 1
        Top = 1
        Width = 188
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        MaxLength = 30
        TabOrder = 0
      end
    end
    object gbfotofirmaben: TGroupBox
      Left = 740
      Top = 8
      Width = 153
      Height = 184
      Caption = ' RENIEC'
      TabOrder = 29
      object ImagenBen: TImage
        Left = 9
        Top = 14
        Width = 132
        Height = 109
        Cursor = crHandPoint
        ParentShowHint = False
        ShowHint = True
        Stretch = True
      end
      object FirmaBen: TImage
        Left = 10
        Top = 126
        Width = 132
        Height = 29
        Cursor = crHandPoint
        ParentShowHint = False
        ShowHint = True
        Stretch = True
      end
      object btnRENIECBen: TBitBtn
        Left = 5
        Top = 158
        Width = 142
        Height = 22
        Caption = 'Informaci'#243'n RENIEC'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnRENIECBenClick
      end
    end
  end
  object rgbenmenedad: TRadioGroup
    Left = 4
    Top = 8
    Width = 213
    Height = 37
    Caption = #191' El beneficiario menor de edad ?'
    Columns = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Items.Strings = (
      'Si'
      'No')
    ParentFont = False
    TabOrder = 6
    OnClick = rgbenmenedadClick
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Left = 700
    Top = 16
  end
  object ppBDEReniec: TppBDEPipeline
    DataSource = DM1.dsParam
    UserName = 'BDEReniec'
    Left = 824
    Top = 288
  end
  object ppRReniec: TppReport
    AutoStop = False
    DataPipeline = ppBDEReniec
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297127
    PrinterSetup.mmPaperWidth = 210079
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zsPercentage
    PreviewFormSettings.ZoomPercentage = 120
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 864
    Top = 288
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppBDEReniec'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 11377
      mmPrintPosition = 0
      object ppShape41: TppShape
        UserName = 'Shape41'
        Brush.Color = 14341846
        Pen.Color = clWindow
        mmHeight = 5556
        mmLeft = 0
        mmTop = 5556
        mmWidth = 125413
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label11'
        Caption = 'DATOS PERSONALES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 41275
        mmTop = 6879
        mmWidth = 29845
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 198438
      mmPrintPosition = 0
      object ppShape79: TppShape
        UserName = 'Shape602'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41275
        mmTop = 162719
        mmWidth = 83873
        BandType = 4
      end
      object ppShape78: TppShape
        UserName = 'Shape78'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41275
        mmTop = 156898
        mmWidth = 83873
        BandType = 4
      end
      object ppShape76: TppShape
        UserName = 'Shape76'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 0
        mmTop = 156513
        mmWidth = 40481
        BandType = 4
      end
      object ppShape77: TppShape
        UserName = 'Shape77'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 0
        mmTop = 162093
        mmWidth = 40481
        BandType = 4
      end
      object ppShape75: TppShape
        UserName = 'Shape601'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41275
        mmTop = 151342
        mmWidth = 83873
        BandType = 4
      end
      object ppShape74: TppShape
        UserName = 'Shape74'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 265
        mmTop = 150932
        mmWidth = 40481
        BandType = 4
      end
      object ppShape40: TppShape
        UserName = 'Shape201'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41010
        mmTop = 128588
        mmWidth = 83873
        BandType = 4
      end
      object ppShape39: TppShape
        UserName = 'Shape30'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 0
        mmTop = 128588
        mmWidth = 40481
        BandType = 4
      end
      object ppShape29: TppShape
        UserName = 'Shape29'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 0
        mmTop = 123031
        mmWidth = 40481
        BandType = 4
      end
      object ppShape19: TppShape
        UserName = 'Shape19'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5822
        mmLeft = 0
        mmTop = 95250
        mmWidth = 40480
        BandType = 4
      end
      object ppShape69: TppShape
        UserName = 'Shape69'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41540
        mmTop = 84138
        mmWidth = 83874
        BandType = 4
      end
      object ppShape71: TppShape
        UserName = 'Shape71'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5822
        mmLeft = 0
        mmTop = 73010
        mmWidth = 40481
        BandType = 4
      end
      object ppShape32: TppShape
        UserName = 'Shape32'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 0
        mmTop = 67455
        mmWidth = 40481
        BandType = 4
      end
      object ppShape67: TppShape
        UserName = 'Shape67'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41540
        mmTop = 61913
        mmWidth = 83874
        BandType = 4
      end
      object ppShape66: TppShape
        UserName = 'Shape66'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 0
        mmTop = 61900
        mmWidth = 40480
        BandType = 4
      end
      object ppShape65: TppShape
        UserName = 'Shape102'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5556
        mmLeft = 41540
        mmTop = 28575
        mmWidth = 83874
        BandType = 4
      end
      object ppShape64: TppShape
        UserName = 'Shape64'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5556
        mmLeft = 0
        mmTop = 28570
        mmWidth = 40480
        BandType = 4
      end
      object ppShape31: TppShape
        UserName = 'Shape31'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41540
        mmTop = 73025
        mmWidth = 83874
        BandType = 4
      end
      object ppShape28: TppShape
        UserName = 'Shape28'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41010
        mmTop = 106363
        mmWidth = 83873
        BandType = 4
      end
      object ppShape26: TppShape
        UserName = 'Shape26'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41540
        mmTop = 45244
        mmWidth = 83874
        BandType = 4
      end
      object ppShape21: TppShape
        UserName = 'Shape21'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41540
        mmTop = 56356
        mmWidth = 83874
        BandType = 4
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5556
        mmLeft = 41540
        mmTop = 6350
        mmWidth = 83874
        BandType = 4
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5556
        mmLeft = 0
        mmTop = 6350
        mmWidth = 40480
        BandType = 4
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5555
        mmLeft = 0
        mmTop = 794
        mmWidth = 40480
        BandType = 4
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Nro. de Libro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 1852
        mmWidth = 16404
        BandType = 4
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'D.N.I.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 7408
        mmWidth = 7408
        BandType = 4
      end
      object ppShape5: TppShape
        UserName = 'Shape5'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5556
        mmLeft = 0
        mmTop = 11906
        mmWidth = 40480
        BandType = 4
      end
      object ppShape6: TppShape
        UserName = 'Shape6'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5556
        mmLeft = 41540
        mmTop = 11906
        mmWidth = 83874
        BandType = 4
      end
      object ppShape7: TppShape
        UserName = 'Shape7'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5556
        mmLeft = 0
        mmTop = 17460
        mmWidth = 40480
        BandType = 4
      end
      object ppShape8: TppShape
        UserName = 'Shape8'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5556
        mmLeft = 41540
        mmTop = 17463
        mmWidth = 83874
        BandType = 4
      end
      object ppShape9: TppShape
        UserName = 'Shape9'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5556
        mmLeft = 0
        mmTop = 23015
        mmWidth = 40480
        BandType = 4
      end
      object ppShape10: TppShape
        UserName = 'Shape10'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5556
        mmLeft = 41540
        mmTop = 23019
        mmWidth = 83874
        BandType = 4
      end
      object ppShape11: TppShape
        UserName = 'Shape11'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41540
        mmTop = 95250
        mmWidth = 83874
        BandType = 4
      end
      object ppShape12: TppShape
        UserName = 'Shape12'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5822
        mmLeft = 0
        mmTop = 89695
        mmWidth = 40480
        BandType = 4
      end
      object ppShape13: TppShape
        UserName = 'Shape13'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 0
        mmTop = 67470
        mmWidth = 40480
        BandType = 4
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'N'#250'mero documento alterno'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 68792
        mmWidth = 34396
        BandType = 4
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Lugar de Nacimiento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 96573
        mmWidth = 26194
        BandType = 4
      end
      object ppShape14: TppShape
        UserName = 'Shape14'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41540
        mmTop = 67469
        mmWidth = 83874
        BandType = 4
      end
      object ppShape15: TppShape
        UserName = 'Shape15'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 0
        mmTop = 34125
        mmWidth = 40480
        BandType = 4
      end
      object ppShape16: TppShape
        UserName = 'Shape16'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41540
        mmTop = 34131
        mmWidth = 83874
        BandType = 4
      end
      object ppShape17: TppShape
        UserName = 'Shape17'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 0
        mmTop = 39680
        mmWidth = 40480
        BandType = 4
      end
      object ppShape18: TppShape
        UserName = 'Shape18'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41540
        mmTop = 39688
        mmWidth = 83874
        BandType = 4
      end
      object ppShape20: TppShape
        UserName = 'Shape101'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41540
        mmTop = 89694
        mmWidth = 83874
        BandType = 4
      end
      object ppShape22: TppShape
        UserName = 'Shape22'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 0
        mmTop = 56345
        mmWidth = 40481
        BandType = 4
      end
      object ppShape23: TppShape
        UserName = 'Shape23'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 0
        mmTop = 50800
        mmWidth = 40481
        BandType = 4
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Estatura'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 52123
        mmWidth = 10583
        BandType = 4
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Sexo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 57679
        mmWidth = 6350
        BandType = 4
      end
      object ppShape24: TppShape
        UserName = 'Shape24'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41540
        mmTop = 50800
        mmWidth = 83874
        BandType = 4
      end
      object ppShape25: TppShape
        UserName = 'Shape25'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 0
        mmTop = 45244
        mmWidth = 40481
        BandType = 4
      end
      object ppShape27: TppShape
        UserName = 'Shape27'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5822
        mmLeft = 0
        mmTop = 106340
        mmWidth = 40481
        BandType = 4
      end
      object ppShape33: TppShape
        UserName = 'Shape33'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 0
        mmTop = 111895
        mmWidth = 40481
        BandType = 4
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Restricciones'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1323
        mmTop = 113242
        mmWidth = 16933
        BandType = 4
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Fecha de Inscripci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 74348
        mmWidth = 26194
        BandType = 4
      end
      object ppShape34: TppShape
        UserName = 'Shape34'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41010
        mmTop = 111919
        mmWidth = 83873
        BandType = 4
      end
      object ppShape35: TppShape
        UserName = 'Shape35'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5822
        mmLeft = 0
        mmTop = 100785
        mmWidth = 40481
        BandType = 4
      end
      object ppShape36: TppShape
        UserName = 'Shape36'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5822
        mmLeft = 41010
        mmTop = 100806
        mmWidth = 83873
        BandType = 4
      end
      object ppShape37: TppShape
        UserName = 'Shape37'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5822
        mmLeft = 0
        mmTop = 78565
        mmWidth = 40481
        BandType = 4
      end
      object ppShape38: TppShape
        UserName = 'Shape38'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41540
        mmTop = 78581
        mmWidth = 83874
        BandType = 4
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Apellido Paterno'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 12965
        mmWidth = 20902
        BandType = 4
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Apellido Materno'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 18521
        mmWidth = 21167
        BandType = 4
      end
      object ppLabel11: TppLabel
        UserName = 'Label101'
        Caption = 'Nombres'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 24077
        mmWidth = 11642
        BandType = 4
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Nombre del Padre'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 35454
        mmWidth = 23019
        BandType = 4
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Nombre de la Madre'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 41010
        mmWidth = 25665
        BandType = 4
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Fecha de Nacimiento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 91017
        mmWidth = 26723
        BandType = 4
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Estado Civil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 46567
        mmWidth = 15081
        BandType = 4
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Grado de Instrucci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1323
        mmTop = 107686
        mmWidth = 26458
        BandType = 4
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'Constancia de Votaci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 102129
        mmWidth = 29898
        BandType = 4
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'Fecha de Emisi'#243'n de Docum.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 79904
        mmWidth = 37306
        BandType = 4
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5555
        mmLeft = 41540
        mmTop = 794
        mmWidth = 83873
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'NUMLIB'
        DataPipeline = ppBDEReniec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEReniec'
        mmHeight = 3440
        mmLeft = 43127
        mmTop = 1852
        mmWidth = 79639
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'DNI'
        DataPipeline = ppBDEReniec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEReniec'
        mmHeight = 3440
        mmLeft = 43127
        mmTop = 7408
        mmWidth = 79639
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'APEPAT'
        DataPipeline = ppBDEReniec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEReniec'
        mmHeight = 3440
        mmLeft = 43127
        mmTop = 12965
        mmWidth = 79639
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'APEMAT'
        DataPipeline = ppBDEReniec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEReniec'
        mmHeight = 3440
        mmLeft = 43127
        mmTop = 18521
        mmWidth = 79639
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'NOMBRE'
        DataPipeline = ppBDEReniec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEReniec'
        mmHeight = 3440
        mmLeft = 43127
        mmTop = 24077
        mmWidth = 79639
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'LUGNAC'
        DataPipeline = ppBDEReniec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEReniec'
        mmHeight = 3440
        mmLeft = 42863
        mmTop = 96573
        mmWidth = 79639
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'NOMPAD'
        DataPipeline = ppBDEReniec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEReniec'
        mmHeight = 3440
        mmLeft = 43127
        mmTop = 35454
        mmWidth = 79639
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'NOMMAD'
        DataPipeline = ppBDEReniec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEReniec'
        mmHeight = 3439
        mmLeft = 43127
        mmTop = 41010
        mmWidth = 79639
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'FECNAC'
        DataPipeline = ppBDEReniec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEReniec'
        mmHeight = 3440
        mmLeft = 42863
        mmTop = 91017
        mmWidth = 79639
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'ESTATURA'
        DataPipeline = ppBDEReniec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEReniec'
        mmHeight = 3439
        mmLeft = 43127
        mmTop = 52123
        mmWidth = 79639
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'FECEMIDOC'
        DataPipeline = ppBDEReniec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEReniec'
        mmHeight = 3440
        mmLeft = 43127
        mmTop = 79904
        mmWidth = 79639
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'FECINS'
        DataPipeline = ppBDEReniec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEReniec'
        mmHeight = 3440
        mmLeft = 43127
        mmTop = 74348
        mmWidth = 79639
        BandType = 4
      end
      object ppFirma: TppImage
        UserName = 'Firma'
        MaintainAspectRatio = False
        Stretch = True
        Transparent = True
        mmHeight = 34925
        mmLeft = 124619
        mmTop = 61383
        mmWidth = 70644
        BandType = 4
      end
      object ppFoto: TppImage
        UserName = 'Foto'
        MaintainAspectRatio = False
        Stretch = True
        Transparent = True
        mmHeight = 51329
        mmLeft = 139436
        mmTop = 2646
        mmWidth = 35190
        BandType = 4
      end
      object ppLabel143: TppLabel
        UserName = 'Label143'
        Caption = 'Nombre de Casada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 29633
        mmWidth = 24606
        BandType = 4
      end
      object ppDBText29: TppDBText
        UserName = 'DBText29'
        DataField = 'APECAS'
        DataPipeline = ppBDEReniec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEReniec'
        mmHeight = 3440
        mmLeft = 43127
        mmTop = 29633
        mmWidth = 79639
        BandType = 4
      end
      object ppLabel144: TppLabel
        UserName = 'Label144'
        Caption = 'Tipo documento alterno'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 63236
        mmWidth = 29633
        BandType = 4
      end
      object ppDBText30: TppDBText
        UserName = 'DBText30'
        DataField = 'NUMDOCSUS'
        DataPipeline = ppBDEReniec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEReniec'
        mmHeight = 3440
        mmLeft = 43127
        mmTop = 68792
        mmWidth = 79639
        BandType = 4
      end
      object pplDocAltRepRen: TppLabel
        UserName = 'lDocAltRepRen'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3429
        mmLeft = 43127
        mmTop = 63236
        mmWidth = 79639
        BandType = 4
      end
      object ppShape68: TppShape
        UserName = 'Shape68'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5822
        mmLeft = 0
        mmTop = 84120
        mmWidth = 40480
        BandType = 4
      end
      object ppLabel146: TppLabel
        UserName = 'Label146'
        Caption = 'Fecha de Expiraci. de Docum.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 1058
        mmTop = 85461
        mmWidth = 38015
        BandType = 4
      end
      object ppDBText31: TppDBText
        UserName = 'DBText31'
        DataField = 'FECEXP'
        DataPipeline = ppBDEReniec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEReniec'
        mmHeight = 3440
        mmLeft = 43127
        mmTop = 85461
        mmWidth = 79639
        BandType = 4
      end
      object pplEstCivRepRen: TppLabel
        UserName = 'lDocAlt1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3429
        mmLeft = 43127
        mmTop = 46567
        mmWidth = 79639
        BandType = 4
      end
      object pplSexoRepRen: TppLabel
        UserName = 'lSexoRepRen'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3429
        mmLeft = 43127
        mmTop = 57415
        mmWidth = 79639
        BandType = 4
      end
      object pplEstVotRepRen: TppLabel
        UserName = 'lDocAltRepRen1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 42863
        mmTop = 102129
        mmWidth = 79639
        BandType = 4
      end
      object pplGraInsRepRen: TppLabel
        UserName = 'lGraInsRepRen'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 42863
        mmTop = 107686
        mmWidth = 79639
        BandType = 4
      end
      object pplResRepRen: TppLabel
        UserName = 'lGraInsRepRen1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 42863
        mmTop = 113242
        mmWidth = 79639
        BandType = 4
      end
      object ppShape72: TppShape
        UserName = 'Shape72'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 0
        mmTop = 117450
        mmWidth = 40481
        BandType = 4
      end
      object ppLabel145: TppLabel
        UserName = 'Label145'
        Caption = 'Domicilio - Ubigeo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 794
        mmTop = 118798
        mmWidth = 23029
        BandType = 4
      end
      object ppShape73: TppShape
        UserName = 'Shape73'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41010
        mmTop = 117475
        mmWidth = 83873
        BandType = 4
      end
      object pplLugDomRepRen: TppLabel
        UserName = 'lLugDomRepRen'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 42863
        mmTop = 118798
        mmWidth = 79639
        BandType = 4
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Domicilio - Prefijo Urbanizaci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 794
        mmTop = 124354
        mmWidth = 39412
        BandType = 4
      end
      object ppShape30: TppShape
        UserName = 'Shape20'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41010
        mmTop = 123031
        mmWidth = 83873
        BandType = 4
      end
      object pplPreUrbImpRen: TppLabel
        UserName = 'lLugDomRepRen1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 42863
        mmTop = 124354
        mmWidth = 79639
        BandType = 4
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'Domicilio - Desc. Urbanizaci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 794
        mmTop = 129911
        mmWidth = 38650
        BandType = 4
      end
      object pplDesUrbImpRen: TppLabel
        UserName = 'lDesUrbImpRen'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 42863
        mmTop = 129911
        mmWidth = 79639
        BandType = 4
      end
      object ppShape60: TppShape
        UserName = 'Shape60'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41275
        mmTop = 139700
        mmWidth = 83873
        BandType = 4
      end
      object ppShape61: TppShape
        UserName = 'Shape301'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 265
        mmTop = 139771
        mmWidth = 40481
        BandType = 4
      end
      object ppShape62: TppShape
        UserName = 'Shape62'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 265
        mmTop = 134191
        mmWidth = 40481
        BandType = 4
      end
      object ppLabel141: TppLabel
        UserName = 'Label141'
        Caption = 'Domicilio - Prefijo Direcci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 794
        mmTop = 135467
        mmWidth = 34756
        BandType = 4
      end
      object ppShape63: TppShape
        UserName = 'Shape202'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41275
        mmTop = 134144
        mmWidth = 83873
        BandType = 4
      end
      object pplPreDirImpRen: TppLabel
        UserName = 'lPreDirImpRen'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 42863
        mmTop = 135467
        mmWidth = 79639
        BandType = 4
      end
      object ppLabel147: TppLabel
        UserName = 'Label208'
        Caption = 'Domicilio - Desc. Direcci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 794
        mmTop = 141023
        mmWidth = 33994
        BandType = 4
      end
      object pplDesDirImpRen: TppLabel
        UserName = 'lDesUrbImpRen1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 42863
        mmTop = 141023
        mmWidth = 79639
        BandType = 4
      end
      object ppLabel142: TppLabel
        UserName = 'Label142'
        Caption = 'Domicilio - Etapa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 794
        mmTop = 152136
        mmWidth = 21431
        BandType = 4
      end
      object pplEtaDirImpRen: TppLabel
        UserName = 'lEtaDirImpRen'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 42333
        mmTop = 152665
        mmWidth = 79639
        BandType = 4
      end
      object ppLabel149: TppLabel
        UserName = 'Label149'
        Caption = 'Domicilio - Prefijo Bloque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 794
        mmTop = 157957
        mmWidth = 31750
        BandType = 4
      end
      object ppLabel150: TppLabel
        UserName = 'Label150'
        Caption = 'Domicilio - Descripci'#243'n Bloque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 794
        mmTop = 163513
        mmWidth = 38629
        BandType = 4
      end
      object pplPreBloImpRen: TppLabel
        UserName = 'lPreDirImpRen1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 42333
        mmTop = 158221
        mmWidth = 79639
        BandType = 4
      end
      object pplDesBloImpRen: TppLabel
        UserName = 'lDesBloImpRen'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 42333
        mmTop = 164042
        mmWidth = 79639
        BandType = 4
      end
      object ppShape80: TppShape
        UserName = 'Shape80'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41275
        mmTop = 173832
        mmWidth = 83873
        BandType = 4
      end
      object ppShape83: TppShape
        UserName = 'Shape83'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41275
        mmTop = 168275
        mmWidth = 83873
        BandType = 4
      end
      object ppShape84: TppShape
        UserName = 'Shape84'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 0
        mmTop = 167673
        mmWidth = 40481
        BandType = 4
      end
      object ppShape85: TppShape
        UserName = 'Shape85'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 0
        mmTop = 173254
        mmWidth = 40481
        BandType = 4
      end
      object ppLabel153: TppLabel
        UserName = 'Label153'
        Caption = 'Domicilio - Prefijo Interior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 794
        mmTop = 169069
        mmWidth = 31750
        BandType = 4
      end
      object ppLabel162: TppLabel
        UserName = 'Label1501'
        Caption = 'Domicilio - Descripci'#243'n Interior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 794
        mmTop = 174625
        mmWidth = 38629
        BandType = 4
      end
      object pplPreIntImpren: TppLabel
        UserName = 'lPreIntImpren'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 42333
        mmTop = 169598
        mmWidth = 79639
        BandType = 4
      end
      object pplDesIntImpRen: TppLabel
        UserName = 'lDesBloImpRen1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 42333
        mmTop = 175155
        mmWidth = 79639
        BandType = 4
      end
      object ppShape86: TppShape
        UserName = 'Shape603'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41275
        mmTop = 145521
        mmWidth = 83873
        BandType = 4
      end
      object ppShape87: TppShape
        UserName = 'Shape87'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 265
        mmTop = 145352
        mmWidth = 40481
        BandType = 4
      end
      object ppLabel163: TppLabel
        UserName = 'Label163'
        Caption = 'Domicilio - N'#250'mero Direcci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 794
        mmTop = 146579
        mmWidth = 36777
        BandType = 4
      end
      object pplNumDirImpRen: TppLabel
        UserName = 'lNumDirImpRen'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 42863
        mmTop = 146844
        mmWidth = 79639
        BandType = 4
      end
      object ppShape88: TppShape
        UserName = 'Shape801'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41804
        mmTop = 184415
        mmWidth = 83873
        BandType = 4
      end
      object ppShape89: TppShape
        UserName = 'Shape89'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41804
        mmTop = 178859
        mmWidth = 83873
        BandType = 4
      end
      object ppShape90: TppShape
        UserName = 'Shape90'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 0
        mmTop = 178859
        mmWidth = 40481
        BandType = 4
      end
      object ppShape91: TppShape
        UserName = 'Shape91'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 0
        mmTop = 184415
        mmWidth = 40481
        BandType = 4
      end
      object ppLabel164: TppLabel
        UserName = 'Label164'
        Caption = 'Domicilio - Manzana'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 794
        mmTop = 180182
        mmWidth = 25654
        BandType = 4
      end
      object ppLabel165: TppLabel
        UserName = 'Label165'
        Caption = 'Domicilio - Lote'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 794
        mmTop = 185738
        mmWidth = 19600
        BandType = 4
      end
      object pplManImpren: TppLabel
        UserName = 'lPreIntImpren1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 42333
        mmTop = 180182
        mmWidth = 79639
        BandType = 4
      end
      object pplLotImpren: TppLabel
        UserName = 'lLotImpren'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 42333
        mmTop = 185738
        mmWidth = 79639
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
  end
end
