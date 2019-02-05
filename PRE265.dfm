object Fingdeucar: TFingdeucar
  Left = 224
  Top = 173
  BorderStyle = bsDialog
  Caption = 'Datos del designatario'
  ClientHeight = 427
  ClientWidth = 724
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
  object Label17: TLabel
    Left = 343
    Top = 233
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
  object GroupBox1: TGroupBox
    Left = 3
    Top = 3
    Width = 711
    Height = 375
    Caption = ' Ingresando Nuevo Designatario '
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
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
      Left = 210
      Top = 16
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
    object Label3: TLabel
      Left = 8
      Top = 59
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
    object Label4: TLabel
      Left = 216
      Top = 59
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
    object Label5: TLabel
      Left = 8
      Top = 107
      Width = 110
      Height = 15
      Caption = 'Fecha de Nacimiento:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 8
      Top = 323
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
    object Label7: TLabel
      Left = 392
      Top = 107
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
    object lblbanco: TLabel
      Left = 218
      Top = 323
      Width = 34
      Height = 15
      Caption = 'Banco:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 135
      Top = 107
      Width = 69
      Height = 15
      Caption = 'D.N.I.: / L.E.:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 235
      Top = 107
      Width = 30
      Height = 15
      Caption = 'Sexo:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object lblagegir: TLabel
      Left = 426
      Top = 323
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
    object Label13: TLabel
      Left = 8
      Top = 278
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
      Left = 206
      Top = 278
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
      Left = 404
      Top = 278
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
    object Label10: TLabel
      Left = 602
      Top = 278
      Width = 75
      Height = 15
      Caption = 'DNI del Tutor:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 8
      Top = 147
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
    object Label19: TLabel
      Left = 8
      Top = 234
      Width = 72
      Height = 15
      Caption = 'Telefono Fijo:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label20: TLabel
      Left = 175
      Top = 234
      Width = 32
      Height = 15
      Caption = 'Movil:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label21: TLabel
      Left = 8
      Top = 192
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
      Left = 205
      Top = 192
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
      Left = 455
      Top = 192
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
    object Label12: TLabel
      Left = 403
      Top = 59
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
    object Label16: TLabel
      Left = 413
      Top = 16
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
    object Label24: TLabel
      Left = 351
      Top = 234
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
    object dblctiprel: TwwDBLookupCombo
      Left = 215
      Top = 78
      Width = 50
      Height = 21
      CharCase = ecUpperCase
      DropDownAlignment = taLeftJustify
      LookupTable = DM1.cdsTRelacion
      LookupField = 'PARENID'
      MaxLength = 2
      TabOrder = 4
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnChange = dblctiprelChange
      OnExit = dblctiprelExit
    end
    object dbdtpfecnac: TwwDBDateTimePicker
      Left = 7
      Top = 126
      Width = 105
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 6
      OnExit = dbdtpfecnacExit
    end
    object dblcidesex: TwwDBLookupCombo
      Left = 235
      Top = 126
      Width = 50
      Height = 21
      CharCase = ecUpperCase
      DropDownAlignment = taLeftJustify
      LookupTable = DM1.cdsSexo
      LookupField = 'ID'
      MaxLength = 1
      TabOrder = 8
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnChange = dblcidesexChange
    end
    object dblcforpag: TwwDBLookupCombo
      Left = 7
      Top = 341
      Width = 50
      Height = 21
      CharCase = ecUpperCase
      DropDownAlignment = taLeftJustify
      LookupTable = DM1.cdsFPago
      LookupField = 'TIPDESEID'
      MaxLength = 2
      TabOrder = 21
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnChange = dblcforpagChange
      OnExit = dblcforpagExit
    end
    object dblcBanco: TwwDBLookupCombo
      Left = 218
      Top = 341
      Width = 50
      Height = 21
      CharCase = ecUpperCase
      DropDownAlignment = taLeftJustify
      LookupTable = DM1.cdsBanco
      LookupField = 'BANCOID'
      MaxLength = 2
      TabOrder = 22
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnChange = dblcBancoChange
      OnExit = dblcBancoExit
    end
    object dblcagegir: TwwDBLookupComboDlg
      Left = 426
      Top = 341
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
      TabOrder = 23
      Visible = False
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnChange = dblcagegirChange
      OnExit = dblcagegirExit
    end
    object pnlapepatben: TPanel
      Left = 8
      Top = 33
      Width = 195
      Height = 23
      TabOrder = 0
      object meapepatben: TMaskEdit
        Left = 1
        Top = 1
        Width = 192
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 30
        TabOrder = 0
      end
    end
    object pnlapematben: TPanel
      Left = 210
      Top = 33
      Width = 195
      Height = 23
      TabOrder = 1
      object meapematben: TMaskEdit
        Left = 1
        Top = 1
        Width = 192
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 30
        TabOrder = 0
      end
    end
    object pnlapenomben: TPanel
      Left = 8
      Top = 78
      Width = 195
      Height = 23
      TabOrder = 3
      object meapenomben: TMaskEdit
        Left = 1
        Top = 1
        Width = 192
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 30
        TabOrder = 0
      end
    end
    object pnldestiprel: TPanel
      Left = 270
      Top = 78
      Width = 123
      Height = 23
      TabOrder = 26
      object medestiprel: TMaskEdit
        Left = 1
        Top = 1
        Width = 121
        Height = 21
        CharCase = ecUpperCase
        Color = 15132390
        Enabled = False
        MaxLength = 30
        TabOrder = 0
      end
    end
    object pnldessex: TPanel
      Left = 293
      Top = 126
      Width = 88
      Height = 23
      TabOrder = 27
      object medessex: TMaskEdit
        Left = 1
        Top = 1
        Width = 86
        Height = 21
        CharCase = ecUpperCase
        Color = 15132390
        Enabled = False
        MaxLength = 30
        TabOrder = 0
      end
    end
    object pnlpor: TPanel
      Left = 392
      Top = 126
      Width = 61
      Height = 23
      TabOrder = 9
      object mepor: TMaskEdit
        Left = 1
        Top = 1
        Width = 59
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 30
        TabOrder = 0
        OnExit = meporExit
      end
    end
    object pnlapepattut: TPanel
      Left = 8
      Top = 297
      Width = 194
      Height = 23
      TabOrder = 17
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
      Left = 206
      Top = 297
      Width = 194
      Height = 23
      TabOrder = 18
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
      Left = 404
      Top = 297
      Width = 194
      Height = 23
      TabOrder = 19
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
    object pnldnitut: TPanel
      Left = 602
      Top = 297
      Width = 88
      Height = 23
      TabOrder = 20
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
    object pnlforpagodes: TPanel
      Left = 64
      Top = 341
      Width = 151
      Height = 23
      TabOrder = 28
      object meforpagodes: TMaskEdit
        Left = 1
        Top = 1
        Width = 148
        Height = 21
        CharCase = ecUpperCase
        Color = 15132390
        Enabled = False
        MaxLength = 30
        TabOrder = 0
      end
    end
    object pnldesban: TPanel
      Left = 272
      Top = 341
      Width = 151
      Height = 23
      TabOrder = 24
      object medesban: TMaskEdit
        Left = 1
        Top = 1
        Width = 148
        Height = 21
        CharCase = ecUpperCase
        Color = 15132390
        Enabled = False
        MaxLength = 30
        TabOrder = 0
      end
    end
    object pnlagegir: TPanel
      Left = 512
      Top = 341
      Width = 190
      Height = 23
      TabOrder = 25
      Visible = False
      object meagegir: TMaskEdit
        Left = 1
        Top = 1
        Width = 188
        Height = 21
        CharCase = ecUpperCase
        Color = 15132390
        Enabled = False
        MaxLength = 30
        TabOrder = 0
      end
    end
    object pnldirecciondesgna: TPanel
      Left = 8
      Top = 166
      Width = 688
      Height = 23
      TabOrder = 10
      object medirecciondesgna: TMaskEdit
        Left = 1
        Top = 1
        Width = 686
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 250
        TabOrder = 0
      end
    end
    object pnltelefonofijo: TPanel
      Left = 9
      Top = 253
      Width = 160
      Height = 23
      TabOrder = 14
      object metelefonofijo: TMaskEdit
        Left = 1
        Top = 1
        Width = 157
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 15
        TabOrder = 0
      end
    end
    object pnlmovil: TPanel
      Left = 175
      Top = 252
      Width = 160
      Height = 23
      TabOrder = 15
      object memovil: TMaskEdit
        Left = 1
        Top = 1
        Width = 157
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 9
        TabOrder = 0
        OnExit = memovilExit
        OnKeyPress = memovilKeyPress
      end
    end
    object dblcddptoid: TwwDBLookupComboDlg
      Left = 8
      Top = 209
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
      TabOrder = 11
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnChange = dblcddptoidChange
      OnExit = dblcddptoidExit
    end
    object dblcdProvincia: TwwDBLookupComboDlg
      Left = 205
      Top = 209
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
      TabOrder = 12
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnChange = dblcdProvinciaChange
      OnExit = dblcdProvinciaExit
    end
    object dblcdDistrito: TwwDBLookupComboDlg
      Left = 455
      Top = 209
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
      TabOrder = 13
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnExit = dblcdDistritoExit
    end
    object Panel2: TPanel
      Left = 53
      Top = 209
      Width = 148
      Height = 23
      Enabled = False
      TabOrder = 29
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
    object Panel1: TPanel
      Left = 525
      Top = 209
      Width = 174
      Height = 23
      Enabled = False
      TabOrder = 30
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
    object Panel3: TPanel
      Left = 260
      Top = 209
      Width = 192
      Height = 23
      Enabled = False
      TabOrder = 31
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
    object pnldsgotrtiprel: TPanel
      Left = 403
      Top = 78
      Width = 149
      Height = 23
      TabOrder = 5
      object medsgotrtiprel: TMaskEdit
        Left = 1
        Top = 1
        Width = 147
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 15
        TabOrder = 0
      end
    end
    object pnlapecasben: TPanel
      Left = 413
      Top = 33
      Width = 195
      Height = 23
      TabOrder = 2
      object medsgapecas: TMaskEdit
        Left = 1
        Top = 1
        Width = 192
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 30
        TabOrder = 0
      end
    end
    object pnldni: TPanel
      Left = 135
      Top = 126
      Width = 88
      Height = 23
      TabOrder = 7
      object medni: TMaskEdit
        Left = 1
        Top = 1
        Width = 86
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 8
        TabOrder = 0
      end
    end
    object pnlemaildes: TPanel
      Left = 343
      Top = 252
      Width = 244
      Height = 23
      TabOrder = 16
      object meemaildes: TMaskEdit
        Left = 1
        Top = 1
        Width = 242
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 60
        TabOrder = 0
        OnExit = meemaildesExit
      end
    end
  end
  object btnAdicionar: TBitBtn
    Left = 554
    Top = 385
    Width = 75
    Height = 32
    Caption = 'Actualizar'
    TabOrder = 1
    OnClick = btnAdicionarClick
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
  object btnCerrar: TBitBtn
    Left = 640
    Top = 384
    Width = 75
    Height = 32
    Caption = 'Cerrar'
    TabOrder = 2
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
end
