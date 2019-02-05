object FrepxtipbenCon: TFrepxtipbenCon
  Left = 23
  Top = 260
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
    Height = 89
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
    object btnImprimePrevio: TBitBtn
      Left = 346
      Top = 20
      Width = 73
      Height = 29
      Caption = 'Previo'
      TabOrder = 2
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
    Top = 96
    Width = 745
    Height = 257
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
    Left = 504
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
      FieldAlias = 'ASOAPENOMBEN'
      FieldName = 'ASOAPENOMBEN'
      FieldLength = 45
      DisplayWidth = 45
      Position = 2
    end
    object bdeprepxtipbenppField4: TppField
      FieldAlias = 'BENEFICIO'
      FieldName = 'BENEFICIO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 3
    end
    object bdeprepxtipbenppField5: TppField
      FieldAlias = 'TIPPAG'
      FieldName = 'TIPPAG'
      FieldLength = 15
      DisplayWidth = 15
      Position = 4
    end
    object bdeprepxtipbenppField6: TppField
      FieldAlias = 'BCODES'
      FieldName = 'BCODES'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object bdeprepxtipbenppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'MONBEN'
      FieldName = 'MONBEN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object bdeprepxtipbenppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'AJUBEN'
      FieldName = 'AJUBEN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object bdeprepxtipbenppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMPPAG'
      FieldName = 'IMPPAG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object bdeprepxtipbenppField10: TppField
      FieldAlias = 'PVSLNOFC'
      FieldName = 'PVSLNOFC'
      FieldLength = 20
      DisplayWidth = 20
      Position = 9
    end
    object bdeprepxtipbenppField11: TppField
      FieldAlias = 'NROCHEQUE'
      FieldName = 'NROCHEQUE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 10
    end
    object bdeprepxtipbenppField12: TppField
      FieldAlias = 'FECPAG'
      FieldName = 'FECPAG'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 11
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
      end
      item
        Name = 'PVSLNOFC'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NROCHEQUE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'FECPAG'
        DataType = ftDate
      end>
    IndexDefs = <
      item
        Name = 'cdsbeneficiosIndex1'
      end>
    Params = <>
    StoreDefs = True
    Left = 552
    Top = 8
    Data = {
      360100009619E0BD01000000180000000C000000000003000000360109505653
      4C46454342450400060000000000095056534C42454E4E520100490000000100
      0557494454480200020014000C41534F4150454E4F4D42454E01004900000001
      00055749445448020002002D000942454E45464943494F010049000000010005
      5749445448020002001400065449505041470100490000000100055749445448
      020002000F000642434F44455301004900000001000557494454480200020014
      00064D4F4E42454E080004000000000006414A5542454E080004000000000006
      494D505041470800040000000000085056534C4E4F4643010049000000010005
      5749445448020002001400094E524F4348455155450100490000000100055749
      445448020002000A000646454350414704000600000000000000}
  end
  object dsbeneficios: TDataSource
    DataSet = cdsbeneficios
    Left = 559
    Top = 14
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
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zsPageWidth
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 512
    Top = 16
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'bdeprepxtipben'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 28310
      mmPrintPosition = 0
      object ppShape4: TppShape
        UserName = 'Shape4'
        mmHeight = 8202
        mmLeft = 238919
        mmTop = 19845
        mmWidth = 18785
        BandType = 0
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        Pen.Style = psInsideFrame
        mmHeight = 8202
        mmLeft = 203200
        mmTop = 19845
        mmWidth = 35983
        BandType = 0
      end
      object ppShape12: TppShape
        UserName = 'Shape12'
        mmHeight = 8202
        mmLeft = 256911
        mmTop = 19845
        mmWidth = 19845
        BandType = 0
      end
      object ppShape11: TppShape
        UserName = 'Shape101'
        Pen.Style = psInsideFrame
        mmHeight = 8202
        mmLeft = 183621
        mmTop = 19845
        mmWidth = 19845
        BandType = 0
      end
      object ppShape10: TppShape
        UserName = 'Shape10'
        mmHeight = 8202
        mmLeft = 164042
        mmTop = 19844
        mmWidth = 19844
        BandType = 0
      end
      object ppShape8: TppShape
        UserName = 'Shape8'
        mmHeight = 8202
        mmLeft = 139700
        mmTop = 19844
        mmWidth = 24606
        BandType = 0
      end
      object ppShape7: TppShape
        UserName = 'Shape7'
        mmHeight = 8202
        mmLeft = 112184
        mmTop = 19844
        mmWidth = 27781
        BandType = 0
      end
      object ppShape6: TppShape
        UserName = 'Shape6'
        mmHeight = 8202
        mmLeft = 90752
        mmTop = 19844
        mmWidth = 21696
        BandType = 0
      end
      object ppShape5: TppShape
        UserName = 'Shape5'
        mmHeight = 8202
        mmLeft = 38629
        mmTop = 19844
        mmWidth = 52388
        BandType = 0
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        mmHeight = 8202
        mmLeft = 19844
        mmTop = 19844
        mmWidth = 19050
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 8202
        mmLeft = 1588
        mmTop = 19844
        mmWidth = 18521
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
        mmTop = 20638
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
        mmLeft = 20638
        mmTop = 20638
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Expediente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 20638
        mmTop = 24077
        mmWidth = 14023
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
        mmLeft = 39423
        mmTop = 20638
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
        mmLeft = 91811
        mmTop = 20638
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
        mmLeft = 91811
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
        mmLeft = 112977
        mmTop = 20638
        mmWidth = 17463
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
        mmLeft = 140494
        mmTop = 20638
        mmWidth = 22490
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
        mmLeft = 140494
        mmTop = 24077
        mmWidth = 19844
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
        mmLeft = 165365
        mmTop = 20638
        mmWidth = 12435
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
        mmLeft = 187325
        mmTop = 20638
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
        mmLeft = 258234
        mmTop = 20638
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
        mmLeft = 258234
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
        mmLeft = 39423
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
        mmLeft = 233892
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
        mmLeft = 233892
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
        mmLeft = 233892
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
        mmLeft = 246592
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
        mmLeft = 246592
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
        mmLeft = 246592
        mmTop = 6879
        mmWidth = 1588
        BandType = 0
      end
      object ppltitulo0101: TppLabel
        UserName = 'Label21'
        Caption = 'EXPEDIENTES DE BENEFICIOS GENERADOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 93134
        mmTop = 8202
        mmWidth = 76327
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
        mmLeft = 106627
        mmTop = 12965
        mmWidth = 49477
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Documento de Pago'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 207434
        mmTop = 20373
        mmWidth = 25929
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Fecha de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 240242
        mmTop = 20638
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Pago'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 240242
        mmTop = 24077
        mmWidth = 6615
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label23'
        Caption = 'Oficio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 204788
        mmTop = 24342
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label24'
        Caption = 'Cheque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 223044
        mmTop = 24342
        mmWidth = 9790
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Pen.Style = psInsideFrame
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 203200
        mmTop = 23813
        mmWidth = 35719
        BandType = 0
      end
      object ppShape9: TppShape
        UserName = 'Shape9'
        Pen.Style = psInsideFrame
        mmHeight = 3969
        mmLeft = 221721
        mmTop = 23813
        mmWidth = 265
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
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
        mmLeft = 164836
        mmTop = 0
        mmWidth = 15347
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
        mmLeft = 184944
        mmTop = 0
        mmWidth = 15347
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
        mmLeft = 259292
        mmTop = 0
        mmWidth = 15347
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
        mmLeft = 39423
        mmTop = 0
        mmWidth = 51329
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'BENEFICIO'
        DataPipeline = bdeprepxtipben
        DisplayFormat = 'AAAAAAAAAA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 91811
        mmTop = 0
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'BCODES'
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
        mmLeft = 112977
        mmTop = 0
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'TIPPAG'
        DataPipeline = bdeprepxtipben
        DisplayFormat = 'AAAAAAAAAAA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 140494
        mmTop = 0
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'PVSLFECBE'
        DataPipeline = bdeprepxtipben
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'PVSLBENNR'
        DataPipeline = bdeprepxtipben
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 20638
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'PVSLNOFC'
        DataPipeline = bdeprepxtipben
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 203730
        mmTop = 0
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText101'
        DataField = 'NROCHEQUE'
        DataPipeline = bdeprepxtipben
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 221986
        mmTop = 0
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'FECPAG'
        DataPipeline = bdeprepxtipben
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeprepxtipben'
        mmHeight = 3175
        mmLeft = 239184
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 10583
      mmPrintPosition = 0
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
        mmLeft = 164836
        mmTop = 1058
        mmWidth = 15346
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
        mmLeft = 184944
        mmTop = 1058
        mmWidth = 15346
        BandType = 7
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1588
        mmTop = 265
        mmWidth = 274638
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
        mmLeft = 259292
        mmTop = 1058
        mmWidth = 15346
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
        mmTop = 6614
        mmWidth = 58208
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
        mmLeft = 146579
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
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1588
        mmTop = 5027
        mmWidth = 274373
        BandType = 7
      end
    end
  end
end
