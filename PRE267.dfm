object Frepxtipben1: TFrepxtipben1
  Left = 17
  Top = 130
  BorderStyle = bsDialog
  Caption = 'Reporte Por Tipo de Beneficio'
  ClientHeight = 389
  ClientWidth = 757
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
    Left = 3
    Top = 0
    Width = 430
    Height = 128
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
    object Label1: TLabel
      Left = 6
      Top = 22
      Width = 80
      Height = 17
      Caption = 'Fecha Inicial :'
    end
    object Label2: TLabel
      Left = 6
      Top = 50
      Width = 70
      Height = 17
      Caption = 'Fecha Final :'
    end
    object Label3: TLabel
      Left = 6
      Top = 76
      Width = 104
      Height = 17
      Caption = 'Tipo de Beneficio :'
    end
    object Label4: TLabel
      Left = 6
      Top = 103
      Width = 81
      Height = 17
      Caption = 'Departamento:'
    end
    object dbdtpinicial: TwwDBDateTimePicker
      Left = 114
      Top = 20
      Width = 89
      Height = 25
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 0
    end
    object dbdtpfinal: TwwDBDateTimePicker
      Left = 114
      Top = 47
      Width = 89
      Height = 25
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 1
    end
    object dblctipben: TwwDBLookupCombo
      Left = 114
      Top = 73
      Width = 53
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
      Left = 172
      Top = 73
      Width = 251
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
      object metipbenef: TMaskEdit
        Left = 1
        Top = 1
        Width = 248
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
      Left = 346
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
      Left = 114
      Top = 98
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
      Left = 172
      Top = 98
      Width = 251
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
        Width = 248
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
      Left = 206
      Top = 13
      Width = 117
      Height = 57
      Caption = ' Tipo de Beneficio '
      Items.Strings = (
        'Detalle'
        'Resumen')
      TabOrder = 7
      OnClick = rgtipbenClick
    end
  end
  object btnimprimir: TBitBtn
    Left = 516
    Top = 358
    Width = 79
    Height = 30
    Caption = 'Imprimir'
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
  object btnaexcel: TBitBtn
    Left = 599
    Top = 358
    Width = 75
    Height = 30
    Caption = 'A Excel'
    TabOrder = 2
    OnClick = btnaexcelClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
      333333333333337FF3333333333333903333333333333377FF33333333333399
      03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
      99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
      99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
      03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
      33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
      33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
      3333777777333333333333333333333333333333333333333333}
    NumGlyphs = 2
  end
  object btncerrar: TBitBtn
    Left = 679
    Top = 358
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
    Left = 8
    Top = 136
    Width = 745
    Height = 217
    DisableThemesInTitle = False
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
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
  object dtgData: TDBGrid
    Left = 704
    Top = 8
    Width = 33
    Height = 25
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    Visible = False
  end
  object bdeprepxtipben: TppBDEPipeline
    DataSource = dsbeneficios
    UserName = 'bdeprepxtipben'
    Left = 664
    Top = 8
    object bdeprepxtipbenppField1: TppField
      FieldAlias = 'PVSLFECBE'
      FieldName = 'PVSLFECBE'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 0
    end
    object bdeprepxtipbenppField2: TppField
      FieldAlias = 'PVSLBENNR'
      FieldName = 'PVSLBENNR'
      FieldLength = 20
      DisplayWidth = 20
      Position = 1
    end
    object bdeprepxtipbenppField3: TppField
      FieldAlias = 'ASOCODMOD'
      FieldName = 'ASOCODMOD'
      FieldLength = 20
      DisplayWidth = 20
      Position = 2
    end
    object bdeprepxtipbenppField4: TppField
      FieldAlias = 'ASOAPENOMBEN'
      FieldName = 'ASOAPENOMBEN'
      FieldLength = 45
      DisplayWidth = 45
      Position = 3
    end
    object bdeprepxtipbenppField5: TppField
      FieldAlias = 'BENEFICIO'
      FieldName = 'BENEFICIO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object bdeprepxtipbenppField6: TppField
      FieldAlias = 'TIPPAG'
      FieldName = 'TIPPAG'
      FieldLength = 15
      DisplayWidth = 15
      Position = 5
    end
    object bdeprepxtipbenppField7: TppField
      FieldAlias = 'BCODES'
      FieldName = 'BCODES'
      FieldLength = 20
      DisplayWidth = 20
      Position = 6
    end
    object bdeprepxtipbenppField8: TppField
      FieldAlias = 'CIUGIR'
      FieldName = 'CIUGIR'
      FieldLength = 20
      DisplayWidth = 20
      Position = 7
    end
    object bdeprepxtipbenppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'MONBEN'
      FieldName = 'MONBEN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object bdeprepxtipbenppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'AJUBEN'
      FieldName = 'AJUBEN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object bdeprepxtipbenppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMPPAG'
      FieldName = 'IMPPAG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
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
        Name = 'MONBEN'
        DataType = ftFloat
      end
      item
        Name = 'AJUBEN'
        DataType = ftFloat
      end
      item
        Name = 'IMPPAG'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'cdsbeneficiosIndex1'
      end>
    Params = <>
    StoreDefs = True
    Left = 664
    Top = 56
    Data = {
      250100009619E0BD01000000180000000B000000000003000000250109505653
      4C46454342450400060000000000095056534C42454E4E520100490000000100
      0557494454480200020014000941534F434F444D4F4401004900000001000557
      494454480200020014000C41534F4150454E4F4D42454E010049000000010005
      5749445448020002002D000942454E45464943494F0100490000000100055749
      4454480200020014000654495050414701004900000001000557494454480200
      02000F000642434F444553010049000000010005574944544802000200140006
      4349554749520100490000000100055749445448020002001400064D4F4E4245
      4E080004000000000006414A5542454E080004000000000006494D5050414708
      000400000000000000}
  end
  object dsbeneficios: TDataSource
    DataSet = cdsbeneficios
    Left = 671
    Top = 62
  end
  object pprtodos: TppReport
    AutoStop = False
    DataPipeline = bdeprepxtipben
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zsPageWidth
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 672
    Top = 16
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'bdeprepxtipben'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 28310
      mmPrintPosition = 0
      object ppShape12: TppShape
        UserName = 'Shape12'
        mmHeight = 7144
        mmLeft = 184415
        mmTop = 20638
        mmWidth = 15346
        BandType = 0
      end
      object ppShape11: TppShape
        UserName = 'Shape101'
        mmHeight = 7144
        mmLeft = 168805
        mmTop = 20638
        mmWidth = 15875
        BandType = 0
      end
      object ppShape10: TppShape
        UserName = 'Shape10'
        mmHeight = 7144
        mmLeft = 153459
        mmTop = 20638
        mmWidth = 15875
        BandType = 0
      end
      object ppShape9: TppShape
        UserName = 'Shape9'
        mmHeight = 7144
        mmLeft = 135732
        mmTop = 20638
        mmWidth = 17992
        BandType = 0
      end
      object ppShape8: TppShape
        UserName = 'Shape8'
        mmHeight = 7144
        mmLeft = 124619
        mmTop = 20638
        mmWidth = 11377
        BandType = 0
      end
      object ppShape7: TppShape
        UserName = 'Shape7'
        mmHeight = 7144
        mmLeft = 112713
        mmTop = 20638
        mmWidth = 12171
        BandType = 0
      end
      object ppShape6: TppShape
        UserName = 'Shape6'
        mmHeight = 7144
        mmLeft = 98954
        mmTop = 20638
        mmWidth = 14023
        BandType = 0
      end
      object ppShape5: TppShape
        UserName = 'Shape5'
        mmHeight = 7144
        mmLeft = 46831
        mmTop = 20638
        mmWidth = 52388
        BandType = 0
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        mmHeight = 7145
        mmLeft = 30427
        mmTop = 20635
        mmWidth = 16669
        BandType = 0
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        mmHeight = 7145
        mmLeft = 17463
        mmTop = 20635
        mmWidth = 13229
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 7144
        mmLeft = 1588
        mmTop = 20638
        mmWidth = 16140
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Fecha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 21167
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Beneficio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 24077
        mmWidth = 12435
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'N'#250'mero'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 17992
        mmTop = 21167
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Expe.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 17992
        mmTop = 24077
        mmWidth = 7197
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 31221
        mmTop = 21167
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Modular'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 31221
        mmTop = 24077
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Apellidos y nombre(s) del'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 47625
        mmTop = 21167
        mmWidth = 32015
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Tipo de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 100013
        mmTop = 21167
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Beneficio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 100013
        mmTop = 24077
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Banco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 113506
        mmTop = 21167
        mmWidth = 9261
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label101'
        Caption = 'Tipo de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 125413
        mmTop = 21167
        mmWidth = 9261
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Pago'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 125413
        mmTop = 24077
        mmWidth = 6615
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Ciudad/Giro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 137584
        mmTop = 21167
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Beneficio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 154782
        mmTop = 21167
        mmWidth = 11377
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Ajuste(+/-)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 170392
        mmTop = 21167
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Importe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 185209
        mmTop = 21167
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Pagado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 185209
        mmTop = 24077
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label18'
        Caption = 'asociado/Beneficiario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 47625
        mmTop = 24077
        mmWidth = 26988
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label11'
        Caption = 'Derrama Magisterial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2381
        mmTop = 1058
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'Equipo de Previsi'#243'n Social'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2381
        mmTop = 3969
        mmWidth = 33867
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'Fecha :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 168275
        mmTop = 1058
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label201'
        Caption = 'Hora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 168275
        mmTop = 3969
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'Pagina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 168275
        mmTop = 6879
        mmWidth = 9525
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
        mmLeft = 180975
        mmTop = 1058
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
        mmLeft = 180975
        mmTop = 3969
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
        mmLeft = 180975
        mmTop = 6879
        mmWidth = 1588
        BandType = 0
      end
      object ppltitulo0101: TppLabel
        UserName = 'Label21'
        Caption = 'LIQUDACION DE BENEFICIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 67204
        mmTop = 8996
        mmWidth = 48154
        BandType = 0
      end
      object ppltitulo0102: TppLabel
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
        mmLeft = 66675
        mmTop = 12965
        mmWidth = 49477
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      BeforePrint = ppDetailBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object pplfecben: TppLabel
        UserName = 'Label23'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 0
        mmWidth = 14817
        BandType = 4
      end
      object pplpvslbennr: TppLabel
        UserName = 'Label24'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 17992
        mmTop = 0
        mmWidth = 12435
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
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 154782
        mmTop = 0
        mmWidth = 13228
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        BlankWhenZero = True
        DataField = 'AJUBEN'
        DataPipeline = bdeprepxtipben
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 170392
        mmTop = 0
        mmWidth = 13228
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
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 186267
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
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 47625
        mmTop = 0
        mmWidth = 51329
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'ASOCODMOD'
        DataPipeline = bdeprepxtipben
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 31221
        mmTop = 0
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'BENEFICIO'
        DataPipeline = bdeprepxtipben
        DisplayFormat = 'AAAAAA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 100013
        mmTop = 0
        mmWidth = 12171
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'BCODES'
        DataPipeline = bdeprepxtipben
        DisplayFormat = 'AAAAAA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 113506
        mmTop = 0
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'TIPPAG'
        DataPipeline = bdeprepxtipben
        DisplayFormat = 'AAAAAAAA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 125413
        mmTop = 0
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'CIUGIR'
        DataPipeline = bdeprepxtipben
        DisplayFormat = 'AAAAAAAAAAAA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 137584
        mmTop = 0
        mmWidth = 16140
        BandType = 4
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 54504
      mmPrintPosition = 0
      object ppShape15: TppShape
        UserName = 'Shape13'
        mmHeight = 5821
        mmLeft = 61383
        mmTop = 32279
        mmWidth = 72761
        BandType = 7
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        mmHeight = 23283
        mmLeft = 61382
        mmTop = 9261
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
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 153459
        mmTop = 1058
        mmWidth = 14552
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'AJUBEN'
        DataPipeline = bdeprepxtipben
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 169069
        mmTop = 1058
        mmWidth = 14552
        BandType = 7
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1588
        mmTop = 265
        mmWidth = 198438
        BandType = 7
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1588
        mmTop = 5027
        mmWidth = 198438
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
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 184944
        mmTop = 1058
        mmWidth = 14552
        BandType = 7
      end
      object pplimpresopor: TppLabel
        UserName = 'Label25'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2381
        mmTop = 35719
        mmWidth = 54504
        BandType = 7
      end
      object ppLabel24: TppLabel
        UserName = 'Label26'
        Caption = 'TOTALES :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 137584
        mmTop = 1058
        mmWidth = 14552
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
        mmHeight = 3259
        mmLeft = 2381
        mmTop = 1058
        mmWidth = 57944
        BandType = 7
      end
      object pplcantidad: TppLabel
        UserName = 'Label28'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 61648
        mmTop = 1058
        mmWidth = 5821
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
        mmTop = 10053
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
        mmTop = 10053
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
        mmTop = 10053
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
        mmTop = 13758
        mmWidth = 13758
        BandType = 7
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 61648
        mmTop = 17992
        mmWidth = 72231
        BandType = 7
      end
      object ppShape13: TppShape
        UserName = 'Shape11'
        mmHeight = 28840
        mmLeft = 91546
        mmTop = 9261
        mmWidth = 264
        BandType = 7
      end
      object ppShape14: TppShape
        UserName = 'Shape14'
        mmHeight = 28575
        mmLeft = 113771
        mmTop = 9261
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
        mmTop = 19315
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
        mmTop = 23548
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
        mmTop = 27781
        mmWidth = 14690
        BandType = 7
      end
      object pplcanret: TppLabel
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
        mmTop = 19315
        mmWidth = 12446
        BandType = 7
      end
      object pplcanfal: TppLabel
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
        mmTop = 23548
        mmWidth = 12446
        BandType = 7
      end
      object pplcaninv: TppLabel
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
        mmTop = 27781
        mmWidth = 12446
        BandType = 7
      end
      object pplmonret: TppLabel
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
        mmTop = 19315
        mmWidth = 16139
        BandType = 7
      end
      object pplmonfal: TppLabel
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
        mmTop = 23548
        mmWidth = 16139
        BandType = 7
      end
      object pplmoninv: TppLabel
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
        mmTop = 27781
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
        mmTop = 33338
        mmWidth = 9144
        BandType = 7
      end
      object pplcantot: TppLabel
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
        mmTop = 33338
        mmWidth = 12446
        BandType = 7
      end
      object pplmontot: TppLabel
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
        mmTop = 33338
        mmWidth = 16129
        BandType = 7
      end
    end
  end
  object pprtipbenres: TppReport
    AutoStop = False
    DataPipeline = ppbdetipben
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zsPageWidth
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 576
    Top = 8
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppbdetipben'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 40481
      mmPrintPosition = 0
      object ppShape18: TppShape
        UserName = 'Shape18'
        mmHeight = 8731
        mmLeft = 36513
        mmTop = 31750
        mmWidth = 35453
        BandType = 0
      end
      object ppShape17: TppShape
        UserName = 'Shape17'
        mmHeight = 8731
        mmLeft = 11377
        mmTop = 31750
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'Label1'
        Caption = 'Derrama Magisterial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2381
        mmTop = 1058
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'Label2'
        Caption = 'Equipo de Previsi'#243'n Social'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2381
        mmTop = 3969
        mmWidth = 33867
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'Label202'
        Caption = 'Fecha :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 168275
        mmTop = 1058
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'Label3'
        Caption = 'Hora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 168275
        mmTop = 3969
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel38: TppLabel
        UserName = 'Label4'
        Caption = 'Pagina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 168275
        mmTop = 6879
        mmWidth = 9525
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
        mmLeft = 180975
        mmTop = 1058
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
        mmLeft = 180975
        mmTop = 3969
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
        mmLeft = 180975
        mmTop = 6879
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
        mmHeight = 4191
        mmLeft = 55005
        mmTop = 20108
        mmWidth = 72559
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
        mmLeft = 66675
        mmTop = 24077
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
        mmTop = 32544
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
        mmTop = 36513
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
        mmTop = 36513
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
        mmTop = 32544
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
        mmTop = 36513
        mmWidth = 14288
        BandType = 0
      end
      object ppShape16: TppShape
        UserName = 'Shape16'
        Pen.Style = psInsideFrame
        mmHeight = 265
        mmLeft = 36513
        mmTop = 35983
        mmWidth = 35190
        BandType = 0
      end
      object ppShape19: TppShape
        UserName = 'Shape19'
        Pen.Style = psInsideFrame
        mmHeight = 4233
        mmLeft = 51858
        mmTop = 35983
        mmWidth = 265
        BandType = 0
      end
      object ppShape20: TppShape
        UserName = 'Shape20'
        mmHeight = 8731
        mmLeft = 71702
        mmTop = 31750
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
        mmTop = 32544
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
        mmTop = 36513
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
        mmTop = 36513
        mmWidth = 10583
        BandType = 0
      end
      object ppShape21: TppShape
        UserName = 'Shape21'
        Pen.Style = psInsideFrame
        mmHeight = 265
        mmLeft = 71702
        mmTop = 35983
        mmWidth = 35190
        BandType = 0
      end
      object ppShape22: TppShape
        UserName = 'Shape22'
        Pen.Style = psInsideFrame
        mmHeight = 4233
        mmLeft = 87313
        mmTop = 35983
        mmWidth = 265
        BandType = 0
      end
      object ppShape23: TppShape
        UserName = 'Shape201'
        mmHeight = 8731
        mmLeft = 106892
        mmTop = 31750
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
        mmTop = 32544
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
        mmTop = 36513
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
        mmTop = 36513
        mmWidth = 10583
        BandType = 0
      end
      object ppShape24: TppShape
        UserName = 'Shape24'
        Pen.Style = psInsideFrame
        mmHeight = 265
        mmLeft = 106892
        mmTop = 35983
        mmWidth = 35190
        BandType = 0
      end
      object ppShape25: TppShape
        UserName = 'Shape25'
        Pen.Style = psInsideFrame
        mmHeight = 4233
        mmLeft = 122502
        mmTop = 35983
        mmWidth = 265
        BandType = 0
      end
      object ppShape26: TppShape
        UserName = 'Shape26'
        mmHeight = 8731
        mmLeft = 142082
        mmTop = 31750
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
        mmTop = 32544
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
        mmTop = 36513
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
        mmTop = 36513
        mmWidth = 10583
        BandType = 0
      end
      object ppShape27: TppShape
        UserName = 'Shape27'
        Pen.Style = psInsideFrame
        mmHeight = 265
        mmLeft = 142082
        mmTop = 35983
        mmWidth = 40481
        BandType = 0
      end
      object ppShape28: TppShape
        UserName = 'Shape28'
        Pen.Style = psInsideFrame
        mmHeight = 4233
        mmLeft = 157692
        mmTop = 35983
        mmWidth = 265
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'MES'
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
        DataField = 'CANRET'
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
        DataField = 'MONRET'
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
        DataField = 'CANFAL'
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
        DataField = 'MONFAL'
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
        DataField = 'CANINV'
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
        DataField = 'MONINV'
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
        DataField = 'CANTOT'
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
        DataField = 'MONTOT'
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
      mmBottomOffset = 0
      mmHeight = 16140
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
      object ppLabel45: TppLabel
        UserName = 'Label45'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 11377
        mmTop = 12171
        mmWidth = 54504
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'CANRET'
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
        DataField = 'MONRET'
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
        DataField = 'CANFAL'
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
        DataField = 'MONFAL'
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
        DataField = 'CANINV'
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
        DataField = 'MONINV'
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
        DataField = 'CANTOT'
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
        DataField = 'MONTOT'
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
    end
  end
  object ppbdetipben: TppBDEPipeline
    DataSource = dsresumen
    UserName = 'bdetipben'
    Left = 584
    Top = 24
    object ppbdetipbenppField1: TppField
      FieldAlias = 'MES'
      FieldName = 'MES'
      FieldLength = 20
      DisplayWidth = 20
      Position = 0
    end
    object ppbdetipbenppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'CANRET'
      FieldName = 'CANRET'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object ppbdetipbenppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'MONRET'
      FieldName = 'MONRET'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppbdetipbenppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'CANINV'
      FieldName = 'CANINV'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 3
    end
    object ppbdetipbenppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'MONINV'
      FieldName = 'MONINV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppbdetipbenppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'CANFAL'
      FieldName = 'CANFAL'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 5
    end
    object ppbdetipbenppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'MONFAL'
      FieldName = 'MONFAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppbdetipbenppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'CANTOT'
      FieldName = 'CANTOT'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 7
    end
    object ppbdetipbenppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'MONTOT'
      FieldName = 'MONTOT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
  end
  object cdsresumen: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'MES'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CANRET'
        DataType = ftInteger
      end
      item
        Name = 'MONRET'
        DataType = ftFloat
      end
      item
        Name = 'CANINV'
        DataType = ftInteger
      end
      item
        Name = 'MONINV'
        DataType = ftFloat
      end
      item
        Name = 'CANFAL'
        DataType = ftInteger
      end
      item
        Name = 'MONFAL'
        DataType = ftFloat
      end
      item
        Name = 'CANTOT'
        DataType = ftInteger
      end
      item
        Name = 'MONTOT'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'cdsbeneficiosIndex1'
      end>
    Params = <>
    StoreDefs = True
    Left = 576
    Top = 56
    Data = {
      AA0000009619E0BD010000001800000009000000000003000000AA00034D4553
      01004900000001000557494454480200020014000643414E5245540400010000
      000000064D4F4E52455408000400000000000643414E494E5604000100000000
      00064D4F4E494E5608000400000000000643414E46414C040001000000000006
      4D4F4E46414C08000400000000000643414E544F540400010000000000064D4F
      4E544F5408000400000000000000}
  end
  object dsresumen: TDataSource
    DataSet = cdsresumen
    Left = 583
    Top = 62
  end
end
