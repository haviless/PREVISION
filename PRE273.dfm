object fmstcueind: Tfmstcueind
  Left = 32
  Top = 191
  BorderStyle = bsDialog
  Caption = 'Resumen de cuenta individual'
  ClientHeight = 243
  ClientWidth = 704
  Color = 13165023
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
  object dbgcueind: TwwDBGrid
    Left = 8
    Top = 9
    Width = 689
    Height = 192
    DisableThemesInTitle = False
    PictureMasks.Strings = (
      'CAPACU'#9'###,###.00'#9'F'#9'F')
    Selected.Strings = (
      'ANO'#9'8'#9'A'#241'o~de aporte'
      'USENOM'#9'30'#9'Descripci'#243'n~de la UGEL'
      'MES'#9'12'#9'Mes de~Aporte'
      'APORTE'#9'9'#9'Aportes'
      'TOTACU'#9'9'#9'Total~Acumulado'
      'INTERES'#9'9'#9'Intereses~Acumulado'
      'BONUS'#9'9'#9'Bonus'
      'CAPACU'#9'9'#9'Capital~Acumulado'
      'DEVOLUC'#9'10'#9'Devoluciones')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = DM1.dsCueInd
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
  object btnimprime: TBitBtn
    Left = 545
    Top = 210
    Width = 73
    Height = 30
    Caption = 'Imprimir'
    TabOrder = 1
    OnClick = btnimprimeClick
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
  object btnSalir: TBitBtn
    Left = 624
    Top = 210
    Width = 73
    Height = 30
    Caption = 'Cerrar'
    TabOrder = 2
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
  object pprcueindres: TppReport
    AutoStop = False
    DataPipeline = ppBDEPipeline1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Data1'
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
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 478
    Top = 206
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppBDEPipeline1'
    object ppHeaderBand4: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 78846
      mmPrintPosition = 0
      object ppLine18: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 10319
        mmTop = 21167
        mmWidth = 177007
        BandType = 0
      end
      object ppSystemVariable10: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3810
        mmLeft = 162719
        mmTop = 4763
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel70: TppLabel
        UserName = 'Label1'
        Caption = 'Derrama Magisterial'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 7938
        mmTop = 795
        mmWidth = 30480
        BandType = 0
      end
      object ppLabel73: TppLabel
        UserName = 'Label17'
        Caption = 'Sistema de Previsi'#243'n Social'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 7938
        mmTop = 4763
        mmWidth = 42333
        BandType = 0
      end
      object ppLabel77: TppLabel
        UserName = 'Label18'
        Caption = 'Fecha  '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 146579
        mmTop = 794
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel80: TppLabel
        UserName = 'Label19'
        Caption = 'Hora    '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 146579
        mmTop = 4763
        mmWidth = 10848
        BandType = 0
      end
      object ppSystemVariable11: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3810
        mmLeft = 162719
        mmTop = 794
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel85: TppLabel
        UserName = 'Label401'
        AutoSize = False
        Caption = ': '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 159015
        mmTop = 4763
        mmWidth = 1323
        BandType = 0
      end
      object ppLabel89: TppLabel
        UserName = 'Label402'
        AutoSize = False
        Caption = ': '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 159015
        mmTop = 794
        mmWidth = 1323
        BandType = 0
      end
      object ppLabel96: TppLabel
        UserName = 'Label2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3810
        mmLeft = 46302
        mmTop = 15875
        mmWidth = 94954
        BandType = 0
      end
      object ppLabel102: TppLabel
        UserName = 'Label3'
        Caption = 'C'#243'digo Modular'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 10319
        mmTop = 21960
        mmWidth = 24257
        BandType = 0
      end
      object ppLabel103: TppLabel
        UserName = 'Label4'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 40481
        mmTop = 21960
        mmWidth = 1016
        BandType = 0
      end
      object pplasocodmod: TppLabel
        UserName = 'Label5'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3683
        mmLeft = 42598
        mmTop = 21960
        mmWidth = 23834
        BandType = 0
      end
      object pplasoapenomdni: TppLabel
        UserName = 'Label6'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3683
        mmLeft = 67998
        mmTop = 21960
        mmWidth = 96563
        BandType = 0
      end
      object ppLabel117: TppLabel
        UserName = 'Label7'
        Caption = 'UGEL.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 10319
        mmTop = 26194
        mmWidth = 9694
        BandType = 0
      end
      object ppLabel118: TppLabel
        UserName = 'Label8'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 40481
        mmTop = 26194
        mmWidth = 1016
        BandType = 0
      end
      object pplusenom: TppLabel
        UserName = 'Label9'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3683
        mmLeft = 42598
        mmTop = 26194
        mmWidth = 53975
        BandType = 0
      end
      object ppLabel122: TppLabel
        UserName = 'Label10'
        Caption = 'Unidad de Pago'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 99219
        mmTop = 26194
        mmWidth = 24088
        BandType = 0
      end
      object ppLabel123: TppLabel
        UserName = 'Label11'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 125148
        mmTop = 26194
        mmWidth = 1016
        BandType = 0
      end
      object pplupagonom: TppLabel
        UserName = 'Label12'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3683
        mmLeft = 127265
        mmTop = 26194
        mmWidth = 59817
        BandType = 0
      end
      object ppLabel125: TppLabel
        UserName = 'Label13'
        Caption = 'Unidad de Proceso'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 10319
        mmTop = 30427
        mmWidth = 28871
        BandType = 0
      end
      object ppLabel126: TppLabel
        UserName = 'Label14'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 40481
        mmTop = 30427
        mmWidth = 1016
        BandType = 0
      end
      object pplupronom: TppLabel
        UserName = 'Label15'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3683
        mmLeft = 42598
        mmTop = 30427
        mmWidth = 53975
        BandType = 0
      end
      object ppLabel128: TppLabel
        UserName = 'Label20'
        Caption = 'Reg. Pensi'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 98954
        mmTop = 30427
        mmWidth = 20193
        BandType = 0
      end
      object ppLabel129: TppLabel
        UserName = 'Label21'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 125148
        mmTop = 30427
        mmWidth = 1016
        BandType = 0
      end
      object pplregpendes: TppLabel
        UserName = 'Label22'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3683
        mmLeft = 127265
        mmTop = 30427
        mmWidth = 59817
        BandType = 0
      end
      object ppLabel131: TppLabel
        UserName = 'Label23'
        Caption = 'Nombramiento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 10319
        mmTop = 34660
        mmWidth = 22490
        BandType = 0
      end
      object ppLabel132: TppLabel
        UserName = 'Label27'
        Caption = 'Cese'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 98954
        mmTop = 34660
        mmWidth = 7620
        BandType = 0
      end
      object ppLabel133: TppLabel
        UserName = 'Label28'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 40481
        mmTop = 34660
        mmWidth = 1016
        BandType = 0
      end
      object ppLabel134: TppLabel
        UserName = 'Label29'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 125148
        mmTop = 34660
        mmWidth = 1016
        BandType = 0
      end
      object pplnumresnom: TppLabel
        UserName = 'Label24'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3683
        mmLeft = 42863
        mmTop = 34660
        mmWidth = 13758
        BandType = 0
      end
      object pplfecresnom: TppLabel
        UserName = 'Label25'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3683
        mmLeft = 59531
        mmTop = 34660
        mmWidth = 17738
        BandType = 0
      end
      object pplnumresces: TppLabel
        UserName = 'Label26'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 3683
        mmLeft = 127265
        mmTop = 34660
        mmWidth = 13758
        BandType = 0
      end
      object pplfecresces: TppLabel
        UserName = 'Label30'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 3683
        mmLeft = 145257
        mmTop = 34660
        mmWidth = 17738
        BandType = 0
      end
      object ppLine19: TppLine
        UserName = 'Line4'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 10319
        mmTop = 38894
        mmWidth = 177007
        BandType = 0
      end
      object ppLabel139: TppLabel
        UserName = 'Label31'
        Caption = 'A'#241'os aportados a 1996'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 10319
        mmTop = 39688
        mmWidth = 34883
        BandType = 0
      end
      object ppLabel140: TppLabel
        UserName = 'Label32'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 47096
        mmTop = 39688
        mmWidth = 1016
        BandType = 0
      end
      object pplanoapo: TppLabel
        UserName = 'Label33'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3683
        mmLeft = 50271
        mmTop = 39688
        mmWidth = 45508
        BandType = 0
      end
      object ppLabel142: TppLabel
        UserName = 'Label34'
        Caption = 'Capital Acumulado a Dic. de 1996'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 98425
        mmTop = 39688
        mmWidth = 50842
        BandType = 0
      end
      object ppLabel143: TppLabel
        UserName = 'Label35'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 152136
        mmTop = 39688
        mmWidth = 1058
        BandType = 0
      end
      object pplmonapo: TppLabel
        UserName = 'Label36'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3683
        mmLeft = 155840
        mmTop = 39688
        mmWidth = 18542
        BandType = 0
      end
      object ppLine20: TppLine
        UserName = 'Line5'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 10319
        mmTop = 43921
        mmWidth = 177007
        BandType = 0
      end
      object ppLabel145: TppLabel
        UserName = 'Label37'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 10319
        mmTop = 44979
        mmWidth = 56937
        BandType = 0
      end
      object ppLine21: TppLine
        UserName = 'Line6'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 10319
        mmTop = 49742
        mmWidth = 177007
        BandType = 0
      end
      object ppLabel158: TppLabel
        UserName = 'Label50'
        Caption = 'Pagina'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 146579
        mmTop = 8731
        mmWidth = 10456
        BandType = 0
      end
      object ppLabel159: TppLabel
        UserName = 'Label51'
        AutoSize = False
        Caption = ': '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 159015
        mmTop = 8731
        mmWidth = 1323
        BandType = 0
      end
      object ppSystemVariable12: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3810
        mmLeft = 162719
        mmTop = 8731
        mmWidth = 3175
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label16'
        Caption = 'A'#209'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 10319
        mmTop = 50536
        mmWidth = 10053
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label38'
        Caption = 'CAPITAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 46302
        mmTop = 50536
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label39'
        Caption = 'INICIAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 46302
        mmTop = 54504
        mmWidth = 11377
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label40'
        Caption = 'APORTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 71438
        mmTop = 50536
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label41'
        Caption = 'ACUMULADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 71438
        mmTop = 54504
        mmWidth = 20638
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label403'
        Caption = 'INTERES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 101600
        mmTop = 50536
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label42'
        Caption = 'ACUMULADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 101600
        mmTop = 54504
        mmWidth = 20638
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label43'
        Caption = 'BONUS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 135732
        mmTop = 50536
        mmWidth = 11377
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label44'
        Caption = 'ACUMULADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 135732
        mmTop = 54504
        mmWidth = 20638
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label45'
        Caption = 'TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 166952
        mmTop = 50536
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label46'
        Caption = 'ACUMULADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 166952
        mmTop = 54504
        mmWidth = 20638
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 10319
        mmTop = 58738
        mmWidth = 177007
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label47'
        Caption = 'Label47'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 45244
        mmTop = 59531
        mmWidth = 14816
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label48'
        Caption = 'Label48'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 77258
        mmTop = 59531
        mmWidth = 14816
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label49'
        Caption = 'Label49'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 107421
        mmTop = 59531
        mmWidth = 14816
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label52'
        Caption = 'Label52'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 141552
        mmTop = 59531
        mmWidth = 14816
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label53'
        Caption = 'Label53'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 172773
        mmTop = 59531
        mmWidth = 14816
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label54'
        Caption = 'Label54'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 10319
        mmTop = 59531
        mmWidth = 11388
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 10319
        mmTop = 64029
        mmWidth = 177007
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label55'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 10319
        mmTop = 64823
        mmWidth = 56896
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line7'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 10319
        mmTop = 69056
        mmWidth = 177007
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label56'
        Caption = 'PERIODO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3703
        mmLeft = 10319
        mmTop = 69850
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label57'
        Caption = 'CAPITAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 46302
        mmTop = 69850
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label58'
        Caption = 'ACUMULADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 46302
        mmTop = 73819
        mmWidth = 20638
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label59'
        Caption = 'INTERES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 101600
        mmTop = 69850
        mmWidth = 16140
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label60'
        Caption = 'BONUS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 135732
        mmTop = 69850
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label601'
        Caption = 'APORTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 71438
        mmTop = 69850
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label61'
        Caption = 'TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 166952
        mmTop = 69850
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label62'
        Caption = 'ACUMULADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 166952
        mmTop = 73819
        mmWidth = 20638
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line8'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 10319
        mmTop = 78052
        mmWidth = 177007
        BandType = 0
      end
    end
    object ppDetailBand8: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'ANOMES'
        DataPipeline = ppBDEPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 3704
        mmLeft = 10319
        mmTop = 0
        mmWidth = 33338
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'ACUMESANT'
        DataPipeline = ppBDEPipeline1
        DisplayFormat = '#,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 3704
        mmLeft = 45244
        mmTop = 0
        mmWidth = 14816
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'CAPITAL'
        DataPipeline = ppBDEPipeline1
        DisplayFormat = '#,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 3704
        mmLeft = 77258
        mmTop = 0
        mmWidth = 14816
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'INTCAPACU'
        DataPipeline = ppBDEPipeline1
        DisplayFormat = '#,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 3704
        mmLeft = 107421
        mmTop = 0
        mmWidth = 14816
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'BONOS'
        DataPipeline = ppBDEPipeline1
        DisplayFormat = '#,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 3704
        mmLeft = 141552
        mmTop = 0
        mmWidth = 14816
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'ACUMULADO'
        DataPipeline = ppBDEPipeline1
        DisplayFormat = '#,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 3704
        mmLeft = 172773
        mmTop = 0
        mmWidth = 14816
        BandType = 4
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppLine5: TppLine
        UserName = 'Line9'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 10319
        mmTop = 0
        mmWidth = 177007
        BandType = 7
      end
      object ppLabel27: TppLabel
        UserName = 'Label63'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3979
        mmLeft = 10319
        mmTop = 794
        mmWidth = 128059
        BandType = 7
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppdbRepLiqxFallec: TppDBPipeline
    DataSource = DM1.dsReporte
    UserName = 'dbRepLiqxFallec'
    Left = 33
    Top = 488
  end
  object ppBDEPipeline1: TppBDEPipeline
    DataSource = DM1.dsQry22
    UserName = 'BDEPipeline1'
    Left = 440
    Top = 208
  end
end
