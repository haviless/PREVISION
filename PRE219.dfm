object Fbeneficiarios: TFbeneficiarios
  Left = 226
  Top = 23
  BorderStyle = bsDialog
  Caption = 'Beneficiarios a reprogramar'
  ClientHeight = 637
  ClientWidth = 729
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
  object btnCerrar: TBitBtn
    Left = 645
    Top = 603
    Width = 80
    Height = 28
    Caption = 'Cerrar'
    TabOrder = 0
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
  object GroupBox1: TGroupBox
    Left = 3
    Top = 4
    Width = 722
    Height = 172
    Caption = ' Beneficiarios a reprogramar '
    TabOrder = 1
    object dbgbenrep: TwwDBGrid
      Left = 5
      Top = 16
      Width = 710
      Height = 116
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = DM1.dsDetCartas
      Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = False
      OnDblClick = dbgbenrepDblClick
      object dbgbInserta: TwwIButton
        Left = 0
        Top = 0
        Width = 28
        Height = 29
        AllowAllUp = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333FF33333333FF333993333333300033377F3333333777333993333333
          300033F77FFF3333377739999993333333333777777F3333333F399999933333
          33003777777333333377333993333333330033377F3333333377333993333333
          3333333773333333333F333333333333330033333333F33333773333333C3333
          330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
          993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
          333333333337733333FF3333333C333330003333333733333777333333333333
          3000333333333333377733333333333333333333333333333333}
        NumGlyphs = 2
        OnClick = dbgbInsertaClick
      end
    end
    object btnmostrarbeneficiario: TBitBtn
      Left = 633
      Top = 136
      Width = 80
      Height = 28
      Caption = '&Mostrar'
      TabOrder = 1
      OnClick = btnmostrarbeneficiarioClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
        333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
        C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
        F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
        F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
        00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
        3333333373FF7333333333333000333333333333377733333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
  end
  object TGroupBox
    Left = 3
    Top = 178
    Width = 722
    Height = 420
    TabOrder = 2
    object gbmanbeneficiarios: TGroupBox
      Left = 10
      Top = 10
      Width = 703
      Height = 369
      Caption = ' Ingresando nuevo beneficiario '
      TabOrder = 0
      Visible = False
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
      object dblcdforpagben: TwwDBLookupCombo
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
        OnExit = dblcdforpagbenExit
      end
      object dblcdbancoben: TwwDBLookupCombo
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
        OnChange = dblcdbancobenChange
        OnExit = dblcdbancobenExit
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
        TabOrder = 24
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
        TabOrder = 25
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
        object meapepattutben: TMaskEdit
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
        object meapemattutben: TMaskEdit
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
        object menomtutben: TMaskEdit
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
        object mednitutben: TMaskEdit
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
        TabOrder = 26
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
        TabOrder = 23
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
      object pnldirecciondesgna: TPanel
        Left = 8
        Top = 166
        Width = 688
        Height = 23
        TabOrder = 10
        object medireccionben: TMaskEdit
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
        object metelefonofijoben: TMaskEdit
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
        object memovilben: TMaskEdit
          Left = 1
          Top = 1
          Width = 157
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 9
          TabOrder = 0
          OnExit = memovilbenExit
          OnKeyPress = memovilbenKeyPress
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
      object dblcddistritoben: TwwDBLookupComboDlg
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
        OnExit = dblcddistritobenExit
      end
      object Panel2: TPanel
        Left = 53
        Top = 209
        Width = 148
        Height = 23
        Enabled = False
        TabOrder = 27
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
        TabOrder = 28
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
        TabOrder = 29
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
        object meotrtiprelben: TMaskEdit
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
        object meapecasben: TMaskEdit
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
        object medniben: TMaskEdit
          Left = 1
          Top = 1
          Width = 85
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 8
          TabOrder = 0
          OnKeyPress = mednibenKeyPress
        end
      end
      object pnlemaildes: TPanel
        Left = 343
        Top = 252
        Width = 244
        Height = 23
        TabOrder = 16
        object meemailben: TMaskEdit
          Left = 1
          Top = 1
          Width = 242
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 60
          TabOrder = 0
          OnExit = meemailbenExit
        end
      end
    end
    object btneditarbeneficiario: TBitBtn
      Left = 385
      Top = 386
      Width = 80
      Height = 28
      Caption = '&Editar'
      TabOrder = 1
      OnClick = btneditarbeneficiarioClick
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
    object btnretirarbeneficiario: TBitBtn
      Left = 468
      Top = 386
      Width = 80
      Height = 28
      Caption = '&Retirar'
      TabOrder = 2
      OnClick = btnretirarbeneficiarioClick
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
    object btnactualizarbeneficiario: TBitBtn
      Left = 551
      Top = 386
      Width = 80
      Height = 28
      Caption = 'Actualizar'
      TabOrder = 3
      OnClick = btnactualizarbeneficiarioClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
    end
    object btncancelar: TBitBtn
      Left = 634
      Top = 386
      Width = 80
      Height = 28
      Caption = 'Cancelar'
      TabOrder = 4
      OnClick = btncancelarClick
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
