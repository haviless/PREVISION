object FReliquidacionBeneficios: TFReliquidacionBeneficios
  Left = 244
  Top = 55
  BorderStyle = bsDialog
  Caption = 'Reliquidaci'#243'n de Beneficios'
  ClientHeight = 601
  ClientWidth = 539
  Color = 10207162
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 15
  object btncerrarreliquidacion: TBitBtn
    Left = 466
    Top = 570
    Width = 73
    Height = 29
    Caption = 'Cerrar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btncerrarreliquidacionClick
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
  object pnlliqant: TPanel
    Left = 0
    Top = 0
    Width = 538
    Height = 325
    Color = 13165023
    TabOrder = 3
    object Label1: TLabel
      Left = 3
      Top = 4
      Width = 122
      Height = 15
      Caption = 'Datos de la Liquidaci'#243'n:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 5
      Top = 21
      Width = 43
      Height = 15
      Caption = 'N'#250'mero:'
      Color = 13165023
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label5: TLabel
      Left = 5
      Top = 64
      Width = 115
      Height = 15
      Caption = 'Apellidos y nombre(s) :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 286
      Top = 21
      Width = 30
      Height = 15
      Caption = 'Fecha'
      Color = 13165023
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label7: TLabel
      Left = 114
      Top = 21
      Width = 23
      Height = 15
      Caption = 'Tipo'
      Color = 13165023
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label8: TLabel
      Left = 403
      Top = 64
      Width = 68
      Height = 15
      Caption = 'Doc. de Iden.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 5
      Top = 107
      Width = 117
      Height = 15
      Caption = 'N'#250'mero Nombramiento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 127
      Top = 107
      Width = 122
      Height = 15
      Caption = 'Fecha de Nombramiento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 255
      Top = 107
      Width = 67
      Height = 15
      Caption = 'N'#250'mero Cese'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 369
      Top = 107
      Width = 72
      Height = 15
      Caption = 'Fecha de Cese'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 5
      Top = 152
      Width = 122
      Height = 15
      Caption = 'Monto de la Liquidaci'#243'n'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Panel3: TPanel
      Left = 3
      Top = 38
      Width = 103
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
      object menumeroliquidacion: TMaskEdit
        Left = 2
        Top = 1
        Width = 99
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
    object Panel4: TPanel
      Left = 3
      Top = 81
      Width = 393
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
      object measoapenomdni: TMaskEdit
        Left = 2
        Top = 1
        Width = 390
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
    object Panel5: TPanel
      Left = 283
      Top = 38
      Width = 103
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
      object mefechaliquidacion: TMaskEdit
        Left = 2
        Top = 1
        Width = 99
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
    object Panel6: TPanel
      Left = 112
      Top = 38
      Width = 164
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
      object metipoliquidacion: TMaskEdit
        Left = 2
        Top = 1
        Width = 159
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
      Left = 401
      Top = 81
      Width = 119
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
      object medocumentoidentidad: TMaskEdit
        Left = 2
        Top = 1
        Width = 115
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
      Left = 3
      Top = 125
      Width = 103
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
      object menumeronombramiento: TMaskEdit
        Left = 2
        Top = 1
        Width = 99
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
      Left = 127
      Top = 125
      Width = 103
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
      object mefechanombramiento: TMaskEdit
        Left = 2
        Top = 1
        Width = 99
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
    object Panel11: TPanel
      Left = 255
      Top = 125
      Width = 103
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
      object menumerocese: TMaskEdit
        Left = 2
        Top = 1
        Width = 99
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
    object Panel12: TPanel
      Left = 367
      Top = 124
      Width = 103
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
      object mefechacese: TMaskEdit
        Left = 2
        Top = 1
        Width = 99
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
    object dbgDetCalBenRel: TwwDBGrid
      Left = 5
      Top = 173
      Width = 531
      Height = 150
      DisableThemesInTitle = False
      Selected.Strings = (
        'DESC'#9'60'#9'Descripci'#243'n'
        'MONTO'#9'10'#9'Monto')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = DM1.dsDetCalLiq
      Options = [dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect, dgShowFooter]
      TabOrder = 9
      TitleAlignment = taLeftJustify
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Comic Sans MS'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
    end
  end
  object btngenerareliquidacion: TBitBtn
    Left = 388
    Top = 570
    Width = 73
    Height = 29
    Caption = 'Generar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btngenerareliquidacionClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333FFFFF3333333333700000733333333F777773FF3333333007F0F70
      0333333773373377FF3333300FFF7FFF003333773F3333377FF33300F0FFFFF0
      F00337737333F37377F33707FFFF0FFFF70737F33337F33337FF300FFFFF0FFF
      FF00773F3337F333377F30707FFF0FFF70707F733337F333737F300FFFF09FFF
      FF0077F33377F33337733707FF0F9FFFF70737FF3737F33F37F33300F0FF9FF0
      F003377F7337F373773333300FFF9FFF00333377FF37F3377FF33300007F9F70
      000337777FF7FF77773333703070007030733373777777737333333333330333
      333333333337FF33333333333330003333333333337773333333}
    NumGlyphs = 2
  end
  object gbdatliq: TGroupBox
    Left = 0
    Top = 325
    Width = 538
    Height = 228
    Caption = ' Datos de la reliquidaci'#243'n '
    Color = 13165023
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object pnlresoluciones: TPanel
      Left = 3
      Top = 16
      Width = 530
      Height = 79
      Color = 13165023
      TabOrder = 0
      object Label18: TLabel
        Left = 15
        Top = 25
        Width = 80
        Height = 15
        Caption = 'Nombramiento :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object Label22: TLabel
        Left = 15
        Top = 51
        Width = 30
        Height = 15
        Caption = 'Cese :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object Label23: TLabel
        Left = 108
        Top = 5
        Width = 40
        Height = 15
        Caption = 'N'#250'mero'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object Label24: TLabel
        Left = 223
        Top = 5
        Width = 30
        Height = 15
        Caption = 'Fecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 3
        Top = 4
        Width = 66
        Height = 15
        Caption = 'Resoluciones'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object menumresnom: TMaskEdit
        Left = 108
        Top = 22
        Width = 81
        Height = 23
        Enabled = False
        TabOrder = 0
      end
      object menumresces: TMaskEdit
        Tag = 2
        Left = 108
        Top = 48
        Width = 81
        Height = 23
        TabOrder = 2
      end
      object dbdtpfecnom: TwwDBDateTimePicker
        Tag = 1
        Left = 223
        Top = 22
        Width = 87
        Height = 23
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Epoch = 1950
        Enabled = False
        ShowButton = True
        TabOrder = 1
      end
      object dbdtpfecces: TwwDBDateTimePicker
        Tag = 3
        Left = 223
        Top = 48
        Width = 87
        Height = 23
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Epoch = 1950
        ShowButton = True
        TabOrder = 3
      end
    end
    object pnlforpago: TPanel
      Left = 3
      Top = 95
      Width = 530
      Height = 126
      Color = 13165023
      TabOrder = 1
      object TLabel
        Left = 4
        Top = 3
        Width = 64
        Height = 13
        Caption = 'Forma de Pago'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblforpag: TLabel
        Left = 129
        Top = 13
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
        Left = 129
        Top = 40
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
        Left = 129
        Top = 66
        Width = 88
        Height = 15
        Caption = 'Agencia a Girar :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object lblasoncta: TLabel
        Left = 129
        Top = 92
        Width = 96
        Height = 15
        Caption = 'N'#250'mero de Cuenta:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 3
        Top = 5
        Width = 73
        Height = 15
        Caption = 'Forma de Pago'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object rgCobAso: TRadioGroup
        Left = 2
        Top = 23
        Width = 122
        Height = 66
        Caption = ' '#191' Cobra el Asociado ? '
        Columns = 2
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          'Si'
          'No')
        ParentFont = False
        TabOrder = 0
        OnClick = rgCobAsoClick
      end
      object dblcforpag: TwwDBLookupCombo
        Left = 219
        Top = 10
        Width = 47
        Height = 23
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
        OnChange = dblcforpagChange
        OnExit = dblcforpagExit
      end
      object dblcBanco: TwwDBLookupCombo
        Left = 219
        Top = 36
        Width = 47
        Height = 23
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'BANCOID'#9'2'#9'C'#243'digo de~Banco'#9#9
          'BANCONOM'#9'25'#9'Descripci'#243'n del~banco'#9#9)
        LookupTable = DM1.cdsBanco
        LookupField = 'BANCOID'
        MaxLength = 2
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnChange = dblcBancoChange
        OnExit = dblcBancoExit
      end
      object pnlforpag: TPanel
        Left = 300
        Top = 10
        Width = 225
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
          Width = 223
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
      object pnlbanco: TPanel
        Left = 300
        Top = 36
        Width = 225
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
          Width = 223
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
        Left = 300
        Top = 63
        Width = 225
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
        object meagengir: TMaskEdit
          Left = 1
          Top = 1
          Width = 223
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
      object pnlasoncta: TPanel
        Left = 300
        Top = 89
        Width = 143
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
      object dblcagegir: TwwDBLookupComboDlg
        Left = 219
        Top = 64
        Width = 76
        Height = 23
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Lookup'
        MaxWidth = 0
        MaxHeight = 209
        LookupTable = DM1.cdsAgBco
        LookupField = 'AGENBCOID'
        TabOrder = 7
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnChange = dblcagegirChange
        OnExit = dblcagegirExit
      end
    end
  end
end
