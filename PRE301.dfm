object FContaExtorno: TFContaExtorno
  Left = 297
  Top = 85
  Width = 780
  Height = 614
  Caption = 'Contabilizaci'#243'n de Extornos'
  Color = 10207162
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCabecera: TPanel
    Left = 4
    Top = 6
    Width = 756
    Height = 567
    BevelOuter = bvNone
    BorderWidth = 1
    Color = 10207162
    TabOrder = 0
    object TLabel
      Left = 10
      Top = 0
      Width = 80
      Height = 27
      Caption = 'Extornos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 677
      Top = 5
      Width = 25
      Height = 13
      Caption = 'V.2.0'
    end
    object Panel1: TPanel
      Left = 1
      Top = 33
      Width = 751
      Height = 528
      BevelOuter = bvNone
      Color = 13165023
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object GroupBox1: TGroupBox
        Left = 229
        Top = 8
        Width = 265
        Height = 73
        Caption = 'Rango de Fechas'
        Enabled = False
        TabOrder = 0
        object TLabel
          Left = 38
          Top = 21
          Width = 31
          Height = 15
          Caption = 'Desde'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
        object TLabel
          Left = 162
          Top = 21
          Width = 29
          Height = 15
          Caption = 'Hasta'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
        object dtpFecIni: TwwDBDateTimePicker
          Left = 19
          Top = 40
          Width = 100
          Height = 23
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          Epoch = 1950
          ShowButton = True
          TabOrder = 0
        end
        object dtpFecFin: TwwDBDateTimePicker
          Left = 142
          Top = 40
          Width = 100
          Height = 23
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          Epoch = 1950
          ShowButton = True
          TabOrder = 1
        end
      end
      object GroupBox2: TGroupBox
        Left = 24
        Top = 16
        Width = 130
        Height = 59
        Caption = 'Periodo'
        TabOrder = 1
        object TLabel
          Left = 74
          Top = 15
          Width = 21
          Height = 15
          Caption = 'Mes'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
        object TLabel
          Left = 20
          Top = 15
          Width = 20
          Height = 15
          Caption = 'A'#241'o'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
        object dbseMes: TwwDBSpinEdit
          Left = 73
          Top = 28
          Width = 34
          Height = 21
          Increment = 1.000000000000000000
          MaxValue = 12.000000000000000000
          MinValue = 1.000000000000000000
          Value = 9.000000000000000000
          AutoFillDate = False
          AutoSelect = False
          AutoSize = False
          BorderStyle = bsNone
          Color = 10207162
          Frame.Enabled = True
          Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
          LimitEditRect = True
          MaxLength = 2
          TabOrder = 0
          UnboundDataType = wwDefault
          OnExit = dbseMesExit
        end
        object dbseAno: TwwDBSpinEdit
          Left = 18
          Top = 28
          Width = 51
          Height = 21
          Increment = 1.000000000000000000
          MaxValue = 2060.000000000000000000
          MinValue = 2003.000000000000000000
          Value = 2004.000000000000000000
          AutoFillDate = False
          AutoSelect = False
          AutoSize = False
          BorderStyle = bsNone
          Color = 10207162
          Frame.Enabled = True
          Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
          LimitEditRect = True
          MaxLength = 4
          TabOrder = 1
          UnboundDataType = wwDefault
        end
      end
      object PageControl1: TPageControl
        Left = 5
        Top = 88
        Width = 738
        Height = 425
        ActivePage = TabSheet1
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object TabSheet1: TTabSheet
          Caption = 'Extorno de Beneficios'
          object TLabel
            Left = 7
            Top = -1
            Width = 74
            Height = 15
            Caption = 'Tipo de Diario'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
          end
          object TLabel
            Left = 253
            Top = -3
            Width = 82
            Height = 17
            Caption = 'Fecha Contable'
            Visible = False
          end
          object TLabel
            Left = 361
            Top = -3
            Width = 110
            Height = 17
            Caption = 'Comprobante Inicial'
            Visible = False
          end
          object fcShapeBtn3: TfcShapeBtn
            Left = 249
            Top = 356
            Width = 32
            Height = 31
            Hint = 'Genera Numero de Comprobante'
            Color = 13165023
            DitherColor = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -8
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
              003337777777777777F330FFFFFFFFFFF03337F33F333F3337F330FF0FFF0FFF
              F03337F37F337F3337F330FF0FFF0FFFF03337F37FFF7FFF37F330F00000000F
              F03337F77777777337F330FFF0FFF0FFF03337F337F337F337F330FFF0FFF0FF
              F03337F337FFF7FFF7F330FF00000000F03337F37777777737F330FFFF0FFF0F
              F03337F3337F337F37F330FFFF0FFF0FF03337F33373337337F330FFFFFFFFFF
              F03337F33333333FF7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
              F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
              333337FFFFFFFF77333330000000000333333777777777733333}
            NumGlyphs = 2
            Options = [boFocusable]
            ParentClipping = True
            ParentFont = False
            ParentShowHint = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            Shape = bsRoundRect
            ShowHint = True
            TabOrder = 0
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.VAlignment = vaVCenter
            Visible = False
          end
          object fcShapeBtn6: TfcShapeBtn
            Left = 289
            Top = 356
            Width = 32
            Height = 31
            Hint = 'Contabilizar Filiales'
            Color = 13165023
            DitherColor = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -8
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
              FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
              FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
              FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
              FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
              FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
              C8807FF7777777777FF700000000000000007777777777777777333333333333
              3333333333333333333333333333333333333333333333333333}
            NumGlyphs = 2
            Options = [boFocusable]
            ParentClipping = True
            ParentFont = False
            ParentShowHint = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            Shape = bsRoundRect
            ShowHint = True
            TabOrder = 1
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.VAlignment = vaVCenter
            Visible = False
          end
          object fcShapeBtn4: TfcShapeBtn
            Left = 417
            Top = 356
            Width = 32
            Height = 31
            Hint = 'Contabilizar Extornos'
            Color = 13165023
            DitherColor = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -8
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
              FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
              FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
              FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
              FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
              FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
              C8807FF7777777777FF700000000000000007777777777777777333333333333
              3333333333333333333333333333333333333333333333333333}
            NumGlyphs = 2
            Options = [boFocusable]
            ParentClipping = True
            ParentFont = False
            ParentShowHint = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            Shape = bsRoundRect
            ShowHint = True
            TabOrder = 2
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.VAlignment = vaVCenter
            OnClick = fcShapeBtn4Click
          end
          object fcShapeBtn7: TfcShapeBtn
            Left = 457
            Top = 356
            Width = 32
            Height = 31
            Hint = 'Impresi'#243'n Contabilizaci'#243'n Preliminar'
            Color = 13165023
            DitherColor = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -8
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333330000000
              00003333377777777777333330FFFFFFFFF03FF3F7FFFF33FFF7003000000FF0
              00F077F7777773F77737E00FBFBFB0FFFFF07773333FF7FF33F7E0FBFB00000F
              F0F077F333777773F737E0BFBFBFBFB0FFF077F3333FFFF733F7E0FBFB00000F
              F0F077F333777773F737E0BFBFBFBFB0FFF077F33FFFFFF733F7E0FB0000000F
              F0F077FF777777733737000FB0FFFFFFFFF07773F7F333333337333000FFFFFF
              FFF0333777F3FFF33FF7333330F000FF0000333337F777337777333330FFFFFF
              0FF0333337FFFFFF7F37333330CCCCCC0F033333377777777F73333330FFFFFF
              0033333337FFFFFF773333333000000003333333377777777333}
            NumGlyphs = 2
            Options = [boFocusable]
            ParentClipping = True
            ParentFont = False
            ParentShowHint = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            Shape = bsRoundRect
            ShowHint = True
            TabOrder = 3
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.VAlignment = vaVCenter
            OnClick = fcShapeBtn7Click
          end
          object fcShpDevoTrans: TfcShapeBtn
            Left = 521
            Top = 356
            Width = 32
            Height = 31
            Hint = 'Transferir Asientos Contables'
            Color = 13165023
            DitherColor = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -8
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
              33333333373F33333333333330B03333333333337F7F33333333333330F03333
              333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
              333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
              333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
              3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
              33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
              33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
              03333337777777F7F33333330000000003333337777777773333}
            NumGlyphs = 2
            Options = [boFocusable]
            ParentClipping = True
            ParentFont = False
            ParentShowHint = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            Shape = bsRoundRect
            ShowHint = True
            TabOrder = 4
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.VAlignment = vaVCenter
            OnClick = fcShpDevoTransClick
          end
          object fcShapeBtn5: TfcShapeBtn
            Left = 561
            Top = 356
            Width = 32
            Height = 31
            Hint = 'Impresi'#243'n Contabilizaci'#243'n '
            Color = 13165023
            DitherColor = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -8
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333330000000
              00003333377777777777333330FFFFFFFFF03FF3F7FFFF33FFF7003000000FF0
              00F077F7777773F77737E00FBFBFB0FFFFF07773333FF7FF33F7E0FBFB00000F
              F0F077F333777773F737E0BFBFBFBFB0FFF077F3333FFFF733F7E0FBFB00000F
              F0F077F333777773F737E0BFBFBFBFB0FFF077F33FFFFFF733F7E0FB0000000F
              F0F077FF777777733737000FB0FFFFFFFFF07773F7F333333337333000FFFFFF
              FFF0333777F3FFF33FF7333330F000FF0000333337F777337777333330FFFFFF
              0FF0333337FFFFFF7F37333330CCCCCC0F033333377777777F73333330FFFFFF
              0033333337FFFFFF773333333000000003333333377777777333}
            NumGlyphs = 2
            Options = [boFocusable]
            ParentClipping = True
            ParentFont = False
            ParentShowHint = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            Shape = bsRoundRect
            ShowHint = True
            TabOrder = 5
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.VAlignment = vaVCenter
            OnClick = fcShapeBtn5Click
          end
          object fcShapeBtn2: TfcShapeBtn
            Left = 628
            Top = 356
            Width = 32
            Height = 31
            Hint = 'Salir'
            Color = 13165023
            DitherColor = clWhite
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              04000000000068010000CE0E0000D80E00001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              333333333333333333333333000033911833333333333333333F333333333333
              0000339111833333911333333388F333333F3333000033911118333911118333
              38F38F333F88F33300003339111183911111833338F338F3F8338F3300003333
              911118111118333338F3338F833338F3000033333911111111833333338F3338
              3333F8330000333333911111183333333338F333333F83330000333333311111
              8333333333338F3333383333000033333339111183333333333338F333833333
              00003333339111118333333333333833338F3333000033333911181118333333
              33338333338F333300003333911183911183333333383338F338F33300003339
              1118333911183333338F33838F338F33000033911183333391118333338FF833
              38F338F300003391183333333911133333388333338FFF830000333913333333
              3391833333333333333888330000333333333333333333333333333333333333
              0000}
            NumGlyphs = 2
            Options = [boFocusable]
            ParentClipping = True
            ParentShowHint = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            Shape = bsRoundRect
            ShowHint = True
            TabOrder = 6
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.VAlignment = vaVCenter
            OnClick = fcShapeBtn2Click
          end
          object dbgConta: TwwDBGrid
            Left = 2
            Top = 38
            Width = 724
            Height = 301
            DisableThemesInTitle = False
            Selected.Strings = (
              'TIPO'#9'5'#9'Tipo'#9'F'
              'FECEXT'#9'12'#9'Fecha~Extorno'#9'F'
              'LIQUIDACION'#9'14'#9'Liquidaci'#243'n'#9'F'
              'PVSLNOFC'#9'10'#9'Oficio'#9'F'
              'TIPDESEDES'#9'20'#9'Tipo~Desembolso'#9'F'
              'MONTO_OTO'#9'13'#9'Monto~Liquidado'#9'F'
              'MONTO_GIR'#9'13'#9'Monto~Desembolsado'#9'F'
              'REGISTROS'#9'10'#9'Registros'#9'F'
              'COMPROBANTE'#9'12'#9'Comprobante'#9'F')
            MemoAttributes = [mSizeable, mWordWrap, mGridShow]
            IniAttributes.Delimiter = ';;'
            TitleColor = 10207162
            FixedCols = 0
            ShowHorzScrollBar = True
            BorderStyle = bsNone
            Color = 13165023
            DataSource = DM1.dsQry2
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            KeyOptions = [dgEnterToTab, dgAllowDelete]
            MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect, dgShowFooter]
            ParentFont = False
            TabOrder = 7
            TitleAlignment = taCenter
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -11
            TitleFont.Name = 'Comic Sans MS'
            TitleFont.Style = []
            TitleLines = 2
            TitleButtons = False
            UseTFields = False
            FooterColor = 10207162
            FooterCellColor = 13165023
            object wwIButton2: TwwIButton
              Left = 0
              Top = 0
              Width = 28
              Height = 28
              AllowAllUp = True
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000130B0000130B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                33333333FF33333333FF333993333333300033377F3333333777333993333333
                300033F77FFF3333377739999993333333333777777F3333333F399999933333
                33003777777333333377333993333333330033377F3333333377333993333333
                3333333773333333333F333333333333330033333333F33333773333333C3333
                330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
                993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
                333333333337733333FF3333333C333330003333333733333777333333333333
                3000333333333333377733333333333333333333333333333333}
              NumGlyphs = 2
            end
          end
          object dblcTipo: TwwDBLookupCombo
            Left = 7
            Top = 14
            Width = 45
            Height = 23
            BorderStyle = bsNone
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'CONTNUM'#9'9'#9'ID'#9'F'
              'CONTACTO'#9'20'#9'Contacto'#9'F')
            LookupField = 'CONTNUM'
            Options = [loColLines, loTitles]
            Color = 13165023
            Enabled = False
            Frame.Enabled = True
            Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
            TabOrder = 8
            AutoDropDown = False
            ShowButton = True
            PreciseEditRegion = False
            AllowClearKey = False
          end
          object dbeTipo: TwwDBEdit
            Left = 56
            Top = 14
            Width = 186
            Height = 23
            BorderStyle = bsNone
            Color = 13165023
            DataField = 'VENDEDABR'
            Enabled = False
            Frame.Enabled = True
            Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
            TabOrder = 9
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dtpFComp: TwwDBDateTimePicker
            Left = 252
            Top = 14
            Width = 100
            Height = 23
            BorderStyle = bsNone
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            Color = 13165023
            Epoch = 1950
            Frame.Enabled = True
            Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
            Enabled = False
            ReadOnly = True
            ShowButton = True
            TabOrder = 10
            Visible = False
          end
          object dbeComprob: TwwDBEdit
            Left = 362
            Top = 14
            Width = 90
            Height = 23
            BorderStyle = bsNone
            Color = 13165023
            Frame.Enabled = True
            Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
            MaxLength = 10
            Picture.PictureMask = '[#][#][#][#][#][#][#][#][#][#]'
            TabOrder = 11
            UnboundDataType = wwDefault
            Visible = False
            WantReturns = False
            WordWrap = False
          end
          object fcShapeBtn1: TfcShapeBtn
            Left = 377
            Top = 354
            Width = 32
            Height = 33
            Hint = 'Filtrar Refinanciacion del Periodo'
            Color = 13165023
            DitherColor = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -8
            Font.Name = 'Comic Sans MS'
            Font.Style = []
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
            ParentFont = False
            ParentShowHint = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            Shape = bsRoundRect
            ShowHint = True
            TabOrder = 12
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.VAlignment = vaVCenter
            OnClick = fcShapeBtn1Click
          end
          object prbAvance: TProgressBar
            Left = 11
            Top = 359
            Width = 212
            Height = 24
            TabOrder = 13
            Visible = False
          end
        end
      end
    end
  end
  object ppdb1: TppDBPipeline
    UserName = 'db1'
    Left = 534
    Top = 63
  end
  object ppD2: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = ppr2
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 565
    Top = 64
  end
  object ppr2: TppReport
    AutoStop = False
    DataPipeline = ppdb1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279000
    PrinterSetup.mmPaperWidth = 216000
    PrinterSetup.PaperSize = 123
    Template.FileName = 
      'C:\Documents and Settings\rmedina\Escritorio\COBRANZA_ULTIMO\Ult' +
      'imo CLiente\HPP_201113_COB\SRC_201113_COB\ContaExcFSC.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 606
    Top = 63
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdb1'
    object ppHeaderBand7: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 30163
      mmPrintPosition = 0
      object ppDBText99: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'CNTANOMM'
        DataPipeline = ppdb1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 4022
        mmLeft = 103452
        mmTop = 15610
        mmWidth = 11684
        BandType = 0
      end
      object ppLabel60: TppLabel
        UserName = 'Label3'
        Caption = 'Perido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 91281
        mmTop = 15610
        mmWidth = 10118
        BandType = 0
      end
      object ppLabel61: TppLabel
        UserName = 'Label4'
        Caption = 'Reporte Contable Devoluciones de Excesos del FSC'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 70644
        mmTop = 10848
        mmWidth = 67998
        BandType = 0
      end
      object ppLine79: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 794
        mmTop = 20902
        mmWidth = 201084
        BandType = 0
      end
      object ppLine80: TppLine
        UserName = 'Line4'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 794
        mmTop = 28310
        mmWidth = 201084
        BandType = 0
      end
      object ppLabel62: TppLabel
        UserName = 'Label5'
        Caption = 'Sistema de Cobranzas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 2910
        mmTop = 15875
        mmWidth = 28702
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label6'
        Caption = 'Cia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 22754
        mmWidth = 5027
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label7'
        Caption = 'TD'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 6879
        mmTop = 22754
        mmWidth = 4191
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label8'
        Caption = 'Comprobante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 12171
        mmTop = 22754
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label9'
        Caption = 'Glosa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 49742
        mmTop = 22754
        mmWidth = 8340
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label10'
        Caption = 'Fecha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 85990
        mmTop = 23019
        mmWidth = 8890
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label101'
        Caption = 'Cuenta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 102394
        mmTop = 23019
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label11'
        Caption = 'Debe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 166688
        mmTop = 23283
        mmWidth = 7620
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label12'
        Caption = 'Haber'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 191294
        mmTop = 23283
        mmWidth = 9260
        BandType = 0
      end
      object ppImage3: TppImage
        UserName = 'Image3'
        MaintainAspectRatio = False
        ShiftWithParent = True
        Stretch = True
        Picture.Data = {
          0A544A504547496D616765451C0000FFD8FFE000104A46494600010101006000
          600000FFE100164578696600004D4D002A00000008000000000000FFEC001144
          75636B7900010004000000640000FFE10380687474703A2F2F6E732E61646F62
          652E636F6D2F7861702F312E302F003C3F787061636B657420626567696E3D22
          EFBBBF222069643D2257354D304D7043656869487A7265537A4E54637A6B6339
          64223F3E0D0A3C783A786D706D65746120786D6C6E733A783D2261646F62653A
          6E733A6D6574612F2220783A786D70746B3D2241646F626520584D5020436F72
          6520352E332D633031312036362E3134353636312C20323031322F30322F3036
          2D31343A35363A32372020202020202020223E0D0A093C7264663A5244462078
          6D6C6E733A7264663D22687474703A2F2F7777772E77332E6F72672F31393939
          2F30322F32322D7264662D73796E7461782D6E7323223E0D0A09093C7264663A
          4465736372697074696F6E207264663A61626F75743D222220786D6C6E733A78
          6D704D4D3D22687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E
          302F6D6D2F2220786D6C6E733A73745265663D22687474703A2F2F6E732E6164
          6F62652E636F6D2F7861702F312E302F73547970652F5265736F757263655265
          66232220786D6C6E733A786D703D22687474703A2F2F6E732E61646F62652E63
          6F6D2F7861702F312E302F2220786D704D4D3A4F726967696E616C446F63756D
          656E7449443D22786D702E6469643A3838424232313941384536394533313139
          3530364335414333303344354330382220786D704D4D3A446F63756D656E7449
          443D22786D702E6469643A344245303343444136393938313145333832354638
          46314639373642313741362220786D704D4D3A496E7374616E636549443D2278
          6D702E6969643A34424530334344393639393831314533383235463846314639
          373642313741362220786D703A43726561746F72546F6F6C3D2241646F626520
          50686F746F73686F7020435336202857696E646F777329223E0D0A0909093C78
          6D704D4D3A4465726976656446726F6D2073745265663A696E7374616E636549
          443D22786D702E6969643A384642423231394138453639453331313935303643
          3541433330334435433038222073745265663A646F63756D656E7449443D2278
          6D702E6469643A38384242323139413845363945333131393530364335414333
          30334435433038222F3E0D0A09093C2F7264663A4465736372697074696F6E3E
          0D0A093C2F7264663A5244463E0D0A3C2F783A786D706D6574613E0D0A3C3F78
          7061636B657420656E643D2777273F3EFFDB0043000201010201010202020202
          020202030503030303030604040305070607070706070708090B0908080A0807
          070A0D0A0A0B0C0C0C0C07090E0F0D0C0E0B0C0C0CFFDB004301020202030303
          060303060C0807080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC000110800
          2A010403012200021101031101FFC4001F000001050101010101010000000000
          0000000102030405060708090A0BFFC400B51000020103030204030505040400
          00017D01020300041105122131410613516107227114328191A1082342B1C115
          52D1F02433627282090A161718191A25262728292A3435363738393A43444546
          4748494A535455565758595A636465666768696A737475767778797A83848586
          8788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2
          C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5
          F6F7F8F9FAFFC4001F0100030101010101010101010000000000000102030405
          060708090A0BFFC400B511000201020404030407050404000102770001020311
          04052131061241510761711322328108144291A1B1C109233352F0156272D10A
          162434E125F11718191A262728292A35363738393A434445464748494A535455
          565758595A636465666768696A737475767778797A82838485868788898A9293
          9495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8
          C9CAD2D3D4D5D6D7D8D9DAE2E3E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA00
          0C03010002110311003F00F9ABFE0E1FFF0082967C41FDA93F6E5F1EFC396D73
          52D2BE1B7C36D626D02C341B79DA3B6BA9ED98C535DDC2A902691A557D858109
          1ED0A012ECFF009DC667ECCFF9D7D01FF0563FF949E7ED05FF0065075BFF00D2
          D96B4F4AFF00823CFED39AD7C0D1F11ED3E0BF8CE5F0A3DA7DBD26F2231792DB
          1008992CCB7DA9E32A7707588A95F987CBCD4DF503E6CF35F19DEDF9D2F9ADFD
          F7AFB4BF6A2FF82737883E2FFED73E16F017C01F86FA8EAF737BF0D7C31E22BD
          B2D3D99A2864BAD26DA6B8BA9A699F642AF34A725DD53738031902BCCFC3DFF0
          49AFDA3BC53F1FB53F85D65F087C5CDE36D16DD6F2F6CA5863860B6B762C1276
          BA765B7F29CAB849049B1CA90A5882286070DFB277ED8FF11BF623F8B9A778DB
          E1B789B51F0FEB1612A3C91C5337D97518C364C17310216685B1CA37D460E08F
          EC6BF663F8D317ED1FFB38F807E214366DA745E38F0F586BCB68CFBCDAFDA6DD
          26F2F7606EDBBF19C0CE2BF8C5F8E7F00FC67FB32FC4CD4BC1BE3EF0DEADE13F
          13E9440B9D3F5084C52A06195707A3A30C15752558104120D7F5F5FF0004B1FF
          009468FECFFF00F64F342FFD20868881EF545799FED23FB647C2BFD90345B3D4
          3E27F8FF00C2DE08B7D498A598D56F9219AF0A901BCA8FEFC81772EE2AA42E46
          715F9B9FF0516FF82B37C42F0C7FC1537F657F0CFC18F89DA45EFC1CF8B0DA3F
          DB9B4CB5B1D4AD357136B525ADC05B868DDD4F96A10847528C0F46CD55C0FD6F
          A2BCA7F690FDB83E107EC7E2C47C4EF88FE12F04CDA902F696FA9EA0915CDCA0
          382E9172EC80F0582E01EA6B6744FDA8FE1BF897E095C7C4AD3BC79E13D43E1F
          DA4125D4FE22B7D521974D8238FF00D633CEAC5176F4604820F071401DED15E3
          FA7FEDFBF04F57D3BC1F7967F153C0D796BF102F27D3FC392DBEAD14A9ACCF06
          44E909527708C8C337DD562A09058034E0FF00828EFC05BBF8751F8BADFE2F7C
          3FBAF0CCBAD47E1C8F52B7D6619ADE5D4A45564B456563BA528C1F68C9099638
          504800F6CA2BC37E2BFF00C14CBF67BF819E329BC3BE2EF8D1F0DB41D7AD6630
          5CE9F73AFDB8B8B4901C149503131303D43E0D765E2BFDAAFE19F81BE0DDBFC4
          5D5FC7FE0EB0F00DDF97E4788A5D5A01A5CFE636D4D9701BCB6DCDC0C1393401
          E814578578EBFE0A6FFB3DFC33D43C2B6BAF7C65F879A4CDE36B38B51D17ED1A
          CC2A97D6B2E7CAB90D9DA90B9042C8E5558A9C1383573E34FF00C1453E04FECE
          5F12AD3C1DE3BF8B5E03F0AF89EF7632E9DA8EAD1453C2AE0146941388558105
          5A42A08E4645007B4D15C2FC63FDA6FE1CFECF3E15B5D77C77E3BF08F83F48BE
          CFD96EF58D5A0B38AEFE50D888C8C3CC3820E172706B13F67AFDB83E0FFED617
          7796DF0D7E25F82FC6D7BA7C7E75CDA693AAC571736F1EE0BE63C40EF54DC40D
          C57193D6803D568AA9AAEB365A1C514B7B776B671CF3476D1B4F2AC6B24B2384
          8E3049E59988551D49200E4D721E13FDA7BE1AF8F7E276A5E09D0BE21781F5AF
          19E8C6417FA0D8EBB6B71A9D918D82C825B6473226D62036E51827071401DD51
          5C1FFC3527C32FF85C1FF0AF3FE162F817FE13FCEDFF00846BFB7AD7FB5F3B3C
          CC7D977F9B9D9F3E36FDDE7A735AFF0014BE32F843E06F865B5BF1B78AFC37E0
          FD151C46D7FADEA7069F6C18F45F326655C9F4CD0074B4573FF0D3E2B785FE33
          F84A0D7FC1DE24D07C59A0DD332C3A8E8FA8437F692953860B2C4CC8483C100F
          15CE78FF00F6B9F853F0A3C7D6BE14F14FC4DF87BE1AF145F797F67D1F55F115
          9D9DFCFE61C47B20924591B71E170393D33401E879A01CF4AF3CF8F9AB6ABAE7
          C30F1058F82BC7DE1AF0478A74FB9B385B56D4ADA3D46DF4A669A0768A681A48
          FE69A06D881994E664619E01B9F18BF695F873FB3BC7A7BF8FFC7DE0AF0326AC
          CC9627C41ADDB6982F5971B847E73AEF2372E42E7191EB401DBD15F367EDC1FF
          000510F0EFEC8D79F06D575AF04CD0FC4DF19D86897326A3ACC56E2D7499E1B8
          797528CEEC3471B4712EF3FBBFDE8C91915ECDE16F8F7E05F1D7816FFC53A1F8
          D3C27ACF85F4A328BDD62C757B7B8B0B3F294349E64E8E634D8A4336E2368393
          8A00EB68271D6B8BF83BFB45FC3EFDA26C2F2EFE1FF8EFC1DE39B4D3A458AEA6
          F0FEB36DA9C76CEC32AAED0BB05247201C671577C49F19FC1FE0EF0F43ABEAFE
          2CF0D695A45CDE8D321BDBCD4E082DA5BB329885BAC8CC14CBE62B26C0776E05
          71918A00E9F70F514138EB5E77F0BB5DD47C0BF0EB5ED4FC7BE3DF0CEBD0D86A
          FA94EDABC30C5A6D9E9766B7327976B31F31943DBA0F2DE4620968C9600E6AEF
          C1EFDA57E1CFED0F1DF3F803C7FE0AF1CA696CAB78DE1FD72DB531685B3B449E
          43B6C270719C6706803B7A2BE73FD80FE3B78AFE34EB9F1FA1F13EAA9A947E0A
          F8B5AB78674602DA387EC7A7416B6324507C806FDAD34877B658EEE4F0305007
          E067C3BF0A784FC6FF00F07416BFA5F8D6DF4CBCD1AE7E2CEBC61B5D40E2D2F3
          50592EDF4F8641FC4B25EADB2143C36EDA7209AF8E7C7DF1CFE345D7ED8BA8F8
          C75BD7FC6D6DF1B61D79D67BAF3268758B5D4965319811570F1B238F2C44A005
          002050005AE9FF00E0AB1712597FC150FE3FCD0BBC5345F10F5A747462AC8C2F
          A52083D88EB9AEDED3FE0B7DF1DEDB4C86E5EEBC0579E3AB6B75B383E20DD783
          F4E9BC63142B0F92146A4D1194BF97C79CD99BBEFCF352D81F63FF00C16EBE22
          78866FD95BE2AEAF75796DA678A3C5FF0014FC2BE1EF1C0D26E0795797363E0A
          B59A7D3A468D8ABC56D7D2CC7CB390B2E7F8901AF95BE31FED03E38D73FE0855
          F083C3179E2BD66E7C3E3E256BFA71B07B8631B5B5AD969B35B40DDDA38A5BBB
          8754276A99781F2AEDF9BF5FFDAC3C6DE2AFD9DEE3E186A7A926A3E1BBCF184B
          E3AB896E63F36FEE75596D85B4934970C4BB868C64827963BBAD666B7F1FFC43
          AF7ECFBA0FC31B896CCF85BC39ADDEF882C904004E2EAEE1B78662D27565296D
          1617B1CFAF05C0FA63F6E6D5AEBC71FF0004A9FD8D3C43ACCF36A9AF2AF8C342
          FED2BA632DD369F67A85AFD92D4C87E66860134A234271187217038AFE96BFE0
          965FF28D2FD9FF00FEC9EE85FF00A6F86BF915F1E7ED29E28F893F017C01F0DF
          549EC9FC2FF0D26D4E7D1238ED9639A36D4258E5B9F324EB265E24C67EE8AFEB
          ABFE0963FF0028D1FD9FFF00EC9E685FFA410D34C0FC7CF853F00BC39FF0574F
          F8391FE37E83F1DAEAF356F0FF00C3CFED38348F0F3DEC96D1DE416175159DBD
          B2956574882CAF72CB1152EFB98F0CF9E53F6E9FD817E1AFEC17FF000707FECC
          BE19F86493695E1BF13F88BC35ADCBA1B5E49729A3CCFAC792CB1348CCE12410
          870ACC4862D8C2ED51FA07FF000527FF00837D21FDAD7F6A9B7F8E9F093E28EB
          1F057E28BEC6D46F6CA091E2BD9523112DCC6F14B1496F3794363952CB20032A
          AC5D9FCE7C23FF0006C3EA9A1FED55F0B3E30EAFFB42788BC5DE34F096B563E2
          0F13DFEBBA5BDEDC788AEAD6ED26458A47B8DD046228E3886F3291B7770308A5
          80FCFAFD9EBC6B6BFB5DFF00C141FF00685F88BF167F66CF8A7FB506B69AC3DA
          DAE8BA24B31B5F0C46D71711A4770B1297F922852284676A88A4C866DACBDE7E
          CE5F05BE297ECEBF0B7F6E0D20FC24F8B9F0A3F67DF18FC31D5B58D1F4CF17D9
          CA12C2FE27805B47E7BA2A993CB96E1300976444DE5CC61ABF40FF006BCFF837
          DB56F15FED69ADFC6CFD9D7E367887E0278CFC5AD249E2082CA2964B5BF96560
          F3488D14B1B2091C091E36122349F30D9802BA9F80FF00F0448F15FC3AFD8EBE
          3AF807C5FF00B4178D3E2178BFE3C593DBEA5AC6AF1C93E9DA64A6329F688AD6
          4999DA665215E4328DC9142A15446322407C07FF000412FF008256685F10FF00
          63DBEFDA8BC61AFEBFA86B9E064D5C781F468AEB6E9DA72DAC13334B329059B7
          5C492B0894A27CA59B7F9842F9E7FC1B99FF00049CF0B7EDE5A17893E247C4BF
          13F886D3C1BF0B75D89F48D1B4DBE36B136A2122B89AE66720EC458E3817F77B
          5DBBBA88C06FD97FF827DFFC1346E3F61CFF0082765FFC079BC6A9E249AF63D5
          506B71E97F6410FDB43F22132BEED9BF3CBF3ED581FF00047AFF008248FF00C3
          AD3E0178DBC09A9F8D2DFE215AF8CB563A8C920D20E9C9121B6481A22A669776
          42939C8EBD28480FCC5D4E1F809FF0527F8EBF18BC53F08BF610F889F19B48D4
          359BABAD67C716FE3CB8D0A517330DD24F6768C0C3E6B3933AC2C59CF980BA28
          6D83E5DFD9FBC5FABDD7FC10ABF6AEF075E5C5F0D13C27E38F0B5E69B63743F7
          9633DCDD4F15C647F0B32DB45B80C0DCA4F739FD51F821FF0006ECFC50FD953C
          69E27D0BE147ED65E35F00FC1CF17DF9B9D4343D3F4B51AB2424E36457464291
          5C796153ED51A2B10AA4A10A16B33E18FF00C1B0173F0D7F632F8D5F0862F8D1
          1DD47F16357D175183527F0C90DA647A6CD3C811D3ED3FBD6904C012190294CE
          0E700480F8D3F688FF008247FC1FF00FFC1BA7E14FDA02CECF5A7F8AB3D9E95A
          BDCEAF2EA32C8974977791DB9B43016312C51C728DA5555F744B96209531FC41
          FF00824FFC23B7FF00836FACFF0068C7B6D76EBE2F4B15B6AF2EB72EA533ACC9
          26AAB63F6468198C5E4AC2C0821449BD01DFB7295FACDF17FF00E092377F153F
          E08EDA3FECAA3C7F158DCE97A669BA7B7894E8C64497EC77515C67ECDE702037
          97B7FD664673CF4A8BC53FF0485BAF127FC118ADFF0064B1F10628AE60B0B7B3
          FF00849FFB1B28DE56A4B7D9FB2F9C0E0EDF2FFD6E7F8BDA8B01F99B7BFB4DFC
          1CF177FC130FF62EF863F147E0EF8AFF0068EF8B379637B75E19F0DE9FABCFA5
          C91599D42EEC208E4BA8834A6375B68D5228C118B352C5155437974DF0F2FF00
          F633FF0082D27ECC77FE19F807E2DFD976EFC43E23D32C6EF42BCF141F10596A
          114F7A96B70D6D75CB14782729246588524602E79FD01F1E7FC1B4FAA3FC23F8
          152F827E385FF84BE2F7C0EB0974CB5F1541A3B2C3A8C0D7F737B08F244FBA16
          85AEA540DBDC3A1C32E0F1A37FFF0006F178FBE227ED6BF08FE35FC44FDA6BC4
          1E3FF1B780757B1D57546D4FC3E82DAED2D2F12E62B5B28E39956D2221595B87
          0CEECF8192B4580FA5FF00E0B41E125F1FFEC85A2787CEA3A968FF00DBFF0011
          3C23A77F6869D39B7BDB0F375CB34334128E63954312AE3953CD723FF0542FD8
          BBE187C1BFF826D78DF5CF02F83B41F01788FE13E8AFE20F08EB9E1EB28AC353
          D0EF6D4078E58EE1009097DBB64DCC4C8AEDBB24E6BE90FDADFF0067093F6A1F
          87BA1E851EB23426D1BC57A2789BCF36BF68F3469DA84179E4EDDCB8F33C9D9B
          B276EECE0E3153FED91FB3E3FED61FB2B78FFE1AC7AB8D05FC6FA2DC69035136
          DF69167E6A15F33CBDCBBF19E9B87D6981E27F1BFF00E09C5F06BC25FF0004FE
          F15F8674DF04E8760FA37866EF51B3D752D233AE5B6A515BBCC9AA0BD204C6F4
          4CA25F38BEE2E3938245793F877F683D2FF69FF87FF05615F805A17ED23F1D2D
          7E19687E23D7AF3561A7D969BE158B53B48E4DD3DE5CC7208A6BA92391D60822
          77288CC42260B7DD5F127C00DF107E116BFE151786CDF5CD1EE34AFB508F7F91
          E6C0D1799B33CE376719ED8CD7CB1E02FF0082727C48FD94DBC33AE7C17F88FE
          17B5F12C1E07D0BC17E2CB1F15787E5BBD1BC52DA4DB0B7B4D45041711CF6772
          B19950859248DD19032EE8C3900F9B3C77E3FF001E7EC81FB4478DBC59A1FC0D
          D33F67BD7358F81FE31D5E4D3F47D6ACB56D07C53A968E96B71617296F6A910F
          B5DBF9F286926855A48A7D8376DE3EBFFD903F602F81D6FF00B2A7858B782BC1
          BF108F8C346B6D5F59F12EBDA6C1AC5FF8BEE2EA159A5BEBAB99D5DE7699A467
          CB31501C2A8550A052F879FB0FFC42D33F6ABD07E3AFC49F8A47C6BE26D0FC37
          AA6853F86F47D0458E8705B5C9B69122B081E6924493CC818C92CD24AF3EE897
          F7491AAD7CC7E10F883FB36F84BC25E20D37C2FF00B587C52FD9A7C3570F2CDA
          AFC2ED46FAD343D4BC2B33AEF9AD6C2D750B492F2C8798CEDE5D9BBC7BD9BC9C
          0DB401E5FF001B7E0EF86FE06FECD7FB7B7837C2D7B77AAF86F40F1E7812D6C4
          DEDF3EA1258461F4561A7895C96315A13E446AC498D234427E4CD7D55F1DBE09
          EB5F02BF6CDF897F143C55F0047ED21E08F1F59D89B5BFD361B3D4FC45E0A82D
          2D1607D323D3AF64559AD2597CCB906CC890C93CA248E4211AB86FD9BFFE09D9
          6BFB4BFECAFF001FACBC3565AB7C25F027C67F16E8BA878463D574D965D45F4D
          D24E9E4EA57114EEB3997509ED6E26DD7044C44EB2BEE66C1FA87E257C19FDA2
          740F89DAF6B3F0D7E2FF00836E3C3DE2099664F0FF008EBC2926A09A0B840ADF
          63B9B3B9B690C4C406F2A612608387193401F23FED21E14FD9F3E2E7C27FD94E
          F7E167827C270F8547ED0165A3DDE913787D6D27D167913519350D32E2D2640F
          6A44EA1A4B62AA995460A57613D17ED9F6DE13F0EFEDF7F0F7E0A41F06358F14
          FC28D07C2379F12EFBC13E04D1AC12D3C43AB9BF86CADE6D46D6478229ADEDC0
          7902EE21E6922675611AE3D7F58FF825ADDDFF00ECFF00169EBF10AE25F8B70F
          C438BE2CFF00C26371A52B59CDE238D56205AC16400597D9545B0804BB9630A7
          7971B8ECF8CBF635F8ABF19BC3FE16F16F897E247857C35F1DBC03A95D4FE1BF
          127853C3B3C7A3C5A7DCA42971A5DED8DCDD48D796F3888339F362747585A328
          D16E7480F12F1B59DD78B3F68DF847E32F845FB337C55F84FE38D07C516161AC
          EB12E81A5695A6EA9E19B89562D4ECEFCDBDE912C51C245C45BA391926B68CC6
          1773137FFE094FFB0FF853C7FE1DD77E2578EECEC3C7571A4FC40F165A7802CF
          55B58EE2CBC17A7C7E21BC2CD6B0B2EC5BC9AE925964BA20CA54429B82C6057B
          B7C3FF0081FF00B4278CBE25787B58F8A5F167C2761E1FF0C5C7DAD740F87DA0
          4FA626BF301B57EDF7377717121B75F98FD9E10818B0DCEC1003DEFEC81FB3A3
          FECAFF0005878464D67FB79FFB7359D67ED62D7ECDFF00210D52EAFF00CBD9B9
          BFD5FDA76673F36CCE0670181F117C2BF893E03D1BF66793C15E25F85717C6EF
          1778E3E35F8E6E7C25E0A6B5B591751BAB3D6AFA596F247BB220861811FE795C
          9DA65550ACCC0565FC76D17C6BF0C7E2C7C17F1B1FD95BC39F03B58D27E23681
          A3FF00C25FE0EF14E997709D3B51BF8ACAEEC6FE18ADA096682649F6AA856093
          18E4DC9B486F7D9BFE0983AFF84F44F0F6BBE0BF8931E8BF143C0FE30F13F8A3
          41D5EEF47373A5CB6DAEDEC97377A5DED98994CB030312F9892248AF0AC89B79
          429E3FFD83BE347ED51AD782B56F8B9F177C37663E1F78BF47F15E93A0782BC3
          B2D9E91732D8DE24CED7AF733CB3DC33C41D1155E28E266121599954000BDFF0
          4B2FF9197F6A7FFB2EFAEFFE90E99457ABFECA9FB2BBFECD1A9FC56B97D786B5
          FF000B33C7B7FE3655FB2080E9C2E60B5885B6773799B3ECD9DFF2E77E368C64
          9401FCE07FC1C35FF04EAF1F7ECADFB7A78FFC7777A2EA57FF000F7E25EB536B
          FA5EBF0DBB3DA24D74ED2CB672B8C88E6490C802B105D00619E42FE7EF94FF00
          DC6FCABFB9E9A14B8568E44492371F32B0041FA8AABFF08B699FF40DB0E3FE9D
          D3FC2803F86BF29FFB8DF951E53FF71BF2AFEE53FE117D33FE81D61FF80E9FE1
          47FC22FA67FD03AC3FF01D3FC2803F8ADFD993F652F881FB62FC5BD33C11F0EF
          C33A9F8935FD525588476F0B18AD51980334F2636C512E72CEE42802BFB23FD9
          6FE0AAFECDDFB357C3FF0087A97A7521E07F0ED86826EF695FB49B6B6484C983
          9C06284E32719AEDACB4DB6D3908B7B78200DC911C6141FCAA7A4900514514C0
          28A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002A9DE681
          63A95F5BDD5CD95A5C5CDA12609A4895E4849EEAC4657F0AB945001451450014
          51450014514500146E1EA28A2800A28A2803FFD9}
        mmHeight = 13229
        mmLeft = 529
        mmTop = 529
        mmWidth = 67733
        BandType = 0
      end
      object ppLabel91: TppLabel
        UserName = 'Label13'
        Caption = 'Fecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 170127
        mmTop = 3440
        mmWidth = 7874
        BandType = 0
      end
      object ppLabel92: TppLabel
        UserName = 'Label102'
        Caption = 'Hora'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 170127
        mmTop = 7938
        mmWidth = 6096
        BandType = 0
      end
      object ppLabel93: TppLabel
        UserName = 'Label103'
        Caption = 'P'#225'gina'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 170127
        mmTop = 12435
        mmWidth = 8805
        BandType = 0
      end
      object ppSystemVariable10: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 183357
        mmTop = 3440
        mmWidth = 16140
        BandType = 0
      end
      object ppSystemVariable11: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 183357
        mmTop = 7938
        mmWidth = 16404
        BandType = 0
      end
      object ppSystemVariable12: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 183357
        mmTop = 12435
        mmWidth = 1323
        BandType = 0
      end
      object ppLabel46: TppLabel
        UserName = 'Label17'
        Caption = ': '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 180182
        mmTop = 3440
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel47: TppLabel
        UserName = 'Label18'
        Caption = ': '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 180182
        mmTop = 7938
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel48: TppLabel
        UserName = 'Label19'
        Caption = ': '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 180182
        mmTop = 12435
        mmWidth = 1588
        BandType = 0
      end
    end
    object ppDetailBand8: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText100: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'CIAID'
        DataPipeline = ppdb1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 3260
        mmLeft = 1058
        mmTop = 529
        mmWidth = 3133
        BandType = 4
      end
      object ppDBText101: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'TDIARID'
        DataPipeline = ppdb1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 3260
        mmLeft = 6615
        mmTop = 529
        mmWidth = 3133
        BandType = 4
      end
      object ppDBText102: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'CNTCOMPROB'
        DataPipeline = ppdb1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 3260
        mmLeft = 12171
        mmTop = 529
        mmWidth = 15663
        BandType = 4
      end
      object ppDBText103: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'CUENTAID'
        DataPipeline = ppdb1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 3260
        mmLeft = 102659
        mmTop = 529
        mmWidth = 10964
        BandType = 4
      end
      object ppDBText107: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'CNTDEBEMN'
        DataPipeline = ppdb1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 3175
        mmLeft = 168001
        mmTop = 794
        mmWidth = 7154
        BandType = 4
      end
      object ppDBText108: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'CNTHABEMN'
        DataPipeline = ppdb1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 3260
        mmLeft = 193485
        mmTop = 265
        mmWidth = 7070
        BandType = 4
      end
      object ppDBText109: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = 'AUXID'
        DataPipeline = ppdb1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 3429
        mmLeft = 121444
        mmTop = 529
        mmWidth = 11642
        BandType = 4
      end
      object ppDBText110: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = 'CCOSID'
        DataPipeline = ppdb1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 3683
        mmLeft = 134938
        mmTop = 265
        mmWidth = 11896
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText15'
        DataField = 'CNTGLOSA'
        DataPipeline = ppdb1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 3175
        mmLeft = 29104
        mmTop = 529
        mmWidth = 53181
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText16'
        AutoSize = True
        DataField = 'CNTFEMIS'
        DataPipeline = ppdb1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 3260
        mmLeft = 83079
        mmTop = 529
        mmWidth = 14139
        BandType = 4
      end
    end
    object ppGroup13: TppGroup
      BreakName = 'CIAID'
      DataPipeline = ppdb1
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppdb1'
      object ppGroupHeaderBand13: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand13: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 9790
        mmPrintPosition = 0
        object ppLine81: TppLine
          UserName = 'Line2'
          Weight = 0.750000000000000000
          mmHeight = 1852
          mmLeft = 4498
          mmTop = 1323
          mmWidth = 197909
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc89: TppDBCalc
          UserName = 'DBCalc3'
          AutoSize = True
          DataField = 'CNTDEBEMN'
          DataPipeline = ppdb1
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup13
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdb1'
          mmHeight = 3260
          mmLeft = 147935
          mmTop = 4233
          mmWidth = 27220
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc90: TppDBCalc
          UserName = 'DBCalc4'
          AutoSize = True
          DataField = 'CNTHABEMN'
          DataPipeline = ppdb1
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup13
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdb1'
          mmHeight = 3260
          mmLeft = 173335
          mmTop = 4233
          mmWidth = 27220
          BandType = 5
          GroupNo = 0
        end
        object ppLabel72: TppLabel
          UserName = 'Label1'
          Caption = 'TOTAL POR COMPA'#209'IA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 7673
          mmTop = 4233
          mmWidth = 34131
          BandType = 5
          GroupNo = 0
        end
        object ppDBText112: TppDBText
          UserName = 'DBText13'
          AutoSize = True
          DataField = 'CIAID'
          DataPipeline = ppdb1
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdb1'
          mmHeight = 3175
          mmLeft = 42863
          mmTop = 4498
          mmWidth = 3175
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup14: TppGroup
      BreakName = 'TDIARID'
      DataPipeline = ppdb1
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppdb1'
      object ppGroupHeaderBand14: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand14: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup15: TppGroup
      BreakName = 'CNTCOMPROB'
      DataPipeline = ppdb1
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppdb1'
      object ppGroupHeaderBand15: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand15: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 10583
        mmPrintPosition = 0
        object ppLine82: TppLine
          UserName = 'Line1'
          Weight = 0.750000000000000000
          mmHeight = 2117
          mmLeft = 83608
          mmTop = 1323
          mmWidth = 118798
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc91: TppDBCalc
          UserName = 'DBCalc1'
          AutoSize = True
          DataField = 'CNTDEBEMN'
          DataPipeline = ppdb1
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup15
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdb1'
          mmHeight = 3260
          mmLeft = 147935
          mmTop = 3440
          mmWidth = 27220
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc92: TppDBCalc
          UserName = 'DBCalc2'
          AutoSize = True
          DataField = 'CNTHABEMN'
          DataPipeline = ppdb1
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup15
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdb1'
          mmHeight = 3260
          mmLeft = 173335
          mmTop = 3440
          mmWidth = 27220
          BandType = 5
          GroupNo = 2
        end
        object ppLabel73: TppLabel
          UserName = 'Label2'
          Caption = 'TOTAL POR COMPROBANTE'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 85990
          mmTop = 3175
          mmWidth = 34396
          BandType = 5
          GroupNo = 2
        end
      end
    end
    object ppParameterList3: TppParameterList
    end
  end
  object ppr1: TppReport
    AutoStop = False
    DataPipeline = ppdb1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 10000
    PrinterSetup.mmMarginLeft = 10000
    PrinterSetup.mmMarginRight = 10000
    PrinterSetup.mmMarginTop = 10000
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\SolExes\CreditosConta.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 550
    Top = 119
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdb1'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 29898
      mmPrintPosition = 0
      object ppDBText8: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'CNTANOMM'
        DataPipeline = ppdb1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 4233
        mmLeft = 97631
        mmTop = 15081
        mmWidth = 8890
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label3'
        Caption = 'Perido'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 85461
        mmTop = 15081
        mmWidth = 8890
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label4'
        Caption = 'Reporte Contable'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 80698
        mmTop = 10319
        mmWidth = 31221
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 794
        mmTop = 21696
        mmWidth = 188913
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line4'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 794
        mmTop = 28840
        mmWidth = 188913
        BandType = 0
      end
      object ppLabel63: TppLabel
        UserName = 'Label6'
        Caption = 'Cia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 1323
        mmTop = 23548
        mmWidth = 4445
        BandType = 0
      end
      object ppLabel64: TppLabel
        UserName = 'Label7'
        Caption = 'TD'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 7938
        mmTop = 23548
        mmWidth = 2963
        BandType = 0
      end
      object ppLabel65: TppLabel
        UserName = 'Label8'
        Caption = 'Comprobante'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 14288
        mmTop = 23548
        mmWidth = 16298
        BandType = 0
      end
      object ppLabel66: TppLabel
        UserName = 'Label9'
        Caption = 'Documento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 45508
        mmTop = 23548
        mmWidth = 13335
        BandType = 0
      end
      object ppLabel67: TppLabel
        UserName = 'Label10'
        Caption = 'Cuenta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 95250
        mmTop = 23548
        mmWidth = 8890
        BandType = 0
      end
      object ppLabel68: TppLabel
        UserName = 'Label11'
        Caption = 'Auxiliar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 111390
        mmTop = 23548
        mmWidth = 11853
        BandType = 0
      end
      object ppLabel69: TppLabel
        UserName = 'Label12'
        Caption = 'C.Costo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 125677
        mmTop = 23548
        mmWidth = 10372
        BandType = 0
      end
      object ppLabel70: TppLabel
        UserName = 'Label13'
        Caption = 'Debe'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 153194
        mmTop = 23548
        mmWidth = 5927
        BandType = 0
      end
      object ppLabel71: TppLabel
        UserName = 'Label14'
        Caption = 'Haber'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 177271
        mmTop = 23548
        mmWidth = 7408
        BandType = 0
      end
      object ppImage1: TppImage
        UserName = 'Image1'
        MaintainAspectRatio = False
        ShiftWithParent = True
        Stretch = True
        Picture.Data = {
          0A544A504547496D616765451C0000FFD8FFE000104A46494600010101006000
          600000FFE100164578696600004D4D002A00000008000000000000FFEC001144
          75636B7900010004000000640000FFE10380687474703A2F2F6E732E61646F62
          652E636F6D2F7861702F312E302F003C3F787061636B657420626567696E3D22
          EFBBBF222069643D2257354D304D7043656869487A7265537A4E54637A6B6339
          64223F3E0D0A3C783A786D706D65746120786D6C6E733A783D2261646F62653A
          6E733A6D6574612F2220783A786D70746B3D2241646F626520584D5020436F72
          6520352E332D633031312036362E3134353636312C20323031322F30322F3036
          2D31343A35363A32372020202020202020223E0D0A093C7264663A5244462078
          6D6C6E733A7264663D22687474703A2F2F7777772E77332E6F72672F31393939
          2F30322F32322D7264662D73796E7461782D6E7323223E0D0A09093C7264663A
          4465736372697074696F6E207264663A61626F75743D222220786D6C6E733A78
          6D704D4D3D22687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E
          302F6D6D2F2220786D6C6E733A73745265663D22687474703A2F2F6E732E6164
          6F62652E636F6D2F7861702F312E302F73547970652F5265736F757263655265
          66232220786D6C6E733A786D703D22687474703A2F2F6E732E61646F62652E63
          6F6D2F7861702F312E302F2220786D704D4D3A4F726967696E616C446F63756D
          656E7449443D22786D702E6469643A3838424232313941384536394533313139
          3530364335414333303344354330382220786D704D4D3A446F63756D656E7449
          443D22786D702E6469643A344245303343444136393938313145333832354638
          46314639373642313741362220786D704D4D3A496E7374616E636549443D2278
          6D702E6969643A34424530334344393639393831314533383235463846314639
          373642313741362220786D703A43726561746F72546F6F6C3D2241646F626520
          50686F746F73686F7020435336202857696E646F777329223E0D0A0909093C78
          6D704D4D3A4465726976656446726F6D2073745265663A696E7374616E636549
          443D22786D702E6969643A384642423231394138453639453331313935303643
          3541433330334435433038222073745265663A646F63756D656E7449443D2278
          6D702E6469643A38384242323139413845363945333131393530364335414333
          30334435433038222F3E0D0A09093C2F7264663A4465736372697074696F6E3E
          0D0A093C2F7264663A5244463E0D0A3C2F783A786D706D6574613E0D0A3C3F78
          7061636B657420656E643D2777273F3EFFDB0043000201010201010202020202
          020202030503030303030604040305070607070706070708090B0908080A0807
          070A0D0A0A0B0C0C0C0C07090E0F0D0C0E0B0C0C0CFFDB004301020202030303
          060303060C0807080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC000110800
          2A010403012200021101031101FFC4001F000001050101010101010000000000
          0000000102030405060708090A0BFFC400B51000020103030204030505040400
          00017D01020300041105122131410613516107227114328191A1082342B1C115
          52D1F02433627282090A161718191A25262728292A3435363738393A43444546
          4748494A535455565758595A636465666768696A737475767778797A83848586
          8788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2
          C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5
          F6F7F8F9FAFFC4001F0100030101010101010101010000000000000102030405
          060708090A0BFFC400B511000201020404030407050404000102770001020311
          04052131061241510761711322328108144291A1B1C109233352F0156272D10A
          162434E125F11718191A262728292A35363738393A434445464748494A535455
          565758595A636465666768696A737475767778797A82838485868788898A9293
          9495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8
          C9CAD2D3D4D5D6D7D8D9DAE2E3E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA00
          0C03010002110311003F00F9ABFE0E1FFF0082967C41FDA93F6E5F1EFC396D73
          52D2BE1B7C36D626D02C341B79DA3B6BA9ED98C535DDC2A902691A557D858109
          1ED0A012ECFF009DC667ECCFF9D7D01FF0563FF949E7ED05FF0065075BFF00D2
          D96B4F4AFF00823CFED39AD7C0D1F11ED3E0BF8CE5F0A3DA7DBD26F2231792DB
          1008992CCB7DA9E32A7707588A95F987CBCD4DF503E6CF35F19DEDF9D2F9ADFD
          F7AFB4BF6A2FF82737883E2FFED73E16F017C01F86FA8EAF737BF0D7C31E22BD
          B2D3D99A2864BAD26DA6B8BA9A699F642AF34A725DD53738031902BCCFC3DFF0
          49AFDA3BC53F1FB53F85D65F087C5CDE36D16DD6F2F6CA5863860B6B762C1276
          BA765B7F29CAB849049B1CA90A5882286070DFB277ED8FF11BF623F8B9A778DB
          E1B789B51F0FEB1612A3C91C5337D97518C364C17310216685B1CA37D460E08F
          EC6BF663F8D317ED1FFB38F807E214366DA745E38F0F586BCB68CFBCDAFDA6DD
          26F2F7606EDBBF19C0CE2BF8C5F8E7F00FC67FB32FC4CD4BC1BE3EF0DEADE13F
          13E9440B9D3F5084C52A06195707A3A30C15752558104120D7F5F5FF0004B1FF
          009468FECFFF00F64F342FFD20868881EF545799FED23FB647C2BFD90345B3D4
          3E27F8FF00C2DE08B7D498A598D56F9219AF0A901BCA8FEFC81772EE2AA42E46
          715F9B9FF0516FF82B37C42F0C7FC1537F657F0CFC18F89DA45EFC1CF8B0DA3F
          DB9B4CB5B1D4AD357136B525ADC05B868DDD4F96A10847528C0F46CD55C0FD6F
          A2BCA7F690FDB83E107EC7E2C47C4EF88FE12F04CDA902F696FA9EA0915CDCA0
          382E9172EC80F0582E01EA6B6744FDA8FE1BF897E095C7C4AD3BC79E13D43E1F
          DA4125D4FE22B7D521974D8238FF00D633CEAC5176F4604820F071401DED15E3
          FA7FEDFBF04F57D3BC1F7967F153C0D796BF102F27D3FC392DBEAD14A9ACCF06
          44E909527708C8C337DD562A09058034E0FF00828EFC05BBF8751F8BADFE2F7C
          3FBAF0CCBAD47E1C8F52B7D6619ADE5D4A45564B456563BA528C1F68C9099638
          504800F6CA2BC37E2BFF00C14CBF67BF819E329BC3BE2EF8D1F0DB41D7AD6630
          5CE9F73AFDB8B8B4901C149503131303D43E0D765E2BFDAAFE19F81BE0DDBFC4
          5D5FC7FE0EB0F00DDF97E4788A5D5A01A5CFE636D4D9701BCB6DCDC0C1393401
          E814578578EBFE0A6FFB3DFC33D43C2B6BAF7C65F879A4CDE36B38B51D17ED1A
          CC2A97D6B2E7CAB90D9DA90B9042C8E5558A9C1383573E34FF00C1453E04FECE
          5F12AD3C1DE3BF8B5E03F0AF89EF7632E9DA8EAD1453C2AE0146941388558105
          5A42A08E4645007B4D15C2FC63FDA6FE1CFECF3E15B5D77C77E3BF08F83F48BE
          CFD96EF58D5A0B38AEFE50D888C8C3CC3820E172706B13F67AFDB83E0FFED617
          7796DF0D7E25F82FC6D7BA7C7E75CDA693AAC571736F1EE0BE63C40EF54DC40D
          C57193D6803D568AA9AAEB365A1C514B7B776B671CF3476D1B4F2AC6B24B2384
          8E3049E59988551D49200E4D721E13FDA7BE1AF8F7E276A5E09D0BE21781F5AF
          19E8C6417FA0D8EBB6B71A9D918D82C825B6473226D62036E51827071401DD51
          5C1FFC3527C32FF85C1FF0AF3FE162F817FE13FCEDFF00846BFB7AD7FB5F3B3C
          CC7D977F9B9D9F3E36FDDE7A735AFF0014BE32F843E06F865B5BF1B78AFC37E0
          FD151C46D7FADEA7069F6C18F45F326655C9F4CD0074B4573FF0D3E2B785FE33
          F84A0D7FC1DE24D07C59A0DD332C3A8E8FA8437F692953860B2C4CC8483C100F
          15CE78FF00F6B9F853F0A3C7D6BE14F14FC4DF87BE1AF145F797F67D1F55F115
          9D9DFCFE61C47B20924591B71E170393D33401E879A01CF4AF3CF8F9AB6ABAE7
          C30F1058F82BC7DE1AF0478A74FB9B385B56D4ADA3D46DF4A669A0768A681A48
          FE69A06D881994E664619E01B9F18BF695F873FB3BC7A7BF8FFC7DE0AF0326AC
          CC9627C41ADDB6982F5971B847E73AEF2372E42E7191EB401DBD15F367EDC1FF
          000510F0EFEC8D79F06D575AF04CD0FC4DF19D86897326A3ACC56E2D7499E1B8
          797528CEEC3471B4712EF3FBBFDE8C91915ECDE16F8F7E05F1D7816FFC53A1F8
          D3C27ACF85F4A328BDD62C757B7B8B0B3F294349E64E8E634D8A4336E2368393
          8A00EB68271D6B8BF83BFB45FC3EFDA26C2F2EFE1FF8EFC1DE39B4D3A458AEA6
          F0FEB36DA9C76CEC32AAED0BB05247201C671577C49F19FC1FE0EF0F43ABEAFE
          2CF0D695A45CDE8D321BDBCD4E082DA5BB329885BAC8CC14CBE62B26C0776E05
          71918A00E9F70F514138EB5E77F0BB5DD47C0BF0EB5ED4FC7BE3DF0CEBD0D86A
          FA94EDABC30C5A6D9E9766B7327976B31F31943DBA0F2DE4620968C9600E6AEF
          C1EFDA57E1CFED0F1DF3F803C7FE0AF1CA696CAB78DE1FD72DB531685B3B449E
          43B6C270719C6706803B7A2BE73FD80FE3B78AFE34EB9F1FA1F13EAA9A947E0A
          F8B5AB78674602DA387EC7A7416B6324507C806FDAD34877B658EEE4F0305007
          E067C3BF0A784FC6FF00F07416BFA5F8D6DF4CBCD1AE7E2CEBC61B5D40E2D2F3
          50592EDF4F8641FC4B25EADB2143C36EDA7209AF8E7C7DF1CFE345D7ED8BA8F8
          C75BD7FC6D6DF1B61D79D67BAF3268758B5D4965319811570F1B238F2C44A005
          002050005AE9FF00E0AB1712597FC150FE3FCD0BBC5345F10F5A747462AC8C2F
          A52083D88EB9AEDED3FE0B7DF1DEDB4C86E5EEBC0579E3AB6B75B383E20DD783
          F4E9BC63142B0F92146A4D1194BF97C79CD99BBEFCF352D81F63FF00C16EBE22
          78866FD95BE2AEAF75796DA678A3C5FF0014FC2BE1EF1C0D26E0795797363E0A
          B59A7D3A468D8ABC56D7D2CC7CB390B2E7F8901AF95BE31FED03E38D73FE0855
          F083C3179E2BD66E7C3E3E256BFA71B07B8631B5B5AD969B35B40DDDA38A5BBB
          8754276A99781F2AEDF9BF5FFDAC3C6DE2AFD9DEE3E186A7A926A3E1BBCF184B
          E3AB896E63F36FEE75596D85B4934970C4BB868C64827963BBAD666B7F1FFC43
          AF7ECFBA0FC31B896CCF85BC39ADDEF882C904004E2EAEE1B78662D27565296D
          1617B1CFAF05C0FA63F6E6D5AEBC71FF0004A9FD8D3C43ACCF36A9AF2AF8C342
          FED2BA632DD369F67A85AFD92D4C87E66860134A234271187217038AFE96BFE0
          965FF28D2FD9FF00FEC9EE85FF00A6F86BF915F1E7ED29E28F893F017C01F0DF
          549EC9FC2FF0D26D4E7D1238ED9639A36D4258E5B9F324EB265E24C67EE8AFEB
          ABFE0963FF0028D1FD9FFF00EC9E685FFA410D34C0FC7CF853F00BC39FF0574F
          F8391FE37E83F1DAEAF356F0FF00C3CFED38348F0F3DEC96D1DE416175159DBD
          B2956574882CAF72CB1152EFB98F0CF9E53F6E9FD817E1AFEC17FF000707FECC
          BE19F86493695E1BF13F88BC35ADCBA1B5E49729A3CCFAC792CB1348CCE12410
          870ACC4862D8C2ED51FA07FF000527FF00837D21FDAD7F6A9B7F8E9F093E28EB
          1F057E28BEC6D46F6CA091E2BD9523112DCC6F14B1496F3794363952CB20032A
          AC5D9FCE7C23FF0006C3EA9A1FED55F0B3E30EAFFB42788BC5DE34F096B563E2
          0F13DFEBBA5BDEDC788AEAD6ED26458A47B8DD046228E3886F3291B7770308A5
          80FCFAFD9EBC6B6BFB5DFF00C141FF00685F88BF167F66CF8A7FB506B69AC3DA
          DAE8BA24B31B5F0C46D71711A4770B1297F922852284676A88A4C866DACBDE7E
          CE5F05BE297ECEBF0B7F6E0D20FC24F8B9F0A3F67DF18FC31D5B58D1F4CF17D9
          CA12C2FE27805B47E7BA2A993CB96E1300976444DE5CC61ABF40FF006BCFF837
          DB56F15FED69ADFC6CFD9D7E367887E0278CFC5AD249E2082CA2964B5BF96560
          F3488D14B1B2091C091E36122349F30D9802BA9F80FF00F0448F15FC3AFD8EBE
          3AF807C5FF00B4178D3E2178BFE3C593DBEA5AC6AF1C93E9DA64A6329F688AD6
          4999DA665215E4328DC9142A15446322407C07FF000412FF008256685F10FF00
          63DBEFDA8BC61AFEBFA86B9E064D5C781F468AEB6E9DA72DAC13334B329059B7
          5C492B0894A27CA59B7F9842F9E7FC1B99FF00049CF0B7EDE5A17893E247C4BF
          13F886D3C1BF0B75D89F48D1B4DBE36B136A2122B89AE66720EC458E3817F77B
          5DBBBA88C06FD97FF827DFFC1346E3F61CFF0082765FFC079BC6A9E249AF63D5
          506B71E97F6410FDB43F22132BEED9BF3CBF3ED581FF00047AFF008248FF00C3
          AD3E0178DBC09A9F8D2DFE215AF8CB563A8C920D20E9C9121B6481A22A669776
          42939C8EBD28480FCC5D4E1F809FF0527F8EBF18BC53F08BF610F889F19B48D4
          359BABAD67C716FE3CB8D0A517330DD24F6768C0C3E6B3933AC2C59CF980BA28
          6D83E5DFD9FBC5FABDD7FC10ABF6AEF075E5C5F0D13C27E38F0B5E69B63743F7
          9633DCDD4F15C647F0B32DB45B80C0DCA4F739FD51F821FF0006ECFC50FD953C
          69E27D0BE147ED65E35F00FC1CF17DF9B9D4343D3F4B51AB2424E36457464291
          5C796153ED51A2B10AA4A10A16B33E18FF00C1B0173F0D7F632F8D5F0862F8D1
          1DD47F16357D175183527F0C90DA647A6CD3C811D3ED3FBD6904C012190294CE
          0E700480F8D3F688FF008247FC1FF00FFC1BA7E14FDA02CECF5A7F8AB3D9E95A
          BDCEAF2EA32C8974977791DB9B43016312C51C728DA5555F744B96209531FC41
          FF00824FFC23B7FF00836FACFF0068C7B6D76EBE2F4B15B6AF2EB72EA533ACC9
          26AAB63F6468198C5E4AC2C0821449BD01DFB7295FACDF17FF00E092377F153F
          E08EDA3FECAA3C7F158DCE97A669BA7B7894E8C64497EC77515C67ECDE702037
          97B7FD664673CF4A8BC53FF0485BAF127FC118ADFF0064B1F10628AE60B0B7B3
          FF00849FFB1B28DE56A4B7D9FB2F9C0E0EDF2FFD6E7F8BDA8B01F99B7BFB4DFC
          1CF177FC130FF62EF863F147E0EF8AFF0068EF8B379637B75E19F0DE9FABCFA5
          C91599D42EEC208E4BA8834A6375B68D5228C118B352C5155437974DF0F2FF00
          F633FF0082D27ECC77FE19F807E2DFD976EFC43E23D32C6EF42BCF141F10596A
          114F7A96B70D6D75CB14782729246588524602E79FD01F1E7FC1B4FAA3FC23F8
          152F827E385FF84BE2F7C0EB0974CB5F1541A3B2C3A8C0D7F737B08F244FBA16
          85AEA540DBDC3A1C32E0F1A37FFF0006F178FBE227ED6BF08FE35FC44FDA6BC4
          1E3FF1B780757B1D57546D4FC3E82DAED2D2F12E62B5B28E39956D2221595B87
          0CEECF8192B4580FA5FF00E0B41E125F1FFEC85A2787CEA3A968FF00DBFF0011
          3C23A77F6869D39B7BDB0F375CB34334128E63954312AE3953CD723FF0542FD8
          BBE187C1BFF826D78DF5CF02F83B41F01788FE13E8AFE20F08EB9E1EB28AC353
          D0EF6D4078E58EE1009097DBB64DCC4C8AEDBB24E6BE90FDADFF0067093F6A1F
          87BA1E851EB23426D1BC57A2789BCF36BF68F3469DA84179E4EDDCB8F33C9D9B
          B276EECE0E3153FED91FB3E3FED61FB2B78FFE1AC7AB8D05FC6FA2DC69035136
          DF69167E6A15F33CBDCBBF19E9B87D6981E27F1BFF00E09C5F06BC25FF0004FE
          F15F8674DF04E8760FA37866EF51B3D752D233AE5B6A515BBCC9AA0BD204C6F4
          4CA25F38BEE2E3938245793F877F683D2FF69FF87FF05615F805A17ED23F1D2D
          7E19687E23D7AF3561A7D969BE158B53B48E4DD3DE5CC7208A6BA92391D60822
          77288CC42260B7DD5F127C00DF107E116BFE151786CDF5CD1EE34AFB508F7F91
          E6C0D1799B33CE376719ED8CD7CB1E02FF0082727C48FD94DBC33AE7C17F88FE
          17B5F12C1E07D0BC17E2CB1F15787E5BBD1BC52DA4DB0B7B4D45041711CF6772
          B19950859248DD19032EE8C3900F9B3C77E3FF001E7EC81FB4478DBC59A1FC0D
          D33F67BD7358F81FE31D5E4D3F47D6ACB56D07C53A968E96B71617296F6A910F
          B5DBF9F286926855A48A7D8376DE3EBFFD903F602F81D6FF00B2A7858B782BC1
          BF108F8C346B6D5F59F12EBDA6C1AC5FF8BEE2EA159A5BEBAB99D5DE7699A467
          CB31501C2A8550A052F879FB0FFC42D33F6ABD07E3AFC49F8A47C6BE26D0FC37
          AA6853F86F47D0458E8705B5C9B69122B081E6924493CC818C92CD24AF3EE897
          F7491AAD7CC7E10F883FB36F84BC25E20D37C2FF00B587C52FD9A7C3570F2CDA
          AFC2ED46FAD343D4BC2B33AEF9AD6C2D750B492F2C8798CEDE5D9BBC7BD9BC9C
          0DB401E5FF001B7E0EF86FE06FECD7FB7B7837C2D7B77AAF86F40F1E7812D6C4
          DEDF3EA1258461F4561A7895C96315A13E446AC498D234427E4CD7D55F1DBE09
          EB5F02BF6CDF897F143C55F0047ED21E08F1F59D89B5BFD361B3D4FC45E0A82D
          2D1607D323D3AF64559AD2597CCB906CC890C93CA248E4211AB86FD9BFFE09D9
          6BFB4BFECAFF001FACBC3565AB7C25F027C67F16E8BA878463D574D965D45F4D
          D24E9E4EA57114EEB3997509ED6E26DD7044C44EB2BEE66C1FA87E257C19FDA2
          740F89DAF6B3F0D7E2FF00836E3C3DE2099664F0FF008EBC2926A09A0B840ADF
          63B9B3B9B690C4C406F2A612608387193401F23FED21E14FD9F3E2E7C27FD94E
          F7E167827C270F8547ED0165A3DDE913787D6D27D167913519350D32E2D2640F
          6A44EA1A4B62AA995460A57613D17ED9F6DE13F0EFEDF7F0F7E0A41F06358F14
          FC28D07C2379F12EFBC13E04D1AC12D3C43AB9BF86CADE6D46D6478229ADEDC0
          7902EE21E6922675611AE3D7F58FF825ADDDFF00ECFF00169EBF10AE25F8B70F
          C438BE2CFF00C26371A52B59CDE238D56205AC16400597D9545B0804BB9630A7
          7971B8ECF8CBF635F8ABF19BC3FE16F16F897E247857C35F1DBC03A95D4FE1BF
          127853C3B3C7A3C5A7DCA42971A5DED8DCDD48D796F3888339F362747585A328
          D16E7480F12F1B59DD78B3F68DF847E32F845FB337C55F84FE38D07C516161AC
          EB12E81A5695A6EA9E19B89562D4ECEFCDBDE912C51C245C45BA391926B68CC6
          1773137FFE094FFB0FF853C7FE1DD77E2578EECEC3C7571A4FC40F165A7802CF
          55B58EE2CBC17A7C7E21BC2CD6B0B2EC5BC9AE925964BA20CA54429B82C6057B
          B7C3FF0081FF00B4278CBE25787B58F8A5F167C2761E1FF0C5C7DAD740F87DA0
          4FA626BF301B57EDF7377717121B75F98FD9E10818B0DCEC1003DEFEC81FB3A3
          FECAFF0005878464D67FB79FFB7359D67ED62D7ECDFF00210D52EAFF00CBD9B9
          BFD5FDA76673F36CCE0670181F117C2BF893E03D1BF66793C15E25F85717C6EF
          1778E3E35F8E6E7C25E0A6B5B591751BAB3D6AFA596F247BB220861811FE795C
          9DA65550ACCC0565FC76D17C6BF0C7E2C7C17F1B1FD95BC39F03B58D27E23681
          A3FF00C25FE0EF14E997709D3B51BF8ACAEEC6FE18ADA096682649F6AA856093
          18E4DC9B486F7D9BFE0983AFF84F44F0F6BBE0BF8931E8BF143C0FE30F13F8A3
          41D5EEF47373A5CB6DAEDEC97377A5DED98994CB030312F9892248AF0AC89B79
          429E3FFD83BE347ED51AD782B56F8B9F177C37663E1F78BF47F15E93A0782BC3
          B2D9E91732D8DE24CED7AF733CB3DC33C41D1155E28E266121599954000BDFF0
          4B2FF9197F6A7FFB2EFAEFFE90E99457ABFECA9FB2BBFECD1A9FC56B97D786B5
          FF000B33C7B7FE3655FB2080E9C2E60B5885B6773799B3ECD9DFF2E77E368C64
          9401FCE07FC1C35FF04EAF1F7ECADFB7A78FFC7777A2EA57FF000F7E25EB536B
          FA5EBF0DBB3DA24D74ED2CB672B8C88E6490C802B105D00619E42FE7EF94FF00
          DC6FCABFB9E9A14B8568E44492371F32B0041FA8AABFF08B699FF40DB0E3FE9D
          D3FC2803F86BF29FFB8DF951E53FF71BF2AFEE53FE117D33FE81D61FF80E9FE1
          47FC22FA67FD03AC3FF01D3FC2803F8ADFD993F652F881FB62FC5BD33C11F0EF
          C33A9F8935FD525588476F0B18AD51980334F2636C512E72CEE42802BFB23FD9
          6FE0AAFECDDFB357C3FF0087A97A7521E07F0ED86826EF695FB49B6B6484C983
          9C06284E32719AEDACB4DB6D3908B7B78200DC911C6141FCAA7A4900514514C0
          28A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002A9DE681
          63A95F5BDD5CD95A5C5CDA12609A4895E4849EEAC4657F0AB945001451450014
          51450014514500146E1EA28A2800A28A2803FFD9}
        mmHeight = 13229
        mmLeft = 1588
        mmTop = 794
        mmWidth = 67733
        BandType = 0
      end
      object ppLabel90: TppLabel
        UserName = 'Label104'
        Caption = 'Sistema de Previsi'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 2381
        mmTop = 15610
        mmWidth = 32978
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label5'
        Caption = 'Fecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 158750
        mmTop = 3440
        mmWidth = 7874
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label15'
        Caption = 'Hora'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 158750
        mmTop = 7938
        mmWidth = 6096
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label16'
        Caption = 'P'#225'gina'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 158750
        mmTop = 12435
        mmWidth = 8805
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label17'
        Caption = ': '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 168805
        mmTop = 12435
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label18'
        Caption = ': '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 168805
        mmTop = 7938
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label19'
        Caption = ': '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 168805
        mmTop = 3440
        mmWidth = 1588
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 171980
        mmTop = 3440
        mmWidth = 16140
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 171980
        mmTop = 7938
        mmWidth = 16404
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 171980
        mmTop = 12435
        mmWidth = 1323
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppDBText9: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'CIAID'
        DataPipeline = ppdb1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 3260
        mmLeft = 1588
        mmTop = 444
        mmWidth = 7578
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'TDIARID'
        DataPipeline = ppdb1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 3260
        mmLeft = 7938
        mmTop = 444
        mmWidth = 11345
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'CNTCOMPROB'
        DataPipeline = ppdb1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 3260
        mmLeft = 14552
        mmTop = 444
        mmWidth = 20405
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'CUENTAID'
        DataPipeline = ppdb1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 3260
        mmLeft = 92869
        mmTop = 444
        mmWidth = 14266
        BandType = 4
      end
      object ppDBText104: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'DOCID'
        DataPipeline = ppdb1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 3260
        mmLeft = 37835
        mmTop = 444
        mmWidth = 9102
        BandType = 4
      end
      object ppDBText105: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'CNTSERIE'
        DataPipeline = ppdb1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 3260
        mmLeft = 43656
        mmTop = 444
        mmWidth = 14351
        BandType = 4
      end
      object ppDBText106: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'CNTNODOC'
        DataPipeline = ppdb1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 3260
        mmLeft = 50800
        mmTop = 444
        mmWidth = 16298
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'CNTDEBEMN'
        DataPipeline = ppdb1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 3260
        mmLeft = 145257
        mmTop = 444
        mmWidth = 17907
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'CNTHABEMN'
        DataPipeline = ppdb1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 3260
        mmLeft = 170127
        mmTop = 444
        mmWidth = 17907
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = 'AUXID'
        DataPipeline = ppdb1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 3260
        mmLeft = 111654
        mmTop = 444
        mmWidth = 8594
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = 'CCOSID'
        DataPipeline = ppdb1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 3260
        mmLeft = 125148
        mmTop = 444
        mmWidth = 11007
        BandType = 4
      end
      object ppDBText111: TppDBText
        UserName = 'DBText14'
        DataField = 'CNTFEMIS'
        DataPipeline = ppdb1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 3260
        mmLeft = 73554
        mmTop = 444
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'CIAID'
      DataPipeline = ppdb1
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppdb1'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 10319
        mmPrintPosition = 0
        object ppLine3: TppLine
          UserName = 'Line2'
          Weight = 0.750000000000000000
          mmHeight = 1852
          mmLeft = 794
          mmTop = 1323
          mmWidth = 188913
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          AutoSize = True
          DataField = 'CNTDEBEMN'
          DataPipeline = ppdb1
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdb1'
          mmHeight = 3175
          mmLeft = 135996
          mmTop = 4498
          mmWidth = 27252
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          AutoSize = True
          DataField = 'CNTHABEMN'
          DataPipeline = ppdb1
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdb1'
          mmHeight = 3175
          mmLeft = 160867
          mmTop = 4498
          mmWidth = 27252
          BandType = 5
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'Label1'
          Caption = 'TOTAL S/'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 121444
          mmTop = 4498
          mmWidth = 12435
          BandType = 5
          GroupNo = 0
        end
        object ppDBText17: TppDBText
          UserName = 'DBText13'
          AutoSize = True
          DataField = 'CIAID'
          DataPipeline = ppdb1
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          Visible = False
          DataPipelineName = 'ppdb1'
          mmHeight = 4233
          mmLeft = 53446
          mmTop = 3969
          mmWidth = 2910
          BandType = 5
          GroupNo = 0
        end
        object ppLabel19: TppLabel
          UserName = 'Label20'
          Caption = 'Cantidad de Comprobantes:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3598
          mmLeft = 59520
          mmTop = 3969
          mmWidth = 39963
          BandType = 5
          GroupNo = 0
        end
        object pplTotCom: TppLabel
          UserName = 'Label21'
          Caption = '100'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 102129
          mmTop = 3969
          mmWidth = 7408
          BandType = 5
          GroupNo = 0
        end
        object ppLabel20: TppLabel
          UserName = 'Label201'
          Caption = 'Cantidad de Extornos:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 2910
          mmTop = 3969
          mmWidth = 35190
          BandType = 5
          GroupNo = 0
        end
        object pplTotExt: TppLabel
          UserName = 'Label22'
          Caption = '100'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 40481
          mmTop = 3969
          mmWidth = 7673
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'TDIARID'
      DataPipeline = ppdb1
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppdb1'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'CNTCOMPROB'
      DataPipeline = ppdb1
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppdb1'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7938
        mmPrintPosition = 0
        object ppLine4: TppLine
          UserName = 'Line1'
          Weight = 0.750000000000000000
          mmHeight = 2117
          mmLeft = 80169
          mmTop = 529
          mmWidth = 109538
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc1'
          AutoSize = True
          DataField = 'CNTDEBEMN'
          DataPipeline = ppdb1
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdb1'
          mmHeight = 3260
          mmLeft = 136028
          mmTop = 1852
          mmWidth = 27220
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc2'
          AutoSize = True
          DataField = 'CNTHABEMN'
          DataPipeline = ppdb1
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdb1'
          mmHeight = 3260
          mmLeft = 160899
          mmTop = 1852
          mmWidth = 27220
          BandType = 5
          GroupNo = 2
        end
        object ppLabel13: TppLabel
          UserName = 'Label2'
          Caption = 'TOTAL POR COMPROBANTE'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 82815
          mmTop = 1852
          mmWidth = 31115
          BandType = 5
          GroupNo = 2
        end
      end
    end
    object ppParameterList2: TppParameterList
    end
  end
end
