object fcueinddis: Tfcueinddis
  Left = 142
  Top = 203
  BorderStyle = bsDialog
  Caption = 'Consulta masiva de la Cuenta Individual'
  ClientHeight = 415
  ClientWidth = 792
  Color = 10207162
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 19
    Top = 127
    Width = 470
    Height = 234
    Visible = False
  end
  object gbdistrito: TGroupBox
    Left = 5
    Top = 4
    Width = 780
    Height = 98
    Caption = ' Seleccione el Ubigeo del distrito'
    TabOrder = 0
    object Label12: TLabel
      Left = 21
      Top = 22
      Width = 67
      Height = 13
      Caption = 'Departamento'
    end
    object Label13: TLabel
      Left = 21
      Top = 45
      Width = 44
      Height = 13
      Caption = 'Provincia'
    end
    object Label14: TLabel
      Left = 21
      Top = 70
      Width = 32
      Height = 13
      Caption = 'Distrito'
    end
    object Label1: TLabel
      Left = 92
      Top = 22
      Width = 3
      Height = 13
      Caption = ':'
    end
    object Label2: TLabel
      Left = 92
      Top = 46
      Width = 3
      Height = 13
      Caption = ':'
    end
    object Label3: TLabel
      Left = 92
      Top = 71
      Width = 3
      Height = 13
      Caption = ':'
    end
    object dblcdcoddep: TwwDBLookupComboDlg
      Left = 100
      Top = 18
      Width = 40
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
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnChange = dblcdcoddepChange
      OnExit = dblcdcoddepExit
    end
    object medesdep: TMaskEdit
      Left = 170
      Top = 16
      Width = 178
      Height = 21
      CharCase = ecUpperCase
      Color = 15132390
      Enabled = False
      TabOrder = 5
    end
    object dblcdcodpro: TwwDBLookupComboDlg
      Left = 100
      Top = 42
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
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnChange = dblcdcodproChange
      OnExit = dblcdcodproExit
    end
    object dblcdcoddis: TwwDBLookupComboDlg
      Left = 100
      Top = 67
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
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnExit = dblcdcoddisExit
    end
    object medespro: TMaskEdit
      Left = 170
      Top = 41
      Width = 178
      Height = 21
      CharCase = ecUpperCase
      Color = 15132390
      Enabled = False
      TabOrder = 6
    end
    object medesdis: TMaskEdit
      Left = 170
      Top = 67
      Width = 178
      Height = 21
      CharCase = ecUpperCase
      Color = 15132390
      Enabled = False
      TabOrder = 4
    end
    object btnfiltrar: TBitBtn
      Left = 696
      Top = 18
      Width = 76
      Height = 30
      Caption = 'Filtrar'
      TabOrder = 3
      OnClick = btnfiltrarClick
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
    object rgTipo: TRadioGroup
      Left = 368
      Top = 13
      Width = 233
      Height = 73
      Caption = 'Distrito'
      ItemIndex = 0
      Items.Strings = (
        'Domiciliario'
        'Laboral'
        'Ocurrencia en Domicilio y/o Laboral')
      TabOrder = 7
    end
  end
  object btncerrar: TBitBtn
    Left = 706
    Top = 344
    Width = 80
    Height = 30
    Caption = 'Cerrar'
    TabOrder = 2
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
  object Chart1: TChart
    Left = 376
    Top = 431
    Width = 473
    Height = 233
    AllowPanning = pmNone
    AllowZoom = False
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    BackWall.Pen.Visible = False
    Gradient.Direction = gdFromTopLeft
    MarginRight = 5
    Title.Text.Strings = (
      '')
    AxisVisible = False
    Chart3DPercent = 30
    ClipPoints = False
    Frame.Visible = False
    Legend.Visible = False
    View3DOptions.Elevation = 315
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 0
    View3DOptions.Rotation = 360
    View3DOptions.Zoom = 90
    View3DOptions.ZoomText = False
    View3DWalls = False
    BevelOuter = bvNone
    BevelWidth = 4
    BorderWidth = 5
    Color = clWhite
    TabOrder = 3
    Visible = False
    object Series1: TPieSeries
      Marks.ArrowLength = 8
      Marks.Style = smsLabelPercent
      Marks.Visible = True
      SeriesColor = clRed
      Circled = True
      CustomXRadius = 90
      CustomYRadius = 90
      ExplodeBiggest = 25
      OtherSlice.Text = 'Other'
      PieValues.DateTime = False
      PieValues.Name = 'Pie'
      PieValues.Multiplier = 1.000000000000000000
      PieValues.Order = loDescending
      RotationAngle = 235
    end
  end
  object gbimprimir: TGroupBox
    Left = 510
    Top = 340
    Width = 190
    Height = 66
    Caption = ' Impresi'#243'n '
    TabOrder = 1
    object Label4: TLabel
      Left = 7
      Top = 19
      Width = 31
      Height = 13
      Caption = 'Inicio :'
    end
    object Label5: TLabel
      Left = 7
      Top = 43
      Width = 28
      Height = 13
      Caption = 'Final :'
    end
    object btnimprimir: TBitBtn
      Left = 104
      Top = 15
      Width = 80
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 0
      OnClick = btnimprimirClick
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
    end
    object ceinicio: TSpinEdit
      Left = 56
      Top = 14
      Width = 41
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 1
      Value = 0
    end
    object cefinal: TSpinEdit
      Left = 56
      Top = 39
      Width = 41
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 2
      Value = 0
    end
  end
  object btnaexcel: TBitBtn
    Left = 426
    Top = 344
    Width = 75
    Height = 30
    Caption = 'A Excel'
    TabOrder = 4
    OnClick = btnaexcelClick
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
  object DBGrid: TDBGrid
    Left = 808
    Top = 43
    Width = 17
    Height = 25
    DataSource = DM1.dsReporte
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
  end
  object dbgprevio: TwwDBGrid
    Left = 5
    Top = 108
    Width = 779
    Height = 225
    DisableThemesInTitle = False
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = DM1.dsReporte
    Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    TabOrder = 6
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = True
    OnTitleButtonClick = dbgprevioTitleButtonClick
  end
  object pprepcueind: TppReport
    AutoStop = False
    DataPipeline = ppbdedetapo
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
    Template.FileName = 
      'C:\Documents and Settings\JUDELACRUZ\Escritorio\ASOCIADOS URGENT' +
      'E\ctaind_cole_UNOXUNO_OTRO.rtm'
    DeviceType = 'Printer'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ShowPrintDialog = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 680
    Top = 11
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppbdedetapo'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 134144
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 4498
        mmLeft = 34925
        mmTop = 125413
        mmWidth = 43656
        BandType = 0
      end
      object ppShape23: TppShape
        UserName = 'Shape23'
        mmHeight = 4498
        mmLeft = 78317
        mmTop = 125413
        mmWidth = 22754
        BandType = 0
      end
      object ppShape24: TppShape
        UserName = 'Shape24'
        mmHeight = 4498
        mmLeft = 100806
        mmTop = 125413
        mmWidth = 22754
        BandType = 0
      end
      object ppShape25: TppShape
        UserName = 'Shape25'
        mmHeight = 4498
        mmLeft = 123296
        mmTop = 125413
        mmWidth = 22754
        BandType = 0
      end
      object ppShape26: TppShape
        UserName = 'Shape26'
        mmHeight = 4498
        mmLeft = 145786
        mmTop = 125413
        mmWidth = 22754
        BandType = 0
      end
      object ppLabel258: TppLabel
        UserName = 'Label258'
        Caption = 'BONUS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 131763
        mmTop = 125942
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel232: TppLabel
        UserName = 'Label232'
        Caption = 'DESCRIPCION'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 36248
        mmTop = 125942
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel233: TppLabel
        UserName = 'Label233'
        Caption = 'APORTES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 81756
        mmTop = 125942
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel248: TppLabel
        UserName = 'Label248'
        Caption = 'INTERESES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 104775
        mmTop = 125942
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel261: TppLabel
        UserName = 'Label261'
        Caption = 'SALDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 151342
        mmTop = 125942
        mmWidth = 10583
        BandType = 0
      end
      object ppShape9: TppShape
        UserName = 'Shape9'
        mmHeight = 4498
        mmLeft = 34925
        mmTop = 129646
        mmWidth = 43656
        BandType = 0
      end
      object ppShape11: TppShape
        UserName = 'Shape11'
        mmHeight = 4498
        mmLeft = 78317
        mmTop = 129646
        mmWidth = 22754
        BandType = 0
      end
      object ppShape10: TppShape
        UserName = 'Shape10'
        mmHeight = 4498
        mmLeft = 100806
        mmTop = 129646
        mmWidth = 22754
        BandType = 0
      end
      object ppShape12: TppShape
        UserName = 'Shape101'
        mmHeight = 4498
        mmLeft = 123296
        mmTop = 129646
        mmWidth = 22754
        BandType = 0
      end
      object ppShape13: TppShape
        UserName = 'Shape13'
        mmHeight = 4498
        mmLeft = 145786
        mmTop = 129646
        mmWidth = 22754
        BandType = 0
      end
      object ppldesini: TppLabel
        UserName = 'ldesini'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 36513
        mmTop = 130175
        mmWidth = 39423
        BandType = 0
      end
      object pplapoini: TppLabel
        UserName = 'lapoini'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 80169
        mmTop = 130175
        mmWidth = 18785
        BandType = 0
      end
      object pplintini: TppLabel
        UserName = 'lintini'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 102394
        mmTop = 130175
        mmWidth = 18785
        BandType = 0
      end
      object pplbonini: TppLabel
        UserName = 'lbonini'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 130175
        mmWidth = 18785
        BandType = 0
      end
      object pplsalini: TppLabel
        UserName = 'lsalini'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 148167
        mmTop = 130175
        mmWidth = 18785
        BandType = 0
      end
      object ppLabel236: TppLabel
        UserName = 'Label219'
        Caption = 'ASOCIADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 28575
        mmTop = 46831
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel237: TppLabel
        UserName = 'Label220'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 44979
        mmTop = 46831
        mmWidth = 794
        BandType = 0
      end
      object ppLabel238: TppLabel
        UserName = 'Label221'
        Caption = 'DNI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 146315
        mmTop = 46831
        mmWidth = 5027
        BandType = 0
      end
      object ppLabel239: TppLabel
        UserName = 'Label2201'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 152400
        mmTop = 46831
        mmWidth = 794
        BandType = 0
      end
      object ppLabel240: TppLabel
        UserName = 'Label223'
        Caption = 'DIRECCION'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 28575
        mmTop = 50800
        mmWidth = 15346
        BandType = 0
      end
      object ppLabel241: TppLabel
        UserName = 'Label2202'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 44979
        mmTop = 50800
        mmWidth = 794
        BandType = 0
      end
      object ppLabel242: TppLabel
        UserName = 'Label225'
        Caption = 'DISTRITO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 28575
        mmTop = 54769
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel243: TppLabel
        UserName = 'Label226'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 44979
        mmTop = 54769
        mmWidth = 794
        BandType = 0
      end
      object ppLabel244: TppLabel
        UserName = 'Label227'
        Caption = 'PROVINCIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 101336
        mmTop = 54769
        mmWidth = 15346
        BandType = 0
      end
      object ppLabel245: TppLabel
        UserName = 'Label228'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 117475
        mmTop = 54769
        mmWidth = 1058
        BandType = 0
      end
      object ppLabel246: TppLabel
        UserName = 'Label229'
        Caption = 'DEPARTAMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 28575
        mmTop = 58738
        mmWidth = 23019
        BandType = 0
      end
      object ppLabel247: TppLabel
        UserName = 'Label230'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 52652
        mmTop = 58738
        mmWidth = 794
        BandType = 0
      end
      object pplasoapenomdni_nc: TppLabel
        UserName = 'lasoapenomdni_nc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 47096
        mmTop = 46831
        mmWidth = 97896
        BandType = 0
      end
      object pplasodir_nc: TppLabel
        UserName = 'lasoapenomdni_nc1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 153988
        mmTop = 46831
        mmWidth = 20108
        BandType = 0
      end
      object pplasodni_nc: TppLabel
        UserName = 'lasoapenomdni_nc2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 47096
        mmTop = 50800
        mmWidth = 127000
        BandType = 0
      end
      object ppldst_nc: TppLabel
        UserName = 'lasoapenomdni_nc3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 47096
        mmTop = 54769
        mmWidth = 53446
        BandType = 0
      end
      object pplprv_nc: TppLabel
        UserName = 'lprv_nc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 119592
        mmTop = 54769
        mmWidth = 54504
        BandType = 0
      end
      object ppldep_nc: TppLabel
        UserName = 'ldep_nc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 54504
        mmTop = 58738
        mmWidth = 53446
        BandType = 0
      end
      object ppLabel234: TppLabel
        UserName = 'Label234'
        Caption = 'TELEFONO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 129646
        mmTop = 58738
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel235: TppLabel
        UserName = 'Label235'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 145786
        mmTop = 58738
        mmWidth = 794
        BandType = 0
      end
      object pplasotelf1_nc: TppLabel
        UserName = 'lasoapenomdni_nc4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 147638
        mmTop = 58738
        mmWidth = 26723
        BandType = 0
      end
      object ppLabel249: TppLabel
        UserName = 'Label249'
        Caption = 'COD. MODULAR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 27781
        mmTop = 77788
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel250: TppLabel
        UserName = 'Label250'
        Caption = 'UNIDAD DE PROCESO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 27781
        mmTop = 85196
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel251: TppLabel
        UserName = 'Label2501'
        Caption = 'UGEL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 77523
        mmTop = 77788
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel252: TppLabel
        UserName = 'Label2502'
        Caption = 'UNIDAD DE PAGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 27781
        mmTop = 81492
        mmWidth = 23283
        BandType = 0
      end
      object ppLabel253: TppLabel
        UserName = 'Label253'
        Caption = 'C.E.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 27781
        mmTop = 88900
        mmWidth = 5292
        BandType = 0
      end
      object ppLabel254: TppLabel
        UserName = 'Label254'
        Caption = 'DIRECCION'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 27781
        mmTop = 92869
        mmWidth = 15346
        BandType = 0
      end
      object ppLabel264: TppLabel
        UserName = 'Label264'
        Caption = 'NOMBRAMIENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 27781
        mmTop = 104775
        mmWidth = 23019
        BandType = 0
      end
      object ppLabel266: TppLabel
        UserName = 'Label266'
        Caption = 'A'#209'OS APORTADOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 99484
        mmTop = 104775
        mmWidth = 25665
        BandType = 0
      end
      object pplasocodmod_nc: TppLabel
        UserName = 'lasoapenomdni_nc5'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 51858
        mmTop = 77788
        mmWidth = 25135
        BandType = 0
      end
      object pplunipro_nc: TppLabel
        UserName = 'lunipro_nc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 58738
        mmTop = 85196
        mmWidth = 59002
        BandType = 0
      end
      object ppLabel255: TppLabel
        UserName = 'Label255'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 50006
        mmTop = 77788
        mmWidth = 794
        BandType = 0
      end
      object ppLabel256: TppLabel
        UserName = 'Label256'
        Caption = 'DISTRITO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 27781
        mmTop = 96838
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel257: TppLabel
        UserName = 'Label257'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 41804
        mmTop = 96838
        mmWidth = 794
        BandType = 0
      end
      object ppldstdeslab_nc: TppLabel
        UserName = 'ldstdeslab_nc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 43656
        mmTop = 96838
        mmWidth = 53711
        BandType = 0
      end
      object ppLabel259: TppLabel
        UserName = 'Label259'
        Caption = 'PROVINCIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 97896
        mmTop = 96838
        mmWidth = 15346
        BandType = 0
      end
      object ppLabel260: TppLabel
        UserName = 'Label260'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 114300
        mmTop = 96838
        mmWidth = 794
        BandType = 0
      end
      object pplprvdeslab_nc: TppLabel
        UserName = 'lprvdeslab_nc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 115888
        mmTop = 96838
        mmWidth = 58208
        BandType = 0
      end
      object ppLabel262: TppLabel
        UserName = 'Label262'
        Caption = 'DEPARTAMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 27781
        mmTop = 100806
        mmWidth = 23019
        BandType = 0
      end
      object ppLabel263: TppLabel
        UserName = 'Label2301'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 51594
        mmTop = 100806
        mmWidth = 794
        BandType = 0
      end
      object ppldepdeslab_nc: TppLabel
        UserName = 'ldepdeslab_nc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 53446
        mmTop = 100806
        mmWidth = 49477
        BandType = 0
      end
      object ppLabel270: TppLabel
        UserName = 'Label270'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 85990
        mmTop = 77788
        mmWidth = 794
        BandType = 0
      end
      object ppLabel271: TppLabel
        UserName = 'Label2701'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 34660
        mmTop = 88900
        mmWidth = 794
        BandType = 0
      end
      object ppluniges_nc: TppLabel
        UserName = 'luniges_nc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 88636
        mmTop = 77788
        mmWidth = 85461
        BandType = 0
      end
      object pplunipag_nc: TppLabel
        UserName = 'lunipag_nc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 54240
        mmTop = 81492
        mmWidth = 63500
        BandType = 0
      end
      object ppLabel274: TppLabel
        UserName = 'Label2702'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 56886
        mmTop = 85196
        mmWidth = 794
        BandType = 0
      end
      object ppLabel275: TppLabel
        UserName = 'Label275'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 52388
        mmTop = 81492
        mmWidth = 794
        BandType = 0
      end
      object ppLabel276: TppLabel
        UserName = 'Label276'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 43656
        mmTop = 92869
        mmWidth = 794
        BandType = 0
      end
      object pplasodeslab_nc: TppLabel
        UserName = 'lasodeslab_nc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 36513
        mmTop = 88900
        mmWidth = 137584
        BandType = 0
      end
      object pplasodirleb_nc: TppLabel
        UserName = 'lasodirleb_nc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 45244
        mmTop = 92869
        mmWidth = 59002
        BandType = 0
      end
      object pplasofresnom_nc: TppLabel
        UserName = 'lasofresnom_nc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 53711
        mmTop = 104775
        mmWidth = 19844
        BandType = 0
      end
      object ppLabel280: TppLabel
        UserName = 'Label280'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 51858
        mmTop = 104775
        mmWidth = 794
        BandType = 0
      end
      object pplasoresnom_nc: TppLabel
        UserName = 'lasofresnom_nc1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 79111
        mmTop = 104775
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel231: TppLabel
        UserName = 'Label2801'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 125942
        mmTop = 104775
        mmWidth = 794
        BandType = 0
      end
      object pplanoapo_nc: TppLabel
        UserName = 'lasofresnom_nc2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 127794
        mmTop = 104775
        mmWidth = 46302
        BandType = 0
      end
      object ppLabel50: TppLabel
        UserName = 'Label2'
        Caption = 'N'#186
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 74348
        mmTop = 104775
        mmWidth = 3704
        BandType = 0
      end
      object pplcpocenedu: TppLabel
        UserName = 'lasodirleb_nc1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 115888
        mmTop = 92869
        mmWidth = 58208
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label3'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 114300
        mmTop = 92869
        mmWidth = 794
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label4'
        Caption = 'CPO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3471
        mmLeft = 107421
        mmTop = 92869
        mmWidth = 5715
        BandType = 0
      end
    end
    object ppDetailBand12: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape2'
        Pen.Style = psInsideFrame
        mmHeight = 4498
        mmLeft = 34925
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        Pen.Style = psInsideFrame
        mmHeight = 4498
        mmLeft = 78317
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppShape14: TppShape
        UserName = 'Shape4'
        Pen.Style = psInsideFrame
        mmHeight = 4498
        mmLeft = 100806
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppShape15: TppShape
        UserName = 'Shape14'
        Pen.Style = psInsideFrame
        mmHeight = 4498
        mmLeft = 123296
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppShape16: TppShape
        UserName = 'Shape15'
        Pen.Style = psInsideFrame
        mmHeight = 4498
        mmLeft = 145786
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppShape21: TppShape
        UserName = 'Shape21'
        Pen.Style = psInsideFrame
        mmHeight = 4498
        mmLeft = 168275
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object pplanomes: TppLabel
        OnPrint = pplanomesPrint
        UserName = 'lanomes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 36513
        mmTop = 794
        mmWidth = 39423
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'APORTE'
        DataPipeline = ppbdedetapo
        DisplayFormat = '#,###0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppbdedetapo'
        mmHeight = 3440
        mmLeft = 80169
        mmTop = 794
        mmWidth = 18785
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'INTERES'
        DataPipeline = ppbdedetapo
        DisplayFormat = '#,###0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppbdedetapo'
        mmHeight = 3440
        mmLeft = 102394
        mmTop = 794
        mmWidth = 18785
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'BONUS'
        DataPipeline = ppbdedetapo
        DisplayFormat = '#,###0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppbdedetapo'
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 794
        mmWidth = 18785
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'TOTACU'
        DataPipeline = ppbdedetapo
        DisplayFormat = '#,###0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppbdedetapo'
        mmHeight = 3440
        mmLeft = 148167
        mmTop = 794
        mmWidth = 18785
        BandType = 4
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 77523
      mmPrintPosition = 0
      object ppShape17: TppShape
        UserName = 'Shape16'
        mmHeight = 5027
        mmLeft = 34925
        mmTop = 0
        mmWidth = 43656
        BandType = 7
      end
      object ppShape20: TppShape
        UserName = 'Shape20'
        mmHeight = 5027
        mmLeft = 145786
        mmTop = 0
        mmWidth = 22754
        BandType = 7
      end
      object ppLabel163: TppLabel
        UserName = 'Label1'
        Caption = 'TOTALES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 37042
        mmTop = 794
        mmWidth = 12700
        BandType = 7
      end
      object ppShape18: TppShape
        UserName = 'Shape17'
        mmHeight = 5027
        mmLeft = 123296
        mmTop = 0
        mmWidth = 22754
        BandType = 7
      end
      object ppShape19: TppShape
        UserName = 'Shape18'
        mmHeight = 5027
        mmLeft = 100806
        mmTop = 0
        mmWidth = 22754
        BandType = 7
      end
      object ppShape22: TppShape
        UserName = 'Shape19'
        mmHeight = 5027
        mmLeft = 78317
        mmTop = 0
        mmWidth = 22754
        BandType = 7
      end
      object pplapofin: TppLabel
        UserName = 'lapoini1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 80698
        mmTop = 794
        mmWidth = 18785
        BandType = 7
      end
      object pplintfin: TppLabel
        UserName = 'lintfin'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 102923
        mmTop = 794
        mmWidth = 18785
        BandType = 7
      end
      object pplbonfin: TppLabel
        UserName = 'lbonfin'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 125413
        mmTop = 794
        mmWidth = 18785
        BandType = 7
      end
      object pplsalfin: TppLabel
        UserName = 'lsalfin'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 148696
        mmTop = 794
        mmWidth = 18785
        BandType = 7
      end
      object ppImage3: TppImage
        UserName = 'Image1'
        MaintainAspectRatio = False
        mmHeight = 65352
        mmLeft = 34925
        mmTop = 12171
        mmWidth = 115888
        BandType = 7
      end
      object pplsaldoal: TppLabel
        UserName = 'lsaldoal'
        Caption = '02/11/2007 S/. 1,50.26'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Black'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 130175
        mmTop = 8467
        mmWidth = 35983
        BandType = 7
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppbderepcuenind: TppBDEPipeline
    DataSource = DM1.dsReporte
    UserName = 'bderepcuenind'
    Left = 648
    Top = 43
  end
  object cdsest: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MONTO'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 608
    Top = 11
    Data = {
      480000009619E0BD01000000180000000200000000000300000048000B444553
      4352495043494F4E0100490000000100055749445448020002001400054D4F4E
      544F08000400000000000000}
  end
  object dsest: TDataSource
    DataSet = cdsest
    Left = 608
    Top = 43
  end
  object ppbdedetapo: TppBDEPipeline
    DataSource = DM1.dsCueInd
    UserName = 'bdedetapo'
    Left = 648
    Top = 11
    object ppbdedetapoppField1: TppField
      FieldAlias = 'ANO'
      FieldName = 'ANO'
      FieldLength = 4
      DisplayWidth = 4
      Position = 0
    end
    object ppbdedetapoppField2: TppField
      FieldAlias = 'MES'
      FieldName = 'MES'
      FieldLength = 20
      DisplayWidth = 20
      Position = 1
    end
    object ppbdedetapoppField3: TppField
      FieldAlias = 'USENOM'
      FieldName = 'USENOM'
      FieldLength = 20
      DisplayWidth = 20
      Position = 2
    end
    object ppbdedetapoppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'CAPACU'
      FieldName = 'CAPACU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppbdedetapoppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'INTERES'
      FieldName = 'INTERES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppbdedetapoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'BONUS'
      FieldName = 'BONUS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppbdedetapoppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'APORTE'
      FieldName = 'APORTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppbdedetapoppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEVOLUC'
      FieldName = 'DEVOLUC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppbdedetapoppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTACU'
      FieldName = 'TOTACU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppbdedetapoppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'APOOFI'
      FieldName = 'APOOFI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppbdedetapoppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEV'
      FieldName = 'DEV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppbdedetapoppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'NIV'
      FieldName = 'NIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
  end
end
