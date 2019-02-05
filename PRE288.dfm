object fIndGestion: TfIndGestion
  Left = 230
  Top = 28
  BorderStyle = bsSingle
  Caption = 'Indicadores previsionales de calidad'
  ClientHeight = 666
  ClientWidth = 1080
  Color = 13165023
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object chkMosValor: TCheckBox
    Left = 369
    Top = 251
    Width = 94
    Height = 17
    Cursor = crHandPoint
    Caption = 'Mostrar Valores'
    TabOrder = 2
    Visible = False
  end
  object Panel2: TPanel
    Left = 0
    Top = 624
    Width = 1080
    Height = 42
    Align = alBottom
    TabOrder = 1
    object bitPrint: TSpeedButton
      Left = 754
      Top = 9
      Width = 93
      Height = 27
      Cursor = crHandPoint
      Hint = 'Imprimir Grafico'
      Caption = 'Imprimir'
      Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B0040000C40E0000C40E00000000000000000000ECEBEBEDEDED
        EDEEEEE9E9EADEDFDFD8D7D7DAD9DADCDBDCDCDBDCDCDBDCDEDCDEDEDCDEDDDD
        DDDADADBDBDADAD8D8D8EBEBEBEEEEEEEDECEDEBEBEBF0EDEDECEDEDF5F9FAD7
        D9DC989A9ABDBCBCB8B5B8B9B4B9B9B4B9B8B3B8B7B2B7B8B2B7B7B3B8B0B3B5
        AFB1B2B9BCB992948FFFFFFFF0EBF0ECEDEDEFEFEFF5F5F5E3E2E3CBCCCC8686
        86FFFFFFFDFEFFFEFFFFFEFFFFFEFEFFFDFEFFFDFEFFFDFEFFFDFFFFFFFFFFE5
        E6E47D7D79EEEAEAF4EEF4EFEFF0EFF1F1D8D8D6AEABA7CAC7C5BEBDBAFBFDFC
        F0F2F3F0F3F5F0F3F5F1F4F5F2F5F7F3F5F7F2F4F6EDF0F2FDFFFEDAD9D4BFC0
        B9ADA9A8D1CCCFF3F2F2EFF2F1B8B8B3B7B5A9D5CEC2B7B6ADDADBD9EAEDECDD
        E0DDE0E2E0DEE1E0DFE2DFDEE0DEDFDFDEE5E5E5F7F5F2AAACA4CFCAC5C8C4C2
        A79FA1F0EEEFEAEFEFA09F96B2AC9CC9C1B04A473D5D5E5B9192907775707A78
        7379777379777378777274726F898889898884030100C8C7BEB1ADA9938B8CE8
        E7E7E7ECEB97958BB8B09EC2B7A48380745F6362727372827D7C898584898784
        888583868381817D7D71727566666466665DB5B3AAB7AFAC928B89E1DFE1E4E2
        E7888A859F9F98A59F9CD3C4B6DFC8AAB9977FBB7F65836C3E90603B8E59569B
        6B3AB07864C9AD7ADAC7ADD7CFC8A3A69EA3A399908883DFDEDEE3DFE3969994
        E9ECE7F6F3F3F2E0D7B9A38497681AA25B00AA6D00B16D00AA6A00AA6E00A367
        00874E007A4C12F8F4D7F3F3E3DBE1D7939296DDDBDCE1DDE1A6A9A4EFF2ECED
        EAEAEDDDDAC4B69FEFC66ED6A83FD9862ECA8C1BC39408BF8A23B48C17C48928
        C08E4EFDF5D1E4E0C7E5EDDFA3AAADD9DADCE5E3E8A2A59FE1E3DCE6E2E3FBF0
        F0D5CDBCE0D3B8FFF8E4FFDFD4F0DFC2ECE1B9ECDCCDEDE4C8E5D4A8C4B08CFD
        F2DDA09E87CFD1C1A8A6A7E0DFE0ECEAEFA2A39DDFE1D8EDE7E9F0E9EDE2DBD2
        E4EDE7A0CAE6C1E9F8C7EBD8B8EDFAFFFFFFC2E0E4D8E3E1BABFC1DCD9D8DCDD
        CBDFE0CEA8A39EE7E5E6F0EEF6D7D8D19B9C91C7C5C6DDD9E0DFE0DCEBF8F1D7
        EDFB59B7A886C467336CCD691C17F4FBFCD5E1E3CFD3DBF1EAEEE8E4D6B4AFA6
        BEB7C0F1F1F3ECEAEFF7F8F4EAEBE5C1BEBFAFAFB49FA1A0F6F4F2D7E0E9CAFF
        F3B3C38E5C74E6AB3928FEEEF4F9FAFAB2AFB0AAA3A2B7B1ABDDDCD9F5F4FCED
        EEEFEEEDEDEDECEDF0EFF0F7F7F7F9F9F9CFCECEE7E3E3C6E7E3FAFFFFFFF6FF
        A1ABF4A2351AFDF1FAEBEDEDC2C3C2F7F7F7F6F6F8F0F1F1ECECEBECECEBEEEE
        EDEEEDEEECECECEEEEEEF1F1F1D0D0CFECE8E8CDE7DEF9FFFEFFF6EEFFFFFF9F
        3E0DFCEEEAECEFF0CACCCCE8E7E7EDEDEDECECECEDEDECEDEDECEEEEEEEEEEEE
        EEEEEEEBEBEBEEEEEECCCBCBE6E5E5CCE4E0F2FFFFFCF9F2FFFFFF743C24FFFE
        F3EBEDEEC8C8C8EDEDEDECECECECECECECECECECECECEEEEEEEEEEEEEEEEEEE5
        E5E5F4F4F4CFCFCEE5EAEAD1E6EBEEFBFFF3F8F9EEF2FDFFFFFFFCF9F7F1F2F2
        CBCBCBEFEFEFEDEDEDEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEAEAEAF4F3
        F3C8C9C8D1D0D2E7E9EFE7E6EBE7E5E9E6E5E1E0E1E5E8E7EBD5D4D5C7C7C7F1
        F1F1ECECECEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEAEAEB
        C9C2BFCFBDBCD2BFC1CABDBDCDC0AFB5BCC1C5BEC2C4C3C2E0E0E0F1F1F1ECEC
        ECEEEEEEEEEEEEEEEEEE}
      ParentShowHint = False
      ShowHint = True
      OnClick = bitPrintClick
    end
    object btnCerrar: TBitBtn
      Left = 854
      Top = 8
      Width = 93
      Height = 28
      Caption = 'Cerrar'
      TabOrder = 0
      OnClick = btnCerrarClick
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
    object btnAExcel: TBitBtn
      Left = 657
      Top = 9
      Width = 93
      Height = 27
      Caption = 'A Excel'
      TabOrder = 1
      OnClick = btnAExcelClick
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
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 73
    Width = 1080
    Height = 551
    ActivePage = tsTiempoPromedioLiquidacion
    Align = alClient
    TabOrder = 0
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = 'Tiempo promedio de atenci'#243'n de solicitudes de beneficio'
      object DBChart1: TDBChart
        Left = 0
        Top = 0
        Width = 1072
        Height = 523
        Cursor = crHandPoint
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        BackWall.Color = clWhite
        BottomWall.Brush.Color = clWhite
        BottomWall.Brush.Style = bsClear
        Gradient.Direction = gdBottomTop
        Gradient.EndColor = 16771780
        Gradient.Visible = True
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          '')
        BackColor = clWhite
        BottomAxis.LabelsAngle = 90
        BottomAxis.LabelsFont.Charset = ANSI_CHARSET
        BottomAxis.LabelsFont.Color = clBlack
        BottomAxis.LabelsFont.Height = -11
        BottomAxis.LabelsFont.Name = 'Arial'
        BottomAxis.LabelsFont.Style = [fsBold]
        LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -11
        LeftAxis.LabelsFont.Name = 'Arial'
        LeftAxis.LabelsFont.Style = [fsBold]
        Legend.Alignment = laBottom
        Legend.Font.Charset = DEFAULT_CHARSET
        Legend.Font.Color = clBlack
        Legend.Font.Height = -19
        Legend.Font.Name = 'Arial'
        Legend.Font.Style = [fsBold]
        Align = alClient
        Color = clWindow
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Solicitudes de beneficios con reproceso'
      ImageIndex = 1
      object DBChart2: TDBChart
        Left = 0
        Top = 0
        Width = 1072
        Height = 523
        Cursor = crHandPoint
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        BackWall.Color = clWhite
        BottomWall.Brush.Color = clWhite
        BottomWall.Brush.Style = bsClear
        Gradient.Direction = gdBottomTop
        Gradient.EndColor = 16771780
        Gradient.Visible = True
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          '')
        BackColor = clWhite
        BottomAxis.LabelsAngle = 90
        BottomAxis.LabelsFont.Charset = ANSI_CHARSET
        BottomAxis.LabelsFont.Color = clBlack
        BottomAxis.LabelsFont.Height = -11
        BottomAxis.LabelsFont.Name = 'Arial'
        BottomAxis.LabelsFont.Style = [fsBold]
        LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -11
        LeftAxis.LabelsFont.Name = 'Arial'
        LeftAxis.LabelsFont.Style = [fsBold]
        Legend.Alignment = laBottom
        Legend.Font.Charset = DEFAULT_CHARSET
        Legend.Font.Color = clBlack
        Legend.Font.Height = -13
        Legend.Font.Name = 'Arial'
        Legend.Font.Style = [fsBold]
        Align = alClient
        Color = clWindow
        TabOrder = 0
      end
    end
    object tsTiempoPromedioLiquidacion: TTabSheet
      Caption = 'Tiempo Promedio Liquidaciones'
      ImageIndex = 2
      object dtgExpeProXLS: TwwDBGrid
        Left = 472
        Top = 111
        Width = 377
        Height = 122
        Cursor = crHandPoint
        DisableThemesInTitle = False
        Selected.Strings = (
          'USUARIO'#9'12'#9'Usuario~De Gesti'#243'n'
          'FECHA'#9'10'#9'Fecha~De Gesti'#243'n'
          'HORA'#9'8'#9'Hora~De Gesti'#243'n'
          'DESCRIPCION'#9'16'#9'Tipo~De Gesti'#243'n'
          'DESCRIPCIONDET'#9'40'#9'Resultado~De Gesti'#243'n'
          'DETOBS'#9'30'#9'Gesti'#243'n Realizada'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = 16053492
        FixedCols = 0
        ShowHorzScrollBar = True
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter, dgFooter3DCells]
        ParentFont = False
        TabOrder = 2
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
      end
      object dtgTiempoPromedioLiquidacionXLS: TwwDBGrid
        Left = 376
        Top = 295
        Width = 377
        Height = 122
        Cursor = crHandPoint
        DisableThemesInTitle = False
        Selected.Strings = (
          'USUARIO'#9'12'#9'Usuario~De Gesti'#243'n'
          'FECHA'#9'10'#9'Fecha~De Gesti'#243'n'
          'HORA'#9'8'#9'Hora~De Gesti'#243'n'
          'DESCRIPCION'#9'16'#9'Tipo~De Gesti'#243'n'
          'DESCRIPCIONDET'#9'40'#9'Resultado~De Gesti'#243'n'
          'DETOBS'#9'30'#9'Gesti'#243'n Realizada'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = 16053492
        FixedCols = 0
        ShowHorzScrollBar = True
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter, dgFooter3DCells]
        ParentFont = False
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
      end
      object chrtTiempoPromedioLiquidacion: TDBChart
        Left = 0
        Top = 0
        Width = 1072
        Height = 523
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        PrintProportional = False
        Title.Text.Strings = (
          '')
        View3D = False
        Align = alClient
        TabOrder = 0
        OnDblClick = chrtTiempoPromedioLiquidacionDblClick
      end
    end
    object tsExpedienteProceso: TTabSheet
      Caption = 'Expedientes en Proceso'
      ImageIndex = 3
      object chrtTiempoExpPro: TDBChart
        Left = 0
        Top = 0
        Width = 1072
        Height = 523
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        PrintProportional = False
        Title.Text.Strings = (
          '')
        View3D = False
        Align = alClient
        TabOrder = 0
        OnDblClick = chrtTiempoExpProDblClick
      end
    end
    object tsReprocesosObservados: TTabSheet
      Caption = 'Expedientes c/reproceso Observados'
      ImageIndex = 4
      object chrtExpObs: TDBChart
        Left = 0
        Top = 0
        Width = 1072
        Height = 523
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        PrintProportional = False
        Title.Text.Strings = (
          '')
        LeftAxis.MinorTickLength = 9
        Legend.Alignment = laBottom
        Legend.ColorWidth = 15
        RightAxis.LabelsSeparation = 50
        View3D = False
        Align = alClient
        TabOrder = 0
        object pnlTotObs: TPanel
          Left = 1
          Top = 502
          Width = 1070
          Height = 20
          Align = alBottom
          TabOrder = 0
        end
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 1080
    Height = 73
    Align = alTop
    TabOrder = 3
    object btnMostrar: TSpeedButton
      Left = 966
      Top = 26
      Width = 75
      Height = 28
      Cursor = crHandPoint
      Hint = 'Mostrar'
      Caption = 'Mostrar'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33033333333333333F7F3333333333333000333333333333F777333333333333
        000333333333333F777333333333333000333333333333F77733333333333300
        033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
        33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
        3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
        33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
        333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
        333333773FF77333333333370007333333333333777333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Transparent = False
      OnClick = btnMostrarClick
    end
    object pnl02: TPanel
      Left = 110
      Top = 6
      Width = 826
      Height = 59
      BevelOuter = bvNone
      TabOrder = 1
      object lblTipBen: TLabel
        Left = 550
        Top = 5
        Width = 96
        Height = 13
        AutoSize = False
        Caption = 'Tipo de Beneficio'
      end
      object lblDepartamento: TLabel
        Left = 16
        Top = 5
        Width = 96
        Height = 13
        AutoSize = False
        Caption = 'Departamento'
      end
      object lblOficina: TLabel
        Left = 278
        Top = 5
        Width = 96
        Height = 13
        AutoSize = False
        Caption = 'Oficina'
      end
      object dbltipbenef: TwwDBLookupCombo
        Left = 552
        Top = 20
        Width = 46
        Height = 25
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -15
        Font.Name = 'Courier New'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TIPBENEF'#9'2'#9'C'#243'digo de~Beneficio'#9#9
          'BENEFDES'#9'20'#9'Tipo de~Beneficio'#9#9)
        LookupTable = DM1.cdsTipBenef
        LookupField = 'TIPBENEF'
        ParentFont = False
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnChange = dbltipbenefChange
      end
      object Panel16: TPanel
        Left = 598
        Top = 19
        Width = 184
        Height = 29
        Color = 13165023
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object metipbenef: TMaskEdit
          Left = 2
          Top = 2
          Width = 178
          Height = 24
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -15
          Font.Name = 'Courier New'
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 0
        end
      end
      object dblcdptoid: TwwDBLookupCombo
        Left = 17
        Top = 20
        Width = 51
        Height = 25
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -15
        Font.Name = 'Courier New'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DPTOID'#9'2'#9'C'#243'digo de~Departamento'#9#9
          'DPTODES'#9'20'#9'Descripci'#243'n'#9#9)
        LookupTable = DM1.cdsDpto
        LookupField = 'DPTOID'
        MaxLength = 2
        ParentFont = False
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnChange = dblcdptoidChange
      end
      object Panel13: TPanel
        Left = 69
        Top = 19
        Width = 189
        Height = 29
        Color = 13165023
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        object medptodes: TMaskEdit
          Left = 3
          Top = 2
          Width = 183
          Height = 24
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -15
          Font.Name = 'Courier New'
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 0
        end
      end
      object cbOficina: TwwDBLookupCombo
        Left = 279
        Top = 20
        Width = 53
        Height = 25
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -15
        Font.Name = 'Courier New'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        MaxLength = 2
        ParentFont = False
        TabOrder = 4
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnChange = cbOficinaChange
      end
      object Panel1: TPanel
        Left = 333
        Top = 19
        Width = 203
        Height = 27
        Color = 13165023
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        object edtOficina: TMaskEdit
          Left = 1
          Top = 1
          Width = 199
          Height = 25
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -15
          Font.Name = 'Courier New'
          Font.Style = []
          MaxLength = 65
          ParentFont = False
          TabOrder = 0
        end
      end
    end
    object pnl01: TPanel
      Left = 6
      Top = 5
      Width = 89
      Height = 52
      BevelOuter = bvNone
      TabOrder = 0
      object lblannio: TLabel
        Left = 14
        Top = 6
        Width = 27
        Height = 13
        AutoSize = False
        Caption = 'A'#241'o'
      end
      object dblAnnio: TwwDBLookupCombo
        Left = 12
        Top = 21
        Width = 66
        Height = 25
        Cursor = crHandPoint
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -15
        Font.Name = 'Courier New'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'A'#209'O'#9'4'#9'A'#209'O'#9'F')
        LookupTable = DM1.cdsAgencias
        LookupField = 'A'#209'O'
        Options = [loColLines, loRowLines]
        ParentFont = False
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnChange = dblAnnioChange
      end
    end
  end
  object rpGrafico: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 215900
    PrinterSetup.mmPaperWidth = 279401
    PrinterSetup.PaperSize = 1
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 808
    Top = 256
    Version = '7.02'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 171186
      mmPrintPosition = 0
      object Image001: TppImage
        UserName = 'Image001'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 157163
        mmLeft = 4233
        mmTop = 11113
        mmWidth = 259292
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
  end
end
