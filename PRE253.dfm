object FSeguimiento: TFSeguimiento
  Left = 306
  Top = 252
  BorderStyle = bsDialog
  Caption = 'Seguimiento de Expedientes'
  ClientHeight = 217
  ClientWidth = 715
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
    Left = 2
    Top = -1
    Width = 710
    Height = 215
    TabOrder = 0
    object pnlObservacion: TPanel
      Left = 4
      Top = 10
      Width = 701
      Height = 201
      Color = 13165023
      TabOrder = 0
      object Label34: TLabel
        Left = 8
        Top = 3
        Width = 82
        Height = 15
        Caption = 'Observaciones :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object dbgObserv: TwwDBGrid
        Left = 10
        Top = 24
        Width = 679
        Height = 105
        DisableThemesInTitle = False
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Color = clInfoBk
        DataSource = DM1.dsQry20
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        KeyOptions = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clNavy
        TitleFont.Height = -11
        TitleFont.Name = 'Comic Sans MS'
        TitleFont.Style = []
        TitleLines = 2
        TitleButtons = False
        OnDblClick = dbgObservDblClick
      end
      object gbanade: TGroupBox
        Left = 104
        Top = 26
        Width = 460
        Height = 155
        Caption = ' Informaci'#243'n registrada '
        Color = 13165023
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 1
        object Label35: TLabel
          Left = 6
          Top = 18
          Width = 97
          Height = 15
          Caption = 'Fecha de Registro :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label36: TLabel
          Left = 6
          Top = 62
          Width = 71
          Height = 15
          Caption = 'Observaci'#243'n :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label1: TLabel
          Left = 6
          Top = 40
          Width = 110
          Height = 15
          Caption = 'Usuario que Registra:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object dbeObs: TwwDBRichEdit
          Left = 91
          Top = 62
          Width = 363
          Height = 49
          AutoURLDetect = False
          Color = clWhite
          Enabled = False
          MaxLength = 199
          PrintJobName = 'Delphi 7'
          TabOrder = 0
          EditorCaption = 'Edit Rich Text'
          EditorPosition.Left = 0
          EditorPosition.Top = 0
          EditorPosition.Width = 0
          EditorPosition.Height = 0
          MeasurementUnits = muInches
          PrintMargins.Top = 1.000000000000000000
          PrintMargins.Bottom = 1.000000000000000000
          PrintMargins.Left = 1.000000000000000000
          PrintMargins.Right = 1.000000000000000000
          PrintHeader.VertMargin = 0.500000000000000000
          PrintHeader.Font.Charset = DEFAULT_CHARSET
          PrintHeader.Font.Color = clWindowText
          PrintHeader.Font.Height = -11
          PrintHeader.Font.Name = 'MS Sans Serif'
          PrintHeader.Font.Style = []
          PrintFooter.VertMargin = 0.500000000000000000
          PrintFooter.Font.Charset = DEFAULT_CHARSET
          PrintFooter.Font.Color = clWindowText
          PrintFooter.Font.Height = -11
          PrintFooter.Font.Name = 'MS Sans Serif'
          PrintFooter.Font.Style = []
          RichEditVersion = 2
          Data = {
            9B0000007B5C727466315C616E73695C616E7369637067313235325C64656666
            305C6465666C616E67333038327B5C666F6E7474626C7B5C66305C666E696C20
            436F6D69632053616E73204D533B7D7D0D0A7B5C636F6C6F7274626C203B5C72
            6564305C677265656E305C626C75653132383B7D0D0A5C766965776B696E6434
            5C7563315C706172645C6366315C66305C667331365C7061720D0A7D0D0A00}
        end
        object BitBtn1: TBitBtn
          Left = 385
          Top = 118
          Width = 69
          Height = 30
          Caption = 'Cerrar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = BitBtn1Click
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
        object stFecIng: TStaticText
          Left = 120
          Top = 17
          Width = 105
          Height = 17
          AutoSize = False
          BorderStyle = sbsSunken
          Caption = 'stFecIng'
          Color = clWhite
          Enabled = False
          ParentColor = False
          TabOrder = 2
        end
        object stUsuReg: TStaticText
          Left = 120
          Top = 38
          Width = 105
          Height = 17
          AutoSize = False
          BorderStyle = sbsSunken
          Color = clWhite
          Enabled = False
          ParentColor = False
          TabOrder = 3
        end
      end
      object btncerrar: TBitBtn
        Left = 616
        Top = 133
        Width = 73
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
    end
  end
end
