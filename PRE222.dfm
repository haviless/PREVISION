object FProgramacionDesembolso: TFProgramacionDesembolso
  Left = 251
  Top = 260
  BorderStyle = bsDialog
  Caption = 'Programaci'#243'n de desembolso'
  ClientHeight = 282
  ClientWidth = 704
  Color = 10207162
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object rgCobAso: TRadioGroup
    Left = 6
    Top = 6
    Width = 94
    Height = 49
    Caption = 'Cobra Asociado'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 0
    OnClick = rgCobAsoClick
  end
  object gbCobAso: TGroupBox
    Left = 105
    Top = 11
    Width = 472
    Height = 201
    Caption = ' Datos y forma de pago del designatario '
    Color = clMoneyGreen
    ParentColor = False
    TabOrder = 1
    Visible = False
    object lblforpag: TLabel
      Left = 8
      Top = 102
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
      Left = 8
      Top = 131
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
    object Label25: TLabel
      Left = 116
      Top = 131
      Width = 3
      Height = 13
      Caption = ':'
    end
    object Label19: TLabel
      Left = 116
      Top = 102
      Width = 3
      Height = 13
      Caption = ':'
    end
    object lblasoncta: TLabel
      Left = 208
      Top = 72
      Width = 96
      Height = 15
      Caption = 'Cuenta ahorros BN'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object lbldospun04: TLabel
      Left = 316
      Top = 72
      Width = 3
      Height = 13
      Caption = ':'
    end
    object Label1: TLabel
      Left = 8
      Top = 20
      Width = 19
      Height = 13
      Caption = 'DNI'
    end
    object Label2: TLabel
      Left = 118
      Top = 20
      Width = 3
      Height = 13
      Caption = ':'
    end
    object Label3: TLabel
      Left = 8
      Top = 46
      Width = 101
      Height = 13
      Caption = 'Apellidos y Nombre(s)'
    end
    object Label4: TLabel
      Left = 40
      Top = 47
      Width = 3
      Height = 13
      Caption = ':'
    end
    object Label5: TLabel
      Left = 118
      Top = 46
      Width = 3
      Height = 13
      Caption = ':'
    end
    object Label6: TLabel
      Left = 11
      Top = 72
      Width = 101
      Height = 13
      Caption = 'Monto a desembolsar'
    end
    object Label7: TLabel
      Left = 118
      Top = 72
      Width = 3
      Height = 13
      Caption = ':'
    end
    object dblcforpag: TwwDBLookupCombo
      Left = 125
      Top = 98
      Width = 52
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TIPDESEID'#9'2'#9'C'#243'digo de la~Forma de pago'#9#9
        'TIPDESEDES'#9'25'#9'Descripci'#243'n de la~Forma de Pago'#9#9)
      LookupTable = DM1.cdsFPago
      LookupField = 'TIPDESEID'
      MaxLength = 2
      ParentFont = False
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnChange = dblcforpagChange
      OnExit = dblcforpagExit
    end
    object dblcBanco: TwwDBLookupCombo
      Left = 125
      Top = 127
      Width = 52
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'BANCOID'#9'2'#9'C'#243'digo de~Banco'#9#9
        'BANCONOM'#9'25'#9'Descripci'#243'n del~banco'#9#9)
      LookupTable = DM1.cdsBanco
      LookupField = 'BANCOID'
      MaxLength = 2
      ParentFont = False
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnChange = dblcBancoChange
      OnExit = dblcBancoExit
    end
    object pnlbanco: TPanel
      Left = 181
      Top = 127
      Width = 283
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
      object mebancodes: TMaskEdit
        Left = 1
        Top = 1
        Width = 281
        Height = 21
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
    object pnlforpag: TPanel
      Left = 181
      Top = 97
      Width = 282
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
      object meforpagodes: TMaskEdit
        Left = 1
        Top = 1
        Width = 280
        Height = 21
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
    object pnlasoncta: TPanel
      Left = 330
      Top = 67
      Width = 85
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
      object meASONCTA: TMaskEdit
        Left = 1
        Top = 1
        Width = 82
        Height = 21
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
    object Panel1: TPanel
      Left = 125
      Top = 15
      Width = 66
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
      object meASODNI: TMaskEdit
        Left = 1
        Top = 1
        Width = 64
        Height = 21
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
    object Panel2: TPanel
      Left = 125
      Top = 41
      Width = 337
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
      object meASOAPENOMDNI: TMaskEdit
        Left = 1
        Top = 1
        Width = 335
        Height = 21
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
    object Button2: TButton
      Left = 268
      Top = 157
      Width = 94
      Height = 32
      Caption = 'A'#241'adir'
      TabOrder = 7
      OnClick = Button2Click
    end
    object btncerrar: TButton
      Left = 370
      Top = 158
      Width = 94
      Height = 32
      Caption = 'Salir'
      TabOrder = 8
      OnClick = btncerrarClick
    end
    object Panel3: TPanel
      Left = 125
      Top = 67
      Width = 61
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
      object meMONAPAG: TMaskEdit
        Left = 1
        Top = 1
        Width = 59
        Height = 21
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
  object btnbeneficiarios: TBitBtn
    Left = 106
    Top = 11
    Width = 94
    Height = 32
    Caption = 'Beneficiarios'
    TabOrder = 2
    OnClick = btnbeneficiariosClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
      55555575555555775F55509999999901055557F55555557F75F5001111111101
      105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
      01105777F555557F7FF75500FFFFFF0F00105577F555FF7F77575550FF70000F
      0F0055575FF777757F775555000FFFFF0F005555777555FF7F77555550FF7000
      0F055555575FF777757F555555000FFFFF05555555777555FF7F55555550FF70
      0005555555575FF7777555555555000555555555555577755555555555555555
      5555555555555555555555555555555555555555555555555555}
    NumGlyphs = 2
  end
  object gbProgramacion: TGroupBox
    Left = -9
    Top = 58
    Width = 689
    Height = 177
    Caption = ' Programaci'#243'n de desembolso '
    TabOrder = 3
    object btnGenerar: TBitBtn
      Left = 604
      Top = 141
      Width = 78
      Height = 32
      Caption = 'Generar'
      TabOrder = 0
      OnClick = btnGenerarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00370777033333
        3330337F3F7F33333F3787070003333707303F737773333373F7007703333330
        700077337F3333373777887007333337007733F773F333337733700070333333
        077037773733333F7F37703707333300080737F373333377737F003333333307
        78087733FFF3337FFF7F33300033330008073F3777F33F777F73073070370733
        078073F7F7FF73F37FF7700070007037007837773777F73377FF007777700730
        70007733FFF77F37377707700077033707307F37773F7FFF7337080777070003
        3330737F3F7F777F333778080707770333333F7F737F3F7F3333080787070003
        33337F73FF737773333307800077033333337337773373333333}
      NumGlyphs = 2
    end
    object dbgPrevioDesembolso: TwwDBGrid
      Left = 8
      Top = 18
      Width = 674
      Height = 119
      DisableThemesInTitle = False
      Selected.Strings = (
        'DESC'#9'89'#9'Descripci'#243'n del tipo de Desembolso'
        'MONTO'#9'12'#9'Monto a~desembolsar'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = DM1.dsForPag
      Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = False
    end
  end
  object btnSalir: TBitBtn
    Left = 618
    Top = 241
    Width = 78
    Height = 32
    Caption = 'Salir'
    TabOrder = 4
    OnClick = btnSalirClick
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
