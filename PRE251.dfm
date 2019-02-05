object Fnueofi: TFnueofi
  Left = 368
  Top = 205
  BorderStyle = bsDialog
  Caption = 'Generaci'#243'n de nuevos oficios'
  ClientHeight = 344
  ClientWidth = 689
  Color = 13165023
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
  object gbdatos: TGroupBox
    Left = 0
    Top = 0
    Width = 529
    Height = 109
    Caption = ' Generaci'#243'n de oficios '
    Color = 13165023
    ParentColor = False
    TabOrder = 0
    object Label1: TLabel
      Left = 6
      Top = 15
      Width = 71
      Height = 13
      Caption = 'Forma de pago'
    end
    object Label2: TLabel
      Left = 6
      Top = 57
      Width = 31
      Height = 13
      Caption = 'Banco'
    end
    object Label3: TLabel
      Left = 230
      Top = 15
      Width = 59
      Height = 13
      Caption = 'Fecha inicial'
    end
    object Label4: TLabel
      Left = 230
      Top = 57
      Width = 52
      Height = 13
      Caption = 'Fecha final'
    end
    object dbdtpfecini: TwwDBDateTimePicker
      Left = 230
      Top = 33
      Width = 89
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 4
    end
    object dbdtpfecfin: TwwDBDateTimePicker
      Left = 230
      Top = 73
      Width = 89
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 5
    end
    object pnlforpagodes: TPanel
      Left = 61
      Top = 33
      Width = 154
      Height = 23
      Caption = 'pnlforpagodes'
      Enabled = False
      TabOrder = 1
      object meforpagodes: TMaskEdit
        Left = 1
        Top = 1
        Width = 152
        Height = 21
        TabOrder = 0
      end
    end
    object pnlbancodes: TPanel
      Left = 61
      Top = 75
      Width = 154
      Height = 23
      Caption = 'Panel1'
      Enabled = False
      TabOrder = 3
      object mebancodes: TMaskEdit
        Left = 1
        Top = 1
        Width = 152
        Height = 21
        TabOrder = 0
      end
    end
    object btnImprimePrevio: TBitBtn
      Left = 449
      Top = 65
      Width = 73
      Height = 29
      Caption = 'Previo'
      TabOrder = 7
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
    object dblcforpagoid: TwwDBLookupCombo
      Left = 6
      Top = 33
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
      OnChange = dblcforpagoidChange
      OnExit = dblcforpagoidExit
    end
    object dblcbancoid: TwwDBLookupCombo
      Left = 6
      Top = 75
      Width = 47
      Height = 21
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
      OnChange = dblcbancoidChange
    end
    object rgtipomoneda: TRadioGroup
      Left = 327
      Top = 27
      Width = 114
      Height = 66
      Caption = ' Tipo de moneda '
      ItemIndex = 0
      Items.Strings = (
        'Dolares'
        'Soles')
      TabOrder = 6
    end
  end
  object GroupBox2: TGroupBox
    Left = 1
    Top = 111
    Width = 680
    Height = 231
    Caption = 'Detalle del Oficio'
    Color = 13165023
    ParentColor = False
    TabOrder = 1
    object dbgprevio: TwwDBGrid
      Left = 8
      Top = 16
      Width = 665
      Height = 174
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = DM1.dsReporte
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter, dgFooter3DCells]
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = False
    end
    object btnimppre: TBitBtn
      Left = 448
      Top = 194
      Width = 73
      Height = 30
      Caption = 'Imprimir'
      TabOrder = 1
      OnClick = btnimppreClick
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
    object btngenera: TBitBtn
      Left = 525
      Top = 194
      Width = 73
      Height = 30
      Caption = 'Generar'
      TabOrder = 2
      OnClick = btngeneraClick
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
      Left = 601
      Top = 194
      Width = 73
      Height = 30
      Caption = 'Cerrar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Century Gothic'
      Font.Style = []
      ParentFont = False
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
  end
  object ppbdereporte: TppBDEPipeline
    DataSource = DM1.dsReporte
    UserName = 'bdereporte'
    Left = 624
    Top = 8
  end
  object pprGiros: TppReport
    AutoStop = False
    DataPipeline = ppbdereporte
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
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 656
    Top = 8
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppbdereporte'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 29104
      mmPrintPosition = 0
      object ppLabel96: TppLabel
        UserName = 'Label96'
        Caption = 'P'#225'gina N'#176' :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 151607
        mmTop = 2646
        mmWidth = 17463
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 171450
        mmTop = 2646
        mmWidth = 1852
        BandType = 0
      end
      object ppLine25: TppLine
        UserName = 'Line25'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 9260
        mmTop = 21431
        mmWidth = 163777
        BandType = 0
      end
      object ppImage4: TppImage
        UserName = 'Image4'
        MaintainAspectRatio = False
        Stretch = True
        Picture.Data = {
          07544269746D617086190000424D861900000000000036000000280000003000
          00002D000000010018000000000050190000C40E0000C40E0000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF6699CC0066660066990066990066990066990066
          990066990066993399CC00666600669900669900669900669900669900666633
          9999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          66990080800066990066990066990066990080803399996699CC006699006699
          006699006699006699008080006699FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3399990080800066990066990066990066
          990080803399996699CC006699006699006699006699006699008080008080FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6699CC00
          80800080800080800066990066990066990080803399996699CC006699006699
          006699006699006699006699006699339999FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF3399990066990080800066990080800080800066990066
          990080803399996699CC00669900669900669900669900669900669900669900
          6699006699F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99CCCC00669900669900669900
          66990066990066990066990066990066990080803399996699CC006699006699
          00669900669900669900669900669900669900808000669999CCCCFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          3399990066990080800066990066990066990066990066990066990066990066
          990080803399996699CC00669900808000669900669900669900669900669900
          6699006699008080006699006699F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF99CCCC00669900669900808000669900669900669900
          66990066990066990066990066990066990080803399996699CC006699006699
          0066990066990066990066990080800066990066990066990066990080800066
          9999CCCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99CCCC006666008080
          0066990066990066990066990066990066990066990066990080800066990080
          800080803399996699CC00669900669900669900808000808000669900669900
          669900669900669900669900669900808000669966CCCCFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFF0FBFF00669900808000808000669900808000808000808000808000
          80800080800066990066990080800066990080803399996699CC006699006699
          0080800080800066990080800080800080800080800080800080800080800066
          99008080006699C6D6EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF006699008080006699006699
          0080800066990080800066990080800066990066996699CC66CCCC0066990066
          990080803399996699CC0066990066990080806699CC99CCCC00808000669900
          6699006699006699008080006699006699006699008080006699FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF339999006699006699006699008080339999D6E7E799CCCC99CCCC99CCCC99
          CCCCC6D6EF99CCCC0066990080800066990080803399996699CC006699006699
          0080800066996699CCC6D6EF99CCCC99CCCC99CCCC99CCCCC6D6EF6699CC0066
          99006699006699006699008080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF99CCCC006699006699006699006699006699
          99CCCC0066990080800080800080800080800080800066990080800066990066
          990066996699CC99CCCC00808000669900669900808000669900808000808000
          808000808000808000669999CCCC0066990066990066990080800080806699CC
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6E7E70066
          9900808000669900669900808000669999CCCC00669900669900669900669900
          6699006699008080006699006699006699006699D6E7E7C6D6EF006699006699
          00808000669900669900669900669900669900669900669900669999CCCC0066
          9900808000669900808000669900669999CCCCFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF00669900808000669900669900808000669999CCCC
          C6D6EF6699CC3399996699CC6699CC6699CC6699CC6699CC6699CC6699CC3399
          99D6E7E73399CC006699F0FBFF6699CC3399996699CC6699CC6699CC6699CC66
          99CC6699CC3399996699CCC6D6EFC6D6EF006699008080006699006699008080
          006699F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3399990066990066
          99006699006699006699C6D6EF3399990066663399CC66CCCC66CCCC66CCCC66
          CCCC66CCCC66CCCC66CCCC66CCCC66CCCC00999933666633666600669966CCCC
          66CCCC66CCCC66CCCC66CCCC66CCCC66CCCC66CCCC66CCCC66CCCC0066990066
          99D6E7E7008080006699006699006699008080008080FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF99CCCC006699006699008080006699339999D6E7E7006699006699
          5555559966006666336666336666336666336666336666336666336666336666
          3399660099660066663399660066663366663366663366663366663366663366
          6633666633666633996633666633006699008080C6D6EF339999008080008080
          0066990066996699CCFFFFFFFFFFFFFFFFFFFFFFFF3399990066990080800066
          996699CC99CCCC99CCCC008080006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633CC6600996600
          996600996600996600996600996600996600996600996600CC66006666330066
          99006699339999C6D6EF99CCCC006699008080008080008080FFFFFFFFFFFFFF
          FFFFFFFFFF33999900669900669999CCCC66CCCC00666699CCCC006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          00996600996633666633CC660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F0066990066996699CC336699339999C6D6EF
          006699008080008080FFFFFFFFFFFFFFFFFFFFFFFF33999900669900669999CC
          CC00669900669999CCCC006699006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633CC6600996600
          996600996600996600996600996600996600996600996600CC66005F5F5F0066
          990066996699CC33999900669999CCCC008080008080008080FFFFFFFFFFFFFF
          FFFFFFFFFF33999900669900669999CCCC00669900669999CCCC006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          0099660099663366663399660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F0066990066996699CC33999900808099CCCC
          008080008080008080FFFFFFFFFFFFFFFFFFFFFFFF33999900669900669999CC
          CC00669900669999CCCC006699006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633CC6600996600
          996600996600996600996600996600996600996600996600CC66005F5F5F0066
          990066996699CC33999900808099CCCC008080008080008080FFFFFFFFFFFFFF
          FFFFFFFFFF33999900669900669999CCCC00669900669999CCCC006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          0099660099663366663399660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F0066990066996699CC33999900808099CCCC
          008080008080008080FFFFFFFFFFFFFFFFFFFFFFFF33999900669900669999CC
          CC00669900669999CCCC006699006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633996600996600
          996600996600996600996600996600996600996600996600CC66005F5F5F0066
          990066996699CC33999900808099CCCC008080008080008080FFFFFFFFFFFFFF
          FFFFFFFFFF33999900669900808099CCCC00669900669999CCCC006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          0099660099663366663399660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F0066990066996699CC33999900808099CCCC
          006699008080008080FFFFFFFFFFFFFFFFFFFFFFFF339999006699008080C6D6
          EF00808000669999CCCC006699006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633996600996600
          996600996600996600996600996600996600996600996600CC66005F5F5F0066
          990066996699CC33999900808099CCCC339999006699006699FFFFFFFFFFFFFF
          FFFFFFFFFF339999006699C6D6EF99CCCC00808000669999CCCC006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          00996600996633666633CC660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F0066990066996699CC33999900808066CCCC
          F0FBFF008080006699FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99CC
          CC00808000669999CCCC006699006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633996600996600
          996600996600996600996600996600996600996600996600CC66005F5F5F0066
          990066996699CC3399990080806699CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF99CCCC00808000669999CCCC006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          00996600996633666633CC660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F0066990066996699CC3399990080806699CC
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99CC
          CC00808000669999CCCC006699006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633CC6600996600
          996600996600996600996600996600996600996600996600CC66005F5F5F0066
          990066996699CC3399990080806699CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF99CCCC00666600669999CCCC006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          00996600996633666633CC660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F0066990066996699CC3399990066666699CC
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF90A9AD006699006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633CC6600996600
          996600996600996600996600996600996600996600996600CC66005F5F5F0066
          99006699339999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF90A9AD006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          00996600996633666633CC660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F006699006699339999FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF90A9AD006699006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996600666633CC6600996600
          996600996600996600996600996600996600996600996600CC66005F5F5F0066
          99006699339999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF66CCCC006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          0099660099663366663399660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F006699008080339999FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF99CCCC339999339999336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633CC6600996600
          996600996600996600996600996600996600996600996600CC66005555553399
          993399996699CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          336666CC66009966009966009966009966009966009966009966009966009966
          00CC6600555555336666CC660099660099660099660099660099660099660099
          6600996600996600CC66004D4D4DD6E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF336666CC660099660099660099660099
          6600996600996600996600996600996600CC33003366993399CC993300996600
          996600996600996600996600996600996600996600996600CC66004D4D4DC6D6
          EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          336666CC3300CC6600CC6600CC6600CC6600CC6600CC6600CC6600CC6600CC33
          0033666699CCCCF0FBFF006666CC6600CC6600CC6600CC6600CC6600CC6600CC
          6600CC6600CC6600CC3300666633C6D6EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00666633666600666600666600666600
          666600666600666600666633666600666666CCCCFFFFFFFFFFFF99CCCC006699
          006666006666006666006666006666006666006666006666336666006666C6D6
          EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFD6E7E7D6E7E7D6E7E7D6E7E7D6E7E7D6E7E7D6E7E7
          D6E7E7D6E7E7D6E7E7F0FBFFFFFFFFFFFFFF}
        mmHeight = 8731
        mmLeft = 8996
        mmTop = 794
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel97: TppLabel
        UserName = 'Label97'
        Caption = 'DERRAMA MAGISTERIAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4995
        mmLeft = 19579
        mmTop = 2381
        mmWidth = 51435
        BandType = 0
      end
      object ppLabel98: TppLabel
        UserName = 'Label98'
        Caption = 'Sistema de Seguridad y Bienestar Social del Magisterio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 9260
        mmTop = 8996
        mmWidth = 82815
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Apellidos y Nombres'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 9525
        mmTop = 23283
        mmWidth = 26035
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'DNI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 76729
        mmTop = 22490
        mmWidth = 4868
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Importe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 94721
        mmTop = 22490
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'En Soles'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 94721
        mmTop = 25400
        mmWidth = 11377
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Lugar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 107421
        mmTop = 22490
        mmWidth = 7197
        BandType = 0
      end
      object ppltitulo01: TppLabel
        UserName = 'ltitulo01'
        Caption = 'REPORTE PREVIO DE GENERACION DE OFICIO POR TELEGIROS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3810
        mmLeft = 39952
        mmTop = 13229
        mmWidth = 99865
        BandType = 0
      end
      object pplfecha01: TppLabel
        UserName = 'lfecha01'
        Caption = 'BENEFICIOS OTORGADOS DEL 22/08/2005 AL 22/08/2005'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3810
        mmLeft = 44715
        mmTop = 17198
        mmWidth = 87080
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 9260
        mmTop = 28839
        mmWidth = 163777
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Departamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 146579
        mmTop = 22490
        mmWidth = 17992
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3175
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'PVSNOMBRE'
        DataPipeline = ppbdereporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppbdereporte'
        mmHeight = 3175
        mmLeft = 9525
        mmTop = 0
        mmWidth = 66411
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'PVSLDNIBEN'
        DataPipeline = ppbdereporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppbdereporte'
        mmHeight = 3260
        mmLeft = 76729
        mmTop = 0
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'PVSLMONTO'
        DataPipeline = ppbdereporte
        DisplayFormat = '#,###0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppbdereporte'
        mmHeight = 3260
        mmLeft = 91546
        mmTop = 0
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'AGENBCODES'
        DataPipeline = ppbdereporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppbdereporte'
        mmHeight = 3175
        mmLeft = 107421
        mmTop = 0
        mmWidth = 37835
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'DPTODES'
        DataPipeline = ppbdereporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppbdereporte'
        mmHeight = 3260
        mmLeft = 146579
        mmTop = 0
        mmWidth = 26194
        BandType = 4
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 8202
      mmPrintPosition = 0
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'PVSLMONTO'
        DataPipeline = ppbdereporte
        DisplayFormat = '#,###0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppbdereporte'
        mmHeight = 3175
        mmLeft = 91546
        mmTop = 794
        mmWidth = 14552
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'PVSLMONTO'
        DataPipeline = ppbdereporte
        DisplayFormat = '#,###0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppbdereporte'
        mmHeight = 3175
        mmLeft = 91546
        mmTop = 4233
        mmWidth = 14552
        BandType = 7
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 9260
        mmTop = 0
        mmWidth = 163777
        BandType = 7
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 9260
        mmTop = 7938
        mmWidth = 163777
        BandType = 7
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Total Giros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 62442
        mmTop = 794
        mmWidth = 13758
        BandType = 7
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Total Monto Girado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 62442
        mmTop = 4233
        mmWidth = 24342
        BandType = 7
      end
    end
  end
  object pprahorros: TppReport
    AutoStop = False
    DataPipeline = ppbdereporte
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
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 624
    Top = 40
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppbdereporte'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 30956
      mmPrintPosition = 0
      object ppLabel9: TppLabel
        UserName = 'Label96'
        Caption = 'P'#225'gina N'#176' :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 151607
        mmTop = 2910
        mmWidth = 17463
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 171450
        mmTop = 2910
        mmWidth = 1852
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line25'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 9260
        mmTop = 23283
        mmWidth = 163777
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label98'
        Caption = 'Sistema de Seguridad y Bienestar Social del Magisterio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 9260
        mmTop = 9790
        mmWidth = 82815
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label1'
        Caption = 'Apellidos y Nombres'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 9525
        mmTop = 25135
        mmWidth = 26035
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label3'
        Caption = 'Importe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 83873
        mmTop = 24342
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label4'
        Caption = 'En Soles'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 83873
        mmTop = 27252
        mmWidth = 11377
        BandType = 0
      end
      object ppltitulo02: TppLabel
        UserName = 'ltitulo'
        Caption = 'REPORTE PREVIO DE GENERACION DE OFICIO POR DEPOSITO EN CUENTA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3810
        mmLeft = 32316
        mmTop = 14288
        mmWidth = 117264
        BandType = 0
      end
      object pplfecha02: TppLabel
        UserName = 'lfechas'
        Caption = 'BENEFICIOS OTORGADOS DEL 22/08/2005 AL 22/08/2005'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3810
        mmLeft = 45773
        mmTop = 18521
        mmWidth = 87080
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 9260
        mmTop = 30691
        mmWidth = 163777
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label6'
        Caption = 'Teleahorro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 124884
        mmTop = 24342
        mmWidth = 13631
        BandType = 0
      end
      object ppImage1: TppImage
        UserName = 'Image1'
        MaintainAspectRatio = False
        Stretch = True
        Picture.Data = {
          07544269746D617086190000424D861900000000000036000000280000003000
          00002D000000010018000000000050190000C40E0000C40E0000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF6699CC0066660066990066990066990066990066
          990066990066993399CC00666600669900669900669900669900669900666633
          9999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          66990080800066990066990066990066990080803399996699CC006699006699
          006699006699006699008080006699FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3399990080800066990066990066990066
          990080803399996699CC006699006699006699006699006699008080008080FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6699CC00
          80800080800080800066990066990066990080803399996699CC006699006699
          006699006699006699006699006699339999FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF3399990066990080800066990080800080800066990066
          990080803399996699CC00669900669900669900669900669900669900669900
          6699006699F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99CCCC00669900669900669900
          66990066990066990066990066990066990080803399996699CC006699006699
          00669900669900669900669900669900669900808000669999CCCCFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          3399990066990080800066990066990066990066990066990066990066990066
          990080803399996699CC00669900808000669900669900669900669900669900
          6699006699008080006699006699F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF99CCCC00669900669900808000669900669900669900
          66990066990066990066990066990066990080803399996699CC006699006699
          0066990066990066990066990080800066990066990066990066990080800066
          9999CCCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99CCCC006666008080
          0066990066990066990066990066990066990066990066990080800066990080
          800080803399996699CC00669900669900669900808000808000669900669900
          669900669900669900669900669900808000669966CCCCFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFF0FBFF00669900808000808000669900808000808000808000808000
          80800080800066990066990080800066990080803399996699CC006699006699
          0080800080800066990080800080800080800080800080800080800080800066
          99008080006699C6D6EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF006699008080006699006699
          0080800066990080800066990080800066990066996699CC66CCCC0066990066
          990080803399996699CC0066990066990080806699CC99CCCC00808000669900
          6699006699006699008080006699006699006699008080006699FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF339999006699006699006699008080339999D6E7E799CCCC99CCCC99CCCC99
          CCCCC6D6EF99CCCC0066990080800066990080803399996699CC006699006699
          0080800066996699CCC6D6EF99CCCC99CCCC99CCCC99CCCCC6D6EF6699CC0066
          99006699006699006699008080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF99CCCC006699006699006699006699006699
          99CCCC0066990080800080800080800080800080800066990080800066990066
          990066996699CC99CCCC00808000669900669900808000669900808000808000
          808000808000808000669999CCCC0066990066990066990080800080806699CC
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6E7E70066
          9900808000669900669900808000669999CCCC00669900669900669900669900
          6699006699008080006699006699006699006699D6E7E7C6D6EF006699006699
          00808000669900669900669900669900669900669900669900669999CCCC0066
          9900808000669900808000669900669999CCCCFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF00669900808000669900669900808000669999CCCC
          C6D6EF6699CC3399996699CC6699CC6699CC6699CC6699CC6699CC6699CC3399
          99D6E7E73399CC006699F0FBFF6699CC3399996699CC6699CC6699CC6699CC66
          99CC6699CC3399996699CCC6D6EFC6D6EF006699008080006699006699008080
          006699F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3399990066990066
          99006699006699006699C6D6EF3399990066663399CC66CCCC66CCCC66CCCC66
          CCCC66CCCC66CCCC66CCCC66CCCC66CCCC00999933666633666600669966CCCC
          66CCCC66CCCC66CCCC66CCCC66CCCC66CCCC66CCCC66CCCC66CCCC0066990066
          99D6E7E7008080006699006699006699008080008080FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF99CCCC006699006699008080006699339999D6E7E7006699006699
          5555559966006666336666336666336666336666336666336666336666336666
          3399660099660066663399660066663366663366663366663366663366663366
          6633666633666633996633666633006699008080C6D6EF339999008080008080
          0066990066996699CCFFFFFFFFFFFFFFFFFFFFFFFF3399990066990080800066
          996699CC99CCCC99CCCC008080006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633CC6600996600
          996600996600996600996600996600996600996600996600CC66006666330066
          99006699339999C6D6EF99CCCC006699008080008080008080FFFFFFFFFFFFFF
          FFFFFFFFFF33999900669900669999CCCC66CCCC00666699CCCC006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          00996600996633666633CC660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F0066990066996699CC336699339999C6D6EF
          006699008080008080FFFFFFFFFFFFFFFFFFFFFFFF33999900669900669999CC
          CC00669900669999CCCC006699006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633CC6600996600
          996600996600996600996600996600996600996600996600CC66005F5F5F0066
          990066996699CC33999900669999CCCC008080008080008080FFFFFFFFFFFFFF
          FFFFFFFFFF33999900669900669999CCCC00669900669999CCCC006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          0099660099663366663399660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F0066990066996699CC33999900808099CCCC
          008080008080008080FFFFFFFFFFFFFFFFFFFFFFFF33999900669900669999CC
          CC00669900669999CCCC006699006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633CC6600996600
          996600996600996600996600996600996600996600996600CC66005F5F5F0066
          990066996699CC33999900808099CCCC008080008080008080FFFFFFFFFFFFFF
          FFFFFFFFFF33999900669900669999CCCC00669900669999CCCC006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          0099660099663366663399660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F0066990066996699CC33999900808099CCCC
          008080008080008080FFFFFFFFFFFFFFFFFFFFFFFF33999900669900669999CC
          CC00669900669999CCCC006699006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633996600996600
          996600996600996600996600996600996600996600996600CC66005F5F5F0066
          990066996699CC33999900808099CCCC008080008080008080FFFFFFFFFFFFFF
          FFFFFFFFFF33999900669900808099CCCC00669900669999CCCC006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          0099660099663366663399660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F0066990066996699CC33999900808099CCCC
          006699008080008080FFFFFFFFFFFFFFFFFFFFFFFF339999006699008080C6D6
          EF00808000669999CCCC006699006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633996600996600
          996600996600996600996600996600996600996600996600CC66005F5F5F0066
          990066996699CC33999900808099CCCC339999006699006699FFFFFFFFFFFFFF
          FFFFFFFFFF339999006699C6D6EF99CCCC00808000669999CCCC006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          00996600996633666633CC660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F0066990066996699CC33999900808066CCCC
          F0FBFF008080006699FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99CC
          CC00808000669999CCCC006699006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633996600996600
          996600996600996600996600996600996600996600996600CC66005F5F5F0066
          990066996699CC3399990080806699CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF99CCCC00808000669999CCCC006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          00996600996633666633CC660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F0066990066996699CC3399990080806699CC
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99CC
          CC00808000669999CCCC006699006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633CC6600996600
          996600996600996600996600996600996600996600996600CC66005F5F5F0066
          990066996699CC3399990080806699CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF99CCCC00666600669999CCCC006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          00996600996633666633CC660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F0066990066996699CC3399990066666699CC
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF90A9AD006699006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633CC6600996600
          996600996600996600996600996600996600996600996600CC66005F5F5F0066
          99006699339999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF90A9AD006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          00996600996633666633CC660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F006699006699339999FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF90A9AD006699006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996600666633CC6600996600
          996600996600996600996600996600996600996600996600CC66005F5F5F0066
          99006699339999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF66CCCC006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          0099660099663366663399660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F006699008080339999FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF99CCCC339999339999336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633CC6600996600
          996600996600996600996600996600996600996600996600CC66005555553399
          993399996699CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          336666CC66009966009966009966009966009966009966009966009966009966
          00CC6600555555336666CC660099660099660099660099660099660099660099
          6600996600996600CC66004D4D4DD6E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF336666CC660099660099660099660099
          6600996600996600996600996600996600CC33003366993399CC993300996600
          996600996600996600996600996600996600996600996600CC66004D4D4DC6D6
          EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          336666CC3300CC6600CC6600CC6600CC6600CC6600CC6600CC6600CC6600CC33
          0033666699CCCCF0FBFF006666CC6600CC6600CC6600CC6600CC6600CC6600CC
          6600CC6600CC6600CC3300666633C6D6EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00666633666600666600666600666600
          666600666600666600666633666600666666CCCCFFFFFFFFFFFF99CCCC006699
          006666006666006666006666006666006666006666006666336666006666C6D6
          EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFD6E7E7D6E7E7D6E7E7D6E7E7D6E7E7D6E7E7D6E7E7
          D6E7E7D6E7E7D6E7E7F0FBFFFFFFFFFFFFFF}
        mmHeight = 8731
        mmLeft = 8996
        mmTop = 794
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'DERRAMA MAGISTERIAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4995
        mmLeft = 19579
        mmTop = 2381
        mmWidth = 51435
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3175
      mmPrintPosition = 0
      object ppDBText6: TppDBText
        UserName = 'DBText1'
        DataField = 'PVSNOMBRE'
        DataPipeline = ppbdereporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppbdereporte'
        mmHeight = 3175
        mmLeft = 9525
        mmTop = 0
        mmWidth = 66411
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText3'
        DataField = 'PVSLMONTO'
        DataPipeline = ppbdereporte
        DisplayFormat = '#,###0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppbdereporte'
        mmHeight = 3260
        mmLeft = 80698
        mmTop = 0
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText5'
        DataField = 'PVSLNCTA'
        DataPipeline = ppbdereporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppbdereporte'
        mmHeight = 3175
        mmLeft = 124884
        mmTop = 0
        mmWidth = 17463
        BandType = 4
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 8202
      mmPrintPosition = 0
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'PVSLMONTO'
        DataPipeline = ppbdereporte
        DisplayFormat = '#,###0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppbdereporte'
        mmHeight = 3175
        mmLeft = 80698
        mmTop = 794
        mmWidth = 14552
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'PVSLMONTO'
        DataPipeline = ppbdereporte
        DisplayFormat = '#,###0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppbdereporte'
        mmHeight = 3175
        mmLeft = 80698
        mmTop = 4233
        mmWidth = 14552
        BandType = 7
      end
      object ppLine6: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 9260
        mmTop = 0
        mmWidth = 163777
        BandType = 7
      end
      object ppLine7: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 9260
        mmTop = 7938
        mmWidth = 163777
        BandType = 7
      end
      object ppLabel20: TppLabel
        UserName = 'Label7'
        Caption = 'Total Giros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 51594
        mmTop = 794
        mmWidth = 13758
        BandType = 7
      end
      object ppLabel21: TppLabel
        UserName = 'Label8'
        Caption = 'Total Monto Girado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 51594
        mmTop = 4233
        mmWidth = 24342
        BandType = 7
      end
    end
  end
  object pprlibretas: TppReport
    AutoStop = False
    DataPipeline = ppbdereporte
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
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 656
    Top = 40
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppbdereporte'
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 30956
      mmPrintPosition = 0
      object ppLabel22: TppLabel
        UserName = 'Label96'
        Caption = 'P'#225'gina N'#176' :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 151607
        mmTop = 2910
        mmWidth = 17463
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 171450
        mmTop = 2910
        mmWidth = 1852
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'Line25'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 9260
        mmTop = 23283
        mmWidth = 165100
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label98'
        Caption = 'Sistema de Seguridad y Bienestar Social del Magisterio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 9260
        mmTop = 9525
        mmWidth = 82815
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label1'
        Caption = 'Apellidos y Nombres'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 9525
        mmTop = 25135
        mmWidth = 26035
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label3'
        Caption = 'Importe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 70644
        mmTop = 24342
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label4'
        Caption = 'En Soles'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 70644
        mmTop = 27252
        mmWidth = 11377
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label5'
        Caption = 'Fecha de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 83079
        mmTop = 24342
        mmWidth = 11906
        BandType = 0
      end
      object ppltitulo03: TppLabel
        UserName = 'ltitulo'
        Caption = 'REPORTE PREVIO DE GENERACION DE OFICIO POR TELEGIROS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3810
        mmLeft = 41010
        mmTop = 14288
        mmWidth = 99865
        BandType = 0
      end
      object pplfecha03: TppLabel
        UserName = 'lfechas'
        Caption = 'BENEFICIOS OTORGADOS DEL 22/08/2005 AL 22/08/2005'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3810
        mmLeft = 45773
        mmTop = 18521
        mmWidth = 87080
        BandType = 0
      end
      object ppLine9: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 9260
        mmTop = 30691
        mmWidth = 165100
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label6'
        Caption = 'Apellidos y Nombres'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 98954
        mmTop = 24342
        mmWidth = 25929
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Nacimiento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 83079
        mmTop = 27252
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'del tutor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 98954
        mmTop = 27252
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'DNI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 157692
        mmTop = 24342
        mmWidth = 4763
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        Caption = 'del tutor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 157692
        mmTop = 27252
        mmWidth = 10319
        BandType = 0
      end
      object ppImage2: TppImage
        UserName = 'Image2'
        MaintainAspectRatio = False
        Stretch = True
        Picture.Data = {
          07544269746D617086190000424D861900000000000036000000280000003000
          00002D000000010018000000000050190000C40E0000C40E0000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF6699CC0066660066990066990066990066990066
          990066990066993399CC00666600669900669900669900669900669900666633
          9999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          66990080800066990066990066990066990080803399996699CC006699006699
          006699006699006699008080006699FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3399990080800066990066990066990066
          990080803399996699CC006699006699006699006699006699008080008080FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6699CC00
          80800080800080800066990066990066990080803399996699CC006699006699
          006699006699006699006699006699339999FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF3399990066990080800066990080800080800066990066
          990080803399996699CC00669900669900669900669900669900669900669900
          6699006699F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99CCCC00669900669900669900
          66990066990066990066990066990066990080803399996699CC006699006699
          00669900669900669900669900669900669900808000669999CCCCFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          3399990066990080800066990066990066990066990066990066990066990066
          990080803399996699CC00669900808000669900669900669900669900669900
          6699006699008080006699006699F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF99CCCC00669900669900808000669900669900669900
          66990066990066990066990066990066990080803399996699CC006699006699
          0066990066990066990066990080800066990066990066990066990080800066
          9999CCCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99CCCC006666008080
          0066990066990066990066990066990066990066990066990080800066990080
          800080803399996699CC00669900669900669900808000808000669900669900
          669900669900669900669900669900808000669966CCCCFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFF0FBFF00669900808000808000669900808000808000808000808000
          80800080800066990066990080800066990080803399996699CC006699006699
          0080800080800066990080800080800080800080800080800080800080800066
          99008080006699C6D6EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF006699008080006699006699
          0080800066990080800066990080800066990066996699CC66CCCC0066990066
          990080803399996699CC0066990066990080806699CC99CCCC00808000669900
          6699006699006699008080006699006699006699008080006699FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF339999006699006699006699008080339999D6E7E799CCCC99CCCC99CCCC99
          CCCCC6D6EF99CCCC0066990080800066990080803399996699CC006699006699
          0080800066996699CCC6D6EF99CCCC99CCCC99CCCC99CCCCC6D6EF6699CC0066
          99006699006699006699008080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF99CCCC006699006699006699006699006699
          99CCCC0066990080800080800080800080800080800066990080800066990066
          990066996699CC99CCCC00808000669900669900808000669900808000808000
          808000808000808000669999CCCC0066990066990066990080800080806699CC
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6E7E70066
          9900808000669900669900808000669999CCCC00669900669900669900669900
          6699006699008080006699006699006699006699D6E7E7C6D6EF006699006699
          00808000669900669900669900669900669900669900669900669999CCCC0066
          9900808000669900808000669900669999CCCCFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF00669900808000669900669900808000669999CCCC
          C6D6EF6699CC3399996699CC6699CC6699CC6699CC6699CC6699CC6699CC3399
          99D6E7E73399CC006699F0FBFF6699CC3399996699CC6699CC6699CC6699CC66
          99CC6699CC3399996699CCC6D6EFC6D6EF006699008080006699006699008080
          006699F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3399990066990066
          99006699006699006699C6D6EF3399990066663399CC66CCCC66CCCC66CCCC66
          CCCC66CCCC66CCCC66CCCC66CCCC66CCCC00999933666633666600669966CCCC
          66CCCC66CCCC66CCCC66CCCC66CCCC66CCCC66CCCC66CCCC66CCCC0066990066
          99D6E7E7008080006699006699006699008080008080FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF99CCCC006699006699008080006699339999D6E7E7006699006699
          5555559966006666336666336666336666336666336666336666336666336666
          3399660099660066663399660066663366663366663366663366663366663366
          6633666633666633996633666633006699008080C6D6EF339999008080008080
          0066990066996699CCFFFFFFFFFFFFFFFFFFFFFFFF3399990066990080800066
          996699CC99CCCC99CCCC008080006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633CC6600996600
          996600996600996600996600996600996600996600996600CC66006666330066
          99006699339999C6D6EF99CCCC006699008080008080008080FFFFFFFFFFFFFF
          FFFFFFFFFF33999900669900669999CCCC66CCCC00666699CCCC006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          00996600996633666633CC660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F0066990066996699CC336699339999C6D6EF
          006699008080008080FFFFFFFFFFFFFFFFFFFFFFFF33999900669900669999CC
          CC00669900669999CCCC006699006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633CC6600996600
          996600996600996600996600996600996600996600996600CC66005F5F5F0066
          990066996699CC33999900669999CCCC008080008080008080FFFFFFFFFFFFFF
          FFFFFFFFFF33999900669900669999CCCC00669900669999CCCC006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          0099660099663366663399660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F0066990066996699CC33999900808099CCCC
          008080008080008080FFFFFFFFFFFFFFFFFFFFFFFF33999900669900669999CC
          CC00669900669999CCCC006699006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633CC6600996600
          996600996600996600996600996600996600996600996600CC66005F5F5F0066
          990066996699CC33999900808099CCCC008080008080008080FFFFFFFFFFFFFF
          FFFFFFFFFF33999900669900669999CCCC00669900669999CCCC006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          0099660099663366663399660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F0066990066996699CC33999900808099CCCC
          008080008080008080FFFFFFFFFFFFFFFFFFFFFFFF33999900669900669999CC
          CC00669900669999CCCC006699006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633996600996600
          996600996600996600996600996600996600996600996600CC66005F5F5F0066
          990066996699CC33999900808099CCCC008080008080008080FFFFFFFFFFFFFF
          FFFFFFFFFF33999900669900808099CCCC00669900669999CCCC006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          0099660099663366663399660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F0066990066996699CC33999900808099CCCC
          006699008080008080FFFFFFFFFFFFFFFFFFFFFFFF339999006699008080C6D6
          EF00808000669999CCCC006699006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633996600996600
          996600996600996600996600996600996600996600996600CC66005F5F5F0066
          990066996699CC33999900808099CCCC339999006699006699FFFFFFFFFFFFFF
          FFFFFFFFFF339999006699C6D6EF99CCCC00808000669999CCCC006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          00996600996633666633CC660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F0066990066996699CC33999900808066CCCC
          F0FBFF008080006699FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99CC
          CC00808000669999CCCC006699006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633996600996600
          996600996600996600996600996600996600996600996600CC66005F5F5F0066
          990066996699CC3399990080806699CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF99CCCC00808000669999CCCC006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          00996600996633666633CC660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F0066990066996699CC3399990080806699CC
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99CC
          CC00808000669999CCCC006699006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633CC6600996600
          996600996600996600996600996600996600996600996600CC66005F5F5F0066
          990066996699CC3399990080806699CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF99CCCC00666600669999CCCC006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          00996600996633666633CC660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F0066990066996699CC3399990066666699CC
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF90A9AD006699006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633CC6600996600
          996600996600996600996600996600996600996600996600CC66005F5F5F0066
          99006699339999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF90A9AD006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          00996600996633666633CC660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F006699006699339999FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF90A9AD006699006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996600666633CC6600996600
          996600996600996600996600996600996600996600996600CC66005F5F5F0066
          99006699339999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF66CCCC006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          0099660099663366663399660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F006699008080339999FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF99CCCC339999339999336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633CC6600996600
          996600996600996600996600996600996600996600996600CC66005555553399
          993399996699CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          336666CC66009966009966009966009966009966009966009966009966009966
          00CC6600555555336666CC660099660099660099660099660099660099660099
          6600996600996600CC66004D4D4DD6E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF336666CC660099660099660099660099
          6600996600996600996600996600996600CC33003366993399CC993300996600
          996600996600996600996600996600996600996600996600CC66004D4D4DC6D6
          EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          336666CC3300CC6600CC6600CC6600CC6600CC6600CC6600CC6600CC6600CC33
          0033666699CCCCF0FBFF006666CC6600CC6600CC6600CC6600CC6600CC6600CC
          6600CC6600CC6600CC3300666633C6D6EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00666633666600666600666600666600
          666600666600666600666633666600666666CCCCFFFFFFFFFFFF99CCCC006699
          006666006666006666006666006666006666006666006666336666006666C6D6
          EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFD6E7E7D6E7E7D6E7E7D6E7E7D6E7E7D6E7E7D6E7E7
          D6E7E7D6E7E7D6E7E7F0FBFFFFFFFFFFFFFF}
        mmHeight = 8731
        mmLeft = 8996
        mmTop = 794
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'DERRAMA MAGISTERIAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4995
        mmLeft = 19579
        mmTop = 2381
        mmWidth = 51435
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3175
      mmPrintPosition = 0
      object ppDBText11: TppDBText
        UserName = 'DBText1'
        DataField = 'PVSNOMBRE'
        DataPipeline = ppbdereporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppbdereporte'
        mmHeight = 3175
        mmLeft = 9525
        mmTop = 0
        mmWidth = 57414
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText3'
        DataField = 'PVSLMONTO'
        DataPipeline = ppbdereporte
        DisplayFormat = '#,###0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppbdereporte'
        mmHeight = 3260
        mmLeft = 67469
        mmTop = 0
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText4'
        DataField = 'FECNACMEN'
        DataPipeline = ppbdereporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppbdereporte'
        mmHeight = 3175
        mmLeft = 83079
        mmTop = 0
        mmWidth = 14817
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText5'
        DataField = 'APENOMTUT'
        DataPipeline = ppbdereporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppbdereporte'
        mmHeight = 3175
        mmLeft = 98690
        mmTop = 0
        mmWidth = 57414
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'DOCIDETUT'
        DataPipeline = ppbdereporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppbdereporte'
        mmHeight = 3175
        mmLeft = 157692
        mmTop = 0
        mmWidth = 14552
        BandType = 4
      end
    end
    object ppSummaryBand3: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 8202
      mmPrintPosition = 0
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'PVSLMONTO'
        DataPipeline = ppbdereporte
        DisplayFormat = '#,###0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppbdereporte'
        mmHeight = 3175
        mmLeft = 67469
        mmTop = 529
        mmWidth = 14552
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'PVSLMONTO'
        DataPipeline = ppbdereporte
        DisplayFormat = '#,###0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppbdereporte'
        mmHeight = 3175
        mmLeft = 67469
        mmTop = 3969
        mmWidth = 14552
        BandType = 7
      end
      object ppLine10: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 9260
        mmTop = 0
        mmWidth = 165100
        BandType = 7
      end
      object ppLine11: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 9260
        mmTop = 7408
        mmWidth = 165100
        BandType = 7
      end
      object ppLabel33: TppLabel
        UserName = 'Label7'
        Caption = 'Total Giros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 42333
        mmTop = 529
        mmWidth = 13758
        BandType = 7
      end
      object ppLabel34: TppLabel
        UserName = 'Label8'
        Caption = 'Total Monto Girado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 42333
        mmTop = 3969
        mmWidth = 24342
        BandType = 7
      end
    end
  end
  object pprcheger: TppReport
    AutoStop = False
    DataPipeline = ppbdereporte
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
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 624
    Top = 72
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppbdereporte'
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 29633
      mmPrintPosition = 0
      object ppLabel18: TppLabel
        UserName = 'Label96'
        Caption = 'P'#225'gina N'#176' :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 151607
        mmTop = 2646
        mmWidth = 17463
        BandType = 0
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 171450
        mmTop = 2646
        mmWidth = 1852
        BandType = 0
      end
      object ppLine12: TppLine
        UserName = 'Line25'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 9260
        mmTop = 21431
        mmWidth = 163777
        BandType = 0
      end
      object ppImage3: TppImage
        UserName = 'Image4'
        MaintainAspectRatio = False
        Stretch = True
        Picture.Data = {
          07544269746D617086190000424D861900000000000036000000280000003000
          00002D000000010018000000000050190000C40E0000C40E0000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF6699CC0066660066990066990066990066990066
          990066990066993399CC00666600669900669900669900669900669900666633
          9999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          66990080800066990066990066990066990080803399996699CC006699006699
          006699006699006699008080006699FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3399990080800066990066990066990066
          990080803399996699CC006699006699006699006699006699008080008080FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6699CC00
          80800080800080800066990066990066990080803399996699CC006699006699
          006699006699006699006699006699339999FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF3399990066990080800066990080800080800066990066
          990080803399996699CC00669900669900669900669900669900669900669900
          6699006699F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99CCCC00669900669900669900
          66990066990066990066990066990066990080803399996699CC006699006699
          00669900669900669900669900669900669900808000669999CCCCFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          3399990066990080800066990066990066990066990066990066990066990066
          990080803399996699CC00669900808000669900669900669900669900669900
          6699006699008080006699006699F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF99CCCC00669900669900808000669900669900669900
          66990066990066990066990066990066990080803399996699CC006699006699
          0066990066990066990066990080800066990066990066990066990080800066
          9999CCCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99CCCC006666008080
          0066990066990066990066990066990066990066990066990080800066990080
          800080803399996699CC00669900669900669900808000808000669900669900
          669900669900669900669900669900808000669966CCCCFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFF0FBFF00669900808000808000669900808000808000808000808000
          80800080800066990066990080800066990080803399996699CC006699006699
          0080800080800066990080800080800080800080800080800080800080800066
          99008080006699C6D6EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF006699008080006699006699
          0080800066990080800066990080800066990066996699CC66CCCC0066990066
          990080803399996699CC0066990066990080806699CC99CCCC00808000669900
          6699006699006699008080006699006699006699008080006699FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF339999006699006699006699008080339999D6E7E799CCCC99CCCC99CCCC99
          CCCCC6D6EF99CCCC0066990080800066990080803399996699CC006699006699
          0080800066996699CCC6D6EF99CCCC99CCCC99CCCC99CCCCC6D6EF6699CC0066
          99006699006699006699008080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF99CCCC006699006699006699006699006699
          99CCCC0066990080800080800080800080800080800066990080800066990066
          990066996699CC99CCCC00808000669900669900808000669900808000808000
          808000808000808000669999CCCC0066990066990066990080800080806699CC
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6E7E70066
          9900808000669900669900808000669999CCCC00669900669900669900669900
          6699006699008080006699006699006699006699D6E7E7C6D6EF006699006699
          00808000669900669900669900669900669900669900669900669999CCCC0066
          9900808000669900808000669900669999CCCCFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF00669900808000669900669900808000669999CCCC
          C6D6EF6699CC3399996699CC6699CC6699CC6699CC6699CC6699CC6699CC3399
          99D6E7E73399CC006699F0FBFF6699CC3399996699CC6699CC6699CC6699CC66
          99CC6699CC3399996699CCC6D6EFC6D6EF006699008080006699006699008080
          006699F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3399990066990066
          99006699006699006699C6D6EF3399990066663399CC66CCCC66CCCC66CCCC66
          CCCC66CCCC66CCCC66CCCC66CCCC66CCCC00999933666633666600669966CCCC
          66CCCC66CCCC66CCCC66CCCC66CCCC66CCCC66CCCC66CCCC66CCCC0066990066
          99D6E7E7008080006699006699006699008080008080FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF99CCCC006699006699008080006699339999D6E7E7006699006699
          5555559966006666336666336666336666336666336666336666336666336666
          3399660099660066663399660066663366663366663366663366663366663366
          6633666633666633996633666633006699008080C6D6EF339999008080008080
          0066990066996699CCFFFFFFFFFFFFFFFFFFFFFFFF3399990066990080800066
          996699CC99CCCC99CCCC008080006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633CC6600996600
          996600996600996600996600996600996600996600996600CC66006666330066
          99006699339999C6D6EF99CCCC006699008080008080008080FFFFFFFFFFFFFF
          FFFFFFFFFF33999900669900669999CCCC66CCCC00666699CCCC006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          00996600996633666633CC660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F0066990066996699CC336699339999C6D6EF
          006699008080008080FFFFFFFFFFFFFFFFFFFFFFFF33999900669900669999CC
          CC00669900669999CCCC006699006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633CC6600996600
          996600996600996600996600996600996600996600996600CC66005F5F5F0066
          990066996699CC33999900669999CCCC008080008080008080FFFFFFFFFFFFFF
          FFFFFFFFFF33999900669900669999CCCC00669900669999CCCC006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          0099660099663366663399660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F0066990066996699CC33999900808099CCCC
          008080008080008080FFFFFFFFFFFFFFFFFFFFFFFF33999900669900669999CC
          CC00669900669999CCCC006699006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633CC6600996600
          996600996600996600996600996600996600996600996600CC66005F5F5F0066
          990066996699CC33999900808099CCCC008080008080008080FFFFFFFFFFFFFF
          FFFFFFFFFF33999900669900669999CCCC00669900669999CCCC006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          0099660099663366663399660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F0066990066996699CC33999900808099CCCC
          008080008080008080FFFFFFFFFFFFFFFFFFFFFFFF33999900669900669999CC
          CC00669900669999CCCC006699006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633996600996600
          996600996600996600996600996600996600996600996600CC66005F5F5F0066
          990066996699CC33999900808099CCCC008080008080008080FFFFFFFFFFFFFF
          FFFFFFFFFF33999900669900808099CCCC00669900669999CCCC006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          0099660099663366663399660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F0066990066996699CC33999900808099CCCC
          006699008080008080FFFFFFFFFFFFFFFFFFFFFFFF339999006699008080C6D6
          EF00808000669999CCCC006699006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633996600996600
          996600996600996600996600996600996600996600996600CC66005F5F5F0066
          990066996699CC33999900808099CCCC339999006699006699FFFFFFFFFFFFFF
          FFFFFFFFFF339999006699C6D6EF99CCCC00808000669999CCCC006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          00996600996633666633CC660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F0066990066996699CC33999900808066CCCC
          F0FBFF008080006699FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99CC
          CC00808000669999CCCC006699006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633996600996600
          996600996600996600996600996600996600996600996600CC66005F5F5F0066
          990066996699CC3399990080806699CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF99CCCC00808000669999CCCC006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          00996600996633666633CC660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F0066990066996699CC3399990080806699CC
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99CC
          CC00808000669999CCCC006699006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633CC6600996600
          996600996600996600996600996600996600996600996600CC66005F5F5F0066
          990066996699CC3399990080806699CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF99CCCC00666600669999CCCC006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          00996600996633666633CC660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F0066990066996699CC3399990066666699CC
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF90A9AD006699006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633CC6600996600
          996600996600996600996600996600996600996600996600CC66005F5F5F0066
          99006699339999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF90A9AD006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          00996600996633666633CC660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F006699006699339999FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF90A9AD006699006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996600666633CC6600996600
          996600996600996600996600996600996600996600996600CC66005F5F5F0066
          99006699339999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF66CCCC006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          0099660099663366663399660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F006699008080339999FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF99CCCC339999339999336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633CC6600996600
          996600996600996600996600996600996600996600996600CC66005555553399
          993399996699CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          336666CC66009966009966009966009966009966009966009966009966009966
          00CC6600555555336666CC660099660099660099660099660099660099660099
          6600996600996600CC66004D4D4DD6E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF336666CC660099660099660099660099
          6600996600996600996600996600996600CC33003366993399CC993300996600
          996600996600996600996600996600996600996600996600CC66004D4D4DC6D6
          EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          336666CC3300CC6600CC6600CC6600CC6600CC6600CC6600CC6600CC6600CC33
          0033666699CCCCF0FBFF006666CC6600CC6600CC6600CC6600CC6600CC6600CC
          6600CC6600CC6600CC3300666633C6D6EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00666633666600666600666600666600
          666600666600666600666633666600666666CCCCFFFFFFFFFFFF99CCCC006699
          006666006666006666006666006666006666006666006666336666006666C6D6
          EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFD6E7E7D6E7E7D6E7E7D6E7E7D6E7E7D6E7E7D6E7E7
          D6E7E7D6E7E7D6E7E7F0FBFFFFFFFFFFFFFF}
        mmHeight = 8731
        mmLeft = 8996
        mmTop = 794
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label97'
        Caption = 'DERRAMA MAGISTERIAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4995
        mmLeft = 19579
        mmTop = 2381
        mmWidth = 51435
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label98'
        Caption = 'Sistema de Seguridad y Bienestar Social del Magisterio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 9260
        mmTop = 8996
        mmWidth = 82815
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label1'
        Caption = 'Apellidos y Nombres'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 9525
        mmTop = 23283
        mmWidth = 26035
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'Label2'
        Caption = 'DNI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 76729
        mmTop = 22490
        mmWidth = 4868
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'Label3'
        Caption = 'Importe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 94721
        mmTop = 22490
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel38: TppLabel
        UserName = 'Label4'
        Caption = 'En Soles'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 94721
        mmTop = 25400
        mmWidth = 11377
        BandType = 0
      end
      object ppLabel39: TppLabel
        UserName = 'Label5'
        Caption = 'N'#250'mero de cheque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 107421
        mmTop = 22490
        mmWidth = 24077
        BandType = 0
      end
      object ppLabel40: TppLabel
        UserName = 'ltitulo01'
        Caption = 'REPORTE PREVIO DE GENERACION DE OFICIO POR CHEQUES DE GERENCIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3810
        mmLeft = 29859
        mmTop = 13229
        mmWidth = 120058
        BandType = 0
      end
      object ppLabel41: TppLabel
        UserName = 'lfecha01'
        Caption = 'BENEFICIOS OTORGADOS DEL 22/08/2005 AL 22/08/2005'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3810
        mmLeft = 44715
        mmTop = 17198
        mmWidth = 87080
        BandType = 0
      end
      object ppLine13: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 9260
        mmTop = 28839
        mmWidth = 163777
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'Label6'
        Caption = 'DNI-RUC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 146579
        mmTop = 22490
        mmWidth = 11896
        BandType = 0
      end
      object ppLabel45: TppLabel
        UserName = 'Label45'
        Caption = 'de gerencia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 107421
        mmTop = 25400
        mmWidth = 14817
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object ppDBText9: TppDBText
        UserName = 'DBText1'
        DataField = 'PVSNOMBRE'
        DataPipeline = ppbdereporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppbdereporte'
        mmHeight = 3175
        mmLeft = 9525
        mmTop = 0
        mmWidth = 66411
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText2'
        DataField = 'PVSLDNIBEN'
        DataPipeline = ppbdereporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppbdereporte'
        mmHeight = 3175
        mmLeft = 76729
        mmTop = 0
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText3'
        DataField = 'PVSLMONTO'
        DataPipeline = ppbdereporte
        DisplayFormat = '#,###0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppbdereporte'
        mmHeight = 3175
        mmLeft = 91546
        mmTop = 0
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText4'
        DataField = 'NUMCHEGER'
        DataPipeline = ppbdereporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppbdereporte'
        mmHeight = 3175
        mmLeft = 107421
        mmTop = 0
        mmWidth = 24342
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText5'
        DataField = 'DNIRUC'
        DataPipeline = ppbdereporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppbdereporte'
        mmHeight = 3175
        mmLeft = 146579
        mmTop = 0
        mmWidth = 23283
        BandType = 4
      end
    end
    object ppSummaryBand4: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 8202
      mmPrintPosition = 0
      object ppDBCalc7: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'PVSLMONTO'
        DataPipeline = ppbdereporte
        DisplayFormat = '#,###0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppbdereporte'
        mmHeight = 3175
        mmLeft = 91546
        mmTop = 794
        mmWidth = 14552
        BandType = 7
      end
      object ppDBCalc8: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'PVSLMONTO'
        DataPipeline = ppbdereporte
        DisplayFormat = '#,###0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppbdereporte'
        mmHeight = 3175
        mmLeft = 91546
        mmTop = 4233
        mmWidth = 14552
        BandType = 7
      end
      object ppLine14: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 9260
        mmTop = 0
        mmWidth = 163777
        BandType = 7
      end
      object ppLine15: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 9260
        mmTop = 7938
        mmWidth = 163777
        BandType = 7
      end
      object ppLabel43: TppLabel
        UserName = 'Label7'
        Caption = 'Total Giros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 62442
        mmTop = 794
        mmWidth = 13758
        BandType = 7
      end
      object ppLabel44: TppLabel
        UserName = 'Label8'
        Caption = 'Total Monto Girado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 62442
        mmTop = 4233
        mmWidth = 24342
        BandType = 7
      end
    end
  end
  object pprDepCta: TppReport
    AutoStop = False
    DataPipeline = ppbdereporte
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
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 656
    Top = 72
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppbdereporte'
    object ppHeaderBand5: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 29633
      mmPrintPosition = 0
      object ppLabel46: TppLabel
        UserName = 'Label96'
        Caption = 'P'#225'gina N'#176' :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 151607
        mmTop = 2646
        mmWidth = 17463
        BandType = 0
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 171450
        mmTop = 2646
        mmWidth = 1852
        BandType = 0
      end
      object ppLine16: TppLine
        UserName = 'Line25'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 9260
        mmTop = 21431
        mmWidth = 163777
        BandType = 0
      end
      object ppImage5: TppImage
        UserName = 'Image4'
        MaintainAspectRatio = False
        Stretch = True
        Picture.Data = {
          07544269746D617086190000424D861900000000000036000000280000003000
          00002D000000010018000000000050190000C40E0000C40E0000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF6699CC0066660066990066990066990066990066
          990066990066993399CC00666600669900669900669900669900669900666633
          9999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          66990080800066990066990066990066990080803399996699CC006699006699
          006699006699006699008080006699FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3399990080800066990066990066990066
          990080803399996699CC006699006699006699006699006699008080008080FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6699CC00
          80800080800080800066990066990066990080803399996699CC006699006699
          006699006699006699006699006699339999FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF3399990066990080800066990080800080800066990066
          990080803399996699CC00669900669900669900669900669900669900669900
          6699006699F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99CCCC00669900669900669900
          66990066990066990066990066990066990080803399996699CC006699006699
          00669900669900669900669900669900669900808000669999CCCCFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          3399990066990080800066990066990066990066990066990066990066990066
          990080803399996699CC00669900808000669900669900669900669900669900
          6699006699008080006699006699F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF99CCCC00669900669900808000669900669900669900
          66990066990066990066990066990066990080803399996699CC006699006699
          0066990066990066990066990080800066990066990066990066990080800066
          9999CCCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99CCCC006666008080
          0066990066990066990066990066990066990066990066990080800066990080
          800080803399996699CC00669900669900669900808000808000669900669900
          669900669900669900669900669900808000669966CCCCFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFF0FBFF00669900808000808000669900808000808000808000808000
          80800080800066990066990080800066990080803399996699CC006699006699
          0080800080800066990080800080800080800080800080800080800080800066
          99008080006699C6D6EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF006699008080006699006699
          0080800066990080800066990080800066990066996699CC66CCCC0066990066
          990080803399996699CC0066990066990080806699CC99CCCC00808000669900
          6699006699006699008080006699006699006699008080006699FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF339999006699006699006699008080339999D6E7E799CCCC99CCCC99CCCC99
          CCCCC6D6EF99CCCC0066990080800066990080803399996699CC006699006699
          0080800066996699CCC6D6EF99CCCC99CCCC99CCCC99CCCCC6D6EF6699CC0066
          99006699006699006699008080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF99CCCC006699006699006699006699006699
          99CCCC0066990080800080800080800080800080800066990080800066990066
          990066996699CC99CCCC00808000669900669900808000669900808000808000
          808000808000808000669999CCCC0066990066990066990080800080806699CC
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6E7E70066
          9900808000669900669900808000669999CCCC00669900669900669900669900
          6699006699008080006699006699006699006699D6E7E7C6D6EF006699006699
          00808000669900669900669900669900669900669900669900669999CCCC0066
          9900808000669900808000669900669999CCCCFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF00669900808000669900669900808000669999CCCC
          C6D6EF6699CC3399996699CC6699CC6699CC6699CC6699CC6699CC6699CC3399
          99D6E7E73399CC006699F0FBFF6699CC3399996699CC6699CC6699CC6699CC66
          99CC6699CC3399996699CCC6D6EFC6D6EF006699008080006699006699008080
          006699F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3399990066990066
          99006699006699006699C6D6EF3399990066663399CC66CCCC66CCCC66CCCC66
          CCCC66CCCC66CCCC66CCCC66CCCC66CCCC00999933666633666600669966CCCC
          66CCCC66CCCC66CCCC66CCCC66CCCC66CCCC66CCCC66CCCC66CCCC0066990066
          99D6E7E7008080006699006699006699008080008080FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF99CCCC006699006699008080006699339999D6E7E7006699006699
          5555559966006666336666336666336666336666336666336666336666336666
          3399660099660066663399660066663366663366663366663366663366663366
          6633666633666633996633666633006699008080C6D6EF339999008080008080
          0066990066996699CCFFFFFFFFFFFFFFFFFFFFFFFF3399990066990080800066
          996699CC99CCCC99CCCC008080006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633CC6600996600
          996600996600996600996600996600996600996600996600CC66006666330066
          99006699339999C6D6EF99CCCC006699008080008080008080FFFFFFFFFFFFFF
          FFFFFFFFFF33999900669900669999CCCC66CCCC00666699CCCC006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          00996600996633666633CC660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F0066990066996699CC336699339999C6D6EF
          006699008080008080FFFFFFFFFFFFFFFFFFFFFFFF33999900669900669999CC
          CC00669900669999CCCC006699006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633CC6600996600
          996600996600996600996600996600996600996600996600CC66005F5F5F0066
          990066996699CC33999900669999CCCC008080008080008080FFFFFFFFFFFFFF
          FFFFFFFFFF33999900669900669999CCCC00669900669999CCCC006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          0099660099663366663399660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F0066990066996699CC33999900808099CCCC
          008080008080008080FFFFFFFFFFFFFFFFFFFFFFFF33999900669900669999CC
          CC00669900669999CCCC006699006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633CC6600996600
          996600996600996600996600996600996600996600996600CC66005F5F5F0066
          990066996699CC33999900808099CCCC008080008080008080FFFFFFFFFFFFFF
          FFFFFFFFFF33999900669900669999CCCC00669900669999CCCC006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          0099660099663366663399660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F0066990066996699CC33999900808099CCCC
          008080008080008080FFFFFFFFFFFFFFFFFFFFFFFF33999900669900669999CC
          CC00669900669999CCCC006699006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633996600996600
          996600996600996600996600996600996600996600996600CC66005F5F5F0066
          990066996699CC33999900808099CCCC008080008080008080FFFFFFFFFFFFFF
          FFFFFFFFFF33999900669900808099CCCC00669900669999CCCC006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          0099660099663366663399660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F0066990066996699CC33999900808099CCCC
          006699008080008080FFFFFFFFFFFFFFFFFFFFFFFF339999006699008080C6D6
          EF00808000669999CCCC006699006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633996600996600
          996600996600996600996600996600996600996600996600CC66005F5F5F0066
          990066996699CC33999900808099CCCC339999006699006699FFFFFFFFFFFFFF
          FFFFFFFFFF339999006699C6D6EF99CCCC00808000669999CCCC006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          00996600996633666633CC660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F0066990066996699CC33999900808066CCCC
          F0FBFF008080006699FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99CC
          CC00808000669999CCCC006699006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633996600996600
          996600996600996600996600996600996600996600996600CC66005F5F5F0066
          990066996699CC3399990080806699CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF99CCCC00808000669999CCCC006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          00996600996633666633CC660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F0066990066996699CC3399990080806699CC
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99CC
          CC00808000669999CCCC006699006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633CC6600996600
          996600996600996600996600996600996600996600996600CC66005F5F5F0066
          990066996699CC3399990080806699CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF99CCCC00666600669999CCCC006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          00996600996633666633CC660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F0066990066996699CC3399990066666699CC
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF90A9AD006699006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633CC6600996600
          996600996600996600996600996600996600996600996600CC66005F5F5F0066
          99006699339999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF90A9AD006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          00996600996633666633CC660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F006699006699339999FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF90A9AD006699006699336666CC660099660099660099660099
          6600996600996600996600996600996600996600996600666633CC6600996600
          996600996600996600996600996600996600996600996600CC66005F5F5F0066
          99006699339999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF66CCCC006699006699
          336666CC66009966009966009966009966009966009966009966009966009966
          0099660099663366663399660099660099660099660099660099660099660099
          6600996600996600CC66005F5F5F006699008080339999FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF99CCCC339999339999336666CC660099660099660099660099
          6600996600996600996600996600996600996600996633666633CC6600996600
          996600996600996600996600996600996600996600996600CC66005555553399
          993399996699CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          336666CC66009966009966009966009966009966009966009966009966009966
          00CC6600555555336666CC660099660099660099660099660099660099660099
          6600996600996600CC66004D4D4DD6E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF336666CC660099660099660099660099
          6600996600996600996600996600996600CC33003366993399CC993300996600
          996600996600996600996600996600996600996600996600CC66004D4D4DC6D6
          EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          336666CC3300CC6600CC6600CC6600CC6600CC6600CC6600CC6600CC6600CC33
          0033666699CCCCF0FBFF006666CC6600CC6600CC6600CC6600CC6600CC6600CC
          6600CC6600CC6600CC3300666633C6D6EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00666633666600666600666600666600
          666600666600666600666633666600666666CCCCFFFFFFFFFFFF99CCCC006699
          006666006666006666006666006666006666006666006666336666006666C6D6
          EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFD6E7E7D6E7E7D6E7E7D6E7E7D6E7E7D6E7E7D6E7E7
          D6E7E7D6E7E7D6E7E7F0FBFFFFFFFFFFFFFF}
        mmHeight = 8731
        mmLeft = 8996
        mmTop = 794
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel47: TppLabel
        UserName = 'Label97'
        Caption = 'DERRAMA MAGISTERIAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4995
        mmLeft = 19579
        mmTop = 2381
        mmWidth = 51435
        BandType = 0
      end
      object ppLabel48: TppLabel
        UserName = 'Label98'
        Caption = 'Sistema de Seguridad y Bienestar Social del Magisterio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 9260
        mmTop = 8996
        mmWidth = 82815
        BandType = 0
      end
      object ppLabel49: TppLabel
        UserName = 'Label1'
        Caption = 'Apellidos y Nombres'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 9525
        mmTop = 23283
        mmWidth = 26035
        BandType = 0
      end
      object ppLabel50: TppLabel
        UserName = 'Label2'
        Caption = 'DNI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 76729
        mmTop = 22490
        mmWidth = 4868
        BandType = 0
      end
      object ppLabel51: TppLabel
        UserName = 'Label3'
        Caption = 'Importe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 97102
        mmTop = 22490
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel52: TppLabel
        UserName = 'Label4'
        Caption = 'En Soles'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 97102
        mmTop = 25400
        mmWidth = 11377
        BandType = 0
      end
      object ppLabel53: TppLabel
        UserName = 'Label5'
        Caption = 'N'#250'mero de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 113771
        mmTop = 22490
        mmWidth = 14012
        BandType = 0
      end
      object ppLabel54: TppLabel
        UserName = 'ltitulo01'
        Caption = 'REPORTE PREVIO DE GENERACION DE OFICIO POR DEPOSITO EN CUENTA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3810
        mmLeft = 31263
        mmTop = 13229
        mmWidth = 117264
        BandType = 0
      end
      object ppLabel55: TppLabel
        UserName = 'lfecha01'
        Caption = 'BENEFICIOS OTORGADOS DEL 22/08/2005 AL 22/08/2005'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3810
        mmLeft = 44715
        mmTop = 17198
        mmWidth = 87080
        BandType = 0
      end
      object ppLine17: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 9260
        mmTop = 28839
        mmWidth = 163777
        BandType = 0
      end
      object ppLabel57: TppLabel
        UserName = 'Label45'
        Caption = 'Cta. Teleahorro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 113771
        mmTop = 25400
        mmWidth = 19643
        BandType = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object ppDBText19: TppDBText
        UserName = 'DBText1'
        DataField = 'PVSNOMBRE'
        DataPipeline = ppbdereporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppbdereporte'
        mmHeight = 3175
        mmLeft = 9525
        mmTop = 0
        mmWidth = 66411
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText2'
        DataField = 'PVSLDNIBEN'
        DataPipeline = ppbdereporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppbdereporte'
        mmHeight = 3175
        mmLeft = 76729
        mmTop = 0
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText3'
        DataField = 'PVSLMONTO'
        DataPipeline = ppbdereporte
        DisplayFormat = '#,###0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppbdereporte'
        mmHeight = 3175
        mmLeft = 93927
        mmTop = 0
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText4'
        DataField = 'PVSLNCTA'
        DataPipeline = ppbdereporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppbdereporte'
        mmHeight = 3175
        mmLeft = 113771
        mmTop = 0
        mmWidth = 24342
        BandType = 4
      end
    end
    object ppSummaryBand5: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 8202
      mmPrintPosition = 0
      object ppDBCalc9: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'PVSLMONTO'
        DataPipeline = ppbdereporte
        DisplayFormat = '#,###0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppbdereporte'
        mmHeight = 3175
        mmLeft = 93927
        mmTop = 794
        mmWidth = 14552
        BandType = 7
      end
      object ppDBCalc10: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'PVSLMONTO'
        DataPipeline = ppbdereporte
        DisplayFormat = '#,###0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppbdereporte'
        mmHeight = 3175
        mmLeft = 93927
        mmTop = 4233
        mmWidth = 14552
        BandType = 7
      end
      object ppLine18: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 9260
        mmTop = 0
        mmWidth = 163777
        BandType = 7
      end
      object ppLine19: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 9260
        mmTop = 7938
        mmWidth = 163777
        BandType = 7
      end
      object ppLabel58: TppLabel
        UserName = 'Label7'
        Caption = 'Total Giros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 62442
        mmTop = 794
        mmWidth = 13758
        BandType = 7
      end
      object ppLabel59: TppLabel
        UserName = 'Label8'
        Caption = 'Total Monto Girado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 62442
        mmTop = 4233
        mmWidth = 24342
        BandType = 7
      end
    end
  end
end
