object Fmanfam: TFmanfam
  Left = 9
  Top = 109
  Width = 778
  Height = 456
  Caption = 'Mantenimiento de los familiares'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblforpag: TLabel
    Left = 6
    Top = 3
    Width = 86
    Height = 15
    Caption = 'Tipo de relaci'#243'n:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 187
    Top = 3
    Width = 84
    Height = 15
    Caption = 'Apellido paterno'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 383
    Top = 3
    Width = 84
    Height = 15
    Caption = 'Apellido paterno'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 578
    Top = 3
    Width = 84
    Height = 15
    Caption = 'Apellido paterno'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 6
    Top = 50
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
  object Label7: TLabel
    Left = 473
    Top = 51
    Width = 150
    Height = 15
    Caption = 'Documento de Identificaci'#243'n'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 121
    Top = 51
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
  object Label9: TLabel
    Left = 6
    Top = 95
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
  object Label10: TLabel
    Left = 580
    Top = 95
    Width = 49
    Height = 15
    Caption = 'Telefono:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label11: TLabel
    Left = 6
    Top = 147
    Width = 74
    Height = 15
    Caption = 'Departamento:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label12: TLabel
    Left = 118
    Top = 147
    Width = 52
    Height = 15
    Caption = 'Provincia:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label14: TLabel
    Left = 270
    Top = 147
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
  object Label16: TLabel
    Left = 297
    Top = 51
    Width = 64
    Height = 15
    Caption = 'Estado Civil:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 187
    Top = 22
    Width = 192
    Height = 23
    Color = 13165023
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object meAsoApeNomDni: TMaskEdit
      Left = 1
      Top = 1
      Width = 190
      Height = 21
      TabOrder = 0
    end
  end
  object dblcforpag: TwwDBLookupCombo
    Left = 6
    Top = 22
    Width = 56
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'TIPDESEID'#9'2'#9'C'#243'digo de la~Forma de pago'#9#9
      'TIPDESEDES'#9'25'#9'Descripci'#243'n de la~Forma de Pago'#9#9)
    LookupTable = DM1.cdsFPago
    LookupField = 'TIPDESEID'
    MaxLength = 2
    TabOrder = 1
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
  end
  object pnlforpag: TPanel
    Left = 68
    Top = 22
    Width = 114
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
    object meforpagodes: TMaskEdit
      Left = 1
      Top = 1
      Width = 112
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
  object Panel2: TPanel
    Left = 383
    Top = 22
    Width = 192
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
    object MaskEdit1: TMaskEdit
      Left = 1
      Top = 1
      Width = 190
      Height = 21
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 578
    Top = 22
    Width = 192
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
    object MaskEdit2: TMaskEdit
      Left = 1
      Top = 1
      Width = 190
      Height = 21
      TabOrder = 0
    end
  end
  object GroupBox1: TGroupBox
    Left = 12
    Top = 254
    Width = 740
    Height = 56
    Caption = 'Datos Adicionales '
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -9
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    object Label15: TLabel
      Left = 165
      Top = 13
      Width = 32
      Height = 13
      Caption = 'Banco :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label24: TLabel
      Left = 6
      Top = 13
      Width = 67
      Height = 13
      Caption = 'Forma de Pago :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 520
      Top = 13
      Width = 65
      Height = 13
      Caption = 'Lugar de Giro :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 346
      Top = 13
      Width = 66
      Height = 13
      Caption = 'Departamento :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object dblcBanco: TwwDBLookupCombo
      Left = 165
      Top = 28
      Width = 38
      Height = 19
      AutoSize = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      CharCase = ecUpperCase
      BorderStyle = bsNone
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'BANCOID'#9'2'#9'Id'#9'F'
        'BANCONOM'#9'30'#9'Nombre'#9'F')
      DataField = 'BANCOID'
      DataSource = DM1.dsDFam
      LookupTable = DM1.cdsBanco
      LookupField = 'BANCOID'
      Options = [loColLines, loRowLines, loTitles]
      Color = 13165023
      Frame.Enabled = True
      Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
      ParentFont = False
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      UseTFields = False
      PreciseEditRegion = False
      AllowClearKey = False
      ShowMatchText = True
    end
    object dbeBanco: TwwDBEdit
      Left = 207
      Top = 28
      Width = 134
      Height = 19
      AutoSize = False
      BorderStyle = bsNone
      Color = 13165023
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      Frame.Enabled = True
      Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
      ParentFont = False
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcFPago: TwwDBLookupCombo
      Left = 6
      Top = 28
      Width = 38
      Height = 19
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      BorderStyle = bsNone
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TIPDESEID'#9'2'#9'Id'#9'F'
        'TIPDESEABR'#9'15'#9'Descripci'#243'n'#9'F')
      DataField = 'FORPAGOID'
      DataSource = DM1.dsDFam
      LookupTable = DM1.cdsTipDesemb
      LookupField = 'TIPDESEID'
      Options = [loColLines, loRowLines, loTitles]
      Color = 13165023
      Frame.Enabled = True
      ParentFont = False
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
    end
    object dbeFPago: TwwDBEdit
      Left = 47
      Top = 28
      Width = 113
      Height = 19
      AutoSize = False
      BorderStyle = bsNone
      Color = 13165023
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      Frame.Enabled = True
      Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
      ParentFont = False
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcdLugGiro: TwwDBLookupComboDlg
      Left = 520
      Top = 28
      Width = 71
      Height = 19
      AutoSize = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      CharCase = ecUpperCase
      BorderStyle = bsNone
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'AGENBCOID'#9'8'#9'Id'#9'F'
        'AGENBCODES'#9'30'#9'Descripci'#243'n'#9'F')
      DataField = 'CCBCOID'
      DataSource = DM1.dsDFam
      LookupTable = DM1.cdsAgBco
      LookupField = 'AGENBCOID'
      Color = 13165023
      Frame.Enabled = True
      ParentFont = False
      TabOrder = 6
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object dbeLugGiro: TwwDBEdit
      Left = 594
      Top = 28
      Width = 137
      Height = 19
      AutoSize = False
      BorderStyle = bsNone
      Color = 13165023
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      Frame.Enabled = True
      Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
      ParentFont = False
      TabOrder = 7
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcdDptoBco: TwwDBLookupComboDlg
      Left = 346
      Top = 28
      Width = 42
      Height = 19
      AutoSize = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      CharCase = ecUpperCase
      BorderStyle = bsNone
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'DPTOID'#9'3'#9'Id'#9'F'
        'DPTODES'#9'25'#9'Descripci'#243'n'#9'F')
      DataField = 'BCODPTOID'
      DataSource = DM1.dsDFam
      LookupTable = DM1.cdsDpto1
      LookupField = 'DPTOID'
      Color = 13165023
      Frame.Enabled = True
      ParentFont = False
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object dbeDptoBco: TwwDBEdit
      Left = 394
      Top = 28
      Width = 121
      Height = 19
      AutoSize = False
      BorderStyle = bsNone
      Color = 13165023
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      Frame.Enabled = True
      Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
      ParentFont = False
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  object gbDatosTutor: TGroupBox
    Left = 20
    Top = 325
    Width = 544
    Height = 64
    Caption = 'Datos del Tutor '
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -9
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    object TLabel
      Left = 8
      Top = 20
      Width = 90
      Height = 13
      Caption = 'Apellidos y Nombres :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object TLabel
      Left = 256
      Top = 20
      Width = 166
      Height = 13
      Caption = 'Tipo de Documento de Identificaci'#243'n :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object TLabel
      Left = 433
      Top = 20
      Width = 17
      Height = 13
      Caption = 'N'#176' :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object dbeApeNomT: TwwDBEdit
      Left = 8
      Top = 36
      Width = 240
      Height = 19
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Color = 13165023
      DataField = 'TUTAPENOM'
      DataSource = DM1.dsDFam
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      Frame.Enabled = True
      Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
      ParentFont = False
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcTipDocT: TwwDBLookupCombo
      Left = 256
      Top = 36
      Width = 39
      Height = 19
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      BorderStyle = bsNone
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TIPDOCCOD'#9'2'#9'ID'#9'F'
        'TIPDOCDES'#9'35'#9'DESCRIPCION'#9'F')
      DataField = 'TUTTIPDOC'
      DataSource = DM1.dsDFam
      LookupTable = DM1.cdsTDoc
      LookupField = 'TIPDOCCOD'
      Options = [loColLines, loRowLines, loTitles]
      Color = 13165023
      Frame.Enabled = True
      Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
      ParentFont = False
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      UseTFields = False
      PreciseEditRegion = False
      AllowClearKey = True
    end
    object dbeDescTipDocT: TwwDBEdit
      Left = 299
      Top = 36
      Width = 127
      Height = 19
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Color = 13165023
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      Frame.Enabled = True
      Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
      ParentFont = False
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeNumDocT: TwwDBEdit
      Left = 434
      Top = 36
      Width = 98
      Height = 19
      BorderStyle = bsNone
      Color = 13165023
      DataField = 'TUTNUMDOC'
      DataSource = DM1.dsDFam
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      Frame.Enabled = True
      Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
      ParentFont = False
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  object dbdtpfacinv: TwwDBDateTimePicker
    Tag = 1
    Left = 6
    Top = 70
    Width = 91
    Height = 21
    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
    CalendarAttributes.Font.Color = clWindowText
    CalendarAttributes.Font.Height = -11
    CalendarAttributes.Font.Name = 'MS Sans Serif'
    CalendarAttributes.Font.Style = []
    Epoch = 1950
    ShowButton = True
    TabOrder = 7
  end
  object wwDBLookupCombo1: TwwDBLookupCombo
    Left = 121
    Top = 70
    Width = 56
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'TIPDESEID'#9'2'#9'C'#243'digo de la~Forma de pago'#9#9
      'TIPDESEDES'#9'25'#9'Descripci'#243'n de la~Forma de Pago'#9#9)
    LookupTable = DM1.cdsFPago
    LookupField = 'TIPDESEID'
    MaxLength = 2
    TabOrder = 8
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
  end
  object Panel4: TPanel
    Left = 180
    Top = 70
    Width = 114
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
    object MaskEdit3: TMaskEdit
      Left = 1
      Top = 1
      Width = 112
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
  object wwDBLookupCombo2: TwwDBLookupCombo
    Left = 297
    Top = 70
    Width = 56
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'TIPDESEID'#9'2'#9'C'#243'digo de la~Forma de pago'#9#9
      'TIPDESEDES'#9'25'#9'Descripci'#243'n de la~Forma de Pago'#9#9)
    LookupTable = DM1.cdsFPago
    LookupField = 'TIPDESEID'
    MaxLength = 2
    TabOrder = 10
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
  end
  object Panel5: TPanel
    Left = 356
    Top = 70
    Width = 114
    Height = 23
    Color = 13165023
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    object MaskEdit4: TMaskEdit
      Left = 1
      Top = 1
      Width = 112
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
  object wwDBLookupCombo3: TwwDBLookupCombo
    Left = 473
    Top = 70
    Width = 56
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'TIPDESEID'#9'2'#9'C'#243'digo de la~Forma de pago'#9#9
      'TIPDESEDES'#9'25'#9'Descripci'#243'n de la~Forma de Pago'#9#9)
    LookupTable = DM1.cdsFPago
    LookupField = 'TIPDESEID'
    MaxLength = 2
    TabOrder = 12
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
  end
  object Panel6: TPanel
    Left = 533
    Top = 70
    Width = 114
    Height = 23
    Color = 13165023
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 13
    object MaskEdit5: TMaskEdit
      Left = 1
      Top = 1
      Width = 112
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
  object Panel7: TPanel
    Left = 652
    Top = 70
    Width = 114
    Height = 23
    Color = 13165023
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 14
    object MaskEdit6: TMaskEdit
      Left = 1
      Top = 1
      Width = 112
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
  object Panel8: TPanel
    Left = 6
    Top = 113
    Width = 567
    Height = 23
    Color = 13165023
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 15
    object MaskEdit7: TMaskEdit
      Left = 1
      Top = 1
      Width = 565
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
  object Panel9: TPanel
    Left = 580
    Top = 113
    Width = 114
    Height = 23
    Color = 13165023
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 16
    object MaskEdit8: TMaskEdit
      Left = 1
      Top = 1
      Width = 112
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
  object Panel10: TPanel
    Left = 68
    Top = 166
    Width = 114
    Height = 23
    Color = 13165023
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 17
    object MaskEdit9: TMaskEdit
      Left = 1
      Top = 1
      Width = 112
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
  object wwDBLookupComboDlg1: TwwDBLookupComboDlg
    Left = 8
    Top = 168
    Width = 49
    Height = 21
    GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
    GridColor = clWhite
    GridTitleAlignment = taLeftJustify
    Caption = 'Lookup'
    MaxWidth = 0
    MaxHeight = 209
    TabOrder = 18
    AutoDropDown = False
    ShowButton = True
    AllowClearKey = False
  end
end
