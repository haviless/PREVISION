object Frepxtipben: TFrepxtipben
  Left = 384
  Top = 172
  BorderStyle = bsDialog
  Caption = 'Liquidaci'#243'n por Tipo de Beneficio'
  ClientHeight = 562
  ClientWidth = 865
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
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 3
    Top = 1
    Width = 854
    Height = 136
    Caption = ' Reporte por Tipo de Beneficio '
    Color = 10207162
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object Label3: TLabel
      Left = 324
      Top = 22
      Width = 100
      Height = 17
      Caption = 'Tipo de Beneficio:'
    end
    object Label4: TLabel
      Left = 324
      Top = 48
      Width = 81
      Height = 17
      Caption = 'Departamento:'
    end
    object Label5: TLabel
      Left = 324
      Top = 98
      Width = 47
      Height = 17
      Caption = 'Usuario:'
    end
    object Label6: TLabel
      Left = 324
      Top = 74
      Width = 46
      Height = 17
      Caption = 'Oficina:'
    end
    object dblctipben: TwwDBLookupCombo
      Left = 427
      Top = 20
      Width = 52
      Height = 25
      DropDownAlignment = taLeftJustify
      LookupTable = DM1.cdsTipBenef
      LookupField = 'TIPBENEF'
      MaxLength = 2
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnChange = dblctipbenChange
    end
    object pnltipbenef: TPanel
      Left = 541
      Top = 20
      Width = 202
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
      object metipbenef: TMaskEdit
        Left = 1
        Top = 1
        Width = 199
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 65
        ParentFont = False
        TabOrder = 0
      end
    end
    object btnImprimePrevio: TBitBtn
      Left = 751
      Top = 20
      Width = 73
      Height = 29
      Caption = 'Previo'
      TabOrder = 5
      OnClick = btnImprimePrevioClick
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
    object dblcdptoid: TwwDBLookupCombo
      Left = 427
      Top = 45
      Width = 53
      Height = 25
      DropDownAlignment = taLeftJustify
      LookupTable = DM1.cdsDpto
      LookupField = 'DPTOID'
      MaxLength = 2
      TabOrder = 3
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnChange = dblcdptoidChange
    end
    object pnldesdpto: TPanel
      Left = 541
      Top = 45
      Width = 203
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
      object medesdpto: TMaskEdit
        Left = 1
        Top = 1
        Width = 199
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 65
        ParentFont = False
        TabOrder = 0
      end
    end
    object rgtipben: TRadioGroup
      Left = 162
      Top = 17
      Width = 114
      Height = 72
      Caption = ' Tipo de Reporte '
      ItemIndex = 0
      Items.Strings = (
        'Detalle'
        'Resumen')
      TabOrder = 1
      OnClick = rgtipbenClick
    end
    object gbFecha: TGroupBox
      Left = 8
      Top = 17
      Width = 149
      Height = 72
      Caption = ' Fecha '
      TabOrder = 0
      object Label1: TLabel
        Left = 4
        Top = 19
        Width = 37
        Height = 17
        Caption = 'Inicio:'
      end
      object Label2: TLabel
        Left = 4
        Top = 43
        Width = 31
        Height = 17
        Caption = 'Final:'
      end
      object dbdtpinicial: TwwDBDateTimePicker
        Left = 48
        Top = 16
        Width = 93
        Height = 25
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Epoch = 1950
        ShowButton = True
        TabOrder = 0
        DisplayFormat = 'DD/MM/YYYY'
        OnChange = dbdtpinicialChange
      end
      object dbdtpfinal: TwwDBDateTimePicker
        Left = 48
        Top = 41
        Width = 93
        Height = 25
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Epoch = 1950
        ShowButton = True
        TabOrder = 1
        DisplayFormat = 'DD/MM/YYYY'
        OnChange = dbdtpfinalChange
      end
    end
    object dblcdusuario: TwwDBLookupCombo
      Left = 427
      Top = 96
      Width = 110
      Height = 25
      CharCase = ecUpperCase
      DropDownAlignment = taLeftJustify
      LookupTable = DM1.cdsUsuarios
      LookupField = 'USERID'
      MaxLength = 15
      TabOrder = 4
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnChange = dblcdusuarioChange
      OnExit = dblcdusuarioExit
    end
    object pnlUsuario: TPanel
      Left = 541
      Top = 95
      Width = 203
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
      object medesusuario: TMaskEdit
        Left = 1
        Top = 1
        Width = 199
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 65
        ParentFont = False
        TabOrder = 0
      end
    end
    object cbOficina: TwwDBLookupCombo
      Left = 427
      Top = 70
      Width = 53
      Height = 25
      DropDownAlignment = taLeftJustify
      MaxLength = 2
      TabOrder = 9
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnChange = cbOficinaChange
    end
    object Panel1: TPanel
      Left = 541
      Top = 70
      Width = 203
      Height = 23
      Color = 13165023
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
      object edtOficina: TMaskEdit
        Left = 1
        Top = 1
        Width = 199
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 65
        ParentFont = False
        TabOrder = 0
      end
    end
    object rgorisol: TRadioGroup
      Left = 8
      Top = 88
      Width = 308
      Height = 40
      Caption = ' Origen de la solicitud '
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Sol. del benef.'
        'Oficio interno'
        'Todos')
      TabOrder = 11
      OnClick = rgorisolClick
    end
  end
  object btnimprimir: TBitBtn
    Left = 504
    Top = 415
    Width = 79
    Height = 30
    Caption = 'Imprimir'
    Enabled = False
    TabOrder = 1
    OnClick = btnimprimirClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      0003377777777777777308888888888888807F33333333333337088888888888
      88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
      8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
      8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
      03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
      03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
      33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
      33333337FFFF7733333333300000033333333337777773333333}
    NumGlyphs = 2
  end
  object btnTipBen: TBitBtn
    Left = 588
    Top = 415
    Width = 112
    Height = 30
    Caption = 'Tipo de Beneficio'
    Enabled = False
    TabOrder = 2
    OnClick = btnTipBenClick
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FFFFFF0D390D
      0B360B0B360B0B360B0B360B0B360B0B360B0B360B0B360B0B360B0B360B0B36
      0B0B360B0B360BFFFFFF2885280D390D388A383A8C3A3A8C3A3A8C3A3A8C3A3A
      8C3A3A8C3A3A8C3A3A8C3A3A8C3A3A8C3A3C903C3C903C0B360B2885280D390D
      B6B6B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFF2C8A2C0B360B2885280D390DB6B6B6FFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFB6B6B6B6B6B6B6B6B6FFFFFFFFFFFF2885280B360B2885280D390D
      B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6002600002600002600B6B6
      B6FEFFFE2885280B360B2885280D390DB6B6B600280000280000280000280000
      2800005A00FFFFFF377837387638002600FEFFFE2885280B360B2885280D390D
      B6B6B640DE40057C05005D00005A00005A00FFFFFF3C853C3F853F002600FFFF
      FFFFFFFF2885280B360B2885280D390DB6B6B6FFFFFF50EA500A800A005A00FF
      FFFF3C853C3F843F002600FFFFFFFFFFFFFFFFFF2885280B360B2885280D390D
      B6B6B6FFFFFFFFFFFF005A00FFFFFF3C843C3F843F002600B6B6B6FFFFFFFFFF
      FFFFFFFF2885280B360B2885280D390DB6B6B6FFFFFF005A00FFFFFF3B843B3D
      813D002600002F000A310AB6B6B6FFFFFFFFFFFF2885280B360B2885280D390D
      B6B6B6005A00FFFFFF3C863C3E833E002600088008005A000028000A310AB6B6
      B6FFFFFF2885280B360B2885280D390DB6B6B64FBA4F4FBA4F4FBA4F002600FF
      FFFF56F156209820158915002B00FFFFFFFFFFFF2885280B360B2885280D390D
      B6B6B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFD
      FBFFFFFF2885280B360B2885280D390DB6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
      B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B62784270B360B2885280D390D
      0D390D0D390D0D390D0D390D0D390D0D390D0D390D0D390D0D390D0D390D0D39
      0D0D390D0B360B288528FFFFFF28852828852828852828852828852828852828
      8528288528288528288528288528288528288528288528FFFFFF}
  end
  object btncerrar: TBitBtn
    Left = 785
    Top = 415
    Width = 75
    Height = 30
    Caption = 'Cerrar'
    TabOrder = 3
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
  object dbgliqben: TwwDBGrid
    Left = 3
    Top = 142
    Width = 855
    Height = 268
    DisableThemesInTitle = False
    Selected.Strings = (
      'PVSLFECBE'#9'11'#9'Fecha de~beneficio'#9#9
      'PVSLBENNR'#9'11'#9'N'#250'mero de~beneficio'#9#9
      'ESTLIQ'#9'20'#9'Estado de~liquidaci'#243'n'#9#9
      'FORSOLBEN'#9'25'#9'Origen de la~solicitud'#9#9
      'ASOCODMOD'#9'20'#9'C'#243'digo~Modular'#9#9
      'ASOAPENOMBEN'#9'45'#9'Apellidos y Nombre(s)~del beneficiario'#9#9
      'BENEFICIO'#9'20'#9'Tipo de~Beneficio'#9#9
      'MOTIVO'#9'20'#9'Motivo del~Beneficio'#9#9
      'TIPPAG'#9'15'#9'Tipo de~Pago'#9#9
      'BCODES'#9'20'#9'Nombre del Banco'#9#9
      'CIUGIR'#9'20'#9'Ciudad de~Giro'#9#9
      'DOCPAG'#9'11'#9'Documento de~pago'#9#9
      'FECPAG'#9'10'#9'Fecha de~pago'#9#9
      'MONBEN'#9'10'#9'Monto del~Beneficio'#9#9
      'MONBENANU'#9'15'#9'Monto Beneficio~Anulado/Extornado'#9#9
      'DEVAPO'#9'11'#9'Devoluci'#243'n de~Aporte'#9#9
      'NIVAPO'#9'10'#9'Nivelaci'#243'n de~Aporte'#9#9
      'DESCRE'#9'10'#9'Creditos~Descontados'#9#9
      'OTRDES'#9'10'#9'Otros~Descuentos'#9#9
      'IMPPAG'#9'10'#9'Importe~Pagado'#9#9
      'IMPXPAG'#9'10'#9'Importe~por pagar'#9#9
      'DPTODES'#9'20'#9'Departamento origen~expediente'#9#9
      'MES'#9'20'#9'Mes del~Proceso'#9#9
      'ASODNI'#9'20'#9'D.N.I.'#9#9
      'ASOFRESNOM'#9'11'#9'Fecha de~Nombramiento'#9#9
      'ASOFRESCESE'#9'10'#9'Fecha de~Cese'#9#9
      'USUARIO'#9'15'#9'Usuario~que liquida'#9#9
      'AUTDESAPO'#9'6'#9'CADAP'#9#9
      'CANCCI'#9'10'#9'Cuotas~CCI'#9#9
      'MONTOCCI'#9'10'#9'Monto~CCI'#9#9
      'FECHACCI'#9'10'#9'Fecha~CCI'#9#9
      'OFIORI'#9'14'#9'Oficina de~origen'#9#9
      'SEGUIMIENTO'#9'42'#9'Seguimiento~expediente'#9#9
      'OBSERVACION'#9'60'#9'Observaciones~expediente'#9#9)
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = dsbeneficios
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter, dgFooter3DCells]
    TabOrder = 4
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = False
  end
  object btnAnulado: TBitBtn
    Left = 705
    Top = 415
    Width = 75
    Height = 30
    Caption = 'Anulados'
    Enabled = False
    TabOrder = 5
    OnClick = btnAnuladoClick
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FFFFFF0D390D
      0B360B0B360B0B360B0B360B0B360B0B360B0B360B0B360B0B360B0B360B0B36
      0B0B360B0B360BFFFFFF2885280D390D388A383A8C3A3A8C3A3A8C3A3A8C3A3A
      8C3A3A8C3A3A8C3A3A8C3A3A8C3A3A8C3A3C903C3C903C0B360B2885280D390D
      B6B6B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFF2C8A2C0B360B2885280D390DB6B6B6FFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFB6B6B6B6B6B6B6B6B6FFFFFFFFFFFF2885280B360B2885280D390D
      B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6002600002600002600B6B6
      B6FEFFFE2885280B360B2885280D390DB6B6B600280000280000280000280000
      2800005A00FFFFFF377837387638002600FEFFFE2885280B360B2885280D390D
      B6B6B640DE40057C05005D00005A00005A00FFFFFF3C853C3F853F002600FFFF
      FFFFFFFF2885280B360B2885280D390DB6B6B6FFFFFF50EA500A800A005A00FF
      FFFF3C853C3F843F002600FFFFFFFFFFFFFFFFFF2885280B360B2885280D390D
      B6B6B6FFFFFFFFFFFF005A00FFFFFF3C843C3F843F002600B6B6B6FFFFFFFFFF
      FFFFFFFF2885280B360B2885280D390DB6B6B6FFFFFF005A00FFFFFF3B843B3D
      813D002600002F000A310AB6B6B6FFFFFFFFFFFF2885280B360B2885280D390D
      B6B6B6005A00FFFFFF3C863C3E833E002600088008005A000028000A310AB6B6
      B6FFFFFF2885280B360B2885280D390DB6B6B64FBA4F4FBA4F4FBA4F002600FF
      FFFF56F156209820158915002B00FFFFFFFFFFFF2885280B360B2885280D390D
      B6B6B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFD
      FBFFFFFF2885280B360B2885280D390DB6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
      B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B62784270B360B2885280D390D
      0D390D0D390D0D390D0D390D0D390D0D390D0D390D0D390D0D390D0D390D0D39
      0D0D390D0B360B288528FFFFFF28852828852828852828852828852828852828
      8528288528288528288528288528288528288528288528FFFFFF}
  end
  object gbanulados: TGroupBox
    Left = 4
    Top = 414
    Width = 493
    Height = 141
    Caption = ' Anulados '
    TabOrder = 6
    object dbganulados: TwwDBGrid
      Left = 4
      Top = 15
      Width = 483
      Height = 119
      DisableThemesInTitle = False
      Selected.Strings = (
        'ANOMES'#9'6'#9'Periodo'
        'MES'#9'23'#9'Descripci'#243'n~Mes'#9'F'
        'CANEXT'#9'10'#9'Cantidad~Extornada'
        'MONEXT'#9'10'#9'Monto~Extornado'
        'CANANU'#9'10'#9'Cantidad~Anulada'
        'MONANU'#9'10'#9'Monto~Anulado')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsAnulados
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
    end
  end
  object dbgAExcel: TDBGrid
    Left = 552
    Top = 455
    Width = 97
    Height = 33
    DataSource = DM1.dsReporte1
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
  end
  object bdeprepxtipben: TppBDEPipeline
    DataSource = dsbeneficios
    UserName = 'bdeprepxtipben'
    Left = 721
    Top = 168
    object bdeprepxtipbenppField1: TppField
      FieldAlias = 'PVSLFECBE'
      FieldName = 'PVSLFECBE'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 11
      Position = 0
    end
    object bdeprepxtipbenppField2: TppField
      FieldAlias = 'PVSLBENNR'
      FieldName = 'PVSLBENNR'
      FieldLength = 11
      DisplayWidth = 11
      Position = 1
    end
    object bdeprepxtipbenppField3: TppField
      FieldAlias = 'ESTLIQ'
      FieldName = 'ESTLIQ'
      FieldLength = 20
      DisplayWidth = 20
      Position = 2
    end
    object bdeprepxtipbenppField4: TppField
      FieldAlias = 'FORSOLBEN'
      FieldName = 'FORSOLBEN'
      FieldLength = 20
      DisplayWidth = 25
      Position = 3
    end
    object bdeprepxtipbenppField5: TppField
      FieldAlias = 'ASOCODMOD'
      FieldName = 'ASOCODMOD'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object bdeprepxtipbenppField6: TppField
      FieldAlias = 'ASOAPENOMBEN'
      FieldName = 'ASOAPENOMBEN'
      FieldLength = 45
      DisplayWidth = 45
      Position = 5
    end
    object bdeprepxtipbenppField7: TppField
      FieldAlias = 'BENEFICIO'
      FieldName = 'BENEFICIO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 6
    end
    object bdeprepxtipbenppField8: TppField
      FieldAlias = 'MOTIVO'
      FieldName = 'MOTIVO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 7
    end
    object bdeprepxtipbenppField9: TppField
      FieldAlias = 'TIPPAG'
      FieldName = 'TIPPAG'
      FieldLength = 15
      DisplayWidth = 15
      Position = 8
    end
    object bdeprepxtipbenppField10: TppField
      FieldAlias = 'BCODES'
      FieldName = 'BCODES'
      FieldLength = 20
      DisplayWidth = 20
      Position = 9
    end
    object bdeprepxtipbenppField11: TppField
      FieldAlias = 'CIUGIR'
      FieldName = 'CIUGIR'
      FieldLength = 20
      DisplayWidth = 20
      Position = 10
    end
    object bdeprepxtipbenppField12: TppField
      FieldAlias = 'DOCPAG'
      FieldName = 'DOCPAG'
      FieldLength = 10
      DisplayWidth = 11
      Position = 11
    end
    object bdeprepxtipbenppField13: TppField
      FieldAlias = 'FECPAG'
      FieldName = 'FECPAG'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 12
    end
    object bdeprepxtipbenppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'MONBEN'
      FieldName = 'MONBEN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object bdeprepxtipbenppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'MONBENANU'
      FieldName = 'MONBENANU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 15
      Position = 14
    end
    object bdeprepxtipbenppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEVAPO'
      FieldName = 'DEVAPO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 11
      Position = 15
    end
    object bdeprepxtipbenppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'NIVAPO'
      FieldName = 'NIVAPO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object bdeprepxtipbenppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'DESCRE'
      FieldName = 'DESCRE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object bdeprepxtipbenppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'OTRDES'
      FieldName = 'OTRDES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object bdeprepxtipbenppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMPPAG'
      FieldName = 'IMPPAG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object bdeprepxtipbenppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMPXPAG'
      FieldName = 'IMPXPAG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object bdeprepxtipbenppField22: TppField
      FieldAlias = 'DPTODES'
      FieldName = 'DPTODES'
      FieldLength = 20
      DisplayWidth = 20
      Position = 21
    end
    object bdeprepxtipbenppField23: TppField
      FieldAlias = 'MES'
      FieldName = 'MES'
      FieldLength = 20
      DisplayWidth = 20
      Position = 22
    end
    object bdeprepxtipbenppField24: TppField
      FieldAlias = 'ASODNI'
      FieldName = 'ASODNI'
      FieldLength = 20
      DisplayWidth = 20
      Position = 23
    end
    object bdeprepxtipbenppField25: TppField
      FieldAlias = 'ASOFRESNOM'
      FieldName = 'ASOFRESNOM'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 11
      Position = 24
    end
    object bdeprepxtipbenppField26: TppField
      FieldAlias = 'ASOFRESCESE'
      FieldName = 'ASOFRESCESE'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 25
    end
    object bdeprepxtipbenppField27: TppField
      FieldAlias = 'USUARIO'
      FieldName = 'USUARIO'
      FieldLength = 15
      DisplayWidth = 15
      Position = 26
    end
    object bdeprepxtipbenppField28: TppField
      FieldAlias = 'AUTDESAPO'
      FieldName = 'AUTDESAPO'
      FieldLength = 1
      DisplayWidth = 6
      Position = 27
    end
    object bdeprepxtipbenppField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'CANCCI'
      FieldName = 'CANCCI'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 28
    end
    object bdeprepxtipbenppField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'MONTOCCI'
      FieldName = 'MONTOCCI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 29
    end
    object bdeprepxtipbenppField31: TppField
      FieldAlias = 'FECHACCI'
      FieldName = 'FECHACCI'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 30
    end
    object bdeprepxtipbenppField32: TppField
      FieldAlias = 'OFIORI'
      FieldName = 'OFIORI'
      FieldLength = 20
      DisplayWidth = 14
      Position = 31
    end
    object bdeprepxtipbenppField33: TppField
      FieldAlias = 'SEGUIMIENTO'
      FieldName = 'SEGUIMIENTO'
      FieldLength = 42
      DisplayWidth = 42
      Position = 32
    end
    object bdeprepxtipbenppField34: TppField
      FieldAlias = 'OBSERVACION'
      FieldName = 'OBSERVACION'
      FieldLength = 150
      DisplayWidth = 60
      Position = 33
    end
  end
  object cdsbeneficios: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'PVSLFECBE'
        DataType = ftDate
      end
      item
        Name = 'PVSLBENNR'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'ESTLIQ'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'FORSOLBEN'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ASOCODMOD'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ASOAPENOMBEN'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'BENEFICIO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MOTIVO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'TIPPAG'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'BCODES'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CIUGIR'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DOCPAG'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'FECPAG'
        DataType = ftDate
      end
      item
        Name = 'MONBEN'
        DataType = ftFloat
      end
      item
        Name = 'MONBENANU'
        DataType = ftFloat
      end
      item
        Name = 'DEVAPO'
        DataType = ftFloat
      end
      item
        Name = 'NIVAPO'
        DataType = ftFloat
      end
      item
        Name = 'DESCRE'
        DataType = ftFloat
      end
      item
        Name = 'OTRDES'
        DataType = ftFloat
      end
      item
        Name = 'IMPPAG'
        DataType = ftFloat
      end
      item
        Name = 'IMPXPAG'
        DataType = ftFloat
      end
      item
        Name = 'DPTODES'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MES'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ASODNI'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ASOFRESNOM'
        DataType = ftDate
      end
      item
        Name = 'ASOFRESCESE'
        DataType = ftDate
      end
      item
        Name = 'USUARIO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'AUTDESAPO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'MONTOCCI'
        DataType = ftFloat
      end
      item
        Name = 'FECHACCI'
        DataType = ftDate
      end
      item
        Name = 'CANCCI'
        DataType = ftInteger
      end
      item
        Name = 'OFIORI'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SEGUIMIENTO'
        DataType = ftString
        Size = 42
      end
      item
        Name = 'OBSERVACION'
        DataType = ftString
        Size = 150
      end>
    IndexDefs = <
      item
        Name = 'cdsbeneficiosIndex1'
      end>
    Params = <>
    StoreDefs = True
    Left = 729
    Top = 64
    Data = {
      2E0300009619E0BD0100000018000000220000000000030000002E0309505653
      4C46454342450400060000000000095056534C42454E4E520100490000000100
      055749445448020002000B00064553544C495101004900000001000557494454
      4802000200140009464F52534F4C42454E010049000000010005574944544802
      00020014000941534F434F444D4F440100490000000100055749445448020002
      0014000C41534F4150454E4F4D42454E01004900000001000557494454480200
      02002D000942454E45464943494F010049000000010005574944544802000200
      1400064D4F5449564F0100490000000100055749445448020002001400065449
      505041470100490000000100055749445448020002000F000642434F44455301
      0049000000010005574944544802000200140006434955474952010049000000
      010005574944544802000200140006444F435041470100490000000100055749
      445448020002000A00064645435041470400060000000000064D4F4E42454E08
      00040000000000094D4F4E42454E414E5508000400000000000644455641504F
      0800040000000000064E495641504F0800040000000000064445534352450800
      040000000000064F5452444553080004000000000006494D5050414708000400
      0000000007494D50585041470800040000000000074450544F44455301004900
      00000100055749445448020002001400034D4553010049000000010005574944
      54480200020014000641534F444E490100490000000100055749445448020002
      0014000A41534F465245534E4F4D04000600000000000B41534F465245534345
      53450400060000000000075553554152494F0100490000000100055749445448
      020002000F000941555444455341504F01004900000001000557494454480200
      02000100084D4F4E544F43434908000400000000000846454348414343490400
      0600000000000643414E4343490400010000000000064F46494F524901004900
      000001000557494454480200020014000B53454755494D49454E544F01004900
      00000100055749445448020002002A000B4F42534552564143494F4E01004900
      000001000557494454480200020096000000}
  end
  object dsbeneficios: TDataSource
    DataSet = cdsbeneficios
    Left = 752
    Top = 70
  end
  object pprtodos: TppReport
    AutoStop = False
    DataPipeline = bdeprepxtipben
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210079
    PrinterSetup.mmPaperWidth = 297127
    PrinterSetup.PaperSize = 9
    Template.FileName = 
      'C:\Documents and Settings\irevilla\Escritorio\repconquiebrexdpto' +
      '.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 617
    Top = 128
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'bdeprepxtipben'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 44186
      mmPrintPosition = 0
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'Fecha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 233363
        mmTop = 5027
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label201'
        Caption = 'Hora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 233363
        mmTop = 8467
        mmWidth = 6085
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'P'#225'gina'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 233363
        mmTop = 11906
        mmWidth = 8805
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 255323
        mmTop = 5027
        mmWidth = 14023
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 255323
        mmTop = 8467
        mmWidth = 17463
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 255323
        mmTop = 11906
        mmWidth = 1588
        BandType = 0
      end
      object ppltittod01: TppLabel
        UserName = 'Label21'
        Caption = 'LIQUIDACION DE BENEFICIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 109009
        mmTop = 12435
        mmWidth = 49213
        BandType = 0
      end
      object ppltittod02: TppLabel
        UserName = 'ltittod02'
        Caption = 'DEL 04/11/2005 AL 30/11/2005'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 109009
        mmTop = 16404
        mmWidth = 49477
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape103'
        mmHeight = 7144
        mmLeft = 142082
        mmTop = 34396
        mmWidth = 15347
        BandType = 0
      end
      object ppShape3: TppShape
        UserName = 'Shape2'
        mmHeight = 7144
        mmLeft = 125413
        mmTop = 34396
        mmWidth = 16934
        BandType = 0
      end
      object ppShape5: TppShape
        UserName = 'Shape3'
        mmHeight = 7144
        mmLeft = 108215
        mmTop = 34396
        mmWidth = 17463
        BandType = 0
      end
      object ppShape6: TppShape
        UserName = 'Shape5'
        mmHeight = 7144
        mmLeft = 87577
        mmTop = 34396
        mmWidth = 21166
        BandType = 0
      end
      object ppShape7: TppShape
        UserName = 'Shape6'
        mmHeight = 7144
        mmLeft = 42333
        mmTop = 34396
        mmWidth = 45507
        BandType = 0
      end
      object ppShape8: TppShape
        UserName = 'Shape7'
        mmHeight = 7144
        mmLeft = 27517
        mmTop = 34396
        mmWidth = 15080
        BandType = 0
      end
      object ppShape9: TppShape
        UserName = 'Shape8'
        mmHeight = 7145
        mmLeft = 15346
        mmTop = 34394
        mmWidth = 12436
        BandType = 0
      end
      object ppShape10: TppShape
        UserName = 'Shape9'
        mmHeight = 7144
        mmLeft = 2381
        mmTop = 34396
        mmWidth = 13228
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Fecha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 2910
        mmTop = 34925
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Beneficio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 2910
        mmTop = 38100
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'N'#250'mero'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 15875
        mmTop = 34925
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Liquid.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 15875
        mmTop = 38100
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Estado de la'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 28046
        mmTop = 34925
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Liquidaci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 28046
        mmTop = 38100
        mmWidth = 12435
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Apellidos y nombre(s) del'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 42863
        mmTop = 34925
        mmWidth = 27517
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Tipo de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 88106
        mmTop = 34925
        mmWidth = 8202
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Beneficio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 88106
        mmTop = 38100
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label1011'
        Caption = 'Banco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 108744
        mmTop = 34925
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label10'
        Caption = 'Tipo de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 125942
        mmTop = 34925
        mmWidth = 8202
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Pago'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 125942
        mmTop = 38100
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Monto del'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 142611
        mmTop = 34925
        mmWidth = 11377
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'asociado/Beneficiario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 42863
        mmTop = 38100
        mmWidth = 23283
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Beneficio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 142611
        mmTop = 38100
        mmWidth = 10054
        BandType = 0
      end
      object ppShape11: TppShape
        UserName = 'Shape10'
        mmHeight = 7144
        mmLeft = 241300
        mmTop = 34396
        mmWidth = 14288
        BandType = 0
      end
      object ppShape12: TppShape
        UserName = 'Shape12'
        mmHeight = 7144
        mmLeft = 171186
        mmTop = 34396
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Dev. de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 171715
        mmTop = 34925
        mmWidth = 8202
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label18'
        Caption = 'Importe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 245005
        mmTop = 34925
        mmWidth = 8202
        BandType = 0
      end
      object ppLabel106: TppLabel
        UserName = 'Label106'
        Caption = 'Pagado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 245005
        mmTop = 38100
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel107: TppLabel
        UserName = 'Label1002'
        Caption = 'Aporte (+)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 171715
        mmTop = 38100
        mmWidth = 10848
        BandType = 0
      end
      object ppShape46: TppShape
        UserName = 'Shape46'
        mmHeight = 7144
        mmLeft = 255323
        mmTop = 34396
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel108: TppLabel
        UserName = 'Label108'
        Caption = 'Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 255853
        mmTop = 34925
        mmWidth = 12435
        BandType = 0
      end
      object ppLabel109: TppLabel
        UserName = 'Label109'
        Caption = 'de Pago'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 255853
        mmTop = 38100
        mmWidth = 8996
        BandType = 0
      end
      object ppShape47: TppShape
        UserName = 'Shape47'
        mmHeight = 7144
        mmLeft = 269082
        mmTop = 34396
        mmWidth = 13759
        BandType = 0
      end
      object ppLabel110: TppLabel
        UserName = 'Label110'
        Caption = 'Fecha de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 269611
        mmTop = 34925
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel111: TppLabel
        UserName = 'Label111'
        Caption = 'Pago'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 269611
        mmTop = 38100
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel115: TppLabel
        UserName = 'Label115'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 245269
        mmTop = 5027
        mmWidth = 794
        BandType = 0
      end
      object ppLabel116: TppLabel
        UserName = 'Label116'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 245269
        mmTop = 8467
        mmWidth = 794
        BandType = 0
      end
      object ppLabel117: TppLabel
        UserName = 'Label117'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 245269
        mmTop = 11906
        mmWidth = 794
        BandType = 0
      end
      object ppLabel119: TppLabel
        UserName = 'Label119'
        Caption = '(Montos en Nuevos Soles)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 114300
        mmTop = 20373
        mmWidth = 38894
        BandType = 0
      end
      object ppImage3: TppImage
        UserName = 'Image3'
        MaintainAspectRatio = False
        Picture.Data = {
          0A544A504547496D61676543290000FFD8FFE1001845786966000049492A0008
          0000000000000000000000FFEC00114475636B7900010004000000640000FFE1
          036F687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F003C
          3F787061636B657420626567696E3D22EFBBBF222069643D2257354D304D7043
          656869487A7265537A4E54637A6B633964223F3E203C783A786D706D65746120
          786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A786D70746B
          3D2241646F626520584D5020436F726520352E332D633031312036362E313435
          3636312C20323031322F30322F30362D31343A35363A32372020202020202020
          223E203C7264663A52444620786D6C6E733A7264663D22687474703A2F2F7777
          772E77332E6F72672F313939392F30322F32322D7264662D73796E7461782D6E
          7323223E203C7264663A4465736372697074696F6E207264663A61626F75743D
          222220786D6C6E733A786D704D4D3D22687474703A2F2F6E732E61646F62652E
          636F6D2F7861702F312E302F6D6D2F2220786D6C6E733A73745265663D226874
          74703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F73547970652F
          5265736F75726365526566232220786D6C6E733A786D703D22687474703A2F2F
          6E732E61646F62652E636F6D2F7861702F312E302F2220786D704D4D3A4F7269
          67696E616C446F63756D656E7449443D22786D702E6469643A38384242323139
          413845363945333131393530364335414333303344354330382220786D704D4D
          3A446F63756D656E7449443D22786D702E6469643A3442453033434441363939
          3831314533383235463846314639373642313741362220786D704D4D3A496E73
          74616E636549443D22786D702E6969643A344245303343443936393938313145
          33383235463846314639373642313741362220786D703A43726561746F72546F
          6F6C3D2241646F62652050686F746F73686F7020435336202857696E646F7773
          29223E203C786D704D4D3A4465726976656446726F6D2073745265663A696E73
          74616E636549443D22786D702E6969643A384642423231394138453639453331
          3139353036433541433330334435433038222073745265663A646F63756D656E
          7449443D22786D702E6469643A38384242323139413845363945333131393530
          36433541433330334435433038222F3E203C2F7264663A446573637269707469
          6F6E3E203C2F7264663A5244463E203C2F783A786D706D6574613E203C3F7870
          61636B657420656E643D2272223F3EFFEE000E41646F62650064C000000001FF
          DB00840001010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010202020202020202020202030303030303
          0303030301010101010101020101020202010202030303030303030303030303
          0303030303030303030303030303030303030303030303030303030303030303
          0303030303FFC00011080040010403011100021101031101FFC4009C00000102
          070101000000000000000000000007080103040506090A0B0201010101010000
          0000000000000000000000010203100000060200040207030808030901000002
          03040506070108001112091314215394D415161731180A516191222393193941
          D192242556B778A133957181D336274768C81A8A110100030002000602030000
          0000000000000111213141516171810212B1D1F0A132FFDA000C030100021103
          11003F00D6A7E21FEE59B05B49BCB7D6B9993691C5B5B75BAC97FA8E255233BB
          2D6E8DBFC9600B4D8FCAAC49B22467109659227893A35996E1AC01806B6AC924
          A7000625672AC7CA76BA573BD938DFE830CE5F9CC167FE3E8E203C537973F14C
          FC9FF305CFF473E7C047C51FAE3BF4E7FF001389A1CE6A76E3EC5E91DB91DBAF
          5BACC9157F30625E894AD4685C570A2D336A4AA4B52A6293F8C96AD3B74BE26E
          982BA54A25411079F234B116704A3408B891EC67AC774A5D8FD70A1360D1340E
          3C96F0A6EB4B64A8F9AA32B06C3F5061ACF2A1B30966494DE732D237411193BC
          3060DE8EAC631CF971D50BA70070070070070070070070070070070070070070
          070070070070073E5F6F006338CFD9C01C01C01C019CE31F6F010E78FCB8FD38
          E0239CE31F6F00701E379DD8FF0099E7703C7FF30F617FD5092FF5F1CE79564C
          D5D9E7B9BBD51A1D8D6AD30B9555526C7C32C4AE38696B2E5CBE28680B3CA933
          65567BA956B3B47D421330A8A5A9990E4C721CF9A00B24733787D64380DA2EDC
          D3FB7F6E6ADA1740F5C2452D7179D22D3BB9A4D18871CB0E6C6D76B0F5F6BF95
          CEA7B2E94CCDE4A6486373E4BA42664C39C57A240158A42495D22180AE131738
          1B3C7BB4D771C945FD26D5F66D44B6CCBB218CC9E49288C383735B332B2C5D71
          AB486A942BB15EDD9B6B60C59FD537A925B5CC0EF940E67A730A4A69C60041E1
          5F2B4B34DBCE83B97596CC91D377E56D2BA9ECE8A8C803E43E62D8636B9A6256
          1385081C1319FB448EACEE89861391AE4661C89610209849A60058CE64DF6AF5
          F3ED63FCB47403FD9BEB7FFA4713E3AA15CD91DC8D57D4065677FD9DBF6AEA49
          048CF3D3470B9F4A9BD9DD64A6A31A62D7E238C19198FD202DB32B89CAB1A34C
          781284D088DC8022C6780E6E7B8B7766D848C774DED5F59E98ECE449EB4E76BC
          DA2332C360CC356D8D12B18A95ECD3FD6B3B0229DAD8FC81E111E18EA029B8F2
          9BD7A339B14807D41028EAE52E6E23A1D19EC86F0EA169FE1903B37B1B52D28B
          24850D4C7D9E75306D6C913E2228FF002C738B5468261EFEBDAD3A9FD99CA8A4
          C24E519E818F19E28CC59368F5BE4B492FD948EDED53BFEBFB4B4B9BF3ADCACF
          3C8E39D6ED6D2CBCC2F2B1CA5C8DC0E666F0B38B190AB01A680C4E6632033011
          6338E013A6FDFDD27776DA7DE1A369E8E776BBFE4B248852CE0D161C7DCD2597
          228764E2E5C82247205AA0B732E307938257A80E7CB235261449A600D3C900C2
          CE4771DD0B575D116DA0DBCD7F74AD1559CD34BA39B345971A76605F6C3EA546
          E2D75E372D6D5CA42E12A52D2B8B5B9484E0C38A41D4A8CC05380668428AD8EE
          65DBDE8D992CAEEDBDD0D6C824EDB1C4E697A883DDB90E2E431E744E6E0950DD
          26694EE8A164656A737D0616BC29C60F4F3FB33C2E02CB2BDABD6783D3683626
          5B7F53EC5423AFC33E15732EB0E2C1AC9D7E34B3E1CD196B9A96E638F38FC457
          872493E0A81F5998C871CF38CF2045275DCDFB7BD66E155B5CF37275EA28AEEC
          8DB24D2B0CBC5971E4E92530B9264F047A665AFC2B13735441F4C4C6811BA2E3
          52A152324C096688458B1860BCDD3DC5744F5CACA69A76F5DB2A22ACB39E7084
          C221732B0D81A9E9B53B9929D5362C93146AAC950E40E8955166A550EC344428
          273D650840C67385C0576E3D9BD74D798AB5CE6F6BDAA3A7E22F981E58243645
          83168735C8BA1312AC408E297C74440901D84AA0B33A11F8C3F0CCC67972CE39
          8615AF5BC1A7FB60ADDDB75AF65A97BADE581265C9EE3F5F5811F90491A1AF0A
          4A47F17728DA559F1D46CE258A0B282AC69829C468F01C0F22CE31C0393757A6
          763253287A756C674EB5CDB19519EE8B933792ADE1ED7A76B666A4C6AB34A01E
          E6ECE4A8A4C9480E7269E79812CBC6442C632090C4F67B5B27B66C9293836C25
          2133B961C27404BAA58A5AD0490D99171B12B290BD824304687E572765133AD3
          824ABC294A5E539A2C00CE916718E0257DE9759BEB07DDEBEF1345FD7DF13C2F
          A21F56A05F56FC6F85FC77C0FA6FF1FF009BFCC7C17FBEF4793EBF2BFB6FF97F
          ADC065D695CB50D1D191CD6EBB52B7A7E185282519B2CB46731880468B58A39F
          974837D9639B4B60551DD39E8064DEA172CF2C7A380ABAD2D6ABEE788A29F53B
          6440AD782399AA486D9A56B308F4EA26BCF446E49584229145DC5D1A151C90EC
          640680B3B392C58E42C633C02713FDB9D53AA27ED754DA5B35AF95B5A0F7F0DC
          B356F3EB9ABA87CF1DB0F4779766136C4243236E7F5B876521C969725A717981
          E3917D59F47011BF5DA54F9584FD8E97BEEB5A4AD1607B81B71F614D98D92C36
          180295F2588BC2B639642D64A230501C6750B5F942DE050B529A131D932A2B06
          67C3098178B8B6575D35DCB6036FFBF295A34A961EAD34587705A507AD012552
          8029B2B93B00A66FACD8783908561393829FAF2560C07572C0B1CDC721A36F07
          710AEF519669C165CD693588F66B66AB3AB9ED5CCECC636029828F98C7A6CE72
          2BB580D03984A5EC51C72626D4D95E6FF84604E2009A703232F3C27390F322D7
          DD173A823F5A508BA2A798D611513C065163C5AC587C86071B1479116E2FC17E
          97B4BC2C8F34098DBCE09EB3CC282FCB102C0CCE90E719E028A9CD8CD7DD8940
          F0EDAFF7AD3B79354755A640FEE5505990BB29031AE5648D42346F0AE1CF4F49
          DB152A20191940384011810E738C6718CF017B925D14F43A3C8E5D2EB5EB58B4
          4DC6505C1DBA51239D461963ABE686BDA88C950F44F4E4E899B55CA4C91A435B
          F0DE59B95795A5893E0BF14390E0304AB9F64505AEA7724BEAFAACE789186C5B
          71D0EB19B5B186B788C12048666F6264834A148A44E6D25BC556CC461A5DDC94
          A84E61CA51983505966E079C85EA9ED95D73D882DF0EA06FDA56F12A306A6224
          86D3F69C1ECC0478F59E2F9325EC70B7D7AC3518AF040F2584FF000F23C005CB
          9F2CF2723493F7E5DA7F9E3E0FF53D3FC3FF00FD0E7DC73CBFC990CE5F75AFA0
          9F39FD31F17E0FD5E3FCC3FDE3E33CFE33D5FB3F31D3FA9C66FF002AE49ABB8A
          54F38FC5053E8C5D28232F10D71EE19B2C63630CC4CC971591DA0DEF567B951F
          197E2C61196B50492EA471F4262234224EBBCC796342228D163333EDA34E33EB
          CF73D56E2C86E19ACFAEB6DDD9496DAF29D5FF000B648CF71305B089F8C65322
          6D881064878605ECAE85E5A53322524A4E8C90010129C050024E33737E63A4BE
          F756258276AB6D54B5CDDDBA3767DBDBF1A574DED486BD7A270D52495D37DAFE
          B9944CE997C5CC0E2A50BC452A5BC642E8689A4C11C991BFF50841F1D28041DC
          F1EE9DB55B71EC0DDEF9D8AB506B277B5664E55FFDF7B66A1A289AA785236F3E
          235CD67414A60316579CE7CCAC8E4364964BEAD6F4261B94898E71C6405F3208
          C932E7EB4AB4EF33B39CDFB54F66AB0A62B5649E78595BE353E66AFC70DD2527
          D61565BD5CE2B3811EFCACC35CD744EBD2654E44332238D114D49D5984A60964
          F2070F97108F4B3ED65FCB4BB7F7FB38D6FF00F48A29C6C71F554D055D7774FC
          48FBBB03DEC74779657FAF38B85A6B9A754C99E638DD268D5253D8ED57078337
          9ADAE8DAF6D51B21BA42AE5AB9334284A6B839E4F54663251EB303C73F2D5255
          BD3A0BAD7A19F883FB66567ACA4AB8B571675CDA9168AEAA8E91BBC952D71207
          2D8DC4517A38FB83F383B3EA6649395152D7929D6293CC214987E0B1052F9624
          A4C57CA2836FD7A9AB5EDDF707EE13B15B63DB6769BB9FCD49B25C18982B2AB1
          C24C38B514D2AE5B35606B699CB74690AA7DCFCBD1589A4648C1423F089214DE
          B44612729C90A533B9B80BB6B9D2DB49AEB56F7BF89675276E3547B7E5C5A2D7
          85935B41B63A36FE04B12B3236E90D4B01650CBDE9A1B1B5548871C91BDA1F0C
          A18DC96B6A44BE74C586A009F8B1DF852161EC25DAB20D61E9EBDF744B7E7D3D
          7F9BD1C9EF42F562B442FE14D5EC353D7516952B707D942434A39C1C82ED61BE
          B8292DA129EDC80224E250ABCE79E30B25F18EE4379FC397DA72AEDF262B1F63
          F65ACEB09AE9CD5CB59914D775AC2A5638B369D6990DB1F9BCAE712774392AA1
          3333A08F32B3261E1B7095C1767908C5840111403DF18B0BE3995A15DC9EF5DC
          3B4751BB116C46E5C49FECC993F595B4ECFB672DA31CC12B95962717C9455D59
          2F20E830E48E6E869B2142C4A0D5AEAA3CE80C5A8892D47920327881ABCD7E97
          CB55762AEEB74EBC2F7CC426A7DA9D3392C2A2B200E32BA29229ECE65D1F9AE0
          E2F00F0D02C7043016E0AA28BF08B0A94E316318C9A2EA91FE654F97623B476A
          0407F0E9555DC01A1A2666ED5AD8DD2D623D58ABA66FEB913EA1B3AC563829F5
          F2A87A970510F6F8A45E3D242F0DE6244699CB0A5BCAC9AA46030D2449F8C447
          9A24583DA7F5213FE1BE67EE306B6CE5CF6F14A18858ABED1709BC855A67142F
          97FB7D359AF15C416AE5116C445AA20BC034E781281DF2E290B37CDF96C891E5
          51F5B9E57B2BCB766F4E65DDB0BB2F6B1ED0E9DDABDC736C9E22D60BF5194A43
          EC496560E08602A6DDB3E978832BF587174EE331358DF1140D1266E666D4E615
          92E2851AACC4A993100536E2AA790D74EAF1FF004CFBD276C87EAD341EDAED78
          ED60DD550C5A4355492F73360215316699D9AD35DCED6C02C3C80F5CA9AA4105
          981ADEF4D872C5004A79A1C00B27AB1812AA611DA877A189027FA8509800A432
          487FCFBB9BA310CC4C616E8730CD622193ED4D5AD0A2450D90251056B04A1B12
          2B306897119C9A94FE430E3D19E353C0493BA16976B0D37DB6AEE9BD174EC128
          5B1B542B270B875DAD3A7630C705B32ACB0AB74E43C333E304E5A1127921A6BE
          650E52BDF985270DE922A3C2A846986789874156BC3B7169AC4BB7F5AF5A4729
          383B19D0EA3671358D5B0963CCE3BBD92DA8EC35CA52D17B916C9A9899B1D742
          198A229EC4FE6AEC2D3DC03911A664B1081C2434F8F6C1C5F682BFD2B465E834
          1BB916F3B568C6BADD36D496C32EA286D6F41336C3D78C4FE15533B52C68E4A1
          3C5665713F30AD5CDF1C8F3139399ADE8CE527012A1C1461D2EE3CCECD7E773F
          BE34FF00622EDB5E0FA391AEDF1389876B0DF6B15643AB9B3AAFB5E87BF2DBD5
          56DAF26F4CCDDA20F59B142D3FD54ABBE747125C1C5F18122A756277C202B278
          53E3207E86DFB50340B4753EAA55C23296A7360C57056B13B1ACBBBADA84C4EE
          19E6C74A2C98F249649AD6B1E7F356F90BD4E1CA7AE2FA7B875A8546A44E4A90
          A7480252964940540D06DDB4ED7146EB5F7EBA76AE7A769556F01DB5EDB2C314
          1CA256E13E5F13694CE5A98E096A1264AF2A97BA2A8CD2C62BF979911A95071E
          CED6853B78CCC89264594F1EFF00A1B54BDA939A515B9BB2DB4169E8187B8FD2
          37DC72B61314B610DB5C599B0FABF1AACA008E24EF45B051375485A1B26155CB
          E5197095A61C10E4EECA1D5E9C00EADEBC6044A30F30D7F64229DBE2DDA9FB53
          BD6ACD275423AB3F8C0D795BC86BA72A81244DEAB190BE365F2F778D2136ACA6
          4C091EAB1569A748CB54F1133D2236FF001C84EA0A4E34F94868A4D4D7A9050F
          73D35511DDFBD7CD2945A6330B4754607AED3ADE0956AE6A756951A48A5C578A
          9B722B52C22457A575207BAD227308055E992A972291E559E05F235EDE7AF4C7
          94DE4745EEBA1779B237496EC6EA3DC7A8BDB3B6AB542F1825F159C46CCB257D
          45425555CCEF50A70FE8A33B055B5D47C06F45A54A6311A891C549E3C156D2F0
          B1AE4AC2886D6024472918931DF62FDDA9B47EA99F47671B297AB430DE8BE29B
          81BB51FD418D4FD81A1FA17AC558B16E25AEA1C1657713716CCB337DB93BB39A
          DC1E9E260328D90284816C401525266F015956DC84AAABB268866D67514B595A
          B09B76EDBBBFBA0F71C7CD79D603D8A04E044CE6355ECF5C92091D92FEF16AAC
          455E4361D5B3439872E6F6E061DE586E24904A75279E12B2C18BDECCB74D636C
          697DD62ED5B5CE8F4C229BA5AC75B636335B6FBA3658CA3AAEF9B6E3F51D9D55
          5D3148B55F59CC65D059FB2CC7CB224A4A25C5B7C8468DC42A52E538C2A4132F
          FDC9FF00FACAFF00EAEF13F6BD7B3895EEB0A0F45DD0F7F55A434E4AAD36E4EC
          2284CA539A610A139E45AB2334A3C838192CC24D2860EB00C3E9E7CB38E333C8
          5BD277BFDEE4CD891C8E74A19DEF36E654B1A6BDC27ED6EA65E770DB98914771
          144C98BBF1C2207CA95BB96C18C9187C5383E442E79332BFC6CF5F0FB4FB8634
          FF00B6175CAB5DD7EB149A484C86B777D8F78DAF795EF8930E93B7ABAA45082E
          BF7C92BCCDD79C7BE3A16EAC24F59E51E60B272B165408591E79F12F28634F77
          FD86FDAF903D635EA5A05575736958570C69281A8A29F0B995991D83C5A4E6AC
          7AC0B2A16379AD75EB77809FA71828CF133CF3D58C05782BE79B296859342D03
          ADF275ACC755FAD2E5703B55A89131A342F08965E0FCC1249F09E9E4BC655BEE
          153A4692E5378B91652978C8439E9E58C3781EBA9DAC7F968E807FB37D6FFF00
          48E27C7546AA7B93FE1F449B6BB52DFBCFA95B472FD2BDA23BE1C6CCE4D176B7
          A5AD9267A69662632DF3561758ACBA172880CC0C8C17842E4626395A37720A2F
          232083C6B142B931737D86E711FC30F2763DAAD5ADC296F707B12DCBA2A4B36B
          8B86F6975AF03719A3FDCF33AEEC16D94B6258E3DBAD946BA4218088A3221642
          42B8D7F3CBC939521100BC948899F5DB0B9EDE7E1F6964AB6D26DBB1DBB375EC
          1D09B9ADA39DD6DBED3186F7C5D1796BCC95612E72A796E708D4B62CECD29E52
          F69C0E4E4D4B0B766F52EBCD493E544108316B6C2A543F648B56BAD3ADEAA0ED
          EEE0773EC25BDBDF1871679AD916323757DAEA0CF6A9A0D6804B2395B3ECD1DD
          E9CA5CE080C2923AB99AFA9C4B903737272C84C0420C8D101D976FAEDA2E1A39
          DBB1FB44155D24D8CB1ED1DD494168A481662A5377D5D29D40030B889F2B91E5
          665806E7E2721B863CCE71CBF678E5CAC64504FF00B3D7691FE169415D744C96
          E76FD836CB92C23266B96975D1D5EA540DAAA16D10D5EC0A1BCD99CC86E21584
          3708623707138E91F2E9FB73C48C81AEAA43F0ECECFEAA4D2CE836A97764BA68
          3D3AB7E5637A985590E81220DAA9D80C30297E171DB1954A543446E7D88E124B
          77CE0DAD88169A020919E8CD012023844570319AC7F0C038D6BA65BA7A869773
          D3B991B5D636BE4CDA66CAA8E3427419B284934BDFC86F766705A81F9ADC64E4
          4AC25187814A02D29A9BC4C16678990855514365D6FF0069176B53B3AC3FB55E
          2FD4AC8E31783D470F36EF156827146BFE974F23F37F1C35F066880F4A4BA858
          B09318F8C08C2702C1B91199C64194C5C50A594F685739276626FED318D814A9
          5C5144A2F1ACDED9ACF26243B31CBB1BAE2F17E9D026A518020F021C36631F19
          C998C67CC6739CF32F85650D7DCF3F0D34A0751E8AAAA4F77DF6A5DBCD1D88BD
          C1983601AAB7529DA2671B576DCFED88B1208B249DFC5226E5075D63B8212D46
          17B994E680CC92A53F40B1802BCF4642BFF0F0DF7626DAEA3EEAEC3F7359FDFD
          7650762D713E9E9B39A7DAC11A90A1AC2C96B9F4760952B0B1CD199BEA68B9C4
          A4509D607C1710295EACE70C12508D191956C48DF96DBEB8A8DA0AF60D054F32
          0C1870DD82D77BCB2EA362C487E200A1EE1885AC28CE11E5D1A7CA8A4DF2B791
          F37E20FCAF8DE2F846F4F40A8AFDC8D7C3B6C355AFED6B4F2D0C0CEBBAAF94D7
          209989971230C685246F310FC544C427167F8AE12E0CCE72479A23ABECEB0FDB
          C029B65400760D453FAB30EF968366D5BCAABFC3F811855E5AC5258C2E8EE1E0
          0DA23C90A9CA3CADF1F04E4D0E07D3D1D78E7CF80D5840BB726C76AA0AB49BE9
          7EC6D60D76421D56D6ED62D858A5FB4F482594D5F8A358A189E0D5A5CED24422
          C58B5875158AD51E50E0DE71299D5E1A1C5B54272D425F3288B58395E033EAF3
          47F611B36AE09BD5B25B479BA6CB83D2973552EB4A56F531709A39AA273D3E02
          FCD4C149C41E66F2992B34802F90B506BDBD3F3C3DB9CA047214DD4D889BC94D
          C581AC788583DB6E2512B0239587761DA4EDA75AAF54F0E73FD0B9A4A6BDA3EC
          6A09F5D917C624F01A52B9D81A764F775325FC756AB51F0C812E706513929370
          C022C9F0318990142D6FEDD8D9B2FAAFBF8CD5AB34AF52E89DCED87D7F986BA2
          39FC2A40EB612AA9F598749AA1DDD398CCDDF9A2C25524DA39AD6EF6F9955283
          8A931E9DDC97571C9C7A8E9139C1B41B2A99EE22C1674EE63AD7B7B4DB857D3F
          7148E69A9EDADD7D79B05254AB8A6D2D02FF00A596053B6853724511A723CA02
          ACB44813BBE493C02C10B4A09A3C714226F1DAD1D57EBF25602F6157AADB749B
          92C9DC2F3B26F3014CAA22E5B5AC68D247083D6D288E4E8884F4CE2B34818827
          8E92F785691A0051F85E6AE2F2A061994CB4D76AAE68FD5D6D593B2155D6DBDB
          424DE64ED4A5DBAFD4CCB1BAA143584F5BE30D538A2ADCA76C9B7662BADE80D8
          A4C6CB54E66E1E58D7A0704EDCADA8D46A9B8472C0CBEBFA3FB844CACAAFA5FB
          45B655430C02B279CC88AA874F2A29656A8EDE7D293F9441F59A7D6C58D69C8D
          4405016238FF009658D3B5815283C3956BD4812961182F7A81AE86EABD2D8A8D
          44C713C37EAADFD65E6421610C6F19C5DF7B58B74059F0D20747700331B0CF7E
          1FE360EC614F96F1B0593E27840062C776C09EC4D92BD9CD31B229E19B4147EC
          86E25EF5258D20AD8E9155EE110DCAB3DEAC2B3686B66AC4B3567512985BAA55
          0DC984EA81D9B1D5138B592E2872467034A30F99FE87EE86D43D52D2CDB8DBAA
          E19F1AFBB1D436C157950EAFD32F710A91EDEE9BB11B258E4AADC72B2AC09D58
          53F7290C6D3AA6F694C8D7313447D6A80389C95D8F20809705D7F85BABF99FE6
          3FAE41FE6E1FC517CB7D3F2BAFCA7D2CFA69F43FC7F9ABA79F2FEF3F30747574
          FECBC8F3FDAF0A2DC1B7E21AEDD57E6AB6FA5FD7ABAC3248FDAF7B2B67C86DE8
          1DBADCD0B15C512BED8ABD5C96475DC8DD12967A38F4B23D213D7149922B34B3
          17B6145AB2422C64D093998DB573F5E09BEA8CFEC0BFAB880F04DF5467F605FD
          5C01E09BEA8CFEC0BFAB8070DAC9AA57FEE2DB719A4B5DAB4935913E93B82342
          048CCDAACC6B6144AD5149CE92CC5F7C2C35C5228D7E2F8AADC57984A54E5079
          885F663323C207B236ADD2C5EB76B56BFEBE14F19910690A5EB2A98520C94626
          F8E9B5FC319E2C7BC0131861C6242DCCF6B11C127231F8201E03CF3CB9F1D50B
          CF007007007007007007007010E78E7CB9FA78039E3D3F9BEDE023C01C01CF1F
          6F3F47E5E00E021CF1E8CFA3F3678039E33F6671C04780B32C6162725CDEE6E2
          CCD2E0E4D23198D4E0B5BD1AA5CD860F1C8C31BD59E418A118861F467258C39C
          E3EDE02F18CE33E9C7FDF9FF00B3F2F0073C63F37FC38039E3F2E3F4E3808F00
          7010E78FCB8FD38E00E78FCB8FD38E00E78FCB8FD38E023C0483882541432541
          452824D0E4269271603493039F4F2194308806633F9F80B4FCAD19FF002E317A
          3ECFF086FF0077E00F95E33FE5D62FFA437FBBF007CAF19FF2EB17FD21BFDDF8
          0AE46D8DEDD8185BD022420333D46051244E97060B1CB964CC12006062E5FD39
          E02BF803803803803803803803806A3BAB6ACEA95D739C58B5BC8AAA89CAD955
          C54848FD73BEA48CC1D1A07495B3363D832F8EAB9A230DD2A5ACCA8F21846F8B
          DB5872F6624C38AB4E8F271980D5CC1FB8E6CBD9578D13128D06AC87C2A6708D
          5392461A76023E5D2F3FDB263B88996E2F19856B1E74B09C1FA2721AAD4C54B4
          ACCC4CA8E5C854293BCE2E72C33B835ADE084F1A3BA6ED1331E49D292600E6BC
          9A0E617C5DF5DB96B5DED0191EAAB8D75B35ADF5A5A95F3B3939C9958ED266AA
          2A5B5244BDD5D1B508CD129610BC031F0854427C94E3A09BD9B05B0BB028E154
          AA8A7566BA7D54DB0CACB5C503B45D575814BEB8C2B574E6947523D96FCC9177
          67B9C59572BFB51928C094320D035E4E6A2959A4F59CF40D49CF742EA9842A80
          AB7167C728A75766AED6618E6BF278BDEAED7DDE712BB9F684975A364D7D71BA
          CA472922230B3CD7C893818AD24970980C6E7F35AB00DD527868919A19DD36F4
          717FBDC88A3B57E2AF123143A5EDB61CCAAE78CBEE9CC75E36C7341D82B364EB
          F88CFD500D056D5B182941CD4E8E71D91203DBD51CF0991B5E0E3108F5391D50
          D80B79EF58FB8ADBA8EE8ABAD09440761EF82E9CB927E82D2866B6393241290A
          97E55907975E075746AA6913F27526BC2D8A28718F2A561725CD4A8E20EC0F87
          21A93F7744D8322ABAE64245974DD759328EBC2C268B3AD0A85D2511EDACD8BA
          82CC570E2B532976EAA2D2768C3D94B5A028D4259244DEA46B27253C27531A6F
          CFC39E1190BF00A04E77B2F297B4EECB4CD9F2B1A767D5AD2B7C8619DBD5F639
          3951B18FCCF14D7D69B0582E5597656D68C71E011D7E90BCA80015455A8684B6
          F2C2853399520214E490C17603B81DD53498EC5D215CAD93B6445D284DD36442
          CADF0C90C2B63A84B075A2AC873DC6275E6D82412597A5895BEFCF8B7E5F58FE
          D6C4E0F284E6D5ECD937193BC57907C7BFDB892DD73B4E8CAE51DE548EB4422C
          BA7B656C590DCD7557B26B252A0945203A6D443E1CD0D0C5348721201292276E
          425C154689638929028DAB2072389CE41AEB47739D87739A51E078AFD04064B2
          18A415A6F2D5C974294A7B42212C99EAE58F7EAAB0A17E4E62A67E7D72C3248D
          B3350D73C30236FC0D63835283487B4232CB781AB149FB93ED141A0BA82E9255
          B5A2FB96C6AF3576EFB56AB4153BDC4E2F634436CADC8A404359D0A091D9CF36
          EBE4EA848D2F705EF8AD1B53B14947F0F54EC4A14EB3CB168F3E4397DD9DCED8
          FA6F6B6B2A16A66CA922CCD25AAE3D62C524D79BB1313876C0D94E773B7D72FB
          AECC33A72746FF0096DFA39075817917C09049E4662F786A330D796E25778EEE
          859E2B7B5F95876F8B42CD852D324D7213BBB73D6513537737D83602065659DF
          72C90526800E0D6D2AD9E62F71D80C124B9C33109141294099BD30402C230F2E
          1FCFEC2647EEE6E952F207074BACF855955C466C3DBCA3DF08A975C2D14B632C
          2F5D68F7EBAA0D7C31B4AA982F657F7898099C6CAEB1821427683C632D436B90
          324AB24208BB87740DAD470BCB5065DAE0535A6D83B32B8FBE5B894C04D085B3
          C7B576BEBFEA98CC85C4CB45055E6BED913A992B8DAC766A93188B0DCC8AC86F
          24D7C116103F0335D94DEBDA56F6DDACAB489EC1ABEB61B7481D6E8ACD16BBC5
          0EBDD55353588D5B57CFEC2576CBDA9589A53165987292BB62307AF89931A934
          7CF6E1A071F8E275ADA638F50A74F77776C18CEBD65B1894D16F7AE755834EA0
          11EBF1155B377F40B526C744EAD9959FBA92F31B67E9232B687A9E392A3CE42C
          D1F355832352254F0EC81B1B8F52308FF101BD7EEB1F3F7CDB527CBDF7D1FBAF
          FDFF007E9ECCBEEE9F427E17E77EF7FF004F3E29FF0097FE77FF00D37F3FF1FF
          00913E71FF001BF8A7CBBFB3E16378DC01C01C01C01C01C01C01C01C01C01C01
          C01C048388215146A752494790780651E41E580D24F28C0E4232CD2478100C28
          C0E738CE058CE33C07C0D2A530D4EA069881A849834294E112588D4A13C2101C
          14E3C872611834000E07D3CB9E3973E011CAEB5CA8CA9251299B57157C4E272E
          9A0069A45236D6FEA7656DA6B9AA7B1B1245AACC506B3C644F6B8F5BF0B4794E
          DD85A78CFC13E28C43C82D05145905964905809289000A28A28012CB28B2C380
          0005803C8002C00C63A438C72C6380F911040CF2D408A2B2A092CD24A3F25832
          71651E328679459BCBC401678C806461C6790B20C73FB31C07C052A50E140429
          8808558C662A08492C21546180C1660D407A3183CC30A06022C8B9F3C6397013
          0A20924A2C828A2CB20A2C24964960080A2CA007A00500B0F2000B0031D380E3
          1CB18E02461020C14953851A409084448D11384C56094834E1C8091A42BA3C34
          E32422E40C83974E3ECE0277974F83FCDE0827CD785E5FCCF860F31E5FAFC5F0
          3C5E9F13C2C0FF005BA39F2E7E9E000A720B34E3CB20901EA3C3F30700B004E3
          FC10F413E31B80E0667860CF20F5673D3FD1C0634BA0B0C749732CF5CA2CC4BA
          6B1C617F8B304A55B62550FACD1C94B9471DE46C8DCE269425291B1EDD21ED4A
          14921160069ADE40858E65879064BE027F1FCD7805799C93E5FC7F0C3E3797EB
          F13C0F17A7AFC3EBFD6E8E7CB9FA780049C819A51E324A19E9F0660838658447
          1383B0109D824C107232F07746302E9E5D5CBD3C07C1C95328C902509C83C494
          FC294C238A2CCCA652001A585427C8C23C94A0251A30F58790B96738FB339E02
          AB80380A2CB720CA5020CA2499425F8382D1E5313E50BF00C01A47869FA3C007
          8269781079071D22C6338E5C04EC2720078D4849282A0D2CB28C3F0583071851
          4230451433718EB196588D16421FB319CE7F2E78002412124298049414C12B04
          848096109212301E8F070560382F05747EAF4F2E5CB8097E451F93F87F944DE4
          3CB792F23E017E4FC9785E0793F2BD1E0795F0BF53A3A7A3A3D1CB97012BA9D7
          D537FEFD4FBB704D1D4EBEA9BFF7EA7DDB81A3A9D7D537FEFD4FBB7034753AFA
          A6FF00DFA9F76E068EA75F54DFFBF53EEDC0D1D4EBEA9BFF007EA7DDB81A39B9
          FAA43ED4ABDDB81A8F53A7A941ED2A3DD781A87373F5487DA957BB70347373F5
          487DA957BB70351EA74F5283DA547BAF034753A7A941ED2A3DD781A87373F548
          7DA957BB70347373F5487DA957BB70347373F5487DA957BB70347373F5487DA9
          57BB70347373F5487DA957BB70347373F5487DA957BB70347373F5487DA957BB
          70347373F5487DA957BB7034753AFAA6FF00DFA9F76E068E6E7EA90FB52AF76E
          068E6E7EA90FB52AF76E068E6E7EA90FB52AF76E068E6E7EA90FB52AF76E068E
          6E7EA90FB52AF76E068E6E7EA90FB52AF76E068E6E7EA90FB52AF76E068E6E7E
          A90FB52AF76E068EA75F54DFFBF53EEDC0D1CDCFD521F6A55EEDC0D1CDCFD521
          F6A55EEDC0D439B9FAA41ED4A7DDB81AFFD9}
        mmHeight = 16934
        mmLeft = 1852
        mmTop = 5292
        mmWidth = 72230
        BandType = 0
      end
      object pplUsuarioTodos: TppLabel
        UserName = 'Label11'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3979
        mmLeft = 2381
        mmTop = 28840
        mmWidth = 68284
        BandType = 0
      end
      object ppShape48: TppShape
        UserName = 'Shape48'
        mmHeight = 7144
        mmLeft = 199232
        mmTop = 34396
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label19'
        Caption = 'Desc. de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 200290
        mmTop = 34925
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label28'
        Caption = 'Cr'#233'dito (-)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 200290
        mmTop = 38100
        mmWidth = 10848
        BandType = 0
      end
      object ppShape49: TppShape
        UserName = 'Shape49'
        mmHeight = 7144
        mmLeft = 185209
        mmTop = 34396
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'Label44'
        Caption = 'Niv. de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2879
        mmLeft = 185738
        mmTop = 34925
        mmWidth = 7451
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'Label45'
        Caption = 'Aporte (+)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 185738
        mmTop = 38100
        mmWidth = 10848
        BandType = 0
      end
      object ppShape50: TppShape
        UserName = 'Shape50'
        mmHeight = 7144
        mmLeft = 213255
        mmTop = 34396
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel45: TppLabel
        UserName = 'Label46'
        Caption = 'Otros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 214048
        mmTop = 34925
        mmWidth = 6085
        BandType = 0
      end
      object ppLabel57: TppLabel
        UserName = 'Label57'
        Caption = 'Desc. (-)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2879
        mmLeft = 214048
        mmTop = 38100
        mmWidth = 9356
        BandType = 0
      end
      object ppLabel114: TppLabel
        UserName = 'Label114'
        Caption = 'SISTEMA DE PREVISION SOCIAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 1852
        mmTop = 21167
        mmWidth = 44979
        BandType = 0
      end
      object ppShape2: TppShape
        UserName = 'Shape1'
        mmHeight = 7144
        mmLeft = 157163
        mmTop = 34396
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Mon. benef.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2858
        mmLeft = 157692
        mmTop = 34925
        mmWidth = 13102
        BandType = 0
      end
      object ppLabel129: TppLabel
        UserName = 'Label129'
        Caption = 'Anu./Ext.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 160073
        mmTop = 38100
        mmWidth = 9790
        BandType = 0
      end
      object ppShape61: TppShape
        UserName = 'Shape102'
        mmHeight = 7144
        mmLeft = 227278
        mmTop = 34396
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel134: TppLabel
        UserName = 'Label134'
        Caption = 'Importe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 228336
        mmTop = 34925
        mmWidth = 8202
        BandType = 0
      end
      object ppLabel135: TppLabel
        UserName = 'Label135'
        Caption = 'x pagar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 228336
        mmTop = 38100
        mmWidth = 8202
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      BeforePrint = ppDetailBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 3175
      mmPrintPosition = 0
      object pplfecben: TppLabel
        UserName = 'Label23'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 0
        mmWidth = 12171
        BandType = 4
      end
      object pplpvslbennr: TppLabel
        UserName = 'Label24'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 15875
        mmTop = 0
        mmWidth = 11377
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        BlankWhenZero = True
        DataField = 'MONBEN'
        DataPipeline = bdeprepxtipben
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 142611
        mmTop = 0
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        BlankWhenZero = True
        DataField = 'IMPPAG'
        DataPipeline = bdeprepxtipben
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 241830
        mmTop = 0
        mmWidth = 13228
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'ASOAPENOMBEN'
        DataPipeline = bdeprepxtipben
        DisplayFormat = 'AAAAAAAAAAAAAAAAAAAAAAAAAAAA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 42863
        mmTop = 0
        mmWidth = 44450
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'ESTLIQ'
        DataPipeline = bdeprepxtipben
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 28046
        mmTop = 0
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'BENEFICIO'
        DataPipeline = bdeprepxtipben
        DisplayFormat = 'AAAAAAAAAAAAA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 88106
        mmTop = 0
        mmWidth = 20108
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'TIPPAG'
        DataPipeline = bdeprepxtipben
        DisplayFormat = 'AAAAAAAAAAAA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 125942
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText30: TppDBText
        UserName = 'DBText103'
        DataField = 'DOCPAG'
        DataPipeline = bdeprepxtipben
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 255853
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText31: TppDBText
        UserName = 'DBText104'
        DataField = 'FECPAG'
        DataPipeline = bdeprepxtipben
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 269611
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        BlankWhenZero = True
        DataField = 'DEVAPO'
        DataPipeline = bdeprepxtipben
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 171715
        mmTop = 0
        mmWidth = 13228
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        BlankWhenZero = True
        DataField = 'DESCRE'
        DataPipeline = bdeprepxtipben
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 199761
        mmTop = 0
        mmWidth = 13228
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        BlankWhenZero = True
        DataField = 'NIVAPO'
        DataPipeline = bdeprepxtipben
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 185738
        mmTop = 0
        mmWidth = 13228
        BandType = 4
      end
      object ppDBText34: TppDBText
        UserName = 'DBText34'
        BlankWhenZero = True
        DataField = 'OTRDES'
        DataPipeline = bdeprepxtipben
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 213784
        mmTop = 0
        mmWidth = 13228
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'BCODES'
        DataPipeline = bdeprepxtipben
        DisplayFormat = 'AAAAAAAAAAAA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 108744
        mmTop = 0
        mmWidth = 16404
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        BlankWhenZero = True
        DataField = 'MONBENANU'
        DataPipeline = bdeprepxtipben
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 157692
        mmTop = 0
        mmWidth = 13228
        BandType = 4
      end
      object ppDBText43: TppDBText
        UserName = 'DBText43'
        BlankWhenZero = True
        DataField = 'IMPXPAG'
        DataPipeline = bdeprepxtipben
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 227807
        mmTop = 0
        mmWidth = 13228
        BandType = 4
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 46831
      mmPrintPosition = 0
      object ppShape15: TppShape
        UserName = 'Shape13'
        mmHeight = 5821
        mmLeft = 61383
        mmTop = 34396
        mmWidth = 72761
        BandType = 7
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        mmHeight = 23283
        mmLeft = 61382
        mmTop = 11377
        mmWidth = 72761
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'MONBEN'
        DataPipeline = bdeprepxtipben
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3440
        mmLeft = 142611
        mmTop = 1058
        mmWidth = 14288
        BandType = 7
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1588
        mmTop = 265
        mmWidth = 281252
        BandType = 7
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1588
        mmTop = 5027
        mmWidth = 281252
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'IMPPAG'
        DataPipeline = bdeprepxtipben
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3440
        mmLeft = 241830
        mmTop = 1058
        mmWidth = 13229
        BandType = 7
      end
      object pplimpresopor02: TppLabel
        UserName = 'Label25'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 1588
        mmTop = 42863
        mmWidth = 54504
        BandType = 7
      end
      object ppLabel24: TppLabel
        UserName = 'Label26'
        Caption = 'TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3386
        mmLeft = 126736
        mmTop = 1058
        mmWidth = 9229
        BandType = 7
      end
      object ppLabel25: TppLabel
        UserName = 'Label27'
        Caption = 'CANTIDAD DE EXPEDIENTES PROCESADOS :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1588
        mmTop = 6879
        mmWidth = 57944
        BandType = 7
      end
      object ppLabel26: TppLabel
        UserName = 'Label29'
        Caption = 'Tipo de Beneficio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 62706
        mmTop = 12171
        mmWidth = 26194
        BandType = 7
      end
      object ppLabel27: TppLabel
        UserName = 'Label30'
        Caption = 'Cantidad'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 93134
        mmTop = 12171
        mmWidth = 13494
        BandType = 7
      end
      object ppLabel28: TppLabel
        UserName = 'Label301'
        Caption = 'Monto del'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 115359
        mmTop = 12171
        mmWidth = 14288
        BandType = 7
      end
      object ppLabel29: TppLabel
        UserName = 'Label31'
        Caption = 'Beneficio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 115359
        mmTop = 15875
        mmWidth = 13758
        BandType = 7
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 61648
        mmTop = 20108
        mmWidth = 72231
        BandType = 7
      end
      object ppShape13: TppShape
        UserName = 'Shape11'
        mmHeight = 28840
        mmLeft = 91546
        mmTop = 11377
        mmWidth = 264
        BandType = 7
      end
      object ppShape14: TppShape
        UserName = 'Shape14'
        mmHeight = 28575
        mmLeft = 113771
        mmTop = 11377
        mmWidth = 264
        BandType = 7
      end
      object ppLabel30: TppLabel
        UserName = 'Label32'
        Caption = 'RETIRO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 62442
        mmTop = 21431
        mmWidth = 10710
        BandType = 7
      end
      object ppLabel31: TppLabel
        UserName = 'Label33'
        Caption = 'FALLECIMIENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 62442
        mmTop = 25665
        mmWidth = 22521
        BandType = 7
      end
      object ppLabel32: TppLabel
        UserName = 'Label34'
        Caption = 'INVALIDEZ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 62441
        mmTop = 29898
        mmWidth = 14690
        BandType = 7
      end
      object pplcanrettod: TppLabel
        UserName = 'Label35'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3979
        mmLeft = 96309
        mmTop = 21431
        mmWidth = 12446
        BandType = 7
      end
      object pplcanfaltod: TppLabel
        UserName = 'Label36'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3979
        mmLeft = 96309
        mmTop = 25665
        mmWidth = 12446
        BandType = 7
      end
      object pplcaninvtod: TppLabel
        UserName = 'Label37'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3980
        mmLeft = 96309
        mmTop = 29898
        mmWidth = 12446
        BandType = 7
      end
      object pplmonrettod: TppLabel
        UserName = 'Label38'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3979
        mmLeft = 115359
        mmTop = 21431
        mmWidth = 16139
        BandType = 7
      end
      object pplmonfaltod: TppLabel
        UserName = 'Label39'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3979
        mmLeft = 115359
        mmTop = 25665
        mmWidth = 16139
        BandType = 7
      end
      object pplmoninvtod: TppLabel
        UserName = 'Label40'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3980
        mmLeft = 115359
        mmTop = 29898
        mmWidth = 16139
        BandType = 7
      end
      object ppLabel33: TppLabel
        UserName = 'Label41'
        Caption = 'TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 62441
        mmTop = 35454
        mmWidth = 9144
        BandType = 7
      end
      object pplcantottod: TppLabel
        UserName = 'Label42'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3979
        mmLeft = 96298
        mmTop = 35454
        mmWidth = 12446
        BandType = 7
      end
      object pplmontottod: TppLabel
        UserName = 'Label43'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3979
        mmLeft = 115369
        mmTop = 35454
        mmWidth = 16129
        BandType = 7
      end
      object ppLabel113: TppLabel
        UserName = 'Label113'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 138907
        mmTop = 1058
        mmWidth = 1058
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'DEVAPO'
        DataPipeline = bdeprepxtipben
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3440
        mmLeft = 171715
        mmTop = 1058
        mmWidth = 13229
        BandType = 7
      end
      object ppDBCalc12: TppDBCalc
        UserName = 'DBCalc12'
        DataField = 'NIVAPO'
        DataPipeline = bdeprepxtipben
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3440
        mmLeft = 185738
        mmTop = 1058
        mmWidth = 13229
        BandType = 7
      end
      object ppDBCalc13: TppDBCalc
        UserName = 'DBCalc13'
        DataField = 'DESCRE'
        DataPipeline = bdeprepxtipben
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3440
        mmLeft = 199761
        mmTop = 1058
        mmWidth = 13229
        BandType = 7
      end
      object ppDBCalc14: TppDBCalc
        UserName = 'DBCalc14'
        DataField = 'OTRDES'
        DataPipeline = bdeprepxtipben
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3440
        mmLeft = 213784
        mmTop = 1058
        mmWidth = 13229
        BandType = 7
      end
      object ppDBCalc23: TppDBCalc
        UserName = 'DBCalc23'
        DataField = 'MONBENANU'
        DataPipeline = bdeprepxtipben
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3440
        mmLeft = 157692
        mmTop = 1058
        mmWidth = 13229
        BandType = 7
      end
      object ppDBCalc28: TppDBCalc
        UserName = 'DBCalc28'
        DataField = 'IMPXPAG'
        DataPipeline = bdeprepxtipben
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3440
        mmLeft = 227807
        mmTop = 1058
        mmWidth = 13229
        BandType = 7
      end
    end
  end
  object pprtipbenres: TppReport
    AutoStop = False
    DataPipeline = ppbdetipben
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297127
    PrinterSetup.mmPaperWidth = 209815
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\Documents and Settings\irevilla\Escritorio\repmod01.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 682
    Top = 128
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppbdetipben'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 59796
      mmPrintPosition = 0
      object ppShape18: TppShape
        UserName = 'Shape18'
        mmHeight = 8731
        mmLeft = 36513
        mmTop = 51065
        mmWidth = 35453
        BandType = 0
      end
      object ppShape17: TppShape
        UserName = 'Shape17'
        mmHeight = 8731
        mmLeft = 11377
        mmTop = 51065
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'Label202'
        Caption = 'Fecha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 150813
        mmTop = 4233
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'Label3'
        Caption = 'Hora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 150813
        mmTop = 7673
        mmWidth = 6085
        BandType = 0
      end
      object ppLabel38: TppLabel
        UserName = 'Label4'
        Caption = 'P'#225'gina'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 150813
        mmTop = 11113
        mmWidth = 8805
        BandType = 0
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 165100
        mmTop = 4233
        mmWidth = 14023
        BandType = 0
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'SystemVariable5'
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 165100
        mmTop = 7673
        mmWidth = 17463
        BandType = 0
      end
      object ppSystemVariable6: TppSystemVariable
        UserName = 'SystemVariable6'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 165100
        mmTop = 11113
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel39: TppLabel
        UserName = 'Label5'
        Caption = 'RESUMEN DE LIQUDACION DE BENEFICIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 63765
        mmTop = 28575
        mmWidth = 72496
        BandType = 0
      end
      object ppLabel40: TppLabel
        UserName = 'Label6'
        Caption = 'DEL 04/11/2005 AL 30/11/2005'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 75406
        mmTop = 32544
        mmWidth = 49477
        BandType = 0
      end
      object ppLabel41: TppLabel
        UserName = 'Label7'
        Caption = 'RETIRO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 48419
        mmTop = 51858
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'Label8'
        Caption = 'CANTIDAD'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 37306
        mmTop = 55827
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel43: TppLabel
        UserName = 'Label9'
        Caption = 'MONTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 60061
        mmTop = 55827
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel46: TppLabel
        UserName = 'Label46'
        Caption = 'MES DE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 11906
        mmTop = 51858
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel47: TppLabel
        UserName = 'Label47'
        Caption = 'PROCESO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 11906
        mmTop = 55827
        mmWidth = 14288
        BandType = 0
      end
      object ppShape16: TppShape
        UserName = 'Shape16'
        Pen.Style = psInsideFrame
        mmHeight = 265
        mmLeft = 36513
        mmTop = 55298
        mmWidth = 35190
        BandType = 0
      end
      object ppShape19: TppShape
        UserName = 'Shape19'
        Pen.Style = psInsideFrame
        mmHeight = 4233
        mmLeft = 51858
        mmTop = 55298
        mmWidth = 265
        BandType = 0
      end
      object ppShape20: TppShape
        UserName = 'Shape20'
        mmHeight = 8731
        mmLeft = 71702
        mmTop = 51065
        mmWidth = 35453
        BandType = 0
      end
      object ppLabel48: TppLabel
        UserName = 'Label48'
        Caption = 'FALLECIMIENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 78317
        mmTop = 51858
        mmWidth = 22521
        BandType = 0
      end
      object ppLabel49: TppLabel
        UserName = 'Label49'
        Caption = 'CANTIDAD'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 72496
        mmTop = 55827
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel50: TppLabel
        UserName = 'Label50'
        Caption = 'MONTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 95250
        mmTop = 55827
        mmWidth = 10583
        BandType = 0
      end
      object ppShape21: TppShape
        UserName = 'Shape21'
        Pen.Style = psInsideFrame
        mmHeight = 265
        mmLeft = 71702
        mmTop = 55298
        mmWidth = 35190
        BandType = 0
      end
      object ppShape22: TppShape
        UserName = 'Shape22'
        Pen.Style = psInsideFrame
        mmHeight = 4233
        mmLeft = 87313
        mmTop = 55298
        mmWidth = 265
        BandType = 0
      end
      object ppShape23: TppShape
        UserName = 'Shape201'
        mmHeight = 8731
        mmLeft = 106892
        mmTop = 51065
        mmWidth = 35453
        BandType = 0
      end
      object ppLabel51: TppLabel
        UserName = 'Label51'
        Caption = 'INVALIDEZ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 118798
        mmTop = 51858
        mmWidth = 14690
        BandType = 0
      end
      object ppLabel52: TppLabel
        UserName = 'Label52'
        Caption = 'CANTIDAD'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 107686
        mmTop = 55827
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel53: TppLabel
        UserName = 'Label501'
        Caption = 'MONTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 130440
        mmTop = 55827
        mmWidth = 10583
        BandType = 0
      end
      object ppShape24: TppShape
        UserName = 'Shape24'
        Pen.Style = psInsideFrame
        mmHeight = 265
        mmLeft = 106892
        mmTop = 55298
        mmWidth = 35190
        BandType = 0
      end
      object ppShape25: TppShape
        UserName = 'Shape25'
        Pen.Style = psInsideFrame
        mmHeight = 4233
        mmLeft = 122502
        mmTop = 55298
        mmWidth = 265
        BandType = 0
      end
      object ppShape26: TppShape
        UserName = 'Shape26'
        mmHeight = 8731
        mmLeft = 142082
        mmTop = 51065
        mmWidth = 40481
        BandType = 0
      end
      object ppLabel54: TppLabel
        UserName = 'Label54'
        Caption = 'TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 153988
        mmTop = 51858
        mmWidth = 9144
        BandType = 0
      end
      object ppLabel55: TppLabel
        UserName = 'Label55'
        Caption = 'CANTIDAD'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 142875
        mmTop = 55827
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel56: TppLabel
        UserName = 'Label56'
        Caption = 'MONTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 170657
        mmTop = 55827
        mmWidth = 10583
        BandType = 0
      end
      object ppShape27: TppShape
        UserName = 'Shape27'
        Pen.Style = psInsideFrame
        mmHeight = 265
        mmLeft = 142082
        mmTop = 55298
        mmWidth = 40481
        BandType = 0
      end
      object ppShape28: TppShape
        UserName = 'Shape28'
        Pen.Style = psInsideFrame
        mmHeight = 4233
        mmLeft = 157692
        mmTop = 55298
        mmWidth = 265
        BandType = 0
      end
      object ppLabel82: TppLabel
        UserName = 'Label103'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 161661
        mmTop = 4233
        mmWidth = 794
        BandType = 0
      end
      object ppLabel83: TppLabel
        UserName = 'Label83'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 161661
        mmTop = 7673
        mmWidth = 794
        BandType = 0
      end
      object ppLabel84: TppLabel
        UserName = 'Label84'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 161661
        mmTop = 11113
        mmWidth = 794
        BandType = 0
      end
      object ppLabel120: TppLabel
        UserName = 'Label107'
        Caption = '(Monto en Nuevos Soles)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 81227
        mmTop = 46831
        mmWidth = 37571
        BandType = 0
      end
      object pplUsuario: TppLabel
        OnPrint = pplUsuarioPrint
        UserName = 'Label1010'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 11377
        mmTop = 46567
        mmWidth = 58208
        BandType = 0
      end
      object ppImage2: TppImage
        UserName = 'Image2'
        MaintainAspectRatio = False
        Picture.Data = {
          0A544A504547496D61676543290000FFD8FFE1001845786966000049492A0008
          0000000000000000000000FFEC00114475636B7900010004000000640000FFE1
          036F687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F003C
          3F787061636B657420626567696E3D22EFBBBF222069643D2257354D304D7043
          656869487A7265537A4E54637A6B633964223F3E203C783A786D706D65746120
          786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A786D70746B
          3D2241646F626520584D5020436F726520352E332D633031312036362E313435
          3636312C20323031322F30322F30362D31343A35363A32372020202020202020
          223E203C7264663A52444620786D6C6E733A7264663D22687474703A2F2F7777
          772E77332E6F72672F313939392F30322F32322D7264662D73796E7461782D6E
          7323223E203C7264663A4465736372697074696F6E207264663A61626F75743D
          222220786D6C6E733A786D704D4D3D22687474703A2F2F6E732E61646F62652E
          636F6D2F7861702F312E302F6D6D2F2220786D6C6E733A73745265663D226874
          74703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F73547970652F
          5265736F75726365526566232220786D6C6E733A786D703D22687474703A2F2F
          6E732E61646F62652E636F6D2F7861702F312E302F2220786D704D4D3A4F7269
          67696E616C446F63756D656E7449443D22786D702E6469643A38384242323139
          413845363945333131393530364335414333303344354330382220786D704D4D
          3A446F63756D656E7449443D22786D702E6469643A3442453033434441363939
          3831314533383235463846314639373642313741362220786D704D4D3A496E73
          74616E636549443D22786D702E6969643A344245303343443936393938313145
          33383235463846314639373642313741362220786D703A43726561746F72546F
          6F6C3D2241646F62652050686F746F73686F7020435336202857696E646F7773
          29223E203C786D704D4D3A4465726976656446726F6D2073745265663A696E73
          74616E636549443D22786D702E6969643A384642423231394138453639453331
          3139353036433541433330334435433038222073745265663A646F63756D656E
          7449443D22786D702E6469643A38384242323139413845363945333131393530
          36433541433330334435433038222F3E203C2F7264663A446573637269707469
          6F6E3E203C2F7264663A5244463E203C2F783A786D706D6574613E203C3F7870
          61636B657420656E643D2272223F3EFFEE000E41646F62650064C000000001FF
          DB00840001010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010202020202020202020202030303030303
          0303030301010101010101020101020202010202030303030303030303030303
          0303030303030303030303030303030303030303030303030303030303030303
          0303030303FFC00011080040010403011100021101031101FFC4009C00000102
          070101000000000000000000000007080103040506090A0B0201010101010000
          0000000000000000000000010203100000060200040207030808030901000002
          03040506070108001112091314215394D415161731180A516191222393193941
          D192242556B778A133957181D336274768C81A8A110100030002000602030000
          0000000000000111213141516171810212B1D1F0A132FFDA000C030100021103
          11003F00D6A7E21FEE59B05B49BCB7D6B9993691C5B5B75BAC97FA8E255233BB
          2D6E8DBFC9600B4D8FCAAC49B22467109659227893A35996E1AC01806B6AC924
          A7000625672AC7CA76BA573BD938DFE830CE5F9CC167FE3E8E203C537973F14C
          FC9FF305CFF473E7C047C51FAE3BF4E7FF001389A1CE6A76E3EC5E91DB91DBAF
          5BACC9157F30625E894AD4685C570A2D336A4AA4B52A6293F8C96AD3B74BE26E
          982BA54A25411079F234B116704A3408B891EC67AC774A5D8FD70A1360D1340E
          3C96F0A6EB4B64A8F9AA32B06C3F5061ACF2A1B30966494DE732D237411193BC
          3060DE8EAC631CF971D50BA70070070070070070070070070070070070070070
          070070070070073E5F6F006338CFD9C01C01C01C019CE31F6F010E78FCB8FD38
          E0239CE31F6F00701E379DD8FF0099E7703C7FF30F617FD5092FF5F1CE79564C
          D5D9E7B9BBD51A1D8D6AD30B9555526C7C32C4AE38696B2E5CBE28680B3CA933
          65567BA956B3B47D421330A8A5A9990E4C721CF9A00B24733787D64380DA2EDC
          D3FB7F6E6ADA1740F5C2452D7179D22D3BB9A4D18871CB0E6C6D76B0F5F6BF95
          CEA7B2E94CCDE4A6486373E4BA42664C39C57A240158A42495D22180AE131738
          1B3C7BB4D771C945FD26D5F66D44B6CCBB218CC9E49288C383735B332B2C5D71
          AB486A942BB15EDD9B6B60C59FD537A925B5CC0EF940E67A730A4A69C60041E1
          5F2B4B34DBCE83B97596CC91D377E56D2BA9ECE8A8C803E43E62D8636B9A6256
          1385081C1319FB448EACEE89861391AE4661C89610209849A60058CE64DF6AF5
          F3ED63FCB47403FD9BEB7FFA4713E3AA15CD91DC8D57D4065677FD9DBF6AEA49
          048CF3D3470B9F4A9BD9DD64A6A31A62D7E238C19198FD202DB32B89CAB1A34C
          781284D088DC8022C6780E6E7B8B7766D848C774DED5F59E98ECE449EB4E76BC
          DA2332C360CC356D8D12B18A95ECD3FD6B3B0229DAD8FC81E111E18EA029B8F2
          9BD7A339B14807D41028EAE52E6E23A1D19EC86F0EA169FE1903B37B1B52D28B
          24850D4C7D9E75306D6C913E2228FF002C738B5468261EFEBDAD3A9FD99CA8A4
          C24E519E818F19E28CC59368F5BE4B492FD948EDED53BFEBFB4B4B9BF3ADCACF
          3C8E39D6ED6D2CBCC2F2B1CA5C8DC0E666F0B38B190AB01A680C4E6632033011
          6338E013A6FDFDD27776DA7DE1A369E8E776BBFE4B248852CE0D161C7DCD2597
          228764E2E5C82247205AA0B732E307938257A80E7CB235261449A600D3C900C2
          CE4771DD0B575D116DA0DBCD7F74AD1559CD34BA39B345971A76605F6C3EA546
          E2D75E372D6D5CA42E12A52D2B8B5B9484E0C38A41D4A8CC05380668428AD8EE
          65DBDE8D992CAEEDBDD0D6C824EDB1C4E697A883DDB90E2E431E744E6E0950DD
          26694EE8A164656A737D0616BC29C60F4F3FB33C2E02CB2BDABD6783D3683626
          5B7F53EC5423AFC33E15732EB0E2C1AC9D7E34B3E1CD196B9A96E638F38FC457
          872493E0A81F5998C871CF38CF2045275DCDFB7BD66E155B5CF37275EA28AEEC
          8DB24D2B0CBC5971E4E92530B9264F047A665AFC2B13735441F4C4C6811BA2E3
          52A152324C096688458B1860BCDD3DC5744F5CACA69A76F5DB2A22ACB39E7084
          C221732B0D81A9E9B53B9929D5362C93146AAC950E40E8955166A550EC344428
          273D650840C67385C0576E3D9BD74D798AB5CE6F6BDAA3A7E22F981E58243645
          83168735C8BA1312AC408E297C74440901D84AA0B33A11F8C3F0CCC67972CE39
          8615AF5BC1A7FB60ADDDB75AF65A97BADE581265C9EE3F5F5811F90491A1AF0A
          4A47F17728DA559F1D46CE258A0B282AC69829C468F01C0F22CE31C0393757A6
          763253287A756C674EB5CDB19519EE8B933792ADE1ED7A76B666A4C6AB34A01E
          E6ECE4A8A4C9480E7269E79812CBC6442C632090C4F67B5B27B66C9293836C25
          2133B961C27404BAA58A5AD0490D99171B12B290BD824304687E572765133AD3
          824ABC294A5E539A2C00CE916718E0257DE9759BEB07DDEBEF1345FD7DF13C2F
          A21F56A05F56FC6F85FC77C0FA6FF1FF009BFCC7C17FBEF4793EBF2BFB6FF97F
          ADC065D695CB50D1D191CD6EBB52B7A7E185282519B2CB46731880468B58A39F
          974837D9639B4B60551DD39E8064DEA172CF2C7A380ABAD2D6ABEE788A29F53B
          6440AD782399AA486D9A56B308F4EA26BCF446E49584229145DC5D1A151C90EC
          640680B3B392C58E42C633C02713FDB9D53AA27ED754DA5B35AF95B5A0F7F0DC
          B356F3EB9ABA87CF1DB0F4779766136C4243236E7F5B876521C969725A717981
          E3917D59F47011BF5DA54F9584FD8E97BEEB5A4AD1607B81B71F614D98D92C36
          180295F2588BC2B639642D64A230501C6750B5F942DE050B529A131D932A2B06
          67C3098178B8B6575D35DCB6036FFBF295A34A961EAD34587705A507AD012552
          8029B2B93B00A66FACD8783908561393829FAF2560C07572C0B1CDC721A36F07
          710AEF519669C165CD693588F66B66AB3AB9ED5CCECC636029828F98C7A6CE72
          2BB580D03984A5EC51C72626D4D95E6FF84604E2009A703232F3C27390F322D7
          DD173A823F5A508BA2A798D611513C065163C5AC587C86071B1479116E2FC17E
          97B4BC2C8F34098DBCE09EB3CC282FCB102C0CCE90E719E028A9CD8CD7DD8940
          F0EDAFF7AD3B79354755A640FEE5505990BB29031AE5648D42346F0AE1CF4F49
          DB152A20191940384011810E738C6718CF017B925D14F43A3C8E5D2EB5EB58B4
          4DC6505C1DBA51239D461963ABE686BDA88C950F44F4E4E899B55CA4C91A435B
          F0DE59B95795A5893E0BF14390E0304AB9F64505AEA7724BEAFAACE789186C5B
          71D0EB19B5B186B788C12048666F6264834A148A44E6D25BC556CC461A5DDC94
          A84E61CA51983505966E079C85EA9ED95D73D882DF0EA06FDA56F12A306A6224
          86D3F69C1ECC0478F59E2F9325EC70B7D7AC3518AF040F2584FF000F23C005CB
          9F2CF2723493F7E5DA7F9E3E0FF53D3FC3FF00FD0E7DC73CBFC990CE5F75AFA0
          9F39FD31F17E0FD5E3FCC3FDE3E33CFE33D5FB3F31D3FA9C66FF002AE49ABB8A
          54F38FC5053E8C5D28232F10D71EE19B2C63630CC4CC971591DA0DEF567B951F
          197E2C61196B50492EA471F4262234224EBBCC796342228D163333EDA34E33EB
          CF73D56E2C86E19ACFAEB6DDD9496DAF29D5FF000B648CF71305B089F8C65322
          6D881064878605ECAE85E5A53322524A4E8C90010129C050024E33737E63A4BE
          F756258276AB6D54B5CDDDBA3767DBDBF1A574DED486BD7A270D52495D37DAFE
          B9944CE997C5CC0E2A50BC452A5BC642E8689A4C11C991BFF50841F1D28041DC
          F1EE9DB55B71EC0DDEF9D8AB506B277B5664E55FFDF7B66A1A289AA785236F3E
          235CD67414A60316579CE7CCAC8E4364964BEAD6F4261B94898E71C6405F3208
          C932E7EB4AB4EF33B39CDFB54F66AB0A62B5649E78595BE353E66AFC70DD2527
          D61565BD5CE2B3811EFCACC35CD744EBD2654E44332238D114D49D5984A60964
          F2070F97108F4B3ED65FCB4BB7F7FB38D6FF00F48A29C6C71F554D055D7774FC
          48FBBB03DEC74779657FAF38B85A6B9A754C99E638DD268D5253D8ED57078337
          9ADAE8DAF6D51B21BA42AE5AB9334284A6B839E4F54663251EB303C73F2D5255
          BD3A0BAD7A19F883FB66567ACA4AB8B571675CDA9168AEAA8E91BBC952D71207
          2D8DC4517A38FB83F383B3EA6649395152D7929D6293CC214987E0B1052F9624
          A4C57CA2836FD7A9AB5EDDF707EE13B15B63DB6769BB9FCD49B25C18982B2AB1
          C24C38B514D2AE5B35606B699CB74690AA7DCFCBD1589A4648C1423F089214DE
          B44612729C90A533B9B80BB6B9D2DB49AEB56F7BF89675276E3547B7E5C5A2D7
          85935B41B63A36FE04B12B3236E90D4B01650CBDE9A1B1B5548871C91BDA1F0C
          A18DC96B6A44BE74C586A009F8B1DF852161EC25DAB20D61E9EBDF744B7E7D3D
          7F9BD1C9EF42F562B442FE14D5EC353D7516952B707D942434A39C1C82ED61BE
          B8292DA129EDC80224E250ABCE79E30B25F18EE4379FC397DA72AEDF262B1F63
          F65ACEB09AE9CD5CB59914D775AC2A5638B369D6990DB1F9BCAE712774392AA1
          3333A08F32B3261E1B7095C1767908C5840111403DF18B0BE3995A15DC9EF5DC
          3B4751BB116C46E5C49FECC993F595B4ECFB672DA31CC12B95962717C9455D59
          2F20E830E48E6E869B2142C4A0D5AEAA3CE80C5A8892D47920327881ABCD7E97
          CB55762AEEB74EBC2F7CC426A7DA9D3392C2A2B200E32BA29229ECE65D1F9AE0
          E2F00F0D02C7043016E0AA28BF08B0A94E316318C9A2EA91FE654F97623B476A
          0407F0E9555DC01A1A2666ED5AD8DD2D623D58ABA66FEB913EA1B3AC563829F5
          F2A87A970510F6F8A45E3D242F0DE6244699CB0A5BCAC9AA46030D2449F8C447
          9A24583DA7F5213FE1BE67EE306B6CE5CF6F14A18858ABED1709BC855A67142F
          97FB7D359AF15C416AE5116C445AA20BC034E781281DF2E290B37CDF96C891E5
          51F5B9E57B2BCB766F4E65DDB0BB2F6B1ED0E9DDABDC736C9E22D60BF5194A43
          EC496560E08602A6DDB3E978832BF587174EE331358DF1140D1266E666D4E615
          92E2851AACC4A993100536E2AA790D74EAF1FF004CFBD276C87EAD341EDAED78
          ED60DD550C5A4355492F73360215316699D9AD35DCED6C02C3C80F5CA9AA4105
          981ADEF4D872C5004A79A1C00B27AB1812AA611DA877A189027FA8509800A432
          487FCFBB9BA310CC4C616E8730CD622193ED4D5AD0A2450D90251056B04A1B12
          2B306897119C9A94FE430E3D19E353C0493BA16976B0D37DB6AEE9BD174EC128
          5B1B542B270B875DAD3A7630C705B32ACB0AB74E43C333E304E5A1127921A6BE
          650E52BDF985270DE922A3C2A846986789874156BC3B7169AC4BB7F5AF5A4729
          383B19D0EA3671358D5B0963CCE3BBD92DA8EC35CA52D17B916C9A9899B1D742
          198A229EC4FE6AEC2D3DC03911A664B1081C2434F8F6C1C5F682BFD2B465E834
          1BB916F3B568C6BADD36D496C32EA286D6F41336C3D78C4FE15533B52C68E4A1
          3C5665713F30AD5CDF1C8F3139399ADE8CE527012A1C1461D2EE3CCECD7E773F
          BE34FF00622EDB5E0FA391AEDF1389876B0DF6B15643AB9B3AAFB5E87BF2DBD5
          56DAF26F4CCDDA20F59B142D3FD54ABBE747125C1C5F18122A756277C202B278
          53E3207E86DFB50340B4753EAA55C23296A7360C57056B13B1ACBBBADA84C4EE
          19E6C74A2C98F249649AD6B1E7F356F90BD4E1CA7AE2FA7B875A8546A44E4A90
          A7480252964940540D06DDB4ED7146EB5F7EBA76AE7A769556F01DB5EDB2C314
          1CA256E13E5F13694CE5A98E096A1264AF2A97BA2A8CD2C62BF979911A95071E
          CED6853B78CCC89264594F1EFF00A1B54BDA939A515B9BB2DB4169E8187B8FD2
          37DC72B61314B610DB5C599B0FABF1AACA008E24EF45B051375485A1B26155CB
          E5197095A61C10E4EECA1D5E9C00EADEBC6044A30F30D7F64229DBE2DDA9FB53
          BD6ACD275423AB3F8C0D795BC86BA72A81244DEAB190BE365F2F778D2136ACA6
          4C091EAB1569A748CB54F1133D2236FF001C84EA0A4E34F94868A4D4D7A9050F
          73D35511DDFBD7CD2945A6330B4754607AED3ADE0956AE6A756951A48A5C578A
          9B722B52C22457A575207BAD227308055E992A972291E559E05F235EDE7AF4C7
          94DE4745EEBA1779B237496EC6EA3DC7A8BDB3B6AB542F1825F159C46CCB257D
          45425555CCEF50A70FE8A33B055B5D47C06F45A54A6311A891C549E3C156D2F0
          B1AE4AC2886D6024472918931DF62FDDA9B47EA99F47671B297AB430DE8BE29B
          81BB51FD418D4FD81A1FA17AC558B16E25AEA1C1657713716CCB337DB93BB39A
          DC1E9E260328D90284816C401525266F015956DC84AAABB268866D67514B595A
          B09B76EDBBBFBA0F71C7CD79D603D8A04E044CE6355ECF5C92091D92FEF16AAC
          455E4361D5B3439872E6F6E061DE586E24904A75279E12B2C18BDECCB74D636C
          697DD62ED5B5CE8F4C229BA5AC75B636335B6FBA3658CA3AAEF9B6E3F51D9D55
          5D3148B55F59CC65D059FB2CC7CB224A4A25C5B7C8468DC42A52E538C2A4132F
          FDC9FF00FACAFF00EAEF13F6BD7B3895EEB0A0F45DD0F7F55A434E4AAD36E4EC
          2284CA539A610A139E45AB2334A3C838192CC24D2860EB00C3E9E7CB38E333C8
          5BD277BFDEE4CD891C8E74A19DEF36E654B1A6BDC27ED6EA65E770DB98914771
          144C98BBF1C2207CA95BB96C18C9187C5383E442E79332BFC6CF5F0FB4FB8634
          FF00B6175CAB5DD7EB149A484C86B777D8F78DAF795EF8930E93B7ABAA45082E
          BF7C92BCCDD79C7BE3A16EAC24F59E51E60B272B165408591E79F12F28634F77
          FD86FDAF903D635EA5A05575736958570C69281A8A29F0B995991D83C5A4E6AC
          7AC0B2A16379AD75EB77809FA71828CF133CF3D58C05782BE79B296859342D03
          ADF275ACC755FAD2E5703B55A89131A342F08965E0FCC1249F09E9E4BC655BEE
          153A4692E5378B91652978C8439E9E58C3781EBA9DAC7F968E807FB37D6FFF00
          48E27C7546AA7B93FE1F449B6BB52DFBCFA95B472FD2BDA23BE1C6CCE4D176B7
          A5AD9267A69662632DF3561758ACBA172880CC0C8C17842E4626395A37720A2F
          232083C6B142B931737D86E711FC30F2763DAAD5ADC296F707B12DCBA2A4B36B
          8B86F6975AF03719A3FDCF33AEEC16D94B6258E3DBAD946BA4218088A3221642
          42B8D7F3CBC939521100BC948899F5DB0B9EDE7E1F6964AB6D26DBB1DBB375EC
          1D09B9ADA39DD6DBED3186F7C5D1796BCC95612E72A796E708D4B62CECD29E52
          F69C0E4E4D4B0B766F52EBCD493E544108316B6C2A543F648B56BAD3ADEAA0ED
          EEE0773EC25BDBDF1871679AD916323757DAEA0CF6A9A0D6804B2395B3ECD1DD
          E9CA5CE080C2923AB99AFA9C4B903737272C84C0420C8D101D976FAEDA2E1A39
          DBB1FB44155D24D8CB1ED1DD494168A481662A5377D5D29D40030B889F2B91E5
          665806E7E2721B863CCE71CBF678E5CAC64504FF00B3D7691FE169415D744C96
          E76FD836CB92C23266B96975D1D5EA540DAAA16D10D5EC0A1BCD99CC86E21584
          3708623707138E91F2E9FB73C48C81AEAA43F0ECECFEAA4D2CE836A97764BA68
          3D3AB7E5637A985590E81220DAA9D80C30297E171DB1954A543446E7D88E124B
          77CE0DAD88169A020919E8CD012023844570319AC7F0C038D6BA65BA7A869773
          D3B991B5D636BE4CDA66CAA8E3427419B284934BDFC86F766705A81F9ADC64E4
          4AC25187814A02D29A9BC4C16678990855514365D6FF0069176B53B3AC3FB55E
          2FD4AC8E31783D470F36EF156827146BFE974F23F37F1C35F066880F4A4BA858
          B09318F8C08C2702C1B91199C64194C5C50A594F685739276626FED318D814A9
          5C5144A2F1ACDED9ACF26243B31CBB1BAE2F17E9D026A518020F021C36631F19
          C998C67CC6739CF32F85650D7DCF3F0D34A0751E8AAAA4F77DF6A5DBCD1D88BD
          C1983601AAB7529DA2671B576DCFED88B1208B249DFC5226E5075D63B8212D46
          17B994E680CC92A53F40B1802BCF4642BFF0F0DF7626DAEA3EEAEC3F7359FDFD
          7650762D713E9E9B39A7DAC11A90A1AC2C96B9F4760952B0B1CD199BEA68B9C4
          A4509D607C1710295EACE70C12508D191956C48DF96DBEB8A8DA0AF60D054F32
          0C1870DD82D77BCB2EA362C487E200A1EE1885AC28CE11E5D1A7CA8A4DF2B791
          F37E20FCAF8DE2F846F4F40A8AFDC8D7C3B6C355AFED6B4F2D0C0CEBBAAF94D7
          209989971230C685246F310FC544C427167F8AE12E0CCE72479A23ABECEB0FDB
          C029B65400760D453FAB30EF968366D5BCAABFC3F811855E5AC5258C2E8EE1E0
          0DA23C90A9CA3CADF1F04E4D0E07D3D1D78E7CF80D5840BB726C76AA0AB49BE9
          7EC6D60D76421D56D6ED62D858A5FB4F482594D5F8A358A189E0D5A5CED24422
          C58B5875158AD51E50E0DE71299D5E1A1C5B54272D425F3288B58395E033EAF3
          47F611B36AE09BD5B25B479BA6CB83D2973552EB4A56F531709A39AA273D3E02
          FCD4C149C41E66F2992B34802F90B506BDBD3F3C3DB9CA047214DD4D889BC94D
          C581AC788583DB6E2512B0239587761DA4EDA75AAF54F0E73FD0B9A4A6BDA3EC
          6A09F5D917C624F01A52B9D81A764F775325FC756AB51F0C812E706513929370
          C022C9F0318990142D6FEDD8D9B2FAAFBF8CD5AB34AF52E89DCED87D7F986BA2
          39FC2A40EB612AA9F598749AA1DDD398CCDDF9A2C25524DA39AD6EF6F9955283
          8A931E9DDC97571C9C7A8E9139C1B41B2A99EE22C1674EE63AD7B7B4DB857D3F
          7148E69A9EDADD7D79B05254AB8A6D2D02FF00A596053B6853724511A723CA02
          ACB44813BBE493C02C10B4A09A3C714226F1DAD1D57EBF25602F6157AADB749B
          92C9DC2F3B26F3014CAA22E5B5AC68D247083D6D288E4E8884F4CE2B34818827
          8E92F785691A0051F85E6AE2F2A061994CB4D76AAE68FD5D6D593B2155D6DBDB
          424DE64ED4A5DBAFD4CCB1BAA143584F5BE30D538A2ADCA76C9B7662BADE80D8
          A4C6CB54E66E1E58D7A0704EDCADA8D46A9B8472C0CBEBFA3FB844CACAAFA5FB
          45B655430C02B279CC88AA874F2A29656A8EDE7D293F9441F59A7D6C58D69C8D
          4405016238FF009658D3B5815283C3956BD4812961182F7A81AE86EABD2D8A8D
          44C713C37EAADFD65E6421610C6F19C5DF7B58B74059F0D20747700331B0CF7E
          1FE360EC614F96F1B0593E27840062C776C09EC4D92BD9CD31B229E19B4147EC
          86E25EF5258D20AD8E9155EE110DCAB3DEAC2B3686B66AC4B3567512985BAA55
          0DC984EA81D9B1D5138B592E2872467034A30F99FE87EE86D43D52D2CDB8DBAA
          E19F1AFBB1D436C157950EAFD32F710A91EDEE9BB11B258E4AADC72B2AC09D58
          53F7290C6D3AA6F694C8D7313447D6A80389C95D8F20809705D7F85BABF99FE6
          3FAE41FE6E1FC517CB7D3F2BAFCA7D2CFA69F43FC7F9ABA79F2FEF3F30747574
          FECBC8F3FDAF0A2DC1B7E21AEDD57E6AB6FA5FD7ABAC3248FDAF7B2B67C86DE8
          1DBADCD0B15C512BED8ABD5C96475DC8DD12967A38F4B23D213D7149922B34B3
          17B6145AB2422C64D093998DB573F5E09BEA8CFEC0BFAB880F04DF5467F605FD
          5C01E09BEA8CFEC0BFAB8070DAC9AA57FEE2DB719A4B5DAB4935913E93B82342
          048CCDAACC6B6144AD5149CE92CC5F7C2C35C5228D7E2F8AADC57984A54E5079
          885F663323C207B236ADD2C5EB76B56BFEBE14F19910690A5EB2A98520C94626
          F8E9B5FC319E2C7BC0131861C6242DCCF6B11C127231F8201E03CF3CB9F1D50B
          CF007007007007007007007010E78E7CB9FA78039E3D3F9BEDE023C01C01CF1F
          6F3F47E5E00E021CF1E8CFA3F3678039E33F6671C04780B32C6162725CDEE6E2
          CCD2E0E4D23198D4E0B5BD1AA5CD860F1C8C31BD59E418A118861F467258C39C
          E3EDE02F18CE33E9C7FDF9FF00B3F2F0073C63F37FC38039E3F2E3F4E3808F00
          7010E78FCB8FD38E00E78FCB8FD38E00E78FCB8FD38E023C0483882541432541
          452824D0E4269271603493039F4F2194308806633F9F80B4FCAD19FF002E317A
          3ECFF086FF0077E00F95E33FE5D62FFA437FBBF007CAF19FF2EB17FD21BFDDF8
          0AE46D8DEDD8185BD022420333D46051244E97060B1CB964CC12006062E5FD39
          E02BF803803803803803803803806A3BAB6ACEA95D739C58B5BC8AAA89CAD955
          C54848FD73BEA48CC1D1A07495B3363D832F8EAB9A230DD2A5ACCA8F21846F8B
          DB5872F6624C38AB4E8F271980D5CC1FB8E6CBD9578D13128D06AC87C2A6708D
          5392461A76023E5D2F3FDB263B88996E2F19856B1E74B09C1FA2721AAD4C54B4
          ACCC4CA8E5C854293BCE2E72C33B835ADE084F1A3BA6ED1331E49D292600E6BC
          9A0E617C5DF5DB96B5DED0191EAAB8D75B35ADF5A5A95F3B3939C9958ED266AA
          2A5B5244BDD5D1B508CD129610BC031F0854427C94E3A09BD9B05B0BB028E154
          AA8A7566BA7D54DB0CACB5C503B45D575814BEB8C2B574E6947523D96FCC9177
          67B9C59572BFB51928C094320D035E4E6A2959A4F59CF40D49CF742EA9842A80
          AB7167C728A75766AED6618E6BF278BDEAED7DDE712BB9F684975A364D7D71BA
          CA472922230B3CD7C893818AD24970980C6E7F35AB00DD527868919A19DD36F4
          717FBDC88A3B57E2AF123143A5EDB61CCAAE78CBEE9CC75E36C7341D82B364EB
          F88CFD500D056D5B182941CD4E8E71D91203DBD51CF0991B5E0E3108F5391D50
          D80B79EF58FB8ADBA8EE8ABAD09440761EF82E9CB927E82D2866B6393241290A
          97E55907975E075746AA6913F27526BC2D8A28718F2A561725CD4A8E20EC0F87
          21A93F7744D8322ABAE64245974DD759328EBC2C268B3AD0A85D2511EDACD8BA
          82CC570E2B532976EAA2D2768C3D94B5A028D4259244DEA46B27253C27531A6F
          CFC39E1190BF00A04E77B2F297B4EECB4CD9F2B1A767D5AD2B7C8619DBD5F639
          3951B18FCCF14D7D69B0582E5597656D68C71E011D7E90BCA80015455A8684B6
          F2C2853399520214E490C17603B81DD53498EC5D215CAD93B6445D284DD36442
          CADF0C90C2B63A84B075A2AC873DC6275E6D82412597A5895BEFCF8B7E5F58FE
          D6C4E0F284E6D5ECD937193BC57907C7BFDB892DD73B4E8CAE51DE548EB4422C
          BA7B656C590DCD7557B26B252A0945203A6D443E1CD0D0C5348721201292276E
          425C154689638929028DAB2072389CE41AEB47739D87739A51E078AFD04064B2
          18A415A6F2D5C974294A7B42212C99EAE58F7EAAB0A17E4E62A67E7D72C3248D
          B3350D73C30236FC0D63835283487B4232CB781AB149FB93ED141A0BA82E9255
          B5A2FB96C6AF3576EFB56AB4153BDC4E2F634436CADC8A404359D0A091D9CF36
          EBE4EA848D2F705EF8AD1B53B14947F0F54EC4A14EB3CB168F3E4397DD9DCED8
          FA6F6B6B2A16A66CA922CCD25AAE3D62C524D79BB1313876C0D94E773B7D72FB
          AECC33A72746FF0096DFA39075817917C09049E4662F786A330D796E25778EEE
          859E2B7B5F95876F8B42CD852D324D7213BBB73D6513537737D83602065659DF
          72C90526800E0D6D2AD9E62F71D80C124B9C33109141294099BD30402C230F2E
          1FCFEC2647EEE6E952F207074BACF855955C466C3DBCA3DF08A975C2D14B632C
          2F5D68F7EBAA0D7C31B4AA982F657F7898099C6CAEB1821427683C632D436B90
          324AB24208BB87740DAD470BCB5065DAE0535A6D83B32B8FBE5B894C04D085B3
          C7B576BEBFEA98CC85C4CB45055E6BED913A992B8DAC766A93188B0DCC8AC86F
          24D7C116103F0335D94DEBDA56F6DDACAB489EC1ABEB61B7481D6E8ACD16BBC5
          0EBDD55353588D5B57CFEC2576CBDA9589A53165987292BB62307AF89931A934
          7CF6E1A071F8E275ADA638F50A74F77776C18CEBD65B1894D16F7AE755834EA0
          11EBF1155B377F40B526C744EAD9959FBA92F31B67E9232B687A9E392A3CE42C
          D1F355832352254F0EC81B1B8F52308FF101BD7EEB1F3F7CDB527CBDF7D1FBAF
          FDFF007E9ECCBEEE9F427E17E77EF7FF004F3E29FF0097FE77FF00D37F3FF1FF
          00913E71FF001BF8A7CBBFB3E16378DC01C01C01C01C01C01C01C01C01C01C01
          C01C048388215146A752494790780651E41E580D24F28C0E4232CD2478100C28
          C0E738CE058CE33C07C0D2A530D4EA069881A849834294E112588D4A13C2101C
          14E3C872611834000E07D3CB9E3973E011CAEB5CA8CA9251299B57157C4E272E
          9A0069A45236D6FEA7656DA6B9AA7B1B1245AACC506B3C644F6B8F5BF0B4794E
          DD85A78CFC13E28C43C82D05145905964905809289000A28A28012CB28B2C380
          0005803C8002C00C63A438C72C6380F911040CF2D408A2B2A092CD24A3F25832
          71651E328679459BCBC401678C806461C6790B20C73FB31C07C052A50E140429
          8808558C662A08492C21546180C1660D407A3183CC30A06022C8B9F3C6397013
          0A20924A2C828A2CB20A2C24964960080A2CA007A00500B0F2000B0031D380E3
          1CB18E02461020C14953851A409084448D11384C56094834E1C8091A42BA3C34
          E32422E40C83974E3ECE0277974F83FCDE0827CD785E5FCCF860F31E5FAFC5F0
          3C5E9F13C2C0FF005BA39F2E7E9E000A720B34E3CB20901EA3C3F30700B004E3
          FC10F413E31B80E0667860CF20F5673D3FD1C0634BA0B0C749732CF5CA2CC4BA
          6B1C617F8B304A55B62550FACD1C94B9471DE46C8DCE269425291B1EDD21ED4A
          14921160069ADE40858E65879064BE027F1FCD7805799C93E5FC7F0C3E3797EB
          F13C0F17A7AFC3EBFD6E8E7CB9FA780049C819A51E324A19E9F0660838658447
          1383B0109D824C107232F07746302E9E5D5CBD3C07C1C95328C902509C83C494
          FC294C238A2CCCA652001A585427C8C23C94A0251A30F58790B96738FB339E02
          AB80380A2CB720CA5020CA2499425F8382D1E5313E50BF00C01A47869FA3C007
          8269781079071D22C6338E5C04EC2720078D4849282A0D2CB28C3F0583071851
          4230451433718EB196588D16421FB319CE7F2E78002412124298049414C12B04
          848096109212301E8F070560382F05747EAF4F2E5CB8097E451F93F87F944DE4
          3CB792F23E017E4FC9785E0793F2BD1E0795F0BF53A3A7A3A3D1CB97012BA9D7
          D537FEFD4FBB704D1D4EBEA9BFF7EA7DDB81A3A9D7D537FEFD4FBB7034753AFA
          A6FF00DFA9F76E068EA75F54DFFBF53EEDC0D1D4EBEA9BFF007EA7DDB81A39B9
          FAA43ED4ABDDB81A8F53A7A941ED2A3DD781A87373F5487DA957BB70347373F5
          487DA957BB70351EA74F5283DA547BAF034753A7A941ED2A3DD781A87373F548
          7DA957BB70347373F5487DA957BB70347373F5487DA957BB70347373F5487DA9
          57BB70347373F5487DA957BB70347373F5487DA957BB70347373F5487DA957BB
          70347373F5487DA957BB7034753AFAA6FF00DFA9F76E068E6E7EA90FB52AF76E
          068E6E7EA90FB52AF76E068E6E7EA90FB52AF76E068E6E7EA90FB52AF76E068E
          6E7EA90FB52AF76E068E6E7EA90FB52AF76E068E6E7EA90FB52AF76E068E6E7E
          A90FB52AF76E068EA75F54DFFBF53EEDC0D1CDCFD521F6A55EEDC0D1CDCFD521
          F6A55EEDC0D439B9FAA41ED4A7DDB81AFFD9}
        mmHeight = 16934
        mmLeft = 9790
        mmTop = 4498
        mmWidth = 72230
        BandType = 0
      end
      object ppLabel121: TppLabel
        UserName = 'Label121'
        Caption = 'SISTEMA DE PREVISION SOCIAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 9790
        mmTop = 20638
        mmWidth = 44979
        BandType = 0
      end
      object ppltiprep: TppLabel
        UserName = 'ltiprep'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 75411
        mmTop = 36513
        mmWidth = 49467
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'ANO_MES_BENEFICIO'
        DataPipeline = ppbdetipben
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppbdetipben'
        mmHeight = 3175
        mmLeft = 12171
        mmTop = 529
        mmWidth = 23019
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'CANT_RETIRO'
        DataPipeline = ppbdetipben
        DisplayFormat = '#,0; -#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppbdetipben'
        mmHeight = 3175
        mmLeft = 37306
        mmTop = 529
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'MONT_RETIRO'
        DataPipeline = ppbdetipben
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppbdetipben'
        mmHeight = 3175
        mmLeft = 53446
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'CANT_FALLECIMIENTO'
        DataPipeline = ppbdetipben
        DisplayFormat = '#,0; -#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppbdetipben'
        mmHeight = 3175
        mmLeft = 72496
        mmTop = 529
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'MONT_FALLECIMIENTO'
        DataPipeline = ppbdetipben
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppbdetipben'
        mmHeight = 3175
        mmLeft = 88636
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'CANT_INVALIDEZ'
        DataPipeline = ppbdetipben
        DisplayFormat = '#,0; -#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppbdetipben'
        mmHeight = 3175
        mmLeft = 107686
        mmTop = 529
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'MONT_INVALIDEZ'
        DataPipeline = ppbdetipben
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppbdetipben'
        mmHeight = 3175
        mmLeft = 123825
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'CANT_TOTAL'
        DataPipeline = ppbdetipben
        DisplayFormat = '#,0; -#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppbdetipben'
        mmHeight = 3175
        mmLeft = 142875
        mmTop = 529
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'MONT_TOTAL'
        DataPipeline = ppbdetipben
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppbdetipben'
        mmHeight = 3175
        mmLeft = 161661
        mmTop = 529
        mmWidth = 19578
        BandType = 4
      end
    end
    object ppSummaryBand2: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 23813
      mmPrintPosition = 0
      object ppLine4: TppLine
        UserName = 'Line4'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 11377
        mmTop = 794
        mmWidth = 170127
        BandType = 7
      end
      object ppLabel44: TppLabel
        UserName = 'Label102'
        Caption = 'TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 22225
        mmTop = 1588
        mmWidth = 12171
        BandType = 7
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 11377
        mmTop = 5556
        mmWidth = 170127
        BandType = 7
      end
      object pplimpresopor03: TppLabel
        UserName = 'limpresopor03'
        ShiftWithParent = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 11377
        mmTop = 19844
        mmWidth = 71702
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'CANT_RETIRO'
        DataPipeline = ppbdetipben
        DisplayFormat = '#,0; -#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppbdetipben'
        mmHeight = 3175
        mmLeft = 37306
        mmTop = 1588
        mmWidth = 14023
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        DataField = 'MONT_RETIRO'
        DataPipeline = ppbdetipben
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppbdetipben'
        mmHeight = 3175
        mmLeft = 53446
        mmTop = 1588
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc6'
        DataField = 'CANT_FALLECIMIENTO'
        DataPipeline = ppbdetipben
        DisplayFormat = '#,0; -#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppbdetipben'
        mmHeight = 3175
        mmLeft = 72496
        mmTop = 1588
        mmWidth = 14023
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'DBCalc7'
        DataField = 'MONT_FALLECIMIENTO'
        DataPipeline = ppbdetipben
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppbdetipben'
        mmHeight = 3175
        mmLeft = 88636
        mmTop = 1588
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc8: TppDBCalc
        UserName = 'DBCalc8'
        DataField = 'CANT_INVALIDEZ'
        DataPipeline = ppbdetipben
        DisplayFormat = '#,0; -#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppbdetipben'
        mmHeight = 3175
        mmLeft = 107686
        mmTop = 1588
        mmWidth = 14023
        BandType = 7
      end
      object ppDBCalc9: TppDBCalc
        UserName = 'DBCalc9'
        DataField = 'MONT_INVALIDEZ'
        DataPipeline = ppbdetipben
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppbdetipben'
        mmHeight = 3175
        mmLeft = 123825
        mmTop = 1588
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc10: TppDBCalc
        UserName = 'DBCalc10'
        DataField = 'CANT_TOTAL'
        DataPipeline = ppbdetipben
        DisplayFormat = '#,0; -#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppbdetipben'
        mmHeight = 3175
        mmLeft = 142875
        mmTop = 1588
        mmWidth = 14023
        BandType = 7
      end
      object ppDBCalc11: TppDBCalc
        UserName = 'DBCalc11'
        DataField = 'MONT_TOTAL'
        DataPipeline = ppbdetipben
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppbdetipben'
        mmHeight = 3175
        mmLeft = 161661
        mmTop = 1588
        mmWidth = 19578
        BandType = 7
      end
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'ppBDEPAnulados'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 8467
        mmWidth = 197115
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppBDEPAnulados
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.Orientation = poLandscape
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 210079
          PrinterSetup.mmPaperWidth = 297127
          PrinterSetup.PaperSize = 9
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'ppBDEPAnulados'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 14023
            mmPrintPosition = 0
            object ppShape54: TppShape
              UserName = 'Shape54'
              mmHeight = 11377
              mmLeft = 11377
              mmTop = 2646
              mmWidth = 27781
              BandType = 1
            end
            object ppShape55: TppShape
              UserName = 'Shape55'
              mmHeight = 5822
              mmLeft = 38894
              mmTop = 2646
              mmWidth = 57415
              BandType = 1
            end
            object ppLabel124: TppLabel
              UserName = 'Label124'
              Caption = 'ANULADOS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 57415
              mmTop = 3440
              mmWidth = 19579
              BandType = 1
            end
            object ppShape56: TppShape
              UserName = 'Shape56'
              mmHeight = 5821
              mmLeft = 38894
              mmTop = 8202
              mmWidth = 28839
              BandType = 1
            end
            object ppShape57: TppShape
              UserName = 'Shape57'
              mmHeight = 5822
              mmLeft = 67469
              mmTop = 8202
              mmWidth = 28839
              BandType = 1
            end
            object ppLabel125: TppLabel
              UserName = 'Label125'
              Caption = 'MES DE PROCESO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              WordWrap = True
              mmHeight = 8467
              mmLeft = 12171
              mmTop = 3969
              mmWidth = 26195
              BandType = 1
            end
            object ppLabel126: TppLabel
              UserName = 'Label126'
              Caption = 'CANTIDAD'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4191
              mmLeft = 43127
              mmTop = 8996
              mmWidth = 18161
              BandType = 1
            end
            object ppLabel127: TppLabel
              UserName = 'Label127'
              Caption = 'MONTO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 70644
              mmTop = 8996
              mmWidth = 19314
              BandType = 1
            end
            object ppShape58: TppShape
              UserName = 'Shape58'
              mmHeight = 5821
              mmLeft = 96044
              mmTop = 2646
              mmWidth = 57415
              BandType = 1
            end
            object ppLabel131: TppLabel
              UserName = 'Label131'
              Caption = 'EXTORNADOS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4191
              mmLeft = 114565
              mmTop = 3440
              mmWidth = 24680
              BandType = 1
            end
            object ppShape59: TppShape
              UserName = 'Shape59'
              mmHeight = 5821
              mmLeft = 96044
              mmTop = 8202
              mmWidth = 28840
              BandType = 1
            end
            object ppShape60: TppShape
              UserName = 'Shape60'
              mmHeight = 5821
              mmLeft = 124619
              mmTop = 8202
              mmWidth = 28840
              BandType = 1
            end
            object ppLabel132: TppLabel
              UserName = 'Label132'
              Caption = 'CANTIDAD'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 100277
              mmTop = 8996
              mmWidth = 18256
              BandType = 1
            end
            object ppLabel133: TppLabel
              UserName = 'Label133'
              Caption = 'MONTO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 127794
              mmTop = 8996
              mmWidth = 19315
              BandType = 1
            end
          end
          object ppDetailBand4: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3440
            mmPrintPosition = 0
            object ppDBText38: TppDBText
              UserName = 'DBText38'
              DataField = 'MES'
              DataPipeline = ppBDEPAnulados
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBDEPAnulados'
              mmHeight = 3260
              mmLeft = 12171
              mmTop = 0
              mmWidth = 26195
              BandType = 4
            end
            object ppDBText39: TppDBText
              UserName = 'DBText39'
              DataField = 'CANANU'
              DataPipeline = ppBDEPAnulados
              DisplayFormat = '#,0; -#,0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppBDEPAnulados'
              mmHeight = 3260
              mmLeft = 43127
              mmTop = 0
              mmWidth = 18161
              BandType = 4
            end
            object ppDBText40: TppDBText
              UserName = 'DBText40'
              DataField = 'MONANU'
              DataPipeline = ppBDEPAnulados
              DisplayFormat = '#,0.00; -#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppBDEPAnulados'
              mmHeight = 3175
              mmLeft = 70644
              mmTop = 0
              mmWidth = 19315
              BandType = 4
            end
            object ppLine6: TppLine
              UserName = 'Line6'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 3439
              mmLeft = 11377
              mmTop = 0
              mmWidth = 264
              BandType = 4
            end
            object ppLine7: TppLine
              UserName = 'Line7'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 3439
              mmLeft = 38894
              mmTop = 0
              mmWidth = 264
              BandType = 4
            end
            object ppLine11: TppLine
              UserName = 'Line11'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 3439
              mmLeft = 96044
              mmTop = 0
              mmWidth = 264
              BandType = 4
            end
            object ppLine12: TppLine
              UserName = 'Line12'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 3439
              mmLeft = 67469
              mmTop = 0
              mmWidth = 264
              BandType = 4
            end
            object ppLine15: TppLine
              UserName = 'Line15'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 3440
              mmLeft = 124619
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppLine16: TppLine
              UserName = 'Line16'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 3440
              mmLeft = 153194
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppDBText41: TppDBText
              UserName = 'DBText41'
              DataField = 'CANEXT'
              DataPipeline = ppBDEPAnulados
              DisplayFormat = '#,0; -#,0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppBDEPAnulados'
              mmHeight = 3175
              mmLeft = 100277
              mmTop = 0
              mmWidth = 18256
              BandType = 4
            end
            object ppDBText42: TppDBText
              UserName = 'DBText401'
              DataField = 'MONEXT'
              DataPipeline = ppBDEPAnulados
              DisplayFormat = '#,0.00; -#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppBDEPAnulados'
              mmHeight = 3175
              mmLeft = 127794
              mmTop = 0
              mmWidth = 19315
              BandType = 4
            end
          end
          object ppSummaryBand4: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 4233
            mmPrintPosition = 0
            object ppLine13: TppLine
              UserName = 'Line13'
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 11377
              mmTop = 0
              mmWidth = 142347
              BandType = 7
            end
            object ppLabel128: TppLabel
              UserName = 'Label128'
              Caption = 'TOTAL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              WordWrap = True
              mmHeight = 3440
              mmLeft = 12171
              mmTop = 529
              mmWidth = 8996
              BandType = 7
            end
            object ppLine14: TppLine
              UserName = 'Line14'
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 11377
              mmTop = 3967
              mmWidth = 142347
              BandType = 7
            end
            object ppDBCalc21: TppDBCalc
              UserName = 'DBCalc21'
              DataField = 'CANANU'
              DataPipeline = ppBDEPAnulados
              DisplayFormat = '#,0; -#,0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppBDEPAnulados'
              mmHeight = 3175
              mmLeft = 43127
              mmTop = 529
              mmWidth = 18161
              BandType = 7
            end
            object ppDBCalc22: TppDBCalc
              UserName = 'DBCalc22'
              DataField = 'MONANU'
              DataPipeline = ppBDEPAnulados
              DisplayFormat = '#,0.00; -#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppBDEPAnulados'
              mmHeight = 3175
              mmLeft = 70644
              mmTop = 529
              mmWidth = 19315
              BandType = 7
            end
            object ppDBCalc25: TppDBCalc
              UserName = 'DBCalc25'
              DataField = 'CANEXT'
              DataPipeline = ppBDEPAnulados
              DisplayFormat = '#,0; -#,0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppBDEPAnulados'
              mmHeight = 3175
              mmLeft = 100277
              mmTop = 529
              mmWidth = 18256
              BandType = 7
            end
            object ppDBCalc26: TppDBCalc
              UserName = 'DBCalc26'
              DataField = 'MONEXT'
              DataPipeline = ppBDEPAnulados
              DisplayFormat = '#,0.00; -#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppBDEPAnulados'
              mmHeight = 3175
              mmLeft = 127794
              mmTop = 529
              mmWidth = 19315
              BandType = 7
            end
          end
        end
      end
    end
  end
  object ppbdetipben: TppBDEPipeline
    DataSource = dsresumen
    UserName = 'bdetipben'
    Left = 690
    Top = 168
    object ppbdetipbenppField1: TppField
      FieldAlias = 'ANO_MES_BENEFICIO'
      FieldName = 'ANO_MES_BENEFICIO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 0
    end
    object ppbdetipbenppField2: TppField
      FieldAlias = 'DESC_MES'
      FieldName = 'DESC_MES'
      FieldLength = 20
      DisplayWidth = 20
      Position = 1
    end
    object ppbdetipbenppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'CANT_RETIRO'
      FieldName = 'CANT_RETIRO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object ppbdetipbenppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'MONT_RETIRO'
      FieldName = 'MONT_RETIRO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppbdetipbenppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'CANT_INVALIDEZ'
      FieldName = 'CANT_INVALIDEZ'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 4
    end
    object ppbdetipbenppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'MONT_INVALIDEZ'
      FieldName = 'MONT_INVALIDEZ'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppbdetipbenppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'CANT_FALLECIMIENTO'
      FieldName = 'CANT_FALLECIMIENTO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 6
    end
    object ppbdetipbenppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'MONT_FALLECIMIENTO'
      FieldName = 'MONT_FALLECIMIENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppbdetipbenppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'CANT_TOTAL'
      FieldName = 'CANT_TOTAL'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 8
    end
    object ppbdetipbenppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'MONT_TOTAL'
      FieldName = 'MONT_TOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
  end
  object cdsresumen: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ANO_MES_BENEFICIO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DESC_MES'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CANT_RETIRO'
        DataType = ftInteger
      end
      item
        Name = 'MONT_RETIRO'
        DataType = ftFloat
      end
      item
        Name = 'CANT_INVALIDEZ'
        DataType = ftInteger
      end
      item
        Name = 'MONT_INVALIDEZ'
        DataType = ftFloat
      end
      item
        Name = 'CANT_FALLECIMIENTO'
        DataType = ftInteger
      end
      item
        Name = 'MONT_FALLECIMIENTO'
        DataType = ftFloat
      end
      item
        Name = 'CANT_TOTAL'
        DataType = ftInteger
      end
      item
        Name = 'MONT_TOTAL'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'cdsbeneficiosIndex1'
      end>
    Params = <>
    StoreDefs = True
    Left = 793
    Top = 64
    Data = {
      0F0100009619E0BD01000000180000000A0000000000030000000F0111414E4F
      5F4D45535F42454E45464943494F010049000000010005574944544802000200
      140008444553435F4D455301004900000001000557494454480200020014000B
      43414E545F52455449524F04000100000000000B4D4F4E545F52455449524F08
      000400000000000E43414E545F494E56414C4944455A04000100000000000E4D
      4F4E545F494E56414C4944455A08000400000000001243414E545F46414C4C45
      43494D49454E544F0400010000000000124D4F4E545F46414C4C4543494D4945
      4E544F08000400000000000A43414E545F544F54414C04000100000000000A4D
      4F4E545F544F54414C08000400000000000000}
  end
  object dsresumen: TDataSource
    DataSet = cdsresumen
    Left = 800
    Top = 70
  end
  object bdeprepxtipbendpto: TppBDEPipeline
    DataSource = dsbeneficios
    UserName = 'bdeprepxtipben1'
    Left = 657
    Top = 168
  end
  object pprrpxtipbendpto: TppReport
    AutoStop = False
    DataPipeline = bdeprepxtipbendpto
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210079
    PrinterSetup.mmPaperWidth = 297127
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\Documents and Settings\irevilla\Escritorio\REPXTIP.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 649
    Top = 128
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'bdeprepxtipbendpto'
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 50271
      mmPrintPosition = 0
      object ppLabel79: TppLabel
        UserName = 'Label20'
        Caption = 'Fecha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 248973
        mmTop = 2117
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel80: TppLabel
        UserName = 'Label201'
        Caption = 'Hora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 248973
        mmTop = 5556
        mmWidth = 6085
        BandType = 0
      end
      object ppLabel81: TppLabel
        UserName = 'Label22'
        Caption = 'P'#225'gina'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 248973
        mmTop = 8996
        mmWidth = 8731
        BandType = 0
      end
      object ppSystemVariable7: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 263261
        mmTop = 2117
        mmWidth = 14023
        BandType = 0
      end
      object ppSystemVariable8: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 263261
        mmTop = 5556
        mmWidth = 17463
        BandType = 0
      end
      object ppSystemVariable9: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 263261
        mmTop = 8996
        mmWidth = 1588
        BandType = 0
      end
      object ppltitdpt01: TppLabel
        UserName = 'Label21'
        Caption = 'LIQUIDACION DE BENEFICIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 110596
        mmTop = 26194
        mmWidth = 49213
        BandType = 0
      end
      object ppltitdpt02: TppLabel
        UserName = 'ltitulo0102'
        Caption = 'DEL 04/11/2005 AL 30/11/2005'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 110596
        mmTop = 30163
        mmWidth = 49477
        BandType = 0
      end
      object ppLabel85: TppLabel
        UserName = 'Label85'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 259557
        mmTop = 2117
        mmWidth = 794
        BandType = 0
      end
      object ppLabel97: TppLabel
        UserName = 'Label97'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 259557
        mmTop = 5556
        mmWidth = 794
        BandType = 0
      end
      object ppLabel98: TppLabel
        UserName = 'Label98'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 259557
        mmTop = 8996
        mmWidth = 794
        BandType = 0
      end
      object ppLabel118: TppLabel
        UserName = 'Label118'
        Caption = '(Montos en Nuevos Soles)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 115888
        mmTop = 34131
        mmWidth = 38894
        BandType = 0
      end
      object pplUsuarioxDpto: TppLabel
        OnPrint = pplUsuarioxDptoPrint
        UserName = 'lUsuarioxDpto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2381
        mmTop = 26458
        mmWidth = 61648
        BandType = 0
      end
      object ppImage1: TppImage
        UserName = 'Image1'
        MaintainAspectRatio = False
        Picture.Data = {
          0A544A504547496D61676543290000FFD8FFE1001845786966000049492A0008
          0000000000000000000000FFEC00114475636B7900010004000000640000FFE1
          036F687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F003C
          3F787061636B657420626567696E3D22EFBBBF222069643D2257354D304D7043
          656869487A7265537A4E54637A6B633964223F3E203C783A786D706D65746120
          786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A786D70746B
          3D2241646F626520584D5020436F726520352E332D633031312036362E313435
          3636312C20323031322F30322F30362D31343A35363A32372020202020202020
          223E203C7264663A52444620786D6C6E733A7264663D22687474703A2F2F7777
          772E77332E6F72672F313939392F30322F32322D7264662D73796E7461782D6E
          7323223E203C7264663A4465736372697074696F6E207264663A61626F75743D
          222220786D6C6E733A786D704D4D3D22687474703A2F2F6E732E61646F62652E
          636F6D2F7861702F312E302F6D6D2F2220786D6C6E733A73745265663D226874
          74703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F73547970652F
          5265736F75726365526566232220786D6C6E733A786D703D22687474703A2F2F
          6E732E61646F62652E636F6D2F7861702F312E302F2220786D704D4D3A4F7269
          67696E616C446F63756D656E7449443D22786D702E6469643A38384242323139
          413845363945333131393530364335414333303344354330382220786D704D4D
          3A446F63756D656E7449443D22786D702E6469643A3442453033434441363939
          3831314533383235463846314639373642313741362220786D704D4D3A496E73
          74616E636549443D22786D702E6969643A344245303343443936393938313145
          33383235463846314639373642313741362220786D703A43726561746F72546F
          6F6C3D2241646F62652050686F746F73686F7020435336202857696E646F7773
          29223E203C786D704D4D3A4465726976656446726F6D2073745265663A696E73
          74616E636549443D22786D702E6969643A384642423231394138453639453331
          3139353036433541433330334435433038222073745265663A646F63756D656E
          7449443D22786D702E6469643A38384242323139413845363945333131393530
          36433541433330334435433038222F3E203C2F7264663A446573637269707469
          6F6E3E203C2F7264663A5244463E203C2F783A786D706D6574613E203C3F7870
          61636B657420656E643D2272223F3EFFEE000E41646F62650064C000000001FF
          DB00840001010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010202020202020202020202030303030303
          0303030301010101010101020101020202010202030303030303030303030303
          0303030303030303030303030303030303030303030303030303030303030303
          0303030303FFC00011080040010403011100021101031101FFC4009C00000102
          070101000000000000000000000007080103040506090A0B0201010101010000
          0000000000000000000000010203100000060200040207030808030901000002
          03040506070108001112091314215394D415161731180A516191222393193941
          D192242556B778A133957181D336274768C81A8A110100030002000602030000
          0000000000000111213141516171810212B1D1F0A132FFDA000C030100021103
          11003F00D6A7E21FEE59B05B49BCB7D6B9993691C5B5B75BAC97FA8E255233BB
          2D6E8DBFC9600B4D8FCAAC49B22467109659227893A35996E1AC01806B6AC924
          A7000625672AC7CA76BA573BD938DFE830CE5F9CC167FE3E8E203C537973F14C
          FC9FF305CFF473E7C047C51FAE3BF4E7FF001389A1CE6A76E3EC5E91DB91DBAF
          5BACC9157F30625E894AD4685C570A2D336A4AA4B52A6293F8C96AD3B74BE26E
          982BA54A25411079F234B116704A3408B891EC67AC774A5D8FD70A1360D1340E
          3C96F0A6EB4B64A8F9AA32B06C3F5061ACF2A1B30966494DE732D237411193BC
          3060DE8EAC631CF971D50BA70070070070070070070070070070070070070070
          070070070070073E5F6F006338CFD9C01C01C01C019CE31F6F010E78FCB8FD38
          E0239CE31F6F00701E379DD8FF0099E7703C7FF30F617FD5092FF5F1CE79564C
          D5D9E7B9BBD51A1D8D6AD30B9555526C7C32C4AE38696B2E5CBE28680B3CA933
          65567BA956B3B47D421330A8A5A9990E4C721CF9A00B24733787D64380DA2EDC
          D3FB7F6E6ADA1740F5C2452D7179D22D3BB9A4D18871CB0E6C6D76B0F5F6BF95
          CEA7B2E94CCDE4A6486373E4BA42664C39C57A240158A42495D22180AE131738
          1B3C7BB4D771C945FD26D5F66D44B6CCBB218CC9E49288C383735B332B2C5D71
          AB486A942BB15EDD9B6B60C59FD537A925B5CC0EF940E67A730A4A69C60041E1
          5F2B4B34DBCE83B97596CC91D377E56D2BA9ECE8A8C803E43E62D8636B9A6256
          1385081C1319FB448EACEE89861391AE4661C89610209849A60058CE64DF6AF5
          F3ED63FCB47403FD9BEB7FFA4713E3AA15CD91DC8D57D4065677FD9DBF6AEA49
          048CF3D3470B9F4A9BD9DD64A6A31A62D7E238C19198FD202DB32B89CAB1A34C
          781284D088DC8022C6780E6E7B8B7766D848C774DED5F59E98ECE449EB4E76BC
          DA2332C360CC356D8D12B18A95ECD3FD6B3B0229DAD8FC81E111E18EA029B8F2
          9BD7A339B14807D41028EAE52E6E23A1D19EC86F0EA169FE1903B37B1B52D28B
          24850D4C7D9E75306D6C913E2228FF002C738B5468261EFEBDAD3A9FD99CA8A4
          C24E519E818F19E28CC59368F5BE4B492FD948EDED53BFEBFB4B4B9BF3ADCACF
          3C8E39D6ED6D2CBCC2F2B1CA5C8DC0E666F0B38B190AB01A680C4E6632033011
          6338E013A6FDFDD27776DA7DE1A369E8E776BBFE4B248852CE0D161C7DCD2597
          228764E2E5C82247205AA0B732E307938257A80E7CB235261449A600D3C900C2
          CE4771DD0B575D116DA0DBCD7F74AD1559CD34BA39B345971A76605F6C3EA546
          E2D75E372D6D5CA42E12A52D2B8B5B9484E0C38A41D4A8CC05380668428AD8EE
          65DBDE8D992CAEEDBDD0D6C824EDB1C4E697A883DDB90E2E431E744E6E0950DD
          26694EE8A164656A737D0616BC29C60F4F3FB33C2E02CB2BDABD6783D3683626
          5B7F53EC5423AFC33E15732EB0E2C1AC9D7E34B3E1CD196B9A96E638F38FC457
          872493E0A81F5998C871CF38CF2045275DCDFB7BD66E155B5CF37275EA28AEEC
          8DB24D2B0CBC5971E4E92530B9264F047A665AFC2B13735441F4C4C6811BA2E3
          52A152324C096688458B1860BCDD3DC5744F5CACA69A76F5DB2A22ACB39E7084
          C221732B0D81A9E9B53B9929D5362C93146AAC950E40E8955166A550EC344428
          273D650840C67385C0576E3D9BD74D798AB5CE6F6BDAA3A7E22F981E58243645
          83168735C8BA1312AC408E297C74440901D84AA0B33A11F8C3F0CCC67972CE39
          8615AF5BC1A7FB60ADDDB75AF65A97BADE581265C9EE3F5F5811F90491A1AF0A
          4A47F17728DA559F1D46CE258A0B282AC69829C468F01C0F22CE31C0393757A6
          763253287A756C674EB5CDB19519EE8B933792ADE1ED7A76B666A4C6AB34A01E
          E6ECE4A8A4C9480E7269E79812CBC6442C632090C4F67B5B27B66C9293836C25
          2133B961C27404BAA58A5AD0490D99171B12B290BD824304687E572765133AD3
          824ABC294A5E539A2C00CE916718E0257DE9759BEB07DDEBEF1345FD7DF13C2F
          A21F56A05F56FC6F85FC77C0FA6FF1FF009BFCC7C17FBEF4793EBF2BFB6FF97F
          ADC065D695CB50D1D191CD6EBB52B7A7E185282519B2CB46731880468B58A39F
          974837D9639B4B60551DD39E8064DEA172CF2C7A380ABAD2D6ABEE788A29F53B
          6440AD782399AA486D9A56B308F4EA26BCF446E49584229145DC5D1A151C90EC
          640680B3B392C58E42C633C02713FDB9D53AA27ED754DA5B35AF95B5A0F7F0DC
          B356F3EB9ABA87CF1DB0F4779766136C4243236E7F5B876521C969725A717981
          E3917D59F47011BF5DA54F9584FD8E97BEEB5A4AD1607B81B71F614D98D92C36
          180295F2588BC2B639642D64A230501C6750B5F942DE050B529A131D932A2B06
          67C3098178B8B6575D35DCB6036FFBF295A34A961EAD34587705A507AD012552
          8029B2B93B00A66FACD8783908561393829FAF2560C07572C0B1CDC721A36F07
          710AEF519669C165CD693588F66B66AB3AB9ED5CCECC636029828F98C7A6CE72
          2BB580D03984A5EC51C72626D4D95E6FF84604E2009A703232F3C27390F322D7
          DD173A823F5A508BA2A798D611513C065163C5AC587C86071B1479116E2FC17E
          97B4BC2C8F34098DBCE09EB3CC282FCB102C0CCE90E719E028A9CD8CD7DD8940
          F0EDAFF7AD3B79354755A640FEE5505990BB29031AE5648D42346F0AE1CF4F49
          DB152A20191940384011810E738C6718CF017B925D14F43A3C8E5D2EB5EB58B4
          4DC6505C1DBA51239D461963ABE686BDA88C950F44F4E4E899B55CA4C91A435B
          F0DE59B95795A5893E0BF14390E0304AB9F64505AEA7724BEAFAACE789186C5B
          71D0EB19B5B186B788C12048666F6264834A148A44E6D25BC556CC461A5DDC94
          A84E61CA51983505966E079C85EA9ED95D73D882DF0EA06FDA56F12A306A6224
          86D3F69C1ECC0478F59E2F9325EC70B7D7AC3518AF040F2584FF000F23C005CB
          9F2CF2723493F7E5DA7F9E3E0FF53D3FC3FF00FD0E7DC73CBFC990CE5F75AFA0
          9F39FD31F17E0FD5E3FCC3FDE3E33CFE33D5FB3F31D3FA9C66FF002AE49ABB8A
          54F38FC5053E8C5D28232F10D71EE19B2C63630CC4CC971591DA0DEF567B951F
          197E2C61196B50492EA471F4262234224EBBCC796342228D163333EDA34E33EB
          CF73D56E2C86E19ACFAEB6DDD9496DAF29D5FF000B648CF71305B089F8C65322
          6D881064878605ECAE85E5A53322524A4E8C90010129C050024E33737E63A4BE
          F756258276AB6D54B5CDDDBA3767DBDBF1A574DED486BD7A270D52495D37DAFE
          B9944CE997C5CC0E2A50BC452A5BC642E8689A4C11C991BFF50841F1D28041DC
          F1EE9DB55B71EC0DDEF9D8AB506B277B5664E55FFDF7B66A1A289AA785236F3E
          235CD67414A60316579CE7CCAC8E4364964BEAD6F4261B94898E71C6405F3208
          C932E7EB4AB4EF33B39CDFB54F66AB0A62B5649E78595BE353E66AFC70DD2527
          D61565BD5CE2B3811EFCACC35CD744EBD2654E44332238D114D49D5984A60964
          F2070F97108F4B3ED65FCB4BB7F7FB38D6FF00F48A29C6C71F554D055D7774FC
          48FBBB03DEC74779657FAF38B85A6B9A754C99E638DD268D5253D8ED57078337
          9ADAE8DAF6D51B21BA42AE5AB9334284A6B839E4F54663251EB303C73F2D5255
          BD3A0BAD7A19F883FB66567ACA4AB8B571675CDA9168AEAA8E91BBC952D71207
          2D8DC4517A38FB83F383B3EA6649395152D7929D6293CC214987E0B1052F9624
          A4C57CA2836FD7A9AB5EDDF707EE13B15B63DB6769BB9FCD49B25C18982B2AB1
          C24C38B514D2AE5B35606B699CB74690AA7DCFCBD1589A4648C1423F089214DE
          B44612729C90A533B9B80BB6B9D2DB49AEB56F7BF89675276E3547B7E5C5A2D7
          85935B41B63A36FE04B12B3236E90D4B01650CBDE9A1B1B5548871C91BDA1F0C
          A18DC96B6A44BE74C586A009F8B1DF852161EC25DAB20D61E9EBDF744B7E7D3D
          7F9BD1C9EF42F562B442FE14D5EC353D7516952B707D942434A39C1C82ED61BE
          B8292DA129EDC80224E250ABCE79E30B25F18EE4379FC397DA72AEDF262B1F63
          F65ACEB09AE9CD5CB59914D775AC2A5638B369D6990DB1F9BCAE712774392AA1
          3333A08F32B3261E1B7095C1767908C5840111403DF18B0BE3995A15DC9EF5DC
          3B4751BB116C46E5C49FECC993F595B4ECFB672DA31CC12B95962717C9455D59
          2F20E830E48E6E869B2142C4A0D5AEAA3CE80C5A8892D47920327881ABCD7E97
          CB55762AEEB74EBC2F7CC426A7DA9D3392C2A2B200E32BA29229ECE65D1F9AE0
          E2F00F0D02C7043016E0AA28BF08B0A94E316318C9A2EA91FE654F97623B476A
          0407F0E9555DC01A1A2666ED5AD8DD2D623D58ABA66FEB913EA1B3AC563829F5
          F2A87A970510F6F8A45E3D242F0DE6244699CB0A5BCAC9AA46030D2449F8C447
          9A24583DA7F5213FE1BE67EE306B6CE5CF6F14A18858ABED1709BC855A67142F
          97FB7D359AF15C416AE5116C445AA20BC034E781281DF2E290B37CDF96C891E5
          51F5B9E57B2BCB766F4E65DDB0BB2F6B1ED0E9DDABDC736C9E22D60BF5194A43
          EC496560E08602A6DDB3E978832BF587174EE331358DF1140D1266E666D4E615
          92E2851AACC4A993100536E2AA790D74EAF1FF004CFBD276C87EAD341EDAED78
          ED60DD550C5A4355492F73360215316699D9AD35DCED6C02C3C80F5CA9AA4105
          981ADEF4D872C5004A79A1C00B27AB1812AA611DA877A189027FA8509800A432
          487FCFBB9BA310CC4C616E8730CD622193ED4D5AD0A2450D90251056B04A1B12
          2B306897119C9A94FE430E3D19E353C0493BA16976B0D37DB6AEE9BD174EC128
          5B1B542B270B875DAD3A7630C705B32ACB0AB74E43C333E304E5A1127921A6BE
          650E52BDF985270DE922A3C2A846986789874156BC3B7169AC4BB7F5AF5A4729
          383B19D0EA3671358D5B0963CCE3BBD92DA8EC35CA52D17B916C9A9899B1D742
          198A229EC4FE6AEC2D3DC03911A664B1081C2434F8F6C1C5F682BFD2B465E834
          1BB916F3B568C6BADD36D496C32EA286D6F41336C3D78C4FE15533B52C68E4A1
          3C5665713F30AD5CDF1C8F3139399ADE8CE527012A1C1461D2EE3CCECD7E773F
          BE34FF00622EDB5E0FA391AEDF1389876B0DF6B15643AB9B3AAFB5E87BF2DBD5
          56DAF26F4CCDDA20F59B142D3FD54ABBE747125C1C5F18122A756277C202B278
          53E3207E86DFB50340B4753EAA55C23296A7360C57056B13B1ACBBBADA84C4EE
          19E6C74A2C98F249649AD6B1E7F356F90BD4E1CA7AE2FA7B875A8546A44E4A90
          A7480252964940540D06DDB4ED7146EB5F7EBA76AE7A769556F01DB5EDB2C314
          1CA256E13E5F13694CE5A98E096A1264AF2A97BA2A8CD2C62BF979911A95071E
          CED6853B78CCC89264594F1EFF00A1B54BDA939A515B9BB2DB4169E8187B8FD2
          37DC72B61314B610DB5C599B0FABF1AACA008E24EF45B051375485A1B26155CB
          E5197095A61C10E4EECA1D5E9C00EADEBC6044A30F30D7F64229DBE2DDA9FB53
          BD6ACD275423AB3F8C0D795BC86BA72A81244DEAB190BE365F2F778D2136ACA6
          4C091EAB1569A748CB54F1133D2236FF001C84EA0A4E34F94868A4D4D7A9050F
          73D35511DDFBD7CD2945A6330B4754607AED3ADE0956AE6A756951A48A5C578A
          9B722B52C22457A575207BAD227308055E992A972291E559E05F235EDE7AF4C7
          94DE4745EEBA1779B237496EC6EA3DC7A8BDB3B6AB542F1825F159C46CCB257D
          45425555CCEF50A70FE8A33B055B5D47C06F45A54A6311A891C549E3C156D2F0
          B1AE4AC2886D6024472918931DF62FDDA9B47EA99F47671B297AB430DE8BE29B
          81BB51FD418D4FD81A1FA17AC558B16E25AEA1C1657713716CCB337DB93BB39A
          DC1E9E260328D90284816C401525266F015956DC84AAABB268866D67514B595A
          B09B76EDBBBFBA0F71C7CD79D603D8A04E044CE6355ECF5C92091D92FEF16AAC
          455E4361D5B3439872E6F6E061DE586E24904A75279E12B2C18BDECCB74D636C
          697DD62ED5B5CE8F4C229BA5AC75B636335B6FBA3658CA3AAEF9B6E3F51D9D55
          5D3148B55F59CC65D059FB2CC7CB224A4A25C5B7C8468DC42A52E538C2A4132F
          FDC9FF00FACAFF00EAEF13F6BD7B3895EEB0A0F45DD0F7F55A434E4AAD36E4EC
          2284CA539A610A139E45AB2334A3C838192CC24D2860EB00C3E9E7CB38E333C8
          5BD277BFDEE4CD891C8E74A19DEF36E654B1A6BDC27ED6EA65E770DB98914771
          144C98BBF1C2207CA95BB96C18C9187C5383E442E79332BFC6CF5F0FB4FB8634
          FF00B6175CAB5DD7EB149A484C86B777D8F78DAF795EF8930E93B7ABAA45082E
          BF7C92BCCDD79C7BE3A16EAC24F59E51E60B272B165408591E79F12F28634F77
          FD86FDAF903D635EA5A05575736958570C69281A8A29F0B995991D83C5A4E6AC
          7AC0B2A16379AD75EB77809FA71828CF133CF3D58C05782BE79B296859342D03
          ADF275ACC755FAD2E5703B55A89131A342F08965E0FCC1249F09E9E4BC655BEE
          153A4692E5378B91652978C8439E9E58C3781EBA9DAC7F968E807FB37D6FFF00
          48E27C7546AA7B93FE1F449B6BB52DFBCFA95B472FD2BDA23BE1C6CCE4D176B7
          A5AD9267A69662632DF3561758ACBA172880CC0C8C17842E4626395A37720A2F
          232083C6B142B931737D86E711FC30F2763DAAD5ADC296F707B12DCBA2A4B36B
          8B86F6975AF03719A3FDCF33AEEC16D94B6258E3DBAD946BA4218088A3221642
          42B8D7F3CBC939521100BC948899F5DB0B9EDE7E1F6964AB6D26DBB1DBB375EC
          1D09B9ADA39DD6DBED3186F7C5D1796BCC95612E72A796E708D4B62CECD29E52
          F69C0E4E4D4B0B766F52EBCD493E544108316B6C2A543F648B56BAD3ADEAA0ED
          EEE0773EC25BDBDF1871679AD916323757DAEA0CF6A9A0D6804B2395B3ECD1DD
          E9CA5CE080C2923AB99AFA9C4B903737272C84C0420C8D101D976FAEDA2E1A39
          DBB1FB44155D24D8CB1ED1DD494168A481662A5377D5D29D40030B889F2B91E5
          665806E7E2721B863CCE71CBF678E5CAC64504FF00B3D7691FE169415D744C96
          E76FD836CB92C23266B96975D1D5EA540DAAA16D10D5EC0A1BCD99CC86E21584
          3708623707138E91F2E9FB73C48C81AEAA43F0ECECFEAA4D2CE836A97764BA68
          3D3AB7E5637A985590E81220DAA9D80C30297E171DB1954A543446E7D88E124B
          77CE0DAD88169A020919E8CD012023844570319AC7F0C038D6BA65BA7A869773
          D3B991B5D636BE4CDA66CAA8E3427419B284934BDFC86F766705A81F9ADC64E4
          4AC25187814A02D29A9BC4C16678990855514365D6FF0069176B53B3AC3FB55E
          2FD4AC8E31783D470F36EF156827146BFE974F23F37F1C35F066880F4A4BA858
          B09318F8C08C2702C1B91199C64194C5C50A594F685739276626FED318D814A9
          5C5144A2F1ACDED9ACF26243B31CBB1BAE2F17E9D026A518020F021C36631F19
          C998C67CC6739CF32F85650D7DCF3F0D34A0751E8AAAA4F77DF6A5DBCD1D88BD
          C1983601AAB7529DA2671B576DCFED88B1208B249DFC5226E5075D63B8212D46
          17B994E680CC92A53F40B1802BCF4642BFF0F0DF7626DAEA3EEAEC3F7359FDFD
          7650762D713E9E9B39A7DAC11A90A1AC2C96B9F4760952B0B1CD199BEA68B9C4
          A4509D607C1710295EACE70C12508D191956C48DF96DBEB8A8DA0AF60D054F32
          0C1870DD82D77BCB2EA362C487E200A1EE1885AC28CE11E5D1A7CA8A4DF2B791
          F37E20FCAF8DE2F846F4F40A8AFDC8D7C3B6C355AFED6B4F2D0C0CEBBAAF94D7
          209989971230C685246F310FC544C427167F8AE12E0CCE72479A23ABECEB0FDB
          C029B65400760D453FAB30EF968366D5BCAABFC3F811855E5AC5258C2E8EE1E0
          0DA23C90A9CA3CADF1F04E4D0E07D3D1D78E7CF80D5840BB726C76AA0AB49BE9
          7EC6D60D76421D56D6ED62D858A5FB4F482594D5F8A358A189E0D5A5CED24422
          C58B5875158AD51E50E0DE71299D5E1A1C5B54272D425F3288B58395E033EAF3
          47F611B36AE09BD5B25B479BA6CB83D2973552EB4A56F531709A39AA273D3E02
          FCD4C149C41E66F2992B34802F90B506BDBD3F3C3DB9CA047214DD4D889BC94D
          C581AC788583DB6E2512B0239587761DA4EDA75AAF54F0E73FD0B9A4A6BDA3EC
          6A09F5D917C624F01A52B9D81A764F775325FC756AB51F0C812E706513929370
          C022C9F0318990142D6FEDD8D9B2FAAFBF8CD5AB34AF52E89DCED87D7F986BA2
          39FC2A40EB612AA9F598749AA1DDD398CCDDF9A2C25524DA39AD6EF6F9955283
          8A931E9DDC97571C9C7A8E9139C1B41B2A99EE22C1674EE63AD7B7B4DB857D3F
          7148E69A9EDADD7D79B05254AB8A6D2D02FF00A596053B6853724511A723CA02
          ACB44813BBE493C02C10B4A09A3C714226F1DAD1D57EBF25602F6157AADB749B
          92C9DC2F3B26F3014CAA22E5B5AC68D247083D6D288E4E8884F4CE2B34818827
          8E92F785691A0051F85E6AE2F2A061994CB4D76AAE68FD5D6D593B2155D6DBDB
          424DE64ED4A5DBAFD4CCB1BAA143584F5BE30D538A2ADCA76C9B7662BADE80D8
          A4C6CB54E66E1E58D7A0704EDCADA8D46A9B8472C0CBEBFA3FB844CACAAFA5FB
          45B655430C02B279CC88AA874F2A29656A8EDE7D293F9441F59A7D6C58D69C8D
          4405016238FF009658D3B5815283C3956BD4812961182F7A81AE86EABD2D8A8D
          44C713C37EAADFD65E6421610C6F19C5DF7B58B74059F0D20747700331B0CF7E
          1FE360EC614F96F1B0593E27840062C776C09EC4D92BD9CD31B229E19B4147EC
          86E25EF5258D20AD8E9155EE110DCAB3DEAC2B3686B66AC4B3567512985BAA55
          0DC984EA81D9B1D5138B592E2872467034A30F99FE87EE86D43D52D2CDB8DBAA
          E19F1AFBB1D436C157950EAFD32F710A91EDEE9BB11B258E4AADC72B2AC09D58
          53F7290C6D3AA6F694C8D7313447D6A80389C95D8F20809705D7F85BABF99FE6
          3FAE41FE6E1FC517CB7D3F2BAFCA7D2CFA69F43FC7F9ABA79F2FEF3F30747574
          FECBC8F3FDAF0A2DC1B7E21AEDD57E6AB6FA5FD7ABAC3248FDAF7B2B67C86DE8
          1DBADCD0B15C512BED8ABD5C96475DC8DD12967A38F4B23D213D7149922B34B3
          17B6145AB2422C64D093998DB573F5E09BEA8CFEC0BFAB880F04DF5467F605FD
          5C01E09BEA8CFEC0BFAB8070DAC9AA57FEE2DB719A4B5DAB4935913E93B82342
          048CCDAACC6B6144AD5149CE92CC5F7C2C35C5228D7E2F8AADC57984A54E5079
          885F663323C207B236ADD2C5EB76B56BFEBE14F19910690A5EB2A98520C94626
          F8E9B5FC319E2C7BC0131861C6242DCCF6B11C127231F8201E03CF3CB9F1D50B
          CF007007007007007007007010E78E7CB9FA78039E3D3F9BEDE023C01C01CF1F
          6F3F47E5E00E021CF1E8CFA3F3678039E33F6671C04780B32C6162725CDEE6E2
          CCD2E0E4D23198D4E0B5BD1AA5CD860F1C8C31BD59E418A118861F467258C39C
          E3EDE02F18CE33E9C7FDF9FF00B3F2F0073C63F37FC38039E3F2E3F4E3808F00
          7010E78FCB8FD38E00E78FCB8FD38E00E78FCB8FD38E023C0483882541432541
          452824D0E4269271603493039F4F2194308806633F9F80B4FCAD19FF002E317A
          3ECFF086FF0077E00F95E33FE5D62FFA437FBBF007CAF19FF2EB17FD21BFDDF8
          0AE46D8DEDD8185BD022420333D46051244E97060B1CB964CC12006062E5FD39
          E02BF803803803803803803803806A3BAB6ACEA95D739C58B5BC8AAA89CAD955
          C54848FD73BEA48CC1D1A07495B3363D832F8EAB9A230DD2A5ACCA8F21846F8B
          DB5872F6624C38AB4E8F271980D5CC1FB8E6CBD9578D13128D06AC87C2A6708D
          5392461A76023E5D2F3FDB263B88996E2F19856B1E74B09C1FA2721AAD4C54B4
          ACCC4CA8E5C854293BCE2E72C33B835ADE084F1A3BA6ED1331E49D292600E6BC
          9A0E617C5DF5DB96B5DED0191EAAB8D75B35ADF5A5A95F3B3939C9958ED266AA
          2A5B5244BDD5D1B508CD129610BC031F0854427C94E3A09BD9B05B0BB028E154
          AA8A7566BA7D54DB0CACB5C503B45D575814BEB8C2B574E6947523D96FCC9177
          67B9C59572BFB51928C094320D035E4E6A2959A4F59CF40D49CF742EA9842A80
          AB7167C728A75766AED6618E6BF278BDEAED7DDE712BB9F684975A364D7D71BA
          CA472922230B3CD7C893818AD24970980C6E7F35AB00DD527868919A19DD36F4
          717FBDC88A3B57E2AF123143A5EDB61CCAAE78CBEE9CC75E36C7341D82B364EB
          F88CFD500D056D5B182941CD4E8E71D91203DBD51CF0991B5E0E3108F5391D50
          D80B79EF58FB8ADBA8EE8ABAD09440761EF82E9CB927E82D2866B6393241290A
          97E55907975E075746AA6913F27526BC2D8A28718F2A561725CD4A8E20EC0F87
          21A93F7744D8322ABAE64245974DD759328EBC2C268B3AD0A85D2511EDACD8BA
          82CC570E2B532976EAA2D2768C3D94B5A028D4259244DEA46B27253C27531A6F
          CFC39E1190BF00A04E77B2F297B4EECB4CD9F2B1A767D5AD2B7C8619DBD5F639
          3951B18FCCF14D7D69B0582E5597656D68C71E011D7E90BCA80015455A8684B6
          F2C2853399520214E490C17603B81DD53498EC5D215CAD93B6445D284DD36442
          CADF0C90C2B63A84B075A2AC873DC6275E6D82412597A5895BEFCF8B7E5F58FE
          D6C4E0F284E6D5ECD937193BC57907C7BFDB892DD73B4E8CAE51DE548EB4422C
          BA7B656C590DCD7557B26B252A0945203A6D443E1CD0D0C5348721201292276E
          425C154689638929028DAB2072389CE41AEB47739D87739A51E078AFD04064B2
          18A415A6F2D5C974294A7B42212C99EAE58F7EAAB0A17E4E62A67E7D72C3248D
          B3350D73C30236FC0D63835283487B4232CB781AB149FB93ED141A0BA82E9255
          B5A2FB96C6AF3576EFB56AB4153BDC4E2F634436CADC8A404359D0A091D9CF36
          EBE4EA848D2F705EF8AD1B53B14947F0F54EC4A14EB3CB168F3E4397DD9DCED8
          FA6F6B6B2A16A66CA922CCD25AAE3D62C524D79BB1313876C0D94E773B7D72FB
          AECC33A72746FF0096DFA39075817917C09049E4662F786A330D796E25778EEE
          859E2B7B5F95876F8B42CD852D324D7213BBB73D6513537737D83602065659DF
          72C90526800E0D6D2AD9E62F71D80C124B9C33109141294099BD30402C230F2E
          1FCFEC2647EEE6E952F207074BACF855955C466C3DBCA3DF08A975C2D14B632C
          2F5D68F7EBAA0D7C31B4AA982F657F7898099C6CAEB1821427683C632D436B90
          324AB24208BB87740DAD470BCB5065DAE0535A6D83B32B8FBE5B894C04D085B3
          C7B576BEBFEA98CC85C4CB45055E6BED913A992B8DAC766A93188B0DCC8AC86F
          24D7C116103F0335D94DEBDA56F6DDACAB489EC1ABEB61B7481D6E8ACD16BBC5
          0EBDD55353588D5B57CFEC2576CBDA9589A53165987292BB62307AF89931A934
          7CF6E1A071F8E275ADA638F50A74F77776C18CEBD65B1894D16F7AE755834EA0
          11EBF1155B377F40B526C744EAD9959FBA92F31B67E9232B687A9E392A3CE42C
          D1F355832352254F0EC81B1B8F52308FF101BD7EEB1F3F7CDB527CBDF7D1FBAF
          FDFF007E9ECCBEEE9F427E17E77EF7FF004F3E29FF0097FE77FF00D37F3FF1FF
          00913E71FF001BF8A7CBBFB3E16378DC01C01C01C01C01C01C01C01C01C01C01
          C01C048388215146A752494790780651E41E580D24F28C0E4232CD2478100C28
          C0E738CE058CE33C07C0D2A530D4EA069881A849834294E112588D4A13C2101C
          14E3C872611834000E07D3CB9E3973E011CAEB5CA8CA9251299B57157C4E272E
          9A0069A45236D6FEA7656DA6B9AA7B1B1245AACC506B3C644F6B8F5BF0B4794E
          DD85A78CFC13E28C43C82D05145905964905809289000A28A28012CB28B2C380
          0005803C8002C00C63A438C72C6380F911040CF2D408A2B2A092CD24A3F25832
          71651E328679459BCBC401678C806461C6790B20C73FB31C07C052A50E140429
          8808558C662A08492C21546180C1660D407A3183CC30A06022C8B9F3C6397013
          0A20924A2C828A2CB20A2C24964960080A2CA007A00500B0F2000B0031D380E3
          1CB18E02461020C14953851A409084448D11384C56094834E1C8091A42BA3C34
          E32422E40C83974E3ECE0277974F83FCDE0827CD785E5FCCF860F31E5FAFC5F0
          3C5E9F13C2C0FF005BA39F2E7E9E000A720B34E3CB20901EA3C3F30700B004E3
          FC10F413E31B80E0667860CF20F5673D3FD1C0634BA0B0C749732CF5CA2CC4BA
          6B1C617F8B304A55B62550FACD1C94B9471DE46C8DCE269425291B1EDD21ED4A
          14921160069ADE40858E65879064BE027F1FCD7805799C93E5FC7F0C3E3797EB
          F13C0F17A7AFC3EBFD6E8E7CB9FA780049C819A51E324A19E9F0660838658447
          1383B0109D824C107232F07746302E9E5D5CBD3C07C1C95328C902509C83C494
          FC294C238A2CCCA652001A585427C8C23C94A0251A30F58790B96738FB339E02
          AB80380A2CB720CA5020CA2499425F8382D1E5313E50BF00C01A47869FA3C007
          8269781079071D22C6338E5C04EC2720078D4849282A0D2CB28C3F0583071851
          4230451433718EB196588D16421FB319CE7F2E78002412124298049414C12B04
          848096109212301E8F070560382F05747EAF4F2E5CB8097E451F93F87F944DE4
          3CB792F23E017E4FC9785E0793F2BD1E0795F0BF53A3A7A3A3D1CB97012BA9D7
          D537FEFD4FBB704D1D4EBEA9BFF7EA7DDB81A3A9D7D537FEFD4FBB7034753AFA
          A6FF00DFA9F76E068EA75F54DFFBF53EEDC0D1D4EBEA9BFF007EA7DDB81A39B9
          FAA43ED4ABDDB81A8F53A7A941ED2A3DD781A87373F5487DA957BB70347373F5
          487DA957BB70351EA74F5283DA547BAF034753A7A941ED2A3DD781A87373F548
          7DA957BB70347373F5487DA957BB70347373F5487DA957BB70347373F5487DA9
          57BB70347373F5487DA957BB70347373F5487DA957BB70347373F5487DA957BB
          70347373F5487DA957BB7034753AFAA6FF00DFA9F76E068E6E7EA90FB52AF76E
          068E6E7EA90FB52AF76E068E6E7EA90FB52AF76E068E6E7EA90FB52AF76E068E
          6E7EA90FB52AF76E068E6E7EA90FB52AF76E068E6E7EA90FB52AF76E068E6E7E
          A90FB52AF76E068EA75F54DFFBF53EEDC0D1CDCFD521F6A55EEDC0D1CDCFD521
          F6A55EEDC0D439B9FAA41ED4A7DDB81AFFD9}
        mmHeight = 16140
        mmLeft = 2381
        mmTop = 2381
        mmWidth = 72231
        BandType = 0
      end
      object ppShape29: TppShape
        UserName = 'Shape29'
        mmHeight = 10583
        mmLeft = 142346
        mmTop = 39688
        mmWidth = 14288
        BandType = 0
      end
      object ppShape30: TppShape
        UserName = 'Shape30'
        mmHeight = 10583
        mmLeft = 125677
        mmTop = 39688
        mmWidth = 16933
        BandType = 0
      end
      object ppShape31: TppShape
        UserName = 'Shape31'
        mmHeight = 10583
        mmLeft = 108479
        mmTop = 39688
        mmWidth = 17463
        BandType = 0
      end
      object ppShape32: TppShape
        UserName = 'Shape32'
        mmHeight = 10583
        mmLeft = 87577
        mmTop = 39688
        mmWidth = 21167
        BandType = 0
      end
      object ppShape33: TppShape
        UserName = 'Shape33'
        mmHeight = 10584
        mmLeft = 42333
        mmTop = 39688
        mmWidth = 45508
        BandType = 0
      end
      object ppShape34: TppShape
        UserName = 'Shape34'
        mmHeight = 10583
        mmLeft = 27517
        mmTop = 39688
        mmWidth = 15081
        BandType = 0
      end
      object ppShape35: TppShape
        UserName = 'Shape35'
        mmHeight = 10583
        mmLeft = 15346
        mmTop = 39688
        mmWidth = 12435
        BandType = 0
      end
      object ppShape36: TppShape
        UserName = 'Shape36'
        mmHeight = 10583
        mmLeft = 2381
        mmTop = 39688
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel58: TppLabel
        UserName = 'Label58'
        Caption = 'Fecha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 2910
        mmTop = 43656
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel59: TppLabel
        UserName = 'Label59'
        Caption = 'Beneficio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 2910
        mmTop = 46831
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel60: TppLabel
        UserName = 'Label60'
        Caption = 'N'#250'mero'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 15875
        mmTop = 43656
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel61: TppLabel
        UserName = 'Label61'
        Caption = 'Liquid.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 15875
        mmTop = 46831
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel62: TppLabel
        UserName = 'Label62'
        Caption = 'Estado de la'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 28046
        mmTop = 43656
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel63: TppLabel
        UserName = 'Label63'
        Caption = 'Liquidaci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 28046
        mmTop = 46831
        mmWidth = 12435
        BandType = 0
      end
      object ppLabel64: TppLabel
        UserName = 'Label64'
        Caption = 'Apellidos y nombre(s) del'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 42863
        mmTop = 43656
        mmWidth = 27517
        BandType = 0
      end
      object ppLabel65: TppLabel
        UserName = 'Label65'
        Caption = 'Tipo de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 88106
        mmTop = 43656
        mmWidth = 8202
        BandType = 0
      end
      object ppLabel66: TppLabel
        UserName = 'Label66'
        Caption = 'Beneficio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 88106
        mmTop = 46831
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel67: TppLabel
        UserName = 'Label67'
        Caption = 'Banco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 109009
        mmTop = 43656
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel68: TppLabel
        UserName = 'Label101'
        Caption = 'Tipo de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 126207
        mmTop = 43656
        mmWidth = 8202
        BandType = 0
      end
      object ppLabel69: TppLabel
        UserName = 'Label69'
        Caption = 'Pago'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 126207
        mmTop = 46831
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel70: TppLabel
        UserName = 'Label70'
        Caption = 'Monto del'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 142875
        mmTop = 43656
        mmWidth = 11377
        BandType = 0
      end
      object ppLabel71: TppLabel
        UserName = 'Label71'
        Caption = 'asociado/Beneficiario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 42863
        mmTop = 46831
        mmWidth = 23283
        BandType = 0
      end
      object ppLabel72: TppLabel
        UserName = 'Label72'
        Caption = 'Beneficio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 142875
        mmTop = 46831
        mmWidth = 10054
        BandType = 0
      end
      object ppShape37: TppShape
        UserName = 'Shape101'
        mmHeight = 10583
        mmLeft = 240507
        mmTop = 39688
        mmWidth = 14288
        BandType = 0
      end
      object ppShape38: TppShape
        UserName = 'Shape38'
        mmHeight = 10583
        mmLeft = 170392
        mmTop = 39688
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel73: TppLabel
        UserName = 'Label73'
        Caption = 'Dev. de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 170921
        mmTop = 43656
        mmWidth = 8202
        BandType = 0
      end
      object ppLabel74: TppLabel
        UserName = 'Label74'
        Caption = 'Importe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 241036
        mmTop = 43656
        mmWidth = 8202
        BandType = 0
      end
      object ppLabel75: TppLabel
        UserName = 'Label75'
        Caption = 'Pagado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 241036
        mmTop = 46831
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel76: TppLabel
        UserName = 'Label76'
        Caption = 'Aporte (+)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 170921
        mmTop = 46831
        mmWidth = 10848
        BandType = 0
      end
      object ppShape39: TppShape
        UserName = 'Shape39'
        mmHeight = 10583
        mmLeft = 254530
        mmTop = 39688
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel77: TppLabel
        UserName = 'Label77'
        Caption = 'Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 255059
        mmTop = 43656
        mmWidth = 12435
        BandType = 0
      end
      object ppLabel78: TppLabel
        UserName = 'Label78'
        Caption = 'de Pago'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 255059
        mmTop = 46831
        mmWidth = 8996
        BandType = 0
      end
      object ppShape44: TppShape
        UserName = 'Shape44'
        mmHeight = 10583
        mmLeft = 268288
        mmTop = 39688
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel86: TppLabel
        UserName = 'Label1101'
        Caption = 'Fecha de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 268817
        mmTop = 43656
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel89: TppLabel
        UserName = 'Label89'
        Caption = 'Pago'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 269346
        mmTop = 46831
        mmWidth = 5821
        BandType = 0
      end
      object ppShape45: TppShape
        UserName = 'Shape45'
        mmHeight = 10583
        mmLeft = 198438
        mmTop = 39688
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel99: TppLabel
        UserName = 'Label99'
        Caption = 'Desc. de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 199496
        mmTop = 43656
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel100: TppLabel
        UserName = 'Label100'
        Caption = 'Cr'#233'dito (-)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 199496
        mmTop = 46831
        mmWidth = 10848
        BandType = 0
      end
      object ppShape51: TppShape
        UserName = 'Shape51'
        mmHeight = 10583
        mmLeft = 184415
        mmTop = 39688
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel101: TppLabel
        UserName = 'Label1'
        Caption = 'Niv. de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2879
        mmLeft = 184944
        mmTop = 43656
        mmWidth = 7451
        BandType = 0
      end
      object ppLabel102: TppLabel
        UserName = 'Label2'
        Caption = 'Aporte (+)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 184944
        mmTop = 46831
        mmWidth = 10848
        BandType = 0
      end
      object ppShape52: TppShape
        UserName = 'Shape501'
        mmHeight = 10583
        mmLeft = 212461
        mmTop = 39688
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel104: TppLabel
        UserName = 'Label104'
        Caption = 'Otros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 213255
        mmTop = 43656
        mmWidth = 6085
        BandType = 0
      end
      object ppLabel105: TppLabel
        UserName = 'Label105'
        Caption = 'Desc. (-)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2879
        mmLeft = 213255
        mmTop = 46831
        mmWidth = 9356
        BandType = 0
      end
      object ppLabel123: TppLabel
        UserName = 'Label123'
        Caption = 'SISTEMA DE PREVISION SOCIAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 2381
        mmTop = 18785
        mmWidth = 44979
        BandType = 0
      end
      object ppShape53: TppShape
        UserName = 'Shape53'
        mmHeight = 10583
        mmLeft = 156369
        mmTop = 39688
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel112: TppLabel
        UserName = 'Label701'
        Caption = 'Mon. benef.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2858
        mmLeft = 156898
        mmTop = 43656
        mmWidth = 13102
        BandType = 0
      end
      object ppLabel130: TppLabel
        UserName = 'Label130'
        Caption = 'Anu./Ext.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 159279
        mmTop = 46831
        mmWidth = 9790
        BandType = 0
      end
      object ppShape62: TppShape
        UserName = 'Shape62'
        mmHeight = 10584
        mmLeft = 226484
        mmTop = 39688
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel136: TppLabel
        UserName = 'Label136'
        Caption = 'Monto por'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2858
        mmLeft = 227542
        mmTop = 40217
        mmWidth = 12172
        BandType = 0
      end
      object ppLabel137: TppLabel
        UserName = 'Label137'
        Caption = 'Pagar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2858
        mmLeft = 230325
        mmTop = 43392
        mmWidth = 6604
        BandType = 0
      end
      object ppLabel138: TppLabel
        UserName = 'Label138'
        Caption = '(Oficio)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 227542
        mmTop = 46567
        mmWidth = 12171
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      BeforePrint = ppDetailBand3BeforePrint
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object pplfecbe: TppLabel
        UserName = 'lfecbe'
        Caption = 'lfecbe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 0
        mmWidth = 12171
        BandType = 4
      end
      object pplnumliq: TppLabel
        UserName = 'lnumliq'
        Caption = 'lnumliq'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 15875
        mmTop = 0
        mmWidth = 11377
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        BlankWhenZero = True
        DataField = 'MONBEN'
        DataPipeline = bdeprepxtipben
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 142875
        mmTop = 0
        mmWidth = 13228
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        BlankWhenZero = True
        DataField = 'IMPXPAG'
        DataPipeline = bdeprepxtipben
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 227013
        mmTop = 0
        mmWidth = 13228
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        DataField = 'ASOAPENOMBEN'
        DataPipeline = bdeprepxtipben
        DisplayFormat = 'AAAAAAAAAAAAAAAAAAAAAAAAAAAA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 42863
        mmTop = 0
        mmWidth = 44450
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        DataField = 'ESTLIQ'
        DataPipeline = bdeprepxtipben
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 28046
        mmTop = 0
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        DataField = 'BENEFICIO'
        DataPipeline = bdeprepxtipben
        DisplayFormat = 'AAAAAAAAAAAAA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 88106
        mmTop = 0
        mmWidth = 20108
        BandType = 4
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        DataField = 'TIPPAG'
        DataPipeline = bdeprepxtipben
        DisplayFormat = 'AAAAAAAAAAAA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 126207
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText29: TppDBText
        UserName = 'DBText29'
        DataField = 'DOCPAG'
        DataPipeline = bdeprepxtipben
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 255059
        mmTop = 0
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText32: TppDBText
        UserName = 'DBText32'
        DataField = 'FECPAG'
        DataPipeline = bdeprepxtipben
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 268817
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText33: TppDBText
        UserName = 'DBText33'
        BlankWhenZero = True
        DataField = 'DEVAPO'
        DataPipeline = bdeprepxtipben
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 170921
        mmTop = 0
        mmWidth = 13228
        BandType = 4
      end
      object ppDBText35: TppDBText
        UserName = 'DBText35'
        BlankWhenZero = True
        DataField = 'DESCRE'
        DataPipeline = bdeprepxtipben
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 198967
        mmTop = 0
        mmWidth = 13228
        BandType = 4
      end
      object ppDBText36: TppDBText
        UserName = 'DBText201'
        BlankWhenZero = True
        DataField = 'NIVAPO'
        DataPipeline = bdeprepxtipben
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 184944
        mmTop = 0
        mmWidth = 13228
        BandType = 4
      end
      object ppDBText37: TppDBText
        UserName = 'DBText37'
        BlankWhenZero = True
        DataField = 'OTRDES'
        DataPipeline = bdeprepxtipben
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 212990
        mmTop = 0
        mmWidth = 13228
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        DataField = 'BCODES'
        DataPipeline = bdeprepxtipben
        DisplayFormat = 'AAAAAAAAAAAA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 109009
        mmTop = 0
        mmWidth = 16404
        BandType = 4
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        BlankWhenZero = True
        DataField = 'MONBENANU'
        DataPipeline = bdeprepxtipben
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 156898
        mmTop = 0
        mmWidth = 13228
        BandType = 4
      end
      object ppDBText44: TppDBText
        UserName = 'DBText44'
        BlankWhenZero = True
        DataField = 'IMPPAG'
        DataPipeline = bdeprepxtipben
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 241036
        mmTop = 0
        mmWidth = 13228
        BandType = 4
      end
    end
    object ppSummaryBand3: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 42863
      mmPrintPosition = 0
      object ppLine8: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1588
        mmTop = 265
        mmWidth = 279665
        BandType = 7
      end
      object ppLine9: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1588
        mmTop = 5027
        mmWidth = 279665
        BandType = 7
      end
      object pplimpresopor01: TppLabel
        UserName = 'Label25'
        ShiftWithParent = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3970
        mmLeft = 2910
        mmTop = 38893
        mmWidth = 112438
        BandType = 7
      end
      object ppDBCalc15: TppDBCalc
        UserName = 'DBCalc15'
        DataField = 'MONBEN'
        DataPipeline = bdeprepxtipben
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3440
        mmLeft = 142875
        mmTop = 1058
        mmWidth = 13228
        BandType = 7
      end
      object ppDBCalc16: TppDBCalc
        UserName = 'DBCalc16'
        DataField = 'IMPPAG'
        DataPipeline = bdeprepxtipben
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3440
        mmLeft = 241036
        mmTop = 1058
        mmWidth = 13228
        BandType = 7
      end
      object ppLabel87: TppLabel
        UserName = 'Label87'
        Caption = 'TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3386
        mmLeft = 127000
        mmTop = 1058
        mmWidth = 9229
        BandType = 7
      end
      object ppLabel122: TppLabel
        UserName = 'Label122'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 139171
        mmTop = 1058
        mmWidth = 1058
        BandType = 7
      end
      object ppDBCalc17: TppDBCalc
        UserName = 'DBCalc17'
        DataField = 'DEVAPO'
        DataPipeline = bdeprepxtipben
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3440
        mmLeft = 170921
        mmTop = 1058
        mmWidth = 13229
        BandType = 7
      end
      object ppDBCalc18: TppDBCalc
        UserName = 'DBCalc18'
        DataField = 'NIVAPO'
        DataPipeline = bdeprepxtipben
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3440
        mmLeft = 184944
        mmTop = 1058
        mmWidth = 13228
        BandType = 7
      end
      object ppDBCalc19: TppDBCalc
        UserName = 'DBCalc19'
        DataField = 'DESCRE'
        DataPipeline = bdeprepxtipben
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3440
        mmLeft = 198967
        mmTop = 1058
        mmWidth = 13228
        BandType = 7
      end
      object ppDBCalc20: TppDBCalc
        UserName = 'DBCalc20'
        DataField = 'OTRDES'
        DataPipeline = bdeprepxtipben
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3440
        mmLeft = 212990
        mmTop = 1058
        mmWidth = 13228
        BandType = 7
      end
      object ppDBCalc24: TppDBCalc
        UserName = 'DBCalc24'
        DataField = 'MONBENANU'
        DataPipeline = bdeprepxtipben
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3440
        mmLeft = 156898
        mmTop = 1058
        mmWidth = 13228
        BandType = 7
      end
      object ppShape40: TppShape
        UserName = 'Shape13'
        mmHeight = 5821
        mmLeft = 61913
        mmTop = 31750
        mmWidth = 72761
        BandType = 7
      end
      object ppShape41: TppShape
        UserName = 'Shape4'
        mmHeight = 23283
        mmLeft = 61913
        mmTop = 8731
        mmWidth = 72761
        BandType = 7
      end
      object ppLabel88: TppLabel
        UserName = 'Label27'
        Caption = 'CANTIDAD DE EXPEDIENTES PROCESADOS :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 8467
        mmWidth = 57944
        BandType = 7
      end
      object ppLabel90: TppLabel
        UserName = 'Label29'
        Caption = 'Tipo de Beneficio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 63236
        mmTop = 9525
        mmWidth = 26194
        BandType = 7
      end
      object ppLabel91: TppLabel
        UserName = 'Label30'
        Caption = 'Cantidad'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 93663
        mmTop = 9525
        mmWidth = 13494
        BandType = 7
      end
      object ppLabel92: TppLabel
        UserName = 'Label301'
        Caption = 'Monto del'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 115888
        mmTop = 9525
        mmWidth = 14288
        BandType = 7
      end
      object ppLabel93: TppLabel
        UserName = 'Label31'
        Caption = 'Beneficio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 115888
        mmTop = 13229
        mmWidth = 13758
        BandType = 7
      end
      object ppLine10: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 62177
        mmTop = 17463
        mmWidth = 72231
        BandType = 7
      end
      object ppShape42: TppShape
        UserName = 'Shape11'
        mmHeight = 28840
        mmLeft = 92075
        mmTop = 8731
        mmWidth = 265
        BandType = 7
      end
      object ppShape43: TppShape
        UserName = 'Shape14'
        mmHeight = 28575
        mmLeft = 114300
        mmTop = 8731
        mmWidth = 265
        BandType = 7
      end
      object ppLabel94: TppLabel
        UserName = 'Label32'
        Caption = 'RETIRO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 62971
        mmTop = 18785
        mmWidth = 10583
        BandType = 7
      end
      object ppLabel95: TppLabel
        UserName = 'Label33'
        Caption = 'FALLECIMIENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 62971
        mmTop = 23019
        mmWidth = 22490
        BandType = 7
      end
      object ppLabel96: TppLabel
        UserName = 'Label34'
        Caption = 'INVALIDEZ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 62971
        mmTop = 27252
        mmWidth = 14817
        BandType = 7
      end
      object pplcanretdpt: TppLabel
        UserName = 'Label35'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3970
        mmLeft = 96838
        mmTop = 18785
        mmWidth = 12435
        BandType = 7
      end
      object pplcanfaldpt: TppLabel
        UserName = 'Label36'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 96838
        mmTop = 23019
        mmWidth = 12435
        BandType = 7
      end
      object pplcaninvdpt: TppLabel
        UserName = 'Label37'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 96838
        mmTop = 27252
        mmWidth = 12435
        BandType = 7
      end
      object pplmonretdpt: TppLabel
        UserName = 'Label38'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 115888
        mmTop = 18785
        mmWidth = 16140
        BandType = 7
      end
      object pplmonfaldpt: TppLabel
        UserName = 'Label39'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 115888
        mmTop = 23019
        mmWidth = 16140
        BandType = 7
      end
      object pplmoninvdpt: TppLabel
        UserName = 'Label40'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 115888
        mmTop = 27252
        mmWidth = 16140
        BandType = 7
      end
      object ppLabel103: TppLabel
        UserName = 'Label41'
        Caption = 'TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 62971
        mmTop = 32808
        mmWidth = 9260
        BandType = 7
      end
      object pplcantotdpt: TppLabel
        UserName = 'Label42'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 96838
        mmTop = 32808
        mmWidth = 12435
        BandType = 7
      end
      object pplmontotdpt: TppLabel
        UserName = 'Label43'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 115888
        mmTop = 32808
        mmWidth = 16140
        BandType = 7
      end
      object ppDBCalc27: TppDBCalc
        UserName = 'DBCalc27'
        DataField = 'IMPXPAG'
        DataPipeline = bdeprepxtipben
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3440
        mmLeft = 227013
        mmTop = 1058
        mmWidth = 13228
        BandType = 7
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppBDEPAnulados: TppBDEPipeline
    DataSource = DM1.dsRepresentante
    UserName = 'BDEPAnulados'
    Left = 760
    Top = 168
  end
  object cdsAnulados: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ANOMES'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'MES'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CANANU'
        DataType = ftFloat
      end
      item
        Name = 'MONANU'
        DataType = ftFloat
      end
      item
        Name = 'CANEXT'
        DataType = ftFloat
      end
      item
        Name = 'MONEXT'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'cdsbeneficiosIndex1'
      end>
    Params = <>
    StoreDefs = True
    Left = 737
    Top = 104
    Data = {
      890000009619E0BD010000001800000006000000000003000000890006414E4F
      4D45530100490000000100055749445448020002000600034D45530100490000
      0001000557494454480200020014000643414E414E550800040000000000064D
      4F4E414E5508000400000000000643414E4558540800040000000000064D4F4E
      45585408000400000000000000}
  end
  object dsAnulados: TDataSource
    DataSet = cdsAnulados
    Left = 752
    Top = 102
  end
end
