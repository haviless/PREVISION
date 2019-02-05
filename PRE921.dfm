object FToolRepLiqxDpto: TFToolRepLiqxDpto
  Left = 52
  Top = 251
  Width = 704
  Height = 113
  AutoSize = True
  Caption = 'FToolRepLiqxDpto'
  Color = 13165023
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlRepLiq: TPanel
    Left = 0
    Top = 0
    Width = 696
    Height = 86
    Color = 10207162
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object gbPeriodo: TGroupBox
      Left = 8
      Top = 3
      Width = 192
      Height = 71
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label3: TLabel
        Left = 9
        Top = 16
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object Label4: TLabel
        Left = 102
        Top = 16
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object dbdtpDesde: TwwDBDateTimePicker
        Left = 9
        Top = 37
        Width = 82
        Height = 19
        BorderStyle = bsNone
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Color = 13165023
        Date = 37622.000000000000000000
        Epoch = 1950
        Frame.Enabled = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 0
        DisplayFormat = 'dd/mm/yyyy'
      end
      object dbdtpHasta: TwwDBDateTimePicker
        Left = 102
        Top = 37
        Width = 82
        Height = 19
        BorderStyle = bsNone
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Color = 13165023
        Date = 36943.000000000000000000
        Epoch = 1950
        Frame.Enabled = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 1
        DisplayFormat = 'dd/mm/yyyy'
      end
    end
    object bbtnImprimir: TfcShapeBtn
      Left = 574
      Top = 36
      Width = 34
      Height = 31
      Hint = 'Imprimir Liquidaciones'
      Color = 10207162
      DitherColor = clWhite
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      Options = [boFocusable]
      ParentClipping = True
      ParentShowHint = False
      RoundRectBias = 25
      ShadeStyle = fbsHighlight
      Shape = bsEllipse
      ShowHint = True
      TabOrder = 3
      TabStop = True
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
      OnClick = bbtnImprimirClick
    end
    object bbtnRepLiqxDpto: TfcShapeBtn
      Left = 529
      Top = 36
      Width = 34
      Height = 31
      Hint = 'Ver Liquidaciones por Departamento'
      Color = 10207162
      DitherColor = clWhite
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      Options = [boFocusable]
      ParentClipping = True
      ParentShowHint = False
      RoundRectBias = 25
      ShadeStyle = fbsHighlight
      Shape = bsEllipse
      ShowHint = True
      TabOrder = 2
      TabStop = True
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
      OnClick = bbtnRepLiqxDptoClick
    end
    object GroupBox1: TGroupBox
      Left = 209
      Top = 2
      Width = 303
      Height = 71
      Caption = 'Departamento  '
      TabOrder = 1
      object dblcdDpto: TwwDBLookupComboDlg
        Left = 8
        Top = 36
        Width = 65
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        BorderStyle = bsNone
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Lookup'
        MaxWidth = 0
        MaxHeight = 209
        Selected.Strings = (
          'DPTOID'#9'2'#9'Id Dpto'#9'F'
          'DPTODES'#9'20'#9'Descripci'#243'n'#9'F')
        LookupTable = DM1.cdsDpto
        LookupField = 'DPTOID'
        Color = 13165023
        Frame.Enabled = True
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        OnExit = dblcdDptoExit
      end
      object dbeDescDpto: TwwDBEdit
        Left = 80
        Top = 36
        Width = 214
        Height = 21
        BorderStyle = bsNone
        Color = 13165023
        Enabled = False
        Frame.Enabled = True
        Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
  end
  object ppdbRepLiqxDpto: TppDBPipeline
    DataSource = DM1.dsReporte
    UserName = 'dbRepLiqxDpto'
    Left = 513
    Top = 8
  end
  object ppdbRepDctos: TppDBPipeline
    DataSource = DM1.dsQry8
    UserName = 'dbRepDctos'
    Left = 593
    Top = 8
  end
  object ppdbFPago: TppDBPipeline
    DataSource = DM1.dsQry12
    UserName = 'dbFPago'
    Left = 629
    Top = 8
  end
  object ppdbObserv: TppDBPipeline
    DataSource = DM1.dsQry9
    UserName = 'dbObserv'
    Left = 662
    Top = 8
  end
  object ppDesigner1: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 664
    Top = 48
  end
  object ppdbRepCalcBen: TppDBPipeline
    DataSource = DM1.dsQry2
    UserName = 'dbRepCalcBen'
    Left = 624
    Top = 48
  end
  object ppRepLiquidacion: TppReport
    AutoStop = False
    DataPipeline = ppdbRepLiqxDpto
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
    Template.FileName = 'C:\SOLExes\SOLFormatos\Pre\Dema\RepLiquidxDpto.rtm'
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppRepLiquidacionPreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 552
    Top = 8
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbRepLiqxDpto'
    object ppHeaderBand1: TppHeaderBand
      BeforePrint = ppHeaderBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 73554
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'DERRAMA MAGISTERIAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 16
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6085
        mmLeft = 3704
        mmTop = 3175
        mmWidth = 79904
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'LIQUIDACION DE BENEFICIO N'#176
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 13
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 106627
        mmTop = 3175
        mmWidth = 64823
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'POR FALLECIMIENTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 13
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 106627
        mmTop = 8467
        mmWidth = 43921
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1588
        mmTop = 20108
        mmWidth = 194469
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'PROFESOR(A)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 7408
        mmTop = 28310
        mmWidth = 23813
        BandType = 0
      end
      object pplblAso: TppLabel
        UserName = 'lblAso'
        Caption = 'lblAso'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 7408
        mmTop = 32808
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'D.N.I. :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 7408
        mmTop = 37306
        mmWidth = 10848
        BandType = 0
      end
      object pplblDNI: TppLabel
        UserName = 'lblAso1'
        Caption = 'lblAso'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 19315
        mmTop = 37306
        mmWidth = 9525
        BandType = 0
      end
      object pplblDir: TppLabel
        UserName = 'lblDir'
        AutoSize = False
        Caption = 'lblAso'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 7408
        mmTop = 41804
        mmWidth = 84138
        BandType = 0
      end
      object pplblCiud: TppLabel
        UserName = 'lblDir1'
        Caption = 'lblAso'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 7408
        mmTop = 46302
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'IDENTIFICACION PERSONAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 6350
        mmTop = 23548
        mmWidth = 46302
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 52652
        mmTop = 25135
        mmWidth = 41275
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 2117
        mmTop = 25135
        mmWidth = 4233
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 2381
        mmTop = 51065
        mmWidth = 91546
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'CODIGO MODULAR :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 105834
        mmTop = 28310
        mmWidth = 33602
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'lblAso2'
        Caption = 'C.E. :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 105834
        mmTop = 32808
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'USE.:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 105834
        mmTop = 37306
        mmWidth = 9260
        BandType = 0
      end
      object pplblUSE: TppLabel
        UserName = 'lblUSE'
        Caption = 'lblAso'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 117740
        mmTop = 37306
        mmWidth = 9525
        BandType = 0
      end
      object pplblDirLab: TppLabel
        UserName = 'lblDir2'
        Caption = 'lblAso'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 105834
        mmTop = 41804
        mmWidth = 9525
        BandType = 0
      end
      object pplblCodMod: TppLabel
        UserName = 'lblCodMod'
        Caption = 'lblAso'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 141552
        mmTop = 28310
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'IDENTIFICACION LABORAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 105304
        mmTop = 23548
        mmWidth = 43392
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 101071
        mmTop = 25135
        mmWidth = 4233
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 151342
        mmTop = 25135
        mmWidth = 41275
        BandType = 0
      end
      object pplblCE: TppLabel
        UserName = 'lblCE'
        Caption = 'lblAso'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 117740
        mmTop = 32808
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'FECHA DE NOMBRAMIENTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 7408
        mmTop = 57150
        mmWidth = 46567
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'lblAso3'
        Caption = 'FECHA DE CESE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 7408
        mmTop = 61648
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'ULTIMA APORTACION'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 105834
        mmTop = 66675
        mmWidth = 35454
        BandType = 0
      end
      object pplblFNom: TppLabel
        UserName = 'lblFNom'
        Caption = 'lblAso'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 59002
        mmTop = 57150
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'lblDir3'
        Caption = 'TOTAL A'#209'OS APORTADOS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 7408
        mmTop = 66675
        mmWidth = 43921
        BandType = 0
      end
      object pplblUltApo: TppLabel
        UserName = 'lblUltApo'
        Caption = 'lblAso'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 145786
        mmTop = 66675
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'DATOS GENERALES PARA EL CALCULO DEL BENEFICIO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 6350
        mmTop = 52388
        mmWidth = 93663
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 101071
        mmTop = 54240
        mmWidth = 91811
        BandType = 0
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 2117
        mmTop = 54240
        mmWidth = 4233
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1852
        mmTop = 72231
        mmWidth = 190500
        BandType = 0
      end
      object pplblFCes: TppLabel
        UserName = 'lblFNom1'
        Caption = 'lblAso'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 59002
        mmTop = 61648
        mmWidth = 9525
        BandType = 0
      end
      object pplblTAnosAp: TppLabel
        UserName = 'lblUltApo1'
        Caption = 'lblAso'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 59002
        mmTop = 66940
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'RESOLUCION'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 105834
        mmTop = 57150
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'RESOLUCION'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 105834
        mmTop = 61648
        mmWidth = 22225
        BandType = 0
      end
      object pplblResCes: TppLabel
        UserName = 'lblResCes'
        Caption = 'lblAso'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 145786
        mmTop = 61648
        mmWidth = 9525
        BandType = 0
      end
      object pplblResNom: TppLabel
        UserName = 'lblFNom2'
        Caption = 'lblAso'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 145786
        mmTop = 57150
        mmWidth = 9525
        BandType = 0
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 101071
        mmTop = 51065
        mmWidth = 91546
        BandType = 0
      end
      object ppLabel46: TppLabel
        UserName = 'Label21'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 56356
        mmTop = 57150
        mmWidth = 1058
        BandType = 0
      end
      object ppLabel47: TppLabel
        UserName = 'Label46'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 56356
        mmTop = 61648
        mmWidth = 1058
        BandType = 0
      end
      object ppLabel48: TppLabel
        UserName = 'Label47'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 143140
        mmTop = 66675
        mmWidth = 1058
        BandType = 0
      end
      object ppLabel50: TppLabel
        UserName = 'Label48'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 56356
        mmTop = 66675
        mmWidth = 1058
        BandType = 0
      end
      object ppLabel97: TppLabel
        UserName = 'Label97'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 192088
        mmTop = 30956
        mmWidth = 794
        BandType = 0
      end
      object ppLabel98: TppLabel
        UserName = 'Label98'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 192088
        mmTop = 34131
        mmWidth = 794
        BandType = 0
      end
      object ppLabel99: TppLabel
        UserName = 'Label99'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 192088
        mmTop = 37571
        mmWidth = 794
        BandType = 0
      end
      object ppLabel100: TppLabel
        UserName = 'Label100'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 192088
        mmTop = 40746
        mmWidth = 794
        BandType = 0
      end
      object ppLabel101: TppLabel
        UserName = 'Label101'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 192088
        mmTop = 43921
        mmWidth = 794
        BandType = 0
      end
      object ppLabel102: TppLabel
        UserName = 'Label102'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 192088
        mmTop = 47096
        mmWidth = 794
        BandType = 0
      end
      object ppLabel40: TppLabel
        UserName = 'Label40'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 100806
        mmTop = 30956
        mmWidth = 794
        BandType = 0
      end
      object ppLabel51: TppLabel
        UserName = 'Label51'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 100806
        mmTop = 34131
        mmWidth = 794
        BandType = 0
      end
      object ppLabel52: TppLabel
        UserName = 'Label52'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 100806
        mmTop = 37571
        mmWidth = 794
        BandType = 0
      end
      object ppLabel53: TppLabel
        UserName = 'Label1001'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 100806
        mmTop = 40746
        mmWidth = 794
        BandType = 0
      end
      object ppLabel54: TppLabel
        UserName = 'Label54'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 100806
        mmTop = 43921
        mmWidth = 794
        BandType = 0
      end
      object ppLabel55: TppLabel
        UserName = 'Label55'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 100806
        mmTop = 47096
        mmWidth = 794
        BandType = 0
      end
      object ppLabel56: TppLabel
        UserName = 'Label401'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 100806
        mmTop = 24871
        mmWidth = 794
        BandType = 0
      end
      object ppLabel57: TppLabel
        UserName = 'Label57'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 100806
        mmTop = 28046
        mmWidth = 794
        BandType = 0
      end
      object ppLabel58: TppLabel
        UserName = 'Label58'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 192088
        mmTop = 24871
        mmWidth = 794
        BandType = 0
      end
      object ppLabel59: TppLabel
        UserName = 'Label59'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 192088
        mmTop = 28046
        mmWidth = 794
        BandType = 0
      end
      object ppLabel60: TppLabel
        UserName = 'Label60'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 93398
        mmTop = 30956
        mmWidth = 794
        BandType = 0
      end
      object ppLabel61: TppLabel
        UserName = 'Label61'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 93398
        mmTop = 34131
        mmWidth = 794
        BandType = 0
      end
      object ppLabel62: TppLabel
        UserName = 'Label62'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 93398
        mmTop = 37571
        mmWidth = 794
        BandType = 0
      end
      object ppLabel63: TppLabel
        UserName = 'Label1002'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 93398
        mmTop = 40746
        mmWidth = 794
        BandType = 0
      end
      object ppLabel64: TppLabel
        UserName = 'Label64'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 93398
        mmTop = 43921
        mmWidth = 794
        BandType = 0
      end
      object ppLabel65: TppLabel
        UserName = 'Label65'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 93398
        mmTop = 47096
        mmWidth = 794
        BandType = 0
      end
      object ppLabel66: TppLabel
        UserName = 'Label66'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 93398
        mmTop = 24871
        mmWidth = 794
        BandType = 0
      end
      object ppLabel67: TppLabel
        UserName = 'Label67'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 93398
        mmTop = 28046
        mmWidth = 794
        BandType = 0
      end
      object ppLabel68: TppLabel
        UserName = 'Label601'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 30956
        mmWidth = 794
        BandType = 0
      end
      object ppLabel69: TppLabel
        UserName = 'Label69'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 34131
        mmWidth = 794
        BandType = 0
      end
      object ppLabel70: TppLabel
        UserName = 'Label70'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 37571
        mmWidth = 794
        BandType = 0
      end
      object ppLabel71: TppLabel
        UserName = 'Label71'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 40746
        mmWidth = 794
        BandType = 0
      end
      object ppLabel72: TppLabel
        UserName = 'Label72'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 43921
        mmWidth = 794
        BandType = 0
      end
      object ppLabel73: TppLabel
        UserName = 'Label73'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 47096
        mmWidth = 794
        BandType = 0
      end
      object ppLabel74: TppLabel
        UserName = 'Label74'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 24871
        mmWidth = 794
        BandType = 0
      end
      object ppLabel75: TppLabel
        UserName = 'Label75'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 28046
        mmWidth = 794
        BandType = 0
      end
      object ppLabel76: TppLabel
        UserName = 'Label76'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 192088
        mmTop = 55563
        mmWidth = 794
        BandType = 0
      end
      object ppLabel77: TppLabel
        UserName = 'Label77'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 192088
        mmTop = 58738
        mmWidth = 794
        BandType = 0
      end
      object ppLabel78: TppLabel
        UserName = 'Label78'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 192088
        mmTop = 61913
        mmWidth = 794
        BandType = 0
      end
      object ppLabel79: TppLabel
        UserName = 'Label1003'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 192088
        mmTop = 65088
        mmWidth = 794
        BandType = 0
      end
      object ppLabel80: TppLabel
        UserName = 'Label80'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 192088
        mmTop = 68263
        mmWidth = 794
        BandType = 0
      end
      object ppLabel82: TppLabel
        UserName = 'Label82'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 192088
        mmTop = 53711
        mmWidth = 794
        BandType = 0
      end
      object ppLabel83: TppLabel
        UserName = 'Label83'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 55827
        mmWidth = 794
        BandType = 0
      end
      object ppLabel84: TppLabel
        UserName = 'Label84'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 59002
        mmWidth = 794
        BandType = 0
      end
      object ppLabel85: TppLabel
        UserName = 'Label85'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 62177
        mmWidth = 794
        BandType = 0
      end
      object ppLabel86: TppLabel
        UserName = 'Label86'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 65352
        mmWidth = 794
        BandType = 0
      end
      object ppLabel87: TppLabel
        UserName = 'Label801'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 68527
        mmWidth = 794
        BandType = 0
      end
      object ppLabel89: TppLabel
        UserName = 'Label89'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 53975
        mmWidth = 794
        BandType = 0
      end
      object ppLabel81: TppLabel
        UserName = 'Label81'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 143140
        mmTop = 57150
        mmWidth = 1058
        BandType = 0
      end
      object ppLabel88: TppLabel
        UserName = 'Label88'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 143140
        mmTop = 61648
        mmWidth = 1058
        BandType = 0
      end
      object ppdbNroLiq: TppDBText
        UserName = 'dbNroLiq'
        AutoSize = True
        DataField = 'PVSLBENNR1'
        DataPipeline = ppdbRepLiqxDpto
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        Visible = False
        DataPipelineName = 'ppdbRepLiqxDpto'
        mmHeight = 4233
        mmLeft = 154782
        mmTop = 13229
        mmWidth = 22754
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'PVSLBENNR'
        DataPipeline = ppdbRepLiqxDpto
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 13
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbRepLiqxDpto'
        mmHeight = 5027
        mmLeft = 173567
        mmTop = 3175
        mmWidth = 25400
        BandType = 0
      end
      object pplblFecha: TppLabel
        UserName = 'lblFecha'
        Caption = 'lblFecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 119063
        mmTop = 14023
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'FECHA :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 106627
        mmTop = 14023
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'AV. GREGORIO ESCOBEDO 598 - JESUS MARIA - LIMA - 261-8737'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 14023
        mmWidth = 85725
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'SISTEMA DE SEGURIDAD Y BIENESTAR SOCIAL DEL MAGISTERIO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 9790
        mmWidth = 84667
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppSubRepCalcBen: TppSubReport
        UserName = 'SubRepCalcBen1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ParentPrinterSetup = False
        TraverseAllData = False
        DataPipelineName = 'ppdbRepCalcBen'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 265
        mmWidth = 203200
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object TppChildReport
          AutoStop = False
          DataPipeline = ppdbRepCalcBen
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 296863
          PrinterSetup.mmPaperWidth = 209815
          PrinterSetup.PaperSize = 9
          Template.FileName = 'C:\SOLExes\SOLFormatos\Pre\Dema\RepLiquidxDpto1.rtm'
          Left = 288
          Top = 264
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'ppdbRepCalcBen'
          object ppTitleBand1: TppTitleBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 4763
            mmPrintPosition = 0
            object ppLabel22: TppLabel
              UserName = 'Label22'
              Caption = 'DETALLE DEL CALCULO DEL BENEFICIO '
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 6350
              mmTop = 529
              mmWidth = 67733
              BandType = 1
            end
            object ppLine13: TppLine
              UserName = 'Line13'
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 79111
              mmTop = 2646
              mmWidth = 114036
              BandType = 1
            end
            object ppShape11: TppShape
              UserName = 'Shape11'
              mmHeight = 2116
              mmLeft = 192882
              mmTop = 2646
              mmWidth = 265
              BandType = 1
            end
            object ppShape12: TppShape
              UserName = 'Shape12'
              mmHeight = 2116
              mmLeft = 2116
              mmTop = 2646
              mmWidth = 265
              BandType = 1
            end
            object ppLine14: TppLine
              UserName = 'Line14'
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 2117
              mmTop = 2646
              mmWidth = 4233
              BandType = 1
            end
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4498
            mmPrintPosition = 0
            object ppDBText1: TppDBText
              UserName = 'DBText1'
              AutoSize = True
              DataField = 'DESCRIP'
              DataPipeline = ppdbRepCalcBen
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppdbRepCalcBen'
              mmHeight = 4233
              mmLeft = 7408
              mmTop = 265
              mmWidth = 15081
              BandType = 4
            end
            object ppShape7: TppShape
              UserName = 'Shape7'
              mmHeight = 4763
              mmLeft = 192883
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppShape8: TppShape
              UserName = 'Shape8'
              mmHeight = 4763
              mmLeft = 2117
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppDBText4: TppDBText
              UserName = 'DBText4'
              AutoSize = True
              DataField = 'MONTO'
              DataPipeline = ppdbRepCalcBen
              DisplayFormat = '#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppdbRepCalcBen'
              mmHeight = 4233
              mmLeft = 141552
              mmTop = 265
              mmWidth = 12435
              BandType = 4
            end
            object ppLabel31: TppLabel
              UserName = 'Label31'
              Caption = 'S/. :'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 127265
              mmTop = 265
              mmWidth = 6615
              BandType = 4
            end
          end
          object ppSummaryBand1: TppSummaryBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 26723
            mmPrintPosition = 0
            object ppLine11: TppLine
              UserName = 'Line11'
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 2117
              mmTop = 4763
              mmWidth = 190765
              BandType = 7
            end
            object ppLabel21: TppLabel
              UserName = 'Label201'
              Caption = 'DEVOLUCIONES'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 6615
              mmTop = 6085
              mmWidth = 26988
              BandType = 7
            end
            object ppLine12: TppLine
              UserName = 'Line12'
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 35983
              mmTop = 8202
              mmWidth = 156634
              BandType = 7
            end
            object ppLine15: TppLine
              UserName = 'Line15'
              Weight = 0.750000000000000000
              mmHeight = 1323
              mmLeft = 2117
              mmTop = 8202
              mmWidth = 4233
              BandType = 7
            end
            object ppShape9: TppShape
              UserName = 'Shape9'
              mmHeight = 12700
              mmLeft = 192882
              mmTop = 8202
              mmWidth = 265
              BandType = 7
            end
            object ppShape10: TppShape
              UserName = 'Shape10'
              mmHeight = 12700
              mmLeft = 2117
              mmTop = 8202
              mmWidth = 265
              BandType = 7
            end
            object ppLine16: TppLine
              UserName = 'Line101'
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 2117
              mmTop = 20638
              mmWidth = 190500
              BandType = 7
            end
            object ppLabel24: TppLabel
              UserName = 'Label24'
              Caption = 'TOTAL DEVOLUCIONES'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 7408
              mmTop = 15610
              mmWidth = 38629
              BandType = 7
            end
            object ppShape20: TppShape
              UserName = 'Shape20'
              mmHeight = 5080
              mmLeft = 2117
              mmTop = 0
              mmWidth = 265
              BandType = 7
            end
            object ppShape21: TppShape
              UserName = 'Shape21'
              mmHeight = 5080
              mmLeft = 192882
              mmTop = 0
              mmWidth = 265
              BandType = 7
            end
            object ppLabel30: TppLabel
              UserName = 'Label30'
              Caption = 'TOTAL BENEFICIO ASIGNADO POR RETIRO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 7408
              mmTop = 265
              mmWidth = 66411
              BandType = 7
            end
            object ppSubRepDsctos: TppSubReport
              UserName = 'SubRepDsctos'
              ExpandAll = False
              NewPrintJob = False
              OutlineSettings.CreateNode = True
              TraverseAllData = False
              DataPipelineName = 'ppdbRepDctos'
              mmHeight = 5027
              mmLeft = 0
              mmTop = 21696
              mmWidth = 197115
              BandType = 7
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              object ppChildReport1: TppChildReport
                AutoStop = False
                DataPipeline = ppdbRepDctos
                PrinterSetup.BinName = 'Default'
                PrinterSetup.DocumentName = 'Report'
                PrinterSetup.PaperName = 'A4'
                PrinterSetup.PrinterName = 'Default'
                PrinterSetup.mmMarginBottom = 6350
                PrinterSetup.mmMarginLeft = 6350
                PrinterSetup.mmMarginRight = 6350
                PrinterSetup.mmMarginTop = 6350
                PrinterSetup.mmPaperHeight = 296863
                PrinterSetup.mmPaperWidth = 209815
                PrinterSetup.PaperSize = 9
                Template.FileName = 'C:\SOLExes\SOLFormatos\Pre\Dema\RepLiquidxDpto1.rtm'
                Left = 296
                Top = 272
                Version = '7.02'
                mmColumnWidth = 0
                DataPipelineName = 'ppdbRepDctos'
                object ppTitleBand2: TppTitleBand
                  mmBottomOffset = 0
                  mmHeight = 4498
                  mmPrintPosition = 0
                  object ppLabel23: TppLabel
                    UserName = 'Label23'
                    Caption = 'DESCUENTOS'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Draft 17cpi'
                    Font.Size = 10
                    Font.Style = []
                    Transparent = True
                    mmHeight = 4233
                    mmLeft = 6615
                    mmTop = 265
                    mmWidth = 23548
                    BandType = 1
                  end
                  object ppLine17: TppLine
                    UserName = 'Line17'
                    Weight = 0.750000000000000000
                    mmHeight = 265
                    mmLeft = 31221
                    mmTop = 2381
                    mmWidth = 161925
                    BandType = 1
                  end
                  object ppShape13: TppShape
                    UserName = 'Shape13'
                    mmHeight = 2116
                    mmLeft = 192882
                    mmTop = 2381
                    mmWidth = 265
                    BandType = 1
                  end
                  object ppShape14: TppShape
                    UserName = 'Shape14'
                    mmHeight = 2116
                    mmLeft = 2116
                    mmTop = 2381
                    mmWidth = 265
                    BandType = 1
                  end
                  object ppLine18: TppLine
                    UserName = 'Line18'
                    Weight = 0.750000000000000000
                    mmHeight = 1323
                    mmLeft = 2117
                    mmTop = 2381
                    mmWidth = 4233
                    BandType = 1
                  end
                end
                object ppDetailBand3: TppDetailBand
                  BeforePrint = ppDetailBand3BeforePrint
                  mmBottomOffset = 0
                  mmHeight = 4233
                  mmPrintPosition = 0
                  object ppDBText2: TppDBText
                    UserName = 'DBText2'
                    AutoSize = True
                    DataField = 'DESCRIP'
                    DataPipeline = ppdbRepDctos
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Draft 17cpi'
                    Font.Size = 10
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'ppdbRepDctos'
                    mmHeight = 4233
                    mmLeft = 7408
                    mmTop = 0
                    mmWidth = 15081
                    BandType = 4
                  end
                  object ppShape16: TppShape
                    UserName = 'Shape16'
                    mmHeight = 4233
                    mmLeft = 2117
                    mmTop = 0
                    mmWidth = 265
                    BandType = 4
                  end
                  object ppShape17: TppShape
                    UserName = 'Shape17'
                    mmHeight = 4233
                    mmLeft = 192882
                    mmTop = 0
                    mmWidth = 265
                    BandType = 4
                  end
                  object ppDBText5: TppDBText
                    UserName = 'DBText5'
                    AutoSize = True
                    DataField = 'MONTOPAG'
                    DataPipeline = ppdbRepDctos
                    DisplayFormat = '#,0.00'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Draft 17cpi'
                    Font.Size = 10
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'ppdbRepDctos'
                    mmHeight = 4233
                    mmLeft = 135467
                    mmTop = 0
                    mmWidth = 19844
                    BandType = 4
                  end
                  object ppLabel35: TppLabel
                    UserName = 'Label35'
                    Caption = 'S/. :'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Draft 17cpi'
                    Font.Size = 10
                    Font.Style = []
                    Transparent = True
                    mmHeight = 4233
                    mmLeft = 127265
                    mmTop = 0
                    mmWidth = 6615
                    BandType = 4
                  end
                  object ppDBText6: TppDBText
                    UserName = 'DBText6'
                    AutoSize = True
                    DataField = 'TIPOCRED'
                    DataPipeline = ppdbRepDctos
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Draft 17cpi'
                    Font.Size = 10
                    Font.Style = []
                    Transparent = True
                    Visible = False
                    DataPipelineName = 'ppdbRepDctos'
                    mmHeight = 4233
                    mmLeft = 7408
                    mmTop = 0
                    mmWidth = 17198
                    BandType = 4
                  end
                end
                object ppSummaryBand2: TppSummaryBand
                  PrintHeight = phDynamic
                  mmBottomOffset = 0
                  mmHeight = 10583
                  mmPrintPosition = 0
                  object SubRepSaldo: TppSubReport
                    UserName = 'SubRepSaldo'
                    ExpandAll = False
                    NewPrintJob = False
                    OutlineSettings.CreateNode = True
                    TraverseAllData = False
                    mmHeight = 5027
                    mmLeft = 0
                    mmTop = 5556
                    mmWidth = 197115
                    BandType = 7
                    mmBottomOffset = 0
                    mmOverFlowOffset = 0
                    mmStopPosition = 0
                    object ppChildReport2: TppChildReport
                      PrinterSetup.BinName = 'Default'
                      PrinterSetup.DocumentName = 'Report'
                      PrinterSetup.PaperName = 'A4'
                      PrinterSetup.PrinterName = 'Default'
                      PrinterSetup.mmMarginBottom = 6350
                      PrinterSetup.mmMarginLeft = 6350
                      PrinterSetup.mmMarginRight = 6350
                      PrinterSetup.mmMarginTop = 6350
                      PrinterSetup.mmPaperHeight = 296863
                      PrinterSetup.mmPaperWidth = 209815
                      PrinterSetup.PaperSize = 9
                      Template.FileName = 'C:\SOLExes\SOLFormatos\Pre\Dema\RepLiquidxDpto1.rtm'
                      Left = 328
                      Top = 304
                      Version = '7.02'
                      mmColumnWidth = 0
                      object ppTitleBand3: TppTitleBand
                        mmBottomOffset = 0
                        mmHeight = 11113
                        mmPrintPosition = 0
                        object ppLabel28: TppLabel
                          UserName = 'Label28'
                          Caption = 'SALDO DISPONIBLE DEL BENEFICIO'
                          Font.Charset = ANSI_CHARSET
                          Font.Color = clBlack
                          Font.Name = 'Draft 17cpi'
                          Font.Size = 10
                          Font.Style = []
                          Transparent = True
                          mmHeight = 4233
                          mmLeft = 6615
                          mmTop = 1058
                          mmWidth = 60061
                          BandType = 1
                        end
                        object ppLine22: TppLine
                          UserName = 'Line22'
                          Weight = 0.750000000000000000
                          mmHeight = 265
                          mmLeft = 67469
                          mmTop = 2910
                          mmWidth = 125677
                          BandType = 1
                        end
                        object ppShape18: TppShape
                          UserName = 'Shape18'
                          mmHeight = 7938
                          mmLeft = 192882
                          mmTop = 2910
                          mmWidth = 265
                          BandType = 1
                        end
                        object ppShape19: TppShape
                          UserName = 'Shape19'
                          mmHeight = 7938
                          mmLeft = 2117
                          mmTop = 2910
                          mmWidth = 265
                          BandType = 1
                        end
                        object ppLine23: TppLine
                          UserName = 'Line23'
                          Weight = 0.750000000000000000
                          mmHeight = 1323
                          mmLeft = 2117
                          mmTop = 2910
                          mmWidth = 4233
                          BandType = 1
                        end
                        object ppLabel29: TppLabel
                          UserName = 'Label29'
                          Caption = 'SALDO DISPONIBLE DEL BENEFICIO'
                          Font.Charset = ANSI_CHARSET
                          Font.Color = clBlack
                          Font.Name = 'Draft 17cpi'
                          Font.Size = 10
                          Font.Style = []
                          Transparent = True
                          mmHeight = 4233
                          mmLeft = 7408
                          mmTop = 5821
                          mmWidth = 60061
                          BandType = 1
                        end
                        object ppLine24: TppLine
                          UserName = 'Line102'
                          Weight = 0.750000000000000000
                          mmHeight = 265
                          mmLeft = 2117
                          mmTop = 10583
                          mmWidth = 190500
                          BandType = 1
                        end
                        object pplblSaldo: TppLabel
                          UserName = 'lblSaldo'
                          Caption = 'lblSaldo'
                          Font.Charset = ANSI_CHARSET
                          Font.Color = clBlack
                          Font.Name = 'Draft 17cpi'
                          Font.Size = 10
                          Font.Style = []
                          TextAlignment = taRightJustified
                          Transparent = True
                          mmHeight = 4233
                          mmLeft = 172509
                          mmTop = 5821
                          mmWidth = 12171
                          BandType = 1
                        end
                        object ppLabel34: TppLabel
                          UserName = 'Label34'
                          Caption = 'S/. :'
                          Font.Charset = ANSI_CHARSET
                          Font.Color = clBlack
                          Font.Name = 'Draft 17cpi'
                          Font.Size = 10
                          Font.Style = []
                          Transparent = True
                          mmHeight = 3969
                          mmLeft = 157957
                          mmTop = 5821
                          mmWidth = 5292
                          BandType = 1
                        end
                      end
                      object ppDetailBand4: TppDetailBand
                        PrintHeight = phDynamic
                        mmBottomOffset = 0
                        mmHeight = 5556
                        mmPrintPosition = 0
                        object SubRepFPago: TppSubReport
                          UserName = 'SubRepFPago'
                          ExpandAll = False
                          NewPrintJob = False
                          OutlineSettings.CreateNode = True
                          TraverseAllData = False
                          DataPipelineName = 'ppdbFPago'
                          mmHeight = 5027
                          mmLeft = 0
                          mmTop = 265
                          mmWidth = 197115
                          BandType = 4
                          mmBottomOffset = 0
                          mmOverFlowOffset = 0
                          mmStopPosition = 0
                          object ppChildReport4: TppChildReport
                            AutoStop = False
                            DataPipeline = ppdbFPago
                            PrinterSetup.BinName = 'Default'
                            PrinterSetup.DocumentName = 'Report'
                            PrinterSetup.PaperName = 'A4'
                            PrinterSetup.PrinterName = 'Default'
                            PrinterSetup.mmMarginBottom = 6350
                            PrinterSetup.mmMarginLeft = 6350
                            PrinterSetup.mmMarginRight = 6350
                            PrinterSetup.mmMarginTop = 6350
                            PrinterSetup.mmPaperHeight = 296863
                            PrinterSetup.mmPaperWidth = 210079
                            PrinterSetup.PaperSize = 9
                            Template.FileName = 'C:\SOLExes\SOLFormatos\Pre\Dema\RepLiquidxDpto1.rtm'
                            Left = 288
                            Top = 272
                            Version = '7.02'
                            mmColumnWidth = 0
                            DataPipelineName = 'ppdbFPago'
                            object ppTitleBand5: TppTitleBand
                              mmBottomOffset = 0
                              mmHeight = 4498
                              mmPrintPosition = 0
                              object ppLabel25: TppLabel
                                UserName = 'Label25'
                                Caption = 'FORMA DE PAGO'
                                Font.Charset = ANSI_CHARSET
                                Font.Color = clBlack
                                Font.Name = 'Draft 17cpi'
                                Font.Size = 10
                                Font.Style = []
                                Transparent = True
                                mmHeight = 4233
                                mmLeft = 6615
                                mmTop = 265
                                mmWidth = 29369
                                BandType = 1
                              end
                              object ppLine19: TppLine
                                UserName = 'Line19'
                                Weight = 0.750000000000000000
                                mmHeight = 265
                                mmLeft = 40746
                                mmTop = 2381
                                mmWidth = 152400
                                BandType = 1
                              end
                              object ppShape15: TppShape
                                UserName = 'Shape15'
                                mmHeight = 2116
                                mmLeft = 192883
                                mmTop = 2381
                                mmWidth = 265
                                BandType = 1
                              end
                              object ppShape24: TppShape
                                UserName = 'Shape24'
                                mmHeight = 2116
                                mmLeft = 2381
                                mmTop = 2381
                                mmWidth = 265
                                BandType = 1
                              end
                              object ppLine20: TppLine
                                UserName = 'Line20'
                                Weight = 0.750000000000000000
                                mmHeight = 1323
                                mmLeft = 2381
                                mmTop = 2381
                                mmWidth = 4233
                                BandType = 1
                              end
                            end
                            object ppDetailBand6: TppDetailBand
                              BeforePrint = ppDetailBand6BeforePrint
                              PrintHeight = phDynamic
                              mmBottomOffset = 0
                              mmHeight = 4233
                              mmPrintPosition = 0
                              object ppDBText8: TppDBText
                                UserName = 'DBText8'
                                AutoSize = True
                                DataField = 'DESCRIP'
                                DataPipeline = ppdbFPago
                                Font.Charset = ANSI_CHARSET
                                Font.Color = clBlack
                                Font.Name = 'Draft 17cpi'
                                Font.Size = 10
                                Font.Style = []
                                Transparent = True
                                DataPipelineName = 'ppdbFPago'
                                mmHeight = 4233
                                mmLeft = 8467
                                mmTop = 0
                                mmWidth = 15081
                                BandType = 4
                              end
                              object ppShape25: TppShape
                                UserName = 'Shape25'
                                mmHeight = 4233
                                mmLeft = 2380
                                mmTop = 0
                                mmWidth = 265
                                BandType = 4
                              end
                              object ppShape32: TppShape
                                UserName = 'Shape32'
                                mmHeight = 4233
                                mmLeft = 192883
                                mmTop = 0
                                mmWidth = 265
                                BandType = 4
                              end
                              object ppDBText10: TppDBText
                                UserName = 'DBText10'
                                AutoSize = True
                                DataField = 'MONTO'
                                DataPipeline = ppdbFPago
                                DisplayFormat = '#,0.00'
                                Font.Charset = ANSI_CHARSET
                                Font.Color = clBlack
                                Font.Name = 'Draft 17cpi'
                                Font.Size = 10
                                Font.Style = []
                                TextAlignment = taRightJustified
                                Transparent = True
                                DataPipelineName = 'ppdbFPago'
                                mmHeight = 4233
                                mmLeft = 172509
                                mmTop = 0
                                mmWidth = 12435
                                BandType = 4
                              end
                              object ppLabel26: TppLabel
                                UserName = 'Label26'
                                Caption = 'S/. :'
                                Font.Charset = ANSI_CHARSET
                                Font.Color = clBlack
                                Font.Name = 'Draft 17cpi'
                                Font.Size = 10
                                Font.Style = []
                                Transparent = True
                                mmHeight = 4233
                                mmLeft = 157957
                                mmTop = 0
                                mmWidth = 6615
                                BandType = 4
                              end
                            end
                            object ppSummaryBand5: TppSummaryBand
                              BeforePrint = ppSummaryBand5BeforePrint
                              PrintHeight = phDynamic
                              mmBottomOffset = 0
                              mmHeight = 10583
                              mmPrintPosition = 0
                              object SubRepObs: TppSubReport
                                UserName = 'SubRepObs'
                                ExpandAll = False
                                NewPrintJob = False
                                OutlineSettings.CreateNode = True
                                TraverseAllData = False
                                DataPipelineName = 'ppdbObserv'
                                mmHeight = 5027
                                mmLeft = 0
                                mmTop = 5556
                                mmWidth = 197379
                                BandType = 7
                                mmBottomOffset = 0
                                mmOverFlowOffset = 0
                                mmStopPosition = 0
                                object ppChildReport3: TppChildReport
                                  AutoStop = False
                                  DataPipeline = ppdbObserv
                                  PrinterSetup.BinName = 'Default'
                                  PrinterSetup.DocumentName = 'Report'
                                  PrinterSetup.PaperName = 'A4'
                                  PrinterSetup.PrinterName = 'Default'
                                  PrinterSetup.mmMarginBottom = 6350
                                  PrinterSetup.mmMarginLeft = 6350
                                  PrinterSetup.mmMarginRight = 6350
                                  PrinterSetup.mmMarginTop = 6350
                                  PrinterSetup.mmPaperHeight = 296863
                                  PrinterSetup.mmPaperWidth = 209815
                                  PrinterSetup.PaperSize = 9
                                  Template.FileName = 'C:\SOLExes\SOLFormatos\Pre\Dema\RepLiquidxDpto1.rtm'
                                  Left = 312
                                  Top = 288
                                  Version = '7.02'
                                  mmColumnWidth = 0
                                  DataPipelineName = 'ppdbObserv'
                                  object ppTitleBand4: TppTitleBand
                                    mmBottomOffset = 0
                                    mmHeight = 4763
                                    mmPrintPosition = 0
                                    object ppLabel42: TppLabel
                                      UserName = 'Label42'
                                      Caption = 'OBSERVACION'
                                      Font.Charset = ANSI_CHARSET
                                      Font.Color = clBlack
                                      Font.Name = 'Draft 17cpi'
                                      Font.Size = 10
                                      Font.Style = []
                                      Transparent = True
                                      mmHeight = 4233
                                      mmLeft = 6615
                                      mmTop = 529
                                      mmWidth = 25135
                                      BandType = 1
                                    end
                                    object ppLine28: TppLine
                                      UserName = 'Line28'
                                      Weight = 0.750000000000000000
                                      mmHeight = 265
                                      mmLeft = 37042
                                      mmTop = 2646
                                      mmWidth = 156104
                                      BandType = 1
                                    end
                                    object ppShape26: TppShape
                                      UserName = 'Shape26'
                                      mmHeight = 2116
                                      mmLeft = 192882
                                      mmTop = 2646
                                      mmWidth = 265
                                      BandType = 1
                                    end
                                    object ppLine29: TppLine
                                      UserName = 'Line29'
                                      Weight = 0.750000000000000000
                                      mmHeight = 265
                                      mmLeft = 2117
                                      mmTop = 2381
                                      mmWidth = 4233
                                      BandType = 1
                                    end
                                    object ppShape27: TppShape
                                      UserName = 'Shape27'
                                      mmHeight = 2116
                                      mmLeft = 2117
                                      mmTop = 2646
                                      mmWidth = 265
                                      BandType = 1
                                    end
                                  end
                                  object ppDetailBand5: TppDetailBand
                                    BeforePrint = ppDetailBand5BeforePrint
                                    mmBottomOffset = 0
                                    mmHeight = 4233
                                    mmPrintPosition = 0
                                    object ppDBText7: TppDBText
                                      UserName = 'DBText7'
                                      AutoSize = True
                                      DataField = 'OBSERV'
                                      DataPipeline = ppdbObserv
                                      Font.Charset = ANSI_CHARSET
                                      Font.Color = clBlack
                                      Font.Name = 'Draft 17cpi'
                                      Font.Size = 10
                                      Font.Style = []
                                      Transparent = True
                                      DataPipelineName = 'ppdbObserv'
                                      mmHeight = 4233
                                      mmLeft = 7408
                                      mmTop = 0
                                      mmWidth = 14552
                                      BandType = 4
                                    end
                                    object ppShape28: TppShape
                                      UserName = 'Shape28'
                                      mmHeight = 4233
                                      mmLeft = 2117
                                      mmTop = 0
                                      mmWidth = 265
                                      BandType = 4
                                    end
                                    object ppShape29: TppShape
                                      UserName = 'Shape29'
                                      mmHeight = 4233
                                      mmLeft = 192882
                                      mmTop = 0
                                      mmWidth = 265
                                      BandType = 4
                                    end
                                    object ppDBText9: TppDBText
                                      UserName = 'DBText9'
                                      DataField = 'MONTO'
                                      DataPipeline = ppdbObserv
                                      DisplayFormat = '#,0.00'
                                      Font.Charset = ANSI_CHARSET
                                      Font.Color = clBlack
                                      Font.Name = 'Draft 17cpi'
                                      Font.Size = 10
                                      Font.Style = []
                                      TextAlignment = taRightJustified
                                      Transparent = True
                                      DataPipelineName = 'ppdbObserv'
                                      mmHeight = 3969
                                      mmLeft = 137848
                                      mmTop = 0
                                      mmWidth = 17198
                                      BandType = 4
                                    end
                                    object ppLabel43: TppLabel
                                      UserName = 'Label43'
                                      Caption = 'S/. :'
                                      Font.Charset = ANSI_CHARSET
                                      Font.Color = clBlack
                                      Font.Name = 'Draft 17cpi'
                                      Font.Size = 10
                                      Font.Style = []
                                      Transparent = True
                                      mmHeight = 4233
                                      mmLeft = 127265
                                      mmTop = 0
                                      mmWidth = 6615
                                      BandType = 4
                                    end
                                    object ppLabel49: TppLabel
                                      UserName = 'Label49'
                                      Caption = 'Label49'
                                      Font.Charset = ANSI_CHARSET
                                      Font.Color = clBlack
                                      Font.Name = 'Draft 17cpi'
                                      Font.Size = 10
                                      Font.Style = []
                                      Transparent = True
                                      mmHeight = 4233
                                      mmLeft = 164836
                                      mmTop = 0
                                      mmWidth = 11906
                                      BandType = 4
                                    end
                                  end
                                  object ppSummaryBand4: TppSummaryBand
                                    mmBottomOffset = 0
                                    mmHeight = 37571
                                    mmPrintPosition = 0
                                    object ppLine30: TppLine
                                      UserName = 'Line30'
                                      Weight = 0.750000000000000000
                                      mmHeight = 265
                                      mmLeft = 2117
                                      mmTop = 1588
                                      mmWidth = 190765
                                      BandType = 7
                                    end
                                    object ppShape30: TppShape
                                      UserName = 'Shape30'
                                      mmHeight = 1852
                                      mmLeft = 2116
                                      mmTop = 0
                                      mmWidth = 265
                                      BandType = 7
                                    end
                                    object ppShape31: TppShape
                                      UserName = 'Shape31'
                                      mmHeight = 1852
                                      mmLeft = 192882
                                      mmTop = 0
                                      mmWidth = 265
                                      BandType = 7
                                    end
                                    object ppShape35: TppShape
                                      UserName = 'Shape35'
                                      mmHeight = 27252
                                      mmLeft = 1852
                                      mmTop = 8996
                                      mmWidth = 190765
                                      BandType = 7
                                    end
                                    object ppLabel37: TppLabel
                                      UserName = 'Label11'
                                      Caption = 'V'#176' B'#176' DE LA OFICINA'
                                      Font.Charset = ANSI_CHARSET
                                      Font.Color = clBlack
                                      Font.Name = 'Draft 17cpi'
                                      Font.Size = 10
                                      Font.Style = []
                                      Transparent = True
                                      mmHeight = 4233
                                      mmLeft = 6350
                                      mmTop = 4233
                                      mmWidth = 34131
                                      BandType = 7
                                    end
                                    object pplblAnalista: TppLabel
                                      UserName = 'Label14'
                                      Caption = 'ANALISTA'
                                      Font.Charset = ANSI_CHARSET
                                      Font.Color = clBlack
                                      Font.Name = 'Draft 17cpi'
                                      Font.Size = 10
                                      Font.Style = []
                                      TextAlignment = taCentered
                                      Transparent = True
                                      mmHeight = 4233
                                      mmLeft = 60061
                                      mmTop = 30692
                                      mmWidth = 16404
                                      BandType = 7
                                    end
                                    object ppLine26: TppLine
                                      UserName = 'Line26'
                                      Pen.Style = psDot
                                      Weight = 0.750000000000000000
                                      mmHeight = 265
                                      mmLeft = 53181
                                      mmTop = 28310
                                      mmWidth = 30163
                                      BandType = 7
                                    end
                                    object ppLine27: TppLine
                                      UserName = 'Line201'
                                      Pen.Style = psDot
                                      Weight = 0.750000000000000000
                                      mmHeight = 265
                                      mmLeft = 120650
                                      mmTop = 28310
                                      mmWidth = 30163
                                      BandType = 7
                                    end
                                    object ppLabel41: TppLabel
                                      UserName = 'Label18'
                                      Caption = 'JEFE DE PREVISION SOCIAL'
                                      Font.Charset = ANSI_CHARSET
                                      Font.Color = clBlack
                                      Font.Name = 'Draft 17cpi'
                                      Font.Size = 10
                                      Font.Style = []
                                      TextAlignment = taCentered
                                      Transparent = True
                                      mmHeight = 4233
                                      mmLeft = 112184
                                      mmTop = 30692
                                      mmWidth = 47361
                                      BandType = 7
                                    end
                                  end
                                end
                              end
                              object ppLine21: TppLine
                                UserName = 'Line21'
                                Weight = 0.750000000000000000
                                mmHeight = 265
                                mmLeft = 2381
                                mmTop = 4763
                                mmWidth = 190765
                                BandType = 7
                              end
                              object ppShape33: TppShape
                                UserName = 'Shape33'
                                mmHeight = 5080
                                mmLeft = 2380
                                mmTop = 0
                                mmWidth = 265
                                BandType = 7
                              end
                              object ppShape34: TppShape
                                UserName = 'Shape34'
                                mmHeight = 5080
                                mmLeft = 192883
                                mmTop = 0
                                mmWidth = 265
                                BandType = 7
                              end
                              object ppLabel27: TppLabel
                                UserName = 'Label27'
                                Caption = 'S/. :'
                                Font.Charset = ANSI_CHARSET
                                Font.Color = clBlack
                                Font.Name = 'Draft 17cpi'
                                Font.Size = 10
                                Font.Style = []
                                Transparent = True
                                mmHeight = 4233
                                mmLeft = 158221
                                mmTop = 265
                                mmWidth = 6615
                                BandType = 7
                              end
                              object ppLine31: TppLine
                                UserName = 'Line31'
                                Weight = 0.750000000000000000
                                mmHeight = 265
                                mmLeft = 171980
                                mmTop = 0
                                mmWidth = 13229
                                BandType = 7
                              end
                              object ppLabel39: TppLabel
                                UserName = 'Label39'
                                Caption = 'MONTO'
                                Font.Charset = ANSI_CHARSET
                                Font.Color = clBlack
                                Font.Name = 'Draft 17cpi'
                                Font.Size = 10
                                Font.Style = []
                                TextAlignment = taRightJustified
                                Transparent = True
                                mmHeight = 4233
                                mmLeft = 172773
                                mmTop = 265
                                mmWidth = 12435
                                BandType = 7
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                  object ppLine25: TppLine
                    UserName = 'Line25'
                    Weight = 0.750000000000000000
                    mmHeight = 265
                    mmLeft = 2117
                    mmTop = 4763
                    mmWidth = 190765
                    BandType = 7
                  end
                  object ppShape22: TppShape
                    UserName = 'Shape201'
                    mmHeight = 4763
                    mmLeft = 2117
                    mmTop = 265
                    mmWidth = 265
                    BandType = 7
                  end
                  object ppShape23: TppShape
                    UserName = 'Shape23'
                    mmHeight = 4763
                    mmLeft = 192882
                    mmTop = 265
                    mmWidth = 265
                    BandType = 7
                  end
                  object ppLabel36: TppLabel
                    UserName = 'Label301'
                    Caption = 'TOTAL DESCUENTOS'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Draft 17cpi'
                    Font.Size = 10
                    Font.Style = []
                    Transparent = True
                    mmHeight = 4233
                    mmLeft = 7408
                    mmTop = 265
                    mmWidth = 35190
                    BandType = 7
                  end
                  object pplblTotDctos: TppLabel
                    UserName = 'blbTotBenef2'
                    Caption = 'blbTotBenef'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Draft 17cpi'
                    Font.Size = 10
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    mmHeight = 4233
                    mmLeft = 167482
                    mmTop = 265
                    mmWidth = 17992
                    BandType = 7
                  end
                  object ppLabel38: TppLabel
                    UserName = 'Label38'
                    Caption = 'S/. :'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Draft 17cpi'
                    Font.Size = 10
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3969
                    mmLeft = 157957
                    mmTop = 265
                    mmWidth = 5292
                    BandType = 7
                  end
                end
              end
            end
            object ppblbTotBenef: TppLabel
              UserName = 'blbTotBenef'
              Caption = 'blbTotBenef'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 167482
              mmTop = 265
              mmWidth = 17992
              BandType = 7
            end
            object ppLabel32: TppLabel
              UserName = 'Label32'
              Caption = 'S/. :'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 157957
              mmTop = 265
              mmWidth = 5292
              BandType = 7
            end
            object ppLabel33: TppLabel
              UserName = 'Label33'
              Caption = 'S/. :'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 157957
              mmTop = 15610
              mmWidth = 5292
              BandType = 7
            end
            object pplblTotDevol: TppLabel
              UserName = 'blbTotBenef1'
              Caption = 'blbTotBenef'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 167482
              mmTop = 15610
              mmWidth = 17992
              BandType = 7
            end
            object pplblDevol: TppLabel
              UserName = 'lblDevol'
              Caption = 'DSCTO INDEBIDO APORTES DOCENTE'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 7144
              mmTop = 10583
              mmWidth = 63765
              BandType = 7
            end
            object ppLabel44: TppLabel
              UserName = 'Label44'
              Caption = 'S/. :'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 127265
              mmTop = 10583
              mmWidth = 6615
              BandType = 7
            end
            object ppLabel45: TppLabel
              UserName = 'Label45'
              Caption = 'blbTotBenef'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 135996
              mmTop = 10583
              mmWidth = 17992
              BandType = 7
            end
          end
        end
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'ppdbNroLiq'
      BreakType = btCustomField
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
end
