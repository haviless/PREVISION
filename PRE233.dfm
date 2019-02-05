object FNueExpben: TFNueExpben
  Left = 308
  Top = 13
  BorderStyle = bsDialog
  Caption = 'Ingreso de Nuevo Expediente de Beneficio'
  ClientHeight = 645
  ClientWidth = 809
  Color = 13165023
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 9
    Top = 171
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
    Left = 102
    Top = 189
    Width = 23
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
  object Label3: TLabel
    Left = 265
    Top = 171
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
    Left = 8
    Top = 278
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
    Left = 258
    Top = 278
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
    Left = 512
    Top = 278
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
  object Label7: TLabel
    Left = 134
    Top = 171
    Width = 47
    Height = 15
    Caption = 'Doc. Ide.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 9
    Top = 235
    Width = 119
    Height = 15
    Caption = 'Direcci'#243'n domiciliaria:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 458
    Top = 235
    Width = 172
    Height = 15
    Caption = 'Distrito/Provincia/Departamento'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 8
    Top = 319
    Width = 91
    Height = 15
    Caption = 'Centro Educativo:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label11: TLabel
    Left = 8
    Top = 361
    Width = 163
    Height = 15
    Caption = 'Direcci'#243'n del Centro Educativo:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label12: TLabel
    Left = 407
    Top = 361
    Width = 172
    Height = 15
    Caption = 'Distrito/Provincia/Departamento'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 344
    Top = 235
    Width = 52
    Height = 15
    Caption = 'Telefono :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label19: TLabel
    Left = 405
    Top = 319
    Width = 100
    Height = 15
    Caption = 'R'#233'gimen de Pensi'#243'n'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 261
    Top = 189
    Width = 366
    Height = 21
    Color = 13165023
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    object meAsoApeNomDni: TMaskEdit
      Left = 1
      Top = 1
      Width = 364
      Height = 19
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 130
    Top = 189
    Width = 127
    Height = 21
    Color = 13165023
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    object meAsoDocNum: TMaskEdit
      Left = 1
      Top = 1
      Width = 125
      Height = 19
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 7
    Top = 295
    Width = 249
    Height = 21
    Color = 13165023
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    object meUsenom: TMaskEdit
      Left = 41
      Top = 1
      Width = 206
      Height = 19
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object meUseid: TMaskEdit
      Left = 1
      Top = 1
      Width = 40
      Height = 19
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  object pnlasocodmod: TPanel
    Left = 7
    Top = 189
    Width = 92
    Height = 21
    Color = 13165023
    TabOrder = 4
    object meAsocodmod: TMaskEdit
      Tag = 6
      Left = 1
      Top = 1
      Width = 89
      Height = 19
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 0
      OnChange = meAsocodmodChange
      OnKeyPress = meAsocodmodKeyPress
    end
  end
  object Panel4: TPanel
    Left = 258
    Top = 295
    Width = 251
    Height = 21
    Color = 13165023
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    object meUpagonom: TMaskEdit
      Left = 42
      Top = 1
      Width = 208
      Height = 19
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object meUpagoid: TMaskEdit
      Left = 1
      Top = 1
      Width = 40
      Height = 19
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  object Panel5: TPanel
    Left = 512
    Top = 295
    Width = 259
    Height = 21
    Color = 13165023
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    object meUpronom: TMaskEdit
      Left = 41
      Top = 1
      Width = 216
      Height = 19
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object meUproid: TMaskEdit
      Left = 1
      Top = 1
      Width = 40
      Height = 19
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  object Panel7: TPanel
    Left = 7
    Top = 253
    Width = 331
    Height = 21
    Color = 13165023
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    object meAsodir: TMaskEdit
      Left = 1
      Top = 1
      Width = 329
      Height = 19
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  object Panel8: TPanel
    Left = 455
    Top = 253
    Width = 321
    Height = 21
    Color = 13165023
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
    object meAsozipdes: TMaskEdit
      Left = 1
      Top = 1
      Width = 319
      Height = 19
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  object Panel9: TPanel
    Left = 7
    Top = 337
    Width = 394
    Height = 21
    Color = 13165023
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 13
    object meAsodeslab: TMaskEdit
      Left = 1
      Top = 1
      Width = 391
      Height = 19
      AutoSize = False
      TabOrder = 0
    end
  end
  object Panel10: TPanel
    Left = 7
    Top = 378
    Width = 394
    Height = 21
    Color = 13165023
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 14
    object meAsodirlab: TMaskEdit
      Left = 1
      Top = 1
      Width = 391
      Height = 19
      AutoSize = False
      TabOrder = 0
    end
  end
  object Panel11: TPanel
    Left = 404
    Top = 378
    Width = 365
    Height = 21
    Color = 13165023
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 15
    object meAsozipdeslab: TMaskEdit
      Left = 1
      Top = 1
      Width = 363
      Height = 19
      AutoSize = False
      TabOrder = 0
    end
  end
  object pgmulti: TPageControl
    Left = 7
    Top = 411
    Width = 632
    Height = 190
    ActivePage = TabSheet1
    TabOrder = 5
    object tsforpag: TTabSheet
      Caption = 'Forma de Pago'
      object rgCobAso: TRadioGroup
        Left = 3
        Top = 12
        Width = 90
        Height = 51
        Caption = ' Cobra asociado '
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Si'
          'No')
        TabOrder = 0
        OnClick = rgCobAsoClick
      end
      object gbforpag: TGroupBox
        Left = 96
        Top = 0
        Width = 465
        Height = 113
        TabOrder = 1
        object lblforpag: TLabel
          Left = 5
          Top = 20
          Width = 73
          Height = 15
          Caption = 'Forma de Pago'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object lblbanco: TLabel
          Left = 5
          Top = 43
          Width = 31
          Height = 15
          Caption = 'Banco'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object lblagegir: TLabel
          Left = 5
          Top = 91
          Width = 82
          Height = 15
          Caption = 'Agencia a Girar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object lblasoncta: TLabel
          Left = 5
          Top = 66
          Width = 93
          Height = 15
          Caption = 'N'#250'mero de Cuenta'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object lbldospun04: TLabel
          Left = 104
          Top = 67
          Width = 3
          Height = 13
          Caption = ':'
          Visible = False
        end
        object lbldospun03: TLabel
          Left = 104
          Top = 91
          Width = 3
          Height = 13
          Caption = ':'
          Visible = False
        end
        object lbldospun02: TLabel
          Left = 104
          Top = 43
          Width = 3
          Height = 13
          Caption = ':'
        end
        object lbldospun01: TLabel
          Left = 104
          Top = 20
          Width = 3
          Height = 13
          Caption = ':'
        end
        object dblcforpag: TwwDBLookupCombo
          Left = 111
          Top = 17
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
          OnExit = dblcforpagExit
        end
        object dblcBanco: TwwDBLookupCombo
          Left = 111
          Top = 40
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
        object dblcagegir: TwwDBLookupComboDlg
          Left = 111
          Top = 88
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
          TabOrder = 2
          Visible = False
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          OnChange = dblcagegirChange
          OnExit = dblcagegirExit
        end
        object pnlforpag: TPanel
          Left = 196
          Top = 16
          Width = 263
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
          object meforpagodes: TMaskEdit
            Left = 1
            Top = 1
            Width = 261
            Height = 19
            AutoSize = False
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
        object pnlbanco: TPanel
          Left = 196
          Top = 39
          Width = 263
          Height = 21
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
            Height = 19
            AutoSize = False
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
          Left = 196
          Top = 87
          Width = 263
          Height = 21
          Color = 13165023
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          Visible = False
          object meagengir: TMaskEdit
            Left = 1
            Top = 1
            Width = 261
            Height = 19
            AutoSize = False
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
        object pnlasoncta: TPanel
          Left = 196
          Top = 63
          Width = 142
          Height = 21
          Color = 13165023
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          Visible = False
          object meAsoncta: TMaskEdit
            Left = 1
            Top = 1
            Width = 140
            Height = 19
            AutoSize = False
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
      end
    end
    object tsresoluciones: TTabSheet
      Caption = 'Resoluciones'
      ImageIndex = 1
      object GroupBox2: TGroupBox
        Left = 2
        Top = 4
        Width = 347
        Height = 102
        Caption = ' Resoluciones '
        TabOrder = 0
        object Label18: TLabel
          Left = 26
          Top = 35
          Width = 74
          Height = 13
          Caption = 'Nombramiento :'
        end
        object Label22: TLabel
          Left = 26
          Top = 67
          Width = 30
          Height = 13
          Caption = 'Cese :'
        end
        object Label23: TLabel
          Left = 118
          Top = 16
          Width = 37
          Height = 13
          Caption = 'N'#250'mero'
        end
        object Label24: TLabel
          Left = 233
          Top = 16
          Width = 30
          Height = 13
          Caption = 'Fecha'
        end
        object dbdtpfecces: TwwDBDateTimePicker
          Tag = 3
          Left = 233
          Top = 67
          Width = 87
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          Epoch = 1950
          ShowButton = True
          TabOrder = 1
          OnExit = dbdtpfeccesExit
        end
        object pnlnumresnom: TPanel
          Left = 118
          Top = 33
          Width = 83
          Height = 21
          Enabled = False
          TabOrder = 2
          object menumresnom: TMaskEdit
            Left = 1
            Top = 1
            Width = 81
            Height = 19
            AutoSize = False
            TabOrder = 0
          end
        end
        object pnlfecresnom: TPanel
          Left = 233
          Top = 33
          Width = 83
          Height = 21
          Enabled = False
          TabOrder = 3
          object mefecresnom: TMaskEdit
            Left = 1
            Top = 1
            Width = 81
            Height = 19
            AutoSize = False
            TabOrder = 0
          end
        end
        object pnlnumresces: TPanel
          Left = 118
          Top = 65
          Width = 83
          Height = 21
          TabOrder = 0
          object menumresces: TMaskEdit
            Left = 1
            Top = 1
            Width = 81
            Height = 19
            AutoSize = False
            TabOrder = 0
          end
        end
      end
    end
    object tsdatper: TTabSheet
      Caption = 'Datos de los aportes'
      ImageIndex = 2
      object Label13: TLabel
        Left = 8
        Top = 36
        Width = 75
        Height = 15
        Caption = 'Ultimo aporte :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 93
        Top = 16
        Width = 20
        Height = 15
        Caption = 'A'#241'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 148
        Top = 16
        Width = 21
        Height = 15
        Caption = 'Mes'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object meanoultapo: TMaskEdit
        Left = 88
        Top = 34
        Width = 43
        Height = 21
        CharCase = ecUpperCase
        EditMask = '9999;1;_'
        MaxLength = 4
        TabOrder = 0
        Text = '    '
      end
      object memesultapo: TMaskEdit
        Left = 144
        Top = 34
        Width = 29
        Height = 21
        EditMask = '99;1;_'
        MaxLength = 2
        TabOrder = 1
        Text = '  '
      end
    end
    object TabSheet1: TTabSheet
      Caption = ' Datos del Solicitante'
      ImageIndex = 3
      object Label27: TLabel
        Left = 6
        Top = 4
        Width = 89
        Height = 13
        Caption = 'DNI del solicitante:'
      end
      object Label28: TLabel
        Left = 6
        Top = 27
        Width = 97
        Height = 13
        Caption = 'Apellido y nombre(s):'
      end
      object Label29: TLabel
        Left = 6
        Top = 47
        Width = 57
        Height = 13
        Caption = 'Parentesco:'
      end
      object Label21: TLabel
        Left = 6
        Top = 68
        Width = 48
        Height = 13
        Caption = 'Direcci'#243'n:'
      end
      object Label25: TLabel
        Left = 6
        Top = 142
        Width = 34
        Height = 13
        Caption = 'Correo:'
      end
      object Label26: TLabel
        Left = 288
        Top = 47
        Width = 45
        Height = 13
        Caption = 'Tel'#233'fono:'
      end
      object Label34: TLabel
        Left = 316
        Top = 91
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
      object Label30: TLabel
        Left = 6
        Top = 92
        Width = 70
        Height = 13
        Caption = 'Departamento:'
      end
      object Label35: TLabel
        Left = 6
        Top = 114
        Width = 43
        Height = 15
        Caption = 'Distrito:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object meDNIsol: TMaskEdit
        Left = 112
        Top = 2
        Width = 60
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 8
        TabOrder = 0
        OnExit = meDNIsolExit
      end
      object meapenomsol: TMaskEdit
        Left = 112
        Top = 23
        Width = 365
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 90
        TabOrder = 1
      end
      object mevinparentesco: TMaskEdit
        Left = 112
        Top = 44
        Width = 166
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 25
        TabOrder = 2
      end
      object medirsol: TMaskEdit
        Left = 112
        Top = 65
        Width = 448
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 250
        TabOrder = 4
      end
      object meemailsol: TMaskEdit
        Left = 112
        Top = 138
        Width = 365
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 60
        TabOrder = 8
        OnExit = meemailsolExit
      end
      object metelsol: TMaskEdit
        Left = 345
        Top = 44
        Width = 132
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 25
        TabOrder = 3
      end
      object dblcddptoidsol: TwwDBLookupComboDlg
        Left = 112
        Top = 88
        Width = 41
        Height = 21
        CharCase = ecUpperCase
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Lookup'
        MaxWidth = 0
        MaxHeight = 209
        LookupTable = DM1.cdsDpto1
        LookupField = 'DPTOID'
        MaxLength = 2
        TabOrder = 5
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnChange = dblcddptoidsolChange
        OnExit = dblcddptoidsolExit
      end
      object Panel17: TPanel
        Left = 156
        Top = 88
        Width = 153
        Height = 21
        Enabled = False
        TabOrder = 9
        object medptosol: TMaskEdit
          Left = 1
          Top = 1
          Width = 151
          Height = 21
          CharCase = ecUpperCase
          Color = 15132390
          Enabled = False
          TabOrder = 0
        end
      end
      object dblcdProvinciasol: TwwDBLookupComboDlg
        Left = 373
        Top = 88
        Width = 50
        Height = 21
        CharCase = ecUpperCase
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Lookup'
        MaxWidth = 0
        MaxHeight = 209
        LookupTable = DM1.cdsProvincia1
        LookupField = 'CIUDID'
        Color = clWhite
        MaxLength = 4
        TabOrder = 6
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnChange = dblcdProvinciasolChange
        OnExit = dblcdProvinciasolExit
      end
      object Panel18: TPanel
        Left = 424
        Top = 88
        Width = 192
        Height = 21
        Enabled = False
        TabOrder = 10
        object meprovinciasol: TMaskEdit
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
      object dblcddistritosol: TwwDBLookupComboDlg
        Left = 112
        Top = 111
        Width = 66
        Height = 21
        CharCase = ecUpperCase
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Lookup'
        MaxWidth = 0
        MaxHeight = 209
        LookupTable = DM1.cdsDist2
        LookupField = 'ZIPID'
        Color = clWhite
        MaxLength = 6
        TabOrder = 7
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnExit = dblcddistritosolExit
      end
      object Panel19: TPanel
        Left = 184
        Top = 112
        Width = 218
        Height = 21
        Enabled = False
        TabOrder = 11
        object medistritosol: TMaskEdit
          Left = 1
          Top = 1
          Width = 215
          Height = 21
          CharCase = ecUpperCase
          Color = 15132390
          Enabled = False
          TabOrder = 0
        end
      end
    end
  end
  object gborigen: TGroupBox
    Left = 5
    Top = 96
    Width = 351
    Height = 64
    Caption = ' Origen del Expediente: '
    TabOrder = 2
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
      OnChange = dblcdptoidChange
      OnExit = dblcdptoidExit
    end
    object dblccodofi: TwwDBLookupCombo
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
      OnChange = dblccodofiChange
      OnExit = dblccodofiExit
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
      object meofides: TMaskEdit
        Left = 1
        Top = 1
        Width = 198
        Height = 19
        AutoSize = False
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
      object medptodes: TMaskEdit
        Left = 1
        Top = 1
        Width = 198
        Height = 19
        AutoSize = False
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
  object btngrasol: TBitBtn
    Left = 393
    Top = 607
    Width = 75
    Height = 30
    Caption = 'Grabar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 16
    OnClick = btngrasolClick
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
    Left = 543
    Top = 607
    Width = 73
    Height = 30
    Caption = 'Cerrar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Century Gothic'
    Font.Style = []
    ParentFont = False
    TabOrder = 17
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
  object btncreditos: TBitBtn
    Left = 88
    Top = 607
    Width = 72
    Height = 30
    Caption = 'Cr'#233'ditos'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 18
    OnClick = btncreditosClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
      73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
      0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
      0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
      0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
      0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
      0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
      0333337F777777737F333308888888880333337F333333337F33330888888888
      03333373FFFFFFFF733333700000000073333337777777773333}
    NumGlyphs = 2
  end
  object btnaportes: TBitBtn
    Left = 164
    Top = 607
    Width = 72
    Height = 30
    Caption = 'Aportes'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 19
    OnClick = btnaportesClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
      55555575555555775F55509999999901055557F55555557F75F5001111111101
      105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
      01105777F555557F75F75500FFFFFF0FF0105577F555FF7F57575550FF700008
      8F0055575FF7777555775555000888888F005555777FFFFFFF77555550000000
      0F055555577777777F7F555550FFFFFF0F05555557F5FFF57F7F555550F000FF
      0005555557F777557775555550FFFFFF0555555557F555FF7F55555550FF7000
      05555555575FF777755555555500055555555555557775555555}
    NumGlyphs = 2
  end
  object pnlobservacion: TPanel
    Left = 643
    Top = 420
    Width = 159
    Height = 180
    Color = clMoneyGreen
    TabOrder = 20
    Visible = False
    object StaticText1: TStaticText
      Left = 1
      Top = 1
      Width = 157
      Height = 24
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = 'Observaciones'
      Color = clTeal
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 0
    end
    object redit: TRichEdit
      Left = 5
      Top = 30
      Width = 148
      Height = 144
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  object gbtipben: TGroupBox
    Left = 360
    Top = 7
    Width = 265
    Height = 135
    Caption = ' Tipo de Beneficio: '
    TabOrder = 3
    object Label17: TLabel
      Left = 5
      Top = 18
      Width = 57
      Height = 15
      Caption = 'Beneficio :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object lblfacinv: TLabel
      Left = 5
      Top = 44
      Width = 119
      Height = 15
      Caption = 'Fecha de fallecimiento:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object pnltipobeneficio: TPanel
      Left = 120
      Top = 14
      Width = 119
      Height = 21
      Color = 13165023
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      object metipbenef: TMaskEdit
        Left = 1
        Top = 1
        Width = 117
        Height = 19
        AutoSize = False
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
    object dbdtpfacinv: TwwDBDateTimePicker
      Tag = 1
      Left = 129
      Top = 41
      Width = 81
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ShowButton = True
      TabOrder = 2
      Visible = False
      OnExit = dbdtpfacinvExit
    end
    object dbltipbenef: TwwDBLookupCombo
      Left = 70
      Top = 15
      Width = 46
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TIPBENEF'#9'2'#9'C'#243'digo de~Beneficio'#9#9
        'BENEFDES'#9'20'#9'Tipo de~Beneficio'#9#9)
      LookupTable = DM1.cdsTipBenef
      LookupField = 'TIPBENEF'
      ParentFont = False
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnChange = dbltipbenefChange
      OnExit = dbltipbenefExit
    end
    object rgtipret: TRadioGroup
      Left = 69
      Top = 38
      Width = 180
      Height = 45
      Caption = ' Tipo de retiro:'
      ItemIndex = 0
      Items.Strings = (
        'Por Cese'
        'Por Invalidez Temporal-Parcial')
      TabOrder = 1
    end
    object gbCausaCese: TGroupBox
      Left = 6
      Top = 85
      Width = 252
      Height = 44
      Caption = ' Causa de Cese'
      TabOrder = 3
      object btnbuscacausa: TButton
        Left = 6
        Top = 16
        Width = 23
        Height = 23
        Caption = '...'
        TabOrder = 0
        OnClick = btnbuscacausaClick
      end
      object mebuscacausa: TMaskEdit
        Left = 32
        Top = 16
        Width = 214
        Height = 21
        TabOrder = 1
        OnExit = mebuscacausaExit
      end
    end
  end
  object pnlalerta: TPanel
    Left = 479
    Top = 153
    Width = 145
    Height = 23
    Color = 13165023
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 21
    object mealterta: TMaskEdit
      Left = 1
      Top = 1
      Width = 143
      Height = 21
      AutoSelect = False
      AutoSize = False
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Text = 'ASOCIADO CESANTE'
    end
  end
  object Panel6: TPanel
    Left = 342
    Top = 253
    Width = 109
    Height = 21
    Color = 13165023
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 22
    object measotelef: TMaskEdit
      Left = 1
      Top = 1
      Width = 107
      Height = 19
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  object btnfotfir: TBitBtn
    Left = 7
    Top = 607
    Width = 77
    Height = 30
    Caption = 'Foto/firma'
    TabOrder = 23
    OnClick = btnfotfirClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033BBBBBBBBBB
      BB33337777777777777F33BB00BBBBBBBB33337F77333333F37F33BB0BBBBBB0
      BB33337F73F33337FF7F33BBB0BBBB000B33337F37FF3377737F33BBB00BB00B
      BB33337F377F3773337F33BBBB0B00BBBB33337F337F7733337F33BBBB000BBB
      BB33337F33777F33337F33EEEE000EEEEE33337F3F777FFF337F33EE0E80000E
      EE33337F73F77773337F33EEE0800EEEEE33337F37377F33337F33EEEE000EEE
      EE33337F33777F33337F33EEEEE00EEEEE33337F33377FF3337F33EEEEEE00EE
      EE33337F333377F3337F33EEEEEE00EEEE33337F33337733337F33EEEEEEEEEE
      EE33337FFFFFFFFFFF7F33EEEEEEEEEEEE333377777777777773}
    NumGlyphs = 2
  end
  object gbfotoreniec: TGroupBox
    Left = 633
    Top = 8
    Width = 151
    Height = 187
    Align = alCustom
    BiDiMode = bdLeftToRight
    Caption = 'Foto y Firma (RENIEC)'
    ParentBiDiMode = False
    TabOrder = 24
    OnDblClick = gbfotoreniecClick
    object ImgFotoConfirme: TImage
      Left = 22
      Top = 15
      Width = 106
      Height = 120
      Stretch = True
      OnDblClick = gbfotoreniecClick
    end
    object ImgFirmaConfirme: TImage
      Left = 4
      Top = 139
      Width = 142
      Height = 42
      Stretch = True
      OnDblClick = gbfotoreniecClick
    end
  end
  object btnfonsol: TBitBtn
    Left = 240
    Top = 607
    Width = 67
    Height = 30
    Caption = 'FSC'
    TabOrder = 25
    OnClick = btnfonsolClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333333333333333333FFFFFFFFFFF33330000000000
      03333377777777777F33333003333330033333377FF333377F33333300333333
      0333333377FF33337F3333333003333303333333377FF3337333333333003333
      333333333377FF3333333333333003333333333333377FF33333333333330033
      3333333333337733333333333330033333333333333773333333333333003333
      33333333337733333F3333333003333303333333377333337F33333300333333
      03333333773333337F33333003333330033333377FFFFFF77F33330000000000
      0333337777777777733333333333333333333333333333333333}
    NumGlyphs = 2
  end
  object btnDesApo: TBitBtn
    Left = 311
    Top = 607
    Width = 78
    Height = 30
    Caption = 'Desc. Apo.'
    TabOrder = 26
    OnClick = btnDesApoClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333FFFFF3333333333000003333333333F777773FF333333008877700
      33333337733FFF773F33330887000777033333733F777FFF73F3308800000007
      703337F37777777FF7F33080000000007033373777777777F73F087000111000
      77037F3777333777FF7F08000111110007037F777F3333777F7F0F0001111100
      07037F777F3333777F7F0F000811110008037F777FF33377737F0F7000881000
      780373F777FFF777F373308000000000803337F77777777737F330F800000008
      8033373F777777733733330F8700078803333373FF77733F733333300FFF8800
      3333333773FFFF77333333333000003333333333377777333333}
    NumGlyphs = 2
    Spacing = 2
  end
  object Panel14: TPanel
    Left = 405
    Top = 337
    Width = 366
    Height = 21
    Color = 13165023
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 27
    object meregpen: TMaskEdit
      Left = 1
      Top = 1
      Width = 364
      Height = 19
      AutoSize = False
      TabOrder = 0
    end
  end
  object rgforsolben: TRadioGroup
    Left = 5
    Top = 48
    Width = 351
    Height = 42
    Caption = ' Origen de solicitud: '
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Por solicitud del beneficiario'
      'Por oficio interno')
    TabOrder = 1
    OnClick = rgforsolbenClick
  end
  object GBfecrec: TGroupBox
    Left = 5
    Top = 8
    Width = 351
    Height = 36
    Caption = 'Fecha de recepci'#243'n del expediente: '
    TabOrder = 0
    object DBDTPfecrecexp: TwwDBDateTimePicker
      Left = 194
      Top = 10
      Width = 101
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 0
      OnExit = DBDTPfecrecexpExit
    end
  end
  object btnFecCargo: TBitBtn
    Left = 472
    Top = 607
    Width = 67
    Height = 30
    Caption = 'F.Cargo'
    TabOrder = 28
    OnClick = btnFecCargoClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      003337777777777777F330FFFFFFFFFFF03337F3333FFF3337F330FFFF000FFF
      F03337F33377733337F330FFFFF0FFFFF03337F33337F33337F330FFFF00FFFF
      F03337F33377F33337F330FFFFF0FFFFF03337F33337333337F330FFFFFFFFFF
      F03337FFF3F3F3F3F7F33000F0F0F0F0F0333777F7F7F7F7F7F330F0F000F070
      F03337F7F777F777F7F330F0F0F0F070F03337F7F7373777F7F330F0FF0FF0F0
      F03337F733733737F7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
      F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
      333337FFFFFFFF77333330000000000333333777777777733333}
    NumGlyphs = 2
  end
  object BitBtn1: TBitBtn
    Left = 664
    Top = 216
    Width = 89
    Height = 25
    Caption = 'Mant. Asociado'
    TabOrder = 29
    OnClick = BitBtn1Click
  end
  object timeralerta: TTimer
    Interval = 500
    OnTimer = timeralertaTimer
    Left = 446
    Top = 150
  end
  object timerobservacion: TTimer
    Enabled = False
    Interval = 500
    OnTimer = timerobservacionTimer
    Left = 617
    Top = 439
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
    Left = 672
    Top = 602
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
      mmHeight = 129646
      mmPrintPosition = 0
      object ppShape31: TppShape
        UserName = 'Shape31'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41010
        mmTop = 97631
        mmWidth = 83873
        BandType = 4
      end
      object ppShape28: TppShape
        UserName = 'Shape28'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41010
        mmTop = 79111
        mmWidth = 83873
        BandType = 4
      end
      object ppShape26: TppShape
        UserName = 'Shape26'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41010
        mmTop = 73025
        mmWidth = 83873
        BandType = 4
      end
      object ppShape21: TppShape
        UserName = 'Shape21'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41010
        mmTop = 66940
        mmWidth = 83873
        BandType = 4
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5556
        mmLeft = 41540
        mmTop = 6350
        mmWidth = 83873
        BandType = 4
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5556
        mmLeft = 0
        mmTop = 6350
        mmWidth = 40481
        BandType = 4
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5556
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
        mmHeight = 3259
        mmLeft = 1059
        mmTop = 2116
        mmWidth = 16340
        BandType = 4
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Libreta Electoral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3259
        mmLeft = 1059
        mmTop = 7673
        mmWidth = 20490
        BandType = 4
      end
      object ppShape5: TppShape
        UserName = 'Shape5'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 0
        mmTop = 12171
        mmWidth = 40481
        BandType = 4
      end
      object ppShape6: TppShape
        UserName = 'Shape6'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41540
        mmTop = 12171
        mmWidth = 83873
        BandType = 4
      end
      object ppShape7: TppShape
        UserName = 'Shape7'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 0
        mmTop = 18256
        mmWidth = 40481
        BandType = 4
      end
      object ppShape8: TppShape
        UserName = 'Shape8'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41540
        mmTop = 18256
        mmWidth = 83873
        BandType = 4
      end
      object ppShape9: TppShape
        UserName = 'Shape9'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 0
        mmTop = 24342
        mmWidth = 40481
        BandType = 4
      end
      object ppShape10: TppShape
        UserName = 'Shape10'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41540
        mmTop = 24342
        mmWidth = 83873
        BandType = 4
      end
      object ppShape11: TppShape
        UserName = 'Shape11'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5822
        mmLeft = 41275
        mmTop = 36513
        mmWidth = 83873
        BandType = 4
      end
      object ppShape12: TppShape
        UserName = 'Shape12'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 0
        mmTop = 36513
        mmWidth = 40481
        BandType = 4
      end
      object ppShape13: TppShape
        UserName = 'Shape13'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 0
        mmTop = 30427
        mmWidth = 40481
        BandType = 4
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Documento Sustentatorio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3259
        mmLeft = 1059
        mmTop = 32015
        mmWidth = 32047
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
        mmHeight = 3260
        mmLeft = 1059
        mmTop = 38100
        mmWidth = 26162
        BandType = 4
      end
      object ppShape14: TppShape
        UserName = 'Shape14'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41275
        mmTop = 30427
        mmWidth = 83873
        BandType = 4
      end
      object ppShape15: TppShape
        UserName = 'Shape15'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 0
        mmTop = 42598
        mmWidth = 40481
        BandType = 4
      end
      object ppShape16: TppShape
        UserName = 'Shape16'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41275
        mmTop = 42598
        mmWidth = 83873
        BandType = 4
      end
      object ppShape17: TppShape
        UserName = 'Shape17'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 0
        mmTop = 48683
        mmWidth = 40481
        BandType = 4
      end
      object ppShape18: TppShape
        UserName = 'Shape18'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41275
        mmTop = 48683
        mmWidth = 83873
        BandType = 4
      end
      object ppShape19: TppShape
        UserName = 'Shape19'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 0
        mmTop = 54769
        mmWidth = 40481
        BandType = 4
      end
      object ppShape20: TppShape
        UserName = 'Shape101'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41275
        mmTop = 54769
        mmWidth = 83873
        BandType = 4
      end
      object ppShape22: TppShape
        UserName = 'Shape22'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 0
        mmTop = 66940
        mmWidth = 40481
        BandType = 4
      end
      object ppShape23: TppShape
        UserName = 'Shape23'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 0
        mmTop = 60854
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
        mmHeight = 3260
        mmLeft = 1059
        mmTop = 62442
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
        mmHeight = 3260
        mmLeft = 1059
        mmTop = 68527
        mmWidth = 6392
        BandType = 4
      end
      object ppShape24: TppShape
        UserName = 'Shape24'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41010
        mmTop = 60854
        mmWidth = 83873
        BandType = 4
      end
      object ppShape25: TppShape
        UserName = 'Shape25'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 0
        mmTop = 73025
        mmWidth = 40481
        BandType = 4
      end
      object ppShape27: TppShape
        UserName = 'Shape27'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 0
        mmTop = 79111
        mmWidth = 40481
        BandType = 4
      end
      object ppShape29: TppShape
        UserName = 'Shape29'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 0
        mmTop = 85196
        mmWidth = 40481
        BandType = 4
      end
      object ppShape30: TppShape
        UserName = 'Shape30'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41010
        mmTop = 85196
        mmWidth = 83873
        BandType = 4
      end
      object ppShape32: TppShape
        UserName = 'Shape32'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 0
        mmTop = 97631
        mmWidth = 40481
        BandType = 4
      end
      object ppShape33: TppShape
        UserName = 'Shape33'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 0
        mmTop = 91546
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
        mmHeight = 3260
        mmLeft = 1059
        mmTop = 93134
        mmWidth = 17060
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
        mmHeight = 3260
        mmLeft = 1059
        mmTop = 99219
        mmWidth = 26204
        BandType = 4
      end
      object ppShape34: TppShape
        UserName = 'Shape34'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41010
        mmTop = 91546
        mmWidth = 83873
        BandType = 4
      end
      object ppShape35: TppShape
        UserName = 'Shape35'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 0
        mmTop = 103717
        mmWidth = 40481
        BandType = 4
      end
      object ppShape36: TppShape
        UserName = 'Shape36'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41010
        mmTop = 103717
        mmWidth = 83873
        BandType = 4
      end
      object ppShape37: TppShape
        UserName = 'Shape37'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 0
        mmTop = 109802
        mmWidth = 40481
        BandType = 4
      end
      object ppShape38: TppShape
        UserName = 'Shape38'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41010
        mmTop = 109802
        mmWidth = 83873
        BandType = 4
      end
      object ppShape39: TppShape
        UserName = 'Shape39'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 0
        mmTop = 115888
        mmWidth = 40481
        BandType = 4
      end
      object ppShape40: TppShape
        UserName = 'Shape301'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41010
        mmTop = 115888
        mmWidth = 83873
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
        mmHeight = 3259
        mmLeft = 1059
        mmTop = 13758
        mmWidth = 20785
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
        mmHeight = 3259
        mmLeft = 1059
        mmTop = 19844
        mmWidth = 21209
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
        mmHeight = 3259
        mmLeft = 1059
        mmTop = 25929
        mmWidth = 11514
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
        mmHeight = 3260
        mmLeft = 1059
        mmTop = 44186
        mmWidth = 22987
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
        mmHeight = 3260
        mmLeft = 1059
        mmTop = 50006
        mmWidth = 25781
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
        mmHeight = 3260
        mmLeft = 1059
        mmTop = 56356
        mmWidth = 26839
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
        mmHeight = 3260
        mmLeft = 1323
        mmTop = 74613
        mmWidth = 14986
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
        mmHeight = 3260
        mmLeft = 1323
        mmTop = 80698
        mmWidth = 26331
        BandType = 4
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Lugar de Domicilio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 1323
        mmTop = 86784
        mmWidth = 23495
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
        mmHeight = 3260
        mmLeft = 1058
        mmTop = 105304
        mmWidth = 29972
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
        mmHeight = 3260
        mmLeft = 1058
        mmTop = 111390
        mmWidth = 37338
        BandType = 4
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'Direcci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 1058
        mmTop = 117475
        mmWidth = 11811
        BandType = 4
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5556
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
        mmTop = 2117
        mmWidth = 71702
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
        mmWidth = 71702
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
        mmTop = 13494
        mmWidth = 71702
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
        mmTop = 19579
        mmWidth = 71702
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
        mmTop = 25665
        mmWidth = 71702
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'OTRDOC'
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
        mmTop = 32015
        mmWidth = 71702
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
        mmLeft = 43127
        mmTop = 37306
        mmWidth = 71702
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
        mmTop = 43392
        mmWidth = 71702
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
        mmHeight = 3440
        mmLeft = 43127
        mmTop = 49477
        mmWidth = 71702
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
        mmLeft = 43127
        mmTop = 55563
        mmWidth = 71702
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText101'
        DataField = 'LUGDOM'
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
        mmTop = 85990
        mmWidth = 71702
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'GRAINS'
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
        mmWidth = 71702
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'ESTCIV'
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
        mmTop = 73819
        mmWidth = 71702
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'SEXO'
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
        mmTop = 67733
        mmWidth = 71702
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
        mmHeight = 3440
        mmLeft = 43127
        mmTop = 62442
        mmWidth = 71702
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'DIRECCION'
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
        mmTop = 116681
        mmWidth = 83344
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
        mmTop = 110596
        mmWidth = 71702
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'STAVOT'
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
        mmTop = 104511
        mmWidth = 71702
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
        mmTop = 98425
        mmWidth = 71702
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'RESTRICCIONES'
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
        mmTop = 93134
        mmWidth = 71702
        BandType = 4
      end
      object ppFirma: TppImage
        UserName = 'Firma'
        MaintainAspectRatio = False
        Stretch = True
        Transparent = True
        mmHeight = 37571
        mmLeft = 117740
        mmTop = 58473
        mmWidth = 76729
        BandType = 4
      end
      object ppShape60: TppShape
        UserName = 'Shape60'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 265
        mmTop = 121973
        mmWidth = 40481
        BandType = 4
      end
      object ppShape61: TppShape
        UserName = 'Shape61'
        Brush.Color = 15395048
        Pen.Color = clWindow
        mmHeight = 5821
        mmLeft = 41275
        mmTop = 121973
        mmWidth = 83873
        BandType = 4
      end
      object ppLabel141: TppLabel
        UserName = 'Label208'
        Caption = 'Estado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 1323
        mmTop = 123031
        mmWidth = 8848
        BandType = 4
      end
      object ppDBText34: TppDBText
        UserName = 'DBText34'
        DataField = 'FLAG_EXPIRA'
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
        mmTop = 123031
        mmWidth = 71702
        BandType = 4
      end
      object ppFoto: TppImage
        UserName = 'Foto'
        MaintainAspectRatio = False
        Stretch = True
        Transparent = True
        mmHeight = 51329
        mmLeft = 141552
        mmTop = 2646
        mmWidth = 35190
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
  end
  object ppBDEReniec: TppBDEPipeline
    DataSource = DM1.dsReporte
    UserName = 'BDEReniec'
    Left = 680
    Top = 610
  end
end
