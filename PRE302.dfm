object Frephojcar: TFrephojcar
  Left = 200
  Top = 166
  BorderStyle = bsDialog
  Caption = 'Reporte de hojas de cargo'
  ClientHeight = 453
  ClientWidth = 841
  Color = 10207162
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object gbfecha: TGroupBox
    Left = 3
    Top = 2
    Width = 171
    Height = 66
    Caption = ' Fecha de Proceso '
    TabOrder = 0
    object Label1: TLabel
      Left = 4
      Top = 19
      Width = 63
      Height = 13
      Caption = 'Fecha Inicial:'
    end
    object Label2: TLabel
      Left = 4
      Top = 43
      Width = 61
      Height = 13
      Caption = 'Fecha Final :'
    end
    object dtpfecinicio: TwwDBDateTimePicker
      Left = 76
      Top = 15
      Width = 89
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 0
    end
    object dtpfecfinal: TwwDBDateTimePicker
      Left = 76
      Top = 39
      Width = 89
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 1
      OnChange = dtpfecfinalChange
    end
  end
  object gbdepofi: TGroupBox
    Left = 177
    Top = 2
    Width = 309
    Height = 66
    Caption = ' Oficina de origen '
    TabOrder = 1
    object Label4: TLabel
      Left = 4
      Top = 17
      Width = 70
      Height = 13
      Caption = 'Departamento:'
    end
    object Label6: TLabel
      Left = 4
      Top = 43
      Width = 36
      Height = 13
      Caption = 'Oficina:'
    end
    object dblcdptoid: TwwDBLookupCombo
      Left = 77
      Top = 14
      Width = 44
      Height = 21
      DropDownAlignment = taLeftJustify
      LookupTable = DM1.cdsDpto
      LookupField = 'DPTOID'
      MaxLength = 2
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcdptoidExit
    end
    object dblcdofid: TwwDBLookupCombo
      Left = 77
      Top = 39
      Width = 44
      Height = 21
      DropDownAlignment = taLeftJustify
      LookupTable = DM1.cdsOfDes
      LookupField = 'OFDESID'
      MaxLength = 2
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcdofidExit
    end
    object pnldesdpto: TPanel
      Left = 125
      Top = 14
      Width = 180
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
      object medesdpto: TMaskEdit
        Left = 1
        Top = 1
        Width = 177
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
    object Panel1: TPanel
      Left = 125
      Top = 39
      Width = 180
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
      object edtOficina: TMaskEdit
        Left = 1
        Top = 1
        Width = 177
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
  end
  object gbusuario: TGroupBox
    Left = 3
    Top = 73
    Width = 378
    Height = 46
    Caption = ' Usuario '
    TabOrder = 2
    object Label3: TLabel
      Left = 4
      Top = 19
      Width = 39
      Height = 13
      Caption = 'Usuario:'
    end
    object dblcdusuario: TwwDBLookupComboDlg
      Left = 50
      Top = 16
      Width = 86
      Height = 21
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      LookupTable = DM1.cdsUsuarios
      LookupField = 'USERID'
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnChange = dblcdusuarioChange
      OnExit = dblcdusuarioExit
    end
    object edtnomusu: TEdit
      Left = 141
      Top = 16
      Width = 231
      Height = 21
      Enabled = False
      TabOrder = 1
    end
  end
  object rgtipexp: TRadioGroup
    Left = 386
    Top = 73
    Width = 96
    Height = 46
    Caption = ' Tipo reporte '
    ItemIndex = 0
    Items.Strings = (
      'Detalle'
      'Resumen')
    TabOrder = 3
    OnClick = rgtipexpClick
  end
  object btnprocesar: TBitBtn
    Left = 499
    Top = 8
    Width = 78
    Height = 32
    Caption = 'Procesar'
    TabOrder = 4
    OnClick = btnprocesarClick
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
  object dbghojcar: TwwDBGrid
    Left = 3
    Top = 123
    Width = 830
    Height = 292
    DisableThemesInTitle = False
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = DM1.dsReporte
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter, dgFooter3DCells]
    TabOrder = 5
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = False
  end
  object btnimprimir: TBitBtn
    Left = 588
    Top = 420
    Width = 78
    Height = 28
    Caption = 'Imprimir'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Century Gothic'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    Visible = False
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
  object btnaexcel: TBitBtn
    Left = 672
    Top = 420
    Width = 78
    Height = 28
    Caption = 'A Excel'
    TabOrder = 7
    OnClick = btnaexcelClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00F00000000000
      000F2022222222222220208FFFFFFFFFFF20208FFFFFF888FF20208888888000
      8F20208000002F220F20208A2222F220FF20208FA22F220FFF20208FF2F2208F
      FF20208F2F220008FF202082F22022008F202087770FA220FF20208FFFFFFFFF
      FF2020888888888888202000000000000002F22222222222222F}
  end
  object btncerrar: TBitBtn
    Left = 756
    Top = 420
    Width = 78
    Height = 28
    Caption = 'Cerrar'
    TabOrder = 8
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
  object dbgAExcel: TDBGrid
    Left = 464
    Top = 415
    Width = 97
    Height = 33
    DataSource = DM1.dsReporte1
    TabOrder = 9
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
  end
end
